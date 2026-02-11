Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E835CBB6
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 21:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770844418; cv=none; b=qCJL8mJWQcDFjuoxTwFB/oEZXqYD8CVywefpTFGD414Y2Nax7kXxyqpZGynozHMf1zAu7rJdMaOG8yOuAVLgnBI2ajunC9xYsuYT3hdgW5YbZ1cOJ7T0Kf9wWSfEvsp6qX4MIFuHx4q/Y3KUFBoycS46qJP8CQ0GxZY+11Xy7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770844418; c=relaxed/simple;
	bh=IM8DRf4BM6t7hJwwIpXycGoW5I8PziYnxhEVfXHDNcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0zgoYbSeMyGw14xAsI9TYXEPI/SJyGTwCEfqmojsutARqYogH4UlBqe/IHYouk0i6eU4CGQnXZJi2EEP9/eerOt/MHgi7PjlDERL1ll+kHLGvvJtxHqrXM36ncRLUBo4uVJqZWuSH2bcabkmJP2EYDmFrDI0Y/2YhefkfiiM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RyZOI2Z2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RyZOI2Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770844418; x=1802380418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IM8DRf4BM6t7hJwwIpXycGoW5I8PziYnxhEVfXHDNcE=;
  b=RyZOI2Z29gtOugIRZXJASlKD1vXfHR39io9LJlM3BTUnxVP32MbMHuOU
   AY58PPAJ9aDoF/BE3HukUopkuDeAiFwV1hjitcdvdkSspAWXmayRApR9c
   wbOKTfA0FDzu6wz/h4MGkt0i8cFT9NwQAgnzph9RFdt7FCWiww+RzVW1D
   FB/JsAId3bePriH15JSi1LIndezR99X3ByZWQo0rrFeMS5T4EBdZNn+nd
   Jcq7ROdpcOnc6Oua4NPJkD9CRFcznyoO7MLkeo/ghIYIQYYxzMFJylnnw
   m8QXglmuGJseI943+Gpvki5CxUkfMOLZawPzcGGfJ+0KqgR0W7ZWf2/gU
   w==;
X-CSE-ConnectionGUID: w4/N4rzeS3iPFAHnd1Istg==
X-CSE-MsgGUID: +Lh75nGuRK6MTyehOU+4hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71904462"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71904462"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:13:37 -0800
X-CSE-ConnectionGUID: PsnzZ1HYSdeHmpeL+SH0KQ==
X-CSE-MsgGUID: sWHoGZYHQzqkOljRNqoQpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211349854"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:13:37 -0800
Message-ID: <eb2ba274-42a0-4bf4-aeba-36b2645e4860@linux.intel.com>
Date: Wed, 11 Feb 2026 13:13:36 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to
 128KB
To: dan.j.williams@intel.com, Kiryl Shutsemau <kas@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
 <aYxjhdES2MOI7rj9@thinkstation>
 <6983882c-2c00-42f4-924b-5fb3619840be@linux.intel.com>
 <698cef4964e8_8c32100a3@dwillia2-mobl4.notmuch>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <698cef4964e8_8c32100a3@dwillia2-mobl4.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 2/11/2026 1:06 PM, dan.j.williams@intel.com wrote:
> Kuppuswamy Sathyanarayanan wrote:
>> Hi Kiryl,
>>
>> Thanks for the review!
>>
>> On 2/11/2026 3:17 AM, Kiryl Shutsemau wrote:
>>> On Tue, Feb 10, 2026 at 04:17:12PM -0800, Kuppuswamy Sathyanarayanan wrote:
>>>> Intel platforms are transitioning from traditional SGX-based
>>>> attestation toward DICE-based attestation as part of a broader move
>>>> toward open and standardized attestation models. DICE enables layered
>>>> and extensible attestation, where evidence is accumulated across
>>>> multiple boot stages.
>>>>
>>>> With SGX-based attestation, Quote sizes are typically under 8KB, as the
>>>> payload consists primarily of Quote data and a small certificate bundle.
>>>> Existing TDX guest code sizes the Quote buffer accordingly.
>>>>
>>>> DICE-based attestation produces significantly larger Quotes due to the
>>>> inclusion of evidence (certificate chains) from multiple boot layers.
>>>> The cumulative Quote size can reach approximately 100KB.
>>>>
>>>> Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
>>>> capacity for DICE-based Quote payloads.
>>>
>>> It worth noting that it requires guest physically-contiguous memory.
>>>
>>> Single order-5 allocation is not that bad as long as the driver
>>> initialized during the boot.
>>
>> Good point! We can add following to the commit log:
>>
>> The Quote buffer requires guest physically-contiguous memory and is
>> allocated once during driver initialization at boot time, where an
>> order-5 allocation (128KB) is expected to succeed reliably.
> 
> That is good feedback. I would rather not restart the timer on the
> linux-next exposure with a rebase to add that. I think in this case it
> is sufficient that the commit has a link back to this discussion:
> 
> Link: https://patch.msgid.link/20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com
> 
> However, when the the patch to add the link to the documentation for the
> CBOR Web Token schema is ready, do take the opportunity to also add a
> patch commenting about the order-5 allocation risk to
> GET_QUOTE_BUF_SIZE.

Sounds good. Once the CWT documentation is ready, I will send a follow-up
patch that includes both the documentation link and the order-5 allocation
comment.

> 
> Later, when / if these objects start to get into order-10+ allocations
> for PQC etc, a scatter-gather mechanism will need to be considered.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

