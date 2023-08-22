Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734C20EE3
	for <linux-coco@lists.linux.dev>; Tue, 22 Aug 2023 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692748017; x=1724284017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LuupoI8LgWADL54KhU16HNxSRfRpUNzvuMRfQ6WO8xc=;
  b=TDr/0MeCFhddmeVOFM1fWkL44fTJJs1JGgq1BuovnL3D+lqIf46ZmWTL
   37dwcM6CJkU5gH4yj+afoJ//7qnid3vwway1/p3lGA3rQF1Z7vpxyYZou
   FLwFAszHoQBfPz2Axe0lWzR8dZv/JZ6htmVOhRkLS94B6zs1PAFq5eYou
   ZOewxHzgn1cLwAE9vlhA0XeFmwFIkW1fgJEqoR3oUEUiA9hjHeTx+xF14
   dCfLgH+ZHRZfdmirqHIxlvccDoEK9qpu62clFjCijAMlO2R1tpXR1+Ira
   st6V8r8yBy3pO3zAiYWrehrDFPcl0etSdJqjfPi/KH6VfXgS65nZq5Opn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405021814"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="405021814"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 16:46:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="686225721"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="686225721"
Received: from tdairo-mobl.amr.corp.intel.com (HELO [10.212.178.80]) ([10.212.178.80])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 16:46:55 -0700
Message-ID: <e4b8bfa6-3029-4b47-968c-c148622c78c7@linux.intel.com>
Date: Tue, 22 Aug 2023 16:46:56 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] x86/tdx: Mark TSC reliable
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>
Cc: Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230822231823.3205-1-kirill.shutemov@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230822231823.3205-1-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/22/2023 4:18 PM, Kirill A. Shutemov wrote:
> In x86 virtualization environments, including TDX, RDTSC instruction is
> handled without causing a VM exit, resulting in minimal overhead and
> jitters. On the other hand, other clock sources (such as HPET, ACPI
> timer, APIC, etc.) necessitate VM exits to implement, resulting in more
> fluctuating measurements compared to TSC. Thus, those clock sources are
> not effective for calibrating TSC.
> 
> In TD guests, TSC is virtualized by the TDX module, which ensures:
> 
>   - Virtual TSC values are consistent among all the TD’s VCPUs;
>   - Monotonously incrementing for any single VCPU;
>   - The frequency is determined by TD configuration. The host TSC is
>     invariant on platforms where TDX is available.
> 
> Reliable TSC is architectural guarantee for the TDX platform and it must
> work for any sane TDX implementation.
> 
> Use TSC as the only reliable clock source in TD guests, bypassing
> unstable calibration.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  v2:
>   - Slightly updated commit message;
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>  arch/x86/coco/tdx/tdx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 1d6b863c42b0..1583ec64d92e 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -769,6 +769,9 @@ void __init tdx_early_init(void)
>  
>  	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
>  
> +	/* TSC is the only reliable clock in TDX guest */
> +	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> +
>  	cc_vendor = CC_VENDOR_INTEL;
>  	tdx_parse_tdinfo(&cc_mask);
>  	cc_set_mask(cc_mask);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
