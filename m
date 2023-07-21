Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C127F05
	for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 14:51:07 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-583a4015791so3142317b3.1
        for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689951066; x=1690555866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8yUxmyxPIvzbkVd9s0UeJfyiw1xBBEZQgUOWseDI2Q=;
        b=u49mrJ53UT8SivGiCyqtrjHa1xD7+AFzdyiY9Chbv6vd9wfImmDU6Yre0TQw/6rNzF
         Y4cWunAHLPB0K7fI0aFMrX9k4gis7RmMOZNQHEVjIEeMFY5eHXMaIYEcT0GmzCukujZ4
         sn9gINiC2FRtMPFq5LtqBadp13traaPQ1vQxbx/9Xb7D3SOzo1hurj9uWqAauiCObTOS
         kM7SNTH8TpoeeoJ4jaEZVkXQQKQ0hOulJTFPjXAc9UFbyogFPXa/aWWpvNwbwv0/cVKE
         ZdMjmzCfDjXtPmaNXMitlDoNX7ghqVKjO2fBJROQIw/WfL71kGCFofZ6ADV1eAtHa6+D
         GrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689951066; x=1690555866;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8yUxmyxPIvzbkVd9s0UeJfyiw1xBBEZQgUOWseDI2Q=;
        b=Nwa+XN4fyBInnUNAovKMY706O725MhB4Crx8BnpsLnLKdJ5AlGZwCsYAg2DC96ZMIA
         XiVParawDwhSPsag8OHP+aC5mJ1J15E5N9wOh3sgGvb3bDStyKySBGn8CR9QkdjT96jE
         glhy/slbS1WJGXpdveUe6NYSFkshhO/EHxsFseRrXf5fknqoaaaOBPkt1fkOqecsZRqG
         u7GFRmHcGiOLN2jcFiVfryI2SdGRON/1aVUf4ZdR/M2u4biKwnkX8cTDyZ8yG2ns2QJc
         4SG+4NAetmtEctABWicL+WGcndYSKrMRuX7rE0HbwqDSfXujlkiflWWLGYWzCAs3FRbq
         QTTg==
X-Gm-Message-State: ABy/qLYwkZrvTYHNaEGOW+aCwcqot45j0Qx+sB4re0xu4wVbRS4jYScS
	/v8/KImZ1dw016qBFSEKkVquO6syNo0=
X-Google-Smtp-Source: APBJJlGB39ZxzYVeimKHcJI2SgM03nd92uOXSFfivU6tP+XNUXoMyH1wTtTMt1NaslVYqBr56JDsOk98XvA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:441d:0:b0:576:8cb6:62a9 with SMTP id
 r29-20020a81441d000000b005768cb662a9mr1965ywa.6.1689951066437; Fri, 21 Jul
 2023 07:51:06 -0700 (PDT)
Date: Fri, 21 Jul 2023 07:51:04 -0700
In-Reply-To: <8c0b7babbdd777a33acd4f6b0f831ae838037806.1689893403.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com> <8c0b7babbdd777a33acd4f6b0f831ae838037806.1689893403.git.isaku.yamahata@intel.com>
Message-ID: <ZLqbWFnm7jyB8JuY@google.com>
Subject: Re: [RFC PATCH v4 09/10] KVM: x86: Make struct sev_cmd common for KVM_MEM_ENC_OP
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
> index aa7a56a47564..32883e520b00 100644
> --- a/arch/x86/include/uapi/asm/kvm.h
> +++ b/arch/x86/include/uapi/asm/kvm.h
> @@ -562,6 +562,39 @@ struct kvm_pmu_event_filter {
>  /* x86-specific KVM_EXIT_HYPERCALL flags. */
>  #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
>  
> +struct kvm_mem_enc_cmd {
> +	/* sub-command id of KVM_MEM_ENC_OP. */
> +	__u32 id;
> +	/*
> +	 * Auxiliary flags for sub-command.  If sub-command doesn't use it,
> +	 * set zero.
> +	 */
> +	__u32 flags;
> +	/*
> +	 * Data for sub-command.  An immediate or a pointer to the actual
> +	 * data in process virtual address.  If sub-command doesn't use it,
> +	 * set zero.
> +	 */
> +	__u64 data;
> +	/*
> +	 * Supplemental error code in the case of error.
> +	 * SEV error code from the PSP or TDX SEAMCALL status code.
> +	 * The caller should set zero.
> +	 */
> +	union {
> +		struct {
> +			__u32 error;
> +			/*
> +			 * KVM_SEV_LAUNCH_START and KVM_SEV_RECEIVE_START
> +			 * require extra data. Not included in struct
> +			 * kvm_sev_launch_start or struct kvm_sev_receive_start.
> +			 */
> +			__u32 sev_fd;
> +		};
> +		__u64 error64;
> +	};
> +};

Eww.  Why not just use an entirely different struct for TDX?  I don't see what
benefit this provides other than a warm fuzzy feeling that TDX and SEV share a
struct.  Practically speaking, KVM will likely take on more work to forcefully
smush the two together than if they're separate things.
