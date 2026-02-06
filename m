Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1724A06D
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390077; cv=none; b=O6UyQ0CkDiCmF284qgFtjFzClewmJptgh6Q2kqV8XFK/rt/rxIyibFm7KxHBs615WDw3yh8yYihO1tKNMW3uAleNyr6NcQhuyRSy9MMEgov3Opjj2v79rSh0EF2a2bu1+GVszKq5PcQ6fRmkuiQ15EFiy0TAldmvXaMmlSci1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390077; c=relaxed/simple;
	bh=+0p5/2cxZHOIH3gdTEZejCJJDcduW40PMOoDLbWCWGs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CU49oOTNMykoer/zE8ndkUnppTTJJhtaAIaUUZlH3U14bs/sjPAbMp2JGIJ8hdybLLb51barUDtO/Yt59sNiWsA83EA4a+3e3vT2Nd1RwEWBvPw7xUSXJ2v9ZThypPZtvUIp1S6/QVjF7lUYmkoFTY+A82wCt4Li2dnzLrCr2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4eh03NR; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4eh03NR"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3545b891dd1so4801720a91.1
        for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 07:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770390077; x=1770994877; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BKp8ZbACqKocuJ3VqCzgsghWr3tFDD71E/QKe7BVqwM=;
        b=V4eh03NRCIqj/F1jF6quVZ8WFUMjzojIU3U7YqD2Xj+Df5L4ILt6LfTyHqsy2/8sa3
         OOamMC8FxVtYmiUVnD2DSulM8O6qCMJc5P/3qokW52JK367/s94fiR0ZaEaNBaZufYJk
         /MgUVxG+2UlaoMov/56WwQ5kflOPKBhYJltgJqFhlWOgHUj5OqQZFnvB0QXvTinr7nOH
         2az8EsQTrEncW1HuQGqKBI08Qg7u14Gd3FF2n0szWjEwi2rV0IqLMYQraHdCgy03ashk
         HjDphbA+W9Qbou9bFx1tJaO+afeoMu3aQn/Vk+vmujURfMdeEB3XlG3Me/+gUOho+mqR
         oqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390077; x=1770994877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKp8ZbACqKocuJ3VqCzgsghWr3tFDD71E/QKe7BVqwM=;
        b=CNoavopvZ60h1eBy3Nzb9cxKHZktwcB4/wBpwB9onI0zYIiJvwUWaHxYajbvUmaXAn
         13n53utkeXeiYelQxWpVZKQJh03kYgESkBZeaOqJXoc1V25NR5C2ugpgKH080P2dWTcR
         KbROcnBiXM7Ptg+cjGY+pLX42ewWJq5d2sc2qrhBLJ61AXyaCtErZLJbhjjn4qM+ZK8S
         i+63SIkFxOjn3eLDg+FVymLbC/ZpxDWgfv1v+hsNBrhiGS4W8scVx7mTh51ilIePTz/P
         W3czZKzSKiolE2pkDkgmM1+9GpFPQ6MQbnSHMtr16ygdnxcap0J42yX7sYVstguhlFcI
         ipGA==
X-Forwarded-Encrypted: i=1; AJvYcCUtGf67AQR5xwFC0GQmQvyGqhPtTf5ZP8p3a4Oiw9Nr7YBkWfU+LCuN+b/GO0XJSD5W4LHecMVyqaYq@lists.linux.dev
X-Gm-Message-State: AOJu0YyK/v53mxSuCqa2IZR9MheGOSUdl2wnNuEKZN3mY39y7OxijWMC
	mZOJQrf6O0B4Uz7jnLNZnO2IEFBX6p6wNgff5NoKjGMaiDB/X88Zy1of0p55R3MUp9Ul8RxA1ee
	99daa4g==
