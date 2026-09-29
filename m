Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD683A5E91
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 07:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667807; cv=none; b=nWU5u33/otNo6NPOCBFLeeNvrZtjz5m+lcisYTmXu22akTGGAz6tynpBkvwnt7A/SzHOl3LYo3O9OrTX7fjG9gVsYGBtJTF4/VQ1L78PyCIyeuWP/zBW0k6WWPTjxP/bW4EwM6ff6UD8tevMEcUSuP+nQTPGJe6vJ6jxVejBKXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667807; c=relaxed/simple;
	bh=ZS3Uwb8xM0JRyf4ECojhTiKdryKdMbYSqg1pPBs1pAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lm4iIXX+cVVTLTWuJP4IXIVcO1v2MnxztpA/rQ/w5kE4PsKWo/8DXdJttCfvfJgjKWsZchI2g27PbKMvRncNGZzJYut7xus6ZnzZMS15vJgQnIueClNdKO7wxP5bYzlfx8s/q3BkTnd6zadhv7y2xrUvxuXn1ZuZ2rX6XvDPhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkwf+Tr2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkwf+Tr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790667806; x=1822203806;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZS3Uwb8xM0JRyf4ECojhTiKdryKdMbYSqg1pPBs1pAo=;
  b=jkwf+Tr2EpsxEstSRJvqksUAbzGQ7My7FBCm/ZwrrGh82K5GRkDL5jLf
   Jh082Q2dTdfkjCry3LIcrZARlOndGaOxqJHRoqFvvXsmbrNkE4UDbRf+x
   uIT1mCAB07qO3O3qGpJcWcGybISX8lVgIkm4J9mAZeSsJHkDSiU0QjRnu
   7kCcLXfOew+fLjx0u2VXkvD044UkEGPtfrqLLOocRvrmM1DdcAETgxqWE
   rWRBkgs7InFiEQeTlYUh5KJ0H7N8g573riwLdIFmGaXQedfFblvqqkObx
   E58uMG8LaHDONkOJhdQb5b8Nt8/NsE3ai1hDafFVyEGrKf+lW3vYZsSGb
   w==;
X-CSE-ConnectionGUID: JBrrtEVTTfOWvJrwc1eJDw==
X-CSE-MsgGUID: 6H9h7TsMTKiOGGbzzRqOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90431650"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90431650"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:43:24 -0700
X-CSE-ConnectionGUID: q5CLkmCiQ6WWyZgTlePKGA==
X-CSE-MsgGUID: Bx4OISMOSya+fzByzBmhhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="274403098"
Received: from unknown (HELO [10.238.1.46]) ([10.238.1.46])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 00:43:19 -0700
Message-ID: <6df0a7cf-e88f-409b-8601-1e98367e4930@linux.intel.com>
Date: Tue, 29 Sep 2026 15:43:17 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] virt: tdx-guest: Give the Quote buffer an explicit
 type
To: Peter Fang <peter.fang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Tony Lindgren <tony.lindgren@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Artem Bityutskiy <artem.bityutskiy@intel.com>
References: <20260928100913.2265687-1-peter.fang@intel.com>
 <20260928100913.2265687-3-peter.fang@intel.com>
 <bd46aaba-2c07-4b4d-b76a-30a1dff21b0f@linux.intel.com>
 <artrprfgz7Q5CEz7@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <artrprfgz7Q5CEz7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/29/2026 3:41 PM, Peter Fang wrote:
> On Tue, Sep 29, 2026 at 10:13:32AM +0800, Binbin Wu wrote:
>> On 9/28/2026 6:08 PM, Peter Fang wrote:
>>> The Quote buffer is always a "struct tdx_quote_buf", but its global
>>> pointer is a "void *". A function would have to convert it back to make
>>> sense of it.
>>>
>>> Declare the global with its actual type, and give it a better name.
>>>
>>> This creates variable shadowing in wait_for_quote_completion(), so
>>> rename its parameter for clarity.
>>>
>>> AI was used under supervision to collect/apply feedback, review code and
>>> workshop logs.
>>>
>>> Signed-off-by: Peter Fang <peter.fang@intel.com>
>>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> 
> Thanks Binbin!
> 
>>
>> One nit below.
>>
>>> ---
>>> v5:
>>>  - New patch. [Dave]
>>> ---
>>>  drivers/virt/coco/tdx-guest/tdx-guest.c | 35 ++++++++++++-------------
>>>  1 file changed, 17 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
>>> index d0303e31e816..896eb0a09c4a 100644
>>> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
>>> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
>>> @@ -192,7 +192,7 @@ struct tdx_quote_buf {
>>>  };
>>>  
>>>  /* Quote data buffer */
>>
>> The comment should be updated as well.
>>
>> "Quote buffer" or "Quote request buffer"?
> 
> Hmm... I think with this refactoring, either one becomes kind of
> redundant. I was thinking of adding something like "GHCI Quote buffer",
> but that's pretty much documented by struct tdx_quote_buf itself.

Agree.

> 
> How about I just drop the comment?

It's OK for me.

> 
>>
>>> -static void *quote_data;
>>> +static struct tdx_quote_buf *quote_buf;
>>>  

