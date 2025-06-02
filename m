Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF93C1EFF8B
	for <linux-coco@lists.linux.dev>; Mon,  2 Jun 2025 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870346; cv=fail; b=J1VJUJvyXzjpHi5HXrjhBNhB3g+b72K885w82J61gInicfID3UWWhikTYf1LuAQDzhVGaVGsayV12Dhnl1lP/xwGkE2QjYV9BI2uzGLzpZnT8rQ19TN1PbUaV/rUaCUxlblRuF/TAj20XbIi5rurkX+Ra8wEWzLw6OEXkBO8Nbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870346; c=relaxed/simple;
	bh=sIb71mLOsoh7Is8UnIep2G7/sVB0nzsKo5VmFIu3Bpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q5ybrHjjC9gSebO2TnvNjgwTw5uNnf1+u/LuIJvYOTh6D287Wkn7Un1H04/sC3OmDkIQosc/JHABFQYEzBHIrKcnVvkwKXl8QyFVLMCJDl3ytxSYAOLYRX6TvLalVt5MbHYaUm18VxvaCGwKaD0IIc7e02ufpjVW8MZqKVIqchE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ubtha35+; arc=fail smtp.client-ip=40.107.96.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ubtha35+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZUQPENwz3LlxAcn69CStPq2qxkf1aFmnq3Ur3o0Bdn72VooWpPa0ZF/rL+3Y6WlByxP+iy9ZYZjCqsgkMJ9D8jcLPcLoRp/EN5tf5tZO2eZLPXCwwuOQq0eYMPbziMckH8YT17ZtYiyeyf/yYp2nb5kzPHul3PXeGsem3N0rvCa+nB8FBqMO9UxbrTHFjmCjI7iI7n2DwrVwZgaFZhN6Xx1BVaBC4lGvSyWSgdCUsljMS6bvQQgJLpj36pWs3WXpWGYIa11QTaLuQc9GpJhd8IxUnmjDVq6uiuCF2hH8dt2wdBdI4ZQ73+HuMYJEvBKsBmWzKoxN4Sh4MaN7mIs8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnR0k+HQ+XxM1G8ydm06vuTsiyoy5oJ91IRRFgecYPU=;
 b=gVVUaZu7tNWzj9e8hvnawIR5/buzLkBaMJmcmHVsAcs3T++gsrsv7HC+JCmTGd/5wbLYxnpfbW+SlFTHuNLeiJtgnsGZVLWtHjlyEoYQQq6nK8W+cOhlprYlULUAMAIZ0m5QxuYRjStjacvgCnyTEgFCBVH2Cm+B4/zu6YOcEJmHdC8Nc3uidTWlN5ZslfvzXjBUUavPRotzrXKKo/X2ruM0RL1AQg8Ctly48/ZGTbcE2jTzObfzVbib+YbLrx3ARcC0n4+MjM0greEGn3MCjq2lDCsGrGOHBlRMd81rSQ1yvtoB+caX/v17m/pXm3FukSU6bHB0DXLuY5ZCWLxpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnR0k+HQ+XxM1G8ydm06vuTsiyoy5oJ91IRRFgecYPU=;
 b=Ubtha35+E4WuiNcbAFBjmC2hxTAlw+B3UEkY9Dc/5tiKO+6K+Oq1pf9B7p6TAyGpyo+J3nkYcjFAwriemanVtQcPKjIeg52ixh9KldZbSt+Kfik+Xm20sOhYDRGib7SIDcdy9Vkhh7/7afydEP/umrBoS3/BaSXT1XP8FoxKvv4QtRngYTnusMYC3OtC3fVy3hR2wdFlBtjJpur5dhtyegSBnzDFf3TmYFpjccjuHvXyRxAE4BsLu6N8Kneo6Kq4vewI2+AWh+0L2BEGhGTltGMKdlBoVRSWKnTbP+I4OEQQQhLrXzIyvu0NMcC9q0kjhgtgi3e1mHw/2RA8wQWwFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 13:18:52 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%7]) with mapi id 15.20.8769.033; Mon, 2 Jun 2025
 13:18:52 +0000
Date: Mon, 2 Jun 2025 10:18:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	gregkh@linuxfoundation.org, lukas@wunner.de,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com, sameo@rivosinc.com,
	aik@amd.com, zhiw@nvidia.com, Xiaoyao Li <xiaoyao.li@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Yilun Xu <yilun.xu@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>
Subject: Re: [PATCH v3 01/13] coco/tsm: Introduce a core device for TEE
 Security Managers
Message-ID: <20250602131847.GB233377@nvidia.com>
References: <20250516054732.2055093-1-dan.j.williams@intel.com>
 <20250516054732.2055093-2-dan.j.williams@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516054732.2055093-2-dan.j.williams@intel.com>
