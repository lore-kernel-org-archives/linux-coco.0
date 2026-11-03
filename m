Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793685755;
	b=PhLiALqNvt50Kyb/PEoyRvVDUjUGDeS5iqzSMzgoD9zPZ5i5NH3vkPTWgKUh7hs8MClP
	 P7dWjrchBEmYulTW4Sxtj5SEo4WP1qaL7SlZxzB/RZNPzdH7H2FpOuzPiIBPoM3pmUaLC
	 5rpZKPORLy1f0WX+bIMSPhfE7Upbqr9byNxYW03BNTD7DTHTecs8eUdcePBwflg/MrMNJ
	 eQzrOYQDGzmI19Io3vI0mmkNRdD9176kTSR8foqhprNaQ2BBUXpqYT989HYwNJVShkUJv
	 etR8u9YZYBlSwwrBh427rjo9nHwtcToxktJ9EACcx78iPnypstPCr131rE0CqNxyI4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=LJofvdbjlBt1UdhDWyn2tgMVl7AlZ3kLegN8/PjPdTg=;
	b=vAgUSa1yG2B1/SZzdlKhBj3fnCYOVhs0T4rp9PK7TwAM+XsKefbs30Ahk2DQUlRL5Srw
	 qUZEr43yeaawWFQTe24rbqHE+DKL2uNuj0K8He2ZHld77MAO2GFG66q5jhgbkfPPGSKES
	 Z6GiCWZnh8ZrbBiHsY2VZ/miG/v9nsYLJPJdTWKeiLtCBRpRcshSHt47mPzZMYWzeUUWF
	 JDZiDvIm9ytb0fta9PxFPnnAH9CsR/zQIocjKG863qzYA2kvrQoEFLZVdRLk+VihiJZJo
	 MkjrxT2YIrQHi0f7SvJxcXZdwhvsBew+XdugoALOcPGi6r3hh0eXba4Mq7gyMuq/jgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsv836Xv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A52606A329
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 06:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A52606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bsv836Xv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793685754; x=1825221754;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LJofvdbjlBt1UdhDWyn2tgMVl7AlZ3kLegN8/PjPdTg=;
  b=bsv836XvK3cQeh++bmKc8iiVZlO5QOJq37Gw8LTIOpei7d09kCAoDtAr
   HKY8u2Th1wIWhnXATrkhXnH6N6dLoGwXG37YM7WRVNTBL/b3iSvu3mUxj
   uZIe37qZUGqmVP+qJ1cZAxfgsDiFneIwJ7yZjGsexEG3y10HINvszEFGr
   Ctck2xYaEY5dLYgM/WgnZxFHlM6DaASDfef/mXxxkqnnmOBJV9woiMYYk
   NSnxEJFQk1AKfqZEF3Cjne3Y6LSjTWNeOWnotAs/g00QN7uobxbI5LV9P
   7aZ80CSHXAesh0ILhKEf2T8dJgaP3FjlMbSveNb/Z2TqFDcHmP0jlM8Yx
   A==;
