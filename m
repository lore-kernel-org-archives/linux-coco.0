Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86DA4A20
	for <linux-coco@lists.linux.dev>; Mon, 18 Jul 2022 23:32:29 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id l11so23657676ybu.13
        for <linux-coco@lists.linux.dev>; Mon, 18 Jul 2022 16:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hfhcfJEtIEOv5/RbP8aWxiUol5MH91cRjA0pRO3p2Do=;
        b=E8GPGArYRequLjAGkGzJuo7mmPtrq2YvlPe8RRaQ8b8rHsTNcJ8RfueX4LgVDgm4aB
         iO9UmGQn2mkxNk75LsxjucgwIuj7WI7+50bQj4vRV7NWIgEJ25kU4RkKRLX/qW9+H+td
         SuNhtFNytaFKBe644W3MoZryHUqLCIcz8SW/Qqq/KlVak4gkMqO7GM9zsRXI2zoVgdTJ
         qc9r/Whf+qyeEeohUc+mvkoClakUllk5GMENmp9gPNkIv8k/q3mimTiabzRrUIC6nY4i
         ri43dSa+JABF0B+eibe17SQ0ixXgj6uuTesCdN0QN+7Ncsv70PQvaX9oxjrYuglZQD25
         Q/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hfhcfJEtIEOv5/RbP8aWxiUol5MH91cRjA0pRO3p2Do=;
        b=bcKlIqZYa1+IeV4IUmZQLXb2t8/uyjGVyRDmIneZsv0HPQu67t6FeQwFZyPfmBpGKC
         EkTejnwuha4/37IqjJ8pCyoapi7D68pICa3CUZ2p8Cgi8LqbN0sJGVtQYX3DFoAiYIJg
         8EWL+Dr6GAf7bmbNKn+dsuPqXRzGUEpIM5Mqw/GBkSIUuO9Qw3lomuf75Qu//LS+Pzxc
         ZsY/z5YYLDYWKsRNyu9hiARgfY6sAYk2qF7mUX08I+fS5qY+HlhYmDNWBNqZlaFf2JcD
         ucxHXi1E3aNHn75zaNIc9Rb8toYFUJ28Dc+1QULp+jpOCDhRG7XXK4ML6D6Csj4db2zS
         fkZA==
X-Gm-Message-State: AJIora8BgIFGkh9NNDW5uzsBpDhIct+G28IP+c0HVR23lGaf13R1G4tI
	6aF6aY7KU6v+b6S/v3YU8whlnJDA41xbwBwcYd98UQ==
X-Google-Smtp-Source: AGRyM1uDqGJkW/LK2CJC2GR49ze3EpqjvilYu7i365psCPTzr/cZIWgOxjMR3E5AbePYdQJr4Xq1laFNiwWUOrzg3oE=
X-Received: by 2002:a25:3b95:0:b0:66e:316c:159 with SMTP id
 i143-20020a253b95000000b0066e316c0159mr30295992yba.297.1658187148646; Mon, 18
 Jul 2022 16:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com>
 <20220627113019.3q62luiay7izhehr@black.fi.intel.com> <CAMj1kXHD5XBAS1aBjzg1RCeK6qgtanUSED_xyTZ0v1j+UShMKw@mail.gmail.com>
 <20220627122230.7eetepoufd5w3lxd@black.fi.intel.com> <CAMkAt6oJJaRM_dy=y2BP99VziPriVuA4jAmMc=G7njwJYKFgyg@mail.gmail.com>
 <CAMj1kXHpS2B9Q7AaQ1euGidZUEyR6gfi=e+t1J_Cr8bmK_9mTw@mail.gmail.com>
 <20220627223808.ihgy3epdx6ofll43@black.fi.intel.com> <CAMj1kXEdS9SzFZZ4WGH6sR0WDCOgYDZ3Geg6X2sqSnQ-CXXpZA@mail.gmail.com>
 <20220718172159.4vwjzrfthelovcty@black.fi.intel.com>
In-Reply-To: <20220718172159.4vwjzrfthelovcty@black.fi.intel.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 18 Jul 2022 16:32:17 -0700
Message-ID: <CAAH4kHYR+VkSJ5J8eWmeaEvstuRz_EuqVQqPfwmp5dhNGRyJwQ@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Dave Hansen <dave.hansen@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, 
	Marcelo Cerri <marcelo.cerri@canonical.com>, tim.gardner@canonical.com, 
	Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"

> I've talked with our firmware expert today and I think we have a problem
> with the approach when kernel declaries support of unaccepted memory.
>

Is this Jiewen Yao? I've been trying to design the UEFI spec change
with him. The bootloader problem he commented with this morning was
something I wasn't fully considering.

> This apporach doesn't work if we include bootloader into the picture: if
> EBS() called by bootloader we still cannot know if target kernel supports
> unaccepted memory and we return to the square 1.
>
> I think we should make it obvious from a kernel image if it supports
> unaccepted memory (with UTS_VERSION or other way).
>
> Any comments?

Is this binary parsing trick already used in EDK2? If not, I wouldn't
want to introduce an ABI-solidifying requirement like that.

A bit more cumbersome, but more flexible way to enable the feature is
an idea I had in a meeting today:
Make unaccepted memory support a feature-enabling EFI driver installed
to the EFI system partition.

* The first time you boot (setup mode), you install an EFI driver that
just sets a feature Pcd to true (using a custom protocol as Ard had
suggested above).
* The second time you boot, if the feature Pcd is true, then the UEFI
is free to not accept memory and use the unaccepted memory type. The
bootloader will run after unaccepted memory has been allowed already,
so there is no accept-all event.

The default behavior will be to accept all memory when GetMemoryMap is
called unless the feature pcd is set to true.

We can then say this driver isn't needed once some new generation of
this technology comes along and we can require unaccepted memory
support as part of that technology's baseline, or we manage to update
the UEFI spec to have GetMemoryMapEx which has unaccepted memory
support baked in and the bootloaders all know to use it.

The cloud experience will be, "is boot slow? Install this EFI driver
from the cloud service provider" to tell the UEFI to enable unaccepted
memory.

-- 
-Dionna Glaze, PhD (she/her)
