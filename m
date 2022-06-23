Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D931FB2
	for <linux-coco@lists.linux.dev>; Thu, 23 Jun 2022 17:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656005138; x=1687541138;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vHwbYaqCBCoqzOQKDfPiq0BoCvHrZ6olun8Iahpo+5k=;
  b=H4p8tADmcQLxaL2hx1MvNZn/di9EXcqbQgsX9uVLWuMmq5CQxsGzdxVF
   LGwEXWASnUzyrP9SueUzc3pcsShw7yF5ZzsWvXxRL1I0WAOTRKXQ/JCfk
   Yy0lpEbpvSlAzLJzo5bAvxfW1oLtl3dv2BH0xtq41UmUPDJ/Gb3uR+6OC
   e1EPsnI/ryQULhOwv8Zhd4N5nBkJs51QrE5WxS+jhvR1lLXmXiFcIe69t
   pP6qwLfzF1G+GKJuF9o1IdbTGsZMY354aTCXnhJeO5b9TjLIj5uSgUMSo
   f8Nqwhdho3ciQjOu2kaX1JMQb0PhlA26uZfgSBbh8Pt5MgQvb0Q1MBozu
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="263820140"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="263820140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:25:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="563531953"
Received: from ckeane-mobl1.amr.corp.intel.com (HELO [10.209.81.98]) ([10.209.81.98])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:25:37 -0700
Message-ID: <e4719dac-a497-f6e8-8b28-5a910c79a15f@intel.com>
Date: Thu, 23 Jun 2022 10:25:11 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 12/14] x86/tdx: Make _tdx_hypercall() and
 __tdx_module_call() available in boot stub
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
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 marcelo.cerri@canonical.com, tim.gardner@canonical.com,
 khalid.elmously@canonical.com, philip.cox@canonical.com, x86@kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <20220614120231.48165-13-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220614120231.48165-13-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/22 05:02, Kirill A. Shutemov wrote:
> Memory acceptance requires a hypercall and one or multiple module calls.
> 
> Make helpers for the calls available in boot stub. It has to accept
> memory where kernel image and initrd are placed.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c           | 26 ------------------
>  arch/x86/include/asm/shared/tdx.h | 45 +++++++++++++++++++++++++++++++
>  arch/x86/include/asm/tdx.h        | 19 -------------
>  3 files changed, 45 insertions(+), 45 deletions(-)

Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
