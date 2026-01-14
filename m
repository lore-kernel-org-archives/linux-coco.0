Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E938758F
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768431423; cv=fail; b=casC7dAuC7Aty1fofwxwDHlBcoATwEn94Rs/z748bb6U8L9KiGOHyKzP/8hd0B3clz3vyVLX4VNxaAzA45pFFEh/MD7orQIok6QB+1y4CaMEZ+qqNUFHre1Je+8y9tWhiNh4gSHYM74/ktbTnBDH66TDU9PGhwFPQaXR4czc12g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768431423; c=relaxed/simple;
	bh=Xccb+mgPwjcTN8AkIsRS0uwlllBW8d/PB3GGKFNnb2c=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h08RbNcx5aggMVzE9sH/NxG9gGv0uilDivLEsKp+GLe6wkovbVQkFqladh306uLYohMJu8PbJL3hqrBtA+93ROvwHcX1hm54qHtb5wy4JbSd8roT35Wp5cA59TPhxUl1ULXVM1uDtqTlNOfXdZJ0go6K7UjoRKNxuBcq59RnuBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5QcP1K7F; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5QcP1K7F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2cG5gYoNU3niMjV7VSkGLO3GCzDx/OgNu4si5cgXfHx9kd51FJVvsZtr1iMSPL9Uuo+La9/JwYOb+hdlZJnIyoyFhO50kRL1pzQYqPzXNoslJCGpem5fAku+Nnf6TFEbPyglp/2WdrbDBojHyUXAn+UVlQX/VGsv7bOeCpYBcikFkfsGvMqq0fuqi7iTmeuLfLwCQxdmvUfEft5HlGCJ71sK06u0JxpS9TZ0V2DimsSViLQUgcj1ZRZeHjSIyitwb6Y0rUj1ORYYyipTlP/rVpafAcs3PXH2HY31EIMGhaazmVxdICrq0jNyqSvgh/eLojBjyWI451BhwOqZ1kbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGerPrnmxx1FCSVCCOhjIjBslaw2FZr2xbtgxrAED4o=;
 b=jihNuxmgqfx13ZSO4y4+1JHj5IgVkdZGj1DI901dLB8w6W0YELJvH+pbruncVMGxr6wsU9J+GBJ6yN/QveRnbbgVZkstNv8w74QS0cyQkb+Vwj0Io5qedOuUEuPW3hnTzheeXWfK8M99LPq4C01NJKiKQeKbQA1eoY1ll4k3NpSQFd5nf+X+yi2CtAOQOpAEEFkJ5IuW0VQRYF+blWLmhNxFnvUv8iRrYlFDbO2x05+xjfvSRM2mfmn8bjJ8JJ14SP7Ltai5W026EwGjAC48OEcwB114oHn/ocGJaDmiXaa6Z4Ewb6bq1gC4j7TxPk5ujWUUdh2lS32mAX5bQUa4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGerPrnmxx1FCSVCCOhjIjBslaw2FZr2xbtgxrAED4o=;
 b=5QcP1K7FRClMtsvdtnxYDacdyjMTak/+bpULey+x43YoFYd+rdgyDkaumgkUGSEPL6wBfwXTLaTiO8lu3AvKKj7cYpNyGuNPiQa9pGCgYlONqHnCDZTt3lfucGGRQJ5xDsy16GZYAdORptaLJBK14jX/Fs4RHftK0sCMxw38ZFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Wed, 14 Jan 2026 22:56:50 +0000
