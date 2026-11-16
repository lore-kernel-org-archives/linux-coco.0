Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828523;
	b=wM1TxEPa/JpTQM6spV2aTIxuw/8wFYtKfPky1EibLls1nJoOLZ2VSnbItPrag01ujlFW
	 NmmMP2haXxCzMqVNf3VpHqToi/MjQhEumcPBnfeDOSJLFmlPD9GTToK6f7HUqZ3fil2kf
	 G1VJg1WiZ8TDFgeqhJD8vPN/DMZnWOZgWDcuZbOaHcziyBeDWkru2tiGJPH9HosCaC18U
	 vrwIP41uwYz+KyDEIwVQZB50e0O3IkcwKFxJx5yl3rrLnJ/jDjczEYnwC+ILVcSYMDjnT
	 nPpwlXIobLA5ztaDpNGgykoPa/bpt22ctfrfBjbxOjW1CPB9TL0LUGqUmaclwFfaH5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
	b=aIGDqyhgLK/DXj5fMfN7KxOgR7nSNVT/+fxMIeByd0Ofw8DxZw61YcxfCu7k1oUmNzVw
	 5HuPDYHIl3QNb1gUoL9QHbcWwGHNC18nMw2pz5WoknzN1jnRHsVE2fVx6miVDmWBzYWIs
	 Gdikp88zvmnrE5wjnU6En9t5OiYBssntXgvSsVUpoRwUb1eBd+Y58TLDl1sdbqp9pAPLT
	 eiRjGFfR9Q7YGomi2G1mVnh/bRFP8sEFfbNd5VrGK4xl/mdDoUfPGDZ5fwBYbCVyfmoXQ
	 sIvic+sIaKF8YBFuLQhjTDQ9aNlR/x2roZN0p8cdQr1Pk3Yu7yul1oaXcesjJyWrKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UAobX7Mt;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343D606A330
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 11:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D343D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UAobX7Mt
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so23673015e9.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794828521; x=1795433321; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=UAobX7MtLBSWJNQSWfJHrPtw/vEAtb/4yRpGMnIlET89ui6wuKNG34K8AYAzLR5umj
         VJs/xLIg+xDw6fsgLP1i4xofg88c4rP2qTQzLhabCiXIy9/M/bTI07XDb1LM9uriFJ1z
         6XOm2+EhXFbpXGUAZbTOoBE/65kIF2xa0fM121JG1SbERd+ggif9S0T7C/0G6hJE3eWw
         7gZf3DWJAcLncAEXWdKxbEo7PMZZakTFv+44Y/v18nMWNSJ9FCBOoDP6yfTNF/FKWe7U
         zd11YNYi8fipe0r1ZHo/vRS1lfvcHKi0m5FyI5t10GzN1tWe6Irh2XU2PNezpNfnNnE3
         O2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828521; x=1795433321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g73PX0PTBDOigD/y1VmqsLoo3oXmbxRQK+YkYSvt5eM=;
        b=QXyWQLJjx6mj3ncLf91iXT4iIAqEaIYNJzl6B1pN3UyotUy5EO2Y9jCrK+8Uft6YtW
         3wVGx9B9+AkCBpA9zaEwX6F61LWBix0GBUUNM8mS4rszPBHLgFx1Jn8yU9GK4R8dlRcT
         HYASQ8IHvm4ztLu2C3c+yewHxW12eXT7UW/xMTWcK+LuT+KSKzrl8Y/nIEjp61rKZo/G
         xZNlzz/qC1s9C2S+/Hh0/narekMvUVBPfBSXDZ5MAnAQQgVLTpTHaW1cKVp/CrYXDZLG
         aeEMs1ZRbJ60KkdwrWAlbgCnbgxWXhRe9I+n5dezKXG5dzqP016FFO4pBODxrEdFK1JR
         OfXQ==
X-Forwarded-Encrypted: i=1; AL+hErEh1Em6U0DARxLPmZe4Dr7lGopYGRtBzuUmLRpOaMsvDRhsFfNI+dUj/IZeHx+xgPPcXOIsfbK29qOu@lists.linux.dev
X-Gm-Message-State: APuU4Z9O7l+97UbLeANBTKP7lxn/TZjcZW9gfoZcqgK9DaFCkt1woGYW
	j4wFoiuvVKnTGLHLxASowq/8GalnZJWNk01WwCxIBTMccdfdeN9zatAGESdG92AFig==
