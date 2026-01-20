Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80BB43D4FF
	for <linux-coco@lists.linux.dev>; Tue, 20 Jan 2026 14:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768918137; cv=fail; b=hDhxm3krhYFPDIL/RTLZN6d0N1JB9N50Z/LIpNkS0F+oYBKI9tBJk5tBR+J5QkgHSx8AK0Tvo+wKiNjOiL4wEA08LZSswJM5WXoStlXX+Uxja5RTw7x6IzebPxtl1WmzygCDjcQ4j5PmwCXdPO6J39CIe49SMS8RvGo1twTf11o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768918137; c=relaxed/simple;
	bh=GcP8bGHUUPYq0isf3nkFumMqfpNKtMth1Nm2t/J5iyc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C7GymN+W0oo9s9XEgt7Dso7jT1SpKp0qbRQHhf8CPXbWvpQtrlEgZbjDNuzRBVM88/wW+kJpUZcEwLom21kiYL0cKmsMzoCluuXUPHca9b7I31fmGOhSbPrDXUTW+AbYsCf9mWH+mvovd51vp3PKk6Mn3Y/QVjQs04/2fgcOMeY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CTyBOcG4; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CTyBOcG4; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CTyBOcG4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CTyBOcG4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RhHbsUeJl6L5IxDz47maJtI5Zk/aam5BC8Oj7xSfcAW/ozHbSXwYY8AIUX7xJN6mp0WHlrstoQfaJmQe3/l58TjmvSLw2lhMtlMv2veatE4doJ7kysx7oftQ5QfydyYtwFIKccauYgFb/qZgj4ZQk6MxxLdFCLq7LlefZIJM2vze/g1nm79/tv40rDJc2yb4yLsmKiOsd+epRlAbIWPqj3mn+HbWGSq/wSoCvDQL7VnwSE7As6VLkVnpBgolrTF+sPzZH4oa/AVkbP4XxaXyE9yYupGIyi6nSiRh4XTEhwc0FN7GpSk78pRTxllCIpozAOAGAlGRp6jlwne/Dooijw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfSNy7aK8dngM8j5WwPtkAMn5KZEJUlV2eCzLQiozxs=;
 b=jQexwbK8anKZrawjT+b7cUzzchDS2Y2qXh4iilVzSYU9kYDhB/3wRd18UzJOlTKxqP+XzaLPvAKa/9hNNtsa4W/5wKUizZ56UFcXICd6zWT3NBMkaiJT5qDOW+7/BRv3ftUvQk5hzQ3OEoc1hMSbtmWvATFfhTdkF7lrYstaDeCjx/fX6ecP6oJZr1oUKLNDYg32TFkdOuWJg/hXOZSATlCA0lWd8MKGHunO9YJJlSgQ4OUvgRWHPKftm5Wih5eW2WypmW7FDG9Ejq8eLH0whB+06hNvyVVFjh1acZFrGQYzj4Rz+GH6QYiRilUspr/zk2jYAr6SGTQQC/dOa80Hcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfSNy7aK8dngM8j5WwPtkAMn5KZEJUlV2eCzLQiozxs=;
 b=CTyBOcG4iDbknKDGMscQ607JUh4f+7BeulGWUOjbBMg1vPPb/TlqEDo8wtj3FWPrlzzl5AS330eHuLTExnuBAVWHicbA+wRLE0G+sKl0JM9kB8riMtFpliTDLhomjsFV1WvV1WX/LZfZZ12d2c1rVhgOiTVAAeyJnAJGsvuzAEU=
