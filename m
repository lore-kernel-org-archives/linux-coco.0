Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3342F2C
	for <linux-coco@lists.linux.dev>; Wed,  1 Mar 2023 15:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1RyN8FEoDgX/DDXl/SFbzEI/Qun/t8yElv2oUFexGMi6sXWRlyxQ5s9LRq0/gFtBbTu6vZkv5gtZI5GIg9GkscY7I28oQ/WgWh+XQkxfp5nAAHQnsPrScLk9wg232XZEnGc5VvX9UeGikHDOzTW9IiLCy2wBTCk4ZVOBXHq9fHfW35DLIZbRWRqoPCv1dMM53Zymtno5ExAP1cKJJP+QTUJIc90y6bZSNbSP5GMgvAJWyWc7in1on8Gqo3h8QY2kBVIpF3K6TsyEvGlDMNsHxv/jcBXUpMfi0BX18NX+SjvL0AzgziQIfTI0dExfPFhUBqAGF+Mp1NUqhxnE0spKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F80q43xHUHe+aADrdp+UqvY3SEuy873pnOz7dd2464M=;
 b=bTz+o/WkMc6koHNcMG9FOd5JuR97xVhane1VYX02mdj5i4BDl+TFDo6+y2Q8WVaUfPtQXHesHCtTg172KbVB+aZkZ1nFmAHg5sYwbEKTh4whhMfILnkPASRzaTP2PkjKsFr/vam2WVOhV7z/Oe5SHgDU0J/Qdkt4r0E92Ga5dQ+5fvhfQACP7lA0SGjVZxJZkppT2mIjMjDMK7a3iUBvBWShoVswugdtpmNOiNFv4c7ktKP22GiciE/zDVTKKwKyrWZlAoJA+/InfPaIumN+5ITVOwzGlppzH2hervM9ct4F/zumQCQqWuYSi3xERgcyoU42OZbu6SwutPVlYYgMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F80q43xHUHe+aADrdp+UqvY3SEuy873pnOz7dd2464M=;
 b=gM5gLyc4D+Kr5eI77sL1tsV97JHO0XFQc42ld+ITXMloW9uJb/oIIuhTywbFYtHVS6NshhehEHRD8RxY5d2YVpj3c2Vk8wRDTXS9YMILl+XPzUTUyL135ijevmeDWHiils2du3zTMaGOs9OB1U9G/zXPk4H72ZeTL1HZZiTur60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 15:00:27 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6156.017; Wed, 1 Mar 2023
 15:00:27 +0000
