Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390AE2248B9
	for <linux-coco@lists.linux.dev>; Tue, 27 Jan 2026 23:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554934; cv=fail; b=oJrn4FhTp3R2fOnZkgSXbWOgYUO5zyTWbve4hn/OXgpYS8psXyHUg7zvXNAW5gvR6vLFn8BYwtnqAgJwcdYcbOoY7v3CaPcYpQFnyXqkPeqa6f3RRuOvrB0OiH+xJKd29X5SfJO6fdQQ3xIacJ5z66pEfSPIUaaVjSWJi6rDv/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554934; c=relaxed/simple;
	bh=+IXdVe0S4pmgCzQMFpd7g/6y1SbAJ62SPeUWodKkD0M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nuP0zWsJuuzkpeoMChKrhD3pl/GAcZtYDySIcCTbuRhIZtFlzxrDrF15U74a3pGKwZ4TubZkLDd+JEKuoBl3UiKKDXYQUpUdWJ68YalL13t0pofufv5ICbR1L4u70QOZqI4o5/Ae1valPxV9fI2NEYWc1B09GHq71E8ez341hOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hyAhkPDb; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hyAhkPDb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUw9ZojUcN7pDR6Zs++2O+AntnYVe/x0vG65QBt9C5AbVTz4pKj1+G6CJf9fCXam+LoaloDuo9xTndzVW+J+GelY8pCRDZAdovm4z1Zooqdn3D9RfrSjq07POwMVS/dms3Xsu1JoK6irVmGQ1oTrgfcMEgt8UuOqtWpzHiRu09NT5WexnwEXQercEsYuMtrqCRRNH9EHkSMARW7pg/AFUkXQ+m8oNreO3U+PX7mnAzeyhj7xtMfzv/ukGjuVp/nyR7ywAXoY+1P3Gc7dnbOkWYZsXmGQrT68lCGoPKy6Ai8aB0RsTC9DUdlrkjJ5tcMoyfIrcCPR1rftrJaCSj8TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxqw59+PrDMqsWlSYMQDhFeR3z9lO8gYsAAzRr/G3lo=;
 b=p/DZM8ZGLNYN6WZ00HtYO2o5EEQHSxKUph+TMxoOOUTv3F83d2E+h2h/BLCBEu1AZxzo0bxYiOwN7J2Ab/EiJxk0sGU5FQNwy2gcSmouIDnfiDodk7lZQfi+eTOssTbPGGi29qC5Mq0eJbErvYpY8uWnmX/Jixmo030w2tcobeyLIb4jbY+HSn/bxnyT+UO0ADoDGlVpm6Izrm5bu00KKJRQVzsOuY2ZsW26HFM02MlJjJnM/dAu9UlSEnQyL4/rF0heskWIoDoHfvtXv6fPqcopCinEvZsfukzRriiUyjA2/FNdOQiNs4GMP7+AJV6ein9Rg50vy9iaCRyYt43vDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxqw59+PrDMqsWlSYMQDhFeR3z9lO8gYsAAzRr/G3lo=;
 b=hyAhkPDbWLfJ4z667qkKUCN2g6X1nKEB738KcJKw+7dq+1NNj+znlHIiQUYH7GulZal6RgbmOUwSNfe6tiLpuKJzFBduj2cFxZFaRwO0x2DJvfCeOEGnEYTHwksOaXySycZ66AuVk8giPB9v5V6RCq8uWMFuHkfBY1EJcLqMvmdmYVo3mGzBJRWdde0Ghhj1ClgewJ0hfguuMsTHf4v0ibKNz4hvNbmp5R9xNxNlaxR1qdJhqjuB1xTg8t+Hf27bZj8QbrfuQStkATW5CCG4aPF9UuTXqsKweFImPtXzg5kOXnCQTthfuRoDLeCk25W6gnFBLIaIeT+A3Xglj0usqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Tue, 27 Jan 2026 23:02:05 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 23:02:04 +0000
Message-ID: <bf1addf9-5e28-46c6-8943-6a359630e533@nvidia.com>
Date: Tue, 27 Jan 2026 15:01:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Salman Nabi <salman.nabi@arm.com>, andre.przywara@arm.com,
 sudeep.holla@arm.com, mark.rutland@arm.com, lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
