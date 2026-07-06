Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4F43148F
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356208; cv=pass; b=obSzuA4p0uoLpEt+AKwOdvBsp/15BUU38l/+sF7+AVpmJWd/NJ2fqoieeUcZzrq5iYfK82DsgPzqkQzfOPIt45sHHjUW8NI8X33DqHH97HUTdtgmMCNFCOekds5A+8ugAyaUod7faAyu6RbuGEYDC2X6xpsAGzYbpz6ziH3rjdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356208; c=relaxed/simple;
	bh=vrg3e9cxUNDpns9Bl1a5bKc3re+8UaUiVeOIgrtnLTE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcSM0jgwMvSpX3+kKFpL4ZkCNkA1UImatyqVJaf7KkaFubuwYKpl67BH/bkUuVvarR+qhYv8OD31gKkr0aN0OqPAGe6VXx2q3XMPp9Zmj1WKAflIIncd8zWoZAXFsRbNMn6JeN8eKXBG7p3PMfA1u6a/O14kqmmoiPB0hsZURas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YYJwB1SR; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YYJwB1SR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caf228a910so19451605ad.2
        for <linux-coco@lists.linux.dev>; Mon, 06 Jul 2026 09:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356206; cv=none;
        d=google.com; s=arc-20260327;
        b=ihTL9HkdfXkyAOJJ2NkjvJwAXiUWmzGiqKhxiZkab7bb4ubJmFXSdS7mbCmVyPq3cq
         K+lLxP1xA2m+flwQF9uZySYReYLO/zS2SQJTSfX4GuNlOy4ZSTyy/oZn2dhsKPfXtxxH
         D7DusuZVA1/5wwFpdGGA73SJ2A93Ok2SsM4P0uXUILljz8q3Ey+AQOo71v5Vi2g9Ij4z
         gOUM3/uVn0jKbR2GuWfTCjqRlISzJYFOeuHzQbqFVIlxPFpSFw2G7hRpnlhlr49BpdbV
         icjHu/5ZvKRBcF47MjVMx+9KjapQCVYG+y10oSBIF89UorxmBBN5f2GrcK2LVY5Z9Oqw
         KxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        fh=Z0kunvQwUETUZKaOAju47ultmYgSRHKmtbopafErfHU=;
        b=hlDN9EW8M++3+uLRXgq8xZuUB1QEsHych36V2tr3WqHdQBjGrzocnBAFSMUoB5a40L
         blqgh9eRS4bUpKUL39Jit8nxsbDXAbLU/FKon0+M3WmF9/mAAcas+FkTUI/+4DCvnjDx
         g7pi3hoZt/BhuF4Yq6d+bNFxTDghktXpk1JMKX7NaNohu0a6y1PBQb5iKQzM2B/cNmnA
         1nSyddw00qnCg3cQOivnkn/mVxVdXcNUR70/uXWFgWW1XVSKe2n78XWUO3ipMxYOROWP
         oWlp8UTB3syG3hQUvMJ6Fu0sSViFmQYkSS1un8KxmNyAUUacXcz/q58X71vsPTz44ql4
         JpIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783356206; x=1783961006; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        b=YYJwB1SRhGi7b8meXVM4z9FUNGP2VNc2rDyG2fWtFzQW4KDx3k5N5PQK1FEOXvzlqf
         hJa8VCTiGjD8tyKwwKUncPdmigeRERfwzTpFkJwYlqI673hAILSURUJfR9nN65aqaOVl
         iSdALQ/trcl9GHOAa/t5/Jer6ptgKgKQWPTx5IrEZ6DPgVlgicRTSnTn65+2ETbhQIue
         S1ucfegAcpAoyeeErjufvSY9ZpttiPgRJYxym8+3vwAkKW9oxd+ebie7Kd/se8ScM3Jk
         iW8JI1i5vByxEoD0G/txxSoxPGhxbhCjYh4/OHgbbD2VKT5bH7DWAQRICaHHnmMkq6/h
         tQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356206; x=1783961006;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        b=dtwe+6utHY+d6v7UjJBdQNbf5bVDQ8AVMHmj5nwCRsOy1o7BPDNtxyGDCdB7qi8XAu
         s40Zl+gsrExl4pXULFxSQx8FlXrNY04TNn9qQQtCki5oGFeZ26UdllcYbgt7KQwt8l6Y
         d676Bm39dGtR6ihPZD5oOKG+hdLASwK3dSJPV5fwLrsP0hN7QxuzJDH+OgMTfWfWcvBA
         tlkQRm2ECnko+SCUfY5khobl/lVZEOS7qy1HnbDw2AB0kTwwX8Yh7TGBZC8XtvHA2fAc
         PRZ1o8pVj3LNfBM7smYFI5SUNYPIjqp1/kSOHYkOJnd8Oms9yqH/rB/M94Prsk4FbgMP
         ZGfg==
