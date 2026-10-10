Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E810519F121
	for <linux-coco@lists.linux.dev>; Sat, 10 Oct 2026 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606708; cv=none; b=b3cE9Bgtf5gD9fYLiuYjFoCqObRfLutdIlazfsNlIhcUaQ0h+1Xq33ke+0M8sVVI/Yp64u/ziKwcUbMylckDINXY2Yvg3c2cKAUHzmiwLf/OGjsMt6RyKAkWuQrQ4b/STdibGzxER6rn+BA89pgZhXBvVTKmqz2BSoAwGQU9XH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606708; c=relaxed/simple;
	bh=i1mDO9OXtrByT870IBFcGqKn43mp18xmYd7LU6yt6yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0efxPuZiagZPPrh/1vCASbFzzZOa5Hig3/WfKuTI3VYLGbg3K5jsqYiiJqHrsttRXjztraEbw0af73xaRtZsxU8hQ6UpKxTJZ6JAXgrHZb5cTlF7MyoSkdTKT25vX7UaZhHNZg5HfEkBAKWlPVo3FkWRQFxJsGr2HsyuCpmVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5xfp2rl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5xfp2rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791606706; x=1823142706;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i1mDO9OXtrByT870IBFcGqKn43mp18xmYd7LU6yt6yo=;
  b=K5xfp2rlYQqmUnFWc/otvP+CLHPBGicdFySJ/GOVxw9qjCHm44rJ9VEb
   L20GZfDib4OBja2PlWY2xxVVztEkHiXVdKaJkLSg33noMObUNcpMi41k4
   OkdHIHMAjIoOLdx2do3SCoMoSSpcHoOgJLJZPJ8Ktlcs82GoSHUL7GNNz
   8sUmBLWSemjv8n5ogAWktQAiHqQvBnlsMNUtArXN2E22/WlT/pmUY9B8F
   BshjWu9of9bo8ouI529dCb0Jv7BYA/7yiJ0TWYVRSEwfBdUUqIzWchghs
   s0Xi84aehC75tKkYlTv3qqHUe323C1kpt/LIg/hae8GPmNPmV1zFI5hSY
   w==;
X-CSE-ConnectionGUID: COcJ1ttEQxyst5r8u/1yDA==
X-CSE-MsgGUID: LAMLP/eRSs6X0i6hsF9k0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="396957"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="396957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 21:31:45 -0700
X-CSE-ConnectionGUID: 14WZTIDARDSkC7L9mP/8sg==
X-CSE-MsgGUID: 283OkiZjSSOF8+ljcBphgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="648064"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.245.162]) ([10.124.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 21:31:40 -0700
Message-ID: <7b4c79cd-848f-4472-a528-a4259a7a6882@linux.intel.com>
Date: Sat, 10 Oct 2026 12:31:36 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 15/23] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
To: Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Chao Gao <chao.gao@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>,
 Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-15-7c62a5d8a992@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20261001-tdx-selftests-v15-15-7c62a5d8a992@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/2026 3:37 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> TDX VMs need to issue the KVM_TDX_INIT_VCPU ioctl for each vcpu after
> vcpu creation.
> 
> KVM_TDX_INIT_VCPU has a strict prerequisite for the CPUID state. To
> satisfy this requirement, call KVM_TDX_GET_CPUID and KVM_SET_CPUID2 to
> pull the CPUID configuration from the TDCS and commit it into KVM,
> allowing KVM_TDX_INIT_VCPU to succeed.
> 
> Additionally, unlike tdx_vm_ioctl(), tdx_vcpu_ioctl() doesn't check
> hw_error. KVM's vCPU-scoped TDX ioctl handlers don't propagate SEAMCALL
> errors into hw_error: the error is handled in the kernel and only an
> errno is returned. Checking the ioctl's return value and errno is
> therefore sufficient.
> 
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  .../selftests/kvm/include/x86/tdx/tdx_util.h       | 20 +++++++++
>  tools/testing/selftests/kvm/lib/x86/processor.c    | 48 ++++++++++++++++++----
>  2 files changed, 60 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> index e529c587aeae..f5b2f32f2118 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> @@ -46,6 +46,26 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
>  		    (unsigned long long)hw_error);			\
>  })
>  
> +#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
> +({									\
> +	union {								\
> +		struct kvm_tdx_cmd c;					\
> +		unsigned long raw;					\
> +	} tdx_cmd = { .c = {						\
> +		.id = (cmd),						\
> +		.flags = (u32)(_flags),					\
> +		.data = (u64)(arg),					\
> +	} };								\
> +									\
> +	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> +})
> +
> +#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
> +({									\
> +	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
> +	TEST_ASSERT(!ret, "%s failed, errno: %d (%s)",			\
> +		     #cmd, errno, strerror(errno));			\
> +})

tdx_vm_ioctl() prints ret, tdx_vcpu_ioctl() doesn't.
Better to be consistent.

>  void tdx_init_vm(struct kvm_vm *vm);
>  void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
>  void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 4a753fb43007..4af9cbf3fabb 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -876,16 +876,48 @@ gva_t kvm_allocate_vcpu_stack(struct kvm_vm *vm)
>  		    "__vm_alloc() did not provide a page-aligned address");
>  	stack_gva -= 8;
>  
> +	return stack_gva;
> +}
> +
> +static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_cpuid2 *cpuid;
> +
> +	cpuid = allocate_kvm_cpuid2(MAX_NR_CPUID_ENTRIES);
> +	tdx_vcpu_ioctl(vcpu, KVM_TDX_GET_CPUID, 0, cpuid);
> +	vcpu_init_cpuid(vcpu, cpuid);
> +	free(cpuid);
> +	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
> +}

Should this function better to be in tdx_util.c, like other tdx specific helpers?

> +
> +struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
> +{
> +	struct kvm_mp_state mp_state;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_regs regs;
> +
>  	vcpu = __vm_vcpu_add(vm, vcpu_id);
> -	vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
> -	vcpu_init_sregs(vm, vcpu);
> -	vcpu_init_xcrs(vm, vcpu);
>  
> -	/* Setup guest general purpose registers */
> -	vcpu_regs_get(vcpu, &regs);
> -	regs.rflags = regs.rflags | 0x2;
> -	regs.rsp = kvm_allocate_vcpu_stack(vm);
> -	vcpu_regs_set(vcpu, &regs);
> +	/*
> +	 * Both kvm_get_supported_cpuid() (for legacy VMs) and KVM_TDX_GET_CPUID
> +	 * (for TDX VMs) return VM-scoped CPUID. e.g. the APIC ID isn't
> +	 * populated per vCPU. This is fine because KVM selftests don't
> +	 * currently test CPUID topology enumeration.
> +	 */
> +	if (is_tdx_vm(vm)) {
> +		tdx_vcpu_init(vm, vcpu);
> +	} else {
> +		vcpu_init_cpuid(vcpu, kvm_get_supported_cpuid());
> +
> +		vcpu_init_sregs(vm, vcpu);
> +		vcpu_init_xcrs(vm, vcpu);
> +
> +		/* Setup guest general purpose registers */
> +		vcpu_regs_get(vcpu, &regs);
> +		regs.rflags = regs.rflags | 0x2;
> +		regs.rsp = kvm_allocate_vcpu_stack(vm);
> +		vcpu_regs_set(vcpu, &regs);
> +	}
>  
>  	/* Setup the MP state */
>  	mp_state.mp_state = 0;
> 

