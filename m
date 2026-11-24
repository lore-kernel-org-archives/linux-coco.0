Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795485888;
	b=fvNGmCt316RIqDNz2QryxO90V7plt/8uzlNta4ymlXHk1qtLsiTxWQL0A5rpJKR+Rgi2
	 lesPMikLKbyUg3Hf6h7ds0b6OQcEwywEiP+5DvmuKs6KI6+VS19bXfeW64MWz17+w4XqO
	 qjmAxKhzccgRhPk2q8S3X9rgIHlAvfmsnaZCLaWEbkuYRPlvzwcvIT+7neNDvO5hSaKOd
	 p2I064Qqe2fApsHkde77D1OmFA59m1h1gxx5SWQJVAjdoiSIMvkZznlZstAb3x6iY581U
	 eV7cv2MMC41388JPepmDJU8tfGt+uNx7CmeEDcfmQgPy6g8OjJswHuV12jEusdVEyQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
	b=VftFCde5gELcvNTF3jelhKV6VZN/OjCuBK9MbKkImcl8fnK3oZFQiGpc4SSDQHQCpemi
	 X4KMsAcDEqT3iOrSQGFjg0U/Mygtjas2oYojKE+Qc8mXdqmzC7EV5baZ7a7QpoBp0rhNY
	 yeV4k08EIImf1lSWeh6C06C/hoASSnz4qS02shvG5+LjTQMyWz7RJtL5VEY6YAkfk7n+u
	 gtP4ngaGWlAR/vqkqZoqyBC5f6eBgcLFZyCQsrL7MW4AAW7MT8UatWQmy6FDrHUhZTtSz
	 Ff72pH2gEsTYPNSbhR9NM9VvEcRCgZKxmQ6BeOvUC/WKrbrH0gvWwU6v0StfXYPqmGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Au1HBdhe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14155606A327
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 02:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14155606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Au1HBdhe
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso14143e87.1
        for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 18:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795485886; cv=none;
        d=google.com; s=arc-20260327;
        b=KXjMYU28WriQ9mi2iKWS95JAcKs8cKSEtoU7kCpwJgi3C3nrwHAk++20fANdCZZsgf
         YRIP0lyo4RevTi1Az4um+e7p8XMxo3h7udQswT+57HapXnQyZcIQMse6kkob0Qcaa+7m
         w0HeKadJ7j94z/Wv7MWC33jc1qeaFNJ3mwZCk7sLNFwGnabUfpnMN2YCGpeH2Yp7E/kM
         4XYIlNmQ3EmO+/EB1PKKQANvtmEtwKiXcc6znWUL7oKXA+gTTgAN5sHnW1zE2ojxwXeM
         HJyaO2FMbSi682Tps+B6DX6t5a0AgZaZA3Cv5+fcN2zmElMg/i+ZS1YHMx3nL/xv7zK4
         6F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        fh=djqMA1bkNQADMrpIAejaGd5K+ETF62oagk9ySwyfWVg=;
        b=RFeDiByWICCMJ8QXQNhpTBeIPnSV1lCQIitLkBAiJoLfB1RkuHqSfqDv6IvhkBual7
         2t04PxaclwWv4kPB14WfHL4Z9bz6regquAhdKo6Uah/clPTdEuAYp9yLOl7b1AoINpzI
         TWoD+fr8Bf/Z6REyNPBKc/RVkbCAk3FtDOAw7uWnjcs/P0UTed3yRywCDY3ZUFkxaHqW
         Ov3/uyFEadNdCrsBT8pgx5qvgja98BYt1LrsnoCA2097QvAzuxuWIIbgb9Isj6zdvABC
         5H0dT61G9D6K8yTtdTrgv7jnTXEu/LM7mh9DwEijYWXSRrHglxBVAlFwHJiZ5ruOyaGP
         vvIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795485886; x=1796090686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        b=Au1HBdheIzpAbd2JoZkJkQuYbnbYLjNGax+9Hgqt/+wgW+dQkphN03XyI7+UWrLxw5
         izZydNoKXNvErjrsKMm2ue+FEhfe50HtcfX6uJGyctgWhIG8mZ11UuqS7K54uMoj7+9M
         eKapPGz7xh/ofqlTmLTn5qyO7ylq6eZ+jI+9AeTed6iskeCWbWx8tRDs8GpOv3/i0LMy
         xJoVMQfgJIDlbfl9cynDPzxBpDF+theiAdtA8DmYSpNLp19XPjBmDBrqkieFxaKbgGIy
         X0JzD9V+vycsTLSKbic559tNb6t/Ay0vyk0+UhUiw/xYLbSDQ+oX7+6ICznujlH2Y44D
         dUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485886; x=1796090686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        b=nqcwg7jqO8iQUWa5UAP6OQLj/5O/nJC5riclIyc9NY6leV8Sm4bFcw+S6gN88gxfM3
         4ue4iOXXHR2FJhygKSAjqDy9hggjUpUVhaUmRZ8rf4ribrkXodQwDaqeEPHVJPFG50ID
         MO/0aOazNPsqmMz/XtDJgrphzKWENuIlXo11s5iJDpRFYlFDYVwedcZTPvBF2FBHBoZU
         7JyyJf7nJEDM1FdBuFbOy6ig+WHocxizsZZWOsF/eYnrL4dwJs8ArMZGGYgTaFcXGNoe
         OGUTk27n+kH3gVyp2wccT4naH8l9Yx8mjuV2XFmlr3oPULxqeBStIT2EHAsj4lxW1o4W
         SZoA==