Content-Language: en-US
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::28) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: f4338213-6e58-4e83-8156-08de5df81684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmpHeVJkMmlEZTFIMUFUWjhEV1ZxdmoyT3RzN2xrRUtwUHdBM21KZ2pZQjc1?=
 =?utf-8?B?QUtJeHMvOWdRU2d1TEVBRE1kZTBkVUh0UDhWdkVJVWdnODV4VkRZZ3pNR0U4?=
 =?utf-8?B?K0RDRk1pS0hIWEZ5cHBFVExFQmJkdXdlalVHWUdPbUZ3NWQzUi9YR3NsZG45?=
 =?utf-8?B?aEtYV2NtazJhTENTZzRwaHFpbFJHNUNTaHgzQ3ZiZTB0U0I4azhPMG1OcDRL?=
 =?utf-8?B?clRNOVYxVHgyaTVsZWZCSEVkSmZTMHh2QlphZUpHdjdBUnpCOFhJb3ppN0Vv?=
 =?utf-8?B?WW1EY1FicklheWkxUHRHeVpBRks5b0VwVTg2NGRVbFVuUTY2MUhlVFgxczdr?=
 =?utf-8?B?SkFrUWlrNmw4RE9jL2I3THNzV2Z3aVdtQmxCRU82dTMvZURRV3FnazB3RUVa?=
 =?utf-8?B?VkdkWUxXcTY1OHhkYVB0eDJtcUFUSC83OWlCcXExTjdDdldsWm1WcS80ZzJB?=
 =?utf-8?B?MmYrUVMwczNkRU0yaGY4YXhJaHQrQVJYZWRCVGJ6UUtDQU53TGFLZ3RFNy9L?=
 =?utf-8?B?WWYrK1RpZ1ZpM1JqUFJDMEJJd3FLbXl5TDBka2MxYk8zR05UT1FBeGV5VXgz?=
 =?utf-8?B?ejF1Q3RDOUlBQkdrano5bGF1UElZUlZyaTNjeWdsRjdBRktvZ3JCakdpZDFD?=
 =?utf-8?B?NVVKTVE1WFBkRExCQXNseDFVRnQrTHNDeFAyWWRCRHNoR24razFadFZUUUJ5?=
 =?utf-8?B?M0EwbFRuQWRPQ2pmNlExdzNIaFBvQ0RRQ3VhSTEvUU9HaTJ4MFF5NjhaYXhj?=
 =?utf-8?B?K0ZuR2J0NkVHUUVtZHBoUjRteFFjTTFQQUJhWjJZZXVKZ1E2TzFWMWdPcE9H?=
 =?utf-8?B?R2tkMnYzbEJSeWJ2TkZaRzBuVFZyWnEwbjB4TWJQcXdLYTNhamt6cEdxV1Z2?=
 =?utf-8?B?RGpYN2t3b3pUZzI4NzJtMnJoMHpwZS9Qc1FVYndxbGsrN3YyRHJXYkJVT2lW?=
 =?utf-8?B?TGk2V0Q2eEt6cWh4dVAwR0dXWjl2UlBvVS9kS1ZsRytlUXlVMVg1ZWY3U2J5?=
 =?utf-8?B?TzduaFUyTDF2L2JWS2ZnNUpMYWdYL1JnMGxsY1VGdmlZWDhWaVZQVkdiL25W?=
 =?utf-8?B?Q3d6ZVBjYjNQVFAxV0F4REcxdW5VdE9ZTHRtbm04MUs0KzMxT3k3K0JYN0ox?=
 =?utf-8?B?QlVxdXZwWlpNSGdIOVRjbzRYK1ViUkZueUtadUhPcXpVb1JOMGw3bThaWEx4?=
 =?utf-8?B?UHdwKzFWNmdrQnc0djBmaENVZmdGbHNaVWdOTThTbE43Zlp6RUFPRDZ2Zjla?=
 =?utf-8?B?elZDdzY3WUpYbjZDSXl3enczbDZJcmhXbEpHVFk5anJIZEl1VUdvSDlWT2tp?=
 =?utf-8?B?aFRkUEJLZHJjY2wwOWJhcC84L2NLWnlRVU5zQ2RHWmtqamtiREZSUm15eWVi?=
 =?utf-8?B?ZHArWUQ5eEhQZHZ1NjhPZmFUWVRyOC9lUDc5eDNKb01iRjhJNVVQdWNHb2U4?=
 =?utf-8?B?bkI2d0JLR21IZFBuVittUm9kM3NCdUtSVkRveld2Ukk5aWQ3Uk00OTRKSFh1?=
 =?utf-8?B?OW1aK0N0RmtBMTdBRllIeWZhZ3BNSjdCWnZnQzVpeWNHS1doVTc2QkpDQmJk?=
 =?utf-8?B?cDJua1E3eG40U3BsaFBIN1pBMVdwVUxUWUtuckNiK0w3aTFYR1hTM2JwZzJy?=
 =?utf-8?B?bXNIK2VQdkp0WkxrWmwyR2RIV3NFb1BYR1M4Y0srNUp4cU00RHUvY09xNGk2?=
 =?utf-8?B?MldYQVFyVFE5a0FjS01ybklQZXgzV3VkbzRoQjgwYndRcDc2WjBWRWZsblZF?=
 =?utf-8?B?MzNqNi9vb09qQU5MSjNwbTk2VjRYNnl5TGM3RWVmVnI5UjZwbkw5UkwyMTV0?=
 =?utf-8?B?OS9LN29xUVNZeVJXRTBUZlZmQVZkNTY4L0NZTUcyQzVCSGJkd1JKNGZ4MFp2?=
 =?utf-8?B?N0RNSiswbmlwaEFxZk9za3ZTa1dIT0NpWWQwbE5oaFp0bThUWHI4c2ZJYnN4?=
 =?utf-8?B?bWlJQldkSGVwRXhoQ0JFKzhtK1VMWlVmdVdFaVk3dkJPQ3VaSWE0VG9UWEw1?=
 =?utf-8?B?bUptMUlYbkU3TWVzaDRRdlJISkFkNFQ3YnpwNWxyRFZhcU9MVTNScXJVcmxp?=
 =?utf-8?B?RFYzYVA5NEVlbEZteFphMkJRY2VOQ2dkVHErWW4weHNlV2piOHRJU3lRL0Z5?=
 =?utf-8?Q?49XI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDZ1ZVRFeDFjRng5Tm5iemdVR0lLNHIvUmtiYlhrWGVPb2NBQ0UxSFpBWmtB?=
 =?utf-8?B?NStLQjM5RCtWU1h6Q1c5R1BQZUtqd0RHcmp2b1hpcm1nZzFkeG5PZUhjczZ4?=
 =?utf-8?B?WlVkK2liM0VOWnBxbnBFTUlEem13Tk12R3Q4ZjFJU2pLMTNHVjc3TS9BVlJn?=
 =?utf-8?B?UXNnNnZ5RVBLc2h6VkpWcGI1L0NzNnNUN3EvaUdVSW11M0tDVUdkQi9ncTJr?=
 =?utf-8?B?alVoa0lkNjIxUkFleTZFd3JFQmhTc0xlSU9wbE13QzJ4QktJZWhlQVRHaGlx?=
 =?utf-8?B?ZGR5TWoraWp6a0R6TzhSZ1BlWHVxWkZBTXhsdjhuRjBmYzJFUGZ3S2pzZHdK?=
 =?utf-8?B?SnM4bFJkdUgraXFVRGZoNHVsazg1RWNYN21HeXlrRkJQM3dPWjNUa0NvdDNX?=
 =?utf-8?B?bWJpUFBWeFUwLzRLTGdWUDUvQ2lsOGp4eUN0NjYzbGVpNjN4bUd2cU8wM3Fm?=
 =?utf-8?B?S0lUVm50TVlZNGNCRVpWTndaZlpyUVFYcUt5SzJ5TnRjVnpGVWFLRlU3bjl5?=
 =?utf-8?B?OU5zYU9odFAwM202emRrcWNRSzF0RGlLS1dmbGlURWlTRklGaU03Z0ZTY0dM?=
 =?utf-8?B?Qzh2Nm56WEU5Z2NUaStJL3dDYVhtVHV0ZE5JM3ZhQ3dmUXdqbzZkM0I0NlFL?=
 =?utf-8?B?dDFLd2ltMkpIWDlEbnpoNUZZaW52cC9vQ3Bya1lKMmRYdk5ueW5nMmsveERK?=
 =?utf-8?B?S0RscTlJYkt6UllCdDRSN2dxOEpYaDY5OE1iOENIdUt2ejl5bzNpc3Q2WGV1?=
 =?utf-8?B?cHBOSk5xVlpUb0xwWTFEaWhsNTE3QlFPd3JwNkhPYnFwOUxaalVRSWFrdDJz?=
 =?utf-8?B?b0pNeW5SWk4rMjRJOUtHNzFpTnhIREF6eEhTd3VUZTEwRVhsVklBZEJhWi9Z?=
 =?utf-8?B?dVlTNDRNVllUWE5YTWZoVWl4Y24yTGFsNGgvLzBIaXBGRTVIYlJ4cUV1ZFdj?=
 =?utf-8?B?ckk2blNJWnZRQWc4bTlHUnY0WHN3YTF3SHRkakdMYWVXc3g2a0tOd1hVcnAv?=
 =?utf-8?B?TExMbVBsMGNSajlyTDV4STlvVmg3ZlhOSHFlNytrT0V2dnNVQnhYQWVmeUlv?=
 =?utf-8?B?V2x3Sk4rMFN5dUJlRStjM1dYc2laTDFLS3VuR0NpTFdhcVBkUklkVENPMFgz?=
 =?utf-8?B?Q3FrME91dHduZWxlY2Q0ay9ldUlqMVRndEhrWkxiRjY1Q3o0STBXbUNhdDU2?=
 =?utf-8?B?ODMxRVpLR1dpZ2taSDdZNEpOYVQwTVltUFcyTUwrNU5aNHZZbGlwMWsrZWFh?=
 =?utf-8?B?WVc1WTBtQVcxWUZUaG8wM21mcWZlekllTzJyb3VCZUw3WWZZZFFEL0RwVzF5?=
 =?utf-8?B?cGpHVXdRcEVoTkJ1eE5VaTU1cTFqaU16MlMwY3NWR2JJUDBNUVBFc1h0TnhH?=
 =?utf-8?B?MGtETzJ0aXhyZGJwd2hRVUluTkN1c1JlR2w2eC9jU1F0b2ZReWE4emFia1BF?=
 =?utf-8?B?eEdGZjMwVTVzM3RZb005bEdmTXNzWVRpNXNDcFRzNEE1S1FZQThvZHloVVZF?=
 =?utf-8?B?QkNsVkxYU1JHdWdZSUk4em1rNEF4Mkp6TEw4cUlTdHgvQjdrRE4wcURVZ0Jl?=
 =?utf-8?B?bkp3QVVVckpWWFhlMmh3a2pKcEE1c2FqZytiazRGOEdWM1k3NHNSdTBRTGVK?=
 =?utf-8?B?Zjcyb3pFT3BUSTVSdUVZVnhNS2FCVWIySkpkbXV3ZmJlNmxqRWVUMzhxUW5k?=
 =?utf-8?B?RVFnbVN1UUhZWlpIajJjZW4yR21oU2dzWFFIVHRpMXp1Vmxvb09MeDZWeEU1?=
 =?utf-8?B?YjhYemoreGRSUHhZYTZWbUIzTFJOc2RMVjdFZ1NuOWQ4TDhKdGhtemJrcExh?=
 =?utf-8?B?eXhnT2dEc2ZwVityU2tNaG51RGZGNE1GYnJscC84T3Z1YkZUUU1IbVZ2cDZP?=
 =?utf-8?B?VzhaVUtsVnlPaVVQVnJrL0U5azVHL3lYbGlaTmpHQUhmZzdWUXdOa1NNbGxu?=
 =?utf-8?B?OGFESE1oeEtESzdOUkpxUlhwZEYzaWg3SDIzNzBmWk51Rk5oSmwrNXNyL2xG?=
 =?utf-8?B?YXM4SW1RZW9KZkNtSkJwL1dVbmZNU1g0UjhtbWxuSy9OQzZHaW9iYy94Mk1Y?=
 =?utf-8?B?VEZYbzExdHdiYUlRWENRTUc5M1lOSDBFZlpVMnZOYVpVdG1YUjl3N1dJM1Za?=
 =?utf-8?B?WElJQlV5dmtlTW1Lc3FFOUxpWmQrK21vVldWdUtFSll3cHpXTk5SQ0FKQzgy?=
 =?utf-8?B?djMvRHllbzZhSENZSTkwU0dtdVpBT25YYmRCQWtUVWtBOVJjMmVYcnduZUd5?=
 =?utf-8?B?Q1ZxazBIeXRjYktPdlduWkJNWmhudEhBRnBXYWtmQUo0K1dzeGU4YTJ2R3JR?=
 =?utf-8?B?cHUxV2ltenVNK2VZWWxuZ0xUcnI5TTMwQmNubzZKbnU4bm9qN1JUZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4338213-6e58-4e83-8156-08de5df81684
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:02:04.6477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRyy5fKWazmQoD06qxhhWkmBLV4euPnyRud8mK5K9/W152RcTMhe6LI0u1cu3RLnIOXZB7ktabPd8BWBf533MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506

