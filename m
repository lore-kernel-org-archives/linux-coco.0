Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DC82C80
	for <linux-coco@lists.linux.dev>; Mon, 31 Jan 2022 22:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643668726; x=1675204726;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M7mZJap8bWp6kqusTez3NXr8dHFfMt8bmhpv8eupywQ=;
  b=AAWhacRXe1FJSRQAkBcgW3RVMYyEJX+MmpSOY4+e3h9WpRRwg5Sx6fmy
   rIqZ6q1Qo7TkRrz2/MLBuwrWjtH0O2At3RXF+y2JRruYCOir6COq7H1Ie
   510BAw8/vWUqLx+UxRCNiIMgCCRfOP+YMpPXBX4GnE8ALLjnv0TKWB9lj
   ompiHdG1NsMw+zRKc0L6lpaA/AuVpJpgq6NbSp3bevvr4i3YL7PtZNBaO
   OitxDqBHLmXiNn6Hot+kDXrtydPpaIyfkSiYCsPtM6KzJDtWjEMRzqav5
   CSF3e1LpsvCte6iMC52erEFB1nW41/KRyTlzFUFzGXwaBLwGkHPYi01S6
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="310873776"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="310873776"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 14:38:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="630180014"
Received: from kcoopwoo-mobl1.amr.corp.intel.com (HELO [10.252.132.7]) ([10.252.132.7])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 14:38:45 -0800
Message-ID: <101a4497-ae17-ab69-640d-667c79da639b@intel.com>
Date: Mon, 31 Jan 2022 14:38:42 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCHv3 2/7] efi/x86: Get full memory map in allocate_e820()
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@redhat.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220128205906.27503-1-kirill.shutemov@linux.intel.com>
 <20220128205906.27503-3-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220128205906.27503-3-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/22 12:59, Kirill A. Shutemov wrote:
> Modify allocate_e820() to get a full memory map.

Dumb question time: why doesn't the current code get a full memory map?
 This looks simpler.  What's the downside?  Memory consumption?
