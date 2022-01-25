Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5A7168
	for <linux-coco@lists.linux.dev>; Tue, 25 Jan 2022 18:43:34 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de [88.67.221.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 760941EC052A;
	Tue, 25 Jan 2022 19:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1643136208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=wvIvlS2dO1ThS+LV2yQ6h0qiGd4NN+hsLFVW5buEbs0=;
	b=ejvEMtrV/x1ErR80f7OgCzdqcxU5KzdO9+Ac3btdyfg/CxP+qm/1swhS/pWjt0C92J8iC5
	uHKxx/bZxLwSU3b8spXf5TW0DlCut6rOPx7VoczJgu0PwancC+Xu1O4NzkoZ9SPpd/thwA
	1SN8jQOFx0HVOzq0CPayGnJz5UBxBoc=
Date: Tue, 25 Jan 2022 19:43:23 +0100
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
Subject: Re: [PATCH v8 34/40] x86/sev: add SEV-SNP feature detection/setup
Message-ID: <YfBEy6QD38u9DSrP@zn.tnic>
References: <20211210154332.11526-1-brijesh.singh@amd.com>
 <20211210154332.11526-35-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211210154332.11526-35-brijesh.singh@amd.com>

On Fri, Dec 10, 2021 at 09:43:26AM -0600, Brijesh Singh wrote:
> +static struct cc_blob_sev_info *snp_find_cc_blob(struct boot_params *bp)
> +{
> +	struct cc_blob_sev_info *cc_info;
> +
> +	/* Boot kernel would have passed the CC blob via boot_params. */
> +	if (bp->cc_blob_address) {
> +		cc_info = (struct cc_blob_sev_info *)
> +			  (unsigned long)bp->cc_blob_address;

No need to break that line.

> +		goto found_cc_info;
> +	}
> +
> +	/*
> +	 * If kernel was booted directly, without the use of the
> +	 * boot/decompression kernel, the CC blob may have been passed via
> +	 * setup_data instead.
> +	 */
> +	cc_info = snp_find_cc_blob_setup_data(bp);
> +	if (!cc_info)
> +		return NULL;
> +
> +found_cc_info:
> +	if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
> +		sev_es_terminate(1, GHCB_SNP_UNSUPPORTED);

snp_abort() if you're gonna call it that.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
