Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E825D1E1
	for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740609624; cv=fail; b=RV2+fsXN40lPaOa/b6tod1PyjK4fSdgR15KCkYSHN0FmSu4EVC9LSzL8bZ09oN1QDJNjgVqE/uJdbil7yas3NZBtV1wevB3bB7MRm8cxOSEg9FzhpPlJ1MWLbHc84dftsjT69mmuCXK6I53RIDHi3yg+IDRyLnk7elmhCyQ11z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740609624; c=relaxed/simple;
	bh=b7+fU94nefFuizyupuoxvHSyTsGUVeN5YiZ0xKUXcQk=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=Ei8ElS+Q4IAdT15sgmM3FYkNdsnJh4PYrjOpVzgUcKmo4N/Wed3Lp505A58n+AaaD7Mt5PzQ5HzUkg2qAPXRyFzQvpCHEPrzNV23jSAqziAHUxTml6nTIKva8zoQ44VCouRaQLHQUmnwbPKiod8QSzyG9S0jngYMmQdP2QaRNWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UMxq/RLv; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UMxq/RLv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TndS3UJusHfY99k4MnYmoYYmbXjmij+jkZC7qv7o/wjx/385mNu1HJnmxh8jKGJO4/pFEG0AoPL9jTEYQT0WbGV8HEka7KUGXn/3cge8S5B2h7jZtR2vgzeo748Ca8yKzyxpzIB2+ps5g9G4LBKQhjZ77qtJj7CIwKvamRRPaQYhHXI3a46JcqmP3MAqGw6SgQNsr0YZzBE4A3lc8GpwhEZkdRcS1/iTu+J5PVHFFnYeNG2RK+TaILaP4Ncxyyd1bQFTzo/eaBzGMZpPp2tLwDGguUzvvXem3Lulc4ERchMkf9+rsgr6FlxWdTZJMvdcAhpiddX+/q//5104IHphrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7+fU94nefFuizyupuoxvHSyTsGUVeN5YiZ0xKUXcQk=;
 b=bGCMfuxzQNhADXsEdaHffEOLl4BQAht4uylXaCxEDm07pBgVW0Gp2GNtUAPjQ/HZ2TD9Ni6RMioT33R0jxxrgrdTrwBS24Jl/hLi5jjkBk/SQv7U4SFEoCZHaVIBmvIeVXC+4+47zqganE2wE8xOBgCWwH8lJUt+wiXtTJdWfgW/C4/aVs7O1ADEGjzP54MVL6OUrfFSO/cSgPPwudTb+Wb38fV8clI2BHSKdIpiztP73j8lF7FWa5dy0s6g96tXHShFFFs5XnaYS7EIwqoM4WlHw9KSB0A5E2jyeiZ69duxaE5Zu2TLegYkphf0faIETA7K2fOqBk5lxHqjwZU3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7+fU94nefFuizyupuoxvHSyTsGUVeN5YiZ0xKUXcQk=;
 b=UMxq/RLvStI63bg8rHfE4Sxk+2CeRt3G69gUjtYFZL6xiz9NvTIsxmaWL7BJl+ALeuDhJK8G8GUQDVvIGLwGlRVQgRsFNJ/B929DEjDd/mnWTW5JCzG2zvAwkDa+7v851d5lAps1z+dHbm1sw97wyNt5zCGhb3hcC2Ns6pjuoSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 22:40:19 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%7]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 22:40:19 +0000
