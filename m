Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846800;
	b=qwoY0vkkvAa9Mc0ftfAu/NeRMWPYD/bHcuaxuI9FcHvMKo5vNgdVPuV9SvWa52OPkQT6
	 ww1TAkNjzwTkCRzsj42yK6RUeGgQJSfZOJfJ4FF9uKerjj2Q3kTazq0TBZ8tbTzWCYwcI
	 aVarQ7dl8TgWP1h7WpKEUEb5aOo+l8XBkFOO8ZJ7V4dkLowVSvOeyIgzP5db3pBPQljHI
	 oK91/qmEyjDyXgDzmjKNCnbJ9BueOdflKL1dpTT09UOHzFIo60B7D22JuvZOB6EhxtM2X
	 g/s9FaEw6FFcfv7Q5DE9CD1rvosiTclopI22Yipo7fIvdmNd/UZpqFFYIXxpjNbvd/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846800;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=;
	b=KgGWQSiKbDspZGkCzefjbd/2fwdeYIHI00+Sakb5vERxbgIcbQAMUPqpER7T8Ya9vwzA
	 fa1PebdjrN+cr/8CErhn4KB0IRII09Yp4bWiC2+3Pln1FISP9VQPPCRo8iBeT5rdUv/wN
	 21JliTbW5kXtcL8/G/AuniDGrP4i6o9eCrRAwaGHtRWavxHU8RpOZKFAEVBYmDnJRAcv2
	 tEpBtQJ05/xg+SB6FBhopZneJUujjB2N4mOpo6OGCMh2H63sy9ViDh4KBrpFH3YClvVR6
	 UGwKhn2ggIKls8Ge+jYyeSXdQKg9Xr3zE4pUEr2JhcbE4Ov2LGk3G53HZ+yY9nUIxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="E8cE/N70";
	arc=none smtp.remote-ip=91.218.175.16
Received: from mta0.migadu.com (out-16.mta0.migadu.com [91.218.175.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27150606A332
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 16:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27150606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E8cE/N70
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846798; v=1; x=1795451598;
 b=E8cE/N70XfZUuIHp0p/D81QESCMBsXWNXBB7FdNb4rsbOxt3Gq5vWbPnGyWZWQa7r2U0l8G6
 RtULJc2HFGtTBuBlvAD7QjJSSw1yNZR42cJ7zUCiM76z8F8JG/jlKA0KkvUztCS+AHIzRAhbOwj
 KGrA0tGBMZSO/w7kqQqDrF5c=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id dd7a0e19f0591e00;
	Mon, 16 Nov 2026 16:33:18 +0000
X-Mizu-Trace-ID: dd7a0e19f0591e00
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be58ad9600so11577e87.0
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 08:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErECOoAgm8CUoQdJOEFOmj3Y/RXhJcJ4o8N5XMsI3uBzIatyRz+qpwUYvxZy9FSMAVF66hoonGlnpcI2@lists.linux.dev
X-Gm-Message-State: APuU4Z+eqzVxyKtvH+YWUSss+fST3sjA9gBrkZF/1smTzSpctWP63/gq
	JJUDZX6ChHX2NZW5bLth+Vrksk/HafmyH7T4XXglYsoQQnJ3gtmkVYMLkOgi6P4HubjCYB8c1fE
	bnDbehELjhtRvNE/dfEqW57gahfg3lOL6JqtF2CK3
X-Received: by 2002:a05:6512:1156:b0:5c1:5978:6abf with SMTP id
 2adb3069b0e04-5c17e42fd2fmr254711e87.9.1794846796829; Mon, 16 Nov 2026
 08:33:16 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com> <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
In-Reply-To: <avsNdPissIDAb1hA@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:32:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
X-Gm-Features: AclHuK_oLN7lZHnxxyf05gt8nVYYVHzgK9T59Mb4I86hjWlMfwLiJmejDHvb7kk
Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> we are only changing the software bits, so no CMO. Actually I should have read
> the comment in stage2_map_walker_try_leaf() more carefully.
>
> That said, I wonder if that shouldn't be handled by the hypervisor, just like
> hyp_poison_page() do the cache clean.
>
> That would be slightly slower than letting the guest (who has a mapping already)
> do it, but pKVM is enforcing isolation between host and guest, and it feels like
> it should do it by default no matter the memory transition.

After the discussion on the related thread [1], if we have the zeroing
here, we need the clean here as well. So I think that this patch is
the right fix now.

Cheers,
/fuad


[1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/


>
> --
> Vincent
