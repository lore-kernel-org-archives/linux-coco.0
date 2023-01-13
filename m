Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7952F2A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 16:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS0tnd97VZDgL58HrEL0Ww+iM2OobKvQyokhWmMad7J4c3xEYzKhnkVV+JoUR7KQAn30EYc6JizGBO38E9Z/uzmm2hDtv2pRVJpkzqeaDH1MB8TOL5joR/At03q0j5QYW1iIM5S2+NzJjRaoLkj+DxQCddUiQrbqDjEhP48BDpuLo6+IsSmj2mabXO5MZpPfaXGJ1ufocBdkpRVWwxnZSziL3t0H1C/e7+gMdARxcMkYIl3peFbZq5o3gD88Xk7XYEINskDZQWzJIHfvCnNLjSbB6IzlRGnzbc5yvyq8msY/ewv47GL/djWymTmL/srpUXjwfbR7dfuzvXu983Pw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G54ksPTp82XhjNKg1frpuw/q/DurBVFe2sxAU8jcFhY=;
 b=U2pJGbFT723CzFpbaqaX3UE55sifEc6zUe2ElSlkeg8sI7i3AdDqzj1kvGExg/SWh9mWZZnEarsvOPGg1F9peoPDoQJROuX58bVUxueZCmYl4X9K1Ziul+Np9XjAC8p+HrFRuJ86hI3R+5g7y13dPQUlBzqNZhn1H2y38Pgf0p2BnOlapygegmcrA7bVUcKSYD3F2t6XvJ0WkPnA0iR9nxx10A0n8ZRLWnGUAszh7MWozonlYnOE3RaD0N0scYmdtKdwtuVYl2jt924IuBkrCQR5AnWq2I6sx73nVrzsAZFQrbVEkDOedtphgNQo76AY3ZH8Xh4cDxfwwmwzMov1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G54ksPTp82XhjNKg1frpuw/q/DurBVFe2sxAU8jcFhY=;
 b=Pr/69Y2zFKzC7DLWrIyQkmKE/B/ncj/OXqm6kUGowiYyw9ddJW3LmH3vw88RJIVg4tTF4Oh+K6zZeisrB4nL09WQGUxMO1qHh/o0if8eyulYgGCPERUBnY69NL2IPcbZzOo/o93xJvbby7r4yUrOVp3F8dmc/fZ4C+hTfaxMoBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 16:12:16 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 16:12:16 +0000
