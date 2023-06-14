Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2697F
	for <linux-coco@lists.linux.dev>; Wed, 14 Jun 2023 16:47:12 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b50394a7f2so4561135ad.1
        for <linux-coco@lists.linux.dev>; Wed, 14 Jun 2023 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686761231; x=1689353231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12MPORJYTdRaxuQWvnPe0uInIKYb4u8od8aH9jpQ52k=;
        b=DC2zDgn1z/Yjl45gfG0Phjz8VODs0yrmxTMp6+IqxDmlZlJ7Jz/IED2WIsKnV84zwj
         gn8rdevPHAD0ubADyIhBK93xK5txCIKo7RQSMA75eKXnMoUkw4qA6RIo/7tLRNLZ2XPy
         UY8MhtOrlBwjafEclLoSKWDprDg4piYJAkN9MXfCvktb0r226MJ96HC32f10n29f7WZn
         mJzFfShZQGW2Ag8Wi9EwfPoR542mz2CCr5EFYz9kKLHTHb7NZ2vKr8z03CdgIkfRrgQk
         p0YEL5BPaGWqUDU6jjtp/WwXUJyZauS95FH2F2BtTlEeRP9UpJXrJwRCkt8C/GknA+Wf
         I8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686761231; x=1689353231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12MPORJYTdRaxuQWvnPe0uInIKYb4u8od8aH9jpQ52k=;
        b=A8NJT4Rwy8C3IFkgSTlqBMjcYksyY0rVBR2WlBihekXIn4jt6XztiFYWekge2uyaAm
         7UJd7oHZSnZU+7vuLfbdfbIb2YHnsT8pxkYjIdrRsc9XW6FMcZYQKC0PVcvBmCaasW6v
         VyEYzWgoCsxMubEEP6n4cDOOsHvihFwudVYoUcisBIhr11jBRlkLDt34xV3mtNk7eZP6
         UuFBV5FoxS1i88Vg0c1jeaOt2mHC3nE23u2hrqhMLSMekQcYCybhrWdTkbQC59sqofdw
         yj2RDW9tbkx2jlcwob/G4keFBnYcVFG3uOOBakcEUtwJVWtbKQ4ylM4CAkyU3a/s20Yn
         Wo8w==
X-Gm-Message-State: AC+VfDzhlPNlXopsQjZAgVprPrSFgh+3dXk8YMVUcfQzb50PuoD3wrIX
	+sJuqHO5aB4QMNWimtsnKbk=
X-Google-Smtp-Source: ACHHUZ6t8N6IBSWvdJvyRkmm0c03psAWogPX0vP/Ol0n4nnWls6/IXHJjRosLSS7EI/95vJQ1fS+Ng==
X-Received: by 2002:a17:902:8c84:b0:1b1:a2c3:29c0 with SMTP id t4-20020a1709028c8400b001b1a2c329c0mr11199347plo.24.1686761231544;
        Wed, 14 Jun 2023 09:47:11 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090322ca00b001ae6b4b28adsm7016713plg.130.2023.06.14.09.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:47:10 -0700 (PDT)
Date: Wed, 14 Jun 2023 09:47:09 -0700
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
	nikunj.dadhania@amd.com, liam.merwick@oracle.com,
	zhi.a.wang@intel.com, isaku.yamahata@gmail.com
Subject: Re: [PATCH RFC v9 04/51] KVM: x86: Determine shared/private faults
 using a configurable mask
Message-ID: <20230614164709.GT2244082@ls.amr.corp.intel.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-5-michael.roth@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230612042559.375660-5-michael.roth@amd.com>

On Sun, Jun 11, 2023 at 11:25:12PM -0500,
Michael Roth <michael.roth@amd.com> wrote:

> This will be used to determine whether or not an #NPF should be serviced
> using a normal page vs. a guarded/gmem one.
> 
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/include/asm/kvm_host.h |  7 +++++++
>  arch/x86/kvm/mmu/mmu_internal.h | 35 ++++++++++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index b3bd24f2a390..c26f76641121 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1445,6 +1445,13 @@ struct kvm_arch {
>  	 */
>  #define SPLIT_DESC_CACHE_MIN_NR_OBJECTS (SPTE_ENT_PER_PAGE + 1)
>  	struct kvm_mmu_memory_cache split_desc_cache;
> +
> +	/*
> +	 * When set, used to determine whether a fault should be treated as
> +	 * private in the context of protected VMs which use a separate gmem
> +	 * pool to back private guest pages.
> +	 */
> +	u64 mmu_private_fault_mask;
>  };
>  
>  struct kvm_vm_stat {
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index 780b91e1da9f..9b9e75aa43f4 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -252,6 +252,39 @@ struct kvm_page_fault {
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
> +	if (kvm->arch.mmu_private_fault_mask) {
> +		private_fault = !!(err & kvm->arch.mmu_private_fault_mask);
> +		goto out;
> +	}

What's the convention of err? Can we abstract it by introducing a new bit
PFERR_PRIVATE_MASK? The caller sets it based on arch specific value.
the logic will be
        .is_private = err & PFERR_PRIVATE_MASK;


> +
> +	/*
> +	 * Handling below is for UPM self-tests and guests that treat userspace
> +	 * as the authority on whether a fault should be private or not.
> +	 */
> +	private_fault = kvm_mem_is_private(kvm, gpa >> PAGE_SHIFT);

This code path is sad. One extra slot lookup and xarray look up.
Without mmu lock, the result can change by other vcpu.
Let's find a better way.

> +
> +out:
> +	pr_debug("%s: GFN: 0x%llx, private: %d\n", __func__, gfn, private_fault);
> +	return private_fault;
> +}
> +
>  /*
>   * Return values of handle_mmio_page_fault(), mmu.page_fault(), fast_page_fault(),
>   * and of course kvm_mmu_do_page_fault().
> @@ -301,7 +334,7 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>  		.max_level = KVM_MAX_HUGEPAGE_LEVEL,
>  		.req_level = PG_LEVEL_4K,
>  		.goal_level = PG_LEVEL_4K,
> -		.is_private = kvm_mem_is_private(vcpu->kvm, cr2_or_gpa >> PAGE_SHIFT),
> +		.is_private = kvm_mmu_fault_is_private(vcpu->kvm, cr2_or_gpa, err),
>  	};
>  	int r;
>  
> -- 
> 2.25.1
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
