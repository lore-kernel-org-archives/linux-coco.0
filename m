Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6153A2908
	for <linux-coco@lists.linux.dev>; Tue, 10 Jan 2023 21:03:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJg7EDDwVjReZjBDcW17xcxcWMxTAOjbElCX8f0k8ft6G6qv/x8fahIPFu4jGfSUoH48p42GwJoqx3GEBA/gMqiUYY/GnN5AbMF2Xt41MvRF4tT2El4LoyujKnHpA5oSiU9qUt2/bPWU3LDUzJgV/kcNTNY1Z2fSP1Mz5jrXdAJdOXeRgYA0lkL7jGTqGrAh5WKbRXdqxyfvfhCRMjX4u2OuXuc2AEWJcj8MGHVaXmCgG3tEtuqd7yuwTvcijrwFmZ4xSk5wib/hHVjrFnp4nsrRR31GV1bLsQyhH3ckBBZHx1YVVG419zVgBtwXnTawQcBQUgQRRVVhVPAC1gJIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaBKByxoTZZo0Ci9WvtoyJrJ5z//FpTEAT15155nlE0=;
 b=IzNtI5aV4OKYctiobCkUyF1nzZ1NJqq31Qa/2lUenUrz7zatwe1MWzu9+5lW7a6k41Mt1P7BC3AgnrBz3h7EwH9ZaB660tjPRbO17VrODuMvX7teSQaGIDCoy3ceMxse9k2Ra3Wz2rbDpXez35B1U/lopeaECVbIEJcwGZg8R/l5rTROmfJiNdOn7eYeUcDJafM5HohyibElSWS0HiGsCGPHaeKo6JveuR4SVZAiHc3i6MQqbLtQt35cXeDGwpJFPqnqkgMErvpwQGX4FcqInSztMaOINHZBYFvXJItu0m7k+sxR429brwBsYrPTjTi04jATUiEjLhp5SmEfagn/eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaBKByxoTZZo0Ci9WvtoyJrJ5z//FpTEAT15155nlE0=;
 b=twgO2IWTLcWTG2M9cB+9EjTT3nhMcMNWouYrnpThv0sw1YUTcCiL7g/rlVrO+06Bs4YDRBS9y7c0jj2xJn/E+KQwln5f0gmDsUuL3Vsk0In3r6BGuTwz7WmcBFY47mBKtzU++GaaInn1h03o4In4It/4a/vZW4NlBA1am0OJ+mY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 21:03:04 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 21:03:04 +0000
