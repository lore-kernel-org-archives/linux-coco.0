Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776152121E
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550830; cv=fail; b=p3vUHiml5qNRGvJ1FyQIBi10tB4Njs5409DUXOHBKIGuQqZxIeQsAI6Vr2td0IW+XZoNX0I9nxpDqcmc9Tu/ajoLyBQFE+eT5Is+x6FX58NmOeRm2OXCxpZ5pzHxW5DwDlWonk20SGomc4ZH7ADBAP7KaA5+G+bjvLK2MV819HM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550830; c=relaxed/simple;
	bh=Ig9DINkLPe84/TE2fir9wN5+DJ0RYTxh2Gq3Ega1MqQ=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=QF4/aj4c7LNEIXOpIwGVyUGB0gtkTHxwkwx2UiPjhM3qwOFNJS65HorJNUQNbX4F/nTSEPsogGwXqoUMW+kV8Oyvg6Sd/8RsLSZ88XULIeJS34B0GdQ6lpL4FcErHhIBmG6m0w6UqKugudjNDHdnOA3jFF5jpdPd+pFo1Wilh50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WV++jxqw; arc=fail smtp.client-ip=52.101.85.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WV++jxqw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teDZwV1CDZo1NXb5IMf8DpViow+PC9N5usHEMgaquosbwDFnASnUlFvBz+8hN7SxjHbl4Ck1uUeWcDvd+YGsy+XPLT+CEj93wijMivdR09jQ8zu6HuAw8CjtPekZZLkv27bhs+0A69DEGEsq4bQkGwmwhXc2X6sa7iR3i91ruoLAnIr3CyTX075pMrwxRzKK+kzWhnXk3T4p8A7UGu4xnslbnNeEFwaSak3av3RqIUU/dXoY9K/S4k5F/y9zcz93OXo+/jm2OZ9+nglk786WvtvBRwQQKn9x2fd2E0SsNzMr/NLkADa//lalNUlz4M88lH3h4AFwtHG+KrOlzRG03g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhB9KGME3KElYFR2jEzAfVmHEnO2xpUner6KQYjswHE=;
 b=CAQVPYGAJJCBX58zmDISbkTu86lNpkHnNxMg+b9Bvdn7zIFoyRBonqo/aMwKVsNHwZItPkRlB7Mdvei7Bxs28EQTJn1aDbiUP+hj9gvbdeP/0O1OnGStW79Rlbu0uzU1nzIHcjCaoy0v+eL0orxyv0E0UbDEtVy/HAX9P8ryhK3LkDZkQWr2BUThLikIxGLOUIk3YPJG2qVPzWBym8yBkHdzQgFD9cLwl2yMJQ/qPhh0bUxVv1XTogAVB0VlOz6X7i9r7q4I8t8I4GeNbmK95H1jIdCvqT2nnE1WU4djCQD9cwzETLCku8z/XF6lfG6d6axOeScKdaT8zqnWQJCX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhB9KGME3KElYFR2jEzAfVmHEnO2xpUner6KQYjswHE=;
 b=WV++jxqwgQDQnCXJbeuU94C7qv3xvNBdwYReLLwkWvzgnZO1hmPureIuu1hzRCcnPkR9Cfh52qqV33ue9jl9PnpZVFy3v+cpRAunc86lz2FFPMRtjzm5rtbRN6sS3ViDvAgj4JTTiFiYwF9e6N9OsIF0sSen5nfB5tKhzvEytsfL1/fypdOFYW5DSaz5q+kav4pXmR0gsnk4QU4vfOyW9Q6104f3gpZ8w3xUVL9euB+i2YKxR/2zcKwP0Gio8HYpQ9Z2VbLzgJiaLAwJTYDpTc6I9b+nOTPQfKgXzxsVY4GV4klgqiS4wX2ntorKv3jcNlUN1HqMBAD8asCS28VUGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 4/7] arm64: realm: Move Realm memory encryption ops
 to RSI code
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
In-Reply-To: <20260904095000.1184861-5-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-5-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077570.693280.10571127158101007822.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd8776d-8bb5-4c3b-ec58-08df0abc43b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	tXM1htOlFz6jRR3vQ2fEeZs3J41ByfilTJnUzF6kF9Yi6JGyvaCDr5Vo9QGVKBeNiB5HjbXo/hMxOb+HvSuA7KG7alYAy1uyKQ733unjRSRNB43G0J27iMpThZSJQhM2wC7W295UCgbZY5uRMzdUEAOTxUL95Iz58bFvSe9e4LQpF29izd3r7nNSbFuPuJo7RoJmdPS1Ok2ZoLSeoec43tlVPRWXj3acw2/mlObZNUKAcZGrud2yN2paviSk1X8ZIttBbSpcTRFcQvL5Bx2ROhRUpeHbbsaDuBzBMLt5Ds+MVkMlE4E+PUcclf/sz/vgxoRFwipHGaCJ8x29NLHDKzLfJ2T7z3t/gddd1aHkqpKCUIbRU2YqOvfvNM2CGvfytDdU7HXC2GfoYRTRp5Y7TZLl05oG0zc+ZXR1zWT+7lSWIRhLbyznFb5dDagRXooSMbV0ECkcpcM5e/rW3j4n//j531FghgyI/GDVf35ySK9zMOUYXI+o4oTj7elgU8GR4pEw+FsB7U2TcyeeUrz1US3+OziXrtQcKKZLJIxsP+90Besn4u64aDtuCY5+4zyxHWdj9r6emuaPmOSKdyZYd/LmfgbLNL6OjPe8qVoRUYLB84pV8A/IIaR5UvzU8BmlgEbx9QwDdvKHjqP72GJiFfZHDnehr+2VsGcAwBFruEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUFZWkI0SkRENERMNGRvYnVVRXJuSjdaRVlSaDh3a01uOXdJNVJyUUdQck9Y?=
 =?utf-8?B?SGYrWk9jR0pEem1rZFYvZXBBRTFnSHlpTEpmSUdSbGo2dkdKeGVTVHJXRUhQ?=
 =?utf-8?B?bk9Ta1pNZjQxNjZyME1TUjFLMkZoVWR6Q21zTCtkSFJJTUU2SEZzT2laSzRq?=
 =?utf-8?B?NW91Wm5kVUxrTmRsVFJDQVFnME1heU9OM0NMTGtVR2k3ZndzRU4waVczRWtl?=
 =?utf-8?B?NDBsNU0wRWhTUVhTa0NYNVVYK3lldHpBT2owQWxYYkh4VEgvcmVUTFYwdHJP?=
 =?utf-8?B?aEZ2c21MekdwblBCbkg1c3NHS3NJQTB2c2F5M1M2SUhvbXRhQy9GNkxaNUJt?=
 =?utf-8?B?VmRCQ21BZFJBbkxwK2t1S0FVcXUyM0xYbzV2bml6SmxLVHVVSUtkTUFxckwv?=
 =?utf-8?B?VTE1QjhCOXFXM0g2cnl4eElYTlVMQkxFTXB6ME1FSnFtV3V5ZjFOd1ZBZkRl?=
 =?utf-8?B?UjRyWXUxQWhrVytYVllOajJxK0hUNGkvZmtCdUlQQnFqT3U3SFVDUGVXUk5K?=
 =?utf-8?B?VWozUk9QZ0FGYm10Mmc1ay9ScDU0ZzNqNkhOd1QvNElNS0dtQUlhQ1Z1a0p1?=
 =?utf-8?B?VnByYWJ6ZXJpR0NNQnpKemxxOWRFOE10TFJ0REgzUlRSODd5aXF5akpFa2JG?=
 =?utf-8?B?ZHlvZU9Kc0h3TytWZk1IaVdCV012U3VyRmhXSVFCM2JCMW5mckpVVzZHZ1g5?=
 =?utf-8?B?bWUrdzFiSU0rY2xLaHRvbUkvcVlsU3VmSWRyNE1Cc0hiSlJjdTZ0dTJFbzNr?=
 =?utf-8?B?RUdZdTBlTnBERkJDdzY5T3padm44Uzg1ZzlYZkp0aHZpYUl4c0RqYWV6SGhu?=
 =?utf-8?B?QUF4NDRaUXM1WkxKNkkyRFV2bnRGR25CcHpYc3F3YzYrQjRydjlJSFZYa2xw?=
 =?utf-8?B?MnN2THNpMDNDVzMvbWZHNEY0dU1HMU8veWhudFFyNk5BaVA2a0xEb3JtSmNa?=
 =?utf-8?B?NkVFUFYyQ0hURUsvR3dtdFlZU3BLVm1hYkpsNDJPNklsRHlMV0ZSZjc1WFJj?=
 =?utf-8?B?MVdOME8yeGg1aFY3MkE0NHV4ajZDdmU2NWFJTnhtTzdmbkZQc3RLOGNFc3J2?=
 =?utf-8?B?dUZGL3Y0OEkrOXNYaktTU1I3TWpiQUl3Q3h4c1MrTDRnREtVY29kekJvTGMv?=
 =?utf-8?B?S0VOb2ZPVzNkNXY4ZXFaSDBMZkt3THR0bVBzSTZQTWo0UHhIa2ZMRktVZXR3?=
 =?utf-8?B?Vmp2MmpmT3BsZXkzNHpYcE9GUkVQeWkwMlBGQWVwRlkrZHYrOHVDL2JrU25p?=
 =?utf-8?B?SnFxb1BIOGxBVWhRTFZ5YW1Za1ZNbFJDTjZyVFdwYW0vOXFzWk4rWlJVYkRt?=
 =?utf-8?B?TUs4VzBXVXJ1Qmtmd003QnVnRVNITzg5amRzOGhOZkZWeGt3RDZOU0NyRTNF?=
 =?utf-8?B?YU1HYWFOUXZHNC9rV1RkY1VWOGMzNG9kWEFTeEJIUy84cjV1alhzcDZSVHZQ?=
 =?utf-8?B?T25teEZ2c2l5d0piVlhUZDR3NGF1V1pzY1EwbXlkZWdtZjNxZFNMZVNVNldT?=
 =?utf-8?B?ekNnenVZZGkzZkwxbmNxcmdzNnZ4TEtOckJHZUpoRGNjQUVvcElaUUdvYVA2?=
 =?utf-8?B?eGh0bTJHQnY3WWRJQjF2UDdQZXp3TGw2SWFmWkF0cW1zUkk3Yk1LRzc1bm45?=
 =?utf-8?B?TDVYanFveHFVek9Pd3kvTXkwWnNNOEFmSkROd3ZMcmN3MkxlZHBUN0VxcUJh?=
 =?utf-8?B?M0V2WGVaMTBWUEtnNVJiejF0QnBnYWVrM2hkR2RZTVFNU0JZYXIycStjeml2?=
 =?utf-8?B?TWFadG1VTVNiNC95UDdUODhDZmUwbC9JRlRJTWNYbU9WNEtyQmdYZmJOSG1K?=
 =?utf-8?B?dGJ3UlJKVFNNamhDYjFBVE1za2tkdWkvaXpvbVJXeWNsSnlxYVVDTXM3aUdZ?=
 =?utf-8?B?R0xjYU0xeExhNjF6Y0NnWDhZY0NTQWhnOVFScnV2bXpNRTBPU3RvQnovNVJT?=
 =?utf-8?B?a0xjRW0zYzJsRzJ0K01oblRjUU43SVZHdit2VnJ6bjhZSHV5ZlduazM0WkRQ?=
 =?utf-8?B?K2Q5aEFZNkI2cTZHd3JZTWY5S0JSVmJHZG1qRG1BM2Vyb05qQzM1aldManRX?=
 =?utf-8?B?Vk95TC9Jb2pCaElnUmJoUk9sZEExY280YzR3b0RQRGxQc2hnM0JZMkR4ODFF?=
 =?utf-8?B?SXNDdnJCRnBxSWJjdmFFK2gwTi8yOVhWNFp1VkVwQTlTQStyUGwyeERSRUM5?=
 =?utf-8?B?ZFpudmtrZnp6OFUzRVlVRk4xQTEzWnFhZTRnOURUY2FBSWdGZnNJVzdKYURu?=
 =?utf-8?B?VXZQVnlpbmhqZ2xIbnM2SkplTCsyQWI2WW40aTJ6NHRoL3VUVzRlZFo2YjAv?=
 =?utf-8?Q?SKa9deJnUIIHtl+6Bm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd8776d-8bb5-4c3b-ec58-08df0abc43b6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:41.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcCyv/XkDj91fTWcFQV3ROJNST7Ybg0aEbGxG2YlUFIxeDvI9hvreNnVnXJOUWFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

On Fri, 04 Sep 2026 15:19:57 +0530, Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org> wrote:
> Realm memory encryption callbacks are CCA-specific. Keep the Realm callback
> registration with the RSI initialization code instead of pageattr.c, which
> only needs to provide the low-level page-attribute transition helper.
> 
> Export __set_memory_enc_dec() within arm64 so the RSI code can wrap it with
> the Realm-specific encrypt/decrypt callbacks and warning policy.
> 
> [...]

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
