Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E382C0282
	for <linux-coco@lists.linux.dev>; Mon,  3 Nov 2025 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762155814; cv=none; b=ScM+KTy5K1F4Y3k21dPjrrSE0C5mqOjX7k7vConOHJcFoqaiwAQ+shidx4X6JaG0daO/43aiNBHGTUoMDVKt9kTn2KUeWw3dc24GAnmPdmJOuo+sL8Z6ebJeDmCIxWnbDx7Hy1TOerechdpHWcJThoCAV5IFN9XvmUKl5UepT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762155814; c=relaxed/simple;
	bh=id3ERlimBjRZ4jOshniERH1qwi+KMdHLbhMZnBhGNaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y81UWFI3C4zZhrNbJwln+Th+aqav7NTikR6WZqQ+jRkXvWksm0+AOExsqV79McR4TpSizA0kx96tTAZ/eskjL4FnxXdjVK/ivTThX2PxOu3hIuGWSBaJm6WS91YVEDhfWfGX8lv8E/UHhlwTHLvyxy1t8SW2ufapheeZoSMesgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKzG+3MA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKzG+3MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762155813; x=1793691813;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=id3ERlimBjRZ4jOshniERH1qwi+KMdHLbhMZnBhGNaE=;
  b=YKzG+3MA9OcjfVqfkd/rO0CtMg+BoBprzoUxSy3BbWDvVYHtHqKnDDsr
   aH/438OdNDtM5nHG3BwtmpqLjof/wASNuRhhG6Z8D6w/dRUGojfzvt3yv
   jDAPVsEL+qZAiKYeef5kUd5G5sDAqR6c6IeA+ROeQvXZj3c3omK1Noby+
   h4zGWMLp27bUSZ/CcgndG2HKzsnx6uX2Ht8aXdr5ywwuPGBh12MbEKrLi
   HiI7rWN8HoME8s76k5pngU1g+wgXy1o9lX6WyPAOukXlHXt35D21PJ4iE
   aTZaSjXCuU/H9OPznozbPQmCDqnbEJxLwOtgb5d/CVLeAtidKPcRQET0/
   A==;
X-CSE-ConnectionGUID: 3FGFY/nUTiaG4yVix9cTLQ==
X-CSE-MsgGUID: QhSacFW1SLeyUWX5BUV5rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="86848354"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="86848354"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:43:13 -0800
X-CSE-ConnectionGUID: 780hYnG3RfywyumOrqr5Ww==
X-CSE-MsgGUID: w9EifOB1QGuixG7+2s1Vwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="187525555"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.232.191]) ([10.124.232.191])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 23:43:10 -0800
Message-ID: <a9a59960-bd6c-4a8e-b07c-b941853fecaf@intel.com>
Date: Mon, 3 Nov 2025 15:42:54 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] KVM: TDX: Explicitly set user-return MSRs that
 *may* be clobbered by the TDX-Module
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Hou Wenlong <houwenlong.hwl@antgroup.com>
References: <20251030191528.3380553-1-seanjc@google.com>
 <20251030191528.3380553-2-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20251030191528.3380553-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2025 3:15 AM, Sean Christopherson wrote:
