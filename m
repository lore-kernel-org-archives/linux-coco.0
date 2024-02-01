Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11313B199
	for <linux-coco@lists.linux.dev>; Thu,  1 Feb 2024 04:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706760875; cv=none; b=n5FdhovY7DcxpjAmjLfyEDB4pKrH/WKxd6XGQ8usbYpyMs9fEsWBiF5alSyfQR/J54aW44PYXhoWLTSB7setqI84GWZneZiCmEvzLe2cZDeZ0+15PYJNhJLWlCuskkjB3zDPibNhWO8ilGsuVLa+ieeW3zZyDMveqLpS8G3amU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706760875; c=relaxed/simple;
	bh=AHOmQz5aaBMq7TUk7Y6KWuFG4gcWN6thBlIFk1DrvBg=;
	h=Content-Type:To:Cc:Subject:References:Date:MIME-Version:From:
	 Message-ID:In-Reply-To; b=RDU2iG0o/TC0Koc612A7Yn37llJlg/aPshLb6m9xCbS792qfr0PM8RLLvVyPBVT4XAV5j1nEhJcPZghCQIKS/6MikAMp6CpbocUjHC2Pv7sQPKMSZ3g3d/13Drv7FIBvz4nkxX6FTWkXn0vIQfd+Hqr893FFXZH2LV6cLIEcn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpLvN0yD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpLvN0yD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706760873; x=1738296873;
  h=to:cc:subject:references:date:mime-version:
   content-transfer-encoding:from:message-id:in-reply-to;
  bh=AHOmQz5aaBMq7TUk7Y6KWuFG4gcWN6thBlIFk1DrvBg=;
  b=mpLvN0yDrV5Lkx5+y2b60Fzy7kbz+OlwSjhGtT+XQKTt+QDsK9tB+VJm
   K3Y3lfblahs0L+Op4OKtMYV3o9GtRcpBqYpya7pwvgGqr4WCmpuGm4WmQ
   YXbYV6gCc7SdZOGvD2SFh50tbbfv9iHD9qv/ofSKgRq4lp5WOC9TucqnA
   9dVl9icwi6nMM5bUs4tz+gP6hV603jmQVT8+A/ewvsnjMcOyRHhczfNe6
   JlhfJT+7MO9RwEV6GHwJyd7vWHBJa42dQsCbctkamIzn4CmHYl9eO1npj
   zpWPC0+ezCCkO9WLLuO5cB1GW5EsC0CawOij2mU0bFMiUPWIUiNmL7tIL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25264759"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="25264759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 20:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4401653"
Received: from hhuan26-mobl.amr.corp.intel.com ([10.92.17.168])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 31 Jan 2024 20:14:31 -0800
Content-Type: text/plain; charset=iso-8859-15; format=flowed; delsp=yes
To: "Nikolay Borisov" <nik.borisov@suse.com>, linux-coco@lists.linux.dev,
 "Dave Hansen" <dave.hansen@intel.com>
Cc: x86@kernel.org, dave.hansen@linux.intel.com, dan.j.williams@intel.com,
 dionnaglaze@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e3078be1-397a-4927-966a-acea5561eec8@suse.com>
 <464ff551-5909-42e4-b544-5c68ff86c76c@intel.com>
 <8655c3b5-84a7-42c7-8f2d-8ea32308fe5d@suse.com>
 <43ba2334-12ae-4311-8be9-e8eac631e0b9@intel.com>
Date: Wed, 31 Jan 2024 22:14:29 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Haitao Huang" <haitao.huang@linux.intel.com>
Organization: Intel
Message-ID: <op.2if3efmtwjvjmi@hhuan26-mobl.amr.corp.intel.com>
In-Reply-To: <43ba2334-12ae-4311-8be9-e8eac631e0b9@intel.com>
User-Agent: Opera Mail/1.0 (Win32)

On Wed, 31 Jan 2024 13:05:16 -0600, Dave Hansen <dave.hansen@intel.com>  
wrote:

> On 1/31/24 10:18, Nikolay Borisov wrote:
>>> There is no clear consensus from this changelog, nor the tags about  
>>> this
>>> approach.  It would be much appreciated if you could make this  
>>> changelog
>>> more freestanding and  make it clear that this approach is acceptable  
>>> to
>>> both the authors and users of the code you are modifying.
>>
>> So how about something along the lines of:
>>
>> IOCTL based interface was the natural choice for interacting with the
>> quote generation machine at a time when there wasn't anything better. In
>> its current form it's only usable for local attestation but that use
>> case is also going to be switched to the config-tsm interface. In
>> preparation for this introduce a Kconfig option which allows the user to
>> choose to disable the legacy code.
>
> That's an interesting theory.  Do the users and authors of the TDX code
> you're Kconfig'ing away agree with you?
>

As DanM pointed out [1], this ioctl() is not a duplicate of the current  
configfs-tsm ABI. And Local Attestation is a use case mentioned. Can we  
wait until there are two platforms requiring this interface and we have a  
clear idea what the configfs-tsm interface replacement of it is before  
deprecating? A Kconfig to deprecate without alternative implemented also  
does not make sense to me.

BR
Haitao

[1]https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
