Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7074352C3F
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376865; cv=fail; b=jubjbY0jAkkD/NDtA8/0DqqMiOSSAjW7lZH4kJ6/YAYCLy3VZfJQgaKk4UMJsfBJOHtskZpA/c6vaDgJRQg+fNIKXVloO8iqAT29Wtc+zPRTsybeW85mY99GcJ2e6RaHAOpaX2of/MCf+NanJsmFRRSChgA2s972yzdrqQb0lAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376865; c=relaxed/simple;
	bh=mTgq6ZcP77yREzt+y6MGmTyjeibRAHVBjgW2pHawL18=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DYNioB85p9MhBFq4aAIizcGJy7b8PJcsAeqOWnYs6yRYnw5/F6AAAfXxZSV3dgRZpkl83TXAhfaZv+HXy0wPPXwqagwhxvdXbaRl5zCCjZUed5hl4NYkrXxYKZGJzCi6g3X1ZGGPk6pJWHwus+Qtf7wUjzmzX453EHD3+kSCmKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tbk+mIdp; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tbk+mIdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768376860; x=1799912860;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mTgq6ZcP77yREzt+y6MGmTyjeibRAHVBjgW2pHawL18=;
  b=Tbk+mIdpRl1zF9SxBjZoeiZl+5blS3+cNI6QFM4Bn1nK8jAv2l7FPhV9
   5iytMHJ7YNxLmF+BW3XafBSRjEufxJHwACK5QRcXfBNwNrjskir38vooJ
   biSWR24iU0kg9APsWmTLqQk/VXlOyaCENgcBSXaLLas4chDkd/bvKu8tI
   zLlkyB3Y/RcSVGKspARKAprZu+Rrrm5DSoUdK2xPFHpNoeAJU66ZfqD/9
   D73ZhdlxzgIGQdmgPiSJCSOhpyu++mf2QhcM1Z49lJWDllclJ8uU9t6iQ
   I29Hrc2to04Thk8TwC8eUr6QmBkpZ70JhjM8OYyowkRl/FrrqpxlByOPO
   g==;
X-CSE-ConnectionGUID: o357lTCkSMmmzJnvX6MmFw==
X-CSE-MsgGUID: hlA4HWWJRyyxhNIDX28GFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69728292"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69728292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:47:38 -0800
X-CSE-ConnectionGUID: MFZFLDX4Q7i4F4sGeeBi+A==
X-CSE-MsgGUID: pz5PgVeWTMmqklNrYpMVwA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:47:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:47:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:47:37 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhGyfzImcFtKZpGw8eE2ClfftWtcB8va3F4giI7jwQ5Qyul+lGi7Bl7SbllLC148jWgqQHsCFzIuE6wyQ4ujnh9U3oMS5OLmuqIquDTYRuBNGNnP/TNnI3j77+GRMOwD5BCYvKKnwcQNPXh3Bh1il9ETiD3sOilNmsRR2FXThuKnGbDHKoQQUTQE99uo8SjZhtbqfs1SugVyq1VrX3ASWnp+cvPAAldjPHdk8IXB63exfolFleG2RZUH42yhWkaicPNljVWg4C5bITDAWFdvDBZ/BY6UXz2D5/N0EKwodaaHBJou5DEL/uXjEbY/TKa9lxpMGQ7VJ5twnZ+ZQdcRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYVx3E6ZFg6cWl7XNQYgfPz0t40qwhRKZYdYa/5SNuE=;
 b=SY0vFK7gBameUHpnUQ+mO7/kgAkn/sxwxLOl8z9IGaOsJ7JfajO88kM/3735MjdaBY+zEPvAPHiPosyzCKO8Zkfr7Zhmu71WAl7cN0w7WX8OGQ8BOeZXpuI1jBSfEnXlw8RQ0TjdSz27EkMqBPtVLK3j6gQKyC0K0uVvejUNG88drZwELBhPGYsL7oN+y4fG7MH2UjW2pLX6MOgfiKn4RSXwmam1Zuf0C4id/DDrniNEltlp2ZHhDI+cIIlYDTcvuNpCnT8wrQmIwhSZo/PQrlbS5tx/K94PEbUaEaJ5U5lF8xU4iDvkFINoeo5puakjxLorHaaqiZnVBz1IPi/b9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:47:29 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:47:29 +0000
