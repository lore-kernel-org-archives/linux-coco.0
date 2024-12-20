Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E84249EB
	for <linux-coco@lists.linux.dev>; Fri, 20 Dec 2024 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710673; cv=none; b=m+blIcFzVv0pnTrUpGjhxEfghL59CIhXN0MQxOjwtV1Sp4ZCdggX1Go6UROwQ9rgNfXW0NzB5BeSl6BcZVLIpOpTNsSxoWN0sWOAT1ghTnqkpWFAN+18HxvN9v4is7OrFa8NkL02ljc2eBecyEUyDUm+Y2WoJFLoYO6QP7MiGsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710673; c=relaxed/simple;
	bh=dJSvHlPeDI23IaZ4reXXckSKjnDpYc0tf3ey4MoCFHM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=slgk+i91uAkEokn2zRIp0LgVKXfDFTbcJN5PgmnexlIt9sjT8lnhLZ8xVP0PcZq5+cgv2klrdg/0EfHvt5xSm9MD8jMvRT7M6VdNAgQpAz10w+qIwuz4p1hsLLVmNVeo+BVc7WEMiNcuJsIfzsB6Iv6OKtkU074lrse2ENMLv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TPQNu2iQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TPQNu2iQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734710673; x=1766246673;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=dJSvHlPeDI23IaZ4reXXckSKjnDpYc0tf3ey4MoCFHM=;
  b=TPQNu2iQrc55f55V4txbYzFoM7bTbjpD0esMn9+Or9ftlMGAwc3vUDdo
   nT3r6DySnqFrXWTOLI45R4HR43cD/qaNZbi6z9h3e8YSthPABJcMNyqY0
   nzAo1BHL0Ai5eaLhGEyX650nA4G1gg85GciRluJlD80UCNyt2z2Io7YcI
   SOdJIEUHOmNAtflb4ELauUFtkS62xnjtBKs0KUMEbM/c/f/wE4RQrH+Hv
   kJI67l4xd2kvHQ0BKL/OFw3NH6fWzdqrahItAZtK9IxUtmTP1fRDjy+EA
   RtngavTuUA6ti8P4rfCatFT2504J83FXfCZAEr/egp/4YUnZC2YKn5Yxb
   Q==;
X-CSE-ConnectionGUID: TH7YeJ91StWdQrFC2JM/Xg==
X-CSE-MsgGUID: 105XUu2TQYa36iU3ge8VDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34977388"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34977388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:04:32 -0800
X-CSE-ConnectionGUID: u301+kRBTHyUletn9+omWQ==
X-CSE-MsgGUID: JdFWB46QQMSsEmJ5Hpvf0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121829587"
Received: from itripath-mobl1.amr.corp.intel.com (HELO [10.125.114.144]) ([10.125.114.144])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:04:31 -0800
Message-ID: <8e7b0cec-9331-43d7-a94f-e29cfb413042@linux.intel.com>
Date: Fri, 20 Dec 2024 10:04:30 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing - Kernel SIG meeting 2024/12/20 - Agenda
 items?
From: Dan Middleton <dan.middleton@linux.intel.com>
To: linux-coco@lists.linux.dev
References: <f0d7bf1d-3a2b-4b34-9020-a28bda9f9431@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f0d7bf1d-3a2b-4b34-9020-a28bda9f9431@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

No agenda items so let's cancel for today.

Sorry for anyone who stayed up or canceled Friday night plans for this.

Thanks,
Dan


On 12/18/24 3:18 PM, Dan Middleton wrote:
> Open agenda for the meeting scheduled this Friday [1].
>
>
> Good topics for this forum are things that aren't on the list yet to 
> get some early directional feedback.
>
> Or things that are on the list but have gotten stuck and could use 
> some verbal and visual discussion to get unstuck.
>
>
> Previous topics included runtime measurement register access. v3 of 
> that series is recently submitted [2] thanks to Cedric.
>
>
> [1] https://confidentialcomputing.io/get-involved/calendar/
>
> [2] 
> https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/
>
>
> Thanks,
> Dan
>
>
