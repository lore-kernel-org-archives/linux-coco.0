Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787E14288
	for <linux-coco@lists.linux.dev>; Mon, 16 Oct 2023 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gnsEbgiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfmpQB3w0JIUov/nSsX+QlssvUMsojMOk1ykRnEuPLbjjW1kuMOkmSnPNJikcEHm6dMfRbLYJC0CW/SisIAvJJ163BlcTUrwJmeyYYZeVdEGDWf0qVhZF2uz04a0EeiOSRP1jk2K+OFSN6TfLkUNZon3DUWJTkYX9Lq5SDVVmS6kclE37KYxJknahCjqS55bqEevSikIUu4f3u0XVad8HQ0TAxlXdDrGepCjwj0xJXWedvfeNcMHxLEY1qoioVMR5qMsu8FVgXmHt4j7Lpq3TDBJDgFonnRPIa+tTdsE+j7riUpk4/T70OYlzWfqzUUdb327/+F0WKK2nyGHrytJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qC4CKR5yLx860K3jFN1blAao4FOxROUvDazPGtwLJzs=;
 b=EWi6q4187j+OfF34akXS+UiZyTGUhBMP0+2S/ZAqceK7TZkLgsMQNvgChu4uEciew0nR6sZBiGJIcz0/0O0A7o22Zb+kLJQmXSAU3Co8K1hfkc4fmkp9oQizqU2XHrmEyFHFX6F9LE4qMqcvfEQ+VEfsCngO3/uztoaW5G0OjNcKh95WXk9OuP1R4xIb5lo2sKSxjL9Hpnoen/87snDqFbLRirgwVAUdUWmHG1f3f9O4vUiT6giTZD+zxm4IfSu/9SkV8qPvesy3X2nw9MrMrJjeoR0gT2QSsytQ+lT46i88cpfEklFTuGc/psWSw8i7iOtFS/RwTUDF59DFhlBHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qC4CKR5yLx860K3jFN1blAao4FOxROUvDazPGtwLJzs=;
 b=gnsEbgiAnHvmxzTdKmWVNYFclZExyoyopYWmU8ZVpS47CcbuLmTyswAAkh/YYsfFEhhaTLBkvbIu+3xBUe93tB3zSIljsA9eUqZOasia30b+LER0zRqxiGb8up5vk2eUrJ+gWLLyLcvNyN2oT0hu/uMtBHUxiGPHWTnwbNDSogg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 06:36:39 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::16da:8b28:d454:ad5a%3]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 06:36:39 +0000
