Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01C22329
	for <linux-coco@lists.linux.dev>; Thu,  9 Nov 2023 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B3XjCchh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9yQdXyY+RH1mx1IeykktpmaD82Nij9YpAJEy+ihS2INz17TiQU64793SlLDnCrV1qcpurnovYPX4RbhClBh68Uql2bWw3z+1d9+2PiUg0JaXKFFq67cY5l3eJx4EsLbfUfs2nK8DjtOWsuJdN7sxbC6cxQRBMJWA8+D8Jwr1iRk/DiVmXssauWSZ9aUdKOSplrAKiLBQE1rpoXDz42gCfdB4CWyIBYtY4xV5bTW+kN8/fctpB2AaEwJBnMXhjZjqfVPkzQMHPk6Dse7KzdqrB037x/Or6Ts/RHST+qTr9dbV8qGwE9QgXRJ9PY99bRm/GtwYE1jbXRRvAjyDsnODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09xwgKHJozhFt6hkPaEkcxFSl4+ELzArGXyXsedvjpk=;
 b=HjA2xKPc2bP67Ng6B1O2lABZG7yT1Ct58udO/jUxr3mIyJoMphIQMLsdKNngNehZim5bUKYPjsp944a04L1L4jtnCCNPSvAuaPDAhw0xBlKC/YyGlO8xCRo2rJOj1wNlVartMMo3kUHyezY2PO2wYplKpDPQCOmNfiQtpeUucrTdQwJcLuwAr4kuGTB3NG6DW5DPwtx+1/kr3IzN6TW3HKkWLu7HFiA6T8e55uo2AXaEcyWBIAp2qYpMvZrWiIb5+F0pFhlhHX+R8F/39T1AdRC+b5MDBoRga9Q4RkhdgivzHpV1z76TmWl1rVQFIvYerGSlE3cZ1Gu3Ht0ijsrZOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09xwgKHJozhFt6hkPaEkcxFSl4+ELzArGXyXsedvjpk=;
 b=B3XjCchhcNNB80n7bhFyY4tV8N5xF1tyak2RjSNwOug8VVDeLTK3ekD7969W9RX36kpL25LkXu/w+zL7QRQswCANTA51CfZPMbKk9Xr1TYr1qa0XEMQL11CZuZ7nC/s6L75YVTAZPC2EwQl1P38CwVvgeJysil+BLiIzikVW/Lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5891.namprd12.prod.outlook.com (2603:10b6:8:67::19) by
 IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Thu, 9 Nov 2023 17:23:15 +0000
Received: from DM4PR12MB5891.namprd12.prod.outlook.com
 ([fe80::657:3c69:afe6:f855]) by DM4PR12MB5891.namprd12.prod.outlook.com
 ([fe80::657:3c69:afe6:f855%7]) with mapi id 15.20.6954.027; Thu, 9 Nov 2023
 17:23:15 +0000