Message-ID: <88f87fe5-e503-5faf-c36e-13595443a69b@amd.com>
Date: Wed, 1 Mar 2023 09:00:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: SVSM Attestation and vTPM specification additions - v0.61
Content-Language: en-US
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de> <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <Y/jGcMhXfEm8MCYK@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:208:256::24) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DM4PR12MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: e8783f38-0765-410f-a2cf-08db1a65b114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	boMD06hGjV1HGkVBQmnItAarxy8UfoL0s9mEDCjZtqktAQ1dgMkVMxqNuvd15+TMD/wnH/2x2tDme7dtL6WMSQmYD8Q0B8bErt/cEDrwuKYe/VVrYoj89zXUgqCu5vwBpGlvXnod/xsD0+AJE93gBLaYeKJN2NpY693PtNz97dQMa4XGeRYXuMO+h2f28i0QXoeyb/OVG6Nprbjz6nx2Acua4B0F+NtFeMzLvQbUcREnR2dqWZ7XZ9L5yFHbOWYuJrgokhOsxijLKiFFcWGjdGpt5XpVf6B01OIm0kqJxI9u4Lu1T6MQsZhSag/v8JD1IHMxfiwh+N9nWJvGCVJQSU6Dwpnlqfm/+cbTm4MgEL4028hx6uyVSSxkpnZxJSVAz3jOYsoxZfeaL3CJenf6TAMw06+qFQgk+RAap3E8dU0sqcnAk6z+Q4t3qE2owQ+kRD3iJrmCF3TvKMfiu+nbV38Vu3ZTMJTO7azxh1RT7BYdYvT5OyntiMJRXHW9TOMpGNepFw3Eps3yHVLcLuDRRLRNba10WJgNYRFv/KPxrGgEoIWepvOsdhGKrbYggMpGVDRgRmyJnpwMMKPLNUfHf/AYOoNtsmevAy+9fc7bA8Y3c/59BTu/eLsZh1HHddwua1/pWuBYUYzGPPKtZzNcYH7k9xYYsUEb9CTCudn5zACquif4PzTqN0moTRBAH59epxwI0fnhQWritYVktWTpJ5/550O52+V2pIMPAnpOK3A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199018)(31686004)(6486002)(66946007)(6666004)(6512007)(53546011)(36756003)(6506007)(41300700001)(8936002)(2616005)(316002)(66574015)(6916009)(4326008)(478600001)(8676002)(66476007)(66556008)(38100700002)(83380400001)(26005)(186003)(54906003)(31696002)(2906002)(86362001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yk5lWS9FdHc5S1lHeis4WEllVnNESENZWkh1MmhrQk0wcFZMd1NmamZONjFJ?=
 =?utf-8?B?MHQ1VkkxVFFTOEZzWU0rdkVhajlZN2M5enc2YlUxUFQ5alUwNU8rcDR3QkNV?=
 =?utf-8?B?ZjJzZlNiVW5rbzRrYnZaeWZORExjRVQvZUFpblJUbnRaOXRwbXNXUGh6ZjVO?=
 =?utf-8?B?Y21lMDFINTlVbFV3VWl4ZVVMTHNxa2NXVWJCU09jbnVsVXNkNzUrc21pL1lU?=
 =?utf-8?B?K05FWUJQbERWRmRUNTNhR0pla1VWcW5HaklPT1pYazU1RWxUdXRWQjZLSGx6?=
 =?utf-8?B?dEZWMklScDlKdzRERlFUMTVoY3B2eStDOTBmWloweWZaenFLSnpZZmdPOU9K?=
 =?utf-8?B?TVpIU25nM2xON3JXQWZyYU5rQ3BUODN3YW1WYVRtTUVEMlBCTnEwQ3NST3R1?=
 =?utf-8?B?TFNMRHJEUTdDd0lFbHBka0FNT1JWa1A2Q2ZqemNzNk9mSEZDQXhxV0FPakFR?=
 =?utf-8?B?UGI1cE1OOG91d0xTTUFjdWMzaWlXZjNmVFlpQmI4OEhuQ1VmUzNNVVBGaVBU?=
 =?utf-8?B?KytqM2F3cjFsdnZxaS93UWR3cWxjZjkxN3pmRklFN2Y3VE52anA0WDFIdVNz?=
 =?utf-8?B?dmxla3dydU1YUXpYc2M5MWN6bTQ2MEc5TDBLVFJYMXNQUXBSOStvckUvZkFQ?=
 =?utf-8?B?eTRmVmpqT0FVMzVScGlEOWNxNUVYbVhtbDhheU16Z0xCVVZWeEw3eHQ5QmFN?=
 =?utf-8?B?RHRSUStRdjIzYno5WjF3TEJoN0Fidm9ZK3piVTBsZG1Icm14djdObnB6UGlG?=
 =?utf-8?B?VVg1NExvWGx5cFFsZTgxOEhCZDBjckVTbnVraWpNSCtiMzdpcGVoSEg3VFNE?=
 =?utf-8?B?SUg3U3RLcTdRVmdzdWw0c0djYU1YVlg3MnA3bGVDaFJPRDNMa2Z1S29BQnJj?=
 =?utf-8?B?QzhvZUpHMmJiWVZhQkZzRHZBendFUy9DTm9JemZ4VDVQZ1VSdE03MHZxWnhh?=
 =?utf-8?B?eHhIcEJhNWQ4a0lpWDgzb1VvM2ZwV2FLMCtaWldSQm1FUnFWOGx3SU45ajYw?=
 =?utf-8?B?b3JZVjMxbUpodzdUYkM2OW5CY24ydTFPbTVmOFVEOTJQb2dIdzZBR3hNSWdu?=
 =?utf-8?B?dEJYSHNXTC9rSE55UVdWRmNzRmFIVXdzZ0lMQ3ZQa1ZOUGdrZmE4NGZXRW9R?=
 =?utf-8?B?Y0JnWmQxODdLREowaEtla0N6Mk43T3V2OTV3SlRIRnFKc0RtQ1hlMmJCRFVl?=
 =?utf-8?B?eE9tZDlHaXordVZJbkNpRkxKbnNhYU1pY2dlR3JWNm9GT0xld3hwNDlIZHJo?=
 =?utf-8?B?eDRBK0lDWmRKSFFTVmFiYUVzSzhKd0ZoSG03WjNId3U4cHVtcGtBWG9aL21R?=
 =?utf-8?B?em9BbWpjSndMZkJuZHlJZVJqcFRHU3hrQnlWWm5GaVRpaVk0QmpGVm5CNDFo?=
 =?utf-8?B?NkkvNWFTVDRlcy9lMGJMN2xXSjhqbHBEeXEvNGtsREx6cG9RaGJQWVFCaUdq?=
 =?utf-8?B?MndVSWZuMFJtdGN2V25qY2Z5L2pxOVJSZHh3a0tLRlkwUVVaWlEzbTk1eHF3?=
 =?utf-8?B?NERYMEZzTVVBeHJUdDlubnBtbVFnZ1RGM0dXN2M1K3NtVVpFVFBIR1Zhdjdl?=
 =?utf-8?B?dytVR1hHK2U2Lyt6SjYyWm5UWUtONkxzanl6SnZrSTV2bGZIRnJXc3F5cGdK?=
 =?utf-8?B?aWpOSytwRHNGeUF0U3FYQi9aRkNSekZueU1SNWxRbDZtanQ3aCtpUWlPZnZo?=
 =?utf-8?B?eWlOV0dBT1MwdDB2SjhURDMxLyt0czFVYnBjNUJmWXhKdCtPWU1zd0dOcS8w?=
 =?utf-8?B?UlVEZ3JJM3FlcVFteitZOS9hMmNkWVhPbWx2Vnp4THgreVhTMWtuKzlFbEdE?=
 =?utf-8?B?OWdlRzUyOHFxN0V4T3pRNUFaQk5CeE9TTlA5M3dUTFpuQy9tTlNrWXptU0d2?=
 =?utf-8?B?UnlDR2dyNmhxUU15VHkvTXN2aFBacTU4Nk95cUJvaFVQVVNDODcvVnBqQnV2?=
 =?utf-8?B?SzljVlM1WkxUa1ZCM3VBdS9xaWRhdXVGZGRFRmlWVEd6YkN4RTBMOENLQ21L?=
 =?utf-8?B?blAwYy8wOWdEUnE2RjFlM0cySXlRc1JzakRCUkNjbUFqSlkrSjhSZEtBMUFR?=
 =?utf-8?B?UFhlN2JTU2RkcitnMEUxUERUYTFOTjd2ZnhTOGVoRUd1ajFWWmVOYXRPeElL?=
 =?utf-8?Q?owkaHhdfvltC8jjPrLDLN6qkF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8783f38-0765-410f-a2cf-08db1a65b114
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 15:00:26.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WD4F4AD1IwOqhCCZkP2qjZ1QT2gs44LaJoHpDUYeZj2sycpw4EPVX6DltB1VM0gwWGQVNGVHEzHVMeeOaNLeaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230

On 2/24/23 08:15, Jörg Rödel wrote:
> On Tue, Feb 21, 2023 at 04:07:46PM -0600, Tom Lendacky wrote:
>> VCPU create doesn't actually replace the VMSA from the hypervisor point of
>> view. The guest is still required to invoke the GHCB interface to notify the
>> hypervisor.
>>
>> The SVSM PoC leaves any current VMSA in the list of all VMSAs, but does
>> replace the current / in-use version of the VMSA for the specified VCPU.
>> This is used to examine the register associated with a request, so the guest
>> can shoot itself in the foot if it doesn't switch that VCPU to the new VMSA.
>>
>> I'm ok with either doing that or, as you suggest below, checking if there's
>> an existing VMSA for the VMPL level and failing the request until the the
>> existing VMSA is deleted. That does require the deletion/creation to be
>> offloaded to another VCPU, though (unless we allow the self-deletion change
>> talked about below).
> 
> Yeah, so the current protocol expects a bit too much from the code
> running at VMPL1 for my personal taste. I think it would be better if we
> put some constraints into the handling of CREATE_VCPU and DELETE_VCPU
> calls to keep the number of pages marked as VMSA as small as possible.
> 
> With the current semantics the guest is required to call DELETE_VCPU on
> any VMSA it no longer uses. But it is not required to do so. Also there
> is a race window between switching to the new VMSA and deleting the old
> one where the HV could run the old and the new VMSA in parallel.
> 
> The SVSM will not get to see any old VMSA before it is retired (e.g. to
> clear EFER.SVME and make it invalid) until the DELETE_VCPU call, but at
> that time the new VMSA could already be running.

We could specify that any vCPU create where there's an existing VMSA at 
the VMPL level specified, results in the existing VMSA being "deleted" (an 
implicit call to delete vCPU) before performing the create vCPU. If the 
old VMSA is executing, this would prevent the creation until the old VMSA 
can be deleted.

The guest could get itself in trouble no matter what if it does not 
quiesce the target vCPU before either calling delete or create vCPU. So I 
think the above would work ok.

> 
> I don't think we can fully prevent such attacks, but we can make them
> more complicated by having some constraints who and when VCPUs can be
> created and deleted.
> 
> In particular:
> 
> 	1) VCPUs can only delete themselves. Exception is VCPU 0
> 	   (or whichever VCPU the BSP is).

