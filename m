Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251D1CAA6C
	for <linux-coco@lists.linux.dev>; Sun,  9 Mar 2025 23:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741564529; cv=none; b=Ks2nqFkNLUKVESpgWMtjtiVgTAhnJVQT2OHvTHD2hRDxq91NBKhRGJm08BFlI5z9jTBhRzybgsdhi4hlSCcXJBBxW7uPHuHdssh26Ukwi8tNqIeI0nY9h9KJcf0PHANSmsf4tCzjffxxuaP/asb214WbcjGSIC2Qq5AIL9rTZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741564529; c=relaxed/simple;
	bh=vZRTfKc7Nz6Fk75fdMEnM7/6lX1wjeYmnB5PUeL1XXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fm2sRoluLJ4OIdzJVYSouXMUIp50OrU66ezHXJHY8ya8MHVXcZAu3RRzpXx2Vk9uuO2vTnjDgTT9zKuvoRGk0FgX8RRZpMuJWNV5OVKVBTaQz/xFVeE/qUL+nf85didv1cAs1UvsOm2QndMtrYhfY2Tzlc3JRALkAveNCKcWy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSXzjJqd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSXzjJqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741564528; x=1773100528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vZRTfKc7Nz6Fk75fdMEnM7/6lX1wjeYmnB5PUeL1XXw=;
  b=QSXzjJqdnT0g974cd498etRCDaqX+wwISctKnSpw1Onpbe8mo1fRsZmP
   5mBv12e1LVn77PugKJsczjPbKowje6JRO3J7RQKYWupuxVE3QM3wvFFVL
   vaiRnf9GXcIJOqYVLukE6a2prMoruG9L6SmshLIwJ0+8FunAxqHZ43Vn4
   URjL4iqeVJDeFj/pfl1L5geTVbZ/XaNRG5KDnOfx6fkOL6te+Fs8u7IOp
   hZvCV8KcWBi6pgIbVP5Ih84O49SBkYaTsO1FtSUL785GY1XnMKNHcXZTJ
   NOKtzxqc2C5IbU6vRxT39R5Zg4uZrQycej+MbXJKhMK3sWDG/li9urK8k
   Q==;
X-CSE-ConnectionGUID: 6H97NfTUTyebmCxYmuPG9A==
X-CSE-MsgGUID: CET0PgrVRditO7F0mvhIyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53928410"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53928410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:55:26 -0700
X-CSE-ConnectionGUID: VKZ+FcipSaOpE3ya4Y5oZQ==
X-CSE-MsgGUID: J+W1lSi+SbyDsrxtJg+zAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120357223"
Received: from jdoman-desk1.amr.corp.intel.com (HELO [10.125.111.6]) ([10.125.111.6])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:55:26 -0700
Message-ID: <62586df1-fa54-44ef-bb74-3557ffa194fc@intel.com>
Date: Sun, 9 Mar 2025 16:55:53 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virt/tdx: Enhance tdx-guest driver with improved memory
 management
To: liu.yun@linux.dev, kirill.shutemov@linux.intel.com
Cc: x86@kernel.org, linux-coco@lists.linux.dev,
 Jackie Liu <liuyun01@kylinos.cn>
References: <20250309140426.281868-1-liu.yun@linux.dev>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20250309140426.281868-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/25 07:04, liu.yun@linux.dev wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> This patch refines the tdx-guest driver by introducing better memory
> management and error handling practices. The use of the `__free` attribute
> ensures that allocated memory for `reportdata` and `tdreport` is
> automatically freed, reducing the risk of memory leaks. Additionally,
> the manual mutex lock/unlock has been replaced with `scoped_cond_guard`
> to ensure proper mutex handling and simplify the code.
> 
> Error handling has been streamlined by returning directly on failure,
> eliminating unnecessary `goto` statements. These changes not only
> enhance the robustness of the driver but also improve its readability
> and maintainability.

Thanks for the patch.

But, no, sorry, we're not going to take patches like this. If you're
refactoring the code for _other_ reasons and want to convert over to the
new fancy stuff, go ahead.

But, we're not going to introduce bugs (and this kind of rework *WILL*
have bugs), make everyone else's code harder to merge, and clutter up
the history just to move to the newest shiny thing.

I'd much rather folks spend their time reviewing code or fixing bugs
than just churning code around.

Also, if anyone _does_ make code to use these new locks, *PLEASE* don't
do it this way:

> +	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock) {
> +		int ret;
> +		u8 *buf;
> +		struct tdx_quote_buf *quote_buf = quote_data;
> +		struct tsm_desc *desc = &report->desc;
> +		u64 err;

Indentation matters. Increasing the indenting on the whole function
makes it less readable. Don't do it like that ^.

I feel the need to reiterate: please don't send patches like this.
Please tell your friends.
