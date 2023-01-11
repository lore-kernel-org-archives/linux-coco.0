Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF917EA
	for <linux-coco@lists.linux.dev>; Wed, 11 Jan 2023 23:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZxEeggeIV+r1C1tKWOgVoqrJaau/WpuAUZaIlnTNQLIOSB0RVjhUnzCGd9fERDufcYuD+nrZdDoUj7ey4rB4h9gLoscq6inQFkL/uN4T/BVz70NZov29t+kXju/PWL5sNymmYFNulTmu6l5klPUfI8sMZPEkpgUMF1/kvV19V67eXx3AE8M18+cyV7obVAFSk3w4E8R+Ntzx3s7IN97M9jCaMtANSyq1cXiFZ/DFLGdqAdVbaodL1xolFbO84gdVrgwAIKUZhTaSGyfhhd7eTsX9Apk+6+VTFLUAWJRdmr3Nuc1csF2CFWIORrPtc0AodRpVmP1FpV5G2kXkOAMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4K/pEeYNlPNF/ZlijR0I5eoYJY+Zrqtlk0a1LPF0uM=;
 b=NKE19mGTngsgib0xIaAWG0FtAc9rT7o/13iKZ3L1x28qp/nXov2tNO81TbVssPjc2jGtrNJqsRA7nv4vBniQD4LMyHE/1ibzHmyar45YF33j1c7mB/7Ukk1LLkRABmgMHI8VE44BBmCxho5XkgGNtVH0oJ7UxOkVb0tAiZUJtBj6M0UADAnWgpswfXf/5S+mJb+gryopLPdrsJvSSMh+7tQmTnPem+q2YTe67zAe/hd1zWbjFaRMKBlPgMmWvQ6b8ztce94ELOFGYnxJEIIXL5pyVUijCFx1+ED2j049zsnDSeRkh4rH8J2HQuYBu3TVZY9K2jiDGeccYNhcST30OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4K/pEeYNlPNF/ZlijR0I5eoYJY+Zrqtlk0a1LPF0uM=;
 b=ziq3tqrWKCKunphdHyTHY3IwluGsK7S+s7Fg8P2jIE4+XZvkBBxxg6KX0KsDO5UGWqwsFpbMNO6xI44Bk8nZEvLH6PQInMzZLtxA5ueuXwxUn5Jvea2mrd8tHAAzdrm39/IoctX7BnXApmLY17Xudmphy2nG15DroUcF8VT45no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5342.namprd12.prod.outlook.com (2603:10b6:5:39f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 23:00:40 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 23:00:38 +0000
Message-ID: <0f9ff5ac-d62a-b1aa-44c9-cd9de9351267@amd.com>
Date: Wed, 11 Jan 2023 17:00:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: Christophe de Dinechin <dinechin@redhat.com>,
 Jon Lange <jlange@microsoft.com>, James Bottomley <jejb@linux.ibm.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <m2tu0wrjv0.fsf@redhat.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <m2tu0wrjv0.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:610:4f::39) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DM4PR12MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 874cf3d5-bc58-4868-1ce1-08daf427a800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e6BvX4nvyRFkXx6IwafTFCbTHl3VvKb0Foe5sMy4L8TAQkJlQJsgENze2rYzWfjKRgdArMb8G0/8uuPVxwnVofTyB9qPgj9n84nHQYUt+EvPJlRFBoz4figP2uIrwFRBhWnBzkD68QnS0hGW6dgm8w9dRkR9+m10pVvX0nhKXhPbr3lF2os5orajTSHk8RW8wqh97tXjPBzHlcYMBYOlWUiRm1QFEL3BB7AMmM2Vjvw6T6TuKfAtWVS1F83qzKiAehTrEE49CQmpoDp+D2IV88UCWC1we6gGea2aIzWj8U/7hWAhlsPLoETvi6JTlGbH35ZRnRad6udpenn/ZWXYP1KCk516MkWXy1qaDiRMcdt4G2b9grgO0CZm3iXyJv5LMFrk5QqTno5GiECiDDGZTzby7i0e9THZJJ8p4hHD6s5Aqy8VTau9KdaonpBqbBv9+3R6fAgyiYfQbD+NXSGoDTyA/6FVfu7OBX3f5+UX7G8GmuSxk0pnmkETkxDucqiQBO6xzWrlSmThGgU5qW3MHcTr7x8E0Gifg6PF5k78wM0ZZtiWtWBllUHyET3OLI1whHGICM5OcJm6LVnilbx5RgPDVU9oGSsrPctxo9+0/odyEVMgNWae+pMTPVlj08RrKwnCtrAaLodBEFKJ6OBv88LrWYrmfhuap9bvpLaRpMO+1FdEy3wU/dGEfGZObKjUSVqP9gG4L2LOSPUyyxweHPCED3Oq7FHZQ9N/NCOinnQeU2KIgsuyOe9UrgI1CSrTHB4AZ4//Lf4ycSdw43Cc9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(30864003)(316002)(26005)(5660300002)(186003)(6512007)(6486002)(478600001)(2616005)(41300700001)(66574015)(31696002)(66556008)(66946007)(66476007)(54906003)(4326008)(8676002)(110136005)(8936002)(83380400001)(36756003)(86362001)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TENHa2N3NVFodnJxVkhhSHdHL1Q4dHpWbjJzdVE5WFhiQUZwTFdaTmVjcFZM?=
 =?utf-8?B?eUw5Y3VJcCtGVXZGZzU4Qlc4SlZMdVFmcWZPb1BtaE42SDB6bnJoRjBNNWhP?=
 =?utf-8?B?emRhTFdreGVpcjRZQUNQRWQ5S2IrRnRQalFhTk1SckxxZWhvRHZoOUJkNW16?=
 =?utf-8?B?RC9zcmpVOGFIaHdoVEdTdkovMGdzdTY3blNsQ0dVSVppWFBYV0tueXNpeGhs?=
 =?utf-8?B?YWZ5T2MyT0JEYTlUbC9vN3hIYXpRTUVpejk0azBSNzNCb2RFNkhEaEt1S1Y2?=
 =?utf-8?B?azI5amJhQlQzSldKUVIwZWVtZWxQYmVDM29jdDJ0K09TaHJMY1IxSjQ1QmdH?=
 =?utf-8?B?WVJxejBJNkErZDNOeCs2cUROYkl0a3lxdm01a0ovcGtBdGZBM2hBUTB0WlZl?=
 =?utf-8?B?KzhUYWJHbmNKQWpvKzdncU9nc05wZVNrSi9YM0JhcElaT1o0bzdRQzZ6UitM?=
 =?utf-8?B?bkFGTG1UaThxYnpMVVZGV1BNN2grK1o0bXdMVThtOW02L2xOYmUvYmRXdVpp?=
 =?utf-8?B?Y2ZmRzZJb0VxQ3h5ZTNEZUNqejFFS09IOU9vc0MvL0pXd3p2UklMemVjQkRt?=
 =?utf-8?B?Y2dKN1pxZlIwM3VQSWlsZk5IQUhObkJqakJOTVdBSWloODlhRzBVbnR6STBh?=
 =?utf-8?B?NCszY3psckxwL1VmUlRUK21sdWVTa3FNU3l1M0xMQ29td2lrelpDNS9SWU5r?=
 =?utf-8?B?dXhaeXBMOFRUeHBxZ1NoaytoY2ZieThUcVo1Y1lyUGQ3ZUxYaUFYMGVqTXF4?=
 =?utf-8?B?RWdEYlo4NWZRT3lBNGYvR2U1VVFQMFdvZkZubEFoWFJaaDczOE1tRVhEa1R5?=
 =?utf-8?B?ZGgxYnRIQWUyN2xJejhqRWdEcDVCc2VjMjd0MWdtU3NOMkdlakordmp6UExE?=
 =?utf-8?B?SDExUlJ5L2Vhc0JqMEJORXRLaGNHNWZ6U1Q5a2Zmd1krRjBKdUIvVnJwbVFV?=
 =?utf-8?B?UEZ1V0xDbFU2QUI1aC91RlFNMnYyUkVJVUhHTi9YK1l3ZGVsVXprbFNGcWJU?=
 =?utf-8?B?dDFpWWJ1YzROTitvci9sRHMyK0dDZThiUDNaTmlnWHh6OEIyd1g0VFF3bVhN?=
 =?utf-8?B?Y1IxN0R0aDVPQnhkbUpwOTVsc1NhNmZscVpXUVhrZjJwbWxjWC9tMENycTM4?=
 =?utf-8?B?Rmp4c0ZrcHRBSGhUOFZKNjNHM3Q1U0ZqQXJPU2x2RUhSeGs2SDZNeFkwT0kz?=
 =?utf-8?B?N3I0U2ROTk9DR3d2bmxIZXFBN2V5K2xWS0VTVXJkNlo1U3p5RElHN3N0elZh?=
 =?utf-8?B?YnVPZUJTRlQrWWcyMS9mWktVNU50S1lzSmp0c1k2clRXYUtoVDBQY3VEWVdi?=
 =?utf-8?B?RlNOdEpLRkRiNGVMQUVZbUxzRllaQ05UMkl1TC9CS05KYlBHVy9QdnFjN2hR?=
 =?utf-8?B?bGM3cnRRZk5BRnIvV2E2ODFDU3RGMDdIT1dzZjUrSHh2N3RSZlFBRUxsSjJI?=
 =?utf-8?B?VDkrWjJ6M25GM3Q0N3pKRWVPenBLZXM1NW5WLzRDTVgybmR1SnorVzlnUi9E?=
 =?utf-8?B?UUdJRXNCdWNKUWJzMGhqczl1MEdzTVd0dG03aVJZY2VoT3huZ28vTjNScFg2?=
 =?utf-8?B?Q05wWithc3ZYK1J1dCt2SHIzdEtRK2ZibWxPQ2ZmaXFnaS9IYklJSUJ3bGJu?=
 =?utf-8?B?UC90bDYwaVR5TkNpWHVqaWxZT0RCOEJrZjg2aDVJMUYxY3g5VDZkWEpKNmpD?=
 =?utf-8?B?dGVSK1p1VTJWek5yd0x6dnUyaFhJNGo5SHBpVVgvbnFyVkZIUUtKd1JNT0Z5?=
 =?utf-8?B?bit1c2NuUFE0UnpEM24yNzJUMm9LUHM3ZmdpT3BXT280bG4xZzVWVldXVlg3?=
 =?utf-8?B?M0syQkdKa3BsZkpXb0wzanloNW94WkVTeGdnQ21mTW41anZwOW15SThRb2lm?=
 =?utf-8?B?RXRHU3A4dk45d094OEkrN2l4MGpraSsvZ2ljdkY5NnZDQWRvNmpFemlxUTln?=
 =?utf-8?B?VG93aWxSV1d6NzFWOWNwd1ZmeVdCQzZuZnBvczBXZzVIa0xkWXhmYlkzYVM2?=
 =?utf-8?B?VXkzM3N2aStCL0wvaHRIcUx1YWZyV3RVOUV4OWpoME50Rkl2azJTVHNEVTBt?=
 =?utf-8?B?d0NocnUzRTJvZmltNUY1MHBOTUJwTWg1ZU9OVzBiT3ZraUJuRkdlZkp6aHJL?=
 =?utf-8?Q?Pm1tQyUAsKEtq8pa6smNHJaah?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874cf3d5-bc58-4868-1ce1-08daf427a800
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 23:00:38.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL2AqBDFNdmUn4nFtVtQ0BtAY9qRxbNSSicdCSsYawyBJ6tDxWxZOcilB+TqZEYHiHKP3CDIT0IUWCKAAR8HFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5342

