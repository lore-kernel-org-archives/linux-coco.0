Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497543FEF
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835223; cv=none; b=MZNC1Zz45U/Etzhnxw9sKQu78e+3f77H/iiALpl5mqOV6gToyCU8xjrPC1K6atk+w1/8sVdsTO25MlifO7Y3xdSbYAwzW0WCA7tKFqVghD0dfiOfaKzl4yfHtp1WAZLYNB1IOuIJpUZm25uEHiGFgKNE4109Fee6keciw0HtiLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835223; c=relaxed/simple;
	bh=2KqNk5fb5WdvivpMpRb34ti2GIZXJGD9niTakU3oqDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/Fyii6otFxCtvFXnaLx7vcRFkzPqWzDqkDtSHi2BcnVqIx4t3mFbgVvIKpEtV8LBiHo+OCWyWD2IG/3c5tTwTOhg4U7eSc9OSI4+uYxNqEBp9I8/Agoi0JlbkeDTQ6mGN8fhdYgjS3CX7unE5miga3B7XgWrHCbZgn8Qyks9v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=is25PC8z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="is25PC8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770835222; x=1802371222;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2KqNk5fb5WdvivpMpRb34ti2GIZXJGD9niTakU3oqDg=;
  b=is25PC8ze4NghmMxE1EAfA5hkKcl3Ucb6ychUxabah3fjSfwGHd6HnDF
   9HDMUktmdkU9zLWLE4o9GTpQ3bEw0VjDdSEPqO8xjlNQ1Ly/3nJBB6UX1
   6zOUGdAOXjB5/6US2EuoNoal2D2UXt2hV5UcJUIaiOd3Vyl7kg4Ak/FMQ
   MkSj8k55bjdPalEdmojQ34RVX1+udpS3hRpyvn1RGv7BfxTW47yHCjdo7
   +TuPbazbtWKwLHnTJKquXKyJUP33jqK+B3vbJOgxZTyBEQpjD2lAKB1dt
   Eh2wozL2G8iPhD2aANyxNzvoLupMhJCNMi1lTa4iyUSBAycHkXKRlif3Q
   w==;
X-CSE-ConnectionGUID: X0kJGyX/RVqCURMfCY1HAA==
X-CSE-MsgGUID: OUI1xcYZTQOuDtnmLqxbzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="97449993"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="97449993"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:40:22 -0800
X-CSE-ConnectionGUID: 9Rhihe9sQUOcnWyOKnDGXg==
X-CSE-MsgGUID: Hc0cDyUYQ2mAH8tTM94XWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="212152401"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 10:40:21 -0800
Message-ID: <6983882c-2c00-42f4-924b-5fb3619840be@linux.intel.com>
Date: Wed, 11 Feb 2026 10:40:21 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to
 128KB
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
 <aYxjhdES2MOI7rj9@thinkstation>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aYxjhdES2MOI7rj9@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kiryl,

Thanks for the review!

On 2/11/2026 3:17 AM, Kiryl Shutsemau wrote:
> On Tue, Feb 10, 2026 at 04:17:12PM -0800, Kuppuswamy Sathyanarayanan wrote:
>> Intel platforms are transitioning from traditional SGX-based
>> attestation toward DICE-based attestation as part of a broader move
>> toward open and standardized attestation models. DICE enables layered
>> and extensible attestation, where evidence is accumulated across
>> multiple boot stages.
>>
>> With SGX-based attestation, Quote sizes are typically under 8KB, as the
>> payload consists primarily of Quote data and a small certificate bundle.
>> Existing TDX guest code sizes the Quote buffer accordingly.
>>
>> DICE-based attestation produces significantly larger Quotes due to the
>> inclusion of evidence (certificate chains) from multiple boot layers.
>> The cumulative Quote size can reach approximately 100KB.
>>
>> Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
>> capacity for DICE-based Quote payloads.
> 
> It worth noting that it requires guest physically-contiguous memory.
> 
> Single order-5 allocation is not that bad as long as the driver
> initialized during the boot.

Good point! We can add following to the commit log:

The Quote buffer requires guest physically-contiguous memory and is
allocated once during driver initialization at boot time, where an
order-5 allocation (128KB) is expected to succeed reliably.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

