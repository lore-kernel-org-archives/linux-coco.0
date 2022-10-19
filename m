Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4E7E
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 08:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666166904;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT2RUS++9+g6B5dEx7OyBLKke//PvVNhc4F8YyVczmo=;
	b=gu0aw6CeNPVrEVOriO/BK/TnelkBIYNxESn2XhqFlleF4tGKZ68GCmlHEnu3HX4rGRLV1w
	XD2+uY+LOZw83u7nTnZKNiZjcKW+bY8xiDEHamvbYismjFAOdAkozmwLEujOjNHCP7xZIH
	dNtOkbGOgtQMRLmmKH/b0cihkwVF3Xs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-LqX5FGTRPuWjtXbTLqnwxw-1; Wed, 19 Oct 2022 04:08:21 -0400
X-MC-Unique: LqX5FGTRPuWjtXbTLqnwxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D3B6101B44C;
	Wed, 19 Oct 2022 08:08:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC3DA90A11;
	Wed, 19 Oct 2022 08:08:19 +0000 (UTC)
Date: Wed, 19 Oct 2022 09:08:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <cdupontd@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, jejb@linux.ibm.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: SVSM vTPM specification
Message-ID: <Y0+wcWgcRFTiDTNk@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 19, 2022 at 07:47:41AM +0200, Christophe de Dinechin wrote:
> 
> 
> > On 18 Oct 2022, at 22:22, Dov Murik <dovmurik@linux.ibm.com> wrote:
> > 
> > 
> > 
> > On 13/10/2022 18:30, James Bottomley wrote:
> >> On Thu, 2022-10-13 at 10:14 -0500, Tom Lendacky wrote:
> >>> On 10/12/22 13:44, James Bottomley wrote:
> >>>> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
> >>>>> I think one of the vTPMs keys should be in the SNP attestation
> >>>>> report (the EK???) - I think that would allow you to attest that
> >>>>> the vTPM you're talking to is a vTPM running in an SNP protected
> >>>>> firmware.
> >>>> 
> >>>> Traditionally the TPM identity is the public EK, so that should
> >>>> definitely be in the report.  Ideally, I think the public storage
> >>>> root key (key derived from the owner seed) should be in there two
> >>>> because it makes it easy to create keys that can only be read by
> >>>> the TPM (keys should be in the owner hierarchy which means they
> >>>> have to be encrypted to the storage seed, so we need to know what a
> >>>> public key corresponding to it is).
> >>>> 
> >>>> One wrinkle of the above is that, when provisioned, the TPM will
> >>>> only have the seeds, not the keys (the keys are derived from the
> >>>> seeds via a TPM2_CreatePrimary command).  The current TPM
> >>>> provisioning guidance:
> >>>> 
> >>>> https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
> >>>> 
> >>>> Says that the EK should be at permanent handle
> >>>> 
> >>>> 81010001
> >>>> 
> >>>> And there's an update saying that should be the RSA-2048 key and
> >>>> there should be an EC (NIST-P256) one at 81010002.  The
> >>>> corresponding storage keys should be at 81000001 and 81000002
> >>>> respectively.  I think when the SVSM provisions the TPM, it should
> >>>> run TPM2_CreatePrimary for those four keys and put them into the
> >>>> persistent indexes, then insert the EC keys only for EK and SRK
> >>>> into the attestation report.
> >>> 
> >>> We only have 512 bits to work with for the SVSM-provided data, so
> >>> would hashes of the keys be ok?
> >> 
> >> Well, if you put the hashes in, the consuming entity would then have to
> >> find out via an additional channel what the actual keys were because
> >> you can't reverse the hash (it's possible, just more effort).  If you
> >> use point compression, an EC key (for the NIST p-256 curve) is only 32
> >> bytes anyway, so it's the same size as a sha256 hash, so I'd say place
> >> the actual public keys into the report to give complete and usable
> >> information
> >> 
> > 
> > Do we need to leave room for a Guest-Owner-provided nonce?  Guest owner
> > will provide it to the guest OS which will provide it to the SVSM to be
> > included in REPORT_DATA of the VMPL0 attestation report.
> > 
> I think it’s a good idea, but I’m not clear on which component in the
> guest would be responsible for that exchange.
> 
> You need a functioning networking stack, and you need a way to know what
> attestation server to talk to.
> 
> IIUC, at this stage, we have no valid storage yet, since that would
> require having received the response from the attestation server.
> So the only storage we have is host storage managed by the hypervisor,
> plus whatever fits in your SVSM-provided data.
> 
> Can we send this data without additional encryption since it’s already
> cyphertext? Or do we want additional mechanisms, and if so, what root
> certificates do we use? Where do we get them from without guest storage?
> 
> Do we rely on guest networking being up at that point? Or do we need
> to provide additional mechanisms in the hypervisor to perform this
> initial exchange on behalf of the guest?

I'd be inclined to not rely on guest networking, and probably even
strictly decouple what the SVSM does to communicate, from any specific
attestation server connection protocol or details.

Implementing a network stack in SVSM looks like a very large piece of
work. It is conceivable that the guest network device is connected to
an entirely private network that can only communicate with other VMs
belonging to that guest owner. IOW, we can't assume the guest NIC has
the ability to route to the attestation server. I don't think we want
to be adding a 2nd NIC just for firmware phase attestation either.

Further if SVSM uses networking, and talks directly to the remote
attestation service, we can expect that attestation server will be
using normal best practice and exposing its service over TLS with
x509 server certs to be validated. That brings even more software
complexity into the SVSM. It would need to be told what attestation
server URL to use, though that is likely the easiest bit of the
problem since fw_cfg can supply that. If any aspect of the
attestation service protocol ever needs to change, then we also
need to update SVSM to match.


AFAICS, what SVSM needs to do for attestation is very straightforward.
It sends a blob of data, and then blocks further execution until it
gets another blob of data back in response.

From the POV of SVSM, conceptually this does not even need connection
based semantics in its communication method. So while we could use
virtio-vsock instead of a NIC, even that could be considered overkill.
An even simpler option to implement could be merely virtio-serial.
There's a possible question of whether we want a mechanism that is
cleanly separated from any device intended for guest OS usage. That
might motivate doing something separate from any existing virtual
device, that is dedicated just to SVSM attestation needs.

Whatever comms mechanism is exposed to the SVSM for early attestation
I think should only communicate with the hypervisor. A proxy on the
hypervisor would be responsible for receiving the attestation report
from SVSM, and opening up a connection to whatever attestation server
is required, getting the response and feeding it back to SVSM. We
thus rely entirely on existing hypervisor network stack, and all
knowledge about the attestation server is isolated from SVSM.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

