Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844EBBE58
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 05:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pMTcLlRJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2G+BFVaZVadxGOQMvntJ1sGhSji0Tik5XLyVwWCL7fkwucaesLpFJ9iT+Rq60JB6V2bA1jFigGsLvnSCHXd99b99ROBIgSUl4abTiu9UGele7wCt14P+WMjpxdFgEe99pPLV8lpCWCwzMmvMWfq6cgWj5ASQTEJSEECihV0Y6S0fZuMX5UP8up3RHbc/1bLc10ieV4FMKus7KwabECOWXGvNO2NkVl7FmUqNemtyPxnjQPhn6xy2cM3hzVZDaWLvTvec4Jfa5JJSlJHkx6wPaoitx08jSYfV41wyPdue8EVAxa/I7kmKZcZbnh1iHfqvALwdIf6Sq5crDN876kjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI5b/jFGjP4rfF4pLGBabFMDwtsDURZtGvnNSOiDXNE=;
 b=ATYorRjlbnfMtqqLqOfIhwOqUkXlqFByS64xPtliWazfL3LR8HR8CP42TY+CjpKt4xMscUpGZzKPxB6YIXI0RxK7eD90eQFEUiXd6HnyiF+a8nF6cyL3NG6dtzdurDE/Yi4wLSvzpzVaWQXkuoaU6Fjh5SpW6j1uqofg3w8fLtIyoAc94glzxLhdpiTn3yGtvAuMnn150hMaQVr12NnNuhTMmen5HjJjOJjHOeooqzEhnEFjIA+mkGerhxt0K6eImeBn6wzbPjqnFdANDR2PyxBSGFReAQtl5SddF/egkuKSeNNiOosnDRbVfbmejyeUsNa8uC6DI/AqhIf5BMJnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iI5b/jFGjP4rfF4pLGBabFMDwtsDURZtGvnNSOiDXNE=;
 b=pMTcLlRJJwm1C0uUi2S4yHUHYb5l0i8mvRjh40luQroBSaRM78FFEMKq4x9GXOS3021KfMLmrd5WxJ6pAQmfCwD/eTAYK9t7A7u9hQiFYi37YgScxWDZ46nUtQF59inV3pGN49pgGpw3S2Znj5KiQSMLcgh4QLmWXPBqZDNUOxI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Tue, 17 Oct
 2023 05:35:46 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 05:35:45 +0000
