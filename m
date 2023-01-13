Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE8F2F2A
	for <linux-coco@lists.linux.dev>; Fri, 13 Jan 2023 16:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJO9SD4qf3CEvA4OFQLv2RUml0n32Ml26gsy8l0dyGa7gyvwp9Th682a2UKb1c/HU/eMocp8+j0BTxjt2GLv27r3qTPNDVYE/Q9OxzHrm8M6Mu2eB5WlCSVGV63W/Y/lIld72hF551UeHKTEq58MjGM2qnpngzLdnk9eTM1yKvTXxZ21nxs249ZHTJyf8AmtuT2MRh/4bkl5Gb1A/bPTt7tGEyFSvfKpBOt2AAKk8QKiLRviFu1wChq1y8KzLiceCH1F7fhAWWohcGCVXIMWpi47kouybKueC5xjytlFDEZsO/vN4ZwZ9W80g2K8KTkU13FFUjciztdjF/LZ0UyAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muEbBwn1Z5dqY49t8CKWhTTHHnbZOX5JDC8BGWYPAuU=;
 b=UREkyU/Nhigeskjwc14PpvenP02vclnbZ8nBurgtDVVP+5+DLjMr/fKPin5zDLAGb3jQsUVv8chQxG/JMtMWr4ciOX08Bh6YwVZKoHHeiQRBej0XhaGXc0oTnnLjkszYPvDusxgGvSoVCCElQ8xYAfMczV9/ta4yKR+M2mNBn6bbUnrwoA+ET2uf/l4cVaQ9mUNgeqPp19E3Cz7wKVZpSqrfJnk3tE47kO+3S1qtnxVkm17UQW48PWuumGjzy+n4jX7IyqdjtVH5AUQjiHEFzaXsmKQMoYZMPyPd2NG/ZyPlGlrM9wBwUiIzrP4ccfPKL5aMIOozHWsz68tdjdh37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muEbBwn1Z5dqY49t8CKWhTTHHnbZOX5JDC8BGWYPAuU=;
 b=5g91PAHymXAhTCw8MSOc5Aju0Q0d3xHjkiOQxDFjAE6gPBGE4/AV78P2Gf5PxFgu65/1YbfdW+fVa7rU1KyXl2KdVI+oq9ZhkPwNtssKAS+ix+teYIQCL1wLakSEbiXQ4m9ZC9L2qthzQvIKsUb/1JiYzs6jlEtkukqAgj29EG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 16:16:45 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::8200:4042:8db4:63d7%3]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 16:16:45 +0000
