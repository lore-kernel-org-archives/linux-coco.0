Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601213BBFCD
	for <linux-coco@lists.linux.dev>; Sat, 10 Oct 2026 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600429; cv=none; b=lteXDris6dyPmizBFyiC6XkeLOM08QnDYjaJYsoT2dmR7sW1HDVYuRvdDELmFsjOsgIZvbnhy1vLHN1mSM2UNEWUtu99VHY5SJfLqE8E+TjpVXtwNe2ptlan0tu+vEXdyMY0eWFCJ+SSMPI0liCZXgiqm5CwrefB0jxeV+B2hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600429; c=relaxed/simple;
	bh=TwvxuliLdqh6Kvf8xBvOYb5mrkLELcwTdcUa6mDjPbo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTxVP1KS7HrLVNvREstVJ1nYmSqsAwQ+7V12T4YWTYE+FzqtFfjvzR56UdFYs1XvYqTs381YVNI2DWtdIn2mGlCtDoBaTa3qNR5XkTIr4IWh0n9Epotr0hBXeYiynLLwwT1xkNwChe9/dvPfqNQQcef3JQMe4h2MqfHE+Am3ESc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZadtJc5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZadtJc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791600425; x=1823136425;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TwvxuliLdqh6Kvf8xBvOYb5mrkLELcwTdcUa6mDjPbo=;
  b=LZadtJc54DbAdnDozOn7i+Bo6HIqXkMp6ROmJkYDUSacw3BoCoQg0Ih4
   VLfh/9Byo4IviTwpTPHXEIuCdmnZn+UI3nOJsUtRIDjvHKg8qtRRh8Nab
   lkLtRecfbfGkrmgyB3s99VfvNlligWcBjBjgtQMNJoJO8GXuFz1vuiyu2
   dP3kb/drKTQeo5q/O97pxkzQDqP6Hr6HnOT5EonswQ6H2f/H/8bLXaqZt
   nNhOxBp9GVhzdyFGVbQHDnt1TIioYELYcu5+UNA7uR6fm9aXz8tR5CGU6
   44LX0libpgVrguTr4+mDJ0bJopuXgdNhY3hYWfj80kkF426xn/UxOOw4X
   g==;
X-CSE-ConnectionGUID: qKZjwXWkRxGIg/1i8oDLGA==
X-CSE-MsgGUID: IWeSiCs6Q0uHjLNcbLRnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="406742"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="406742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 19:47:05 -0700
X-CSE-ConnectionGUID: B8KXmx6rTC6C1JQxgMBDDw==
X-CSE-MsgGUID: 0oFwvbnTT4mKrLi7+6ZRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="792483"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.245.162]) ([10.124.245.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 19:46:59 -0700
Message-ID: <a1fc92af-b2f4-4fe4-b113-0b206fb728b7@linux.intel.com>
Date: Sat, 10 Oct 2026 10:46:56 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/23] KVM: selftests: Set up TDX boot parameters
 region
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
 <20261001-tdx-selftests-v15-10-7c62a5d8a992@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20261001-tdx-selftests-v15-10-7c62a5d8a992@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/2026 3:37 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> Allocate memory for TDX boot parameters and define the utility functions
> necessary to fill this memory with the boot parameters.
> 
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>

One nit below and the issue pointed by the sashiko.

Otherwise,
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

[...]

> +void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus)
> +{
> +	size_t boot_params_size = sizeof(struct td_boot_parameters) +
> +		nr_runnable_vcpus * sizeof(struct td_per_vcpu_parameters);
> +	int npages = DIV_ROUND_UP(boot_params_size, PAGE_SIZE);
> +	const u64 gmem_flags = 0;
> +	gpa_t gpa;
> +
> +	vm_mem_add(vm, VM_MEM_SRC_SHMEM, TD_BOOT_PARAMETERS_GPA,
> +		   TD_BOOT_PARAMETERS_SLOT, npages,
> +		   KVM_MEM_GUEST_MEMFD, -1, 0, gmem_flags);
> +	gpa = vm_phy_pages_alloc(vm, npages, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_SLOT);
> +	TEST_ASSERT(gpa == TD_BOOT_PARAMETERS_GPA, "Failed vm_phy_pages_alloc\n");

Nit: the tailing newline can be dropped.

> +
> +	virt_map(vm, TD_BOOT_PARAMETERS_GPA, TD_BOOT_PARAMETERS_GPA, npages);
> +}
> +