> Set all user-return MSRs to their post-TD-exit value when preparing to run
> a TDX vCPU to ensure the value that KVM expects to be loaded after running
> the vCPU is indeed the value that's loaded in hardware.  If the TDX-Module
> doesn't actually enter the guest, i.e. doesn't do VM-Enter, then it won't
> "restore" VMM state, i.e. won't clobber user-return MSRs to their expected
> post-run values, in which case simply updating KVM's "cached" value will
> effectively corrupt the cache due to hardware still holding the original
> value.
> 
> In theory, KVM could conditionally update the current user-return value if
> and only if tdh_vp_enter() succeeds, but in practice "success" doesn't
> guarantee the TDX-Module actually entered the guest, e.g. if the TDX-Module
> synthesizes an EPT Violation because it suspects a zero-step attack.
> 
> Force-load the expected values instead of trying to decipher whether or
> not the TDX-Module restored/clobbered MSRs, as the risk doesn't justify
> the benefits.  Effectively avoiding four WRMSRs once per run loop (even if
> the vCPU is scheduled out, user-return MSRs only need to be reloaded if
> the CPU exits to userspace or runs a non-TDX vCPU) is likely in the noise
> when amortized over all entries, given the cost of running a TDX vCPU.
> E.g. the cost of the WRMSRs is somewhere between ~300 and ~500 cycles,
> whereas the cost of a _single_ roundtrip to/from a TDX guest is thousands
> of cycles.
> 
> Fixes: e0b4f31a3c65 ("KVM: TDX: restore user ret MSRs")
> Cc: stable@vger.kernel.org
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   arch/x86/include/asm/kvm_host.h |  1 -
>   arch/x86/kvm/vmx/tdx.c          | 52 +++++++++++++++------------------
>   arch/x86/kvm/vmx/tdx.h          |  1 -
>   arch/x86/kvm/x86.c              |  9 ------
>   4 files changed, 23 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 48598d017d6f..d158dfd1842e 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2378,7 +2378,6 @@ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
>   int kvm_add_user_return_msr(u32 msr);
>   int kvm_find_user_return_msr(u32 msr);
>   int kvm_set_user_return_msr(unsigned index, u64 val, u64 mask);
> -void kvm_user_return_msr_update_cache(unsigned int index, u64 val);
>   u64 kvm_get_user_return_msr(unsigned int slot);
>   
>   static inline bool kvm_is_supported_user_return_msr(u32 msr)
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 326db9b9c567..cde91a995076 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -763,25 +763,6 @@ static bool tdx_protected_apic_has_interrupt(struct kvm_vcpu *vcpu)
>   	return tdx_vcpu_state_details_intr_pending(vcpu_state_details);
>   }
>   
> -/*
> - * Compared to vmx_prepare_switch_to_guest(), there is not much to do
> - * as SEAMCALL/SEAMRET calls take care of most of save and restore.
> - */
> -void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
> -{
> -	struct vcpu_vt *vt = to_vt(vcpu);
> -
> -	if (vt->guest_state_loaded)
> -		return;
> -
> -	if (likely(is_64bit_mm(current->mm)))
> -		vt->msr_host_kernel_gs_base = current->thread.gsbase;
> -	else
> -		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
> -
> -	vt->guest_state_loaded = true;
> -}
> -
>   struct tdx_uret_msr {
>   	u32 msr;
>   	unsigned int slot;
> @@ -795,19 +776,38 @@ static struct tdx_uret_msr tdx_uret_msrs[] = {
>   	{.msr = MSR_TSC_AUX,},
>   };
>   
> -static void tdx_user_return_msr_update_cache(void)
> +void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
>   {
> +	struct vcpu_vt *vt = to_vt(vcpu);
>   	int i;
>   
> +	if (vt->guest_state_loaded)
> +		return;
> +
> +	if (likely(is_64bit_mm(current->mm)))
> +		vt->msr_host_kernel_gs_base = current->thread.gsbase;
> +	else
> +		vt->msr_host_kernel_gs_base = read_msr(MSR_KERNEL_GS_BASE);
> +
> +	vt->guest_state_loaded = true;
> +
> +	/*
> +	 * Explicitly set user-return MSRs that are clobbered by the TDX-Module
> +	 * if VP.ENTER succeeds, i.e. on TD-Exit, with the values that would be
> +	 * written by the TDX-Module.  Don't rely on the TDX-Module to actually
> +	 * clobber the MSRs, as the contract is poorly defined and not upheld.
> +	 * E.g. the TDX-Module will synthesize an EPT Violation without doing
> +	 * VM-Enter if it suspects a zero-step attack, and never "restore" VMM
> +	 * state.
> +	 */
>   	for (i = 0; i < ARRAY_SIZE(tdx_uret_msrs); i++)
> -		kvm_user_return_msr_update_cache(tdx_uret_msrs[i].slot,
> -						 tdx_uret_msrs[i].defval);
> +		kvm_set_user_return_msr(tdx_uret_msrs[i].slot,
> +					tdx_uret_msrs[i].defval, -1ull);
>   }
>   
>   static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
>   {
>   	struct vcpu_vt *vt = to_vt(vcpu);
> -	struct vcpu_tdx *tdx = to_tdx(vcpu);
>   
>   	if (!vt->guest_state_loaded)
>   		return;
> @@ -815,11 +815,6 @@ static void tdx_prepare_switch_to_host(struct kvm_vcpu *vcpu)
>   	++vcpu->stat.host_state_reload;
>   	wrmsrl(MSR_KERNEL_GS_BASE, vt->msr_host_kernel_gs_base);
>   
> -	if (tdx->guest_entered) {
> -		tdx_user_return_msr_update_cache();
> -		tdx->guest_entered = false;
> -	}
> -
>   	vt->guest_state_loaded = false;
>   }
>   
> @@ -1059,7 +1054,6 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>   		update_debugctlmsr(vcpu->arch.host_debugctl);
>   
>   	tdx_load_host_xsave_state(vcpu);
> -	tdx->guest_entered = true;
>   
>   	vcpu->arch.regs_avail &= TDX_REGS_AVAIL_SET;
>   
> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
> index ca39a9391db1..7f258870dc41 100644
> --- a/arch/x86/kvm/vmx/tdx.h
> +++ b/arch/x86/kvm/vmx/tdx.h
> @@ -67,7 +67,6 @@ struct vcpu_tdx {
>   	u64 vp_enter_ret;
>   
>   	enum vcpu_tdx_state state;
> -	bool guest_entered;
>   
>   	u64 map_gpa_next;
>   	u64 map_gpa_end;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b4b5d2d09634..639589af7cbe 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -681,15 +681,6 @@ int kvm_set_user_return_msr(unsigned slot, u64 value, u64 mask)
>   }
>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_set_user_return_msr);
>   
> -void kvm_user_return_msr_update_cache(unsigned int slot, u64 value)
> -{
> -	struct kvm_user_return_msrs *msrs = this_cpu_ptr(user_return_msrs);
> -
> -	msrs->values[slot].curr = value;
> -	kvm_user_return_register_notifier(msrs);
> -}
> -EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_user_return_msr_update_cache);
> -
>   u64 kvm_get_user_return_msr(unsigned int slot)
>   {
>   	return this_cpu_ptr(user_return_msrs)->values[slot].curr;

