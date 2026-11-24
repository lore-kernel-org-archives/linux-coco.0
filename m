Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500136;
	b=LWzR6LjjvtZWe/m6Pc0zn+AZ7VMr9WRBpVPnmpFHC3FXyMjZjEl/c7a42iR8gkgDkj+A
	 c32xqQKiB8aprid0mDqQxyvfBbWweSdQecbaPL6B4gkEFouyAlsiE2zjvHST98Ix/aMzV
	 2+W09gHZPg+20e4VTZ1srgnwkbRteEgRzo17hBkT5V92w4Z1jveHpBrwkJAWZyWdjiOwq
	 O26Ixou5whgGjyFUEOnGFHUa1/oEh5BDDSA9TpwYtPeqy4qpZvtB3eY/Ga1TIJJO203Ex
	 bSgcJj+jZYPlAs77Wd1TJdMDk60JsyQtY6MHOzBHUX09YYNWj516FvasG5w6dO4+S8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9pDRO5ltpq5QTRdjjDIpq0NgTGiXCCJLblQwoeNurk4=;
	b=wxAbNhcR6s39+KGcbIlLPUNMChBlISYhm6mPO9xmOwVvtFDPCt162qMQiHGGGm1xqTmc
	 c3wDJWrptxhSuRzB2R6G/Vy0xs6wk8h1pDLJ8S6VE33P+XS3pknbQcH8vcCnrD4UYyZ8R
	 mpI41TmGy5hannhv/mYkv54BNC462gMavF+Jwrcwp/6lxXNYHk+wnIR/zslZ+HRG2dGZl
	 eMZ/fEPuDck5tmDzfHdLpffBzc4pFv86zhtE0Xk+S82Eaq8P3toXZoZkrTnCtq/fogLZo
	 Potp0gDIYOT1bo8USCsqnqFhG0/yIZHIiyWOf5DhAUyGtB+ocWK1Lm1Q31lA6jdXO3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Az+Ke9y5;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A86606A321
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 06:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Az+Ke9y5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795500134; x=1827036134;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ij2lL/q/u1LAPbmRv+/yIYCMrX5T6HDEQ4wEKA0is64=;
  b=Az+Ke9y5NzKOlMUEPDXAVNcH4JuVu2gmGMTXLRSb597z2BnKDY+GJ6NN
   Z4HjUGjt/qOeSin+IazGt6oqnoeamORElzQRW4gb/DC08pYv+fX56W+Yx
   G/diOHQKSNTgr+aV40PgBWj8Fu50yWzaxB9YsKMnmkLLL8eS032cKpSRN
   CRYfSyseHikSP7A/TDkOve/4u1TzVC1G1qf5W3qLDH+r1v1zpGv3tiiY/
   U1RTrcgPcXjSSRFn+9D3mV7uTvVlM2CLP4BhQVgWrDDYO37oRWdDPemuj
   D/vJXNKCzbn/zkENOtXYvHa5WuJUm/5u5/4h3AlQxct3rEfT05n+E6N6w
   A==;
X-CSE-ConnectionGUID: yg99eHbpSCeMxWcqnw4+Uw==
X-CSE-MsgGUID: IZ8tI+7vRMG92GLqjc3IVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4218877"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4218877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 22:01:41 -0800
X-CSE-ConnectionGUID: aa5SVtYERxOcdASovpuqqA==
X-CSE-MsgGUID: QrlUm4V+Qk2UHeu9FvxoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11774824"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 22:01:35 -0800
Message-ID: <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
Date: Tue, 24 Nov 2026 14:01:32 +0800
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
Subject: Re: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Hi,
> 
> This is a complete TDX Connect phase 2 guest-side implementation. It's
> based on Dan's last TSM Phase2 [1](rebased to v7.3-rc4), plus Nicolin's
> PATCH3-4 in [2] to address Jason's comments at [3].

Hi all,

After going through the whole series, I found some opens/issues about the TDX
Connect arch and want to get your feedback.

1. The requirement of R8-R15 are reserved to 0 on TDG.DMAR.ACCEPT.

   This is the first leaf in TDCALL/SEAMCALL that explicitly requires some
   unused  registers to be 0. Without justification of why it must to be such,
   we are going to propose to remove this requirement and it helps drop the
   PATCH 13.

2. Add 'TDI' to the names of TDG.DMAR.ACCEPT and TDG.DMAR.RELEASE and maybe
   rename 'DMRA' to 'DMA'

   TDG.MMIO.ACCEPT has already been renamed to TDG.TDI.MMIO.ACCEPT in the latest
   public TDX Connect API spec, to call out its scope is TDI. It's better to
   add 'TDI' to TDG.DMRA.* as well to make them consistent since TDG.DMAR.* also
   operate on TDI scope.

   Besides, DMAR means "DMA Remapping", which is an IOMMU capability. Without a
   virtual IOMMU for guest, the guest should just care about the DMA capability.
   So it looks DMA is more accurate than DMAR.

3. TDG.TDI.MMIO.ACCEPT requires TDI to be in the ASSIGNED/ACCEPTED/RUN state.
   After TDI is bound by host via TDH.TDI.BIND, the state is BOUND. It requires
   guest to call TDG.TDI.RD read the TDI_GET_BIND_SESSION_ID, which changes TDI
   from BOUND state to ASSIGNED.

   This is a hard dependency for TDG.TDI.MMIO.ACCEPT not to fail and it's not
   mentioned in patch 12 where the call to read TDI_GET_BIND_SESSION_ID is
   added.

   The SESSION_ID is used to ensure the host doesn't bind a new TDI after
   guest attests the TDI without guest's awareness because the SESSION_ID is
   verified in the following TDG.TDI.START. And making the read of
   TDI_GET_BIND_SESSION_ID to change the state machine of TDI from BOUND to
   ASSIGNED, make it mandatory for the implementation.

   But it doesn't make sense to assign additional semantic to a metadata reading
   behavior in a specific phase. Instead, we want to propose introducing a new
   dedicated TDG call, e.g., TDG.TDI.LOCK, which needs to be called by the guest
   to lock the TDI after it's bound by the host, and it returns
   TDI_GET_BIND_SESSION_ID on success.

4. TDX_PAGE_ALREADY_ACCEPTED is listed as the possible return code for
   TDG.TDI.MMIO.ACCEPT while the description of TDG.TDI.MMIO.ACCEPT reads:

     If the page is already MMIO_MAPPED, skip the page.

   They conflict with each other and lead to confusion. I checked the internal
   implementation of the TDX module and found that TDX_PAGE_ALREADY_ACCEPTED is
   returned when the guest is accepting at 4K level but TDX module finds the gpa
   is already mapped at a higher level (e.g., 2M).

   Considering current TDX Connect architecture only supports mapping MMIO at 4K
   level. We are going to propose to remove this error code for
   TDG.TDI.MMIO.ACCEPT for now. And leave it as a future topic to determine if
   we need such error code.
