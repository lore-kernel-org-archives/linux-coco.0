Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE539365A1A
	for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613118; cv=none; b=F0fO0BqAxHAzo2itmg3B1VMBuVCZRZsJ9K3/CFH3umIszyyr9QF9dMApvSyZoLaF5Ff8kgtsWC8AkOyl73RJbCGHycNYmie4dqaE5X1PKBavm1SFZ+k0CfvLRw1mqKR3+r24j91dJvZmYaf6og9W6SWlNKIRX7hk5RrPyxY47Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613118; c=relaxed/simple;
	bh=QQGm/efUewdd0uPaGsutyunhLIVLi9ZwuiNqcgKVR7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQylzdXSHKFbaw2Jio+aZBD6ywR8n+sutVxckeyk8es8o8oK3u37B32R9MdXB/fP6nazUoetC7l+Lh3cyjkLtCwNJaagTPK1os/3p3Lp4d8y9sxYZCBzMTuy9BkQUvbWzrV8KCSCA7bFYjFpDMsPzE1j8/DjbEE1plkTExMtomA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a09tt5cP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a09tt5cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771613115; x=1803149115;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QQGm/efUewdd0uPaGsutyunhLIVLi9ZwuiNqcgKVR7g=;
  b=a09tt5cPoQEzHDRTxWl999e+CRENkHpVn9l+AO5uIB21fdCTmkuNMP8/
   p0P2G+EiPsPYhNWj+b0RjjZZHohb3Auditjd4ChtFIo/WLx5AG6exkeG+
   xHptxxzvUk6GRVwQcrK7K0KIYAInUZ9C6yBWqXkxJZz75TxO668yOeHKE
   psdzzvIDlVbYnIldRd9QrEbBzDR2IYRwEj5HmgyaVcFo70APFVpdA3r0e
   haI+ulS3VSJ+CyF14uyIHYjSyJmIZSfxl3OxcSyc1vmfOua6ZgXgVOkEv
   PzxH10XFdQ55E/gRvjIoXd9Y4A2UvIN4q2isuz6O+CUvkLJ+3KjXnwftl
   g==;
X-CSE-ConnectionGUID: 00nYYniIRDGZ7ST+wakxGA==
X-CSE-MsgGUID: M+b6SUnDQEe6MDY2DaekIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84070847"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84070847"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:45:15 -0800
X-CSE-ConnectionGUID: T3bLLtQ5QC+LL9aBphtnew==
X-CSE-MsgGUID: KODdNr/SSPmw0R9tzPcyHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="212666612"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:45:15 -0800
Message-ID: <1cc137df-0940-4eb4-b7c3-2e5e8948d9f5@linux.intel.com>
Date: Fri, 20 Feb 2026 10:45:14 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] virt: tdx-guest: Optimize the get-quote polling
 interval time
To: Jun Miao <jun.miao@intel.com>, kas@kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com
Cc: linux-coco@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260211085801.4036464-1-jun.miao@intel.com>
 <20260211085801.4036464-2-jun.miao@intel.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20260211085801.4036464-2-jun.miao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miao,

On 2/11/2026 12:58 AM, Jun Miao wrote:
> The TD guest sends TDREPORT to the TD Quoting Enclave via a vsock or
> a tdvmcall. In general, vsock is indeed much faster than tdvmcall,
> and Quote requests usually take a few millisecond to complete rather
> than seconds based on actual measurements.
> 
> The following get quote time via tdvmcall were obtained on the GNR:
> 
> | msleep_interruptible(time)     | 1s       | 5ms      | 1ms        |
> | ------------------------------ | -------- | -------- | ---------- |
> | Duration                       | 1.004 s  | 1.005 s  | 1.036 s    |
> | Total(Get Quote)               | 167      | 142      | 167        |
> | Success:                       | 167      | 142      | 167        |
> | Failure:                       | 0        | 0        | 0          |
> | Avg total / 1s                 | 0.97     | 141.31   | 166.35     |
> | Avg success / 1s               | 0.97     | 141.31   | 166.35     |
> | Avg total / 1s / thread        | 0.97     | 141.31   | 166.35     |
> | Avg success / 1s / thread      | 0.97     | 141.31   | 166.35     |
> | Min elapsed_time               | 1025.95ms| 6.85 ms  | 2.99 ms    |
> | Max elapsed_time               | 1025.95ms| 10.93 ms | 10.76 ms   |
> 

Thanks for sharing the data!

> According to trace analysis, the typical execution tdvmcall get the
> quote time is 4 ms. Therefore, 5 ms is a reasonable balance between
> performance efficiency and CPU overhead.

Since the average is 4 ms, why choose 5ms?

> 
> And compared to the previous throughput of one request per second,
> the current 5ms can get 142 requests per second delivers a
> 142× performance improvement, which is critical for high-frequency
> use cases without vsock.

Is this addressing a real customer issue or a theoretical improvement? 
If this is solving a real problem, could you share more details about
the use case and Quoting Service implementation you're testing against?

I ask because the Quote completion time depends heavily on the Quoting
Service implementation, which varies by deployment. Since we're optimizing
for performance, I'm wondering if we should consider an interrupt-based
approach using the SetupEventNotifyInterrupt TDVMCALL instead of polling.

> 
> So, change the 1s (MSEC_PER_SEC) -> 5ms (MSEC_PER_SEC / 200)
> 
> Signed-off-by: Jun Miao <jun.miao@intel.com>
> ---
>  drivers/virt/coco/tdx-guest/tdx-guest.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 4e239ec960c9..71d2d7304b1a 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -251,11 +251,11 @@ static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 timeou
>  	int i = 0;
>  
>  	/*
> -	 * Quote requests usually take a few seconds to complete, so waking up
> -	 * once per second to recheck the status is fine for this use case.
> +	 * Quote requests usually take a few milliseconds to complete, so waking up
> +	 * once per 5 milliseconds to recheck the status is fine for this use case.
>  	 */
> -	while (quote_buf->status == GET_QUOTE_IN_FLIGHT && i++ < timeout) {
> -		if (msleep_interruptible(MSEC_PER_SEC))
> +	while (quote_buf->status == GET_QUOTE_IN_FLIGHT && i++ < 200 * timeout) {
> +		if (msleep_interruptible(MSEC_PER_SEC / 200))
>  			return -EINTR;
>  	}
>  

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

