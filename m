Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6123775
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YAQB68+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpbFw/Cq3gdB5sqP1ePu0LMCvNjNF0qqT8aQP7mRKxoAfbYoOyfngwR+uhoW2upL3qxuU+b996gNT5jY1YWSNdRRGKlQzyYzFOKUcKhojjEGeUEWSVgcdOk18j2/wHgi8KXMmoI7Vnb3HftJVKWYoUYB7OtwySPqNjsm/gv615Q76KezLatVx5tQBadD0bQhzAc4a4+c+s/xL+1Ui1qwX6tmIRnSlgX8R2pFkxV4qxryBZMpCcSgENTFG2NfKjvgJ//UElSrP8sVLHK+GbWQnxYxnkU+55RkFX5Gy4db7M2/Jqe1FK5NPz7vLLWu4ZnimEHJsaVVnJ5nHphGlsfOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSfVXtdiXFC4Y8IW928cz98QeKxqsSnW+Eph91jZSYk=;
 b=nUfb6B2PDcfGSJC3vH5ank5tfv+YC/9DrtDjUDfa6ExJ3MSWXRqPHp2EACaZyrlkFOePV5l9At5qdBlMW/ohcghXZvvqaR1yKqZgWCVkDDgygeGrMKgoSJ3yuAPxfyvto2jamGEng98Na1oDsJ07ykCnTxcDxRxWC23B5vjBlEOS6es51/pzYV7+E8EYgSuJHOyRO+qysK1QDuCfkrwbbCpik6HkpsEHapE7e7m6FIlLoonsOJ+6E9Y652U211dHff4gsPbvyYA8X02CuuyR8W3LJeb33uvA50WkO4vaqL3pBUXXwzVr8QARWaHEUnrYn1Px1+7rl8URm29I6vQsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSfVXtdiXFC4Y8IW928cz98QeKxqsSnW+Eph91jZSYk=;
 b=YAQB68+LLlEt6EYmgC92ryMoelzDD0sL6BM18kpTMG6BzFTM+HhzkecU2RnEY/IZ7rFIFMCJxdnTs7Qg//tmcy1UUbp84+FWVEZL1dmhY8fT6SxSR362J945+dK0qkOovE5TF962sFl+n2bDapBN+5IUJE+TG7Cp5+AjnyzNA0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 11:36:43 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 11:36:43 +0000
