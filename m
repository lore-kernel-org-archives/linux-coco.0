Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379513;
	b=xiDWSRDPIY8TreVbhJpx9Iw8vyQSN8461yV1+VGCoTB3/eYxnwJQLXsWm5Wu/oaSvlaI
	 BAZGqugHXcb+aBQDv3ZLbbSnzt+GnblSeJ39SyBt6w54IXLokzh8nQqTkxOkZfg9/UkHY
	 OlQ3hvjeyPmlEOSi3H9lWuUvfe/z3XEKBVtZBk4NWfbqvY6ATl//NIU1MGkxed41evS1J
	 J4RiRT8/oca20UwCOofFmUC1Gi1OWSO0KdQhvHWrcbLTSxaJahXaRaHrqJ/uLB5fz9wl9
	 SimCTW6+kDycaTHmQLJkPVYyRBwrxAj+QI+kKf4VCrVpmno8X5QPFb0W8PY/ANJjqNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
	b=JvHtbhnhVis0G2io/NDW9lg323meCgog4XNZOpWnQRQYIwyMwAkXenX7uve+fcXkVpo7
	 uvPGaLXzAkcRFUCvR+Sdzn+IcUTCogKMJZecH3ObrBXJ/eCrCThazfMk5TnlpbUKLD1fD
	 tts+DefN6ZXXwj7skSbbuLJc/wX09TKBU9Mqm33LvM+IWTK1ZunZGOrQP3TR7DONL52rq
	 qvNmiq9yjIM6l3uzvwftfxRABUNgnZitC/5kV6oOJRHJBvKkR0XWKonsGEOezrzIkAXTS
	 vU37Wg5xEDK2ZNJTb2jRaFJMMrNcjVpDagrqRgfoLFK+C9bJCcB5fZfLmn/T5qMxAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A77606A31F
	for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 16:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A77606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91bb5795792so10857106d6.2
        for <linux-coco@lists.linux.dev>; Fri, 30 Oct 2026 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793379506; x=1793984306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=jMjBOdilJVON1kWhiH57iroR7wzXWrRyQ/2SG8NXJ52R67/g4f2btxacOXyBMZH4FD
         5MM7EjG2ICGA+DsjSU1M33wtuZ2gS38nNUEmbM1OyjdHZz+l8L7unrRoH8ZJQ3TYhebS
         RlWCSiRHfyQrj9/wAJk+2LIww1u5qWVVr/NWcQZgZROR6MQiFAPId9PLVeMsYt8ogg2N
         8gCVGDjsvr7fZlUMgkczDF0PstltP0BDn/8xRcD57kE8v7mlHB3rcKRqI7fjOCNiv0p3
         Q322yBWa2svFHbM36rCWRR6ke9Se9fQkHEYET4Af3c6wadDoJdqPXN0rQfmJKi22Aor2
         9OBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379506; x=1793984306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of8qcGhrASNngOAxz8m59rDteGhCMKDYRjobFeTSxhE=;
        b=tisnMyYOkbOB+4vEIA/byyk7xBMYvl0KQAFCSJaZOGO6bp2nAcYm38sSXPhDGFcYoc
         B6SlcKdVmRhnj6HQBgmTvoMf2xd58uNbfOAWPTa38SKDVtn+Cw2Sn5pK/jCH2l0GPsEY
         jmL9PnNvQ79NcYYAoWuk+Q/28U4Zz326tkwF2T7Tc5t48LrufiQMVR1COwAJQJAVIyvL
         DasaDAAlSdOQ+jHw5bynSQ0jO2Z59uY5aoXSk5Hpa4jzYlct/Ng6hDpBaMjdySMSiktP
         gDjEmFka4diMdjG+PJd9jhRzfYmCItN6qIVeflh6j/Mtj7pSGb5GjZC8iMz3miS0QXQO
         TMWg==
X-Forwarded-Encrypted: i=1; AKwUvBz2eDdsSGGre26vtTmeiItV3BGfPL+eimhkzcGPoNsKqlnhf8lxnQ1eLuKYJHyu2E5+zxA9bMIywVaK@lists.linux.dev
X-Gm-Message-State: AFq9FYLWbCM9OLVua2iezSKNTON1zM+7xN3O8Qct4XI05vivSn7kaO8G
	Z1A3HCfUF+qOoDui0ApyjJYW7BHP6N9OV0r7VVc4Ox3D+n9sMneRFu3XrM9Lo3z7DwI=
X-Gm-Gg: AYBFou0cY5VkCOE1bCI6i98wo3QvDtVbfiUQ8jcLnyjcfQ8MEnQlmNejmhAZ7Ja8FCj
	Z+VHs7qH2jZntu2ZIlr79LHL18rjMUL3G7vZxn3sloWpTi8th9jT7TrBg5PyfTGrd0boGX58KDQ
	IhO3V0QQ13c2FQP79WW47ryxMeAdnYAXLk+RT0dk/XrP3eUFQmCxo+k7LGIAgL4V2y3FHaxn8aA
	FSnaJOV/DMuq9+iSykZahNNW5S4oB6SRIgmuyqq7Jk8iRL0arn2z7K1PN2gHKZW621DLBovkvAT
	Q8K4cK/2X1CfjpEI4PCxoILCiRg4mgFte1R05Pt0dl0g0CLV8TQ0heWSrJxeLlzfkteHFDhY2vR
	kM2n3aPyyXoWE7WC0xvsc/yD2KdsRAyJ6+6Cr3VEBItUsXX9meJ78CjN4l0hptsrRCxxBO7qEe5
	tImGJb5aO6YPkxcd+N3OvmpDonBwgwXCiSTtS3fnqSXckVO+Ak9UN/BB4PzomyH9H1q08JHe8Gz
	EwuqdYFeFCPhJKPpKH+tHm5M9Qzm+piF2BY/qmH+apffPPDnVw8fxmxgiD5ARJ4gTjU12Nchwye
	OwfbESCFpL/H27zV9vDdtTZrQJK3st6MlhT9Rqbia+XLKTOir+nHCYki16SThBDXCu7abEDkqgG
	GuV3FC5HnqXU=
X-Received: by 2002:a05:6214:226b:b0:91b:ec0b:9671 with SMTP id 6a1803df08f44-91ca4b9a540mr46456036d6.52.1793379506439;
        Fri, 30 Oct 2026 09:58:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca80700b5sm19825486d6.38.2026.10.30.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:58:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMpvt-000000019rO-0nKn;
	Fri, 30 Oct 2026 13:58:25 -0300
Date: Fri, 30 Oct 2026 13:58:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v7 08/16] iommufd/viommu: Keep a reference to the KVM file
Message-ID: <20261030165825.GE3889730@ziepe.ca>
References: <20261008055955.4014342-1-aneesh.kumar@kernel.org>
 <20261008055955.4014342-9-aneesh.kumar@kernel.org>
 <20261014105913.00001217@linux.microsoft.com>
 <yq5aecd9aupx.fsf@kernel.org>
 <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB48351C4BD0BAD3BF6AFB2E0C8C6D2@CO1PR11MB4835.namprd11.prod.outlook.com>

On Fri, Oct 30, 2026 at 07:54:04AM +0000, Tian, Kevin wrote:

> Besides, it might be a good idea to return an error if idev->kvm_file is
> NULL in iommufd_viommu_alloc_ioctl(). I don't think the viommu logic
> is designed for native application...

That's probably going too far..

It should be possible to fully test most of the viommu stuff without
an actual kvm, for example.

Jason
