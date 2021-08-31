Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C92F80
	for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 21:54:48 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 18so420988pfh.9
        for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LIxRXgEk8FNbTmaJMmt8rW9Sj/BRMxAhjO20Z8xJZ2Q=;
        b=cvf+6KfK0r5oQ5VIfV+N1hqu/BL1A0P159QHFVFCzhP/Whc2l7X/x2W5ZKh/jNSZTl
         odIUJSXKTEDs83be7mqQWNr6xG+hVGpg0r7KTqxGa2EXXh1kxPO5Oh065tyHvtI88Ivz
         lm2JyKQTP0pnWtq1JhuD8rZSHvVcigBdEoH1ab6lajCt9UyOi60zfhmuPD5bBrTAjRsx
         j5FeewIS19M3+EQT27Tokvc+CM8eSw67m13I+K8pFd/dlNlMo5A/kUtX/Prady1zJCkx
         v5NfzZ9EO5pmmsdiPdAp+qqpAniR8n4L4QkEgbMXeg+GyntpZAwtiJmCiFSDpaw0ovRz
         1Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LIxRXgEk8FNbTmaJMmt8rW9Sj/BRMxAhjO20Z8xJZ2Q=;
        b=HkoIB7qPUgTtZ+RNIq0b/Q3E6CuK7aZBWXg5l1e5cTBE/rQGYkY4f+72rEZFN89YQW
         aeRz8FV/M7aszqmmXSi4aGzQwBmprn6NcmGY0bl3HBxsyTa5Ti1zEVmBygIlO6+1xhVQ
         zodvgNyjg6NHyh4dlPyC8OPG8SMXme6s/NVGUSm8jntRvco5nd44S1KlHwzTwbR/sA1y
         XjpqQBdtvjiHGcC1AIbzQzQHtZMAiG1ejGLbzdc2szAm4HzsNyL1cf6kyYmdpGqLHRs7
         At5YvFNyvOFcjB6O8jq74/XV2GuqS8y4mckSn7mEH2mql/GRCDNkqlzAPRmzWoYbYPWW
         9hrw==
X-Gm-Message-State: AOAM533EFbX6F4cgXi9skwAIIbwMgXw+vvTQqWDx8SgWylYZcSL4LMqe
	2W9LKWHHdNgtQrKlGD1A7tAjiw==
X-Google-Smtp-Source: ABdhPJx3rLis08O1l9dSpQL+UFQG8hxZXFpWkLCsNEa5eWHW1V+ryVw+G1jS50fHj2Eq268+2LrI6g==
X-Received: by 2002:a05:6a00:22d2:b0:3eb:b41:583 with SMTP id f18-20020a056a0022d200b003eb0b410583mr30779487pfj.73.1630446887341;
        Tue, 31 Aug 2021 14:54:47 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id c68sm3154996pfc.150.2021.08.31.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 14:54:46 -0700 (PDT)
Date: Tue, 31 Aug 2021 21:54:42 +0000
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
Message-ID: <YS6lIg6kjNPI1EgF@google.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
 <YSlkzLblHfiiPyVM@google.com>
 <61ea53ce-2ba7-70cc-950d-ca128bcb29c5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61ea53ce-2ba7-70cc-950d-ca128bcb29c5@redhat.com>

On Tue, Aug 31, 2021, David Hildenbrand wrote:
> On 28.08.21 00:18, Sean Christopherson wrote:
> > On Thu, Aug 26, 2021, David Hildenbrand wrote:
> > > You'll end up with a VMA that corresponds to the whole file in a single
> > > process only, and that cannot vanish, not even in parts.
> > 
> > How would userspace tell the kernel to free parts of memory that it doesn't want
> > assigned to the guest, e.g. to free memory that the guest has converted to
> > not-private?
> 
> I'd guess one possibility could be fallocate(FALLOC_FL_PUNCH_HOLE).
> 
> Questions are: when would it actually be allowed to perform such a
> destructive operation?

From the kernel's perspective, userspace is allowed to perform destructive
operations at will.  It is ultimately the userspace VMM's responsibility to not
DoS the guest.

> Do we have to protect from that? How would KVM protect from user space
> replacing private pages by shared pages in any of the models we discuss?

