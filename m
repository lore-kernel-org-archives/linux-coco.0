Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053F468B
	for <linux-coco@lists.linux.dev>; Mon, 24 Oct 2022 19:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5KYfZwtfcKixKjLgBFoEfVIxRCwjvYwhZ2sKkOcJzy4dhwp3gx6+OZ0SzP9OiVJKqWTCiSx7Coc2npt8Lzg4S9Gpz7RHHbPJqSdmPXo75dcGdIi2vIdbUPOJcdKsoLZ7mDR3YJ5QG3vAu9QDj6A1q65CY/rBG27bnyLoalzv2jGpCoaI5JswGUzXDCcu6x4XIWOaTpqyhAXElz9gdE0OWiyW3e1Bs8sRO32sDzLg0liWckxluLLvvR3golj28jN1MHr2ceTj9B6/Q+77bJILxToFE7tqWoDqDpK4dyX9af4JDKGNStXcxZTe1bouaYcwMcaP/EnXfEBFlRvqcFPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw+zgudyBBwOW9BDcFqOkC2Sr7ThyE+vIXC5kSNyOgs=;
 b=QJrOgtsEwC9NzX5aHClEkNEgy9pA00vKLWVjyF41eYBWjGyIzBXWUGYZ5/Ry9ZS/nn0Vf89o03B51j/CTHCFePl54nhacojRBv/gS3TUsLzj7dXrU3/YeGulK2KQPrmLnMQD95M7F+UtChv/E1SjVi+4cOsVpG+NJdhyXlkiTMWQ3DWNuYdPXSPf+eB/h6gl27HYAsHqYsJMCx9qIKdeVMyaCg4moxMz3jqLr8bGBMhh79SZ9VrFlgQHDKeq7X/qEfp2Jgb/1qt/KMOChiUzBx2vSu1UYcKe45rk03dGBfc9B0GSe5za0Eo/K3LQEhjZ7F7aawRnrP7PzsbOgH8grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw+zgudyBBwOW9BDcFqOkC2Sr7ThyE+vIXC5kSNyOgs=;
 b=strJd6vA5LCyFg5p3RPyWdW52F9NDsa5sm+p4ZHC3AwH1vOPOTbjZKTVbKQfb0BFoL7WzdZIulTTM+iWWuKTqvIxs6oQHw9eEinWqjL5CNv0fmYvEBBtuetLCgjTffSmxbbRnjhduXVDrlGppORKyDpHFHh2kiQK0la6Dy9TpZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 19:02:34 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00%2]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 19:02:33 +0000
