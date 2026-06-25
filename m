Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C13E63A1
	for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 14:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398192; cv=none; b=VMOweUfzjLpWRq+EZc2M3dt668pnzE4/1me7gxy90pWEv7Pai7pDH9+edFMhwYQCeXPsiyjjYPgi0X7qYfCAjnJniQeRH9Ks2qq+ko7/8y+N2pQXyqINaXaLP4s8NAzBSfhMCYGhvhlF+1Rl2+mzNjUFOZuTLn44bddwBaLIqlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398192; c=relaxed/simple;
	bh=3+XZ1J9Fg+1riF/ZK2t4KROucxsp3psGgRCdBaJ8GJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I9sO6Kx2S0hbPgAcGG+rcj0R150oCddTS/ZRndix/Rsgu7EPSSAPejx0bEFzf9A1/nUWVgU3L/Wh6fgnXchSQn6cfL6FR9XRauiRunGSs+f6EVp/FCI3XhaiAWyDFCQkRyDmrkMNLdWXbIZsniA04ibDcAyGGW6AUX7twntYLVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1qvwSxl; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1qvwSxl"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c80f89b64bso795765ad.2
        for <linux-coco@lists.linux.dev>; Thu, 25 Jun 2026 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782398190; x=1783002990; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIUA7CCwzOR/KQalR5wXJaS4YlQ6wVTBXf5qStDGhQA=;
        b=i1qvwSxlOE+Nt5O9qR6nxxJgmsikkIGnBlFVqvFQEC2cRNv7i6cujKdB19BX1nyXfz
         KSGdO1OiYw29aaPanII73cFj2vJA3k0OOPskaPPifcSKPw05olK0beR0Z8a2Gr5wL8nc
         Lfj6RHWl5K7Bkn8WEcvsrL0AEny+J57kCoz0ZBK3jzxN3kQSdIAjOcbi6H4NqXcKWr5e
         wdKfT4L5Ttu5a1HpROq0IK4FrEU7OVrU5PGnRMfFcRnLALVaTaMjtV+ANafP9w5NmjMM
         sCtxB+VdVSPQpD1Au00G97UG/cJChcxiK1uMDgZed56pr1Xc9cjQInLYjIL74sKlX8OI
         MoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782398190; x=1783002990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIUA7CCwzOR/KQalR5wXJaS4YlQ6wVTBXf5qStDGhQA=;
        b=XqnSlnXI5Ckl9R1vyfhM45m/bdJiJEXaRUX5uArWx5nER1SZ09RuywA7H0GKBAflhG
         jjtiOKSfEJjk5ML4Cl2ig1x4+JLiOhgRZQwkW2IgWshgAzqC1bJLc2wi+o874kZUfzwL
         bYlVh4n2QLf87GHslCdtvCWiWALKdFWfvozVhtlmMF/9gDT643IObyxL/siiuZhFd1ej
         IgogNH4IcnZH9GhzdnNrvT9U8ZCUHgKnSaIbrq8yvZaTZ0pG+2FAm9x7rcnRbKGKmTMl
         Apuy2xRtGmyWUI2j0HXKUb0/bokc/m6u/Vw2cj5DosAdxM2QJExjJUXhnPh8VCeoCmLx
         tqvg==
X-Forwarded-Encrypted: i=1; AHgh+RofcfPKoeEYknTGiRiBsDQ+6RbRi7LdMJK8ntqFx5RjKFiQx4DdyXSkTlQCS6o47fWtPn1fgQ4EC+62@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7JP1c9DrGSCGIEwF+l+y1gt7IXu8oDQ9IVBYGtonATN/5pdMi
	NBmYdc+utDvqEJeaNCnVHelycR+5UH335GqixpBuSnW3xNBZdfTuonGiJ5q79I9Ky7XOe/FluKx
	62URfSQ==
X-Received: from plpb15.prod.google.com ([2002:a17:902:d60f:b0:2bd:a0e6:1a81])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2304:b0:2c0:d91d:c3e8
 with SMTP id d9443c01a7336-2c7fc65423emr29366505ad.4.1782398189481; Thu, 25
 Jun 2026 07:36:29 -0700 (PDT)
