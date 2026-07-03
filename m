Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F5F328B61
	for <linux-coco@lists.linux.dev>; Fri,  3 Jul 2026 04:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783054515; cv=none; b=AGQRaAyOL9JJ0HWNBz7Se7igJtaR/ND5zX0z+CQDMY1LUyXy46Q/WTzt0+hOBUCyyIzGjy+ujYLwgvuBs54iRpAfCmhauhNpxptGwkpMSZ2BQ0Io84zEhFEXobolpZO1OBvZEWYK7JPxDpjyfc+TONMJ+ru8qWFMpK8BubsDU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783054515; c=relaxed/simple;
	bh=iuOzoj8VYCv9ymqTjCLjQ2N5iWOPzNnBAFButwsM1Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msib/fPx2KXBJSxxJenfzQsPL6EWlMI3zwCvOZv1CxM0pIJbzy0h3mfMUvgZfwk6zmzkf0oJPj1QYRdakvzj2g+I3e+7GIW38BJS4e42UsZ+ZfnyAwdIfPbYDclR7gz/fwAzh2sM7AOIOwtF0RZxc0jv2+zDEHKF43sQE5zMBHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8Rgjjv4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8Rgjjv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783054503; x=1814590503;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iuOzoj8VYCv9ymqTjCLjQ2N5iWOPzNnBAFButwsM1Sk=;
  b=m8Rgjjv4z8GJGXWKcmlch3cMZsnBVG++vNR0rXnjffxBgPVoXoC8Mx8o
   HWlcS/4ux4HBpsNaalub7zxEO/ssPjdvAarvZuWvPQfw2IPx3SOJ59uTe
   gvoRbCsHElRu8JonD3Lzgk/Kf0i/anzwZoM1mdiVhzMOXhOsz18yUddKt
   4BaUx3PFEV/ALe/N1+6/H6c61NBimY/T31OFpD+TwTg9wLYO0Pc5wc88s
   d7PCyuIEixRu6XExEoaLz1SZ2BDnfMyw03msyqk8XXNoOYa29bMTlf3w5
   8EklaAM1w/PA3vzrlExaY9/LV3eszt06qzNawSxsZ45MvRQ6J8xj538iq
   Q==;
X-CSE-ConnectionGUID: Tk8CPe/+QgeauD6xw7MncQ==
X-CSE-MsgGUID: tx8SPW1sS+2LMq3N+S8iZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94958087"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94958087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:55:02 -0700
X-CSE-ConnectionGUID: g2dfjOB9T8GyTR6dIAnYcw==
X-CSE-MsgGUID: znwn3ZDcRAmHHiXj+CQS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277345905"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:54:57 -0700
Message-ID: <83a7fda7-e9ad-4420-be93-13937d41dc4b@linux.intel.com>
Date: Fri, 3 Jul 2026 12:54:55 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] Documentation/x86: Add documentation for TDX's
 Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-12-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-12-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Expand TDX documentation to include information on the Dynamic PAMT
> feature.
> 
> The new section explains PAMT support in the TDX module and how Dynamic
> PAMT affects the kernel memory use.
> 
> Assisted-by: Sashiko:claude-opus-4-6 GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

> ---
> v6:
>  - Add missing word (Binbin)
>  - Use "::" instead of ":"
>  - Make format of dmesg example accurate
> 
> v3:
>  - Trim down docs to be about things that user cares about, instead
>    of development history and other details like this.
> ---
>  Documentation/arch/x86/tdx.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
> index ff6b110291bc6..ce026a88b6f78 100644
> --- a/Documentation/arch/x86/tdx.rst
> +++ b/Documentation/arch/x86/tdx.rst
> @@ -73,6 +73,28 @@ initialize::
>  
>    [..] virt/tdx: TDX-Module initialization failed ...
>  
> +Dynamic PAMT
> +------------
> +
> +PAMT

Nit:
It seems that there is no spelling out of the acronym in the source code or the documentation.
Maybe it's a good place to give the full version. E.g.

Physical Address Metadata Table (PAMT) is ...

> is memory that the TDX module needs to keep data about each page
> +(think like struct page). It needs to be handed to the TDX module for its
> +exclusive use. For normal PAMT, this is installed when the TDX module
> +is first loaded and comes to about 0.4% of system memory.
> +
> +Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
> +PAMT as needed (the parts for tracking 4KB size pages). The other page
> +sizes (1GB and 2MB) are still allocated statically at the time of
> +TDX module initialization. This reduces the amount of memory that TDX
> +uses while TDs are not in use.
> +
> +When Dynamic PAMT is in use, dmesg shows it like::
> +
> +  [..] virt/tdx: Enable Dynamic PAMT
> +  [..] virt/tdx: 10092 KB allocated for PAMT
> +  [..] virt/tdx: TDX-Module initialized
> +
> +Dynamic PAMT is enabled automatically if supported.
> +
>  TDX Interaction to Other Kernel Components
>  ------------------------------------------
>  

