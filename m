Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8A872
	for <linux-coco@lists.linux.dev>; Thu,  8 Jul 2021 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625734228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SuIb8Mf/UTnaQz6OhnBGLu2JATZoHpFDaa87yUrmOjI=;
	b=WciHVvd6PqtFtrlpZOQ6sCB/jPcbkKor8HlxKlY0ZJ8L7tp1UD4lMOR8oxeblkaw9YXVF3
	5DPjUwl1sm+kCG3KFNWYYBwbuPMGQpzdYJvBwGQXoGUchALjtHtGB8repPElIBpMVUof4N
	DZ3V60V7NjseMwJETgTedDzZqiW+Iqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-nShq5MtQNDaEwDNQXJ2tdQ-1; Thu, 08 Jul 2021 04:50:27 -0400
X-MC-Unique: nShq5MtQNDaEwDNQXJ2tdQ-1
Received: by mail-wm1-f72.google.com with SMTP id j18-20020a05600c1c12b029020a5514128fso879974wms.7
        for <linux-coco@lists.linux.dev>; Thu, 08 Jul 2021 01:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SuIb8Mf/UTnaQz6OhnBGLu2JATZoHpFDaa87yUrmOjI=;
        b=Za0k8P0RhODd7+22cWZQg3yZesXgtIQYkwqhgt0RaucZWLlPkIJp7P6oRDNUHw2pyV
         X06hyKJXbrHKvmFFZG3ueyAv3EKcpUrln4yqnl8f86PDLcFLu8nrzY5yVbw+0r2LB57D
         3+9Kz0hoZ2/VDyF2n4tv11T3QpAXHIurDm3yRc1pNEMqWmZXnPU2cCPtI1VW4i6l8fj0
         U40DHUwN2Csy6Kq/Z9vfaTSXi/71cPkpvVXtt3hoNRJ1D8lg0Wp9LGsEuOsZpAlolIPQ
         uQQSsBNj4ErQ/5KpGQX2JPFF0NCeIjFzsxenDq3wW0c9IwaBi9Gg6Yv7WTzFjYd/91S4
         QGLA==
X-Gm-Message-State: AOAM530Pom2GVTqwZjXYkEo82viTiCysHk8Fhv0c3WcJ5HB8hMeCId4q
	3ruluotJXWx68jVlUkOxupq3FftrVLwxm8+mlhQrOKBXvDR69EZYAMsvoAWuUfGLjldVf+BkwnQ
	2Iu5YLVc0YgeSXJToHZzygg==
X-Received: by 2002:a05:600c:1c1d:: with SMTP id j29mr32350618wms.34.1625734225889;
        Thu, 08 Jul 2021 01:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMxAdEuD7qHb5c0k9Wf7jG75F3PvDQ5XFmRSVxx0RNY6c6tA03nnyEHlmbWdrGaWp7vAZumw==
X-Received: by 2002:a05:600c:1c1d:: with SMTP id j29mr32350583wms.34.1625734225686;
        Thu, 08 Jul 2021 01:50:25 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net. [82.29.237.198])
        by smtp.gmail.com with ESMTPSA id o3sm1529999wrw.56.2021.07.08.01.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 01:50:25 -0700 (PDT)
Date: Thu, 8 Jul 2021 09:50:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
	npmccallum@redhat.com, brijesh.ksingh@gmail.com
Subject: Re: [PATCH Part1 RFC v4 04/36] x86/mm: Add sev_feature_enabled()
 helper
Message-ID: <YOa8TlaZM42+sz+E@work-vm>
References: <20210707181506.30489-1-brijesh.singh@amd.com>
 <20210707181506.30489-5-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210707181506.30489-5-brijesh.singh@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Brijesh Singh (brijesh.singh@amd.com) wrote:
> The sev_feature_enabled() helper can be used by the guest to query whether
> the SNP - Secure Nested Paging feature is active.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
>  arch/x86/include/asm/mem_encrypt.h |  8 ++++++++
>  arch/x86/include/asm/msr-index.h   |  2 ++
>  arch/x86/mm/mem_encrypt.c          | 14 ++++++++++++++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
> index 8cc2fd308f65..fb857f2e72cb 100644
> --- a/arch/x86/include/asm/mem_encrypt.h
> +++ b/arch/x86/include/asm/mem_encrypt.h
> @@ -16,6 +16,12 @@
>  
>  #include <asm/bootparam.h>
>  
> +enum sev_feature_type {
> +	SEV,
> +	SEV_ES,
> +	SEV_SNP
> +};

Is this ....

>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  
>  extern u64 sme_me_mask;
> @@ -54,6 +60,7 @@ void __init sev_es_init_vc_handling(void);
>  bool sme_active(void);
>  bool sev_active(void);
>  bool sev_es_active(void);
> +bool sev_feature_enabled(unsigned int feature_type);
>  
>  #define __bss_decrypted __section(".bss..decrypted")
>  
> @@ -87,6 +94,7 @@ static inline int __init
>  early_set_memory_encrypted(unsigned long vaddr, unsigned long size) { return 0; }
>  
>  static inline void mem_encrypt_free_decrypted_mem(void) { }
> +static bool sev_feature_enabled(unsigned int feature_type) { return false; }
>  
>  #define __bss_decrypted
>  
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index a7c413432b33..37589da0282e 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -481,8 +481,10 @@
>  #define MSR_AMD64_SEV			0xc0010131
>  #define MSR_AMD64_SEV_ENABLED_BIT	0
>  #define MSR_AMD64_SEV_ES_ENABLED_BIT	1
> +#define MSR_AMD64_SEV_SNP_ENABLED_BIT	2

Just the same as this ?

>  #define MSR_AMD64_SEV_ENABLED		BIT_ULL(MSR_AMD64_SEV_ENABLED_BIT)
>  #define MSR_AMD64_SEV_ES_ENABLED	BIT_ULL(MSR_AMD64_SEV_ES_ENABLED_BIT)
> +#define MSR_AMD64_SEV_SNP_ENABLED	BIT_ULL(MSR_AMD64_SEV_SNP_ENABLED_BIT)
>  
>  #define MSR_AMD64_VIRT_SPEC_CTRL	0xc001011f
>  
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index ff08dc463634..63e7799a9a86 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -389,6 +389,16 @@ bool noinstr sev_es_active(void)
>  	return sev_status & MSR_AMD64_SEV_ES_ENABLED;
>  }
>  
> +bool sev_feature_enabled(unsigned int type)

In which case, if you want the enum then that would be enum
sev_feature_type type  ?

> +{
> +	switch (type) {
> +	case SEV: return sev_status & MSR_AMD64_SEV_ENABLED;
> +	case SEV_ES: return sev_status & MSR_AMD64_SEV_ES_ENABLED;
> +	case SEV_SNP: return sev_status & MSR_AMD64_SEV_SNP_ENABLED;
> +	default: return false;

or, could you just go for making that whole thing a bit test on 1<<type
?

> +	}
> +}
> +
>  /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>  bool force_dma_unencrypted(struct device *dev)
>  {
> @@ -461,6 +471,10 @@ static void print_mem_encrypt_feature_info(void)
>  	if (sev_es_active())
>  		pr_cont(" SEV-ES");
>  
> +	/* Secure Nested Paging */
> +	if (sev_feature_enabled(SEV_SNP))
> +		pr_cont(" SEV-SNP");
> +
>  	pr_cont("\n");
>  }

Dave

> -- 
> 2.17.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

