Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC727B
	for <linux-coco@lists.linux.dev>; Thu, 18 Aug 2022 03:47:44 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id p9so248590ilq.13
        for <linux-coco@lists.linux.dev>; Wed, 17 Aug 2022 20:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=awFGwwSRocOeifmjAPEDB1aSCbnwQlgCGRRbkk5b0mw=;
        b=HuuwBZomHQD9jDKeuTr2VNO9olgvvd8D0ZYsRVU+dLL2RPb2ssLOWCDp2onOIcQ1PZ
         kfoCj9T0R0Xfbfx7lF24moS/6w5INxaWGwptve9xDhrNP2Adv4KzaBkwltgUq1z21AWm
         uHVDVvnl6LcFUbGVTqMFFxCD/aL6FhbjXqH7OMB/7kfR1fPv0czzY1fd//fIMposD07f
         b9aTXeoPVIk/RWKntVLDYbMIHvqFhziJDS0KKv60RjWzmPM4vTWW81Fe2uEsoEo0KPwq
         5EJFihNKM43HercJ872rCFaYNpPZ/exlMZgcpbYowu087PnQKgRbawlj5pxDv6RAdF1V
         bqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=awFGwwSRocOeifmjAPEDB1aSCbnwQlgCGRRbkk5b0mw=;
        b=c4duuuFSNTLGub325Kl9MpF5LMVsiRWLYdf5XphZGlBfY8j/rNKsC0TwmQamSynZ7C
         uUNS1W2I29NzZMzdyg6M++m81tT5WDL5H3FjrcnoYVOZlYNw774eudYz0sd5QlGEkMlT
         DdyybtGxL5mCAqBKEkAVvvP+CnK+Z+2+ZcKUsdQNRYy2HZTfNsdqz34Pto2Y4ai3ZHAj
         wKIXDQjkstTLm4jmIGYQMZwU//sZWmgffzb5oUDU1dW4O1Shaoo+atPjZJ9l5rb3hBHa
         XsjZ23Dn5tD1OMu1JhUpsT1+zmO9HD1C9hvMmV5C0szgC5dmh5dljt7jNtMHMIO88hwm
         dM7w==
X-Gm-Message-State: ACgBeo2WRBMPBsSVlr0JzJB3cfNR/W5DHEoN8mn0Wvg/ZaMH9wecOkdN
	OXCkL98sSnwHBHp/gwY25zVa3AR12QB6oum5IkI2dA==
X-Google-Smtp-Source: AA6agR4qMa4OQ91sIzkDhZ6sJxq3ep4yI+PyN9yclK8K6pKbEhOC904SXmSnOpmJe9LJ12apxNw4HTohCoA9TKmMWt0=
X-Received: by 2002:a92:3652:0:b0:2df:4133:787 with SMTP id
 d18-20020a923652000000b002df41330787mr590419ilf.39.1660794463902; Wed, 17 Aug
 2022 20:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1655761627.git.ashish.kalra@amd.com> <34246866043db7bab34a92fe22f359667ab155a0.1655761627.git.ashish.kalra@amd.com>
In-Reply-To: <34246866043db7bab34a92fe22f359667ab155a0.1655761627.git.ashish.kalra@amd.com>
From: Alper Gun <alpergun@google.com>
Date: Wed, 17 Aug 2022 20:47:33 -0700
Message-ID: <CABpDEukAEGwb9w12enO=fhSbHbchypsOdO2dkR4Jei3wDW6NWg@mail.gmail.com>
Subject: Re: [PATCH Part2 v6 39/49] KVM: SVM: Introduce ops for the post gfn
 map and unmap
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

