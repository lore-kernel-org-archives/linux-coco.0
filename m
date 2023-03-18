Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125F1622
	for <linux-coco@lists.linux.dev>; Sat, 18 Mar 2023 04:51:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso11130806pjb.3
        for <linux-coco@lists.linux.dev>; Fri, 17 Mar 2023 21:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679115100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4U0uReejjG+yTEfEsRubyWXyJoAmN8/B87eZU0BB40=;
        b=JWjQ9V377H9Djvzxw838yC/PJvbTJ7wzP4GginxekytJZS555W40pzyA/W1T304cEt
         VeZdBk0n7yUQfvdBTL/61af41Mx0WAS4KwWgjLb+iX4Uu0hgrltCjhKc3kzf/wl8Szw7
         FDF4nM2UtNjTUvYjrk5eQEwIA7f/t56l8Aq+tdOaoFeTQEcbGYWenAHhJtiRJnIC+vzO
         zlWuV077LlUhZKHUMikdcXqpWxMe80FtRhqukpff7jds51gsnTZHnkVAIBWHnrkM0hx+
         p5D8CDLsc9dQpWuUKeR0Vg4VAXxgnbYhwiefNFpuGMFcUiVmWaj05iQcWpWK0IAFe71r
         De6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679115100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4U0uReejjG+yTEfEsRubyWXyJoAmN8/B87eZU0BB40=;
        b=KOCpptfsTlf5u1fYXw3ooS0DIoSwvK8d6cO+Tx6dXvCMA95GmFPqp/F7qTWG0ix5vH
         wkuUIeJAtSi9VQT+O8MlpPnXlPdVyUp9oDr98eTd3WdR1RbIFaDKywDrFvyEZjyTAHfF
         YY4z3dk0mEUZQlbv9ExeRFxJhTxgncQiMhmOKPY4ODmYmYKMPBwAovzgbaSlxevxZCiR
         1tzqpJGHvCCLRP3IglaAG2zU24zbJPhA5eNQ5sI+owRGBa2tb8CwgOo8YQWHVdpGkNRY
         p65t8ELwFAv14bF6fRTM5JAVsZNKn/wJPnwv7LMx1GzPjcKszPwwqq9dXk+W+jy3d0fm
         /HmA==
X-Gm-Message-State: AO0yUKUQgxZS+QWvqYhyCZFj4Z45O//Ue4PU7t1CW1U9+n4m1U+c8Wvq
	ep2hX3fkt4PN0rzDqj3jheA=
X-Google-Smtp-Source: AK7set+5UlzU6279vQP5wOqmJRWEo/tBTficT+QdsGn7DnffW3NMtkje3fk8RNO3/ADXWM9YVSwiSg==
X-Received: by 2002:a05:6a20:2a26:b0:cc:aedf:9a1e with SMTP id e38-20020a056a202a2600b000ccaedf9a1emr8503598pzh.61.1679115100171;
        Fri, 17 Mar 2023 21:51:40 -0700 (PDT)
Received: from localhost ([192.55.54.55])
        by smtp.gmail.com with ESMTPSA id v25-20020aa78519000000b005a8bdc18453sm2363189pfn.35.2023.03.17.21.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 21:51:39 -0700 (PDT)
Date: Fri, 17 Mar 2023 21:51:37 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	bp@alien8.de, vbabka@suse.cz, kirill@shutemov.name,
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
	dgilbert@redhat.com, jarkko@kernel.org, ashish.kalra@amd.com,
	nikunj.dadhania@amd.com, isaku.yamahata@gmail.com
Subject: Re: [PATCH RFC v8 01/56] KVM: x86: Add 'fault_is_private' x86 op
Message-ID: <20230318045137.GC408922@ls.amr.corp.intel.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
 <20230220183847.59159-2-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230220183847.59159-2-michael.roth@amd.com>

On Mon, Feb 20, 2023 at 12:37:52PM -0600,
Michael Roth <michael.roth@amd.com> wrote:

> This callback is used by the KVM MMU to check whether a #NPF was for a
> private GPA or not.
> 
> In some cases the full 64-bit error code for the #NPF will be needed to
> make this determination, so also update kvm_mmu_do_page_fault() to
> accept the full 64-bit value so it can be plumbed through to the
> callback.

