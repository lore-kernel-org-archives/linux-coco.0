Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D082CA1
	for <linux-coco@lists.linux.dev>; Wed, 12 Jan 2022 19:43:37 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id o15so11770318lfo.11
        for <linux-coco@lists.linux.dev>; Wed, 12 Jan 2022 11:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HWx7ejiUd6c11eHL/2LW4rxQ9jG3blTr/paj//+W3GA=;
        b=FXbhuy+QL6aQ+AoiJhfsAUjxL9AQtZNPH1/MjYiUg+Nx4vLGl/8M3mFWKS9FnfvuGD
         3yyer0YkC/HwBnY+KtCefbdzX/JuU/13Qi+4vSmRZPZom99Utfn2yDm917kaPpi2hSRI
         6/D6rlwaZv2TsttUB6JlVVKCSawSE+uVUgr/1vjRAqOsD1NEsxNfjSLJfy7xjwX8UNHw
         2Feexa8N6Jzklhn18KjxUIxXY74qWOWd7tvy2tu8esYcDnyBvPQyTMezT8R+mepS6mYY
         dNENprpfkaZkRJpBQXv7R3h3KhOA36hQnTqAiYgikUy9dDds9b/U+jm8tMTb1HURd1Le
         jEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HWx7ejiUd6c11eHL/2LW4rxQ9jG3blTr/paj//+W3GA=;
        b=mHEXkzb2MgFO0YZRAmhzQz12xVoSdvJA2E7Qe9B7OxiNGCKrGs47+HHFz6txGBTzpl
         wSGZsyGOqBH4orHSV0HB0MmnMwHkJ6g1G0dSTpLM6gsRpXRN1shVbivtBMRhT2w1COpn
         xyE4V97PLlaCKVYKuglfLEvYsPlcKXPNTIfEeBhLKBFFOYccYIll6eOjeGHdPRZZ/E4z
         vVTGQzggidR6e75l0NZPwc0qO4GpzkAziYSO08L4j0g6Mtf5K3+9DtVoRwCzhLv+W75J
         e7PUWnhfY22WL5JDFK3p19Lm+4Fy9h4gjqWsIYXquFYXEBbN82teNHcZLcz153Onhsbv
         1Ztw==
X-Gm-Message-State: AOAM532A2BFmqC7PI3q16s7H67m+hc8z3KUsgfPl2iQbkuuFtdrENq7Z
	9Gyzia2VY3+R1Lt1lqUUZEGouw==
X-Google-Smtp-Source: ABdhPJzS4Xf5WDj+CW236gyVeYs5tYSyEAdbNEh2R2wQCw8aCu2hEsekTBRphxyuWPJWkJiJSpH7Gg==
X-Received: by 2002:a19:5514:: with SMTP id n20mr878945lfe.178.1642016615543;
        Wed, 12 Jan 2022 11:43:35 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id g4sm74056lfu.137.2022.01.12.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 11:43:34 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
	id 08C82103A6D; Wed, 12 Jan 2022 22:43:58 +0300 (+03)
Date: Wed, 12 Jan 2022 22:43:58 +0300
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
Subject: Re: [PATCHv2 6/7] x86/mm: Provide helpers for unaccepted memory
Message-ID: <20220112194358.u5akdxqrzvfepcq4@box.shutemov.name>
References: <20220111113314.27173-1-kirill.shutemov@linux.intel.com>
 <20220111113314.27173-7-kirill.shutemov@linux.intel.com>
 <a234c061-4497-3613-d47f-80071cc0e5d4@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a234c061-4497-3613-d47f-80071cc0e5d4@intel.com>

On Tue, Jan 11, 2022 at 12:01:56PM -0800, Dave Hansen wrote:
> On 1/11/22 03:33, Kirill A. Shutemov wrote:
> > Core-mm requires few helpers to support unaccepted memory:
> > 
> >   - accept_memory() checks the range of addresses against the bitmap and
> >     accept memory if needed;
> > 
> >   - maybe_set_page_offline() checks the bitmap and marks a page with
> >     PageOffline() if memory acceptance required on the first
> >     allocation of the page.
> > 
> >   - accept_and_clear_page_offline() accepts memory for the page and clears
> >     PageOffline().
> > 
> ...
> > +void accept_memory(phys_addr_t start, phys_addr_t end)
> > +{
> > +	unsigned long flags;
> > +	if (!boot_params.unaccepted_memory)
> > +		return;
> > +
> > +	spin_lock_irqsave(&unaccepted_memory_lock, flags);
> > +	__accept_memory(start, end);
> > +	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
> > +}
> 
> Not a big deal, but please cc me on all the patches in the series.  This is
> called from the core mm patches which I wasn't cc'd on.
> 
> This also isn't obvious, but this introduces a new, global lock into the
> fast path of the page allocator and holds it for extended periods of time.
> It won't be taken any more once all memory is accepted, but you can sure bet
> that it will be noticeable until that happens.
> 
> *PLEASE* document this.  It needs changelog and probably code comments.

Okay, will do.

-- 
 Kirill A. Shutemov
