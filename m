Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6D15383A
	for <linux-coco@lists.linux.dev>; Tue,  4 Mar 2025 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741112748; cv=fail; b=esNlYeT4gcmKWlpu1o6cy0XfDLU72uJNHOR1IC7eVDixCao3rD7/KVh0jWipGlZnVWhV2cAFX4Mlz0fzCB63Ks620gmZUPc1ppjKsBFaVfqILzxHrNM1QX+6T46D8RPF3lkNtJb4N3SxG1DS9sJokw2VQwmV4Nkhu+VfVGkYhyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741112748; c=relaxed/simple;
	bh=XWlZIvjEUPTcrOotNWLY5Nr5Z/W6P6l9uR7gW/lnTrE=;
	h=Message-ID:Date:To:Cc:References:From:Subject:In-Reply-To:
	 Content-Type:MIME-Version; b=L3hu9k04lSffH5cjrH8N2GKax5yqPwkjnW9EX7yf5BFsgIwHI3bmjNAlR2Ogl13JQta+sN5uukeOcjV6BV7WAvsR1MfgLtHXC4ApisClLniabSKCHzoT2j+U3mhb+HNeD4nB6TIVy8iR6rU6dMkcHuVoexvZQRTSjQ3n3534rn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WeQcLDgT; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WeQcLDgT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohIcZz/3l7TKX3G/gi2UdHGN3uCxXCz3bNflESwCw6XdWyoyODBtLvrVyS+rVStmg54snOpgX6XCU5uKPfOADQiditwIETooriLrg5WnVLl32R8zv73GzZW1tKrn0Sx+ft0CKu/pmI6b7Fnt/pYZamJm85Cy8H6n6+JVkuJfFRr6BsGXndJophMdPtQwKpSKnl82ZpZVQ+1PsGeidat+oztu9t2pRoFLSU+KnAP4ivPdrbyec1i3ubJdgiUL5n1LCAM+3ABk+4p9nsSWkYMdVTtVJYJeTUhKic7kkXJhiHqo6GwKdfRn9YQwnansQBLFC2ZIgrlb66ei/d7GLRiYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PLA7jwpotmNIp2iMnwAMtvFuWHaV0h9+lE2VySpDWM=;
 b=tPx84OA3/t8g3cCt/goqeDFY6S8pXaR/brPDGbJUiyWf6tpekLR7WNkDPORzI9RhmYJpHO0yWrhJ5cwjes9LYgHtJ0yuQmxyjS4GyxQVOlWvdFyKZtdXyNO/+Vo0sMI0Vn9k7HCWMdFpOsfQP9I4Mo8IBj6XCOkZavBvGwzIt+l70AiM+D6T+DDTG0WhfG8pjbwHo2QjOi5tFC2NZHWvIc7RQ8stWer//htye9XOAMSHf3Wqa1YxwftKurpPn4/3+hZJ3Nty6sDUvuuBcpDcQr8734KV6kemD+uGi3ihw37rloTfPUy6XMw7jxhfuhDAuMU7T/jklz3rln1GRKplrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PLA7jwpotmNIp2iMnwAMtvFuWHaV0h9+lE2VySpDWM=;
 b=WeQcLDgTvmUqkNO97iZyNv9YzMAA6HZvcZi2Q206vnR7vTQVIJ8V4UHCkasqgHipen1uZVQT3TQGoI5ehTGJD+PmQyciBjmCFZGH+rrPLUd1fRgJxY5EofikcdL7lIPcWS59gzHv2LOmLTDQWdpBqHD82H5Kvl2udbeSOEnXEG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Tue, 4 Mar
 2025 18:25:44 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.8511.015; Tue, 4 Mar 2025
 18:25:44 +0000
Message-ID: <72aa1388-4bd4-5444-8b5c-59c063a17cb5@amd.com>
Date: Tue, 4 Mar 2025 12:25:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Claudio Carvalho <cclaudio@linux.ibm.com>, svsm-devel@coconut-svsm.dev,
 linux-coco@lists.linux.dev
