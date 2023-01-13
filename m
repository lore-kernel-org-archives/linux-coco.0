Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4952AD4A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 18:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673634518;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KvddESD6cDs+8cVGcFJrnEjCNb1QpWKjMJbT565meGU=;
	b=ea5E7gnJg7pSbQpPgonAvCiZdVDfQvfl+X0WPmyBlJr6nHrnRhHsn5/Gy8fWBbEtuzyp2r
	Gc0IkenrqXI/on/AsCse0mV+bvFyxAk+6PweXhUUXx2jyDSQHCRDwLV68Fytg22i9N8h/2
	MfnkKp8iZkK702zjC0cxyqh2jkcozkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-n21O_gjxO9GDtfc04hobjA-1; Fri, 13 Jan 2023 13:28:35 -0500
X-MC-Unique: n21O_gjxO9GDtfc04hobjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 226662A5956D;
	Fri, 13 Jan 2023 18:28:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.108])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D4C2166B26;
	Fri, 13 Jan 2023 18:28:34 +0000 (UTC)
Date: Fri, 13 Jan 2023 18:28:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: linux-coco@lists.linux.dev, amd-sev-snp@lists.suse.com
Subject: Re: SVSM initiated early attestation / guest secrets injection
Message-ID: <Y8Gi0KLj5JbhCqBE@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <Y8AbnM0cnKfXXW23@redhat.com>
 <Y8GTXpfqlOe53cEr@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y8GTXpfqlOe53cEr@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jan 13, 2023 at 06:22:38PM +0100, Jörg Rödel wrote:
> Hi Daniel,
> 
> On Thu, Jan 12, 2023 at 02:39:24PM +0000, Daniel P. Berrangé wrote:
> >  4. SVSM requests an attestation report from SEV-SNP firmware, embedding a
> >     hash of the attestation server public key and its own public key.
> > 
> >  5. SVSM transmits the attestation report and the two public keys on the ISA
> >     serial port
> 
> This basically emulates the secret injection mechanism that was
> implemented for SEV and SEV-ES by the firmware, right?
> 
> I see a problem here which allows a potential host owner to steal
> the secrets from the attestation server. Maybe I am wrong, but I think
> the following is possible with the above sequence:
> 
> 	1. Host owner sets up a CVM like the guest owner would do, with
> 	   the same SVSM and Firmware binaries, same initial state and
> 	   so on, so that the initial measurement is the same as if the
> 	   VM was setup by the guest owner.
> 
> 	2. Host owner attaches a different disk image with malicious
> 	   content, e.g. a boot loader that sends the secrets to the host
> 	   owner.
> 
> 	3. SVSM and attestation server have no way of detecting this,
> 	   because the disk image is not part of the initial measurement
> 	   from the SNP firmware. So above sequence would complete and
> 	   SVSM gets the secrets from the attestation server.
> 
> 	4. The malicious software loaded from the disk image gets access
> 	   to the secrets and sends them to the host owner.
> 
> 	4. Host owner can use the guest owners secrets to steal data
> 	   from the encrypted disk image the guest owner provided.
> 
> To prevent this it is necessary that the measurement sent to the
> attestation server includes all software and data which is
> executed/loaded from unencrypted storage. For example, in a common boot
> flow it needs to include the Grub binary and Grub configuration.
> 
> But these parts are not included in the initial measurement that the
> SVSM gets from the SNP firmware.

Aside from what James' says, one option is to lockdown the OVMF and
secureboot chain. eg OVMF built with SecureBoot=on, and instead of
having the generic Microsoft keys enrolled, have a distro specific
key enrolled. That distro key would have to be one that is only
used for signing UKIs (Unified Kernel Images), and the initrd embedded
in the UKI would need to be designed abort if it finds the disk is
not encrypted.

The main challenge here is that you don't have a single OVMF anymore.
You have many OVMFs, one for each distinct set of distro SecureBoot
keys, and the attestation server has to decide which one it wants
based on the distro the VM is expected to use.

If we don't do any of this, then the early attestation and secret
fetch would have to be limited to /only/ the secret for unlocking
the vTPM state, and not injected into the guest OS. The OS would
have to do everything else with the vTPM and PCR sealed data to
achieve the same end results of only getting access to secrets if
the vTPM sees the set of PCR values corresponding to the desired
UKI secureboot keys.

Ultimately the latter is probably the more common case and more
flexible.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

