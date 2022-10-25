Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65EE23AC
	for <linux-coco@lists.linux.dev>; Tue, 25 Oct 2022 14:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev6AoFdWM5cPEcAVeO0xGKcAXQvjPoFDSIaTcoSlBPVKNg+0aB8oE1eochc6ea+6Uaq9l+Ziyz+5VRkhVNKzCNsD646Fh0WSOq5CaCJ+zrE+vYtv6RnGspN6EQXLc+2NKX9icIOEFTev5v6wNpaIAM1GTXVWIq5MRJtyv4JHG8KIQCbiTTrja1dacACssy8zp23b8pgoC2iJJ7VpssyAhkIgwXuZCVPHwPOofGQd+0EEgDZFWPdid/rblvjxVofJnlRo+BZZmE5K9+kZhAKZmkzceJ3/HYUWfiBFAyWlzLMvZpCahgCCOX+VWkkKBtRaKhYx3JMrtU6L9dqM38Ifwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcmzkAIezDnJnxVDdUqJNLvIeqNYAZghAGkc+WR66qM=;
 b=S2NTR8BwKu9nvGSAIeD78TZry64jlmjqjfAdQOKbX12bKlT9K9Xb1vPTtJmmnkT0dxRq8etlw8KzvDc6oYupnicPVD1U5FUUFJqoyKylbyROG6tSD8X8wl38WpEfdTpWBsFUJ91B4S0Z/nYnirG0ze3SD/DboV6f9Daiwg3Ps/yc9Xk84Oqhdin3JXsKYwtk/hTHBJBfH+ruqYTJjXSW88YSgwE7ASiTHdsdJ+LR+cC+zMV18sR75IhbJsyO+rgVonhE69RYlyBoDuFMmHRi2L/pkAfLRwrAxzZ04xYII7t5V0a9iCEE7nLPHaY1TJzGDrE3pON6nd9sOgm9yj3GJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcmzkAIezDnJnxVDdUqJNLvIeqNYAZghAGkc+WR66qM=;
 b=Fu6x/WmykAVuID5kinbPsKdkWjQPzCup/jNzOqPqO4f8iIy7jVHzsBPyhfWD9rAYyVTE9N9xyT/ne11tXcXixaS7HYIrxRADRsvfaSlNVHJkM1gASEaFWAWPl2gksLol65Z5CnJPmtJOqBcIK0ypK6gWSG9Ds5pu0tI2sp719s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 14:08:19 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00%2]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 14:08:19 +0000