On Mon, Jun 20, 2022 at 4:12 PM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> When SEV-SNP is enabled in the guest VM, the guest memory pages can
> either be a private or shared. A write from the hypervisor goes through
> the RMP checks. If hardware sees that hypervisor is attempting to write
> to a guest private page, then it triggers an RMP violation #PF.
>
> To avoid the RMP violation with GHCB pages, added new post_{map,unmap}_gfn
> functions to verify if its safe to map GHCB pages.  Uses a spinlock to
> protect against the page state change for existing mapped pages.
>
> Need to add generic post_{map,unmap}_gfn() ops that can be used to verify
> that its safe to map a given guest page in the hypervisor.
>
> This patch will need to be revisited later after consensus is reached on
> how to manage guest private memory as probably UPM private memslots will
> be able to handle this page state change more gracefully.
>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  arch/x86/include/asm/kvm-x86-ops.h |  1 +
>  arch/x86/include/asm/kvm_host.h    |  3 ++
>  arch/x86/kvm/svm/sev.c             | 48 ++++++++++++++++++++++++++++--
>  arch/x86/kvm/svm/svm.c             |  3 ++
>  arch/x86/kvm/svm/svm.h             | 11 +++++++
>  5 files changed, 64 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
> index e0068e702692..2dd2bc0cf4c3 100644
> --- a/arch/x86/include/asm/kvm-x86-ops.h
> +++ b/arch/x86/include/asm/kvm-x86-ops.h
> @@ -130,6 +130,7 @@ KVM_X86_OP(vcpu_deliver_sipi_vector)
>  KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
>  KVM_X86_OP(alloc_apic_backing_page)
>  KVM_X86_OP_OPTIONAL(rmp_page_level_adjust)
> +KVM_X86_OP(update_protected_guest_state)
>
>  #undef KVM_X86_OP
>  #undef KVM_X86_OP_OPTIONAL
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 49b217dc8d7e..8abc0e724f5c 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1522,7 +1522,10 @@ struct kvm_x86_ops {
>         unsigned long (*vcpu_get_apicv_inhibit_reasons)(struct kvm_vcpu *vcpu);
>
>         void *(*alloc_apic_backing_page)(struct kvm_vcpu *vcpu);
> +
>         void (*rmp_page_level_adjust)(struct kvm *kvm, kvm_pfn_t pfn, int *level);
> +
> +       int (*update_protected_guest_state)(struct kvm_vcpu *vcpu);
>  };
>
>  struct kvm_x86_nested_ops {
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index cb2d1bbb862b..4ed90331bca0 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -341,6 +341,7 @@ static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
>                 if (ret)
>                         goto e_free;
>
> +               spin_lock_init(&sev->psc_lock);
>                 ret = sev_snp_init(&argp->error);
>         } else {
>                 ret = sev_platform_init(&argp->error);
> @@ -2828,19 +2829,28 @@ static inline int svm_map_ghcb(struct vcpu_svm *svm, struct kvm_host_map *map)
>  {
>         struct vmcb_control_area *control = &svm->vmcb->control;
>         u64 gfn = gpa_to_gfn(control->ghcb_gpa);
> +       struct kvm_vcpu *vcpu = &svm->vcpu;
>
> -       if (kvm_vcpu_map(&svm->vcpu, gfn, map)) {
> +       if (kvm_vcpu_map(vcpu, gfn, map)) {
>                 /* Unable to map GHCB from guest */
>                 pr_err("error mapping GHCB GFN [%#llx] from guest\n", gfn);
>                 return -EFAULT;
>         }
>
> +       if (sev_post_map_gfn(vcpu->kvm, map->gfn, map->pfn)) {
> +               kvm_vcpu_unmap(vcpu, map, false);
> +               return -EBUSY;
> +       }
> +
>         return 0;
>  }
>
>  static inline void svm_unmap_ghcb(struct vcpu_svm *svm, struct kvm_host_map *map)
>  {
> -       kvm_vcpu_unmap(&svm->vcpu, map, true);
> +       struct kvm_vcpu *vcpu = &svm->vcpu;
> +
> +       kvm_vcpu_unmap(vcpu, map, true);
> +       sev_post_unmap_gfn(vcpu->kvm, map->gfn, map->pfn);
>  }
>
>  static void dump_ghcb(struct vcpu_svm *svm)
> @@ -3383,6 +3393,8 @@ static int __snp_handle_page_state_change(struct kvm_vcpu *vcpu, enum psc_op op,
>                                 return PSC_UNDEF_ERR;
>                 }
>
> +               spin_lock(&sev->psc_lock);
> +
>                 write_lock(&kvm->mmu_lock);
>
>                 rc = kvm_mmu_get_tdp_walk(vcpu, gpa, &pfn, &npt_level);
> @@ -3417,6 +3429,8 @@ static int __snp_handle_page_state_change(struct kvm_vcpu *vcpu, enum psc_op op,
>
>                 write_unlock(&kvm->mmu_lock);
>
> +               spin_unlock(&sev->psc_lock);

There is a corner case where the psc_lock is not released. If
kvm_mmu_get_tdp_walk fails, the lock will be kept and will cause soft
lockup.

> +
>                 if (rc) {
>                         pr_err_ratelimited("Error op %d gpa %llx pfn %llx level %d rc %d\n",
>                                            op, gpa, pfn, level, rc);
> @@ -3965,3 +3979,33 @@ void sev_rmp_page_level_adjust(struct kvm *kvm, kvm_pfn_t pfn, int *level)
>         /* Adjust the level to keep the NPT and RMP in sync */
>         *level = min_t(size_t, *level, rmp_level);
>  }
> +
> +int sev_post_map_gfn(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn)
> +{
> +       struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +       int level;
> +
> +       if (!sev_snp_guest(kvm))
> +               return 0;
> +
> +       spin_lock(&sev->psc_lock);
> +
> +       /* If pfn is not added as private then fail */
> +       if (snp_lookup_rmpentry(pfn, &level) == 1) {
> +               spin_unlock(&sev->psc_lock);
> +               pr_err_ratelimited("failed to map private gfn 0x%llx pfn 0x%llx\n", gfn, pfn);
> +               return -EBUSY;
> +       }
> +
> +       return 0;
> +}
> +
> +void sev_post_unmap_gfn(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn)
> +{
> +       struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +
> +       if (!sev_snp_guest(kvm))
> +               return;
> +
> +       spin_unlock(&sev->psc_lock);
> +}
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index b24e0171cbf2..1c8e035ba011 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4734,7 +4734,10 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
>         .vcpu_get_apicv_inhibit_reasons = avic_vcpu_get_apicv_inhibit_reasons,
>
>         .alloc_apic_backing_page = svm_alloc_apic_backing_page,
> +
>         .rmp_page_level_adjust = sev_rmp_page_level_adjust,
> +
> +       .update_protected_guest_state = sev_snp_update_protected_guest_state,
>  };
>
>  /*
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 54ff56cb6125..3fd95193ed8d 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -79,19 +79,25 @@ struct kvm_sev_info {
>         bool active;            /* SEV enabled guest */
>         bool es_active;         /* SEV-ES enabled guest */
>         bool snp_active;        /* SEV-SNP enabled guest */
> +
>         unsigned int asid;      /* ASID used for this guest */
>         unsigned int handle;    /* SEV firmware handle */
>         int fd;                 /* SEV device fd */
> +
>         unsigned long pages_locked; /* Number of pages locked */
>         struct list_head regions_list;  /* List of registered regions */
> +
>         u64 ap_jump_table;      /* SEV-ES AP Jump Table address */
> +
>         struct kvm *enc_context_owner; /* Owner of copied encryption context */
>         struct list_head mirror_vms; /* List of VMs mirroring */
>         struct list_head mirror_entry; /* Use as a list entry of mirrors */
>         struct misc_cg *misc_cg; /* For misc cgroup accounting */
>         atomic_t migration_in_progress;
> +
>         u64 snp_init_flags;
>         void *snp_context;      /* SNP guest context page */
> +       spinlock_t psc_lock;
>  };
>
>  struct kvm_svm {
> @@ -702,6 +708,11 @@ void sev_es_prepare_switch_to_guest(struct sev_es_save_area *hostsa);
>  void sev_es_unmap_ghcb(struct vcpu_svm *svm);
>  struct page *snp_safe_alloc_page(struct kvm_vcpu *vcpu);
>  void sev_rmp_page_level_adjust(struct kvm *kvm, kvm_pfn_t pfn, int *level);
> +int sev_post_map_gfn(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn);
> +void sev_post_unmap_gfn(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn);
> +void handle_rmp_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code);
> +void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu);
> +int sev_snp_update_protected_guest_state(struct kvm_vcpu *vcpu);
>
>  /* vmenter.S */
>
> --
> 2.25.1
>
