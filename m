Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF15FEE6
	for <linux-coco@lists.linux.dev>; Thu, 21 Nov 2024 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209375; cv=none; b=V3P+AdGFc/YdihA6I4/t9JMfV2NgVhEvHOt19nIY/sdpRS0J7Xc1R8JZfE5CCEG3L52YjxILT93c23Dg3dz5jhV6yAbiiN9He4Ok+nR3PkvdQnvb6tvMOl5XrlXzaa3NDPXGHJLyiO8Q/to1tTPhuXN+WcsNW8funfd4sO3W1Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209375; c=relaxed/simple;
	bh=oteHahx82eWvH6WI57CTdcyvoo0A9AaL/9VGCxmmygM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EyI75Ya7qIsIUMdPOizpjmz1tuAEL8QhkHEGwnpLZ7JWXvCNkpsaWLadd+7LGGCEZ6OJo6mC2rc66aHAogEAiB391v5/XndbRzOjWgwuLnb8Ojz8kUuHQn4f45Kv1zOaWRHB6VFpkqFy83vxqGv+7B7v4hLEc/zAY7Cjo++zCrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHdPyF7O; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHdPyF7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732209374; x=1763745374;
  h=message-id:date:mime-version:subject:from:to:references:
   in-reply-to:content-transfer-encoding;
  bh=oteHahx82eWvH6WI57CTdcyvoo0A9AaL/9VGCxmmygM=;
  b=LHdPyF7O9RcHqZZQFMlOzti48MifhTSyeB3z4OG8jQ6zG2M3AkUgQC+V
   FZEUNSLKYt4aCJJxP6c8gCn1QLErPRGG5Mif1yInkHH5fbDLRoGxiXFw3
   +dTiTkFtyJfiu5J4FHRjMS4iQA5RbAjrqt/DdEUiI4nn5QSV+6PW3c+wS
   vcOM91wtuPPAAcR2JHJ3dZ6+GwKdxVc434+DWK4+qaVHeR5SRjXjGM+bi
   V+i8ag0HFVpQVuefNVbeKC4RJVnGqMB9PwzYUeyFKMx0KevFZWkd3jquF
   pNv4lLpGGnG49taEUB1/L3Yo2Xt4BxJ/3S4CGBJHHA93b41mgS+90A68H
   Q==;
X-CSE-ConnectionGUID: YmLe/fcJTWumFg33lLH7fw==
X-CSE-MsgGUID: P3H9y5/KSge0fA7dDeToqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32397416"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32397416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:16:13 -0800
X-CSE-ConnectionGUID: hNlEGk/zTLGdkJWv/53JwA==
X-CSE-MsgGUID: AGfvvgKhTzSgQBTY6GYb6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="121266212"
Received: from lscharfx-mobl1.amr.corp.intel.com (HELO [10.246.135.187]) ([10.246.135.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 09:16:13 -0800
Message-ID: <8c07d07d-ffc2-40f1-aad2-b3d7998e9f54@linux.intel.com>
Date: Thu, 21 Nov 2024 11:16:11 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Confidential Computing Kernel SIG 2024-11-22
From: Dan Middleton <dan.middleton@linux.intel.com>
To: linux-coco@lists.linux.dev
References: <51d1a968-85a1-4be9-8dc8-ee36c46d0de6@linux.intel.com>
 <cd797e42-c5a9-47d9-96bf-5f33c3645d5a@linux.intel.com>
Content-Language: en-US
In-Reply-To: <cd797e42-c5a9-47d9-96bf-5f33c3645d5a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry.. timezone confusion. Just check the link for your timezone

<sigh>


> On 11/21/24 10:56 AM, Dan Middleton wrote:
>> Hi everyone,
>>
>>
>> Looks like we have an open agenda for Friday.
>>
>> If you have topics please reply on this thread.
>>
>> https://confidentialcomputing.io/get-involved/calendar/
>>
>>
>> Thanks,
>> Dan
>>
>>
>
