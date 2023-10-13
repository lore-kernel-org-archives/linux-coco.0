Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6DE11CBC
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I6clgWP9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G08YNxdXSXiZovsps5TpzQL0L3C13IiLIq6PJ+6ZiWMJVqqZmrUA9I3NRf5U6sJSLv/MEPXFwjHWh3NmV+ygQ1HAsQE1i7da+TC7IgY777ajdMFzEFeekQdamMNWJr/LnHbT/i7hf2OyeSY1eO90cWluL+lLYFQbVlcpq/GhdUyzxlq4twncexRaidiERH2126AG/VWTLDmMR0/doORq+hEaX/w/HkqDlD4LJIUM2aEPOV5iPLCDJlTvz2vgrjldZ3mwHf9vIxGDFbEUeNib1RBZ5Rq93VFeGTDWm28Y3RqXBIjsJc6tDRclM4RYEH9baBE17SiGx43Rz59I0aksYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnZQG/S5vb8Jmv85/n/i/EDpC+xdlm+sY4tdqcv/fSg=;
 b=gejRVfHP5VygWPxuQp2QJ6QDRox00euTZFp02nB0gEINdy2hXPmibI4+qaJWt4mVpPwEEC0U8I0xE5XAQ48ymxROm7cgi5spx8/5IkKowoCLmUJpiGg+lvhcbjVWPpAUbAJAjNTFxQ8UkRxte02ziWnTjoAaLnLlxqlubutRDX/9vF/zG8pU48BxXILvqEbtIj2+kRpm5YRW/TdGZAcyzdpg2VEMS7t417tdPmigszFNM+NAX2oe3IFNDJviT6kvcx/heP781TDwBmb5a/epD+WEMVbXwoG2NmpNtrFdj8AsjniCmfGmx+6eH8Ai5pyVjlhmL9l5q7lph9x8L5+BhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnZQG/S5vb8Jmv85/n/i/EDpC+xdlm+sY4tdqcv/fSg=;
 b=I6clgWP9dnFhEQdZ4ryemHBgrCrhoSDsFR0yKehF6unK+D8GmntMKtWrDB0J8pwCncbW+h35l9KNZ/bJ2ysW1cn9a5WlK02KuX9u0csRDHIwO/kNJyPeOhvvPG0drhAwOOvsT9zMpY+c/NIsBRoqP3sZk9xdqjXGC2V2kOY6KXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by SN7PR12MB7108.namprd12.prod.outlook.com (2603:10b6:806:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 15:38:56 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf%4]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 15:38:55 +0000
