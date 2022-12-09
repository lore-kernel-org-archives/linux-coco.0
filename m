Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BCC63B7
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670601048; x=1702137048;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hG4NYNsluE+2FrVCn2dyTAimfT0CMNyI12psTrWqc+8=;
  b=Yqw25mx7gLrJFovISUIu5jXdis4zX/gyjTUgbzvVf1XR6QFUUhTG/9G8
   QY4dJ+NbkxebfkdkUsvP76+yUj/j2+QE6SqZO69D/bk7ilwiS+SvnRAIE
   z2I23pQW1LHZxd+ltyi8ucU3JXEgd5IXjMQtQFbO6ZYjSAdtfOQQiaz2y
   4KErdwSG2wUv3tgZF8ND1Whqt2evwDzJYXz2bUdWDBtzmhnjfdEh4r/z5
   n4pZE4/FnQuBFSgRKNj2p9QnHg6B8Vpj/Og8Df2MoCheroEUmSfv8tl+2
   DbDtAA22BabBL4NmW5bXZoEVzYI+m+XaRifcMw/dp3Dp53WR4U5jQYcFe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315120127"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="315120127"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 07:50:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="647433723"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="647433723"
Received: from rrode-mobl1.amr.corp.intel.com (HELO [10.251.24.37]) ([10.251.24.37])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 07:50:47 -0800
Message-ID: <ac8b6afa-813d-56c7-094a-8891ba69deeb@linux.intel.com>
Date: Fri, 9 Dec 2022 07:50:46 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] x86/tdx: Disable NOTIFY_ENABLES
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-5-kirill.shutemov@linux.intel.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20221209132524.20200-5-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/22 5:25 AM, Kirill A. Shutemov wrote:
> == Background ==
> 
> There is a class of side-channel attacks against SGX enclaves called
> "SGX Step"[1]. These attacks create lots of exceptions inside of
> enclaves. Basically, run an in-enclave instruction, cause an exception.
> Over and over.
> 
> There is a concern that a VMM could attack a TDX guest in the same way
> by causing lots of #VE's. The TDX architecture includes new
> countermeasures for these attacks. It basically counts the number of
> exceptions and can send another *special* exception once the number of
> VMM-induced #VE's hits a critical threshold[2].
> 
> == Problem ==
> 
> But, these special exceptions are independent of any action that the
> guest takes. They can occur anywhere that the guest executes. This
> includes sensitive areas like the entry code. The (non-paranoid) #VE
> handler is incapable of handling exceptions in these areas.
> 
> == Solution ==
> 
> Fortunately, the special exceptions can be disabled by the guest via
> write to NOTIFY_ENABLES TDCS field. NOTIFY_ENABLES is disabled by
> default, but might be enabled by a bootloader, firmware or an earlier
> kernel before the current kernel runs.
> 
> Disable NOTIFY_ENABLES feature explicitly and unconditionally. Any
> NOTIFY_ENABLES-based #VE's that occur before this point will end up
> in the early #VE exception handler and die due to unexpected exit
> reason.
> 
> [1] https://github.com/jovanbulck/sgx-step
> [2] https://intel.github.io/ccc-linux-guest-hardening-docs/security-spec.html#safety-against-ve-in-kernel-code
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---

I don't think you need to explicitly use section names (Background,
problem or solution) in the commit log. But it is up to you.

Rest looks good.


>  arch/x86/coco/tdx/tdx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 0e47846ff8ff..c93c2fd2e113 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -19,6 +19,10 @@
>  #define TDX_GET_VEINFO			3
>  #define TDX_GET_REPORT			4
>  #define TDX_ACCEPT_PAGE			6
> +#define TDX_WR				8
> +
> +/* TDCS fields. To be used by TDG.VM.WR and TDG.VM.RD module calls */
> +#define TDCS_NOTIFY_ENABLES		0x9100000000000010
>  
>  /* TDX hypercall Leaf IDs */
>  #define TDVMCALL_MAP_GPA		0x10001
> @@ -858,6 +862,9 @@ void __init tdx_early_init(void)
>  	tdx_parse_tdinfo(&cc_mask);
>  	cc_set_mask(cc_mask);
>  
> +	/* Kernel does not use NOTIFY_ENABLES and does not need random #VEs */
> +	tdx_module_call(TDX_WR, 0, TDCS_NOTIFY_ENABLES, 0, -1ULL, NULL);
> +
>  	/*
>  	 * All bits above GPA width are reserved and kernel treats shared bit
>  	 * as flag, not as part of physical address.

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
