Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EA235358
	for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786407540; cv=none; b=aBE/eWUETL05TIL++PFvsuUocL4u/m3hYQ4GqXe5LVgl1bwliHosVmsaALU7UbgRxwAsNuLwHU+Exh0TpDi7iSk+sst0zci89VY7WMirm6blPphQrn4ctsOYHlR2SemyTFxhesncLhi3sd7IzbdkI+bFCmMYvXVRWgNB3cmnn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786407540; c=relaxed/simple;
	bh=W9uYraziRHJ/HXbsiKxTSK4X1mr9zUukCf8sFFZRRAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c+TfWwrXPPXTjTlk6ch8FpGc26ipiJm7Z2W/HQrSn9QK887iazOS35ECQlQTrKHDrKoOrbouPFY6MUfc8AJLlnr3lS/lwapdPm9cVz0R6SoyLgXtD5H0NHBmP7MhC5Wh03rASZL09Ycdp/XWYDT6fiHR7YxC8+Ax4ONWvfKmEhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gfcHCub9; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gfcHCub9"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so4241913b3a.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Aug 2026 17:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786407538; x=1787012338; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAiudkcAvitRicnlZsTp/8XRyAoMENjhlvyXGhGU0wA=;
        b=gfcHCub9xvrOAy09bT5HjJqzeDYnymEMi8r32lhPhy/BkOfJyRcGgdRQOc2XwoM3my
         Feaboh2oPLMKEfpzzGcTdph2cNXt4PHss3ADHMxuF+ltDFCJmoahJ6FjjoMmEiTdsANR
         R/eQnXovR5dpY6ny4Vp7XD7t5TmRhvkakfGK/PNLdiVxoNrRcTVdQyX1xsRiZrn7Ezyi
         fQpkvJtDVL8I+L35KQCsvr/lGTrurXkHizCgHyZFP/JibFf3x5w1wr5XXO9n0zMNa7L/
         odqfLVyVDnKmIGgushd/u+URJxhLt64GdQSkZsOYYHO+CkFqj1xANoZC75AzCxkqMPMt
         6Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786407538; x=1787012338;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAiudkcAvitRicnlZsTp/8XRyAoMENjhlvyXGhGU0wA=;
        b=NNlwzjR42DtkFtLu0LESz3puHHCrCAlxPk90uKWP8xLORcPYZCtMuP0vWza0Y4h5qT
         s3FKPACCLQOsk0izSyLCZHsx/vzrzUVTg6yaZf0YoLEfXcC+z4tyqGXWM1F6rpbPFFrk
         xmfoNosbFyxfJu6ZScuGWy8nlkpONy6e8bmc3avvnywiV5gleK8GLBwZQGzkH6BnGPSw
         /uw8npN5sLYuDabJR0J1X2cuKCkCojdNe4kqbe4WCpYvZbwHBJ2UJQQSWx4wvx0t2mTV
         hzgmXGxhD8CSF/SfIiVgc7mZ0Iipr5b/Xl5RL7KkLyZXM2DLAahWZ5+ohFGJcGhL/sJI
         JIDg==
X-Forwarded-Encrypted: i=1; AHgh+RokZQrkhdvD9c0r7fi5RSmYf9o1w/cmkpzkTNRIzWPV9VDOd1YYaf8cYqomTriwj50LjJEVgzTot0pW@lists.linux.dev
X-Gm-Message-State: AOJu0YxuW62ONbSDnevsUUcP6YAzw6z0V4au/cReI0nkl6nyocJJawaf
	6eSBjPBB2cWMA5lnkRiNyKaq3GjM6hkWQykCg1sRI5XfeopfcpZszPrINvjFSmlhbMfU3DdOYDe
	7OMn8DQ==
X-Received: from pglg7.prod.google.com ([2002:a63:1107:0:b0:cbe:948f:d640])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4613:b0:842:2a81:4c63
 with SMTP id d2e1a72fcca58-84f9c95fbfemr5369150b3a.25.1786407537909; Mon, 10
 Aug 2026 17:18:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:18:57 -0700
In-Reply-To: <CAEvNRgGSK9tO_-TvQvXoMwVwGygh5WjjBUOY-zLOA5yP2DwS1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-16-2fc18ee6d3ba@google.com>
 <dd9ebd52-7171-4353-8c83-9363019d55b8@kernel.org> <CAEvNRgGSK9tO_-TvQvXoMwVwGygh5WjjBUOY-zLOA5yP2DwS1g@mail.gmail.com>
Message-ID: <anpqcZlwvjWCWGId@google.com>
Subject: Re: [PATCH v10 16/41] KVM: guest_memfd: Zero page while getting pfn
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 10, 2026, Ackerley Tng wrote:
> "David Hildenbrand (Arm)" <david@kernel.org> writes:
> 
> > On 8/7/26 23:52, Ackerley Tng via B4 Relay wrote:
> >> From: Ackerley Tng <ackerleytng@google.com>
> >>
> >> Move the folio initialization logic from kvm_gmem_get_pfn() into
> >> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
> >> kvm_gmem_populate().
> >>
> >> With in-place conversion, the existing data in a guest_memfd page can be
> >> populated into guest memory through platform-specific ioctls.
> >>
> >> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
> >> might contain uninitialized host memory, which would leak to the guest if
> >> the populate completes.
> >>
> >> guest_memfd pages are zeroed at most once in the page's entire lifetime
> >> with guest_memfd, and that is tracked using the uptodate flag.
> >>
> >> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
> >> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
> >> can get a page, write to the page and then set page uptodate without
> >> zeroing.
> >>
> >> This aligns with the concept of zeroing before first use - the other place
> >> where zeroing happens is in kvm_gmem_fault_user_mapping().
> >>
> >> Don't mark the page uptodate again after populating, since the page would
> >> already be marked uptodate before the post_populate() call.
> >
> > The downside is that __kvm_gmem_populate() will now zero+write. I assume we
> > don't care about possible performance impacts?
> >
> 
> Would we rather zero in kvm_gmem_populate() only if !uptodate &&
> gmem_in_place_conversion && src_addr == 0? That could work too.

No.  I'm 99% certain we discussed this (multiple times?), and the consensus was
that any performance penalties due to redundant zeroing would pale in comparison
to the cost of actually assigning the page to the VM.

> Previously, without in-place conversion, populate never reads memory
> from guest_memfd so there was no danger of leaking uninitialized memory.
> >> @@ -1159,8 +1159,6 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
> >>  	}
> >>
> >>  	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
> >> -	if (!ret)
> >> -		folio_mark_uptodate(folio);
> >
> > In case post-populate failed, do we want to re-zero the pages?
> 
> I believe we can't re-zero the pages. When SNP fails to populate it
> could be because SNP didn't like the CPUIDs userspace set up, and after
> the error userspace is expected to check what SNP likes, then
> retry.
> 
> IIUC zeroing will destroy the message SNP wanted to leave for userspace.
> 
> Michael should be able to explain more here :)

Not Michael, but the above is correct.  If firmware rejects a CPUID page, then
KVM copies back the expected CPUID values provided by firmware.

That said, now that we have have @may_writeback_src we _could_ re-zero the page,
i.e. only zero pages for which @may_writeback_src is %false.

And _that_ said, I vote "no".  KVM zeros the memory mostly to ensure userspace
can't read stale data, e.g. someone else's data.  I don't think we need to
guarantee that a failed populate() (or rather, whatever ioctl called into it)
will leave memory in any particular state.  It would be easier to document that
the page contents may be modified on failure.
