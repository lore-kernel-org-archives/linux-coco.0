Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97928F78
	for <linux-coco@lists.linux.dev>; Tue, 21 Feb 2023 22:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtU3VPp8BZ8s2ENaY90mitToA7x3M1GluXnvLTsZ5o1wq1JuOP/8iNI8+v9i4F78MgGxtFXXZKj2q3n6daa0iVdJk3Wr+UJbjaRfnhyAQz6DkQRRMXMf0DQpeCcucKNrihtvQCX6LgnA2nYI/PuliyGX5qdXfyUyttcgDt1MiHg48ofcjUUxGmAKiRk+BMeZb1rjPWjGzQA2czN2Y74MITgoiD1bLS3IK7V9m2ZV6TX5S/Ph19OTkEYQMgcRwpbcCaMzMDglR2YT6h47QjHX00O7j13Jw+r6MNv1WsnZlLajLz+iHsu2xuHl2jD4khPEZ6z8JFeQSVNbPh6WtTSZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lFT4ASZIF5xxZOZqC07DM5VGOp6dm9Nh24s55pV+IA=;
 b=QNseFE5evfVXudkc91oFELXKHRK2YMDsJEentU047TU2qVj5itoPp/HvcMUBdhkRTLorfulzsEr5/FiR9Gjxd//9tznxiqYlh8B+KkUISYT5jXdIfjEKRdLsOR06T4fEv176fJLl55GMDQsB/MaNU/0azENMMiSHm94QRNmPQj/JbYDOpJhaCUD06w87AeawHWt1RnGNOV4cM+3S6RTkKrTB+Q/o0JijNL887wNzm/DnjR7B2M+HdfjONpMPgGew+uc7X0bXpyydWvF55YEoggFWuxU/sLXZth4yxi7jMNogaJQbFP3OcYzKgqfrCwcU1TOjlf46emeQOvVt+j0Eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lFT4ASZIF5xxZOZqC07DM5VGOp6dm9Nh24s55pV+IA=;
 b=LTPITHBhSA1/AP77F3OVdAoNokrJBJuqqf1x9EjGtrHxMSJDuSm9993M+KjakruDntHxX4GDizrJjKQdmEo09Qsru/Kah5wA7nM8O2uuQOMPIRliErP0wVr5dyosRaI646ElY7VZv3n4GZHiUSaoxaWB7I/KonKlNWkaFSX8PQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Tue, 21 Feb
 2023 22:07:48 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 22:07:48 +0000
