Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795549310;
	b=uNQbCchhsZb1QsDd4daEvTCSqO9PV3Dr1So7C5Yy44DzEEt+wCE47g124DuFQnABqECA
	 DByiQgB/wQ+K3cIRk6+5ucY5ng10QCP13YwEs8JoxHiNn/g+QvaVkOx1AbyXiYFITkSAb
	 jF8QEKj+gNGo7aQLfB/0DSW2etjINMS4OB3M2lzkoEQBJUBi1AB3xp+x7y3JU431Hhitp
	 BXNxCGhSmEeTqzOEOvgohF3C5RkvHLtg3Y8h7EiRGb0KMStk0RrZxz5ITFnGAnRdfAumi
	 NpmWUxitLlUrgJe4mfYi614mKli0gg1EFJ2wWGJpU3WadlYH3S5X9hZ7YtmCIXrrEnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549310;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=hDDgTqRpvAcl+vEPqBKxKvV/Yoj9CLOzCtBq2P8Hf40=;
	b=3qkf7OP3tYDlNZYfSKY23CQVYJNUVaMCrFugu4YYrg+/8Bz+lFowqpEEDyoqdP7XFusG
	 XQAheSOQDm+pq5XewVp1jqZn7+ww4wL2sxFW+15LPMxwV3dWV0h3y45VOY8BcgGU2QVzE
	 AHRf8DAXjGU4IaGe4UvgYc6nhz3jd5UtDUelPokbSz9bfjVLLeHn5poz8FUc2XGNndueq
	 yerclCXGjHZ9QoB0Jrd8+Q4/4/HgDeMYFVcdJGq0y2a9Nfx5fYAceS0Pwwyyvx65ydESi
	 SBHsJaITCOvtDFtSYvFSDVE0av3HqTerE5U3mH7WVx4J4ccnZy7F6R3L36X62uRUC2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S07WViTb;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jf7LcaHF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367F606A321
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4367F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S07WViTb;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=jf7LcaHF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795549309; x=1827085309;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hDDgTqRpvAcl+vEPqBKxKvV/Yoj9CLOzCtBq2P8Hf40=;
  b=S07WViTbKT42W24Mx4/EQJegX6CyuFgguRGrC3TonRxGdnf7df5qJrqn
   ebtc29xIuEJzt8vctpEGor8kW/opZmISvVT3NvwKojdxXLpmuws81OIlM
   VESMXzaFSM+pJzFcZKPfwuWgSbG2qNBNV9QNqo8ysrMu5Kf0k+Tg2KUuW
   AvJ7Vj9pJLdztlhGweS+P2GzXn9l8CuHRe6MnIO3R9qNymuMadTNghbRq
   V3FuhWsp8CZV7+pHbWCDLKX71hBVEHMj+q/oOc6GKHiWRRK1C5MLzndm4
   p3sya2BclDApufemfVK557/JsKJJ8rGo2JPQurg561MoOHnrVlD5ZYRow
   w==;