Message-ID: <4778317a-af55-40a6-912c-cc685cb431d9@amd.com>
Date: Fri, 13 Oct 2023 10:38:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Borislav Petkov <bp@alien8.de>, Dionna Glaze <dionnaglaze@google.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 peterz@infradead.org, dave.hansen@linux.intel.com
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 1NhFSLKvfA==
In-Reply-To: <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: defe7fb5-f239-40ce-9ea8-08dbcc0282ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	txK850Garocsdp3u7MYYF7b5g1FyJsEZX0bn+iwBkSfw7YAc4ZBn3ydEVt1N6J09KW491bGglaKvpoUcYZNV+w1akR9aMeD7iAcRF1MRI71tHiuyyf5CTA9dXfK7urALejvwhJ6DZRce5Xf8iKFyS4ybak9ttXFKg8AryUgrQDXyEmCwoTkNMHr+sv6EBoWdi2UqpmOBVXxIFFQiwcsZlxhhTTtl6ekY4PERS9Vnj7q+wEYMe3dal3+YbNJANuXxSDv3UpSa19Hv1JrPgtpzbte4KCivQ5CX05QVFOAzNCrMmpxzDra7E5TCL0d7uIOTm6eMQm/3jCiY8cCFsmeytn7ctfBpvYRO+lAsGIofHTO82mabm3MAxRR8umDsWSWk1QJuu8MdGWau3VSApDgwnOR0DQPHWIUuOiVFjmH7xrXy81xurh266/cZwo28QEjJ4iBYsVczNqvZOZE9KEHxSPkBRYmPt3DQzJri3RN6Vh1w52lG8CWnOsraKGmd53Xk1RtntiEarZH5LvxPgN4XlVqVYALG4eH2/ddywdu/DGzmmIIG/TFRstSvx+tbsjV4imWYzZV2HiEJ/g6UYnpV3M2gmo+Vq90n0u+3ONPk0fRuaB1QW3dueYRszJexUE4ErS9B+IxH9LbUwEAqE5OLaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(53546011)(83380400001)(31686004)(26005)(38100700002)(6512007)(31696002)(86362001)(2906002)(66556008)(5660300002)(966005)(6486002)(4326008)(8676002)(8936002)(2616005)(316002)(66946007)(54906003)(66476007)(41300700001)(36756003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRUd29nb2VZZlg5ZDNPam1GSGhyVVpjZEhkSmJrUXcrTFlnYUVtNUt4Q1My?=
 =?utf-8?B?bWs5NmtTNWplNFgvc0dZeEp1R2YxT3ZGenk0NEJVUFhYeGxWZGFGVWU0RVg5?=
 =?utf-8?B?WGxiQ1J1UVRFUStPWWtQSjB0NE54dE93dCtYNUovWXh3TTZvT1I4a1h3ckhU?=
 =?utf-8?B?ZXJWK0wydmZ5WmF6N2E2V0RjU1QwZURJVUhFNUhUQW9hMUh2dC9icnNUSU52?=
 =?utf-8?B?TjhkbEdWQWJRek54NW5rRDhveEJETzlna2RTQ0VqY2xUT0tESENmbVorL0gx?=
 =?utf-8?B?YW96S2JCS1prUDZiMzRCQlA1VHZ2OUpQb2xqcHZwNS9oLzczaUk0YWg2V3cv?=
 =?utf-8?B?ZlhCdmRRTG5MdFRkWE5jc1FRSFpwa1FXLy92cWt2V05qZmVLRzQ4dDV5Rk9I?=
 =?utf-8?B?bzcvRXByNnRmTU5EVmFVTkN5UHdNY1R6ZjhDS2tHRDdSeFRWRXY4YnA4S1c5?=
 =?utf-8?B?TlpKU3FkcEFvaU54L1o0dnFOaHZTNEFCY3RkN3ErVnozZzlxMHVDdGVQNnVM?=
 =?utf-8?B?dXVNMnlLK0I1VHEzaVFCSmVjSUJicXFKTW9EVkxIWHplV1IyNVBVWVhnNHZK?=
 =?utf-8?B?Si8rY2VmczhrbVorY2NrYXBjc3BzeEpEUHZpRGpwZ1VWTDc1WCtyTGt5ZFU0?=
 =?utf-8?B?WmZST0p6aERkV2JOVW9nUlduc1pPd0orY2loeUJRaWwraS94M2pRYVVYT2Fy?=
 =?utf-8?B?clFlVkNxSU5CanRzOGxmNnR4QWh6cmFiM2pkK3dsbHpvVUhjcWJyTW9jYUdK?=
 =?utf-8?B?cHI5aUhFaDhHU2o0NUhqOGkxeDQ2aG5mWEVPS2lrMlBlWU1QMFl0Tkl5aW01?=
 =?utf-8?B?czZqbUdkZEJkQzUweWdMaGNVREljdWpDbC9keWdQOFZEbHlpK1lEZzRxRUhR?=
 =?utf-8?B?azgzMWkwQ3NOU0JYQldaa3hiaUtCbnBubCtQbkNKaC91czA3QWNtZVA2MDM5?=
 =?utf-8?B?ZVFYQkdPK0FCMXpsekp1Q3dRZGl5RjlrNGYzR3JOcE9VeklEK2RrTjZnYXkv?=
 =?utf-8?B?SjRLTXQwTlFyanFOTGdQYnlpc2xwZ2g2M2hmWlVEYVM0YWpyU1FDbHdaK1ZM?=
 =?utf-8?B?K2lOelpTUjVIajNhRXFLbGI2azdXdjFoUTBlK1hybUhaNVNtOWpBeHpja0tJ?=
 =?utf-8?B?T2ZBd1BPWVdVMmVhWCtwU2JZRmFOK3BQMmVRUEJJbU5Gb3doL0RLaDl0UGVa?=
 =?utf-8?B?bWdVYlV6aW0rYU03ZmJNWElma1VuQ21KeVg1cWZoNTdSbEhNVjZyNDI5a29o?=
 =?utf-8?B?eHFFcUtMdS9wUWJybGJmOGRPUU4zc1Q4Z25lLzdlb1NKeVNzZ0wxTGJOZjJm?=
 =?utf-8?B?bzg2M1o4MStNblhvR29lQ3E1Y1FnYnRKc3ZhSFhINFlKQVcxQm5MNXE1N0dp?=
 =?utf-8?B?dWdwS01GSU5WK1gvK3NTeWpNQjczeDNhQmg5b1BCOTl4dnUxOW51cCt6UWtq?=
 =?utf-8?B?S1dRbXhMN0swMG1BRlViVWxkZmhMVVNNeVpFWHlYSUY2TkNBRHRodDlYVHJu?=
 =?utf-8?B?SEVBUUNSMHFyVzlweU14MGpPNktNZEtaQXZMUTJYbTVteEJ2WS9WaWJGT1Nn?=
 =?utf-8?B?azh4TWxtOHJSQWFHeXcydnZnYlNmaTA2RWdIaklHV2VKVWlhUi9jYnVJQlox?=
 =?utf-8?B?V05ldzM0aStsVGt5QndwRGZzMERYT1kwM1EwVzd4cEF4NFNIS0FvM2hkMVJK?=
 =?utf-8?B?WHRsNGlhVVhKMytLNDA4T0VMdW1VcU9VUkFOdmJ3Um5aOVoxWXRiQU5SYWpR?=
 =?utf-8?B?aXNlc2pTQ3RQT2EvcjJkNnlrV3JJaC93c2dOL1czNzkxdURHd0FqTjM3Ui9i?=
 =?utf-8?B?TkRCaDV5d2dtU1NnMWEweEcwd1h4QzBETVZoVWdxVTFoUElIUVltVVZuem5J?=
 =?utf-8?B?SFd6TGtMU2owYTRNTTIrOHNqeG0wRUZzM2Q3RjVwb2QxODNiek82SXYxUWFW?=
 =?utf-8?B?cnI1MzViaFA1Qy9mZjFkTkNqUjExRktPbjFxbFI2dWVJczZocTU1L0MxMmNq?=
 =?utf-8?B?czBMdFBnWnVIYzBkMjg1RHY1d004Vnp0bDl1ck9FZDBKSVNlaDkvK2I0L0lv?=
 =?utf-8?B?U3BiL2tpSmFYMEsyZGRzOWplamwzMUZoZG5QMjJ1R2UvZDhWY3lvUGROWC9C?=
 =?utf-8?Q?Gujz0PihRyAEgawh/qgM/szgJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defe7fb5-f239-40ce-9ea8-08dbcc0282ac
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 15:38:55.8828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv3pTY+2bXZ0WoclhQN1lcAz0b++E2JBoLAkNnQSHksnMtXtrBFmFo6W3HtQy2c4xE5m1GnuCk8n5Naj3MZypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7108

On 10/12/23 21:14, Dan Williams wrote:
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

Everything looks good. As for deprecating the ioctl(), you will probably 
only be able to deprecate the certificate related portions of it. If we 
ever have a common key derivation interface, then the complete ioctl() 
could be deprecated.

Thanks,
Tom

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
> +	struct snp_msg_cert_entry *cert_table;
> +	struct tsm_desc *desc = &report->desc;
> +	struct snp_guest_dev *snp_dev = data;
> +	struct snp_msg_report_resp_hdr hdr;
> +	const int report_size = SZ_4K;
> +	const int ext_size = SEV_FW_BLOB_MAX_SIZE;
> +	int ret, size = report_size + ext_size;
> +	u32 certs_size, i;
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
> +	certs_size = 0;
> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
> +			break;
> +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
> +	}
> +
> +	/* No certs to report */
> +	if (!certs_size)
> +		return 0;
> +
> +	/*
> +	 * cert_table reports more data than fits in ext_size the
> +	 * userspace cert_table walker can decide what happens next,
> +	 * truncate the output
> +	 */
> +	if (certs_size > ext_size)
> +		certs_size = ext_size;
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
