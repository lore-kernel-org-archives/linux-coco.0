Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87723655C3
	for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779909108; cv=pass; b=PjErR21CsI+XXDQ/509Sx7URkIcJM4ZyUzeYoA0QQAfNMbuugaqpEalVTTvHMZLBdNJvxiEbHtorPDDJq3f8xcdGvlx015hf+k4e3xaJuViVJY0I3jewMxplkaDKzzNxDIe1U+emwQsCeM0AQozscN09YNa/34L9AiVCaJ8iZL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779909108; c=relaxed/simple;
	bh=rS5bK7IwIlskYEDOipfKrEuNeVXLgKbZp9e4SthEl0U=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUM4eaRms74qGR/PNiWseh+X+RvH4jqdIGqXmWdGg1kP8AF4V9cZ2xNM0/YyPdt5tPO3OW4coXoFLbUeI8EsGsAeWQcY1wwGYbb3ExA03hQan/2EdxLxqaVwGbPhkupkpp2aVXqzYKd4IwyXMH0V+K1hNrxUW8CeTvIC6wl8Deo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPU62OYU; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPU62OYU"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1363e78746eso7949358c88.1
        for <linux-coco@lists.linux.dev>; Wed, 27 May 2026 12:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779909106; cv=none;
        d=google.com; s=arc-20240605;
        b=i70VRX0TVOZMozPbDZljhdMs0od2Y3+EyYELKqdiCEWK2S1vBr+fLpqZ/rJ1MiOSI5
         wdyTrsF+xM3TlDy/knBtqdUJJkK5mmcebzuUZebshca5iSbw7GjvlMgmsvxNeo8/9NoB
         LYSt9O1ui4tETrYzCoNMzlERWt9il9gafUrNcVPfytqpxa/+y7R7HAhZYGrE8lRjMYPn
         uGPaTXg8bkOAFnRwTv8N0JqVr9Gae+X5AjSfqpTINPwtMiZQZTL6z9FFPW1UbQaGniKc
         NqSIWnvF6G/ycbZ/9f5BUCcz8Zmjvre4lfh1CZeSW1qcm6iKXPMM3v4wi+0tnfRHx8PL
         ocVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=/iOy9oeAWJWkVK3CTYdsdZ3vk3yFbXZM1XcJc1qE60c=;
        fh=q98wbKT1MXRWU6CFSGdNQBNjsFKxXMvY4A2Qc158Q0c=;
        b=NtBpVhHWmLPpp65Gg5v0zYBHyWUTghLlu9zNtAaPmk8DiDflw0B3wl3Ty8u1JwkLam
         IfS7UJJPpspOuy5f/StYCbioaUEBxg0NbX0UN5ffO4Hsd+GXdUiLbQ3JsyiSRoS+HMfW
         ka70RlxpIppv9vblVJP8J0lxWoEbiwGTABr8fVMh+X5XmKWfrRjYy33k+f0o+aW9l90l
         s+3H3itNCCD9GiMSpnsUe8++8H4Of2d0aC30yn0F69ZCMMu7HxwDW7vUskHiOR/4gwjb
         /NySCuQZWfWy7/JdcLhNkZVGQ6Wzqg0tnewjlHXHsaubjPu+dccvgKhKN/gpYjYSIUnL
         gWUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779909106; x=1780513906; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/iOy9oeAWJWkVK3CTYdsdZ3vk3yFbXZM1XcJc1qE60c=;
        b=lPU62OYUuoZq8E2J+X29qiara3KLy+0vvllBhD16r/aXzHoAkLe1vqHt88g7fXPVHE
         3SFOpPWq7z5o7Sky32+heGQWnpZ4jn5OiYOAu6A7HTBLZbRm8DKH6H4UAnr+DNY5WUex
         Ti2rrww6GvBmWIWVzf+ND6eWpx3mH9JUMC0qtfYrBFq6NgihZh/KeoVu9IQeFYEKVjC+
         ZrzyV8rRAVU0I2Ogt+dxuHf+XcS2B8eGEAM+EJVwF/pGBBXTCb+ZpRpfgJILgP6VpJXg
         5twOE3F+XhLRGl08YwRVo+S2uktk2ae9miDIPKXsTbHG2nhugX4KZ+pT0IJzpxnYRgKO
         LYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779909106; x=1780513906;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iOy9oeAWJWkVK3CTYdsdZ3vk3yFbXZM1XcJc1qE60c=;
        b=bGMM8gRiqv+iBexfSJGG38UmwhFabyVWM6iOVwxYZ6YdE11KOLPEljd1r8+vZShtaQ
         P2lDVonw9i8l2nfQq3jQC2d9dNuziWVyvFUJK7H4kGQG93Q6Xv8ReX6+yl9LSOU/S6uM
         9D6WevZIeW4x87SBBJ9cbTc0wKDo+RIIdB1EY+WDu4//zmkauG1lLyav2F7p1Ys/eg20
         saMAw7LnRpNzCsVoSmoCBRGWvhYgff2nR0WeUQMBDmBrJU7FE3Et0cLYK/zTpYLv9CFN
         IhQdWNW83D0tpA4aCmEqWaxTB0S8GkqsSXWisfSdE7NPNt/oMQgD57soN+bqyN6iv+S5
         uTBA==
