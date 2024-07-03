Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540DE137760
	for <linux-coco@lists.linux.dev>; Wed,  3 Jul 2024 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009362; cv=none; b=HHkGUNri/roi6hbiHns3aJP0vHqcTdrR0RZUI924b9fGbh2Wb3Hn9aFhzvj6mK2rIaiZozbjAoUDEtbvQa7PZFr8WVBHgid7B3UHA5kZYmWvkt+t5y9VayeAMkMGEq5Gd8SGMUY+wVGFCM3AmdoDp0mM/Qq2LTSDjl/TWnCLgSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009362; c=relaxed/simple;
	bh=TX2gvgdit2no2Bm4JOYvYuXVgfwUmwr1dfS1rQTimbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/S9ja7yHQHTliyfmXvQ6OLQyTIqSzQ2m5vfBAHjY3p+vRY3RP3Gu9YDLu3ta2G90qfnERP2OzCfQxMtkI5PsMExg9UHslAyBOXuanhEpF3tqj+xwFAnCsbtt+cLIw3x+JnPrCBZyPWjsMLL01V4sBLcbYKrtqEAUmMU6lwsQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f0CqfjZZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f0CqfjZZ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso56093561fa.2
        for <linux-coco@lists.linux.dev>; Wed, 03 Jul 2024 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720009358; x=1720614158; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYo5IBsgfXZoFfV/jrH0cWY+s6dZqG1CrWcT7nsdClQ=;
        b=f0CqfjZZ1L34h9fUYiBhgyfcPuqyDlLgXtXvfBz8TH1U3foRMWIiy5jJ4EG0DMxjSy
         qYM5dDm5QKZX+nxg5scYIsOYKykiuZcJiZmBFL1c8BM+zeapKVMF13pW7f/h+lzwmWLk
         mzyBTFXVax7yEUsYZNQkXZvwhVsDf4Ud4xfrZ1e3hdklmjHJiw1nPpNWZEenPabRGlD8
         8er4l4cykSbgBdygi1s2RL12k2Tb3WZu4fWJhaT+AjlTYKNQfWtalx6/qXpyULe36S6V
         Me3raLusEOCncCSMqmq3X18xfKdhnIW//Peb6XJTjViqSaj0ycHr2SetTMDfp8W6pItX
         txNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720009358; x=1720614158;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYo5IBsgfXZoFfV/jrH0cWY+s6dZqG1CrWcT7nsdClQ=;
        b=TyOsaZVjEoEaG48mPsI3m7F5eSsEtc9wJaVqWWoDTfs7w+YKkM9XJ+FypBaas0h5a4
         tJadlXJqierYaXrLWBjhOU71YZImwR/jDChTToZWE1tKEIAienSkRSB3t//fmaDKulbu
         lJ0lIVyEbas8u93pT7yii66NOS9rHZuhpufE4L8YoiGdAH/m7HQZ9sSMrvcXTVo4KoX+
         lWVvm53aqsvJrjPf5n56ALKuZhjFhzjgL9VE9OG+YE4BSWJb70YH3AvGUkV/Hv+9APOe
         j/nkyYRfFywb7+VfvRozoLbkXvosXnvOQbxsv3CUg++8pz6y/JIS1710P/3z+p8tTKxV
         LgBA==
X-Gm-Message-State: AOJu0YwlF5TjOfmfhoifF/qvcF1aDe8LjO3VZd68bwqi2LNuo7s01O0I
	4cPxYrXanltKt0haYlpPDKKMnKdtBnsgTTRO8jD3/Ma8JlmEyZ8Tgo/1knlbd8g=
X-Google-Smtp-Source: AGHT+IHZ4VR/Z2EA5bNROzM44bBxwS+VTMY4KF41urbY5op+dc5ajamiSRVwX7gtAx+LOXib0By3RA==
X-Received: by 2002:a2e:a902:0:b0:2ee:6062:b559 with SMTP id 38308e7fff4ca-2ee6062b816mr81975241fa.8.1720009358326;
        Wed, 03 Jul 2024 05:22:38 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:757f:69b1:bdb0:82db:8b8b? ([2a10:bac0:b000:757f:69b1:bdb0:82db:8b8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b064f16sm236821285e9.27.2024.07.03.05.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:22:37 -0700 (PDT)
Message-ID: <d405c84e-2b8c-4139-b4ea-d716fe53dfca@suse.com>
Date: Wed, 3 Jul 2024 15:22:35 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 3/4] x86/tdx: Dynamically disable SEPT violations from
 causing #VEs
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240624114149.377492-1-kirill.shutemov@linux.intel.com>
 <20240624114149.377492-4-kirill.shutemov@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <20240624114149.377492-4-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.06.24 г. 14:41 ч., Kirill A. Shutemov wrote:

<snip>



> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -19,9 +19,17 @@
>   #define TDG_VM_RD			7
>   #define TDG_VM_WR			8
>   
> -/* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
> +/* TDX TD-Scope Metadata. To be used by TDG.VM.WR and TDG.VM.RD */
> +#define TDCS_CONFIG_FLAGS		0x1110000300000016
> +#define TDCS_TD_CTLS			0x1110000300000017
>   #define TDCS_NOTIFY_ENABLES		0x9100000000000010
>   
> +/* TDCS_CONFIG_FLAGS bits */
> +#define TDCS_CONFIG_FLEXIBLE_PENDING_VE	BIT_ULL(1)


So where is this bit documented, because in td_scope_metadata.json 
CONFIG_FLAGS' individual bits aren't documented. All other TDX docs 
refer to the ABI .json file.

Landing code for undocumented bits unfortunately precludes any quality 
review on behalf of independent parties.

> +
> +/* TDCS_TD_CTLS bits */
> +#define TD_CTLS_PENDING_VE_DISABLE	BIT_ULL(0)

In contrast the TD_CTLS bits are documented in the same .json file.

> +
>   /* TDX hypercall Leaf IDs */
>   #define TDVMCALL_MAP_GPA		0x10001
>   #define TDVMCALL_GET_QUOTE		0x10002
