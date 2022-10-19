Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30C42F33
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 21:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyMDQuiGbYdZjKMf8hhDw5b/kjSEHi5Ilv4jb5JO1G16EUcVJWXPfPDBs31syJ4eh/zQ59P5J9GAgIvWRz9HZIhB+lHyyUnCGy3H6uPy2JqRXZjIhYzavCtdQLGBr+Ei0fyeNpbwr5PPnM/R1udByDGvOt7YeK8Wta0M3htJOoA6E7rMNgnUOlMW1zk/c5Oetf154B7EYzPQUpCcgvqPKUi4Z8UAu2HZJ/zNSiKxpqyfq7BYurgrme9KSfj/rj3fCS/R159vig99FJ0+usRzuRxDH1Gv3m7ouHgPg6jBYXhsU5f/PIhBA4atGLeGiGL1Hf1XCfuWG9ohBvZXFkiKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Oh1MBxa4z41w80fefB/vOrzwvCJaXVLMQTvfgybeZk=;
 b=ncCQnKCj+BE3nXwbFk20a+DxjBRJPFcQzqfUAuJUKD2ikgsQx40sJ8v2RUm+q0o7IgTqGzTwAB6XRaLs7RRViyqwpmd2U1sjxSc5/DnMlr6Ee7oRj5uHcAqlz3ovobnedet26mc/fQdp/cAKlurS5kMid9HpKzjnRqf28MByVg0lz9lE8/e3pxIO1ZuoxxlVvsMBlwG15CkqXWbsiAbuteiL3lIsssAsyGz/qHV76VWRGK78fYxMvYTAMKhFaKffJcasbD4HlvLcD97CKqE3d/7h4nwpIwR6tWfEqhMRLDf53wlgaL8duR5ukvy1CvEcY16ibkqj1DIbJHVrjmnliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Oh1MBxa4z41w80fefB/vOrzwvCJaXVLMQTvfgybeZk=;
 b=bjlnKiUlQVthfdL7hDb6yfrtSEAP8Mo2C1/XTXoKhQhhNO5iV9Cp6C/5fdAzd4QI65CcDTod1B3metnj+HJO9EA0grd8OFHPRr1ztS74lWX7/ay+MiW3y4dZgwTBbg8zjEjyoygBUzvkeK7F+tFL1e/5EvmyhS7mGVkLavGp2nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DS0PR12MB7770.namprd12.prod.outlook.com (2603:10b6:8:138::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 21:58:15 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00%2]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 21:58:15 +0000
