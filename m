Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8E1FA2
	for <linux-coco@lists.linux.dev>; Thu, 21 Apr 2022 12:29:07 +0000 (UTC)
Received: from zn.tnic (p200300ea971b581b329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971b:581b:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CB2C81EC013E;
	Thu, 21 Apr 2022 14:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1650544141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=rpANVynhcG144hvijIFDyM1O4oiCFkqKYsRr7ZIqYwU=;
	b=OH4G7xGXALG7wCEGOI/kzTVXZWpoXlYUzCe1NPX2OMKEVd/nr+szvIV0KGAbMtARNINPnD
	Wa8xdBQ3ddmnVoJ0qzvL8K0/Xto1drh11cFCZSQ8QUV4xcfP7VTp7o0kLsoVNtwiFFbH9V
	C3Z+oWf9ngW2zLanijYUOe0+sh50M7Y=
Date: Thu, 21 Apr 2022 14:29:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Roth <michael.roth@amd.com>
Cc: Dave Hansen <dave.hansen@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 0/8] mm, x86/cc: Implement support for unaccepted memory
Message-ID: <YmFODfWn8pBiSjFn@zn.tnic>
References: <20220405234343.74045-1-kirill.shutemov@linux.intel.com>
 <95eabe79-a13b-79b1-1196-407920531f20@intel.com>
 <20220409234458.ysisolzd7hktpfjc@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220409234458.ysisolzd7hktpfjc@box.shutemov.name>

On Sun, Apr 10, 2022 at 02:44:58AM +0300, Kirill A. Shutemov wrote:
> On Fri, Apr 08, 2022 at 10:02:13AM -0700, Dave Hansen wrote:
> > On 4/5/22 16:43, Kirill A. Shutemov wrote:
> > > Patches 1-6/7 are generic and don't have any dependencies on TDX. They
> > > should serve AMD SEV needs as well. TDX-specific code isolated in the
> > > last patch.
> > 
> > Oh, that's quite nice.  Are the SEV-SNP folks planning on using this?
> > If they are, acks/reviews would be much appreciated.
> 
> AMD folks tested one of previous revision and reported that it works, but
> I don't remember seeing the code that hook ups AMD implementation.

Yes, they will be using this eventually.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
