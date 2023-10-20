Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2171371
	for <linux-coco@lists.linux.dev>; Fri, 20 Oct 2023 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AuzgoKuc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrdvD6d7bpZ66WGQBZgc+X/sh1RY7f+SAFVGx6RgZPfSEjOV/BLT4mBkEFd+MheH+bHnQV4zKQQsC0q49D/OE2exhwVf9fIrY0hO/OMatAxlaFHtS8Lov8oK+qE6hge/xp/f/qNWWtrePN7G1r6mgDxf47jASUrS+UdhcmuMRpNrOwknOegwZajwq7I2b5WuoxFeMAG2VYgTwbzn7fc6+enP5DRe9QQftJtoyDzbNkaXmZxGNcQ+emPTMPnpoA7liE46cXy1Offqdoz0I2HMpyiD4M8rlGXLzSCyN1WPoIRdMQa902jGKiBv5xDLE3hl61aMe3KGQVG9VImf7l5MGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBahinID51O9RW5jX1ybvaSWv8+naUPjI654hhVMD44=;
 b=f+AwWaS8rTWrEkkdx16JkSU89xoReKqD8Na2My/iypjkgCwM0F37k0C8Ihv3X+rehjB2kI2OaYEHMVhEiMzeJrONVefLgcACsCcNnWoaUBZ4911t418lzZUZ82+l96v5768OHo93K6YI3EmcZGFVJVg17zQXKOM/e3MNQIv+w812whob7GhFhjRuIkUfj38lNbGDvuP2efWXSxKi14TECTU/7lwp3OzILWZJ1FgekUVKPec+kzaeH1karHVqrbQ0eamXeGPoC9BJFs3pNz+12DjDF1huAJG0cAaPHrzhiqfFlCMY92ruhSVIEnuAcgu8qo74Aa0ztcxbN15kzZMgoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBahinID51O9RW5jX1ybvaSWv8+naUPjI654hhVMD44=;
 b=AuzgoKuc/KUt+sgpMS/pVcAMwLvHdr1ADo6+e40xOI4J7/a0/7i0iqwwElme3/AZASV1yW2hBsccBb2JuB1peQcrZIJtCNC9U7cM1TX+smU1w5PmiIsKAd/KgdzlpJ3CgVyhBvPxh8B5iSwoIkfZhjibU8xBezL2HdKYJb4Wwo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Fri, 20 Oct
 2023 03:25:45 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Fri, 20 Oct 2023
 03:25:45 +0000
