Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793392589;
	b=gYs1Xwcr77QJtkLwH3Ac8cUccU7mR1dLgZPhs5jpmOqynxYguix/X6dqo/TFEBIe8ESg
	 dM1KJhfkhOfyYU7ubt2s1Vj2sePdA3PBdZQTvO3hr62iu0nuZqKn1fdZaiedRXBWaP/Jm
	 R8s6SDSemCMGgefOlZxcDKpGo7YGapfXOE7xVqQtM2s723xVWyxBcES0bSZZm6NGqKtS3
	 +M421mWPIfxZCpdv1sZD5J+qoU9DhNkXtUDeIsQ8zoYJd/LGFNGoGB8YANxPTyiaQIIzi
	 O9gyWMxy7Q86nqv4mQOYzDAUFRyhc3SiBWeH/BgZEgMtHwlGWKC/8t8KlrCFWIlW/nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mfTTVpEW/ASHSaJiK1tCpdlPNObyw7zCk6yXHFi2rhs=;
	b=OBy3lMgCSW4vAkNnHy57fiQO9ZP9wpYEwJ9Ec1ZTNmD9iHQLyA+ZqY9QoE7raDWzCCgU
	 Jm99Z65GUcWkQrQY3UE5ZFXK1ZRzlpo9MgYfg2HjHjFNo8B5uJaKxDMADl1+EcfGI/7Qn
	 mT/wqExXttN0x3qpA3JzU5ssopoh8iC21ZLwiCpwjNAz4gN7duxFtWm69CAm1x6GhDP1B
	 tc4jpJB0T5/XPiM/aWhHLVgN1AWhIyWwiFORmsZSSTDp8hs05WG0Ae8RgH9hKY00gGk3d
	 O2Six0/QEALcJvdV9SWqvn1aoa8qNM4mt4dezV5yBmfRKawWktfcLcskeWDh2oa9QAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WrM3qAIY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73C606A31D
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 20:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A73C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WrM3qAIY
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-537548b811aso8886751cf.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793392588; cv=none;
        d=google.com; s=arc-20260327;
        b=ZXp6dno/vCpWl147msHbH1EkB5mqf0oOmWdMDv8u5zFlTq0979MA8whunZPmbxWde4
         /5XHt1i1FO7ClBql9y9YK4BkPrER+beoe45L3tUUgUOZ0QYVmEGwrarPMkm7Q55mHNuz
         832xDlTIloU1g2YHwowUlzVqey49GjFyaV4A2wvo5qq5MCuO8OgEEmCPkQ3XiLGyRAPQ
         aAPidPDgOzUinVCgs1/7zMSM0aXmObeVLk7NgUypahXrWPyIv/Gi45pRC7GISgxeRKJh
         ZJ78vIfNRyMWc39GometH8PPazLwfNpC8Sv/6nrubsMLeEI99928yIAkZ8wsz42dBwWy
         aLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mfTTVpEW/ASHSaJiK1tCpdlPNObyw7zCk6yXHFi2rhs=;
        fh=jUzUD+nK33jGu1LA6rbowq/kF5LrJemK90wQxDA9Xjc=;
        b=FvP2VIUPu6c6MkW+1DRqAo1Q8rx6wPyyE4G/wHQVCZ7HETie7NgmCBUQym1augHK2u
         HY4GsF1M3CuyCo81JO8jZMNd+jnaVyKEBpg0FkhUpWIIBnltlgAMhbUoOB3el2QPCpIr
         uQ0dXDyP/FSQIQOSztDzERnqMxZNS30WCGuI3vzqAAwArVOMF8bVewnU9vdFKcrhmKyl
         7/2VJ/LPeZZrv3guufWudL/LRl8p6SEutfZ4ENz4qzn0JW4YdRvXru7Q9k0Hxs+fosz6
         /jeGKdCd93i94MEcqpKfpx46E4XjlEz0ah930Nc5jr4Gw4JL6dhxTVjjQ/sK3VIquFk5
         01cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392588; x=1793997388; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mfTTVpEW/ASHSaJiK1tCpdlPNObyw7zCk6yXHFi2rhs=;
        b=WrM3qAIYKEK00WP/+lqIwQz3CQQOj0Lp1bLj1blKx8HSACOYdwkJu3mh/ul/bE8YBH
         mQ/71ftJaB702Fw7fZx/bXPqTGAKzutVi71mwwKqduVqUCDZ7bpRwnYrf80G/kZoSo9+
         l2QTCl956UTOxBwQun31xKRPOMo2iBGroxZ2ZKHHtvYJ0KvrPXWkjhTxcALnr8RYdDw9
         HteVSS4rTNUtDMiXsIU52GUOG6FUmnRi1+vEsDwoizmvqgf0WQolX6wdZIadnTgMp3vt
         C/ZnykfOgqbdg2bjpJSZvloBT/FRET25GuFtfqxkvMAOM0yTyPYvk/5wzHmDj7EICDVQ
         KSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392588; x=1793997388;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfTTVpEW/ASHSaJiK1tCpdlPNObyw7zCk6yXHFi2rhs=;
        b=ML4NiYj7ElRZre6zV7byBavDv+aEMhAIjTXoTYudPpvJXo1x3FdqkdoMW/8Hw8xPml
         SOUh+mxmjMxnZNzGI8Pu2GLTWRzs/MgeT2lN6mSWyOCowukIolqIS9zyCbJry7uPax15
         jfmVV7QpzGbnUvfDcdfQOfWGGMqQNyPZLknLI3pG5CXfFDKQiM7ijv+ozF39FD9VWyFG
         T7XGgdAKt25pORvm+YfCUacx+yDLwsRUr3nFKE1lRzwNcaReqF950cMzRJxV5x2wAaB/
         u43tE9tWGh7Et25Oi0/FUYCO0VQndRTrNCrENanVV8rFjI/QPliOQkAT5hs2MAX0YApz
         fP+w==
