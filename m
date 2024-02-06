Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38939134A6
	for <linux-coco@lists.linux.dev>; Tue,  6 Feb 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707243025; cv=fail; b=CHfhosL5Ll3k/lgvXf+yryQWgFwPa9jRDjlLCYPmcpjN7KfAm+SE4W8L7cjtxDmVmrirLrwuczy9DEtg+926lb6WTsuyKFEFTqSb0zbtTGDsQ5yEJxkzLP5TMKrMGCFfkVHqLTWgny1vYbn9w3mq9KYJVrufTzg5OhymMkO/154=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707243025; c=relaxed/simple;
	bh=yPU/dbdG7nGxSdULbvWr05ckV7DPJor8ypgDxeRMxF0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OXzsTXyRe4nUGKpsayyB8ckQzT2p/SXcCRJxl47oFH6iB+sPleXLsqSuQW+FQE0i91Q946/GyrBoY36IAmtYSirTXskxe8p3HHcfZsHoBH30O0G51AEx7SBG1ePpyaXFTfpZrkLkzuHUjQ55fHxujOjr5Bz+BgeMaU+rmNg78ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZfLi8kxQ; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZfLi8kxQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxkxmmI4PZFmhZ3L7xy6GZhywcwP8Xs1Oh3Qm86II7+UNncODmOeNjuCXEha9Ez5Ej7zCvzQ0IsOeO5492V3c2L43ExLrRuVDHuYxIi/fSNrO4EBepWrlJemqMFNhciojB4OdXUHM1vLTSFHKFLOydDodxdwblQg9pzXamR2VG2wWQxcCoogihcEFeAtj5r5wMPyJCq9KsjUSgclG3NulPB97vSUAEx1ctqDRLUTm8SCQJ7eBJ/cGhQ+rxhya3b3ufgbNSqCkGN2HITekRfqmHxAEHQO4LfUPsTM+J1uuskVMokwqgL2uNL/7ghIRA/Ye4Eq+M6PjQgcbBKxLBJ9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0fG76dmgQh/KPApHoNgeoyqy1loK9WJJTGdAlmysL4=;
 b=PNGlXCtof6svIJqyMe16duEhspkwYmoiSK9ojPphe3KNS7gbJ8eTf+Ht7pMMOCV5OC0wpQ+mdT8tULyf4oKPRCz+1u5ZiK8RuN/uBLCee4E3KtyeLiJbTFxeanK9lm0kt6T7+UsvNit2MPGptIIIBENS+dufu3P8PCjVh4HRuQeykDW7kcRhtzk2CKFHlgR8Ukhy0LKpzcsUye4rXpy8l7VJ6Kt6AAZuyyvXiehZ5bLcW8+K/YJIh7pyw6w6CTPbKAwKV0e3H/9iz8c8+ZLXe4INb6enZ49B0tdho/cSCiDHWv4KUifqIUJJd8W0S+SVOD7r03BgLLRj8rc4U5ytng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0fG76dmgQh/KPApHoNgeoyqy1loK9WJJTGdAlmysL4=;
 b=ZfLi8kxQdvbhnbKu9uvS9ve1syT/gRgZTnHP9NSH3334bMNPf20jkCbPyDmgW+TpHtZ5TnTCi38imA9IRcXYPN9sUyj7fHZ5PkXTJitgMeF5LUpw2RIbWlQQkXzINGE4Vx5iLL895xQUTuGh47HxoHE9gDw2fev/C0beiz6cH0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by SA1PR12MB5657.namprd12.prod.outlook.com (2603:10b6:806:234::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Tue, 6 Feb
 2024 18:10:18 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::251:b545:952c:18dd]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::251:b545:952c:18dd%7]) with mapi id 15.20.7270.012; Tue, 6 Feb 2024
 18:10:18 +0000
Message-ID: <e9fb3fdf-dc00-421b-a44f-2b2b231607c8@amd.com>
Date: Tue, 6 Feb 2024 12:10:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and
 Cargo workspace transition)
