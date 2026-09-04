Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD33D51FCBE
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550825; cv=fail; b=TJhQax+dfRKYOaqO7s3JCaR43b+6EFvPaHmwqz3m2oJAjZhEQ6C2YmUpFyxm5mE2vZFX/nnjGclih44LE65mDfZCzWF6p45lkv00trSzFat3Eggm3DJzXLxIc6Iwbxq0OFTfmAmZYeMe0LIeFGOlNkavdglxW2/JJTkyaqG6Yl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550825; c=relaxed/simple;
	bh=eRTtlx2YeA9CkEGQj8efjdH2S2NfAw0JQsCzsLfZaCo=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=lkb4iW2vrhqkiCIlak8HA2I/d4lvxSGwLpQrJZ5evmQkPvNP64U0gj8YvTJAzXu0z+Z4pdgnd1kPYdBwYMLgdRJ0/jhKhihB1ZBwWhQJ7jdDCH+5SWAsU5LoQtXuLhDBQIZEW4XLDfFuHoDS9DdXsoEX43n7Dz3XOyQYxmxpZyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZTN3ptwl; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZTN3ptwl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDSU4qhs+FXoeMX+1Q+PoAZtvMrPpXTTFmSXkPdfd6Qo9sQPLRpGhFvwn2X8i8eV5b/2GDwPMnczPrGbJggB22fXLiWpQGdj4R2lxJhMAJEUFSuv4rEMxgK0hINWs3K3NOM60VmRgYg1Tgo9xGRqdOQbpy831WJPTY7S/A93LfSeeVEZWJiofLCa472rkCecU6AcdN7o+NvhDczxFcDhSmY1JLKlj6+IMxtwyvrePq+c+DGBr389w2bps1WRgTHxAZY5UNkSxpCsuv9w9Kh2sk5IM8+iU/pkj5WNmfHnBiWyaXR4arVGdZmJK7DkID6OO6asrd3WIa22xjXSZJ37eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9acMI+RrMOA8tN7H+yu7HZJrQAU2dxezUEMTGLWMUc=;
 b=lvNYZ7Xjo2jTGKaTTebEidfolzBDY7avwfhttrGzxhglO9mYKs1DwiqPTJ24ps7kH9G0Cl7LVXK5wY2EH6QQS7hK9KbfjfRoObAPaHp+Wi+sz++mvkJyzJj3Hh3tG5Z+xfZy6FTiEFhAVldXQL42g0Z3O2VDCikHaX/TMZumqf7PR2/0aBXydFxrBqXm8UbOnkgbdJhQsuJEhpQ3G26uwxxkdbUAWcblBW6dwUXvxjPf3CFyIhbKf0ppYaumMoCeFo0hksDg3btkktHzK/5D45T98vh5goMK5lckwTeo/dbghMWuxIaE5dgHAiqRufTOFHpvoXsV98apR5MfjrypuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9acMI+RrMOA8tN7H+yu7HZJrQAU2dxezUEMTGLWMUc=;
 b=ZTN3ptwlFclDlwbaMUosS8HWodoNIB7hN4P6po1Pf45TVFIc/OayF6/+x4EHqG4K6s7OaE2vPLJH4iPY161TlXoBebN6PIkMiCn8Jq0hCvvk4PNuoEDWHzF2/oDHIf4TNwsYq8DJekqXbGJhRRyYfVL97fXB0OWrO6oosonhm6AYirOSYC2H9UCOfZ1jWUMWBQfhZw8PRNxe20fPek0ZhAwM/9QEvQfyJuxmcxvpzAQO1QIVP+H1M/TDPwCRFRVRIQrmiMpSBztIMUKvXNSiu7piKH2qm6J1JnPM7Yd9fpUmt8ItQQGMDkodCSpS+tpj1QY3JlQsddBt7hz3HOwI7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
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
In-Reply-To: <20260904095000.1184861-6-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-6-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077570.693280.8967787043187042.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7bcc1e-e649-471f-39aa-08df0abc42f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	rlvl10W/Ug8xH3yiskHcZPvV23Tqun+Fm0s0x6VcWvsyJ0oeFBbO852zhr1vhB6z/QdDAUJviCKgWoZPMaKTYFHQLn10ZY87JjupQdkzPw2aoCaBofJ+Yn2D6siCTAmEHteHww6hvhPzXg9qjmEobMoxIS++blusQZCocGg1i6fUxhlNfEgnxVuUFLUlKl7U5iTvti1SYLm9b1l14qzlYXRQ6oVjrY4Jz9PgSu+EO3muFy3vEDJP+m9euddkt0zwIl/rUD0EIzdPOKA1svo+dbbTr1liznBZvlQQ5UXQNBjhfjuP1Ivnm2GD+ypfCQP67OrrhnQUglcf74QrpwXDW8WeLAhYl4B8pQPlLf/d0SjVSe22I06pk45cSQF3o/TySgR3/BHJtEXUoi8Ut9pjxy3RrHNOSR2hmCiCEO2Tze+wg1JYXgi8xtLEb01kpkOAWyM+i4U/QDgMXTZy3vBg9JCUbTi4TdrMiHMO2LMzOXWR1uh8GQqfFgN8GPCgK+1O4W4llmiIwF6zvpP2QzbDh519k78KAdO6GK0k7kG1WimQOUS5a2KRxi/nfrsMXmECW5VDJWrGKwizVGG84qByYSTnX3hI+dZstvEs36/IJMmcslD1/6587S0D0//fN6F2WybJHdlSVuAXxf0HE5VKOThpmK2sHjDdCJjpfgrEzOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vy9DbCtTRU1pM1lnby9zY0pmbHZVQ0JLNWxOcXBPUTZVakUrUTZoNy9rR2cv?=
 =?utf-8?B?TzVja3Zod0ZSUk5yK2tEUFNoWklwa2doSmV1YmRNL1VOaCsxRjBxcVBtcjN0?=
 =?utf-8?B?ZFNEL3ZjeUsxOTIreVBDbEhTa2dxaHFNZ3dlbGVGOUkwY1lzSUgvOWpxSEZO?=
 =?utf-8?B?VnNzNWhQVG1mRXBoekR5OVRKYkNVaVhpRjZIT1Y0V1VReUpmSlk4aWxXYVBI?=
 =?utf-8?B?QTE2T1FmdlQ4UjJnR2swbnp0QkFwYjhWaHgvRTJvdFpBM1VZV05hdFVQNms1?=
 =?utf-8?B?NW9CbS9VVUVPcStyU3R4N2MrR2ZPZGNTOTdUWlRpUHRGWDlDWC9iZC9aUzFx?=
 =?utf-8?B?Mmd2cVQvSFlyQzlVME5hSW43TTdObzM2U0pWNDE5TU9UZEUwYnk1Q3RXQlNK?=
 =?utf-8?B?bDFqd0lhb09pUktnclF4T25WVzhiT0NoOFdON1VCT3cvRThvdXkxcjZYS2Nt?=
 =?utf-8?B?bjdOY2F4OVRIdGF0cGVld3RaZXVFeXNRZUpQWlAzSks5WEpWM3I0S3hCTTAz?=
 =?utf-8?B?QWhLdHI2RlhCVktNQ28zVis2dW5GUDBKekszR3lpT3cxbDlTSDZ1c2hnVVZF?=
 =?utf-8?B?U3VtZVR4NnpqaWQ2NFdMdFpoOVpaSXJ1a3lvVVdVaDh4STNkUmZpUGVwR05E?=
 =?utf-8?B?YVNDQzlTZGgxV2ppcVJUdGpsbXdMV2FGSTMvOXVxWjJieGpxaGlUYnVYMkls?=
 =?utf-8?B?RzdwanJqbjB2Ukg4U3czRmQ5SEtCVzBCQlNFRHRRQkR3TktoVEFyS2VNNW9N?=
 =?utf-8?B?Y1dXSUJTSWNTaENXSEZzbEhteFB2c3B4bHN0TXFmVGg5K3BpbTA0b2ZKTTJ4?=
 =?utf-8?B?N2lzMGF4OWRGaVdHTHkzWkFZMWltUFJjRkVKSGxhMkNDWWRkL0kvRi93WkxY?=
 =?utf-8?B?bHZmNHlzclJxZWxWNk45dk5xY1EzTkcvUG5iT3lvaVVITE9WQWFib1MyZFor?=
 =?utf-8?B?dVFXRDJwTHJ4VEZkVGs4dm9yS2N4bGhnL1RnU3VaVVJpWjVWRXJBUndnSks3?=
 =?utf-8?B?bDlyVnEzOHRVTDNZSENYckU5TWMzODZqRnl0enJ2QjZTN0FJYUpDa1ZMcmlr?=
 =?utf-8?B?UXRCUHgxc05DWTVQc2dYbWFVV0Nna0RWVS9lUUg1T0tLR2lwL1hCR29rSEMv?=
 =?utf-8?B?VkNuTGRtTFI5eC9LRWJRbFRUdVBSVWFVYTZTb2Z0NWd3QnJwekg3ZnVBWWtV?=
 =?utf-8?B?cGttYWVJRWpXdzVvVUpqaTVQWXJIWEZoT3Y1emxlVE9HM3Rac0RKcCtRU2xD?=
 =?utf-8?B?Z2JOaVNHU1hwUjRrZWNQSGN0SGhaNzZIQXZUdlhmSDdJREFVWlJqSENvQXZM?=
 =?utf-8?B?M0R3YjJqcHMzVUVTbnRmU2JOWXBwNUJnak44TXArN3Nzbk5pa1pGTEF5UUtm?=
 =?utf-8?B?QXc1M2F6Z25BeTF3VmxCZnplWXhqKzU2ZXU1V2lWeXhDbzhidm1OZndpN1Zh?=
 =?utf-8?B?ZmpIalMxa3dNWjNaWjMzWDNmTWwzTVlIYXRienEzbnpMOEVwUkhTbUQzZ3NV?=
 =?utf-8?B?cjQ0ekthc0g5S2gzK09JeGJYcFdqOWFNREdlOE1zQzhwSTdJZXpkQWhpR20r?=
 =?utf-8?B?MUxwbEVldk9lMUk4Q2RENDJYcEpkT0JkcDEyRzBmeFkvVnVNa1lrV3JEb2Jq?=
 =?utf-8?B?amRJbVRNMzY1WEd0VmxHRjVLbVhGczZNVUhIRkJWNFJEL0ZPYjVWR2J6dnpo?=
 =?utf-8?B?S2crdEhjbklkY3BJcXRZdmlIZFY0NjY1YjdhWk9rUDkwWm9KUGltOHNDWTIy?=
 =?utf-8?B?enlOaWpKRk00UXB6b1pmOG1QU0lxQ29rSlprcnZ1YUdra29RZXp5ZjI1TkNN?=
 =?utf-8?B?S1ZIWVNYb29jZGdua3Q1NDJrcHZvYzhXZk1ZWlJHMmY4TVB0WmJmRWJ2SjZa?=
 =?utf-8?B?aThBVTJpYnlnZHV2QWFqVTRmNG1ObWtib1dHaWVTRXlvYXUyV1NWaDRtT0N0?=
 =?utf-8?B?dHpqbmVZSGYvRUZucURtZUlCSnh1a0NUcFd5azZ5amx0QkpCR3FzQk5FZjVR?=
 =?utf-8?B?cmJHK01obUFUZVVFQzNPajdCWGtKKzZZNFNwaW00ZStYRHd0RXkwb1pUM2lF?=
 =?utf-8?B?RlpjM1VqclVJTldmRDYxVVNTNXU1RndEcFRDeitUemdBVUhtUGRQYmpLNk40?=
 =?utf-8?B?bzhWejg1QVpjYkpETjFUL2NOdldIN0dXL2Y2bUVSRFpXSUhRVE5tR21jMVdK?=
 =?utf-8?B?blFCUkk4b3NmRWJsUm02YXg0R0VwRlFsN1NoUVRRT0dkOVFpclhsZkpZenJ2?=
 =?utf-8?B?emJxZndxK21QeFN1NjZUV2lvM2pNdFY2S2tGTlpwUzRITHRaVzdJN0pjd1Nu?=
 =?utf-8?Q?A+jQyMzQ2kcWF29D1x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7bcc1e-e649-471f-39aa-08df0abc42f4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:40.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Xr6S7uQhrOzge+kUWmteZM6zaf5WSKSxTh3ykU13jhQUQ8y9U0E23Ger+jxrU6v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.

