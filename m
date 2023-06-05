Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4724135
	for <linux-coco@lists.linux.dev>; Mon,  5 Jun 2023 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685992705; x=1717528705;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Kt8UwcbAWIHbjuRkCIkoTQ1Kj/ybAb+bYpOZY2j+aQA=;
  b=A8AwdQOUOSItPEXBfgIsgskx5w2DT/VIeJgmBYNgNLRCv02VPOk1yJ/d
   BMdzNPVwOro84agM+TlaNZmr9CxxfkcKR5MgW0B1DEKGhNEDOxwg3XaSd
   QHISbPDm044RUw43jr21tIkPmC2mL4VaU1CW7PuNXTpukkTsPN5EYYo7b
   hXgusPYvXLqzXZmMNp6QOIu/IsSMw++FCvQ36EIs+ZLK6ywcPIQet7db0
   1c9TaueXNcLZuFq0eGPdBe2F2Nyjep7J+I1InoyMs51yRKEdlRHbALHvj
   vknvH6xcCHjwCIf1E9w9b0fTAA8xBtOXY6y5bABksQkgfcFUNDiNnCj5s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422284833"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="422284833"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 12:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="711919843"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="711919843"
Received: from pmudgal-mobl1.amr.corp.intel.com (HELO [10.209.41.254]) ([10.209.41.254])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 12:18:22 -0700
Message-ID: <5bce4a75-d4bb-74c2-1feb-e988841d5465@intel.com>
Date: Mon, 5 Jun 2023 12:18:21 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCHv13 9/9] x86/tdx: Add unaccepted memory support
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, marcelo.cerri@canonical.com,
 tim.gardner@canonical.com, khalid.elmously@canonical.com,
 philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230601182543.19036-1-kirill.shutemov@linux.intel.com>
 <20230601182543.19036-10-kirill.shutemov@linux.intel.com>
 <4d8d6fc4-99b5-29ba-7f81-12e7d57907ea@amd.com>
 <1d24355c-3922-d5c7-4c05-f5ef0adaf5d2@amd.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <1d24355c-3922-d5c7-4c05-f5ef0adaf5d2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/2/23 07:26, Tom Lendacky wrote:
>> So this is a change in this version. If tdx_accept_memory() fails,
>> you'll report unknown platform. Wouldn't it be better to have an error
>> message that indicates a failure in the accept path?
>>
> 
> Maybe you can keep it similar to the v12 version with just a new error
> message, something like:
> 
>     if (early_is_tdx_guest()) {
>         if (!tdx_accept_memory(start, end))
>             error("TDX error accepting memory\n");
>     } else {
>         error("Cannot accept memory: unknown platform\n");
>     }

In the end, these errors aren't plumbed out to the page allocator.  They
*need* to succeed or we are dead anyway.  Should we just send a fatal
error up to the TDX module when we fail to accept memory?  It's
_slightly_ less opaque than plowing into an unaccepted page.
