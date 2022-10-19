Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724132F33
	for <linux-coco@lists.linux.dev>; Wed, 19 Oct 2022 22:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnS4tjRRvxTqLfduNyDxc83eJE/lNnrk7lvNvMK2GxXRCM5i0nSe2JEwi+R1eymiHT/eAD/G7psUX5pwk/MldhSq5paua2ohE1zD4cH5HB96iqpVXmg+ApTDm6nC1d4gP2etYv834wGBqFavOR6xonH1DV+WuJEDPzJ4jL7MeHVHgoUkfLoF7QS/fIfYFlyZHUarS+1SIVjoXrecheOVJgK0RcNC4GtsxXVBgK4fBKYZGjTkssRFC7MrELE0h5ICjHn2xM94msGI4NfU+vF3LXhQ9v/GIpj78pAZCuEpwpEFQzBX0G/lDDLjPjrd5qlMzbnopD+4ldKKG1KDYYXx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFdqezsb+XOM00lBOkqy9u0dnmmCcU27lEEzkprEhHg=;
 b=lLDzyyHsl5PXpI6ol7n7Qjspu71+AVKcf5LoBh+POWphrFHF0yfd5bBLqGUFpdmepdhdlSjpNeHVt6ExXVkfxxHIqgDUogLsHYI64CTD73o3ZjP4LXBcrjjl/Q1UlQjYEyuvKSRx/XRvZGxSRxRENmzwufOW8+ORhHh0ghXDMDr72jBSV4AwAFGs4AFS1H6HG8HtIHEgrKW72vt45gIAsBeTGk1+JNWhThMLtrG0uBJieraBNxuwyUB6ER8Y3HmKymlskyEEJY+vtLBmuExQJsF9hSSG/yJ6OfGlryMqnpNUnvw+VrVX3LuP0xRl+8D2TfBiL64HmTCe4ExJDt0BcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFdqezsb+XOM00lBOkqy9u0dnmmCcU27lEEzkprEhHg=;
 b=Pplga7DMR+IlsQWhnpPJXGsXRkU7Iiax5YZHGXMYzQgbiWdjWnS6lG/YL14J3EdrerwK9Cg1hfD9mcqDGeCX4dkDIwJDxl3RGUMLQhrx9TcJzpkTKHCArD93S13lxVgryAqJohqh+5mNAqZSpCzXexyf9SMrVbPdRUKNY/bvnwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 22:05:00 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::4da8:e3eb:20eb:f00%2]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 22:04:59 +0000
