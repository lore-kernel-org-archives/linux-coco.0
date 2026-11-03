Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734733;
	b=es19tBn914E2EgjtpAaCZx8Yajb8DVkvxXoZejB0ON816wXAfjGYjsFGx92fNbcbLfkQ
	 kVjstOZJ75jEfPdWLrArK2ydWAMbQVxwu9atti+NtCmu96fkGERxAEobs6L+U7YJkfN05
	 GQhK2qoj1LAt2U6DgpmCW4fysSmYJaKZoXyXbGfFt0J++ncED0bjE0ZeOKXGEBnMS5CxZ
	 4fiRQ/zWnLvWPKe7VZ9hYTn11rR5qgrb208HT3VMMPhylIjsuEkRuqcTBqsmF+NNdvQ9E
	 hGaw0E0BHIw3sYFpuyrFnDijb5nSt5aoBZ7+qHFSXWEzICT8NBTSOfX9wfFjFehRSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TK3utwnIPX37GwcC6jBJrNjTtS9pS+ECr0ZBshoSLgk=;
	b=fVXskqerxoVr/JrZNONNnhC5YjsP4Bk6tYj7ztHPnf55ETuRAMAah9fKlhq/eyT8EHxd
	 1ZksXYtEBV3/V/xFk9HIH+14zktkDVsZSQV8l3KcwLTSZ1sdGfC80xEOSVOmXzpzjxNEY
	 rtX9R0Cdzz/jKHb1Yu8AwrigiOdDOBI9YXnBXm6ffuNOX3keD4MbF9EhZZynhmgisvJYa
	 AlynNNVJSbbs8+OipxT2DSIYIpDT8rm8s8lrbqB/dQNOqPM9vxLwrxMGFhKrHAVgCbwo0
	 aXKFG4bppnYs1dr4Qnz0o5MMetYWLB3L2ou9EZu9InJiishthFxauDx96ow1m2vl7mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TX+afQ5O;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91CA606A326
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 19:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E91CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TX+afQ5O
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10926355e9.0
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 11:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734731; x=1794339531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TK3utwnIPX37GwcC6jBJrNjTtS9pS+ECr0ZBshoSLgk=;
        b=TX+afQ5OtmLi0K/jNFhb5EjLFNdHPjZexNLXbOdK2n5L5lLYEavfh1RJezjq0Ewnb8
         uMFSW+ADG6GkMoE/+t5MPs5slp/rIsftxgRNBloTBYJpOSWoXuI4lnWWgjjMc7c6i9r/
         FnpsINYLolXqce+OhmVw3GnOSYu1JyZW1mcc2VUzZ4QJQrjJUKVletpO7pdts0qA+O2O
         G64bKp/+JAcwyQhOzFhvtfXS6xX1pIfP+/0ZTBb2utw+aMk+4705defFpSoGrnDRuwZ7
         MShz/Pjj0dmSZj29lOYd/kbI3ZRBb66RbEb/ATVdtDsufZXApjfvENXVLF/vHz2g4Z74
         7ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734731; x=1794339531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TK3utwnIPX37GwcC6jBJrNjTtS9pS+ECr0ZBshoSLgk=;
        b=C4uyxLX0ry/GnLuVIl28GQ8g7pVZrSFR+L//ll2NAC9ucdqv8iaRm4koqhEo5dBmOt
         hMwFlq4mnLZN5dEm/txl4S0qDA2TPnA4SGgHYKZ43ougfuIOVjdTFjGkWFCWI7UI8Uvu
         z9+dL3aAWtyXQWTSOl37WZICug7hrJ49sJmYEXg9h/dSWgTBYc+zaVovZmkC5lPZ8uqD
         svjrII4unAYkQfIDb6cmrsx+vYqnDky2RHLJkd8eDlOCir/R4r6/EG0JOr/2rAwdRE1M
         F/zE1a9uDlg1RT2wX1/DM1rnkmcO7i3aDg1log+Hoq7VFGjv1pCXDni+dRmCSjg/MjSC
         GASQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt2ZdWnz++DM7v6nNq0w3FxrXqJEJBD8vM/fmLWzYbT5obSduh7dT7ydtklhnEWvpeb4uuiFkZOKxv@lists.linux.dev
X-Gm-Message-State: APuU4Z8PD+9w9f70bLmO9DHeRDEW4D1V/sVD986DVa4WhIVyFWGn70fR
	b4NheGYgTZJz8wgG7OgnB4sARuw+SJXW/ZMF7QsreMrOqKVC9BDg6FP5
X-Gm-Gg: AYBFou0Z+KZUBK+c5QCjMdiFaCiou9OBjC+GGv5vxMIc4Ppb3sT80M4pwa6uZC3J1FU
	ySIwzTCYMeDCkCLJDGa+IFb3YlZ8HFjGP9h4Bc/KEQjVZAiPqpOcezqkktjyRMeajTKME4+eQeV
	FaYSz0Yq7yEWkgr4872e5A/UHbIPmNxbT1JMYR5altO2NQGv9QrJpjYbTAe3MA17XHgvFp0h5N9
	qNZStqr35mHZH4wRwxHWt1Dy2lj5ZIFqr+10LOkBJneGqrb1rrj2I45UMNcuakD5Gd+6uCK+UsM
	D07D5d1BbITMHB5gIkJ+ygPkNrxVcQZfxAmPZAcYJZabCrmw4SWPimE61Iz50etg6FaP+D0/AUg
	z/GVkP2/7epolFX7i+WoS1hnfwP+wZi2TztyYfduly1SirXzd8I/Pp9rxhDx2I1v7hK4VSuygYy
	zSfwgselx7TG5kJrmLFPmXVLAIeAFD47MkOgUFLc3L4DpJZ7sImLvydwWNKuu7U3ePNaBM7SUrK
	oLOinp2VV9xvr/G1c1SFKge0MFeoFNPJ/qHWGJ9xd4U9NnLV4XEPuxLtbDIeyvJeFO0shLuvT1U
	P5RD5CG7lNSYDJlLEGmNtHU3NHu5S3ZrWMOAZNwpXbIU3GHP7m/UH+Ieka0r4CJbuitoX40kWdD
	9DxzeKwarwaABUxkNQTl0PCT3VbcjUZr8ZdFJnVDtpwnzbpK4QhA0t5xn523dqW696w==
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr326325635e9.14.1793734731206;
        Tue, 03 Nov 2026 11:38:51 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm87303325e9.0.2026.11.03.11.38.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:38:50 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev
Cc: Ackerley Tng <ackerleytng@google.com>,
	Alex Williamson <alex@shazbot.org>,
	David Woodhouse <dwmw2@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Will Deacon <will@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [RFC PATCH v3 07/13] KVM: guest_memfd: Support private/shared conversion of device memory
Date: Tue,  3 Nov 2026 19:38:50 +0000
Message-ID: <20261103193850.15363-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101071928.2462549-8-aneesh.kumar@kernel.org>
References: <20261101071928.2462549-8-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:

> +			if (!slot)
> +				return -EINVAL;

[...]

> +			ret = kvm_arch_gmem_device_map(gi->device.kvm, slot, gpa,
> +						       (u64)(high - first) << PAGE_SHIFT,
> +						       PFN_PHYS(pfn));
> +			if (ret)
> +				return ret;

Unless I'm missing something, these returns leave the pieces already
mapped in place, while the attributes stay shared. A later conversion
to shared would then find nothing to do, and a retry of this
conversion would run into the pieces that are mapped.

Would it make sense for the error path to unmap what was mapped, e.g.
with kvm_gmem_invalidate_start() and KVM_FILTER_PRIVATE on the range?

Fred
