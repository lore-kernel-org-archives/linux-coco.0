Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366DC1F892F
	for <linux-coco@lists.linux.dev>; Tue,  3 Dec 2024 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247999; cv=none; b=WuxMEQAK8RSH6TdPSPpqn1J+dNmOTgXsc8We9dLD5MwO1G6NHDlaLYqQxLocbfemGluMfe0zynWgADbV+jf3n/p7alsqaamfHZnmkaIaTMwiLXX/cuX5FS7fhQyZXQt9NdiYF3Vlb3CDVIPZPB3eArPCtkecTZf+Zdk0Uj/NRtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247999; c=relaxed/simple;
	bh=7ZIAPMkPeTEbfvq7656BNyWbZaPIwCHNSn6wtGvXZw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNIbN1v/lQvOXs1TSRZMl006ZlvSDjUkMk4RIYAY4AGkWKxbwnU68KtgVnHVgifkcYr7KagQ55boKKuE3XFqzl33OcctrYarq6+cwA+dmJTIaADy5c2TZXnsmDoB8EvA5BI33SGIHtAk1O9WjdyJFXKdiO7ntBMFpqa1sHRDSCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6lzjqOw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6lzjqOw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so2305322f8f.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Dec 2024 09:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733247995; x=1733852795; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFxdVjj7PZ/N/qs/J/1mLWKxmYr4aiVLL3tA6PIFZOU=;
        b=Y6lzjqOwq0Vyk3jhZMIhaGuEq4aX0Z4dKGF17mNXcr2krfyIfs+ZKdVs4/NmHk/jY3
         0aOBCBaY954dUWD4TQv0bw7cOV0Tlr/Uu3ivvS/QYCCcu37W7hdOubRSIRjN9763G0jr
         eCuwmhRXoENo5nm7fzQOBecgwVEEiQZzrjvcMm9gVWroIhiLNVkTZc/GJCyYc3b2RxfF
         66LNlHCsluWeMrM2YJBQIox3s0rphEfZW1z/2O5PwtOhBM9CbkvfooG3F6eOx0j+/DDL
         SvCQEyagxmodqKdrA+XFFmyW8jAAdAM3Cvqo/yhYt2GRbhZILaTgQ5tVvE5qbk4UUL2/
         u4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247995; x=1733852795;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFxdVjj7PZ/N/qs/J/1mLWKxmYr4aiVLL3tA6PIFZOU=;
        b=n5S6GtmQ1dYPt79TWUx9QuIH+tzkNFgQxgVy7WNd/uBidr3p4y7cSNs1OBWHCeXvqP
         9oBRwoEM8cZ+p0O2f6my4ovPX69rZnscxWKhF7ErAxlvnnxtNFm03aqp2/vyiPPU/A7o
         RE6bVsfh5A55Qpva+hiGfpDANQ7AMvz3t+fvw82UuTwlXizbAYu1KVM0ckQjzn/qm1Oc
         tDeNvbAfsTGbMuWDRlzFDX7fmFRdzu12df2fhw+GxpiI3+80iKSY7fSPVOgb2mkD6JGO
         Ak4dNMgepGoJIE+2w0Pr4oJO/qD3j7opPbAPMPH1K1R/wUrGgT9oymxS9teTnHzXY0uq
         P2OQ==
X-Gm-Message-State: AOJu0YyAmbFTy7srVfWmcMWNuIVFjLs2qUaJGwcR93y+WJMWFvHV5wsr
	mPmAqsZSZKSOivBP+Vm9mr0H7Coie2/Toaf6jvL9qbh88gd3Sq/W+CpYnin4W6M=
X-Gm-Gg: ASbGncvzKWOSLNm34RcZdmZQMn0KgNH3J9MAYWkJapMT+4kmhch2mcsw/mp1drTA/mV
	3pKkKBwdMdvJ/LtQZup0D2VCqwDtoH7Vb8+wEiSNOJ5HCe1WmJ3qyPJfvL1IsSGumgFxh8j4y7F
	KFzjYSC2ivBf2S0su6AsjmJcNLIvXJ/Y+cQWUaMyl1naxLPt4cLv0Gq7LQan3+YHC75Clbxtc+z
	L6EGQBrpirtGksMZFhuU9bnY25wAm9aX8DpuYDSUH9aLdsOafOkoACy0qxqaYayjf5jK8c3aUc=
