Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F853A29A
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 19:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gLULMFKM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpy2cAaekElTr4/ibMNNC6C9yKifvdJuaiBPs4wu8A8oIU9UScLpmllUIHCXID8lQJDtcCy0n4mUNDdYcfLdol9+PDzNeaXzFr0Ck6eaBscbChOuKJwzNiVUm0Hxgg+E/jeg+lvlmcSbJgD7TJbUePoM5EBMOs33MdZB/uW+vNFYhveJmuaFbqg60HNQw9n1kQw0gkt6mo5WteQnrx47/iaGZooaxK2+9SKM1CJtdrpfXCeXmNNuy9iJyK/yC5TvjyrmxBYQEaoCvm+bslNa6u/0PvXQpDNTy/tXmzDJqSSMG2YLrdmDrGEcT5WN9BwI5Gq8VknSuQX1sJjN/vwI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Smzt+lWxXVgeFfz5VUImgT8y85p510EOSfY3ikxK/s=;
 b=YoIw6PDFZNwfKlnhC+QQ+0Cd7yr6AcmJHaiYXjzOxZTHzdrW8HH0GOEG/0WC8IziaXX+MHlj3H0j4CMhu5si/Vk2tBYM2GgoVvYnPrWakLGcTmXk1GKp6S+eU3LiB54rL4Ru8CfR+p3LkeASyVz4wCOd20MtAe18Te1/ijGoSgcVq3b+RaNafV5C0yRb6EZheHNeUfM9wIbbhL1yScu+rVW2gleU2/pzbir7WA2t8MSijcclF1RLZgXTjIYs0ljPfLQJ+6qoTEytMOXjaI5U52vB5fbnd87KPJ2K7k0/Mhq7KkdHDMkv637TDRZmMKlkBsYz6SL0RwAUhipn+3mrYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Smzt+lWxXVgeFfz5VUImgT8y85p510EOSfY3ikxK/s=;
 b=gLULMFKMEE765zzKh2KfnMx+xIstjARdoBSQKoghrVQV6KDVb2Nu8cYE4LkTV4gxRJcnq3DILinY+i9PlQIedsxEf7DqVqa43O6bZrP6xrQNcLFW6hgbGmoemkfEryoe/X+Bx02IkA/3A4k4oZ/z/+N7ArUBoWxXfJT1Aq7pUCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by MW4PR12MB7382.namprd12.prod.outlook.com (2603:10b6:303:22b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 11 Oct
 2023 19:24:20 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf%4]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 19:24:20 +0000
