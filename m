Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1095612E
	for <linux-coco@lists.linux.dev>; Mon,  3 Apr 2023 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680531823; x=1712067823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=d+7GW0xqFSdr1OFAq6MEZ1mOV9kfrb5q8KOSBwbJMEc=;
  b=TSPxpXP2vbLHII1WR9y/YEtDLnAsqTV4nfgX3JIJX6VqjNQ7HYEuZ4Vk
   YGA/PkCGANFadD2qIac21ty7mWGWaadUSjbqaAopZBW5SeCsrZRIt5qU6
   gq2Tme43aw3utUYEta3iFVBxaERZRdKKF/rGQgMGb20cdQpVBEgYLWO71
   gqF1t6CBKrhsEMUgQyoag+Iwcaqs+UXfA/0c9WJm62kIj79yARDt/Hn2t
   1i5/751DS5Y697kqIMa6Kpl+GCxM4usu2h7UkZsJ3dVWR5fZtxX9ZUDt4
   13ON6jjZXunT2P3BXRHeN2N8NHvJMiODNlMt47gQ+c20+6AVBwxCB2ViJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321572867"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="321572867"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 07:23:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="685988645"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="685988645"
Received: from ssidhu-mobl.amr.corp.intel.com (HELO [10.212.178.109]) ([10.212.178.109])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 07:23:27 -0700
Message-ID: <700a9c1b-5967-4e0c-0a15-8e2ab968dac6@intel.com>
Date: Mon, 3 Apr 2023 07:23:27 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 0/7] x86/entry: Atomic statck switching for IST
Content-Language: en-US
To: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
 "H. Peter Anvin" <hpa@linux.intel.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andy Lutomirski
 <luto@kernel.org>, Asit Mallick <asit.k.mallick@intel.com>,
 Cfir Cohen <cfir@google.com>, Dan Williams <dan.j.williams@intel.com>,
 David Kaplan <David.Kaplan@amd.com>, David Rientjes <rientjes@google.com>,
 Dirk Hohndel <dirkhh@vmware.com>, Erdem Aktas <erdemaktas@google.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Jiri Slaby <jslaby@suse.cz>,
 Joerg Roedel <joro@8bytes.org>, Juergen Gross <jgross@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Stunes <mstunes@vmware.com>, Peter Zijlstra <peterz@infradead.org>,
 Raj Ashok <ashok.raj@intel.com>, Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Tony Luck <tony.luck@intel.com>,
 kvm@vger.kernel.org, linux-coco@lists.linux.dev, x86@kernel.org
References: <20230403140605.540512-1-jiangshanlai@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230403140605.540512-1-jiangshanlai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/23 07:05, Lai Jiangshan wrote:
> 2.3 #VE
> -------
> 
> The approach for fixing the kernel mode #VE recursion issue is to just
> NOT use IST for #VE although #VE is also considered to be one of the
> super exceptions and had raised some worries:
> https://lore.kernel.org/lkml/YCEQiDNSHTGBXBcj@hirez.programming.kicks-ass.net/
> https://lore.kernel.org/lkml/CALCETrU9XypKbj-TrXLB3CPW6=MZ__5ifLz0ckbB=c=Myegn9Q@mail.gmail.com/
> https://lore.kernel.org/lkml/1843debc-05e8-4d10-73e4-7ddce3b3eae2@intel.com/
> 
> To remit the worries,  SEPT_VE_DISABLE is forced used currently and
> also disables its abilities (accept-on-demand or memory balloon which
> is critical to lightweight VMs like Kata Containers):
> https://lore.kernel.org/lkml/YCb0%2FDg28uI7TRD%2F@google.com/

You don't need #VE for accept-on-demand.  Pages go through _very_
well-defined software choke points before they get used *and* before
they get ballooned.  Thus:

> https://lore.kernel.org/lkml/20230330114956.20342-3-kirill.shutemov@linux.intel.com/

BTW, _who_ considers #VE to be a "super exception"?  Can you explain how
it is any more "super" than #PF?  #PF can recurse.  You can take #PF in
the entry paths.

I kinda don't think you should be using TDX and #VE as part of the
justification for this series.