Received: from AM0PR02CA0115.eurprd02.prod.outlook.com (2603:10a6:20b:28c::12)
 by VI1PR08MB10173.eurprd08.prod.outlook.com (2603:10a6:800:1cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 14:08:47 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::3c) by AM0PR02CA0115.outlook.office365.com
 (2603:10a6:20b:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Tue,
 20 Jan 2026 14:08:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Tue, 20 Jan 2026 14:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtYQRFEFPyNLlV2Owww7Q4A8WcnQx89DXbhIwmTnhtue9xpF+5E32t5Q5D97UKIYJZn8yJMMGJgCONNIDiEBpzpCJTd3Ly0xw4v+Ee5fsiXA0Ilsjm1nvmqrNckDVV3iyVD53j5xI5b1wJqFCR4wfo1avJA62cStAEZmED8KRbPJfQnlg0jgvF6ANjbA9AnPIZ3UvAYqez+ChKE//KG+JNoLOtX4YFFlq/GkIZPXxZmhBFVVNxlh4CviNauWs/YfnvxYe+RorQqdqCyAcUToIkxfBh+s/ZBTVqrUQlUMvmoDTd7uOEtQVeQ2QXrsFliS5qLFH7ML64jRwYXWbaTWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfSNy7aK8dngM8j5WwPtkAMn5KZEJUlV2eCzLQiozxs=;
 b=lN4QFOBzsIs0DPNTF4DUOW+l1zgfyNmwCWYjj901jsevzoVDXaV9I08nDbnj1ni+fK6vYiwBHodDQi8KCPpkYOIMe4MryNorVrDbfm2+JQ3/VClRIK1IO4AvCBDglF63LXSj5ih2x3VTkYCfAEALblrs/LfBpvSUmsFQcz3Gpr1tALp7PPtwRgonxW03R9XhFBFzHfPC+o60rlrcK+AckcEVLkeAm0uVeMSkc3sdaZAcPfr/5dqE7M4uOpSQcC91m3H9RpZ8sQ0JmLuf4HVkJ3xudOp4Mh6rll3k0aN9b82JM++kXDnvC9hXNL0X/J5NrSDzx+KWT1ofUXh/6fnZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfSNy7aK8dngM8j5WwPtkAMn5KZEJUlV2eCzLQiozxs=;
 b=CTyBOcG4iDbknKDGMscQ607JUh4f+7BeulGWUOjbBMg1vPPb/TlqEDo8wtj3FWPrlzzl5AS330eHuLTExnuBAVWHicbA+wRLE0G+sKl0JM9kB8riMtFpliTDLhomjsFV1WvV1WX/LZfZZ12d2c1rVhgOiTVAAeyJnAJGsvuzAEU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com (2603:10a6:10:3fa::12)
 by DB9PR08MB6636.eurprd08.prod.outlook.com (2603:10a6:10:250::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:07:39 +0000
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921]) by DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 14:07:39 +0000
Message-ID: <644cd18a-e324-417b-ad20-9e7b0f4b8c70@arm.com>
Date: Tue, 20 Jan 2026 14:07:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
To: Vedashree Vidwans <vvidwans@nvidia.com>, sudeep.holla@arm.com,
 andre.przywara@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
