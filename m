Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A512C9D
	for <linux-coco@lists.linux.dev>; Thu,  2 Dec 2021 17:52:26 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-202-008.088.067.pools.vodafone-ip.de [88.67.202.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 738161EC0545;
	Thu,  2 Dec 2021 18:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1638467531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=mYbyP91p7fEVRiuQVAocUUJu8tfWD5okvmoA1PcLyik=;
	b=mXVWsIEQlUK1NUJHwJdTRdQSa/OMoVkPBdzhiw7yQkAV+fZSgxSmaG4nPj7qJ097OltURS
	9K7IfoP8jj/OpMsUbPZIMMFljyRP4NUEFwcXSblIg3MzWWucj/p78B7x/W2l+7hzXj3UUA
	+FvrTgY4gubdPoOhL6rIySU7+PCAGqU=
Date: Thu, 2 Dec 2021 18:52:15 +0100
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
Subject: Re: [PATCH v7 10/45] x86/sev: Add support for hypervisor feature
 VMGEXIT
Message-ID: <YakHz5WCPcbNOPum@zn.tnic>
References: <20211110220731.2396491-1-brijesh.singh@amd.com>
 <20211110220731.2396491-11-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211110220731.2396491-11-brijesh.singh@amd.com>

On Wed, Nov 10, 2021 at 04:06:56PM -0600, Brijesh Singh wrote:
> +/*
> + * The hypervisor features are available from GHCB version 2 onward.
> + */
> +static bool get_hv_features(void)
> +{
> +	u64 val;
> +
> +	sev_hv_features = 0;
> +
> +	if (ghcb_version < 2)
> +		return false;
> +
> +	sev_es_wr_ghcb_msr(GHCB_MSR_HV_FT_REQ);
> +	VMGEXIT();
> +
> +	val = sev_es_rd_ghcb_msr();
> +	if (GHCB_RESP_CODE(val) != GHCB_MSR_HV_FT_RESP)
> +		return false;
> +
> +	sev_hv_features = GHCB_MSR_HV_FT_RESP_VAL(val);
> +
> +	return true;
> +}

I still don't like this.

This is more of that run-me-in-the-exception-handler thing while this is
purely feature detection stuff which needs to be done exactly once on
init.

IOW, that stanza

        if (!sev_es_negotiate_protocol())
                sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_PROT_UNSUPPORTED);

should be called once in sev_enable() for the decompressor kernel and
once in sev_es_init_vc_handling() for kernel proper.

Then you don't need to do any of that sev_hv_features = 0 thing but
detect them exactly once and query them as much as you can.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
