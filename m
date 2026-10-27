Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091491;
	b=ONiv9dszOQSd7H1kf6yagf5pfqamVuon0W6QWICMuOp6eh4aEd0hEginMxXSHsDgW4Jr
	 WkkBB460Re7yBV4AYbG/JVjw0gwyjE0PHF3NgC4aPvuXacSV6JKifsikadYAt5Xa8qTI7
	 YnHLq9puiaY0NZSbj7++ZeM5YqphZ8+jzlgMXmy7yu35H2t0LAlCp43mm5bdsYH1hiYHX
	 z+L7jm7kVRkEZakGN1ox99jOrojn25UW/Vpj+iCn6pV5MNUmfseKyEVINsBARLxeNtE2r
	 QMNntqYDmPIct2kRtLaQS1rXLrT1A99ZL4SvGExAUlGzjZHpBf0yx0h8ZfyhUIJ/ueg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091491;
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
	bh=IL7aDQGMrMMIzmTH7ubyXqt/Ul8gOcN4D7IwlIlz9YY=;
	b=oGpEgG+yYlwTzU0xButn6+sVggLLwIlZSlX2X8a2rNiWMTREsqvT+jqfoDIOXe71HrfY
	 3PQ1KdCfFfXO/kEfEA7HAMXudds5PrMUSFbho3yp0yTsPm3g6xtGgXcPhXBcVFaOMF88h
	 oKGfgy7Pba8l0lGfjVtiJVkS6FvvRLDL/lm5EeXy1BZ1gELweOJRaL+32JBLZG/GJBbsV
	 8H6d/4PJcKqR7rQ5zIkqGp8VlzGsHNAauF6NBW5duwS5QnGUAxOAITzRhTiWwgY7u4alx
	 8/PdmNTNHSt8jDfWiJMCFUR2o7GZ3U1gf95MuJpcrR2g1dvk0f6LQt1TW1UcCRu77vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eUc8eCmy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368F606A322
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 08:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9368F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eUc8eCmy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793091490; x=1824627490;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IL7aDQGMrMMIzmTH7ubyXqt/Ul8gOcN4D7IwlIlz9YY=;
  b=eUc8eCmyn0OSJ4JsO7Z/q54ORieDq2f8l2/T2pGkOBxMa/dyFyYhQHLl
   xqik0aEBRXsA6bx5QKKFDQzifyUTHP2M72mZH65YA8oa/Qk9GeEaUfsz+
   KChM2wAf0XcNDB6qTAqgAvzXq10jv8XHjb78mxCdryY2Ra+o04AYSUce6
   MWLh+jNkiVybN27J8pIsO2lte3e6pRGFmqgHrV8QnVO+UkWDkPBAVvuht
   +i+OPwCNXHlLLd376wpCwYhx16xPmntcrucmV8s7lkv+Vn+Hk3+4sA/lK
   /FMc8UbEd4ZmtH1O1Qhw1UTECi4nPZc31W876SIEuFNT5X0KjRutaxzf+
   Q==;
