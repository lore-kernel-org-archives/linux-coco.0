Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11C679CF
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673534370;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=vAo5BGfBBHQNg4SAwBs+gFnWeThtjwf2WST9HP4S12g=;
	b=iRh36EFWJpxYrXCVMnn2LBCH1OdRn7waDt1z+N9mQzdPjfjO6AY5HMoTC64puisxGrtYIP
	rOjHW1bgyII02J0BWQ3gKyYc7rizc1WPMoahJyIu9C5nzxlTvb5bCFT1LoDtUmiXj+towr
	JjbLQiHLi7b/xK8WLn40n5fSI6DC4WE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-uxNtam06PBmbD9vyw7TmMg-1; Thu, 12 Jan 2023 09:39:27 -0500
X-MC-Unique: uxNtam06PBmbD9vyw7TmMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C67EE801779;
	Thu, 12 Jan 2023 14:39:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E4021121314;
	Thu, 12 Jan 2023 14:39:26 +0000 (UTC)
Date: Thu, 12 Jan 2023 14:39:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8AbnM0cnKfXXW23@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In the previous discussion about vTPMs and their persistence:

https://lore.kernel.org/linux-coco/4a5bde7e-c473-0fdc-3c3f-e08321e0b911@linux.ibm.com/T/#e92f5ec757664eec5c993d4c5d85b11a13ac59d00

it was suggested we split the work into several distinct pieces

[quote]
  1. Ephemeral vTPM with attestation retrieved from guest
  2. Attestation and injection API from SVSM to host/guest end point
  3. SVSM API for saving TPM state
[/quote]

I've been thinking about items 2 and 3 on that list. Beyond the desire to
support persistence of the vTPM, I think there are other use cases that would
benefit from early attestation. The overarching appealing aspect though is
that we can largely isolate the guest OS userspace from having to know / do
anything about SEV-SNP. This is a benefit because the more we can make a guest
OS work just like it would on any other (non-confidential) VM / bare metal,
the less burden there is for the guest owner and guest OS vendor alike. Every
time there is a different code path / action sequence required for CVMs, we
increase the testing burden and knowledge burden. Infrequently used code paths
are invariably more likely to bitrot.

If the guest OS can unlock its disk secrets from a persistent vTPM without
having todo any attestation from the initrd, this simplifies the early boot
process for the guest. Especially not having to bring up networking at this
point in boot is a win, as that would add many failure scenarios, and we're
limited in per-VM configuration options until after the guest's root disk is
unlocked too.

Aside from a desire to persist vTPM, it would also be desirable to support
persistence of OVMF NVRAM variables. Traditional VMs have the split CODE.fd /
VARS.fd arrangement where VARS.fd is writable per-VM, but we don't use that
with confidential VMs as it wouldn't be covered by the SEV launch measurements.
This is a difference from non-CVM environments and there could be use cases
where OVMF NVRAM persistence is useful to support.

Lets assume as a starting point that the guest owner has designated an
attestation server for their CVM, and pre-loaded it with a set of secrets to
be released upon successful attestation of their CVM The attestation server
could be run by the cloud provider, or run by the guest owner themselves,
whichever suits their confidentiality needs best.


Just as we don't want to deal with the complexity of networking in the initrd,
we also don't want that in SVSM. Instead it is desirable to rely on the host
OS to act as a proxy between the attestation server and SVSM, while maintaining
confidentiality against this intentional MITM. A plain old serial UART can be
exposed to the guest OS for communication with the host attestation proxy.

The sequence of operations/communications would follow:

 1. Guest owner designates an attestation server to use with the CVM
    and provides its address and a public key associated with the attestation
    server to the hypervisor

 2. Hypervisor injects the attestation server public key to the CVM

 3. SVSM generates a public/private key pair using a public key algorithm to
    be specified

 4. SVSM requests an attestation report from SEV-SNP firmware, embedding a
    hash of the attestation server public key and its own public key.

 5. SVSM transmits the attestation report and the two public keys on the ISA
    serial port

 6. Host attestation proxy receives the attestation report and public key
    on QEMU serial port backend

 7. Host attestation proxy makes a HTTPS request to the designated attestation
    server associated with the CVM instance

 8. Remote attestation server validates the attestation report which
    establishes that

     * SVSM is running in a SEV-SNP VM
     * The hash of the public keys comes from SVSM

 8. Remote attestation server extracts the public keys hash from the
    validated attestation report
 
 9. Remote attestation server validates the two public keys which
    establishes that

      * SVSM has a valid public key for the attestation server
      * It can encrypt data to send back to SVSM

 10. Remote attestation server acquires secrets to be released to the CVM,
     encrypts them with SVSM’s public key, and signs them with its own
     private key

 11. Remote attestation server sends the HTTPS reply with the encrypted
     secrets as payload

 12. Host attestation proxy receives the HTTPS reply from the attestation
     server and transmits the payload on the QEMU serial port backend

 13. SVSM receives the attestation result payload from the ISA serial port

 14. SVSM verifies the signature of the attestation server which
     establishes that:

       * The data came from an attestation server associated
         with the public key is holds
       * Establishes that the data has not been tampered with
         in transit from the attestation server

 15. SVSM decrypts the secrets received using its private key

