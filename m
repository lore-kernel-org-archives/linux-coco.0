Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793653661;
	b=IQO+J39YEAJ/I6Es2RQYObVyfPc96o0yyTRTaAnENSMcSfzJXJ2CeEn/P6h4cBrBy+zR
	 GT9h2Q7UrFhYJsXJGHoHoN9NtfaCESRbOlWjvvRQReCUprMDnsF+09yn8eMMxCHCqzmsW
	 CWnPFkZPhCseSG5dcQ4yTTkQJnX9zJewGSn9whp6fZpJjk/snf+6AWzUncj1x7RmqzvRj
	 ovPysAhDtBMmNwV2DEtdRaL9NVNoxjiGZ5JS5iqe8t+QupVFLknzuguVBDTfnyDde290D
	 olXBjiRHhZxIQK17Je65TeQpwx8oz/dnB/ClAvW564xZPurIW7kIPYqc2r+aFrDSzLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653661;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=HKYdeIs9WckCSCQhrd3NBVKCJuqhSweNYBilIUzFjQI=;
	b=XMN4Ggs6hoEeeq+7myarQsYfoPNu5ThWh9yNuU0AGmAzh+XH5C4bcCRzEd9DOKLP5hiH
	 f40S0+o6EZPtYTwuIzZZcrQA3VRC/bHR+I1pPKxd7RlmcdmDluXfHhC9y/j6yYjVi2Bz+
	 C5362o5D7a4qpfsuBKNvIz6/TwlfHvc298lhldkRPLYOkDBkW8BcKbhUFtBleI5+ZMRy7
	 P8iLADu28PMQJI8+kkrFVfcWZQEUffuQKM2l8mkp3mmuhTkiFfkLLTxRAmlva827GX9CG
	 TP7atLFk6jdlVlQhU5h1WKkm1YsQixMNgF3e8CE17KKeNTCSd4/X+4Kt+xP8rkqIl3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQvurDPE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B18606D810
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 21:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20B18606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQvurDPE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793653660; x=1825189660;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HKYdeIs9WckCSCQhrd3NBVKCJuqhSweNYBilIUzFjQI=;
  b=EQvurDPEG/a+Qasq+rnHL6Wzwt9q9xpJuFUZkERvPQgTUFbxyS0Qk2ZZ
   TxTe9UNgEAcPhfT5DFtgZs5YfPKlw4hnd0tTD9fpfNhBYLH8CqPE4ZilZ
   bDuRhxruEodu89M4xNh/AKC4ieaFDqRWdBUlrc55a9FXjH+MaieZpRQdF
   l6Kre0u82fDWc7bxssxivDQExaqIEZ0mf7GtnRD7ZwVJje9sZ0CQzuY47
   zmjD2ukzCC1Hj4W2jVPOhlmLS2I4Zg24zPrLR+Xyi+28WrKOYjg+aZErk
   CDMAPHS4swDePrsK6t5ZDSmzuoTk2d4N/40xfyNj2icVj8r5wVQIDzzIw
   w==;