Message-ID: <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
Date: Tue, 17 Oct 2023 16:35:29 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
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
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <652e086f8de7_f879294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY6PR01CA0140.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::15) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: 8316e039-2d8b-420f-be99-08dbced2e907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Bm04xPPwFsI9zVNT3W1LLCxZLJajOFAotfOKUXOi9LblfUCZLQZKMBk0vmRKROPkI71zuV2iw8HQp6TVSOxU9pfziJL/5WTMZSOzorNZFlC7UAZgWW8G8LzgflCtPxIX1uCHQ3Q4WqJGXZCRvvJTkTMxPqfX1SGs6xJz4JlTiQT1SysufeVbRn14dOQD2XRYLLM/P1N5yYkyqkr8IbL9XDedqaNEF5AY273SE4f38grTjOrXxhpU7/T77VfLRLQgWuKoib1MVtK0R3C7S7Msxr3gUPUcmjQNZAnGUgz1Bo4caSTeO1DBZzPCX7ZjzAPgc6rfzAFCh1JNwIiQFZbfjqnBEXNXV5IcPCETDQV4cMfc+I4QnKwNw5hTvkKJCN9SyPwma1lS5BAekv5ZLtDgdDh4IgKc+h/GdtZp1HNLOgY6mANEkaGzrqcqkBg3PrzMyD7IKzOAHhxBN/NuUFJvupv1tgd3wyuGruybVV5iCYTtIO1y4EVumohLyZ0LOMPptn/S8yChMawAJy7onF9iTq9TvQA4tUGSL1bnc/ShsZS8zE8L72/HXjQoQonDa6fxqyIsOxz3cLnTRwJvz+43bkAEW3qPGBHrISNcLska6ZwombZZkJf5G80ZIcaZpfpjsK7lCUB+MYBe9JU26myTGcZD7mk+kGUS4GB8OV88js=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(966005)(6506007)(53546011)(478600001)(6512007)(6486002)(6666004)(31696002)(36756003)(38100700002)(2906002)(66556008)(2616005)(26005)(316002)(83380400001)(66476007)(41300700001)(30864003)(5660300002)(8676002)(66946007)(8936002)(4326008)(54906003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFg1dUMzRG5GQkVRdUxOMXBuYmJhOVRRSUpkVUhxZGR2VUxZclhtaGhhYmly?=
 =?utf-8?B?OTVNQnhhb0VsVklqaEZXbHF6U1I1OVk1dzhNT3poSXFpdXdQNDRwS1FQclJp?=
 =?utf-8?B?VmlZOVU0VVBxejVWQ2ZIWlJ5b3hiRUl2Y0JwRHJMMXltcENNVVZxSFVKUlFW?=
 =?utf-8?B?cjZUTXZrbUtYMWYrZERBSUpxM2Jic09pZm1Ma0Z2L1N6THRhcU9NV2wzWUt0?=
 =?utf-8?B?amk5YUFZelhpdUF2ZkR5enliMzZ4Y0o5d1oxcmlMdHhHSDBjNk1pTnFsMTFx?=
 =?utf-8?B?VFltOURGVmpGY1RTaEFGaDBaaVBHSmVEQ3QxUDJCM0xYc3FsWU43S1UzU0hk?=
 =?utf-8?B?SE9TSGhyeno2WHA3NTZqZVlkMzN5SmxsREQ0cjMvQ3VqMEhZQW9xU2tzWVUy?=
 =?utf-8?B?eGdPWnhDRFA4NUxFNmVodUdPVkJtdVVVQlVLYVR3RlcyZDdySmE5SVZqdUMv?=
 =?utf-8?B?Z1oySmRTb21CcDJwZGdGNU1welQvVnp3dkdjdXJra0hNTWNuN1NWZjExUnZJ?=
 =?utf-8?B?T2RlZ0UxZjF3UUdTQzJrSk0zSDJjUHpOdm4xWEZ3dHJmVmppV3hNZjlMejN1?=
 =?utf-8?B?L2k4L3J2NEhnOTkyRkIydWE1S2JrVjcxUnl0RC9kR0tTa1RZOUR2VXVySVpp?=
 =?utf-8?B?R0tBQzV3SyszSGFrYk1qN2ZUTlpZNk9ucUtQQ0hPUW4yaGVVOHp2L0c5c2kv?=
 =?utf-8?B?WCtNTlN0V0VISW1xcW1SdS92emtVc01hUDR2S2NGdkxRdHk1Zi9kei9XSmRC?=
 =?utf-8?B?eE43N0s5S1JQdENNVHp2ajMzQmJkZDI1WjgvWmZSVExmUUx4aXNmaDRjZG1V?=
 =?utf-8?B?K1N6UUlMYVY0OWVQRmtPdzJvKzd2cGRqVG5mZE9jRFduNjNQcVFLWko3bjFx?=
 =?utf-8?B?R1NBNUhSazNwdjgyc0FhaWN6NExtTEhCR2llWmM1UlZ4QVc5TzlnQTNON0Zp?=
 =?utf-8?B?dVVhZ2NqbXhZWStXd3NlWTYzSmIvaGJYd1VPUmdhcW1RMUpnZEZPVmhLWUZJ?=
 =?utf-8?B?SFAzMStVSEFsUG9pRjVzY1E3TWtCM2s1MktnbzBpWlZUN1RVTGN0cGFFajBO?=
 =?utf-8?B?Z29OUHYvbVlCSXpiQWR3SGRQSHh3THpVd3lOKzJ1R0FtZjZET0VvWUU0YmhJ?=
 =?utf-8?B?ajNrSHZlTnlldU9NQVc5eWtiMEpsNFVCV0NWZXkvSHI4emNNMDEvZ1QwQlhs?=
 =?utf-8?B?SGNHTnBZb084cmRIQnRGVWVBc2xXUG1KKzU0d3FKd3lnbUF1VTVpUFFMb2FN?=
 =?utf-8?B?UDhXTzFlbktWRGliMXJoenlRWURXU3I2b2ZtMWZId1hIa094b0tPbmVBM3ZZ?=
 =?utf-8?B?cHltdzlnVGVWS1NxQVU2enpiRVB6UVY1Y2hBMzlvMnlKVkxHQUNOOUhiM2RF?=
 =?utf-8?B?K3NqOHdBZlZpVC9xcW8yZ2E4RHc2UUMzR3BteE1VNVQ2Y2FONHRRaEJiajU4?=
 =?utf-8?B?Y1M5VkpldjkxWEFja3Z5eEFheGdlOWJtNXNnZmVqT3NZRUJiaEdXVTFCYU1Z?=
 =?utf-8?B?Y0hXbWJRYTIwMWttMGxVVTRIWDU0M3I5OFgrdU5IMEtnc3U2UEtQNzVPQnpU?=
 =?utf-8?B?RGFwL1JOSnUzS0J2ektsYXhUUHh1aG5ZMFVKOWNwU3RseGt3SWZJZkpjQmw4?=
 =?utf-8?B?TlNjZUhqZnBRanFvM0xZRTdEenZIZlN2eE1pN2hYa1NZRktudEYvODVVZHha?=
 =?utf-8?B?YXRnZTY2ZlVEN0FmWnp4NGxkTjhPRHRhaEFKZFQ2YzVkM1B1YTA1dzNEMVlT?=
 =?utf-8?B?dTc3bUZ5WlkwOW9EQXpXSzF4ZWlBbEhlZkh6a2s1dmpMVFB4NURvZkIyZ3lE?=
 =?utf-8?B?UnRTK05CQmF0V0RUYWtucTkrbEtuRnJkcUNtTmEzd2xCU0ZRYVlzSWxqeWJS?=
 =?utf-8?B?dnFwVHp6Q2JnOE5JOXh6YU5zOU0vSlMwVklzNEtTOVg2VFh0blVOZ01vU3Iy?=
 =?utf-8?B?cDJpY1FDTTkrM0Q1K21waG5sbUJGbEIvN0E4a3R3VnM4RjBoVWQwUTZxQ0FB?=
 =?utf-8?B?dlZyVW5PbEpPazNpcFRDMkZMSXVldWM4MEVwNG9CakxvSWptdXE0TmhQV3Iw?=
 =?utf-8?B?aERLSERGcGlxVDc1dWk5d0hNYUg3QXdGWUEvRklWQUVwS3orUW52TmdMQTZ3?=
 =?utf-8?Q?dliXVs3pDlIQ0bNM0tNu5Kl7m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8316e039-2d8b-420f-be99-08dbced2e907
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 05:35:45.4148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imswu+nIt7CSh7vXSG6z+fRyGT87+DO02wQ5t2cNhOzrcBxd4wDrgoQ3N8SC4S5ME0H3N5w6hmoGbU3a1EBqNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530


On 17/10/23 15:07, Dan Williams wrote:
> Alexey Kardashevskiy wrote:
>> On 13/10/23 13:14, Dan Williams wrote:
>>> The sevguest driver was a first mover in the confidential computing
>>> space. As a first mover that afforded some leeway to build the driver
>>> without concern for common infrastructure.
>>>
>>> Now that sevguest is no longer a singleton [1] the common operation of
>>> building and transmitting attestation report blobs can / should be made
>>> common. In this model the so called "TSM-provider" implementations can
>>> share a common envelope ABI even if the contents of that envelope remain
>>> vendor-specific. When / if the industry agrees on an attestation record
>>> format, that definition can also fit in the same ABI. In the meantime
>>> the kernel's maintenance burden is reduced and collaboration on the
>>> commons is increased.
>>>
>>> Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
>>> the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
>>> retrieving the report blob via the TSM interface utility,
>>> assuming no nonce and VMPL==2:
>>>
>>>       report=/sys/kernel/config/tsm/report/report0
>>>       mkdir $report
>>>       echo 2 > $report/privlevel
>>>       dd if=/dev/urandom bs=64 count=1 > $report/inblob
>>
>> Is not this one a "nonce"?
> 
> No, a nonce would come from the verifier to be mixed with the 64-bytes
> that the guest uses to establish a shared secret. In this case this is
> just showing the mechanics of the ABI with those security best practices
> set aside.
> 
>>
>>>       hexdump -C $report/outblob # SNP report
>>>       hexdump -C $report/auxblob # cert_table
>>>       rmdir $report
>>>
>>> Given that the platform implementation is free to return empty
>>> certificate data if none is available it lets configfs-tsm be simplified
>>> as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
>>> SNP_GET_REPORT alone.
>>>
>>> The old ioctls can be lazily deprecated, the main motivation of this
>>> effort is to stop the proliferation of new ioctls, and to increase
>>> cross-vendor collaboration.
>>>
>>> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
>>> Cc: Borislav Petkov <bp@alien8.de>
>>> Cc: Tom Lendacky <thomas.lendacky@amd.com>
>>> Cc: Dionna Glaze <dionnaglaze@google.com>
>>> Cc: Brijesh Singh <brijesh.singh@amd.com>
>>> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
>>> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>> ---
>>>    drivers/virt/coco/sev-guest/Kconfig     |    1
>>>    drivers/virt/coco/sev-guest/sev-guest.c |  133 +++++++++++++++++++++++++++++++
>>>    2 files changed, 134 insertions(+)
>>>
>>> diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
>>> index da2d7ca531f0..1cffc72c41cb 100644
>>> --- a/drivers/virt/coco/sev-guest/Kconfig
>>> +++ b/drivers/virt/coco/sev-guest/Kconfig
>>> @@ -5,6 +5,7 @@ config SEV_GUEST
>>>    	select CRYPTO
>>>    	select CRYPTO_AEAD2
>>>    	select CRYPTO_GCM
>>> +	select TSM_REPORTS
>>>    	help
>>>    	  SEV-SNP firmware provides the guest a mechanism to communicate with
>>>    	  the PSP without risk from a malicious hypervisor who wishes to read,
>>> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
>>> index e5f8f115f4af..f3ca083127af 100644
>>> --- a/drivers/virt/coco/sev-guest/sev-guest.c
>>> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
>>> @@ -16,10 +16,12 @@
>>>    #include <linux/miscdevice.h>
>>>    #include <linux/set_memory.h>
>>>    #include <linux/fs.h>
>>> +#include <linux/tsm.h>
>>>    #include <crypto/aead.h>
>>>    #include <linux/scatterlist.h>
>>>    #include <linux/psp-sev.h>
>>>    #include <linux/sockptr.h>
>>> +#include <linux/cleanup.h>
>>>    #include <uapi/linux/sev-guest.h>
>>>    #include <uapi/linux/psp-sev.h>
>>>    
>>> @@ -768,6 +770,129 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
>>>    	return key;
>>>    }
>>>    
>>> +struct snp_msg_report_resp_hdr {
>>> +	u32 status;
>>> +	u32 report_size;
>>> +	u8 rsvd[24];
>>> +};
>>> +#define SNP_REPORT_INVALID_PARAM 0x16
>>
>> There is one already - SEV_RET_INVALID_PARAM, defined in "Secure
>> Encrypted Virtualization API".
> 
> Ok, indeed I took this from Jeremi without checking for other
> definitions.
> 
>>
>>> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
>>
>> This one needs to be defined in include/uapi/linux/psp-sev.h's sev_ret_code.
> 
> Ah, ok, will move.
> 
>>
>>> +
>>> +struct snp_msg_cert_entry {
>>> +	unsigned char guid[16];
>>> +	u32 offset;
>>> +	u32 length;
>>> +};
>>> +
>>> +static int sev_report_new(struct tsm_report *report, void *data)
>>> +{
>>> +	static const struct snp_msg_cert_entry zero_ent = { 0 };
>>> +	struct snp_msg_cert_entry *cert_table;
>>> +	struct tsm_desc *desc = &report->desc;
>>> +	struct snp_guest_dev *snp_dev = data;
>>> +	struct snp_msg_report_resp_hdr hdr;
>>> +	const int report_size = SZ_4K;
>>> +	const int ext_size = SEV_FW_BLOB_MAX_SIZE;
>>
>> These two are size_t. Or u32. "int" is just weird :)
> 
> Nothing is bigger than a few kb here, but ok.