Message-ID: <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com>
Date: Mon, 24 Oct 2022 14:02:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jon Lange <jlange@microsoft.com>, James Bottomley <jejb@linux.ibm.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Altobelli <David.Altobelli@microsoft.com>,
 Christophe de Dinechin <cdupontd@redhat.com>,
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
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:610:cd::11) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 0def90fb-faa6-4359-7af5-08dab5f24edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bBy4HauzFL3QlbEbIfxmiDBNRIef2rA4rct2m+3OBqMb4jMNp3HSP6C9Fnblp6bwKxe2aeZdf54zZPOfbv34mJu+yuNP6osowfj3F7XDMTqgOQSRIKO3CYmS4mzFn/Frtl2FAIIsJFIaG3+C/ABqUruOuC4nNvVsm5Ua0tLE/D6yMmMpQiFSx7cYAtzeEcmVOyApK69i+lNggy7hseQ1u7zdGLmS9W5lnxfu7hKiIrMxf/y8L9rjKbL4EKLS9zthfy1JXSlNZlSrNDgJwDgKVlYHfSFhr09FW6KOs6fj6aTzEeAjtlkJIO0AJUOV6YNVLjhodClNg7TEiF9TI17jC46ES3GV5dr9WGknEQPvXchiuxWH3XrmTWrAEVt0lw5ycu7J8oBckpw7mHrMNtBLV5fDz0GF7UXIfO/24SyN9Mc3ezEAM3Jrwd7bSNLLl1J2bkuOe4HY8lH2h9+8nfhSAIgYy2qE+rXBBrhdTkp4C6g71WbWBkWmBSCA+0OCO/BxNM2Iw3X3HL0HbvbXZ3DGGLn9GT1wd/V1oNLKnp2T0iIhr8//yjh/EWFB8Qm0HcMnxrutQunydJhgZH8gt5LjnJ2vj6LrjwuHB1L7GfMPjIQyDN1jsp/9duzNii59Idy6+VJu3I6U22wH+wpP8LHGIUn9T3dI2qPmziqPX/xnH5qNvgDMxqVc6TyQ/sms4NkVZTIsGGLE54MW61ZmIqqgMkuKmpgAoeA9xziWmKYcfeutwQyBLi7LLPVNo/x/r9sM+TwnxBpbkrIwIjlbiuUlurM2O7hNaGOiOwF7JnZHfIp7giqSmjMIxdCGM1TCUz+eeKA0h52lYM4thNqqYsYz5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(83380400001)(3480700007)(53546011)(6486002)(6506007)(8936002)(2906002)(5660300002)(31696002)(31686004)(86362001)(26005)(186003)(2616005)(6512007)(478600001)(41300700001)(7116003)(38100700002)(36756003)(66476007)(4001150100001)(8676002)(4326008)(54906003)(316002)(66946007)(45080400002)(66556008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmQ2THZYTkwyVFVDa2E2Z3NQMVhYNUhJNFJjcFQ4VFNYSzJvc295UVA0ZzQ1?=
 =?utf-8?B?MCtFcXNYQ2lKS0FaQlZ3NXhrMDJvejZpTk81bFEvb2pNV01JRFFGWXF1bXpX?=
 =?utf-8?B?ZkNWVG1BbXpkakh4RkszNnlIRnFiMWVwcDRXMUtPNmZFSlFTbGpsTWxLanJa?=
 =?utf-8?B?YWhoUU1iT2J1STl1ZGdhR3RiV2R2d001UVc1V0hOc3lIU2M2NnVMVTZQaWlU?=
 =?utf-8?B?Y3pxUGROMEJxZnRVUHY2SitxdWtZVGc0VnlEV1ZiOVJEZ1B1LzdPSXRVTTBN?=
 =?utf-8?B?OUw5T2JOcGZVQnNLOXJEdnJvRGIvMlF0VVNYaU1XSWNSb0dhSGgwOVI4WURF?=
 =?utf-8?B?YWVTSEp3QjNmeWFXU3BIWGcrb3BSVjBOaVg0dXJmSkRqeGhibHJTU1Z1OCth?=
 =?utf-8?B?OFlKYW9ncjV4S2haS0M4U1JnVVlFRmRTYlltaHI0YlhUUDArSjJkZWxwUVB2?=
 =?utf-8?B?eG9UQ1hjOW5oZlgwRDBYbVZRTGcwQU1uWmxPdEtUdTFNN21uQWJ5VW5peW1C?=
 =?utf-8?B?Q1pYU2QrcStnQlZmelZSbUtPSXBsZ2xjQ1loanYxMFd2SkcxaVA3V1c2M3lE?=
 =?utf-8?B?emxuaFk5WitHOFB5bzhLblJaNm1xRjQ5c1BDQ01xM3A3eEw5OXlLZVR2UnND?=
 =?utf-8?B?Y05ibldnbW1PcnIzVEs2TEZkUmhodENGdXdqNlR0T3dPT3hIQzJubzM4dm5R?=
 =?utf-8?B?M21DN0Q5MXduMXo0Zmo5OVU1N0tjV2hDQ1hMbjZwZnhmeHFjTStWOGJwWjZX?=
 =?utf-8?B?Y0RMWnhtaWN6M0RReTBQcjJxaFpzOW1sNUlFcmpkTWVSdk5wS3NPR00rckFw?=
 =?utf-8?B?U25nV0d4Ky9heHgyazRmczFXalA4Rk1LZzNUZnF2QTVzaXpjelhPbDM1Nkhk?=
 =?utf-8?B?SmJhNkxLMUM2akZ2V3lQc3JPa2czTHN6czdqUUhtVUlIUjd1djJubXpkSXUw?=
 =?utf-8?B?RTBHWUh5TVU3L1BRcERZSDc0eC9hcDlLQW1scytIZ0lPTjhrY005S2oxZ1VY?=
 =?utf-8?B?TjlyS1BlWmFQVFN5eEpQQjhSdlZZaUJXeEhkMndWb3RkT2hpYnZxc0w4cUNP?=
 =?utf-8?B?YjU4U05WQUtBYk5WNlVJOXNGNDlZSFl6c3BZVHRuY05DeVd1aHhHb29pb29t?=
 =?utf-8?B?dHlybDRpcE5GQzJkQytnMUlxYytBSWlsVTNramFjU3gzNGROaDdIeW1KWFl6?=
 =?utf-8?B?Ny9BZkpvOGpWazhjT2ZleDRiZkpsRW1nUlVqRXRiQWpuTnNZaHEwU1VhU21U?=
 =?utf-8?B?VlYrRnAvYTdXcURsQ3FFZG04cmJpY1BPbmRoWmd3R3VSZEc4SFl1ZGVxakFj?=
 =?utf-8?B?b3B4L2F1MUlNTTl0UEtKTE92bHhsMjhHS1BBeXZ4NEd6S2dvTHFCMjJLalNN?=
 =?utf-8?B?aVZzNmFtaXE3YVRDRlBsZWdLOTJVQkJZY0w4UmFyM1J6V0hhdnZhT1RiYVcz?=
 =?utf-8?B?dW5VU2NnbWgwOXFoYVprWUNqc2FnV2dCL1pMaG9zS05GS3lTb2NlRXVlaDdH?=
 =?utf-8?B?NVB0Nmtjb2FSUFZFQUxWRnZPbEQwMlRjNEU2SzFHWnl0ZWpuMzVyL2NsRnlX?=
 =?utf-8?B?RDlGNWlSYVluSkxxTmgybVE5SEJtREhjai94dytGS1RrRlJyWnNjUUZ5cmkv?=
 =?utf-8?B?dWVYQmh3NG5oR0g3RzFncWtNUHF3RXl5WFdvNDkwMEI5ekNZNm5MZXV1VHBD?=
 =?utf-8?B?cmZJaHNjd0srRlRvK3ROZGNVVHBHMHVxeVRpZjl5ekhyRjdPQ0tXVUI3WHBt?=
 =?utf-8?B?UEVheFhQY3lVN1p2SVRlRGFUL3ZlL3JCS0p1RVc0R0NpUm5sUWt2dktiZTM0?=
 =?utf-8?B?RThvQjV0cktsaDVxUHlPbk9WZGtxS3I1Y2ZHNFc5QVB3c013bzk2TlA5S2Iw?=
 =?utf-8?B?OGhpUG9yMU1WWXBvTTQzYS9FcGl5SkMzcEY4L0VaaVZVcUQwcnZndWxzaWFQ?=
 =?utf-8?B?WDBzOFFBK1Zla3RvcC9zYnQyWDU2dVp6NDRYMUZQYk5BMFBEbjFhMC93NWlK?=
 =?utf-8?B?RkdRTHliOG4vRytEd2toK1pqcTFiZSt4ak9rMUhxTG5yRVhQTTNsb2doYzVH?=
 =?utf-8?B?eExKa1pnSlBoRTdrNnVrcnk5cWNySGREVHFKTWtnZDBFWnE0MXdEcmNLODds?=
 =?utf-8?Q?J+JHdgCeJO9ftDgaKLB9JlaIW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0def90fb-faa6-4359-7af5-08dab5f24edd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:02:33.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ1kv86Y81zR6AsFJkX/S3m6PIPu3rRdeTxoMUfeb7R2NQYhEF0nnqeXHy7rCdKr3CwVuuGqjqiGBNvpwyo6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608

