Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F819BB2
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o2ey+xOZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es7peDVOEZlS5Pupjm34098cJYoz4OqElvRg/Y9nl5vlLJLlzr7ZTg3gW9Rr8wHXNdX9AvH7uF0XlI9QmZWLAdKInDzSO2LvlgvrxWbhLVz+k5pbw+6DIwwfaJ4eeWg8Jo3ITvWmRt/NZL4MoUZRNpPVQ27WZbdvw5VoMTvugQFuZaROWbrR5TSGeJpA3Zsh8gJcmH9BKPs5ZCBAM7bdpLUg5r5hBr2ep1NvpSyRxdSwHyeLeQBVqNcp4vEtkkGa6jUFpGwGWtb4HBQI4jNx5EtttvHaWPGyiwG//2EKws2KwsXWf0H7s5dtyR4o5JixJ+5rgUq+DxySc7cePUVLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7esKV4uXIVjkuGNFMnTKwfoSvgnfu6tyanl9YPQfD7Y=;
 b=nl7xY60FdvW8GtxPXcj4ymxPLnIo1n1C4W+oO4nWbDkk/Jkr646dkUniHb9QLtsVPrJDJ6Yt58Z2FlYzLz8maTBbt0yL8SjI5j2zfdd1kQ4MBOeJ0rsDE7PVDbKdKqye1Inncadqy3yAv1edm6ROeEf4N9RcFUyZgOhWZonAMAbZDRAsgIpPlaeJogPMMqNC91SBxtIXZ5QHAJdCxyKnz02bMaNwVBO9iX5GonW96qnc4DWfuxaQ6gTmyfAeFsHN6ihYVNnBfqST5rImiOrozV/MnXeqDmprAV31UFFiDvZt8dyX1uDOM4Cwqh71unIewejKGZYhNK9AyN/6F8uQog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7esKV4uXIVjkuGNFMnTKwfoSvgnfu6tyanl9YPQfD7Y=;
 b=o2ey+xOZsNkR/0SjygDick0iZ5MBgO2xZe0AMtZhQhjjIMvHi9X2N5L4xpUSvC5mLrW+PkK6ZovAkuiNRRr3zMWEDtzTL4uj+2piKKkFpNeeXpUC3luAWmcqYZeXYElOXF+2x8XlRlMDENO40Qfh16mQ46aDVmO1n8Kkud0bA8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 15:39:41 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf%4]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 15:39:41 +0000
