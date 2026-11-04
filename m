Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817477;
	b=3Mp4Hffe80CGch2E7uENkUexp++30iAH266vHSmXdXhxMH8oTPjRjKdKzQDo1ezuje5S
	 q/zz+xugwt13z0wEO2dK5bLeAOKXS4/uwLK8evpuCXjDjhVcApryPVvPFrJmLyxZG0Ge5
	 LBSzQlbIG/Hiigg05ChyFU/gzsyhwm/sc89tACQ/gcBhhQzEmiJAWHbNP/pfSlYgIJpAD
	 eAyYSilMswN5ywcLqUUIREmf0pp3/OWGYZGt9GjbqFRco4NSVyqapoyQNTavTxnaMBWL0
	 VY0MXOvLamUPQrUaKVDJm2FS6m0XdYmUQ8nadkaIfQRHlxRrcnHQAo1X0AJ58+PbtPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zP0FWmOJm/guqpM9jttc05RQpe78thW+WHjsEUvp+/0=;
	b=UbJ152u7Tids6SlVEu6fhqo2h0LG7caEGz7EbiXlfO6qHlJOaT4RrYdbRd1m8Zam+vbJ
	 43NerZZe1MqbZnLnAx2zPA5UMqBrAblqhvEnW0ou8g17sgGAA5o5mZ3EsWIeNRE73ZNw0
	 UO7KV8tqM2ezcj8nqJ7MBOXqMmuvRtbfe81LbEFmvkVYiY6HTmd5Oa0csBsxAhQK6eexM
	 /ukJWmSO17n80xdx5dSd/zEc6FHN7ZHV0DEqbLihBQcwCvNwvMieeS/a1kQjTLSN+1coK
	 JzflH+MdvbpinYWtOo/WjwyhofyvyM4GJcMVkSwee81dulRSKEgPd/XlPv/fnV/OjnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=id58xR3y;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA11606A339
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 18:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA11606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=id58xR3y
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so7962335e9.2
        for <linux-coco@lists.linux.dev>; Wed, 04 Nov 2026 10:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793817476; x=1794422276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP0FWmOJm/guqpM9jttc05RQpe78thW+WHjsEUvp+/0=;
        b=id58xR3yXof1mgYZ/P5jHRLMSpf9YnAWZ5l0v6P0qr032vgjfhX0MCmf9beKiq8SnG
         Fs/36SndlYpSdjfcQj90HTont983Bn33aZ9gBsgKQ5juK3a1aoZ7dVEZtmpHczoygnuF
         aGPjvAog3VDTA4DBZG7CIaH5vDMUAO3TeBFe/BuxgsIuSQ588lbzeWGRXubKKQ1DUDK0
         P2fkSmzV1MBa2wsQSisua0yV+9hozRsTtv69yGmpCFHtWDAkwIx3jlpeJ7uBtTzZUoh6
         z6bdAA4YVN0BjWSvAQPuVjO3xQd0QF8NQsQfZphGg3C0946jWq7/f030ZPcimSa2QNJM
         dpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793817476; x=1794422276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zP0FWmOJm/guqpM9jttc05RQpe78thW+WHjsEUvp+/0=;
        b=D0tdJc9d+edHdYDlpinaEgy9T4xt1ynT6NYXUSCwBRqmPeIzPeNVtT1zzK7MrQmd4M
         gt430nsO/ASMzn7e17ioj/i9HEIv0iGT3h5iAmXcgLtLcORxX10Kna8VmMqhP4/EOTRc
         3WM8MptNPKtsPMQquwl+QTf/HNSe1H0vbb+wNFa8ph2Nh7bJ3hCsO4/fJ/SsyAvK5wWl
         lO9FPlLGtHOy3tpFVdEc6//KAcJ2ZyKraC/ezXnRb+xyvS4zX+vpRmDPRH8ONGPRgvtS
         3v277ZeyqpRQlE8eyCFLkY/Y3vImlvg5TKh32jEivEZGVp2BOMlpynsQaCeTKoL8CIQ4
         DTfQ==
X-Forwarded-Encrypted: i=1; AKwUvByI8TZTOX087hTdQks4hZEv2FNxeDHBttXZ5pPfLuFXogviGZdPaMAd/Avs3oLS4V5whHCpLfyj41NR@lists.linux.dev
X-Gm-Message-State: APuU4Z+m40UgzSpE8zry9oc5h0CdYrofOvEVbHpOK4i//eu/p/dgcRmq
	/dePSfp4vJAeNkbF1+bYzQX074WDWoDF3/aCNTZQswJ327quzHGwyF9o