Message-ID: <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
Date: Mon, 16 Oct 2023 22:36:28 +1100
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
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P300CA0009.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::8) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f46b8b5-9b77-4182-93a7-08dbce3c2bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vIpWPDu2oaDGwO5FScmhZhwdLaon8VqNU+AqNbwiNjYHkOCLT/umd4tGRbhGgwDcAgTZDiMNp8Y9FWkJL4EiUaH0Kdj0ikJvVLwWTBCPk30ulcr59w0ZGwftX6yubDs83Y3G2BQbsIK4fiSBAaPdjWV12vh1Zw0FVg/URjgN+q/Y4kD1bTnBVc+nERo37mBQ1c5Yy37an/AKniunCaHMCm4+IOOjAwhTwA5QKLLqI2l1aCpGujqo2PXY2myTwfaJsXNHwgHi5SiYqYWXl6p7SN/1gQzMn6HxeTINGXH/R8KlQRGHoYwWrsOd5x1plFZ9Js9ecWeqzabzYVqs34i7vIQOPQcTervpiFM5MPgEYmPWE4tFqWm6k7K740rKIL2iUzppmodu30YJIz52rAs/V76bR6NHDy64AqPwnuUc5K6715un08Nkm6xfh5hqIEf20Zx8le30oCtlp4HNPGm/bysPdKVNBnlTudlIhLZPa99Dep2QCVZELGzTltRz5jwPY4ajhCRq721Fvdh9o19CEDO7QJMwxUVEhA7xMjpn07FdUIwLHSG3OFCdDKF+z+dxhSvrhleOCUZccFb5o/q7mXOaG5ADXFEFf28Q8NuCcEJZ2CFgbEzU07ytAJnz5JaEFYwyIIksNxnB4VX63DAoaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(41300700001)(316002)(54906003)(66946007)(66556008)(66476007)(6486002)(966005)(8676002)(4326008)(8936002)(31686004)(5660300002)(6506007)(53546011)(31696002)(6666004)(38100700002)(6512007)(2616005)(83380400001)(26005)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L25WcDZ6WDJVdTNzZVF0eVM1WTJpbzU1TjEwNytqa1VvQythV2ptdjNNSXlK?=
 =?utf-8?B?d0ovVEkyOGo4U1IxUVFlbDIwMDhXR1hsRXRjTnlnT1IrT0lSMjZacE9pZGN6?=
 =?utf-8?B?WGVuMkxNdHlWTXVZTDgwODJjTkJ6SVMvNjJ4ZnYvZGRTWlhlSEtZd0gyaHM3?=
 =?utf-8?B?cVNZNkkzVngreUNzcURPa2dQVndXYVYxZk9SVEViR2hxcEZIY1B2TmRZTkhI?=
 =?utf-8?B?dzVmemZ6djE5WjN1WHY2b2JMY0x6NmtjV0RTeXcvc0NJK1pPUVNlVm9hQWlo?=
 =?utf-8?B?cHJDWk14L2RVV0pJNGlPVlZ4MXR1dnpabkVRVUwyR21PODNhUUdiOVcvZHVt?=
 =?utf-8?B?Ty9yTWpDc0MzQUhXU3Z2QUJ2eVlrYWp6VDluaDY1R2NsL25BWDR6MUZaU0Jt?=
 =?utf-8?B?OGs2WEZSeUF6cTRTdkRtckdvcnkweFFBMExhU3BSRmJQU05zWEI3UkdyOUJS?=
 =?utf-8?B?K2ZudDlST1o0b1gzMTJFY2Y2ZGV2THBYNXMwZHhSL3BnQktDUDBNaWZsRDIv?=
 =?utf-8?B?R1B6ZzZwdEM3cmtndnMwT2tYQURrQVFuNDhuTElBZW9rL3hNK0pZTGdIRmM1?=
 =?utf-8?B?NCtERXRMSlRuZ1V0RDZaamVNTExETWNORytLaGFWY1hxZjZydXRiQjlUbW9Z?=
 =?utf-8?B?eDFPT3ZMYmxEeHlHZ0JpcWxCaHJMaVpLWXc4eUlUVVBuL2VyVDBFRGlzWFpp?=
 =?utf-8?B?eFlEL0J1Z1I1M1hBdXlJRStMZUs4bkVQT1dwNnBUVm1UZHMxY0E5Tzd6REIx?=
 =?utf-8?B?azBaNWZuSk11dmFOQlpHdHQ3c21hS3Y5S2Y2L3VFNEhDVzhocnhkZVhGUFYy?=
 =?utf-8?B?eFRJZnRLSW9xQW9DbzJzZ210U1JqUWIwWHAwUkpWUkttNWhaTElLckdJWWxN?=
 =?utf-8?B?Z28xdVBUdE0vUDBIRVpFNVJGb1U3VytXN0FjbDI3S081ejZOKzFrRmMzdS9P?=
 =?utf-8?B?aXhCUUZSWWliamwzeGhmaThvUGRLd2dwRWs1Zis1ZGt3NzJ6RVk0MWRGQ21C?=
 =?utf-8?B?NGorOWpGK2sreGRBWTlrSysxK2ZKV1lseHBFdWRSTC9wN0JhalNNWkVBRmtS?=
 =?utf-8?B?a3FjbFNqamx6TTEvTmw5c2NKUk85SUhPalNUbDd5ZmpncFpaMXd4d0ptak9K?=
 =?utf-8?B?U0c2cXZpc2plK0xMSlJJM0dQaTVneElHNGdPOFY4L1ZyK2hGdGR4aS9WTEVp?=
 =?utf-8?B?bjhwV1JpUkF5U0FtTzlYS2lSc1FtaExtL3oxZHF3b0E1MzlISWg3NEQ5YXVm?=
 =?utf-8?B?OTRJK09XSTFFckZLNzErT2dsN0JSaGtEblljZ2xIdk9ncXJkUy8xaU1jditW?=
 =?utf-8?B?TitDWTVLSDZOT0dzSXM0Si9zaHlKRlV6WG5oZFViejRRdFR4aFVnK1B4c3Qv?=
 =?utf-8?B?amxYOThIZVYrSEo5ZmNIZW1vUU9CQ3ZPcWo1dTkzRzZzOWdzcFdZK2NxOGFO?=
 =?utf-8?B?WnhDMUJLVzIrN09BaFI3UmM2d2VWSGRLVDJJVFJZM0d3NzZBbDhlR0NQWjlC?=
 =?utf-8?B?V21uUTc5bUk3ZnlKWmZZU0JMQ3hCVzNmOTk0MHJVS3daWnp2MFVBbzJqYUFQ?=
 =?utf-8?B?OHFVR3o5YkNVR1VETjBaS3VmWVJzd1MwZHo4VmIyMHV3VEFLNGJxVUhoN0Ji?=
 =?utf-8?B?OTFvOEYxMnE0SFg2Q1hpMmpaZWRmR05vRXl3OFJkMTFFaUt6ajNEQU55Mzdv?=
 =?utf-8?B?Sks0bUx6WWt3T0RrSFNwa3B4Wk1najlWdkZoTG1NRTR1OXZlN2VPQnNBVkw0?=
 =?utf-8?B?dlkyODNCblhzTnlkTnBSN0dIcTB6U2NjZ0dPSjNjcnBHVk9rMVErYjJxTDZq?=
 =?utf-8?B?ZDcybTZSazFCR25VM1F5OFZJY1BoODQwTnRObWdlMkNmWnJBQkJyZ0NhQkR2?=
 =?utf-8?B?TFdzVkRkZ01EZ1dlcTJQb29wUWRWMDdjM3k2ZndBcm5RQitMMkxNeGNNUlZv?=
 =?utf-8?B?MFRnL04rbnd6eVA3bm8yTTZDT2V0SzNtbDRoMG8zcW80d0tVb3picjNHWU5j?=
 =?utf-8?B?aVJ2SXh0MkJRWWRyMmd2bWh1ZjlxMTYzZndUbkk0eVNzc1hGRFhBWWlVdWlw?=
 =?utf-8?B?dXJmYU10WDRzazl6RG1Yc0sxMldPZ3AwV3dFbXBnMGcycTlSckgxbDE4eGNO?=
 =?utf-8?Q?PO4OgDBHw0Pn8BQi/APCjYyqw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f46b8b5-9b77-4182-93a7-08dbce3c2bb0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:36:43.2573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUL0nwwKW9Gw+Ak2XuBRJbOID31UoXPKn0ifzld30nvYQqP4AzAsQwcXJNTYTJMUiFoynyGMQHmZb35TpRYL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

