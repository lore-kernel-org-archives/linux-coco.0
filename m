Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975923;
	b=BmxRnd4tDmkk07kZsTDU++jk2Ehi92MpHRm/RC3oqYpDPB4V5sD0XaDtyll6FNWbZwyX
	 pandCyuGzLrSslWoKE9jEhS+2a/Eoo4v7dR/PcQyCVqYN0ovZqpoiBJFRSGMFeS4/iiUO
	 SiXy8kPSGyBU6mh2NnDMScATx2n4hn1sphfifDKH7E7k7twWGuS60sZRGWQCX4P9TbJs7
	 BM65m3K6RT3JZw7ZEgfRrkVoEvHdnfNXwJmL2wBdazd4Xhv4HdwfRzfTDzFJGE0Q0wfDQ
	 E/utlCO8jPTF3P7uDv/2VdlJQthcUZ5Xwp7xDEu0w14uBEZqbeqYFtemB1LR10utrQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975923;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b9fH36rPga1m/YKhPFxzMrQCe595oHYTRuGjJPzK7rE=;
	b=qp10aXTw6ZgRlbhznfee7tcpk/aRDg3ps5cp4dgw/JtxHkIZZr7hn+36gP0GrYFbX0a7
	 ndm0J0y64EntIN4xw5C94bXN5QnuKB2ZxaG3FT1SQP/GYrl9z1UxgZSkBszazaSCLCyK0
	 JKoPTb+HVt0hHhimqPKotvdmqlEbLxH+6NyC2Iisg886OGl/tDQKhxK9wIOKRrZYWGz8h
	 a30pF9YxJkFWY/eUW1TDHC6EbNjOW55uCMu1/rU/Wa6k6iHwPo6AhRKGFCWR4YrT2saLD
	 rkLxQ50XfONzrhjzOD7vQxH5ZC+fmTVsdFMZkUPWVkMRz3CsW8TOdaX9GqyTw594ZYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mA/oJVf8";
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D42606A31A
	for <linux-coco@lists.linux.dev>; Mon, 26 Oct 2026 00:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D42606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mA/oJVf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792975921; x=1824511921;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cAg/kfv8+ENBqgEJrRZIOg4+FnSqfG/3NeBnA2eO2GI=;
  b=mA/oJVf8Q7tJC6+9yF/EAu9Rj/dOHbxo+meiTy61BWO0or+Ff7NQ4cvc
   GqKPXX4RdJVsU4GRXWCC5/BSItuB6rShJn531yXfSCckFuNSj6bKgWvzh
   r4H3bqTfLef8RnTwb/COvAOGSuBirvCenTmYAwqksbaqQogMbxU656a89
   /GbFXysrL4M/sCGY/a831Hms15sjqpK1yFzSnXkrgvDHJDje7+arOoyUT
   F5bmEm2F/Swaym2JCOyzc4W2SxxZnqC18Gs2bwm1tU5K3+TZxMM0z/VLT
   DyjCPHxU+mxo1gbLPf6ZnnrBu5Cy086Qwhm4qcKMWADYVVjNanmeF7k5z
   Q==;
X-CSE-ConnectionGUID: PSV5ktXATuqBpXTbRd85aw==
X-CSE-MsgGUID: DkywSBKZTtOObgor8Z0sbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1645230"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1645230"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:52:00 -0700
X-CSE-ConnectionGUID: gGR7B+poQ+e5x2JnG+mAmg==
X-CSE-MsgGUID: 7+LH8CDkQK6yKT+MqR6S6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="5995300"
Received: from unknown (HELO [10.238.0.97]) ([10.238.0.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 17:51:55 -0700
Message-ID: <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
Date: Mon, 26 Oct 2026 08:51:53 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, hpa@zytor.com, dave.hansen@intel.com, kas@kernel.org,
 rick.p.edgecombe@intel.com, jgg@nvidia.com, nicolinc@nvidia.com,
 aik@amd.com, aneesh.kumar@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, yilun.xu@linux.intel.com, chao.gao@intel.com,
 vishal.l.verma@intel.com, kevin.tian@intel.com, chao.p.peng@intel.com
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20260924041032.1096569-4-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> Introduce wrapper tdx_mcall_tdi_read() to provide tdx-guest driver with a
> standard interface for querying specific metadata fields from a target
> Trust Device Interface Control Structure (TDI_CS).
> 
> Explicitly mapping architectural TDX error codes into Linux POSIX errno
> with two helpers, introducing tdx_mcall_to_errno() to handle general
> module calls, while introducing tdx_mcall_tdi_to_errno() specifically for
> TDI related module calls.

Set aside why mapping architectural TDX error codes into Linux POSIX errno is
needed and what it brings, I think the common enabling order is one prep patch
to introduce tdx_mcall_to_errno() and turn existing users to use it. Then this
patch introduces tdx_mcall_tdi_to_errno() to use it as well.

> Unlike TDG.VP.VMCALL based hypercalls which communicate with the host,
> TDG.TDI.RD is a module call (mcall) that communicates directly with the
> TDX module. This distinction is reflected in the tdx_mcall_ naming
> prefix, as opposed to tdx_hcall_ used for host-directed hypercalls.

I would say this paragraph is not needed. It's not the first patch to introduce
hcall and mcall.

> Note that while host-bound hypercalls (such as tdx_hcall_tdcm()) pass a
> platform-specific Device Identifier (devid), the func_id parameter used
> here is defined by the TDISP standard (refer to Section 11.2 "TDISP
> rules"). Although these values result in the same underlying bit format
> when the PCI segment is zero, they represent separate structural
> abstractions in their respective specifications.

This paragraph seems to provide help but it doesn't look to help (at least for
me). Because until now there are only the helper defined but no user, I still
don't know what specific values will be passed to them.

> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c           |  5 ----
>  arch/x86/coco/tdx/tdx_connect.c   | 41 +++++++++++++++++++++++++++++++
>  arch/x86/include/asm/shared/tdx.h |  1 +
>  arch/x86/include/asm/tdx.h        | 20 +++++++++++++++
>  4 files changed, 62 insertions(+), 5 deletions(-)
> 

...

> diff --git a/arch/x86/include/asm/shared/tdx.h b/arch/x86/include/asm/shared/tdx.h
> index f46a3171a512..665c12925ff6 100644
> --- a/arch/x86/include/asm/shared/tdx.h
> +++ b/arch/x86/include/asm/shared/tdx.h
> @@ -20,6 +20,7 @@
>  #define TDG_MEM_PAGE_ACCEPT		6
>  #define TDG_VM_RD			7
>  #define TDG_VM_WR			8
> +#define TDG_TDI_READ			67

Please name it TDG_TDI_RD to keep it consistent with TDG_VM_RD

