Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794356407;
	b=BrqOudDjzS+Ra8/UGq8Hwx3dJtZbW7MC8nsiAWosTaBbnXAIMbtCbYoIK63XHEfzE7hj
	 HXNKsvC69yoEjHcnNj4k7ZM1bZsCTGDTF2PtrDeTrr2DHBhTn59CSCLB3Wnt7Dv7LRmLA
	 aCKjqt74OqA2U9gOg3ob5Tu+7FTLURLIfZhfe74sgRRR2FqW+hme88dTlX3js8a0FX5HJ
	 UMHsVctrSJwAZF/6jnh2nzwkiivH34H0ZR45X5WPFoSRx1Zu6VxbHZ5D++tRWAzXQiLf1
	 5xEciwz5jKm8fmGUrnKDOfETyYWaLDfy2HThnw6vIA1UqN6233yasJ/j61kx9OVXJPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356407;
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
	bh=gxHskiZejP1gomOCD6TDVDKiyV2FZEIMrZWwTZaFvng=;
	b=Yyizxn5KbfcNEEu+c0mNc28/M5a7Kw8Z2usyrGe7Ik18YU/V8AvBlj6ZGvNpErkxFNtq
	 xnGgZR9KiBCoo+XBpquEVk1c1ONynhRN13n6/iDVQffKswhWGmjVCr0TeHDhaDA17r3sK
	 LUY1i4IbKn0G2DiKJ7yIuZ4RFyJ/1Cs+Iarf07Pu+kuvUK4QQw9LMuR+ui+xVa4U1/unz
	 2r2WsHk81z0LeEWFloffK8Dhl8F0MnYqRZIHnM7+lNd8BlfySf8Gzua0g4Yp2A/ZYp2jO
	 rqERSUdVc9bv05RUsM8RzmbKLoJ9POhLUi8hKybJ5oU3zuYfAZWXkxMTkS24bkP4edA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="HBb/2Dyf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7A5606A336
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 00:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7A5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HBb/2Dyf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794356405; x=1825892405;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gxHskiZejP1gomOCD6TDVDKiyV2FZEIMrZWwTZaFvng=;
  b=HBb/2DyfutnMTTllkHz4YBICBcDFWYTodz0eDKWHvSef+QK+G8FgYl4s
   eCDX2IdJqMyL60Vofagnl18YIZ05BEQu0VHhB393nmULNAeLE4kuXuTN6
   94ZDiZNSxHVkeHz/kydZVVmwEaB0UI05ZkGfZHSV6e4a+Dhuk/raJTZpz
   1tu9K4PMG8b9PkqNXmrDKuH8kp2gdMh15k9zf2CMsP6DZYexlqBaoWjxZ
   lqVT9sW5mh5hSpx8wtC7RhpBiUVOBSmGL1TnBSKJQQoWmCefgkiAND9a5
   Ivxa7xm2iTBsF79Iu84DeTM/CMb9bNUwnKd0bowfsOcuzNtZBaCTPOzzs
   Q==;
