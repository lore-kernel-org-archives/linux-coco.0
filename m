Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661233C5
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 15:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxGSHRC6ERkZ7ZQH8eeIovKmxQ3wyz4RL1NBdZ6X/I4d0iOT3DvS2q5waEih62IrajoWOPWI45TCD6PZMpsMR6Tp/0s3BvkpP2fTbyy7ReOlhM3gmDcIXfw3KQQKIYAUh2UwsrywsF+LO5fBQIaH0VtKzthBZfZpBcYj1uFQSAWf0ReAnN2MSs4YPFI6qGaMfbibzIfgFCmoJ8vd9PRIBOXvQy7GtxTOAuzb1fRfmppQmymk60OZee2X9A8JUAOzl23QpUa9kHGw0HrnKYu241sgW/z0BkNRB3dFx6OAR2Tzu8UwF2ax9burpfWyZyktrmPKj8LKiB2PGUmpSfUoHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAzJJRU0pNrpNT70wTTOrQFUnDo+ncd9ESNAhQQLL7o=;
 b=nLnadSkzPqIalqxsdCb8Hoou5FQMOuCOOB0ub12b3KgXk3TUj1EfJjvTAxkpuPxjHS+Sq1+W18szA2ERHECwCbphUh3hza/S27etC6rcXyoXBBxTkesO+vydnWF+JrtAnMP1hA8/uJac3EAsQlUbmy8s4ulg8uqRI036g8vsC/gmiKTvdCFuRlzGviaJ6KiUj2EDVhS69B4mTOb1x5b8hneZNH0PTEM7EHIfPEFQFMPsxP1d6PNUxLvR/l3M9sAhwl8F1NZX3f9FE0LtrPG/0yv63ETiTmdZjivsXQ9rB778j+fdJPVrCoDHj5J7MNOGON0gZyvwwj9T03RxdrHwbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAzJJRU0pNrpNT70wTTOrQFUnDo+ncd9ESNAhQQLL7o=;
 b=cAnpq4f9ZmxSX88hjPBP2P/hl763t9LhGXuFHyopi8BdyNj76Cbv6pdaeUQtaeNuq4RMJbekIWBtEo4iAOCnf3fRAIAfLR9a3HIMoEXGtcZ+IlJjB9UK+k+fk/BP1EQs5A+WMJd3cC06aQLcxDZeoyMbZD3r1fo3ToUO383TSyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:22b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 15:14:59 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::269b:c6f1:7b3d:f193%3]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:14:59 +0000
