Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793240709;
	b=2+P6ABDdXG6qudN/Ne9PYO/ZRQmCR0UnqQQ+8vHbxX/+6XmN4XdwAVBC9t16WrvntdWZ
	 28efNJ3sAZjCIyJqU1R3r1Ow4FAllexf2/myBoTq7ULhxduxtEg7VFL7YeX8Ypgv41LN+
	 DVfyLDdSmtuJaRRlMDCRKbd0OJZvYWBZxBGTeTA52miZ4UqtAjcwa4zUYYFOq7rJ2HSiJ
	 rtiPPsLgueZGq7gh4nueZwkyM8Nvu1ahEqvhS1dSeR9FlnB+myoWTsCK9WbXIh7oHVkAJ
	 sraZJA5oyKU6DlyNuLc5NzgCquJaPrKMz/iUeHOdZGiX2xcmwaHzlU+W5zLL47Wfsvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240709;
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
	bh=qNy4X+ZG9q4TiBo2cM4WN42JufANHOUw21cPU9r+47s=;
	b=gEXC8/V8egaYLMC5LDXCGeP1TLRm3EJ1Vw2kheVd/gmwe0Jtcybvns4g2T8XCE9Yq7pz
	 ApZv9IHaZyT/Nq95a+/zaH/muRx9VVQr9K2DvSxgUXMY1zWF+/EAEVav0ILP+NRQ9NDdb
	 P/K2J/8lyvvE5K+Ac6Z0MtugANyeV+ibu3zuw3AIua/HEyoG/uDPT0C6GKH3xWlqrG3UP
	 5MraFpNugFuZStvNdN6U9LetTwYSkGQ2G88d9QVAngnNEa3aOdoEQm9h5SZM3e8CkcOaN
	 EEpW1gWXd1PlCpcZqXsvcxrm74uN+T20XfovqQPQU9CsejIX7b+SNirE3sAjH9/pnTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nfqit7wD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CCC606A31D
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 02:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CCC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nfqit7wD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793240708; x=1824776708;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qNy4X+ZG9q4TiBo2cM4WN42JufANHOUw21cPU9r+47s=;
  b=Nfqit7wDnDtxlHOqb6JpUEGIHN2EBxWxZy3WQHZiExPPfHuNi6wk1oUO
   TMhx5WQDM83vEHItwABSMi4YhnyH39nGGxPHKcjCXv3ID3fNimhdEOvJ0
   O06i+ebueooJSSvLyaBOlMw728c38KlI382gIcyUZEHgaSoNTCC+Y8FY0
   wFtTxSe+p8UgC5gcQK/CJfRYoHctnCaupNS9FXRGQIv8/Dm2KxyfncVU+
   yAgPaWxJRr80Nkwgof1nPwT2IuKWRi1ZBpMKgfqnpN25xkCHFG/AINbbL
   l1ZCgHEc/Fo87koSZJPhzWSAohVa1CVDrtfBqL6Exp9fFm+5Is/L+UPNN
   Q==;
X-CSE-ConnectionGUID: h+kBHdx6RdmWDEMYXjmJ9w==
X-CSE-MsgGUID: bFq8rNnyRv+QjKVBuo9JAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1978222"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1978222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:25:07 -0700
X-CSE-ConnectionGUID: MS743DtLS8Shvz0C71cwWQ==
X-CSE-MsgGUID: qM9/sOIHSrywqbJ4/Xpukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5012441"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 19:25:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 19:25:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 19:25:06 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 19:25:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y43Pjjf6giACe5HV2Eh6gGpVA3LQlM70ZmlKAge4s2KXTo1XJyoJr9s+ck/i318PWlG8VdCU6qCFlHSJmGyDCk56NY00W9FBL3M6vNuVOyqHUnkLdehEsLRb7bOusqPcqITauE6iPQmF+rgXDhH0b5niUe+JwuGhhAFdXmIcbOwptfrdGtPEJ4+lBVtbjkGGB1l/I4DcGFXCqIvKAKbd3zfHtsIoYrD/UCFdPXVerFjteT/e/4Wqvc3TD/f27ONvdMoyjkL9yKiSH8y7t42I8P8LlcwFWITcWVLat7VMULKOoVLOqgfkWgknxlTYqmdgU3hTLSxYQHW1szt/xPYxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNy4X+ZG9q4TiBo2cM4WN42JufANHOUw21cPU9r+47s=;
 b=S1qNJqETlexI/uxEExbhp9B+4b/w5IaB8ywK91i/0fkOkfL55gSSO70QmcD9L6mw/Py7spB7Nvn+qFF/cqqTgFnFuPNmBsC99VOU0veToG/bq96MnqZ7BIXsSjarbvROJ5TFAmcLNF4DffihkYDu/e1xoPQBaq4zEVYc1jo33NqSBSU3rZc8tK3cvIbapR3JMGuUjhfJr7lICTLtNINPc5jiOf7gvCxY6qXw0Yu7m2qOK5FYx3ZeJK5VKRJy7sVnTcV0hHkxefZuR6jUjIavnDOHUrLxD9Bm89bVNGIEAOF8bekTLbb9k+Yl49IVnonC++GrE1AsKcMRwXPQJ/1gsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 02:25:04 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 02:24:57 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "Gao, Chao" <chao.gao@intel.com>, "Verma, Vishal
 L" <vishal.l.verma@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device Interface
 (TDI) activation