It doesn't matter but I would have described this as:

If a module is comprised of a single .c file with the same name as the
module then kbuild does not permit adding any more .c files to the
module. Rename arm-cca-guest.c to main.c so more source files can be
added.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> [ ... 19 lines skipped ... ]
> @@ -156,7 +156,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }

    [Severity: High]
    This isn't a bug introduced by this patch, but while reviewing the renamed
    arm_cca_report_new() function, I noticed a potential out-of-bounds read
    involving the RMM response length.

    Does this code properly validate the length returned by the Realm Management
    Monitor (RMM) before copying data?

    In arm_cca_attestation_continue(), the untrusted length returned by the RMM
    is unconditionally added to info->offset:

	info->offset += len;

    If a buggy or compromised RMM returns an unexpectedly large length,
    info.offset can exceed RSI_GRANULE_SIZE (4096 bytes). The loop in
    arm_cca_report_new() will terminate since info.offset < RSI_GRANULE_SIZE
    becomes false, but as long as token_size + info.offset <= max_size, it
    executes this copy:

	memcpy(&token[token_size], buf, info.offset);

    Since buf is allocated to be exactly RSI_GRANULE_SIZE bytes, using an
    unvalidated info.offset here results in an out-of-bounds read from buf.

    Could this leak adjacent kernel heap memory into the attestation token
    that is returned to userspace?

This seems like something that should be fixed independently for
robustness.

-- 
Jason