Message-ID: <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com>
Date: Wed, 11 Oct 2023 14:24:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Dionna Glaze <dionnaglaze@google.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, peterz@infradead.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, dave.hansen@linux.intel.com
References: <169700203032.779347.11603484721811916604.stgit@dwillia2-xfh.jf.intel.com>
 <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <169700206636.779347.12625001287120171667.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0178.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::26) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|MW4PR12MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: f51a0dc2-f0b4-41a8-726f-08dbca8fab29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4wy18whDa2bRWqVVdX/JktkNFEC6i9o7mBvDNfO1Zlrv4vdUd6ERjw5So6GIU1jTL8rxeV82yKgrlg+6hRThH8G8pTLQ7yXFJqxICMmovkWcynMpO8ERVzOjlsaagUwLrRydDEqV4O/Jc2NkIcU/RlwMebYyiuvfwGU7WGOQOUBCVC2z/fkdXEh6EA5wnThrFUs3AE59/IIhQe0KWCDw5KoN8QwPs15aadlZUBAbuSqOKYsMgWUDHwWRUEd88ZuPKCWNqcLi1iYP9yD4fcB7n8r8+ABEqlwBR6nWa8PsT/o68qe37tf0l0Wt1xwMeHtrXv/PN/KN9oDWX1j0w6aKI05bV/kd83R9kWY37D6Y+Py04LaMtPdAt8TLTPUx9ybOY2AI0lg3tzsa8+V4E6knY3617v3fWN2AeKU3YBrIqENVCJ8kX30U84Btih9X5NhCd3JSNlmLuU26P/gaCAbYYQFqOcZL2raSM0++B4e9KBubdJIiStowDJGHOh2w+WTfASjyDS857Vr0lVzOTzedxRvHgQJwsrM7vbkqvCRNjxaN7+UwJCDf3RcB41NLFlNXlwuPCm+YjKNvjWf0Qy6g9qse1BtENzsUrqq79UhRQ0a26Ds13YxGWAk4vIqtz0GC8/6wGnGfJ/EzK+YgPeT5YA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(36756003)(478600001)(966005)(2906002)(83380400001)(38100700002)(2616005)(41300700001)(86362001)(31696002)(316002)(54906003)(66476007)(66556008)(66946007)(6512007)(6506007)(53546011)(31686004)(6486002)(6666004)(5660300002)(8676002)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0E3Nis0YklwQ0ZxbkFmcDJNKy9pWnVIakFaTEhwRmoyYndzYnR2by9RZlZq?=
 =?utf-8?B?Slg0M05VVkNPZFhFUkdwRm1NQmlSNzdiY2paRk5GZDJnTDgwektOTzNJaFkv?=
 =?utf-8?B?Zi9sMHBRYWZGakhjOEdtcDROeUd5NXBHdU5ZTEY5ZzdFd0xpaDRIbllESmFU?=
 =?utf-8?B?bGtDdlc4dE9HNDhyRW9sVElMdlhIWlJIMEt0OFBLM2FndlFLbm1wOWJ5WVA3?=
 =?utf-8?B?bjQ2akpMVkFkUUc5ZXlhYS9mQmg1Q01NRWEwck10elBWUnAxczhSWDJtNEJT?=
 =?utf-8?B?RkFlMWJNeForVm0zKzM1QjdDVWhsdmxGTjZpd05NWGttNkgvejhSN2dqd0V5?=
 =?utf-8?B?bzd2UFN2YkEvZ3hVRWtCR2pVbWVTUit0c1VZZ3VxdDk2WmZnOGtJZnhpbzhK?=
 =?utf-8?B?UmNEaXJhTGxKZlNOb2YveG56dUdkUTd1QkxNR2VMNk9rUDdWdWh3Q2ErY1Fy?=
 =?utf-8?B?aVZIY3ZmNjNwWmlpQWhkVzJ0YU1naGY3UXNrVGt6SWFsMzBneEFRZjRBWCtP?=
 =?utf-8?B?UEt5M1Jxc0s3Uk8yZlN4ZFZmWjZMSktST2xVdDNKSzR4Z09na0h0RzZyMGFq?=
 =?utf-8?B?QlJVekw1ZGY0OXJwVzBnTDR6ZVAyQVgxTkZ2eTZKdjkyWEJ0bGpyL0tDQ1RI?=
 =?utf-8?B?U1pPWDlpSmsyejBBM21OSk80N1ZOa1Z4MG9sTFRWY2xkNnd4Sms4elNDU085?=
 =?utf-8?B?VUdNb1RyYjNwT0RoNHlVZDcyMXlRNjRRUE9OVVhyODNxZmhaWU43d2JzcGJB?=
 =?utf-8?B?dnlaRmlGemNrNHNsUlZFaVU1dG9WM2IzRjc3aXFiSGYxQ0RxcndMcXlNRjgz?=
 =?utf-8?B?M0s5YXF1NTF3ays4cVFmdGg4VXc4N0FtN0tqMnNaRm9EYytqN05IWXY5KzNC?=
 =?utf-8?B?aGVqcktCa25ybTEzWnJoNHc5dE9VS21PVVYzNDJwdCtlbFMwejRLb1RSNlBi?=
 =?utf-8?B?SHFNVHF6dTdsN2hQN3BvSUFKRUs5ZUZxV2t4WjVoMVI4aVdZUVJWWUVvZkhm?=
 =?utf-8?B?UGoySXp5RFZYUGF5Wlh5OXo3NVNTSzgwS0FoZFhuZW1OVVBBNm1PWnZTZm1B?=
 =?utf-8?B?eW5Jbkp2ekNEL3cxckk1Tk9HUEMwQU5vb0pTUFFkMGVKL2w1TU1iQlUvTmRm?=
 =?utf-8?B?L2tYT09mMThyandUdk5HM0FUVkRtVitReGhiQ29BN2lPMk9pU3ZxVGhVVHJJ?=
 =?utf-8?B?WEtRTEZQOUcwQnFtOWR1dHg4RFFZS2F0YlBuR3JaQUNBeXpDRi8vdGlqVk1E?=
 =?utf-8?B?UERvclZzQWVJWGhqa0JPeXZaeUNUOVdXSG5GRnVjK1hUUEk2YVZZdFV3UlNP?=
 =?utf-8?B?N2ZHSFV5bkNadlNCYXNidFgwZDBoUnBaclEwaTcxKzUzR2hHajVwVkxXTm5Q?=
 =?utf-8?B?VVJ0MCtlMVNkL1FYQWRJUmVTckhjakp6YXBmR1ArU3pMdFlEWElrcFlCM0lY?=
 =?utf-8?B?Z2tWVjY3bjNkamp0UFRVeWlMZFpNU3JNcWJUcERwL3VGMkpGNlJITFVYc2lN?=
 =?utf-8?B?UG8xWXVqdWYrcVd3Q1hYclRqSmFReWVPVEI2VjVVY0lVU2lQbkRDdkhEUStw?=
 =?utf-8?B?UlpQR2UzN3k2S1pZQW91V0l3bE4xeEg4ZTViMDNpUGJDSnpncnllUFM4c0lu?=
 =?utf-8?B?bUFpcEdlcGpYZmxCRW9SOEdlOS9JVlQ2KzBPZmxMQmYyUW9UZnZEc0Z1WWtU?=
 =?utf-8?B?WVJRUDJVWHBKNmZ4UTFtemJHN3ArZ2VDdFRMWkZ6NEgwQ01LRmRYMVRTZFR6?=
 =?utf-8?B?U2JtbWMyMmZsd0hCdGlJb1NLS2p6QWU2WXBHK0l3cEFyU0EyQXpuL092Ujh5?=
 =?utf-8?B?Mk93blc2THZib082NkN5WkJnQ0FUNHk4ejJnYTQwRzl2d0x3ZW56cm95ZjZW?=
 =?utf-8?B?QXR3Rlk0b1RSYzl4ZFladUVNK1hCTHphbkxTQXUxMW1jcTdUd1ZYQTBrTGNN?=
 =?utf-8?B?TmVBaEpYSkp4dUJ1Z3ZCNk1yeFN0UmRZTGR4bUZWWkZWY2tTSkZ4cTF6U3lU?=
 =?utf-8?B?cUM2aCtkOXM0M3loMklIN3hPbFpGMndVdTZnQmd5Ris1U1dhRlJwSDgxMWda?=
 =?utf-8?B?Y3ZpNEl1ekdXY0o2dnNJR3lDMUJyc1Y0T3FKWFdNZ0hESEZkKzhqZTg1VVUv?=
 =?utf-8?Q?Bx4EC1+KlHY+2h2NK0mrDGE9T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51a0dc2-f0b4-41a8-726f-08dbca8fab29
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 19:24:20.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1k3CIzN5x79f5dhmlZedObzA6N9TrZCT+2t9e6IVIT2jns3W94vx2Rk+bhcBv/rTajQHA9KHa8KpxI/7X403g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7382

