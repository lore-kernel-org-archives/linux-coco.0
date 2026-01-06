Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8232BE051
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767739157; cv=fail; b=WR9uPM8uJxOiVGh9EVfHF8buInnc0JxyjPhhQJevdB8We44OZaVEqLFduNeK1mEbYtcMnx9twyyugNqcWFjksRjI3XwOu9X++6SnauFyetkpovzsfZ6btsE71J/wxbEiUVdRNDaz/4iAepA2mOmscTMIT5j9HN33zwwLVGbEQG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767739157; c=relaxed/simple;
	bh=xiraZT+bu+c2kJ09gOsgf91FcOtraSfiDi5pdxt0S3g=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AB8LJu8lJPU6eX7Mz32hrTsVRDnTiVy9I4X11Vne4QY/P9EoqnCzy3/VdFtPHteB5jGzqM/boyilgNzwT1EhWe2wlx+Bh2VV05kWIj4CiAYJAwoOrwL/M3xYWbRUmdRnZUVAbY+BTngB/AGTc5rjTm66Q/iQmf/PUuQJqAetblA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=GOslRryz; arc=fail smtp.client-ip=52.101.46.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="GOslRryz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3oZdRYS0/YFleiqkInjWe7ODiUuT3FhdI3/EJ9V0s7tPKogLQlgHONjJc2fyk++7nwjqqlBTlVPMoCbFSUqf0pZNg3MIpdlS/ZQSYUViVm0d5GRxVonEgoudZnfTibcm8NODRcNbGwacaGtW+Ke+/QJZL/v8nWgDy7z/pm1Gi1UTyZXRgPuQE9+8IzTf0Yrkbk1ayZBWRR98was2jFRx7zZtIQTTzRC2NuPD99gSjIqQam7pgbkmY/svG2G/iXXoRp9yb7Jhxcu91Rji8hmZHINElJSEkHmXsnjmdXW5N8XTrysOT5TiClSFgCNgZwqTBK1PzH/zHJ3vf3nlDlZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dq+ihO3Em8BgiEFRSXsJO0AwJuO/6dIFM75Cv4vgz8=;
 b=L8PQHicv8UJntV0IyalvoIRRdxeNuBhC6NtGyEl5BVsQPxSp+zuL6VGckXDfj0kUPgtelYC2hDOyd2rCRgl5OEPsNYdawX0nlVKha5iwpSZEqXHx0bm9FpA/NCef9zjPeMA2gB0R4vbT2VvQS01rtQ/x7Ma7lJ4oQFQKRwEo0BvD1F0ozmzMRsHvhN2FU5oUSvask1CrrxAz21mWphDRXRO26DR/+uUEj2J9J/obkmFNO3sCr/ir/vbtCY11DyajAk3HsWjQFHlEItoQk6UMg7Y893nXgTaAVDI8ivTYHnxFICoW1Y5AjLjJC+FOePctsxzHAPdClPVc5hUC1Lvf1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dq+ihO3Em8BgiEFRSXsJO0AwJuO/6dIFM75Cv4vgz8=;
 b=GOslRryza73XGtrGHe4DG6bbjEzzfn5NPs1HPIo8gSwEpL+2UWDcxV8bEswvfXWlIvGdVjWvsTT7Fr0+H70cm6bbHtFNx9bdW0BbqUkVjczeqUWbuF7W8MQwq4h1MjcDQf8fvlpyOvU3qqKVUrIWakY/x2U3fKlUClB7aunwkTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 22:39:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 22:39:12 +0000
