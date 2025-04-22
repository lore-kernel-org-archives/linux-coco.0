Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC227700A
	for <linux-coco@lists.linux.dev>; Tue, 22 Apr 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329090; cv=none; b=uiCJC+AfmIApSw7z5uzkikmUvlecKKQrqLQzl7aBZZ7vnd7lppBnVR3YdTZvL83gsrTbUz542BTGemLx4B3AyxnTCKxi8VNtpnvCrvHda4FZ71mtcIxfuppoqa0QFe96426gclvUstvsVAKSsv85PDlHwbvnmHEW7q6IBd+Q+1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329090; c=relaxed/simple;
	bh=pl6fiPutlShbxadQEmo5fBZv/7bbFR/l3H1kg5gJjmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ipc5wLTJ4bn3HBimYir6vqWJOGmWOFXKbtsDnHa5JT3gpOZJ2lSXGPM24W0L3HNdrfaQHsxBhLamAuu6JM7BBBQwtrkQei02bz0OmMX92LEtZwK+oU/Esr+pq8Mg/vXHep71y4D1QFCi5W2IxafxgQZfrDHDQ3GTIvj6OJ1AM9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TK5hPygR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TK5hPygR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ac56756f6so5136810f8f.2
        for <linux-coco@lists.linux.dev>; Tue, 22 Apr 2025 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745329087; x=1745933887; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dF9sFNvJKB1EQkguCgrZyubpUsdg/C5YYpWtECEXaQs=;
        b=TK5hPygRzcaPGS2aWSaG/eZ7UdHaXt2hSFgDx2DpmNWS1ZCx7iwNLsISwgnkd6LV9Z
         B4L5aya70q3h7mRYjI5RG9PFJeGmGO4rcgfjsPkr7hjI4ZmcAonj+VYl3IXhtYmx4Qmm
         k5dVggBmj0BcgC7fgesZCO8URvcbmSgqD4pUCTyZ+n9oS0Ha06tfuqYEJdgkHpvjcugZ
         zP8MCzt47SKD0vrdK6UE/NIV91gV3EeHCHY/jqF/U9s1s6lUMUOO5+9D6U/o6NI8/Ncs
         e0F/ciP2sw3IeZZjFK67RTQ6RQstQdjoF4Cgszb3NmtF3snfaDzcJAzCiTMlhp0nTUVU
         p4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329087; x=1745933887;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dF9sFNvJKB1EQkguCgrZyubpUsdg/C5YYpWtECEXaQs=;
        b=eiycu5x9Cnttnk5Tz3t7wPKjAX0y0/DJfVkEwnm8Tbm3219A/Tv29v7mp++8lkSz79
         x1MujcvxNrCjGC158gMvcTpX1NK8s5jiK52p7Nk9u1L/YqDugLMcCc1llCdG9Crbf9au
         7P0lM+5G28Spxo1VYhrxv7ML3vvV1BZiybUWYEE3ahSKGku5RwdQNln4rv5wKxDocdLs
         sje0yVhBS768ai9WUub+qZaYk+gjf2Efq4e9hB4fikza+54HBMYiDQ87UrgnW7/jFvwi
         jMCI80sokOzhGeLbUYUIgqTkuLXcnkHGUOLM2BtbFerxNM3GoNoKuUyG42KFUF49f+Oh
         hPrg==
X-Forwarded-Encrypted: i=1; AJvYcCUtDTwF41+/BLbrDIcakX0aFfs1MiUb6MyahFhWlHaGHAsLYW+s5a+F7yR2drii/8nNlEbT3a4V+nQk@lists.linux.dev
X-Gm-Message-State: AOJu0YyTu+yLQssai+fmZKyhkLxK2l18B3MnQOPTU/9WgvWTD7KhvFQf
	SBplFtx2kYc6C3cbN+VdkbDlbb2luUoNtTeMrwiadIAHC9nJoi+n4i5K/1SazH4=
X-Gm-Gg: ASbGncsqGO68Tt5pY9zs9Pw211QPm+yyHiOk5SsZeVzbeVkh5NRgwmjrcHpt50xy86i
	LAVe3MOn/F8/LKBbEOKTO91LjRcBLpEhfmFiwhA8N3FBayxRevr/f9dOMCr/3j3vLO7tff/83Ra
	C9jD0o1hBqmQFOVse4oRNy9aCNCGo+Zo5veumHOzbS7bccxCi9pkcA23/Y7RZMe+p+zY9Bb3/mn
	jEawspB3LA+E/MoT36eIzUH9vd6R0qAUg+BNlKn1HagaVBbFotv6xxK+dzcOGPw/2IXjjrxLX+d
	A25WwDmSM1wW/3RQKVgSJTfqXAryl1quDJd1zghunt+k
