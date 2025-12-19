Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB72C17A0
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134086; cv=fail; b=aFnp2nHtAVzncE6Jmul7RQQkw8UiH/tPswn7uXtoEBOppV/pAjj670ro4e79LP1OQBn22yUT0dAavZm4WS5BvKzwHeNudZDFH+/+U68hRYr5kAl4Bx/MBktg96NTCCjYqVEiqCHrF0Wja9uNPe/oQRq78XLrIZ7IhkZtDYQNAkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134086; c=relaxed/simple;
	bh=xK1804VwBgZ297762Sgg+as5CrVxDm4XkuUJ1K4VtXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mNNkzI9SC61mGLOy1kp1DiwjQ2cwLs6yGRgwWDGPiDwsL20DoPryt50MGIZyyUTagMrunTs/LGUmfLBO3syLUzr7pueZ9nYmNvfaUNuFILO3bFvMk/mdlG6D2FMIaUunOnjF9Sx6RAq12nKZnWjgAkqE8Ehp73w+ZlRtBAogGBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KttddGRd; arc=fail smtp.client-ip=52.101.53.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KttddGRd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmqDNGBlD+OpSsBsofvbGgfD5Iz1mTvV12g8vruJnxTRglHBxmUHnLkbrpcmyccxsgHbLIn+/hl2NFiyqLWuy9MAUKOTSHfeh8pawtICTMUXS8oTpbzZbwc5UsQbqz0Ur0iZ2a7NiswyN9FIZlCBa30z06f6yfxurgSdvkSz8Su4DZJLxR72ZlFoCzsuThtUtN0H09OJeeAJUMWwPp0YbYfY970lxrDDDXj7xS3UY7q8CqJ0leUN+CdDaJX4/0i2FDY8uKDdRvOR4AN0r/mMXxjZ5wZtR2IXTnRD7VkV7+8aEmxNvRBA9lo2Cte8uE/5eXm/yJ2AYZCWapx6TLw5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCwvxclCXGTFJp9TMAw18xhw4yfw6lbTxFwAZ2WcKl4=;
 b=hATR+Mj/gaprK0YC5AOMXvl4zPsokWueDDNG4pALlrGBaDg3kOIgj99Jhhr2026bIaabZd9QuS3mzzCQwuGQE24IM4gZdJa403O7HRXAYJpEHxyiVjsVmOKZ+1uSHs6Ae6L0JNuMN+ZySiDYz6HzS0UKo5SNgLD6rHog4GnZU4SoJnFUW5ugIhntvr0LSF3xvsB/Ypy9TycCKPuRl/fRB6C6gSDvEV338NjVu5zqqbh7lgr9Z8B1PXpmES/1UMRdt0VV3senIxsRq2AfpkBq+mxhl3O6AselZuw1vNZ5BPqHmghetbIyZNl2snaHBRoleq0jVn45Zv6rRFvSPZrrRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCwvxclCXGTFJp9TMAw18xhw4yfw6lbTxFwAZ2WcKl4=;
 b=KttddGRduP6h8jG24aoouujsc5xDCMslfI+yG8p0JjP67rWrdOc2mN2N3LtdEnf4Npb+yKJZhKiPRET2ZseVgRMz+XRR4cDtAuNTmmsRTaJ5NTQoYsOVWNmUwOW+eS67Ai2r9LuogSsrQNME0KcfD7gQDF1ZynEPZsZzmsOXavdu7zLCkg0JchCASG13Pq3yi1i/Z5TPAxLAWX/90kkFCouFVsH3TGoZMEtUQF+b1HifzzZnyAo1DWvWtEFXGt5+R1RynHGWqYqJGFplS49Mb5jqPO8AHLn83kkBTYnZPWbztaXF7ROxpGvfPBnbFvD1GmQrG58/33oiEuttJ4B5cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 CH1PPF931B95D07.namprd12.prod.outlook.com (2603:10b6:61f:fc00::619) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 08:48:01 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:48:01 +0000
