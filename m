Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267AE223DE5
	for <linux-coco@lists.linux.dev>; Thu, 20 Aug 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217418; cv=none; b=fGV2weUpqdNKBH81hVv4+y+Vc9WNCnhClS1JEP5GKZ2qpYQo4kVmxGFhvg5xQ1vyprlbNU/M1/DE3me5evOdpYrovuXlk0aMBLCe0ZvKcVQIdzbz6fG6Kxt2C/rrLXSy+Ml4oFm1633vuweamYpXgRaDfyAk7O6gcYLYHHeakFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217418; c=relaxed/simple;
	bh=OcK1XeB/oES2jjju8v7YLFTQOGdMXWCoRjtczQaI7pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSa+GoHUeIKxqMISDe+At/ZpfmEQ+H/1OtDDzxZbl9q9XWQ4m8Yq3YO6BAdzscCyEZ630pK6nEv5DHtpCdtThVFpMJZarVu/1XuiZFFZgy8+/LzN+EjWANwrMllJgHBeHdLBbDfqLwMB7LQJ1FGoBHsGBhE8MHMRYcPBy0UqmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0PweAQh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0PweAQh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787217416; x=1818753416;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OcK1XeB/oES2jjju8v7YLFTQOGdMXWCoRjtczQaI7pc=;
  b=B0PweAQhmsjfJNPzlNQ1nVMSHW1IbFWlZUO8mbLoBj6X2lhtehiY6mVO
   tM2mEA0YiyaQID8nhCdud92OglnOfCxsvOtFTD/cbEkbt72uPxmTVHJ3n
   DGRGqPsjLY2y201GLAopGgt0pp/tlKXomKudzpSB8NOQJy2/Mt16zqmWT
   syWRfGq12Iyptw920ic0ty28SuVuuzMTxMXD0UIBCo8IjW019QCPKF9+A
   vfHkHOsld9Qbmom1NM0TT0PeHrhSlW3B/nJ4IV8DmF9V6HO4TwySTfcGU
   LbVd6yPlJ7PojVHwAHPfYCL/ja+tvT1UdVLX8QPNOqJgnutWKSmdS/xRz
   w==;
X-CSE-ConnectionGUID: IT0teKXrS3mYo4FUt9mqpg==
X-CSE-MsgGUID: mMj85rj+QwCxslzZr+OWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98081031"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="98081031"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:16:55 -0700
X-CSE-ConnectionGUID: uQZSR3OETIql6TbglzUd0Q==
X-CSE-MsgGUID: /sQQUsjqS8uruyqAssLr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="265957028"
Received: from unknown (HELO [10.238.2.33]) ([10.238.2.33])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 02:16:53 -0700
Message-ID: <3898d89d-28af-49c9-bf0a-7cd0b32cc8d5@linux.intel.com>
Date: Thu, 20 Aug 2026 17:16:50 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] KVM: TDX: Set bits 31:16 to 0 for the synthesized
 Exit Reason
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 nik.borisov@suse.com
References: <20260819094903.3060020-1-xiaoyao.li@intel.com>
 <20260819094903.3060020-4-xiaoyao.li@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260819094903.3060020-4-xiaoyao.li@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/19/2026 5:48 PM, Xiaoyao Li wrote:
> Set bits 31:16 to 0 instead of all-1s for KVM's synthesized Exit Reason.
> 
> KVM is going to support Bus Lock VM exit for TDX, after which bit 26 of
> the Exit Reason becomes meaningful and indicates that a bus lock happened.
> The existing synthesized Exit Reason, -1u, will cause a false positive in
> that case.  Change the synthesized Exit Reason from -1u to U16_MAX, so that
> bits 31:16 are set to 0.  This also avoids the potential issues when other
> bits in 31:16 become valid in the future.
> 
> As a bonus, the check for synthesized Exit Reason in tdx_failed_vmentry()
> becomes unnecessary.  Just drop it.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