Message-ID: <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
Date: Mon, 16 Oct 2023 17:36:19 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
To: Dan Williams <dan.j.williams@intel.com>, linux-coco@lists.linux.dev
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Peter Gonda <pgonda@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Samuel Ortiz <sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 peterz@infradead.org, dave.hansen@linux.intel.com, bp@alien8.de
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0034.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::21) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf00cc0-44a8-47cd-16e4-08dbce124053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2dU4GCCZ8oWu28kTQUqmzRrVWiW/YU0/ohqHIpTdbwQuRmf6jSCpUH8l3QIcDgPvmcNpXXo2rtMwedVH8T+dfXWCLpypWK9wTNH2uDlyZM+F6rrHNkv/QL4eJBoXKHM5Sjie3tsZSNy+I7sH3Cm9nCtd8+40ccbduK4GytxJJlVn8/DWI5M+ePW8E1TandK663DgAJVjqn1XazC6CwZCZfVGQgJf0s49d2VFv6zl/zUe4OC7whUBfouHpfl5IXJ6nDe8tmyvZ8ZJ2wHsVXF+KE9z0gWqcJ5J+woiI6dI/d2Tcdx9OWtPov/z+QbAlOQIz5EFHHPwxJtcHGLMPgB2qfjF7nApz9DPkwdP/VdtnVp5KkmHNF0hHubhLktAaqbTAdcGuABDg+kJcR6JmcCqeHS9yvDhCuPyvoPW2LA+t2c7qvc6quVhZvKcxn5K8bSIThIM4gnLhkjrW6Wo+Vay/AbU3jCBwZOzAw/VXSC1nrw1UhB7scz9uZHky5LPQdpKFIUUvXprcCH1X7SN2vlbWtedFbPcAciIw7FCppCzZ600hsr8QvkfeqGKlWISldTAaDHdm8U4oPNWaTt+erYrhChKf30TkTSQPpIBHI9f6g52CqDcfctIjqKESxIMjOYxxA8hDHuIDL3EDKB9WfwX0+EKLviBQyNXoGsyJntXZMZlhRRL1YLm1MHAQD58N9DM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(6666004)(66946007)(54906003)(66476007)(66556008)(26005)(53546011)(6506007)(2616005)(6512007)(316002)(4326008)(8676002)(8936002)(30864003)(7416002)(2906002)(5660300002)(41300700001)(36756003)(31696002)(83380400001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzE2T3FrdjByYVVrSGFIVDJnQVJtbHl4YjlDaUk1TDRXY1lSdVRXZk9YVnQx?=
 =?utf-8?B?b2V3YlBUcmNpeFZBOXBhanE2NkdudkNUMUlMVGlVUHhTOXdLck9saFhZSXdJ?=
 =?utf-8?B?RlFDaXZ4RUdmdTc4SGovL3BwZnQvUGhBNERtNlgvcHBGWmduQkhiQUc5andP?=
 =?utf-8?B?UmYwS1U2d3IxL0tXRkxtWmtFT2l3dStoQ25wZDFHK1ZwUVdWQ1BEYUZBb3FL?=
 =?utf-8?B?dzFEZnJIeFdkMEcvV3RQRW9xakFWTEswbkl3QTJmWjM5a3BYV08yRWFmcmht?=
 =?utf-8?B?TW4wWm8vRTdmMVZSQXdGUUZWcUpyc1IvR0ptcDFaU0w5SHY0ejVXTis2TWJa?=
 =?utf-8?B?dkhqc2RRTG9pd21zOEh5NnFoNnArNWdNdWdqdHBmcmZrQW4wY1hrd3liS2tu?=
 =?utf-8?B?SGNIQnc4NFR6alY5d0duclg4TUpxaFlHY2FvMVRiS0sxRDdIbmxBK3JQb0Ry?=
 =?utf-8?B?RTArWnhndjNRSWtyQStMMnhPblhRTGYxUGFiNVYzU3NMYmdlR2d4ZUpFK0F6?=
 =?utf-8?B?bFo1NlFBUnhyNjRseFphNWNBaUwxRmd1NkRuRG85bHl5YnVLYU5RVDVoWXJz?=
 =?utf-8?B?UG9hVkdDWjltWlZydC85SjY0RmpWZUZSbis0dVNLbHlUL25HK0Q3cyt5YzNv?=
 =?utf-8?B?RjRWKzZDMHBJeUh2ZmNtaGJ1UWVyMTJJSGtYeGZRam9QaDQxczFRL3FOWkVK?=
 =?utf-8?B?T1I3MGZxVEZ5eVEyTllORU54WGNHdXlMVW9pMkp4NDVXSUp4V0RodVRldGgv?=
 =?utf-8?B?YlcxV3hyNXlQNjlIa2Y5Rkh2cTlWeTFuL2dURmtGcWdMSjN5elo3VGpud0ZX?=
 =?utf-8?B?QmVuMnpmTjRpOVpGc05OT21ZUGp3TDlyTzU3TjYwb3hvWXd4NngvVzlMdkJt?=
 =?utf-8?B?U1gyNy9SNW10dnFsRnhBcW9vdTNxR2VZYWlhSXRSRjZjSVNjcTNpcUFYNjUz?=
 =?utf-8?B?TlBkbGJHOWU0QmJaa2tuaWR0Z1BuYlVmaWtkNWFqT0hnQ2swaW51NE4xK0U4?=
 =?utf-8?B?TXYwODhIVnNxUWR2dG1RS0VPSlk0WGUzdEJGRXA0RUFySURERzVnYzl2MDBp?=
 =?utf-8?B?OEtYMUY2MTVTaFNzcnZPaUxXRGVycWp1UVh3elMwQko2YkU2bUM3YmpFWE40?=
 =?utf-8?B?c2tnd2VZeVAwc3luaW1hUDZId3lPWVhTeDNXaDBleElQaTdRN2FjODlIZ2Zu?=
 =?utf-8?B?Zzg0SGtRTG4yS3B6aVpubmVqSEgxenREcUhuNms0WEpMdXBHa1pJbmt2NjVx?=
 =?utf-8?B?TEo0SDhIYldRN3RESUYwS2dlUks4dWxKa3Z6WTRJU2tqQ0R3U295QjlSckF4?=
 =?utf-8?B?WnJaM0JHclJ1bTlzaWhSeDJ3ZDhxWWJyS2VxR2ZGSU9UUUpySDFTWFcyR3Jv?=
 =?utf-8?B?SlB0SW1iYnBId0pHWHFGN2FiOGcxYmo2ZWNRRXVvaVFWRjdPd1lqdC8rVUR4?=
 =?utf-8?B?V0dBaTA1Um1MS1pIdnBaRm4zNXdZeWNNQUVQbTdrZ1VQeVFJQmpFUHpQdCtP?=
 =?utf-8?B?VThqc0R2MURyQmowZk5mcm8wVVlIWGNrUGtIdWlQTG9uamdjeFRGd2RZMnZm?=
 =?utf-8?B?eHhMYmEwWHVIa3g4Y2l2VWlaN0d2WVYrejR0V1Y3ZENBL1IzOFhsQVB3OVNl?=
 =?utf-8?B?dXZmQmdHNDJYeDRWc25BRHZES2tPSG8vNENOZlc2SnJGaXYrY2htMzdBditE?=
 =?utf-8?B?NE5iSE05ZFQ0ZVhyQ3VudzZtRi8vUnlnR3ZZZnA3ZkpCTlM4SnYwYmZiRGdl?=
 =?utf-8?B?TFljN25PbDdLbWJnRU9OKzhIN01RMjkydGFKQUpxUjRkL1RhNkJGOHVoUXhQ?=
 =?utf-8?B?R1hjVUwzaFdNMXVEckVxMHRyVHdMUTF6YjdDTjhwalhkK1RFU3FoWU5zT1l1?=
 =?utf-8?B?Wkt0bmxlTTIrMVZCWjJMSXE5dklJZnkzak1Jd29aajlWZWRUL1hUYWR0UkJ3?=
 =?utf-8?B?VWZhSzFQcmYwNElPZ2VpSU1HN2NTT3g5amN1Zk1CUmF1b3hwQ1hpNEcyTmJy?=
 =?utf-8?B?ZkQ0R3VlWHNXc0tLb0xzUjhQcFJRK21oN2c3VjZjZDZaR2ZTazk3dmRCa09L?=
 =?utf-8?B?WVU4K2JpcXpLSzlMSnpLNXBYaVVLS01XYUJtZGRtaThwTDRTaFE1SFRyUUNw?=
 =?utf-8?Q?rTV2MIFR/okZCLJpmmQVp+N+p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf00cc0-44a8-47cd-16e4-08dbce124053
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 06:36:39.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFWp2JGjZfyfMmkk+KPQK90urwROYLGZ7W5BMvlBqBf6w1YSSqZnWaDYpb2eWqsRzlkwscL0QqAbWU+wsmAdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105

On 13/10/23 13:14, Dan Williams wrote:
> One of the common operations of a TSM (Trusted Security Module) is to
> provide a way for a TVM (confidential computing guest execution
> environment) to take a measurement of its launch state, sign it and
> submit it to a verifying party. Upon successful attestation that
> verifies the integrity of the TVM additional secrets may be deployed.
> The concept is common across TSMs, but the implementations are
> unfortunately vendor specific. While the industry grapples with a common
> definition of this attestation format [1], Linux need not make this
> problem worse by defining a new ABI per TSM that wants to perform a
> similar operation. The current momentum has been to invent new ioctl-ABI
> per TSM per function which at best is an abdication of the kernel's
> responsibility to make common infrastructure concepts share common ABI.
> 
> The proposal, targeted to conceptually work with TDX, SEV-SNP, COVE if
> not more, is to define a configfs interface to retrieve the TSM-specific
> blob.
> 
>      report=/sys/kernel/config/tsm/report/report0
>      mkdir $report
>      dd if=binary_userdata_plus_nonce > $report/inblob
>      hexdump $report/outblob
> 
> This approach later allows for the standardization of the attestation
> blob format without needing to invent a new ABI. Once standardization
> happens the standard format can be emitted by $report/outblob and
> indicated by $report/provider, or a new attribute like
> "$report/tcg_coco_report" can emit the standard format alongside the
> vendor format.
> 
> Review of previous iterations of this interface identified that there is
> a need to scale report generation for multiple container environments
> [2]. Configfs enables a model where each container can bind mount one or
> more report generation item instances. Still, within a container only a
> single thread can be manipulating a given configuration instance at a
> time. A 'generation' count is provided to detect conflicts between
> multiple threads racing to configure a report instance.
> 
> The SEV-SNP concepts of "extended reports" and "privilege levels" are
> optionally enabled by selecting 'tsm_report_ext_type' at register_tsm()
> time. The expectation is that those concepts are generic enough that
> they may be adopted by other TSM implementations. In other words,
> configfs-tsm aims to address a superset of TSM specific functionality
> with a common ABI where attributes may appear, or not appear, based on
> the set of concepts the implementation supports.
> 
> Link: http://lore.kernel.org/r/64961c3baf8ce_142af829436@dwillia2-xfh.jf.intel.com.notmuch [1]
> Link: http://lore.kernel.org/r/57f3a05e-8fcd-4656-beea-56bb8365ae64@linux.microsoft.com [2]
> Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Peter Gonda <pgonda@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Samuel Ortiz <sameo@rivosinc.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>   Documentation/ABI/testing/configfs-tsm |   82 ++++++
>   MAINTAINERS                            |    8 +
>   drivers/virt/coco/Kconfig              |    5
>   drivers/virt/coco/Makefile             |    1
>   drivers/virt/coco/tsm.c                |  423 ++++++++++++++++++++++++++++++++
>   include/linux/tsm.h                    |   68 +++++
>   6 files changed, 587 insertions(+)
>   create mode 100644 Documentation/ABI/testing/configfs-tsm
>   create mode 100644 drivers/virt/coco/tsm.c
>   create mode 100644 include/linux/tsm.h
> 
> diff --git a/Documentation/ABI/testing/configfs-tsm b/Documentation/ABI/testing/configfs-tsm
> new file mode 100644
> index 000000000000..64eb4d937e48
> --- /dev/null
> +++ b/Documentation/ABI/testing/configfs-tsm
> @@ -0,0 +1,82 @@
> +What:		/sys/kernel/config/tsm/report/$name/inblob
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Up to 64 bytes of user specified binary data. For replay
> +		protection this should include a nonce, but the kernel does not
> +		place any restrictions on the content.
> +
> +What:		/sys/kernel/config/tsm/report/$name/outblob
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Binary attestation report generated from @inblob and other
> +		options The format of the report is implementation specific
> +		where the implementation is conveyed via the @provider
> +		attribute.
> +
> +What:		/sys/kernel/config/tsm/report/$name/auxblob
> +Date:		October, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Optional supplemental data that a TSM may emit, visibility
> +		of this attribute depends on TSM, and may be empty if no
> +		auxiliary data is available.
> +
> +		When @provider is "sev-guest" this file contains the
> +		"cert_table" from SEV-ES Guest-Hypervisor Communication Block
> +		Standardization v2.03 Section 4.1.8.1 MSG_REPORT_REQ.
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56421.pdf
> +
> +What:		/sys/kernel/config/tsm/report/$name/provider
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) A name for the format-specification of @outblob like
> +		"sev-guest" [1]  or "tdx-guest" [2] in the near term, or a
> +		common standard format in the future.