Message-ID: <b5edbfd3-79f4-99fa-bfc3-2dab44a7aef6@amd.com>
Date: Wed, 19 Oct 2022 16:58:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com>
 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
 <Y0/2D93P/xgp1sU9@redhat.com> <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <b488a79617beed8913df61186e8e263c40f2330b.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <b488a79617beed8913df61186e8e263c40f2330b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:610:b0::12) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DS0PR12MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: fd39c911-04dd-4fa3-2ff2-08dab21d05ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xeNK/Pmv7eVZbACjWmtyvbl616M0xhFoD9N5AUqtRCXey/BEikWFnqXuETADzbk0dXRYWjKfenvwCUdws8kIAIOmOjGX4IZNyapBtKTUDjqWKV/zcQhZjmVbpyyb7/sATZUWIvyvfHpX78sPGaUQSHzYXienwBbA0DHVWRk1MddThhe79++pLuw9QWtyw1UVnm8RK8w5jCsPdZOW5E+Uj/tEo293qKzC2zfjUgnXFxjwOTJJZXrBdxvq1hneqEj4/J5X+VOCxZcBVoB6nL91BViPFqJaIqd7mHi/BHWOWGntHaO5/f8DopyeZSlM4BNKw/p/EaT3MhnM4un3HAhYmeF/qWy0IItCeL87N/VKIoN1eO4fBocc0PLGOHSwXsmkRLLryderosX/8R94EGDDjJX7uTZFOneneUrVEu8wZvKKgPXOPqZCotFqXZnYSrVbzhuKHaN2dSs/CJRGfYt7NQ00kkpY93gtPCXD78krBHNSHTiVzv2gwaImeGNKDBvZDLi5SN3Nw8AwOr75DMM72vJDMlzQr5cfO7wIYR6Y2PwwgcgKYlT/lgLBxFwJ9VQUBVWWaMKCux23kdbxJsnFMJKF+8KVQXFwi7T0tD94NUAdP1guY/rri4wfeN4EgOXoMQYrE7FGDl6nJ7Y8uuEqKAKleD6jdkkz9fDJH2LraqxJs3ZX3TqPpp4t7OiNS7rfWTjjodJ6vE+P0/1NC41/Bs25Hl6gMeV/302lad51mjqSfSBNpT2XxClgZv9pzqNJzpaGtHcb85//El0TLgcArCN/v3BrEgtvD2aS7VRg1fU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(4001150100001)(5660300002)(38100700002)(6506007)(7116003)(66476007)(4326008)(66946007)(6916009)(316002)(8936002)(41300700001)(6512007)(8676002)(53546011)(26005)(66556008)(2616005)(36756003)(2906002)(186003)(31696002)(86362001)(6486002)(83380400001)(3480700007)(54906003)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlNxS1pNWXdjQm1TbElzZWFVVDZSOE5sRlRvdFd4UWtNRUpCZ1J5WlZwUzVz?=
 =?utf-8?B?aXpMQ3ZOdWFDbHd0SWIwdlBvWmFSYzRtV01FOGNCWFc1dVlUZEIzSExyMEFh?=
 =?utf-8?B?R2N4VkM0b0orRktSKzVZUWNXYVZsdFJ3dHkvRkkzN0J1NWNpc01Dci9OWFhu?=
 =?utf-8?B?YmNoK2JMSU0rcktyZDhwRGVaamRRWnlOSm9lSmxMNWtEMzY0NDBMbzRJU0NX?=
 =?utf-8?B?YmpTbGt1bjhNalVxdDdKeGxrU2ZjR0VPdGlua0UybFlRSkhHeWQ3Nm9ZSit6?=
 =?utf-8?B?ZlY5MlYwVkhPTFB6VHkyQWF0Rlhia0k0UHRpN08zbTArUTEzdnZ3bWpteTM1?=
 =?utf-8?B?UC9XS0VMNzFDSGt4NnE5WGRNdGtaWi9Vd0RlSUpkSWFHMXE5VmdIL3ozU0Zt?=
 =?utf-8?B?UjBBQ1Z5ZlVmKzFYR2hISXMvODZ4MzRIN2JqbWdweEVRN1duNERNNzZ0Tito?=
 =?utf-8?B?S2ZRKzkzNWtuMU93VlJRaWt4dFd1eXdwOVNGVzV4UWh5L1lXbHR1VUloZXFT?=
 =?utf-8?B?cFhYOUt2VVdUWW9QcEphY2JtL0wyV0puei8zQXhmeU9Hc3pOUTVFTWlDb1ZI?=
 =?utf-8?B?a09mQWhVUVNqajQ2Z0lTb3BIR1FFMitUOFdpUHdvMGFCV093ZFpSQ3orek1W?=
 =?utf-8?B?TW9EVlRqK2lpdlFEZU9FY291VEE4RlVqdGduUEpXL2hDMUgrSlhwQVFvakJO?=
 =?utf-8?B?dUNqU2hwNmY0eGNmQXB3cG40UnNjZHFkSnBzMWR5MGlzNVVhR2FFWldhanFG?=
 =?utf-8?B?b0t3SFl5S0NxVDQ4NkpqdWhWK09ySXRKN1FVYTdZQTQ4MWtRRXE1VzBMUjFl?=
 =?utf-8?B?UjhxT01GSnNQMW9RT2pyUkx1ckIzRzdxTzFBMVNsQzRvZlVtTFB6MENvdkF5?=
 =?utf-8?B?WnMwL2lsZkR1eEhvVFpnYS9IQ3JmNUlPSGJycmRJV2FCcVNrYVg4QVg3ejZ3?=
 =?utf-8?B?T2NiNG5ZWXVuRTJOa3Y1T25ES01rSysxTHVoREd1OGdyWmI0U1lGVWdtbHo0?=
 =?utf-8?B?MEF6QndFYU10NjhiV3ZyYUxCUGRzQ0NSMWpDQzI4UkhXYlg3WEhBTEZTVUJl?=
 =?utf-8?B?eGZTc2xVR2NjaUEzQitLRmVzbTVXRThoR1RQaUg2dFpyR3VPbitsbFpnZzQz?=
 =?utf-8?B?TUFjNWdGZkpMQVd0a0FIekFTUkxSTEtuUmNRM1BPTGNHS0Ywam5reGc4eHVL?=
 =?utf-8?B?MldQUzFFb25hdUI2dUVFZXI1Sm5TQjVHdm9JckYvK0dyNTdVNEpKOEwzbU9q?=
 =?utf-8?B?bmNLK2NpVU1iUDJ5aW5tbnRpMzVrNkVDMDN0N1dRY3BDTWxySUplWTkwUHJQ?=
 =?utf-8?B?YVFCZFhqZ0tQSFlzeU8yLzdXeWFtYkdQcXRJeW11NHZ3NnJGOTNhSUV3d3cw?=
 =?utf-8?B?RkdTVUppL0U3QkFocE10aVRDc0tPY2JDL3IyYVh6b1Nnc0ZJSlNIOEZvcUh1?=
 =?utf-8?B?a282NXdVcHhiUnk1ajdxSU50ekxXOVIwMWp2MmtzbXdEcWJrVW5SR0p6ZkJ3?=
 =?utf-8?B?aE5pNEFVYnJoazluQ003NjJSN2tPSGYyd1VZVUYvNmc5NG9yNEVpc2Voa2lJ?=
 =?utf-8?B?OENhYm5NUnZCYnZ3TWo2YjdGQmtraXRwZmFQdUR0c0pMZHNHQzJCTkF4cWkx?=
 =?utf-8?B?VDNxYy9wcU5IZUpQWmpjMHlzVzkvcm0vTVM2Tk90NjFwZHpPTk5xTUxFK29s?=
 =?utf-8?B?UnZJbmtTREsxSysvOVVaY0duNWx3SG00bjc3NGJhanpjaFRCdzYrVy8yRWM5?=
 =?utf-8?B?L3hwbS93cEticEJzWFZmUXF4UmRISitkcUg0V1ljZFpINmpsNkpBQ2FFZEdW?=
 =?utf-8?B?R0NUWXAxMUlBbjU4R3hlRm9iajVoZCtvNmtVYjNJVVAyS3hQeU9lUHVEWGp4?=
 =?utf-8?B?YlBESCtKS1JKSms0c1JmbUtFSS9xMUpLYUhUbEdHbmF4M0RyT2dCWnlGSW1q?=
 =?utf-8?B?eTk5NDBBY0ovWWtaOXNxcE15QnlrZFRxY0w4dWpXRDlxM2UvVjZ4SXRDaXJx?=
 =?utf-8?B?TEQwbWxvTHhNc3lPRnFtRjBSSUZOTFdxVFhEU2l1MDFRRHZESHAzcHpVK2dl?=
 =?utf-8?B?dHdPbzVDTFE1c28zKzlvVXJudlByMFQxV0F0VnE2SU9DdXg2anp4SGVvZlVC?=
 =?utf-8?Q?0tnRhXqXDCaXzvTKHBbuT7Nd5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd39c911-04dd-4fa3-2ff2-08dab21d05ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 21:58:15.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClagMEVPIt70Jc5z4zMNWxf2/t45Fj3UDi+4eSufmHVx61qEAX7Jw/poUBCtHjazupWPQgwVi+gOdsTwJ/ReuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7770

