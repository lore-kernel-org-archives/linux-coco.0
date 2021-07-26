Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9D168
	for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 23:54:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id a26so18468998lfr.11
        for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VMjZ1NiEINQ722sz2AvYEsOyg2jfEHnbAaMklK8Ptfk=;
        b=zonPvc/g9GVC1njP25RYe83HBENqz9bzp3czHEV24Wccan39b2QdG74JIpbgRf+Tbg
         lU72349t80EwtDCyovTnhozHfx1fg4C/WGkZmdltfSR8hDgdg6Z7xodH3Qmzf3pkbljY
         inQhLICfOlXg54G24QGuLdf+4rDUUlC3zjy5Jv/+2PgrqhNV46HUPtYlf2HxLtfwQgsz
         gAnDq7wTGZnx3D7KcS6RKND0REA/Qkywn6T3ACLNw6Ed2+vWG9rTwZLNflMlACq+2oC5
         8AK+AsJYcaYcLq2Ot5IIZzpGIv2OMHCy4WNW1fyjuTMJ5tbvpVj+Dnu3RbD3y2iBLo9s
         om2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VMjZ1NiEINQ722sz2AvYEsOyg2jfEHnbAaMklK8Ptfk=;
        b=ZqyEPO6ryJKeeegSgeOIrXPooJpDsS0ZNzgpchGf/dARIiGLDHHilfDU5FO5Bic/ve
         hZzT+Eoc8PllXa8i3dDsBEVnUCYjx0PKpLIgbb2pVG/MrJCx0T3O/CxOL/qWSWUqlaQT
         NE4z2jpxI1C1FsYEZZTaxCMboVsEHxt6Zy1F/b4G+djuBIQM3Alh/iwAeM7GF85tMBfm
         Yq3cYN8cUz+aMTcxsNw1gHYToXNV/AOAHwBzHWVsfRSWqqMOzhYtDw1qHxTxkLQRE1Hh
         01o0f8Ca5cwKCYTgNX/Whe9Aid9fMhzQ9a9169HVmrWrB3Jz7jfMoSTNBRxrfquNj2j8
         /nnw==
X-Gm-Message-State: AOAM532tyh9GTvs3ThZMLXs/my+o+HPOmJ6aTNTjR6VCzjilOs5wVw0B
	TyohSrj7uZYqCvQZuy9N90mUcQ==
X-Google-Smtp-Source: ABdhPJzPnJDZXAtNS611ZjKjr2hgziUksAB1ldetKqzrUGXa09V2wFzULChe9Z2x2Ot126UNAUnOVw==
X-Received: by 2002:ac2:4c97:: with SMTP id d23mr14326530lfl.249.1627343658246;
        Mon, 26 Jul 2021 16:54:18 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id br4sm133723lfb.33.2021.07.26.16.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 16:54:17 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 36495102968; Tue, 27 Jul 2021 02:54:17 +0300 (+03)
Date: Tue, 27 Jul 2021 02:54:17 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Erdem Aktas <erdemaktas@google.com>
Cc: Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Jon Grimm <jon.grimm@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	"Kaplan, David" <David.Kaplan@amd.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86 <x86@kernel.org>,
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <20210726235417.fuxa5s32jta76lcv@box.shutemov.name>
References: <YPV27hDPZUoVsIZt@suse.de>
 <20210722195130.beazbb5blvj3mruo@box>
 <CAAYXXYxS2mK=AkqZDzG=k3=W4ChbYnwzo-hMLU8d6iusDpqXbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAYXXYxS2mK=AkqZDzG=k3=W4ChbYnwzo-hMLU8d6iusDpqXbQ@mail.gmail.com>

On Mon, Jul 26, 2021 at 04:02:56PM -0700, Erdem Aktas wrote:
> On Thu, Jul 22, 2021 at 12:51 PM Kirill A. Shutemov
> <kirill@shutemov.name> wrote:
> > +void mark_unaccepted(phys_addr_t start, phys_addr_t end)
> > +{
> > +       unsigned int npages;
> > +
> > +       if (start & ~PMD_MASK) {
> > +               npages = (round_up(start, PMD_SIZE) - start) / PAGE_SIZE;
> > +               tdx_hcall_gpa_intent(start, npages, TDX_MAP_PRIVATE);
> > +               start = round_up(start, PMD_SIZE);
> > +       }
> > +
> > +       if (end & ~PMD_MASK) {
> > +               npages = (end - round_down(end, PMD_SIZE)) / PAGE_SIZE;
> > +               end = round_down(end, PMD_SIZE);
> > +               tdx_hcall_gpa_intent(end, npages, TDX_MAP_PRIVATE);
> > +       }
> 
> Is not the above code will accept the pages that are already accepted?

No. This code will get called for all UNACCEPTED ranges in EFI table.
If such memory is accepted it is a bug.

> It is accepting the pages in the same 2MB region that is before start
> and after end. We do not know what code/data is stored on those pages,
> right? This might cause security issues depending on what is stored on
> those pages.

As I told above, it only get called for unaccepted memory and nothing can
be stored there before the point.

> > +static void __accept_pages(phys_addr_t start, phys_addr_t end)
> > +{
> > +       unsigned int rs, re;
> > +
> > +       bitmap_for_each_set_region(unaccepted_memory, rs, re,
> > +                                  start / PMD_SIZE, end / PMD_SIZE) {
> > +               tdx_hcall_gpa_intent(rs * PMD_SIZE, (re - rs) * PMD_NR,
> > +                                    TDX_MAP_PRIVATE);
> > +
> This assumes that the granularity of the unaccepted pages is always in
> PMD_SIZE.

Yes, because we constructed the bitmap this way. Non-2M-aligned chunks get
accepted when we accept upfront when we populate the bitmap.

See mark_unaccepted().

(mark_unaccepted() has few bugs that will be fixed in the next version)

> I  have seen the answer above saying that mark_unaccepted
> makes sure that we have only 2MB unaccepted pages in our bitmap but it
> is not enough IMO. This function, as it is, will do double TDACCEPT
> for the already accepted 4KB pages in the same 2MB region.

> > +void maybe_set_page_offline(struct page *page, unsigned int order)
> > +{
> > +       phys_addr_t addr = page_to_phys(page);
> > +       bool unaccepted = true;
> > +       unsigned int i;
> > +
> > +       spin_lock(&unaccepted_memory_lock);
> > +       if (order < PMD_ORDER) {
> > +               BUG_ON(test_bit(addr / PMD_SIZE, unaccepted_memory));
> > +               goto out;
> > +       }
> don't we need to throw a bug when order is < PMD_ORDER, independent of
> what test_bit() is saying? If the page is accepted or not accepted,
> there is a possibility of double accepting pages.

No. maybe_set_page_offline() get called on all pages that get added to the
free list on boot. Any pages with order < 9 has to belong to already
accepted regions.

> > +       for (i = 0; i < (1 << (order - PMD_ORDER)); i++) {
> 
> and if order < PMD_ORDER, this will be a wrong shift operation, right?

order < PMD_ORDER handed by the 'if' above.

> > +       if (unaccepted)
> > +               __SetPageOffline(page);
> > +       else
> > +               __accept_pages(addr, addr + (PAGE_SIZE << order));
> so all the pages that were accepted will be reaccepted?

Have you looked at what __accept_pages() does? It only accept unaccepted
pages, according to the bitmap.

-- 
 Kirill A. Shutemov