Message-ID: <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>
Date: Tue, 6 Jan 2026 22:39:08 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Williams, Dan J" <dan.j.williams@intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, John Starks <John.Starks@microsoft.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [EXTERNAL] Re: "Paravisor" Feature Enumeration
To: Jon Lange <jlange@microsoft.com>, Dave Hansen <dave.hansen@intel.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA2PR03MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9d3a48-eff1-4fd5-ae40-08de4d746a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFBwbnZJY3ZtRVQvN1B1TCtNZnlXamticXVNWHBoZmVxMm5nZWJrTzk2ZHdR?=
 =?utf-8?B?bllnTGNyT3dRSzlFUUpXbHJZdTlFRWNEeVdobHdkSThZRFJ0YnlwbThoby9o?=
 =?utf-8?B?bUVwZUZzeXVOVllwWGY3alcybDhhbFRsZURrTlJZeUVJL1JhTGFZRHJuSjdF?=
 =?utf-8?B?Unl6NTRTMjNReVMyZ3lFbmpkbVl0M0FadVJibnNRYWdqWWZWalRNcmZTOFIw?=
 =?utf-8?B?d3cydVo5MmpLemR4ODhhTFFMT1ZQaWtwSCtNYTA5RTZZUzJtcmpicDFzR0N6?=
 =?utf-8?B?RUgzM3oxSHY2Z2o0NjkxRjRyTWxiZ1hYd0hJVjdOZU1BWlR2YWwxZDdQQ0Ir?=
 =?utf-8?B?NXcyTzNZS1hIOWlTcURXUFRUSHpGbENpODJsVmU2RWJxaG5pMUI3WVFNeGRD?=
 =?utf-8?B?UVYvZjZpRm9zT2UzVS9iMkczaHFaN2l4OWJ0WnFWMmpxUEs0bE9aYVhKUFpv?=
 =?utf-8?B?eFZQT2c0YlhMemxzRVRteFZseHRSc1VKSldNa0V2TGYyN28rYU1ialh1amMr?=
 =?utf-8?B?Mk52ZnBxM0NkckFvMTd2NlBjcnFaZUFXcVBnWUIwUXVMVU5Qb21rOHhaTFN4?=
 =?utf-8?B?dGE2RnVrRURmYTFsOUJtT0puYWpJWkFFcDhaSXpRMFFKR3VFYWVKTEpHdCt3?=
 =?utf-8?B?ZjYxSUZMWHNKaVdFbjdXWmQ1VGU0QW9pdS9MRXZvN0Nkd2JsVDl1OW44T1da?=
 =?utf-8?B?ZmlLLzc0eDJFOVNHTjNSeDVCZGRoNDlvaWlIWk9YUVVVaTRMOFRvRUxpdE1V?=
 =?utf-8?B?SWc3aTRlQ1h5cW9yeWVsTGhLWnJ0T3RGbmJZVXp3MWdjNGQ3RDF2MFNzVDVy?=
 =?utf-8?B?T0FmMmR1RlRSOHl6dDdkbFNLNXl2bnRwSWJtOU1pQUdYaXB4VXV4aTFYSjNs?=
 =?utf-8?B?eU1hQ05JV1M0TWR5MnIzK04rdm52RGJNWlRhN1hVQWs4K3VQZUFNQnpLaXZJ?=
 =?utf-8?B?b0dPWDE1SzN2SmFKODg0SXU3Y21BTkJHT0FKeG93RVJDWC84SWVyaXhoVy8r?=
 =?utf-8?B?S2owSVVIRWFEZG5zQi9YcG42S1pMaWlBcEZtM2I1ZDJodmNTRlk2YzByWGQ1?=
 =?utf-8?B?eHoxRDZqQ3FSc0hYMy85b2hGZkVieVFYOEk4YkZmWHNnZ2JlVXZBblpyd3BP?=
 =?utf-8?B?RXk0SW0yeitqN0dWdXBERTVzcFdDMmxNK3JMNG1UeEE1MG9wcFpkSnZaUFd3?=
 =?utf-8?B?bDFBbnptVXVLYXRHOS9MNmExZWk4bXhrS2NEQ0RkekxoQVJvRXpQa1hMdkZS?=
 =?utf-8?B?R1BvdTF1UDNzYlpzbmJiNzhFVkIwUkRnc1FwOXM4MHVwMHFqYTZiMFI2ZFY3?=
 =?utf-8?B?ampmeEc2cC9nbnVHZ0g2ZjBsbU9TMHQ2TERkTWxITkc4Q1dxRmZkR1BOYzly?=
 =?utf-8?B?cVJ6dHZTREg3ZFgrdmZSazZXRllFZ2JlcXF5WUlCb1hCRWdRbS8vMjVkallk?=
 =?utf-8?B?TWRhWHh5S3ljaGpTVUR6dnUzVjB0b2xRaHFDU0JwL2pKOW9hS1llWkxGYkQ3?=
 =?utf-8?B?WElVbkNCam1MVmdvamN2T2xOb0t6YjJYTWhteTVvdDV6YzdaelpxY2xiRXJr?=
 =?utf-8?B?U3dVM2labE1HZXFrTDQ2R1IrS1B2SEpLbHVGb1Jzd0lYaktqVVlFUHBROXU2?=
 =?utf-8?B?RnV2S2tiRG9YemtPWWZCZ0lUbkZabkVMbW9hZnpZcTJ3eFBTYWFoRU1OaHdk?=
 =?utf-8?B?V2xjSU1yTUtIZklXMVJJMHBrRk9URENPVWtSbXFkd0tMUGlYa2txTE5GZ2pI?=
 =?utf-8?B?Mnc2WmlxWGtzSjhEd1BqVmdxeDlOKzdCLzRIZGJ5bHR3TjJ2TlNrUXVXZ3hC?=
 =?utf-8?B?WUVQT2dOTnhTczZDVWcwUml3V3BjOHdDbTU5R1hpbmNEVmgzUUU2a20vN2Vo?=
 =?utf-8?B?b2NBcmMzQUFDQ3NYYjhsR1hPZ0MvNTR6cjRZeHlhYzVFMUtKQ25UVXhRTElB?=
 =?utf-8?Q?4JAPMPTQKYRN+3vuF2IsZ1DOJSShMB4W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVdCbkozNk1KUW0rMzFPTitUZ0xhVFQzNWV6RWRnME9SQlJSRVRrYUdSV1lI?=
 =?utf-8?B?VGpPOGl5WlFGOVJJcnN4NjZZb2hZVStPZW5JK1RlcmcyV3VhTGc0Y2tjY1ZY?=
 =?utf-8?B?dmhOdm84cDViMDFrSjhvOC9yYWhoMnB5eFZob1pleHBzMk9OUU1LOTVhNzJP?=
 =?utf-8?B?ZmdLQmJKZTJHYi8zeXVpR0huVDl5TENPRnRUTW1tK2Frb3I3U2pqMjZwejlJ?=
 =?utf-8?B?OXBqN2d3c0lnZDMyM3NFc2NuTWJ2ZGxMMUl2WlJyUEp2clNZZkFWNUYwS2sx?=
 =?utf-8?B?WCtRVG1FcWc1RWxxMUhlNFRDMTRmTE1iOGVCVFRlSVlQRjZQd0JGVWp6c01Z?=
 =?utf-8?B?M044ZkxDRlVKMlM2aDNEaTFKVkpUWTdXM2QxU2pXTFBCY2FJMkk5VWhKdVJJ?=
 =?utf-8?B?TlByZzNJWUhLWlEvL2xSeUg0QklIQ29NdnRpc1VvM3FsbnE5RFNNS2FqLzI0?=
 =?utf-8?B?d1ptZ3hSUG9wenBRdlcySFFHeGZjUEdSYWtNR0Voa0tDZUhNaEJrWUxUaGdw?=
 =?utf-8?B?YVdQQnJNMS93UlFVeWRSNWpDa0xkTXZsWnV4RzdFTjlOTjd2Z25QbHA2L0xV?=
 =?utf-8?B?UmxuazhVNDdBVnNjQXQ5QWwzSnZNYU03Y1h6djgrTGZsRExOTnV6Uk9YZHJ5?=
 =?utf-8?B?ZnBpU2FBYkFnQjJvOW9KYXovN1hlSW44TXkwbVUzdnFvVWYxL0xaN1JBcXlG?=
 =?utf-8?B?bGJCa21RTXVFY0drdjdvOE9oOUNjUVU5ZWthanZyaDFwYjhDWEgxZnMzSkwz?=
 =?utf-8?B?TXNka09SRm9hdzdnWXBvcnVUb2FjcnczSG56NkUvZlVIT29KMEVrL2pxeWk4?=
 =?utf-8?B?V0NML0pDTHh0NTRzSjY2N3ZETEpHSVpyc0g3bm8rOXRqbkR0cXB4L0Y2SVJ0?=
 =?utf-8?B?Z01tcmNxamNKcCt0Z1VPbDZPR3A2a1kxREFGMDhQb05qWWlxT1pVWUU5cVY5?=
 =?utf-8?B?TTRscEswRDNUSUtPZ2FDUjE1eHp1emYrOXZNdzQxT1NTYytad0xFOW0zUjMr?=
 =?utf-8?B?OVR2eHVJUzRLMzNBblUxQ084N0FlYUwrb3MwQnN2T1FWZ29wT3pDU1VWVzMx?=
 =?utf-8?B?cy9lSXFaMG41YkdtNG9oOXkvcnBOY1FaYXhRWTE1eHRCUDhDQjM0a1pPOVk5?=
 =?utf-8?B?aGRzVTZtNUtyS3pUOWJkVlJaUzA4RGt0ZUl4NVdTZlVsMHZnNldPZEdXTnZo?=
 =?utf-8?B?cUZjTS9EUitBbnJYdGN3aUFmbU5TNk15SjRrNjAweDltVlFUR1MxV0I2dVVG?=
 =?utf-8?B?TWlub1h6WVcrVWJoM25Mcms1VHJFTUtGM29KRFJxL3dqR3ZVQnl4aHNTdU1o?=
 =?utf-8?B?K1pmU1c2aWQ0K2sySFdvMDFEVm9mN3ducVZ1RlBKT1UwYkdlRVhKVHlBcG4x?=
 =?utf-8?B?UWRvYVA4OXdUUkxLOXVaQ2ZFNzNOR3BBSXFBd09WNC9QVGxkbkEwS08zTGQv?=
 =?utf-8?B?RzN5ZDI4bERGOHY5dzR0eHBLTGVZbWQwQ0tVS2MvSHp6ZVM1YWF1Si9QKzk0?=
 =?utf-8?B?RlhCRmhhRkFBNUdZclBtd1NCZVgwZmJmMkxlOWgzYWk0RkFHdnd4WXlsNFgr?=
 =?utf-8?B?VDhWeXlGQzBlYXFMb2xZNjdidDVISUVmb205ZzBucjh3RzZLOS9mNUtsRnhC?=
 =?utf-8?B?OGFqUzVxNThnZmd5YU5SWXcyVzdEbHoyTFQvQW5ML05NUHIzUlc2Wi9IUXlv?=
 =?utf-8?B?L1pXczd4RitueWFnRTZBMnY2aEFOOUdRdTBtMW1LMDhVUVFNNnNRM0JUdG1m?=
 =?utf-8?B?YUZrWmlwZ2hKTXNKc3pDR055RFhPUXdXN0ZLWlEwU2NvWk1EZFhkbm9rSThp?=
 =?utf-8?B?WmxyQ0FjZUFqdzRZRHJ3VFVneHNSdFEvaHAyZFBrbURUNlRQSTBsQlZqZHJw?=
 =?utf-8?B?UUsrcEZ5R2s2U3lsUTRMbGsvRFJJSTlOVGMwS3BCVFJGSDhoSVpmQjF0YlRn?=
 =?utf-8?B?UzVBRFVzaU1TM01GeUxVNGxRVVJHaFE0WC9rYTU4UmV4L2RTZUFZOEVSekhO?=
 =?utf-8?B?SmNuMlBuL3ZnZEVpR0ZJenVuQW1IR1IrQnVxUUhZRUJvanlENmxuaHpZb0dp?=
 =?utf-8?B?aE1PZ3NqQ0xta1U2ZXpMQTRnNE9GZnh4OUlpdldjbkt1WFlXUXNPWTdpdVdZ?=
 =?utf-8?B?N0VpbXJuZXhabkJMSmdxVmFDR0JFNEoyTXBxTTdaa2xycDZuUzVQQzY3NXVm?=
 =?utf-8?B?N2IwVHNJMmdyM0F6YlYxUEtMeW9xRjA4bWJPQUNNNllJakVJNC9VQldFQkd0?=
 =?utf-8?B?RC8xQ3UzUFhqMVJ0QlViNFpuWngrUVk5R2hTYnMyTlZrY0cxNDVRY1JzOUF2?=
 =?utf-8?B?M2h1RzJSK0lqcWtkMDZsZkZubzUySkQvZ21GS2hSZGFRSWZSYytPaXY5czVD?=
 =?utf-8?Q?kD7XOTqgTkWJNBZs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9d3a48-eff1-4fd5-ae40-08de4d746a39
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:39:12.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To+uxRyl454wV6LYn6+wekblAMjoTQv0uweEObjKK00JT4gBtAcnDIdBqWVX9QdgRnz7bde/IUnR5PunMu1xPXi5afRqoR7RfyZ1dfme2sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722

