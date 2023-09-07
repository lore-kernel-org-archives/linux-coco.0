Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBDF12B76
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101667; x=1725637667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fFdJWlOfOQFNWE/wQ1sARfEDpEEqtJd3bE+CeaqxZ+s=;
  b=Sfwf9pFTovtX3sbY2QSAgIVS3i+StBa8o3lGp2U/tjcZLH/3yvPm5Kw/
   EfReBYU1/HclnIoSbkMPFG5ICI/06oFD8eZMV/bLZPaX6Lmrb8TL7tqTJ
   r0vrYj7Nm7oIdGYe3sffwPcmDUIEtzs7XCx2VjuIgI4mWtwtinzw3bzB8
   /8A0nC3ZQlsWex8tVyhSS1hqZTrMzmA5QAre7t2PUWC9rQtSHFhhdX62T
   yIFn9iarfsoMb1qLM7ub+W2ectonF5Q7k6yJPq07RuT0O/eLdUh35Bf4K
   v1WxdYJcMOlzNkABoS1K2d2hBgS0Y5seHWzfXDjCf+J2HXxjQmrm9+i/k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443807583"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="443807583"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988818775"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988818775"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.34.181])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:44:11 -0700
Message-ID: <30d0cebb-13f9-572e-9baa-b7450fec9108@intel.com>
Date: Thu, 7 Sep 2023 18:44:05 +0300
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] proc/vmcore: Do not map unaccepted memory
To: Dave Hansen <dave.hansen@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@linux.ibm.com>,
 Lorenzo Stoakes <lstoakes@gmail.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-2-adrian.hunter@intel.com>
 <21bf2e44-3316-2372-44cb-1488f88650f5@intel.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <21bf2e44-3316-2372-44cb-1488f88650f5@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/09/23 18:39, Dave Hansen wrote:
> On 9/6/23 00:39, Adrian Hunter wrote:
>> @@ -559,7 +567,8 @@ static int vmcore_remap_oldmem_pfn(struct vm_area_struct *vma,
>>  	 * pages without a reason.
>>  	 */
>>  	idx = srcu_read_lock(&vmcore_cb_srcu);
>> -	if (!list_empty(&vmcore_cb_list))
>> +	if (!list_empty(&vmcore_cb_list) ||
>> +	    range_contains_unaccepted_memory(paddr, paddr + size))
>>  		ret = remap_oldmem_pfn_checked(vma, from, pfn, size, prot);
>>  	else
>>  		ret = remap_oldmem_pfn_range(vma, from, pfn, size, prot);
> 
> The whole callback mechanism which fs/proc/vmcore.c::pfn_is_ram()
> implements seems to be in place to ensure that there aren't a billion
> different "ram" checks in here.
> 
> Is there a reason you can't register_vmcore_cb() a callback to check for
> unaccepted memory?

Someone asked for the change to be in arch-independent code... ;-)

