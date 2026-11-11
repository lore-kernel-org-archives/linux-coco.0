Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376934;
	b=T7W9MTiu7k/DivwGNVjc2it2gYkNOrdlcrVCEpwSIxp0ID5lYQIfzyi7muKZrtXVL9os
	 1bqlpe8xqeqbY9ixdABwz88YDbzP9tveLiSWizIARz6X7sgBGKaWeOaLkCLbiqZH9EMaP
	 ziVQNFObgpVa3TjFL3lS/sO8ZlZHIYft3h8fDn34CG+aXXkbs92gqcj3wNlVdwqQ+lICi
	 uAmpYrp4102kGqHO7zK7n4Mt5hVJMGmxQTrb1KAHkrGU5oOP7YxlmLth8RzgVQO2rhy7R
	 Kw2tKfK595SYZkLTxzdMoFLR+evYvpyLVBNCI9HXbMgCrtyS9gWeAMeKhsIOk5eIaKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=EBXimyKc1it/KxK5bNdiXlKjJH276vdebWnV1cX0e3Y=;
	b=GIo0rbpvtxpNlkSskKxHqdv8cDkAswspkTFwJPZ+9Ro13ArIaMsJ3PK+eYsaS67mgpMM
	 M4q4dew+dDMTtq8IWGia9Y0R4oju9UpoCNeDiYVFnEBBnhEz+gbWa7uf4hVu3joWV7/Ww
	 jYxQLlvl7Vit7ArsX3v0nc45X0IqW/kh9POc6ViFYNNSEyVDuXYMj/3H3yGM3D7+oo8Wt
	 8JdiMy8W9yjGuJpMud3xr7EcWTu8Cg4KpBbC6LIhFMaSMTxrFPVfUkZK+kfL4Us7tbDP7
	 c0c6P/KksqJD8a0yqNQ7cG2X+SrE6MGwC0d+IHUnQ9zopuix+qI/65Z41pDuJAYRz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NgVMS82/";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AC7606AC6C
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 06:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AC7606AC6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NgVMS82/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794376933; x=1825912933;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2/6PoKpF2TFtdqVTOCp6q1iPfEWPxp8sOLejEI8tLVk=;
  b=NgVMS82/iqpAZx7/Zr8hGfcWFmgxVvPclNY88baEMW8LkzXJLE2amllL
   Ir7HWaataIhQqgbekEF91pb+BG/c5fHtciBOjZeRXw3MTxCTryE35PEkW
   4BohapBLhd9vykgvWpGtFeQE/B/tRglQV9QZzdxdcnMeyFkgAygGATd+q
   V3lLFwVfX1Z/rduEVMp8BpH5PTIYFIv6rPNLYkoSi1wtIgVA/IM7isNt0
   U6cwOzLcOC6G11++hhqOcJXlTYqxpS7Sm8ttrOZYL0haZvQMbBvqX3YWR
   BdHiZhn2Q805I36CIz0qQZDEE0CaakHXB23YA3srG8yS5ikx/Hw4lF8LM
   Q==;
X-CSE-ConnectionGUID: jwB5SqC6TryINPsF/uCHDA==
X-CSE-MsgGUID: 3tvQRQ37TESFylRY2I/4xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3147437"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3147437"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 22:02:13 -0800
X-CSE-ConnectionGUID: tsvKuNOJQsmrUuC69pHrbg==
X-CSE-MsgGUID: iwByyT5kTcuDOj/gnAcyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="10076430"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.71]) ([10.124.240.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 22:02:05 -0800
Message-ID: <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
Date: Wed, 11 Nov 2026 14:02:03 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
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
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/2026 7:46 AM, Lisa Wang wrote:
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

Reviewed-by: Xiaoyao <xiaoyao.li@intel.com>

> ---
>  .../selftests/kvm/include/x86/tdx/tdx_util.h       | 22 ++++++++++++++++++
>  tools/testing/selftests/kvm/lib/x86/processor.c    | 27 +++++++++++++++-------
>  tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 11 +++++++++
>  3 files changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> index 4330290d29e9..9d951f67b3b5 100644
> --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> @@ -46,9 +46,31 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
>  		    #cmd, ret, errno, strerror(errno), hw_error);	\
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
> +									\
> +	TEST_ASSERT(!ret, "%s failed, rc: %i errno: %i (%s)",		\

Nit: tdx_vm_ioctl() uses %d for ret, while it uses %i for ret. It's better to
make them consitent.

I think we can fix it when applying.

