Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482272F2A
	for <linux-coco@lists.linux.dev>; Thu, 23 Feb 2023 17:46:04 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r27so12611418lfe.10
        for <linux-coco@lists.linux.dev>; Thu, 23 Feb 2023 09:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677174362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYIq09mCIdt8L8URFfe+pag31rri9xn6YRZUfSTQ4cQ=;
        b=H/MKnTDnvFdWxcQfGw3ysDrqU8kxVqbL6vEJjW7HtOr4msWrzCGUY1PDxLUYdKo3PM
         YLiEhEfthAIfkhDAArA4Ip+CysYZj3Ioym0g5zEOeTAbR+I2gMGXTUzHHV7bH2DWWNjl
         xaSi8T4miZA00aVNpols7SD8/uKpin4Fz6UzJK/FMK4U5osorpRZc+UEgpJUbyK12qiE
         UJdqkl2EYvKLRNn5+Vj0qVUk+ldaRk4W3GITriXGJDuD2OUgJwdNZS1jTj4dNe5gK7Vs
         jplpcMZp/JSF/7m0eWlLZD+JHHGcUCVmkq8Cb1F2fTQCoIcyQGMYpYZ9oT9RF9y3UeUN
         OuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677174362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYIq09mCIdt8L8URFfe+pag31rri9xn6YRZUfSTQ4cQ=;
        b=YC4aBvqG5Hh6rFAmm6bsdHgo/Ukx6WGohYTZmxgsKkIp+jYoNSsJWzAHx3y0qd2Zsv
         N+Ji6qx7X+jHpvIxXXsN4E5y5Sl/6I+9opxXpOI9HHrYqmJsMomM4JOSjvf6OCj79vDd
         zNL5x/OJraVCnZ6vKZOselXJlscc3i3x2Lew8dJxlIHUnb//Pigl0mOj+Oo8KWMOUqJZ
         oF8h6m4NItdxjFxAC/+gg0l5db+aAXNx/YDI1JsdYnUitfKlXJRrJ89lU57UW+rKN/3k
         TEPWvVTzuFtlmmH0sH+twfUa65GE4cl14xavv5rysueTgwrPUJwHrY/oUefTjEeLFViZ
         A8JQ==
X-Gm-Message-State: AO0yUKVThBHVhD20Zgh/CK49p+iMKPhCs4DQMnBZobWnL4wOs/rUq9ZF
	/xBblSlKFMBybqYA/6inN74=
X-Google-Smtp-Source: AK7set/HWDu0Z1JwR4f2MLULVfhlz20LZD27Q64dW7aOz28mIbVbVwBH7uH3dA7q/4XucNCFko4n6A==
X-Received: by 2002:ac2:5496:0:b0:4d7:bda4:e6ae with SMTP id t22-20020ac25496000000b004d7bda4e6aemr4409072lfk.3.1677174362080;
        Thu, 23 Feb 2023 09:46:02 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id v6-20020ac25606000000b004b550c26949sm1025697lfd.290.2023.02.23.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 09:46:01 -0800 (PST)
Date: Thu, 23 Feb 2023 19:46:00 +0200
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
Subject: Re: [PATCH RFC v8 32/56] KVM: SVM: Add initial SEV-SNP support
Message-ID: <20230223194600.000018ac@gmail.com>
In-Reply-To: <20230220183847.59159-33-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-33-michael.roth@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Feb 2023 12:38:23 -0600
Michael Roth <michael.roth@amd.com> wrote:

> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> The next generation of SEV is called SEV-SNP (Secure Nested Paging).
> SEV-SNP builds upon existing SEV and SEV-ES functionality  while adding new
> hardware based security protection. SEV-SNP adds strong memory encryption
> integrity protection to help prevent malicious hypervisor-based attacks
> such as data replay, memory re-mapping, and more, to create an isolated
> execution environment.
> 
> The SNP feature is added incrementally, the later patches adds a new module
> parameters that can be used to enabled SEV-SNP in the KVM.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/kvm/svm/sev.c | 10 +++++++++-
>  arch/x86/kvm/svm/svm.h |  8 ++++++++
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 9e9efb42a766..51db01b282eb 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -58,6 +58,9 @@ module_param_named(sev_es, sev_es_enabled, bool, 0444);
>  #define sev_es_enabled false
>  #endif /* CONFIG_KVM_AMD_SEV */
>  
> +/* enable/disable SEV-SNP support */
> +static bool sev_snp_enabled;
> +
>  #define AP_RESET_HOLD_NONE		0
>  #define AP_RESET_HOLD_NAE_EVENT		1
>  #define AP_RESET_HOLD_MSR_PROTO		2
> @@ -2306,6 +2309,7 @@ void __init sev_hardware_setup(void)
>  {
>  #ifdef CONFIG_KVM_AMD_SEV
>  	unsigned int eax, ebx, ecx, edx, sev_asid_count, sev_es_asid_count;
> +	bool sev_snp_supported = false;
>  	bool sev_es_supported = false;
>  	bool sev_supported = false;
>  
> @@ -2385,12 +2389,16 @@ void __init sev_hardware_setup(void)
>  	if (misc_cg_set_capacity(MISC_CG_RES_SEV_ES, sev_es_asid_count))
>  		goto out;
>  
> -	pr_info("SEV-ES supported: %u ASIDs\n", sev_es_asid_count);
>  	sev_es_supported = true;
> +	sev_snp_supported = sev_snp_enabled && cpu_feature_enabled(X86_FEATURE_SEV_SNP);
> +
> +	pr_info("SEV-ES %ssupported: %u ASIDs\n",
> +		sev_snp_supported ? "and SEV-SNP " : "", sev_es_asid_count);
>  
>  out:
>  	sev_enabled = sev_supported;
>  	sev_es_enabled = sev_es_supported;
> +	sev_snp_enabled = sev_snp_supported;
>  #endif
>  }
>  
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 5efcf036ccad..8eb1b51e92f5 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -76,6 +76,7 @@ enum {
>  struct kvm_sev_info {
>  	bool active;		/* SEV enabled guest */
>  	bool es_active;		/* SEV-ES enabled guest */
> +	bool snp_active;	/* SEV-SNP enabled guest */
>  	unsigned int asid;	/* ASID used for this guest */
>  	unsigned int handle;	/* SEV firmware handle */
>  	int fd;			/* SEV device fd */
> @@ -323,6 +324,13 @@ static __always_inline bool sev_es_guest(struct kvm *kvm)
>  #endif
>  }
>  
> +static inline bool sev_snp_guest(struct kvm *kvm)
> +{
> +	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +
> +	return sev_es_guest(kvm) && sev->snp_active;
> +}
> +

Maybe also use __always_inline like sev_es_guest() above?

It seems solved some warnings before:

https://lore.kernel.org/all/20210624095147.880513802@infradead.org/

>  static inline void vmcb_mark_all_dirty(struct vmcb *vmcb)
>  {
>  	vmcb->control.clean = 0;

