Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123A872
	for <linux-coco@lists.linux.dev>; Fri, 23 Jul 2021 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1627038257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Npt1n6wVMVmWpfsgwfl1/ungaVj5vcZucbo9ihzCyw=;
	b=moywjODsCV6s1fQaxF7Pql5SAS5FLh4MlyKmbR3zFDzF+mcBfYwRqhoBaXT1JxR5MgqagV
	l1MbApNTf7pDK0UXdDudaM0Ve5oyzPCkfpm8RigrRwJHJROL0CDIm8A0GCMu/kjoQebrED
	kykIHAQzjCWDcfGaOXuwM4/DZV/dEFQ=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-bQJ0mvEZNeq1G0XKll2SIw-2; Fri, 23 Jul 2021 13:04:15 +0200
X-MC-Unique: bQJ0mvEZNeq1G0XKll2SIw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOmq+J58sHiaxs1F9PLidL5PzJwmUNthhL0Frr7BDt06TVtGgqxiTzvc3RNBflv2jpzd+2L7lnfLZV7bwoTCX348+v33F66ag36HExPRxlJbbfRWTGGvpNsJZQ+iroptELr/B/H9x9IKjr06J9PrRq0LtgNnXhwGc/Xr48BnUKSw9ULKjwSsgavETObvcI7WTpciomAztGuFXC3LJJIeRDBqGKtQsrw83wnKsiMDevVnnpAcE0P6wf5nJrVnPxhuWZVo0GZzrLk/ovy2jGm0u6YgyCCgcKWdo8vHsHC+E+AkU0AgXDQ+SLAxCHm1lUPWv1CxN9mtNeIBgaT60HxtPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/pBQIXarbMYL76J43sriXgOVUzTNb2gP10iOp7X1wY=;
 b=kE8h98/eGOfsgpLY348pAPt86BryTGeyY51cq9fP5zMi4vEinI3r1u9JzFNAKCZFnEHP0ggoAhD8WBsFn8/wdJ/vm2DLT5kA8eSmSKcJHNvDUy3Qs3sFe/J9Lht9x/ux2902gJkPFhqaBJhnKrLpBHYPAoQ5Pq6XmbvqA1VGIHY65EtuNxOAYI/ium1hfJdLrbD5ihOUMTtBhbjmNdY7ZTCXMGXR/5LF3C9DwBLXLSCTr0BdFdFk24cHrg181iR7FygiEaYpSSvCzlh0eRM1fvbmOtng69E3V8W8lVgDrYrFN09qNtpplMuHNn0b//rcBttrm4LxRga+KioTLAzNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4338.eurprd04.prod.outlook.com (2603:10a6:208:58::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 23 Jul
 2021 11:04:12 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::55a8:3faa:c572:5e98]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::55a8:3faa:c572:5e98%7]) with mapi id 15.20.4352.026; Fri, 23 Jul 2021
 11:04:12 +0000
