Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B17D098
	for <linux-coco@lists.linux.dev>; Wed, 26 Nov 2025 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764136628; cv=none; b=u4aoywA4SzlezS72yUM63LpfoStVvBE9DqNneK3ntX2ekz6VfuFLpnV/0uP1XLxbgQX+oNJbRvPoS6yhrbzUz6LMTvW1c9vlCtQum3LcPF44Gs/ZINEKDTbZ2Pud7rGM2/Y6QbwTAAzJZLfQC9xPIL+mwBDmOvG5c5imCFE8mP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764136628; c=relaxed/simple;
	bh=OTho8qU9BnrmvKsPVD0CjGlxrwouddko8CkHyyFCX0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxGQ8Mi4cEY8kEt8NZySHmxpLYabBoEOgqzt7J0A7miU1aL0rzJkAu4KLBvORdgP5Z6g4mS8X//4EJaSslYyAwxQU7XBdtvq+RGFyjihO1r7Dt5rmHs7WH1GC/H1K0a9fgcVE3WIJXBC6DzpUt845bE/ga/BDsAwYBRhr5MWjZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=holDNDsO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="holDNDsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764136626; x=1795672626;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OTho8qU9BnrmvKsPVD0CjGlxrwouddko8CkHyyFCX0E=;
  b=holDNDsOrDjGx6L9xSBQjpJE45Sb7V+bHpAve4O2YU0kjpmuLSfa2rsH
   3MBE0PGfB5kOp/ulu+D8p90miPMr0Wh0mDILvwt2+P4/srLN7w/jh/cIF
   u5VGZMDnjocd2BAgTEXcedzOO62qE2MlyPal6B1jnGw5E6Bb/zN9U8aSB
   5Jo6adsTrW5Jx2HQqbci2EDeFwuT8IpJIEAiRG2a5VoqzooYRt+s0ztKY
   KIY8CHEqFDQ2ORY1ZoVcV5kCYnO7qVuHy3GvD5/nl2QQO7s66AXhcOpqm
   j91MHsLlzYlq3r46y7qe7d6IXjLHZ0n8M91Fcb1a+3MYd4B2aJPX6Q5It
   A==;
X-CSE-ConnectionGUID: 6RXQrkAcQUSwQxatG7J4fw==
X-CSE-MsgGUID: SaEPAuisRDmJ3bfhkoGVuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77531154"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="77531154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 21:57:05 -0800
X-CSE-ConnectionGUID: gOmtEBbFQkeeWX6QiWeAIw==
X-CSE-MsgGUID: rsdwU4YdSpumb6k26X48/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="223550488"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 21:57:00 -0800
Message-ID: <8d5c0f57-bf91-4ea3-bd7e-5a02bcb5cc09@linux.intel.com>
Date: Wed, 26 Nov 2025 13:56:57 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/16] KVM: TDX: Handle PAMT allocation in fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, chao.gao@intel.com, dave.hansen@intel.com,
 isaku.yamahata@intel.com, kai.huang@intel.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, mingo@redhat.com, pbonzini@redhat.com,
 seanjc@google.com, tglx@linutronix.de, vannapurve@google.com,
 x86@kernel.org, yan.y.zhao@intel.com, xiaoyao.li@intel.com,
 binbin.wu@intel.com
References: <20251121005125.417831-1-rick.p.edgecombe@intel.com>
 <20251121005125.417831-14-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251121005125.417831-14-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/21/2025 8:51 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
>
> Install PAMT pages for TDX call backs called during the fault path.
>
> There are two distinct cases when the kernel needs to allocate PAMT memory
> in the fault path: for SEPT page tables in tdx_sept_link_private_spt() and
> for leaf pages in tdx_sept_set_private_spte().
>
> These code paths run in atomic context. Previous changes have made the
> fault path top up the per-VCPU pool for memory allocations. Use it to do
> tdx_pamt_get/put() for the fault path operations.
>
> In the generic MMU these ops are inside functions that don’t always
> operate from the vCPU contexts (for example zap paths), which means they
> don’t have a struct kvm_vcpu handy. But for TDX they are always in a vCPU
> context. Since the pool of pre-allocated pages is on the vCPU, use
> kvm_get_running_vcpu() to get the vCPU. In case a new path appears where
> this is not the  case, leave some KVM_BUG_ON()’s.
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> [Add feedback, update log]
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> v4:
>   - Do prealloc.page_list initialization in tdx_td_vcpu_init() in case
>     userspace doesn't call KVM_TDX_INIT_VCPU.
>
> v3:
>   - Use new pre-allocation method
>   - Updated log
>   - Some extra safety around kvm_get_running_vcpu()
> ---
>   arch/x86/kvm/vmx/tdx.c | 44 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 61a058a8f159..24322263ac27 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -683,6 +683,8 @@ int tdx_vcpu_create(struct kvm_vcpu *vcpu)
>   	if (!irqchip_split(vcpu->kvm))
>   		return -EINVAL;
>   
> +	INIT_LIST_HEAD(&tdx->prealloc.page_list);
> +

Should this change be moved to patch 12?
Because the pre-alloc page list has started to be used in patch 12 for external
page tables even without enabling dynamic PAMT.

>   	fpstate_set_confidential(&vcpu->arch.guest_fpu);
>   	vcpu->arch.apic->guest_apic_protected = true;
>   	INIT_LIST_HEAD(&tdx->vt.pi_wakeup_list);
>
[...]
