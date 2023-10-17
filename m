Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAEDDDCF
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dXzjtdxA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AejT63134Gwp5NXeeOxsc7R05y4I4PDiNObxaY4cr7Ivh80QUWfWD5yHrzxbP0HrHrZzlsCPbKYVwgrtCoErQSUpf/KzE3D715f5zPnWaxOJvha5IQkS00MCXiflbqf8N6vkHv7qBNF2hVg5FDhmF+JrbDBK2mdUe9AYbfyC+u3RfPBZTRTazq+ajtpYo5+UALcWxx1DiEqD+FRdySLxO7AbYxBKq8IUqxsWmU6s9S7+evqJLHsMrKO1prc24BkHNV91iMUazfSiUIj5jgMK4f1Xcb35lBmJ9W8dsK2NsIlbMi6k6nOSmDhroK9277boX9QrbGM4ZgV+HPOkY3lJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aneZp+yE/WeFwSX6pvh0s+pUqX0X7mo0+QmlmvXJXd4=;
 b=XwgkbVG9HLXZKQTayUZGf994wGNygIkr4cMREI3Z/EqRFYUuXnJivGs3xL13slLdUrfER9cCS0B/kOdDQ/QYatpb7S5IMGJI41/8kELRY3wieUQ1pvzf3BISJlmXd8YqSmKHwQzbmd25IL6Of8lt4XLABj5iyJ4HSp1J+DtQ06cF9qWODxb8HGyRWLQIxffFj93NzBYQYpeKNbY4S74f+W9DhuVIf9yI0g5rk3S84FRWJfekVcXzCFJIXkvSBxyZCd7X1/gm90J3q9Jne7r61dmSzkLQLwrIRWEZ7JfUnPEHnQEFPjUhgzuBJaq/m/H10CJQzP+HELtLxDvVKE8CpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aneZp+yE/WeFwSX6pvh0s+pUqX0X7mo0+QmlmvXJXd4=;
 b=dXzjtdxAFl6sX1ezbF6d9Wxm0qxuduczo27JozMW8CUWpXK1bP1xfbFY5O5ebkZpR+nfSejY0dopsOOf+w8+zEa8ctcQqBGiI+bFPalLFSktJtX+1+bCBdxQbU7bBZRCTpxy9oEOc+I8++EJARZ3pDLPeit13pvIrwAdPe7CHUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by PH7PR12MB9224.namprd12.prod.outlook.com (2603:10b6:510:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Tue, 17 Oct
 2023 06:28:40 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 06:28:39 +0000
Message-ID: <b9e6ccc8-6f97-40fc-ae96-800727ff7bab@amd.com>
Date: Tue, 17 Oct 2023 17:28:21 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh
 <brijesh.singh@amd.com>, Jeremi Piotrowski
 <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, dave.hansen@linux.intel.com
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
 <652e086f8de7_f879294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
In-Reply-To: <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0042.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::16) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|PH7PR12MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8cec81-6cde-4476-0336-08dbceda4cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O8eUmwh1hZcGxgdBrpiCF6YvXaMnz7zIvU84DCP8BPsLaR+YIBQSxe1GR3BjymBVaP/mjXx5eWT1mOqOm77oMCWSVx2sYl8U1P2gX5iGfMdhU27rnVz63ZoRoXFQOZBaII451JtPWA9uV+FwgWETkfrzP0dDy20ta51XUkIh2iOk9sZSV+idPYhdmK2w2DTSnk4l1okAlJrNMR1+55wzf9HSAnweGpb8Gq/uY3K1Q7GQWBFFtS5Eadxjj4CoaeSm59YL0uMq44cTDIOh29cV55h+Dl+jDi6nX5IV0mjnLcaSs4mDskilNlB5ZaBAdUSr8tA6qjMn2nHzw6ZkJTUXqo0FT+JF/4ukPanRuIPcGvcGNYP3aoTByyWWSJO62wKtHdsu0NfZCbm6DPA0gx+vusUqo89ZJNn0oLsLybAlBKHX2TmYHdkGhLbgg63f9fTx4K8Y/pdeNi52SPJHBRIf4USgnEXkB0/+NjHrB3EQQhE1KqFEmUI6BclpiVcIhZvpnfmxcIcxKZ9psmfxiz94kLavoUEhScSLUwrt8DA3l+IMG71zVPO1BVehel3Nv2DQjFhCAvRu8EfSxYsEfZQla3bbLBeAHPqcanukY17PvAxGL53bq6+C/aHmBzg/olqj5e5oc52gzc2NPne3y7CIXoBijRffaYjVUWKfY1WfQeMQoqnehAfAp/sQ8265iDxW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31696002)(38100700002)(36756003)(31686004)(6666004)(54906003)(6512007)(6486002)(8936002)(4326008)(30864003)(478600001)(41300700001)(2906002)(83380400001)(966005)(8676002)(53546011)(5660300002)(6506007)(66476007)(66946007)(26005)(66556008)(2616005)(316002)(21314003)(45980500001)(43740500002)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WllsZDVxanQvMDR2Qi85QzByMllZYnRKaWlFUEhROTZ2SGhoL2VmT3Rlaitt?=
 =?utf-8?B?a2phWHRxdmNwNWE5TzVFMk5rZHJMZnF0UXVTcWVMdmF6ZHhuSHpVcVQ3N2tJ?=
 =?utf-8?B?YncwczFTUVhLRkZGMnNSRjZzVDcvUENCejY3bi8rT29LMVJEelQ1OTFERG1n?=
 =?utf-8?B?ZDNLSWROV0FURTVIbGZRS0lta3M5UXZhQjlTc3lCbjNLOWJsYWduMWNnaUJO?=
 =?utf-8?B?bi94ckt1N0l3dURGM1ZCWjNmMFYyRVlwa2xaYncrMjM5clRqOUVvNXdMdnJ4?=
 =?utf-8?B?R3JtbUs3MnZpdks0R1hhZEtYdkJBaXZMUXdOb29BRzhnZUpkbHZCb2F2a2Q5?=
 =?utf-8?B?SUJ0ejZyQ296azNXN2VyV3pxd2xBZGRkLzAzcTRIRFdsZHQyVUZoK0NRRFZ5?=
 =?utf-8?B?S0JrQVBKdXJsRVhoY09QU0VlclMvcHI3eFlLbzJWakZVUlZWWmlkUERLS3B3?=
 =?utf-8?B?MWZxVmFlNjFCdXZEakdSTUNJbUZZUThGREFDSHZiZ3JxcDFaME5xRUtnUHBT?=
 =?utf-8?B?NDFLTDZDV3o1eW03QTZWczg0T2M4bTF0RUxyekZXVGNJOU13Z0FhSHFxYkhs?=
 =?utf-8?B?RURNTVl4UWcwQUphRnFEZkVHZHBmVUd3cmYvTHlYUFVMWktTREZpYUt4NlZ1?=
 =?utf-8?B?VFJYOE44K25kdjgxbEVFM1l4eDh0TW51cVVhYlYwREdZeUZteFpaZlkybmFm?=
 =?utf-8?B?cTBMY1RQSlpjeGRRNGhtNEF1QlVwUHpwRmZMY0ZWQzlwbCtzUVFLMm1xNFpX?=
 =?utf-8?B?bzh1aXl0TktWcEJSVkl1dVVGOGFJTmcrNmVGM3Y0aFRzWTkxZWlsZGVXOEZR?=
 =?utf-8?B?azh0K1psd3BDTWswWThOWFB5b1dtcjdKbUhsUGlHczVwaUp4MVZyTmtQSTVL?=
 =?utf-8?B?U1Z4WTFCYktyOUxKQkhBNlB0S0M0QWJYUXltcC83UkpGYzZwM3VPUHJOQXlo?=
 =?utf-8?B?Yjg1Z1l5WUFKb0ZVTDFoYzFET0ZwNURtYmRHaU9tcWFzckdydjMvVmpSTXR0?=
 =?utf-8?B?WkpOWURaUVducFpDYy9ndEpvUjZtaURwZGFTL240UjBSVW1SMHZGVlhmSFdX?=
 =?utf-8?B?NXRiUWhKOG91REZLNDIrR0FnV3pySHQyOU9zM1RJT1ZHQWdWeEF4U3RTWkRi?=
 =?utf-8?B?R2M2MEJDdnpXSjBqcDIwQm9wUkVDdE8rN0w3aElWMTc0ekJ1RmRab21LeXBP?=
 =?utf-8?B?UXdXclpvc1FzYUxZVkZoSzNYNDJvVlNaQnRHWWhveEs3ZnJWVTI1ZDRCRmU0?=
 =?utf-8?B?Zkh1SElUQ3hjQXc3N2dUaGJBQ0xhQjAwalVLNVduWU5ONmRVVm9LT2ZoN3JW?=
 =?utf-8?B?c1NOWng5VElFL2RaR05NWS9kWWowMmZJL25NV0h4T0FNaTg2VDlzN1pmRk9X?=
 =?utf-8?B?dDNnUzc2TDhiQVhNUkhsYnRRSVVNYlVjV1I2U1N1WWxBVk1tZlpmaFBGaE53?=
 =?utf-8?B?OVI1MG1KQjdJdnIyTTlBbUNCUzhjVXZEZXVYZm9BQUQ5RkFxSm1pY3BaU1Iy?=
 =?utf-8?B?bmRnZUlRNndMeFBtbjVVMWk2cmxGZ0dsSVVYQU9QTWpuMUxMYW5OVUhHN3lC?=
 =?utf-8?B?VE5TaEtqakNJR0gvWTdDOVE5QTl4dHl4VzlIRlltRTNCaHBueThPNkYycWxT?=
 =?utf-8?B?dEVoTlpOWHZOdzFVdU9EQlUvMVJLVTJmZjJTOG5ldjJMZlJ6bDhLcDU5MTNR?=
 =?utf-8?B?NkUzeHp3M2YxU0ZzUmRMNWVEQ2JzZ1RnR3pJa2prdzZIaENka1d6Z2dCVVN5?=
 =?utf-8?B?dGtweTh4bU5tb1BFVmx1VG9Sa2h3bXUvMERCS3NUVEQ5bTk0czJGSWw4UGlR?=
 =?utf-8?B?Z2Znb3ZiUE9qQnZyN2c5ZHJKNllsRWI2bmJOMm91NHJ5am9QN0pERENMUHFt?=
 =?utf-8?B?SDM1aUQ0KytvTnh2VUlWL3M1Z2xxN1EvVGY1OGJLeE1nL2xRYjE5cmRyYmVM?=
 =?utf-8?B?SzFSYzl3TFFxSk5uVkVUOHI3WnlaeU9ZQW5VaVQzbWx4Z3QwdjZxRVBJMC9C?=
 =?utf-8?B?bzRYU0ZqN25xWlRwMWVDbVNPOHp3Y0psMmFuVlh1RXY4ZmRDbDVwNGNzN2ZO?=
 =?utf-8?B?Wm1YR3JxME1iQnlkcUV6NGxKbkh6SndBcy9wUFRPKzVwbTBOQW5qSlVwT3Ns?=
 =?utf-8?Q?Z7KIq4+FWzFX9KCU8nmbz3tTA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8cec81-6cde-4476-0336-08dbceda4cef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 06:28:39.3018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ruy6FkJGSi07tbesFLJhQ2TcdpZJuymntxGMRsLz+E4opJBs4H+JSeq9lvn2FATg+wkvODdpytogMhYA4D7vmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9224