Message-ID: <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
Date: Tue, 21 Feb 2023 16:07:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y+yqpq+S3N/lIKjQ@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0096.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::11) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|PH8PR12MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: da9b8bf9-1db2-4390-1424-08db14581130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4xbvaXiAhIy6/Lw2HLV3Yq7wFfQVN6PWTPlBKgmfEeV8DPDi/P8Z8U5gOQO/dNe4vxwE9zjF46xOsUzjhffGWA1MyxQ103H8pXTOX77Bph7umHQmWjTtQnxpL06voPh+9WttmgjRezbB+KKbwDs1eRsvctICjcXEqAT9FHCkzJ6rh8bu5Cf5i6Heot2dEGcGZw0fAERjTcwhZ9YJxyFuut4W+6ffgIz1CK/jmLx5+8uqGVo3hQrZXN+YlmIAtkD3FDb8Mrj4NJpNKN1lJPEhNGHpMi0LHoOU1PNVVdxYjjwJjpyeUMazSUQNwlIsv23knOA71XndzyLEzzJzYclRfHOZBv8I55n89E2Ra68gR0IhJGMrxQUWMRyc8CAUEZqdXxXhi4sb99VHBgn6/pnFVbABllf210UfoE4cF6UuAbeUwy2zr393xay5gCONnGLF7FR6JraVLIbvL1xBmVrpGooJfFqgmRFa+c71cBnQwc+yjjfX2YOScN152/DgLV4aiCdKR2w+U3IA1U37aLtAiH9IPB/a6M5DzffZyNHfqV56C4N9BfhwDjxXIKUBrYAZ3OsWrspgFx8o7zQ+Ilh/xBu4rN8sKzGNhrrqQRafLbOt4gQVrd9TT2pBBzxqDcs2f30oJ17JCsxt2+StVuQo10SRqFCifh6vt+1N6asOOmji3CNHzPoA7so+aDuXKJuIIRFsQgni2Aogehd5Umb5rDodZCk20GDEJmGBtV/Six0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(53546011)(6512007)(26005)(2906002)(66574015)(36756003)(6506007)(186003)(31686004)(38100700002)(478600001)(6486002)(8936002)(2616005)(41300700001)(4326008)(8676002)(66476007)(6916009)(31696002)(83380400001)(66556008)(5660300002)(66946007)(54906003)(86362001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTVvZTUzcVNBbGpqYWNLMzdYQ2hIZFh4NTkvdkZnbmJUcjI5Z29ZelA3Z1c5?=
 =?utf-8?B?RXBFc0Z3aUJscG5ZaUhZdHZ1Q2hreXZOR0ZkRis3bUxTaWNBb3BhUW1kc0xz?=
 =?utf-8?B?OWhUSEtXUkxkRVpyQ1JrZDhOeE1aNWljVlZOZGhmMDZ0YUFRVUlvOGNJa1NW?=
 =?utf-8?B?SVJoVVV6U0ErSy9ISFBBVXZ5UWdoaGttdFZLbUlKbEpUVnl2QzBVdHRETHp6?=
 =?utf-8?B?UVFsMVB6bVRqbU5SbjZNaWV2a1lLOG1SWVo1N0wwaUtBTlFyeHhqZkQvV3Na?=
 =?utf-8?B?eldVMGNaWVdCb3lLRERiR245dW1PZldjanA2cTBmZzZqSndaTXNHU1l2MmI1?=
 =?utf-8?B?cVJJUTFTTXNoUDNaQmh5ejdEbjFTVlE0Ry9OMHN2Tk80OE1SeUhJcW44MTRk?=
 =?utf-8?B?dFZINlIwVUJPSG5YbHMwK0ptZ29KYWoyUmZDa3ZqN0RNWTBkdzg0eHlyajds?=
 =?utf-8?B?OXY4UWFSR2ZnWWl1bVA1SXRQUjJJMnUrTjVibWgrTzBNbWUycVBvQW1oajNt?=
 =?utf-8?B?Y2J5dUlwZ0ZDRUFjeXdLVVF1MmFybE15ZVVtTXlYM0taWnJCUU9VQm1BVGYw?=
 =?utf-8?B?Y3dnbFYvVXVzQXc2clpFZ3Z5SndSRFlEdjVuenNDbzhxUlpEaTFJNForY1hT?=
 =?utf-8?B?WlgyT0pCOHVWRzIwckc4bkhSdXUzZ24ycTVoNy9JOTAxYXhQUE5jbGtKdnI2?=
 =?utf-8?B?MVd5cHpQZ2V0T01sU0dLMVFjajF3TUJLc0lsYjhlNnlsN2dZMU9zQlB5Z042?=
 =?utf-8?B?VmptZ21SeWlaaS95bkZKZFNJZVhVeFhuNWl4bWpuQVlUR0l1Z0thTkFXVVhz?=
 =?utf-8?B?ak5hcnV0N1J0Z294aE5VaHdlNXZzVDEwQnJURUtxVGU2b1ZrMTFhRy9URTgr?=
 =?utf-8?B?cUtKUW0zbXY1d3B4YWpJL2JkRHdKcElSL3hiVDd0dlhmVXJJbjcxUm5kL0Fr?=
 =?utf-8?B?RDA2Q1pZTWVOQW5KdktUVUpVM3FxdEN1aXE0NmdxYmI1dlhIUkRPQSt0dnkr?=
 =?utf-8?B?VHc3LzE5NjRJd1ZuSUlSNVl2SWZCMGc1RmZIa0ViWFNPTERwN0lIVEVvNTFU?=
 =?utf-8?B?c3JCU1lybzU1T2J5RnByaUwrYlEzY3Bvakc1VHYxM3hxNGVWRzk5RTk1azhU?=
 =?utf-8?B?YmF0QVcvWTdjTCtCMUxwOHBmSEVOTE9WWDlNdGRTemZlUHlWV3k2OS9oQ1du?=
 =?utf-8?B?aWVrZHVnQzU3VWg1NmNXRUlGQkFTK0t3eWFRSW02eXZlYjhiMWU2OWNuWHlh?=
 =?utf-8?B?NTRUOVJlZ0puVE1OWHBGSUlObjN6bGRVTHo2ejV4aHNwSUtIL1FKSUUxdUxY?=
 =?utf-8?B?d0FjbEdnckwxL0lTcjdQdE9TK1E4R0NBSS9LdjBHWWNieW1ldG52bG93WkNZ?=
 =?utf-8?B?SXRRWGpaeFYweFJwd0RXMmU3czFZWmpCUy9pN21TQTZ1MnBaQmF4c3NPRFZx?=
 =?utf-8?B?MVZJRWUxb2lJNWxFb3JKRVZoaUJJeE83cVNkODlzTGIyNjRiWXJ1Z2owZE4w?=
 =?utf-8?B?em1US0FRdlpZYnlMc3NuMnlON2JxTWpWbFZrZ09aeVh6UzNjdm9yTWFrOU9x?=
 =?utf-8?B?UkM4ZXFOQUFNc2NQVDJYb1FUdXBmbzFFN1Vpd1pSejdjanByT25MVVhFVVpz?=
 =?utf-8?B?eVRpK2NSMFFZS0tzRW1QMVVPK1UwS0pZU0k1NndBS1llV05BQjVxVGdxQTB2?=
 =?utf-8?B?b0xaREJGeFZnd0FCQmpEMytKUmZManpvdnBsN1JQUmxmdTVxSkRwbXR5RnJ3?=
 =?utf-8?B?aDA3cVJGL3Vjd3p5R1YwVVZZNVB4cFdncGxpUEdJdDVKOGR5dzhwczUrbWZn?=
 =?utf-8?B?ZnllYklZZkhoSEt4bUVXei81c3A0WGFBenFlZ3RFaWx0Y0Q5d2hZYVVBVjU4?=
 =?utf-8?B?Z1p2c2syVnNGeUVZRjJ3OTFzaTIzRTBtMWVwcmVpM1g3VkRRWWRVRnAxdG5V?=
 =?utf-8?B?NXNIQlhoaWVkTjhkcERRRHdRU2dwMzY1U2MraERBSmVLS2xrbkJmWmllOXAy?=
 =?utf-8?B?MUV5TDhwMGUvQlNJTFJzUkVZbkxUSlgyc2NyY1pHSkNpRnRSeWN3Umx6dlR4?=
 =?utf-8?B?T0pjMG5BUGVxZU1qbTRGVC9EczIrdVk5blhCSTlCNys5QWZDYWFUcTd2MWlS?=
 =?utf-8?Q?1/TV53KXFT0RBv2c6QY+yhkis?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9b8bf9-1db2-4390-1424-08db14581130
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 22:07:48.3910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9baZrgGMNpUV2k13dhvXdPYgzwWlxhQJsnDNJeYvEz2zMFMIQsN37Nb4+ytUIS+YdDVfXTlgpt9Rw6iDEkgmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7110

On 2/15/23 03:49, Jörg Rödel wrote:
> Hi Tom,
> 
> On Wed, Feb 08, 2023 at 03:55:34PM -0600, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with feedback
>> incorporated from the previous review. Please take a look and reply with any
>> feedback you may have.
> 
> Thanks for your work on the new specification. I was reading through and
> have some thoughts on the handling of SVSM_CORE_CREATE_VCPU and
> SVSM_CORE_DELETE_VCPU calls. I think a few corner cases with these
> commands should be better defined.
> 
> The underlying problem is that the SVSM can only handle one VMSA per
> (apic_id, vmpl) combination. So what happens if:
> 
> 	1) A new VCPU is created for an (apic_id, vmpl) tuple where
> 	   there is already a VMSA, should the call fail or should the
> 	   existing VMSA be implicitly shut down and replaced by the new
> 	   one? The latter case can fail if the existing VMSA is
> 	   currently in use (depending on how it is implemented).

