Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847627;
	b=Fnt8vh1Ce+FzJ4kFreACYkN2kt0munjSNLsBegpHrn3NkJ6615S3iPjy8aIxdcO2w/Jd
	 fykSHlBR+GfLabEwNNsIeLhNX5pErVseBznEH4x4EjCHwdhS51ofowKroF8aOsQ7vTFdC
	 cICtpLWZKnDVrloaTaMlxpCEXikpUpVqnA0dyvx3c59rGRrmoqNaCsvIJiar+N0zu9Uw4
	 1XDtYxR2ypcmETwumZZXnmtnRK382YKdHrHZoKhqVx3Vw0cDV29GaXTaJ8ZLiO3nsMIcy
	 brEjmkq3ZnfMCtAEcto9s29NFvPwHtij+wKDQkXCMoaYoM/oWLrJWze10mKpr4PFqoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847627;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=;
	b=0YPt1uYQeKQ+pfJIeitfXmALdz6A5xjnPu0BYUrR72K8a5rwqw49rnQ7ejnEQBWs8DCz
	 kg+wzBhBdURTld/0ZehmY/FRP/tspKFKsOmFJ11g3FtJY/dcOBo9dA/EPWNNklXTr+HsR
	 T7o6f08USd14kaW8nwM0Q2XMyze1TsO/5x4LUb5hZ6/sL0fzxQiSF9dgHeKKypST9/kEc
	 L4vv1WhC1KIX4OQknBdtWZZDqEnLUIixDx6sU7cc8JQCd4bWptpLWtNCdZCMnz9/pyuEJ
	 KbKiLe3QJBChNfMuVRUHp96AHOubdx3R1+2n3Q0obcEwUs/ZeXuvyypXoa6CfcfEtYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NWbACTL5;
	arc=none smtp.remote-ip=91.218.175.252
Received: from mta0.migadu.com (out-252.mta0.migadu.com [91.218.175.252])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9596606A330
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 16:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9596606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NWbACTL5
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794847624; v=1; x=1795452424;
 b=NWbACTL5TjFUpQcCV5hNKmYqRw/SogWUQ2GAgjyCHOV+ll6+j74Nyt2GwVPLZxTIJv96X/Dn
 htA90sl98AnFMvKNM2dvz55WFxZweYpkgRb+vK7jmxpP4lgsrh7ZvKf9T59o5zxjVoJa9Vsxm95
 zNuF9czddpAQ2IxCWDdeTkO4=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e60ddbc754a10f78;
	Mon, 16 Nov 2026 16:47:04 +0000
X-Mizu-Trace-ID: e60ddbc754a10f78
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso9968e87.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 08:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHV/hxUDc2+0g6aj0uP8bLeJs13Bbtillah1sU7X+k1GT6af2CLaNDmYM7qOG9cXBYs6b/zcNpuFPXn@lists.linux.dev
X-Gm-Message-State: APuU4Z8QWfqjO+8xRJpS3CktdJHdpS6gJU3b32CRvZ+t/2bVvDy6uraz
	1/NANIVQrl0vU9oOBwpClHCo/aq7VMypMOxuGPU5/qPnPauXJGGbNkoRD+x0hKBdhOIrwFauNKw
	ccS5kfW+xoSTtRJYIiAvYMnyaPTRNKPRu2pCcp8GD
X-Received: by 2002:a05:6512:2312:b0:5bf:ec8f:c361 with SMTP id
 2adb3069b0e04-5c17e46b73fmr254876e87.14.1794847622967; Mon, 16 Nov 2026
 08:47:02 -0800 (PST)
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
 <avsNdPissIDAb1hA@google.com> <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
 <avsygB0HdGxR6psB@google.com>
In-Reply-To: <avsygB0HdGxR6psB@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:46:26 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
X-Gm-Features: AclHuK_WgZd3Hq9hZ3t4qbB4b45pul1ULpwp4wH19UYyqHf6wDD32zLK2i7M2yE
Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
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

On Mon, 16 Nov 2026 at 16:42, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> While I don't disagree with having the memset in CMOs in the guest, I still
> believe the hypervisor should do it as well.
>
> Linux is not the only virtualised guest and they all should be able to trust the
> hypervisor to do the right thing for them, which it doesn't.

I agree, and I think that that's the consensus [1].

This fix is for the guest part.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260923130031.GE1540250@ziepe.ca/
