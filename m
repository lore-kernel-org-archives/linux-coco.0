Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80AE249ED
	for <linux-coco@lists.linux.dev>; Wed, 11 Oct 2023 22:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L9wR1gm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1Am07SeV/z05knDWjAP23npL75yT4dgofBOxSdSFx/l44EFyku+nwzHoJnCXeGpyL3KK5wj3qBsov1hpDODt15wbjj9/P1MH2EXv4ELiu6XzA1F6Kcqx//qUWXZeLGjBMpmAWP4zgCeYYmqvLrg2pGTjqHwQcOI5ft3kPdKZgLS+5fuxQ+qz+zb7GNwuUJ50EqXT8MCoDWMf3wdxt1zDeTv2hngodEHIpAO0+aKgVdpI9Eb4wKlQ4cb5pQRGFmJR6a2wVuQ+YRwEiOH4UnGnX63HnW5KDWjyNaVzWAPH1Z12SwM5FNf7ldBNRBstb3sqjzD+bQnkS8aAnKpoDXdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFLi1iCOljEeFNtkPz26xL8GWG935azIP3EZiefOCi0=;
 b=D90h4Rz2oWdWcsUmB3L6F3YwnznTpk4IGaCh3Rwn8I7vVd6OfhNIfMTwtA01cAGTvDB9LYQYUDIwOkpaajXA+QLZpORT3gUpQ+iAUbU+CPz61UYaoG7+Fnzg6nFpmzJQGyiERdai8xyjkdQ2qOtUTKiyZ5LNygzy7gB9lsvZ0iE2xvGqjCAgI7jiQZ8ebLR+fnRS1veutfTgZ4F/rU5IH6jV3mHZ0CZQmhL21AC2ijiv7TUr8/PGPv/WgASuow15HI+s7qWBUVbkHUQLoyT6QynhK2J3tOWvIQxhmLTRMeHwFULNwzlxREDxGbWQfTV6jqfkDZKwjIuClq0b8sTV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLi1iCOljEeFNtkPz26xL8GWG935azIP3EZiefOCi0=;
 b=L9wR1gm5uTxGAb5Ezdz9Xz7v4qBIk3ccslxRME266Cy/zfSqr6pyANmrCr9TipoetTSAjU/nYxu7dGC1+JCPxk9uZyng9WrG/Pf4P80J+7mfY0A41qqI6XPjSQPneQznlhVbvRrjoe0zMASOZWUOsnkHhiP4hPQFp47X+JbszSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 by LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Wed, 11 Oct
 2023 22:24:09 +0000
