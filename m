Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292465;
	b=SnzeB+qY2jpCgSWabv4IrdRxQDmLBa/rQlagSRSKiEMq2/i0/byAvMAYdfz1UrGm2ySC
	 fxkNoKxxOHY1c4WNQ63kkSSalJU3y0WD7bKbL+gczTfFlnwBVj4i5pBOz5ZM4mT4lFeYc
	 ncrjMGuE6RQTGtGdlj5kX9XrgzFjvDrHHHyqrpP+WWxUj6k3CMdTEx0K8ZLRnz8fu6n1F
	 wdraAxNv89TmM+1fMj1oWs1NtAMKW2r4Tde46hSHeb3jQCu4bdB48/bnAExRpoK0kEzXM
	 71LMoi3RUoFiwDLy2uEaDC9CS3+eh85+cCmY6pcBmSi2RuhteYA2J7ZgCz61TKpueMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292465;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TB1USGVTx640Zvbk135mn4iYv7WXgIneZLftabfVllM=;
	b=wxCrAZuqcLX8y2P60VRWKx6W9wp8ssv6dR4kI4RQDs3gDQZYjKHoJzfxdlw1m259TU/X
	 pwVvxUc7kemom/9z0qN6T3sjVPTIEtW26n2a0+xNWO0LBjQcUrB2l7DcHl3zQEQaR0Qqf
	 NOH4uWm/xvg8IlcLWRq34BXP/UeELIuOgOAUH7dQdegMTHCG38gjFtlug9KsTFE6KElMS
	 AlL1dALAGUk0migV4gJuuiyvVwVrXJG68KQHvO4l7O3G5o6JeIzs6AE6552XGnT1i2500
	 j0AVC/13WNLkVaJdXmw+8JNlPsCZQzmpWak3iOIpE0NTQVTBWe4RRqI/mOl3NJM6sSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Db5IaQKZ;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD71606A321
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 06:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD71606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Db5IaQKZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794292465; x=1825828465;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rFkt1BT6fyDbG06HCBrjcXVAu+RVbJ7nRpLMtE7qmTo=;
  b=Db5IaQKZDAydXusbbLPH9pe7EGSxMaJUEW6s/6sKRN61gYQVjgoHCKt4
   pUl4zLlv1u39vv70brP846YsbhOYiYBMlox/PqafSBzFBig3ksHUqRe1L
   wdAs3Q841TIuQDmioKhL3DfncfqXlnEUSj7nw9xbbAKMvBHzIr4tnQ48x
   P1UW+7YKv/iwf5YGILTMiT0e1zWwn6vepn3HU9jORCwp1VbkT1oo0YJZK
   laG0/VUmS4FhZaYdeVB4tR8k5tN51sElpbAsyngptEeAg9kbNsE1LA5BR
   vrzEzbvbtj7cMEow1AgVWUUjqsXRZ4a5iXpgX9HKhKzOYf7F7QgntETJT
   A==;
X-CSE-ConnectionGUID: zjtVW62RQAGQB3i9FLrNNw==
X-CSE-MsgGUID: XaZHYYMvQYeu9dghBJkQ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2898312"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2898312"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:34:24 -0800
X-CSE-ConnectionGUID: /55pxstLQWOvefAU4Z9o5Q==
X-CSE-MsgGUID: e0nCUlzYQqur3E6icwfX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8375379"
Received: from unknown (HELO [10.238.3.153]) ([10.238.3.153])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:34:20 -0800
Message-ID: <dc2d49c8-18ac-4f24-bd49-1f81ce300562@linux.intel.com>
Date: Tue, 10 Nov 2026 14:34:17 +0800
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] x86/virt/seamldr: Support large TDX module
 binaries
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "Gao, Chao" <chao.gao@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Van De Ven, Arjan" <arjan.van.de.ven@intel.com>,
 "Xu, Yilun" <yilun.xu@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "kas@kernel.org" <kas@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>
References: <20261106132159.1551365-1-chao.gao@intel.com>
 <20261106132159.1551365-2-chao.gao@intel.com>
 <0ee3d9592e4e73bd0e5bedafc836033fdfc9f120.camel@intel.com>
From: Binbin Wu <binbin.wu@linux.intel.com>
Content-Language: en-US
In-Reply-To: <0ee3d9592e4e73bd0e5bedafc836033fdfc9f120.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 6:34 AM, Edgecombe, Rick P wrote:
> On Fri, 2026-11-06 at 05:21 -0800, Chao Gao wrote:
>> The module binary is handed to P-SEAMLDR as a list of page physical
>> addresses in 'struct seamldr_params'. The list has 496 entries, which
>> caps a module at 496 pages.
> 
> nit. change it to "...caps a module at the same number of pages".
> 
>>
>> TDX modules are gaining features and are about to outgrow that limit.
>>
>> The P-SEAMLDR ABI was extended to chain the list across 4KB pages. For
>> a module over 495 pages, the last of the 496 entries points to another
>> page of entries instead of to a module page. The last entry of that
>> page can point to yet another page, and so on, until every module page
>> is listed.
>>
>> Grow module_pages_pa_list[] so that 'struct seamldr_params' spans
>> multiple pages (16 for now), and use the extra pages as the chained
>> pages. The last entry of each page then points to the entry right after
>> it, which starts the next page. These link entries do not hold module
>> pages, so leave them out of the maximum module page count.
>>
>> The 16-page size is somewhat arbitrary. It fits modules of up to about
>> 32MB, far above the roughly 2MB of current modules. It wastes 60KB for
>> today's modules, which is fine because the memory is freed right after
>> the update. Sizing module_pages_pa_list[] per module would mean either
>> moving the allocation after the image header is validated, or allocating
>> from an unvalidated page count. Either way it is more code churn.
>>
>> Do not query P-SEAMLDR for chaining support. Userspace selects the update
>> image and is responsible for ensuring the module is compatible with
>> P-SEAMLDR.

