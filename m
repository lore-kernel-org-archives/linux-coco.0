Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB8253F39
	for <linux-coco@lists.linux.dev>; Fri, 21 Nov 2025 08:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763714510; cv=none; b=Oi7EC6992sqx3/OtfKiaa11zMbPZJbQjqwIXIPCt1mzvtNxn+sqn+gR7+urcRNxDX6eyTEWdR5XhRhz8fUcYnEmHuNi5UJ7jETlGNmUQlR0VRJ7pItpbVtPew293dy6A3ZMWpdPEnOcnCYwE0GuRrYLCnjp0LgRjvmphdexl0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763714510; c=relaxed/simple;
	bh=AHJ5lm9ErUYu5c/WZuKVm/ohU45i2CfP1t52hdi2j5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIrp9VV+CaS1UNlGeLDheGyM51utodtxsfjFK6oqdN7MvN9uTuuNozIZ8n5AIu1rF+xc6/x6N4gi1nEvFXS82PDkIzUX1Gq4JmM07s7LgIjaA+BraLk3OyJBjXn8uUmoMYttmKu2LM1DQP/+FCDwzHmSsfr9oL8Fz2Xbs8l0bhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUs0ayEA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUs0ayEA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763714508; x=1795250508;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AHJ5lm9ErUYu5c/WZuKVm/ohU45i2CfP1t52hdi2j5Q=;
  b=WUs0ayEAoq5xikdZOERt2z1m2fMa6B34dp3NdhtVhXcA738EhMP2iEAu
   HjmsM0wJZO+p9WHGgcxZNwEN14HusNaq0TAiuJ5AmcJihGlJ7uBRP790j
   KezO6k8uqRB9s+NKNG7DI4wUpV+pgxb6dI4hGS5EvXv+vvuDC7oaN2+mu
   M5Iq8UjPI8IgCGy89pbtiiQcN8+HXKY+iHwCc/FFdbSoQPu5FuCWzYFss
   A1bLSffkbMoL5DSgvSVj3vXrCIoc2Hs7MfULAGk1NGr6kjIDCXuqaAS7B
   liPPh+uWfojLTqzCcULH40DZccu1PmYKlD/7ZxxTiuQn1o8O8QNAg2+cT
   A==;
X-CSE-ConnectionGUID: usgW1n68RQSARd/M7mChDQ==
X-CSE-MsgGUID: WmyZ+dBeTkO2ldG8GtvkXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65681846"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65681846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:41:48 -0800
X-CSE-ConnectionGUID: nhbkT4ixQteB80zjaRXFbQ==
X-CSE-MsgGUID: dfHDMKpvSbml6rc4WhAktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190847688"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.241.55]) ([10.124.241.55])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 00:41:43 -0800
Message-ID: <fe113d92-14cd-4289-bc53-0ba7adc494fb@linux.intel.com>
Date: Fri, 21 Nov 2025 16:41:40 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kas@kernel.org>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-6-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-6-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:52 AM, Chao Gao wrote:
[...]
>   
> +config INTEL_TDX_MODULE_UPDATE
> +	bool "Intel TDX module runtime update"
> +	depends on TDX_HOST_SERVICES
> +	help
> +	  This enables the kernel to support TDX module runtime update. This
> +	  allows the admin to update the TDX module to the same or any newer

any newer -> any compatible newer ?

> +	  version without the need to terminate running TDX guests.
> +
> +	  If unsure, say N.
> +
>