To: Joerg Roedel <jroedel@suse.de>, David Rientjes <rientjes@google.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andi Kleen <ak@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 "Kaplan, David" <David.Kaplan@amd.com>, Dario Faggioli <dfaggioli@suse.com>
CC: x86@kernel.org, linux-mm@kvack.org, linux-coco@lists.linux.dev
References: <YPV27hDPZUoVsIZt@suse.de>
From: Varad Gautam <varad.gautam@suse.com>
Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
Message-ID: <07abb8b7-f25a-6aba-9717-1d1418e2610a@suse.com>
Date: Fri, 23 Jul 2021 13:04:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YPV27hDPZUoVsIZt@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::13) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.77.33] (95.90.166.153) by PR3P192CA0008.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29 via Frontend Transport; Fri, 23 Jul 2021 11:04:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be5cd5c2-7c57-433c-9ea8-08d94dc99a1e
X-MS-TrafficTypeDiagnostic: AM0PR04MB4338:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtAddr,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4338924A6200BB1FA9664FB5E0E59@AM0PR04MB4338.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/BzvgDgFiUEA+3W4AmzuQ1hmoOxoXJbxpcbIpyHhpm8HwPXggRF6+lbMvQFSNfziFTJ8nX8Ky7yYeNs3whQmB8qjWcn4RO7r1MB2iZmdf3W90Lg6EI3BpaJzmUl9BrfvHn/XtYu3YWqbWW6lGG2uJ0EupVnVNL3tWIvyPEFBOcUPr516tld/Pap2pSICdvbf13MjNGR3wpnLHjClH86XLMsYWf0LCO7E9i83kF3amwYe4l6flVIRsn0HL+TSICCIQLFzmIYDaP4fcOOu4xZPBX1DbD71sMBw7wJT6mdfYCvp6DsKRXaFQaEGe6msG4PH0FTCozdpQT/hHeBzfosloNvsm4QYXuhxJ1ufwGtQhlKCACb118Vwwj3J6f98eWNYFaf0GicWJpeRhk5VqkF3dObLA0+sGK8rq4n1NwPgdBlaI4QaKu7gZ0wOSD1spJ1IwPs1vnAuwcTLgqm50c4fURM2XhCt85BDIDeblAV+pbNn1uhIALuagmD8jnaOPb9BanGjD45H0hdR139I5pvIn/s2mbPBCpGg8G1v4Lxv/tkKANRJUGr2Bg6woCT+qbPB2TjegAR28gKUBSZ1Fbnl86X4hrB5YFYGFwoEXufipy06sZK5hCiTBwUKtCOnEnlImZsAxOJx0uP/GSbpJ/OWapdSC8ukhKNG5AAtdCl+ZUhBT9KuklH9808jAe0zbvHuRc6JKgbVUYOd67bmUl/fNNw5we9ngyq4n8uLPEttGPwJxmw9nQPzXLOu0t0W8QJShzmIBzAoCuUE4sgolDCS+SKKJyCRdtTcdb/8R8sB4qx16gVvAVf/PJ1PWPfqUZw3LCFH7N6eUAyo8iPS7ubTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39850400004)(136003)(396003)(346002)(376002)(186003)(110136005)(26005)(2906002)(921005)(6486002)(66946007)(66556008)(86362001)(66476007)(6636002)(44832011)(478600001)(966005)(316002)(53546011)(66574015)(83380400001)(5660300002)(16576012)(38100700002)(31686004)(4326008)(7416002)(31696002)(8936002)(8676002)(956004)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjBDN0syZis4Y3Q2SzUvNlRnQXJ0TVNlZGVzai9vdVNSZ29CNFZ6Ykcvek9Y?=
 =?utf-8?B?RHh5VVF5Rmt1eUhjcWhNMFNoV2MxWEdXZWo4U3NCTmcvMFdSZHNWVmYxRTNn?=
 =?utf-8?B?YmxqeVVnazdpMGNIMDE2TEdqVk1pN3JrOHF5cHlUM2x4M0NXam9xVHVoS2dR?=
 =?utf-8?B?RHpGeWF3b3Zsb3hJZEwyVVhsQjFDanFBTGRkNHBkanFZUXI0byt1OXBERmox?=
 =?utf-8?B?eG5oS1BVSVB1THEwWEZ6NGdOVEdwYWtvV1RkZkgwYXZXbVJPTVNjeEUwZDM0?=
 =?utf-8?B?RCtHaFpOZnF2OFpjT2xUU2lpY3NTUTNicVVmVStIblkrVUNpRDlEWlA4c3Fu?=
 =?utf-8?B?U0NCMElDQnM2eCt0b1phZTlvSUM1aW85SVlVempSR3l4WUcwY3F2K2lWZk0r?=
 =?utf-8?B?SHQxUHBEck4zd1cxNkEvcTRxUWRBVGJ4aENyakgwMnBCa1Iyb3Z4ZG1CaTRD?=
 =?utf-8?B?U0ZHcUhubEpjUllkSnVCRzkyRVp0N0p4RnBPNnptbWZnRXZiaTNIM2lOMXhY?=
 =?utf-8?B?cDgyN1dhK0RkU3U4VWJ0VjByMk1kSnlMbVpjR2hFajdiamp4NGtVZSthZjVQ?=
 =?utf-8?B?TjU0RjEyTkVaTkNyV1JXQXZJNlcyQWM5QlM4a1hsTklQVExSOWZxTDlSMnJu?=
 =?utf-8?B?andPNUF0SlFXR2ZoK0dkMk5aa2F3OUJPd0JTNHQ2Qm5vcVBacEgyczEya1li?=
 =?utf-8?B?ME5uRXFoVlgxVHJxS2VuWGFQWTdMVkFyV2xQNUp3bXBWb2JQYTJjOVJZeVR0?=
 =?utf-8?B?bUVtUW4vckZYc3EzMGlrdkp3RVR0WEY3Y0dXNG5TQkdjamMvWTJOWDEyblc2?=
 =?utf-8?B?VXZNL09Wd2tSVVUyUGFxWjdERTlMWHZWVTlSY0o1RkVrZkhDa0tNMVp5MHVj?=
 =?utf-8?B?cERlbExzNDFLT04yMGxxOTk5RUVBdkdqdWhJb20rbURkYkh6RXZKcU11UDBO?=
 =?utf-8?B?d3BqVmhRaXEwUGd1NW1sRDNwTStmdzBib3diSEFyN1BEUHJRd0x4cW4zeXRk?=
 =?utf-8?B?emxURmlnWnZhOVM2R3pET3ZyaEhLK2FFWXUrbTJDSEZZQWFkSFZHd05zM2NO?=
 =?utf-8?B?NXlPeTVmSnRzSGVyN1NoKzkxemlMY09jZlNycXUxRHoxWEtmNlA5S0phUExZ?=
 =?utf-8?B?STJ3SFF0bTc5RlJxNmRvcjlzb3FEQXo1UXpQSS9BdytJNjVZNGs3dVdZbmk0?=
 =?utf-8?B?SlEvVGNXMnZQSlc3Ull2S0VBdUlERmR3cWE3aWoxd2s5VEFqQnY1aENCeEZr?=
 =?utf-8?B?VmlRNnd6bE9ZbUxYYUpUUGczZDdRZWljQ1A3cnpUOFRIcC9CTjZDMXhneGhY?=
 =?utf-8?B?Nmt5Z1N2czRGeG5KMUlyRHdsaXVSQy9iSjFqcG9BblNxVkpHZDc2Kzg3TGhm?=
 =?utf-8?B?VTNHcVU4bmVuNUtkNGlIdUgwSmRFaDFDQzMyRlRwSTJjVGZwYVlyYjdZWkFk?=
 =?utf-8?B?ekZRQUhSS3N6a1Z3MVB5Ulc2OXVBaDRzQ3k3TUVxS3BiSlNBbGxpMThScGdO?=
 =?utf-8?B?d3MwOXZqcHQ4U3NKeUJNbmxFRmRLVFZBbU1YckIvUVVLaE1nUEdEa0JMK1BG?=
 =?utf-8?B?TUFzd2FsKzdZMnlpYVpMSis2bjF4WlkwMXQzdTJ5VXV1K3lWN1ZiRUlpdE5l?=
 =?utf-8?B?elBsdnp3M2RSdVdpanpDSWsxOEN4MmVUeFE0REx6WnphTmlrU2ErMzBGZ2s3?=
 =?utf-8?B?UU1COXFvRWFLdGpIbG84alB6dzNVUmEveG1oV25zTTlNRVppTEtnSmxybGdl?=
 =?utf-8?Q?/Giq2AyE48wjZ5rBUYOtKxtwzgLIWrPpgLV7RFe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5cd5c2-7c57-433c-9ea8-08d94dc99a1e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 11:04:12.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1tZHbj4ErHieBdcXNOSDvo7Hk/AP9DKOVcieLuamYMSjUliq41L0PEGIIEB8tAPD9XhoCKUQY1HPbsNgR+6sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4338

