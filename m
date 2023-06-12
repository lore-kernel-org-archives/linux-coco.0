Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA921C75F
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686584046; x=1718120046;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aLoW+RYLTRsrvR/PqFvoPQqxIv0H+SWrGX2+1z5WjgE=;
  b=NTTDv1t92cXWMb2TiPJPz0H+53E+HP53JI2x0EHBWsuGL8Xmo7l1wmgJ
   LBWkg1VQUcMQWSaPORFEq2pzm8vyuNrWc+Nk/AoeFEWWia0sCRlLkA9gS
   h8kd+mNFRyHAGqb9nIULbZT28vwGcaUo/IB1NpWUkcmf9weLE9JbPlEEK
   BBU57gq4ywjHKjqjHrOO810TpxSqcugcNXPq72M8EtUfXWSV44N4SPFWQ
   6JcdrpenBYf5llq5ONpPU+ZBKgvRvkNkiQkVzzbdf+xRPUZmGgjgvFyv+
   RxEaSG829HkL4nAbFGxy6F1+EsKiqjz157X3Hl41HC7bExsU/DLwaNAwF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358073195"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="358073195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="801061441"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="801061441"
Received: from spmantha-mobl1.amr.corp.intel.com (HELO [10.209.43.2]) ([10.209.43.2])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:34:02 -0700
Message-ID: <12f95b38-427c-6810-373a-ba2062c43882@intel.com>
Date: Mon, 12 Jun 2023 08:34:02 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 07/51] x86/sev: Add the host SEV-SNP initialization
 support
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
 zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-8-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230612042559.375660-8-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/23 21:25, Michael Roth wrote:
> +	/*
> +	 * Calculate the amount the memory that must be reserved by the BIOS to
> +	 * address the whole RAM, including the bookkeeping area. The RMP itself
> +	 * must also be covered.
> +	 */
> +	max_rmp_pfn = max_pfn;
> +	if (PHYS_PFN(rmp_end) > max_pfn)
> +		max_rmp_pfn = PHYS_PFN(rmp_end);

Could you say a little here about how this deals with memory hotplug?

