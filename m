Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E829AE
	for <linux-coco@lists.linux.dev>; Fri,  8 Apr 2022 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649445117; x=1680981117;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=+rU6SoAJQ46qQf+w0uFH/OvSXa690ikdV/2AaUpsdzc=;
  b=D16xrJxsd6/i7hNoCy4UGr0AdKHzTFY9iNBjOCXsii9t/Uh4pdvMK4U+
   mv0pt16H53YAbDxuC3FtsXWxPX561dVbMAtfHynktngJO7fzb669Vb+pM
   8DEIfU4XGUkF+qfc9DGg1cg2aJYCW8j97z6tlN7Yv+bZ8tSWHdY0sFAjQ
   QFl/hHJ3Z7RTHF1378GsWCQMDyqvnfKSFd4uWniYLMp592DFMBQ1H02yN
   XVrtHCCvHYHgFE+TnCHAGQhfbyB/sTfsOx1m20Z/hsE6NqVa8/HvYuJng
   VqeBTCjnLhEwGlll3K59cuxpFx626YbLIQ1/zxexJORzu0fVxPBQB2E5F
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="260510726"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="260510726"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 12:11:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="525492958"
Received: from tsungtae-mobl.amr.corp.intel.com (HELO [10.134.43.198]) ([10.134.43.198])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 12:11:55 -0700
Message-ID: <93a7cfdf-02e6-6880-c563-76b01c9f41f5@intel.com>
Date: Fri, 8 Apr 2022 12:11:58 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCHv4 1/8] mm: Add support for unaccepted memory
In-Reply-To: <20220405234343.74045-2-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/22 16:43, Kirill A. Shutemov wrote:
> Kernel only needs to accept memory once after boot, so during the boot
> and warm up phase there will be a lot of memory acceptance. After things
> are settled down the only price of the feature if couple of checks for
> PageUnaccepted() in allocate and free paths. The check refers a hot
> variable (that also encodes PageBuddy()), so it is cheap and not visible
> on profiles.

Let's also not sugar-coat this.  Page acceptance is hideously slow.
It's agonizingly slow.  To boot, it's done holding a global spinlock
with interrupts disabled (see patch 6/8).  At the very, very least, each
acceptance operation involves a couple of what are effectively ring
transitions, a 2MB memset(), and a bunch of cache flushing.

The system is going to be downright unusable during this time, right?

Sure, it's *temporary* and only happens once at boot.  But, it's going
to suck.

Am I over-stating this in any way?

The ACCEPT_MEMORY vmstat is good to have around.  Thanks for adding it.
 But, I think we should also write down some guidance like:

	If your TDX system seems as slow as snail after boot, look at
	the "accept_memory" counter in /proc/vmstat.  If it is
	incrementing, then TDX memory acceptance is likely to blame.

Do we need anything more discrete to tell users when acceptance is over?
 For instance, maybe they run something and it goes really slow, they
watch "accept_memory" until it stops.  They rejoice at their good
fortune!  Then, memory allocation starts falling over to a new node and
the agony beings anew.

I can think of dealing with this in two ways:

	cat /sys/.../unaccepted_pages_left

which just walks the bitmap and counts the amount of pages remaining. or
something like:

	echo 1 > /sys/devices/system/node/node0/make_the_pain_stop

Which will, well, make the pain stop on node0.
