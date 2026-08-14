Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D742122A
	for <linux-coco@lists.linux.dev>; Fri, 14 Aug 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693382; cv=none; b=fwwBzLeLAWG3nZgvpYGZxJeW4+lU8U7lVwZsznRDvz8HC2BC9GgJ70LafqEuhi80R1f1Jp+jUg84KHkfV8Of+c+T+ans6NnUAT0X4USuXQHM6IEZaBr3BC2LZjEyACj4C650LM/DKkUarXUa91XGm0oN5rH9VS5EGcwjoFVByQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693382; c=relaxed/simple;
	bh=bJwoA0Aev4FErXY3LlbDAWzE7ftRa4ZodZDdndiYJLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FETa3Ae8gkm3l6UOhQ9YDlQEOIVCcbOiafxA18ju97nWb1ScxvjVFikw6QWkSFr72GG3Thku8XmJh+Rzs2ajaLuVcpcvG6J20os9De1tqTCuKTJT6MF2XLwQMN1jaEBWlq+VkjG1lNBfVVdmUpTOu8jhBJClPeYRnRbyKhSWSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bo0iJzcX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bo0iJzcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786693378; x=1818229378;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bJwoA0Aev4FErXY3LlbDAWzE7ftRa4ZodZDdndiYJLk=;
  b=Bo0iJzcXicV8FLPcWm/fZZrj1XMzRBm/BIbMybj4PX1kL0TG335m2Wxw
   m47dybpIog3w6ZM62V3/VhHV5XoOikOAXqABFDCBfOEWLUuIBsFGMEOi5
   iks1Dl7MdmuPOfFwAals27IdQHJ972FfvkTtdyRx3XI6o/FKYwhgO3Ozd
   ZQBVE9qZBDmX+jaPx2rvVZX5jA1OAD8UMTIsfIV1bHOv4fuyelpCjnTTX
   WvH4uzZ1diS2Z8AmldsDCIMuIgHCWkMu97lR/gxxvltmTNfoO/RaPlqxY
   X2yT7BziRbh5nyV5IzwRBNa89yaP2y6nkF0wgsfmndhkdbNANOakbwzho
   A==;
X-CSE-ConnectionGUID: PUMJG0EeRmaGLrI6JTbaLQ==
X-CSE-MsgGUID: /HHEHZL9R2ywNM+PoblIpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112815844"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="112815844"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 00:42:56 -0700
X-CSE-ConnectionGUID: uMvM0gAqRsWjDGAQf+jg7A==
X-CSE-MsgGUID: Rig8xbGKRGS7EhANHMVD4Q==
X-ExtLoop1: 1
Received: from unknown (HELO [10.238.208.98]) ([10.238.208.98])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 00:42:50 -0700
Message-ID: <ef53ccf8-00c4-4a50-985e-425a2d40583d@intel.com>
Date: Fri, 14 Aug 2026 15:42:48 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 12/22] KVM: selftests: Require guest_memfd for TDX VMs
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>,
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
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-12-15ad654a50db@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260722-tdx-selftests-v14-12-15ad654a50db@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/2026 7:13 AM, Lisa Wang wrote:
> Force guest_memfd for TDX VMs.
> 
> KVM supports guest_memfd for TDX private memory. Without in-place
> conversion supports, all pages default attributes are private. Thus,
> set page to "shared" for shared pages.
> 
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>   tools/testing/selftests/kvm/lib/kvm_util.c     | 2 +-
>   tools/testing/selftests/kvm/lib/ucall_common.c | 8 ++++++++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 0b9d2d383bfa..4a48c4b42095 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -472,7 +472,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
>   static bool is_guest_memfd_required(struct vm_shape shape)
>   {
>   #ifdef __x86_64__
> -	return shape.type == KVM_X86_SNP_VM;
> +	return (shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM);

Instead of updating is_guest_memfd_required(), I'm thinking how about 
just replacing is_guest_memfd_required() with 
vm_arch_has_protected_memory()?

>   #else
>   	return false;
>   #endif
> diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
> index 029ce21f9f2f..c03dfc763172 100644
> --- a/tools/testing/selftests/kvm/lib/ucall_common.c
> +++ b/tools/testing/selftests/kvm/lib/ucall_common.c
> @@ -27,6 +27,7 @@ static struct ucall_header *ucall_pool;
>   
>   void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
>   {
> +	struct userspace_mem_region *region;
>   	struct ucall_header *hdr;
>   	struct ucall *uc;
>   	gva_t gva;
> @@ -37,6 +38,13 @@ void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
>   	hdr = (struct ucall_header *)addr_gva2hva(vm, gva);
>   	memset(hdr, 0, sizeof(*hdr));
>   
> +	region = vm_get_mem_region(vm, MEM_REGION_DATA);
> +	if (region->region.flags & KVM_MEM_GUEST_MEMFD) {
> +		size_t aligned_sz = align_up(sizeof(*hdr), vm->page_size);
> +
> +		vm_mem_set_shared(vm, addr_gva2gpa(vm, gva), aligned_sz);
> +	}

this diff about the ucall needs to be a separate patch. What's the 
reason to add it to this patch in this version?

>   	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
>   		uc = &hdr->ucalls[i];
>   		uc->hva = uc;
> 

