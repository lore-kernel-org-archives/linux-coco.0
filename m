Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527398;
	b=uqISUmN/rZZ5bYrOh2YvclsmmYHYc/XA2V+wCGtmIDCD6cfIGUjlXuQ0WMjX/FbJXRH/
	 QQMlaK6GV1aWjkJLnTKRvCLx7LypQYpSSFJdcoANmnrL7uQAEJ0lkkdyXOfCXWzYKThiG
	 HmUwdQNNq1CElPKlVM7hrh3dyuFS7UHqMumG6zlTOYBT3O0G+K9aCfhrrXbqJkLOn0UrP
	 /TMcze8Y/zKlJxbz5Hv6b7ry/crDChvrJ8c9peXPAT7bpM74xsY5mBxaPrBybEBfwFX+V
	 UBXSc/Ad7VHHdqSYAyo8ak31C9uAKNy1VYEKoWysuaXAlwqn7ClnlfAr6Zd0195z7bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
	b=SN1Wen1bhee+D2lE/e56nCI/cb+d9qwsjgWqu64w8FCGdpJinMcKc2rtdlfE/REd0b7c
	 ykErDR5MnaSBRKgsy2/SHfGP4H8ouzZDJIUxf20kQLmIIHZRrYRUi2q3byo8UNSJNg1Y/
	 wIENOo9Becca7RyCYDOkGr/lTLD0FCSyOhVBPfUqRr8KDRqqHU8U4e+UyNopeq+l33k+w
	 O4xTutAtChCXFKKVduN399g2WqflKCguoy6ZhsFC9DLOiBoGYGuDRf3ysc2xw6x1lKFcV
	 X1l1F9FxiAM4CFTmzjwOVkTrggpImQnmg7oOpoBfHKQdFe5qrcDvfeeOhwwWhKGfsrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=flQ41bEq;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18034606A326
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 13:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18034606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=flQ41bEq
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92119da3d37so43010056d6.0
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 05:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527397; x=1796132197; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
        b=flQ41bEqZsTIoWP1xMRLarxDeOueftSsd0ZgKn/hEBrJO5/JIw2jMxaCDfhR2+sjTM
         M6RhOSD0yuZJkiCCyXCEPB3gDxXPuLKamoO0PDRxF7D+m6Hn2R46kK5+O+hDA/4GASJk
         28r/EE4hj5sydzYR8/FRs5dxe2LtuhClsixpUjNkK0scJLGbsK1rJ9MrKLiU+BFH9Ufn
         qafKjC1jvQ8YMPV24GD8oLp3gnUy6u5nAKNfi23pGwkRuQhEuR+kuCi7XK698R2LNbCT
         gKLJvp9smq2R/k4vUVR2QZDkOO5nGnIhuo/3vTvvP9okNyGC+7QpLAcccDmhu2p0n1sW
         sv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527397; x=1796132197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=38dbhiLjfuYeyXify2hejI0unP3asaYqsevCVz0W1bQ=;
        b=DBC5llPkt2MbIIpJ4ABExXbxF4iN/zPDCMB8yBiaH4od5L7cGNnbtb8pO+jbID2ZDs
         QHTrGYvcTwBUvi16+G+W48b86BZ7OD7NLR02l49bDA5nzBwHF9W1WD646AgF2YgeRQdw
         2wBb+j449gosoovaqXuOPQRDJ/UhwB1VV8muqaLy5ORA04G/0l7Iz5aEM1yMcwcagHAg
         xxA3Wimeave5CE/7YfKD8CNI4P1hJ5SIshphkQs9qPldXZsLvrAhUrqEQX3IGz+l5X73
         erF5L2E4fStUhGRMIRFscuKoWdh6Ft+Ca1h0bGPvnYDb4blQuPRmXly4FcAjlmleET0M
         93PA==
X-Forwarded-Encrypted: i=1; AL+hErEq4QxZ8SOnCpzAuzmYNU2LFwt0AYSK9aR5UxY0b1IzlDiswVL1PEwwE/5BLiZc8+zm1RiX+XWv/r3o@lists.linux.dev
X-Gm-Message-State: APuU4Z+j05HD5Ai6C3jPVQE2h+WnBjO2pa07o53U4Wgb3G2mnYBXd5o4
	qGkbWs77Wlv71oGqIhB9E4t2NTA0Off7Ey1kimLgfoXf30Iz5JW+MDSl3U8p9DFIyM8=