Received: from CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::222c:662:e585:3404]) by CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::222c:662:e585:3404%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 22:56:50 +0000
Message-ID: <13ca9404-1e4c-4035-8dda-5b628aec3a28@amd.com>
Date: Wed, 14 Jan 2026 16:56:48 -0600
User-Agent: Mozilla Thunderbird
From: "Pratik R. Sampat" <prsampat@amd.com>
Subject: Re: [PATCH v2 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, kas@kernel.org, ardb@kernel.org,
 akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com,
 michael.roth@amd.com
References: <20260112202300.43546-1-prsampat@amd.com>
 <20260112202300.43546-2-prsampat@amd.com>
 <4f2c6106-9cc1-4196-8b20-83b297ae7195@kernel.org>
Content-Language: en-US
In-Reply-To: <4f2c6106-9cc1-4196-8b20-83b297ae7195@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::21) To CH3PR12MB8660.namprd12.prod.outlook.com
 (2603:10b6:610:177::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8660:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cd7925-131f-4f21-ab6e-08de53c033de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODh0KzFqZUQ3dkgvQ1JuWTBhWTVTelZscXFuOGFBeGxCWngwV1ptNy9EZGo5?=
 =?utf-8?B?NmRva2ZydlpiTkp5OThKcU5hOVBoN0xzT3BzNjgxUEZSMGpYaUFPc0pWaDRY?=
 =?utf-8?B?U2pqb1JvN21mZzJBN1R3NHpRZmlROGxHZzdpdGxFK1B5UmI2UXlyWWJMajBl?=
 =?utf-8?B?WlJhWlZhWkZWR21LSVErRFVwYzBIWkg0SmNoY1pXZzFIU3FEbCtPQjdtdGJ5?=
 =?utf-8?B?NVhlYTRyWGVRRGtVc0F0UTBwdHZVRVFwNWxJeHcxWmRjSFhmT3JxUHFFUS9R?=
 =?utf-8?B?RExXS3pZYTBrUzFrUG1VZU9Mazh0REhyZzJ6aUlqMDdzaEhRQmxoK0p0eTdE?=
 =?utf-8?B?VG8zcE91Y1FWaGd0Y3hiMG5BajlNRk9VaTEwbUIvaHpJT1hjaWk4MCt3MWxs?=
 =?utf-8?B?RExGTnU0eTl4WEw3bHZrdExWY0JDckNud3hwNHZwUFI5QjR3c05Bek56VU9K?=
 =?utf-8?B?L2NsM3JkMlE4RStHM2ZRbmFFYjRxOHdJNjBsQnluWWMrUWQwQ29KRXZxV05O?=
 =?utf-8?B?UzYxeVJFckxpalhmRURKV0g5dm4rWlpSeUN2eDBmdWtrRkp0akdKSFBpT3Zt?=
 =?utf-8?B?Wng1Y1pEUEtnNnRwVm9MczZhcDEvRVQ2aGF1Tnp5cWdUaTZqR3F2NHprTkxu?=
 =?utf-8?B?dlp5YStodTFoTi9BOXR2Zll3MjNxYUlXR1dURm9UQUxtWS8zWVNReXlIbjJT?=
 =?utf-8?B?RnprbTZuVHJxaWVGeW5wSGFjR0s4SHhlSHNHbFNSbkhhMnE1NVpSQVFnVUhF?=
 =?utf-8?B?U2kyV29tUDJ6NG1NeWhuajRZSERKUUNjNWozS21NUDhIMC9yMVRoU21VN0Y2?=
 =?utf-8?B?aXdieXhaQUVFeDV1MENZYmhqbzNqaU4rQkZ0NnFHQWEwMUhYQjJNM0FvMkxv?=
 =?utf-8?B?c3o0NUc2YzYrb3FtRndPRnFTeFlMd0RjNzBuekNOMmtJOW0yaVBRa0VZamp2?=
 =?utf-8?B?NitGeWU4VnV0bGlaUER6RzVXREcveHJ0UzBacGw5c0NCMUxUWWYwZDR5RE9n?=
 =?utf-8?B?UEp4TEFvYTRpc0ZscUFUNFJERXQzL25BVVZXV0FYYXdHQVVlK2hnR1NsYmNB?=
 =?utf-8?B?SWErYU80bVpwVmFSVTVrVGY2Z0tmMm5ndlVGVWVYWlF6a1JrWkM2N2dOSzk4?=
 =?utf-8?B?RlYzMzBDQjlBQVFGRHQ1NjN3UDVjeXZ4a3JmQXFyeGprNUk0YytYY005YlRQ?=
 =?utf-8?B?VU01d3EvSGFvOHpNaCswZFFld0FPa3k5S0ZNSWY2bjJzMWdPMkFwN0lsZXBB?=
 =?utf-8?B?T2hBQnRSMmVXUHdwVXVuRkg2WDlwaHJNTkhFU2ZpcjZhL2VSQURGWjRaUll3?=
 =?utf-8?B?TDg2aS85L3lOUDhRMTBkY2NYS0RtYVJ6eGVBWCtjcEpHOWlJcXN5UENxaHpW?=
 =?utf-8?B?OFBqL2ErdTRLOUJSZ2VzamVDMmM5ZlhoM2xqT1VRRlpZVEFiR2h6Um9YSkpl?=
 =?utf-8?B?aFpHbXU5cUYreW01bGZMbXU1dElhd2t5aW1aZ0NsSkxpR3VCeXFMclFFVlBT?=
 =?utf-8?B?Y3NNNkJDTkRwdzZiY0ZDdkFGTUlndjBjQkM0cEQrVGhjQzI4VHFPNzBkOUJh?=
 =?utf-8?B?Z254Tk5WVEUrNHhWUnprdFZyblU0dWNXenk1dWwwNDBBTEZRSldDTWNHaC9o?=
 =?utf-8?B?aFNRVUgxK2YxVkE5dkRSMmVmcnVKOS9EWGJhVS9jWnFjTFVyWmthMUcyVlVU?=
 =?utf-8?B?MFI0K3ZLZ0g0ZzRXc0IxR24zTWxzSXJXaElHb2NIMFdnT3V6cHJsRzRNR2VV?=
 =?utf-8?B?aUhHVXM2TGVJUWlIOTg3d2JLYUUyQnM1L3JRblB1dEFJRXh0KzhKQUl0cXRz?=
 =?utf-8?B?eVg5SnhrRFBrSXVQbDljU2ZpdUFBaU9SaE03VjF1YkE2Um1Dcjk5TTlrditQ?=
 =?utf-8?B?d2hEVk5uajZXcVI5bkxzWjlwMWk1R1kxYnk2U1BqZTQzelkraFdmSm05bWd4?=
 =?utf-8?B?QVhETTJXQ2tpUEU5UDVYTGxYeVFaNzEybWh5NllUZ0JVZDltM1lXNHBUcyt0?=
 =?utf-8?B?LzNacXlaM01UdStac3poTmpCUlFlZEliakcvR0ZXVWNoTHNacFpuV1J3VXZK?=
 =?utf-8?B?QlBEWEZDcDd5STNybzJSOWZ3M3RDY1k2a2hjTG9vLzZ2a2k0SUFwUWZUSHBE?=
 =?utf-8?Q?9lSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjNXdGFiTDdEQm9EMnNHdmNEUE1HZjRkU0srRm4xU2tOWUdRUG9mb2VPcEht?=
 =?utf-8?B?ZTNvZldKRUs2Q0Npa1VkSnJQKys0NHR6NWZvYmRvUWtKQyt0bmorVWNJZFJY?=
 =?utf-8?B?TVltMkg4QVh5UmRaKzNtT2NZZDl1UHZFREhsREpJU1pjNUNjUEl4c0N0UWFs?=
 =?utf-8?B?a3I3RHZyMmVldGZZK1BCZnZ0aFllSmNJRXZLd2VEMWQ2cXNXMmpZMGVaeXh3?=
 =?utf-8?B?WUNGQnQrOWhvSDZ5d3lRSEFvMmhRcm9YZGo4ejY5Y3FSR25vUitCQ0VZblFB?=
 =?utf-8?B?YmpmM3pLS0p6akpEekE1VlhRcHF4eTVBSXpTVHFKcmRXbEZQK2tOOUJBeG1n?=
 =?utf-8?B?c3lZUEZtaEhnVVpOU0lFa0VEY0FPdExyMlQrdVM1ZDFTTG1mMEhSNFBXd09l?=
 =?utf-8?B?NVl0dVFSRXFZcy9mcDBUL3Jpbitvemg2OUkxL0wvam9pSUxhVUdiWnphRHNC?=
 =?utf-8?B?bm5hMXdiaUt5T0pQWGFxRlpxMnNjeW93em5vS0ltZDkwekhPc25WODYzQXFE?=
 =?utf-8?B?M1F6elU5RFE1V25VbzVHY3dINkM1eDBKOEE2Q2hnZlY2V2VXZDJtcWp2SFpH?=
 =?utf-8?B?bEd1TkVHd2VpK0lHY29xZS9GT0gzTzNvaEc2K29xMjBrWmRXYmtlTExNVVNS?=
 =?utf-8?B?YThpRzdmNmhmMzMwNUhQQS9GUGVLSUpRVmVVa3ZON1pRQmgyKzVFdzRFOGN6?=
 =?utf-8?B?ZDR6UmtZZS90QzNZMVZsTTJpTzdoMzFsV3JXNG50aVhoR3g1MzYwTEgyT0RH?=
 =?utf-8?B?b1B2OFlwQWJseXVWL3FGN3F5MWVUYUYvam9NTHdpS2tmTlVEL050Z1FCSUtE?=
 =?utf-8?B?ZXM0Z0xNbDBwL3ZvTkNLYzE4QzVmU20vUlVOVjBDa0lWMGliR2FLZy8xVFIy?=
 =?utf-8?B?V2I2NlR6U3k1MDNCWjZLcVBqYU81VkQ0MDU1bUJaUlNxY3pKeGJOSm10d1c4?=
 =?utf-8?B?dWU1ZnRCMXJOTUFBRU90aDVYYUhZL2hibmZ6RmoxLzgxa1ZLMnpRNDJVc3Y2?=
 =?utf-8?B?QVJSSkNFaHJVL29HNDhrVUpOS3I4RmJiVFNkeXF1cEhqamR6bUJNSnNWNnky?=
 =?utf-8?B?T09lTmtTVGxDYUhHTUtjeG56MmQ2VDNGVCswclVIcjJqbUZaZHFHTnphTmQ5?=
 =?utf-8?B?QlpOdWVmWEwvc0JkaTVaZUR5N0MwZ29ISzhZU2F0SXNJdzNwMDQ5cEpFSGQv?=
 =?utf-8?B?dFBBdWZsMGVvQUpDTzVBQkh3Z2Q3dy96Mms4alQ2STZmUnBiZ3dyUWhOQ2hE?=
 =?utf-8?B?ZTNVbHh1MVhKaXp5em90cmlWc3ZlaWhSU0hRSmxLalNvdTM4MzZ5bHMwL0Y4?=
 =?utf-8?B?RzZDS2tSVFlBeEZtNXZvTzhNeUxzWXUrVVlGZENwV3dsUDhLMG1jbVY2RnIz?=
 =?utf-8?B?SkwvOVF0aDJPaEV2NWE2ajcvblpsL1NZVVZBSFUxcW42NkU3MFk4V2Z3S2x2?=
 =?utf-8?B?eHM3bTk0RVFOYVZTaFh3MkRKSCt6QXhRSExJNnpXMDkvZ0ZZMWpxTVVGWTlm?=
 =?utf-8?B?eXRDMkxjeEhRcytSM3dac3R4SXNKKzA1WFFvRVRyM1FiYjZhWGhqMG9uYmh3?=
 =?utf-8?B?b2dRVVF0Q2krb1NJQTF1ZXZQOE9BZ05pL0lyUVoyN2s4M2syekxKckxOeFRG?=
 =?utf-8?B?SFphTjRDS21mSEwvaUIzN2Y5YUdwclV2REx0MzJUMW5RZER5VnVoVjBnM0Ru?=
 =?utf-8?B?S0VrbitQSGNZQStKS2pZOWJzOFJOR3RkOGxOUDB5bWt3NGtibVFKemVEOUw3?=
 =?utf-8?B?T1ZZMmJnQnFmcGQrOHR4QzRaVUJKVVJ5LzQ0bmZaM2xFdEVzcXNDTENKaStY?=
 =?utf-8?B?aE1Id2xsY0w0VlFkNC9DSmNLRXhYeW01THlGR2NFSDFwT3hoZm5MbUFib240?=
 =?utf-8?B?UWVkZlcxbE1vQ3hxbzhJaEVmK0FhN1ZyMEhMcWdPOVhseXB5SGdqa3kxMWFx?=
 =?utf-8?B?bWd3TWxwaTJpVSs3Um10bzdZbUxLS2NPUzRGZlh1RG1xaTl6ZmxReE5WYm1D?=
 =?utf-8?B?L1RJOUFxNE1YTWFHbEdnVjdINlg5RHRqL2owOERCamVZaWtYcnkwK2duZ1cw?=
 =?utf-8?B?ZzRoeGU1c3VpL095ZDl1TkVTMFVWdU5ZMStnWlhZYllVVVFXa012azB4djFp?=
 =?utf-8?B?TlBwakVibG4xVDlOaDJmZFd6ck5FYWFid2RVVnNRUC9Obm9lNVJMSFovY0Ja?=
 =?utf-8?B?TU5mOUwzazJiLzdZMmQwazlPOXVXUWNENDF1UERiVEhoZ0tiMEViNkVmOVJk?=
 =?utf-8?B?RG16VDJldFJQUXpzS0EwLzZ3TkVWdHFLbGZLMTFhbC9WbmJoaEFMYVUzZ0Jz?=
 =?utf-8?Q?Cij174JHvVjEHLx7yO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cd7925-131f-4f21-ab6e-08de53c033de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 22:56:50.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV0cSxO0DecKy1OgC86umAyCGdjlHA/9aXpwWBb0qUVlp6uvBduWYVqavZOA+hi4ZXD3NJFnqb1w8H2e8eDXmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389



On 1/14/26 4:30 AM, David Hildenbrand (Red Hat) wrote:
> On 1/12/26 21:22, Pratik R. Sampat wrote:
>> Confidential computing guests require memory to be accepted before use.
>> The unaccepted memory bitmap maintained by firmware does not track
>> hotplugged memory ranges.
>>
>> Call arch_accept_memory() during the hot-add path to explicitly validate
>> and transition the newly added memory to a private state, making it
>> usable by the guest.
>>
>> Signed-off-by: Pratik R. Sampat <prsampat@amd.com>
>> ---
>>   mm/memory_hotplug.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index a63ec679d861..8cfbf0541430 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -38,6 +38,7 @@
>>   #include <linux/node.h>
>>     #include <asm/tlbflush.h>
>> +#include <asm/unaccepted_memory.h>
>>     #include "internal.h"
>>   #include "shuffle.h"
>> @@ -1567,6 +1568,9 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>       if (!strcmp(res->name, "System RAM"))
>>           firmware_map_add_hotplug(start, start + size, "System RAM");
>>   +    if (IS_ENABLED(CONFIG_UNACCEPTED_MEMORY))
>> +        arch_accept_memory(start, start + size);
>> +
>>       /* device_online() will take the lock when calling online_pages() */
>>       mem_hotplug_done();
>>   
> 
> As discussed, for things like virtio-mem or the HV-balloon this might be the wrong thing to do, but I don't expect these mechanisms to be used in CoCo environments just yet (and doing so would require enabling work for them).
> 

Ack.

> So I'm fine with this for now.
> 

Thanks!
