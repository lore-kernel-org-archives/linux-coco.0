Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A97B7A
	for <linux-coco@lists.linux.dev>; Thu, 28 Jul 2022 22:02:05 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id y127so5401901yby.8
        for <linux-coco@lists.linux.dev>; Thu, 28 Jul 2022 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KKJMz2p0fMbqbmhUA2NRK8taNgQHWFCPCykk0R/nVkQ=;
        b=BIAqjFwuvscZyaQvaO2Pp5Tm2K8Fcr9ETnXvpU5e3wVsse21Jc6+b/sSURRzcM4QRX
         f+AUZdMnE7et9mw5oGUM8bOIP7AqPCPEFZ5JFqKRH4odWmwDZ0FjP8rMMLUG8y3aCwAh
         lwgedBwQkhfs5enr6DiCZ/gKqdYfyYsGa6781lN44ppqnMvdnKWZaI1L0KYuIh0w3h/W
         Ex4VAWe01YlKol56ws7q0/gUwiDhufvbMAS97qfg8YmOtZ7iNvuxcaVvr0OuapoWpqSG
         zk5SMyBnMxjyNUeOtF5G284TFqrCbKyKwnrUsp1SvrzycKfu/wMWOIfliAogPsiP7m2l
         e2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KKJMz2p0fMbqbmhUA2NRK8taNgQHWFCPCykk0R/nVkQ=;
        b=pDL+CNqnAfxk9m6FK5+qFF8yJMmFQsDrEJsnC/rT/QcAdCEgElRn8VGObfraUx2231
         JORm7Qy6zQOrHjTclnPwitRYJWkdOfGo908H4tfmzICWNx7hx4qTTVLCblIMhk+XJf0n
         9PJEoQwqzjnw2q1o9JR0DlZB9obg2LXyW4ecokWmdxmwcujr0GuZJuCM8iakeqlM3VqS
         9J8INIwn9aSvnzfDmFTU+42WDFYxufuNvpxnea9DTKpYe3/8XCuLN+b4nRRe3sJOyA6f
         2nnaYfItmZSvR5wDxDwAqfxtrMRZAAmYaF16wGCovFB5iMxqq3vOKnYKP+7+fgTsgKzg
         DVzg==
X-Gm-Message-State: ACgBeo3B0MItKd96GGFT/omi2ZFTTfn1cb37RjiaTpfOLs/VqKsGhKCp
	kuSngzFaYPo3hKl2QJnacHbyQkzs9bET1PBJFP+HaA==
X-Google-Smtp-Source: AA6agR6CsM1GKbxoIN8NWcO7GQfLofiour4J2FuUY6Juif22kb1aJ6rJGRSLyGPjmgf+UOW6vfxySZ2NKkNcgLC9zMk=
X-Received: by 2002:a05:6902:128d:b0:670:9009:f859 with SMTP id
 i13-20020a056902128d00b006709009f859mr549949ybu.321.1659045723977; Thu, 28
 Jul 2022 15:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220627223808.ihgy3epdx6ofll43@black.fi.intel.com>
 <CAMj1kXEdS9SzFZZ4WGH6sR0WDCOgYDZ3Geg6X2sqSnQ-CXXpZA@mail.gmail.com>
 <20220718172159.4vwjzrfthelovcty@black.fi.intel.com> <CAAH4kHYR+VkSJ5J8eWmeaEvstuRz_EuqVQqPfwmp5dhNGRyJwQ@mail.gmail.com>
 <CAAH4kHaHJo4NUb72tHeica4a34hq5u_QP6d6Vuzngf6EqTJ8Aw@mail.gmail.com>
 <CAAH4kHaB2tL+sAn0NAciu5DQeX5hpNkDees=n=f83S=Ph9Y6tw@mail.gmail.com>
 <YtcCWfCQuEsVhH6W@zn.tnic> <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic> <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic> <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
 <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com> <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
In-Reply-To: <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 28 Jul 2022 15:01:52 -0700
Message-ID: <CAAH4kHYGZ179eYREi-YcYNd4Xd8gTPa2WX0iphr=Kiz6-A7hnQ@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Marc Orr <marcorr@google.com>, 
	Borislav Petkov <bp@alien8.de>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Peter Gonda <pgonda@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Marcelo Cerri <marcelo.cerri@canonical.com>, 
	tim.gardner@canonical.com, Khalid ElMously <khalid.elmously@canonical.com>, 
	philip.cox@canonical.com, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"

>
> What I strongly object to is inventing a new bespoke way for the
> firmware to make inferences about the capabilities of the image by
> inspecting fields in the file representation of the image (which is
> not guaranteed by EFI to be identical to its in-memory representation,
> as, e.g., the PE/COFF header could be omitted by a loader without
> violating the spec)
>
> As for the intermediate thing: yes, that would be a valuable thing to
> have in OVMF (and I will gladly take EDK2 patches that implement
> this). However, I'm not sure how you decide whether or not this thing
> should be active or not, doesn't that just move the problem around?

This does just move the problem around, but it makes correct behavior
the default instead of silently ignoring most of the VM's memory and
booting regularly. I have the driver mostly written to change the
behavior to accept all by default unless a driver has been installed
to set a particular boolean to make it not. Still that's yet another
thing as you say.

I agree with everyone that this situation just stinks. "Can't you just
boot it?" was asked before, and yes we can, but at the scale of a CSP
managing anybody's image uploads, that not-insignificant cost has to
be paid by someone. It's a hard problem to route the image to the
right kind of machine that's expected to be able to run it... it's a
big ol' mess.

One thing is for sure: these patches shouldn't be blocked by the "how
do we detect it" question. I'm glad to see so much engagement with
this problem, but I fear I might have delayed its progress towards a
merge. I know AMD has a follow-up to add SEV-SNP accept_memory support
to finish this all up.

I'll try to get the ear of all the distributions that are tracking
towards providing SEV-SNP-supported images for CSPs to get them on the
release that includes these patches. I'll also see about upstreaming
that EFI driver and EDK2 changes in case there's a slip in the kernel
release and we need this workaround.
--
-Dionna Glaze, PhD (she/her)
