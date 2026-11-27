Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795767323;
	b=ihkDPrQYWcgqQGptnMqc4/LRqk2ZwWo6pHddI+dyuMlWFfmr3bURB+ZG0a5HUgvVg2p+
	 rBhxH49mASqoJXCqj5DYHJP67FZxLk9ldSw4iJKKY9IEzDzmrEb3ruQZbOKnHTESuYGQ4
	 ozmK+PPjA83aslVLu2kGqB7/DT2Lo2Ra9XIwsWAOtdD82stY9ghNPQPuHMTZIq6e0xcOK
	 014+YKlfxLRUfeuM+C8yC5l4dv5+Vm6Sj358E53fWD6vchEAys0E0x8i8FzbpE/TUL7vp
	 wJQYLF0UoiyeBxOMgugU7BslLzk1ZZq1/nW1K05yRGu72Y4CyXq54yOli1rvEEKalfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767323;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=It+hxHG9wElNPzWRMmeDtmadgNYH/pvxP9lJNm4/3Vw=;
	b=xph63B9NbL0m8ILrV3GihG7YS8uwqnqtpaSzM/AYlCay6BSF2O+RYQidt7vGGKDybnxX
	 8LdInzeBDmSs7I6E12hwsE7s40k6liEx/fNdkeIwYyofxx8u2rW6NJ4+evuq26ik2W7kC
	 mzprrDXiLTAO2AP0airj/+a9p5g+VR/IPtz0CtX8B0VvelmVScCQrsMVB4nsmPiEcMF3+
	 JDUeTwxIpT6f4sz3I5jJWUYldjnBPPFa6a4ip4w4a/PbxfIr9nCOIHfG0P7kZI8yLKinj
	 uKwlGeqT23zgwujiZ8fxri5KvcS4i2D5DXLhkdrXqd+fCx88uHJFyEHknQe5IzOrGpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bug9YBVz;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XN0A3o77;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A79606A327
	for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 08:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A79606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bug9YBVz;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=XN0A3o77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795767322; x=1827303322;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=It+hxHG9wElNPzWRMmeDtmadgNYH/pvxP9lJNm4/3Vw=;
  b=bug9YBVzfksKzComoZBE1Xo+L+uk2fFE0QG0K4Amcf+xgnnQXLJv4TAf
   ZTBLv8oRNNTK3keTH9490b8242/cWPSOCUGWiGGNntRzFnqJ0yJq0L7XH
   myenWMqxr6sHOMMsSg5xiGicitFbbG861jJzhb87mVAj1xV7Lrf90/tkO
   BUtbd9AQ1B4IHGiZ/F3a0J0E08A7HtlrtMQ6ks3UMqLPOxBpIYXTFziX6
   b96tK+fKW/mEp9eDJqsdNdRJbdteZ0yeFqj+GYMdYZ7lYLodx5lMw9DTs
   IKztoXtheKCro77HFkWqCEvfwtP64xQEHSbPnU/tV4JPZrISmKqIS7PZP
   Q==;
X-CSE-ConnectionGUID: OshU8W1sTD6iH+f5Jw9RSg==
X-CSE-MsgGUID: S9h4hBvyTJCE/sAD5gwN6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4763888"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4763888"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 00:15:21 -0800
X-CSE-ConnectionGUID: 4mi8smHLQXKCLjlYiCUxRw==
X-CSE-MsgGUID: z5iceXN3SAGVAy+DdpCYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12493821"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 00:15:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 00:15:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 00:15:20 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 00:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJ7ERsbEzf649eWISY3XjGa8brQiKGPZkbvjqFYzRY1Ou1I3/q6n6yjYtg8Vo03XK9s4AV5ftpgoPlVzsOehtmn2SI9XvcfYmUm44KF9qC+mrllvTeHhQjfUmKUa0DOoA+wGuvFriAu1fOB+Wh3TrQbYX5K5RIQ6vaHSWoK+nX7OdRp8Q/VkY/QmXPXdisvEyYHaziSdipAHhByTGqLrmqLVprSOXGebhHLLRv58v/+1a+AOyqg0ppwjvOuLqutzl1l1ELC38z9K0E/r8lpLvXPBkRRvtCrdZuFohGOSNUnuYZiuA+msSRu/+5joZdPKeyoDaV90zbDI7PZw2qq3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It+hxHG9wElNPzWRMmeDtmadgNYH/pvxP9lJNm4/3Vw=;
 b=eyT87ivHUloAa9k+XZrgd7UZL/6B/c+az3jnLOJb1EYmilOuX89katTDfiDfey6Vh5SqQfITk31xL/fm2PwghojTFvu++ncQA0SVtM/XO90tHaKB1ZjpLRMUEEiPPHboN+NsT65lDpVNd+r/U2BwKwE04gkCUUHw8+w4g4381a4fY7ZNa6W+Q8h9VtFWXN2iKIoif2NyVK2gdW3k87GRwwYPW8YOET35UIIxIdStPmpXv+ZMrDH7BA3Rojm+pM618Vj8xw4N9h1J+ekncsclxibmAMuf/f11OrMtRbc5Hadj7pzQ6mIGWC1XFI8ou1BYd0FqZZiwMDjoIohhJonK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It+hxHG9wElNPzWRMmeDtmadgNYH/pvxP9lJNm4/3Vw=;
 b=XN0A3o77ncXxIf1Dxd+bTblINi9iluzT4Ig0XCQ4j7wy9WWdSRV4nhz/9lfckB8RN/UF7kiZhfweMynFqEpgp8gQoRQaDrGREnx/tfQnF8UGbdDcXUU9ZXP5F5EIK6sQnXV4oJpeuqYCytbGymb1l4JDGdq8jyiImtZZ8KyNd+Q=
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Fri, 27 Nov
 2026 08:13:09 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 08:13:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de"
	<bp@alien8.de>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: RE: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Topic: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Index: AQHdS9qwoztX/5/9pEuMFkZr8ZeESLc9GswAgADlJwCAANdSAIAAmviAgADxFYCAAZCTwA==
