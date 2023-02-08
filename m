Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B2160
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 23:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQdjNKxX+fV6tg7HJMGnueI7q5LxqkVJGwSN3WafKer0+x2lVechEsKrEo74iuJOeYxnwAuXP08/kqCscP8UXNtn7OLmjK8xaWzRi9JTaq4z/o/tD2mC7xXjuzfzNDUxTY/Gnt16qCd7eBKh6UTtpPyIQFBpt3DD/rRVnoxUloLb43GJByrmUI5w+l+QQDeTdgcd+tdpvRSAZUnxJl/9dCeKRSFZY7hy387Qc+2qcf2B6Q0CfekRV3r9NdnLbXRsgZnMkygoafEKl9b0a5Q43GrMXbj6o4WxEdC1flnO+DpBh7PvP/bcq0yJyh525ka10REpepGZHSPaiL7EcrBH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za9DRUPOf2RaE673SpDTxfiG94gTJcWPeuyV0cbSlyE=;
 b=dn3dBJS1Kp3UJ47iPzirQYc9bwCFHl92g9w/2QQ4nNIqHXw8R1xyEkpHm4bloO2NJy5obMIevxUSRlGZI4JoRLHecROZmHjyfFYS9wJnTsMpP5sMAvsHywUbN1AhxuoCuCZCHPLNSkUESLLOoA9l2akhEcziyQRQa6o82uixjLo/Bg6KhaFaF3isQQdCI1VwyhHN0K9I1+xChVp47N5KPU28IhrEPQWYimLCPbY9KwHnrHfY56sFQTpVoMZ69FVjn9Tdn0PutE05wc1w7CL5IsKCW8bHluhCzSCxOhjyDCTZo2/onY8ujlYT+v7unAxzyaq5KrqxS5fT7Zrc135WGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za9DRUPOf2RaE673SpDTxfiG94gTJcWPeuyV0cbSlyE=;
 b=h1nuf5LuhAus+Qp/zEUVeWnPLi2ewdWb+Ap3ThrA/Lkd6iQlPs6hFBSHHtk/nbzH5MU3RCj8iYw/1FKlcQUGDgmukkxtFkYanjMwerWk0Hhx0zmd2tlt+E8S1obY4rL2v3JhNNJ02Ht42ROs0WXVX4DTPI+UxOy/33ChOo+Jey0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 23:44:40 +0000
