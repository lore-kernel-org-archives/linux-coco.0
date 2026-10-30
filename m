Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793395143;
	b=ql1hWLKcFqjURJI61HsZZGsSnkCH5CdYIzBhlE9BI5bp/rsqdVkXpglLyWTe9/Ql9m5R
	 6MG3EEFemRxZSfroZti0E2cEVg7vohTrOE4Ttu5mk5aOEjr5z4B9/+NBLKik2XN9lbTqC
	 MDOTD8tlnbt+2totjS1FVmr9dZ16eGIDisRdetfh+6khe3BbbVqSjTTKqEcPExsNH7/o7
	 xSYtpdBwoEaCHkNFsrGiBdx5WOT2Xwj1Ihj9tpObdfD59Cj03XQtnUNk6jOfpLy7ZYdzj
	 zlh2YRpfsfwFggPx1k2TY/dw7tzB8Mj+LWa47yvqKEAQpNAblUjdrVYwYatYYLOuYAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=HU3pvitpwZLUJMJVILFp+Zu6v1bdImGs94yE/HOyndg=;
	b=ZBgcIUeMP/27B4BlW4hhv4f4pUsUF1RsfG9fbIhvnjV/VV+w5dEWlYTdzc3TS8qo5Nrv
	 mrEGR4LzR3hIpzOXWWQDeaEmRrm55CXRYMVCnGqcf09oC31EXmZ5HQk/zyaog/XqxIS7Y
	 JzXMa0D2oTP1DgWA7Cb8xyXKLL8oVAiyFZs9qwYHzuRAawJ5MekexWOMBj2aG1YUaM071
	 IBAkn+pw8hsAuWQ6wdf9ztEnbGajlqK4dSqcO3IldiaZStUpn24yYxQY5TwnxA3vw/+cu
	 ZVGeSJ55wHKF8ffbeP6f0pDhMTXRJRsWhhyzeIhvO5xZcS1TdwcuvHQSEawQjNEhRAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIB2Yomh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC350606A31D
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 21:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC350606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIB2Yomh
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c5e31bea9so18350716d6.1
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 14:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793395142; cv=none;
        d=google.com; s=arc-20260327;
        b=GDzXR+62BKD/2rwi5mfHRgpu77fiWA5vI6ukw99UURI3lUHFbtqqhXDjpILti3CoMw
         dNiLAIfIYMisTJWIYz5Cr+tPe1gNUHlkGyM3xtB36w7ZS0oY+q2GIuXcK9/O89qq2+C2
         tyRrBb9WuPzr1tBtlzYz+EexqFhilWtyAtsyT6eQLDUtmXasH3imIowrcRTPt1aZyPZ0
         I/S36oaDSAvsDXZ2g616Fda/1JBrOrkW4x1KE/vyES5iUxIGSxWkXEDCAj5voz3xnoRQ
         nAEXLGA3jOQALqImFEyjzhREPDhEUQCyHMKogetLbhuEaTUtLaufhNdmRG4CkPp4vUE6
         WZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HU3pvitpwZLUJMJVILFp+Zu6v1bdImGs94yE/HOyndg=;
        fh=HE+/4/3XYZs5GrpTl/knbUGf3YYaJSA1pqzjuYnAdOw=;
        b=WTz9Hq731ghYLEoAzsm2kxUHQIelR7fw/ODLMhV1D3YpToiyDbJG53vUEClsWxEX6o
         GBKC7Es8X6/ibzqDse3mg302mUyuTdDekU6ju5wZGgQJx4cvzB/CyzmqyWPnY9BtKHIm
         Y3UKzK8n2V7lGdoJ9Q82DW3ngFymuwub4vUsyiG+e3qZJf9d+XG6kstgUtfl2slEe6w9
         xUuRzr7uu0TlyrDK0OuufYUB6gP/HyUP6bMQfMlINIFO1eC5k/+fDwoKGKGzeHxOssm4
         lTSmuvRdYaba7DjS0UGVSPZt8RiBO7en8hQhaUTP+eJsKtw6eJQRckXfPyaPKApUjdQ/
         NNPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395142; x=1793999942; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HU3pvitpwZLUJMJVILFp+Zu6v1bdImGs94yE/HOyndg=;
        b=dIB2YomhttqFpyro1ApK4LTiU968266c5ZO4LOm/iRURcPtEckqyO4+blAdV9acpMW
         JZ92DvWKbO1BNZjpTb4O3aNi2knj6vKNYHh2FJYP/mTtMWGZcp1G47efjR6iXjVMbUTn
         ZWbEC3uiljE7a6U0YFeBft610grI94+ZQSqV2KDy9zu7IaQXQVPhKIJDfJJjsqIOezLS
         1cnGlzxUqbQD4gO5rhKNFFCNdIYQSeAoFfDarxO+dJgWRYvKWE9Tmt1/tEmFFsNVl4Ss
         2Lj4ykNzZQeu+zb2liSdeMYs3juBlhn14Jx0pvPnGLQ38i4vX4Ulz7hrdFIUnHOVDe0w
         qP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395142; x=1793999942;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU3pvitpwZLUJMJVILFp+Zu6v1bdImGs94yE/HOyndg=;
        b=nRuecMR/17BXB8cqD2L8zzNKGJdCwvl4xsHYe/RiZU9oB0Fz6L+tQA+gnE586hXMSP
         0+OvgeW+ASU4y6oaySusBuEvbFCHIjdJziRZrLK4VYStbjn9+/jE8R2GR0qHDiRD/g9Z
         689bFkFSemCPbp9HMEgmqnnn+8ZTE4Gp1WSkevDURND0l41avMkos+K4nLvWx1h1IOfd
         tl0lvtLQXX2IJToYTPtc4um7vQ6A5gPiDz05TI2JVcKseVj/UfjRJP1HGVI5FWyMNJqn
         Of85eusAW8YfbzhCfdvTSy2Wpr9DKsEyeUQF1dlUCjiTauaCgfeeb/hWwaedjeWBAi/L
         QnqA==
