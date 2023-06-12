Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161DB21CD7
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 16:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686587439; x=1718123439;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QhNATEJQnWJ6d9I9Xkx5FpQ9VU6vwCfeDSbUV8NvC4c=;
  b=B/9w/7K5VkML5iYlsDr84NZRlA/D4/N2ymXEUGd4e4rK/QhLlT9nVPdg
   Nk/kyHetMKJTGgIudjYpu4scGepnOq5EnFUbTATQbF0RDXJvbUPtiEGZz
   rkeNJZKJFivFsjWXIcDmvKBKlWNgfSzQAFPGXh2axTIPgrAta7Xri2qiS
   i5GqT9h68lI6m6R7QsE83r0o6ktVFguYpKndeLc01BBCqogw2oAbzdlde
   Y9NZaUD76r1QdEAYXyeQyFoz/vzRnRC6N25hRzHVJ1bOp09fRX+VZVGkC
   XY0L4QJu1nCznahDJ3UzlqoAo3iCSEsWkCO3EWAwAC+frx1b4C+4ZDMeL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337729019"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="337729019"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 09:30:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041415457"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="1041415457"
Received: from spmantha-mobl1.amr.corp.intel.com (HELO [10.209.43.2]) ([10.209.43.2])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 09:30:36 -0700
Message-ID: <93654914-c3d9-8927-8ab2-ee4597426924@intel.com>
Date: Mon, 12 Jun 2023 09:30:35 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 12/51] x86/fault: Report RMP page faults for kernel
 addresses
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
 zhi.a.wang@intel.com
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-13-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230612042559.375660-13-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/23 21:25, Michael Roth wrote:
>  	dump_pagetable(address);
> +
> +	if (error_code & X86_PF_RMP) {
> +		unsigned int level;
> +		pgd_t *pgd;
> +		pte_t *pte;
> +
> +		pgd = __va(read_cr3_pa());
> +		pgd += pgd_index(address);
> +		pte = lookup_address_in_pgd(pgd, address, &level);
> +
> +		sev_dump_rmpentry(pte_pfn(*pte));
> +	}
>  }

It would be nice to trim this hunk down.  Can you make it:

	if (error_code & X86_PF_RMP)
		sev_dump_rmpentry(address);

and hide the rest of the logic in the helper?

Oh, and lookup_address_in_pgd() can return NULL.  It's not great to page
fault in the page fault handler.  Could you fix that up too, please?
