Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2274634CFC2
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021279; cv=none; b=IKv3JBiBXiP0JsTcb8uIZ9fG0duPhgNYnk4/+3Q8WbpnOQ8Rg0Iu1YKlhmkaqbswzJcRi5ijAP9XRFNNYXRfZiP5k+5TtHPCTUgRLDaU8qCS3La3WxmKeUG76AkQZvGGKIwmfW4gavqQ5eOQQDXM7qXyT2S9CvPRCR/ADYyzox0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021279; c=relaxed/simple;
	bh=E/fPN+tu8e+QdKMyiFLxZY66MPB6sfZteRdM3XPpFUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8+/aLYqWlxyPCtZG92umlX81ieznZPi+Yk/IzPY3Edji1UWClA+VuQHvgM85En34jC+44ERWMbC3FfuTrzTAJzw1xTw1JFs4lNW/1qtlgLWYownAocTItoEdMLQXtYT6Bf6PpgsolBL+rtePtueynTNDyqOdnzJfzSR9rvXY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxeFFyCr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxeFFyCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789021277; x=1820557277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E/fPN+tu8e+QdKMyiFLxZY66MPB6sfZteRdM3XPpFUo=;
  b=HxeFFyCrcaWddoSh5cHuXq0ToaSRKlySboYozPFv6+oW2TR1Cz9ajeN1
   sxO+Z29CJG3+uLjarQcm9W2VPlOaAqSWRPVv31uwvnun8k6EOEzcTXvae
   8AvvKnrWJzLbopW3I07DZGzCe1UXTZ/u7SPsHcOI3xBudG7hoK2RkG8Yc
   uciJMTOV3bsbMOLOOb4CXt17AByFTCFYX354PrnaUIsfVcWrDxKuk4BKe
   N3UZ798/mghLGBcDxFtZgSS8rp7Mq7lxqnMdpOnVa6g3XWdeO+X3x7+Kh
   LiFfSoxqx3l210h+j2z4Hj4CvK0x3WZNebRPxFBeSiWwS0lE6JGnD0pmw
   g==;
X-CSE-ConnectionGUID: nSaaq0YsRLyHVRGz/TYkag==
X-CSE-MsgGUID: 34muUGXtRDWFgKLV20YlXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99790962"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="99790962"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:21:15 -0700
X-CSE-ConnectionGUID: oIQdk4gJToGBq+CTmCDJng==
X-CSE-MsgGUID: aOywi4dYSjuDpT37TJ+0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="267249528"
Received: from unknown (HELO [10.238.2.139]) ([10.238.2.139])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:21:12 -0700
Message-ID: <49900033-4aa4-416a-9b51-d91d5dc668e8@linux.intel.com>
Date: Thu, 10 Sep 2026 14:21:10 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: dave.hansen@intel.com, dave.hansen@linux.intel.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kas@kernel.org, nik.borisov@suse.com,
 rick.p.edgecombe@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
 <d2a198a8-cba9-4773-94b6-1513b8b718c5@linux.intel.com>
 <ap/Yy0uNp+78/wjv@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <ap/Yy0uNp+78/wjv@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/2026 5:43 PM, Xu Yilun wrote:
> On Tue, Sep 08, 2026 at 02:26:39PM +0800, Binbin Wu wrote:
>> On 9/1/2026 6:54 PM, Xu Yilun wrote:
>>> The TDX architecture includes a syscall-like ABI for OSes to communicate
>>> with SEAM mode software. This ABI has the concept of a "leaf". Each leaf
>>> is roughly analogous to a Linux syscall: it has a set of register
>>> arguments and does one logical thing like adding a page of memory to a
>>> VM or running a VM. The TDX architecture refers to this interface
>>> function as a "SEAMCALL leaf".
>>>
>>> Just like syscalls, the TDX architecture wants to evolve the ABI to
>>> extend functionality while keeping compatibility. But unlike syscalls,
>>> which do this by picking a totally new syscall number, the ABI encodes
>>> the "version" number directly into the bits of a register argument. So
>>> instead of openatN being whatever the next free number is, the SEAMCALL
>>> leaf number and version number are encoded into certain bits in how the
>>> RAX register is defined in the ABI.
>>>
>>> In Linux, several seamcall*() wrappers have been introduced to invoke
>>> SEAMCALL leafs. They all take a u64 "fn" argument for the leaf number
>>> which eventually get set in the register. As above, the version number
>>> lives in the same register as the leaf number. So callers that want to
>>> select a specific version of the leaf, can jam it in the right place in
>>> the register by passing it in the "fn" argument.
>>
>> Do you think it's worth explaining how callers determine the versions
>> supported by the TDX module,
> 
> Yeah I described this in v4 [1]. Generally it is "selecting the minimum
> workable version number for the required functionality".
> 
> But I feel it distracts people from the problem this patch wants to
> solve, so I removed it. This patch actually involves no runtime version
> selection. The future change for TDH.SYS.CONFIG does. Better we add the
> explaination in that patch?

It's OK for me.

I was wondering how did VMM know which version was supported.
Now I know It's based on the feature enumeration.

> 
> [1]: https://lore.kernel.org/all/20260804085054.190847-1-yilun.xu@linux.intel.com/
> 
>> and what happens if the specified version
>> is not supported by the TDX module?
> 
> I think it should not happen. This means the kernel is trying to enable a
> functionality that the module doesn't support. Either there is a problem
> on feature enumeration, or people are using a deprecated module. Anyway
> don't runtime check if a SEAMCALL version is supported.
> 
> Thanks,
> Yilun

