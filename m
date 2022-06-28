Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977733D6
	for <linux-coco@lists.linux.dev>; Tue, 28 Jun 2022 13:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656422901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PH7wMQRYi1ZWFVxyL/3d+sZ7rcf181kH7ObPj88vxe0=;
	b=F9PUl2wHiIKfa/qU5oPIxy3SoW2CfyHyiMjaLq4eNL7m0SkruLbDrhpXyvCmevltVFrTbg
	ELNw0PKPWgRLcYEnU48F7WC/7UAqSAO8unCV9dYuSJQoSMlWIaYUzDRcXQPVAZlGhBW228
	dupv+LoDSPQ0uqFHuyM5Ki4kk9MoH3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-DrvC1tv1P_yPZidXA409Uw-1; Tue, 28 Jun 2022 09:28:17 -0400
X-MC-Unique: DrvC1tv1P_yPZidXA409Uw-1
Received: by mail-wm1-f72.google.com with SMTP id k16-20020a7bc310000000b0038e6cf00439so7136756wmj.0
        for <linux-coco@lists.linux.dev>; Tue, 28 Jun 2022 06:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PH7wMQRYi1ZWFVxyL/3d+sZ7rcf181kH7ObPj88vxe0=;
        b=IOAzqwGSYlTqdIn5Gy49SEmG6Os9CwKZ5hpQ+9QepGbqT6oFUIZUwy48ZSNZPl/hgR
         qKwghgvqcdvzYsiRFX2mOGIi6oCh4N1erMevWVd+wKOSa82DLZXLzgd7w/J+51uoPWAZ
         IL6pMowSqUZMazsr7d3rBqMGw7roTuN2lhXNmE38SjB5r/sddeVGJX+DyVG06dAyfNV8
         PHKimVFXoVr6CtGAFg40Kc6WHmQQmmitAN0mdAt3XS9LAyhwezo1AqcLXr67959q5vjz
         dNuuuH/veD3vvJSP84wU4SAAqz4wM4PbogBlkbEFea4El9yzCaLb+UFshWdI8nScvZv5
         Bj6w==
X-Gm-Message-State: AJIora/TlhbtiBzB/wYFGRLISYBU2ZvBKLk3A0UZW3EDeW7CjUChmc9l
	0GrEpJqSzRB6Y30D+E0NubpGcgBXIKvgEPx3q25/wW9qJn8vy770YTLKqxLzdkN357qWItBm+Vu
	i0Xz9Uvh275eMOjPNVPYUcA==
X-Received: by 2002:a5d:5047:0:b0:21b:92b2:f34f with SMTP id h7-20020a5d5047000000b0021b92b2f34fmr17127808wrt.677.1656422896236;
        Tue, 28 Jun 2022 06:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tqVf5A7KSxbTw31AFhCSUb6QIduyx0h8n4yb62+NQ1QBxlS5VZpJjh7TfSMSbhzJ+0xSz+Vw==
X-Received: by 2002:a5d:5047:0:b0:21b:92b2:f34f with SMTP id h7-20020a5d5047000000b0021b92b2f34fmr17127781wrt.677.1656422895955;
        Tue, 28 Jun 2022 06:28:15 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id w9-20020a5d6089000000b0020e5b4ebaecsm13771290wrt.4.2022.06.28.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:28:15 -0700 (PDT)
Date: Tue, 28 Jun 2022 14:28:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
	jroedel@suse.de, thomas.lendacky@amd.com, hpa@zytor.com,
	ardb@kernel.org, pbonzini@redhat.com, seanjc@google.com,
	vkuznets@redhat.com, jmattson@google.com, luto@kernel.org,
	dave.hansen@linux.intel.com, slp@redhat.com, pgonda@google.com,
	peterz@infradead.org, srinivas.pandruvada@linux.intel.com,
	rientjes@google.com, dovmurik@linux.ibm.com, tobin@ibm.com,
	bp@alien8.de, michael.roth@amd.com, vbabka@suse.cz,
	kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	alpergun@google.com, jarkko@kernel.org
Subject: Re: [PATCH Part2 v6 36/49] KVM: SVM: Add support to handle GHCB GPA
 register VMGEXIT
