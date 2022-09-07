Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADC89A7
	for <linux-coco@lists.linux.dev>; Wed,  7 Sep 2022 17:45:40 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id 10so12104829iou.2
        for <linux-coco@lists.linux.dev>; Wed, 07 Sep 2022 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=S/oonIaSgU5+P+xzaVg+rVuKI8oFDrUKwNm4xv6c2Yw=;
        b=jTRq4KN+MFLm8CxxBQM492Nbg+eiBsIkRudHUkBxz64Hp3RNe28+MUJYyF8LTDk+4q
         7k8MA7jbsmfrmus7ejcfugn6Be8my2hjvTMScdCFh7JG45Ttul5ZH6Ez5A5xZzgjsYfe
         tHBvhe4bHR16VgXBomHHGEx/0b5G0H8Uhktbde6vK4Q+5yq7916uNMoiE2mNXscadES/
         GtYFpc9IZDlJGozKkFfe6axLKweAM41WjDa0srIjc0c1lzNMeRD8CmegySAxKXm5KN0w
         SyNr23Zv/pUEdGG2EF11c+pRATnJx7OB7VcfwYOTezE9VI3/LEPVMFaxInFWkvkABxAO
         CeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=S/oonIaSgU5+P+xzaVg+rVuKI8oFDrUKwNm4xv6c2Yw=;
        b=4hiU2j5b3KJH70Fb4KQklUVsLCwQzk7hiqSuP+uBxBTgDcpxT/DPDKrz9+mxH4IWS1
         35PUtEJYiMcFDjbn5g+xILzlF9G2JpnopaibB6hLA4EIONyUOQ9sb0kmjRTNaPc7zOt+
         WY2zXe+5P+6b3LCxx7bqcViKzOJuhrcy2qL+jjBwuhqNj9jld5wlew7RV/TAAcRl/zaU
         hWu+WAcc8CmqscAKZDWNIAJui1sN0e8uemUsgsbSp0N9EDsRtO1adNKHI8VUQgy+FM42
         7xIH3Zb0etGpLf2DZsxlwS+eYIW4KFF5eOunP/RtXfEIaEoCrA/XMR2rg2xgIFwiDfxY
         ZV2A==
X-Gm-Message-State: ACgBeo091o+/nfMsa+9Vdg6tXIJvwk+tDHpjZAAuob6p3qp2P2FULm30
	Q7f/B0mkWRLCH7ZqFnSylT9pJU+toA6rKCnelUYb1Q==
X-Google-Smtp-Source: AA6agR7OhLGMem1qhjuMVUdxb6YLpofj4pnp6ALJAfN+/AJK9FZfXj9IAHFzMkxEStSbHnAdeJ+Y3a++RqzhD6XSTyc=
X-Received: by 2002:a02:cbb4:0:b0:34c:d42:ac34 with SMTP id
 v20-20020a02cbb4000000b0034c0d42ac34mr2694474jap.249.1662572739595; Wed, 07
 Sep 2022 10:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <9151e79d4f5af888242b9589c0a106a49a97837c.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <9151e79d4f5af888242b9589c0a106a49a97837c.1655761627.git.ashish.kalra@amd.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 7 Sep 2022 10:45:28 -0700
Message-ID: <CABpDEunmzbzm-Hwi9iwWmCokfMde9yEZ+aSCrF7LPjqMvMvNeg@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 31/49] KVM: x86: Introduce kvm_mmu_get_tdp_walk()
 for SEV-SNP use
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de, 
	thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, vkuznets@redhat.com, jmattson@google.com, luto@kernel.org, 
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com, 
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com, 
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, 
	michael.roth@amd.com, vbabka@suse.cz, kirill@shutemov.name, 
	ak@linux.intel.com, tony.luck@intel.com, marcorr@google.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, dgilbert@redhat.com, 
	jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 20, 2022 at 4:09 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> The SEV-SNP VMs may call the page state change VMGEXIT to add the GPA
> as private or shared in the RMP table. The page state change VMGEXIT
> will contain the RMP page level to be used in the RMP entry. If the
> page level between the TDP and RMP does not match then, it will result
> in nested-page-fault (RMP violation).
>
> The SEV-SNP VMGEXIT handler will use the kvm_mmu_get_tdp_walk() to get
> the current page-level in the TDP for the given GPA and calculate a
> workable page level. If a GPA is mapped as a 4K-page in the TDP, but
> the guest requested to add the GPA as a 2M in the RMP entry then the
> 2M request will be broken into 4K-pages to keep the RMP and TDP
> page-levels in sync.
>
> TDP SPTEs are RCU protected so need to put kvm_mmu_get_tdp_walk() in RCU
> read-side critical section by using walk_shadow_page_lockless_begin() and
> walk_lockless_shadow_page_lockless_end(). This fixes the
> "suspicious RCU usage" message seen with lockdep kernel build.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  arch/x86/kvm/mmu.h     |  2 ++
>  arch/x86/kvm/mmu/mmu.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> index c99b15e97a0a..d55b5166389a 100644
> --- a/arch/x86/kvm/mmu.h
> +++ b/arch/x86/kvm/mmu.h
> @@ -178,6 +178,8 @@ static inline bool is_nx_huge_page_enabled(void)
>         return READ_ONCE(nx_huge_pages);
>  }
>
> +bool kvm_mmu_get_tdp_walk(struct kvm_vcpu *vcpu, gpa_t gpa, kvm_pfn_t *pfn, int *level);
> +
>  static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
>                                         u32 err, bool prefetch)
>  {
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 569021af349a..c1ac486e096e 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4151,6 +4151,39 @@ kvm_pfn_t kvm_mmu_map_tdp_page(struct kvm_vcpu *vcpu, gpa_t gpa,
>  }
>  EXPORT_SYMBOL_GPL(kvm_mmu_map_tdp_page);
>
> +bool kvm_mmu_get_tdp_walk(struct kvm_vcpu *vcpu, gpa_t gpa, kvm_pfn_t *pfn, int *level)
> +{
> +       u64 sptes[PT64_ROOT_MAX_LEVEL + 1];
> +       int leaf, root;
> +
> +       walk_shadow_page_lockless_begin(vcpu);
> +
> +       if (is_tdp_mmu(vcpu->arch.mmu))
> +               leaf = kvm_tdp_mmu_get_walk(vcpu, gpa, sptes, &root);
> +       else
> +               leaf = get_walk(vcpu, gpa, sptes, &root);
> +
> +       walk_shadow_page_lockless_end(vcpu);
> +
> +       if (unlikely(leaf < 0))
> +               return false;
> +
> +       /* Check if the leaf SPTE is present */
> +       if (!is_shadow_present_pte(sptes[leaf]))
> +               return false;
> +
> +       *pfn = spte_to_pfn(sptes[leaf]);
> +       if (leaf > PG_LEVEL_4K) {
> +               u64 page_mask = KVM_PAGES_PER_HPAGE(leaf) - KVM_PAGES_PER_HPAGE(leaf - 1);
> +               *pfn |= (gpa_to_gfn(gpa) & page_mask);

Similar to the discussion in the other patch, I believe you should
apply the same fix here as well.
It should be
u64 page_mask = KVM_PAGES_PER_HPAGE(leaf) - 1;

> +       }
> +
> +       *level = leaf;
> +
> +       return true;
> +}
> +EXPORT_SYMBOL_GPL(kvm_mmu_get_tdp_walk);
> +
>  static void nonpaging_init_context(struct kvm_mmu *context)
>  {
>         context->page_fault = nonpaging_page_fault;
> --
> 2.25.1
>
