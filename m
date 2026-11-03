Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731023;
	b=SAj2EmGogH+o2zDs+oszdiD7FYI4bvRU0tdp2O6JouHhOwoZ2q5My3zrftyrVsU9W6JJ
	 65gE38JPv0N8cX4xZpITEU8+TTUZ/TTfBmKjBjSm4CHzcBRxn/qOzinkRhxZ9gzCqizXV
	 XjnCOjXmv3gKaaK4+mGeYW0hkrIGdbJSZyRtH12KcippGGsQORbDk7mUYfaQhaAMmK1Ky
	 oCySg+vzi8YuhqAA6eGS1uS9XZEqvckmXyOwuFLvFfLbnUb4wIbwRMe5imUzos5Ltm/CN
	 cNzz8lpTlpJ0G9qfWI4Er7JORGQw8cBEJCbPwas2BvqT/XjgwVIEjpyMdpTe0WKVyGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MtYqIPmCoO6r7ieWdDjT3mJHSPCz3ZeRLZvBXwBPxaI=;
	b=d3nhjSUww56hZLCVpIG8onRXGmoXIKm+dq73h3qwoMWP3lOYzuEbJR1I/oJFFSpyu0s6
	 qmH6D5+5A+UMTjMn1Fcbx+MCI+4D+F1NRyt2JkDiWjsNC7G+e9aYcJIvOKZGJWwBC8cc+
	 Bos9t7HK4nDQkfKozlLK8UlB82M+3ybp3DWfKg0yDFNhl/l4NeXGq2EadzaxYAZabP6Y3
	 lm/JTT85+RES8bSFygwWdeJBWd3Hj/y4LIeFInhxlwJnO4hckzrjpPMowYguaAugJL7qX
	 quZWKAFaDP1jDc+mtcT3tKQf1IN4D+rUr5Oika4XdbBxD7vw2U1OZZSAvTIODhx3yBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=otCiMlty;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADC1606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 18:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADC1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=otCiMlty
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so28908135e9.3
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731021; x=1794335821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtYqIPmCoO6r7ieWdDjT3mJHSPCz3ZeRLZvBXwBPxaI=;
        b=otCiMlty4cQJqNIUbrLyItvDj08/Gw4KeYPqne/UyeKRDY+g5SDKadzQ7uhTHDyxj9
         guQdKMfSsoeiGVFUgg24JJYfQ9ec43Ca/FEAH9zfNso1bUK/f3Cv+FTYx/ZkwkREa/Bm
         XkPn9ZIj446bqIPa25WDQya97CbHcCB1OjnYAH4vfnvem8AkXAymgQneAYaEGniZTKue
         AwGIRieIOz3il1WWbwAU52cqX/e5m2oOLgYtNIoiQrWIFooBdHfspaeg/F/dfOBKgC4P
         dJgqJm0ISSlTnAKrPrt/Zex0XDrHndCRGScMV+L4ifKwwkt8T9lVV/yYFY01Uf4cAm3e
         Phyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731021; x=1794335821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtYqIPmCoO6r7ieWdDjT3mJHSPCz3ZeRLZvBXwBPxaI=;
        b=FiKpJklvzZKfgQtPGdYm0eQ0ub6igBArFPK05djRtwRa4twfq1AehAVnKKIGEsf1x3
         3idIfQvgTxUxiNIvWTcDiiOl2e+QXvvcx1t5xlrC+yiHg7MAgKQVSHAivH7/pcWN6k1y
         PYwbea/bs8RxYR+MOZYTzcv/rMnrFxb5ONJ7pnAR5xZHOOEI3NWRo7fr8kdLyBSejLH+
         XpI5XcdZ4VDcsUfuivH+m43kSSZFUlq267VVEVadXnU9BxuMKCAtgCWqNCLVX9FQuSW/
         3JBsd85vxtTLZY0zikZHh795r2KIE6n4yHo38dhEGRN+zcH1Ow3MU4Z3Blwn/rbX8uLH
         UATg==
X-Forwarded-Encrypted: i=1; AKwUvBy8Twb92f8D4ZPyk7xfElckTf3eRMfV1Bd8vuw87v9fk3DAg9EKJOCkbmuUaseSmpZRibJhO7Wot4Zi@lists.linux.dev
X-Gm-Message-State: APuU4Z9UUNRwfRI9pFUs2Xetcy66dcYuqR/NTq8J9Dd0YR2Sa21Q1y5K
	SjcJd+RybP4Jwmgb0MAczXhpU48Py7vVC3EL3GKoyBFa+cN3gqw1RSyJ