Message-ID: <3354385d-b1a0-416d-a3cd-53d515840b1c@intel.com>
Date: Wed, 14 Jan 2026 15:47:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
To: Chao Gao <chao.gao@intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <yilun.xu@linux.intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>
CC: Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Kirill A.
 Shutemov" <kas@kernel.org>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-6-chao.gao@intel.com>
Content-Language: en-US
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
In-Reply-To: <20251001025442.427697-6-chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To IA3PR11MB9136.namprd11.prod.outlook.com
 (2603:10b6:208:574::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9136:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 66901e6a-fa2b-40ed-e9bc-08de53412aa2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0xFNWwwaEc5dUZaamJ5a3lENGNMdVJ6enh2d0ppd3U3YklGc0dMai91MWE0?=
 =?utf-8?B?ekRmSUx3UG02WGZBQ1ZXeXFaUXZtRm9lbnB0ZmVRdTNqY1ZIbWZEM1dBSW02?=
 =?utf-8?B?QzhwNyt1RWhhYWFPa1h4Y3NBZmhjc2xEemN0N2VOTnVUaUlTdi8yelVGeWMr?=
 =?utf-8?B?TXVXbEpGdDRtc1dydWxwc00xUU1GSWtOQ2RGU3ZDdldBd3BJUmJUaVlHTG5Q?=
 =?utf-8?B?dnVqYWpKWWF2VitvNGx4VmprSUhqUFRwRy91d3ppV1JPYllscFNMMVBVNU5u?=
 =?utf-8?B?UDJXdUNWcFByYmJZMnk2OGxBU2V6R0NrdVdVdW5PRy9HK2M0dmd5eDVPTnRj?=
 =?utf-8?B?OFpkWkdZMlRMcm5LZ0x4bTRXNHZOU0lHWUJ1eW9idDg0b3Y2bjgwb0YvZDVt?=
 =?utf-8?B?aS9COFkrT1lHT2FSSEhxTWN4SnBLTVNYZUhkVCsxTGZTL3BGM3J3czg3T0RC?=
 =?utf-8?B?NWZHVnBBTkJXMnFhNnA1cEVha2FIM2IxNDFHTWxldHppY2pRY2N5TVU4UDVE?=
 =?utf-8?B?bWF5bDFLM1VkRGs5SzhSTFBWaysxK3Z1MzR4M2JBNkEwM1kzcUlzdEZWaVo1?=
 =?utf-8?B?ckR0THY1UUVDcWRYMWhuYTJpbThlck1uRUxOTmdOc3lSVndsUGZEcGJ4Mm1C?=
 =?utf-8?B?RVJvWE55YmdjeW14MnVLaVNkS1h3N3BtcmhCRjlvcjAvdXlhaElQekRxcFVX?=
 =?utf-8?B?MHhBOUlyT1BYNjQ1NWs4NDVhNGRTMmY1YXhYZzMyc2dPZlVKaDhOc3JrdW5O?=
 =?utf-8?B?SnNDZ3kvM1NUTVpHdHNLSWs3ZkdRZWpKUjMwY0tUMVQrZHp5N3I1K1FwR1o5?=
 =?utf-8?B?MVFzdDhiMjR1RHVzSE5HVnR1cExiS1JZNXZLWXFWYkh2aHRlVGRjMTdLdlZ4?=
 =?utf-8?B?alZuS2dXQU93NmJGdjNwYmpUNzBqdnZjdHZma0lSMkw1OUVjV0E5SmRvRkcz?=
 =?utf-8?B?M2lGb2dyYzZqSFdYNVlaQmJ6Wks1OFNvNENYcW1xQllCL0dURjltN0JVcmZ2?=
 =?utf-8?B?c1h2SUNOTTdldENERUc2SitsaWZLYy85MVhTeUhlM0lXSmk3S2doMjFKZnV2?=
 =?utf-8?B?TjlmN2FvRC9NcEd4Nm5hL0tHbGJoK1NOcUY2bjJ5aTZwNVRSZ0RxSStwdDZ1?=
 =?utf-8?B?R21lREpOT2MrNDNMSEFWTUs3TU1OWDAxK1BIRHpicWRkalJLUUlQNlIvdm96?=
 =?utf-8?B?b2RrSHRpd2NXNEVBNDF2WEZKR0VNK0U0UFdReFdaVW5mQmNaTXNLYm0vcjUz?=
 =?utf-8?B?aHlGZVVSaC9ySUtCTHNodWdSbG5TSmFXWWI5UzdsZHhDZWNlbXhXY3hPMDJG?=
 =?utf-8?B?eXYzcHFFcTFpMmdxM2tPTmR4UGorVnF3V1hucXFOdzNnWXZaM1RsUW5hVm4w?=
 =?utf-8?B?YWZUUnFhRVo2eWcxM3ZpK0xRcEthbTlXK2ZYa05hcmtWTEk1VUV3U0txbk5C?=
 =?utf-8?B?R0txYmNFVy9BVlJaR3RDcmM3Ny8vaTZieG0rdXozWGtKM3JlS1AzcDdvNm9C?=
 =?utf-8?B?b24zajVDUXl0VGFlWmxXcWFaSXVaMnNMeTA5S3lqWWhkMjRZcUl1M3hoanFq?=
 =?utf-8?B?U0xqL3dSb3NSMStuOExhMzZlaklwazRZcFBzeVU5dC9Oa0U5TW5OY3lOMW9w?=
 =?utf-8?B?WHhjNHJMc3doOWZFWEpNRWJBZVB5VDdUV0ZnUytNRERxZ25VNVA4bWNOZC9G?=
 =?utf-8?B?SUdsR1J1Yzh1bUt5SlFscm1qUUNpMWlla0NJTDlLR1hnTE9iTjl3WmN3aFJ0?=
 =?utf-8?B?MXdlOHZyRkFULy9RQkRUaWtONlpkTktpQkoyaEdOMG1nS3F4aHFKZ0Zoaktt?=
 =?utf-8?B?enBXRzdncFU3cnpXdXN2NlQ5ZFlmV2tjaDF1VkRReTRHSkpabDl3dlVRbkRQ?=
 =?utf-8?B?ZDBsdk1RaWY0MHpDcGZDQlNSWEFMWnlXaFFwUlVTdndCQmFLM0NQWXFoemlk?=
 =?utf-8?B?U25Gd0lFOEtsS24zekRlNlRDNTBWZTlzTnI3azZhTHMyTG4xVXExcWhaTW43?=
 =?utf-8?B?SFhUbEhuSmQ0RUhSMmdMUm96ZGZmNFkyNDU5UGVBMEtiaHV1K2NRY2l6WUts?=
 =?utf-8?Q?miuodR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEhjRTMyR3BIS0lhbUhZY2lDczhGVS9WYkRwYmRoaE43eUlYVkJxYUFkempi?=
 =?utf-8?B?Szl6Ny8xRWtpZzVUY3p4alZpdkZ6cVh4b1MvTnl5R2IxTkEvTjZ5bmVMbEVR?=
 =?utf-8?B?d2V5eXowSkNVQTQyWU9HbnR6VGdCSnhLb3N3R2tiUHFWUUxaSW9ydklTTzZ6?=
 =?utf-8?B?ejJhUDBRdFlrU0t0eWU2dmhJZDY1dkNzY0QxaHVFbmdLcVNBMVVHdldJKzVD?=
 =?utf-8?B?MSswejl1N05Wb2hUMm9iaVFoTjhVSTBreDNZVFFNeGxxclVjMG50UWFYOUlD?=
 =?utf-8?B?SHI0MG5rb3ZUbnVNdVpWU0sxdS83dlJSVU84c1VDY0c4T1RwY0I3eDk5NmUy?=
 =?utf-8?B?ZVJjT1lXd21DM0Q2M1NXV2YxNGN2UmNId09naFArRUlxdVkrS2lVZDl6cmZQ?=
 =?utf-8?B?TGIwRFA5cW9RaGI3VGZleCsvWFJuSnVZWEJCUzMyazJpVmJNcExWWDF6cVRu?=
 =?utf-8?B?Wi9UekdhZW50VGdlRlNneHNWK1ZZdVR1QXVJMU5qT0RuOWJ1UGpCQlQ1SlQw?=
 =?utf-8?B?c1RLdGFZemZKakhjclRZYWREdHdBSndwNThWUC81OWhkeWdSVDUzTHhUc1hD?=
 =?utf-8?B?eUZYdXh3dE5mSDhTWU9qczBIZ25tM1Vqa0p4WGM0QTR1S3dKN1dNZ3FRZUE0?=
 =?utf-8?B?d240Y0Y4blFqcy9VTG05TVdhdWF3eWV1bERxbzMrQWM2aW5tOW1tUXFTSHZ1?=
 =?utf-8?B?RmNwL2JONVdhcVVXQzI5SExFRG5kRnRWQ2g5V01aZDltMk9hQjc5dHhwZVpQ?=
 =?utf-8?B?c2lIME5CbDREbGJnS0V0N2ZZM0VjOGN1TkxkdWJtRE1nak0ya3dZdTdWai8z?=
 =?utf-8?B?ZmUzL1pLVlhrVVZDQmVNa0YySWFacWZJNjdjSm1VV3FVdldzSTR6VmhCN0Z4?=
 =?utf-8?B?ckdvMy9KNUs5WDdETUd4cXVJL2w0cUZYbjVubjFzUWh5bnJkSDdwUVl2bmM3?=
 =?utf-8?B?VXNlSmVjRHpPYk1Ga0hhOHBxVGJLck0xT0NIQ3k0bFdoRk9JVVRUMVZvNnoz?=
 =?utf-8?B?Y0hGdjZqZFE2NC9OK2tzbUpGbXhGZFhGdGhXeHZUUVpSdklqdnYxdkV5OXlF?=
 =?utf-8?B?cVYyMEk3am9IVkpsSnk0OUVSVS9XbjZ1S0hRUG93cHJIRjF5TDhlWG9iMjVG?=
 =?utf-8?B?dFR3UzZGTjIvNzZLaGhaaVRJdmFPbk1PUiswejVhSjFtUFZVY1RZbjY1OVBa?=
 =?utf-8?B?MzBkRmJyRHp0RWgyeXhwYUFjMTFETTQ0UkFwSEp6dVpLaWwrZndRVEVkaURz?=
 =?utf-8?B?VUVXMnZxV2RLRWZXQVV3OTlONERsUlJDOGlsNHdsSTVnd3JNNG1uZG0zTDk4?=
 =?utf-8?B?aHNQbDhmeVZGKzIyWFd6cDNpZDlxaGFrUE4va2NGak5Xc3k3N2JBK2FIYmlv?=
 =?utf-8?B?TGJsWXNCUmQ2UWhka0dXaSs4QlpOQWlEcHBNU2NzNllKUUFKcklZSGM0MXRx?=
 =?utf-8?B?clU1WHhVL25PODAvZW9uSzNxTTQ4dDkwVzJCdjc1S093aURSREpINy9WYmpr?=
 =?utf-8?B?VnlZWGFCcS9wMS8yTGg5MjQzUmE4L2U3Wi9XQjA3SGorYnBRMjBpOXU4NVE3?=
 =?utf-8?B?YWI3M2R1ekxjNjY0bmdiZTBZcDB2QTE5cFF5NVR6TDVWREJYVkhUd0R4RDVk?=
 =?utf-8?B?ZEJOVnMvVkgyVWlieUwxWm5RallqWEFKa3FCVm1aMmErenVCMmNuYXE0a1VG?=
 =?utf-8?B?MjZKZTlKYTA5UldOczBHeXh5dlNnbUNNL0xTYXE5RmNvcmdMcXgyaDR6ZW5w?=
 =?utf-8?B?TCtZaUlLdWtER0k3Uis2ejdCQXYzNDMyd00xNHBrcSt0MUVrWWZCQTZRWnRr?=
 =?utf-8?B?dmxYSE9CTEpKZm9QbVFPbXJiZFo1bjhsRmp4czVxMkM1enRKaDRKbWJRVC9T?=
 =?utf-8?B?KzVvVVBIMnBvWVRkcncyWFNRUjNFM0pZVFptMmtyWlJRSFNMQ1BXN0RFQVZZ?=
 =?utf-8?B?L2VEVG1MZ1pGY3RqcjBSUVNVKzlSTmJNVGlNT3U4dURuZVJxNUM2Ty9TMEZ0?=
 =?utf-8?B?VG1rcUlzbXdUbW91VnZWLzFYKzRWd3FIUG5UTUhNNElGMElEZDY3eld5YWd0?=
 =?utf-8?B?dWVvY3BnUGdtRUhzTmNNMEk5a1hXRHdMakN3Y3MvakNqdnVhVnIwZXJaYm1C?=
 =?utf-8?B?NDNFSHhZUnZBNlZMa3pLMjBjTjU2YUsraFFKQXd5ekZscWhYM1hGOW5TM1JO?=
 =?utf-8?B?S1Y4dWlKVnl3YnVEWTJqWTBsaG5NdUlyYmZPTVppSkthTHNNTUFJZ3A4cmhU?=
 =?utf-8?B?YzB3bFRNcjlodTBrMzMzVWZDSTVYNSs2OEhjMlFEVFlQMU9EM3hSendISkQy?=
 =?utf-8?B?VlV0c1NWdjIvbWx0L3R1VHBRUTg4dzg4TjUrTVNxT3dteXVrUVgwMGV2UUFH?=
 =?utf-8?Q?pSLOnapuzmFQEbuY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66901e6a-fa2b-40ed-e9bc-08de53412aa2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:47:29.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI/JcnPE2tT9FL3UUYIUsmGdMDC0JH29gtDWHmWgblfTlcDgz8RwZd/VQmZrhPPBHcwRv+bSlzLDD1CgZNZHQbLgkkU3r3hKU9NT5nwstSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
X-OriginatorOrg: intel.com


On 10/1/2025 10:52 AM, Chao Gao wrote:
> Software needs to talk with P-SEAMLDR via P-SEAMLDR SEAMCALLs. So, add a
> wrapper for P-SEAMLDR SEAMCALLs.
>
> Save and restore the current VMCS using VMPTRST and VMPTRLD instructions
> to avoid breaking KVM. Doing so is because P-SEAMLDR SEAMCALLs would
> invalidate the current VMCS as documented in Intel® Trust Domain CPU
> Architectural Extensions (May 2021 edition) Chapter 2.3 [1]:
>
>    SEAMRET from the P-SEAMLDR clears the current VMCS structure pointed
>    to by the current-VMCS pointer. A VMM that invokes the P-SEAMLDR using
>    SEAMCALL must reload the current-VMCS, if required, using the VMPTRLD
>    instruction.
>
> Disable interrupts to prevent KVM code from interfering with P-SEAMLDR
> SEAMCALLs. For example, if a vCPU is scheduled before the current VMCS is
> restored, it may encounter an invalid current VMCS, causing its VMX
> instruction to fail. Additionally, if KVM sends IPIs to invalidate a
> current VMCS and the invalidation occurs right after the current VMCS is
> saved, that VMCS will be reloaded after P-SEAMLDR SEAMCALLs, leading to
> unexpected behavior.
>
> NMIs are not a problem, as the only scenario where instructions relying on
> the current-VMCS are used is during guest PMI handling in KVM. This occurs
> immediately after VM exits with IRQ and NMI disabled, ensuring no
> interference with P-SEAMLDR SEAMCALLs.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> Link: https://cdrdv2.intel.com/v1/dl/getContent/733582 # [1]
> ---
> v2:
>   - don't create a new, inferior framework to save/restore VMCS
>   - use human-friendly language, just "current VMCS" rather than
>     SDM term "current-VMCS pointer"
>   - don't mix guard() with goto
> ---
>   arch/x86/Kconfig                | 10 ++++++
>   arch/x86/virt/vmx/tdx/Makefile  |  1 +
>   arch/x86/virt/vmx/tdx/seamldr.c | 56 +++++++++++++++++++++++++++++++++
>   3 files changed, 67 insertions(+)
>   create mode 100644 arch/x86/virt/vmx/tdx/seamldr.c
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 58d890fe2100..6b47383d2958 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1905,6 +1905,16 @@ config INTEL_TDX_HOST
>   
>   	  If unsure, say N.
>   
> +config INTEL_TDX_MODULE_UPDATE
> +	bool "Intel TDX module runtime update"
> +	depends on TDX_HOST_SERVICES
> +	help
> +	  This enables the kernel to support TDX module runtime update. This
> +	  allows the admin to update the TDX module to the same or any newer
> +	  version without the need to terminate running TDX guests.
> +
> +	  If unsure, say N.
> +
>   config EFI
>   	bool "EFI runtime service support"
>   	depends on ACPI
> diff --git a/arch/x86/virt/vmx/tdx/Makefile b/arch/x86/virt/vmx/tdx/Makefile
> index 90da47eb85ee..26aea3531c36 100644
> --- a/arch/x86/virt/vmx/tdx/Makefile
> +++ b/arch/x86/virt/vmx/tdx/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += seamcall.o tdx.o
> +obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o

Not clear if seamldr will support other features besides TDX module update,

if yes, maybe more general name CONFIG_INTEL_SEAMLDR?

> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> new file mode 100644
> index 000000000000..b99d73f7bb08
> --- /dev/null
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(c) 2025 Intel Corporation.
> + *
> + * Intel TDX module runtime update
> + */
> +#define pr_fmt(fmt)	"seamldr: " fmt
> +
> +#include <linux/irqflags.h>
> +#include <linux/types.h>
> +
> +#include "seamcall.h"
> +
> +static __maybe_unused int seamldr_call(u64 fn, struct tdx_module_args *args)
> +{
> +	unsigned long flags;
> +	u64 vmcs;
> +	int ret;
> +
> +	if (!is_seamldr_call(fn))
> +		return -EINVAL;
> +
> +	/*
> +	 * SEAMRET from P-SEAMLDR invalidates the current VMCS.  Save/restore
> +	 * the VMCS across P-SEAMLDR SEAMCALLs to avoid clobbering KVM state.
> +	 * Disable interrupts as KVM is allowed to do VMREAD/VMWRITE in IRQ
> +	 * context (but not NMI context).
> +	 */
> +	local_irq_save(flags);
> +
> +	asm goto("1: vmptrst %0\n\t"
> +		 _ASM_EXTABLE(1b, %l[error])
> +		 : "=m" (vmcs) : : "cc" : error);
> +
> +	ret = seamldr_prerr(fn, args);
> +
> +	/*
> +	 * Restore the current VMCS pointer.  VMPTSTR "returns" all ones if the
> +	 * current VMCS is invalid.
> +	 */
> +	if (vmcs != -1ULL) {
> +		asm goto("1: vmptrld %0\n\t"
> +			 "jna %l[error]\n\t"
> +			 _ASM_EXTABLE(1b, %l[error])
> +			 : : "m" (vmcs) : "cc" : error);
> +	}
> +
> +	local_irq_restore(flags);
> +	return ret;
> +
> +error:
> +	local_irq_restore(flags);
> +
> +	WARN_ONCE(1, "Failed to save/restore the current VMCS");
> +	return -EIO;
> +}
