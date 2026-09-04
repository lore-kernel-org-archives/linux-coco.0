Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12147426692
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550795; cv=fail; b=NjJ86tRnzq+bsYHsD/eeDcEAxGMZhkYpk+5UnqloDvXuO+y4VQ0rIPINpiqFAHpfRO0PU9YY50ix3YCVo3U5UqgRwuMMtRZ6vBpJM5PMa4yziEKctLXGOhkze8AzVefrsflZlNmH4o1jMmhkYCK2ILZoI8KIHhU2QmvTeIlWis0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550795; c=relaxed/simple;
	bh=H84wgaHuhKsTxKQ6ECSg+s+IeGN3swXqX8r35i2T9uc=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=u/JwN6fJ4k+8Ia7DZVDlfZ0f79QvTx0YrmVbRdpX8sIid61ZCH27o2C//sX0eExMsiLllJFJeXLiORziVtCEe/BQmOYPB5XBL/LYpFXvYXRpF6fbZBCAXP/4awlv7aznOSMveodBzF1NEumbXWoRE3JHCS7mDbYCpk9tnFVihUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S65AytzO; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S65AytzO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnwPqpUYCjc29ePLZuEnCQK61z7ZfUwVoiHCTfkmiR8YqoRzCTNqrGKW6NlQTdIInerYBMKk9J6gtJ1SW+GPqrsoD2fBjLDidPJcpwXtGm0UOcD/uj6o6ZyXAerCuQjwsXtWf5QZAtv99MetL2mvJSQDr8q+0ZGta29oC+VfwPI3zi110P22wglFXldZmw8KoqI+rwDlJPbGzNMiwaaphuKstoUaEDS4aFu/VGU4+KI4c9o5BJJg5HCGeqFdJdYxhiQKWIdg8eRJ08ICYXRkdr4tcxq2f6WTYEqrQtexunMzHprfj6SdkDYSwih4YQtAMXCpd5gNpGMRPUBFXMBMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwwMcZpIIG+OZOtImvJturrth/zmiyWf7ZvJJNbvQQ8=;
 b=CF+xqp10CsguPYnD1o0MnJzHkeDN7wnJHuNa+g1aPD4nEedr/rhXogM/5ruutbzfdo/ZwBs1SlyL3QVeU2+0oMD+vw/Y7NmUpVOsuriZaXmVZRKiRdfe40Amvw7294sTMjB37xiP6aAjkz8QYdwybOv1JwaZ4+A8xDLIDsE3f0eFsgPqCROO9YBmD26WHa6Wakad9CZr7TeCWxF+CVnLg0ol0W6jZHFpgzzVErcrf0iDrlEuZyxlE9rSy3+wLXgXZv5cMtJHbDCkYL7wVtPiqWH9nSxEi4no91fZRQhz0EO7f24zdPizQYvZUXRdaGqkj7YeM5uiUaLL9v9U+r5fGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwwMcZpIIG+OZOtImvJturrth/zmiyWf7ZvJJNbvQQ8=;
 b=S65AytzOQi75RMFujyIr5bNe8DLTRPqy6U4UPyn881cblKrwri6pMeceaiMcvuLKUyjC8G7jAihX05C2yYRhOSnwKzDpjSjS/NODliM3c6K2C4ceDcx9nipFp5PrShuCizkMQLpElr4ONyKEFxq6XpLD8t+EkzyRFFgfrLMBMMRz3UQYUsYi2hgE3+GYtgRrL9mXE++cmBRAVjYrcuyT+yxjScqpr45F2ZroXOB48CRoqzAF0BZ3FoX6yaJ4Ianeh42ZstLgIffSAbxKW1M29G2feu8+OvoyGN1wUbKURXZv12HXwDNiG3Kfhqi58zS4FU2FTG5OkMpwsSYw0UMVFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:41 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 2/7] firmware: hwrng: arm_smccc_trng: Register as
 an SMCCC device
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>, Jason Gunthorpe <jgg@nvidia.com>
In-Reply-To: <20260904095000.1184861-3-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-3-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077569.693280.14246502061719181019.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA4P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 015d784b-d92d-48cd-ca63-08df0abc4228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jBAePrCIE6SLL3HEsWKBSVLWjoNADdEp0DkADhcsz74tZRgoYcKmpDmdDkc1Ps8UEisIAfHulmmooxrGle7OAHCS4umstYoYvqHtsxQ/6Ym6A+BvAbwBlQtLmcPppUBmA02+9HwXpA1yhs1NqlbCRwH/97JSPaD4KrcF5KHU4fMjV68Xn5CsFRb/nB3i148pDcxJGHKeZiHw9Lp19W2VOonJYgb5JhJykmvnKi3QobPXbsxftoYvxoiI1lWvuRk860zDOnMnRP2otn9E7W3StL9s7WjeF0s8V90Glz4Chs6JR/v0yWp2CF5DC+0RSIqIO7vkltVqMToPrmcP5dqKWiNbVLCP+DVAVL2LrA2GJ60AZo3waBJ7Ka+TbRnrJd2pmsLaOqmFWJH3R0r0p3QS/zPy1BBgyhQdIVFx1zzEsFYvrJWFoPqvDsAaSB+jIXtRU22oXmrSCluubLpLYpLiPslpsQaVDYO/touqvO+KaVa0ioQJbVC2q2YyTU7/KM/c/7HW1XCDnpAN43vTnFq/auWC4aF1kf5pOV+ym+X/EF+Ziu6mhN/BcgWgX11UJebJxEXkrS7jx+Bsa0tLygSZvNpMsgqIniYWVGDERpr8VYIGQzIJjQKfuYo83qbezA/y8l9BLtsT991tdXjDsP6CywwcZa2G7op6/EEh47Az/kQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zlk3N283ZUY0NUlaRmJ0bXJWYWNnamhOTmQrcGx5NE5UblljejFYbWlYSkVy?=
 =?utf-8?B?alJNaGZDMGVpQWorZzNwTWxENkVTWEpJNWlSWVBqSElXdkVDS2oxWU9TY1cz?=
 =?utf-8?B?N3pndW94b2Q3Z0dnM0tDTGFGNDlnNGl1SGFVQkhIcDV1Q2hBZlBseFpqRlNU?=
 =?utf-8?B?c2gyM0lEUTJZSzU4ZnJXZlM0TWZOT2gzbmFVVVF4UmwvTW0rcVh5MDgxVUU2?=
 =?utf-8?B?aVpzVmNSYWpvQUQrSVZqZVlEdHdoelYyUGFHSVBlbWo5Mk00aytJN0Vmc2hE?=
 =?utf-8?B?alhCN3ZzQitwaFZ4V1RwaGxkclFuSVAycmNLb2UrTEdiVEF2ZitOOUVabjVq?=
 =?utf-8?B?UnRRWkZ6Uk9WVEp0QWlxWnNsRDRBdEtqbVBuN0RLZWcwSUsrNFhRMGd0NWkw?=
 =?utf-8?B?NFJjdzRrM0d2TE9NRFBVbUkxUlFFWXNuYjlkWGg1OGdrcVo0TmlVVXFPK2tq?=
 =?utf-8?B?OWNnMllzMHgxUk9GbysyZEkxWGdoTWVIRi9sODZIU1VVZlNYNlVVbllYTWNJ?=
 =?utf-8?B?SVBDcWY2ZnN2TUY3dXgwUnpHbEovcGlBTVVXTndiL0ZhcWNhTVNSRkxJWnNn?=
 =?utf-8?B?bmJKUDg1QmxWekFVTUpDamdNZk8wRFFFUWxFWm5DVGVDdXVJWVp5aTFVOHdt?=
 =?utf-8?B?VFdZWjVmOXMzc0c2eWI3a1AxcmFtVW14blhGeDBrbTdzdVRzNGtoZnNHYkEx?=
 =?utf-8?B?ZE9kNEdYaTE3MXBwS0t2YldFSTNPQVJvVUNWQ05YNVR0Z1lKc0ZSMTROYlQw?=
 =?utf-8?B?RWhQSHhrSVF5Qi96RE51SU5lV2p0ZmZxUmtwSlBQaFlPOUVhcWpIazgwQkJy?=
 =?utf-8?B?RXNZSzRXTFNGYlJRQWJxZDdTQWdrMERKTzJMVXpkb24vTTB4c3QyeDFqSU5X?=
 =?utf-8?B?bUtFR21lOUZQWlBmWUJNWWcyYWJiVnFWM3JLSXlFcmkzbUVjVmE1d1dNUVVv?=
 =?utf-8?B?d1Y4dWZkbTU1SXpDMHV3Z04yb2VYR052L2R4OE1WcU9HcmxTZnFxYVBXaTRj?=
 =?utf-8?B?aGF6WHhZbGFoTVVEcS9IQjVGWXUwY0Z0R3h0UmtocHYxTURDU2FJZVdobWkz?=
 =?utf-8?B?TVVwSkFxVzZ3NlVVRnhZWVhVaUxQWGxoWTllYTVRckExd0tZNHpNa0tTdkpE?=
 =?utf-8?B?bDY5V3ZOcithc2RqTWJSMTZNSDRCK0ZEdW4vb1VlQ1R6Vmptd3NEVUduem11?=
 =?utf-8?B?YVVsdENKenBwVGthanM4TlNnYVRvUThUV3NWenNoWE5EY3B0YWJGcUVxdndj?=
 =?utf-8?B?RU44MkQ0TndLeit1MVR1YVNKcHNDM1VtbytCVFJiNUE1Qk9mclFaKzdtZTRG?=
 =?utf-8?B?eUVTRzZ2VXhad1F2K3dIdTFjWEhLU2wvUXV3QUo5a2dwVnJLTHVZTHNxTHNC?=
 =?utf-8?B?Vmo2aThBQkoxUDh6RE1zUU1Jb2RTY3FCQVRhb3I5STdlc3U2Tk5TWmRnN0xv?=
 =?utf-8?B?YnhpOUFjdS9OcFR1eG9PaTRaOTdXSzVTZEF2QmIyVmJ4SGwvc2FoV00xQ1Qw?=
 =?utf-8?B?MzBIb0c4T0xjdHFIQmsySWVaNDkzSEF2UE1kcUxOd0pPR05HU0ZqQVZqclVx?=
 =?utf-8?B?Y3Y1ejIvamdnYWxKVDZMRG9jYUVhN2RIOWIxWVJvQ1FualZ4L2VQSmhCK2Ns?=
 =?utf-8?B?WUJyQm16MG0xVDBockEybTZnZ1FoajhhUXd2UjhhMDIvZSs4ZTJ5RkE3MjN0?=
 =?utf-8?B?YW53RlQ4eGdHYVV1aGJzVGQwOE9maytwdlBjczd0Rld4T21lSE1nTERtTnVH?=
 =?utf-8?B?TXVHaU9HOGxGVy95dUs1YVBtTm9YaTZUbStHYnRpTVl5NWtHb3BobUFId0NR?=
 =?utf-8?B?YXhQWElVV0pSREIzK2JzYklLN0IyOWFJUkxsYXd0ZW14L3NKUWU2WExPdEpU?=
 =?utf-8?B?VmlqTzJXOXNZazJwRURubysvSHBHS25tUnRPN09jdE9ZZk1PZWc0MWMwcUow?=
 =?utf-8?B?R1czK0pYNWZpRjBYUE5ZeGpBeENhRUVJaklGL0wrOFVmdEo3Sks4Q2ViMWZx?=
 =?utf-8?B?bmtYWXJVSFB3WWxDTWNrNVdtUU5rVU10TnJJdXVuZmhuVWYzR2RVWGRpaDVy?=
 =?utf-8?B?Wk9oM25xNW8ya011VlErS1ova2hHV0k0a1VwSEpmSlpJR1ptOXRTUWU0Q3pJ?=
 =?utf-8?B?bW8rNUJzaStISnRHRnBrNm9ldWc5RW1jSngyNVVKa3E5bTVra3ArZGpxY1Fs?=
 =?utf-8?B?b1k2UG9jVEZYOHM1MUlaeWE5L0FXOTgxaENpRkZsa21DWlhsY29BY2JBOVZW?=
 =?utf-8?B?YmczeUI1ZG1KQWNDaHVJL3diaURsNGhiOXpZWWZjSmkvZ0ZybllHSEcyZnIy?=
 =?utf-8?Q?2wWF5QbRx+PFBQiAwy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 015d784b-d92d-48cd-ca63-08df0abc4228
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:39.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+7vbihysD63ls3uTBg3YyeU2gk+Fxz/nwpyeAALtHdsWvypYyBQq90gYHqJIPb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

