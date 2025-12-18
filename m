Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F385F2D4B77
	for <linux-coco@lists.linux.dev>; Thu, 18 Dec 2025 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766094092; cv=fail; b=E6N/5ctSjtaljYltDg+8bCQlPEItND79A+9SmqMtXOz89lWB4Gi9PUDvytoBi+6wOidXjPSEVkKeu2TLVPZCHUcXxP1SrKyjEK8QyiOvegVzgBsvSp82dy8ftZzCf70Q4hveGoWbaMX+IHs18ivfTC54auZwD6HPVyBgnPOZ69Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766094092; c=relaxed/simple;
	bh=ybxWPAmpoawgNmRxzbjR7zVm8x5B2pwTI1Av0Fc2UTk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lgnAjGrck1Ti8WwlB1O6RT0JY7wybwB/rBRK9LXb678yXaGqUydEGC3dRr++8i0WSKjHMlQNhnIH2IMGiVoq/s8abrhoIJuOM+K4TaZvux6QsFt0lvFtJe9W4PIrFTtxtlzIKTR4Agj7zZsHv+UUxyDbaU3dZL4aboSFowSTTAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cxwuCUHJ; arc=fail smtp.client-ip=40.107.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cxwuCUHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGTryWxJwJYhpG+sN+jd7qUDVqn27Mvtyr9lENrQYNSL8+kstvArYmuSu8CToV7b69FlqHjwNA51gbNDs0HdUvOGYuLWKpwAWSpsZtkPPQSL59zj931pZbvyhdn+717Qb+Mtc6TqJooFg/U0sa4WgvO6kzE2IaUjXY0LWxigZ1XSRyLQfM6Eb4Hy6yQSTsPMd3eIpsoBNMdo/ZMI0THoUv38um3yDv1od98l25ALF+mUzm5CGrtxlRKzEnH9ADc/d9TeZOBeXBoBa5PsIIiITFoXR1WzCyNV5pKB8k1sh38ckvjnhwbKu4F7/XOl6kjsyjVQzblkm0x8mYnUhhbIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEdYwEjfzpfXzs3FUg42tVaj7c9yX73T7Y3gBYu6/wE=;
 b=sjSDETqf7Gksyn2YdeeTK1MCRDp+QhPqs4rueaypRLll4eqe6G8ErCAc5ReDVct2nVv2kA39yZtK/bxIuW5thKGQ2LF3weVp42gn04mR1Z8u9fXknbSPYWQJGf0A+kLm8y1po9qvlgdjdMWFgDTqr8wLdnbG8yDCjTkjvILWZN560T36qmv87OG55JwRUgdTIf1vsib/JaTxWotNcvW3suHm06ZsrZjq0ZLmZjIa+tvnZXGILYc17wYFB/FjsKGuuBonNmD23T+UZsCbXaLB9ro1SQcRXHh+sX0tTvP49wD4e79OQCzwAlUf46L4Xl49ZoRwmHt61lrLgEid1I9wjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEdYwEjfzpfXzs3FUg42tVaj7c9yX73T7Y3gBYu6/wE=;
 b=cxwuCUHJeotGFsCbjzUTGdW79b1zyN1WLvnhvDhabo/BqgEvFHFBHnqxltiYkF4tAH7P+I98Q05FQZL2BDVhZl35TFfCs/DQwgZ6VYPvO/WOs5JonPkvv8kJf3FRsIG6W0Zt5AJsXxpKWjhitphvApZZFlywpWo5Hqajefq2B1kbmvBPCZAIWoFhmYZ5C4B0qMGykNAEhyspq886ErXfLpc8Y0U72YOitTNLwrZpNPNpxkBx+S4C1z/qZEwhGqolir0mBTGmCNluQueuVyt47g62ChNxU3hOPZ7JkuzWVxBOSFXaXEeVIqH+GIu8ShHPgM754wc4c8LdmlZxXBEKHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.8; Thu, 18 Dec 2025 21:41:21 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:41:21 +0000
