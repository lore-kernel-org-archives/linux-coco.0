Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45444C60
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043328; cv=none; b=ZN9t7LLG1k2WoKg7xC3JSf+jwDNAlLXfYBKw0/bvt1cJtkPVmIMcD8pJJqv5l47vKDtxLmb+Bn8MlIvTSIg//acnWTDJwpeUXO1AsVaM4HLLLhG4twi4HbSESUgfh3fRgG/lIP+S/KcR0rlUzck6Y26LgpYyOqn+g2j5+/L0VjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043328; c=relaxed/simple;
	bh=93FCgOT9y5QhrFHH3HTSwdJv2ruktcwj0Q3A0sPJvU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YukyY0Uqs/hrmOMGqhVuSrSlTgDmXSi1m8ajo/P0fX2jjIFZ5Dd5/ISDp79GwsmspsVF2QSvQMEFH2XEQVrH+11G0ZPb2wh7hfdnxwmT2OUaCdD5WlVsUmR+1L/EczQjrx2vYV9veDtJeHJGt6CZvviwWmVyDmWNXpJuXanhaVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxoZ9KAx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxoZ9KAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706043327; x=1737579327;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=93FCgOT9y5QhrFHH3HTSwdJv2ruktcwj0Q3A0sPJvU4=;
  b=MxoZ9KAxv7L/vSitXYOaN7omYrEIgE+CcgJ77zpLF7Npxr1ROcPHRxKE
   1K1yq6pO3yFyk7jw/kUzhUp+8nuWWjszWAZDn5G0tKh2TZ/dqBUuvSxsh
   P9c4LHTnJ3cwd8jmmg51Fx6YA8e1K8QvXclunILD1Q5eVNifVgDRy15bJ
   YWaJe6Spkgx1UfkIHwoMGDElTzzxYoJzCSoIBa1KD8mEpaDEF2eL/NiBb
   qJLAHCXS1ov+HkLQK6s8gdYd3klHy2zOC3P/fLKhZdmPpnyxipjI8EeSD
   aZGSz/Ty96SPCo9NM3m+xvczwxd/wNkyHQfFi/N++9donVwslrEiOJ9tz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1493988"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1493988"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 12:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1117407567"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1117407567"
Received: from weifeng1-mobl1.amr.corp.intel.com (HELO [10.212.171.111]) ([10.212.171.111])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 12:55:24 -0800
Message-ID: <b7d0faea-22ec-4a10-9385-295e3fde01cf@linux.intel.com>
Date: Tue, 23 Jan 2024 12:55:24 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>,
 Nikolay Borisov <nik.borisov@suse.com>, linux-coco@lists.linux.dev
Cc: dave.hansen@linux.intel.com, x86@kernel.org,
 kirill.shutemov@linux.intel.com
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
 <210357bf-2b0b-424e-be2f-119804348c40@intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <210357bf-2b0b-424e-be2f-119804348c40@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/23/24 11:23 AM, Dave Hansen wrote:
> On 1/23/24 09:51, Kuppuswamy Sathyanarayanan wrote:
>> Don't you think we should wait till there are no users before considering
>> removing it?
> If an overwhelming majority of the folks to which Intel has provided
> TDX-capable hardware say that they are not using and will never use the
> ioctl() interface, we should definitely consider removing it.

Got it.

> How many kernels did this ioctl() show up in, btw?

It got merged in v6.2. It should be part of LTS and regular kernel releases >= v6.2

Redhat and ubuntu also merged it in their LTS kernels.

>
> Ideally, we'd get a warning into all those kernels.
>

Agree.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

