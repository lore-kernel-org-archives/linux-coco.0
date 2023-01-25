Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE2257A
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674654181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jyHVz+apvxD940T6vNOC948hL1wBas7wK5Wun7TXh8=;
	b=QgVrXebAXVBi0ZCdEVBr9bR5pJpoj2s5SqpH+lqc1+3o7inF5z+0OtnfZgmbvOsxdvHWDS
	di4yr64n7kJNn6NbJukH9NsJSQC9VOPnBD3O8ejqfOOlg2HmhHqQH21+839AlceddZ/6/m
	VWrVX2eKktv6x2TSBcFQnoT2Sm5T53I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-I65ctnfjPh6lTx678ZDs4A-1; Wed, 25 Jan 2023 08:42:58 -0500
X-MC-Unique: I65ctnfjPh6lTx678ZDs4A-1
Received: by mail-wm1-f72.google.com with SMTP id z11-20020a1c4c0b000000b003db062505b9so555810wmf.4
        for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 05:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jyHVz+apvxD940T6vNOC948hL1wBas7wK5Wun7TXh8=;
        b=uJL3iFsbQG164yMY1yh+TK6S1K0lHkmPsEB+lWxuotBJML5mXG57ovf5h4saI497Bp
         Htne5IWDrhMtHvSrzlfOwBZondS7eoaEpxGWJTQ7oomBQYasc8VUuHGzXFWcrG1Fv646
         UIWw3wrdn8QHF08lNG9HIMOTzAhp87nvaNrdqOrmNuogZeC7i088TkeBI3coo+ExnTH2
         UcPCqU+TW0crvjrzHQyZWAX8rUzyoFI9tQBILVGySGDE5vDc25n3HLjYUk9XekgJLj/3
         rE4rKyEEauUiKFWU2URaGegGA4MRZMiIonVP6zth/GTRPUaX+8gRLpWID9oy6mMFOQPT
         hxIQ==
X-Gm-Message-State: AO0yUKU7yTnTzpYhZ15psOJQLKuNa1znzXZ/MJnbtJTLOaxJyrlmV+Wn
	f02eg1A/3eMTfls/bFUUogvpjqMt7blJROYb8ba48/FaqkPSrDcCBwickPZe8J/oo/e6WCSnIZ/
	GT4z2YlWooxUxhUXMMHbY8Q==
X-Received: by 2002:a5d:658f:0:b0:2bf:bac7:30d4 with SMTP id q15-20020a5d658f000000b002bfbac730d4mr1818149wru.53.1674654177248;
        Wed, 25 Jan 2023 05:42:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/OfwwsHPo3vHGMlgOSN9WmtZU+WfZPlDAdUQaDBYWnA8HMRvMZbwkf9t3BCQs1NJIZ0yjNxw==
X-Received: by 2002:a5d:658f:0:b0:2bf:bac7:30d4 with SMTP id q15-20020a5d658f000000b002bfbac730d4mr1818126wru.53.1674654176879;
        Wed, 25 Jan 2023 05:42:56 -0800 (PST)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id z2-20020adfec82000000b002bfbe30e8f8sm863956wrn.98.2023.01.25.05.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:42:56 -0800 (PST)
Date: Wed, 25 Jan 2023 13:42:53 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Reshetova, Elena" <elena.reshetova@intel.com>,
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
Message-ID: <Y9Ex3ZUIFxwOBg1n@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y9EkCvAfNXnJ+ATo@kroah.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> On Wed, Jan 25, 2023 at 12:28:13PM +0000, Reshetova, Elena wrote:
> > Hi Greg, 
> > 
> > You mentioned couple of times (last time in this recent thread:
> > https://lore.kernel.org/all/Y80WtujnO7kfduAZ@kroah.com/) that we ought to start
> > discussing the updated threat model for kernel, so this email is a start in this direction. 
> 
> Any specific reason you didn't cc: the linux-hardening mailing list?
> This seems to be in their area as well, right?
> 
> > As we have shared before in various lkml threads/conference presentations
> > ([1], [2], [3] and many others), for the Confidential Computing guest kernel, we have a 
> > change in the threat model where guest kernel doesn’t anymore trust the hypervisor. 
> 
> That is, frankly, a very funny threat model.  How realistic is it really
> given all of the other ways that a hypervisor can mess with a guest?

It's what a lot of people would like; in the early attempts it was easy
to defeat, but in TDX and SEV-SNP the hypervisor has a lot less that it
can mess with - remember that not just the memory is encrypted, so is
the register state, and the guest gets to see changes to mapping and a
lot of control over interrupt injection etc.

> So what do you actually trust here?  The CPU?  A device?  Nothing?

We trust the actual physical CPU, provided that it can prove that it's a
real CPU with the CoCo hardware enabled.  Both the SNP and TDX hardware
can perform an attestation signed by the CPU to prove to someone
external that the guest is running on a real trusted CPU.

Note that the trust is limited:
  a) We don't trust that we can make forward progress - if something
does something bad it's OK for the guest to stop.
  b) We don't trust devices, and we don't trust them by having the guest
do normal encryption; e.g. just LUKS on the disk and normal encrypted
networking. [There's a lot of schemes people are working on about how
the guest gets the keys etc for that)

> > This is a big change in the threat model and requires both careful assessment of the 
> > new (hypervisor <-> guest kernel) attack surface, as well as careful design of mitigations
> > and security validation techniques. This is the activity that we have started back at Intel
> > and the current status can be found in
> > 
> > 1) Threat model and potential mitigations: 
> > https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html
> 
> So you trust all of qemu but not Linux?  Or am I misreading that
> diagram?

You're misreading it; This is about the grey part (i.e. the guest) not
trusting the host (the white part including qemu and the host kernel).

> > 2) One of the described in the above doc mitigations is "hardening of the enabled
> > code". What we mean by this, as well as techniques that are being used are
> > described in this document: 
> > https://intel.github.io/ccc-linux-guest-hardening-docs/tdx-guest-hardening.html
> 
> I hate the term "hardening".  Please just say it for what it really is,
> "fixing bugs to handle broken hardware".  We've done that for years when
> dealing with PCI and USB and even CPUs doing things that they shouldn't
> be doing.  How is this any different in the end?
> 
> So what you also are saying here now is "we do not trust any PCI
> devices", so please just say that (why do you trust USB devices?)  If
> that is something that you all think that Linux should support, then
> let's go from there.

I don't think generally all PCI device drivers guard against all the
nasty things that a broken implementation of their hardware can do.
The USB devices are probably a bit better, because they actually worry
about people walking up with a nasty HID device;  I'm skeptical that
a kernel would survive a purposely broken USB controller.

I'm not sure the request here isn't really to make sure *all* PCI devices
are safe; just the ones we care about in a CoCo guest (e.g. the virtual devices) -
and potentially ones that people will want to pass-through (which
generally needs a lot more work to make safe).
(I've not looked at these Intel tools to see what they cover)

Having said that, how happy are you with Thunderbolt PCI devices being
plugged into your laptop or into the hotplug NVMe slot on a server?
We're now in the position we were with random USB devices years ago.

Also we would want to make sure that any config data that the hypervisor
can pass to the guest is validated.

> > 3) All the tools are open-source and everyone can start using them right away even
> > without any special HW (readme has description of what is needed).
> > Tools and documentation is here:
> > https://github.com/intel/ccc-linux-guest-hardening
> 
> Again, as our documentation states, when you submit patches based on
> these tools, you HAVE TO document that.  Otherwise we think you all are
> crazy and will get your patches rejected.  You all know this, why ignore
> it?
> 
> > 4) all not yet upstreamed linux patches (that we are slowly submitting) can be found 
> > here: https://github.com/intel/tdx/commits/guest-next
> 
> Random github trees of kernel patches are just that, sorry.
> 
> > So, my main question before we start to argue about the threat model, mitigations, etc,
> > is what is the good way to get this reviewed to make sure everyone is aligned?
> > There are a lot of angles and details, so what is the most efficient method? 
> > Should I split the threat model from https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html
> > into logical pieces and start submitting it to mailing list for discussion one by one? 
> 
> Yes, start out by laying out what you feel the actual problem is, what
> you feel should be done for it, and the patches you have proposed to
> implement this, for each and every logical piece.
> 
> Again, nothing new here, that's how Linux is developed, again, you all
> know this, it's not anything I should have to say.

That seems harsh.
The problem seems reasonably well understood within the CoCo world - how
far people want to push it probably varies; but it's good to make the
problem more widely understood.

> > Any other methods? 
> > 
> > The original plan we had in mind is to start discussing the relevant pieces when submitting the code,
> > i.e. when submitting the device filter patches, we will include problem statement, threat model link, 
> > data, alternatives considered, etc. 
> 
> As always, we can't do anything without actual working changes to the
> code, otherwise it's just a pipe dream and we can't waste our time on it
> (neither would you want us to).
> 
> thanks, and good luck!
> 
> greg k-h

Dave

> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

