Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991472;
	b=QKHl5LrsS3NvVl3XbQt6GUcFBeXmfqPCB9PXXjQyYEB5M5Sd7+MH8hAjdTHUsurtHokw
	 Z44d6OmmO35TYAcHrTDhNE/3ozlixOjTLMIQ/A8K6W92xHgsc7L4Wha3cz+jGaG5sYPb6
	 udIMKwJa6E7SVmGnNLYIGoTnETtA2zfPQrLMrplPvaUdrVDBbtqJ3Mjas3B4o4tqi7yz4
	 OS6o4j3ot/GiRVVC+A0nGgobZ+GM8ss71UAay4i+tEV6G5XICxwF7QvTL2Zj6Xzj2oY9Q
	 I4kWHwAiBvJ3iLdSdIdn4ioDjtVtdW6ghmBg2bO930RQ+FPHu4xWn5CQN+tgi/OtORw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991472;
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
	bh=KmW/YsBiNIKpbXQjO6aQptvxq8two+HIvkEX2v6Pkcw=;
	b=qmlxYEg/7tb59jRl7kIi1sGBGFYNIYAxJjT84ii8fuc3GYyfgcBOZr227FukKoWn9+w3
	 bMp2Ab3jQCiJTgxgvbgHfU9XpeJCex6oHw5c7yNhy3UEJDfu866jJJKGMncsNLoBag6Ga
	 ccydMiynPVwfcEwWs+0J+wTvhfr1HYraCC5J560mpEx7KvHU6NJwHMquunlF3KI0WdydJ
	 cnPjXVrP7f6H/Sh/F7B3S0FqB5BPrqZjH+mYW/QBDXzw0kimAn3nKnTusgk/usdl4ltUm
	 F7uNJYakuH9sBuyO048P1oA7ZhngVHHDBz7N3MfSCK8VSuNJgzdAlMhn9oyXuMU23tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ki2KmGB1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.52
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012052.outbound.protection.outlook.com [52.101.43.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE2A606A31C
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 08:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE2A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ki2KmGB1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlJDwKSiEa3B5IrtrEufVUTX/9O8JyPz0DbGZkDaW5hXmvQcu5q/5kDWx2ledX8i34084Fe1xrVDIql0g1603ZrF/Z9faW1AGVLclffjQ9Cw/n6k7KeulsLJAPANYNYtYZkk9UElKW5az0mjqqGzuxN4a02y2CMF+DZsBlwM5qdjwZB0ikFfuGZ9wTkTxKh3UokgQRVU+syzZBFUHJ4iJ1kqqSQAbO/BitXt8BYg/aIZvQ9sT7y/6ZT+rQqjjlZMfp477iHdfWBvC6v3oxTnoHiRO/GdQu2LOJTVsfE6A2OZNUpnSft1zCIbJ6Z7GGUo9vlQBLWiKjLDMImofJLtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmW/YsBiNIKpbXQjO6aQptvxq8two+HIvkEX2v6Pkcw=;
 b=Uj4YpO5kTsHYJn21qG8bgdnQIQcP5onMv06QYWc5tBZqONAUQx3f0VOZVs+v7EXeqYsbqMvKldD62GllkkUeT5tDConAKPIlK5G7kmDcwo7JN1GtY6VGZygeCLgcGMbspZLoZvhz2B1HVvMHMDcrlWgxkl8amZEQEWZgbRROyCkIvyA7U6LEp11t0XhaklrEiWzgOUbmDOwSi+zaDaLpemAwxSP7jUdhcEtdc8rZhp4033YIyRIKqpZEB2FerXsDtqOkHVHd9Zl6ojat6hZixVerbkEuv6ldnsb4FeMnXhQyP/zvG686KmnjT+wSztbWXtTbejhhgHYaEFoJOK0e3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmW/YsBiNIKpbXQjO6aQptvxq8two+HIvkEX2v6Pkcw=;
 b=Ki2KmGB1QqjPApS8MmRbD3qpC8KSNwrjUecdOaJyia2m9tDeHiG+rXVTrOimPdt3VSOumUQuGJKdvTpZXuUobkukC3m2XEj8ES5Hee/PCjcrMxoiX0raFrNLj+u1tc1zc4t0sRESv5Cp3bvdPrn4VbkpL/Y1o3JsJO2tlwaCYXI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by DS5PPF016FC81DF.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::644) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:44:28 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:44:27 +0000
