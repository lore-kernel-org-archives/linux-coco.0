Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792427522;
	b=NEkMQYu8+uvvPiK0Aw95tJ1ViPN16ZD3zRaBEmjNMsT+9m0+5iBCs84iWhRhO6rmU66C
	 m2GVK8OrCbRH9oNPuiiTcAqWeNr0QPlDgtlPR+CPdTjvryDqbWKmqcP+pyKURSGB6HF/f
	 DF8/XkMerv1msNw2o9dw2ZJKAaX3f//BZoYeZ6M3Bg8DgZmTUI2dUUZOMDTPSgte0lgTM
	 bcl7vxZsu55LNKfnY0W+FI8ttMPcaifENGYO9AtZZtogU1pv4BBGSNAG+KOxwJaV4hRLg
	 YfLRFdU24LurvudNW2uNqYEb4EGqjQ8pXawVL4v1pggBSCe2wTxlOi6F7FjwgNiyLfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427522;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yp6NTANy9HS+Hr8XMRe24CxBPGRYd3gY7ymSPeE8KIA=;
	b=zpjDlky8F1wici31s6a3J2vZ8h4LXFg9uvbse3wnvSCxa31nAkS1pcKquXQV3fCLaPT8
	 ifoQ99jAr6WXJBgUiKXStzds5CCn59xUAYaOL809SVSKWj4S/P9aMJhqZTR6dXLDGrq3d
	 +gITq5yV6BFy/uhh3mLQgqgBTFyyw7F11IUXyXZobxcIXsiVH/LMT6liyJ7yW88cingWU
	 uBOzdOrfphUxMtIzYwaGy2cZ6hw5GkzmLtdKvCmujXAOz5HYKFiwID59uxkrz4MxdzobA
	 OMFGvX3Ky8w0XqQctwlWvQYN+CK3q253/u2XDzNPO5kfm/A9jZfNYTBad0s7VpUfdDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="3A/mwbuh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E072606A31D
	for <linux-coco@lists.linux.dev>; Mon, 19 Oct 2026 16:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E072606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3A/mwbuh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCYhLaabES0mHWJV4kABOTwek8ZwWnwcnHsaQ9ALCVGIEuNetYsT/1xMborQoHDYiXlje3ODsKmOK6yOhF3jeGLy7k5l8FVTB33f1v6j3gz6kER8dOwcm7nGd6PvtBTMq9iDQckiMQhhERKJCs73poGbuAqDsjhLQyJeRJWQPM+mT+eJJdBbG5TcqN/nE0I/zm0dbFemm18XVKR1hcVdY0921bSXQK5ACwHwwW57hj1OyWM3njaE7gzXDfmweRvr6pmNWKyGvNEduTftNv0sePxAn6cAX1zx0O959kxHBYQUVF2gffWzsnvtyffguQ7fyFSOQUMd5fsAUCzK+UQd4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yp6NTANy9HS+Hr8XMRe24CxBPGRYd3gY7ymSPeE8KIA=;
 b=x8jeZklqDd/WHqY8xoiR+o15GOhkRcXwFAAQKkKnZT5VFs8AEMXBoY81V2hw0n3vPpr/gA+9L2vKj7BVaOfqtW9NZtICe1K9Zqx8/jNSgDNCcfSwjuElZx5VepXkf/qwbDVzYxxYBKfUMU8XzdIqoWDbDqkZw89NOvHKkRK+L7/Nazk+pISexQ6KBq0rysT41VWdPu/UAAFwQbfVwsOrxgjk8CIYmkKQfi9MTkaLTxPDSv3+Bk4KgJvNGWItIhBoKL/zig+H1ck6Ir3sKP8VZWzRa+Y081j7TqVgdLqAMuVnyhTdJ4PfvRO7fk6iOWcWX6XZk3Di8HaUboH2dR0enw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yp6NTANy9HS+Hr8XMRe24CxBPGRYd3gY7ymSPeE8KIA=;
 b=3A/mwbuhJhhy+9jGWLt+HtASig4/fd5QyMbSJ64ES7wolX1m2HkaS93kRAqN5ml2Y4PvnBXZK3J5zQQzk+l9pXNMNxrgIUA73s6eYLqv3iamm2BS9OuWYU//PX50HIVLYhl7kyEQOA98QhU6hJgzz5SVGN1EkT4P/CDNnU7QC8o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA3PR12MB8811.namprd12.prod.outlook.com (2603:10b6:806:312::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 16:31:52 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 16:31:52 +0000
