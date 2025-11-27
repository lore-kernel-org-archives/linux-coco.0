Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAF82609DC
	for <linux-coco@lists.linux.dev>; Thu, 27 Nov 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764232252; cv=none; b=Mi6sYCR563yUT4LnL2u5YYx4Ff9BNgCj33MQsrzk2V8POam8cJfpnq5rtNLOyWGvGeV8h2+qv8p3+tWN0YfDeF8gl9VFhEjz9RS+1Da5B5dpNoaBcropMURcO5hsHoeCQKCZ68CoJtQnf4uTVF6mhVrC2dzp7KuYxmE6F8c8uwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764232252; c=relaxed/simple;
	bh=0UbsaYGRw0dstVOFpeBwGkMGwT1sZsEGI64YARK7wwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbcBtYmGdSWs0wC7bbEGY3Y3kGStSBjDVd6owpryvYks7YStfrj7gZ3Eji9QHcn9ZgdjzBcglF6LrTOOJi3OBs9ji+9Tp2+I2UYot6lGKkD/tEwlJK6A26RQuuKDHz5xd3X11ZixcVQ5Nxp2b6lr3ig6eOCpQs4slZ0mW82m2hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pq7/0zOi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pq7/0zOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764232251; x=1795768251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0UbsaYGRw0dstVOFpeBwGkMGwT1sZsEGI64YARK7wwk=;
  b=Pq7/0zOincF/Sf1uTLKvDbMPMJcgCZlEreOejIO0+DJ+Wea2vjMm9v59
   n02mGpTidIBev6Yo8iOG++k6NiN7pNMFzUDcB3o5g0KNAw7Gt1Hh1FX19
   x/8hA5hwcktSPz567ZbYc2wQRxFNdunB+GRsM1JZ/+iB3M1GztEDpDcat
   iQqD2ecLn3tBrJ4yJu55Cks2PbiA3si2OqjQiUbNIqhHkWBvYVcyfdmBt
   R6VN52Eb97CB6XnfniH2rxVvAs+uvaOcGYyu/kj6FW1f96bYH40s249+D
   waYx0ZOyDcfXigu8yXtP6zCxh2JzI0O5wWtMMqAE3pO4wmgqqZGDFM29J
   Q==;
X-CSE-ConnectionGUID: hHQocRgTQaSJvv8ArAxCkw==
X-CSE-MsgGUID: Xt3i2BQ6Qby4gBJB3yFq8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66167548"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66167548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:30:50 -0800
X-CSE-ConnectionGUID: gwb1YWkISiGPabdN1aBBHA==
X-CSE-MsgGUID: v/ZfYHWATIyUMrA6jM5a6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197333731"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 00:30:43 -0800
Message-ID: <a8073390-b952-43a1-8e63-18c2a10bb721@linux.intel.com>
Date: Thu, 27 Nov 2025 16:30:41 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] x86/virt/seamldr: Allocate and populate a module
 update request
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-12-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-12-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/1/2025 10:52 AM, Chao Gao wrote:
[...]
> +
> +/* Allocate and populate a seamldr_params */
> +static struct seamldr_params *alloc_seamldr_params(const void *module, int module_size,
> +						   const void *sig, int sig_size)
> +{
> +	struct seamldr_params *params;
> +	const u8 *ptr;
> +	int i;
> +
> +	BUILD_BUG_ON(sizeof(struct seamldr_params) != SZ_4K);
> +	if (module_size > SEAMLDR_MAX_NR_MODULE_4KB_PAGES * SZ_4K)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!IS_ALIGNED(module_size, SZ_4K) || !IS_ALIGNED(sig_size, SZ_4K) ||
> +	    !IS_ALIGNED((unsigned long)module, SZ_4K) ||
> +	    !IS_ALIGNED((unsigned long)sig, SZ_4K))
> +		return ERR_PTR(-EINVAL);
> +
> +	/* seamldr_params accepts one 4KB-page for sigstruct */
> +	if (sig_size != SZ_4K)
According to the link [2] you provided above, it seems that the layout of
tdx_blob as following:
tdx_blob
|- u16      version
|- u16      checksum
|- u32      offset_of_module  --------------------------------------|
|- u8       signature[8]  |
|- u32      len                                     8KB + (N * 4KB) |
|- u32      resv1 |
|- u64      resv2[509]  |
|- u8       data[]  |
             |- _u64 sigstruct[256]   //2KB sigstruct  |
             |- _u64 reserved2[256]  |
             |- _u64 reserved3[N*512] //4KB aligned, optional, N >=0  |
             |- _u8  module[]  //<-----------------------------|

