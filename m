Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC47474
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 21:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9zz3g/vh0AWAvIQZzImWLzj6/UaIQZtokWUXuvI8jfC0CdZzAMQBGVBJAc+XQ2cFVNrpHg8JxHP3rRRyVfrt90N2u4FaKmLm8QI+HTHbCFS7ep9TNTc7CZmWC+OuIDcc8qzpecobSSySd5mZPDJjNMPQg0kOW3f9Pt699wQciLQdpOsQM1+WSPf3eodLLkJKrXOOaNK1XsAI6v5thxCsDcXXwyAHdDBIcahmWm+3hi9yPM5NTJUvh7Go5qj6cYA5QaZA7Mj/Y4KEpcHpYOcbJmJ2NwrBUuzubefSaMXjuWbSZjQvvhFn2y053SAMbg/tuy2Xof/Uf1am9jkaVJNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvfPFheLJ721ZlgBQUTcQ+nhkQgkIuuS3bRfnh+1In8=;
 b=Ez6UPtKBHCP8Xb2RijigFttolpYbc/DxpQX0GSLBKr5rad1zvl+WZaJt25exYCWq7aZPCuHCNJU+o9dIRx/iNSa6w+1qVDhS47DerEX/OEOGliFxJVwXDiinHs+aa/+8Xw1x/6/Dk0LeAkzwVGiYZNYJ3K6KAjNXwtsnYVN2jWnP6Oe4WybEyb1O0pVaXMh+I7B5tKP7QC5mU7Y6qWNfHuLM1U+RMwzJIcwhqJ8aLX52IYe5DJB2/ufmhCWyzc3S3LQACrXi3sy12NooPkYK6XaRP+Bb6SL/yOIn5fWKhAvDkEFY7Lp0Vz5o3+W6SMshnylQ/CwQIcEbIjLHPUHVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvfPFheLJ721ZlgBQUTcQ+nhkQgkIuuS3bRfnh+1In8=;
 b=MR5lSjWspSohfwrZ5j2aDgH/wLezKLPPie1H2ngEkIouH3mWxMV2OpR5NUD/Lmz9XMus8hWQIO/PufkDklH1JQ9yX/A5XL4kypMe3LyStDPYdqpW3DExTZXHCyJ09AbeTpbY8vMk8qHV+aika8OEkUn92A82UwV3HU4BmqHjjeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 21:33:24 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 21:33:24 +0000
