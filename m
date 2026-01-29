Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22092D46B3
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715197; cv=fail; b=j5mArx8O4kwtf3qGdC7x4yQcsvvXS38Qda9818StOeEpobHLWHI/QfegNWLb2lbodtn+Z4BioY8+kHe51MbpS+cSDv73wFCohLQoc8f/yF9kNXtrPAIIlNgGIz8OvPLo4o+kj7HysXDrjtJX54B0hf+PGRiWd+F5bmDG1bKb2q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715197; c=relaxed/simple;
	bh=Emef8qLfNHjUvJcXJVWelGqD5DcLiqRZZcBs3D4fwPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jxhRCdzaukho3+kY2Y4Mz+WFYBzwNZPEXtHNk60wEg6subt0IbHQ5RzfIseQ6ymvYQ25yP2ciuPC+ghHfib8KXEyFpQ9aP00Ih26+XEyCoH8TY8/iU6chG5pF6s14KzzPyC0Ds+Amxjl4oU1xgVDmQsKt5joeI4sMkG6pTyyp7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J8xOWD+2; arc=fail smtp.client-ip=40.107.200.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J8xOWD+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQpoFd2r7Nc7pM6JEnoT8gchF84WGzmpwP6LZW8EXFtQTScmHkNQahcZK/Jk5CXCqewPqlGXjsot9+KvU4moztnCsRZVl9E3goGmahsF318Ms1CgOQbk8d3/S+qMfcHvs06tWXfRUQCYVAKxtcweLToHWI78H7r1fgtw2OajlL4sjNAa42TXaYRocMoh98zBD2G1H+cIiKl7wMBPNlV9GFqFJOXyqAwAdYSBjctIIL3TsAvSIHStwa/xw4wn3vE34WjUeq5ivm8HoxzzSSxLpNAaLSI1ws1ap+EZIu7JvX02+elvNNC5+i9IZWwBwIAmccOOYWb1UTIBErXrxNDlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTNM2gZ+l3biS4nHspM103L2EFIQhRqXeJeFWzVM8xw=;
 b=R0w/XjRFJcxznLq+YGYwaDKskTZyFOAgLKF5YgxAlrVuE2LPilJNEf9i6tbVY/6MfXBoeyO47VL05P4erTc5rLSb+/gmkZtRQe0j7+/m8eHXQEBX5HpikhQSKy5VHB/+11uhYlEmsK9nUHTCWF6WV3x8IZ11AdxhyZV4hm1ruEHP1ISUQMVRD8995oqXgXxj3iEnmpwp56hQQIMr9DwYnHQ39WlctiIl5O5vgYIDnnJuNJ1GZfFoD/D3DZ7pGyBo1xhyO228NkVNK2pOsHt0JpH0SgwwP+tDvKkH44LywdnLTPHXIXeujRreygH2Htyji5svlcTnnxS+HZ24CleRBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTNM2gZ+l3biS4nHspM103L2EFIQhRqXeJeFWzVM8xw=;
 b=J8xOWD+2gJ2B8Gq91Sa0dgO6Zl/z+GD0KtC1wd5MwDNmTRxe4suYYi8hBr/AC6LH0A2DiD6IO2fc0Zky52MdC8pcVCfS25C5CNDG5Da6gx3oQeBxJksDv77ikk7QSid3T4MJe1lfahwh79Vy7M8lNDgmzMesDphGeZ5xBKLvZFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Thu, 29 Jan
 2026 19:33:09 +0000
Received: from CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3]) by CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3%6]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 19:33:09 +0000
Message-ID: <9e29a8f6-9fbb-4599-93b5-55235192ffca@amd.com>
Date: Thu, 29 Jan 2026 13:32:05 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/sev: Add support to unaccept memory after
 hot-remove
To: Dave Hansen <dave.hansen@intel.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org,
 akpm@linux-foundation.org, david@kernel.org, osalvador@suse.de,
 thomas.lendacky@amd.com, michael.roth@amd.com
References: <20260128204105.508855-1-prsampat@amd.com>
 <20260128204105.508855-3-prsampat@amd.com>
 <16aa84a9-83ce-4748-bc73-ccf5cb6ce376@intel.com>
 <aXs4DTXCbI_c0JPO@thinkstation>
 <097a4980-9d10-40d2-9667-d07bf19e7b86@amd.com>
 <b7cbc2f4-6fef-44c2-a0f4-2d6895c0fd74@intel.com>
