Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A7521210
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788550808; cv=fail; b=bn6wBXkbclG1QBNL0AY+6EkIjdaLZSPHdOwiLn03flbOyi5dj6CLFq1P7ts1MgIiSy1ilPI54jB5+haH5NbE2aUQLW0MqcirjrDA/wSDvENKEGPMV5DF60UweQ9yN447SGVkv8k9gmQvTZ5VqZwudUOhZ4U9WQsnXK2X7OMvNfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788550808; c=relaxed/simple;
	bh=k58+4dB964bDNZBqtvd9ot398nboLyeR5hWo65g935Q=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=LOqVo8/uMPQ8u1eRp1S/tpOQsJj0OzwHuMNcIFA9aVEmGwa/o2r+ZZR/WaORKjlbgzdOaVWNp6ozxdPWV1lzUqYjVl8ZvnDqk2nEh3RznlytEqCJzPxuO1/wzd6wA0+wfZWq3m9kVr1oS59NY1XVWf5UO75qs6Z9ony/uFv8A9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWTECBat; arc=fail smtp.client-ip=52.101.61.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWTECBat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdvqkfwWFbvToxelTRoXF0W8EvEUBUYcyMdWus0Hsj1nHqT7/IwfaN10AKqhNabD9AgBnfrGljzauG5cZwkHi0b6o9pr0JQ+CJwATnLqH2tBwVppy4lf3axqjI5Z+0uW3JI/hO46RQKuEWBHn7cOyVyHkyRu8HysuhBqS2C0ubLEr2cQlCRGmG17txs70vgUb7smwgaNvTuHjzJku+LbvW6panc4cCuNCuYSXcEwT15kEAlujfaR2aBMK6eLsNgeoohBXHUfR0c4tVrgMAcWGlsAw6qlWpjl8veZZbO2e3QCwoYtJK8IRye6R2LxLqf/wCwvNoTmoY2kwaAnzk36Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiOnM0UafkwRV5AXhlsH7e1QZ85+26cObGK8bSTxbtQ=;
 b=qIgKX5kgXmwdS4KdPBWCKjli8zDbT9JwASe/7lSFSVLPDHAqjtEZtlpHWn7ugLxBqtA0c+xrE7VBJPzCPc5l2w6X0AO+0iQBg+A8HM7t3QPdKwlAdTwD9cB+wqv4Vlvu4qsdPHtyfIXBV0JzsYXw/FHrhRSL8Dq3kbfDfmudkQF6TXcjkleBpHqJirY5CbduO14ELzCh5tw5kdouuGQOkmR1LRXtXSAE6oVxfInvGhfEYB5TwBLrTlUG+GWHLvqf4Uz5yaIjvDkHSISkTRLiMBYpAsh16XWMVYYlRIQ/WVHTxDOv4qp9Ipokuv8KleYHWI2Whatsfa4AYS/cAkoTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiOnM0UafkwRV5AXhlsH7e1QZ85+26cObGK8bSTxbtQ=;
 b=nWTECBatbZo1q4P95xfTKbUzbWwH9OZFfqI1QxX6Etn1nIAgswc3d3D1uolFKzMljDGK+SutFWS5kQDMEco2SOq8RTdeA5/NEwTCKi5JaVkzQtKeRf16h52gtK1qxUnx56Ua5M/x1kvAwOfwxMGWEM9lLfvxlvB/7JYsL1KXqBHYkv0FnCOZtix+8uN42oVYNQFFcRMD73e1ZOFkgFQgAhxlwH9wR7QB0Qn7khpanTIBNhFrkQUofZxVilRJXjDA/qMMiE+rHxbxnaJILyWGGyA0QSd270MM2fEYKLnLw9ap7MZ8argY9VcqOjb3o73sfXTC9lNi69MX5acwA5AaQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 19:39:43 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 19:39:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
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
In-Reply-To: <20260904095000.1184861-7-aneesh.kumar@kernel.org>
References: <20260904095000.1184861-1-aneesh.kumar@kernel.org>
 <20260904095000.1184861-7-aneesh.kumar@kernel.org>
