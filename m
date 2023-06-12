Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECB61C75F
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686584368; x=1718120368;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j+rWQ8uomjRkNZBpW4VaiwZ0eeJFJe8H9MzLKuSwh4c=;
  b=FQlHMzxJBoEOZ8lB7jTNXl00gHlHQmFMFUXtN925mDHg12nIUMXooH1t
   Y9ucy+K7KTBn9F+9rmbxq12P4EHqcvBq2M1RyAC64jQNkz+2zXvCgR2QX
   qvD/eDrIqUTT/0jz1iPtOrdtWFmPZy0roZd205IydpZhoEsulWCJqsx1w
   NpIyXtSp1fY+MC7fpsckrSurk4TSs2h7PcqKJjJj1n5cMNIHLDH5AzyvB
   xEOL4uWUIgNHV37JLNFJWyOZ46hHH3OMuq22v3CfTPWFTfwU7J1qcdQ0A
   B6R0emt7lQTaWqFHPOSLj2xpfBeZl02Pp0Pr1JJ/TsBlEETuKEB/sGGki
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="356966619"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="356966619"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="714434993"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="714434993"
Received: from spmantha-mobl1.amr.corp.intel.com (HELO [10.209.43.2]) ([10.209.43.2])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:39:23 -0700
Message-ID: <696ea7fe-3294-f21b-3bc0-3f8cc0a718e9@intel.com>
Date: Mon, 12 Jun 2023 08:39:23 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 08/51] x86/speculation: Do not enable Automatic
 IBRS if SEV SNP is enabled
Content-Language: en-US
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
 marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 alpergun@google.com, dgilbert@redhat.com, jarkko@kernel.org,
 ashish.kalra@amd.com, nikunj.dadhania@amd.com, liam.merwick@oracle.com,
 zhi.a.wang@intel.com, Kim Phillips <kim.phillips@amd.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-9-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230612042559.375660-9-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/23 21:25, Michael Roth wrote:
> A hardware limitation prevents the host from enabling Automatic IBRS
> when SNP is enabled.  Instead, fall back to retpolines.

"Hardware limitation"?  As in, it is a documented, architectural
restriction?  Or, it's a CPU bug?

> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index f9d060e71c3e..3fba3623ff64 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -1507,7 +1507,12 @@ static void __init spectre_v2_select_mitigation(void)
>  
>  	if (spectre_v2_in_ibrs_mode(mode)) {
>  		if (boot_cpu_has(X86_FEATURE_AUTOIBRS)) {
> -			msr_set_bit(MSR_EFER, _EFER_AUTOIBRS);
> +			if (!cpu_feature_enabled(X86_FEATURE_SEV_SNP)) {
> +				msr_set_bit(MSR_EFER, _EFER_AUTOIBRS);
> +			} else {
> +				pr_err("SNP feature available, not enabling AutoIBRS on the host.\n");
> +				mode = spectre_v2_select_retpoline();
> +			}

I think this would be nicer if you did something like:

	if (cpu_feature_enabled(X86_FEATURE_SEV_SNP))
		setup_clear_cpu_cap(X86_FEATURE_AUTOIBRS);

somewhere _else_ in the code instead of smack-dab in the middle of the
mitigation selection.
