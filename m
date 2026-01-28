Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB73009D2
	for <linux-coco@lists.linux.dev>; Wed, 28 Jan 2026 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769579930; cv=none; b=jpuTDk5YxATiIIMBUU9DtVaUzn9UNCg7TtJNtZO1U24QrCh7JkdJWkjHmJgAoQAEzEoflb4qsfkY/2AyB5BrbgQvZdq0KWSygEuotoxmubbqqiK3cuPQdwSN5bLS+KhKNLg280CToshRu04wo14l7y6MW/1ETiXsN4tEZMgdv58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769579930; c=relaxed/simple;
	bh=zBb4U0tNNmA+z5EumiDAuX1Xnb3QN8zl4hX05VllGpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ex/I0SvNxia419hR1zwlafDKrJuo2Z/dkB1ulZOf1eW21QzZ2RC1e+Y6S353o81h46Y+gVA+NXUZSbt4DuhuH7XIpSDoLp6SplrUvzai/gkk9DP1CHhkVOueMd408FpYRUdPBiSaKYi/qxIxLi0m9J3aAvImvTiDwbrnx7PNY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZjnP0Vq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZjnP0Vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769579928; x=1801115928;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zBb4U0tNNmA+z5EumiDAuX1Xnb3QN8zl4hX05VllGpk=;
  b=EZjnP0Vq2Ph0SjJdbAt7sckfiF6tfLvD2ljcMXmHNf7wugyjx6LAb891
   GQ/q2ALtTCO3y/v59WiYr1v2/wJtmzG6tyvW+XwrGDQf/6rqVrAtkYL/N
   zw5tSP/oBXmXwH5jPBmoeU42L2U8tXMMmVyGpd0cnjQHd7P8juvwdjaGq
   b0gcrQWxX+7NNCX10/hCWRNo4D9xaJ1Vp9BRfgpZmMfFSGhK7xMH2Os8R
   iO6ywN17CX4Ab2dFs+EHTJuPiAgpma2Qn6YvkQlPiPCn8CGekh3sgtB1c
   +uI6Q+PrdB2Y2JpotUKdatF+KnwgqaAu4SHlzEoLINWU8rptCDYzU+3l/
   Q==;
X-CSE-ConnectionGUID: LgZVc0EwRUid+LGt8nmmEg==
X-CSE-MsgGUID: ktaoiOGvTz+x2jTR/a7GaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81894640"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81894640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 21:58:47 -0800
X-CSE-ConnectionGUID: 28klSJNHQCWazPMmd1Abdw==
X-CSE-MsgGUID: VcMR7A9YQ+a5WXjVWnSBVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="212276513"
Received: from unknown (HELO [10.238.1.231]) ([10.238.1.231])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 21:58:40 -0800
Message-ID: <988f0c43-3335-4673-b0a3-ef587a1f904d@linux.intel.com>
Date: Wed, 28 Jan 2026 13:58:37 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/26] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, x86@kernel.org, reinette.chatre@intel.com,
 ira.weiny@intel.com, kai.huang@intel.com, dan.j.williams@intel.com,
 yilun.xu@linux.intel.com, sagis@google.com, vannapurve@google.com,
 paulmck@kernel.org, nik.borisov@suse.com, zhenzhong.duan@intel.com,
 seanjc@google.com, rick.p.edgecombe@intel.com, kas@kernel.org,
 dave.hansen@linux.intel.com, vishal.l.verma@intel.com,
 Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20260123145645.90444-1-chao.gao@intel.com>
 <20260123145645.90444-7-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260123145645.90444-7-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/23/2026 10:55 PM, Chao Gao wrote:
> P-SEAMLDR is another component alongside the TDX module within the
> protected SEAM range. P-SEAMLDR can update the TDX module at runtime.
> Software can talk with P-SEAMLDR via SEAMCALLs with the bit 63 of RAX
> (leaf number) set to 1 (a.k.a P-SEAMLDR SEAMCALLs).
> 
> P-SEAMLDR SEAMCALLs differ from SEAMCALLs of the TDX module in terms of
> error codes and the handling of the current VMCS.
> 
> In preparation for adding support for P-SEAMLDR SEAMCALLs, do the two
> following changes to SEAMCALL low-level helpers:
> 
> 1) Tweak sc_retry() to retry on "lack of entropy" errors reported by
>    P-SEAMLDR because it uses a different error code.
> 
> 2) Add seamldr_err() to log error messages on P-SEAMLDR SEAMCALL failures.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