Use of a plain UART is suggested primarily for simplicity. The amount of
data to be transferred is just a few 10's of KB, so a high data rate channel
is not required. Further SVSM would block between steps 5 and 13 while waiting
for the attestation response, before launching the guest firmware. The serial
port would not be used again once the guest firmware is launched. Using
virtio-serial or similar feels like overkill, extra code complexity for little
obvious benefit. We could designate any of the traditional COM1/COM2/COM3/COM4
ioports, or designate a new IO port specifically for this purpose but still use
the simple UART protocol

It is suggested that the secrets released from the attestation server be
structured using the EFI secret table defined previously for SEV/SEV-ES
in

   https://github.com/torvalds/linux/blob/master/drivers/virt/coco/efi_secret/efi_secret.c

Thus when SVSM decrypts the secrets it can place them into guest RAM in the
address specified by OVMF, such that they are accessible by the efi_secret.ko
guest driver (or equivalent for non-Linux).

This on its own would allow for booting of encrypted root disks from the
initrd, without even needing any vTPM integration. For example, systemd
crypttab supports pointing to a plain file to acquire the LUKS passphrase
and can thus be pointed to the efi_secret file in sysfs.

This mechanism could also be used for injecting a host identity such as an
SSH server keypair. Injecting the SSH identity is a way to mitigate the main
risk in the above communications handshake where the malicious host proxy
doesn't talk to the user's attestation server, and just replies with a bunch
of secrets of its own choosing. If it did this the SSH identity would not
match what the guest owner expects and thus it could tell the VM is not
trustworthy on first use. Equivalently a HTTP server cert would serve much
the same purpose if the CVM were exposing an HTTP service.

This can also be used as a way to supply data for systemd credentials
(https://systemd.io/CREDENTIALS/), as a confidential alternative to SMBIOS OEM
strings or fw_cfg which are used in non-CVMs. It is important to be able to
get these injected at the start of boot, as various systemd startup units
can be influenced by this data. This avoids having to integrate support for
CVM attestation servers directly with systemd.


In addition to placing the secrets into guest RAM, however, SVSM can
designate certain secret UUIDs for its own usage, and extract those before
puitting the remaining secret table entries into guest RAM. One UUID could
identify a key to use for encrypting/decrypting the vTPM persistent state.
Another UUID could identify a key to use for encrypting / decrypting OVMF
NVRAM variable state.

In terms of how we actually provide vTPM / OVMF NVRAM state, it looks quite
straightforward to just use the existing pflash support in QEMU. On first
boot of the CVM, SVSM would have to initialize the pflash using the
designate encryption key, erasing any data the hypervisor may be exposed.
Either expose 2 pflash devices, one of vTPM and one for OVMF NVRAM, or just
split the 1 pflash into two parts.

With such a setup, the vTPM would by default be fully ephemeral. Only if the
attestation server provided a vTPM encryption secret, would the pflash be
used to persistent the vTPM state.

For the OVMF NVRAM persistent, SVSM would have to expose a service to
OVMF for the storage of NVRAM keys. I've not considered in any detail.

Even if SVSM does an attestation to acquire secrets and inject them into
the guest, the guest owner can repeat the attestation at any time when the
guest OS is running, even in early boot if so desired. The SVSM initiated
attestation provides a good default out of the box experiance though,
avoiding the need to make most guest OS images aware of fact that they're
running inside a CVM, and allows easy portability to other execution
environments for the VM image.

The scope of changes to SVSM to achieve the above looks fairly small. 
RSA key gen, some encrypt/decrypt ops, and expand the serial port impl
to support reading data.

There would be minimal (if any) change to QEMU, we just need to provide
the attestation server public key in some manner, perhaps fwcfg/SMBIOS,
since it doesn't need to be confidential.

We would need to write an attestation server proxy to run on the host,
connected to QEMU's serial port backend. This is likely the largest
amount of new code, and would need to know how to talk to any of the
various attestation server impls that are relevant.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