X-Gm-Gg: AYBFou0N7lmTF+8JYZrhVzAlQj0XuXHytxY0+uWP/Iox7bHHdkdtBd2KWPWycehhRbG
	lBPFUnvH7zt35LxNXfM9n3zUw6zIQ6lzH3KsJJJ/ITla6OsKjl2QeYYeFBiqFSD1T08TUQTAdmN
	hATsiQ+A1N6t7BduuLr+1kBv9up5SAAFxedL4lYrMZNwxBqXqzVn3VnibAJRysnEigMA/qlQpEi
	mLCmw0TALUXPT1+/FZtKn68LrMFtM146Ds/La4HWLoyWnDpgG3mnIxKGlU2J97g4+tNuw5nhWMB
	JwdtCj3LIViXDbaI8zJCbIOz8HI0Crp0DK0hBnIWyJjaVdcbGGmR+TiinzKruUW8snJvppUwCrT
	4uBtilMN/6V5Re+nrDQK3K6G7gC5RpT2kQypRb8QljRG/0MlYM7cR5+Ko1/gt2RMcJuT/0kEYZf
	ZHqO2PfidHrP0k1V9NNxQrHibscQ3MvFXqi1hdNo+Moj2rpZEY9wXhJl4whxyPlLTdxeh9fjrpe
	G0K5bSN5PUFGMFyC2LDzE8lTrwn8c983/oX9SI6C5L3xUqLmIeqKFk1lQBNU7D1VfVzkyDe+6v4
	lN+wCZJHf+d70ed/hLoa01maTL+hUBeas5M/FkmsHEmZgFFrTLjR9vzVd0dCdq9AuIgt7AYvF/H
	QS6wuOwD6JAv2nwheaieMKhjXPjfW/9IDGYvdB3M5f0Ip+HVdyHvo7jGpPml4Gexwr2jUvQ0LkU
	0Yv1f3XKq+Mjg=
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr308379315e9.17.1793731020767;
        Tue, 03 Nov 2026 10:37:00 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm25588404f8f.24.2026.11.03.10.36.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 10:37:00 -0800 (PST)
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
Subject: Re: [RFC PATCH v3 00/13] KVM: guest_memfd: Add a common framework for device memory providers
Date: Tue,  3 Nov 2026 18:36:59 +0000
Message-ID: <20261103183659.82433-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101071928.2462549-1-aneesh.kumar@kernel.org>
References: <20261101071928.2462549-1-aneesh.kumar@kernel.org>
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

> This series adds the common guest_memfd support needed by device memory
> providers. It builds on the resource-provider API [1] and the existing
> folio and RAM PFN backing support.

Hi Aneesh,

We both build on Ackerley's PFN mode [1], so here is where my export
series [2] stands and what I think it would take for the two to fit.

The export lets iommufd map a guest_memfd file without pinning it:
iommufd looks up the frame behind each shared page, and guest_memfd
calls back on every change, so the IOMMU mapping follows conversions,
punch holes and provider revokes. In the next version, the lookup
only uses lookup_pfn_range(), since it runs outside the invalidate
lock, and frames carry attributes (read only for now), which Ackerley
has offered to take into his PFN mode series.

Your patches 01-05 fit well with this: the backing ops table is the
internal provider table Ackerley's base left as a TODO, and the export
hooks stay in the common paths you keep. I tried my series on top of
yours and the conflicts are mechanical.

For device memory, I see three things to align:

1) lookup_pfn_range(). 06/13 makes it optional for device providers,
   but it is the only lookup that works outside KVM's fault path. The
   export needs it, and 07/13 would benefit too, instead of calling
   get_pfn() page by page to find contiguous runs. For vfio-pci it is
   the same BAR start plus offset as get_pfn(). Could it stay
   mandatory for all PFN mode providers?

2) The memory type. The IOMMU needs to know a frame is MMIO, and a
   prefetchable BAR may want write combining, which the fixed
   noncached mapping does not allow. A frame attribute, next to read
   only, would carry it to KVM, the VMM mapping and the export.

3) vfio-pci for ordinary VMs. Today a device provider needs a realm
   (kvm_arch_gmem_device_supported()) and gets the VM and an RMM
   binding at attach. vfio-pci is probably what will make the case for
   PFN mode upstream, and that is easier if it first works as a plain
   provider for any VM, x86 included, shared pages only, with the
   realm parts (private conversion, binding, lock()/unlock()) on top.
   It would also bring back P2P: vfio-pci refuses to attach while a
   dma-buf of the device exists, and with the export iommufd can map
   the shared BAR pages through guest_memfd instead.

I'd be glad to see v4 posted, or I can wait for 7.4-rc1. I'll reply
to a couple of patches separately.

Thanks,
Fred

[1] https://lore.kernel.org/all/20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com/
[2] https://lore.kernel.org/all/20261027154649.91571-1-griffoul@gmail.com/