On 10/24/22 06:45, Dov Murik wrote:
> 
> 
> On 24/10/2022 13:59, Dr. David Alan Gilbert wrote:
>> * Jon Lange (jlange@microsoft.com) wrote:
>>> The drawback to having an identifier-prefixed document is that it necessarily restricts each report to providing only a single statement from a single SVSM protocol.  If, in the future, we find it is common for a relying party to require, say, five different protocol statements, this imposes a requirement to obtain five separate reports.  This means a minimum of five round trips from the SVSM to the PSP, which seems undesirable.  I think we will really want to invest in defining an extensible format that can be placed into a single report.  I'm not claiming that JSON is the only option here, but I think we will regret any format that prevents extension within a single report.
>>
>> Having something structured does seem to me better than tacking a magic
>> byte on.
>> (Although as I remember, the SNP report already contains a flag saying
>> which VMPL level the request was generated from; whether that's enough
>> to discriminate between guest requests, and requests by the firmware
>> I don't know).
>>
> 
> The VMPL level is not enough to distinguish between different reports
> which all originate from the SVSM (for example, let's say we have an
> SVSM-vTPM report and an SVSM-migration-helper report).
> 
> I think that the two options presented here are:
> 
> 1. SNP REPORT_DATA = type_byte + nonce + sha256(extra_data) [James]. The
> meaning/format of extra_data depends on type_byte.  For now we design
> just for vtpm (type_byte=0x00).  In the future, adding more info (like
> migration-helper report) will use new type_byte values (0x01, ...).
> 
> 2. SNP REPORT_DATA = nonce + sha256(extra_data) [Jon]. extra_data is a
> JSON document which may contain a vtpm section, a migration-helper
> section.  In the future, we can add more info but adding sections to
> this JSON document.

If I understand this method correctly, the input would be a JSON document 
requesting certain elements (a one-to-one relationship or a one-to-many?) 
and their values be used in generating an output JSON document, correct?

That would mean parsing the input document in the SVSM. The SVSM would 
return an error on improper documents. What about unidentified fields, 
would those just be returned with null for their values or not included in 
the output document?

> 
> 
> (please correct me if I didn't get your suggestions)
> 
> 
> In both approaches, when the guest asks for the report from the SVSM, it
> will receive:
> 
> 1. The SNP VMPL0 attestation report (~3KB)
> 2. The extra_data in plaintext (for vtpm: just two public keys, <1KB)
> 3. The certs chain from the host (<10KB)

I do like the idea to provide a JSON type input document from the start so 
that extending attestation reports in the future is easy and consistent. I 
would imagine that it wouldn't take much, from a vTPM perspective, to 
create a JSON string as input for generating the report.

If we go this route, the attestation request likely should be part of the 
core protocol.

And by providing the output document in the response, it should be pretty 
easy to recreate the hash.

Having said that, JSON can be represented a number of ways and so 
canonicalizing the output would be necessary. I found RFC 8785 
(https://www.rfc-editor.org/info/rfc8785) but I'm not sure it's truly a 
standard. Are there any better document formats that would be better?

Thanks,
Tom

> 
> 
> -Dov
> 
> 
>>> I'm having a hard time understanding any scenario that involves an entity that has access both to an SNP report and the vTPM and which also needs to verify the report.  If the objective is for the guest (which has access to the vTPM) to obtain the TPM's endorsement key, then it could obtain it directly via the vTPM protocol without requiring the SNP report.  After all, the vTPM SVSM protocol does not need to be limited to providing exactly the functionality of the vTPM command set, but can also include other utilities that are useful to the guest.  If the objective is for an external party to obtain information about the vTPM, then it doesn't have access to the vTPM anyway and will have to rely solely on what's in the report.
>>
>>> If the vTPM endorsement key is rooted to a well-known certificate,
>>> then the TPM certificate can be provided directly by the guest without relying on any SNP report (in exactly the same way that physical TPMs do not rely on a separate hardware root of trust to authenticate them).  Can you shed some light on scenarios in which you think the guest has no choice but to compare the SNP report and the vTPM state to verify that they match?
>>
>> I think that depends on the lifetime of the keys, and who manages them.
>> If you're in a cloud environment where something apparently trusted is
>> managing the state of your vTPMs, you might be able to do what you say;
>> but then you still need a mechanism somewhere to get the SNP state
>> to the trusted entity that then provides your vTPM state before anything
>> in the guest uses the vTPM stored state.
>>
>> I think the argument is that if you used an ephemeral set of vTPM state,
>> then at any time after boot you could provide a combined vTPM+SNP
>> attestation report to a third party who would do the normal TPM
>> validation and then do the SNP validation.  That avoids the need for
>> magically loading state from some trusted entity in the firmware.
>>
>> Dave
>>
>>>
>>> -Jon
>>>
>>> -----Original Message-----
>>> From: James Bottomley <jejb@linux.ibm.com>
>>> Sent: Friday, October 21, 2022 6:04 AM
>>> To: Jon Lange <jlange@microsoft.com>; David Altobelli <David.Altobelli@microsoft.com>; Steve Rutherford <srutherford@google.com>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>; Christophe de Dinechin <cdupontd@redhat.com>; linux-coco@lists.linux.dev; amd-sev-snp@lists.suse.com
>>> Subject: [EXTERNAL] RE: SVSM vTPM specification
>>>
>>> On Fri, 2022-10-21 at 00:02 +0000, Jon Lange wrote:
>>>> Surely the primary value of a document hash is to prove its
>>>> authenticity, not to determine whether two documents reflect identical
>>>> information.  I understand your concern that two "canonical"
>>>> representations of the same data may result in different JSON
>>>> encodings and therefore produce different hashes, but as long as each
>>>> document can be authenticated by its hash, does it really matter if
>>>> the hashes of the two documents are different?
>>>
>>> If you only have an AMD-SNP attestation report and access to the vTPM, you have to query the TPM properties then construct and hash the document yourself to verify the report.  I sometimes think half the history of security protocol implementation consists of one engineer struggling to reproduce the hash created and signed by another, which is why I have a preference for it being exactly specified and simple.
>>>
>>>> There is a ton of discussion here about vTPM because it's an important
>>>> problem, and it is valuable to recognize that a vTPM implementation
>>>> will likely require some sort of SVSM-issued document to describe that
>>>> vTPM.  There's no reason to back away from defining the structure of
>>>> such an SVSM-issued document.  But we should also expect that in the
>>>> next 2-3 years, we're going to invent other valuable functionality
>>>> that an SVSM can implement that will also require the SVSM to issue
>>>> some sort of authenticated statement.  If we marry the SVSM report
>>>> information to a vTPM, then it's going to be really hard to add that
>>>> new functionality, and if we don't anticipate the need for
>>>> extensibility, then we're going to wind up in a future where an SVSM
>>>> will issue different kinds of authenticated information (vTPM on one
>>>> hand and new feature on the other) and the relying party won't be able
>>>> to know which is which.  I don't see how we can avoid the problem of
>>>> defining an extensible document schema now that we can extend in the
>>>> future as the role of the SVSM expands.  JSON is an extremely
>>>> attractive syntax for such a schema - certainly much more so than XML,
>>>> and also likely to fare much better than any binary standard.
>>>
>>> Allowing the relying party to know what type of authentication was why I proposed a type prefix to the guest data in the report.  The reason I like the type in the guest data and not the hash is so the bare report is self identifying even if it costs us a byte or two of the nonce.
>>>
>>> There are 2^32-1 possible SVSM protocols, so nothing in the above precludes adding a json based hash call if a need arises (or indeed many other binary/json/xml ones if that's what people prefer).
>>>
>>> James
>>>
>>>
> 