Message-ID: <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
Date: Wed, 19 Oct 2022 17:04:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: SVSM vTPM specification
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>
Cc: Christophe de Dinechin <cdupontd@redhat.com>,
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
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::15) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 69168b23-9cc2-4632-6e43-08dab21df705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KXqCEJTo5Cnq/V1u5dbGI13a81GXFPAsRY99jhzNDC6lsISNbrjpsXBBxqWuWPl6LkhWoyD5phqCIKURuw6leJYX3Ifqesr4kUPt6ikW75DmHA5PCY6qtYuDDmO1FYq4fYWt/cQfEJvtgzaSmSXVDkdVqjuMKFidDk45exvSmNmWOBpt7CF+XcotI40M9wdYgpndZQrUlRJOUba5ptgpEjqIyB/ruQ00H9/7sm2tviZzv6OHZfHDiCmARqGNnf0DPIJOVNcP/IINIv2kXi1bQTLqL3Fs8gcs5+K706MHPlyZNIPaj0iTJTt8xE1nGLCsd352s10tTVobC15bG0H1PnRrwat/1SLC3RASXlv3blts/jNyK9iHCkUpbHa+PyoauAIeYTwIqOrOUtLCCi/JTlKtraJRXIqBZscjUZo+1/Am242AAcL1xFdky+Qlq5917/GjwmSB4nMVqeN+Qr0vX2BOjdx4AAnzf2w9XNnzrbOUZnXJdng1Lvou5WrO/cm4NAzqDWtl/fP/FCWPwetroHc+DAODRUIPqKyqBc3zwqI+ck91cfFJ3PgzsfFzz9bHpSvNYCoOzWP7nMYZEneTrw4L4ucSLhkxhzsmCgVmEa0bfWntOjHjunSoSPdn2Wgf54Q6Yo6BtjjovFtKOIk3HdLY3TinWrlgnSWUK5W3IUCr0tC4RCIzI69EUWEOMJ3erSPFda35KpqNHx0y63acq2B/WnPZ2SN/LB9IyjXdlIUGki+HQ1bD4fKRtgk/tBqq/NMHBpkgaG5PDMtIW+kPcTnEB4tK/kd2pzfiTOFFFYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(186003)(4001150100001)(2906002)(83380400001)(31696002)(36756003)(3480700007)(38100700002)(31686004)(86362001)(54906003)(6486002)(6506007)(110136005)(5660300002)(7116003)(41300700001)(53546011)(316002)(478600001)(66476007)(26005)(8936002)(2616005)(6512007)(66556008)(8676002)(66946007)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blcweFV5WlF5QlhkMGdYaGtBZ3RNb3hJdEt6QVR5OEhsblVibkh3UGRqcGRC?=
 =?utf-8?B?T3JaYzUrVmtVY2JUNG5OTFZnbTJMdnBSaGo2N0V6WHJkbEQ2WE0yRm5ReHNl?=
 =?utf-8?B?WGxobkJKT2MxS1VuYko1d2t3UWVNei9kYnFkRGdtM29pNXg3ZjRJdzFHcU1J?=
 =?utf-8?B?ekpienVNMWkrVlNPNHNCVlFVbFpIMXN4WHNzdm9MaStPam42emVBRjdQeW5T?=
 =?utf-8?B?Uzd1cW0yRHNmU3BHWm5PNzA3K2N6ZjBVYzdIdjRqWU9WSWNwcUx5U3UyRmNi?=
 =?utf-8?B?dVNFU2tvbnlVcVA4dG5aNmFjMGtNTm8vRk00UDZMbnJjb1hZOTlldCtOWlln?=
 =?utf-8?B?bTg3amdaYlJSaThpU1lXYXh6Mk1EZ2tPMmxRT2lzNTVWb2VOdVE5akpOckVT?=
 =?utf-8?B?K2I3ZWtiUHgweEw5bm01UEo3c0trT1EyK002bkYzREorMzIvZzNOaGtUNTlF?=
 =?utf-8?B?RGhmNkUwUjZGVkc2Q2R5V2hPc09rS1RaMXloOUhBN0lySDY5RmlKcDJNYWxn?=
 =?utf-8?B?d2ZRYTA4U240Z0w0TlIxT0ZqTS9sbE52S045djhFM3RtTGNUdktpZHBQMGh0?=
 =?utf-8?B?UEtoQ3J5dEJ4dGM4Z1ZHMXFRcVRYYXFJK2hoUHc1bWJYQVBReTJLcytjcjRF?=
 =?utf-8?B?T2NPS3dUaFZyTzNLTUwrbmVXTkhmcmFHT0p5MldlcDBvcEJHQlJ4eU5XSGFE?=
 =?utf-8?B?TTB1azM1Tlo4QzFyY2YwU0w4Y2NKenhpYjFBd1dTWmYyd0NqcWJnT1pjU3Fi?=
 =?utf-8?B?bk5aK3RXZUpMc0RNOU9VN3hIaFFqRnM5L1lJUHJac09JR1o3MEhuR09tWlpI?=
 =?utf-8?B?YXMzc3ZHRFpXZHVqdHltQkNyb2Q4RTZuUm51eWRGQXlSTTl4dm12VWpFeHdY?=
 =?utf-8?B?NHZnUTdoVmhIZzhHMlBoaVEzZzZYNDFkU3dmaWEreVNjNkVndUZBQWZsL2lG?=
 =?utf-8?B?MVlCbGFHQkcyRytUNkV3YzF3L1RVYU5pMlhWa2I5VVNpQWlQT0lBMk5LZzFh?=
 =?utf-8?B?cHhtcGpmRmlCcy95WWNZdTdjRHhFUlRaVEYxTmVXQ3NFbm5PV1BFQVhOc2Nh?=
 =?utf-8?B?SWhUcGJhcnRDRUI0WGlYWFZoZlM5QWVzaFI3UTZuYno2MjR1U2hrOUlheXN0?=
 =?utf-8?B?Y2RoNjV2T0pHbEVvNHB0Z01rSlBkWHE4OGo2Njh0SWxnT2VmMlVPSk1EU2kx?=
 =?utf-8?B?emZRT0hoMytiazZlVFNTQ0x5bmVyaEtXWkZYYkJGQitoalY1dVV5TStyamFG?=
 =?utf-8?B?SzJydCtLL2lhbmdjdXRweU5TV1lxSmxqUWlTVEw5YWJuNGVYdUdpWXYySklo?=
 =?utf-8?B?b2FBMTRlZ0syWWdwblpJcFF6VXh4dnc2VlVEMUxxcExsVTFKbGx2dXcrZ1N2?=
 =?utf-8?B?RHlkSkVGYysyK056L01UajlWcGhpL3hCNWtlRU5ScWpEOWlEVXY0ekw3bW9i?=
 =?utf-8?B?S08vbWMzTnRIZkRkemZyeUl6UUJmWGQ0bDZRSVJqYjBMT2RTVE5kUFl3OTFP?=
 =?utf-8?B?dmo3NVBEMlRtRVUwT0ZGSXcxR2xzL0dNY21CTHNQYkM2enVKdTlCR2tSTUhO?=
 =?utf-8?B?bDhzZ0YyTEIwWGxWeUI3VXNoTFlHa3QxRUNsMFRRWkwzdG51ckxlUDdHdXVn?=
 =?utf-8?B?Ym5CMlVyQ0c0eElMNTB6QUw3dWpjdUNST0cvUDBXc1V1dHlSamZkb3hjUzFX?=
 =?utf-8?B?MG5mQ1hlVi9ReGZnY25tQzNSOVhpUnloRTl4REZGZC8vSG9ScW5GbVVPcnhp?=
 =?utf-8?B?MGdjZDRjSEJGZmRjUmZoMmlqWXlqMUp5Yjk0WDMzQmMvc1U2czRvSVIzaHhy?=
 =?utf-8?B?bHNTWUVSaUt3NU1ibC95UlpmRzR2TUZWNGZmT1JpRHBzTzJDQ2xtelRNaGRQ?=
 =?utf-8?B?YVZLdCszbnVuaWpzOTVyc3RCKytpTGJSRmRPSFA5d3d2LzNxdGd0aFdRZzlK?=
 =?utf-8?B?SmxCaG5acTJHYmtRS0ZuWEJta2pRaTRFc0NIVWQ0VHFFRXNZYmp1M1VzS3R2?=
 =?utf-8?B?R2srb2N6Q2hOeURqeDZNQWdVaXJ0aklMTkRQUExNYk1tQmdBWWJSTjQvWWZt?=
 =?utf-8?B?azZUVGZsdWRIOFgrNWxzYzIzdENvRCs5WENnUkFvb0NDcldqWFplSlFKcjVB?=
 =?utf-8?Q?UqHSxL+7Og6l2zLqTAVRn8qH/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69168b23-9cc2-4632-6e43-08dab21df705
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 22:04:59.5563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4o55JmYIcX9yfLBtMbZUFiLLeUpp0OACfcafOpDaKBOALeRKrqMCQ/33uqirdPbcAbm3WO+TylogdNlT4jRRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609

