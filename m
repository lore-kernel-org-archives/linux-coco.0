Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B91A23AC
	for <linux-coco@lists.linux.dev>; Mon, 17 Feb 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739828405; cv=none; b=X3Hhx+dN6aYR3cH1MpNW7ouALPzqKe2fAPGbzyc5M9y4ewYT0KfyJ5KwwyQQnPbBS8WCX+eDDZ8Lp6nBF1FkN3Rej8nj5yr3E0p02VxnjBu5IAm+bYj4NUXxXXr1y4UbbPWlP2aCOtK2ofIkgrZdbvCvIQFttC7czdxCCTsAwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739828405; c=relaxed/simple;
	bh=4RCmN6Pq0aiV1DxAu55NPxx/C4+FedmyURHnQ4wZhLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hsixa6QrsqJwRTnlZIlOrBoYDPhFIO6iQXFT37P4Iy9X5A1rp+kubdz7uljw4kI7ExadBlvNYUTHtIHVVOQfxLa6M4VoZgqMjgaJBBQlK6OyjEVJaOdqg6/EbvGr+nm++ebHHHool+fW8ciRF4Uh9z564KMTDnXx3WXC679bODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cr8T7LbF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr8T7LbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739828403; x=1771364403;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4RCmN6Pq0aiV1DxAu55NPxx/C4+FedmyURHnQ4wZhLU=;
  b=Cr8T7LbFWnJdD0o6E5gHa3D+MvLc7O+bSfA4vvoOwse14ByE0knXzcLz
   oHjvl+2gzscbFnEpGdwpzu57mOsiOQd3QjFkNWAHx1VYvIIziryF/BbQ9
   qBpHxS4/ByJUdE5NRirXJ5CMiH8Ppg58kMyXac7uH2GA+5FUGT5sXbkHd
   P2+D6GMU4mvneKnLT+2khHwDH1FSmSf2Z0QH8xgI9ZCenK7gbjOotchjT
   /MqHnnfwZ+UblwYkpu1Zu5iH27SPueE7XQ6UI5VBlx9IC3OLoiW8rHD6m
   OsLdbKUFbuO1mVX27GpGSXCf5g7nR2j6MC99fNAuib0JEXJEgLhzgw/3I
   w==;
X-CSE-ConnectionGUID: mHEcYfehT5+WgOgI/QwaGg==
X-CSE-MsgGUID: TM4ZQrh6Rrq4aXlU1HUi5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44272959"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="44272959"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:40:03 -0800
X-CSE-ConnectionGUID: L9mncwALQVimDKEVc42PWw==
X-CSE-MsgGUID: 35j9OdfMQW668kYvZ083FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="145057255"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.124.220.114]) ([10.124.220.114])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:40:02 -0800
Message-ID: <307d7655-1857-4662-b77f-86f402b6d046@linux.intel.com>
Date: Mon, 17 Feb 2025 13:39:17 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/tdx: Add tdx_mcall_rtmr_extend() interface
To: "Xing, Cedric" <cedric.xing@intel.com>, "Huang, Kai"
 <kai.huang@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20250212-tdx-rtmr-v1-0-9795dc49e132@intel.com>
 <20250212-tdx-rtmr-v1-3-9795dc49e132@intel.com>
 <5b6a06ac-b98e-4e15-9b19-913aec8bf4df@intel.com>
 <2306bc17-d1bd-44b0-b5a0-5ddb8c8d30f7@intel.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <2306bc17-d1bd-44b0-b5a0-5ddb8c8d30f7@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/17/25 12:58 PM, Xing, Cedric wrote:
> On 2/16/2025 6:40 PM, Huang, Kai wrote:
>>
>>> @@ -135,6 +136,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 
>>> *tdreport)
>>>   }
>>>   EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
>>> +/**
>>> + * tdx_mcall_rtmr_extend() - Wrapper to extend RTMR registers using
>>> + *                 TDG.MR.RTMR.EXTEND TDCALL.
>>
>> Nit:  I would prefer to name it as tdx_mcall_extend_rtmr() since this 
>> matches the existing tdx_mcall_get_report0() (and 
>> tdx_hcall_get_quote()) better.  But no strong opinion.
>>
> This actually my preference too!
>
> Sathy, what do you think?

I have used rtmr_extend() to match with TDCALL name. But I am fine with 
tdx_mcall_extend_rtmr(). We can use it.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

