Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793071747;
	b=dfpF7A0fL4DOaQ5EgVH4wrBG6+VmCU6t8477nrCXKB+OQV4fXWpuAgbQlF2YuUOTwQPz
	 USK9yVUbPNqGCsNg0rMJzNuP7zcLaEUesq27sf61qV4nX5E6boueEcq+zqtJUDb1tjBaO
	 Ub1dNxTE0xm0ccSND/mDM5EsfD9+dldHNjz0/TjtHQx9Drn+NlE4ofiAwJksRUnCy5+tO
	 LcWRgVgA/14H0+ePJl3AaXOTQEwn8zqIOXlB1Chp/5O7Pao/AHrhV0IIwilnNS1S9lOFm
	 b0s/fXcaXa/QRXWGRAzXEAg6fhU1II3EOlsbkubfQKtKMwd4pA8kzttsCAzDxkmeAlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071747;
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
	bh=jIjiRgDj9HZOSrfaDjBtJF1gmWvEcTTHYmrU2UpuDa4=;
	b=G/couZg9hpLdk+G9QJsUeKmXBYxwjJ5a4NF7WNDDrm1brpVSovLImKCkkOup+XQBxvvy
	 ZReEmJj4/GarGcuWup/e0L07Gj4163sKykfDIAFd3CDkh9o/ZCCj3AQsVXdt7qHXY8f07
	 5vBIZIrCyp885jrO8u8xeDMkNBh0cXRCRulQwz5KmYcGFoLBub5FgW8kIWcnIsg/8Oc6i
	 1r5/fQ5YHMFvt7eEkAiRAT6EYrGKQzdItZ+urO+m2fJOdN9fBxG1ScT2aKMpfh0oipnuo
	 k9gkA3O1PVL/QCmeios+XRgOqCAGZK20KHwRydtY4voqYgIPhTxVqeHyzNb/RAouyiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4d7fPMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED230606A31D
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 03:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED230606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4d7fPMg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793071746; x=1824607746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jIjiRgDj9HZOSrfaDjBtJF1gmWvEcTTHYmrU2UpuDa4=;
  b=V4d7fPMgF+Lqe61R6Hw/kWv9zgMYRD4OajbBMK75aerK0RdVob55b8tb
   cgTh3nHhfJSQk1y1gi0/HETGLhtziIFYDpO2qyW8xCgxa1jc/Z7Elqwi5
   RsEE2UFn/+bA6vp0UlEmypLa2GlDfSIEXLkPCoBstg0ktd7YKLS8x0O88
   6Dan0y0L53r2cEKzHJPapKv8lwhT/WvtYGzBeEmCqZNC67FjzEtt+wuYq
   SJwgLE/UrnywMS9bLMigVe2C6W9XyiZ60BVUW09QGYocWmvxVhdyrWsFn
   Of0TcpKYXQRtTUgVIQAlFvVoKPLdY7XuRWNaB/MWdTzaIb+NOasHA0to5
   g==;
X-CSE-ConnectionGUID: vg94NSWQSzSMUuSLU7wIpQ==
X-CSE-MsgGUID: s/VX8xVCQymNlyjfQqRNOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1653219"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1653219"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:29:06 -0700
X-CSE-ConnectionGUID: OcfUdpXSSGeyE74vjndbeg==
X-CSE-MsgGUID: OgoqC11xTQeahrOGhhZhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4446244"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:29:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 20:29:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 20:29:04 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 20:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYU0dzxg7mwO5EygyLrKQ54Gofi8IKOPi1Q7iWSCkNh9gq7X3bq/EKhQmtekcCXvv4Dx+tBI7CLl0tt4hnEbPG9s6hihVyuJX9CVhJAZfn1fgZJHZJ6gTOMvAVZ8x5fEOm8r5/kggVD32viMPydcKCES6UzxabFMoVaa/K5qVcge+zBJjXGp7ofmIbAhmYl9ff1JskjiJyPp+qOIpLK/3MLx7ZdAIkiIxDw5iiuoxG+FyJ3Tx6HKiPurWzX7R2YkvMdBsSRcivl6ZWavlicM82+ocbnn/x6TVrEA8BKPmG0HFh/glL9Dw4xNwvdSQAQpr/z+VqD2odDOszrgfhYAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIjiRgDj9HZOSrfaDjBtJF1gmWvEcTTHYmrU2UpuDa4=;
 b=ENBGjcr4AN3ypUMRSPxxKtyHfK0DNFc1VQgiT8NWWZ9fumitP+27xRYVxgf1SA2qagswr+0BphdGYCxceNrCCPTL7Ql2aLT+Ih3lGhX8WQ/3AG1E+akpLUG3Z00zPACZIdxHaPJvdEIHvNeSDv3TjPtH9E478vkI0R51g+WC60lfhrj8kqp2WHzzWG+oTBh88X7DqVbXUOoiOyEH5Tf+w7Mz91EstLlg9A0NrUE+dr+RgZDXkaGhWfA8lonuX/oFDIEu6FR38G01nPmDzcfLhOdGBSAc+GnvCdoS5o8nz+Tz5bxZ6LwX9LMqAykq1buWau6Zrqzni9AkrMKIlq8uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 03:28:43 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:28:43 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
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
Subject: RE: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Topic: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Index: AQHdS9q3p3OwHlhwLEuB5opu5u+CqrcPK4AAgAG354A=
Date: Tue, 27 Oct 2026 03:28:43 +0000
Message-ID: <IA3PR11MB913636B33BDBD49DBC87555C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
In-Reply-To: <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SA2PR11MB5162:EE_
x-ms-office365-filtering-correlation-id: 71eff920-f692-4a62-e862-08df33da66d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|22082099003|261026121527099003|18002099003|3023799007|56012099006|11063799006|5023799004|4143699003|261022075727099003|261022105027099003|261021123027099003|261022113327099003|261021121427099003|261009223027099003|10067099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: 15dm3NcF9VDiAIuHagjGmPx+rvKosevrGlpLE5grNrF/ieDLet9OJ0Jkv+IrjvMYiZ1aiAgi2+iENp1M/u6dGez1KQGUXBIKvW53L7KFqWwywoSTndOi0k3OZ9938OJCWekgcDeRInJDo9ggwayMg0jaW41F7r3a2C1OWoAhCwR9xK7gXWxSZSvE4jHY35NN49JPgMeEWjhEEf6zQ32a4Q0+u8x7BZh1sU8msvV29q9S8w0jiId3ciqmWOyCLAp19Bc7EPzNjiAaT4E5K4aUEl8MdFhd2J8STDEQGHKoqAmtLP9GlK8Wad79KuKEFxAmBLsdcrqkQiATCY4QKidi2oLZwXZy8tuorqSHelumWR9QfDBC8WwJX1lOiGeYOY/HAzoht3Mc6Jrc7raWehfuzWyaaDecT8dHdndRWnPARR8IpCW80/Fg+OOFKknzoHi3YETrKg3fggNrW1zRnqHk3SB2zpdwI7nFsKOQ/GKl4zpuVUN8hkN16Z8sL2zUg7nnWe+uFLKEVDXspPj7dQuh+1oiecZr35N3Ovq1HCIIA9MlMeoe48FyJckAPLZZJ7lZgJyBKOY8rMfold5UMvDLc+RiTSd7JYu5X4PTNJoVKTZ+eJySBatsshWGbDtewQRTgD0Of1IOSeDBKhk2tFOStHXGoJ1j8pkw0DokxUcsKzG+IunSlCwOeKWt/j5QE9Hsdi30afYec0EC5qyLpetyw6/ztQ6YdY/xZ91PDpMwFWU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(22082099003)(261026121527099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(4143699003)(261022075727099003)(261022105027099003)(261021123027099003)(261022113327099003)(261021121427099003)(261009223027099003)(10067099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDAwUkNsZnRoc0RyNkFZdGF0b2NVa1ZBdUZUY1FnRXRQSWRla3E4ZEV2SjB4?=
 =?utf-8?B?N0ZieUtHOVVaOVNuNTNWUTcwQ1N6NG1wbUFQMFc1aUZDZ0l1T0M1MUMydnZG?=
 =?utf-8?B?RU5EL0tzTVVlS3JnVzgvOU80cmpia0k5Q2x4KzNnRXplOG9CU2QzQTZkSlRp?=
 =?utf-8?B?dHdvT2k2SUdpM3lsc1JvbElyVW9Wb0VoM01BaFUrakVYLysxMUtFR0ZjTGxI?=
 =?utf-8?B?Vm9wTkVZbDF6UkduQnpPWkN6cENsWmU2cW1RaDJoVkR2eXZXZ3l2TnJMM1pN?=
 =?utf-8?B?L0JuQzIyQWZJejBYRFlnVDJnRW5BVzhmcGJHOWkzSDVGbkw4OEFYY3ZmbnNo?=
 =?utf-8?B?bnJiYmd4VU5xZEluUGZxSkUxRzlhVU1kbnB2UWpLMjlLNkJxMWFZa3pMNXYw?=
 =?utf-8?B?OTVzMEZEOWNkYm53OFp3Szd6RFF3NkxiU1hzbHgzRlNqTlpidVdFcWZ0Q1pr?=
 =?utf-8?B?WnhkUnEyaUdqR0NGSEJ2SDF2T0w3bkZneGhXM1k2M3BpWmlnRXVaTDlhRTdz?=
 =?utf-8?B?M3hmaS9uUCtLZ2dTWHVvV2ZXQXpCR3JyZGJCdEI5Nit0b01SclArSC81YVRo?=
 =?utf-8?B?SGFwOEhpU0UrdUN1cG9RYXRnTE9kUi9ScXFzSGRQanozNktlWWJMT3ZLd2x4?=
 =?utf-8?B?RDFOL2lMM2MzMjR1cEtRMUhqckZzY0NocWVrcDk0eHFWZmpZcHNSL240ZmMw?=
 =?utf-8?B?RVBkaFdOMGFCNVhMZ09aWWxVWGtBOUdWa3g3bFlkZDR1RGhKeXpsaDcwU2hp?=
 =?utf-8?B?bnp0V3pzV2JLN3N0VEdFbTJiWkFqcFNOQUlaeGxVemtrVGNNQmNnYXlrcnZ4?=
 =?utf-8?B?NjYyNFV4dnNDeENzNmtqSk0wQ01zTm1CL2ZGUGdhc09BeVNzVXNnUzlRSGVM?=
 =?utf-8?B?aUYzZ2NrVzU1Ykd0RlV1V2JrYnZ4aDJ6eU5oQ2dIdWV0M245Mmdham5JLzNF?=
 =?utf-8?B?UlQvNHdNYktiZGFEMWdhZzR1NkduQU5CWWtMNWV4NUZYekorbHdpbUZtTlFu?=
 =?utf-8?B?RHM3UmhzWXdrME1qeUdXK1Nwc0syd2p2WFcwVzQzRSt5ZDRCSk45cXdtNjE4?=
 =?utf-8?B?VWI5WFpsVHQrWmIrQy9xVXNaLzJVYUFGSVk2U3lQeXphTVZVMGxLZGFlaitp?=
 =?utf-8?B?ckhXMkxMM0lDUU9RalFzSUlkVDNHamdiMzhYWVRMRVpWZWlib1Arc1JsajBi?=
 =?utf-8?B?bUd1U3F3T0o1djBLQ3BNd2RZNTFYZkJrZ3Nid01jaEUwQWloZ2JYTVZrK2Ru?=
 =?utf-8?B?VUI5V1p5WStTVmRRNjN0ZWt5bDJtV05QZzVnV1RaRjROelF0T0ROSlRtakhi?=
 =?utf-8?B?M21TOHMyNDBja0VqdkFzUlljQk9qTzZodXJoVmw4UkpiazAwYTAzaHNlR1N2?=
 =?utf-8?B?a2h6WllFNlo0YWp5MWxkZTNIQ0YyOWNoS1RYb2tSby8xNG5ZUjhxZU1Hblcr?=
 =?utf-8?B?WjlteTBHRFFxNlpLVzJidEVmbkdpQmNNMnBLZzhmWHpJLzZRRWVNekhZcnRm?=
 =?utf-8?B?ZGd6VXJCMW9IV2E3eFJZMjVuZ1B2VWNRNVNxN3hxaUF5SS9EUnc5NkV1REdX?=
 =?utf-8?B?bkgzelJmVUpWaTdHbnFMNEZ3YWUzM0J4QTN1UENhUGdubVQ5NGtBOU4zR2NF?=
 =?utf-8?B?dHZEeVNteG80STREVEZJMTBWeWF0TnNIOHRaWWJvd0VDL1ltdk1aZjFkSlpv?=
 =?utf-8?B?VVZ4WEVJR2FSZDN3clBROVlLb204MURNL0Z0ZzBCaXFRWUN1aUpCSVFqRTZv?=
 =?utf-8?B?aitVYnVoK2tMazBIVHYxZER2UGxCK0dKbkgvem04OFZRODJ4MmtrSGJQKzhR?=
 =?utf-8?B?VjVlSTE2WVExZ1c0TlBJTC8zMGorOEdWSkx3eFUzU3E3aFdVOVBhQUJNR05F?=
 =?utf-8?B?Zm11VSt0Qi9TekxoMzlFbUo5ajU5a3luTU1tZUxpVmMwcndWZlBaWTRUcktQ?=
 =?utf-8?B?elFWbWZYT2ZFTFFudW1QMmNHcHdlUytLNS9iN0MwMzFZajM2bzZFcE1tWVVv?=
 =?utf-8?B?MGhYclFrZnM5WWhpdFplV1ZYb094MUFIbksrQ0tOa3hFY0RxaW5YOFd3a1B3?=
 =?utf-8?B?SHAxanp1ZUFSSTJSZTlBNzVtMlVIY21XazBaK2ZWZS85U0xIK2M4Y1BNdUNv?=
 =?utf-8?B?WGlSOGs2ZStZMEVmUHhJT29xeFhncFAyblN3WlZmcU4vQ0ZzZ1hXVnNuRTlj?=
 =?utf-8?B?UU5sTGRLeWgxaWk2OHRUMnBqWjBzQmFNcXVMRGU3RWpJTFM5VXhuMzUwdC9W?=
 =?utf-8?B?Q0lmR1dDT2J0VlN3VWRJL01Xb0Z6QUwraGwvRG5KaEsvV1A5Vk02MTJiK3dv?=
 =?utf-8?B?dStFN3ZUaGtCNU5zajZGMldhWDR1NkZLOGJmdzR5eXdqMXJXWjJwZz09?=
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
X-Exchange-RoutingPolicyChecked: IQEWisnzeyEKwm9QdXQoY/d6VvykGIVonR/ZheEg0BV7GIhKeOG8+ddU6GLwJnlOr/a5aff40/oXLdmTP4bG3/TepE69HfSPfwVAXHNWSSHC4gUXVRDckxLGczNjxPAO6bgleEC9pGFLI9q3ZmYFDg8qI2gA7ugXRC4QHvipuZMdl1QzPv0DruesD9k1/nf8U4t6YnTfAA0/ao149ogFn6Nd7JbYU+DAM7pqVVkJFafzoGJv8TyK0cdwjoPkBZtF+bY+z1aQ5YNXqNOkuHrYlWT4Y5Fy2vURiGJhdp3wv3MpiJZrc5QXgEiEKyzA2nq3xhOkhIjPuaCMPdTZsV+8Mg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71eff920-f692-4a62-e862-08df33da66d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 03:28:43.0932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JO3nJfQoipUacKUHK+UQBJvVirHtsuXtsRyTQxNT+uEVsDmtjXD+c4BziQECfTztFlnyjQrUNeg6EiUdcHaHr0zUtL809kKpvuZ3Dq5FSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMi8xNV0geDg2L3Rk
eDogQWRkIFREQ00gaHlwZXJjYWxsIHdyYXBwZXIgZm9yIFREWA0KPkNvbm5lY3QNCj4NCj5PbiA5
LzI0LzIwMjYgMTI6MTAgUE0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPj4gVERYIENvbm5lY3Qg
aXMgYSBURFggZmVhdHVyZSB0aGF0IGVuYWJsZXMgc2VjdXJlIGRldmljZSBhc3NpZ25tZW50LA0K
Pj4gYWxsb3dpbmcgYSBURFggZ3Vlc3QgdG8gZGlyZWN0bHkgaW50ZXJhY3Qgd2l0aCBURUUtSU8g
Y2FwYWJsZSBkZXZpY2VzLg0KPj4NCj4+IFRoZSBURUUtSU8gRGV2aWNlIENvbnRyb2wgYW5kIE1h
bmFnZW1lbnQgKFREQ00pIGh5cGVyY2FsbA0KPj4gKFRERy5WUC5WTUNBTEw8VERDTT4sIGRlZmlu
ZWQgaW4gVERYIEdIQ0kgdjIuMCBzcGVjaWZpY2F0aW9uKSBpcyB0aGUNCj4+IHByaW1hcnkgaW50
ZXJmYWNlIHRocm91Z2ggd2hpY2ggYSBURFggZ3Vlc3QgaXNzdWVzIGRldmljZSBtYW5hZ2VtZW50
DQo+PiBjb21tYW5kcyB0byB0aGUgaG9zdC4gVGhlIGhvc3QgcHJvY2Vzc2VzIHRoZXNlIGNvbW1h
bmRzIGFuZCByZXR1cm5zDQo+PiByZXNwb25zZXMgdmlhIGEgc2hhcmVkIG1lbW9yeSBidWZmZXIu
DQo+DQo+Q291bGQgd2UgYWRkIHNvbWUgY2xhcmlmaWNhdGlvbiBvZiB3aHkgdGhpcyBndWVzdC1o
b3N0IGh5cGVyY2FsbCBpcw0KPm5lY2Vzc2FyeT8NCj5pLmUuLCBleHBsYWluIHRoYXQgc29tZSBk
ZXZpY2UgbWFuYWdlbWVudCBvcGVyYXRpb25zIGNhbiBvbmx5IGJlIHBlcmZvcm1lZA0KPmJ5DQo+
dGhlIGhvc3QgVk1NLg0KDQpPSywgd2lsbCBleHBsYWluIHRoaXMgaW4gdGhlIGNoYW5nZWxvZzoN
ClNvbWUgZGV2aWNlIG1hbmFnZW1lbnQgb3BlcmF0aW9ucyByZXF1aXJlIHNlbmRpbmcgVERJU1Ag
bWVzc2FnZXMgdG8gdGhlDQpUREkgZGV2aWNlLCB3aGljaCB0aGUgZ3Vlc3QgY2FuIG5vdCBwZXJm
b3JtIGRpcmVjdGx5LiBGb3IgZXhhbXBsZSwgd2hlbg0KdGhlIFRESSBpcyBhIFZGLCBpdCBoYXMg
bm8gRE9FIG1haWxib3ggb2YgaXRzIG93biDigJQgVERJU1AgbWVzc2FnZXMgbXVzdA0KZ28gdGhy
b3VnaCB0aGUgUEYncyBET0UgbWFpbGJveCwgd2hpY2ggaXMgaW5hY2Nlc3NpYmxlIHRvIHRoZSBn
dWVzdC4gVGhlDQpob3N0IG11c3QgdGhlcmVmb3JlIHBlcmZvcm0gdGhlc2Ugb3BlcmF0aW9ucyBv
biB0aGUgZ3Vlc3QncyBiZWhhbGYuDQoNCj4NCj4+IEFic3RyYWN0IHRoZSB1bmRlcmx5aW5nIGxl
YWYgY2FsbCBhbmQgcGFzcyB0aGUgc2hhcmVkIGJ1ZmZlciBwaHlzaWNhbA0KPj4gYWRkcmVzcyBh
cyBhIGRlY3J5cHRlZCBtYXBwaW5nLiBBZGQgYSBydW50aW1lIHBhZ2UgYWxpZ25tZW50IGNoZWNr
DQo+PiBmb3IgdGhlIGJ1ZmZlciB0byBlbmZvcmNlIGNvcnJlY3QgdXNhZ2UuDQo+DQo+VGhpcyBk
b2Vzbid0IG1hdGNoIHRoZSBpbXBsZW1lbnRhdGlvbi4gVGhlIGNvZGUgb25seSBXQVJOcyBpbnN0
ZWFkIG9mDQo+ZW5mb3JjaW5nDQo+Y29ycmVjdCB1c2FnZS4NCg0KWW91IG1lYW4gYmVsb3cgY29k
ZT8NCg0Kc3RhdGljIHZvaWQgdGR4X2RldnNlY191bmxvY2soc3RydWN0IHBjaV90c20gKnRzbSkN
CnsNCiAgICAgICAgc3RydWN0IHRkeF9kZXZzZWMgKnRkZXZzZWMgPSB0b190ZHhfZGV2c2VjKHRz
bSk7DQogICAgICAgIHN0cnVjdCBkZXZpY2VfZXZpZGVuY2UgKmV2aWRlbmNlID0gdHNtLT5ldmlk
ZW5jZTsNCg0KICAgICAgICBpZiAoV0FSTl9PTih0ZHhfdGRpX3VuYmluZF9kZXYodGRldnNlYykp
KQ0KICAgICAgICAgICAgICAgIHJldHVybjsNCg0KSSB0aGluayB0aGUgdW5sb2NrKCkgY2FsbGJh
Y2sgc2hvdWxkIGJlIGRlZmluZWQgd2l0aCBhIHJldHVybiB2YWx1ZSBzbw0KdXNlcnNwYWNlIGNv
dWxkIGNhdGNoIHRoZSBlcnJvci4NCg0KPg0KPj4gUGxhY2UgdGhlIGltcGxlbWVudGF0aW9uIGlu
IGEgc2VwYXJhdGUgdGR4X2Nvbm5lY3QuYyBmaWxlIHRvIGtlZXAgVERYDQo+PiBDb25uZWN0IHNw
ZWNpZmljIGNvZGUgaXNvbGF0ZWQgZnJvbSBjb3JlIHRkeC5jLg0KPj4NCj4+IENPTkZJR19URFhf
Q09OTkVDVF9HVUVTVCByZWZlcmVuY2VkIGluIHRoZSBoZWFkZXIgZ3VhcmQgd2lsbCBiZQ0KPj4g
aW50cm9kdWNlZCBpbiBhIGxhdGVyIHBhdGNoIGluIHRoaXMgc2VyaWVzLg0KPg0KPkknbSBub3Qg
c3VyZSB3aHkgdGhlIENPTkZJRyBjYW5ub3QgYmUgaW50cm9kdWNlZCBpbiB0aGlzIHBhdGNoLi4u
DQoNCk5vIGZ1bmRhbWVudGFsIHJlYXNvbiBpdCBjYW5ub3QuIEknZCBsaWtlIHRvIGdyb3VwIHRo
ZSBLY29uZmlnIG9wdGlvbg0Kd2l0aCB0aGUgVERYIENvbm5lY3QgZHJpdmVyIHN1cHBvcnQgc28g
cmV2aWV3ZXJzIGNhbiBzZWUgd2hpY2ggZmVhdHVyZQ0KdGhpcyBDT05GSUcgaXMgdXNlZCBmb3Ig
ZWFzaWx5LiBKdXN0IG15IHByZWZlcmVuY2UsIEknbSBub3QgY2xlYXIgaWYNCnRoZXJlIGlzIGEg
aGFyZCBydWxlIG9uIHRoaXMuDQoNCj4NCj4+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9uZyBEdWFu
IDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBhcmNoL3g4Ni9jb2NvL3Rk
eC9NYWtlZmlsZSAgICAgICAgfCAgMiArKw0KPj4gIGFyY2gveDg2L2NvY28vdGR4L3RkeF9jb25u
ZWN0LmMgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmggfCAgMSArDQo+PiAgYXJjaC94ODYvaW5jbHVkZS9h
c20vdGR4LmggICAgICAgIHwgIDQgKysrKw0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29u
bmVjdC5jDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2NvY28vdGR4L01ha2VmaWxlIGIv
YXJjaC94ODYvY29jby90ZHgvTWFrZWZpbGUNCj4+IGluZGV4IGIzYzQ3ZDM3MDBlMi4uMmFiMmRi
YmRkM2QyIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvY29jby90ZHgvTWFrZWZpbGUNCj4+ICsr
KyBiL2FyY2gveDg2L2NvY28vdGR4L01ha2VmaWxlDQo+PiBAQCAtMSwzICsxLDUgQEANCj4+ICAj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+Pg0KPj4gIG9iai15ICs9IGRlYnVn
Lm8gdGRjYWxsLm8gdGR4Lm8gdGR4LXNoYXJlZC5vDQo+PiArDQo+PiArb2JqLSQoQ09ORklHX1RE
WF9DT05ORUNUX0dVRVNUKSArPSB0ZHhfY29ubmVjdC5vDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvY29jby90ZHgvdGR4X2Nvbm5lY3QuYw0KPmIvYXJjaC94ODYvY29jby90ZHgvdGR4X2Nvbm5l
Y3QuYw0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGM2
Y2E2NTA3NzFhDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL3g4Ni9jb2NvL3RkeC90
ZHhfY29ubmVjdC5jDQo+PiBAQCAtMCwwICsxLDMyIEBADQo+PiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjANCj4+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMjYgSW50ZWwgQ29ycG9y
YXRpb24gKi8NCj4+ICsNCj4+ICsjdW5kZWYgcHJfZm10DQo+PiArI2RlZmluZSBwcl9mbXQoZm10
KSAgICAgInRkeF9jb25uZWN0OiAiIGZtdA0KPg0KPkkgdGhpbmsgdGhpcyBpcyBmaWxlIGlzIG9u
bHkgaW50ZW5kZWQgdG8gaG9sZCBndWVzdCBzdHVmZi4gVGh1cyBtYXliZSBjYWxsDQo+b3V0DQo+
Imd1ZXN0IiBhcw0KPg0KPiAgI2RlZmluZSBwcl9mbXQoZm10KSAgICAgInRkeF9jb25uZWN0IGd1
ZXN0OiAiIGZtdA0KPg0KPnRob3VnaCBhcmNoL3g4Ni9jb2NvL3RkeC90ZHguYyBkb2Vzbid0IHBy
aW50ICJndWVzdCI6DQo+DQo+ICAjZGVmaW5lIHByX2ZtdChmbXQpICAgICAidGR4OiAiIGZtdA0K
Pg0KPlNvIHRoaXMgaXMganVzdCBteSBwcmVmZXJlbmNlLCBmZWVsIGZyZWUgdG8gaWdub3JlIGl0
Lg0KDQpPSywgSSdkIGxpa2UgdG8ga2VlcCBpdCBhcyBpcywgdXNlciBjYW4gZWFzaWx5IGtub3cg
aXQncyBhIGd1ZXN0IG9yIGhvc3QNCmJ5IGxvb2tpbmcgYXJvdW5kIG90aGVyIG1lc3NhZ2VzLCBh
cHBlbmRpbmcgZWFjaCBtZXNzYWdlIHdpdGggImd1ZXN0Ig0KbG9va3MgdW5uZWNlc3NhcnkuDQoN
Cj4NCj4+ICsNCj4+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4+ICsjaW5jbHVkZSA8YXNtL3Rk
eC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9tbS5oPg0KPj4gKw0KPj4gKy8qDQo+PiArICogdGR4
X2hjYWxsX3RkY20gLSBTZW5kIGEgVERDTSBjb21tYW5kIHRvIHRoZSBob3N0IHZpYQ0KPlRERy5W
UC5WTUNBTEw8VERDTT4uDQo+PiArICoNCj4+ICsgKiBAZGV2aWQ6ICBEZXZpY2UgaWRlbnRpZmll
ciBvZiB0aGUgdGFyZ2V0IFRFRS1JTyBkZXZpY2UuDQo+PiArICogQGJ1ZjogICAgU2hhcmVkLCBk
aXJlY3RseSBtYXBwZWQgYnVmZmVyIGNvbnRhaW5pbmcgdGhlIFREQ00gY29tbWFuZA0KPm9uDQo+
PiArICogICAgICAgICAgaW5wdXQgYW5kIHRoZSBob3N0IHJlc3BvbnNlIG9uIG91dHB1dC4NCj4+
ICsgKiBAc2l6ZTogICBTaXplIG9mIEBidWYgaW4gYnl0ZXMuDQo+PiArICogQHZlY3RvcjogRXZl
bnQgbm90aWZpY2F0aW9uIGludGVycnVwdCB2ZWN0b3IsIG9yIDAgZm9yIHN5bmNocm9ub3VzDQo+
b3BlcmF0aW9uLg0KPj4gKyAqDQo+DQo+IjAgZm9yIHN5bmNocm9ub3VzIG9wZXJhdGlvbiIgaXNu
J3QgY29ycmVjdC4NCj4NCj52ZWN0b3IgMCBtZWFucyAibm8gdmVjdG9yLiBURCBwb2xscyB0aGUg
c3RhdHVzIGZvciBjb21wbGV0aW9uIi4gSWYgdGhlDQo+Y29tbWFuZA0KPmRvZXNuJ3QgZmluaXNo
IHdoZW4gVERHLlZQLlZNQ0FMTDxURENNPiByZXR1cm5zLiBJdCdzIG5vdCBhIHN5bmNocm9ub3Vz
DQo+b3BlcmF0aW9uLg0KDQpZb3UgYXJlIGFic29sdXRlbHkgcmlnaHQsIHdpbGwgY2hhbmdlIHRo
ZSBwYXJhbWV0ZXIgZGVzY3JpcHRpb24gdG86DQoNCiAqIEB2ZWN0b3I6IEV2ZW50IG5vdGlmaWNh
dGlvbiBpbnRlcnJ1cHQgdmVjdG9yLCBvciAwIHRvIHBvbGwgZm9yIGNvbXBsZXRpb24uDQoNClRo
YW5rcw0KWmhlbnpob25nDQo=
