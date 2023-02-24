Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35565CBD
	for <linux-coco@lists.linux.dev>; Fri, 24 Feb 2023 15:06:35 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id e24so8213036ljj.3
        for <linux-coco@lists.linux.dev>; Fri, 24 Feb 2023 07:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3QZB4TfMdCwmEYdbGrhQi/oX08bvtvcvl8M28Xvs1g=;
        b=C1Gl8NWEYK3WMxfju4xsAu9HaKmq8aXEd7DJYgqK6k94bdTiWaCBwCm3WADAIPy67s
         Ea/TP3czgCcAgvWk0Xe7Dp56xBZ45Hj8tFRnF2T0kKu5JyA7D0D/UvkLbSnVm/M1keE0
         Gi3Q2sOiSLEgV8XZRXZ1eB9d3jdOeRxW2k2K3UY9O/oBGLew0FEorv9babK8B+4Iq+G7
         OYtt0Cgumic0hQ0Vt7eoTbWh0+raaiee8xAs7yVZczQJH1shkFo+++BqzLjbnqFAf/Um
         Z99cG9NIXVRMEWoqsQuOmRLugAuZS9r5ShZZ1xMnlr1l41BYy9qp5G8dLK2u3D0ePDcz
         emrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3QZB4TfMdCwmEYdbGrhQi/oX08bvtvcvl8M28Xvs1g=;
        b=bFABDxvtLLcPqQGCjgj6r5t9jZ3YXxa7L841Xo+OhgweuxnEj01W7VdRcfFnosERQ6
         2+qVZYren8I7i8ErXZlKQQnNp9TiruJdFe3o1W1KXPK21PJtS1ohxWDUxCDFGNSRu3yT
         F8Vh3/eZWWIjn0x2EUV93nm/g+jIEPNXu6lTN55GOu50p7IjFyfjqo9v25jCo46LWb50
         6vAFFVd3qU0s5sKdOgcI4y6edyySmF+guUdnZxWJnd0pcwuoUYFqqsf5S3ehRU5oTp0R
         Ie/bzrKHmbvNASxu+gGMekRtXILMFhb/Hw5mDHe7GJGdNGZ8lp7eF5k99E5IhYAY5tsj
         PSLA==
X-Gm-Message-State: AO0yUKUImiP/fcXbA7n6csEO3RlTY4Cz4gV0R+thwMXvGoJoqlw3Iuye
	eY68rX3JI9tWcy62Nzy0CXI=
X-Google-Smtp-Source: AK7set+vcOPNv5TrtvcImV1tnxleSzTn9w+ohnJhraUXj9D7VsufdJnfvxHEIBXmp//BnkJdKCHRqA==
X-Received: by 2002:a05:651c:554:b0:293:2c7e:bf53 with SMTP id q20-20020a05651c055400b002932c7ebf53mr8216266ljp.0.1677251193686;
        Fri, 24 Feb 2023 07:06:33 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id p25-20020a2ea4d9000000b00295a32db4e1sm346142ljm.91.2023.02.24.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:06:33 -0800 (PST)
Date: Fri, 24 Feb 2023 17:06:31 +0200
From: Zhi Wang <zhi.wang.linux@gmail.com>
To: Michael Roth <michael.roth@amd.com>
Cc: <kvm@vger.kernel.org>, <linux-coco@lists.linux.dev>,
 <linux-mm@kvack.org>, <linux-crypto@vger.kernel.org>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <jroedel@suse.de>, <thomas.lendacky@amd.com>, <hpa@zytor.com>,
 <ardb@kernel.org>, <pbonzini@redhat.com>, <seanjc@google.com>,
 <vkuznets@redhat.com>, <jmattson@google.com>, <luto@kernel.org>,
 <dave.hansen@linux.intel.com>, <slp@redhat.com>, <pgonda@google.com>,
 <peterz@infradead.org>, <srinivas.pandruvada@linux.intel.com>,
 <rientjes@google.com>, <dovmurik@linux.ibm.com>, <tobin@ibm.com>,
 <bp@alien8.de>, <vbabka@suse.cz>, <kirill@shutemov.name>,
 <ak@linux.intel.com>, <tony.luck@intel.com>, <marcorr@google.com>,
 <sathyanarayanan.kuppuswamy@linux.intel.com>, <alpergun@google.com>,
 <dgilbert@redhat.com>, <jarkko@kernel.org>, <ashish.kalra@amd.com>,
 <nikunj.dadhania@amd.com>, Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH RFC v8 41/56] KVM: SVM: Add support to handle MSR based
 Page State Change VMGEXIT
Message-ID: <20230224170631.000016f1@gmail.com>
In-Reply-To: <20230220183847.59159-42-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-42-michael.roth@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Feb 2023 12:38:32 -0600
Michael Roth <michael.roth@amd.com> wrote:

> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> SEV-SNP VMs can ask the hypervisor to change the page state in the RMP
> table to be private or shared using the Page State Change MSR protocol
> as defined in the GHCB specification.
> 
> Forward these requests to userspace via KVM_EXIT_VMGEXIT so the VMM can
> issue the KVM ioctls to update the page state accordingly.
> 

It would be better to describe the design purpose. Like, why should the
page state change VMGEIXT be forwarded to the userspace instead of being
handled in the kernel.

