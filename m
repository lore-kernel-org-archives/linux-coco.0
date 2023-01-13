Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2ADAD47
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 17:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuUt7TtLhVOgZgTd3k8m5Y8z+og2Kx1hYyS6H7AMmRy3s+wSf3L5Exm29Xj0mr/PY55nx2UxnvHhnoQ+386XJNDKcMlTx4JGHSGxrXe6mPfVUoHSVWFsjf86FX0kYRrFyAtLyo+NsA2LTAOUMoWxy1NTpxZu32OccfOcgoaKrotHUZn1bJFfkAXWHefis714llqKfEdhkPlXtc07krvL3yLf1nz99ZzG+ai6EDp+866Y+ZvSLtnjIgMZ3rAryv4/swGQDkmVF9tzu3RTxybFRowr2KKRDo+k6bS2wuFF30qWU/oOwW+XGbU27SnoBXMlpmTMhOzFXu3zdZQn72h4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvOXZlw0X2DCJJw26k7fBLrNwYhKgRkC1pfyb5KZbgc=;
 b=BfYCGtBOm4Z1drw0IYt+WUbjrH3DRYuLXmB70+boFN5EruJQu7OUp6BVUH6XAdvkZ/7U5IfAJJJOYmagNtUx+mVx1JypUVBsrfcwIa4ev1/Yld1vNl9gSXO4mTwlnLwEcYLWuTJkD89Q+rZTVEAsD/WpUs0ktZMjP2kSXJKluzrT+gyi4z1vL7Q9dNHNz4ksZSn7kXdlj/LpCJkSvnHVbmxfNwhVewT1sQfugAnSHVYAMgIktQMNgDXuP8Sf6C/Yfresy7WQeZl5f25uW2tb/l8bLCZ4Im6XWrkbtoTX1TsL7elEuF9z3Wbmcr6j3uecQIseTXIelk+wXMOvnnj0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvOXZlw0X2DCJJw26k7fBLrNwYhKgRkC1pfyb5KZbgc=;
 b=NRMtHNglJbJhoBN+MEe2XPIDyhJTVemjIVhGTeTuyXJQ/7xmr6O3jWuWVDromvenFLVuplupc6RhN7kEf+khyKlVPDZQN4k2jfLjAa1fd93N9zdgal6Afm5nSrVYJyLxZciMx5yZC98h53ItTf/fA++H/bA3T/pV7v/V2dRDJgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 17:20:38 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 17:20:38 +0000
