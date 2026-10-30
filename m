Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793400299;
	b=ZZbPYZ+BECdpih8lKFhqEHDZx/VAtvwabAdO0K/znztesuyXVitjH4AXgV/lZq51gIpA
	 7cU6VVK+As8yCF7p00XghIEqGaY9ETYYO/xOZ53spPmYjWbm4+MXaGECRqUCoS9BmaHL8
	 txfxFaZOitbi1iETMSeGQfb0ZLfpX+dx3wgzAAAs4rMzDA+ev5dttiX1Qxx8Hz/YBbEcx
	 bSQrrcEC+iDk1NwDs2XnYL+ufSRo/SC+JG0/FuV949zOnfxH9TKVsk2bLsd+XFW4fersT
	 xyRHlh92giWsumJBtofS8zk6jiPEZsbxs4XfNwnAb1jZpSooN35gvIzbZfFY0hH5KKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793400299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NYbItPhQApEJbZKga/APWqgHEBqrEwP9FLrG/rlKxD8=;
	b=J7McAxhpxuENl3SRD2AsrkOeTr5wj9rnFggofy7SSkLjoOeJIkCpA/SzmkiIVnlagZFI
	 XXXlzK1oizH+OnMkBhPT9k9upHe5+n1XrU6PfoppT0qaGNS+OuWAzoTILwFFhoEQS9S3a
	 cvomwPSkt6vTJhTrMUjnPITEdK+dj16EcISZAqVgQ9tj8lKXJriJQauf9VwGw4apAbP4g
	 E0Wh3GsuSMOpsfdQ3U/iWnAS3mh5DcVnJzQBS1c6nKkKjnqgIUTjcDv1zlzspvxQKEHPn
	 QvSMdwN8LgBH/zDdbRLA228uIiBRs4OglwxX1iM9Xpz04PqJCMl1aMZjsCLmfBLYEnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AQlexJGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB587606A320
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 22:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB587606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AQlexJGn
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f079a63b8so122148785a.3
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 15:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793400298; cv=none;
        d=google.com; s=arc-20260327;
        b=PnzXOrIW8SALGJerZ5arkvwxomDz84ACD0van/5/cjspxGBsFh6N9JZN6sUH4Ttdb7
         uamtu5/BgMNbqI8ETDoMAAz5ltC0Aeh2GkA9Wmrktl3RsHL3duCjDeVEZlnmhjBtLhn6
         sQoei8EpSyCRje0Kjwt/cKGXzmGqfWmE/gWRShM8DOCN9N52eEcprgUWT//AjnxT8teF
         /gjPkZllrFaXt/AsFU8YGEWwX/SOCw2te9R1J4FzCJrukMZR8bcnSeotetzQcSalm8O8
         O2vjac1qjSuzfFpZUqEPXOE394mGgXY1YvIqXs2DzkKpxZAlcR0jjDnHUOomX/dkprd3
         Gc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=NYbItPhQApEJbZKga/APWqgHEBqrEwP9FLrG/rlKxD8=;
        fh=axHByuEO+wxSmQ2U2ZKlFN7cWIk/kfiVEyUXvKQ4M9A=;
        b=FfpNi+kgHJYphEX/vmgczqIYYeMSkYJ+J1PKx5/WliJpGHz13UAKSEdTJw99Y0Xgop
         NXjKg4yamE9zJzK8nK9++M0zqLZs0JdExNrbWqrg6RfTQwNkWiXfhzTpWh60zo2h2/2z
         0Ii6e7sbLUtEu1cp5QTfFFtp5M3X6HmzcUpEiB506I+8OS/SA9p8OIfRsP2xijwQmAEA
         b9JFTYfXrPN60AOt80ykaQQvPWrq8B48x4PriA/bIQALBOjhx0U1tRyBP5aDIye9Ou3F
         CmjBYr9e5gQi7eZJRC3iJcdPJfDrRiA78egXw2BQSW8lLzhX8H7RiMyAFjmFS8okBSP2
         CnNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793400298; x=1794005098; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NYbItPhQApEJbZKga/APWqgHEBqrEwP9FLrG/rlKxD8=;
        b=AQlexJGnqwgyK/J4WlzIYgsBi6ad2vrDlfymYN+RjMFh+nTd+esYMCCyX2jg16e0sD
         JDRfhf3391NK7UA/tTzJeBNOOz4QzeH9eYj5jK4ZVEWqooiZUUm3vdGYfT4KX+sR5cV2
         CUseiC5PmwDrKnURHzkqVaUxgQNIj+eMY6lWV5kEcgeGM4eFU2v68RiodxidZxf4u1m0
         rywaBQdgrwOfeL1IMjiIEWdkgteyAFFToGwcqz+ZXydYkEkPyMtWMU3LZeSDwJMYvQBw
         ytoBWbVlMN/hWeyMeK6kqGVSipM0Ar+c5MsFst5GuQINqeCh02iVqUcj2YlKs9LP+9oQ
         Tqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400298; x=1794005098;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYbItPhQApEJbZKga/APWqgHEBqrEwP9FLrG/rlKxD8=;
        b=irtCRUuS7qaQQ2FUoBhVqRjHX1wVQKIuLlxiEImS3GM1FaXpXxv/sWR7YsvBk9tn7F
         Bw3zefCo3ahVCcplt4v0QDaesSymVuGgw7U1TdMt5FPAkCfV7NM3ymi8O47RxMbI0dde
         yRukWFHxOqLlXRwycQ7636emjbNcnvako9sQ0z1tONwnAb+jIA0jgzYFTfVxxyVHo0G8
         79Mh4+qJpy7Cl2uscEVq6oocFuTAbGYeObHB45LLjF5oTsrWtIVhDn2jgij4248axX91
         EzHv8zAP9y3/CNrUPmasSwmMXPbGxYT+T4tCTbp5vkBZvUhR81wPnKS9KsPn3GjnJ434
         8J3g==
