Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA2374170
	for <linux-coco@lists.linux.dev>; Mon,  9 Mar 2026 09:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046917; cv=pass; b=gLofAt0Hq2kNnz033IqtRuHN8sfe9UFII1qTUWIk2ZzIrztOJRyTy4eSqHvImWCkk/jUT+pVlKA+PooV4OxcJaW4cZsSa7qayRY/7sNZjTMKL+qLZlkUv0LGfk8ET1zaTVmGZoSq+y2YTm0cLVx6aDC2QeWgd89ov3hpqdEXIIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046917; c=relaxed/simple;
	bh=PNkPX25Cp7e7Iwb2dKtnjzov9RP8heUl93T4iWLshSg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVBA7zPEIb/n2vScLNqnDtskJ5NNii99f3PdT+RGi16+hkLnwkuUHWKjdgkXNrE5Oqtro0qm6rAs0S+2XNM1V1cGt9by8wCXTfiuTjjsPdNz4dM8ApeTSbkYHNQd0Qcz4zDvTaHaL7/kp22IkO9O4DRMd+vbfvzdQq5XmIv6kOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iTX1hHMG; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iTX1hHMG"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff05af29b4so3855641137.1
        for <linux-coco@lists.linux.dev>; Mon, 09 Mar 2026 02:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773046914; cv=none;
        d=google.com; s=arc-20240605;
        b=EPdvR0MY+sX4ZWHpPgQAmZsb3FX5FWIBlthvJ4zjKqcouEQuGohsHfCY2rcljzH4fH
         RV5YgmnfiGKiw52zd/MRN2MFN6ci2UdQ82tcTeTXCO7Q7XiqHP87r+M4V8WcrXOFYvfP
         YwtZ39/r8xwzgJ3wiK7m79Sd+wq1ZPhMo62ielDZpA80VvIJ2jZaUQufeeaTeu48VA3d
         PVrOGPyzy7vcX1cSawhFIfIkYA/1ZCEcoqH4h+eK9+JE5i2zIHeFbr9LkNW0jB4nXYNr
         PW5KiJ/Bm51Lw8yTJIa7leGNWpd8AewTNiaim/pGxAimHacUwAiSg7BxHalf3b4JFMRH
         fc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=RFQA1zNrgYGwPSpxXXkSccQrNeC8DGePNpNQ4Qq3K74=;
        fh=863Zr5IZc6qmyzokn2IarOtKNW4Y5ejdUDQNOt0ld8o=;
        b=IFKWtNxvA3GYiSXDYgLrgq18D/Zh/J7MMA60JFermLyAo7OIb8cMh3MPfbzjMY0xaA
         xZ0hc1iwLSHljy1JIiPCLJGS3+7zUrA4ySdTfP9uLk3qVJfXQNpnJLVcHpLJZ0mN4mes
         njZd2vlDVZcmguZsqhZzQJIR/0fzL9+z5gFAdWQUG6/GkNxN0yaAfhKKuxWHa1+L/1B4
         uQUon2UzJ/lSr+aBoBtbruO6VVD042QSlspf92jtKYPk8/8wghtio+0D6yLAvVUn8+t4
         h+ton/m0PgbFXQ5awDj/ECd9DjbLrFYmiXYfnJHEvOxhYC2mlzfxSIOxb75XrlJU2W2y
         i/fQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773046914; x=1773651714; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFQA1zNrgYGwPSpxXXkSccQrNeC8DGePNpNQ4Qq3K74=;
        b=iTX1hHMGb7w/Y1BAS7nS5GWPIDCgfCRNf7sCG39l1kjlukVTcykv5t5omrI5iArpk2
         5edJGTGAOK7vUzWnyHcovZfWlbjM0Ri0/iVt3c/KHhmP2wXs0POI62qIR3hhk+UK4/eS
         hI6jg1CC+wQNvBN5DbZpQzPm7bcLooFzBrLjCwaD7iDrjKm755NjWx89kOhYq4V0l2kG
         9yQqk8gn9Ll4r5qbhvatiJ4SV5H0LKaBHZWYVZ3LNBxDQWULQINY8eoPt7TX1EfNx6NJ
         pQydeRD0cIOs0eEX2LzWgI0Onvm0V2BBAYO7Eh8cta3j3TFTXD56JejE60q+vKTqdl/J
         P20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046914; x=1773651714;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFQA1zNrgYGwPSpxXXkSccQrNeC8DGePNpNQ4Qq3K74=;
        b=CWoKjg+w74X3JeG84zu166R+QUY3N8/gxdfSVVW26utVJgbMIHESvQh+HxHSeg4hZV
         nixgP9oe0WdUjpxtybEeI0GfGBEOjIHAPxMslAaK43OPAk2CTfRWaZXgE0uCg4YcAiUR
         PdfCh2hSHafC3V6SOeeQeT4FZrBrjmwe4T/A9uDg6a7uyyKP8pvWaJ0UxqRFZ44ORdEf
         6QHzrpg4fAQCooCNhGyTQ73lY7WiZxw+RwVyt/D8YwbyEboI5AQmQS8DftSI7j64c6de
         XFyn2Ri6uCUG6wNJrN6D3l/8Suf18dilvVtc9O2eHX+7yHeKDQQOCT6wQzox7hJnN2IE
         h6rg==
