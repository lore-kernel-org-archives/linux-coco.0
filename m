Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD75867C4
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 19:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156757; cv=fail; b=jDmMFbtwelNSl0XUE4j2nRq5Pe+aNOmEfOEO/6SmuTT58evaSTuqq52MpbZfKmIog5yaQ9BycEilMb/nhI0ntvMhn05W/1U+Nx5qCo0uC5/s1JaAu8yGm+GA10ar27otuo5luoFU3M2icrbxh2zxqy3IHtdxLbBZcUVuFZkD9/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156757; c=relaxed/simple;
	bh=FzFRUIz+2Sl7EyrqMsrjbpacgCq8vSu9Akk4Dz7R038=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tTxUECxb1Xwkhge+K9UZsmZzfpI8deo1QEqGwptoyEGHvPgS8f90N4oE8XkolggxqCeH5esyKwgOXRCrOxS67bh95IzyJRcjYLkii7Am8445FP7jzuxN3f9tJBU637Wr1HJgJ5CdGMguhGE52m6NGZbAQly3O8F7jf02fhIzqrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFI3ghhv; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFI3ghhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789156754; x=1820692754;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FzFRUIz+2Sl7EyrqMsrjbpacgCq8vSu9Akk4Dz7R038=;
  b=hFI3ghhv1cZrSr5V1ORxMm9luozopKA8C3h128t9PYTsUrHSgSUin6Vk
   lXryStYehZI4G0MjAWnX1QvSevk6pacsomb8rw2dx73O8JQCcbGHStPuH
   M/KQ3MGMiN4DcGlkhdvzz8E9GXzKyf4Kz7i8xeC7BCwi0rMnFIj1qwxeo
   lkFrvReOQ9y1ll1PR2O/xEWT6gtjTK4lulUnMdosXdfMBca7Xo4Rljvlv
   c3RJFqMmvuHQorQo5fbXkFpLe7AaWPct6/7+W0ngqij759dxH/6MVTXAb
   NZ+KSfRiJAj9qg6HVLK7yymDhTTEK7b1HkkTiluCDWLYCF0ncUWwBxEKV
   w==;
X-CSE-ConnectionGUID: vSYjeWEXQhugvMoenWMO5g==
X-CSE-MsgGUID: +pjEgRcaSBGq4Upr+eRWZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93495104"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93495104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:59:08 -0700
X-CSE-ConnectionGUID: 9hYTHprESKu63JkrI9pwoQ==
X-CSE-MsgGUID: LoH5M0PFQH6hpf3D+N27HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="271984705"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:59:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:59:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 12:59:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uno/yC/TdzT80ZZaJtoSCCj0OIQdENFl5kfEdhIQm3dW0Z8aOWvtPwv5bi25J7S7B74yHhRw0BeNIn5mstRZ1+t/Fpk4Eqr/eDFdzR/uW+Hm71N4+/Bix0k44d46OIE+HAVje+AvdHaxhtcNLJR2aT3yZbbWn0Bm/zZyCWjoV3YxbuRe5+61k2RiFyA+9oz8bKxx/g/QoFDRcoKibTPYjZrsaVmye56YRw7Laref3sBZLm2Sl6VT1cbVspX9wd3w7N+CJ17EGV1RqnSqE/oCSyZV62DzbNr+SOmyJ96Gd+czezzsUzPr8HXH/Yz/CYtsxsSWjhL2LC35LDUTX7LVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yuA96EKUqisrZ+th56as0kiX12HlR1vrYx2DL1YOhpo=;
 b=Fl6DHXx0ax49uCnR8lK4tJdElxvaOkj3gsJHeifiNn9Ih2JNf2/p8z7iIaqsWHA5LZ81gIg9zk3JTFzV+MZra9kHW6k1Inqk8vxQOvGrgv3TpntuO0yYQtokioOUK+E8fqkTDBz6jouFQzn487Ly+rEcu1CcCxEHm8QuJW5LUeyDDlMo/uvv6Kw8nisHw6+gg//rSz0SpK8hKeMC1XH6DZ8SoZ8yT27ctEkpmwH7Xt1iygy9mpNnsCb9D+KU7vicbB8bb+J2oMMXjVuzWUisLMFmu9atXaZo89HNLhNaCCMVpTx8gYDumUZ7OW+yqZforsNv+0tdn6t7CO0Gi/ALtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) by
 CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.10; Fri, 11 Sep 2026 19:59:01 +0000
