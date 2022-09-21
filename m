Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793307C
	for <linux-coco@lists.linux.dev>; Wed, 21 Sep 2022 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663752980;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=L3WcTfge8AvVvmPJ818150/TqFSrI3lulM/T9iclKlc=;
	b=M238sL228xJYsi6iW/2N0HwI9nMKdJxVm8H7wa3SwpkbJ8JSyAIOBawKZoh9+y98IQANi8
	eV5E60qYWHYrgY7S3c+Ne2E4ofA2Y8KmMnVu1C0OL2XoKjyEKUMtXfOZaUv59RccqjM+XC
	0lpldJ4u5IZQ1Jfj7D/Rs0uR3PsoNa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-vfy9vnMXN8WqjbBdZe7XMA-1; Wed, 21 Sep 2022 05:36:17 -0400
X-MC-Unique: vfy9vnMXN8WqjbBdZe7XMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91247868A2E;
	Wed, 21 Sep 2022 09:36:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F718C42390;
	Wed, 21 Sep 2022 09:36:15 +0000 (UTC)
Date: Wed, 21 Sep 2022 10:36:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev,
	Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
	James Bottomley <jejb@linux.ibm.com>, amd-sev-snp@lists.suse.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Secure vTPMs for confidential VMs
Message-ID: <YyrbDbB1HJ9juGV1@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Sep 20, 2022 at 11:28:15PM +0300, Dov Murik wrote:
> Emulating hardware TPMs has an advantage that guest software already
> uses TPM devices to measure boot sequence components (firmware,
> bootloader, kernel, initrd) and runtime events (IMA in Linux).  We know
> that this currently works with vTPMs backed by the VMM implementation,
> such as QEMU's tpm device which is connected to swtpm running on the
> host.

Leveraging pre-existing support in guest OS feels pretty compelling.
It is apparent that there is alot of maintainer activity across pieces
of the Linux software/distro stack in relation to improving support
for SecureBoot and (v)TPMs in general. Being able to take advantage of
this would be good for confidential computing, by reducing the burden
on software/distro maintainers, and giving users technology that they
are (in theory) at least somewhat familiar with already.

If we can drive the confidential compute specific bits, including
the attestation of the confidential hardware, from the guest firmware,
then it ought to make it easier for guest OS images to be agnostic as
to whether they're running a non-confidential or confidential VM.

It becomes more of a deployment decision for the user of whether to
use a confidential VM or not at any launch attempt. eg they could
have 1 image and run it in a non-confidential VM on their internal
cloud, while using a confidential VM on public cloud when needing
to scale their resources.


This would not be so straightforward with some of the alternative
proposals for confidential VM disk images. For example another
proposal has been to have a bootloader like grub embedded in the
firmware, such that even /boot is encrypted in the disk image and
gets keys provided for unlock prior to the OS being launched.

This would make that disk image inherantly incompatible with use
in non-confidential VM, as well as requiring OS vendors to ship
even more different cloud disk image variants, and support different
boot processes in their software stack.


So overall I'm heavily attracted to re-using existing technology
to the greatest extent that is practical. It makes confidential
computing "normal" and will facilitate its uptake.

> We so far recognized three issues that should be further researched in
> order to implement secure vTPMs for confidential VMs; these are TPM
> provisioning, implementations in TEEs, and guest enlightment.
> 
> * TPM provisioning: The TPM contains sensitive information such as EK
> private key which should not be accessible to the host and to the guest.
> How should such information be delivered to the vTPM when starting a new
> VM?  If we provision encrypted NVDATA, who has the key to decrypt it?
> If we provision it with "classic" TEE secret injection, we need to do it
> quite early in the VM launch sequence (even before the firmware starts?).

For it to be transparent to the guest OS, then the vTPM state would
need to be unlocked prior to the guest OS being launched. This points
towards the confidential VM firmware triggering an initial call to the
attestation service, and receiving a key to unlock the vTPM state
as a response.

It is likely that the guest OS owner would want the option to perform
another attestation later in boot, to validate the broader OS userspace
boot status.  IOW, the firmware initiated attestation handles aspects
specific to bootstrapping the confidential VM environment, while an OS
initiated attestation would handle the generic (pre-existing) use cases
for OS state validation, familiar to anyone already using (v)TPMs.

> One suggestion is to use an ephemeral EK, generated at launch by the
> vTPM.  The system may start to boot using such a TPM, but once we want
> to unseal secrets (for example, to unlock a LUKS partition), we need
> something persistent inside the TPM (or re-seal the key for each TPM).
> Ephemeral TPMs might be a useful first step.

If the motivation for using vTPMs is to take advantage of pre-existing
TPM support in guest OS, then IMHO we should be aiming for the vTPM to
be on a par with a vTPM from a non-confidential VM / bare metal.  An
ephemeral only vTPM would loose some (but not all) of the benefit of
targetting pre-existing TPM support in guests.


> * Implementation in TEEs: SNP introduced VPMLs, and AMD's linux-SVSM
> running in VPML0 can also run vTPM code to handle TPM requests from the
> guest running in VMPL1.  Such a solution is not applicable as-is to
> other TEEs (SEV, TDX).  People suggested running vTPMs in a separate
> confidential VMs, and somehow connect the tenant's guest to the TPM VM;
> but we'll need a way to secure this communication channel.

TDX is obviously an important target, but I'm not sure its worth
worrying too much about SEV/SEV-ES as that generation is inherantly
limited & flawed compared to current SEV-SNP. The ony thing in favour
of SEV/SEV-ES is broader hardware availability today, but that will be
a time limited advantage that's eroded as SEV-SNP deployment expands. 

> * Guest enlightment: Guest software currently interacts with the TPM by
> writing commands to a memory-mapped IO page (GPA 0xfed40000) and reading
> responses from that page.  We want such writes to trigger the code of
> our vTPM (for whatever implementation we choose).  Our current early
> experience with TPM running in linux-SVSM required adding "exit-guest"
> calls after writing commands to the IO page, in order to allow the SVSM
> to run and recognize the incoming command.  Ideally, we'd like a
> solution that doesn't require modifying all the TPM drivers out there
> (in Linux, Windows, OVMF, grub, ...).

As best I could tell looking at the public Ubuntu confidential VM
image published in Azure, there were no modifications to TPM related
pieces of the stack. So theoretically it appears possible to achieve,
but I have no idea how they do so at a technical level.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