Message-ID: <c19286cc-d62f-ad3c-2346-499ca6df8f2f@amd.com>
Date: Tue, 10 Jan 2023 15:33:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
 <a7734e60f667d2d7b43a4a8e6da3d61fd6997666.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <a7734e60f667d2d7b43a4a8e6da3d61fd6997666.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::26) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 00074b5e-ba2b-4406-fcfa-08daf3524d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YVpBS1ioHnZk1JbyENmeLVaNb0Cg61GzFNUZRIgs/P4ucIcggFx/pIbi3EWnfWC3jB4jQ2NyRGsdBhZSXSEw4CFgrmmOYjFgy2HhkWcUXpiz3nqFLcUMZ3vhjKt4n7wxYGSGoifmOimjMQzpcd4USSIaLVUreTupvfo8JOEiqe6ekBH3g2Ygm5F1C+tttnNSM4Kjg+JnfywQ+Cn5yZj+sTgvz1a+uGRTMpIgzA9GdnUcajUKrN1SUE50dp0j4aWkMIKh2Mb+334ppeRC9DfsOdTfav2DlW1UOqwUwZuo+W2OTHxVY2NT37Kx2D8VYQE9wOr4ILVAI4Sisyb4nCiL6axlVJ6T6TaH8HdoC1rQh7VPKvtjyVSs3tYfHeZRcje2DEbk7Z2369YPiGEaOJGLxL3/lHvlKGmNvLwF43OTL4BVAs37Sgh4RPNIc63dwsq0NFnAgandKXpeVd7YUBTV9UuSWzKRSf6N58FKLxVe/kd+HOBO6fztEEb0v//LeklY/iJR7onVSd6WXuc4xAxk9iBzgmZpovJIa57sLb+6aSojyJC/51RMmvMAMiujwX+2alnsvPeK6PJJgx3KUIofGOOZgNlKSbKFw7sKejjXCe0modLsUq50db58KyXBrm/gecssic1saU/Ha4wPuhgi84mKkJ1qxxgRkW3fXZy3bgIDHF80DINUvvDa6kv4n1L+szmtoC0I+QKjfrzLL5ZH5Oeru852FhoWPbf6/FqwqkA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199015)(8676002)(66476007)(66946007)(66556008)(316002)(110136005)(5660300002)(2906002)(8936002)(41300700001)(36756003)(31696002)(6666004)(478600001)(53546011)(6506007)(6486002)(558084003)(2616005)(38100700002)(6512007)(26005)(86362001)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ancrQ0JnTStiUmRHVVdUSTNaLzFjYmZqbnY5V1RnUjk0OWdxc1hLVWtJY2lj?=
 =?utf-8?B?aWU1eml4L1p2RVhjTnpwUWdDN1BQNkNlRmFPcWhvVndlNGZ5WDNXQ0ZHSFI2?=
 =?utf-8?B?a25uZG84dFQrTTBZZHJSQ2hITUJSNFJ6KzlXZzVvRmUxOGM3a1RQNk5rUjhU?=
 =?utf-8?B?Nm9ZUjRtNE9yS0t6MGo5TWVkc3NmUkR0Um9qRElNTWsweE83TmNMa1JkOFhY?=
 =?utf-8?B?ckJZNC9wbWJYZnJHR0JSQ09nbk84QlZ5SkNSei9XandZTFhvTHQreUYxQ0Vn?=
 =?utf-8?B?dmdRU1NlcFNER1cxVlJDL05LWnBBT3pnaHFMQmVrSnJzUEFuMHUySitCQm1m?=
 =?utf-8?B?ZXZXZEZxZEtzSzIvRHhqQkNuTm9XWVREdGJTNW5CTmt3QkVQVlJBeEJKYjBK?=
 =?utf-8?B?a2p6bWdna2NSU1k3Ynprd3Z1NTIvU3M1RU9taSt0d1pkekhodXdESVNab0FD?=
 =?utf-8?B?eWlSbDhwMi9SZGRRaGtCMHh0Mkk0Q2x0TDBtaDJ1cVhSOURqZWF3UldDMk5N?=
 =?utf-8?B?cHgvMmtmUVE1dW9FMG9HUEhRS0VSUVp2dDNOa1ptT25mV0lLMG01dFFzUk1k?=
 =?utf-8?B?dmR5dENJR0pJTFo3NEFJbERMMzhvc1I3S1h1TXgvaWxnQUFjVnFVUStqMXVG?=
 =?utf-8?B?SlVaYUJtZVpEaHJYcjZFYXc5NVY4NFFzbCsrOElvZjFJaTVybWxFK2l1OGFE?=
 =?utf-8?B?Ukc2ankzT3ZOUElLVDRlcFlKTFVmMWczQXJuRUF6bnVoQ3JhcHJyWEtDbmcv?=
 =?utf-8?B?WFJneDY3dFllUGhEUk82L0VnTDh2TUFycjdrcHhlMmZaUTV1dkVjVVFrY2lj?=
 =?utf-8?B?c29wNldSSVBaNjVRZU8yOVNKUTZGbEFvMy9KWVpKYmJGa0p4bWZ6MElhWW5v?=
 =?utf-8?B?bm15TUV6aHlqcktVaXBxVzlWb0YwNS9rekgzTktUVWNOYlUrRXl5SUk5YWZU?=
 =?utf-8?B?Q1REQ1pCbExaeG5IejcyKzZFVWFpQVZ3dVErMEQwRTN0KzcrMW5hZWxRSFVH?=
 =?utf-8?B?YXU0QXN0b1ZiTWplcEtwbkdJQWFRRVhzV1g4VkFpT0xhQWpmcXAveEJWQmN5?=
 =?utf-8?B?N1FHNjY5dVFoNFg2aTJsYWc0U2NoWGsrUi9NUmZBYU13VHRnMjFhQ0d3Wmh4?=
 =?utf-8?B?ajZxMUE2cDliR0lMQ1RncXc0QXliWjFsbVZpeDZkVFM5cmdOQmJqQVIwUUZT?=
 =?utf-8?B?Q2xMaUVCdVcxM2NFNzJ1TGIwdDBrTVhrUnh6N2VSenYvK0NHck5QbjNrbWts?=
 =?utf-8?B?cFM3UUxQb2tRM25yRjNINENsSTdORkxqeWUyZEZrWlFVQ0dscE9seWlGM3Nw?=
 =?utf-8?B?cy82M1hvOXZBSHk0TkZUenYxSG51Uk5mUmplc0x2WHNFcEkxeTd0VERMRWxq?=
 =?utf-8?B?WnUzbEJpRkp3QzZSYkJKT0NMbDc1QWxNVDJ3a011eTd1c3ZRQ0NqL2kzL0lN?=
 =?utf-8?B?MmtLTkJaREFvbllraGNuM1hRMFhJWEF3QmJBVmxrNXpYY3BzQjd3ay9pdHZK?=
 =?utf-8?B?ZDh0dis5QUVCbHZNem5hamszdGRNMG5ESmR1R01CQ2JERUhHQ05sYVlEK2Fu?=
 =?utf-8?B?RWRJRk1pWEhWdXNETmdSSzY5QmNkMlJnSVloNHBrdy92Z1d3cHdyckZidnJY?=
 =?utf-8?B?RlBiTDdmRys3MUl1OEZUbTdCelE3MVZkRk1UbkZLZlZROVpRMEk4TmRjOXgv?=
 =?utf-8?B?bzRFME5DMGtJeXVLMi9ENXNTeTYvNjNKNWpjSWMxS0pSaTRjM3hBN0VHV2hF?=
 =?utf-8?B?M1l6c0hCUUQzMERQcHpaSEoyYnNhQ2NQeXZXWFFtUFlnMnVKZnRPU1l3S09a?=
 =?utf-8?B?TjZROWZ0Z2FaQVFYRThXYVFMOStZNXA3d0dweGI5TnZjMjZzS1JNUFA4b1BW?=
 =?utf-8?B?UTJqWWZ4QkdtaXZLLzVtYWpiTlE0RVlpUG0xU0FDVnl3UXZESVIzY1RyWWlk?=
 =?utf-8?B?S1RGbnZOTzZ6dFVkVWVRY2lnTnp6eVdBNXNOMzlZQm5tbmZtU0E4YmNmclA0?=
 =?utf-8?B?NlM1N0E2di9WbEMwbWpPTlljMmszbU96MDNpUFF4aWYxWVQ3cDF3QmdxelZ0?=
 =?utf-8?B?dGljNWxaUEdGczREOUZDdEdaM25MaWxHbUExZHc1NnNqbUxMWHk4ZStnVWpB?=
 =?utf-8?Q?rYc99/1oqRnL/bJkmrupw3X22?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00074b5e-ba2b-4406-fcfa-08daf3524d6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 21:33:23.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfXRGcRJshe3rsw/j57jpLN1NDar1y+OwLxaxNC2amumXiXAkzzjKMwLuDWImbFTMQO9Hb7FEyfTDUhI3o9D8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968

On 1/10/23 14:37, James Bottomley wrote:
> I also think there's a typo in 8.1: in the first table RCX appears
> twice even though the text beneath implies that the second RCX should
> actually be RDX.

Yup, will fix.

Thanks,
Tom

> 
> James
> 