X-Received: from pjvc4.prod.google.com ([2002:a17:90a:d904:b0:340:c0e9:24b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4e:b0:341:b5a2:3e7b
 with SMTP id 98e67ed59e1d1-354b3b7d70bmr2708644a91.4.1770390076562; Fri, 06
 Feb 2026 07:01:16 -0800 (PST)
Date: Fri, 6 Feb 2026 07:01:14 -0800
In-Reply-To: <aYW5CbUvZrLogsWF@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com> <20260129011517.3545883-21-seanjc@google.com>
 <aYW5CbUvZrLogsWF@yzhao56-desk.sh.intel.com>
Message-ID: <aYYCOiMvWfSJR1AL@google.com>
Subject: Re: [RFC PATCH v5 20/45] KVM: x86/mmu: Allocate/free S-EPT pages
 using tdx_{alloc,free}_control_page()
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 06, 2026, Yan Zhao wrote:
> > diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> > index 18764dbc97ea..01e3e4f4baa5 100644
> > --- a/arch/x86/kvm/mmu/tdp_mmu.c
> > +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> > @@ -55,7 +55,8 @@ void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm)
> >  
> >  static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
> >  {
> > -	free_page((unsigned long)sp->external_spt);
> > +	if (sp->external_spt)
> > +		kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
> >  	free_page((unsigned long)sp->spt);
> >  	kmem_cache_free(mmu_page_header_cache, sp);
> >  }
> Strictly speaking, external_spt is not a control page. Its alloc/free are
> different from normal control pages managed by TDX's code.

Yeah, I called that out in the changelog.  I'm definitley not wedded to
tdx_{alloc,free}_control_page(), but I am very much against tdx_{alloc,free}_page().

  (arguably S-EPT pages aren't "control" pages, but they're not guest pages either)

> (1) alloc
> tdx_alloc_control_page
>   __tdx_alloc_control_page
>     __tdx_pamt_get 
>       spin_lock(&pamt_lock)   ==> under process context
>       spin_unlock(&pamt_lock)
> 
> (2) free
> tdp_mmu_free_sp_rcu_callback
>   tdp_mmu_free_sp
>     kvm_x86_call(free_external_sp)
>      tdx_free_control_page
>         __tdx_free_control_page
>           __tdx_pamt_put
>             spin_lock(&pamt_lock)   ==> under softirq context
>             spin_unlock(&pamt_lock)
> 
> So, invoking __tdx_pamt_put() in the RCU callback triggers deadlock warning
> (see the bottom for details).

Hrm.  I can think of two options.  Option #1 would be to use a raw spinlock and
disable IRQs:

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 823ec092b4e4..6348085d7dcb 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -2246,7 +2246,7 @@ static u64 tdh_phymem_pamt_remove(u64 pfn, u64 *pamt_pa_array)
 }
 
 /* Serializes adding/removing PAMT memory */
-static DEFINE_SPINLOCK(pamt_lock);
+static DEFINE_RAW_SPINLOCK(pamt_lock);
 
 /* Bump PAMT refcount for the given page and allocate PAMT memory if needed */
 int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
@@ -2272,7 +2272,7 @@ int __tdx_pamt_get(u64 pfn, struct tdx_pamt_cache *cache)
        if (ret)
                goto out_free;
 
-       scoped_guard(spinlock, &pamt_lock) {
+       scoped_guard(raw_spinlock_irqsave, &pamt_lock) {
                /*
                 * Lost race to other tdx_pamt_add(). Other task has already allocated
                 * PAMT memory for the HPA.
@@ -2348,7 +2348,7 @@ void __tdx_pamt_put(u64 pfn)
        if (!atomic_dec_and_test(pamt_refcount))
                return;
 
-       scoped_guard(spinlock, &pamt_lock) {
+       scoped_guard(raw_spinlock_irqsave, &pamt_lock) {
                /* Lost race with tdx_pamt_get(). */
                if (atomic_read(pamt_refcount))
                        return;

--

Option #2 would be to immediately free the page in tdx_sept_reclaim_private_sp(),
so that pages that freed via handle_removed_pt() don't defer freeing the S-EPT
page table (which, IIUC, is safe since the TDX-Module forces TLB flushes and exits).

I really, really don't like this option (if it even works).

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index ae7b9beb3249..4726011ad624 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2014,7 +2014,15 @@ static void tdx_sept_reclaim_private_sp(struct kvm *kvm, gfn_t gfn,
         */
        if (KVM_BUG_ON(is_hkid_assigned(to_kvm_tdx(kvm)), kvm) ||
            tdx_reclaim_page(virt_to_page(sp->external_spt)))
-               sp->external_spt = NULL;
+               goto out;
+
+       /*
+        * Immediately free the control page, as the TDX subsystem doesn't
+        * support freeing pages from RCU callbacks.
+        */
+       tdx_free_control_page((unsigned long)sp->external_spt);
+out:
+       sp->external_spt = NULL;
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
--
