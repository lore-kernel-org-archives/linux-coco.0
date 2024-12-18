Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D351F63EB
	for <linux-coco@lists.linux.dev>; Wed, 18 Dec 2024 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734556717; cv=none; b=DhjVFuZZwuO0SrNXY6Ar1in+Mcnj6/sPXTXNYeVKZRvGafIVTepCcxAtAU3xRJpQXYCBF1fvCOMNMj7ud1f3Di4KygIA9Zm07oQJneoqiArrfpz2KQukj3hQVIMhMBKylHgrf8uoCz/W3qM0Dh0uqVhgRSxBtQsXFr8B2/QWWZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734556717; c=relaxed/simple;
	bh=8sf5g1ghSnwxVDPZv19dzGLQjbGbphGnkGufQmFHibI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=BP85FdZMLMogvnZ4YJdKeIigKX5QtMkxHBTN1XpSsUEfbPoBu4Zqj4BLk9Zrh0cZt44PSva5cIMO1WksXufOpD2GIkVVavABq53I8/P1KcYJxO0+n/q+JGQ/7VSHMw/D6Xrhc36n5qutsPSD97EPhvZk8iWU7t9c+3irznyInZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8mSMy+a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8mSMy+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734556715; x=1766092715;
  h=message-id:date:mime-version:from:subject:to:
   content-transfer-encoding;
  bh=8sf5g1ghSnwxVDPZv19dzGLQjbGbphGnkGufQmFHibI=;
  b=D8mSMy+aN8qEYo+RFH/O2YjexwmImWP2ARBxYQ/lDbvqs9QK+2yHhqoF
   TxJJmkPhOvWeU4FUO1KZfDfanZ9Laq4bpTFF4S6AIp8yBYQpuqhFHtR+N
   c2xMXerLNIsDDQh4+GAcNaYV1btlkMqsWrAFKNrl6LwZcxLWVZRHF8xv1
   osM6owfzMg0/1PFWFwiibWhXjBp3Bk/8oaVFZdDLBrivY9ieubnNiLX9Z
   vH5EHDG4fX5Yfvo2x1UPSVbZhbRLvPH/TsvgiO8ovkaQjxqXoVkgyubW3
   em6ExwUevKpD848Xd7HzoGi7EoOjGtjzfxNJef9z4s4Gh7G1HvjjBqpGo
   A==;
X-CSE-ConnectionGUID: HJLQLoyZTEmNq138grR8bw==
X-CSE-MsgGUID: Ni3lgZcrQV2vwLpA4xh0mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46470147"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="46470147"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 13:18:34 -0800
X-CSE-ConnectionGUID: IQ6BB8grRGaUITFxWcm7Ig==
X-CSE-MsgGUID: hNWq0JuqTNGXLMEt7iGAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; 
   d="scan'208";a="97881028"
Received: from itripath-mobl1.amr.corp.intel.com (HELO [10.125.114.144]) ([10.125.114.144])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 13:18:35 -0800
Message-ID: <f0d7bf1d-3a2b-4b34-9020-a28bda9f9431@linux.intel.com>
Date: Wed, 18 Dec 2024 15:18:33 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Dan Middleton <dan.middleton@linux.intel.com>
Subject: Confidential Computing - Kernel SIG meeting 2024/12/20 - Agenda
 items?
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Open agenda for the meeting scheduled this Friday [1].


Good topics for this forum are things that aren't on the list yet to get 
some early directional feedback.

Or things that are on the list but have gotten stuck and could use some 
verbal and visual discussion to get unstuck.


Previous topics included runtime measurement register access. v3 of that 
series is recently submitted [2] thanks to Cedric.


[1] https://confidentialcomputing.io/get-involved/calendar/

[2] 
https://lore.kernel.org/linux-coco/20241210-tsm-rtmr-v3-0-5997d4dbda73@intel.com/


Thanks,
Dan

