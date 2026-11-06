Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793934209;
	b=IzgaRbARPK9MTZ5Zgmbw7l4jPcRhxkxaDpNxsQoy3lBKecWgxYc+5UHVeEU5xz6fi5lL
	 g++bBIP59CGE9K5wbbIEGIqtw5hrmMN5r8DHH2o3WzxQFRiSxT0aYrGcPzGnAvAaglpd/
	 g4u08Rj5RGncfmB58F0bVqHmrEgePPeglOq1jcn03smA+hcvdjau/NFBTJWu+2d4OKBFK
	 RIsDYjhehrQKCq2Sy/69MlVFmoYmJvk7Uc5Y4fLPVzRtVfoXrW3Vp35yC73oj2BR5POjR
	 /gbLCLmn9wgl+TWqutG6bLuqDYTuC4Pk3/+a1d162c0xMVobclzfa3Gj6v81VFzRVDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934209;
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
	bh=2zoeRfyThXQSc3MoerYMkTmFNkoV+SPMLZd1NQ128EY=;
	b=qq7LBIQNf0qjl4kW7qV9rRgk/krlMOdNPlwX5VQLhAZq+vKlt+36WEnCWIsXSu6GOqMC
	 BroneJbajmEDgZKw+KneDqOxqNLninDSuPgvsEsqN4lblHdHK1vtCyd7u8LMRUvbrH6yy
	 SEwctIDhsY1xJN1qk7BJdVTdfB6PCv/9KNpqEfQnzSTbHRLxHAmAFLGKb6ouKInHfPrk4
	 Qo2pAzwAKC1/3FJE64bt2fJdmdI0HN4BU52Fxvf3DeV8odWq98xQCq5ZfKDq2ttyZPMYH
	 ymxYoRoepWxYjQvmFEUJ44KhxLMhf0/MyosFgYH9VvDMvgGLQZRkPS90jta7Wp7xVQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m3BnFcVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F882606A326
	for <linux-coco@lists.linux.dev>; Fri,  6 Nov 2026 03:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F882606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m3BnFcVR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793934208; x=1825470208;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2zoeRfyThXQSc3MoerYMkTmFNkoV+SPMLZd1NQ128EY=;
  b=m3BnFcVRGoS1YvttfpRtS92RdGWyEaybO4sI8c3tVpmcV+AqnrGaSpkc
   a3uc8Y0JSwzfYN/Mo/MsW/BBB44TYpGX/puwO2mCtuPFGR/p2LNtI8ds5
   MEbdbKnCV6sstyZYxamC+Fg++9b3qH6Dy13I6OBdpaEjpOlwhK0lg+QQb
   aVOveWYhVHpyOKJL+oW6Ykfl2cd/nhb9x33kQLm//EoV5OAzHU7vRDdcm
   lapHoo0cc+HWPJPWiC9k1jb31NnkxYp/Zlw02biTQqfr50YN2WnrriByM
   gBcSIrQsyr2Qfg0sz0Zk184MtY/bbiRpya6RGBWC2W264Reqja0YzIBJR
   w==;
