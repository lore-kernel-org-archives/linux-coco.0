Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2BB72
	for <linux-coco@lists.linux.dev>; Fri, 27 Aug 2021 16:55:53 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1117008c66b42124dc6a0e.dip0.t-ipconnect.de [IPv6:2003:ec:2f11:1700:8c66:b421:24dc:6a0e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 91BF81EC0453;
	Fri, 27 Aug 2021 18:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1630083346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aUIFMqNpBxjAGkdg6iAwim6KAU9KWJiRd8wcruSmexk=;
	b=I1h1RKAoUHGmeXJ4kkuRnowXBcM3b71SUtfhRYVQSGpQpskB0KgGgSGAc6spXl+eV/pZ7h
	VaXItU7p5N7MhDfnQ7UvLxIpnh1VImhJ5qewIYQvYtnAlq2dZHYQzALwgSeinIr7JoAOKQ
	cocjbkwIdkj5PrLsibmWvOHTxtgh3ig=
Date: Fri, 27 Aug 2021 18:56:23 +0200
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
	Wanpeng Li <wanpengli@tencent.com>,
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
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part1 v5 32/38] x86/sev: enable SEV-SNP-validated CPUID
 in #VC handlers
Message-ID: <YSkZN0Z5fs+5HOwE@zn.tnic>
References: <20210820151933.22401-1-brijesh.singh@amd.com>
 <20210820151933.22401-33-brijesh.singh@amd.com>
 <YSkCWVTd0ZEvphlx@zn.tnic>
 <62e8b7f2-4e0d-5836-ea37-9e0a7a797017@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62e8b7f2-4e0d-5836-ea37-9e0a7a797017@amd.com>

On Fri, Aug 27, 2021 at 10:47:42AM -0500, Brijesh Singh wrote:
> Actually a  VMM could populate more than one page for the CPUID. One
> page can include 64 entries and I believe Mike is already running into
> limits (with Qemu) and exploring the ideas to extend it more than a page.

You mean, like, 2 pages?

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
