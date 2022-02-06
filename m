Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E129CA
	for <linux-coco@lists.linux.dev>; Sun,  6 Feb 2022 16:41:39 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-221-104.088.067.pools.vodafone-ip.de [88.67.221.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3597F1EC01B7;
	Sun,  6 Feb 2022 17:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1644165693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=Vf4uD77Lu81fzkyJFDjIK5AMPQsw8mdt+0qd3hoteKA=;
	b=X1KzWt4kENbpoTW5g4vozGTNQPANq18LmTnDQ2DAE9tecHwlnKNuJDnjMhSDBVQt8EaGwK
	isUMnTdSEnFc/dKWxahkZF0HJVXNcVjviK3CObEDSaAHBkUH1eycmrApfzGxtn8PhJEQQg
	A9rixKjewzIEXSDO6AianN5uLuVtyhM=
Date: Sun, 6 Feb 2022 17:41:26 +0100
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
	brijesh.ksingh@gmail.com, tony.luck@intel.com, marcorr@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v9 33/43] x86/compressed: Add SEV-SNP feature
 detection/setup
Message-ID: <Yf/6NhnS50UDv4xV@zn.tnic>
References: <20220128171804.569796-1-brijesh.singh@amd.com>
 <20220128171804.569796-34-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220128171804.569796-34-brijesh.singh@amd.com>

On Fri, Jan 28, 2022 at 11:17:54AM -0600, Brijesh Singh wrote:
> +static struct cc_setup_data *get_cc_setup_data(struct boot_params *bp)
> +{
> +	struct setup_data *hdr = (struct setup_data *)bp->hdr.setup_data;
> +
> +	while (hdr) {
> +		if (hdr->type == SETUP_CC_BLOB)
> +			return (struct cc_setup_data *)hdr;
> +		hdr = (struct setup_data *)hdr->next;
> +	}
> +
> +	return NULL;
> +}

Merge that function into its only caller.

...

> +static struct cc_blob_sev_info *snp_find_cc_blob(struct boot_params *bp)

static function, no need for the "snp_" prefix. Please audit all your
patches for that and remove that prefix from all static functions.

> +{
> +	struct cc_blob_sev_info *cc_info;
> +
> +	cc_info = snp_find_cc_blob_efi(bp);
> +	if (cc_info)
> +		goto found_cc_info;
> +
> +	cc_info = snp_find_cc_blob_setup_data(bp);
> +	if (!cc_info)
> +		return NULL;
> +
> +found_cc_info:
> +	if (cc_info->magic != CC_BLOB_SEV_HDR_MAGIC)
> +		sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SNP_UNSUPPORTED);
> +
> +	return cc_info;
> +}
> +
> +bool snp_init(struct boot_params *bp)
> +{
> +	struct cc_blob_sev_info *cc_info;
> +
> +	if (!bp)
> +		return false;
> +
> +	cc_info = snp_find_cc_blob(bp);
> +	if (!cc_info)
> +		return false;
> +
> +	/*
> +	 * Pass run-time kernel a pointer to CC info via boot_params so EFI
> +	 * config table doesn't need to be searched again during early startup
> +	 * phase.
> +	 */
> +	bp->cc_blob_address = (u32)(unsigned long)cc_info;
> +
> +	/*
> +	 * Indicate SEV-SNP based on presence of SEV-SNP-specific CC blob.
> +	 * Subsequent checks will verify SEV-SNP CPUID/MSR bits.
> +	 */

Put that comment over the function name.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
