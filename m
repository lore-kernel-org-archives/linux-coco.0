Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87933AD517
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022426; cv=none; b=rRUjJZ2Iwr9xi3FM6sefsVMZe6G+BJGlMgtsRYZFLvUH+tuZJ4Vz41zBK/kki21DfX56F8DV+cM7Ukgze2pLRVVu2tqnIqSkBx2fHtR+G1zNOV1+u6Z+U7vkdT/1IiAp5RFbYlTJRSfjW77A/bGZXM70WiAyS4KJCKjgJ7J+hco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022426; c=relaxed/simple;
	bh=/Jh5oYlubsywuVmQ5YDdqkn0evsJEQYRz4nFdjoYIFk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YihZ5XSLhgxDJ1iUaXWdunanna8shj1hAnSK7jFWtRqaaPh1f1qDawhAEWVoSq5PUqaJVqLUUO4+hqt7f1HizhBkOAYb4hO0XY8eS/YO8eNb4TFLh54Lbdj3//vYatK9lV85p7uHgm0kIBzHKinV4K+GW1pMcUlu+a36fZPvd8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GimuLTAA; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GimuLTAA"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8487eb67173so3592560b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 06:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786022417; x=1786627217; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quMxwgvzS8F8CxQzPIpHc+hBSqfVyEO+f6ARjKTQRm8=;
        b=GimuLTAAf+oWfccTyq58NuDWWf/vLziGR5edT9JEiun6VpEb5mbxoP8pk5ljPzU3eE
         QVIXxyySHTMW2ATWUl1WnaCe36K1OGu2KtzeuoZ3hOpLQHTB4e3Gu+g89RArmmr7Neca
         fdXpQBzRgwm155jS2/cgujv+pxLwdScGH59k2MEnXY03M9BED55vHXrYqUQ087baoJmH
         AkXfjrDMGjcOGsWjdO6EPW90XLEuUDZPVVukgUAwlWMKo22ivLUJ4rur1sBch94JwZqy
         xLmlaNtbroZ4iYI3lOTNHbJJVZqKBTfTrsk8h0H0PyIzWtr55wJ5e74HxkvekKlSihtC
         f+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786022417; x=1786627217;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quMxwgvzS8F8CxQzPIpHc+hBSqfVyEO+f6ARjKTQRm8=;
        b=PW7WKRIVJUsVu/OjJisXPPOPLn8pTjh4QuLt2ZPSfQTeu65yeSdWl5I1yrbRSXmW0u
         nxWCEJc/+EyH0855KwtNrVXlcELivNLIU/CYW5Vffmlv0wVy6oQfTRfN86OSxd1vFLqx
         1gT8XLFXlYDfgTOp3hbODB9Jl8M6Ve29eo4lyuXmIha5tbQKFrH9IGLluq+GYslV9cNK
         npprHfSF57bcjXqwEptlMiM/cl4uKyDwN3Sl6dIyITR1NQFtyQfwb95FeroqPfHy9Gt0
         rull71WfVoOGmcw46teZPr7YGIUlMF6J8+9vhkxIm1a95WxNK2YxOCzjOHdIxfYfV52S
         HXSQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMnZvnlKd37OFqqQvAK741DY/oGtVx9n23KIp6F4So9mEbCVKDqznOODPNkMk8RSNztNgARRxeJCbk@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr1WmQWZbuLL3+eLEJt1xYVn6NfpL+N8RHISVk6RLKRtVEjnFB
	mocjLuxAvRjaLnNVn/zROVIAq47vfNUm6Son3OVcgHq6llOlXyiRgei0B8p5oc1tFsfAO1bD6KV
	i5UHhKw==
