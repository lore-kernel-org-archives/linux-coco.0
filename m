Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC164B8DE2
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269509; cv=pass; b=DiVVO/Zt8PulLvyu21zNibrGLiphHVplUkpbzZZ3sdHIXqJCJwV9RqD0k9JqlHYgH0WFn/o5rPEjmQwpKz6EEkRCHNcnti7QMrXEGZJa29kOcjxHtexTTk0hy87EhYeVOU9qMF4IP4brbAtMOZKeq/qPuUcGBVotqFuPCJAIC1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269509; c=relaxed/simple;
	bh=1F8/rz3ypcsoCgDUnUPkG7WkBCl4kCGuN1jCJU9T35k=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfdxAd7NdHAKTvimgFU3WASYBPl9JmtYPditECzJ+Clf5JTHclTdfk6jD423iEBElQMqpxc+UTmEJA4xDfHMIrlwCT1vXcYM7wDIflaYcTJXD0+xLanwzkAJFR/zjNKg8NHmrhjUECt9Moh8xqOuS2sCBDRVnWaHmPGGkeiK2VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tBdWuHyL; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tBdWuHyL"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso733766d6.2
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 10:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790269506; cv=none;
        d=google.com; s=arc-20260327;
        b=N+BJMBssOci1ySSIp9hWMbhrGGugLpB3Gc+FnqZ/X7rWINrhKJ5dPjUiToOK5P8M//
         S1Bwpa0rOX+6hd6KJRT7NS/g+gA9R+TDf0jihGdd7Px+M9ftZSLvvV1nu98PjY4Ry+ep
         cDKJFj8TIPJndXSIlcnzTeqAhPyFRcDW8606H5fvBqXu6fi8LG5qArnKqw0NR/0yw34/
         InluTxNE0uYMv5NBwcLwsCJJ1ZZHurYU/3Fghb9CwCY4fDtQ5qac83mM2UVaYBZrj++X
         ko/7ujppcMrR2G7UDCxxh1qaMKFfBgBmOUjnPMNITnl6UVDc4Tc5GdeN/VFqV49eqJ1K
         R2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        fh=2R44XFSh2MdiUMyCgeOOOfiDgMLTRy4sj84zfMjXjpI=;
        b=cSLuNthsSRENxFx6yIU8AitUqlisCINTvIxih7qLjFNb6oCRZXSVTURxlMBDWzDYfc
         65D3DwSZT4jniBuWflpnna3vaYTmSpOkG0IGb3aIqktuCr9wQnIN36HI2kpGjapUOMBA
         i9DSswKGcf1WfoE1v+cNNJoLeq2s3gNvOzIms7oDELM2imSgjlAxylMhrYQISaOYxAnI
         kaIFb00LYAVKXF8E/sZuxlAjh4kLACxJII8M9VT+tVtveDnIb0HxLb/a6PEg3/JEwc4P
         MolwUjySW/O00X5VSSkGs+CCOLZqZnm8CEHniPG2GdzLrs04z7K5kE88jI0ojeFCLbW2
         fDzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790269506; x=1790874306; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=tBdWuHyLJvA8/LxCcBoAWpCa/MF9+TfiyGey5aQL5Cdao3qhhyXUXlHe+d3Dx+hmOa
         3Uh6KMNjyWSCexLztjoisWu8H/W6/eLiht6NjiXOqGtwUkbLN9d/EBY+QQV9724NCckP
         r4GRFnsNMcdk9bVlvgPmd9GtMfAbz0Hb3e6N7TAyLSZxubfgYGl5fxvvuRfKcM5P8NME
         ivrs0vCuGxmIk45YlujdFkGFZCxmqjLh5F22B+5kvL+8L89zXXEroyVAdpbjg5NRB30J
         /sufYlzjm+BU7TCN67wlhW0OwDW36/n15D57u8+pER096ncrHRxSdTyoL+jNFjP2CPyE
         V2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269506; x=1790874306;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHcWMQ1Z3aW3bHAxm3qzvYkMiIOMbOZVWxnCDEHnj30=;
        b=m/86kBg4wWNcHQjUbVba7v1blhzb5HgWHed+4qb6eSh6Iz46oXBt/Tt2C3FVWH5mLK
         i241VayjioRHSeJxSikd09Gi3A23O8cjgaU2hLf7A6MJ5c02cpkqQ+ZTbcA7BLSFKx3A
         CGjdLwD0R5z1+Mfshhj1kUifmiE7iVjoaa1fDaniJdD8vtWFP1AAiVrpTj41CSYWgcjp
         PD83rftieyKnONhM1oOa3TxjyiAOmC8K1/9e1csWgJdob9OX82rldltAJO6M501C1HTW
         bWnas5Hml8GJHoSYjoN17agX+y/cZlKOA8sQBxD/tS5hz8xdwU4BbCG7LlyNisaEfz0W
         zzQg==