X-Forwarded-Encrypted: i=1; AKwUvBx6zouYbkJr64AtIy+U1UMkDJXHeuEfEI0bwsLjvj8IoeJFePkE89D4SwN/KpAU7qb00mOYXS14ejML@lists.linux.dev
X-Gm-Message-State: AFq9FYLgu/mhHeiY3Su3kAVVoQ4UUg8dM8TwM/+7Dl5/Ck6DwVW97DvP
	HM1V6Os1o0wMHgMcXAvGxKU7vPrvv5HFGiO3KoRFOMa40/7Fb/6JiLXqdXDXnnDwuhHuBVpdZFe
	x8Fq/R7NhcWbIdAOEFcs/gkqXqxqR2LTg95ORghrm
X-Gm-Gg: AYBFou2AMQZzNkgHzAA/PttuTRLbCTZpyN30IhwqK/mGu8i9oZ7NDMEtmyT9n/QatQ4
	9HfdSOpGoSCY2A8EuaVqLiz3qkMRf6+QjwhkoePc+YJ+q7kQ4pAVzJRiGRGNGQpHyJPZ7NXOj5M
	xGJ6aBGCx+k3jou1L1JicbsrUFmnN2IRGbHoqVW6jD9BCs55t6gEA/cwUM0H3t35nb3Bezqdio1
	3/K1hC0WZlbdSp1ewVZB3ldNYipnshRush58oLhzZ1R691aAOh7ARvsJooWVEyzeV+/rnK4XRiw
	n7XxD0DdwAf3lIg/V8u42LzdD6OWPjSbZrlwcY5LqUMCtwlF+073WVJk7wt4KD3WbJaKEC62T+O
	RSLfmJsjFjSBwX9c1whlxGbd5kpGWfeMNqEUWpICxxXTUYTCozbQHsNX4gssEzKPpf4++qEIteS
	vDtzamuzi4+WmDexPvxtqftw==
X-Received: by 2002:ac8:5c94:0:b0:532:af50:8d7d with SMTP id
 d75a77b69052e-542b6a6d6b2mr54363611cf.33.1793392587437; Fri, 30 Oct 2026
 13:36:27 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 13:36:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261017073149.1303738-3-aneesh.kumar@kernel.org>
