Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3C15ACE
	for <linux-coco@lists.linux.dev>; Tue,  6 Jun 2023 12:29:57 +0000 (UTC)
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8E2331EC04CC;
	Tue,  6 Jun 2023 14:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1686054589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=aSEF9pu9eNB9dGCe3DY/ck8Uewf1oGAg3uGTYX+RT/A=;
	b=NkSSaqfTgWrrj8pthl93Mugw+kUo4rN1wCyKaCq8onem9KR+Bd0W6NdxITU8MJoBeejEWz
	IZndqnOBdGLfUwyfSyo8dK4xmQM1T/RvzHZHrxrA61LGEPphGeWVJrLdDucj3LXNL0vvI9
	WaVN5lanR4+Rdl5GmHD6qvznR9XcjtA=
Date: Tue, 6 Jun 2023 14:29:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
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
	Dario Faggioli <dfaggioli@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	marcelo.cerri@canonical.com, tim.gardner@canonical.com,
	khalid.elmously@canonical.com, philip.cox@canonical.com,
	aarcange@redhat.com, peterx@redhat.com, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv13 5/9] efi: Add unaccepted memory support
Message-ID: <20230606122945.GBZH8mue040bYCZu2Y@fat_crate.local>
References: <20230601182543.19036-1-kirill.shutemov@linux.intel.com>
 <20230601182543.19036-6-kirill.shutemov@linux.intel.com>
 <20230605154333.GLZH4CpV3eXCCWCGxi@fat_crate.local>
 <20230605173303.k5yt535snxyk4ez3@box.shutemov.name>
 <20230605191225.GCZH4zmbtkWWRG4lzf@fat_crate.local>
 <20230606121924.wcjezcppuiofvnk6@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230606121924.wcjezcppuiofvnk6@box.shutemov.name>

On Tue, Jun 06, 2023 at 03:19:24PM +0300, Kirill A. Shutemov wrote:
> Does it look okay to you?
> 
> /*
>  * accept_memory() -- Consult bitmap and accept the memory if needed.
>  *
>  * Only memory that explicitly marked as unaccepted in the bitmap requires

		... that is ...

>  * an action.

And let's add an additional sentence stating it all clearly:

"All the remaining memory is implicitly accepted and doesn't need acceptance."

>  *
>  * No need to accept:
>  *  - anything if the system has no unaccepted table;
>  *  - memory that is below phys_base;
>  *  - memory that is above the memory that addressable by the bitmap;

And this is an additional clarification.

Good, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
