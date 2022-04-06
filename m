Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19533FC
	for <linux-coco@lists.linux.dev>; Wed,  6 Apr 2022 21:26:55 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1649279951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y8SeU3wIhBoeYg7O06WKEKrA4HPJDtvr9Gis/MAZTmI=;
	b=MLzO5I0IR0N1SxXnmGyWHwGV2iWkw6A9eb3tTTrbkGMIxlRgqU8Po7woPcdBYUuDoHEKEr
	92f+6YsWblCo1mKaliU8gQwfP35xrK3myi5DCY3W7jaeceJ35gA7WieL7KebeVOi/+5lKw
	niVGpJlYrViWa3+rb72yomVxAZrPl6TyrpN5cndq5lQXD5etRJ5JQ0VRDINI1p1A4ohAE2
	AlMqDX1wseUo+JKcg5mz2fDxlVikZYfdYCcZSRWKtL14Qvh7yFzd2n4F2ZZpfL36I6IzvQ
	akbIf/DNJ/QsmWTZ+XPflGdo93X6vDZu90BF0a5A/NHY0R15rxV+kviTjACo9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1649279951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y8SeU3wIhBoeYg7O06WKEKrA4HPJDtvr9Gis/MAZTmI=;
	b=2D2fm0lxQUIYq6XYbxZsgZiUd7zv3McBsk8mNlzCW6WXEAoZN85C2NJ9ovtskLZgmxGd7x
	JFchuSQLhASDCnDQ==
To: Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-mm@kvack.org
Cc: Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>, Tom
 Lendacky <thomas.lendacky@amd.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Vitaly
 Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>, Andy
 Lutomirski <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>, Peter
 Zijlstra <peterz@infradead.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, David Rientjes
 <rientjes@google.com>, Dov Murik <dovmurik@linux.ibm.com>, Tobin
 Feldman-Fitzthum <tobin@ibm.com>, Borislav Petkov <bp@alien8.de>, Michael
 Roth <michael.roth@amd.com>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A .
 Shutemov" <kirill.shutemov@linux.intel.com>, Andi Kleen
 <ak@linux.intel.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, brijesh.ksingh@gmail.com,
 tony.luck@intel.com, marcorr@google.com,
 sathyanarayanan.kuppuswamy@linux.intel.com, Brijesh Singh
 <brijesh.singh@amd.com>
Subject: Re: [PATCH v12 29/46] x86/boot: Add Confidential Computing type to
 setup_data
In-Reply-To: <20220307213356.2797205-30-brijesh.singh@amd.com>
References: <20220307213356.2797205-1-brijesh.singh@amd.com>
 <20220307213356.2797205-30-brijesh.singh@amd.com>
Date: Wed, 06 Apr 2022 23:19:10 +0200
Message-ID: <87v8vlzz8x.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Mar 07 2022 at 15:33, Brijesh Singh wrote:
>  
> +/*
> + * AMD SEV Confidential computing blob structure. The structure is
> + * defined in OVMF UEFI firmware header:
> + * https://github.com/tianocore/edk2/blob/master/OvmfPkg/Include/Guid/ConfidentialComputingSevSnpBlob.h
> + */
> +#define CC_BLOB_SEV_HDR_MAGIC	0x45444d41
> +struct cc_blob_sev_info {
> +	u32 magic;
> +	u16 version;
> +	u16 reserved;
> +	u64 secrets_phys;
> +	u32 secrets_len;
> +	u32 rsvd1;
> +	u64 cpuid_phys;
> +	u32 cpuid_len;
> +	u32 rsvd2;
> +};

Shouldn't this be packed?

Thanks,

        tglx
