Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC4223D6
	for <linux-coco@lists.linux.dev>; Thu, 19 May 2022 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652961336; x=1684497336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t8Pe4Q+TJHqdH7A97sboo3Z2TolIf8EzWhjhwNv7dsg=;
  b=Yg+ump0AfAOiU1WdaPbK4xlwrWBcqBXF36XJ1vKs0iZhSRWt2BX/e9qS
   wZcGHtw2uazxAqA16yyzx9Suupd9z81HevzSKv05/gG6cUGmu0iYd6whr
   qmVA0ldhcOJWVTuR8LcvKu6h786uNlhVFGoMfKE3629BW9f8epGK5LuQZ
   UFWA9B8nEEB39ykKgHUyXZFb6JVmkOjaho7f3GxZDYHyeDTjOvXNLQoX/
   7Am9hu1pVIpeBYwBbhuaSAWw2TnMu4AgRb1yR44QqJyDPy6VfkYDwyUjW
   KKk9NyNBCoG8rSvL5fYcL3y6O2igwYLHtmk9OIMsoksFokphzmzeiSLl1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="270988935"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="270988935"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 04:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="556863492"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2022 04:55:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E88F0109; Thu, 19 May 2022 14:55:27 +0300 (EEST)
Date: Thu, 19 May 2022 14:55:27 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, marcelo.cerri@canonical.com,
	tim.gardner@canonical.com, khalid.elmously@canonical.com,
	philip.cox@canonical.com, x86@kernel.org, linux-mm@kvack.org,
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCHv6 02/15] mm: Add support for unaccepted memory
Message-ID: <20220519115527.jqzrvsqk4o225m6d@black.fi.intel.com>
References: <20220517153444.11195-1-kirill.shutemov@linux.intel.com>
 <20220517153444.11195-3-kirill.shutemov@linux.intel.com>
 <972b5335-98df-f7b2-4b4f-53695e684d8b@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <972b5335-98df-f7b2-4b4f-53695e684d8b@amd.com>

On Thu, May 19, 2022 at 12:43:15PM +0200, Gupta, Pankaj wrote:
> If both Intel TDX and AMD SEV-SNP requires the memory to be accepted before
> it can be used by the guest. In what other use cases (apart from memory
> hotplug), the lazy memory acceptance will be useful?

It is nothing to do with hotplug.

Any memory has to be accepted before it can be used inside the TDX or
SEV-SNP guest. It can happen upfront, before kernel gets control (like by
firmware) or by kernel. The idea is to accept small portion of the memory
upfront and leave the rest to the kernel. The reason why delaying
acceptance make sense is boot time. We want the guest to start doing
useful stuff as fast as possible.

-- 
 Kirill A. Shutemov
