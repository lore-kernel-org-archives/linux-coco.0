Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C3A622
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 00:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="28033qoM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SICXXGmjDfXuf2eVmdCyiTAyPi702Rs1iNrFWy0dv3SpqmQoTDY/MH5QTvlFKr3trP7FnJARbWnwo6mrOf85cmnxWIwMeIoAA31J0iv3TkGkNOhEGpWDK4H+3s1xVT/JwxBzEBcS6gLIi+5HHXTRh2iszl1mo176p/r5zPnl7qhddyCxhdWV52O+O2mcrSKmskRTayOSNlv7SwtkgtyFVaZlgkLs3C9E8TyHdtdu0NXCSfxwQjAVREOSRDQ+my+1aLV6N1/wb4/2Fwf9fin6LLhRWk4MYyp9EyjgmU66x0ZzzDMfaYAZ0SPp6Ny5/Qa/8McI/ZByjPHoIKSm3dymeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuVvu22A63fjgRXSltvWR3s2K3WHuqRoNlNHe39NddM=;
 b=W41ceoyzY3nzHieLUuYplDcjeSbYAdbEBBobNbxCnjnexg5B6/qoH7dA4wQMH9a+i8+Syltn4LKvDjQRSZXUbc7DSxVwb0pYIn2hpTvkPu1ChV9zr6lv8wljI9jowp5QwnF+qlSfTrECgpwjaFX9MIXVkIv/3Xg6jHIv2cUnpvm29fueqWbaVrrMuaDz2IfYCcUxnpNUiJI+9D3R1zjytIkN9Cfx1RsqQUU4TceSvKMcOxnO7M2bo+jGVqbnJDp2sOUB42cpFvV0GTQfeqQBv1CUSV45GN0R9Lf/J0ywSodPaZwjOzox0TGh+EkAc+fOXtcgVkWqSrEu5UQHCUH9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuVvu22A63fjgRXSltvWR3s2K3WHuqRoNlNHe39NddM=;
 b=28033qoMffBLToZzMO2BxEVKAhX10zICdn2Z3rP4S8e+Ld/LHx/Azo+cFWWqhaPyxaPiJd4BZ0vF2gDgq+jHvH36RXwPj4vvG1Fqo/iCy5tjL5I8JE9cF05S2NtgNnnWobXTGdHfJ88Gyxf9GXTdAWcRx/WeWc6IQ8kE7KCHgi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SJ2PR12MB8979.namprd12.prod.outlook.com (2603:10b6:a03:548::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 00:42:56 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 00:42:56 +0000
Message-ID: <9c55ef4f-181b-4370-8444-dd0b02ba317a@amd.com>
Date: Tue, 17 Oct 2023 11:42:30 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
To: Peter Gonda <pgonda@google.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev,
 Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, dave.hansen@linux.intel.com
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
 <CAAH4kHY_R5-fCo_=n4=k+kE99EVT8m1tcOytK2MUessynE7X7w@mail.gmail.com>
 <CAMkAt6p_mTKrzzQGqzMPB9FU9Nqy9yLJ_tCqFQQ7Q_W12XCkJg@mail.gmail.com>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <CAMkAt6p_mTKrzzQGqzMPB9FU9Nqy9yLJ_tCqFQQ7Q_W12XCkJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYBPR01CA0003.ausprd01.prod.outlook.com (2603:10c6:10::15)
 To CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SJ2PR12MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4a1444-3a9b-4d8a-49ea-08dbceaa00fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gmILXtjW+LbHpueCz7QHZz9XbTO1ipo3sqkjBTb7Ud4ioUzOgvDXQqlkzTZI/Pu9izKW85oeF6MRv8YG6nZlA5OnHGyninzpL/MG2Q8NFe5qosZdSLyT9rrwfRb5tEJqwnYNkqNFPr8+26/RVrHosj2eYLDC3OOBqDuWoenpXO7jT5FnZRrSMaKB2b/tfXbbvIY0F3hh3ERdOapCATfvR4zuKpJQRrGtsO/E+ZiMX8RXluQN9/cAwrE7iyArmpNb9OffCk5UQtfC3dJyuN0NMzFjYdLIBAu2zDZfaafW5j9Lu6/GHxlga8FqrqCRdrevDZFpZtXB3j9BYjcVATXo0k0vG+S0winF+i34YaRC/QLyVZCoYzYN+8WY9W+UC98tmA6zQAKOf9U+Rz/oDDC89BVPz09mRSk4WhlDTXnNkvqXsq54ize2CX1aO+KD1o5fl81ZcdXFiFlS8+KqlMUr4mlvZQneUr0W/qYKifj4WyEpqJdBuiNIRc9wbXjIsFHIywTwugwLR6HeeZf9ntTwRoIQySNSbeHxACosDanNRTpMC14/yVV5iTEzu3i5xUFl+OjFBS6Id/ZDwr5UicuKOORYRHc5PhI+00JiYml44Q7LHWwUYfwIFQdMneftOGJtrYvzw8e8EhsEyodsjcsCIQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(316002)(66556008)(66476007)(54906003)(66946007)(26005)(110136005)(6666004)(478600001)(6506007)(6486002)(6512007)(53546011)(5660300002)(41300700001)(31696002)(2906002)(83380400001)(4326008)(8676002)(8936002)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjVZcXpQaWw5ODR5RTE5U0J0a1FQaDhqdSt3TS9uTWxVZ05yaEJTQmY1WWkw?=
 =?utf-8?B?YUF2T2RkU1R6czk0cmd1ZFNBRVJsek1sYnFWcWtXS0VPcXRlcEtEUEhCNFN6?=
 =?utf-8?B?VGFxekVoajV6NkpMNjN1cmF2NDRVNHcvSjBDWERlbmQvWERpaVk5dzR1Y3U0?=
 =?utf-8?B?QkFBbXROc0ppWDB1dU1HbHFkUlZmNS8ydmxReEpMQkRMejFXVHpMYzNTV0g4?=
 =?utf-8?B?Q3RpR0ZFNThsWlZJWUQ3WDdZNFY1VjZEenJSZDFlRnFnQmc3QWVXZmJSQ3Zm?=
 =?utf-8?B?M3V6SU1nUVhvSFVsbVNtNzFLckJudzNPYUVlelgyT2pQNTFubERtZ3l2Z3Ur?=
 =?utf-8?B?RXJJWWk5S1BFUzk0QkVqd3VHK3ZwMUszT2xYcVAxYzdSNlhkUEticzlkN2t1?=
 =?utf-8?B?eEZwSXBZSWFUUGFneU9IdEZSTStZN1dXTGRuQ0VKN3BpVnZhTWRHcFRaOUc4?=
 =?utf-8?B?U0M1ci9IVVBGVXN0TEh6T2pPdWovK2ZMblFNa1kySWprdi9HRHp0VGJzNC9T?=
 =?utf-8?B?Y1dZelpRTElWTFRGNHVoc2pNVzhzb1ptTXdHYXl5QzN6RVFKNm9peG5NTjRL?=
 =?utf-8?B?dGFlZVd4eTllMDFCWi9kNW1jc3Y1N09EWUxoQkR3RVdQMlhTbmU5N3RMU00r?=
 =?utf-8?B?VFlFbTZQK1E5cStKSlJPbUVhSUwrcnVyYm13ZVhETnBUbEFEYi8zbC9mNnBW?=
 =?utf-8?B?VzhuTFg3NHFyYzJiUDFWMkRDS3pwOHdhVHV1clJlaW96cHNmNzhyYU1QY1RP?=
 =?utf-8?B?aTZFdURyY1FGS0k4VVZ1R2krYnZMWVI3Rm12Z3BTYTJGaHZvSVZuQmlKSHd5?=
 =?utf-8?B?SmNiN25QWXVGZTJsWFlZdERhWGl6cHZhNFBPNktudFZpMTZhaDlUa1NTOTJk?=
 =?utf-8?B?SVB3R2tybmdMUUFRbWc3ZUhTZkZXQ0FHblZwK3Zoc2k4cFZ6a0w0TFJqaGJo?=
 =?utf-8?B?SWNEbE44cmJLdFc0MnFGNThzbnBBeXM1eHQ1UTdmQWRZdzBvZk5Dd2JXaGNj?=
 =?utf-8?B?c092cWFTeXhLQnlSTjIxTzluakFIaUtMb0phTVBzbzhVdnlnRXgyVzFYVURl?=
 =?utf-8?B?UEh6cW9JdlV6eHIyK3BVWXZZKzUyak50czJtanlqL3VON0dHc2pBT3hObStK?=
 =?utf-8?B?ZHM3Y0lFZTExbTVobmRnTGZTeDdYMzVJYXZlaXEyTU9OTWc5OE9uSE5qcllp?=
 =?utf-8?B?ZktjU2N0U2lPdVlja3BSMGNqNWJsY0plRmRZZ0x5cFNaVnZjMTl2cEkwVy92?=
 =?utf-8?B?bW5uNE1tQTN1Nm81SkkvMUJpM2lHU2N0T0tJdmhhdVBsaitqZTF6azMrdGJG?=
 =?utf-8?B?RkZTVEVZMEU0RUFrSjF2dGRVS3lqR290aHFXZlY1RmRpaHlDWlBvWmZaNExE?=
 =?utf-8?B?dTA3aTdSRFh3Zkx6aE1MMFl1cUtxWDVZZ0NtWHlpYmdSelRHRUg3QmxpbWU2?=
 =?utf-8?B?UjVHTEhBUjRydkd5WnJCei84RFliYWNINFZyVE5EZDBGcVNzS0VsaW5DaDBw?=
 =?utf-8?B?NXBqTHpkamtxUjBpK0puRGNGc1hsditjU2cvbHlXU2N1ZnZVemNzUnU3Y2xB?=
 =?utf-8?B?b0dDMG1WNlhtNjNTOW8xaFZNS3RGVDZwQm1IdG95c043czVsVEcvUklhUEZ2?=
 =?utf-8?B?RHY2YkkxNi9mK0g4dzVnRE1TSUh4eXRoTlJ2ckxPQ29BSGtndEFQVGZaUjBx?=
 =?utf-8?B?Mlh5YUpmVTRxSWFKQmFzNEtvbm0vd0RyZ0JscEQ2dDcrbXF0MHhFODYrOEw3?=
 =?utf-8?B?ZzQyN3RESEg2ZndqTmtscTFqMFBnam0rQ3FyNzlPbEJSdW5RdkxTdjkvQkZx?=
 =?utf-8?B?R3FuTDVzUHJhVm95eXVoNCtDa3ZKbDg2Vi9icGJlM3hFSGVnWVBDcGFCM1hZ?=
 =?utf-8?B?dDhDcWZCcjQyYW1LQ0lCOTVteTdZLzVyU05MVVNJQkdjQTVBZ21MWFMwMXc5?=
 =?utf-8?B?SEFFSVBjQTM3OHZpMkJtKzBHaG5RUkRTYTBKSXJhRE5mb2VZbWJWVldNekQv?=
 =?utf-8?B?THliRTZRNm5paFhna0FzcWZIalByS0JqUUlwRTZRNklIY1ZNdlA0cE5kTmFB?=
 =?utf-8?B?VmUyY0M4YzcwZkFWMXRFbWkzT2JVVjBmcVVoNzhGa0V3QU16dTRZa1lxanFn?=
 =?utf-8?Q?9k3nPKFQgIcGfjfElJoMuzFoy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4a1444-3a9b-4d8a-49ea-08dbceaa00fd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 00:42:56.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybgb33f1Of27KiUYWso8u6oDO/gZ0QxjThbFxWRPHQvCFX2J218qRCl3g7k9AT3dJ9wo98hVFUik5GOgosFS8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8979


On 17/10/23 02:42, Peter Gonda wrote:
> On Mon, Oct 16, 2023 at 9:39 AM Dionna Amalie Glaze
> <dionnaglaze@google.com> wrote:
>>
>>>> +
>>>> +     struct snp_guest_request_ioctl input = {
>>>> +             .msg_version = 1,
>>>> +             .req_data = (__u64)&ext_req,
>>>> +             .resp_data = (__u64)buf,
>>>> +             .exitinfo2 = 0xff,
>>>
>>> Not sure we need this line with 0xff.
>>>
>>
>> The exitinfo2 value had an uninitialized memory bug, where random data
>> would get returned to user space. I think this is carrying forward the
>> initial value that sev-guest currently uses.
> 
> I think during the initial review I asked for exitinfo2 to be set to
> some known value initially.
> That way userspace can tell if the request
> failed before the ASP was involved.

ASP or HV? SEV-SNP ABI or GHCB? It is possible to make a GHCB call and 
have KVM write something in exit_info_2 without calling the ASP. The 
guest should really look into the encrypted response buffer to know what 
really happened.

Anyway, looks like "rio->exitinfo2 = SEV_RET_NO_FW_CALL" in 
snp_issue_guest_request() is supposed to handle this. 0xff in 
snp_guest_ioctl() seems to be for something else. May be 
s/0xff/SEV_RET_NO_FW_CALL/. And I do not really see why the userspace 
could not write this 0xff to @input itself before doing ioctl().

The efb339a83368ab25de log is ambiguous btw -
"The PSP can return  ... in circumstances where the PSP has not actually 
been called" - if something is not called - it cannot possibly return :) 
Thanks,


>>
>> --
>> -Dionna Glaze, PhD (she/her)
>>

-- 
Alexey