> The SMCCC TRNG interface is a firmware-provided SMCCC service rather than a
> standalone platform device. Now that the SMCCC core has an SMCCC bus,
> create an arm-smccc-trng device for the discovered TRNG service and convert
> the hwrng driver to an SMCCC driver.
> 
> The SMCCC id table preserves module autoloading for systems where the TRNG
> driver is built as a module.
> 
> The sysfs device path changes from the old smccc_trng platform-device path
> to an arm-smccc device path. No known userspace dependency on the old path
> was found; a Debian Code Search lookup for the existing platform-device
> name/path did not find any users.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> diff --git a/arch/arm/include/asm/archrandom.h b/arch/arm/include/asm/archrandom.h
> index cc4714eb1a7556..ee39a03ddf8abe 100644
> --- a/arch/arm/include/asm/archrandom.h
> +++ b/arch/arm/include/asm/archrandom.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_ARCHRANDOM_H
>  #define _ASM_ARCHRANDOM_H
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	return false;
>  }

It is preexisting so 

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

But I still think this is weird, and now looks weirder with a nice
proper device driver.

Inline this ARM64 version check code in the driver:

> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index 8babfbe31f9541..7605dd81bd1e1f 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -12,7 +12,7 @@
>  
>  extern bool smccc_trng_available;
>  
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>  {
>  	struct arm_smccc_res res;

And adjust the kconfig to not permit the driver on ARM32
builds. Achieves the same outcome without involving arch code.

Though I have no idea why it doesn't work on ARM32.

> [ ... 108 lines skipped ... ]
> +	if (IS_ENABLED(CONFIG_ARM) && ARM_SMCCC_IS_64(smccc_dev->func_id))
> +		return false;

This test passes for TRNG after all.

-- 
Jason
