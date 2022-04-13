Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B8290C
	for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 16:07:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id k5so4397494lfg.9
        for <linux-coco@lists.linux.dev>; Wed, 13 Apr 2022 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+gGRtOFsAgBFuY/HR0wysWygPo2Lk5mA8o5nY/205wk=;
        b=CBUODdGn8Cq6YWWpsGh25g2014RVwdTZRnAx4hj0paLyMetGc9QwHOC5u+2SdFeVYA
         VvK1ZlpY9V2BtWRJTDTqpZOpcC6fbev33f/xPzINT0kbw7Kxz+A57bc6VVkLD9EFGYkg
         ya/mlUHqv/9wy5D8+qN8VNq8I0qnEezdCsFK/3adMddyD5q/EGZzwGl1lnSYq8aYDzCt
         qjugJks2FNh9Yty4SUfW3bwm8NQpYlYvgECkEoM92Y7YxZU3tEgH0x4Ikp1mV1zmRCil
         kwrzg4MQCPuF5TAvQgN1MVxDeB2YlKNKso3VV0rWnbueKEGJQEeIpKN+7h0BKC/hqJah
         8yPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+gGRtOFsAgBFuY/HR0wysWygPo2Lk5mA8o5nY/205wk=;
        b=kNxk28diyGA6wI0rgE3TIFXS5IYMzdP1lrFF4ZJ/+KTTizsLrahF7jycxc9ZoF3jNL
         IHxJNwuna6jb3EfCqiavgBxA5QpgYDtNq/pe230AuExzoKnKJCcrfG/h4TVuobcVy5Lq
         YeKrZUAw1SZpYnaBNmy3I+1RI1084VVxuraVgnjpO5ctaBSRBeCgRVkUGB0NuDB69tJJ
         k/p8sYmG71zkQ+jTQKy8Qj4aUHPn+SYZ8jNSMAzoIko85dzf2IVLOibQn5o9/IKMvIe/
         vBndI5/tvgecqr8tOY4U+FFPcxMmuwMoTB+QgEDKKvUEYb3nH52pfU+sWPr2blhOudm4
         lOWA==
X-Gm-Message-State: AOAM5326Ak9ClSTBK+E6F5DfEZ1jSNrczE3gR6xTbZys/CX4De2Y5Ayx
	D1nkrYF7a2kIVizDnW2ljxRK9g==
X-Google-Smtp-Source: ABdhPJy6n1MaCGCQLYNjTpg1q51ciwj44r8aVWk9FrFKjHkLPaJum7yrK/G+zFIgXcw0linOTMBg/w==
X-Received: by 2002:a19:5f05:0:b0:46b:a5f2:5fab with SMTP id t5-20020a195f05000000b0046ba5f25fabmr11079100lfb.8.1649866026127;
        Wed, 13 Apr 2022 09:07:06 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id o2-20020a056512052200b0046b8e14d2edsm1719695lfc.267.2022.04.13.09.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 09:07:05 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 85DD710397F; Wed, 13 Apr 2022 19:08:39 +0300 (+03)
Date: Wed, 13 Apr 2022 19:08:39 +0300
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
Subject: Re: [PATCHv4 6/8] x86/mm: Provide helpers for unaccepted memory
Message-ID: <20220413160839.arbbw5dcvmubdidz@box.shutemov.name>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-7-kirill.shutemov@linux.intel.com>
 <0e366406-9a3a-0bf3-e073-272279f6abf2@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e366406-9a3a-0bf3-e073-272279f6abf2@intel.com>

On Fri, Apr 08, 2022 at 12:21:19PM -0700, Dave Hansen wrote:
> On 4/5/22 16:43, Kirill A. Shutemov wrote:
> > +void accept_memory(phys_addr_t start, phys_addr_t end)
> > +{
> > +	unsigned long *unaccepted_memory;
> > +	unsigned long flags;
> > +	unsigned int rs, re;
> > +
> > +	if (!boot_params.unaccepted_memory)
> > +		return;
> > +
> > +	unaccepted_memory = __va(boot_params.unaccepted_memory);
> > +	rs = start / PMD_SIZE;
> > +
> > +	spin_lock_irqsave(&unaccepted_memory_lock, flags);
> > +	for_each_set_bitrange_from(rs, re, unaccepted_memory,
> > +				   DIV_ROUND_UP(end, PMD_SIZE)) {
> > +		/* Platform-specific memory-acceptance call goes here */
> > +		panic("Cannot accept memory");
> > +		bitmap_clear(unaccepted_memory, rs, re - rs);
> > +	}
> > +	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
> > +}
> 
> Just to reiterate: this is a global spinlock.  It's disabling
> interrupts.  "Platform-specific memory-acceptance call" will soon become:
> 
> 	tdx_accept_memory(rs * PMD_SIZE, re * PMD_SIZE);
> 
> which is a page-by-page __tdx_module_call():
> 
> > +	for (i = 0; i < (end - start) / PAGE_SIZE; i++) {
> > +		if (__tdx_module_call(TDACCEPTPAGE, start + i * PAGE_SIZE,
> > +				      0, 0, 0, NULL)) {
> > +			error("Cannot accept memory: page accept failed\n");
> > +		}
> > +	}
> 
> Each __tdx_module_call() involves a privilege transition that also
> surely includes things like changing CR3.  It can't be cheap.  It also
> is presumably touching the memory and probably flushing it out of the
> CPU caches.  It's also unbounded:
> 
> 	spin_lock_irqsave(&unaccepted_memory_lock, flags);
> 	for (i = 0; i < (end - start) / PAGE_SIZE; i++)
> 		// thousands?  tens-of-thousands of cycles??
> 	spin_lock_irqsave(&unaccepted_memory_lock, flags);
> 
> How far apart can end and start be?  It's at *least* 2MB in the page
> allocator, which is on the order of a millisecond.  Are we sure there
> aren't any callers that want to do this at a gigabyte granularity?  That
> would hold the global lock and disable interrupts on the order of a second.

This codepath only gets invoked with orders <MAX_ORDER or 4M on x86-64.

> Do we want to bound the time that the lock can be held?  Or, should we
> just let the lockup detectors tell us that we're being naughty?

Host can always DoS the guess, so yes this can lead to lockups.


-- 
 Kirill A. Shutemov