X-CSE-ConnectionGUID: Jdir9NQVR6m6d4K75gDlxQ==
X-CSE-MsgGUID: 3tERShglSCSNsD8OIAHMwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4326073"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4326073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 11:41:48 -0800
X-CSE-ConnectionGUID: 2PfyM8FwR9KaIrrlH4mw2Q==
X-CSE-MsgGUID: YZ5q3+10Tki4gHfEdJJ4fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11661356"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 11:41:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:41:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 11:41:47 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 11:41:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1i3krsUmYoftzQ2HTb0wJ9pnBJf0pJneu6lp9c8he2yTBripkQQEpeqCtyHH5rOHYbJf8GcWIX6Yw82zJ1pzogTl75v9gR6UUT0eRFv6tvUOVOrCXNZVWOFAGOHICYlz+qI82rat4Gug97vqZdw/3DV9kScX9X3FI/gU2b4auyZP8xphmBJYJzlYUITeXyjLL5+J5hoBv3hnpl33yT0nJ0Skl6wc5ebdu8ZC76oqIKfA1HpHIyVFFikeJqdMM4t25xZMC2Kh2UnAvu2tIilPi110ppHgjv8pE5A3H0sA4QbNtg+baneWUE7d1T2nKroU5wCw+V9s4tjJZPp7iztRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDDgTqRpvAcl+vEPqBKxKvV/Yoj9CLOzCtBq2P8Hf40=;
 b=F8W0FsW9XaMlVMyMUu37W8MxA+5ZjQR9QaSk1QAw0pDgC72KMeF4+cWQcjxlumZl9ks/b9liammc+n8YErl1J784CXOB194k9WK7ub3LxMlR9zvbMNho/uYi+5XEk2MtGWD/aFc421AIH8XhDWBm7oIyB7EXKC+ctokBh2ejz9nQaUj3LrCIcP68nrHZINvuIOgSbm5o0Fk8FrBXJjcQGq95tuFDQwiKHQLHEdPfpzrGSdTSRD4991UxqNkYwhgECMQ2Q/UB8tM9V8AeH+tGFcq90UYsfjyP7LWwteGL4DQx/TnIT2detDMYVp87gjAbBg7kPoH+rmXRksZYtbZlaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDDgTqRpvAcl+vEPqBKxKvV/Yoj9CLOzCtBq2P8Hf40=;
 b=jf7LcaHFco5TUZWv3H8u/4SBj9n/sME+eXfULn6/IyssCXeH5BecqhS5LjK53s1/K9dR+e2z0WGcmoxoC1oAMqz2B3D3P+1898qox5qV/LSl46O9nZ4+P7TPfLfrG1VZpvFYYsDYqQNfynBl/vvCBIAUs5tGXiednEwUM2WNglc=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by PH7PR11MB7028.namprd11.prod.outlook.com
 (2603:10b6:510:20b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 19:41:42 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 19:41:42 +0000
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
Subject: Re: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Topic: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Index: AQHdS9qwc0OagGwQfkqUpDLO231Klbc9GswAgADlJoA=
Date: Tue, 24 Nov 2026 19:41:42 +0000
Message-ID: <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
In-Reply-To: <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|PH7PR11MB7028:EE_
x-ms-office365-filtering-correlation-id: bddac073-ab82-4d38-2d08-08df4a62f73c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|38070700021|11063799006|56012099006|10067099003|4143699003|261022075727099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: YVZQsP9RjIQ7FSYGOH75iqRIP4Cr6bk+oPHeGvM8cFKbD9hZUcURv95f+Faay+jsf9ndf+7M7gY1tbs1oWGrVgF6t821DX1IR2rWzrWslAcRSWQo1OyuoHAd1Uxtkua9VN2l7hUGgrE3WSIVhXdJFAh/ezPYtXHXQNvtNoSXrkENLZSnKdNcjyg5gcL0c1HP9XQjzPwM9M6FKVMgN0hFJaqjnYa2r7p425ogcA8xDmvPIoytidfcw2HDkxera4c6cyBYGFA0nNPS3h+TeY437eP7abjLv4W1IyBe42iDiYxHXYqbJqoRKMWc0ZcTZIpvlG18hfRO7OJIYn9mZyFHefU7JA2H9hAZX+dCGlFcZAwvHj30tGZW0kQGEye+gFyDB39iHJ4d98Re5gq1XgSZTAUs/yhSn0RBQ/cm/A9na8SI3vFNt9La7f7mF5raxCYGB6mfZ1GxKMS27oanRzKssjb+6VHIHJAqKuXZDc5nI7bzzCWjfgcwoq29OBVZzb4/+9mkM5O+1aByWlvw8+a72YBXls7lzKKQKv+26Sf7X1M21mg+IrKAACUIUHQLCtyYNT9LPxLZfvhgFC8VTeIroNLtB69X8h+vrqiX8KQ8e/Mdj2a4aCeturj7YIh0OyQbBih30MM85oG/cz0VctKwsMxnfJpe7iUQw5Z3cR6S80nnhyTDA8e29Rz9vw6TwtxsWigKIztBI+jpOyxwrTh3XEeuHbS3If4NPgKQ+z2WbuM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(38070700021)(11063799006)(56012099006)(10067099003)(4143699003)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUgrM1BFWEdQMEZ1YjRSMWpzTnZpeWFDN0g0SGJXK0pXTURIekxLNVd0dzVv?=
 =?utf-8?B?MXVBb29OMlNMdTZKM0lqUGpDbUV6OGhmUHlMR2xHeHlaaDFuZkdVSGZhMjd5?=
 =?utf-8?B?MmZKY3Q3SVQ5OU5IbkN3STc2WGREc2ZWTzJXNVkzSWh0aWsyREtrUi85Y3Zi?=
 =?utf-8?B?WmNlMEc5aE9IODBoejlLaGFWb2N0anFrd1ZpcDRyM2FOMVBMUlJKdmhsWG9J?=
 =?utf-8?B?NjQ3L2laclBLRjQ4LzRub1JVMlVCck9OVzNZRHR5cjR1ZVQxNzgrS29ienQ1?=
 =?utf-8?B?RnNiK1JxN2lLMW5pa2dodkNVMXZFWTZUNHRtdGEwZ3ZvZmduVW1PR05zcnpB?=
 =?utf-8?B?QnlJSmxnZEZ0QnJ2djBhaHZCcXNDS2kyL2U3Y3J2V2hjT3JvTlNhZzUweUdG?=
 =?utf-8?B?cTE3NUd2NlJQQmttR1VhTmNkNWtxMzdsSTlpRHVBNXZqR1BITS9qSlN6Z3ZG?=
 =?utf-8?B?QUY0WllHTzMzb1dkYXVHYUFQZGhXTkJ4WFM0MUhndS9pS3ZuN2NXZ3dJeUJl?=
 =?utf-8?B?TTI2RXVSRFEvbFRvSk54UkJlWGxSVnphbFNJQjUzeVU4V3JMMUlYZEZFNklK?=
 =?utf-8?B?aEw2bzZYS08yZUYweTFMM2pxM3paQ2JZQXV6SEgxWWppVFlYRmV2OU5nbHMw?=
 =?utf-8?B?V0pFNDVpLy84YWdrdElqYUVhclI2VWs0RXhhTmp2c2ZjRk1ER2pFcGNDN0tN?=
 =?utf-8?B?cm5ZVExkRFBRQmsycmtwNGdtMmlqK01LNGN6NFR6Qm9wQnZVMGFad2NmRkNj?=
 =?utf-8?B?Um5kZkE5MTZtOUxheXdadmd3ZG1aSTJDeHZzeUdpbUxzL1FOZkhtU2dzSmJ1?=
 =?utf-8?B?elBicHF2eWpnajNDRGZ0WU56TDZQdnNtYmJrUmNlbWRNYWNsN0JEemE4Z2Z1?=
 =?utf-8?B?aDl3TkRZY0VJNS9PRzhkYjBpQks5RXU1aXllRHpKV3lhTzN0T1VBNkYwaVZV?=
 =?utf-8?B?UjJGYndJVGpieG1uVmo3ekIrd3pLb1Q1V1BmL0VKc2o5UE5GcUZQYVkrZFpM?=
 =?utf-8?B?WGpKNjZyc21qbnBtaS94K29XRUhWOVBMdkM2c2srdVJXY1VzV0RxNHJwZDVL?=
 =?utf-8?B?ZjJEVkRwZWUrK0U3TTgwaDdYQjZBRmxyZ0Q4Z3RSWTNWakhPa3VBcFltTzF3?=
 =?utf-8?B?OHNwNGJmN2hwYjRvRkV6dFdIMytjd252N3FHR04wSFVCSmQ2TGNqNXVEcUY1?=
 =?utf-8?B?eStOMlRzTUZpWDZJWE9lZjFncEJ2dURGU3hyTnNSWTBNbXlHL1lBY1pDajlx?=
 =?utf-8?B?T2s4d3h5VC8zaGE3NVZDbnpTc3RWZ0J4WGc4VlRrUGNKMDVRejVLeW1SaWpJ?=
 =?utf-8?B?YU1pTHVqL0lHRldnMGU1UjJpREM2b0xEaUUvVGVKczRubGhBczM5a2NVZlBv?=
 =?utf-8?B?Mmx6bUpnb0pQSG9vbWZTeW1pTGVRRnFQSjNoMTJ2OUh0RHlBUVJheS9PRkxx?=
 =?utf-8?B?N3NqK245eWlpS1FWVlZTZjBlVEpzeFRhcXF1RC8rWE1MYW5lV2loZk1hbGdt?=
 =?utf-8?B?NEg4U2oyRUNIM0ppY1M4Q2tjV0FTWFY3a2xpcmNlbFlSd3hoeDZkUU1IdzlD?=
 =?utf-8?B?WWVGY3dXQVRIVVRBMURTUmZVZVV6cG95K2p6RGs0TXRaOTBoZlpUT2l5cDBH?=
 =?utf-8?B?bEFtMFk5emFBRjY3eWQzcXdOazVuek85aWlMeitNOWQxdi9zQThYTWg3cDBU?=
 =?utf-8?B?bWEzb0Y3M1Mxb0QzMzBDT2ozNlZWOE9QSjduL2NzY2JtT1JzOFFVUnJuTE1E?=
 =?utf-8?B?VFR2N3cvUUxCY1JKeWx6VFJkcnh0ZXVlVHhpbEtVdENqczlITHNhMTBPWWQ5?=
 =?utf-8?B?UjVEUkt4YkN3TW5UWnNrM1dva3VyK0g1YzB0T0JMZUNDMmo2RzllZTZaT21M?=
 =?utf-8?B?UE1KMk1vcmt4bnhzMXZzeWF1ck16SmFCektkZkNlakFBcFRUMGYxTDFPYlpP?=
 =?utf-8?B?N2FXSXlIVVpiZXJOWU1wamdYOVBxLzRhcEE5S3F6eVlxSnF3bWtCeW0zeXNt?=
 =?utf-8?B?YU1zSG1VcEE1VmpSOHJnakYwOWVJQUY0WmtudVFndU5YLzVTWDJ0ZkJtZEtr?=
 =?utf-8?B?bGxwRVRqcnRiR2sxY2wwRkE1RktjMW10TzVmbkV2elh3ZDRiS1kxdDZJWE9T?=
 =?utf-8?B?TTk2RVJ2ZGVTZmM0Nm9Pb05mb0VFM1c2QVBobVNHR25KVWxqZE5iRm1DVEpS?=
 =?utf-8?B?dHZjMjMvR3k5Y0tJdHVzVVIybHJ3TWowZmRQdGdRZUJLWW4wTjdVSUVLZVJX?=
 =?utf-8?B?cGFSakJ3OHZpbTQ5YUdaZWZrOTBuUzhrakx2aUNHSTNJR3dGRWhBSWZDZCtk?=
 =?utf-8?B?TUp6UzlqZFl5T3BmTnM5azdld3FjTlF1VFFYVEtEWHJRRDQ0V0I5ZWExdkJG?=
 =?utf-8?Q?FNLKHP+HBjb/Ji2w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <393B2956FA679C41948C2B837828A0A3@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: Eo2ssK6puaeTN0SP6NX8td7cc1PTpEMPHNZKFC7kRGjC5gGWCVxbRsnxV6hlCsP7A7+3LnCkJ0o11HF4yk11dHlS19OgLuWswAxUAPuF3dz3XlzN6mbC5vqnm05VvTSOLzn/w4FSJM+kbplT4UbOWt0RCGe/Q3hH+v9fx1Me2YHWyCpd+pJYyCEyEdOoKQ5x6JVMPVbgSXw8FJ2daFqCPPZ6xkWwJmUs5P6bgSXUvVQ74EEpTKrMTxQ5C0BUVADbVO1ESE4zPwDOjifbWTHI8uLsE7g80H3Muc/ZWRZ/sqHtPIU86Npc/CMAsoKiRyQ4wVpPTJLu3U3WdEcjFVB3lw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bddac073-ab82-4d38-2d08-08df4a62f73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 19:41:42.4762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkKnTvAGMUBcTW3+oL2Xae8hpXEZQiBRiOqaulwG6M1mllpBLCGdcUX/9P2CR0Yr2L04FgGUYPGLCy6dGmOkmO4yRsxI5bAPrCRHklu+pCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7028
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTI0IGF0IDE0OjAxICswODAwLCBYaWFveWFvIExpIHdyb3RlOg0KPiAx
LiBUaGUgcmVxdWlyZW1lbnQgb2YgUjgtUjE1IGFyZSByZXNlcnZlZCB0byAwIG9uIFRERy5ETUFS
LkFDQ0VQVC4NCj4gDQo+IMKgwqAgVGhpcyBpcyB0aGUgZmlyc3QgbGVhZiBpbiBURENBTEwvU0VB
TUNBTEwgdGhhdCBleHBsaWNpdGx5IHJlcXVpcmVzIHNvbWUNCj4gwqDCoCB1bnVzZWTCoCByZWdp
c3RlcnMgdG8gYmUgMC4gV2l0aG91dCBqdXN0aWZpY2F0aW9uIG9mIHdoeSBpdCBtdXN0IHRvIGJl
IHN1Y2gsDQo+IMKgwqAgd2UgYXJlIGdvaW5nIHRvIHByb3Bvc2UgdG8gcmVtb3ZlIHRoaXMgcmVx
dWlyZW1lbnQgYW5kIGl0IGhlbHBzIGRyb3AgdGhlDQo+IMKgwqAgUEFUQ0ggMTMuDQoNCkFoLCBv
ayBzbyB0aGUgcHJvYmxlbSBpcyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aG9zZSByZWdpc3RlcnMg
YXJlIHNhdmVkIGluIHRoZQ0Kd3JhcHBlciwgaWYgd2Ugd2lsbCBzZXQgdGhlbSB0byAwIGJlZm9y
ZSBTRUFNQ0FMTC4gU28gdGhlIHNlYW1jYWxsIGNvZGUgZG9lc24ndA0KY2xvYmJlciB0aGUgY2Fs
bGVycyByZWdpc3RlcnMuDQoNCkJ1dCBJIHRlbmQgdG8gdGhpbmsgYW4gQUJJIHJlamVjdGluZyBy
ZXNlcnZlZCBpbnB1dCBpcyBhIGdlbmVyYWwgZ29vZCB0aGluZy4NClNpbmNlIFNFQU1DQUxMcyBh
cmUgbm90IGZhc3QsIEkgd29uZGVyIHdoeSBjYXJlIGFib3V0IG9wdGltaXppbmcgdGhlIHdyYXBw
ZXJzIHRvDQpzYXZlIGFuZCByZXN0b3JlIHRoZSBtaW5pbXVtLiBJZiB3ZSBqdXN0IGFsd2F5cyBz
YXZlZCBhbmQgcmVzdG9yZWQgdGhlIGdlbmVyYWwNCnB1cnBvc2UgcmVnaXN0ZXJzLCB3ZSB3b3Vs
ZG4ndCBuZWVkIHNvIG1hbnkgd3JhcHBlcnMuIEFuZCB0aGVuIHdoZW4gVERYIG1vZHVsZQ0Kd2Fu
dGVkIHRvIGFkZCBuZXcgU0VBTUNBTEwgQUJJIHdlIHdvdWxkbid0IG5lZWQgdG8gZG8gdGhlIHdo
b2xlIHZlcnNpb24NCnNlbGVjdGlvbiB0aGluZy4gSnVzdCBwYXNzIGEgbmV3IGJpdCBvciB3aGF0
ZXZlci4gVGhhdCB3b3VsZCBoYXZlIHNpbXBsaWZpZWQgdGhlDQpUREguU1lTLkNPTkZJRyBjaGFu
Z2VzIGZvciBEUEFNVCBhbmQgYWRkLW9ucy4NCg0KU28gSSdtIHRoaW5raW5nIHRoYXQgb2xkIHNl
YW1jYWxscyB3ZXJlIG1heWJlIGluY29ycmVjdCBhbmQgdGhpcyBuZXcgd2F5IGlzDQpjb3JyZWN0
LiBZZXMgd2Ugd291bGQgbmVlZCBhIG5ldyBwYXRjaCwgYnV0IHdoYXQgaWYgaXQgd2FzIGEgc2lt
cGxpY2F0aW9uIHBhdGNoDQp0aGF0IGdvdCByaWQgb2YgYWxsIHRoZSBzZWFtY2FsbCB2YXJpYW50
cyBhbmQganVzdCBhbHdheXMgc2F2ZWQvcmVzdG9yZWQ/DQpDb25zaWRlciB0aG9zZSBwcmVtYXR1
cmUgb3B0aW1pemF0aW9uLiBBbnkgcHJvYmxlbXM/DQoNCj4gDQo+IDIuIEFkZCAnVERJJyB0byB0
aGUgbmFtZXMgb2YgVERHLkRNQVIuQUNDRVBUIGFuZCBUREcuRE1BUi5SRUxFQVNFIGFuZCBtYXli
ZQ0KPiDCoMKgIHJlbmFtZSAnRE1SQScgdG8gJ0RNQScNCj4gDQo+IMKgwqAgVERHLk1NSU8uQUND
RVBUIGhhcyBhbHJlYWR5IGJlZW4gcmVuYW1lZCB0byBUREcuVERJLk1NSU8uQUNDRVBUIGluIHRo
ZSBsYXRlc3QNCj4gwqDCoCBwdWJsaWMgVERYIENvbm5lY3QgQVBJIHNwZWMsIHRvIGNhbGwgb3V0
IGl0cyBzY29wZSBpcyBUREkuIEl0J3MgYmV0dGVyIHRvDQo+IMKgwqAgYWRkICdUREknIHRvIFRE
Ry5ETVJBLiogYXMgd2VsbCB0byBtYWtlIHRoZW0gY29uc2lzdGVudCBzaW5jZSBUREcuRE1BUi4q
IGFsc28NCj4gwqDCoCBvcGVyYXRlIG9uIFRESSBzY29wZS4NCj4gDQo+IMKgwqAgQmVzaWRlcywg
RE1BUiBtZWFucyAiRE1BIFJlbWFwcGluZyIsIHdoaWNoIGlzIGFuIElPTU1VIGNhcGFiaWxpdHku
IFdpdGhvdXQgYQ0KPiDCoMKgIHZpcnR1YWwgSU9NTVUgZm9yIGd1ZXN0LCB0aGUgZ3Vlc3Qgc2hv
dWxkIGp1c3QgY2FyZSBhYm91dCB0aGUgRE1BIGNhcGFiaWxpdHkuDQo+IMKgwqAgU28gaXQgbG9v
a3MgRE1BIGlzIG1vcmUgYWNjdXJhdGUgdGhhbiBETUFSLg0KDQpPay4NCg0KPiANCj4gMy4gVERH
LlRESS5NTUlPLkFDQ0VQVCByZXF1aXJlcyBUREkgdG8gYmUgaW4gdGhlIEFTU0lHTkVEL0FDQ0VQ
VEVEL1JVTiBzdGF0ZS4NCj4gwqDCoCBBZnRlciBUREkgaXMgYm91bmQgYnkgaG9zdCB2aWEgVERI
LlRESS5CSU5ELCB0aGUgc3RhdGUgaXMgQk9VTkQuIEl0IHJlcXVpcmVzDQo+IMKgwqAgZ3Vlc3Qg
dG8gY2FsbCBUREcuVERJLlJEIHJlYWQgdGhlIFRESV9HRVRfQklORF9TRVNTSU9OX0lELCB3aGlj
aCBjaGFuZ2VzIFRESQ0KPiDCoMKgIGZyb20gQk9VTkQgc3RhdGUgdG8gQVNTSUdORUQuDQo+IA0K
PiDCoMKgIFRoaXMgaXMgYSBoYXJkIGRlcGVuZGVuY3kgZm9yIFRERy5UREkuTU1JTy5BQ0NFUFQg
bm90IHRvIGZhaWwgYW5kIGl0J3Mgbm90DQo+IMKgwqAgbWVudGlvbmVkIGluIHBhdGNoIDEyIHdo
ZXJlIHRoZSBjYWxsIHRvIHJlYWQgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQgaXMNCj4gwqDCoCBh
ZGRlZC4NCj4gDQo+IMKgwqAgVGhlIFNFU1NJT05fSUQgaXMgdXNlZCB0byBlbnN1cmUgdGhlIGhv
c3QgZG9lc24ndCBiaW5kIGEgbmV3IFRESSBhZnRlcg0KPiDCoMKgIGd1ZXN0IGF0dGVzdHMgdGhl
IFRESSB3aXRob3V0IGd1ZXN0J3MgYXdhcmVuZXNzIGJlY2F1c2UgdGhlIFNFU1NJT05fSUQgaXMN
Cj4gwqDCoCB2ZXJpZmllZCBpbiB0aGUgZm9sbG93aW5nIFRERy5UREkuU1RBUlQuIEFuZCBtYWtp
bmcgdGhlIHJlYWQgb2YNCj4gwqDCoCBURElfR0VUX0JJTkRfU0VTU0lPTl9JRCB0byBjaGFuZ2Ug
dGhlIHN0YXRlIG1hY2hpbmUgb2YgVERJIGZyb20gQk9VTkQgdG8NCj4gwqDCoCBBU1NJR05FRCwg
bWFrZSBpdCBtYW5kYXRvcnkgZm9yIHRoZSBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IMKgwqAgQnV0
IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBhc3NpZ24gYWRkaXRpb25hbCBzZW1hbnRpYyB0byBh
IG1ldGFkYXRhIHJlYWRpbmcNCj4gwqDCoCBiZWhhdmlvciBpbiBhIHNwZWNpZmljIHBoYXNlLiBJ
bnN0ZWFkLCB3ZSB3YW50IHRvIHByb3Bvc2UgaW50cm9kdWNpbmcgYSBuZXcNCj4gwqDCoCBkZWRp
Y2F0ZWQgVERHIGNhbGwsIGUuZy4sIFRERy5UREkuTE9DSywgd2hpY2ggbmVlZHMgdG8gYmUgY2Fs
bGVkIGJ5IHRoZSBndWVzdA0KPiDCoMKgIHRvIGxvY2sgdGhlIFRESSBhZnRlciBpdCdzIGJvdW5k
IGJ5IHRoZSBob3N0LCBhbmQgaXQgcmV0dXJucw0KPiDCoMKgIFRESV9HRVRfQklORF9TRVNTSU9O
X0lEIG9uIHN1Y2Nlc3MuDQoNClllcC4NCg0KPiANCj4gNC4gVERYX1BBR0VfQUxSRUFEWV9BQ0NF
UFRFRCBpcyBsaXN0ZWQgYXMgdGhlIHBvc3NpYmxlIHJldHVybiBjb2RlIGZvcg0KPiDCoMKgIFRE
Ry5UREkuTU1JTy5BQ0NFUFQgd2hpbGUgdGhlIGRlc2NyaXB0aW9uIG9mIFRERy5UREkuTU1JTy5B
Q0NFUFQgcmVhZHM6DQo+IA0KPiDCoMKgwqDCoCBJZiB0aGUgcGFnZSBpcyBhbHJlYWR5IE1NSU9f
TUFQUEVELCBza2lwIHRoZSBwYWdlLg0KPiANCj4gwqDCoCBUaGV5IGNvbmZsaWN0IHdpdGggZWFj
aCBvdGhlciBhbmQgbGVhZCB0byBjb25mdXNpb24uDQoNCkknZCB0aGluayBpZiB0aGUgcGFnZSBz
aXplIGlzIGluY29ycmVjdCBpdCBzaG91bGQgcmV0dXJuDQpURFhfTU1JT19BQ0NFUFRfU0laRV9N
SVNNQVRDSC4gSWYgaXQgaXMgYWxyZWFkeSBhY2NlcHRlZCBpdCBzaG91bGQgcmV0dXJuDQpURFhf
UEFHRV9BTFJFQURZX0FDQ0VQVEVELiBJbiB0aGUgY2FzZSBvZiBtaXNtYXRjaGVkIHNpemUgYnV0
IGFscmVhZHkgYWNjZXB0ZWQNCnBhZ2UsIGlkZWFsbHkgaXQgd291bGQgcmV0dXJuIFREWF9QQUdF
X0FMUkVBRFlfQUNDRVBURUQsIGJ1dCBpdCB3b3VsZCBiZSBvayBpZg0KaXQgcmV0dXJucyBURFhf
TU1JT19BQ0NFUFRfU0laRV9NSVNNQVRDSC4NCg0K
