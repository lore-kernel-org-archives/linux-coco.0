Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEB13C807
	for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209184; cv=none; b=KYW87s9sDtzaZdtdEubi0h8D+UTSYZhrF9YAhrUpBQ5YvM4JsJPsX0ObpW0DO+dev6wQzrOfsJTKa269SP4U7v6c2o1G6f/GaI31thNBPWB9OaVqL7N6x+zbq2IlE0Dt0NkbRX/XJdTFPoskCDVjSeKECTxbV+OPkbJEYsZmPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209184; c=relaxed/simple;
	bh=2h/r4iIs99x/vrC2tPL7yZlp7UGpJjlNJ5WsVsZY/+w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Lj0rEV1MQzPceEIFxoqgRX+0eVAv9XPBQl1Y992HyK2B6WnfeTrFgC9FxiXc+rps9ipSXzDmOfZ8B491bhpOJIRqKcgl2FvlbuK2PC7pvhF71LQIWeZVYjootNthpKQ3L9mzChQJl57LGk3KjyIrWGs9AVeqcqK5SiN+lDy6f5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9OBmk6p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9OBmk6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732209183; x=1763745183;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=2h/r4iIs99x/vrC2tPL7yZlp7UGpJjlNJ5WsVsZY/+w=;
  b=R9OBmk6p3U23kCm1D6zWVQCooaJ1fLF2wcN7z/Vbe0C59WJ7U93VkInr
   oblyDWmmu319E/kr0hDRVYEIqqbf9DjaH/mvStVMtTb62a038TK+koxEo
   in1cjLAQMtl3EU5Zl7CfU+q0UuOaU/v5midNYIdSd+0QLAybZ3Ea9ItYI
   /b2ITKD6EFN6ijqUftyWcUs9eNgEJokl/XOpvNZLL6s/Tl5dRfLMjb0BT
   iQb5uZExHTSTXx8ccTp6rKU/kiKB5DJ1Sae0FR+CaB8FLMm47YZJRmB6p
   vdszHr7w345PWeb7ALRkxKxrh+l4apJSzyk/Mz2qUdpQEMjPlfjTY8KeP
   Q==;
X-CSE-ConnectionGUID: 1CF8WtpXTXCagaM+oi55lg==
X-CSE-MsgGUID: wgQJ1NBrSDiECGdk9Y8KDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32086183"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32086183"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:13:03 -0800
X-CSE-ConnectionGUID: sb5a2nPpQ7CU1nEcDP83ag==
X-CSE-MsgGUID: A1DrdJ64TMap8hjtHOBRrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="113594515"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:13:02 -0800
Message-ID: <cd797e42-c5a9-47d9-96bf-5f33c3645d5a@linux.intel.com>
Date: Thu, 21 Nov 2024 11:13:00 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing Kernel SIG 2024-11-22
From: Dan Middleton <dan.middleton@linux.intel.com>
To: linux-coco@lists.linux.dev
References: <51d1a968-85a1-4be9-8dc8-ee36c46d0de6@linux.intel.com>
Content-Language: en-US
In-Reply-To: <51d1a968-85a1-4be9-8dc8-ee36c46d0de6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Corrected below: 7am pacific.

Best to just follow the calendar link for your timezone.


On 11/21/24 10:56 AM, Dan Middleton wrote:
> Hi everyone,
>
>
> Looks like we have an open agenda for Friday (7am Pacific).
>
> If you have topics please reply on this thread.
>
> https://confidentialcomputing.io/get-involved/calendar/
>
>
> Thanks,
> Dan
>
>
