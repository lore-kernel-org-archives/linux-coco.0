Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857242BE7DC
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562807; cv=fail; b=L5ZEuZEFhSq82TwVyUTTkWiERVFfZywAhuNPfbyz0GF3GKhi7J3wRDGSM3vtPoadpQOLx0v/TxhY5jTLSVoTyG7Y6b8tvUC3wEQbmQtlVgk1xudIJsizX+F8I7fq6yVsvUNsJVZFItoxeSUYenhCPGhFApdIZuDW+GjpTGHV9Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562807; c=relaxed/simple;
	bh=/6d6n77NgxbQB0+etmUXznObPzs/P5rL98nEzBo0WqI=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=nTwcAbD4vmeY0U8v2Mx+O8GZ2gZZ/Gjo0NkUiIuPZHeKjpLRbC9ptVsqd9Two66xryyvwsW2xgyvXpfsEyLlzzGaxtcZsiuLHWYzeTKm/WPushW3/L74IUXHKatVGQ7K6N4DwXxgP8It80F0KqmU8LUu2QIaE1pl7tGeQsvEc9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBwRPT8n; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBwRPT8n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSWNARvm/7F0heegvpFNEj98dvEQyldcptSaTFvYEzUo7WMMlKilylG583ed4GqAo0yvGPmh0KAG46kcy5ZvcIp3mAoV5CGJApPpBV3w2z3PqNTopzZqQ4VsFK8eZeRDUKa3XfBtFRDcKJmBgfz0vPrKz/7AySh7ou/XabSqIGHvMsSkINIHK//5c83wZIgKpdAZsbRpGY59P+tRsdrwCnbe7txR0hlR0nb0wFE1jmC08OncgoJzm/hfjuHBAdpm0F8YdYLmw05kwMwKEeukmsZ8rdfWBGgxSKxcgo+VfISJFhyuPJiZfkGDVHkaAKhu7ZJt1dlTV0/rPV8aEJlESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmiPM9vGqJ51D5JCgo/POziWS3CMusJ7hW3KRK7sPcc=;
 b=XSley/3Z4q10IZluIJfQOmFXGe8ZltuDq3JhDoTWE4NGx8OhZ2ZMc8JuzTd0sM05lXVv/DsTSo6279qxPtF/3WhnLHcV/yM7T3y/5P9r4SFgLuixPLGrQXLvCv16BTK/VZxXEOHSSPabjeGTDfh17/17kthScBuvcC8Qt1hAvCP9bW0Zq4c77v8vhKbHFfqAWJN3U0JhXnzICZ+XpHC40brIXj/LW5J/zRojyx1xkCTbzonH7FirayuTGBWv1kWoNuUKV2Zp2E1S250zSWT0Kd1oPjjMQtFUCUDauxcaoAhLbFBywuDNKm/afj5wljSxQn8Iq0izx0aYBcraAFbjmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmiPM9vGqJ51D5JCgo/POziWS3CMusJ7hW3KRK7sPcc=;
 b=KBwRPT8nqzpirqpT6+RbBlORs/Y6YLO6Q19KCxnEc7Qmqi+w6HsMkW0JEn8tdysQ+lf34Ea8e+CiIMvUxDZoN7I3k5GgYob7YEx6V2HiES7Whs+jC8Ujr1WBCgq3dIDBeSiqh2+xDWqfXPgMPlRQ9ZMTeRrI19QlV0VjZQQ2GT8VJLbgIBgrWqES/rtGcRXL3sxul1KaUyNW4DOutake60QpdC6KZFo6H+UEyALb4otyJnpro3OMoL6lAwygrve4Pw4ViZT4X4aoN39B0TfrWO3BDl6dp3pblOrJbG2Ocu2MyHQe1TY4CIpY1fypy8WTuNcLsKbjVnR90rvAs+we/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS7PR12MB5934.namprd12.prod.outlook.com
 (2603:10b6:8:7d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:46:40 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 12:46:40 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v11 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260914060511.277948-7-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-7-aneesh.kumar@kernel.org>
Date: Wed, 16 Sep 2026 09:46:37 -0300
Message-Id: <178956279730.555741.12594683979530748346.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: YT3PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::15) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: ad48000f-2094-40e2-a511-08df13f08d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|7416014|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3rwVbKJfbKOWPBt01DCj53FRGxlNTvMJyC2Lx3sxRL9tWxUqLGxucamyo5A7yxiEamEiGOAD4PJas/dT8dJFzwE1G1qg/zY/IT3u3l7XmaibVd6PXfX2Xq7Fy/1Mwjqje1TPN7ywkLJHuYd+zoo2Bfrv5DEstpgLbCgzncbnxf0qBui9DswIkevghJpKR7xXSt2LScS61aTzc8sDHbQztepxUOO2F4U4tUw4QLbaZOfFT7+ChbEHFkflztaAUqzpgIeGerC7hN1bwVh3J3rVrNfEH4yeOG9+4tkvuQgvYrjQQR4sr3SH9HDdgyC4jjXc6H0EpvsWmHIq3wpWI8XA7SAwMR8p9XevM2Mb9vrurRqvMNJHET34ZcfHocVgrEJHKlDLJysIQBBvG08GDdrV3Vy0gSGEDWxJu38LpY0O1/IZDNgUkRM1vzl/Fj2+9+der1w/3v8pCmrGM5/JGQJd+J8m9Jbx4T5dlO+xHr4YDj7erakynvxU5FXxSvYJB7Ky58x1MjoCUW+YG39QhE4CqUdKb/lac2e5Iukn5h/Sznc3eEcwM/tCVImo0J2uTd2jt4nDwXNH/zkJ/VU+CcQbRvHH1GBMCxkbyqw8D96DxzpxvYxVbPGw3Fz34cQ96L9fX8LglRmIMZxXk3LoCgnBXlZHHQFR72adVia/BE0WEjA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(7416014)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0N3L2t4QnMrb29lQ3VsK21SdEE0S3pCcnVJK2QyVFppUXJrZnBkaEE3dk1F?=
 =?utf-8?B?cFpPN2ZXQXRRdEZFWVdncTVyZFBKNGx0bWVZQi83WlVXdk1PeUNIenhsWEtu?=
 =?utf-8?B?SWg0UmdIbzhUT0NCb3lLcnd5VTdzekcwelFwSDNQd2MzNjZmUlpxWTB5MWZT?=
 =?utf-8?B?MmRFanpTU1BMTDBDMDY1Z1NSZHlPYkY4SUE3RzA3VmxUV3ZXdkl2eSswQU9U?=
 =?utf-8?B?ZlNsSnZZdDN0Q2d0WW1rTFVNRHhyUFdpdDlhbkhjQzZoRXRaYlFnRmlJTFRq?=
 =?utf-8?B?WFFWcE53cStGelZ3aEF2alVGY0QyLzNFMUJXcDhaa1FKeFhiQzFNUWltc1pJ?=
 =?utf-8?B?SHVybThKeE4rclN0d0J3VXk3cmc3SGtBemhYUHp1VVpjQ1p4S1FmT3I4SVNL?=
 =?utf-8?B?SXhvRXdib29MNExxODUrOFhTd2orS3lyNmlMbVVDWFQ1UURpOEZvS2dMS1VD?=
 =?utf-8?B?UFMrL2gxd0hZckJ2aFpLYTRPQ3JXOEpINGZIRWlKOUhnRWtOY1FkMUpjYUNz?=
 =?utf-8?B?WERuNWgyKzlUam1OejV4Mi9ZZUo2N0lFSE8rSVQ4N3dPYk1KUnBMNU1FWlhO?=
 =?utf-8?B?R0JmM0s2cDJ1bkZ1ditCeHNiZm1WYnJEeEUyRnlYL0Q5Undxa1kvdHovR3gy?=
 =?utf-8?B?L2ZzVFJsN2VSVWlFaExpRW5FdVN1VkZMalJQVWM0ZW1EKzRkS29PRzNmeEI2?=
 =?utf-8?B?Q0NuWHRoc1doSVVXZTNZeVNDQlpZQlVWTG9yeFJ3QjRiODIxb3lhdktYRzZH?=
 =?utf-8?B?ajE0TmNpTllKNnNlN1B3V2h6OFFuK293ZGl4ZmhvQkF4K0ZJYnV0STF0S1Fn?=
 =?utf-8?B?Qi80RmFXclJMcENTVGpqUm1Bclg4WWIwSXkxd0xCc09Tc0prNndXb1VJLzdB?=
 =?utf-8?B?cUVyYWtSQjJTUlo1SSs3c2ZRa1YvbWZtbWEyMm5WMDJ0NFBsTUFmR2dHb3F4?=
 =?utf-8?B?b29mdzRFL3V5K0hFMHgwemVOUGw5eUhkcDEvaW04VGw0R3ZnSVJyempBbGxq?=
 =?utf-8?B?N1pXb1FtMFV4SkpNUGdHTUtGVklKY0xQSzBHNVRlNHU3eUtvNVVZQW9mQ2xS?=
 =?utf-8?B?SFdYbjkwRHRnR29tN2hQKzV0a0ovTS9VZjFtNmU2NEdaQ1VyOWdtMEpvR0xK?=
 =?utf-8?B?Q1FWa21qL2JRL1NVNktMUlNEcHoyMzg4MlQ4cDRkL1FuNUI2STFVNjM5d1Bh?=
 =?utf-8?B?a0dyclc4TWt5SWszdVR1TDlnSFBXMWc4QWFtellBZ3llU09oMU1neUhJVUt1?=
 =?utf-8?B?K0VvYXN1RHFLMHQ1UDRlOG1hR29tZXdOTHZ5YzdTTEdyVUNZRlQ3cWJ0TkVV?=
 =?utf-8?B?SHZKMkc4SlpGSWo4OHpiQndFRmJpUXBEdUYrTGNZQTI1d29CUmNlU0lVUFlC?=
 =?utf-8?B?VlFOQzNYYy90bmVUbXQ1NFJNczdETUNLSy9OVEIyS1FlMTJxZTUrbDBUbUg2?=
 =?utf-8?B?QTVHOEhFUlVZVENUckhQcnNuY1dMZFRIbS9GdTVZUEFQU2ViM1JOUnYxNERJ?=
 =?utf-8?B?VDZvY3REMzNpWks2ZEZvMGEvWHd3ZmN5UW5Ld0hGZU5UVnNMbnIweHJvWjZo?=
 =?utf-8?B?SzU1eVladmd1cnJHRW54bWlMMEZlMlBpVFVsSndsbWc2OFQrNi8vVGRINUcr?=
 =?utf-8?B?S0FlenRKa1V0ODI4RlNXUjFFMFpMQWMwbnovaEg2c3R5TWhHWVJZL2pSV1ZE?=
 =?utf-8?B?d2dpNy95Znc2OForbFYzSFlnZ3BOR2tpZzNrVk5vRUFUWkxTa0NQYzg2ZVcz?=
 =?utf-8?B?TVYvUy85N0RuSCtzNDBFbUhMb1Bsb2ttKzlxM0lock5sN3pTVXZ4UHFiV3dI?=
 =?utf-8?B?OVJpeHZNck5tdWtYekRjcWhJWjh6eHZVOEtLcXFMbXJXN0tHRjVvUzhOWk1i?=
 =?utf-8?B?ZFo1b1Rza2ZJOUN3K0NMQU5OWWI3UTZUWHpsNURzQWVSaU0vcVJvek54UVM2?=
 =?utf-8?B?OVVTTjhIRzNrQTFYWUJlaklKejM2RG5MVmNPOW1oTFBWUXNIRHZIak9PaTJ6?=
 =?utf-8?B?bDVSUHBHOTFVNG03OE5oakNLcmQ5bngyVExxdFZnWmRaYWRRNVg4aXIxYzZO?=
 =?utf-8?B?MVpTQnRMRVFOL09WNlRUeTVsVUhSRU5iYWJobmdiMUJGNUNrMGpkSVlLYmdX?=
 =?utf-8?B?dDJoQUhpV2FJcW5oQVdZV3AvazhDQ3BRZ3Q0MmxoSWthYU1nT04yVzhXdXlR?=
 =?utf-8?B?MkJmeTJTQnh6NzNEQldDOEhMaTFYdW1JdVN0U1lacWtHWDg1ci8ycXVRK1Rp?=
 =?utf-8?B?M2lBdmQrNktWZWFITUkzc3h6aERWU2ZoYzRBZXNoTHJmcHdmSXhoU1p4Slhy?=
 =?utf-8?Q?6xcq4V2/TICvyFq4qg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad48000f-2094-40e2-a511-08df13f08d94
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:46:39.9182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBS8PQMeQGnnd/kk0MrJ3CFZ1BbhyiA/JpiMJlt8dYuFsF71fJUZlEoFyRCUNdXa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934

On Mon, 14 Sep 2026 11:35:10 +0530, Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org> wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and if RSI ABI version call is supported, create an arm-rsi-dev
> SMCCC device. Convert the Arm CCA guest TSM provider to an SMCCC driver so
> it binds to that discovered RSI service and keeps module autoloading
> through the SMCCC device id table.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
