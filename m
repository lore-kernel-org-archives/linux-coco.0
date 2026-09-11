Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC1585966
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158278; cv=fail; b=A2HePbY1f44IMGFfXpgCCEYvzKcRlukVOH9Vgg1B8DSwQQPZpXpR6ZVK8lMmYIAHAXQOXNQCJpJv5quCfiOqGShGGWgDuKflUyPe5GRxfMgNdiye4n/cojBqBfpxSZ2qWZKR1vNwJX3qSRdDHpMnSNbzS19Ivuj34cxToFlbVc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158278; c=relaxed/simple;
	bh=xLcD/OYjLNvAwroBSdSkHbWoZbjeu5LJkJBFwqW3mX8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DLfjkzD8u+E4trFsa7RnUQthSA6auJcX0Y1BBNqVeMhq540tS6/CXJGlTXAPYUiSVzUMXKV6DJVCrVd2ulqVdW9Ro08cw3Us0XppneRUPnxwd3m6LkGLCqza0prKrjecpkJCKa69ySNon1WM5iRCsYiy0/+v7GxVG62YNIxrvJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XGklU2Pr; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XGklU2Pr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlqX+ST2Seh+6yjtlKIjbBJe6fO29VtIcyMQF2wiPTiVmZJx/d3OZBN+rZkKKEtEnY90HP3NnZAbgZ8jR7xVDSUrH40s8meXKLOC13m2mzSM4DvEx3FVGYdXYbHTccthTyxbz4Vm0xOAdzXc8j7sUrMsfLBewJxMkdmY6ul5l8GpCW06HLBy4HMqbaAQC4T1A3ero1avKVaUWof4hI4KAqIlBvXU3OjFUFm+fGX57ZecDEdf8WaiYS3v6lRCatIukMCQIxy3t5WX0K5bNBqo0XkXpof2j87WNOgsh+G33I3rfPV3TzqbfjAFOwvorUpENX4xmH8RaE5iiGYmNl7W0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHRpOJtmVRZNh7w6U/1HhMcLvpf8pXVxEnNDVrbTBPQ=;
 b=SINt3WKVKr0//oGuIWK1giwwgtnJv6RNpLKG9T5IddzZuHOWeuZG0kdEBR7NLd8lRvq4q12sKH663JXmZmCKheslYiS9cAvmtiRg3uoc577X+8O4gKKLqFvTu/G4zNYCpl2K/9z4iya/Z9zwUccOKN/Kej3TOrCJeqBF0KZFPWES28SJUB3WO3IZNmlS+Jgrg1iVFisay86C8r2iK8NVaK03hwB3lyAaU04byh+cy708E+UI1ddfB0m/Mw07isDEgZVDUMuEszOa2TCZQPKHEs+CTV62Tp1I7fmv6YOHuiNJ3r+dLv/7LKm2pdESZPqnA8Fqzkxa8+tHODfUC9g1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHRpOJtmVRZNh7w6U/1HhMcLvpf8pXVxEnNDVrbTBPQ=;
 b=XGklU2PrO3v7ZSo5S2MH1YbusU4VZVPL0yDrqjt4X1s0dlZ2z3R6icLQmyvzKiuOW7VvqhhGEkPGH8H4jXzO2iERtQxgcbii5plIhz7FfRBnbW0qhDhLCTEyn7PlKO6k+2zdntWvrrmmd7ReCXf8wWAI4KPtqlkwQ01gGCEFabg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by DSVPR12MB999284.namprd12.prod.outlook.com (2603:10b6:8:41d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 20:24:24 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 20:24:24 +0000
Message-ID: <7b1574d9-5398-465b-9649-9073e7429d2a@amd.com>
Date: Fri, 11 Sep 2026 15:24:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/coco: Add CC_ATTR_GUEST_SEV
To: Borislav Petkov <bp@alien8.de>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?=
 <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, hpa@zytor.com,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 Joerg Roedel <joerg.roedel@amd.com>
References: <20260803125827.718024-1-joro@8bytes.org>
 <20260803125827.718024-2-joro@8bytes.org>
 <20260910024027.GEaqIYmy___31vI-iZ@fat_crate.local>
 <20260910033546.GAaqIlkhwE9V2vbz-l@fat_crate.local>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260910033546.GAaqIlkhwE9V2vbz-l@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:610:33::28) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|DSVPR12MB999284:EE_