Message-ID: <b8fdec67-584f-492e-b2a7-8c932871f459@nvidia.com>
Date: Fri, 19 Dec 2025 00:47:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] firmware: smccc: LFA: use smcc 1.2
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, salman.nabi@arm.com
Cc: andre.przywara@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com,
 ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-2-vvidwans@nvidia.com>
 <20251209-curvy-walrus-of-wonder-dbb178@sudeepholla>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20251209-curvy-walrus-of-wonder-dbb178@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0100.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::41) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb78f40-f58b-4c1f-e034-08de3edb50e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDFzUzBXMXZWNnIvLzhlVWlYcW1XQU42TVYwREpuY3dSbDY2UGpFc3NuT2pk?=
 =?utf-8?B?aitNNHppc3lBR2xkMC9uMm11ejFwbWE4azg0dWxWaEZtNStxRWQ3NUNTMVRU?=
 =?utf-8?B?VkJ2Tks5MGdGb1NsU00yWlhQWlkwa2U2dkZhdFlOSTVEMHhUK3pzNTlwKzhT?=
 =?utf-8?B?MUpjRFRWVHFmQXFtcWZIb0pwQ2Z5QUFqWk1VMTl2T2VKNVltcWtVTnYzdURa?=
 =?utf-8?B?MC9IU2RtRW9CMWJLRXBoSkpNOG1uVWdsbm92QUpGU0V0OEp2V3RBNFpyNGNE?=
 =?utf-8?B?UFFKL3k4UmNCc0VVb0NLY1I4MVJGbFk3VGNJKzJudnk2eFptVG1nNnZRWDkv?=
 =?utf-8?B?b0hoRW81ZWQ2aytJRW9VOVN0eGlFSGhKQWRKbmU4WkExUHdNaUh1T2EzVUlX?=
 =?utf-8?B?Mmp2UXpkWm5tdFd0SzI5QnFoelNpOTlJdHA4SnNmTEpHaTlmeTdDTHdqMUhU?=
 =?utf-8?B?WUtzUklWejRPYWo0RFlnRFRoMUc1YTZuL3J3NE5nWXJPZmlFVVNvNG04SDRq?=
 =?utf-8?B?VzN6d2RQL2JtVHNENkxpaWNmeTIwYzVmQmJlVDFqVGpvYUdQRzF3OG4yYkl6?=
 =?utf-8?B?M2YyclMzNkhwUDBxcDFyUkJJb0VFWktFYW03Qm1JYjNsaXl6YXBFNE5lVDBt?=
 =?utf-8?B?UFU0NzYvMDMzeDZZaHVDRUNKZHBteEFZRXc0bzlCR2VHMnRSLzhERWE0bzRj?=
 =?utf-8?B?a2NLZG1XR0xqMzdNRHR4Yi81OUNhdk1DR09ZVW9EV0xPcFp1RG52dFM0UFpz?=
 =?utf-8?B?SDcvVWRDd2hCVS9TS3dyby9kWVZnd1AwVGh5SUk1TFpPNFZqdktoNU4vYlJU?=
 =?utf-8?B?Q2ZXMlhxamdOOGtlMzlBWm5SaHdDQWFhZVlBK3QwR1pQd28wSDY0R1k4Zy9m?=
 =?utf-8?B?aGwxcnFLVTYrVWh2cmxyU2VyUW1mUjhRSmV3SXJoZm4vOEZQcnRNL2cwYXZv?=
 =?utf-8?B?TWVQVmpLclhiS3paRzNpVlJlbGFKY1d4OUJSZDllRUgzOURadjVDY2FxbXBG?=
 =?utf-8?B?blJJQWt1YlFjRFdZYUM5S3IvRmo1YVV3NDVCMndZSStBRDJOOWlFVGRFc3VM?=
 =?utf-8?B?WFhKSEU2UVAwR3FjaGwwMUFQbWhBWDY0Z1M0T0w2dXArQVhocnRxdHpBTmhE?=
 =?utf-8?B?NWc0eEpwRG1ESDNUSzBJbnFGWTE1YWlzd1grc1pPWk9XS0F6NFBsQmpNTlg2?=
 =?utf-8?B?WWpvQmFPVzY0SlFTdkNxYlF6cXNMYms0OXVTeVlSb3UzS2NMRlp3eC9iYUxj?=
 =?utf-8?B?cUZMaURVZ1JrdlZITlNKRllSSzdoZTFaY0x4NjBXWWNmNFdFTVh4eTM4ZndM?=
 =?utf-8?B?WWpYUG0wMEE2NWpGbG5yL2hOOG5iRVJ4WUhkcGVSd0J2cjU4SXZOMCt5Zll3?=
 =?utf-8?B?N1Z1Zm1ZRFByZ0lYMHUwcjJTd0pNZ3JqUHo1RDl2bVpwaWtHT3E4THJER3Iz?=
 =?utf-8?B?ekFNRUxPNTc2QUdDcTk2d2RNZWpOMVQ0OVozb3R6Q2xsUFliUzMwRjdyQzNJ?=
 =?utf-8?B?R09vaWtnQ3RrbUpmMUdUYWhQcUFCY05iaEUwZnE3NUxocjcvZE9vaVdSVVA2?=
 =?utf-8?B?OWxYYTl5eXdxTFJPYkxDek5lWUMxOWNCWHdGbEpjVHFMNktLRXFmQ1BOQkhk?=
 =?utf-8?B?NGZ2RzJTZzNVaUtmN1FFVUhhejh5Nmk2SVQ4bHRtYWRVSUdIMHNFRDJlMDNx?=
 =?utf-8?B?cXBWYXJjSTJzMXZVeTdycEVUTXRwck5ORGRJSkxySHVsWENyVHhzTDU3OXZU?=
 =?utf-8?B?WCtqU0lSMktaTGpFMUdCM3lET3Q3WWVjZURvSEp4L3M5bkZKcEZmd3VaYXdz?=
 =?utf-8?B?Nzk5cTg1K1JOS3Y3ODM5cTZTa2xZYUgwK2hidVorNVNHVHVPQXhWNDFmdVdx?=
 =?utf-8?B?RkNyc1M1ekduZnU3TlA5N1pTYUpZMXRXVzhFc3hPZXlFcE1WNkd6WkhyTnJk?=
 =?utf-8?Q?hX680bvL2pnUqLREIHbCp09n/BBFskSU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkV4dHgzMUhFNUM0cmNFZy9mdm1TNVJtQXVzM1pDL291MEtkUU1EdHA4ZERq?=
 =?utf-8?B?eDZFMFhKcnd0Z1dIT2FkZ0h5Z01mR09nWXBrMW1nRmZxWDZ5RVpZSWcrelgv?=
 =?utf-8?B?bTY0ajA2UTJ0RXZBWmYwT0JnN05WeW1jRlJwcFpZN1RqU250dnRocnNPRkgr?=
 =?utf-8?B?UnZONCtiaDdFUVEzVFVCOVo4ejBRaTQvenRkajFycmVvaDgwcTdYcDh2V3BP?=
 =?utf-8?B?ZjFFeThRc0l3aitRZDVaeGpEZTBkZXFSZzBTR05HNk10T24wK2YweEtKR3pz?=
 =?utf-8?B?RFhoWWpwMHg0dGovamo0dXZqVUgreVI0bzZpa001S3BVTHdsRnh0QzV5UlVx?=
 =?utf-8?B?TXBoRkpsd3RJUy9UVWk1UlNrVEcrL2JYUDlkUUdQYmRWY1hyK2xqN1lvbDdq?=
 =?utf-8?B?eFZ6YThGODRoa3pZbmtLV1NBODEvb0tsRkQrWVZhUnZBVTV2bW5QT0xhdEd6?=
 =?utf-8?B?Y0xucHpZNXBsTDRsU3RhR3Rncy96Y2w5UkhuVlVGa1FEWkVvM2NJdDlrMmtU?=
 =?utf-8?B?a2hmencwWGQ1R2lmMnJubjVxTGF0bnlmQkp5ajJFZ2xFSmNsb2pNMEdXbkk0?=
 =?utf-8?B?VUg2K09rWGVONmxsM0g3bWhrYVpGa1UxcFlOQmF4QWx0NW1GQk1WMVk3USth?=
 =?utf-8?B?eGFSY3FZdEZnQVdXYmFCeHY3M1ZXbXZkQ1U1U2xrNHdSV2ZFYm12ZVkzbTY1?=
 =?utf-8?B?TjhBcmU4YjVLdC9QVUVyMTVsYmh5eDByZ3BHSHJUOWNRdXJabWYvVW1SeUVq?=
 =?utf-8?B?SllTSnBzeG9jdmtwSzRNbHZ5WjY2enZDZUtnNDArMFFvZmhGZ2FvaDg5MjBs?=
 =?utf-8?B?NzNOMWtqS1J6L1R3b2c0ZGZHNmxSbEloaktmb3k3RWtzWUZYVzRKKzBySXow?=
 =?utf-8?B?RGZkR1h2ZGxuL0VXRjNoeTlWWm5pVTRsZHpwSFkwRzhhMTFibTlhdW80NVBy?=
 =?utf-8?B?YjM4aXlKVkExYzZ2b1E1bHFHUDhKVTlyeldTMllJMzBpVTZ2ekt0MklUcnRm?=
 =?utf-8?B?SjJsWUo5T3BqNHFEMDJxRTVPSzUyUk1qcTFHN0Y2TWF5YTNxQTRDblBodHdQ?=
 =?utf-8?B?M21Ya1VWZjhYbm9CemlqTUdYZlVKUmx3U1FQM0ZSUmpOZnlGQWJjTkFtV0No?=
 =?utf-8?B?RWZTdnpKYWpDaFdHOUo3aXlYdXl0MExTeUtIcTZsZE9FUmJVMEUrWHo2bkhH?=
 =?utf-8?B?eVQzOCtrVVZ3WVRNdk8wZmdtUUgyOFUzdlJJeFBNclJvNHdvSGZ6NVliQzJa?=
 =?utf-8?B?MGFGbGNWMFlHTGNHaG52SktFeDF6WldkSUMvTmxSdnA3ZEJOc3BWUUxnUDJq?=
 =?utf-8?B?NnNrcmJ0dHV6YUZSVU02dE1icStsMXdSN2RXZnhWeWkrS09lNUtsRDZVSk9V?=
 =?utf-8?B?dm5yTzRCMGtsREN1aml5UmJFcnlmZW8xdGZzZ25taWxRWEoybDJ0V1N4LzVY?=
 =?utf-8?B?VEVzYlRpbHR3NXdrMVkzS1FtTGdpYUkvK2s0QnJydzBYcmdkUUtPNnNtdlZ0?=
 =?utf-8?B?NjQva0k1ZWU4bkxMQXp3VzdRcWNBc2o5dWxDR2tkc1NQNDFjWVNBa0M5NHpY?=
 =?utf-8?B?YVUwWHVDTkowUS8zSEh5RFh2L1RkTXM2MjlWMmt3N3RwdGFMWnBLQ0doaFpT?=
 =?utf-8?B?OXVjTk5wNW9qeFo4YjdoV1RacVFqdzdpRVFmSEhQeUxORTNaa1VtejBWWkxs?=
 =?utf-8?B?dVgvOU1udEZsUk5FamFhVUhGdlRUbnV6eHJtbkJKRkkzUSt2K0RiQldwR3Mz?=
 =?utf-8?B?cjc4T0w4Wm9EbDQvajluZ3M2ekNyWXZjSEJvZnNzaEhwOTR3QlF3SWVIcndV?=
 =?utf-8?B?RVNPOXdWQk5Ld2x5NnFvb3VBb1ZMWmhOTHZxV1ZiWWRVaFVMeVl2cFpIZlpI?=
 =?utf-8?B?NW5tRXB2WGFGaFlEcndSVjJrQjZGaDIyWXhTeXNIWnBhOXZyNEdiOWhOUDBH?=
 =?utf-8?B?WEZ1ek1TVXJRSHdHZXRCYmFNTUY3Nk42ZWlmSHBOLzZDVmJpYWFsZGc5a0tY?=
 =?utf-8?B?RVMwMFJkeXZkdWlxeExYS2RRN0JRdklkK1dOZlhZREZxRWpsMDM2RkU0ZHpU?=
 =?utf-8?B?ajJHa0IvOUdSVDlEekdTeThiMGU1ODZKalYvenQ5Qm9FMHFVWW5Sem1PMk5C?=
 =?utf-8?Q?VrT7tXoGM9reXOQi7U+4yYskk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb78f40-f58b-4c1f-e034-08de3edb50e6
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:48:01.2214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OKtkeAJYkvEDrTrOdG5N9lgiahrivS/XJ2hl5D6Os0l8mfClWBLw7BXRwVJaxVJ0xZbG8qPhqWLwPL3FAxwVZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07



On 12/9/25 03:42, Sudeep Holla wrote:
> On Mon, Dec 08, 2025 at 10:13:11PM +0000, Vedashree Vidwans wrote:
>> Update driver to use SMCCC 1.2+ version as mentioned in the LFA spec.
>>
> 
> I would prefer if you work with Salman Nabi and get this incorporated
> in the original patch by providing this as a review feedback.
> 
> There is no point in having this independent of the original patch as it
> is not yet merged.
> 
> -- 
> Regards,
> Sudeep

Thank you for the suggestion.

Hi Salman,
Could we come up with a strategy to combine the LFA driver patches? I 
have been working on this recently and I would be happy to revise all 
the patches so that we are followiing the specification from the start.

Please let me know if you think of any other approach.

Regards,
Veda
