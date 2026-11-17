Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794914230;
	b=cUoAbQGQmRAu9tTcoCuUB8yimfsQgBKTbzGeBaJVNpKHndhC+67Gv0/cNVqllYD0QEWV
	 vvq4U64YKfr/myWm3D7QlLX8e6sZB6PVsENTAa+q7BkU3bIXF/9NGCCthlaCZxXOj9HpF
	 +uyaqM+KDAr/5NkZZjeYaEP1O/M29MJFQQQphmsz+6PE8ctgcYigO5i4IB1ffJHYRGt5N
	 M6vRmAimZmMkrikqBa/0xkGSlaOU1yz4TNGkV3qU2uJnY9BfyGpvoZXVt1ZQmkkc48mBq
	 xx5hJaVHLoKEow4CN+EmO3JWh4mqwXmEnULZKLCBGTwPJWW3kQH69FhK/x9lPubS8Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914230;
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
	bh=Nbh1LEZytx4a85WFxPJciC/d8QWG3QjWnPE8NDhKfyM=;
	b=xDg+zN9kSatZMMeuRYQCnUpXHGPjwGXpYo0bN6gk9YcjxqMakysopjAduRf/mv80iT+Z
	 vXC/F6lt0Kxepc8e4bEC12ZTWxBTz+mk+oz75QaAkZBAxzenQdsMNHhbFyRKlrgtPOdvk
	 bUkh9jdc43buu0GXcsNT9LNYFvLKKQKeCZNyqRpL8PrtUclwUwx4dh5Qn03H+6ZsCErSa
	 rpw4dNxiKZ/+03PhNHbiBCOOJfx5ni12hUqbZig95mHM4DpAxVrVq8UIKVuGjvlYLCvO6
	 ur46DUMEGdQ25W1k5qkj8P2FjxgpBSlipV4/Akjes9s8kMLfTQ3T8XrKyQ8annREwMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=j3IYsHk5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.10
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011010.outbound.protection.outlook.com [40.93.194.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB3606A323
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 11:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBB3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=j3IYsHk5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOByz8vVwVR7+De/U84oQyqOW9qOwv4DAi5Yo1sZBavp6j+GW13IIxuARJsNsvZIsmX9I9wBabieZLteTma8J7J+MfmMPAU/nGO1gNRerjKumVexjkcTAb/3OYq27jiNLVXyeGx/evKTKKcIy1vZOgzj1kBDD2Aqa0yv5EJADLXgDHM8Mm3NUGmEccXghcsb/evgNyr3rgnJDlCzd0fDXjG7doyMo0uUA3M0oMHriVdu7fucg9s2omoPQ9JhMmU9dJC4ZVwd/o4tO3ZEccekHbfPyYjCfBGUs9FHKMO3YSbTwoFmTnXFi606VAWTADRCkupNigF7gxNnyODB+HXFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbh1LEZytx4a85WFxPJciC/d8QWG3QjWnPE8NDhKfyM=;
 b=PCSGablHFRg8QpOeue/rVfT8btgZsB7+teqN51uG8sVuBwrEgFQN9xCtYku/zL3heMaGRBjsNjYaFnC/um69AirwcjKxoe+5d/jMkynI04yBFVU1nzHjNHtCiTKYpncW5hLU/2xI2RVh/GGf7tgAddfy1FbY/yq1mm2YmIlgIQ9g5wzxFmEr2ZbJmOioSm2W4rSWze/Lrq1AlIVe6lLnksWhdQ4skHbXrWEQyEUjBdsDA/3fARaX+Vhj6U8cG2Sbz+W3hcyW+zNl2GHfptWMwnV4N+kfbbmJzyer3KteofzOyZsbEuhvC+F0GJD4mctsW/RRyUUw9qapNT8cBm47kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nbh1LEZytx4a85WFxPJciC/d8QWG3QjWnPE8NDhKfyM=;
 b=j3IYsHk5+iNxpJwJd0466Oaa+tgJleZjLVmzNJiUYLHoWQ5hdIHR7F/HB1N5vNB0hH3wYnmlAlrqcvCsxpckQET7ajjFeEkJz2nBhr/sdmm2BI7sbggtZ657KsfAvZKOpartQmRpN6eZTGqUPEAFyooBbCNMJp+BuVybwxcqbJ4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by LV9PR12MB9757.namprd12.prod.outlook.com
 (2603:10b6:408:2ed::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:17:06 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:17:06 +0000
Message-ID: <9fe0eb87-bce0-469f-8a13-a8a1e310ab62@amd.com>
Date: Tue, 17 Nov 2026 22:16:58 +1100
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
References: <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20261111150029.GJ738765@nvidia.com>
 <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
 <20261112145450.GM738765@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20261112145450.GM738765@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5PR01CA0047.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::9) To SA1PR12MB999228.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|LV9PR12MB9757:EE_
X-MS-Office365-Filtering-Correlation-Id: 134e70ea-93d1-4b8a-ae6d-08df449c507b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261021135927099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|56012099006|5023799004|11063799006|10067099003|261102123227099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	TW+DXRVSzrcuCUfC8H849fzWh3eszVdOxQJAn15WjjXy9sphsAhC/UoPFt2ak/j7giXVkJ/m6xaCXYrtfkLI4azkj+bBrgye/84s8BJg+awv+Z+58c9aXkFbn29c8/HKFakAStKQU6fEEAhisxLnWQVlHsVaN6KpcBPUUAn989SgZwbR5P1LJ7USltWloLX0FWz8gLuWFL2mrRyGg8vu00snQyWT5tEEInytQ8DwtTGbZxTEWnbuLB1HQ2Nb2t5yfzl/7sy7s+FPUj60BKS8vNW7CmJqem1Mt4IkUWcoBrKn+t6bfSlmCTsC3z9tgOmObWwG9+G9v4sMvhok5Q5O31bxLJqqrS6K8fj/G5I524IGSAp54f3QkIIBhFkJv5ZfS2+sejkvDDTgCNx11aMm1xXlNPWmhQUElwSSXb61ob0LtVQ7t9LaKG5XmdQSeKMxN7Koo0mZibhRFrE8PvXxYxSWD+u+wHscbk2NBjssFMn6q6Mx9Kb6m4PFm7sKpeE3VpzUKjx2vGY73GCnKgwEWHVFwESAdnTaRTk7EBV7HsAocTJRIRWMlSNNCsiRhAAOrHd/iyMGqpWAqIFqaCnnjmwd/CFIbMcXUfSYtWfvy/YXeG6xs0DUaOhSr8E0bteSwvik7sL5IYcd5DnOFlkSxQ9A03QCl5+fKgunL0cpEo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261021135927099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(5023799004)(11063799006)(10067099003)(261102123227099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTBnNWVTQ051cnUzdmdCVU13NEI4YVZCc0V6cXozcWdseFNTNUVNK0Iwb2NV?=
 =?utf-8?B?czVYQnl5NjUweTFsV0dKMmY1TTlPS3ZEOG9xZkhiQlpOMER3UjBpcTUyZUVK?=
 =?utf-8?B?THQ5eDlrRkNGUmh3UDNUZWJUYysyVFFWVkV2TlEwRHJFb3c3eEJjcm83TC9r?=
 =?utf-8?B?RWFSMzlEcWlGbk9idHV1WklhaDJmdlRaYXl5ZU1SNzFLdFMxL2p3d3VCUjBj?=
 =?utf-8?B?U2xma2dpcWNsYWwwQkFCcHFodEZUZ1o4cU45aTAwaVpjNVVtRE40VktsQ3VN?=
 =?utf-8?B?YjNCZ3FMMnRQR3F2OHVRTlVrL09ubTVRVmhhaXBwWmJLT1N4RjBPRjRIVmRJ?=
 =?utf-8?B?Um02T3JZRjJEbldjdjNhcmU2dGIrb3BBTEdoRlBNQzFwVGYwNVNqUzhRdVZy?=
 =?utf-8?B?M056REQ4VEJWWjc3cmR1TTdYaGI0NmpiWTFKeVZnYmJPdGJDU0Z3K29oM2Zx?=
 =?utf-8?B?NTlRUUMyMnhlM21zOGpWK1Y3b3VOUWhRWjM1UGVzSmpzTVBrN1VJcjBMQ0Q0?=
 =?utf-8?B?QjZtL3JoUzJXZFlTeWg1VEdrbmY1S3RVcU84ZU9IVzBBdkZNWlVXcitZMktW?=
 =?utf-8?B?WnAwMStWdjJwUEYxUzJOaGJnd3hwYko5c1dpYVFpSmk2a3JnYkZHL1ZsYkl3?=
 =?utf-8?B?Yy9mTVdFemZtUjFvU2J4eFpNT2tLUktsYzNpL2VYUGxjTEFob0VYeFE0UlIr?=
 =?utf-8?B?UktwRm9EcTFXU2I2Mi9VY0tSQUZwRzdGZ0hyWHBIWTB4NlE5L0VBSUFQNUtj?=
 =?utf-8?B?L3M1RFBhSFFXdzZzVVcxM2psN0FvRytGcmR2RGpvMGxlcklxa1QwRklUMGFV?=
 =?utf-8?B?QUZ1cGFiNWkrb0V6Q0ZjbFhJZXNNZ3EvNVhROHdEUmpoWDBwcEhIVko2VmVC?=
 =?utf-8?B?L3BRakhSc1dOWkg4bFhadkVTRDFuUWRzeTNhOGVhRjFvdUx2eEkySUdOVVFJ?=
 =?utf-8?B?WE5HZDVvK3phM0pjcGg4a0J4MWxGVUZGV21FR0wycjRETEdQMUMvdjNpSTBz?=
 =?utf-8?B?WGJScVdaWEF6UUZ5UmFSU2tYbHpOclJNRSs5TjZnN1hOT1lTUFNEVXBBODd1?=
 =?utf-8?B?N3NXc1JGSVROcXBCcSsrMzFLTmRCdXF0N3R2dWQwSkpwa2sycmpXZDdmWm9k?=
 =?utf-8?B?eUsvQXJvVVo1TVZtNEhQbzVVM3hBT0U4dFRyeWNZZllmczlLc2xtUEpVR281?=
 =?utf-8?B?NVFwYkd5V280WmpKZzlwRWlxdFJYNXdwV2FmTjlYQ0g2T2kvajk0dHhKVTRS?=
 =?utf-8?B?bnBodlZNMmFBY3BJdWR2c1QxSG1YNnVuMk1TYnF4eFdheTFXZEFIOFAvUTdv?=
 =?utf-8?B?RUkyTFd3TmJuais2MktpbDJPNS85d3hubmY1TE9LVXhNQ3JlNG5mbUd2WTdl?=
 =?utf-8?B?VnlRZ0VSVVRFZWRJUUx3TTAxQTZzcWl6WCtZaStwYWtNbzF5cjBpWUR2NU5V?=
 =?utf-8?B?RmNDVGNSRXllSUtISnF1blRUNzRtMVBwdmJ5VFhhd0NsbjlENXNJRXhMeWJz?=
 =?utf-8?B?MjZESGQ3MmtyUXJiMzZldlZ3K1BHSXhkTENhRy9YS0p1TzRsS2FwYTlGQTlG?=
 =?utf-8?B?T0lwaHBlTzU1V2thTFBlQ1ZWTnlxa2RvRE5va2tKdStWZEdTRDhnMm4xajVh?=
 =?utf-8?B?N3A1cDhlclVmMlNUc2FmNGNYdVRubkZXb0ZoOS9MYllZaGxXaWR3WitEWkR0?=
 =?utf-8?B?KzJ2Z0xKYmhFZXpPZlJ0QjduU0YrMFh6RzZCMTAva2c3aVA0SGZQRzlDSXhR?=
 =?utf-8?B?bEp2blNYell6LytiY3hTTHRjQWh6a05LZDhTbUk3bTYwa096VDFjSFQvV3Rj?=
 =?utf-8?B?dzJrNWJwZHI5R0dQNmRaM2Y4eEQ4T3NKeVJXd3hOV0o0RjNxMkoyYjJCVVBJ?=
 =?utf-8?B?RHk0UDZsS2dnd1d5Y2J5aWU5bW5SUHZxZzdSTjROaHhEUEJUYUphbnNQQlo0?=
 =?utf-8?B?UGJHS1dubERZLzB1WnE5dURycVJIcWZuNjBWLy96LytwL3NwYUZLZFJweHAx?=
 =?utf-8?B?MjRTblBrOUp3VElwTkVKN3dWYXZxWFNjWlk3QmM4SXlZSUxzYkE3ZWtvU2Zp?=
 =?utf-8?B?c1BKdkliSXZmOFdRamlCZmhFVThmWDdXa1A2OWNrUVYwdjg0Z2J4M1MwOWx3?=
 =?utf-8?B?S2oxbjc2Rjd5UXNJSG04S28vSEZOb2ppejRYcHY1dTlNUWk0ekFiWXZFaHcz?=
 =?utf-8?B?bXlheHNUZklkekhUSkVFU2IraEZTVHJqUFpKbW12eE84RmE3c0xTV2Y4cUhT?=
 =?utf-8?B?dHp1WVMrb3JMbDk3UWtIdW82OTRBTkduUFBwNzhTUEtJNUY2dHFvc2pqeUlB?=
 =?utf-8?Q?P56Gks8IUOYSx6GPHb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134e70ea-93d1-4b8a-ae6d-08df449c507b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:17:06.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvq8TnvLVsz1K6Q7qegf44i22iA8BXpBActDF4ZpdFxJhKf1+OPo+/fJgYi8J5tejaUS0LmbgAmJ1heWvZ8mqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9757

On 13/11/26 01:54, Jason Gunthorpe wrote:
> On Thu, Nov 12, 2026 at 09:50:12PM +1100, Alexey Kardashevskiy wrote:
>> On 12/11/26 10:05, Tian, Kevin wrote:
>>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>>> Sent: Wednesday, November 11, 2026 11:00 PM
>>>>
>>>> On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:
>>>>
>>>>> The interesting case is about such failures after attest e.g. unlock
>>>>> which is supposed to be a void operation. Maybe we don't need do
>>>>> anything special in tsm core - the secure firmware maintains the
>>>>> state machine so future lock will fail if the current state is not
>>>>> unlocked.
>>>>
>>>> unlock can't fail, we have no way to cope with that.
>>>>
>>>> If unlock does not result in the MMMIO returned to host control then
>>>> the system will surely MCE.
>>>>
>>>> This should have nothing to do with a crashed device, the disposition
>>>> of the MMIO is under TDX module control, revert it back to host and
>>>> accept you get AERs for the incorrect T= bit if the device isn't syncd.
>>>>
>>>> The OS would have to kill the SPDM session and FLR the PF to bring it
>>>> all back.
>>>>
>>>
>>> Agree but we were talking about different scenarios. Your description
>>> is about real device hang, while mine is about unlock failure from
>>> guest p.o.v. which can be caused by either hardware issue or host
>>> software issues. Or a malicious host may report success w/o actually
>>> doing anything.
>>>
>>> My point was that the guest can just assume unlock always succeed
>>> and rely on the secure firmware to ensure future operations blocked
>>> in case of incomplete unlock. We don't need to do anything special
>>> within the guest tsm core upon GHCI unlock errors.
>>
>> If the guest asked for unlock() and the secure fw failed to do so
>> and reported an error (which my hosts cannot hide), then the guest
>> memory is still exposed (via DMA) to some unwanted thing. If
>> anything - it is time to panic() imho. Thanks,
> 
> It is completely bad FW design. If you ask for unlock it cannot fail
> in a way that DMA is still enabled.

Bugs in the PSP or host OS?

> You should still clear the sDTE
> and that should be a non-failable operation.

In AMD GHCB, the host forwards guest requests to the PSP, and the host can screw this up. The guest still gets to know if the host tried to meddle. I do not expect it to fail normally but I saw some of this while debugging. Thanks,


> 
> Jason

-- 
Alexey

