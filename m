Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75272
	for <linux-coco@lists.linux.dev>; Thu, 12 Aug 2021 19:33:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="195703749"
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; 
   d="scan'208";a="195703749"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 12:33:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,316,1620716400"; 
   d="scan'208";a="517595794"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.255.231.194]) ([10.255.231.194])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2021 12:33:25 -0700
Subject: Re: [PATCH 0/5] x86: Impplement support for unaccepted memory
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Joerg Roedel <jroedel@suse.de>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
References: <20210810062626.1012-1-kirill.shutemov@linux.intel.com>
 <YRTafEovVZme+KO9@suse.de>
 <20210812101054.5y6oufwwnisebuyy@box.shutemov.name>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <e72e34b5-a232-6dc9-0cdb-cc8c97783772@linux.intel.com>
Date: Thu, 12 Aug 2021 12:33:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210812101054.5y6oufwwnisebuyy@box.shutemov.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 8/12/2021 3:10 AM, Kirill A. Shutemov wrote:
> On Thu, Aug 12, 2021 at 10:23:24AM +0200, Joerg Roedel wrote:
>> Hi Kirill,
>>
>> On Tue, Aug 10, 2021 at 09:26:21AM +0300, Kirill A. Shutemov wrote:
>>> Accepting happens via a protocol specific for the Virtrual Machine
>>> platform.
>> That sentence bothers me a bit. Can you explain what it VMM specific in
>> the acceptance protocol?
> For TDX we have a signle MapGPA hypercall to VMM plus TDAcceptPage for
> every accepted page to TDX Module. SEV-SNP has to something similar.


I think Joerg's question was if TDX has a single ABI for all 
hypervisors. The GHCI specification supports both hypervisor specific 
and hypervisor agnostic calls. But these basic operations like MapGPA 
are all hypervisor agnostic. The only differences would be in the 
existing hypervisor specific PV code.


-Andi