On 10/19/22 10:20, James Bottomley wrote:
> On Wed, 2022-10-19 at 09:43 -0500, Tom Lendacky wrote:
>> On 10/19/22 08:05, Daniel P. Berrangé wrote:
>>> On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
>>>> On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
>>>>> I'd be inclined to not rely on guest networking, and probably
>>>>> even strictly decouple what the SVSM does to communicate, from
>>>>> any specific attestation server connection protocol or details.
>>>>
>>>> I think we should be clear: if you need a secret at start of day,
>>>> before the guest boots, then you need to retrieve an attestation
>>>> from the SVSM and inject a secret.  If you can delay needing the
>>>> secret until after boot (say for data volumes) then you can use
>>>> the cloud standard methods we have today (which actually do
>>>> mostly operate over the guest network path) and a TPM which
>>>> manufactures on boot.
>>>>
>>>> However, the above mechanism is out of scope for the vTPM
>>>> project. This is simply about putting a vTPM into the SVSM which
>>>> appears in the guest as a TPM and providing a guest API to
>>>> retrieve its attestation. So the scope of the project ends there.
>>>>
>>>> If we want a TPM with persistent state, then the state has to be
>>>> injected pre-boot but that is the same pre-boot problem as all
>>>> secret injection.  I think there should be a separate project
>>>> working on this and we'll make sure they interlock correctly.
>>>>
>>>> So I think there are three pieces
>>>>
>>>>      1. Ephemeral vTPM with attestation retrieved from guest
>>>>      2. Attestation and injection API from SVSM to host/guest end
>>>> point
>>>>      3. SVSM API for saving TPM state
>>>>
>>>> We'll work initially on 1. Someone else can work on 2. but we'll
>>>> make
>>>> sure they fit together.  3. would be required for full TPM
>>>> emulation,
>>>> but might not be required if all we want is persistence of the
>>>> seeds of
>>>> the TPM, so this would be evaluated when we have 1+2.
>>>
>>> Yes, that all makes sense to me as a division of concepts & work.
>>
>> There was some offline talk about possibly putting the attestation
>> report in the TPM NV area and allowing it to be pulled via TPM
>> commands. However,  if we want to be able to supply a new NONCE each
>> time, I think, instead, that calls for it's own function in the SVSM
>> vTPM protocol.
>>
>> Currently, there are two functions in the vTPM protocol:
>>
>>     1. An attestation report function
>>        - Input:
>>            - NONCE GPA (RCX)
>>            - NONCE size (RDX)
>>            - Report destination GPA (R8)
>>            - Report destination size (R9)
>>        - Output:
>>            - Result code (RAX)
>>
>>        NONCE copied to SNP MSG_REPORT_REQ:REPORT_DATA[511:256].
>>
>>        SHA-256 (EK Public Key | SRK Public Key) copied to SNP
>>        MSG_REPORT_REQ:REPORT_DATA[255:0].
> 
> You still have to define *which* public key here.  Recall the TPM
> internally has a seed.  First you have to derive the public key from
> that seed.  I'd still favour using the NIST-P256 derivation of the
> public key according to the TCG template, because NIST is going to
> deprecate RSA-2048 at some point.