Date: Thu, 25 Jun 2026 07:36:28 -0700
In-Reply-To: <aj0Jf30PS2f7x1nt@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajx5Vrz9ma--hrGH@google.com> <ajyJhZcgfYFtGfS2@yzhao56-desk.sh.intel.com> <aj0Jf30PS2f7x1nt@yzhao56-desk.sh.intel.com>
Message-ID: <aj087H1UWSFxbShR@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default\
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 25, 2026, Yan Zhao wrote:
> On Thu, Jun 25, 2026 at 09:51:01AM +0800, Yan Zhao wrote:
> > On Wed, Jun 24, 2026 at 05:41:58PM -0700, Sean Christopherson wrote:
> > > On Wed, Jun 24, 2026, Ackerley Tng wrote:
> > > > Yan Zhao <yan.y.zhao@intel.com> writes:
> > > > > With gmem_in_place_conversion=true, userspace can create guest_memfd without the
> > > > > MMAP flag. In such cases, shared memory is allocated from different backends.
> > > > > This means this module parameter only enables per-gmem memory attribute and does
> > > > > not guarantee that gmem in-place conversion will actually occur.
> > > 
> > > KVM module params are pretty much always about what KVM supports, not what is
> > > guaranteed to happen.
> > > 
> > >   - enable_mmio_caching doesn't guarantee there will actually be MMIO SPTEs,
> > >     because maybe the guest never accesses emulated MMIO.
> > >   - enable_pmu doesn't guarantee VMs will get a PMU, because userspace may elect
> > >     not to advertise one.
> > >   - and so on and so forth...
> > > 
> > > Yes, there's a small mental jump to get from "KVM supports in-place conversion"
> > > to "I need to set memory attributes on the guest_memfd instance, not the VM",
> > > but I don't see that as a big hurdle, certainly not in the long term.  And once
> > > the VMM code is written, I really do think most people are going to care about
> > > whether or not KVM supports in-place conversion, not where PRIVATE is tracked.
> > Sorry, I just saw this mail after posting my reply in [1].
> > 
> > I'm ok with gmem_in_place_conversion=true just means KVM supports in-place
> > conversion, while we can still create VMs with shared memory not from gmem.
> Or what about "allow_gmem_in_place_conversion" ?

No, because turning on the param also disallows setting PRIVATE in the VM-scoped
KVM_SET_MEMORY_ATTRIBUTES ioctl.

> > Though it still feels a bit odd to require TDX huge pages to depend on
> > gmem_in_place_conversion=true when shared memory is not currently allocated
> > from gmem, 

I fully expect that to be a transient state, and in all likelihood not something
that is *ever* shipped in production.  Landing TDX hugepages without guest_memfd
hugepage support is all about avoiding unnecessary serialization of series and
features that aren't strictly dependent on each other.

> > it should become more natural over time once gmem supports in-place
> > conversions for huge page.

Yes, and I want to prioritize the steady state for end users, not the in-progress
state for developers.  Once all of this settles out, I fully expect the majority
of deployments to only support in-place conversion, at which point the end user
is only going to care whether or not in-place conversion is enabled in KVM, not
the subtle detail that it's still possible to do out-of-place conversions (and
that will always hold true, it's not like VMA-based memslots are being deprecated).

> > Besides my current usage, there may be other scenarios where gmem memory
> > attributes is preferred without allocating shared memory from gmem.
> > (e.g., PAGE.ADD from a temp extra shared source memory).
> > 
> > For such use cases, I'm concerns that the admins may find it confusing if they
> > enable gmem_in_place_conversion but still observe extra memory consumptions for
> > shared memory.

KVM can help with documentation, but beyond that, it's not KVM's problem to solve.
If a VMM *and* platform owner chooses to deploy a setup that utilizes out-of-place
conversions, then it's on the VMM and/or plaform owner to understand and communicate
the implications to the end user.

And I'm not remotely convinced that prepending allow_ to the param will help
end users diagnose "unexpected" memory consumption, in quotes because anyone that
is deploying a stack that utilizes out-of-place conversion absolutely needs to
understand and plan for the additional memory consumption.  I.e. if the memory
consumption is "unexpected" to the end user, they likely have far bigger problems.