Message-ID: <2b9d1bca-04aa-a903-4023-4feb8c45e921@amd.com>
Date: Fri, 13 Jan 2023 10:16:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: SVSM Attestation and vTPM specification additions - v0.60
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
 James Bottomley <jejb@linux.ibm.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <ec43c1b9-8239-16c5-a4b5-5fe46970c9e4@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <ec43c1b9-8239-16c5-a4b5-5fe46970c9e4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0061.namprd12.prod.outlook.com
 (2603:10b6:802:20::32) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BY5PR12MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: d398b277-3e0d-4e67-ee09-08daf581907d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b9DAPDThmoHthP0ZMbYOM0hE9wf7sHf7KwtQfiaHGXqoUQoiPjgZvAb3s/xbxEhgLL09ueC7fE2C+/ANS4bDi0YthVQYcOVlsOexk45mF3s6bwxMj2SGmfNsYkSwKj5jU4uz6dmqCnYEgvkaKjJdX/tC0ECUjTgFYNZorJOJW8o2o505UyDk9bOX+dl7Y3pXW3xdrd8zYbd0wwEZV19My6qW0ltcB0+xoZ/Z+/qa5Psq05PR+8o8XlwCO0sbhw84tRBcKRBbYmI/0j24XuI3sYYy8hLcE2ZUN2LHqBsjaiOKx0Io1kxbou28BkyL/5ZxgEeFkBjaLvRGTwSRel9KEU7M0KeNP7VfS8GBEi4Ljf7MlPycnc/gRYvedhADay6eWPG7oNdR97XAmRu4nteVS29ODs59SecNxIr8t4Bw1MM+485T12Q6pgm0KMHrFi9Fe0bi6b42r7u1Y2RSsUd13PxnnVbGq4T+AueWfsPkfBb/j/YpnbycVucNeb6IRNzwNGSQgOjqSQBovXC5gUrXNRtNh1NXM48ySi2eO4uE7N5FgQSoP4ElRUn9bY+8jy6v+4VaJJfxMO5M53hyvblwQpObc1Sx1pxXic4w9T795wq0O0Rn1ZLxLG6VXTw3bRK/5/OfYI0uE94u03/wWh/ulEmcz5Dh3F0sn9AKsK9u1vV82/sPOr71f0dRw8Riq1MuqtgFfbTxtc16qQpdcWSsugkai0MZe+sTc5jWdu73Txk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(478600001)(6486002)(41300700001)(6512007)(38100700002)(66556008)(31696002)(316002)(110136005)(2616005)(86362001)(26005)(66946007)(186003)(66476007)(5660300002)(53546011)(36756003)(6506007)(2906002)(31686004)(83380400001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bm1uL0V2ZXFiZzdUbzBSWk9qTFpVTkpZRU40YWpWSy8xMG40WGsyZDl1RmNl?=
 =?utf-8?B?OHlqUlNsMjlvL0hROHJpVzBJK2RWbFVDc0I0M2lDMm9sL3c1N2ZHL0RwRTF5?=
 =?utf-8?B?cEpKMTZrZExVMVA2bVFrSGRvMlNIUFVLNFJQVHFMeTFDMDZpS2ZTelgyZ042?=
 =?utf-8?B?T3J4RUM2ekg1S0J0empFZWtRZmRDRkhhRlpPVWdyMnRDalErVEp1UGFIVEhJ?=
 =?utf-8?B?UEoxUEpmSnJBRTkyUFRCd3BpdXlPMkVyS1RIbTFjek8yQlpJUTVhSUs4eDdW?=
 =?utf-8?B?aWxuSG9UVkhlSWlXNmlHeGtSTGx1MERzSUhtOWNpRmlWa2M4MCtBNXdhTVh3?=
 =?utf-8?B?TUYvMzREd3UyOWc1WlFnL1AyMzRYb1VVdWFXekNEdlUybVUvSzkwRWE4bFhQ?=
 =?utf-8?B?aXpaSUJNOG94R3JsOCtPL1ZKSkJuSThFd0xvcVVHa0VhQVB2Z3FFM2JoWjZI?=
 =?utf-8?B?enA1S3pMblRqbkNWYW9QZFgweGo4a0NwazN1MUhqcHBEc1QyNFhqeFo0TkV2?=
 =?utf-8?B?N0FqTjBzRDVvQkVJWFAybEU5TTdVMkFVZjNTUzZrVmpPdWtPUDVsTlBsa2Q0?=
 =?utf-8?B?eXdacC9TZHVUY28zMkJyK054Nk1ZWWFQVkdDUDBJWk9BQVZGUDFRNC84VmpQ?=
 =?utf-8?B?a2o5UVBBc2dCcEpBQnRZRXRGR3FwT1NpMUN2VHlYMHJyUFNMMVpWNXZVV25p?=
 =?utf-8?B?WW00UkIzdlU5SklQR0Z1MnpwdGprOXY5amprZHZEU2lQcHA5ZTVPY1Q1dUhv?=
 =?utf-8?B?RXhHU1FnTWVlbTVNZ0JHOWNZQUp2TlgxK3M3Z3VjejJQVkNjK3pqOFJkWUVo?=
 =?utf-8?B?Rk5odUdUbW9sQ1hwUUY3Y2VjQVVyNFlHcUNnRnVqZXFjL0JWVElxTHJ1cjYy?=
 =?utf-8?B?U1QrakZIOTQwdHFFd3YzaEJ5QzJEd1FiRXRBbThtdXVzMWM1cm9ZczBoM3hk?=
 =?utf-8?B?NW5zRnBwQnlObHdxZFhxWk5YOWRNdGxSZDRvaHA2RHpBUFhRSlg5MnN2d1pz?=
 =?utf-8?B?SkZwUGtBTlFIRVRSN2VrUXp4dVkvZ3VKVTRPcGQxN1QxYzY5OVhLTklvbWRh?=
 =?utf-8?B?V05FNDY1NEtVMHhWT1U2alJEOExQOFFWeWYwYTlza3MrRHlkZmVhaXVMUjcx?=
 =?utf-8?B?RDUrbG10b3gyTm9PVFZ4K0FqWEtuSnZqZ0h0MzdtdHZJUkJDdVVpcGJidFVU?=
 =?utf-8?B?Mkc3UHZaeWhFVmRCeTdzTTY0enMrTHB1aEJxNllESTVKR2F4SGhEN2k4VUdy?=
 =?utf-8?B?MDZlZ0JzRURRWGJQV0FuOG9vdUxTMDNGRTNzRnQ3U004YWtBN21kd2RQa04v?=
 =?utf-8?B?TnJzY2ZKOUcvbXFwc1NIQzd3MGRJTm52V1lCM294dFhQVTBSMlhwbkJ5bUl6?=
 =?utf-8?B?bkZxbWZPUE93ZjMzL3VqdndaRlhWZUxscW5DQ01FeHRKQXBYcW1rSkdhcWFy?=
 =?utf-8?B?K0ozdlhteGdNci9zQk9YeE0xOHh3aHVJaHZ4RWRoVmNreFNxRWdWL0pBMzRX?=
 =?utf-8?B?cTRsZmVWaUdROFBaV2xxZmJTUURyaDVURW5lNGJRU3RBeHJrUmhFcW12U0J4?=
 =?utf-8?B?YXRtUHJNZmtXWDV1Nk5GOXBOMndZaC9SNHZ0Y0ZBT0pWdU9jWnV5aVhqbWxU?=
 =?utf-8?B?T3Q4TFlJSG8zZE5hL2ZuTkE5ZU5La2EvSy80V2pXLzMrZXdzb1c2dU83VXQv?=
 =?utf-8?B?ODU1bC9HVDgrei9TdUdIZGd2ZTRZalNzNlVZUFNoN3dVWW02dk5naHVYZW14?=
 =?utf-8?B?MmY0V1FXYXVsWlBXOVV6WnE3WXc5bzFscktzUWVYM25yM0ZYWVNzS28yUmFI?=
 =?utf-8?B?Q2xrU2Z5M3hJSnJ3T0JMeG5TVm9iaWIrdlFvZFp2R1J3L2pWbEVOOGNlY2lw?=
 =?utf-8?B?T2k5aEV3T1FYWVkyOEsxdTVYNHkyallrMjJMSWNDVDlqQ3IvckZra2RVckpt?=
 =?utf-8?B?Qm8yU2cyWGFuUHgvcEhWMzdlU3dEclE2SldQUHBjd1RRd3F1WVZSTy9vdW9O?=
 =?utf-8?B?T0k1OU5rbU1BZWZLNUd3R2VUZzNqY2sreWNKRFJqOWJFSncyOFZMa051L29u?=
 =?utf-8?B?UkMyTndqWlFrRUR5M1hxbm1hMTQwUGFyK2Y3R3BxNHdyL3RwYlV5dkdvWGxz?=
 =?utf-8?Q?yHVgA64yedFHMNpaP29VyXoKH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d398b277-3e0d-4e67-ee09-08daf581907d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:16:45.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xxo/kPHKzzbDKBNvHrVgi43OhVm01p8KM2vQ8p4Tt+Qj2Savh+f3CZC9u51X64F8cNHNjrIppRLT/Kt894pRrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

On 1/12/23 02:19, Dov Murik wrote:
> Thanks Tom for these additions.
> 
> On 10/01/2023 20:54, Tom Lendacky wrote:
>> Attached is an updated draft version of the SVSM specification with
>> added support for an attestation protocol and a vTPM protocol as well as
>> other miscellaneous changes (all identified by change bar). Please take
>> a look and reply with any feedback you may have.
>>
> 
> Few comments/questions:
> 
> Page 25: 7.1 SVSM_ATTEST_SERVICES
> 
> 1. Should we add two fields in Table 11 for certs_addr and certs_len? If
> certs_len input is > 0, then SVSM will perform guest_ext_request and
> retrieve the host/VMM certs into certs_addr.  Provided certs_len must be
> 4KB-aligned.  Not sure about certs_addr.
> 
> If the size of the certs exceeds the size of the supplied certs buffer,
> R8 will be set to the size of the certs (in bytes) and the call will
> return SVSM_ERR_INVALID_PARAMETER.

Yes, I forgot about the extended guest request comments in the other 
thread, I'll add those.

> 
> 2. Table 11: The 'Attestation report buffer gPA': should have enough
> space to hold the resulting SNP attestation report (0x500 bytes).

I'll add some language to the spec to indicate that it is assumed the full 
page is available to the SVSM.

> 
> (I assume the implementation will ask the PSP to generate the report
> into an SVSM-HV shared page, and then copy the result to the
> caller-provided buffer in guest private memory.  So the caller doesn't
> need to worry about page alignment/crossing?)

Correct.

> 
> 3. Consider stating that the SNP attestation report is always generated
> with MSG_REPORT_REQ.VMPL=0.

Will do.

> 
> 4. Services Manifest (page 26): Can we require that the same SVSM source
> code will produce the same (binary) manifest buffer (in different VMs)?
> For example, at which order do the entries appear? I think James was
> aiming at durable/repeatable attestations.

Yes, we can do that.

> 
> 
> 
> Page 28: vTPM Protocol
> 
> 5. Will the SVSM update any PCRs on its own? For example, will it
> measure the content of OVMF into PCR0?  Or are relying on the SNP
> launch-update measurement (which currently includes both SVSM and OVMF)
> to attest that part of the guest?

The latter.

Thanks for the feedback!

Tom

> 
> 
> -Dov