Message-ID: <efca01ad-ba39-3bf3-633e-7442b8429358@amd.com>
Date: Tue, 25 Oct 2022 09:08:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Christophe de Dinechin <cdupontd@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jon Lange <jlange@microsoft.com>, James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Altobelli <David.Altobelli@microsoft.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y1ZwJvNvky6Wst7k@work-vm>
 <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
 <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com>
 <e4a13b17-7317-dd49-d203-cf149e2d5eb4@linux.ibm.com>
 <m2bkq0i67q.fsf@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <m2bkq0i67q.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::27) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f874273-13f0-410b-060b-08dab6925e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q18D3L5vo+VOdFqArWulo24j6ayQm+Ig89fr6igQEQAB8Yb69Qom4dmyHTTv5wp6cf0Fp9ImjmBrPsoXotH4lGiIXZoIcldCl2HimZja1Swa71/kmP33ib5iYVz4HdIPjDyo0PGsWzoBUGN33N46bBu/e+0/7UF05RkwN9B9XI01fL36ilko5KfAx67vP4r0QvsgGbKkd7wai3M3bc7f3kXCt9WKm+nCNrOyxf2KBLCxN31qJqLt3bhTPDHTKMoSEWDiASszLstMggI8abs5OupzjFsJByl3+ovb/cbpd7JspNLroAaBlb0bTkd6aB9/SVXC6RlkheUgZLxB7GE5v4LtyPQybeTeEtTfkq0xKzvuI25pynp4tcxyOIGSDF6+QqqfvdaNB8Tldz3ujJ3kRIe4DS+Nu9PBloVZAlewOOPSTvmZXa9MUtzKr+bOEWhWsY2Dq2HE531RS/rE0vvMKyDoYOMpfsZa3JxiE6NcASir97iTRDTqDDPfpeEDzDkGZ7cdqfPfHkUGVmw5GtEwaLiwDD7FfUyXZ5ORP9ZLsYbMc2uHsH3KM1tX22CLe7LpL1NJwdoPDMO573oita5ykgI8IvByX41hSKxGEwoKXf8P6O6jhi2x7G4Ne13Atmkz4SiUD8I8I7pk6q2d6n/6Hr2kO8/8oxuy+5OiHr8/6ObM15/8bkzDhV9d/hgsqBpifbpIrIareyiaxwPOH1qpBXWdrT40wqMJJYFm+yQimxGuv1V2jtyJrIdAfHIUmpkJFqz7HSRxw0UBZfVmtV2ffnaMZEQVEL9ZV9ilptPvXRtBPRmFCVKuK6AXXk+t3GOkyUBButh4XBlG2tPfKV0Qhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199015)(66556008)(6506007)(66476007)(66946007)(8676002)(4326008)(6512007)(4001150100001)(36756003)(7116003)(8936002)(53546011)(41300700001)(26005)(5660300002)(38100700002)(316002)(54906003)(86362001)(3480700007)(110136005)(31696002)(83380400001)(186003)(30864003)(2616005)(478600001)(2906002)(45080400002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFViMXVycS91bHFTUGUvQUczWko5ekxPWW1pM0JNOVlEYmxnMGRQL00yUE1j?=
 =?utf-8?B?YmIrVkJ4UjNHTSt0NmZFQ21CTVkwckdXVUpmODdJUDBUZDBTWUxYanFkZVNL?=
 =?utf-8?B?VmJlZDV0VnNBSU5zcnE3ZklBTWhLUVoyM29OazVVRE9jWjNTUlJGVEE4WE5w?=
 =?utf-8?B?YzY2STNwamlOL00wYTZpeEhQdTlSVjUxU1RtY0tTVmZnZzRKdklPZkxicjMx?=
 =?utf-8?B?TENoTXp6TVFjbFEzNUtheHNCUC9ZYUxQSndKTitqVitQMy9sWnZRVkxjMFZ4?=
 =?utf-8?B?cHQ4TVFqem4zOVpZQ0tVY1d5Wk9qUWU2NmRHNTlmT01Ec1g5NDRjdnFyNWJP?=
 =?utf-8?B?SW03QmtLRG5nblFLNWxyR3NzanJWRHJDb3FqOHRSL2d5cmNrRit2ckdhUTlt?=
 =?utf-8?B?TUYySFhOYWYvMTZyeUhaMnRHTGE3L20rQTZxL2dUT0loNDJjMUtFdUxGbzlm?=
 =?utf-8?B?MUFsVEVuYmtDR29GQ2o0bFZtRHJlVkcyQlFKeDhZclJ4ZDRjMWdmWFJpdmcz?=
 =?utf-8?B?eHB2aXd3SVU5VS9zQlFxTjlJZFJGNkpXbHBFOWc2alRVeGR6WjVzblhHTkxI?=
 =?utf-8?B?S083RlVMWUIxREtTdW9LS3FubWtKcVJQaUZWcEthRXRXd012NktJSHN1bnhY?=
 =?utf-8?B?TjdUaEh3UlpUbEJtdFlucVhLdGZ4MmRRbFVLWjZKVmw3SU9GMkxYZlpvZFo4?=
 =?utf-8?B?T2o0aStmWEhjYXdJNE1IaW83UDRQVCs1UlNFbml3YWc2VUQwYnZ3cXZHUGx0?=
 =?utf-8?B?SzQwVHFHblRFZU84NDduSytScjVIeXdwUUk3SzZTQy9YMjVDRFM4aG5Ta2J2?=
 =?utf-8?B?ZlNSeEpQbFRXWTBpL3RZdzMxckhRWHJJNmxTN1RobTJNZ0NZY0tCUCtwd09H?=
 =?utf-8?B?Z2FqQ0hUUjMxYlBXVlFzV3lnVVhhS01RU09ma3hySUVaN1RlZm02SE53YklY?=
 =?utf-8?B?QXVoWDRWUVV3eXR5T2wxYjJIV0w3cnBrTjdkSVlRdzNyMXEyN2hpeFQrVmN6?=
 =?utf-8?B?anhFcDhjUUdHcG1ZR1MxYVZxejdEdVZHS00xYWtxam5HVGU3RG9NWmV2TS9F?=
 =?utf-8?B?MDM5K0tBV0JTQzdLSkFjVUIwczR2MmJaelJUbTdESUlmcXkzS2VrREZMbkFH?=
 =?utf-8?B?cXlXWGQ3d0ViNkJhYkR4dDZ1cWp1ajlqNnJIZVpmck1hMXVzcTcwdDFOTjZ2?=
 =?utf-8?B?SVdFUmcwUlZLaTNzeEJwMjU5eXQxak1FYXVqTG9EVlFUMFlKZGJMcmlZeUdS?=
 =?utf-8?B?cFJ5b00rTDhDSmd5SXlUYjNpNXA3ZmxQMzY4ZG9wNmRiYUpOVk5HQVVya3Aw?=
 =?utf-8?B?aG9SY2trWGovb0V1TG9lYjF0eCtMSnQ0K01wU3FkMzNOZ2ErTzFHYUt3cG5B?=
 =?utf-8?B?VEszdmppUG90SVRNYUVwd2Q2SG52TjU3MDFMMGQ5a2FmSVZJWS96QlRKa1Fp?=
 =?utf-8?B?SFovRVpWQXZQUUFwTTBUN2tFU2RmdUd4ZjJzZXM3MHJPNFpsVW04R05LaVNU?=
 =?utf-8?B?cWdxRy9xRlExM3ZRZjA4NzlsY21JQldwV2IvSzdzVUwzZ0FHT2hVTlcrZndn?=
 =?utf-8?B?UkNIRDZUaUVHaWRFb2FoOUU0cWFJUllQU0Fwczg3UlpxaXlZZHMxQlQ5VzlJ?=
 =?utf-8?B?d2liS2pZTHJmOVcxeEU4TTFtYVdoaUhpamJIeG5yV0Z6bEZEdUdKYVlFdlJU?=
 =?utf-8?B?QklFRDAwNlM1a0EzWlYyT1VjUVArUFBMWWFJSkhPbEF3eUE2ai9mOEFPVVFZ?=
 =?utf-8?B?dmN4K2pEaEtOWWZoV214bTVQMmhaVnk1MWdRWU9Bc1Uyb0xCalZVUXlZeFdK?=
 =?utf-8?B?YnRudGw5SzRzSTBwcllxY0lnWDNKd0hvSFlyVEkrOEIyazRYdnVsVjcrcEZO?=
 =?utf-8?B?QXJNVkYxVG5xY3BIbkxQUm5ibkJPRjZTa3hQV01peGU1dFF6L3ppcDdkTnFE?=
 =?utf-8?B?dVd3R1BmS0k5Si96amNkSTdhbUt6UElkcFAvdCtKNEJ3VURYNHh4RXpPbjhE?=
 =?utf-8?B?Y004NytidWdBZ2tzV1o5SlUzcWlzWG9Sa1B6TzV4WEtFTkJMOE1qNGlNZHVT?=
 =?utf-8?B?bTQrdSsyQlhVaWU0d1l6OXV3NCtucUsyMkJBSlZMZnF0RnNPS2RKOHl6VFow?=
 =?utf-8?Q?kAV052UbwCJ//KinkmMmrpxIz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f874273-13f0-410b-060b-08dab6925e4d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:08:19.1495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEShZ/b3tYph/fcQtOgCmu8U6XVrqm0zFZEFcThrligwxQtbPSIlqOveQjoiY89hD1e0NN4tpltMvzaUPSMUbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197

On 10/25/22 04:43, Christophe de Dinechin wrote:
> 
> On 2022-10-25 at 11:51 +03, Dov Murik <dovmurik@linux.ibm.com> wrote...
>> On 24/10/2022 22:02, Tom Lendacky wrote:
>>> On 10/24/22 06:45, Dov Murik wrote:
>>>>
>>>>
>>>> On 24/10/2022 13:59, Dr. David Alan Gilbert wrote:
>>>>> * Jon Lange (jlange@microsoft.com) wrote:
>>>>>> The drawback to having an identifier-prefixed document is that it
>>>>>> necessarily restricts each report to providing only a single
>>>>>> statement from a single SVSM protocol.  If, in the future, we find
>>>>>> it is common for a relying party to require, say, five different
>>>>>> protocol statements, this imposes a requirement to obtain five
>>>>>> separate reports.  This means a minimum of five round trips from the
>>>>>> SVSM to the PSP, which seems undesirable.  I think we will really
>>>>>> want to invest in defining an extensible format that can be placed
>>>>>> into a single report.  I'm not claiming that JSON is the only option
>>>>>> here, but I think we will regret any format that prevents extension
>>>>>> within a single report.
>>>>>
>>>>> Having something structured does seem to me better than tacking a magic
>>>>> byte on.
>>>>> (Although as I remember, the SNP report already contains a flag saying
>>>>> which VMPL level the request was generated from; whether that's enough
>>>>> to discriminate between guest requests, and requests by the firmware
>>>>> I don't know).
>>>>>
>>>>
>>>> The VMPL level is not enough to distinguish between different reports
>>>> which all originate from the SVSM (for example, let's say we have an
>>>> SVSM-vTPM report and an SVSM-migration-helper report).
>>>>
>>>> I think that the two options presented here are:
>>>>
>>>> 1. SNP REPORT_DATA = type_byte + nonce + sha256(extra_data) [James]. The
>>>> meaning/format of extra_data depends on type_byte.  For now we design
>>>> just for vtpm (type_byte=0x00).  In the future, adding more info (like
>>>> migration-helper report) will use new type_byte values (0x01, ...).
>>>>
>>>> 2. SNP REPORT_DATA = nonce + sha256(extra_data) [Jon]. extra_data is a
>>>> JSON document which may contain a vtpm section, a migration-helper
>>>> section.  In the future, we can add more info but adding sections to
>>>> this JSON document.
>>>
>>> If I understand this method correctly, the input would be a JSON
>>> document requesting certain elements (a one-to-one relationship or a
>>> one-to-many?) and their values be used in generating an output JSON
>>> document, correct?
>>>
>>> That would mean parsing the input document in the SVSM. The SVSM would
>>> return an error on improper documents. What about unidentified fields,
>>> would those just be returned with null for their values or not included
>>> in the output document?
>>
>>
>> You mention "input document" -- who would provide it?
> 
> In the migration-helper case, the migration helper data would not originate
> from the SVSM itself, would it? So I guess it would have to be provided,
> presumably in JSON form.
> 
> In other words, I think long term, the SVSM would need to parse _some_
> input, but this is a problem we can defer until we actually need it. For the
> first iteration, we can certainly generate the “base” JSON entirely from the
> SVSM. I think both statements are true irrespective of the approach chosen.
> 
> But Dov's question points to more than just parsing. If the SVSM were to
> hold information such as migration helper data, we then have to think about
> storage in the SVSM, e.g. what is maximum size of migration helper data.
> Or alternatively, formulate the interface in such a way that it's the
> caller's responsiblity to provide "fill-in-the-blanks" JSON data with space
> for the vTPM data, in which case we are back to having to parse JSON input.
> 
> I tend to agree that we'd better think about this scenario ahead of time,
> just to make sure we can cover it properly in both approaches.

Agreed.

> 
> 
>>
>> Actually, it is my understanding that SVSM itself *generates* the JSON
>> document:

That is my understanding as well.

>>
>> 1. Guest calls SVSM protocol GENERATE_ATTESTATION_REPORT(nonce=ABC123).
>> 2. SVSM generates JSON document:
>>
>> {
>>    "svsm-info-version": 1,
>>    "vtpm": {
>>      "pub_ek": "ABC123",
>>      "pub_srk": "DEF456"
>>    },
>>    "migration-helper": {
>>      "pub_transport_key": "GHI789"
>>    }
>> }

I was thinking that the guest would request the attestation report with 
the data it wants, e.g., just vTPM data. IIUC, you're thinking the output 
document would be everything the SVSM knows about from an attestation 
point of view.

In the above version, while the vTPM data would be pretty static, some of 
the other data could change and, given the same nonce, you could get 
different hashes. I guess it doesn't matter as long as you can take the 
output data and validate the hash and then extract the data you want.

>>
>> 3. SVSM requests PSP SNP attestation report with
>>     REPORT_DATA = nonce || SHA256(json_doc)
>> 4. SVSM returns signed_attestation_report + json_doc + cert_chain to
>>     guest.
>>
>>
>> So I don't see the need for *parsing* JSON (or CBOR, per Dionna's
>> suggestion) inside the SVSM.

And I guess as long as the output document is provided that can be 
verified against the hash, then canonicalizing of the JSON is really not 
needed.

Thanks,
Tom

>>
>>
>> -Dov
>>
>>
>>>
>>>>
>>>>
>>>> (please correct me if I didn't get your suggestions)
>>>>
>>>>
>>>> In both approaches, when the guest asks for the report from the SVSM, it
>>>> will receive:
>>>>
>>>> 1. The SNP VMPL0 attestation report (~3KB)
>>>> 2. The extra_data in plaintext (for vtpm: just two public keys, <1KB)
>>>> 3. The certs chain from the host (<10KB)
>>>
>>> I do like the idea to provide a JSON type input document from the start
>>> so that extending attestation reports in the future is easy and
>>> consistent. I would imagine that it wouldn't take much, from a vTPM
>>> perspective, to create a JSON string as input for generating the report.
>>>
>>> If we go this route, the attestation request likely should be part of
>>> the core protocol.
>>>
>>> And by providing the output document in the response, it should be
>>> pretty easy to recreate the hash.
>>>
>>> Having said that, JSON can be represented a number of ways and so
>>> canonicalizing the output would be necessary. I found RFC 8785
>>> (https://www.rfc-editor.org/info/rfc8785) but I'm not sure it's truly a
>>> standard. Are there any better document formats that would be better?
>>>
>>> Thanks,
>>> Tom
>>>
>>>>
>>>>
>>>> -Dov
>>>>
>>>>
>>>>>> I'm having a hard time understanding any scenario that involves an
>>>>>> entity that has access both to an SNP report and the vTPM and which
>>>>>> also needs to verify the report.  If the objective is for the guest
>>>>>> (which has access to the vTPM) to obtain the TPM's endorsement key,
>>>>>> then it could obtain it directly via the vTPM protocol without
>>>>>> requiring the SNP report.  After all, the vTPM SVSM protocol does
>>>>>> not need to be limited to providing exactly the functionality of the
>>>>>> vTPM command set, but can also include other utilities that are
>>>>>> useful to the guest.  If the objective is for an external party to
>>>>>> obtain information about the vTPM, then it doesn't have access to
>>>>>> the vTPM anyway and will have to rely solely on what's in the report.
>>>>>
>>>>>> If the vTPM endorsement key is rooted to a well-known certificate,
>>>>>> then the TPM certificate can be provided directly by the guest
>>>>>> without relying on any SNP report (in exactly the same way that
>>>>>> physical TPMs do not rely on a separate hardware root of trust to
>>>>>> authenticate them).  Can you shed some light on scenarios in which
>>>>>> you think the guest has no choice but to compare the SNP report and
>>>>>> the vTPM state to verify that they match?
>>>>>
>>>>> I think that depends on the lifetime of the keys, and who manages them.
>>>>> If you're in a cloud environment where something apparently trusted is
>>>>> managing the state of your vTPMs, you might be able to do what you say;
>>>>> but then you still need a mechanism somewhere to get the SNP state
>>>>> to the trusted entity that then provides your vTPM state before anything
>>>>> in the guest uses the vTPM stored state.
>>>>>
>>>>> I think the argument is that if you used an ephemeral set of vTPM state,
>>>>> then at any time after boot you could provide a combined vTPM+SNP
>>>>> attestation report to a third party who would do the normal TPM
>>>>> validation and then do the SNP validation.  That avoids the need for
>>>>> magically loading state from some trusted entity in the firmware.
>>>>>
>>>>> Dave
>>>>>
>>>>>>
>>>>>> -Jon
>>>>>>
>>>>>> -----Original Message-----
>>>>>> From: James Bottomley <jejb@linux.ibm.com>
>>>>>> Sent: Friday, October 21, 2022 6:04 AM
>>>>>> To: Jon Lange <jlange@microsoft.com>; David Altobelli
>>>>>> <David.Altobelli@microsoft.com>; Steve Rutherford
>>>>>> <srutherford@google.com>
>>>>>> Cc: Daniel P. Berrangé <berrange@redhat.com>; Christophe de Dinechin
>>>>>> <cdupontd@redhat.com>; linux-coco@lists.linux.dev;
>>>>>> amd-sev-snp@lists.suse.com
>>>>>> Subject: [EXTERNAL] RE: SVSM vTPM specification
>>>>>>
>>>>>> On Fri, 2022-10-21 at 00:02 +0000, Jon Lange wrote:
>>>>>>> Surely the primary value of a document hash is to prove its
>>>>>>> authenticity, not to determine whether two documents reflect identical
>>>>>>> information.  I understand your concern that two "canonical"
>>>>>>> representations of the same data may result in different JSON
>>>>>>> encodings and therefore produce different hashes, but as long as each
>>>>>>> document can be authenticated by its hash, does it really matter if
>>>>>>> the hashes of the two documents are different?
>>>>>>
>>>>>> If you only have an AMD-SNP attestation report and access to the
>>>>>> vTPM, you have to query the TPM properties then construct and hash
>>>>>> the document yourself to verify the report.  I sometimes think half
>>>>>> the history of security protocol implementation consists of one
>>>>>> engineer struggling to reproduce the hash created and signed by
>>>>>> another, which is why I have a preference for it being exactly
>>>>>> specified and simple.
>>>>>>
>>>>>>> There is a ton of discussion here about vTPM because it's an important
>>>>>>> problem, and it is valuable to recognize that a vTPM implementation
>>>>>>> will likely require some sort of SVSM-issued document to describe that
>>>>>>> vTPM.  There's no reason to back away from defining the structure of
>>>>>>> such an SVSM-issued document.  But we should also expect that in the
>>>>>>> next 2-3 years, we're going to invent other valuable functionality
>>>>>>> that an SVSM can implement that will also require the SVSM to issue
>>>>>>> some sort of authenticated statement.  If we marry the SVSM report
>>>>>>> information to a vTPM, then it's going to be really hard to add that
>>>>>>> new functionality, and if we don't anticipate the need for
>>>>>>> extensibility, then we're going to wind up in a future where an SVSM
>>>>>>> will issue different kinds of authenticated information (vTPM on one
>>>>>>> hand and new feature on the other) and the relying party won't be able
>>>>>>> to know which is which.  I don't see how we can avoid the problem of
>>>>>>> defining an extensible document schema now that we can extend in the
>>>>>>> future as the role of the SVSM expands.  JSON is an extremely
>>>>>>> attractive syntax for such a schema - certainly much more so than XML,
>>>>>>> and also likely to fare much better than any binary standard.
>>>>>>
>>>>>> Allowing the relying party to know what type of authentication was
>>>>>> why I proposed a type prefix to the guest data in the report.  The
>>>>>> reason I like the type in the guest data and not the hash is so the
>>>>>> bare report is self identifying even if it costs us a byte or two of
>>>>>> the nonce.
>>>>>>
>>>>>> There are 2^32-1 possible SVSM protocols, so nothing in the above
>>>>>> precludes adding a json based hash call if a need arises (or indeed
>>>>>> many other binary/json/xml ones if that's what people prefer).
>>>>>>
>>>>>> James
>>>>>>
>>>>>>
>>>>
> 
> 
> --
> Cheers,
> Christophe de Dinechin (https://c3d.github.io/)
> Theory of Incomplete Measurements (https://c3d.github.io/TIM)
> 
