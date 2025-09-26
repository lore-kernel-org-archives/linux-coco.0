Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D4826E6EA
	for <linux-coco@lists.linux.dev>; Fri, 26 Sep 2025 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876093; cv=none; b=SSbBzEJPUE+lzMCyDMHZtwUvLCIwmK76nPcTPoiU3XhZfUG/ztq85ZjqDoa6PQaaXj/QSzJcNU2ZoM1Yq/2K2uL3S2be+wN51Fhhzsq3DyrQ/oLJ2WCV3ySnwxPfg2wd9kWhxIJqftkZtg9wC5v33/7BsXBpHZ1A9wUGK1wk9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876093; c=relaxed/simple;
	bh=xROXHT4VoPRRKHqoPg/tMmdBbOqnhdU8Px917+aIcKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyBtRW4/4DmqRIuHIp63LgxAzmRidgVmAK+SgQ/IElGf9HwhlNOISQhfGUtJ/MUucX/QDB1i/kuXGtBXqOMGgRkg836MuY2NfQw+FItmLHbcvXjzcepLIH0gJoWQvIugb852k+8c4o+UJ4RuyY2/HVk8IhbqPLrbHtrd4KOIYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRuPR6cj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRuPR6cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758876092; x=1790412092;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xROXHT4VoPRRKHqoPg/tMmdBbOqnhdU8Px917+aIcKo=;
  b=MRuPR6cj0gMRYAOiofscjyPkRs2ZIZgyGZxG33Aty67o+Tu7dBF3Mb2D
   Ql32S33+hhzC+SPQcxjyVcZNAWbbarRCqwT00rBJ8pTm3fR3mexf5NULz
   Kk34CS5MTiOlX+B7wsLTuRjlrWpzz0/MAcpBITWtEssHc6Sf5nloAIX95
   RyzeilCVbWXsC5qz0sRg3qDwMsaPJ5WK90+F1W8sKqRfKZ1NQ269Dgeq5
   KnloXU3Lsy9psapI8KuyvEvSiDe6AU4ihdPcvoQhXIFUshHEVLXKDgjn/
   vcY6tzJusalZHXfE/CsA6Ae32bMdno2KTv6tcShZLCH9dfVrzB0pTCDVQ
   Q==;
X-CSE-ConnectionGUID: lHuB5PF5Rv6l8mFOs1H2fA==
X-CSE-MsgGUID: eODI9tJWSTmxbaDH02aqqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61126303"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="61126303"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 01:41:31 -0700
X-CSE-ConnectionGUID: 11PsIL0ARiap/71JCpSvUg==
X-CSE-MsgGUID: q0Zoyy8RQP26KP5BrBw6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="208313518"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.238.14]) ([10.124.238.14])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 01:41:26 -0700
Message-ID: <ba3de7ec-56bd-4e24-a9d3-5d272afe4b0f@intel.com>
Date: Fri, 26 Sep 2025 16:41:23 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/16] x86/virt/tdx: Allocate page bitmap for Dynamic
 PAMT
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, kas@kernel.org,
 bp@alien8.de, chao.gao@intel.com, dave.hansen@linux.intel.com,
 isaku.yamahata@intel.com, kai.huang@intel.com, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, mingo@redhat.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@linutronix.de, x86@kernel.org,
 yan.y.zhao@intel.com, vannapurve@google.com,
 Dan Williams <dan.j.williams@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
 <20250918232224.2202592-5-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250918232224.2202592-5-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+ Dan,

On 9/19/2025 7:22 AM, Rick Edgecombe wrote:
> diff --git a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> index 13ad2663488b..683925bcc9eb 100644
> --- a/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> +++ b/arch/x86/virt/vmx/tdx/tdx_global_metadata.c
> @@ -33,6 +33,9 @@ static int get_tdx_sys_info_tdmr(struct tdx_sys_info_tdmr *sysinfo_tdmr)
>   		sysinfo_tdmr->pamt_2m_entry_size = val;
>   	if (!ret && !(ret = read_sys_metadata_field(0x9100000100000012, &val)))
>   		sysinfo_tdmr->pamt_1g_entry_size = val;
> +	if (!ret && tdx_supports_dynamic_pamt(&tdx_sysinfo) &&
> +	    !(ret = read_sys_metadata_field(0x9100000100000013, &val)))
> +		sysinfo_tdmr->pamt_page_bitmap_entry_bits = val;
>   
>   	return ret;
>   }

It looks like the update is not produced by the script[1], but manually, 
right?

Looking at the history

   git log arch/x86/virt/vmx/tdx/tdx_global_metadata.c

It looks the expectation is always adding new fields by updating the 
script[1] and running it with the latest 'tdx_global_metadata.c'.

Dan Williams also expressed internally that we should have checked the 
script[1] into the kernel. I agree with him and it's never too late to 
do it.

[1]https://lore.kernel.org/kvm/0853b155ec9aac09c594caa60914ed6ea4dc0a71.camel@intel.com/
