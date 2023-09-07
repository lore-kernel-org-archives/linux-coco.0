Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA3712B63
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101886; x=1725637886;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6EsGUJGhX1zT+Uyl+vPXWvJ0hitAvo76hypLco20y4Y=;
  b=eQzq+RuxCvmYs5gwVa0CmmuEn6yIa/PyxstvRIhlNdG+Xq/KRDlb25h+
   FbrxDiwfEDgIOmMcP+yH51LU/A90/Wk/w6mXj/pv2FIjM//mhHgIOBIgf
   bkoK+cCHlIPibWfJYP+cmVUNfNEr4P7MqE4BRFaaLyILHWIUlcWrQ09Dn
   TXliaHy7A9Q74ZZY12brulsYj3LZIEl7V3/dthqK86SUrgfB2X9IsVHXV
   /RJ4agUQ+V5SL8mnp0XcEqPo1qLm6ab6rAxsWrc8Y7xzsY/eTQ++iw5pM
   5Wd5hSdixKn56OgiKZrAAAhBiCh4iDlJ8I/grRsGz41osIwqDgYy5YzjE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="408388052"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="408388052"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="915793424"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="915793424"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:51:06 -0700
Message-ID: <5a188bb6-add4-0522-069f-18fbd34aff16@intel.com>
Date: Thu, 7 Sep 2023 08:51:06 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] proc/vmcore: Do not map unaccepted memory
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>,
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
 <30d0cebb-13f9-572e-9baa-b7450fec9108@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <30d0cebb-13f9-572e-9baa-b7450fec9108@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/7/23 08:44, Adrian Hunter wrote:
> On 7/09/23 18:39, Dave Hansen wrote:
>> On 9/6/23 00:39, Adrian Hunter wrote:
>>> @@ -559,7 +567,8 @@ static int vmcore_remap_oldmem_pfn(struct vm_area_struct *vma,
>>>  	 * pages without a reason.
>>>  	 */
>>>  	idx = srcu_read_lock(&vmcore_cb_srcu);
>>> -	if (!list_empty(&vmcore_cb_list))
>>> +	if (!list_empty(&vmcore_cb_list) ||
>>> +	    range_contains_unaccepted_memory(paddr, paddr + size))
>>>  		ret = remap_oldmem_pfn_checked(vma, from, pfn, size, prot);
>>>  	else
>>>  		ret = remap_oldmem_pfn_range(vma, from, pfn, size, prot);
>> The whole callback mechanism which fs/proc/vmcore.c::pfn_is_ram()
>> implements seems to be in place to ensure that there aren't a billion
>> different "ram" checks in here.
>>
>> Is there a reason you can't register_vmcore_cb() a callback to check for
>> unaccepted memory?
> Someone asked for the change to be in arch-independent code... 😉

That doesn't really answer my question.  virtio_mem_init_kdump(), for
instance, is in arch-independent code.


