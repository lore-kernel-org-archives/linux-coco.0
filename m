Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127F320D
	for <linux-coco@lists.linux.dev>; Mon, 20 Feb 2023 21:13:05 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id s20so2894803lfb.11
        for <linux-coco@lists.linux.dev>; Mon, 20 Feb 2023 13:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676927584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDIW4axl+hkN5j3NPMXP+ZPoJ29pdF3/fwwVKvtB5gk=;
        b=KE1OVRc+qlYS5auHFljuhewLrBtTVsN/HV2pvtiQwUrLF6eqwzmYRitRPsdm8PzCKP
         f94jSIuX7FTmGS11bxjT4AvvNxyrRqcYUiGEF4Ng3DhvV3zoLw5e9pxiCp4QQ8OrDhxX
         +IYExd0hsXsaDOmT+Huu4SvNvPABnALW1IS0k8plNRR4mfpDqb94BaZcW6HC6enQPONQ
         1emTmsmu6j96DIDwBRU9vHZSilWZTAUV76IdLSvjlWCEwuOHk3swIZ9ku21QyrPbomhK
         StQA/UBsTxKBtZ+RXC4bCF9FuQXIXP0dNTDB6/L1AxVvsISpEQu6VSEPEOdLzBthSfmK
         X9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676927584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDIW4axl+hkN5j3NPMXP+ZPoJ29pdF3/fwwVKvtB5gk=;
        b=6lcXX/f4TsdCwCCP5evVUrzMeluGURyg/5uaHi9mlmM7FcmQ08h33AwQFtyU/VPT7o
         7WDskD3nT4V1ks4kiLKhyUPldfci43z0/7nx5m/Sq24gwBVS/k/JN7tm5RRuq0gDKyB3
         Tw7egj/Fp2LZusHXa0QF/lpbdLKWMNxkZEuq1gJwsigoBhLlv6Yw9b9QnFyCF6wl4bXt
         s/+xh6owRlLJN1QebjFfB1YZbglqaaVbWP4oBm+j3d+WgjpqKExbegzyCF2XIHWonXzR
         CkFrUsz8HF3bR3u8u/mSolvDYRZeyEly6Cnni6nUhNLlL/5ss6SwtT2KosBTshp4bSK9
         bGHw==
X-Gm-Message-State: AO0yUKWAPOKvvpi9FbaCLUEDH4EBbJOKNpfUf1A6yPWXDURLe8jGNaUk
	UJJnc92A0rEfSy7J4yQEm80=
X-Google-Smtp-Source: AK7set+SFmQKGMJwRWrnol+bh+JAzBSaJAJIcs3b4nUG3o31URK0ZZcsUT7nvy2Smugv5Xzpba5R+g==
X-Received: by 2002:a19:f00e:0:b0:4a4:68b9:26c with SMTP id p14-20020a19f00e000000b004a468b9026cmr795903lfc.6.1676927583594;
        Mon, 20 Feb 2023 13:13:03 -0800 (PST)
Received: from localhost (88-115-161-74.elisa-laajakaista.fi. [88.115.161.74])
        by smtp.gmail.com with ESMTPSA id u10-20020ac248aa000000b004dc4cb4f9c4sm1625853lfg.35.2023.02.20.13.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 13:13:03 -0800 (PST)
Date: Mon, 20 Feb 2023 23:13:00 +0200
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
 <nikunj.dadhania@amd.com>
Subject: Re: [PATCH RFC v8 19/56] x86/fault: Return pfn from
 dump_pagetable() for SEV-specific fault handling.
Message-ID: <20230220231300.00004591@gmail.com>
In-Reply-To: <20230220183847.59159-20-michael.roth@amd.com>
References: <20230220183847.59159-1-michael.roth@amd.com>
	<20230220183847.59159-20-michael.roth@amd.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Feb 2023 12:38:10 -0600
Michael Roth <michael.roth@amd.com> wrote:

> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Return pfn from dump_pagetable() to do SEV-specific
> fault handling. Used for handling SNP RMP page fault.
> 

It would be better to merge this patch with PATCH 13.

> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/mm/fault.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index afd4cde17001..f2b16dcfbd9a 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -311,7 +311,7 @@ static bool low_pfn(unsigned long pfn)
>  	return pfn < max_low_pfn;
>  }
>  
> -static void dump_pagetable(unsigned long address)
> +static unsigned long dump_pagetable(unsigned long address)
>  {
>  	pgd_t *base = __va(read_cr3_pa());
>  	pgd_t *pgd = &base[pgd_index(address)];
> @@ -345,8 +345,10 @@ static void dump_pagetable(unsigned long address)
>  
>  	pte = pte_offset_kernel(pmd, address);
>  	pr_cont("*pte = %0*Lx ", sizeof(*pte) * 2, (u64)pte_val(*pte));
> +	return 0;
>  out:
>  	pr_cont("\n");
> +	return 0;
>  }
>  
>  #else /* CONFIG_X86_64: */
> @@ -367,10 +369,11 @@ static int bad_address(void *p)
>  	return get_kernel_nofault(dummy, (unsigned long *)p);
>  }
>  
> -static void dump_pagetable(unsigned long address)
> +static unsigned long dump_pagetable(unsigned long address)
>  {
>  	pgd_t *base = __va(read_cr3_pa());
>  	pgd_t *pgd = base + pgd_index(address);
> +	unsigned long pfn;
>  	p4d_t *p4d;
>  	pud_t *pud;
>  	pmd_t *pmd;
> @@ -388,6 +391,7 @@ static void dump_pagetable(unsigned long address)
>  	if (bad_address(p4d))
>  		goto bad;
>  
> +	pfn = p4d_pfn(*p4d);
>  	pr_cont("P4D %lx ", p4d_val(*p4d));
>  	if (!p4d_present(*p4d) || p4d_large(*p4d))
>  		goto out;
> @@ -396,6 +400,7 @@ static void dump_pagetable(unsigned long address)
>  	if (bad_address(pud))
>  		goto bad;
>  
> +	pfn = pud_pfn(*pud);
>  	pr_cont("PUD %lx ", pud_val(*pud));
>  	if (!pud_present(*pud) || pud_large(*pud))
>  		goto out;
> @@ -404,6 +409,7 @@ static void dump_pagetable(unsigned long address)
>  	if (bad_address(pmd))
>  		goto bad;
>  
> +	pfn = pmd_pfn(*pmd);
>  	pr_cont("PMD %lx ", pmd_val(*pmd));
>  	if (!pmd_present(*pmd) || pmd_large(*pmd))
>  		goto out;
> @@ -412,13 +418,14 @@ static void dump_pagetable(unsigned long address)
>  	if (bad_address(pte))
>  		goto bad;
>  
> +	pfn = pte_pfn(*pte);
>  	pr_cont("PTE %lx", pte_val(*pte));
>  out:
>  	pr_cont("\n");
> -
> -	return;
> +	return pfn;
>  bad:
>  	pr_info("BAD\n");
> +	return -1;
>  }
>  
>  #endif /* CONFIG_X86_64 */

