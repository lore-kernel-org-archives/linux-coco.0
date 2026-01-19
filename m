Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6C121ABC1
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852303; cv=fail; b=M/+5At6YJ7OYlKc6Bmh7t9pIuUKfpDJm5ahQMZ2AJXcX7KIljYJdZ+T63sG5Dnrlj+xZaq0cBLWznO9Hun2h1Y89IU+fkYXWvV9NenZuKtbswc+wttREvrJ6B60UKkMzKbIwKm/f1wc8JkIT8qXaF5iz37NF6nOsgjhiZmUgdmE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852303; c=relaxed/simple;
	bh=hPy1djEYT5++3r9U9GCiBRw6L2cIztmkBfWBIxWBbMg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GTm19J/P8fCta3rT0VNhYBzsv+UpboyW2889/4UffmYED7ZYHCvI1KsaNhCyCCQj5bZOPOyqTp/J48e8t5mUbYgFTxawAFD31wXxHdiGxSDP8eKvmaVAj3sQ36I7GcfUV4KxhJPIVgolRWw8iqG68SLnOEC3iF0sPM0UPjvozkE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OajS5UBr; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OajS5UBr; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OajS5UBr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OajS5UBr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NMmumHjOXLGWU7Z6odGjB8rdpm1Dwstb7L81Ug7PSchpHizUU48slEtviFtok24mq1J5pe+lQpB4fP61R9NIQHl1+Lrxz37h8mBwSSJVj/lZIq2vXsVUYCBnEOpjF5/JecgJU918gy3wyktkCjwa4cTc7d+yHwXtopLZ5XQjfF1GVXFheFjfqedWQ9aTr8apk9qH/ctuQXhcLxH9iAOaFnlH0LZpAd+lqUeSxI8CqBGGEXLdbAp5zOH5+zE1u5xevTwivX7CvVDGYPxJNMPITJ2+hoYuRk8EnjbdBP3qQSpvyYj4pFWV1Q1ZwKxcnBva1bkVIwxQNm+0RAmwjuZemA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YosyeWIcnRiejhCm6gbVmX8hsxi4ImTcWjp7a6W8Sss=;
 b=LHIJcXt9NBqJvkczPVpcfvY25rI5GbK+Xk6feXSPSNYUyp0LiULf9zTgk/OeD88WT8rpYJTl0OJ4TyISVoWwvImmulh6KDfVlAdnfvWnr5JOpcgu1VF5jp8ewtf+F0EdZzRu7Ql3v4gSQOqqWdx331j/QcUTjxgK6CHUhXRbc2+SezW+Aq5r41sDkjpOi3y2ZVGqx8yzuNB915osq7yoj5bhGxb6iOgp0wTfQUT8pz6m67BT8jcH1BEdcN35IEX5/mBKHelKd2gRsahptelL5k8fpkTbKw1R90KmJGXGg8BGV6HzpaTujRJbWH0HCayNhZzgM8wH7SrieROvM8xkwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YosyeWIcnRiejhCm6gbVmX8hsxi4ImTcWjp7a6W8Sss=;
 b=OajS5UBrTL2u5odYOkQP4QgVhtrjCd9ZGv3fqIalViNmFAhOyn1wcNOUWy1VrNa8jRQdUM8kulr8e8XqYMiMYSqGErN7tXtjH1p9hm05pORVU7e8Je+ho4rWZeYWyugW5jJXs3v9EA1GpwzI1rnb3doJY6Or1MeqaKc4TYega2g=
