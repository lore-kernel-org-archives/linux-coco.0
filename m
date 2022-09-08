Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD33D3D65
	for <linux-coco@lists.linux.dev>; Thu,  8 Sep 2022 16:23:20 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id go34so4242519ejc.2
        for <linux-coco@lists.linux.dev>; Thu, 08 Sep 2022 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bdMeN6FnqK1npcK6VCQhFv3779r/x2/CSa4ry5MamXU=;
        b=jM4kqEGLo0x4c9SugkK2RZKbi8J75NwCzwL+WzDAvgOr3Awyy2M5reAUlyKUIwSmVQ
         J9BI623JbDsn4hxWXBzGM83644hklSb/eJHFal/qOnvs0cA5VWs+JZrHroKPGVlfzABE
         QM900Eal8QIX1v9trvzd3GY/4kUfcnb02cpp+9UP+vtuyX7zS4gRkhFcNNcpX4EOp1t5
         KVrLCi1YIyLUM44gXELwOOnu8pLYGYFBJo7roHRlNiMDIxL9Nd9BiMUzAjSEqOPoCp7r
         BJxtczTXopJ0WpmOUI5eQgMgYSP427DqVjx3c6Ov43PItJTNHC8ZNQdB7GqzQYkfhnxz
         qxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bdMeN6FnqK1npcK6VCQhFv3779r/x2/CSa4ry5MamXU=;
        b=fkQamxw/dR/kjqMYkccz2FUWUYjDmYpP05AgrYf3g46ex0DqzFGFOFeL/OPdjYUlRY
         feZnB8ylOb3vptIkzE6Ezo5qD9yU24DmrXByxbIYxe4xebqIBBUfZy+oMC9eziinzZuM
         A5scUFhT0Kyova0SomnWgKGr8jspTRvvm+xxDY9eo/EM4sCfXHnZeZmSxCI38UrJKTW1
         mH5VupfbP+WCmiGwv/D0On57mRoO0Y7PExLnTYfpnCmKy0xjuMlh3a3cY5lmwIQzbMe7
         zUeSUdIZesJGx04Yv8bOFnCRhXPrQyp1EN7uzEAEnJeZztndxgxel2DGwLih42l99oZ1
         PdVA==
X-Gm-Message-State: ACgBeo1TKem1ezBN1GkwZZRn0NftZSUa1vs1J2GvRWaY9+KRiDX5PJBM
	+M7Fif0F0F7uGZ8LuuGPcdWTXPq801sTi2SPBBm7BA==
X-Google-Smtp-Source: AA6agR5TviwaWPrrPIjyGF6zpvI4oDr1TURdLxrCAE9HpPDgDYml5qDeUiGF2d+s09eD9ex7BL2ntp4DzywuHlwtCbg=
X-Received: by 2002:a17:907:948f:b0:770:639:fbd1 with SMTP id
 dm15-20020a170907948f00b007700639fbd1mr6304073ejc.255.1662654198886; Thu, 08
 Sep 2022 09:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-3-kirill.shutemov@linux.intel.com> <8cf143e7-2b62-1a1e-de84-e3dcc6c027a4@suse.cz>
 <20220810141959.ictqchz7josyd7pt@techsingularity.net> <CAAH4kHa6s3sBRySNu-TZG_6vOaN4KheVy4kvxG5s=wOTDGy2=Q@mail.gmail.com>
 <2981e25e-9cda-518a-9750-b8694f2356b5@amd.com> <CAAH4kHbcfnVWNQHf6Mrg__bSFT6196Sx4kno6o0Zo7hsgOgnNw@mail.gmail.com>
 <984e07ed-914f-93ca-a141-3fc8677878e0@intel.com> <CAAH4kHawguTEuDVyz1ysSbH0X_mT=SvxLi=UhwEzXM0abbWefg@mail.gmail.com>
 <YxncAElGrPEGRYg1@linux.ibm.com>
In-Reply-To: <YxncAElGrPEGRYg1@linux.ibm.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 8 Sep 2022 09:23:07 -0700
Message-ID: <CAAH4kHaP8JUh0Z4rF83=2RZTGMATT5MHot6rAnAwt79PL64mVQ@mail.gmail.com>
Subject: Re: [PATCHv7 02/14] mm: Add support for unaccepted memory
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Marcelo Cerri <marcelo.cerri@canonical.com>, 
	tim.gardner@canonical.com, Khalid ElMously <khalid.elmously@canonical.com>, 
	philip.cox@canonical.com, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> Looks like the first access to the memory map fails, although I think
> it's not in INIT_LIST_HEAD() but rather in init_page_count().
>
> I'd start with making sure that page_alloc::memmap_alloc() actually returns
> accepted memory. If you build kernel with CONFIG_DEBUG_VM=y the memory map
> will poisoned in this function, so my guess is it'd crash there.
>

That's a wonderful hint, thank you! I did not run this test
CONFIG_DEBUG_VM set, but you think it's possible it could still be
here?

> --
> Sincerely yours,
> Mike.



-- 
-Dionna Glaze, PhD (she/her)
