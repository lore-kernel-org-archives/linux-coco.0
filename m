Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8181BC068
	for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208203; cv=none; b=qWUhwmGwHnxLS0kpDxnXbEYuXCwS4gm0oqslVVyH7fgyos5iAPkX9nizU7KtCBlhKXcZ6JUpjVQ5csoxIiTgw0o3KX+0ZF2kC1gTM0AhHV4i1tMOEDJ5RGD9uacM4EPUCLIDzeKWNZAR6rX5yXXtEbzpX8jAbWGAvU/WhOQ/5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208203; c=relaxed/simple;
	bh=V1izaV67uYpwyREtjgQG6NzNguJKog53HYm/2gCAhRY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=pWzInLEXs9eePg6XprUWdQCAoJ+xyLN2SNjJl4AyBhjFvTNj7jHkQ7FCCC4+0PAzfLNHYO6PLVAXI1JvkplzEnaedTAkKUPL+zL21VMuS4RUbG3E2RGOSI5oSg0EbeMpaQfxO8EbgtLmnZy1azLkBBJejde7efMLutylRIJhpdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRRRO1Hg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRRRO1Hg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732208203; x=1763744203;
  h=message-id:date:mime-version:from:subject:to:
   content-transfer-encoding;
  bh=V1izaV67uYpwyREtjgQG6NzNguJKog53HYm/2gCAhRY=;
  b=SRRRO1HgjFpnUUgldXfyrIqQIux64LFInhKy6GxYCFzAsPGACJmVOX8C
   Yna8g0DVOgsDRlB8ecthj9pRmxvPxH4eEulyrx1hdADAC2JTPkQQ3Qgup
   IfQa/x1FS49CV9oECW6yc9ixboFP7YfhDH24Z+E+9iLyBEXR/wrPXKxW7
   bY5iFGFI4Ow5n07/+08Z7TJhZgi+PbTenzZI/tym60G3/QJxgqPAzIJhK
   rCnMbvkLWjVzFM4tIfp6YbKN+/lcLOfVBLFdNasEhHAhDKXSjXFtyoIj4
   //2zoKFcyYrEdJyhI2tjY54mub9fYxLozW8CuioK5jPIhutkTyPbNj4LB
   w==;
X-CSE-ConnectionGUID: FtE3FvcqTDuqDLclVUX0gg==
X-CSE-MsgGUID: iHhP/KGUQKuaB7s1Pqochw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54844045"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="54844045"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:56:42 -0800
X-CSE-ConnectionGUID: 83huymJiSJyyZ9FBq1HCXA==
X-CSE-MsgGUID: ii/DgE4ISfKkQN1s4ZNBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95359895"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:56:42 -0800
Message-ID: <51d1a968-85a1-4be9-8dc8-ee36c46d0de6@linux.intel.com>
Date: Thu, 21 Nov 2024 10:56:40 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Dan Middleton <dan.middleton@linux.intel.com>
Subject: Confidential Computing Kernel SIG 2024-11-22
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone,


Looks like we have an open agenda for Friday (9am Pacific).

If you have topics please reply on this thread.

https://confidentialcomputing.io/get-involved/calendar/


Thanks,
Dan

