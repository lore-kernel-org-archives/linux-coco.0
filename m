Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48DC52120D
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550822; cv=fail; b=URDBodr/2doTCFVHT3pVZ/XlNJ4Q9O2Ep642wi17l1B1F1aRJMYKbmxvKasASLl6oxqXf9J6CLP7sxo0KPUhHx4zIy2AEPr3q3x1J93kYVrvyaGCeIkLdbm/PjCVg9IpNLhRUeibDl3/LIHXSPIDB6sy4K6FHNGsmRtEN9acYRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550822; c=relaxed/simple;
	bh=UYRCKnvCnNyzX19Bygg6zWu49ECi8mC6iLZ2Efs9+Mw=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=rklmlOr3NYHh2uQeMIfWCYacmyhu4wFe6Ykubj5IxpSRlpHfqkC52MUdHYyGGFqLrHQHC36TuLRTh5nhw90DcunSAweiZBDaWIBin+f5/ISJOo9pFqwVAoon1xxYWg1gclM4XkSgeTyiiASp69w3uZj2BNEc9Rv8GYpbUnoYqMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z59rBURg; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z59rBURg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/SbdX4XwXzr3RmxI31YgybYVdA5711LIInjX/InMz5Iag3hmrxysBFx1Xu9HAmbG8OWnjXrtEy+4GNauxajiBmeSpo6cmSoe4wim0boflrkcJxMrKO+Flsu+UJ3N3EWPtHAuhJWd87q9c+Nec2VBcHiSngwjxXn/lDx6lLx5SWFXazUXCtn6NZE+yqn1HVy8sZoIGWGV4I2IbLdfP/HKQGwgcywsNo1oBhMW8hpt9ynPmSuPTCeBuVhYvbjf7FkjLXWdaSPV4J6GCH9g8gndBV9X+Jji94+7wEj8fCjHyRkVDSr9Tix0fQK2I/qMCwGnw+U+MXDKZx2hJ0/hXN9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ComXTcsa5E2GUzc5oCUBC/eNWVNVf97mYf2dQdh3BrU=;
 b=uW9rWTAYzJ8sr+ZhVHgilZzYR/bWnqu8JNS2Ikh5mpZtoVR3m6rzPNq9LSQy+bJmY0g5ZsLIua6b9YacWF9VZrKsXc9jNFdeGbyTu8VQhQR+OcYIAxotqjfECf29NwfSeJN1cS1sKhjFI3H+0Gw0LBVFRR5fXi1VXhYeTVlKbiaokJwvq7Zq5IJ6swSWRSJ6QKVI0pYtPIU2vwMJ+zVJs6R7nLg/N4cTs7vdSZ2w0UBH46Ut9uT6m56SdFauj735cXBMSP/ga3OWYTZE/f5vUfTiLJUTqykQv7E1IjJJLAG/AJgoWMAtcGzwXw1eowbEilMFHV3IgQy5RkzFNptqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ComXTcsa5E2GUzc5oCUBC/eNWVNVf97mYf2dQdh3BrU=;
 b=Z59rBURgSp5uq+FqynoMIEWUCG/sbZAVmQDuZhvzxTiT+wUZZyGsWygfSjX7bYVElGcWyR7+MPK+EzCqFyrPVJpHXaJSET8b0kDKTPYRRDL4zIE4tWoUbt5XKrzMhDGRYtlYShKcvjec2ravE7eHFTOGqSgwPTuFg1m+tNOMSaJrID4h41kmjR53f+2n71dVVZKayW8NwzB87BIt+1xziy8mpx9B3Yo/qjLLpclD9tjfoPN+8NEMhWHQ/tqBlfhgcUyfAJ9M56xlyFxi+owXEjQqHvCgS4YQxoxA868tuAQwk1W4p4dF8ohj+0BIs4aB2gHK9AQBTIrzb7tVgHwc7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:42 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 3/7] firmware: arm_rmm: Move RSI support out of
 arch/arm64
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
In-Reply-To: <20260904095000.1184861-4-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-4-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077569.693280.14679447280144972041.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3563c7f6-a0dc-49ed-9893-08df0abc4226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8+E32iazNo3hm61jPUjP6Z8g21bejL6YKjlgaJk2DEyq9OaRXcaV++uo/jCvdbgXqtEWR9eurt7pTZGIGMAG/fHwINKRQdAKhnDwKjTr/hB1hdKqpze4hAE/M53SL6514Em6rL2ij95XoGM4ljm0/T69JxSuyM3h6z3GpFFiXS1cUUTNKbmwMN2kBo4eWm+RjxS0sWgK4/Fa8zGN/CNEK2GE6WuBstdi9cqvtlX0zmjFqQFN3zTdZ5xU2yorU20D3nizpf1ILEDjrBaRI5ujaXltHYl5ufXRx3ii3iJRD9iOJ6THSa0r5kV8nQ6iJBuwrQaH0qZRM8Cf1FV8/yCv/GDXUNBWcuX+4llTAVoAuAyTqwqmjGZxE2XZ8R13jNgEQsJ4jbPlU3ODgLbTSkOGee/ZrkXRc0tnxVgWerHwnNrbvdrdgtlwgwkULwE002K9Gqlxnbq+vFnUEVj+mhRlDe1L01yRcZVeEAm3/8lnKX+3UQSbvrtNwgRGtioL3icki3TSlZFcmGFepsrjTLjEOfAEyyJRrHclCyxIBIMOWhI5anzVt1HjugbHCry/8c/nzr8wA5v6Q5CvsAy3KVp1bOYHjh+xFMPawFdMB9Dv4BIvSLpdWNO1CbCmpRbYpkkoBWLw5XZn74lEEgUjhv6KDib4NOTPv2K0cUJybOXj64g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzluK3JXWFVuMVhwYmVoaWdFYjN2eEdBZit0Q0hjdmZiYVBPVWl5OEE0VUdi?=
 =?utf-8?B?MW5aT1FjMjBwVVBVZEk2MFVOMjFvV3d5akRyb1FqdUxtRVhqeVgwM0tpWWlO?=
 =?utf-8?B?d1NMQUtGUkxJdWZFSThWblhxdWd2VnJXaVZ0VVNLOE8xN05Tb1lrSmFYN3ZV?=
 =?utf-8?B?YStvWjd0M2VGTUpDTnVVbmZnTkZNemorNUFFbDkyOStvV2JFR0pwOXFRd2pU?=
 =?utf-8?B?N0tFTWJzdXd1YVNYd0FQN1NYMXJjYWxuQWt2Sm9FczM3akNKa3pmek1md2s5?=
 =?utf-8?B?ZDNSdUhjUThqYTBEbEM1V3g5YkhhUmM3aHNJTEhSZGFVTCtsdDNMV2JSYnN5?=
 =?utf-8?B?b1ZHcUlaVllEeW96aTFCVTgyWkFKNjFpZ1J5UXlJVktZbUVsOFhlek5zM1Nt?=
 =?utf-8?B?NlhvbTJVVVNwZjZZS0tpRUF6OEZEckZMczkyekRFNWFlcmY0cXBaU2VaUVc0?=
 =?utf-8?B?TTQxZUVZYVpmeTQ2dkZ0UDMrVFY1RDBZamZVaGtJd2x2TzhTK09EdU5TZTl1?=
 =?utf-8?B?VTc2N2RrckZpUmE4SlBmMkxUQ25UZkNPc2psU2R0emFDeHczSEVMcitwZHJM?=
 =?utf-8?B?S0RSTUxtSGdOSm4yc3NNNXNFMzZNd1M0d1pDRlcybGUzWmZRQWhxeEoycFhr?=
 =?utf-8?B?alRURmt2ZzIrcGlKMkVxRUY0ekxEYjg4Y1pIZzdYdlF1Vkd6TkRBL0wvZ3lN?=
 =?utf-8?B?Z2c1ckdRTDQ4YjA5aTg0ajNUSWZmdjJpVngrZ0w5L1N2ZVUvT2pid05FSnRk?=
 =?utf-8?B?Qi9rb2N4YzRXU3hoV3k2RUlwbWQ4V1ZSWnc4c0FESXp1enZpZ1NDR0tCWURD?=
 =?utf-8?B?NjV5MWlvUnhBM0lnNlg5eUR3c3Vic29MWDM5RllHNlV0RytWTW0reEN4RitV?=
 =?utf-8?B?QlpGT1dpZkNNaEVlc04zSi95bTJLSFYyc1R0RkViYkY4a0FmZEN5L01QbHVI?=
 =?utf-8?B?MG1PV1VJOS9xQnJiek41Wlh1RnA3MEV4b2pBTUZiaVZKVXd1bisxc1NjUHBN?=
 =?utf-8?B?ZTczRGo5Y2JKeFA4UUk0Ri9HQkgycytlSEdQL0VacitKSi9mbytqdTlhTExK?=
 =?utf-8?B?N1h6dUFLUFRaTSt3N0lqS1dNbUhhWndVUGN0alQrRktNNDZEQzhZelV2dlI3?=
 =?utf-8?B?dWF2VmNDQzU1ZGFPOHlmcEVmSnRCQUdBT0RRd2Y5M1dsMmRYS2I2RVNncW0y?=
 =?utf-8?B?Y2c3Ny92WmM5Z1dXdHNza0UyazNxa2dBTUl0UW1qQXg0eEZzRTJBTlltRFdZ?=
 =?utf-8?B?Z3kxN215RVArR1p4NFp5azRUakZNM2Rma1BPazhGbUd3RTcveXIzZnAvRFRU?=
 =?utf-8?B?MStQWmg2cDllemszTGZ5dENoeHpIWE42RHBneE5aOUZRMXZ5eEFqRUdNV3hv?=
 =?utf-8?B?OW42eCtvczdLWHk0QWVwVVdmU2ZoS0ZxNFk2QktGZmNmYThOTkFzaklDT1RI?=
 =?utf-8?B?SnZETmttSS90dFNnVjVvMUlDZTNwQzJ5K29MK1dLZFovZ25lVkVzTitLY3Bo?=
 =?utf-8?B?NWNLOTd3NzVyayttT2hSZndDem5yb1hXaDVZUzZ6NlRGQWVYQU9WNm1uQVFD?=
 =?utf-8?B?Wlc5bHRJTEZMVmpBejJtRXFRM3BkS2FwSGo3dVQwbUdQM3dBa0hKSWs0TjRZ?=
 =?utf-8?B?UzVLRng1RXlkemFXYytKZHcwajlXOW1FOEZjbEtSMUZ3MjdmRTBNK3JJNFE3?=
 =?utf-8?B?elRaUFBITzFlclZxRVAySlhCVUZWMDYxcVZWM2g0VXpxRENGeDZhOVhhVkpn?=
 =?utf-8?B?bHIyOUtqNFY1RTZOWTYrM2V5SmlOQWFGZmpFTWlGa2l3YTE5SFVXNWg3SC9B?=
 =?utf-8?B?d2tVK1p5dzcydCtIVW9pVGxiSVRad1U5RExyVHlJQi9WcysrVDFPRjFWclMr?=
 =?utf-8?B?cWRodHpabUt2NDg1TUUzano4ODNGR09kRWJWcW1aTWZBN3BtaTMvYnVxRSs5?=
 =?utf-8?B?dHpWYi9FWkI0Nit3cHlyUkpXN3V6N09PQlNtWVZhQzl6ZUl1OHl1M1phMTVH?=
 =?utf-8?B?anUycjM5U3RiQzBaeXJZcWc2REpFcldmRTI1MW42RGtVb2l5TFdFbVRxcThM?=
 =?utf-8?B?VDRIdCtsUCtNTEJuNk4ySnhWdjdXWGRZMTl5QmVxRDVHMXR1a2VxUHh5WGx5?=
 =?utf-8?B?cFI5enhQVzNpNXRKeTVXSHB3TWVxT3hUYU4yekNZc0lLeDJYSnFWaXRqOVNC?=
 =?utf-8?B?WkVTakU1a3FwMjI0eUxqbVdBSDFmdDVSVWJHZmJIV2VhVXc5Q3h5MTRXUjVN?=
 =?utf-8?B?VHYyWkhxSm5RUkRzbThycWNCWXJTVlFxdFNtMFNnZEQyemU5ZTJQR0g3S281?=
 =?utf-8?Q?7wcPIsOSNrQLnu7oHb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3563c7f6-a0dc-49ed-9893-08df0abc4226
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:39.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DBvGnYnvJvfrAXWoIkCuJ6qzlrdiNsPKRYshvy8/vzoWDO4q5yLqdCi79e4WU6f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the complete Realm Service Interface (RSI) implementation from
> arch/arm64 to drivers/firmware/arm_rmm. The RSI SMCCC definitions and
> command helpers are also moved to include/linux so they can be shared by
> architecture code and firmware or driver code. This also keeps the
> firmware interface outside architecture code, as requested [1].
> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440a..ff9565d3ffa596 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -38,6 +38,7 @@ config ARM64
>  	select ARCH_HAS_MEMBARRIER_SYNC_CORE
>  	select ARCH_HAS_MEM_ENCRYPT
>  	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
> +	select ARCH_SUPPORTS_RMM
>  	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_NONLEAF_PMD_YOUNG if ARM64_HAFT
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 49a7002661a928..1620537f0332d9 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -8,6 +8,7 @@
>  #ifndef __ASM_IO_H
>  #define __ASM_IO_H
>  
> +#include <linux/arm-rsi-cmds.h>
>  #include <linux/types.h>
>  #include <linux/pgtable.h>
>  
> @@ -17,7 +18,6 @@
>  #include <asm/early_ioremap.h>
>  #include <asm/alternative.h>
>  #include <asm/cpufeature.h>
> -#include <asm/rsi.h>
>  
>  /*
>   * Generic IO read/write.  These perform native-endian accesses.
> diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
> index 636f45b4d8afc7..f03b9d7b83b438 100644
> --- a/arch/arm64/include/asm/mem_encrypt.h
> +++ b/arch/arm64/include/asm/mem_encrypt.h
> @@ -2,8 +2,8 @@
>  #ifndef __ASM_MEM_ENCRYPT_H
>  #define __ASM_MEM_ENCRYPT_H
>  
> +#include <linux/arm-rsi-cmds.h>
>  #include <asm/hypervisor.h>
> -#include <asm/rsi.h>
>  
>  struct device;
>  
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 09d7c00cf40541..58e71e592175ef 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -66,9 +66,9 @@
>  
>  #ifndef __ASSEMBLER__
>  
> +#include <linux/arm-rsi-cmds.h>
>  #include <asm/cpufeature.h>
>  #include <asm/pgtable-types.h>
> -#include <asm/rsi.h>
>  
>  extern bool arm64_use_ng_mappings;
>  extern unsigned long prot_ns_shared;
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> deleted file mode 100644
> index 88b50d660e85a0..00000000000000
> --- a/arch/arm64/include/asm/rsi.h
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2024 ARM Ltd.
> - */
> -
> -#ifndef __ASM_RSI_H_
> -#define __ASM_RSI_H_
> -
> -#include <linux/errno.h>
> -#include <linux/jump_label.h>
> -#include <asm/rsi_cmds.h>
> -
> -#define RSI_PDEV_NAME "arm-cca-dev"
> -
> -DECLARE_STATIC_KEY_FALSE(rsi_present);
> -
> -void __init arm64_rsi_init(void);
> -
> -bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
> -
> -static inline bool is_realm_world(void)
> -{
> -	return static_branch_unlikely(&rsi_present);
> -}
> -
> -static inline int rsi_set_memory_range(phys_addr_t start, phys_addr_t end,
> -				       enum ripas state, unsigned long flags)
> -{
> -	unsigned long ret;
> -	phys_addr_t top;
> -
> -	while (start != end) {
> -		ret = rsi_set_addr_range_state(start, end, state, flags, &top);
> -		if (ret || top < start || top > end)
> -			return -EINVAL;
> -		start = top;
> -	}
> -
> -	return 0;
> -}
> -
> -/*
> - * Convert the specified range to RAM. Do not use this if you rely on the
> - * contents of a page that may already be in RAM state.
> - */
> -static inline int rsi_set_memory_range_protected(phys_addr_t start,
> -						 phys_addr_t end)
> -{
> -	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
> -				    RSI_CHANGE_DESTROYED);
> -}
> -
> -/*
> - * Convert the specified range to RAM. Do not convert any pages that may have
> - * been DESTROYED, without our permission.
> - */
> -static inline int rsi_set_memory_range_protected_safe(phys_addr_t start,
> -						      phys_addr_t end)
> -{
> -	return rsi_set_memory_range(start, end, RSI_RIPAS_RAM,
> -				    RSI_NO_CHANGE_DESTROYED);
> -}
> -
> -static inline int rsi_set_memory_range_shared(phys_addr_t start,
> -					      phys_addr_t end)
> -{
> -	return rsi_set_memory_range(start, end, RSI_RIPAS_EMPTY,
> -				    RSI_CHANGE_DESTROYED);
> -}
> -#endif /* __ASM_RSI_H_ */
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index d2690c3ec52885..21fc3a3d25c91f 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -34,7 +34,7 @@ obj-y			:= debug-monitors.o entry.o irq.o fpsimd.o		\
>  			   cpufeature.o alternative.o cacheinfo.o		\
>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
>  			   syscall.o proton-pack.o idle.o patching.o pi/	\
> -			   rsi.o jump_label.o
> +			   jump_label.o
>  
>  obj-$(CONFIG_COMPAT)			+= sys32.o signal32.o			\
>  					   sys_compat.o
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 29c6100f0c50b2..a707deba6ae701 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/arm-rsi-cmds.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/stddef.h>
> @@ -43,7 +44,6 @@
>  #include <asm/cpu_ops.h>
>  #include <asm/kasan.h>
>  #include <asm/numa.h>
> -#include <asm/rsi.h>
>  #include <asm/scs.h>
>  #include <asm/sections.h>
>  #include <asm/setup.h>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index fbf215ecc7d061..2a8de20d2b447b 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -34,6 +34,8 @@
>  #include <linux/acpi_iort.h>
>  #include <linux/kmemleak.h>
>  #include <linux/execmem.h>
> +#include <linux/arm-rsi-cmds.h>
> +
>  
>  #include <asm/boot.h>
>  #include <asm/fixmap.h>
> @@ -43,7 +45,6 @@
>  #include <asm/kvm_host.h>
>  #include <asm/memory.h>
>  #include <asm/numa.h>
> -#include <asm/rsi.h>
>  #include <asm/sections.h>
>  #include <asm/setup.h>
>  #include <linux/sizes.h>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b7cc11e4fbfa65..62660bf520a8da 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -310,5 +310,6 @@ source "drivers/firmware/samsung/Kconfig"
>  source "drivers/firmware/smccc/Kconfig"
>  source "drivers/firmware/tegra/Kconfig"
>  source "drivers/firmware/xilinx/Kconfig"
> +source "drivers/firmware/arm_rmm/Kconfig"
>  
>  endmenu
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index be46f1e1dc77fa..196a650ccf025b 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -39,3 +39,4 @@ obj-y				+= samsung/
>  obj-y				+= smccc/
>  obj-y				+= tegra/
>  obj-y				+= xilinx/
> +obj-y				+= arm_rmm/
> diff --git a/drivers/firmware/arm_rmm/Kconfig b/drivers/firmware/arm_rmm/Kconfig
> new file mode 100644
> index 00000000000000..e981e12fdbe6a8
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Kconfig
> @@ -0,0 +1,17 @@
> +
> +config ARCH_SUPPORTS_RMM
> +	bool
> +
> +config ARM_RMM_RSI
> +	bool "Realm Service Interface (RSI) Support"
> +	depends on ARCH_SUPPORTS_RMM
> +	default y
> +	help
> +	  Enable support for running Linux as a Realm guest under a Realm
> +	  Management Monitor (RMM), as defined by the Arm Confidential
> +	  Compute Architecture.
> +
> +	  The RMM exposes the Realm Service Interface (RSI) to Realm guests.
> +	  Linux uses RSI to negotiate the interface version, obtain the Realm
> +	  configuration, and manage the protected or shared state of guest
> +	  memory.
> diff --git a/drivers/firmware/arm_rmm/Makefile b/drivers/firmware/arm_rmm/Makefile
> new file mode 100644
> index 00000000000000..3708b37a9aafc6
> --- /dev/null
> +++ b/drivers/firmware/arm_rmm/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-$(CONFIG_ARM_RMM_RSI)	= rsi.o
> diff --git a/arch/arm64/kernel/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> similarity index 99%
> rename from arch/arm64/kernel/rsi.c
> rename to drivers/firmware/arm_rmm/rsi.c
> index 25ca75ce1a4dff..8e716f1c1e319d 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -8,11 +8,11 @@
>  #include <linux/psci.h>
>  #include <linux/swiotlb.h>
>  #include <linux/platform_device.h>
> +#include <linux/arm-rsi-cmds.h>
>  
>  #include <asm/io.h>
>  #include <asm/mem_encrypt.h>
>  #include <asm/pgtable.h>
> -#include <asm/rsi.h>
>  
>  static struct realm_config config;
>  
> diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> index 3f0f013f03f159..2582ebb36922ea 100644
> --- a/drivers/virt/coco/arm-cca-guest/Kconfig
> +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> @@ -1,6 +1,6 @@
>  config ARM_CCA_GUEST
>  	tristate "Arm CCA Guest driver"
> -	depends on ARM64
> +	depends on ARM_RMM_RSI
>  	select TSM_REPORTS
>  	help
>  	  The driver provides userspace interface to request and
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0eeddd1ff05b51..b741643d136476 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -3,7 +3,8 @@
>   * Copyright (C) 2023 ARM Ltd.
>   */
>  
> -#include <linux/arm-smccc.h>
> +#include <linux/arm-rsi-cmds.h>
> +#include <linux/arm-smccc-rsi.h>
>  #include <linux/cc_platform.h>
>  #include <linux/kernel.h>
>  #include <linux/device-id/platform.h>
> @@ -12,8 +13,6 @@
>  #include <linux/tsm.h>
>  #include <linux/types.h>
>  
> -#include <asm/rsi.h>
> -

  [Severity: High]
  This is a pre-existing issue, but is there a missing bounds check on the
  firmware-supplied length in this file?

  In arm_cca_attestation_continue(), the len value returned from the firmware
  (via rsi_attestation_token_continue) is added to info->offset without verifying
  that len <= size:

	  ret = rsi_attestation_token_continue(info->granule, info->offset, size,
					       &len);
	  info->offset += len;

  If the firmware returns a maliciously large len, info->offset will exceed
  RSI_GRANULE_SIZE (which is 4096 bytes). 

  Later in arm_cca_report_new(), this unvalidated info.offset is used as the
  memcpy() length:

	  if (WARN_ON(token_size + info.offset > max_size))
		  break;
	  memcpy(&token[token_size], buf, info.offset);

  The WARN_ON check only ensures it doesn't exceed max_size, but buf was
  allocated as exactly RSI_GRANULE_SIZE bytes. Can this lead to memcpy()
  reading past the end of buf and copying adjacent kernel memory into the
  attestation token returned to userspace?

Pre-existing, but seems worth fixing for robustness and avoiding
future LLM bot noise.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
