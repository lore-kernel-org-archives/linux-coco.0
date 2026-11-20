Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160563;
	b=ZKUWNn95LnA4PhqoSikdA+gn2ezZiGtXE9OJOQ1LLHobLLFKJTeFxQWAephvcshOaUQQ
	 8E84ReX+N9epUYYlL66sVy6fS5aDSe83nzkTCjU72whvQjAdx7zAc5LClYgsZkItcPerJ
	 0114Yb0iGQu0+5vpHKJbh5rIPLa7Ygn55/7TOY3mlsEmoqnL6Ll/o3pnpijj4BXfQrJnl
	 fAxFcufs1Xv3F87z313idKLDHkkydOH+8l1XMqFvtCUFxbeSt2Na73t+BRQoi0oXTsxeV
	 NLGyME8aD2u7bnNvyuVXD0Hj+uS+SvZnWuyqR3U/sEFx+IM7hg9ZN1rWdEDiPNR7Rkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160563;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vpk6rm/9r10mxBUs2bn6HDrwFt4PfpXU9FOcpz6ua+o=;
	b=WtZkkj9K5HltgO4wzpnMfWSTxDXU3L/ihTyMYNv3NiP6MK06LvAOOurvUxsUNFVU6I5+
	 rJjWaMmlr+J6zPueKai3KW99dMsABUKHe5EXbSPYCzDVDbHhbHsl3gVWHbiDNyI9NcZ+P
	 w8K/bnyafWR2O3H4j7yFJZPIO7Leyfg6q41EKS5SqQSAbJVnkfzj4WGgzoA7Ey31hhgz0
	 rxvv/lnty6fs7iV83Dn0bO105g83K2J7cXm83qlQYqWFwbRuiB44z/vQxETJXiex34KjH
	 ZrZqwkFF2ztLmeBaPEGwwQeXhP7glDwxAUV4yRs/5fCAqQf3dIBYT2CnSII4O1cqivA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csOv+pHc;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5A606A320
	for <linux-coco@lists.linux.dev>; Fri, 20 Nov 2026 07:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF5A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=csOv+pHc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795160557; x=1826696557;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZnhKTgPT2ZcxeCYRxuiqOA9btN+JjG0BYvT5WY/7u9U=;
  b=csOv+pHcXXMesnblDhP+T++Pt0LyO2CJwMpn4tZLeiIckYUov2zhEIUm
   uaQIw0U/HjZ+GslE6DaMoPdYDvfevo0wrk9W9NAPZMSTZHIY1NFFoq3OJ
   WycpVsk5jztybDgtHZPcjty31ddqB6iHSjiSnWJ1JYFhAHj68jBjvAqiM
   1glUd+kkXVharJjdwubwwRSGTypzlhgkcgxetMHLLnp5mwz/RktW16S7T
   Do5CLKC8ZBXwbAyG6lYeK7XZDe9uXkk/RGXU26UmxtEbXD5wzOuB90GKG
   ECbxvV8qkUP+8cCLNCLh7yN5Ii/BEBisa+JRKz80bbl7XckB9kyvPqQzH
   Q==;
X-CSE-ConnectionGUID: kk+tCMWlQCqfsLER84Hr/Q==
X-CSE-MsgGUID: XhzyaQagScWQVENrmBDIdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4041816"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4041816"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:42:37 -0800
X-CSE-ConnectionGUID: R7TZMa4qQMKABCOHzbFTzw==
X-CSE-MsgGUID: v8SGIKg3RqyYhaaGHw8uCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10526712"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.9]) ([10.124.240.9])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:42:31 -0800
Message-ID: <f5a13a36-8736-40c4-946a-47bcd27e61aa@intel.com>
Date: Fri, 20 Nov 2026 15:42:28 +0800
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
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Verma, Vishal L" <vishal.l.verma@intel.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "Peng, Chao P" <chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@kernel.org" <tglx@kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "Gao, Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
 <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
 <20261119135908.GR2245175@nvidia.com>
 <ca4c5aa76780edc1e2387d84ae219ff0f587168a.camel@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <ca4c5aa76780edc1e2387d84ae219ff0f587168a.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 7:22 AM, Edgecombe, Rick P wrote:
> On Thu, 2026-11-19 at 09:59 -0400, Jason Gunthorpe wrote:
>> On Thu, Nov 19, 2026 at 07:24:13PM +0800, Xiaoyao Li wrote:
>>> On 11/3/2026 6:38 AM, Edgecombe, Rick P wrote:
>>>> On Thu, 2026-10-29 at 09:56 +0000, Duan, Zhenzhong wrote:
>>>>> After thinking about this further, a second .run() attempt cannot recover
>>>>> from partial MMIO acceptance with the current implementation. It starts
>>>>> accepting ranges from the beginning, so it will encounter a re-acceptance
>>>>> error on the first range successfully accepted by the previous attempt,
>>>>> before reaching the range that originally failed.
>>>> How does MMIO acceptance fail? Whose fault is it?
>>> According to the Completion Status Codes defined for TDG.TDI.MMIO.ACCEPT in TDX
>>> Connect ABI spec, it can fail due to various reason. I think most of them are
>>> the fault of the host, and a few are guest fault.
> What are the ones with the guest? We have some existing issues with normal
> accept. I'd prefer not to pile on.

  TDX_MMIO_ACCEPT_SIZE_MISMATCH

This is the similar for private page that happens when accepting at a large
level than what is mapped by the host VMM. It can be handled by accepting at
smaller level. And since currently only 4K level is supported, guest won't get
it actually.

  TDX_OPERAND_INVALID
  TDX_TDI_INVALID_METADATA
  TDX_TDI_INVALID_STATE

These are due to bad input from guest. Not the thing we need to worry about for
a well-behaved guest.

>>> The most interesting one is the TDX_OPERAND_BUSY due to contention on some
>>> locks. E.g., when host is operating on the TDI, it fails to acquire the TDIMT lock.
> Oh, hmm. Binbin was going to look at the host priority bit TDX arch as a general
> thing. Can you show this example to him?

sure. I will talk to him offline.
