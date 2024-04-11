Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72A22096
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844465; cv=fail; b=LPWXG71+caVgJ/jHYw2Hh0ETUUB3KP8CL2sKBqUzO7+bkGQ0nzzIkFDCXJcpI7BJL/MoEyYVFIiX6+Bro3RCV7jzBGqEUwY87ScbpwUO3hrwAIQ2V4h6iY0rvuGN8CTI9yCBO8SXJFtY4NCpQT7+S54Z8R5BJx+8tHmNDp7nfeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844465; c=relaxed/simple;
	bh=l6OnFAa1VTN/CPLFFGvDMW6BetQpqtoaJ+Mvqd/wQz0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nlxaCQgGx7Msrn86sNFz+D6xoF/5k5MkOkKJExfvAYuwNe98YTcAhq7X3xkLwMu8lxVdnIx9zoyi+YUsZ7fTO/EOD/j80w0djgHJZszue5ZKG+wnxOUv5z9I44ObXTEK4IoWh6gKbdIbBEZNFVxJA6IRWgZae+3XS+1/yblO2xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V74BC8Z0; arc=fail smtp.client-ip=40.107.101.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V74BC8Z0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXj9WdlyDZ2yHdB2LJ80QssXSz7SnLbnjQuY06cJcVGGRXkC/Z9hOIm5FtbyuJ1BcaPRCjHeMXCHJKeDSIgilgPkpag/UuteYoJEwKMZTWjk9gaEiMi3EBc+/qFOVTDzYSNIMRoYmJL3VZOARX1FvQs6l+wnDtOyWQq2v2+tnVCqDzTuAIXG2wI4LTiiqo2Jy1vPW6JEtslt51aprkLmm+FgSw74BY2FIoCo9bfRqbfnBpaaXeYZD1tbki2YHTPYCnBqsxIZ2T46ceUdHUSncYWUkXC3whwNnjkGRMBPri/pGSk2IBZ2J8gvMty9BE2bOoUmHCyFMlnsUw7JDJjn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZcUlzN6QlYAfTSmltlT8v9xawS7ICi0Y9qFklHVuBo=;
 b=iH/z86S7KwTNHOwK0qsrCG0qwz6R/b1rUPOFoM8Ws9upGFDNRpjt7i3MYJRCNCKSdw+H4g+ACohjY8bnejQvHYVFJaEBNf0RGqtdJR3Pce/mn5EQR0rhx/0ItpCVNJRJYrcAu4EoANeybp4d4r1ieHy+Ni0KHsTXEDC8RWJ4U91jazYCzaZOaIMUbbpB6mw9nEv4Jk6MgFhZEvzlB90k01Ac2kXadwFIIwxlN4beju0jUm2xJt3u8HieXCYu+0tqiBrvJoVxY+n+IRr/+PjXSSEc7ZxiuGUemYbqeF/MW4j+EvuzWWZTtsHqpWMZUQddG42Ec8qqr2ks8pVJV14Tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZcUlzN6QlYAfTSmltlT8v9xawS7ICi0Y9qFklHVuBo=;
 b=V74BC8Z0Z8/dOVco15WJosbYLgdCpspouw5ipvRUZCfU4ry/IdJ4mk/PktnYYiY7/ofSGFw9ZgYksyEG/sG3Jg8lG71gJGpnenPjCP6u4hN9HVLztaWscnhNQbgSg77eyiFfV5504E6+SBLDswdk7i6t87S6ZxrKRTjyLWleMLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by SJ2PR12MB8941.namprd12.prod.outlook.com (2603:10b6:a03:542::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.48; Thu, 11 Apr
 2024 14:07:41 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::1032:4da5:7572:508]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::1032:4da5:7572:508%6]) with mapi id 15.20.7409.042; Thu, 11 Apr 2024
 14:07:40 +0000
Message-ID: <226ff307-991d-693a-1bca-837931d08604@amd.com>
Date: Thu, 11 Apr 2024 09:07:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, devel@edk2.groups.io, kraxel@redhat.com
Cc: jiewen.yao@intel.com, Dionna Amalie Glaze <dionnaglaze@google.com>,
 Mikko Ylinen <mikko.ylinen@linux.intel.com>,
 James Bottomley <jejb@linux.ibm.com>, Michael Roth <michael.roth@amd.com>,
 qinkun Bao <qinkun@google.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "Aktas, Erdem" <erdemaktas@google.com>, Peter Gonda <pgonda@google.com>,
 "Johnson, Simon P" <simon.p.johnson@intel.com>,
 "Xiang, Qinglan" <qinglan.xiang@intel.com>