On 17/10/23 16:35, Alexey Kardashevskiy wrote:
> 
> On 17/10/23 15:07, Dan Williams wrote:
>> Alexey Kardashevskiy wrote:
>>> On 13/10/23 13:14, Dan Williams wrote:
>>>> The sevguest driver was a first mover in the confidential computing
>>>> space. As a first mover that afforded some leeway to build the driver
>>>> without concern for common infrastructure.
>>>>
>>>> Now that sevguest is no longer a singleton [1] the common operation of
>>>> building and transmitting attestation report blobs can / should be made
>>>> common. In this model the so called "TSM-provider" implementations can
>>>> share a common envelope ABI even if the contents of that envelope 
>>>> remain
>>>> vendor-specific. When / if the industry agrees on an attestation record
>>>> format, that definition can also fit in the same ABI. In the meantime
>>>> the kernel's maintenance burden is reduced and collaboration on the
>>>> commons is increased.
>>>>
>>>> Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
>>>> the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
>>>> retrieving the report blob via the TSM interface utility,
>>>> assuming no nonce and VMPL==2:
>>>>
>>>>       report=/sys/kernel/config/tsm/report/report0
>>>>       mkdir $report
>>>>       echo 2 > $report/privlevel
>>>>       dd if=/dev/urandom bs=64 count=1 > $report/inblob
>>>
>>> Is not this one a "nonce"?
>>
>> No, a nonce would come from the verifier to be mixed with the 64-bytes
>> that the guest uses to establish a shared secret. In this case this is
>> just showing the mechanics of the ABI with those security best practices
>> set aside.
>>
>>>
>>>>       hexdump -C $report/outblob # SNP report
>>>>       hexdump -C $report/auxblob # cert_table
>>>>       rmdir $report
>>>>
>>>> Given that the platform implementation is free to return empty
>>>> certificate data if none is available it lets configfs-tsm be 
>>>> simplified
>>>> as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
>>>> SNP_GET_REPORT alone.
>>>>
>>>> The old ioctls can be lazily deprecated, the main motivation of this
>>>> effort is to stop the proliferation of new ioctls, and to increase
>>>> cross-vendor collaboration.
>>>>
>>>> Link: 
>>>> http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
>>>> Cc: Borislav Petkov <bp@alien8.de>
>>>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>>>> Cc: Dionna Glaze <dionnaglaze@google.com>
>>>> Cc: Brijesh Singh <brijesh.singh@amd.com>
>>>> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
>>>> Tested-by: Kuppuswamy Sathyanarayanan 
>>>> <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>>> ---
>>>>    drivers/virt/coco/sev-guest/Kconfig     |    1
>>>>    drivers/virt/coco/sev-guest/sev-guest.c |  133 
>>>> +++++++++++++++++++++++++++++++
>>>>    2 files changed, 134 insertions(+)
>>>>
>>>> diff --git a/drivers/virt/coco/sev-guest/Kconfig 
>>>> b/drivers/virt/coco/sev-guest/Kconfig
>>>> index da2d7ca531f0..1cffc72c41cb 100644
>>>> --- a/drivers/virt/coco/sev-guest/Kconfig
>>>> +++ b/drivers/virt/coco/sev-guest/Kconfig
>>>> @@ -5,6 +5,7 @@ config SEV_GUEST
>>>>        select CRYPTO
>>>>        select CRYPTO_AEAD2
>>>>        select CRYPTO_GCM
>>>> +    select TSM_REPORTS
>>>>        help
>>>>          SEV-SNP firmware provides the guest a mechanism to 
>>>> communicate with
>>>>          the PSP without risk from a malicious hypervisor who wishes 
>>>> to read,
>>>> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c 
>>>> b/drivers/virt/coco/sev-guest/sev-guest.c
>>>> index e5f8f115f4af..f3ca083127af 100644
>>>> --- a/drivers/virt/coco/sev-guest/sev-guest.c
>>>> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
>>>> @@ -16,10 +16,12 @@
>>>>    #include <linux/miscdevice.h>
>>>>    #include <linux/set_memory.h>
>>>>    #include <linux/fs.h>
>>>> +#include <linux/tsm.h>
>>>>    #include <crypto/aead.h>
>>>>    #include <linux/scatterlist.h>
>>>>    #include <linux/psp-sev.h>
>>>>    #include <linux/sockptr.h>
>>>> +#include <linux/cleanup.h>
>>>>    #include <uapi/linux/sev-guest.h>
>>>>    #include <uapi/linux/psp-sev.h>
>>>> @@ -768,6 +770,129 @@ static u8 *get_vmpck(int id, struct 
>>>> snp_secrets_page_layout *layout, u32 **seqno
>>>>        return key;
>>>>    }
>>>> +struct snp_msg_report_resp_hdr {
>>>> +    u32 status;
>>>> +    u32 report_size;
>>>> +    u8 rsvd[24];
>>>> +};
>>>> +#define SNP_REPORT_INVALID_PARAM 0x16
>>>
>>> There is one already - SEV_RET_INVALID_PARAM, defined in "Secure
>>> Encrypted Virtualization API".
>>
>> Ok, indeed I took this from Jeremi without checking for other
>> definitions.
>>
>>>
>>>> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
>>>
>>> This one needs to be defined in include/uapi/linux/psp-sev.h's 
>>> sev_ret_code.
>>
>> Ah, ok, will move.
>>
>>>
>>>> +
>>>> +struct snp_msg_cert_entry {
>>>> +    unsigned char guid[16];
>>>> +    u32 offset;
>>>> +    u32 length;
>>>> +};
>>>> +
>>>> +static int sev_report_new(struct tsm_report *report, void *data)
>>>> +{
>>>> +    static const struct snp_msg_cert_entry zero_ent = { 0 };
>>>> +    struct snp_msg_cert_entry *cert_table;
>>>> +    struct tsm_desc *desc = &report->desc;
>>>> +    struct snp_guest_dev *snp_dev = data;
>>>> +    struct snp_msg_report_resp_hdr hdr;
>>>> +    const int report_size = SZ_4K;
>>>> +    const int ext_size = SEV_FW_BLOB_MAX_SIZE;
>>>
>>> These two are size_t. Or u32. "int" is just weird :)
>>
>> Nothing is bigger than a few kb here, but ok.
> 
> If it all was just "unsinged", I would not bother commenting :)
> 
>>
>>>
>>>> +    int ret, size = report_size + ext_size;
>>>> +    u32 certs_size, i;
>>>
>>> @certs_size is size_t (as it is copied to ->auxblob_len in the end), and
>>> @size is size_t as well.
>>>
>>> @i is just "unsigned", can be declared right in the "for" below?
>>
>> ok.
>>
>>>
>>>> +
>>>> +    if (desc->inblob_len != 64)
>>>
>>> 64 is either ext_req.data.user_data or TSM_INBLOB_MAX really.
>>> May be even BUILD_BUG_ON(TSM_INBLOB_MAX != 
>>> sizeof(ext_req.data.user_data)) ?
>>>
>>>> +        return -EINVAL;
>>>> +
>>>> +    void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
>>>
>>> I did not realize declaring variables in a middle of a scope is allowed
>>> now :)
>>
>> Yes, it's been allowed in loop declaration for a few kernels now and the
>> new __free() helper in cleanup.h will make this model more prominent. My
>> sense is that it is still not open season on mid-function declarations,
>> but __attribute__((__cleanup__())) usage needs it.
>>
>>> Since you are doing this, move zero_ent below. Or, better, use
>>> guid_is_null().
>>
>> guid_is_null() is not techinically enough given the specification
>> mandates that the entire entry is zero.
> 
> Well technically it says that guid, offset and length must be zeroes. 
> So, (guid_is_null() && !offset && !length) and no yet another static 
> declaration of a bunch of zeroes far away. I even wonder if there is a 
> helper to check if some memory is all zeroes :) Up to you.
> 
> 
>>>> +    if (!buf)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    guard(mutex)(&snp_cmd_mutex);
>>>> +
>>>> +    /* Check if the VMPCK is not empty */
>>>> +    if (is_vmpck_empty(snp_dev)) {
>>>> +        dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
>>>> +        return -ENOTTY;
>>>> +    }
>>>> +
>>>> +    cert_table = buf + report_size;
>>>> +    struct snp_ext_report_req ext_req = {
>>>> +        .data = { .vmpl = desc->privlevel },
>>>> +        .certs_address = (__u64)cert_table,
>>>> +        .certs_len = ext_size,
>>>> +    };
>>>> +    memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
>>>> +
>>>> +    struct snp_guest_request_ioctl input = {
>>>> +        .msg_version = 1,
>>>> +        .req_data = (__u64)&ext_req,
>>>> +        .resp_data = (__u64)buf,
>>>> +        .exitinfo2 = 0xff,
>>>
>>> Not sure we need this line with 0xff.
>>>
>>> The GHCB spec says the hypervisor sets it, not the guest. And I could
>>> not figure out why exactly snp_guest_ioctl() does "input.exitinfo2 =
>>> 0xff", my best guest it is to catch GHCB not being called before copying
>>> memory to user.
>>
>> It does mostly seem that way, but given this is plumbed deep into
>> handle_guest_request() I figure might as well keep common semantics.
>>
>>>> +    };
>>>> +    struct snp_req_resp io = {
>>>> +        .req_data = KERNEL_SOCKPTR(&ext_req),
>>>> +        .resp_data = KERNEL_SOCKPTR(buf),
>>>> +    };
>>>> +
>>>> +    ret = get_ext_report(snp_dev, &input, &io);
>>>> +
>>>
>>> Unnecessary empty line.
>>
>> ok.
>>
>>>
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    memcpy(&hdr, buf, sizeof(hdr));
>>>> +    if (hdr.status == SNP_REPORT_INVALID_PARAM)
>>>> +        return -EINVAL;
>>>> +    if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
>>>> +        return -EINVAL;
>>>> +    if (hdr.status)
>>>> +        return -ENXIO;
>>>> +    if ((hdr.report_size + sizeof(hdr)) > report_size)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
>>>> +    if (!rbuf)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
>>>> +    report->outblob = no_free_ptr(rbuf);
>>>> +    report->outblob_len = hdr.report_size;
>>>> +
>>>> +    certs_size = 0;
>>>> +    for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); 
>>>> i++) {
>>>> +        if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
>>>> +            break;
>>>> +        certs_size = max(certs_size, cert_table[i].offset + 
>>>> cert_table[i].length);
>>>> +    }
>>>> +
>>>> +    /* No certs to report */
>>>> +    if (!certs_size)
>>>
>>> Nit: WARN_ON_ONCE(i) here?
>>
>> Seems harsh for what could only be a firmware bug, panic_on_warn users
>> would not appreciate crashing the kernel over something recoverable like
>> this.
> 
> This would a HV bug as certificates come from the KVM. And it is 
> (slightly) more likely that the HV is trying to trigger buffer overrun 
> in the guest.
> 
>>>
>>>> +        return 0;
>>>> +
>>>> +    /*
>>>> +     * cert_table reports more data than fits in ext_size the
>>>> +     * userspace cert_table walker can decide what happens next,
>>>> +     * truncate the output
>>>> +     */
>>>> +    if (certs_size > ext_size)
>>>> +        certs_size = ext_size;
>>>
>>> This sounds more like the HV provided a broken table with offset(s)
>>> ouside of the certs buffer. The HV is expected instead return
>>> SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the
>>> guest to retry.
>>
>> The existence of SEV_FW_BLOB_MAX_SIZE suggests the driver is not
>> prepared to retry. Retry support would be a follow-on new capability.
> 
> My point is that you should not get into the situation when this 
> calculated certs_size is greater than ext_size. If this is the case 
> because someone sent too many certificaties via /dev/sev or kvmfd on the 
> host, the GHCB call won't return any certs and will ask for a retry 
> instead.
> 
> 
>>>> +
>>>> +    void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
>>>> +    if (!cbuf)
>>>> +        return -ENOMEM;
>>>
>>> In a such (unlikely) event the function returns an error but does not
>>> free report->outblob which is going to leak if consequent call succeded.
>>> This new no_free_ptr business is confusing at times :(
>>
>> If this fails it results in the attribute read failing and
>> read_generation does not advance. The next read attempt will free the
>> partially completed report and retry,
> 
> Ah ok. In general, it just feels like every use of no_free_ptr() defeats 
> the whole purpose of __free(xxx).
> 
>> or the driver gets unloaded and
>> the partially completed report is freed at that time.
>>
>>>
>>>
>>>> +
>>>> +    memcpy(cbuf, cert_table, certs_size);
>>>> +    report->auxblob = no_free_ptr(cbuf);
>>>> +    report->auxblob_len = certs_size;
>>>
>>>
>>> Aaaand, it works, so:
>>>
>>> Tested-by: Alexey Kardashevskiy <aik@amd.com>
>>
>> Thanks!
>>
>> Did you happen to test @auxblob population? I was not able to test that
>> path on the hardware I tried.
> 
> Yup. I have a disgusting python script which feeds some dummy certs to 
> /dev/sev on the host and checked they travel all the way to this 
> configfs nodes.
> 
> 
> #! /usr/bin/env python3
> 
> #define _IOC_SIZEBITS   13
> #define _IOC_DIRBITS    3
> #define _IOC_NONE       1U
> #define _IOC_READ       2U
> #define _IOC_WRITE      4U
> #define _IOC(dir,type,nr,size) \
> #        (((dir)  << _IOC_DIRSHIFT=30) | \
> #         ((type) << _IOC_TYPESHIFT=8) | \
> #         ((nr)   << _IOC_NRSHIFT=0) | \
> #         ((size) << _IOC_SIZESHIFT=16))
> #define _IOWR(type,nr,size) 
> _IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))
> 
> import fcntl, array, sys, binascii, pprint, re, uuid, subprocess, os, 
> struct, uuid
> 
> # This is:  cat ~/s/sev/sev-guest | ssh $1 python3 -
> if len(sys.argv) > 1 and '-' not in sys.argv:
>      remote_host = sys.argv[1]
>      print("*** Running remotely on {}".format(remote_host))
>      f = open(os.path.realpath(__file__), 'r')
>      ssh = subprocess.Popen(["ssh", remote_host, "python3", "-"], stdin 
> = f)
>      ssh.communicate()
>      sys.exit(0)
> 
> 
> _IOC_READ = 2
> _IOC_WRITE = 4
> 
> def _IOC(d, t, n, s): return (d << (16 + 13)) | (t << 8) | n | (s << 16)
> def _IOWR(t, n, s): return _IOC(_IOC_READ | _IOC_WRITE, t, n, s)
> 
> SEV_IOC_TYPE = ord('S')
> sev_issue_cmd_size = 16
> SEV_ISSUE_CMD = _IOWR(SEV_IOC_TYPE, 0x0, sev_issue_cmd_size)
> 
> SNP_SET_EXT_CONFIG = 10
> 
> def sev_issue_cmd(fd, cmd, data):
>      data_ptr = data.buffer_info()[0]
>      arg = struct.pack("=LQL", cmd, data_ptr, 0)
>      try:
>          arg = fcntl.ioctl(fd, SEV_ISSUE_CMD, arg, True)
>      except OSError as x:
>          return x.errno, 0
>      _, _, err = struct.unpack("=LQL", arg)
>      return 0, err
> 
> # struct cert_table {
> #    struct {
> #        unsigned char guid[16];
> #        uint32 offset;
> #        uint32 length;
> #    } cert_table_entry[];
> # };
> def cert_table_entry(cert_table):
>      ret = array.array('B')
>      hdr = array.array('B')
>      offset = (16 + 4 + 4) * (len(cert_table) + 1)
>      i = 0
>      for i, c in enumerate(cert_table):
>          cert = array.array('B', [ord('0') + i] * 32)
>          ret += cert
>          hdr += array.array('B', c.bytes)
>          hdr += array.array('B', struct.pack("=LL", offset, len(cert)))
>          offset += len(cert)
> 
>      return hdr + array.array('B', [0] * 24) + ret
> 
> myuuids = [uuid.UUID("f50ec0b7-f960-400d-91f0-c42a6d44e3d0"),
>          uuid.UUID("9f3d7b34-6c0d-11ee-bcd4-f8e4e3857730"),
>          uuid.UUID("aabbccdd-eeff-0011-2233-4567890abcde")]
> cert_table = cert_table_entry(myuuids)
> cert_table += array.array('B', [0] * (4096 - len(cert_table)))
> 
> # sev_user_data_ext_snp_config
> ext_config = array.array('B', struct.pack("=QQL", 0, 
> cert_table.buffer_info()[0], cert_table.buffer_info()[1]))
> 
> sev = open("/dev/sev", "w")
> ret, err = sev_issue_cmd(sev, SNP_SET_EXT_CONFIG, ext_config)
> print("ret = {} err = {}".format(ret, err))
> 

