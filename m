Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9706D70
	for <linux-coco@lists.linux.dev>; Tue, 27 Jul 2021 01:36:11 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id n10so14020005plf.4
        for <linux-coco@lists.linux.dev>; Mon, 26 Jul 2021 18:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uqs7wPoYvjupDmvY95nIZzSlDX7z5THEkJjsxSRzknI=;
        b=W+35xInGw8KXJBZWRJ/K7EF5UdYYy1vvkTYzNVcc/wcu2dOUNGU8YhpulGClPtFEkv
         RF/kEAF7gVp7qZhsCN1NI+QuDpsN6HufxjjE+t7/jhcSFInRurnceAQ12phXfsiSlnNw
         d6KQEVDs7uL4kLb/ZxGuiYPrXNwKnmK6cocc9nSlpjwzSUAmXMTGTCKRFzYPgl79SnxH
         LjWbBLBtXGRkpdJdudHyTwsa3TC1//IrKweZuWnTDoBgGG/hcMn+O818FwoX/Pn9pvUr
         KuHHowQyJ4NarEwkTcNFCmDQRkjcloZR3BY9q+Lw10vguJOD4i+YviDY42xqiZL6WQll
         4yUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uqs7wPoYvjupDmvY95nIZzSlDX7z5THEkJjsxSRzknI=;
        b=RasITW6kQWQivDZ1RjVzYm3GxgB+4nwnlWm/seJTwBOcau0I4kjtG3tUUdNfStMG5M
         sdUtjRglZx8dTWX8XBXAcm7a5f58jIFHIpVyn0LTyePe1qbX53s4mhv23r43cDgEnPdm
         JW6qUl0gGvgW6QfY4Kuq8zwPLjBrouehmFu2gUN3POeki+VJCqC5BFUUZiYLZZIxxLPL
         WglSycnDOY/hkKdGeIeFWwtvZpMba3gwV++F8ANk8+agZti44q5L5r1u3iTexcOZs2lF
         oIejpi8ui3RL4SF2NdkQPJ8oXIQ+RSBf+mVUT0gGZEsZj93drIRXtgdEMH6/0+hie2oW
         tqVw==
X-Gm-Message-State: AOAM530ZgXXNTGJufy1gC4OMnBzf3DXvCGLTzen6Vo6vK8v5Xgd6umpx
	w/V5MOHFhzyor42CvL/oG3lgdmXDrbV0aQbiiTpT6w==
X-Google-Smtp-Source: ABdhPJwsP2Z3T6g5hCCArNcYzZAtZe7GOZfA7lwcFV/I3fLGXJd1x/V3I6FtrfzsSCx2k030rZSqM1+H0gCdtskHYsc=
X-Received: by 2002:a63:4446:: with SMTP id t6mr3417283pgk.76.1627349770708;
 Mon, 26 Jul 2021 18:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YPV27hDPZUoVsIZt@suse.de> <20210722195130.beazbb5blvj3mruo@box>
 <CAAYXXYxS2mK=AkqZDzG=k3=W4ChbYnwzo-hMLU8d6iusDpqXbQ@mail.gmail.com> <20210726235417.fuxa5s32jta76lcv@box.shutemov.name>
In-Reply-To: <20210726235417.fuxa5s32jta76lcv@box.shutemov.name>
From: Erdem Aktas <erdemaktas@google.com>
Date: Mon, 26 Jul 2021 18:35:59 -0700
Message-ID: <CAAYXXYyRKt88xJFFAqiN0xr3DHiBzxtSxDf7bLB9=FkZWwT95A@mail.gmail.com>
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

On Mon, Jul 26, 2021 at 4:54 PM Kirill A. Shutemov <kirill@shutemov.name> wrote:

> >
> > Is not the above code will accept the pages that are already accepted?
>
> No. This code will get called for all UNACCEPTED ranges in EFI table.
> If such memory is accepted it is a bug.
>
> > It is accepting the pages in the same 2MB region that is before start
> > and after end. We do not know what code/data is stored on those pages,
> > right? This might cause security issues depending on what is stored on
> > those pages.
>
> As I told above, it only get called for unaccepted memory and nothing can
> be stored there before the point.

Thanks Kirill! You are right, it looks like I messed up with
round_up/down in my mind. Thanks for the clarification.

> Yes, because we constructed the bitmap this way. Non-2M-aligned chunks get
> accepted when we accept upfront when we populate the bitmap.
>
> See mark_unaccepted().
>
> (mark_unaccepted() has few bugs that will be fixed in the next version)
>
> Have you looked at what __accept_pages() does? It only accept unaccepted
> pages, according to the bitmap.

Ahh, makes sense!
Thanks for the explanation and sorry for my confusion, Kirill!

-Erdem
