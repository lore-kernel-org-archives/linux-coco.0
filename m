Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657743;
	b=IWFoX794Mibb2GPlNqoHqLWsKMj7DeuICmSP5B3tK0pcWQ81s31H2lw7VTkH0vQLlHpu
	 n/ZRVJjXf7rbH1qPsCrcdlas9LPKM2QZfQpskGtNgOUGMzRE59/6kFwKvTvCcSG9HjLnF
	 s4vAX9DEb0SYXfFzlRBLfMaeF4ZaFeiBTHI9HPJzsd7RqjyvJPjPSMZGSqMHwkBBNaoHb
	 /NY9np63AN0wc8FcnLGtaMj3tnqJXjAuE+2OA1pkCc+k/E8RKORPSNlgBVRa9Q2MRo/bl
	 gHw4EFBkh+zsb58IGhvX3n3aa7FW9g8GUerOhNlNpV3XAGlWp0lyn4KMKFeWurL5fdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657743;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XfkmyAbG74wypFhGwrzBiE7jWMzZjVwrMaaxCug4Zq4=;
	b=EiU578gNOunjraYsnK9Z/ZUkXeYTO3JwU6ep0mE7Hyu142vXTSN1yNzhT0LigO3hmVB8
	 IyR2nyFqrwod1YGCrxLQu4EqVD9sGvyS+MyRvW5gFauY1ZMoW6VNjUuDHRmS8rBOg1Fip
	 CTfttFxWg9puSswfNyzkFHj1ZtXaqIzQSmn2c+n6e9cJ5bKtW7hCz6Okj39cx96gWZipT
	 DJuschlqkM22oJXYWlOD+g0CUtCK7Q1CeG0J881B88T3NxEmymSLcH8GE6GgLRQouNj09
	 vravQ8lxgs8tVQdL1LAiNQ8+8B0RCBizVzKYe6XhLb50ElbBQbuLfgJqQfP/yKXiBxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxCQLCvD;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1C606A326
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 01:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxCQLCvD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795657742; x=1827193742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GmyJq18JfTnpsiuaIdG3/VmYnhggXO6MFEljsQgOgaw=;
  b=gxCQLCvDNDU7AkdQbqon0ONr0ZJtiF+SXA6kCcUyo7aPb+aw1z43oh87
   09zVP+bTjFJjwINOe0RS5yEDhkeegH+J4gEcDYzOKdGywKsxSD984wcqL
   X7rHUQ+830+mIXZfCdtBCkX6ok1/27GKRjziyT4AxkLVWdWxxYRGsLJSL
   ryvA0eF6rL4LniY72VgNOu7yRz/SVQiDA5ptSIjsXcosme8Y3wKn4HS+b
   MnFKtW6Bz8ZrWnLOzDv7/8Vyk7q4t/4prNcGqeXXrOApZA2hGBAnn8zH3
   +hsTIuBRh9tQcu6isb5P2pF+h4Frq0xcLjKGOMhweV6+wyrhB7RsnNMh7
   w==;
X-CSE-ConnectionGUID: T3yf9In3RrmcCmILH2R6Kw==
X-CSE-MsgGUID: cQhgOdV+SCu4oxoV4OrqwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4443690"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4443690"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 17:49:01 -0800
X-CSE-ConnectionGUID: j1hFuDEhQ8Wnq9FwM6yZ4Q==
X-CSE-MsgGUID: 8+k3hbzoTMiX/Z4PuYTkfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12455992"
Received: from unknown (HELO [10.238.0.68]) ([10.238.0.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 17:48:58 -0800
Message-ID: <436c641a-9d35-4695-b41f-547c46479a5d@intel.com>
Date: Thu, 26 Nov 2026 09:48:55 +0800
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
Subject: Re: [PATCH v4 0/2] virt: tdx-guest: Fix and speed up the wait for a
 Quote
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>,
 "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "Aktas, Erdem" <erdemaktas@google.com>, "djbw@kernel.org" <djbw@kernel.org>,
 "moe@flashbots.net" <moe@flashbots.net>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Miao, Jun" <jun.miao@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
References: <20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net>
 <cd7bd4428398413e16ff214fc46f5d65076757d8.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <cd7bd4428398413e16ff214fc46f5d65076757d8.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/2026 5:42 AM, Edgecombe, Rick P wrote:
> On Wed, 2026-11-25 at 14:11 +0000, Moe Mahhouk via B4 Relay wrote:
>> Getting a TDX Quote takes at least one second, because
>> wait_for_quote_completion() sleeps a full second before each status
>> check, while a local Quote Generation Service answers in a few
>> milliseconds. Patch 2 rechecks the status every 10 ms instead.
> 
> I think something went wrong in the send. All I got was the coverletter and it
> looks like lore did too.

FYI. I did receive patch1 and patch2.

And the this lore link shows all the mails, at least on my browser.

https://lore.kernel.org/all/20261125-tdx-guest-quote-poll-v4-0-d89f26854b88@flashbots.net/