Received: from BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf]) by BL1PR12MB5732.namprd12.prod.outlook.com
 ([fe80::a13:336d:96a5:b7bf%4]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 22:24:09 +0000
Message-ID: <9b08e4f0-9538-3680-2465-1b200ff0d777@amd.com>
Date: Wed, 11 Oct 2023 17:24:05 -0500
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
 <9b8d2905-3203-67bc-9d6b-b60023910666@amd.com>
 <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <652713f6d5bac_780ef294b9@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0110.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::25) To BL1PR12MB5732.namprd12.prod.outlook.com
 (2603:10b6:208:387::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5732:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a397c45-2adc-44ea-1067-08dbcaa8c997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BHAE1AgojyabJ4urCQvP/4LaXThtWJRJ71cxW93ku65yvq/7Glw6CjO17kAeKiRAzY3uhQiESFl7hkYVb5UjEXnc1LibErMhcSxo8ufJiEUY6rMgQuQueJMXHyl6qWCcoSC9eDnSja/TtVvlp1fYaIzQ11wwTW7Ggv5N6BSRZEKIKE2EwtQgWOb9Fp9yHqU2x2pfWhAAADNmHkJ0VCqyWe55aFejHs9z4oYTORhNhqu2llmczB5WN/VSEy9c5t4SJPlzGQaVp6EI2/K4PGwpgz4MICVsvqmtxtTmW5Xp0gUpZz55g1Yp6XfczRXS4pBVU46IqJDq8APsllwK07WpoFpr5//Dej+Boj/IwISvJUMjVtBiKRSclheuTF3PqyDzacrxuIvM+cAh4zbQl8VIFDick7a5HcjhqKAKIzklTfNF5QOOP+BqXEK049gGvB2IJClFvhEo4YTmwa0KJTlvlfViz7WD319HHcM9br5/HMdb5PLC/rQZr6YJLfF47yF92SWuM3tJXfJt7T4MpWxT3DIe0+TM3zNzR+UH0f0st/d2orZQgdfh/+Zpzi2eWA9UwIXAy1v9RDbnjc122ASQteGQkIGDoLGJda+/hnf5+Q+qzTCkCChrI3bgXocxVKBaulZWTd1pn8Cf2jN9b7UlvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5732.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(5660300002)(41300700001)(4326008)(8936002)(8676002)(31696002)(86362001)(2906002)(2616005)(478600001)(966005)(6486002)(6512007)(6666004)(6506007)(53546011)(36756003)(26005)(316002)(66476007)(66556008)(54906003)(38100700002)(66946007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xVWkNCQUt5QVd0K25FNjd6RmlFeG9VUnBtSFJ5YjV0L3ZPeERLREptSURN?=
 =?utf-8?B?dzhqUEVKdnRxSnNPdGM0bXpobkl4a1RxRVprUURKTlllNHUrZ0NaMGRSOGZE?=
 =?utf-8?B?Zy9JZk1KK3dqNEdCNzNZRW5icEVFZXdrV2s0b29YbmxtM2V5RlduTElwZ252?=
 =?utf-8?B?c3FjMS9UNENLQ2ZXM0c4ZFM4ODBvUGM2Vkt1Z2draWdFd3hKV2EwQkRQS0F6?=
 =?utf-8?B?TzhJamppTFkzUCs1UTlSL0xPbGE0Vlh4ZnA2NmFROXFMS1hKaE9uMjN5Vm5Y?=
 =?utf-8?B?amhBUVB6QU5nVnFlcTRpQXc3aGdybWNDUEtMbFl2QXJJOXh0bVZXc0dqanpy?=
 =?utf-8?B?ekRad0RXZHZmRTlLY3JpdVdSZHF0KzczQTNPeXpXVjgwYnl0RVhwQkpqQ2sz?=
 =?utf-8?B?TXphcW1PWlpWYVgwZ2lzYTlJQ0VjaVl2V0YrSVhUaHVMU002a0lEV1piWXl1?=
 =?utf-8?B?L2VlM3V2UmU4anljdGdLc3prNTJja0VBaTNZVmgxUEdDOWhUdm9KangxSVhU?=
 =?utf-8?B?b3ZZYU0wN3BwUkh0c3VUOGZLOHJ4d3VpMjBXZFBNd1JrTDY4WTVEcU1NOEdo?=
 =?utf-8?B?NklTT2tFbVRhZkJSVU1GWTJKZTBnU0dWdnFzbTRhKzVjbDZyb2JsTkl1OVhw?=
 =?utf-8?B?dldUcmlsRlJUNzRlZmxjTWRxTUhYZ29sU1BtbXAvY2I4bWdCVEFtYmhYSEtY?=
 =?utf-8?B?UFZVeHRSK0FkU0ZSQkdCUVdjQXFVanR4ZSsrelV5eGU0QXE4ODI4VVZyTXVh?=
 =?utf-8?B?TVA5M2RBZ1RsTEROZTVOK3ZlUHRWNGkwUHJxSDJqdGlQdnN3QWpxYjlacnRk?=
 =?utf-8?B?Y0Jhei9vSWFOZmFNeVV5ZDNsWkQwMHF5bVlXVUlvUkgvK3EvVlR3cmxKQndj?=
 =?utf-8?B?VW50a3lPWmlCQUR4enpQS2lYQTFVUXhLUWlZdkprL0J6K0hRME5WNzhMQzhF?=
 =?utf-8?B?ZElZZ0xxOVVBaHljVEh2RjNmdUt6Ump4QmNkSHhqWnRsZ3hJS2F2a0czTkJU?=
 =?utf-8?B?VVdtY1VsRnNnSUtnNzQ0clBreWw4eFNtRCtqWHVsaDVDNFFmZGdNMk9DbldI?=
 =?utf-8?B?bTNzZmNLTjBIWU9JUlk0NVV1dlFsT05kN245eUN0N1Q4TGhLOGJRWVBVd2pq?=
 =?utf-8?B?QS9pMDlEc1hlRTFnTklkVkFrZzBXS2Jwb25uWXYyd3ZpT0hGVlRHbE1GS0VV?=
 =?utf-8?B?dnlQRGRCelQzU2F2anZ1aGdtUVNWUWlUMnk0cUZvdkF5bU9UYnBhT0owTTBJ?=
 =?utf-8?B?VGZtZTh0ejgyRVZpY2tJREhYdXVNVDZkMFZYVlpRQStmVE5WSHlkcjB4RHcx?=
 =?utf-8?B?UEhSZUJMQ0sveHpocVRvTSt6V2t0UjNvWldwNFRCYWZIWE02dEZmTnRRVitL?=
 =?utf-8?B?em1hbGNsQURMazg5YklucUlvMVBoKzNjc3FKWlJqZ205TWwzcU1pSzRKUlla?=
 =?utf-8?B?SG8vd0E5UW9JbmtyZktVL1ZZOXZYUGM5c2R3TjJNWE43VXVhbyt3dUp3UXly?=
 =?utf-8?B?M2ZLcWxzdFd5YTMvU3VveXUyckdOMmRSb1BDeDA3QVF5bVFZZUxkK1EvSXJG?=
 =?utf-8?B?d0sxT0ViT0U3NmNWYVBiWldKSGkxQmFaYlZaenNtNEp4K0NjTnNJS2NlZlN5?=
 =?utf-8?B?dG1oWitWOFZVSW93YVlsODJVV1J2K0NqeFYrbkw4cSsyc3pkZlIrbHljUmhE?=
 =?utf-8?B?cTdMU0gwR3pENnpSaHEvSnF4RGxCZUFmTTlWMWkzWk05RFlxaWRJK1hoZjZs?=
 =?utf-8?B?K2gxRGhORmtzTm9Ra2h1TXYvYmliR1FJMGhxbDFWRll3U3hPc2hVREtMN0Ji?=
 =?utf-8?B?YTZtTDlSNWVMU2VpL2lKNGVWR2hhOW15UlRNZUpmZkdieko3Q1VJMUJzekV1?=
 =?utf-8?B?dkVGYncvVGtMZXhEOFRCZTR4aWJBb0NUSFU4TkxTZWh4OHc5aGN1cFFrTTdO?=
 =?utf-8?B?bjQ4cDJiTHFvSjNkSXpQM1JETjVQNEIyT29jb1hNSUNpMjR3eDF1dGxLWUNt?=
 =?utf-8?B?cDlseUd2dGxFazY2QUtFcDZrb3hqK1pqQmhzbXRVOWd6NUtQcFRsR1VtcUxw?=
 =?utf-8?B?RXV6bFZIeXIwd3d1L1JPQ0Rwc2x6QXl6TE5DWnhIL1kvV1E0UnRnMWlkU2hr?=
 =?utf-8?Q?iqnLw/1kDyOGyZIZRE+QKyO4w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a397c45-2adc-44ea-1067-08dbcaa8c997
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 22:24:08.9615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1X17GOTSSkSGAMdUfhABUMbGkwehAw1afwgVLBBA3cptZWN8Rcul/AKWf1ghheH8X5gISS3GMRGrgHOXaHvroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120

On 10/11/23 16:30, Dan Williams wrote:
> Tom Lendacky wrote:
>> On 10/11/23 00:27, Dan Williams wrote:
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
>>>       hexdump -C $report/outblob
>>>       cat $report/certs
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
>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>> ---
>>>    drivers/virt/coco/sev-guest/Kconfig     |    1
>>>    drivers/virt/coco/sev-guest/sev-guest.c |  139 +++++++++++++++++++++++++++++++
>>>    2 files changed, 140 insertions(+)
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
>>> index e5f8f115f4af..7fdc5a774eab 100644
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
>>> @@ -768,6 +770,135 @@ static u8 *get_vmpck(int id, struct snp_secrets_page_layout *layout, u32 **seqno
>>>    	return key;
>>>    }
>>>    
>>> +struct snp_msg_report_resp_hdr {
>>> +	u32 status;
>>> +	u32 report_size;
>>> +	u8 rsvd[24];
>>> +};
>>> +#define SNP_REPORT_INVALID_PARAM 0x16
>>> +#define SNP_REPORT_INVALID_KEY_SEL 0x27
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
>>> +	int certs_size = 0, cert_count, i, offset;
>>> +	struct tsm_desc *desc = &report->desc;
>>> +	struct snp_guest_dev *snp_dev = data;
>>> +	struct snp_msg_report_resp_hdr hdr;
>>> +	const int report_size = SZ_4K;
>>> +	const int ext_size = SZ_16K;
>>> +	int ret, size = report_size + ext_size;
>>> +	u8 *certs_address;
>>> +
>>> +	if (desc->inblob_len != 64)
>>> +		return -EINVAL;
>>> +
>>> +	void *buf __free(kvfree) = kvzalloc(size, GFP_KERNEL);
>>> +	if (!buf)
>>> +		return -ENOMEM;
>>> +
>>> +	guard(mutex)(&snp_cmd_mutex);
>>> +
>>> +	/* Check if the VMPCK is not empty */
>>> +	if (is_vmpck_empty(snp_dev)) {
>>> +		dev_err_ratelimited(snp_dev->dev, "VMPCK is disabled\n");
>>> +		mutex_unlock(&snp_cmd_mutex);
>>
>> Is this needed given the guard above?
>>
>>> +		return -ENOTTY;
>>> +	}
>>> +
>>> +	certs_address = buf + report_size;
>>> +	struct snp_ext_report_req ext_req = {
>>> +		.data = { .vmpl = desc->privlevel },
>>> +		.certs_address = (__u64)certs_address,
>>> +		.certs_len = ext_size,
>>> +	};
>>> +	memcpy(&ext_req.data.user_data, desc->inblob, desc->inblob_len);
>>> +
>>> +	struct snp_guest_request_ioctl input = {
>>> +		.msg_version = 1,
>>> +		.req_data = (__u64)&ext_req,
>>> +		.resp_data = (__u64)buf,
>>> +		.exitinfo2 = 0xff,
>>> +	};
>>> +	struct snp_req_resp io = {
>>> +		.req_data = KERNEL_SOCKPTR(&ext_req),
>>> +		.resp_data = KERNEL_SOCKPTR(buf),
>>> +	};
>>> +
>>> +	ret = get_ext_report(snp_dev, &input, &io);
>>> +
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
>>> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
>>> +		struct snp_msg_cert_entry *certs = buf + report_size;
>>> +
>>> +		if (memcmp(&certs[i], &zero_ent, sizeof(zero_ent)) == 0)
>>> +			break;
>>> +		certs_size += certs[i].length;
>>> +	}
>>> +	cert_count = i;
>>> +
>>> +	/* No certs to report */
>>> +	if (cert_count == 0)
>>> +		return 0;
>>> +
>>> +	/* sanity check that the entire certs table with metadata fits */
>>> +	if ((cert_count + 1) * sizeof(zero_ent) + certs_size > ext_size)
>>> +		return -ENXIO;
>>> +
>>> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
>>> +	if (!cbuf)
>>> +		return -ENOMEM;
>>> +
>>> +	/* Concatenate returned certs */
>>> +	for (i = 0, offset = 0; i < cert_count; i++) {
>>> +		struct snp_msg_cert_entry *certs = buf + report_size;
>>> +
>>> +		memcpy(cbuf + offset, certs_address + certs[i].offset, certs[i].length);
>>> +		offset += certs[i].length;
>>> +	}
>>
>> I agree with Dionna here, you must keep the GUID<-->Cert relationship
>> here. I think you can just copy the full returned cert buffer into the
>> destination buffer. Then it would look just like what the ioctl() returns
>> and make it easier for userspace programs to switch to the new mechanism.
> 
> This reverses the feedback from Jeremi where he asked for a separate
> "certs" file.