X-Forwarded-Encrypted: i=1; AKwUvBzsUXv2lbdBNV3pjf1YV1bv4zYoBS/MGiAPC2EIt+JSp9BQ9C72yNQ77p1BRFQ5CmDeYOqzCOCXCcxg@lists.linux.dev
X-Gm-Message-State: AFuF++nH75ygPDr7h4rOYY3T48F0ICZkdaGI5MggFReLlzDSCzNonKkq
	64xVi4iEcSKJjU/i20RSHm+xvPZaft3Byoj+t+X2geeWk3jVJ8SkjDmDO2UV9iC2sybOZvctkaj
	FWiPtvmlf/fA+HbKf9xhq9GuGt3EgtYnXnBK/RiKG
X-Gm-Gg: AYBFou0KY11GMYwEuLOYwmArAXyJAr+uh+dV0ovQ5IfQdpIcYgndcZVvgxDtL7DUglT
	N9w8Bt8dvDeCxE+XlvU7tX8rfmBasAaVhoQo2hN6VlbcgzHINdM6ayeGzkfHYK3tsyGE8a3WMQE
	hevStJIDSEzZC84SjdxbRLhXSddqoU79a7psotAztX9ZmzMYP25aUdDcxyvm96HibsqCccIDSKw
	WiEwmw6vUWsJzHhWEB/NxKpRY2Si5skskQLPb4CZqd0FADCtkNquz+T1yTUcy3O/zbLvgzYPf/7
	LHCV/Op1ZR9iQon+H40BQwMi1dl6tAVyrfLlApPUCNzZs64eGUan2y0rB6DOYen1Ij3lvRSRDt4
	svHJKhQDsUZPLfJgrLxVZjPSUPNidb3J0Z5IEOxohkg==
X-Received: by 2002:a05:6214:4a83:b0:912:cec:7450 with SMTP id
 6a1803df08f44-91421b1851amr31284116d6.0.1790269505101; Thu, 24 Sep 2026
 10:05:05 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 10:05:04 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260924135201.850038-2-suzuki.poulose@arm.com>
References: <20260924135201.850038-1-suzuki.poulose@arm.com> <20260924135201.850038-2-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 10:05:04 -0700
X-Gm-Features: AclHuK_DlezgNpJkyQ6-N0Dq0ZFyu15Ut5n5SPUx6_YH9nitYJ5xMl_wRWW9wVM
Message-ID: <CAEvNRgH8Hwt6_VaFxJVvytZ4La1R7bUN2emc37_fWecF9j2-YA@mail.gmail.com>
Subject: Re: [PATCH v19 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org, 
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com, 
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, 
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com, 
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

>
> [...snip...]
>
> +
> +/*
> + * Note many of these fields are smaller than u64 but all fields have u64
> + * alignment, so use u64 to ensure correct alignment.
> + */
> +struct rmm_config {
> +	union { /* 0x0 */
> +		struct {
> +			u64 tracking_region_size;
> +			u64 rmi_granule_size;
> +		};
> +		u8 sizer[SZ_4K];
> +	};
> +};
> +
> +static_assert(sizeof(struct rmm_config) == SZ_4K);
> +
> +#define RMI_REALM_PARAM_FLAG_MEC_POLICY_MASK	GENMASK(8, 7)
> +#define RMI_REALM_PARAM_FLAG_LFA_POLICY_MASK	GENMASK(6, 5)
> +#define RMI_REALM_PARAM_FLAG_DA			BIT(3)
> +#define RMI_REALM_PARAM_FLAG_PMU		BIT(2)
> +#define RMI_REALM_PARAM_FLAG_SVE		BIT(1)
> +
> +#define RMI_HASH_SHA_256			0
> +#define RMI_HASH_SHA_512			1
> +#define RMI_HASH_SHA_384			2
> +
> +struct realm_params {
> +	union { /* 0x0 */
> +		struct {
> +			u64 flags0;
> +			u64 s2sz;
> +			u64 sve_vl;
> +			u64 num_bps;
> +			u64 num_wps;
> +			u64 pmu_num_ctrs;
> +			u64 hash_algo;
> +			u64 num_aux_planes;
> +		};
> +		u8 padding0[0x400];

The union + sizer concept is cool. Technically this one isn't a padding,
it's also a sizer? (same for the other structs below.

> +	};
> +	union { /* 0x400 */
> +		struct {
> +			u8 rpv[64];
> +			u64 ats_plane;
> +		};
> +		u8 padding1[0x400];
> +	};
> +	union { /* 0x800 */
> +		struct {
> +			u64 padding2;
> +			u64 rtt_base;
> +			s64 rtt_level_start;
> +			u64 rtt_num_start;
> +			u64 flags1;
> +			u64 max_num_vdevs;
> +		};
> +		u8 padding3[0x700];
> +	};
> +	union { /* 0xf00 */
> +		struct {
> +			u8 padding4[0x80];
> +			u64 aux_rtt_base[3];
> +		};
> +		u8 padding5[0x100];
> +	};
> +};
> +
> +static_assert(sizeof(struct realm_params) == SZ_4K);
> +

Does declaring this struct as packed matter? I guess the static_assert()
has the same effect.

>
> [...snip...]
>