Message-ID: <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
Date: Thu, 13 Oct 2022 10:14:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: jejb@linux.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:610:33::9) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f7442b-6980-403d-612d-08daad2db17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DXVbXlcka3/LOWzZ1/ouvPUmoKPrc8ELJGTknKyqS3hhYa3i0LR8MLyHDTa9an8tB+9UfKfW0I+Gf2k5LtU1mOjpLo1B20SOUAl/wBzOwDex6ULlY5hCX19nU6iiRdsuO4t+eNjNy5wUcQ+QztWIeZaQQqRifEkQsEi2p584ICSdilOiRojWM5fJL7TiUNX7e9lTneJ0Ntt6ApIiscIF5yCWdKVUqKAMZaHO3QiQdAFpqWhnBFMe2rWuMMA7bVSFJQiW9+sl1HQnZ1AQdAbbtMrPPbjjK/v9MXOO1GIVwap6ow9mXRsgl/AhiGijgeEQ6bjpEagc8Km9BJJ88zJmiyL/VztgEJKlSNAAvkCqday4o3GQ/Y0n82txu+b5VaaaXgIVyQlm2+hHZoLaiUqpII1AzATNdjUJBmRZnVjBWvv+IYuCDAulxw+OJEN8pO+s+HaVSdQZRy7kwqNSCVJ2zrD1WGIdJ1j+1zRungsfBtA4H4nxwVeadG0I/bn7F9HbuCmhLmH+VcKsi9EkORT8a/qIpQLZBU+9So99pN+UZFOgTZLAVf8fn4+sBRPIuENRbTdtcuf7bwfL//ff0f0nFO1ngNPXVCZduHCI2yxcpsuTYxS4VR/asgbuuJqet+qgysbCela+irAHRUPr2+TCwKZp3x+H2mI8y4CKCh4tFFBiNJYPvhqhNGEsvItENR+HkafoxyRh/ByLhanSwQGlWsxHLD6pZT0rJVy1iqzpb1NIGX3O3CGPEaUABdwm+kNmhsx4lwy+z7xQlgA4Q1zLrsoZllXtGdZbLGkXonmeW5FBuyTiN4tHefTeNlA5x/P8N3BaLosT72oBSpAgkcTeIQA8hSIon/1d5TTqo/0jLtHrwHQ5cmI/jwCJj2fH3GUZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(6512007)(66899015)(31686004)(5660300002)(316002)(54906003)(966005)(8676002)(478600001)(6486002)(38100700002)(36756003)(53546011)(86362001)(31696002)(6506007)(66476007)(4001150100001)(186003)(3480700007)(4326008)(83380400001)(66946007)(2616005)(8936002)(2906002)(41300700001)(26005)(66556008)(7116003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnFLUCtFWkFxVkMvTWFIM2xWa1lHNmxIRmttUU9qM3FNQXFtU0ZaVkRKSnk0?=
 =?utf-8?B?VTg0c29tUjZlWTk5U2lDZXgrOFU5aHFxUXJMc0h2LzQvQWo2SG1TOGNoYW9p?=
 =?utf-8?B?UVd0VFRmcXMva0NDRjNtd09GTk9EZjZPU0FpMDFzZXRIWkVLNGdlQk5DUWxG?=
 =?utf-8?B?Wi9QMEZudkY2SnJVRG50UGc2djNUOTBxQ3FCc1ZtdHVVMnVQc3hBZnJmdEdJ?=
 =?utf-8?B?M0RsTnV2cWoydnQvSDA4cFpFblVtcWdpNys1L2p5R09zQVJvQTdVb2djQmJV?=
 =?utf-8?B?VWRLTFlvakw5VkVta2JZYXl3eEdITkprWjZ3RG9LRE8xVkJtSFYwSEdDREZv?=
 =?utf-8?B?Tkl2ZkduRTByYnRlUkZORzRWdFUxak5tWE1ZdmUwbHVQM25zV2MrSElGN1Fh?=
 =?utf-8?B?cHFjeEJHc2NmOWk4Tm5EQVdUUmI5MnlvQWlvb01oM0F5VU5qREtaMGVQQ3hF?=
 =?utf-8?B?U28zTTlXaVNyNU9WUVVuMmR0WWlsblNTNGRSVU9jcVhXb0R2T0xiZElzRVRS?=
 =?utf-8?B?aHUyOUh1ZTZlbjVkTWJxSlZTOW5wMFNuSjNJWkY2ZlQ1bWp1am5ZR0RmaHVh?=
 =?utf-8?B?dXh0eFNFekFhSEZ2N0c0L05SQ3N5dnd6M2taQlo1b3MrT0tvZE5xak1kalR3?=
 =?utf-8?B?cTBXWmhFb1Vwa2FNNjdNcVB5YUhibGlOdGovUDlyQnJ4a3dYWUZjRzViWmth?=
 =?utf-8?B?NFcyNHVVTmJON3BnRkpadGt6RWlKV2pSSjBzc3dOSTZucjRaSFdoRTJWU1dU?=
 =?utf-8?B?YWZjRlA2SVBWQ05VQTRBUmNPV0N6SWYwUnJ4OVRNbEV0eGtHeE5SQW9rV3Rq?=
 =?utf-8?B?UUlnV1YyVVY4R0pwVXZBY2V3ajVmY3FKYjNaeVp5dFRWVXZyK2dONHRnd3FO?=
 =?utf-8?B?UzBYY0E4WFpkdDYwSno3TVoxRTZiZUNsV0ZDUTJFY0t1ZWZOSklNaldTbFlp?=
 =?utf-8?B?amtPYUV2OG5rVGlJQTV1MEVnQzIzMkFTWUxJSTdSOHBSSERzakNvc2V1N0N6?=
 =?utf-8?B?QVFYYS9ZUGJBYUUyUnRFTlhLQmlIdjg5Tk8wZS9DVkRHVzR1UWJQMmIvU3RH?=
 =?utf-8?B?L25OTkE1Q25Ma20walBQbWZrOUNCN1JNTlBvUk1KNWx5UXNxVFQ1SDFOc3Ez?=
 =?utf-8?B?RElrQStmMW1hYUhGalFmTDFyWW1GN0liTTdqWkExNUVGUjAvTDJsbG9BMmV4?=
 =?utf-8?B?NkIzS0Z4ZExubTV1MDQzeVBNLzcwWUJVZDB5d0h2bFIvMHNXaXFwU2hINHI3?=
 =?utf-8?B?V2ZtdDFRcjQ3NDUrcTl1MCtCc1hjdmdxeTY3OVkyanZEUVk3QWRTcUMxYWhI?=
 =?utf-8?B?WW1kd0I4bzZWbHJiYkdINThIdGtkV0habU1aL252NkJCa25CUVRVdnRtblA1?=
 =?utf-8?B?N1U0bVJuTmg2cEl4dmJlZ2s1c1hBdTBWb1A0NmI2eTB1ZHk1YmxoM3p6YUdI?=
 =?utf-8?B?amkwdVJnUjhuYlhhS3M0RVl5emFxc3VVT3hmd05vK1JCQnJrbkpNUVRzVHg5?=
 =?utf-8?B?dEd5SmZCMTRMMUVIQ3puSVZ0cHBoYmhhckxEQ2hzSWFxSittTDI5dk41WGtX?=
 =?utf-8?B?L1haRnRvK1BWa3FGWXlZcm9CaWNBc0ZSSEJBNGtTc210T2dlWmhRdG5PeFBn?=
 =?utf-8?B?ZzVEbmkzWkpsb1hsMURuOEZhTVNGdnNEcmFFak5TYXllSU5PeGx6aTIwNnBI?=
 =?utf-8?B?YTYrZFJFS0txS3IweXorbzRMc09WUldOYXFEcTI2b1d3eWVBVmIxRVVYckdI?=
 =?utf-8?B?MGVzcHpIZDEzeGx4UUxFV2JiWHBDeUwwbW8yVmZqeFdDdnd5enFKQmNFWG5l?=
 =?utf-8?B?Q05hNGFvR3FQbXBCdGw5MHp2VWFXRzF2djlnbkxZVFpiYWZYeGorZlRselFZ?=
 =?utf-8?B?WXExUTFwbFRDL3k0Z2pWSXR0RDB6UWJoazdNOWR3bGRWWDZHZ3RJeWpsRzRt?=
 =?utf-8?B?dTRTYm5obVNNRXArS2NDZG9nQURXL05oL1BEVHNRTGdSSDcvTDZRcGlEd0FL?=
 =?utf-8?B?OHBWN1Qwby9IdEd2TUNvZDNZYmprM081QlNxYVJjTTFrZzFYM1pUcmNXYWps?=
 =?utf-8?B?bEFYYTU4VFJTR1lxTEl1aEpHWXUxaHRGaFk1K3YzTTVUMG1XOGhIa3JBV2Fr?=
 =?utf-8?Q?D7Jv5AXVXw70kKSg+iaaeE24n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f7442b-6980-403d-612d-08daad2db17b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 15:14:59.1007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZJPnLfMSDSiZPrtHEpYjYrLYghHZvPO4ZlXBU9Gl8qP/ILo5jwvORTdNZCjW1LtvPdkKygsoL/cLoe1QLbYnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360

