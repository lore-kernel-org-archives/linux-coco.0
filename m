Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A1A2F12BE
	for <linux-coco@lists.linux.dev>; Wed, 17 Dec 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765968985; cv=none; b=nar6ACOJjuZ32JB/tkYdYi/gcH/sL3aHPd7GnLEjRXZ/SFDHlCU0TAfGHbPrUS1kDVUjb/L09DGuH+Eysa3wEFhEZmE6asq/wYrDMo51n3pflEOojIOQ7y1IMDMPb4rY9idI7zZLG0DAcj5j2OQmKgEYH3owFtMezA7yed6XMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765968985; c=relaxed/simple;
	bh=uNRUAHpBQSN5pxG1CFlCRga4ecspucD+OE7V7hfXFZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYRz/x8Xg4gbf04+EtyPm26/WdXNshsGebJ+U+Z+mKP0aHhRv+vJoqfRoKCU04un96QAbUe3rXqYQ9h5rSt4K1bRyCw7BEdELiOeEI/1bLrFVUvIRBJ2T7wfbh+vB/LpcMoHNXxGg6EOegniPSXqYo80BIdOD575zSKEPfQ9HtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MR73Y0Qt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MR73Y0Qt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765968983; x=1797504983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uNRUAHpBQSN5pxG1CFlCRga4ecspucD+OE7V7hfXFZ4=;
  b=MR73Y0QtQDObswadQxQSPvv6CRLXmwiQuTLXb5xkFXVErkbEgZwZoYwo
   umrS7MCj0atExgcoVsf6bx1UchrditKtXlYwzbJsIh/8zYZkpYyMJUuzb
   LnSzPqWKRno5Puozmw5tpJNQ5MJE9pUN/8D20+idaIguLAdmMjwSuWnnN
   Sm2+i7pZWjoMlZ7t2548Toe3ldIpuzrfjvDKY4ZJbRZ5Z27XJXmTjKaos
   +NpiSCgbgkc/ldw4oGGvepCsePH1QtfZaaLqP4j3TcV/J3tQXAL65CoAD
   xxlJXG38oXq3uS0KHkD9Uiw74MCq6z1WdWLcr6SXyCEtl33LGZcl1psNX
   g==;
X-CSE-ConnectionGUID: 7fmwaJKTSlmgIebEGvWxXg==
X-CSE-MsgGUID: lW902C95Q8WgXtSPpoQOsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71534676"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="71534676"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 02:56:22 -0800
X-CSE-ConnectionGUID: VQ8znSWiRvOeqbB9pCmq6g==
X-CSE-MsgGUID: yTD71UjqRheWTxKL0cxqyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="221656138"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.173]) ([10.124.240.173])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 02:56:18 -0800
Message-ID: <524aac73-7545-4f35-8862-c21f618d731c@intel.com>
Date: Wed, 17 Dec 2025 18:56:14 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/split_lock: Don't try to handle user split lock
 in TDX guest
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 Reinette Chatre <reinette.chatre@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>, chao.p.peng@intel.com,
 Kiryl Shutsemau <kas@kernel.org>
References: <20251126100205.1729391-1-xiaoyao.li@intel.com>
 <20251126100205.1729391-2-xiaoyao.li@intel.com>
 <lvobu4gpfsjg63syubgy2jwcja72folflrst7bu2eqv6rhaqre@ttbkykphu32f>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <lvobu4gpfsjg63syubgy2jwcja72folflrst7bu2eqv6rhaqre@ttbkykphu32f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2025 7:25 PM, Kiryl Shutsemau wrote:
> On Wed, Nov 26, 2025 at 06:02:03PM +0800, Xiaoyao Li wrote:
>> When the host enables split lock detection feature, the split lock from
>> guests (normal or TDX) triggers #AC. The #AC caused by split lock access
>> within a normal guest triggers a VM Exit and is handled in the host.
>> The #AC caused by split lock access within a TDX guest does not trigger
>> a VM Exit and instead it's delivered to the guest self.
>>
>> The default "warning" mode of handling split lock depends on being able
>> to temporarily disable detection to recover from the split lock event.
>> But the MSR that disables detection is not accessible to a guest.
>>
>> This means that TDX guests today can not disable the feature or use
>> the "warning" mode (which is the default). But, they can use the "fatal"
>> mode.
>>
>> Force TDX guests to use the "fatal" mode.
>>
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>>   arch/x86/kernel/cpu/bus_lock.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kernel/cpu/bus_lock.c b/arch/x86/kernel/cpu/bus_lock.c
>> index 981f8b1f0792..f278e4ea3dd4 100644
>> --- a/arch/x86/kernel/cpu/bus_lock.c
>> +++ b/arch/x86/kernel/cpu/bus_lock.c
>> @@ -315,9 +315,24 @@ void bus_lock_init(void)
>>   	wrmsrq(MSR_IA32_DEBUGCTLMSR, val);
>>   }
>>   
>> +static bool split_lock_fatal(void)
>> +{
>> +	if (sld_state == sld_fatal)
>> +		return true;
>> +
>> +	/*
>> +	 * TDX guests can not disable split lock detection.
>> +	 * Force them into the fatal behavior.
>> +	 */
>> +	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   bool handle_user_split_lock(struct pt_regs *regs, long error_code)
>>   {
>> -	if ((regs->flags & X86_EFLAGS_AC) || sld_state == sld_fatal)
>> +	if ((regs->flags & X86_EFLAGS_AC) || split_lock_fatal())
>>   		return false;
> 
> Maybe it would be cleaner to make it conditional on
> cpu_model_supports_sld instead of special-casing TDX guest?
> 
> #AC on any platfrom when we didn't asked for it suppose to be fatal, no?

Hi Dave,

Do you like this suggestion from Kiryl? If you don't object it, I will 
do it in v2.
