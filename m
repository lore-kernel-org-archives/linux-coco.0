Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E338F8C
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiEi4KZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696617236; x=1728153236;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LLZX7zRwrS6v1TQS+z2JHoWVTzAPsFpDcoMbYNf7c0Y=;
  b=QiEi4KZpFkTEgRReaD0kVoCKJ9PW0TykLO5qoW/3hQT1YwNsfrIBbBPL
   DBNyEaTkfProUkn3LBOUngtIWyNLnvfau3PAhnYYhosIMAGWf7QdpAvPB
   m15JHq46lqyHjB2REf5hoo8CeTRmO494JTUIiFs4sOmmNEkxgfn7R4KPW
   E755ZRTxuqkV0mC6ZwyrMDs/98PqdBHAh8vPHYpGXX+2C06cvKBV3E3Bz
   bUZXfGhoeOLDbIqiFOsH1x70suZSdv4qO+KyYfd8fzxtJ/wfxCUjMRj0q
   r47mAcXx6OmLjFLK1N6zoWnqbEMWyh80AFR3m2xmeFJLLrJh6+qb8bUFL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="387688601"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="387688601"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 11:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="745950981"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="745950981"
Received: from wangz2-mobl.amr.corp.intel.com (HELO [10.209.88.26]) ([10.209.88.26])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 11:33:46 -0700
Message-ID: <2be8a356-79c8-49a0-ba93-2a92df119af3@linux.intel.com>
Date: Fri, 6 Oct 2023 11:33:47 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] x86/acpi: Extract ACPI MADT wakeup code into a
 separate file
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
 <20231005131402.14611-2-kirill.shutemov@linux.intel.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20231005131402.14611-2-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kirill,

On 10/5/2023 6:13 AM, Kirill A. Shutemov wrote:
> In order to prepare for the expansion of support for the ACPI MADT
> wakeup method, the relevant code has been moved into a separate file.
> A new configuration option has been introduced to clearly indicate
> dependencies without the use of ifdefs.
> 
> There have been no functional changes.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/Kconfig                   |  7 +++
>  arch/x86/include/asm/acpi.h        |  5 ++
>  arch/x86/kernel/acpi/Makefile      | 11 ++--
>  arch/x86/kernel/acpi/boot.c        | 86 +-----------------------------
>  arch/x86/kernel/acpi/madt_wakeup.c | 80 +++++++++++++++++++++++++++
>  5 files changed, 99 insertions(+), 90 deletions(-)
>  create mode 100644 arch/x86/kernel/acpi/madt_wakeup.c
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 3154dbc49cf5..7368d254d01f 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1108,6 +1108,13 @@ config X86_LOCAL_APIC
>  	depends on X86_64 || SMP || X86_32_NON_STANDARD || X86_UP_APIC || PCI_MSI
>  	select IRQ_DOMAIN_HIERARCHY
>  
> +config X86_ACPI_MADT_WAKEUP
> +	def_bool y
> +	depends on X86_64
> +	depends on ACPI
> +	depends on SMP
> +	depends on X86_LOCAL_APIC
> +
>  config X86_IO_APIC
>  	def_bool y
>  	depends on X86_LOCAL_APIC || X86_UP_IOAPIC
> diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
> index c8a7fc23f63c..b536b5a6a57b 100644
> --- a/arch/x86/include/asm/acpi.h
> +++ b/arch/x86/include/asm/acpi.h
> @@ -73,6 +73,11 @@ static inline bool acpi_skip_set_wakeup_address(void)
>  
>  #define acpi_skip_set_wakeup_address acpi_skip_set_wakeup_address
>  
> +union acpi_subtable_headers;
> +
> +int __init acpi_parse_mp_wake(union acpi_subtable_headers *header,
> +			      const unsigned long end);
> +

IMO, you don't need to declare acpi_parse_mp_wake() in asm/acpi.h. Since the
only user of this function is in arch/x86/kernel/acpi, you can either create
a header file there or re-use sleep.h.

If you want to leave it here, do you want to protect it with
CONFIG_X86_ACPI_MADT_WAKEUP?


-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