On 13/10/23 13:14, Dan Williams wrote:
> The sevguest driver was a first mover in the confidential computing
> space. As a first mover that afforded some leeway to build the driver
> without concern for common infrastructure.
> 
> Now that sevguest is no longer a singleton [1] the common operation of
> building and transmitting attestation report blobs can / should be made
> common. In this model the so called "TSM-provider" implementations can
> share a common envelope ABI even if the contents of that envelope remain
> vendor-specific. When / if the industry agrees on an attestation record
> format, that definition can also fit in the same ABI. In the meantime
> the kernel's maintenance burden is reduced and collaboration on the
> commons is increased.
> 
> Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> retrieving the report blob via the TSM interface utility,
> assuming no nonce and VMPL==2:
> 
>      report=/sys/kernel/config/tsm/report/report0
>      mkdir $report
>      echo 2 > $report/privlevel
>      dd if=/dev/urandom bs=64 count=1 > $report/inblob

Is not this one a "nonce"?

>      hexdump -C $report/outblob # SNP report
>      hexdump -C $report/auxblob # cert_table
>      rmdir $report
> 
> Given that the platform implementation is free to return empty
> certificate data if none is available it lets configfs-tsm be simplified
> as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> SNP_GET_REPORT alone.
> 
> The old ioctls can be lazily deprecated, the main motivation of this
> effort is to stop the proliferation of new ioctls, and to increase
> cross-vendor collaboration.
> 
> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Dionna Glaze <dionnaglaze@google.com>
> Cc: Brijesh Singh <brijesh.singh@amd.com>
> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>   drivers/virt/coco/sev-guest/Kconfig     |    1
>   drivers/virt/coco/sev-guest/sev-guest.c |  133 +++++++++++++++++++++++++++++++
>   2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/virt/coco/sev-guest/Kconfig b/drivers/virt/coco/sev-guest/Kconfig
> index da2d7ca531f0..1cffc72c41cb 100644
> --- a/drivers/virt/coco/sev-guest/Kconfig
> +++ b/drivers/virt/coco/sev-guest/Kconfig
> @@ -5,6 +5,7 @@ config SEV_GUEST
>   	select CRYPTO
>   	select CRYPTO_AEAD2
>   	select CRYPTO_GCM
> +	select TSM_REPORTS
>   	help
>   	  SEV-SNP firmware provides the guest a mechanism to communicate with
>   	  the PSP without risk from a malicious hypervisor who wishes to read,
> diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
> index e5f8f115f4af..f3ca083127af 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -16,10 +16,12 @@
>   #include <linux/miscdevice.h>
>   #include <linux/set_memory.h>
>   #include <linux/fs.h>
> +#include <linux/tsm.h>
>   #include <crypto/aead.h>
>   #include <linux/scatterlist.h>
>   #include <linux/psp-sev.h>
>   #include <linux/sockptr.h>
> +#include <linux/cleanup.h>
>   #include <uapi/linux/sev-guest.h>
>   #include <uapi/linux/psp-sev.h>
>   
> @@ -768,6 +770,129 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
>   	return key;
>   }
>   
> +struct snp_msg_report_resp_hdr {
> +	u32 status;
> +	u32 report_size;
> +	u8 rsvd[24];
> +};
> +#define SNP_REPORT_INVALID_PARAM 0x16

