Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82554C157
	for <linux-coco@lists.linux.dev>; Fri,  6 Oct 2023 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iuEJ0tUx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TERu9P7PfElpzq+fu7oyc9y4FfLDPYFOqUGIdufJiMoloXbsmCs6T54zq6k9/YiJVIe2v/X5zfsfVsv7f0sHZ8cDiNYQDg0E6zbvGsVFVRaaS0z7f6OaohojEjSiIUAikn278hNlc7epcVhQCGkP41XVzYGPrr1vH12b3WeD1jRQz1Ci87/BBkdrL+9xx5mx77n2EIqdxRuK4I4vqhzMRSXJWKUhHPYD5J6wNfe3JAqCPfBLXt8GKYe5lJweiCWOt7lGUSO0/RMaKMi2SnovOtL8sgFUqgAZLOViMTb1jOArqdH8s/YoKr6auoLSiP2KGq5z0A6coJbpik/wX0TbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDJ51I9irlpNdGPsYyacWc/GTU0cIFnv6fohm3Jh81U=;
 b=KI9SQ8IMD9eVWQu/mn2H7gF9nzuF30nIFX8XQCx77UaEYmV6LHzst8QQczaZW9rMunqtq2bR1aYxQ/gf3URWD/4RjAxduO9Fcf1L/u5dYGXiO3F/skzn5hcAl55d01pSRRw9MtJRmfGtmB7z/OORt6Nl8QYwnSqvQEx8zoQ24tvbirYdimZ+vtS2XIgDPhevMkI8NrZnozPQ3OVrMldz3xEhpRFQj0Xat1o2LlR7C7d6aKugAN02/qFqx65qJFXPRvA4rHXn/m3D6pfK3c3sA/ZN2/vClmMxDy6A81o/NSo+ajWBIUah36C93iG9kGWIcXbQ81k8JIO2FEI+nuwX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDJ51I9irlpNdGPsYyacWc/GTU0cIFnv6fohm3Jh81U=;
 b=iuEJ0tUxqA9lYgSHO0UJG3zVcASXzU0PbLoyprQ8z59L8QeClNqovJm2eYdXLDAiV3l9SKcR3+sIDzEqlK9ey5YdK5WqhfemXE6c5xLQz7OMipV0wtqjBIaBu+dekhBkHs9PwVYz4VDYilPDFNtPCCicHR2HPuYj8uUI+YlOl0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.36; Fri, 6 Oct
 2023 14:26:03 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::2b54:7ddf:9e2e:751c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::2b54:7ddf:9e2e:751c%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:26:03 +0000