Message-ID: <2ff3d15f-cdd3-4014-bf6c-164953d356de@amd.com>
Date: Fri, 20 Oct 2023 14:25:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Glaze <dionnaglaze@google.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, dave.hansen@linux.intel.com, x86@kernel.org
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776461997.1705513.12624327821043619904.stgit@dwillia2-xfh.jf.intel.com>
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <169776461997.1705513.12624327821043619904.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b565884-f758-453f-51c9-08dbd11c3f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9PknTHf77Bid7TVKMOD1556xHJU6RJXMeWWgsFTi1iS/jiYef+XwfxYw0c7ghGthIhh6rr5/ry+CuoOcb31ChzZ2iAiFT6vMBguSQElkQG7kCA+oGyrqdEDyPVf/KSJ/41hb8qVAJ26Lu6+UzPUhT8uKs4xXBB0uAqgTxI8gTTKE4iJ3+wSdwrmaONdQfLIS7MOcHlzzl+7BRznBQljVQC2afiaLMc3pCEeJkFoWmJHlcjuVtwqaLIcCebdk7Tsyb7sr0cgOQZIDWPKzFFfvCJ/5lNDrB6Qg2NY5Q0Q3uyXfcxDMOEFsqA8K91JBKY/T1yghZYvyR8VmAWZCE8CgrZCXm2ZWCZRKfNHpHmykOCw1Aom7Wc26v5/Qvx8whT9mG6rale6X7WHlA+v31tLEbS/CcyPxVepQFeknsfiMf3vrd50YEOUA6M+bTwDdKkyC5g2ldFiLHJSGcFLn2Nzch+Oy5/Igqzh5B1e6y6UcV589gCn3z8nK3vQpRKAx92nH3zPeiR9oOUoNAipcVw6zPzX72tZuelWV9DWkoUKK9OlHkYpKxwmXlXY15bNTAsCzHmgDFvXZXL65F1vq4zaY9+hztfWaf6YiT19nm6RkgUIvrczHwvCElLWYf/FHzssJZgSdoJfPkhrt6dXIOQv4KA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(31696002)(36756003)(26005)(41300700001)(2616005)(53546011)(478600001)(2906002)(6506007)(966005)(38100700002)(6486002)(6666004)(8676002)(316002)(5660300002)(8936002)(66946007)(66476007)(6512007)(66556008)(83380400001)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlNUWR1ZExORGU4bXZyUkIvRU9EUUI0ZVRHWGNNOERoS25Ud2FRMGx5RmNZ?=
 =?utf-8?B?VGIyODhVbEovc2UrcUtOd3ZjbC9WSmp4UDlQdSthWkxsa0IwWlVwNnV2Y1N2?=
 =?utf-8?B?ZXFRSUkvZlNKYTlDOGdVWjBnVVVZaHV0TC9mSXJmaTRIZFUzQ3ZNU0p5RE5r?=
 =?utf-8?B?eFdwbE82aWMzQzFHN25JY09zNjNFMW9kNmdWTDZ4a2Y1NlEzR0VPWFNxQW5o?=
 =?utf-8?B?LzA0U3lwM0FOaGlNSTI4Vi9CWHhJS3hkT0Z3MjZuTVRlNEZLaGxWbzNBQ01Z?=
 =?utf-8?B?V0FUZmpDRUJPV2hla1hHb29iVG4xelZYNGVxSGFIa05VdXp4a01TQWJLWTMv?=
 =?utf-8?B?cjFEODUzTlBqR3ZzMFcwczdaTjRVTXdFcDI4VDNmZjF5ZXNydDR2Z092eG13?=
 =?utf-8?B?K2tNWk1pL0h1U2NLeFpvbzMveFZidkh6ekp1RXI0RkdjbFg0ZmZuemF5Mk9B?=
 =?utf-8?B?a2xTRHordTE2ckh1eGpsNTdvb3RKQWdRSGpueGhIM28wdWhzRkNCaGFRWDlH?=
 =?utf-8?B?QzJ1dDMvZHpXV3ZrQXRXT0RxZ2pBTVNXTkF3blgxaW41L0IwSko1bjlxZXE5?=
 =?utf-8?B?dzVLMWJlNDl2ZXcwOG51SE5kRTU3cnowT25XZFREd3E4Q2djTU4xVmJjd0Yw?=
 =?utf-8?B?U3VQS2M2MHpBYUt4dUhBRWg2RHREVEtRcmJVNXVZWXJtTTk2UW9ob2Z3YzFL?=
 =?utf-8?B?ck45b3NxNGpLY09kQkFRRHpxVnpabUlDRitqWmd3and1VTdLSmlCeHVLUnBq?=
 =?utf-8?B?V0RvVk5qYUVTRUNhdGVwc2NlMWxGaWJpdmNWaURRSzVXNHlialFjcGNGMmFs?=
 =?utf-8?B?V3NhNTFBZ1ZHR1RzRE9mY25lYUFsSWlXSzIxSWFtb3IyTmcrOFpPTktVZWtk?=
 =?utf-8?B?V1pXRy9uRXA1U1llaEJ3bENrRngrYjRRa3ZIbTJLSUFiTzI5bnNzVVZYUUZC?=
 =?utf-8?B?SjEwNmxremNQbU15S3FFZ2NiWjF4OVlocXdRZy9BakJvNWVTTW0rTG9OdVZQ?=
 =?utf-8?B?OElNMys1VU9sMmRHdlpDKzZJU29INUxXWk90bXVodkRZYWxhei9rY0I0S2l2?=
 =?utf-8?B?NXNUNUR5VVhPQjRmUFRFaXduMjRHZkpWRUZDd0tBbkFvZ2kwZ0lQVlB5R0Qy?=
 =?utf-8?B?SnZsNEoxeWV2aWljeU5NS0lPSldZUHBzeTlCNSsvQ0ErUnh0ampjK3Y1SUFF?=
 =?utf-8?B?WkJFWnpIQlZxSExjamhYR0dWbDU4MlpRYWtXOTBiQ1RTeWtLMHFlaG4vVzhw?=
 =?utf-8?B?K0Q1VGh4YUJIRFhIODFKenVOL0l5Z1BQZ0VFK3FWWkJVdTBPZW1MVEVWbzYz?=
 =?utf-8?B?VjQ0blBnOGxGdFZDYTRrKzNiR1dWM1JBNzR4ZTYvVEtUZzFRbXFuRGMyVmZU?=
 =?utf-8?B?SkR5SzBMeHRkMXlaQTZWc0Fqa1dHOWt4VDF0L24vYWRnWXl4MjZkRWlnZmdo?=
 =?utf-8?B?VUJpL1JJWmdjalhzWHl0bjRnbS9ud2tmQjI5RTRNTHV3N2dXUThvSlhCd0NY?=
 =?utf-8?B?dWgzTHNRQlNxZmpzTkhFMG13UGRXaDFNUGtyOXZobzcwOE10cVFJdHJDNnpj?=
 =?utf-8?B?c1dRdUFaREwveEhiTmErL1RnWG9mcWJtT1h4WndsTDdyb0hKelVZeW9hMkFj?=
 =?utf-8?B?SFZwVE12aEhiV05mTGJzRWtaNjREOER0Z1d2VXVSM1dTZndpclBaaFVidTla?=
 =?utf-8?B?aHV0ZTIxczNGb1JlZGR6MHJpTkFSYzVuNmU5Wmd1U3FjQ3JhZmtBYUR4YlM1?=
 =?utf-8?B?cEdQZnM0bXd2dDUxZzJuUDRrTENZNUtQeDdHRjMrZXdqbDMvNkp2aVd3QTl3?=
 =?utf-8?B?aHhHMSt1UWpYa3oxbTVmTThXK0J5N0VqNHlRNjBSTXJUWllVZmJ0TEdTdWFD?=
 =?utf-8?B?d1VPOTNuTWN6bzFWaW1LZkhLUjc0YkdPbGxoN2NhbG91WHhseEppTkp4K1Ry?=
 =?utf-8?B?VXhEOWhNdVlIN3Bja0lXK0pQM3RYRlZCZWhhbmxpaSszaGp6YkdRTjFnQVVT?=
 =?utf-8?B?T3NoN3VlTTA2M21yTDZnVmMzaC9DK2Z3UTAwaFhtak9qVmdwQm5sMVlaM2F5?=
 =?utf-8?B?ek9ZaWlzTFNKWG1lMlMyT043S1Z6TDByaVEremZ1cG15aXNnVE5HM2lMbURm?=
 =?utf-8?Q?H/OlTZRx9ljeJUG5zCLxB7YwZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b565884-f758-453f-51c9-08dbd11c3f05
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 03:25:45.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Nv0Zzr9RxATzYmARjWWje1CNztaA7cHhiFmG45Yd/Fa0IS1dpKxJZ/ESf2UjqBICPvq+BewCVJINn8+Df5ktg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252