X-Forwarded-Encrypted: i=1; AKwUvBzll2mZhz2c87D30ypWtTXkUMPCGV8UbYFuOYTUU8zwuZR65MUXMnKkQsme1sxlPltBwlJSe3JYLxmq@lists.linux.dev
X-Gm-Message-State: AFq9FYKhJkToNwRA9KnsPrwLnCAybQhGheJzzxJwdnIQ05gh0xeGjV3t
	Yvb3GGb1ZN2xWGPtwjjqQp6UFrA+Eo3Wn1B9kWS6Ry6E19Ms1e/t8NCvZ7ZqWah19z8jwg1sYrx
	R1ozm3NpeizgJiS02D8lDJQa0U+0YBSV0xeTm0EMi
X-Gm-Gg: AYBFou3NnrJjW2cjBvuUPgKtNXD8c3duJslZdePCFUvUo1uLm8X72dq3vzYgWlXPRDR
	fG2lRPikd8ZrzdiUgpzqbNEQCqQbJ8aYDAp/5FFSC05z7b5JZBJVIYlsTdmaE6A9j9YY1uNxQeu
	P7Jls+gYJ1Nft33GHTuCJ4R3BvV2oUxwqG91q1BkwmFvIS0rIBuRwRuqs355kuUm3Y561wf1Vin
	t5C4iKaZ0GJ5e1tzOrPDK9eGbGrT1L6vMHrxiSbStspaXasWvnHmYQZfETlq2Whx9lFL/lnWGA8
	O/4PsMvhs/MhgtgUa8WMBvP5KyiJto63FFS3ETong589mR3lTl6TZIheaxCTNsBxwu+Xth9f+sn
	oMX6la6F8JKAl7P5u+Qqg8YJeFlNH+/Wc6FUs2vdrOTHV3TdWv3hVMLYX/5tko/+g+ZiqidsG4K
	6S0CMk2NJe7ShdrfCrgn1qgw==
X-Received: by 2002:a05:6214:240a:b0:91c:450d:8f34 with SMTP id
 6a1803df08f44-91ca4bce34emr58846786d6.46.1793395141110; Fri, 30 Oct 2026
 14:19:01 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 14:19:00 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgEh3E7NBc5_3Wq66Fss-mAYT6+4FWP5+=Co6+OVfVnQQQ@mail.gmail.com>
References: <20261017073149.1303738-1-aneesh.kumar@kernel.org>
 <20261017073149.1303738-3-aneesh.kumar@kernel.org> <CAEvNRgEh3E7NBc5_3Wq66Fss-mAYT6+4FWP5+=Co6+OVfVnQQQ@mail.gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 14:19:00 -0700
X-Gm-Features: AclHuK8aNtmB7JK_qHjJeH9V34MC2DCp5vnYn4fAUI82UUtxS3pHz4MfNJXrVPA
Message-ID: <CAEvNRgFEKqVZcNYCL0LpB6BTyBFe+ot1x1nFfEqOrSTsu134PQ@mail.gmail.com>
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

Ackerley Tng <ackerleytng@google.com> writes:

> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>
>>
>> [...snip...]
>>
>> +static int kvm_gmem_device_convert(struct inode *inode, pgoff_t start,
>> +		pgoff_t nr_pages, const struct guest_memfd_device_request *req,
>> +		const struct kvm_memory_slot *slot)
>> +{
>> +	struct gmem_inode *gi = GMEM_I(inode);
>> +	u64 attrs = req ? KVM_MEMORY_ATTRIBUTE_PRIVATE : 0;
>> +	bool prepared = false;
>> +	int ret;
>> +
>> +	MA_STATE(mas, &gi->attributes, start, start + nr_pages - 1);
>> +
>> +	filemap_invalidate_lock(inode->i_mapping);
>> +	if (__kvm_gmem_range_has_attributes(inode, start, nr_pages, attrs)) {
>> +		ret = 0;
>> +		goto out;
>> +	}
>> +
>> +	if (req && !__kvm_gmem_range_has_attributes(inode, start, nr_pages, 0)) {
>> +		ret = -EEXIST;
>> +		goto out;
>> +	}
>> +
>> +	ret = kvm_gmem_mas_preallocate(&mas, attrs, start, nr_pages);
>> +	if (ret)
>> +		goto out;
>> +
>> +	kvm_gmem_invalidate_start(inode, start, start + nr_pages, KVM_FILTER_SHARED);
>> +	if (req && READ_ONCE(gi->device.kvm->vm_dead))
>> +		ret = -EIO;
>> +	else
>> +		ret = gi->provider_ops->prepare_conversion(gi->provider, req);
>> +	if (!ret) {
>> +		prepared = true;
>> +		if (req)
>> +			ret = kvm_gmem_device_make_private(inode, slot, req, nr_pages);
>
> Is there a way to avoid making private from within the conversion flow?
>
> kvm_gmem_device_map() below already does it as part of vcpu_run.
>
> If we do the above, we'd be aligned with regular conversions, where
> to-shared conversions eagerly update arch state (make_shared) but
> to-private notifications to the firmware are done lazily.
>

I was a bit confused above. IIUC to handle
RMI_EXIT_VDEV_VALIDATE_MAPPING, the conversion is not done from outside
the kernel, instead it is done in the vcpu_run completion hook.

Can we make the flow that userspace is required to do the conversion
request from userspace after an exit due to
RMI_EXIT_VDEV_VALIDATE_MAPPING, and then just do the delegate + map +
validate in the vcpu_run completion hook?


The rest are a little outside the guest_memfd field, but I'll make the
suggestion anyway.

It looks like delegate and map don't need the vcpu context, only
validate does, so validate has to be done in the vcpu_run completion
hook.

Delegate needs the host physical addresses, so we'd need to translate
the IPAs to PAs, could that be a VM ioctl? It could look up the memslots
and translate IPA to PA?

RMI_RTT_DEV_MAP also doesn't need the vcpu context, IIUC it does need
the VM context so it could be a VM ioctl too? If it looks up the
memslot, it'll also find the guest_memfd, where it can find the device
information.

I'm just thinking that the vcpu_run completion context is doing too
much, and there are so many possible errors that could be better
communicated to userspace if they're separate ioctls.

Or perhaps at least delegate + map could be one required ioctl call by
userspace before doing vcpu_run to continue after a
RMI_EXIT_VDEV_VALIDATE_MAPPING exit.

>> +		else
>> +			ret = kvm_gmem_device_make_shared(inode, start, start + nr_pages);
>> +	}
>> +	if (!ret) {
>> +		mas_store_prealloc(&mas, xa_mk_value(attrs));
>> +		kvm_gmem_device_update_private(gi);
>> +	} else {
>> +		mas_destroy(&mas);
>> +	}
>> +
>> +	kvm_gmem_invalidate_end(inode, start, start + nr_pages);
>> +	if (prepared)
>> +		gi->provider_ops->finish_conversion(gi->provider, req);
>> +out:
>> +	filemap_invalidate_unlock(inode->i_mapping);
>> +	return ret;
>> +}
>> +
>> +int kvm_gmem_device_map(struct kvm *kvm, u64 gpa, u64 size, u64 pa, u64 vdev_id)
>> +{
>> +	struct guest_memfd_device_request req = { gpa, pa, vdev_id };
>> +	struct kvm_memory_slot *slot;
>> +	gfn_t gfn = gpa >> PAGE_SHIFT;
>> +	struct file *file;
>> +	int ret;
>> +
>> +	if (!size)
>> +		return -EINVAL;
>> +
>> +	if (!PAGE_ALIGNED(gpa | size | pa))
>> +		return -EINVAL;
>> +
>> +	/* Caller holds SRCU across the pending architecture request. */
>> +	slot = gfn_to_memslot(kvm, gfn);
>> +	if (!slot || (slot->flags & KVM_MEMSLOT_INVALID))
>> +		return -EINVAL;
>> +
>> +	if (!(slot->flags & KVM_MEMSLOT_GMEM_DEVICE))
>> +		return -EINVAL;
>> +
>> +	if ((size >> PAGE_SHIFT) > slot->npages - (gfn - slot->base_gfn))
>> +		return -EINVAL;
>> +
>> +	file = kvm_gmem_get_file(slot);
>> +	if (!file)
>> +		return -ENOENT;
>> +	ret = kvm_gmem_device_convert(file_inode(file),
>> +				      kvm_gmem_get_index(slot, gfn),
>> +				      size >> PAGE_SHIFT, &req, slot);
>> +	fput(file);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_device_map);
>> +
>>
>> [...snip...]
>>
