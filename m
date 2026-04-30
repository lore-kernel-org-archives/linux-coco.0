Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D76257827
	for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573040; cv=pass; b=c4yBISFA1qh5z0A+kgK8CQTdzzZEjMYPsJcPtj2Srr6FRJtbOKvcMI8qXNdtgZbLPsmmTKqAGj01Y0tr6ga/DnOzXsbtmGzv4YF0IkMu03dnLKZGhQq9Bcg/GiQKp+Nzzchr/eX+RtuXq2vmhbFyNW6Ie/va3SVwX4zhqX6PgEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573040; c=relaxed/simple;
	bh=/jEC7IJfBBxXHlgchTjCqACCqOEjsTnHcHLIw8XQ6Lw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Va5pepQMXwev9oiVuX1KcKUEo2zV3Wiwq1XWlbgGb3v4sFlK6hUrhyW8OfIjqN94/TYllu1mQ19TjxwtA781U3Mcc50mxdCeOtGJCbhcdHI98HDxy2FgrHwr84LuTdo4MDp9J5gzLcK4ZUmU5LDGpQp1UudMFVPotkQ1vhvYBRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=igI3C02u; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="igI3C02u"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-613207140bfso483164137.3
        for <linux-coco@lists.linux.dev>; Thu, 30 Apr 2026 11:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777573038; cv=none;
        d=google.com; s=arc-20240605;
        b=DQu0s2SRlT42wtCjuaGU2A5O9I5haObPfQz2hWtOx6YSiJusz3VybXviWP0khNQT2u
         /OEPrk+qd9mFxQz5EL+odETPRj9hF0R5zHi+S7F5VJEpowxL/P67vDIOUO1cZb9+nLJf
         qlpF3lcjEE4MA55LsBYLTgypSXH1yRU5sazi1gD4oJGODmluxAz0P0c3dzgCM5E3SbUD
         bnSAZyj1mTBY/9jMITlWKPvSNBHP4ufVDRzE9IqI/r0SrCSwalTEG5BLi0xfNP5BDmTN
         A5EiZ+YueZIj8DbUgUsXH1A1qdNZIuEvY95F3tggtgqgQYO/LktrOjerePznX+jHHAIH
         JR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=s/OJBjFU5E2BcXru/6ZaLRbo+YS3ANxLYhS97YcrWVE=;
        fh=jwjlc3gnLGU7z5tfSfTyP5RdD71Lt5xC+JGHLxTjYv8=;
        b=brbrP3mAS+L7O8nFGLdYvxG5INBQTu6I1YLpHHbJ8tWt0rhOu4T/B94FdPXEJ5zlul
         X+GIxELs434zETc5wbeafGrbzX789y97cfZ8PDVDYkll0164XUYhn5YXsJMvcKJYzgkm
         TMP9Z6wlM2iccMizDaxdfBLN7ZNtNBWXqzKWxjeKOFuoY/xZVK060ECjaBfeFtaD9CyO
         FssILY8XWIdIQoe5W/7UdT6A65SA1TXSKbtE5CpJXl1giAWH2fTX+BRAbTyfz9bVwGre
         VyVjdU0swfhKVc1lBY2ncIv9JickWsu7lj61iYi734FeEKTiIOAvvEBnIktHRK/VSMjt
         sk+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777573038; x=1778177838; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/OJBjFU5E2BcXru/6ZaLRbo+YS3ANxLYhS97YcrWVE=;
        b=igI3C02u3iAPFd8gBcOSKLidklGRbkC6rFHCgCJk9r/fCrfAMk4/C6DnSdxMqDEaPy
         Hut+MNHa1+CkVFNXWOePBGP5FmS2sSKtSim68ItYNnArlsWq7OTFMH2Bci67l4y8srU5
         rFKx74DNuNSA3A26k/nu1tumrg0cgRSJTRCixWv7KJZ+mCbCjqFwBnWVu1o+KQtKq2x4
         X0uLb/5XPGotgE9wdhyKPQ+03EVZDaJvs3PLau6o7NBEwpnd6LBp7ucmleZAhOMdO4NP
         88dsg3HLLEjg04Mf8JNcbHR4VByWP36vnydWhRTIVwO+U9pW3jBvX1yF3I9zgARpHUy7
         NgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573038; x=1778177838;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/OJBjFU5E2BcXru/6ZaLRbo+YS3ANxLYhS97YcrWVE=;
        b=oHC+uQbd1l/DH13vLVpgmRN1pcvIx0ZUENmaxdlt8r1ODl3gY6ZjM1O44AX8ydIG3e
         CD8/TFDSOOjiAA8I/JOFBeQcyo7hqVdA4bgqrJshdVRayuYTJ7RTt8lbyXpq3XrvXnd8
         9bbdQ+mAzFP4lWBWF0RDTySOjsRG5CALiZui/WyM19H2nWM6UP7ExO7+kN3HiZ2uo0Wv
         eO6S+3TIBNrDN8q5Oq3SYJBGixsj7OzRaeneBHV6c4MER35NSQwX2Z/IP0RjQJTVa3QI
         9veMOSZBgNFP/H1OhL8/QR2pNkzNjhQ9EWG11/9u9C6J04ZtP1XjWDWdQme4Gm0D/JUK
         JBpA==
