Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99835F8CD
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768375691; cv=fail; b=A3dsxCYSF8CVgTcvrdat4XI0RmwVA1VxS3whHVrrPb3r03jnMs7eJCTcIRe0vHmSQrNRfJ+BmZsAQ2gTAW6Mzd9oaGvtshuY96h393QLqq8jr+oDfMEBQx4f+wgecSmesKWCPVPkF6TpGEiFyi47Igvk0y9fdhX/sGfN8UUdvkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768375691; c=relaxed/simple;
	bh=J/WJgbHCN7RxNjVVlBM0tbtaQ3n8DSFsTG9nVex+Vho=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HzF196wtmmKp/lPFKlaawi/ApliR63QlqceWScaxS5+eAOjSomoOCvu7VxfqEoFTcA0gDA8tBEk1S1a1Qbfg1okVImq6Ks1RKd0ypKiTpvQrSFNHxlrE12cMgFL4Mzq6ghQx0CorhOePYisiihBrTRVafUY2iNByRkO0U9vgKvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep6OOub+; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep6OOub+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768375688; x=1799911688;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J/WJgbHCN7RxNjVVlBM0tbtaQ3n8DSFsTG9nVex+Vho=;
  b=ep6OOub+XfIALJsUOisGqaId9XweyEpJFk5upGneSKP0nkh3CYp7vAnz
   6nMxO8EebGnQWKhaHkbvmYSh+HysSwbetIIxPFOzZKtqoIj6u3g9yn10X
   eSU3X4DDFNpPgugm3lLXBaD8uYg+sa/YC5g4ihSEZjmFlZvQaZ5+pryYG
   kUl/LWzC7Y8TfSf3zPEw6fvxMjgaIbMA5+Rdcp5YQn0KZZ00WTP8jEPLi
   4ApZxRd8NGse0CnllKJwRIjMyu5DVOqb14EKCEw6UT76+gccpnLYWn4p8
   lGgANAh2isaq029dB1gAy8uK10Yt6i5Cu9XfwHmF02MaXVTN0JgvrXhn5
   w==;
X-CSE-ConnectionGUID: /PffpxkORy2zbAYNtRbgow==
X-CSE-MsgGUID: 14p/MQqIT4WkRZ75o9iJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81034366"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="81034366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:28:05 -0800
X-CSE-ConnectionGUID: PKUAk48RSi6+hZxn6JT0jA==
X-CSE-MsgGUID: PJwLrP/hSa6vnh8PUg1NjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204619344"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:28:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:28:03 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:28:03 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:28:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl4UvzcM6+lM/AlegaApwhlq7gKp/LKfc3VSguDqZiddLRE85jaDbAViVxOfERxmgVCusLqGCxVHRfLZMmRN3KE35lobiczfa52B7bLKqrqNcXkA2+L5YZian77U9E97ym7PhrLi5dCN+4j9cI+roHZIcZa5qngEzX+r8XgMdkF5UIoIRWkerQM0aw5KiewiTH2/1/hI6VxEQT7htwE3RnqsSolyXI+yCVjmi7GYZ3v+iU6iUxVKRl2j52/BCurwanR+AxnOOkr68WdGnSbC3lpHkAbt6CIspSCxfVMui8TK/pE8d6+WDo5ELpFIq45PKnxaS7nwrVqJV/sCZqrXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kboM1xUFiLKMf59q3jOF6SuhcxlWzSW/RnUzO6DrgeA=;
 b=gMeJTunyDkwU4Eqnngn96UaYiG8uXq9AfOwzX2nfCvGpqF6DvRFHjZyK1odwCpxxvZZTJ7+E/epai5Rno8QI/pdQVGgb4VssNxdtrrlawWJqUMkocKPzNJfJFpR6BvY9pU7kwQX4EQJ8EWszjb7X/oPu3uHU3ho3alRDQhXmAsnDFuDyEuFfFm6DriZCTUC4Q1T6028Btey5EUWizYkRUcIiK+PdGd1o5mtXjjS5rxNYaBcDFjJumlm/nPotiiGz3V9GI55Dvq2QJ6FxN13WH0KHozR6T9fnb1GfNVWeOEXmAGMZrvb1B7K41ewvyZW/ZUBrk7l4cQLI+lnWPOs+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 07:27:56 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:27:56 +0000