On 06/01/2026 2:12 am, Jon Lange wrote:
> Andrew wrote:
>
>> Are we saying that, inside an opaque blob that a customer provides to a CSP to run we might have:
>> * a paravisor and an unaware OS, or
>> * svsm and a fully-aware OS, or
>> * something in-between these two.
>> and we're looking a way to describe which piece of the interior stack owns which capability/service?
>> I think the discussion would benefit greatly from having a couple of concrete examples of data this wants to hold,
>> and how it is to be used at different levels of the interior software stack.
> Here are two examples.  In both examples, the OS is running behind a paravisor but I wouldn't term it an "unaware OS".  Rather, the paravisor is present because of the set of services it provides, and it is running in paravisor mode (not SVSM mode) because the implementation benefits from taking full management responsibility for the confidential trust boundary (e.g. determination of when/how to validate/accept pages).  In such a configuration, where the paravisor has management responsibility for the confidential trust boundary, all of the enlightenments in the guest OS for managing confidentiality state must be suppressed.  The straightforward way to do this is for the paravisor to suppress the confidential VM enumeration information visible to the guest OS (the "SNP available" CPUID bit, or the "TDX active" bit, for example).
>
> Note that this occurs out of necessity because we can't have the paravisor and the guest OS fighting over who has the right/responsibility to execute PVALIDATE, or TDG.MEM.PAGE.ACCEPT, or whatever.  The kernel today only has two concepts of its execution mode: either it is a confidential VM, in which case it takes full responsibility, or it is not a confidential VM, in which case it ignores the responsibility.  When a paravisor (not SVSM) is active, we have to operate in the second mode because the first mode would provoke precisely the conflict we're trying to avoid. 
>
> First example: a confidential VM running under a paravisor wants to obtain an attestation report for itself to pass to a third party to vouch for the fact that it is a confidential VM.  Assume in this example that the relying party is aware of the paravisor and the paravisor's measurements, so the evidence provided in such an attestation report can successfully be verified as authentic.  In order for this to be possible, the kernel has to know that it's running in a confidential VM in a mode where attestation reports are available but where the responsibility for confidential memory state management is suppressed.  This is a third state beyond the two states described above.  This isn't just a userspace problem because access to the attestation service is mediated by a kernel-mode driver that needs to know how to configure itself (such configuration today is based on CPUID and not on ACPI).
>
> Second example: a confidential VM running under a paravisor determines that one of the devices available to it is a TDISP device that requires the OS - not the paravisor - to perform the operations required to configure the device, to obtain and verify its attestation information, and to consent to activating the device in the TDISP RUN state.  In order for the OS to be able to execute that sequence, the device has to know that it is running as a confidential VM so it knows that TDISP configuration may be necessary.