On 10/19/22 15:57, Dov Murik wrote:
> 
> 
> On 19/10/2022 17:43, Tom Lendacky wrote:
>> On 10/19/22 08:05, Daniel P. Berrangé wrote:
>>> On Wed, Oct 19, 2022 at 08:38:19AM -0400, James Bottomley wrote:
>>>> On Wed, 2022-10-19 at 09:08 +0100, Daniel P. Berrangé wrote:
>>>>> I'd be inclined to not rely on guest networking, and probably even
>>>>> strictly decouple what the SVSM does to communicate, from any
>>>>> specific attestation server connection protocol or details.
>>>>
>>>> I think we should be clear: if you need a secret at start of day,
>>>> before the guest boots, then you need to retrieve an attestation from
>>>> the SVSM and inject a secret.  If you can delay needing the secret
>>>> until after boot (say for data volumes) then you can use the cloud
>>>> standard methods we have today (which actually do mostly operate over
>>>> the guest network path) and a TPM which manufactures on boot.
>>>>
>>>> However, the above mechanism is out of scope for the vTPM project.
>>>> This is simply about putting a vTPM into the SVSM which appears in the
>>>> guest as a TPM and providing a guest API to retrieve its attestation.
>>>> So the scope of the project ends there.
>>>>
>>>> If we want a TPM with persistent state, then the state has to be
>>>> injected pre-boot but that is the same pre-boot problem as all secret
>>>> injection.  I think there should be a separate project working on this
>>>> and we'll make sure they interlock correctly.
>>>>
>>>> So I think there are three pieces
>>>>
>>>>      1. Ephemeral vTPM with attestation retrieved from guest
>>>>      2. Attestation and injection API from SVSM to host/guest end point
>>>>      3. SVSM API for saving TPM state
>>>>
>>>> We'll work initially on 1. Someone else can work on 2. but we'll make
>>>> sure they fit together.  3. would be required for full TPM emulation,
>>>> but might not be required if all we want is persistence of the seeds of
>>>> the TPM, so this would be evaluated when we have 1+2.
>>>
>>> Yes, that all makes sense to me as a division of concepts & work.
>>
>> There was some offline talk about possibly putting the attestation
>> report in the TPM NV area and allowing it to be pulled via TPM commands.
>> However, if we want to be able to supply a new NONCE each time, I think,
>> instead, that calls for it's own function in the SVSM vTPM protocol.
>>
>> Currently, there are two functions in the vTPM protocol:
>>
>>    1. An attestation report function
>>       - Input:
>>           - NONCE GPA (RCX)
>>           - NONCE size (RDX)
> 
> NONCE size must be 32 (bytes)?
> or 31 if we use the initial type byte (See below).
> 
>>           - Report destination GPA (R8)
>>           - Report destination size (R9)
>>       - Output:
>>           - Result code (RAX)
>>
>>       NONCE copied to SNP MSG_REPORT_REQ:REPORT_DATA[511:256].
> 
> James suggested:
> 
> [511:504] - type byte 0x00 = vtpm attestation report
> [503:256] - 31 bytes nonce