Message-ID: <YrsB7G4NSgJ+vKVw@work-vm>
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <c2c4d365b4616c83ab2fb91b7c89d13535de8c0a.1655761627.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c2c4d365b4616c83ab2fb91b7c89d13535de8c0a.1655761627.git.ashish.kalra@amd.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Ashish Kalra (Ashish.Kalra@amd.com) wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> SEV-SNP guests are required to perform a GHCB GPA registration. Before
> using a GHCB GPA for a vCPU the first time, a guest must register the
> vCPU GHCB GPA. If hypervisor can work with the guest requested GPA then
> it must respond back with the same GPA otherwise return -1.
> 
> On VMEXIT, Verify that GHCB GPA matches with the registered value. If a
> mismatch is detected then abort the guest.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h |  8 ++++++++
>  arch/x86/kvm/svm/sev.c            | 27 +++++++++++++++++++++++++++
>  arch/x86/kvm/svm/svm.h            |  7 +++++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 539de6b93420..0a9055cdfae2 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -59,6 +59,14 @@
>  #define GHCB_MSR_AP_RESET_HOLD_RESULT_POS	12
>  #define GHCB_MSR_AP_RESET_HOLD_RESULT_MASK	GENMASK_ULL(51, 0)
>  
> +/* Preferred GHCB GPA Request */
> +#define GHCB_MSR_PREF_GPA_REQ		0x010
> +#define GHCB_MSR_GPA_VALUE_POS		12
> +#define GHCB_MSR_GPA_VALUE_MASK		GENMASK_ULL(51, 0)

Are the magic 51's in here fixed ?

Dave

> +#define GHCB_MSR_PREF_GPA_RESP		0x011
> +#define GHCB_MSR_PREF_GPA_NONE		0xfffffffffffff
> +
>  /* GHCB GPA Register */
>  #define GHCB_MSR_REG_GPA_REQ		0x012
>  #define GHCB_MSR_REG_GPA_REQ_VAL(v)			\
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index c70f3f7e06a8..6de48130e414 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -3331,6 +3331,27 @@ static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
>  				  GHCB_MSR_INFO_MASK, GHCB_MSR_INFO_POS);
>  		break;
>  	}
> +	case GHCB_MSR_PREF_GPA_REQ: {
> +		set_ghcb_msr_bits(svm, GHCB_MSR_PREF_GPA_NONE, GHCB_MSR_GPA_VALUE_MASK,
> +				  GHCB_MSR_GPA_VALUE_POS);
> +		set_ghcb_msr_bits(svm, GHCB_MSR_PREF_GPA_RESP, GHCB_MSR_INFO_MASK,
> +				  GHCB_MSR_INFO_POS);
> +		break;
> +	}
> +	case GHCB_MSR_REG_GPA_REQ: {
> +		u64 gfn;
> +
> +		gfn = get_ghcb_msr_bits(svm, GHCB_MSR_GPA_VALUE_MASK,
> +					GHCB_MSR_GPA_VALUE_POS);
> +
> +		svm->sev_es.ghcb_registered_gpa = gfn_to_gpa(gfn);
> +
> +		set_ghcb_msr_bits(svm, gfn, GHCB_MSR_GPA_VALUE_MASK,
> +				  GHCB_MSR_GPA_VALUE_POS);
> +		set_ghcb_msr_bits(svm, GHCB_MSR_REG_GPA_RESP, GHCB_MSR_INFO_MASK,
> +				  GHCB_MSR_INFO_POS);
> +		break;
> +	}
>  	case GHCB_MSR_TERM_REQ: {
>  		u64 reason_set, reason_code;
>  
> @@ -3381,6 +3402,12 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
>  		return 1;
>  	}
>  
> +	/* SEV-SNP guest requires that the GHCB GPA must be registered */
> +	if (sev_snp_guest(svm->vcpu.kvm) && !ghcb_gpa_is_registered(svm, ghcb_gpa)) {
> +		vcpu_unimpl(&svm->vcpu, "vmgexit: GHCB GPA [%#llx] is not registered.\n", ghcb_gpa);
> +		return -EINVAL;
> +	}
> +
>  	ret = sev_es_validate_vmgexit(svm, &exit_code);
>  	if (ret)
>  		return ret;
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index c80352c9c0d6..54ff56cb6125 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -206,6 +206,8 @@ struct vcpu_sev_es_state {
>  	 */
>  	u64 ghcb_sw_exit_info_1;
>  	u64 ghcb_sw_exit_info_2;
> +
> +	u64 ghcb_registered_gpa;
>  };
>  
>  struct vcpu_svm {
> @@ -334,6 +336,11 @@ static inline bool sev_snp_guest(struct kvm *kvm)
>  	return sev_es_guest(kvm) && sev->snp_active;
>  }
>  
> +static inline bool ghcb_gpa_is_registered(struct vcpu_svm *svm, u64 val)
> +{
> +	return svm->sev_es.ghcb_registered_gpa == val;
> +}
> +
>  static inline void vmcb_mark_all_dirty(struct vmcb *vmcb)
>  {
>  	vmcb->control.clean = 0;
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

