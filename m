Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAE447D936
	for <linux-coco@lists.linux.dev>; Thu,  2 Jul 2026 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984744; cv=none; b=b/ugV2A2LuRlfGQnH3mPKJb2TCckayWtUHDxnHvzuYYhrYk7s8HR3EkjkPxQ10OeTgjnO1eRM6t2DZEP7XsKrff5XC2RQyTH9sA8JQHbk1WR5iUAtsoHKb4Z2jJLXCLvrC2A7BOksxWeoPdTwg1Dhkhhm4GxXFLXx+BKXOmIPAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984744; c=relaxed/simple;
	bh=QHB2RoqhTZM0EDqy4/DaKDjTrvH2qM2NinZCVAVwFts=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=PwvYZfcoL5ddsLgo/OW3egaOnQvez0cPa2m1Fnw9uiwWY0SAEWsxidgz9ic22rvtCSkDPQMGt8xMgz8VtM9iLkcszuiFq70f1rRrsBseeMrf/wSsUr6NgcC7M6+T8cr7kCYNkUe0uFxNS882IkuWCGj/vP0yAct1xJrxmkCPfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahVLxpAA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahVLxpAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984743; x=1814520743;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=QHB2RoqhTZM0EDqy4/DaKDjTrvH2qM2NinZCVAVwFts=;
  b=ahVLxpAASxT+EX2D05OcGZ10auvt/Oox/eqICxp+Bv3qB4Q7yWBi1CUS
   jornbtuaCO3KBTsFBLpXSndpp8bzqkaXaQ04Z8IWWNwPan9K/FYbkOiR2
   TJk5ErJG8nmUfzzGZABfuOGYljS6OwZWishU4cAbat2Zt1KiqSTOGjKgu
   wdrQ9489PekwwgCWTlWeFQUblz8v8meVXmkwOF1l8cUEA0Jfw6AoGBsQu
   iF5nAy3g4iGEoOxK+aNXtvD81EoXR0aIf7twiRsdpGgIUK6Rapheb5jPG
   5ZEa9pXVdE5H2jPKIY5D1cK5FVidGNbPudkvJ1yWPR7KBVFvXDYY/Bsos
   Q==;
X-CSE-ConnectionGUID: TZ0zidQmTkeCAwEY/PKirg==
X-CSE-MsgGUID: ZM8Y3xnqRUisV6OkR7c8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106529295"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="106529295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:32:22 -0700
X-CSE-ConnectionGUID: afTUgm2lSBmRKRrCU0cqsA==
X-CSE-MsgGUID: OwywBEdOTXW0n2srxmB+Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251766994"
Received: from unknown (HELO [10.238.2.244]) ([10.238.2.244])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:32:18 -0700
Message-ID: <479b86fd-1769-4226-8e05-f26e5531fac8@linux.intel.com>
Date: Thu, 2 Jul 2026 17:32:15 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] x86/tdx: Add APIs to support Dynamic PAMT ops
 from KVM's fault path
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20260526023515.288829-1-rick.p.edgecombe@intel.com>
 <20260526023515.288829-9-rick.p.edgecombe@intel.com>
Content-Language: en-US
Cc: bp@alien8.de, dave.hansen@intel.com, hpa@zytor.com, kas@kernel.org,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, nik.borisov@suse.com,
 pbonzini@redhat.com, seanjc@google.com, tglx@kernel.org,
 vannapurve@google.com, x86@kernel.org, chao.gao@intel.com,
 yan.y.zhao@intel.com, kai.huang@intel.com
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260526023515.288829-9-rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/2026 10:35 AM, Rick Edgecombe wrote:
> When handling an EPT violation, KVM holds a spinlock while manipulating
> the EPT. Before entering the spinlock it doesn't know how many EPT page
> tables will need to be installed or whether a huge page will be used. For
> this reason it allocates a worst case number of page tables that it might
> need as part of servicing the EPT violation.
> 
> Under Dynamic PAMT these pre-allocated pages will potentially need to have
> Dynamic PAMT backing pages installed for them. KVM already has helpers to
> manage topping up page caches before taking the MMU lock, but they cannot be
> passed from KVM to arch/x86 code.
> 
> The problem of how and when to install the DPAMT backing pages for the
> pages given to the TDX module during the fault path has had a lot of
> design attempts.
>  - Extracting KVM's MMU caches requires too much inlined code added to
>    headers.
>  - A few varieties of installing Dynamic PAMT backing when allocating the
>    S-EPT page tables. [0][1]
>  - Using mempool_t to transfer the pages between KVM and arch/x86 doesn't
>    work because it is the component is designed more around maintaining a
                  ^^^^^
Nit: extra "it is"

>    pool of pages, rather than topping up a continually drained cache.
> 
> So don't do these as they all had various problems. Instead just create a
> small simple data structure to use for handing a pre-allocated list of
> pages between KVM and arch/x86 code. Model this on KVM's existing MMU
> memory caches.
> 
> Add a tdx_pamt_cache arg to tdx_pamt_get() so it can draw pages from a
> cache when needed. Not all DPAMT page installations will happen under
> spinlock, for example control pages. So have tdx_pamt_get() maintain the
> existing behavior of allocating from the page allocator when NULL is
> passed for the struct tdx_pamt_cache arg. This prevents excess allocations
> for cases where it can be avoided.
> 
> Export the new helpers for KVM.
> 
> Assisted-by: GitHub Copilot:claude-opus-4-6 Claude:claude-opus-4-7
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Link: https://lore.kernel.org/kvm/de05853257e9cc66998101943f78a4b7e6e3d741.camel@intel.com/ [0]
> Link: https://lore.kernel.org/kvm/aYprxnSHKHUtk7pt@google.com/ [1]
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