Thankyou - that is helpful.

So overall, we're wanting the paravisor to be able to express "You're in
a confidential VM, but you're not in charge" to the OS.

Hiding the SNP / TDX bit is of course necessary.  They have well defined
meanings which the OS cannot use when it's not in charge.

In your first example, when you say "attestation report", do you mean of
the whole encrypted VM, or only the "OS" part of it?  After all, a
paravisor could be running multiple OSes.

Whichever it is, this is clearly a service provided by the paravisor,
with some kind of API that's going to be of the from "execute
VM(M)CALL/etc with these regs".  TDISP is also CPU-initiated actions,
some of which may need a paravisor API.


What you're really describing is "just another hypervisor".  So really,
on x86, the paravisor (which does control CPUID in this scenario) ought
to hide the outer data, advertise itself at 0x4000_0000, and Linux wants
a new paravirt mode for this new kind of virtual platform, which is
probably not going to be very different from a typical KVM/XenHVM/HyperV
guest today.

Anything else, and it seems like you're just re-inventing the wheel but
a little more square.

Do you foresee a need to pass anything other than "here's a handful of
services that are available to you"?  An ACPI table might be an
approach, but this seems like it could be a leaf or two and nothing more.


There's no common enumeration scheme between different architectures,
but I'm a firm believer that things ought to be enumerated in the
typical way for the architecture/platform.  This means CPUID on x86, and
things like devicetree on ARM.  It's slightly ugly duplicating
information, but it's less ugly than shoehorning a non-typical
enumeration scheme in to an existing infrastructure.

~Andrew
