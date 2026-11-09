Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794267541;
	b=IxCj7O6lj+UDRnUdE1JWnW7CatLSOYElrLpYAeYhsoRF41zzW8HDnYrD45imjQlSCpot
	 xoOBePas+AvA5FoTwJii8i5i+57uJJVPt+DuxzA3uq3ZnJqo6NKJSky8z9oPi/GjsqkeC
	 O8MrlwfpHJ1xRKX5RoMT681XDqHTl/EMHoMQzCKtye/c9kiCVpZ6Y9uVTRnqtbUHNGd4H
	 lxLBk4dV7UGnmycca+/mf0hHV2itADzLxas/pi8aOgeTElXXrjdEYgNEx2JSbCZlw/Iu8
	 pbLiF+M43v1O6FRIj4LNYuSTt1OMZF3yo0wKcJCvQGMsEpUCtJf9gtv22GNVdqY7F4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267541;
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
	bh=ZE3hWWh6xMnwCcIDEoOcEIWLGsVK/ieUB9s1RcK7rfU=;
	b=x5fgiMsvGY8QfKAy0D1PC+A9QrLxIb+HcZHLifXdBGqSskx5igS7Lmge+3XTWlbfEgeH
	 D2u7m+3zni6YNBskvZWOQWV/LpEgj6mPfzc7iatnIS4ZDIUu53jxCf5hBtRufBbA8eM7C
	 Ql/qlacr7JEiBi8wI9uFGtSIcyI5+t0E7t/XeoZLAAm9qzCISR/Hl8bcSBgy8/RYKvBK+
	 k5Hq7sP5IS5AbJa5/z8RtQJMT4JphnjoSSsbQcGjw1h5ZODXU1qixFin31FIcJz1OBHwt
	 8i5xjtOe73HGogY+kgP00cs/qc8G40gUIUPFDOCOY/zNm65J62mILrFarabx9XOjW4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miidyDbC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E95606A321
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 23:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E95606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=miidyDbC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794267540; x=1825803540;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZE3hWWh6xMnwCcIDEoOcEIWLGsVK/ieUB9s1RcK7rfU=;
  b=miidyDbCgDHA/aovQwLqyS5lYrd0EJW+mTLmuER2/wXIqdCY4Lcngi1/
   1RoNfWQ3RfCdivpHXs2oq4bHTs83kFyIpUZfFIKmvM1dTc2Kq6lUVlZs6
   MFacvWRo2t2geHCS357SZcDTr8mQ5pUrk1RuraxJy6PY4hE1yG+NtlYzs
   TMo6Jc5WlC0Tx6SGvOLDPxfL1HNdTiUNwMCCp5cM9g51EL/NmHW4wzHg6
   GPWp7iHaTYPYkI4BvtjmLzroJBy4m00oAcr+NfuaFgNkIwLmqEl7UesBc
   jfZNOpPunB4ukZYQS/kaQb3Cc9Yxixz3ZapW4q1l5w2MpLGNhgVEgPwxJ
   w==;