There is one already - SEV_RET_INVALID_PARAM, defined in "Secure 
Encrypted Virtualization API".

> +#define SNP_REPORT_INVALID_KEY_SEL 0x27

This one needs to be defined in include/uapi/linux/psp-sev.h's sev_ret_code.

> +
> +struct snp_msg_cert_entry {
> +	unsigned char guid[16];
> +	u32 offset;
> +	u32 length;
> +};
> +
> +static int sev_report_new(struct tsm_report *report, void *data)
> +{
> +	static const struct snp_msg_cert_entry zero_ent = { 0 };
> +	struct snp_msg_cert_entry *cert_table;
> +	struct tsm_desc *desc = &report->desc;
> +	struct snp_guest_dev *snp_dev = data;
> +	struct snp_msg_report_resp_hdr hdr;
> +	const int report_size = SZ_4K;
> +	const int ext_size = SEV_FW_BLOB_MAX_SIZE;

These two are size_t. Or u32. "int" is just weird :)

> +	int ret, size = report_size + ext_size;
> +	u32 certs_size, i;

@certs_size is size_t (as it is copied to ->auxblob_len in the end), and 
@size is size_t as well.

@i is just "unsigned", can be declared right in the "for" below?

> +
> +	if (desc->inblob_len != 64)

64 is either ext_req.data.user_data or TSM_INBLOB_MAX really.
May be even BUILD_BUG_ON(TSM_INBLOB_MAX != sizeof(ext_req.data.user_data)) ?

> +		return -EINVAL;
> +
> +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);

I did not realize declaring variables in a middle of a scope is allowed 
now :)
Since you are doing this, move zero_ent below. Or, better, use 
guid_is_null().

