Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792981967;
	b=5mtGfG8+1p7PlLZUYto3XzSmNVJWo+Tj7QJHKMjmFEN/RMe32iht9L4dtZ3yrQbXrzmy
	 Rl1BHr3ft2OuIraO3LH6fqMRSwh98aJL0OdfyjHPI2iIGxuz9KSyNzcIv2u8AijWCCzac
	 Bylzq9yMiCtk+0ykrtnlUU4EZNk9v+pJoPYbV9BDBZAFwvnv9HwFWryNNB8qAIPt40z4S
	 iCisLbmxaAAY+tz6Iwhdd7KKc3c9Fm301NEiR+kb7xsZ3REFMyvTyooNEE0JuqJrwep38
	 alBaZJmHbjU9X+VlDt33sE7KBtPluWlrCkCth21QtefffOkJlj8tsZa5zBd7wneg4/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792981967;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/aw56ycJbva4iewUu3ULZhMesg41oSMRLnZr7JPxvZM=;
	b=XEb3jEaqYX11u7/K8tB5ArYM+RWmsXKt4baiodEerRw3plFzvwcD3WUKeebC0HO62QXW
	 5Mhytje4paRYYH/Ef9tWJruyTrArFdbt0AYOtgRDZ5hVF3550Mz1NgBXcEH64lMB0sNTO
	 2ECJwJjKE4UJeyzSMtG1irKp8ZBYfJLUMh/pAurYdnt+3vtv+l276F25INGBy3lOjTLre
	 9tFSZsowLh58xlGU+lXkokoCDJTah/hAT7Go2sS0EVA7NLxH+hLmzEXroKw4s4Cf80dnn
	 yYW+txi/Tyw1W6Hq7yu5khDxreECuWaHNHl8T/IYrgCpZ569fKY8riHHDrpbHrVts6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i23uQDQr;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3631606A31A
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 02:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3631606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i23uQDQr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792981965; x=1824517965;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qGZwrWqH8/+Mm2EaCFXKcO2XS43UZa/XeZ7z3gWnD54=;
  b=i23uQDQrS93DCxjW0p6KJ0cRtEFur3FDxiUCCKcjfJ9omLMaZhOtn8VF
   5To4wN3rOOjGcF9MR52TFf7AaqDQSihBZNEEJuBV2ftIawXVQO7N8Zxa/
   te5ajT6yOUfuqoFbCDiQ/NMSLTf0NXk0XMvegYr+k8HYDRLT1qWlRu5qX
   REq0i1fTiHCUEaALyUuW2kFK/oCm2w4807C1oWFBt1rVXbqD5V8aNDAlP
   TAUxI6KHrQwbg5dwGRrS0K6w28rgiq2XJAL+6qd4yqFbH6LWvIA+BbVHp
   CJF3/Dftbr5Yy1xlWLFzdMjDpC/bD51kN2W5FfduQA/kDN09LkprMU4it
   A==;
X-CSE-ConnectionGUID: PlopCtymSRCpsLQwyUqydg==
X-CSE-MsgGUID: Nm5ZczV0RISEqJ6Sm7NbXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1526052"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1526052"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:32:45 -0700
X-CSE-ConnectionGUID: xkzVrSLFTG+xJudfT0EovA==
X-CSE-MsgGUID: hR8bo6fqS+SKnfvEqMaggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4198023"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 19:32:39 -0700
Message-ID: <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
Date: Mon, 26 Oct 2026 10:32:36 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
 "Hansen, Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal L"
 <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/2026 10:16 AM, Duan, Zhenzhong wrote:
>>> +
>>>   static struct pci_tsm *tdx_devsec_lock(struct tsm_dev *tsm_dev, struct
>> pci_dev *pdev)
>>>   {
>>> +	u8 state;
>>>   	int ret;
>>>
>>>   	struct tdx_devsec *tdevsec __free(kfree) = kzalloc(sizeof(*tdevsec),
>> GFP_KERNEL);
>>> @@ -174,6 +233,19 @@ static struct pci_tsm *tdx_devsec_lock(struct
>> tsm_dev *tsm_dev, struct pci_dev *
>>>   	if (!tdx_is_dev_teeio_support(tdevsec))
>>>   		return ERR_PTR(-EOPNOTSUPP);
>>>
>>> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) =
>> tdx_tdi_bind_dev(tdevsec);
>>> +	if (IS_ERR(tdevsec_bind))
>>> +		return ERR_CAST(tdevsec_bind);
>>> +
>>> +	ret = tdx_tdi_read_state(tdevsec, &state);
>>> +	if (ret)
>>> +		return ERR_PTR(ret);
>>> +
>>> +	if (state != TDI_STATE_CONFIG_LOCKED)
>>> +		return ERR_PTR(-EIO);
>>> +
>>> +	retain_and_null_ptr(tdevsec_bind);
>>> +
>>>   	return &no_free_ptr(tdevsec)->pci.base_tsm;
>>>   }
>>>
>>> @@ -181,6 +253,9 @@ static void tdx_devsec_unlock(struct pci_tsm *tsm)
>>>   {
>>>   	struct tdx_devsec *tdevsec = to_tdx_devsec(tsm);
>>>
>>> +	if (WARN_ON(tdx_tdi_unbind_dev(tdevsec)))
>>> +		return;
>> <Thinking out loud>
>>
>> So unlock involves calling TDCM_UNBIND which in turn might fail for any
>> number of reasons and yet we have no way of communicating that. So after
>> an unlock a TD might want to rebind and issue bind on a device which is
>> already bound because prior unbind failed. Is this something we should
>> be worried about ?
> I completely agree with your point here.
> We need pci_tsm_ops::unlock() in TSM framework to return an error status
> (e.g., int) so that failures in the underlying hardware-level unbind can
> be bubbled up to the caller rather than silently ignored.

please remember raising this when folks are discussing generic guest TSM
framework series.

Btw, for TDX specific tdx_devsec_unlock(), the WARN_ON() is not proper IMHO.
the failure can happen for various reasons, and the WARN can be treated as fatal
when panic_on_warn is true. I think pr_warn_ratelimit() would suffice?

And the direct return after failure happens seems also problematic. E.g., it
leaks tdevsec. After later patches, it seems to leak more.
