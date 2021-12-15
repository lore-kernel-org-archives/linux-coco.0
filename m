Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE9C168
	for <linux-coco@lists.linux.dev>; Wed, 15 Dec 2021 18:33:51 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-202-008.088.067.pools.vodafone-ip.de [88.67.202.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 317B01EC02B9;
	Wed, 15 Dec 2021 19:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1639593225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=pI1cfs0sye4rkAbVP9bxLeZ1PzV7S4Ntz69iDw6ZWT0=;
	b=nuPlfwo/nPurBQL3rwNReGM0rLIfsiRLAoa5oV0W/SnMy9FEcPKfJ0+Ricsb/6GnvX3xOo
	Pg1dCcrPSPvjYOV5vPrn8O4XoVxHhDwDNhSIizJhjQqkoY0MEiAezSjOK++g2oabzvnLFc
	bzFMjpublalbdEUXDyFvJnCl2jjn0Xc=
Date: Wed, 15 Dec 2021 19:33:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: Michael Roth <michael.roth@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
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
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v8 01/40] x86/compressed/64: detect/setup SEV/SME
 features earlier in boot
Message-ID: <Ybo1C6kpcPJBzMGq@zn.tnic>
References: <20211210154332.11526-1-brijesh.singh@amd.com>
 <20211210154332.11526-2-brijesh.singh@amd.com>
 <YbeaX+FViak2mgHO@dt>
 <YbecS4Py2hAPBrTD@zn.tnic>
 <YbjYZtXlbRdUznUO@dt>
 <YbjsGHSUUwomjbpc@zn.tnic>
 <YbkzaiC31/DzO5Da@dt>
 <b18655e3-3922-2b5d-0c35-1dcfef568e4d@amd.com>
 <20211215174934.tgn3c7c4s3toelbq@amd.com>
 <YboxSPFGF0Cqo5Fh@dt>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YboxSPFGF0Cqo5Fh@dt>

On Wed, Dec 15, 2021 at 12:17:44PM -0600, Venu Busireddy wrote:
> Boris & Tom, which implementation would you prefer?

I'd like to see how that sme_sev_parse_cpuid() would look like. And that
function should be called sev_parse_cpuid(), btw.

Because if that function turns out to be a subset of your suggestion,
functionality-wise, then we should save us the churn and simply do one
generic helper.

Btw 2, that helper should be in arch/x86/kernel/sev-shared.c so that it
gets shared by both kernel stages instead having an inline function in
some random header.

Btw 3, I'm not crazy about the feature testing with the @features param
either. Maybe that function should return the eYx register directly,
like the cpuid_eYx() variants in the kernel do, where Y in { a, b, c, d
}.

The caller can than do its own testing:

	eax = sev_parse_cpuid(RET_EAX, ...)
	if (eax > 0) {
		if (eax & BIT(1))
			...

Something along those lines, for example.

But I'd have to see a concrete diff from Michael to get a better idea
how that CPUID parsing from the CPUID page is going to look like.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