Sound good.

> 
>>
>>       SHA-256 (EK Public Key | SRK Public Key) copied to SNP
>>       MSG_REPORT_REQ:REPORT_DATA[255:0].
>>
>>       On success, the report is present at Report Destination GPA.
>>
>>       If a new way of creating REPORT_DATA is needed in the future, the
>>       protocol could be extended with a new attestation report function
>>       (following the SVSM Core Protocol design of being additive).
> 
> 
> It's just a bit weird that the SNP attestation report function is part
> of the vTPM protocol; but I guess that it is needed so we can
> distinguish it from other future types of attestation reports (with
> James's suggested "type" byte, which must never be user-controlled; it
> must be set inside the SVSM).
> 
> 
> 
> Hmm, do we need also something like SNP_GET_EXT_REPORT which also
> returns the cert-chain stored in the host kernel? Or modify this call to
> also return the certs?

Yes, good catch. I believe we do. Adding two more parameters (maybe change 
this to a struct now?) for Cert Data GPA and Cert Data size is the way to 
go. We want the Cert Data that is associated with the attestation report 
that was generated, in an "atomic" way. Once live migration is available, 
the VM could theoretically be migrated in between two functions calls and 
then the VCEK wouldn't match.

Thanks,
Tom

> 
> 
> 
>>
>>    2. A vTPM operation function
>>       - Input:
>>           - Command GPA (RCX)
>>           - Command size (RDX)
>>           - Response GPA (R8)
>>           - Response size (R9)
>>       - Output:
>>           - Result code (RAX)
>>
>>       On success, the result is present at Response GPA.
>>
>>       @James Bottomley, I noticed in an earlier response that you had the
>>       Response size as a possible output, is that needed? The response
>>       output (header) contains the actual length of the response.
>>
>> Are there any other functions that are needed?
>>
> 
> Looks good to me.  I think this is what we have in our prototype as well.
> 
> (But see my thought about equivalent of SNP_GET_EXT_REPORT.)
> 
> -Dov
