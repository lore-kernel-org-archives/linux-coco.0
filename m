Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5CE3FC2
	for <linux-coco@lists.linux.dev>; Tue, 31 Aug 2021 20:02:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="216711313"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; 
   d="scan'208";a="216711313"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2021 13:01:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; 
   d="scan'208";a="687857794"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.121.250]) ([10.209.121.250])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2021 13:01:39 -0700
Subject: Re: [RFC] KVM: mm: fd-based approach for supporting KVM guest private
 memory
To: David Hildenbrand <david@redhat.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, x86@kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>
References: <20210824005248.200037-1-seanjc@google.com>
 <307d385a-a263-276f-28eb-4bc8dd287e32@redhat.com>
 <20210827023150.jotwvom7mlsawjh4@linux.intel.com>
 <243bc6a3-b43b-cd18-9cbb-1f42a5de802f@redhat.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <765e9bbe-2df5-3dcc-9329-347770dc091d@linux.intel.com>
Date: Tue, 31 Aug 2021 13:01:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <243bc6a3-b43b-cd18-9cbb-1f42a5de802f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


>> Thanks a lot for this summary. A question about the requirement: do 
>> we or
>> do we not have plan to support assigned device to the protected VM?
>
> Good question, I assume that is stuff for the far far future.

It is in principle possible with the current TDX, but not secure. But 
someone might decide to do it. So it would be good to have basic support 
at least.

-Andi

>
>
