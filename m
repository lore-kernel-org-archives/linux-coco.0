Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DCD3AFCE1
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203056; cv=none; b=a7FudMnnSaqES4iycPpFgSAC41SYaFk6GrmI7BLgfBH4NU2yTtoLka9pcm2k8v3x+ElGstVFWMFz7tHPqbhS336nyyCwwnCrC+1SXjQ0FzQyDzxHsG91fty3it8jOacknpVMdklPmxKWVxCm2A/iDYrClopCAkxmQ+pmqfhjz/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203056; c=relaxed/simple;
	bh=SZ/JR9ZvyrcsknBQqh4FpTporMKvookpSd7KUkT9UHM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OhjuloAesR0fh5JIQAzNm2aCWEuH5domcgzPyXJLT7uGotRhc8gvGUEJjm0SHcKxU2D89nBGfto5+/bSUual9hqaQHPRMyVjr6BZcfQ8RiFe+mSLr1KA//7k2a82RH8/H6HfOBKGckF/wylPXXTY1Ol4b4qKFzckNycMo4hHlUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uFJPmHOM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uFJPmHOM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b9fe2d6793so90109955ad.0
        for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779203054; x=1779807854; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T/3nnkW0lqpwejGPgvTbPUbQiNECuGmWVi5RjTbDbAQ=;
        b=uFJPmHOM7GUUvSX5A1ftABknt/yTGXx0XMdRknZ2te93u4PsoB4IjP7CxrWfMlQvWq
         OlSk5XG/xCrN3OkMyLwMv4fVeNwX+fFbJd6PE4pgMv4Qt4MdpxFsqnSOmDkmtITFmwnI
         gvsCHp5Ra6EsyVRYb/yO2D3361kxRiJmupFvRQ3kxZ6DKdNOibxeeU3nXD/WSC4Dvpma
         EGZr7+NkPGtD/3UYbMtzm0/EH30rKLo8hBZV2LFIArChu0l3IaESeOZqjjCiXovewpaP
         4ye7d+77JSm/JQ5ycYUu9U7t1FzUgMmr/dPdGx82Q3zlkLc+PKoP3/sSpmGLNG3IaMP/
         cPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203054; x=1779807854;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/3nnkW0lqpwejGPgvTbPUbQiNECuGmWVi5RjTbDbAQ=;
        b=O+dm2iXYZs/3Ck4sYDuB47h42DHh2vsANXfkSA/XAYK86Gpj0rb/feWCskW2bsPHkT
         AUHBaUntO0VtkIDXEqXW0T9kROM7TqdrCLScE11rpqgsnqI6QsYA7zQJiZOiPFSF19nK
         oErJLbFbl5JvxnvR1Dsf4m1SS7CavGDB/ir986WFep5ahAuKF4mcwwfZo0DW6XBtuQKQ
         kNZXSeeCMkDfODoI6jVBGCqB+XjNVSwAqmtqhm8DE3Jeq7Y2UOSAUtSdo4/nS0t/qlGy
         8q6SXGVmV6ffP32CTTAiBUwz+AtX9TsJNQRDQCXKzw7NBzuT16D/wr9fmvX35TLEoIuN
         hmvw==
X-Forwarded-Encrypted: i=1; AFNElJ+EAnn1xkWP/WTdDb5C/hp789ZkU0Zjutn66cKZCaMdF903c6MbHLybnylFoLE1VPfB5VVn5J6OIfCb@lists.linux.dev
X-Gm-Message-State: AOJu0YwcjCssVzQvi1Ju272WXOddZgB3C3v5TCrckKFJ/GXCzpubRwHh
	T9NOx1FWL+WKWj1aki9dXRLsTXNWGnSxGAiiTxQjMEy0AAll/N/hfYHikH/e0SiTGw3Q3yfi8c7
	yFKEc3w==
X-Received: from plsa8.prod.google.com ([2002:a17:902:b588:b0:2b0:4f86:510])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11cf:b0:2bd:bd27:e234
 with SMTP id d9443c01a7336-2bdbd27e463mr135663905ad.21.1779203054065; Tue, 19
 May 2026 08:04:14 -0700 (PDT)
Date: Tue, 19 May 2026 08:04:13 -0700
In-Reply-To: <074e209fe4c78a735868099f13d76b9dde2c88e3.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260514215355.1648463-1-seanjc@google.com> <20260514215355.1648463-16-seanjc@google.com>
 <074e209fe4c78a735868099f13d76b9dde2c88e3.camel@intel.com>
Message-ID: <agx77QB3UVmJr5xP@google.com>
Subject: Re: [PATCH v2 15/15] KVM: x86: Move the bulk of register specific
 code from x86.c to regs.c
