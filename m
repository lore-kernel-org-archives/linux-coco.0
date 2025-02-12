Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416491F8BCA
	for <linux-coco@lists.linux.dev>; Wed, 12 Feb 2025 19:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739389050; cv=none; b=JDdJjgP8Kiq3Nix70QbVnJL5bto16oy567UaqU8wJbGQfj0FKHAQ1tBCBEl8dJS7iDZOH9GkRi4EvPy5odSGWorqzQixZ/vhSCR7NW7odv96lrRJhUrGoMWij4F2xZ+q0azKoSyhOO3fq25I2TLojxyJCtrrTxdF3qYZ8M4t5qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739389050; c=relaxed/simple;
	bh=7GgWOAz1evFyBapxVk+O6JID5HAUuVAilrsrIKwvyXg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=neA7kr0+f2A9Bqg2B/esL3lT4tulz/CUGk44zrjaN6232zycwjwQHFRnWNXxvPRK1rC/Ie0FFeBGvHrxsgbIjE3O37plOC79HUkKqSB10OKO01zegCRpIDUSj1LZas19KPSUegqdvaFikcEGYXJQQLVnsLfjlu41+xdg14pSEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEu3hoDi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEu3hoDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739389049; x=1770925049;
  h=message-id:date:mime-version:to:from:subject:
   content-transfer-encoding;
  bh=7GgWOAz1evFyBapxVk+O6JID5HAUuVAilrsrIKwvyXg=;
  b=PEu3hoDivBV2h1oxSf9rG9uL8FH1dEfxGRpO/rPjlEyEq/BEhU2tUnYM
   tHa8pccU6TzLplKKmbn/IH98ACEn2tdjqslc4qzDmW6Lq6XnzVAAjlkci
   /p65+j9hQSbuNTi4JkyaQQ18rNh1XYCKpdRsq7wWfY4sR983JpapHjxsW
   78XF9bG2mjMTQAc50JOYdEQejYADftFIduqqNX1JiEBpfW2T4GyWIHVGY
   uknJdL8J9EjAjuPZrf+yDvUBsdlIuBwNyYK7//qlB9d5Nk6V6yvsssX3K
   Brq+bX9BqGePwFW803mNw5NJQ0PzRCbvx6a9NhAf8y8K+IA154FeSr5zX
   A==;
X-CSE-ConnectionGUID: IxaMpyxyRvKYDn+RC9pO1g==
X-CSE-MsgGUID: 5xx7zmGSTbWA7YKmfiTcgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40329945"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="40329945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:37:28 -0800
X-CSE-ConnectionGUID: EGHvoX8qTO2RIlzqlsyNow==
X-CSE-MsgGUID: QEOYKA/fQ5Og51Lxh7D/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143868376"
Received: from jisteinh-mobl1.amr.corp.intel.com (HELO [10.95.0.161]) ([10.95.0.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 11:37:28 -0800
Message-ID: <85a36880-64c7-4f86-be5a-b13c58495e7d@linux.intel.com>
Date: Wed, 12 Feb 2025 13:37:13 -0600
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
Subject: Kernel SIG meeting 2/13 - Agenda: Guest to SVSM, Other items
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the short notice. We will have a meeting tomorrow (2/13).
We’re moving the meeting from Fridays to Thursdays so we don’t take our 
European colleagues’ Friday nights.

This is the zoom link:
https://zoom-lfx.platform.linuxfoundation.org/meeting/94712413327?password=6bec99df-d1d5-4932-864c-d6fe49b1f09a 


As always, it is an open community meeting available on the CCC Public 
Calendar:
https://confidentialcomputing.io/get-involved/calendar/


Agenda for this week is a topic brought by Coconut SVSM.
 > We would like to have a discussion around OS guest to SVSM communication

Everyone is welcome to submit additional topics.

Thanks,
Dan

