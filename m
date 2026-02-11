Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3719436C0D9
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770843984; cv=fail; b=NKi+d0agB7mdfmJLeHWGZ5scizpBByUXOk4010PzMqyXMeTdU38FETgZnuX+9ZkP/yZ+mMO/TPMii+HM9dLjIcr4QbuHGr3v6rpoZ1qOmkCm/Xv87hR9V+fsonLG0cEb1nfTxkxTPeG7FRPuHEoBIE1rCVml6rPpg7oBYos+p/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770843984; c=relaxed/simple;
	bh=GX9sIlP1+VDBTjy2hE0NUn/lqgRzYlj0zkKTW9UfCP8=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=izXZomLYJIskbw8w2KeISDKfkmkvIzmAdUt5TEkzzQu1rT/MYGmj08dfu4n9DE6Fv+J98fULvt6X1yWYFEaC+Skz9WdbG3W1pHdn9Lb/HZ3tCe++MRQno/tPV9szS/jcEuAllBkJK9df7i/9uy+4A6SPyzP+JktlaqkF568jqzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej/rMy00; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej/rMy00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770843983; x=1802379983;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=GX9sIlP1+VDBTjy2hE0NUn/lqgRzYlj0zkKTW9UfCP8=;
  b=ej/rMy00yX8rIz7ExIdgu83MdwerCW9nNB9kf3oMLxz+qP/7vdqzks6V
   ZGVa01Z36uwEnPsUMgcPlKC1w6UKHHN2kS6frbGZinbsPlYscD7MzrShQ
   i49KPkSKA0BMta/dO8zigYyZUCIDHEdclyoXEq2JyhfMoHMvmW1kipGCP
   FdnbKpWtUAd4J83BH3QK9cieSfnDuvmUHng3EU3bNcSV/G/fJdgHIlUOn
   8IqqosUED6Y+UPQ8FHXALLbvBS4kI69WxhrEihgwHI4EJ7I2XWiwc/+r3
   gkbGI8eqGFouWrmQm9B6JxThoEkMdoav7eWb01u+vrLpxcJ8hi3pVrCI2
   w==;
X-CSE-ConnectionGUID: /izYwhfWSRKLQEEOQ3S/kA==
X-CSE-MsgGUID: wp3YkOpuTGuorwiE+lLvuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72072779"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72072779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:06:22 -0800
X-CSE-ConnectionGUID: sKmVVoJ0Qi2UQbIux76sRw==
X-CSE-MsgGUID: d8W+goU9S129kvlT4hulwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216861534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 13:06:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 13:06:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 13:06:22 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 13:06:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+zGaazDVFjcet1nrmc15wfSubUsRchcIH2wX0NuDVF1gaBxq3Z0SdTk93woyVPEp/RBWaZ7x00ld17BfrtJ6H1G8NQn17mu6dKBDHj4XBUmVPXj9dK8K9Gv5M/BEsS/Ul3TU5Dse0JHxGp/w9bagetcqzQfjn78ePqx21PCFfg/ftGStJhUq6NLR9mOnpCYexmjlTGD8V4Y7i8RQFmNM7endo6Z/0xh73odmtudBDERIzhGbveh5WfDqCEYdMXNKdUU6F0S3zGkA6GF9c6Ob5KtNnacscGLSC/nLGZ9yPZkDqqI48TyUBnlmSxy2ANUV1g1HwMbzFut80GHq4oHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVotbX08pc8IBepDpbUvpnSOs1MQ2E/w+2oCjjqcBcM=;
 b=J67U10Gde0QnlcXAa5d/yVnLrB344xgeBv+CNdV337j8ihgWz4l2v/KNDawggHwGpL/t2rIB2cyj6TzkYyjl4vjc5emBRasNbxj2Nlekq+hPeYpokFrOsWlWWyKhRULBnyNNWBX0BeH5Vw/2Ff9LQNJaDRjiezkkTPOQmtVkhJbOvWg27N2MsdmR+ofOCQTn+UNRVhOVj6ICYaB4155FFarRhKcT7JSy+aLLDkA3K2lnjsnCYrNBFPRjPAFL62amKZ71bfz4UW91QH8uAV4vh5L0CEMJghpyqTaeFZDjAq/1ljo1XL+keEfYZlIHlVe+Fgf73uWPyqHy+aEkJfV1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 21:06:18 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 21:06:18 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 11 Feb 2026 13:06:17 -0800
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Kiryl Shutsemau <kas@kernel.org>
CC: Dan Williams <dan.j.williams@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-coco@lists.linux.dev>
Message-ID: <698cef4964e8_8c32100a3@dwillia2-mobl4.notmuch>
In-Reply-To: <6983882c-2c00-42f4-924b-5fb3619840be@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
 <aYxjhdES2MOI7rj9@thinkstation>
 <6983882c-2c00-42f4-924b-5fb3619840be@linux.intel.com>