X-Forwarded-Encrypted: i=1; AFNElJ+YHnaB4ABSE+5aCiwvhQGBQxnGMnlouuN7N43jXoW+Pl5F5RZwh1DJtVCyn/GlKHI3xhgkriOZETuq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9r8TnqMHDWcQOlDd+PpmvhYXloR8HUGM2SsFPGNhE5ESVn6dV
	EeCpHPwXKor1/Hc/jmN5Tu0jdaJa+UwhyugdRHdHSAu0X5CHl1ZWLYL3JcDKPejqmxNIwAWz06Z
	f/ymFFGj/SQxF+1l4kXXB8f3U2bIjvB5CE/tv24sL
X-Gm-Gg: AeBDievpH6Xh0iHEv2Ghxj9HoMinDU9oqJawePlmS1kr+MqZoSt+3Jv+AmGjxxzHnMv
	NGNVM1YjsniHqo6bYd0jUFuW/nuEO7wgVjBzy/yq8X//+0U8LDw8sVrEE4Sf84os/3/Y9CrCPxZ
	z9g6Rz7RfDawTXD4VQjA4TxlsColj6llCz3vlQW16eSj3Iw/nFfINqLU2QUn0sYSYzmtpI3uPZ2
	0pVFv1mGjiQUseV0z4Zml5dm/PkTEChIlqQzSHvgm48NlnqtdcJiVxZum+LprnWeZpesqqtsR6U
	w3JntoZ/9cRZZlcRlhxX1ArGfNvOtkl8sCvracZzpoE1xBqVJto5piCnt81mfhu/LfvKfS2Iyxf
	CTqYHdWL+eNirEbCK/x0tACsBhA==
X-Received: by 2002:a05:6102:508f:b0:611:6fef:90d with SMTP id
 ada2fe7eead31-62ad52b8422mr2417607137.31.1777573037446; Thu, 30 Apr 2026
 11:17:17 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 11:17:16 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Apr 2026 11:17:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260430014948.24226-1-yan.y.zhao@intel.com>
References: <20260430014852.24183-1-yan.y.zhao@intel.com> <20260430014948.24226-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Apr 2026 11:17:16 -0700
X-Gm-Features: AVHnY4J9PCIVECZvrtLYhw7bWhM7_gjG-2ujkDrQ3DZ1AfQmK6yn52gKG4WOSMs
Message-ID: <CAEvNRgGsMaioFvTWaLhnDiLbdx3tunZpo3Qzxdm1xeb4ef0J9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] x86/tdx: Use PFN directly for unmapping guest
 private memory
To: Yan Zhao <yan.y.zhao@intel.com>, dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	seanjc@google.com
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, kas@kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, kai.huang@intel.com, rick.p.edgecombe@intel.com, 
	yilun.xu@linux.intel.com, vannapurve@google.com, sagis@google.com, 
	binbin.wu@linux.intel.com, xiaoyao.li@intel.com, isaku.yamahata@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index b24b81cea5ea..e5a37ea2d4a0 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -710,7 +710,7 @@ static __init int tdmrs_set_up_pamt_all(struct tdmr_info_list *tdmr_list,
>   * to normal kernel memory. Systems with the X86_BUG_TDX_PW_MCE erratum need to
>   * do the conversion explicitly via MOVDIR64B.
>   */
> -static void tdx_quirk_reset_paddr(unsigned long base, unsigned long size)
> +void tdx_quirk_reset_paddr(unsigned long base, unsigned long size)

Could this be updated to use phys_addr_t base and size_t size instead of
generic unsigned long?

>  {
>  	const void *zero_page = (const void *)page_address(ZERO_PAGE(0));
>  	unsigned long phys, end;
> @@ -729,6 +729,7 @@ static void tdx_quirk_reset_paddr(unsigned long base, unsigned long size)
>  	 */
>  	mb();
>  }
> +EXPORT_SYMBOL_FOR_KVM(tdx_quirk_reset_paddr);
>
>  void tdx_quirk_reset_page(struct page *page)
>  {
> @@ -1920,17 +1921,17 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td)
>  {
>  	struct tdx_module_args args = {};
>
> -	args.rcx = mk_keyed_paddr(tdx_global_keyid, td->tdr_page);
> +	args.rcx = mk_keyed_paddr(tdx_global_keyid, page_to_pfn(td->tdr_page));

Should mk_keyed_paddr() be updated to have a return type of phys_addr_t?
I guess in this case since mk_keyed_paddr() is pretty much an internal
function, returning u64 also makes sense to indicate that it should only
be used to set 64 bit registers.

>
>  	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
>  }
>  EXPORT_SYMBOL_FOR_KVM(tdh_phymem_page_wbinvd_tdr);
>
> -u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
> +u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, kvm_pfn_t pfn)
>  {
>  	struct tdx_module_args args = {};
>
> -	args.rcx = mk_keyed_paddr(hkid, page);
> +	args.rcx = mk_keyed_paddr(hkid, pfn);
>
>  	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
>  }
> --
> 2.43.2

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
