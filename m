Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01102882AB
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138793; cv=fail; b=aq4gVhHEbmE+47p8ZFcLh7Nw8bNz1JKX0N12vO7SySdZhNU2uzOYGVHERwrfO9Cyzn7W1LNC1QSIsJqfWrlfGpq34SDofP0ABySASA/p6ua/r4yMOdkru/4vwBC78dmwkkTm8Tc6vhuzYlEe6fFiHJdtBmu0z7dKeFhfTN6EqEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138793; c=relaxed/simple;
	bh=F/HVavIQ++hd07cAFAIJHc666uhRZsht7AB1yGezZTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IzvgdhzxCigZJuD3Jbr7XzGyPbAYlWfCSAqEHfPGI26u0bOtK2DD2gU9AdD6fAHuvMQsvMaY7yLSKP7yyaIbqDEj2LJ8rsn7tGXBEwrbzxP1loOkteA4nY8YKnTVcIusXnMrmVESA/QL40yMkJy1FHrPEwwY5UKJTwULit5XI5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rCKaLDyo; arc=fail smtp.client-ip=40.107.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rCKaLDyo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2zv2jnsxsr5CgxGi1TIuO3boRQ2lv2YSchBd79syRnUimSLYoCrznIAn6lstZ+P20mBmCK5YKmQn+0ulufVv1ayYTdA0j4eZFrQKxVaFQlrXlpN7qdlMeSF7nGY7PgsFLrosap/S26+4Ize2UGNIWNUvKYNMN5rP/keNoo27kmePCqY9uLuPD/Z99rQKd4U/66PTne7+ER60bQAVvbh3a9Grb34+8P+4h014so3VlVkeRwoCVFSWJsm1USkn15eHwXCk4GQCd1u0O2D8ACTso9zeExCuyitQYco0gpFXXD4oh8U4/LzETiYUM3Njoeu71ZWsad2WKDhSAeRSXBNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhYashYqXBZM4hCf8HvTWUylX2+MjdwuDny3pRHKLbI=;
 b=FZ1gVAVrFklW43bcJe5dvaSfiEukCrNFwP6fa/YJQuNFiiN7hBvlqM+JMWHSQetJh7m4c8cgzmcFxtoPspGGEA++niS7j43xpiJ4FuGYeME42hqTPfojZ7Dg69GBVsZtQ2D8MN4DH+/xCZVRXwTNaI8h5xPtr88bRN27aZUazpTzJKzxviKrnFKYmHjKgS34OjQJjD4iq09/s/zHBRDqUysyLejpx5sy5SXqwZrnGghRQOT3l41vPvFliCB8VZPs9q+CLejbT8oyLVdjc/73kXb0Y/0A4cSNus0D+rQWDbgb5qWpCuxbGeXp7v5GNMGmnhYOhm4ZdqbqLDcWuU62cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhYashYqXBZM4hCf8HvTWUylX2+MjdwuDny3pRHKLbI=;
 b=rCKaLDyoMgAOCqkMe/A8PchWHoVYgje4LVefGIcoCM71d0dgPbJNfpNpgIBe9sPSGuSi7dn0vcf3HF9pe6dA/bkOPO6BlYa2fwEyzbAb5BwdAOljxn6Ae3sFRGnLzBs+iOsbX227aqT/jWpZGvAvxOC9QyTy5aq0DEkYO6AAc2qGSjy3He4KjqaRYRF5JWvaftC8WUBgY3RlwAlWO8TDzx+4Bj5Rtj+fGSegZEL9NoGpWwsfvQOaL0KQOB4Xy6/H1lfpD+p9ZYyfossWCUK21kckg5xXAbnx++3xGa5zwQ6ciVSFP6vPg3r7A2EQJuwpMW2VpsvL24bZOfhQqDdV2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MN0PR12MB5858.namprd12.prod.outlook.com
 (2603:10b6:208:379::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Fri, 11 Sep
 2026 14:59:47 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:59:47 +0000
Date: Fri, 11 Sep 2026 11:59:46 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260911145946.GJ3968357@nvidia.com>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
 <178855077571.693280.17942746234757215326.b4-review@b4>
 <yq5atsnyeuz5.fsf@kernel.org>
 <d8ab9189-7804-4e4a-a270-b4e3d61c4271@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8ab9189-7804-4e4a-a270-b4e3d61c4271@arm.com>
X-ClientProxiedBy: YT4PR01CA0213.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::8) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd7098d-1cfc-4823-4775-08df10155297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	GZr+T2WePkWKq4WkZ413s25RmOc9gYe121IIVBMH/piIOGTZHdwKFAhadyZpUqyTtTamLLZygCMLIRybr9FJ9uVNDDqFLBFTkm3aUwvGD74ONEAFmx61vCjyDX8OrzWsS/r8PJVkv9rLPtRyDpmHlVoS2Mmp8y2DZ0aXnf0L17Ao6pRD1/mKEnji9QPj/2dWfw4B3WSPbRYvZnwo5G0GEUIZrs92eesDQffNhSSlcgYoDtaoIwhlXK7SGD33VkwYwAyefPoy04H0JWE0bgWgGlZdBSqOwdSpR3B4O/m82TBZtNnSxmwfUMGYRot3nMxm/nv6RvQFRf/c3MMZ0yFp5FvVtVKlYE0pePMmtSxKlw40zwNl36yDUjmGZXe8qxgKjU+wS0+ofRZP7U/btALmHO9qX0UJI839Ybeada9tzaVi9n6XbQ1T+uZKKARqdWBGFzQZSnheHYPbvIQq73uTSxmJNcssfac77DVX1kMnGxe3KPf45NPMO76t5GpsYJ1td3LbCy7WRFa0Q1GtVesWW9ZgFJ/uUh3MGIfXSOuinBVJOiW5tnuq/IVbe064Gh6p88FhZyvIiV90evhWhCez6E9GEBGMihIDxBxIQ2hhMc+fCmmngIvsLH1h1rjgyfsE2DKql3wNA7R+M09CMsUeyCLKyaa+dbpphG1ztIObHcc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XgvvgN6LuUIeYbnAqEVqKK0+rAZdByHJw8KtkWtLLTNws/YhArT4hUYHdOQF?=
 =?us-ascii?Q?LeRE/g7H9zqtH0kbpo2qkCx1/VgsIGhNecgO2KN6R5jKfc5KUQZwrieOslzn?=
 =?us-ascii?Q?f6p9mB9zDTELTHVznxRye64dsNElSbrdpirkqkzU9nDbuWNpH4jGTdbYa0L8?=
 =?us-ascii?Q?r7fFx8KjX+Bzq/A96fm3Apw0rfccMmTzZCnJcPbGPexIDFmdNH8kY1ubo3kX?=
 =?us-ascii?Q?9MdLpyDjy6NUCp23TEYvrqAYUNLZWlgYzff8/TI/DiHH5ggHKh//AMZ7xYzN?=
 =?us-ascii?Q?Kh0HK2PSRaziIl76WZjLs5Diso7MzPMlj6NwCJMJKnaXRMCA5kfJYJhhpAv1?=
 =?us-ascii?Q?loj7BkMkFvFDJ9mPmStkZgn9VSQGLsib0gVK5lokVQ9HrLR/SMaBQzrNJuVG?=
 =?us-ascii?Q?t8COi351kaiMeZCNghWJbi1vKTSld8R3Q5p4Yj5jxLR+CINTqigaTQIZivTH?=
 =?us-ascii?Q?5bpCSlNAtzJr2RG6auXDqPyEKuX91U5/v0ShK4fCIfu0VjB/q244A3YTOmGX?=
 =?us-ascii?Q?WIvLZu1uQYS9HbEfMJF939HxBagTaZnBfhbpuNSe/kXiDzqLQ3h1ptKUsbYE?=
 =?us-ascii?Q?kXyHbEyYBMbqD327bhrIGGZ+1q1frqwcSxdTgCmLzqAVc9Q+eEUyR8mBIHEN?=
 =?us-ascii?Q?pBHJV2WW7rSftkkZvjpMmen7b+zFjoPvsbsdIENo+etpGMXQ4f6UiE5A0u2D?=
 =?us-ascii?Q?ozi98nQ4LCDW2CGVQH/qZXgR57KKCn6WWoGilafPJzAcioafB96IjUunI8eh?=
 =?us-ascii?Q?WCLdKeom96/Gb05bvPtsfx+1MR9nHi1u61M5JrZyHHyxz8R6+WJH1Y+qJDkO?=
 =?us-ascii?Q?5Y25V0Scd4SRAGK0dwpJyeSeWU1V/lWHImfscYntXHjraT9/7b7X/ozRv7nL?=
 =?us-ascii?Q?mh71IhYyNrHNnbOLVnnL5MFa0vemlRzELrEhEhqf3/7nFzy1wlwHn5Y16/Zi?=
 =?us-ascii?Q?50+suP8Dz57yDI8rNJ7/FisPMfeu9EtTSXjAWaRx/TpGBXxsaEuOTBPfqPk6?=
 =?us-ascii?Q?KU12viXUrimpzlfd/tvk65q+OfM9N14OYNHwBMO8eU+vuRc1FNpNHlhE+C7J?=
 =?us-ascii?Q?Zs0CFhtwsbec4YHBD0/3ucGhmmqA1xain5lZr5PmKa5wOlifqfNAqzCJ1RKr?=
 =?us-ascii?Q?GBSK6k9nbdA+4RRKanAHi2rIV2H7t/WTp03/6JqaXyOgQas8HyAzAtJFQ5UM?=
 =?us-ascii?Q?rA4hQrtRUl1a64J9X8Gq8zaLujyMHBoCD0nwfDCWEZD1GNw0vb0rjskBniHy?=
 =?us-ascii?Q?wdF64dEFMN9uIfBghMk3r/kiqJMEbdsVBFfJ6yR+mK+FDRJq8hX17L47T3w/?=
 =?us-ascii?Q?hqY3qXeXTTt6X5+rgfCZe7Wa5M2ZXuXgXRkQod98iKTwLl24PoY9ET+58Hhq?=
 =?us-ascii?Q?PljTLwCWcKjwHxiK1k4EfscdA5n5zuE6VNmErf+RM78/VcRlbN+y3TlRVgYw?=
 =?us-ascii?Q?P45Xc211NFPxjXeuBv2IJ7Un6g2h4uD8o8XcGXdFhDg0n3aT8VqxfJYBdDwg?=
 =?us-ascii?Q?ZkyF2MYhm7PcPFKx4etXzELGLtIyYIy9z8dKuHwm1IKpqsNPi9stHPq4uy3c?=
 =?us-ascii?Q?0y1cDor0u/7oMESAHbPd/zlGhVEHn+zG4Y0l9TT8KK1OMvsHVmBB2uJ3/dLh?=
 =?us-ascii?Q?bKcontzUlHoAjvuZqngH1HYjtw4alRV1tbwuO/+HgjQCbNLSGrOON9d9jDu/?=
 =?us-ascii?Q?nPOabtrCQxnFvLPkcABIeqUweGceZcGifks2ewABIGGlk7FQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd7098d-1cfc-4823-4775-08df10155297
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:59:47.6821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkqQn+iivawLTkYrow8mqmlUTKEVvJzmhaQWRubsyyKguuxP6Q+IS9rP3rOzyYAi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858

On Fri, Sep 11, 2026 at 03:55:45PM +0100, Suzuki K Poulose wrote:

> > There is no standard defining how the various SMCCC VERSION calls are
> > expected to work. For example, ARM_SMCCC_TRNG_VERSION does not use x1,
> > while SMC_RSI_ABI_VERSION does. Another VERSION call could use both x1
> > and x2. The only consistent behavior is to return
> > SMCCC_RET_NOT_SUPPORTED when the SMCCC function ID is not supported.
> 
> True, relying on "SMCCC_RET_NOT_SUPPORTED" => Function ID is not
> supported is the safe way. If one of the parameters are not supported,
> then the call should return INVALID_PARAMETER.

If the FW is perfect :)

Jason