On 7/19/21 2:58 PM, Joerg Roedel wrote:
> Hi,
>=20
> I'd like to get some movement again into the discussion around how to
> implement runtime memory validation for confidential guests and wrote up
> some thoughts on it.
> Below are the results in form of a proposal I put together. Please let
> me know your thoughts on it and whether it fits everyones requirements.
>=20
> Thanks,
>=20
> 	Joerg
>=20
> Proposal for Runtime Memory Validation in Secure Guests on x86
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> This proposal describes a method and protocol for runtime validation of
> memory in virtualization guests running with Intel Trusted Domain
> Extensions (Intel-TDX) or AMD Secure Nested Paging (AMD-SNP).
>=20
> AMD-SNP and Intel-TDX use different terms to discuss memory page states.
> In AMD-SNP memory has to be 'validated' while in Intel-TDX is will be
> 'accepted'. This document uses the term 'validated' for both.
>=20
> Problem Statement
> -----------------
>=20
> Virtualization guests which run with AMD-SNP or Intel-TDX need to
> validate their memory before using it. The validation assigns a hardware
> state to each page which allows the guest to detect when the hypervisor
> tries to maliciously access or remap a guest-private page. The guest can
> only access validated pages.
>=20
> There are three ways the guest memory can be validated:
>=20
> 	I.   The firmware validates all of guest memory at boot time. This
> 	     is the simplest method which requires the least changes to
> 	     the Linux kernel. But this method is also very slow and
> 	     causes unwanted delays in the boot process, as verification
> 	     can take several seconds (depending on guest memory size).
>=20
> 	II.  The firmware only validates its own memory and memory
> 	     validation happens as the memory is used. This significantly
> 	     improves the boot time, but needs more intrusive changes to
> 	     the Linux kernel and its boot process.
>=20
>=20
> 	III. Approach I. and II. can be combined. The firmware only
> 	     validates the first X MB/GB of guest memory and the rest is
> 	     validated on-demand.
>=20
> For method II. and III. the guest needs to track which pages have
> already been validated to detect hypervisor attacks. This information
> needs to be carried through the whole boot process.
>=20

