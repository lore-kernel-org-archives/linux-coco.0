Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519982D3218
	for <linux-coco@lists.linux.dev>; Wed, 26 Nov 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153215; cv=none; b=JdmCJ5H2fbb3YJJxn+hjbiOFQPpekYC6+ESrCsUbzbazT/hB1bEZkKpPrmy9uM9UKjoA6XykrqIOA0+TnjWLqiPy3HvxUL8oH9ddj+aT6FsckHZIFTYn+mW/jEZRINQEMSPkYglGwhGQPG+JnN17R49AoZLanbJ2OEzVIJWHBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153215; c=relaxed/simple;
	bh=Ur9kql7U+/v/2Z69uOq79eO1iG+26YgPPfQgo8rBplQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pMMYClIx/YJhemvxsdlSpk6Vy/BlAlKHhQK8XaJHLiDXEwnOcmnvg1uzoltM81/KruwhKuK3FwLauUjDnmGSfkHfb/7If0orzeA+eJcaObeUwshxCJronSSDeOWFnKf0+gK53UjF5ANTtMubAsuD1VV4tyQHOOpEhqEpiH2BjAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itBpPRUB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itBpPRUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764153212; x=1795689212;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ur9kql7U+/v/2Z69uOq79eO1iG+26YgPPfQgo8rBplQ=;
  b=itBpPRUBECJpC0icGPgg4GYT+rs2GWBprzxpGQmLchG2jM2oaYh6L3mY
   0EdfiR2+f4Am2iCFQfFAXbcp4pka9R0bOZIbXN+Iv7unyc1Yrc74Vw68Q
   i/NMbASe0j9N4OgiWFcJJtOgou3PkqTag6JF/eLGwZgcRSkWLLg82QrLa
   k2s5acS7xkFlzd2GKisKbKc1cWs8eZMagtcgm95+UYlxDogwB+Ohum6hX
   dfqT5LtwtTlwONLhy14/TcZaAyF6ZScgOAxA+zQYJKqvMgvPjX7AHa1xI
   UVICOdYdEVJYmadXX7JVVS8dLU+ZyaGLLmw2HrIhN9tFkVP8l8Q0dVzHS
   A==;
X-CSE-ConnectionGUID: xBRNrjiDRSO601KWR+zG6Q==
X-CSE-MsgGUID: O5XRHsMERTOp+NpcvlLc9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66072562"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66072562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:33:31 -0800
X-CSE-ConnectionGUID: /sevPXnBTH2xG03l0lkeRg==
X-CSE-MsgGUID: 2UfdedDgQMujnGkBioKgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223868382"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:33:27 -0800
Message-ID: <96775d7e-e0d9-404e-bdb0-8c95db7f09cf@linux.intel.com>
Date: Wed, 26 Nov 2025 18:33:24 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/16] Documentation/x86: Add documentation for TDX's
 Dynamic PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com,
 isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@linutronix.de, vannapurve@google.com,
 x86@kernel.org, yan.y.zhao@intel.com, xiaoyao.li@intel.com,
 binbin.wu@intel.com
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-17-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251121005125.417831-17-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/21/2025 8:51 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Expand TDX documentation to include information on the Dynamic PAMT
> feature.
>
> The new section explains PAMT support in the TDX module and how Dynamic
> PAMT affects the kernel memory use.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [Add feedback, update log]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> v3:
>   - Trim down docs to be about things that user cares about, instead
>     of development history and other details like this.
> ---
>   Documentation/arch/x86/tdx.rst | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/arch/x86/tdx.rst b/Documentation/arch/x86/tdx.rst
> index 61670e7df2f7..8d45d31fee29 100644
> --- a/Documentation/arch/x86/tdx.rst
> +++ b/Documentation/arch/x86/tdx.rst
> @@ -99,6 +99,27 @@ initialize::
>   
>     [..] virt/tdx: module initialization failed ...
>   
> +Dynamic PAMT
> +------------
> +
> +PAMT is memory that the TDX module needs to keep data about each page
> +(think like struct page). It needs to handed to the TDX module for its
                                         ^
                                         be
> +exclusive use. For normal PAMT, this is installed when the TDX module
> +is first loaded and comes to about 0.4% of system memory.
> +
> +Dynamic PAMT is a TDX feature that allows VMM to allocate part of the
> +PAMT as needed (the parts for tracking 4KB size pages). The other page
> +sizes (1GB and 2MB) are still allocated statically at the time of
> +TDX module initialization. This reduces the amount of memory that TDX
> +uses while TDs are not in use.
> +
> +When Dynamic PAMT is in use, dmesg shows it like:
> +  [..] virt/tdx: Enable Dynamic PAMT
> +  [..] virt/tdx: 10092 KB allocated for PAMT
> +  [..] virt/tdx: module initialized
> +
> +Dynamic PAMT is enabled automatically if supported.
> +
>   TDX Interaction to Other Kernel Components
>   ------------------------------------------
>   