X-MS-Office365-Filtering-Correlation-Id: b4928426-a53a-45cb-e042-08df1042ab6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	WjkXppIeBwvNBjOEg9aEd8CLJmQvqYuc+LwlSTg8yrXfxqjGXKuE9kqAGa/LFdt7zwR1PBcPEpGSnUMi1Aj089D3fgfNJPYOQAyMl4MrMRMYGN49CxBS5Bh6L4/hWulst0clOzxRcav5+AJjSXq24I2thN18uX1z+0YO0UNWBkiIlpyfcoDP5CKsBF3qoygt6gGThY6WpkFDLBefFaPKCAux1VeEsyKgkGKVOjr702Ljd5RTojXaXfePx0dycd8z66Nwc9Rinb9+Cn+YNFaNf2Lb0/m49Ju/nRfnKcpEGS5LvnNC/9tHiK+rxTusj7uoQS4TG5eM1HMqb91khxT9eRtAaDe6t+vLHnAJTtbtefZSM+xJl51J7VQXKsuKswvG8MnGIaAhSSV5RRbpvluABUJrvxMlDiX5OchfYaksIo6Wf5Dgt/krXzqVfpzVeDonLY7tF+95GDM7j2bPvaOxQ6QCpfzthSMUBdhKaVxIAAdIo0LnoBXSQU9ys7JL+3YxX/R0iXSm7NOusHBzRNYhBmVjbYIM3/XBnERG/MfyYuPhlrIQm+slfkpez4rc0bNUl0T/vbmHRKEwSlSs843oxbrwJ8nNlWaFJkLCQjeo5pJbosZNMhzepQxb3y61RG0N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cElxOU5oK1duZDRmWW13Wk5QM2VQTmRFTkJnc2doM2M5ZjhZdzVCMzFxUnZy?=
 =?utf-8?B?ZFhpWnBGV2p4RWR5SUFCK2ZBSXhWN1krRnZiQ0FBTmdlalpHa0NiRmxRblpC?=
 =?utf-8?B?bnRZcHhFMUtsZW9TQUxoc1piMVQrdnVyZlRhU21YdzUvTVBVcE03NzdYNHNp?=
 =?utf-8?B?R3RsamY0V1NWeUw4U3FUQkRGS3dQOGNBdGk0NEZHckNBS0VNUFVnMzZZdUZ4?=
 =?utf-8?B?YzZCWlVYTnl3cytRMUhBbTJBT29tRndpS2dyRkhJbG1XT0ViRVJOaTYyNEJQ?=
 =?utf-8?B?bjE5bU1tRTNFRmg3QUxQaFVBMXNkYzEydzczS1h1bnBzbllPWTR2TlV5bktQ?=
 =?utf-8?B?VVFBM09OR2w3VWRQOFlZdExKTk03Wmh4RThuM3k4UG5sc2VIR3ZEUmlldkhM?=
 =?utf-8?B?WjkzdmtaZldwdnVwYTlGeGRwcTMyU25teEdOOHJ2NVNUZFp4aWZHTm5ld3d4?=
 =?utf-8?B?dnJZWUZDcmIxMldkMWV1dUs5QTN3WDVDTzZkZi9RUmR4cU9VVW1OeWVGdHB2?=
 =?utf-8?B?R3hPUGpWVTEycjc1MDA5K01qdDQwZCt4cnhqZ1NacVJodzUxOGpVN1JLbHVJ?=
 =?utf-8?B?Wm1ydFU0OHBaSGRMalIzS1d6dFM2Qk1QMVQvUU1iVXF6SDBaQUlVMlpGdFgw?=
 =?utf-8?B?dVlXNlU5UUpDbXUraDBVQW9kcU9KUUdFbmN4MDR4b0xwY1hQWEd0SU94M0lZ?=
 =?utf-8?B?WFJURWpncjFmNkZIUFI2QlBuQlJzaDNTU3RJbXFUdnQrQytRVnJ4eVJmbFcy?=
 =?utf-8?B?bkJJTUtHVU1Xb3RWeWhlQkxUU2ZVcUhaQWxZVCt6ZWVmTXNXQmhCZklDdy8r?=
 =?utf-8?B?QnJDWFQ2TU9pTTJDT3d5ZGV0QStsT3pwL3F6dE9lVWNkNVVQeENxcXhtT3pM?=
 =?utf-8?B?TGJWODVvd0YxeWRQU3l0aFlvM2U4RlhwRTV0a3N5d3Z1aVA3NzlkZElFV1la?=
 =?utf-8?B?dkNTYUZZL04rTzVqTW1nQnE2dXdTMzBwN1RKTTJ5dnFaMWZWUEZVMFV0c240?=
 =?utf-8?B?Smc1NW03Ry80MzRYY2FraXBCUHFwWk5nWGJUZytrL1B2QXBURHozYlRJL2Rz?=
 =?utf-8?B?Z0FUaWp1VUN6UHlyZ3pCWVh5OGovTm5UNW5wakpKeFRrWVdGQjczS1JqZ2wv?=
 =?utf-8?B?bE9yYUEvV0FhMnY2ODE2ZEtCZ3UrQm9BZE5BRHJ2QXowYVZtK1A0ZU5uNTZI?=
 =?utf-8?B?YVhZYmoxMmFxT0hJdks4RW1OSS8yendudWQzSFdtRjdXMlZxeGhLRXphbEdG?=
 =?utf-8?B?MU9RMVJvamVXaDRRMFliTWtUeXdGSXU4am5Xdk9tUUpJMWdpVXpXbDAzKzEv?=
 =?utf-8?B?TmRrbGZBUGM0TlNlNDF5SHZyQ2IwNmg5cS9ybWtKTVUyWVRKVlVacndVMFV1?=
 =?utf-8?B?VnRRMU54NmZ1VU5aamdpUWhNQWFUOVRwc0hHR3krN05rU0ZVTFJ4dG4wdlBP?=
 =?utf-8?B?bkpySkdJTlQ4RVVsaGlod3psL1RhTWg1a1pvWXpnQ29CN3ZHUHVTMFU0NDgr?=
 =?utf-8?B?azUwMS93bUdkSFRSeXlPQjVGSWJuTjlQbXBZNkpNN25vUEhJeWxIQlh6Nzdh?=
 =?utf-8?B?QUNxQndySkhZb1BlakliMkFaUHdkcnNmb1UwQmlqaG9HMVBLNDgzZVJqdzZj?=
 =?utf-8?B?TUhQUUhwVzV1cFViUDd3Tlc4aW0wbHZFdTE0SHRuVGhFS3E4dURoQ1JKNnV0?=
 =?utf-8?B?RHQrNW1mUzl5TExGOGFyaitKQWxncWFlY3ZNYi9yZkp5aTdQcGxLM2ZoNkg5?=
 =?utf-8?B?ZjFjWnlaMmZCUnNwanhyTGVpRXBySDIrVHdoVDJyNXRNN1NxMFlZZ241SDd4?=
 =?utf-8?B?NTU4dXlnSjZJRDc4VTZzam5vQTF3SkFwZ0QwclVmVGpEYkhBeEM0ci9DVk5y?=
 =?utf-8?B?Qko0MGFrV25WWUhveDBldzF1VzI5M2Jvd0VYZmtHMzJKT25BZDJ2SUM3K25O?=
 =?utf-8?B?MjBHdk4veHJjbVNCOWorV2xUUkhnTWc5UHZodldBVlVlMzBzWHY2dzBQR3ZH?=
 =?utf-8?B?RUx6NGJpcTZLcFNwcTdYT05IWko4NjJSRFJVODlGb3hEc0s4WDJqZko1RDAx?=
 =?utf-8?B?Q0drUXliby9wWE9sTFZDQlN5R3U0aktEWkhlVStYWWRONllucGZXY2RNMndo?=
 =?utf-8?B?akFrYnlLVE9idGxFcFlKdUxnMFdHNkhuZEJqUjRlK1l5VHpGUkRha0trWEZJ?=
 =?utf-8?B?YXlXSUZTTWpWVjZXR3oxaEtkUklPaWRHQUlYcVdqampqVTNkbkVDWmw5dGxL?=
 =?utf-8?B?S01HQTNnT3FHOGQ2SkN2M3FjVXRLOVpaVlVBVHdIaGdiaTdpZXNCWmNyZTd3?=
 =?utf-8?Q?8WsZY47wN+1h9YwgXt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4928426-a53a-45cb-e042-08df1042ab6f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 20:24:24.2726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcZBbG2aa5ctDkGhf8IliPOUf9r7p7SmVgYzBcmHnGSXrtsduQhynxgA/z4tWgx/Hj83EqJyMrTplGFmCg6PrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999284

