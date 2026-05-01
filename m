Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DEA3DCDA0
	for <linux-coco@lists.linux.dev>; Fri,  1 May 2026 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777653447; cv=pass; b=QYRQuirAdapC4i/1bIvQb4Kjt4ZzKeL6ow8Vpdjd6xYEhhKrqrsRwN8OePDFZy0CFZQRuF1sPNlbfut6RqfIGGaFCVS2GgXYt9AUVtFOA9Ks9FTM74mpiDGrZDbnjnxl5tswlF0H6nipy7mwXzqei2lftAL0Pw9Y/3OKwVrGnhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777653447; c=relaxed/simple;
	bh=w9ooVH2aWTdqsPWomPiWr/2emsHoCr0nSyf2HqpKRiA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OB7UHR18DzsHcHrFK9bnbP8deV8WG7LQE/bPXgagDiRcO7FF3jkT/uZjni87HIFtMjm9vYv7i3M1FTQFBU0W0fFYhVtlE9rUZ18PuMLgAiEaU1aiBL4fjsm4M1cSdAeRq3b6Rbsg4a1wOYPCeFpXLsaTWhVz1WvjUMSwNpq42A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Md0XH04y; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Md0XH04y"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso1209069241.3
        for <linux-coco@lists.linux.dev>; Fri, 01 May 2026 09:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777653431; cv=none;
        d=google.com; s=arc-20240605;
        b=KXwQchg0s/KrhC9PjOQs4o1V/G9zz8EAqXrj7ntAQcQ0uNoFL0xi2W/pXEO+psKjVI
         SLC6+r91ju9HuRaC7hxjI1NnPtUqwAVQAzYtcG7r8ikbuUzHBgqLTQKZ4TpHm/qQ8GhP
         i7VwXwgeenntO8AOD+GPjw5z7WD/ihMgVbLVMklpNzxfjbXlyWejO5nF9LdKnb9Oez4f
         WlK4tpbXjPBW25ojX+Wje32B5sU9x30siMNqDJyvIe8EI1txRQSNC80Oi9IrgE2fQ2em
         guhmmYS5bhZA9RModcFTTRf2gJnAgSSpejAwtGs6aIUdZhbp/lbNX+0E9EZKuT11v90k
         6Drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=nLFs9eB4QSuzMXlNmTajx3twQGrJqXq6Mmw1sgch1Dc=;
        fh=dgZGgNWiN8hPD+0TcCPURgUtcM9APWJGRwSmPXltg3M=;
        b=KmWW95W5R4QFhGStyEgxv8brqnR6iksOJiF/7gONJo52ddpZHlidoNxtTq6uiQVWVA
         oAHxR6l7s0Ng8Z6qQHG8lleneHn2A/0fEZfN5rmfoDkVCoIZxFfM9Qcr+k6RTEZDJVX5
         yqcz9DqWYLTKCj7TgN4gqlzfx0EfstLqBrTQh35HUZgZ7sWo1e88k5+aLGh+ZeomX4uT
         IExGqpQSl8TpCX3GMSnvWkRvPExapxFtNCzVvnKfLh62XI/DAJJ506yRGd5rMjkM14rJ
         VboZxmr049UJtf/2iKjn+zzdJga5vse4FcfGV2t4NO4ne5tDZlaZJGCunrCxjslv/mAc
         KPHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777653431; x=1778258231; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLFs9eB4QSuzMXlNmTajx3twQGrJqXq6Mmw1sgch1Dc=;
        b=Md0XH04yNkYi1njj3JXeTg51rESyXJN9RMG3ZqByj3Pa2gMpJLoJGt09aRkmD+eCdt
         QGCjJBGJFRuOXShAmQfFJvhRjHQC3dO7BuxgVtCbHCe54EtGhSAZLTLNUSlIhMGWEMr+
         3WEgzU3F5dqzGI1O8AsepsaoNvOhz1vRNSpQXZLxSbkNVITxo4AB6k4DQjHuqZqHPLt2
         IUa7ekKaZHU/YxySrbgUFnSeZ4YA06rcn3/gXXluO/JAIaWGTsiQQfradDjPScDqo+K/
         +14nPqQYeZy/1OmDNeTv/Qf4FsMQjpIzq8y9Nta4H5fgwBI25xDEaG++SYFFICHoqpBT
         KXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777653431; x=1778258231;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLFs9eB4QSuzMXlNmTajx3twQGrJqXq6Mmw1sgch1Dc=;
        b=C+apFw7GtpLx6eZiZTAuY4bmZHVfABQ+Y74g80LfqCpt12Z6iZe5mPU7kYaVxa70Tq
         v7l8inT69u5c+xDKc+TJ8xRW9/nMHGGxC0kXvJZT9FDnhEcUp4Sa/80BRTTB7wFH7Wa6
         UBZF7bybYElNKq/G0twQRRGhqiDCDhjlSXm+2kvNo1l8jgN2DO6pYquIfDCKRfU3O9jU
         I/C6teZsbsJyfODw9kUHeqC9IkwoNqpTKppP43gVr74JoVChsJAeJWM4QAblXjbFeenq
         LF4vSX1F3WSIJzLsRFxS00s4ted3uBPnSaICifnIK8agwQ5xnXGZ+LCm//7/VBLw1p17
         3hPg==