Adding @Jon Lange and @James Bottomley on the To: line.

@Jon Lange, please search for your name to answer some questions below.
@James Bottomley, ditto.

On 1/11/23 10:39, Christophe de Dinechin wrote:
> Hi Tom,
> 
> 
> On 2023-01-10 at 12:54 -06, Tom Lendacky <thomas.lendacky@amd.com> wrote...
>> Attached is an updated draft version of the SVSM specification with added
>> support for an attestation protocol and a vTPM protocol as well as other
>> miscellaneous changes (all identified by change bar). Please take a look and
>> reply with any feedback you may have.
>>
>> Thanks,
>> Tom
> 
> Thanks for sharing.
> 
> This is the first time I actually review that document, so my feedback will
> be a bit longer than most. Also, I read it at a time where I had lost
> network access to Internet, so RTFM wasn't an option...
> 
> First, the actual errors:
> p9: Typo VMLP1+ instead of VMPL1+

Fixed

> p18: "bit1=0" and "bit1=1": That seems to be bit 2

Fixed

> 
> Then the more mundane comments
> 
> p9: "expected that, but not limited to": the wording sounds strange to me

Ok, I'll work on re-wording this.

> p9: Undefined acronym (*) VMSA

Fixed

> 
> p10: "certain forms of RMPADJUST": The body of the document seems to
>       indicate that the required RMPADJUST are performed as part of the
>       various other services. There is no explicit need (apparently) for a
>       separate guest-accessible RMPADJUST. Maybe expand a little bit on this
>       topic, and explain if the guest is supposed to do any RMPADJUST if
>       running at VMPL1.

