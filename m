Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793740288;
	b=N+LZc3MCiO/ZCHnLMEK1Ig5VMIkZVudBliyeP+faMKTDlAKnEKLo21EHEM5C774b7iNF
	 AxOaU6itvltiJhw0Ur34kYDTAbf+Y96ZlxbUfUl1q71lD9oAOiQ/y2/WpfzPVmuKkf8y3
	 04Ly1CyyG3GTp6YqycQ6tBc0ezPrf9xBOQiBI2YKoI6F0Nl9PJNkfw9qKTimUtwHwtjrs
	 /kUjCtKzqPwlhD/UzcfWGnsr9wOphKtSmP5zdtZ4P+y3oT8vKhGyK4KJMdgC0b1xiHKvB
	 KgA6jNYba56NS7Ap5TFi1HrOBuM3tvwLqFJlK2N0EtBq7kgOrabZrRVjEnaKhYp8kLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740288;
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
	bh=VIyydvQcl+XfQ1gDJFKXDsPlfZgL75cMNhtI4KZuAyo=;
	b=Jv8KFPyxL4KaWR+dfzDC/9JW/HCh3nXvOjbAfPdGrF1l8tjQ8MDns2p8vitpLpQ5eN2g
	 3IRh2kuZigZuOesAKjIlqfw+wFpBJjLaz1Qp6qz2Z9P42Lsr0yicT5mtMlv5piy5TTIcb
	 LuIQV0AJ+Yw5OWHWz8luaCHlIcBMNZ9vPkk7sCP8+G07oUMZ3y2ZZxnIlMC1KI89E/5pS
	 A0q1YMokNTBNHZg2SMjiE6nlErBMWLbXw3THS+iOPVIWZVgt48GEvQzBZBKHsNHonQmAY
	 c1ptGNIrUtojWVyy1Hz4mVTmA9dPXLyajvGa4tD6mAIibrr9uVaExq6KlMPQPtj6cHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AJP21IXK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED966082BD5
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 21:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED966082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AJP21IXK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740287; x=1825276287;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VIyydvQcl+XfQ1gDJFKXDsPlfZgL75cMNhtI4KZuAyo=;
  b=AJP21IXKBW3HX3sxxEDJn1EOIZoBkpZTvM3m/drzqewcO3/Oa8aiIHC9
   SnjEHeIQB5rY/AA9Q5Q2biumbgEJPgNg6Nhr8JB9Bgld0C2a8QTOGan3z
   lPFH+0xegEVqPNWqtHJMDlMToFZTNR99++8/8UI5fhjMz0HVtbHsBMjhx
   m0bcOklp9zUwrXEbl2Z3fNazvay90LC9KHALF2BUBK/opIiemhSRG48QS
   PSK+KDFfXMuRo9p3pdH2pHOUCs/8LQ/HJVXGQTItHQzkWMg++8bE0QP8k
   FjI9SipvcFOOLFky3ctGbiOaP6rcy6k8uYvY37n6EYlQ2d+6Pj4vr1J5O
   Q==;
