Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57272C82
	for <linux-coco@lists.linux.dev>; Thu, 28 Oct 2021 15:07:12 +0000 (UTC)
Received: from zn.tnic (p200300ec2f13a70087f257aa50e887e8.dip0.t-ipconnect.de [IPv6:2003:ec:2f13:a700:87f2:57aa:50e8:87e8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 949121EC066A;
	Thu, 28 Oct 2021 17:07:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1635433622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=J04OyLRjmP/Bb50HHEZHiheIH7udus/52nzjDQ9g+3E=;
	b=VaGwp2OPxwdjgKaxM7E+eksULkuJb7cCcbi4a60aTInd/N+MvwhVeTu4DVX0rswnJY0h8g
	9pIIL/v19aDofBPs1LcMHiGfoFG6Dfzu/M/fJROUeBI7vWamyEn02d9fikieFvfH2VWi37
	KENovLjUyCmLl1N20a7v1V9B1DFCIE0=
Date: Thu, 28 Oct 2021 17:07:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
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
	Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v6 11/42] x86/sev: Check the vmpl level
Message-ID: <YXq8lJHDa+Rdnizt@zn.tnic>
References: <20211008180453.462291-1-brijesh.singh@amd.com>
 <20211008180453.462291-12-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008180453.462291-12-brijesh.singh@amd.com>

On Fri, Oct 08, 2021 at 01:04:22PM -0500, Brijesh Singh wrote:
> +static bool is_vmpl0(void)
> +{
> +	u64 attrs, va;

That local variable va is not needed.

> +	int err;
> +
> +	/*
> +	 * There is no straightforward way to query the current VMPL level. The
> +	 * simplest method is to use the RMPADJUST instruction to change a page
> +	 * permission to a VMPL level-1, and if the guest kernel is launched at
> +	 * a level <= 1, then RMPADJUST instruction will return an error.
> +	 */
> +	attrs = 1;
> +
> +	/*
> +	 * Any page aligned virtual address is sufficent to test the VMPL level.

"page-aligned" ... 				"sufficient"

> +	 * The boot_ghcb_page is page aligned memory, so lets use for the test.
> +	 */
> +	va = (u64)&boot_ghcb_page;
> +
> +	/* Instruction mnemonic supported in binutils versions v2.36 and later */
> +	asm volatile (".byte 0xf3,0x0f,0x01,0xfe\n\t"
> +		      : "=a" (err)
> +		      : "a" (va), "c" (RMP_PG_SIZE_4K), "d" (attrs)
> +		      : "memory", "cc");

You're adding a separate rmpadjust() primitive function in patch 24.
In order to avoid duplication, define that primitive first, just like
you've done for PVALIDATE in the previous patch and use said primitive
at both call sites.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