Message-ID: <b346b3b4-fc29-0a88-86a8-050dfad14379@amd.com>
Date: Fri, 6 Oct 2023 09:26:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SVSM v1.00 and GHCB v2.03 specifications available
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <c677020f-5c98-ccdc-b204-bfaf5cde02e6@amd.com>
 <CAGxU2F7kuTrrqWgwF9aVJKSZgn_fvyj4bjW2D_mgdfVssPmLYQ@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAGxU2F7kuTrrqWgwF9aVJKSZgn_fvyj4bjW2D_mgdfVssPmLYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:5:120::40) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: d62ed201-780f-429d-2a60-08dbc6782b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nGC12obh4ZrbtR0JWZLig2004sh2cZ2XRfsskm/iMJhW8/hhRR2d1EHBXdOSbQRko6Qgpz4F2bBoQDGnfG2/rjSyRhlp48PHoUPRIx3v+Lnhtv6oUgDNb6dZ5N8MHxpdsj+1C7J86jHA8kzWPPOnDeRhPT+FqVzV50z6AzhiaTronMZXfyLFIocntHo2XCdx7v1uyoGywnV0JuJcbo4s+NYSsYT8536Al8hTudMsxx3kn5LYtzTyBuXFaIfdq88/2+gtPSVpWUXitVhbe4BasBSBr2ux6034q/ZrInCInkfyd6vSS7RiMNyY3VHvUN40NsiO/RaZTAHM27dNXHaS8MOQ0MA12O5bq0DBjaTyzM0uKwau0chRSEat+9LHZrwOpIdEj7DBSQtJcfjg5CYELjRSU+qb8U+85UWh4mI/aVN2EnjgXIE/lbhQbteCi0D05BBc95mdM4X17mFiof79Cj6nqKxE2CNDF6gej5io+tCgp99FuNLWDWS55NMP3zwebH79epRVzkxD2s4kHRDYmatXGAP1Ppy2AEKWCl/8tbA42kD9C+pUXvFpQC8R2Sp431DYL5wwDLkyF4ouNJv/T/Az/Fx1O+3BRFrl9rYjXM/DS8dWKgEPlAQ2TsK1ZcjC02Xuujpy70kXWCd6zvdmHi1EfIq0n98gQUbYHpZJF/Rp7dxBQcwc7rkz0Ww5hjs1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6512007)(966005)(53546011)(6486002)(6506007)(478600001)(83380400001)(26005)(5660300002)(2616005)(66556008)(66476007)(6916009)(4326008)(36756003)(8936002)(41300700001)(316002)(8676002)(66946007)(38100700002)(31696002)(2906002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTFxRTdXZUh2RytmMk0vdS9LZ1JTUWNZd0ZvSDdZWmZsajRWNmZId0E3ZXlB?=
 =?utf-8?B?dnlTUzJNNXRtOU9Ob2F0MlJHRXNKNitMT1p1dUw2aGNyNUdUSFQxVUgrMkxx?=
 =?utf-8?B?elBNSUVicDJGdXVkbTlVUklmZ3A4S245TjBHam5kU3U4VUtKTmZUZTZnekRM?=
 =?utf-8?B?eU1CMCtncGw4a0FPM3lySzRMQkNUUzkxSXdLZzJ4ZWQ4VEdZTC9lSzRVRmxP?=
 =?utf-8?B?cnVlRDJQdGR4T1hRRmN5ZGxUNFFybC95N0toVERnNmZ5MFZuS3JKZ1MxSy9m?=
 =?utf-8?B?Y0xid2pIVXpuaWZyOHdyODZMNGdHQ0FYVFpqd3Q4T3VEZmVJY3ZQQS9CRVVs?=
 =?utf-8?B?Ylpnd25MTXRzZDc3Wi8ybDhCZjh6T243WEJhbTV1MWF4TVlZVWJDZWJjTzdU?=
 =?utf-8?B?STlNV2haN1ExY2FuTyt5dWszc1ZRM1dCWnRGcmEwdjZqcSs2V3NPZWVicTNv?=
 =?utf-8?B?dC9kOVF1Z0NEVjEwdGt3S2FtODdZTy9HakdDemJuWHRHaFlBWWhVaXJLeVBX?=
 =?utf-8?B?M1hlaG1lQXF5VVRzSlJGSkZFU3p5ZDU0MzdYenJWUGZlZG41bEQ1QjdaaFp4?=
 =?utf-8?B?RHpNT2xJZVg4S3lFdnExUENKYUgybmVQOUNYMFB6SStZbytEVEcva0JzNmt4?=
 =?utf-8?B?bHYwWS9qL0pDN3MzaEdTUnFneFBkZ05EL3BjZnNDWmhldXFDRzNmT05qMW9U?=
 =?utf-8?B?S2tFaFFMYjZ6eTBQTmQwOElkeTdQOHduNHNUZnBxVUh5YTlqWlNhaTBMZlR6?=
 =?utf-8?B?REp3VFUvMmozWno0UExXZUY1VWpqVHVvYk5uVHNZYUUwZnJYcTFkK2d3M25v?=
 =?utf-8?B?eWhoc1J1c0drUmdtTFdWOEhtMGtWU1QxTTkxajFhOVNEOGlNL0VkSGc2K2Rw?=
 =?utf-8?B?TURNdFNrZ0JOcHlWV01xWDQ0V3JwOHlpVDhnQmJuSCtsYlBIampmU2VPWVJY?=
 =?utf-8?B?ZkRkc21VYTdISjdaWG5idjVTdnVBL3pVazJxUFd5WG9SMzF6ekZiL0luKzk1?=
 =?utf-8?B?ZkNjWHZwSzMyY3JkSHQ1NE0zNlZPVGFzSjlvcmhYNWNDY2E3eXJud0R2THJE?=
 =?utf-8?B?ZnhTVVhNNWF5RXp2ZVAvTS8xM3FyQzlQdTlJZXZSekJIUy9KMENWTkpZQ01H?=
 =?utf-8?B?b0FobWdiMzRNc25PdERINU1rQ2Y5N0JmSGMvQUhjMC9XTTlHWVl5LzVzODNT?=
 =?utf-8?B?SXplWFV3aG5zL2pvMk41V1VGQXhjd0RvSExpNDFNZStIek1oYTMrTGxEN3pl?=
 =?utf-8?B?Yms3azMwUWgwdFkzTnZ1M2VmMy9BUHdKRFFvejhXNklpenR4WVlwaDBmMGM3?=
 =?utf-8?B?U09UdTVCdUpqMFRiSytlWXhMb1lDZHZabXRyWm0wYkFVUEVJSW9oMEM5THdj?=
 =?utf-8?B?M25MbUJzeGZEZUlkYWtxM2lvZlBwQklJM0M5RkZKZngxeUh2T0F0MU4yWTdJ?=
 =?utf-8?B?NU5kRHQ1c2U4Zll1c1U0ZGg1NGl6WGxidDJTRGRXSFBuQ1loand4V2h5eTJ1?=
 =?utf-8?B?dUVpWjNINXZ4SVIxTk9QR081QkZsT01CbEZwQnhiQmZVTHBmWWVFV0pzek8v?=
 =?utf-8?B?SjdaVGZFdklzMkNpUDFySlhFYjZWYllIOGZ2TWRlS2lIci9KSjNUN1ZTSDlB?=
 =?utf-8?B?Y2FRTWo0b2JYN1J0VGVhOVMxUXgvWTY0cFVzUnRSSDVFRnVHMjlxZVhRY1hi?=
 =?utf-8?B?NVR4dndUOE5Ra25yRHlPM1RGUDFlTjQ0ZWN1NzJsWlJDcVJUaC9LSkZmOGh0?=
 =?utf-8?B?ZHFjNFpvRkxvNnVMVWxhMUJlUEZVc2U2K1BKREpESll2RkpEMjdkT2hKMkN5?=
 =?utf-8?B?cjczVEsyeVFPTUNVVUsvVTA2STJhUFJqN2Q0K2tPaFVVR0V5ODBHQnNQU1J1?=
 =?utf-8?B?L04vWlpLMVozaE5tb0NGWDRxZXpFdFlheE1BRnBQV0JENlNobWRaTEM4TTM0?=
 =?utf-8?B?MTNzWE5xbWJNRC8yblNtVHRJR0RidThDTkZ0S0hzbkhtL01kaVk3dkJuTi9W?=
 =?utf-8?B?VzcyUmdPZ3cwaVFaN1JhY1RDWVBLU2tGUkRwWVlxUXNvZDNwZlpFR2tIbG5x?=
 =?utf-8?B?bzdGRVNCZEE4azRuU0x5cU5sby9aZ0lvV05xdFlDcXZQeVk4SXR2YXMzYUdI?=
 =?utf-8?Q?Uoxk9xaVYHadwdu8C8qumot93?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62ed201-780f-429d-2a60-08dbc6782b88
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:26:03.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fCW+Jzg0WeiQJpa1isbSToMSy5jCIZTSI3WLNkAKzSaOOVGau9x827Yw6UF2iLgrVh04gpcNDYCAw/JJ2kUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086

On 10/6/23 09:18, Stefano Garzarella wrote:
> Hi Tom,
> 
> On Wed, Oct 4, 2023 at 7:30 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> The new versions of the subject specifications are now available. The
>> https://www.amd.com/sev webpage will be updated shortly with the new
>> links.
>>
>> In the mean time...
>>
>> The v1.00 SVSM specification is available here:
>>
>>     https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/58019.pdf
> 
> I think there's a little typo on page 30, section 7.2
> SVSM_ATTEST_SINGLE_SERVICE Call.
> RCX Description: "gPA of the attestation services operation structure, see
> Table 11: Attest Services Operation"
> ^
> this should be "Table 13: Attest Single Service Operation", right?

Yes, that should be Table 13. I'll work on getting that updated.

Thanks,
Tom

> 
> Thanks,
> Stefano
> 
>>
>> the v2.03 GHCB specification that adds support needed for running an
>> SVSM is available here:
>>
>>     https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf
>>
>> Thanks,
>> Tom
>>
> 
> 
