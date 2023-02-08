Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A157B6AAD
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675879367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e0LLxloTGcQYsQXrPcewSAimWN5otqrDAlCg4Fi2+Lc=;
	b=OSKMSMNnQ+HUaMl9+NNcF2gbju194P6Hh1Gv0x3EIATVvqAizKQljgAvj6DHuexS6tqoJr
	qpwsm6gN191xyG183WNekdGxCj0zGIGhJlOJo9X2pPX/JUpe2mCeMxXbicSfeX3Cddi/9I
	Xgm6ysDn6aUgyzNnKzVdMabHmT5+OR8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-yqSQlH27O9GPswDCI45sFg-1; Wed, 08 Feb 2023 13:02:44 -0500
X-MC-Unique: yqSQlH27O9GPswDCI45sFg-1
Received: by mail-wr1-f71.google.com with SMTP id b9-20020adfc749000000b002c3dede475cso2231212wrh.6
        for <linux-coco@lists.linux.dev>; Wed, 08 Feb 2023 10:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0LLxloTGcQYsQXrPcewSAimWN5otqrDAlCg4Fi2+Lc=;
        b=eTGMnE14dgFgOFDMi3Jqxb3M0+VC1b3QYbB2ZNNU3TJ7yRsoXcMf6CPM/DsdF3501S
         Ev+aghbmfRoLg6L8vw66zenB0N09kOX6R5pswaWVZpnjpi+7Lf8OPUPzQtRcSz1Puaz7
         k3wc2LSqnxs3DS5QJNt3Cvqw0d8aZI5lRUx8a7Q9yckuKjjGPc+jlLY4sj2l7hCnb9yB
         W5ZKhhC7UvuBhiw6W4Sjhg9brpC+RkVb2fvxdvNgvMGeD9LIODa+yY/ECgY/WjzTTi/H
         bKe054+xnhnpN2eTj13jWAkzqtnO42lE/V6QBYEH7EIiH+WrDSx7lXPXsPjyXQnvlIEn
         vunA==
X-Gm-Message-State: AO0yUKV3VHXCQPvW7zw+fqif+pQj9MhfhEGfBzxgYJxKlc03cMKs2YHX
	ko9HBtrdBMovyxBhFmANUb6/0N6dU34gHL8rfCbpvvbep7yuAmoC+yb0N8GjMP0hFbnzW5ZDUzs
	78j487adbT6ooZqFvJkHAJw==
X-Received: by 2002:a05:600c:3420:b0:3dc:4548:abe6 with SMTP id y32-20020a05600c342000b003dc4548abe6mr7378402wmp.12.1675879362657;
        Wed, 08 Feb 2023 10:02:42 -0800 (PST)
X-Google-Smtp-Source: AK7set/+84lky0rDdgPqGXC9RmmGB+bGfZx/9Lnyp5QjpyxHUb0E7utouVFRkJBwvEquSJR7O2f1QA==
X-Received: by 2002:a05:600c:3420:b0:3dc:4548:abe6 with SMTP id y32-20020a05600c342000b003dc4548abe6mr7378358wmp.12.1675879362384;
        Wed, 08 Feb 2023 10:02:42 -0800 (PST)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id j40-20020a05600c1c2800b003dc4480df80sm3035820wms.34.2023.02.08.10.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:02:41 -0800 (PST)
Date: Wed, 8 Feb 2023 18:02:39 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christophe de Dinechin <dinechin@redhat.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Carlos Bilbao <carlos.bilbao@amd.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Wunner, Lukas" <lukas.wunner@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
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
Message-ID: <Y+Pjv8CeDiLRxqP/@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
 <Y+MAPHZNLeBY13Pj@mit.edu>
 <20230208041913-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750D93CD9481F6AB78F1FB4E7D89@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y+OAZTljX1I6ZvR/@kroah.com>
 <m2edr03xh4.fsf@redhat.com>
 <Y+Pb4Ood56Wxn4sj@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+Pb4Ood56Wxn4sj@kroah.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Greg Kroah-Hartman (gregkh@linuxfoundation.org) wrote:
