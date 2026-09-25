Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B2367F41
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 05:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315020; cv=none; b=t8JJ4Uy4yVj0rQI44OYC8XZN8zQzUkVXfQeRplPTYXgIiKDmH3eqbVJKGwGiC12q4NNTGFdyRL4EAr4Q2js7KcaVx+3SspzTcKlbyEzEoHEFferXnJQHeJAdCrWEsa3B0rpVBxp6ndhEdJsJmzXNxHisc4qDtlq2qkBcL1bQ/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315020; c=relaxed/simple;
	bh=hbUUz98Wa7UWb5Hmz8kQwpTb+XOMC+doGlgmjJrJxg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGLOyWnxXA5PxCpx+8MS4YYgjvfmJH+MoHRzLb9sc0jWcOXsP+JQPnRK50AffSfIGmRFJRjq9xq+0XYON2T4KaX3Ez0nu2O9rr38ZRIULS87VMu5xoqX2lUtKYXBXDHyeV82RUsBt55jCo5zkl3p8UciQqY3VNLTm8HTTI3kUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KF/ZLSom; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KF/ZLSom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790315017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
	b=KF/ZLSomCtoeiDuIEZRK/BZ1eoYBgOXVEnf3O4esFIu22s9JCSFPegbjLruyoAUpgSISb5
	KdyFauUjdUOAOxbmdVaFM6MJEa8fsvVWDW+lqr6MSPF44FiWMUf4wMKGFuYObWrHYK7YVM
	fRhW1+OPlCWALQGL6hx6vYgF3pMB02w=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-fvUmqjkmMmiL0eTdq2UuUA-1; Fri, 25 Sep 2026 01:43:36 -0400
X-MC-Unique: fvUmqjkmMmiL0eTdq2UuUA-1
X-Mimecast-MFC-AGG-ID: fvUmqjkmMmiL0eTdq2UuUA_1790315015
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d9057fab9eso5036365ad.1
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 22:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315015; x=1790919815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UdrPYhk+H7Ax+M1gheQL2QtOog+I6kAluj+Jz4QTDg=;
        b=BGwdFUNkOOQ0jJJT1CywzTZuhCtJC1Pim7LcIfb0r5k8vfyvo6Tr+BaOL8pSPhxyUx
         ZRphf2ofkiTCDkwkykFfBy4M2xST72ePylpT+8vlKqxEQwzUsWuTB5ZrRYnskT6MGse9
         90+xJMKGGjtB7njnfS5utC8ap3bfGeELa3hw8fK4aTOTL2d0y89LajZm+MaUchX0JjRH
         nqPOZfHgKsCV/Ci30b0u/J8fQ7ZyrHjvxjkJIjGWmEkJXKnDt5qYVf05JMUrmsMRj+8D
         FyPotaS3IIWaamX0CiqKNOq7TNfCOixtEcHusgQJXM3ooCbPgnaXufL+PvCgQQyRmNvy
         nWaw==
X-Forwarded-Encrypted: i=1; AKwUvBxE+mX226F8U/gVr7CtI/4KveebOCRR9ZDCWdMhCfN0hLeo5UovhsIb2uKOvPKez06bUm+40f0XsrY1@lists.linux.dev
X-Gm-Message-State: AFuF++l6pg/MEKM8237CpTkxq+2z+0H/K9BqGyYkuUF49rDmk2g3NXch
	gqCik3T/lbdzo/i16uexI5iCSXKLWgg0kl8C1o3RMGxzHbAXcgksBQ2C2tjVBJZzgssHLt0lUQl
	BuCsfaeIWdm6h+CqrJUoFQTJ+PuoPtcy4ivaGDjbtw2VPXPSjRfUSe6AxyRGgl+I=
