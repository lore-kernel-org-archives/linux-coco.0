Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537035;
	b=OiIcNwQaIKDPyTqXzI6nnvckCJclBfILPQtC2Ti+IiQQsa2ia2zHMPYOtvlQfHNEzfIi
	 1uSMkXbUtp3kK/0HLmySjYbXpGfCWdvJMkc1uwfh5kCd+qnzonwcOiKKutRJZN7/iUIi1
	 40NljMGbQpN6L4Ourzw9rqtsSbX6Q8ZmMoYSBMqQ37PkNDVVhO/hlmyT2so314dU7T0mJ
	 JWKw3DIjo9j84rFycsFeb8L7oYfFQiUWRyDgcyfFQoItkZROCNNltKhy6FsHMVnnbJJTz
	 RKppiOmtBgbk3g7H7J+yP7KQg59QQOuOmDPd6Qz0o9+9VjrwMVJX41ePIrdWpMxeQMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
	b=KT+N7vTA2YVOtDQbW9y+CTeIN/7ZQ22HFlGtizPhyRFFWZR8gptEm+4e5KpkOryFS6ap
	 MewuWv0/96iN4dpbQS/0khYECSLDbvYF3d4xR/guvsFH+4+ijxXxq0l8mzOVcKDeucBKQ
	 f7/oFld8f7as4Z6h0IXpXiZPPiybie3yZqWEIzBK+W4+zqprC6BKLqeFpRnksl0TceJlZ
	 1CTTPY0UVFZb0sHb2TPjj1lxTDgwujMSPUfMpEvx1Fa2xLLJd1DfRYSbd/3UTuajUE2Se
	 EKJBs+i37HFleqJDmjVmUq3MrtRfvWBafbpojwMcT/6zy1pSFzOINKBc4v9IUI4F4OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HrJINuN6;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21765606A33E
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 16:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21765606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HrJINuN6
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so5055872c88.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795537034; x=1796141834; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
        b=HrJINuN6C99Qqxt0/ssnmgPaHvJg09ewToe/JeAYuFiYXMUUFMiM0iNboeRMdnPEP9
         wIObUGULOSzHO4bX0Bx1j9FOdUJcYdtyjgmZTHDa9tiCESdT8ysQmJ9mqvuuyHUNPJ/X
         vz/EnHoDBCY+Kkf0omguU94qP9wMHMvsVFXeAmypQ64L7ciYXp9rzi85vY6NBqx5no53
         X5e2wW8elc2v44rsFMriI3C9hA6DQcJzh1mU7z305ocSdRYW/H7QEUl+zvE/HeJrIhU9
         hudu2Z1zc3G3xS1Demb6EL3Sf16qooYTsk3+uJUvK8RxpymaLS2TZVcGEWxqJ50o5tfd
         PtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537034; x=1796141834;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
        b=1QxY3i88/WLmZPkMAJlo9Bf15/zzUMzACCSSLNFbbKuyOxbbHPO45vItwoPISyE4Kn
         ClVtwYyCdOuDjzhdxDGBVkJmRK9uJKkeUbEo6eVryHiqcyd72MNS23b7Cdm8801mF5Y4
         x9v8/DMBF8iMkIOUoa908Bc0H90lpFQ9TRLTvUqraoNYE11TvyUnmAuur8Jqiuvd8m2B
         6Lfu3GjBoqh2x42cjL7KtE3MdckaD5pOAmCxT2J9jq61MfZnS5eFnivWkz9J1elPdQMK
         EhefaMgAXtWO0HFwskJrtMzIzU0DlsowjJlOqzlRmAW15PRFOPP4wensYD17MeRRGeST
         9vMQ==
X-Gm-Message-State: APuU4Z8aWBX+HzSN8lawqy2I7MgMUJ1+EH9qibnwJIW1/TgyMHlNefK6
	Z4L6a3E3gf0gY3KrRFn/HA9dPsNh4ZCF4CQ8qJu/fLUd3MxclAquyiLVzdJGRqRu7e/ivYeHQaA
	1po/ShQNFCYlgfrNMAA==
X-Received: from dldyr25-n2.prod.google.com ([2002:a05:701b:4519:20b0:163:a42e:b837])
 (user=zhichuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2089:10b0:151:2e62:fe8a with SMTP id a92af1059eb24-1b5568feb61mr15349607c88.40.1795537033939;
 Tue, 24 Nov 2026 08:17:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:17:13 +0000
In-Reply-To: <20261123083337.2731019-11-aneesh.kumar@kernel.org>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org> <20261123083337.2731019-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124161713.263759-1-zhichuang@google.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
From: Zhichuang Sun <zhichuang@google.com>
To: aneesh.kumar@kernel.org
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, kvm@vger.kernel.org, 
	driver-core@lists.linux.dev, djbw@kernel.org, jgg@ziepe.ca, leon@kernel.org, 
	yilun.xu@linux.intel.com, aik@amd.com, thomas.lendacky@amd.com, 
	ashish.kalra@amd.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	bhelgaas@google.com, jonathan.cameron@huawei.com, lukas@wunner.de
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> +	/* driver_managed_dma is unsupported. */
> +	if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> +		ret = -EOPNOTSUPP;

Hi Aneesh,

A short clarification question on this check. Because it runs before
the accept check, vfio-pci fails probe on any locked TDI once the
platform TSM implements dma_enable.

Is rejecting driver_managed_dma a scope limit for this series, or the
intended long-term policy? If it's a scope limit, is the expected path
for in-guest vfio to enable private DMA when iommufd attaches the
device to a trusted (TSM-owned) vIOMMU domain, rather than at
pci_dma_configure() time?

We have a user-space accelerator driver that uses vfio-pci on an
accepted TDI, so knowing the direction would help us plan.

Thanks,
Zhichuang