X-Forwarded-Encrypted: i=1; AKwUvBx9XKJTSP+gR8I4kk1zP/oa9dw8W1LSTRs4yyVQSoNH4g3xcyXcBQ/2cjtShPliOxOuqqTwEYXPsv7I@lists.linux.dev
X-Gm-Message-State: AFq9FYInsndDhwQ1Qc8l2Gs0dMkf6g9Cu6BdYnfM/Lv0KH9vnXEPpUx9
	s+uECF11oPNUjxbQygTNNwyUmVyMVRfHQPnznxkWF+bU3VPu6NbXn8nctetqkc0ch4ivJSdpwTX
	uEPd+KFUSqc7+i/3Heae07MFb75MqrXDvoDy8/FnF
X-Gm-Gg: AYBFou0+7KK7nvHajr6cQtyWTkDiCvfcUevg0nwSZ7z1SjVb3AeJECDoUCK4Sit0bu9
	g16wAe4o+eO3FprQoZV2onG6NOhVa/e7L2h9wh+/Q/TOAZlkKYhHsBRb6PgDU8pGaBL2h3ntnVC
	lxh7UFbBNxg/FSgVCTzn+HdZLhJCH3zptOybWj2TDcCZU6blF9T1CQMCMgc/FMxDL1RCheoptw/
	/c9LaDmwq5feOpC9uitBTDN2bTspJ1YVOOIp2b9WXlWbgL0BUXF7xsKnklkW6w7SJzDZucsG+LA
	34euALqtynztInjQsgHkGe/Dxf+RkW7WXcCEu26EWGGYOwn3dLwrZ6ZaCstBIK5v0ElWYJzrqNQ
	+mLhqFb+AnAdHYFmMSRPSEKjueF0Z0CTD4IBRwwsRQIgFBSHcCC4EhumCWwx0nAXyOaI3v5HYig
	gpKCqg5gLOgv0S4EytOoS4dOM=
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id
 af79cd13be357-944217cece5mr652996085a.69.1793400297298; Fri, 30 Oct 2026
 15:44:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 15:44:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgFEKqVZcNYCL0LpB6BTyBFe+ot1x1nFfEqOrSTsu134PQ@mail.gmail.com>
References: <20261017073149.1303738-1-aneesh.kumar@kernel.org>
 <20261017073149.1303738-3-aneesh.kumar@kernel.org> <CAEvNRgEh3E7NBc5_3Wq66Fss-mAYT6+4FWP5+=Co6+OVfVnQQQ@mail.gmail.com>
 <CAEvNRgFEKqVZcNYCL0LpB6BTyBFe+ot1x1nFfEqOrSTsu134PQ@mail.gmail.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Fri, 30 Oct 2026 15:44:56 -0700
X-Gm-Features: AclHuK9AHtuqcVSSdHgG8WAhHla8voZ5Eh8lYfAwHP3Alygt10O_4piQhjU1tlA
Message-ID: <CAEvNRgH5TH8MDaRQaVczv4m6fJZKVmf=MtKzhmHs_px8+r=8bA@mail.gmail.com>
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

>
> [...snip...]
>
>>
>> Is there a way to avoid making private from within the conversion flow?
>>
>> kvm_gmem_device_map() below already does it as part of vcpu_run.
>>
>> If we do the above, we'd be aligned with regular conversions, where
>> to-shared conversions eagerly update arch state (make_shared) but
>> to-private notifications to the firmware are done lazily.
>>
>
> I was a bit confused above. IIUC to handle
> RMI_EXIT_VDEV_VALIDATE_MAPPING, the conversion is not done from outside
> the kernel, instead it is done in the vcpu_run completion hook.
>
> Can we make the flow that userspace is required to do the conversion
> request from userspace after an exit due to
> RMI_EXIT_VDEV_VALIDATE_MAPPING, and then just do the delegate + map +
> validate in the vcpu_run completion hook?
>
>
> The rest are a little outside the guest_memfd field, but I'll make the
> suggestion anyway.
>
> It looks like delegate and map don't need the vcpu context, only
> validate does, so validate has to be done in the vcpu_run completion
> hook.
>
> Delegate needs the host physical addresses, so we'd need to translate
> the IPAs to PAs, could that be a VM ioctl? It could look up the memslots
> and translate IPA to PA?
>
> RMI_RTT_DEV_MAP also doesn't need the vcpu context, IIUC it does need
> the VM context so it could be a VM ioctl too? If it looks up the
> memslot, it'll also find the guest_memfd, where it can find the device
> information.
>
> I'm just thinking that the vcpu_run completion context is doing too
> much, and there are so many possible errors that could be better
> communicated to userspace if they're separate ioctls.
>
> Or perhaps at least delegate + map could be one required ioctl call by
> userspace before doing vcpu_run to continue after a
> RMI_EXIT_VDEV_VALIDATE_MAPPING exit.
>

The delegate+map actually seems really similar to the
KVM_ARM_RMI_POPULATE ioctl. KVM_ARM_RMI_POPULATE already calls into gmem
using kvm_gmem_populate(), which can do delegate+map, can that be
reused/extended as part of RMI_EXIT_VDEV_VALIDATE_MAPPING handling?

>>>
>>> [...snip...]
>>>