X-Gm-Gg: AYBFou0BDuYclX5lUdn0VId65Fnsi/gTTGJOrxUAAshD8TGIGkqY6jV2J3MO2NmjoEk
	INaluBOlfpnkC4GpScYq8JTrPccwS9xTipndNH0+fSVAvbsGNzv4jFvoKV3chANrv9a0dk7WNJB
	b+bC0pym5YVVWIl/yBY0CBH+djbB6wQDQKbfji5HOXr3/hBbZk2LjKgbDHTscvsFV5oVJaOtrT/
	u/RLXxds2kPoa/Q1ZBYJCIK2DwYxArIJxVoh69rpvFAP/eKghLZ7DfErTs7d6U7iIflETUMw+Oi
	PDzhwNVr7JkpdfrT6FFe49N+tcNgGcq+Zz/h+C/YsRQpPLb4xSo4FwGkbXAx8+WcRlr1y0A3nhn
	Mml42dEPCJKMQFbN4vTaY6jmxOXtb1+DBKHH5BHyz2g==
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840495ad.51.1790315014916;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2dd:c100:3137 with SMTP id d9443c01a7336-2df7e2493c9mr41840225ad.51.1790315014491;
        Thu, 24 Sep 2026 22:43:34 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91443823sm4588265ad.57.2026.09.24.22.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 22:43:33 -0700 (PDT)
Message-ID: <295014e8-24d7-494a-8f3e-0e17794d024f@redhat.com>
Date: Fri, 25 Sep 2026 15:43:25 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 2/7] firmware: arm_rmm: Check for RMI support at init
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-3-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-3-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N0gGWfqYvFYnpvDViSCRws6iRS9l6DdYLrxaZYgspRg_1790315015
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Query the RMI version number and check if it is a compatible version.
> The first two feature registers are read and exposed for future code to
> use.
> 
> We only support this for Little Endian kernels, the Big Endian kernel
> support is anyway marked BROKEN and is being removed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> v19:
>   * Read all implemented RmiFeatureRegisters - 5
>   * Use ARRAY_SIZE(rmi_feat_reg_cache) for the loop in rmi_read_features()
>   * Fold rmi_features() into rmi_read_features
>   * Fix comment for rmi_smccc_invoke()
>   * Drop default y
>   * Add retry for RMI_BLOCKED and return to caller
> v18:
>   * Always use arm_smccc_1_2_invoke() for all RMIs making sure the unsused
>     parameters are 0 - Sashiko
>   * Move rmi_features() calls away from the arm-rmi-cmds.h to rmi.c - Gavin
> v17:
>   * Rename ARM_RMM to ARM_RMM_RMI to make it easier to add Guest facing RSI
>     support, which is also in progress
> v16:
>   * Update Kconfig text to include PCIe TDISP.
>   * Export rmi_feat_reg() here rather than in a later commit.
> v15:
>   * The code is moved again, this time into the 'firmware' directory.
> v14:
>   * This moves the basic RMI setup into the 'kernel' directory. This is
>     because RMI will be used for some features outside of KVM so should
>     be available even if KVM isn't compiled in.
> ---
>   arch/arm64/Kconfig                |   1 +
>   arch/arm64/kernel/cpufeature.c    |   1 +
>   drivers/firmware/Kconfig          |   1 +
>   drivers/firmware/Makefile         |   1 +
>   drivers/firmware/arm_rmm/Kconfig  |  25 +++++++
>   drivers/firmware/arm_rmm/Makefile |   2 +
>   drivers/firmware/arm_rmm/rmi.c    | 109 ++++++++++++++++++++++++++++++
>   include/linux/arm-rmi-cmds.h      |  48 +++++++++++++
>   8 files changed, 188 insertions(+)
>   create mode 100644 drivers/firmware/arm_rmm/Kconfig
>   create mode 100644 drivers/firmware/arm_rmm/Makefile
>   create mode 100644 drivers/firmware/arm_rmm/rmi.c
>   create mode 100644 include/linux/arm-rmi-cmds.h
> 

[...]

> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 0000000000000..65171988fdcae
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RMI)	= rmi.o

Unnecessary blank line at the top in Makefile. Besides, why doesn't this come
as below? :)

obj-$(CONFIG_ARM_RMM_RMI)	+= rmi.o

Thanks,
Gavin

