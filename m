Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199702;
	b=YeR04dukowpAgxcxRM/DjmzhiD2gRBEMgo/j4j1qBB25Cj1vATC6/1l4/5/JTL/HNTwp
	 DZpN2815Xe6xPQP/fX3Mw5hiI82zBTtuHojUAIAWc2dcYgQo2cm3mWMiEiAo/NIKzAfiv
	 nUGonP0zrjlp+82ur2qa6uSWKAcRcfoRuBAlH3N7AVhQ4ja5duoEo4BShU0lbfdOdlltX
	 xh+7vElnDdtQyWzZhhzDRmPjmjCMUxSPhUhuhjFNKJroqkZ4nK9I3A+Zv7xvN7ebkZHDR
	 fpp7lb5XnMlhVpPM3gzgcI8ObEMobn8ISxLT+HrD67ai8upfzWJahhgWodIPPEoDmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
	b=hCRPHDejxBtrPhRX7CbvZurhvDd4aNLiLf4Y4W/zZiAyd4H+Rw0zR68k8F95ecPB3koz
	 QTDEtr1O85blEVSZrdB5yPei05r23zikrLOo+td+JpZq8Wtj6Ysbc5ZIakiJJZrHWNgJE
	 MqS093vKoA90IpOr9cvcrlajBuV2Dt7xyT89xMFovWG60bu/x97KE9fk0ogbzC0iIf/d6
	 6eZVUYPoKhQAo+1kwyyTgaX09eRJT5UGnjP8j88zew0k8z4pWAdx1F1XjVVPG8UeQpf4a
	 iqR2FkrwAruFduMDoVLECzbTtuOzE2GV3GD3m0fDiO1/3cmJem4CFLv4dCZbFwHtDWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LpK6y4kK;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CC60A261A
	for <linux-coco@lists.linux.dev>; Fri, 20 Nov 2026 18:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378CC60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LpK6y4kK
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91f0274f88cso17583726d6.0
        for <linux-coco@lists.linux.dev>; Fri, 20 Nov 2026 10:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795199699; x=1795804499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=LpK6y4kKQHtJpPg0vaBR8RoIMnkx2pmladg9Hr8I37G41AdTqnPgVsD49m73sPiHPk
         aZCFfYDZbG+pH8TmftABJLFSg9ce4yjRTvW0AQV84OR0+C6RLA+RsI4B2KP3D1fdS+1Y
         7wNH7/8MeLvgrmykkS8d8CSZfHXTBLqQxa4HSzExgZkBYyOgBXwCjwcYO43xt0mCvXyw
         3lW+AQVV29S90RV3ipkcHbJqKoZrqdx+/N7q/qmZd6o9Ck1P7bO4XVLkWKsZOyVTMPk2
         NfdRoNFJ/DxdxsL2bsP9373F4GdWUH/8H+yUfP1Byl12uP5Q/JHQTLO5BoNFMf4czXpk
         eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199699; x=1795804499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=meUauoc8WuAhCieD8mLCP4I+BGP935juKVNGUQuEggONT3Ud3EYDl3Rt6Yjz/iYifC
         kAsvPxvv0CyNMFZyH9cJQqowKzR8hbccdikPWiKqTVum4mzM+gMvRI+hf0U8b5W3L/pl
         LtT08TFE/nt/jxSmRrrIsqcGf1Ajho4rQEiBRvwBruxQiKOZT0vPUZ1E4yFHiI7fWcpc
         ioFrKDrHk/TokybEE6Zcv+GZ5bc6Mgb5o33LSKfpBm4M018vEAJPB1KZKu/DnN4GiZlK
         JY4r4vF51kY0vQfHZH2NQIW3RRQNJMsixsO4IHJaAxh9E1mTLFKNBxITzOZaV56vg1HN
         3rBQ==
X-Forwarded-Encrypted: i=1; AL+hErE8argb9iVRv27lNKrP5v3zhkucATov8LUH7/rVAOm7Ut0It4jI5wHGXFHWZzwjjb1/QiScEy66Mn53@lists.linux.dev
X-Gm-Message-State: APuU4Z+9hd+09zJ7AGHbUOrhaenXTqZgj+8e1A7hQvg5FIBPOAaCWyj7
	2qPjadhAY/T3vnxZ/5+3fzSuwHTVhgaYDhc47xjXkGSMYxt/nA5s23Aerj2Lf8EYsgM=
X-Gm-Gg: AZFdTZdrEgdA6/OUExmf/QqzzMSatPUL7i0PhoF/tdVT06eFdxo0NeTg+KJCv7aQ5RX
	BD6k7y7KBIYJ4SjrZk5//kG7LdKl4HtaWvBa2fLfOVUR14uCd/egSr+vipAtHG1cB9nQ1x9ja+f
	M5RKo/N20//unFR6XwDtsUIRhg1+efQvsrGKoUK+XkfhWlQJpTWJNyfY5kKHEeM4GRm+Y/x69of
	fsb5ML6+8d0wEYIHQ1rSxWJ5M5CUh5rI1SEwM5z7sy7XdOPgPQkJgFFLcp91CrqCRcE5xkF+x+E
	xyUxj6DNcNLvVyX7nK9GlcNjMxwE5EBVozB9W1zR3RWDImqiPqNFhtS5se7+enPuAkH6uFUDnWZ
	eK44K+QlDReNcHnJiqjEYM4TTo8yfN/Z45aUh8NdKmdGEiF1KMeOMBQlKPEP7f93OLd/xwp/Aid
	iEGzjIAsA8bZ/MDu2iXbvejifPJOzRLZOHfDCWnH+J5HEn0Xue9hJPUO8qnkxFcBnIr6aQMuryc
	JD2Xi5Be6ofE0EDlezRF1/Lyd9C8oVgAkB7Kr36J4je3smiic7/oG0d3vQGN/VPI7X2T4umtM7m
	d0Syzw==
X-Received: by 2002:a05:6214:4881:b0:921:152a:4e48 with SMTP id 6a1803df08f44-92134b1abb5mr65747176d6.32.1795199698766;
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm32821016d6.39.2026.11.20.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTRp-00000004jZ9-0OT6;
	Fri, 20 Nov 2026 14:34:57 -0400
Date: Fri, 20 Nov 2026 14:34:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
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
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 09/13] iommufd/viommu: Select vIOMMU operations before
 allocation
Message-ID: <20261120183457.GQ3115493@ziepe.ca>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-10-aneesh.kumar@kernel.org>
 <20261120094207.00002e89@linux.microsoft.com>
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
In-Reply-To: <20261120094207.00002e89@linux.microsoft.com>

On Fri, Nov 20, 2026 at 09:42:07AM -0800, Jacob Pan wrote:
> > Temporarily disable AMD vIOMMU allocation by returning NULL from
> > amd_iommufd_get_viommu_ops() while the vIOMMU interfaces are being
> > updated.
> > 
> why? if this merged, it would break AMD driver vIOMMU functionality.
> And not temporary as I didn't see enabling in this set.

It is broken already, it is missing some series to finish it. It was a
mistake to leave it on like this.

Jason