> +	if (!buf)
> +		return -ENOMEM;
> +
> +	guard(mutex)(&snp_cmd_mutex);
> +
> +	/* Check if the VMPCK is not empty */
> +	if (is_vmpck_empty(snp_dev)) {
> +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
> +		return -ENOTTY;
> +	}
> +
> +	cert_table = buf + report_size;
> +	struct snp_ext_report_req ext_req = {
> +		.data = { .vmpl = desc->privlevel },
> +		.certs_address = (__u64)cert_table,
> +		.certs_len = ext_size,
> +	};
> +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
> +
> +	struct snp_guest_request_ioctl input = {
> +		.msg_version = 1,
> +		.req_data = (__u64)&ext_req,
> +		.resp_data = (__u64)buf,
> +		.exitinfo2 = 0xff,

Not sure we need this line with 0xff.

The GHCB spec says the hypervisor sets it, not the guest. And I could 
not figure out why exactly snp_guest_ioctl() does "input.exitinfo2 = 
0xff", my best guest it is to catch GHCB not being called before copying 
memory to user.

> +	};
> +	struct snp_req_resp io = {
> +		.req_data = KERNEL_SOCKPTR(&ext_req),
> +		.resp_data = KERNEL_SOCKPTR(buf),
> +	};
> +
> +	ret = get_ext_report(snp_dev, &input, &io);
> +

Unnecessary empty line.

> +	if (ret)
> +		return ret;
> +
> +	memcpy(&hdr, buf, sizeof(hdr));
> +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
> +		return -EINVAL;
> +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
> +		return -EINVAL;
> +	if (hdr.status)
> +		return -ENXIO;
> +	if ((hdr.report_size + sizeof(hdr)) > report_size)
> +		return -ENOMEM;
> +
> +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
> +	if (!rbuf)
> +		return -ENOMEM;
> +
> +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> +	report->outblob = no_free_ptr(rbuf);
> +	report->outblob_len = hdr.report_size;
> +
> +	certs_size = 0;
> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
> +			break;
> +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
> +	}
> +
> +	/* No certs to report */
> +	if (!certs_size)

Nit: WARN_ON_ONCE(i) here?

> +		return 0;
> +
> +	/*
> +	 * cert_table reports more data than fits in ext_size the
> +	 * userspace cert_table walker can decide what happens next,
> +	 * truncate the output
> +	 */
> +	if (certs_size > ext_size)
> +		certs_size = ext_size;

This sounds more like the HV provided a broken table with offset(s) 
ouside of the certs buffer. The HV is expected instead return 
SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the 
guest to retry.

> +
> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> +	if (!cbuf)
> +		return -ENOMEM;

In a such (unlikely) event the function returns an error but does not 
free report->outblob which is going to leak if consequent call succeded. 
This new no_free_ptr business is confusing at times :(


> +
> +	memcpy(cbuf, cert_table, certs_size);
> +	report->auxblob = no_free_ptr(cbuf);
> +	report->auxblob_len = certs_size;


Aaaand, it works, so:

Tested-by: Alexey Kardashevskiy <aik@amd.com>

Thanks,

> +
> +	return 0;
> +}
> +
> +static const struct tsm_ops sev_tsm_ops = {
> +	.name = KBUILD_MODNAME,
> +	.report_new = sev_report_new,
> +};
> +
> +static void unregister_sev_tsm(void *data)
> +{
> +	tsm_unregister(&sev_tsm_ops);
> +}
> +
>   static int __init sev_guest_probe(struct platform_device *pdev)
>   {
>   	struct snp_secrets_page_layout *layout;
> @@ -841,6 +966,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>   	snp_dev->input.resp_gpa = __pa(snp_dev->response);
>   	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
>   
> +	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_ext_type);
> +	if (ret)
> +		goto e_free_cert_data;
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, unregister_sev_tsm, NULL);
> +	if (ret)
> +		goto e_free_cert_data;
> +
>   	ret =  misc_register(misc);
>   	if (ret)
>   		goto e_free_cert_data;
> 

-- 
Alexey