Message-ID: <fedb69c2-3277-4512-a8a2-55898822c81a@amd.com>
Date: Fri, 13 Oct 2023 10:39:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] configfs-tsm: Attestation Report ABI
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Erdem Aktas <erdemaktas@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>,
 Pankaj Gupta <pankaj.gupta@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 dave.hansen@linux.intel.com
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 1NhFSLKvfA==
In-Reply-To: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:806:126::21) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|SN7PR12MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 728cd4a1-83db-4a71-83d1-08dbcc029ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n13vzMYm4+XNkge4jTDztj7E4CUIqtaaLhz6vjrtacwIyMmbGqoUxTQmF0jrNJX4AC+OwPPR5vHPEMWI8MF+C17rXctb9q1B04S4QvrlcwANa6P4/6rZoYQ6Ndw/Zba1CZi/A34LSZ4OKhCqsiY+c8GaNZskyLjTRmaJHGroYQj0eAbZ2Tt0ikIA1M/9czVk8bfGsba5yq1h85UHPyZeTLgZw38ZHfWLhgx4jhSfdKoUR5FfislLvJmEfi9O3c+BNOQ/KIIumB6x8glDfO7RLGwJbh9xKsDV2VfMc8c2Zgzz6ShIrL7QddVO+nq2cASRjmO572xHE0PRhyxOOMxR7AXQI40VkDfH9kYU0uF1JSdLt25vDhQPiJiXxO/vdmentqlQWsYIcSit8Pt7KjLv5Gxt6Db5cxWhxwsJdMw9u715lNpLlXcoOj2ln2snjx8XmAj7RtH53pI31rmb2icRG4N5BdTWDkZdOnUR2+lqNAQlR6rhDQr3ddly6q9uiYHAqJj7FLz45W3j2Mf3wjOxHhUMpDQMdHKjrp10p3z1Mes2BDQ5jtdtqHJSeZEP/w2hW5UiH2lrXP2Nl36rzbQNgIBt/KvOj90yBOtpJR8qacgULf7YpH64QUZ9FOfT2YdiTKQygrea0LJxqpFRWc86TRKa6Fzh2zfL/v6EHAeHYadIg5a5ydOoKA82RfkIfj1B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(53546011)(83380400001)(31686004)(26005)(38100700002)(6512007)(31696002)(7416002)(86362001)(2906002)(66556008)(5660300002)(966005)(6486002)(4326008)(8676002)(8936002)(2616005)(316002)(66946007)(54906003)(66476007)(41300700001)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEtCMFdRdkl5dGRHZmhyUEtWR0tQd3FwWmVoM1hnVjBpNWUvOWQvTitQZ2hl?=
 =?utf-8?B?TEJjL1VRd0YzVTFjcjlrMEFDVjQ3M281UjJtaVNmdDJqWVdhQjVmMjBha20w?=
 =?utf-8?B?TXNWRVRsdUo0akUvYnpJS1M1Nk84dTN1bXkwUFFiK29NNWgxbEhwRE5tT0xx?=
 =?utf-8?B?ZEtDcFhpM2E1KzNwK2NQYzBjK2VMMVpENjMyK3pGdGx1MFdsbDVGakxuZ0RF?=
 =?utf-8?B?TnJCejVjdFdlUFlZdEpSbWRqRGFJeUdaNnZ1NjlpWkRaTUtIekpGVGdhQThp?=
 =?utf-8?B?QXJqdUxuSllJRXdJZlY0TE9KUGpCbWQyNzBEY0hEajdDV3NzQmIwbFgwaTAv?=
 =?utf-8?B?bDJiZzEvS0NSenVwakFNcG1Ha21aQXJUOVowYkFvVUFWUFF4WmJRK3hyQS9L?=
 =?utf-8?B?QTBtdWZ4QjZ4VndrSGJMQkFwSHIzbXlnQThTTlRqVWZ5Rm9hdDRIY1FFMGtW?=
 =?utf-8?B?b2d6Y0xWMUFEaEVhMHlsWGJ5dDFxZlJLTC9nQWNTUnBoT1ZmQlJWYkRycGdI?=
 =?utf-8?B?bUs4TCtPckthcHFMUFJHVzJoa3JCNG1yL3E3S0ZoeDY1WjRoSk9weit0V0tl?=
 =?utf-8?B?RzVpZUtQVmhUVlBJM2piekpGekU5MDBDbzIzQzlLSUtnclp5c3FsbUJzSW11?=
 =?utf-8?B?aFhIMkp5a2xkY1hobnBSSng1am9KZ3E4Vk1STENuSVB3RFBSWlgvMUxROGdm?=
 =?utf-8?B?S3pjS1RrQmJyZVV3Yi93UUx3QW9EZDV2K2Zjc1BxZE12eGFsSVlUMFZhYTNy?=
 =?utf-8?B?aDJ4TkxmaVZRNE4wRUpDbWwwUWtnZ2xGZVdldVhuTENNdEE5MzdMZXRMTXZV?=
 =?utf-8?B?UHFRNFp0MDN0SE4vMU00dUhRdHAvRDd2UDJ1TXV6Y0pFNlIzR2x5WXpKY1Ny?=
 =?utf-8?B?K09sNlMxNExGYW9tdzNEenlXeC8xYVUwa2lHU1FpTWFucUNWSklYWmsrSkZ6?=
 =?utf-8?B?RFkrUCtUcERuMlZVcmZaTVMwT01vRjZsZHJFMDhKaHhkeDYwREJ1U3ZyRHl5?=
 =?utf-8?B?eVI5cGVRUi9Cb1hraFdhUUZRV2hyY2RRWXZmaHA5dk9sUEF3OWxNNHk1RHVa?=
 =?utf-8?B?V3FOaGVjZzlqeFpRbmgrYlZOQzNCK0pRdHQ2TE85ZllXbUhNZ2NGejJvdTlD?=
 =?utf-8?B?UG5QT1FaLzNEUHRXL0tkSlJQRFhVcklTeXZNVFFWTHArMGNwTHhNQjgyR1Bo?=
 =?utf-8?B?bGxkYjNQc0gxZWRsQitGZHBvWmgxc1lsaFo4V1I1YXB1azBoaGJsUnRFM3JM?=
 =?utf-8?B?cHhjRjE0NWx3L2pFdUpTNmtPdS9kTDJBNFMzYk13Qm55dW9QeXhwRjYwUTRm?=
 =?utf-8?B?TjNKQ3BRbXJPRlNlVUV5ZkVMSTdTczBta1lRejNXcjU4czgyY3lBV1E1Uk1J?=
 =?utf-8?B?ZG5QcnNkNkpaVG1NdGNqS3NZOTR2aEhiQzEyOWdieUVsQmE0eDg1ZDJLbUV5?=
 =?utf-8?B?aTR2SUZSeExGRWZyK1ovQUhZZnA3OGx0U3dDNXRyb201T3Z5alJRQmhmY2NW?=
 =?utf-8?B?RUV4RGhTbmhPeGtoOUNKTHRiQUhlYVluZ2FqZ2ZveXRtSVdtMU1HSDBxU3Ax?=
 =?utf-8?B?L0ZFZ3NpQmhjbmlLSzE5Q0ZwZGtCZXFkU09KQ0k1dGdiZmlMNGluQjB1R2Jo?=
 =?utf-8?B?WDkwM01tTTR4N25ramRqeGNpa0RiNE1MRGtlUnRNQk9oYTZtbTFBVXU1VkNH?=
 =?utf-8?B?Q3RsSnF6WjFGRjNrWXI2T05UMTE3UXBaNG56VVVQaExOMzVJWkJWS1BIRGIy?=
 =?utf-8?B?RHdhWk9qMTlKTVhHcUhSSGc0aWpKVzFicEYxSURTR2EyOUNlTVZKRWdUZFNS?=
 =?utf-8?B?SVJwR1hQT05ZSnVmek5sQ1J1dE5UdXpjOWE1dDRVT2VsTG5EL2Z1dnRiSFFO?=
 =?utf-8?B?QktFZ3VvTHBPRzJ1bUsvSW5RRzZ5QTFlSkNDaDQ4a1orbkxTSnkzL1ovYzI3?=
 =?utf-8?B?N3NkcCtTQmhnanZxc2pLc2NPZjVGTmI1ZDgrNXZQZFgyNlZDUHArd0pmYWZO?=
 =?utf-8?B?bGZNSjdUNWxZdlNuZEp3T3lHbEJiOEVTODF1ZjBOZlNZREhmVDVzcnFicytQ?=
 =?utf-8?B?c0VGNkNIQnQwT09GWEcxRzZNQnV4UEo1TVdVUWs4WldJdHYzNzc2cENVeU1C?=
 =?utf-8?Q?VfOB1wTEls0lqX+Gi6607na2Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 728cd4a1-83db-4a71-83d1-08dbcc029ddf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 15:39:41.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuYV4d8cw66axM8vYtYDcZ5yESr0YmMALC+kSKnfqiXzOhxDAsRU4oa6GpC+rl/oPcJLjJ3omHZq90wtgT3FAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108