Message-ID: <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
Date: Wed, 18 Nov 2026 19:44:21 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev
Cc: Jason Gunthorpe <jgg@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <20261116075420.76205-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SYYP282CA0012.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:b4::22) To SA1PR12MB999228.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|DS5PPF016FC81DF:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf92164-0b19-49c0-2cc5-08df45502745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261009223027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261022075727099003|261026121527099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/EYlvRQMpL4K8X1tJwoBMnhyN2ioGHRb9QFqXNkOAgILhP4+mTO6uCjuQboNPX6e6pkMkjeEH8siGqfn2W0J+i3PZaMloT++hEbK1HIoU01XU8HlgTqyYZOiOHzTwj0LTlq2sPxBkW7DpDhLaRMHPD9tQmyWl3pCMSvxUP4ocwSTWuXBbQ6GS2NuipDFH+ddZcMYbmOghSX3JNluyWnwqeSgEr3WXPD7YSZ+v8ENkjHhxv4aMGih65CExKlfsUaN2BhdEZuc0GiTqkp7d+lXeZBy1UP1x8JFyLYJzmPXeglPmV6I0YTQsSA/xn/mxbh3TX5R4THdLWxddaveioCquxZXQkNcKdYacFGJZK7BQsBz636yXZqBDErs89qLM3fUSnYkuZzvNSa8ttTrGPBfT/pFKtw3LPQCqcePMkaZu0rtoIx1zoHz34IWSq9vaj+PVmLr4YIqPFHTo9laXZKPgLCAgoCCSe63SLdMFmWw27RWIgMaZ0T33w5xj4Sf+DsnhVMxzkZNkruoH1S7eemzetVkf4YGMzoFqXIjDrwUyI8K+GET6yTmNN0lA/MdxDHKBHpFAmHmiBXTnHeWMoJpiKIyJnkvKDATKZHwP3quSZtzUOpEgO8XOgthXhhOFHtmJC/CvosZjaK7qQf4AOMIE1LAQEEyFMAkV7PDl5uAIJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261022075727099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDBqSkdjZ3RCSVRGeUsxaTNvb3ZNYTNVOXNoWWZ3UTcyZkt0aTk3cnhwWVE2?=
 =?utf-8?B?Q3JuT21LUE9tVXQ2Vm1wL0U4d2JqQ0RxZmpkOEN4T2kyaWJUNzRJSTQyZWVX?=
 =?utf-8?B?MXNlalREVlpLczVmLzRpWnZFalpTSi9CMGdKcDRQVWdBeldad3F5cG1XMnRp?=
 =?utf-8?B?SkZVR0Fwd2hkUGJhWkNUbVBqWEp5MUNueXp4eFgzSTRidHFCZFI4Q0JsWkdw?=
 =?utf-8?B?ejBOVnFFUDgyS1hMT3FUT1drYTdpNGVLT3JsU3NUNmZmc2dKeGVFK1ZrZkxH?=
 =?utf-8?B?ek9Tc21PNzBiUk9nQXJBQmxoZ2JHNG1QRXI4N2lpL3ZtN2xsNFlIMTlFTnRP?=
 =?utf-8?B?ZHp5YzVWU3BnU045TDRkSFAxMlVZTGNaK2srRkdydlY3Sis4d3VTZFBOcVNC?=
 =?utf-8?B?TnVRNlBXcDh4T0VQMmQvL2JLdUg0MzQ0UnBYMFBDMTVsME54YUlhN0R1L0NH?=
 =?utf-8?B?N1ZDS1lOSjRxK1YwRnFtc3pFRnVDTEFrMm14THMySUxPVW5qSlJFV2luUXdx?=
 =?utf-8?B?enMvcGc0S2wwQlRIZXRpWmUwVWRBT1N2WlFwbzlyb2wxUUtjalNNOUZhTWRp?=
 =?utf-8?B?Z09JQWpGaUt0dHNYdDJTRE42Qlk4cFhZS2gxVDQ0MCt1amphZnZmRE9UREJP?=
 =?utf-8?B?UG5wYjNlT1lydTV5VUhtSEJIeGEveWtGUExSSkJ2dFVQSjc5blZMai9talNu?=
 =?utf-8?B?c2NkTC9Gc05RQ21SSjJwKzdaUkd5aXpEYjBoUzUvSWw4bmdzL3ZvUnhGVE9a?=
 =?utf-8?B?U0NuMkVoWThweC83eEZZc2Jpcy9BamttSzc3dUk0T1F3bkorK0FBUFVrSlVG?=
 =?utf-8?B?VS84V2FiQjFBa3VEUTlLTDg3SmlhTXVKcmtnU3hZR2h0YXNtWHBMQ3B6eU5J?=
 =?utf-8?B?ZFRJaSs4MUIzaUhvT2JEWmZhekVqL2lFR1RUN1ovd2FsSVhlbytmcVdFc2JS?=
 =?utf-8?B?bnJZaWVsUDBFMmhDZ3NtdE5jTFVSVSs3VUN4b05keHNwRFJUcHR4VGFnQnEw?=
 =?utf-8?B?cWY2QWcrckZvYTI2a09DdUJaOFNVOHIwbXFMQktEQTJUY1JPUDNUWVZCUHdu?=
 =?utf-8?B?eFpnQ2t5ZjBvcCs5WXExZms0aTc5SldtYzFtMFVXaHl2akk1Q3o3MHQ0eFpW?=
 =?utf-8?B?U2l1V1F0ZFJtV2Qyc2syYnNacllUSUlpL01vTWp4TUtJa0ZIWkFkaHl3Q3Y3?=
 =?utf-8?B?NDRCSUxWUHVkdTBaTGUwY05jb3hBS3RweEJ1ZS96YlZGbFV1cTJZTVVvL05S?=
 =?utf-8?B?ei9xeFNYMmI3anpId2FNd2F6Q2Y0QmVjRGJPc3JZTDB3TlM0bWxoZVVTR3k4?=
 =?utf-8?B?cXZqSG4wTitUZ1JXUTdsYkxnZ2t4S1lTeXJuWHk5TmkzVml5OWJLcjhNTHdv?=
 =?utf-8?B?NzhqNHhXNTRaV0xSaE9XL0pRNDdOTVhyVUE0OXVVMXdGNUJwbU1CWkhXNFN6?=
 =?utf-8?B?VTRvNlBHTmxkSVlvdHJFNnZ5VTJDZ2NUVis3QXd0YjRWdWlCSXRWZ3RrZ3Ju?=
 =?utf-8?B?NEk4M2I0WXA2c3JSZ1pveUNERktUcE5TTTNhdEswUldVcmpaT3lsNk54NGo3?=
 =?utf-8?B?SGk4bnVWU0loM1E3d0J4VWU5MVhiWTlha2hESUFMUEtKZC9kQ1NuWG1ZeTNR?=
 =?utf-8?B?dTJKZEVnblNDWnBRbERkdTFWUHRSaVd1bkNYcG5EQkxLb2RxcnZ1U0FuVVNW?=
 =?utf-8?B?Qkt3cmdoR2g2cDZPL1hheHc0TlpVRjVnR2Q3akRVYi9UZStFUGgza28yZkVV?=
 =?utf-8?B?czFIZkt0MUFQU1Zwa1hoQnk4TlA1aDFYVk1YczZsMS9vWXZQU09TdkZ5MWkv?=
 =?utf-8?B?djFLZlZhT1hBSldhdHNFTnZrYStDTjhOVStPbGFuMmYzbForY1lkc0NTcUJn?=
 =?utf-8?B?ZWFmZkJ2MTVUZVlqV3BXQ0Vyb3ozZVlQM0FwSG1HbC9Ham5BMXd6QVNCR3hx?=
 =?utf-8?B?RjIvVGtBTyszalA5OGRKRXJsVUZoV2JaZU5mTWpoRXppTXE2UmFJMkRKYUJp?=
 =?utf-8?B?eXRNZ2VuQVNLMFlZTzVGVi9YeHBXUHgvS1J5Uy83WjV3QVZmRlY3eXpvaVpa?=
 =?utf-8?B?ZE5XQW1JWWwwRzBrNEVsQm1ra3lBMnc5QzJmMmFPZWJtVXQ4cStnd0sxYWUw?=
 =?utf-8?B?UEdqTStKU3FETFRyWENBMWdieWgyUnZlTUN0dWRrQUc2VytORWptRnR0cy80?=
 =?utf-8?B?NFhaRjl3MStxN0IxbjVEbUo2NlhiTkNFbjgycFR3NXdlcXBycmxQall0MmtM?=
 =?utf-8?B?ZGx3c3ErOWp1dnlsRmZLdCszSHRpay96YkZzMEdab2ZyRHFHblBTckQvTENE?=
 =?utf-8?Q?ACkbuMDY8/xeHLGDcw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf92164-0b19-49c0-2cc5-08df45502745
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:44:26.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7toqRVxQqVncys8cbye+5KxVwaTbKjnAZga/YRRdK++nedy/OFxJKf9+KxM9du1edbwsJVJzuNTI0iW6aLgyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF016FC81DF

On 16/11/26 18:54, Aneesh Kumar K.V (Arm) wrote:
> Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.
> 
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: linux-coco@lists.linux.dev
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9..720fe907885b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
>   R:	Lukas Wunner <lukas@wunner.de>
>   L:	linux-coco@lists.linux.dev
>   S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
>   F:	Documentation/ABI/testing/configfs-tsm-report
>   F:	Documentation/driver-api/coco/
>   F:	Documentation/driver-api/pci/tsm.rst
>   F:	drivers/pci/tsm.c
>   F:	drivers/virt/coco/guest/
> +F:	drivers/virt/coco/tsm-core.c
>   F:	include/linux/*tsm*.h
>   F:	samples/tsm-mr/


I wonder if we can/should also do this now?

+F:     drivers/crypto/ccp/sev-dev-tsm.c
+F:     drivers/crypto/ccp/sev-dev-tio.*

Or move the files but where, drivers/attestation/tio? drivers/attestation/amd? And the same question for ARM/Intel. And do these drivers/attestation/* become modules? Thoughts? Thanks,

>   
> 
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3

-- 
Alexey

