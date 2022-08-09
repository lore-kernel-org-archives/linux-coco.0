Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C93C35
	for <linux-coco@lists.linux.dev>; Tue,  9 Aug 2022 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660043504; x=1691579504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g4riI1Cedm0YyxvcNI2oLRUNfvQrlF8b9RCytIm1Osc=;
  b=jK2m3KqBGcrL3AL/kAI60MejK+ViNZPtLxIRmqDHHmxT9KHX8Veq2s59
   XGyewYZpeEz6rIde2/jVR2AYvJaxvISlXKTD7Pu3JHXpCoMWS5DGnpN0N
   Egung4/xClhOraGkiM33zX0hAmaheiLbc0YNnkudEkURjZOaDYDy18EQF
   HQctYyM8jWE2uK3AQ0AMd0dTXP944rzBmpchrE5Wu1FxntdLj87i+ZmQE
   0TXiNr3BJxaaTxz2dhLgOMW+1whV6ST/dfYawlFEf2f4MfykCsrDB/0KB
   1pkRP16LTZHbdCfqIvcJh0hL40UvixeHUuK++NroiOf1kCUwJtxIiNxqM
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="288374141"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="288374141"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:11:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="694105197"
Received: from labukara-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.214.212])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:11:37 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id B515D103886; Tue,  9 Aug 2022 14:14:36 +0300 (+03)
Date: Tue, 9 Aug 2022 14:14:36 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Marc Orr <marcorr@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Peter Gonda <pgonda@google.com>, Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Marcelo Cerri <marcelo.cerri@canonical.com>,
	tim.gardner@canonical.com,
	Khalid ElMously <khalid.elmously@canonical.com>,
	philip.cox@canonical.com, the arch/x86 maintainers <x86@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-coco@lists.linux.dev, linux-efi <linux-efi@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Yao, Jiewen" <jiewen.yao@intel.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted
 memory
Message-ID: <20220809111436.kudwg2nprnnsfvuh@box.shutemov.name>
References: <CAAH4kHaB2tL+sAn0NAciu5DQeX5hpNkDees=n=f83S=Ph9Y6tw@mail.gmail.com>
 <YtcCWfCQuEsVhH6W@zn.tnic>
 <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic>
 <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic>
 <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
 <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com>
 <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>

On Sat, Jul 23, 2022 at 01:14:07PM +0200, Ard Biesheuvel wrote:
> On Thu, 21 Jul 2022 at 19:13, Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 7/19/22 17:26, Marc Orr wrote:
> > > - Dave's suggestion to "2. Boot some intermediate thing like a
> > > bootloader that does acceptance ..." is pretty clever! So if upstream
> > > thinks this FW-kernel negotiation is not a good direction, maybe we
> > > (Google) can pursue this idea to avoid introducing yet another tag on
> > > our images.
> >
> > I'm obviously speaking only for myself here and not for "upstream" as a
> > whole, but I clearly don't like the FW/kernel negotiation thing.  It's a
> > permanent pain in our necks to solve a very temporary problem.
> 
> EFI is basically our existing embodiment of this fw/kernel negotiation
> thing, and iff we need it, I have no objection to using it for this
> purpose, i.e., to allow the firmware to infer whether or not it should
> accept all available memory on behalf of the OS before exiting boot
> services. But if we don't need this, even better.

FW/kernel negotiation does not work if there's a boot loader in the middle
that does ExitBootServices(). By the time kernel can announce if it
supports unaccepted memory there's nobody to announce to.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