On 10/12/23 21:13, Dan Williams wrote:
> Changes since v5 [1]:
> - Dump the raw cert_table via a new @auxblob attribute rather than
>    concatenate the certificate data. (Dionna and Tom)
> - Fix usage of guard(), drop erroneous copy-pasted mutex_unlock().
>    (Tom)
> 
> [1]: http://lore.kernel.org/r/169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com
> 

For the series:

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> ---
> 
> Merge notes: I am looking for Dave or Boris to pick this up, I believe
> all outstanding comments have been resolved and this has now been
> smoke-tested on AMD and Intel platforms (both v5 and v6).
> 
> ---
> 
> An attestation report is signed evidence of how a Trusted Virtual
> Machine (TVM) was launched and its current state. A verifying party uses
> the report to make judgements of the confidentiality and integrity of
> that execution environment. Upon successful attestation the verifying
> party may, for example, proceed to deploy secrets to the TVM to carry
> out a workload. Multiple confidential computing platforms share this
> similar flow.
>   
> The approach of adding adding new char devs and new ioctls, for what
> amounts to the same logical functionality with minor formatting
> differences across vendors [2], is untenable. Common concepts and the
> community benefit from common infrastructure.
>   
> Use configfs for this facility for maintainability compared to ioctl(),
> and for its scalability compared to sysfs. Atomicity can be enforced at
> item creation time, and a conflict detection mechanism is included for
> scenarios where multiple threads may share a single configuration
> instance.
>   
> [2]: http://lore.kernel.org/r/cover.1684048511.git.sathyanarayanan.kuppuswamy@linux.intel.com
> 
> 
> ---
> 
> Dan Williams (6):
>        virt: sevguest: Fix passing a stack buffer as a scatterlist target
>        virt: coco: Add a coco/Makefile and coco/Kconfig
>        configfs-tsm: Introduce a shared ABI for attestation reports
>        virt: sevguest: Prep for kernel internal get_ext_report()
>        mm/slab: Add __free() support for kvfree
>        virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT
> 
> Kuppuswamy Sathyanarayanan (1):
>        virt: tdx-guest: Add Quote generation support using TSM_REPORTS
> 
> 
>   Documentation/ABI/testing/configfs-tsm  |   82 ++++++
>   MAINTAINERS                             |    8 +
>   arch/x86/coco/tdx/tdx.c                 |   21 ++
>   arch/x86/include/asm/shared/tdx.h       |    1
>   arch/x86/include/asm/tdx.h              |    2
>   drivers/virt/Kconfig                    |    6
>   drivers/virt/Makefile                   |    4
>   drivers/virt/coco/Kconfig               |   14 +
>   drivers/virt/coco/Makefile              |    8 +
>   drivers/virt/coco/sev-guest/Kconfig     |    1
>   drivers/virt/coco/sev-guest/sev-guest.c |  212 ++++++++++++++--
>   drivers/virt/coco/tdx-guest/Kconfig     |    1
>   drivers/virt/coco/tdx-guest/tdx-guest.c |  229 +++++++++++++++++
>   drivers/virt/coco/tsm.c                 |  423 +++++++++++++++++++++++++++++++
>   include/linux/slab.h                    |    2
>   include/linux/tsm.h                     |   68 +++++
>   16 files changed, 1046 insertions(+), 36 deletions(-)
>   create mode 100644 Documentation/ABI/testing/configfs-tsm
>   create mode 100644 drivers/virt/coco/Kconfig
>   create mode 100644 drivers/virt/coco/Makefile
>   create mode 100644 drivers/virt/coco/tsm.c
>   create mode 100644 include/linux/tsm.h
> 
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