Date: Fri, 04 Sep 2026 16:39:35 -0300
Message-Id: <178855077571.693280.17942746234757215326.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: IA1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3f10ab-1b92-4a2b-39ce-08df0abc42f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	1H2kjKd3OkDeGgGtZ97bTfTD3K70JywlyqUtOldvws+wS1Njs/b6rZ1pllwlN7w4bsFcTH5tAojCIDU7SykwENDxJA9naFsTeMwcrACTJxTpy/uEtzLslYVEGRn7RJhnT03QtHeRCN8cBEC5bHGnQXW8ZtPHShpDkZMMWDdc39WGaiaHy0Ei/t8lGpTkkLKtvZVupYIj/6NUg96EabheNsJ31EhVyDAe4pqrNZX2OFdgfzOr9O7T2F63V+/RGpkpzE7PVJsK8Z2CDWFE9Cv6dZB1y8Eei8Tvr1W0mf7H1x6PYV5pb42fbrKniZ9WSQzyAp+2nJ4qLEekE/7WBO892tYzv1BMdzBOPyYb+IoO4KA+IewqZotpL7aL7hI8aQxrVsebcyM9ZSFjhZCpCQuAMYUkQdG0L1cTqugcD5VDNbFNOH3Pv1DyIPqFM9kUNL2eZAw0gjPwA1vMkylke4tM3+ZAk4mebv2HJHdVmosq2PI+A6bgINNn73yo1EjwX42sId6BuA+Plx3fc/bKVRtoblJWUJFUUFtd8SC9iyVba/U6by1VvAreVNQRXOGAQSbKfa+tK+I0nr7QBU1URVTidJFOpS/mzCe/6pMza68cjYIiU4WxlPNnNWPT+y8co0nLzWb3Hxmdw1iaLrwtsx0AhIpqaK6x5nTMFnWX9kaamLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNCdWtlOHN3eFhadk1RTndwUFZuRXNka2lYS0FkR0NmWXhYTktzdURWRUlm?=
 =?utf-8?B?ZCtjM3pEQTE2cFBMR1p6VVNpQjdvOStaQ0U3Z1IvK2UremZ5ditJZXAxTE80?=
 =?utf-8?B?WldPOVNDcTV1MHJuK1I2aktNWm5QUThISzd4c29teFpGWnRhc0FEa1lZVk56?=
 =?utf-8?B?TG41Uk53dUg3QVlUY2sxd1JEOXFqMDkrdUxBdXFUYTIyNUJzaHEwOWd5QzBn?=
 =?utf-8?B?WkhGbWE3T1o0eFZsRER4dlRmblRSV0VTYlJQczhxZkFuS1htaEdXVFpFcTdN?=
 =?utf-8?B?NkhPbWRnNkMrbzV3UmRVQ3dpQmpYL29DU0VveXpoZ1EvMzd6OWNNS0JHRTZB?=
 =?utf-8?B?ZkZZc3NXTVMweWtjc3ZtVE1FQUdoSCs3R3dyczU2S1BoNWlHSTRDUVBZS2ND?=
 =?utf-8?B?ZGs0VitCMThZNXhuenIzTEs4by9OZXpSZTVDcmpKeDZJSDJFRFhyTW1TOHRG?=
 =?utf-8?B?K3lzei91SFFLbHVneWVkMVp6LytJOFlZMHhoenZFVjNtTzdzbTVvMkFmMGFO?=
 =?utf-8?B?ZFpjbkYva1ZDZUJhZ0tuZlNUMjNadGc1ekM5YTNNS3poK3ltVXVNV0FVMloy?=
 =?utf-8?B?R0xKMy9MQWFSTUhINzc4WlVVdWNudnYxc0RRaGlSd1FwbEJDczdrZVZnU2Iy?=
 =?utf-8?B?cGEwckhLUXR5T2tMTHAyR3Y2eUFzdWhoaVFabGxuQjhWaFNMbEZDM25aY3NK?=
 =?utf-8?B?czhIalh1cDJGL0dEV1N0ZnVlZUlNV21uMG9PY1laR3lHK2pEeU5PNGh0TWZC?=
 =?utf-8?B?Zkc2UE0rVXVlR1hyWEJQQkxHWmFtdkRuSElaeURFc1o5ZTRCM0VLT1ppck13?=
 =?utf-8?B?SVB4dGpHdzdsS09pd0lFN1NITjA3S3p4VWdjRjJmWFBXS25lSklpZ2RsR3hy?=
 =?utf-8?B?NStydFpVUWRnd21qZU1nLy9tbEVuRW4rN0NvekRGQWV1akhLMFFuU1o4OXZH?=
 =?utf-8?B?L3JjU0xlQ0s0ZlRtT2FhMXIwZmdwS25RdTdCWWlZNGFnQm9tM1hTMmFMVVJT?=
 =?utf-8?B?d0oySS85aVY1MnF5eUt2NDBJeEUwZFdzTXZMMTVzMGFwRGtaRW1sNlp0SGhM?=
 =?utf-8?B?MlZ1RmlHRWhOL3gyVTlsNXpvQytSZEJIQ1RYM3lnZytaVDh6QXlwbkZqRVNH?=
 =?utf-8?B?WDB6eXJvbHRuWjFrWXhKaks5cUxjNCt6dHdqcU9VSS8vNjB0QjFGVUk1cFlt?=
 =?utf-8?B?RUp1UDlHeG1Zemw5ZngyNkE4eEZsaDNERFJxTmZpdENsY2pVMTh6M0k1ZVNT?=
 =?utf-8?B?N1BFZGNPMUdNeHR1bVdtc0RVMFNpUnNJUk9IZjZQMUpXTnViUFlRS3k2TDVr?=
 =?utf-8?B?cUlvSzR0dWExZHEzTGVaZ3pOVSs5LzB1Z3FCbEl5bjdhT1loU05nZkFrQ2RY?=
 =?utf-8?B?ZlYrT2RhMkZuT0JUVGl4RVB4cGJoTGNLdC9ieGN3TDg0U1B4Y1V0UTFZSUlt?=
 =?utf-8?B?bkIwOEEwcDd5aG1ibnlTNU5PaDFoVWtRVzhJT0pkTnA3M2pqZmNTbUpZOThD?=
 =?utf-8?B?cm9CK1U5ckoyVHlXTGdvbzJVeTRYeUpWU2x4L3JBYTErSnp3UGNjUTliejl0?=
 =?utf-8?B?b2FUaTBGVnlqRVdpUnUyNFh4Z3RzR0RwTWU2Y01DV0d2Mk5STVJBallRdll6?=
 =?utf-8?B?Zmo1VDAvWkg1MThsSVZHZE9jME1rQUJlQldnd0xqQUIydndmekpzajZRZWVV?=
 =?utf-8?B?elcyenlTRUVOaEFuRFhrVzQyZkNqbmN3NDYrUEhDT2lnOGF1L01BWkRoeXhH?=
 =?utf-8?B?M0FVRGFLL1V3WTVDckZtL2ZuUDYwYmZqN0tCOWhFaUEyQ2s3YkdrUFNLbFFS?=
 =?utf-8?B?TlMrbGlMcU9SNzBuOUFzNEtWaTU1YmExdzB0ZG50NkwyV1FxK1h4ZWRBYmhv?=
 =?utf-8?B?NkVzbE00VDNhUDIxWkY4OFRFdTRteG1ROGp1bmpab2VrMSsvR1ZwZ0oxck9h?=
 =?utf-8?B?TWFzNkVVd09ZSk9GVXh5Uko3RktpRWx1OEVFekRtZTB1OGI0cmFWbzhCRU9z?=
 =?utf-8?B?UkFwS2Noc3pMQzFnZTRoNkNvbWV3bEZ2enk2cmFUaWNEbVRDUTRKMVRYc2pR?=
 =?utf-8?B?REI2OE1OdHpia0NZeXRHUWRQQmV0ZFZCY0MxWHBVV3NxVit2OFFLZStqTUVm?=
 =?utf-8?B?NVBDWDJZVGdTcnpuVEtCT0NWU083dTg1S0xvOVZsNm5oNmRRSkFOdXJYM3ha?=
 =?utf-8?B?T2dhNFgyb2FPc2pLeForTUtZOFF2d3RiL3VSTEs0UUNRRjljUDFmMnpRTzBP?=
 =?utf-8?B?U2dkMDE5MXhuTE1mUmNZcy9HR0ZIZ20vQU9yRE12QmF2VnR3K3FSd3BDVTlt?=
 =?utf-8?Q?O5MD85IS7oKHa3PBeo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3f10ab-1b92-4a2b-39ce-08df0abc42f4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 19:39:40.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGtM63mkY177TEpt8Py4ak3uYYS8ftGjrz1YVByjLpU3MQZRmI4JnnKZdsljDZg6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375

