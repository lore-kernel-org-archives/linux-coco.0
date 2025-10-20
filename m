Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EABC15CD74
	for <linux-coco@lists.linux.dev>; Mon, 20 Oct 2025 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760973024; cv=none; b=bO4YsHn3uZ5FdNNe6NcO6Yq3H9XAMtVnUbuZV2PBQSxu9pya3Pf08FgWM6QCcu5KumphPG+me6aT52R5iFIduRiaAEXgmhdWQZtkKlN6p6QhwTGK2GwZcnn5jPmi2TKcGR3y7CFt3YnfNQlvWGSqvetFL/pTN99nwi/HQFyjYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760973024; c=relaxed/simple;
	bh=fqNjrot1k4YOkjMvUMIgaO7PDDgmIlgF/NrFLCl9TFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlSiMiOJLGXDPpNtX9CS/49ygYLiDn6l9YgkT5q02/E/UAIiXXMRTt/hNUqNV8mCSlQ0tsipP+UeiDw8WJL+68QLy0h9HenGF80ZYvpVt2mxxB1ki6eR1219W7HHiZe8h5+2w+nmvFrXa5e0/yq4dH46FcWnyUW323EIiBvX/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpvfrQ0p; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpvfrQ0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760973023; x=1792509023;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fqNjrot1k4YOkjMvUMIgaO7PDDgmIlgF/NrFLCl9TFg=;
  b=LpvfrQ0pojMDXZxu0iJQaKsbnw58lBkHCHhEayyP/UxgmQoK+ZiHwkXe
   GbloLg8Q0JouKNflzO28btH2/+gsaSeYUcyUYtBS3WTohyKo9ViBUC8IQ
   xJpkLdnjhAySHrc/R6MES5MQCUVtSliWMf81rHuy77RqgS/SQq8PIxUkB
   i/KlEgE51wJ2WMF8URmuDt3Ga/QB6RGuCht3xEze17qRzB1amrLvfBkAj
   mso2veOQNiXUiN2ma7I9uF5pSLrFLA8eAKoclBF11WzkCaAejhSfwwldw
   SoXUdpXBb+cS/DSf2cSilkLl+x4BOHhA7broO+3TwVQpvKqRB+n2T5qjL
   A==;
X-CSE-ConnectionGUID: x1lutn6BQ5uCrZM6nGqtiQ==
X-CSE-MsgGUID: 8OhB6QP8Q3uVhMIIyBUyGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63129552"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63129552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 08:10:22 -0700
X-CSE-ConnectionGUID: BJmxr3lpQuq18L62t0Llkw==
X-CSE-MsgGUID: GbjmQTpuQsay5QqgQ0kAmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="182539954"
Received: from jdoman-mobl3.amr.corp.intel.com (HELO [10.125.108.101]) ([10.125.108.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 08:10:21 -0700
Message-ID: <033f56f9-fb66-4bf5-b25a-f2f8b964cd4e@intel.com>
Date: Mon, 20 Oct 2025 08:10:21 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/virt/tdx: Use precalculated TDVPR page physical
 address
To: Sean Christopherson <seanjc@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kai Huang <kai.huang@intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Thomas Huth <thuth@redhat.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-coco@lists.linux.dev,
 kvm@vger.kernel.org, Farrah Chen <farrah.chen@intel.com>
References: <20250910144453.1389652-1-dave.hansen@linux.intel.com>
 <aPY_yC45suT8sn8F@google.com>
 <872c17f3-9ded-46b2-a036-65fc2abaf2e6@intel.com>
 <aPZKVaUT9GZbPHBI@google.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aPZKVaUT9GZbPHBI@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/25 07:42, Sean Christopherson wrote:
>> In a perfect world, we'd have sparse annotations for the vaddr, paddr,
>> pfn, dma_addr_t and all the other address spaces. Until then, I like
>> passing struct page around.
> But that clearly doesn't work since now the raw paddr is being passed in many
> places, and we end up with goofy code like this where one param takes a raw paddr,
> and another uses page_to_phys().
> 
> @@ -1583,7 +1578,7 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
>  {
>         struct tdx_module_args args = {
>                 .rcx = page_to_phys(tdcx_page),
> -               .rdx = tdx_tdvpr_pa(vp),
> +               .rdx = vp->tdvpr_pa,
>         };

I'm kinda dense normally and my coffee hasn't kicked in yet. What
clearly does not work there?

Yeah, vp->tdvpr_pa is storing a physical address as a raw u64 and not a
'struct page'. That's not ideal. But it's also for a pretty good reason.

The "use 'struct page *' instead of u64 for physical addresses" thingy
is a good pattern, not an absolute rule. Use it when you can, but
abandon it for the greater good when necessary.

I don't hate the idea of a tdx_page_t. I'm just not sure it's worth the
trouble. I'd certainly take a good look at the patches if someone hacked
it together.
