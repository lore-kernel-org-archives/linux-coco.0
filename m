Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F13301026
	for <linux-coco@lists.linux.dev>; Mon,  2 Feb 2026 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770014990; cv=none; b=iRfepZIVTdyd7C/P79YQUt67r/MMwzhOhfQ291dWAz11Ts4uNfv0ySTai0xXqbLQSnT/54Ts5XnhNBChBxPon2JQe/cKUMjiO4dNVdOzN24BX+4qecSmQqbnPS+H3J9Dy6/My4VXIor9ZontVRkJNekaTUoK8MQi8QRBds/zu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770014990; c=relaxed/simple;
	bh=p6wHUv3nGRgjxVKeJCG4f/1CwrUZUt88QzBgtgugBAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZCKpKZLtsiE0zi9aX6KyMR27+NfJkbfub42UStzsLRnS2Gqv9mdzB8gA7PCMNupRGWjI+jwZIgLENUIBbKhyTEMuyAI+mf0XRViMVCJEsMmn/F21f71B18sxjoA1w2cBAs2ACjeb71TPg3xu9rhMD0JVH4e9/YlVFkz/OLBxFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSZQurlV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSZQurlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770014988; x=1801550988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p6wHUv3nGRgjxVKeJCG4f/1CwrUZUt88QzBgtgugBAY=;
  b=KSZQurlVBn/nmp01OKCEXEtvNAxaFfJ8cj6X4s6bcqUMci6vZUnu5O4a
   +QbJUTsvFYCI0CvQq2ifKjNov8s4470+3XjH0XOFZz4Q0mPfyhyJ1JHnV
   OQI0F6WA+gi7DBHSXIFGt60DQKWy3VGwWEgZ0+1jcyrhchOu4S9OaoaiI
   rPzOuzamtcsLyGsJKAhERUhYwyioSGwapjZKUp7qoHVW9hc4GZrzni+Sk
   R8O81fIpEJlmgWoS2Idaf9Ju1MfWBEAX/3lzJ0Ze5r6HQBmihLXqQ2BKo
   e0latkKnX9HEM79plI7+klGla9JddsdlRQzpu/IyieBQ1KPSLRfL3FQdU
   A==;
X-CSE-ConnectionGUID: Z9X/TJpyTPG8tnla3DSeOg==
X-CSE-MsgGUID: m7JVL64rQ4ee1VoYJKCXTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71332097"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="71332097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 22:49:48 -0800
X-CSE-ConnectionGUID: REd2b/jSRJKiBRQDU8Pg1w==
X-CSE-MsgGUID: Xv7GgVZ0TTaoscg4z1UF8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="213537167"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 01 Feb 2026 22:49:42 -0800
Date: Mon, 2 Feb 2026 14:31:18 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
	ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
	sagis@google.com, vannapurve@google.com, paulmck@kernel.org,
	nik.borisov@suse.com, zhenzhong.duan@intel.com, seanjc@google.com,
	rick.p.edgecombe@intel.com, kas@kernel.org,
	dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
	Farrah Chen <farrah.chen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 16/26] x86/virt/seamldr: Shut down the current TDX
 module
Message-ID: <aYBEtqEeUBThuaJr@yilunxu-OptiPlex-7050>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-17-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123145645.90444-17-chao.gao@intel.com>

> +static int get_tdx_sys_info_handoff(struct tdx_sys_info_handoff *sysinfo_handoff)
> +{
> +	int ret = 0;
> +	u64 val;
> +
> +	if (tdx_supports_runtime_update(&tdx_sysinfo) &&
> +	    !(ret = read_sys_metadata_field(0x8900000100000000, &val)))
> +		sysinfo_handoff->module_hv = val;
> +
> +	return ret;
> +}
> +
>  static int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
>  {
>  	int ret = 0;
> @@ -115,6 +127,7 @@ static int get_tdx_sys_info(struct tdx_sys_info *sysinfo)
>  	ret = ret ?: get_tdx_sys_info_tdmr(&sysinfo->tdmr);
>  	ret = ret ?: get_tdx_sys_info_td_ctrl(&sysinfo->td_ctrl);
>  	ret = ret ?: get_tdx_sys_info_td_conf(&sysinfo->td_conf);
> +	ret = ret ?: get_tdx_sys_info_handoff(&sysinfo->handoff);

Do all fields in sysinfo_handoff optional or just module_hv, if the
former, is it better:

	if (tdx_supports_runtime_update(&tdx_sysinfo)
		ret = ret ?: get_tdx_sys_info_handoff(&sysinfo->handoff);

>  
>  	return ret;
>  }
> -- 
> 2.47.3
> 
