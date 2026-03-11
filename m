Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365735AC2C
	for <linux-coco@lists.linux.dev>; Wed, 11 Mar 2026 06:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208846; cv=pass; b=WE40Qm3KNNBYR+z2k86hlkmZ3wevNmIAeM4BztkdrWplsRpmTVHLYtr1pR6dYJqLhN6fj1Q4xuyyseGz2QC+k+lbY/ZgSKpjnN5vw8fM33hxPWSoyo74txyhFlkPCrv3IwHxmD3DgYJOnmSd/d9gAkCA1s/7EPupYm2e8D4K6mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208846; c=relaxed/simple;
	bh=1pU9e1VV6wQdH0AgbRuRINPzSJbE/naiF7g141qXG2U=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM8CJXRfRhqcpNUF8DAYLxI32IdoFjDJICHnlg8bkEqGuKQkPWPW6zL5Miaa2ftWPWHeJYMf3ZBbEWdXTM9few3zbNF90uZRUcFlblSfEfZ0Jh4G8FC1FLeutxr2loS1zFK2PseaLRtjFHLEhvr1cBG81Jb0mzieMppZjwPeyH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ZjiCBV2; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ZjiCBV2"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so6258686e87.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Mar 2026 23:00:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773208842; cv=none;
        d=google.com; s=arc-20240605;
        b=dmghMXba2x+e+4Axw93NYPuRo3XXPLJlQRTbDkLVaOqEKTSFqEdaww6DboN+Sm8qdC
         yufxpCm6AKjRMK5TTJ0gAT9FOrUg5kKSlDt2ULsJS5hc91G/cDMZWv9060Bqd+8dMO58
         wrVP24QS2I+tQnNNOpmlXymJhXh8vLwvd1UQkhEOUfmkbaa7rWiwDo8GTCTj2PKjUh5k
         h8Zxy0nHBrfNZOJQqwOCgpOHMSxJciBJVle56+hDl289ROEMMkHKTDMxmez4y2XpV0U7
         FozpkTHbOlOqgW7yesqCaMr8Jh7RMD3A+o0DBUGZTxc+uHL2t9PnMiIU6SKuVcETzgWt
         pjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=WlV0D1/XllmyoZfK4RxM2lMbSn8Yq7S4U2C5Lb+KdlU=;
        fh=flIiXIREKdYw8WoIJup1mUqrhLmgZ5U7bOL8ZWdoV1I=;
        b=RuvpvhHVlJ4g/LRQY/JdyDgVeBGw/ZpH8IDJMwK9OPEaOeVqwTJLSW3eR2tB/NSwEk
         btuINepHfPM5KUzT+qvs1mWclDiJurmTWNjmTVg8XEuQofDSCNe0D8pDsg1naHxjjSgS
         jmd/XRLqTsVVA9x+VPTgLCU9b/jf5r9IrWYhJJv3BQ3yckzYFUE9gw1z8YRwcFpMgfqw
         n2bEgJ2sV4wPUPB779f9QI31v2/hA+LVQ0yZZrfKXQUn4UpIJai/5MJh2KOvYT/0i2s0
         IM/N9jVzPqSRaBSu+UCmcOu/TcfQt8KtlvlhMKQTOjIYonZsgM+d01qvfKkF72mGXmfc
         0A5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773208842; x=1773813642; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WlV0D1/XllmyoZfK4RxM2lMbSn8Yq7S4U2C5Lb+KdlU=;
        b=4ZjiCBV2FDnjLTnklpVDgiyY82Oytc6vY+z4RKK37SVobbRKub3F3/peHTF4IVXFXp
         YCPFay3GDHbA+hEXJE1LT7wmJtdalUIQm40IlTm+I7qvJ87+L6DmWjXFcg5mQ47vIWoG
         LpEURaSUrdIVkQiubFYF0oZEKIG/sBDTX87a0Hkh8gWqkRfT9T31oVxgmjNOKG4suOQi
         eTPQrlD+lgF4B5MRE7uMTTjgtW5NEpL8y/kLKG7Zd4xDG/gEc6/XIVaWGBQJ/EM9ia3n
         qheQ5/p5jKpMBjaocILorcnXpCOzoCnFn6DprOeD2oxf/HE8ZVFxMmU9Y1r7CWyEhWBv
         BZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773208842; x=1773813642;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlV0D1/XllmyoZfK4RxM2lMbSn8Yq7S4U2C5Lb+KdlU=;
        b=pgafDStPtfv/XUYtHwB01NUyguFvjneH5v2HOwV+4DZsMRoXSwkKQIir/V/BTunP+P
         NzFCtbG7G8goUpzuRl4qkCrDVhu1lqZMm+dqIl5CkCqGYtZyUScY8H1dcdkhSAs8hBXO
         nod/cSBjw3CnFd7st3akklnW0FLGW9JJcyefjpIXzClx0PcxVizqqEXuEY4HvEOWZXrf
         cFkJXQeUZQ+3om8o/Ml+SniUc9mcremtveBhbr62sIecDZ0PlfgXXmGIDPSZYYXZ686M
         FVEJpi0xOiOUdSDzPrrUKfzgjKHjiEScCjvyk8fwPoi3vxmXXInvHZcavnUZkOO+piTv
         BprQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWkqZtcD7hpKcZcFagHHmC5Yl29cOObgvSgO/W5VSo4VrhByDRrEmtvnTVVNrkNRlOrR4TJxw+UOFl@lists.linux.dev