RMPADJUST can be performed when not running at VMPL0, but only RMPADJUST 
executed at VMPL0 is allowed to turn a page into a VMSA page. I'll re-word 
this.

> p10: gPA space of the guest: "of the guest" seems redundant, since it's gPAs

Fixed

> p10: lower VMPL -> less privileged VMPL, or explain that "lower" privilege
>       levels have a higher number.

Fixed

> p10: "The initial SVSM memory configuration...": Unclear what "required"
>       means in that sentence. Is that the core protocol? Can "create VCPU"
>       request additional memory, for example?

I'll work on clarifying that.

> 
> p11: No explanation of how the SVSM knows where the secrets page is.
>       Probably need an xref to some other doc.

That is implemenation specific. For example, in the Linux SVSM prototype, 
the address of where to place the secrets page is communicated to the 
hypervisor via a GUID structure at the end of the SVSM binary. Other 
implementations may have a different method.

> p11: Who does the initial construction of the secrets page? What happens if
>       that other actor does not write zeroes? What attacks can the host
>       perform on the secrets page if any?

The SEV firmware constructs the secrets page directly in guest memory. 
Standard SNP practices regarding memory usage and access within the guest 
apply.

> p11: undefined acronym VMPCK

Fixed

> p11: Why should the guest OS "capture" the SVSM_CAA value? In what sense?
>       Is it because it can change afterwards, or because the secrets page
>       becomes unavailable, or for another reason?