Content-Language: en-US
From: "Pratik R. Sampat" <prsampat@amd.com>
In-Reply-To: <b7cbc2f4-6fef-44c2-a0f4-2d6895c0fd74@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:805:66::28) To CH3PR12MB8660.namprd12.prod.outlook.com
 (2603:10b6:610:177::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8660:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b573c5-4898-4fcf-91ba-08de5f6d3b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dS9zSW1KN0VlQ0lrR1R1SDk2b0dXNDZUOE9tdmRtb0VDdXZLSDVmdmlDZmVD?=
 =?utf-8?B?Q0pKNmxXam4vb3RtQnBkcFIxZDZ1T2k1N0VWMzQxdlQ5d2NIbEF3Q3RJcWxZ?=
 =?utf-8?B?ZkNLamtHUnQ4LzFVMUtMSlRlRDNFOEZRME5iVE1iKzdFTE1US0NMTTdCVmZa?=
 =?utf-8?B?bHYzaFB1Q0VnOUE2djk3ajVBWlV6UVhFMUxGYzIvM0piZjVKaURzQ3hiK3pH?=
 =?utf-8?B?RnBCWEk5NS8xREduc1RhRGxZNmtSS2lBT3A1RmRualdhaytTYzhHd2ZIRkJP?=
 =?utf-8?B?VWg0UXVWMWxIdWNDMTM2WXZnOTdxY0d3eWJYQkVHZlU3dHFudFZLaHcrSG1V?=
 =?utf-8?B?ZlNYc2Z2eE5nK1ZMbThub3k3OExqbGRQc3h1Q0cwMk4zS3cyM29XMEVNdE5H?=
 =?utf-8?B?SFA5RkZIbnk5eG94QitOcWlsNXhKRFI0ZWJFd25MM2djWDNkUzVPbFFhcWND?=
 =?utf-8?B?RzJSdEtFbno4bXFSQ0FxUDBsTzRuQWRQc1BJTk1tTVRKOTJ0dWxqZGZ4V2cr?=
 =?utf-8?B?bU9wd2NldG5ROUt5MmExR0UvLzZMdU1NRTVWc1l1bkVmZVZPVllFaGdpdm9j?=
 =?utf-8?B?Um4xUWtuVUo0c0tkZVZEQlkxSmpuN0FrS1krU0l1eUc0bzd1enNNOWYwVEZr?=
 =?utf-8?B?QWJDL1J3amNlczYzUVAxS3lVaWZmY0FLeHM4QW5wTi9jaW03WnpvTk4vSUdU?=
 =?utf-8?B?ZzVoRG9sbERlYURieEo4bFFlUXRNMGluaHZOblYyWHpvMTg5ZUlFVUpFb0Nq?=
 =?utf-8?B?azhiVXN2QmZoMUdDNWlIaHVWeEhyTE5FVEhVSHhNYUk1eEdPMEFHYm5Cczla?=
 =?utf-8?B?b0x1S2tVS09xS01QSTdYN0QrVG5OeGFyM04rZ3d0bUNNTlBrZVlCaWRzaGd1?=
 =?utf-8?B?UzFQL0dDZ3Z5SG5PU2VGL1ZwaExOMGNOMEx6RnJ1U2VPclpWZE9QMXVzaU5C?=
 =?utf-8?B?T3RJS3gweklQL0RuV2tSVkwrRWt0NTV2R3IxL090RC9LdjIxY015bG9ZVll2?=
 =?utf-8?B?OVYyclppMjlJcDNlTTRHb3Z0RGpoNmo1aTkwbnBuZkpqZkNDK1dlckVENkc0?=
 =?utf-8?B?cEtGYU5JdkhYY2VyVWdMdDd4bzNaK2F6d0FaRVo0cWh3N0IyOUF5THdOWC9F?=
 =?utf-8?B?eW9vOVpOK3BmMFphSUczVjVFTitjSGZjZ3hub0Yzc1djZzcvc2tFNjF6YTBE?=
 =?utf-8?B?MDFDSkFqaGx1YWp5UnV6enR4emZTYjNzblZPS2dLNlhsa3dkQXBNUllqQk5W?=
 =?utf-8?B?VDUrRkNyTnFxS2F2S25kV0hpVCs1eWcyTkpKUGk2MnFrT2JST08rMGpRNlJ1?=
 =?utf-8?B?NXlYQTJjTzY4a1k1RGFwVU9kQ1VPbHJYc20xUnY4anM4dWFEOTZuc1QvenFo?=
 =?utf-8?B?VGpteVg2UEVjRzYzWEtnNFBHUnNLdUxhZDdEemZDYWZRQXZaQUVhRHpnSVNH?=
 =?utf-8?B?VklpOU9aRlFRQSttS2FGZTV0RVNXa0lwVXpYZnhNY2wxUTdQODA2andUWjhq?=
 =?utf-8?B?M0h4K2VsMjFHYmhIOXRIemVZSHdmQ2xNL3Y4cktWOVMvOWlxdzZjZFNJT2lM?=
 =?utf-8?B?emVjbVlvWmZkanBDMW5RNGV5U0JiVXd4dE16clJFVWV3dEx1dk5USmVOZEtB?=
 =?utf-8?B?QWRobzg4WDA1c3gzUGViT2R6aTl1VC9CMndrN25ZMUdMTVRoVGVqM0tTWmtV?=
 =?utf-8?B?cUtZRHZVUndTcFhERUlHK3B2UktwNkMzemlQeHdaZmtFSWhpMUFGQkZKTFZG?=
 =?utf-8?B?RG5WZXA3SGpRajF4aTMyQjdkWkZwcHFrdCtoeGd4OHM3M2lwTmxQU2RHY0Ru?=
 =?utf-8?B?NDNKYm9lWUlOYTY0RGgzZ0lVYzVDWk5OMmIvN1RORFNDclBjeTRlbWhIYWpZ?=
 =?utf-8?B?bWtiSmtkc1dOSVg5V3VXeFVtZ1h3bTlXbXdidzhWZ1d0UTNXTFZDbkZFZVdK?=
 =?utf-8?B?eWZKVVpoL2JxZWVmUHZSMyswY1FVVzRvM204RFp1bzZMSVA1aGhtQXc1MGxW?=
 =?utf-8?B?SDVjZi9iRmMybjdNQWhFUm0zaXZFZXROWGFtWFdzNVhvNUkyQ2N3RHJYNUl3?=
 =?utf-8?B?RjRXSGo3ditKU2g3TGhuMi9tMWZVWnFvaElTZ0JtNEZTejJwUDBqcjBHU01P?=
 =?utf-8?Q?oj58=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azN6MnNZMGFZVWl2bnFEVjRwK0FhM3BWbkw2bVpWMnBsSTE2NUpSWVVGRjRo?=
 =?utf-8?B?MVF6WHQ2TVJjTzFwaW1NQnh1TURkRllLSllzbFk5djF3RnBBQ0NkdXNDRllU?=
 =?utf-8?B?OHNqNmlpa1ZBRFBwdk1nMncvTTE1UEF2VUtTL2tjaGV5T25yUFNxTXNiTElP?=
 =?utf-8?B?V0IwU0RCTjQwRFplTm1ENU9tK2lJbEhRQnhQL2pkdVNNY1dtU0R1ZjhuWURi?=
 =?utf-8?B?akwwc291a3BJR0Z4U0FFZ1N2REQ3ZjZKRmNaSUZEZDIvYXQwbGZvdHZvUThR?=
 =?utf-8?B?RGwrOEwzQUhDc3EvWStReUEzelh3cDNzTHY3NE5sRWUrOXAwRzdMVEtVSTVE?=
 =?utf-8?B?eTNiQ3lFclVQUm4yaUMxWW4vRzUxRWNJdHQrcmprNGJ6ZTEwK2lhaFMvQm1F?=
 =?utf-8?B?VWVVcmV5MWx4MnpMam9jMzlDK2gyR2l4SmNFaHZjSUxkc09PT2VzdjlQcmJu?=
 =?utf-8?B?ZnFoZ0xSblMzTXNkdGszZkhkcGxrRm5Na3JsaHdUOG1SOWcvY0llRzFYc2Mr?=
 =?utf-8?B?YXlXeEdjeHhFUkozQzFCRjgxNGI2TXVWNzdZY21zM1FEekVEMkIyWTNpQkJz?=
 =?utf-8?B?MU9FWXhmS2xodTRxbDdKUkR2Z0N1NHZzMXIxdXFFSWNIMlUzMlI3cDY5K0Y1?=
 =?utf-8?B?MFRVZzVEeTVkMUxhTWJ2YU5hZmJuaGV4VStvS3ZIY1h1NitXNVdNL3NBMWFz?=
 =?utf-8?B?R2ZsQUxxOEpyempwcC9jU1hWMnVacGVTQ1VORTd1V3RMK2xGSFZRRS95V0lD?=
 =?utf-8?B?UE5qWmw0eDZUaDNSemdjaFh6SEVod1JGWDB4YVRETzBaN2daUnFBNmpNRzFR?=
 =?utf-8?B?bWc3VzRjcElJQjVvSVBhdytzSUV0OFNvMENDZzIvVEdaQ0t0cG5qdmlDWER6?=
 =?utf-8?B?ak9oaGp4QVpmcHpMTmVIbXRZZ3RJZUNnN0FWWUdpZ09iQllUNWhKL1Uwb01S?=
 =?utf-8?B?b2RBakgyL2FVZHJZbDRZTkppUW5VM1pnSnNYZ0lneVNmWERQTkJvYlBUNUJt?=
 =?utf-8?B?enJObnkxNVJHSkFsa1ZhOTJydGNMSjZsaFcxVE9qNENISmwxREFWaGptRWo4?=
 =?utf-8?B?dUEvejZlYkVpQkVLUWtUc0FoL0VMU2kwR0U0b2FHV0dwS0prZit3Zy84cFVG?=
 =?utf-8?B?S1lkVHZsaUFZMS9HRkl2cE5QSHZuVndxSFJET2ZVVndHZXpRcTNaZkkrcHMv?=
 =?utf-8?B?UGprdnJ5VU5NazBnODF0aDVodk0vSTZTQS91L1ZwOTgzU0JlMUdpOGpBZ0RP?=
 =?utf-8?B?NW90YzM1MWxVUU5BbUZkOVdoYzk5VVNXeWZ1TnZkUmlXd2g5SGVPdDF2cmlV?=
 =?utf-8?B?ZU51blphRm81K1libTJsSEhsclM1ODhQRWh4VCt1bUxPWVNjbGFkODl0L0VL?=
 =?utf-8?B?TkRmV0VxcWxGNjljRXdpbDdManVZLzhndldNZmtFWTVMYTIyRHZZRlpwQ294?=
 =?utf-8?B?bDc2Tzl6Mlc3OFBsWUNrQ0ppLzdsZ3h1VVVld3VEV1cyb1J4bkhzZkEvSDRN?=
 =?utf-8?B?d2hZdzZvdTA1YnZZanVFSkttTmRYdTF3QVk4RVIyZHpsSXVzYnVFWW5hbjJm?=
 =?utf-8?B?VzZQVFRpUGcwcW1JVXVqTjBUdGgrQU0xc3ZzNlY0U2dBRElhdnZCaklDL1Jk?=
 =?utf-8?B?K2FWUG1YY1l0K09ENWdLUGQxUjdTNjZ2WXlkT1ZhNEc5akJiNTZqRnU5NVlt?=
 =?utf-8?B?bjRvSWVKSnlvUmx2K250YzNOT2EvVm1wai9oR0V6TElKaGk1enVZZ1k2YXc5?=
 =?utf-8?B?Qkg0QVRlb2xXTkJqdXNnalpFVWl4SGN4QzYvUHJ5WlkvaHRJb1ZSZzVKT2k2?=
 =?utf-8?B?c1RyS1dWd1ljVzRxK0p0RkRSa0Q4Q1JrYTZJZVlKdkRIZ0R2MHBGRUZoNzRF?=
 =?utf-8?B?cnpjL3hDTzF2Z0ZMNVJ4MlJXTUtvVlkxY2pEMGFYSXJkdm1qNWZ0V0M5VThp?=
 =?utf-8?B?RXhURmM2STNWNzJBVGtaQzlXQ0szOG9KRERHWXg1WDZxcStQSXBwelEvWDRD?=
 =?utf-8?B?VEIyL3dZSmc4R1Q5dlhZeWUxOEVPOEhoNWQvWWFFQXZLb3I3aEdLTVpQa3Nn?=
 =?utf-8?B?akFZYVpGdlZ4Mi9IT1lCdXVJNGJSa0Zxb0RkbHY1bGxFdlRhMDJHRm8xY3U2?=
 =?utf-8?B?Z2VmcHZPRkdTOVFHVlVlc1JEWGo5R25DOThhTnFOV3g0STZEVjloamNrSzA5?=
 =?utf-8?B?bk5ORDhRUXVBd3V1bVB3ZHQ5OHhicWRzUTl6U0FRU0ZqaHlSOW9uM1hpd2Qz?=
 =?utf-8?B?ejM4L2ZkL2ZaMmdBYWpxSnVHYk5qZVgxVE1DVFhDNk04SHRFMmQwS0dwQnJV?=
 =?utf-8?Q?AhfCuLjuXTYMJj5jL6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b573c5-4898-4fcf-91ba-08de5f6d3b97
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:33:09.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbLeUI0An8Sluw3rQC2wk/U6p46f3Rz1BHVCo51DUxs2IWi3ROYQY6zmFVtHUNgLvDMJE4MVTkDA8WszdrJ42Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308



On 1/29/26 11:39 AM, Dave Hansen wrote:
> On 1/29/26 09:32, Pratik R. Sampat wrote:
>> In that case a fall through for TDX (with a comment explaining why) and
>> panic for rest may be the way to go?
> 
> No. panic() is an absolute last resort. It's almost never the way to go.
> 
> What else can we do to ensure we never reach this code if the platform
> doesn't support memory un-acceptance?

The panic() here similar to its existing arch_accept_memory() counterpart is
mostly to guard against a cant-happen scenario (unless Kiryl had a different
intention writing the initial hook). It is called from functions that compile
this in only if CONFIG_UNACCEPTED_MEMORY is enabled. TDX and SNP are the only
two users of it today.