X-Google-Smtp-Source: AGHT+IFAfaa289JIhV75JZIoorDwyS7gM9JvKdzqygxCBcHk/VmqP/FsIBipNSbuJYG5ffhdbcNMxA==
X-Received: by 2002:a05:6000:1a8f:b0:39e:e259:91dd with SMTP id ffacd0b85a97d-39efba501a2mr11704479f8f.17.1745329086702;
        Tue, 22 Apr 2025 06:38:06 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.133.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207fcsm15542344f8f.19.2025.04.22.06.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:38:06 -0700 (PDT)
Message-ID: <20eaf26f-90e0-44b4-aa4a-ca4aa06be1dd@suse.com>
Date: Tue, 22 Apr 2025 16:38:05 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/devmem: Drop /dev/mem access for confidential
 guests
To: Dan Williams <dan.j.williams@intel.com>, dave.hansen@linux.intel.com
Cc: x86@kernel.org, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>, stable@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <174491712829.1395340.5054725417641299524.stgit@dwillia2-xfh.jf.intel.com>
 <174500659632.1583227.11220240508166521765.stgit@dwillia2-xfh.jf.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <174500659632.1583227.11220240508166521765.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18.04.25 г. 23:04 ч., Dan Williams wrote:
> Nikolay reports [1] that accessing BIOS data (first 1MB of the physical
> address space) via /dev/mem results in an SEPT violation.
> 
> The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
> unencrypted mapping where the kernel had established an encrypted
> mapping previously.
> 
> Linux traps read(2) access to the BIOS data area, and returns zero.
> However, it turns out the kernel fails to enforce the same via mmap(2).
> This is a hole, and unfortunately userspace has learned to exploit it
> [2].
> 
> This means the kernel either needs a mechanism to ensure consistent
> "encrypted" mappings of this /dev/mem mmap() hole, close the hole by
> mapping the zero page in the mmap(2) path, block only BIOS data access
> and let typical STRICT_DEVMEM protect the rest, or disable /dev/mem
> altogether.
> 
> The simplest option for now is arrange for /dev/mem to always behave as
> if lockdown is enabled for confidential guests. Require confidential
> guest userspace to jettison legacy dependencies on /dev/mem similar to
> how other legacy mechanisms are jettisoned for confidential operation.
> Recall that modern methods for BIOS data access are available like
> /sys/firmware/dmi/tables.
> 
> Cc: <x86@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: "Naveen N Rao" <naveen@kernel.org>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
> Link: https://sources.debian.org/src/libdebian-installer/0.125/src/system/subarch-x86-linux.c/?hl=113#L93 [2]
> Reported-by: Nikolay Borisov <nik.borisov@suse.com>
> Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
> Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
> Cc: <stable@vger.kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> Changes since v3
> * Fix a 0day kbuild robot report about missing cc_platform.h include.
> 
>   arch/x86/Kconfig   |    4 ++++
>   drivers/char/mem.c |   10 ++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 4b9f378e05f6..bf4528d9fd0a 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -891,6 +891,8 @@ config INTEL_TDX_GUEST
>   	depends on X86_X2APIC
>   	depends on EFI_STUB
>   	depends on PARAVIRT
> +	depends on STRICT_DEVMEM
> +	depends on IO_STRICT_DEVMEM
>   	select ARCH_HAS_CC_PLATFORM
>   	select X86_MEM_ENCRYPT
>   	select X86_MCE
> @@ -1510,6 +1512,8 @@ config AMD_MEM_ENCRYPT
>   	bool "AMD Secure Memory Encryption (SME) support"
>   	depends on X86_64 && CPU_SUP_AMD
>   	depends on EFI_STUB
> +	depends on STRICT_DEVMEM
> +	depends on IO_STRICT_DEVMEM
>   	select DMA_COHERENT_POOL
>   	select ARCH_USE_MEMREMAP_PROT
>   	select INSTRUCTION_DECODER
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 48839958b0b1..47729606b817 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -30,6 +30,7 @@
>   #include <linux/uio.h>
>   #include <linux/uaccess.h>
>   #include <linux/security.h>
> +#include <linux/cc_platform.h>
>   
>   #define DEVMEM_MINOR	1
>   #define DEVPORT_MINOR	4
> @@ -595,6 +596,15 @@ static int open_port(struct inode *inode, struct file *filp)
>   	if (rc)
>   		return rc;
>   
> +	/*
> +	 * Enforce encrypted mapping consistency and avoid unaccepted
> +	 * memory conflicts, "lockdown" /dev/mem for confidential
> +	 * guests.
> +	 */
> +	if (IS_ENABLED(CONFIG_STRICT_DEVMEM) &&
> +	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> +		return -EPERM;

Just confirming - the STRIC_DEVMEM check here is needed in case other 
CoCo technologies i.e ARM's CCA or risc-v tvm doesn't depend on it? 
Because for the x86 world it's redundant since both implementations 
imply STRICT_DEVMEM.


> +
>   	if (iminor(inode) != DEVMEM_MINOR)
>   		return 0;
>   
> 

