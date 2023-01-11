Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F717D0
	for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 14:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kObncrSi4OgD5jiR8eNeyQQkba59uPa6HGzf1DK+KhbHjOMtBGGYGhH0cvSma6vER/zmMOVPAaF5U+EFmnNPAtlUt05pd9cNLtXRFrkPwKKqziSssJZ1rf3NmNA+0DiDZNi9wguQ+ngO8bs5Jz/N32fH8ahYMZUpoHHQSwrHZ5/aAUmsPo/UHK2YTaa9MiA1FIaoa0WhWwCipa/m2cu2V4t5Fy7CTcDZNusGZQSGcFELMDz+Q4lsTyYAubFkxhRdNSPRf3CA7udA25n3C+sS8S4s30k9D75UJNKIF9CUyLad64NKf6ujZnXoUr67q/ZBuSqdvZnNpAXocjDMrNwhHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8Eb5brKMfTaoHEhv2nHwZWZroSenuxUOE7THc/mOvg=;
 b=K91qKmTHBIKwvLrrXm298zXZ9tGkXVw8eZ71PV4WvlyG8iBqdBZLRypXJHUP8SxTigDan1xCsXoSvR69mrgdqngRLEoPZWw5XwiDcmYFdJoaX2i5rwnduN3hd1BlPXyvgjocsrMXW3c604TNutZILHB9Va3ovlj9b2IsZCeZ2dTzVDmMEiBgjzz8Rda9vDx73LEh4w5DoOZ47AaxZvq+t9/nNKnhcA8FJfRt6uGGz+QIlEZV0gSppLQumOzCRrxSQ7mf5kSc9zoCYjEvwHUYGH8W4D9POrsyP8ShbfRRPaZqrzSyFPUNquW0RNAyuDBhxwPQacA26dSg202UbTc9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8Eb5brKMfTaoHEhv2nHwZWZroSenuxUOE7THc/mOvg=;
 b=Gob3fEMl9gx/WjaTMHBmeCVK0l24GuqIV5wXBWzqvI5Ni/NiTncOzI2Lw3ocRl7opt4y0uJxaVB1lzIOo/GPIAPs4kk4oQjYm0aJM+KQddNj9yazLeBHAJw+uLTuHoIDWzyISXQ2eVp+I0Siis97Aj/ZecOTiRHVNYR8Gih2Fks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:50:00 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 14:50:00 +0000