X-CSE-ConnectionGUID: IEKoQOGuTx6tV4eBNr6doQ==
X-CSE-MsgGUID: ztgXIKPPStW3gwV6kDqw0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2620981"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2620981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:03:28 -0800
X-CSE-ConnectionGUID: ypyzahrSQsWZBm6AKxssJg==
X-CSE-MsgGUID: lpEPElLGRWCzTIoehjwazA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7283760"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:03:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:03:27 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 19:03:27 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 19:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvIvgzl5Pi02ZVdtuFvHzSNJbv5uUlwK1IAcMwFgDbtHkJBVbNT15InLRuMzlh/D1b/PdJjPYbO858yqcFv0xcrr+62OBAJRQWjWMEtADm7sl+503HtDxVoMsKS3dJEpP9Wp/qys3nkcr+9Y/DPrVpSn0XzkAQP3ejnGVqXBFmbBcvNlPNMCjD9hPxx7BN0ZkTcdsaumTTMw8nRe4OmWQ37/RCtjR+swnmBqOJ7E8pa/WL4kwNEYPDB8bypHdPKgamVme54ew9oD+UMO2y0GAuCpgO1cbrSSq1fWR9ZIy85/TR1feqWC7H9OfGbouDLGeAZ6wo0aTDexJ6Dx41HODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zoeRfyThXQSc3MoerYMkTmFNkoV+SPMLZd1NQ128EY=;
 b=ktqSBAMpFd3JElmH1o23IpiSp/ta1JmpaC4uijJmaK+0LfudXVxEoUdXhNItnx4X+Gf6kT6YcXdUR7nsshL9iqJ/FMC0Ac4jcrjU6owGWevnhVakaCE8RSzBNFj9auRXsu2hBQiR/TzoczyBYyRb3t+lhkqftuHiSrJqOF6CSRUr8xoTvLEWk+4PS0+kmsd9LcCPvkLt1Jqgc/CREsKQWMPCRom+jIMJTlEDYQUUAKcM88bwDTfUcAwrfWLY/3QkJ4yyQx0AJAlZYr6fUHc96X0t/8L5FgQNrFsVm7q5l76EXu007d76zF5WcMH2Hz6b5SI1zqn0hTuIgQ0dzYNdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA3PR11MB303677.namprd11.prod.outlook.com (2603:10b6:806:5a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 03:03:25 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 03:03:21 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALZp1CAB3RpgIAAwCFwgADRDICAAL+JgIAAZjwAgADpviCAAPMhgIAAg4zg
Date: Fri, 6 Nov 2026 03:03:21 +0000
Message-ID: <IA3PR11MB91364D04E26736B09B444B9E92762@IA3PR11MB9136.namprd11.prod.outlook.com>
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
In-Reply-To: <d1d48263791816b2f361bca2d3a9923e5395a49c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SA3PR11MB303677:EE_
x-ms-office365-filtering-correlation-id: 05a45f04-188c-4c3a-68ae-08df3bb2841b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|22082099003|18002099003|10067099003|38070700021|11063799006|4143699003|56012099006|5023799004|261028144727099003|261026121527099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003|261026140227099003;
x-microsoft-antispam-message-info: eZSoVxEMi9ci1Bsokf/YnXVi9HWo7skeC3ISxh0I1OfiREgOJMIFE8vkj2080vDvsuaA8hxzFaqIw5RctmBPDG11NJLiI4k4pYh4eVXEFcHHGeCTNO7+E4tKpI9odtdC7p6x0kOGTXUi7wI46DbXew+myapX70kpcjtSDOzQ5zlVXVMI7BrAQghcFusLS+ARtsG7LO6HqpzlvT9ZFUQqYdgbcXHxVBJ3caLyeV4uw/fz3wsp4EjELxN5Y5oK+7dfx250f4XQHtaXcbuHeb3OEiPkQQFmhxAeGrOlb/hGhC2Hdy+QpJ2O2EYPD3XiRmvB1cBHCGeI9D1gEo9r0PdfU6GJ5vTkaKbgw7uDDNkBAvjTlmRJA4c/7WEwg4BPSiGxjxw0LA+3uEyEiuMc2HQa99LsI1IttGirUFQxO4s/JV+umIad/tDWKvrkWvSudsFt1j5OimzRt+J5uT6OxLEvbedKyFQfHgT87RHnRGJKyZ+wqQe+7dvlLWV6vw5zslDPgl8xUGMWu9eg0U4kw8EoNb5HAu+/D/W4xIs7RyHWMWBQYpmrEe+vn5lLYXiENrZ4Flo2f6Tu5Fl26+OqZJWYpqNNe67SKUwcFmLtgYV9C/iXz6pazzSfw36fDu9tS2eBrA6FNcDCzMGOoL9sn7Wug9rn27IzveCF7i60MPZqdR8h1aLSu1iirMbh2MynidsGbiF78R40htuQwQFdQCjTGKNsq3kQQLcoXarpiBIDtmU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(4143699003)(56012099006)(5023799004)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dk41cE1EdXMzSUJoU0U1T3lZQnFXbU9Ka2U1ZU9hV21rb0xLZlBXdW16TGlD?=
 =?utf-8?B?S0J6WmNwWlNFREhWQ05pM3VRamtBREtodkkrWjJaNkdVOXNTVTR3V2huZDMr?=
 =?utf-8?B?NkZWVmZBTitNWlFYVE4rNWg4SThKUGRRQUtUbzZyZjNZNFJSbHQ1OGlmMHls?=
 =?utf-8?B?OEY3UlBTZDNsMmszajVGcG1wSWhVVVdXMmdrSnRYUTA1cnBaTWl4MEdMTEp0?=
 =?utf-8?B?aExvLzl4RHhJY0M1cTJ6Z01yT3cyajAzcVlNbGQ5dnJpdXUxa2FuZzJSYS8z?=
 =?utf-8?B?WERVSC8vKyt6T2ljV05sKzhHaE5VelJvN0tpY1pHTHc4Snk0NWlGMVhGbWsx?=
 =?utf-8?B?SHJVSW9FcUNMMmM4eEtxYk9aSE1xdUdjZ2orTi96YVRnbTh3VTA5NHFVVzJP?=
 =?utf-8?B?RUdNV1JhVUZxY2tuQVJ0eng5SE5WTExadHIxRitYYzJBOVQ0VEp2M2V0Z3lj?=
 =?utf-8?B?ZnppcEJBeDVKK2VNQ1h0K0g1RE42U24vdGpuMXlRVnlIcnZUTlkvaU9vYVZR?=
 =?utf-8?B?NExjNXd5allyK2oyMC9Pd29xT3hTS3pwYUQ5RC92V0Q5Q0s4YUR2VmpIMkUv?=
 =?utf-8?B?MUhwd3ViczZhOE5RaGR4OG9xVWdtK3NHbDM3cWlndG5hOVVqRm9ET3ZBN1NC?=
 =?utf-8?B?VGk1ZXJOemI0M05oak5lUkREQUxRelVoemE0K3JOakM2WS84RjhZM3AvWWZu?=
 =?utf-8?B?M2pNdEZWZVpWeS9YMzAvSHVXZnkvNE1IU0NBR3M2UVl0Mzk5bkE3dGR3RW50?=
 =?utf-8?B?V1F3V1h2UDNoSHVXc283SnF5eGZLZGhLeVhiSmFGNHhIQ1RtUkV0Y0diTDB4?=
 =?utf-8?B?OEZvdGdPNGxXelpxTnBJZmlPRDV2Q2dpRjZVY29tT3ZqTDlzYzR5dSs1eHBk?=
 =?utf-8?B?OGtXaTIxbnlNUWRFY2c0b05oeXpzNGR3cGE1Nmc1eitIaEJyTlNRTmtDR2lC?=
 =?utf-8?B?ZWhoaEZtVk9PcDVITzJDVTNycHluenlHbkRRa3RoZjk2bys3ZUJoMFFNWXgy?=
 =?utf-8?B?amZUWm90QTNUUUREZHVIckFJS3Q0OHdObzFQTXB3L0RDTWM2YStxOGlpc3kr?=
 =?utf-8?B?SmlYSGlPd0o2Q1ZwN0VRb0xGMDd0Q29jRnErc2J6V2pxQVhCSHR3L2wwK1JX?=
 =?utf-8?B?SU5kMVEzQnNCc0NRekVZS2FWbU9Ka2c0Q2FKdFFwU2hHemJMcFN5SldYL1Zu?=
 =?utf-8?B?VGpSQ3lUcE1GRm9TMjFzN2VzOFlqREVtUFVMeUQ4eHV4NnNlb0Z3anhPbTRZ?=
 =?utf-8?B?QU5JQVllVHFuR1NwMmFRb29keklyRk05RnNBbEFqQ2s3QkFaV1NvOXJsUUZs?=
 =?utf-8?B?aE5zbGVjN0pGa2lxaWZKdUk3WG1haEdJOVpVYXdtR1JkWEQyS2JYUHpxTFZB?=
 =?utf-8?B?bHZaVnBETzNieHIzZFRhYXBzRVRnN1kyR1JZeFI5WFNnQ013Q0VTT3BNbTZX?=
 =?utf-8?B?TUx6NXVHc2hlc0RiNDRVaDF3aDN3WlhTUHNjeE1qbkVBMGpWR1RDbTRUbTdn?=
 =?utf-8?B?ZWJaem9MS1p0QTg0MU1GWFBYbERyNmt0bTRZZ2tpVGkzT0JjOXczODhLZGxs?=
 =?utf-8?B?SC8rd3R0Y3lQUlRzS1RBbzc3cnhxT2QvRkIxMENKaVF6dDI5NGJod3RyNEJ5?=
 =?utf-8?B?eUc0ZU1vbVJodDBTNzFCSjNWRXpwWDBLb1FvRHNwR3I0TTVPNUVhclpxTjNO?=
 =?utf-8?B?OGluTnZtaGxMSFl0blFGZVUvQnZQZGRldklxcEk0R1JOMnF3ays4dUI1dG9E?=
 =?utf-8?B?YXNjVGI5dXY2dGVBNmVaWWVqKzFNQjBKZDVDZkVOOC9jSTBzcENJczE2SFhL?=
 =?utf-8?B?bUNTZUttZEZyeXI0c2hTNUs1VlFlTmdVbXpXMXlmaGhFRXgrVFhOVE9IaldJ?=
 =?utf-8?B?dkl6YVdjdFNDUzZxSEEyYjIyNThVQzRvWWZ0cngxY0lMc2FZWVZjaGh5UTNF?=
 =?utf-8?B?OUFvb05QUzlVa0xBdzl4U3BZdmp6UDBqa2lYc282ekxBbWV3VWlZbmI3MzFE?=
 =?utf-8?B?OTJnNWNpRkZ3eFlZRzJJK2ZrckI2Q2NUWktPMGR6MFRMbmk2ZTFXTTFxUmpF?=
 =?utf-8?B?NTBsV01BV1NUZ1ZWNG13RFBUTGM4Wi9VTUdjNnMvYVpESHcxN3BMa0RQeHF3?=
 =?utf-8?B?R04rS3ZGNHRTYnp1Y0xBM2xuWm5IcVZ0cG5ydHk2TmxEQnduRXZzbUpYV0xj?=
 =?utf-8?B?elYrTG0xODdIdTdKdzlIV2NBdS9LV2RKSE1Vd0FQUUNHMFVkYldoYkV4RVFI?=
 =?utf-8?B?OWVpUE1OaGVtbG5pR0lzTmhaaWs2NUpuT2QxS1R4RjBMVEZrQWc1QUtDTW5X?=
 =?utf-8?B?MEpoZm14TlpUOEUrM1l0cTR2UGYzRjdIaDVVeGU2ZWhwVFkxWnNBZz09?=
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
X-Exchange-RoutingPolicyChecked: p58JRE7xzJofDAFr0LArzJoU/YqOc7toCQwNzKtQB4ZsNTBITQUPfvWCmHAUFUCuzj4egXfbnVPNHH6Etfoy32wihw0I1m6RiPmWWcHTn5Wv40l9eixbH+RbofeP21vqg9RTfg1LYBf+x3AEHWonB1hlJYN2uYNjtT1n69nhWEyTb2QNQKWEDdBsnG/8XV4KcuVN+M+0vyZxw0lB7mOH97GeS2mk4+Q1PvjnIHjTCGBrO1H4KMIYeieGC8qdHa68ymJVJhcwqrf+4ag2g0XTBWb7QKw50sxbuwl9zJxHlf+NIzWMfSVUYC7GIFs9/s2OoSZINMSIqhprnd/fteAM6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a45f04-188c-4c3a-68ae-08df3bb2841b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 03:03:21.6208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taRDGthPO/KsqObdf5PiR1hGVUxf7JT9mQp0Rufl0txlQvf2TL6kl4Bap+0KqyJMMz2Oyf6NM+d8d3vXplRS5lsq0ZKJDfoNpfZqwlq7OfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB303677
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
Ni8xNV0gdmlydDogdGR4LWd1ZXN0OiBTdXBwb3J0IFRESSBiaW5kIGFuZCB1bmJpbmQNCj5vcGVy
YXRpb25zDQo+DQo+T24gVGh1LCAyMDI2LTExLTA1IGF0IDA0OjM3ICswMDAwLCBEdWFuLCBaaGVu
emhvbmcgd3JvdGU6DQo+Pg0KPj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gPiBG
cm9tOiBFZGdlY29tYmUsIFJpY2sgUCA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo+PiA+
IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDA2LzE1XSB2aXJ0OiB0ZHgtZ3Vlc3Q6IFN1cHBvcnQg
VERJIGJpbmQgYW5kDQo+dW5iaW5kDQo+PiA+IG9wZXJhdGlvbnMNCj4+ID4NCj4+ID4gT24gV2Vk
LCAyMDI2LTExLTA0IGF0IDA4OjU5ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6DQo+PiA+
ID4gPiBJJ20gbm90IGNsZWFyIHdob3NlIGZhdWx0IHRoaXMgaXMuDQo+PiA+ID4NCj4+ID4gPiBI
b3N0IHNpZGUgZmF1bHQsIGUuZy4sIGEgbWFsaWNpb3VzIFZNTSBkb2VzIG5vdGhpbmcgaW4gVU5C
SU5EIFREQ00NCj4+ID4gaHlwZXJjYWxsLg0KPj4gPg0KPj4gPiBJZiB0aGUgaG9zdCAqY2FuKiBh
bHdheXMgaGFuZGxlIHRoaXMsIGJ1dCBqdXN0IGRvZXNuJ3QsIHRoZW4gSSB3b25kZXINCj5ob3cN
Cj4+ID4gbXVjaA0KPj4gPiBlZmZvcnQgd2Ugc2hvdWxkIHNwZW5kIHRvIG9uIGhhbmRsaW5nIGl0
LiBXZSBjYW4ndCBwcm90ZWN0IGFnYWluc3QgVEQNCj5ET1MNCj4+ID4gYnkgdGhlDQo+PiA+IGhv
c3QsIHNvIGRvbid0IHRyeS4gU28gdGhpcyBzZWVtcyBzaW1pbGFyLg0KPj4NCj4+IEZhaXIgcG9p
bnQsIEkgd2FzIG92ZXJ0aGlua2luZyB0aGlzLg0KPg0KPlNvIGlzIHRoaXMgb25seSBhIGJhZCBo
b3N0IGJlaGF2aW9yPyBPciBzb21ldGhpbmcgd2hlcmUgd2UgY291bGQgZXhwZWN0IGluDQo+cHJh
Y3RpY2UgdGhlIGhvc3Qgd2lsbCBub3QgYmUgYWJsZSB0byBoYW5kbGUgaXQsIGFuZCBhdCB0aGUg
c2FtZSB0aW1lLCB3YW50DQo+dG8NCj5rZWVwIHRoZSBndWVzdCBydW5uaW5nPw0KDQpJIHVzZWQg
YSBtaXNiZWhhdmluZyBWTU0gb25seSBhcyBhbiBleGFtcGxlLiBGYWlsdXJlcyBjYW4gYWxzbyBo
YXBwZW4NCndpdGggYSBjb29wZXJhdGl2ZSBob3N0LCBmb3IgZXhhbXBsZSBpZiB0aGUgZGV2aWNl
IGJlY29tZXMgdW5hdmFpbGFibGUNCmFmdGVyIGEgaG9zdC1zaWRlIGFkbWluaXN0cmF0aXZlIGFj
dGlvbiwgb3IgaWYgaXRzIGZpcm13YXJlIGhhbmdzIGR1cmluZw0KbG9jay91bmxvY2suDQoNClRo
ZXNlIGZhaWx1cmVzIG5lZWQgbm90IHByZXZlbnQgdGhlIHJlc3Qgb2YgdGhlIGd1ZXN0IGZyb20g
cnVubmluZy4NCklmIHRoZSBob3N0IHJlcG9ydHMgYSBURENNIGVycm9yLCB0aGUgZ3Vlc3QgcHJv
cGFnYXRlcyBpdCB0byB1c2Vyc3BhY2UNCnRocm91Z2ggdGhlIHN5c2ZzIHVubG9jayBvcGVyYXRp
b24uDQoNCktlZXBpbmcgdGhlIGd1ZXN0IHJ1bm5pbmcgaXMgdGhlcmVmb3JlIHVzZWZ1bCBpbiB0
aGVzZSBjYXNlcywgZXZlbg0KaWYgdGhlIGFmZmVjdGVkIGRldmljZSBpcyBubyBsb25nZXIgdXNh
YmxlLg0KDQpJZiBhIGhvc3Qtc2lkZSBmYWlsdXJlIGNhbm5vdCBiZSByZXBvcnRlZCB0byB0aGUg
Z3Vlc3QgYW5kIG1ha2VzDQpjb250aW51ZWQgZXhlY3V0aW9uIHVuc2FmZSwgZS5nLiwgZGV2aWNl
IEFFUiBlcnJvciwgdGhlIGhvc3QgY291bGQNCnRlcm1pbmF0ZSB0aGUgZ3Vlc3QuDQoNCg==