X-Forwarded-Encrypted: i=1; AJvYcCWxhFsFbtZNggDKdkLt6rCx6IyRBja0LFB9zhCblx8to2rpEx4r3ODoZBwzywdCNTHz8guq59fhl0q9@lists.linux.dev
X-Gm-Message-State: AOJu0YworYu1NPGywb9IJ2s15Vg68lc+pBxjqVCGmKLkfDG4WUSdpA3G
	+uqJ1lY9vQD1Rkgt/y4UpmRD/6az948DVdXyjrvc7+1m11A9S8WKv4JHcRtgUQ7ZDMzjLT03mQL
	sd7tCRBMURSIa1wcP3QeOCb9CbYfPJ/3cRUfQkNtq
X-Gm-Gg: ATEYQzwqLdDi3xnpKIceW8BPo6PKkLKiPRfK8HhkHca0lCCuwpZ/C/I+WjWZjqG+gCa
	iYliz+p9JGoTFQfaRy/8Zkm7Te+Pp2j3QqIlv/dmC4h0U9VO6IENCwQO4rpNxX/E14P49HdZJ19
	YWLjabPAgXTqBSEWS/A20diudsQJ6WYhINLTI9fpBRaAJAP0Dn6ASjtg8wPPTDoed4tXIyfiTu6
	5DkZC0MTESVrD4yLWVH0QBROA677eqh+P8TomZqdqB+RR9uvyMuHxUcZA+CkJe9qsIv3o+DVgad
	FMBeT9/dCTmlmixKttPpa1WAd8yBU2o5rKsbG6yKFmoUUxsiznD6pyu2OMvDKiuYlK9Dug==
X-Received: by 2002:a05:6102:3f0b:b0:5ef:a644:ca4 with SMTP id
 ada2fe7eead31-5ffe6134835mr3557573137.23.1773046913874; Mon, 09 Mar 2026
 02:01:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 02:01:53 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 02:01:53 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ce99dc548000b5a1f4486cdd3efe510b3874684b.1772486459.git.ashish.kalra@amd.com>
References: <cover.1772486459.git.ashish.kalra@amd.com> <ce99dc548000b5a1f4486cdd3efe510b3874684b.1772486459.git.ashish.kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 02:01:53 -0700
X-Gm-Features: AaiRm523pnGIGt0JrK2mF_UJQjN59ASDAQJnNicAgeYGdxK3jDgLfp_34dMqkIY
Message-ID: <CAEvNRgFCTNr=LUR_RM7+A4z+qHCWBZOYKe_Cbokwx0UsCtzaVw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] KVM: guest_memfd: Add cleanup interface for guest teardown
To: Ashish Kalra <Ashish.Kalra@amd.com>, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	peterz@infradead.org, thomas.lendacky@amd.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, ardb@kernel.org
Cc: pbonzini@redhat.com, aik@amd.com, Michael.Roth@amd.com, 
	KPrateek.Nayak@amd.com, Tycho.Andersen@amd.com, Nathan.Fontenot@amd.com, 
	jackyli@google.com, pgonda@google.com, rientjes@google.com, 
	jacobhxu@google.com, xin@zytor.com, pawan.kumar.gupta@linux.intel.com, 
	babu.moger@amd.com, dyoung@redhat.com, nikunj@amd.com, john.allen@amd.com, 
	darwi@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ashish Kalra <Ashish.Kalra@amd.com> writes:

> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Introduce kvm_arch_gmem_cleanup() to perform architecture-specific
> cleanups when the last file descriptor for the guest_memfd inode is
> closed. This typically occurs during guest shutdown and termination
> and allows for final resource release.
>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>
> [...snip...]
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 017d84a7adf3..2724dd1099f2 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -955,6 +955,14 @@ static void kvm_gmem_destroy_inode(struct inode *inode)
>
>  static void kvm_gmem_free_inode(struct inode *inode)
>  {
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CLEANUP
> +	/*
> +	 * Finalize cleanup for the inode once the last guest_memfd
> +	 * reference is released. This usually occurs after guest
> +	 * termination.
> +	 */
> +	kvm_arch_gmem_cleanup();
> +#endif

Folks have already talked about the performance implications of doing
the scan and rmpopt, I just want to call out that one VM could have more
than one associated guest_memfd too.

I think the cleanup function should be thought of as cleanup for the
inode (even if it doesn't take an inode pointer since it's not (yet)
required).

So, the gmem cleanup function should not handle deduplicating cleanup
requests, but the arch function should, if the cleanup needs
deduplicating.

Also, .free_inode() is called through RCU, so it could be called after
some delay. Could it be possible that .free_inode() ends up being called
way after the associated VM gets torn down, or after KVM the module gets
unloaded?  Does rmpopt still work fine if KVM the module got unloaded?

IIUC the current kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
is fine because in kvm_gmem_exit(), there is a rcu_barrier() before
kmem_cache_destroy(kvm_gmem_inode_cachep);.

>  	kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
>  }
>
> --
> 2.43.0