I'll reword this, but it basically means that the OS is expected to use 
that value (unless it changes it) for the BSP. The OS is free to do what 
it wants with the memory where the secrets page is located.

> p11: Byte offset in secrets page fields starts at 0x140. Explain why this is
>       safe, and how other possible users of the secrets page would avoid
>       stomping on that area.

Hmmm... what other users? The SNP spec defines the area as reserved for 
guest usage (intended for use by the SVSM, but not explicitly stated). The 
SVSM specifies how it uses it and identifies itself to the guest OS. If 
the guest OS wants to trash it later, it can do that, but it should save 
off any information it needs.

In the Linux SVSM prototype, the secrets page created by the SEV firmware 
lives in the SVSM memory. The SVSM locates where the OVMF secrets page is 
supposed to live and copies the secret page to that location, modifies it 
and then begins OVMF exececution. So the OS is using a different secrets 
page than the SVSM.

> 
> p12: How does the SVSM "terminate"? Is it a regular guest shutdown, or some
>       other mechanism, or is unspecified? Can the SVSM log anything, and if
>       so, where would it be found? (I assume that would be host platform
>       specific, but would still be noteworthy in this specification)

As it is implementation dependent, I'd rather not put that type of 
information in the specification.

In the current Linux SVSM prototype, regular guest shutdown terminates the 
SVSM and the it logs to a fixed serial port.

> 
> p13: "Use of the Calling Area is necessary..." effectively, this is a single
>       byte in the calling area, right? So it's not really "ensuring", maybe
>       "detect" spurious invokation (1). I think malicious invokations are not
>       made too difficult by this mechanism, since there are only two states,
>       and the host still controls when vCPUs run.

I can change ensure to detect.

> 
> p14: Undefined acronyms: GHCB, MSR

Fixed


