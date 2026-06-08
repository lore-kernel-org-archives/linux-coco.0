Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6A385D61
	for <linux-coco@lists.linux.dev>; Mon,  8 Jun 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899148; cv=none; b=CsCdXEANBeiE7jJ5BI659VAXpW77Vl2qQ0YoaZInyKId1HkaTuNoD9sa0c9nWKj0dc5LpAmjyrPOZqHVNoBn5pq3oXK4JS6kUaAJhl1aQdQn38/0XKcYflEwHpKOc8GawR7trLTih/WdgnrJDIfrCX8Xo701gaZ498C9+z1S0+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899148; c=relaxed/simple;
	bh=qCMeHBwr6TWsmQ+bl+B/zcnL2DiSkZ/oE+3aF4GmhSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnyRV44F0dYRK2SX0Tax2zRWkZPu2KlyQvsPb0t8YdC2E8TxtYiEcM7yKWWGZBJ8065kZq5/dLhkQ0Mgz2YbQnYB3Zst59huWTcLu9dUf61O9qfF1YSBGTdA0FWMQT7ACG4dm1OFazgwtFPEEVkjJN5CAc7o5jizhPYM/xPuI3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xijhde6t; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xijhde6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780899145; x=1812435145;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qCMeHBwr6TWsmQ+bl+B/zcnL2DiSkZ/oE+3aF4GmhSM=;
  b=Xijhde6tIXMGFc95km5/30uFrSbYVDVIHhZKUFGaqOzwtHgZkCBcWbIM
   9VNtvhu1GuWo3hEYD1uCIfVPrbpp+VhvHZdmT5qDsKQtxk7hIp2jr/LCr
   g2BwQoTEwyNC2/aIZWecrrhODwdAf/arOxOTWlrop+Dh66mmEiSXhEFtl
   wF1XVv0ehKjxgrnuE8YEFPQNKoI6CYiD4Rztc67zhbZRa5Vx9H4LXgg7l
   7M8KRgw1QA7ywJ3uoJjtQPZrljs3v197sozQ+XhZACqBpuGDRpF7K2EPe
   XjJVU+iUi+UwpsiJ0y5TGpKJAa55QDbbc4g6cWceVIORvcwjq9KFjnEOB
   Q==;
X-CSE-ConnectionGUID: 93hAKQ5uRjafVF4SfnNsqg==
X-CSE-MsgGUID: nOEfhxKgSGuzKLnwI3yuvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="85253495"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="85253495"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 23:12:24 -0700
X-CSE-ConnectionGUID: C0aQv9FwT6m15kZMaARK9Q==
X-CSE-MsgGUID: nncQ/FBMSDO5N01bRVVvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; 
   d="scan'208";a="249761536"
Received: from unknown (HELO [10.238.2.24]) ([10.238.2.24])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2026 23:12:18 -0700
Message-ID: <a2496595-7300-41f7-90ac-41fa205ae79d@linux.intel.com>
Date: Mon, 8 Jun 2026 14:12:16 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 06/22] tools: include: Add kbuild.h for assembly
 structure offsets
To: Lisa Wang <wyihan@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Ackerley Tng <ackerleytng@google.com>, Chao Gao <chao.gao@intel.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>,
 Sagi Shahar <sagis@google.com>, Sean Christopherson <seanjc@google.com>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-6-6983ae4c3a4d@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20260521-tdx-selftests-v13-v13-6-6983ae4c3a4d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/2026 7:16 AM, Lisa Wang wrote:
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
> passed in the C structure(struct td_boot_parameters). This header
                           ^
Nit: missing a space. 

> provides the macros needed to extract these offsets from C code and
> expose them to assembly, ensuring the two remain synchronized.
> 
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

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