Message-ID: <34588304-97f4-7124-9961-4eb0e396fc06@amd.com>
Date: Fri, 13 Jan 2023 10:12:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 Christophe de Dinechin <dinechin@redhat.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <m2tu0wrjv0.fsf@redhat.com>
 <777e87d6c77b2c6287040242f1f2759266778eff.camel@HansenPartnership.com>
 <6705338d-2fb7-4f6d-6a5b-2a860e894a20@amd.com>
 <028752ebb328e3e9e4ce2a61b04d598f547e894e.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <028752ebb328e3e9e4ce2a61b04d598f547e894e.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:805:ca::24) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b5a534-edc7-4722-cb77-08daf580f07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+uvMcHhnC3wgVPsnpCTFnPc49IZdx52bJEQ5i45rWYY12rOVLlAHt44KGcRDvZbl5pOVn68tg6xPSiDHfnH5v4HnSFC6BVVSXheOdUagzw0Ld2wMf0RecnNULquim1RuBpvjSt/Ybkx3NLBFbU9lhvFl3knRlUcfI9PCfnxfy75z07ambG2HyfYvgyYZUJTddD6I95KsuUqNHaGj3cD/DPkZQG4bSU2AR0FetUrKapiwwmABmh/luAfmsB1WmhdBdTczVcjYBwKd9WaBvCl7L59sKMBdRdX6KNy/TlQuHYkJtiJWWcG7jTrx1VXQEXstTbR0HFH96iP4TI5ONZDGexiD8/LgpazjKBUFXFtVbbLggxtkH071LtgrNWYzwll63I/ctexleJpMeNAwE09byqpcfhHjC/eIfd6Ub0HI48lQtTBKocVex96gA1UMSd9ZKlH5HW57N+PvBa7u0TqdUy+8kz9LjlR7GtlvLIXE+v2rXNeWotwVbGNQtagywXi4cBgCHumHgcTb0klKjCN2ANOGkMOccMNxqqi/dlw2yr5QudWgR1WFg2t16Iia9ZwD7wRnGAXyuaw9QSUiFI4n5ysfFDZzG8WPR64VoUdcmmBrU3lwFlSkqJXJCWOhvJqyao4CoDYiJxPycf1GK79zJaxK3m+xTTu/ClgaP3ai+9maBazAoM7GtQMY2a09qB3JFGvB7QAWzD9Xezvf9VKVeXF6QvV9C0WLQv8fqK/7w3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199015)(38100700002)(8936002)(31686004)(5660300002)(6486002)(41300700001)(478600001)(8676002)(316002)(83380400001)(66556008)(66946007)(66476007)(36756003)(4326008)(86362001)(54906003)(2906002)(2616005)(6506007)(6512007)(26005)(186003)(53546011)(31696002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0lRTHYvanZ1MTl1enI0ZXRQSk1yazNtd0U3YnVWbVFjQkVSUTZqQU90NWc4?=
 =?utf-8?B?VTVaT2FJK1RCWXJyRGk0OTY5aTlQUGxXLzdCWkRVQmtNYnRoVGJiSzJRV3kw?=
 =?utf-8?B?NXVyYzdFSlB4WnFGNytLaVhNT1VmS3J4cVMyeXlBUzRrQ3FmcXVnU09DWnpI?=
 =?utf-8?B?N3U5a1RtNjVZUkJGaXlzOGJrRlFBUit3UmI4VlNTRndNWW1iQk1yaEx3YWFt?=
 =?utf-8?B?M2RXS3ZubHZUL3V5L2I5N2NIQjlKNUpuT2ZyMDIzVEl5QllzUHZFSk5KbkRT?=
 =?utf-8?B?Q2FhcDZDeXdZL0ZPaGJwTXdZR2FzQUJvZzh6MVBOTW9hWUpSQjNtMTFmL1Vy?=
 =?utf-8?B?cHBlZHF2NUZIVUNrcDlLVUVJMlcvYWR3WVZ2NDJlbThtSFBrTzZWblBpdjBM?=
 =?utf-8?B?d21ieW15STVSYkNmSmFEL1NLSzdyMytFNU50ZTBWeU94NDRCWXhjWU9RY2R3?=
 =?utf-8?B?NU1yRS9QU20rR2tHUGUwSThzd1RXUitGSDA4c1V3WS9GRHZ3KzhEL20wRHI2?=
 =?utf-8?B?NmdXUDA5Znp5dHB5V0NBd1planVINExFaVYwOWRCeER0WUJDSW1lLzFtQWVH?=
 =?utf-8?B?RkFBeEF1UVVFNy9OOWZjK1M3RDZnZlk2RUpKaWF2TjU2Q0QwWGZhOXhOTURF?=
 =?utf-8?B?NkU4VHh4c2lDZVlYNDNkWDlEYkFEWEZ6UU1COW9NYk81czU3OFNGdnRFSEFC?=
 =?utf-8?B?YUV3a1RFNXVoWXhITXlsTGFJTHB2K1ZqMjJEc0VPQ2luVEtYMHozZVE5THdu?=
 =?utf-8?B?Um5HUDZ5V2lwV1ptc3V5MlY3VVlDRExvalhwTDFiL0pMWUZpM2V1Q0pzZFY4?=
 =?utf-8?B?WHViZkJRWEc2eW82SVJyWFJoZ2VzanhTTFZhZ2g1ek1pS0J3YnRGRmJpMXJF?=
 =?utf-8?B?OW9vaENtd1dVWFB6Ui93SnVvYWZUeEowdjFlcWZ6dUNYTmpiMEJ5Z28wUWs2?=
 =?utf-8?B?d2xlTUJkOTdIbm9XVUFKTGc5UVZKSFNzY3RrVWl4TnlKQmR5WUd6TmkrblZq?=
 =?utf-8?B?WEFwbkhsNjJOQ1F4SzgrVExLUm14a1Y5VGdHT0lYRmU1YjFJd0NYbkJJTjBE?=
 =?utf-8?B?OWtyTWpndExMSTFLOHRQb3pBYWlkbnRRQXF2MUtLM3kzZHNhY0ZVdVlYNFRv?=
 =?utf-8?B?NGRPS2NKMFV6azdtSzJ4OEFkMENGR3E3RlhDS1FhcTN3NVNYQnlXczRuS0ZH?=
 =?utf-8?B?RVBLWjB6V2tLVkozcmlmTTFibytTbXZnZFFZVFhxUEY4TlBNdFVnSEVwa2t1?=
 =?utf-8?B?NFcwNDkwNUVKWmRUc01Xb1Erdm8rWG00M29VNzVKSTRiOEFtQjgrN1JHNUZR?=
 =?utf-8?B?VkpQNEJiTmcza2lxSlhuSjh5YW13T0llRXJzVHBqclhmUlAwL1ZlQVhya0Jj?=
 =?utf-8?B?dHZNRTdjZ3graVZnY1Bxb3M4VWxLNVZJOXJxMU4vT3dtcDd5RkpQNW84MEow?=
 =?utf-8?B?a2JnaEJXYzlxR2Z2V2hQaXZweEJSZnI1bDIrZ0ZnY0YwQnBBT0kzWmQzWHZZ?=
 =?utf-8?B?SjRjakVtN3lWR2xnbjR6TzlaaStzSTFNZitFZnk2RzIveVNvSVEvWTBJNVdq?=
 =?utf-8?B?RlBQYkp2eWVHVzRFUjVLWEZVT1A0RnlTd3JWZ24ycEdnWTBIUmFNVExRY05n?=
 =?utf-8?B?d05VMHhoaE42eDMxUTNzTGRtb1FGdTlsVms5ZFo5dFFsSzd3TW1ER01YMnZt?=
 =?utf-8?B?MkFBTFErUEFjek1PSDFacE4rU3pyRFNWT2xpQ3VGZi9HeUMvVEJrS2ZmU280?=
 =?utf-8?B?cGozMndoRXIvZVNVZi94U0szVHA0cUNRSnFCeTdUMEhQUTFwMlpzazdpeFdH?=
 =?utf-8?B?TTREODNwMU5pVFlJOHEzTVpNVUhSb3Z6bXp6V0V3MzVSTEhHSytsdmtVUFlQ?=
 =?utf-8?B?U0hocThTNndYSTlKdG5udVA3TUlMb1VXWVcwUWhjSENiWnFvdkFwT1BpU252?=
 =?utf-8?B?V0kxUldlZkh2R0RkZkZxVTJpTlVaR2R2QzFEb3hMUGtUcklqbE8xR1Q5N0NB?=
 =?utf-8?B?RjZQRDVRTHRmRW9CM3ZRNGZZa29Ubk1iS3d0ODFQSU5TamlzSEJjZ1lmSlZO?=
 =?utf-8?B?OVdKaUwrK2ZZN3RMc0Fna0NhRC82d2oyQ0JrWTlFdVRGTHVUY1k3cXBtbk5O?=
 =?utf-8?Q?zc9MVn9ihFzIVdaDd+r6cIDaO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b5a534-edc7-4722-cb77-08daf580f07d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:12:16.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZflYxt7sMSP/BXmPz2k8y7VZ+p+6BwmGQo/5stJ3q+6NhnByWM+Qnu442dvRpSF7uI0XAhwDBxGxN6xFh9UMHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886

On 1/12/23 09:24, James Bottomley wrote:
> On Thu, 2023-01-12 at 09:13 -0600, Tom Lendacky wrote:
>> On 1/12/23 07:57, James Bottomley wrote:
>>> On Wed, 2023-01-11 at 17:39 +0100, Christophe de Dinechin wrote:
>>> [...]
>>>> p29: Table 14: How can RAX be used as command ordinal and command
>>>> response size if it's already used for call identifier / result
>>>> value?
>>>
>>> I think there's a bug on the first table: in the prototype we use
>>> RAX [in] (not RCX [in]) for the pointer to the request/response
>>> buffer and RAX [out] as the SVSM return code.
>>
>> No, it's not a bug. You'll need to use RCX as the pointer to the
>> request/response buffer because RAX, per calling convention, contains
>> the protocol id and call id.
> 
> Oh, right, I should have looked at the code first before commenting we
> do indeed use RCX for the shared buffer.
> 
> Do you have a timetable for updating the linux-svsm github for the new
> protocol based calling convention?  We'd like to rebase the new vTPM
> code off it when it's available.

It would mean adding support for at least the attestation protocol and 
encryption support to perform that call. I don't have a timetable at the 
moment.

Thanks,
Tom

> 
> James
> 