I'm not sure I follow, you would still have a separate certs file. It 
would contain the GUID table followed by the certs data and would be 
separate from the attestation report. You would be replacing the 
"Concatenate returned certs" loop with a straight memcpy. If you want to 
truncate the size to the actual data size, then you could go to the last 
entry in the GUID table and use the offset and length to arrive at the 
final size needed to be copied.

The current ioctl() has two requests, GET_REPORT and GET_EXT_REPORT. In 
the case of the latter, a separate buffer is used to hold the returned 
certs data (see struct snp_ext_report_req) and this would allow the data 
from the certs file to be treated exactly the same as if returned via the 
ioctl().

> 
> Hmm, perhaps this should be an optional @auxblob attribute where a
> backend can publish supplemental data to the report. The issue from a
> common ABI perspective is that the SNP report format is independent of
> the conveyed certificates and the TDX quote format includes a reference
> to the "certs" from the "reportblob". In the SNP case that certs
> reference is conveyed in the ioctl envelope which does not exist in the
> configfs-tsm case.
> 
> So the proposal is @auxblob is documented as supplemental data to the
> report, and then when @provider indicates "sev-guest" the format of
> @auxblob is defined by 'struct cert_table' in GHCB 4.1.8.1
> MSG_REPORT_REQ.

This will work, too. It allows the userspace to read and parse the data 
just as if it had been returned via the ioctl(). And calling it auxblob 
gives you the freedom to indicate that it is provider defined vs. certs 
which might imply a certain format.

Thanks,
Tom

> 
> In the @provider == "tdx-guest" case the @auxblob attribute is hidden,
> or empty.