X-ClientProxiedBy: SCYPR80CA0030.lamprd80.prod.outlook.com
 (2603:10d6:300:6::11) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 1adf4cf6-5375-446c-aa39-08dda1d804bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3xjdTS4KV4cVehiRL9LH3X+ZR58C49anpfj8oW+0khtoIXVoLff7NyfM9ZS4?=
 =?us-ascii?Q?a2wu03vp+5ChlTDuuUwrV1B/OoHkAU3i/f9JnpOtyD+WyBEFQsjPj4mU3dkM?=
 =?us-ascii?Q?qWZsVdmXmqZiBZbDAerULyquk2JxiL89YsNedqJoIiyTsYtsWo/PzgOH0YtS?=
 =?us-ascii?Q?H4BnxwiqBaTDlq2c57zmfSZcv/0Qh8tsyOBv02FOdIFD0BpQneZuvHgBKMX2?=
 =?us-ascii?Q?qyHMOq/RH6fjpMx3jp4AdSwDwxqsQtHp3+rdypG4Ur+N6ncqgFuotyPmsOic?=
 =?us-ascii?Q?ARSW6pQevoDtz2/Ea6zziBPWT3p76E4Z1l5FBI9SEDH4d55LZP7vLJgLwTv0?=
 =?us-ascii?Q?U2nE5mkYVf9RUJuti4/DlE0KF7sbRUGz3oJQ7tv0A/NcnARj3/u96t36hGDN?=
 =?us-ascii?Q?AZo8vj8LuN+2Ae8sqWc/8Vc5Fj8NZ0rNujAiV74RUvIK2SyEAWdY+K4lhB7e?=
 =?us-ascii?Q?40RbLDProbBhiAP21fVw4AdbSy24p9AeF13V014WTy6guIgxm/9dVzfIECAp?=
 =?us-ascii?Q?qpWohdZFo24RlpXVvs+NuaZnGcPC4FJuAr5KQBWRuZa2IoVBWuDmEAWxoXF7?=
 =?us-ascii?Q?85X/4z5fBBDvEkYK3jTNpYwppv3YAM8+kBEduzrK/chgDwqb2HAbOXeGAiPM?=
 =?us-ascii?Q?nriLOt22X81gKOw97svZvs1Xs1yDEp397czi8hlnEgo11ukyyd+08fE9gnJd?=
 =?us-ascii?Q?vX00Kwh48u74mufg/TIZZqvi5pNA2EosXVKVDVtGl29GpgfnhGNs0iQQNH8N?=
 =?us-ascii?Q?bLWzAY5O7ABoYmffWCzWzxJEU4/q1pdyKNJpDgKoWS7vhN7rp9HbWo6B7Cm6?=
 =?us-ascii?Q?oHwK21UX7DsXFgvyUlftd5o1uOdSZJL8C5G0MoSAzBf+hXKu41+qqHEdp/uA?=
 =?us-ascii?Q?n9uhvDRogj5jc1oRmSfoNijHINB0a8tV/n8z/YURst2EjfQ3Z/MXMTYyDTwB?=
 =?us-ascii?Q?ajvsh9C1aV/9sQbFrH6KV9Kx04k2t8sJDDANC5/mZ4SVcr7P169WAHRC7Zob?=
 =?us-ascii?Q?633phFH4Zuwa3E+nBqPJt+mtGv76jePWG4KmV2DL5VKWgL5eMY96xCIFs5tu?=
 =?us-ascii?Q?ezLQa4hxPs7IGG32Gsj+UGYCn8UJhgOjYDQcCDr7zyJFcUa7ZTJfTNix22X8?=
 =?us-ascii?Q?gWXa43T8D4cS5RE3dfnTVEqO+PJh9Iv//M9m0emvEW2xqDc3A3FkqBjYbGhc?=
 =?us-ascii?Q?ws1CDY+eH+Rj8Z1i199Jxl6HLRno1t0y+kzv9KGoPYc4Nd3s4ANcvlXyQ09Y?=
 =?us-ascii?Q?55vw3IVcUIsrX5da1EmNdQAMPRcyZmVIvwYqsJjDGegP+ksD59JmsxyfgGl6?=
 =?us-ascii?Q?dHDpcZsPX853b2TToijaBQkcFql0W+pNB37pTX/4jGwN9DDQeZI3BGLUrQsi?=
 =?us-ascii?Q?GCjCBYekN1nveJelDfUUHnc6ci+K/x8P99umEEUBgt04M4rx9kPbNkKgtf3H?=
 =?us-ascii?Q?HZXcJdUtLUY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8663.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NQmCYinLaqYESpwtTLPpjbzzaIy+I7NOPlj8vUaGdhe7tJh6g1XsxqM6DicW?=
 =?us-ascii?Q?BYeoHMyMIuNYDdkAhYuKBd97v6gyTD7jYRYXa3u/FImMQzORzpj+DQp/rpF7?=
 =?us-ascii?Q?sqK+3fQpetWIn14FrK0EiwSNjk8Izer6HVq/0HoJ/qywgJQIQXeC1eARZijQ?=
 =?us-ascii?Q?PGVhTaPcvxrSo3t6q42x+aRQ2k3xCAMcTDOZv86zof3wiILA9fi3OeAX1y11?=
 =?us-ascii?Q?ktELyxn3MyPx+J1CATpDN0Vdhx5qbHvjMsAOlkLSwLuXu6NOL35v7Pt+Gi49?=
 =?us-ascii?Q?NFm/5nvRSkSE6JqfIpLhYp4pBDrIrpmQKq2zUdQNMVIo5XgK9pO8ithjwaZU?=
 =?us-ascii?Q?exOvHpKEF8WPcxpZusQDZ42X/0gAef4ONczlVgA5Wow350rTdhDNnFUAmAOv?=
 =?us-ascii?Q?C8cye78txeA4NjIpjLAOP+zIqVL29aCFLdYnedrmeUxxFqPls9wS3ampCxAv?=
 =?us-ascii?Q?D/qvs8w2QK/CphowMR3wS9R9FABVCMJfG3nnQIrmImk/VbknjO6dMqKzR4Lz?=
 =?us-ascii?Q?3ssjSgqwIvtHplRdD5Wj23kVdx4y0UVc/MnwV4j6uyzJJp69kGSjzZAAXYSD?=
 =?us-ascii?Q?EZYFOR1zVsgYeDND9jYHeLkC5zjisXBg4hwFFuR5zzfOI4MLlQC6dzf9w3hS?=
 =?us-ascii?Q?PSX/Re9GeYTZl9yL7s+c/8BIV3T7TAxBGofBXcjP9vmgHcbBublOIAoLvmFJ?=
 =?us-ascii?Q?ppO8ck72oLWDzINdrMxJ4LQoFYLo/INlHP/8fCIY3BuG+bXQLQKlH2QZLgkK?=
 =?us-ascii?Q?2sa23Yd0CmwIJn8dispJ790cucZk5LCDwoWcJ9BljdxOOsGoRNCfhZgfUqF7?=
 =?us-ascii?Q?95GBo41o5bWHxyNqXE0+fsaPTX2s3QLRMHHortVWdQGbk48D9yPOL5+OCg+c?=
 =?us-ascii?Q?SgafHCyOjOAqlpdxpPZjXvppqKwyh8NuoGplC8P8TeHpVcirV65PiFlmk9gK?=
 =?us-ascii?Q?uTsIYxgsTC9N5I5NeCct8aDJSWs4UcbKr4fvVH9XCYgrokNT7ByO3xrFa9af?=
 =?us-ascii?Q?N4a/VRzVk3+MEqg0wCehZ4u1aGcQNQ2+sh9skhgW/SMnpbu45M5bVWbjGjlf?=
 =?us-ascii?Q?cFDTFBUefOSiN51qAwMVmA7iev0VtiySytt2gxUmSq/sxmZmjoFUoPLJjWNO?=
 =?us-ascii?Q?XhBu4FezCqdjVKg2l7LzQ4/0PYP/Jt7V7PUyiJAOJHK6OvzDPGErSxMCw5VI?=
 =?us-ascii?Q?nahbltAla2XhHpqkO0KRpwKHAf2sYpCHdI5D8ts1eHthR98Fk06Xm1ujuhUz?=
 =?us-ascii?Q?wJRkSnog93A3MQ806SwZQM4Z5NGGj+c0hLsTCgM3WE7bCXVHLkwJJCTMo1h4?=
 =?us-ascii?Q?1AhqDS78My9vqFj3VTwHPMpp7MRru85tgdJmaE4phKo+eKi49RCYlohmZKf9?=
 =?us-ascii?Q?B4Qp+G9f3XyW3G7SAuKfp74HAEtMDOE6+hFrH1bpYykS06I672mal6Ev5jxF?=
 =?us-ascii?Q?iokZbwYlfp7T9yQ0apuD2hEBdGpWmB4WL+ESKIR5HOEIkcemNPeqhCD+QL2u?=
 =?us-ascii?Q?alAmg4NjAAsfKg7no+FGJchvhUFat1ebKA7eqySbDfArZb0d0unRUA+LCzze?=
 =?us-ascii?Q?uOVfFsVXKgYufwtk/F5+XR7brtODgOLE28qCvpWO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adf4cf6-5375-446c-aa39-08dda1d804bd
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:18:52.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lO4N3TaEBCW5rs6BBwDbovj55p7njLJPrtfF0xi7q8AfkKzHXzLMwXisuAIobbbZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654

On Thu, May 15, 2025 at 10:47:20PM -0700, Dan Williams wrote:
> +static struct class *tsm_class;
> +static struct tsm_core_dev {
> +	struct device dev;
> +} *tsm_core;

This is gross, do we really need to have a global?

Jason
