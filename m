Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5953E9F7B
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 08:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697038; cv=none; b=ZDq7HDPDoA5Ilr2yhS2y2f9X4T1BxrimVdyLzumcRPR2XniZdBEJauLDMw8ymb15lXPQ+AGf3H57vvTypBuIZn18Axo9ShX+4wBtPDQbUHdspxghpEt+ku1oqRGRCYMzpGqa7fvgKq0qhoeFeJfaLBDVFLviNRNPF/gGkcQlPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697038; c=relaxed/simple;
	bh=qa5YvmmYaskdse9zu959prlcT7BIK7c4U491TFw0MR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQKteCMWXJdlm+VZJVTf9+zYF9eAyINAw3Q/DO8i0rZghabxQ2AADvZsDy68kwpIEwD7WtaIz3JAcTCwHQlodfeFcHpvxBgwE+BEMzLqxPssJGzuT81IUQYl+Jkr5S/fOJQ3HOq0CQnmoPGVPZj7DN+fIAHnnO8Yjy0V/XURmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iELAEeXu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iELAEeXu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786697035; x=1818233035;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qa5YvmmYaskdse9zu959prlcT7BIK7c4U491TFw0MR0=;
  b=iELAEeXuYhxozHEmkKSmELRMl67XL3Jfw3BzvymzQm7CBtRVTJmeqmxY
   UosiFhvEnEfJnS09y0sANrIXB68p935Mz/UMx4zey+m3mvo5RkXrQEWmg
   pCDK4gai7NoqTzxdxewaNZEO+EKE5/rjrL611u4D7umFRUYk7SLElW/Io
   UhV7HvK30JBNanx7SxBx/iLB45v2FVhU+suThvFEAp753tV/ifi6m7PZF
   JQNkKBnE/52qc+QO6m8EEzIUy9A+wpq1sQM0UMbtUcEzHYXtDZwUhCmVw
   S6FEii0gMrl7SyRusFpLNq2sF141Pzw3KWV0ItenPt2mz9qHznr9x/D9C
   g==;
X-CSE-ConnectionGUID: usuy4sfbSwKYU1qxsY2aOQ==
X-CSE-MsgGUID: 2O2DGdRzS/qzahBo9p8iaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87493597"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87493597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:43:53 -0700
X-CSE-ConnectionGUID: RG47D4vwQuCIqBpt5JIHYg==
X-CSE-MsgGUID: msf3aCTRTu6j39MGxWDSnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302407915"
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:43:47 -0700
Message-ID: <34a7dea3-08aa-4bb2-bc19-843017b31fe0@intel.com>
Date: Fri, 14 Aug 2026 16:43:45 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 17/22] KVM: selftests: Set entry point for TDX guest
 code
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>,
 Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-17-15ad654a50db@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260722-tdx-selftests-v14-17-15ad654a50db@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/2026 7:13 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> Since the rip register is inaccessible for TDX VMs, we need a different
> way to set the guest entry point for TDX VMs. This is done by writing
> the guest code address to a predefined location in the guest memory and
> loading it into rip as part of the TDX boot code.
> 
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
>   tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
>   tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
>   3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> index 93ce6e1ad2c8..307e2c0bc9c9 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> @@ -70,5 +70,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
>   void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
>   void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
>   void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
> +void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
>   
>   #endif /* SELFTESTS_TDX_TDX_UTIL_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 5e415c6577b8..4b97a9a1bb5e 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -808,9 +808,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
>   {
>   	struct kvm_regs regs;
>   
> -	vcpu_regs_get(vcpu, &regs);
> -	regs.rip = (unsigned long) guest_code;
> -	vcpu_regs_set(vcpu, &regs);
> +	if (is_tdx_vm(vcpu->vm)) {
> +		tdx_vcpu_set_entry_point(vcpu, guest_code);
> +	} else {
> +		vcpu_regs_get(vcpu, &regs);
> +		regs.rip = (unsigned long)guest_code;
> +		vcpu_regs_set(vcpu, &regs);
> +	}
>   }
>   
>   gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> index 3c3ac6c7ce40..be63d8652a02 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -114,6 +114,16 @@ void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>   	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
>   }
>   
> +void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
> +{
> +	struct td_boot_parameters *params =
> +		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
> +	struct td_per_vcpu_parameters *vcpu_params =
> +		&params->per_vcpu[vcpu->id];
> +
> +	vcpu_params->guest_code = (u64)guest_code;
> +}
> +
>   static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>   {
>   	static struct kvm_tdx_capabilities *tdx_cap;
> 

