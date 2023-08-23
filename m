Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FB1FAA
	for <linux-coco@lists.linux.dev>; Wed, 23 Aug 2023 18:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692816627; x=1724352627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=f+V+U02QTnQwjuNZYwT0ytaChaCk2mHPyZAVW25ak+c=;
  b=FL9Q9RY1z59iLqk+gv4UDMPCU04BBehr+CF85w0g92qEBd/5YCBdfheC
   26uPRlK8fNzeY5vEl4F9fRGVcB4BE63s6aC8+fQTD7rC1hclBOFkCfTvb
   F40xaVwa0BXI0TPXvALI6B65bWGDxyQ2XWS7jV+FZ/+LAqHR4x+rNaPJv
   M6qrU6S4vLXLmLIbIo6ZDKCAHDpZ2jhxVIEhj9BFKFdRTUykpxlhm16wB
   SBbQQPi40pmu+LPcdpIV0r6Zn3sBc4fbV/eX0YNQ+gQod/wUTUlnPwr+A
   Oh5Fo3w1Xk6DUYHVDU/w1o2dNAzTVi7VruiywvvOUBbf9UuJr8COC0Rk4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373130065"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="373130065"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="983406442"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="983406442"
Received: from ls.sc.intel.com (HELO localhost) ([172.25.112.31])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 11:50:25 -0700
Date: Wed, 23 Aug 2023 11:50:25 -0700
From: Isaku Yamahata <isaku.yamahata@linux.intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>, x86@kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	isaku.yamahata@linux.intel.com, isaku.yamahata@intel.com
Subject: Re: [PATCHv2] x86/tdx: Mark TSC reliable
Message-ID: <20230823185025.GA3637161@ls.amr.corp.intel.com>
References: <20230822231823.3205-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230822231823.3205-1-kirill.shutemov@linux.intel.com>

On Wed, Aug 23, 2023 at 02:18:23AM +0300,
"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:

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
> -- 
> 2.41.0
> 
> 

Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
-- 
Isaku Yamahata <isaku.yamahata@linux.intel.com>