Message-ID: <8198babf-ff16-ca3c-9e61-70d4468a7bbf@amd.com>
Date: Fri, 13 Jan 2023 11:20:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: Nicolai Stange <nstange@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <87edryu00c.fsf@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <87edryu00c.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::25) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9f19e2-74de-4934-0601-08daf58a7d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UOSdF5n7yyVYUeHQZr04wNKroNPdrXbGKXoh+yy0MZM0Id03h0ZXuZpGowXyMYJVZda8hwzpiMQ/cYUZqLsj0npmr+iuurX8x03OZBafI5ySviRglhUp8KlLoWDU5YLyo4DJtF1D73vfiaPg7lfgot+boP2Qw5wWnaNmSoRoqcPUv8wfQd/jw8BaUBq6CgHc7CU2x7k3HdOySZJhx2MiYu/cE6G27B5MYOoUEwUXtthbEfEgGwjdTOTGKGAVsOIuAnQbIJD9noKTmgjcP9y2qUBqWLUp3rj4GEPIavMa4rCRLq10VgWQS5KzdAi13VPaIVMW/myr8E14ifsnu6KhS8xlEt/jGseDnAbi43YvI5HeSjH8kSzQ3F18xOQBUzogN2oc4Czo8QL+rcHqbxmnW3BAqzx/qrdTnBm6k9U6pzg6jPLGijwEBz+hwbL8PnayVUkWL/wJoolIGf+Z2VpgEytOEFhyMrs6OgBhWEXhUJKfNF/XTyZy9r5dRjS2O4A2w4umTxPRFYIQQdqaPmaCze3OlXRe2QeJxxZz/DbTsg9EUfpHDOfjv94w8M2/LCM1bz34+RveE16VL1JD/6U0XrVVxX9P3+aykLlh4IeTM3vg26YyOQdp9cOQZ1mNhd3EZ+zQ/SOGb9XrlSECVz06UOF0hFXipziJK/2hj9BHeLDsSGbUSs2jTP46hdMBI6+nVBmgVf++/Rz7WWahoOfDULCPEKqEdMBRBhSyPB3PliRxIajTHtceuNHgHC4DZt6Ojcmr9SM6KvZzCf4ZnukncA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199015)(38100700002)(8936002)(31686004)(5660300002)(6486002)(966005)(478600001)(41300700001)(316002)(66946007)(66556008)(8676002)(4326008)(36756003)(6916009)(66476007)(86362001)(83380400001)(54906003)(2906002)(2616005)(6506007)(53546011)(6666004)(6512007)(26005)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDFHaW9FVjQ5dDhzSmo1Ui9RbGV1bEMyeWV3OTJvY2VNb3JBa2pWN1h6dWpE?=
 =?utf-8?B?KzhrSUhNT280SzhERGRJMFVWc0F0dUVoZmtQOFBBSVc4akpKTFFISXYxM2tk?=
 =?utf-8?B?UWQxS21tNU1Mb1FFZ1duOXNKQVVyTDdtUkh6eWh4WC8wN3dZaTFqcXdualVy?=
 =?utf-8?B?UjlqL1JzYmo0cUJZZTZkNTVZaTdCV0xWSTVzTFZ6YXF4eFFIMUFRVVZFS2lM?=
 =?utf-8?B?Q25ab09panNEQW9GRnJ2bWFrbHliN2x6R2EyVmJMaHN3aVdobS9HbjN1WW5u?=
 =?utf-8?B?VCsxY3IxaTVXMFRuOXZNYTZRbzh2V0VScmlBb0dUWEdPS2FSdW9tYStBWUlO?=
 =?utf-8?B?U1NYSW9GTjZWTnRvWEM5eUl3L1p5dnF3QmJHRFRVTm9pZEtHY0UvUjkxR3Rj?=
 =?utf-8?B?b0oweUswdGpUbkwrRXcybGJ5MVdkQVFGcElpT0pBa2w0aFpEeFhxYzh0bTh3?=
 =?utf-8?B?L015ck13WE91T0VHRFhlWUgzSWFWS2FNTEwvQU9WZzhFbE9aNTVweGUySUdK?=
 =?utf-8?B?bGpVTzFCRGhJWmZHZ1BVY0ZUamFheXFtMzZvTzFnMVdEakJnTDkzcDNHSU1Y?=
 =?utf-8?B?czc5OUE0RjZqN1V2WHdUbk5USHJYK2tKUnB4WjNBZVhHQzBGdzJqcHhxczVu?=
 =?utf-8?B?UWlnR2tuRGJNYUhGTzgvQTVvVmhDb1ZtazZ6bWZPSDBFK2l3dEtZdmVZd1hq?=
 =?utf-8?B?enpLSkp1dGRKWFhTK2NBZ21RcGlpNi9kNmloTkV0ajdBM0IyRTh5SUgvYTVL?=
 =?utf-8?B?SitETC81eWNQT1BDcWhDemtJcnpMWXlHL0lteVg1ZzFxM1NPZTZtd2d2bnlK?=
 =?utf-8?B?b0NmSm81ampGY2VxOUp0WTdNeGcvSGNERnRGTmtJaENDUHI5dGlHWU8xV1RC?=
 =?utf-8?B?Q2pBcWM4SGtFcFpaUWdpeGFPdXB5am1TRndPZzY1SWFpcWFvTklJWTRoZklP?=
 =?utf-8?B?MXphdTFvUjhoR05PNEpCNjI4cUo2OVB6Q2FLTTE3U3pZazErSjUyTHpvVU8y?=
 =?utf-8?B?VitGUnJicVhkSkRoUTJ6TThtR0Q1b1owdGRjdUlSbDlYSGlRbUtQZzJPUXRz?=
 =?utf-8?B?S1dDanlaYlIrZ253SXVNZE11cUJHV3BUNlJwVFNEUW9pNzJXL3piWUJMcGlZ?=
 =?utf-8?B?TEF6TjRWZ1lCNmtoeHg1Qld5RE1STmlHU212UzZ1NTU2VVZnM2ZJSHFXLytp?=
 =?utf-8?B?U1NvK3M0aDdSWVN5a1NqSVhxdVFpWnBKUlZRTVZLWnlESlFSNlZINkE2TDRO?=
 =?utf-8?B?T2hOazkyUFd2TG1ycjBoczNXdnJ6Rk5NMTVicXgvVDUvOW5DOEJVTXpteDVq?=
 =?utf-8?B?SVQ1NHA2R2hnMFhSa0lNTDdITFZPRjFsTnFPUGI3d1pEK2Q3SEx1YXozR2Z4?=
 =?utf-8?B?dEtjWVdhMFBNZVBUZWpRcnBsbCttRjZwcmJuM2JLeWtETndrb294TjJUVjRB?=
 =?utf-8?B?bzR2TzlaQTdoVmdrU2FzcDFEWHM5ZGpNTlN0NU52OEhBZU4yc1gzL2U4UzJJ?=
 =?utf-8?B?VFgzVTd4SE5WRU1aZ2NSeHJpWkx0eDZiTWM2NXhyaGdlTVNFNFJMSmRURGtF?=
 =?utf-8?B?UGdSM2FsTHVTbDRta25XY3p1REhnOVAwN0JGeVVkbVFMRUhaQ05jUHc5ZXho?=
 =?utf-8?B?SXJxeXBkb3V5UUsyZ2pydEVEcHlKdXpyNjJiZG91L1N4c3dQTHlMaVFmaU9P?=
 =?utf-8?B?SW9DTzdSejNzTVlpcENNUVhoSUVmZWhHS094U21UeXQyKzU0MGJveGVXSzc4?=
 =?utf-8?B?V3JEWmw2dUMzOEZlVzcxVnpST0dMQWN6aVZNVHkvRGVYbUk3aFNaK28rQjJ4?=
 =?utf-8?B?aUhBanVBanduYUtkVXJJZjhJVFVOa1dCZThWUzJWUnBOUk0zeGhjSk5SNjBJ?=
 =?utf-8?B?T2hEOHhHeWpNZU1XZkIyWkQ3WkcyZXdBV0ZMdWduQ1Zwb1hsc2s5VUZhcklt?=
 =?utf-8?B?M3NFajVHT2RLQzlTZ1VKbGx3bVN1YXBDaDQyOXF6dGZMVmNCRDB2bmxnNHBT?=
 =?utf-8?B?TzMvejgxZUp6ZGNQRzU4bkF3VGFTNGVaSGNWQlU0azJlV0F6UmJpQzhhWlpa?=
 =?utf-8?B?eWVBNW54WWZ5TDdxK3l2ckNYUjR6bXZxUitqZ0pGaWY4MXVKM0VXRHRva1dq?=
 =?utf-8?Q?+pZeY9tF0subzZUanRrsGhE+o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9f19e2-74de-4934-0601-08daf58a7d6c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 17:20:38.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx+XtTTiwo8ganmC6uQi9Suvoi8p4xmcMQEXeGBmT0TxWrlxp5JkGtc+8Ud642wn+3thi9rjacErwAPHBb30QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345