From: Sean Christopherson <seanjc@google.com>
To: Kai Huang <kai.huang@intel.com>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "kas@kernel.org" <kas@kernel.org>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "paul@xen.org" <paul@xen.org>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yosry@kernel.org" <yosry@kernel.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 19, 2026, Kai Huang wrote:
> > @@ -12712,19 +11913,8 @@ static void store_regs(struct kvm_vcpu *vcpu)
> >  
> >  static int sync_regs(struct kvm_vcpu *vcpu)
> >  {
> > -	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_REGS) {
> > -		__set_regs(vcpu, &vcpu->run->s.regs.regs);
> > -		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_REGS;
> > -	}
> > -
> > -	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
> > -		struct kvm_sregs sregs = vcpu->run->s.regs.sregs;
> > -
> > -		if (__set_sregs(vcpu, &sregs))
> > -			return -EINVAL;
> > -
> > -		vcpu->run->kvm_dirty_regs &= ~KVM_SYNC_X86_SREGS;
> > -	}
> > +	if (kvm_run_set_regs(vcpu))
> > +		return -EINVAL;
> 
> Nit:
> 
> Do you think 'kvm_run_sync_regs()' is better than 'kvm_run_set_regs()'?
> 
> Because I think "sync" reflects better that vcpu->run->kvm_dirty_regs is cleared
> after the "set" operation.

The problem I have with "sync" is that it doesn't communicate the direction of
the sync.  What about kvm_run_sync_regs_{to,from}_user()?

