Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4C56109
	for <linux-coco@lists.linux.dev>; Wed, 15 Feb 2023 14:57:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+QdGErgqrrsHwQZsx6I6WpkGhb5QsLS8FConybCfZD0bf3dFavhdXH2aUzlXDTsUjdhCCkUJIR4mEdEMY1i02QnhRwXISXO9ErA5zPLi7U8SY5PLIpNC1igYep9byo66qOt9XB9bXCbMNYDnF+udyFYUxphSKuYOwXLZBLHATG/+UVRfv2U32+6dw+5RQi4kKQ/JbTprdDsv9y9KIDAbPZj0MlzHvC/ttA2uHxr0YSGQv6B9KIemH1a7hxYemUHN/yC6c5tIK12AKvjUZSPdAmvoWb8buPeAhiWbOlq0OJO2+oDzRJ1rRkVwGdlv36k5axgq4t1vt9Im+wTHQayPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NizXpAuX8Bzhryem3xecsxLWKPuLZ+7+CSLcc7ooHd4=;
 b=X1ZdaaaxqLTRh/uAmwII4NDzIbVVT15ZfXKtvQw2oxFcMzvTX46YZkaEfc2zDIZUbY6ZL5nn772QWYHu+AbKcgs5U+4VxM/suD/q8jnwhISuUx6C2ZL2aIvWKoFgRPx1lmo5ldEOL6+rP2iW3YJ4VaFN2Yk7MQ1LN1WtrZ7Farq3pFhU3QX0O/Li1TxvzynapEDHN/3NH8lcqTvPG5hFFrPGVFtgYJg0cBHDc1f1dm7ACEnWl7WZw5Pz99ci9V5d/x2Wx3InjBsnWU0fGWiujEh6IMgol3Ssi1JTR/NkoJ7n9V6b6GWB5cnqDpJxvwHbr6lJ45Nj8qW+xJaH3Ou/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NizXpAuX8Bzhryem3xecsxLWKPuLZ+7+CSLcc7ooHd4=;
 b=c/B7DFhUmGQGVNuWHiZovArlCsTSboyTVRhvHYFfYYT85w/Bdj/VmRTaKDyb9mO8jVs3dm59Y7zLLUrIBsOC6PDq3/NHgnSTrXn7/jme27Ur+oepKPv6OOOWKYLNeoRi7vguSktlpQ1ywkeyEUOXlZJlwcc9dtSvr8hUL18Nrak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by IA1PR12MB8556.namprd12.prod.outlook.com (2603:10b6:208:452::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 14:57:37 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 14:57:36 +0000
Message-ID: <3d8fb632-22ac-4801-7dac-ecef14509965@amd.com>
Date: Wed, 15 Feb 2023 08:57:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
From: Tom Lendacky <thomas.lendacky@amd.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
Content-Language: en-US
In-Reply-To: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:610:e6::15) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|IA1PR12MB8556:EE_
X-MS-Office365-Filtering-Correlation-Id: e4635b42-748f-48b0-d31a-08db0f64f9d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NONuC+/uWh30JpVOld9SpESoh6QlqSrIwolHrcBqMDNUeH7sbpwQtKGwYVuOcsruIDbWMHyXbEnqIEzQ9DXa2V8w1ErjvOT5ws8idEwntKlqLWnMq3STOpar5NV/Fw2wd4UzlLtox1PhcE9W+nxMOLc2QukPLvDYnOq7y272aC4N8o92EJCVsVw8PPjKMmaEbXKp+q4pYfUBdNjTdJDIu1gj31yoQJ5foN0O5b+V2K5z14piSBDxRsV4/Ds2/fstFjdTWdBfP8lafCBdtzYoYSJe9RdXzlqwWQFiUXWkR2e7/qDq8zVs6JCUZJft/bLXb0+xEDxAXcxun7igOUwWJiFUxaBimH7JgV/hLbvcABwERqpt2ZN1hS9CUFf0cgcYdOTG3F5l2aJBXdvknQKSAFoGbj/974XoFUbdLMSKu0e1m8fE2cyiY9nx68aqC7SyUsCuSfhXHdLVS+ddEmEok3GD7N3k4+hmFCez1wJHdYn53XREYQuejpE15AxFjLJJWxX2mCa+A2LVw6iDWhIcCuVbP6dlazsMGI8yCoMMBVT4TX18JdDK8tYm6A96Nv7TWtdYYFhg+NQNBy/Wey1NQAx8tRAc7jUGLTfpqw0rS0rjNehxgXqYx2q+ra5MBeLo4yNItZ4ojzfc9joZ+vglSKSq6hulx4QBcvIce8D+4l+a3/Xpvk+goi8S3Gcd3MuXpzuGzWzIyuYxx+RzALXRyS/jAbUJ2Ee8FfMrBIy/aJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(2616005)(83380400001)(6486002)(478600001)(186003)(26005)(53546011)(6506007)(6512007)(31696002)(36756003)(86362001)(38100700002)(41300700001)(8936002)(4744005)(5660300002)(316002)(66476007)(66556008)(66946007)(2906002)(110136005)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGIzT2hTcHQ2bFV3UFBQNmdTWThacm95Mkp2emJJeHhpY2VkdEVKREpuOFI3?=
 =?utf-8?B?VXFSNnhrSXpjNEw5bk5sK1dpanFDcklQOE5pQkJZblhrd3FoSTdpV0RJdnBY?=
 =?utf-8?B?SkdydzIyeitLZ04waVcyZGg3ZlBjYk9rTmFZUlZYbkdoNXJtSGZZUjcyZ2xS?=
 =?utf-8?B?am4rM0tHbzhzbEN6YUNKSmZ4MTFzZzZzSnNXeXMxbkdPZFRJQnAyTzhDd1ky?=
 =?utf-8?B?KzFhRlc5ZVlmOVFiMWFwZTB5VTlrUVZKQ045elo4RXJQbVBEMU9tSzRCNWJQ?=
 =?utf-8?B?cDc5eENpRnFML1RWUWxNVUhnSzlucEUwN0FWVzZzRGpkajY0a3NYam9XcVdz?=
 =?utf-8?B?VDRsQzVRdmo4V3JxeHdkWDF0VnhLYmNJQjUwbGhRNGx2WGdMN0l4bXVtMEVo?=
 =?utf-8?B?OElGM0NlMjhwMWxzV0hzVjYvZkwzMXRlK0FZUVpkMFhuOXZXMm5nYlBjQmFB?=
 =?utf-8?B?NkFKZGs5aWJSbWJPMjV2Q3JxTnFQWDFHNXdzRnhGdWE4R0pxbE56UlptLzFO?=
 =?utf-8?B?b2pRUWtzejZxLzQwZDVDQjJ6TndXWlNsVVZldDZzVitkdHRCME9yeVNiOVUz?=
 =?utf-8?B?ZU9RMHRDNWZsL1gxR084MlRwS0FJSnQ3MEc1V2xvZ1R2OVovbUM1YXZxUWk1?=
 =?utf-8?B?OVA4WmJENEVrVldFaUg3REJVTHpZZC9yYnYyVHJnQlhMa1JSS2l2dHl6S0x1?=
 =?utf-8?B?RGY0ZW5XS2hXdjFNektQYzBCOHB3Y2tIM1FtVEw4SngwaUZ1dmhybnFiTnlF?=
 =?utf-8?B?OVFoZzRYR2llYytEK2pGOFFZaEI4UG9OaXlad3NBZTdRRnN6UGhkZWxheXp1?=
 =?utf-8?B?WWdNN0RSMGUvdXZPT1hrczJyaVgzTXFPcHVxdVlRclF1MlZDZ3pGQmdOOEQ3?=
 =?utf-8?B?aDViUHkyYXh6cGNOM0YzQ1dTNmJ1ZVJuaG1tbTFiZ3EwSGxNVmowelUxUTRN?=
 =?utf-8?B?aEZPOGRobHF2djJSQmhQaUpOeG1GTHRTVFNxMmdyak9CcVhtMHhXM04vNFRE?=
 =?utf-8?B?bC9nOHZWV01mNG9pRjZrc0w1ZXBYaDl3ZjRZNjFOQ3Frc21ONWFNOUZIcVJq?=
 =?utf-8?B?M3dnZkc4TEFrV2wreHl0Q3ZoT29yRHcvM1o4VVUzTU8xSGFVeXNhV0dLNEdZ?=
 =?utf-8?B?OUVmZnJrR2ZST2djeVBEeVFSUDI3TVhsak0rT1JjRkdoYUpIbFVhdnlZakwr?=
 =?utf-8?B?NHVyRzk5VHdSaGpXZmh6dFFKRjR3K0JKR2pVUmZ4dTAySXEvUXJjUkNEWW1h?=
 =?utf-8?B?eGtFSnZpZ1BXZmZaLzF6NmlhOWVxRzdPNlR6NG05RXZRYWxWRWxlajdkZm9G?=
 =?utf-8?B?bUxTSExLaU5jaGNvVHhxc1ZsaEt5UXgvSS8zMmFmU0pMbk41UVlqN0gxMlpJ?=
 =?utf-8?B?MU90YSs3QTlLODJWTlFodGYvMEJjSzhIVFNPVzdoaHBsbmFjU3BUb3pKV0Zo?=
 =?utf-8?B?M0ZzNUR0UVUvYWQzQndQbWFPb1RtaTZiUjA2T2hmQlZpQ2ZWQlpUdVpBb2d3?=
 =?utf-8?B?ZFZabnZsQWtzdDI0MngwVkpISi91RWs2LzcrSXcvQjBzVHdJZ1ZMOEhjMi9I?=
 =?utf-8?B?QmpSOElFNlBnamtRNDEyUkF3ZWh1NEhGbWlQM0xuZkxDNzlMTHB3NVBscHE3?=
 =?utf-8?B?cUFPUDdDZm9YdWxiQlA5SWJBckI5RVBHT3daVW9NYlBIN21Yb283RDEzL29x?=
 =?utf-8?B?STZIQjlYVGlIa29OZGJTcmNxOVptdEJlYXBMZnhuV3Y2NisvUG4wQWtHVjNm?=
 =?utf-8?B?bnpaZXVnYjJrcHEzWmdkRVdzdFAxalFuVHVrRFMvTXRoTU9wWUVXRlFPNm9N?=
 =?utf-8?B?MXRaWFpIY2tCaWY0TEc1Ym00eFRwNXV2MWxBaE1oVGFyUzNPNjBJdDdPVEJL?=
 =?utf-8?B?VHlHWVB6Qks5Q0hxcFB5ZTk3WUNCd3FockRVeHZ3b1Y5a0lUcjBSdEhGd0E3?=
 =?utf-8?B?cFRGVnkrKzhxcDJGVFM3OTlaNFVwNHFRWERXWDhzYlgzSzNlVit2K01Zbldp?=
 =?utf-8?B?aGYxcSs0c21sR1I3M2R2UW80K28zTVlXcWxhbjJGRWVBR0FjdjZWQXdmaE9J?=
 =?utf-8?B?eVR2TjJkTzZ2U0FYeFo2ZUhTUWhDelVOdHF3VmswQmJLbk9YL0hUdmdLeGVq?=
 =?utf-8?Q?wYl+m8F7U83Q8izJPhQ036jvS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4635b42-748f-48b0-d31a-08db0f64f9d3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 14:57:36.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fmng9O/HRngXFs2c5qHBoTOZ0rvMyRF2iyaQu3yj+bYkbkEFcD/HcW+OnLUH88RicV6nk2HIs4M6A3yYvhhg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8556

On 2/8/23 15:55, Tom Lendacky wrote:
> Attached is an updated draft version of the SVSM specification with 
> feedback incorporated from the previous review. Please take a look and 
> reply with any feedback you may have.

There's a typo in the new version of the spec under the 
SVSM_CORE_CREATE_VCPU call. The bullet:

   If VMSA.EFER.SVME == 1, the call will return SVSM_ERR_INVALID_PARAMETER

should read:

   If VMSA.EFER.SVME != 1, the call will return SVSM_ERR_INVALID_PARAMETER

Thanks for spotting that Joerg!

Tom

> 
> Thanks,
> Tom