References: <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
 <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
 <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <paod4p2nuaobaevggnivxyzjcxi6fxmydo7wm2gjuzo52ep5ah@httyzmycr6bi>
 <CAMj1kXFDCThQhvVvDknV9GDzG2HWLPR4LC94CHhuckGE41Nvvw@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAMj1kXFDCThQhvVvDknV9GDzG2HWLPR4LC94CHhuckGE41Nvvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0179.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::9) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|SJ2PR12MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: cc33eb82-e3db-42c2-995a-08dc5a30c00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXG2Q291b7vDAL5v+kM3eMOKjFmht7GygFVl0qHoOMrZSfb1HjL/zPY8rQ14DtyhbIk8I9PTLNdcwNXNzgDUmSCgOf7Lf7VB9fcZyLsshZxSR7/7u6euUYKQgtpZDw9pz7gzEu44mhjL8FTajCLXJJA06Wm6C9g10mayDmbjZqGJ8hQFhW0nT6xzxMjcNyTK0o7D5SfKMOQrXQFLaCCvJyhRTFNuG6M6IjmHeGDMmRJLQOXffxY3Zu0Qggwtf3uZK8FWjKuyCbFx0SY9brkUEH7ZaEPCji6KFwh8QJcLBfaVIJHAVOjZCRN03gcrIfNb0EgzsJeHKR6XPYTCd78tHv4KhO3irqH7jAFMMhnPolaSQYTgq4zsGP3HNlpuLEok7/9GpzwU7qSdzH3tACX49vLkcQPEvHgKcX2pr6cALtUDI2MfVuxuSFk/IGgqn81Ul007su/6erFMqWnOWQ6qJqQyme+A2yK+1cbr4vJNEF49Q4D4IiuuPHn2cirNnTf9ixbtu8G4q0nTg6cDC+Z4x1O47ueEds/A4vUGfHMY2YbZDMt+NllrO9/vMMCTskiAAEOaEmR3Ag8aVltLf/TljohcYS3sBpkKVHMYM83hGFhv7avaGN46BzT/miszk7T8fYVZgpMwZ7VV0kBVd//DTUa1BsTR/hKMbZUn3e+YmqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXp2WklCbE9kdjdMaklxd2tlZ0grTi9hY25ERlRNSnlPbHg2bXcwNVlkWklQ?=
 =?utf-8?B?b25KdkJLeVpoTVlZaGpjV2RNRHRhZ2NoQnpGQ21EbXJIcXNpMHJUQm1QVTVU?=
 =?utf-8?B?V21XVGVieExZUHlnUVFQelpRNnFPNDJ4b1dHWE1nT1FwV21XMzFwNTFnQkJD?=
 =?utf-8?B?OFdmVEhGTzdnQllTMFpjZVRLbEFCdVJUdE1XdW53ZWcrdVg1VjJjN1o2cjR4?=
 =?utf-8?B?eSsvYi9vZ3lQWUtrd0lkZjJkclhDNjFYcHdPQTVZenAxdUE2N0pLQ0l4VCt1?=
 =?utf-8?B?Tjd5K0xZWm1GU2F5WVo5VXFOSGRueEJhY2F6Rzl5RXNMWFUwNEh4NkxVdGVQ?=
 =?utf-8?B?UnRwcDd0bXZhQ3F3OS9tTm8zcFhzbW1sRUpob0J4QlRUSFdKd2JEeE5qUXhY?=
 =?utf-8?B?NHNCT1lqbXF1UDRiWEl2MkxsQ0FEWW9uVVB3S1BFcDRlS3FGZjFUQjJHREpB?=
 =?utf-8?B?SFBRVlBiWnE4alRRNW1FMWdxRVRQOVJTSFFlalYzQzF6V3NYTTJjVVU2MUpi?=
 =?utf-8?B?Y25JQ1ZkOWdjak9ZanppekY3VVN0WUkrQnVPUkpNWjh4Tnh0cmVIcmRMSUpT?=
 =?utf-8?B?VVN4SnBZZlA2azlTT3RkUklBaVREdWdLVUM3Z0ZZeU5HMUpXTjVoR0Q5SDNV?=
 =?utf-8?B?TkpSTWlRV2tRa2FDSXdHZ1VUUWphTWM2Q3ZXV29UNFRLeEgvZi9lUWFBanRx?=
 =?utf-8?B?UStOSHdNS0NGWFVrbUNxWEgwSklOMC85WGxydXY5a2ZrS0RQbEJvOXBabExP?=
 =?utf-8?B?ZFlHVTdESEQrc3ltZWRkMUR1dmY0Qi92aUhwdHhId1JDOVlkV2tyaVFYWXZF?=
 =?utf-8?B?cjFRM2hsZ3hsc0dUQ0twTUU4dnlhNXFvQnhyVjdNYTZONU1oN0l4ZkFJVzFZ?=
 =?utf-8?B?cnBoMVUyL1Z0QW85WDdZT2Y2bWtVZzF5aWpIOGxVNC9pajRjZU1TRzl5VndY?=
 =?utf-8?B?bVhBaStJSFNLNjNORlZBVjlLZFQwZVp3UUY2SzJPTncwSUZRK05qVkFVNTZr?=
 =?utf-8?B?anRXZjZpcFl2YkE1dEp2WkZRSXpnNWdnTDBkMFN4cG1WNGoySEQzYlJJWmFl?=
 =?utf-8?B?SEJzUjloVS8yZXVoL1VqN1M3VjM5bTdMaTROVlhPV2FyL0RJdUJNczB0VUJN?=
 =?utf-8?B?TE9wR05VMllFZzgxRXl4VHB5WTA5MFRjRnRqUzNvS0x6aWJjYnFodG5ySmNR?=
 =?utf-8?B?TzhRbGlvajhwV0NHTE5vNU1tVytiZXpMc250ZEFyeExFU3Z5MEJ0aDI3SW9s?=
 =?utf-8?B?Y1BpUUhac2RaOTQzME14NFE1akxRbGhxdUwxMlY2aGxNQWpPOTNBTTBuME04?=
 =?utf-8?B?Z0g0a0twS1QwT2MxL1B2Y3dFY1JwYkx0NXZ6TmVaZXpYc2JDNlF5ekVtYUJB?=
 =?utf-8?B?TWJ2Tm1MZ3g4dW92MUJKcG5qOXdMaTlGYytWRi9QRnk2WllRM0YvUkQ4R2o4?=
 =?utf-8?B?YVpPOC83K2M3d3NmbDRQTml0Q3J4VVdIekFQd1JJZC9KajZTMWttdjZlU0Ft?=
 =?utf-8?B?VTUrOHpsUmNGNmtpK2piZ1FWZWdlM0c3aStYdE9FNTY2RmJ5KzBCOXR0cktq?=
 =?utf-8?B?aVd1L01pY0FUTG1xdkNhRkVOMjZhNkc2VGs3TllNaEdwL2tXU0JwcmRVZEhh?=
 =?utf-8?B?UmxPaHZSSHozWmNhNG5LMHkwUnQ1dk02WWVQbmw1aXVCZHZLY080TVAyeG04?=
 =?utf-8?B?ek44TnY4M2g2bXF5UE9XbDlWRlcyV2paKzJ5S2gxZ1lzSDhnWk9veWZrNVF4?=
 =?utf-8?B?Y1poMllFRHlNRG9aKyt2QVprYURuMElaNUtZemhuVjNCWFI2clM4MkZSVFBx?=
 =?utf-8?B?UzJycUJURXNzQllMUXdobm9PT01FUkFaZm9YM1hxVlVlNGNuMFp4SjhRWURO?=
 =?utf-8?B?SFpDdU9xbTFGUFNJdWl0cG1MQWRjMFVCT3VTY2p3QmFuT1JBRGRtWVZuMmRE?=
 =?utf-8?B?amRPTU1IWUpVL3RldDM5VjlOdGFJcEdFM2t1NzZwLzVTQXlUUm02ckNodUxZ?=
 =?utf-8?B?d2Viclh3dEU4Tkd1MWF2cTh4cysxUCtwK2gxWEw0dDAwYnFxWDNjQmlXbVB0?=
 =?utf-8?B?b0dSUVlMcEQ1Q20rSW1WWStKNDB0cmtPOUUyQklwK1RYWC9ndzE5dUpsZVM1?=
 =?utf-8?Q?p3o5hvhm+KjwGWLRqtesoWvLW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc33eb82-e3db-42c2-995a-08dc5a30c00a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 14:07:40.8226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5N1Bw1pAkVgNxECm2dVR1JZx5Mrq5WZYNJE5ynQ9V/q8ZlydeA8MJ9lLAOkOOcGZsqqFn2e5XPpD3Km8ARN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8941