> Co-developed-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h |  9 ++++++++
>  arch/x86/kvm/svm/sev.c            | 25 +++++++++++++++++++++++
>  arch/x86/kvm/trace.h              | 34 +++++++++++++++++++++++++++++++
>  arch/x86/kvm/x86.c                |  1 +
>  4 files changed, 69 insertions(+)
> 
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 0a9055cdfae2..ee38f7408470 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -93,6 +93,10 @@ enum psc_op {
>  };
>  
>  #define GHCB_MSR_PSC_REQ		0x014
> +#define GHCB_MSR_PSC_GFN_POS		12
> +#define GHCB_MSR_PSC_GFN_MASK		GENMASK_ULL(39, 0)
> +#define GHCB_MSR_PSC_OP_POS		52
> +#define GHCB_MSR_PSC_OP_MASK		0xf
>  #define GHCB_MSR_PSC_REQ_GFN(gfn, op)			\
>  	/* GHCBData[55:52] */				\
>  	(((u64)((op) & 0xf) << 52) |			\
> @@ -102,6 +106,11 @@ enum psc_op {
>  	GHCB_MSR_PSC_REQ)
>  
>  #define GHCB_MSR_PSC_RESP		0x015
> +#define GHCB_MSR_PSC_ERROR_POS		32
> +#define GHCB_MSR_PSC_ERROR_MASK		GENMASK_ULL(31, 0)
> +#define GHCB_MSR_PSC_ERROR		GENMASK_ULL(31, 0)
> +#define GHCB_MSR_PSC_RSVD_POS		12
> +#define GHCB_MSR_PSC_RSVD_MASK		GENMASK_ULL(19, 0)
>  #define GHCB_MSR_PSC_RESP_VAL(val)			\
>  	/* GHCBData[63:32] */				\
>  	(((u64)(val) & GENMASK_ULL(63, 32)) >> 32)
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 2613311f4fcc..a1a2686dde7b 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -30,6 +30,7 @@
>  #include "svm_ops.h"
>  #include "cpuid.h"
>  #include "trace.h"
> +#include "mmu.h"
>  
>  #ifndef CONFIG_KVM_AMD_SEV
>  /*
> @@ -3345,6 +3346,23 @@ static void set_ghcb_msr(struct vcpu_svm *svm, u64 value)
>  	svm->vmcb->control.ghcb_gpa = value;
>  }
>  
> +/*
> + * TODO: need to get the value set by userspace in vcpu->run->vmgexit.ghcb_msr
> + * and process that here accordingly.
> + */
> +static int snp_complete_psc_msr_protocol(struct kvm_vcpu *vcpu)
> +{
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
> +	set_ghcb_msr_bits(svm, 0,
> +			  GHCB_MSR_PSC_ERROR_MASK, GHCB_MSR_PSC_ERROR_POS);
> +
> +	set_ghcb_msr_bits(svm, 0, GHCB_MSR_PSC_RSVD_MASK, GHCB_MSR_PSC_RSVD_POS);
> +	set_ghcb_msr_bits(svm, GHCB_MSR_PSC_RESP, GHCB_MSR_INFO_MASK, GHCB_MSR_INFO_POS);
> +
> +	return 1; /* resume */
> +}
> +
>  static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  {
>  	struct vmcb_control_area *control = &svm->vmcb->control;
> @@ -3445,6 +3463,13 @@ static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  				  GHCB_MSR_INFO_POS);
>  		break;
>  	}
> +	case GHCB_MSR_PSC_REQ:
> +		vcpu->run->exit_reason = KVM_EXIT_VMGEXIT;
> +		vcpu->run->vmgexit.ghcb_msr = control->ghcb_gpa;
> +		vcpu->arch.complete_userspace_io = snp_complete_psc_msr_protocol;
> +
> +		ret = -1;
> +		break;
>  	case GHCB_MSR_TERM_REQ: {
>  		u64 reason_set, reason_code;
>  
> diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
> index 83843379813e..65861d2d086c 100644
> --- a/arch/x86/kvm/trace.h
> +++ b/arch/x86/kvm/trace.h
> @@ -7,6 +7,7 @@
>  #include <asm/svm.h>
>  #include <asm/clocksource.h>
>  #include <asm/pvclock-abi.h>
> +#include <asm/sev-common.h>
>  
>  #undef TRACE_SYSTEM
>  #define TRACE_SYSTEM kvm
> @@ -1831,6 +1832,39 @@ TRACE_EVENT(kvm_vmgexit_msr_protocol_exit,
>  		  __entry->vcpu_id, __entry->ghcb_gpa, __entry->result)
>  );
>  
> +/*
> + * Tracepoint for the SEV-SNP page state change processing
> + */
> +#define psc_operation					\
> +	{SNP_PAGE_STATE_PRIVATE, "private"},		\
> +	{SNP_PAGE_STATE_SHARED,  "shared"}		\
> +
> +TRACE_EVENT(kvm_snp_psc,
> +	TP_PROTO(unsigned int vcpu_id, u64 pfn, u64 gpa, u8 op, int level),
> +	TP_ARGS(vcpu_id, pfn, gpa, op, level),
> +
> +	TP_STRUCT__entry(
> +		__field(int, vcpu_id)
> +		__field(u64, pfn)
> +		__field(u64, gpa)
> +		__field(u8, op)
> +		__field(int, level)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->vcpu_id = vcpu_id;
> +		__entry->pfn = pfn;
> +		__entry->gpa = gpa;
> +		__entry->op = op;
> +		__entry->level = level;
> +	),
> +
> +	TP_printk("vcpu %u, pfn %llx, gpa %llx, op %s, level %d",
> +		  __entry->vcpu_id, __entry->pfn, __entry->gpa,
> +		  __print_symbolic(__entry->op, psc_operation),
> +		  __entry->level)
> +);
> +
>  #endif /* _TRACE_KVM_H */
>  
>  #undef TRACE_INCLUDE_PATH
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 268c3d16894d..0154fc7a28c1 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13515,6 +13515,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_vmgexit_enter);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_vmgexit_exit);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_vmgexit_msr_protocol_enter);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_vmgexit_msr_protocol_exit);
> +EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_snp_psc);
>  
>  static int __init kvm_x86_init(void)
>  {

