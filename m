Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCE44E66C
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945692; cv=fail; b=DsQhO50vNvgDNs4fjEvDTxauWyDHhXzD9ubf7djT34tcTl6pFRo5I2I0iSOkR9n3c4fgOpqnbQ6mOuBAY5nPWxoVonq5VPpyj9po+79gJUS/yLR+YqyGQb1s95O5NDhyNcYRXo32N/kP1lVC7gNyUghdO2X1KPvIVc1+IAn4bq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945692; c=relaxed/simple;
	bh=uI/iXeyUjjhInub6sV/zHtWokl1OGbX71H/qAkRMU/I=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=Oi+tL4XtWQp5wM3XID2h5ieKkdpg+pyToD1RIThhiWexUgxRJd8nNZ5Frpl+2p1C74eAlpu/tD+a9dAYIOujvvhm4Hc9Wa+AAp5agotW46BHc7NaXfS2/u0pe7CtZmUUae3WaVh/yT/V3+mymDhQMHwVMprvw1PfaASSGzrTxCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SxXo59FR; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SxXo59FR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTW2RcQjHN37/nLVhcBMPRYbT7e++n+KU3K99obAGFpDHiB01VZCmptzwAKt9Qbp0N1eapKbV+XfCB8gacmWAYa8J2nAd2hihPDZpVcdiYowi7/jJ1lVJgRdkHPhyqbH1KvUsTdm11pFxRf/eHvEif+/X/EF4L+Ee2jZNh5SGsDR3jXsjOJgjblm6TroEkFvsXo9ZPgLDcAm0TBEVN8Y5i76b6f373PNj6dzWHo6kRE4jXamB3CHqiUZHHU8ad/crQe08Y9dJywzISM4uENZ4BMhX0z2HW4WgrZx8G55nOE6KDTQmrMqWnP8xSA9hMiPKdi2cvHb3jmZkWFerfHydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc0LIpLRVD/88gMCzj0sizuc3ag7pJ5ePqksIdhnM00=;
 b=bRnAdWs03VnNzuIqYkCv2D4H/oUJW9/Hn4+t4QNDTJeHH58YPngPhGqEoof5mW9vHsWRrO56932zsAMV7DZ/uzR5AJ/w7xsnVhPSj+7klRkwjAZQnffgxNPkjW1j4Tgm/Rri5YqeCv0WwnTrvTZ9XMlXxi6XOm0IlxRc/o1lgCnS20/Oc+pQDG1d3pdNttZG1CLDUmWHw/RJBqAT3B17MK6Xrf6x4gFlcd57sINqoiMv78Cn8Bow6q5BN1lVYNKqe7bY04xKoCh+yZwbCHY+nzpdSqLMzMWD+n79XsCIaYFUuAgUmlMPgXUzo2ez3VOSQZb4uQzKR1Lpm46FHD10jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nc0LIpLRVD/88gMCzj0sizuc3ag7pJ5ePqksIdhnM00=;
 b=SxXo59FRLorpC4/afez2MKFuNLL0eTnzfobWlSDbPkw8k0XMLQCIWgUHMMiMq4qBDZgTfa2Eukd28bdZ8LZcpMrqjWodLD5tmHLhO18Qp6TpERUEzPrRjxWPX10uvC0/r/1bJd7pBrXox4A7gzbPVzcc3z57mSbWxQSAMhuvHipKnrXk/ftAx42RMFiC5jFDCBv/KnxaOWCNxQxJJ3oTN8NA83HS80oLqXEWpcvRFzllGMIY9AYQKhOXdN3PhHay9rgczuXhpL4GkM5F/ZRdPCUWZuqyBg+rvQxgrAwjB+EP6YULakPLL4xAwc4tYUf+GTNQ7bmkNFTHkG3386+OaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9608.namprd12.prod.outlook.com (2603:10b6:930:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
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
In-Reply-To: <20260805063255.1638614-3-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-3-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567779.4159892.8570190086048719424.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BN9PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:408:fe::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: b660f312-59ea-43c7-e6cd-08df053b6751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|3023799007|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	1sP4O3c2tjUFMYO8X4Ui2vhZxI6nvK0zs8UOclp6aX+YZxotA0wrpPhcOap7z6fq0vYfS+l0dimN90S8l/XbGrHuU0hqQ+YDv++uW4pO2BqupWFYEcv2d23FnmeqMTR7unqoH1/oiywfWGehm1vt1nRNgk+2iNsDBvZ6XcEX6t+VCUdFSohKjGXXrVMJzQilxMR76sLmgdTCgnS1mLbdCqNrLEsQ10ex8OvuKqOgLUEYdXCH19CZ2GLVg+2DqAv/fgfPIfXOtXAXF47v4Gk8O3d4lFi9stA5C1zWeWBSpoaQUEiYLE4SQC0wKswteGl0B6aixxr+E/DV005ZgnLf0UYu7HGmnWUAIjg9gvWIRKbqRzm4nc8oa4sF0hJ8yklPy1z4dioeOOgu3Em+rO6dOnls/YIqo27vlpKA0hfPZVPxp0gduhhAI31cf9cOYRKWWsizoCr2J1XMiPKbB8Bi1bhoyaoiTpdTUcnU+N6wYjpSLZegbZMHmHuE51Bx85OxKrs8QsnKbizrOEHZTTo1R46M4XvAIYhIxTAHUrjWRHyovh5G6LE4Umc8AoXrlpJtWE2HTlLiE93l9ar2lrPGEIkWLKbw57WXAtaQlp603fZL7IBBKpJZuuU3REwAsHiAs3HJ28/lATyWz2C8Sb3G56+6ePccUPNHYUnnPaz4wrg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmxVZ00xK2Y3U0U1dFMxSjVnd2daQnlaRzhzdGNMS0lxMGdpbXBSd1h6elZH?=
 =?utf-8?B?WXF3QWNxaW9sRThWM1lONStjUmpQaVVoU3A0RUtWMDlnMVRjS0wyc2l3ekVk?=
 =?utf-8?B?bzA0eHJIdzZtWGtpbWl1QTlqRlNjQ1VOUmdhSWdES3hZdXlkVVA5cnJYdlBh?=
 =?utf-8?B?ZVFxVmM2K2Y0aXRWZ29sUTFCenhacmI2UENJNTBoK1hMa0M2S2F3eEpIaExh?=
 =?utf-8?B?TW43NFhBNWxORUt4VkxJL2FLQUN0M3FNdm1VZktBMDBqeHNNUVhjV1lVSlhZ?=
 =?utf-8?B?bTVOMVczUGJxV0V6OWVSbnNXZkV5bUVCUEg3ank4STl2ck5TbXlOdFNUbE03?=
 =?utf-8?B?d3JzVTF3eFAzSURDRDhZR2hkOXdoeVdtVDcvUmdKOUlodnVwTnBjcFJyYngy?=
 =?utf-8?B?dHg3N09WRDZBR2t2a0t6WS9GREVMUU14RVNic0hxMk44RnUrR1pteXFRWVRC?=
 =?utf-8?B?OEtHYmgxT2NxVlBxaDZLZXNOekJ0Y3hkYU5waHVUdEp3MnF1Sk51SGVwZkFt?=
 =?utf-8?B?eG9rWGlXRHg1M21KTlB0VG9kaDdQM1lwUGFObjlwaWExbnB4b0VibFovZjF6?=
 =?utf-8?B?L0dWT2w3UFYvRHVmQ2dnU1RiTngxMGZkQ3BJQlAxbE9RbU9tUjRMcHZhVXh4?=
 =?utf-8?B?eFlaU1BWOEkxMXVmNzgyVHZRcCtLVlRDejZ5eFI3V1pyVnMvQTZhUmZKeHli?=
 =?utf-8?B?ZGIyWS9ZYVZReFpVKzhaS0UwaEw2TVFxMzlmY3FVYmgxVEpoaVJwaUdXeGFL?=
 =?utf-8?B?cnNQVlFSRk5uUFB6OVQxdXQ1ZTUrM1J3Mk5CTzBSK0VRaHBLcGRlWkNncG5C?=
 =?utf-8?B?dngwOENOSEdIVlNxL2o5aFBIUnljWnA5Y0VOcVdLNUxLUXAwNTFzQlBTZlBk?=
 =?utf-8?B?WGh0R2tTNkxlUmRJUDdWSmRHVjZwdWcwa25GK0VROFBDa3BmbC9GanlZVjR2?=
 =?utf-8?B?SVppT0EyQUlvanlPa1RZbkkwSTJ0dUFkL0YrL3Q1M212MHBsTENRUXZHaEln?=
 =?utf-8?B?RnE5MTRXWjUybTJ2cTdFWWRMVC9aYmcwZDZSYzgwenlCUC90cEJ5bG04OWhL?=
 =?utf-8?B?dlhyd1BoZ0VseG9NQk9kVnc1UXNVWE9lM0NyUHMzVjhBZjR3ZC9BM0xEQW1j?=
 =?utf-8?B?ODNNQ0VFRFRjK21xeTlIdU0xNzNNNGhRVEYzYVNzU0RKbTFhMCtWd052aU1E?=
 =?utf-8?B?TytBQzR2bXFFUlVtQ2hHNEtETi9HOVpwQlBOcS9hMnhVdUJ0cDAzSzJvQmJL?=
 =?utf-8?B?ZWRRQUh5T3krZXczOERpQTJrUEF2TGltWldwYmpLU1VUK3UzQXR2aGxkZnpW?=
 =?utf-8?B?SUVRMUt2bGo1U2RHTUpMS0pQUUpqbmlydWdDNTZRMXZOTldrcWNpMnE2NGdW?=
 =?utf-8?B?cE5HUUhScGk4eThuUHlkQzg1dk9iM0cyUFA1UUh6a1pjUnZ1eU1GZCtmYW5W?=
 =?utf-8?B?d0JGai9QMmVnSTArbWNVU3FKL2ZDanpYMGtPeFZhVjNwRjRsWDJSOTQwWHVF?=
 =?utf-8?B?akxjdFNCR2tyY2FzSlJmSy83YVUxbEIxV3NVNitoVUZJd2d1dVVMT2t2enVh?=
 =?utf-8?B?Y25xMkZKajJEYkc0L2liVjZ2cmRyV0NDd3ZTWHdWOWVXblkvWWhWR0UvY05k?=
 =?utf-8?B?dWdsS2tEbmNGbThqUjJJQlFVK1FucGxWamgycWE2NGExN3VPeXh5S1RNNzlt?=
 =?utf-8?B?alFaMWlsajE3OEx3R0FYNmxpLzJDaW81WE8zckRUV05UVG1nMndRMVlLTEpJ?=
 =?utf-8?B?NFZoalZqd0dENnZicWxsMzA4U1RXL0FOMEJMNkk4Qmw1dE9kUDg0aE1Fc1NY?=
 =?utf-8?B?RG5kMXJOUkJCRzVDYWUrcDlhWnhwaFhQUXBvWHY3YndsVlVOSVRIaFJ1REdx?=
 =?utf-8?B?VEtOdnpHZ0x5UjFETzU5NVN0bXZOQ3Nkd21HNlM3ZzM1a09iTkUzcXl1T0JS?=
 =?utf-8?B?c2o2d1ZwVFFGRjhHTW9xcmgwYUJhOHdpY0FKME56bExQbis0dUZGd1YyL01W?=
 =?utf-8?B?aWRrMzBHWUtTUU5SdzVKbFowVnR0dGlReTVYWHMrMm9JUlAzVVlHVWZaWUN4?=
 =?utf-8?B?UmJadlF0RTlJOWpGcGpudERvY2s0MmlqUzh0V2dCRm5nNERZRmM0UFNYZnpJ?=
 =?utf-8?B?TWlveUZ1ZHFPbFVudU92cm5Fd2ExT3pId2ZvZHAvbXJFNzB6Vi9VMXpoM2hK?=
 =?utf-8?B?MUZTZkpJZWFrNTlwZ1JTaWIrZng4aC9GWElhaUJCQ0hhRkJGYkRsaVBIdk1U?=
 =?utf-8?B?ZERMdW9YZ2p5cGswOW00R3hRT3NzQnJBZldyaXMwTnJVRTJzZ0RJS0hLV0FZ?=
 =?utf-8?Q?kOwuY5CXfb5RHsXIWQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b660f312-59ea-43c7-e6cd-08df053b6751
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:41.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NphMTdFu3xruK1aeYrl6Zi/0Rzo3vp9oBq+oVyD+QBZTWnxiTy8ybtTeQtnk37F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9608

> [ ... 58 lines skipped ... ]
> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>  	return copied;
>  }
>  
> -static int smccc_trng_probe(struct platform_device *pdev)
> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
>  {
>  	struct hwrng *trng;
>  
> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
> +	/* validate the minimum version requirement */
> +	if (!smccc_probe_trng())
> +		return -ENODEV;

It feels like slightly poor practice to do this.. It is doing three
things:

1) ARM32 disables this entirely for some reason, shouldn't the bus do
   it? Maybe it already does?

2) Checks the API exists and checks but the bus already did this.

3) Checks the version number

Maybe the bus should capture the version output and pass it in as an
argument to probe so the driver can do the min version check directly?

It is very minor anyhow, it looks OK

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason
