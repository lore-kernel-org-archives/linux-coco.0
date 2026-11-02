Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793653965;
	b=MP3VZt7kqbNwK5cvE5wPxchwZcnnN/4vow0EVwOMM1EkUB8VEtQBBxMKYZT34mSun6eX
	 5ycKDY2hSBxqPBKyqJWLd43fpZe3ggzKjSw302cU3R0i6P01M8aSn1DUbVMjDEfhLXrUq
	 EA5mJWpnJW/aEZXZ/PlNW+nZ4RmzwIkWv7x0TLSkAxUMTtiZrfRhjbUyqm9GqS1MZfPad
	 sXjl2/Nnmm1ip5HaaHnt+cc1YT4hADJoDpbcsVaxfkXWiSp1D9YgiRnW2jU1D+agbEiph
	 e50MWt9xBbBIsENmPcFS1lxG0j33HoDOmb2jHyS5KJ9IUdEI9cABloAIjGvbxwmdqWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653965;
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
	bh=8p2yAIAQ7cDToTDLr0g/6ytnXR24MrZC3Sr/y70py78=;
	b=vyg5oqrCdgXndxNQX7EonFeOpV4cu16A2jcZ8vJdMbwjVCWhgFQjkdyI7WsCLBVjsCyR
	 TH5koLegGi5dv5Zf+6ksINkiryZtRTK5PBsQ0fST/TYlhXOCEJfIUmu6coc8NomJBodtq
	 ZdPMWZlxQTnZzxYfP12oRx4xIDV8HS4HrxzVJidgdX0ryMFP3yOVAQV7MBvQOK6YnyDGi
	 HCnoFyKIn/cS7ja6E5Zpod5Sl29RBZBmhZDUkeA4JTOOh/ywXrdYssVoXztNSUH2cTLXt
	 pveiGJyigcQxn2MLWr/YswR5ysEZ4Ma5Ue7ETIa9DJhwhnzh5X6QUWJDvbBZgHN58OQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSpKdCfL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE26C606A330
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 21:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE26C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JSpKdCfL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793653962; x=1825189962;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8p2yAIAQ7cDToTDLr0g/6ytnXR24MrZC3Sr/y70py78=;
  b=JSpKdCfLeRsLrOtjFib01Or1SzZIakkPQ7S+G6EyVLGaDS4powCVeLFc
   ulm9J68aQfcQhp3+2NwC1tY6b/vhvo8YHl/c06IHmaszhn+vYn2SeZDNt
   jvj7x9rOVXaOXsRehaLP/a9qIOAMY+ki0d4uqC/9SYm7/HJ3Ltq5i9jKX
   7RTz71YRaV6cKwu+C2+jxS02bFZxn3wQLe1q2V5POZnF453R6vB2aSHk5
   UwCZAEuMmBwa4HL4pabyKblI3wI/PpSp906PuyM8oNaWwHAU5JRHR/ZHl
   QypDib6hw6I+j3SRJcTpr0R6lz5fMPl4oq/ctD6nSKyAi/nDRBWPMgPTj
   A==;
X-CSE-ConnectionGUID: 4Bc3a5SfTaeu2JruV1Zplw==
X-CSE-MsgGUID: uYZiMtd5R4ShVP+HFJm3jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2261661"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2261661"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:12:42 -0800
X-CSE-ConnectionGUID: PSuAU718TZaOS45kvUh98Q==
X-CSE-MsgGUID: C17+/7bPTg+vvxrQh1uDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6067061"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:12:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:16 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:12:16 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQkeMB8ncXHLWuXdfLzycTpDS733Mf+w+/a5TS1/wkIJLtsACQms1xM79WeinV+GGvg0IwTM5QhAR3YfGDSyR3nXg2giMWxs6odU2voSV8Z7NypEJ0fXS6ueTodwVYi6TVFQlTXhVlD+qYBTvYyvBCwFLFlWysUo5CqP8lBzUxJP7vuATkBZ8Z8epHjWj2IY3SyIPVTfzRXN7S4T1U1Z5ws5kzX9D7AE0KajwtxIkzCWDVI0+R5VzxXx2yLo7EVRhcvVPJ7Di7TOFciN9DO7q6am5QSubGtafIaBp5iRifbiEkx3kp5vJqx/G1JXnRNMLTS3APOYgxAFheOacXiX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p2yAIAQ7cDToTDLr0g/6ytnXR24MrZC3Sr/y70py78=;
 b=yQEjaEYPizOMFAcIDtoSUarO4F+OYcGevlFJNLfI3POP58Uc5I0Jrx2FeZtCFQ+FqzafzDU8fcSlRO76tq5S+PZuiFN9Co0z2VI6WmZ6sJgtc5kXnwzmFq13npF/Jo5DXLoA5WqkBddN33bI4+GLY7KUHNVYcO1Fn35/tMBh3d9xbQiP+OGQtpyzf0kx8bjGWtKXGF0I0WgrOa5pTVPwL1HYQHyViTzxHVMF5huaUBTmDc2HGliyZ3jKr/2Gl1t0QMt12V06136S9t6V5Aq12M6j/TG5qzAcTNYo/3Rj6q19Ata3I1s0kfsvwrCHmfz7uFGR10o0pkVOO5sLNLFWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CH3PR11MB8096.namprd11.prod.outlook.com
 (2603:10b6:610:155::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:11:56 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:11:56 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
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
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugA==
Date: Mon, 2 Nov 2026 21:11:55 +0000
Message-ID: <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CH3PR11MB8096:EE_
x-ms-office365-filtering-correlation-id: a4150ce8-c3b0-4f48-4f98-08df3925ecd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|11063799006|4143699003|56012099006|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: qx6/cOhHDpBapE5b012oBejgvAoLgjBZNxagCFLmCJyzA15oU001GisOFwsrf4/5Q6rBg3TOJRemH3j2ibdYEA4u1X3UKk25DDqNRH4CyEyZRtEtfgK6DI2jSA0UwKA76nUeIJr1wQedVvXndhPQXKDKmO0tZQg0GOQNuUh+9NJgyK8s1duVk/1SV9A92fNAI0AdSq+Be7e16QWSSqfYYDJ81ki4UR4wmQbiyd0KYFxq1GOoUICi1V98C0nNQVvyix7ppdYD4A3TB07eLdyxEjWSM8gyyxsqqa/oCmu7i7iJnQSIyF17QSXbU+ft0yFD1Qci2eNwXHnNyLRIoQYqI4r2DkQszkg80Hl5A05a8XwLoq+3dyHRMmypSjQ2uNYyj2MfaPtJCoaSn3yPFbL/FpmqWd8MoEQpTOY1r+I305MFr3Mp4nIjsR1TIqU6XCjATaOrhQnznMLh5P899TjzWzaL9CyBOVZPCSBsvndMkzt5B25U6c0gdDSdHw2h6bdtOXGwNsx4qn0M0z40wRGYNWCn3m6QTl52bu+pqkBitsT69no2ZzV+Tvqf9PsOKyt5HWGGdvlxEKQlqWgwb6WJ2CQM7vx5JnWk0D0LzP348kK+Ur0kPYaxc1F3V4V6DYPCgFsHbQ0I1hAmnj71bWd7ybs9jtxr1L1f4MQ0pj00I/SSPqbxOj8t1qZTB0uftYiyOIBpMVFUl55KFtTcAtGKxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkM4MFRDaFVBVWUvcGtYdzJTcjl3Z0t0cDFoQnVZcENEMlQ2ejhndHM5WXdx?=
 =?utf-8?B?STdWODFYZXJoVlNQK2hsUmg3REk2MnNvTDJhSkd3ZEJrSVlWMld1cjlaWFAr?=
 =?utf-8?B?TlJWNzdoSCtuSjhnaC9LYkVmayt5N0tpNHVrRWlCWVFXdmIxa2EwOXlXSVlM?=
 =?utf-8?B?bDZKYUQrY0NyM29ZclFXdmNnS21NVXZPb3RrSVFVWWIwMzJ3Z2lJV3lMcEFJ?=
 =?utf-8?B?YTRuZmp5dnhoTFJ4VGkveGpOZGVKVVIrdUtMRkdpMEMza1FSak93ZlplOEM2?=
 =?utf-8?B?c0xlTGg4ZFVaSVV2OVFWQnRHcUEvSURjeW9aNXFSQW52RG1xSnVRZ3VhZGxy?=
 =?utf-8?B?U2ZLNXI2Q05QL1pkVTNIU2R5UkY3MEF6NzRWT1BpSXArYjM4MmM5d0RLTm1h?=
 =?utf-8?B?WXM2MEV4bStKcnQyamkycTdXSHJDZVdLQlJERVU5U1VyODZTK1FUTDB1QjdJ?=
 =?utf-8?B?YitaTGpqMk9RbC9iakJZQnRvT1VmUkZmcDRES3pUeDIwZUJFNTBRaVk5RWlw?=
 =?utf-8?B?dXpnd3Q1bEdrQ1V1VW9yanpzQ0dzV1JBRzV6azdXL2xEU0FHNlVxcHNCeGZv?=
 =?utf-8?B?YnFJWDJwbnEzZVR5a2UxMVJrbUQxSEZNemVLazVPeHdEaHlmZmt4cnJzQUFl?=
 =?utf-8?B?SUZHaUlLMHc4RmpaSFhXcEFaS3JzZW9zdjBjZEk0WFlPR1RZcHoybWYydFBq?=
 =?utf-8?B?bFR0SFdpOFZJZTczVS9zazdKQ2VwODJHWm9KSVVLV1dGN2Q2ZWE4Tlg0eHdQ?=
 =?utf-8?B?UmF0eGFqamNCY0lObHNOVEdBeVlsdzcyOGpHdUU5ZlFtTU9vY2pUZTd1clNZ?=
 =?utf-8?B?THlFVWNwTnBuMmZ6aGNWVUFreVFMYTFQN3NaRHdlczVZQjNEUkd1NG93QTZj?=
 =?utf-8?B?WmQ3OC9TbmVzUkNaYWkxRHRHRzZEcjhmcDFHcE42aFJQV0x2U2dBb0trWHBh?=
 =?utf-8?B?OXhkK2R3THJwZFFyeEpaSnFiektEeElRMkZLanhGWVpRcDhXOU92RjRpNW1F?=
 =?utf-8?B?SkVDNWluLzVjWGdQUzc0OVcwUGR5b2l6ck10RXU0WkI2dXdnejBNNHZqdGha?=
 =?utf-8?B?WURCM2Fib1hiQncyNzViQUk4L2xXM2pzZEhuYVpYd0RscTQ2WFZhZlJIellu?=
 =?utf-8?B?aGx1Y2JRc09yODA1RmJxblF1QytVVWRkZnhYZjEva0lGb1lmTnJvaWo5Mnlp?=
 =?utf-8?B?NXRKWjQwdnZVWlNCbkhKQ0R2MzV0NEpJbldXT0dJK3phR0o5VGZNb2M3UGFu?=
 =?utf-8?B?QzVvWmJKREdIeXBacHRIYVVMZjZydnlIT1RrWEZDMjJYZ2VBTXhqVHhablJl?=
 =?utf-8?B?dzhkNmFrU05iYXZmTEZIejNyMVF6MEZqbGh1TG9POGhTT0ovV0hNcHcxSzQz?=
 =?utf-8?B?L0RNYXYxT3p5akp4aDRyZXNkRGxSVkFPNUlNOEFvSG5sdTY2TmNNcnhMcm9R?=
 =?utf-8?B?ekM2dUxKWVlQNGE3QWJBZXc1bUkvckozS3haRE5KcmNMVmV0UHpMMVNVeVMv?=
 =?utf-8?B?UE5uVlRzbjR3VEF0YXBuaUhsSlc3WmZ4VVR1MjhsTVNqM1lUdGhSUm96dkJx?=
 =?utf-8?B?SFRLdFR3NHhNV1pReXNtdGljL0pjeXhLUVJ3d0Y1NDNLU3RBaTFtczFkaFRz?=
 =?utf-8?B?NFZOV1owOCtqSEFkK2g4Rkk5akhWdzlUNnQ0MVhCZjVNRjVHSWtnNG1vQ3Rz?=
 =?utf-8?B?UkpwUlZEb3NteTF4YTd4STlHaXZuRUorVDd3YldPVStjeWRkMlZ4UnRtNVVI?=
 =?utf-8?B?d1RnMGhock9jM3RlaGpIWHFRUU9EOGRXQmhmQ2E1ajZ0Vi9qdG5mbWFnRlMy?=
 =?utf-8?B?dFI1SjkzdjM5VU1YZE5HTnplK0F5cEcvTzFVNlRBLzM4ejlEL2xqbFV2UEdF?=
 =?utf-8?B?WDIzZlppQXNuVEZOSy9pdENxb2YxVVEzZSt3NmVPTWErUkFnOXkyWWxTdm9P?=
 =?utf-8?B?ZS9HQXFYUUhKRjVvTGFaSnBYZGk3UVoyVzM0ZUpHL0paZHp0YWRtMUk5RWdn?=
 =?utf-8?B?TG1zWUJld01IdTRYd2ZlRjh6SkF4Ukw3bjkwOE9XS0lRVk5JOHNUZFpqOGlS?=
 =?utf-8?B?Qzg2OWJZeWZrYkliSE5Wb0VxL0t0QlAyRkJYU1p6aXRxditxT2t3V3JaZkxo?=
 =?utf-8?B?RjBFRWV1S1V1SzFXZThqTHIrR0c0M2VnenVzYnpMd093OUNIK2oxRXBOT3R0?=
 =?utf-8?B?QkMzZmljT0RvWE1PU0srZTBwN3ZwYzBCVHRPOStkN2VIY0s2S0VBUmozNXNR?=
 =?utf-8?B?U1pVNEVPU0s4dlloZmlCY2t6cm0valUrSFFmTSs0SDZzVHo3U2VBVDNGQkFT?=
 =?utf-8?B?NHpsQmhUcU9TT1ExU1h0bHB2N1Z0Zzl2SmRYTURYZWdWdkt6S29BWkh5eEFB?=
 =?utf-8?Q?woq615+2bsPX3JWg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D551D72F71C5E340B8747655E5EF8D35@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: B5sQazjKNUxm+9dxAjPBs2qH/HYZ4di5hNGg91lbsSX0CjT6XZFTjNcYw9KRNwtCiGJltOmK/JWG3N7GXunexqZrCRKF8GkJLSD1ewxxxhfBaHSIhWVURp619/yXmpC4CEb7e5y+mY3U3BwgwFdvrGfw4lOMPeDLog5uKZYN5XCBq+Z6X2lbC+tW84Q8UG0Sl099dX7aRi8tWpeyXH3rQ+Nrb0l0GrPekoyXOG1s6nrVFsQ4qW7C0gB5trjSloDMjPzzmjlJZmgyEmkFPzrOA6ymHXSA2U6mdnD6pNkvHxlQ4gNDCCagKRl7vaVWP96i4DHcF4xFJ/1byK/6i14o5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4150ce8-c3b0-4f48-4f98-08df3925ecd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 21:11:55.8928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjjq39U9KYrqjZLz+G9/SbFpXPS/ag625u6WJoNApxM40A+VApxdf2O0YKAElTg55/7LfeX/XnEeoQFzbqdaxLfO7YKgR+hKRGHPT6CMsFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDAzOjI2ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IEkgd2FudCB0byBkaXNjdXNzIHRoaXMgZnVydGhlci4NCj4gDQo+IElmIHRoZSBUU00gZHJp
dmVyIHN1Y2Nlc3NmdWxseSBsb2NrcyBhIGRldmljZSBidXQgbGF0ZXIgZmFpbHMgdG8gdW5sb2Nr
IGl0LA0KDQpDYW4geW91IGV4cGxhaW4gc29tZSBjb25jcmV0ZSBzY2VuYXJpb3Mgd2hlcmUgdGhp
cyB3b3VsZCBoYXBwZW4/IFdlIGNhbiB0aGluaw0KYWJvdXQgd2hldGhlciBpdCBpcyByZXF1aXJl
ZCBmb3IgYW4gaW5pdGlhbCBtaW5pbWFsIHNldCB0aGF0IGRvZXMgc29tZXRoaW5nDQp1c2VmdWwu
DQoNCj4gdGhlIGNvcmUgY2Fubm90IGNvbmZpcm0gdGhhdCB0aGUgZGV2aWNlIGhhcyByZXR1cm5l
ZCB0byBhIHNhZmUsIHVubG9ja2VkDQo+IHN0YXRlLiBUaGUgZGV2aWNlIG1heSBzdGlsbCBiZSBs
b2NrZWQgb3IgcGFydGlhbGx5IHRvcm4gZG93bi4gU28gYmVzaWRlcw0KPiByZXR1cm4gZmFpbHVy
ZSB0byB0aGUgY29yZSwgSSB0aGluayB0aGUgY29yZSBzaG91bGQgbWFyayB0aGF0IGRldmljZSBh
cw0KPiBicm9rZW4gYW5kIHByZXZlbnQgaXQgZnJvbSBiZWluZyBhdHRhY2hlZCB0byBhIGRyaXZl
ci4gRnVydGhlciBsb2NrL3VubG9jay9ydW4NCj4gc2hvdWxkIGJlIGZvcmJpZGRlbiBpbiB0aGUg
Y29yZSwgRXhhbXBsZSBjaGFuZ2VzOg0KDQo=