X-CSE-ConnectionGUID: IXYlbOYhRwOw17Of+iICIA==
X-CSE-MsgGUID: syaecr5pTKOXXqV7KetoMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1667131"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1667131"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:58:09 -0700
X-CSE-ConnectionGUID: L56VjgiZTqm06kQ2naWfog==
X-CSE-MsgGUID: 6/lIM3opSX62Q4UrveMfSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6241974"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:58:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:58:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 01:58:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/fPWhsZqgF2xaYqCme4fvwKu7U/M5jQytscC2QEf7yKGR6yNBb0ICWigWth5wy4vHf79njLB7kFrbIkPuv5wFD+XJOboO7waOJfw7fn0o3cOs2VWywKvKxsVT0SJb2ru6CpJRtnftpeWDK8oCi91XNIXmKH3+8+A4KNeQbAJSot4iQYFFpNg/cALMOYvva4K+zia3+LKRObl8q/lXfVaqBLRosd+VUzq3oft3+sTdQqgYMh29aYPHLCLUOo9I61i+Afu8bW4o7wg0mJ2+fNslZZqgdgJfvI13CJ0HPB36gzallLMRAlXDMio3fFagLtzgGADEx/8M6BGhid+VlyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL7aDQGMrMMIzmTH7ubyXqt/Ul8gOcN4D7IwlIlz9YY=;
 b=mrUfcgr8aocmTN7CceAijE2qvFRJjQMqdvaNFmpOEw3PqwbXu8cIVZD+gzVmLxxN8CD+hZATL9QoEI7T5v5taM7tmCR4nYlGEhgkiWlMeB9+rKppWdA0xldMUOlVqXxhFVmR0cw8HtAnfnjzADywwQD/+YGwVyL/BQhqH8vSa/v1WbGfQtY0bWgU2vx5ApkeM5cg47IzttCLm00gJTnWceBA0qgWHdf6DWQ2AedWOPEYl18zebBvprkW8ZHsAioI1OMSrC80LSsCo67p+i05dNzXO41FBsE6RrmOGx6PMmOyyPkdy/p4CtugeKw3HVWhlgJwxgyMcYJv52F2o1LLpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:58:04 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:58:04 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "Gao, Chao"
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4g
Date: Tue, 27 Oct 2026 08:58:04 +0000
Message-ID: <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
In-Reply-To: <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|BN9PR11MB5260:EE_
x-ms-office365-filtering-correlation-id: 3466df47-2dcc-44e4-611c-08df34086997
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|38070700021|4143699003|11063799006|56012099006|261009223027099003|261021135927099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|261026140227099003;
x-microsoft-antispam-message-info: wvJdlV7KmzM1OvWCuJstf32EL+4KK3WHYkCDltePQDMaTU/Mqx9rHGDjmX40YEAHcp2Htrz+e12UXrbgbEsoh7HOwR0mb1MRLyzrdkRAE7O0MvDzv/w7ELxqcTuY7u8cemdZ43L9XxAoUBlac+wPTlYrp5zDZkm/1QXOhjxZmkYQWWTceioXMwY0mfy47LTYpw5DAQ8+BX39rp12vwNu7eV0b983sxaGjzlskqKUcKcddrVx26fgU7SgbJ5tlop0nuksFwIG5skmWH/14zRtXiEmNQ7dJ1sp6nwCNqrHLOBdIz4KQA3+WCej0PhHWYNzv0mWvhHLN30EimGNjN2jonXJtg9MM0qTyAyHW8h3bJUQ5PkFhUG4Z4vfs1EgjdIgogm02gqblSPMVldQ2R6HGiBlUqeSyjqMMTWqCDumorWTf1THsIK+0zeckkbqjwo/BXddv1FIJM3JbGWLPwDsWg2DsjmoBUcY8Mt+SbIzCwY+arQJF45iro504xJ5gxspT3G50WlsUp/4JtewjqB9eT8QiP+lHDBdpbNvLDGRP3gGgQp1JhF7kES5xVtmIDGo+Oc2LBeuGccODyhpygT/DoOHMtixf4ID2z4RifsmyYPKaLBjaykhsVu0XJNtwUH4//A8uhRQepMyV1NLM6nmhET2CW1632I4hvv4k9ShXFEKqSbpSVo/qZj91Zgxh70UjMa1b/pfWb1u2JsVxEPs/gtfvG9FYFGM43YWeCCVres=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021135927099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tm4wVC93dzUvMVMyR3NVbVRabmZ1Y1lWWHZlNDR6RkhnZnZzZjc1dHFvQ1Ba?=
 =?utf-8?B?KzZ1OUJrc0l1cjlDTGRBQWcvK2lHSXBnUHN4SncrbzlUZkRnV21xMXFCMnVx?=
 =?utf-8?B?bjZLNVdkWVNXT3paN1AzTUZVTDA3TTRZMy9HZk40Tkl5b1B3L1RZMjhtNkh0?=
 =?utf-8?B?L2IrdmVVbDZoK0JCTURkVVJaWUhTMW9GWGtGNjVKNEhLUENkbmZkYkJFaXBX?=
 =?utf-8?B?T01zTkFZdFhzcnFUemVvOERNUUN1R1RDZnQvbFEyTy9lTyt0YU9ha3Z6TWNz?=
 =?utf-8?B?YUZzUVZjdzlrbnl3YXdoUlc4U25JMzdZRUM2b0NsWWVCNWxQaWorUGkwRWZM?=
 =?utf-8?B?RThvR1RTY3A3YXVjZitmRXBpM21NWXpzb0lUd2JSeEtXNHAxQ0QwNGNkT3Vw?=
 =?utf-8?B?SVhwZVpjZm95NzRBMXROaXBQWjhuR0xtWExQcFhJTTFzdHdmQWQvMm9pbkNm?=
 =?utf-8?B?RHduVlpXZm1FMjVBc3Q1N0VLSzNCL09SZjFKbDdVK2lWWFh1cHAvM1hRd2dV?=
 =?utf-8?B?Q3RiMk10YS80SnNoZWRhak9SaU8yL0E4c1NlQzBCLy83cGxqajZaQ01ZNEc3?=
 =?utf-8?B?RHU1ZHVJZXdWcXY5UkpTd21IRjYwZDFJS09maWFvWDhRVFd4SjJFTmRLTDJw?=
 =?utf-8?B?NW5DdHVEeWJ0emZDemRBeVpZbVpnRDJsUXNKbXV1Z3U2TzVhOEhyMVY0WUVt?=
 =?utf-8?B?ZnJpVERHc0ZSTTdkZ0dDdldhTmpsMmFKSzZ0UlJjK1NGOHlOMHpyL1ZTSVVx?=
 =?utf-8?B?aXR3QWZod0tjenB6R01aQWkvNlA2dk5SUlJYd0krajhlZ2lnVmFhZFpDL0tk?=
 =?utf-8?B?bjBraGF3MDFlT2tmY3ZzQ2pUZlZNd0hJeWNIbkFPVmUveVpld0V1SWszSnF5?=
 =?utf-8?B?cFdrUW5ydEJWMmphSlZ3ZU5YTXl1eFphRUJrVDl1ekxXekF5cytwTjJoUExk?=
 =?utf-8?B?cmdZcERXcGVqN3NjL2l3NzFFQmJTNk9xOE9RbmlJVG9GME9VY3N2VXNhS1dV?=
 =?utf-8?B?ampoTzRLVm1rai9yQitkanREUVQyRkwrVVdZZGdmLzVRY1c0L2hOUi9UbWc3?=
 =?utf-8?B?OEVKVnI1ZEt0RzVwOG5GRDdaSU1Ya2R6MVZTbFZUaU9KZi9wbUVJYjdlelE5?=
 =?utf-8?B?M2tRNU1XNW82aWdKZE5lckE5U3JHNFRSaTFrRHFkTmRmOGcxM1BQMkVLUHlO?=
 =?utf-8?B?cmVQT2Z1VG14b0o5azBNU1ZYdmJmZU0vRjdsa0VmQTVwSWRRWkxrNnhwZ0Vi?=
 =?utf-8?B?ak5Lb1BOak1HRjgvMTJlcllneisyeEVWQjlpWlZ4UC9oYmdDVGpHeFh2YkZC?=
 =?utf-8?B?SkJROHdJZ1AyZDg4SUF2SWJVZ2NGWHY2NnFTU21md3FZbUMxN1pYY1NKQUY4?=
 =?utf-8?B?T3ZwaTlvRTdnV1NPQlBwUXhLczF6d050QTdHNlM3SXVtbFNsU2dHSGhSS3dt?=
 =?utf-8?B?YjVnaTJzRSt2UXpmK2U5K3RGOGF0N3luRzZkUXBPK0RTdjhvNzFIN2NCMEY5?=
 =?utf-8?B?c3ptNStZMkxGZ2JnTkhKR3oxWUdEM3FTcVRncUhTUEQxeFFjSXhFQWp2TVJ3?=
 =?utf-8?B?Umpqd3lsRnJPTk1lMDRyNVY4RkFhazlaalR4Zkt2ejJGdldkeEdXNlVTSXFP?=
 =?utf-8?B?Yll3Wk9GRjZDazlWSDd0V1B3eURhbHpCalU2YlRkOUFlZzhYd2V6OFl5K2JK?=
 =?utf-8?B?WXpjYjJaM1FJb2orQUdRZ0VtbGswOGtXRkNNU1hsMEtYcnYvWm0vTHE5R0lU?=
 =?utf-8?B?ZEd2VEkwVmUwUmhMUlFmdUROQ3lZTWJ2V1pCeEFzelVkZlJQRlpjb0NMRGpZ?=
 =?utf-8?B?c05NZDYvTHhZdFBJc21NSGJOamdXdldwOUN3cnpZUUxieUxyQzhqaURGSWxD?=
 =?utf-8?B?bFZneDVFUnNKSm1PMEFVTXJFeGQwVUxNRGp4Ujd6dkdybGhVc1hZOVR2THlE?=
 =?utf-8?B?aE5pSWRwa2tLdXpuNWwvMWJlRjJuTi9OL1k0TU5aS04zY1NFVWhSQkE4K2My?=
 =?utf-8?B?KzU2L3BxODJJUWQweTdONnovZHMzRVVJV0QwMXdOSUxzbTJyM0JhVFFzRDNk?=
 =?utf-8?B?dHVvUyt0K0VXaXpvdDFHMUIxdWE2R2ZsczB6S1JwTndMeXB0MzVNWU83WnVo?=
 =?utf-8?B?bnFVb09qUTdNRW9kOUlhR0pQSjRPNFlETnhRdkZSejh3SDBQbGtnbC9PTlk3?=
 =?utf-8?B?OHdHbVQwUmJNQU5uU0FGVC9CZkJwcjQyTG8wR0xQVEZwSFIxTWE0OENsTWhY?=
 =?utf-8?B?OFExSkovNkRlY3c3NTd1QUozOEFRanlyUklyeGRJaEt6WnJOQW50c3ZNbkJ5?=
 =?utf-8?B?UGRFR3MybExPZmJEKzEyeU9XZjB3WWxSNEtKVnovN01FaUNVSVVIdz09?=
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
X-Exchange-RoutingPolicyChecked: YXdbGGCTeuhUJMsoGQK4bLh6GjVoSfbnPjvvjjDyLifs9SS1nev7e9tUZs1O9MTnAGGyb+3AjMH/h0RtFg2lckgvPmc+GO4OB//+xnyqzSbaJ4ZOrtztH769ffi+2D7aS40Cs7moThYzcTKwm6luHYDSh/S6FDV07khERze6sTcisX11V/9m/Q3V1nTIgtJkc3tvZNKhonwM9lLA9H51AXN+KupJ52lpJSFnWoEQQX/kLo9kvxVrVFZjTvgtq9O+Pay9+sK0QEZMKMIN2br1kTIvZzoZb+me3O1cMixdfFgeDFzytUsJj8sLRQ/uUygXfC9VJfoLADtrjzph4Fr1wQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3466df47-2dcc-44e4-611c-08df34086997
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 08:58:04.5438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGdVp+ZKEcsFThHDp/WSxJq01h52W1/SPH8vslA3Gb65XZIcf4JQa26hXMVkzL9UnPsuSfAzLKuAStm6Z/ixMW7lONuxOPXnqKh9xKRt0P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwNi8xNV0gdmlydDog
dGR4LWd1ZXN0OiBTdXBwb3J0IFRESSBiaW5kIGFuZCB1bmJpbmQNCj5vcGVyYXRpb25zDQo+DQo+
T24gMTAvMTkvMjAyNiAxMDoxNiBBTSwgRHVhbiwgWmhlbnpob25nIHdyb3RlOg0KPj4+PiArDQo+
Pj4+ICAgc3RhdGljIHN0cnVjdCBwY2lfdHNtICp0ZHhfZGV2c2VjX2xvY2soc3RydWN0IHRzbV9k
ZXYgKnRzbV9kZXYsDQo+c3RydWN0DQo+Pj4gcGNpX2RldiAqcGRldikNCj4+Pj4gICB7DQo+Pj4+
ICsJdTggc3RhdGU7DQo+Pj4+ICAgCWludCByZXQ7DQo+Pj4+DQo+Pj4+ICAgCXN0cnVjdCB0ZHhf
ZGV2c2VjICp0ZGV2c2VjIF9fZnJlZShrZnJlZSkgPQ0KPmt6YWxsb2Moc2l6ZW9mKCp0ZGV2c2Vj
KSwNCj4+PiBHRlBfS0VSTkVMKTsNCj4+Pj4gQEAgLTE3NCw2ICsyMzMsMTkgQEAgc3RhdGljIHN0
cnVjdCBwY2lfdHNtICp0ZHhfZGV2c2VjX2xvY2soc3RydWN0DQo+Pj4gdHNtX2RldiAqdHNtX2Rl
diwgc3RydWN0IHBjaV9kZXYgKg0KPj4+PiAgIAlpZiAoIXRkeF9pc19kZXZfdGVlaW9fc3VwcG9y
dCh0ZGV2c2VjKSkNCj4+Pj4gICAJCXJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4+Pj4N
Cj4+Pj4gKwlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlY19iaW5kIF9fZnJlZSh0ZHhfdGRpX3Vu
YmluZF9kZXYpID0NCj4+PiB0ZHhfdGRpX2JpbmRfZGV2KHRkZXZzZWMpOw0KPj4+PiArCWlmIChJ
U19FUlIodGRldnNlY19iaW5kKSkNCj4+Pj4gKwkJcmV0dXJuIEVSUl9DQVNUKHRkZXZzZWNfYmlu
ZCk7DQo+Pj4+ICsNCj4+Pj4gKwlyZXQgPSB0ZHhfdGRpX3JlYWRfc3RhdGUodGRldnNlYywgJnN0
YXRlKTsNCj4+Pj4gKwlpZiAocmV0KQ0KPj4+PiArCQlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPj4+
PiArDQo+Pj4+ICsJaWYgKHN0YXRlICE9IFRESV9TVEFURV9DT05GSUdfTE9DS0VEKQ0KPj4+PiAr
CQlyZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4+Pj4gKw0KPj4+PiArCXJldGFpbl9hbmRfbnVsbF9w
dHIodGRldnNlY19iaW5kKTsNCj4+Pj4gKw0KPj4+PiAgIAlyZXR1cm4gJm5vX2ZyZWVfcHRyKHRk
ZXZzZWMpLT5wY2kuYmFzZV90c207DQo+Pj4+ICAgfQ0KPj4+Pg0KPj4+PiBAQCAtMTgxLDYgKzI1
Myw5IEBAIHN0YXRpYyB2b2lkIHRkeF9kZXZzZWNfdW5sb2NrKHN0cnVjdCBwY2lfdHNtICp0c20p
DQo+Pj4+ICAgew0KPj4+PiAgIAlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlYyA9IHRvX3RkeF9k
ZXZzZWModHNtKTsNCj4+Pj4NCj4+Pj4gKwlpZiAoV0FSTl9PTih0ZHhfdGRpX3VuYmluZF9kZXYo
dGRldnNlYykpKQ0KPj4+PiArCQlyZXR1cm47DQo+Pj4gPFRoaW5raW5nIG91dCBsb3VkPg0KPj4+
DQo+Pj4gU28gdW5sb2NrIGludm9sdmVzIGNhbGxpbmcgVERDTV9VTkJJTkQgd2hpY2ggaW4gdHVy
biBtaWdodCBmYWlsIGZvciBhbnkNCj4+PiBudW1iZXIgb2YgcmVhc29ucyBhbmQgeWV0IHdlIGhh
dmUgbm8gd2F5IG9mIGNvbW11bmljYXRpbmcgdGhhdC4gU28gYWZ0ZXINCj4+PiBhbiB1bmxvY2sg
YSBURCBtaWdodCB3YW50IHRvIHJlYmluZCBhbmQgaXNzdWUgYmluZCBvbiBhIGRldmljZSB3aGlj
aCBpcw0KPj4+IGFscmVhZHkgYm91bmQgYmVjYXVzZSBwcmlvciB1bmJpbmQgZmFpbGVkLiBJcyB0
aGlzIHNvbWV0aGluZyB3ZSBzaG91bGQNCj4+PiBiZSB3b3JyaWVkIGFib3V0ID8NCj4+IEkgY29t
cGxldGVseSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQgaGVyZS4NCj4+IFdlIG5lZWQgcGNpX3RzbV9v
cHM6OnVubG9jaygpIGluIFRTTSBmcmFtZXdvcmsgdG8gcmV0dXJuIGFuIGVycm9yIHN0YXR1cw0K
Pj4gKGUuZy4sIGludCkgc28gdGhhdCBmYWlsdXJlcyBpbiB0aGUgdW5kZXJseWluZyBoYXJkd2Fy
ZS1sZXZlbCB1bmJpbmQgY2FuDQo+PiBiZSBidWJibGVkIHVwIHRvIHRoZSBjYWxsZXIgcmF0aGVy
IHRoYW4gc2lsZW50bHkgaWdub3JlZC4NCj4NCj5wbGVhc2UgcmVtZW1iZXIgcmFpc2luZyB0aGlz
IHdoZW4gZm9sa3MgYXJlIGRpc2N1c3NpbmcgZ2VuZXJpYyBndWVzdCBUU00NCj5mcmFtZXdvcmsg
c2VyaWVzLg0KDQpTdXJlLg0KDQo+DQo+QnR3LCBmb3IgVERYIHNwZWNpZmljIHRkeF9kZXZzZWNf
dW5sb2NrKCksIHRoZSBXQVJOX09OKCkgaXMgbm90IHByb3Blcg0KPklNSE8uDQo+dGhlIGZhaWx1
cmUgY2FuIGhhcHBlbiBmb3IgdmFyaW91cyByZWFzb25zLCBhbmQgdGhlIFdBUk4gY2FuIGJlIHRy
ZWF0ZWQgYXMNCj5mYXRhbA0KPndoZW4gcGFuaWNfb25fd2FybiBpcyB0cnVlLiBJIHRoaW5rIHBy
X3dhcm5fcmF0ZWxpbWl0KCkgd291bGQgc3VmZmljZT8NCg0KT0ssIGJ1dCB1bmxvY2soKSBpc24n
dCBhIGxvb3Agb3BlcmF0aW9uLCBJIHByZWZlciB0byB1c2UgcHJfd2FybigpLg0KDQpUaGFua3MN
ClpoZW56aG9uZw0K