Although the change log above has mentioned "For a module over 495 pages,
...", a 496-page module was compatible with the P-SEAMLDR without chaining
support, but now it requires P-SEAMLDR with chaining support.  Is it worth
calling out this change to userspace?

>>
>> Thanks to Yilun for the idea of allocating the chain pages together
>> with 'struct seamldr_params'.
> 
> I'm not sure what this means.
> 
>>
>> AI was used under supervision to review code and workshop logs.
> 
> Same comment as on the next patch.
> 
>>
>> Signed-off-by: Chao Gao <chao.gao@intel.com>
>> ---
>> v2:
>>  - Make 'struct seamldr_params' a fixed 16 pages instead of sizing it
>>    to each module, capping modules at about 32MB. [Rick]
>>  - Drop the patch that moved the allocation after image validation. [Rick]
>> ---
>>  arch/x86/virt/vmx/tdx/seamldr.c | 32 +++++++++++++++++++++++++-------
>>  1 file changed, 25 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
>> index b1137ca6150d..087bdf10a9a7 100644
>> --- a/arch/x86/virt/vmx/tdx/seamldr.c
>> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
>> @@ -24,7 +24,18 @@
>>  #define P_SEAMLDR_INFO			0x8000000000000000
>>  #define P_SEAMLDR_INSTALL		0x8000000000000001
>>  
>> -#define SEAMLDR_MAX_NR_MODULE_PAGES	496
>> +/*
>> + * module_pages_pa_list[] spans multiple pages. The last entry of each
>> + * page points to the next page and does not hold a module page, so the
>> + * maximum number of module pages is the array size minus one entry per
>> + * page.
>> + *
>> + * SEAMLDR_PARAMS_NR_PAGES is somewhat arbitrary. It allows modules of
>> + * up to about 32MB. Increase it if modules outgrow that.
>> + */
>> +#define SEAMLDR_PARAMS_NR_PAGES		16
>> +#define SEAMLDR_NR_MODULE_PA_ENTRIES	(496 + 512 * (SEAMLDR_PARAMS_NR_PAGES - 1))
> 
> I think you should describe the math a little bit here. 496 is the space in the
> original format, but the last one is now a pa pointer, right? So can't be used
> as a page of module data. And then each successive page is 511 entries and then
> a pa pointer? So is the math actually right?

My understanding is MODULE_PA_ENTRIES hold both addresses of module pages and
the pointers to the next page.  SEAMLDR_MAX_NR_MODULE_PAGES below is the page
number for the TDX module.

> 
>> +#define SEAMLDR_MAX_NR_MODULE_PAGES	(SEAMLDR_NR_MODULE_PA_ENTRIES - SEAMLDR_PARAMS_NR_PAGES)
>>  #define SEAMLDR_MAX_NR_SIG_PAGES	1
>>  
>>  /*
>> @@ -48,10 +59,10 @@ struct seamldr_params {
>>  	u64	sigstruct_pages_pa_list[SEAMLDR_MAX_NR_SIG_PAGES];
>>  	u8	reserved[104];
>>  	u64	module_nr_pages;
>> -	u64	module_pages_pa_list[SEAMLDR_MAX_NR_MODULE_PAGES];
>> +	u64	module_pages_pa_list[SEAMLDR_NR_MODULE_PA_ENTRIES];
>>  } __packed;
>>  
>> -static_assert(sizeof(struct seamldr_params) == 4096);
>> +static_assert(sizeof(struct seamldr_params) == SEAMLDR_PARAMS_NR_PAGES * PAGE_SIZE);
>>  
>>  /*
>>   * Serialize P-SEAMLDR calls since the hardware only allows a single CPU to
>> @@ -129,17 +140,24 @@ struct tdx_image {
>>  /*
>>   * Given a vmalloc() allocation, write all of the backing physical
>>   * addresses to pa_list[]. Caller guarantees that the array is big
>> - * enough.
>> + * enough. If pa_list[] spans multiple pages, point the last entry
>> + * of each page to the next page.

I was wondering why SEAMLDR_MAX_NR_MODULE_PAGES	is not
(SEAMLDR_NR_MODULE_PA_ENTRIES - SEAMLDR_PARAMS_NR_PAGES + 1), since I thought
the last page should all be the addresses for module pages.

But I find the code below always treats the last entry of a page as the pointer
to the next page, i.e. SEAMLDR_MAX_NR_MODULE_PAGES is indeed
(SEAMLDR_NR_MODULE_PA_ENTRIES - SEAMLDR_PARAMS_NR_PAGES), but I am not sure the
comment is clear enough.

>>   */
>>  static void populate_pa_list(u64 *pa_list, const u8 *vmalloc_addr, u32 vmalloc_len_pages)
>>  {
>> -	int i;
>> +	int i, j;
>>  
>> -	for (i = 0; i < vmalloc_len_pages; i++) {
>> +	for (i = 0, j = 0; i < vmalloc_len_pages; i++) {
>>  		unsigned long offset = i * PAGE_SIZE;
>>  		unsigned long pfn = vmalloc_to_pfn(&vmalloc_addr[offset]);
>>  
>> -		pa_list[i] = pfn << PAGE_SHIFT;
> 
> How about a little:
> /* If the current entry is the last in the page. */
> 
>> +		if (PAGE_ALIGNED(&pa_list[j + 1])) {
>> +			pa_list[j] = __pa(&pa_list[j + 1]);
>> +			j++;
>> +		}
>> +
>> +		pa_list[j] = pfn << PAGE_SHIFT;
>> +		j++;
>>  	}
>>  }
>>  
> 

