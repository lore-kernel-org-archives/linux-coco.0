Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010055.outbound.protection.outlook.com [52.101.193.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B8568FD9
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965494; cv=fail; b=KayHnfVqdbTOMBMdi7Yt6BZ3PiD2anAOtQkaAC/lXpvuNjC9Vk2T9Vspum1bZdpzvBbw3j7pPy8hr7oi1UDlferXbfzI3DekJ6PTiJMgOkTrbAGgDgc2/Eht8OrPWpYDMKwSb9h47tZq/fdJgj45iU0fQcmQMrDziW+Q6miOLsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965494; c=relaxed/simple;
	bh=3LUjn2owEQtPCWvlaqJ4koTXF+Rwit8l2ZYI1RRUlso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UzWJz3/WUkUYuJFoBnU4keXwxCn/fug8Qr2ohJ0L/0KqcBpHoSDfA2YQ0/321bQ98XTGKlPFLK9gehYfTGs8lrOGhuB43jhj3fWy2rnhuTJ5uQb4pJ41/WyWekgY9xh1ysTqCxdpV2TUHUMjJ6qWUtPzrlirQKVs7+UNmR1oHnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ENDQhZIi; arc=fail smtp.client-ip=52.101.193.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ENDQhZIi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip9iubW34e/t8smZhP42kUKhxgTDa8NW8usmSUaidKcwo0HCBHB/UISUSgmiuV6Hl1oAmyibSQHooESS+691oW0CtQRwGJYQPZjxKBFsLCfpAX4uQURu1fBvZVC+A2b+7P13XbCJWZnHu7DSDZFP6/wqlD/leSfrc1uH4AIGaFV3z+KkguRgOhrxBEUAonLNpodPrCSOxjlykEYMnKwMdO95UiftpHYgB2XCTi4+Cs3MRqx6Jl9BJUoymeQwQmO/12OE7z8R/CGZGUvark1uw20zWXS3WMXzjAWRzaeutPok4WeNtmzjVn9WA+S4xpzAGLI9OuWPUh6ij9e18CXF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNTk4Th8gS247S6v7W68zJNtqz+a1O7B3+ny8/m0yAo=;
 b=WuJsomjV9YJLoChqczc1gRhNcu/N7VYaz1ZtM0eA60nfGdn2LE2+Dr69IHRHpAucb/AUQIslN+5D1vRUgUqBUcmlpV4g8LEfK/64+UorYCqG01HFS4eE6xm2xNffO8KEYNsPjsDzdINJzFxl9wTQMfW/Wr8QCOXcLppCQtVNce+xfcJ/2F0i6z7n2LfwO622+RfSQYM748oOxyFFQhuU+oACGVfz7Z7OwyLdsD0rCeygvhISF3j+obAkWT8+ar7TIgfUK8sTH+55m5O8a+jtNLSyMV9S7I/sck2/bi5ad/OY1Xv9DZ8vvSROtPEy7o+5v/ppeJcevcfTFmUMWJIuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNTk4Th8gS247S6v7W68zJNtqz+a1O7B3+ny8/m0yAo=;
 b=ENDQhZIiwZJZZZEkkTQAwLEmsMst5hJBZ5iTcuntOf8KCv6h59GkglGExcNcrni1ejaUPsgyRwdab3Tq12Ltm2iMrinNCvjW7MtG8WAGh+diBNUYDrdgGgnNIXmijck9KB9r10HQkKcGrt120XSa65iZc3xfdhHISlBptgyg59g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 by PH7PR12MB8779.namprd12.prod.outlook.com (2603:10b6:510:26b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Wed, 9 Sep
 2026 14:51:27 +0000
Received: from SJ2PR12MB8136.namprd12.prod.outlook.com
 ([fe80::e5a6:6049:4f4c:afe2]) by SJ2PR12MB8136.namprd12.prod.outlook.com
 ([fe80::e5a6:6049:4f4c:afe2%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 14:51:26 +0000
Message-ID: <d3a431df-dfd2-48aa-b00e-4eda0a843d8b@amd.com>
Date: Wed, 9 Sep 2026 09:51:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: virt: Fix the struct
 snp_guest_request_ioctl name in sev-guest.rst
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, linux-coco@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Brijesh Singh <brijesh.singh@amd.com>
References: <20260905092942.41558-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260905092942.41558-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:408:f5::35) To SJ2PR12MB8136.namprd12.prod.outlook.com
 (2603:10b6:a03:4f8::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8136:EE_|PH7PR12MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 377882bd-5624-423e-84f2-08df0e81d335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	X83HGKAAeKNb38FUGOshEIKdwdOd6j2A9xPxoZ9qTfxPs8TwQKx/mQmgaHRupL82rI0OBKZp6fZ+ANhirJ++RtmidjC7d6r5kiBVZtn+x2NcPVL3hEInoM5+PYQr7dCn2uzfJcncKDZUsHVPzZEH22LRTlRFsl9RWgg5pR/wT4w/arQPoR7+qEfgAJIH4cRcKq1FX9NEkN+0fW3K+oKTJOGC/rsv3kqRDPLv3kHu3UEeaa6RDbBWYysIJ/DwYvibrb/Ipzsj21QJv3APQPvx0lViBfh+rmLBZ0idhPvOrLmvC7b+qmKcg3Zx040QyDCt0LPWs+PobIUVPS1FdXM/3kur7qPPaNV/SI82EBGcZvD6tN+TLYIxEZigGCSBk3sXWwUf0Kp5RJfm48du1NBLJh0/IALkrI3ccoM7inbVK4oacNi7CqccWeOTcWJj3zdz19T4AMohH9B/DieBPPBUyhZwb18JORdpLnC3DDwYOiHyyXHEoitKBtOwb0/+lxdhv4jxFURMDw77ejpSZU8t7aXP5xaVUxzSl2rEECj8cRrgrmUmTrHFlpsY75t1lv77EAPTGkwJNRATyxbkjYNiEx1ctcC1CL8QwuF1NmYvyGq7Tiexv6Vy3Hvuc4kJu89vT9Dab+WLwyOrIsXxtNJiMBbo8Dmnmq1FA8QCJwKE7No=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8136.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGFLVnRRSWhOMVdqdTVIcmNySUM2SWl1blhQTXc4akpmVnF2cGt2eDBjeDdL?=
 =?utf-8?B?UVJFOE9QWk9JYTJnN3hGcDgzbHdudFNUa25aLzViVVQ2dzhMQzVoclRMMXlW?=
 =?utf-8?B?NDNMTW0xMW1QY0hxMVc2TlJ6cWdzaGRmK003QlJBUTRrNDU5UGY2Q2haMW11?=
 =?utf-8?B?MUJOK2phWnZxTjIvOWNGaTFlTnl0Z1hUQzFZVlZFNS9GbytYSHRnUnQ4cHFz?=
 =?utf-8?B?RlFNbFVuc0FkMVhSNUlHa1JvK2ZqSjRRcWw0VDBvN0NLY2h5TnBQeDNqOUo5?=
 =?utf-8?B?WGVMNkFwcGlpZ0UwSURtVzRiMERPUS85MEc2YTRoQ0o1bFZCRWl6Yi9oSDI3?=
 =?utf-8?B?L0IvNmxvOUFuN2VkYnNKdzJqRGMyc040elN6S2NpUVdGamo0ZjM3M0dmTkVW?=
 =?utf-8?B?WlBPV0pORXVIZXoraEZ1elVqR1NiL25Kb0lLMG5BME51VUdhU0c4VXlmYUw3?=
 =?utf-8?B?dWVJKytqTHBIR1hQcGtRMjEzZDJ3QkZia0JDR09ENkMwc2FEYklKQzdueFov?=
 =?utf-8?B?UU1EK20wbGY2eUVVSHlCcjJpUVpzbzdidEdjUDZrdXp6WG8yNi96QzVUVU5p?=
 =?utf-8?B?cjZwZ1VKZ1Z2eTZjWWR6SVRPbWl0Qk5xZG41R3pkTkxPNC92WUZnaVpjcGFr?=
 =?utf-8?B?YWRldkJkME1ZSm1mRnA4c2dlTXJvcyttUWQyNGlobmR5UExnUUcrZ05pa2F0?=
 =?utf-8?B?bW5oWVJJTTRKeFFidkJLUGJQRUdaWFFhV25LWDhoSzltdm13bVRSWW56a1JS?=
 =?utf-8?B?MUk0ZUg1Qnhldk9CUFdRelVLaGRvUWQwbFM3WFRUcFFNTmM1cm9yQnF0aERJ?=
 =?utf-8?B?MnlQUHFIUEtqMEhJd1AwandLampXaGdkV2ZGM09sZVBuN25Hc3RGUzFuenkx?=
 =?utf-8?B?UFFha0RaY0cvdGhYOHlWRzJhTWdtRXE2d0dnRzdrOENMWmtNdXluYjVCL0Zy?=
 =?utf-8?B?djN5SHF0REtmNGRDblNCTXFFcWxNZTJnU0lmU0NkdGttNFYxYWNjT1ZaYXoy?=
 =?utf-8?B?bC82VjNGRUZyOHRMUjRDZDZWd1FnTVpvYTFLcnliMVlBMWRGc2RMT0xyblhx?=
 =?utf-8?B?alhBQ2JoWnFvWHhjbkRTY1V6VlZLWUM3RWpmd0xXeDVXNWFsV1R0TlBUWUZU?=
 =?utf-8?B?VmIyTVVybXdpUGVIWTFwQWQ0a0paQzRHUjdxYlB1LzZoeVZ2Z0JjQ0FKOFJS?=
 =?utf-8?B?VFN0aFUvQmw2ZG5uRnFXMlJDRWw4WmlxNW5HZ2ZRYkJCT2FmOU9VY0d3NHB4?=
 =?utf-8?B?a1ZEWC9IM1lJMG5SS2kvd2VPc0g2OXNhS1hIN2V2d3M4Y3ZzYnc0YlJVTUJz?=
 =?utf-8?B?WGw0OWYrVTExVGtTYTNzWjMxZGRlbXRqZFdYYlVDQWU2MlVSc0FYaDhLV05F?=
 =?utf-8?B?R2pha1hCMjdBVkhiRXRTYWcvaHZEbExIdVpNSkx5dTFXTDkrN0NUallLRWpq?=
 =?utf-8?B?QnVhZFVnQ3JYMFlBZHJpK3FhQldWRjdiRzZxZEVvcWhPajFQaDYwNDFQdWVz?=
 =?utf-8?B?UE9ON2ZpUVJ1RVdWSjNoTUl6OTdJQk9mcWUwMzBOTEV1emhJRW41YkMzTkd0?=
 =?utf-8?B?MUw0U05BRzFiNG1YQldxcFlQOHJRRExJWE95M01GekFNWnpvZWttT1oxVFRK?=
 =?utf-8?B?N1R6M2xjWFlOeHVwS2FVSTVmd2c2TzhNTmZyNTk4cG4rQjNLWkNzZU9LdDVG?=
 =?utf-8?B?ZzY0WHFHUUI1T2JGSzhSc0VxK2hpd1dneTM5NlR1QktLZkNsWmlwQnp0ZXRY?=
 =?utf-8?B?Zk5janlkc1dmc1lHOE5UaXpJR0lNZ0hzMDlKOVo2TVRpS09abGYva3J6c2o2?=
 =?utf-8?B?MUhVczZRSlBvVFpHdHFZNzFFK1JabXRvUnltUk9CQVlsZ1Y3dm9kRnZOZi9K?=
 =?utf-8?B?NlVVOVlCMHFqZ1puTjVMYmlRenJYTXhjUFRaK3B1cHlhZTkrckw1ZWdtdEZu?=
 =?utf-8?B?Z2ZSeEVHM0wxS0ZILzhIUG56TTROSW0zd0tZUStXV1lKMndCRVJpRDlxOGJv?=
 =?utf-8?B?cU9RTzkrbVpra0haV2NjeDVFWWMyZXkyYkRwU09DL3I0MkEvR0Q5UGtMVkdB?=
 =?utf-8?B?R1NaUWQwMGdONTN0QWZPWTVHcWR5ZmdwQlNQSWorVXhWTGxFVDBnUFFGd0tx?=
 =?utf-8?B?eEcvbFRnaUF4UXFJNXg4R3ppZXQ1Vmt2cXVPbXJlSnc1MWFkRCtzNTZsTXNn?=
 =?utf-8?B?RExmenk0SzVWbmVIQUliaVRMS3Q4dTZoNnplNVlDOUdWS1dkT2VQbXZnK1BE?=
 =?utf-8?B?Tzc2S0toWGZPbWZxOXhmd09xUm56ME5NTEcrWVJiL0liWWxEOTZxQ2VHMUNu?=
 =?utf-8?Q?h74MkJETau3fVvp8qO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377882bd-5624-423e-84f2-08df0e81d335
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:51:26.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vH6BenwgViToAc/1f2ZN0nGRqXGBFUPK7DNbb+lxvLpaNmlu/0Yd85yHLOJhJ/fCHwqZhnGshQImU9523+AcsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8779

On 9/5/26 04:29, Karl Mehltretter wrote:
> struct snp_user_guest_request does not exist; the name is struct
> snp_guest_request_ioctl.
> 
> Use the real name.
> 
> Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Acked-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
>  Documentation/virt/coco/sev-guest.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/coco/sev-guest.rst b/Documentation/virt/coco/sev-guest.rst
> index 93debceb6eb0..3371ebc29e8b 100644
> --- a/Documentation/virt/coco/sev-guest.rst
> +++ b/Documentation/virt/coco/sev-guest.rst
> @@ -38,7 +38,7 @@ along with a description:
>        are not detailed, but errors with specific meanings are.
>  
>  The guest ioctl should be issued on a file descriptor of the /dev/sev-guest
> -device.  The ioctl accepts struct snp_user_guest_request. The input and
> +device.  The ioctl accepts struct snp_guest_request_ioctl. The input and
>  output structure is specified through the req_data and resp_data field
>  respectively. If the ioctl fails to execute due to a firmware error, then
>  the fw_error code will be set, otherwise fw_error will be set to -1.

