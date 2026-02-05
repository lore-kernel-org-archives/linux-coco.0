Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED6928D8ED
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 03:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770263414; cv=fail; b=nbKr0L6/XdhuJNjTYwy4/uBrA1u8BTFn4WUuTVFRl3cY5y/Zfgif4RELgooDC2wC7oXFP/gtdoWyrOSaVv2lST7bgGzoLEEjLOYlz8Zwr4yb36ODWoTPyCW97QrmZPa9OaHvG5DZQawSmzbmw+VQecNquA5LB6vvXlL8x5anwAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770263414; c=relaxed/simple;
	bh=w9GaDFAZJIDHpe+DPDoLTESLVLOUJkhr+FkQyhwMpTg=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KXdsOqP2ycgEFyWuFI1PoCwK4c8IB59pXWEAvMIfxq0Ioo09/9doma9zruK18fOhan1mv4gjwyff+Bp/THG9rQqeIX+lSjSG2rJWJwVxLvAK4CACbLklH0/3hV4FrJ/oafwU3R8aYgPXMpg2Ah4m5BKAWqZZ6u0+wb+5WxqxRz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FsSc2smI; arc=fail smtp.client-ip=40.107.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FsSc2smI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMJwW1yJqTUTLWO5cefA+fmTct1P0ZDeJfO8WPvefUAgF9Y2f5K6ukbFCu8FP0a5L8QNeh/7gDHGtwxxTnnpJn70CXpKxwbxW55PCR5NQPEZ/KQFw7kMRXpaLCprQbdAzWE0H/FBUayB3LOvm/DCs049/uIfk+cGHF/olElvfDeYmKc4xHiJhrTt8m/FqZ6SnWGVwoTLE+7XGMAXcA9qXfhByh1nbOmnSNDju1hOxIs0mBjSQIVDhGf+3J9cDgye/4uCHPaMCOER/bocDsawJaUMa6lZC2JafEfgydQJdtIsKkNW14xRWnkTRP1rRdW18rOmXI+tzVcDVekhIAvLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlK4jOIVnS0HtT3zYEltaBLlFNYetT/K3YLk7G0D7GE=;
 b=e1SpXnQFTsQJriwBsxsLRva7OTks5U+VjZgI5wTzVgD4t95d9uKHdU6tI1rIR/vTJrf9WyEhVhnb/LkNWiyxZT8GUQk2tdApFR/S9O22NdTv2HjmscRrEutvjXIAmu84LKBAEDEGsWkBwkTx3ba6p/EFqCht/gkiTRqSSchDd6If0hBhFETCUILZM2uu0gJzxGwhSbONBze08MFjoCAsBBmQuTzO8Dju6bPxDcRQXxdYA8AV6a/COoMWOrIIAaXNruio2duNiLqg8RPaEjkRRAD882x5Jusu9+6uNzn8DV69B6O1RReKFUx5hLxC97CI0/gBzYGMEq79WOhHyJNW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlK4jOIVnS0HtT3zYEltaBLlFNYetT/K3YLk7G0D7GE=;
 b=FsSc2smI5S3vbYnADT8S9GdszJNX9aoIepLNClJNgf781+HDp/1PXSUKsXQ8yvgoKLMbjSiKRj6+xIHAOnUHvCD3eVoN1iWnUATjHQO18JhkzKTHw/N/trnZpJ5tYFXPWWKJVMMEcARkXuZ09Lv8XtS4xHqEwz+OvJKNlvllujs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 03:50:11 +0000
