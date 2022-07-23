Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABC7E
	for <linux-coco@lists.linux.dev>; Sat, 23 Jul 2022 11:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F419C341D6
	for <linux-coco@lists.linux.dev>; Sat, 23 Jul 2022 11:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658574859;
	bh=unUMya6BPYpKOwprp7McozAEYE9y437U/0E90Qn/PR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Idm4+tMyOetJHMHm/JAVCocTOpDhH/4+H8/qgaG+NFgUICBZPSdxOWI37JM3gj4jD
	 V/OvQrda6hV48GHEYYyJr2xsCS8G0WxITIICAUzHNOeUZHGM8byaEfem/GklOYd5gH
	 JvghH3cTxQxj28q6wqE6BgHdL5BWoCOKeQD8R3DFh9Y9y2hrqspCAFre0Q7odymkit
	 PbfzEelwOOQoCJa+SsljsBScBGvZh0aG6+dBH7mGbVmOQ0OV1xq+h5inC3QVGFjkIl
	 B3CNOrcxJO9NYFM0Lzb9ojZddR7wJ5tbrspEtad7+ovslybBfnYDXxmHSdkrls8L8o
	 /yiwejtDXqhMA==
Received: by mail-ot1-f42.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso5130000otb.6
        for <linux-coco@lists.linux.dev>; Sat, 23 Jul 2022 04:14:19 -0700 (PDT)
X-Gm-Message-State: AJIora+rFV0blEg2rXZY0AwbwVRzO8J/pN+/AT7JNo1IbOZN/kABqloo
	poN3A0RI/qbDfGFw/TDflHP7aM8Gz2GqVPMpW04=
X-Google-Smtp-Source: AGRyM1toSHzLLGvC9FLzuNt3t1myK6Yjo1zRCx/Yq65wM9j6V/TSj8mKNgSzLkZMi7xH4yhMSuJHvm32vnmmswjz4II=
X-Received: by 2002:a05:6830:441f:b0:61c:a5bb:9c6a with SMTP id
 q31-20020a056830441f00b0061ca5bb9c6amr1524623otv.265.1658574858208; Sat, 23
 Jul 2022 04:14:18 -0700 (PDT)
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
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com> <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com>
In-Reply-To: <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 23 Jul 2022 13:14:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
Message-ID: <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Dave Hansen <dave.hansen@intel.com>
Cc: Marc Orr <marcorr@google.com>, Borislav Petkov <bp@alien8.de>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Peter Gonda <pgonda@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
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

On Thu, 21 Jul 2022 at 19:13, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 7/19/22 17:26, Marc Orr wrote:
> > - Dave's suggestion to "2. Boot some intermediate thing like a
> > bootloader that does acceptance ..." is pretty clever! So if upstream
> > thinks this FW-kernel negotiation is not a good direction, maybe we
> > (Google) can pursue this idea to avoid introducing yet another tag on
> > our images.
>
> I'm obviously speaking only for myself here and not for "upstream" as a
> whole, but I clearly don't like the FW/kernel negotiation thing.  It's a
> permanent pain in our necks to solve a very temporary problem.

EFI is basically our existing embodiment of this fw/kernel negotiation
thing, and iff we need it, I have no objection to using it for this
purpose, i.e., to allow the firmware to infer whether or not it should
accept all available memory on behalf of the OS before exiting boot
services. But if we don't need this, even better.

What I strongly object to is inventing a new bespoke way for the
firmware to make inferences about the capabilities of the image by
inspecting fields in the file representation of the image (which is
not guaranteed by EFI to be identical to its in-memory representation,
as, e.g., the PE/COFF header could be omitted by a loader without
violating the spec)

As for the intermediate thing: yes, that would be a valuable thing to
have in OVMF (and I will gladly take EDK2 patches that implement
this). However, I'm not sure how you decide whether or not this thing
should be active or not, doesn't that just move the problem around?