Nit: /sys/kernel/config/tsm/report/report0/provider contains 
"sev_guest", i.e. "_", not "-".

> +
> +		[1]: SEV Secure Nested Paging Firmware ABI Specification
> +		Revision 1.55 Table 22
> +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56860.pdf
> +
> +		[2]: Intel® Trust Domain Extensions Data Center Attestation
> +		Primitives : Quote Generation Library and Quote Verification
> +		Library Revision 0.8 Appendix 4,5
> +		https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_DCAP_Quoting_Library_API.pdf
> +
> +What:		/sys/kernel/config/tsm/report/$name/generation
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) The value in this attribute increments each time @inblob or
> +		any option is written. Userspace can detect conflicts by
> +		checking generation before writing to any attribute and making
> +		sure the number of writes matches expectations after reading
> +		@outblob, or it can prevent conflicts by creating a report
> +		instance per requesting context.
> +
> +What:		/sys/kernel/config/tsm/report/$name/privlevel
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(WO) Attribute is visible if a TSM implementation provider
> +		supports the concept of attestation reports for TVMs running at
> +		different privilege levels, like SEV-SNP "VMPL", specify the
> +		privilege level via this attribute.  The minimum acceptable
> +		value is conveyed via @privlevel_floor and the maximum
> +		acceptable value is TSM_PRIVLEVEL_MAX (3).
> +
> +What:		/sys/kernel/config/tsm/report/$name/privlevel_floor
> +Date:		September, 2023
> +KernelVersion:	v6.7
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		(RO) Indicates the minimum permissible value that can be written
> +		to @privlevel.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..8acbeb029ba1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21889,6 +21889,14 @@ W:	https://github.com/srcres258/linux-doc
>   T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
>   F:	Documentation/translations/zh_TW/
>   
> +TRUSTED SECURITY MODULE (TSM) ATTESTATION REPORTS
> +M:	Dan Williams <dan.j.williams@intel.com>
> +L:	linux-coco@lists.linux.dev
> +S:	Maintained
> +F:	Documentation/ABI/testing/configfs-tsm
> +F:	drivers/virt/coco/tsm.c
> +F:	include/linux/tsm.h
> +
>   TTY LAYER AND SERIAL DRIVERS
>   M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>   M:	Jiri Slaby <jirislaby@kernel.org>
> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> index fc5c64f04c4a..87d142c1f932 100644
> --- a/drivers/virt/coco/Kconfig
> +++ b/drivers/virt/coco/Kconfig
> @@ -2,6 +2,11 @@
>   #
>   # Confidential computing related collateral
>   #
> +
> +config TSM_REPORTS
> +	select CONFIGFS_FS
> +	tristate
> +
>   source "drivers/virt/coco/efi_secret/Kconfig"
>   
>   source "drivers/virt/coco/sev-guest/Kconfig"
> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> index 55302ef719ad..18c1aba5edb7 100644
> --- a/drivers/virt/coco/Makefile
> +++ b/drivers/virt/coco/Makefile
> @@ -2,6 +2,7 @@
>   #
>   # Confidential computing related collateral
>   #
> +obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
>   obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
>   obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
>   obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
> diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> new file mode 100644
> index 000000000000..0200a86f1efe
> --- /dev/null
> +++ b/drivers/virt/coco/tsm.c
> @@ -0,0 +1,423 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2023 Intel Corporation. All rights reserved. */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/tsm.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/rwsem.h>
> +#include <linux/string.h>
> +#include <linux/module.h>
> +#include <linux/cleanup.h>
> +#include <linux/configfs.h>
> +
> +static struct tsm_provider {
> +	const struct tsm_ops *ops;
> +	const struct config_item_type *type;
> +	void *data;
> +} provider;
> +static DECLARE_RWSEM(tsm_rwsem);
> +
> +/**
> + * DOC: Trusted Security Module (TSM) Attestation Report Interface
> + *
> + * The TSM report interface is a common provider of blobs that facilitate
> + * attestation of a TVM (confidential computing guest) by an attestation
> + * service. A TSM report combines a user-defined blob (likely a public-key with
> + * a nonce for a key-exchange protocol) with a signed attestation report. That
> + * combined blob is then used to obtain secrets provided by an agent that can
> + * validate the attestation report. The expectation is that this interface is
> + * invoked infrequently, however configfs allows for multiple agents to
> + * own their own report generation instances to generate reports as
> + * often as needed.
> + *
> + * The attestation report format is TSM provider specific, when / if a standard
> + * materializes that can be published instead of the vendor layout. Until then
> + * the 'provider' attribute indicates the format of 'outblob', and optionally
> + * 'auxblob'.
> + */
> +
> +struct tsm_report_state {
> +	struct tsm_report report;
> +	unsigned long write_generation;
> +	unsigned long read_generation;
> +	struct config_item cfg;
> +};
> +
> +enum tsm_data_select {
> +	TSM_REPORT,
> +	TSM_CERTS,
> +};
> +
> +static struct tsm_report *to_tsm_report(struct config_item *cfg)
> +{
> +	struct tsm_report_state *state =
> +		container_of(cfg, struct tsm_report_state, cfg);

This be one line of 88 chars (less than allowed 100).

(I'll comment once on this, feel free to ignore :) )

> +
> +	return &state->report;
> +}
> +
> +static struct tsm_report_state *to_state(struct tsm_report *report)
> +{
> +	return container_of(report, struct tsm_report_state, report);
> +}
> +
> +static int try_advance_write_generation(struct tsm_report *report)
> +{
> +	struct tsm_report_state *state = to_state(report);
> +
> +	lockdep_assert_held_write(&tsm_rwsem);
> +
> +	/*
> +	 * Malicious or broken userspace has written enough times for
> +	 * read_generation == write_generation by modular arithmetic without an
> +	 * interim read. Stop accepting updates until the current report
> +	 * configuration is read.
> +	 */
> +	if (state->write_generation == state->read_generation - 1)
> +		return -EBUSY;
> +	state->write_generation++;
> +	return 0;
> +}
> +
> +static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
> +					  const char *buf, size_t len)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	unsigned int val;
> +	int rc;
> +
> +	rc = kstrtouint(buf, 0, &val);
> +	if (rc)
> +		return rc;
> +
> +	/*
> +	 * The valid privilege levels that a TSM might accept, if it accepts a
> +	 * privilege level setting at all, are a max of TSM_PRIVLEVEL_MAX (see
> +	 * SEV-SNP GHCB) and a minimum of a TSM selected floor value no less
> +	 * than 0.
> +	 */