Content-Language: en-US
From: Salman Nabi <salman.nabi@arm.com>
In-Reply-To: <20251208221319.1524888-5-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0167.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::10) To DB4PR08MB9214.eurprd08.prod.outlook.com
 (2603:10a6:10:3fa::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB4PR08MB9214:EE_|DB9PR08MB6636:EE_|AMS0EPF0000019C:EE_|VI1PR08MB10173:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb1f6c4-b462-46d4-9f4c-08de582d6d6d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NHRPMk5QOVlGYS9NdkFHSGhhc2xsT3FENGlkMWtiSWx6Q055b1RMTlhIMkpQ?=
 =?utf-8?B?c2t5NGpNYmM4WXFxZXlsK1BkN1R5NXNUb2JjV29OSWsycEpJZlNnZENGMHNI?=
 =?utf-8?B?TWltVWtaRmczRnd3SWZLeE00REZDb01FTGZKdkpPa2tubk5tYy9BY05LMEV3?=
 =?utf-8?B?NElyZzVUcXpnTUN1V0dNTmd0TFBIVXRtZWpCU1kwYTd5N2JLTW1OK3d3aTh0?=
 =?utf-8?B?OUJmMGNDcnRSVFBmaGx4ZkFsRUlBMy9IeC9WeHNldUp0aytqZk5NTlExSlVl?=
 =?utf-8?B?eVVTOVFJcTFvRytoUFBRUWFMVEtMZ0VCbDAzWEtrekgwdGVhRnF0SHFCQ0lZ?=
 =?utf-8?B?WFZlMzRieHhXQ0s1ckE2RTdYUDJLVDFodkVCMlBPRDQ5RDVpZ3FZdVNqRjlv?=
 =?utf-8?B?eEplL3lweHlzL3M5UEsyZjQyTG15ZGFNZk1xL1M4YXc5NWNJelRlMzc3dGZY?=
 =?utf-8?B?UmRmaFlqYlBVWm5ITk1iQVFaR0o0SXNsVWIwdnNYK2FEUWFUVUhDREdidXhx?=
 =?utf-8?B?cTJqTnV0Y1IxeUw5Y3h1WGpSM3JDM0VCTjMrRzJSalYzSUYwWmQ5Nzk0V1FI?=
 =?utf-8?B?RjRLb01ydUhoeXJjU3djVlFxb0VEVHRyVmdTWjY3ZVBjamlTNm9VcHRHQTIx?=
 =?utf-8?B?UURpV1kwU1AzNW1kS0lNaGt1NG5tRjZjZTYwVnMxOC9rUjBaS2o0M0g0dTFx?=
 =?utf-8?B?REwxU1BaNWJDMTZJRVV4NURLL3d5YzlTYkp3R2ZGY0FIeWIxbThuZW5MR3RF?=
 =?utf-8?B?S283S1hCL2dUdVA4ajBtdDJ2T0NPbnpISkc3ZVVJMXFGbklyNlVYeDMrYjFG?=
 =?utf-8?B?Mzc2Z1VDQUp6OVJxQTBLQjEyUW15d2YwK256dFNCTG53T1dhejdmbUtYbHBV?=
 =?utf-8?B?a2FaMnkrQ2dvdmI0NnpOUlBOcmxHaTZyOU1nWm92ekxBd0IwT0hMVmpxZk5x?=
 =?utf-8?B?ZXFWcVN0VTk5b2FHaE5lUExCVGxZRnNNUkloRkh5UFg0TU96NzJUeEc1MVhi?=
 =?utf-8?B?VkRRcGxNaTFoUS9sSmg1MkF5Y1FoWVpiNlFqd25xU251NE9mYWZ4Sjl0cVhm?=
 =?utf-8?B?b08rbnNQYXBHUUFQYUpEaEhWVloxOCtaUnZTbDA2aDJkZUF2cTJIa2ltMStv?=
 =?utf-8?B?TFU5YWVuRDZhQ2I1TGpyVnl1QzNpOEc5emVydDU4ck9FUmhGcEdCSk1reUNu?=
 =?utf-8?B?VG9BNUxFcEZtN1NxbUcrTUpCdTVCanc5enZ6amxtcCtkRTNaVzNoMDNiMmxj?=
 =?utf-8?B?SklvSU41L2ZLZWVRYW82L0Q5czlscUhOcUtpeFFnbUw3eEdmMGtKcU11emtG?=
 =?utf-8?B?SWsyMG1vZVdpMFVwQXBpVkE3TFZ1alVrTVJDSlQ4dnZnekNDbEVVNXVNQnFB?=
 =?utf-8?B?N3htdEM1L1ZleHhoenJodjAwN3JPT2ZwTmF3cUJncGM2WGJuaVFtbzl1MVY1?=
 =?utf-8?B?OHdIN2xFYVp1NEpPM2dKRGQzbTV5SXF4QmFZV3JQN0NUVkUwZGlmdzVzeTVj?=
 =?utf-8?B?aWczeDd0ZFlyWjBKaU5WUXhnTG5ZOER0MEJnMVpnSUs3TFJPcHcvVEJqM2NU?=
 =?utf-8?B?RjhaN2RzL3NXY2YxNEphamRGenZBcnpwbWFCb2F1YmMzT0liZlBEbTBUUUZp?=
 =?utf-8?B?RTdNRlhNTm9Xa3RKM1plN2hXT1VCS3RwSTdZMTVEa1pvS3Q0L3h6bUFKM3Rt?=
 =?utf-8?B?TjF2Z2hsZW9oODdMdExmaEgxcnBOWlN1UVhBUGNWRVBLNnlLRE1XQzQ3d0d2?=
 =?utf-8?B?d2lYZjNTdE1WYU9oeEo3WU1rZ1V3enpNb1BvYXN5WEtENDlGaDAxcWhJWmtU?=
 =?utf-8?B?bjQxSzg1LzNnM2lqak1xTkJ4UXBOamkycytINWprVGpucmlWL1kweFNOcjlH?=
 =?utf-8?B?bFltTmJ0dCszQWtwZ2RrZm9kd2t0NFJUMzR2UWZBRUd5Mjk5V0hHZjBYYk9r?=
 =?utf-8?B?YklUc1c2b0JPMTB3cUN0TkJFK0MzOFcxbkIxWnNZL08zQnAyWVRUbGZWYUFL?=
 =?utf-8?B?eDNNM3hRZ3NGU3ZuQkZRUk9USWFJSDhWb1JHWStOWmsvTGRkMldWKzFUVWhq?=
 =?utf-8?B?bGwzQW1xbU5EdTFhU1lpR1FxdVF2eERZRUZGaHQxcDl5dGJSZEVuWWlEVEJP?=
 =?utf-8?Q?GafqU8W1feDBRjnajKqCV3Mi3?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9214.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6636
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bde94be-24ae-465a-57f6-08de582d453b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|7416014|376014|82310400026|14060799003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TCtsaXJ5bFdTMS9oRWs3dU1xV1Y1N0l0Rkx5Z1FkSjJ3TFBwNGhrd29sYTc1?=
 =?utf-8?B?d0FpWHZXZkFPQ0M0b0dxKzBtaEpzSW1IbHJ2MFoxdXlLQi9rNEVBUmNlQSt6?=
 =?utf-8?B?eWl2bUh2YXlLQ1pjcTh3UVBnWGxkUkgwbEtGU05ZTXF5aE5yVGNoVWxjKzFY?=
 =?utf-8?B?a0lpUEhnbTBpazlXMVRJM3NXNW9STVVob0QxeXltRE11NFFhaGYrSGFTdEFt?=
 =?utf-8?B?c2xHYWtsRWFFQXdFVWczTFhxNnN5WFc3eUo3WkRibVBBd3JEZUdyZHBycWhj?=
 =?utf-8?B?MWM5VkE4SVhNTlQ1RUZjbmNoTFFBRkNCOXZabmpMaFZVVFo2OENlcE9TaHlG?=
 =?utf-8?B?K3pUMERqK3dnN0thc3diZTlDUGRFRURlSVhnOXVuRW1lUUZtWlg2Z0l3WWhJ?=
 =?utf-8?B?YjVBbkJRZm1MTU9wOFppeEFvMjh3NFRKUFdRRnlrbUUrVTJIMnpBRmNhUDNk?=
 =?utf-8?B?bXk4TWhwOWo0bGxIVCsyRFZVYVpyT1dBaW5BT2hpejZFZ1k0OE1kbmI1MERx?=
 =?utf-8?B?WUFlQ2xEYkptUEJUSHpEcWJPN0UzZFlhRDFCQldNbTVzZEZ2bTgySG5yQmlO?=
 =?utf-8?B?RDVheHF3SVkwM0cwSzJDTkZLbUdvV1R2NW5aeTRlU3prejJxMG05ODRENzdQ?=
 =?utf-8?B?U3QydUQyTGxBTVdQcUY3Nm9mSUJYdzBGNCs2SXEzelV3c2lueHhGV1EyRk9I?=
 =?utf-8?B?aTQzL3VOcmpqbWxGelhkN25CdXRuc0M2VERxdUlwRnh3UTNHRS9NMFFyemlV?=
 =?utf-8?B?OWJoSkhqd2Z5RG1uVHQxeTVnRTMvcUxVSTJrUXJVL3Joa3FDNVhpbVBjZ00v?=
 =?utf-8?B?NDUwcE92TXBtUGpENE5hNEt0Rm5IbnlaNFYyeHJtcnpOcGU0Q1U3RERrRVIz?=
 =?utf-8?B?K1pNWkpRczRRQUpHZzA0R3NhYWwvdCtsV2hDT3dMSURqem5weGVXN3ZWU25U?=
 =?utf-8?B?SGlYeWQ0NTVHRlgzOERoL1BGeVF0SGFTd1FwckxlNEQ4b0JLQUdwdEtabFox?=
 =?utf-8?B?VE85RS94VmlYcHpjS3ZaM2JabFUrNFV0dit1OWVpWWlMVms2Nmg4N0RpRHB3?=
 =?utf-8?B?NmNQK2tSanI2TDRhVzlNVVpkaEkrT0VrbTdJay9yeGkrZ2NQcmtydWdUYnRm?=
 =?utf-8?B?QnFteXFJb3g4ZnRoRlZZT0NadERHdkNZS2FJYzRXcFNTK3EzK3pMK2ZNaHR6?=
 =?utf-8?B?U0UzWWw4SWFxdFU3MEZGVFdCYkNTdEM1ZnFIMk92U2hCWFlldHRDVkRKaWVP?=
 =?utf-8?B?Q3VCUURJeWY3R0dFRnVVMHc4M3U2M3c5QXV5RjRhY1NmekVpQlF6cTQ5cEpX?=
 =?utf-8?B?ZHRubHJhclBZOWYrWkZCbjBFdDM4aElDQXlhU1BPdWt4K3lsYW1uMXVIWG1y?=
 =?utf-8?B?U2VDcFErRHI0OWZyN2JTM1hzN3dyVzREcFlaUktvejJaSTJvOGprQm5kc3JK?=
 =?utf-8?B?aW16U3IrZzhkUTFVV3lCUlBaSHQyQTRDSEsxY3FVdFMzU0l2bDl5Wkx2T1V3?=
 =?utf-8?B?TkxVVG84dVQ5UUlVMFhnWXdlclVVRnNZVXJ6cnI2WjljWERvSkh0TWdsR3hT?=
 =?utf-8?B?Sm5vaGxpTTJrdk1DakdLODl0dHV3QWx4V092Zi8xRmowcUhDb1ZPdUlFRUNq?=
 =?utf-8?B?VUVUMGFNMitadVdhQWpla2lzTjl5YXp4SHlYUEtuZlZmZHUyS0R5ak5PR09o?=
 =?utf-8?B?M2xHWFZxYlJpOEZGcU10TUZ2a0c1cUVGTkpkOThsdTY2OUpSU0hzSXhMamFR?=
 =?utf-8?B?elNaUFVObnhSOVZGQ29aZnkxM3FEWVI0R2lEUXU1Slk2aXp3MkJub3BkNi92?=
 =?utf-8?B?bFpNNGNqMTBDcWF6WWZCZXA5ZSs4YkNERVFuaDRjQ2hraFZRanBQVnJsRnVF?=
 =?utf-8?B?akROZFNSL1ZpTjVoaTljRjAzdUJJZmMrZSt5N1R0QUtyd2JNVnpQVFB6TWtX?=
 =?utf-8?B?aEljMjhnK0d2NFBrQWhiK2Iyd1dqL0h1d0pWNk05Z04reFowUU8vSmd0b0hN?=
 =?utf-8?B?RW9zNGlrUC9TNFQxRlAzL2RTNFl4VWgrelQ4OXV2QlIxWEtVZWZOTlFJemtL?=
 =?utf-8?B?MnhhUWVhWUZlalpyUEVBU0xra1JmejNRMFN3a0tzRTYyeU1RRzAvNEhOMWN0?=
 =?utf-8?B?bHQ4NTl6Qkhhd0J1RjZPL1dUVjBxbjJpbnZ1eWZIbzNzSmtrQ0IrUkh3YlpL?=
 =?utf-8?B?TjRubXZxVVBxWHdPNUprMjRvN3VIN0ZpT1Jpb1gyNUR4ZmNqN3Y2Sk43NHdP?=
 =?utf-8?Q?DD0vUpkQzih/xyXJ10DyNX2njvcw0nuaBktOxc0NNQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(7416014)(376014)(82310400026)(14060799003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:08:46.4953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb1f6c4-b462-46d4-9f4c-08de582d6d6d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10173

Hi Veda,

On 12/8/25 22:13, Vedashree Vidwans wrote:
> - Update driver to be in-built kernel module. This will ensure driver is
> installed in kernel and would not require any user intervention.
> - Register the LFA driver as a platform driver corresponding to
> 'armhf000' device. The driver will be invoked when the device is
> detected on a platform.
> - Add functionality to register LFA interrupt in the driver probe().
> This LFA IRQ number will be retrived from the LFA device node.
> - On IRQ, driver will query FW component details and trigger activation
> of capable and pending FW component. The driver will loop to update FW
> component details after every successful FW component activation.
> - Mutex synchronization is implemented to avoid concurrent LFA updates
> through interrupt and sysfs interfaces.
>
> Device node snippet from LFA spec[1]:
> fwu0 {
>     compatible = "arm,armhf000";
>     memory-region = <&fwu_payload>;
>     interrupt-parent = <&ic>;
>     interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
> };
>
> [1] https://developer.arm.com/documentation/den0147/latest/
>
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>  drivers/firmware/smccc/Kconfig  |   3 +-
>  drivers/firmware/smccc/lfa_fw.c | 124 +++++++++++++++++++++++++++++++-
>  2 files changed, 125 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 48b98c14f770..c21be43fbfed 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -25,8 +25,9 @@ config ARM_SMCCC_SOC_ID
>  	  platforms providing some sysfs information about the SoC variant.
>  
>  config ARM_LFA
> -	tristate "Arm Live Firmware activation support"
> +	bool "Arm Live Firmware activation support"
I think the LFA driver is a strong candidate for a module rather than built-in only. If it ever needs to be built-in, we can always set its default state to "y". Kernel best practices prefer using tristate because it provides flexibility, unless the code cannot be modularized, for example, when it must run before the module loader is available.

Just an FYI, for built-in code the driver will need to be refactored, for example, the __exit call will need to be removed and the __init call will need to be changed, see here: https://lkml.org/lkml/2015/5/10/125


Many thanks,
Salman

>  	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
>  	help
>  	  Include support for triggering Live Firmware Activation, which
>  	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 0e420cefa260..24916fc53420 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -19,7 +19,12 @@
>  #include <linux/nmi.h>
>  #include <linux/ktime.h>
>  #include <linux/delay.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <linux/interrupt.h>
> +#include <linux/mutex.h>
>  
> +#define DRIVER_NAME	"ARM_LFA"
>  #define LFA_ERROR_STRING(name) \
>  	[name] = #name
>  #undef pr_fmt
> @@ -129,6 +134,7 @@ static const struct fw_image_uuid {
>  };
>  
>  static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
>  
>  static int get_nr_lfa_components(void)
>  {
> @@ -374,17 +380,23 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
>  					 image_attrs[LFA_ATTR_ACTIVATE]);
>  	int ret;
>  
> +	if (!mutex_trylock(&lfa_lock)) {
> +		pr_err("Mutex locked, try again");
> +		return -EAGAIN;
> +	}
> +
>  	ret = activate_fw_image(attrs);
>  	if (ret) {
>  		pr_err("Firmware activation failed: %s\n",
>  			lfa_error_strings[-ret]);
> -
> +		mutex_unlock(&lfa_lock);
>  		return -ECANCELED;
>  	}
>  
>  	pr_info("Firmware activation succeeded\n");
>  
>  	/* TODO: refresh image flags here*/
> +	mutex_unlock(&lfa_lock);
>  	return count;
>  }
>  
> @@ -510,6 +522,106 @@ static int create_fw_images_tree(void)
>  	return 0;
>  }
>  
> +static irqreturn_t lfa_irq_thread(int irq, void *data)
> +{
> +	struct image_props *attrs = NULL;
> +	int ret;
> +	int num_of_components, curr_component;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * As per LFA spec, after activation of a component, the caller
> +	 * is expected to re-enumerate the component states (using
> +	 * LFA_GET_INFO then LFA_GET_INVENTORY).
> +	 * Hence we need an unconditional loop.
> +	 */
> +
> +	do {
> +		/* TODO: refresh image flags here */
> +		/* If refresh fails goto exit_unlock */
> +
> +		/* Initialize counters to track list traversal  */
> +		num_of_components = get_nr_lfa_components();
> +		curr_component = 0;
> +
> +		/* Execute PRIME and ACTIVATE for activable FW component */
> +		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +			curr_component++;
> +			if ((!attrs->activation_capable) || (!attrs->activation_pending)) {
> +				/* LFA not applicable for this FW component */
> +				continue;
> +			}
> +
> +			ret = activate_fw_image(attrs);
> +			if (ret) {
> +				pr_err("Firmware %s activation failed: %s\n",
> +					attrs->image_name, lfa_error_strings[-ret]);
> +				goto exit_unlock;
> +			}
> +
> +			pr_info("Firmware %s activation succeeded", attrs->image_name);
> +			/* Refresh FW component details */
> +			break;
> +		}
> +	} while (curr_component < num_of_components);
> +
> +	/* TODO: refresh image flags here */
> +	/* If refresh fails goto exit_unlock */
> +
> +exit_unlock:
> +	mutex_unlock(&lfa_lock);
> +	return IRQ_HANDLED;
> +}
> +
> +static int __init lfa_probe(struct platform_device *pdev)
> +{
> +	int err;
> +	unsigned int irq;
> +
> +	err = platform_get_irq_byname_optional(pdev, "fw-store-updated-interrupt");
> +	if (err < 0)
> +		err = platform_get_irq(pdev, 0);
> +	if (err < 0) {
> +		pr_err("Interrupt not found, functionality will be unavailable.");
> +
> +		/* Bail out without failing the driver. */
> +		return 0;
> +	}
> +	irq = err;
> +
> +	err = request_threaded_irq(irq, NULL, lfa_irq_thread, IRQF_ONESHOT, DRIVER_NAME, NULL);
> +	if (err != 0) {
> +		pr_err("Interrupt setup failed, functionality will be unavailable.");
> +
> +		/* Bail out without failing the driver. */
> +		return 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lfa_of_ids[] = {
> +	{ .compatible = "arm,armhf000", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, lfa_of_ids);
> +
> +static const struct acpi_device_id lfa_acpi_ids[] = {
> +	{"ARMHF000"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, lfa_acpi_ids);
> +
> +static struct platform_driver lfa_driver = {
> +	.probe = lfa_probe,
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = lfa_of_ids,
> +		.acpi_match_table = ACPI_PTR(lfa_acpi_ids),
> +	},
> +};
> +
>  static int __init lfa_init(void)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 };
> @@ -536,22 +648,32 @@ static int __init lfa_init(void)
>  	pr_info("Arm Live Firmware Activation (LFA): detected v%ld.%ld\n",
>  		reg.a0 >> 16, reg.a0 & 0xffff);
>  
> +	err = platform_driver_register(&lfa_driver);
> +	if (err < 0)
> +		pr_err("Platform driver register failed");
> +
>  	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
>  	if (!lfa_dir)
>  		return -ENOMEM;
>  
> +	mutex_lock(&lfa_lock);
>  	err = create_fw_images_tree();
>  	if (err != 0)
>  		kobject_put(lfa_dir);
>  
> +	mutex_unlock(&lfa_lock);
>  	return err;
>  }
>  module_init(lfa_init);
>  
>  static void __exit lfa_exit(void)
>  {
> +	mutex_lock(&lfa_lock);
>  	clean_fw_images_tree();
> +	mutex_unlock(&lfa_lock);
> +
>  	kobject_put(lfa_dir);
> +	platform_driver_unregister(&lfa_driver);
>  }
>  module_exit(lfa_exit);
>  