References: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: SVSM_VTPM_CMD Call question
In-Reply-To: <CAGxU2F55-JDYqt62rg6HUVEZo4voHrsuPizYxv7mWO+PE0fM-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:806:27::9) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 449ff362-0d2a-45c2-9dad-08dd5b49f9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2xTbFZZQTM3RHFMdnRuaVg2cnBPd2kvMm5ZcDVBVHhaMkxiSVM1QTRmVkl0?=
 =?utf-8?B?L3hKb1o5cmk4blRHU2Q5VVVUN0lCK2xOSG5KeGY0a0s0Z2hqdGtlL0lqNnRs?=
 =?utf-8?B?L3RQSEpqWTJweS9lRUZDZFkrRkNla3BlVDlKR2NQcG41SGo2cWhVelNpQ2wr?=
 =?utf-8?B?MFl4RG5hNkxuSGh0WVlpaUlPb0hTUHNua3hpMDVIUE5MZGpIRFkwalJBUlZJ?=
 =?utf-8?B?OWZmMDh1dktlcWgyaHF5UW5aRm52czgzQTdRTktxQ2JzYlhuRWNhTTFjVVVs?=
 =?utf-8?B?ZVZwZlIvVmFaM3U1akd5c0ZIMkVsUzRPdXNYTU8yZjJ1QVhKZytSR3JhWExX?=
 =?utf-8?B?NURNSUZVajBDL0VFakJlV0ZYVmUwYzZ5ZmcwOUlYQWNGUEhtZ0oxUGZqbktM?=
 =?utf-8?B?Y0QwSzZ5VXREWjNPYzlKZnhVTGs0RGRrV25iNFBpYjdEcDREREV5U2Q4RVQy?=
 =?utf-8?B?RHJRakpudG8vWU5VbWU1bE5TQU1yWDZyVld1MHkzWGtndEVlRUI5clh0R0cz?=
 =?utf-8?B?NTA3YW1FSzVyQzcrMDQ3d25EQ0Mzb3Y4dTNyaUUxb1k3bWpUZGxaSXBFa2Qw?=
 =?utf-8?B?VUNyVnRhOHMxY0Q4Ni9ZTFB4d1R2WkNYNnRIWVM5ay85cnpXS0huUkh1VlZv?=
 =?utf-8?B?c2toU3ZvR21WRXk1bWlNWDE5M0tUL2xzRTlrelIrcVN5RGNTUjdJY0NUWkhY?=
 =?utf-8?B?OVNnaGdHNmMxR3BVdmplamY5Ui9RUGJQaG1wSVFVU0ZWOTlOQUpseU5CblVW?=
 =?utf-8?B?SkRBTC94K1NIM1NWUm9MY2ROL1JNYnFnVEJhRm1Eby9ZNHNLUkFXdFNwbHhH?=
 =?utf-8?B?NTNTY2grM1I0VmwvUHZUeWFtbldLK21TTDF3UUJyVFBBSWswQTlzZ1JGcmxp?=
 =?utf-8?B?ZGluNEdRK1ArRFY2V0NSUU1LVzJFN3FqeDBnb3VWUnpqS2ZrM2k3NHl1ODJH?=
 =?utf-8?B?QnlrOEIzS20wTXNWdm5PNTl6bU16RGlZVWNvMVZFTUw1TGVRTUU2SzNKblZs?=
 =?utf-8?B?alBKUWt2bk1RQ2ZsVkNNWWc5VGxoNE83N2VFWnhUdmNEcmg1bkgvR2c0RnpB?=
 =?utf-8?B?N0hhSXY1Ly9PbUZhREVPT1h3Y1VlK2NVVEFzUWp0cWdkQXhna2tGRG1maE8z?=
 =?utf-8?B?RFpuQUM1ejFOL3oyZktadjE2RG4yNndXUEtsQlpYdlVEVnVVRHRUN1RNQjBz?=
 =?utf-8?B?Z1NnTmt1WXdYcUhjUGptZE8xeHMwcnY4VmtQRjFpQkkzY09nOVk0VVFucnhm?=
 =?utf-8?B?emZMbml1RjNGV0s0VUFZVVN1ZU1IdnRkRGkrZHMxYnRFYTZ0TXhBK0NYL0lQ?=
 =?utf-8?B?Y2pueTFjTHdkdDBoNWxsbUZTODVjVWpmTlVBaEZDaWRuNEJKdzNwRGRvMHZN?=
 =?utf-8?B?TFovcVdjRzFEYXRaaTU1U2s1SkpYclMxTm41WGFjNlBNTkhXcTNtUUY2eGJ4?=
 =?utf-8?B?a3M3Mkx1RUZYQ2p5YnVpbjlqM1RZRWh0YUhCeFB6R1h0MDFUVzhtY1hzRUl2?=
 =?utf-8?B?VC9DdTdIYTZxV2tLZ1k2a0NVZU5DSDVJYkVpNU5kdTcybGZhVG9ZdVcxVzhX?=
 =?utf-8?B?UmRvRkNwL0tWUHhvK2ZqV092THZQUWRsemIrWVY2bHd6Skg2MEgzT3RLQWkw?=
 =?utf-8?B?WXlsdDhlYUlNdklybngzZkg3Y1lCMG41ZFVpTzNlbE5DQWh5RjJDWkR0TTBX?=
 =?utf-8?B?NVNpTi9uVzAxS1g5Q3NjMk9BYjFzNDREVnZ1bWtkamsrSWtlVS9vSEl1Mjh4?=
 =?utf-8?B?NjBrU2JHdWFiUllMemVBbnlFUGdvWksxREtlcjNwd2ZKZDlHVzUwajRabFN2?=
 =?utf-8?B?b1EybGFpZUkzWWkwTENuUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0JQcU9SektqcFFRcXhGOWpvTHQxNUNxcGVMUjY2b3hXb3JDazdWSFNNU0NM?=
 =?utf-8?B?N2ZUa2k5RnVhck5sc0hmOWdERDRZcDh6ZVl4UkxXNzlQRVAzcEFXVnZ3Uytp?=
 =?utf-8?B?ODFrWU8rdGJhbTJlQlduQk83Tkh4RlVjYjAwWDNQV2hqaGxlc0IwK3N0MXhV?=
 =?utf-8?B?OTkxZm5BZEtOd0pTSDVZNnY1ZFQxWGhhWmJJMkNZN3cvUGFESUk4aVZlMUpK?=
 =?utf-8?B?Kyt2NWZaNEFlRitCSVhMaUpLaEk5bFlQYzBMcjVVTjVMVjJWbEdORVFoRnFn?=
 =?utf-8?B?TTZicUQ0RitBTkZWSVZWdWQxQzJld2xVZHczTEY1RE9UUUVqK2VOM1RaclFO?=
 =?utf-8?B?aEZBT0VmWG54ZzBOcVI2V00wZkxpVjhDYlY3Nmh2YWY1aWI5Zzk4MFVwK3pT?=
 =?utf-8?B?Qjl1UTRTdTVtSjA2d2k1eE5CUitMRDE3ZDR3VXduSzBxeEkzWW8xVFROQjVa?=
 =?utf-8?B?TEt6NTV1VWhtb0RJclBWbGs5M1ZsZVlkNTNWRUdXNjFnUXF0NGt6bVl2a1dt?=
 =?utf-8?B?WWNKWEtKMHhvbTU0TDVIYnJGMlNOR29lTWhxQ1lRazY3UEUxSHhSYngzRzFi?=
 =?utf-8?B?am1Ca3VEOGNKTVlDblpQaW9VdWNSK0ZicVZrUEVmdHR1YUFZZlBKZE5waDBk?=
 =?utf-8?B?Rk4xTjdVNGxoY3JSd1QyY1BzVUNsOHdmbzdzc0d1UDJwNmRBQTNySm9sN2gr?=
 =?utf-8?B?NTNhRU95blZBYk53WlI5MFBKSzdlZnZJSmtKVllOTy8zSzVxVWJuZDhhQnpi?=
 =?utf-8?B?R0JodjgyU3lSNlphNE9lNWc2RjZYaFFGR0l6YzNBcUZGRWxIeXF6WlhPd2pa?=
 =?utf-8?B?bDVhSUNueGc4aFhzeHpLRVpTelY4U1RidklkdktFLzNodHFPdVVPU3BZYzhR?=
 =?utf-8?B?TTNVajh5akErS21BL0Q5d0tvYUpIWThyVEJmRlFzTEdZQWZZczV0WlA3cHRQ?=
 =?utf-8?B?S3l2YUtzK3VhSmg2ZVJiM2EzdEdGYnkrcXR5cVRrejhLRHN6b3NmVHYrck0y?=
 =?utf-8?B?Rm1qeXJvNTJtNHV5OHMzZVF0QmIxZUpYVC9wNVl6UWVCQ1NpZ1VQMkVrWVd5?=
 =?utf-8?B?bUdjQUpDUWNySGp5d1NzenlGWlRUSkNYVTl5WTNwNjVWOEo4VXMwN1dGcDAw?=
 =?utf-8?B?dkh4L2NQM0V0alRKanp4MXJOeW1ET251bFJtbEptZGc0VmxHUk5xMzdsSFF5?=
 =?utf-8?B?Vnd1QjZWYTAyRkV1SkNUOXU1WWZkUUVHSnpXTStkNHp0TGxyZXVNOVhEVytR?=
 =?utf-8?B?eFczYnlyMFo5L3JycmErclVPL1o5cDU4Ty9meVVhMUJwTFJCZW11OUh6OFBK?=
 =?utf-8?B?b2szeC9md00wNlYyUnc3WFhPUkNIaUswN3A1czYvQU9UYVBIeTVhRHhHcGti?=
 =?utf-8?B?UHJZRGJxWm9uOW1zZFk3R3FGLzR6WDAvR0dHbDFkK0pGeE1RL0xnRFVnR0Vh?=
 =?utf-8?B?eFU5UzlIRTFvK2lsY2loQ25kcW9QQ0puTXlnZ2dsZkkvSnBuTW10Z0hnNmNC?=
 =?utf-8?B?UnYvK0VlemZZMFJLTWRUUUJrZ1Zxcm1QRm9MNzlqZk5meFJtdm1VaTNWVXJ2?=
 =?utf-8?B?N0svNElvNE9sTzUwR2phK3JnajkyUFE2c3Q0TlhZdmViUnpla0RhcTdqeXVk?=
 =?utf-8?B?Ui8vc1VkVW1UTzZWTVhyM2k1VCtZbTY2QXlkSk51U2ZhcFB0emwwb2dsRmU2?=
 =?utf-8?B?czFqbXBMelRnbGtEaE9Db1UwekE2T1pkQkNtZDhPc0xaU0FPZy8wa3NvclFG?=
 =?utf-8?B?NlBLb3ZZWHpnalJac0ZIdVQwQVIxZDMrUWE5SmtQUDlLakpvTEluUGJMZ3R5?=
 =?utf-8?B?cWVXVzUrSm1MMktScHZxT25ZRlNzdWtPcFJjK0daV3AvQVNPU1E1Nm8rSlpM?=
 =?utf-8?B?YkdMNEh1RjdINjZ6OVBVRU41NUFRdm1BdXRTcXpaeUhaWXhScEI2Ykl3b25w?=
 =?utf-8?B?ZE5NazFQZTU0MGpuZlZGeW5SRmt1L3ZXZW0vMmJreUJjcisvTHkyc2hTVk5v?=
 =?utf-8?B?Z1FkNjdRQzUwOW91alJmKzN0bDkvM2pISVE2Sm9oU0VMdkdtbHlvNkM0VTB3?=
 =?utf-8?B?RkhnZk1MYjRJaDhVdzA3dXN4SHZIN3VNbVh3VENEazZ2eWZqczZkSUZYaDRR?=
 =?utf-8?Q?71RRUaKnnjnPKdhNlwtndV488?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449ff362-0d2a-45c2-9dad-08dd5b49f9de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 18:25:44.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UDMQ8FIZSv3mX/BbQSEhfnvbpxxQ3h2pazxF9ciXmVDXk7ykWhJnAjvbksXZiYOLmlS48pnBu2j4/HMn/u5q5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135