I don't think we should have this limitation. We don't have the limitation 
today when the kernel is running at VMPL0, so not sure we should have it 
here. If the guest wants to do it, then it is really up to them as I don't 
think it's an attack against the SVSM, only against itself.

> 
> 	2) VCPUs can only be created for same or higher VMPLs on any
> 	   VCPU in the guest, given that there is no VMSA configured for
> 	   this (VCPU, VMPL) combination.

Agreed, we need to verify that the caller is not trying to create a VMSA 
at a higher VMPL privilege level that it is currently running at.

> 
> These are constraints the SVSM can enforce and it should keep the number
> of VMSAs in the system minimal.
> 
> It requires some changes to the current OVMF patches for SNP and SVSM,
> though.
> 
>> It might be desirable to allow another APIC to delete a VMSA. Maybe kexec
>> processing would be able to benefit from that.
> 
> Yeah, maybe. On the other side kexec would benefit if VCPUs delete
> themselves in the old kernel. Otherwise the new kernel needs to find the
> VMSA GPAs und delete them manually.
> 
> There is already a code-path for kexec/kdump where the non-boot CPUs are
> parked. This could be instrumented. If a VCPU deletes itself the SVSM
> will go into HLT until a new VCPU is created.

Yes, this would need to be documented in the spec to be sure we get the 
proper behavior on a self deletion.

Thanks,
Tom

> 
>> Should the clearing of the SVME bit fail, then a FAIL_INUSE return code
>> would be returned. I wouldn't think that the synchronization would be that
>> difficult, but I'm not sure. If we do allow self-deletion, then, I agree,
>> that would work nicely.
> 
> The question here is, can we reliably detect within the SVSM that
> clearing EFER.SVME failed?
> 
> Regards,
> 