Hello,

On 1/19/26 04:27, Salman Nabi wrote:
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
> 
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
> 
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
> total 0
> --w-------    1 0        0             4096 Jan 19 11:33 activate
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
> --w-------    1 0        0             4096 Jan 19 11:33 cancel
> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
> grep: activate: Permission denied
> activation_capable:1
> activation_pending:1
> grep: cancel: Permission denied
> cpu_rendezvous:1
> current_version:0.0
> force_cpu_rendezvous:1
> may_reset_cpu:0
> name:TF-RMM
> pending_version:0.0
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
> [ 2825.797871] Arm LFA: firmware activation succeeded.
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
> ==========================================
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
> ---
>   drivers/firmware/smccc/Kconfig  |   8 +
>   drivers/firmware/smccc/Makefile |   1 +
>   drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>   3 files changed, 677 insertions(+)
>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..ff7ca49486b0 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +
> +config ARM_LFA
> +	tristate "Arm Live Firmware activation support"
> +	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
> +	help
> +	  Include support for triggering Live Firmware Activation, which
> +	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..a6dd01558a94 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> new file mode 100644
> index 000000000000..ce54049b7190
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -0,0 +1,668 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Arm Limited
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/stop_machine.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/psci.h>
> +#include <uapi/linux/psci.h>
> +#include <linux/uuid.h>
> +#include <linux/array_size.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "Arm LFA: " fmt
> +
> +/* LFA v1.0b0 specification */
> +#define LFA_1_0_FN_BASE			0xc40002e0
> +#define LFA_1_0_FN(n)			(LFA_1_0_FN_BASE + (n))
> +
> +#define LFA_1_0_FN_GET_VERSION		LFA_1_0_FN(0)
> +#define LFA_1_0_FN_CHECK_FEATURE	LFA_1_0_FN(1)
> +#define LFA_1_0_FN_GET_INFO		LFA_1_0_FN(2)
> +#define LFA_1_0_FN_GET_INVENTORY	LFA_1_0_FN(3)
> +#define LFA_1_0_FN_PRIME		LFA_1_0_FN(4)
> +#define LFA_1_0_FN_ACTIVATE		LFA_1_0_FN(5)
> +#define LFA_1_0_FN_CANCEL		LFA_1_0_FN(6)
> +
> +/* CALL_AGAIN flags (returned by SMC) */
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
> +
> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		1
> +#define LFA_BUSY			2
> +#define LFA_AUTH_ERROR			3
> +#define LFA_NO_MEMORY			4
> +#define LFA_CRITICAL_ERROR		5
> +#define LFA_DEVICE_ERROR		6
> +#define LFA_WRONG_STATE			7
> +#define LFA_INVALID_PARAMETERS		8
> +#define LFA_COMPONENT_WRONG_STATE	9
> +#define LFA_INVALID_ADDRESS		10
> +#define LFA_ACTIVATION_FAILED		11
> +
> +#define LFA_ERROR_STRING(name) \
> +	[name] = #name
> +
> +static const char * const lfa_error_strings[] = {
> +	LFA_ERROR_STRING(LFA_SUCCESS),
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
> +	LFA_ERROR_STRING(LFA_BUSY),
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
> +};
> +
> +enum image_attr_names {
> +	LFA_ATTR_NAME,
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct image_props {
> +	struct list_head image_node;
> +	const char *image_name;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	struct kobject *image_dir;
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +static LIST_HEAD(lfa_fw_images);
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",
> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
> +	},
> +	{
> +		.name = "BL33 non-secure payload",
> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
> +	},
> +	{
> +		.name = "TF-RMM",
> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
> +	},
> +};
> +
> +static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
> +static struct workqueue_struct *fw_images_update_wq;
> +static struct work_struct fw_images_update_work;
> +
> +static int update_fw_images_tree(void);
> +
> +static void delete_fw_image_node(struct image_props *attrs)
> +{
> +	int i;
> +
> +	for (i = 0; i < LFA_ATTR_NR_IMAGES; i++)
> +		sysfs_remove_file(attrs->image_dir, &attrs->image_attrs[i].attr);
> +
> +	kobject_put(attrs->image_dir);
> +	list_del(&attrs->image_node);
> +	kfree(attrs);
> +}
> +
> +static void remove_invalid_fw_images(struct work_struct *work)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * Remove firmware images including directories that are no longer
> +	 * present in the LFA agent after updating the existing ones.
> +	 */
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
> +		if (attrs->fw_seq_id == -1)
> +			delete_fw_image_node(attrs);
> +	}
> +
> +	mutex_unlock(&lfa_lock);
> +}
> +
> +static void set_image_flags(struct image_props *attrs, int seq_id,
> +			    u32 image_flags, u64 reg_current_ver,
> +			    u64 reg_pending_ver)
> +{
> +	attrs->fw_seq_id = seq_id;
> +	attrs->current_version = reg_current_ver;
> +	attrs->pending_version = reg_pending_ver;
> +	attrs->activation_capable = !!(image_flags & BIT(0));
> +	attrs->activation_pending = !!(image_flags & BIT(1));
> +	attrs->may_reset_cpu = !!(image_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	attrs->cpu_rendezvous = !(image_flags & BIT(3));
> +}
> +
> +static unsigned long get_nr_lfa_components(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_GET_INFO;
> +	reg.a1 = 0; /* lfa_info_selector = 0 */
> +
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 != LFA_SUCCESS)
> +		return reg.a0;
> +
> +	return reg.a1;
> +}
> +
> +static int lfa_cancel(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_CANCEL;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (reg.a0 == LFA_SUCCESS) {
> +		pr_info("Activation cancelled for image %s\n",
> +			attrs->image_name);
> +	} else {
> +		pr_err("Firmware activation could not be cancelled: %s\n",
> +		       lfa_error_strings[-reg.a0]);
> +		return -EINVAL;
> +	}
> +
> +	return reg.a0;
> +}
> +
> +static int call_lfa_activate(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_ACTIVATE;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	/*
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and context
> +	 * ID respectively.
> +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +	 * cpu_rendezvous is dictated by each firmware component.
> +	 */
> +	reg.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
> +
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("ACTIVATE for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_ACTIVATE_CALL_AGAIN))
> +			break; /* ACTIVATE successful */
> +	}
The implementation uses same 'struct arm_smccc_1_2_regs reg' as
input and output for arm_smccc_1_2_invoke(). Here, reg.a0 (function ID), 
reg.a1 (fw_seq_id) and reg.a2 (cpu rendezvous) are initialized once 
before the loop and arm_smccc_1_2_invoke() overwrites the whole register 
set on every iteration. That means inputs (a0, a1, a2) can be clobbered 
between loop iterations unless reassigned each time.
Suggestion: Re-initialize input members of reg on each loop iteration or 
use a separate 'struct arm_smccc_1_2_regs' for output to avoid input 
corruption.
> +
> +	return reg.a0;
> +}
> +
> +static int activate_fw_image(struct image_props *attrs)
> +{
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
> +		ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
> +	else
> +		ret = call_lfa_activate(attrs);
> +
> +	if (ret != 0) {
> +		mutex_unlock(&lfa_lock);
> +		return lfa_cancel(attrs);
> +	}
> +
> +	/*
> +	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
> +	 * number of firmware images in the LFA agent may change after a
> +	 * successful activation attempt. Negate all image flags as well.
> +	 */
> +	attrs = NULL;
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		set_image_flags(attrs, -1, 0b1000, 0, 0);
> +	}
> +
> +	update_fw_images_tree();
> +
> +	/*
> +	 * Removing non-valid image directories at the end of an activation.
> +	 * We can't remove the sysfs attributes while in the respective
> +	 * _store() handler, so have to postpone the list removal to a
> +	 * workqueue.
> +	 */
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +	queue_work(fw_images_update_wq, &fw_images_update_work);
> +	mutex_unlock(&lfa_lock);
> +
> +	return ret;
> +}
> +
> +static int prime_fw_image(struct image_props *attrs)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	/* Avoid SMC calls on invalid firmware images */
> +	if (attrs->fw_seq_id == -1) {
> +		pr_err("Arm LFA: Invalid firmware sequence id\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -ENODEV;
> +	}
> +
> +	if (attrs->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME/ACTIVATE will return 1 in reg.a1 if the firmware
> +	 * priming/activation is still in progress. In that case
> +	 * LFA_PRIME/ACTIVATE will need to be called again.
> +	 * reg.a1 will become 0 once the prime/activate process completes.
> +	 */
> +	reg.a0 = LFA_1_0_FN_PRIME;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("LFA_PRIME for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			mutex_unlock(&lfa_lock);
> +
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			ret = 0;
> +			break; /* PRIME successful */
> +		}
> +	}
Similar comment to call_lfa_activate(). Suggestion to either re-assign 
'struct arm_smccc_1_2_regs' input values on each loop iteration or use a 
separate 'struct arm_smccc_1_2_regs' for output to avoid input 
corruption between loop iterations. This matches the intended 
'CALL_AGAIN' protocal while keeping the inputs stable across retries.
> +
> +	mutex_unlock(&lfa_lock);
> +	return ret;
The introduction of separate 'ret' cariable does not appear necessary 
for functional correctness. The SMCCC status is conveyed via reg.a0 on 
each iteration, so returning reg.a0 should preserve existing behavior.
If 'ret' must be kept, consider initializing it to 0 at declaration 
time. That avoids setting ret = 0 inside 'PRIME successful' path and 
leads to simpler control flow.
> +}
> +
> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_NAME]);
> +
> +	return sysfs_emit(buf, "%s\n", attrs->image_name);
> +}
> +
> +static ssize_t activation_capable_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_CAPABLE]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_capable);
> +}
> +
> +static ssize_t activation_pending_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	/*
> +	 * Activation pending status can change anytime thus we need to update
> +	 * and return its current value
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS)
> +		attrs->activation_pending = !!(reg.a3 & BIT(1));
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_pending);
> +}
> +
> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_MAY_RESET_CPU]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
> +}
> +
> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
> +}
> +
> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +	int ret;
> +
> +	ret = kstrtobool(buf, &attrs->cpu_rendezvous_forced);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous_forced);
> +}
> +
> +static ssize_t current_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_CURRENT_VERSION]);
> +	u32 maj, min;
> +
> +	maj = attrs->current_version >> 32;
> +	min = attrs->current_version & 0xffffffff;
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t pending_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	u32 maj, min;
> +
> +	/*
> +	 * Similar to activation pending, this value can change following an
> +	 * update, we need to retrieve fresh info instead of stale information.
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS) {
> +		if (reg.a5 != 0 && attrs->activation_pending)
> +		{
> +			attrs->pending_version = reg.a5;
> +			maj = reg.a5 >> 32;
> +			min = reg.a5 & 0xffffffff;
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACTIVATE]);
> +	int ret;
> +
> +	ret = prime_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware prime failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	ret = activate_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware activation failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	pr_info("Firmware activation succeeded\n");
> +
> +	return count;
> +}
> +
> +static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_CANCEL]);
> +	int ret;
> +
> +	ret = lfa_cancel(attrs);
> +	if (ret != 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
> +	[LFA_ATTR_NAME]			= __ATTR_RO(name),
> +	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
> +	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
> +	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
> +	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
> +	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
> +	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
> +	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
> +	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
> +};
> +
> +static void clean_fw_images_tree(void)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
> +		delete_fw_image_node(attrs);
> +}
> +
> +static int update_fw_image_node(char *fw_uuid, int seq_id,
> +					  u32 image_flags, u64 reg_current_ver,
> +					  u64 reg_pending_ver)
> +{
> +	const char *image_name = "(unknown)";
> +	struct image_props *attrs;
> +	int ret;
> +
> +	/*
> +	 * If a fw_image is already in the images list then we just update
> +	 * its flags and seq_id instead of trying to recreate it.
> +	 */
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		if (!strcmp(attrs->image_dir->name, fw_uuid)) {
> +			set_image_flags(attrs, seq_id, image_flags,
> +					reg_current_ver, reg_pending_ver);
> +			return 0;
> +		}
> +	}
> +
> +	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
> +		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
> +			image_name = fw_images_uuids[i].name;
> +	}
I would recommend using fw_uuid as the image_name when UUID is not
found in fw_images_uuids[], currently the driver assigns 'unknown'
in such case.
There is a valid possibility that platform-specific FW images, not
listed in fw_images_uuids[], are used by LFA agent for live FW
activation. In such scenarios, falling back to 'unknown' would lose
important information especially when errors surface in
call_lfa_activate(). Using UUID directly would indicate which
image failed or behaved unexpectedly.

