Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB947F0
	for <linux-coco@lists.linux.dev>; Fri, 12 May 2023 11:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58D4C433A0
	for <linux-coco@lists.linux.dev>; Fri, 12 May 2023 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683889274;
	bh=WfMo/UCIoEAhIuI192bDSMME0+1kDUpIrgATnnqtCsM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PxZnQZfmPThp1aNPFU7jeVlmrsGmkMWcBoJxxYyo6JmqkJQnmMctSBQOUFsBCjQt+
	 4S6a/u3PaKDrdsophho8naUS7TPbeyEXm45rmmwV6mOwqdEKvMi0x74xoiYPWVb571
	 dSJCO0McLnyBTf1GihYOnOWyAEPHfgAubV1AoreJ7ltYIWO6MgzCEKIrvbxjfoP4s+
	 JPXn8EtDgaYI1OeyHN+OYeIg0KBY6cynOzYAHsnAgM8swyjyR6k9XOuyNhPfcLGbhq
	 5X7hHogGnO0Ct8IE6JyAU+Rk7qaxV4MEqsKmJqzh+Sp0TsiAcR7YQ2iOQHXEFzYZZL
	 IOZPyYREQe6SQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4ec8149907aso11437232e87.1
        for <linux-coco@lists.linux.dev>; Fri, 12 May 2023 04:01:14 -0700 (PDT)
X-Gm-Message-State: AC+VfDxMLFnkyvcX7v5GPB4Uu51LbyqDbMuLMxWrhrgMvBt3kl8bVhmE
	aAKeQ0w7eIyslrv0HvS8g8aPH2iLIxp1DC6lE+U=
X-Google-Smtp-Source: ACHHUZ7VTszyNtMqIQDilUbtOaY3L0FxW7t6tphZiH7wZTs+ubZ5Ew8B500wu/GUWe6sp5Gkp5rP8abtaJQ7Qm8Dnjo=
X-Received: by 2002:a05:6512:961:b0:4eb:7e:1fa5 with SMTP id
 v1-20020a056512096100b004eb007e1fa5mr3761436lft.8.1683889272855; Fri, 12 May
 2023 04:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230507234618.18067-1-kirill.shutemov@linux.intel.com>
 <20230507234618.18067-5-kirill.shutemov@linux.intel.com> <CAMj1kXE26G=HgqBHoJOWF+FyXs7Ryj7VFFY9A+xG7HmUXnb5bg@mail.gmail.com>
 <20230508190043.ouauzbghn27khdy4@box.shutemov.name> <CAMj1kXFxw4+opJuq=g2unocitRyKYz_hfrZb-grsZtPwBOyKgw@mail.gmail.com>
 <20230509005634.qtuiodpirexbxu2k@box.shutemov.name> <CAMj1kXGZ4j7nShGPoJzTZNa4NDvHnj_arY8XDXzW8cd6G==8Jg@mail.gmail.com>
 <20230512015909.2fj7bmp3ejc3owhs@box.shutemov.name> <CAMj1kXHY-uWWgWjv-7wLkKoh9pvgCbEkxHiCBbJa1wt53g5wYg@mail.gmail.com>
 <20230512105919.lgy3cvio6m2vcygn@box.shutemov.name>
In-Reply-To: <20230512105919.lgy3cvio6m2vcygn@box.shutemov.name>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 12 May 2023 13:01:01 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGmThuLGzKGG9pPNFaH_yKTZ_AnD5aNUd7qGG0=Enev4w@mail.gmail.com>
Message-ID: <CAMj1kXGmThuLGzKGG9pPNFaH_yKTZ_AnD5aNUd7qGG0=Enev4w@mail.gmail.com>
Subject: Re: [PATCHv10 04/11] efi/x86: Implement support for unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, 
	marcelo.cerri@canonical.com, tim.gardner@canonical.com, 
	khalid.elmously@canonical.com, philip.cox@canonical.com, aarcange@redhat.com, 
	peterx@redhat.com, x86@kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 May 2023 at 12:59, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Fri, May 12, 2023 at 09:39:30AM +0200, Ard Biesheuvel wrote:
> > Please replace PMD_SIZE with something along the lines of
> > EFI_UNACCEPTED_UNIT_SIZE and #define it to PMD_SIZE in
> > arch/x86/include/asm/efi.h.
> >
> > The comment below about the size of the bitmap vs the size of the
> > address space should probably move there as well.
>
> Okay, will do.
>
> > > +void accept_memory(phys_addr_t start, phys_addr_t end)
> > > +{
> > > +       unsigned long range_start, range_end;
> > > +       unsigned long bitmap_size;
> > > +       u64 unit_size;
> > > +
> > > +       if (!unaccepted_table)
> > > +               return;
> > > +
> > > +       unit_size = unaccepted_table->unit_size;
> > > +
> > > +       /*
> > > +        * Only care for the part of the range that is represented
> > > +        * in the bitmap.
> > > +        */
> > > +       if (start < unaccepted_table->phys_base)
> > > +               start = unaccepted_table->phys_base;
> > > +       if (end < unaccepted_table->phys_base)
> > > +               return;
> > > +
> > > +       /* Translate to offsets from the beginning of the bitmap */
> > > +       start -= unaccepted_table->phys_base;
> > > +       end -= unaccepted_table->phys_base;
> > > +
> > > +       /* Make sure not to overrun the bitmap */
> > > +       if (end > unaccepted_table->size * unit_size * BITS_PER_BYTE)
> > > +               end = unaccepted_table->size * unit_size * BITS_PER_BYTE;
> > > +
> >
> > Should we warn here?
>
> No. accept_memory() is nop for conventional memory (memblock calls it
> unconditionally).
>
> With the fixup, we only allocate bitmap for the range of physical address
> space where we have unaccepted memory. So if there's conventional memory
> after unaccepted, bitmap will not cover it.
>

Fair enough.
