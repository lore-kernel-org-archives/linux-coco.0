Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547F43FD29
	for <linux-coco@lists.linux.dev>; Fri, 10 Jul 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702105; cv=none; b=oXLcbS/KBL6V0yQz65irA/vK7oXNEjIgYDxZ+VcyeOLA8LDhN+8k41StL3NeqsF2VkpS9u4F9ogqJkqYwoulXk+tdkrkMwIZbs/7/kKMfJA4rXTzg4mOX5D2HfOSvwnjFXh3xIJvhiSSoMaTV9kIwTJAQ/mEgx78Z0l9DIBdXog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702105; c=relaxed/simple;
	bh=hD3tjN3v4sWK/8RDMRfFJXi0ZRiLXNlQPvrj9YSOjPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIPU6VnroHtcn1sKNS/oMqe1rFT6eceqNfLDRUhlF/nLMgdYkFxDjiH4qKNisxjo4K90w00i3WIFkK5YLtE0so7dCCLlfwGHDuDGf9tvLhk6Z0zsUJFuWgLKgplaWQYcY4IEIFNGnjifnZLFDgMDldTKJqCsvrKBE7tAaDWOlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deUcAjw7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deUcAjw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783702105; x=1815238105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hD3tjN3v4sWK/8RDMRfFJXi0ZRiLXNlQPvrj9YSOjPM=;
  b=deUcAjw7SUxLOnqWnFw/CeVVrAb2pVZTPI6/3cZsorSykZf4/8+Lh/eM
   2n/pJLrFCcOPKqmZizsD2NVr5FRnn8Hj+SAVJ0yA4Hzr3GWTTd3hHhysA
   bDCzrRRx2KtjO8ZtyrsSpWTFWVEmZtwOlvC75IRoQl1bsHlB/jjtRWAtC
   bxT2chNAufbQnJslUpmw3rLwKjiEWkGoOP6GuHlPWPgNVDqfS+RfyO1ve
   mnF+4V7/4G+jTIpWm7WIQ+evFmjHsaZLtGjQlRsTUAq7OkUvzfPNShsjW
   PHwWzjVTW21FFcBuWf48Z1e1g1yUZuJf+2vvWK3R38mvPQT8FwHeBXWZD
   Q==;
X-CSE-ConnectionGUID: b0Baa+LySKijhdD6xCrbTA==
X-CSE-MsgGUID: Xwk4PC4iQiiNGNWF+VLVCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107201099"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107201099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:48:24 -0700
X-CSE-ConnectionGUID: TPekdXm6QFeyR2snD9ujBA==
X-CSE-MsgGUID: LUfFnIGrQbuyaq23s9B0lA==
X-ExtLoop1: 1
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.111.199]) ([10.125.111.199])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:48:23 -0700
Message-ID: <f8ef7a94-7824-4d1f-899a-60a0fbd2e2f7@intel.com>
Date: Fri, 10 Jul 2026 09:48:22 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com,
 dave.hansen@linux.intel.com, yilun.xu@intel.com, chao.gao@intel.com,
 djbw@kernel.org, linux-coco@lists.linux.dev, peter.fang@intel.com,
 xiaoyao.li@intel.com
References: <20260708170330.83850-1-yilun.xu@linux.intel.com>
 <e8aaca8c-6d88-490b-a3ae-c63a9e9a8b90@intel.com>
 <alEXflESyo6ndDTY@thinkstation>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <alEXflESyo6ndDTY@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/10/26 09:21, Kiryl Shutsemau wrote:
> The version is not a register operand, it is part of the function
> number.

I'm not sure why that's important.

Sure, the arg structure is all full registers now. But it's not even all
the registers because RAX isn't there. So let's say we made the data
structure smarter:

struct tdx_module_args {
        union {
                u64 rax;
                struct {
                        u16 function_nr;
                        u8  version
                        u8  padding0;
                        u32 flags;
                };
        };
        u64 rcx;
        u64 rdx;
	...
}

All of the:

        struct tdx_module_args args = {};

instances would default to version=0. It would take a one-liner to get
bit 63 set:

 static int seamldr_call(u64 fn, struct tdx_module_args *args)
 {
 ...
+	args->flags |= SEAMLDR_BIT;
        guard(raw_spinlock)(&seamldr_lock);
        return seamcall_prerr(fn, args);
 }

The truth of the matter is that 'fn' *IS* the RAX from the TDX ABI.
We're carrying it around the kernel in that format, and it just doesn't
work very well.

The alternative is to carry the logical pieces of RAX around the kernel
and them assemble RAX out of them in one (or very few) places. *Not* to
build RAX in the TDX module ABI early far from the TDX module ABI layer
itself.


