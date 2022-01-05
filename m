Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81A168
	for <linux-coco@lists.linux.dev>; Wed,  5 Jan 2022 23:50:11 +0000 (UTC)
Received: from zn.tnic (dslb-088-067-202-008.088.067.pools.vodafone-ip.de [88.67.202.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2EEA01EC0409;
	Thu,  6 Jan 2022 00:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1641426598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=yh2HPjhLeSr8ETcMJz1jKaFAeC0HLCRpCRK2exZKb7A=;
	b=T7rQ8/pTGTLLpgmVHQ6OnV/xoabedB8nMW6rkq/qq5eTJfT6rOAatO5CT+7XW8oKV+aiN5
	MesceBAIVCXWiBZej3U7pz/2BmZ9fzlNHvy39Wq1kUHJPe7P2kUrDDWt5kUcRs4ixg/veR
	VFomTwZ/EVb0Sq17zd0PQZMC5h9yOWM=
Date: Thu, 6 Jan 2022 00:50:00 +0100
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
Subject: Re: [PATCH v8 24/40] x86/compressed/acpi: move EFI system table
 lookup to helper
Message-ID: <YdYuqFcFkcK1d+XP@zn.tnic>
References: <20211210154332.11526-1-brijesh.singh@amd.com>
 <20211210154332.11526-25-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211210154332.11526-25-brijesh.singh@amd.com>

On Fri, Dec 10, 2021 at 09:43:16AM -0600, Brijesh Singh wrote:
> +int efi_get_system_table(struct boot_params *boot_params, unsigned long *sys_tbl_pa,
> +			 bool *is_efi_64)

Nah, that's doing two things in one function.

The signature should be a lot simpler:

unsigned long efi_get_system_table(struct boot_params *bp)

returns 0 on failure, non-null on success and then it returns the
physical address of the system table.

> +{
> +	unsigned long sys_tbl;
> +	struct efi_info *ei;
> +	bool efi_64;
> +	char *sig;
> +
> +	if (!sys_tbl_pa || !is_efi_64)
> +		return -EINVAL;
> +

This...

> +	ei = &boot_params->efi_info;
> +	sig = (char *)&ei->efi_loader_signature;
> +
> +	if (!strncmp(sig, EFI64_LOADER_SIGNATURE, 4)) {
> +		efi_64 = true;
> +	} else if (!strncmp(sig, EFI32_LOADER_SIGNATURE, 4)) {
> +		efi_64 = false;
> +	} else {
> +		debug_putstr("Wrong EFI loader signature.\n");
> +		return -EOPNOTSUPP;
> +	}

... up to here needs to be another function:

enum get_efi_type(sig)

where enum is { EFI64, EFI32, INVALID } or so.

And you call this function at the call sites:

	if (efi_get_type(sig) == INVALID)
		error...

	sys_tbl_pa = efi_get_system_table(bp);
	if (!sys_tbl_pa)
		error...


Completely pseudo but you get the idea.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
