Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC0F882B
	for <linux-coco@lists.linux.dev>; Tue, 16 May 2023 23:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684278246; x=1715814246;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cpPm6dizOpzAe28lnc0LmN8v78c+WYJi5K9EK5t9WLY=;
  b=OnDC94JzYT+/ZaS5pc07pOOwa0Gl1nf3+fAmHZ4y2qI6PFbZ6sWYZtCT
   gtF7D8dielhM0O9jAMdSP4Gc4w885VeqzS97xmkqALp1FRcg3Cha7koPS
   p2fY/T3A7xNisYzu4NErxLXUHWf0NNbn3UZ+QLP6aP92J4b0MRiNNKzRM
   A4tr1kLilNiMcPvzgPIq+Hp0AE7a/+ClO/yLO937owWoTgWcvCYpSrIG3
   cRJ8VHdhNgQz79hFLZH3Mb23BhSiOeX5iiHrXmIwv/t1ezYAJCDuluqV1
   jTVWZ0Gpc9mRfaN/kWO1KQrSsgiQSN73NYNKvlG88QlFOTEoLZJjDfYd+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="351640964"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; 
   d="scan'208";a="351640964"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 16:04:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="875825066"
X-IronPort-AV: E=Sophos;i="5.99,280,1677571200"; 
   d="scan'208";a="875825066"
Received: from mtpanu-mobl1.amr.corp.intel.com (HELO [10.212.203.6]) ([10.212.203.6])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 16:04:04 -0700
Message-ID: <24a961b4-5385-0949-045b-c3da137042a2@intel.com>
Date: Tue, 16 May 2023 16:04:04 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCHv11 6/9] efi/unaccepted: Avoid load_unaligned_zeropad()
 stepping into unaccepted memory
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, marcelo.cerri@canonical.com,
 tim.gardner@canonical.com, khalid.elmously@canonical.com,
 philip.cox@canonical.com, aarcange@redhat.com, peterx@redhat.com,
 x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230513220418.19357-1-kirill.shutemov@linux.intel.com>
 <20230513220418.19357-7-kirill.shutemov@linux.intel.com>
 <CAMj1kXG488uW=dpvbfvdN1fMZVJ3kCZQoW3UVQJW1F2VEXyxHg@mail.gmail.com>
 <20230516183352.5fvmqca34cjcv462@box.shutemov.name>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230516183352.5fvmqca34cjcv462@box.shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/23 11:33, Kirill A. Shutemov wrote:
> For context: there's a way configure TDX environment to trigger #VE on
> such accesses and it is default. But Linux requires such #VEs to be
> disabled as it opens attack vector from the host to the guest: host can
> pull any private page from under kernel at any point and trigger such #VE.
> If it happens in just a right time in syscall gap or NMI entry code it can
> be exploitable.

I'm kinda uncomfortable with saying it's exploitable.

It really boils down to not wanting to deal with managing a new IST
exception.  While the NMI IST implementation is about as good as we can
get it, I believe there are still holes in it (even if we consider only
how it interacts with #MC).  The more IST users we add, the more holes
there are.

You add the fact that an actual adversary can induce the exceptions
instead of (rare and mostly random) radiation that causes #MC, and it
makes me want to either curl up in a little ball or pursue a new career.

So, exploitable?  Dunno.  Do I want to touch an #VE/IST implementation?
No way, not with a 10 foot pole.