Subject: Re: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to
 128KB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:74::25) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 21b01162-2f26-43b5-4238-08de69b16665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MS81V3hnaFJPRy9SQ3FvcGpXVnRVNEZVMU5Tc3hoR1RRRFNHeGUwUDB0QkxE?=
 =?utf-8?B?Z0tUZ094RW9vWHBhbHJTcWhaR1I0T1U0SnYrZm5qMy95emdYcEtiRFFmUFpO?=
 =?utf-8?B?QjlYWnFtYkJ0T3FXcmYwRVl6TTlPeFZZb3lGMnBHMVhjeDhoZVQ4aDMrbGRS?=
 =?utf-8?B?Q2NkOWlMSlIzamNFNVlROElOQThHU295UG5XSHk0djBsVnJJWXR0L1dXQUZl?=
 =?utf-8?B?clcrZUpXU2Z5dFpETDdyVGZVbUF5Mjd4a1ZjRFZ6S1I4ZHpTVHlPSWhySUhp?=
 =?utf-8?B?dWh4QkpLUy9jbmlSTVlmUFp6ZXVjV3BYZ254NU1sOGFUaUhLaGFpUEpkSnpD?=
 =?utf-8?B?TFdpS0h4encwMFRlUHNnUDFmdXBSd1lONW9CdDBKU083NFdDdkxzV2l0alpE?=
 =?utf-8?B?aVlsdXRUWDJvQUx1WUZ6Y1EyMVc0c2RTeWtMbUk1UWQrRFBYVEF2OHBteDA1?=
 =?utf-8?B?aXJvZ2xFVVVTRDRoaCtCcHJHQ1NNa1Bwc1RTa3pGbVZ2MXV4My82djQ4bmFE?=
 =?utf-8?B?aVpTSzdOeWhEWmNEdEFUOTBSSWZvcHMwTElyT1FLKzlRbUQ5MFQreFBKbXV0?=
 =?utf-8?B?K3l0WG45czAyR0t0SHdNWGpXaFZrVmp2eDJkdFFzUGs0VENCYi9zWWMrSTYr?=
 =?utf-8?B?a2lJbU1US3B0NXVQNU1LV2dxS0Y2VnRHZm5RREJ2Z01qY2JoejJnMks0YWx0?=
 =?utf-8?B?V3d0eGZ6YTNFdWlKbVI2VlpNZnp0K1U3a1NxVjVZcFhTTWk3WUpCY2VpUU1S?=
 =?utf-8?B?QjNoTnZldFR4Tmx6S2k1aWtpODk3WEFYU1BockdWNXNNMUYxZ3ZSelZKYzRa?=
 =?utf-8?B?VDJ1TnRPSFRNV3gzWXI4bU9aejhzK3FFcnJZV0lPUk91cFZYRytWRkdDT1ll?=
 =?utf-8?B?SjZjQ0o1b1hYYkhNbkQ2ZGsyUzFaTUYxYktJczlkamNmNXZ2c3Yvc3JjWlNV?=
 =?utf-8?B?SkFhM1p2NWF6bllEQWZXL1dndXZVQzZEMFBBNUFrbXQyTHBEbnJpOXRENlhS?=
 =?utf-8?B?RHdzMTRHYUR2M1RpQzg3WVExSm9sdTB3RzRKT01aajZENFQ0UWJNZXZ4YmZD?=
 =?utf-8?B?MlJFd3VIYVgvUk4ySlFaUmdhSVpURE92NDd2Rm9NamdHZDIzaks1bjYvNzdV?=
 =?utf-8?B?dDErMncyd05FRUN0VFNqTW1OOHg4bWZLczA5OVdhMG9sZlVJQjV4K0l1d25Q?=
 =?utf-8?B?K20wVlN4TFhjVnNEQ0I5b0V3eWNqYkdydEtmTWRzU201SFM0ZUhyVjNMTGxT?=
 =?utf-8?B?NGpIMlp1eWNJUGRlZXR1OFZ2aDJVMk9DendiWFYyNmQ5V0MyN0g0RE5JZFZw?=
 =?utf-8?B?ODY1dEpUWW9TZitpNzRGUkZuYks4aVh1YTNNei9YYWhFS1ZsZ1dsQWI3Nk0v?=
 =?utf-8?B?NldMN3plbHFFdTFHY3ZDdXhBQVpyV1ptMUNuYVpudjQyWHFnVGlhY1k5SGpH?=
 =?utf-8?B?ZXNScTZhNTZSWGZvYmdCbngyMUoxbi9XdkRQWmJMMkpqUGlha0orSHduRUd3?=
 =?utf-8?B?VTM3WE9NMUFCRFZOeGpRZnBZS3pPU0lXa0JnUUlmNU9oQmx4YkhabFdVUXBQ?=
 =?utf-8?B?MnlKUldoNXYxUzhieGVVSFBDVFhJM2VDdyt6Y0hKSlF4SlVyOFdkc21BVGFS?=
 =?utf-8?B?REtZQjd2YmlBZkdzNklKR052QURBK3FLYVJ3Zm96TDhtQzNqdjd2bEdHMUR1?=
 =?utf-8?B?ejZNUmZZU0hQL2V0bERKWWV3Y0xmUlNlRTQycHZOUDI5a2tQUzN4aENGUThI?=
 =?utf-8?B?L0lvVVdmaEF3b3JSWDN1ajJMR3gyeG14QmFPR2VaazRTNDZ0T0xpelNZaGVK?=
 =?utf-8?B?YVM2ckJQMW1QN3A1VXpMVUp6YmJzUU15T1dqdUZGNEZxU1orNzRiY3R0VU9G?=
 =?utf-8?B?OVRKbzdLQzhYVkwvd056REI1a3U1OWJRbWpqdHA2R1RPUUozMCtsbnZMQmxI?=
 =?utf-8?B?OFhSZWxIWkZrcTNwSEVjUEIwUWRkbEFkenlZSTdxR3BwSmgvbjVzZnhEUTZF?=
 =?utf-8?B?czlsQ0FHY3R3c2ZsKzFPb0ZGSmcvNXdScEo4eGQ5cks3UWUwY1RkaDdkcWJs?=
 =?utf-8?Q?ba3mnQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJTYThrNjZlcGo2cXJhS0ZaMFhHOHJiRStieENsV0ZIaHNMbkgzOVI5SG9u?=
 =?utf-8?B?eXl0L1pXa0dpaGRxQWljdjlib3lnZ3kzVkU2WHpFZDB0a1Q2K0pHQUl6c2RO?=
 =?utf-8?B?aFJwMU1uaFdRT05hZG53RXVWb0lXOVRVNTQxYUsvU3RLUUVoVERvcEFvSUJN?=
 =?utf-8?B?ZkhRVnZkb25Kc0hUc0RqSS84RHNHNXJhSmVpeS9MU3pUS3k3SGx3UDVuMFNv?=
 =?utf-8?B?NDlMaDVlT0VqUEhWWkpEMlVTb3FMUEI5Ykpqc0VNR1AvU3g4R2JWdGZ6TzlF?=
 =?utf-8?B?L1NUSVMxSXVTbk85TlRqV0dBSGk2TkdGUmt0SnROaGQvNHVPQTYyNENuZS92?=
 =?utf-8?B?NjZKVUwzNk9OdUo4bCs2bVYzeEtHK0Jhc2RIMnA5TTBaNTlpY3BLTEZDNExk?=
 =?utf-8?B?cU5PbDIrYURRV1c2eXFoelZYZ2l3OXBhSEJOTkl6Si9VOGFaUWN3VXhVQnNE?=
 =?utf-8?B?WFlkbTBZalp2Y3QzZUtmTVRnTStiRnQyblhuSUZsUk9pMXVXMDFjUjRRQllG?=
 =?utf-8?B?MWk3MWxTY01lS1hqMjVLWVJOQmI1b2NhS0crSy9mUHhjaThJb01KUXQycFdP?=
 =?utf-8?B?T2tZV3AyVE5OSmZxMnhrN3ZCYVBDWElMR3BKaTZZWndvMVZlTStpVldWN3ZD?=
 =?utf-8?B?Vk5zRnlqT0RuakdjOHZ4U2FwZ3ZxYTQvS1F2cVBPRHE1VWRTbjExcFc5ZzR1?=
 =?utf-8?B?YUFCMzRVS0xXejRLdlhjNjZoeFlVeUNkQmYvMW9vTHdoZDkrODEzTytaRys4?=
 =?utf-8?B?Y3FsUktwNVpEdnlJaG95eWR2ZDlIcm4vU3NQNUtJRkdqcWpyNE1QSXE5d3g5?=
 =?utf-8?B?ckEzTFJOUXBsdXVwN0ZMK2FqOXpIRjZJalFHdWxNR0E0Mk5ucXpmUlh4enNa?=
 =?utf-8?B?b2diNmJWVlp2QVlRc3F1Mnl1SkFTaVFLWnJWZCtlNGY3WDIrdmY0NFI2U2Nz?=
 =?utf-8?B?c3NPNDNrcUR3T3pHZ0ZadHdvaXVRNWE3NVFNRTVkYXVPK1RKSjB1dkZPQzRT?=
 =?utf-8?B?M1lnY2VSSXo5L2diZUxVbXBiUU1DUEhNbGlac1I5dXM3TExLcG1tY1IwcUdi?=
 =?utf-8?B?Mm1TMHBmV1RTS0Z4bHh0Zkd1RE1oQ3hVaUx4dmNwWlErZUlkR0ZmZDFXZ3FU?=
 =?utf-8?B?UUhHOWtoc2VESUtiaENrb0s1YitBOVk4NlRFdm1UT0JOOGFTdWNKeHo4a1oz?=
 =?utf-8?B?dm1sdjZWRU1KT3hiSnc2WFlJZlQydWl3T0VCUGhFcXpoUmo1R0NtZWYwajJQ?=
 =?utf-8?B?TUtMdENFZnlBTFhnb00zNzdpejh3WGtDWnRDcWZ1OTF6ME9nTFFudXhGUDI5?=
 =?utf-8?B?emgwRFNLR2lsMUxRMXBBVGRHcWcwMm9IOENJYTZCOFhBclVNd2FyYnFpbjZV?=
 =?utf-8?B?R1VTU0lGR0xmWlVtS1NmSU1KT1c2WTNlekxTT2NxL2FCUXg5Y05SVmFWVlZj?=
 =?utf-8?B?V0dWak5Bc1ZFanduYXhJSTdtOG1Qb09ZQktrWlpreGdyd2I0S3d3bDR5dytu?=
 =?utf-8?B?aXd4b0h4MUFkODNWN2RzdjB3Um1iZXBDaFZDdVJDWjYybHZ1ZEIxck5ZcDcv?=
 =?utf-8?B?aEZkMnhNVUEvM256emZ2T25WUUlXVW02aGJvSW0rMW4xblZhQ29hbG9idXps?=
 =?utf-8?B?YUVGdHBNSmRhUzVtTlJIdUJCRW1DZFZ5N2pTam5OTmcxR0l6REN3ZngxNFNa?=
 =?utf-8?B?N1hvZ3JsMG11Qi8yVHYrK3JVT1AvT3R3bXk1blFldmtmQzF6ckZuaTBLM2hO?=
 =?utf-8?B?ZUxpZ2FkZUk1RlphcmN5dURXNVUrVFpyWlgwSGhKbytRb1pRVTBQVXl5ZFdT?=
 =?utf-8?B?VlIwY2xZaVVyQU4zNzZwdXNNM1Y1UkptU0hlMUo0YmVCZlZUODgrWG5vQlFt?=
 =?utf-8?B?MDdabzc2OFkva2xxK1cvaUh0VytHZ0VkTy8zeTh1azJsS3NQK244eW4wNGs1?=
 =?utf-8?B?L2grWTBHaHd2SmJJaWI2a3lBem9FZHdtNlMyV2k4NEdJaWJESVZnMEZaMXcw?=
 =?utf-8?B?K2RMS043R0JiQVh2WlB6NGlwNWpmakFxRENjSDQwaWdsR1hJbGZDVHA3RFlK?=
 =?utf-8?B?Y1BjSnpwTERFc3oxYWUyN1JoM1g0WEJTdkNrQlAyNjJFYzQ1Vm1HNGEvYk1E?=
 =?utf-8?B?YWxxWTdpVVFoRUFnbGRZVjN3MmV1Z0NOVlZ2S3htakRiMHJtTW1CWnlRQ0c1?=
 =?utf-8?B?bDlZTFFtM25oeUFzOWpWWEdpa1BKZmxmYlpwZy9udkgrcE1KdVNvZ2xuNDFO?=
 =?utf-8?B?VmZDMWJHeU1lUHpFQmZCNldadXFtRVRQbGFIaTBBcCsvRjJpNGtJZWJQSHNF?=
 =?utf-8?B?RDdRQlkzZWF3YXdEejhDcStKbnNLanhrdnVZT3RhNlo0dENYcGU4c3NqbjRG?=
 =?utf-8?Q?vrMVf0380feRhC2g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b01162-2f26-43b5-4238-08de69b16665
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:06:18.2418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BNGK76zsM8LuC18b6JJFVyqS9MjjW8UhnsDGq8qVbnyrNCifHBXxtywkpI5KTHDFBVFyBpvvT0oWzcacW/fMeXtiJ4EYqvUAW4SM4tmwt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> Hi Kiryl,
> 
> Thanks for the review!
> 
> On 2/11/2026 3:17 AM, Kiryl Shutsemau wrote:
> > On Tue, Feb 10, 2026 at 04:17:12PM -0800, Kuppuswamy Sathyanarayanan wrote:
> >> Intel platforms are transitioning from traditional SGX-based
> >> attestation toward DICE-based attestation as part of a broader move
> >> toward open and standardized attestation models. DICE enables layered
> >> and extensible attestation, where evidence is accumulated across
> >> multiple boot stages.
> >>
> >> With SGX-based attestation, Quote sizes are typically under 8KB, as the
> >> payload consists primarily of Quote data and a small certificate bundle.
> >> Existing TDX guest code sizes the Quote buffer accordingly.
> >>
> >> DICE-based attestation produces significantly larger Quotes due to the
> >> inclusion of evidence (certificate chains) from multiple boot layers.
> >> The cumulative Quote size can reach approximately 100KB.
> >>
> >> Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
> >> capacity for DICE-based Quote payloads.
> > 
> > It worth noting that it requires guest physically-contiguous memory.
> > 
> > Single order-5 allocation is not that bad as long as the driver
> > initialized during the boot.
> 
> Good point! We can add following to the commit log:
> 
> The Quote buffer requires guest physically-contiguous memory and is
> allocated once during driver initialization at boot time, where an
> order-5 allocation (128KB) is expected to succeed reliably.

That is good feedback. I would rather not restart the timer on the
linux-next exposure with a rebase to add that. I think in this case it
is sufficient that the commit has a link back to this discussion:

Link: https://patch.msgid.link/20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com

However, when the the patch to add the link to the documentation for the
CBOR Web Token schema is ready, do take the opportunity to also add a
patch commenting about the order-5 allocation risk to
GET_QUOTE_BUF_SIZE.

Later, when / if these objects start to get into order-10+ allocations
for PQC etc, a scatter-gather mechanism will need to be considered.
