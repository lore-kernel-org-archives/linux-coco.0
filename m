Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA23128C3
	for <linux-coco@lists.linux.dev>; Wed,  5 Nov 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334226; cv=none; b=D3xZcWt4FMvquewGh91zbdOD67raS2V+wXJK+WnCnA0Qpyk/jbfMDPI7j38THkP4EqhRu+KNBcqT5k8RT5O3lmAGe+yWG9ZwlT+AGmQn4+SATe+3f5JXTcs76RaZrBW2prxktBm9qaGhDBDILyaRDdJgUxBijRDuETEYJ4LH4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334226; c=relaxed/simple;
	bh=Kb9qKfyBkt0cnX3TVFiGpX766XyC34xL57bx/gjKjtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAh1tYNMyKyeWFLmafgxh6rKVg3f3jwWXI8XX0JA09lry1hmpB4p01Up6TCPqEdx6Uf4CJ2vWemQbiOGKRT4IZOfoiVTCoKwyXuFh3Nt7Swd7pjDunhnsdDICOd+0QqKGYSNEgONq65Y7fNrpdlU/9Kn4171J9PJdgIs7POLTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM4EZuRP; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM4EZuRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762334225; x=1793870225;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Kb9qKfyBkt0cnX3TVFiGpX766XyC34xL57bx/gjKjtI=;
  b=nM4EZuRPlQAhv/sCxfNVOQmRIY1+wD2tWfk6EdeYsLouJZ41hkt4Ok5i
   plz5aPVVV6Qb/e2cBEgR5QV5ck5trp9/8TqJYaS6vfJ68XuulyPFipNla
   TvCoVliqvC1oDAKSo7RcRrcY12OjoCx8xroBqaXXTU7W4Dv06FPS3iaPN
   nh7lMaZ0j27hSD/DFabY1XfuBisG7UO1EYl1TXEW6yPiev7xlQ0OSyV9h
   FkAKCXlGZ1MnBubTmWT0h2KdBypG59UMGUF2EVEK+FfaXcxPBAYjp0LGS
   y6HguN3rnmHojOeI584eo+jaAzTsIkMAovSAasGKw637hVzqrhPrSbVv+
   Q==;
X-CSE-ConnectionGUID: Ztb/yBzpQsWy6dvWEN5lig==
X-CSE-MsgGUID: 94B6lxnOR6W/k5Pu2g4v8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="87071346"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="87071346"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:17:04 -0800
X-CSE-ConnectionGUID: EA3mCXCERFuXcjirulnv3w==
X-CSE-MsgGUID: UG6W8txsQ1uab85dvGIIbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="187563436"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.49]) ([10.124.240.49])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:17:00 -0800
Message-ID: <6ca6f19e-0bdd-4ad8-aaca-93a1247d2588@intel.com>
Date: Wed, 5 Nov 2025 17:16:56 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] KVM: TDX: Explicitly set user-return MSRs that
 *may* be clobbered by the TDX-Module
To: Yan Zhao <yan.y.zhao@intel.com>, Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov"
 <kas@kernel.org>, kvm@vger.kernel.org, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>
References: <20251030191528.3380553-1-seanjc@google.com>
 <20251030191528.3380553-2-seanjc@google.com>
 <aQhJol0CvT6bNCJQ@yzhao56-desk.sh.intel.com>
 <aQmmBadeFp/7CDmH@yzhao56-desk.sh.intel.com>
 <969d1b3a-2a82-4ff1-85c5-705c102f0f8b@intel.com>
 <aQnH3EmN97cAKDEO@yzhao56-desk.sh.intel.com> <aQo-KhJ9nb0MMAy4@google.com>
 <aQqt2s/Xv4jtjFFE@yzhao56-desk.sh.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <aQqt2s/Xv4jtjFFE@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/2025 9:52 AM, Yan Zhao wrote:
> On Tue, Nov 04, 2025 at 09:55:54AM -0800, Sean Christopherson wrote:
>> On Tue, Nov 04, 2025, Yan Zhao wrote:
>>> On Tue, Nov 04, 2025 at 04:40:44PM +0800, Xiaoyao Li wrote:
>>>> On 11/4/2025 3:06 PM, Yan Zhao wrote:
>>>>> Another nit:
>>>>> Remove the tdx_user_return_msr_update_cache() in the comment of __tdx_bringup().
>>>>>
>>>>> Or could we just invoke tdx_user_return_msr_update_cache() in
>>>>> tdx_prepare_switch_to_guest()?
>>>>
>>>> No. It lacks the WRMSR operation to update the hardware value, which is the
>>>> key of this patch.
>>> As [1], I don't think the WRMSR operation to update the hardware value is
>>> necessary. The value will be updated to guest value soon any way if
>>> tdh_vp_enter() succeeds, or the hardware value remains to be the host value or
>>> the default value.
>>
>> As explained in the original thread:
>>
>>   : > If the MSR's do not get clobbered, does it matter whether or not they get
>>   : > restored.
>>   :
>>   : It matters because KVM needs to know the actual value in hardware.  If KVM thinks
>>   : an MSR is 'X', but it's actually 'Y', then KVM could fail to write the correct
>>   : value into hardware when returning to userspace and/or when running a different
>>   : vCPU.
>>
>> I.e. updating the cache effectively corrupts state if the TDX-Module doesn't
>> clobber MSRs as expected, i.e. if the current value is preserved in hardware.
> I'm not against this patch. But I think the above explanation is not that
> convincing, (or somewhat confusing).
> 
> 
> By "if the TDX-Module doesn't clobber MSRs as expected",
> - if it occurs due to tdh_vp_enter() failure, I think it's fine.
>    Though KVM thinks the MSR is 'X', the actual value in hardware should be
>    either 'Y' (the host value) or 'X' (the expected clobbered value).
>    It's benign to preserving value 'Y', no?

For example, after tdh_vp_enter() failure, the state becomes

     .curr == 'X'
     hardware == 'Y'

and the TD vcpu thread is preempted and the pcpu is scheduled to run 
another VM's vcpu, which is a normal VMX vcpu and it happens to have the 
MSR value of 'X'. So in

   vmx_prepare_switch_to_guest()
     -> kvm_set_user_return_msr()

it will skip the WRMSR because written_value == .curr == 'X', but the 
hardware value is 'Y'. Then KVM fails to load the expected value 'X' for 
the VMX vcpu.

> - if it occurs due to TDX module bugs, e.g., if after a successful
>    tdh_vp_enter() and VM exits, the TDX module clobbers the MSR to 'Z', while
>    the host value for the MSR is 'Y' and KVM thinks the actual value is 'X'.
>    Then the hardware state will be incorrect after returning to userspace if
>    'X' == 'Y'. But this patch can't guard against this condition as well, right?
> 
> 
>>> But I think invoking tdx_user_return_msr_update_cache() in
>>> tdx_prepare_switch_to_guest() is better than in
>>> tdx_prepare_switch_to_host().
>>>
>>> [1] https://lore.kernel.org/kvm/aQhJol0CvT6bNCJQ@yzhao56-desk.sh.intel.com/
>>>   