X-Gm-Message-State: APuU4Z/yyMWP1Xku0EpEnRI9L+Ixzp0yenN5E2DMOBze2tUecMPQQl79
	swfSkWkALsh/uGa4VWfhAJ2dt1fqZeiLGlzWDCuIsPXH4CtZYgKrJGKOZjQELyTzRrxil7RNvtD
	9wkIVa+KYPFs2b3pGKjryoXg3649jW/XZuCnVxgDl
X-Gm-Gg: AZFdTZeytGgxVRIvau/fyQsSsqOwBZrALDBShT66BeejVwowbfd1oqaF8N8CPlMvbdD
	1AbFwyQmEc3IMbt8j8X33BWSpPiw7Hock1yM91rLIWDHKWOwovCor9Ay9emc9guhwNC6ESddA33
	D/VRh06BSzfgLj5di6HLPKRFExPjUGuxM56P3ih9sAYL8g34o72lZAW1T/Qtccy61rgc9MMyVL0
	eFQIMemIFSyYhDNTebtMQnSgpvOioshpFf1WwW6zcmPRL1OtBRYXwQqzfwDXwVLpZk61ND2ALDZ
	RidxC99EAUqNM9IK890TH3lybZoUnw2XECyvtqIHRr4nv+8KLPsR0nYAZ9vFxVH7T3CxuGaYNaB
	mR8wIHto1wywaSv3LbHpmBTp4NppCs3/4KsH9VD4l6m8C1TFjKOwTlXXzRALl13umabS2ixeyCK
	cR//6KTmUrI9eba7HsAalJS/0lVqeAM7UOIsgZpluiea0oMC764HA=
X-Received: by 2002:a05:6512:b9e:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c1c8239441mr351300e87.4.1795485885773; Mon, 23 Nov 2026
 18:04:45 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org> <20261123083337.2731019-11-aneesh.kumar@kernel.org>
In-Reply-To: <20261123083337.2731019-11-aneesh.kumar@kernel.org>
From: Jianxiong Gao <jxgao@google.com>
Date: Mon, 23 Nov 2026 18:04:19 -0800
X-Gm-Features: Aa3M54qI-S6sAhD3oo3lD3dF7U9WjxfGl_G2FEa2MNAlB4C8vKhlPO9m5SK63WY
Message-ID: <CAMGD6P0pNAnq9U80dnpgbz+hHbX1yH1bdmXjcie4oiq7KizU=A@mail.gmail.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Lukas Wunner <lukas@wunner.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev, 
	Zhichuang Sun <zhichuang@google.com>, Piranava Tamilselvan <piranavat@google.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> + /* driver_managed_dma is unsupported. */
> + if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> + ret =3D -EOPNOTSUPP;
> + goto out;
> + }

Hi Aneesh,
A short clarification question on this check: once a guest TSM driver
implements dma_enable, pci_tsm_dma_prepare() will reject binding
vfio-pci (and other driver_managed_dma drivers like pci-stub) with
-EOPNOTSUPP on both locked and accepted TDIs.
Is rejecting driver_managed_dma just a scope limit for this series, or
the intended long-term policy? If it's a scope limit, is the expected
direction for in-guest vfio-pci to enable private DMA when it claims DMA
ownership / attaches an IOMMU domain (via iommufd or vfio_iommu_type1),
rather than during pci_dma_configure()?
We run a userspace accelerator driver over vfio-pci inside a confidential
guest on an accepted TDI (similar in model to DPDK/SPDK), so knowing the
planned direction for driver_managed_dma =E2=80=94 and whether any upstream=
 work
is planned for in-guest vfio-pci support on TDIs =E2=80=94 would really hel=
p us
plan.

Thanks,
Jianxiong Gao and Zhichuang Sun
