Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8537416C;
	Wed, 28 Jan 2026 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634481; cv=none; b=fcNdYEPptuunMN3mWDIPo2/faBIpvJtG3Up8UJdgLw4sHffTW7keI1pquyxBO8d7c52x8Cz2pRS5igToWp5W95Ilvac05KrM+7Jowc8yi7dGh99Ck112qbpx60khhX5pWWodKYVb9iN2UHa1XYtaVyM0dI6t7+YozSl/ctOIZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634481; c=relaxed/simple;
	bh=tGJoCzuYyP9DDfnQaITfmSMCYnBd32iYXSX0TH7/yjE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jz4MeB28LqERI8l5/mt4enWsTCQ5yc7s237+pAX+HLIwIVTvFnRQQT226HmdYnI4ejyoYIHobjRyx/UY530JNLX+8F+8II7aIbmbA0Mri5Z3my6HFF+Inddw2jWx5Aq2fq9yUJFNwn2tw6CMxpktTgeEu+4pyiQLxidJqdz5gMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TNjeh53b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TNjeh53b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA88C4CEF1;
	Wed, 28 Jan 2026 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769634481;
	bh=tGJoCzuYyP9DDfnQaITfmSMCYnBd32iYXSX0TH7/yjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TNjeh53b2GQ58MmlzIVlL1YmyRy9LNtW3kOgxsrEY1o9/jA1zEFOTtac2nyEPic86
	 eB8+DQ2r2RLcT65sfScJ9mMsW3lAu7qVaPUgI3tbOE2DV9aeBW134Kr7/bELPqha8w
	 ybLKc5nZjXl6e2n7rPaWZdZvUHZtT5x2FrGsr+Fk=
Date: Wed, 28 Jan 2026 13:08:00 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Pratik R. Sampat" <prsampat@amd.com>
Cc: <linux-mm@kvack.org>, <linux-coco@lists.linux.dev>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <kas@kernel.org>,
 <ardb@kernel.org>, <david@kernel.org>, <osalvador@suse.de>,
 <thomas.lendacky@amd.com>, <michael.roth@amd.com>
Subject: Re: [PATCH v3 2/2] x86/sev: Add support to unaccept memory after
 hot-remove
Message-Id: <20260128130800.40adb423627ff6d8ffce7ccd@linux-foundation.org>
In-Reply-To: <20260128204105.508855-3-prsampat@amd.com>
References: <20260128204105.508855-1-prsampat@amd.com>
	<20260128204105.508855-3-prsampat@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Jan 2026 14:41:05 -0600 "Pratik R. Sampat" <prsampat@amd.com> wrote:

> Transition memory to the shared state during a hot-remove operation so
> that it can be re-used by the hypervisor. This also applies when memory
> is intended to be hotplugged back in later, as those pages will need to
> be re-accepted after crossing the trust boundary.
> 
> ...
>
> @@ -623,6 +624,7 @@ static inline int snp_issue_svsm_attest_req(u64 call_id, struct svsm_call *call,
>  	return -ENOTTY;
>  }
>  static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
> +static inline void snp_unaccept_memory(phys_addr_t start, phys_addr_t end) { }
>  static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
>  static inline u64 sev_get_status(void) { return 0; }
>  static inline void sev_show_status(void) { }
> diff --git a/arch/x86/include/asm/unaccepted_memory.h b/arch/x86/include/asm/unaccepted_memory.h
> index f5937e9866ac..8715be843e65 100644
> --- a/arch/x86/include/asm/unaccepted_memory.h
> +++ b/arch/x86/include/asm/unaccepted_memory.h
> @@ -18,6 +18,15 @@ static inline void arch_accept_memory(phys_addr_t start, phys_addr_t end)
>  	}
>  }
>  
> +static inline void arch_unaccept_memory(phys_addr_t start, phys_addr_t end)
> +{
> +	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP)) {
> +		snp_unaccept_memory(start, end);
> +	} else {
> +		panic("Cannot unaccept memory: unknown platform\n");

Seems severe.  Dropping a WARN() and continuing would be preferred.

What exactly happened here?  Am I correct in thinking that the check in
snp_unaccept_memory() makes this a cant-happen?

> --- a/drivers/firmware/efi/unaccepted_memory.c
> +++ b/drivers/firmware/efi/unaccepted_memory.c
> @@ -157,6 +157,52 @@ void accept_memory(phys_addr_t start, unsigned long size)
>  	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
>  }
>  
> +void unaccept_memory(phys_addr_t start, unsigned long size)
> +{
> +	unsigned long range_start, range_end, bitrange_end;
> +	struct efi_unaccepted_memory *unaccepted;
> +	phys_addr_t end = start + size;
> +	u64 unit_size, phys_base;
> +	unsigned long flags;
> +
> +	unaccepted = efi_get_unaccepted_table();
> +	if (!unaccepted)
> +		return;
> +
> +	phys_base = unaccepted->phys_base;
> +	unit_size = unaccepted->unit_size;
> +
> +	if (start < unaccepted->phys_base)
> +		start = unaccepted->phys_base;

max()?

> +	if (end < unaccepted->phys_base)
> +		return;
> +
> +	start -= phys_base;
> +	end -= phys_base;
> +
> +	/* Make sure not to overrun the bitmap */
> +	if (end > unaccepted->size * unit_size * BITS_PER_BYTE)
> +		end = unaccepted->size * unit_size * BITS_PER_BYTE;

min()?

If you like min() and max().  Sometimes I find them annoying - need to mentally
expand them to figure out what's going on.

> +	range_start = start / unit_size;
> +	bitrange_end = DIV_ROUND_UP(end, unit_size);
> +
> +	/* Only unaccept memory that was previously accepted in the range */
> +	spin_lock_irqsave(&unaccepted_memory_lock, flags);
> +	for_each_clear_bitrange_from(range_start, range_end, unaccepted->bitmap,
> +				     bitrange_end) {
> +		unsigned long phys_start, phys_end;
> +		unsigned long len = range_end - range_start;
> +
> +		phys_start = range_start * unit_size + phys_base;
> +		phys_end = range_end * unit_size + phys_base;
> +
> +		arch_unaccept_memory(phys_start, phys_end);
> +		bitmap_set(unaccepted->bitmap, range_start, len);
> +	}
> +	spin_unlock_irqrestore(&unaccepted_memory_lock, flags);
> +}