X-Forwarded-Encrypted: i=1; AHgh+RpH8HnZE1AlrXxlpNIYHBiu52lgzhOcaZ2Q5iaN800cd7uMYUw1OhnfPxEsGeVj12psNgR/8zL4oC14@lists.linux.dev
X-Gm-Message-State: AOJu0YzMGAao8MOZumk6Z590BYIme/PuuZ4mjRZj0233IuTZCAbxlf4o
	0QfoGrWDdMZKrNYasKuaDa2bsAaMnl01aw4P9JhyTNjpfvomTPPn0FbxTjRcUWDVgtpCfxpiilX
	lYVjOxX98QtCCzRxhMMFF1cQJbzefSfk7Tll3JxUO
X-Gm-Gg: AfdE7cnfPrVX3idoKFxyvTDcg1GuGU5abM5W2EZo218hH5gMr4n2CkUJKyNU5HJxoe7
	HtL6Mre75NmB80SuagSxyE4K1te+x3y2ZGFLPwPCnDrFQvLuVEXppLWP4+NUUUNrYwWlO+YZfeK
	nlttcMXe/XQSTLrQPMPxsx6ntQrrzCUcK0+eiis5UeX4K0uBRFQvpRNc2O2zsB7QzVqlt1pB1Qg
	gnJ/6AvgR2Mwv3DVF45oJAE+2DXT0UaYmjbk8W5za2pgVjtaNwUINp4cEpZb0Unfw6d6947Q2EY
	ZikoU8op+6gPZa3UfikhMJYTp8zo73nHWxUbrccYngK4poaK84/5DKV5H3o=
X-Received: by 2002:a17:902:e5c8:b0:2c6:90ec:f601 with SMTP id
 d9443c01a7336-2ccbe50a8f8mr13298475ad.8.1783356205420; Mon, 06 Jul 2026
 09:43:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 09:43:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 09:43:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260513131757.116630-27-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com> <20260513131757.116630-27-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 09:43:24 -0700
X-Gm-Features: AVVi8Cc7UELd1-7ZAYEyOZ88G8y7OqpaGYaDp3NNsXOnmH1AvIzaHGeBstkVLUA
Message-ID: <CAEvNRgHTu5ZDAamO_sXkqP3V=_5MhFjdzTYmJn4i=a9ni=9tfw@mail.gmail.com>
Subject: Re: [PATCH v14 26/44] arm64: RMI: Allow populating initial contents
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
Content-Type: text/plain; charset="UTF-8"

Steven Price <steven.price@arm.com> writes:

>
> [...snip...]
>
> +
> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> +			      struct page *src_page, void *opaque)
> +{
> +	unsigned long data_flags = *(unsigned long *)opaque;
> +	phys_addr_t ipa = gfn_to_gpa(gfn);
> +
> +	if (!src_page)
> +		return -EOPNOTSUPP;

Came here from [0]!

Sean recently moved this check to before kvm_gmem_populate() was called
and returned -EINVAL [1]. I think the rationale would also apply for
CCA.

[0] https://lore.kernel.org/all/114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com/
[1] https://lore.kernel.org/all/20260630213711.479692-3-seanjc@google.com/

> +
> +	return realm_data_map_init(kvm, ipa, pfn, page_to_pfn(src_page),
> +				   data_flags);
> +}
> +
>
> [...snip...]
>
