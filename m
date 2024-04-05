Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1B17164E
	for <linux-coco@lists.linux.dev>; Fri,  5 Apr 2024 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712336727; cv=none; b=ZXucpCjJWqXfDp1hKnTXb77+XeiCBrbvgOG4FsUO5ByKvMkXnHdqz5LRtiD/KlVyy69fCnHSZdaT3ykJVdrL7HIb3+8Lygu3M9pm30WayB+IDiuW9EQB8rjQeuhJ+nf+CHrsc1PyqMu2dlbwCIt+/7CRYMgIkBL1nidGRHxHE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712336727; c=relaxed/simple;
	bh=/AEsABMgIL9oKeChIdc/eQy55s/yNzx6q1zHRQyyKiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+J/xRwmICPanUHIA0rY9mVqWHWKTl+TO39WPB07eivPE/YNgZzMbFTsiO5WOGYSex6ahH68kzDBG73FW113zU06qDxmvoIHltlhTZZsCxcOKr3DxPwhc0omDqCUxeYIg0W/xnXK+So5UdXRZIcTyYGlzP8shJZEoS6KrUmCbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yu2jtznq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu2jtznq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712336726; x=1743872726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/AEsABMgIL9oKeChIdc/eQy55s/yNzx6q1zHRQyyKiI=;
  b=Yu2jtznqHUwMkZG96jcpuNusGlgFDV1Hi9US78/DmaegWr/6F6GROIHK
   OrVpmCNdFHsGEfWQ3w8CxmG2omIHFJVdz/D34pPHcfJwBa4K/1w1iIM8h
   frS2utrEvBdVICAcsqstEo0NXJJBmhtb4/ynQTJHs4N4HMGPOJcImyxYr
   QTIKH7KCGdXSxni7E4VImsiLblFf9PoHTu2hyoWK1wh1H9bN6Arf2Q02R
   wweR921hE+9dlKztT6bfJNC4aEebaauji5DzY7vzJkH/iXkVFMBE311Dj
   Xhca6njpSFIFIX8PhN8qvlWMxaCfEBU1mQTvSczH3up4JJLvo/4+6zBPG
   A==;
X-CSE-ConnectionGUID: 4eend8UxSS2ToermB9cu6w==
X-CSE-MsgGUID: M4YtnSdWT0asI+GXqYwrJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="18284825"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="18284825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:05:26 -0700
X-CSE-ConnectionGUID: +MFNCUHzRv2kuSn9OWymFg==
X-CSE-MsgGUID: prsXshp8Tu6fZbMcXuf3OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19659692"
Received: from twwright-mobl1.amr.corp.intel.com (HELO [10.209.65.212]) ([10.209.65.212])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:05:25 -0700
Message-ID: <7cd4b4d5-a7b4-41d9-8bd3-ad41401fec61@linux.intel.com>
Date: Fri, 5 Apr 2024 10:05:24 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] x86/boot/compressed: Skip Video Memory access in
 Decompressor for SEV-ES/SNP.
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org
Cc: rafael@kernel.org, peterz@infradead.org, adrian.hunter@intel.com,
 jun.nakajima@intel.com, rick.p.edgecombe@intel.com, thomas.lendacky@amd.com,
 michael.roth@amd.com, seanjc@google.com, kai.huang@intel.com,
 bhe@redhat.com, kirill.shutemov@linux.intel.com, bdas@redhat.com,
 vkuznets@redhat.com, dionnaglaze@google.com, anisinha@redhat.com,
 jroedel@suse.de, ardb@kernel.org, kexec@lists.infradead.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240325103911.2651793-1-kirill.shutemov@linux.intel.com>
 <cover.1712270975.git.ashish.kalra@amd.com>
 <1027427fafa350a41234f5061c8c48fc77c58326.1712270976.git.ashish.kalra@amd.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1027427fafa350a41234f5061c8c48fc77c58326.1712270976.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 4/4/24 4:11 PM, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Accessing guest video memory/RAM during kernel decompressor
> causes guest termination as boot stage2 #VC handler for
> SEV-ES/SNP systems does not support MMIO handling.
>
> This issue is observed with SEV-ES/SNP guest kexec as
> kexec -c adds screen_info to the boot parameters
> passed to the kexec kernel, which causes console output to
> be dumped to both video and serial.
>
> As the decompressor output gets cleared really fast, it is
> preferable to get the console output only on serial, hence,
> skip accessing video RAM during decompressor stage to
> prevent guest termination.
>
> Serial console output during decompressor stage works as
> boot stage2 #VC handler already supports handling port I/O.
>
> Suggested-by: Thomas Lendacy <thomas.lendacky@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  arch/x86/boot/compressed/misc.c | 6 ++++--
>  arch/x86/boot/compressed/misc.h | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
> index b70e4a21c15f..47b4db200e1f 100644
> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -427,8 +427,10 @@ asmlinkage __visible void *extract_kernel(void *rmode, unsigned char *output)
>  		vidport = 0x3d4;
>  	}
>  
> -	lines = boot_params_ptr->screen_info.orig_video_lines;
> -	cols = boot_params_ptr->screen_info.orig_video_cols;
> +	if (!sev_es_enabled()) {
> +		lines = boot_params_ptr->screen_info.orig_video_lines;
> +		cols = boot_params_ptr->screen_info.orig_video_cols;
> +	}
>  
>  	init_default_io_ops();
>  
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
> index b353a7be380c..3c12ca987554 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -37,6 +37,7 @@
>  #include <asm/desc_defs.h>
>  
>  #include "tdx.h"
> +#include "sev.h"
>  
>  #define BOOT_CTYPE_H
>  #include <linux/acpi.h>

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

