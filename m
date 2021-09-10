Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5E43FC2
	for <linux-coco@lists.linux.dev>; Fri, 10 Sep 2021 03:32:12 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so473677otq.7
        for <linux-coco@lists.linux.dev>; Thu, 09 Sep 2021 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTubphutJfpMKMW3kXBRjbHgk7H7eKdTsmgTS6nxpsM=;
        b=YF9eMCcNiZ4/bfxHMYH0NMKmZLSBtZIwpGUwKb/uT9ZI+Hp5Yda/I8QH63+nb/rxHq
         N8XhktvRqWFPrhUlj7iLbbJCrLOVzRjtMq04fj5UkkxA04JehtZJY5rc4m6IAP2cCYIr
         4a6pHkGnldF2VcVIDuEORIZtm1rfkXlu4z1zQ5CXxU8U+fw3mrMTq/X7zXtucW9USd8X
         kiYFxOJMWGTAaEfth5F3dZbdWIhXNEQ4Mo+WVX9Oqrb5ksriUCUSp32HkWtFcdCFq5c8
         01y6/4WAgSwxDZg35zT5Bs8prGK+oUn8bdQEnaQxLgTnhuMSXufzpKtsKDB2akHgQJqT
         W9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTubphutJfpMKMW3kXBRjbHgk7H7eKdTsmgTS6nxpsM=;
        b=pV+2WuLrQWRcet/31tdK/kf2tfRll5Tk9QOPXYlpmg76N5RG+9dXkkX9JUskFu4xCu
         z45DEQCY/qQHwkYeFtsag6nK4KUP9FUgUbq1m3jvySxYMhknenemiMgvY4KMoRuXRszT
         WOY4gupbeICMQw6MTrVAgEKOasTAda9OkGnoAXzF/1QGBXGiJC94Cx+EbH/wImshfjQj
         Kpg+0+GsRsVewti+lN0PTd5AdPm50ppy+alPlDFcqg32/nYaPUj5dwuAT+E+qDOECncN
         19I6PMz+VR/uAG/AA9A765bdiWf6brTMoarPiPhtSOVVhyx7yp8yEOlRsISyJjF21FpN
         76ug==
X-Gm-Message-State: AOAM532T68aO9TqiCemYuxkkehAjXSUsJDTzDxS5p0eirv566wRx9w9z
	aOa7BATcdaOsOoLQfZEE5RZePVhB+/DFv1o7Um5WyQLkjtyvPkFI
X-Google-Smtp-Source: ABdhPJzXMqIEjRiSAl5H2lkG9W9hXRQKPxAE5V0R9C0YMiw7TFT6eEGMJmxLYO5sK3QeGSyFMsPzR/qKeYk8XwoPbeQ=
X-Received: by 2002:a05:6830:349c:: with SMTP id c28mr2883661otu.35.1631244731817;
 Thu, 09 Sep 2021 20:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820155918.7518-1-brijesh.singh@amd.com> <20210820155918.7518-24-brijesh.singh@amd.com>
In-Reply-To: <20210820155918.7518-24-brijesh.singh@amd.com>
From: Marc Orr <marcorr@google.com>
Date: Thu, 9 Sep 2021 20:32:00 -0700
Message-ID: <CAA03e5GaROVunr9JkBeULx2KN5kkE8TU_sjBANtAj7E-V6sN_w@mail.gmail.com>
Subject: Re: [PATCH Part2 v5 23/45] KVM: SVM: Add KVM_SNP_INIT command
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kvm list <kvm@vger.kernel.org>, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, 
	Michael Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, 
	Pavan Kumar Paluri <papaluri@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 9:00 AM Brijesh Singh <brijesh.singh@amd.com> wrote:
>
> The KVM_SNP_INIT command is used by the hypervisor to initialize the
> SEV-SNP platform context. In a typical workflow, this command should be the
> first command issued. When creating SEV-SNP guest, the VMM must use this
> command instead of the KVM_SEV_INIT or KVM_SEV_ES_INIT.
>
> The flags value must be zero, it will be extended in future SNP support to
> communicate the optional features (such as restricted INT injection etc).
>
> Co-developed-by: Pavan Kumar Paluri <papaluri@amd.com>
> Signed-off-by: Pavan Kumar Paluri <papaluri@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  .../virt/kvm/amd-memory-encryption.rst        | 27 ++++++++++++
>  arch/x86/include/asm/svm.h                    |  2 +
>  arch/x86/kvm/svm/sev.c                        | 44 ++++++++++++++++++-
>  arch/x86/kvm/svm/svm.h                        |  4 ++
>  include/uapi/linux/kvm.h                      | 13 ++++++
>  5 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/amd-memory-encryption.rst b/Documentation/virt/kvm/amd-memory-encryption.rst
> index 5c081c8c7164..7b1d32fb99a8 100644
> --- a/Documentation/virt/kvm/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/amd-memory-encryption.rst
> @@ -427,6 +427,33 @@ issued by the hypervisor to make the guest ready for execution.
>
>  Returns: 0 on success, -negative on error
>
> +18. KVM_SNP_INIT
> +----------------
> +
> +The KVM_SNP_INIT command can be used by the hypervisor to initialize SEV-SNP
> +context. In a typical workflow, this command should be the first command issued.
> +
> +Parameters (in/out): struct kvm_snp_init
> +
> +Returns: 0 on success, -negative on error
> +
> +::
> +
> +        struct kvm_snp_init {
> +                __u64 flags;
> +        };
> +
> +The flags bitmap is defined as::
> +
> +   /* enable the restricted injection */
> +   #define KVM_SEV_SNP_RESTRICTED_INJET   (1<<0)
> +
> +   /* enable the restricted injection timer */
> +   #define KVM_SEV_SNP_RESTRICTED_TIMER_INJET   (1<<1)
> +
> +If the specified flags is not supported then return -EOPNOTSUPP, and the supported
> +flags are returned.
> +
>  References
>  ==========
>
> diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
> index 44a3f920f886..a39e31845a33 100644
> --- a/arch/x86/include/asm/svm.h
> +++ b/arch/x86/include/asm/svm.h
> @@ -218,6 +218,8 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
>  #define SVM_NESTED_CTL_SEV_ENABLE      BIT(1)
>  #define SVM_NESTED_CTL_SEV_ES_ENABLE   BIT(2)
>
> +#define SVM_SEV_FEAT_SNP_ACTIVE                BIT(0)
> +
>  struct vmcb_seg {
>         u16 selector;
>         u16 attrib;
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 50fddbe56981..93da463545ef 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -235,10 +235,30 @@ static void sev_unbind_asid(struct kvm *kvm, unsigned int handle)
>         sev_decommission(handle);
>  }
>
> +static int verify_snp_init_flags(struct kvm *kvm, struct kvm_sev_cmd *argp)
> +{
> +       struct kvm_snp_init params;
> +       int ret = 0;
> +
> +       if (copy_from_user(&params, (void __user *)(uintptr_t)argp->data, sizeof(params)))
> +               return -EFAULT;
> +
> +       if (params.flags & ~SEV_SNP_SUPPORTED_FLAGS)
> +               ret = -EOPNOTSUPP;
> +
> +       params.flags = SEV_SNP_SUPPORTED_FLAGS;
> +
> +       if (copy_to_user((void __user *)(uintptr_t)argp->data, &params, sizeof(params)))
> +               ret = -EFAULT;
> +
> +       return ret;
> +}
> +
>  static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
>  {
> +       bool es_active = (argp->id == KVM_SEV_ES_INIT || argp->id == KVM_SEV_SNP_INIT);
>         struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> -       bool es_active = argp->id == KVM_SEV_ES_INIT;
> +       bool snp_active = argp->id == KVM_SEV_SNP_INIT;
>         int asid, ret;
>
>         if (kvm->created_vcpus)
> @@ -249,12 +269,22 @@ static int sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp)
>                 return ret;
>
>         sev->es_active = es_active;
> +       sev->snp_active = snp_active;
>         asid = sev_asid_new(sev);
>         if (asid < 0)
>                 goto e_no_asid;
>         sev->asid = asid;
>
> -       ret = sev_platform_init(&argp->error);
> +       if (snp_active) {
> +               ret = verify_snp_init_flags(kvm, argp);
> +               if (ret)
> +                       goto e_free;
> +
> +               ret = sev_snp_init(&argp->error);
> +       } else {
> +               ret = sev_platform_init(&argp->error);
> +       }
> +
>         if (ret)
>                 goto e_free;
>
> @@ -600,6 +630,10 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
>         save->pkru = svm->vcpu.arch.pkru;
>         save->xss  = svm->vcpu.arch.ia32_xss;
>
> +       /* Enable the SEV-SNP feature */
> +       if (sev_snp_guest(svm->vcpu.kvm))
> +               save->sev_features |= SVM_SEV_FEAT_SNP_ACTIVE;
> +
>         return 0;
>  }
>
> @@ -1532,6 +1566,12 @@ int svm_mem_enc_op(struct kvm *kvm, void __user *argp)
>         }
>
>         switch (sev_cmd.id) {
> +       case KVM_SEV_SNP_INIT:
> +               if (!sev_snp_enabled) {
> +                       r = -ENOTTY;
> +                       goto out;
> +               }
> +               fallthrough;
>         case KVM_SEV_ES_INIT:
>                 if (!sev_es_enabled) {
>                         r = -ENOTTY;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 01953522097d..57c3c404b0b3 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -69,6 +69,9 @@ enum {
>  /* TPR and CR2 are always written before VMRUN */
>  #define VMCB_ALWAYS_DIRTY_MASK ((1U << VMCB_INTR) | (1U << VMCB_CR2))
>
> +/* Supported init feature flags */
> +#define SEV_SNP_SUPPORTED_FLAGS                0x0
> +
>  struct kvm_sev_info {
>         bool active;            /* SEV enabled guest */
>         bool es_active;         /* SEV-ES enabled guest */
> @@ -81,6 +84,7 @@ struct kvm_sev_info {
>         u64 ap_jump_table;      /* SEV-ES AP Jump Table address */
>         struct kvm *enc_context_owner; /* Owner of copied encryption context */
>         struct misc_cg *misc_cg; /* For misc cgroup accounting */
> +       u64 snp_init_flags;

This field never gets set anywhere. Should it get set in
`verify_snp_init_flags()`?

>  };
>
>  struct kvm_svm {
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index d9e4aabcb31a..944e2bf601fe 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1712,6 +1712,9 @@ enum sev_cmd_id {
>         /* Guest Migration Extension */
>         KVM_SEV_SEND_CANCEL,
>
> +       /* SNP specific commands */
> +       KVM_SEV_SNP_INIT,
> +
>         KVM_SEV_NR_MAX,
>  };
>
> @@ -1808,6 +1811,16 @@ struct kvm_sev_receive_update_data {
>         __u32 trans_len;
>  };
>
> +/* enable the restricted injection */
> +#define KVM_SEV_SNP_RESTRICTED_INJET   (1 << 0)
> +
> +/* enable the restricted injection timer */
> +#define KVM_SEV_SNP_RESTRICTED_TIMER_INJET   (1 << 1)
> +
> +struct kvm_snp_init {
> +       __u64 flags;
> +};
> +
>  #define KVM_DEV_ASSIGN_ENABLE_IOMMU    (1 << 0)
>  #define KVM_DEV_ASSIGN_PCI_2_3         (1 << 1)
>  #define KVM_DEV_ASSIGN_MASK_INTX       (1 << 2)
> --
> 2.17.1
>
>
