Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF25617D3
	for <linux-coco@lists.linux.dev>; Tue,  9 May 2023 06:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C48C43442
	for <linux-coco@lists.linux.dev>; Tue,  9 May 2023 06:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614872;
	bh=/g0g3mKPSGSxoNisFazeQZrBZpWi+qa0Btk+6LTTmIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G93vkezyJ5JYgaRb8raNPkm0MUmUm0RExDdW2RI2ClwGyyHzr7qZEqTACUPj4teNl
	 J6d114DtyMKruzr4eXREji5JoWOz+0XOt69OWB0uDiSvPAzbSAkUv4tQXZG7F6ZmK0
	 0zFJpdTtBjzRoxRkqnBhmq+bQLDcoUwE3W/Fa4qYq88bucE8MBUY7Ci6URQtVOmJM4
	 ly8OEiapUmwHijFr3G16XY/uE15vZGS9Ek8wNkviYv3hPKHLIuMzCa7AbO/srsG2h5
	 vUgF2RUIteZg3V6uK8fnlY24uxBWvQiYWzWYFI6bN6FIHAiMC6SNjLILpCn+d2XsZ5
	 Onjq69jx6yuBQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4effb818c37so6210961e87.3
        for <linux-coco@lists.linux.dev>; Mon, 08 May 2023 23:47:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDxx/39HYNaAMAtIZRqKvHnGEUwNBf+vFafoV/IdRtz0QFqfBn44
	8oonFOd3MSlxevjQ8tRBxrSy0HyxQkkjtNnTyzQ=
X-Google-Smtp-Source: ACHHUZ7eXCf2DhFoZbXsOooRbR89zqpckWA8L0hnCqv54zhuVpCXL2As1V2WvFbe4mhg1Z0pcGUw+ObvpEBuJ+DjYiI=
X-Received: by 2002:ac2:5638:0:b0:4f1:26f5:7814 with SMTP id
 b24-20020ac25638000000b004f126f57814mr427935lff.20.1683614870122; Mon, 08 May
 2023 23:47:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230507234618.18067-1-kirill.shutemov@linux.intel.com>
 <20230507234618.18067-5-kirill.shutemov@linux.intel.com> <CAMj1kXE26G=HgqBHoJOWF+FyXs7Ryj7VFFY9A+xG7HmUXnb5bg@mail.gmail.com>
 <20230508190043.ouauzbghn27khdy4@box.shutemov.name> <CAMj1kXFxw4+opJuq=g2unocitRyKYz_hfrZb-grsZtPwBOyKgw@mail.gmail.com>
 <20230509005634.qtuiodpirexbxu2k@box.shutemov.name>
In-Reply-To: <20230509005634.qtuiodpirexbxu2k@box.shutemov.name>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 9 May 2023 08:47:38 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGZ4j7nShGPoJzTZNa4NDvHnj_arY8XDXzW8cd6G==8Jg@mail.gmail.com>
Message-ID: <CAMj1kXGZ4j7nShGPoJzTZNa4NDvHnj_arY8XDXzW8cd6G==8Jg@mail.gmail.com>
Subject: Re: [PATCHv10 04/11] efi/x86: Implement support for unaccepted memory
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
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

On Tue, 9 May 2023 at 02:56, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Tue, May 09, 2023 at 12:11:41AM +0200, Ard Biesheuvel wrote:
> > > @@ -1324,13 +1325,15 @@ void __init e820__memblock_setup(void)
> > >          * e820_table is not finalized and e820__end_of_ram_pfn() cannot be
> > >          * used to get correct RAM size.
> > >          */
> > > -       if (boot_params.unaccepted_memory) {
> > > +       if (efi.unaccepted != EFI_INVALID_TABLE_ADDR) {
> > > +               struct efi_unaccepted_memory *unaccepted;
> > >                 unsigned long size;
> > >
> > > -               /* One bit per 2MB */
> > > -               size = DIV_ROUND_UP(e820__end_of_ram_pfn() * PAGE_SIZE,
> > > -                                   PMD_SIZE * BITS_PER_BYTE);
> > > -               memblock_reserve(boot_params.unaccepted_memory, size);
> > > +               unaccepted = __va(efi.unaccepted);
> > > +
> > > +               size = sizeof(struct efi_unaccepted_memory);
> > > +               size += unaccepted->size;
> > > +               memblock_reserve(efi.unaccepted, size);
> > >         }
> > >
> >
> > This could be moved to generic code (but we'll need to use early_memremap())
>
> I don't understand why early_memremap() is needed. EFI_LOADER_DATA already
> mapped into direct mapping. We only need to reserve the memory so it
> could not be reallocated for other things. Hm?
>

*If* we move this to generic code, we have to ensure that we don't
rely on x86 specific semantics. When parsing the EFI configuration
tables, other architectures don't have a complete direct map yet, as
they receive the memory description from EFI not from a translated
E820 map.

Note that this is only for getting the size of the reservation. Later
on, when we actually consume the contents of the bitmap, generic or
non-x86 code will need to use the ordinary memremap() API to map this
memory, and this amounts to a __va() call when the memory is already
mapped. But I am not suggesting changing that part for this series.
And even the hunk above can remain as you suggest - we can revisit it
once other architectures gain support for this.

The main thing I would like to avoid at this point in time is to add
new fields to struct bootparams that loaders such as GRUB may start to
populate as well - I don't think there is a very strong case for
pseudo-EFI boot [where GRUB calls ExitBootServices()] on confidential
VMs (as it prevents the EFI stub and the kernel from accessing the
measurement and attestation APIs), but let's not create more struct
bootparams based API if we can avoid it.
