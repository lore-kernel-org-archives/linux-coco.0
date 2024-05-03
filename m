Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CE158A3F
	for <linux-coco@lists.linux.dev>; Fri,  3 May 2024 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714766134; cv=none; b=s4eq/Qzlyuih9B9OFxlbZrTI4LuvFkeNrzKQyJSCxcTkbLUgySxD0akbnZKy0I4Pfv6U5Qz/wmimQn7/THi+TpFwiymYjZHYfGj8nrpEGgqQfzo6taMxEOVGzugYcj/VgiDOW5RbEkpb5YYmCeG9hWXvZipAPSI1oRjPh2CBdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714766134; c=relaxed/simple;
	bh=sc7TMqEbR0TGZLZXtH1yyS6qKwV2IxUSQNPNNDHLM1A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=t80S2uPqPbe0sOxNRioUzowSe25E/WzPAmsMOtIs55NPVZZ8L9lJSO4TFNKW+3rUYlC1Nb2Xjr2N/qGtKiwq78rgj/+fiwnsLRUOTvZV1r6o7vixY8pHkqgxh7TUepVOk6QI+2g10/+KkQbKiw4b9kws9iL7tR0Ue5ySYQjbFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mjwm8L0H; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mjwm8L0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714766132; x=1746302132;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=sc7TMqEbR0TGZLZXtH1yyS6qKwV2IxUSQNPNNDHLM1A=;
  b=Mjwm8L0HWDLUqwx8o2pLREnxWEB/yPMAi8oKu6afgSRzjBrKfjSuOWF+
   8d4CLB+ENLnQWI2XDlYwp2rvpZMbqkaBV3wuW6ESrT7DDEgBwVsdwSQ8L
   w4IRsipJaXeuAXs57QF3pGmx5XNwyo3a9WL3kGpHzVxoJIj+kyvBHb65T
   fGhzuJVbvIO0qyeVmcdp1Nd/BDwPOdCHTvoe7WJyn7skvYG5T4rJ7Qrz9
   glROnsKzb5D4ciRCJiSvaBKQXRAGiJWXxKZio42Yqruk9IwglOubfI/XH
   ZJVQ3UxBtkJVYkd2xfqSCh+fo8Lo8gXcXqLmIZ5Zs141KSVBQiUxWi94b
   A==;
X-CSE-ConnectionGUID: 8HpuYu9GSJ+ZK0tGvBjJ4Q==
X-CSE-MsgGUID: brFOo+uXR6SkigytGvUpYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13531681"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13531681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:55:32 -0700
X-CSE-ConnectionGUID: mnudHxyUSzuA3LHHYN5P2w==
X-CSE-MsgGUID: Kh00qVilSgCkMGfzXbzPeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32223071"
Received: from mfzarate-mobl.amr.corp.intel.com (HELO [10.92.4.37]) ([10.92.4.37])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:55:31 -0700
Message-ID: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
Date: Fri, 3 May 2024 14:55:20 -0500
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
Subject: Confidential Computing call May 10: RTMR ABI & TEE I/O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi
Next Friday, May 10th at 9am PDT, we have a Confidential Computing
devsec / BoF / Discussion Group / SIG call. Everyone is welcome.

Tentative agenda includes RTMR ABI v3 direction and TEE I/O next steps.

We may still have some logistical kinks but hopefully this is pretty
accessible. We are alternating times every other week that we hope
will accommodate contributors across different time zones.

The call is hosted by the Linux Foundation / Confidential Computing
Consortium.

Zoom and other logistics at the link:
https://confidentialcomputing.io/about/committees/#Linux-Kernel-SIG

The next several meetings are
   May 10th Friday at 9am Pacific Time
   May 23rd Thursday at 8pm  Pacific Time
   June 7th Friday at 9am Pacific Time
   June 20th Thursday at 8pm  Pacific Time

Regards,
Dan Middleton