Message-ID: <e1753b90-f22e-4708-8c2e-0e1d2e0f46dc@amd.com>
Date: Mon, 19 Oct 2026 11:31:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/18] fs/resctrl: Control visibility of global per-CPU
 kernel mode group files
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de, ben.horgan@arm.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org,
 mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 fenghuay@nvidia.com, kas@kernel.org, rick.p.edgecombe@intel.com,
 akpm@linux-foundation.org, rppt@kernel.org, dapeng1.mi@linux.intel.com,
 elver@google.com, enelsonmoore@gmail.com, jlayton@kernel.org,
 kuba@kernel.org, ebiggers@kernel.org, seanjc@google.com,
 ewanhai-oc@zhaoxin.com, binbin.wu@linux.intel.com, peterz@infradead.org,
 ashish.kalra@amd.com, superm1@kernel.org, chang.seok.bae@intel.com,
 prathyushi.nangia@amd.com, kim.phillips@amd.com, ackerleytng@google.com,
 elena.reshetova@intel.com, naveen@kernel.org, darwi@linutronix.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, kvm@vger.kernel.org, eranian@google.com,
 peternewman@google.com
References: <cover.1790867441.git.babu.moger@amd.com>
 <28d7e4484c93d899ed86ddafa13faccce0dedca9.1790867441.git.babu.moger@amd.com>
 <c600a240-ed11-4e31-b3c3-779f01175f28@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <c600a240-ed11-4e31-b3c3-779f01175f28@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS1PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:8:233::9) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA3PR12MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9fce53-5074-4e39-7f95-08df2dfe7b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|10067099003|4143699003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	m9BCFdMQSugIk8z+WJl+pc6aIWa1XAG2PwmZQuyvpEUng6DcLqprULGPKbn2EqT2HCKKfatHb+QE/j1Ga7ym4Ms75QYMwAUU2cj0Zpd/zoRhivGQPiC1G7QlwMS7zlg4M5PkoOG44hkejfKUYMNkn2Ap8DsLHwTbCJIrEJeBW5qpjUVsMv5uaRMU0BWeWF3VgeJv8mT6oakbh2zJnWlCsVhjlptFWlg+rP8NHtofdEr1seW1JoylT16E+nNfx4amES0rGrligf9CaSA9zp1RUPPnEy8LqfQjv957zRPirGgnAwj1ZiwixCNFMgwYQDtY4UMpNS3cXNvXHczB4PDbdyUeH9KFh2phiahJprJrBTT6dN/loNtgrIBYgUBvPBnVmhADk2dK6KMrjMg0JZ+HYSj5Yqnk46nIzxecp8XEOrfkum+fSXoDhu6WgUeVsxRUN0xG/Dro3RTVssnFV9SUfxl/rWn/toj1AiOWFZOL5Mg9jwmpfeb8nZEgqSkMqNbK5rMGuGWSQ3q/W5A7nB2w7h56PJOSlx6NwsHi1Kb3hJ0kQTee37FK4Wm0m+F/uewFEnAZxk7qTniHudkNLNNhU3u2Yl0Vb7b9/IH/8QymFew7yLxADV9Nyxfyo1q8Z3I6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZ3Uk5UOWZRRmlEMkhLZGlpcUlwT0dyb0tNUXNyd29ReGFkc3c5Um44Rm52?=
 =?utf-8?B?bXdtdGhxSVo3NkhzVk5ZSDlvZ0xqTE9FaTFHZmFrc2RNY3NoeGo1NStyZ3lL?=
 =?utf-8?B?Q3Ixd3lnUjlLSzI3ZWhhL1E3TEJLajI3STQ5TFVvUFVYc2VuYkoyV01wNEN6?=
 =?utf-8?B?d2UzUFJMUzhHUkdycC9EMTJITFVrU2kwOWh0YnpmdEhvUTVpTnE4NVNFRkww?=
 =?utf-8?B?UkRSRHNtRm5UdFhYaDJsc2dPSDYraHNkaURUSFlLMml3V3VPcjR5M1NXT2Fv?=
 =?utf-8?B?YnoxdlZTZEJxQ3MydnNydXBmTEEvUnNnYlRGUm4vZkRRdFdXODVJSjBXYjVo?=
 =?utf-8?B?aC9Tc2hIOERaRjJEcnh5UzFKd1NMTVkyODErSWRyU2lWWHgvQjNMR2RtaEhU?=
 =?utf-8?B?TUtZZXNVdFBQcXRyd2RIVVhqTmxVVVJKNU9MM3BKMm4wblFEWURReGx2NU5Q?=
 =?utf-8?B?cEprbVBocGlJUEgxWFV6MElGc2s3Q3h1eGJ2T002QWhBcmYvWDFnY1UyaXZw?=
 =?utf-8?B?NGNKSExERGlxOFRoUmN5UmdPTGRXUkRBQ2RIVFZiNTY3QnBsckRTWjJPcVFi?=
 =?utf-8?B?dnU0T3Y4TWljVnJXTkxsYzZYSXNCdnV0M2pjMFRCR1NSbExxa1NWeUdJeGFZ?=
 =?utf-8?B?NG5WcWZEZTl5NHlXbmtqOEVWa0lPL1NOeTM3UzF3a0lLdEw5aGFTSmxZWFdF?=
 =?utf-8?B?SE9Hdkt1VXVPYUI4QkJ0THV4NFhXa0gxMU4ySm9ISTBMSDFDekZrNkFvYnY4?=
 =?utf-8?B?TFUvcjNiYzk3eXIyWFFCOHdFcUhoM2d2WEcwdVZSU2Y5ZUUyOFN3KzhtTmwz?=
 =?utf-8?B?R01BeVdyK3dnbVdhTHlha1M1TGIyb2djUkQrVXBFV2ZBWG5zQzdIcmhFY2xO?=
 =?utf-8?B?ZStUZGFDbW1zYktia2c2YVlWcHhxS25MQW9aelhNaGZnbS9aV2pkbXNMRVh6?=
 =?utf-8?B?RDVhWGpSWWtQQXZncjk3bktiZUp2NHBVQjhxbGJiUUZpTlV3WFZOZGFWNHJY?=
 =?utf-8?B?WkhBL1R0MkVUOGlaR3ZOS0RHS2NLOG05cmdEZkhITG1KMDg3YU5wdjIzS2Nm?=
 =?utf-8?B?dDNES1NtNjN3ZDNPL0ZmZHVVa20wNEpqSmRpc2huVkZpUTZ5Tld0OW45dnM5?=
 =?utf-8?B?TUczZXNFK3RZNnU4ZTE3UGRMT3UyNi9veTFxQy9jM2MwVThMK3Vmd0RMaExO?=
 =?utf-8?B?R3dLTVBPTzJkQmI4Q1FnSDZRQVBOVFNDczhiRHdDY2dNZE9SY3hYaUI1N0V1?=
 =?utf-8?B?RjJPVGtzM000OHBMZHlpSjBBVDBvT1NqZUJxK0xlaU9tUVpGampZMG9Bbk5C?=
 =?utf-8?B?Vm9ESXZoVTA2WGtQZmQ4QVg1NGJZQkhBY3dRRURUR1UwUUZYd2RhZWVaSk8w?=
 =?utf-8?B?K3lBVEJ0NFVRWlhTcFZxL2tTaCsyUDBqWFl4M1VRSUticXExVFFDM25zU2ow?=
 =?utf-8?B?QmlGemI4MzM0M2J1bzYvaTI2NHhmQTRiUjBsK1Z6WkppeFZqWlFmL1BvaS9n?=
 =?utf-8?B?YVVMT1E5K0tsWUtGRGp2Zy81aVFvckJQNmRtR0JFbUhVVWVLZ05qdlc0S2Nq?=
 =?utf-8?B?ZmNhUVZVYmpsMVdoNm5iNXExVmVVSzFzZ05tNWJpWnRBY3JlSXJweWxCWkNx?=
 =?utf-8?B?Y3VMT1lKWW9KQXhoU3ZVV05QcDQ4c2xxVVVneitsSTFsTG5lOHRHMGgrLzlq?=
 =?utf-8?B?UFpjTWc3SjhIakFHZ3FGUVNTQzJuMlM4dFBYZjZlb0lYVFRlTzVXWFFEeXNn?=
 =?utf-8?B?VGRxRVBxQ1pyeGwwdnFodzJZM040WlBJSDN1VHpyWElzMEFXMVBrUHUwUUxG?=
 =?utf-8?B?NWZtZlRuT3VjTGZGMGMvdlg2Y25aQmxoaXJXa3M2T2dkWE56NWxSdGNEc3lO?=
 =?utf-8?B?NjRWcTNnOTZGYko2KzVxMVBxeGxiR1ZjK1Q2Mmcxc1VTQ0djNnJ5UTdKN3ll?=
 =?utf-8?B?VmN0Ry9nelA5WjFzQUpQTVpKNlJVTEgvaDh3N2laOGNpRGp4aGdEaVVwSkhi?=
 =?utf-8?B?ZWEvUlk3T1ZuYlhXUGh1ejZmaWdSRm5uQkVsL1VOa3MySWxESXRDODE3UnFm?=
 =?utf-8?B?cVRrVHM1dCtaUGZvdWlUU2FvaDY0SjVuN1RlMVI3dmNoUVZFWVFtREdCS281?=
 =?utf-8?B?OGs3RXVFaHFKbVJmVWQ2VmVkRFI5d3duUXBRaEJYb0JPc01PQ1EzUjJPWXVr?=
 =?utf-8?B?d2NIQmZrZ1NPVjRSekliZ3luR1Q5WkNvSEowaDBGK0w4QThxUExidXlZYlpo?=
 =?utf-8?B?NnFjajdSRXhqalpsRWxHeS8vQWg5OFV3Z1ROaDRtZjNEdSthNmp1Rm93UnNU?=
 =?utf-8?Q?P8+2kj9GvK66O8zixz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9fce53-5074-4e39-7f95-08df2dfe7b75
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:31:52.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoew3gabtALpP7Nw4I+DKmt1wS1LqiKf12yVpGlENWsjzAT1plxzgQKM2t0ABDel
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8811