X-Forwarded-Encrypted: i=1; AFNElJ9q4buNWtqVOHIW9XAE4FutM3vnmfYBwKYJuE8DcSPJQeHANHYo8Uy7e+cTqOo6CXe8mE4w60lxbfaQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzqbCwokZlWkwVmIyESJEaPowHS73yWrk/T8gYfaFXeOvgcx2ED
	7UsvMHRNV/A/lWy/kd4BMT4v7DL7/geWsFlqcLm6Q80nQuapjohaQ9/5hBd0PDPfgxwTokfQKqC
	mmySIe1T0ft27LOCbTUMV1/UxdFSAuIcGx7aAbu/M
X-Gm-Gg: Acq92OE1hDTUN4LdiSv/FSByq2rCUrMcdYRFN/q8znLQ0fcHPO7+h4ujqqq3tN901D4
	kPGPR+cQGeJ1geBys+M2EXp+9nptnwwBNXT08TITTR6BAU4saa/QIt2EORuGFwST+QrxsfYH2WI
	d2XPLz82HDyrnxi0MLWtzg6igf/ObtKkBqKyKpgyKsQLIKDVBmw/3f2cPeP455uxn0l1oK8p6L1
	wKy5jns2eT9S/fh87nNA39f0CTNNoQ0yJcktL0aA0M5thU0Facl/olzYrdb7tUdtjidNrU64XsG
	LmYlEWYc1QIkxcsB52B4ebr0niyGOG2vNTCTVbkKd+toRxgrRfUrBuraXiYy31c3HSb7/pcliWG
	yyirVIBh16LY3TA==
X-Received: by 2002:a05:7022:6624:b0:136:83f5:c99 with SMTP id
 a92af1059eb24-13683f50f0cmr7372245c88.5.1779909105156; Wed, 27 May 2026
 12:11:45 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 12:11:44 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 12:11:44 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ahXMzPz1cQl6kZge@google.com>
References: <20260522-fix-sev-gmem-post-populate-v2-0-3f196bfad5a1@google.com>
 <20260522-fix-sev-gmem-post-populate-v2-3-3f196bfad5a1@google.com> <ahXMzPz1cQl6kZge@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 12:11:44 -0700
