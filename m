Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E408D2FC
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 06:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nl4wys+g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFiVEUvkAdpZP5D7QgVLtZBSB39OkkZK3RwpUNll27LBcRvSJWY0gcCrD/mfJxm6Zbq2XE5xRO2Ppi22lWIiM0jEhxwbzGV0StnP0Ls67jMimoIdvd+9hpS6xPzRjg6bBqR9w8+2o9g8O4KcgnEoRlb7EBmdT/Z47yHdoqQN1QKLzuP6zljwNjZGYOs/Vj0eqzLbViCx2aXzWAqESzPk0PqbmVcpMkf1bixYuX1H5gWBZy0R82DriKTWj0JQGMqNeBD5PTGUrPn17T70sXW8gCn1rMIj0Lbbfh79ouhOIAVi4JVbMUBkclUO9cDgB+ASt1MjwZ93I22SZ1XKm6CXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYj7sZ7fQX/ot02JQpxb1uGFRx9pflKFY9zHAD6uz3o=;
 b=B/biQ4x/maVJDchQXKQSXlFcHvQ0J6ehZOBG7131pIbX2dzteD1GuzwgwszayQChXz6WV1WpzgCwLi2xX6xs6beAzdh/037gICYClMaZU3uX9j+E8EYHOVq/PSlaquxHdy1IJpynT3ByDbPN1P05wVCg+QjrVWYwyWVtJvasaGuByxuLasl+pVkFyumyEZz1ZlN3wtsVq5KorL4JPP9ivwdlnuZSKmncwLyswBarUlW3PtbMefxQzWqRlY7wrFLq6Ll3jVUWmclpUYKlXxpQsDAVbBeMExF9GdNIUMO81yUob2M1K5xqdKPZuQqmNh/ghG598zY5VOMV1vVvx4zdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYj7sZ7fQX/ot02JQpxb1uGFRx9pflKFY9zHAD6uz3o=;
 b=Nl4wys+gLCBVMaZIp4X03T2nKdl43opCDD5adNOMCeqEz+Sm2ivjg0vro1sVg9teJkcf/86BjJj6ivF4SjN/NGY9vOsZJ6Y2fWeXz2J5wwN9gqaiV61YHeQ/RnzIiuiruHlIbogK9vhL+eQTL4szEziLijveNJSoN+plzctzvnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SA3PR12MB7922.namprd12.prod.outlook.com (2603:10b6:806:314::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Tue, 17 Oct
 2023 06:20:33 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 06:20:33 +0000
Message-ID: <d6515cba-1751-417b-ab11-980010472aa4@amd.com>
Date: Tue, 17 Oct 2023 17:20:12 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Peter Gonda <pgonda@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 peterz@infradead.org, dave.hansen@linux.intel.com, bp@alien8.de
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
 <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
 <652def355ef34_f8792949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <652def355ef34_f8792949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYAPR01CA0004.ausprd01.prod.outlook.com (2603:10c6:1::16)
 To CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SA3PR12MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 516c9115-8f87-4a0a-f1a3-08dbced92ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mJ4FaJcCHqEGlmdJyIVXk7OJkSHor/cNg+Jwyo8ug+E0pYtPl/2PSgARhYe0YDO3J/R8Gm+sxh6omkAt5ZqcjCspwYwqETAvubx63YvUZ4q71aaJnV8WVInS9A18NzgTkAbRtIw2j0DpWSeil1zDvxcU4v7c2TzDD2n+KYi/cutC+qz6UqPk9N09q+lf9c3XV6sq0Ikql9sj3q3VF5btF635K3IuE6VTMiXL9ccbyFb0SGX67IZ26U3v6fcLLALiW29I5kPq0Dgr4MdAXhMn+17w+s2glHcIhGncHMZeLce4DLCMzfdQp4Qtwv6HaF/lhbT/8wTN6ILL8DXmbFRlifVh0ymfdWMMyQfLuCxZ7Q6x5q0piIlEaT5nD98H/eXUx/tQzSiSPV6IdjwCOr5o0RC3h/eLDdn/I4hj+4njLx9ljKbQIuWnU4MCwOeQCGqAVhIVh/1upje2pupYnP1s4tr2WA8JBv3LLiarQTTIf8a/R24vbKZ5xb0o8wclNFDYe+QTZgl3u942Pe1k2g/5AI89z9vXuqXkQbBPPwtvqHkp2AYB2RBOl08R+9jeg3ScGh3QenR0lDopsqsC+He7ReySIIFcHg0x4PQPNHrKPcaRwJNa2V4kVGHoER0z6LMfpqx++7uoET8cVItwMxv11CWGSKdRYWgFZzd71Ohq4FQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(966005)(478600001)(6666004)(66946007)(66476007)(6486002)(66556008)(2616005)(316002)(26005)(53546011)(54906003)(6512007)(30864003)(8676002)(41300700001)(6506007)(7416002)(4326008)(2906002)(38100700002)(8936002)(36756003)(31696002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnA3cTZuVE1idDFEejdsNUdWaExhekVqdTVlVFA3Sm5qWEVPQWNweWJRTnRC?=
 =?utf-8?B?VHVxYnZ4NllGanNtNE55dlV2YitLNHgvVW8vMWoyUUFOakp5Rlh4Njc0RnVI?=
 =?utf-8?B?M2ZxMWZGUDdTN3hBZDVsKzIxcWxncWR6b1lGUWYzT1JBUGpTMnN5NG03ZVNX?=
 =?utf-8?B?YjJTMXk5eE5ROEkvVVJaSG41SHlTMTNxenlHejdGRWR3RjZlRURpWnM5YTJ5?=
 =?utf-8?B?eHEvMVU3NDJuMjVBQTl0aitOQ0hNQWFOVVg3MDhNTkYrUldmcytFb0g5N0Vr?=
 =?utf-8?B?SUlSUjFReHlHV3gwbXpFYkN2YXdNNWhSWUYveGd5K01LdjU3ZHcramljTzAy?=
 =?utf-8?B?Wm5TVkFPeW4vNnhhbC81ay9uWHhRamJzODVyanl5MXpqdnZ0SVZWaUx1eEp5?=
 =?utf-8?B?R0V1a1JveGdUWjFNS2xPRDN3MDJaZEJqanY2RDdBSEtzeHdmVURQSXhoRGdx?=
 =?utf-8?B?MXo3Q0NuaUVRN1FSRkhLN0xxTU1OaURibEk1azV5QlFzTUNoc3IzK2JvZzNy?=
 =?utf-8?B?c3BnbktXaTNWZFI0T2dqUW5IL0ZKRmN3OVNnWXdHLy9FZnpLVE5zeTkxTnNF?=
 =?utf-8?B?U0VJekxwcW1MWHUxS0g5bmExSmkyc1R3Q3lnK01yZGhTL1l5dzZGV1dVeXB2?=
 =?utf-8?B?bWtCSUQ0R1IzeW9POUlaVFJZTWJhSXkzZEh5dHRscmVLN0EyTmhibXlMSCsr?=
 =?utf-8?B?QWJ2MHFXdWowaDBrNVR3N09UcFBjUTBwSkRCOCtpQTJFRFRkVWNnVjZWV0Fr?=
 =?utf-8?B?bnU0R0RSZlNYYkJjSUdoU3JTVXNCa3doRCtFOURSaThBMzRjaE5VaDlKams4?=
 =?utf-8?B?RnVRU0FTSjE4OHlXZUFvbkxTa2E3cmZBT1Nsa0xkaWRsRzhkbDByZm9UcFdD?=
 =?utf-8?B?N3VXelJnWjBFRlM3RnJheDNzS09EWVdWUXhNTWRmZk0zNUIrUllqVzJqUW45?=
 =?utf-8?B?L2dhN1F5YkZrZk1WVXFuaTRUOGxIdlBQOVpXcXFiUlIydm55ckRScEZKV1Bz?=
 =?utf-8?B?aHlsbHNxM1o1VnI2ZUtYbjh6ZFpEeUc4TDNuSEZCZ1drOWpFZlUyVW85Mi85?=
 =?utf-8?B?VUVNam5OU0tFckVkbmxBZjRWVnFhVUZVcFBWOEY2b2lHbFI1UmlpanVhT2x1?=
 =?utf-8?B?MjZZSFZJbG93eUU0MWNFOE03Z3lxV01pNlFWU284ZWtnakJiaTlaVjlpbXhr?=
 =?utf-8?B?MGUwSDNnNHRKUk1HVHFlMnEzSWpRTWxwdkg0T0Zad1FKZERFUWtWU213VmU0?=
 =?utf-8?B?d2k0S09pbVdOWDJBcWx1NXhwanNDVzB5a2J3cllDWCtBVUx6WUtTQ252clpB?=
 =?utf-8?B?aXRYSFFuQy96THEzT2NxS01rNGhxWEZqVWczVXI5a0NGQkNtdWtPMDNaL0xu?=
 =?utf-8?B?a0JiTnNxTFBXMjM2MWEwNnJlRHVHcEpNeVloUnFWVTZ6MHBjNStwTWVrMGxY?=
 =?utf-8?B?OHUwV1B2MFIydzhKNGN2eHpGa2FBL2ljelJoTXZaa0o5NW5aV0tBVlRlMHpW?=
 =?utf-8?B?cW9zZVRFY05kTkRZdjE0R0dXcHVlbThSejhaemUxWUJVelFwUm8xcFlsWVMy?=
 =?utf-8?B?Tnl6aHA0MTlTUG5hTnd5Q1VBeUpzbEtERUU5REx4b2dNOHFwVTlid2JEQWov?=
 =?utf-8?B?S0tNd0k1Mnl6TTBobGZrZzYyUS95ZUY3SWxTOHNWeE9wVk9OcEg4T1orTGMz?=
 =?utf-8?B?WmtYbGUwZ3U2bk9GVzNBcUJEdTJPNWRab3FOWkEwUVRLMUZxMko4RkZTQVVY?=
 =?utf-8?B?VFlLYnNWTVVNMDNHVS9zL1c5OExFTnliRHBsZ1p3YXdCa1hCUmdQSmc0WWh5?=
 =?utf-8?B?cVhjRUh4QnFvalVpOWRBaklUUWoxN0UvaTUvOFB6QmYxcFBjU2tEWXRMRnBG?=
 =?utf-8?B?SzhyUlAxVGpzQWZ4TnVRd1VWZjJJcUF5d3RiKzUrZFBIWXgwMGs0cEt3ZUJj?=
 =?utf-8?B?SW1DMmdRcjl5YmlsVVJveVVCb1FmVEtER2FYekgrbjJGeVZBdVNYbVQ2ckox?=
 =?utf-8?B?YUxCS2N0eHhTZW1hbS92Q293TVFTekt0SXNnVzJ3citiRHErK3ZjM1prdTJK?=
 =?utf-8?B?MFNMLzlNdWtwdHdyRXJVd0ozemhvT2JVbkZoN1JNTlJWenhOZDZGOERTZW9Z?=
 =?utf-8?Q?BEInitKYpTdHkjEdbjbWjXMMz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516c9115-8f87-4a0a-f1a3-08dbced92ad8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:20:32.9832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPbI9RBPHo53nrcL3z+Z7zdWH3WMljvk/VVEzYKTmJUT2iNzBfVx98KhbVrHMYCWALt0pPQVQF1j5giXrPaFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7922


On 17/10/23 13:19, Dan Williams wrote:
> Alexey Kardashevskiy wrote:
> [..]
>>> +What:		/sys/kernel/config/tsm/report/$name/provider
>>> +Date:		September, 2023
>>> +KernelVersion:	v6.7
>>> +Contact:	linux-coco@lists.linux.dev
>>> +Description:
>>> +		(RO) A name for the format-specification of @outblob like
>>> +		"sev-guest" [1]  or "tdx-guest" [2] in the near term, or a
>>> +		common standard format in the future.
>>
>> Nit: /sys/kernel/config/tsm/report/report0/provider contains
>> "sev_guest", i.e. "_", not "-".
> 
> Yes, will fix either with a follow-on or a respin if more feedback
> arrives.
> 
>>
>>> +
>>> +		[1]: SEV Secure Nested Paging Firmware ABI Specification
>>> +		Revision 1.55 Table 22
>>> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56860.pdf
>>> +
>>> +		[2]: Intel® Trust Domain Extensions Data Center Attestation
>>> +		Primitives : Quote Generation Library and Quote Verification
>>> +		Library Revision 0.8 Appendix 4,5
>>> +		https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_DCAP_Quoting_Library_API.pdf
>>> +
>>> +What:		/sys/kernel/config/tsm/report/$name/generation
>>> +Date:		September, 2023
>>> +KernelVersion:	v6.7
>>> +Contact:	linux-coco@lists.linux.dev
>>> +Description:
>>> +		(RO) The value in this attribute increments each time @inblob or
>>> +		any option is written. Userspace can detect conflicts by
>>> +		checking generation before writing to any attribute and making
>>> +		sure the number of writes matches expectations after reading
>>> +		@outblob, or it can prevent conflicts by creating a report
>>> +		instance per requesting context.
>>> +
>>> +What:		/sys/kernel/config/tsm/report/$name/privlevel
>>> +Date:		September, 2023
>>> +KernelVersion:	v6.7
>>> +Contact:	linux-coco@lists.linux.dev
>>> +Description:
>>> +		(WO) Attribute is visible if a TSM implementation provider
>>> +		supports the concept of attestation reports for TVMs running at
>>> +		different privilege levels, like SEV-SNP "VMPL", specify the
>>> +		privilege level via this attribute.  The minimum acceptable
>>> +		value is conveyed via @privlevel_floor and the maximum
>>> +		acceptable value is TSM_PRIVLEVEL_MAX (3).
>>> +
>>> +What:		/sys/kernel/config/tsm/report/$name/privlevel_floor
>>> +Date:		September, 2023
>>> +KernelVersion:	v6.7
>>> +Contact:	linux-coco@lists.linux.dev
>>> +Description:
>>> +		(RO) Indicates the minimum permissible value that can be written
>>> +		to @privlevel.
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b19995690904..8acbeb029ba1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -21889,6 +21889,14 @@ W:	https://github.com/srcres258/linux-doc
>>>    T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
>>>    F:	Documentation/translations/zh_TW/
>>>    
>>> +TRUSTED SECURITY MODULE (TSM) ATTESTATION REPORTS
>>> +M:	Dan Williams <dan.j.williams@intel.com>
>>> +L:	linux-coco@lists.linux.dev
>>> +S:	Maintained
>>> +F:	Documentation/ABI/testing/configfs-tsm
>>> +F:	drivers/virt/coco/tsm.c
>>> +F:	include/linux/tsm.h
>>> +
>>>    TTY LAYER AND SERIAL DRIVERS
>>>    M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>    M:	Jiri Slaby <jirislaby@kernel.org>
>>> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
>>> index fc5c64f04c4a..87d142c1f932 100644
>>> --- a/drivers/virt/coco/Kconfig
>>> +++ b/drivers/virt/coco/Kconfig
>>> @@ -2,6 +2,11 @@
>>>    #
>>>    # Confidential computing related collateral
>>>    #
>>> +
>>> +config TSM_REPORTS
>>> +	select CONFIGFS_FS
>>> +	tristate
>>> +
>>>    source "drivers/virt/coco/efi_secret/Kconfig"
>>>    
>>>    source "drivers/virt/coco/sev-guest/Kconfig"
>>> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
>>> index 55302ef719ad..18c1aba5edb7 100644
>>> --- a/drivers/virt/coco/Makefile
>>> +++ b/drivers/virt/coco/Makefile
>>> @@ -2,6 +2,7 @@
>>>    #
>>>    # Confidential computing related collateral
>>>    #
>>> +obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
>>>    obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
>>>    obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
>>>    obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
>>> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
>>> new file mode 100644
>>> index 000000000000..0200a86f1efe
>>> --- /dev/null
>>> +++ b/drivers/virt/coco/tsm.c
>>> @@ -0,0 +1,423 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/* Copyright(c) 2023 Intel Corporation. All rights reserved. */
>>> +
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/tsm.h>
>>> +#include <linux/err.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/rwsem.h>
>>> +#include <linux/string.h>
>>> +#include <linux/module.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/configfs.h>
>>> +
>>> +static struct tsm_provider {
>>> +	const struct tsm_ops *ops;
>>> +	const struct config_item_type *type;
>>> +	void *data;
>>> +} provider;
>>> +static DECLARE_RWSEM(tsm_rwsem);
>>> +
>>> +/**
>>> + * DOC: Trusted Security Module (TSM) Attestation Report Interface
>>> + *
>>> + * The TSM report interface is a common provider of blobs that facilitate
>>> + * attestation of a TVM (confidential computing guest) by an attestation
>>> + * service. A TSM report combines a user-defined blob (likely a public-key with
>>> + * a nonce for a key-exchange protocol) with a signed attestation report. That
>>> + * combined blob is then used to obtain secrets provided by an agent that can
>>> + * validate the attestation report. The expectation is that this interface is
>>> + * invoked infrequently, however configfs allows for multiple agents to
>>> + * own their own report generation instances to generate reports as
>>> + * often as needed.
>>> + *
>>> + * The attestation report format is TSM provider specific, when / if a standard
>>> + * materializes that can be published instead of the vendor layout. Until then
>>> + * the 'provider' attribute indicates the format of 'outblob', and optionally
>>> + * 'auxblob'.
>>> + */
>>> +
>>> +struct tsm_report_state {
>>> +	struct tsm_report report;
>>> +	unsigned long write_generation;
>>> +	unsigned long read_generation;
>>> +	struct config_item cfg;
>>> +};
>>> +
>>> +enum tsm_data_select {
>>> +	TSM_REPORT,
>>> +	TSM_CERTS,
>>> +};
>>> +
>>> +static struct tsm_report *to_tsm_report(struct config_item *cfg)
>>> +{
>>> +	struct tsm_report_state *state =
>>> +		container_of(cfg, struct tsm_report_state, cfg);
>>
>> This be one line of 88 chars (less than allowed 100).
>>
>> (I'll comment once on this, feel free to ignore :) )
> 
> Unless and until the kernel's .clang-format template is updated to 100
> you will find my patches wrapped to its ColumnLimit setting (80). I did
> manually fixup my sev_guest changes to 100 since there was precedent in
> that file, everything else I just let .clang-format do its thing.
> 
>>
>>> +
>>> +	return &state->report;
>>> +}
>>> +
>>> +static struct tsm_report_state *to_state(struct tsm_report *report)
>>> +{
>>> +	return container_of(report, struct tsm_report_state, report);
>>> +}
>>> +
>>> +static int try_advance_write_generation(struct tsm_report *report)
>>> +{
>>> +	struct tsm_report_state *state = to_state(report);
>>> +
>>> +	lockdep_assert_held_write(&tsm_rwsem);
>>> +
>>> +	/*
>>> +	 * Malicious or broken userspace has written enough times for
>>> +	 * read_generation == write_generation by modular arithmetic without an
>>> +	 * interim read. Stop accepting updates until the current report
>>> +	 * configuration is read.
>>> +	 */
>>> +	if (state->write_generation == state->read_generation - 1)
>>> +		return -EBUSY;
>>> +	state->write_generation++;
>>> +	return 0;
>>> +}
>>> +
>>> +static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
>>> +					  const char *buf, size_t len)
>>> +{
>>> +	struct tsm_report *report = to_tsm_report(cfg);
>>> +	unsigned int val;
>>> +	int rc;
>>> +
>>> +	rc = kstrtouint(buf, 0, &val);
>>> +	if (rc)
>>> +		return rc;
>>> +
>>> +	/*
>>> +	 * The valid privilege levels that a TSM might accept, if it accepts a
>>> +	 * privilege level setting at all, are a max of TSM_PRIVLEVEL_MAX (see
>>> +	 * SEV-SNP GHCB) and a minimum of a TSM selected floor value no less
>>> +	 * than 0.
>>> +	 */
>>
>> Sounds like privlevel_floor should be "unsigned int" rather than "int".
> 
> Sure.
> 
>>> +	if (provider.ops->privlevel_floor > val || val > TSM_PRIVLEVEL_MAX)
>>> +		return -EINVAL;
>>> +
>>> +	guard(rwsem_write)(&tsm_rwsem);
>>> +	rc = try_advance_write_generation(report);
>>> +	if (rc)
>>> +		return rc;
>>> +	report->desc.privlevel = val;
>>> +
>>> +	return len;
>>> +}
>>> +CONFIGFS_ATTR_WO(tsm_report_, privlevel);
>>> +
>>> +static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
>>> +					       char *buf)
>>> +{
>>> +	guard(rwsem_read)(&tsm_rwsem);
>>> +	return sysfs_emit(buf, "%u\n", provider.ops->privlevel_floor);
>>
>> %d  or  change the type.
> 
> Ok.
> 
>>
>>> +}
>>> +CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
>>> +
>>> +static ssize_t tsm_report_inblob_write(struct config_item *cfg,
>>> +				       const void *buf, size_t count)
>>> +{
>>> +	struct tsm_report *report = to_tsm_report(cfg);
>>> +	int rc;
>>> +
>>> +	guard(rwsem_write)(&tsm_rwsem);
>>> +	rc = try_advance_write_generation(report);
>>> +	if (rc)
>>> +		return rc;
>>> +
>>> +	report->desc.inblob_len = count;
>>> +	memcpy(report->desc.inblob, buf, count);
>>> +	return count;
>>> +}
>>> +CONFIGFS_BIN_ATTR_WO(tsm_report_, inblob, NULL, TSM_INBLOB_MAX);
>>> +
>>> +static ssize_t tsm_report_generation_show(struct config_item *cfg, char *buf)
>>> +{
>>> +	struct tsm_report *report = to_tsm_report(cfg);
>>> +	struct tsm_report_state *state = to_state(report);
>>> +
>>> +	guard(rwsem_read)(&tsm_rwsem);
>>> +	return sysfs_emit(buf, "%lu\n", state->write_generation);
>>> +}
>>> +CONFIGFS_ATTR_RO(tsm_report_, generation);
>>> +
>>> +static ssize_t tsm_report_provider_show(struct config_item *cfg, char *buf)
>>> +{
>>> +	guard(rwsem_read)(&tsm_rwsem);
>>> +	return sysfs_emit(buf, "%s\n", provider.ops->name);
>>> +}
>>> +CONFIGFS_ATTR_RO(tsm_report_, provider);
>>> +
>>> +static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
>>> +			     enum tsm_data_select select)
>>> +{
>>> +	loff_t offset = 0;
>>> +	ssize_t len;
>>> +	u8 *out;
>>> +
>>> +	if (select == TSM_REPORT) {
>>> +		out = report->outblob;
>>> +		len = report->outblob_len;
>>> +	} else {
>>> +		out = report->auxblob;
>>> +		len = report->auxblob_len;
>>> +	}
>>> +
>>> +	/*
>>> +	 * Recall that a NULL @buf is configfs requesting the size of
>>> +	 * the buffer.
>>> +	 */
>>
>> The comment can be one line (or even dropped as it is configfs api).
> 
> I got a comment from a reviewer that did not understand why @buf is
> allowed to be NULL. It's an oddity compared to sysfs binary attributes,
> so I don't mind the comment.

I did not understand why memcpy() and not copy_from_user(), for example, 
had to grep. Commenting on the configfs api outside of it imho is a bit 
too much but ok.


> [..]
>>> +static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
>>> +			       size_t count, enum tsm_data_select select)
>>> +{
>>> +	struct tsm_report_state *state = to_state(report);
>>> +	const struct tsm_ops *ops;
>>> +	ssize_t rc;
>>> +
>>> +	/* try to read from the existing report if present and valid... */
>>> +	rc = read_cached_report(report, buf, count, select);
>>> +	if (rc >= 0 || rc != -EWOULDBLOCK)
>>> +		return rc;
>>> +
>>> +	/* slow path, report may need to be regenerated... */
>>> +	guard(rwsem_write)(&tsm_rwsem);
>>> +	ops = provider.ops;
>>> +	if (!report->desc.inblob_len)
>>> +		return -EINVAL;
>>> +
>>> +	/* did another thread already generate this report? */
>>> +	if (report->outblob &&
>>> +	    state->read_generation == state->write_generation)
>>> +		goto out;
>>> +	kvfree(report->outblob);
>>> +	kvfree(report->auxblob);
>>> +	report->outblob = NULL;
>>> +	report->auxblob = NULL;
>>> +	rc = ops->report_new(report, provider.data);
>>
>>
>> Drop @ops and use "provider.ops" here?
> 
> Shrug, ok.

I asked as at first I thought it is stored right after rwsem_write in 
@ops for a reason but then it was not even checked for NULL so it could 
be initialized where declared.


> 
>>
>>> +	if (rc < 0)
>>> +		return rc;
>>> +	state->read_generation = state->write_generation;
>>> +out:
>>> +	return __read_report(report, buf, count, select);
>>> +}
>>> +
>>> +static ssize_t tsm_report_outblob_read(struct config_item *cfg, void *buf,
>>> +				       size_t count)
>>> +{
>>> +	struct tsm_report *report = to_tsm_report(cfg);
>>> +
>>> +	return tsm_report_read(report, buf, count, TSM_REPORT);
>>> +}
>>> +CONFIGFS_BIN_ATTR_RO(tsm_report_, outblob, NULL, TSM_OUTBLOB_MAX);
>>> +
>>> +static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void *buf,
>>> +				       size_t count)
>>> +{
>>> +	struct tsm_report *report = to_tsm_report(cfg);
>>> +
>>> +	return tsm_report_read(report, buf, count, TSM_CERTS);
>>> +}
>>> +CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
>>> +
>>> +#define TSM_DEFAULT_ATTRS() \
>>
>> imho this one and TSM_DEFAULT_BIN_ATTRS are not really helping with
>> readability or a size :)
> 
> It is meant to do neither, it is only here to make it clear that
> tsm_report_bin_extra_attrs[] is a super-set of tsm_report_bin_attrs[].
> What I really want is sysfs-style group syntax, but configfs does not
> have that same declaration capability.

