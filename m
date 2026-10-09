Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054DF439F7C
	for <linux-coco@lists.linux.dev>; Fri,  9 Oct 2026 06:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526256; cv=none; b=M7inzZm38qzhIDAsFPbzS4dQewY1qU0S2TSFtlk17Q5rvb9KAl9Y+k7PQhChdvksxZukgzZ2UNj2cun1R5cWJznu4jjdleYPp67QTaXkZ24H1WOPAu/5IAIxlAjm6UgM6n69ArtS6sVZMya9eaj5R69hM7vroOyDgoWYRxj9Gk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526256; c=relaxed/simple;
	bh=lWz4osHLrKAgMrC5fleRhH64RQ2aHG2Iofd7MllV4r0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4FfMrVqrl153937GPTwhStq4lVfsETK5+SXrwGkFx7QsWngk36TfZZISdhR88evZ7nHVbls9ubn1ASeGV8lwVLizt0wdMohqdqNo8EIuwXeXjt+1tohyo4N2BEAdeMkHzwVGI0gR/7MDZWKJST2AwtXa5+IUvLMbpaANC3Q0sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aRG74XVr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aRG74XVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791526255; x=1823062255;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lWz4osHLrKAgMrC5fleRhH64RQ2aHG2Iofd7MllV4r0=;
  b=aRG74XVri98HlA+Eag2nD1AJ2rm5nk2MY+16nMaP+xFRaHqtDbzY87PC
   dkuPI7xZgkGL6SZCdvHX8V6ocyPKEZ2YSivDErMujibJl+Nehe0nHS2uN
   J9zVXDoTkrlAmeDCttgft1Zb71RbANi6lqbPCyqxTJEZm8LfrFGMDA/H+
   Ec9Od+ap77HyIrG5cAMHvyyKNpbDCCix68v2wYwkvvCdamIDrjlmJvXjg
   yK6cd/Oc440Tcn5Q4wqkA3VGsTR4Ex9SUHr2KLFwTkMOkkTclszcfKCOC
   NdciF7uwP0soAvA/1MB7/3VVAokUmciRHujuBlIB7FS03MEs7ZUST5RKT
   w==;
X-CSE-ConnectionGUID: J1EQMOJgRkqj8hmsey5LNg==
X-CSE-MsgGUID: 2zY4gbYSQNuowPQn26SHDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="428869"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="428869"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:10:55 -0700
X-CSE-ConnectionGUID: Vt6S9iFySK6VcjFNgQVXVQ==
X-CSE-MsgGUID: WzG4shnSTciyydw5xxCr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2053926"
Received: from yizheliu-ivm.ccr.corp.intel.com (HELO [10.238.208.114]) ([10.238.208.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 23:10:48 -0700
Message-ID: <db4c2dcc-8cd3-49d1-bb46-5c0e35428ec6@intel.com>
Date: Fri, 9 Oct 2026 14:10:46 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/23] tools: include: Add kbuild.h for assembly
 structure offsets
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Binbin Wu
 <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>,
 Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-5-7c62a5d8a992@google.com>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20261001-tdx-selftests-v15-5-7c62a5d8a992@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/2026 3:37 AM, Lisa Wang wrote:
> From: Sagi Shahar <sagis@google.com>
> 
> Add the Kbuild macros needed to enable the filechk_offsets mechanism to
> generate C header files containing structure member offset information.
> 
> Tools depending on assembly code that operate on structures have to
> hardcode the offsets of structure members. The Kbuild infrastructure
> can instead generate C header files with these offsets automatically,
> allowing them to be included in assembly code as symbolic constants.
> 
> For example, the TDX guest boot code requires access to parameters
> passed in the C structure (struct td_boot_parameters). This header
> provides the macros needed to extract these offsets from C code and
> expose them to assembly, ensuring the two remain synchronized.
> 
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Ackerley Tng <ackerleytng@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
>  tools/include/linux/kbuild.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
> new file mode 100644
> index 000000000000..957fd55cd159
> --- /dev/null
> +++ b/tools/include/linux/kbuild.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TOOLS_LINUX_KBUILD_H
> +#define __TOOLS_LINUX_KBUILD_H
> +
> +#define DEFINE(sym, val) \
> +	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> +
> +#define OFFSET(sym, str, mem) \
> +	DEFINE(sym, __builtin_offsetof(struct str, mem))
> +
> +#endif /* __TOOLS_LINUX_KBUILD_H */
> 

