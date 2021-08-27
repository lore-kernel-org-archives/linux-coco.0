Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8A3FC3
	for <linux-coco@lists.linux.dev>; Fri, 27 Aug 2021 22:18:57 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id v123so6796640pfb.11
        for <linux-coco@lists.linux.dev>; Fri, 27 Aug 2021 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rd2j1K7U4hRg00mMM07NvFIy1Z4HrCM8V2x0jTRZdHc=;
        b=Ir0TCeJ/oEbBpLCFe3DigxZyeNESMUbjXWFtm1bmgt5YKV0hkbuJC3dJVW7OhLbAYW
         +CNFaoOcUPqHJVf9zdoevfwQEwaVfK040RXUOHFWgMWxLAAxp0xml+kSW7SHxsweEJe/
         BY2m5dfkHfvXcKceHJf0H659WAY7HhITZt8TS4NCzCeyZvTfTi5eOxTJx+fvAXfQbbF1
         D8C85ucITkf1U4rC+rnF1l6C9PW/QXV/LLiIF9IvfD89GiHBX5uwCUV1Ots0Oaq+XSpe
         mau9V6tRrcLxcPyKK2aQ/onBId9GLdt6RecXowjcw4UOBOUlt4xSmOyrjeeuhojAN0qF
         ixqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rd2j1K7U4hRg00mMM07NvFIy1Z4HrCM8V2x0jTRZdHc=;
        b=SWJbzMCFgjuidrRbCmuWunnrkg7SxO3Z0eDLozCi2l1aku1qxcywU7n/Ic0CFf2oom
         EdSCorO8hd7Rr0szbF671KFkmVo6Knb5F/a2Y8RvWPyeu/C9YwB46Eq3CHXpPacmMVLm
         OTo/cJyuWWiLPhUBo2IAZNyXrwzbBMPyeEsyKaLkfHAxqZpHb3UGx4bKaZXtF3wmP2bS
         /xWsPIkxQ9+0OKlJiXe3bOfrc47f/qwUt+Km8GREnpf+MqqXMner9gTXKq8KRXAahW8h
         TF0sNB26U2iK/R5mYHxIJX9+wd3H53uaAksAYML8U+77LL5jk2Mx2MHK0fpys3Lm45u9
         aP9g==
X-Gm-Message-State: AOAM532gv8LPl9Z6QzJCGfW8A5+j55bHXdEA7485NJu7uumvst2d/d5k
	pLBTOtKa2wa0GQCSf5XCATkBCg==
X-Google-Smtp-Source: ABdhPJzuJP6dIT72j2d/aCBLY9krrtGRa2afNkv9q820gAKetasQmVhVHa+tvbyJjtZXZL8dDZGGhg==
X-Received: by 2002:a62:6007:0:b029:3cd:e67a:ef9e with SMTP id u7-20020a6260070000b02903cde67aef9emr11198834pfb.72.1630102736650;
        Fri, 27 Aug 2021 15:18:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id q1sm6782229pfj.132.2021.08.27.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 15:18:56 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:18:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest
 private memory
Message-ID: <YSlkzLblHfiiPyVM@google.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>

On Thu, Aug 26, 2021, David Hildenbrand wrote:
> You'll end up with a VMA that corresponds to the whole file in a single
> process only, and that cannot vanish, not even in parts.

How would userspace tell the kernel to free parts of memory that it doesn't want
assigned to the guest, e.g. to free memory that the guest has converted to
not-private?

> Define "ordinary" user memory slots as overlay on top of "encrypted" memory
> slots.  Inside KVM, bail out if you encounter such a VMA inside a normal
> user memory slot. When creating a "encryped" user memory slot, require that
> the whole VMA is covered at creation time. You know the VMA can't change
> later.

This can work for the basic use cases, but even then I'd strongly prefer not to
tie memslot correctness to the VMAs.  KVM doesn't truly care what lies behind
the virtual address of a memslot, and when it does care, it tends to do poorly,
e.g. see the whole PFNMAP snafu.  KVM cares about the pfn<->gfn mappings, and
that's reflected in the infrastructure.  E.g. KVM relies on the mmu_notifiers
to handle mprotect()/munmap()/etc...

As is, I don't think KVM would get any kind of notification if userpaces unmaps
the VMA for a private memslot that does not have any entries in the host page
tables.   I'm sure it's a solvable problem, e.g. by ensuring at least one page
is touched by the backing store, but I don't think the end result would be any
prettier than a dedicated API for KVM to consume.

Relying on VMAs, and thus the mmu_notifiers, also doesn't provide line of sight
to page migration or swap.  For those types of operations, KVM currently just
reacts to invalidation notifications by zapping guest PTEs, and then gets the
new pfn when the guest re-faults on the page.  That sequence doesn't work for
TDX or SEV-SNP because the trusteday agent needs to do the memcpy() of the page
contents, i.e. the host needs to call into KVM for the actual migration.

There's also the memory footprint side of things; the fd-based approach avoids
having to create host page tables for memory that by definition will never be
used by the host.
