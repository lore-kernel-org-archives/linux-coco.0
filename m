Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533A10FB
	for <linux-coco@lists.linux.dev>; Mon, 12 Jun 2023 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686588050; x=1718124050;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1vf2gpsw1WTcumfYJQxjWdVtrfbml7pTawG9Tbh2CEs=;
  b=KiABhiXZsFnr7AVuuOw9xtHqVINuNY+Kh458pQ9AFRbL/UbT0vDK+cxx
   n8AkklJUqzL6Uy1GBhm33LHFKSq4RdvCTH8iO5pK4pD4GFb38Qt7VjPGj
   Hwz31ltFKwhVXv/fhkqLrOuOQo8RNBHWENEStGMN4lqJQvw+7o/VT7PWw
   INmDlcAOp7etTf4xERWDG2KCH4tJhD3V1GTI5MVuaS9cmJLO9tVogQBap
   xGApUCI1aRVx48OW9OaXmMtmEWGunBk5p0fBLIArm3y4YfySbAi74cxA/
   gY3cEFGW/gaIRZB/d9xzd7QFwkbobqFLK4P4HuLvIvFQmDI+YFx8CGbd4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347750432"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347750432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 09:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="661645619"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="661645619"
Received: from spmantha-mobl1.amr.corp.intel.com (HELO [10.209.43.2]) ([10.209.43.2])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 09:40:48 -0700
Message-ID: <bad7dfd5-c88a-6452-0dc4-599fd1eeb447@intel.com>
Date: Mon, 12 Jun 2023 09:40:48 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC v9 13/51] x86/fault: Handle RMP page faults for user
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
 zhi.a.wang@intel.com, Brijesh Singh <brijesh.singh@amd.com>,
 Jarkko Sakkinen <jarkko.sakkinen@profian.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-14-michael.roth@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230612042559.375660-14-michael.roth@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/23 21:25, Michael Roth wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> When SEV-SNP is enabled globally, a write from the host is subject to
> checks performed by the hardware against the RMP table (APM2 15.36.10)
> at the end of a page walk:
> 
>   1. Assigned bit in the RMP table is not set (i.e page is shared).
>   2. Immutable bit in the RMP table is not set.
>   3. If the page table entry that gives the sPA indicates that the
>      target page size is a large page, then all RMP entries for the 4KB
>      constituting pages of the target must have the assigned bit 0.
> 
> Nothing constructive can come of an attempt by userspace to violate case
> 1) (which will result in writing garbage due to page encryption) or case
> 2) (userspace should not ever need or be allowed to write to a page that
> the host has specifically needed to mark immutable).

What does this _mean_?  If nothing constructive can come of it, what
does that mean for the kernel?

> Case 3) is dependent on the hypervisor. In case of KVM, due to how
> shared/private pages are partitioned into separate memory pools via
> restricted/guarded memory, there should never be a case where a page in
> the private pool overlaps with a shared page: either it is a
> hugepage-sized allocation and all the sub-pages are private, or it is a
> single-page allocation, in which case it cannot overlap with anything
> but itself.
> 
> Therefore, for all 3 cases, it is appropriate to simply kill the
> userspace process if it ever generates an RMP #PF. Implement that logic
> here.
...
> +	if (error_code & X86_PF_RMP) {
> +		pr_err("Unexpected RMP page fault for address 0x%lx, terminating process\n",
> +		       address);
> +		do_sigbus(regs, error_code, address, VM_FAULT_SIGBUS);
> +		return;
> +	}
> +

This is special-snowflake code.  You're making the argument that an RMP
fault is a special snowflake and needs special handling.

Why should an RMP violation be any different than, say a write to a
read-only page (that also ends in signal delivery)?

I kinda dislike the entire changelog here.  I really don't know what
point it's making or what it is arguing.