X-Gm-Gg: AYBFou2z4oneRVAxM2dT5O3k84BEjBNokX+YAkUEpjCjXJbznQsOKWuezj/nepim87A
	hNCPTmoi9V/5XMpMcOFvacpuT2wRFLp40tHug5xVYd6of4RXDMLoE1vT1XvWFuFVtc3B93N3QCd
	uT0Zf1toylkAl6HnHDNseoAU44TOiuXUsBwYul0CwS8G/GywQJp3dN/8a3ocmvm3cIGrz4tbP+k
	DOZD2uhZvCMjn6STBBcgpDO8k9YfKYLdD9oxUJbsU3TdslYTfQToI5TzjTwvrE2v7vmQpkV4bHL
	DvYqJQmS/5kBorPaYWEraE/gSWjG243pq4Qn3JyPS/CNpzkFC95Z82etBz1mdQ4VJgNY53W9I4g
	50K0VHxJp2tS4UIr6cTmCgwtgdMceKMWyRnV+tyPZNRxwLxU1CtBNu4PqullNOA6AFq+bBURgUg
	2ak3sSa6SiknMDyPGSEymzkez22KU6EADBG3Pcr03jB2B88ycO9iEaaiA44yGdd9Q1v+drXCjqi
	dUBjGsKdU7f1cw5dNDOYADFrA3LRZSAXXYXKEQmxGS3SgPB0z3N56oNYWBTaWbaDgTFmJr9Jkbh
	gGIxTcIaqWs5A3XYOwMqchNNZUVMLdI4dr7vAPEKWI1z/cByc0d9i0h9K4gfz9ZoTQMiQI4inLf
	1SVXkHg+hiNp8s7bIwaUVGYjLiQaPCXZGrkQnNrLTTw7jmcj0t+u8MtvKSrQbXaYL4g==
X-Received: by 2002:a05:600c:8b85:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4ac122897a8mr438143715e9.0.1793817475572;
        Wed, 04 Nov 2026 10:37:55 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm4198665e9.14.2026.11.04.10.37.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 10:37:54 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev
Cc: Ackerley Tng <ackerleytng@google.com>,
	Alex Williamson <alex@shazbot.org>,
	David Woodhouse <dwmw2@infradead.org>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	iommu@lists.linux.dev,
	kvm@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [RFC PATCH v4 06/25] KVM: guest_memfd: Support device-backed PFN providers
Date: Wed,  4 Nov 2026 18:37:54 +0000
Message-ID: <20261104183754.10457-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104150322.3516320-7-aneesh.kumar@kernel.org>
References: <20261104150322.3516320-1-aneesh.kumar@kernel.org> <20261104150322.3516320-7-aneesh.kumar@kernel.org>
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

> Device resources such as PCI BARs supply PFNs directly and cannot use
> the folio allocation path. Store the mapping owner and device ID in the
> core context during attach(), and use them when preparing device
> memslots. Keep device memory separate from ordinary PFN-backed RAM.

The device rules you wrote down in api.rst and locking.rst helped a
lot. If I read v4 right, the device backing differs from the RAM PFN
backing in these places:

  1. PFN mode calls RAM arch hooks: kvm_arch_gmem_make_shared() at
     conversion, kvm_arch_gmem_make_private() at fault, and
     kvm_arch_gmem_reclaim() on revoke and release. The device path
     has to skip them.
  2. lookup_pfn_range() only feeds those hooks, so the device path
     does not need it.
  3. The host mmap and stage-2 need a device memory type.
  4. In PFN mode, a conversion to private only updates the attributes,
     and the guest fault maps the page later. CCA has to map device
     memory at conversion, because the guest validates the mapping
     before it touches it.
  5. The device provider needs lock()/unlock(), the private range
     summary and prepare_memory_region().
  6. The provider gets the VM and the vDEVICE binding at attach.

Would these changes to PFN mode be enough to drop the device table?

  1. The arch hooks take the frame attributes. For RAM the arch does
     the RMP work. For MMIO it skips it, or does the RMM work instead.
  2. lookup_pfn_range() stays required. For vfio-pci it is the BAR
     start plus the offset.
  3. get_pfn() and lookup_pfn_range() report a memory type (MMIO) in
     their attributes, next to read only. The core mmap and the KVM
     fault path use it.
  4. A conversion calls an arch hook in both directions, and the hook
     can fail. CCA maps the private device range there.
  5. lock()/unlock(), the private range summary and
     prepare_memory_region() become optional ops for any PFN provider.
     A provider that moves RAM between guests needs them too: it has
     to order its moves with conversions and leave private pages
     alone.

I'm less sure about 6. Could KVM ask the provider for the vDEVICE when
the memslot is created, passing the VM? The provider would then not
need to keep a VM pointer.

Is there something in the device path that this would not cover?

Thanks,
Fred