Message-ID: <73a7ef36-2613-e75c-8f30-f2166c2a346f@amd.com>
Date: Wed, 11 Jan 2023 08:49:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <fbc84da05c5343c5228c5adb697d4b66f1ea6308.camel@HansenPartnership.com>
 <6303283f-cf1c-8be6-9359-69d556a89554@amd.com>
 <7f6782cb049398e9fc28176fc15456f55a3365ea.camel@HansenPartnership.com>
 <c29bf3a5-2970-245a-40af-569fc933282e@amd.com>
 <594f0863c990fffb5e7258f8e3fbc5d014c12556.camel@HansenPartnership.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <594f0863c990fffb5e7258f8e3fbc5d014c12556.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:208:234::31) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d6b338-f117-4937-9e84-08daf3e31d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JZJu61jd+Q1PR7qBjWgzT0b5WSypEHeWexpavnUPaCnauWXj1a7dVXkYfVI2H64nCn+QunzixKlRMoCrU/LDFaLmqcu2AxTBMWSW/62lGMadsH+ecUxqz+eIL+89EqQNbt3QIqCPXnACQg5hzsKjpW+YNhOU0TO3aR3Vs1f+UBwB0jVDCXsNZf2t7zfGQRcmMy/401g3/39A7b/bazlhzqyzoxygqN035mHuBZSJe4iGnUMXQPSXHnSmHrkNG0tmqVuT50Or58hramq/UDhFCOORtHCsWPSG2QoZg79Rzo6y/QMkuY0L6+By2PosUbEeFVEoLH39oTtUEGgGmAnuVX/sJD5pVXIjR8WNSHXTaJwdgxvM5HJpsVoBzPYUuAjGWqPO3w+HaIjrsEOiEp1Naeur0e7OmU+Zs3jREyThouid9ecg4lUht4f/9lRoaoYixYoMKUKF6ABBWqUseiwFZy3bVnIGs2DY7MKsZ6Shw6EWF6pCE9z+KWyGR4c0x6NeqfLU8CE57cgyKKJHmeNxQV7KfyAlAl79oxWEd+HAM3gNv6bkgAXAIq0hP72BaYh9AuXB737EHHQSOhUysMUIS68v6PKL9zJHE5ne3X9WR/PmvjiZDB2N/Xxu3W2WTLAx0A40ZqJebRYaFKYEFHuvJ2Ql3LbbHdYCa2wrPUucx56Ascj2fzR5qatz6vASJyAV+5/Uk7bouhAZwXbI+s4NOIOG432x8AE7xeFQztHUmBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(66556008)(31686004)(2906002)(36756003)(5660300002)(8936002)(66946007)(8676002)(41300700001)(66476007)(2616005)(316002)(110136005)(53546011)(6486002)(478600001)(26005)(6506007)(6512007)(186003)(31696002)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFU0UkR5S2dpR1A0MkJZUW9YY1FrQlgwU3lZbzBDQld1NmZLS0hNUWRMdGtw?=
 =?utf-8?B?NCs4MlFnRVAwQ0QrQkgvSThvOXl3WWx1MmFKbjNiN1pmcUtRZHpLUjhXQSs0?=
 =?utf-8?B?ZlF2bU9YejNVS29iRTZ5Yi9IZUNKR1NnTStGeWNhU01YVnZDL1pVd1FmYmRj?=
 =?utf-8?B?RHFmVm5DWmdSOXI2dUlOd1BHODVBTnJCRVJxTzR6aFdXeWlRNEdrSTh4cis0?=
 =?utf-8?B?anhQNVdneE1sNi8wVzJIY1lKbkpNME9aV3VJVmZDcUUzQjUzaXN0Q0JRODgz?=
 =?utf-8?B?bnQyT2RUSnp1MG5Kb1Bmb1c1WS9jTCtmNjVSV3R2L1pVQVBIdXFXejRxaS9k?=
 =?utf-8?B?WURROHRpNC94Z1pWUFBqVVhGb25wUWl1UWljY09MQkJ1LzFDQUlwQ0ZqTWRG?=
 =?utf-8?B?dUlUSzNISE5MZS9xVmFRakRHUFJxWTA4Zk0zRVhQaU85V1RiY2RTV25tWm8v?=
 =?utf-8?B?Y1FDZU1aT3dwZ29xZ2llVTVDRkRIZHdLWDVPaDNXR0l0NTNoVUNnZUhLdWhJ?=
 =?utf-8?B?eUFBZUZjc1JKb3RwMDFaQUxNenRkSEdrWE45MW5vS2RycVVqYWJHdmFjSVM3?=
 =?utf-8?B?SXYzV0NNaG5iVW5abCs2elFuaVp3SS95d3FNUVBsV1BPcytjSld2UVloVURn?=
 =?utf-8?B?Qm5hTWFGdW5yWndweU1vVVB3akZ2KzJpSjB4Zk1FeHRSb2xSb3dGbWFxdXJC?=
 =?utf-8?B?eFI0RTVCUXdINFBTdGh0aktxZXhxamhZdHI4cWhXd0x5TmMvL0xza0RDU0VI?=
 =?utf-8?B?REQyVjZJRWwzTkR0ejBNQm9pcG9mZGJJZm5zdy9oSWtCdm04dE9adS9qdFhD?=
 =?utf-8?B?aU1ocjhoQXp4VnBCV2d5aGhLT2d1TWZsZHU3bDN6cEtpRy9ROHNSK0tnbWFP?=
 =?utf-8?B?b1g3OXdTbmNoUVM0dG9VdThjcENyZXlOM0ZYazVuS3ZtZDNNY0VtRFJjK09z?=
 =?utf-8?B?Yk9pWC95UDMxWkFIaHZkY2lpbjdwYlc5V3pnYkdmMFEvaVZXU2JDNVdFVWRi?=
 =?utf-8?B?ZWlYU1VHV2RHQUtXV2JRTG1EZlZ5Q1NnL1VuSVExOUcxR0tOcmlsaEoxVmYx?=
 =?utf-8?B?V28rRzNtTUgwZzlXVzBzQXIzUmlhMkVxdVNzSkh0UWxmY0hxZ2dmbWRUbGpy?=
 =?utf-8?B?K25aMS9PSUViWlg5N2ozbzdtVjVwT29SNEV3YjNQc1hoVTEzbUZsSDMzUitG?=
 =?utf-8?B?ZXgwejczV3dIblMvVkpMZndobDlLQ1gvS2ZzUFhaOHV0ZWxhNU5SMVFzZWMw?=
 =?utf-8?B?REUvSzdTbkFwMUF4S0NmNWJCelgyVk4waXJmLzBxL2tPWGlKaytoS0VZTUkr?=
 =?utf-8?B?cXBqYmFhM0tWSStZckVmTU5kUEprbm0xaFlQV0xYeGltS2t2YXJRRkp0TFRR?=
 =?utf-8?B?c0dXU1daZXk0N1J6aFF4WUVOazltdERpeWxVbitKVjhwbVFwbzdHZXdCaWp3?=
 =?utf-8?B?K3MxNCsvVXZ1Tml5L2JYWWY4Q29VdWlPeHFGODQxSk5lRXIzalkxQmViZlow?=
 =?utf-8?B?ZVBzQ2w2bUlTZklBYWhqZXlmNXBoaWxPdTFtbGg1V3FoNllJeS9QanU3M1Fs?=
 =?utf-8?B?VUNPY3VtQnY2TzdRcHpqZ1JLcEppZ3ovUFBSdHh2aG9yMkJpZ2pGdEpXUTdR?=
 =?utf-8?B?QWNtc0ZYdStUZEtNcXNKak1JOWRiV3pVR3dmNmwrOVNsRXYzdTJHdjRnaVV4?=
 =?utf-8?B?MWtqWkhhZU14UER6ZDk3cUozVU9oUkxnTHFiRG1VV0pVek50OEdlVU80Ylc2?=
 =?utf-8?B?Mzg0cDFnUUMzTHRQUFMyOGVLRnh4R1MxZGcybG80VWhTSWdKQktCMGhVNlhx?=
 =?utf-8?B?RmRYOEZ1Yy9QQkdtSUowNm1IL1o1N08zYTJURVNUUUtJRDJ0RGdubjhGN2U5?=
 =?utf-8?B?UFVha0JEZGtEenZhTy92eUJnTi93MUJkOTI2L0VEQVF0ZU9hbi84NzF5VVZp?=
 =?utf-8?B?YlE2VjR5b25JV011WklCci95aXJFZjQzQXUxM3VKcVVTK1NHRzljU1ZPbDdL?=
 =?utf-8?B?enZWcXZSay9NTk5CMCtxVm81UlN0N2NIQkUzY0Q5TnIwQW9rRi9yOHJpalRJ?=
 =?utf-8?B?empTdG9iK3BHNmRxd0J5Y0ZsY0JXT25TdE5nRXNyQTFkMWViL0xUOUkyNGhh?=
 =?utf-8?Q?/PI72ReBw0RR5EFyAJpOw5uP6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d6b338-f117-4937-9e84-08daf3e31d83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:50:00.6043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVFae/fe5rw1H+rq16VtaVlSPLXQdG000auk4C+Ir9ZssEzVyU/k3QHD/0E2Lvx1JmdlGJpbTXfhu7i+woWAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382

