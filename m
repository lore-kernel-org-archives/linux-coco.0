Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43418163
	for <linux-coco@lists.linux.dev>; Tue,  6 Sep 2022 02:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662431423; x=1693967423;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G15JBOOK8EI0eKdSgCyHHPZ83FHdpeAzR9JiZNu8Z80=;
  b=ctWO8hLyA7EwoykAyUfgcO7CLnzbn5WXDrrbhGZhd9Bh0ocUdSu4K02W
   RdufqUSzCKyzvj5vFYndAxxGBNqUj7qkKE8ZlgnKmQinBmU0E0roafWrq
   FQ6FpyVGD5HLAW1+rOxD4QWuX1sFfnJzwbqAiXyULtCYo2/cfSLxdGuxX
   yj7bkeRYJYxZLDN6/ol0+UkIlpoqyUrXRp2PBqCRs5WW6YqD0iDC4Uipo
   INMvloUCaGJX73bLh6EvRV2o+RHORxKwweoU9lAsQGog+SwlWVjKQqnqI
   JdoKywYJJtI4ZLESDFsaGN5qb/jMOJbG5HWA72Ln6/6YJSCaIfvXNQGjl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="279499843"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="279499843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 19:30:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="643983689"
Received: from chenchar-mobl1.amr.corp.intel.com (HELO [10.212.193.190]) ([10.212.193.190])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 19:30:22 -0700
Message-ID: <0ce441af-c825-3061-ad92-c360c339e924@intel.com>
Date: Mon, 5 Sep 2022 19:30:21 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH Part2 v6 09/49] x86/fault: Add support to handle the RMP
 fault for user address
Content-Language: en-US
To: Ashish Kalra <Ashish.Kalra@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-crypto@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, jroedel@suse.de,
 thomas.lendacky@amd.com, hpa@zytor.com, ardb@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 jmattson@google.com, luto@kernel.org, dave.hansen@linux.intel.com,
 slp@redhat.com, pgonda@google.com, peterz@infradead.org,
 srinivas.pandruvada@linux.intel.com, rientjes@google.com,
 dovmurik@linux.ibm.com, tobin@ibm.com, bp@alien8.de, michael.roth@amd.com,
 vbabka@suse.cz, kirill@shutemov.name, ak@linux.intel.com,
 tony.luck@intel.com, marcorr@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, alpergun@google.com,
 dgilbert@redhat.com, jarkko@kernel.org
References: <cover.1655761627.git.ashish.kalra@amd.com>
 <0ecb0a4781be933fcadeb56a85070818ef3566e7.1655761627.git.ashish.kalra@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <0ecb0a4781be933fcadeb56a85070818ef3566e7.1655761627.git.ashish.kalra@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/22 16:03, Ashish Kalra wrote:
> 
> When SEV-SNP is enabled globally, a write from the host goes through the
> RMP check. When the host writes to pages, hardware checks the following
> conditions at the end of page walk:
> 
> 1. Assigned bit in the RMP table is zero (i.e page is shared).
> 2. If the page table entry that gives the sPA indicates that the target
>    page size is a large page, then all RMP entries for the 4KB
>    constituting pages of the target must have the assigned bit 0.
> 3. Immutable bit in the RMP table is not zero.
> 
> The hardware will raise page fault if one of the above conditions is not
> met. Try resolving the fault instead of taking fault again and again. If
> the host attempts to write to the guest private memory then send the
> SIGBUS signal to kill the process. If the page level between the host and
> RMP entry does not match, then split the address to keep the RMP and host
> page levels in sync.

When you're working on this changelog for Borislav, I'd like to make one
other suggestion:  Please write it more logically and _less_ about what
the hardware is doing.  We don't need about the internal details of what
hardware is doing in the changelog.  Mentioning whether an RMP bit is 0
or 1 is kinda silly unless it matters to the code.

For instance, what does the immutable bit have to do with all of this?
There's no specific handling for it.  There are really only faults that
you can handle and faults that you can't.

There's also some major missing context here about how it guarantees
that pages that can't be handled *CAN* be split.  I think it has to do
with disallowing hugetlbfs which implies that the only pages that might
need splitting are THP's.+	/*
> +	 * If its an RMP violation, try resolving it.
> +	 */
> +	if (error_code & X86_PF_RMP) {
> +		if (handle_user_rmp_page_fault(regs, error_code, address))
> +			return;
> +
> +		/* Ask to split the page */
> +		flags |= FAULT_FLAG_PAGE_SPLIT;
> +	}

This also needs some chatter about why any failure to handle the fault
automatically means splitting a page.
