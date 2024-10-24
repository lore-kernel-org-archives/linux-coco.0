Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521EC22B645
	for <linux-coco@lists.linux.dev>; Thu, 24 Oct 2024 20:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729801372; cv=none; b=VbZvn5m+/AyAWxlJwXGhj12K8IDSkMPRzYovobc241jprME2AK72u2b+tD0eKHeyHw7VyAzRmC+TcH79B10aVrbdCmtUI0134lR0PmBPBcEAEMFSzSM44zMzGhNJzb9I9H4MbI+hc3Mg3nKH7l9xUbA4sk5Jw2ayEZtOIOXijSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729801372; c=relaxed/simple;
	bh=LueW8N0CI20HkBB4t/8npS9pP1nlgpi+zFhCZtDDFos=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Ig9FH9Kf9Q33fgO2+YL32dUqROH+GCXYjIvDImxdKP2EZ+ek4+A751phLofsdqGdEVO+FxuzeDONfbynbQc1z6dfybh87/X1dMMTbHaor43SC8rdCZuvoB0H6lT3W7kFJVwakHtRHgwP73fLsTVwYAbPnWmh27uAdRGrpj4F2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsKi6Dzu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsKi6Dzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729801370; x=1761337370;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=LueW8N0CI20HkBB4t/8npS9pP1nlgpi+zFhCZtDDFos=;
  b=XsKi6DzuxXdNuIutzcyDOGJy9IEycavWfJnshebjXVTl8Uoee1KSVQzy
   T8PooCfs2Hxwv8I3/wnz3kGQ2x1arqsTJXHiz9utFD7GvQucCqc1S0oTn
   33EjnNK9I69IQ+VlLBazvOy7et3DjKOtzJO3skyTNSwNOwnSuHauGc6gs
   uLcPKzlup/RXl5Xqxl+B35BiG6cskVbBLdiisimwNnZfZBtvQUo1yG7yJ
   VL8Pr3WAoiJ+trFXGn7Hvpshxvn7sLvUkSrMGIJ+CI0hSjnZEpVbiWfSh
   6TvklpnCQPBDZnDbTv+nH3/xcrwaEI0gOW5cO7UA6++qtrvHUHzcMaS5q
   w==;
X-CSE-ConnectionGUID: WBgy9ryRSLaYm1wZB7gXqw==
X-CSE-MsgGUID: 3t0TtNUISXOyzIgQDTGgAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33364160"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="33364160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 13:22:49 -0700
X-CSE-ConnectionGUID: oBdB0Vv/QQyYHuGKlhuHPg==
X-CSE-MsgGUID: 4ifKRiPqQoqgIa6/m9hUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="81526647"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 13:22:49 -0700
Message-ID: <40db0e47-d9ad-4556-bc0c-41213ccebe4d@linux.intel.com>
Date: Thu, 24 Oct 2024 15:22:46 -0500
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-coco@lists.linux.dev
From: Dan Middleton <dan.middleton@linux.intel.com>
Subject: CCC Kernel SIG Friday Oct 25
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Reminder we have an EMEA-friendly* timed meeting Friday at 9am Pacific 
Daylight Time. (19:00 EEST maybe?)


There's interest in advancing the RTMR discussion.

The last post in that series suggests simplifying the patch to just RTMR 
extension and forgoing the log since it seems like there's no consensus 
on a log format.

https://lore.kernel.org/linux-coco/ZxqCNE-peVCmYus_@himmelriiki/T/#u


Any and all other topics welcome, too.


The calendar item is on the LFX site:

https://zoom-lfx.platform.linuxfoundation.org/meetings/ccc?view=week

Or you can cheat and just use this zoom link:

https://zoom-lfx.platform.linuxfoundation.org/meeting/95010052418?password=fff9d4db-0cff-4f8a-9884-aed645e742c1


* if you don't think a Friday afternoon/evening time is friendly you are 
welcome to BYOB and make it friendlier  :-D