Message-ID: <22966e1b-dd7f-4eb2-ac5d-5988cc6687b6@amd.com>
Date: Thu, 9 Nov 2023 11:22:47 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: CCC Linux Kernel SIG
To: Dan Middleton <dan.middleton@linux.intel.com>, linux-coco@lists.linux.dev
References: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao@amd.com>
In-Reply-To: <4dcca77e-e6d0-4cd1-9813-6a7ad24ba0e8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0060.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::10) To DM4PR12MB5891.namprd12.prod.outlook.com
 (2603:10b6:8:67::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5891:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c93e26e-8e1b-4d3a-d9b1-08dbe1488ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9GsTUtp8r4m99hVZYOd+K3aa0eJV0NY7/8IAq++fXqeFqe+vArKMrhBJdVS/D8BrtxnqkbXqq/kAmiSVy9ExFaNu6JBNwHo9TsUO86wgRoEKzocFJUtKTqiJpstet63WaEVFXZxeZ4eks6Z1FE1wHSLFUj3NbjCRC+6KanYQbtFygeTjssGvQjtrKs2vLz36aSAqFZRg+BU6yi/69HaDf+t4jNEWRvajV15/k284y1MoLve6ossRMxhRJ6KYOYfLKuKLDIgA16QVuEIIU6ZAcIJbZvk+X77Ib1HG+kvDhdabQkYaGOaw/UfRA0q0qJK344N7owZEzWBytlDK8n9GPFYOIfnLgBwV70MTQn15fyxUubw8zoFWIkHLHihZVfdSarsEpNpn7lKMC2XduAu5nsM4EcKzYPaBPuZkgyXN7fI7BCMkHPq66Kwxqdin+U81ruS4O7uf1b5LXlor8KWivZ9WoHIg3yFYqH8n9Rot2nHf6a2sNLQJ+IvhQr4DV3nkZhND3PiX7bhUUB2h2dGg3iMSYvgUOZTdRVrvy/yCrdY5XUCjHEBtx3jwrwTvdT5DMMZxNOZbB7BnhrqZKhlWYt+LI5owJX7MEGqqi+pxjPHUDgQKVmeeBV5s03nAHTgEMTfQkagj3DgVl+zshy7Y14Gdv5E6lvMDgsoriKjTYX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5891.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(366004)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(8936002)(2616005)(66899024)(6512007)(44832011)(31696002)(316002)(966005)(6486002)(478600001)(36756003)(26005)(66556008)(66476007)(6506007)(66946007)(6666004)(53546011)(8676002)(2906002)(31686004)(38100700002)(83380400001)(41300700001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cldNYThRUDJlbHVkUWNrY1J1VnBQZ3FJaThrOGNwNk5tSGE3R3hzL3lKbXUv?=
 =?utf-8?B?ekFFTXp2d3BFYkFIQi9CdUYxd2EvM3hKS3ZlcVY0RXQvQm1veTM5VXdWeG15?=
 =?utf-8?B?OW9SbzFOY1hJTWZScWdyZ2NJOFdYbnVyV3ZxczR6bjIvRUkvOHhWL2dXdlZQ?=
 =?utf-8?B?YloxWnZsRlhZUldnOVdGa1p5aVBMUWZVOFJrWW1pYktmR0tuWkpaL05GTTRG?=
 =?utf-8?B?K29XVnZmTFVXQlNFa2kzUXZxaXFRelBCVkViS0U2V3k0MXJFbmhUb09jSHRU?=
 =?utf-8?B?RjZ3YmdvSXF1STR0c2U4QmxCL2x3cGRJQjVDOHJQKzBMeHI3TkNrRWZmWlJw?=
 =?utf-8?B?MG5OVDVJOEE5cEd0TkVnVHpzdlVLWXB4a1M3aWVmZmFTMjRvRDdTaXZrSkRE?=
 =?utf-8?B?YWtMMytnWTlRcVFPcnFyaUx1M1hiQ0NVQ0NNbTMrbng4cGs0UlB2NkdrSmdr?=
 =?utf-8?B?UDVUOWRJbmlhQmREWWpOTk4rSVRwYngxVC9YY1lkbXZkb3pTTHB3YkdmREl0?=
 =?utf-8?B?czQ4Ri9pYkZVQ2dUbnVEeTQ0WlFFNS9sRU5saDhsZlVmTDlJNStkenkyWUFD?=
 =?utf-8?B?TlJxNjNhNjBsOVd4MEd5NTBVTVlSWXNCYklqcXhGZ0Q3S3FWMGFVUjV2L0lw?=
 =?utf-8?B?aW0zTzREaVVsOC9NelpuWTJnZUJ3YTZNcWt2aitiUm1OcFpQaS85SGdrWSth?=
 =?utf-8?B?djdtS1VUNHlCL3JyTzhpcXNnV003Wll1ZWlQZnc3dW9sM3AxSDZCdkRLZ2Jk?=
 =?utf-8?B?SXcxa3U2dDlaeTU4eDFnelFjQ25jWGtva1lkWTBoVXJwNzYxUmhNZmhIbWJp?=
 =?utf-8?B?MnF3OW02Y0tpc29TNEpSU3lSTG1uUjl4VUZtblZUN1dQckVoN2ltcmR6RHF4?=
 =?utf-8?B?d05Ba0w1Z0R1alFNbW1Ca0RKSEVFOUhOQnRkZ1llS3FEZ2Q1TmxsOXpjUnVm?=
 =?utf-8?B?YzNtMXBxUUthYzF1a3FVa1JKamZ4cDRKOVc1d092SmhtK0tackdHMytpUEhl?=
 =?utf-8?B?MWF6M0FHbEp6Y2c4ZGNWamZrbU9MTFRZSHpDMmhXQUxqN0RnYVVlMmpwenZR?=
 =?utf-8?B?aUtnK3Q4Z09PNVQwM25ycEUzbTh0T0tNZUxXdjE4a0R6VDJNcGxqUUtZSC9R?=
 =?utf-8?B?WXlwK1FhOTl5RmQzbmdXR0doQWVURGVWZlhKWHlRS3ljK0hhalhmbkFyM3Vp?=
 =?utf-8?B?YlF5Ri9kVm9vdjFqM1FFeXJJbmUvWWZxaU5xRUg5R1hoYnNLZ1U5ZEVrYzNQ?=
 =?utf-8?B?cTZxWVRpVEFrSVZqZnVWV1gyZnBvM3N2OEkrOEVkc0xtNGh0d2VpQWxQZitk?=
 =?utf-8?B?RTFGR2tBQkNPTDNXSG1TTUJzL285MzdZZkltemJGbGZYSUlxaFl4YmJGNVJp?=
 =?utf-8?B?MVliSmxZdnZ2T0NBRnEzb2FTM2hxZDFYUHl2eFFQSXUySURMVlNjYmFXTW8v?=
 =?utf-8?B?ZkUwLzZiVzZzeTZyeUd0Yk5JSTRxZmpEaVU3WitNdFNYSnU4bFJZMERVa1BS?=
 =?utf-8?B?dXY0ckQ0a293TTdzNHcwS2RXYTBmV3l5MGpRVnN6Sm5hYWMzUmFudXA3dTUz?=
 =?utf-8?B?S0RzdHRHR013V0pyZjM5L1BBd1daT3ltaVZWTlNTZGJ1dlMzbGI5Qy9MNzVW?=
 =?utf-8?B?M2I4U3IxNDROT3VmcHF1NHNLN3ZLSkNzUEh2NlRoRFBnd0hjSzFnc0RTZ3Rx?=
 =?utf-8?B?L2hjNnRadGxHWUl5d3JqWE53ejFMZTJWaEM1aGFlZGUvcVJFM242TnhPZG1q?=
 =?utf-8?B?anRlMnNtWUtWT2ZEdHZuelRrSnJOZW5CR0toV2s4VzY2RXFuQS9sMkI3Z2JB?=
 =?utf-8?B?KzF1SUQ2VlhWamtieGJUcGpYOEJYZ0l5a2lhSTRydnJFL0dxbmpzS09YbEpq?=
 =?utf-8?B?QUJxNkUrdFhCZXBrQWMxT3RnUWtUQnJkempDNlFlbDVwaEtzUzRUTm9FVGFX?=
 =?utf-8?B?OUJraktKOGVCU2kxREpxcHRONGwzdlU3SC9qYndtaFFtZ1pKNXJzdXVPcVlS?=
 =?utf-8?B?QklaSzB2a0FmUmpJM1JTNTViVExQMEpzOUh1OXZwUzR2N3UvRERTbXNwdFM1?=
 =?utf-8?B?MlgzUVBlN2VnR2szQ2hCYVpjVENKTkY2YkFLK040SVhxb1NMQThSZW90WlRL?=
 =?utf-8?Q?VvsJIiVb8rBCkLrxKmiuwkXIS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c93e26e-8e1b-4d3a-d9b1-08dbe1488ed3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5891.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 17:23:15.5522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5XZQMVLw3rIQvP1tiSaix3GLlC2D2Z6qLe+c0YIe60EFUpE2EP58GSC1esgtb2iGfcVgOTwbfryTik/Db0GKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

On 11/7/23 19:24, Dan Middleton wrote:
> Hi from the CCC!
> 
> Many of our companies also collaborate in the Confidential Computing 
> Consortium.
> There we are proposing a SIG and invite your feedback and involvement:
> 
> https://github.com/confidential-computing/governance/pull/196
> 
> The entirety of the proposal is also copied below.
> 
> Thanks,
> 
> Dan Middleton
> CCC TAC Chair
> 
> 
> # Proposal: CCC Linux Kernel SIG
> 
> This proposal seeks to accelerate Confidential Computing feature velocity 
> in the Linux kernel.
> By creating a Linux Kernel SIG in the CCC we can foster community dialog to 
> develop vendor neutral
> architectural approaches to new features and thereby reduce complexity in 
> associated kernel patches.
> 
> 
> # Background:
> 
> One of the technical limitations to the adoption rate for Confidential 
> Computing is the speed at
> which we as a community can add features to the Linux kernel. Each vendor 
> has similar needs of the
> kernel but has historically presented significantly different ABIs. To 
> contain complexity and manage
> maintainability, the Linux kernel community tries to prevent proliferation 
> of unnecessarily vendor
> specific ABIs. Often the opportunity for commonality is unclear until 
> multiple vendors have proposed
> separate interfaces [0].
> 
> The CCC as the home of open collaboration for Confidential Computing 
> hardware vendors, software
> vendors, and end users facilitates a unique environment for exchanging 
> views on features and
> requirements. Up to this point in time though most CCC collaboration has 
> been on user space software
> and use cases. The Linux kernel community has not been a regular part of 
> discussions and the CCC has
> not been a regular participant on the Linux Kernel Mail List (LKML)[1]. 
> Bringing these communities
> together in a structured forum has the promise of accelerating their joint 
> work towards broad
> availability of Confidential Computing in Linux environments.
> 
> 
> # Scope:
> 
> 1. Facilitate dialog between Linux kernel and Confidential Computing 
> subject matter experts:
>      * to facilitate direction for topics that need formal collaboration,
>      * to have an additional venue to facilitate direction for topics that 
> are stalled on LKML,
>        which would benefit from higher bandwidth communication,
>      * to have a common place to record decisions and formalize the output 
> for others to reference,
>      * and to introduce new technical topics emerging in either domain, 
> e.g., attestation mechanisms
>        approaching standardization.
> 2. Create recommendations for other organizations and communities such as 
> LKML, IETF, etc.
>     on topics at the intersection of the Linux kernel and Confidential 
> Computing.
> 
> 
> # Governance:
> 
> The CCC adheres to a culture of Minimum Viable Governance [2].
> We prefer not to create rules that inhibit the progress of substantive work.
> 
> All are welcome at all CCC community forums. This SIG is targeted to all 
> Linux kernel maintainers
> and Confidential Computing vendors, project contributors, and end users 
> with a dependence on the
> Linux kernel. Meetings will follow standard CCC practices of inclusivity 
> and openness adhering to
> the community code of conduct [3] and the Linux Foundation’s Antitrust 
> policy [4].
> 
> 
> ## Decision Making:
> 
> This SIG will use consensus decision making [5] wherein not all 
> participants must be in full
> agreement but that there should not be a strong consensus against a 
> proposal [6].
> 
> In most cases we expect that once the SIG reaches consensus on a kernel 
> topic, contributors will
> propose aligned patches to LKML without any explicit communication from the 
> SIG or the CCC.
> 
> If a formal CCC recommendation to another organization, e.g., IETF, TCG, 
> eBPF Foundation, etc. is
> required, the SIG will rely on the CCC Technical Advisory Council (TAC) to 
> ratify proposals from the
> SIG.
> 
> The pipeline of activity is expected (but not required) to look like this:
> 1. Identify feature need on mailing list or informal forum.
> 2. Exchange community proposals in the SIG.
> 3. Achieve informal consensus in the SIG.
> 
>      a. Author patches and take them to the appropriate community, e.g., LKML.
> 
>      or
> 
>      b. Raise an agenda item for the CCC TAC to formally ratify a proposal 
> and publish to the
>         appropriate organization.
> 
> 
> ## Initial Logistics:
> 
> The community will set its own meeting cadence starting from an initial 
> cadence of meeting twice per
> month. The CCC will provide a Zoom channel. At the end of each meeting a 
> new chair may volunteer to
> organize the agenda for the next meeting. The chair role confers no other 
> responsibility or
> authority beyond collecting agenda requests from the community and 
> enforcing minutes and good order.
> In addition to video meetings, the community will use an existing Discord 
> channel for ongoing
> communication. No mail list is required at this time.

May I ask what Discord channel you're referring to? I'm assuming it's
open access.

> 
> 
> 
> # References:
> [0] 
> https://lore.kernel.org/all/64876bf6c30e2_1433ac29415@dwillia2-xfh.jf.intel.com.notmuch/
> 
> [1] https://lore.kernel.org/linux-coco/
> 
> [2] Sarah Novotny, Stephen Walli, “Minimum Viable Governance”, Linux 
> Foundation Open Source Summit Europe 2020, 
> https://www.youtube.com/watch?v=C2-_MjzP-Rs
> 
> [3] 
> https://github.com/confidential-computing/governance/blob/main/code-of-conduct.md
> 
> [4] https://www.linuxfoundation.org/legal/antitrust-policy
> 
> [5] https://en.wikipedia.org/wiki/Consensus_decision-making
> 
> [6] See Rust’s Final Comment Period (FCP) https://github.com/rust-lang/rfcs
> 
> 

Thanks,
Carlos
