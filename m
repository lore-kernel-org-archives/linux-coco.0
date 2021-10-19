Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1622C80
	for <linux-coco@lists.linux.dev>; Tue, 19 Oct 2021 14:47:34 +0000 (UTC)
Received: from zn.tnic (p200300ec2f12f600999171228a6b1e18.dip0.t-ipconnect.de [IPv6:2003:ec:2f12:f600:9991:7122:8a6b:1e18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52E231EC01A8;
	Tue, 19 Oct 2021 16:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1634654846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=0Z2IasPLEIyQ/8OC+77D3ZZ0oqt1dIqGErINkiovftc=;
	b=MrvyHJ9936A+4bokpf5WDZ6JTZ0zKr3ZgLpA+nLq8oid42c2itGnE04Tj5VWA6DQyhfFis
	LRzsM1hx5ve/IQZDBACckqZiq3/Q326OaxEYxtRxenN55L8R2aFhgsHrHgzH5cDgumdJJ5
	5RIvmd1tiz5D1ndwHr/lGaeH5DnvexU=
Date: Tue, 19 Oct 2021 16:47:25 +0200
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
Subject: Re: [PATCH v6 09/42] x86/sev: Check SEV-SNP features support
Message-ID: <YW7afYTDgZce/Rzr@zn.tnic>
References: <20211008180453.462291-1-brijesh.singh@amd.com>
 <20211008180453.462291-10-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211008180453.462291-10-brijesh.singh@amd.com>

On Fri, Oct 08, 2021 at 01:04:20PM -0500, Brijesh Singh wrote:
> +static bool do_early_sev_setup(void)
>  {
>  	if (!sev_es_negotiate_protocol())
>  		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_PROT_UNSUPPORTED);
>  
> +	/*
> +	 * If SEV-SNP is enabled, then check if the hypervisor supports the SEV-SNP
> +	 * features.

This and the other comment should say something along the lines of:

"SNP is supported in v2 of the GHCB spec which mandates support for HV
features."

because it wasn't clear to me why we're enforcing that support here.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
