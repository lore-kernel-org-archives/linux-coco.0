Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372618;
	b=lK1okRCyxu/H/CIR+YtqxVmUClGpaoOxIUJ3ghZH9tNKPyV08pTd6kio6N0HyaC0FWHy
	 z2Jduk6DkHeAuzYDjRyQdDKHOyUWUh4P/+q2aia34RHzhqGGb9bRdYjAo1hoCMZjYbQYz
	 jSBnSvVhL/SukVYVmJ6+jZeo8LNGefpviXAf45Oe3YBl+I/N7w2TRYf6+lZBA1webX3NY
	 4wC3hK8x4Q1HWQqjix2OwNMwqmLvjie7PuKRmMh73asPG4fGfRXe1Ee/67NPDcGw+R5Uu
	 S9J6mHlchHlj5fB6dy1eajSuhv0Pbiz5D1ciYbYPaCt5deP6ZVyVwidrW1BCgbG61/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GucDm2oz81wKTevTqbqEwI8JkuvXZ6eoYgO/mA1WjyU=;
	b=u+F35tBdIQMVdl5GBLiTjeHIFD8iIkZjk4u0N6tPPt7SiwalA91RybXhEd+5J72v+d94
	 ETgiIxpkThUUVkbCkZHaAmCWIP66Ppu615zOySEdFqW90HkA3IcYkE9BOQuMyWZ6eYxNj
	 wCyPKcnFDKsfMgkrqPn2+8URLqSli/iYpn+CmK/3uYvLFmpoujfgYvLQwKH+fwzfqKLeY
	 Og9E8C7GL+PAAiEYx2WKyEA+6B32V70sTVXcWSTAchWtd2HZmfU7j51qBtIBAypuMsGuJ
	 4rFrgYp+Aie1acQHQ0Eb+hRT1AQEyV6LrT5B6umF1hSe6twuoK3R/tdwD5BKr/IConA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5XPqJhI;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9B2606A31C
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 04:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5XPqJhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794372618; x=1825908618;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ljcrNKbpAZvY29Hoai/6dYOKOIn1MHeJbxONLN+KZis=;
  b=N5XPqJhI2xZUqyK4fakr82V+DoQDJQEe4BN2kuukyKY4IKW8DVgZhRyE
   qYpTr/vFZ1KuvrHjSkD/HzozyMwL6PH13OeLAV8qPA8xwOW0rQ/TIdl5I
   g1qvdxTxgCkWRZnikO6Qvnia27wed7x7N82G6HmvwqYWvxwbFEvS+CdmY
   s6YhDpMOCU7zpET+089C6caF50MP99NFh5502Ma8dvX369kwJM0Hu6x4m
   1T6fgGxD10kUoGciwjHTHTU76YNoqZG30APKKUG2G7LPsLEWXu3P1uDCq
   8S9iyB7gPfkSPFIDvZfGdwQLoY8h1/peYHct3RgclPQzECr40U6D4WCjS
   w==;
X-CSE-ConnectionGUID: SIEa9jjyTXyTOoFAK/HyDg==
X-CSE-MsgGUID: H82ILXnxT1qQo4gwHM2CUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3056842"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3056842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 20:50:17 -0800
X-CSE-ConnectionGUID: RNtq6VTrRyq6Mn+kkbUsKw==
X-CSE-MsgGUID: /Ga9LHOsTL+GMDFg52Zw+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8754365"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.71]) ([10.124.240.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 20:50:12 -0800
Message-ID: <63efac33-22e7-4e4a-8fc4-20497af51927@intel.com>
Date: Wed, 11 Nov 2026 12:50:08 +0800
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
Subject: Re: [PATCH v16 03/20] KVM: selftests: Initialize the TDX VM
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
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261105-tdx-selftests-v16-3-2024e8fa517a@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/2026 7:46 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> Add tdx_init_vm() to handle the mandatory VM-level initialization
> sequence required for Intel TDX.
> 
> For TDX, the VM's CPUID configuration must be "sealed" during
> KVM_TDX_INIT_VM before any vCPUs are created. This is necessary because
> the TDX module does not allow the host to create and initialize any
> vCPUs before the VM's CPUID configuration is accepted and sealed into
> the TDCS.
> 
> Additionally, to satisfy the strict requirements of the TDH.MNG.INIT
> SEAMCALL, the helper masks the KVM-supported CPUID
> (kvm_get_supported_cpuid()) against the "directly configurable" bits
> reported by KVM_TDX_CAPABILITIES.
> 
> Co-developed-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Co-developed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
