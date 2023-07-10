Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67F17D2
	for <linux-coco@lists.linux.dev>; Mon, 10 Jul 2023 03:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688958312; x=1720494312;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RDmc0GZUWAA3G5ck7OlGOYb7bZsUDXGbc8q2Xk1f4ws=;
  b=nJmm8xs56PcMOIcL21hjMXyKXVWjMYPMCTgjUkz2JhNOcmfwx8JCEent
   d/sGm4qawzHxY8/5+wC28VHku5giNIFIp4Dg1KgvK0UlBwlyAaMsTCaYs
   hGmxFMnfZz/fHDhTe5rjMgolrpNwyotwrSviZ8dO8LPIf2TOLmZ+DJvAb
   ecBXOQBPSXb1lSFWa+a/AvzOXI9PUpxITWvs85/hqaEeLtUF564iNKm/t
   Uz7b2Gt3YZHymCdYIlZ89Ml+GfxVkYw/f0Jn54R1m+cb6eMYuGh2Rzvxm
   70yLtzHx3YtkGe8/5XKPyAYtqzqbKEMhzA4o5kPNBXHsJDSkzihsdg/6/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="354103773"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354103773"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 20:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="697856804"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="697856804"
Received: from krtulig-mobl45.amr.corp.intel.com (HELO [10.212.175.70]) ([10.212.175.70])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 20:05:10 -0700
Message-ID: <fd4cf001-b600-a09e-050b-2b5ed94922da@linux.intel.com>
Date: Sun, 9 Jul 2023 20:05:09 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 05/51] x86/coco: move CONFIG_HAS_CC_PLATFORM check
 down into coco/Makefile
To: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org
Cc: linux-coco@lists.linux.dev, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, vbabka@suse.cz,
 kirill@shutemov.name, ak@linux.intel.com, tony.luck@intel.com,
 marcorr@google.com, alpergun@google.com, dgilbert@redhat.com,
 jarkko@kernel.org, ashish.kalra@amd.com, nikunj.dadhania@amd.com,
 liam.merwick@oracle.com, zhi.a.wang@intel.com,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-6-michael.roth@amd.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20230612042559.375660-6-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/11/23 9:25 PM, Michael Roth wrote:
> Currently CONFIG_HAS_CC_PLATFORM is a prereq for building anything in
> arch/x86/coco, but that is generally only applicable for guest support.> 
> For SEV-SNP, helpers related purely to host support will also live in
> arch/x86/coco. To allow for CoCo-related host support code in
> arch/x86/coco, move that check down into the Makefile and check for it
> specifically when needed.


I think CONFIG_HAS_CC_PLATFORM is not meant to be guest specific (otherwise,
we could have named it CONFIG_HAS_CC_GUEST). Will it create any issue if
we enable it in host?

> 
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Suggested-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  arch/x86/Kbuild        | 2 +-
>  arch/x86/coco/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/Kbuild b/arch/x86/Kbuild
> index 5a83da703e87..1889cef48b58 100644
> --- a/arch/x86/Kbuild
> +++ b/arch/x86/Kbuild
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_ARCH_HAS_CC_PLATFORM) += coco/
> +obj-y += coco/
>  
>  obj-y += entry/
>  
> diff --git a/arch/x86/coco/Makefile b/arch/x86/coco/Makefile
> index c816acf78b6a..6aa52e719bf5 100644
> --- a/arch/x86/coco/Makefile
> +++ b/arch/x86/coco/Makefile
> @@ -3,6 +3,6 @@ CFLAGS_REMOVE_core.o	= -pg
>  KASAN_SANITIZE_core.o	:= n
>  CFLAGS_core.o		+= -fno-stack-protector
>  
> -obj-y += core.o
> +obj-$(CONFIG_ARCH_HAS_CC_PLATFORM) += core.o
>  
>  obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx/

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