Message-ID: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
Date: Wed, 26 Feb 2025 16:40:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 svsm-devel@coconut-svsm.dev
Subject: GUIDs in the GHCB and SVSM specifications
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:806:f2::16) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 35fac199-9f9e-4a01-8108-08dd56b68c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aU4vdjFoVmx0UEE4ck1MTzhtWkZMU2IrNGs1Z1RxRUttK1JrazE4Uk1JcFBG?=
 =?utf-8?B?UEZtY056QklrazJvL0k2b0FhUWxHU2tta2NJTks4eWI5Mk1xdHMvMnBESFNt?=
 =?utf-8?B?T3VSTmhUL1pWVDBJdXJocUc2R3k4MXZRVDMzSUVSTjJScCtseTNtcmxnZG5W?=
 =?utf-8?B?Wkc3Q2c1UENQYkxxM2hPWi9GNnFyRFZxb3JBU2xHa1lFQ0hCRWpTeU5jRFV0?=
 =?utf-8?B?bXNJdnZVSFdYR2w5QUM0c0tUY2VJb0gremlYN1lIVGZHYWJOZHpvc05IbDNC?=
 =?utf-8?B?ekFSV1lBTmF3ZDJwMUQxVUlUS2RJRHBNWVlGZ2F4OVdHS09vWEFzeUJTTkxk?=
 =?utf-8?B?RTRUZ1hldFZzNzAzRDJ4T3RSelYzbHM1MlY5dkNrRjNmS3IrdWtVUzVPZEhk?=
 =?utf-8?B?ZXhjMHNmK2RDdG1jRXRyTkRHbU9xVWxuOUVheEVrQjROMzZXeW12cU1lbFJ0?=
 =?utf-8?B?NDdHdmZKSGJEWVk3Sm1kVmxZemlPSXlHYUl5eGFYaUNlMnV1NlZyMTBwam9a?=
 =?utf-8?B?aDgxNkltU0k5RkpSQ21qR0N2Y3d1d1dKV3FFaE1lejRRMmk1NkdEWHhFVk1x?=
 =?utf-8?B?c2FyV2JwYitCcE1LNTJ5VEsxRmhRNXRkNURHdDBOSzF4cjVkRVdkTUNWVitK?=
 =?utf-8?B?M3VGV3BYdXZMUTBtZDJUczJWUzArVEJPSW1OZnNkMndzeVdnT3dQL1JKUm5D?=
 =?utf-8?B?L1F3MTVIWWFZN2tHL29PNDNyV1VWVnYwOUhYY3NaYzNvVmlmM2s5THlrT1c0?=
 =?utf-8?B?cXp1NHFTVGIzdFdvVE9ubGQwOUlxL1B0NEZKUjliS21mRVRnekU2dTltYzAy?=
 =?utf-8?B?dXBvaVBMdWU5SWZDeGVmbkVBRTl5Q3A0WEJ4RFY5ZEgyUFdmMEtXbWQ5Y2hH?=
 =?utf-8?B?eElIWXJJbTFQYW9TL0V1YzNZbWQ4VmdrY1VnVmNoUWVFNWRlWHh3NHhhRzF2?=
 =?utf-8?B?SWIxY3ZONStib2FQUnR6U1RacUE3YlFGaGVRcEZ3SHFhNEhDaVA4Z2RWNWJr?=
 =?utf-8?B?TWVKZ2Y3QU9vWHhBWjlUbnRWQzF3VndMa3Uxc0puUEdDbVlFbGRjTXhjLzIv?=
 =?utf-8?B?aGkzd1dCQnZWWG8vc1h4RjFoTlFVczBMWXNKdGpUb285SlFCMnRZTVJlWTMv?=
 =?utf-8?B?TERwTGhKdWtVUG5PRk0wRXRoZzRTM3pBdkhuWGVWc3pSUE40UVNOamJBRldu?=
 =?utf-8?B?VFUweFlsNXQwWkUrQVFkUzZKQXcza2dURjVvRnRnY0JWRUhyMFpHWUMwbE1K?=
 =?utf-8?B?UWpmNGtTbWY0Q1hEWENMeUVQazZBVGhid2NKZHM0cUpHS2tKNmRlc3E5a0c2?=
 =?utf-8?B?N0Z4dnVIS29SWW9UVFp2ZkJ2THhCZ2swWC9LeFJRRDhqeWFWRVFncTRsTmdN?=
 =?utf-8?B?K0hqVmozZFFnSS9sVzZRU01JUUFOMjQ2Tk5ZZVlZL2t4ZVF0Q0RVTnlWaU5z?=
 =?utf-8?B?ZS9XbllSUXYraWUzMHJtTDh5anNvQlpQdUFtdU1QYjJiWjZaL3lKZ1drNHBQ?=
 =?utf-8?B?UTN3cWQ1OFU5bWtRTlk0c1pFQ0kvQ1oySjJaREVtMUtvMEdCNFd6SzJBSlRj?=
 =?utf-8?B?MUwrQmt1K0VTekFlK0pLNFpvQmpyM2RjZEM4YVdqbmxKR3NTSmt0NG52ZWFX?=
 =?utf-8?B?MEpKUjVVSUdlcml0SS84Zklaa2R4eDRBZVE5QXJWVUdoWkh1eERFMW5Hd0x2?=
 =?utf-8?B?dHFqV1FVZzdsOGRiT2hUVm5EOUpiY0pqR09qQlBTZGlMSWZSOGFhbWJwWXFn?=
 =?utf-8?B?a21VVVo2QWFIdUtjN3NKL0h6UXVEUEc4M3dwRTdudGt5M2lMNkY0WWV2NVcz?=
 =?utf-8?B?eEVBcDlxbFRjcnlxcVltdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2RqMGVkd0JWV1lhT1luQTNZU0NySTZGOHBxcEg2eFcya2l0bTBxamRlOWJX?=
 =?utf-8?B?N1pPaTIvSzJSTTRWRHlESGxMTHcwNXI0Qk9VTnZGNWt4dExTb2JzLzl0WXFy?=
 =?utf-8?B?eTBXTEthV0ZUUnVaT2N4QzZOVVZFaW5WUVVHMXVzRjZENUhGTTNDVG5uZFhG?=
 =?utf-8?B?SXdoTDF2RGo4Q2NUTGRmMTBrVlVvMzJWcmhIRFkwcDMwWTh1UlBKZ1M5RGJz?=
 =?utf-8?B?cSticUQxcEVXdzBGMXZlelBpY21XOTZON25tdW5FL3NucW9hR1p4bWRaQnJX?=
 =?utf-8?B?TUZCd3JGTEljTmdaZzRDKzdhZG5FdXlLWm85NG95MmhSM2ZWekM5TTlSb3Fi?=
 =?utf-8?B?ZHRDTHlxdWYyRjd0OVdjMUYzRGtmaTl2aTFPcVRGWStHSHVnbW1qbHYyNVI1?=
 =?utf-8?B?eUV6SGJsQ1laK3VGbkRLSFB6WWNyMzR0d3VhajVWYTM5UXFHZmp0NCtjZy9z?=
 =?utf-8?B?cWtSS3BHT2VPWlQ3VFNDWlpvQ3RhVXlhUElmZGc3YWY2b3ZHU2VJRkRLU0dx?=
 =?utf-8?B?UWZscHN0Y2h6RC9WODFNRVdJTklEeGI1bzVaYlpPL1pWaFU1dmpJVndBVmVV?=
 =?utf-8?B?VjhHT3lpcHZ1U1k1Z1l2TTJwYU5LWFJNZkprcFUvSXFxbFU1OXM5aFFpVitI?=
 =?utf-8?B?WkMxcXgvK0RUd1JZREJPdGtZZEozNnd0SU0xbHlHdVNUNkxvNjJVaW1QcWVq?=
 =?utf-8?B?MHRyTUYrOU5pNHZmcnNqUU55N0hhNlhUZFh5MVI4TFJ2cXpsU2xYUkpGKzlv?=
 =?utf-8?B?RDdjdUh2bXBVVDNKZ2ZDTHI5dGZiY2YzZmxYM2dseUV6WEZnOE9pZlF0UTVv?=
 =?utf-8?B?RCs3VGFUVGY4elJpNTlRaWk1ZkFNV21OQWMrZXdBNkxFMzRDL2FCMWY5eGky?=
 =?utf-8?B?NjJvbjlvMWhaLzBtR3ZwTVUyNDBxN1lldm9UbW0rUldkZWI4K0kvVmNHK0Vt?=
 =?utf-8?B?VWZqZzB3a0dHTi83aFZHbzVGbmdFVWoxenN1OXJQbHlseUNvNFNkaVRKWm5q?=
 =?utf-8?B?by9DZlBqQzZYMXlTdzhDSzdDVnFMK3RoMjlPd3Z5VStBcURBVlA2cnY0Wit3?=
 =?utf-8?B?UzdJWVU1blBhb3Fock1mdzJhSU1Pc1prYk5kc3BMQ0Q1VHdjT2hSNEtkZUlx?=
 =?utf-8?B?b25sWk8vN2ZlOXBwM0FLaGFKTWpJVTlYdHZuK3hDamtPZGNUb3RuZ0ZTRjhB?=
 =?utf-8?B?S1g1b1pwOG8xYjhkZW9ESGdDZHRtZHJBK2txdlNOVWppVjRLTklPMk0wTXlS?=
 =?utf-8?B?dUtTOW9CUitYODBETDdYdTVIUGljaUFwUGlhNHN1SUZNNkhOemsxZkhoWkhU?=
 =?utf-8?B?S3VKZzRhOXlqMEdpS0x0anVtVndiSHBMMlpnbTB4dmdWSVBxUXNhZ3J3bW9p?=
 =?utf-8?B?NVFDem13SmhkWDVvdnhiWS9qYzV3TndZVG1tY0lsRWdZRGpTVVRCZlN6NkZ4?=
 =?utf-8?B?Y0lEUDladllCcVRwV3JuZmV3b3Fwd1lnemxDTXhyWVZ6N1BxNHhNREc5SkdU?=
 =?utf-8?B?Rkp0OW04QWlVNE9BNGd1eTk4ekdPMG9lNHY4L25GdFd4MUtOSnlWWWpmOUtL?=
 =?utf-8?B?Qm9zdnhqUUc0ZXNiakJIdGxzRy9SWVdOZjVoZGFEQlJNeWtOeklrc1pIb2lH?=
 =?utf-8?B?SFJWY2w0cWp2V0pBTVNqSW80VUxnb1E3T2hHYXdCSk00QzAyd3pEYmtYMEEz?=
 =?utf-8?B?S2F2SGhONVRqdy9CZWxYUEVhZDlGRTA0RWkyQlIxaGo1aEs4enUrK3pkODRw?=
 =?utf-8?B?N1MzdXdEVVJIL0Nua1RUMVVjSHh3bjZ4bHhXSHMrRVhKdXBRM3JuWC9sM2Fi?=
 =?utf-8?B?NFJua2g1eFhqQURUdUI5QkZVWkhtZW1jTExrZkxEOGl1bGZPTytwWU1vM3g1?=
 =?utf-8?B?cXdwdmsyakdnTTI1SytLek80RHE0WGlEdllqS1U0WE5MYjV4VUpSNEl3aEEw?=
 =?utf-8?B?QzUxYlRFNEpuL29qc2Y3cWVQUWZIQ0NRL294Z1pBcFk2YnFkL3paZlNMMDdP?=
 =?utf-8?B?TU5ORllQbHZhb2g0Y2Y5RVhrK1FKZDZDcnBzSDdNV2YyemxkTElQa3VCWXM1?=
 =?utf-8?B?VFFZV1UvNm9Da1RkRXJoSWlqTm5tSFZ4cGhSRDRwU2JWTG4zbDErYisvUUpF?=
 =?utf-8?Q?5LVksIwN2dB2biTu2O415Xxvs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fac199-9f9e-4a01-8108-08dd56b68c3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 22:40:19.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEb5sIxfeQAmeEBb3WRQruC7DoWmO+shLwsNAUE4pOK4EnGv6NG0yU+X3aRZ3Tjr7pXYZLHzdTu3bs/pFMWx1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153

All,

There has been some talk about how the GUIDs in the GHCB and SVSM
specifications should be encoded [1]. The term GUID brings encoding
ambiguity with it.

- RFC 4122 specifies the format of a GUID/UUID and the encodingas
network byte order.

- The UEFI specification says that their GUID format is that of RFC
4122, but that the encoding is different. UEFI has time_low, time_mid,
and time_hi_and_version as little-endian encoded.

Given this, the GHCB and SVSM specifications need to be updated to
specify the expected encoding of the GUIDs.

The GHCB specification will add that the certificate GUIDs follow RFC
4122 in format and encoding (network byte order). This is based on
existing users and tools that have already (likely) been using network
byte order.

The SVSM specification, however, because support has already been added
to the Linux kernel using guid library APIs, will follow RFC 4122 in
format with an encoding of time_low, time_mid, and time_hi_and_version
as little-endian. In Linux, the guid library APIs are guid_parse(),
guid_gen(), etc.

If there are no objections, I'll make those changes.

Thanks,
Tom

[1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r1963201009