Content-Language: en-US
To: Jon Lange <jlange@microsoft.com>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <jroedel@suse.de>, "svsm-devel@coconut-svsm.dev"
 <svsm-devel@coconut-svsm.dev>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <C58BAD04-27B1-4183-8A65-5E4699E1BFF1@suse.de>
 <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <MN0PR21MB3072D34761004C4555CA635DCA462@MN0PR21MB3072.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR12CA0032.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::45) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|SA1PR12MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 6954f77f-5251-4866-6f4f-08dc273ee042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pQ6PkZuVV1LAJMBMhxTblUM/sZiwHzji26NKZGAN6H8PxpLkP7IVt811m2OJAOybUSiE7NGNlWHaDh2MtUMUFVD+DAewQYy9y13vDsluHwotqWsYoYE7ytMBAaBy8qe0cnYINAfwa3owK/HfWiTMbsmH8t9ywOj8pJYfU/JN+j4Kuz8HY0UjucxKlhYwYtUBgoLOp4ALGx9XnE7fLmOlJubPAcyGR9C4t1xwfPEuR5uDQzhLU5brdEpU56XHL+X30az1zN8vZVgrMWQinYZUVFY+nPYX8lE3H7uAlF20jT4guuxLTrU5fQL4aEIDJNLr2YEprlJWUm1h+dqOiHS6tseiwsP9IvaMSWOR+q4r/W2TZ1eJqxe1O/WSWk+dRdp4MDQ6X0nX5DyY9FCO4cSMzGM4hQoBii/AOCPfLYRSxry8NUcg2Urm39PlM1gw/+rLzkauaKA4AJFpIGHmHQ3B0vwUTTyCLkmrX1lmVecUQpu3Vq2cvBSnyBYKRH4og6Ic2lYMeSWqOmGUvjMKN7wJjZyAZTgD9+zqmX5yIjJkqe5d1kGd6cq5bSJsMBSU1nooPr7fHOYjJpBlFQxc44jHb/2rKg9Opbu7CW1pskHceURFwjG7Mc+E1Bv0hPrpFCRTR0EHr8+WeSdmawFehDek1A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(136003)(396003)(376002)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(478600001)(31696002)(26005)(2616005)(316002)(2906002)(44832011)(86362001)(6506007)(38100700002)(8676002)(110136005)(66946007)(8936002)(66574015)(66476007)(5660300002)(83380400001)(66556008)(41300700001)(966005)(53546011)(6512007)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?by9oTC8xWmNpTzJyejlUaHJQTnVVczl5R3R2TWxqMk5lWTMvZjZGbm14dHAx?=
 =?utf-8?B?ejRCYWRtZ1JkdGdnbUdsa2dPNXUwaGY4M2NDRFNVUi9wakV6QWlhTStDNmNJ?=
 =?utf-8?B?bXp2alUrVjkvejBiOVBFaXJoZldqRlUrSUdpS25MR1JjWjBGY1FMZkoxNjR2?=
 =?utf-8?B?OW9Qa3A3a29JZGJhWHh1cnpvYnl5Yiszb3FYdEllNW5qUGNpd29VQWRtOGc5?=
 =?utf-8?B?NE1xSnNrakFUaTF5cFoyM0VyUFVvNDdOSENWYVhMdXo1SXRWc3FsVCtkenJN?=
 =?utf-8?B?M1BkK0Fldk5mUXhzbmhDazJaUm9PYnRWcm9HRitVNVFQdlkySHEvNEJWNENB?=
 =?utf-8?B?b2htbm96T01JdXowNGxiWi9jR3daWkZaYU80Y2FNOXBJckk2YU9xR0RqSjl3?=
 =?utf-8?B?cjczcVZtNW90a0g0OUw0Q2F4WktuWDhvVGlJZjdaU2hOdjMwUHo3aFltZ3JB?=
 =?utf-8?B?ejZOQnFyTEJPSUYwU2h0RG5paXl4NHZENWFuVXNIaERxY1RvVytzSUlFWTRv?=
 =?utf-8?B?WExLbmx4azZTRUxhSjY4eGNzRXJhbU0rU0FPTXFzdWtzNWtlMTdBRmxHTjZY?=
 =?utf-8?B?ZVE5Vnh6UDRkUFFVZzZ2ZmlkZTRkbVA4SHdCejRrMFpTOWFLalBObWRWaGh6?=
 =?utf-8?B?Qm9ma2JqYWRQZUhqQ3FSQk1Gam8rVHFOS0dHQXd1UXJicURGTW5BWlhPekZZ?=
 =?utf-8?B?ME0wQTJ3ZHJnU0RxNXM4UUx6cXI2OVorKytOZ20yODZoWkZ3WjRXTGdTS3Bt?=
 =?utf-8?B?amdXNFpRTUdaL3MwZElpNUg0cmdPSzhneTBkSUN5cDd0RWZHbkNOZmNPNmR3?=
 =?utf-8?B?WkU5dWtTeGtRSUZLSnFmbkxLMTFtaTV0TnROWU1IdG9tcnJldzlGNDB1RHdy?=
 =?utf-8?B?SzdLT2hiY2luZWRaUnQxakhrdXF6TzRsV2FGOURlb0Z0ZGZJWEVNTW9GeUxG?=
 =?utf-8?B?UnBlSWFlNGhONXFhdjNxejN0RUNTNHVzamp4S3E2WDAvZkRmeHA5SHVMTy82?=
 =?utf-8?B?elhCTXcvYUNjWm5scTU3K0RWL3MzQmFvNDFuMXFFZGxVSEpkcitVZE96OWk3?=
 =?utf-8?B?cEVydHJSaUtCSWdLSlFOdGd5ZmlpMXpVUjJtYU5RQTRVeHRZYWw5dEVmKzBT?=
 =?utf-8?B?eWQybk91dDVNTXdYQ0ExaEpaYmJDMkVUZTdMMTl6SDhnUFpTVjlKR2xNUFdE?=
 =?utf-8?B?NFdmZXdRM213WE4vQkY2UE5uM3FVeENkSXNiemFDNUdISzVPdDBUdWg3UENL?=
 =?utf-8?B?OThkek9nVUp1YXhiTDVGUndzWnlUNW5Cc3ptWURtYkhjQzNmUHZvZzNCLzRt?=
 =?utf-8?B?aHlRaGVhRXl1c2FLUUZ6UnUzMGExZGFjZ2I4Z3BaVHZQdFk5N3l5Rnc3bW43?=
 =?utf-8?B?Q3dCS05pSmRqdk8vMU1adDJwN1J2U2RSSEtlUnFDWWtLdERGZ2RBRVJjQUZR?=
 =?utf-8?B?cUtqTkoxSGh5a3VkZU8ySzE2QjR4TWVGaU9ua0xhTkJDQVFWZFpUNUNSUVRV?=
 =?utf-8?B?dmNnR05yN2FlUG9jeVN2b2Q5czM5aHR0MFBsR1UyRWsxK0tXRFVNa3BFMDl4?=
 =?utf-8?B?cGIwMjVUSVVrMXVlVE9KQ2Y5ZVJ5bU5TaENCSVNWSVgyaG9nOWh0di9hTEJL?=
 =?utf-8?B?TGRDdE5qTnl6T05obnF1aFNQdGdpa0RjZ2hWZkljVVk5cGtUazlrV1pLSlVX?=
 =?utf-8?B?T3F5NGF1bVd3bHVUSXYvK3NxUy8zdnhBYm5wRFp2aW9veUJZY0hDN0h5cDhY?=
 =?utf-8?B?bjFDd0NNa2hScVExNXZsdWxnRmRXSERybHdpbmVHWlNuVnA3UElYaXNHUzc3?=
 =?utf-8?B?TEtTQlpZSmpnQmFISitrNS9WTkczMi8xazBWVGd0WGlEeHFIems3b3BvZm16?=
 =?utf-8?B?UGRJelYvQmVVOC9pTnVKNlZMdlFTcWJ0M2lVQnZLb2txZWR2QnRYazhFbDJD?=
 =?utf-8?B?cWRFYmkrbml1RzlldW83VCtQaTBzSDBUWkNLRGdIQlZvS0sxa3ZhS3dCSmM5?=
 =?utf-8?B?eWxxcFlNRHozbjhhTFdKWjNkMVY0b3YrREVGTGJ4MTV4MlM0bUtrOGdXcUJJ?=
 =?utf-8?B?aG5zd202MmYxdXY5UXFNOHA0WmJ5WW9IQ2VZWjlaLzl4eit3R1ZQR0tHQXdp?=
 =?utf-8?Q?iBUJgIT2NrPaG7lwGiBOHnByt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6954f77f-5251-4866-6f4f-08dc273ee042
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 18:10:18.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfBweMIYCMo9J/jpFTCmiE7iynlbZlstGNGYtadBL2R6eSiynb9by/Y+6sUpusHGOxVR5mxY1/jDW7YlVvzfrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5657

