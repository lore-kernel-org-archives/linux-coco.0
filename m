Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8DF4403
	for <linux-coco@lists.linux.dev>; Tue,  9 Aug 2022 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660045896; x=1691581896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eDgcat5jz2gPDhDhIYJ5SQ3oYmJhT05bUBFYCgTExWE=;
  b=laTFrPr57ISmk0E4sHdlCBilhRhhuLIeLjaEzV+cjcQXFeLmwqf3LCUw
   uFedkMLWkRRlHlTkzP59iRDWh9TJFlCqrdiNNmPdlRvGBNw8mtFg2/XH2
   NiIye3iSlQ1dYKihgHWBVkE1WogZTLRbcbKxzCjH1270fnXfd4ce3HfLg
   Cz5goIQKxSL2z1hRcJ1kDv6LTA1DnGH+DzLSSR18edQU3VPS/jHZ0lorb
   33LlwP6IRCzRa4DcNC6hsV7QfP7x6vVZdJqWEz36ULXAOc0R8yDJXWe7N
   munDn82Ebx+Z/gOLrBcigoWxl/pYLJ/v25m4hh8reORP0qAc8W1PHHFZw
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="277750685"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="277750685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:51:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="747012231"
Received: from labukara-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.214.212])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 04:51:29 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 7CAAF103886; Tue,  9 Aug 2022 14:54:27 +0300 (+03)
Date: Tue, 9 Aug 2022 14:54:27 +0300
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
Message-ID: <20220809115427.bmkbap434oupinq2@box.shutemov.name>
References: <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic>
 <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic>
 <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
 <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
 <ffb4ae72-7fd4-d2a0-df10-3969cf8ca07f@intel.com>
 <CAMj1kXHEc=vEt=CtfdiPEsUe2i8QogAi+jvtY6h1awo7GZ-nRg@mail.gmail.com>
 <20220809111436.kudwg2nprnnsfvuh@box.shutemov.name>
 <CAMj1kXE67H_cgYbufUxQ7HXg929dFopWH+cKX5ijAdePP8Zt-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXE67H_cgYbufUxQ7HXg929dFopWH+cKX5ijAdePP8Zt-g@mail.gmail.com>

On Tue, Aug 09, 2022 at 01:36:00PM +0200, Ard Biesheuvel wrote:
> On Tue, 9 Aug 2022 at 13:11, Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> >
> > On Sat, Jul 23, 2022 at 01:14:07PM +0200, Ard Biesheuvel wrote:
> > > On Thu, 21 Jul 2022 at 19:13, Dave Hansen <dave.hansen@intel.com> wrote:
> > > >
> > > > On 7/19/22 17:26, Marc Orr wrote:
> > > > > - Dave's suggestion to "2. Boot some intermediate thing like a
> > > > > bootloader that does acceptance ..." is pretty clever! So if upstream
> > > > > thinks this FW-kernel negotiation is not a good direction, maybe we
> > > > > (Google) can pursue this idea to avoid introducing yet another tag on
> > > > > our images.
> > > >
> > > > I'm obviously speaking only for myself here and not for "upstream" as a
> > > > whole, but I clearly don't like the FW/kernel negotiation thing.  It's a
> > > > permanent pain in our necks to solve a very temporary problem.
> > >
> > > EFI is basically our existing embodiment of this fw/kernel negotiation
> > > thing, and iff we need it, I have no objection to using it for this
> > > purpose, i.e., to allow the firmware to infer whether or not it should
> > > accept all available memory on behalf of the OS before exiting boot
> > > services. But if we don't need this, even better.
> >
> > FW/kernel negotiation does not work if there's a boot loader in the middle
> > that does ExitBootServices(). By the time kernel can announce if it
> > supports unaccepted memory there's nobody to announce to.
> >
> 
> Why would you want to support such bootloaders for TDX anyway? TDX
> heavily relies on measured boot abstractions and other things that are
> heavily tied to firmware.

I don't understand it either. And, yet, there's demand for it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