The need for tracking validity within the guest can be eliminated if:
- the guest has a trusted communication channel with the security
  processor (PSP in the SNP case), and
- the security processor has access to the validation state (RMP table for
  SNP)

The guest kernel (linux or non-linux) can then just ask the security
processor for this information when needed, provided the communication ABI
exists.

I am not familiar with TDX specifics, but for SNP [1], I see that the PSP
firmware is able to dump the page validation state along with some other
information into a per-page metadata entry on the SNP_PAGE_SWAP_OUT ABI
call. This leads me to conclude that the PSP has access to the RMP table,
in which case it can probably be made to export the RMP state for a given
guest in a cleaner layout (eg, a guest 'GET_VALIDATION_TABLE' call)?

[1] https://www.amd.com/system/files/TechDocs/56860.pdf

Regards,
Varad

> This poses challenges on the Linux boot process, as there is currently
> no way to forward information about validated memory up the boot chain.
> This proposal tries to describe a way to solve these challenges.
>=20
> Memory Validation through the Boot Process and in the Running System
> --------------------------------------------------------------------
>=20
> The memory is validated throughout the boot process as described below.
> These steps assume a firmware is present, but this proposal does not
> strictly require a firmware. The tasks done be the firmware can also be
> done by the hypervisor before starting the guest. The steps are:
>=20
> 	1. The firmware validates all memory which will not be owned by
> 	   the boot loader or the OS.
>=20
> 	2. The firmware also validates the first X MB of memory, just
> 	   enough to run a boot loader and to load the compressed Linux
> 	   kernel image. X is not expected to be very large, 64 or 128
> 	   MB should be enough. This pre-validation should not cause
> 	   significant delays in the boot process.
>=20
> 	3. The validated memory is marked E820-Usable in struct
> 	   boot_params for the Linux decompressor. The rest of the
> 	   memory is also passed to Linux via new special E820 entries
> 	   which mark the memory as Usable-but-Invalid.
>=20
> 	4. When the Linux decompressor takes over control, it evaluates
> 	   the E820 table and calculates to total amount of memory
> 	   available to Linux (valid and invalid memory).
>=20
> 	   The decompressor allocates a physically contiguous data
> 	   structure at a random memory location which is big enough to
> 	   hold the the validation states of all 4kb pages available to
> 	   the guest. This data structure will be called the Validation
> 	   Bitmap through the rest of this document. The Validation
> 	   Bitmap is indexed by page frame numbers.=20
>=20
> 	   It still needs to be determined how many bits are required
> 	   per page. This depends on the necessity to track validation
> 	   page-sizes. Two bits per page are enough to track the 3
> 	   page-sizes currently available on the x86 architecture.
>=20
> 	   The decompressor initializes the Validation Bitmap by first
> 	   validating its backing memory and then updating it with the
> 	   information from the E820 table. It will also update the
> 	   table if it changes the state of pages from invalid to valid
> 	   (and vice versa, e.g. for mapping a GHCB page).
>=20
> 	5. The 'struct boot_params' is extended to carry the location
> 	   and size of the Validation Bitmap to the extracted kernel
> 	   image.
> 	   In fact, since the decompressor already receives a 'struct
> 	   boot_params', it will check if it carries a Validation
> 	   Bitmap. If it does, the decompressor uses the existing one
> 	   instead of allocating a new one.
>=20
> 	6. When the extracted kernel image takes over control, it will
> 	   make sure the Validation Bitmap is up to date when memory
> 	   needs to be validated.
>=20
> 	7. When set up, the memblock and page allocators have to check
> 	   whether the memory they return is already validated, and
> 	   validate it if not.
>=20
> 	   This should happen after the memory is allocated and all
> 	   allocator-locks are dropped, but before the memory is
> 	   returned to the caller. This way the access to the
> 	   validation bitmap can be implemented without locking and only
> 	   using atomic instructions.
>=20
> 	   Under no circumstances the Linux kernel is allowed to
> 	   validate a page more than once. Doing this might create
> 	   attack vectors for the Hypervisor towards the guest.
>=20
> 	8. When memory is returned to the memblock or page allocators,
> 	   it is _not_ invalidated. In fact, all memory which is freed
> 	   need to be valid. If it was marked invalid in the meantime
> 	   (e.g. if it the memory was used for DMA buffers), the code
> 	   owning the memory needs to validate it again before freeing
> 	   it.
>=20
> 	   The benefit of doing memory validation at allocation time is
> 	   that it keeps the exception handler for invalid memory
> 	   simple, because no exceptions of this kind are expected under
> 	   normal operation.
>=20
> The Validation Bitmap
> ---------------------
>=20
> This document proposes the use of a Validation Bitmap to store the
> validation state of guest pages. This section discusses the benefits of
> this approach.
>=20
> The Linux kernel already has an array to store various state for each
> memory page in the system: The struct page array. While this would be a
> natural place to also store page validation information, the Validation
> Bitmap is chosen because having the information separated has some clear
> benefits:
>=20
> 	- The Validation Bitmap is allocated in the Linux decompressor
> 	  and already available long before the struct page array is
> 	  initialized.
>=20
> 	- Since it is a simple in-memory data structure which is
> 	  physically contiguous, it can be passed along through the
> 	  various stages of the boot process.
>=20
> 	- It can even be passed to a new kernel booted via kexec/kdump,
> 	  making it trivial to enable these features for AMD-SNP and
> 	  Intel-TDX.
>=20
> 	- When memory validation happens in the memblock and page
> 	  allocators, there is no need for locking when making changes
> 	  to the Validation Bitmap, because:
> 	 =20
> 	    - Nobody will try to concurrently access the same bits, as
> 	      the code-path doing the validation is the only owner of
> 	      the memory.
>=20
> 	    - Updates can happen via atomic cmpxchg instructions
> 	      when multiple bits are used per page. If only one bit is
> 	      needed, atomic bit manipulation instructions will suffice.
>=20
> 	- NUMA-locality is not considered to be a problem for the
> 	  Validation Bitmap. Since memory is not invalidated upon free,
> 	  the data structure will become read-mostly over time.
>=20
> Final Notes
> -----------
>=20
> This proposal does not introduce requirements about the firmware that
> has to be used to run Intel-TDX or AMD-SNP guests. It works with UEFI
> and non-UEFI firmwares, or with no firmware at all. This is important
> for use-cases like Confidential Containers running in VMs, which often
> use a very small firmware (or no firmware at all) for reducing boot
> times.
>=20

--=20
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5
90409 N=C3=BCrnberg
Germany

HRB 36809, AG N=C3=BCrnberg
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

