Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F214690
	for <linux-coco@lists.linux.dev>; Thu, 21 Jul 2022 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658423612; x=1689959612;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2VsP1VnPxrhHVMrqEWBHwDQJS/BpBEhQECyvetxj8xs=;
  b=lE5S84nYCoDjTAr2k44MWJK6XP00uvn7lRH61Oo2WxbxJaqGBOwDBnjw
   KKPhqm0ebW3xyV7oOVvv9yY+gYbA2M10SZPAXrgswaWb2CDB/WszcTMKZ
   pki9bY8D1r8LcPkwmktb9KSeypu3qU7t4D9RWAKjDJ2J0+X5awWF914GM
   oqEAM4cFkI5o2+AxNF+eQR2nNHei9MWNKYojW21MAi3+y4M331dP8wunB
   quA5A2ncYTACxtrLvHWG3NlcUCgfOLmXjhiejfBJ3VbqPKPwRVYVyZU9o
   aGWVN5XqLLOwfNnGvLq+Kp2sjgMZsid8xvVJzLFnTVNSHPtkrGZw3VshX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="273963708"
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; 
   d="scan'208";a="273963708"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 10:12:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,183,1654585200"; 
   d="scan'208";a="573825972"
Received: from vasantgx-mobl.amr.corp.intel.com (HELO [10.212.244.191]) ([10.212.244.191])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 10:12:15 -0700
Message-ID: <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com>
Date: Thu, 21 Jul 2022 10:12:14 -0700
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
Cc: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Peter Gonda <pgonda@google.com>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>,
 Andi Kleen <ak@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner
 <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Varad Gautam <varad.gautam@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
 Marcelo Cerri <marcelo.cerri@canonical.com>, tim.gardner@canonical.com,
 Khalid ElMously <khalid.elmously@canonical.com>, philip.cox@canonical.com,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-coco@lists.linux.dev, linux-efi <linux-efi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "Yao, Jiewen" <jiewen.yao@intel.com>
References: <20220627223808.ihgy3epdx6ofll43@black.fi.intel.com>
 <CAMj1kXEdS9SzFZZ4WGH6sR0WDCOgYDZ3Geg6X2sqSnQ-CXXpZA@mail.gmail.com>
 <20220718172159.4vwjzrfthelovcty@black.fi.intel.com>
 <CAAH4kHYR+VkSJ5J8eWmeaEvstuRz_EuqVQqPfwmp5dhNGRyJwQ@mail.gmail.com>
 <CAAH4kHaHJo4NUb72tHeica4a34hq5u_QP6d6Vuzngf6EqTJ8Aw@mail.gmail.com>
 <CAAH4kHaB2tL+sAn0NAciu5DQeX5hpNkDees=n=f83S=Ph9Y6tw@mail.gmail.com>
 <YtcCWfCQuEsVhH6W@zn.tnic>
 <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic> <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic> <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/19/22 17:26, Marc Orr wrote:
> - Dave's suggestion to "2. Boot some intermediate thing like a
> bootloader that does acceptance ..." is pretty clever! So if upstream
> thinks this FW-kernel negotiation is not a good direction, maybe we
> (Google) can pursue this idea to avoid introducing yet another tag on
> our images.

I'm obviously speaking only for myself here and not for "upstream" as a
whole, but I clearly don't like the FW/kernel negotiation thing.  It's a
permanent pain in our necks to solve a very temporary problem.