We can split 64-bit part into the independent patch.

> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  1 +
>  arch/x86/include/asm/kvm_host.h    |  1 +
>  arch/x86/kvm/mmu/mmu.c             |  3 +--
>  arch/x86/kvm/mmu/mmu_internal.h    | 37 +++++++++++++++++++++++++++---
>  4 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index 8dc345cc6318..72183da010b8 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -131,6 +131,7 @@ KVM_X86_OP(msr_filter_changed)
>  KVM_X86_OP(complete_emulated_msr)
>  KVM_X86_OP(vcpu_deliver_sipi_vector)
>  KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
> +KVM_X86_OP_OPTIONAL_RET0(fault_is_private);
>  
>  #undef KVM_X86_OP
>  #undef KVM_X86_OP_OPTIONAL
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index e552374f2357..f856d689dda0 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1643,6 +1643,7 @@ struct kvm_x86_ops {
>  
>  	void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
>  			     int root_level);
> +	bool (*fault_is_private)(struct kvm *kvm, gpa_t gpa, u64 error_code, bool *private_fault);
>  
>  	bool (*has_wbinvd_exit)(void);
>  
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index eda615f3951c..fb3f34b7391c 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -5724,8 +5724,7 @@ int noinline kvm_mmu_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u64 err
>  	}
>  
>  	if (r == RET_PF_INVALID) {
> -		r = kvm_mmu_do_page_fault(vcpu, cr2_or_gpa,
> -					  lower_32_bits(error_code), false);
> +		r = kvm_mmu_do_page_fault(vcpu, cr2_or_gpa, error_code, false);
>  		if (KVM_BUG_ON(r == RET_PF_INVALID, vcpu->kvm))
>  			return -EIO;
>  	}
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index e642d431df4b..557a001210df 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -231,6 +231,37 @@ struct kvm_page_fault {
>  
>  int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
>  
> +static bool kvm_mmu_fault_is_private(struct kvm *kvm, gpa_t gpa, u64 err)
> +{
> +	struct kvm_memory_slot *slot;
> +	bool private_fault = false;
> +	gfn_t gfn = gpa_to_gfn(gpa);
> +
> +	slot = gfn_to_memslot(kvm, gfn);
> +	if (!slot) {
> +		pr_debug("%s: no slot, GFN: 0x%llx\n", __func__, gfn);
> +		goto out;
> +	}
> +
> +	if (!kvm_slot_can_be_private(slot)) {
> +		pr_debug("%s: slot is not private, GFN: 0x%llx\n", __func__, gfn);
> +		goto out;
> +	}
> +
> +	if (static_call(kvm_x86_fault_is_private)(kvm, gpa, err, &private_fault))
> +		goto out;
> +
> +	/*
> +	 * Handling below is for UPM self-tests and guests that treat userspace
> +	 * as the authority on whether a fault should be private or not.
> +	 */
> +	private_fault = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);
> +
> +out:
> +	pr_debug("%s: GFN: 0x%llx, private: %d\n", __func__, gfn, private_fault);
> +	return private_fault;
> +}
> +
>  /*
>   * Return values of handle_mmio_page_fault(), mmu.page_fault(), fast_page_fault(),
>   * and of course kvm_mmu_do_page_fault().
> @@ -262,11 +293,11 @@ enum {
>  };
>  
>  static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> -					u32 err, bool prefetch)
> +					u64 err, bool prefetch)
>  {
>  	struct kvm_page_fault fault = {
>  		.addr = cr2_or_gpa,
> -		.error_code = err,
> +		.error_code = lower_32_bits(err),
>  		.exec = err & PFERR_FETCH_MASK,
>  		.write = err & PFERR_WRITE_MASK,
>  		.present = err & PFERR_PRESENT_MASK,
> @@ -280,7 +311,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  		.max_level = KVM_MAX_HUGEPAGE_LEVEL,
>  		.req_level = PG_LEVEL_4K,
>  		.goal_level = PG_LEVEL_4K,
> -		.is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
> +		.is_private = kvm_mmu_fault_is_private(vcpu->kvm, cr2_or_gpa, err),

I don't think kvm_mmu_fault_is_private(). It's too heavy. We can make it
it's own. I.e. the following.

From b0f914a1a4d154f076c0294831ce9ef0df7eb3d3 Mon Sep 17 00:00:00 2001
Message-Id: <b0f914a1a4d154f076c0294831ce9ef0df7eb3d3.1679114841.git.isaku.yamahata@intel.com>
In-Reply-To: <428a676face7a06a90e59dca1c32941c9b6ee001.1679114841.git.isaku.yamahata@intel.com>
References: <428a676face7a06a90e59dca1c32941c9b6ee001.1679114841.git.isaku.yamahata@intel.com>
From: Isaku Yamahata <isaku.yamahata@intel.com>
Date: Fri, 17 Mar 2023 11:18:13 -0700
Subject: [PATCH 2/4] KVM: x86: Add 'fault_is_private' x86 op

This callback is used by the KVM MMU to check whether a KVM page fault was
for a private GPA or not.

Originally-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  1 +
 arch/x86/kvm/mmu.h                 | 19 +++++++++++++++++++
 arch/x86/kvm/mmu/mmu_internal.h    |  2 +-
 arch/x86/kvm/x86.c                 |  8 ++++++++
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index e1f57905c8fe..dc5f18ac0bd5 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -99,6 +99,7 @@ KVM_X86_OP_OPTIONAL_RET0(set_tss_addr)
 KVM_X86_OP_OPTIONAL_RET0(set_identity_map_addr)
 KVM_X86_OP_OPTIONAL_RET0(get_mt_mask)
 KVM_X86_OP(load_mmu_pgd)
+KVM_X86_OP(fault_is_private)
 KVM_X86_OP_OPTIONAL(link_private_spt)
 KVM_X86_OP_OPTIONAL(free_private_spt)
 KVM_X86_OP_OPTIONAL(split_private_spt)
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 59196a80c3c8..0382d236fbf4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1730,6 +1730,7 @@ struct kvm_x86_ops {
 
 	void (*load_mmu_pgd)(struct kvm_vcpu *vcpu, hpa_t root_hpa,
 			     int root_level);
+	bool (*fault_is_private)(struct kvm *kvm, gpa_t gpa, u64 error_code);
 
 	int (*link_private_spt)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
 				void *private_spt);
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 4aaef2132b97..1f21680b9b97 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -289,6 +289,25 @@ static inline gpa_t kvm_translate_gpa(struct kvm_vcpu *vcpu,
 	return translate_nested_gpa(vcpu, gpa, access, exception);
 }
 
+static inline bool kvm_mmu_fault_is_private_default(struct kvm *kvm, gpa_t gpa, u64 err)
+{
+	struct kvm_memory_slot *slot;
+	gfn_t gfn = gpa_to_gfn(gpa);
+
+	slot = gfn_to_memslot(kvm, gfn);
+	if (!slot)
+		return false;
+
+	if (!kvm_slot_can_be_private(slot))
+		return false;
+
+	/*
+	 * Handling below is for UPM self-tests and guests that treat userspace
+	 * as the authority on whether a fault should be private or not.
+	 */
+	return kvm_mem_is_private(kvm, gfn);
+}
+
 static inline gfn_t kvm_gfn_shared_mask(const struct kvm *kvm)
 {
 #ifdef CONFIG_KVM_MMU_PRIVATE
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index bb5709f1cb57..6b54b069d1ed 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -445,7 +445,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 		.max_level = vcpu->kvm->arch.tdp_max_page_level,
 		.req_level = PG_LEVEL_4K,
 		.goal_level = PG_LEVEL_4K,
-		.is_private = kvm_is_private_gpa(vcpu->kvm, cr2_or_gpa),
+		.is_private = static_call(kvm_x86_fault_is_private)(vcpu->kvm, cr2_or_gpa, err),
 	};
 	int r;
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index fd14368c6bc8..0311ab450330 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9419,6 +9419,14 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 #undef __KVM_X86_OP
 
 	kvm_pmu_ops_update(ops->pmu_ops);
+
+	/*
+	 * TODO: Once all backend fills this option, remove this and the default
+	 * function.
+	 */
+	if (!ops->runtime_ops->fault_is_private)
+		static_call_update(kvm_x86_fault_is_private,
+				   kvm_mmu_fault_is_private_default);
 }
 
 static int kvm_x86_check_processor_compatibility(void)
-- 
2.25.1




-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