X-CSE-ConnectionGUID: hondoCb8Tj+YZuiTQFfCEw==
X-CSE-MsgGUID: AmQYdigCQky2ujEJ+QrskQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2390650"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2390650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:07:40 -0800
X-CSE-ConnectionGUID: ZusH/Z7ySZO/JPsh4PFE2w==
X-CSE-MsgGUID: UcW00wvBSFSz3tOlagGIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6760342"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:07:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:07:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:07:38 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:07:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=USA2gUC7MSFcAU/xtwo6nZWL23kGJG3F2k/I7wIel8SuhcIxG0rBhLqZf8pxstesqQCwHy4HEZLCOP4OXv8Vh5ZpbFLa1od1iarV6amwNoLifJIPEL29Keqr1HFhIN2vzOOBemY5uDUZPRysICKQGIuO2xxlQElMTBs81C2pgbq+ZhZ+lETEWv8+KaUJLE9BzJ9kP7Ylg+vnk04XtbwjKe36FmWO92hvGgr69y2ojE/MBZunfhPegLsugZJ5LidZFfCDwqSTz/2fnA6r+G0sRiyYGf3sViae0biJHtqpyQykb6aKOe7CMhG0kAy15uCV34s+zcyykAPIYuwYxLQ+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKYdeIs9WckCSCQhrd3NBVKCJuqhSweNYBilIUzFjQI=;
 b=QCwM/sHTWltAFiXJyR/e+8GfqqeVQaxnV0vaChxm2xQz9dzh6T6f1lxqf9qkDj3AZFQP4o/9l2oh0yl+fuBYhwwgOG4tyA7SGC5oua82NVXS5I2v/ghTig97OU+M/X+jkIG9YeE4nk97Bd1eGw3t6+yyG+ZQx+9wK9WLmuJlOOBvHmMT9dbxYmWYzZ/1Ri2dV9G0IrhltlOQT8w3QoK7lknC5mpo2qSCEj5UlCLkz6IAO0n/9BSTBIWyCUb7AUXOGp6ZXuYEXgRLe01Ve/x9y3N0labKjYrDSPTStYJ9zVDNiSnC2E/e+fQ41X5yKZh4kAvl6voekPfQsJXYEyasdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by IA0PR11MB7377.namprd11.prod.outlook.com
 (2603:10b6:208:433::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:07:34 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:07:34 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Peng, Chao
 P" <chao.p.peng@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Tian, Kevin" <kevin.tian@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>,
	"Gao, Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5wB9qnnI5wkC3DPnIBykUmbcPMKyAgAHu0QCACmUogA==
Date: Mon, 2 Nov 2026 21:07:34 +0000
Message-ID: <877499ab0c8f3575ac6d424b5be59ff464aa9026.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
	 <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|IA0PR11MB7377:EE_
x-ms-office365-filtering-correlation-id: 1b3e71f7-f741-41ff-6ec1-08df392550c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|261021123027099003|261021121427099003|261021135927099003|261022105027099003|261022075727099003|261009223027099003|38070700021|261026140227099003|261026121527099003|261028144727099003|11063799006|4143699003|56012099006|18002099003|22082099003|261102123227099003|10067099003;
x-microsoft-antispam-message-info: qprwx892PMEa/c61Xb725m6LSV8w4zVvJloNTxILirvj+Fd5Mv+ZDOf4o9unjtr8ZdcemINHDjHLxCWKWNNVr3g5Jhwrzz71NRxr/Qqbx0uW8RrWn3MrhlVgzTV/a8ov1gpVSiZ547UX39XWjnGXDsfFTZOymTe6OfgoBuwOg3kbrUZjS959CMprSAvuesH38lcXusB2EOc50ml5vliEWwPSRxS308ex1BNYux0aPGIoCcC4JXZglpo9Gn5TL4Yfb+o+iIA2E904JVKKj9d2TwDKn7PAuPlbR57/jM6483nCw2duJlZGUb9F2GIZXz35ZmkXCaHeCg8AD+QQf05U3jJRanYD8Hwdl5Ria16dPE0ZgJY/1EDyWn0RyUJsCb6v0U9X8KKoJOzxsdNqqDzpDVnEaXUeRUeM4T/4I1HH8EQ15536iB4xYUYEtThhcDfMwypGgRuJgQJ4S1UVLA0W4iPTBquFbZoZ8xC9AUrTIgEYkCT6V6nJzIHNV9Fd2C5iVZtDZXScEpOmZniCZypLLOU+Cch7Np7Z9mW8zq1lItbd3MxSDkO43BOocX0cXaWGLn3Ru7l0H2RjpE3YMhBjonK2Nw6cWmR1EzOhNcuzY7LN0LgglA15nX8E5/2B0az6yjzIHOc2fer7NSmB1i1O1euo2m8s6Tq2qoPkpE9yJ3CwhYeZQLloWVOaZ3xGPE5oKeRVwt27nEIfsmlUuSfYoRUeldbwMIZMdDMQhcgkJz0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(261021123027099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022075727099003)(261009223027099003)(38070700021)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVdMOE10NncvL3hhT1FkZ0x3YmRmT2ZyT1I3R3czU1JzZUtTVUcweUh2NlI4?=
 =?utf-8?B?aThqQUF2WkxiRms2ZUlVeUNibzZ5Zm1aNW9TMEt4WUd0ZHVSUGQveGhCU2dS?=
 =?utf-8?B?UVNFaGlqSHZ6b1pCRlYzeG44cVVZNmtBaFo4UHhPY0hENzl1SUIvUHZ5TThQ?=
 =?utf-8?B?b2FwbjRaK2tYQjY5bFJ3eFJBRXlYdlVwQ25WVXRjdmhCbjJ2U3p5Ny9WZGdZ?=
 =?utf-8?B?bHhvSE5ERmxmZysvQ0VIZ1ZDYmNrZ1JrQnkxclo0WDB6bWluZSttWWpBSmFY?=
 =?utf-8?B?R0pNYTlHUlk1cXF0M0JsZWhaSTdpS3ZhT1BHUnEzU3B0OUcyazRDRjkyVE5l?=
 =?utf-8?B?NGIwOW13ZDAvRTFnd1VUZ3dDRnRvU1dhTWxPSmRzYXhuQ21zVjZNZUdIWTZk?=
 =?utf-8?B?WU5XSkV1VEgwb04vNjZNaWlrSnoxeEk2TERHY1dGQ0U0eklTVzltaGRTRzhm?=
 =?utf-8?B?MlNkMnY2enVUZ1U3ZzVmZWpNaUZ4RGl4aksraS9td2F2RStWQ0RzNDJPYXZw?=
 =?utf-8?B?dWtCVFRneXNCL0Mzem81bHZUaTUxeERNT2dYcUdrdnNzNWJFbktpU3ZHaE1H?=
 =?utf-8?B?NGtLYUNyZE1TM0QwMFNHK2tDVTY0a3RrNWYwenRTdWVjMnhiWXoyaHkyRWVH?=
 =?utf-8?B?S1lBUFdHN0wrc1NXYnNGS1lpTy9VY2lmb0NkcTRzbWtRK2FhVDZZQzkwbG1T?=
 =?utf-8?B?WVdMSlRYUGdaL0NtNEUzb21lSDdoUkd4WE4vRkdMR3N3NGxmdWU2QzZNOE9X?=
 =?utf-8?B?R2ZWTldVUGVYYlR5NVlsaXZtLzhYTSt6bFdkUCtnSHRjUThVbEVpY3UrZGNk?=
 =?utf-8?B?Wmc2TXhIWmlkTHpiSTNaZ3lQQVlTdEt6eDc5TFo4dFZMZTBNQ3R0RGQyRG9q?=
 =?utf-8?B?N2pHQzlKZFZYQ2lFbTdTY05QM3pWZmpSR2JKRWludFFLeDlnWmluV0VIUGd5?=
 =?utf-8?B?UmloSmFyY3VVdE1LV0RTNHR6b3NPVG5WRW9hT1lkdnRmV2d4Rk1SZGRKenQ3?=
 =?utf-8?B?NFdvSHlLak5hdG82KzVsMmFpZjNNWjFZYzFmKzZCQk4ra25JcUcxc3FZV1Yy?=
 =?utf-8?B?OVMrcU5XWlNpVXBBSUlUelBOdUtCTnNlWmtqOHg0MDYrVm4reWhSUU5KeWta?=
 =?utf-8?B?dVRyL25KcGt4TjlYVTdhT09kOUdNb1V4Tm1rSTIvMUpqS2IvNm05YXRYUFRJ?=
 =?utf-8?B?R1JxS1c0ZFZORWVDR1JMR2QxSW9KOTZ5SXFiUjIyd0hKa1MreUtWR3I3TkRD?=
 =?utf-8?B?WTdHV2lsVEpUMXBLc3NhVXpIMTFXa2N6emNNdjhQd2xuUzRYSk5vUG9zeW9U?=
 =?utf-8?B?ajQwVytDZlF0Z2U3L2VmWWRuOFlrOTRXRUtHVmNPQllvSGV0UE5iSmJnNERS?=
 =?utf-8?B?SlFoSnY5UzI4L3BUNEVZV0ZSeUcydy9Gb2VEeGh0SUhDWXh1OEtocXNWSFFU?=
 =?utf-8?B?QnMwY0RJRFM0ZEJzSFpSczE0M2JLSmYzaDJpTzFkbzl5Q3p1QlBnUmN6cTRE?=
 =?utf-8?B?ZVk4SncwRWl6aXVCSlBKS3M5YjRlM1FiNmNmbUgrVGduOE5SOStIWmIybmVR?=
 =?utf-8?B?QWRyaGVaMlNkcit3RG1mZmVjeDRueTlHS0EwcUxNT2pKbXd3Vml4WGZXN25n?=
 =?utf-8?B?czJvZ2pIdE1XT3diM3l1bnZwMnVXaU9BRUgwQXBSYkZLV1NOdXRxZDFTM3hZ?=
 =?utf-8?B?YTIwOVBtSlE0bUhGZGtlZHh1UTBtWTBCR2ZkZ3dSZU4xc3JPck1Ia0k2TUc3?=
 =?utf-8?B?ZVBYUmhucGhqeW1LRVVBalVIT1o3eGtRZ1lrZUpycE5sNjhFb3M2UlpqdjdE?=
 =?utf-8?B?QncycndEZWplbUk0OGxGYjl1NTlKWERGMW1lZFhoUWNFaVE0d1AxcCtkV1kv?=
 =?utf-8?B?RG45NDdudzlsTkZGVFpnOFhVRTRCWjl6Yzl2aWo0ZGgzdG5USzd2ME8vRnEx?=
 =?utf-8?B?ZGJOankxVjVrV2lSU2Q2a0oyZ2oyajNtN2tISjd1SDRGYWJyb0kyUjkvNnRs?=
 =?utf-8?B?TzAzazUvZzd2enQ2NlJINnVwNDZZU2I1bkd4VE9CODBwVkxrdThDQUlIdGR4?=
 =?utf-8?B?YlovS3Nmd3FYWUczMDBCbG15bnh6OTBOMXFlbVZHZGRTWTdqTGg5ZUJTc2dT?=
 =?utf-8?B?S3NDclU2WEFJTTBmUE9HSkRJRm1aNTJ4elJtWDFOVlZkOEpHc0xJNVk0QUhP?=
 =?utf-8?B?Z0RCYTdJRWlCZmRrTVdjaXV5SW5idFI4cHZheUNwY0grUXFuTWJrWW5XTi9C?=
 =?utf-8?B?OE4vQVQrMjlRdmUvQ1FzNEJuVWp3TUU2MGkzVyt1N2M3L2l2L3BENkpuVE5x?=
 =?utf-8?B?THkvU25UbWE5RUdncDBhTStiNTVhTXZQNjliUmt3N2lzdnM0cmFydkRtckZa?=
 =?utf-8?Q?Q8u+viPAsyveZDac=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29CDFA641090A24D98E8AFC9B2330682@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1WCBb1pBDuXCXlMhtoVgkI/pmzPkYy+kkttClE1z08WCQRjK+Fp6v4WO3Fm5rZS7IlRoBmGQ7JJmL9bXXBtW8e6CJo/+ARmbm329iE6ziVk1MJswRzj9UECWezcsZm9UtA/2vl5yGAntXrc/2ydAZjApEfZOXqF95pnDFodYNGwl6Zkp5kFG2tX5Z3ZnatC9ecCURgbETXgsdylD9dfn1tVSEdf0la8HqkzWQhVUd1ICzV8q9mBryIgC+U3djeY3MpHLwiQgzJTl9sQlYihhPBhn69RQkzUfzb+exB0ntdvva84A1kVJsQV0l5vPpU2uLvEKytO5Up7Ta2SrDZEemA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e71f7-f741-41ff-6ec1-08df392550c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 21:07:34.1374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbEJ4gbPB2bfIPLoda/aSkoe3gd295LjMe2/7StzzEsWub5ekgrabOpVFYCbJ7tNFS/0Aa/RWTo500uDwH2zq0sDs3rTq90p6limgMw+HmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTEwLTI3IGF0IDA2OjIyICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQoNCg0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBM
aSwgWGlhb3lhbyA8W3hpYW95YW8ubGlAaW50ZWwuY29tXShtYWlsdG86eGlhb3lhby5saUBpbnRl
bC5jb20pPg0KPiA+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAzLzE1XSB4ODYvdGR4OiBBZGQg
VERHLlRESS5SRCBtb2R1bGUgY2FsbCB3cmFwcGVyDQo+ID4gZm9yIFREWCBDb25uZWN0DQo+ID4g
DQo+ID4gT24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4gPiAN
Cj4gPiA+IEludHJvZHVjZSB3cmFwcGVyIHRkeF9tY2FsbF90ZGlfcmVhZCgpIHRvIHByb3ZpZGUg
dGR4LWd1ZXN0IGRyaXZlciB3aXRoIGENCj4gPiA+IHN0YW5kYXJkIGludGVyZmFjZSBmb3IgcXVl
cnlpbmcgc3BlY2lmaWMgbWV0YWRhdGEgZmllbGRzIGZyb20gYSB0YXJnZXQNCj4gPiA+IFRydXN0
IERldmljZSBJbnRlcmZhY2UgQ29udHJvbCBTdHJ1Y3R1cmUgKFRESV9DUykuDQo+ID4gPiANCj4g
PiA+IEV4cGxpY2l0bHkgbWFwcGluZyBhcmNoaXRlY3R1cmFsIFREWCBlcnJvciBjb2RlcyBpbnRv
IExpbnV4IFBPU0lYIGVycm5vDQo+ID4gPiB3aXRoIHR3byBoZWxwZXJzLCBpbnRyb2R1Y2luZyB0
ZHhfbWNhbGxfdG9fZXJybm8oKSB0byBoYW5kbGUgZ2VuZXJhbA0KPiA+ID4gbW9kdWxlIGNhbGxz
LCB3aGlsZSBpbnRyb2R1Y2luZyB0ZHhfbWNhbGxfdGRpX3RvX2Vycm5vKCkgc3BlY2lmaWNhbGx5
IGZvcg0KPiA+ID4gVERJIHJlbGF0ZWQgbW9kdWxlIGNhbGxzLg0KPiA+IA0KPiA+IA0KPiA+IFNl
dCBhc2lkZSB3aHkgbWFwcGluZyBhcmNoaXRlY3R1cmFsIFREWCBlcnJvciBjb2RlcyBpbnRvIExp
bnV4IFBPU0lYIGVycm5vDQo+ID4gaXMNCj4gPiBuZWVkZWQgYW5kIHdoYXQgaXQgYnJpbmdzLCBJ
IHRoaW5rIHRoZSBjb21tb24gZW5hYmxpbmcgb3JkZXIgaXMgb25lIHByZXANCj4gPiBwYXRjaA0K
PiA+IHRvIGludHJvZHVjZSB0ZHhfbWNhbGxfdG9fZXJybm8oKSBhbmQgdHVybiBleGlzdGluZyB1
c2VycyB0byB1c2UgaXQuIFRoZW4NCj4gPiB0aGlzDQo+ID4gcGF0Y2ggaW50cm9kdWNlcyB0ZHhf
bWNhbGxfdGRpX3RvX2Vycm5vKCkgdG8gdXNlIGl0IGFzIHdlbGwuDQo+IA0KPiANCj4gSWRlYWxs
eSB5ZXMsIHdlIGZvbGxvdyB0aGlzIHdheSBzbyB0aGF0IHJldmlld2VycyBjYW4gZm9jdXMgb24g
dGhlIGNvcmUNCj4gaW1wbGVtZW50YXRpb24gYW5kIGRlZmVyIGNsZWFudXAgdG8gYSBsYXRlciBz
ZXJpZXMuIFdlIGNhbiByZXZpc2l0IHRoaXMNCj4gaWYgdGhhdCBydWxlIGNoYW5nZXMuDQoNCg0K
Li4ueW91IGFyZSBnb2luZyB0byBoYXZlIGp1c3RpZnkgdGhlIHdob2xlIHRkeF9tY2FsbF90ZGlf
dG9fZXJybm8oKSB0aGluZyBmaXJzdA0KYXMgZGlzY3Vzc2VkIGluIHRoZSBvdGhlciBwYXRjaC4N
Cg0KDQoNCj4gDQo+ID4gDQo+ID4gDQo+ID4gPiBVbmxpa2UgVERHLlZQLlZNQ0FMTCBiYXNlZCBo
eXBlcmNhbGxzIHdoaWNoIGNvbW11bmljYXRlIHdpdGggdGhlIGhvc3QsDQo+ID4gPiBUREcuVERJ
LlJEIGlzIGEgbW9kdWxlIGNhbGwgKG1jYWxsKSB0aGF0IGNvbW11bmljYXRlcyBkaXJlY3RseSB3
aXRoIHRoZQ0KPiA+ID4gVERYIG1vZHVsZS4gVGhpcyBkaXN0aW5jdGlvbiBpcyByZWZsZWN0ZWQg
aW4gdGhlIHRkeF9tY2FsbF8gbmFtaW5nDQo+ID4gPiBwcmVmaXgsIGFzIG9wcG9zZWQgdG8gdGR4
X2hjYWxsXyB1c2VkIGZvciBob3N0LWRpcmVjdGVkIGh5cGVyY2FsbHMuDQo+ID4gDQo+ID4gDQo+
ID4gSSB3b3VsZCBzYXkgdGhpcyBwYXJhZ3JhcGggaXMgbm90IG5lZWRlZC4gSXQncyBub3QgdGhl
IGZpcnN0IHBhdGNoIHRvDQo+ID4gaW50cm9kdWNlDQo+ID4gaGNhbGwgYW5kIG1jYWxsLg0KPiAN
Cj4gDQo+IEkgdGhpbmsgd2UgbmVlZCB0aGlzIGJyaWVmIGV4cGxhbmF0aW9uIGZvciB0aGUgaGNh
bGwvbWNhbGwgbmFtaW5nIGRpc3RpbmN0aW9uLg0KPiBOb3QgYWxsIGFyZSBmYW1pbGlhciB3aXRo
IFREWCBhbmQga25vdyB3aGF0IGhjYWxsL21jYWxsIG1lYW5zLg0KPiBJJ20gb3BlbiBvbiB0aGlz
LCBpZiBtb3JlIHBlb3BsZSB0aGluayBubyBuZWVkLCBJJ2xsIHJlbW92ZSB0aGlzIHBhcmFncmFw
aC4NCg0KSSB0aGluayBpdCdzIG9rLiBNYXliZSBtYWtlIGl0IGNsZWFyZXIgdGhhdCB0aGlzIGlz
IGV4cGxhaW5pbmcgdGhlIHByZS1leGlzdGluZw0KbmFtaW5nIHNjaGVtZXMgKHdoaWNoIEkgdGhp
bmsgYXJlIGEgYml0IGNvbmZ1c2luZyBzaW5jZSB0aGV5IGFsbCBnbyB0aHJvdWdoIHRoZQ0KbW9k
dWxlKS4NCg0KPiANCj4gDQo+ID4gDQo+ID4gDQo+ID4gPiBOb3RlIHRoYXQgd2hpbGUgaG9zdC1i
b3VuZCBoeXBlcmNhbGxzIChzdWNoIGFzIHRkeF9oY2FsbF90ZGNtKCkpIHBhc3MgYQ0KPiA+ID4g
cGxhdGZvcm0tc3BlY2lmaWMgRGV2aWNlIElkZW50aWZpZXIgKGRldmlkKSwgdGhlIGZ1bmNfaWQg
cGFyYW1ldGVyIHVzZWQNCj4gPiA+IGhlcmUgaXMgZGVmaW5lZCBieSB0aGUgVERJU1Agc3RhbmRh
cmQgKHJlZmVyIHRvIFNlY3Rpb24gMTEuMiAiVERJU1ANCj4gPiA+IHJ1bGVzIikuIEFsdGhvdWdo
IHRoZXNlIHZhbHVlcyByZXN1bHQgaW4gdGhlIHNhbWUgdW5kZXJseWluZyBiaXQgZm9ybWF0DQo+
ID4gPiB3aGVuIHRoZSBQQ0kgc2VnbWVudCBpcyB6ZXJvLCB0aGV5IHJlcHJlc2VudCBzZXBhcmF0
ZSBzdHJ1Y3R1cmFsDQo+ID4gPiBhYnN0cmFjdGlvbnMgaW4gdGhlaXIgcmVzcGVjdGl2ZSBzcGVj
aWZpY2F0aW9ucy4NCj4gPiANCj4gPiANCj4gPiBUaGlzIHBhcmFncmFwaCBzZWVtcyB0byBwcm92
aWRlIGhlbHAgYnV0IGl0IGRvZXNuJ3QgbG9vayB0byBoZWxwIChhdCBsZWFzdA0KPiA+IGZvcg0K
PiA+IG1lKS4gQmVjYXVzZSB1bnRpbCBub3cgdGhlcmUgYXJlIG9ubHkgdGhlIGhlbHBlciBkZWZp
bmVkIGJ1dCBubyB1c2VyLCBJDQo+ID4gc3RpbGwNCj4gPiBkb24ndCBrbm93IHdoYXQgc3BlY2lm
aWMgdmFsdWVzIHdpbGwgYmUgcGFzc2VkIHRvIHRoZW0uDQo+IA0KPiANCj4gSW4gbmV4dCB2ZXJz
aW9uLCB3ZSB3aWxsIHBhc3MgaW4gYSBwY2lfZGV2IHBvaW50ZXIgdG8gYWRkcmVzcyBSaWNrJ3Mg
Y29tbWVudHMsDQo+IHNvIHlvdSB3aWxsIHNlZSB3aGF0IHNwZWNpZmljIHZhbHVlcyBwYXNzZWQg
dG8gbWNhbGwvaGNhbGwsIGUuZywNCj4gDQo+ICtpbnQgdGR4X21jYWxsX3RkaV9yZWFkKHN0cnVj
dCBwY2lfZGV2ICpkZXYsIHU2NCBmaWVsZCwgdTY0ICp2YWx1ZSkNCj4gK3sNCj4gK8KgwqDCoMKg
wqDCoCBzdHJ1Y3QgdGR4X21vZHVsZV9hcmdzIGFyZ3MgPSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5yY3ggPSBwY2lfZGV2X2lkKGRldiksDQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC5yZHggPSBmaWVsZCwNCj4gK8KgwqDCoMKgwqDCoCB9Ow0KPiANCj4gU28g
d2UgY2FuIGRyb3AgdGhpcyBwYXJhZ3JhcGggaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gDQo+ID4g
DQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbg0KPFt6aGVuemhvbmcu
ZHVhbkBpbnRlbC5jb21dKG1haWx0bzp6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20pPg0KPiA+ID4g
LS0tDQo+ID4gPiDCoGFyY2gveDg2L2NvY28vdGR4L3RkeC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDUgLS0tLQ0KPiA+ID4gwqBhcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jwqDCoCB8
IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+IMKgYXJjaC94ODYvaW5j
bHVkZS9hc20vc2hhcmVkL3RkeC5oIHzCoCAxICsNCj4gPiA+IMKgYXJjaC94ODYvaW5jbHVkZS9h
c20vdGR4LmjCoMKgwqDCoMKgwqDCoCB8IDIwICsrKysrKysrKysrKysrKw0KPiA+ID4gwqA0IGZp
bGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4g
PiANCj4gPiANCj4gPiAuLi4NCj4gPiANCj4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmgNCj4gPiANCj4gPiBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3NoYXJlZC90ZHguaA0KPiA+IA0KPiA+ID4gaW5kZXggZjQ2YTMxNzFhNTEyLi42NjVjMTI5
MjVmZjYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4
LmgNCj4gPiA+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJlZC90ZHguaA0KPiA+ID4g
QEAgLTIwLDYgKzIwLDcgQEANCj4gPiA+IMKgI2RlZmluZSBUREdfTUVNX1BBR0VfQUNDRVBUIDYN
Cj4gPiA+IMKgI2RlZmluZSBUREdfVk1fUkQgNw0KPiA+ID4gwqAjZGVmaW5lIFRER19WTV9XUiA4
DQo+ID4gPiArI2RlZmluZSBUREdfVERJX1JFQUQgNjcNCj4gPiANCj4gPiANCj4gPiBQbGVhc2Ug
bmFtZSBpdCBUREdfVERJX1JEIHRvIGtlZXAgaXQgY29uc2lzdGVudCB3aXRoIFRER19WTV9SRA0K
PiANCj4gDQo+IFN1cmUuDQo+IA0KTGV0J3MgbWF0Y2ggdGhlIHNwZWNzIGZvciB0aGVzZSBmb3Ig
ZWFzaWVyIGRvYyByZWZlcmVuY2UuIFNvIHllYSBUREcuVERJLlJEIGJlY29tZXMgVERHX1RESV9S
RC4NCg0KDQoNCg==
