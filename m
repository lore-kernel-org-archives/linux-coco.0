Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449FA47
	for <linux-coco@lists.linux.dev>; Sat,  9 Apr 2022 19:40:08 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id a30so15424409ljq.13
        for <linux-coco@lists.linux.dev>; Sat, 09 Apr 2022 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LRK5NCYhQ3Fmmdu1Nq/r6lgNA/het1WCzf4tV6aXNNc=;
        b=rlKEJbZpAwy8y3TZiwpi3c3SwsbVjgoFxEqjcACdj/mOh4cfZri7DmsaMJPvpV0cio
         QpRL1BHjj6CXRt2yW94jjtWHvG5uoCoPWnaiixTb9kDlKgeglHpMB9P8jPSj0116hqSH
         zjZVGR5j13019vnHrS7oOeLOdeD6WLovtUdXUPySrb8s5/iL987igaUaowCX+zP/zIv6
         FUR4e5T+qm5tWF5RBKW+oJ2DEx6sCpGc6NGkbS+fXWfFWa8XfZKPI+wCRUcObFmUwmE6
         4ikdDMOUmMnap6wChuC1gmROJhGeiJ1MT3Jf26uaPPYu6X+hhPKsO7ECxfO8PC16iBXT
         mFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LRK5NCYhQ3Fmmdu1Nq/r6lgNA/het1WCzf4tV6aXNNc=;
        b=UwUvtl/p4FNp8BYxc8KZAV9NIuIt9Gtjbylo9/geowjFCgVn7PdOdjhMd/j+YLZMZU
         n6Hq6qU14TGNqCVkJqDkzzifaUviMfI21jcW3JnTIue9MTD541zMHvJBY1kSiEhiSk1B
         IfIqfDRg5vOG6H9hhyT/o3r5lmA3q7wi6t1duKqOif97xNRVyXhrOLMSc4Kequgsy1sw
         A6z+vG7AbQ8lVg2jp4+KhENoQmBv1RLmgm7KpYioQndf90Uv+D0m6QGR9HeIkZpXWZ6b
         OMwd+6J9jd9XbtE1+FooPq20tLPsLZTk+yUwRmsUl9FAxe86hYrScd2w4nV97sfa4TzZ
         ypZQ==
X-Gm-Message-State: AOAM531qaz+axL85pzzVaWLygKWasM9ggIdIHktK7eyoy0OK+qWSsRml
	u3Q+GqOKt0dzPucd6zeKnL88Xw==
X-Google-Smtp-Source: ABdhPJxeKGBViGlrj5LsAbQbGRDtUjUXzGUPQv/lXHzeqUlJMXodiQjFo1rWxw8q5suEmdOPa+PGVw==
X-Received: by 2002:a05:651c:1a21:b0:249:8ccf:65eb with SMTP id by33-20020a05651c1a2100b002498ccf65ebmr16035500ljb.166.1649533206875;
        Sat, 09 Apr 2022 12:40:06 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id i23-20020a198c57000000b0045dcb4816d3sm1621742lfj.35.2022.04.09.12.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 12:40:05 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 0C2EA1039DB; Sat,  9 Apr 2022 22:41:37 +0300 (+03)
Date: Sat, 9 Apr 2022 22:41:37 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 3/8] efi/x86: Implement support for unaccepted memory
Message-ID: <20220409194137.yui73qnno5bd45xn@box.shutemov.name>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-4-kirill.shutemov@linux.intel.com>
 <c4b987d5-00d3-40ea-4c20-bf82b7512dec@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4b987d5-00d3-40ea-4c20-bf82b7512dec@intel.com>

On Fri, Apr 08, 2022 at 10:26:14AM -0700, Dave Hansen wrote:
> On 4/5/22 16:43, Kirill A. Shutemov wrote:
> > +void mark_unaccepted(struct boot_params *params, u64 start, u64 end)
> > +{
> > +	/*
> > +	 * The accepted memory bitmap only works at PMD_SIZE granularity.
> > +	 * If a request comes in to mark memory as unaccepted which is not
> > +	 * PMD_SIZE-aligned, simply accept the memory now since it can not be
> > +	 * *marked* as unaccepted.
> > +	 */
> > +
> > +	/*
> > +	 * Accept small regions that might not be able to be represented
> > +	 * in the bitmap:
> > +	 */
> > +	if (end - start < 2 * PMD_SIZE) {
> > +		__accept_memory(start, end);
> > +		return;
> > +	}
> 
> This is not my first time looking at this code and I still had to think
> about this a bit.  That's not good.  That pathological case here is
> actually something like this:
> 
> | 4k | 2044k + 2044k | 4k |
> ^ 0x0 	     ^ 2MB	  ^ 4MB
> 
> Where we have a 2MB-aligned 4k accepted area, a 4088k unaccepted area,
> then another 4k accepted area.  That will not result in any bits being
> set in the accepted memory bitmap because no 2MB region is fully accepted.
> 
> The one oddball case is this:
> 
> | 4k | 2044k |    2048k   |
> ^ 0x0 	     ^ 2MB	  ^ 4MB
> 
> Which would fall into the if() above, but *can* have part of its range
> marked in the bitmap.
> 
> Maybe we need something more like this:
> 
> 	/*
> 	 * Accept small regions that might not be able to be represented
> 	 * in the bitmap.  This is a bit imprecise and may accept some
> 	 * areas that could have been represented in the bitmap instead.
> 	 * But, the imprecision makes the code simpler by ensuring that
> 	 * at least one bit will be set int the bitmap below.
> 	 */

Okay, will change.

> > diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
> > index 2c3dac5ecb36..b17ceec757d0 100644
> > --- a/drivers/firmware/efi/Kconfig
> > +++ b/drivers/firmware/efi/Kconfig
> > @@ -243,6 +243,21 @@ config EFI_DISABLE_PCI_DMA
> >  	  options "efi=disable_early_pci_dma" or "efi=no_disable_early_pci_dma"
> >  	  may be used to override this option.
> >  
> > +config UNACCEPTED_MEMORY
> > +	bool
> > +	depends on EFI_STUB
> > +	depends on !KEXEC_CORE
> 
> The changelog should probably say something about how the kexec()
> incompatibility is going to be rectified in the future.

Okay.

> > +	help
> > +	   Some Virtual Machine platforms, such as Intel TDX, require
> > +	   some memory to be "accepted" by the guest before it can be used.
> > +	   This mechanism helps prevent malicious hosts from making changes
> > +	   to guest memory.
> > +
> > +	   UEFI specification v2.9 introduced EFI_UNACCEPTED_MEMORY memory type.
> > +
> > +	   This option adds support for unaccepted memory and makes such memory
> > +	   usable by kernel.
> > +
> >  endmenu
> 
> BTW, what happens if this is compiled out?  Do TDX guests just lose all
> the unaccepted memory?

No. It will not have access to unaccepted memory and will only use memory
accepted by BIOS.

> Should TDX be selecting this or something?

Yes, it should and we do this.

> > @@ -504,6 +506,13 @@ setup_e820(struct boot_params *params, struct setup_data *e820ext, u32 e820ext_s
> >  			e820_type = E820_TYPE_PMEM;
> >  			break;
> >  
> > +		case EFI_UNACCEPTED_MEMORY:
> > +			if (!IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
> > +				continue;
> 
> This seems worthy of a pr_info().  We're effectively throwing away
> memory with this "continue", right?

Yes. In this case we threat unaccepted as reserved and inaccessible to
kernel.

Maybe pr_warn() is more appropriate.


-- 
 Kirill A. Shutemov