X-CSE-ConnectionGUID: mPlq1nRSSYaOQsFI3o/w2A==
X-CSE-MsgGUID: /Ew4acn+Sgi3c64UUh+esw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2378332"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2378332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:11:26 -0800
X-CSE-ConnectionGUID: /LbzHwQ4Ti2x2mV0BkYR6Q==
X-CSE-MsgGUID: HnWjCMOiTzCPDX+3a6zmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6383685"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:11:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:11:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 13:11:25 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hza8UnLZuUSE915U92r17yArhcKPX4S7PcQCzqh8LmMkXdXO4uej8CaKdMMpFUx9ZuqEKHnlyV51isq3RUEPYIrDuzz6YHEbg6a+kQSQ0hYudz4L1Tn6XsL/3nbBoQ9/GUyKxCaGlQgXSB9BgClKyQz9SkRBlTcLx+7dfqJf4bGowfxhdAtZwBBylVa05aiuM4sdPXCG3RYwIUPGB0EBQok5rZnzMHphxHqmRk5XTS3laSHfQ25nCUB68HWk+unLOrXQXqbR7//Ow0PYd+crS7idUdnYgI7Dluc6Q44OqOOv9vjXLc9ZjaGt4I5CkbutZwAtfWKPjO+ia3ZK2u1H3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIyydvQcl+XfQ1gDJFKXDsPlfZgL75cMNhtI4KZuAyo=;
 b=BaCrqLOHUof1H6oJND+RC6/G5nw8N+k44JWxHdNAcbvimFZ7YiAQi7ryEUB4/IDgXVtzf0NbLiVGik+4ep/P1cNXzDaE3bcBsy/Q3Q2pLu0nZjFLpHgzyAVRihi1YalCcg/kg+A1GL4h5IBNxY7HBu1q3P1VriYTejTQbFwhFZxGeOkTGp4USkHglgXW82kihs8eT59INCba2o/Lp2A0RkvPj23z8/eSqL95HRzkSnfTNzS9rWBer5jnkrG0r3fzYVPX2EyDC87rJ4gK0H5DeIvX3MaX7maU54hlUJi3dYe5uS+ToELeM/PYwamL+L5CdoiiPV65HvnjMXeIhH424w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SA3PR11MB8076.namprd11.prod.outlook.com
 (2603:10b6:806:2f0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:11:21 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 21:11:19 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "jgg@nvidia.com" <jgg@nvidia.com>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Duan, Zhenzhong"
	<zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Topic: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Index: AQHdS9rNF++PSNGXuUGGFGwkpIea87cPd0SAgAMIjoCACQgFgIAANxuAgAADhwCAAAqagIABSvMA
Date: Tue, 3 Nov 2026 21:11:19 +0000
Message-ID: <83ed5ad706f73c2209a2bac3fa8d07969b8bae45.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
	 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
	 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
	 <20261103003613.GD274202@nvidia.com>
	 <1a956c4714be8a9488dbc5806efbb89e47beb6ee.camel@intel.com>
	 <20261103012647.GE274202@nvidia.com>
In-Reply-To: <20261103012647.GE274202@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SA3PR11MB8076:EE_
x-ms-office365-filtering-correlation-id: 3ac435de-e6a4-4e20-4c28-08df39ef01b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|38070700021|4143699003|11063799006|56012099006|261022105027099003|261026140227099003|261028144727099003|261026121527099003;
x-microsoft-antispam-message-info: MaWa1gyYTQrwt4SSmoLTRV+s+vxYlx2iKqKnXPIlKKo75j7tlfoz4l5Dw3W9nlbnQHaYwi1pz1ojWfYxqbLiEbxKClPd4MHMC67Ny0QnTtVdIDlU+TnRWI/Y+ohV1PqO1w049Yghy4ZOrHVGhKXShFMffHifrbdIDTKaIggHfm0evxvbJbXqKc6U6ZM/TbEYeotbOijg5JHpxKmjik8zMe1z1BSGaBcO/Kx1e39vF7oq/IDlmOc2vE7u22Kl1lIy1eddbwYKx6BR6/vW9RtlONHo6N5pWm2qZj8HY1sGVni3uu8Phc0KkW+VrzanF6DKi1jzmOrenhiiAaCw+f4Q8LBmsvVNODcrzvEY5EDzSH9ZJMr4t6v1Md+2A46qlmXiAT/GzSpXYAw+WMRyOEMiVoMT4BQClWxLHIv+Orx5wsRvnR7WmTBCKcpdZwSg4rR4pO9RE6Wk/LJfoVSePmUvF9OJQAj4v+KM3SlVnkBiBFw0vWh3ntY1y4166VUFjTZwGp5Z7SZIyHHDxCCMGhj0g4LismJr/oNTVAKxVJ/lffAO3QwF6rfYshIr6j9nylAdWshvS2NoNxBCo8Mrad7kiDMqdCAQqhnGd8S4LwapTkQz44UtV6B6GfEgEgdGBwRhjlfQDWaToMFr6JLAChGxYjo/WNn0eujjrGSGDj37EfJymq6HwRJ6A7DA/0psRMfDfP7z6xJmZc/kEw5WhzqxpUb9IqPKH/WqSd31MgUGROM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW9EeHZsd2xLZ3hmNFpSNnFZUXVxT0hXcWdoRk9OdWJkZUdrWHlKWHRtcFBE?=
 =?utf-8?B?Yktmem5OeGpxNHB0c2dYdHBITFo5STMyOEJ4RlRDbS9HNWgzWkdHWXkrRjhW?=
 =?utf-8?B?T1ZPRmFwQVVZWFFzampJaE1Mblg0ZTNEU2NMMEh0eVJXYS9sZllTTHNOK1g2?=
 =?utf-8?B?V2lCZTE1aDZQdEZHbWpSaVQzYTlVUkRoSkI0S0tTVWI1U0hQOVphL1BIaHAr?=
 =?utf-8?B?QXFGek9VdWI5alRtSmhLVWlCZGpLc1FVOUY4U3ZZOE15LytEUDZzbzNSbmhq?=
 =?utf-8?B?VEd3VDVaWXNWVG1pVzFyK3YvQ0RJQmg1L1UxTFhBYXBGVUZveDhJcVNPTWQ3?=
 =?utf-8?B?a3krKzh5eVQ4TmcwVkpVUkNIR3ZQd092b25xZUNFRTVpeWlwcURDZlZFZDJv?=
 =?utf-8?B?VkZzd08rMktLR2N5MGtxZUNnNWZOYTRQN0psaEU5d25JdVpLbEFKaUxSK1pF?=
 =?utf-8?B?ZmVMSVlNVXhKMEhtaWU1MmNuTGJjSWF6SUF5MmgweUlNRlR6YitmeUgrWHlM?=
 =?utf-8?B?dGFQbElwWGFnQTlUTzhqZHp6NmVid3BBUUJMdTl6Zkd5M00wQ0RNS1lmVnh4?=
 =?utf-8?B?NnI3SXlqN25QYnVQTHp5ME9kRjFXeUJGVk4zWDRnK1YvTXVxM3U1ZWM2d0Zh?=
 =?utf-8?B?bVhUS3JvT2RyME1MQis4RGpPeHhPbzdpYmtYTDlDTEM3cjc0cVdWQUU0c2JK?=
 =?utf-8?B?WktiemUyTGdEeFpuc2NSRWxIdDkzUGp3VEtKSDB0NEQ2azZ3NUJOWmRzZDlJ?=
 =?utf-8?B?WElwaTQ4NmNTNUdzZUw2VW84VFNaQnlsVm9KZjRuOGFHYWpZVFVHQ003TjFt?=
 =?utf-8?B?TEFEOXB5K3pOOGtJMTlYNTVYUVVheG1OQU8yRjNlSG9zMGN1T3BBbkpqWGJT?=
 =?utf-8?B?Y3JJcW5pSUZKTjZVdjBleEhINURwODE0by8zc1g1a1pSZWh3elR3bUV4QmZv?=
 =?utf-8?B?VnhTK0s3bUhpeDYwaUpqTjU3emRyRytiRHJlMWxNbFBBU3hqVklTempZWlM5?=
 =?utf-8?B?cHhTMnNlWndrN0VPc2U1Smx4SGNrWmJjL0I3VE83VmhIdDBYQnlTK3lvZDJH?=
 =?utf-8?B?VEYrWHVZQ05VNUZ5VXRiOC9JeFMrdVlJc2pyK1ZOSGh2WVEzcmwycHlRN0JY?=
 =?utf-8?B?T1c2Y1hzckNiSEFWWmNDWHFGeGNmVmN1amhQWkFEazVUT0I4NXhMeU5mWHpL?=
 =?utf-8?B?cElCUU1vaEYwOU44N0syVTBQQktuNzVXL0ZuelpFaXBqQU5YRldQL2VJM2ZQ?=
 =?utf-8?B?OStXK2NjaW5FUTN2YjM5SUVHOXliQ0RHOWZYWGtZSVZBQkFINk56WU4wNXdl?=
 =?utf-8?B?NE5wLytuTmJYdzV5aFFCTjIvcGRHUWNKMXRXaVMvRk5SVElIYUU3MXhrZHJa?=
 =?utf-8?B?RmhQOU5zZ3RNbWFhTnFLcWR6UHVCd2pEQXdNV0hvclVPYS9ZeE42ZDRDVkFO?=
 =?utf-8?B?eHdkMm1pQWw5T0t4d3h0YjN2aUVSMGhXWTR2bG4vQVhxNGtOM2JxbUlpYWNP?=
 =?utf-8?B?VWMwVEI1UDQwTFdDL0Y4MU91UWVnSnZjNEc0aFFlZU80b1RCK0EwN2NrcnpG?=
 =?utf-8?B?TFNMNGZMeVQ1ZjlLOTdnY0ZCdk4yOTNVZUZ2dTdtaUFXWU1UY3FWZWgwcWpq?=
 =?utf-8?B?N2dwTjNyMElMaFVMR04raHJUTncvcXdZZ0NSUFMzaVYrdktnRllRUUdkNUxR?=
 =?utf-8?B?VTJqY0pDNzFYQjZLNG11VklKOC9hcHYrM2pJcjlYU2ljZDdkLy9seTdDWWw2?=
 =?utf-8?B?Ukg3MTlXT2hqOXpiNVJuRjdLZmZENWpoc2o1WHord2RBTFFrSDVId1hCTjdB?=
 =?utf-8?B?N1ZMdnZyeGdhNFNMaWwxMjExdzFPQkJTeVVQUDI5Wmo0a1dGUVFSMTlFUisy?=
 =?utf-8?B?elJSUUhSQkZIUnlNakVlNmZmYzRyYzJZalZpL0pyNUZTRHNoRmpvSnl4Mmcy?=
 =?utf-8?B?RjFYdHBUeDlXY3BoQUhDbW51bDE5cFZNZ1JtKzl6UVZaUVQ3ZnZpc0piS3NQ?=
 =?utf-8?B?bVNQZkNQVE1lN2dVTnhDSUNoRUMyenpwQnY4U2h6OWVBTEwzRittWkFIOHlE?=
 =?utf-8?B?dTMwUDFzcGhSMSthcUdzMHV5OEpER3JqMTE3Nm5ueGlEYUlzdnJObURqeFZw?=
 =?utf-8?B?WnR4cnJtRlZySUhwM2M0NVVoek1GWFFIOUM5Q0R5V3J6L2hSRnM0ZVNXVUtO?=
 =?utf-8?B?SVRiV3RnUXB0THZBeW1rMmpvUC9Bd1pOTWtyU2xqZ3lzc2IvVS9UbWNhckRO?=
 =?utf-8?B?WHk0QlIrV0JjVENyd054NFN5U1dsSHdySW84ZmtpMU1CTTBYWDJKKzJuMlZP?=
 =?utf-8?B?UjZMcTJkYVdUYW9Vd3NsWDNnVVlSc1hBalVPeVp6YmpKTUJzT3VkZFJaSjd5?=
 =?utf-8?Q?lS6n+1KS0wl3Ot9w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC888E922FC5C546B3F7CAD0FAD4B7E1@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: TDMfOMEh0Xskxuu3u9etdg9Z9zYUObkL8z5AKfgHENVEVma8gpYuk8famHYeGhednxfo+o5soCVQo+aIVy/Fvf/EngwxsN9qlix9yCdeRVjHC41rwINK1rRzcq8K/9bePk9iMF37kOFVKwPv9eS3Q23cqZQ6jhwxblAhwrJy2GPhvyVRvscd+YXin5YfeuTORtgn2cCR5G/XLeRB1xQF4LntobAeFLq8a4BM/psoToJ7f5UEud1OS+yGs6gOKRJeCvswo4KYyMjNbXxzRGewjHsPABZbX30UBd4+ZROXNb03g36Utn9QhHaLD7oRRdnlVNu7tGVChk11tPnvEfDlTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac435de-e6a4-4e20-4c28-08df39ef01b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 21:11:19.8092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrMXt+bxQJA08Q+657707dcPF+ya5poFeLv+co5lMd4TBwWxdRO6nMfjND6Nr5vo/Q9a+b0uVuD5fJdzbj9wZJctm4/jFpjH48X5ZKv61X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8076
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTExLTAyIGF0IDIxOjI2IC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gU28gdG8gZ2V0IHRoZSB4ODYgYWNrcyBvbiB0aGVzZSBwYXRjaGVzLCB3ZSB3ZXJlIGdv
aW5nIHRvIHBhY2thZ2UgdGhlbSB1cA0KPiA+IGludG8NCj4gPiBzbWFsbCBjaHVua3MgdGhhdCBk
byBzb21ldGhpbmcgc21hbGwgKHNlZSBQQVRDSCBPcmdhbml6YXRpb24gc2VjdGlvbiBvZg0KPiA+
IGNvdmVybGV0dGVyKS4gU28gd2UgY2FuIHN1Y2NpbmN0bHkgc2hvdyB3aGF0IHRoZSBUU00gc3Vi
c3lzdGVtIG5lZWRzLCBhbmQNCj4gPiBob3cNCj4gPiB0aGUgd3JhcHBlcnMgYXJlIGRlc2lnbmVk
IGZvciB0aGF0LiANCj4gDQo+IEkgdGhpbmsgdGhlIGxvY2svdW5sb2NrIGlzIHBvc3NpYmx5IHBy
ZXR0eSBzdHJhaWdodGZvcndhcmQNCj4gDQo+IEkgZmVlbCB0aGUgdmlvbW11IGRlc2lnbiBpcyBj
b21pbmcgdG9nZXRoZXIgd2VsbCBhbmQgaXMgbG9va2luZyBsaWtlDQo+IGl0IHdpbGwgZ28gb25j
ZSB0aGUgdGhyZWUgYXJjaGVzIGFncmVlLg0KPiANCj4gQW55dGhpbmcgdG8gZG8gd2l0aCBTUERN
IHNlZW1zIGxpa2UgaXQgd2lsbCBuZWVkIGFsb3Qgb2Ygd29yayB0byBnZXQNCj4gdGhlIHJpZ2h0
IHNoYXJlZCBjb2RlIGFuZCBmbG93cyB0b2dldGhlciwgSSB3b3VsZCBiZSBjYXJlZnVsIHRyeWlu
ZyB0bw0KPiBwcmVmZXRjaCB0aGF0IHRvbyBtdWNoLg0KPiANCj4gTWF5YmUgdGhhdCBoZWxwcyBn
dWlkZSB3aGF0IGNvdWxkIGdvIGZpcnN0IGFsb25nIHdpdGggZHJpdmVycz8NCj4gDQo+IA0KDQpZ
ZWEuIEkgdGhpbmsgd2Ugd2lsbCBwcm9iYWJseSB3YW50IHRvIHNlZSBtb3JlIHNldHRsZWQgb24g
dGhlIFRTTSBzaWRlIGJlZm9yZQ0KYXNraW5nIGZvciBhbiBhY2sgb24gdGhvc2UuIEJ1dCB0aGVy
ZSBhcmUgdGhpbmdzIHRvIHdvcmsgdGhyb3VnaCBiZWZvcmUgdGhlbi4NCg==