Received: from CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3]) by CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3%6]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 03:50:11 +0000
Message-ID: <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
Date: Wed, 4 Feb 2026 21:50:09 -0600
User-Agent: Mozilla Thunderbird
From: "Pratik R. Sampat" <prsampat@amd.com>
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
To: "David Hildenbrand (arm)" <david@kernel.org>, linux-mm@kvack.org,
 linux-coco@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, kas@kernel.org, ardb@kernel.org,
 akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com,
 michael.roth@amd.com
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
Content-Language: en-US
In-Reply-To: <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:806:20::24) To CH3PR12MB8660.namprd12.prod.outlook.com
 (2603:10b6:610:177::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8660:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faff77c-a8d0-4733-01b6-08de6469a9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlptQ1VWNnJsOHZndkFQczhQdGYvbzkyclBhVStDWnhldDROVUdpVmlHRyt2?=
 =?utf-8?B?VkUvK05lYWk1RTJjWit3b0txQUMzRjFGRk1RNE5zL2pFSkU0N1BrZ2Y1TUoy?=
 =?utf-8?B?azh5eGt0ekNyclY4bEpVRFU0R2pPbTNseEVCV05VVlNqb2FtRFIyK2RabXY4?=
 =?utf-8?B?YnY0dStOcXRSbG96ZnlubmRUSWZDUjAwcVBzdEsxcDllZlBteVBjNXlmQ3Br?=
 =?utf-8?B?N014VkFSREo4WUxsNWJsWm5qcDZRS2s0aWN2cmxwWWFETTZtRzd5dTlvUE5t?=
 =?utf-8?B?ZnNhbC9nS2hzeHJFc3pVUnh0TVFuMGE0QmlSdXJnbGpVOVA0b0dTb1VVVDlh?=
 =?utf-8?B?Q0pCRVRUR21FaCtJUGFWZDQraTR1c05PaWpFOW0xMm51anZRaElldk56dVl5?=
 =?utf-8?B?ZDR4QmY3NEVEQWxUNDIrbGhGQ0l3dkZPV014MUVuRDZ4NFVkQ1FwVkUzeUNY?=
 =?utf-8?B?WjJhdHBXSkdjeU5ZTlltK0lSbld3RzMzZjdWUHYzZFZnVVlTUVRPZG83ZE4r?=
 =?utf-8?B?ekZFd05YZUVNNThMTC80NjhYUHRvVTZ2NnBvdzZNRTRlRXNKNTdUekVLOTNJ?=
 =?utf-8?B?V3JpV1dRNXZ4aWpGM1J3RFJTSkMvMkI4bmFFUElOYUVteTNlV0VXa3BlNWJS?=
 =?utf-8?B?VEZFeENuY3l1aHdNSUdtS1k5K2xHT2lqMU5FSHVqMDd4TGVyNytZOHFYUnpS?=
 =?utf-8?B?SG95UGtwR3NpekhPZWFYZWJFbnR6bVNoSm9hUUVVNXM3cTUrSFEvaXBQSHpK?=
 =?utf-8?B?WFhOUjlyUXZWN04zUkY3c0dua2FBSmk4OHdrQ0dNaVE3bjdHYy9sOWlrR3Jh?=
 =?utf-8?B?cXVob3N0VHM5MVJSN2ZBeXV0cmFIZEN1dHNWdjBMUW45OFd0d0NaVnZGWFNZ?=
 =?utf-8?B?T1FSc25rbnJOMWZnUEJFNzEyeUs1UW1wZExJUGVYbytaMy9EMHhyZ3VIUlZ4?=
 =?utf-8?B?OGxMbDAwbytjVzZNMDQ4WStPNjc2U21GZnNYTXFLUDlxNEl1eCtDd2hDdTVX?=
 =?utf-8?B?ZEFKS01MU2lUQjVOVm9GeUE4eUswbDJSTHlMRnNUVHRvYjMwTG4rWWVzU1Mr?=
 =?utf-8?B?QU4xeDBqU295VlpaV3I2TC9lQXF3WWdYVnpYWjFXbWxMMm51RDRoRFpJQXF5?=
 =?utf-8?B?UnpPamxhdUhQYkVzbCtjVFdFRHZOVDFhdWZNa2J3MVpudFNjQmN5UlljM3Yz?=
 =?utf-8?B?QjBCaUpuemlGOURVZW8veS95d053OG5KYTgvZDE4cXR3SGRjbHVXOUJoUzhE?=
 =?utf-8?B?ZGVvZEIrVXczOS9VVm44dHc5Y0xMM3BYN09XUU1VQ29OQVNxSUtvMnRUTit4?=
 =?utf-8?B?TzE3WGkyTFdjTXhRblN5QTlJRmdLN2lrTFlQOWZTOVdXYmo0a2RIVzBKeGZQ?=
 =?utf-8?B?WG9iTkxKTWQ0UlM4MFNGU2xsRHNCL2FQT3lSc0MrbUx2Wm5XOVRsNVNEaS8v?=
 =?utf-8?B?V1dtR2xENHRIWjh3Zkc0TnlUbUFLZkduekFTS3NVVDhzY3Y0TWRXUDlDSXBI?=
 =?utf-8?B?RlRhNWVLTlNXRCtVNDJtMlkrM1A4SFpCSXh6Rm5WdU43eDhSZ1lVTGt2OGo1?=
 =?utf-8?B?WmxuWFVZTDd0Qk5Id3E4Y0FkRllVMVZpNlNDK3FFK1ZiN0xqdWo2SWRNLzZ1?=
 =?utf-8?B?bFlsS25SYmVkMHRrUFd2M0k5ZGRIR2xnQWN3QVFHcFlzcVJIdlpIZ1JjOXlq?=
 =?utf-8?B?V1JVY0VVUmlwUzhXSkIrcXdpWHpVc255b1NOYiszMTZiYWhUUDNKTG5SZDlM?=
 =?utf-8?B?M0RBVE9lRXpsYU9ISzhla05Oa2p4dDF4UmlBdDMvWVVlZXBnZjJ0NE9XUVQr?=
 =?utf-8?B?djdiQldIZTU5UHN5Ly9MMGM2QVFjdE43ZkJCK0plTDFLSlFnUjlsbTIvYktj?=
 =?utf-8?B?dXhtMC9DSEdqa3RXU0YyN0RiYlJOOEthcG5mM3pvemFub3hhUEdHYWR4cUpx?=
 =?utf-8?B?SEpQM2FDNXhSV3lJTEI0YVE2MThOdHFZTldDZVk1QSs5dDRGaUtuMWJ5aDhQ?=
 =?utf-8?B?dTYrN3Vmc1Bmbk9FSXNDMDE2aTI2ZEYveE5iQkQ0aFNpR1RMREVYMG16Y3Vs?=
 =?utf-8?B?am1Pb0F1WlA1eXVVbEh2Z0lwZkJPYSt3VlFaREF6Y0JURDk3VFU4VHlzVkRF?=
 =?utf-8?Q?Tavw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmsrSTQ5aWxGZUZNYnoyWmRLdmNCZ0g3cStpQm5FNE4yaWZaNjJLZFpxNHRt?=
 =?utf-8?B?b09IUnBQSWQ2dVZ6OHBZdkxLbzh2a08wcVFxNHJERDB4ZHhnS29tL3kxVkt3?=
 =?utf-8?B?eHFUUmxVeTIvTzVualFtN3NxMTZJTHZCa21XNGt5ZVpyckpEVmU5RFdxbFhx?=
 =?utf-8?B?M1ZuRTdZdXNGdjNBWiszUnRPMnhaMmJJNVdhOU5QbVdmb0VGQTBSV0ovRkEr?=
 =?utf-8?B?SHlCRCtYYnlBaU0zZFBweGJUSm1PSlAvNVJhTkxlQi9vc3lkSElXRWZFNW92?=
 =?utf-8?B?WUNWM2Ntc050aXljYlhVd280S3kra2FOSVo4MHp3SmNXMHFnenh5cWlodVph?=
 =?utf-8?B?UXFWaS9UYWkxdTh2MEF0T1M0TmRzZHFyZnFHcXhWQXJrS2htaVpmUmFNY3A4?=
 =?utf-8?B?dEw3cFJIOWhSODNnaWxFQzNWWUErODg4Wk85czJZbTdiNVczOTRZelJRMmdn?=
 =?utf-8?B?V1lkdlVyeHRRUGVYV0dkMGk3UzBOQzhpVStlbUh0RWh4S0JYYjFsT3cxdXZT?=
 =?utf-8?B?ODBtNHhZY3Zqa3didVlhcHNHMk0zS2VsbTJGNGNnVmRONkRiMXV0TlM3dnFP?=
 =?utf-8?B?bDErUlZsbW1hRFVrMkdNMzZ0QmZSeGVtVjhwMjAxNW90MG9UNmFzU1M2L1Bj?=
 =?utf-8?B?Y0g4OGJtRTZNdXYrd2JzV3dxTHNDNGFkdzEvaFZIQUZkbTFBUWdJWEpDN0xQ?=
 =?utf-8?B?dm9BcTZiaUwwTFNjckdrLzZnNGFvU2FyclJQNzVGcDIwSVN6YUVtc29Hc0lO?=
 =?utf-8?B?OFFEc2RWclIxWThIY2lmT1lLTmlDYzVrN25iYmxuMW9hcVVGLzBCSWdnUHJF?=
 =?utf-8?B?S2haRWJCNHFLRkJhU1RLUnRkRitXY0FvMTlBS0lVMFlyRXJOR2QvaEx0MkNz?=
 =?utf-8?B?cEZMTXpPOHluV2VpcS9qNUZnVmJjWkJLelNWR3FjYkFaRVhndnh2cy9kTFBU?=
 =?utf-8?B?aElybkNzQnp5TjlQR0x4ODlDS1orMEwxQUdCejUzTXlJZjA4N1VSSmU2cUgz?=
 =?utf-8?B?RlI2YThTN0hnd082a2ZrRHRuQTRXLytyaU9VTmRlM3ZTVWNmc21VcHEyOXJl?=
 =?utf-8?B?Q3JSMWJ4dGY3Y3lNaU13Z3ZrV3VwTndZWXExREZtWGRHYVVjaWgxWUNPNlRh?=
 =?utf-8?B?VjhSeVFEcEtQNmM2MlRvYTJXYWc2NnVRT2R2K0xzampxZjJ0WUxpRXJIZHZG?=
 =?utf-8?B?WVZLMEVGei8xK3QvK0xYWGFybkt2d3NHaFgveGpXTHRNUEU2T296Uk5FY2Fa?=
 =?utf-8?B?TktFVGxnQjZ5eEo2TU5uRzFUMzRiVUhlaFFyMENSelFyS0VZNkpYS1RCZnBu?=
 =?utf-8?B?Q3pTOGFRTEhBZWt0WVdQT3dsUjNsL254a3hGdmU2N0J4Ui9zZm9mUXNqcFk1?=
 =?utf-8?B?WW9MbkF2UE9yemthYVEzSjFRWC9ZQjZQV0hGR2xIbkFqUzJSeGRNSmxhdnRh?=
 =?utf-8?B?MGUzVy9iQnpScnh3c3M2SGZpZmZaUnQwbGYrRlloSU5Bb0JkbmZWS041RUhK?=
 =?utf-8?B?eUpQOVB0cXJValZSV1N0SHZhWWYwNmJFUnljdnZ1cUN1M2txciszdnV0SVlF?=
 =?utf-8?B?T1l0amhaT1FVcEJMM1pzWjZYUFBYYzNPc1BmZHluQnA0dk9CekVTaFFuSXZu?=
 =?utf-8?B?Q1VxcTVuTWZ5Mythdkx5bXk4VkJhMGVqaTlUNXhLWlpaZVBIdjBmT0w5T0lh?=
 =?utf-8?B?U1N6TWxuSmFwZUNZQzRLaXdkV2ErY3ZyVkdSV2ZURmwrNmhDb1Zta005Vnor?=
 =?utf-8?B?UVNjZGtYV2srNStEZnVnbUM1blVWeDRzU3lDVWpVRnViczFHN1lnd04rbVFx?=
 =?utf-8?B?OGFjQ1BCMmhYTnEyR2xLaThycjVZL2dlZTVDSnhtcWRuOTBTSC96MWgrQTl6?=
 =?utf-8?B?WCsrZVlPVk81Q3J2MGhxbUduRzR6UlBXK0JwaVlKRnlIT0pweHVHRWEycGFT?=
 =?utf-8?B?U2g4QWgycmFPWnFod2dlSWFhT2U1VHF3cDd6QmJzb2xIUVhEYUlvb29zRmN6?=
 =?utf-8?B?YUpiV09OZDZDY3RkbWcxdWMweG4vN0RPSWI0M25ZZXd1UTFpOU11eFVSalo1?=
 =?utf-8?B?eEFMN2hyN1JJZlpjNEtWSlhVU3JFZ2xBS0JUMUNDbXEvMFU4dEFNTzhDbWtT?=
 =?utf-8?B?VFRNYlBBODNOMFlsS2p2enFkRHVMQ2l2ZkNRUXpxcml3WldDSUJYbXViclNn?=
 =?utf-8?B?YmFsSEJ5RlNQZVhjbkhybmRIaVNxeXFwaHJkejN2aU53TVl0VHFDTnhNM1hD?=
 =?utf-8?B?V1V6UVJ2MnlmTkNJcm01U0dRbnJteTJPNkJBbmcwdDY0aFhoTWNqUUk3Tmc2?=
 =?utf-8?Q?w3hxV3akrOjZMygdGH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faff77c-a8d0-4733-01b6-08de6469a9bc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 03:50:11.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVy4J1mQhSeMzbOKu6KHFmZLTrpqKhY/ori1x7Bth51u0cFnMuO9CKuKZL9b62pq+73fW4VoWkQfSw7EqZTpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977



On 2/4/26 2:00 PM, David Hildenbrand (arm) wrote:
>>   #endif
>>     static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index a63ec679d861..549ccfd190ee 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1567,6 +1567,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>       if (!strcmp(res->name, "System RAM"))
>>           firmware_map_add_hotplug(start, start + size, "System RAM");
>>   +    accept_hotplug_memory(start, size);
>> +
>>       /* device_online() will take the lock when calling online_pages() */
>>       mem_hotplug_done();
>>   
> 
> I really hate that accepting (and un-accepting) hotplugged memory is different to accepting ordinary boot memory.
> 
> Is there really no way we can get a reasonable implementation where we just call a generic accept_memory() and it will know what to do?
> 

Sure, that shouldn't be impossible.

The only reason I initially kept them separate is because we accept and update
the bitmap unconditionally. This mainly applies to cold-plugged memory since
their bitmap state after remove shouldn't matter. However, as we are now
correctly setting the bits in the hot-remove path we should be fine accepting
from the for_each_set_bitrange_from() logic within accept_memory(), I think.

Something like so?

diff --git a/drivers/firmware/efi/unaccepted_memory.c b/drivers/firmware/efi/unaccepted_memory.c
index d11e7836200a..e56adfd382f8 100644
--- a/drivers/firmware/efi/unaccepted_memory.c
+++ b/drivers/firmware/efi/unaccepted_memory.c
@@ -36,6 +36,7 @@ void accept_memory(phys_addr_t start, unsigned long size)
        unsigned long range_start, range_end;
        struct accept_range range, *entry;
        phys_addr_t end = start + size;
+       phys_addr_t bitmap_end;
        unsigned long flags;
        u64 unit_size;

@@ -44,6 +45,21 @@ void accept_memory(phys_addr_t start, unsigned long size)
                return;

        unit_size = unaccepted->unit_size;
+       bitmap_end = unaccepted->phys_base + unaccepted->size * unit_size * BITS_PER_BYTE;
+
+       /* Memory completely beyond bitmap: hotplug memory, accept unconditionally */
+       if (start >= bitmap_end) {
+               arch_accept_memory(start, end);
+               return;
+       }
+
+       /* Memory partially beyond bitmap */
+       if (end > bitmap_end) {
+               arch_accept_memory(bitmap_end, end);
+               end = bitmap_end;
+       }

        /*
         * Only care for the part of the range that is represented

unaccept_hotplug_memory() truly doesn't do anything special for hotplug so I
could just re-name it unaccept_memory().

Thanks!