VCPU create doesn't actually replace the VMSA from the hypervisor point of 
view. The guest is still required to invoke the GHCB interface to notify 
the hypervisor.

The SVSM PoC leaves any current VMSA in the list of all VMSAs, but does 
replace the current / in-use version of the VMSA for the specified VCPU. 
This is used to examine the register associated with a request, so the 
guest can shoot itself in the foot if it doesn't switch that VCPU to the 
new VMSA.

I'm ok with either doing that or, as you suggest below, checking if 
there's an existing VMSA for the VMPL level and failing the request until 
the the existing VMSA is deleted. That does require the deletion/creation 
to be offloaded to another VCPU, though (unless we allow the self-deletion 
change talked about below).

> 
> 	2) Who can delete VCPUs? Can a (apic_id, vmpl) VMSA only be
> 	   deleted from a lower VMPL running on the same apic_id? Or can
> 	   other apic_ids delete it too?

Nothing prevents one VCPU from deleting another VCPU - although I think we 
should probably prevent a lower VMPL from deleting a higher VMPL (e.g. 
VMPL2 VMSA can't delete (or add for that matter) a VMPL1 VMSA). That 
should be added to the specification.

It might be desirable to allow another APIC to delete a VMSA. Maybe kexec 
processing would be able to benefit from that.

> 
> 	3) What happens if a given VMSA for a VCPU is deleted. Should
> 	   that be not allowed or should the SVSM gracefully handle
> 	   that.

As the specification is written now, switching from the SVSM would result 
in the VMRUN instruction failing for VMPL1, which will shutdown the guest.

Again, I'm ok with either allowing that or, as you suggest below, if there 
  is no VMPL1 VMSA, just enter HLT in the SVSM code.

> 
> I have some thoughts on how to handle these cases, but want to put that
> up for discussion here. For 1) I think it is best to fail VCPU creation
> if there is already one for the (apic_id, vmpl) combination, requiring
> the guest to delete the VCPU first. This is related to 3) where I think > the SVSM should just go into HLT when there is no higher-level VMSA
> anymore. When it wakes up from HLT it can check whether a VMSA was
> created and continue executing it.

For 1), that is an option.

For 3), if the SVSM goes into HLT, it will require another VCPU to perform 
a VCPU create, which should result in the VMPL1 VMSA being run for the 
VCPU. That would then imply that coming out of HLT in the SVSM would be 
for a protocol request. So this is definitely possible.

> 
> For 2) I am a bit undecided, letting VCPUs only delete itself would
> simplify things on the SVSM side. Allowing other VCPUs to delete VMSAs
> needs quite some synchronization or could fail entirely if the VMSA is
> currently executing.

Should the clearing of the SVME bit fail, then a FAIL_INUSE return code 
would be returned. I wouldn't think that the synchronization would be that 
difficult, but I'm not sure. If we do allow self-deletion, then, I agree, 
that would work nicely.

Thanks
Tom

> 
> Thoughts?
> 
> Regards,
> 