> p14: I think GHCB Specification is an external reference, worthy having
>       italics and a precise reference / link (can't check, no network ATM)

Fixed

> p14: "If the host illegally entered the SVSM, this field will be zero": I
>       believe that the conditions enforcing this should be precisely spelled
>       out, including for a host with malicious intent. If the mechanism is
>       indeed robust, then we are not protecting against "spurious" calls but
>       against "spurious or malicious" calls. Otherwise, "will be zero" should
>       be replaced by "should normally be zero".

Standard SNP practices are to be applied here. The field will be zero, as 
the only way it can be non-zero is from the guest setting the value or the 
host taking ownership of the CAA page and changing it. However, the act of 
the hypervisor taking ownership of the page will result in a #VC in the 
guest when attempting to access the page. At which point the guest knows 
that the host is being malicious and should terminate.

> p14: "only after VMSA.RAX and SVSM_CALL_PENDING": this suggests that there
>       is some kind of possible race condition here. If that is true, then
>       maybe there is a need to specify memory ordering semantics on the three
>       relevant fields?

The race is that once VMSA.EFER.SVME is set to 1, the guest VMSA can be 
used on a VMRUN instruction. So all updates to the guest VMSA contents 
must be performed before making the VMSA runnable, again.

> 
> p16: PVALIDATE: What happens if a guest is unaware of SVSM and executes
>       PVALIDATE directly? Is the SVSM supposed to emulate that, or to punish
>       the guest, or something else? Is that even possible for the SVSM to
>       trap and emulate relevant VMPL1 instructions? Also see note on page 10
>       regarding RMPADJUST.

If the guest is unaware of the SVSM (meaning it is running at VMPL1, for 
example, but doesn't know it), the PVALIDATE will fail with a #GP and the 
guest will crash. The current upstream Linux implementation checks to 
ensure it is running at VMPL0 or else terminates.

> p16: "It affects the Calling Area for calling vCPU only": This seems slighly
>       inconsistent with page 9 "other SVSM implementations may choose a
>       single execution context that services all guest VCPUs".

Not really. It is used to identify the calling vCPU and thus the VMSA that 
contains the call information. So, even if a single execution context is 
being used, the SVSM still needs to have a unique calling area for each 
vCPU in the guest.

> p16: Alignment for RCX is 8 bytes, but alignment for RDX in
>       SVSM_CORE_CREATE_VCPU is 4K. Is that not the same calling area?
>       Also, what is the use case for moving the calling area?

As the original author, maybe @Jon Lange can explain these requirements.

> 
> p17: The table links appear in a strange colour (some kind of weird cyan).
>       It seems clickable too, so I suspect a hyperlink, but since the link is
>       always on the same page, it's not super-useful.

I can remove that.

> 
> p18: Is the CAA seen as assigned to the SVSM? I believe the answer is no

Correct, it is not.

> p18: For increased readability, I suggest naming the error codes for the
>       SVSM_CORE_PVALIDATE call, and putting them in a table.
>       Also, why tag the specific errors right after the architectural
>       PVALIDATE errors? In case of architectural extension, you'd always get
>       0x8000_1011, which is not super helpful. Instead, you could reserve
>       0x8000_1xxx for protocol errors, and put PVALIDATE errors at
>       0x9nnn_nnnn, which probably gives you enough room at least for the
>       coming 6 months.

I'll look into this, no promises, though :)

> p18: "VMPL of the VCPU making the request": wouldn't it make sense to add a
>       VMPL field in the PVALIDATE operation descriptor, so that the guest
>       could control less-privileged VMPLs?

After the PVALIDATE, the guest can use the RMPADJUST instruction for 
adjusting page permissions for less-privileged VMPLs.

> p18: As indicated earlier, I'm confused by the 4K alginment requirement for
>       RDX (Calling Area gPA)

Lets wait for the response from @Jon Lange.

> p18: What is the APIC ID of the vCPU used for? I see no mention in the
>       explanatory text. Is that an internal index, or does the SVSM
>       implementation need it for some reason (I was not clever enough to
>       imagine why)

It's needed to ensure we are using the correct VMSA and CAA for a specific 
vCPU. Since the BSP creates all of the OS APs, were it to not supply the 
APIC ID when calling the CREATE_VCPU call, the SVSM would not have a way 
to associate the VMSA and CAA being created with a vCPU.

> 
> p19: What specification defines FAIL_INUSE? Add xref?

That's the FAIL_INUSE error code, 3, of the RMPUPDATE instruction. The 
PSMASH, PVALIDATE and RMPADJUST instructions share the same return codes, 
where applicable.

> 
> p20: Evidently, SVSM_CORE_DEPOSIT_MEM is intended to be used when another
>       service returns 0x4mmm_mmmm. However, in the presence of a flag
>       indicating "I may no longer need this memory", and given the
>       limitations "cannot cross a page", I am concerned about possible lack
>       of forward progress if two vCPUs start parallel operations where one
>       vCPU says "Hey, I need X terabytes of RAM to do that" (which will then
>       be split into umteen DEPOSIT_MEM calls due to page limit), while
>       another says "Hey guys, I'm done" and sets the MEM_AVAILABLE flag. I
>       see nothing in the spec that would prevent the second CPU from actively
>       withdrawing the memory that the first one is trying to deposit. I think
>       that the spec should clarify a forward-progress logic that prevents
>       that from happening.
> p20: It would be interesting to have at least a vague idea of what
>       operations can actually request more memory, just to set expectations.
> p20: Suppose that CREATE_VCPU requests more memory. It has no obvious
>       "restart" field, unlike things like PVALIDATE. That means that there
>       should be a rather strong guarantee that all SVSM calls that can
>       potentially return 0x4mmm_mmmm either have no effect when they return
>       such a request, or are idempotent if called again after providing more
>       memory.
> 
> p21: The MEM_AVAILABLE flag is set in the calling area of the startup vCPU.
>       Is there any requirement that WITHDRAW_MEM should only be called from
>       the startup vCPU, or from only one vCPU at a time?
> 
> p22: The writable area ends at a page boundary. What could be a vald
>       rationale for setting the RCX pointer in the middle of a page?
>       Maybe simpler to require that the pointer be page-aligned than have a
>       spec that mentions page offset 0xFF8 as a special case... > p22: Rationale for not returning incomplete? I'm trying to see how the 
guest
>       could efficiently let secondary vCPUs withdraw memory with the protocol
>       as specified, without a little additional wording regarding either the
>       memory semantics of the MEM_AVAILABLE flag, and telling if there is
>       indeed more work to be done by this vCPU using SVSM_ERR_INCOMPLETE.

Let's see what @Jon Lange's view on the p20 - p22 comments.

> 
> p23: Table 9 is mnissing RDX, R8 and R9 rows (as input for configuration)
> p23: Table 9 title should be "configuration or query"
> p23: RCX result is the same for query and configuration, or is that for
>       query only?

I'll update the table to make everything more clear.

> p23: At the specified RIP. If Bit 3 is not set in the configuration case,
>       does it return after the VMGEXIT?

Yes, it will return to the current value of RIP in the VMSA.

> 
> p29: Table 14: How can RAX be used as command ordinal and command response
>       size if it's already used for call identifier / result value?

Typo, that should have been 0x000 (since the column is Byte Offset).

> 
> p30: Why would you need 4 bytes for the TPM command ordinal? This causes the
>       TPM command size to be misaligned. What about 2 bytes for command
>       ordinal, one byte for locality, and one reserved byte?

This is following the MS simulator protocol for the TPM 2.0 reference 
implementation as proposed by @James Bottomley. He also submitted an RFC 
TPM platform driver implementation to the linux-coco list following this 
protocol. It would be best to involve him in the discussion.

> 
> 
> (*) Like most readers of this document, I know what it means, but since you
> defined VMM just above, or VM the page before, I interpreted your intent to
> be that every acronym should be defined on first use.
> 
> (1) As I am writing this, I have a doubt what happens if the host writes to
>      the secrets page, and can't verify easily without a network.

The host can't write to the secrets page without first performing an 
RMPUPDATE to make it a hypervisor page. If it then were to modify the page 
and then re-assign it to the guest, the guest would receive a #VC when 
accessing the page because it is no longer validated, allowing the guest 
to detect the condition and terminate.

Thanks for the feedback!

Tom

> 
>>
>> [2. application/pdf; 58019-Secure_VM_Service_Module_Specification.pdf]...
> 
> 
> --
> Cheers,
> Christophe de Dinechin (https://c3d.github.io)
> Theory of Incomplete Measurements (https://c3d.github.io/TIM)
> 