Message-ID: <3fc13634-43d1-4447-be38-73e68fe7f36c@nvidia.com>
Date: Thu, 18 Dec 2025 13:41:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
Content-Language: en-US
To: Matt Ochs <mochs@nvidia.com>
Cc: "salman.nabi@arm.com" <salman.nabi@arm.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Varun Wadekar <vwadekar@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi
 <vsethi@nvidia.com>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "chao.gao@intel.com" <chao.gao@intel.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
 <7E7A2433-67DC-4AED-94E0-E096DA9CF3EB@nvidia.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <7E7A2433-67DC-4AED-94E0-E096DA9CF3EB@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::6) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df76dc7-80c5-4600-17ee-08de3e7e2f25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amZISUlGeWFraGQybEplQWxkWlRjcWFDRkVoeHVGd1FoVDZRL1BNMERNc3Zw?=
 =?utf-8?B?TTR0ejROY2lPUXMyUnZLREZxWDhWbEtRZkd5T1l2bnZJcDVTMXhqVVV6TTFB?=
 =?utf-8?B?V3BNOXM2dWVENWdESVlacWZHR0pCZUZ5c00zVmN3Uk5BR1h4ZktPMGVhQ2Uw?=
 =?utf-8?B?MzJsemV6SHpEZTA5RFBRai9nM0ZucDdMMjR2TVJRNDlFcDJxK040Y1FtelZY?=
 =?utf-8?B?TDRjdmRET2ZQL2tIVG1oM2xHOXIySndZajU3cnYwalpwRlBjbTNrYlJPZEVE?=
 =?utf-8?B?R2IrRUxJVGNrdE5vVkdXbDZXL2JscE9jUEJDNjAyckFxZERlOHpUNTN0cXhG?=
 =?utf-8?B?am1zaUdZNUgwczlLTDJ6L2QxNUIwTktkQWlJSXZNNDdYV0FqVTFRSXlSWFZH?=
 =?utf-8?B?dmxrUXlCNnBsL2tMakdjK0FyYTNLOFhoSTZUT01FOElPbXBkcTh6MmFQeUJi?=
 =?utf-8?B?SWVhV2ZMakhLOXlUK2VjbUNBc0NwSTllL2lYRmZiNDRUclZSa0NubW9EbDBW?=
 =?utf-8?B?eS9xc0FISWJmQ3RYUVpwdk9vRzFiQUYra3pzakxaREc2Y0JFOEt0c0Q4NTFM?=
 =?utf-8?B?Y3c4MFkxaHVIV2Zpb0RYZG0xOFRTQndWb3liRWtZSVdXUW9FWTJ4anRZMkwy?=
 =?utf-8?B?Wk5uZnFTSDhlOWtrbjMyMmZvdjBDQ292RFZnYUY5USt1OFFnNm1CUUJNV1g3?=
 =?utf-8?B?NjBYclpYOU8rcVUvTmpBT3kxdEE5MVI5SFNkcWlGcE1UejVQcEZyOUZTa1dM?=
 =?utf-8?B?U0ExNDA0ZXU0WW1mRk9pTm9RRkFVcEp4aTcrVHk5SHFVb2cwdE13V0lmZHdp?=
 =?utf-8?B?K3BUdVJ6L2Q2bU5VU09hemFrSURYZ1lMSkJ4WmZRdG5nNG1udnlIZUVOdGlW?=
 =?utf-8?B?VUJ0am1hSTFWSlpwejNmZ2VyQzhnd01LUHNoVDA4RG1Db05DcXF3RFNzVmN2?=
 =?utf-8?B?NmZXWE0vbnVBNFJya1ZMamU0eUcxVnhWSEtLOHBRdG93Y2tZWlQwVW5pUlky?=
 =?utf-8?B?dXhEcHhhMGtFL1hvNExnY0svVzFJM3NDVUU1UUJQcEdBbUx5RzFiYU04WUNM?=
 =?utf-8?B?ZFA1dDh5UncybS9tMUV4eTZEbm56UWRzR2kycE9lNlU5OHZtalVuZ2dTQkNN?=
 =?utf-8?B?TzNlU29kZk9iMzFQYndGV2w3WXpkR0FHdEF0VzUrQnZEY1VOUnFqQmw5SXdB?=
 =?utf-8?B?dktRdW13WTMwUzdnRnB3QjdyQ3dkaGlnRER2VS9WSUV4ZUxXMVFwT2d1ckNa?=
 =?utf-8?B?RlVNSSs2QVRpUitUa3ZDWkhJMlpMTVE1Si85dlRhQnMydGtycURsSUp0RVhK?=
 =?utf-8?B?TU0yajZrc3M0VEJvNmkwSU5pL1ZJTmpxWHlCdmZ3MnYwWjB6dTA1TWRsK2k1?=
 =?utf-8?B?U3B2TmdQeCtRMUNGQ2dWQnBheHZNTThSUWIvSUhJbHhGSTJvV1E5SkdxRzJx?=
 =?utf-8?B?U0pwZjNGelliZnR6dStOYmY2Q2dkNkp2MEpyVVJXNWp1WlV3MEVxcFZjTEU0?=
 =?utf-8?B?YWNRVzlWU1pZZjU4S1l1aGRrTzdQRm82cEg0bjVsSHA5T0ErdS9idEVqbXFn?=
 =?utf-8?B?a3lmdzRHWXZ1OFcra3dYalR0VHgyMTNXbG9jNkd1ZHNpMk4zOHgrQTIya0pC?=
 =?utf-8?B?eEk3TWozeWZ4MndaNXA1U3VhS1ZLejdMRmUxREhXdEJTRzhxRFFVVkQ0Z3Ux?=
 =?utf-8?B?Zi84d1hoRU5Ddk1CUzRjbGVReXo0a3lJZmVBeEF4NVpXOVFiNHIwRDRweW1x?=
 =?utf-8?B?KzM5cEIwK0l4QWVyZ3I3aDRKc1hTYnh5NEtZeG5iUnJoeEZMdytPd2RhVndI?=
 =?utf-8?B?cHhPK1pVeWNBZS9rbUJ0aDFlUFJyMVRxYW9RVllaTnRGUFNkNWg3TFh3aWZa?=
 =?utf-8?B?Zm1ZcEZIR2xaS1dOajc3bk96TXBPN2h5TG95NTFySnIzNVRucjc3UDVlQmdJ?=
 =?utf-8?Q?95shDgXdX3WZ35Cni5z93rBqL6oa5m3Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L21INTIyOTc0dno4TGM2YjdaSW9RRUNLdWp6Ym9DY3h0dlVtdSt1ZzQ4U0Q4?=
 =?utf-8?B?SGtuZ21hVUdkQS9TRVE1OTV6V012L1BiZEpvK1BoNG1NckFtV1pzTDhUOXk2?=
 =?utf-8?B?Z1VWcEtvZkhpalk1THJTWHhzRlRDLzZLUmNBaGdoRzJZYThEamtmQU93bWxa?=
 =?utf-8?B?TE1qY29OM0FWY0pvcVI0NHNCaWVwOFZKMHQzTllNY3FxSlpNLzVkckZYQ25Z?=
 =?utf-8?B?aEpFR2JtSkR4SmhHZ1IxUm16TzVxUlh6NWtXcmgzaWZDd0J5bmlFR3JIZ2wr?=
 =?utf-8?B?QXZ2OWRydi9IVWlZUEpFQW1tMmt5N3ZxYTUzeWM2cE9TdVptNUhNWFZtcVQ0?=
 =?utf-8?B?REU1ZW1ZcWJEUjM4cnlhSFFScUM1WVNHMldkelZEVlp6clFwMHY1WlBORjRn?=
 =?utf-8?B?ZWlYam1oNnFsSU82SGhMeVk5bko0UElvQkt2K2FvY1RtckNUb1paU3RZSzBB?=
 =?utf-8?B?bGE0aEd0SC8vZVdQNVpkeVRFamZrWnlFN0RuR0hZR2F6bG41enVDZmdPaW5w?=
 =?utf-8?B?bFhKMVdPTkRSV3AwTUxQOVpNUXB0b3lKczFCL2hoSERlc09RSjN2a3FkaFRn?=
 =?utf-8?B?SVp4dGc1M1dkcHF3UUplc004eG5oUVR5dldYVzJpVU0vbmlBVEFHV3NYZllQ?=
 =?utf-8?B?Z012MmZaOFk3SnNVSlFMYThjM1Q5QjE4eDlackxMdkFRL2swV0owT0VndWZC?=
 =?utf-8?B?SVJwdVRNOWduQWNnSTBETU0yQy9JV3RiMDlPNUtkRmFMZlR0K0l4U1VYWnRm?=
 =?utf-8?B?OVRwT1JrTXlwazNvQUo2dFFJL29XbkdRT080REQ3dSttMys3eitOSlQ0RklC?=
 =?utf-8?B?SzQwT0xLY2paVyt5U3RUb094L0xkV0s3Z1VvRDAvUHMrQ2V3SDk0N1ZQVXRM?=
 =?utf-8?B?cmJLSWgrNVcreWdpSExUdS9PekhsMGZrZHNEWW1tMzlDcGQ1WEYxbkNKdzVS?=
 =?utf-8?B?cW1saUN0V0VKc3RHaFRpQmEvdVh6emE1TG4ralBqRVREYWZKNUtzM01IVmZr?=
 =?utf-8?B?WERLSUlFbU5FbTdkWHNTNnBGVDc1NGlYaHpiM3dHWFdaQlBReVBUZXlkQ1du?=
 =?utf-8?B?Rjl6aGMvYXRQeDh5OHU2K1o2bmtmUzJDU3ZsYzRCUGdOR0RwVEN6ZnA4bml4?=
 =?utf-8?B?bTMvMk13WksxbFZrWnU1b0xyWC9uNmVsQkEyY2Y0SHVCRTVoeEwycjg2eWhB?=
 =?utf-8?B?UkgzL2svcldWaDFJUVFqMHhSL0JLMXpyVy8xOHh1RFpTeHYyY05WcU5qVGdS?=
 =?utf-8?B?TDl5SnVYSlRNUmRISGdtR0ZSSGdRU3gxQTdrYUR6Z2oxcVdURGdCMGwzeGE1?=
 =?utf-8?B?ajFRZ3orSDFHMDF2bThoaGhEY2VETkVLQ0N6VnhWR3JIczZRTjFwakR6SVZE?=
 =?utf-8?B?VEJpOGUxL1ZQdkVtNWpMcHVWQ2NUV1VaS0F2U29GZDk0QnNXVnh2SE04UExB?=
 =?utf-8?B?anM4eXQxNnZucmR0QVhVU0dHcU9hTmsrUGRUcENFaVlSTE5MTm82V0E3REs1?=
 =?utf-8?B?cU4vMVdoanlrUEpoSklyWURDVTdKSTk1N21PaXlNTmN1L2NZcG1SVnViY09x?=
 =?utf-8?B?RnlreUZJSjB2eEswbjV4SjYrYmgyQnVRcXlpb0FPZlUyY1ZwVTZoekUyTlNI?=
 =?utf-8?B?M3g1eGFOYjc0Q2t4MFRQWGJodFZPdHJJWm9GMXFTTGhrREdmVzB4TEpIN2VN?=
 =?utf-8?B?bFFBL3lNakZpbE9BRkVPSDRjSWVwSFlVQUVyUW4vTjIwRDJSbDZVa1BGdFIy?=
 =?utf-8?B?MjJBZTVqMjUwTExxVlhRRTlQZXlNdjNvdlhrN1k3NTJ0UEMwMUZweDVZZXJ0?=
 =?utf-8?B?RmJVenlOc2p0cldjQ1N3RUgvRHRFeFo1ZGdVYnYzT0NWcjk4UFhHYjNDYzNW?=
 =?utf-8?B?SFJtRWRxRm0vc0lpbzhKZjlrUUJuZG9tUlUxL3FNcnMveU9BWVFReVZXKzVz?=
 =?utf-8?B?QlNncTM5WXAySmxyOHdJOVZKNFhXTmZVeGIvbkdZTWZzRnFtQktVMkxPMEJY?=
 =?utf-8?B?SmJNN01ZM1cvVjZrdG15ZGsrZSsyODVXMVg3K0dFaTNGREZiT3dwODBncGVy?=
 =?utf-8?B?cmpTUTE5NU5MR0ZERlRVRkVEQVdjVERsMDJTdkdYdm1Nckc3aHRidGpncEIx?=
 =?utf-8?Q?7Dzq/MQux+QQ/etQPZVkGcV3V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df76dc7-80c5-4600-17ee-08de3e7e2f25
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:41:21.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RdAfb3NybmPZoAZLvS/HEffpUPChiPrWaN86wDFambywwTpyeu4v/Xn7IYx22mH/aqZAj+SYmV/OMARgEb/yVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504



On 12/12/25 07:31, Matt Ochs wrote:
>> On Dec 8, 2025, at 16:13, Vedashree Vidwans <vvidwans@nvidia.com> wrote:
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 0e420cefa260..24916fc53420 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
> ...
>> +
>> +static int __init lfa_probe(struct platform_device *pdev)
>> +{
> 
> WARNING: modpost: vmlinux: section mismatch in reference: lfa_driver+0x0 (section: .data) -> lfa_probe (section: .init.text)
> 
> __init is not needed here, please remove.

Thank you, I will include this change in next update.

Veda