Sounds like privlevel_floor should be "unsigned int" rather than "int".


> +	if (provider.ops->privlevel_floor > val || val > TSM_PRIVLEVEL_MAX)
> +		return -EINVAL;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc = try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +	report->desc.privlevel = val;
> +
> +	return len;
> +}
> +CONFIGFS_ATTR_WO(tsm_report_, privlevel);
> +
> +static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
> +					       char *buf)
> +{
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%u\n", provider.ops->privlevel_floor);

%d  or  change the type.

> +}
> +CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
> +
> +static ssize_t tsm_report_inblob_write(struct config_item *cfg,
> +				       const void *buf, size_t count)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	int rc;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	rc = try_advance_write_generation(report);
> +	if (rc)
> +		return rc;
> +
> +	report->desc.inblob_len = count;
> +	memcpy(report->desc.inblob, buf, count);
> +	return count;
> +}
> +CONFIGFS_BIN_ATTR_WO(tsm_report_, inblob, NULL, TSM_INBLOB_MAX);
> +
> +static ssize_t tsm_report_generation_show(struct config_item *cfg, char *buf)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	struct tsm_report_state *state = to_state(report);
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%lu\n", state->write_generation);
> +}
> +CONFIGFS_ATTR_RO(tsm_report_, generation);
> +
> +static ssize_t tsm_report_provider_show(struct config_item *cfg, char *buf)
> +{
> +	guard(rwsem_read)(&tsm_rwsem);
> +	return sysfs_emit(buf, "%s\n", provider.ops->name);
> +}
> +CONFIGFS_ATTR_RO(tsm_report_, provider);
> +
> +static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
> +			     enum tsm_data_select select)
> +{
> +	loff_t offset = 0;
> +	ssize_t len;
> +	u8 *out;
> +
> +	if (select == TSM_REPORT) {
> +		out = report->outblob;
> +		len = report->outblob_len;
> +	} else {
> +		out = report->auxblob;
> +		len = report->auxblob_len;
> +	}
> +
> +	/*
> +	 * Recall that a NULL @buf is configfs requesting the size of
> +	 * the buffer.
> +	 */

The comment can be one line (or even dropped as it is configfs api).

> +	if (!buf)
> +		return len;
> +	return memory_read_from_buffer(buf, count, &offset, out, len);
> +}
> +
> +static ssize_t read_cached_report(struct tsm_report *report, void *buf,
> +				  size_t count, enum tsm_data_select select)
> +{
> +	struct tsm_report_state *state = to_state(report);
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	if (!report->desc.inblob_len)
> +		return -EINVAL;
> +
> +	/*
> +	 * A given TSM backend always fills in ->outblob regardless of
> +	 * whether the report includes an auxblob or not.
> +	 */
> +	if (!report->outblob ||
> +	    state->read_generation != state->write_generation)
> +		return -EWOULDBLOCK;
> +
> +	return __read_report(report, buf, count, select);
> +}
> +
> +static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
> +			       size_t count, enum tsm_data_select select)
> +{
> +	struct tsm_report_state *state = to_state(report);
> +	const struct tsm_ops *ops;
> +	ssize_t rc;
> +
> +	/* try to read from the existing report if present and valid... */
> +	rc = read_cached_report(report, buf, count, select);
> +	if (rc >= 0 || rc != -EWOULDBLOCK)
> +		return rc;
> +
> +	/* slow path, report may need to be regenerated... */
> +	guard(rwsem_write)(&tsm_rwsem);
> +	ops = provider.ops;
> +	if (!report->desc.inblob_len)
> +		return -EINVAL;
> +
> +	/* did another thread already generate this report? */
> +	if (report->outblob &&
> +	    state->read_generation == state->write_generation)
> +		goto out;
> +	kvfree(report->outblob);
> +	kvfree(report->auxblob);
> +	report->outblob = NULL;
> +	report->auxblob = NULL;
> +	rc = ops->report_new(report, provider.data);


Drop @ops and use "provider.ops" here?

> +	if (rc < 0)
> +		return rc;
> +	state->read_generation = state->write_generation;
> +out:
> +	return __read_report(report, buf, count, select);
> +}
> +
> +static ssize_t tsm_report_outblob_read(struct config_item *cfg, void *buf,
> +				       size_t count)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +
> +	return tsm_report_read(report, buf, count, TSM_REPORT);
> +}
> +CONFIGFS_BIN_ATTR_RO(tsm_report_, outblob, NULL, TSM_OUTBLOB_MAX);
> +
> +static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void *buf,
> +				       size_t count)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +
> +	return tsm_report_read(report, buf, count, TSM_CERTS);
> +}
> +CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
> +
> +#define TSM_DEFAULT_ATTRS() \

