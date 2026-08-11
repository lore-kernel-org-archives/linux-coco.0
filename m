Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B46310645
	for <linux-coco@lists.linux.dev>; Tue, 11 Aug 2026 01:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786411959; cv=none; b=W5w64rSTsBnu4dQQ9TzyFx9X0Rj1AwfK+Ss026qNloSiJ4azeb25hs9rrorkehs5x4KOEDCmrqBW1gMXPXkF+dNhaBqps1z1d2F8zBeeyAL5SsesvbGg/N6ZCJGXkubkXiJLNfhZi6Jg3vdvLytXDR2tca1ywCtimHw8ZrwIUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786411959; c=relaxed/simple;
	bh=9VfZxI5HqTkjf2SFxu7A1Vrk99nq5OGzR3F162QwAQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piw8iDYwLE2+U2MANI5K9l9GK97k/eSGY49c+3utddTFQDiLbsz/WZBXW8ahYsVjocR9OqowZn88YjY1Ub0VxANdPA65rc+JA6Itq9DDgytQcvH1uv5Gw9Rdd1uboQOjv6k7dH7ltElJ8vk+BIaXKGBPWZU4r9zZEX6Jwk6nIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpSyzzVG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpSyzzVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786411951; x=1817947951;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9VfZxI5HqTkjf2SFxu7A1Vrk99nq5OGzR3F162QwAQA=;
  b=SpSyzzVG3btPvVMrDyevUS1RsNdqAKVl7yGH01APqIY9ORZp0oK/hwQW
   VN1MkNhQqwXEkstO7VpyLOGZSLScEm+y1EUKbBU715+QEuxsUmpF0CYgQ
   wLByATqwNgUjr3irPTkGJfcv/GKxVRw/6c4nN1x0JYJ1h0ejLHxEVneOR
   MDs0zkevclfk0KYIGE0QZGSLyxTIVrpxKeohxEhKwH9PRd0ae+E2OCAzE
   jbPj5OybGSrcM370H2DLiPI/uC/ITt/ZVn524BGmit3WpV8H6Iv2a73ly
   5t5GNIrY2a6S0mHKVQ6S61bJwMFsm7yNvV8ryDaYENbYT3LRQrRFQxf9S
   Q==;
X-CSE-ConnectionGUID: bPc+tTZjQ8y4obeLzg/Y7Q==
X-CSE-MsgGUID: sEvoAHsSR3et7DO8pNRY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87056644"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="87056644"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 18:32:29 -0700
X-CSE-ConnectionGUID: yCVAc4e9QGa53SShOaCPaQ==
X-CSE-MsgGUID: PkfEnD57Qvasy+nHq2wEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="259890058"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.248]) ([10.124.240.248])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 18:32:26 -0700
Message-ID: <6bb1328d-e995-4ad7-9744-3ab01d2ae591@intel.com>
Date: Tue, 11 Aug 2026 09:32:24 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] KVM: TDX: Fix the exit reason handling
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "kas@kernel.org" <kas@kernel.org>,
 "nik.borisov@suse.com" <nik.borisov@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260810112200.2326727-1-xiaoyao.li@intel.com>
 <20260810112200.2326727-3-xiaoyao.li@intel.com>
 <5dfed336a46329ba39922dcb3a8723116dae9ae4.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <5dfed336a46329ba39922dcb3a8723116dae9ae4.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/2026 8:38 AM, Edgecombe, Rick P wrote:
> On Mon, 2026-08-10 at 19:21 +0800, Xiaoyao Li wrote:
>> Get and check the exit reason from the low 16 bits of vp_enter_ret, and
>> store the synthesized/transformed exit reason in the "basic" field.
>>
>> Some bits in the upper 16 bits in the exit reason have their own meanings
>> and they might be 1.  When handling the exit reason, only do handling on
>> the lower 16 bits and keep the upper 16 bits unchanged.  This change
>> also helps remove the additional check in tdx_failed_vmentry().
>>
>> Note, due to the synthesized invalid exit reason, -1, is changed to
>> assigned to the "basic" field, adjust the checking in tdx_get_exit_info()
>> accordingly.
>>
>> Fixes: 095b71a03f49 ("KVM: TDX: Add a place holder to handle TDX VM exit")
>> Fixes: c42856af8f70 ("KVM: TDX: Add a place holder for handler of TDX hypercalls (TDG.VP.VMCALL)")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
>> Changes in v2:
>>   - new patch
>> ---
>>   arch/x86/kvm/vmx/tdx.c | 35 ++++++++++++++++++++++-------------
>>   1 file changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> index 7338ac0af693..a89885d550c9 100644
>> --- a/arch/x86/kvm/vmx/tdx.c
>> +++ b/arch/x86/kvm/vmx/tdx.c
>> @@ -921,10 +921,10 @@ static __always_inline u32 tdcall_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
>>   	return EXIT_REASON_TDCALL;
>>   }
>>   
>> -static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
>> +static __always_inline union vmx_exit_reason tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
>>   {
>>   	struct vcpu_tdx *tdx = to_tdx(vcpu);
>> -	u32 exit_reason;
>> +	union vmx_exit_reason exit_reason;
>>   
>>   	switch (tdx->vp_enter_ret & TDX_SEAMCALL_STATUS_MASK) {
>>   	case TDX_SUCCESS:
>> @@ -934,23 +934,33 @@ static __always_inline u32 tdx_to_vmx_exit_reason(struct kvm_vcpu *vcpu)
>>   	case TDX_NON_RECOVERABLE_TD_WRONG_APIC_MODE:
>>   		break;
>>   	default:
>> -		return -1u;
>> +		/*
>> +		 * Synthesize an invalid bogus Exit Reason, as the TDX-Module
> 
> I think this blurb came from Sean, but can we standardize on "TDX module"? The
> code currently uses "TDX module" and "TDX-module" and "TDX-module" used much
> less. I also don't see why it needs the "-".

Will change it to "TDX module".

>> +		 * never attempted to run the vCPU, i.e. the Exit Reason is
>> +		 * undefined, but this is NOT a failed VM-Enter.
>> +		 */
>> +		return (union vmx_exit_reason) {
>> +			.basic = -1,
>> +		};
>>   	}
>>   
>> -	exit_reason = tdx->vp_enter_ret;
>> +	exit_reason.full = (u32)tdx->vp_enter_ret;
>>   
>> -	switch (exit_reason) {
>> +	switch (exit_reason.basic) {
>>   	case EXIT_REASON_TDCALL:
>>   		if (tdvmcall_exit_type(vcpu))
>> -			return EXIT_REASON_VMCALL;
>> -
>> -		return tdcall_to_vmx_exit_reason(vcpu);
>> +			exit_reason.basic = EXIT_REASON_VMCALL;
>> +		else
>> +			exit_reason.basic = tdcall_to_vmx_exit_reason(vcpu);
>> +		break;
>>   	case EXIT_REASON_EPT_MISCONFIG:
>>   		/*
>>   		 * Defer KVM_BUG_ON() until tdx_handle_exit() because this is in
>>   		 * non-instrumentable code with interrupts disabled.
>>   		 */
>> -		return -1u;
>> +		return (union vmx_exit_reason) {
>> +			.basic = -1,
>> +		};
> 
> We could make this return instead be a goto err; that returns this. Bonus is the
> comment on the other one can cover them both. What do you think?

Given 1) this patch is here mainly to avoid the false-positive on 
bus_lock_detected after the next patch, 2) the whole series is targeted 
for stable kernels, and 3) this part will change as suggested by [1]

I think we can just leave it as-is to make the change as simple as possible.

[1] https://lore.kernel.org/all/anXxBzO41_5eaaOI@google.com/