Received: from BL1PR12MB5221.namprd12.prod.outlook.com
 ([fe80::429c:3214:d07f:a8f9]) by BL1PR12MB5221.namprd12.prod.outlook.com
 ([fe80::429c:3214:d07f:a8f9%9]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 23:44:40 +0000
Message-ID: <ca480b3f-be7c-4c78-a69e-06771e578308@amd.com>
Date: Wed, 8 Feb 2023 17:44:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Content-Language: en-US
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <CAAH4kHZTGpkTwhShg1n-_4TBe5dQ5RZFowFGUwvCWdUH_saq5g@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAAH4kHZTGpkTwhShg1n-_4TBe5dQ5RZFowFGUwvCWdUH_saq5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0140.namprd02.prod.outlook.com
 (2603:10b6:208:35::45) To BL1PR12MB5221.namprd12.prod.outlook.com
 (2603:10b6:208:30b::9)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 44450f49-b353-4c82-9649-08db0a2e71e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sT8VC037RYt5J5tQzOJOU4TqufzqCrrPhSGW7+M5y8W+6nyOy0u3fILQxmS2Aa/Bu2Lba9KD9GMaTwedWhsuDzFovB15irGIG98aDD4lubKDFBIIM9KGmTYqXGnyVS/AhphgkzYMREUXrkioHpvN0h8PGYaHUX3c6RYD7BU3GcR76S24Xab+aAXYcwqvUkfvPb+jrz2FLDOucoq4vWX3z2TL08X+y2CnLL3x2Yo8uriNSer8rwrbHKnsnL8OIYDM1GzbVBxYF1nCKn1M3bPh86jO3dXQfngAxWl8zYCWKfCIc2pGr4jS2dd+93vw8J6JfqIHQ9XUAlD2lqas7DYVIk+KSkjAmLENPs2evKEyscMwwj82ofUE7i5JeYOOTu/ivvif1vmNEhuD6uJYu7Kit+8kYb6VHJeour4tr9kcB2CO+9IPpOU5306qAnoct2jrSez1Z+0MaOfr0lTAyLSglSLfZFMk5ZAXJTjZNmlwjjVbhfh4Ufc1maR+Ix1BXwExTL/GXD2Ffq9XuaOV6+vgbC7tFKSm88SzSww8RHDtUcNbuYxBVTrDBvBHPaIj+VelxR1ZQTHh5xjQiiwF4VVveebGPFxcGqwsbJFrYuFlmqojqAV8I/5/jgQ0NzyO34h1TRdQtBEKtDk6skY8AhxkIUg5b92o/mlk1WVNobDLbqNozwrjgSSxyPGzlQIg8VJPG25tY7YzMXBqg5l56fnyQA3sICbrygEgtX357pLdaV0UHNmW/U45C8eNAdna4+Q/HkkS9plzbTlEhWvT5/P7BwMC2jLYpDxkpJ6oIlvrsrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5221.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(2906002)(4744005)(36756003)(83380400001)(2616005)(38100700002)(66476007)(66556008)(66946007)(54906003)(316002)(5660300002)(8936002)(4326008)(6916009)(8676002)(41300700001)(26005)(186003)(6512007)(6506007)(53546011)(31696002)(6486002)(478600001)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDM5SmVOSGsreUFON3ZHYms2Yk1tdkIzaG8vUXZDTjlVN0pIbG9SL3lYNW12?=
 =?utf-8?B?c3FiYXM1em9QMVlYdGZjbDlqTW4rTEpwRDgyVkdUUjZNVi9kNGIwV09ldjl4?=
 =?utf-8?B?anhVSGNiMm9TbTRNNDQxUHlkOWNXVTRsbEtXVm1kS3B2dkU5bTBLakhGTTZk?=
 =?utf-8?B?YkJ6Qk0zV1VyeTU1ZjBiSFF1R01waDBWV3Z4bWxiWENyV3FISXJmTDU5ZXEr?=
 =?utf-8?B?ZUo1ZDVXSjQxSWRrNnR6MEJaYXlLek10a1NDaWtOc0JpNTVReEhQVEFBYW1v?=
 =?utf-8?B?dTVhT2dYanU5RFd2NWIrNG81Z2hiWnc4aFNzL05SRThwcXBoTjBrQVZ0Nkhj?=
 =?utf-8?B?RWd6eU5BL1J2VEZwOStmUVJYQXJNcFdYYjhJdnEzVTFIT1pnVkpCOExHM050?=
 =?utf-8?B?M0tFb1l4TVhRVG9pS2ZWbk1YVG54cHYzNXlWR0NZOFlUU05BZ2xzOTN1ZzYw?=
 =?utf-8?B?YWZSbTl0NjlBY216eGdod0FEUGtjT09pa1o1UmxRb1dDQ2ZqcU91V0lmL1A4?=
 =?utf-8?B?M0NWYTh6dVRNZ3IrS05zM2dOcmVkYXNJTytWR3g1MUpxdjZ6SGZid0tnYkFs?=
 =?utf-8?B?cXArOFJvNnlkRW1xWUNTeTNoeEh4NFhDZDhVcFJieWF3Z2UxK2NiWk9tL2Nt?=
 =?utf-8?B?Mk0zck5Ka2crT3BlSXAyMVVtZFB1cFFCWEwyb29BWE92d3ZyWEgwTXlSZHZ1?=
 =?utf-8?B?ZHBSYVNtaVQrdmNCbnU2aUY2ZUptQ3lmQ3RYTXNZc2RxMmJURUxGM3dhWnBn?=
 =?utf-8?B?aDFnR05aN05pWU14OVZzNnNnUDdmS3d1cXh0R0gzYVVabUpZSkVyYkk2d2l2?=
 =?utf-8?B?aEhhVE5TOU5PUmdvU01kOHIweEg5TTdDaHdYeC9oaEt2dkJTbndXVXp4N1lK?=
 =?utf-8?B?c3dlYTFYcTcwUFV0dFU4TDlpQlhNbURKM0FCb3FxMUNDWmpxdmNFZHRpUU9E?=
 =?utf-8?B?RUpPeXVIZWY2b0ZaeVdyVW1jaXZMSVJYSzZZaDRLWHJvMlRvU2Q1d0p4TDk0?=
 =?utf-8?B?R2VJV2lkQk1ySkVVc2NRVjd0Ym1BTUhTZlJMVHNhOVFBTUdPUU50WTVtNFdk?=
 =?utf-8?B?cys3cUFOSUJyYUtDY2hmRy9jUk1oQnhFMHpQdy9HSjN2S2NmQWlyNnBKZnR1?=
 =?utf-8?B?d3N3OHdYK29vTkVScGNtTitWWnYwTi9ublhkempSWE1SMmJFWHVwTmpNc3dT?=
 =?utf-8?B?WVZtY3FvNWFsM0txZUR4Qm40NkNiRng0Qy92SkYxaEpoQ2xOMHpuOUc1ZUZy?=
 =?utf-8?B?VysrbmdQVC90Z1VMZXVBU0RWNjZUTXBLUFRFNEQweWxNN2IzSU84RjlMZW5D?=
 =?utf-8?B?L3MrSjJZUDNnZklSYlIyaVNmbVNDNDVUVjEwbFB2TzRaSlBSM0VKMWhUYkJs?=
 =?utf-8?B?MmpzaGE0ZUNNRHF5YytJa3k2Wk9ZUlFMUitUN2lNdUhhSC9lT0VUT0ZwYkMv?=
 =?utf-8?B?SkRsdHV0Z01HWVFMMmxSOTNaY1BGS1I0MmpEK0tCNXJILzBOdWpScEdpRUNV?=
 =?utf-8?B?VFdVUGgySmU3MjdGMVJXSXM0R1ZSL20yK1VpQVdtVUF2cHg2dHUyVGNjcnhE?=
 =?utf-8?B?blNXMnZuWUtVNElXM1JNR1l2dWVPMU9uS0w5NmlVY2FGWmxlVSt2V2hCQ0Ex?=
 =?utf-8?B?QkN5Z3ZBUmFNSWVLNkhEek1DRXVSV3N2NTVJQVVYYWh5aWt2NVJ5ZytIbU1K?=
 =?utf-8?B?d1YzODFvM3RPK1d6WlRKbktFTFR6K2NVaTMvT2NmQTIyZXZDRElJTzlmSVVa?=
 =?utf-8?B?aVhqRTYzUnFkT0lWei9QS3pyczRtOFpPZFZGc05KZFk3cnc5eWJ5VlRIZnBM?=
 =?utf-8?B?YUxFcHhJTTVaUTkvVmZxNU0vZjhpSXVIcXlrNVRkVCtQN2Q1WGhvaytrZEtq?=
 =?utf-8?B?TlNLVGw0Nk9pZDBmS0dIZW9qbGRUWjRvZUJ3c1lENDF5Q2hnbFNqeHExeUZZ?=
 =?utf-8?B?aG9qbHhyc3NYYWlQcHp5NTI2WFBBaWlleHBXRnJ2cS9UalIyQ3J1d3M1R29D?=
 =?utf-8?B?b0RKbkp4Uk9UZXVucmJMUVVsdi9oU0JmTXV1RkYwM1VoNFBsVDJnWlErT2Z0?=
 =?utf-8?B?d3FHQ2ZjcEIzOHRsSEE3bnBYY1VXZURWWkVwbGNSOUE0eDBpWHkrVStxSnAv?=
 =?utf-8?Q?X9sNVHmuteGCB/mGM6/vsEYUH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44450f49-b353-4c82-9649-08db0a2e71e9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5221.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 23:44:40.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kskjLsojlKRbI1XjUbbjrUFk4XW2N0Fv6pJaPUageZCBZmZIEaKLwlMU0WndI41nHM5tPQzWiDX6M1ARfqc5BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

On 2/8/23 17:19, Dionna Amalie Glaze wrote:
> 8.1 You have RCX RCX in the first table where it is clear by context
> that it should be RCX RDX, but just a small edit to keep in mind for
> next time.

Thank you. I could have sworn I fixed that since it was pointed out in the 
previous version... oh well.

Thanks,
Tom

> 
> On Wed, Feb 8, 2023 at 1:55 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> Attached is an updated draft version of the SVSM specification with
>> feedback incorporated from the previous review. Please take a look and
>> reply with any feedback you may have.
>>
>> Thanks,
>> Tom
> 
> 
> 
