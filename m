Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D530BF55
	for <linux-coco@lists.linux.dev>; Tue,  4 Nov 2025 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245652; cv=none; b=c19jiA3ECkDcPcP6WGSs9z40bsp+wwZjkPNzv3oRJqiI1sMmI69ohTSWMLtWvlhLgbRrx+/KMf90lWIuOQZ24ksLgCPf2VDIge7IgV97dJs7meIIt8wPXvAgL4bnLDnFI+FDVWxdSk613aNDMQ7BA7c3rGO4VgYAkMrVPWYCAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245652; c=relaxed/simple;
	bh=/kotX95hkDFIgCqqnpADvX9fQVyajMzAMdwz5YIkGtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qL/et9HVOHpHRQe35RltV4e9PGNTfWZL9Ct0w7GQIzPCvJFtc2zDXP2jioOdt9woniorgfU9xDHhYlvBn+PPAWGqk47QdUa75tZ09rit8Tc5wN13wo9qKRQSKon8pqopNQBrsJy13XxS4W8yXpVQFaRDBjL8lq9MnZ0ELUuN8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJLlz4D3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJLlz4D3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245651; x=1793781651;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=/kotX95hkDFIgCqqnpADvX9fQVyajMzAMdwz5YIkGtc=;
  b=ZJLlz4D3ApeJ3myoQC85F9S3PBSRPazJ7ePkU8WbxU7aHlnhur4h4gio
   dAOzGfsEZbxzLmB11GYqFq7XXfh/j79k1NPqyyPqPx0Ka2z6fow+5/iyl
   b21HXvlbwLj4TUdz2b4yFmB7v2ZFrUZdaP/8yFSFlL3XrnJAxNPaZGM8v
   or7tjbN52biTG+rBwXSAjinSb3ZHmkdiog150asoYuSCMkFHDdLyUadB5
   zw9KuHAM34845llp0VCnm0spSbftWlOU08wQDtCa2vd4T0t799iQD9El3
   Nqxv51fQSawYn1T5Dz90jbNw31a/1SDfUghRPNLnaU1UJd0IMT/E0x1zV
   A==;
X-CSE-ConnectionGUID: 7DO3E//kRx2PPdE4kqPz+w==
X-CSE-MsgGUID: 1gn1Qn/cQ9iNYObuDXuAWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64262399"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64262399"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:40:50 -0800
X-CSE-ConnectionGUID: yh2Q3imiSSqJ6OzEATaAmQ==
X-CSE-MsgGUID: Zm3LOWhkTmOPPNQWnHKWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187252803"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.49]) ([10.124.240.49])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:40:47 -0800
Message-ID: <969d1b3a-2a82-4ff1-85c5-705c102f0f8b@intel.com>
Date: Tue, 4 Nov 2025 16:40:44 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] KVM: TDX: Explicitly set user-return MSRs that
 *may* be clobbered by the TDX-Module
To: Yan Zhao <yan.y.zhao@intel.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>
References: <20251030191528.3380553-1-seanjc@google.com>
 <20251030191528.3380553-2-seanjc@google.com>
 <aQhJol0CvT6bNCJQ@yzhao56-desk.sh.intel.com>
 <aQmmBadeFp/7CDmH@yzhao56-desk.sh.intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <aQmmBadeFp/7CDmH@yzhao56-desk.sh.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/2025 3:06 PM, Yan Zhao wrote:
> Another nit:
> Remove the tdx_user_return_msr_update_cache() in the comment of __tdx_bringup().
> 
> Or could we just invoke tdx_user_return_msr_update_cache() in
> tdx_prepare_switch_to_guest()?

No. It lacks the WRMSR operation to update the hardware value, which is 
the key of this patch.