Received: from DS0PR11MB8050.namprd11.prod.outlook.com
 ([fe80::f099:a504:2ad6:1d12]) by DS0PR11MB8050.namprd11.prod.outlook.com
 ([fe80::f099:a504:2ad6:1d12%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:59:01 +0000
Message-ID: <a9eb5e96-1e2f-4662-9863-61317c163800@intel.com>
Date: Fri, 11 Sep 2026 12:58:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kas@kernel.org>, <rick.p.edgecombe@intel.com>, <dave.hansen@intel.com>,
	<dave.hansen@linux.intel.com>, <yilun.xu@intel.com>, <djbw@kernel.org>,
	<linux-coco@lists.linux.dev>, <chao.gao@intel.com>, <peter.fang@intel.com>,
	<xiaoyao.li@intel.com>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Kishen Maloor <kishen.maloor@intel.com>
In-Reply-To: <20260722084634.131020-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:303:85::29) To DS0PR11MB8050.namprd11.prod.outlook.com
 (2603:10b6:8:117::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8050:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 260f8894-a2b3-4265-7a70-08df103f1fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YuN/k6vasPvrkomCXdBVXJ95Y0DEvk6qCj0J6ej1JIg/19IQ7rfrGzSul32JZ6vnDE0Z4FEJKuBPV7dmSTkXJPzTHh2UdP4zdHYuOof8n5kyZmKMaRkDcRbv/F7e6LdaHATpdmb0D+eDrDYizaAGXZwHSZa5uLviZPgcO/w4bNEkQK46tiye3CRouhB+rezLj0pU9MuXt2YjK6GN92iQgKAHc+yhPFnoQfUsdWnv7BP7jgrEdJf9NdFHLaCgoyomqwXn7ckoBg2NRuomrKD9mZtKbGmXEYoL0FY13K3nI9VVMBCK9Q/f80kzsGyf6F46N9+st84oPOrmNVeMIQSxUxyOvg+tjNprRBf9dh0aynojlXfRtBmXtU0X55XA+ViUnBPNveqfjlTlewFVSDxmE6VEQ9/CQJD6l9izzQmVzeE3ciFQD0UIsV0NKfNh3YuuNPMmH4s0EzA52P3l2exu3oONED10nSOFyrKDZHvPX/BiRZ/A9twauQO510N6yV7RvHfNeS2nZQowBc91wF6l6szuaIGsFRFjNSk/+qiS7GkZTp8VD9uuW4yZiWj2nh7l7zQY1PohqsZBwYz+AG5fR/fDHGcD5qjYI//qltYulP6txdiFIth09VpUfI7n9NYNm/DHGPMoKAVW0WbDD2SXRGpnEP5UePQDFhTL7VsuTrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8050.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEJMTmR5SkdRclN1L3hQZHJpTldnRTUreEFGeHI1dFBoc0pYYjZGcUR2RE5Z?=
 =?utf-8?B?d2NLMWU2Yk5iZlZoOHlwODAzUExJNW5rRm14ekQ5NGJSS0lKVmllWGl0MDNK?=
 =?utf-8?B?SFcycE8vaFBvRi9uZkt6d3U2RU93dG5rdjl0YldGcG1zWURzdURxRm9xMFli?=
 =?utf-8?B?U0xZOTJLM3RPanpVZWFaU2JwL1ltR2JFaFJaQnI2dkNQTW0xQVNBZjZzNzJ1?=
 =?utf-8?B?T3RWem1iLzUxSTd5elFxeUhzT2xyMEJrNldMOWtaMnBHY2VZZzBWcFpZdnla?=
 =?utf-8?B?dHdDR3BYL0JHYnVUeWNGZHkxQ1VTWTZocVdKazdhMzFES2k4VlhSR2Zvc0Qr?=
 =?utf-8?B?UWM1WXVTZ2dxTmcwcUtNS3UxTEhJRXdXb1RWbGh1bzRiaFJmNU1yRUpDNENr?=
 =?utf-8?B?d0FHMXFqSXkwdCtHV2tER29JWnhDeEdiRC91d0N4dzd2ZTMyL1grYW92SjFN?=
 =?utf-8?B?VFpWZDZhdUgxaEdqcjU4TEI3V3JOT1VWOFFZRG5va0g1L1NyWHZKVTQzVnNI?=
 =?utf-8?B?L05sMVkveW5aaWFFc0N1eGdySVdZSlk4S2szRHV4MmVHa2QyMXBFM1pPanNF?=
 =?utf-8?B?UTJuUkhrQk1lWCtheXVoZVZQTVp2bm5vZEN4Zzl4Sm5JT3hRNTRnR3U2RUxX?=
 =?utf-8?B?VDVZN0NMUDVYK25CREdMV09XRVBGa1J5Y0RaRzB5WkxZbEtCRzROQVpQL2NX?=
 =?utf-8?B?Z2t0SmFDcndaTnR6aS94eitPRHNaL3dhMVhuK3gxS1dFMHk3NFF2dTBra0Np?=
 =?utf-8?B?M21LVUdOSWEvVU1laHdZNGhQUlhIUDMwYjMrNUVZUE1McStuS283T0ZTanE1?=
 =?utf-8?B?Y1hmZHk3aHBQT2dRekJIVzRRS3h4ZEg3TWo2TUNYTTFyYlNWWTVOUk9kM2xn?=
 =?utf-8?B?TUhQWHFUQzJkMis3QlYrMEZTQzJHODNjUkI4aFMrWGNVNmtWR2dTa2srQkxK?=
 =?utf-8?B?RWVvT21TSVk5d0Ryb1F0NGJyYVRjUnI0bFRpakQ0UjdZMXJoS3h6d2phVHMv?=
 =?utf-8?B?UkVPUEpwSzdCdm1kSjJDK3kyUkF4WjRldm5BclBiWldadzg2ekN4RmhCRC96?=
 =?utf-8?B?RGJqSWtuT2NqamdvU3MxMkNuRGg0dkVCeXBMcW9reUtkWEVvQ1RMOW5BQ2RS?=
 =?utf-8?B?VHFuV0xqVkl4dks0MzU5U0NzdlI5dEQwdkp5Y05ML2NiM28xN3FHNExiNUwx?=
 =?utf-8?B?V0N4QkVPZlNPeUdmelp3cUNWWlA0ZWtBVmZ3eTYzU2x1dk8yWE9SZXJZWWIv?=
 =?utf-8?B?NnF4Z051VVViSm1TMUx1ZjhKcHdyT2k5Sk5HR0dMOGtNUjNERlEvT0hPLzBk?=
 =?utf-8?B?UHFoRWxiNXEyNnMra3dlOGlOV25laVRlQStjNFhqZmVnSjhnTVNoQXd5OEhF?=
 =?utf-8?B?OHp0bFc3RGtzUHhmK0VmejRhR2QxQ0JGUnNEZFFDa2pJL2lOVERaelBwVmJK?=
 =?utf-8?B?djhXOGRObHViRENTNE9naUpodWhvTjVLZUNpSEpBQm1KTkFYL3lnQXRoQ0J4?=
 =?utf-8?B?aUZXcElnaDNuSXBEYWplOTh6NFoyWjVsb05KMXNaNTdlL1cxWEJ2SlgzUHRI?=
 =?utf-8?B?ejluYms5N0pjb2FvYlNUcldTTWxXQ3phYlY3M3RybXM2b01EVW1YUm5BSVMr?=
 =?utf-8?B?eVl6U3BUTm9ZWlNaTzZTVzV4RkpEMWRESVk1VHVJMm9KSzBhRkVzb1lXZTJV?=
 =?utf-8?B?UlgrNVNuYy9FMTlmZzB0QlZhdXdoTERyMW9EUkYrL1hhWi80NTlld2ZOTUts?=
 =?utf-8?B?RVgxamdZRFRpSjlhSGtXWEp1ZzBUd0dtQnZPclBjNmpxZ1IvcHl4cFRpUnpk?=
 =?utf-8?B?WS9mamhaMDM3SFZidlRkYVRmRFNtR1o3YVZmQXdQbUh0L1lUaVR2cVh1Y3Nw?=
 =?utf-8?B?RkVuTEE4UEFJaFE2dCtSa0g2M0FnR09JWkJtZ2x1ajh1YXZMbXRZdjdpUnRj?=
 =?utf-8?B?NmJRd1ZERjIxS3ovcUVuZThqQ3lSOGFaRTJQeGVGTVBNVnZuTGVYVE1UK0pI?=
 =?utf-8?B?VTh0NzdHUHlqbEZjWDBEZ1EzSTlES2dsaXpLd0JCMGJ3dERmSzNhT2hyY1RD?=
 =?utf-8?B?VlVJU3dNTlNmU2hSL1VpQUt5bVhjVDI5OXpwR0V2ZlNsMEkrY2xUNmFPbnlq?=
 =?utf-8?B?cjgyWGllQ242YVJMUnVuS25uS09FdmFDQzFJQ3NZeld6cFR0ZmhmNklKUXd2?=
 =?utf-8?B?dCtkUEFHdlBFZFJUREhLemZqN1IzT3N2RHltT1pyczhDanZmc1VBcVdsWEg1?=
 =?utf-8?B?VVUzcHE3STE0T002NmlEMFUwR0RobWFJOW9YVjJ0NmNDNGh5cTlUYXRnWWMr?=
 =?utf-8?B?ZnN2UEVjL280WTFWMzV5VjZsR0hubjNaaGRvRFRSSjUvL1ZtSTdMQT09?=
X-Exchange-RoutingPolicyChecked: 3n+RGKnpTc5aFTEcXY5yaS+DHg71mP3WslivQbB3YWkESsEn8rTcHz6hB7fz7MvGukJlOFxA01InAGE+EWZJSivA9jQ1T9cy+YiUD7HwGrGvYOoghsHPMqELWJk+DBiBQpxVqsWhscUqdRXDgpZEVAOK7CupeJa8p2P3RpG6EpmiSW+jHv4K4Bq0vRTwlnGkEhY9jUdm4YJRyx8ybKeOJ67O7NQ8L8zUoDHsxh8Ca+PK7OoAWZjfw0iB8FBFEmbr0GhAnCZ2DUQVEOFyvnBCQQJwIjpCo7UqL5/2qB4nyliKmMcJxlOjkKvwEt2wPrp0GUsuM5rDwKe0BD2NDP5DhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 260f8894-a2b3-4265-7a70-08df103f1fbd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:59:01.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZTRqa6f+S61lhnLKjZ7k0yvGtlp4ZxvndCL4CAXczCQltfgbIaNNtcXF7esqZLWV2g0OQqnABU0efatxpI8qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
X-OriginatorOrg: intel.com

On 7/22/26 1:46 AM, Xu Yilun wrote:
> ...
> +/*
> + * SEAMCALL leaf:
> + *
> + * Bit 15:0	Leaf number
> + * Bit 23:16	Leaf ABI version number
> + * Bit 24	Pending interrupts detection mode
> + * Bit 63	1 for P-SEAMLDR leaf, 0 for TDX module leaf
> + */
> +#define SEAMCALL_LEAF_MASK		GENMASK_U64(15, 0)
> +#define SEAMCALL_SEAMLDR_MASK		BIT_U64(63)
> +
>  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>  						  struct tdx_module_args *args)
>  {
> +	/*
> +	 * fn contains base leaf number for TDX module calls and P-SEAMLDR
> +	 * calls. Other fields in SEAMCALL leaf like leaf ABI version number
> +	 * are in struct tdx_module_args.
> +	 */
> +	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
The changelog lists the SEAMLDR flag among the RAX fields that are not a good fit
for the function number definition, but 'fn' still carries it. Why does 'version'
get a field in struct tdx_module_args while the SEAMLDR flag stays in 'fn'?

Otherwise, looks fine.

Reviewed-by: Kishen Maloor <kishen.maloor@intel.com>