Date: Fri, 27 Nov 2026 08:13:08 +0000
Message-ID: <CO1PR11MB4835B54EDF27C7EFA4F113108C412@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
 <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
 <5b6837a8-f8bc-4e7f-8419-01853eecd531@intel.com>
 <244d504ddfefd2c2bfc17da62f71685dc8b4205c.camel@intel.com>
 <b87c690b-9be1-475a-a63a-eb0d7825d794@intel.com>
In-Reply-To: <b87c690b-9be1-475a-a63a-eb0d7825d794@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|PH7PR11MB6473:EE_
x-ms-office365-filtering-correlation-id: d745026a-871c-4772-2685-08df4c5e455f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|38070700021|10067099003|56012099006|11063799006|5023799004|261022075727099003|261026121527099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|4143699003|3023799007;
x-microsoft-antispam-message-info: B7gJZH5SKrNe4u9itZO2lnd3NndE1RCAt33ghOtZYfu1wURztXyCsjfwDB6fDsmwwwrFYN4m6QuKigkhc/4HdnrhMuZlSrmDzGKJlWr/RLEeDOvFnWwA15Os7K2D2LgJDJXs2XlAsSp82JBqLrxHw+qApWAZmx134Ju+Shqa9lJGwqrr+5vBPEZDjLVH/8FM7WDVhBPUBwe6KOwcQBVCubooAaSO0z/a/iO3V4POSg0qMeVeVgKdKS066xUH3fS0y1hvqMO3hxDwK2pd6lRaTjHVR1g7pbXq25DQCvsJ8Qx328fWq0ms/oo6WhN2qDZ7EYrS9YuPT1pAFgAa9nM14q/ppm85WWLppt+HJV6aY8Mkb5yUY4ii47xNBlLSYdB9yaghyKgBupJMv6a8ORsqMIg64FZCUBBWUKjYxACxEmY8L9LNutu+DDq27zK2DgHR0TgPp3V2829OFOcRPciFRHFbawJ/eRsHnnZddB3lGD9C25VFcnD/YFo1k3gwTGo8NvWYY6bW5tnGtKBStqTSzgErWefVpJ/0A6m+7cidXwPi/KzNC6yYspmGxzqHpvWrk8VxwuLQII1qZILP/IYp2WKBIN3RazskT7nqARzJRS8LaR9h9ocMzQr14qREDgNq8ZpsQ6ROnlCjZvWv2usdFvruaJxvovnm/M8Y/u0u0Ew=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(5023799004)(261022075727099003)(261026121527099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(4143699003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhVcE1HUUo4MVdFL1hwSjRhc2Z3bVhGT2JtUHFmbWVMNXI4djhmTHFyTEVP?=
 =?utf-8?B?dlEyckpuRitNUWwrRDgyUm90MU02WUpXdFZmVlVVQjBoSVczUEpnVDlRRWVI?=
 =?utf-8?B?SkRHR3dBdWNjbU8yNGIzOEs5cEhCalJUTkRDbEdlTTZFMzVuSWp1ZzlwYklU?=
 =?utf-8?B?aWE2ZU5BazA2VGowaE5tUjhOczg5dlVtbkE0OGFOcEdaYVZkbVJiTVlBdVBY?=
 =?utf-8?B?SjYxcVpFd2J3S1I0TzJ1SjJOS1dpZzRKR0RKZXRRa2o3MituR2k3bXVrb0N6?=
 =?utf-8?B?Mm1YUE1GWGZVdnhCdkNRdzlTZmxhSHBDNGM2T3FyNzBoQjdQb0JjR0FkV0d5?=
 =?utf-8?B?eERSUzRjZDFuNXo0Y0dIWmtWZVZMcFJEaTF4aUFXZWhacFFoOWM3OHlkanVa?=
 =?utf-8?B?VWQvbkhRc0RJVGJidnIwNGEwejAzUFRXWVI3bEl6VE5WWmxWWDJMWlBvbDg1?=
 =?utf-8?B?K09tUGhuSUg5VTBtVUVhM3ljaWxYZHpHSitLbC9MSzZ1bHcxdEpVWUxmc3Ju?=
 =?utf-8?B?LzVEUHdQU0ZZZFpJdUdJdTc3dTh0aDJyQmRQMzFlbkk1WmNjUDRoeWtoYWdQ?=
 =?utf-8?B?UTZOSm1reklzZHBJVGhrZ1o5WHErbERzWFNLVS9rNloxT1cvRDRmNnZmc0wz?=
 =?utf-8?B?L2dmV3k5ZWhvdzlEZ2ZZRDR1VlhiWHRXdVQwYTAvalluTVhRcTcvNC9NRE1I?=
 =?utf-8?B?cFM4MHd6QnVHdFJsVXdHK0Z1T1l6RGQ0cW5pVStwZmxvN0RhcXp4LzBwMXk3?=
 =?utf-8?B?WkhyaU43c1BkOXNnWFE2Y0VKVnFBTjltY1VVM3J6amhTZ2p0WEJYbUJZQUlm?=
 =?utf-8?B?YVVpdnB6WmlEOEVmZUppYVJWdXNNZzNMYTRBNFY2QkEwUU5PZHY2RTVBOHJO?=
 =?utf-8?B?NmpoQ3ZJTDRMK21xaTBQQUs0NW1tNVYrb0IrYS84QjlBUFI3UTBUL3YxRXVS?=
 =?utf-8?B?KzBwUndpV3V6TGpINGtDMjlQRWptNGk1K1kvUkMzNVV0MUtIaEpSbkJJZWc4?=
 =?utf-8?B?eVg4dEdOWmc1VkN6VlpDZnd2YlJlSWVzZXpJQUVIdHBMekxMVXI1YWFRa1hp?=
 =?utf-8?B?RXVqb1Jsd3BPOXdpY3dzZThmWHJiUmc0bXMvd21RVlhLTUJKYTEzbHl2NGpm?=
 =?utf-8?B?TTBPV0ZCcnlwTlhrVXBWeTJiQ2JWSWFheEQzNHVnNEl4Mk9VMWFCdk1Yc1dM?=
 =?utf-8?B?cnQzMjRRaktwd09ta2tMQmhES3ViRkIxLzZKQkRnYW0zSTBrQjNZZ0hjSEV3?=
 =?utf-8?B?amVFckpVb282RG5ydTE0eFBzaDFyeHZKclIrelVoUDVISHdrczRrZ2crYzJ3?=
 =?utf-8?B?U0hSNnYwMnhWeDBDQmg1a3JXRG4ycTgwSDRGLzNKZmdXbjA3YnoxbTFiRlVF?=
 =?utf-8?B?UVRUMUI5dlN2clk0Y0tnWVF4SzdnN0I3M1dEMjNXUzFOWC9CZzN0eXZwWHdS?=
 =?utf-8?B?Y1YxU29VME92VjZtVE9WYzE4dlJLNlRTdzg0ZGRvbzdLLzVQZ0s0SzQvZC9k?=
 =?utf-8?B?dFMrcGRVdUM3QzVoTU94dEpjdDhRMTZKRCtwMFF0WVQrR3gvM00waW03cXln?=
 =?utf-8?B?ZFhqM1pIbVY1d1Z0Rm0zVTdWUTRML1VaSFpQZnlqM2pxYkRiZ05RUStDNWZv?=
 =?utf-8?B?T0IvR2cwZUF3Rzk5emhlUndITnNsOUp6NUVIM1ZNQzNDUXprRDFKZlBRdWJq?=
 =?utf-8?B?T0txeWZoaitGSVI2aXJXYW5QRWlFb3d1UzRSekJ3cTd5RDl5ZEZ3aVE3eUdK?=
 =?utf-8?B?WklSUTFJQTBGdFkrc3ZvNmNBZDZJcWU1cGdMZTFQLzU0NGJuRVVlUnBLU2JT?=
 =?utf-8?B?aE41OXVMOVZiWUFJVTM5aEtuQWphUXBLUGE3M3VmT1hxOEtZVnNnRThHQmRO?=
 =?utf-8?B?SU94TmM0dU9KcVE3N3h0VjZ0RTdqdHdhbjUwbTc4UHN3OHQzalhJNXlxd0VJ?=
 =?utf-8?B?aW5TNXJFUWYrMTdCeVhJTGZBZEJpN1R1cjdDbTB5d2o5T1U1M1JpUFpleGUz?=
 =?utf-8?B?Z3gxdjUxOXlYamYyQUtQTEFxQ0I3cHk4OFdzNXhNd0dOQXBCUVp1VUJkWEQ3?=
 =?utf-8?B?WTVadU4yL3NWMFdEWTBPNXNzbUQrUDFoQWxDRjdSTit2SlFvVmNoQkZBUlhE?=
 =?utf-8?B?N0ZlcEd1YlNDNmViNVhaaGhoSm8wTmpXY3FLMnMzampXYTBudmxYb1d6c05v?=
 =?utf-8?B?cUJ1aW5iOHBYL3FZN2hVcm03SFczMXpaR0tRVE1ocjFDbDkrd3Q4SzBJeVJs?=
 =?utf-8?B?b3RGWExJL0ZxWEJTWEhVdEhsTExsSHNISkxHam41TDJaeFRzOHNwZ0c0Qk1E?=
 =?utf-8?Q?12WxGcvVAuNMolWk10?=
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
X-Exchange-RoutingPolicyChecked: BOeDZM2rfaRGVuGd0H4XPuUihQgb/xsd48vqFNT6wWRE1fRwRruBeGRWNdDGPxW0KO7qUUelRnG+Dsk0WEwwUcVob+8Ak22gDVcs/K+h9G/xmAilqsixnR75kftZvVk1sz051Zq9K/Lu5NGpxQCx7Xz28NRUQ+PHv1oWq0YXfE+9NExwlJsvvHo3AsTER0b+1fSVfdZQZrzmNSneEISH0Ytq64ylet9ke2pUaDquzF1C71ae386bBu2femGCPK/zXcAEcBOQY33Wc22ynlH7opCYSEu+Vu3doZCPhtcmb330e4JoJJSfIUAHiKD5STEx+gjk1ksQSaOKeXDx2s8XrA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d745026a-871c-4772-2685-08df4c5e455f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 08:13:08.3541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSt79qm5hCTRNFTPsD/XvIksHTuWzhcrC/E8gttIib63YsEG4N/pkuXknfYhV/Ub91zvR59hfTicE5uPeI1Nig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
X-OriginatorOrg: intel.com

PiBGcm9tOiBMaSwgWGlhb3lhbyA8eGlhb3lhby5saUBpbnRlbC5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBOb3ZlbWJlciAyNiwgMjAyNiA0OjEwIFBNDQo+IA0KPiBPbiAxMS8yNi8yMDI2IDE6NDcg
QU0sIEVkZ2Vjb21iZSwgUmljayBQIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyNi0xMS0yNSBhdCAx
NjozMiArMDgwMCwgWGlhb3lhbyBMaSB3cm90ZToNCj4gPj4gT24gMTEvMjUvMjAyNiAzOjQxIEFN
LCBFZGdlY29tYmUsIFJpY2sgUCB3cm90ZToNCj4gPj4+IE9uIFR1ZSwgMjAyNi0xMS0yNCBhdCAx
NDowMSArMDgwMCwgWGlhb3lhbyBMaSB3cm90ZToNCj4gPj4+PiAxLiBUaGUgcmVxdWlyZW1lbnQg
b2YgUjgtUjE1IGFyZSByZXNlcnZlZCB0byAwIG9uIFRERy5ETUFSLkFDQ0VQVC4NCj4gPj4+Pg0K
PiA+Pj4+IMKgwqAgVGhpcyBpcyB0aGUgZmlyc3QgbGVhZiBpbiBURENBTEwvU0VBTUNBTEwgdGhh
dCBleHBsaWNpdGx5IHJlcXVpcmVzIHNvbWUNCj4gPj4+PiDCoMKgIHVudXNlZMKgIHJlZ2lzdGVy
cyB0byBiZSAwLiBXaXRob3V0IGp1c3RpZmljYXRpb24gb2Ygd2h5IGl0IG11c3QgdG8gYmUNCj4g
Pj4+PiBzdWNoLA0KPiA+Pj4+IMKgwqAgd2UgYXJlIGdvaW5nIHRvIHByb3Bvc2UgdG8gcmVtb3Zl
IHRoaXMgcmVxdWlyZW1lbnQgYW5kIGl0IGhlbHBzIGRyb3ANCj4gPj4+PiB0aGUNCj4gPj4+PiDC
oMKgIFBBVENIIDEzLg0KDQpUREcuVk0uUkQvV1IgYW5kIFRERy5WUC5SRC9XUiByZXF1aXJlIFJD
WCBtdXN0IGJlIDAsIHNvIGl0J3Mgbm90DQp0aGUgZmlyc3QgZXhhbXBsZS4NCg0KWy4uLl0NCj4g
Pj4+IFNvIEknbSB0aGlua2luZyB0aGF0IG9sZCBzZWFtY2FsbHMgd2VyZSBtYXliZSBpbmNvcnJl
Y3QgYW5kIHRoaXMgbmV3DQo+IHdheSBpcw0KPiA+Pj4gY29ycmVjdC4gWWVzIHdlIHdvdWxkIG5l
ZWQgYSBuZXcgcGF0Y2gsIGJ1dCB3aGF0IGlmIGl0IHdhcyBhIHNpbXBsaWNhdGlvbg0KPiA+Pj4g
cGF0Y2gNCj4gPj4+IHRoYXQgZ290IHJpZCBvZiBhbGwgdGhlIHNlYW1jYWxsIHZhcmlhbnRzIGFu
ZCBqdXN0IGFsd2F5cyBzYXZlZC9yZXN0b3JlZD8NCj4gPj4+IENvbnNpZGVyIHRob3NlIHByZW1h
dHVyZSBvcHRpbWl6YXRpb24uIEFueSBwcm9ibGVtcz8NCj4gPj4NCj4gPj4gSSBhZ3JlZSBhbiBh
bHdheXMgdW5pZmllZCBzYXZlZC9yZXN0b3JlZCBoZWxwZXIgaXMgYSBnb29kIHRoaW5nIGlmIHRo
ZQ0KPiA+PiBhZGRpdGlvbmFsIG92ZXJoZWFkIGlzIG5vdCBhIGNvbmNlcm4uDQo+ID4NCj4gPiBJ
IHRoaW5rIHNhdmluZyBhbmQgcmVzdG9yaW5nIGdlbmVyYWwgcHVycG9zZSByZWdpc3RlcnMgYWNy
b3NzIGEgc2VhbWNhbGwNCj4gd291bGQNCj4gPiBub3QgYmUgYSBiaWcgb3ZlcmhlYWQgZ2l2ZW4g
dGhlIGFtb3VudCBvZiBvdGhlciB3b3JrIGhhcHBlbmluZyBkdXJpbmcgYQ0KPiA+IHNlYW1jYWxs
LiBQcm9iYWJseSBzbWFsbCBlbm91Z2ggdGhhdCB3ZSBjb3VsZCBub3QgZXZlbiBoYXZlIHRvIG1l
YXN1cmUgaXQNCj4gdG8NCj4gPiBtYWtlIHRoZSBjYXNlIGZvciB0aGUgcGF0Y2guIEFueSBjb3Vu
dGVyIHBvaW50cz8NCj4gDQo+IE5vLiBJdCBsb29rcyBkb2FibGUgdG8gbWUuDQo+IA0KPiBJSVVD
LCB5b3Ugd2FudCB1cyB0byBzZXQgYXNpZGUgdGhlIGRlY2lzaW9uIG9mIHdoZXRoZXIgdG8gcmVt
b3ZlIHRoZQ0KPiByZXF1aXJlbWVudA0KPiBvZiAiUjgtUjE1IGFyZSByZXNlcnZlZCB0byAwIG9u
IFRERy5ETUFSLkFDQ0VQVCIuIEJ1dCB0byBleHBsb3JlIHRoZQ0KPiBkaXJlY3Rpb24NCj4gb2Yg
dW5pZnlpbmcgdGhlIFNFQU1DQUxML1REQ0FMTCBoZWxwZXIgdG8gYWx3YXlzIHNhdmUgYW5kIHJl
c3RvcmUgdGhlDQo+IHJlZ2lzdGVycy4NCj4gSWYgdGhlIHVuaWZpY2F0aW9uIGlzIGFjY2VwdGVk
LCB0aGVuIHdoZXRoZXIgIlI4LVIxNSBhcmUgcmVzZXJ2ZWQgdG8gMCBvbg0KPiBUREcuRE1BUi5B
Q0NFUFQiIHdvbid0IG1hdHRlciBtdWNoLiBJcyBteSB1bmRlcnN0YW5kIGNvcnJlY3Q/DQo+IA0K
PiA8c25pcD4NCg0Kc291bmRzIHJlYXNvbmFibGUuDQoNCj4gPj4+PiA0LiBURFhfUEFHRV9BTFJF
QURZX0FDQ0VQVEVEIGlzIGxpc3RlZCBhcyB0aGUgcG9zc2libGUgcmV0dXJuIGNvZGUNCj4gZm9y
DQo+ID4+Pj4gwqDCoCBUREcuVERJLk1NSU8uQUNDRVBUIHdoaWxlIHRoZSBkZXNjcmlwdGlvbiBv
Zg0KPiBUREcuVERJLk1NSU8uQUNDRVBUIHJlYWRzOg0KPiA+Pj4+DQo+ID4+Pj4gwqDCoMKgwqAg
SWYgdGhlIHBhZ2UgaXMgYWxyZWFkeSBNTUlPX01BUFBFRCwgc2tpcCB0aGUgcGFnZS4NCj4gPj4+
Pg0KPiA+Pj4+IMKgwqAgVGhleSBjb25mbGljdCB3aXRoIGVhY2ggb3RoZXIgYW5kIGxlYWQgdG8g
Y29uZnVzaW9uLg0KPiA+Pj4NCj4gPj4+IEknZCB0aGluayBpZiB0aGUgcGFnZSBzaXplIGlzIGlu
Y29ycmVjdCBpdCBzaG91bGQgcmV0dXJuDQo+ID4+PiBURFhfTU1JT19BQ0NFUFRfU0laRV9NSVNN
QVRDSC4gSWYgaXQgaXMgYWxyZWFkeSBhY2NlcHRlZCBpdCBzaG91bGQNCj4gcmV0dXJuDQo+ID4+
PiBURFhfUEFHRV9BTFJFQURZX0FDQ0VQVEVELiBJbiB0aGUgY2FzZSBvZiBtaXNtYXRjaGVkIHNp
emUgYnV0DQo+IGFscmVhZHkNCj4gPj4+IGFjY2VwdGVkDQo+ID4+PiBwYWdlLCBpZGVhbGx5IGl0
IHdvdWxkIHJldHVybiBURFhfUEFHRV9BTFJFQURZX0FDQ0VQVEVELCBidXQgaXQNCj4gd291bGQg
YmUgb2sNCj4gPj4+IGlmDQo+ID4+PiBpdCByZXR1cm5zIFREWF9NTUlPX0FDQ0VQVF9TSVpFX01J
U01BVENILg0KPiA+Pg0KPiA+PiBGb3IgcHJpdmF0ZSBtZW1vcnkgYWNjZXB0LCBpZiB0aGUgbWFw
cGluZyBpcyBub3QgYWNjZXB0ZWQgYnkgdGhlIGd1ZXN0IHlldDoNCj4gPj4NCj4gPj4gwqAtIHdo
ZW4gYWNjZXB0IGxldmVsID4gbWFwcGVkIGxldmVsLCBTSVpFX01JU01BVENIIGlzIHJldHVybmVk
IHNvIHRoYXQNCj4gZ3Vlc3QNCj4gPj4gY2FuDQo+ID4+IMKgwqAgdHJ5IGFjY2VwdGluZyBhdCBh
IGxvd2VyIGxldmVsLg0KPiA+Pg0KPiA+PiDCoMKgIFREWF9NTUlPX0FDQ0VQVF9TSVpFX01JU01B
VENIIGlzIGFsc28gcmV0dXJuZWQgZm9yIE1NSU8gaW4gc3VjaA0KPiBjYXNlLiBUaGV5DQo+ID4+
IMKgwqAgYXJlIGNvbnNpc3RlbnQuDQo+ID4+DQo+ID4+IMKgLSB3aGVuIGFjY2VwdCBsZXZlbCA8
IG1hcHBlZCBsZXZlbCwgRVBUIHZpb2xhdGlvbiBoYXBwZW5zIHNvIHRoYXQgaG9zdA0KPiBjYW4N
Cj4gPj4gwqDCoCBkZW1vdGUgdGhlIG1hcHBpbmcuDQo+ID4+DQo+ID4+IMKgwqAgVGhlcmUgaXMg
bm8gYmVoYXZpb3IgZGVmaW5lZCBmb3Igc3VjaCBjYXNlLiBCdXQgSSB0aGluayB0aGUgcmVhc29u
YWJsZQ0KPiA+PiBvcHRpb24NCj4gPj4gwqDCoCBpcyBhbHNvIHRvIEVQVCB2aW9sYXRpb24gdG8g
dGhlIGhvc3QgdG8gcmVxdWVzdCB0aGUgaG9zdCBtYXBzIGF0IGxvd2VyDQo+ID4+IGxldmVsLg0K
PiA+PiDCoMKgIEZvcmNpbmcgdGhlIGd1ZXN0IHRvIGEgaGlnaGVyIGxldmVsIGRvZXNuJ3Qgc291
bmQgcmVhc29uYWJsZSBiZWNhdXNlIHRoZQ0KPiA+PiDCoMKgIGd1ZXN0IG1pZ2h0IG5vdCB3YW50
IHRoZSB3aG9sZSByYW5nZSBvZiAyTSBNTUlPIGlzIGFjY2Vzc2libGUgYnkgdGhlDQo+ID4+IGRy
aXZlci4NCj4gPj4NCj4gPj4gUmVnYXJkaW5nIEFMUkVBRFlfQUNDRVBULCB3ZSBuZWVkIGl0IGZv
ciBwcml2YXRlIG1lbW9yeSBiZWNhdXNlIGENCj4gc3VjY2Vzc2Z1bA0KPiA+PiBhY2NlcHRhbmNl
IG9mIHByaXZhdGUgbWVtb3J5IHdpbGwgY2xlYXIgdGhlIGNvbnRlbnQgdG8gMC4gVERYIG1vZHVs
ZQ0KPiBkb24ndA0KPiA+PiBrbm93DQo+ID4+IHRoZSBpbnRlbnQgb2YgdGhlIGd1ZXN0LCBzbyBp
dCBtYWtlcyBzZW5zZSB0byByZXR1cm4gYW4gZXJyb3IgY29kZSB0byB0ZWxsDQo+ID4+IGd1ZXN0
DQo+ID4+IHRoZSBwYWdlIGlzIGFscmVhZHkgYWNjZXB0ZWQgd2l0aG91dCBjbGVhcmluZyBpdC4g
SWYgZ3Vlc3Qgd2FudHMgdG8gY2xlYXIgdGhlDQo+ID4+IHBhZ2UsIGl0IGNhbiBkbyBpdCBpdHNl
bGYuDQo+ID4+DQo+ID4+IEJ1dCBmb3IgTU1JTywgdGhlcmUgaXMgbm8gc3VjaCBjbGVhcmluZyBz
ZW1hbnRpYy4gU2tpcCBvbiB0aGUgYWxyZWFkeS0NCj4gYWNjZXB0ZWQNCj4gPj4gTU1JTyBwYWdl
IGFuZCByZXR1cm4gc3VjY2VzcyBzZWVtcyB0byBoYXZlIG5vIHByb2JsZW0uIEJlc2lkZXMsDQo+
IHByaXZhdGUgbWVtb3J5DQo+ID4+IGFjY2VwdCBpcyBvcGVyYXRpbmcgb24gYSBzaW5nbGUgKGh1
Z2UpIHBhZ2UgYnV0IHRoZSBNTUlPIGFjY2VwdCBpcw0KPiBvcGVyYXRpbmcNCj4gPj4gb24NCj4g
Pj4gYSByYW5nZS4gUmV0dXJuIEFMUkVBRFlfQUNDRVBUIHdvdWxkIGluY3JlYXNlIHRoZSBjb21w
bGV4aXR5IG9uIHRoZQ0KPiBvdXRwdXQgdG8NCj4gPj4gdGVsbCB0aGUgY3VycmVudCBzdGF0dXMg
YnV0IHdpdGhvdXQgYW55IHJlYWwgYmVuZWZpdC4NCj4gPg0KPiA+IEluIHRoZSBwYXN0IGRpc2N1
c3Npb24gb24gcHJpdmF0ZSBtZW1vcnkgYWNjZXB0LCBzb21lb25lIG1hZGUgdGhlIHBvaW50DQo+
IHRoYXQgcmUtDQo+ID4gYWNjZXB0aW5nIG1lbW9yeSBzaG91bGQgYmUgZml4ZWQgaW4gdGhlIGNh
bGxlciBiZWNhdXNlIGl0IGNvdWxkIGJlIGENCj4gd2Vha25lc3MNCj4gPiB1c2VkIHRvIGF0dGFj
ayB0aGUgZ3Vlc3QuIElmIHRoZSBrZXJuZWwgaXMgY29uZnVzZWQsIHRoZSBob3N0IGNvdWxkIHpl
cm8NCj4gbWVtb3J5DQo+ID4gZm9yIHRoZSBndWVzdCBhcyBwYXJ0IG9mIHNvbWUgYXR0YWNrLCBv
ciB0aGUgbmV3IGNhbGxlciBvZiBhY2NlcHQgY291bGQgYmUNCj4gPiBzdXJwcmlzZWQgYnkgdW4t
emVyb2VkIG1lbW9yeS4gVGhpcyBjYW1lIHVwIHdoZW4gdGhlIG1lbW9yeSBob3QNCj4gcmVwbHVn
IGJ1ZyB0aGF0DQo+ID4gd2FzIGV2ZW50dWFsbHkgZml4ZWQgaW4gcWVtdSBwYXJ0bHkgdG8gYXZv
aWQgYWxsb3dpbmcgc3Vydml2YWwgb2YgcmUtDQo+IGFjY2VwdGluZw0KPiA+IG1lbW9yeSBpbiB0
aGUgZ3Vlc3QuwqAoYW5kIGNhdWdodCBieSB0aGUgYWxyZWFkeSBhY2NlcHRlZCBlcnJvciBjb2Rl
KS4gV2UNCj4gPiBkaXNjdXNzZWQgaWYgdGhlIGd1ZXN0IGNvdWxkIGhhbmRsZSB0aGUgZXJyb3Ig
Ynkgc2ltcGx5IHJlLXplcm9pbmcgdGhlDQo+IG1lbW9yeQ0KPiA+IGFmdGVyIGEgZG91YmxlIGFj
Y2VwdC4gQnV0IHRoZW4gdGhlIGRlYmF0ZSB3YXMgd2hldGhlciB0aGlzIHdvdWxkIGNvdmVyDQo+
IHVwIGJ1Z3MuDQo+ID4NCj4gPiBJIHRoaW5rIGEgc2ltaWxhciBjYXNlIGNvdWxkIGJlIG1hZGUg
Zm9yIE1NSU8sIHdoaWNoIGlzIHByb2JhYmx5IHRoZQ0KPiBwdXJwb3NlIG9mDQo+ID4gdGhpcyBl
cnJvcj8NCj4gDQo+IFJlLWFjY2VwdCBvZiBtZW1vcnkgaGFzIHRoZSBlZmZlY3QgdG8gcmVzZXQg
dGhlIG1lbW9yeSBjb250ZW50IDAuIEJ1dCByZS0NCj4gYWNjZXB0DQo+IG9mIE1NSU8gZG9lc24n
dCBkbyBhbnkgaGFybSwgYXMgSSBzZWUgaXQuDQoNCmR1bWIgcXVlc3Rpb24gLSB3aHkgd291bGQg
dGhlIGd1ZXN0IHdhbnQgdG8gcmUtYWNjZXB0IGEgbWVtb3J5LCBpbg0KZGlmZmVyZW50IHNpemVz
PyBpcyB0aGVyZSBhIGNvbmNyZXRlIGV4YW1wbGU/DQoNCj4gDQo+ID4gVGhlIGd1ZXN0IGNvdWxk
IGdldCBjb25mdXNlZCBhYm91dCB3aGljaCBNTUlPIGFkZHJlc3MgaXMgbWFwcGVkIGF0IGENCj4g
PiBwYXJ0aWN1bGFyIEdQQT8NCj4gDQo+IEknbSBub3Qgc3VyZS4gR3Vlc3QgZG9lc24ndCBjYXJl
IHRoZSBtYXBwaW5nIGJldHdlZW4gTU1JTyBhbmQgR1BBLiBUaGUNCj4gVFNNIGFuZA0KPiBzZWN1
cmUgZmlybXdhcmUgd2lsbCBoZWxwIHZhbGlkYXRlIHRoYXQgdGhlIGhvc3QgVk1NIGhhcyBtYXBw
ZWQgdGhlIEdQQSB0bw0KPiB0aGUNCj4gY29ycmVjdCBNTUlPIHJlc291cmNlIG9mIHRoZSBjb3Jy
ZXNwb25kaW5nIGhhcmVkd2FyZSBkZXZpY2UuICBBbmQgTU1JTw0KPiBjYW5ub3QgYmUNCj4gY29u
dmVydGVkIGJldHdlZW4gc2hhcmVkL3ByaXZhdGUgYmFjayBhbmQgZm9ydGggcnVudGltZS4gRHVy
aW5nIHRoZQ0KDQppcyBpdCB0cnVlPyB3aGVuIHRoZSBkZXZpY2UgdHJhbnNpdGlvbnMgZnJvbSBs
b2NrZWQgdG8gdW5sb2NrZWQgaXQgdGhlbiBnb2VzDQpmcm9tIHByaXZhdGUgdG8gc2hhcmVkPw0K
DQo+IGxpZmV0aW1lLA0KPiBndWVzdCBrZXJuZWwgb25seSBuZWVkcyB0byBhY2NlcHQgdGhlIHBy
aXZhdGUgTU1JTyBvbmNlIGFmdGVyIHRoZSBkZXZpY2UgaXMNCj4gbG9ja2VkIGFuZCBhY2NlcHRl
ZC4NCj4gDQo+ID4gVGhlcmUgbXVzdCBiZSBzb21lIHRydXN0aW5nIGludGVuZGVkIGFzIHBhcnQg
b2YgdGhlIG9wZXJhdGlvbiBvcg0KPiA+IHdoeSBldmVuIGhhdmUgdGhlIE1NSU8gYWNjZXB0IGlu
IHRoZSBndWVzdCBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+IA0KPiBXZSBoYXZlIHR3byByZWFzb25z
Og0KPiAxLiB0aGUgc2FtZSBmb3IgdGhlIHBhZ2UgYWNjZXB0LiBBY2NlcHRpbmcgdGhlIHBhZ2Uv
TU1JTyBieSB0aGUgZ3Vlc3QNCj4gcHJldmVudHMNCj4gaG9zdCBmcm9tIG1hcHBpbmcgYSBuZXcg
cGFnZS9NTUlPIHRvIHRoZSBHUEEgd2l0aG91dCBndWVzdCdzIGF3YXJlbmVzcy4NCj4gDQo+IDIu
IFREWCBtb2R1bGUgd2lsbCB2YWxpZGF0ZSB0aGF0IHRoZSBob3N0IG1hcHMgdGhlIGNvcnJlY3Qg
TU1JTyByZXNvdXJjZSB0bw0KPiB0aGUNCj4gR1BBLg0KPiANCj4gPiBTbyBJIHRoaW5rIGlmIHdl
IGRvbid0IG5lZWQgdGhlIGVycm9yLCB3aHkgZXZlbiBuZWVkIHRoZSBNTUlPIGFjY2VwdCBjYWxs
DQo+IGF0DQo+ID4gYWxsPyBCdXQgd2UgcHJvYmFibHkgd2FudCBib3RoLg0KPiANCj4gVGhlIEFM
UkVBRFlfQUNDRVBUIGVycm9yIGNvZGUgYW5kIE1NSU8gYWNjZXB0IGFyZSB0d28gdGhpbmdzLiBX
ZSBjYXJlDQo+IGlmIHRoZQ0KPiBNTUlPIGlzIGFjY2VwdGVkIG9yIG5vdCwgYnV0IHdlIGRvbid0
IGNhcmUgaG93IG1hbnkgdGltZXMgdGhlIE1NSU8gaXMNCj4gYWNjZXB0ZWQuDQo+IA0KPiA+IEFu
ZCBJIGFsc28gZG9uJ3Qgc2VlIGEgbWFqb3Igc2ltcGxpY2l0eSBiZW5lZml0IHRvIGRyb3BwaW5n
IGVycm9yLiBXaGF0IGlzDQo+IHRoZQ0KPiA+IHNhdmluZ3M/DQo+IA0KPiBJdCBtYWtlcyB0aGUg
Z3Vlc3QgY29kZSBzaW1wbGVyIHRoYXQgdGhlIGd1ZXN0IGRvZXNuJ3QgbmVlZCB0byBpbXBsZW1l
bnQNCj4gdGhlDQo+IHNraXBwaW5nIGl0c2VsZi4NCg0Kc2ltcGxlciBjb21wYXJlZCB0byB0cmVh
dGluZyBBTFJFQURZX0FDQ0VQVCBhcyBzdWNjZXNzPw0K