Hello,

I have an open PR and don't mind rebasing it. Since we already have both
Cargo.lock and Cargo.toml, I'd appreciate it if tomorrow we could go
through what this change may entail in practice.

Thanks,
Carlos Bilbao

On 2/6/24 11:41, Jon Lange wrote:
> Realistically, there will not be a point in time at which there are no pending PRs, so there will always be some number of PRs subject to conflict no matter when the transition is made.  It seems much better to make the transition as early as possible to reap the benefits of the transition.  Count me as another voice in strong support of option (1).
> 
> -Jon
> 
> -----Original Message-----
> From: Svsm-devel <svsm-devel-bounces@coconut-svsm.dev> On Behalf Of Jörg Rödel
> Sent: Tuesday, February 6, 2024 8:29 AM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: [EXTERNAL] [svsm-devel] SVSM Development Call Feb. 7th, 2024 (and Cargo workspace transition)
> 
> Hi,
> 
> As some of you already noticed there is a PR now which transforms the SVSM repository into a cargo workspace.
> 
> I consider the move to a cargo workspace an important change which should better happen sooner than later, but it is also very intrusive, basically breaking any other pending PR.
> 
> So there are two possible strategies right now:
> 
> 1) Merge the cargo workspace PR and let everyone else rebase their work on-top. That is work for everyone, but should not cause major hickups as only file paths will change and not the actual file content
> 2) Merge some of the pending PRs first and then do the cargo workspace transition. This requires re-basing the cargo workspace PR, which is also quite some work.
> 
> I am leaning towards option 1) as I think the sooner the transition is done the better, but I am open to other opinions on this. So if you think option 1) will not work/causes too much hassle or we should do something different, please speak up. Merging PRs is stopped until there is a decision on this, which I hope will be made after the SVSM Development call tomorrow.
> 
> The call is happing as usual tomorrow at 9am PST/5pm UTC/6pm CET.
> 
> You are all invited to join the discussion at:
> 
> https://meet.google.com/ppv-xehx-dvb
> 
> Please also let me know of any additional agenda items you want to discuss, either by replying to this email or raising them in the meeting.
> 
> A public Google calendar is available here:
> 
> https://calendar.google.com/calendar/u/0?cid=Y181NWEzOGYzNDYwYzYzODc2MmE3NWQ0ZmQ2ZWRhM2IxY2Y0NTVlYzRjZmQ3ZjgzMjAxZTNjYmY4MTdiNDIwZGQ4QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20
> 
> Looking forward to see you all there and discuss the above topics!
> 
> Regards,
> 
> Jörg Rödel
> jroedel@suse.de
> 
> SUSE Software Solutions Germany GmbH
> Frankenstraße 146
> 90461 Nürnberg
> Germany
> https://www.suse.com/
> 
> Geschäftsführer: Ivo Totev, Andrew McDonald, Werner Knoblich (HRB 36809, AG Nürnberg)
> 
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
> 
