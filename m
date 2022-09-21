Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D038966E0
	for <linux-coco@lists.linux.dev>; Wed, 21 Sep 2022 17:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAxDWcNakgWvZNGKok9gYkNBRzH0cCvNxCyyIyrMN0TLK9HXoeMewQQpiOWRHfLtQNm84oTLjvtyc2G95rgqebvgXNFxVUuKrTae9JWSL6Kp686ZbqOH/+3r/mFxmRTDMqO9hxPpaDh/MpfkowVnqxV2VMQ7Q/4ULE/gzNfZhnoXIM+eCfNHe0BbjjxXoU54zM0LxaU0YRmtY2WMFDpH07I3GhrS0hUF8bokReZFOoP7VKAh0jkaPdIpVuCAPHvDafDA85V6VmS8tqokLPt8QLN86Tv6RRVRPiD3YlrIXzD+R3dckTuH5SJS+HQLuvGbtP9/OPbLOAGvF+ZKwDBhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAJyaNukZzWoUyv4a30bG6tTwdWISjSHx3vZ6JA4oSI=;
 b=SOK6liGq4qj1CNGly0o9UztAYtu+Kb8l9O4A5p4YkrTEXxwE3bMyzn236dzAMLmeV2Vtw5+EBL/bA2ThZAqhWCklQXiI3sfgFMU+A1eDZH3d+w2JTmB9ay0GnHBxaa64eYfEzG3H906b06k0hrKMg6PQ9DKANVAmLdoX6PjhThKm2onPbjfx+LSiCg+oX9Ap7FwZLY5/6BiTNBPKd5/8ipDdX5+LCp/NvhC6bz1PYzpGTOtdIUdW6DR/yxMEAZFthXQ+5pUPBQQH0he7bx1MTEU32DSQ2kYHFapeurpSF8PZspah2sunDR190qMZKUY33frGHRNaaSRB3n0sU83SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAJyaNukZzWoUyv4a30bG6tTwdWISjSHx3vZ6JA4oSI=;
 b=JjQL/hWeccP3NI2QqhBMzt1v1EOmy8ngYfseroLa4JmjeTe+NUgYNC2k0u/hvS+eQO3jRqM+TWFdDLhlFJVyNpti8gG84LcqSpw6vIiXWaE7y41+0YbxGsZFsKd0hpA3MRCuk6GKcpZQmFM1r2CSEYlz0QffsHhSoFIZBW37xsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Wed, 21 Sep
 2022 17:07:12 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::c175:4c:c0d:1396]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::c175:4c:c0d:1396%4]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 17:07:12 +0000
