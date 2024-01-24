Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96A3136669
	for <linux-coco@lists.linux.dev>; Wed, 24 Jan 2024 23:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706139871; cv=none; b=lhGUowo2K11kp15zfQc+7tBtADYjZ1T+OiojqXy5wLofY+1fXul9fb7pYvKcRhE0IyxNP6UTRFXlzEqHx+c3DeU9fKnEDPQpkhb5yCdFzCGuqczxmbaGjpRaAuO/61haI8ReVtaAbMqPamjgDk9dwGAacWwh8SuKE/YNPuAcILQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706139871; c=relaxed/simple;
	bh=uuVrOjU6/lO00xjFszsH8gvMmQzC1omqY1AoUFE9qgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0IYbCl2AlZqbK9K+uY45fxAktrkqtBaTLsxB28N9n2BOpAYIOi50pXJXtLQ3aHHWICoYvGp4WHzDnHapRs2DkF8maFzQ+Im5R/aXKVRZSrX8BUVooXwm4zc0fH2/Ucrg+zUzDoGtlEQmkbOdt60rdx9p7Nz4JGBr+GYXR45RAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CE3JaTXl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CE3JaTXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706139870; x=1737675870;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uuVrOjU6/lO00xjFszsH8gvMmQzC1omqY1AoUFE9qgY=;
  b=CE3JaTXlMs24H48cM3q1jW0rPnOuxd/jSKzR+Ui9KLyjBYwXETYXJFUK
   KPnNEgHPP0HyK37tZU1xgQp6wcTlFNgEbmly7exn+VKyyZayDgabKoa8n
   ZLw9m4qikaoyDTHL0oSU6MXToUueTp1CLDBadxyJhk9niWlHGJHquYMu6
   X4IHpM1aTsqt7c5I0KyzBMp4aF58EELa/tq46DuY6TJJX0V56ltzptJTv
   iWfgWh3EfORprbTqobdfzFbT4ssiuTmv9uWm4vIapFX+G1HI2SoPZd9sd
   jdBLymJNO+m/pTjEU8C1ccj3IyjlIx79YqQuPo71dSt6keLcY9O/I7rFu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="23467203"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="23467203"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 15:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786578522"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786578522"
Received: from mfzarate-mobl.amr.corp.intel.com (HELO [10.92.4.37]) ([10.92.4.37])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 15:44:27 -0800
Message-ID: <28f261fd-6ab9-4b86-884f-385aa6de09db@linux.intel.com>
Date: Wed, 24 Jan 2024 17:44:25 -0600
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
To: Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev
Cc: dave.hansen@linux.intel.com, x86@kernel.org,
 kirill.shutemov@linux.intel.com, sathyanarayanan.kuppuswamy@linux.intel.com
References: <20240123160704.1270147-1-nik.borisov@suse.com>
Content-Language: en-US
From: Dan Middleton <dan.middleton@linux.intel.com>
In-Reply-To: <20240123160704.1270147-1-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/23/24 10:07 AM, Nikolay Borisov wrote:
> When this driver got merged initially there was no widely agreed upon
> interface how the quote generation interface will work so having an
> ioctl made sense. However, there's now a vendor-neutral interface via
> configfs. Just remove the old ioctl interface and leave only the the
> configfs one.
>
There maybe some terminology collisions here.

The getQuote ioctl was never upstreamed. IIRC it died in patch v3.

This getReport ioctl predated it and has related but separate usages to the
quote.

The configfs-tsm API uses the word report, but that really means quote or
attestation.

In intel products and maybe elsewhere the attestation terminology is:
report: MAC'd evidence ~= local attestation
quote: Signed evidence ~= remote attestation

A report can be used for local attestation because the MAC is verifiable on
that machine by that hardware.
A quote can be remotely verified using the digital signature.

Other uses for a report include secure communication with service TDs.

Regards,
Dan Middleton