X-Gm-Features: AVHnY4IPedUzJdSkNoWjnu4aPO2wBw2uvc56SVrS-WCZO4xFwUugZXQCckX4e_U
Message-ID: <CAEvNRgHnxEO+jXqEKuewiDgFBDQDSr68A8MnJJSyf9K5AgbwWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: guest_memfd: Handle errors from
 xa_store_range() when binding
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Zongyao Chen <ZongYao.Chen@linux.alibaba.com>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, May 22, 2026, Ackerley Tng wrote:
>> Unhandled errors from xa_store_range() means kvm_gmem_bind() might falsely
>> reporting success, leading to false assumptions in guest_memfd's lifecycle
>> later.
>>
>> On error, restore the unbound state and return the error to userspace.
>>
>> Fixes: a7800aa80ea4d ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index d203135969d13..5b4911ffa208a 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -648,6 +648,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	struct inode *inode;
>>  	struct file *file;
>>  	int r = -EINVAL;
>> +	void *result;
>
> I would rather go with "xr".  "result" is too generic, e.g. begs the question of
> "result of what?"
>

Good to go with xr too.

> Actually, I don't think we even need an intermediate variable.
>
>>  	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
>>
>> @@ -688,7 +689,14 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  	if (kvm_gmem_supports_mmap(inode))
>>  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
>>
>> -	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>> +	result = xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>> +	if (xa_is_err(result)) {
>> +		r = xa_err(result);
>> +		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
>
> I'm not convinced this is necessary.  Sashiko "asked" the question:
>
>  : If xa_store_range() fails midway through storing a large range (for example,
>  : returning -ENOMEM), does it leave the already-processed entries in the
>  : f->bindings XArray?
>  :
>  : When this error is propagated back, the caller __kvm_set_memory_region()
>  : will abort the operation and free the memslot without calling
>  : kvm_gmem_unbind().
>  :
>  : Since the partial XArray updates aren't rolled back here, could this leave
>  : dangling pointers to the freed memslot in f->bindings? If so, when the file
>  : is eventually closed, kvm_gmem_release() might iterate over these dangling
>  : pointers and write to slot->gmem.file, resulting in a use-after-free.
>
> but I think Sashiko is hallicunating.
>

When I updated this I kind of just assumed xa_store_range() always
iterates indices (so for a range [0, 10], it would store 11 times), and
an earlier index could be set, and a later store could result in
-ENOMEM.

Since you called this out, I dug into it more.

> If @entry is non-NULL, xa_store_range() pre-creates the entire range, before
> storing anything into the range:
>
> 		if (entry) {
> 			unsigned int order = BITS_PER_LONG;
> 			if (last + 1)
> 				order = __ffs(last + 1);
> 			xas_set_order(&xas, last, order);
> 			xas_create(&xas, true);
> 			if (xas_error(&xas))
> 				goto unlock;
> 		}
>

xa_store_range() doesn't actually always iterate: if last + 1 is some
clean power of 2, it'll create a higher order xarray node.

Otherwise, it falls back to creating and storing 1 index/node at a time:
if the above did manage to create an xarray node, xas_error() returns
false, it goes on to the store below.

> Yes, the API handles failure on the subsequent xas_store(), but I can't imagine
> that failure is actually, barring garbage input from KVM:
>
> 		do {
> 			xas_set_range(&xas, first, last);
> 			xas_store(&xas, entry);
> 			if (xas_error(&xas))
> 				goto unlock;
> 			first += xas_size(&xas);
> 		} while (first <= last);
>

So if a later xas_create() fails because it runs out of memory, the
earlier stores would have already been committed.

This ignores -EEXIST being returned since earlier in kvm_gmem_bind()
conflicts were already checked.

> Purely from a design perspective, providing an API that can fail partway through
> under normal operation, with no indication of where failure occured (AFAICT),
> would be awful.
>

Do you mean the API of xas_store_range()? xas is updated by
xas_set_range() so that should track the last store. Since the cleanup
is storing NULLs and won't allocate, I thought it would be fine to just
store NULL on the entire range on error.

>> +	} else {
>> +		r = 0;
>> +	}
>> +
>>  	filemap_invalidate_unlock(inode->i_mapping);
>>
>>  	/*
>>
>> [...snip...]
>>