> [ ... 42 lines skipped ... ]
> @@ -94,6 +95,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
>  		.requires_smc   = false,
>  		.device_name    = "arm-smccc-trng",
>  	},
> +	{
> +		.func_id        = SMC_RSI_ABI_VERSION,
> +		.requires_smc   = true,
> +		.device_name    = "arm-rsi",
> +	},
>  };
>  
>  static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)

   [Severity: High]
   When this new entry is probed by smccc_probe_smccc_device(), does
   arm_smccc_1_1_invoke() pass uninitialized registers to the firmware?

   Looking at smccc_probe_smccc_device() during system initialization:

   drivers/firmware/smccc/smccc.c:smccc_probe_smccc_device() {
       ...
	   arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
       ...
   }

   Since arm_smccc_1_1_invoke() is a variadic macro, providing only the func_id
   leaves x1/r1 uninitialized in the SMC inline assembly.

   For SMC_RSI_ABI_VERSION, the RMM uses x1 as the requested interface revision
   to determine supported revisions.

   Could this pass a garbage requested interface revision to the RMM,
   potentially causing probe failures or returning an unsupported boundary?

   Could this also leak kernel register state to EL2?

Sashiko still has this to say, I think it should pass 0 as the x1
'requested version' instead of unpredictable garbage.

The rest looks OK

-- 
Jason