Thank you,
Veda
> +
> +	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
> +	if (!attrs->image_dir)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&attrs->image_node);
> +	attrs->image_name = image_name;
> +	attrs->cpu_rendezvous_forced = 1;
> +	set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
> +			reg_pending_ver);
> +
> +	/*
> +	 * The attributes for each sysfs file are constant (handler functions,
> +	 * name and permissions are the same within each directory), but we
> +	 * need a per-directory copy regardless, to get a unique handle
> +	 * for each directory, so that container_of can do its magic.
> +	 * Also this requires an explicit sysfs_attr_init(), since it's a new
> +	 * copy, to make LOCKDEP happy.
> +	 */
> +	memcpy(attrs->image_attrs, image_attrs_group,
> +	       sizeof(attrs->image_attrs));
> +	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
> +		struct attribute *attr = &attrs->image_attrs[i].attr;
> +
> +		sysfs_attr_init(attr);
> +		ret = sysfs_create_file(attrs->image_dir, attr);
> +		if (ret) {
> +			pr_err("creating sysfs file for uuid %s: %d\n",
> +			       fw_uuid, ret);
> +			clean_fw_images_tree();
> +
> +			return ret;
> +		}
> +	}
> +	list_add(&attrs->image_node, &lfa_fw_images);
> +
> +	return ret;
> +}
> +
> +static int update_fw_images_tree(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	struct uuid_regs image_uuid;
> +	char image_id_str[40];
> +	int ret, num_of_components;
> +
> +	num_of_components = get_nr_lfa_components();
> +	if (num_of_components <= 0) {
> +		pr_err("Error getting number of LFA components\n");
> +		return -ENODEV;
> +	}
> +
> +	for (int i = 0; i < num_of_components; i++) {
> +		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +		reg.a1 = i; /* fw_seq_id under consideration */
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +		if (reg.a0 == LFA_SUCCESS) {
> +			image_uuid.uuid_lo = reg.a1;
> +			image_uuid.uuid_hi = reg.a2;
> +
> +			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
> +				 &image_uuid);
> +			ret = update_fw_image_node(image_id_str, i,
> +							reg.a3, reg.a4, reg.a5);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init lfa_init(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int err;
> +
> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
> +		pr_info("Live Firmware activation: no firmware agent found\n");
> +		return -ENODEV;
> +	}
> +
> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
> +					     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_images_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +
> +		return -ENOMEM;
> +	}
> +
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
> +		reg.a0 >> 16, reg.a0 & 0xffff);
> +
> +	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
> +	if (!lfa_dir)
> +		return -ENOMEM;
> +
> +	mutex_lock(&lfa_lock);
> +	err = update_fw_images_tree();
> +	if (err != 0)
> +		kobject_put(lfa_dir);
> +
> +	mutex_unlock(&lfa_lock);
> +	return err;
> +}
> +module_init(lfa_init);
> +
> +static void __exit lfa_exit(void)
> +{
> +	flush_workqueue(fw_images_update_wq);
> +	destroy_workqueue(fw_images_update_wq);
> +
> +	mutex_lock(&lfa_lock);
> +	clean_fw_images_tree();
> +	mutex_unlock(&lfa_lock);
> +
> +	kobject_put(lfa_dir);
> +}
> +module_exit(lfa_exit);
> +
> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
> +MODULE_LICENSE("GPL");