On 10/12/22 13:44, James Bottomley wrote:
> On Wed, 2022-10-12 at 18:33 +0100, Dr. David Alan Gilbert wrote:
>> * Tom Lendacky (thomas.lendacky@amd.com) wrote:
> [...]
>>> What would an enlightened guest need from the SVSM for attestation
>>> of the SVSM/vTPM? What would a vTPM driver need to supply to an
>>> SVSM for TPM operations?
>>>
>>> For attestation, the SVSM could provide a VMPCK0 attestation
>>> report. What, if any, data should the guest supply to the SVSM to
>>> be part of the SNP attestation report data? Should this attestation
>>> request be part of the SVSM base protocol?
>>
>> I'm not quite sure what a 'VMPCK0 attestation report' is?

Right, I meant VMPL0 and that probably generated some confusion. The SVSM 
will use the VMPCK0 key for communicating with the PSP. That key is 
cleared from the guest's Secrets Page so that the guest can't use it and 
mess with the SVSM's communication path.

>> It's important that the VMPL level in the attestation report reflects
>> the side asking for the attestation; in particular one TPM story goes
>> that the firmware (in VMPL0) would ask for an attestation and the
>> attestor would return the vTPM stored state.  It's important that the
>> state could only be returned to the vTPM not the guest, so the
>> attestor would check that the VMPL level in the attestation was 0;
>> any guest attestation would have a VMPL>0 and so the attestor
>> wouldn't hand it the vTPM state.
>> Hmm or are you saying such a report would be triggered by the guest
>> rather than the firmware, but it would be protected by VMPCK0 so the
>> guest wouldn't be able to read it?

No, the VMPCK0 key is just used for communication with the PSP.

While the SVSM would request the attestation report from the PSP, the 
guest would need to request it from the SVSM.

>>
>> I think one of the vTPMs keys should be in the SNP attestation report
>> (the EK???) - I think that would allow you to attest that the vTPM
>> you're talking to is a vTPM running in an SNP protected firmware.
> 
> Traditionally the TPM identity is the public EK, so that should
> definitely be in the report.  Ideally, I think the public storage root
> key (key derived from the owner seed) should be in there two because it
> makes it easy to create keys that can only be read by the TPM (keys
> should be in the owner hierarchy which means they have to be encrypted
> to the storage seed, so we need to know what a public key corresponding
> to it is).
> 
> One wrinkle of the above is that, when provisioned, the TPM will only
> have the seeds, not the keys (the keys are derived from the seeds via a
> TPM2_CreatePrimary command).  The current TPM provisioning guidance:
> 
> https://trustedcomputinggroup.org/resource/tcg-tpm-v2-0-provisioning-guidance/
> 
> Says that the EK should be at permanent handle
> 
> 81010001
> 
> And there's an update saying that should be the RSA-2048 key and there
> should be an EC (NIST-P256) one at 81010002.  The corresponding storage
> keys should be at 81000001 and 81000002 respectively.  I think when the
> SVSM provisions the TPM, it should run TPM2_CreatePrimary for those
> four keys and put them into the persistent indexes, then insert the EC
> keys only for EK and SRK into the attestation report.

We only have 512 bits to work with for the SVSM-provided data, so would 
hashes of the keys be ok?

Thanks,
Tom

> 
> James
> 
> 
