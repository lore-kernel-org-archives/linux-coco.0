Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F78823D3
	for <linux-coco@lists.linux.dev>; Tue, 30 Jan 2024 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706629478; cv=none; b=foLWAvLRO1j6DjD0kTROsZlKBBa6cGRp7s38n6oLjCwa6vYITXQR/reVQ8AQHjHWqAmIhwVgc9Y/1UmN21HfQGceYs5YmHCMI1mZsIY1Y9a5yLubRSY6J3AT5r2JQK076URXw29Td7Gqhd0ungygCOv/ZD9w1uKo/yEyqWAmOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706629478; c=relaxed/simple;
	bh=H9m5L+gl6b+V+BQn2ouEpS21xEZtO77MxusqWCRPkaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTB69ewxCSNvzYOJWK1bwgTkj+XLJVFWMNdQdyyv0ofFGIntbJyVOggbYds8j0qiq2xQPeiJ3Ls5v7XGCDUhHQZYOCMWGJ2HNYZJOfqVV6bSILtc8qBsPi4hS5c5nr4eTIl3HT9LyLQLzfwziD3Vv3jioS9oUlTTv2n0EnUQa+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdlJKpyG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdlJKpyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706629477; x=1738165477;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H9m5L+gl6b+V+BQn2ouEpS21xEZtO77MxusqWCRPkaM=;
  b=EdlJKpyGfF4k8PVqe7dVLLIbXIkL30td6eV1oBQRKuYjUplI9aReL+a0
   80GTlzvSg/tEnVJtet/msJTHB7YxCiFN7Fi6aB1emSx/jkYj5gt0tYpg0
   O8ERZ+9xrNmpgSBlgkqAmDWcG7tJBhPtgdfAn9BUoOV1QDSEEB3UD7BV0
   iLeFL8xl8snCdpswpNQd7TxML53IaXraxXzvvE6J7YWhS/VwRrkL8kmd1
   RLv6NBRHYRoV4CafFwCXDPNneCz9i3co26rs9fiUiZmABb8BTFqnJLgoK
   P8z+XGE3PHiT0I9oLlRP4G5r/tdDcOlpfgxVjWpNa2tDcRQmmytA0omIo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="9984009"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="9984009"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3751415"
Received: from pangchin-mobl3.amr.corp.intel.com (HELO [10.209.54.246]) ([10.209.54.246])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:44:35 -0800
Message-ID: <62c3cd00-d072-4daa-8e67-442d52325cde@linux.intel.com>
Date: Tue, 30 Jan 2024 07:44:34 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/random: Retry on RDSEED failure
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, "Kalra, Ashish" <ashish.kalra@amd.com>,
 Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240130083007.1876787-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/30/24 12:30 AM, Kirill A. Shutemov wrote:
> The function rdrand_long() retries 10 times before returning failure to
> the caller. On the other hand, rdseed_long() gives up on the first
> failure.
>
> According to the Intel SDM, both instructions should follow the same
> retry approach. This information can be found in the section titled
> "Random Number Generator Instructions".
>
> To align the behavior of rdseed_long() with rdrand_long(), it should be
> modified to retry 10 times before giving up.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---

Change looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Wondering whether this needs to go to stable trees?

>  arch/x86/include/asm/archrandom.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
> index 02bae8e0758b..918c5880de9e 100644
> --- a/arch/x86/include/asm/archrandom.h
> +++ b/arch/x86/include/asm/archrandom.h
> @@ -33,11 +33,19 @@ static inline bool __must_check rdrand_long(unsigned long *v)
>  
>  static inline bool __must_check rdseed_long(unsigned long *v)
>  {
> +	unsigned int retry = RDRAND_RETRY_LOOPS;
>  	bool ok;
> -	asm volatile("rdseed %[out]"
> -		     CC_SET(c)
> -		     : CC_OUT(c) (ok), [out] "=r" (*v));
> -	return ok;
> +
> +	do {
> +		asm volatile("rdseed %[out]"
> +			     CC_SET(c)
> +			     : CC_OUT(c) (ok), [out] "=r" (*v));
> +
> +		if (ok)
> +			return true;
> +	} while (--retry);
> +
> +	return false;
>  }
>  
>  /*

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