Received: from AS8PR07CA0041.eurprd07.prod.outlook.com (2603:10a6:20b:459::31)
 by DU2PR08MB10106.eurprd08.prod.outlook.com (2603:10a6:10:46d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 19 Jan
 2026 19:51:31 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::a8) by AS8PR07CA0041.outlook.office365.com
 (2603:10a6:20b:459::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Mon,
 19 Jan 2026 19:51:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Mon, 19 Jan 2026 19:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxrpQMPXE0knczqjkcPVd2+S56FPWazu5xmvl5qHYk3kAc8WXaSx4gFPnzjm1lwX3nEv25Y9wd/713QNDGhd4uSFuMN/NLgbs4d15OxlQyFN/VI+sJ4OUjPJBQBDAk6tmNLlSw+m0rmZmPA5AInCCobpKoCIEYGxzthH2yTTOpgPeP7Ts7Qa3SHEy4hH90mDLazh9g9ssSJroP9hEQ/8lXCmCuBiO/7MP6/zLzyhOtFg1WXRH8hUYssLSb/Vk3whO7ISgCtVDqO92ITChvgELn4xKaWh/tMVPYb1RkPSxIFxBbbqIeBNtWziB8hmOe/ACDuToI0EnrGTvpK09AVF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YosyeWIcnRiejhCm6gbVmX8hsxi4ImTcWjp7a6W8Sss=;
 b=ijywu/LE1QqcFmPCVDQA8WFZNBkotmkTD8gkICPmWEN/FPB8e7O7uimhhTW+xqJucVpcRHQgLDt4eU+6/GK872yz9EzGSowgugfbzuqCE+k5ctwPt3MGT2uHVNS3va2t1dVQTTNUsGleYc/sAdAEO+lH3IX1kVWCNelk7BB/UzAK+TRltCVYSAQ8XJq+U6C/G9LSVFsDWVtshaWSy1Jc6PBZEKZoWHir6Z0hM0uPidfHMZL6WDyCLOd+lH1mVPwB0sFGq5h2mPT0C3/gjS1ciYpiRfA4oEx9WCUwAKXrx+rbXp0ykkaxsTZnU7gfYVfPZ7NouVwwAtsfkJxRMJ6Ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YosyeWIcnRiejhCm6gbVmX8hsxi4ImTcWjp7a6W8Sss=;
 b=OajS5UBrTL2u5odYOkQP4QgVhtrjCd9ZGv3fqIalViNmFAhOyn1wcNOUWy1VrNa8jRQdUM8kulr8e8XqYMiMYSqGErN7tXtjH1p9hm05pORVU7e8Je+ho4rWZeYWyugW5jJXs3v9EA1GpwzI1rnb3doJY6Or1MeqaKc4TYega2g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com (2603:10a6:10:3fa::12)
 by AM8PR08MB6388.eurprd08.prod.outlook.com (2603:10a6:20b:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 19:50:28 +0000
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921]) by DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 19:50:28 +0000
Message-ID: <6c6d0e84-f371-42fd-b51b-dc5dcbea2a45@arm.com>
Date: Mon, 19 Jan 2026 19:50:26 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] firmware: smccc: lfa: refresh fw details
To: Vedashree Vidwans <vvidwans@nvidia.com>, sudeep.holla@arm.com,
 andre.przywara@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-6-vvidwans@nvidia.com>