Right, so it will be the EC EK and EC SRK.

Do you have a pointer to the TCG template you're referring too?

> 
>>
>>        On success, the report is present at Report Destination GPA.
>>
>>        If a new way of creating REPORT_DATA is needed in the future,
>> the
>>        protocol could be extended with a new attestation report
>> function
> 
> 
> One thing we have to remember is that if we add any additional
> attestation APIs, they can't allow them ever be used to generate a
> report that looks like a vTPM attestation.  So if that's likely we'll
> need multiple types of data put into the report, should we steal a byte
> of the report data to specify what type of report (0 for TPM, 1 for the
> next type and so on).

That sounds pretty reasonable.

> 
> That way a consumer could rely on the fact that if the first byte was 0
> this must be a vTPM report and nothing else could fake it.
> 
>>     2. A vTPM operation function
>>        - Input:
>>            - Command GPA (RCX)
>>            - Command size (RDX)
>>            - Response GPA (R8)
>>            - Response size (R9)
>>        - Output:
>>            - Result code (RAX)
>>
>>        On success, the result is present at Response GPA.
>>
>>        @James Bottomley, I noticed in an earlier response that you had
>> the
>>        Response size as a possible output, is that needed? The
>> response
>>        output (header) contains the actual length of the response.
> 
> I think we can get away with just command GPA and size and put the
> response back into the command buffer, given that's the way the linux
> driver will work.  We will still need to return the response size since

But it may not be how other drivers would prefer to work. The spec has to 
be OS agnostic, so I'd prefer to keep both. The Linux driver could just 
set them to the same address.

The response has to include the tpm_header, which contains the length, 
correct? If we don't have to return the length back I'd prefer not to.

> it may be less than the command size.  I think the function definition
> will have to specify that at least a page is available for writing at
> RCX so we can cope with response size > command size.  The current ms
> tpm defines the values MAX_COMMAND_SIZE and MAX_RESPONSE_SIZE and
> they're currently hard coded to 4096, so we can rely on this value for
> a while.

Sounds good.

Thanks,
Tom

> 
> James
> 
> 