X-Gm-Gg: AYBFou0ynMXo2SYf2GIc6oHUZT0JBceOlMEpaNUlsdEmBTul22L7qmEDpfib+0CZ6Wc
	N30cEvtj8jblU6FeG6T7QMxMbnoIerx4uW0/NM0SXAspmLIHPARWsRWFU2Lx4KzhoA7y3Ow4OTP
	Y3ueF+iCKOBRagsrY6AqJaML/ePeE2Hi7mAjttIl8fjzc/OKSKz9hXgRQkZBNhlor2e/tyLwxZk
	f/wLrpB5aebY41tJrwrfWHGNsYJsljTORHUXWXgI0RTLUIGCwYTHo/pz49I2XDLN4IuAOMll5k/
	7WYrxZL8OPl0StozTbaMx7H8RjUaDYTchYG9W6t0eGC53LKjV/QaOkfvsTJWfDiR7RB8nShF9E6
	vO3430/DMkXfOjfol+2Ckkl14AgFfIvVUOPXDkTYIFJK6eZyjDucWumkWt3FJPU043pKDXtjc6K
	7FEyXWSDRkO+e0yaPOW9Ji7LpnJwJBxdAR0ZAIKQ6ZvYKipZVwDPbSpwAyhL4t9vzSoIiNPXH1E
	53rVZqGPNzIcpVn1bKjxBBvjzpoL6ReVQAYn9CV95eeP0KOJ/M+PutSrGVD0yU3AxvvdsDDxM/f
	cbdO+oO4gv2AnKVpcFaZ5HBgqHH/I2+h5OZXX7iA+fqiCprDv4f79XGrG7aIa84yiA==
X-Received: by 2002:a05:600c:5903:b0:4bb:60b3:7ea9 with SMTP id 5b1f17b1804b1-4bb60b38023mr126053495e9.0.1794828520786;
        Mon, 16 Nov 2026 03:28:40 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ee47dsm21324022f8f.38.2026.11.16.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:28:39 -0800 (PST)
Date: Mon, 16 Nov 2026 11:28:35 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avro44jUWOARFzul@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116110549.1863653-1-fuad.tabba@linux.dev>

On Mon, Nov 16, 2026 at 11:05:49AM +0000, Fuad Tabba wrote:
> From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
> 
> On pKVM, set_memory_decrypted() shares pages with the host in place and
> without cache maintenance. The atomic pool, dma-direct and dynamic
> SWIOTLB pools zero their memory only after sharing it, so unless the
> page allocator has zeroed it, the host can read whatever the guest last
> left in it. Zeroing first isn't enough on its own, as the zeroes may not
> have been written back to memory, and a host that maps the pages
> Non-cacheable then reads the old contents.
> 
> Zero the range and clean it to the PoC before sharing it, so that no
> caller can hand the host stale data.
> 
> Fixes: ebc59b120c588 ("drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls")
> Fixes: e62decaf98e7c ("arm64/coco: Add pKVM as a CC platform")
> Link: https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> [fuad: take the pKVM hunk of v10 patch 2 as a standalone fix, add the clean to the PoC]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     This is the pKVM hunk of patch 2 of Aneesh's v10 [1] plus a clean to
>     the PoC, taken on its own because it fixes a bug that has exposed
>     guest memory to the host since v6.12.
>     
>     Based on Linux 7.4-rc3 (aebb727447640).
>     
>     [1] https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
> 
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index 26fe9c3f22e36..81d1cd24a2eff 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -9,10 +9,12 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/array_size.h>
> +#include <linux/cacheflush.h>
>  #include <linux/io.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
>  #include <linux/pgtable.h>
> +#include <linux/string.h>
>  
>  #include <asm/hypervisor.h>
>  
> @@ -61,6 +63,15 @@ static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
>  
>  static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
>  {
> +	size_t size = numpages * PAGE_SIZE;
> +
> +	/*
> +	 * The host can read the pages as soon as they are shared, possibly
> +	 * through a Non-cacheable mapping. No caller relies on their contents.
> +	 */
> +	memset((void *)addr, 0, size);

Are we sure we want that? The guest may want to setup memory and then share it.
I am not sure about modifying this API. 

> +	dcache_clean_poc(addr, addr + size);

I believe the hypervisor is already doing the cache maintainance when the page
is mapped back into the host. (see stage2_map_walker_try_leaf())

-- 
Vincent

> +
>  	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
>  				  addr, numpages);
>  }
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> -- 
> 2.47.3
> 