X-Google-Smtp-Source: AGHT+IHsn0zhsY3RgS4QgXAl/s0nx8qN5jv8ueOZFuunzjyiUev362zciGDLjEQzLbYMzDUDDjWbjA==
X-Received: by 2002:a05:6000:4912:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-385fd3f176amr3319514f8f.26.1733247995510;
        Tue, 03 Dec 2024 09:46:35 -0800 (PST)
Received: from [192.168.0.20] (nborisov.ddns.nbis.net. [85.187.217.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f18bsm234796265e9.4.2024.12.03.09.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 09:46:35 -0800 (PST)
Message-ID: <b2bacaab-8264-4532-9a8b-e060f50d41ca@suse.com>
Date: Tue, 3 Dec 2024 19:46:34 +0200
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tdx: Dump attributes and TD_CTLS on boot
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241202072458.447455-1-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20241202072458.447455-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2.12.24 г. 9:24 ч., Kirill A. Shutemov wrote:
> Dump TD configuration on boot. Attributes and TD_CTLS define TD
> behavior. This information is useful for tracking down bugs.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>


> ---
>   arch/x86/coco/tdx/Makefile        |  2 +-
>   arch/x86/coco/tdx/debug.c         | 69 +++++++++++++++++++++++++++++++
>   arch/x86/coco/tdx/tdx.c           | 27 ++++++++----
>   arch/x86/include/asm/shared/tdx.h | 39 +++++++++++++++--
>   arch/x86/include/asm/tdx.h        |  3 ++
>   5 files changed, 128 insertions(+), 12 deletions(-)
>   create mode 100644 arch/x86/coco/tdx/debug.c
> 
> diff --git a/arch/x86/coco/tdx/Makefile b/arch/x86/coco/tdx/Makefile
> index 2c7dcbf1458b..b3c47d3700e2 100644
> --- a/arch/x86/coco/tdx/Makefile
> +++ b/arch/x86/coco/tdx/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -obj-y += tdx.o tdx-shared.o tdcall.o
> +obj-y += debug.o tdcall.o tdx.o tdx-shared.o
> diff --git a/arch/x86/coco/tdx/debug.c b/arch/x86/coco/tdx/debug.c
> new file mode 100644
> index 000000000000..cef847c8bb67
> --- /dev/null
> +++ b/arch/x86/coco/tdx/debug.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt)     "tdx: " fmt
> +
> +#include <linux/array_size.h>
> +#include <linux/printk.h>
> +#include <asm/tdx.h>
> +
> +#define DEF_TDX_ATTR_NAME(_name) [TDX_ATTR_##_name##_BIT] = __stringify(_name)
> +
> +static __initdata const char *tdx_attributes[] = {
> +	DEF_TDX_ATTR_NAME(DEBUG),
> +	DEF_TDX_ATTR_NAME(HGS_PLUS_PROF),
> +	DEF_TDX_ATTR_NAME(PERF_PROF),
> +	DEF_TDX_ATTR_NAME(PMT_PROF),
> +	DEF_TDX_ATTR_NAME(ICSSD),
> +	DEF_TDX_ATTR_NAME(LASS),
> +	DEF_TDX_ATTR_NAME(SEPT_VE_DISABLE),
> +	DEF_TDX_ATTR_NAME(MIGRTABLE),
> +	DEF_TDX_ATTR_NAME(PKS),
> +	DEF_TDX_ATTR_NAME(KL),
> +	DEF_TDX_ATTR_NAME(TPA),
> +	DEF_TDX_ATTR_NAME(PERFMON),
> +};
> +
> +#define DEF_TD_CTLS_NAME(_name) [TD_CTLS_##_name##_BIT] = __stringify(_name)
> +
> +static __initdata const char *tdcs_td_ctls[] = {
> +	DEF_TD_CTLS_NAME(PENDING_VE_DISABLE),
> +	DEF_TD_CTLS_NAME(ENUM_TOPOLOGY),
> +	DEF_TD_CTLS_NAME(VIRT_CPUID2),
> +	DEF_TD_CTLS_NAME(REDUCE_VE),
> +	DEF_TD_CTLS_NAME(LOCK),

nit: That's a bit wasteful for sparsely populated fields but I guess the 
extra complexity of having a struct in the array with the bit definition 
and the name isn't worth the space saving.

> +};
> +

<snip>