X-CSE-ConnectionGUID: Iff6gfTrQ4WcEPoSlXfBow==
X-CSE-MsgGUID: /JV96PVZSu+jISakZi04Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391200"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:02:33 -0800
X-CSE-ConnectionGUID: Kz4r5EHEQ56zzhDvybZEtg==
X-CSE-MsgGUID: XCHyjgxAQ3Ghc19SMSL/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6710447"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 22:02:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:02:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 22:02:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 22:02:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6UOoKf9Rf47D4tVqSwNjb14ln0APUJzAeW8K7p6h32Ox1R7+J00GHy9u11FTV0aBuWOazT01XXVdbtjQioJu/ecRggN2zg8GhtIDGy2x6Fn3u9SZNJbcPgVZPT0EJvZ2QIVTkpFh7DPsOnmtfcRd/E2Y3nxcpSCyBqpVKNQdWNbtueY7RCV7e0hS8Rr4XO+jvaKZFiuOzE6TjXN9wZKN4g8TQgXbfanHKEE3ag/u2EHy3hF4zUcsza4ftI/VdPaH05lQW35SGxj5RyYtyVaIRjNogPZdmtY7PSEj3hVuBbZS7D8IM7zXiUejnEtQRVxIBMI8vOcaK3I8WgoFTnfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJofvdbjlBt1UdhDWyn2tgMVl7AlZ3kLegN8/PjPdTg=;
 b=yBlcvJYgRvazpkmxgHZ5mwMy2buEycNuOj+SMbjPFw+V8CEwtwo2GMDBwBRO2fACCHrygpN8HLZ5eICY4ArqLWyfeja9A9n/blg8XUYSVuEtn1mgIYeawS4sBr3JtZ6Nv3uT4ZU0L4OW70QvGYocegP2QwZLt20drxyN9GYlOdOnQiJxcbrnoHTxptBX1wzQg3/pWVg2CklLpxiMv+pxSsAMLtzbHPE2cOo0NZRrbeSFMkSOBI8aX/HyrTbVMLsZYm4sYKLL0tvnfiHqm6S2OM3czuSZ8yfmNeRXOrzCsM6lKEHTC+qUgwCJ4oT9UxTdM+undk8i104+w7LTkBy8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by MW4PR11MB6619.namprd11.prod.outlook.com (2603:10b6:303:1eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:02:28 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:02:28 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcPTnYAgAIN30CACiqeAIAAjR3Q
Date: Tue, 3 Nov 2026 06:02:28 +0000
Message-ID: <IA3PR11MB913612D6E3CA56C4D898956A92692@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <78f8a175-40ce-43c9-b542-45bddb443fd7@intel.com>
	 <IA3PR11MB91367938F3B6501ADF619C0C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <fbe2ac5f7006c09ae0ca351092087f0cc7bb65b0.camel@intel.com>
In-Reply-To: <fbe2ac5f7006c09ae0ca351092087f0cc7bb65b0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|MW4PR11MB6619:EE_
x-ms-office365-filtering-correlation-id: c9c81435-003a-4c38-bdc3-08df39700aa3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: U33bMW1I0JJgA9l48YCf/zwQZxnUdsUbHfx/YA5RVTfF5K2hUu72mA1KPWqXaLRLi8KR2gnBuhU4B2ooTQUhlJuqF4bJXbNd7vNg+NK9tZCkTNn3ByofQ2KDefvVNEWkG4UgHDLpPmRwDsEs0yrTdrswkBl6nx5RLH3tG/wTQOb7QC4FTTiIqUx7pAPcW7KaclwxjDlMsbc7D0wXR92hG9YC/0awKQTTs+Fc5CaW2rr+SeVL1hPoTpL2G+DGg1d5FTC8l0Sw6YsW5MWeBqZ1sJR+v7OgHX+HsKPNR6lHH8Zg4KS3SxC6mYZqKhp1iDYiWDztuTH30tU/ylsxaAeg4Uf47KnszoQ3rL+H4HkKhGszdaek3E0DoSQuDDuUTu/KKfGfHZY424jeN3jcUkX8hcxCKclu4R6tp2q1UghQhqt+rSDZIKA9YFzrIfJOi4CE9uHDujAA5TnjAl+cxlyYjzYoRMypt1KY3R8yV2W2pR4/QiVGtvLh4NCghf8eZ7RUAbbfCXCvdQGL/gBIzBqVPmJajfU8KkxIMX7lATZE8TQNA+WKqqkx3Zx+kHjbHcbFmHlYbm7UAhSnTBBNM+JnEXqPRU81E8cjSG1Dy2PKp5CciHcgGIpJwsLjtg+yGk/7m4zGQee7hZp4rOEC4hVsfkh9IUZaAwgPeWzIn3+0+v4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGY5ZnJ5QmZMZnd5cThCQUpJYUIyQnYyK0JpV1d2cllHQVNvS0NRVjJMTmxi?=
 =?utf-8?B?dkdtK0EzTmtBRnJjekZaTlFNc0pLMTc5cUY2Sm9UOTVITWEwSWNxcnQzN0FL?=
 =?utf-8?B?Z3VsSEVHUDZNQ0pQeFhFYVAvd1BiUG5wWXIrVThBc1lXTjJVSy94eWpIVkRo?=
 =?utf-8?B?dHNJWDJjTFRhSlgxamlZelVSRmNtTE80ZDV6YU5wY3A3YWtqOEp3dVByWmVI?=
 =?utf-8?B?K2RyNXBjakQ2RVhwYWlzTjJ4VzZRaTlPNVRlZkhPV2x2L3R3emlLbUN3MFkv?=
 =?utf-8?B?MlJILzVTYUhibGZ3bXRheGZSdGkxanZYaG5WQUJ5SkhyV0N3bmFjNTJ4dTFk?=
 =?utf-8?B?NkFnQmpJUW0xVFcwMUliYnJJSTk3TW5oMlVtVE1HejJvOHRnaFh0NjZGZmhY?=
 =?utf-8?B?K2k5ekZ6NXBqK0ZBNytDMERKNUk3ekJ3U3dKdHN0dUlWQlRXWjdIUkJqQi8w?=
 =?utf-8?B?VEs4QUlVWmJKZHRNU2R2eFFjcEw1eFNBL2FiSmtJMjhtdTlDQ1JzaG0rSUl6?=
 =?utf-8?B?STlhOVpCbXZveE9zcnZOVmltZmNpWVcxRFN2VDJpdjlSRFRqWXNKcXRkUk9x?=
 =?utf-8?B?V0h6ejI5RG91bUtIUy83cmtsWm4vOUl0TWx0YlFzYkhDcjN5anRFemM5dmc5?=
 =?utf-8?B?WmtLeXRTNkRxV1RRUmMyK1JmbVV6clJtOURsRVlOQnlkOG14ZHBobUt4WTVI?=
 =?utf-8?B?SFVmeFpuZ0RXOHl1RGJJOFZQZ3dWSGlSQUlzV0tVZW93bTN3bHF4cjdTaFpC?=
 =?utf-8?B?VDJuVGVrNjFiNGRoZXVxa1RmbEk3WDZmL1QrcXY0dzBIWHFpSi9oa01NOFlI?=
 =?utf-8?B?NmRDeUdSazh0TGM2RUxOTWhxTWN5V3ZzK2NMbXMvclZZcFlNdFF6QWd4WnVJ?=
 =?utf-8?B?ekxJbXNFVFlvZjFuK3VPdEhoN3VPWlUxOWJka2N3bUtBems5R0tDa091VjAz?=
 =?utf-8?B?V1FjM0xwMW9QL2ZTRng1TFI0Vzk2enpySUEwS2pHamtVZ0FSOWRPZkcvR25k?=
 =?utf-8?B?RUhzZitReEdDU2VGUzE3djdnNG5XcGxQMGMxN2xGQTRKQlE4VEI3RkhKb25i?=
 =?utf-8?B?eFhzTk9TaU1ibTVvNUg3OGF5c2VycndmMTFsRFlEdFFid1FDZTRKOU1CQlRL?=
 =?utf-8?B?eXJaTnN6TWpMcENKREdIL2t3WUI3aG1uN0M0a1hsZXd3ZTg1UnNzNVFUaHdj?=
 =?utf-8?B?RGpjS21naXFROXNSZGV1VlpCL2VKczlwb0VTTHdwbzVRUzhxZHBxYkx2aEl0?=
 =?utf-8?B?Zm40eTlnT05UNy9TM3hBdjNxeWJkVEoyTmdoM2hNSFZXY0hYWXkrMm4yK21M?=
 =?utf-8?B?Wnl2NU54SFNubUZQZ3ZzeHBpUm1UT3lDeFMvVHcwbURLY3RhV0owOWprbjNL?=
 =?utf-8?B?Z1kvLy9oRzV6bEJNYVNkWEJObmF3UzhQNWtrTHJ3QkZac3p6UkpnUlVwV1p3?=
 =?utf-8?B?cm5ZMU1BaHgyVmk1TGVxc24rVFI5aEI0MXhsVzc0ckRJd2pwUVlPQ0JVOFhu?=
 =?utf-8?B?VEFibGFWamVaL1JKS0hGNWRJZnJZeTlXYlBwNGlmQlYzL3RKMVlaWHkxekdY?=
 =?utf-8?B?NUV0VkdYWHpjZUd6aTBPVUFrSUdEMDRKVTg3djUyRXMzSWlVRm5Ed21NMVFL?=
 =?utf-8?B?ak9KcW51Z1hSRDZlTEIyTW5jK1ZTZGdKWkF4amdJaTJOcWNPNDBJMEtnRW5j?=
 =?utf-8?B?bUxodUU2Yy9nVTVOUjVlVWpiVTZlSVJkSy92WG0yelMvdWFjWXpuZHNSbG5F?=
 =?utf-8?B?eWJEdG9sb291NG8zQjJhbVRqTjZrS1hxNnNxTGYxOGE1cnBnb3ZjTUgyeDZO?=
 =?utf-8?B?bkEwQS9kbTQzZFRVYmE2QkJFc2g0TTNaNE43Tkx4SHFERWIrOXUyUFdCbHdT?=
 =?utf-8?B?RU5kaVFUcHBsMTgxd3B0cGFySU9wZlhEa29NejNIYjJ3TUpSL2FMQnc4TklN?=
 =?utf-8?B?bVl4YkhkbkppNWpVcVI0NVRuN1QzQ0dSVjROQzBCQ1BaRkk2eUs5STkvWm1U?=
 =?utf-8?B?dmRkZWE2bDdtWkpUSW1QVy9lUDJvNVJxZjNmL3hXa0Y0eENyaytkaGJrRk9t?=
 =?utf-8?B?YmUvR0ZMTWhiSGFBSm0waCt2TXFHbVp0a1I0a09kaEo1UTBYM3hVa1NDNlhW?=
 =?utf-8?B?cU5jL2tubDcxQ3RhajRLdWpsb0g0WDBqNWZ1aXVOM3V6L1hFS0tQQStLYUd0?=
 =?utf-8?B?WmFQdW9nVllKUEp3bUNMOFFiaFMwd25vL3JnYTZDdXBqVW9HQm94VnF2OVhD?=
 =?utf-8?B?MDZwWFgweWI3dTZzVll2QlFnUm5UZURONjZuc3BqNUVqTTFod08yY0lRVHEy?=
 =?utf-8?B?MWcwTTBWaXJRZk9wOVVQWDdCdFJkckIxajBNRkd1MlhlS3gxZVI4QT09?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: cHEZIK0ZRF/BOpijT5eHd3fo/JGDH3+Va+z1YPGWWkGyeT7QySCCl8wVW7eMWzdT4ym+Be15Tb6xovOrhlZPlR2tdHERZpV8eL9Yg6UcjSpOVtGp9f1ricRcVkpoNgHGnS9NDrGzKHq/Wf4aeMN+Yd3/jMlPnmvah0hnkl8+HU1BC3jrnpo0m8Gtkgj3CZsSS8xP13MCS+apvm2AZo4tpS5N8yakJxvg1IDYupuKDWPRelcSM2vNpkbOmGuPzg1pYlVL+f7Pd+iTxRp/JGUPqD3EN4gfrr3her1lXHDc3Fw9VZzVgZdYiCnZijj2LCdCGhm6LKXSNM0tam2sZ7J5CQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c81435-003a-4c38-bdc3-08df39700aa3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 06:02:28.7456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /prvDFTq/sLKA/rDosIimKgRDm6jIpg6Kbhr8o/Mc6Ep0XB94J2Fw11wpirK42DwdNZ5ggn2vuPQVYmCK5Eo4ub5cGNDkCcfMaK3qZVbSGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6619
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
Ni8xNV0gdmlydDogdGR4LWd1ZXN0OiBTdXBwb3J0IFRESSBiaW5kIGFuZCB1bmJpbmQNCj5vcGVy
YXRpb25zDQo+DQo+T24gVHVlLCAyMDI2LTEwLTI3IGF0IDEwOjE0ICswMDAwLCBEdWFuLCBaaGVu
emhvbmcgd3JvdGU6DQo+PiA+IHRkeF90ZGlfYmluZF9kZXYodGRldnNlYyk7DQo+PiA+DQo+PiA+
IC4uLiB0aGUgX19mcmVlKHRkeF90ZGlfdW5iaW5kX2RldikgYXJlIG5vdCBlYXN5IHRvIGZvbGxv
dy4NCj4+ID4NCj4+ID4gSSdtIHdvcnJpZWQgaWYgaXQgaXMgT0sgdG8gRGF2ZSBnaXZlbiB0aGUg
cHJldmlvdXMgZGlzY3Vzc2lvblsxXQ0KPj4gPg0KPj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzcwMDU2OTI0LTE3MDItNDAyMC1iODA1LQ0KPj4gPiAwMTRlZmI4N2FmZGRAaW50
ZWwuY29tLw0KPj4NCj4+IEkgc2VlIGluIGFub3RoZXIgY29tbWVudHMgRGF2ZSBzYWlkICJJdCBk
ZXBlbmRzIiwgdGhvdWdoIEknbSBub3QgY2xlYXINCj4+IGhpcyBjaG9pY2Ugb24gdGhpcyBlcnJv
ciBwYXRoLiBJIHRoaW5rIHdlIGNhbiBrZWVwIGl0IGFzIGlzIGFuZCBkbyB0aGUNCj4+IGNoYW5n
ZSBvbmNlIGhlIGNvbW1lbnRlZCBoaXMgcHJlZmVyZW5jZSBoZXJlLiBTd2l0Y2hpbmcgdG8gZ290
byBpcyBhDQo+PiB0cml2aWFsIHdvcmsgaGVyZS4NCj4+DQo+PiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvZTM4MzBiMDYtZGFjOC00ZjIyLWJkMDctDQo+OTgwNzM4ODY2NzhhQGludGVsLmNv
bS8NCj4NCj5JIHRoaW5rIHlvdSBzaG91bGQganVzdGlmeSB3aHkgdGhpcyB3YXkgaXMgYmV0dGVy
IHRoZW4uIERhdmUgZGlkIG5vdCBtZWFuOg0KPmRvbid0DQo+dGhpbmsgYWJvdXQgaXQgYW5kIGxl
YXZlIGl0IGZvciBtZSB0byBkZWNpZGUgZWFjaCBjYXNlLg0KPg0KPkluIHRoaXMgY2FzZSB3ZSBr
bm93IF9fZnJlZSgpIGFuZCBzaW1pbGFyIGhhcyBiZWVuIE5BS2VkIHNldmVyYWwgdGltZXMsIGFu
ZA0KPml0DQo+dGhlIGZhbWlsaWFyIHBhdHRlcm5zIHdpbGwgYmUgZWFzaWVyIHRvIHJlYWQgaW4g
Z2VuZXJhbC4gU28gdGhhdCBzaG91bGQgYmUNCj50aGUNCj5kZWZhdWx0IHVubGVzcyB0aGVyZSBp
cyBzb21lIGRlc2NyaWJhYmxlIHByb2JsZW0gaXQgc29sdmVzLiBQbGVhc2UgZ2l2ZSBpdC4NCg0K
T0ssIEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyByZWFzb24gYW5kIHdpbGwgc3dpdGNoIHRvICJnb3Rv
IiBzdHlsZS4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==