The overarching rule is that KVM needs to guarantee a given pfn is never mapped[*]
as both private and shared, where "shared" also incorporates any mapping from the
host.  Essentially it boils down to the kernel ensuring that a pfn is unmapped
before it's converted to/from private, and KVM ensuring that it honors any
unmap notifications from the kernel, e.g. via mmu_notifier or via a direct callback
as proposed in this RFC.

As it pertains to PUNCH_HOLE, the responsibilities are no different than when the
backing-store is destroyed; the backing-store needs to notify downstream MMUs
(a.k.a. KVM) to unmap the pfn(s) before freeing the associated memory.

[*] Whether or not the kernel's direct mapping needs to be removed is debatable,
    but my argument is that that behavior is not visible to userspace and thus
    out of scope for this discussion, e.g. zapping/restoring the direct map can
    be added/removed without impacting the userspace ABI.

> > > Define "ordinary" user memory slots as overlay on top of "encrypted" memory
> > > slots.  Inside KVM, bail out if you encounter such a VMA inside a normal
> > > user memory slot. When creating a "encryped" user memory slot, require that
> > > the whole VMA is covered at creation time. You know the VMA can't change
> > > later.
> > 
> > This can work for the basic use cases, but even then I'd strongly prefer not to
> > tie memslot correctness to the VMAs.  KVM doesn't truly care what lies behind
> > the virtual address of a memslot, and when it does care, it tends to do poorly,
> > e.g. see the whole PFNMAP snafu.  KVM cares about the pfn<->gfn mappings, and
> > that's reflected in the infrastructure.  E.g. KVM relies on the mmu_notifiers
> > to handle mprotect()/munmap()/etc...
> 
> Right, and for the existing use cases this worked. But encrypted memory
> breaks many assumptions we once made ...
> 
> I have somewhat mixed feelings about pages that are mapped into $WHATEVER
> page tables but not actually mapped into user space page tables. There is no
> way to reach these via the rmap.
> 
> We have something like that already via vfio. And that is fundamentally
> broken when it comes to mmu notifiers, page pinning, page migration, ...

I'm not super familiar with VFIO internals, but the idea with the fd-based
approach is that the backing-store would be in direct communication with KVM and
would handle those operations through that direct channel.

> > As is, I don't think KVM would get any kind of notification if userpaces unmaps
> > the VMA for a private memslot that does not have any entries in the host page
> > tables.   I'm sure it's a solvable problem, e.g. by ensuring at least one page
> > is touched by the backing store, but I don't think the end result would be any
> > prettier than a dedicated API for KVM to consume.
> > 
> > Relying on VMAs, and thus the mmu_notifiers, also doesn't provide line of sight
> > to page migration or swap.  For those types of operations, KVM currently just
> > reacts to invalidation notifications by zapping guest PTEs, and then gets the
> > new pfn when the guest re-faults on the page.  That sequence doesn't work for
> > TDX or SEV-SNP because the trusteday agent needs to do the memcpy() of the page
> > contents, i.e. the host needs to call into KVM for the actual migration.
> 
> Right, but I still think this is a kernel internal. You can do such
> handshake later in the kernel IMHO.

It is kernel internal, but AFAICT it will be ugly because KVM "needs" to do the
migration and that would invert the mmu_notifer API, e.g. instead of "telling"
secondary MMUs to invalidate/change a mappings, the mm would be "asking"
secondary MMus "can you move this?".  More below.

> But I also already thought: is it really KVM that is to perform the
> migration or is it the fd-provider that performs the migration? Who says
> memfd_encrypted() doesn't default to a TDX "backend" on Intel CPUs that just
> knows how to migrate such a page?
> 
> I'd love to have some details on how that's supposed to work, and which
> information we'd need to migrate/swap/... in addition to the EPFN and a new
> SPFN.

KVM "needs" to do the migration.  On TDX, the migration will be a SEAMCALL,
a post-VMXON instruction that transfers control to the TDX-Module, that at
minimum needs a per-VM identifier, the gfn, and the page table level.  The call
into the TDX-Module would also need to take a KVM lock (probably KVM's mmu_lock)
to satisfy TDX's concurrency requirement, e.g. to avoid "spurious" errors due to
the backing-store attempting to migrate memory that KVM is unmapping due to a
memslot change.

The per-VM identifier may not apply to SEV-SNP, but I believe everything else
holds true.
