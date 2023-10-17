Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F335D27EC3
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a02DY55D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A0AC433D9
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697557003;
	bh=zQqT0Icijbvg9S6mB1pNR2Pch3/DSe5rsPVyjDgEit0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a02DY55Dh1N3RncpLznmFnEklwXDgdJqCFix7A8TuEQgcMLambAx1NdmGxsg8+6BF
	 p2GKMqmgFe3vHsPlfOt6rzwf0LKLL0zDGRFLPeuJ1JcNFHKgeQpwceun8HOISVgehM
	 pxbyWSXEt2cVB1Dlir92Cow1MS04UhtikZEjl0d2y/8qt6ieP26pLYbq2MyWHJPx9x
	 3pMNY+ORuwqRcSH5Rsfba/nVAxYoBF1y3TU9/S6LDSXUcPtFRDk1Eb7Zkhqvf+iVEx
	 AKu2m3WQZXmCkAZAtVp7vOXydZERSm8EW0flkgI49ZSjvKNJO0pKp9SZujF7Wm1zWF
	 0BOS0s4IRViJQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso55355061fa.1
        for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 08:36:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YxTMWbgx9UFaEqCFqabSaomZEe85TEicX8TJFEPqg0h1JXcvWko
	ymIBBDzavF7klVLNqaOdCCtQjPg+Kx9Xex1vNyw=
X-Google-Smtp-Source: AGHT+IH1t58amR8j4KHDACRp4HQeTt/uvBDMgRckb8/zaW4G8A+1S1h459+WQLX6wkrSospqRbyURn70I8/18qMTnKA=
X-Received: by 2002:a05:651c:54f:b0:2c5:21e3:f1fb with SMTP id
 q15-20020a05651c054f00b002c521e3f1fbmr2210135ljp.23.1697557001696; Tue, 17
 Oct 2023 08:36:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016163122.12855-1-kirill.shutemov@linux.intel.com>
 <ZS15HZqK4hu5NjSh@casper.infradead.org> <20231016213932.6cscnn6tsnzsnvmf@box.shutemov.name>
 <CAMj1kXFc31N61=oQayLbnR+CrNT4=bfEisC3fwG4VNq2vJHV5w@mail.gmail.com> <20231017101717.GJ33217@noisy.programming.kicks-ass.net>
In-Reply-To: <20231017101717.GJ33217@noisy.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 17 Oct 2023 17:36:30 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFrM_fe5dVrOPoXDm4AW6oX-a6jCVTnO8bjKuvq-cZRuQ@mail.gmail.com>
Message-ID: <CAMj1kXFrM_fe5dVrOPoXDm4AW6oX-a6jCVTnO8bjKuvq-cZRuQ@mail.gmail.com>
Subject: Re: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel
 memory acceptance
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, 
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>, 
	marcelo.cerri@canonical.com, tim.gardner@canonical.com, 
	philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com, 
	x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Oct 2023 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 17, 2023 at 09:42:13AM +0200, Ard Biesheuvel wrote:
>
> > One question I have is whether the sequence
> >
> > spin_lock_irqsave(&unaccepted_memory_lock, flags);
> > ...
> > spin_unlock(&unaccepted_memory_lock);
> > arch_accept_memory(phys_start, phys_end);
> > spin_lock(&unaccepted_memory_lock);
> > ...
> > spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
> >
> > is considered sound and is supported by all architectures?
>
> Yes.

Thanks for the clarification

I've queued this up now (with the cpu_relax() removed)