Thread-Topic: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device
 Interface (TDI) activation
Thread-Index: AQHdS9rXga6cgPHlGUSTJRY7liaL3LcPnPOAgAMakBCAAGQFgIAA5WXg
Date: Thu, 29 Oct 2026 02:24:57 +0000
Message-ID: <IA3PR11MB913674E58AD37A67810F542A926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-13-zhenzhong.duan@intel.com>
 <c81b4b51-4412-4d5d-a073-55fb346a766a@intel.com>
 <IA3PR11MB9136FCB9ABE0B3171BC3A6E2926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <20261028124115.GC2541714@nvidia.com>
In-Reply-To: <20261028124115.GC2541714@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV2PR11MB6047:EE_
x-ms-office365-filtering-correlation-id: e5f26037-67ef-4398-b69e-08df3563d398
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|4143699003|11063799006|56012099006|261022075727099003|261026121527099003|261028144727099003|261026140227099003|10067099003|261022105027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: n2OAy6ILjz5JgRBjL0v9lHxwkkyEj33cbew2iwkHZ9bSDQl/VjR1jlX9qCRIxg6RSF414YZC1F0hf4mmFL50+Dfl9qxVQM+YJrq4GLJY0I9enBvVaUWaTaQwmpzGuraSL6+B8vCMTApQCSoHZ4UfRSBhEpCKenKZ7XZ74lqe9quSNr9AoBCe+fQaklVFJM4k9EtGwM5vzaRI7V+Zwr4PvM3Dc2kAnICk1YET5PGpcxHOgi4ZpgUQ8qOjrj6BW/vEsKV3bHIXiCTLpERGBuTTOdh2tUXYNiFbHfw049Me032QHhUVPSK8ng5UwJhCHAchUXM5nga/lP9I5noKr5dnrnZRUSnZMgGtNu99wFF5S8JQmctHmSxUAjjOUh6cK8bwSns9SLfbkhnnaQIdXcjZzuOKjIB0xQIm3PHKfkS8bRXT52o/nBQQ6ccNsRvnrJauxfTBN/qGJsmsQV5VbDNFi8C8Q1iK0nTc3VUduGavAHsqBMRbQuB+D5uKMsGpxoSUY7ft2Y0UyZ8ldcNF/FE3d6YivRDT2YKH+qauJwcOd8vfsFUE0cYJJ2l4hhZ9IE+ROHRGi7HTsdxNZtsxzei7P7A2Not8cOUXp2cqh1JoqoeYNdoWke763aoss8lI5gKaeRiefFbz6LnLaSjsUmIi6J4dzr8JHaul7QSk7+/Fsr4MzWAeBsgUepSocRrQDj8sF1x1xi81HQJ8LwUG65iA6DTrO1/Pjl33Sh/SxN4DD6c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261022075727099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(261022105027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q1VBhqxfW9B++gC9RR2S9Hym415rSJiza1810ABO1kofCZPkodLq4kztWXK7?=
 =?us-ascii?Q?Iuq06TPE+oJLDnvSaW19EHNHTebGGNVLT5y/A9M7RAqgcN6vRylqUjh/T0UG?=
 =?us-ascii?Q?KC3ohIhktqjPNvMFhrSws921eWGuCd22ag5wSjxE4lNnIwM7waum83n7bFF2?=
 =?us-ascii?Q?fcEv1ClvdVfmsfUCbZoZmSaLMPlyV0IRe700c1UeTSmifm3xVXShZHXw+v+d?=
 =?us-ascii?Q?WH3zPb+eDrOHk0ruseFyrmfUroV1OX2Brlsuz6mb9HtmAKayrwrPOqwEyazJ?=
 =?us-ascii?Q?eETbg/W1UmbdAPvDkQPCrUTofLmvWECaBRp0llFYRgPJLlKiYDWYSq4IEQtW?=
 =?us-ascii?Q?qTz7IIQiBzn2qgpY4pROxjkozn6eZOL9y+y5hTMXNFJhc51DhrE3E6BOAT3W?=
 =?us-ascii?Q?Oqh23rGqaNMiDkq2QlcVqWckDNg0xcXOsYjdTZY0gWrRDd26uyQOoN/PiLwB?=
 =?us-ascii?Q?iuQE0W9fRfcErI81Iryx2pDt/mVCqAYz7O/kXZphngPBwy128/1l9qn8Jew2?=
 =?us-ascii?Q?I/B9CH1S3zCIJKIgtRrdKcuL4cv94K2cTPjbtoUf/wA+M/t7jtLuFYQbWU8g?=
 =?us-ascii?Q?zAX6WZ50lOgInF0C611zISoVziUKCMCbo2w4D8CsfFZ6qUjUc4B/+0Y0V5vN?=
 =?us-ascii?Q?jvMq/oEI5By724NGdD4RsoyAEnnCxjr179v5VrvTOeMD2ivMA9qrQUW6F6u0?=
 =?us-ascii?Q?9Ah7XpUk818//2WRolnmIjpVS8SB6quonkTEdoLXa8NCgzaAiwcvdV0/CPPw?=
 =?us-ascii?Q?6P+BiSwvPQcO3C2DVlwJ1vZrq1uqoKyvXi7G/TOs7kZpJXeWiuwcVtddn2k9?=
 =?us-ascii?Q?LlAULgAF62PcEb7KDOdS6oL8M4F88lF1oHRvBR9wewZd41t9RKiGBWrvwJT+?=
 =?us-ascii?Q?HSgNAANJZjvUfwizI4NO6+Y+UwSfwBDd6B5jI5cgbcCpPJgEQOXb98irFf+5?=
 =?us-ascii?Q?6JF6ioEdPcserPhL0d7JttqGG1Sw7FvLOW8WJS/SIkQD4OXx8TXVJzfbtv7A?=
 =?us-ascii?Q?8fW8pc4+pIN7WXNfQ8o9qyRkdk//VEXqdKC4tCahdvs8jSEod8IoukP01VwL?=
 =?us-ascii?Q?pdyacb+4Ewyo23ORI/zhtD3MK+PvWitasDvVTid1ZnWy+2/+qhAwC+dFFMCR?=
 =?us-ascii?Q?RuOo8bl0jozc5PWSEUKHpmXOrqfq1j9rvsZJjQFXLl+SplWcs+2W1N+7l6lT?=
 =?us-ascii?Q?MGWZVVe5/HmOXgf1zf2dbfNy0QNz281cj+wGuqbMfHJa8hg9ZKnr5Y6n3foD?=
 =?us-ascii?Q?zkbLzL4nn1qCIQbmTeQsdM4596Hi0t1DefBC0+p/f1+DAGP5QzJ17vGd5Xnf?=
 =?us-ascii?Q?+reBNSkFS5QA74mfLj4r8TsUlVQaC6tD+9rKd3781fPn5WCGP3j0zxcfOkBS?=
 =?us-ascii?Q?zsHgx9BmG2AbvtcfLkFJsh0HfiNpdBjVTeLmBQCUVCH8XbG9UzVi+LwOhOf9?=
 =?us-ascii?Q?T4N7VQa9F6WYv6WVXSHCe5FwbeCfYESVVkL/KO6Xacb6sVaXGmWN9ngEwolU?=
 =?us-ascii?Q?fjS4NFLlMHbWADlJP2FbYArcTAo8fjWrnm7PjxYj4G0qiZJBLZ1XyZmGFdUK?=
 =?us-ascii?Q?LosbyxlS2kkiQz89UlnD8uWKc82u4XbSrOn3tVpaO/RH3qcSFNi1whKltg0S?=
 =?us-ascii?Q?Ry12g1lkMTOKkMqxObrBB1ZIyc61n/XImyyJQ7bum/z4WjE+abEIYJT4aczJ?=
 =?us-ascii?Q?gwyjoQTYASpFOWCi/5s7FOKxt4hv/U5dhgkLHJgvASgpwSlA4gu1brdXmP7j?=
 =?us-ascii?Q?+p/SLJGZnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qU926xhZJjoDMxMi4BuSdMq8DKHgnZJsdVcei1BPAAHMQc2LAlstvV1pNDAabc6kChTi4jICMyNluca0MPad9D3jGl53zpUJTuUU++c2jyppg/5BKLYJC87pRcdQZ0n1sccKUJ1T+Wws3NZ7sy2t1QElDukRsCD77APalBIRTQ15LFKRsyM13dikuUNZniF6uHLjpvAPzJONDMzaoya8dadbrInh78oxiWvZdGKo6G/AhDViaUYK5oq63tqxYQ/UtxFiNKUh0JVMPLtmbTNOkEbqnPOPQ6VahAJur90gQLnt+XFQh5GqEIxjKf9IPnmcDxeSk7aN9yfEY/cbe7H9DQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f26037-67ef-4398-b69e-08df3563d398
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 02:24:57.7403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MhclzOcTW3J+l45p6AGgQztDuSQg1qgOkv+EYjbNpia9sF5R4xUJI2mH2wKt5HUx3WTUquh3uHKTbY9DlDGaQDe60JSb4ZdISLSJT8I9xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Jason Gunthorpe <jgg@nvidia.com>
>Subject: Re: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device
>Interface (TDI) activation
>
>On Wed, Oct 28, 2026 at 06:44:57AM +0000, Duan, Zhenzhong wrote:
>> >But this patch already calls dma_set_cc_private(). Will it cause proble=
m
>> >without
>> >the following patch? If so, it has bisect issue.
>>
>> Agreed, it make more sense to move dma_set_cc_private() call into
>enable_dma() callback.
>
>I would be happier if the tsm drivers don't try to do anything with
>DMA API. Let the core code do it.
>
>The drivers should just implement the PCIe side of things, lock,
>unlock, run.


Yes, that would be ideal.

Thanks
Zhenzhong