If it all was just "unsinged", I would not bother commenting :)

> 
>>
>>> +	int ret, size = report_size + ext_size;
>>> +	u32 certs_size, i;
>>
>> @certs_size is size_t (as it is copied to ->auxblob_len in the end), and
>> @size is size_t as well.
>>
>> @i is just "unsigned", can be declared right in the "for" below?
> 
> ok.
> 
>>
>>> +
>>> +	if (desc->inblob_len != 64)
>>
>> 64 is either ext_req.data.user_data or TSM_INBLOB_MAX really.
>> May be even BUILD_BUG_ON(TSM_INBLOB_MAX != sizeof(ext_req.data.user_data)) ?
>>
>>> +		return -EINVAL;
>>> +
>>> +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
>>
>> I did not realize declaring variables in a middle of a scope is allowed
>> now :)
> 
> Yes, it's been allowed in loop declaration for a few kernels now and the
> new __free() helper in cleanup.h will make this model more prominent. My
> sense is that it is still not open season on mid-function declarations,
> but __attribute__((__cleanup__())) usage needs it.
> 
>> Since you are doing this, move zero_ent below. Or, better, use
>> guid_is_null().
> 
> guid_is_null() is not techinically enough given the specification
> mandates that the entire entry is zero.

Well technically it says that guid, offset and length must be zeroes. 
So, (guid_is_null() && !offset && !length) and no yet another static 
declaration of a bunch of zeroes far away. I even wonder if there is a 
helper to check if some memory is all zeroes :) Up to you.


