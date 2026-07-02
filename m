Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29C35B65D
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782976848; cv=none; b=igV7a4s4gxsmSmF29zs9ABpBx/OZNni8FmS7bYLe20jyXQN2cvtvM1VeK24MCzA4SjlGRoHliX274UF3Bsd1KZruwEeWZBD2O9/I+sJ2EtNw82Ircu4ZOlNqwHwHH7knjEqA86DWY+CdcR8PQykCmS78Y1Dsg/yKFI+lr8ANCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782976848; c=relaxed/simple;
	bh=Rik/cteAmaVB5MZ1qJF+opeiZVcZYXeAGO8XUC+b5DI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHAYZFOE6L1s99kf4tD+P6EkW0za90aE3vCLDq1lNVOTKjfnCEF+SxgpDXY6ghHr+NZLOhP5ZjvuJYP9Km//yLsT+RmEjEUyfeEFS7JiM725ld46PBuDT2YxwdCgAe5PusNtPsWoqsfJ0Qb/pRa/chJOED7r2APduUZPd5PDswA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ak9OC5GO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ak9OC5GO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782976845; x=1814512845;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Rik/cteAmaVB5MZ1qJF+opeiZVcZYXeAGO8XUC+b5DI=;
  b=Ak9OC5GO9Ewy5Pap+2qEBckUikMj7P38PB7JFZ1j5HtAQUHEvlsa1gP+
   niV+tCF7didQIuhAoVooBe2sPtMLYXaAmFPSiOSPcomROW0WZ6UZj7x7U
   xqX114fbGI+lyJm1ATcbTrvZEb39cugNRqUtKHUdz+PNPnJTf+VjT//J1
   uopRnLj6x/CBwTUa/uDaGSdm/1jlDWCL3LI/1uwvXWeEUsJsptzDT9cn/
   /9OEftfAU3t3sQaRPLuS11wIqX6fGktRPBuPGvxNmsBbsLJGNupUOeOjF
   k4IhGnPMMRCtUsJG98uht/Rqf6qWZpWSKfbdDYSkl2HmfiQinuu/Icz1H
   A==;
X-CSE-ConnectionGUID: g7r3ROKGR1aPDlyJxT8BFw==
X-CSE-MsgGUID: 8g+f2Kf/SZWlW0VftI8DLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83498368"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83498368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:20:45 -0700
X-CSE-ConnectionGUID: l5lPfuMoRBCG2CIhXD+8dA==
X-CSE-MsgGUID: Q6Jb8h7mTsmU8u4vRhb9tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257674244"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:20:39 -0700
Message-ID: <ca22e5c5-9742-44fa-9c47-e4134e832d49@linux.intel.com>
Date: Thu, 2 Jul 2026 15:20:36 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] x86/virt/tdx: Allocate ref counts for Dynamic
 PAMT memory
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-5-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-5-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> The PAMT memory holds metadata for all possible TDX protected memory. Each
> physical address range is covered by PAMT entries at three levels (1GB,
> 2MB, 4KB). With Dynamic PAMT, the 4KB range of PAMT is allocated on
> demand. The kernel supplies the TDX module with page pairs to store the
> 4KB entries, which cover 2MB of host physical memory. The kernel must
> provide this page pair before using pages from the range for TDX. If this
> is not done, SEAMCALLs that give the pages to be protected by the TDX module
> will fail.
> 
> Allocate reference counters for every 2MB range to track TDX memory usage.
> This can be used to handle concurrent get/put callers, in order to
> accurately determine when the dynamic 4KB level of Dynamic PAMT needs to
> be allocated and when it can be freed.
> 
> This allocation will currently consume 2 MB for every 1 TB of address
> space from 0 to max_pfn. The allocation size will depend on how the RAM is
> physically laid out. In a worst case scenario where the entire 52-bit
> address space is covered this would be 8GB. Then the DPAMT refcount
> allocations could hypothetically cause the savings from Dynamic PAMT to go
> negative on exotic platforms with sparse, small amounts of memory.

Nit:
Do you think it make sense to print the memory size allocated for
DPAMT refcounts in the kernel log?

> 
> Future changes could reduce this refcount overhead to be only allocating
> refcounts for physical ranges that contain memory that TDX can use.
> However, this is left for future work.
> 
> Assisted-by: Sashiko:claude-opus-4-6 GitHub Copilot:claude-opus-4-6 Sashiko:claude-opus-4-6
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

