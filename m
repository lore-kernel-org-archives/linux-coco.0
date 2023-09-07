Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13AC29B4
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694100983; x=1725636983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gAFNTJqAbOYf7VH/NCFNgTzEP7NzuWW3ie9UYXuVLIw=;
  b=iOJ64tqplWrsxzYUFBUcfunG8UQrTiqJqcDSiHxN8qSY6DAbkEYA69HV
   opdDmyKk6Vt9XzvBvNDNIZ688oKFoxY2xC46EhI0RxdupUQFgHfgnJm7y
   zhspI+OjT7mzGDy22Zs3ntuXE98/zwR8OqKjqyHeihd8ywD/vO8dTIBZq
   4Kti/HUz3dBh3kNhJq2w3HfKPKlPdzHpKplcL+/w518sU98qgOXeidGGA
   gFoNN98gbYk7uKg5H46lXTb09I5DiUnrbuA+DOf+7WfPyRtUL7edtAXbr
   56Dhq5DHm8bvvrOyxmPU73VTxQitHm3kNvOFAdAEbiX0o+aMV6tHZPwNN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357698696"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="357698696"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="691833951"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="691833951"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:36:18 -0700
Message-ID: <651365aa-389c-6465-1ad4-49b40036ac38@intel.com>
Date: Thu, 7 Sep 2023 08:36:18 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/3] proc/kcore: Do not map unaccepted memory
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
 <20230906073902.4229-3-adrian.hunter@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230906073902.4229-3-adrian.hunter@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 00:39, Adrian Hunter wrote:
> +static bool pfn_is_unaccepted_memory(unsigned long pfn)
> +{
> +	phys_addr_t paddr = pfn << PAGE_SHIFT;
> +
> +	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
> +}

Please just add this as an inline helper to common code rather than
copying and pasting two copies around the tree.