Message-ID: <fbb87137-1b54-29e7-b1f4-a8b5c2f968a5@amd.com>
Date: Wed, 21 Sep 2022 12:07:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Secure vTPMs for confidential VMs
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 Dov Murik <dovmurik@linux.ibm.com>
Cc: linux-coco@lists.linux.dev, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 amd-sev-snp@lists.suse.com
References: <84d6ee10-ff8a-a121-d62f-19becf400e75@linux.ibm.com>
 <YyrQGXO34ZRxSbgl@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <YyrQGXO34ZRxSbgl@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:208:2be::11) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: f99e6b9d-09df-4154-3660-08da9bf3b98f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7qyPOSwCwgoiUDS620mrc6hG0XwzP1Dou2AIFA4YKtcBaHw0MET9DFn0OzhZ4Qqsm/PB3bZrh+TlvAwXcenSSUEpUXZpL7cN4qGnjTGcZ11v8bevz9Zae850k8NSWVnJk7TnZd8lj0tsMGknUfvNtYCmBhXZThrUr6Cco+JXgU1XKpifrbCvKAeBt2pGixJbrbCRDyF/hqcfDY1XSDVe4+F1nWyzlHaltR1QyZZCmrWmaY3B2Hwz/KrO/ma9N1HBtb09cYPIixF0PzTkSeHKeDDR5BGMW2Yum6T7Besv84IJRk/Q3jbGPCyYqY76nNefkOBc2cU/2FNQvhkBtj0cc+URgsDO68mY8bEUIIQi9s+ewiNgzp+2v4dAQTFc9fO35igy8UhlxafBUZuwtv6gIX5/noh/KmRZLKvBon3nD1+UHsLz1gpHCOboc9k1mP/xU4zXrqj+sJNeATUlQUY8/phHqu1iWyJwCCnng3FRvaNGKS9G+0M2nlm1zwTKVqAyf9JzZtApItdhPvqw8j8837X4/mnWV0xfhchKOBmOYQnOtdGctWztTUY+FiEHB1RF6D64nRCDVFAqyTqIZSirlgqejRiFEQrSpV6OGefoFiS3IrPBnxvUXluAIE0Dlt2FZ8ZyRvmn60/1+zjn097eTRsBDL5aSpkG+CJEZ1zqzniAJd1uhUlL+jKrYh3FV31tkF2YOf2CeyFXnyBuNkk7lVvIsq+m7iKPn6yzVHPvdl4LgQWJN1wlcZffpFyJa6cBNzCni4PIvExtSwU9G21joGlk8HHAMloz5FvJaJl5TKUpuWzTsSS0aOlKVQFopvJ7g7y34uxz0SEuE1Q+m3q/+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(316002)(31686004)(478600001)(110136005)(31696002)(66556008)(54906003)(4326008)(66946007)(8676002)(86362001)(66476007)(38100700002)(83380400001)(66574015)(36756003)(2906002)(5660300002)(26005)(6506007)(53546011)(66899012)(41300700001)(6512007)(8936002)(6486002)(2616005)(186003)(18980400005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2UxZ2VlZWUzTG9JakV2QUZEL1VmcVR3TDJTSWxSZGsrWlRJaUVvbHdGdDZs?=
 =?utf-8?B?OEhwTm5MUEZjYU5pYzM4TDRrbGUyUnN2Y2FYYlpmTFI5OFN2N0lxcTUxUmh0?=
 =?utf-8?B?N2hpa0UwSlVCQ2hwSUI2Qzd3TWNEb0lFdnV0ZExRdk81MkI2TGFXeXU5UmtI?=
 =?utf-8?B?Z0h1MGFwdHRva1czRmMwNjB1R2FnRkxjbi8raXpmV0NmdkdpODFxZjhjanIv?=
 =?utf-8?B?SGFoWFdZUUV3Q2cxNGFSUzNCYVBoMHRsaWJKMkcrL0NJbWlGYUNHbjJmY0FX?=
 =?utf-8?B?L0tRdGhHdkR2Q2ZSOTlxTndJSGNLNlFUVGR2Yzh6UnpybHdpdWU0eCt0U1lC?=
 =?utf-8?B?Z0Zzb0NHREdDNEtIZXlqMnhCVE8wMHp3c1JuS1RjQ3RDblFVOStOYXl5eHNr?=
 =?utf-8?B?ckZEWFBiZ3NKZnRnMmcrakpad09zQjVGM0tTazNBdzdLQmVtaXE5L3lBT3Vn?=
 =?utf-8?B?cmMybVFUdlREb0NZTGxtZlQvZ1ZwTElUTFA1VytIUHVXYTVYRGR6RDRTcERN?=
 =?utf-8?B?bTVKT1JWWG1XZ0ljUmtvSkJydEpRTS9Jeis5V3J0aHZYOVo3Q1l1NlpIQmZL?=
 =?utf-8?B?ZUtydTBWd0F1UlU1aHFxM3JscTMzRFBuRU00KytZVG1XSStpNzhSb0J5clJo?=
 =?utf-8?B?U0szSTJaS3krWmtZdVYxR3hBNXp6QzJXR1JJcElQdXM3dk91RWttWTQyMGVq?=
 =?utf-8?B?a3Y5OVFYb1dYRkdzT0pSdml3aS91czBQRGE5a3duYlBmUU1UUFdnemhDSnZC?=
 =?utf-8?B?cFJCL1piYlpWb2VKZjlYYnFaaG15Z281YjdFcllZMDVHVCsxRmw0dGFQTDlK?=
 =?utf-8?B?U2xjZExrRmFEOVN0SHJ0V0l2NUl6WDlZSXVybm1MdGpxcUxsSWNDcUQvZHpV?=
 =?utf-8?B?OFF4b3JJWjNwcjJZaWVxQjl5Tlg1Tmc4YlRVZm0zOTZsRCtxSmk4L1BpeWhs?=
 =?utf-8?B?T1VRZFNZdGcvaXFyZnFFc0FiQXVzcjZXOE9sQnhtM2VBSW9nWFNyTTdqSDFn?=
 =?utf-8?B?TFFuZ3FMcmcyd1lpRXZxRkdzcENkeEJsNDVaQmxVeHZvSUcxVVduTWVPZ1hK?=
 =?utf-8?B?UCtZeGc4bDY4OHF2ZVN2VVNyYVpNWDAzeWRLTnJNUUFwSGFRajQvVC93YTNl?=
 =?utf-8?B?NEl3Z20yb3FRTTlwNVJzTjBrK2JLMGs5SUlIM3VVMkNuYjJLbU54TVlKMG5D?=
 =?utf-8?B?dVNWWU1PUWp4SngyMnR6VDJSVGJScC80blFuTnJMVjRoY05EZTQ1cWJ6SlBv?=
 =?utf-8?B?UHQrMmZVNEZMalk0cHlYL3hpZ1NDb0pwQzk0M3Q1Sk00RFpPT2NtRlprUDdL?=
 =?utf-8?B?YlZITGt0b2tLdWpzcUVIUmwzTTlud2hxWktjSkRxRU02OWZSZEQ0cHpyd1Iz?=
 =?utf-8?B?L0xIV2wvOXZkajhvdld0M1dqOUtDOUFWb0lkN2IrNzhWRFFxVWp1NzAveWgw?=
 =?utf-8?B?Y2crZ0dueEJrVmFCZWRnN0FGc0pjRnJRN1VBdUdyZGI0NVdkVU5hMWUvazVL?=
 =?utf-8?B?YjhmUTgvK0luSWorVWtJanRFNlZjUlEvaHRwZ1V0L1U0UUNSY1NGa1VZNEtI?=
 =?utf-8?B?ZnJ1d01OeU1zbWd0ZXc1UWMrYm55MTduRy96ZURhYnpuMGNIaGt6THAycXps?=
 =?utf-8?B?UnlmZnpvdU1veFpITm5wQVgrbitMMzZQdjY2UFA0amFLRGxtKzJlOFRkbTNz?=
 =?utf-8?B?Yzh4V1FtaWVERVhrQWM5QjArZnB2YVZZQUJMaXpkQ0ZVVm04bmhNUThkVy9L?=
 =?utf-8?B?RWprZjF3eXd1Si9reWxrRFlMc01xVUNDOFMxSnhYL2VPQlhHYXkzRitWM1dq?=
 =?utf-8?B?OERoZlpwZ1c4NXZnc2xlcHN5amw4WWNYQWNzUHB4WjE4eC9HWTR5T1MwOXZl?=
 =?utf-8?B?NXBTQURXM21ZSjF5UENxbjhNRCtEWk9tbXFnYk9ZQlhXQi9hMm5iL1RZMmVq?=
 =?utf-8?B?M29mNXVmZC9oRWhOMUtzaStIVUFycVBtM3duQnVLb0hOMEs2WmswdlE1OHJv?=
 =?utf-8?B?TjducjNGY0dMNnE2R2JTclhuSEw1aDVURXJaS1BZVDVvSnpJcnVTUjVnbGRv?=
 =?utf-8?B?Y1RVbkxoMnptRG1ucTM4ZzhuOS9KdGJlbGpMZytVcnlwczhiU2VGeTZuWnZW?=
 =?utf-8?Q?iFRxAhp6uIYMTZyrnBVmtKixk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99e6b9d-09df-4154-3660-08da9bf3b98f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 17:07:12.1686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOxtK+wvKYRS3LafFwkmY7UpeMAaGO+4jHPawlLm9I98LnvIkyt/s2BlgHWaAX1PeSVL2RZ25shGB1mDAoPl9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569

On 9/21/22 03:49, Jörg Rödel wrote:
> Hi Dov,
> 
> On Tue, Sep 20, 2022 at 11:28:15PM +0300, Dov Murik wrote:
>> * Implementation in TEEs: SNP introduced VPMLs, and AMD's linux-SVSM
>> running in VPML0 can also run vTPM code to handle TPM requests from the
>> guest running in VMPL1.  Such a solution is not applicable as-is to
>> other TEEs (SEV, TDX).  People suggested running vTPMs in a separate
>> confidential VMs, and somehow connect the tenant's guest to the TPM VM;
>> but we'll need a way to secure this communication channel.
> 
> Yes, so for SEV-SNP the way to implement a vTPM is via a Secure VM
> Service Module (SVSM) running at VMPL0.
> 
> I not sure how much we should care about the variant of running a vTPM
> in a separate trusted VM. In the long run SEV and SEV-ES will be
> replaced by SEV-SNP, and for TDX it would be best if Intel just adds a
> software TPM into their SEAM module. IIRC TDX already has some TPM-like
> features, e.g. PCRs, implemented there. A full vTPM seems to be doable.
> 
>> * Guest enlightment: Guest software currently interacts with the TPM by
>> writing commands to a memory-mapped IO page (GPA 0xfed40000) and reading
>> responses from that page.  We want such writes to trigger the code of
>> our vTPM (for whatever implementation we choose).  Our current early
>> experience with TPM running in linux-SVSM required adding "exit-guest"
>> calls after writing commands to the IO page, in order to allow the SVSM
>> to run and recognize the incoming command.  Ideally, we'd like a
>> solution that doesn't require modifying all the TPM drivers out there
>> (in Linux, Windows, OVMF, grub, ...).
> 
> It will not be that easy to emulate a vTPM at VMPL0 which has the same
> interface as memory mapped TPMs. That would mean marking the page as
> MMIO, but that will trigger a VC exception in the OS (or OVMF, Grub,
> ...), which would then need to forward the MMIO access to the SVSM. So
> either way, OVMF and Grub need modification to work with a vTPM running
> at a lower VMPL.

Agreed.

> 
> An alternative is using the ReflectVC feature to get the VC directed to
> the lower VMPL, but that has much wider implications and is not
> justified for only emulating a vTPM.

Using ReflectVC is geared more towards supporting un-enligtened guests. We 
don't want the SVSM to have to handle all #VCs that are triggered in the 
guest.

> 
> The current plan is to have VMPL1 talk to the VMPL0 vTPM via
> standardised SVSM commands. This requires new TPM drivers for all VMPL1
> components. At least unless someone comes up with a better idea :)

This is probably the best approach. We will have to modify the kernel no 
matter what, either recognize the MMIO range being accessed from within 
the #VC handler (and then parse the instruction, etc.) or modify/create a 
TPM driver that talks to the SVSM (and thus eliminates the exception 
path). Either way, an update to the kernel is required.

I'm not an expert in TPMs, but when using an SVSM enligntened TPM driver, 
maybe it becomes possible to even batch up multiple operations, which 
would improve overall performance.

We need to start looking at what the interface to the SVSM would look 
like. What is required from the SVSM (e.g. attestation report) and how to 
provide that to the VMPL1 guest, what is required to be supplied by the 
VMPL1 guest to perform the operation, etc.

To that end we can probably start talking about how we want to advertise 
support for a vTPM in the SVSM. I imagine it will be a new protocol with 
new functions (btw, look for an announcement shortly as the SVSM draft 
specification is now available from our website).

Thanks,
Tom

> 
> Regards,
> 
