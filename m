Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A01E376C
	for <linux-coco@lists.linux.dev>; Fri,  5 Dec 2025 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764894037; cv=none; b=VA2SUX0MY8f8ouldznaKNM8uiVP7WX1gBb7gTrLs+k0PbcKgj+JEes3rERDZVYoI1KW9JFwgUpYxNCWmcoR/D855vDHqMR2SdCCXzagjAWx5oMRKsvKz5WkOBbJxgBfRz0juRLe4xtdVUP7RUPkREQWT9iwt+0kfvcM0h7fuTJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764894037; c=relaxed/simple;
	bh=C/iYViToNV3/An6CaRUikOPhic2Y6WHIdmZCkluAMOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYUa/5fqVDoCKJmbSLe92wdq2Zf65hwqydgBVOLtwwRaZ+Jn/gjBczL52TEm2w2OtCpYy/rF02TotnXTPEaAZetjSyocvQLnoThCu6achn8KwD7Js78C0qQmZbvxuJvEkdIWT26BVqBqM72d5RT6wRgRYZNAcbgDEnaU5YstUAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVQB/1Do; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVQB/1Do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764894035; x=1796430035;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C/iYViToNV3/An6CaRUikOPhic2Y6WHIdmZCkluAMOo=;
  b=PVQB/1DoK2RiacfIySRurGpRSUy9Pj7ZB8gMxWUiGBXPZCViEywuOPfw
   tENm2gp2BthLRGgaA37uZXvxrF5VOp6SwEMgeWzwrKXQhjlVyLtNKUqQc
   4lpXg5yY8F/9AGc0eIZIwfOE8Afjta0bNSA5IhOnXHJjLzr15nECpBuug
   FSCaTP2Qus+05Sv+mxPSPNj/lcsTv7jBnf77EdGN5MmHgdvIt99GGl6hi
   NrS/QihFjynQlnJTQQzBXtxrcitQS5Xp2fy0QaCZCFLZ1yXci9EeSeGxz
   uPAS4XyAVj/RKi+0OtsHjvEqT0IL6lWrl6Crrz8I3OGnEQJkCWlh823y1
   w==;
X-CSE-ConnectionGUID: osfeHIEbT/2x+0QoWFhvGw==
X-CSE-MsgGUID: sZyjRYpiQ2ywkIt5HfoXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77546889"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="77546889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:20:35 -0800
X-CSE-ConnectionGUID: 4aXpgp4hR6+/osrzFSIRUg==
X-CSE-MsgGUID: HUpu5URvTKqS+Pslg0MIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199309518"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 16:20:34 -0800
Received: from [10.125.108.103] (unknown [10.125.108.103])
	by linux.intel.com (Postfix) with ESMTP id 2746720A8401;
	Thu,  4 Dec 2025 16:20:34 -0800 (PST)
Message-ID: <5802b581-c94f-49ca-91ef-5cebcb458b9a@linux.intel.com>
Date: Thu, 4 Dec 2025 16:20:33 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virt: tdx-guest: Handle GetQuote request error code
To: Dave Hansen <dave.hansen@intel.com>, "Kirill A . Shutemov"
 <kas@kernel.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20251202222257.986825-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <25044b05-7574-4b01-a8ea-3f7e7f32317b@intel.com>
 <369b819c-5235-424d-a8c9-c7c45a9fd4db@linux.intel.com>
 <56c01575-c0e3-43f3-a6c6-bf62fcbe4f5d@intel.com>
 <48b4ec49-76f2-4b82-8551-02dd876d1da0@linux.intel.com>
 <baf27817-e8db-4521-872a-1f1d32cf0a7e@intel.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <baf27817-e8db-4521-872a-1f1d32cf0a7e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 12/3/25 10:16 AM, Dave Hansen wrote:
> On 12/3/25 10:04, Sathyanarayanan Kuppuswamy wrote:
>> Got it. How about the following version?
> Still way too wordy and flowery for my taste.
>
>
Thanks for the feedback. I have trimmed the changelog to a
strict problem and solution format and removed the narrative
wording.

virt: tdx-guest: Return explicit errors for GetQuote failures

Some VMM reported GetQuote failures are currently returned to userspace
as success with a zero length Quote, which makes failure detection
ambiguous.

The VMM failure status is reported in the shared GPA header and is not
visible to userspace. Parse the status in the kernel and return
standard error codes for these failures.

This preserves existing ABI behavior. Userspace already treats a zero
length Quote as failure. It now also receives explicit error codes.

Refer to the GHCI specification v1.5 March 2023, sec titled
TDG.VP.VMCALL<GetQuote>, Table 3-10 and Table 3-11 for details on the
Quote header and status codes.


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