>>> +	if (!buf)
>>> +		return -ENOMEM;
>>> +
>>> +	guard(mutex)(&snp_cmd_mutex);
>>> +
>>> +	/* Check if the VMPCK is not empty */
>>> +	if (is_vmpck_empty(snp_dev)) {
>>> +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
>>> +		return -ENOTTY;
>>> +	}
>>> +
>>> +	cert_table = buf + report_size;
>>> +	struct snp_ext_report_req ext_req = {
>>> +		.data = { .vmpl = desc->privlevel },
>>> +		.certs_address = (__u64)cert_table,
>>> +		.certs_len = ext_size,
>>> +	};
>>> +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
>>> +
>>> +	struct snp_guest_request_ioctl input = {
>>> +		.msg_version = 1,
>>> +		.req_data = (__u64)&ext_req,
>>> +		.resp_data = (__u64)buf,
>>> +		.exitinfo2 = 0xff,
>>
>> Not sure we need this line with 0xff.
>>
>> The GHCB spec says the hypervisor sets it, not the guest. And I could
>> not figure out why exactly snp_guest_ioctl() does "input.exitinfo2 =
>> 0xff", my best guest it is to catch GHCB not being called before copying
>> memory to user.
> 
> It does mostly seem that way, but given this is plumbed deep into
> handle_guest_request() I figure might as well keep common semantics.
> 
>>> +	};
>>> +	struct snp_req_resp io = {
>>> +		.req_data = KERNEL_SOCKPTR(&ext_req),
>>> +		.resp_data = KERNEL_SOCKPTR(buf),
>>> +	};
>>> +
>>> +	ret = get_ext_report(snp_dev, &input, &io);
>>> +
>>
>> Unnecessary empty line.
> 
> ok.
> 
>>
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	memcpy(&hdr, buf, sizeof(hdr));
>>> +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
>>> +		return -EINVAL;
>>> +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
>>> +		return -EINVAL;
>>> +	if (hdr.status)
>>> +		return -ENXIO;
>>> +	if ((hdr.report_size + sizeof(hdr)) > report_size)
>>> +		return -ENOMEM;
>>> +
>>> +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
>>> +	if (!rbuf)
>>> +		return -ENOMEM;
>>> +
>>> +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
>>> +	report->outblob = no_free_ptr(rbuf);
>>> +	report->outblob_len = hdr.report_size;
>>> +
>>> +	certs_size = 0;
>>> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
>>> +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
>>> +			break;
>>> +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
>>> +	}
>>> +
>>> +	/* No certs to report */
>>> +	if (!certs_size)
>>
>> Nit: WARN_ON_ONCE(i) here?
> 
> Seems harsh for what could only be a firmware bug, panic_on_warn users
> would not appreciate crashing the kernel over something recoverable like
> this.

