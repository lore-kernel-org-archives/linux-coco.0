Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538349;
	b=0xRVNDBwM7RK3Ng/95jGcLnHnEbwluTMm26YuFeZP4Yq5GXroYkFTfmomJjlSeFsG7yf
	 lRP9MMYeajNDhZ6FsUYJsKPSfkb1Wew9YIV1dLVzdmG+67DgAGWMWJ724YCGcpCVNE/1R
	 o+x2LSzRzbjI3t+YvUtwtZKWzvOn6Vp3qsmCZnITxS2Zi7fwSbqr0s05LSuogYnbexODl
	 8jdsR4TuT26oU/MKbGFFJ1wJtlW+sFYumAVRkpPyjo4S78OwNqu0agie7uKqGNOgB9PPL
	 QxltB0+oIEEqEQOU5N+Blvzr4xkyOl8+x6YaA9+tmt7A5QmAdelPR3psOuhFZnwQx+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
	b=h/qQIgz43GiotD6/U2/Ta/j338JDCBSNUsRQBGCdR6iD9n4qpp+I72+fwmtYJWNIJQ3l
	 hz1lE+VIiNkrKILt0Dig+eI1jf/K338fhNKln2ke6yxVz5+AC3ctmL5zhYnfYKZ3Oqk/T
	 Cw2dmFgg02U8U9DeKcQIS3Jeeo28cktOXhPP9qqg4zZ2Hit4IEo0PaVOpSldoTMm9F8KK
	 QkTpvAwK9e2X0LuanfeSytPYuiYC5S5UzYNs1Q582AiAczCXByAnBqWd9sh9PJ66m8phS
	 +HgevD6ajCL8YKgmS9rBeklhxAGCt0TikFk4B3R7QHSG4mcW09plAg9UMHJfOvC5i3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOC6kV5I;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87D606A327
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 16:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F87D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOC6kV5I
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5864122eec.1
        for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 08:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538348; x=1796143148; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
        b=GOC6kV5IV7AMBzNkBsQxPAQiX98K/v7N5Xhm8FvpVtarN/j9SDxosGxNaiLfyVTh41
         7RrS0msVOH45Mop2fkvE4Q7V94l7EXpSIjUIzc8ybOtO6SVXNeT717XcIWCseoPEfOjA
         I2ebGRtUP0/kSXyBXD9YOcj2LK+mbZFTHFI5dUiTa+EPRjCJnTIzLdekiv1Dak510tOm
         89+jW7T/0tyZHpDjGx3bR8e7SdssTa96Wd8oDKpiKgzFvwjVwv/HC6hzppNnONRp1ZLp
         53Kth6toHULwddbw/zvGxRBNFEEQIFOnuNbBpLgazfbKAma2cco8BkIdYOyESlZk3sJf
         qgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538348; x=1796143148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
        b=KNLS8wfpvdGvrWajK+3x3CtgLkIutRxfqbC9zL/tQpFx5R7DXPR53vxjVXc3lK8Aki
         kDOXVJigEpQa1fTLcn5+9ZDCs+r7SPowUamA0zuy3FXRCEJ6wOZd7/8c6h1dqaUoCX/G
         voAU2lYgI12StBhQ4UrPHXiGNmDSv1SWqOxUsP7wN8VcNZOXhTZ/guDJ4aAYG36zCoei
         WQdvlPwwAkgjKgNAWZo7w8JsRPO30ZxDsbHuXj48uM4o1dxQF+ilH8HdXdJJQieq11qt
         mjBjUwEJ7w0XPdBskS2jznYbKMMoakMXEkUZGhFIY02IW3HTyxIHyEc5S1Gn7ZcRYslD
         V+cQ==
X-Gm-Message-State: APuU4Z+s2NIsJZZDJai7PDTtMc/IoSjGB8wgIuWoQQYAjRzo1InXgGUs
	DNz5YrHaICFxsrmu3Z5mW70xFUIRf+yk1H4hSaRol9lqvBOJ5ngYw/Ak929iD0pCPEGqlRZwlsM
	1Hi5kp/K3lcr+6A+Z8w==
X-Received: from dybkz9.prod.google.com ([2002:a05:7301:1a09:b0:37a:8a0f:3aba])
 (user=zhichuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr5074472eec.34.1795538348114;
 Tue, 24 Nov 2026 08:39:08 -0800 (PST)
Date: Tue, 24 Nov 2026 16:39:07 +0000
In-Reply-To: <20261124161713.263759-1-zhichuang@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-11-aneesh.kumar@kernel.org> <20261124161713.263759-1-zhichuang@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124163907.476312-1-zhichuang@google.com>
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

On Tue, Nov 24, 2026 at 04:17:13PM +0000, Zhichuang Sun wrote:
> A short clarification question on this check.

Apologies for the duplicate. Jianxiong and I drafted this question
together and he already sent it; Aneesh and Jason have replied on his
subthread. Please disregard this one.

Thanks,
Zhichuang
