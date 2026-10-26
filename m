Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999178;
	b=KrvuWH0JUqdMhByQT0eKUx8ZooHAwg+heGNp7MASIFTvNB9Hag2bnBxKJzs/AHcKmgdC
	 HAkppKK3kGutmbkHE251yzByRxUeq4HbsSkMV7iAtWRkkNzgFsGksijbtwpri6YKr07yF
	 Y8ZW/0zEgaKi1NiVglFRM9an0QBxbh5GOq26D3jgEDu+WbIv6m+VKliGOOOYnRGFdJRK1
	 qMANotGTVRm5KFgJ1ZZgyOjk50ogT6Ijs4i6kZr/DYcortjQgLewdJ9JEpZvqTG0vu3Ye
	 Q0YX2Sao1YdV6n/utxcCzjtoBbraWWb3BUYEWjldmGtYK6R8kgOfpwfwlL/9/PsYWOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QiScYf1oOOTAbSBP/oZKzosQ89SN8ry4cqm6yAv1xN8=;
	b=tB1oVcSgIc1QmfHCqg7XPe6Ps3+BydjProbzoxK9S8dxg5T3hEgZ14RTQd+PHjyBVGx7
	 qfKrPIu8m12OFkqurQbmG4JUsLcC5kmVWvaMAJarF/D9RCRB5OhrsKz94DaEXHV72sv4Q
	 94owB5LTteoIjCkaEH3gdeaNQjirhK05RzEUCdR2YGc7L5SpzwmzGyOrnwUxrjvQHw+ne
	 vPXgkRgKPfamhD8ei08WDjO73lCTyQp0f5FtHECO4tqhyAOelCzZya+YIbBmtpLQYSFsa
	 4qdC0BKTit5g/aLELqMi3YUFzxuiJY5AXq5N+wf44SxS8yJ3LS4a76UiujJdzAuKLHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="ee/m4rOX";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E6606A31B
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 07:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ee/m4rOX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792999175; x=1824535175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ujQcAXYXWxAkv9D2LRhj0xma3tY3kztKthVY/c35QeM=;
  b=ee/m4rOXNEpbdmabCym7jGVMVQuhXYZ+Cbamk5MRVKEOIawlSa/VcBkz
   /An2mRZhL0f3nHsBXg1Pt7E+5GTa3FlOSn7AexYojDlGI6xdypUWvVOIH
   oJQFUrrfbJ+f1JpHH4+lRB1U3p4MVlZYF+AThPb3SQGJU7AAJdwzKPvxg
   k2szAWyXKxIRrgShkCIykZ00OkC+QxGTGVwq48m/T69EF0C+EeBYNJCgb
   3Dg/ryWIQK7P788BMKnTd4346Bupf46ENJ7a32AHz1DsGBeFWuH2d7iPo
   sP8CMnwArb3p/08ku64HJFQd6doTA9BuRMQoXMLmS5aF2FMK8sQLn8YuL
   Q==;
X-CSE-ConnectionGUID: FCAMYyHETp2YBBjyHBwKZg==
X-CSE-MsgGUID: 8Sr1pEAkQoG+3ILve+cbmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1563680"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1563680"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:19:33 -0700
X-CSE-ConnectionGUID: tAF+J0iMRtqtqCO3JYS3UQ==
X-CSE-MsgGUID: dcI44Rx2QMehl1jCgTc4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4130639"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 00:19:28 -0700
Message-ID: <c81b4b51-4412-4d5d-a073-55fb346a766a@intel.com>
Date: Mon, 26 Oct 2026 15:19:25 +0800
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
Subject: Re: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device Interface
 (TDI) activation
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-13-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-13-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Store the bind session ID obtained after binding the TDI which is used
> by TDG.TDI.START to verify same bind session established by host before
> activation.
> 
> Add tdx_tdi_start_dev() to signal guest readiness to the TDX module and
> issue the TDCM_OP_START_TDI hypercall for the host to complete activation.

It mainly is stating what the code is doing. What matters more is the design
choice. E.g., why the session ID needs to stored? will it be used anywhere else?
can it be obtained just when calling the tdx_mcall_tdi_start()?

Is there a hard requirement that before the MMIO is accepted, the DEVCIE cannot
be started? Is it able to accept MMIO at runtime like the private memory?

> The run callback accepts private MMIO ranges, starts the TDI, and verifies
> that it reaches TDI_STATE_RUN, finally notifies DMA sub-system device's
> ready to DMA to private memory. Note that private DMA is enabled separately
> during driver attach by accepting the default DMAR entry.

But this patch already calls dma_set_cc_private(). Will it cause problem without
the following patch? If so, it has bisect issue.
