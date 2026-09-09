Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67A326D4A
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788928166; cv=none; b=QCHzeNQBitbyL6kVKcM/5Geyv5HPu2nCCT3kaEEl1dVsG7HmsldteYw5FRRhnEeHR97Sgo7F1DodUfZ+Cpb32PwtJgnt4irdXkOYtoX4BNmxdAbqU6sgSjLUushi3CKggk0ipqP27WYoDlx0ZQwhiZJ3dB4ETdWQP8EvG50+j2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788928166; c=relaxed/simple;
	bh=WTn05/4QycXhxqRWks5EqAjlR8e86BCzz+vfMc6TDRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odjKCBvWg52/2bR6Zv8JoADfunF3epcrAYgA2+3n3YC2zMrS0b2eCxApeX/5WfMbhuURtfxa2h/aNp1kxbiy42Ic9BUyxN0pclmJtl/FEB7D40F/rQAF1tOUB6OMcytAuC+ApEGBnC8W/DINELFEOpJF9mG4Cxt7JV72Zc/xDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LGUi96nV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LGUi96nV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788928163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
	b=LGUi96nVVP5ewTjOaQk1h7clWnXbVLTE6Wnzm1CS76i3AATFVCPI9brEI3jny+hL4fwGNs
	KMuAnmHtQXEcG4zxcSMKPWSaUYM8VXPq4Cm/LZ45eRK5eD+o2goVDYpon3QlivOoUYiain
	fz/fL1+RztXS+a9SVnLI5LQIyd26Z8g=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-D3rDkhn6MKurJ5amKgKYXA-1; Wed, 09 Sep 2026 00:29:22 -0400
X-MC-Unique: D3rDkhn6MKurJ5amKgKYXA-1
X-Mimecast-MFC-AGG-ID: D3rDkhn6MKurJ5amKgKYXA_1788928161
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so1057065a91.1
        for <linux-coco@lists.linux.dev>; Tue, 08 Sep 2026 21:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788928161; x=1789532961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nh6M4VZCYgC4q2LdczwdgMA5ELYVwccRqILicmGF2f4=;
        b=JWdu00aBAhZi7b0OL9HZGm9kSMByaH1ROj42FamcrPMx9aXPnc1l5liiMV2QRk1svi
         GEJCC01SC/7mIyXy5zdEcDhUAnMn+KsutosecUTiTzDdzVdRcBocpQviRjgMj/EJj+Uo
         yL6VeCwG+0CfBNViEO0v+LhDoLSPq92+ocnKGSikB+VyCeoMMRbHpPrz+aX9+bzrm+D7
         J9NAW06cHc/0a0y8t4qYF36iEMe3G3Wmz8HkyBSbGRjJVFbGoYasBWiYKlf7xgGKDgX0
         j/1KYZ4bEqhUkxsDT/sdJrHLGhb3WA4ibmLy8jgpbjnCrpZptVJ/2wfb05z9p/CQc49e
         L0Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwjD9bD89zm3qMlLZnopXMpHDrPeol6gG/zeWdgsNDTJUie6Y859wTBgX7+BvqkWhTk+oQUNUNB5edg@lists.linux.dev
X-Gm-Message-State: AFuF++muPFraVQwMPsJo+pt8L6etfFOZPQyCJmosROj2gWSwrG1SDotX
	flMoHfGf7XnTxJhIppzdvBvqfomuTYdufeCByr/gRnBEtyLP5J+1vbNecuzVCtRc1GxXMFGwEW9
	VIy4kzglpFics2kBH0cafX6roqObsjllT5tN4VJvN+r1xmlQuPRZVK8Ni2xVs71w=
X-Gm-Gg: AYBFou1hJ/c6+1tbBBkTHWKAo07FHSSBxoPPONRIqqrE85juRRJqayHUTcUpsiUGz7v
	aDgiMI70lt6SteuS2ur+Ip5rGb4rhDbSobNkLxmRmqucJ9UvNzwNLYdHURcwVEgk47iSTU/Hllj
	wA1IGJIenk4ihCCwMVe/qMfDxGt7H5WGIw22ysYhIUYuWWA1IZTGUcnnydkWMfUjALX98jHsL1j
	tPdMc8PMoFsl4HT/zneq8jZSFLkjhde0tNoJr1rujQMacJqt28qitaI+wUR7a2AgLdz2GCznRdJ
	ZAbMSX7P3mGDgLSKJWsPrnE8pXVXinD0XobHqQaaysZZFDFeZd7uZQe5l1mDljvGRH0FmvrU0N7
	ejPTOEldWFNTmYKgNWVVKGvzIZkzcv7fZIaHJsjS7Fg==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737950a91.4.1788928160883;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr54737906a91.4.1788928160430;
        Tue, 08 Sep 2026 21:29:20 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ba0a7b2c3sm5544813a91.0.2026.09.08.21.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 21:29:19 -0700 (PDT)
Message-ID: <aac304fa-a371-4210-8703-74281c9748f8@redhat.com>
Date: Wed, 9 Sep 2026 14:29:08 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260907095942.1140734-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l6ikwy0wzaj8JVJlBXsgKaGkRCjlDHmxFctZBy6kea0_1788928161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Suzuki,

On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 17 +++++++++++++++--
>   include/linux/arm-rmi-cmds.h   | 11 +++++++++++
>   2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 42c973c3a98bb..d969c8738efde 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -641,7 +641,8 @@ static int rmi_configure(void)
>   
>   static int __init arm64_init_rmi(void)
>   {
> -	int ret;
> +	int ret = 0;
> +	struct rmi_sro_state *sro = NULL;

Why we need to initialize those local variables ('ret' and 'sro')? :-)
Also, we can use the scope-based cleanup function supported by cleanup.h
for @sro.

	struct smi_sro_state *sro __free(kfree) = NULL;

With the scope-based cleanup in place, we needn't explict 'kfree(sro)' at
end of this function.

>   
>   	/* Continue without realm support if we can't agree on a version */
>   	ret = rmi_check_version();
> @@ -656,7 +657,19 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> -	return 0;
> +	/* Activate the RMM */
> +	sro = kmalloc_obj(*sro);
> +	if (!sro)
> +		return -ENOMEM;

	if (!sro) {
		pr_err("Unable to alloc SRO object for RMM activation\n");
		return -ENOMEM;
	}

> +
> +	ret = rmi_rmm_activate(sro);
> +	if (ret) {
> +		pr_err("RMM activate failed\n");
> +		ret = ret < 0 ? ret : -ENXIO;
> +	}
> +
> +	kfree(sro);
> +	return ret;
>   }
>   
>   /*
> diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> index fed0f3421895d..dea7c7004d35f 100644
> --- a/include/linux/arm-rmi-cmds.h
> +++ b/include/linux/arm-rmi-cmds.h
> @@ -64,6 +64,17 @@ static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
>   	return res.a0;
>   }
>   
> +/**
> + * rmi_rmm_activate() - Activate the RMM
> + * @sro: Preallocated SRO context to be used
> + *
> + * Return: 0 on success, positive RMI result code or negative Linux error code
> + */
> +static inline long rmi_rmm_activate(struct rmi_sro_state *sro)
> +{
> +	return rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_ACTIVATE);
> +}
> +

rmi_rmm_acvivate() would be used for once by rmi.c::arm64_init_rmi(). Lets
not expose the function by combining the logic to rmi.c::arm64_init_rmi().

>   /**
>    * rmi_features() - Read feature register
>    * @index: Feature register index

Thanks,
Gavin

