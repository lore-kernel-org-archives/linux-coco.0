Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10C44AB65
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945695; cv=fail; b=n6y+AY9fu9tTsWUILVrghLwnI4OQc+Xz63UXcwlyavBGVkOOxu/Kpv+ICPm51hpEN/xwPDwaTqNIhSi1+Eo75LJfCTdbKMExsXLi/lVq5T/2K+jHTkCRX1XQVI8M1GFDNFNnOdo0T3FSLP4lbw1JekoUhUI3goMq2ULfFNbo78s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945695; c=relaxed/simple;
	bh=vUI3oyLA5R+3Wo/FcVetBB8GVEkUvTDjGgtMKulqmfc=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=uMyngNQejnOYKZBNKwNTSo6uTo4vKVeVdeD0ErJ3h2BGUp2u6OoMbYLF4z5p+0d9QFmZ3sEPexV2yVU13Fag0HyrncUHr1LHll2Kwkur/Z4c4r9x78ieZGuFYLaUNcGZe2TxmZtV6xh2RBjtRoFUVaPl08ulhWPhyWeWQ84cD5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kSyIwKa0; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kSyIwKa0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXUpaI8RjCiChOksfQvAQPgyEayWeo0vUYKLyFapr4KqT+8jVYRgjncy7CHlIsyqPEchKfPG/9+u/Rn/hasO5nipvLECVlK6cDERmvROkXgWF+gqiwFrdg4Nq/BI5k9ywv0X1VsvUppV0pI1RkRJGfDHUTy9GiUOsIFdR21a8cytKRwkwtc2xVLiKGfGrFRlgshxPDHtSmRqyS49qfpDbkJdCV48Bu+ImcgGlcLHlZK8e1rDwX5w1Y21HjMYE/4IOZlT16ONc+pkG4n+p7yQGNsQI7if57xXCZvQxfQb7zgIR5otJqRXymA8xsZUT4egm7cRX93Mu6DlcOIPg1xiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr9YL5xuCFWkVvN5J0S2buKRHJf+ri697kFQH3Omvx8=;
 b=W8ZMyRwOapFBVYa5gPwWv9C0XducY52bgrGarPxDSk0I9r/JQG38DGWYSt1U79rkpCiGVWqWOppFpzczh/YZz88GglXC89AcbexauF7KVmCtpcxgdhv+L8d9s7zX+HrweizXx67G6ia1Z0eCH2vcgCU1GZhpcbvIvyIU/AHBPYhoArtW2HutOPOR9Ukc3nToDVRYRE480bo45yfD5epOCVxPWvqQbR4da6mcMA7770bL4b+e8FlSjiIiMMstpO8Ul/60rZ6ggqCMeIo+6YgXNexN8ESnK9sfrKaH6HxJQQzOXvMC080ehIv3WeBJktTB+O9CRbNxIAklKp37U81JnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr9YL5xuCFWkVvN5J0S2buKRHJf+ri697kFQH3Omvx8=;
 b=kSyIwKa0DN69trHW19/O4YRMQa0zpkCkF85gO4WQ4R4048dIzmLOB3CwiXJ/hdj/tUGuJZLjtDOZlyMD9PUjUzwM3mJM0aycb51c+TC1N0F829AXJsrFiJktsZ/N85pdIdRjXF4NODHiwl8QohbQH3wgX8iJN1WtIuRNkiqFQhcnkqEgc+ZwSmMZ+OcouJwDeYg8T/ylz1HvE+o+ZFRKGHKNPR3MLO7qj5NbIvSc2Y+YI3RheipaAOXQXGQbapgDdsc9L/Y9gHAAn6IDiupLVhubhegawPub96F4drFgt+eAy+Sn1Vcjdbrvy/7PSxBDi/1vQCjCtssPMEWg7e/K5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9608.namprd12.prod.outlook.com (2603:10b6:930:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:46 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
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
In-Reply-To: <20260805063255.1638614-8-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-8-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567780.4159892.18233907484320530327.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BLAPR03CA0154.namprd03.prod.outlook.com
 (2603:10b6:208:32f::28) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f13323f-7644-48f7-a602-08df053b673e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hx5FoENCFiQNaK2Z8iMWtqPJapauScnP3izGZMuWVRI/BWtsiX/NesuZ8Tc2UahSZrj1vXvKRrjW12QgR60rp8b5EKfGC8m2MQ/QMQzv+aUcAE2jaQeGuuIZhNg17noyFGy5U8fTrA8gCi8kabtdrM8V3b0JhJuX7a5OGvjBoyuT4Epc+fVSx5dxfpU914dEaDD33VfCmXxdsPZlWpVFXfc/PYb5DyttUkgrRhQY1aMYdFtnOid83r4fKMqsRwjwnHLvQifH8+MOuVFirxw+iYuyqd7x4HgS+Pye5rcQea9SiNsxuzjh4gdsCOqIqWhbdCH2fiDWW+UVcdKzslXsE+S5K0A6gqeIr8sgNOZDjA/xuQ2WRoTvrj2UcnrIbD/LCLjd2P+GxzX/kDy0Eb5ZnbMZUx5HcSPGxr0+gyQd/4VliwzTO5i9zqoEYTwTJhp0pFW/uj3t00ck5oqSpqfLxduQn1TPO7fuxLUJ8s3PaSl+Lv11+B+LjH8xvfvrDq7kVQTjTpAZwwuvb1KShht4DIHHUTlbLvJe//EJ4TX23rUxf+7taXPWgo2marzsV2T2ak/GHGbSP0kLzC9nlQW4NexDeKnO7SIQ0OaILzZOlNbkUoItPahcY4TwyzFiDO2ENQ5UnXrDs7SmL3mjYjofmkaiTMIYUAPfyAdfCDivZPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2NuM0diVUNGWGhtZ1I3ZnBxQklUdEdhT0kxQklpTzFLZ0lNQmZOREN6Zldr?=
 =?utf-8?B?TFRycVU2SEtwVFdPY3RaaGVjdTVOdlV4VnhhK1MxYnlGTGhNamRkV3BFRkc0?=
 =?utf-8?B?R3FNaHd3TE4zRE95V0dyckZQVGJxWnhUTERIUDVKUXZyRGszdE1iNzdxK0lG?=
 =?utf-8?B?WTVnUThLTTJuV004MC9xVTUxRDJBcEF2VXpYekZKR3pKQzlvVjkrSzJZTFhU?=
 =?utf-8?B?a0p6bTdCaEVNZWFYRmI4SmJKTnpoVStmTmt3cENCY2RCcEFnYUs5RVVNd3BZ?=
 =?utf-8?B?TlU5aWlYRTRzNlpMN3ZKM1BOK2ZvZjZyeWNPV0ZEazBqYnN5dGJXdEtFNHFj?=
 =?utf-8?B?aVh3d0RtYjYrWDU0SmNPT1VnS0FxL2NSNzlPb3pTSEpMS04xczVtbUdFK3BU?=
 =?utf-8?B?M2daRjNSVGs2WEhwYmV1WVJ0UkdFSC96R3Jib0NNUUxkUXdqQnFrQkZjcksv?=
 =?utf-8?B?ejh4NCtjNFJoUDhpNkpBQWhpSXJVa2swS0pSN2FmOTBIaFdYamVKZVhxdWVW?=
 =?utf-8?B?bHB2Vy9IbVRXbk1OTlQ4cEVQcW0wa3hkbmdKei9mc0hkRXpkVXlDZGZMY0lq?=
 =?utf-8?B?RlBtWGcxZUZqcXViTjR0REQxd1cvQmZDZ0Y3aU5oOVJsbC96VWlmZ0p2cVRV?=
 =?utf-8?B?U3VLdFNqbm5LeGpUazJuZDF0V1lCMmdLY3pjc2tNcFhlVVV6c3Iwd0t0ZFNM?=
 =?utf-8?B?Q2N1ejZIK1o3cXIvdFBXd200dHo5amhoc1lvQ2NtTDRYUUJDVlJsZlZ5TGFG?=
 =?utf-8?B?TkFMK0V1WmRGcS9tazN2cWRGVGVONHJ5OFpTVWFDSDNyTEZyeUZiUnlKL0xW?=
 =?utf-8?B?RjcvR2pIcHVhaWpoajRVYzg5MzJKM1J1YUROc1I1UFlNc3NQY1E2MEhtL3g2?=
 =?utf-8?B?ZTZCTmNUMzBPSDE2cG96ZzI5SzI3TlVWbnRtb2VxTkxveGVJZGFmSUxrL3VZ?=
 =?utf-8?B?RUJoMGJzdWRtTHFNcGxUak9VajBaMkR2MjN4SXhRS1hoRWlwRGlxNU9KdlY2?=
 =?utf-8?B?L1dDM3F3Z3FCdWhyTjlhbDErNVU0Rm1LL3JNR09WbmNST29xZkk3amZBS3VQ?=
 =?utf-8?B?TU11V3dJbXFHUmQ5RFZML3NXZzRSQkVVWS9rUGl5QXNuWU5lcFNzZHVZajhY?=
 =?utf-8?B?c2xnMksxaFQyT2VVRUZLS0ZGTXg3N1hrWmNnQVBPZVhuTmRvd2Z1cXVlWnhw?=
 =?utf-8?B?SThESDhuVFp3ZlIyeFBkVzZKUksza1J2QzlNdmpGQnhKOHNtNFN2a2FHMFY5?=
 =?utf-8?B?U2MxNjc5VW4zSUFoZzdTN3ZCTkhDZ09hS0FMb3JnMk90RDBaOTBmMVErYjNs?=
 =?utf-8?B?cXMrZ1c1aGZKSFBnamR2WktYNUhPU0NLNTZldEJFWkxsZkRJYy8yeXEwbUU0?=
 =?utf-8?B?ZHlZc2tvRStqbjBYUjJJU1ZsR2w1bFBiYnNqUk00ZWxSQjRaaGdGQXRNdGRv?=
 =?utf-8?B?S1pYam0xZXcwT3NEMllEWnllMXAzL3VWa25rWFd1S3BJZkRGSmdxaDBVbExa?=
 =?utf-8?B?eDhFaytxOXM0TE9LUzB0aFhpdUprQU05cnRWa2hPdzhyWEUrRjRQRndHekdW?=
 =?utf-8?B?ZEVZQ0FtNGdQZWdEbWtuVE5LeTE5ZnFKK3hIbmx5TzVrejBVWW9QUzduVEI1?=
 =?utf-8?B?ejlwRE9mUXI0TFh4L2FDclA5QkRoQXRFUnhhMWVqVXdkZ3d1MXY5M1Znb2Nj?=
 =?utf-8?B?L0hTYWc3dWU3STE0KzJLenZTY2cyemkwZU42Rkk0Ris1cDhDb1pzTmllTENF?=
 =?utf-8?B?bVFBUU5HWDkvMGVPSUlBU01oMGM4azl6L0NGVEtXOWZ1dVI0NnRndEVtNjlJ?=
 =?utf-8?B?ckJVVG40Vys2eVNoYXJJNVovTHA3Y01OSjFRZ0dZYmVpVlZkM0VsYU85WDNm?=
 =?utf-8?B?LzNuMGtCK0xyWDJGb2xvOGZqWFhVYVZGUnpVaGN2RFVNYkdKZmtoUm0zR21Z?=
 =?utf-8?B?YXplUStMaHVhK0tEUUtDTXppT0JXVmJCOUliWW1VNnVUMHpNZVlBTzYrb2h5?=
 =?utf-8?B?NzhBZXB6eFdZQ1lyTnF3OExrQWlhalRrMkcvL1V3alVZWVNtQ0Rhbk0wUlZS?=
 =?utf-8?B?LzV5b2NXZGtCUERISDVsdHJ2eDB6clhaNWd5RDVVbEJZd1NwOG1jbVRadDVY?=
 =?utf-8?B?clZsUHRINm5Sc1pyWnhDTzBhUUpFZlhtSWFxd3FVMG45TXkzV3hrNjg4Ny9m?=
 =?utf-8?B?UGZRR1BQaDVTSXNyTE5JdXMwU3BONENSakRQMW80QnQyQWJpY3Z1WnYxbXBR?=
 =?utf-8?B?RmhHZm1QVnh0WktUWFpZazVZSGVhcFY1OXpKQUJlS2dHcTNXOUt6NkZybnpG?=
 =?utf-8?Q?qitMgGaisRu0z8YFPq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f13323f-7644-48f7-a602-08df053b673e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:41.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKZfTbwbruvkx1k24Hp9gWLtwDbPeHzBqdfXRKTJwDMHa8cy9yqx2PLXn2g6I+E4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9608

> [ ... 10 lines skipped ... ]
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.

Is this the case? the uv code is blocked by:

	if (!test_facility(158))
		return 0;

Which AI is telling me means the FW supports "ultravisor", so I think
that would be broadly equivilent on ARM to FW supporting RMM.

ie don't create a firmware/cca unconditionally, look for some sign
that RMM is present first?

The rest makes sense to me.

-- 
Jason
