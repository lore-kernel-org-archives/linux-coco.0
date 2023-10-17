Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35F0171C5
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 07:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5VTK9MM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C2FC433AD
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697528547;
	bh=hdERecnIBxJ0MlSI/qFnbuDT7jHHTRqnpZ2J8bhRs0A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t5VTK9MMoMSJ3wX9+6eF0H/8lC2QsDGUqK28ldXbXW9Njmzz/FUgzjlx/PEEfUfBA
	 EhNnfC+JALb1lxrXTE9UUk/dVoj9A1gk95MvCZ81oHI+2QuEnyB8PfhMVZwFj4WyVb
	 iahiCAWxzYnIjK8QJWv7ArhAC6VP8Bqjg5VnGRQ4Hs6Vwk3lNiy8XpZTfrDBhzk73y
	 d/KjfWNHP0ZTXF3jVt4ymT59O0dVfkbzVmem47c/xy/2XLT6DlVmq5JCwqcQ6UzWVE
	 L4Juf6ZPvErTWUwTwU3EFs+jzw0Xd2sGdZfoUM3V/cjeGrDitLtv/xAzNQv18XpTRc
	 Yhp5bFnFwAPMg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c50d1b9f22so40111151fa.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 00:42:27 -0700 (PDT)
X-Gm-Message-State: AOJu0YzvCe3i5XnTIhHtM5JGhWxZMvGG7zQgthe9jYb++G1bJxW4SEGD
	Hqb50sGXcnFks1/RHd7lDVjTgjs04UVQAD/pPR8=
X-Google-Smtp-Source: AGHT+IEwVz4NDJ+en2GCL5MEQcrrYTlDDUj+7INXdoXGL9jUkM8pjO/KAi249rHEfWTo3BmUUzUFvmwTpf7MTxrcuFo=
X-Received: by 2002:a2e:9c09:0:b0:2c5:19ab:7270 with SMTP id
 s9-20020a2e9c09000000b002c519ab7270mr1010729lji.35.1697528545373; Tue, 17 Oct
 2023 00:42:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016163122.12855-1-kirill.shutemov@linux.intel.com>
 <ZS15HZqK4hu5NjSh@casper.infradead.org> <20231016213932.6cscnn6tsnzsnvmf@box.shutemov.name>
In-Reply-To: <20231016213932.6cscnn6tsnzsnvmf@box.shutemov.name>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 17 Oct 2023 09:42:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFc31N61=oQayLbnR+CrNT4=bfEisC3fwG4VNq2vJHV5w@mail.gmail.com>
Message-ID: <CAMj1kXFc31N61=oQayLbnR+CrNT4=bfEisC3fwG4VNq2vJHV5w@mail.gmail.com>
Subject: Re: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel
 memory acceptance
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, 
	marcelo.cerri@canonical.com, tim.gardner@canonical.com, 
	philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com, 
	x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Oct 2023 at 23:39, Kirill A. Shutemov
<kirill.shutemov@linux.intel.com> wrote:
>
> On Mon, Oct 16, 2023 at 06:55:41PM +0100, Matthew Wilcox wrote:
> > On Mon, Oct 16, 2023 at 07:31:22PM +0300, Kirill A. Shutemov wrote:
> > >   v2:
> > >    - Fix deadlock (Vlastimil);
> > >    - Fix comments (Vlastimil);
> > >    - s/cond_resched()/cpu_relax()/ -- cond_resched() cannot be called
> > >      from atomic context;
> >
> > Isn't there an implicit cpu_relax() while we're spinning?  Does this
> > really accomplish anything?
>
> You are right. It is useless. I will drop it in v3.
>

I can drop that bit when applying the patch.

One question I have is whether the sequence

spin_lock_irqsave(&unaccepted_memory_lock, flags);
...
spin_unlock(&unaccepted_memory_lock);
arch_accept_memory(phys_start, phys_end);
spin_lock(&unaccepted_memory_lock);
...
spin_unlock_irqrestore(&unaccepted_memory_lock, flags);

is considered sound and is supported by all architectures?
