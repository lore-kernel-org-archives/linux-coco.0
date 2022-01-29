Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA9A2C9D
	for <linux-coco@lists.linux.dev>; Sat, 29 Jan 2022 10:27:24 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de [88.67.221.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 270DF1EC0501;
	Sat, 29 Jan 2022 11:27:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1643452037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=AeMz8utJPjiFofsQ6mF6x/vbEjaSoinR7o1iyyLw8Cw=;
	b=SN18OmDj+GbYBib29R2reyRvEyZD0+slBoHelzKf/froKnaX6ZCcfGVkGBJrjqgLwz7PKK
	BTkU9h2E5QWrnzUda8K2NSIGtBO1fxJ/zPknHWvAlj68G7ElCHoMv858/Hd86Toroe9NJD
	gLJAJH1HoQSqgywzuN4l/5QQnvvk8VY=
Date: Sat, 29 Jan 2022 11:27:13 +0100
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
Subject: Re: [PATCH v8 36/40] x86/sev: Provide support for SNP guest request
 NAEs
Message-ID: <YfUWgeonL4tfGf8P@zn.tnic>
References: <20211210154332.11526-1-brijesh.singh@amd.com>
 <20211210154332.11526-37-brijesh.singh@amd.com>
 <YfLGcp8q5f+OW72p@zn.tnic>
 <87d4999a-14cc-5070-4f03-001dd5f1d2b1@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87d4999a-14cc-5070-4f03-001dd5f1d2b1@amd.com>

On Thu, Jan 27, 2022 at 11:02:13AM -0600, Brijesh Singh wrote:
> I am okay with using SZ_4G but per the spec they don't spell that its 4G
> size. It says bit 32 will should be set on error.

What does the speck call it exactly? Is it "length"? Because that's what
confused me: SNP_GUEST_REQ_INVALID_LEN - that's a length and length you
don't usually specify with a bit position...

> Typically the sev_es_ghcb_hv_handler() is called from #VC handler, which
> provides the context structure. But in this and PSC case, the caller is not
> a #VC handler, so we don't have a context structure. But as you pointed, we
> could allocate context structure on the stack and pass it down so that
> verify_exception_info() does not cause a panic with NULL deference (when HV
> violates the spec and inject exception while handling this NAE).

Yap, exactly.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
