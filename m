Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919E246B5
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674660546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fRCiLRdneBPyIkrvbI4baasI0smwzLWL7OfELwvnIk8=;
	b=SWW7f05oyCL0VEPO2ghCeScG1dFKCc3QalOSGRTeMPT32li/5EbA9aaS7PxoUMC4GHw6Ju
	CqM8V7RLUTGyjWLn5TM//W+Bmsiv0cAiPndCibc1uBRAuhezfcHNqO1kuwC1dp1dPMfVOn
	p+g3+CghGbm9B2hO/23WF/tu4Pgf29U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-eyxS9tp_OmmpBH_3S7o3ig-1; Wed, 25 Jan 2023 10:29:05 -0500
X-MC-Unique: eyxS9tp_OmmpBH_3S7o3ig-1
Received: by mail-wr1-f69.google.com with SMTP id o15-20020a5d684f000000b002be540246e1so2734158wrw.22
        for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 07:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRCiLRdneBPyIkrvbI4baasI0smwzLWL7OfELwvnIk8=;
        b=m9Rf8hanshCvMqQmyi5gmO44o895CPb7So3ydhSRPW8IXNnBnJTfos0wf0DAiN4BmX
         dm5ppKj+XJgnDuJx0DtUiqXb3W9stUTME8IUTVhz2FgSj+Os3+PB5E5TRifsuG1bxy/C
         a5C9stqTsh9143VYYDzL3DU8A4QPDWsPCUyJZcDbFvvZwx4MjFSLGE5gl+X0RgX/AhWH
         jliihedY9Pvpaq6zAyQkjjMza7eMr4wrtjoirUZDzFC4Hv6DlIUWHhEdyACxHUXkBEyb
         0IMuR4K0ncl6m7Sipnbz6C9Ylt+hAzitqNpu0eyUWXCQo21IdpLLubDQOnUJP5wIY+em
         HPgA==
X-Gm-Message-State: AFqh2kpwZ3Wt5bzhRpxvVR4GQkhR360Mm8M/BMLntBS4PG3MSID8LBbh
	Zo7F5hEN84LUmkgXwK6V8PZvUm8q9Eb8fr1/1SAw/B7JzOAQ+CLxzwQPJ/+HeMKlfZH4jhT2vK1
	QdXKtWzlp6974ZiVMSBndDA==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr32579871wmn.9.1674660543964;
        Wed, 25 Jan 2023 07:29:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZBYCFSrUe78yGSsNUU0iGKqLYv5QAnF8wkN1Cr3k2ZykigrRpMAE1TBT00xxPuSXYYVYUWQ==
X-Received: by 2002:a05:600c:43d3:b0:3da:fbcd:cdd2 with SMTP id f19-20020a05600c43d300b003dafbcdcdd2mr32579844wmn.9.1674660543744;
        Wed, 25 Jan 2023 07:29:03 -0800 (PST)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm2605382wml.9.2023.01.25.07.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 07:29:03 -0800 (PST)
Date: Wed, 25 Jan 2023 15:29:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Wunner, Lukas" <lukas.wunner@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Poimboe, Josh" <jpoimboe@redhat.com>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>,
	"jbachmann@google.com" <jbachmann@google.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	James Morris <jmorris@namei.org>,
	Michael Kelley <mikelley@microsoft.com>,
	"Lange, Jon" <jlange@microsoft.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <Y9FKvOYlOv3I24yD@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E5Cg7mreDx737N@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y9E5Cg7mreDx737N@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Jan 25, 2023 at 01:42:53PM +0000, Dr. David Alan Gilbert wrote:
> > * Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> > > On Wed, Jan 25, 2023 at 12:28:13PM +0000, Reshetova, Elena wrote:
> > > > Hi Greg, 
> > > > 
> > > > You mentioned couple of times (last time in this recent thread:
> > > > https://lore.kernel.org/all/Y80WtujnO7kfduAZ@kroah.com/) that we ought to start
> > > > discussing the updated threat model for kernel, so this email is a start in this direction. 
> > > 
> > > Any specific reason you didn't cc: the linux-hardening mailing list?
> > > This seems to be in their area as well, right?
> > > 
> > > > As we have shared before in various lkml threads/conference presentations
> > > > ([1], [2], [3] and many others), for the Confidential Computing guest kernel, we have a 
> > > > change in the threat model where guest kernel doesn’t anymore trust the hypervisor. 
> > > 
> > > That is, frankly, a very funny threat model.  How realistic is it really
> > > given all of the other ways that a hypervisor can mess with a guest?
> > 
> > It's what a lot of people would like; in the early attempts it was easy
> > to defeat, but in TDX and SEV-SNP the hypervisor has a lot less that it
> > can mess with - remember that not just the memory is encrypted, so is
> > the register state, and the guest gets to see changes to mapping and a
> > lot of control over interrupt injection etc.
> > 
> > > So what do you actually trust here?  The CPU?  A device?  Nothing?
> > 
> > We trust the actual physical CPU, provided that it can prove that it's a
> > real CPU with the CoCo hardware enabled.  Both the SNP and TDX hardware
> > can perform an attestation signed by the CPU to prove to someone
> > external that the guest is running on a real trusted CPU.
> > 
> > Note that the trust is limited:
> >   a) We don't trust that we can make forward progress - if something
> > does something bad it's OK for the guest to stop.
> >   b) We don't trust devices, and we don't trust them by having the guest
> > do normal encryption; e.g. just LUKS on the disk and normal encrypted
> > networking. [There's a lot of schemes people are working on about how
> > the guest gets the keys etc for that)
> 
> I think we need to more precisely say what we mean by 'trust' as it
> can have quite a broad interpretation.
> 
> As a baseline requirement, in the context of confidential computing the
> guest would not trust the hypervisor with data that needs to remain
> confidential, but would generally still expect it to provide a faithful
> implementation of a given device.
> 
> IOW, the guest would expect the implementation of virtio-blk devices to
> be functionally correct per the virtio-blk specification, but would not
> trust the host to protect confidentiality any stored data in the disk.
> 
> Any virtual device exposed to the guest that can transfer potentially
> sensitive data needs to have some form of guest controlled encryption
> applied. For disks this is easy with FDE like LUKS, for NICs this is
> already best practice for services by using TLS. Other devices may not
> have good existing options for applying encryption.
> 
> If the guest has a virtual keyboard, mouse and graphical display, which
> is backed by a VNC/RDP server in the host, then all that is visible to the
> host. There's no pre-existing solutions I know can could offer easy
> confidentiality for basic console I/O from the start of guest firmware
> onwards. The best is to spawn a VNC/RDP server in the guest at some
> point during boot. Means you can't login to the guest in single user
> mode with your root password though, without compromising it.
> 
> The problem also applies for common solutions today where the host passes
> in config data to the guest, for consumption by tools like cloud-init.
> This is used in the past to inject an SSH key for example, or set the
> guest root password. Such data received from the host can no longer be
> trusted, as the host can see the data, or subsitute its own SSH key(s)
> in order to gain access. Cloud-init needs to get its config data from
> a trusted source, likely an external attestation server
> 
> 
> A further challenge surrounds handling of undesirable devices. A goal
> of OS development has been to ensure that both coldplugged and hotplugged
> devices "just work" out of the box with zero guest admin config required.
> To some extent this is contrary to what a confidential guest will want.
> It doesn't want a getty spawned on any console exposed, it doesn't want
> to use a virtio-rng exposed by the host which could be feeding non-random.
> 
> 
> Protecting against malicious implementations of devices is conceivably
> interesting, as a hardening task. A malicious host may try to take
> advantage of the guest OS device driver impl to exploit the guest OS
> kernel with an end goal of getting into a state where it can be made
> to reveal confidential data that was otherwise protected.

I think this is really what the Intel stuff is trying to protect
against.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

