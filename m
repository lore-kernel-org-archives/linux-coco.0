Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B09D1DFEC
	for <linux-coco@lists.linux.dev>; Tue, 10 Oct 2023 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHwEciX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946008; x=1728482008;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=STfmPYVLdo6+qt87QB/G2RvqDg2ED/4+X+sOB+AaltU=;
  b=AHwEciX6d9KQBggrcmhYcKtJiTJGQ3X8dD7Fkx0GdCqYHQKsBA1zF0rw
   mHjusCAIlbqpRT0UhrKEyxos+nIS5q8iXRdTqJbL4nylSNychkvLPJU+U
   ATJqvMnb/2FR/HzkRXQ1r37C4J2u5c908vm84nSkEi52VFr+aaJTBnzgh
   lceLAl0Ta3yWK4n/ExZ91uqBtpjVb25EGOzkM8yGHpa9LRFZVbvi9mrpi
   diPsuibH+xY2aDZHJz2DvBUCIao9IgsaA4EbDrHIS8TNX9naGSdDgskpz
   t5rTCVjU4vMLXTwR05WIzUX7s108/RM9GRMdcXYmLD7AWQk5Y8Y4So5PJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="2990215"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2990215"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747075063"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747075063"
Received: from patinira-mobl.amr.corp.intel.com (HELO [10.212.128.216]) ([10.212.128.216])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:53:27 -0700
Message-ID: <b69b21b8-7915-4854-b5f7-5124cd4e5bbf@linux.intel.com>
Date: Tue, 10 Oct 2023 06:53:27 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] x86/kvm: Do not try to disable kvmclock if it was
 not enabled
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, kexec@lists.infradead.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231005131402.14611-1-kirill.shutemov@linux.intel.com>
 <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20231005131402.14611-5-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/5/2023 6:13 AM, Kirill A. Shutemov wrote:
> kvm_guest_cpu_offline() tries to disable kvmclock regardless if it is
> present in the VM. It leads to write to a MSR that doesn't exist on some
> configurations, namely in TDX guest:
> 
> 	unchecked MSR access error: WRMSR to 0x12 (tried to write 0x0000000000000000)
> 	at rIP: 0xffffffff8110687c (kvmclock_disable+0x1c/0x30)
> 
> kvmclock enabling is gated by CLOCKSOURCE and CLOCKSOURCE2 KVM paravirt
> features.
> 
> Do not disable kvmclock if it was not enumerated or disabled by user
> from kernel command line.

For the above warning,  check for CLOCKSOURCE and CLOCKSOURCE2
feature is sufficient, right? Do we need to include user/command-line
disable check here?

> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Fixes: c02027b5742b ("x86/kvm: Disable kvmclock on all CPUs on shutdown")
> ---
>  arch/x86/kernel/kvmclock.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> index fb8f52149be9..cba2e732e53f 100644
> --- a/arch/x86/kernel/kvmclock.c
> +++ b/arch/x86/kernel/kvmclock.c
> @@ -22,7 +22,7 @@
>  #include <asm/x86_init.h>
>  #include <asm/kvmclock.h>
>  
> -static int kvmclock __initdata = 1;
> +static int kvmclock __ro_after_init = 1;
>  static int kvmclock_vsyscall __initdata = 1;
>  static int msr_kvm_system_time __ro_after_init = MSR_KVM_SYSTEM_TIME;
>  static int msr_kvm_wall_clock __ro_after_init = MSR_KVM_WALL_CLOCK;
> @@ -195,7 +195,12 @@ static void kvm_setup_secondary_clock(void)
>  
>  void kvmclock_disable(void)
>  {
> -	native_write_msr(msr_kvm_system_time, 0, 0);
> +	if (!kvm_para_available() || !kvmclock)
> +		return;
> +
> +	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE) ||
> +	    kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE2))
> +		native_write_msr(msr_kvm_system_time, 0, 0);
>  }
>  
>  static void __init kvmclock_init_mem(void)

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
