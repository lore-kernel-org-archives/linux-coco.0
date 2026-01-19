Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05622ED87C
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839860; cv=none; b=lS9LvkHbTOcJlkF8tIqcVNEnxHUjVoCH/iAtyQgxz4ElXrzdY+l/zUW60Z9XYq/6EZ74mI4TG0B8RcoWMuEHx/InRzFUz+FDpnZTigfsEIqOim2Kmk2ibWC1+H2MD0/UgHEDMMefDQe+GWXsZNqudpcrJJlUf/vPVzxXcf0SWUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839860; c=relaxed/simple;
	bh=1u//sqTiwH5W8EyHJtX3qvAjx/ZIg6IvL8u6sQgIb4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0bgSFC2pJ48jMa2tUWHtHI6xkv+8n/yp3ccfwkxkc54lA9BocvUmSliR9C5k1N34vlvl+yzpXXGLzgEZEkmGUTP1YLhWs9IG8jbK+5A/Ewk3gigqdXZ1+QJygCGR2P578ilVLdvY7cR+xDs3vdtJjokFiTtvzNTMoQbH+btjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlFVfecB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlFVfecB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768839848; x=1800375848;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1u//sqTiwH5W8EyHJtX3qvAjx/ZIg6IvL8u6sQgIb4A=;
  b=VlFVfecBxBGb65X0J2/SCpFo2a5st4W2HUvhdpZBWawmNdZEFhznVc+N
   FDH2nWFwhD/PEXl7eOsNx4RepyMgIEQWPE99/Dp/U1pE+WJ4UNY5T8oOL
   xMOwNmX95XZMjZyT29o2LhBppG6DSjHIja0m2qNkp1LXit+epr1UZMgNC
   hIQXMdEeNPvi6Y62cXI46mKjEYA4UrHoRR6zvVyMZsL4mrgIk8j/QuqXf
   vtOhc6EDsJM5jH5K10gkKvW1yp22sDKH1nFn7VU/EQI4mPst1fLpOBYC3
   jJb5pyYHCeSrTRZk94Mr6Ey2v1htOVlHyw19yDdyxtBFrjwVFm9DlAyaj
   g==;
X-CSE-ConnectionGUID: iFcG082TQw+Okzw7nQ2vPQ==
X-CSE-MsgGUID: dFqzpx62S1ClXUBRkuekVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70214308"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70214308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:24:06 -0800
X-CSE-ConnectionGUID: bEodFxQvSDefeQxw8b56Ig==
X-CSE-MsgGUID: /RY/1PDWQJCyTOMJ6L6g0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="243484491"
Received: from cjhill-mobl.amr.corp.intel.com (HELO [10.125.111.233]) ([10.125.111.233])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:24:06 -0800
Message-ID: <a84cf78f-dd30-4847-a503-e10f547862ad@intel.com>
Date: Mon, 19 Jan 2026 08:24:05 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] x86/virt/seamldr: Handle TDX Module update
 failures
To: Chao Gao <chao.gao@intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
 ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
 sagis@google.com, vannapurve@google.com, paulmck@kernel.org,
 nik.borisov@suse.com, Farrah Chen <farrah.chen@intel.com>,
 "Kirill A. Shutemov" <kas@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-17-chao.gao@intel.com>
 <aWiIFlbrGqBjpyvX@yilunxu-OptiPlex-7050>
 <CB733CD0-C5B5-464C-AD75-DD5475BCF194@zytor.com> <aW3Ce05mZKCYYoKo@intel.com>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aW3Ce05mZKCYYoKo@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/18/26 21:34, Chao Gao wrote:
> On Sun, Jan 18, 2026 at 08:55:22PM -0800, H. Peter Anvin wrote:
>> On January 14, 2026 10:24:22 PM PST, Xu Yilun <yilun.xu@linux.intel.com> wrote:
>>> On Tue, Sep 30, 2025 at 07:53:00PM -0700, Chao Gao wrote:
>>>> Failures encountered after a successful module shutdown are unrecoverable,
>>>> e.g., there is no way to restore the old TDX Module.
>>> "e.g." is obscure. To me, the following sentence is explaining the
>>> reason why the failure is not recoverable. Maybe "i.e." or "because"?
>> "e.g." (for example) means the following list is non-exhaustive.
> Yes, 'i.e.' or 'because' would be more appropriate since the next sentence
> explains 'unrecoverable'.

FWIW, I very much prefer plain words. "i.e." and "e.g." are really only
useful if you and all your readers know how they work.

I don't feel the need to be draconian about it, but I frankly *wish*
folks would just remove them from their written vocabulary.