On 9/9/26 22:35, Borislav Petkov wrote:
> On Wed, Sep 09, 2026 at 07:40:27PM -0700, Borislav Petkov wrote:
>> On Mon, Aug 03, 2026 at 02:58:25PM +0200, Jörg Rödel wrote:
>>> From: Joerg Roedel <joerg.roedel@amd.com>
>>>
>>> Add a new attribute to the CC platform code to check whether the
>>> kernel runs in an environment using SEV memory encryption. This will
>>> be used to establish the an sev/ directory in SYSFS (which is
>>> currently SEV-SNP-only).
>>
>> Yeah, the initial intention for cc_plaform_has() is to use it in arch-agnostic
>> code and for something which you're going to use in coco code itself, you're
>> better off simply doing:
>>
>> 	if (sev_status & MSR_AMD64_SEV_ENABLED)
>>
>> I can fix that up when applying if you prefer - it is easy enough.
> 
> IOW, I merged them all three into this simple one.
> 
> Author: Joerg Roedel <joerg.roedel@amd.com>
> Date:   Mon Aug 3 14:58:25 2026 +0200
> 
>     x86/sev: Report MSR_AMD64_SEV in sysfs
>     
>     Add SEV_STATUS to the cpu/sev/ sysfs hierarchy and report it for all SEV
>     guest types.
>     
>       [ bp: Merge into a single patch, simplify. ]
>     
>     Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
>     Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
>     Link: https://patch.msgid.link/20260803125827.718024-2-joro@8bytes.org

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Minor nit below, up to you.

> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 82d10d556cc8..cec413a71491 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -690,15 +690,20 @@ Description:	Umwait control
>  
>  What:		/sys/devices/system/cpu/sev
>  		/sys/devices/system/cpu/sev/vmpl
> +		/sys/devices/system/cpu/sev/sev_status

See below...

>  Date:		May 2024
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:	Secure Encrypted Virtualization (SEV) information
>  
> -		This directory is only present when running as an SEV-SNP guest.
> +		This directory is only present when running as an SEV guest.
>  
>  		vmpl: Reports the Virtual Machine Privilege Level (VMPL) at which
> -		      the SEV-SNP guest is running.
> +		      the SEV-SNP guest is running. This file is only present
> +		      when running as an SEV-SNP guest.
>  
> +		sev_status: Reports the value of the SEV_STATUS MSR which
> +			    enumerates the enabled features of an SEV
> +			    environment.

Maybe try to keep in alphabetical order and move above the vmpl entry?

Thanks,
Tom

>  
>  What:		/sys/devices/system/cpu/svm
>  Date:		August 2019
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index ec8fc02bd636..4751bfbe694f 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -1431,15 +1431,22 @@ static ssize_t vmpl_show(struct kobject *kobj,
>  	return sysfs_emit(buf, "%d\n", snp_vmpl);
>  }
>  
> +static ssize_t sev_status_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "0x%llx\n", sev_status);
> +}
> +
>  static struct kobj_attribute vmpl_attr = __ATTR_RO(vmpl);
> +static struct kobj_attribute sev_status_attr = __ATTR_RO(sev_status);
>  
> -static struct attribute *vmpl_attrs[] = {
> -	&vmpl_attr.attr,
> +static struct attribute *sev_status_attrs[] = {
> +	&sev_status_attr.attr,
>  	NULL
>  };
>  
>  static struct attribute_group sev_attr_group = {
> -	.attrs = vmpl_attrs,
> +	.attrs = sev_status_attrs,
>  };
>  
>  static int __init sev_sysfs_init(void)
> @@ -1448,7 +1455,7 @@ static int __init sev_sysfs_init(void)
>  	struct device *dev_root;
>  	int ret;
>  
> -	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
> +	if (!(sev_status & MSR_AMD64_SEV_ENABLED))
>  		return -ENODEV;
>  
>  	dev_root = bus_get_dev_root(&cpu_subsys);
> @@ -1463,7 +1470,20 @@ static int __init sev_sysfs_init(void)
>  
>  	ret = sysfs_create_group(sev_kobj, &sev_attr_group);
>  	if (ret)
> -		kobject_put(sev_kobj);
> +		goto drop_kobj;
> +
> +	if (sev_status & MSR_AMD64_SEV_SNP_ENABLED) {
> +		ret = sysfs_add_file_to_group(sev_kobj, &vmpl_attr.attr, NULL);
> +		if (ret)
> +			goto drop_sysfs;
> +	}
> +
> +	return 0;
> +
> +drop_sysfs:
> +	sysfs_remove_group(sev_kobj, &sev_attr_group);
> +drop_kobj:
> +	kobject_put(sev_kobj);
>  
>  	return ret;
>  }
> 
>>
>> -- 
>> Regards/Gruss,
>>     Boris.
>>
>> https://people.kernel.org/tglx/notes-about-netiquette
> 

