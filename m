Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107AB3191BB
	for <linux-coco@lists.linux.dev>; Wed,  3 Dec 2025 18:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785104; cv=none; b=atxEbfq2xEoJOTOrBtAA7qhHRbPYv4vhzJk7NVgEbNuquYQpmi1+cETsdP/wpilwN7ViwToCNoKtbCec5DwBzU7RpTzsTPjsQeqeWgpKCaYdCK3ZbGPNqgxqF2y+6Ask9WC4nQ6Swn+A9UCR6aX0OAyFZeYvuk3lBy2y7Ff8WZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785104; c=relaxed/simple;
	bh=uMzD7inZU7+hfm2rnIJ8kwCpdJfmVMo/CTH0OPxBrxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hraytvNP0qAb3ve9b2g8R2jtFXeMc08DJDsafX23l3man1c0TvcsC8L6sSgPXJC9TUbg0AUlCNF+FpR3+fHJhUCFldo/4WNav1BwX4/btotMDcz46q1B72r3zZlLRIBzs6xf7tUt7klNkP2mAAZgd3N3FuvxgQ3orXL+0RQcfuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FI975Yz8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FI975Yz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764785099; x=1796321099;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uMzD7inZU7+hfm2rnIJ8kwCpdJfmVMo/CTH0OPxBrxI=;
  b=FI975Yz8tVB97Cpm8WeyZoi9jpr6dArC9GEUDP9mnDaKRtvwG5+kJoQV
   5ksgzJkd3GjW46p72eRcA/UDc90qBzrhq01B9IZWWulKirt2A65I+saQn
   VNHG+BT5JY48AsZRa9Z2zBCORKVrYeQwnqYtkFQNGcpesW9IX6i/uq5iN
   YvlTioVTsaVd2AowI50+jaA3e6kuYuGxHLFy5lwo3b8Urc5z7yBlUwgSu
   E4nCoDou1oh4AiG0DzigiWxV5qpRQJ3D67LkPR6cjNxBk/xvQ1Nb8jehQ
   JPZFUlu2DezTWmDHjvs5quXAFlQIPXWmESH+74T06wggBnZbUgIWQ7ez3
   A==;
X-CSE-ConnectionGUID: kL1BO0sPSgOb7oGyJC1+WA==
X-CSE-MsgGUID: Hfmnlc0jSiC0byrIVh5pTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66680866"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="66680866"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 10:04:57 -0800
X-CSE-ConnectionGUID: 5K5+5YLJTjSQfG+nLOsYHw==
X-CSE-MsgGUID: EOHC8PZNRE6mNomBlWzn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="225427227"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 10:04:57 -0800
Received: from [10.125.108.35] (unknown [10.125.108.35])
	by linux.intel.com (Postfix) with ESMTP id 65DCA20A8401;
	Wed,  3 Dec 2025 10:04:56 -0800 (PST)
Message-ID: <48b4ec49-76f2-4b82-8551-02dd876d1da0@linux.intel.com>
Date: Wed, 3 Dec 2025 10:04:56 -0800
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
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <56c01575-c0e3-43f3-a6c6-bf62fcbe4f5d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 12/2/25 4:03 PM, Dave Hansen wrote:
> On 12/2/25 16:00, Kuppuswamy Sathyanarayanan wrote:
>> The reason the kernel must parse the status field is that the failure
>> code is only available in the header portion of the shared GPA buffer
>> populated by the VMM. Userspace currently does not have access to this
>> header since we only expose the Quote payload itself. Because userspace
>> cannot directly interpret the VMM status codes, the kernel needs to parse
>> them and return appropriate generic error codes.
> That's kinda the key to this.

Agreed. I have reworked the commit message to make this the primary
motivation.

>
> Users are poking at sysfs and expect (near) universal explicit errors.
> Are they even doing this from shell scripts most of the time?

Yes, many users validate the GetQuote flow using simple shell scripts or other
minimal tooling. Since there is no common userspace library for this interface,
each vendor or user typically has their own implementation.

>
> Also, please don't just keep tacking gunk onto the changelog. Start
> cutting out the cruft, please.

Got it. How about the following version?

virt: tdx-guest: Return explicit errors for GetQuote failures

TD users often retrieve the Quote through simple libraries or shell
scripts over the configfs interface. In such cases, direct error
returns from the kernel for Quote failures are preferred and simplify
failure detection. Prior to this patch, certain VMM reported GetQuote
failures, such as Quote service unavailability or VMM processing
errors, were silently reported as success with a zero length Quote
buffer. This behavior is ambiguous and makes failure detection
complex.

The VMM reports these failures through the status Code in the header
portion of the shared GPA buffer (refer to GHCI specification v1.5
March 2023, sec titled TDG.VP.VMCALL<GetQuote>, Table 3-10 and Table
3-11 for GPA format and status code details). Userspace does not have
access to this header because only the Quote payload is exposed
through configfs. Therefore, the kernel must parse the status and
translate VMM failures into proper error codes.

Update the TDX guest driver to return explicit kernel errors for all
VMM reported GetQuote failure cases. This preserves existing ABI
behavior because userspace already treats a zero length Quote as a
failure indication. The only change is that such failures now return
explicit error codes instead of silently succeeding.

>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