Hi Reinette,

On 10/15/26 10:46, Reinette Chatre wrote:
> Hi Babu,
> 
> On 10/1/26 8:10 AM, Babu Moger wrote:
>> The kmode_cpus and kmode_cpus_list files are specific to the
>> RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode. These files are created in a
>> hidden state when an rdtgroup is created.
>>
>> Introduce resctrl_kmode_global_files_show() to manage the visibility of
>> these files based on whether the global per-CPU kernel mode is enabled or
>> disabled.
> 
> This does not sound right and does not match the patch. The visibility of files
> is per group, not globally whether the mode is enabled or not, right?
> 
> It is ok to have cryptic changelogs when changes are small and simple but these
> changes are not small and simple.

"The kmode_cpus and kmode_cpus_list files are specific to the 
RESCTRL_GLOBAL_ENABLE_PER_CPU kernel mode. These files are created in a 
hidden state when an rdtgroup is created.

Introduce resctrl_kmode_global_files_show() to manage the visibility of 
these files based on whether a resource group backs the global per-CPU 
kernel mode. Hide the files when the group is no longer associated with 
the mode.

This avoids exposing kernel mode configuration files in resource groups 
where they do not apply."


> 
> Sidenote (on topic of consistent terminology): Please stick to "activate"/"deactivate"
> for the mode itself and use "enable"/"disable" when mode is enabled/disabled per-CPU.
> 

Sure.

> 
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v6: Helper named for the global per-CPU files instead of unhiding every
>>      hidden file on the group.
>>      https://lore.kernel.org/lkml/34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com/
>> ---
>>   fs/resctrl/rdtgroup.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 0cdc868a55b1..98451b417fe3 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1125,6 +1125,24 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +/* Show or hide kmode_cpus and kmode_cpus_list on @kn. */
>> +static void resctrl_kmode_global_files_show(struct kernfs_node *kn, bool show)
> 
> I think this can be simplified by changing the signature to:
> 	 rdtgroup_kmode_global_files_show(struct rdtgroup *rdtgrp, bool show)

Sure. Will do.

Thanks
Babu
