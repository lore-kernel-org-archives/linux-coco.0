Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C812560
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675862163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANxKGUHxNkdFDDGu4Qxah7XgMeL7yrVgcXhPrJpPIhk=;
	b=H4a1/MRzp9nHxmOzt4WvBZD6WREJXBkyRbon+Fk4RXWnGYTLHZPA1/sf65GjvHM69BIy+H
	lvJpBJ8gSLy/943BzMnsj9PYCgP2kIPOw6vKQ1mQc8is2ahgd7e9fxA6IF+Xd2+cqhIlY2
	ow2UOMmm5cOdYUKaV2415yl046xy1Wk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-L47p1E_aPOq3eeAChGej-w-1; Wed, 08 Feb 2023 08:16:01 -0500
X-MC-Unique: L47p1E_aPOq3eeAChGej-w-1
Received: by mail-ej1-f72.google.com with SMTP id wz4-20020a170906fe4400b0084c7e7eb6d0so13221505ejb.19
        for <linux-coco@lists.linux.dev>; Wed, 08 Feb 2023 05:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANxKGUHxNkdFDDGu4Qxah7XgMeL7yrVgcXhPrJpPIhk=;
        b=sT1a9WQRyqY7WNtUZRVsc/tyISr6SEhratzAp/ECX17Gixd5qyoFryLxlJKecr8cAi
         D0wcjdikr64SPckMXuVgS2v2NZlk1tmbSSdw0iuozKz1tcU5vCDCfonDjcpKtjM9jcOD
         wLcXmGNHT87hw+YADmVC36YpZgEGA67mYyDymSlXr6u1NrEIlEQvzju5xaM7Is5FZLQO
         ew1Eo2Zeu+WBDdgGLAbheGQlovxnO0dEsGofsMZvvfOsFV5W4+ZYnNL2d+BExs8vxNK1
         xQYe0+AXlH8VMoHqPFzvOS1Y4E+96hYdlZ/+PWehF7tyh77jrkuQvEBGDGlduxPZyglg
         o5ng==
X-Gm-Message-State: AO0yUKXgvte9ooM3lDkXSu0wYrsv0LMbhHk1Dk3Rm1P9pKL0n/LWFhAL
	hgI8iC1PjO3PriU1AL3FDi9jpPJ958iQ3OmR2K8PHMJEkV0zYeiuM9aJDPnx86hoqrxmgJIGkhS
	Bf3oCwN3T5Vts9/X4f8GIJQ==
X-Received: by 2002:a50:9b43:0:b0:4a2:1812:e062 with SMTP id a3-20020a509b43000000b004a21812e062mr8567083edj.18.1675862160418;
        Wed, 08 Feb 2023 05:16:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/GQNHbqVkMPaw7jFTQpVA3MniL2vYO43AOpxYwu5eKEiswCaySQWYnKQFoOsZKQr8Al+WAxA==
X-Received: by 2002:a50:9b43:0:b0:4a2:1812:e062 with SMTP id a3-20020a509b43000000b004a21812e062mr8567068edj.18.1675862160215;
        Wed, 08 Feb 2023 05:16:00 -0800 (PST)
Received: from redhat.com ([2.52.132.212])
        by smtp.gmail.com with ESMTPSA id dm1-20020a05640222c100b004a21d03155bsm7831174edb.88.2023.02.08.05.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 05:15:59 -0800 (PST)
Date: Wed, 8 Feb 2023 08:15:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20230208080259-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
 <BN0PR11MB5758C701F81E701851ECA729E7D89@BN0PR11MB5758.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <BN0PR11MB5758C701F81E701851ECA729E7D89@BN0PR11MB5758.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 08, 2023 at 10:16:14AM +0000, Reshetova, Elena wrote:
> > No relation other than it would be nice to have a solution that does not
> >require kernel command line and that prevents __init()s.
> 
> For __inits see below. For the command line, it is pretty straightforward to 
> measure it and attest its integrity later: we need to do it for other parts
> anyhow as acpi tables, etc. So I don’t see why we need to do smth special
> about it? In any case it is indeed very different from driver discussion and
> goes into "what should be covered by attestation for CC guest" topic. 
> 
> > More pressing concern than wasted memory, which may be unimportant, there's
> > the issue of what are those driver init functions doing. For example, as
> > part of device setup, MMIO regs may be involved, which we cannot trust. It's
> > a lot more code to worry about from a CoCo perspective.
> 
> Yes, we have seen such cases in kernel where drivers or modules would access
> MMIO or pci config space already in their __init() functions. 
> Some concrete examples from modules and drivers (there are more):
> 
>  intel_iommu_init() -> init_dmars() -> check_tylersburg_isoch()

An iommu driver.  So maybe you want to use virtio iommu then?

> skx_init() -> get_all_munits()
> skx_init() -> skx_register_mci() -> skx_get_dimm_config()

A memory controller driver, right? And you need it in a VM? why?

> intel_rng_mod_init() -> intel_init_hw_struct()

And virtio iommu?

> i10nm_exit()->enable_retry_rd_err_log ->__enable_retry_rd_err_log()

Another memory controller driver? Can we decide on a single one?

> However, this is how we address this from security point of view:
> 
> 1. In order for a MMIO read to obtain data from a untrusted host, the memory
> range must be shared with the host to begin with. We enforce that
> all MMIO mappings are private by default to the CC guest unless it is 
> explicitly shared (and we do automatically share for the authorized devices
> and their drivers from the allow list). This removes a problem of an 
> "unexpected MMIO region interaction"
> (modulo acpi AML operation regions that we do have to share also unfortunately,
> but acpi is a whole different difficult case on its own).

How does it remove the problem? You basically get trash from host, no?
But it seems that whether said trash is exploitable will really depend
on how it's used, e.g. if it's an 8 bit value host can just scan all
options in a couple of hundred attempts. What did I miss?


> 2. For pci config space, we limit any interaction with pci config
> space only to authorized devices and their drivers (that are in the allow list).
> As a result device drivers outside of the allow list are not able to access pci
> config space even in their __init routines. It is done by setting the
> to_pci_dev(dev)->error_state = pci_channel_io_perm_failure for non-authorized
> devices. 

This seems to be assuming drivers check return code from pci config
space accesses, right?  I doubt all drivers do though. Even if they do
that's unlikely to be a well tested path, right?

>  So, even if host made the driver __init function to run
> (by faking the device on the host side), it should not be able to supply any
> malicious data to it via MMIO or pci config space, so running their __init 
> routines should be ok from security point of view or does anyone see any
> holes here? 
> 
> Best Regards,
> Elena.

See above.  I am not sure the argument that the bugs are unexploitable
sits well with the idea that all this effort is improving code quality.

-- 
MST

