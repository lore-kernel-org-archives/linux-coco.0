Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795000338;
	b=tMsj0giDEZs9/PUmxJ4Q0ktHPJyXDNgXxth95vWPFb5rPt5hxu/A6//5ElZO2xeGDKaY
	 F7MV+talGQ3N4n32cvsiVCEFfBOq6PJO4qh2HkwP2t03fucAjzXQw2EB3vd7pCT5+8D6z
	 hBmEL58vx/d4pXvvuxrOk49fKnxv+9ifeFu46p0vq8Xn/Cef99K7CrLwmtP2S3vGXblga
	 KjLOkdqw/2k3so5vbYSe6+UlLBfowdOucHHfVzTimz/Ea8WxBidOFt5Ja7z0G8/N8BZ2O
	 7lPrzl/OyNJqIZLskLmWVdqnBxKBlVQperFickOnkmV6cWYiW+wDWRw/9TnnI9sC7Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000338;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MoC0qJHiRf/IM29fgA4YSGBXlBQmLZP0aYDsT20Yu1o=;
	b=5jc0oEwGtJ04z6u/iL8faitWP5eFsscpV5Z0KU0UYlw5wW2Njhvphx8Sw4qbPx/PSY/F
	 Wcws+KO9nbalfiKbAyj3kKaqht51XrenCg7J9pnCEBT4ProCBXUh68nQeZB7VJ7X8PgMd
	 g85KCa4jK96O6zuedSaE3KZbgxt+SEXOfdN7L5pghNhtFvRqIYPqVWhjosZZAnOgV+Ja5
	 fjrH4XwPULbqHRHwkfK30xgIPppc47gX0x5TqHjitj5GKeSGszI7rg7sRE9FsZPfdv4fp
	 5OYreJ+cW4TEqt2Zow8Dnmq6CfMKQDAwv3YYwdfwDLkI5MIhRLTn0iyq/aDfU963oJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3cujFvd2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.1
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183D3606A31C
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 11:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 183D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3cujFvd2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpZ6jQ5idkpFgWQzxCUAuPu9hKbZgz7fKkos9gjRFMIBzNRYxjVW9HX4cY2L5JUwaw1TI67excSWxeOaZ8QHQAF5mgtC3A4mQoXj3il63yVc9G6jh1kgZn3405Sua4Y+jXvcCAj1XJEFKKSnAt9uRSa4TC542yPKRMOT1SomWtzQqocdEOLnI2SCI+qhC4IfK3k+2lrYshR/hDdWbMIURMejGpSaGFTfPnn9qrsDX9xb2JgozjP8K5SZy+WE2VbzNJbq5rfATClnsp+z6SocI/U5oVqS6WPAryk6B2uJMyrzF2dZ7m6O7rBedkVH9wGgw/R1Hl0XqyPG3A0SdG8XuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoC0qJHiRf/IM29fgA4YSGBXlBQmLZP0aYDsT20Yu1o=;
 b=KuBdNTfiKgQJl9n4DqXzBREijD4XEd6Sbc4yNRsXevs9R4VccBTRQ8qf7P6tftpkY1NCetF64utUIIjktqTzRUnMwnOFdj8hZ6PadcaL0uaP405N5MYspWww9e54NyTLeUHUgMqbDpOBvGGuk9uo/7XldJ7Gon1Rtj3Dz0ernyj6wmjs3bGkyTAdv0ThC0cfL2bsJ5UHWOaxdIP4D0wOEET9Kd8OqSH9G03d64kqwiPvFVTq2ahxD5B1YlMPwEd0hjSf1lpfIsMbax3bAHBjKiMXGpF2MHXQ9t73kcpO/HzB40GH/8ZzRnmVi5h86lg+fxvxMM1zfUJrCJDs7dHwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoC0qJHiRf/IM29fgA4YSGBXlBQmLZP0aYDsT20Yu1o=;
 b=3cujFvd2ZmIAk4XajBeU5XQSfgNtoXigL9r5BcBDU4jzuekmE1ipo6Fp4JHmG+KVZF/3v4E+U1wyINvn2ATSOxpjenLxYOK7j3RMDs4rUdfOkWp73GJtJ5BA0dG8Xl17v/mK0y6mcl5ofPuklN9K7AdK9jJUSryWvpN6bCpwsB0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by DSVPR12MB999286.namprd12.prod.outlook.com
 (2603:10b6:8:41a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:12:14 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:12:14 +0000
Message-ID: <7ba4eea9-7e76-4436-9008-b56bcae0fafc@amd.com>
Date: Wed, 18 Nov 2026 22:12:06 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
 <dave.hansen@intel.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "kas@kernel.org" <kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "nik.borisov@suse.com" <nik.borisov@suse.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "Verma, Vishal L" <vishal.l.verma@intel.com>,
 "Peng, Chao P" <chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@kernel.org" <tglx@kernel.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "Gao, Chao" <chao.gao@intel.com>,
 "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20261111150029.GJ738765@nvidia.com>
 <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
 <20261112145450.GM738765@nvidia.com>
 <9fe0eb87-bce0-469f-8a13-a8a1e310ab62@amd.com>
 <20261117142405.GJ2245175@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20261117142405.GJ2245175@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0077.ausprd01.prod.outlook.com
 (2603:10c6:10:110::10) To SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|DSVPR12MB999286:EE_
X-MS-Office365-Filtering-Correlation-Id: 5015089a-4dcf-497d-2373-08df4564cc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|4143699003|261026121527099003|261102123227099003|10067099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	0KRbizDZbaL5XDsKFxN8jBuUIUl9GJhVwx7DUj/t6nroiDmwgrMuCAgvR6D6oscMpr1+ksfcMBMuqJW3x4eCQFEQBHkSMsnNLLLrGGgeFtLote9HUKeeDbD4HdnolhuFgwLEKMJEcaL9joF+rYQ/ttpnmwkIbdQszJ4ltHjyQIacY0AIBNgVPlfC8P6zQi/4i9aPdWjjifqPRu0dwQ0uAOXKq1w0dAda9v24bmvQ+3x4646QVm77QuVBQLoYx1dsD3q1ODkrOcBKA9wF92Etr6KEA5tJXhHidLGmrgGY601PC2QoxO5ikoXqRLmhmRiZQPEDzjubxrx2spahdcsvXLWxcHhe+wwjsU0L7ZI7z4haCptA4KoD0b1tQgMoRL8fKvkhUWl99imFGVMUGNATVswfT9yJxZ20Pi62dkp1BVi0Z+cls+RJpnmI5nXVKFU3sQPKlTk9qku6Giylj79glO+yvxbKfC4/CyCHTAWwXoXgvpr6qqQWExwcCY03m98gPQFVhLK2boAmHG7XMEMZhqG6j++7uhk2ncMSLtgi+Wj4WKkVI4U8HtwU1u3vqOdf1/XgcEilO2u2+vSM9v8dBX0i7v0371fRWFZqnxboOvsy5bUrpqhem1CU2GWjR21F/UrSeaRvZoFLd7pAl6es7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261102123227099003)(10067099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlBvblJtc1V2RW9DRGtQbGFjUmlYWVZUSGVaVld2amYrVkFkbysyNWNmb1FB?=
 =?utf-8?B?TGF4NHg1TVN6RGUzQUFSVVNZRG5sc1Awcmk3cUtSVTFPNUZtK1VzTVRlQmxy?=
 =?utf-8?B?ZE5rRW1ucGFIRXJUREk2bG9HY1drMWhrcFRIT1BBTERCSlVsOU1DcmlEMmp2?=
 =?utf-8?B?b0g1TXJxbTRzNnFJOWl1Mnk5WDVvSW5UVVlXWUtlbVVOcmJ4NnlpQ3dpU3Zz?=
 =?utf-8?B?S2tnMnpQZ1YwRmtjR290TkpwdCsvKzhINnV6V0ZFYWtPWjE4U2VxcUtrRVRV?=
 =?utf-8?B?RytEMjdEdHo0THoweVVvQkkydlloMUZyVEhtVjVLRWhZb0M0eFZnSmdOajNR?=
 =?utf-8?B?TVlOakxuMFVVWXdabCt0cjQ0M2Z0aC9tVjBSS1JJMG5xYjJRVk5xOHdjaVFm?=
 =?utf-8?B?bzgzWFpqaTRnajdEMUYxSG5CZ2FVSHBvVkdVSVJJbThCOElrUGw4VWgvTGFr?=
 =?utf-8?B?NG02OU1IOTlBVytNTTV2ZUJBNVVpb3JYUU9RZjdlTTJUcW5ZZEtrVVFxcytT?=
 =?utf-8?B?blE4RUd2ZTlWZ3RPVFkzdHRMalZFYUxHZHo5cWc0WkszUTlIK2kyeG4xV05W?=
 =?utf-8?B?MzIwaG5PWTZLY2V4d1dDWm5XNVcxNWJEZ0ltYS9kd3pPOUM3djNoVUtHZVNm?=
 =?utf-8?B?YXE0RWNLMVJnRjUxbk1QTEpxaThuMVdEZDBBbzYzVDRhbzFGcnJlREpzdmdl?=
 =?utf-8?B?V1pXWUUzTWg3RU53SE40QjNvMTBWb2Y2Q2d3Z2x4L3FTcGFwYnZ5cHg3WVVv?=
 =?utf-8?B?SlJnMXhvL3o3MlBXbWtQSTdMU0R3azVDc2ZqNWNBaVpPQytwNGRGMHhGTXda?=
 =?utf-8?B?TGtuTHkzZTZSZ3F4WDNQcVZodHRoODc1M2RCODZpR01uemhJclBUT2hOUzFH?=
 =?utf-8?B?NWwrVVF2K2VzWk9uLzFZQkk5aVE5YmpDNEllSHIvZG53ZmdGQURIL3pCL0ZF?=
 =?utf-8?B?cEd5WHNkNitGZGZjY3RaalNqdytZd1llTzJJMDNEK2c0RXBSLzVRaExSb3N0?=
 =?utf-8?B?SWllQlVGWEdqWW5BTnI5L2ZQQVJMa05zZGJXaXhYdTVhaDU3YUcyTXVEbkVu?=
 =?utf-8?B?WjBWTFRPYmNmSjU2dnRmM0dZYTVzSW9BQnJIMHlZMklrLzlBS1c0NGtHS09v?=
 =?utf-8?B?czhYNnUrREVVU1hTWm9TdnAyaG13RmZteHJWdTVyZnpCR3Raa0ZHZS95WUtJ?=
 =?utf-8?B?TTNpU1BlWmVkY04yK0JES3FHVGR4djVZNzNLSEJqSGFFeUhjYlJUUDJpYmlN?=
 =?utf-8?B?V1B6WHFuNzJLN3dvdy95MjdVem5oNlgwM1didWxTaDF0ZXllZE5odTZPQk5a?=
 =?utf-8?B?TVMxeFlqc3JLUnBNYi9lZEJDSndtV2t1dzN3UXJSUitHNm04Q2c3VnlkZWZl?=
 =?utf-8?B?WXlFUGJ4WE9oMWF6L051V2ZxcEhERkJ5WndIOXNlc203cUxxYlN3aExSbzNv?=
 =?utf-8?B?VnlNRGV0MllYdmJaUjhncDBhcGJiZWhyRlYyUEt4bks5TjhRMHphWmpMZHZ2?=
 =?utf-8?B?TWo5QkpmLy91VXZYUTFIekVhL2VuTGQxVVJ3L3pTR0xjbVZ4a3lSdkFyQVll?=
 =?utf-8?B?cXhFcXhPRnlVek5kTWxIN0k1c0RCK0g4MkFyanBqTjFVc2FHc1dyMG16cUk2?=
 =?utf-8?B?R2pQRHluekJqU3pEMDVWT2oxU09uZkR2VTM1Nk83WVI4L20yL3Z6WnNkMU9i?=
 =?utf-8?B?eVFhSXFod2Z5MUFjMHNWY0l2SjBhMURSUEdDUW0xNjRWNW9SY3EvbGdDN3g0?=
 =?utf-8?B?blJXcHZCYnRhN2xIcVVIaHZGQVp3VTZrZWNDTmxrS05mTEU2blh4SkcyNWwv?=
 =?utf-8?B?dG1VZGRsaXRvamZ5amh0ZmpCb3JCbjdqbXB5RHJpUzFqVzVUTG5PZE5VdFNv?=
 =?utf-8?B?clFTODIxUGdmeHFyUVVlL3Jab0ZPYi9RQUE0QUxHQVlENndHR3Q2ZkEva1c1?=
 =?utf-8?B?T1FtbmgycTk0dVZ4NzQydDJGNkRIRHVsYVVNNFpOTEYzd1ppOVBPNTZqUi9v?=
 =?utf-8?B?MzNTREswMHlLNC9DVmR3aWdLWkNrWW1PRHBBRGFKb2RpRlBjalpoQ1UxbFNr?=
 =?utf-8?B?SWdUTDdsUUVGanU3RkNNZGtKYnovWjhvZ2s0Mk9JTzF4L1J6dUx6UVVmaXVD?=
 =?utf-8?B?OUdWaFN4WlRJT1pLd2o0LzJlbW9HMmd4NHB6U3R5L3M0YXAzWFljdUNFQ0Mw?=
 =?utf-8?B?MG96VnNPTm54UHVPbUF5SVFrajJCYlRDN1dqb29CNlRSN1diTWZ1OFNJMU0w?=
 =?utf-8?B?bURaa2xBVmJHU2p6U0M2Q3h2WDZWZi9SMStMajNFL1NFcGxnVnlHeFJuSGRp?=
 =?utf-8?Q?MY106Z2Zzr9kLgicQ3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5015089a-4dcf-497d-2373-08df4564cc91
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:12:14.2197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoZR1AxuixeX25F7vZj5Cv2eSvq3BNNR2hPccMdyjFOhbfXCMXuIHGyXjXzYU5wOnXpSXAIWPStyS8rUwjc+Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999286

On 18/11/26 01:24, Jason Gunthorpe wrote:
> On Tue, Nov 17, 2026 at 10:16:58PM +1100, Alexey Kardashevskiy wrote:
> 
>>> You should still clear the sDTE and that should be a non-failable
>>> operation.
>>
>> In AMD GHCB, the host forwards guest requests to the PSP, and the
>> host can screw this up. The guest still gets to know if the host
>> tried to meddle. I do not expect it to fail normally but I saw some
>> of this while debugging. Thanks,
> 
> Like I said, it is completely bad you don't have a fail safe way to
> block DMA again.

Who does? I mean, 100% guaranteed to not have software bugs?

> If the guest tries to do this operation and it fails
> then it must panic.

Alright.

>> I still don't know how your "host controlls dma enable" works with any
> possible security. Is crypto involved somehow?

The host forwards encrypted messages between the VM and the PSP, one of the messages is SDTE_WRITE (which is enable/disable *trusted* DMA, pretty much). The "trusted dma enable" bit lives in SDTE which is in the encrypted memory accessible by the PSP.

> 
> Jason

-- 
Alexey

