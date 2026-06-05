Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D52DC332
	for <linux-coco@lists.linux.dev>; Fri,  5 Jun 2026 20:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780692536; cv=none; b=mdnoxlOpoBG2h6R9g5yjFwmHgEVdI1wxReexadjP439diQj5noAk4ZNvMVlhIjZDCS5Tx1WygE9jSyZDFNcG/iloXsTcbMmygRIzV0/1HaPKp4PZX+a16pkUQPe+wubhhrAkhq4rOYB5elnUsu5BS29s022FPqDwQWL07Xx0ucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780692536; c=relaxed/simple;
	bh=u4fko0paQcZtAksUjeK+qBbXQtJI5ESw1gxeXRzR6nc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UybtbMb2Q6eYWGU444YWWe0OfbykYkBZA9qtSLCXp9iX57apU5Z4vkqDfT6TuaHxGbDfnQ5q5ujQF1JPWGlHtWSm09YeyUw17cHW7vSDc3feDsxr+ijYW4ZGE0u5QnWEOA5VI4E+LljPoq22EyF1Oo5aFuAYvZFL2YEsPr0sLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQnhWAPo; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQnhWAPo"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8424aac207eso1947006b3a.0
        for <linux-coco@lists.linux.dev>; Fri, 05 Jun 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780692535; x=1781297335; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CPB6Ty3aEBots6OrnX5Whlsfo7rcobyK8YPdkP8GAcM=;
        b=nQnhWAPo2janB9j40TcPmffvMbe7tQ9/oBsN1ly2tiLIO5DolPBIOnbxsDd98unpAE
         umj2JUjaxo2ztgDDGNPzdHmI2di8aynLriVhQ8t9qXquhSttqVc7tHwd4b1rrSr85J3/
         VY/fJ/CHPmcmfyLs4AsgIfRx5Hr6NNloqp4NXU+eOoSq82q1at8MQ8rBOuMMEyheIY4Z
         55wCJa8TxgsSLKDC7Uolc7fZmHiOItlLiTSwyddv96VQTcq0lcjttQbh683uJ1Bkz7tk
         cZX6GGWBTvFOtUP1ZVVQBDlI75B4AKVmKiEcvUoAvXnysG4DKfhU8hIwgiTW/+GxfyLk
         ClrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780692535; x=1781297335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPB6Ty3aEBots6OrnX5Whlsfo7rcobyK8YPdkP8GAcM=;
        b=nyomAC2ojLd30j2tz/ovqd42qa9nSXSFMphbIntavHlP7dV723yBoyqZOwl7HgUWye
         KdPLlXuhwAXUHhyLbzMN0jlPJvz3RQ0hyU77cHMvPGTjSgez75bSkqtFTLbtT6sIi8+z
         uZ6seAoKV/gU83VwMJ3LnlVWx2WS702NeBXMr/2sWnnat0qxsv3d5yUuiCPIWpY5skG7
         qjGMv1ysP9t/J2gYT6KOQWBR+xQKBjZdRyeu/P4UF2sC2WmlhOOITCeZWLpVOGO4OWoG
         LFQFNKSH5lUORpb+18eB/MvjpgyY9/Fuqfb54/EDiW4VHqN13tnchLzAPouFCGno63dt
         QKIA==
X-Forwarded-Encrypted: i=1; AFNElJ9ad2DNTRtzw4SxPBZs5OjuFKQN+0g6omVvM4N/HtGPQKXTvyKypQsY4cX9vW4FZWK99vXOR0vrWtVH@lists.linux.dev
X-Gm-Message-State: AOJu0YzA3GIC3Vb5smIwp6Lv1uGAYzZBLQ4HFeHSGgZIjztkH28xVXhA
	5uPAHkpKblsHI7G5//vC8DkYT8vV13nWXryW44VUkr4sC4pKPKFPLRM9WUlcw8ywV2I/yNhvK4F
	ZzxkBTA==
X-Received: from pfnz10.prod.google.com ([2002:aa7:85ca:0:b0:842:650a:1d62])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d07:b0:842:4bf8:cfdb
 with SMTP id d2e1a72fcca58-842b0f83825mr5392458b3a.32.1780692534760; Fri, 05
 Jun 2026 13:48:54 -0700 (PDT)
Date: Fri, 5 Jun 2026 13:48:54 -0700
In-Reply-To: <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com>
 <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
 <aiMOWkiVBqoQDAPd@google.com> <CAEvNRgF09SfDm=OgbrS8-wpfxbNecQkqAQwf1ELq1jWu7NjbUA@mail.gmail.com>
Message-ID: <aiM2Nm9Eh68mIVX3@google.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 05, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> >
> > [...snip...]
> >
> >> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
> >> instead?
> >>
> >> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
> >> __vm_create_with_vcpus().
> >>
> >> While building this POC to test conversions [1] I only wanted to create
> >> the vm and vcpus and didn't want to finalize yet, since I still needed
> >> to do more mappings in the guest (and I needed the vm pointer to do
> >> mappings in the guest).
> >
> > Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
> > developer, it's quite surprising that the current value of a global variable
> > doesn't show up in the VM automagically.  I totally understand why selftests
> > work that way, but it's certainly odd and annoying.  If _that_ were solved, then
> > the kludginess of what you're doing goes away.
> >
> > The other way this could be solved is by adding support for annotating globals
> > with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
> > into the VM can automatically mark the associated globals' pages as shared.
> >
> 
> More generally, is your opinion that tests should not have to add extra
> memslots?

I don't care?  What I care about is making it as easy and intuitive as possible
for people to write tests, and to minimize maintenance costs.

> If I wanted a shared page, would I have to do
> 
>   static __shared test_page[4096] = {0};
> 
> and then rely on ELF loading to put that in the guest for me? Are there
> some compiler flags/how will I require that test_page be page aligned?

Compilere and linker shenanigans.

> If I mark 10 globals as __shared, would the compiler automatically
> consolidate the shared memory together?

Yes, follow the __bss_decrypted breadcrumbs.

  #define __bss_decrypted __section(".bss..decrypted")

> I think it's a bit constraining to require that all guest memory be set
> up statically. It's nice to have but I'd like another option...

You do have options, they just require more work.

> Many tests use vm_userspace_mem_region_add(), CoCo tests that require
> finalizing shouldn't be disallowed that option.

What does that have to do with finalizing the VM?

> >> It's also possible to have some kvm_vm_finalize() call that can be
> >> explicitly and manually invoked from selftests just for CoCo selftests.
> >
> > Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.
> 
> Works for me to call directly. Do you mean kvm_arch_vm_finalize_vcpus()
> is the right function where the TD is finalized?
> 
> For tests that need to do more setup after creating a vm, is the only
> way out to call __vm_create() then vm_vcpu_add() to avoid premature
> finalization in __vm_create_with_vcpus() when
> kvm_arch_vm_finalize_vcpus() is called?

Depends on what you're doing.  Sometimes, the answer will be yes.  That's why
there are "low level" APIs, so that some tests can do fancy things, while most
tests can leave the details to the infrastructure.

If there's a recurring problem, or we anticipate one, then we can and should
figure out how to minimize the pain so that tests don't have to deal with the
same boilerplate issues over and over.  Hence the __shared idea.
