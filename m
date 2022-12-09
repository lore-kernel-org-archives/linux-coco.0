Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561AC3214
	for <linux-coco@lists.linux.dev>; Fri,  9 Dec 2022 20:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670619069; x=1702155069;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jyCv6ICFGp0/+vO//DD/UH9+cwvN/sDl/2WmOP10UeM=;
  b=OFfrG+CupEqjAt6cA/QHxQ4s7BBmgOnMrsHpLJU0wkxq3DkvKG4zrIch
   7YDdbMG42tH/x6wMyCvwoI6cFgyBznaR1j6pifsDAHOI4sqTOgOioNoOc
   Gb3pOci+hm7DVgGzWXnFsHI+ro9b8VJBTZCy+4UC7Vov+JPKWxEhg5Rmm
   jPXknDNSuT/WiOpRhOzmwpR8qnOMEAHdV44JpAFS3lLE6mtzMXfFQB2jB
   MA9S9HxSZB4tZ5/QLUF58qtlyN9SGinln0+ERl3tN22uVRcyCSBGWEfDY
   WDBrYDnclT6ZKJ5xTyGDqXMkD1V8OL0inEXqTp8uNdi2J/H9PA9u3K5ib
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="344590294"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="344590294"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 12:51:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="821841732"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="821841732"
Received: from rrode-mobl1.amr.corp.intel.com (HELO [10.251.24.37]) ([10.251.24.37])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 12:51:08 -0800
Message-ID: <2e305bb5-9595-3531-6134-24344ff5c797@linux.intel.com>
Date: Fri, 9 Dec 2022 12:51:07 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] x86/tdx: Use ReportFatalError to report missing
 SEPT_VE_DISABLE
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, x86@kernel.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221209132524.20200-1-kirill.shutemov@linux.intel.com>
 <20221209132524.20200-3-kirill.shutemov@linux.intel.com>
 <e79c4b97-5718-9a60-406f-1df994ba089c@linux.intel.com>
 <20221209170647.r32yjyc3hsqtnffo@box.shutemov.name>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20221209170647.r32yjyc3hsqtnffo@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/22 9:06 AM, Kirill A. Shutemov wrote:
> On Fri, Dec 09, 2022 at 07:42:56AM -0800, Sathyanarayanan Kuppuswamy wrote:
>>
>>
>> On 12/9/22 5:25 AM, Kirill A. Shutemov wrote:
>>> The check for SEPT_VE_DISABLE happens early in the kernel boot where
>>> earlyprintk is not yet functional. Kernel successfully detect broken
>>> TD configuration and stops the kernel with panic(), but it cannot
>>> communicate the reason to the user.
>>>
>>> Use TDG.VP.VMCALL<ReportFatalError> to report the error. The hypercall
>>> can encode message up to 64 bytes in eight registers.
>>>
>>> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
>>> ---
>>>  arch/x86/coco/tdx/tdx.c | 38 +++++++++++++++++++++++++++++++++++++-
>>>  1 file changed, 37 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
>>> index cfd4c95b9f04..8ad04d101270 100644
>>> --- a/arch/x86/coco/tdx/tdx.c
>>> +++ b/arch/x86/coco/tdx/tdx.c
>>> @@ -22,6 +22,7 @@
>>>  
>>>  /* TDX hypercall Leaf IDs */
>>>  #define TDVMCALL_MAP_GPA		0x10001
>>> +#define TDVMCALL_REPORT_FATAL_ERROR	0x10003
>>>  
>>>  /* MMIO direction */
>>>  #define EPT_READ	0
>>> @@ -140,6 +141,41 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
>>>  }
>>>  EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
>>>  
>>> +static void __noreturn tdx_panic(const char *msg)
>>> +{
>>> +	struct tdx_hypercall_args args = {
>>> +		.r10 = TDX_HYPERCALL_STANDARD,
>>> +		.r11 = TDVMCALL_REPORT_FATAL_ERROR,
>>> +		.r12 = 0, /* Error code: 0 is Panic */
>>> +	};
>>> +	union {
>>> +		/* Define register order according to the GHCI */
>>> +		struct { u64 r14, r15, rbx, rdi, rsi, r8, r9, rdx; };
>>> +
>>> +		char str[64];
>>> +	} message;
>>> +
>>> +	/* VMM assumes '\0' in byte 65, if the message took all 64 bytes */
>>> +	strncpy(message.str, msg, 64);
>>> +
>>> +	args.r8  = message.r8;
>>> +	args.r9  = message.r9;
>>> +	args.r14 = message.r14;
>>> +	args.r15 = message.r15;
>>> +	args.rdi = message.rdi;
>>> +	args.rsi = message.rsi;
>>> +	args.rbx = message.rbx;
>>> +	args.rdx = message.rdx;
>>> +
>>> +	/*
>>> +	 * Keep calling the hypercall in case VMM did not terminated
>>> +	 * the TD as it must.
>>> +	 */
>>> +	while (1) {
>>> +		__tdx_hypercall(&args, 0);
>>> +	}
>>
>> Instead of an infinite loop, I'm wondering if the guest should panic after
>> retrying for few times.
> 
> Hm. What difference would it make?

IIUC, the goal of this patch is to report the fatal error to VMM and panic.
But, if VMM does not terminate the guest as we expect, rather than trying 
continuously, isn't it better to panic ourselves? That way the behavior
will be similar to what we have currently.

> 

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
