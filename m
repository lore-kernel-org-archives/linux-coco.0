Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1C395AF2
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 02:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438047; cv=fail; b=ZFOJm5VBvX9qCqcWjzTsvNAQ+Jh7TJdTWGo+92YX33ANs+jq+Ft4L28p0k/7yjQ+MisT0BGZR4rCrqf6LJFTjCNj5lujjYHb1nXWZEdClsWOlchFZxLjL2aLJW3zRUAyi4Q5PK/XrlCPm542dyQi2a+fcFxE4LhXloeZAeEVLis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438047; c=relaxed/simple;
	bh=unoj/ZphlOQPTLE7f7RtVhKlw9kUH1BSuX6AUPb2UPo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Emq1z6IQQkd/7ma90GKbv8oFZHh8GwFYKcYDM2foXojq6c3mxUJXmfT/TmbfG/BQipR8LIRL3l4elBgVL8mUaJUkS4EjkTWJTAef6M9Ku4kUt+tTjQJRvbGj72f5lY82osk3FKY4JYUXdSD97QDz9Bkw4uHUL4l9tSMEO0jinwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mLFEl0pX; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mLFEl0pX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y76GSfFY9ulIKpfIpX2lQHeh5zJuAKhREbaJPEq8CA8Qxyxw7Fn+4gYy93f1Q9QHv8qTYHkh2BsmbUDHtE5Np4OSl8pNja8RnqETdZPysXOQOEvFxRw7HgXVRt8XKiRX9goWSwgGznrhfCoNbin8E8Y2C/I11M8P/6i3AmQuGm0hxFpRwCd6TuzEh9zgmj29O0vnDN8De+zJ0RCr5RuoVSb2H8hVGbWslU77I0+YewUUe/CDJe2b1Zfk4CTNNZisgivy8EEM8Ow7MKgOnRaidS8CeN5PmbpPr/OBue7eTWuqKVAAcenZueD7bvQexOrXtECgJgd3/n6h7tG1eOYgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNNZJ9amsThXMjs+dI1euaBJFEmNSHsRK4WthKn/4mk=;
 b=RUPKBfaB+um1bxRHunSP0b5pxv2bgMTPYKomJVPUtSR8bm4nrAMEuJMFHV/6PRr2qhRrzietJXw8wMfIaZratslKfEuoCJraU7RpK78r7BV/QePDRcOQRfev3s7yQt+N6pLjCtk3dl5B4jUPQyMAiQgnpA8Mp0uZRtcT60BN2D93wxwBdMDg7qRdIHmxIqszUWexcpx4vOfE3u1wJ7UdUh/kQ0ZpyW4/yKdtn0Iau07FudHIag3JLpNFIy7leIVdxDsQWjcgrXN0hhpMQdv+2kL2ZTIgaFZDZ0UKVLn0lC1yXoqa9aFwoA2hzbS9Tm9xQNfw1Txab8W7j6D5B/6xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNNZJ9amsThXMjs+dI1euaBJFEmNSHsRK4WthKn/4mk=;
 b=mLFEl0pXmKEHggjgQbHDKdoj5kEcGRd5KbhmOaAEZMBVOM8KsML31Fg5wigSZgTed4Lj0WmQh1MVZPS4I/ENLcW93y6w07EnJlxKXXq9RWIXBQC+ctimuhCdo1WjqoDRNgDmRPfj0IILe8gNY0m30nbQSh2NMrfLBm0gFAjcs7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10) by CY0PR12MB825472.namprd12.prod.outlook.com
 (2603:10b6:930:130::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 02:07:23 +0000
Received: from SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3]) by SA1PR12MB999228.namprd12.prod.outlook.com
 ([fe80::4dba:119e:8e7c:37b3%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:07:23 +0000
Message-ID: <cd7a7dd5-1aba-4986-8430-ca535fb34f22@amd.com>
Date: Tue, 15 Sep 2026 12:07:17 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security Protocol
 (TDISP)
To: "Quigley, David" <david.quigley@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 ankita@nvidia.com, aneesh.kumar@kernel.org
Cc: linux-coco@lists.linux.dev
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com> <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050> <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <612371b6-955b-40f0-89f6-7c8bc936093d@intel.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <612371b6-955b-40f0-89f6-7c8bc936093d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY0PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::16) To SA1PR12MB999228.namprd12.prod.outlook.com
 (2603:10b6:806:4db::10)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB999228:EE_|CY0PR12MB825472:EE_
X-MS-Office365-Filtering-Correlation-Id: 054193e0-9e9a-43f2-eaaf-08df12ce1499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	7F66lSBl7c1TbFK4Wx08XIK9z7XRORQERReGPfkBCtPPYwH0LOk9KtykT1+Lz4T7/wzLRYndFDZGPbfd8MBGM9wYwLr4GcZOooMNRixjGgdFUla0kFQWT9oGFMNaKGvz4p3dVPWmGnwsj/UFMJM9qHe8v01sk9QfI2tF6vqWTe3JTtTTq8hcnpeVdICP0VeuUGFav4B3j4oKZWgCLZxOXu1SnpXKVuh+4iK7TMGWJwMpL57UojEhDUdYi60w0f+yb8/nsaQLUDxUefGPA0aBU+R/BK4S3JfiFCwG8Khshd3JIgSgDsjqHAO3o8ng36E9PBxeFiuu9oszxPDAEo1RBCCvCJwACI8JEsaa1DCiSpLZ1Qsx/Ko/E4rr5MWACsh2dnPyz3D1La3UUba4UoB2JE0hTmuAcwpKEcndS1cBVxL9BShDHVoDD6aeB3jgp5D0Fn/yCuDJTuAcWbxF4TlpWVCjJu3acO3pFuDOHBrwddVpJTxyRT4kf8f7i962vY+mNKLOIJvCE8TxDr4Ahr4y/hyoJEF4uBH844FWxLFKdnWC+ZKqphs51ATeYnTrV5DEJ/0ksIapUm2STLdqKWXCwdsU3Xl4hs7MPHDSx2yLCNY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB999228.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFYza3hBRXpYa1dpaFptNkRwSUhBMWVKN1Z0Nkk5eUkrK1ZaK251WVlJQi9r?=
 =?utf-8?B?Smt0L1FZeS9SRGtUdDBna1ZuUi9KZTVMaWVnUnlqS2RzRzVkS2ZRSG95dE9p?=
 =?utf-8?B?KzhQV08yRVE0N245b2xscHdpdzhmZTI0dGk5UDlWNisyTUl4NHYyNXorL3VF?=
 =?utf-8?B?U2pHbVBudU1ZVlVTZFhvMC9YVzMwQS9jQVZtK2ZwVTNHTWJDOENHTTZGNGVq?=
 =?utf-8?B?QisrbWdkTytBUEh1Nm5RWkpGWUNHbU1jRnVvOGdMYTBnTk9EaXlPNHR6ekFW?=
 =?utf-8?B?dEM2amZRVUtYWEt1WlRXKytvSVBpNjV6MEVvck9IUnRGOEwyTVdFNGFsbWpB?=
 =?utf-8?B?Sk1lUDF0a0hPRnc1dFFzS09sSGY4bHIzczFiWkR2SGJOQUFveEo0T0Q2MUEr?=
 =?utf-8?B?cWhJMEcxb2ZqTVNhV3lidkYycnlkRC9jNHpJZ09RTnJVSUFzSXdlZmRieWlT?=
 =?utf-8?B?aFlSM3pWbXhYd0MyL2J1ZFRoTDZCTUU2c29vVitJYUp6MzJ4RTRqM0M4U0FH?=
 =?utf-8?B?c1BGRWlVdm83M0JVTytLMVJCTStqVGFkcElITTAybFVhNFB2cHBub3RlU3Zn?=
 =?utf-8?B?SUMvMy9ZWC9VU01DVCtTSkVnT0tyK1lIUXpMVFVCcGlwTVdlUEovV0hJbVZB?=
 =?utf-8?B?NnR5eFNPUEFtdVBaeHFsRGZXeC9jNEZFbVRQV1JzcEJzQ1A2bUk1NkJYanRO?=
 =?utf-8?B?bzk5NFRYVlVEb0FvMUZiSW1DZjhDRnk3dENTQVU5d1JudXp0aXkvWThXcWVU?=
 =?utf-8?B?ay91N1BDRjkyVXZVc1Z5a3owOTFXcTJLNVZuS3ViUTdOYmxMN0VKNEVYWmdo?=
 =?utf-8?B?N0RaNnNkYjBZL01mZHJrK2EzWm94QUpFQ0dLY2Y3a2U1Tlp1aldhZEN0WGR0?=
 =?utf-8?B?c3lhQlBQTXVWWExHYWtROTQ3U2xoMmoyMmJZTVJpbkNLaWJjQVEwbkp0Tk5C?=
 =?utf-8?B?QUNpaHJQWHNHWmxOVkNGUWVNMWlNTmw0a0FJYmJHS3A0dWM1RHBHamIwUWtp?=
 =?utf-8?B?V1JhQ1IrbWQwakJ2RGxQNXpSZENLeTlzb0tQV2xPZ2dMOTRIOTZLY2JRbGVY?=
 =?utf-8?B?ZkRZWEFYZVVoaUxnMk5WYkdvd2JPYUpEczF3ekFNOW9EV3FWZ0pFZGd5U01N?=
 =?utf-8?B?bEZaSzA2Z0VLUmRWSktzR3d1dytMVzRQZnNQalBLV2kreEdHZjZYai81ZjdV?=
 =?utf-8?B?VUo0NXkvTTFYelAvSkVVdW1BTVZzNG1SUmtxeGpGNXZZbkdHRWFQYUZ0Y1FE?=
 =?utf-8?B?K05Ub3ZHV1dzYmtNWUlLMExQNUtndWo1cnkrWVE3T1dxTlZhTTVRVm5vRmd2?=
 =?utf-8?B?NXZxdDBnT0l4ck9kK2NWeU1pTXFrUGc1NVJOdXpHbjBnMkJ1RjVlLzFEVFE1?=
 =?utf-8?B?SXpJK1B1RTA5UStWb3JJd0pDT1plb1pGVDBwRlRlNHp3cXBma1FyU1lqeC9L?=
 =?utf-8?B?ZmEyYkFIV3ZlcFNJTXFYQ3hGMWYwTHh1SWFYNW5WYzlJUUlPZTdFYytDMSty?=
 =?utf-8?B?Q24xQmNzbDFreW5UeEdLcHJraUR3UmgrV3Fiem9zcmVuS0F2YnFVNjFNYTQv?=
 =?utf-8?B?aTlONnhBRFNHVThhejQwS2xSZUxITjdaUkxKc1U1RE5nYWJ3SWl5alZ6QkMr?=
 =?utf-8?B?eG5BeUY0dGRkTUl1SytRV2YrQWZWdnZlSTgvNjRaSmZ4Q0I3ejl0YWs2d2Uv?=
 =?utf-8?B?M1FuSFVNaWNMa0czZFhuZjlPVXVzUUlLaG1Kb3pDbTRUMS9LUkRyMzZMTWpY?=
 =?utf-8?B?UlRXV1o4ZGNLVkI0MU5XYlNYQm9WUy81YnZGbjljNlpiZTJ5RUxsLzk2K2dX?=
 =?utf-8?B?YVFrOTFxZkNlWmg1b2pSNmRDeUpKUXZSemlUaHE4TGdiS3dBSE1xM2wvV0h1?=
 =?utf-8?B?ei9NMTJxWEZvT2VuSy9xVnBlY1VVVVNUM3N4T3pmaklrUXhwUXFjbHZvZmZY?=
 =?utf-8?B?L2w0ZFhvNWlQK1R4Z2dvQmkrdW1PUzVIZEQzNEJvWUY5RnJBWjlYbEEyNmFl?=
 =?utf-8?B?MzFGQUxGZGY3MmYyTk9DMU1oT3p1UmpuOGx1cmpnSmJla3lENGRwQlRjQmpG?=
 =?utf-8?B?WGloSXFGWnBFVFZEYzBZUFNrZmwxTWhlY1JzS1hHNmJrTDRRM2hyT2hOSGFz?=
 =?utf-8?B?N28raVZTdkY1OXJJK0wzQ2xkMlZTUE0ydlByUndxSGtIdDhhSmEzTVVndTN1?=
 =?utf-8?B?bnZvWG0zYytqaWRyZ0FMdE1Nd2ZDY0pZUE0vaDJlejcyVEkxbTdjTGxSUWdu?=
 =?utf-8?B?aFdjSUp0SkFKMEhtckQwZ0dFU0s2VVBFL1lML1MyNFE2NElkUkdTeFdPMVVK?=
 =?utf-8?B?K0JoVDNPbGhUUWtuNjNnWGRJem1NMUtmOGhTZmFmRkdtV0ROSTRuZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054193e0-9e9a-43f2-eaaf-08df12ce1499
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB999228.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:07:23.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJiMQaN/BEuBiC++fx+Cr9gnHjuxKp31n1of/GshuI4VsCW3VgaXhZPXoqyY0APX4iLY/ZzCcWtovmfGasaqTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB825472



On 15/9/26 05:29, Quigley, David wrote:
> [You don't often get email from david.quigley@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Was there a decision made for a new meeting time? If not are we still
> going to be meeting this week at Dan's original meeting time?

No new decision is made yet.

I dislike the idea of 2 separate calls, unlikely that both times are outside of my 00:00-06:00 so I am going to miss one of them constantly.

Here we voted: https://crab.fit/iommufd-tsm-call-593432

7/7 - no overlap. 6/7 - there are 2 options, 1hr each but I'll need Lu Baolu or Xu Yilun to cooperate :)

So this friday call is likely to happen at the same old time. Thanks,


> Dave
> 
> On 9/1/2026 8:20 PM, Alexey Kardashevskiy wrote:
>>
>>
>> On 2/9/26 12:12, Xu Yilun wrote:
>>> On Tue, Aug 04, 2026 at 09:55:33PM -0300, Jason Gunthorpe wrote:
>>>> On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:
>>>>
>>>>> Glad to see you all here to make progress! Intel can also help on
>>>>> this.
>>>>> Can we have a meeting to discuss on these topics? As Alexey mentioned,
>>>>> previously we had a bi-weekly call, perhaps use that for our first
>>>>> meeting? Or what time works best for everyone?
>>>>
>>>> I prefer we defer such community discussions till September, that
>>>> seems appropriate given some dates I've seen.
>>>
>>> Hi Ankit & Jason,
>>>
>>> Do we have a plan to schedule a meeting to discuss next steps?
>>>
>>> If so, we can figure out a specific time on the Discord channel.
>>> https://discord.gg/KKqC438c
>>
>>
>> So I've been trying to find a time slot. Say, keep it on Thursdays
>> (USA) (kinda short notice), bi-weekly, we can do:
>>
>> Scenario A:
>> Seattle (PDT, UTC-7)        07:00 – 08:00    Day 1
>> Atlantic Time (ADT, UTC-3)    11:00 – 12:00    Day 1
>> Berlin (CEST, UTC+2)        16:00 – 17:00    Day 1
>> India (IST, UTC+5:30)        19:30 – 20:30    Day 1
>> China (CST, UTC+8)        22:00 – 23:00    Day 1
>> Sydney (AEST, UTC+10)        00:00 – 01:00    Day 2 (I can do it once
>> in 2 weeks)
>>
>> Scenario B:
>> Seattle (PDT, UTC-7)        18:00 – 19:00    Day 1
>> Atlantic Time (ADT, UTC-3)    22:00 – 23:00    Day 1
>> Berlin (CEST, UTC+2)        03:00 – 04:00    Day 2
>> India (IST, UTC+5:30)        06:30 – 07:30    Day 2
>> China (CST, UTC+8)        09:00 – 10:00    Day 2
>> Sydney (AEST, UTC+10)        11:00 – 12:00    Day 2
>>
>> Scenario C (which is the current schedule):
>> Seattle (PDT, UTC-7)        20:00 – 21:00    Thursday, Sep 3
>> Atlantic Time Zone (ADT, UTC-3)    00:00 – 01:00    Friday, Sep 4
>> Berlin (CEST, UTC+2)        05:00 – 06:00    Day 2
>> India (IST, UTC+5:30)        08:30 – 09:30    Friday, Sep 4
>> China (CST, UTC+8)        11:00 – 12:00    Friday, Sep 4
>> Sydney (AEST, UTC+10)        13:00 – 14:00    Friday, Sep 4
>>
>> The link is:
>> https://zoom-lfx.platform.linuxfoundation.org/meeting/93219227394?password=80705486-101a-4e19-8f11-0baaf92104be
>>
>>
>> but if we want to change the time - who do we contact? Or set up a new
>> call (again, how)?
>>
>> Please, comment. I find these calls pretty productive syncups. So far
>> we were not having Europe in these calls.
>>
>> Alternatively, wait until the LPC in a month but I suspect not
>> everybody is going to be there.
>>

-- 
Alexey

