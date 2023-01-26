Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E83110F
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674730138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eiMNk9k1N4YdRqn/UAZCbRr/7MVZcTlwG/ktRA0Tof8=;
	b=NmkkXAeUDLtzXQmu3ntoMk0cKF42ISmgZIh9aW1IX5ghY+2MVmbj+RehW4vHk5Skr25qtZ
	E8cWq00/p7Dbmo8bhEGV9DMx19G2uN+WaV/kwnWGGQZqKvH/ZuzOUKSQIW9p4z9LBCTsYY
	m5M2QsdWY9k5kVXRZjTR17kzOagFHSA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-113-j6cw0SxKM4qSXMWZmwF9gg-1; Thu, 26 Jan 2023 05:48:54 -0500
X-MC-Unique: j6cw0SxKM4qSXMWZmwF9gg-1
Received: by mail-wr1-f69.google.com with SMTP id l8-20020adfc788000000b002bdfe72089cso212446wrg.21
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 02:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiMNk9k1N4YdRqn/UAZCbRr/7MVZcTlwG/ktRA0Tof8=;
        b=ph7hlMEsGOoEfHBbxYj9VarKU6xt2amKMGqwg8DWYq3ViXY5yvDCiqY8GT6DXKHn2n
         EXv3v1qc2cyBAiQir5Y7blTsUu1S/Gd7lImaePDLiNHpY1UvTMrmsISMNOs45lIafM/Y
         1j5bmQels1AXfoxUHxY+c9lkMOjy2g4XB/yDq5vu4moErw0X9DgK0tZ/7EN0N4lPuQhM
         8rpMPGWJkl2HAlm0R2hkfP0dh7vESmw2/ReiFMrJV5rzWwcUjpvHB1HWLUFQs55vG24w
         XEUQ0aLOJAIPircLpoOR5KD3MSMY7hM5BqhhlNLdG3Hv2e1vYNxSreaX0XKMVt3twG+c
         dcHw==
X-Gm-Message-State: AFqh2krEC9EhRNdsi51lBZEy8L7AG+CI0+y030PSWbHwqnvr2FbAyZu8
	9o+e2/6+JD8K2FBtPMI0dBDpb+Rqh4yCrRas5nTwWMmKd6TNO0qxiCpvRZPOdCcLqDjjxq9s5r3
	3s0NL71zNga+o6GPw2Z5qcw==
X-Received: by 2002:a05:600c:4f45:b0:3cf:68d3:3047 with SMTP id m5-20020a05600c4f4500b003cf68d33047mr35060541wmq.41.1674730133836;
        Thu, 26 Jan 2023 02:48:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtf8Lf9xM1JYsHez9AX5rRzGIxFUUdD0MkWNZ3BH56Iis9kY3O8+Z7Z8QktN/BOvRVvUUIvIg==
X-Received: by 2002:a05:600c:4f45:b0:3cf:68d3:3047 with SMTP id m5-20020a05600c4f4500b003cf68d33047mr35060518wmq.41.1674730133632;
        Thu, 26 Jan 2023 02:48:53 -0800 (PST)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id s15-20020a05600c384f00b003d9de0c39fasm5167009wmr.36.2023.01.26.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:48:53 -0800 (PST)
Date: Thu, 26 Jan 2023 10:48:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pci@vger.kernel.org
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <Y9Jakvab14K61b2t@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <20230125215333.GA18160@wunner.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230125215333.GA18160@wunner.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Lukas Wunner (lukas@wunner.de) wrote:
> [cc += Jonathan Cameron, linux-pci]
> 
> On Wed, Jan 25, 2023 at 02:57:40PM +0000, Dr. David Alan Gilbert wrote:
> > Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> > > Great, so why not have hardware attestation also for your devices you
> > > wish to talk to?  Why not use that as well?  Then you don't have to
> > > worry about anything in the guest.
> > 
> > There were some talks at Plumbers where PCIe is working on adding that;
> > it's not there yet though.  I think that's PCIe 'Integrity and Data
> > Encryption' (IDE - sigh), and PCIe 'Security Prtocol and Data Model' -
> > SPDM.   I don't know much of the detail of those, just that they're far
> > enough off that people aren't depending on them yet.
> 
> CMA/SPDM (PCIe r6.0 sec 6.31) is in active development on this branch:
>
> https://github.com/l1k/linux/commits/doe

Thanks for the pointer - I'll go and hunt down that spec.

> It will allow for authentication of PCIe devices.  Goal is to submit
> this quarter (Q1).  Afterwards we'll look into retrieving measurements
> via CMA/SPDM and bringing up IDE encryption.
> 
> It's a kernel-native implementation which uses the existing crypto and
> keys infrastructure and is wired into the appropriate places in the
> PCI core to authenticate devices on enumeration and reauthenticate
> when CMA/SPDM state is lost (after resume from D3cold, after a
> Secondary Bus Reset and after a DPC-induced Hot Reset).
> 
> The device authentication service afforded here is generic.
> It is up to users and vendors to decide how to employ it,
> be it for "confidential computing" or something else.

As Samuel asks about who is doing the challenge; but I guess there are
also things like what happens when the host controls intermediate
switches and BAR access and when only VFs are passed to guests.

> Trusted root certificates to validate device certificates can be
> installed into a kernel keyring using the familiar keyctl(1) utility,
> but platform-specific roots of trust (such as a HSM) could be
> supported as well.
> 
> I would like to stress that this particular effort is a collaboration
> of multiple vendors.  It is decidedly not a single vendor trying to
> shoehorn something into upstream, so the criticism that has been
> leveled upthread against other things does not apply here.
> 
> The Plumbers BoF you're referring to was co-authored by Jonathan Cameron
> and me and its purpose was precisely to have an open discussion and
> align on an approach that works for everyone:
> 
> https://lpc.events/event/16/contributions/1304/
> 
> 
> >    a) there's no good way to authenticate a PCI device yet
> >      - any nasty device can claim to have a given PCI ID.
> 
> CMA/SPDM prescribes that the Subject Alternative Name of the device
> certificate contains the Vendor ID, Device ID, Subsystem Vendor ID,
> Subsystem ID, Class Code, Revision and Serial Number (PCIe r6.0
> sec 6.31.3).
> 
> Thus a forged Device ID in the Configuration Space Header will result
> in authentication failure.

Good!  It'll be nice when people figure out the CoCo integration for
that; I'm still guessing it's a little way off until we get hardware
for that.

Dave

> Thanks,
> 
> Lukas
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

