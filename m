Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0614B077
	for <linux-coco@lists.linux.dev>; Fri, 12 Apr 2024 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712940736; cv=none; b=GF9U0BjfKgXVN5u9Y/Lz8/xCpc98pHjB+In18szj+1U0UzxRMF4VEWS9sdss3O8airhHVyAGk/+5S7qzfCvHLX6w1qT+v/Xq+mZc7xyrRDcsXfQewlNXjPPVB3X8woAl5J3QPfwewfPhteiYDH/udot1cqMaxBVxTSjWixBLTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712940736; c=relaxed/simple;
	bh=JEVa4ex2ZDcngKNJsXDeM2lwaJ7PKNt/9rGEMEiRKOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XS9CdBnbOOpjR45eQee6eC1g0WzMrFsA4rjES7/QCPe/NapARhRqDROVSdpdzHCPMKk4mClYPhCuLb3uRveXixQdXj5ErsIs1jRB5wSOubV62kWDGHiKq004iqT0K5XkuyrO4WGBNPZRyS1A7rCQSNUIUBP0nv2G2RGXmf0xWSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcL6zmI2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcL6zmI2"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso13345251fa.2
        for <linux-coco@lists.linux.dev>; Fri, 12 Apr 2024 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712940733; x=1713545533; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F129E/qMOIsRNJvcD537N8BPcYpqI13fs6vRxipyLXs=;
        b=fcL6zmI2FlLP48ZuT1RKtR874hfdseaTHYqSd6KoqXMWxdALvgV31CaNLwVsdu+Vsm
         3FN+UueMhQniPDWR8qDeY/vWXPP49jQ3jn+rHaZsnha7leqzXv6sxp1sIFadKRD9IE73
         YfHvl3EEMjQASS+UC4YScQrvwhi5u5nZDuS/66W/cf4+cdu3YevjqY22bpVpHdTfS7RI
         FCjVcqSzVl4RypbQnpDDGjX9T/etuit64A2DNJ1OxSoYWe4I7B3OEVQRjyUTCI8RTW7a
         5dHZdKKE2mHiWWpe8GSpSLi5W2q2d2FxDPeNBrGNwZkuw+PTJCOCf0kkNlwqmc0eAcHG
         RI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712940733; x=1713545533;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F129E/qMOIsRNJvcD537N8BPcYpqI13fs6vRxipyLXs=;
        b=IuUBKDC/0iavNKT/oR6GiPN1GVhTKidebh9yBP4HrGfk4RsjAqCjkve6dnbcvTruW9
         cKUaK5RgI3PZnnCS/jnCZU+LXqvKOt8Sm5qMyFXb/aKMObCsrgW1NyOctKqF6OWLi9BB
         wtWPpXcmvzCIAefdFWSVk1X+EY/4KVM1MJuUxn6EggriIGuWOw6PF3/VSe+mPY8eKIwP
         qsjR4jWrC9vFO+yqsNNc6yZVq198CNTfIpNbQ3alo4ZDUxJvEG26sXxYn4otW91xszPq
         M5WmcBIqhe18FfQw6Bl/q2g6iUl0CeAq3YnIY51ekKNWj9UEY1lsGyXNXeQ+2Bf8kvYU
         nN2A==
X-Forwarded-Encrypted: i=1; AJvYcCWRRp8kJPsluyfoJJvlwUx8Sqo0C9n4QaCPwtEL24iDBKANt/XZc+FAS0i191ugiZsfXGeJeereVO3BomKUdeDIuqGfEh0nXkt4Cg==
X-Gm-Message-State: AOJu0YwnX6mmKb/tYqm9g4R0ZVg1VGalmbCzfT2gC/vsM2TKL6hL4k5/
	2dE/crHi/MKPjJx9jDWjsXw7JlR5Jevdnoaox7E46H1wmiMnzwpiWfZYkrdQKVE=
X-Google-Smtp-Source: AGHT+IFM2/dXuGXELLLfc+flbBb9xsmkA1SIJGRaZWidPMq1PtFsBq8OiGD0hOU+ZU8oOVk804e3sg==
X-Received: by 2002:a05:651c:93:b0:2d8:3e60:b9c9 with SMTP id 19-20020a05651c009300b002d83e60b9c9mr1767624ljq.33.1712940732768;
        Fri, 12 Apr 2024 09:52:12 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id fc18-20020a05600c525200b0041563096e15sm9497631wmb.5.2024.04.12.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 09:52:12 -0700 (PDT)
Date: Fri, 12 Apr 2024 17:52:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Thomas Fossati <thomas.fossati@linaro.org>,
	Kevin Zhao <kevin.zhao@linaro.org>,
	Leonardo Augusto =?utf-8?Q?Guimar=C3=A3es?= Garcia <leonardo.garcia@linaro.org>
Subject: Re: [v2] Support for Arm CCA VMs on Linux
Message-ID: <20240412165224.GA357251@myrica>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412084056.1733704-1-steven.price@arm.com>

On Fri, Apr 12, 2024 at 09:40:56AM +0100, Steven Price wrote:
> We are happy to announce the second version of the Arm Confidential
> Compute Architecture (CCA) support for the Linux stack. The intention is
> to seek early feedback in the following areas:
>  * KVM integration of the Arm CCA;
>  * KVM UABI for managing the Realms, seeking to generalise the
>    operations where possible with other Confidential Compute solutions;
>  * Linux Guest support for Realms.
> 
> See the previous RFC[1] for a more detailed overview of Arm's CCA
> solution, or visible the Arm CCA Landing page[2].
> 
> This series is based on the final RMM v1.0 (EAC5) specification[3].

Instructions for building and running the CCA stack on QEMU, both as
system emulation and VMM, are available here:
https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU

I'll send out the QEMU VMM patches shortly:
https://git.codelinaro.org/linaro/dcap/qemu.git branch cca/v2

Thanks,
Jean

> [1] Previous RFC
>     https://lore.kernel.org/r/20230127112248.136810-1-suzuki.poulose%40arm.com
> [2] Arm CCA Landing page (See Key Resources section for various documentation)
>     https://www.arm.com/architecture/security-features/arm-confidential-compute-architecture
> [3] RMM v1.0-EAC5 specification
>     https://developer.arm.com/documentation/den0137/1-0eac5/
> [4] Shrinkwrap
>     https://git.gitlab.arm.com/tooling/shrinkwrap
> [5] Linux support for Arm CCA RMM v1.0-EAC5
>     https://lore.kernel.org/r/fb259449-026e-4083-a02b-f8a4ebea1f87%40arm.com


> 
