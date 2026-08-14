Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062940DB56
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 08:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696764; cv=none; b=QD0JMSFpGLNE7U1vODZnwxyDi4gG1Fa7pqhGvt+gKD+LUOHAZx9x2vRq9nRvTfZ+FqpVgIQric1WjigOZrclm1TZWeHkCjkOdSk/5hmeCvPUChUNsYgkWf7HTVrkUD+esnZr144ZN3A4P5+0bDYHcKT9Q6fdGuEKCvJ0IcWabJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696764; c=relaxed/simple;
	bh=Owi9JJxaqEQuUpAuBfEPmO4X+/IiiwbzLKUqb3lbM9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yne6bx9iD1Lp/vDDKBNDNjzSkOOveeU401DmCXL+bP3BwZaDqVqOwKfF/hZHhKBtT57p61srTJifU+9pfdw0+1kbVfpygCEO5N2u2dVYZ5M/zPSucyfmw7FWBXT3YkJq+h/KOkAxAyvDgAcmwAXDIsBmBwsYOP5KT7YfVM46Bsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aU/ZWcpY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aU/ZWcpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786696761; x=1818232761;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Owi9JJxaqEQuUpAuBfEPmO4X+/IiiwbzLKUqb3lbM9E=;
  b=aU/ZWcpYt5i9seORRnP4oA3sXTLryJAy9ZnccZgfuPdqR/VT3SLPb4J9
   qO1XHWQ1NfJKNYc1i61VEKOSS0JwEJytwC/VPfYB0f6JqeQwnJe/lr41W
   8akHcj12IpcIlfHOSaU6JqgTef7u0tayMOvigvwVvi4TTwkd3ouHRPldZ
   Cvm3Xssi+5RHtL4k/WYhuVpNh+mtl4VSQAG9OH6BYTFjxCnv9u59Ev8Dn
   UmYe3xqY1pvO1h4bHTSeE96R2VhEA8mXVsC52EJjQdyCzr0up6Co/axuB
   KhXTNQVP+iKWS4HI1U7L0Aqr43efGMmeyrygV8ZWUr7go6bU54EeuLgV4
   Q==;
X-CSE-ConnectionGUID: XFe8aK9YR9q1xCCLPS6H6g==
X-CSE-MsgGUID: QkCdi7frSMOAo/igg8O52A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87200701"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87200701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:39:18 -0700
X-CSE-ConnectionGUID: pKSo7Kb9R8iTqKwdRMOc2Q==
X-CSE-MsgGUID: 92STh/BjRyCxUvFxwlJkeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="266155347"
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 01:39:13 -0700
Message-ID: <ff75db79-14dd-44c7-b34b-f608cbc1364c@intel.com>
Date: Fri, 14 Aug 2026 16:39:11 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 16/22] KVM: selftests: Load per-vCPU guest stack in
 TDX boot parameters
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
 <20260722-tdx-selftests-v14-16-15ad654a50db@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260722-tdx-selftests-v14-16-15ad654a50db@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/2026 7:13 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> Allocate a guest stack for each vCPU and record the GVA in the TDX boot
> parameters region to allow proper vCPU initialization.
> 
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>   tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
>   tools/testing/selftests/kvm/lib/x86/processor.c        |  2 ++
>   tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> index 07e7f5c90329..93ce6e1ad2c8 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> @@ -69,5 +69,6 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
>   void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
>   void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
>   void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
> +void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
>   
>   #endif /* SELFTESTS_TDX_TDX_UTIL_H */
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index f6a2aa6b86a4..5e415c6577b8 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -847,6 +847,8 @@ static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
>   	vcpu_init_cpuid(vcpu, cpuid);
>   	free(cpuid);
>   	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
> +
> +	tdx_vcpu_load_boot_parameters(vm, vcpu);
>   }
>   
>   struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> index 5bbe51ad0f66..3c3ac6c7ce40 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
> @@ -104,6 +104,16 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
>   	TEST_ASSERT(params->idtr.base != 0, "idt base address should not be 0");
>   }
>   
> +void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> +{
> +	struct td_boot_parameters *params =
> +		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
> +	struct td_per_vcpu_parameters *vcpu_params =
> +		&params->per_vcpu[vcpu->id];
> +
> +	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
> +}
> +
>   static struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
>   {
>   	static struct kvm_tdx_capabilities *tdx_cap;
> 