Content-Language: en-US
From: Salman Nabi <salman.nabi@arm.com>
In-Reply-To: <20251208221319.1524888-6-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::35) To DB4PR08MB9214.eurprd08.prod.outlook.com
 (2603:10a6:10:3fa::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB4PR08MB9214:EE_|AM8PR08MB6388:EE_|AM3PEPF00009B9F:EE_|DU2PR08MB10106:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecf5af6-daa6-4da7-02c0-08de57942479
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VC9ZYjJUQWk2cHNGLzd5dnJjMkFoYS8xbjJjMWh3TDBjbTBVU1p5MzlkSjRN?=
 =?utf-8?B?Q0ZGaFVWZXN0ZXJ4T2Y1Ykt4Wlk3OHY2cTUyVWZocUlXS2J4bnVNK1FOSGcz?=
 =?utf-8?B?VE5zK3FHZEQrWlpSMDhVaEtBTkZJWHpZN2xRQklBUjlhL21DaGI3TEc5K3dU?=
 =?utf-8?B?VytTRnpISUU5WWNxZ2JlbW1IU3Mwb3BROWxIRTA0cGorTFBmblRsQXFiclgx?=
 =?utf-8?B?b1dPcWQ1bzJxS3I3NkJZNks4ajhwdGJ5NWtXTWVXcmNXaUNBSVdpWTNRdndo?=
 =?utf-8?B?cjlqR1ZkbjFXWUE0SGt5SlFpUFE3cmFrQjZYa3Mya2srdk9LN2R6U1hmTGNG?=
 =?utf-8?B?aC8waDEyOFBHejdLblkwMDc3aUpuakNVK2lNYno2NGRYTGNUOXhiRXExWWN3?=
 =?utf-8?B?NERQYkJEU1M5dDFwVEtLMTRUdWtTT2JLZUtGRVZuTVdpOENyM1V2QXdPa0x5?=
 =?utf-8?B?aEdMOFk5UForOEU3WEZ5V0lMcE8vWm90MkpMa2hzeTg4VGZKWjM2b04wZExP?=
 =?utf-8?B?dlV4Z2s1aU1NeFVBcWwvTmhjczgzWXErSHhmODAyRGtScXJLKzhMUDNqQ2tz?=
 =?utf-8?B?VHVPVUUxamI4eXZSK29pSTgranVZbmpNZmJCSUUyRFJueVIzUzhRRWRvRlBH?=
 =?utf-8?B?b0ZyQ0tuYlZHQW42UTdJM2czc2NYdUVvYURHRUlSNzFHUExicWwwcmdvTkJq?=
 =?utf-8?B?UEk1dnVETGdHUVBLYW84S0N2ZWpTSkU0SEZzVnNMOGJZdVFobU1sVEpWdjBM?=
 =?utf-8?B?Z0dDUUZaOEJnMFMrRW4wUmlkR1Y2WnBZSUNLWTRLK0lTMmRRbmxpcTBva1h1?=
 =?utf-8?B?NnZMQ1ZRVWQrL2t5VlZ1OEZGMlJ1Umx4NHVYeDVsL244dUludHN1a0tqL2dB?=
 =?utf-8?B?dG1YSWlwR1I5MUpNRHZTNGkwWmpVT05HaWhPaGYrdU9KcTI0bWRhdEJuckVs?=
 =?utf-8?B?MGQwbjhDZzh4RUFxcnAxZFE0b00rdk10NzhHVnh0c3g1V2RlMytCNGlYRUJw?=
 =?utf-8?B?T0xFcXQzVjVDdDlva2NKbHRlK3dVclROcUVsU2luYXE5MEZDNDAwY3ljQlpi?=
 =?utf-8?B?QlVnZXVxbnpSdmIyeTJ0ODdoVnMxcE9xY0piSm1KY3VFUllwd3BNajYvUzJU?=
 =?utf-8?B?bXQ1aVhmUWNRc0ZCSDhhTlFsVzNZMXQ2dUg0OGlVRDZCOXJmak5NQU4yTGt1?=
 =?utf-8?B?YnNIMGtnR214WEZ5SUNIdG5OU0l6Snh4RndxM2wraitKbzFlbENOKy9rWFRn?=
 =?utf-8?B?NWY1ZFpSV3FvdWo1ZXVPN3I0bEJFakFrTGpxYlFGTEMxYkdwTlJ3YTNDTFl6?=
 =?utf-8?B?Sk8vNW8vY2F5dDNGeFZGeXNwNVJRUkhMZ3cwSFJMN2YxR3cxSGZrNWlvOWdq?=
 =?utf-8?B?OU1ENTlwUTF1NkpNb3FjVldhc2hNOVFjL20wWURiM3VCVVA5RnNRZnRXYUxM?=
 =?utf-8?B?dnRmcW9lY0tXS2V0TjVQU2pHcVpLSnBwYVVaakFNTi9BZG5rNDgyUTdxQ29B?=
 =?utf-8?B?YnprejliYWdZSTJDQ1o5TE84b2tuOGtxMFNpeUFvTXkwKzloR0hjb1RvemFu?=
 =?utf-8?B?WGMvaGpZY1JxaitqUlNZN0NMMzg4WlhMWU9sS1lzTTgvbVlha2pmalMzRUVL?=
 =?utf-8?B?S2tWMkhQb1h4QlRlZFhLWVYxOUJmbjNMbmtwSDArcGhiQzhjdWxKZTVWZlhP?=
 =?utf-8?B?NEhSVnBPeHlJSkN2U0svZDVEblpFc042dk5hTGtXZ3BmeG1RUDZ4RmNFT3Bj?=
 =?utf-8?B?K0hCNU9ldmhNR1YxUFM1TmxkYTV2OCsrVjhqR1B0WjdYaDhuM0tZMHQ4WERI?=
 =?utf-8?B?NGFPTlhIUGk0K0lkZEJmQjZDU3NNVE9BMk5RRS9ONnFKYlFqWWZBRWxGTUdm?=
 =?utf-8?B?UXlnQ1EzM0FoVlVTTnV3cjBYbXppcFFlbklTa2xqR2pzVnNnRHF2aGtPUkl6?=
 =?utf-8?B?QkZVVm9MMjBWMzVTUU43VW1JVUk3UlJyVEltQklCRGVwTTA5Zk9lWVl6Ykty?=
 =?utf-8?B?QzQ0eXUvVVhwb2h4TWVUTERxMVJzNGtZV3JGaG00UjE5bWVidnBVWHh6cll2?=
 =?utf-8?B?b0pneHJKZGFVZnpuQUZYTHNkSG8zUVJQU2p0Y3BrK2oxQnYydVI4di9PVlQw?=
 =?utf-8?Q?1Yo2BdUGg4NoXP7lJlJA6sLS2?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9214.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6388
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	459df78c-6e5a-47dd-02d3-08de5793febd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|7416014|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFk5SHpUU0ZwRlRneCtiS3FwMVZEV2xaWHlXRnQwcjJTY3BHZzE0aThLNVVF?=
 =?utf-8?B?Z1pwdDZmRWdhSVpyYytDOXA1QVZuazVHWmlSUGJzOFg3bFA3and2L29sdU5L?=
 =?utf-8?B?RVpPVEhrcVRtU3hmd3Z3bXczbVJ3bVhlSzhoSzAzcC9udWFiWmgyaHRxSXVE?=
 =?utf-8?B?QU51RVdGc24xTGRDNFhCcDZ5YjJOTnZmM1ZTN1AyaFl6eGswbjh5THdIUUpW?=
 =?utf-8?B?M3dGT0JoMTlmb2E0LzNUMHJPSzlkUVY1YnJtL1NSdHU5a1dieUZPbVp0bDV4?=
 =?utf-8?B?Sk1hOG9WWm02a3I0amtmTVB5bWpEM2VwTlRycnlZeFR0R0JIaThBSjlYN0NK?=
 =?utf-8?B?MXo0RU93aEhLbHdqd2hiMndHdXZXRGw0S2N4SCtqaGI0KzRRYTlicm5BdGo5?=
 =?utf-8?B?WVpFc2g0eGNmeTJNY2NsNmdGTWxRU2JESWMyVEhWUzVKMWZqRUY3V2tDY2lx?=
 =?utf-8?B?T1lENERlaTY1U24yRnlWSW9zUndMTldOWTBMNkRFSTNzVlpRdkRyZ1hYa3gz?=
 =?utf-8?B?aTZ1Nk9TQnVMZkNES2V3c25TbFozTFlqSnJzcG9LTlplc1FpcWtxWk4wTUxF?=
 =?utf-8?B?MUUyVkdpTko5ZGtma1h2WE84NTEwVUxiSklvYk9xTVVLSlBXRzNTNnUrb1cw?=
 =?utf-8?B?WHBnYWd4bExrWHdJdHpORXJQMTlUbGtRT2FlODZEK1hNYXB0QnhEVWVmc2J6?=
 =?utf-8?B?ZDlUM1A5cFdhVDdSUW5LNWZCWWlVaHhKeVNtUHJNUDlqTS8vTmhHTW5aTTFU?=
 =?utf-8?B?NnpqeEdHZlk5RDVNVk5zY21mRmV3OEJUWGJ1NGxXcnZ3UytJcXRxd2IxdkZS?=
 =?utf-8?B?TStTWXJZQTBkQWkrZnlRcE02YXdXZ21VN2pmNEhUTko4UlZhSE9MRXZSbEtL?=
 =?utf-8?B?cm1jdjQ5OGEyWFBrdjUvMThpYXVaSm1lT2VienZETTFWYVlxdDdVckZWSEFG?=
 =?utf-8?B?RlAzc2dveTUzbm1TUkhUTUdITkdyZUJXNUs3b1ZCaXpYV3l1WHpHREpwaXc0?=
 =?utf-8?B?c3Z2WURNV1JianR1VEZ3RkNWbGxoUzc3SlZmOXdBaklHY25zV1pZemNqUDFi?=
 =?utf-8?B?a0daZFdDeUhkTThqdWFzVkdzd0lqZm5tc0hxOFl2c2NzQ1lkdVkwUG9IZHFQ?=
 =?utf-8?B?VGRiS1FaMFluVnJSY0JmRmJQOWVNNk1UUWJ3azBaUjQ2SjJhTjBsK0czWk5R?=
 =?utf-8?B?UTR4b1FRVU1NNTlTcWRodEYwWXM5V1ZSdzdHN2Vxa21lK3lNS01mbnJ4b3d0?=
 =?utf-8?B?SmV3dzFyMExleXI5VUxpU09tMUVCN1hkYmRQQTU4WkdpRWdZaWJ5QnNNV3lE?=
 =?utf-8?B?aG9OTGVoR1RhU2FRM3ErK1dNVDY3Mm16SGRQZStJWXNjd1poUFpKZWQrYmpD?=
 =?utf-8?B?Nngvc2VSaENKaFNNWFk0d0dtWm4vZUZ5TW5MSEM5QWRCdU1xS0N1Yll5QUdB?=
 =?utf-8?B?SVRVYWhEVkVrUzYvd000bWFUekxkc3E1d2IrNVZ3VHJSelZKaE5XMTZqbUtq?=
 =?utf-8?B?Q29KYVdkaHpESEh4U3FzM3FITlhYN2N2SnlLSFh3TXpVR1lHc1NRb0dZVFZn?=
 =?utf-8?B?Y2pWbDRoeU4wSWQvTmZoQXN3eG9RbGdiOThyejNaNXdxczdSSDRtMG41S1ND?=
 =?utf-8?B?TDBWWi92OTVCWXAyUDlIMmoxT1Z6cnZhMHdoVEdVeTlRM2VheUR4WXlGZVp4?=
 =?utf-8?B?bVFqeVVJMjREZGhkY3o1K2hyNDBDUFVZeFlPYllrWmxLVEhzaXAvT0VPVGdB?=
 =?utf-8?B?MTJaMm95UElIL2RaU05SNW1Kdnl2a21lMU1wLzJpOWVDT0xKa2dERE1NOXlF?=
 =?utf-8?B?bk9xQ3Z6eFh6dmJLcUFtalIxbm5sMmE0bnBINHJnaDZXNlI4MnQveHl6VXQ2?=
 =?utf-8?B?OGdXOGpPbmd0cTVjWlFGOE5QL1NpMjJuS0ZRLzZqU240MVhIVEVPZndURGY1?=
 =?utf-8?B?eXEwUHVSUEt1cS9abUVzQ01WWVJIRmZzdFlWSUV2YWszMkptS0p0MW1tS2Zz?=
 =?utf-8?B?S01nMW84ZGJZNlJZMDlQMEgyMUJITnVXZUljd1BoTzByTFhLeERUZ2xPaW9k?=
 =?utf-8?B?WWdVbVhpQ0lIYyt2V2lnT3V6eHVrQmRCejRrNkJlbFd1NjVPMWNoSDJiMUlo?=
 =?utf-8?B?c1ROTzh5MktXd1JteWlFcDhwQVhLVXRKelJIa3FlRmpRWno2eVMxb3NYdTVt?=
 =?utf-8?B?VWtZSnYvLzYvbXc0UkZMV2FJWmJEYUdSWkY0RlZDQ0tPY3hOUWF6TjRLT1Rv?=
 =?utf-8?B?UDk2NG1RT1llQ3E4aUVnSThiczRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(7416014)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 19:51:31.0960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecf5af6-daa6-4da7-02c0-08de57942479
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10106

Hi Veda,

First of all sorry for the delay in responding back to you. You may have already seen my patch submission, following the RFC, here: https://lore.kernel.org/all/20260119122729.287522-2-salman.nabi@arm.com/

I have incorporated all the bug fixes and code refactor/cleanup suggestions from the RFC. It also includes changes to the LFA spec, mainly current and pending firmware version retrieval. I did not include your work and am hoping you would submit follow-up patches to include the updated ACPI table, IRQ handling, and platform driver registration etc.

I would also like to point a few issues here, this would also act as additional justification to some of the code changes I have introduced, for example, a work_queue() for updating firmware images from the activate_store handler.

On 12/8/25 22:13, Vedashree Vidwans wrote:
> FW image details are querried with a SMC call. Currently, these FW
> details are added as nodes in a linked list. This patch updates the
> FW node creation and update functions. Now the linked list is updated
> based on the current value of num_lfa_components.
> As per spec [1], FW inventory is updated after each activation.
>
> [1] https://developer.arm.com/documentation/den0147/latest/
>
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 148 +++++++++++++++++++++-----------
>  1 file changed, 100 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 24916fc53420..334090708405 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -133,6 +133,7 @@ static const struct fw_image_uuid {
>  	},
>  };
>  
> +static int update_fw_images_tree(void);
>  static struct kobject *lfa_dir;
>  static DEFINE_MUTEX(lfa_lock);
>  
> @@ -282,17 +283,6 @@ static int activate_fw_image(struct image_props *attrs)
>  	return ret;
>  }
>  
> -static void set_image_flags(struct image_props *attrs, int seq_id,
> -			    u32 image_flags)
> -{
> -	attrs->fw_seq_id = seq_id;
> -	attrs->activation_capable = !!(image_flags & BIT(0));
> -	attrs->activation_pending = !!(image_flags & BIT(1));
> -	attrs->may_reset_cpu = !!(image_flags & BIT(2));
> -	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> -	attrs->cpu_rendezvous = !(image_flags & BIT(3));
> -}
> -
>  static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
>  			 char *buf)
>  {
> @@ -395,7 +385,9 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
>  
>  	pr_info("Firmware activation succeeded\n");
>  
> -	/* TODO: refresh image flags here*/
> +	ret = update_fw_images_tree();

Part of the firmware images update process, there is a potential of a firmware component and its attributes being deleted following activation. The to-be-removed component could very well be the one where the activate call has been triggered from. This results in a deadlock as removing a sysfs attribute from within its _store handler results in kernfs to wait for the in-flight store() operation to finish before it can remove itself.

To cater for this scenario in my patch I am differing the firmware images update process, triggered from the _store handler, to a workqueue().

> +	if (ret)
> +		pr_err("Failed to update FW images tree");
>  	mutex_unlock(&lfa_lock);
>  	return count;
>  }
> @@ -425,20 +417,41 @@ static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>  	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
>  };
>  
> +static void delete_fw_image_node(struct image_props *attrs)
> +{
> +	int i;
> +
> +	for (i = 0; i < LFA_ATTR_NR_IMAGES; i++)
> +		sysfs_remove_file(attrs->image_dir, &attrs->image_attrs[i].attr);
> +
> +	kobject_put(attrs->image_dir);
> +	attrs->image_dir = NULL;
> +	list_del(&attrs->image_node);
> +	kfree(attrs);
> +}
> +
>  static void clean_fw_images_tree(void)
>  {
>  	struct image_props *attrs, *tmp;
>  
> -	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
> -		kobject_put(attrs->image_dir);
> -		list_del(&attrs->image_node);
> -		kfree(attrs);
> -	}
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
> +		delete_fw_image_node(attrs);
> +}
> +
> +static void update_fw_image_node(struct image_props *attrs, int seq_id,
> +			    char *fw_uuid, u32 image_flags)
> +{
> +	attrs->fw_seq_id = seq_id;
> +	attrs->image_name = fw_uuid;
We introduced a C struct "fw_image_uuid" to provide names for each firmware component in the LFA driver rather than using the UUID for a name which is non-intuitive. If UUIDs are desired for comparison then "attrs->image_dir->name" could be used.
> +	attrs->activation_capable = !!(image_flags & BIT(0));
> +	attrs->activation_pending = !!(image_flags & BIT(1));
> +	attrs->may_reset_cpu = !!(image_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	attrs->cpu_rendezvous = !(image_flags & BIT(3));
>  }
>  
> -static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
> +static int create_fw_image_node(int seq_id, char *fw_uuid, u32 image_flags)
>  {
> -	const char *image_name = "(unknown)";
>  	struct image_props *attrs;
>  	int ret;
>  
> @@ -446,21 +459,12 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
>  	if (!attrs)
>  		return -ENOMEM;
>  
> -	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
> -		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
> -			image_name = fw_images_uuids[i].name;
> -		else
> -			image_name = fw_uuid;
> -	}
> -
>  	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
>  	if (!attrs->image_dir)
>  		return -ENOMEM;
>  
> -	INIT_LIST_HEAD(&attrs->image_node);
> -	attrs->image_name = image_name;
> -	attrs->cpu_rendezvous_forced = 1;
> -	set_image_flags(attrs, seq_id, image_flags);
> +	/* Update FW attributes */
> +	update_fw_image_node(attrs, seq_id, fw_uuid, image_flags);
>  
>  	/*
>  	 * The attributes for each sysfs file are constant (handler functions,
> @@ -485,17 +489,19 @@ static int create_fw_inventory(char *fw_uuid, int seq_id, u32 image_flags)
>  			return ret;
>  		}
>  	}
> -	list_add(&attrs->image_node, &lfa_fw_images);
> +	list_add_tail(&attrs->image_node, &lfa_fw_images);
>  
>  	return ret;
>  }
>  
> -static int create_fw_images_tree(void)
> +static int update_fw_images_tree(void)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 };
>  	struct uuid_regs image_uuid;
> +	struct image_props *attrs, *tmp;
>  	char image_id_str[40];
>  	int ret, num_of_components;
> +	int node_idx = 0;
>  
>  	num_of_components = get_nr_lfa_components();
>  	if (num_of_components <= 0) {
> @@ -503,22 +509,67 @@ static int create_fw_images_tree(void)
>  		return -ENODEV;
>  	}
>  
> -	for (int i = 0; i < num_of_components; i++) {
> -		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> -		reg.a1 = i; /* fw_seq_id under consideration */
> -		arm_smccc_1_2_invoke(&reg, &reg);
> -		if (reg.a0 == LFA_SUCCESS) {
> +	/*
> +	 * Pass 1:
> +	 *    For nodes < num_of_components, update fw_image_node
> +	 *    For nodes >= num_of_components, delete
> +	 */
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
> +		if (attrs->fw_seq_id < num_of_components) {
> +			/* Update this FW image node */
> +
> +			/* Get FW details */
> +			reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +			reg.a1 = attrs->fw_seq_id;
> +			arm_smccc_1_2_invoke(&reg, &reg);
> +
> +			if (reg.a0 != LFA_SUCCESS)
> +				return -EINVAL;
> +
> +			/* Build image name with UUID */
>  			image_uuid.uuid_lo = reg.a1;
>  			image_uuid.uuid_hi = reg.a2;
> +			snprintf(image_id_str, sizeof(image_id_str), "%pUb", &image_uuid);
>  
> -			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
> -				 &image_uuid);
> -			ret = create_fw_inventory(image_id_str, i, reg.a3);
> -			if (ret)
> -				return ret;
> +			if (strcmp(attrs->image_name, image_id_str)) {
attrs->image_name is supposed to be the name of the firmware image e.g. "TF-RMM" and not the UUID. If we need to compare the UUIDs I think we should use the specified firmware's directory name instead.
> +				/* UUID doesn't match previous UUID for given FW, not expected */

This is an expected behavior per the LFA spec. For example, firmware seq_ids get scrambled following an activation, the firmware image with seq_id 0 before activation has now a seq_id 1 following the activation in the LFA agent. When you attempt to request information for the firmware image using its old seq_id stored in the driver, the UUIDs would not match and thus the driver would bail out. We can't bail out for an expected behavior.

Just to confirm, my recent submission includes work on update of firmware images list following an activation.

Many thanks,
Salman

> +				pr_err("FW seq id %u: Previous UUID %s doesn't match current %s",
> +					attrs->fw_seq_id, attrs->image_name, image_id_str);
> +				return -EINVAL;
> +			}
> +
> +			/* Update FW attributes */
> +			update_fw_image_node(attrs, attrs->fw_seq_id, image_id_str, reg.a3);
> +			node_idx++;
> +		} else {
> +			/* This node is beyond valid FW components list */
> +			delete_fw_image_node(attrs);
>  		}
>  	}
>  
> +	/*
> +	 * Pass 2:
> +	 *    If current FW components number is more than previous list, add new component nodes.
> +	 */
> +	for (node_idx; node_idx < num_of_components; node_idx++) {
> +		/* Get FW details */
> +		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +		reg.a1 = node_idx;
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if (reg.a0 != LFA_SUCCESS)
> +			return -EINVAL;
> +
> +		/* Build image name with UUID */
> +		image_uuid.uuid_lo = reg.a1;
> +		image_uuid.uuid_hi = reg.a2;
> +		snprintf(image_id_str, sizeof(image_id_str), "%pUb", &image_uuid);
> +
> +		ret = create_fw_image_node(node_idx, image_id_str, reg.a3);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -538,8 +589,9 @@ static irqreturn_t lfa_irq_thread(int irq, void *data)
>  	 */
>  
>  	do {
> -		/* TODO: refresh image flags here */
> -		/* If refresh fails goto exit_unlock */
> +		ret = update_fw_images_tree();
> +		if (ret)
> +			goto exit_unlock;
>  
>  		/* Initialize counters to track list traversal  */
>  		num_of_components = get_nr_lfa_components();
> @@ -561,13 +613,13 @@ static irqreturn_t lfa_irq_thread(int irq, void *data)
>  			}
>  
>  			pr_info("Firmware %s activation succeeded", attrs->image_name);
> -			/* Refresh FW component details */
>  			break;
>  		}
>  	} while (curr_component < num_of_components);
>  
> -	/* TODO: refresh image flags here */
> -	/* If refresh fails goto exit_unlock */
> +	ret = update_fw_images_tree();
> +	if (ret)
> +		goto exit_unlock;
>  
>  exit_unlock:
>  	mutex_unlock(&lfa_lock);
> @@ -657,7 +709,7 @@ static int __init lfa_init(void)
>  		return -ENOMEM;
>  
>  	mutex_lock(&lfa_lock);
> -	err = create_fw_images_tree();
> +	err = update_fw_images_tree();
>  	if (err != 0)
>  		kobject_put(lfa_dir);
>  