On 4/11/24 05:33, Ard Biesheuvel wrote:
> On Thu, 11 Apr 2024 at 12:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> On Thu, Apr 11, 2024 at 09:56:48AM +0000, Yao, Jiewen wrote:
>>> Please allow me to clarify what you are proposing:
>>> Do you mean in vTPM case, we extend both, but we only need TCG event log, NOT CC event log?
>>
>> Elsewhere in this thread it was mentioned that writing both vTPM and
>> RTMR events to the event log is problematic because the event log format
>> has no field to specify whenever a given event was measured to vTPM or
>> RTMR.
>>
>> If the firmware can make sure all events are measured to both vTPM and
>> RTMR the need to trace them separately goes away.
>>
>> So, yes, in case a vTPM is present the firmware would:
>>    (a) expose EFI_TCG2_PROTOCOL, measure to both vTPM + RTMR
>>    (b) not expose EFI_CC_MEASUREMENT_PROTOCOL
>>    (c) log measurements to TCG event log
>>
> 
> A TDX attestation would require the PCR to RTMR mapping used by the
> firmware in order to reconstruct the RTMR values from the TCG event
> log, but that seems feasible to me.
> 
> In any case, I think it should be the guest firmware's job to abstract
> away the difference.

Agreed, this approach seems to be the best way forward.

Thanks,
Tom