> >  
> >  	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_EVENTS) {
> >  		struct kvm_vcpu_events events = vcpu->run->s.regs.events;
> 
> Also, I wonder whether it's better to add a helper for events so sync_regs() and
> store_regs() can be simplified to:
> 
> static int sync_regs(struct kvm_vcpu *vcpu)
> {
> 	if (kvm_run_sync_regs(vcpu))
> 		return -EINVAL;
> 	return kvm_run_sync_events(vcpu);
> }
> 
> static void store_regs(struct kvm_vcpu *vcpu)
> {
> 	kvm_run_get_regs(vcpu);
> 	kvm_run_get_events(vcpu);
> }
> 
> And maybe 'kvm_run_get_regs()' could be 'kvm_run_store_regs()' too , so that the
> store_regs() could be:
> 
> static void store_regs(struct kvm_vcpu *vcpu)
> {
> 	kvm_run_store_regs(vcpu);
> 	kvm_run_store_events(vcpu);
> }

{store,sync}_regs() look pretty, but IMO the overall code is uglier because we
end up with super small helpers that have one caller, e.g.

  static void kvm_run_sync_events_to_user(struct kvm_vcpu *vcpu)
  {
	if (vcpu->run->kvm_valid_regs & KVM_SYNC_X86_EVENTS)
		kvm_vcpu_ioctl_x86_get_vcpu_events(vcpu, &vcpu->run->s.regs.events);
  }

  static void store_regs(struct kvm_vcpu *vcpu)
  {
	BUILD_BUG_ON(sizeof(struct kvm_sync_regs) > SYNC_REGS_SIZE_BYTES);

	kvm_run_sync_regs_to_user(vcpu);
	kvm_run_sync_events_to_user(vcpu);
  }

For me, the extra "jump" is undesirable, but it allows burying __{g,s}et_{s,}regs()
in regs.c, and so is a net positive for registers.  But for events, it's pure
overhead.

> > diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
> > index 185062a26924..fd55cd031b1c 100644
> > --- a/arch/x86/kvm/x86.h
> > +++ b/arch/x86/kvm/x86.h
> > @@ -414,6 +414,7 @@ int handle_ud(struct kvm_vcpu *vcpu);
> >  
> >  void kvm_deliver_exception_payload(struct kvm_vcpu *vcpu,
> >  				   struct kvm_queued_exception *ex);
> > +void kvm_handle_exception_payload_quirk(struct kvm_vcpu *vcpu);
> >  
> >  int kvm_mtrr_set_msr(struct kvm_vcpu *vcpu, u32 msr, u64 data);
> >  int kvm_mtrr_get_msr(struct kvm_vcpu *vcpu, u32 msr, u64 *pdata);
> > @@ -604,6 +605,7 @@ static inline void kvm_machine_check(void)
> >  int kvm_spec_ctrl_test_value(u64 value);
> >  int kvm_handle_memory_failure(struct kvm_vcpu *vcpu, int r,
> >  			      struct x86_exception *e);
> > +void kvm_invalidate_pcid(struct kvm_vcpu *vcpu, unsigned long pcid);
> > 
> 
> If I read correct, this is because "regs.c" calls kvm_invalidate_pcid() but you
> want to keep it in x86.c.  But it seems the "x86.h" isn't included by "regs.c"
> directly but via other headers ("mmu.h" does include "x86.h").
> 
> Should the "regs.c" include "x86.h" directly?

Oh, yeah, I just goofed that.

> Btw, I am a bit confused the relationship between "x86.h" and other headers like
> "mmu.h" and the new "regs.h".  That is, headers like "mmu.h" include "x86.h",
> but headers like "regs.h" do not (instead, "x86.h" includes them).

Heh, don't look for a theme/plan, because there isn't one.  Over the years, x86.h
and x86.c became dumping grounds for everything that didn't have an obvious home,
and so there aren't real "rules".

Hmm, though looking at all of this again, I think we're actually quite close to
having somewhat sane rules.  Over the past few years, I've tried multiple times
to move what I felt should be KVM-internal structures from asm/kvm_host.h to x86.h,
and I've failed miserably every time because inevitably even the most innocuous
struct manages to have usage that leads to cyclical header dependencies and/or is
used by arch-neutral KVM code.

I think it's probably time to admit I've been looking at the asm/kvm_host.h vs.
x86.h split all wrong, i.e. finally give up on moving structures out of kvm_host.h,
and do the exact opposite: commit to using kvm_host.h to define and declare widely
used structures.

Because literally the only reason that x86.h doesn't include mmu.h is that mmu.h
references struct kvm_host, which is currently defined in x86.h.  If we "fix"
that, then (a) we can make x86.h the "central" include everyone expects it to be,
and (b) it can be the start of a cleanup of asm/kvm_host.h and a big step towards
defining maintainable "rules" for what goes where.  E.g. there are a pile of
functional declarations in asm/kvm_host.h that can live elsewhere; if we trim
those down, then the rules become:

  - asm/kvm_host.h holds "common" structure definitions and associated key global
    variables, and things that are referenced by arch-neutral KVM.
  - <area>.{c,h} holds relevant declarations and definitions.
  - x86.{c,h} is the kitchen sink for everything else.

E.g. this compiles for at least one config:

---
 arch/x86/include/asm/kvm_host.h | 50 ++++++++++++++++++++++++----
 arch/x86/kvm/mmu.h              | 20 +++++++----
 arch/x86/kvm/x86.h              | 59 ++++-----------------------------
 3 files changed, 64 insertions(+), 65 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 5e24987b2a94..67ba8bf22469 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -313,6 +313,50 @@ enum x86_intercept_stage;
 struct kvm_kernel_irqfd;
 struct kvm_kernel_irq_routing_entry;
 
+struct kvm_caps {
+	/* control of guest tsc rate supported? */
+	bool has_tsc_control;
+	/* maximum supported tsc_khz for guests */
+	u32  max_guest_tsc_khz;
+	/* number of bits of the fractional part of the TSC scaling ratio */
+	u8   tsc_scaling_ratio_frac_bits;
+	/* maximum allowed value of TSC scaling ratio */
+	u64  max_tsc_scaling_ratio;
+	/* 1ull << kvm_caps.tsc_scaling_ratio_frac_bits */
+	u64  default_tsc_scaling_ratio;
+	/* bus lock detection supported? */
+	bool has_bus_lock_exit;
+	/* notify VM exit supported? */
+	bool has_notify_vmexit;
+	/* bit mask of VM types */
+	u32 supported_vm_types;
+
+	u64 supported_mce_cap;
+	u64 supported_xcr0;
+	u64 supported_xss;
+	u64 supported_perf_cap;
+
+	u64 supported_quirks;
+	u64 inapplicable_quirks;
+};
+extern struct kvm_caps kvm_caps;
+
+struct kvm_host_values {
+	/*
+	 * The host's raw MAXPHYADDR, i.e. the number of non-reserved physical
+	 * address bits irrespective of features that repurpose legal bits,
+	 * e.g. MKTME.
+	 */
+	u8 maxphyaddr;
+
+	u64 efer;
+	u64 xcr0;
+	u64 xss;
+	u64 s_cet;
+	u64 arch_capabilities;
+};
+extern struct kvm_host_values kvm_host;
+
 /*
  * kvm_mmu_page_role tracks the properties of a shadow page (where shadow page
  * also includes TDP pages) to determine whether or not a page can be used in
@@ -2056,10 +2100,6 @@ struct kvm_arch_async_pf {
 	u64 error_code;
 };
 
-extern u32 __read_mostly kvm_nr_uret_msrs;
-extern bool __read_mostly allow_smaller_maxphyaddr;
-extern bool __read_mostly enable_apicv;
-extern bool __read_mostly enable_ipiv;
 extern bool __read_mostly enable_device_posted_irqs;
 extern struct kvm_x86_ops kvm_x86_ops;
 
@@ -2151,8 +2191,6 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end);
 
 int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3);
 
-extern bool tdp_enabled;
-
 u64 vcpu_tsc_khz(struct kvm_vcpu *vcpu);
 
 /*
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index e1bb663ebbd5..d841a4f486d1 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -4,9 +4,14 @@
 
 #include <linux/kvm_host.h>
 #include "regs.h"
-#include "x86.h"
 #include "cpuid.h"
 
+extern bool tdp_enabled;
+#ifdef CONFIG_X86_64
+extern bool tdp_mmu_enabled;
+#else
+#define tdp_mmu_enabled false
+#endif
 extern bool __read_mostly enable_mmio_caching;
 
 #define PT_WRITABLE_SHIFT 1
@@ -261,14 +266,10 @@ static inline bool kvm_shadow_root_allocated(struct kvm *kvm)
 	return smp_load_acquire(&kvm->arch.shadow_root_allocated);
 }
 
-#ifdef CONFIG_X86_64
-extern bool tdp_mmu_enabled;
-#else
-#define tdp_mmu_enabled false
-#endif
-
 int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
 
+bool kvm_mmu_is_mappable_memslot(const struct kvm_memory_slot *slot);
+
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
 	return !tdp_mmu_enabled || kvm_shadow_root_allocated(kvm);
@@ -300,6 +301,11 @@ static inline void kvm_update_page_stats(struct kvm *kvm, int level, int count)
 	atomic64_add(count, &kvm->stat.pages[level - 1]);
 }
 
+static inline bool mmu_is_nested(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.walk_mmu == &vcpu->arch.nested_mmu;
+}
+
 static inline gpa_t kvm_translate_gpa(struct kvm_vcpu *vcpu,
 				      struct kvm_mmu *mmu,
 				      gpa_t gpa, u64 access,
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index fd55cd031b1c..40c6f4c54f8e 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -6,53 +6,19 @@
 #include <asm/fpu/xstate.h>
 #include <asm/mce.h>
 #include <asm/pvclock.h>
+#include "mmu.h"
 #include "regs.h"
 #include "kvm_emulate.h"
 #include "cpuid.h"
 
 #define KVM_MAX_MCE_BANKS 32
 
-struct kvm_caps {
-	/* control of guest tsc rate supported? */
-	bool has_tsc_control;
-	/* maximum supported tsc_khz for guests */
-	u32  max_guest_tsc_khz;
-	/* number of bits of the fractional part of the TSC scaling ratio */
-	u8   tsc_scaling_ratio_frac_bits;
-	/* maximum allowed value of TSC scaling ratio */
-	u64  max_tsc_scaling_ratio;
-	/* 1ull << kvm_caps.tsc_scaling_ratio_frac_bits */
-	u64  default_tsc_scaling_ratio;
-	/* bus lock detection supported? */
-	bool has_bus_lock_exit;
-	/* notify VM exit supported? */
-	bool has_notify_vmexit;
-	/* bit mask of VM types */
-	u32 supported_vm_types;
-
-	u64 supported_mce_cap;
-	u64 supported_xcr0;
-	u64 supported_xss;
-	u64 supported_perf_cap;
-
-	u64 supported_quirks;
-	u64 inapplicable_quirks;
-};
-
-struct kvm_host_values {
-	/*
-	 * The host's raw MAXPHYADDR, i.e. the number of non-reserved physical
-	 * address bits irrespective of features that repurpose legal bits,
-	 * e.g. MKTME.
-	 */
-	u8 maxphyaddr;
-
-	u64 efer;
-	u64 xcr0;
-	u64 xss;
-	u64 s_cet;
-	u64 arch_capabilities;
-};
+extern u32 __read_mostly kvm_nr_uret_msrs;
+extern bool __read_mostly allow_smaller_maxphyaddr;
+extern bool __read_mostly enable_apicv;
+extern bool __read_mostly enable_ipiv;
+extern bool enable_pmu;
+extern bool enable_mediated_pmu;
 
 void kvm_spurious_fault(void);
 
@@ -252,11 +218,6 @@ static inline bool x86_exception_has_error_code(unsigned int vector)
 	return (1U << vector) & exception_has_error_code;
 }
 
-static inline bool mmu_is_nested(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.walk_mmu == &vcpu->arch.nested_mmu;
-}
-
 static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu *vcpu)
 {
 	return kvm_is_cr4_bit_set(vcpu, X86_CR4_LA57) ? 57 : 48;
@@ -428,12 +389,6 @@ fastpath_t handle_fastpath_wrmsr_imm(struct kvm_vcpu *vcpu, u32 msr, int reg);
 fastpath_t handle_fastpath_hlt(struct kvm_vcpu *vcpu);
 fastpath_t handle_fastpath_invd(struct kvm_vcpu *vcpu);
 
-extern struct kvm_caps kvm_caps;
-extern struct kvm_host_values kvm_host;
-
-extern bool enable_pmu;
-extern bool enable_mediated_pmu;
-
 void kvm_setup_xss_caps(void);
 
 /*

base-commit: b99808a11a42edc2cecced7adf57c2ac231bdb68
-- 
