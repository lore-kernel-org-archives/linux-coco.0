Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFB301703
	for <linux-coco@lists.linux.dev>; Mon, 29 Sep 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146294; cv=none; b=uN4srbgNU0qVf7mNKZP8rLALMO8eEMV9edguX9MwZOYdSCFnUM1pFIJoF7WXyeVwBGVn2k+PyhnzYP0uhDNq/vsSQF2wf5LfNJ96l7zu9TxVzBlgUWT/v5SKmH8g8B32G1xAC00SJL9Y4QyH+Sxkhu2aPvH0HYc1WZJhVzUkPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146294; c=relaxed/simple;
	bh=izGasfRnEi7HbQteCBOxsheAwEE/2zFxEJFimTPnAsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GOMqSNC59PLkxJUIYlyKM5N/7w0W+vgQy0V/TNBBepcllCSHbAplwIZawbL2voespphcfd9UCk3uW6A9tFS5PUFwni1uLR6Gx7KPih696JJPfkpZYa43TGEUUc6ucR+GUPxSRJ4nkAZ+3DGTb0K723+SJ+4C/bqOAW00mJ2JUqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOwts9l8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOwts9l8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759146293; x=1790682293;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=izGasfRnEi7HbQteCBOxsheAwEE/2zFxEJFimTPnAsE=;
  b=YOwts9l8p1MZ+18Q4DZRWj1HIxcfbyAGGK6hM3IKMjpeplQtrKjaq7t6
   ktr9XXuhTV5V6jm05DHljTKauiM0US+E5fa1g8SBbpOa6SYs8qmo3Yf5Q
   LSXuVYtfIchL65UssUppN97lmd3fJCInYXengw3UZThfuuBWibb3A+OKv
   JVRDs925hSXzlTp+3ZijrHefc1VKOeXA9y9vJkItHmV0R1YeCJNrZ/147
   c+Idngns5L6WLFF46H0/wYj+BRj2V7kG7dqMGjXt7bC4TI4wRcX7ovcfj
   uv3JroduvQlOjmiFQ9pqcdaWMUlyMFbwRgH2lDT0r2BVwPblleVF2Qd8Z
   g==;
X-CSE-ConnectionGUID: KW3HVcdxSyOmGbuLKP/pvg==
X-CSE-MsgGUID: uiL+ZhadTDOcRKT7CIX01Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="79031485"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="79031485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 04:44:53 -0700
X-CSE-ConnectionGUID: cVKjwUhXQSifjHBb6j3iyg==
X-CSE-MsgGUID: VQimLx5OQnip03a65w3pMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="178274556"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.238.14]) ([10.124.238.14])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 04:44:48 -0700
Message-ID: <d5bfd8bf-2d28-4e79-90c8-bdca581e8000@intel.com>
Date: Mon, 29 Sep 2025 19:44:45 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] x86/virt/tdx: Simplify tdmr_get_pamt_sz()
To: "Huang, Kai" <kai.huang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Yamahata, Isaku" <isaku.yamahata@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "Annapurve, Vishal" <vannapurve@google.com>, "Gao, Chao"
 <chao.gao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>
References: <20250918232224.2202592-1-rick.p.edgecombe@intel.com>
 <20250918232224.2202592-4-rick.p.edgecombe@intel.com>
 <1c29a3fdbc608d597a29cd5a92f40901792a8d7c.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <1c29a3fdbc608d597a29cd5a92f40901792a8d7c.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/2025 8:50 AM, Huang, Kai wrote:
>>   static unsigned long tdmr_get_pamt_sz(struct tdmr_info *tdmr, int pgsz,
>> -				      u16 pamt_entry_size)
>> +				      u16 pamt_entry_size[])
> AFAICT you don't need pass the whole 'pamt_entry_size[]' array, passing
> the correct pamt_entry_size should be enough.

While we are at it, how about just moving the definition of 
pamt_entry_size[] from construct_tdmrs() to here?