The order is mixed now:

TSM_DEFAULT_ATTRS
tsm_report_attrs
TSM_DEFAULT_BIN_ATTRS
tsm_report_bin_attrs
tsm_report_bin_extra_attrs (*)
tsm_report_extra_attrs  (*)
tsm_report_item_release
tsm_report_item_ops
tsm_report_default_type
tsm_report_ext_type (*)

Grouping (*) together would make the superset thing clearer imho.

tsm_report_ distract too as they could be just tsm_ (as those in capital 
letters). Either _ext_ or _extra_. I am not insisting though, just 
whining :) Thanks,


> [..]
>>
>> A little confusing thing is that this guy is neither near the beginning
>> of the file (with other statics, this could even be a member of
>> tsm_provider) nor the code which sets/clears it - tsm_init/tsm_unregister.
> 
> @tsm_report_group is only used in tsm_{init,exit}(). I'll move its
> declartion closer to tsm_init() in a follow-on.
> 
> [..]
>>> diff --git a/include/linux/tsm.h b/include/linux/tsm.h
>>> new file mode 100644
>>> index 000000000000..5fadc382064d
>>> --- /dev/null
>>> +++ b/include/linux/tsm.h
>>> @@ -0,0 +1,68 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef __TSM_H
>>> +#define __TSM_H
>>> +
>>> +#include <linux/sizes.h>
>>> +#include <linux/types.h>
>>> +#include <linux/device.h>
>>
>> device.h is not needed.
> 
> Yes, an earlier version of this interface referenced devices.

-- 
Alexey


