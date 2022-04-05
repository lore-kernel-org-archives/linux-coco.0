Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9316117C8
	for <linux-coco@lists.linux.dev>; Tue,  5 Apr 2022 18:55:18 +0000 (UTC)
Received: from zn.tnic (p2e55dff8.dip0.t-ipconnect.de [46.85.223.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 37C3B1EC0374;
	Tue,  5 Apr 2022 20:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1649184907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=v2FjWdRnczI9WKt4ClfJ913bandBLADmN4fX24w4Ui4=;
	b=CW65VH61kzlILvC1aaS6x77amEDhT358yeIFIwhXHg0LUuLo1KxyindYNWNBcB1Epm/PUa
	Jqj4LEo84G6aE0DNebEuwx7BIznR/jTVutvGPaZnMXa8z6VxzJHewH2E+sqx/sDun0fsBh
	Oj7RQRh1ieLt6mNg0xVJpuSJWuKqmes=
Date: Tue, 5 Apr 2022 20:55:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Brijesh Singh <brijesh.singh@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	Venu Busireddy <venu.busireddy@oracle.com>
Subject: Re: [PATCH v12 2.1/46] KVM: SVM: Create a separate mapping for the
 SEV-ES save area
Message-ID: <YkyQib4Jda1epH3G@zn.tnic>
References: <20220307213356.2797205-3-brijesh.singh@amd.com>
 <20220405182743.308853-1-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220405182743.308853-1-brijesh.singh@amd.com>

On Tue, Apr 05, 2022 at 01:27:43PM -0500, Brijesh Singh wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> The save area for SEV-ES/SEV-SNP guests, as used by the hardware, is
> different from the save area of a non SEV-ES/SEV-SNP guest.
> 
> This is the first step in defining the multiple save areas to keep them
> separate and ensuring proper operation amongst the different types of
> guests. Create an SEV-ES/SEV-SNP save area and adjust usage to the new
> save area definition where needed.
> 
> Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---
> 
> Hi Paolo,
> 
> Now there is a conflict when applying this patch on 5.18-rc1. Please
> use the updated patch when merging the first four patches from the
> series.

Right, or if you'd prefer I carried them through the tip tree, lemme
know.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