> On Wed, Feb 08, 2023 at 05:19:37PM +0100, Christophe de Dinechin wrote:
> > 
> > On 2023-02-08 at 11:58 +01, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote...
> > > On Wed, Feb 08, 2023 at 10:44:25AM +0000, Reshetova, Elena wrote:
> > >>
> > >> The CC threat model does change the traditional linux trust boundary regardless of
> > >> what mitigations are used (kernel config vs. runtime filtering). Because for the
> > >> drivers that CoCo guest happens to need, there is no way to fix this problem by
> > >> either of these mechanisms (we cannot disable the code that we need), unless somebody
> > >> writes a totally new set of coco specific drivers (who needs another set of
> > >> CoCo specific virtio drivers in the kernel?).
> > >
> > > It sounds like you want such a set of drivers, why not just write them?
> > > We have zillions of drivers already, it's not hard to write new ones, as
> > > it really sounds like that's exactly what you want to have happen here
> > > in the end as you don't trust the existing set of drivers you are using
> > > for some reason.
> > 
> > In the CC approach, the hypervisor is considered as hostile. The rest of the
> > system is not changed much. If we pass-through some existing NIC, we'd
> > rather use the existing driver for that NIC rather than reinvent
> > it.
> 
> But that is not what was proposed.  I thought this was all about virtio.
> If not, again, someone needs to write a solid definition.

As I said in my reply to you a couple of weeks ago:

  I'm not sure the request here isn't really to make sure *all* PCI devices
  are safe; just the ones we care about in a CoCo guest (e.g. the virtual devices) -
  and potentially ones that people will want to pass-through (which
  generally needs a lot more work to make safe).
  (I've not looked at these Intel tools to see what they cover)

so *mostly* virtio, and just a few of the other devices.

> So if you want to use existing drivers, wonderful, please work on making
> the needed changes to meet your goals to all of them.  I was trying to
> give you a simple way out :)
> 
> > >> 1. these selective CoCo guest required drivers (small set) needs to be hardened
> > >>  (or whatever word people prefer to use here), which only means that in
> > >> the presence of malicious host/hypervisor that can manipulate pci config space,
> > >> port IO and MMIO, these drivers should not expose CC guest memory
> > >> confidentiality or integrity (including via privilege escalation into CC guest).
> > >
> > > Again, stop it please with the "hardened" nonsense, that means nothing.
> > > Either the driver has bugs, or it doesn't.  I welcome you to prove it
> > > doesn't :)
> > 
> > In a non-CC scenario, a driver is correct if, among other things, it does
> > not leak kernel data to user space. However, it assumes that PCI devices are
> > working correctly and according to spec.
> 
> And you also assume that your CPU is working properly.

We require the CPU to give us a signed attestation to prove that it's a
trusted CPU, that someone external can validate.  So, not quite
'assume'.

>  And what spec
> exactly are you referring to?  How can you validate any of that without
> using the PCI authentication protocol already discussed in this thread?

The PCI auth protocol looks promising and is possibly the right long
term answer.   But for a pass through NIC for example, all we'd want is
that (with the help of the IOMMU) it can't get or corrupt any data the
guest doesn't give it - and then it's upto the guest to run encryption
over the protocols over the NIC.

> 
> > >> Please note that this only applies to a small set (in tdx virtio setup we have less
> > >> than 10 of them) of drivers and does not present invasive changes to the kernel
> > >> code. There is also an additional core pci/msi code that is involved with discovery
> > >> and configuration of these drivers, this code also falls into the category we need to
> > >> make robust.
> > >
> > > Again, why wouldn't we all want "robust" drivers?  This is not anything
> > > new here,
> > 
> > What is new is that CC requires driver to be "robust" against a new kind of
> > attack "from below" (i.e. from the [virtual] hardware side).
> 
> And as I have said multiple times, that is a totally new "requirement"
> and one that Linux does not meet in any way at this point in time.

Yes, that's a fair statement.

> If
> you somehow feel this is a change that is ok to make for Linux, you will
> need to do a lot of work to make this happen.
> 
> Anyway, you all are just spinning in circles now.  I'll just mute this
> thread until I see an actual code change as it seems to be full of
> people not actually sending anything we can actually do anything with.

I think the challenge will be to come up with non-intrusive, minimal
changes;  obviously you don't want stuff shutgunned everywhere.

Dave

> greg k-h
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

