Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692137;
	b=SzqXig5vWyF41qyvRo6bXHLBF8tVtQ7D91LF1M0C8eNFE40M19YyV48S4Fmxz0LtJgQ2
	 /6DvFUPCS7JRehx8ZwsjPEUm/BtVv6J8jfxtGdjh9BXCPVNhSpdMMB/HkD98AyZIakHnd
	 9Vrw3SVSfpd7B/dfQynjaVzb2xxStHRbOjToKfH2+mx5D5wjEB/9uQZ8O2o2V7ICfup5U
	 BCGu6CZJPT8t6uEfBPn/cQulNxFPM5Gr4aVdOGfenNQ2b4zs35vbtrmrBzI4pu9l+tIVR
	 RzqPq3VNqQCNJ5wJlrnuh0/XBfDr1cGT7viFsrg6Hi5NAFqtFrhgeyqmpORbAhklBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692137;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=j3+6QZlj22C3KRvT9WxlbuN8XoIs/OIYY+lJZVFKN4M=;
	b=gtz4vLj2I2vZKPSkqovKSquyeVAJXquqYP94jeLVD9KKX46Ezpsgb/7WIsIUWkFJUpdU
	 IJMcWft2R/mV74R+NcD6POUilRhAPcmcJUBdwByGf5L/ltiaNgvBYRBomtJkXvsfzGMya
	 Od+NRqvJQf3gFE8qBDbjat4o5zM1/rGiodoCO1hYdZqpB5nhJNzJ7G2838Ha5Sot9EpFs
	 EjjC3ZTQpTNzALX+GP6gtx2eaLnPzLL9YntwILxnXsqpe4c1NMLRkPDHZqX0Z0AdaPK1w
	 URwRM8wYowC7Rnv4kpEfyhvg8wbmqgIGLYjThGjJYTBiJZyygrBrva1MyT3vDmmoLxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQkugbbc;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981F606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0981F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QQkugbbc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793692135; x=1825228135;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+UM/Ge+E/pw3AGwAIfSOVxG+dRmxQkg4+UbXH+t3FHc=;
  b=QQkugbbclbV6/PuuBv5qdBIBYN+0wChUuHznvFaiT9QxsytzD6wN7+Fx
   f0hNShYu6oQVaVVRHIRN3/c9DvyRTYRfGxiWp5uPfP2onnvgrh+yr08qP
   GWLLUpGWIqU2JkxnlFCuhEUTaq26jc7m+P0XeW+hoeOI78A5oniz8ZN4s
   Cx2cjKtYU9KxGptq7kfFfGg1YQYIF+tbnmANdxB8zBA4MK5vldBI6kJU0
   UboWfVuF90PPDavxPEjaEB/zMh2u2sqAHuIN7mGs6PT+lT9DzjJ5qACuc
   jDYRDbAkLbP9J+cn3AIpT9YIlxASJg4MSM2HhEq4/DpEWig7hQdPiiNAf
   g==;
X-CSE-ConnectionGUID: e1tqm3obSe6ksc5QL6jJ7Q==
X-CSE-MsgGUID: uoA6WaRbTmq7b0qp8r+CzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2417043"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2417043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:48:54 -0800
X-CSE-ConnectionGUID: oajGUKO9T72TTrAYu0bfKQ==
X-CSE-MsgGUID: sL+OcZBfQXaPipPOvastrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6210509"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:48:50 -0800
Message-ID: <0d8327a4-9cd8-4346-8949-57f37e844da2@intel.com>
Date: Tue, 3 Nov 2026 15:48:46 +0800
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
Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-9-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> TDG.MMIO.ACCEPT verifies and accepts a pending private MMIO range for
> a trusted device.

According to the latest TDX Connect ABI EAS that has been published for
community review, next version will switch to use TDG.TDI.MMIO.ACCEPT instead of
TDG.MMIO.ACCEPT

...

> +int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32 page_cnt, phys_addr_t gpa)
> +{
> +	struct tdx_module_args args = {
> +		.rcx = gpa | TDX_PS_4K,
> +		.rdx = index,
> +		.r8 = func_id,
> +		.r9 = (u64)pg_offset << 32 | page_cnt,
> +	};
> +	u64 ret;
> +
> +	if (!IS_ALIGNED(gpa, PAGE_SIZE))
> +		return -EINVAL;
> +
> +	ret = __tdcall_ret(TDG_MMIO_ACCEPT, &args);

We will use __tdcall() instead of __tdcall_ret() in the next version.

Though the API spec lists RCX and R9 as output operands, RCX and R9 are used by
TDX module to save and pass the intermediate states for next run when
TDG.TDI.MMIO.ACCEPT is interrupted. From guest kernel's perspective, it only
cares the return value of the TDCALL. So __tdcall() is enough.