On 10/11/23 00:27, Dan Williams wrote:
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
>      hexdump -C $report/outblob
>      cat $report/certs
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
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>   drivers/virt/coco/sev-guest/Kconfig     |    1
>   drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)
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
> index e5f8f115f4af..7fdc5a774eab 100644
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
> @@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
>   	return key;
>   }
>   
> +struct snp_msg_report_resp_hdr {
> +	u32 status;
> +	u32 report_size;
> +	u8 rsvd[24];
> +};
> +#define SNP_REPORT_INVALID_PARAM 0x16
> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
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
> +	int certs_size = 0, cert_count, i, offset;
> +	struct tsm_desc *desc = &report->desc;
> +	struct snp_guest_dev *snp_dev = data;
> +	struct snp_msg_report_resp_hdr hdr;
> +	const int report_size = SZ_4K;
> +	const int ext_size = SZ_16K;
> +	int ret, size = report_size + ext_size;
> +	u8 *certs_address;
> +
> +	if (desc->inblob_len != 64)
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
> +		mutex_unlock(&snp_cmd_mutex);

Is this needed given the guard above?

> +		return -ENOTTY;
> +	}
> +
> +	certs_address = buf + report_size;
> +	struct snp_ext_report_req ext_req = {
> +		.data = { .vmpl = desc->privlevel },
> +		.certs_address = (__u64)certs_address,
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
> +
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
> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> +		struct snp_msg_cert_entry *certs = buf + report_size;
> +
> +		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
> +			break;
> +		certs_size += certs[i].length;
> +	}
> +	cert_count = i;
> +
> +	/* No certs to report */
> +	if (cert_count == 0)
> +		return 0;
> +
> +	/* sanity check that the entire certs table with metadata fits */
> +	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
> +		return -ENXIO;
> +
> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> +	if (!cbuf)
> +		return -ENOMEM;
> +
> +	/* Concatenate returned certs */
> +	for (i = 0, offset = 0; i < cert_count; i++) {
> +		struct snp_msg_cert_entry *certs = buf + report_size;
> +
> +		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
> +		offset += certs[i].length;
> +	}

I agree with Dionna here, you must keep the GUID<-->Cert relationship 
here. I think you can just copy the full returned cert buffer into the 
destination buffer. Then it would look just like what the ioctl() returns 
and make it easier for userspace programs to switch to the new mechanism.

Thanks,
Tom

> +
> +	report->certs = no_free_ptr(cbuf);
> +	report->certs_len = certs_size;
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
> @@ -841,6 +972,14 @@ static int __init sev_guest_probe(struct platform_device *pdev)
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
> 
