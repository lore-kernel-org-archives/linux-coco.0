Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F6A29B4
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694101157; x=1725637157;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Gc47Wmv9yvPizcQSt3RG5ZLyHOAm3FccQUQk5XxXERw=;
  b=jNw800296+ch3W0iWKXl1mVnTjpYdZtJ6MIcLWD0wDoGrmUAOhbpHbPC
   9VQUi1CMnOXhvpVU5EIBMZI01APXNvDPQQXRuSynh1YCLPk1sdw1iwYwr
   1iq4foC48eCr2KlOgPHPJSlmz/ekwFZaWPHgtzxNOJvZ54jFLUAQ4tQk0
   Xzl5hzV4rPBLbvZ6EtOC7wSohTTkWboy3wrOIfbLL+A9hgQhu9DGDQu0N
   vi0EY2L57jTUYVJuJAue0MndyCxeQX41U78pD6D1fgN7lijUNKDKwwRK4
   Ee4ddS2fJnxHVbqlfi/RamTbVEfyvaWZlkjuat99BDr7/zcY8yAwsPr1p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="463768153"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="463768153"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="865686230"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="865686230"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:39:13 -0700
Message-ID: <21bf2e44-3316-2372-44cb-1488f88650f5@intel.com>
Date: Thu, 7 Sep 2023 08:39:13 -0700
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
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230906073902.4229-2-adrian.hunter@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 00:39, Adrian Hunter wrote:
> @@ -559,7 +567,8 @@ static int vmcore_remap_oldmem_pfn(struct vm_area_struct *vma,
>  	 * pages without a reason.
>  	 */
>  	idx = srcu_read_lock(&vmcore_cb_srcu);
> -	if (!list_empty(&vmcore_cb_list))
> +	if (!list_empty(&vmcore_cb_list) ||
> +	    range_contains_unaccepted_memory(paddr, paddr + size))
>  		ret = remap_oldmem_pfn_checked(vma, from, pfn, size, prot);
>  	else
>  		ret = remap_oldmem_pfn_range(vma, from, pfn, size, prot);

The whole callback mechanism which fs/proc/vmcore.c::pfn_is_ram()
implements seems to be in place to ensure that there aren't a billion
different "ram" checks in here.

Is there a reason you can't register_vmcore_cb() a callback to check for
unaccepted memory?
