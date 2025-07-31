Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4F523D2A9
	for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 16:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753980380; cv=none; b=ISIR//GY73oaO/VqrA4CWCk1jtUDuzp+tOr7gL4rs70WOpXGLZaaVXSc6AV8Aj4H0FRj/DnMLDHlO9ljf0mUhEQRNOhYJBqbOHds9V1iscGNCRlreIwPayGVyYgbOxXMMKkfVz1dQ91OcEYS2HVs2/bxzQP5daWQhdiuAxDoHuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753980380; c=relaxed/simple;
	bh=+FrCI5uL2Giy/28rG23V4GontptDjw0pDWs+MPinD0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYkWtNmvtwYEfN/IEtIZ5RCzBUIF2KWYPEICUmjKj66nOcDyg69oycvojCtJ0b4A9Kxut1//XVI7zbxdtq6O1sZ7jq+do9uegVQRX0bwaHZ0uMgd2GKZ8ispyTzQp7MzUeqb4IHr4KxxJ9wa/pdJfUCum+MpM7nsJKldANPBLmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aAlnAWRe; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aAlnAWRe"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ffb85aed35so745087fac.0
        for <linux-coco@lists.linux.dev>; Thu, 31 Jul 2025 09:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753980377; x=1754585177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVWJZKfyKQDHRhqzJs/Kg9r++4Vk+GwOwj6f2ybO59E=;
        b=aAlnAWReUhhPpUHYUXy9mBRgkI4eV98br2CMUnEUqwz9uLIP61ec8A4CgvKBFd7onl
         T4Q/mDbeZzhsB4tplCsbK6QvM+BgqwQHAaK8WMd1mTOMwT/exZlFc/3sdfp6n/JqB7Fu
         Sd0Q0wbI5vbVTbjwsRelvkZn6tMPsK+u/B/J6nh3TyRcMKoWnGq/yw3uOghAH+GlQevr
         AemLfN16/uFcexA744587y+mPQEPeqyUmLuYZN0obpY9q9tQotG9uLyy1c+DX3lZDQsS
         xmy61qOGB9+edTVpQysEXbzupifJ1CLeSrKk9lkPPABz0TPyASKSHlYmB6KVBVJHc0ku
         6WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753980377; x=1754585177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVWJZKfyKQDHRhqzJs/Kg9r++4Vk+GwOwj6f2ybO59E=;
        b=uGwwcVXQoLBw4MMTfErwBvq819hZdE4XCOGZpYHerbsyLoXPJW54ex+A/86bxB3msM
         BYPMZyM2Ya07Sj9aR0izqj7iethohzKjNxi+MWuLAgkmsH0Mq/TrpzOyVGDW4RJGnEHV
         yOmGkH/PUMj9aWcwqWb7cqpUYVxEoZSXtYMp52EcE7OI25dg0TaKGizTRIgGbCR+OMk2
         c0YHX/y+pkHAIBG45MPhM6GP0WPZyOdriEww5/gMHaXfu+ViZhe762dhjC7uZa0EoQqf
         8o7I6TiXG6Iz7fPVlm/6zXFog4vR20lAybpVspwwLSFuiKPvkyfOu+wjoASoKTUKK+pn
         BbqA==
X-Forwarded-Encrypted: i=1; AJvYcCXO5JtA9JBocfzbnAm63nsRiomRx9CJyOdqn5XZU9zyS1xQzFVBumW8Iz8n5htQg6UU8c77/TPI4GUs@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/kfRArR8EJ8cCp85ZNSooPduDvxCntCzJ+nyJnNKZ5/dNZFk
	XMUwrs4t5+DHMwpeITuKFwPEF0PgHlW3UIUf2YwkTrSPMZrebykp3OAO+AzjQBdTuBA0REAgR89
	6gYoO
X-Gm-Gg: ASbGncss3n8NTo3GeYuBYG4U+xCJTUj/1k9Nxksl7hFrHlI0eJSsf7MgLnFv1cn9u2A
	Fby5DEPD57WzyLuhWhfE2YzMZ6I4vwKcydZvJeD5nfl5zZpj8/mQ2T4+oY9WGj7qYbetpx1L8nB
	1tDAJ1TL2kUZsYOb04ewZsf1NBwVCf1r3hq0MRchoLXxiihwNyBUNqq2RN9PR+5W1yvz+Boh/44
	TxkQCWi+7955kkHUSmEtMG7Cgr4rUIZcwW1/jSSOeHh2fMp3T4fJ0ugwKi6jZ8+86WM8WG3JeaB
	O1Ca2AybM+xbaGNNPSaBYhLfzmEErvKgi33/kMDkS7ObKWoHoPsl3u6YmsWajjPkyIR+8ft4veR
	95j/9gsRf749gatDoxzC9WopjYjVosVXPYifGXihArFT7Zj3Tl+aA3OLnFb05X/BaCE0h
X-Google-Smtp-Source: AGHT+IEpTxrw+qyeAY5Lp6kRk/WUmkLbgGvbTXBtHkfN647e6IUlWw+YixxIUWu/5H4+fgQL7IJOaQ==
X-Received: by 2002:a05:620a:430b:b0:7e6:43ae:930e with SMTP id af79cd13be357-7e66f3edca2mr1175700385a.61.1753980364295;
        Thu, 31 Jul 2025 09:46:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f70659asm104688085a.52.2025.07.31.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:46:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uhWPr-00000000qBd-1OwT;
	Thu, 31 Jul 2025 13:46:03 -0300
Date: Thu, 31 Jul 2025 13:46:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, aik@amd.com, lukas@wunner.de,
	Samuel Ortiz <sameo@rivosinc.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, gregkh@linuxfoundation.org
Subject: Re: [RFC PATCH v1 11/38] KVM: arm64: CCA: register host tsm platform
 device
Message-ID: <20250731164603.GX26511@ziepe.ca>
References: <20250728135216.48084-1-aneesh.kumar@kernel.org>
 <20250728135216.48084-12-aneesh.kumar@kernel.org>
 <20250729181045.0000100b@huawei.com>
 <20250729231948.GJ26511@ziepe.ca>
 <yq5aqzxy9ij1.fsf@kernel.org>
 <20250730113827.000032b8@huawei.com>
 <20250731121133.GP26511@ziepe.ca>
 <20250731142250.00005651@huawei.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731142250.00005651@huawei.com>

On Thu, Jul 31, 2025 at 02:22:50PM +0100, Jonathan Cameron wrote:

> If you mean create a class device with no parent, that's also something
> we are slowly trying to fix.  Reminds me that fixing up more perf devices
> is still on my todo list.

IIRC if you create a class device with no parent it gets placed on the
virtual bus...

Do you mean we should not do that?

> Should be a child of something, so maybe that is a good reason for a
> faux_device here if there is nothing else to use.

Don't see such a big difference to have it be the child of a faux
device on the faux bus than to just be directly on the virtual bus?

Jason