On 1/13/23 05:50, Nicolai Stange wrote:
> Hi Tom,
> 
> Tom Lendacky <thomas.lendacky@amd.com> writes:
> 
>> Please take a look and reply with any feedback you may have.
> 
> Perhaps I simply missed it, but the available SVSM_VTPM_CMD response
> buffer size seems to remain kind of unspecified. That is, the proposal
> from [1] was to just require a complete page for the buffer, but I can't
> find that explicitly stated anywhere (except for the required alignment
> of %rcx giving a hint).

I'll add some language to the specification that it is expected that the 
request/response buffer is assumed to be large enough to hold the request 
and response of the specified vTPM command and will be treated as 
contiguous if spanning multiple pages.

> 
> 
> For the table on p. 28 in sec. 8.1 "SVSM_VTPM_QUERY Call", the
> "Supported vTPM features" are meant get returned in %rdx, not %rcx, I
> think.

Yep, already taken care of.

> 
> 
> And finally a question re the addition on p.9 ("Scope of the document"),
> which reads as
>   "Items measured at VMLP1+
>    o Firmware binary
>   "
> 
> In light of the sentence immediately preceeding the above and explicitly
> stating that the svsm would get measured as part of the initial image,
> does this conversely imply that the firmware binary would typically not
> get measured as part of the initial guest image? I.e. that it would get
> loaded with PAGE_TYPE_UNMEASURED? If so the above could be read as if
> the firmware was supposed to measure itself at VMPL1. I think that's not
> what's being meant here, but the wording is a bit misleading IMO.

Right, the firmware is expected to be loaded and measured as part of the 
initial guest image. I'll update the language in the specification to 
clarify that.

Thanks for the feedback!

Tom

> 
> Thanks!
> 
> Nicolai
> 
> [1] https://lore.kernel.org/linux-coco/b488a79617beed8913df61186e8e263c40f2330b.camel@linux.ibm.com/
> 