X-Forwarded-Encrypted: i=1; AFNElJ9kxuWFLi/ZsG/Wi2RpHueH2FgiLwlEvf1QgyTbkyVBWP4u3QJTgmB2F4Ye5T3tsrNjW7OiW74b1oZE@lists.linux.dev
X-Gm-Message-State: AOJu0YyMQ58LqhOtR0tuScEow0K7i+f5+XOj3ZYxPSH+tC/M9vJr69yL
	6ocH2/PxRCYtqaJRx5GFlS35YjmVmLrp/PvwVCXmfPuXuDQY1MVILDxNnkdLxxMZaf8r7+tdTqa
	h2ksS7Znx5+FUGhHoiZarGoiRb+aUx/MD3SuV7aQ2
X-Gm-Gg: AeBDietp7/kjj0oMCFYK3N4DiR2r7bWAUeE9RD+EFlq+wIJyQfB2m7xLgIKpRzc2gSj
	NTiAIJPEh/aGqMSNMEth5dJ3eiaDfwpqoNujzPigoryrZzoUutkTl3yUkZ33ZmVqi5z/RWtRfBS
	lunq1BHS8RGBg1qBR9zfkQkqNfT8tszf/o67Ag+4az5zTyeCTze8rRai0tT1vxy7e40gPMSfvJE
	f4TMFszXKaxb6ZFudjR2nfu4yzH1AUV0qpydb2U0SBSzdeBiGcMMBAumC/gg8cQ6/6yPgGq6kus
	8TgtXp5vFumHQXwdqoZ3gC2O3pZFmxantTd6N747KBr3R6TTjeO68dW+Zro1xcGQpImH4Jz7AE6
	kRbSv3+6I4Vkeepg=
X-Received: by 2002:a05:6102:598d:b0:608:ad9c:4c36 with SMTP id
 ada2fe7eead31-62ad2b40002mr5011640137.11.1777653431060; Fri, 01 May 2026
 09:37:11 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 09:37:10 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 May 2026 09:37:10 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <77153c889934972efcfc3d210251564f29abcf51.1775874970.git.ashish.kalra@amd.com>
References: <cover.1775874970.git.ashish.kalra@amd.com> <77153c889934972efcfc3d210251564f29abcf51.1775874970.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 1 May 2026 09:37:10 -0700
X-Gm-Features: AVHnY4IpT6Ecp0MRFZmqXjB5U2fV7hCMXRHDBLJWh2_PysSn9Xai8a1NAPY71Vw
Message-ID: <CAEvNRgGrdA8opRuvBncgmsyzZTo6JaP+gSKuK4ioFvnZBSKjiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] x86/cpufeatures: Add X86_FEATURE_AMD_RMPOPT
 feature flag
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, 
	jackyli@google.com, pgonda@google.com, rientjes@google.com, 
	jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com, 
	babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com, 
	darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ashish Kalra <Ashish.Kalra@amd.com> writes:

>
> [...snip...]
>
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index dbe104df339b..bce1b2e2a35c 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -76,7 +76,7 @@
>  #define X86_FEATURE_K8			( 3*32+ 4) /* Opteron, Athlon64 */
>  #define X86_FEATURE_ZEN5		( 3*32+ 5) /* CPU based on Zen5 microarchitecture */
>  #define X86_FEATURE_ZEN6		( 3*32+ 6) /* CPU based on Zen6 microarchitecture */
> -/* Free                                 ( 3*32+ 7) */
> +#define X86_FEATURE_RMPOPT		( 3*32+ 7) /* Support for AMD RMPOPT instruction */
>  #define X86_FEATURE_CONSTANT_TSC	( 3*32+ 8) /* "constant_tsc" TSC ticks at a constant rate */
>  #define X86_FEATURE_UP			( 3*32+ 9) /* "up" SMP kernel running on UP */
>  #define X86_FEATURE_ART			( 3*32+10) /* "art" Always running timer (ART) */
> diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> index 42c7eac0c387..7ac3818c4502 100644
> --- a/arch/x86/kernel/cpu/scattered.c
> +++ b/arch/x86/kernel/cpu/scattered.c
> @@ -65,6 +65,7 @@ static const struct cpuid_bit cpuid_bits[] = {
>  	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
>  	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
>  	{ X86_FEATURE_AMD_LBR_PMC_FREEZE,	CPUID_EAX,  2, 0x80000022, 0 },
> +	{ X86_FEATURE_RMPOPT,			CPUID_EDX,  0, 0x80000025, 0 },
>  	{ X86_FEATURE_AMD_HTR_CORES,		CPUID_EAX, 30, 0x80000026, 0 },
>  	{ 0, 0, 0, 0, 0 }
>  };

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