> On Mon, Nov 03, 2025 at 02:20:18PM +0800, Yan Zhao wrote:
>> On Thu, Oct 30, 2025 at 12:15:25PM -0700, Sean Christopherson wrote:
>>> Set all user-return MSRs to their post-TD-exit value when preparing to run
>>> a TDX vCPU to ensure the value that KVM expects to be loaded after running
>>> the vCPU is indeed the value that's loaded in hardware.  If the TDX-Module
>>> doesn't actually enter the guest, i.e. doesn't do VM-Enter, then it won't
>>> "restore" VMM state, i.e. won't clobber user-return MSRs to their expected
>>> post-run values, in which case simply updating KVM's "cached" value will
>>> effectively corrupt the cache due to hardware still holding the original
>>> value.
>> This paragraph is confusing.
>>
>> The flow for the TDX module for the user-return MSRs is:
>>
>> 1. Before entering guest, i.e., inside tdh_vp_enter(),
>>     a) if VM-Enter is guaranteed to succeed, load MSRs with saved guest value;
>>     b) otherwise, do nothing and return to VMM.
>>
>> 2. After VMExit, before returning to VMM,
>>     save guest value and restore MSRs to default values.
>>
>>
>> Failure of tdh_vp_enter() (i.e., in case of 1.b), the hardware values of the
>> MSRs should be either host value or default value, while with
>> msrs->values[slot].curr being default value.
>>
>> As a result, the reasoning of "hardware still holding the original value" is not
>> convincing, since the original value is exactly the host value.
>>
>>> In theory, KVM could conditionally update the current user-return value if
>>> and only if tdh_vp_enter() succeeds, but in practice "success" doesn't
>>> guarantee the TDX-Module actually entered the guest, e.g. if the TDX-Module
>>> synthesizes an EPT Violation because it suspects a zero-step attack.
>>>
>>> Force-load the expected values instead of trying to decipher whether or
>>> not the TDX-Module restored/clobbered MSRs, as the risk doesn't justify
>>> the benefits.  Effectively avoiding four WRMSRs once per run loop (even if
>>> the vCPU is scheduled out, user-return MSRs only need to be reloaded if
>>> the CPU exits to userspace or runs a non-TDX vCPU) is likely in the noise
>>> when amortized over all entries, given the cost of running a TDX vCPU.
>>> E.g. the cost of the WRMSRs is somewhere between ~300 and ~500 cycles,
>>> whereas the cost of a _single_ roundtrip to/from a TDX guest is thousands
>>> of cycles.
>>>
>>> Fixes: e0b4f31a3c65 ("KVM: TDX: restore user ret MSRs")
>>> Cc: stable@vger.kernel.org
>>> Cc: Yan Zhao <yan.y.zhao@intel.com>
>>> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
>>> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>> ---
>>>   arch/x86/include/asm/kvm_host.h |  1 -
>>>   arch/x86/kvm/vmx/tdx.c          | 52 +++++++++++++++------------------
>>>   arch/x86/kvm/vmx/tdx.h          |  1 -
>>>   arch/x86/kvm/x86.c              |  9 ------
>>>   4 files changed, 23 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>>> index 48598d017d6f..d158dfd1842e 100644
>>> --- a/arch/x86/include/asm/kvm_host.h
>>> +++ b/arch/x86/include/asm/kvm_host.h
>>> @@ -2378,7 +2378,6 @@ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
>>>   int kvm_add_user_return_msr(u32 msr);
>>>   int kvm_find_user_return_msr(u32 msr);
>>>   int kvm_set_user_return_msr(unsigned index, u64 val, u64 mask);
>>> -void kvm_user_return_msr_update_cache(unsigned int index, u64 val);
>>>   u64 kvm_get_user_return_msr(unsigned int slot);
>>>   
>>>   static inline bool kvm_is_supported_user_return_msr(u32 msr)
>>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>>> index 326db9b9c567..cde91a995076 100644
>>> --- a/arch/x86/kvm/vmx/tdx.c
>>> +++ b/arch/x86/kvm/vmx/tdx.c
>>> @@ -763,25 +763,6 @@ static bool tdx_protected_apic_has_interrupt(struct kvm_vcpu *vcpu)
>>>   	return tdx_vcpu_state_details_intr_pending(vcpu_state_details);
>>>   }
>>>   
>>> -/*
>>> - * Compared to vmx_prepare_switch_to_guest(), there is not much to do
>>> - * as SEAMCALL/SEAMRET calls take care of most of save and restore.
>>> - */
>>> -void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
>>> -{
>>> -	struct vcpu_vt *vt = to_vt(vcpu);
>>> -
>>> -	if (vt->guest_state_loaded)
>>> -		return;
>>> -
>>> -	if (likely(is_64bit_mm(current->mm)))
>>> -		vt->msr_host_kernel_gs_base = current->thread.gsbase;
>>> -	else
>>> -		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
>>> -
>>> -	vt->guest_state_loaded = true;
>>> -}
>>> -
>>>   struct tdx_uret_msr {
>>>   	u32 msr;
>>>   	unsigned int slot;
>>> @@ -795,19 +776,38 @@ static struct tdx_uret_msr tdx_uret_msrs[] = {
>>>   	{.msr = MSR_TSC_AUX,},
>>>   };
>>>   
>>> -static void tdx_user_return_msr_update_cache(void)
>>> +void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
>>>   {
>>> +	struct vcpu_vt *vt = to_vt(vcpu);
>>>   	int i;
>>>   
>>> +	if (vt->guest_state_loaded)
>>> +		return;
>>> +
>>> +	if (likely(is_64bit_mm(current->mm)))
>>> +		vt->msr_host_kernel_gs_base = current->thread.gsbase;
>>> +	else
>>> +		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
>>> +
>>> +	vt->guest_state_loaded = true;
>>> +
>>> +	/*
>>> +	 * Explicitly set user-return MSRs that are clobbered by the TDX-Module
>>> +	 * if VP.ENTER succeeds, i.e. on TD-Exit, with the values that would be
>>> +	 * written by the TDX-Module.  Don't rely on the TDX-Module to actually
>>> +	 * clobber the MSRs, as the contract is poorly defined and not upheld.
>>> +	 * E.g. the TDX-Module will synthesize an EPT Violation without doing
>>> +	 * VM-Enter if it suspects a zero-step attack, and never "restore" VMM
>>> +	 * state.
>>> +	 */
>>>   	for (i = 0; i < ARRAY_SIZE(tdx_uret_msrs); i++)
>>> -		kvm_user_return_msr_update_cache(tdx_uret_msrs[i].slot,
>>> -						 tdx_uret_msrs[i].defval);
>>> +		kvm_set_user_return_msr(tdx_uret_msrs[i].slot,
>>> +					tdx_uret_msrs[i].defval, -1ull);
>>>   }
>>>   
>>>   static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
>>>   {
>>>   	struct vcpu_vt *vt = to_vt(vcpu);
>>> -	struct vcpu_tdx *tdx = to_tdx(vcpu);
>>>   
>>>   	if (!vt->guest_state_loaded)
>>>   		return;
>>> @@ -815,11 +815,6 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
>>>   	++vcpu->stat.host_state_reload;
>>>   	wrmsrl(MSR_KERNEL_GS_BASE, vt->msr_host_kernel_gs_base);
>>>   
>>> -	if (tdx->guest_entered) {
>>> -		tdx_user_return_msr_update_cache();
>>> -		tdx->guest_entered = false;
>>> -	}
>>> -
>>>   	vt->guest_state_loaded = false;
>>>   }
>>>   
>>> @@ -1059,7 +1054,6 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>>>   		update_debugctlmsr(vcpu->arch.host_debugctl);
>>>   
>>>   	tdx_load_host_xsave_state(vcpu);
>>> -	tdx->guest_entered = true;
>>>   
>>>   	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
>>>   
>>> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
>>> index ca39a9391db1..7f258870dc41 100644
>>> --- a/arch/x86/kvm/vmx/tdx.h
>>> +++ b/arch/x86/kvm/vmx/tdx.h
>>> @@ -67,7 +67,6 @@ struct vcpu_tdx {
>>>   	u64 vp_enter_ret;
>>>   
>>>   	enum vcpu_tdx_state state;
>>> -	bool guest_entered;
>>>   
>>>   	u64 map_gpa_next;
>>>   	u64 map_gpa_end;
>>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>>> index b4b5d2d09634..639589af7cbe 100644
>>> --- a/arch/x86/kvm/x86.c
>>> +++ b/arch/x86/kvm/x86.c
>>> @@ -681,15 +681,6 @@ int kvm_set_user_return_msr(unsigned slot, u64 value, u64 mask)
>>>   }
>>>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_user_return_msr);
>>>   
>>> -void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
>>> -{
>>> -	struct kvm_user_return_msrs *msrs = this_cpu_ptr(user_return_msrs);
>>> -
>>> -	msrs->values[slot].curr = value;
>>> -	kvm_user_return_register_notifier(msrs);
>>> -}
>>> -EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_user_return_msr_update_cache);
>>> -
>>>   u64 kvm_get_user_return_msr(unsigned int slot)
>>>   {
>>>   	return this_cpu_ptr(user_return_msrs)->values[slot].curr;
>>> -- 
>>> 2.51.1.930.gacf6e81ea2-goog
>>>

