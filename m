Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742649;
	b=PGal/Nj2iN6YhsCXNSpAgg8bFJyLx58UAnCYD5tI44IQpPyEfszV/zWDv5tKXX4hR2vo
	 odZga5oGcSlVSp4QMBc4dP2x8dDgami60WoyqSx4cJx0uhuvuYQPxuEk85M4UXUKIjFs3
	 SarThMEz5dL+FUIiKUkL87HjVixrbFPFeWeN/ucxphzmo8ImTmASV783EWPo1WaTcpJ0y
	 HrUT08Jfb0G6o6725gTaElsO2V4InUO/R5/6l6P9lLvJi1CBSXB9oQcuZ44mWJjlSjyh/
	 13519Wc9wL/o0GtzTUd8N7Xbd03v8D1F/ZtrZkDrEX1BKDJCX67wKyBvRFXEpACslxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NspgpVN/iGeXqQA4hXTiaDm9SkSYHuM4hgWy6uCGbYc=;
	b=4l5cxNAcehBDcEkiGepRN0WfTX9KwPxsT0DpDS6svslQ68JqhiJjEG9jDxSaamYsdpv5
	 CNuGUug+nUMFniYiJtUy0GgNuzflBezzMiOnco5H6KQ08YQFTrLkmBlMX5ghp0tozmIfY
	 pJW2xvrgRfvAqZXd2vqnA3qwzuKSzZUr6tJO0PafZz4svHjtsoKKWZGwBfvJfVJAZ+QEJ
	 G4MC7JWQE7MaSQCBsWcJ9fS44hhrmUrprpfD82a5AL6oCVvWYXSGNhNzRrmjeNvOYwyw3
	 bKdCBSCCogWc7/zAYfLVjk5DCwWizSR+/p2M8lFubdAimT1nl3sijkXfzgDRmKvokFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InsP505p;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C2606A31A
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 08:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B7C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=InsP505p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792742647; x=1824278647;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eyWX1HCZAF9CzSx0nus5pkufJOkW2YINd4qW7HRe8qE=;
  b=InsP505pz9RUKFQzRH5S0Dq+8oz0W95EhDtdPkYjKLRb1Z6RZTlHl7eW
   OAVjH2OyBzGNsOSN0phNZn2Kl9G1+G+5OOsakH+kwCB+YMQRuBsrd9iGc
   v1Xg5m64wGQcbsTLD/1TKUXUNBlTMGfQkWCPWOYEiB7gJKaw7H3hRzH17
   py6ozS1Qmwpb6JGPOra1Il2iNZb+zms+Z1Xq6afadU/DFP3/sjF4aedyS
   YUutYmefn4GcOtOwNxL3WFBboZdNBxzHw8P5sHH3ubZBTfkhqcd7q50L4
   twCpcYtvFqdYkCM+bs37srD8pbXOdTl1//3JNzqc0eixTGp3YwdjgqV0X
   w==;
X-CSE-ConnectionGUID: JKWmiqjbStqArhiv0An/Xw==
X-CSE-MsgGUID: jSLmsA5tSdKf3MX3SP1BZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1503766"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1503766"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:04:06 -0700
X-CSE-ConnectionGUID: 0JiKgAfeRG+KUuhDyoprcQ==
X-CSE-MsgGUID: FQm/dQJOQVaQg8oYRm1mIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="5336485"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.240.140]) ([10.124.240.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 01:04:02 -0700
Message-ID: <dbc686a7-35f8-40b6-9f45-d8f05edc4881@intel.com>
Date: Fri, 23 Oct 2026 16:03:59 +0800
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
Subject: Re: [PATCH v2 1/3] x86/cpuid: Mark CPUID function 0x23 as being
 indexed
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 Binbin Wu <binbin.wu@linux.intel.com>, Changyuan Lyu
 <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
References: <20261022210134.612848-1-seanjc@google.com>
 <20261022210134.612848-2-seanjc@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261022210134.612848-2-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/2026 5:01 AM, Sean Christopherson wrote:
> Add function 0x23 to the set of CPUID functions that are indexed, as per
> the SDM and the many sub-leafs defined in leaf_types.h.
> 
> Reported-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Closes: https://lore.kernel.org/all/213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@Intel.com>

> ---
>  arch/x86/include/asm/cpuid/api.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
> index 82eddfa2347b..25b22b173f2a 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -181,6 +181,7 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
>  	case 0x1d:
>  	case 0x1e:
>  	case 0x1f:
> +	case 0x23:
>  	case 0x24:
>  	case 0x8000001d:
>  		return true;