Message-ID: <804079b5-c090-af4b-ecca-839ab8bea0f7@amd.com>
Date: Tue, 10 Jan 2023 15:03:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAAH4kHa_DN2e4DreB_PfUEsu7KrB64=m5=-HnH+WpnmecoRz3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::16) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 6452df87-b332-48d1-a15d-08daf34e10c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TXvHY4qUgv3lcC4QV+bRxGVU21yKFBlms7HsG5DEhWTNGvETrcspZYfQL2qGQfXKPrjfflao97Jo222VN+vIYQDW2QlR0pwfdedBABG4bmemupjJdQqDLbBdRukTzgVIFCtN6kYfLVR7btxa+HtZB8xX9q3kgJbC7HR+K5bw87gUSDXzLe4sUYYi9tYtdic4YjnNayS8+QuUdcJGZJxyGwuH470WTWEfzDUSNYynnNujeaMTDt+KeTVLhytsmqH+le9T/gWR9a1CuedcwHdIsaXMSFWKmDxOGn4039SP5BbVsXnAIgZeO0ZPX0JV4oulBiQzsN1SDtwKgnm5AM3fJwueIiky5o31fJpbJWEeEfMHirjeFrWSGMlTRi7wNoaOjmKpSqcSoqzHZN/vqAriN9ELmWZGLX+gQHMh5sg35nUWmM7TqF2GZmr/TosmBTfdaTr/PHveiGw+C6u4X9XcXvKmF447dE1BZstm2K0FtoEuhaQGPe/8Uj5nB6oXfGpWKbR9pRG60Mqz5Q7VswsEU8X1UQ3yIOlwc1VdzopUBTw8tpl3rJ7qsxCpraZPb3jTD6nPgEKSlBInz45gN8+mBibomn1APDoDszuJaQmIGpWKy3G0bNOv24Vn8JYOGTD27VkE0MgciNndFByflkZ5+I2WjU3KEB9joYCM7IlEl/dAOkrB4T4TY4sewm04pWuZ1QxYElT97c/Bbw1bM0am6RblSW6IdJijrhY7RuChYbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(53546011)(2906002)(6506007)(478600001)(186003)(26005)(6512007)(31686004)(6486002)(83380400001)(2616005)(4326008)(54906003)(66556008)(66476007)(66946007)(6916009)(36756003)(8676002)(316002)(41300700001)(5660300002)(38100700002)(8936002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z24vaHJGdGE0ZTJiNkVBS3BQbVp1UWsyMTgza2dlZVlVMG04MmpvNUJOY1lY?=
 =?utf-8?B?Zm1QRy9JV2JRcWF4ZkhibGh6ajRIU0IyWVBwZmQwQTh0ZzM0RisrYzdRQmFu?=
 =?utf-8?B?SkVvd015cERHZXI3VHlPRWNTOWZxRzcvb0ZyV1hLWE1yWjVPTkw0WmZtZFk3?=
 =?utf-8?B?VjMwaDhRTXVxZjJEamxvUkIxWW05dGJrVk1LUFF6YXFtcTQraFd1UUhtdjI4?=
 =?utf-8?B?eU9BWVB4OWlVemtUR1dWOHlab2pmUXk2NXZRMjBya3FXc0x5QlNkZDlXUlRh?=
 =?utf-8?B?TGpvNkVrMnovblRoMEpRVTZiZ0I1RVBxTUpVVXhyVEt5N2h2TkhsTGp6UFFO?=
 =?utf-8?B?Sy8rOFVSSzU3WE1QeU0vMXZOSXl2VXpRQ2dPa0NhQ216VC9YdnVqWHRGUUx2?=
 =?utf-8?B?cWp3MFZ0ZzFGMmxjTTRrdjFDT09mVUhDNXV5QnRjZmRnNHUvQ1JPOE1oZ3FS?=
 =?utf-8?B?R0V3M2Y1M2ZJbnRYaHJjK1gzUVRDNCtnbjRma3RxYkpkc1hrTlBwV0g1YmtS?=
 =?utf-8?B?dWFDM3lrR3dkbVpHc3ovcXQ0QjJTOEZUSjZ1Y3pod2ZpOVdudGVickhWcG9m?=
 =?utf-8?B?bG8wdC93R2xIbzU4THJRTlVrbytKRmhWc1BFQmg3ZWlOUThrWkM4SDdldWJt?=
 =?utf-8?B?RVNMc2tXeUM4UDJNNjk4WEZLNmgwZGVUWGd4bTFVdmhmMXVNcEt3aWc4S1lx?=
 =?utf-8?B?YkxITWprYVVkYnRNQ1BES3JwVmtoSXd0LzRabmpSS1o3RElhM3hJVTFuMUdC?=
 =?utf-8?B?azNNOGpOK2svMXpLSlI1ZDY4aUppTTRlY1RtaEs5ODJZZVNwZUxKenBJTkFq?=
 =?utf-8?B?NldnbExDdm9QSmc5TmVIN3dTOVdKa3EyMnNPSk91U2dyTXJwNGNUNFlBTVdy?=
 =?utf-8?B?TTNFcnB1ZVNwdFBPVHlyMVpNQlkxQkhMWUJ4QjBwK2VKelhoT2c0dDdDbUU2?=
 =?utf-8?B?NTg1enRMZTlNMmtyYUsxZ3NMNXpTQnB0c1pOcUxlMzcyd1Z0a3F3R3dwclNQ?=
 =?utf-8?B?R0ZjL2M0TnlraWVEMmEzR01yOGVWOUNheS9GM3FLVmZCaE9zdGVBU2JVNUto?=
 =?utf-8?B?TG9lWGcyam5aZXMxRVZjTm5QQjdENXg5QnJlOWVoS1dwRjdFaFlMbHJJYkVY?=
 =?utf-8?B?QUhLWFQ2dVlPNXJPdjVaRGI0U1U3NTJObERoR3RmSjg5eUhOemxNL0xZRDZR?=
 =?utf-8?B?R3IyRGZZMmlFQVZtb1dyM2NDSS8wWlNSelBRTjluazk4clByM1V1RE0xRjRk?=
 =?utf-8?B?cUxueGV4NXY0T0lBZVFDV1cwbXpkaVBSc0hDZ3EzNHRXMU5RSlBBdVBUQkI0?=
 =?utf-8?B?RDh5aDNqOGErbDJzaEJ5MHFXVVh3R2N1aEhjSDNUTXZsQUx4Wlg3akdlOVl0?=
 =?utf-8?B?dEJKZVEyeFBLWGh4SGlIVzRxeEhtcVFrRDVUaDNBWTFjakZ3TUtseGY2RFJM?=
 =?utf-8?B?eHRUTGVaSEFkUXhwWWlCV0oxTnJnLytKdTV4QWE2ak9hZHYzTDV2ZDVTRFpZ?=
 =?utf-8?B?Wm93U1cza0NETDREcEtIOUc1L2RPSHIvNlM0RFhGRXJKRVNqeXhIYm9YSnpB?=
 =?utf-8?B?T0Q3T0JCYnpSRjBMaDlWWGFtNWVMRnhhWkNUY2paVUhpS000cVJKa1hUYVRU?=
 =?utf-8?B?Rkx0M05iZ3F4NkJXV3h3MndIYURHbkw5cG8rbkhSWUpLRnZqejNZcWxCYU1y?=
 =?utf-8?B?bmM3MERrZDlyVXdTQ3JvNG1Ld1JsdnRSZk1OL2VSak5CR29xU2RkVjdzSzNE?=
 =?utf-8?B?ZURURWdxVFY2U1hFM0tOTDNYeGFkb25KWHNPcDBPOEE2NVpxeVQrUEJoR3Zy?=
 =?utf-8?B?WjVLTHRrMDk0M0xiajg4dDBKZjN5RXFiYXltd0Jmc3pIT0RlakFiWGh1ank1?=
 =?utf-8?B?UEpoaThXeGd4RzNDVmdoL0oyMHBhdU0yalRaVTN1QU1YN29FMzVJMmhtTWlt?=
 =?utf-8?B?cklTeVRsY3VCUmFEVDF3bW1oYXpFMTZ5ODloeTRmMTJocUpkeFY4alA5M1Bj?=
 =?utf-8?B?OHVoNjQwUTdyVU1CaGM2WUM2Sm14ZlFZd1dIRFlmZlc2M2YvRkh6ZEthMCs4?=
 =?utf-8?B?WHpJeDB1dGpoU1krNUF3NXA0MnMxTm9rU0xFMlBvbWp3aStkYytiTkJzZGdY?=
 =?utf-8?Q?dZs1TxOr5Nz7fCqw7ROncx31Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6452df87-b332-48d1-a15d-08daf34e10c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 21:03:04.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJwqI6iKZQcIJyMjmBP7sbK6U37RCo+mQPdK+ZUSg1LFQvycKFisOiheq9skQoodxwG6S6CR1R+ITUYJovAB0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

On 1/10/23 13:40, Dionna Amalie Glaze wrote:
> typo: "oridnal"

Will fix.

> 
> For the statement "Locality usage for the vTPM is not currently
> defined." should this be interpreted as version 1 of the vTPM protocol
> will not support locality, or simply that version 1 might have the
> affordance to add behavior for non-zero locality in a future revision
> of version 1, such that the result is not specified as
> SVSM_ERR_INVALID_PARAMETER? I think the latter is probably a dangerous
> interpretation unless v0.60 of this document is strictly considered
> "unstable" and shouldn't be used upstream, so I'd recommend clarifying
> that "currently" in a document that might later be outdated should be
> precise about its specified behavior in a versioned fashion.

Version 1 of the vTPM protocol will not support locality, so I'll remove 
the "currently." If locality is to be supported, it would be in a post 
version 1 of the vTPM protocol and will likely require invoking a new call 
id (unless we somehow manage to figure out locality before v1.0 of the 
SVSM specification).

v0.60 of the SVSM specification is not to be used upstream. Once v1.0 is 
reached, then it can be considered stable for usage upstream.

Thanks for the feedback.

Tom

> 
> On Tue, Jan 10, 2023 at 10:54 AM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> Attached is an updated draft version of the SVSM specification with added
>> support for an attestation protocol and a vTPM protocol as well as other
>> miscellaneous changes (all identified by change bar). Please take a look
>> and reply with any feedback you may have.
>>
>> Thanks,
>> Tom
> 
> 
> 