X-Gm-Message-State: AOJu0YxuE3rHdecYQrlhBFjv+IgrydGjGXES+i/3/dTNPoxEjznJ6Fgr
	apkYnPDx6TdCNZk+CAbt6jeduh5rpszsc4iDtixTxo0Jdq+A4NilR+nsIQn0IpeJQkN842LEa7H
	Lz2WuHx/e2tJyXy3AIQSuHrU2j3W3JqbGNyN0PTuq
X-Gm-Gg: ATEYQzz31CVw2+6wjSCy8y8UbrTuUqREvPoia7vpigJbTWpZ94+/Aa9EMQyuGkK6Aub
	FERBoxcvvYygsBo4QjguJOiqrvZbkOYUU/yehVe04pzA8i2vy3cpsaijRekwEgf7IrQ/TWWkgtS
	y7aym2mF5htLWMMJWmTHVa/U0+2yHqdrs8wnDVNV1IafJ6ufAj+peM89kmMHFNxoiJiYNXODsnZ
	jdtyaJK0K1+bClis14ylokiJn5MS0WVfU4mCNNURXHBgaRO8OdsYutRdYUXikh01oR2eLWx6+AT
	2aohmPPi9BJl0zeClSmGL36JeC/kdwhh/1zyvPAN+DTSA095hQR4B2uDi6ugVVr4kGpdcw==
X-Received: by 2002:a05:651c:210d:b0:386:ee99:6cb3 with SMTP id
 38308e7fff4ca-38a67dd524emr4828161fa.9.1773208838986; Tue, 10 Mar 2026
 23:00:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 23:00:28 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Mar 2026 23:00:28 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <98313534-af6a-4c00-a016-9d9010f145da@amd.com>
References: <cover.1772486459.git.ashish.kalra@amd.com> <ce99dc548000b5a1f4486cdd3efe510b3874684b.1772486459.git.ashish.kalra@amd.com>
 <CAEvNRgFCTNr=LUR_RM7+A4z+qHCWBZOYKe_Cbokwx0UsCtzaVw@mail.gmail.com> <98313534-af6a-4c00-a016-9d9010f145da@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 23:00:28 -0700
X-Gm-Features: AaiRm52f972dUARRHKzijDgoVU81dxtGZgEikl-nl7dIcDPZ6xeiqW2WuI2S4xg
Message-ID: <CAEvNRgGdaA1ynF8jxQDPh9U0U8Q0RkE0=KJx4FNrh_=+dVRaLQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] KVM: guest_memfd: Add cleanup interface for guest teardown
To: "Kalra, Ashish" <ashish.kalra@amd.com>, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
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

"Kalra, Ashish" <ashish.kalra@amd.com> writes:

> Hello Ackerley,
>
> On 3/9/2026 4:01 AM, Ackerley Tng wrote:
>> Ashish Kalra <Ashish.Kalra@amd.com> writes:
>>
>>> From: Ashish Kalra <ashish.kalra@amd.com>
>>>
>>> Introduce kvm_arch_gmem_cleanup() to perform architecture-specific
>>> cleanups when the last file descriptor for the guest_memfd inode is
>>> closed. This typically occurs during guest shutdown and termination
>>> and allows for final resource release.
>>>
>>> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
>>> ---
>>>
>>> [...snip...]
>>>
>>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>>> index 017d84a7adf3..2724dd1099f2 100644
>>> --- a/virt/kvm/guest_memfd.c
>>> +++ b/virt/kvm/guest_memfd.c
>>> @@ -955,6 +955,14 @@ static void kvm_gmem_destroy_inode(struct inode *inode)
>>>
>>>  static void kvm_gmem_free_inode(struct inode *inode)
>>>  {
>>> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CLEANUP
>>> +	/*
>>> +	 * Finalize cleanup for the inode once the last guest_memfd
>>> +	 * reference is released. This usually occurs after guest
>>> +	 * termination.
>>> +	 */
>>> +	kvm_arch_gmem_cleanup();
>>> +#endif
>>
>> Folks have already talked about the performance implications of doing
>> the scan and rmpopt, I just want to call out that one VM could have more
>> than one associated guest_memfd too.
>
> Yes, i have observed that kvm_gmem_free_inode() gets invoked multiple times
> at SNP guest shutdown.
>
> And the same is true for kvm_gmem_destroy_inode() too.
>
>>
>> I think the cleanup function should be thought of as cleanup for the
>> inode (even if it doesn't take an inode pointer since it's not (yet)
>> required).
>>
>> So, the gmem cleanup function should not handle deduplicating cleanup
>> requests, but the arch function should, if the cleanup needs
>> deduplicating.
>
> I agree, the arch function will have to handle deduplicating,  and for that
> the arch function will probably need to be passed the inode pointer,
> to have a parameter to assist with deduplicating.
>

By the time .free_folio() is called, folio->mapping may no longer exist,
so if we definitely want to deduplicate using something in the inode,
.free_folio() won't be the right callback to use.

I was thinking that deduplicating using something in the folio would be
better. Can rmpopt take a PFN range? Then there's really no
deduplication, the cleanup would be nicely narrowed to whatever was just
freed. Perhaps the PFNs could be aligned up to the nearest PMD or PUD
size for rmpopt to do the right thing.

Or perhaps some more tracking is required to check that the entire
aligned range is freed before doing the rmpopt.

I need to implement some of this tracking for guest_memfd HugeTLB
support, so if the tracking is useful for you, we should discuss!

>>
>> Also, .free_inode() is called through RCU, so it could be called after
>> some delay. Could it be possible that .free_inode() ends up being called
>> way after the associated VM gets torn down, or after KVM the module gets
>> unloaded?  Does rmpopt still work fine if KVM the module got unloaded?
>
> Yes, .free_inode() can probably get called after the associated VM has
> been torn down and which should be fine for issuing RMPOPT to do
> RMP re-optimizations.
>
> As far as about KVM module getting unloaded, then as part of the forthcoming patch-series,
> during KVM module unload, X86_SNP_SHUTDOWN would be issued which means SNP would get
> disabled and therefore, RMP checks are also disabled.
>
> And as CC_ATTR_HOST_SEV_SNP would then be cleared, therefore, snp_perform_rmp_optimization()
> will simply return.
>

I think relying on CC_ATTR_HOST_SEV_SNP to skip optimization should be
best as long as there are no races (like the .free_inode() will
definitely not try to optimize when SNP is half shut down or something
like that.

> Another option is to add a new guest_memfd superblock operation, and then do the
> final guest_memfd cleanup using the .evict_inode() callback. This will then ensure
> that the cleanup is not called through RCU and avoids any kind of delays, as following:
>
> +static void kvm_gmem_evict_inode(struct inode *inode)
> +{
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CLEANUP
> +        kvm_arch_gmem_cleanup();
> +#endif
> +       truncate_inode_pages_final(&inode->i_data);
> +       clear_inode(inode);
> +}
> +
>

At the point of .evict_inode(), CoCo-shared guest_memfd pages could
still be pinned (for DMA or whatever, accidentally or maliciously), can
rmpopt work on shared pages that might still be used for DMA?

.invalidate_folio() and .free_folio() both actually happen on removal
from guest_memfd ownership, though both are not exactly when the folio
is completely not in use.

Is the best time to optimize when the pages are truly freed?

> @@ -971,6 +979,7 @@ static const struct super_operations kvm_gmem_super_operations = {
>         .alloc_inode    = kvm_gmem_alloc_inode,
>         .destroy_inode  = kvm_gmem_destroy_inode,
>         .free_inode     = kvm_gmem_free_inode,
> +       .evict_inode    = kvm_gmem_evict_inode,
>  };
>
>
> Thanks,
> Ashish
>
>>
>> IIUC the current kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
>> is fine because in kvm_gmem_exit(), there is a rcu_barrier() before
>> kmem_cache_destroy(kvm_gmem_inode_cachep);.
>>
>>>  	kmem_cache_free(kvm_gmem_inode_cachep, GMEM_I(inode));
>>>  }
>>>
>>> --
>>> 2.43.0
