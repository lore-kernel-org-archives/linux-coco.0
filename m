Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C944483B4
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945703; cv=fail; b=QBrL1zkfD3h22GGQccrtUwP+YecGqxK3ukOhjXhtuYmOiXh4/6SZZq7hFeW206+3PAptahAsWMK0EdYlID5f3ndHjB0oQJC7C+5BBpl/P2wjLAmw51FXDoQvDUgycGpAF1XS2hd1FI+NsTs2p8cuARnk+5z0uf1/15M783FHcMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945703; c=relaxed/simple;
	bh=D3Z34DDY2Umo9IVowPq+1Y78O37TEL7Ff2DDCIUfP7M=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=AgFXEm2MtgUtXnR0yiwBTnf4v39Ag+JqFzB+Z4t8d7+Hk3LfMDT/v9BbAsZYuSqm8Rfs2eavPm+2UPeklHKOwrQS+QLmh0YvdyYpkx8VXTZSvUvFv1yEiN7S7NF7Zv4mmyRaND51y0p+3miiGA23IPd5Atu1GyfkX9J7YhqMhHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nrx4zpPN; arc=fail smtp.client-ip=52.101.85.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nrx4zpPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrdSOOpgtEwJx4kZ1+NDJKCFFpew4xgahHAcAxSaMu/+UJKbhAc2M/eUxHxJkBTwnU/TqNvlsdRgDIOfwdL7zM6BNcbYTiBby/Vu17UkjRU8YSGo85sAAo4Zrp9qny5gXtn5PZ6l7QevOvd/6Zxk8rXehHvO8sYcbMfR6z5SE+6elHosm633YOK9bPXA68fvSmn93aXSmCKMyVV/666jJzF5QDQgVu8KY38Tl1d3uPs1Zt0+h1v3tBxb1spcUfLSwU7iZdb0FVVHx4dOA/l0Pr9bH//di1/G61KBmzpE+7ggufr0o6D3PQX6TK7/RBvEDT/SExKrd5zYR+j3iRkoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJB58O4xTCJZi1/nnmGOzoM+vh7snkWAFHDMVKHY8YY=;
 b=DeYKwFl9jPd5cHIWqAPEv8/5kbUscmfvvKfU/1z1diTZCtZZteTc4NUYgCsVvl70o9u0NaY/A7CZ6OOSAH0T1Ta2kAsyNkJJXi8AZWsWZ9Z4/wTlPbgKmMYG/DcutNAczwYT/Y6zkN380/oT2OriA/1YX3O6KlVFBxL3bDjqgGS7mbNbDli4IT2dVmkUUuo0oWHUWtmzKKrvN8zhZGpnbIwt3IDHn0QmMLmfqXiizzT4Ya1ZjZaNONTopWiVgcWO03ekZz/DwOMltDmUtWaEHyZ+MTIkt9Pkm7TNPRg9Zs14T0GV5RV1BG6eeVZZjBnbhvUwI0UhLcxQFgPWaDmOgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJB58O4xTCJZi1/nnmGOzoM+vh7snkWAFHDMVKHY8YY=;
 b=Nrx4zpPNt/pU//qAtp4ndawJECH3SlLxiGIrklL/kR/CZ+ARs36jG/pFgc6I0dXsNacMYxSr3cihdh5q3S8tGeXfeXDbxadd+58XSjkyNKvcaQ8XTzwCNi2Q4cAtmw+P5+tFuSIXvVV+y2OOHmWtmM2ALyijFaTggIn3OuCxzDrQvk29O3oaZRRIo8QasYfnkt05R2v9L3SPUWCKJvKfLS81o7h3sxSPqvOyWg46sX+mMsFO2X6FME5lVQ+Dd/lJo3vG/155RJJpAcEMp4sQITbp2f35CulJOfqAiEDFYacci7Sn6GOrhm/6dufsPg1zg5YHPopkSyJs80HOI7Gi1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:53 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
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
 Andre Przywara <andre.przywara@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
In-Reply-To: <20260805063255.1638614-2-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567779.4159892.8785590655735217125.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BLAPR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:208:32f::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7defe8-445d-4242-a16b-08df053b689e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uH754e/xftqHXB+QJ8WGAbXZQicRyxOYMB7NtZx9WYIwkw+nG5As9YIgW28Zl6shoXZy1/2b1YFUtWxOtxVREs4B57NnEVf9LAWAh8cInaM4qVTrEKFOY7Gjm2IEYK5g3gEe7FPOBYy0pvMxe6QGtMApYdT+fFQOLzLEEmMF/gWkPp79Crr8nUOtNgLJEDqX9ceS6VR8Jl0gtyAjYx/VLhicn8xkL3RdRrnCcSZN7VuamDgjg1CrHHtWGMAW3Nu0joIGOhnu4yCye+bGDK3iA+R8dB8u+7baYmqecjdg8OyEsux/yUQFZgkDAW1KFY5AbS8utR64IFXCJkcLW5PXI9GJD/NUq7gA1dIE06LC2PNCiK/DI75i7kABSLt48yJEk+mvfLNSE7JhMhy410cxssHiju96zRIKpNSQDFqw/3TqcW4eIPvh69o4dFUdcb/FX28z9RRt7D2PA1IQBm4LRDXo9lIUXPAl0kVNN57ChQsK2NVaVKFu2YU0M8MmAOD4P9PUOOw4UX1+j/iELr2KjvHsUk59FdR5QDj6js5QgNnWmPetUEmLEn/QMs46fbEBxNQTMq5hVg892T7brhp217Q7zcFPUvxsG7s/2C6ygsnHi0z9LAyNSfr2UlDxCzpJtbhOLhro9sqdEJaCxztp/jVlzIT2cw0bKjTzBe+maxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXBWNWh5d2MyNUxHVWFKZnZsTEJFekZUbW5xWHZpRXZVcTRSWExNRkd3UE1u?=
 =?utf-8?B?bW91Z2NhZ1Rhait4dlJrQ05NQzdmWDRPTW5nZjBObGlTeVN4QWJjQXl3QWZq?=
 =?utf-8?B?NW9xdHRhWlpiazNSd3hxczlVdVRpdHA3cFh4bHAzN216aUk1UitJVjNJb2JB?=
 =?utf-8?B?RVpnWjQvcGdVSFlCb0tyOVpISXpUeGdXc3NZcnRSdzh3YlhPaGpZZjlXcXJP?=
 =?utf-8?B?RE4rMDh6amVrQmpxMlRDM25aQ1R2NlgzVGVFT1FnTzM3TXFyYnFoRStCamdB?=
 =?utf-8?B?R0ZzNFVNdnB3cEFKa0RNbWt1YitZL3JKOXMwZzVDRzhaZlovWFJUMDVPdW5F?=
 =?utf-8?B?U2dSSHZ1OFc3YjNpeSsyemlsTXVja0M5QnN6Q0VUOGpqSTRHbU5TNEFYNlB2?=
 =?utf-8?B?Y0V2MENCM1dFRGtRVFdsTTNDdWFhNUI2cGhSTDFBZjh2cFF1TnpKN29Kb2V5?=
 =?utf-8?B?NjFoMWtkbGNjQlFHbUROME9LcHpQRDVaZHFvNjBCZnZBZkxxRWlZaW9La1lW?=
 =?utf-8?B?WHJFQmZuM3lkd3dJdXdpZmpkZi8vYmhETHppblAwTkE0K29hTGw3U2RLSDk3?=
 =?utf-8?B?ZnpJdDFkbzNiQUg3eXlDOVIxdWZhS0tGQ0pNVmlrZHovK0JrYXlFMU9UdGZW?=
 =?utf-8?B?SmJHQnp4elNMUElFcVdOSVFFTHE3V1lIRjVsV243anRvdzhPV1F6SWNoVzBa?=
 =?utf-8?B?NkNjRXY5QWdDamdvUjZMZm54L2d3UXhQK3Mxd1hRTDVERENOOElqb3pZZ01z?=
 =?utf-8?B?OHFhTGVqK0E0eGRVSjNReFROVmFMb3NUUGQzdmo4Wm9pSk1Lb1NPK1dOVFdO?=
 =?utf-8?B?cHVOZVlPZUZnbFFqTkZmSGdQMnRveXoxMnFpNzMwdVg4ZnBGRDJWbGVadkZZ?=
 =?utf-8?B?cVhsK2NvbXFlanVYcDFWNnhmWmVsaG5XenoxbnFuR2UrczVDRmtJMnRNU3FP?=
 =?utf-8?B?eGlHeEw1YUxkTzhPUGRBT0o1QzRkdDVIc3k5K0JQckJ3N3NlbXZkWmhBNFJK?=
 =?utf-8?B?QURILzFsc2xSVXMwWi80dFF6YTluZ08zZWZ0OWp1OFh5WGFnVWMvbCtDUjJI?=
 =?utf-8?B?SXdncTVZMjVjRHpsM0NrZWpBMW5MQkw5c0Z1aXhFOFRTT3IxM0VPK1RneTl6?=
 =?utf-8?B?WEdjR0xMaG1YYS9ZSHVIL3hsNTUyL25pS1p6TGc3WjFzL3o2eXg3emdsOWFZ?=
 =?utf-8?B?VmlPZE1ueUt1Z1JYdW8xbnJwTFBkekc3UEtrdm0vTGZTN080Qld3bVh1US9w?=
 =?utf-8?B?WEYrUklQMW1yQk5tdFBVbmNXM0lSVml0Ulp3dDV2T2IyclB1MUxVSE1WMWsx?=
 =?utf-8?B?aHFuK2txT1NhUGMzSFRtNnpTMXZsZkw1b3lkRTJiR2p6SnRvQ21WNmhiKzRy?=
 =?utf-8?B?SDUxMFB3WVVGSVU4ekQxV1ZQNEtldW1pRmJlcWNmam45VEIzZmQ4emk0K3hY?=
 =?utf-8?B?RVZyY1NSVm9OL1VaN0lXVzhlVHN2NENmNGdyRUUyV3Y1ODVSSklXTlBBcjhE?=
 =?utf-8?B?UTdqeFNTdWRSQ3ZqblJNOUtYcFdMVXJWaGhDVWhGRC9LSC9RS0daUExHdldX?=
 =?utf-8?B?R1Q5WWhKRldGOFNuVWk0RFluM2NwMTJ1RFBOZkJTUU45YmpYTldMRjZ4YTA4?=
 =?utf-8?B?OE5ld21aVHdhYXJZOHUxQmVDUjNmYWlCcHp6UnNBeGpDQ3VNNWUyektIdmZs?=
 =?utf-8?B?WVg1TGtBL3NVbTRZVVduTjdmcmgwTDYxRVVELzgwVUZnalpwSm8xZHRjWjdy?=
 =?utf-8?B?a1ltcEgvZUEvMzNtTSszMEVzZWtWdXRFMXB3SVhTRjE1WWVQd2FERXk0YXVv?=
 =?utf-8?B?UGkxTXpPamVQRFBrQXhvTjArT1o4cFJ0NnVGazFqWGhXUHpBZGgrYVJ1SjRq?=
 =?utf-8?B?T2w2dXZiSXFZdTJQVURVa3Z4MldrQ3ltbTk4MXpnZ0todUQ3dytmUVN6U21x?=
 =?utf-8?B?ekF0cmVrTm5GdnZGdTNtekRnV2NOaDdoZGV1TEpPelhCLzJhYmNBRDFVMnpU?=
 =?utf-8?B?MUZpY3k1ZnF4UG5Gemh1UEhYOEw4SEU1SGJYaHE5SmRUdjRnaERxS0ZON1Bt?=
 =?utf-8?B?QXRsSktGbW9lZ29BWkM1Tk1iWGY5RHkvUE4zTTQxcUpvRnVuVC9USFJtdHhD?=
 =?utf-8?B?ZW0vR1doY0Ivb2hIbXBlZUZjZ3NuVEdjN3pqalRlQm5mS3ZiVWpNUkdqc3lH?=
 =?utf-8?B?ZmVJZE5JY2pORCtnZlE4M25xOVlvSE5WSXNTRW5OUDhlWFIvb1EzSW9EVHRt?=
 =?utf-8?B?ZHRqcUE5VXRzWWZYT1Zqa0h3d2tKOVY5R0N2Q1l3cVovbDlRMTdXZVZRSnpE?=
 =?utf-8?Q?aZ04y7lZ3sc3tD6tF/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7defe8-445d-4242-a16b-08df053b689e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:44.7559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cq/bUflSLOcaURCgoFzytaTf3oD9LiSzjMuTExqcW/ltX9Pc4YjiCI7CiYEdM+D3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066