X-CSE-ConnectionGUID: sXI52IYXSs+4zPPAxc+62g==
X-CSE-MsgGUID: ZCZ4Xet7TNiJgJTo7rF+Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3142028"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3142028"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 16:20:04 -0800
X-CSE-ConnectionGUID: SQTq4OodQIa2CkoPelv8ww==
X-CSE-MsgGUID: SKgp5jdnRf2qATvb1uWRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8111421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 16:20:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 16:20:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 16:20:03 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 16:20:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYJYVBLKIreqiZsS/yRRjP4j0MTTJNgLr9qDD49cX4C19iTuXsAOYbWQvmCwVbMYxe9oJ14WM04ksc0sy70KrJsTLIVjvpsxSTX/PEvRMDNAZA5WW+j+h+nrkBcRNT/r8drGcAikxI51xlQrrFTra5DAg0v8zCt5pJfjijK1HRpJuvWsKfymNOgHtrBUTKlBZSqhtAynXwHRSdffOdYtq220kgB9G96unNedOJkFv5Ul0E4HB8SaMhw9JKSDSCortPY9UebCwoCyAWWSiqks2AukucB1mRm0Ks0RS+r7m/1LfMCknnYW5NuTYLwbsNrMlyv3T/M77+OmEMAOwtVluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxHskiZejP1gomOCD6TDVDKiyV2FZEIMrZWwTZaFvng=;
 b=k0jf3e+sXwnOMr3FI7nviH/Wc5isWdD9urUAn6jg72FZVTAYggy4xvQcnckyQ+oC91uJazkVBxpCO4EsbUov46/+pY0UXjHfMauYBhIpNUM9nHFfwRdwVdsFU6yNNB4s3Jr9f5OKslzervMujfMYsBWqSqgyQ2MCiP648mpz+piezKXmXstlPJ4cV8L64gV/iKLcji5+ms9s3fDZlUuYLUWknkkbpZxkLvfHFwjdONPv2a5hJZaukrZtAK1v3b5idhDapnYfzfTz9M0yEVseO1Dp8IYHTyHXgyPrKswX1S+goM3BhKjYAtv1a55d51SwmIA8jDZS9YTwX1cHeHOazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by PH7PR11MB6932.namprd11.prod.outlook.com
 (2603:10b6:510:207::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 00:19:59 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 00:19:59 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "jgg@nvidia.com" <jgg@nvidia.com>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>, "nik.borisov@suse.com"
	<nik.borisov@suse.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>, "Peng, Chao P"
	<chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org"
	<tglx@kernel.org>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>, "Gao,
 Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCACkAugIAAmzsAgAARWICAACktgIAAHwIAgAABFoA=
Date: Wed, 11 Nov 2026 00:19:59 +0000
Message-ID: <8439f02cb6bbd559d04660acd11c6c9c74e9cea9.camel@intel.com>
References: <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
	 <20261110195745.GG738765@nvidia.com>
	 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
	 <20261111001606.GH738765@nvidia.com>
In-Reply-To: <20261111001606.GH738765@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: cadaf1ac-ae22-408a-7f40-08df3f8985d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: qZtfUgNtu5BCvQcptGEl2jHkxXXHH12TOhxSj1IZtD1yvPxEGTZo5rNdLinEkil8Eaa4CN2lwJn0qjdH/7AOmPLpnGedMAfKlxTnZeKx/wS6z+MZPgZkX/HhTq05IhvId3xNxRoplWEOS5A28ujIvx72UNvMuO25TFHpns5dMZ5anePf9qHTyQJ3Q3aSaCE69xJ/88laQVZqENwDnAshx4bA9NFFT88CtNkH/DNGDbZo7IP1IyCOudxDX0jc8TKQgDKODo+xqbBw7XjEfD/KJe2IS0/uWeNDEyYKkutFUbIec+KYA9Tgk25Nc4Rez7vhKkC9gdIDB9IuioKG8EjbBZPQddM2Cc7gPY2PRRLOygXw5dUq1FB3MIhRfCCItm9QCYGP2/OgWIoY5D2lE7Tu5dVur1BlOHy2cz/60LlFaUXw0wrSQdTZgKlbNAWMR/KmomFtu91rpQVwT3ve207MMJh3ylAtXIlkc8Vz8aa678AAYC9iMb8QRJrr1n56X7FepJDQzaoKQZIAFI0ywXNlQ36qBY7PyJ6+oO9iL0qR6FOJ7DuMKwWkWFyc8Ag81TVc8VOO+SYnFHj+WqKM4WSrMxQ0z87BB2HOJQCS5FoMc0cHcxfsHm8poLvXCEGYDnYAhDWFttj7NeGL6R0uL18WAy1lx1j3WfwNzn1VMpyqmQ3e37PmZH1iCvzWUkKYWN2ywd6dYTQnXDX9nMB/NVMxI46g2Rt2BGJzlsrfD/wVWug=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?am12MFdnZm5iYWdGS3dxZE5oVE1pQ01wUEY0WjJUcitVbDN2RUpnelNxMFpl?=
 =?utf-8?B?UWRzd2VKT1VsUTF0R3UrYU9rbFhscGdRNE5OVWhnRlFXRnZUQ3BvSEtST2g5?=
 =?utf-8?B?YTdkZ29pZlJGREk5WWtBM3NvV0ViME54eXI3YkdjOWZVMHdUM0pTWWJRYlV5?=
 =?utf-8?B?Y1Uwc1BaZXNjc05VS3Iyd05lL05Bbm5SQlZ3d3VOajIzUkpZaWtwak91b3ZK?=
 =?utf-8?B?aXRVZnFyT1pLSWxTQjEzaU52aXByZnByZUFZL0tiY2pzZXZSQzc4ZmdIWUUz?=
 =?utf-8?B?YWRyaXFWdnkvQ2xCZiszRll2VldUUUZRYmJIaFZUcWYzc0xiaTVaQmxDMGF4?=
 =?utf-8?B?cHVnRHNLV1FHQkhtbVNhbEF1a1VQTDdxOXJTRGtXWS8yTnN2dVhDOWxNdVRk?=
 =?utf-8?B?WDBGTVQxWFU4ejNxWG8rMktCYmxrQlFHWVRDbjVuWnRUSGE5cXFQWWNKcUZm?=
 =?utf-8?B?d0ZaSWh5aDBFQ0JoeVZoVWkyV01pcXVvai9VSDQrUkdwSlF1Ni9Hbkx6Rk50?=
 =?utf-8?B?YS9sUWJwOGxFRVhXTzVrdURkYTcvdzZVbXVJd2R0N1d5dERMQWFjWTdhbTlN?=
 =?utf-8?B?c1BZTFoyTCtpVzJKTmJZdFNoOVp0Z1VvY3RaU09xVDFoOC94STd4SHloODVB?=
 =?utf-8?B?My8zV2puMTRHVlhLSXZnOTJvS1phSlRJNTlYSEwzL0JYM0poYTRXaVcwZnFM?=
 =?utf-8?B?V3RWMUhZN0lrSE1TZ1Z0a1VIVU1DUHpHQ3NNUlNZcE1YZ1l0Ry9QeFVXMDBW?=
 =?utf-8?B?TzF1OUh4N2F1Qyt5UUNISCtSWDZqMmlwdmJUK0I4SkJWSHFZTTZkSjNGQlF1?=
 =?utf-8?B?b2VPaGlET2J3K284aG9Bb2lGMTdFeUZEZmpjRnFvZVJ5dHZpYklML0RSMVl5?=
 =?utf-8?B?VjYvY0dTNVNrMXdlMi9vRHp6Qjh2SXpiUmhjRGZDbk9XWWFTUmZMSTFGNXhK?=
 =?utf-8?B?aTFQVzJwNGZyeTduemtEbE8wcWEzKzFHT0pTRGZUcTVFVFoxMDZYaFdXRDlR?=
 =?utf-8?B?cWNMOHBsVldibGl5aTJ6QWVuUUVHb0VWWDJzcXJHSHhlZTRXMW4xNmZIMVZM?=
 =?utf-8?B?Kzd6M2hOc0lZR1NsVXZWUStMVktIM0pMVnlOTFYvNyt2SHE1cldJL1dXVDJr?=
 =?utf-8?B?ejdjdlhJL0pmSi9lOXFCSkdIbkNkc3FQem1maFJrM1RFdU1zZll3MVp3eVZ0?=
 =?utf-8?B?dDdldGhlUVBBMmZhSGFlQ1RUM0RhcjBMcmRtaXdGTng4QytGMWk3UzYzbWFj?=
 =?utf-8?B?cmw5N2JYR3g3UnJPbldtc0lyTzZHTU1LaHhvbk9wTGtRTUdSUUNmbFZISnhw?=
 =?utf-8?B?K0dlc1FOUm8zZ2cvOCtEQ2JsdW42ZTJLV2hpL1lSTkRGVzdENDM4YWR4aGU1?=
 =?utf-8?B?KzgzUFY3dUJxdlhBaUlkZEhiN2hvQXNtYk9mMy8zeHNNNkYvdjBmV2txWi9R?=
 =?utf-8?B?Y0gwR3psWWpscnYyWmZpdmdkNFhtOWw1TEZnekMyOEZwaDdGVkdob1d6bkRG?=
 =?utf-8?B?UG9LbVVBK3EzeG5jNjdibE1RbUFoUkFSTWxpeEdCREdhUHJjSmtSVDFRN0Y5?=
 =?utf-8?B?M2FSaVc4czU1Mm03Sko2UUVVbzJ3c1Zqb1Z1NXg3ZENXeUhUNXhnZE5kTmJB?=
 =?utf-8?B?QUZ5dHJ5WWVUQzVVbzgyK2VHaS94WGZzeGxMbFpJSzB3SFIrWlB4Z1FrM2Jn?=
 =?utf-8?B?eVIvWS9BNDFiaG1OLzF0cmxscmVLWmZQTG1LSU16aGVBMnV4Njcrb0tUMm1C?=
 =?utf-8?B?aDZHVmFYODVkcEdhMzUyRzBLYU5KVk5nQ09Td09CMFZra016ZWJ5bjJBcHlT?=
 =?utf-8?B?aWZvaVBKOFNCWWd6ZXE4RHdBNE4zMG9id0cwVWxjcWVKbDI5eTNXQVM1eFc5?=
 =?utf-8?B?VDYrRnhMWHdWQ1V1WGFSckU2eWh4SStGdFd1cVNHaGhXb0hsV0pWWldsendm?=
 =?utf-8?B?Znp5d3JQdmpOVzE2dlYySmgzbWJvaFhBUFZsRURLSEQ0dTdtYXNuRGpERW1C?=
 =?utf-8?B?SExoVURraHZ6Q2UxV3d0T0RWU0QvZUttV2RjTTRZR2F3L3JPdFFQc0d3SDhz?=
 =?utf-8?B?RG9NOWF1WklIQitlcEpwdGx3d21Fb2pOWmY5em1QTEJhM3dpSUlWKzc1WVVu?=
 =?utf-8?B?UGhrM2xRaXZPQlBLRXFSeVluN1pkYzBUWU1NTWRGTHludEQzbzZxVHc0YVJB?=
 =?utf-8?B?cm1xNEYxNTdMZlhBTmpiVjdZY2pTWko1WkVDNzE1RGZyNmpDNy8zd3FTRU51?=
 =?utf-8?B?KzZ1dUZtUUNXdXoybUFNTWRpalkxQ283S2dGUDQ0OCttS0hPbXlSNWx5Z25X?=
 =?utf-8?B?ZWh6c2RzNmZGOVdLNmIrS2NDSEVYMlRpbmFhSzFuK0lSUWNZOEJCZUQvbk9Z?=
 =?utf-8?Q?l1OJ4zFkJB+U6gXc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7447C2105C7E90498FB573DA7E61DCB0@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: zuTLMbBwkQlJGG/5Edu68EzvUHlqTZi2fhKqzp+Lv+fUJr8109sHglcSsRqVnBFKzk//QwwnH6MPMf/tQ0viOYcGscmfQi/MscQU5C5YgzUx8N2XNt/NiWJXbvDKyJsYUgKBEy6D+PrmIgPxq168MD7dVJyqeFaOJl4zq1HKPSCPgG7AAMkk/WAN7H73AJRSvCuvtlfPPZZKi5RVxlSvSWanYSuL7rsuVHyMKFwTvjQr0HqzW/gx189zxii9ITVf2RAZjnJx49PefYO6d1lkWaPCCipEBf6wTuNJQsJvF0kSv7oF9w8N2X+lGulQxmLauuehfz6r18jLmyP1z82/hQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadaf1ac-ae22-408a-7f40-08df3f8985d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 00:19:59.7555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V8TDEOyYsOBjV3K1VZZKVVP6FWuO9GEZ4smUauvj1lBPtQ3wF1Ihg7LdFZRr22OiLSQHDYqU8qCvQFcwBpAA3hdps6a3ahl1tjt1ZkbMn1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTEwIGF0IDIwOjE2IC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gWmhlbnpob25nIGhhZCBwcmV2aW91c2x5IHN1Z2dlc3RlZCBhIGJvb2wgdG8gc2V0IGEg
ZGV2aWNlIGFzIGJ1Z2dlZCBmb3IgdGhlDQo+ID4gcHVycG9zZSBvZiB0cnlpbmcgdG8gY29udGlu
dWUgZ3Vlc3QgZXhlY3V0aW9uIGFzIHdlbGwgYXMgcG9zc2libGUgaW4gdGhlDQo+ID4gZmFjZSBv
Zg0KPiA+IGhvc3QgaXNzdWVzLg0KPiANCj4gSXQgZG9lcyBub3Qgc2VlbSBuZWNlc3NhcnkgdG8g
bWUsIHVzZXJzcGFjZSBpcyByZXNwb25zaWJsZS4gU2luY2Ugbm8NCj4gZGV2aWNlIGV2aWRlbmNl
IGNvdWxkIHBvc3NpYmx5IGhhdmUgYmVlbiBsb2dnZWQgdGhlIFZNIHdvdWxkIGZhaWwNCj4gYXR0
ZXN0YXRpb24gYW55aG93Lg0KDQpPaywgYXMgbG9uZyBhcyB3ZSBzdGFydCB3aXRoIHNvbWV0aGlu
ZyBzaW1wbGUsIEkgY2FuIGdvIGFsb25nLiBJbnRlcm5hbCBoYW5kbGluZw0KZm9yIHJhcmUgZXJy
b3JzIHNob3VsZCBwcm9iYWJseSBiZSBzYWZlIHRvIGFkZCBsYXRlci4NCg==