This would a HV bug as certificates come from the KVM. And it is 
(slightly) more likely that the HV is trying to trigger buffer overrun 
in the guest.

>>
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * cert_table reports more data than fits in ext_size the
>>> +	 * userspace cert_table walker can decide what happens next,
>>> +	 * truncate the output
>>> +	 */
>>> +	if (certs_size > ext_size)
>>> +		certs_size = ext_size;
>>
>> This sounds more like the HV provided a broken table with offset(s)
>> ouside of the certs buffer. The HV is expected instead return
>> SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the
>> guest to retry.
> 
> The existence of SEV_FW_BLOB_MAX_SIZE suggests the driver is not
> prepared to retry. Retry support would be a follow-on new capability.

My point is that you should not get into the situation when this 
calculated certs_size is greater than ext_size. If this is the case 
because someone sent too many certificaties via /dev/sev or kvmfd on the 
host, the GHCB call won't return any certs and will ask for a retry instead.


>>> +
>>> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
>>> +	if (!cbuf)
>>> +		return -ENOMEM;
>>
>> In a such (unlikely) event the function returns an error but does not
>> free report->outblob which is going to leak if consequent call succeded.
>> This new no_free_ptr business is confusing at times :(
> 
> If this fails it results in the attribute read failing and
> read_generation does not advance. The next read attempt will free the
> partially completed report and retry,

Ah ok. In general, it just feels like every use of no_free_ptr() defeats 
the whole purpose of __free(xxx).

> or the driver gets unloaded and
> the partially completed report is freed at that time.
> 
>>
>>
>>> +
>>> +	memcpy(cbuf, cert_table, certs_size);
>>> +	report->auxblob = no_free_ptr(cbuf);
>>> +	report->auxblob_len = certs_size;
>>
>>
>> Aaaand, it works, so:
>>
>> Tested-by: Alexey Kardashevskiy <aik@amd.com>
> 
> Thanks!
> 
> Did you happen to test @auxblob population? I was not able to test that
> path on the hardware I tried.

Yup. I have a disgusting python script which feeds some dummy certs to 
/dev/sev on the host and checked they travel all the way to this 
configfs nodes.


#! /usr/bin/env python3

#define _IOC_SIZEBITS   13
#define _IOC_DIRBITS    3
#define _IOC_NONE       1U
#define _IOC_READ       2U
#define _IOC_WRITE      4U
#define _IOC(dir,type,nr,size) \
#        (((dir)  << _IOC_DIRSHIFT=30) | \
#         ((type) << _IOC_TYPESHIFT=8) | \
#         ((nr)   << _IOC_NRSHIFT=0) | \
#         ((size) << _IOC_SIZESHIFT=16))
#define _IOWR(type,nr,size) 
_IOC(_IOC_READ|_IOC_WRITE,(type),(nr),(_IOC_TYPECHECK(size)))

import fcntl, array, sys, binascii, pprint, re, uuid, subprocess, os, 
struct, uuid

# This is:  cat ~/s/sev/sev-guest | ssh $1 python3 -
if len(sys.argv) > 1 and '-' not in sys.argv:
	remote_host = sys.argv[1]
	print("*** Running remotely on {}".format(remote_host))
	f = open(os.path.realpath(__file__), 'r')
	ssh = subprocess.Popen(["ssh", remote_host, "python3", "-"], stdin = f)
	ssh.communicate()
	sys.exit(0)


_IOC_READ = 2
_IOC_WRITE = 4

def _IOC(d, t, n, s): return (d << (16 + 13)) | (t << 8) | n | (s << 16)
def _IOWR(t, n, s): return _IOC(_IOC_READ | _IOC_WRITE, t, n, s)

SEV_IOC_TYPE = ord('S')
sev_issue_cmd_size = 16
SEV_ISSUE_CMD = _IOWR(SEV_IOC_TYPE, 0x0, sev_issue_cmd_size)

SNP_SET_EXT_CONFIG = 10

def sev_issue_cmd(fd, cmd, data):
	data_ptr = data.buffer_info()[0]
	arg = struct.pack("=LQL", cmd, data_ptr, 0)
	try:
		arg = fcntl.ioctl(fd, SEV_ISSUE_CMD, arg, True)
	except OSError as x:
		return x.errno, 0
	_, _, err = struct.unpack("=LQL", arg)
	return 0, err

# struct cert_table {
#	struct {
#		unsigned char guid[16];
#		uint32 offset;
#		uint32 length;
#	} cert_table_entry[];
# };
def cert_table_entry(cert_table):
	ret = array.array('B')
	hdr = array.array('B')
	offset = (16 + 4 + 4) * (len(cert_table) + 1)
	i = 0
	for i, c in enumerate(cert_table):
		cert = array.array('B', [ord('0') + i] * 32)
		ret += cert
		hdr += array.array('B', c.bytes)
		hdr += array.array('B', struct.pack("=LL", offset, len(cert)))
		offset += len(cert)

	return hdr + array.array('B', [0] * 24) + ret

myuuids = [uuid.UUID("f50ec0b7-f960-400d-91f0-c42a6d44e3d0"),
		uuid.UUID("9f3d7b34-6c0d-11ee-bcd4-f8e4e3857730"),
		uuid.UUID("aabbccdd-eeff-0011-2233-4567890abcde")]
cert_table = cert_table_entry(myuuids)
cert_table += array.array('B', [0] * (4096 - len(cert_table)))

# sev_user_data_ext_snp_config
ext_config = array.array('B', struct.pack("=QQL", 0, 
cert_table.buffer_info()[0], cert_table.buffer_info()[1]))

sev = open("/dev/sev", "w")
ret, err = sev_issue_cmd(sev, SNP_SET_EXT_CONFIG, ext_config)
print("ret = {} err = {}".format(ret, err))

-- 
Alexey


