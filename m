Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480625;
	b=oWz1XmJrqIZgtBoe0cVc2pdLAK+Kfup7hXAjyu8/9e7ihTvOjElFln6zqu+8cXe7sUGW
	 QIdg1mr/yL7QdDEPC+8CIggk1eDuHcH19QNV69XV8EHw47rlnTdw0R77Sw+VnA7jpRFpz
	 GN9oO5IIOcF/DXpBCeQj7ZJcIYRBJAwuBje8Nudj75azOmTWXPvqzz+WKPPmrhdiQx3Ik
	 OYDrfpvNVCt2c14XC8NazJlEe0JMIcF+mefn7MpiLbOFEQXGB7oGbK4w564Apre1KfyMn
	 YCxHOZQM3n1MeUK5NfxN46V8NDUIDwZpaUrxoayWOsfMimxFHtUToxndR2fYswPxhRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480625;
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
	bh=7ufNgHQNtVIhyoZcj1WdM03g8BP2tRsqhdjUpw2dzXs=;
	b=Wuea3RBW33g78Bnsza4IYZXGwPgjN7pOYB28Cxh5r3t+yNeAIGzPIiScktothBA5Eyj2
	 MrErQGrhXb7lSIXJ3HdUAMoEFU9KqjbzGoL8jAlPHnIIf3sJitDDxlPf5QqP76IggTUX2
	 rod9K8sKQbwQwyeDN+Pga5ineSqnV28WY2k8y58/0ig3z3kdDighpcpIyyo/MciaMrodu
	 1zYyK75hN080nuqzoMMmEzHN4nvJtFQ7++EKZ4f0c2LxN81Oqbs4Xv0At5vOeAJlwAQ1u
	 O0XFGO0doWXLh2yfqV34grTbrgxEYMztuZ+9EwhaxaDSyXsd6l0BZXyIU56ziEdssUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aBTKVVsu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.19
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08758606A323
	for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 10:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08758606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aBTKVVsu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWIAp/4i9B/DloaS+SWqtrEyFSBbasQZtZ3fcbEKWcZ7jKacz7bOzPZebup7rO6yguV1k813L72FSLgjLrRRkMk5cMuUkVRSPPSjReqVvkl93J3ILehAH9EujTYArO0bu6iWad7y8KzBcvpusb3ywJGS2E/3Ks9RMvfWzn0vOlZUlqRhMUAdR6My5yk6+Y5pKsEqsw7Y8X2mnvAsIXWmNT8QneCOi4biLI3VLViVDReYoLsul7NF5gtPC7q448GJ10WORk3bT76EMMNFiHDyMu/NSrBBQHhJ0Axu9L11xAbB5j82KrjeGLPAcHK+ftmqnpN9y1gAwtu7k4w5z8xVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ufNgHQNtVIhyoZcj1WdM03g8BP2tRsqhdjUpw2dzXs=;
 b=Z+YRCrTTWkw2TLS/4QUxAUUVIaOKBqpcy2GEyidAufZmlAsxMUXeBh5SPq79AplTIoq9PiRIjvOT8s9FmIRWfzUjUVxz6HPZnfYSeNxz4JIgHvKS4RjBX4nieiF4e8AAEk2C2mQWj7n8McmcK69Y/kMV3KxcORaOrVQJVprAGefsGmRyUz7CnFcqRYoyrjRZJqLrlSnmZLGMtg9J2UD/aBRGB9yXku8ZMvzgMJF8d5UPY2FW2RoXQQfaqylh12HJZIGDNEl5xcmHsW1YYhgrBWKXiTm+MOOddotl/km5Aj/817OWS7NELL5M39pro0LoB8KrTN/BH3wgF2UKLnMApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ufNgHQNtVIhyoZcj1WdM03g8BP2tRsqhdjUpw2dzXs=;
 b=aBTKVVsuQvjWeJR7ImyhmMT5bX9lIT7R1q4Tc2q6Jgne+6IRtV6BT2+9Txf5wKPETFN/Nk21WBDZOFGHaVayl8rJlO+wJ+OwyZF7uAGnz56tmVbIarvDusYzBT//evfbOUGxR3bUz3B6fen1WcRX/WEwWthLr2ecmiKs6x2mHbQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by IA0PR12MB8982.namprd12.prod.outlook.com
 (2603:10b6:208:481::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:50:21 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 10:50:21 +0000
Message-ID: <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
Date: Thu, 12 Nov 2026 21:50:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
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
References: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20261111150029.GJ738765@nvidia.com>
 <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0150.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:205::17) To SA1PR12MB999228.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9cb4f3-294f-45d0-2cd5-08df40aabf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|261021135927099003|6133799003|22082099003|18002099003|261022105027099003|261021121427099003|261022075727099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|56012099006|10067099003|11063799006|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	fD2X1hocSYttOlTcl34x2oLPhV+R4uzdBEjhaDKxbtOoxBBe0gAqizhVNJYLEAlQPaKXbolvw+h6/ns1bIAcxOZuQezpOQBmCvG7b/KqEcetw1ivVDiItz6seZpOmPFgFT79HjKoJ7MkI7/zrH5EgfBhZNnSltAVLSGpUmbor2d+xB2m9+GdiVOntwLJXJH0uQBIdncoYEfiQzJd9mVwOpvb+L2wJjkW1hajJ18c96ZAIsnuRNUlqEXBu7MlnwDnq3LTIqO/I4gZhbidXtbXRczM8nlOyTuuM1qGUHjzW+6QvsA89O0RC2hEz3iPPrOzf8YQUnZ5Kk67ohlfQ0rDJAnJadKxrExQTHhth/2GQoH+1frKOfSz3JPVfFOv6Koxb2gHkoZpgEy2v0C+WJHr/+x5gc6cc49TRrs10+nZ553dSUQpfRjsF7EErRVFp9/wdf4SRUq/6ZJErPsC3G53UxPdU5KKo4HaIL4o3PPe4CM1+HmaY3/5DkgRkhsYNv/kFZ1VaNYwEnA8tvD3cfEm6/B8VcwxOsUibFUZtwkGS2VtH2gvNdbTexEhF9/AQ/Xn/hrD/6bjM0iqORm/pZp81bNjd6WtPKnMWfrqUH9ugZs8M8MIxm/VOb2us7+/0o8qOzlMS7QsLAQ9EO2tcwir3RBrjgQCqVbdeM+1j3eaM+A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(261021135927099003)(6133799003)(22082099003)(18002099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(56012099006)(10067099003)(11063799006)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXFxTktteE4rL2R1RFhnaTljbGxGczlnRFBJNFY5M3NDcmp3Y0lVdFF4SHF4?=
 =?utf-8?B?QzlSdUorUm5RbWNkeEUvd0pwVm1CTnAvSnhGQkNEcEtKNzYrM0g5cHpwamox?=
 =?utf-8?B?TWMyczA1cCtWaGZvWmZDUWJnWWxWNEtZb1FudjUwaVhIN1ZEdFVUWGlvQThS?=
 =?utf-8?B?cGZ5Zys3dit1ZVVCQW55SlAxNmMxcEs0Z1hpbkppamZLMUtoeTVTdnQwRWY3?=
 =?utf-8?B?TjBucWo5RUNXY21aNWtmR2FsVjlPK3BzdE9VeHpsMER4S2I5eXhEb2RmYmpq?=
 =?utf-8?B?VUc4VkVqa21yT3k1WEdWeVZHM09aNkRKK2FwbVlObjhwVXpaa1dtZGR4Smw1?=
 =?utf-8?B?RTlYL0lTaG0wZHFQWjBwVzdhZC8wU29NZU1UbVkrcUJUQkJzRkFkYTZhTWtF?=
 =?utf-8?B?aUh6K05Na3dGbVYwZ3RyNi9uUzVaK1FBM1FiMnM5ZHVHOVNuV1VEdm1NS2Rn?=
 =?utf-8?B?QmVKblJoWDhvNC9tbEZDekMwTUdrRVgyVHNTTW0zd3M0cSttMUpOM2hoSkFj?=
 =?utf-8?B?WFNMbkh1ZEUwNmNCWG9jb2xqRUh4Qkd1UlBLaGllaTRaTGNwTnRTZ0x4QytH?=
 =?utf-8?B?cWUvTU1LaWlFNnlRSVozTG5ZR1pFd2JvYlBiK2creTVhTTI0ZDVyays3YWJx?=
 =?utf-8?B?blAzM0loazJPMHc0QVdoU3FCZkhQdzVKRThJZllRWFVHZ3hLZXArMG1ZTzNJ?=
 =?utf-8?B?czZWNzJnRmZFMllhWkIxdVhITUJTcUEyUmdSeGZBT1dZdzBZMnNwS09heXZx?=
 =?utf-8?B?eTBISXBXZ2NyZkpaa2ZReEkvczdLenZNTFBoVmNiZ0JTZUhsRjI5ZmdralFH?=
 =?utf-8?B?ajV0NFNEVkNZTDdjRmlIeUdXNW1TaGlVdk5QTDFjYnNnekF1RXFtaFNlNktl?=
 =?utf-8?B?NFJoTnRlK3E0WWd6Tjk0dTlLV0pwODBTL0swclBCdzlpUWxCa3BQQW0yenpx?=
 =?utf-8?B?SGV2U0xQbmVoU28zYjNWTk5FNFNyN1Y4NDNuQ3lxTkdmMXBGdEFuVXZhNG9Q?=
 =?utf-8?B?bnB1a2VRMzZzeGhEU2M4WldiZk1kbGJIUzlvVUdxVW9ZajFyNW15c0xiVlk2?=
 =?utf-8?B?UUpjYjlGNFAwUEk1aWJZM2ZjMHRmZjV6TXo5cEQxQ3hXR2hnUHV5dWtlaXZy?=
 =?utf-8?B?VmE5TktCT3JUQWJBQ0E4OVlyQjlpY2V2eDE3NGZNQWJTb0dON3NLYXhvVFJ3?=
 =?utf-8?B?blB0by9MMW91YVo0NXIzUXo2a3dVT3c5MkZBQU8xNDkxYmJBVHlIamdTWHFt?=
 =?utf-8?B?MHd3cTRWTldoanZHUkR3cyswUERrRzVnVnUzZGo5STB3UnRiN0luekpGcnlH?=
 =?utf-8?B?RnhWKzl0dGdMQm9VMmlhYS96TDNvRFVNTmltL0VTWWJSOGNJaEFnSk1mVFdl?=
 =?utf-8?B?OE9zdTA4NHdZM296M2lTOU1zZXpBUGFpTnpGdnFXY1BQa3cyODlveHZZMEVD?=
 =?utf-8?B?czVmeUxzVVg1ckxpTzNVbXFDNXc2QnYrN25ZM0lVVkw5TVE4emc5QUZaNWdU?=
 =?utf-8?B?MlQ0YS8vZFpvTzIvU0RqWUUzVmp6Q1YzS01zNWRBT09OTmVWOVB3V3NRTnlR?=
 =?utf-8?B?cmVIVG5jb1pGby94MHpjc0swZENueEl4SzRTRHg2YTg1SldJZUhPaXZXMzlM?=
 =?utf-8?B?Y2U5ajBvS2FKcWlRZHZ3M1Y5cWFMUzZEUWM2YTdtTEZraEpLOTZQZU5reXFO?=
 =?utf-8?B?QytDRm4rK1Z3Mit3VnlGdG9OSmtkeG11U3NFaFo5NC9oTGRabGJtNUViWml2?=
 =?utf-8?B?UWM3K3h2dTdYR1REVjZBTk9wVHFTczd6K3poTVNQWHhqUnRmSWV0Y0pyL0JH?=
 =?utf-8?B?VGFiWmIwbGJYa2lKWnpuOE5BSk8zUVVCcTB0ZStSQ2ErWWs3ckg4Wk15M29v?=
 =?utf-8?B?djhucEFYUXYwOG1VN0hueS9nSHQxTXhjZ0l5aFVJblE0d0Vla3JzRGY3Zytx?=
 =?utf-8?B?Uk90Wm41dE13V09jR0RTVmNaa2hBaGJGcU9iWVFhTWZMRTgwSFdqU0k2TU5Z?=
 =?utf-8?B?bUdOR1BPMGVMZFdVUkRQWXdtQ2gxdzIyMThwYzRiR3hvSWxjMnJkS1hPL29K?=
 =?utf-8?B?Y0xwVjhzOEVJR1VTMXExMGdzQnRPbXpBV0U1eER5NjMrYTg0MWQ0TmovRkdu?=
 =?utf-8?B?aGNjK1FUU2N3elFFZ2tUNmdYMXN3d2NheXRQcHlYamRrSXBZdmNXWHM5QStI?=
 =?utf-8?B?dm1HVDE0WXgyRFg4QmhRNnplaGNrMDZKVmo4UzVvazJFdUNjYTlQbkNXaXdJ?=
 =?utf-8?B?UnhzREJqMDJQVG1DUVFYVFJBV2lwWXZJNzUyU2xYTFhCWXVmWHRMOEJ4b2k1?=
 =?utf-8?Q?fsce32xtyV5Ckv1ADk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9cb4f3-294f-45d0-2cd5-08df40aabf5b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:50:20.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oBUPZB/D5RaHoK0ikUzeHDCQEXVaE0FasA+Lkye4/JLhSeo0fr9Dpi+0wAuvmj+9saiJ9m+r//75r0Fzvlf9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

On 12/11/26 10:05, Tian, Kevin wrote:
>> From: Jason Gunthorpe <jgg@nvidia.com>
>> Sent: Wednesday, November 11, 2026 11:00 PM
>>
>> On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:
>>
>>> The interesting case is about such failures after attest e.g. unlock
>>> which is supposed to be a void operation. Maybe we don't need do
>>> anything special in tsm core - the secure firmware maintains the
>>> state machine so future lock will fail if the current state is not
>>> unlocked.
>>
>> unlock can't fail, we have no way to cope with that.
>>
>> If unlock does not result in the MMMIO returned to host control then
>> the system will surely MCE.
>>
>> This should have nothing to do with a crashed device, the disposition
>> of the MMIO is under TDX module control, revert it back to host and
>> accept you get AERs for the incorrect T= bit if the device isn't syncd.
>>
>> The OS would have to kill the SPDM session and FLR the PF to bring it
>> all back.
>>
> 
> Agree but we were talking about different scenarios. Your description
> is about real device hang, while mine is about unlock failure from
> guest p.o.v. which can be caused by either hardware issue or host
> software issues. Or a malicious host may report success w/o actually
> doing anything.
> 
> My point was that the guest can just assume unlock always succeed
> and rely on the secure firmware to ensure future operations blocked
> in case of incomplete unlock. We don't need to do anything special
> within the guest tsm core upon GHCI unlock errors.

If the guest asked for unlock() and the secure fw failed to do so and reported an error (which my hosts cannot hide), then the guest memory is still exposed (via DMA) to some unwanted thing. If anything - it is time to panic() imho. Thanks,


-- 
Alexey

