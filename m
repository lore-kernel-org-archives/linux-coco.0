Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992138;
	b=v6Y78fQALIh2/PecAQbWkdyxLX8SvruN6z3zZtO6hEpe61dZdndvBu0cGPjJowjiTrXe
	 I+TF+3HxSzjkHgu9BGPzBbLPPihbOaXa6fe2vCBOxwuZbvOKbPcSoAUOlAic1+ppsd3XC
	 HX27JmAukkBKHI94/NzahgVxgPo14jQ3J7XHtiiNKRHOTMfNvDtJ8CkrYCtNC1A8VZlse
	 kZy1KxjQQ/fJMilaONh3EKxE1s2Jfkcc5ogcsEq/Wld8z+XDvrC78uefn5vTfMgzUtGhw
	 1qhLdyazhLXZ5UvGv3RRyubOT/Q3z7BOw1TT66Y4sFR/kpD6NOBltNYurJf7nnbJrAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992138;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=a3+AM3BXphoQvusxdt5kqUDGXb7ONFez74wStDwMrOw=;
	b=T3MvdFQXybvyvFjKTbOvDjh2zgTPEm+BP9nlQgH4kk6czDEYI+HjCDAa/JxdYmxhrGg0
	 GoLytxaqX5IdiYEX88IV+N+5qD3VE6GaLRdRZT9JknA416QBBMHikor0vJzq1+rZIcSwb
	 FpFBkW+bPFVENxWhleOFL/0n7ZoPyih2mjOewd9OCkmLZUOmhx5M34KTLbl2IWCNptqBX
	 BqF2cFPTDqcdSs2110pOSagbgtFh4FHHlSoUgzPPzR72arInqZsGaG728S+ZCBLgejpsb
	 zyvcXvhybzfmh1QCZN7WPj1qcS53NoDS+SU5gHp7dieipxE35bi3tvklB1CPhNeBbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hUjpov/n";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12258606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 05:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12258606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUjpov/n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792992137; x=1824528137;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=J2MJUBRen/oL6+2XDjzStYE8CzYphJtLNZoAlP71i6o=;
  b=hUjpov/n+EIphJCELVsm2xV5rn1JLS/zBu8z2z3JtW93PvZFtxsRGkHp
   oUdkSqWOO2kBwQAxSncTNAEM89KjqYS3ph3AEE9WAtzn5YgNX0CrWPChi
   wVduNFtbsEWh3109sZvOeW6Varkh1G/8voCxW6XoAMu3V993Z5Y9a5fcL
   DmWfzYvQz3U6gIjpRRwptG0Fmwvf2QoFSOr5W8/vgsqDdyw+Gw/0Z51D+
   L4aBiLGjVp2nd4eWGoXNDPkILjrQS6Dnn6uSmHxytbFRamHtKReBrURdZ
   C6/nopM1Esp1sTilVMX4te3jNlqyeHNMMZs+rqnn5/LwcpP4ODkexwtwP
   A==;
X-CSE-ConnectionGUID: UtJQmp/CSqGW8ygC1O73vA==
X-CSE-MsgGUID: as5yBuomT4inG20bEH2YTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1637939"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1637939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:22:16 -0700
X-CSE-ConnectionGUID: jgRKomq1SZKcugIk4XoyXw==
X-CSE-MsgGUID: VAAsxib6QcC7hZEJvkEhRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4569149"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:22:09 -0700
Message-ID: <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Date: Mon, 26 Oct 2026 13:22:07 +0800
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
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-11-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Build private MMIO descriptors from the TDI report using the PCI TSM
> MMIO helpers and accept each private range through TDG.MMIO.ACCEPT.
> 
> Keep the descriptors while the device remains locked and tear them
> down on acceptance failure and during unlock.

1. The changelog talks what it does but not why the patch is needed and what is
the design consideration. E.g.,

 - why choose to setup MMIO in the .run callback instead of .lock?

 - is tdx_tdi_mmio_teardown() safe for MMIO partial acceptance? when current
"run" fails with partial MMIO acceptance, can the second "run" work well?

2. So far tdx_devsec_run() always return -EOPNOTSUPP, and MMIO descriptors are
never retained.