On 3/4/25 10:16, Stefano Garzarella wrote:
> Hi Tom, James,
> working on the SVSM side of the vTPM emulation, I'm a bit lost on `8.2 
> SVSM_VTPM_CMD Call` section.
> 
> In the SVSM code [1] we are assuming that the driver is always using a 
> PAGE_SIZE buffer for TPM_SEND_COMMAND request/response, but I can't find 
> anything in the spec apart from this:
> 
>    It is expected that the request/response structure is large
>    enough to hold the expected output of the vTPM request. The vTPM
>    request/response buffer will be treated as physically contiguous in
>    the guest address space.
> 
> IIUC from `Table 16: TPM_SEND_COMMAND Request Structure` the 3rd field 
> `TPM Command size (in bytes)` is just the amount of bytes filled with 
> the request.
> 
> How does SVSM know the total buffer size it can use for response?

It doesn't. It knows the GPA of where the response is supposed to go and
will write to that location. It was a while ago and I don't recall the
reasoning as to why it was decided to not include the response buffer
size on the request. It may have been related to the TPM code not using
an output length? Which may have been the reason for wording (above) in
the spec.

If it turns out to be a requirement for providing the output buffer
length, we can add a new vTPM protocol call, SVSM_VTPM_CMD_EX or such,
where RDX can hold the length of the request/response buffer.

Thanks,
Tom

> 
> Claudio mentioned that in an old discussion, we were thinking of adding 
> in the specification that the buffer should always be PAGE_SIZE. This 
> would explain the assumption we make in SVSM and also the driver that 
> always allocates a page.


> 
> If there are any changes already planned for the specification, 
> apologies in advance for my confusion.
> 
> Thanks,
> Stefano
> 
> [1] https://github.com/coconut-svsm/svsm/blob/376e4571099ee5e9aab8343c137600e97ebe1b4b/kernel/src/protocols/vtpm.rs#L67
> 