imho this one and TSM_DEFAULT_BIN_ATTRS are not really helping with 
readability or a size :)

> +	&tsm_report_attr_generation, \
> +	&tsm_report_attr_provider
> +
> +static struct configfs_attribute *tsm_report_attrs[] = {
> +	TSM_DEFAULT_ATTRS(),
> +	NULL,
> +};
> +
> +#define TSM_DEFAULT_BIN_ATTRS() \
> +	&tsm_report_attr_inblob, \
> +	&tsm_report_attr_outblob
> +
> +static struct configfs_bin_attribute *tsm_report_bin_attrs[] = {
> +	TSM_DEFAULT_BIN_ATTRS(),
> +	NULL,
> +};
> +
> +static struct configfs_bin_attribute *tsm_report_bin_extra_attrs[] = {
> +	TSM_DEFAULT_BIN_ATTRS(),
> +	&tsm_report_attr_auxblob,
> +	NULL,
> +};
> +
> +static struct configfs_attribute *tsm_report_extra_attrs[] = {
> +	TSM_DEFAULT_ATTRS(),
> +	&tsm_report_attr_privlevel,
> +	&tsm_report_attr_privlevel_floor,
> +	NULL,
> +};
> +
> +static void tsm_report_item_release(struct config_item *cfg)
> +{
> +	struct tsm_report *report = to_tsm_report(cfg);
> +	struct tsm_report_state *state = to_state(report);
> +
> +	kvfree(report->auxblob);
> +	kvfree(report->outblob);
> +	kfree(state);
> +}
> +
> +static struct configfs_item_operations tsm_report_item_ops = {
> +	.release = tsm_report_item_release,
> +};
> +
> +const struct config_item_type tsm_report_default_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_bin_attrs = tsm_report_bin_attrs,
> +	.ct_attrs = tsm_report_attrs,
> +	.ct_item_ops = &tsm_report_item_ops,
> +};
> +EXPORT_SYMBOL_GPL(tsm_report_default_type);
> +
> +const struct config_item_type tsm_report_ext_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_bin_attrs = tsm_report_bin_extra_attrs,
> +	.ct_attrs = tsm_report_extra_attrs,
> +	.ct_item_ops = &tsm_report_item_ops,
> +};
> +EXPORT_SYMBOL_GPL(tsm_report_ext_type);
> +
> +static struct config_item *tsm_report_make_item(struct config_group *group,
> +						const char *name)
> +{
> +	struct tsm_report_state *state;
> +
> +	guard(rwsem_read)(&tsm_rwsem);
> +	if (!provider.ops)
> +		return ERR_PTR(-ENXIO);
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	config_item_init_type_name(&state->cfg, name, provider.type);
> +	return &state->cfg;
> +}
> +
> +static struct configfs_group_operations tsm_report_group_ops = {
> +	.make_item = tsm_report_make_item,
> +};
> +
> +static const struct config_item_type tsm_reports_type = {
> +	.ct_owner = THIS_MODULE,
> +	.ct_group_ops = &tsm_report_group_ops,
> +};
> +
> +static const struct config_item_type tsm_root_group_type = {
> +	.ct_owner = THIS_MODULE,
> +};
> +
> +static struct configfs_subsystem tsm_configfs = {
> +	.su_group = {
> +		.cg_item = {
> +			.ci_namebuf = "tsm",
> +			.ci_type = &tsm_root_group_type,
> +		},
> +	},
> +	.su_mutex = __MUTEX_INITIALIZER(tsm_configfs.su_mutex),
> +};
> +
> +static struct config_group *tsm_report_group;

