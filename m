Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6469C168
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 23:03:08 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id e5so11564951pld.6
        for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lVyo1mBQvnq+f4g+Wbb/eGDEIK9yT50vF3C8uYmoKBM=;
        b=o4zD3bI+XDT3dIclmQT08s4T0toZ3nH3EFIZezIGl4ATdFWDbw/Ppkg73fh/Ov5Feq
         AvGFBUC7jvIcm3J/r3aci4dpasL7o8BoPb1SFIoFs26G7uauUXiCYYGas5GtVjE69NOw
         wq98RvS2PApMJtViIvJe8xzNGy9izP+Lvs51qQlkpG+ffqFkLhSOkZIkQ/pFDcWjsPVy
         frNqHP/Z3vjA5HbmA50qegNJK8KzaQGhWjX9abtqW7JlGiy72NLkS1BOe24KpB0qbKQm
         TuQddQIwXBD+sHngyUz1p1P6NkBvvRttZ5i+Hyjm8YSnkRjHu+aGMv1Z8ac5sspp68KM
         hI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lVyo1mBQvnq+f4g+Wbb/eGDEIK9yT50vF3C8uYmoKBM=;
        b=IbL2cSf4Rs32F57JgUZjX65xobPXFCgtaRzS4znjrCxoAgqKs2W7Y9XNBp2OHZAavT
         beBk3DX13cI7OrmnkSsmdOuvIejPDpMLayZaL3NJ98MCapiN/g3PyzfVGI/AmwzejR6l
         ksSvCn7QuUTetrRQoRUy8uvNgMKcZE+hVYCVF3b5OxRKAxoy/rcXa7dgx+n9ALkAQYUn
         ng35MpfONAj2Is/XzN7O8ZVG61jbCTV//Inc3OCULj4ZmKrvEkCMpTtTVFP7znY0wqBm
         7RTdqB+frDvbsqyrD8VVFiK23jAp7oerAiRmMdiWgSMv5mkmj+gcjdR6zvg09cqDbHl8
         bDYQ==
X-Gm-Message-State: AOAM533TxpbQH0HmqJNXAovxvbdrL+eJZEASwuMY2i8APyMI2pRhhpe/
	RmsyQ2opTcfARoB4qKPoQ98G+IwMYBEAdC0SCc2IaA==
X-Google-Smtp-Source: ABdhPJze8kIkLyb6FLovD57Yqs9zIh9DGsFVJNaK15UrIcdfvNXi592LsLmxKGlGPA6iJxRkDJGYraZw+tVTaNOOnJA=
X-Received: by 2002:a05:6a00:1895:b029:32c:b091:ebc with SMTP id
 x21-20020a056a001895b029032cb0910ebcmr20721479pfh.4.1627340587563; Mon, 26
 Jul 2021 16:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <20210722195130.beazbb5blvj3mruo@box>
In-Reply-To: <20210722195130.beazbb5blvj3mruo@box>
From: Erdem Aktas <erdemaktas@google.com>
Date: Mon, 26 Jul 2021 16:02:56 -0700
Message-ID: <CAAYXXYxS2mK=AkqZDzG=k3=W4ChbYnwzo-hMLU8d6iusDpqXbQ@mail.gmail.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, "Kaplan, David" <David.Kaplan@amd.com>, 
	Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 12:51 PM Kirill A. Shutemov
<kirill@shutemov.name> wrote:
> +void mark_unaccepted(phys_addr_t start, phys_addr_t end)
> +{
> +       unsigned int npages;
> +
> +       if (start & ~PMD_MASK) {
> +               npages = (round_up(start, PMD_SIZE) - start) / PAGE_SIZE;
> +               tdx_hcall_gpa_intent(start, npages, TDX_MAP_PRIVATE);
> +               start = round_up(start, PMD_SIZE);
> +       }
> +
> +       if (end & ~PMD_MASK) {
> +               npages = (end - round_down(end, PMD_SIZE)) / PAGE_SIZE;
> +               end = round_down(end, PMD_SIZE);
> +               tdx_hcall_gpa_intent(end, npages, TDX_MAP_PRIVATE);
> +       }

Is not the above code will accept the pages that are already accepted?
It is accepting the pages in the same 2MB region that is before start
and after end. We do not know what code/data is stored on those pages,
right? This might cause security issues depending on what is stored on
those pages.

> +static void __accept_pages(phys_addr_t start, phys_addr_t end)
> +{
> +       unsigned int rs, re;
> +
> +       bitmap_for_each_set_region(unaccepted_memory, rs, re,
> +                                  start / PMD_SIZE, end / PMD_SIZE) {
> +               tdx_hcall_gpa_intent(rs * PMD_SIZE, (re - rs) * PMD_NR,
> +                                    TDX_MAP_PRIVATE);
> +
This assumes that the granularity of the unaccepted pages is always in
PMD_SIZE. I  have seen the answer above saying that mark_unaccepted
makes sure that we have only 2MB unaccepted pages in our bitmap but it
is not enough IMO. This function, as it is, will do double TDACCEPT
for the already accepted 4KB pages in the same 2MB region.

> +void maybe_set_page_offline(struct page *page, unsigned int order)
> +{
> +       phys_addr_t addr = page_to_phys(page);
> +       bool unaccepted = true;
> +       unsigned int i;
> +
> +       spin_lock(&unaccepted_memory_lock);
> +       if (order < PMD_ORDER) {
> +               BUG_ON(test_bit(addr / PMD_SIZE, unaccepted_memory));
> +               goto out;
> +       }
don't we need to throw a bug when order is < PMD_ORDER, independent of
what test_bit() is saying? If the page is accepted or not accepted,
there is a possibility of double accepting pages.
> +       for (i = 0; i < (1 << (order - PMD_ORDER)); i++) {

and if order < PMD_ORDER, this will be a wrong shift operation, right?

> +       if (unaccepted)
> +               __SetPageOffline(page);
> +       else
> +               __accept_pages(addr, addr + (PAGE_SIZE << order));
so all the pages that were accepted will be reaccepted?