X-Received: from pfbcj19.prod.google.com ([2002:a05:6a00:2993:b0:84c:3651:a4b1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3ccd:b0:845:c7f1:29fa
 with SMTP id d2e1a72fcca58-84f2e04a63bmr16001363b3a.30.1786022416699; Thu, 06
 Aug 2026 06:20:16 -0700 (PDT)
Date: Thu, 6 Aug 2026 06:19:45 -0700
In-Reply-To: <fda26964-721d-4a8c-9225-46ca3a5b2785@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728-gmem-inplace-conversion-v9-0-35f9aec2aed2@google.com>
 <20260728-gmem-inplace-conversion-v9-3-35f9aec2aed2@google.com>
 <7dafaa90-f3d4-4be4-a5cc-472163f18040@intel.com> <CAEvNRgG3qXrG2ix2MEcyVo0GXaen-Pte4gFAwEN+9AY=VtGU5w@mail.gmail.com>
 <b9ad1a1d-c167-4adb-980b-90096515a363@intel.com> <anPYxp-LMWaLDbMk@google.com>
 <fda26964-721d-4a8c-9225-46ca3a5b2785@intel.com>
Message-ID: <anSJ1lLS0HZnfjCt@google.com>
Subject: Re: [PATCH v9 03/41] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 06, 2026, Xiaoyao Li wrote:
> On 8/6/2026 8:43 AM, Sean Christopherson wrote:
> > On Wed, Aug 05, 2026, Xiaoyao Li wrote:
> > > On 7/31/2026 4:34 AM, Ackerley Tng wrote:
> > > > I think another way to phrase this is that if we don't make this change,
> > > > say, on the foo architecture where there's no CoCo and no private mem
> > > > support, kvm_supported_mem_attributes() would return true for the !kvm
> > > > case, which is over-reporting.
> > > 
> > > Under the condition that the foo architecture enables
> > > CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> > > 
> > > > How about this, replacing the entire changelog paragraph above:
> > > > 
> > > >     Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE
> > > >     based on kvm_arch_has_private_mem being #defined. This improves
> > > >     reporting accuracy by not reporting support for
> > > >     KVM_MEMORY_ATTRIBUTE_PRIVATE when kvm_supported_mem_attributes() is
> > > >     called with kvm == NULL.
> > > 
> > > It doesn't help for the case where kvm == NULL, but help for the case where
> > > CONFIG_KVM_VM_MEMORY_ATTRIBUTES is defined but kvm_arch_has_private_mem not.
> > > 
> > > sorry for being picky. I think we can say
> > > 
> > > This improves the reporting accuracy by avoiding the case where
> > > KVM_MEMORY_ATTRIBUTE_PRIVATE is reported when kvm == null even without
> > > kvm_arch_has_private_mem being #defined.
> > 
> > How about this?
> > 
> > Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
> > on kvm_arch_has_private_mem being #defined in anticipation of tracking
> > PRIVATE vs. SHARED state per-guest_memfd, not per-VM (to allow in-place
> > conversion).
> 
> Sorry, maybe I'm stupid. I still don't understand how to connect it to
> tracking PRIVATE vs. SHARED state per-guest_memfd.
> 
> There are two diffs in this patch, and we are talking about the second diff,
> right?

Yes, the second diff is what provides the desired change in behavior.

> If the kvm_supported_mem_attributes() will be used by gmem, I can buy the
> justification. But it won't. At least, it won't after this series.

It's not about gmem using that API, it's about non-gmem using the API when
reporting KVM_CAP_MEMORY_ATTRIBUTES.  Without the change, if KVM supports any
memory attributes, i.e. if KVM_GENERIC_MEMORY_ATTRIBUTES=y, then the below will
*incorrctly* include PRIVATE in the set of memory attributes, because
KVM_CAP_MEMORY_ATTRIBUTES reports what memory attributes are supported via the
VM-scoped KVM_SET_MEMORY_ATTRIBUTES.

#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
	case KVM_CAP_MEMORY_ATTRIBUTES:
		return kvm_supported_mem_attributes(kvm);
#endif


> 
> > guest_memfd support for memory attributes is expected to be unconditional
> > to avoid yet more macros (all architectures that support guest_memfd are
> > expected to use per-gmem attributes at some point), at which point
> > enumerating support KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory
> > attributes being supported by KVM at-large would result in a system-scope
> 
> s/memory attributes/CONFIG_KVM_VM_MEMORY_ATTRIBUTES/ ?

No.  I mean "memory attributes" as in KVM as a whole entity, i.e. everything
linked into kvm.ko (and kvm-{amd,intel}.ko, supports memory attributes.

> > check (NULL @kvm) over-reporting support on arm64.
> 
> I think arm64 won't define CONFIG_KVM_VM_MEMORY_ATTRIBUTES?

Precisely *because* of this patch.  More at the bottom.

> So it seems to have nothing to do with arm64.
> 
> It matters for x86. After patch 20, CONFIG_KVM_VM_MEMORY_ATTRIBUTES is
> user-configurable. At that time, people can disable
> CONFIG_KVM_SW_PROTECTED_VM, CONFIG_KVM_INTEL_TDX and CONFIG_KVM_AMD_SEV, but
> enable CONFIG_KVM_VM_MEMORY_ATTRIBUTES on x86. 

No, they can't.  KVM_VM_MEMORY_ATTRIBUTES depends on one of those three being
enabled.  What am I missing?

config KVM_VM_MEMORY_ATTRIBUTES
	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV  <======

> In this case, kvm_supported_mem_attributes() reports
> KVM_MEMORY_ATTRIBUTE_PRIVATE for system-scope query which is totally wrong. I
> think this is the case we want to prevent not something won't happen for
> arm64?

Well, yeah, because of patches like this one.  That's the whole point.  Without
this change, kvm_supports_private_mem() would be reachable if and only if
KVM_VM_MEMORY_ATTRIBUTES=y, which would prevent burying that Kconfig in x86 and
would prevent arm64 from enabling the PRIVATE memory attribute in guest_memfd.