> [ ... 143 lines skipped ... ]
> +struct arm_smccc_device *arm_smccc_device_register(const char *name)
> +{
> +	int id, ret;
> +	struct arm_smccc_device *smccc_dev;
> +
> +	if (!name)
> +		return ERR_PTR(-EINVAL);
> +
> +	id = ida_alloc_min(&arm_smccc_bus_id, 1, GFP_KERNEL);
> +	if (id < 0)
> +		return ERR_PTR(id);
> +
> +	smccc_dev = kzalloc_obj(*smccc_dev);
> +	if (!smccc_dev) {
> +		ida_free(&arm_smccc_bus_id, id);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	smccc_dev->id = id;
> +	if (strscpy(smccc_dev->name, name) < 0) {
> +		kfree(smccc_dev);
> +		ida_free(&arm_smccc_bus_id, id);
> +		return ERR_PTR(-EINVAL);
> +	}
> +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> +	smccc_dev->dev.release = arm_smccc_release_device;
> +
> +	ret = dev_set_name(&smccc_dev->dev, "%s-%d", smccc_dev->name, id);

The bus seems well constructed, but this is a little bit odd, was it
deliberate?

For identifying the module alias and labeling the bus devices it is
typical to use a fixed HW value, because it tends to turn into
uAPI. So the hex func_id would have been a logical choice:

		.func_id        = SMC_RSI_ABI_VERSION,

Ie 0xc4000190 as the device label.

For example lets imagine that ARM defines a call to give a list of
(func_id, version) for everything the FW supports. This would be
great, then no need to probe every item in the table anymore. However
if you define strings here then it doesn't work so well, the string
table all has to be built in..

Though handling ARM's version scheme could be tricky.

Not opposed to this, but think about it carefully since this is
basically making a uABI decision that probably cannot be taken back.
comment about that above the table at least.

What is this idr and name mangling doing? The names have to
be unique because they are 1:1 with func_id, which must be unique by
how SMCCC works, so what is the purpose of the IDR?

Now instead of getting a machine stable device name like c4000190 or
even arm-rsi-dev we get arm-rsi-dev.X where X is unpredictable and
might change on kernel upgrades. That's not cool.

smccc_dev->id isn't used for anything else. Drop it?

> [ ... 47 lines skipped ... ]
> +struct arm_smccc_device {
> +	int id;
> +	char name[ARM_SMCCC_NAME_SIZE];
> +	struct device dev;
> +};

It is common practice to put the containing struct at the top and is a
micro optimization since container_of becomes a NOP. Same for the
driver below.

Why have two copies of name? dev->name is already enough?

-- 
Jason