Message-ID: <5d55b177-f70c-45f3-aa13-ad109c1bb87d@intel.com>
Date: Wed, 14 Jan 2026 15:27:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/21] x86/virt/tdx: Move low level SEAMCALL helpers
 out of <asm/tdx.h>
To: Chao Gao <chao.gao@intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <yilun.xu@linux.intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>
CC: "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-4-chao.gao@intel.com>
Content-Language: en-US
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
In-Reply-To: <20251001025442.427697-4-chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0046.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::17) To IA3PR11MB9136.namprd11.prod.outlook.com
 (2603:10b6:208:574::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9136:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ef81c2-0edc-4f78-0404-08de533e6f8c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNkcGRaRVAzOGtEek5RZytnaGdTMGhEMzJlclVtOGhKMTFkcGVLM3N4YXVF?=
 =?utf-8?B?Nko4TngxMWREaHVXTnV0MjEvbUlPemtiaUZmQ3I2K0V2Z2c0a3dzT1pnR3ND?=
 =?utf-8?B?SVNtV0dnRWhGZk43Z211TVZZMFNmWDdEVWh3cWt3ajJXb0dNMzE1UFU2QUp3?=
 =?utf-8?B?TTRlMVpLMWVGQmhsKy92Rnc5bWowLzR2dGRpRGx5WFRtejBheFZtUk90Sjkz?=
 =?utf-8?B?d3VIZUNtajJIN0swT0drMkN4cjVIdlE2cWExdGRwL3k3ZGt1eG96dVp6cWZL?=
 =?utf-8?B?WGdFdVA1Z2RReHYvQVBhUHFYVFNEWDFnbFZyUEpXRG5ibmxJS01FS1A5eDJF?=
 =?utf-8?B?YmxCclNCOGZlTTY2UW9vRXJwRFlpejc1T25UNWlwclFEWktoMDc0M3ZKMHdB?=
 =?utf-8?B?cDhsdGQyaHJseGxyT1UwMTUvTDMyaHVRcGcwVzBCeTg1aktsbWRoUGRjbkll?=
 =?utf-8?B?M1hndGlXMUFTMFU3SjZZRFpuUVphYkNqM2ZFR0RVelBYcFFWOXppTTJXS1hG?=
 =?utf-8?B?N1dzcDU4dUpNTmJ3RWpUQUo4RXVyM01sS3FIYU4wWTIvUjBjTmVTT1Z2clRu?=
 =?utf-8?B?Q2h1Uks3UC9IR3JqbGV4cEg5S0V6ek8rdG8vU3k2dVFISHg4MWpDblVsYzJR?=
 =?utf-8?B?ZWhpZXdxdFo3MG9tV0lYbWlycEVJWnlDZUZIUkllRjJLS0RLWmxNL294K2cz?=
 =?utf-8?B?NEJRUVc5WGZqOVBDTFN6aXlaRGFiOXczYUlVamJBSkR4dmNuTm1ZeHp0bTFY?=
 =?utf-8?B?WHNyTWpNVGIvYThCK0xYMEFHdk1uTkNhWXlVMm4xQWNKaStUTTZwbVhqY1FR?=
 =?utf-8?B?Wjl3amgyd0N2Y1ZUZVBPb3hGUDRrK2FEVlJmZ3k4akNjWG9oS2U1R0pLQ1lE?=
 =?utf-8?B?ZVdueHYvS2kwVWJ1Zk8xeHNiM1QySnBIaWp6M0Q4eTZhYVJUcDc3VTVRbmZh?=
 =?utf-8?B?NjNRNllySlJmMEZmZk9uVlZvU0JnWlZkNzF1M2kyeC9hWGRCS0hCaVhkaWdt?=
 =?utf-8?B?T2cwdCtOdHNEbjRiV3NiOVd6dGxPbE1vOFBsK2xpMzRJOHRtTXlWZnduTFZz?=
 =?utf-8?B?dE1ISzhCR2M3eGZkUVVOYWVVSm90ck9yUlBvMmwxYmRsQ1BHS3Q4VityTjZh?=
 =?utf-8?B?T0ZoUkNUSnd3V1dDakkxb3gyQ29Rc082YzN2Uk9KK0U1WnFMTXU0Q05GM0lr?=
 =?utf-8?B?aEJhUGhoSm1qYWJ4YmZnWkc4YjdrM0J6RThoamdoUlMva1NPOUZ1c2QzblFJ?=
 =?utf-8?B?V3I4Vjd5SUpKZndpYkZRQXN1eDEwNmxXR2syaS9QTk9ZcnZiNi9oalhjVGI0?=
 =?utf-8?B?STRMUHgvMm5EOHFaY3hMT1JIaWRac2xBYWdwa2Y3bDNDcU94aEJGRi9uOVor?=
 =?utf-8?B?aUI5bTRCdHVNdi8yMlVnMFVFazRUeE16a1NLSUVCZFJPWitIL1dTZXN5T25D?=
 =?utf-8?B?MUlGSXBWVzVyb28wQUxFWkozTDF3YWhuMklENStPanRMTHN6K1ZnbFJGSXRa?=
 =?utf-8?B?UlZjVG1kZnNwQW1oT1M2bzdXVlRDc1RDWjAzS1BRMHBUeVUyalVNcUIzNXFD?=
 =?utf-8?B?eGJsYjNzNC9jcGJCYnRXN1k1c0V5R3k0RzJTYS9BMmJqV0FvZnNRSDQrQ1J3?=
 =?utf-8?B?L1VDNTZnSXord0ZSakk3MmgwQXovUE1VSFRIMVo2WTU3TGN1dW11QUF2VHps?=
 =?utf-8?B?QzlTeWdpTHBVb1RLZENwdWNqZ3grZU5ZTngzSXRhc3JaakV3L3F6WmowVGc4?=
 =?utf-8?B?cG9LcWVPNE13bHRqY1dJZ3F2ejVPRmJSWnY0U2F3UEUrRUJYWE1BNFQxelVi?=
 =?utf-8?B?Wmx0UWxEVW4zcElqQWV2K0ZnbUhScnpDVDcrMWdEMFZ4VDZ1UUJLUTBFeDJj?=
 =?utf-8?B?V0tsS2l1NGN5QXRzbzhxWU1aVTRHdThqaUJQM2RORFpSL1JrQ0tIcUsraFN2?=
 =?utf-8?B?aUJNaXhnaUZNSTNxek5LRjF5amxoU1llMGN3M0dIaTBjcGJvVW8relRUWnd1?=
 =?utf-8?Q?GqdH9OL9SivB6Ypm6Pn0wGqwWpREwE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lkQmpLaExXWGwxaEtlWlJSbFFsZ3kxUmYzdDJKYnFGQkV6UVp3b2ROMk0w?=
 =?utf-8?B?TzJCWkpUR2hKSHRvaWpGSVo0MTV4WWhsU0lFdDQ1ZzJTTWplaVdtclZFaVRU?=
 =?utf-8?B?SGR5ZUVveDIwci9iTnZid3dtcEsrVTFZeGFyRVNXcVkwdmo5ZEZxVE5KdFV3?=
 =?utf-8?B?N0QzNUZPWXhQNVV5SjRtVlorQjhQSlBYM05Yem1kYVRxYktERlFTOTZFYWl6?=
 =?utf-8?B?QkJyN2x3eWlmNElxalI5dzRKc0tpeHQ1cVd4RElOdklPL2NvTDJkLzNUdlpP?=
 =?utf-8?B?a1VFQkRmRmo2OVNzNW1Tby9KZVU0UERMMTQvODNHZUExQlJtb2dRRkdST1JN?=
 =?utf-8?B?Qk5FM0ZYUENwMzRFeUJENDMrNmV4aDJ1OVJkRTV6L0d4NHRVUEZ3NzBRM2pC?=
 =?utf-8?B?UUdqQ2xVY3BxQmx5aURvTkptaHJoNWsveFB6N0FiamoyRHRrRnVGc2ZaajRU?=
 =?utf-8?B?ZnlLcGNoM0F4amJ1Z2Y3Yk94MmdRMGpYdmhBdGYyejRqamFWb0pmbEowb1Fa?=
 =?utf-8?B?Skh4RWRndHBNR29vYVhSd1ZZT3gxTkZCdTduY0pNWFlVcTdIVnVab05jYk5N?=
 =?utf-8?B?V3NCOE1Mdk9mNlp1ck5aekt0SmRFcGYybjZvaWhlYnFITldKV2RCcEE1dUxl?=
 =?utf-8?B?d20yNFpvQTJUQUErOTZUL0ZHZWNWNHp1em40U2ZtWlRvVXpwV1krOFFYQzB3?=
 =?utf-8?B?emVjemd0U3RvakJqdXhNSkIwSWVMUTRkV0o2Y0hhYnBHV054RCswU2tjZm83?=
 =?utf-8?B?R3ovRTdGZThiTWREMmNXN3pQTU9FenFWWFZpYVFUNHVTTEhTNEFOUFN0VWxT?=
 =?utf-8?B?eUhDL1lvaExxSUJqNUVFM3p1bHlGRmVsK3lreWpoRHR3K0MxK3hkQXBzQTVu?=
 =?utf-8?B?Y0g3SXZmblR5VlJ6eXRyQWlWb3JoL1pLY3BRbmRMcElCOEpoRGkyaVFjNVQv?=
 =?utf-8?B?eWFPdWplU09ob1ZPM2VXOXpsb1pDNXpDVk5OZXFXUUNXalU0UklGelhlVWhx?=
 =?utf-8?B?N1VNWldBMTFlOTRuTWdMR1EzeWFEcVB0UWEzQmRqL2FRVlVFMkxzMW5wdXJL?=
 =?utf-8?B?c1JNMTkrNVJ2c25QRHhycWR6dE5YNHZYSThNNTFsMWI2UFMzdVZxRmgwM0Jv?=
 =?utf-8?B?ODhQVC9weHEyTnBvNlgybFRxNDlNM0FNMUFsbVlmak1PamM5ZFZ5THpwWGxo?=
 =?utf-8?B?RWd2eElSTE02YW85c3lxNlZDT2w1NWxIUVFUeHVqZ0pJUVdacFJTclVwb0VQ?=
 =?utf-8?B?bWQyRHFoR3orRWszbW05ekpyKzZkd3RDMjFYZ05DSkxsTFJ5T1VPVVZoeVl1?=
 =?utf-8?B?cmtEd3liZnJLWFNiSUNBUlZEeEpvenY2Qkl1amRXMmkyQjBob0VYY24rZC9N?=
 =?utf-8?B?V1FaSHNnb1dxMjUyRmJiUDFFTVIzVTAwZnZYS09jNGVycU14dFkwV09IazVO?=
 =?utf-8?B?SHN4K1IzV09YUEVVWG9najA1SHNZOEVDbHdKQnJxR0ZQeHhEa2MrSFVjRWNO?=
 =?utf-8?B?cHJDcFlMWm5UeWtySlRvcVQxZk5OS1ljenQybE9VcGNuWDZsR2tvWTdsRWFs?=
 =?utf-8?B?OWo4dXJBT3dhQ3ljZmxTeWlZWDh3VmdQSzF3MkhxTENyRXdEdWwza3krSFpu?=
 =?utf-8?B?ZXliSGtabDRKOC9kbHlaV2I0Y0RnbWh4ci9CUVZzR2Y0dXA0OXdKZU1Zd2V4?=
 =?utf-8?B?K09VOERhOTlwT1lrUWFJMDJNVFFia0NvRUhNemorUVFkczdjajJocVdXVnl1?=
 =?utf-8?B?ZVRaNVBpUjFDaUhhci9JNkloR0VvZm54eFdvK3pHc2tkTG1Md2NGSWFwTkl1?=
 =?utf-8?B?UUQvZzFLa3pCMklBUmdkUDdIL1Y1ejdKbEEzRWNBYmxiSkpHWFVKUTlUOSsr?=
 =?utf-8?B?aW9KSUhJb3MrRGhyOVJQTDZRZExrK0RaaCt4b2Z5cThHN21RWk5ib0M2dlFl?=
 =?utf-8?B?RnN4M0Y4dkw1SUwzOTBFK29YM3BGY3YwbEY0cDJNVHVUejg1ZlVLMVEzN3Jk?=
 =?utf-8?B?R2RvL3ltZDVKYjY3RHpBMXNSZ1p6anhqMDdYREUzeXdaZjl5N1dEYUJWY2ww?=
 =?utf-8?B?MjM4UnBKQnZua3F4aUpXQTExVElZdmNXNkFrMzYxWlY2c0xXRk54b3ZJQkEx?=
 =?utf-8?B?dzhGSENKVm9YbkZ6TzJwRG4zU0ZZNUl0Rkg1Q295ZWltZHFRdnlENU9rcXlh?=
 =?utf-8?B?anJJbExHaWNZMDNDUEdKQ1MyOW5MT2Z1UVAvZ2hNaldnNDdnOWc1VVZkUGJ5?=
 =?utf-8?B?QnE4RjZWdEplK05FY2c3dm1GcXB6c2FHK1VNNXNTalE4TGt1NXU0YTRDVytH?=
 =?utf-8?B?VGxkUDVTR2ZwMndDUTQ1K3NFeFRvT1JvUnBtaG0rSnBFVnZIcDI3N29RM0pa?=
 =?utf-8?Q?jZvV/dx34aK87FAE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ef81c2-0edc-4f78-0404-08de533e6f8c
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:27:56.0989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqWoLj6VvN2wcymnsjnRFK8plxhTQ8rFh2YCwwPEZGK+eLU4t36pwt5PVT6117DYKwyNqtAYZsUqxtU88vi2ykiEPPaGtKbMe+zIuVoNYEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com


On 10/1/2025 10:52 AM, Chao Gao wrote:
> From: Kai Huang <kai.huang@intel.com>
>
> TDX host core code implements three seamcall*() helpers to make SEAMCALL
> to the TDX module.  Currently, they are implemented in <asm/tdx.h> and
> are exposed to other kernel code which includes <asm/tdx.h>.
>
> However, other than the TDX host core, seamcall*() are not expected to
> be used by other kernel code directly.  For instance, for all SEAMCALLs
> that are used by KVM, the TDX host core exports a wrapper function for
> each of them.
>
> Move seamcall*() and related code out of <asm/tdx.h> and make them only
> visible to TDX host core.
>
> Since TDX host core tdx.c is already very heavy, don't put low level
> seamcall*() code there but to a new dedicated "seamcall.h".  Also,
> currently tdx.c has seamcall_prerr*() helpers which additionally print
> error message when calling seamcall*() fails.  Move them to "seamcall.h"
> as well.  In such way all low level SEAMCALL helpers are in a dedicated
> place, which is much more readable.
>
> Signed-off-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>

Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

> ---
> v2:
>   - new
> ---
>   arch/x86/include/asm/tdx.h       | 24 ----------
>   arch/x86/virt/vmx/tdx/seamcall.h | 79 ++++++++++++++++++++++++++++++++
>   arch/x86/virt/vmx/tdx/tdx.c      | 46 +------------------
>   3 files changed, 80 insertions(+), 69 deletions(-)
>   create mode 100644 arch/x86/virt/vmx/tdx/seamcall.h
>
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index cbea169b5fa0..e872a411a359 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -97,31 +97,7 @@ static inline long tdx_kvm_hypercall(unsigned int nr, unsigned long p1,
>   #endif /* CONFIG_INTEL_TDX_GUEST && CONFIG_KVM_GUEST */
>   
>   #ifdef CONFIG_INTEL_TDX_HOST
> -u64 __seamcall(u64 fn, struct tdx_module_args *args);
> -u64 __seamcall_ret(u64 fn, struct tdx_module_args *args);
> -u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
>   void tdx_init(void);
> -
> -#include <asm/archrandom.h>
> -
> -typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
> -
> -static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
> -			   struct tdx_module_args *args)
> -{
> -	int retry = RDRAND_RETRY_LOOPS;
> -	u64 ret;
> -
> -	do {
> -		ret = func(fn, args);
> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
> -
> -	return ret;
> -}
> -
> -#define seamcall(_fn, _args)		sc_retry(__seamcall, (_fn), (_args))
> -#define seamcall_ret(_fn, _args)	sc_retry(__seamcall_ret, (_fn), (_args))
> -#define seamcall_saved_ret(_fn, _args)	sc_retry(__seamcall_saved_ret, (_fn), (_args))
>   int tdx_enable(void);
>   const char *tdx_dump_mce_info(struct mce *m);
>   const struct tdx_sys_info *tdx_get_sysinfo(void);
> diff --git a/arch/x86/virt/vmx/tdx/seamcall.h b/arch/x86/virt/vmx/tdx/seamcall.h
> new file mode 100644
> index 000000000000..71b6ffddfa40
> --- /dev/null
> +++ b/arch/x86/virt/vmx/tdx/seamcall.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2025 Intel Corporation */
> +#ifndef _X86_VIRT_SEAMCALL_H
> +#define _X86_VIRT_SEAMCALL_H
> +
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +#include <asm/archrandom.h>
> +#include <asm/tdx.h>
> +
> +u64 __seamcall(u64 fn, struct tdx_module_args *args);
> +u64 __seamcall_ret(u64 fn, struct tdx_module_args *args);
> +u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
> +
> +typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
> +
> +static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
> +			   struct tdx_module_args *args)
> +{
> +	int retry = RDRAND_RETRY_LOOPS;
> +	u64 ret;
> +
> +	do {
> +		ret = func(fn, args);
> +	} while (ret == TDX_RND_NO_ENTROPY && --retry);
> +
> +	return ret;
> +}
> +
> +#define seamcall(_fn, _args)		sc_retry(__seamcall, (_fn), (_args))
> +#define seamcall_ret(_fn, _args)	sc_retry(__seamcall_ret, (_fn), (_args))
> +#define seamcall_saved_ret(_fn, _args)	sc_retry(__seamcall_saved_ret, (_fn), (_args))
> +
> +typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
> +
> +static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
> +{
> +	pr_err("SEAMCALL (%llu) failed: %#016llx\n", fn, err);
> +}
> +
> +static inline void seamcall_err_ret(u64 fn, u64 err,
> +				    struct tdx_module_args *args)
> +{
> +	seamcall_err(fn, err, args);
> +	pr_err("RCX %#016llx RDX %#016llx R08 %#016llx\n",
> +			args->rcx, args->rdx, args->r8);
> +	pr_err("R09 %#016llx R10 %#016llx R11 %#016llx\n",
> +			args->r9, args->r10, args->r11);
> +}
> +
> +static __always_inline int sc_retry_prerr(sc_func_t func,
> +					  sc_err_func_t err_func,
> +					  u64 fn, struct tdx_module_args *args)
> +{
> +	u64 sret = sc_retry(func, fn, args);
> +
> +	if (sret == TDX_SUCCESS)
> +		return 0;
> +
> +	if (sret == TDX_SEAMCALL_VMFAILINVALID)
> +		return -ENODEV;
> +
> +	if (sret == TDX_SEAMCALL_GP)
> +		return -EOPNOTSUPP;
> +
> +	if (sret == TDX_SEAMCALL_UD)
> +		return -EACCES;
> +
> +	err_func(fn, sret, args);
> +	return -EIO;
> +}
> +
> +#define seamcall_prerr(__fn, __args)						\
> +	sc_retry_prerr(__seamcall, seamcall_err, (__fn), (__args))
> +
> +#define seamcall_prerr_ret(__fn, __args)					\
> +	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
> +
> +#endif
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index f429a5fdced2..b367bb1d94ed 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -38,6 +38,7 @@
>   #include <asm/cpu_device_id.h>
>   #include <asm/processor.h>
>   #include <asm/mce.h>
> +#include "seamcall.h"
>   #include "tdx.h"
>   
>   static u32 tdx_global_keyid __ro_after_init;
> @@ -58,51 +59,6 @@ static LIST_HEAD(tdx_memlist);
>   
>   static struct tdx_sys_info tdx_sysinfo;
>   
> -typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
> -
> -static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
> -{
> -	pr_err("SEAMCALL (%llu) failed: %#016llx\n", fn, err);
> -}
> -
> -static inline void seamcall_err_ret(u64 fn, u64 err,
> -				    struct tdx_module_args *args)
> -{
> -	seamcall_err(fn, err, args);
> -	pr_err("RCX %#016llx RDX %#016llx R08 %#016llx\n",
> -			args->rcx, args->rdx, args->r8);
> -	pr_err("R09 %#016llx R10 %#016llx R11 %#016llx\n",
> -			args->r9, args->r10, args->r11);
> -}
> -
> -static __always_inline int sc_retry_prerr(sc_func_t func,
> -					  sc_err_func_t err_func,
> -					  u64 fn, struct tdx_module_args *args)
> -{
> -	u64 sret = sc_retry(func, fn, args);
> -
> -	if (sret == TDX_SUCCESS)
> -		return 0;
> -
> -	if (sret == TDX_SEAMCALL_VMFAILINVALID)
> -		return -ENODEV;
> -
> -	if (sret == TDX_SEAMCALL_GP)
> -		return -EOPNOTSUPP;
> -
> -	if (sret == TDX_SEAMCALL_UD)
> -		return -EACCES;
> -
> -	err_func(fn, sret, args);
> -	return -EIO;
> -}
> -
> -#define seamcall_prerr(__fn, __args)						\
> -	sc_retry_prerr(__seamcall, seamcall_err, (__fn), (__args))
> -
> -#define seamcall_prerr_ret(__fn, __args)					\
> -	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
> -
>   /*
>    * Do the module global initialization once and return its result.
>    * It can be done on any cpu.  It's always called with interrupts