References: <20261017073149.1303738-1-aneesh.kumar@kernel.org> <20261017073149.1303738-3-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 13:36:26 -0700
X-Gm-Features: AclHuK8zIRE7fPt_40jzHY6DMSgwjgRywbF83YSieVT16EbHUHdKI8X5dSRrGPc
Message-ID: <CAEvNRgEh3E7NBc5_3Wq66Fss-mAYT6+4FWP5+=Co6+OVfVnQQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] KVM: guest_memfd: Support private/shared
 conversion of device memory
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev
Cc: Alex Williamson <alex@shazbot.org>, David Woodhouse <dwmw2@infradead.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Fred Griffoul <griffoul@gmail.com>, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

>
> [...snip...]
>
> +static int kvm_gmem_device_convert(struct inode *inode, pgoff_t start,
> +		pgoff_t nr_pages, const struct guest_memfd_device_request *req,
> +		const struct kvm_memory_slot *slot)
> +{
> +	struct gmem_inode *gi = GMEM_I(inode);
> +	u64 attrs = req ? KVM_MEMORY_ATTRIBUTE_PRIVATE : 0;
> +	bool prepared = false;
> +	int ret;
> +
> +	MA_STATE(mas, &gi->attributes, start, start + nr_pages - 1);
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +	if (__kvm_gmem_range_has_attributes(inode, start, nr_pages, attrs)) {
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	if (req && !__kvm_gmem_range_has_attributes(inode, start, nr_pages, 0)) {
> +		ret = -EEXIST;
> +		goto out;
> +	}
> +
> +	ret = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
> +	if (ret)
> +		goto out;
> +
> +	kvm_gmem_invalidate_start(inode, start, start + nr_pages, KVM_FILTER_SHARED);
> +	if (req && READ_ONCE(gi->device.kvm->vm_dead))
> +		ret = -EIO;
> +	else
> +		ret = gi->provider_ops->prepare_conversion(gi->provider, req);
> +	if (!ret) {
> +		prepared = true;
> +		if (req)
> +			ret = kvm_gmem_device_make_private(inode, slot, req, nr_pages);

Is there a way to avoid making private from within the conversion flow?

kvm_gmem_device_map() below already does it as part of vcpu_run.

If we do the above, we'd be aligned with regular conversions, where
to-shared conversions eagerly update arch state (make_shared) but
to-private notifications to the firmware are done lazily.

> +		else
> +			ret = kvm_gmem_device_make_shared(inode, start, start + nr_pages);
> +	}
> +	if (!ret) {
> +		mas_store_prealloc(&mas, xa_mk_value(attrs));
> +		kvm_gmem_device_update_private(gi);
> +	} else {
> +		mas_destroy(&mas);
> +	}
> +
> +	kvm_gmem_invalidate_end(inode, start, start + nr_pages);
> +	if (prepared)
> +		gi->provider_ops->finish_conversion(gi->provider, req);
> +out:
> +	filemap_invalidate_unlock(inode->i_mapping);
> +	return ret;
> +}
> +
> +int kvm_gmem_device_map(struct kvm *kvm, u64 gpa, u64 size, u64 pa, u64 vdev_id)
> +{
> +	struct guest_memfd_device_request req = { gpa, pa, vdev_id };
> +	struct kvm_memory_slot *slot;
> +	gfn_t gfn = gpa >> PAGE_SHIFT;
> +	struct file *file;
> +	int ret;
> +
> +	if (!size)
> +		return -EINVAL;
> +
> +	if (!PAGE_ALIGNED(gpa | size | pa))
> +		return -EINVAL;
> +
> +	/* Caller holds SRCU across the pending architecture request. */
> +	slot = gfn_to_memslot(kvm, gfn);
> +	if (!slot || (slot->flags & KVM_MEMSLOT_INVALID))
> +		return -EINVAL;
> +
> +	if (!(slot->flags & KVM_MEMSLOT_GMEM_DEVICE))
> +		return -EINVAL;
> +
> +	if ((size >> PAGE_SHIFT) > slot->npages - (gfn - slot->base_gfn))
> +		return -EINVAL;
> +
> +	file = kvm_gmem_get_file(slot);
> +	if (!file)
> +		return -ENOENT;
> +	ret = kvm_gmem_device_convert(file_inode(file),
> +				      kvm_gmem_get_index(slot, gfn),
> +				      size >> PAGE_SHIFT, &req, slot);
> +	fput(file);
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_device_map);
> +
>
> [...snip...]
>
