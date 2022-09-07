Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CED7E
	for <linux-coco@lists.linux.dev>; Wed,  7 Sep 2022 05:14:22 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3376851fe13so116325957b3.6
        for <linux-coco@lists.linux.dev>; Tue, 06 Sep 2022 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XvX4d4lHGdhmKH0oBQwXf1eY3JxPJlcnylOzEMhTpjw=;
        b=HDlMGE1Dtzvgl4sx6psOG95eCP5fJubOQx5rXOyJx1TDazhk2aqRufACacOJcEYT0r
         osZ3Lo1Z8fPPZoaylkaghbAM0BQaZlBz1gP+hMcBo5QZ8uGeCzStYKrifJmkD25k/DiH
         lr7m3LWSVEvxQsKpef0k4kDU4xiwqz9lTMxviETiwgfIWuISK2zTacUHozdB4J3nXS9e
         F9TMLHMGlC1abNichKH/KwH+iUF/G7XgcKsT6byuUtzTCS35n5mgoqQHWBIs3qPwr01+
         aBahQ5C+5fH4hUaf2XYXq92ziiDceVipoSwAWu2HLa44wmTacL94ihW+OhBWGzAAfqfC
         QwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XvX4d4lHGdhmKH0oBQwXf1eY3JxPJlcnylOzEMhTpjw=;
        b=WXHLCjOBxNa+/c97jRbHOieqE7tGKInTCeR3BcJxPRfWSSdLVgLZrjSne5BnOdkOKS
         TIYenassbVm+9WIxnnbXUIOqsrAVBXJpCmcvXI0wvRUjrWiN8xAoE73Htmxg08abCxjO
         354kHIxbFCY344okV2gQY9HP2GDLxc0mCWD7yD7S1IjR5U0MVwb2yUDwkf7p17itt1d1
         FW99ZNPW/KIlpLS7l5tFRITtQ9shWQ7GLrVRGU6Hownd4YeSB9UT4OMwCEA1hSSx7bOp
         Z6DwMSV/KiTwqmdBqr3lcYlIkAZ0Xup2OsOkIFH4YccjcebqwCizSRr7Yxn0gdyw/Q6U
         NH/Q==
X-Gm-Message-State: ACgBeo027L3muvLJ7niRuuHkMNgXWDBjRWcc0oOUDoJfao6zUlNsLwLV
	s3zo1jKZkHohsECzFqoMNQeFVZLxyQLONuz7WaGSkw==
X-Google-Smtp-Source: AA6agR4QILULoRsfdqtrSc/wO0dJ6FfgSjfGPULmGUF02/SC0+lfUh/gUzPfZ6OXZMwCh+VWaeeVJ4k7hm0bh5AhRgc=
X-Received: by 2002:a81:66c5:0:b0:345:3b1c:26 with SMTP id a188-20020a8166c5000000b003453b1c0026mr1857526ywc.156.1662527661285;
 Tue, 06 Sep 2022 22:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <0ecb0a4781be933fcadeb56a85070818ef3566e7.1655761627.git.ashish.kalra@amd.com>
 <YvKRjxgipxLSNCLe@zn.tnic> <YxcgAk7AHWZVnSCJ@kernel.org> <CAA03e5FgiLoixmqpKtfNOXM_0P5Y7LQzr3_oQe+2Z=GJ6kw32g@mail.gmail.com>
 <SN6PR12MB2767ABA4CEFE4591F87968AD8E7E9@SN6PR12MB2767.namprd12.prod.outlook.com>
 <20220906150635.mhfvtl2xgdbzr7a5@amd.com> <SN6PR12MB276774A14FEBFF4E98AC07238E7E9@SN6PR12MB2767.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB276774A14FEBFF4E98AC07238E7E9@SN6PR12MB2767.namprd12.prod.outlook.com>
From: Marc Orr <marcorr@google.com>
Date: Tue, 6 Sep 2022 22:14:10 -0700
Message-ID: <CAA03e5ETjW-apRwDa-27YrcLUPy_QxJXu9zDKWOBHa1ZVJUfwg@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 09/49] x86/fault: Add support to handle the RMP
 fault for user address
To: "Kalra, Ashish" <Ashish.Kalra@amd.com>
Cc: "Roth, Michael" <Michael.Roth@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	"Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sergio Lopez <slp@redhat.com>, 
	Peter Gonda <pgonda@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alper Gun <alpergun@google.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> >> >But I believe Jarkko's version calculates the correct mask (below), incorporating all 18 offset bits into the 1G page.
> >> >>> hex(262144 -1)
> >> >'0x3ffff'
> >>
> >> We can get this simply by doing (page_per_hpage(level)-1), but as I mentioned above this is not what we need.
>
> >If we actually want the 4K page, I think we would want to use the 0x3ffff mask as Marc suggested to get to the specific 4K RMP entry, which I don't think the current code is trying to do. But maybe that *should* be what we should be doing.
>
> Ok, I agree to get to the specific 4K RMP entry.

Thanks, Michael, for a thorough and complete reply! I have to admit,
there was some nuance I missed in my earlier reply. But after reading
through what you wrote, I agree, always going to the 4k-entry to get
the "assigned" bit and also leveraging the implementation of
snp_lookup_rmpentry() to lookup the size bit in the 2M-aligned entry
seems like an elegant way to code this up. Assuming this suggestion
becomes the consensus, we might consider a comment in the source code
to capture this discussion. Otherwise, I think I'll forget all of this
the next time I'm reading this code :-). Something like:

/*
 * The guest-assigned bit is always propagated to the paddr's respective 4k RMP
 * entry -- regardless of the actual RMP page size. In contrast, the RMP page
 * size, handled in snp_lookup_rmpentry(), is indicated by the 2M-aligned RMP
 * entry.
 */
