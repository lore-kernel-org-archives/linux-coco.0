Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34CA168
	for <linux-coco@lists.linux.dev>; Wed, 12 Jan 2022 19:42:41 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id k21so12032902lfu.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Jan 2022 11:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cOQ/xWPl3tvthX8wOW9afvSYF1hlxSg5dmQKz7cg1rA=;
        b=EknpayJrAOCN1/MkEc37OWKDriaMtq0JwDs0lNvkfqcB7uPcXUaSrno1DUCY9OQCJj
         JeBtJgxRTF/jm9kwWgcun5p1maV/PEb/wz5Awq2uCeJZK63eBeszBuPCsS3NMGCIMOQ5
         0UfBseExvdfhvW7o52YW5I5LI1D+lUI0kClR9eu3xdjjdfDkrUYi3EI9ZQRCXGpgdxLG
         FJgY+bVhKg5nntLrbcy+o2p4gLba5TtUVb08puKdTBNXTH9HcjLpLA7Yk1AnMRiyOLE1
         RCZfkJ/ZZtuUGDAwd74tJrw53H8VOQOlaMLuFTMRd9Xfi9f3xpfgQxYQTNxCp/2sxGRs
         KPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cOQ/xWPl3tvthX8wOW9afvSYF1hlxSg5dmQKz7cg1rA=;
        b=AO9E4skBm8A2FTkArH0/9WRbikb0XLgHPwk2Rf+X01U1LmGD53Q/eDxg93pASORfUt
         um2UeB7vLTE7te84QWWpLquolaASvUtHF6/H6/++4cVumnEKm9hh9ppJJGkTtzYo57n/
         z9SAWNKa7UUAGOjwvox+C+L3IJMD6yML54YrB2wkZgTxDWx/TMaiy5D9eWTdagArwlk9
         4ect57rReDopKjI+YdcSyQ4K1cIDHpqPVJx2ayCB4jT6zZ7w5tK8i4ognDf1OgPMsXiG
         YkLzwmACF3EGZHgFQ3CQlwHqZZAAh//2ghQRQuZruNZlCc6eDxoWx/1iwwNjJFVatBl7
         +60Q==
X-Gm-Message-State: AOAM5313rAtNggPOF/wxJCyLKFCZeHEX/U8EO+xIU54OPHuEW9FwAQOj
	9T44ETa42a+9NYAFeb/8CxZoTA==
X-Google-Smtp-Source: ABdhPJwTHrcLUKfFze3EfLRUMqmC0B1PnsBiDjZJKmSvB3k+WBc7vCS4TK6ASfyh26UvG0jZ0nk5QQ==
X-Received: by 2002:a05:6512:b9e:: with SMTP id b30mr864164lfv.23.1642016559895;
        Wed, 12 Jan 2022 11:42:39 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id x39sm75833lfa.14.2022.01.12.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 11:42:39 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id C858B103A6D; Wed, 12 Jan 2022 22:43:02 +0300 (+03)
Date: Wed, 12 Jan 2022 22:43:02 +0300
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
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 5/7] x86/mm: Reserve unaccepted memory bitmap
Message-ID: <20220112194302.cyxhjypsptr4mtix@box.shutemov.name>
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-6-kirill.shutemov@linux.intel.com>
 <3a361a1d-0e14-8884-c5bb-90aeb87e38ef@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a361a1d-0e14-8884-c5bb-90aeb87e38ef@intel.com>

On Tue, Jan 11, 2022 at 11:10:40AM -0800, Dave Hansen wrote:
> On 1/11/22 03:33, Kirill A. Shutemov wrote:
> > Unaccepted memory bitmap is allocated during decompression stage and
> > handed over to main kernel image via boot_params. The bitmap is used to
> > track if memory has been accepted.
> > 
> > Reserve unaccepted memory bitmap has to prevent reallocating memory for
> > other means.
> 
> I'm having a hard time parsing that changelog, especially the second
> paragraph.  Could you give it another shot?

What about this:

	Unaccepted memory bitmap is allocated during decompression stage and
	handed over to main kernel image via boot_params.

	Kernel tracks what memory has been accepted in the bitmap.

	Reserve memory where the bitmap is placed to prevent memblock from
	re-allocating the memory for other needs.

?

> > +	/* Mark unaccepted memory bitmap reserved */
> > +	if (boot_params.unaccepted_memory) {
> > +		unsigned long size;
> > +
> > +		/* One bit per 2MB */
> > +		size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> > +				    PMD_SIZE * BITS_PER_BYTE);
> > +		memblock_reserve(boot_params.unaccepted_memory, size);
> > +	}
> 
> Is it OK that the size of the bitmap is inferred from
> e820__end_of_ram_pfn()?  Is this OK in the presence of mem= and other things
> that muck with the e820?

Good question. I think we are fine. If kernel is not able to allocate
memory from a part of physical address space we don't need the bitmap for
it either.

-- 
 Kirill A. Shutemov