On 20/10/23 12:17, Dan Williams wrote:
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
> Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>
> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Tested-by: Alexey Kardashevskiy <aik@amd.com>

Still works :)

Reviewed-by: Alexey Kardashevskiy <aik@amd.com>

Thanks,

> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>   drivers/virt/coco/sev-guest/Kconfig     |    1
>   drivers/virt/coco/sev-guest/sev-guest.c |  135 +++++++++++++++++++++++++++++++
>   include/uapi/linux/psp-sev.h            |    1
>   include/uapi/linux/sev-guest.h          |    4 +
>   4 files changed, 140 insertions(+), 1 deletion(-)
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
> index e5f8f115f4af..bc564adcf499 100644
> --- a/drivers/virt/coco/sev-guest/sev-guest.c
> +++ b/drivers/virt/coco/sev-guest/sev-guest.c
> @@ -16,10 +16,13 @@
>   #include <linux/miscdevice.h>
>   #include <linux/set_memory.h>
>   #include <linux/fs.h>
> +#include <linux/tsm.h>
>   #include <crypto/aead.h>
>   #include <linux/scatterlist.h>
>   #include <linux/psp-sev.h>
>   #include <linux/sockptr.h>
> +#include <linux/cleanup.h>
> +#include <linux/uuid.h>
>   #include <uapi/linux/sev-guest.h>
>   #include <uapi/linux/psp-sev.h>
>   
> @@ -768,6 +771,130 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
>   	return key;
>   }
>   
> +struct snp_msg_report_resp_hdr {
> +	u32 status;
> +	u32 report_size;
> +	u8 rsvd[24];
> +};
> +
> +struct snp_msg_cert_entry {
> +	guid_t guid;
> +	u32 offset;
> +	u32 length;
> +};
> +
> +static int sev_report_new(struct tsm_report *report, void *data)
> +{
> +	struct snp_msg_cert_entry *cert_table;
> +	struct tsm_desc *desc = &report->desc;
> +	struct snp_guest_dev *snp_dev = data;
> +	struct snp_msg_report_resp_hdr hdr;
> +	const u32 report_size = SZ_4K;
> +	const u32 ext_size = SEV_FW_BLOB_MAX_SIZE;
> +	u32 certs_size, i, size = report_size + ext_size;
> +	int ret;
> +
> +	if (desc->inblob_len != SNP_REPORT_USER_DATA_SIZE)
> +		return -EINVAL;
> +
> +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
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
> +	};
> +	struct snp_req_resp io = {
> +		.req_data = KERNEL_SOCKPTR(&ext_req),
> +		.resp_data = KERNEL_SOCKPTR(buf),
> +	};
> +
> +	ret = get_ext_report(snp_dev, &input, &io);
> +	if (ret)
> +		return ret;
> +
> +	memcpy(&hdr, buf, sizeof(hdr));
> +	if (hdr.status == SEV_RET_INVALID_PARAM)
> +		return -EINVAL;
> +	if (hdr.status == SEV_RET_INVALID_KEY)
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
> +		struct snp_msg_cert_entry *ent = &cert_table[i];
> +
> +		if (guid_is_null(&ent->guid) && !ent->offset && !ent->length)
> +			break;
> +		certs_size = max(certs_size, ent->offset + ent->length);
> +	}
> +
> +	/* Suspicious that the response populated entries without populating size */
> +	if (!certs_size && i)
> +		dev_warn_ratelimited(snp_dev->dev, "certificate slots conveyed without size\n");
> +
> +	/* No certs to report */
> +	if (!certs_size)
> +		return 0;
> +
> +	/* Suspicious that the certificate blob size contract was violated
> +	 */
> +	if (certs_size > ext_size) {
> +		dev_warn_ratelimited(snp_dev->dev, "certificate data truncated\n");
> +		certs_size = ext_size;
> +	}
> +
> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> +	if (!cbuf)
> +		return -ENOMEM;
> +
> +	memcpy(cbuf, cert_table, certs_size);
> +	report->auxblob = no_free_ptr(cbuf);
> +	report->auxblob_len = certs_size;
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
> @@ -841,6 +968,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
>   	snp_dev->input.resp_gpa = __pa(snp_dev->response);
>   	snp_dev->input.data_gpa = __pa(snp_dev->certs_data);
>   
> +	ret = tsm_register(&sev_tsm_ops, snp_dev, &tsm_report_extra_type);
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
> diff --git a/include/uapi/linux/psp-sev.h b/include/uapi/linux/psp-sev.h
> index 1c9da485318f..b44ba7dcdefc 100644
> --- a/include/uapi/linux/psp-sev.h
> +++ b/include/uapi/linux/psp-sev.h
> @@ -68,6 +68,7 @@ typedef enum {
>   	SEV_RET_INVALID_PARAM,
>   	SEV_RET_RESOURCE_LIMIT,
>   	SEV_RET_SECURE_DATA_INVALID,
> +	SEV_RET_INVALID_KEY = 0x27,
>   	SEV_RET_MAX,
>   } sev_ret_code;
>   
> diff --git a/include/uapi/linux/sev-guest.h b/include/uapi/linux/sev-guest.h
> index 2aa39112cf8d..154a87a1eca9 100644
> --- a/include/uapi/linux/sev-guest.h
> +++ b/include/uapi/linux/sev-guest.h
> @@ -14,9 +14,11 @@
>   
>   #include <linux/types.h>
>   
> +#define SNP_REPORT_USER_DATA_SIZE 64
> +
>   struct snp_report_req {
>   	/* user data that should be included in the report */
> -	__u8 user_data[64];
> +	__u8 user_data[SNP_REPORT_USER_DATA_SIZE];
>   
>   	/* The vmpl level to be included in the report */
>   	__u32 vmpl;
> 

-- 
Alexey

