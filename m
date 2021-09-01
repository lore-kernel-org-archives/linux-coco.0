Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687CC3FCD
	for <linux-coco@lists.linux.dev>; Wed,  1 Sep 2021 21:45:39 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s11so857502pgr.11
        for <linux-coco@lists.linux.dev>; Wed, 01 Sep 2021 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dSXGTY+JbdvvDZ3iVz3szNk7yWsQ5juNTM8UNa0I5HY=;
        b=iOJguTgfI7Y49ou+2QSfxVWUN+qUbZM92T5KJprLmUT4JRcQ2B5ZhNYeLVK+IFiGce
         sbP3YMsWrEa1x3ld+0Rx3FSshNhBfLH7h8SY5rMBiJDwIokFG1EFgzr3NcxRx+nCBkE3
         Ddt1oYGbHz4rd/fQjglwD2b9q3GhebLWG0hvfQD07Kice4+fegC2IUhMH5g0QSjvrpy2
         ky/UvghuauKjYtifOSlOmh+ewCdQYr/CFoOEgRwFoYgRmDseGePyfGnpmcA5yAnvSbxP
         AVRoPW3l5P6iSuWRGym8l54imtxxiJB8JHokCmsjBi4l1SXKa3EywK/fbLO6hMpBHPR3
         fivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dSXGTY+JbdvvDZ3iVz3szNk7yWsQ5juNTM8UNa0I5HY=;
        b=H+wvSFdWmzzrFg92um5PE5idrsNOSNY9GmoVquTIX+TgSM4zZjigtM0G8GZl58ZSKI
         xXCh2ogSJSQdcg/6y6MprddPPZpfYXDhprC/j30bReV38pz1KO6e3wsQBmbZvZypAG5v
         W+PU3K4MGGW84IAGVrD0nDmG8ckf8NH3ppjABpFesjUm8xAJl3mml4EEm543i6m5avJr
         5habnEKINrCEzI03571fyufGleptV7thkVF49z2zzijAFbOYDEe2MyrhT6xHx+BYl5vR
         zkhqfxjp3KozVHCTiLM/oaM460MLz3GFzF4NtzaT0WNcjFKAGO6q+85DteHi01ZbVnlp
         nj8g==
X-Gm-Message-State: AOAM533MH9aBSW2VCVy1xcQRI/McjM6M3Zc2H+EVHkFq8oBWT6WXZcCU
	DnNQw3GEEOmzBr28v0h+GHF7uEvNU0RVsw==
X-Google-Smtp-Source: ABdhPJxqCPYMnf14dYD413H0wg7Hve3pCUiL5XI0sQEuitsB8Jjel3mMPEsoPu0r2pA+On6512q4Zg==
X-Received: by 2002:a62:a20d:0:b029:35b:73da:dc8d with SMTP id m13-20020a62a20d0000b029035b73dadc8dmr31695pff.54.1630532738568;
        Wed, 01 Sep 2021 14:45:38 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id m21sm387659pfa.137.2021.09.01.14.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:45:37 -0700 (PDT)
Date: Wed, 1 Sep 2021 21:45:34 +0000
From: Sean Christopherson <seanjc@google.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 2/4] KVM: SVM: Add support to handle AP reset MSR
 protocol
Message-ID: <YS/0fnLXTPDnRfVQ@google.com>
References: <20210722115245.16084-1-joro@8bytes.org>
 <20210722115245.16084-3-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722115245.16084-3-joro@8bytes.org>

On Thu, Jul 22, 2021, Joerg Roedel wrote:
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 8540972cad04..04470aab421b 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -11,6 +11,7 @@
>  #define GHCB_MSR_INFO_POS		0
>  #define GHCB_DATA_LOW			12
>  #define GHCB_MSR_INFO_MASK		(BIT_ULL(GHCB_DATA_LOW) - 1)
> +#define GHCB_DATA_MASK			GENMASK_ULL(51, 0)

Note used in this patch, not sure if it's intended to be used in GHCB_DATA below?

>  #define GHCB_DATA(v)			\
>  	(((unsigned long)(v) & ~GHCB_MSR_INFO_MASK) >> GHCB_DATA_LOW)
> diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
> index e322676039f4..5a28f223a9a8 100644
> --- a/arch/x86/include/asm/svm.h
> +++ b/arch/x86/include/asm/svm.h
> @@ -164,7 +164,6 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
>  	u8 reserved_sw[32];
>  };
>  
> -

Unrelated whitespace change.

>  #define TLB_CONTROL_DO_NOTHING 0
>  #define TLB_CONTROL_FLUSH_ALL_ASID 1
>  #define TLB_CONTROL_FLUSH_ASID 3