A little confusing thing is that this guy is neither near the beginning 
of the file (with other statics, this could even be a member of 
tsm_provider) nor the code which sets/clears it - tsm_init/tsm_unregister.


> +
> +int tsm_register(const struct tsm_ops *ops, void *priv,
> +		 const struct config_item_type *type)
> +{
> +	const struct tsm_ops *conflict;
> +
> +	if (!type)
> +		type = &tsm_report_default_type;
> +	if (!(type == &tsm_report_default_type || type == &tsm_report_ext_type))
> +		return -EINVAL;
> +
> +	guard(rwsem_write)(&tsm_rwsem);
> +	conflict = provider.ops;

Is a new local variable really needed here?

> +	if (conflict) {
> +		pr_err("\"%s\" ops already registered\n", conflict->name);
> +		return -EBUSY;
> +	}
> +
> +	provider.ops = ops;
> +	provider.data = priv;
> +	provider.type = type;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tsm_register);
> +
> +int tsm_unregister(const struct tsm_ops *ops)
> +{
> +	guard(rwsem_write)(&tsm_rwsem);
> +	if (ops != provider.ops)
> +		return -EBUSY;
> +	provider.ops = NULL;
> +	provider.data = NULL;
> +	provider.type = NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(tsm_unregister);
> +
> +static int __init tsm_init(void)
> +{
> +	struct config_group *root = &tsm_configfs.su_group;
> +	struct config_group *tsm;
> +	int rc;
> +
> +	config_group_init(root);
> +	rc = configfs_register_subsystem(&tsm_configfs);
> +	if (rc)
> +		return rc;
> +
> +	tsm = configfs_register_default_group(root, "report",
> +					      &tsm_reports_type);
> +	if (IS_ERR(tsm)) {
> +		configfs_unregister_subsystem(&tsm_configfs);
> +		return PTR_ERR(tsm);
> +	}
> +	tsm_report_group = tsm;
> +
> +	return 0;
> +}
> +module_init(tsm_init);
> +
> +static void __exit tsm_exit(void)
> +{
> +	configfs_unregister_default_group(tsm_report_group);
> +	configfs_unregister_subsystem(&tsm_configfs);
> +}
> +module_exit(tsm_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Provide Trusted Security Module attestation reports via configfs");
> diff --git a/include/linux/tsm.h b/include/linux/tsm.h
> new file mode 100644
> index 000000000000..5fadc382064d
> --- /dev/null
> +++ b/include/linux/tsm.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TSM_H
> +#define __TSM_H
> +
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +#include <linux/device.h>

device.h is not needed.

> +
> +#define TSM_INBLOB_MAX 64
> +#define TSM_OUTBLOB_MAX SZ_32K
> +
> +/*
> + * Privilege level is a nested permission concept to allow confidential
> + * guests to partition address space, 4-levels are supported.
> + */
> +#define TSM_PRIVLEVEL_MAX 3
> +
> +/**
> + * struct tsm_desc - option descriptor for generating tsm report blobs
> + * @privlevel: optional privilege level to associate with @outblob
> + * @inblob_len: sizeof @inblob
> + * @inblob: arbitrary input data
> + */
> +struct tsm_desc {
> +	unsigned int privlevel;
> +	size_t inblob_len;
> +	u8 inblob[TSM_INBLOB_MAX];
> +};
> +
> +/**
> + * struct tsm_report - track state of report generation relative to options
> + * @desc: input parameters to @report_new()
> + * @outblob_len: sizeof(@outblob)
> + * @outblob: generated evidence to provider to the attestation agent
> + * @auxblob_len: sizeof(@auxblob)
> + * @auxblob: (optional) auxiliary data to the report (e.g. certificate data)
> + */
> +struct tsm_report {
> +	struct tsm_desc desc;
> +	size_t outblob_len;
> +	u8 *outblob;
> +	size_t auxblob_len;
> +	u8 *auxblob;
> +};
> +
> +/**
> + * struct tsm_ops - attributes and operations for tsm instances
> + * @name: tsm id reflected in /sys/kernel/config/tsm/report/$report/provider
> + * @privlevel_floor: convey base privlevel for nested scenarios
> + * @report_new: Populate @report with the report blob and auxblob
> + * (optional), return 0 on successful population, or -errno otherwise
> + *
> + * Implementation specific ops, only one is expected to be registered at
> + * a time i.e. only one of "sev-guest", "tdx-guest", etc.
> + */
> +struct tsm_ops {
> +	const char *name;
> +	const int privlevel_floor;
> +	int (*report_new)(struct tsm_report *report, void *data);
> +};
> +
> +extern const struct config_item_type tsm_report_ext_type;
> +extern const struct config_item_type tsm_report_default_type;
> +
> +int tsm_register(const struct tsm_ops *ops, void *priv,
> +		 const struct config_item_type *type);
> +int tsm_unregister(const struct tsm_ops *ops);
> +#endif /* __TSM_H */
> 

-- 
Alexey

