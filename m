Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E65544A3FD
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945699; cv=fail; b=ASIXxbs/IJ0D5qyaVniHoUXTpTXqbF0edDtyuPUnqpKJ++qIUcBktukPXNZL/iyN69sAbjIE9QRW3cPAspCFjwXKLM1xfk6cDVDX/E3M8jwcEnDPiA+f6Ly++iTEh9DA9Jh4gPZ1Z01icIWMZAX+MCX4M8On6xooaH8BeJ1CHzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945699; c=relaxed/simple;
	bh=P6lMescd1hfF4+YMrBMhPe/r6fFnEImEnkPHRLzxPjs=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=PDsS3roIOKxzT8fyCkrWDbg9uLILon3dwmlHnM4n4Vw5ydW1Q3jl0fQLjQedOEaiGqXaekr78QiEi1Kj9g7eUWyZAVtz0di07lpSrLQLMqRb9MvB3kl4FUdmC64E52w8AiTAae+73cPHltRKW/7Fw+nn/3ka/EJ2J0t2XA7q8H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TdBKhrg0; arc=fail smtp.client-ip=52.101.85.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TdBKhrg0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7x17f9GAxVmZSzbtn47y77UpIGKhMg52lxcNzgpW1eiCzguAhu1JzPJryRYfnpdGEgxi3nm9mX5q43NK9BYcd3WVQJFh5NpKaoYg7jUZPCdBd7ck4cGoG8zz6M0B8cC4s4oMpQLNgCbXwZqyucadpWagaI44geB0VlTwrmqWJMXiOlAsacFVZZbENKAR7vmVybWIUMOrbLnwRZrtxKp3TF2CuGjJCXw+0pKe8pb1G2f43uTX1Hpu5aUaat2eHE6AhMOZVYXIYZZO4YQ3MBQSdeohC0zZsfeQErK3Xhv3WCcaV3VwS5SG6JbKGTmBOL7a9NsuM4eM+DCDOcQG8nHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTZLmVEttnJA1Nh0yTdv3dOFvJlVkgHmwuXw1xkCoaQ=;
 b=NLh2tvub2e4Lx6qn/OKeiSDgT6qYnZe2/cYyoA3zgIf2yCfiN8sIAvO81O4cZ3X/hpqaw4XFCS7BqZtKgjzvV3VoEjM/00/0IpsQrf0NlIqxcRrWe4uIoyHlCl/u58RtMPCpWAvXfWQ0jlb0Q5CQopAq3Oq7exnYPT4dRhB4kUOOsqun9AI6ewjTcdJWc1XR8MHYRAzIrANMDsofSmHli2zRQtME7iCJp3IMsAorYUdNTpw4G+lCzsoX5RePaulugkIfewCUKBe4kNU0DYxjdrg5CT6ZEa3Kyn8TYUHLYonhPHQPQDmYB9QrQCwYXwoHqg7MhA0JeMAyuKpiPiAJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTZLmVEttnJA1Nh0yTdv3dOFvJlVkgHmwuXw1xkCoaQ=;
 b=TdBKhrg0lHsc6rVjrlsehYP2qJriIXXY4Lyum8KTsxYULdSJrqEiawPSIf1sZs73CSxnrjpCyv5vgl9EHoPUROMPPRF2h1wXv/Bi20aP+5Emd/dN+oBMq29ykhfsYyW8KYo47289oHGvvks54HXVQb1WZ2gpSKYwoSYRCV1RKNTd8Qnt6V5vSURCp0Kk9D6ZasO042CAr5hHhawVUxfYM921xIhcQodv0jvGU14/ftHLf12i/kFF+DfftW367umL0cIU6E6FEyu4SLgtma720heNkdGi1J2pTf2wkHmsllm8E8TAT5a00pla2fTEGBlojczNLeEsUXdUxRKS8DfC2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 3/7] firmware: arm_rmm: Move RSI support out of
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
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260805063255.1638614-4-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-4-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567779.4159892.7755943757427570192.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:408:ff::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: facf0e3e-bb24-4bd7-8f93-08df053b6852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+F+lEdUVuw2OHuikTJS4B/m3M6e70ahD0f0VXwSaGdEDOEJrc/NhGkIwFh2F5BikNRQMUK5Aqcs+J9B+jtXvELdOs9B7qCsi12MlPk5myskZak8DwSw+1RG7IMzvUmdrhoJxC+PUem9sIkp7CsEGMfokEzeLjgN6WhIhoUcvRlgzbv9jfb5a8sbdy2uN+6fiZoVjAsGMFBGD2xUdXdMbVw1nSJ5ytUFYNeEk9+63NxocFujceLKLsJ68E8KBnNkHcfTb0zjHZ5F0cIUnTs1dbkwK+8AiWBvZu3DVweamxyRYMEMFioUJguSjYxbCgTeuW6OKXWOkjyYnopKjj+uVWPFDMPh/AXsL4hLsT4QG/5z/s6LjJT9XABzNFBXCT51AS5nFjYb5gJQ8pOnuOBsaX5/+LBiul8xh3UtxxpQ2F2kFsWcz8+4jtAYKfryaPg0LmhYbl0Yp7Jx0CMGtfqtLMpCbf3OMe5OPKE8NHn+TKdceNI/yS30dCt6a3uLzWl86TPJ7WUGifdtVVkZIli23YteGdEQ5velRAi6qomexgZKuP1RHuJd51cmXA4ee5fgl91eu6TItqTxxuIiEuCDjvYgb39Pvl7Np/XNIAHN7O+a1q2ICIGisYwxeUk5zuhrYi/oD0sBKCMHZFhHyV1vVvTlTLX4VS/weXQbLLAd1j1g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9hVmxLVkExbU1lWjIxeWVFeHR5YXRqQXpPcEZZVCtsL1dZRTlxVFRBU2E4?=
 =?utf-8?B?Qlp2N2YxdG9KWGdEdis4bWZBTkpLVkR2QnJmN2cyYVdrUVBVTlpsOXRCWkxD?=
 =?utf-8?B?QmEyQUpVRW1abE9mWEJqVjU4SWtjVkpEOHpxZCtlNm1oR25BUXVFTm9xRUow?=
 =?utf-8?B?aDhGaGgwWUtZNXVPNHRNRDVtdm9POXZ1RUwveVdhbTZ5NlNtaUZIdmNhdXl1?=
 =?utf-8?B?SXgxczVTMlg2blIxNUVhWUNkcEx2d1JLQThLa3BXdjlRdDdSbCtINVIzMkMx?=
 =?utf-8?B?TThza2RUMzlhdDlDRFBNV3BiazBjVk1XWHo1QmM2Y25NVFdrV3hGcnJjQ2tI?=
 =?utf-8?B?ekNBWi9TN3FLd2hwUDY4TVFESk9zRVBRR25GVU5JMTA2ZWlXcmI4SDVVWXJa?=
 =?utf-8?B?MXZaK0xXRHB4aDhjYTFjUEQ0RS9ndjJOdUN1UjZsS3ZtbGdwOC84bjNrY0NE?=
 =?utf-8?B?R2V0VHF4T3lCY0MycEY0ZWRBOTl1SDNjMGJFVXlXenltVDFWSUdGaUQ1Y1k1?=
 =?utf-8?B?d2JGTzBjYXNEZ1RxdWlscDMyMmtSdGcyWjUxajZ6UWp5THorcGcvM3R5WUN1?=
 =?utf-8?B?NUZmL1BUV2p1MVNzY1dzOVNVbDI4TFBQTVJSZndSdTdBeENNYXk4UTY2SjV4?=
 =?utf-8?B?eXBodXdDcHBSZURTUStUNWZPV0IxY0k0cHpRVGNpL25PTzlUbXlBZXpGa0k1?=
 =?utf-8?B?NWNjNExwTnN6QTk2TlRyVjlhaVRMbFlNU2ZuZkRHQlhZdUpBK291VUNCL2tm?=
 =?utf-8?B?SUtoNHE4Sk02QzdVamczcHN0aU1zREJzOVhFWUhvSWR3Ukh2M3ZRVi94c2Y2?=
 =?utf-8?B?Y3dQTHZYMHZrd0J5SnRZQ0tLLzE4WVhlRGw2cWQ2OTNVU3oxTkpPRGNDaE1Y?=
 =?utf-8?B?Z2U2RFJ0d2VBbytLRzhwcDlBbWlrMm9XM1hvcFNKVU56cWY2NlREN0QvSEd3?=
 =?utf-8?B?ait3SmJHMzMvSFRxWEJMb1dxbGFidTR4QmxtK0dFN2pHVCtaUTJtRmJqaHVv?=
 =?utf-8?B?U3pDaTlKQ25nZG8yTVpCajJNWG5RVHA0d1VHRzkrVXJQQUlIMTB2d3pTb2No?=
 =?utf-8?B?Z3pVRkh6eWJQTUFZV3ZwNUU5NWQ1RHc0N0ZBWEd5MUtIOVdJaG1Cb1Y3aHcx?=
 =?utf-8?B?bWNFaHd0U0kvdnRXZjc4QStPdUE2VFovbnNlb2JJWWxLL1hQUGJtbXgrRnM1?=
 =?utf-8?B?amFiaFZnaXZxbVlCVDR0SnBTampyYUV1OE9nK1Q2cVRrbk0zSjNTNFJQV2py?=
 =?utf-8?B?SWJZNTJKcXp3QWlHOFBPR1JPM3dBZStheFA4THBYVlZlUGU1Y0tHNWtpeW8w?=
 =?utf-8?B?ZWVIQXc3anVoSjdKNVl1UFRiYzNSbHJQOUJQTUlpZkxFR0thclEyYWpvZkpM?=
 =?utf-8?B?TkZOa0xnUXBzWDVsRVBmYzdtYVQxWXEzVDhWb2dIR25aclU1SUY1QnBORWhF?=
 =?utf-8?B?Qkxjd3RuY0hSU0pRazEzR1VEV2I4U2thTmxJcGQ1dWYvRVVkVU1xWkNESmgy?=
 =?utf-8?B?bzNyQ1VYMlF4UVVEUCtRZkVFMWhlK01DSkRxSkRZWEZqb2V0cUlWNDA2T0Rt?=
 =?utf-8?B?T1ozMGgrWkl3L2FkWEcwUlhwMTg2VEI2eG5nT3lmaFlSTjZRWUN4dnozWkw1?=
 =?utf-8?B?N3h1TnNZelFBV0duOHJjMWFud1BoZTNuaFEraStvKzdibGRxTHJudXlqWm5u?=
 =?utf-8?B?QTRodDNvZE11SnVmb2Q1TXg2cmRSd3VPWVpVMW4xR0RhU25kbnBqdUFxRWFx?=
 =?utf-8?B?OVdMOHkxYjl6WFlsdlBFUU1UOWRReUhYT2lVdGQrdnNzYXVsY01PZFVJR3la?=
 =?utf-8?B?ZVpKYWkxUE5VRkdrV1laeEFJNlhuSUUvQVNLR2syZVg3VHZjdnNMNW5ENitr?=
 =?utf-8?B?ejNVWlpwOG5MMFlxTVVHUWV5VjI5RkNBcjNWWGt2WldvOTZtMnE5Q1FiWXpl?=
 =?utf-8?B?c3F0TDljNDdkTkx1cG1BMW1OVTRUU1Jhb3JLNVBCOTZMcVFxNk5oSEQvdTlU?=
 =?utf-8?B?ZGlaeFB2akp3WkpLY0h5czNqb3NPNzdkVVhZQ1NxWkVWOGdFNzIrTFBSK2Fy?=
 =?utf-8?B?d3BsU3ZjUG0wdWc4eFZvYTlZQWY4UEF5a1BtTnZRQWxWenZSRzNqaGZ6UCta?=
 =?utf-8?B?N1Fwc25acFJmY0pJbmVwWmtLWHZxUjFycTFsM2VDdVJvU21XODE2dFYwWFVS?=
 =?utf-8?B?WEJqNit0YjNlZFNrc3ZYanJoVU85VDFBRHVuN2NXd1B3NlRSVHlDTlYvQmNh?=
 =?utf-8?B?TG1hZWQ2d3Z3MmFuWkNWSjFyc21abmJ6Y3AwMjJsSmd0RG82dTNYeDFqOXdD?=
 =?utf-8?Q?Nn/daHNBv36C4vtm1J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facf0e3e-bb24-4bd7-8f93-08df053b6852
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:44.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRl2BWhDj0V58PCOePI9iyq5Al7AEeK7HE7ED405vw6SdLVjwmXp2sZ8KlE5pFHn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

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
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

The sashiko remarks don't look useful

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> [ ... 321 lines skipped ... ]
> -#include <asm/rsi_smc.h>
> +#define RSI_PDEV_NAME "arm-cca-dev"

This name shows up on the smccc bus as a device, '-dev' doesn't seem
to make sense as a device name to me, I'd drop it.

And is this arm-cca or should it be called arm-rsi with a different SMCC device for
arm-rmi ?

-- 
Jason