If N is not 0 for reserved3, then the sig_size passed will not be 4KB.


> +		return ERR_PTR(-EINVAL);
> +
> +	params = (struct seamldr_params *)get_zeroed_page(GFP_KERNEL);
> +	if (!params)
> +		return ERR_PTR(-ENOMEM);
> +
> +	params->scenario = SEAMLDR_SCENARIO_UPDATE;
> +	params->sigstruct_pa = (vmalloc_to_pfn(sig) << PAGE_SHIFT) +
> +			       ((unsigned long)sig & ~PAGE_MASK);

Since sig is 4KB aligned, is ((unsigned long)sig & ~PAGE_MASK) needed?

> +	params->num_module_pages = module_size / SZ_4K;
> +
> +	ptr = module;
> +	for (i = 0; i < params->num_module_pages; i++) {
> +		params->mod_pages_pa_list[i] = (vmalloc_to_pfn(ptr) << PAGE_SHIFT) +
> +					       ((unsigned long)ptr & ~PAGE_MASK);

Ditto for ptr, very ptr is 4KB aligned.

> +		ptr += SZ_4K;
> +	}
> +
> +	return params;
> +}
> +
> +/*
> + * Intel TDX Module blob. Its format is defined at:
> + * https://github.com/intel/tdx-module-binaries/blob/main/blob_structure.txt
> + */
> +struct tdx_blob {
> +	u16	version;
> +	u16	checksum;
> +	u32	offset_of_module;
> +	u8	signature[8];
> +	u32	len;
> +	u32	resv1;
> +	u64	resv2[509];
> +	u8	data[];
> +} __packed;
> +
> +/*
> + * Verify that the checksum of the entire blob is zero. The checksum is
> + * calculated by summing up all 16-bit words, with carry bits dropped.
> + */
> +static bool verify_checksum(const struct tdx_blob *blob)
> +{
> +	u32 size = blob->len;
> +	u16 checksum = 0;
> +	const u16 *p;
> +	int i;
> +
> +	/* Handle the last byte if the size is odd */
> +	if (size % 2) {
> +		checksum += *((const u8 *)blob + size - 1);
> +		size--;
> +	}
> +
> +	p = (const u16 *)blob;
> +	for (i = 0; i < size; i += 2) {
> +		checksum += *p;
> +		p++;
> +	}
> +
> +	return !checksum;
> +}
> +
> +static struct seamldr_params *init_seamldr_params(const u8 *data, u32 size)
> +{
> +	const struct tdx_blob *blob = (const void *)data;
> +	int module_size, sig_size;
> +	const void *sig, *module;
> +
> +	if (blob->version != 0x100) {
> +		pr_err("unsupported blob version: %u\n", blob->version);

Based on the link [2], 0x100 stands for version 1.0, Using hexadecimal seems
more readable.

> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (blob->resv1 || memchr_inv(blob->resv2, 0, sizeof(blob->resv2))) {
> +		pr_err("non-zero reserved fields\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/* Split the given blob into a sigstruct and a module */
> +	sig		= blob->data;
> +	sig_size	= blob->offset_of_module - sizeof(struct tdx_blob);
> +	module		= data + blob->offset_of_module;
> +	module_size	= size - blob->offset_of_module;
> +
> +	if (sig_size <= 0 || module_size <= 0 || blob->len != size)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (memcmp(blob->signature, "TDX-BLOB", 8)) {
> +		pr_err("invalid signature\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!verify_checksum(blob)) {
> +		pr_err("invalid checksum\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return alloc_seamldr_params(module, module_size, sig, sig_size);
> +}
> +
> +DEFINE_FREE(free_seamldr_params, struct seamldr_params *,
> +	    if (!IS_ERR_OR_NULL(_T)) free_seamldr_params(_T))
> +
>   int seamldr_install_module(const u8 *data, u32 size)
>   {
>   	const struct seamldr_info *info = seamldr_get_info();
> @@ -82,6 +232,11 @@ int seamldr_install_module(const u8 *data, u32 size)
>   	if (!info->num_remaining_updates)
>   		return -ENOSPC;
>   
> +	struct seamldr_params *params __free(free_seamldr_params) =
> +						init_seamldr_params(data, size);
> +	if (IS_ERR(params))
> +		return PTR_ERR(params);
> +
>   	guard(cpus_read_lock)();
>   	if (!cpumask_equal(cpu_online_mask, cpu_present_mask)) {
>   		pr_err("Cannot update TDX module if any CPU is offline\n");