X-Gm-Gg: AZFdTZeQKwJ9yPhDAo8Y8Yxj2czmyp7XD45wmpVeael8jQsKau7biqPWgls8d/A5AEg
	pHFz2jWWCv8kNNafUvE4G37gPOwDjVR8qyAk36xcX+Lsadx+S6gzc+P5CEqAX3jOx0dlzAnew9C
	Zim8XAMU21VMn92P9jU3a/zzDJcYPiAIl1NDJZJkXU9719reL0lXTIdhxSvcOImmK/9v9723qiH
	c4X8qdCNJKeGMjm+xra6ShoQsmrBPF0QoLL7VBIN1q4QDkvWBMezfQiJRflCIaZaobJHn82O46p
	bcrtoFN/Uau/yi3CW87LNLsIBclRmP0nng0wPAbhsTINDf5MFS4mC04lbMQpqZnGH2DwovUUr9w
	L3gsTxQoKcpoSiXJ8Dm+AhOMTP/IbOOidp3Rh8ovFamYdv/ql/0C3KJkHA5N3gs/ImQyNLPGT/Q
	G8+Dn1Y8nWDcZJUgFh+EUDTndEBCBY+jEOaH0CqSWlZLCbxVeMA1MrCZKpCo32id/HAjPAZtIIi
	tPD1spX618CiwZ3OatEGvTuU3pWhgQaSuZd4RwYa3gu6A+GFDU1HxyzcTmILnnByqvJKjaaCRbB
	ygAfuSw=
X-Received: by 2002:a05:6214:4412:b0:921:435d:9242 with SMTP id 6a1803df08f44-921435d927fmr200448146d6.47.1795527396835;
        Tue, 24 Nov 2026 05:36:36 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm134683816d6.44.2026.11.24.05.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:36:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqhH-00000000PyR-2zMF;
	Tue, 24 Nov 2026 09:36:35 -0400
Date: Tue, 24 Nov 2026 09:36:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jianxiong Gao <jxgao@google.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	Zhichuang Sun <zhichuang@google.com>,
	Piranava Tamilselvan <piranavat@google.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ackerley Tng <ackerleytng@google.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
Message-ID: <20261124133635.GG9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-11-aneesh.kumar@kernel.org>
 <CAMGD6P0pNAnq9U80dnpgbz+hHbX1yH1bdmXjcie4oiq7KizU=A@mail.gmail.com>
 <yq5aeccabo46.fsf@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5aeccabo46.fsf@kernel.org>

On Tue, Nov 24, 2026 at 02:30:25PM +0530, Aneesh Kumar K.V wrote:
> Jianxiong Gao <jxgao@google.com> writes:
> 
> > On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> + /* driver_managed_dma is unsupported. */
> >> + if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> >> + ret = -EOPNOTSUPP;
> >> + goto out;
> >> + }
> >
> > Hi Aneesh,
> > A short clarification question on this check: once a guest TSM driver
> > implements dma_enable, pci_tsm_dma_prepare() will reject binding
> > vfio-pci (and other driver_managed_dma drivers like pci-stub) with
> > -EOPNOTSUPP on both locked and accepted TDIs.
> > Is rejecting driver_managed_dma just a scope limit for this series, or
> > the intended long-term policy?
> >
> 
> Wouldn't that require an IOMMU to be available inside the guest? The
> current implementation uses dma-direct, and I haven't yet looked into
> private memory access through a stage-1 IOMMU.

Touching driver_managed_dma shouldn't be part of this series.

iommu support for shared/private memory is its own thing that should
come with enabling guest vIOMMU.

> > If it's a scope limit, is the expected
> > direction for in-guest vfio-pci to enable private DMA when it claims DMA
> > ownership / attaches an IOMMU domain (via iommufd or vfio_iommu_type1),
> > rather than during pci_dma_configure()?
> > We run a userspace accelerator driver over vfio-pci inside a confidential
> > guest on an accepted TDI (similar in model to DPDK/SPDK), so knowing the
> > planned direction for driver_managed_dma — and whether any upstream work
> > is planned for in-guest vfio-pci support on TDIs — would really help us
> > plan.

Is this with vfio-noiommu?

It should eventually work, but there will be a variety of
complications along the way :\

Jason
