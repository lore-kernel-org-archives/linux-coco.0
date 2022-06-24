Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5C7C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656090601; x=1687626601;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bgbQFlCVdpCMNcHSrhnw0vtteZ74+vzwjmr94U9FKJs=;
  b=jQveDnjZZGcqNSEGA8EV3I+jQmertwQ/wUCRfohxa1/V1a4ZRr5UIkTQ
   5WfaAy9jU9f1kQn/pjd3FYsN7HURM8BA0/hxdnp/C6DGcP6xCfS5ItvzD
   89DRsYCUOkFbzn7K6kURrSpCwYRTREpiWg2mOOR39hFVVpCTpuPLmEuGf
   c56bUruJYo15OkRfxroyFLxqwnaWzccn4UmD0+UZpAfwbDWeXzTH2T9A2
   vk9/OzVhAxmab8benNWv53eQPbzfa6Dbtv3nNHkjpT4kwaw4eCEQIXQpE
   5sQdNLWdMuoGnCO6QKQiYlhpmiz/7oTAdO9991YkLLJS+lA8cC0o2jF5s
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10388"; a="342733827"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="342733827"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 10:10:00 -0700
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="731398263"
Received: from mdedeogl-mobl.amr.corp.intel.com (HELO [10.209.126.186]) ([10.209.126.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2022 10:09:59 -0700
Message-ID: <e09dae40-d269-cfed-d048-3e62275c1bb7@intel.com>
Date: Fri, 24 Jun 2022 10:09:24 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted
 memory
Content-Language: en-US
To: Marc Orr <marcorr@google.com>
Cc: Peter Gonda <pgonda@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Marcelo <marcelo.cerri@canonical.com>, tim.gardner@canonical.com,
 Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com,
 the arch/x86 maintainers <x86@kernel.org>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com>
 <5af19000-4482-7eb9-f158-0a461891f087@intel.com>
 <CAA03e5F480=psSECDAkXQEvNKk3une-4dJV57Hde4z4MMzh=1A@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAA03e5F480=psSECDAkXQEvNKk3une-4dJV57Hde4z4MMzh=1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/22 10:06, Marc Orr wrote:
> I think Peter's point is a little more nuanced than that. Once lazy
> accept goes into the guest firmware -- without the feature negotiation
> that Peter is suggesting -- cloud providers now have a bookkeeping
> problem. Which images have kernels that can boot from a guest firmware
> that doesn't pre-validate all the guest memory?

Hold on a sec though...

Is this a matter of

	can boot from a guest firmware that doesn't pre-validate all the
	guest memory?

or

	can boot from a guest firmware that doesn't pre-validate all the
	guest memory ... with access to all of that guest's RAM?

In other words, are we talking about "fails to boot" or "can't see all
the RAM"?
