Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734B3A7F55
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987389; cv=none; b=ctOpi0y0eJmORlt6X1rPQsEqJOGouWDp5n6olLk36pI0eObAwRgNXGGxY7tkDSkpmVZFkV8wcIZQ96bOa4yN7hrtRAXrDNk1qgsZy3QJDuWdqutZuGf/dnLoiNsAQeQ0+AsFaO5SENrVP1hB7NUN6TC88qaOt2lOrBO7acS4mYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987389; c=relaxed/simple;
	bh=HoCoNYt317DxUaFW18oSXEBEx4zbnTTD7VvNIfo0zuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=De29xCL/RtMguA9LiEa2DW4WhB8avvMEtd4/dTPNYUqMTcLGQk8+TmObWOigZ60RAeqmCosL3cmPSodie9K0+/x9DSnKMN8BivLGbwCWTXbng0qIvIXwsykTws0IoDLPFmqQrF7o05uCZxR5WyMjdQpeFVb5j2XBG8o5NLJ522k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P3l219zP; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P3l219zP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782987388; x=1814523388;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HoCoNYt317DxUaFW18oSXEBEx4zbnTTD7VvNIfo0zuw=;
  b=P3l219zPawXg9rZdCzTftbUynfdxnZXIfOu+XYT9WFRMzmvdWlfRAhNw
   AWtiuzCUGsLRb/GzZBQzXggmBmUEGxQRadgJwSOXIrPRCXyPa/CkJsbye
   PmPBm6M7Kvqb+oMhUqgLPWGQlw2JewTtXziLr/dm7Z5+dJCNGd+STCWXY
   oZ6Nnd1Xajv2nlT9Cs+EgkmeA4PoktVVETMP82rRTUmnHGgDni3zqx6bx
   DrC3Ve1NCSmym7KB/B4AXB3pJTmxB4kHeeXhFgSPpnJ2CfAWnjYXr6JRX
   3uNHZPDmvCOPiWpA4ESPcgAWULwx78cC+T/LlFPNAaukHNzDi+DNcae09
   A==;
X-CSE-ConnectionGUID: tKDYYdprTk+y/TDON5lRrQ==
X-CSE-MsgGUID: Xa34JhckRIO2OSHVtuZ9qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83826010"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83826010"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:16:27 -0700
X-CSE-ConnectionGUID: /EbeYfYiQTqtcOR7lINrXg==
X-CSE-MsgGUID: TKOXIuqgTpSsNpdduyxdSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="252378529"
Received: from unknown (HELO [10.239.158.38]) ([10.239.158.38])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 03:16:25 -0700
Message-ID: <cdb43316-6535-4f11-9fb0-abdf2adf4568@intel.com>
Date: Thu, 2 Jul 2026 18:16:21 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/tdx: Add helper to query maximum TD Quote size
To: Peter Fang <peter.fang@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org
References: <20260612110853.3188196-1-peter.fang@intel.com>
 <20260612110853.3188196-2-peter.fang@intel.com>
 <49728a57-a996-470d-92b7-209a010b4761@intel.com>
 <20260623044411.GB923079@pedri>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260623044411.GB923079@pedri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/2026 12:44 PM, Peter Fang wrote:
> On Fri, Jun 12, 2026 at 10:25:03PM +0800, Xiaoyao Li wrote:
>>>
>>> Assisted-by: Claude:claude-opus-4-7
>>> Assisted-by: GitHub Copilot:gpt-5.4
>>> Signed-off-by: Peter Fang <peter.fang@intel.com>
>>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> 
> Thanks for the review Xiaoyao!
> 
>>
>> I have another nit other than Kiryl's
>>
>>> +u32 tdx_get_max_quote_size(void)
>>> +{
>>> +	u64 val, ret;
>>> +
>>> +	ret = tdg_vm_rd(TDCS_QUOTE_MAX_SIZE, &val);
>>> +
>>> +	return ret ? 0 : (u32)val;
>>> +}
>>> +EXPORT_SYMBOL_GPL(tdx_get_max_quote_size);
>>
>> Do we need to start to use
>>
>> EXPORT_SYMBOL_FOR_MODULES(tdx_get_max_quote_size, "tdx-guest") ?
>>
> 
> This makes sense. But can we use a follow-up patch to improve this file
> later? Right now there are only EXPORT_SYMBOL_GPL() usages, so using
> EXPORT_SYMBOL_FOR_MODULES() here might look inconsistent.

If maintainers is going to merge the series as-is, then fine.

If we will have a v2, I don't see why cannot update to use 
EXPORT_SYMBOL_FOR_MODULES().

The existing ones can be updated in a separate patch before or after.