Ah the script's result as it appears in the guest, just in case:


aik@aik-Standard-PC-i440FX-PIIX-1996:~$ hexdump -vC 
/sys/kernel/config/tsm/report/report0/auxblob
00000000  f5 0e c0 b7 f9 60 40 0d  91 f0 c4 2a 6d 44 e3 d0 
|.....`@....*mD..|
00000010  60 00 00 00 20 00 00 00  9f 3d 7b 34 6c 0d 11 ee  |`... 
....={4l...|
00000020  bc d4 f8 e4 e3 85 77 30  80 00 00 00 20 00 00 00 
|......w0.... ...|
00000030  aa bb cc dd ee ff 00 11  22 33 45 67 89 0a bc de 
|........"3Eg....|
00000040  a0 00 00 00 20 00 00 00  00 00 00 00 00 00 00 00  |.... 
...........|
00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|................|
00000060  30 30 30 30 30 30 30 30  30 30 30 30 30 30 30 30 
|0000000000000000|
00000070  30 30 30 30 30 30 30 30  30 30 30 30 30 30 30 30 
|0000000000000000|
00000080  31 31 31 31 31 31 31 31  31 31 31 31 31 31 31 31 
|1111111111111111|
00000090  31 31 31 31 31 31 31 31  31 31 31 31 31 31 31 31 
|1111111111111111|
000000a0  32 32 32 32 32 32 32 32  32 32 32 32 32 32 32 32 
|2222222222222222|
000000b0  32 32 32 32 32 32 32 32  32 32 32 32 32 32 32 32 
|2222222222222222|



-- 
Alexey