X-CSE-ConnectionGUID: OYdS1tGISHasvxwUyFTgMQ==
X-CSE-MsgGUID: 4heWqsioROS7wkRI/HwTsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2883969"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2883969"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:38:59 -0800
X-CSE-ConnectionGUID: 8a3oHdsfQT+FrPe+tIdFQQ==
X-CSE-MsgGUID: TtWdtw1/SRGfB+NI7QLI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8131386"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 15:38:59 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:38:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 15:38:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 15:38:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dH68hLmJKlQxYYMV2qLg19gLbWJxNm+klRN6qIO8cB+U7sOCtRfMvbissVbLF6LfQ+XeUkxk2P61dC0xKyOMHP5UkUOh2j0LH1RxNB6iLdo5VtG5LhTLq3Fp4lwLTTexYrc1zZFgdcVP9oORiY+pxEHnJrETD5x7zOl/eoGvps/MYeDg4bqznuFahWTkR+DkbBPK677nu9EG6PIfX3CjSN1cHCzgtiJ4+CaJ5xcDta0Zl7oZ71Wcu0SBJSHGzFlheIlEWHsDpuz9aE3YbevOjdmbJmASP7MjMy0vPc5Vj4I3HhItAmCDon62auJ9P6CS4f4BoQMfsK8sBZ4sguNvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE3hWWh6xMnwCcIDEoOcEIWLGsVK/ieUB9s1RcK7rfU=;
 b=VGAFWOv9jPqiAs2tBTQA+fhbjwvL66RHao5XZe6intF/8SApJn+CpkU74H0R1B2IjImLCdiJggsGjb4tMEnK4YfwKEzszJd/lxpf33S686ctskjhOHMpMh2T/Bg21C/sAxz6/b2I67WOjnRUNnYuzHIwbn8Jh8Cd2515isgzT+H740s5KY5P+S/7c5jm/5CGlYjd42jgv3awwORheejI27I8QMgaMMVzdve0/4HAJsfrE/xyqUOJyZnm3zX2XCi4qUVA1v0gY9bgpcVCpoAuMc2UFa6YDroyEuijTZCtvcq/6PnVUOzzj0Gk71DOzI3ie68wMuz77BxvTdobXat/MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by BL3PR11MB6460.namprd11.prod.outlook.com
 (2603:10b6:208:3bf::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 23:38:55 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 23:38:55 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCAAMbrAIAAXtqAgADqQoCAAPKdAIAAhV6AgAYQNAA=
Date: Mon, 9 Nov 2026 23:38:55 +0000
Message-ID: <d9f4f891962900f6eab756baca4ab4c1a4b235ad.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91363BF2AFC2ED5E126DBFA792682@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <b15708f7cd770fdba4082b19488422a376c2aa9c.camel@intel.com>
	 <IA3PR11MB91367791D58F8DA63D0F2B3692772@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <d1d48263791816b2f361bca2d3a9923e5395a49c.camel@intel.com>
	 <IA3PR11MB91364D04E26736B09B444B9E92762@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91364D04E26736B09B444B9E92762@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|BL3PR11MB6460:EE_
x-ms-office365-filtering-correlation-id: 12567dbb-f53b-4a84-d58b-08df3eba9e70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|22082099003|18002099003|6133799003|10067099003|38070700021|4143699003|11063799006|261028144727099003|261102123227099003|261022105027099003|56012099006|261022075727099003|261021121427099003|261026140227099003;
x-microsoft-antispam-message-info: v4upapI/wZwNed7QH9xoewKiJQCySmrLjvVbMK6G0tWJ9Wz2L4a8ULgSOlHcA4l1ub7jgHQIzqkdCal0ChMOF3NBoVKdTxxyHywKKRWU4eUMG1K13N5QhIOyVij5rcj2ue+xMffky7kYYNeohj92LLR40+Fh+yOW7H1+YSdvdCqzP7dEdGivMJjGdXvNS8jGWXOaA9e/KqGQ7rPCPVK9mGGIOph7mkWifg5bjiaq3QovFY76mBGM6ufGvFaY0KjhntcMCvvQl21cFcKOvJutEmcCCg3yVdFR+2/eV46xOMrZWzQJCRxcNJ6Rm8PKPhI9lwgRxeHVHuuWcIuTp4B1dhwqb51iXWxjaUWLghILnuQjGPGKRFwJlio9nyj3bQkYQIknq56uwGpJ3x7Na8LsRvTglWlzbKVOV1mhCUXzQZV7GCwWxn1Mmtzpn8KCO+dRNiS3cQCk0tTlx6r8bt0fVYl6y1J5ZmdxjHjBYu8kMXy6jtm+E0VVfFEJfHrg7ywcHZtyqlttCpIVyZOtx/2IXf6jwnxj9YjOhmd+GNt+AMuurchVkvsnk5Y/khrf1ABp3r6rKYC8sfgY3/TPDk/TgcOtam3Y2HkmYwrSSyyQ5Yt+SXu15uSpgoJx8U5jAEhFB9saMmXbt10jUBrvBlTN+Xe7j6PjGf3iW6UJb0m/FOmwfPoNhqmgwDHAxplHI98FTNjuiWpZaYt+A/35L6R82A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(38070700021)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261022105027099003)(56012099006)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkpxSi9TQmNUbUlsZ0h2SEhWZWhycDVIMWxqR2hsY1BYZ2JuNFBSUk1ZeTI3?=
 =?utf-8?B?N1ZNL1Z1WXg5QytuaWN1cFVCbzVEbkhXVit0VGhVVTM1V1RIdnRnV0pLY25D?=
 =?utf-8?B?QW05d21sd2hBYmRFTU1mQkx0emJ3SlhaTFBhOXRsNUh3U0ZZUVo2ZVY4TDhC?=
 =?utf-8?B?R1pjendLNk92NmFCSHZzU0JKTWR0Y1FqMmhIWTVpUDFhNlVBMU91ZkVWNHJj?=
 =?utf-8?B?Q2x2VlhzVk4zbGw3dS9pRnIzSE9uWWpZUHdJbXFENWtVcEtKZWUzWURmY1p5?=
 =?utf-8?B?aEtDb1pXQ2UwN21IeDNwK0lVb20wNHdmSHFXYnlXTGVCZGJkZVNQd01pT3gz?=
 =?utf-8?B?REN2Sjd6OFpSUEFmNFVrMEZNYVJpUGlqOHVDbG5CZWdoakM3RUNweXpnUktE?=
 =?utf-8?B?NHc5UGRDaDZxNXplQnYzM2RhWjJoZ0p0Umh1RjNWQ3ozaHhwcXRoUEx6eW1z?=
 =?utf-8?B?SmlCOFhTVWJ4a3c2T0FSRUwxZUh4RVBSelNWRldpVzdHdGtZbFRZMENEdjlp?=
 =?utf-8?B?bDlnWDJsajNwT3hGVWNuL0w5L2M4SVlpaWM3OFgyUnVldUQyUGY2ZzJxTkg5?=
 =?utf-8?B?VlltMUdPS1NFMGV5Kzd6NWxhajJZeW9naFpwNlJud3p5OUUxS3NzS2RXeGpC?=
 =?utf-8?B?dFlSU1hZblhpOW5WRGsvNXZSTkRMRWpqTVVEcGFiZXRlcUcxa1kvTWdFWVB1?=
 =?utf-8?B?U3ZuUFUwWlNhZ2V3enRQcjdhVVBIM3g0Z0NWa0x5NFhaOFRzOFR4NXI4Mmhj?=
 =?utf-8?B?aUZzR1krZmErWVp6ZjR3aDNzaWJFQW82bTkwNzNaM3RwWlpBRCtnY0ZjS1RK?=
 =?utf-8?B?V3BnZlZKeHc5TlJIWUNvdWx4VGF2TU05akpTeWN4WFJ0ZlF4Q3ViU0dTRkFU?=
 =?utf-8?B?SEd2eEZpTUtuOTJzQ0krUndBRk54cGxxT0R6MkhMNFJZS3FmcUo4bmdDSzFJ?=
 =?utf-8?B?c3VtckI0VmZKK1FFaWlkc0xvMlQxQnZtVlMzZlNmUGtEWWxWMklrMVJscGZY?=
 =?utf-8?B?cExuU3BoSUFEcEJxS0NDTmFDeWxuQW03WVh5SmIramk0VXo3a1VzbnY1UEZJ?=
 =?utf-8?B?anlndkJDaUQvaERaRkNPMnByRVkxYVByMERYZEFJc25WbWQrWVRKYkE1czBv?=
 =?utf-8?B?VERLbEdkTGVGc0tnMVVtQk5ua2FqOXF2TWF2THdyMG55YmpSM2ZUK0loUmhx?=
 =?utf-8?B?SEQvT0ZzWVB0UUZrZHFNZEU5amp4Q2NDNnlRNHlJOGhXV2tTWDZyKzRIVkph?=
 =?utf-8?B?Y3l3dkUzZElFNVYvb2lScjRsSlFhM3NFZjBURTBMY1hVMEJWUm5hTU5hVUxE?=
 =?utf-8?B?eUcwcmpBSXJyanNxZGpPbTVTWUtFWVVFbklDd0I3R0VjVG1NTGpmeHZqM0dv?=
 =?utf-8?B?Mzd3N2M4dHd2VU5LeVVMYUozZW9ZUE55SFRCZjdieEU3YXJUYXQwYllaOFdj?=
 =?utf-8?B?cFBtK1NnWDFkN08vK21KeHBPQXJOK0JOc0NtWlRoMzduSm9CNFVQMTltU25u?=
 =?utf-8?B?ZXlGaVFWZ282TTJMTXRrRlg1UE41bEhNM3FkUi93MTBhd3hZSzN4NnJYSjVt?=
 =?utf-8?B?cVZEN3VMbGc5MEFObExsMWNKZWVBU2ZrTW5zamtJeUx6SitjUlI5NE1zMFJw?=
 =?utf-8?B?WERWMTU5a3UvZk5KYlQ3ZVNiV3hCMVo0ZEFwTDk5Qi9hOXhscTJyZmwvQjA2?=
 =?utf-8?B?NkFmM08rUE5FZXdSajRCd2ZKMjVSVTAyQ2IwcmtJTFU4RitleUh6OVRwWmtK?=
 =?utf-8?B?MTFDUU9GSEs4eVgzbUJZdFJ4RzZScWV0RSt0UXpEa2NOOVBORTBLUDloLzlZ?=
 =?utf-8?B?T01jeUFXeDBjbXZqTHJLWVY4TUZnVFJkRkJmbmJWMUxqdmRueEo5NTh5Y3Ey?=
 =?utf-8?B?RlF3dWdIeFc4MnhMUFdLVmtUMFdOWkVES3ZoRnNYTkZiYW1ZMHdTSjNwdnhp?=
 =?utf-8?B?NFJFTlNJRHhOYjhIMVI2MENOMDdGWERkajV5U1dTVUVvakdOOVJNRmZXK1BJ?=
 =?utf-8?B?d2tOYWZQNVp2R0dzME5hdkxJc0VDVmxTcTVrcUFzdG4xb3Z5Qjk1b25CUnJY?=
 =?utf-8?B?ek5YdXZpMEk5QzlMa3NyeXZZZEwrYzZvTHd0cm8wVXdiaEFOalY4TnhwR3Ir?=
 =?utf-8?B?ekRmQmlUQ3JDQ1hQUGVuS1hjK2JwTVQzQmh0R1FnT0FxanFaZDExZnFBWnFP?=
 =?utf-8?B?aEtORjFtQTBlMFl4NVFZOW1hTEkxQkcxa2hmcUE3Y0U2UzdNVHA4VjFyY1Iw?=
 =?utf-8?B?UTRjdnlxeWJWT20zR1ZRTmxMYXJIKzRkYU00ck13R2VUVkRpRmkwVUxRVXd1?=
 =?utf-8?B?ZExncXBDS1dQQ3MwcVV0cHRsVnM5aUpHTFNTanZGRjVDT2pWVmxnWTVnaUFz?=
 =?utf-8?Q?jerzc1p8Mk3zAlq0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6894BBDC0CCBB344B7DD0E04571C4D8F@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: wGznFzzLugxmm7+Md553xxnDEDWfqWnjoO9XZvHWuYVG9Q47Cl5af9kJ24YGMtxJxBveE0l8iATEG8t482EV76GbhCmy90QAiodk539QhZ69uWuz32JiFJbsdEw1HjSCvZyMcualyZJp2lbJyfTgo8+VB6wElMxydCdm2VfZhlDrYlLcwIFM5T6357IOR3QbntHX+wXG1bL6+DXx6TzzAKs8U0Jn8nKeMOWp17tW2H6m0D11TcSr/BdI318XEY/eP2X609mmd5qI1EUiIjOg2u/ODLpwTCUqyBRAi9MIc70H6g6GBLM3UyU+Qy7fbluJMGDy40XbIAIECUZqeTULAg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12567dbb-f53b-4a84-d58b-08df3eba9e70
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 23:38:55.2766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QHPn/3S3IZruFy9KUcuxnpP/Ghqk6RqTSUqAqDFd1MF6J/mo4gGiBHeJvRlS4imcX3MulkIpfZLR/9Ox+D+ezwtMKwpX6DzoAGIWoPXM5vI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTExLTA2IGF0IDAzOjAzICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gDQo+ID4gU28gaXMgdGhpcyBvbmx5IGEgYmFkIGhvc3QgYmVoYXZpb3I/IE9yIHNvbWV0
aGluZyB3aGVyZSB3ZSBjb3VsZCBleHBlY3QgaW4NCj4gPiBwcmFjdGljZSB0aGUgaG9zdCB3aWxs
IG5vdCBiZSBhYmxlIHRvIGhhbmRsZSBpdCwgYW5kIGF0IHRoZSBzYW1lIHRpbWUsIHdhbnQNCj4g
PiB0bw0KPiA+IGtlZXAgdGhlIGd1ZXN0IHJ1bm5pbmc/DQo+IA0KPiBJIHVzZWQgYSBtaXNiZWhh
dmluZyBWTU0gb25seSBhcyBhbiBleGFtcGxlLiBGYWlsdXJlcyBjYW4gYWxzbyBoYXBwZW4NCj4g
d2l0aCBhIGNvb3BlcmF0aXZlIGhvc3QsIGZvciBleGFtcGxlIGlmIHRoZSBkZXZpY2UgYmVjb21l
cyB1bmF2YWlsYWJsZQ0KPiBhZnRlciBhIGhvc3Qtc2lkZSBhZG1pbmlzdHJhdGl2ZSBhY3Rpb24s
IG9yIGlmIGl0cyBmaXJtd2FyZSBoYW5ncyBkdXJpbmcNCj4gbG9jay91bmxvY2suDQoNCldlIG5l
ZWQgdG8gY2hhcmFjdGVyaXplIHRoZSBmYWlsdXJlcyB3ZSBhcmUgaGFuZGxpbmcuIEFueXRoaW5n
IHRoYXQgd2Ugd2FudCB0bw0KaGFuZCBiYWNrIHRvIFRTTSB0byBoYW5kbGUgd2Ugc2hvdWxkIGRp
c2N1c3MgYXMgcGFydCBvZiB0aGUgVFNNIHN1YnN5c3RlbSB3b3JrLg0KV2UgYWxzbyBuZWVkIHRv
IGFzayB3aGV0aGVyIHRoZSBob3N0IHNob3VsZCBiZSBoYW5kbGluZyBhbnkgb2YgdGhlc2UgZXJy
b3JzLg0KDQpJIHRoaW5rIGZvciBWTU0gYnVncywgd2Ugc2hvdWxkIG5vdCB0cnkgdG8gaGFuZGxl
IHRoZW0gaW4gdGhlIGd1ZXN0IGluIG9yZGVyIHRvDQprZWVwIGl0IHJ1bm5pbmcuIEluIGZhY3Qg
c29tZSBzZWN1cml0eSBjb25zY2lvdXMgdXNlcnMgbWF5IHByZWZlciB0byBoYXZlIHRoZQ0KZ3Vl
c3Qgc3RvcCB3b3JraW5nIGlmIHN0cmFuZ2UgYmVoYXZpb3IgaXMgbm90aWNlZC4gQnV0IGluIGFu
eSBjYXNlLCBidWdzIHNob3VsZA0KYmUgZml4ZWQgYW5kIG5vdCBncm93IGNvZGUgdG8gd29yayBh
cm91bmQgdGhlbSBpbiBvdGhlciBjb21wb25lbnRzLg0KDQpJZiB0aGVyZSBhcmUgc2NlbmFyaW9z
IHRoYXQgYXJlIG1vcmUgUkFTLXR5cGUgaW4gbmF0dXJlLCB3aGVyZSBIVyBicmVha3MsIHRoZW4N
CkknZCB0aGluayB0aGlzIGlzIGEgbW9yZSBhZHZhbmNlZCBjYXBhYmlsaXR5LiBJJ2QgdGhpbmsg
d2Ugc2hvdWxkIHByZWZlciB0byBwdW50DQpvbiB0aGUgYWJpbGl0eSB0byBoYXZlIHRoZSBndWVz
dCBzdXJ2aXZlIHJhcmUgbWFsZnVuY3Rpb25zIGlmIHdlIGNhbiBmb3IgaW5pdGlhbA0Kc3VwcG9y
dC4NCg0KQXMgSSBleHBsYWluZWQgdXAgdGhlIHRocmVhZCwgeW91IG5lZWQgdG8gZXZhbHVhdGUg
dGhlIGNvbmNyZXRlIHNjZW5hcmlvcyB3ZSBhcmUNCmhhbmRsaW5nIGFuZCBtYWtlIHRoZSBjYXNl
IGZvciB3aGljaCBjb21wb25lbnQgaW4gdGhlIGd1ZXN0IHNob3VsZCBoYW5kbGUgaXQuDQpBbmQg
d2hhdCBsZXZlbCBvZiBhYnN0cmFjdGlvbiBpcyBhcHByb3ByaWF0ZSBmb3IgYW55IGVycm9zIHJl
cG9ydGVkIHRvIFRTTS4NCg0KPiANCj4gVGhlc2UgZmFpbHVyZXMgbmVlZCBub3QgcHJldmVudCB0
aGUgcmVzdCBvZiB0aGUgZ3Vlc3QgZnJvbSBydW5uaW5nLg0KPiBJZiB0aGUgaG9zdCByZXBvcnRz
IGEgVERDTSBlcnJvciwgdGhlIGd1ZXN0IHByb3BhZ2F0ZXMgaXQgdG8gdXNlcnNwYWNlDQo+IHRo
cm91Z2ggdGhlIHN5c2ZzIHVubG9jayBvcGVyYXRpb24uDQo+IA0KPiBLZWVwaW5nIHRoZSBndWVz
dCBydW5uaW5nIGlzIHRoZXJlZm9yZSB1c2VmdWwgaW4gdGhlc2UgY2FzZXMsIGV2ZW4NCj4gaWYg
dGhlIGFmZmVjdGVkIGRldmljZSBpcyBubyBsb25nZXIgdXNhYmxlLg0KPiANCj4gSWYgYSBob3N0
LXNpZGUgZmFpbHVyZSBjYW5ub3QgYmUgcmVwb3J0ZWQgdG8gdGhlIGd1ZXN0IGFuZCBtYWtlcw0K
PiBjb250aW51ZWQgZXhlY3V0aW9uIHVuc2FmZSwgZS5nLiwgZGV2aWNlIEFFUiBlcnJvciwgdGhl
IGhvc3QgY291bGQNCj4gdGVybWluYXRlIHRoZSBndWVzdC4NCg0KDQo=
