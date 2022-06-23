Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EEB1FB2
	for <linux-coco@lists.linux.dev>; Thu, 23 Jun 2022 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656005503; x=1687541503;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zIaYVEomzwgXfaMMISVY2yLjmfGKJg5F3MdqvIB4X34=;
  b=jiu4WhghWVoO+CJw3j+r04gCOrFpYzjVqv/m8qb5VxLW60/Zd04drlql
   /35KVBnvkrYEZpzIJC9J8eMiU5uFNCyTvu4//FgEcgDJsMnwnfkbJgu4H
   leTBmjqG0Ik7RK4dCtcpRYib0CK83VLf0N9FfV3PKUR0JvEk8wgxgksLR
   Vu0vdBNFtzrkj7VbDJ6pPLgmSzc9oE678AjTlrvD9DuN4EAlhp//C7MOt
   bZlpmNGrBJZfAZ2QmTJT3ja1zdcIKDrXdiZsjRqm/ZoijwNAkPax1LEY8
   9QHDTps85JrYMGdbTZrEt+GikWeEA1FaYiV3tHXUWzXfmCUkkyVqaIoKB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="280834161"
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="280834161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:31:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,216,1650956400"; 
   d="scan'208";a="563533778"
Received: from ckeane-mobl1.amr.corp.intel.com (HELO [10.209.81.98]) ([10.209.81.98])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 10:31:31 -0700
Message-ID: <9b350e82-9fcf-b871-ed6c-92848dfa484e@intel.com>
Date: Thu, 23 Jun 2022 10:31:05 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 13/14] x86/tdx: Refactor try_accept_one()
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
 <20220614120231.48165-14-kirill.shutemov@linux.intel.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220614120231.48165-14-kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/22 05:02, Kirill A. Shutemov wrote:
> Rework try_accept_one() to return accepted size instead of modifying
> 'start' inside the helper. It makes 'start' in-only argumaent and

							^ argument

> streamlines code on the caller side.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Suggested-by: Borislav Petkov <bp@alien8.de>

I'm not sure how much it actually streamlines things.  The line count
looks pretty similar.  But, I do generally dislike implicit return
values, so with that typo fixed:

Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