On 1/10/23 17:09, James Bottomley wrote:
> On Tue, 2023-01-10 at 17:00 -0600, Tom Lendacky wrote:
>> A GUID still works, though, to describe that the TPMT_PUBLIC supplied
>> is for the EK - unless you want to go with the known handles, e.g.
>> 0x81010001 for the EK RSA handle or 0x81010002 for the EK EC handle,
>> etc.
> 
> You should probably use the hierarchy handle for that case: 0x40000001
> for the Owner (storage) seed and 0x40000006 for the endorsement seed.

Looking at the spec, do you mean 0x4000000B for the endorsement seed?

Table 28 of the TPM 2.0 Structures document has TPM_RH_EK (0x40000006) as 
"not used", but TPM_RH_ENDORSEMENT (0x4000000B) as "references the 
Endorsement Primary Seed (EPS), endorsementAuth, and endorsementPolicy"

Thanks,
Tom

> However, I'd just specify the endorsement seed in the spec and be done
> with it.  Once you know the EK, you can use it to certify any SRK you
> create from the owner seed.
> 
>>   You still  need to identify what key is represented by the
>> TPMT_PUBLIC structure, right, or am I missing something about the
>> TPMT_PUBLIC structure?
> 
> All you need to know is what hierarchy seed (which is why I propose
> endorsement).  After that the TPMT_PUBLIC defines exactly the
> properties of the derived key, including the algorithm (RSA or EC
> curve, etc).
> 
> James
> 
> 
