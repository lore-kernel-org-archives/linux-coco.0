Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794349525;
	b=2yvOxSThOZafZXpi0JC8bT++rjwY1RQBPLNzB3SnB4RNEwBtY6QN6GoXebT+TsZDd7VU
	 Zn2yvUrSEubQnsqodnvHhoEpiBUa4EYmARcl7/w7TVb5Dq6/ur1yqsvfoxxSny8l1gaGG
	 ASHnH/KyIMsoDfyPzZKxeWyY03erBxnKFVErOFs60pmE5O9aLwnPyvGGh/VNKGPjFDHCq
	 A0HMtkVnAS8wehl8DJ1Uw6QY2HhqoTlUQehgUGg1qo3cJoCYzmGYwK3ntzscoeozjgrRr
	 e631+bqEBtfXqlCNYE/RA0uwIp2jfYeC3GTf8R9CWCR1MDsvAVX+Bk8YIpsv+HQ1/4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794349525;
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
	bh=UBID0tKHjcCNvIiNjel0u2GYuo8bv5eXYvjE1QIyZEs=;
	b=oSbH3/NaIkWKQ9mgA+I2T2sK+PyAJPbpCXDt/RVKmHX1hg3no/s/2WJWH+Kh/KebU1uL
	 9UUh6jszcG7ScOQtPFlOoPQ0HvO4onil1gGuj3Ifi260Lo2xRuok+ITtXot7oyxQnErTe
	 J8LHMYb2OqnAdJA208pLusvEg/yClB3GVDFe2tuebttFTWTvlDwG1ATgrvxidBTxDSABs
	 wxU7Mc/SCpY27tZSOEuigRDIILpmWAh5C8Qnl3YUnEOPXrncIVawXRjxJpcHai9Bsjfct
	 FCK0hWyBsZJuNzPts22fws0qHh3XNIaLxdiOUmrQYzLm2jPE10KnxDEE78ZxJfmqybQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iU6ps5MV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AD606A339
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 22:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30AD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iU6ps5MV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794349525; x=1825885525;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UBID0tKHjcCNvIiNjel0u2GYuo8bv5eXYvjE1QIyZEs=;
  b=iU6ps5MVsrJwWHz+hfrdHB+ml73rSmymAEmJPJwvokk1DVU6A8VHV2yL
   9UNh8znGiNJzypqjtHc7fXsVb+CP2S4N5plK/UdGHLyOv/tSwjmv0gUl9
   wKRIaVbtWH2hxm4SLvlhR7QqqO/Y4vMzr/Ax61t96doy339ku4R4/tT8b
   k2PXt6TYLXu7DMKF0i0KqhbbH620VkjavRYmYyFgdSmmfyZnK0Xor2Mig
   Lqxq+sLH0jHdoEJmPleXXV2mL6pwWnBv6PnTscRf5k8Rtdh11ahzrNofv
   fETxJslCFLReTKeBBkuCboXf6c8fuYLtfTRlIoktW5s0NN8RNTM9eiF9T
   g==;
X-CSE-ConnectionGUID: zs25LvpPRmSC8husEWZXmA==
X-CSE-MsgGUID: mJXdaeKwSwWvwjCJoNz/dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3196057"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3196057"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 14:25:24 -0800
X-CSE-ConnectionGUID: heusir0YTuykLP8KIbY9Zw==
X-CSE-MsgGUID: cQnyTvuKSdylzFvGwTLXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8422581"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 14:25:22 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 14:25:21 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 14:25:21 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 14:25:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxH7I7+GJqHpl1Jitg3fg5L7fZ14CMctyPUOtXFGwbHFrfVEktnRDiTnSKPxLyFbZciqIBLUcug2qK4eS64JC/qNq6p04tQQJXR+/olYYlOccr4aFepwtz1oLh2dv6DAjPa2gcf10jrBCVYOY+Fk9izeZ18gTc7VDMpgic+vBDzNzMLuYQol2ZwCP2LCJtTRiixjJORbXlgQ7TnLa1QS672noNA7kdadSc+PUcq3r/KI4tEvOmp+zczVU00N+X/3Y8OBbFOWtnZLThEJDXjo2ZHPZCgyZx7BzR33dh+eVOVuRySLMqOehZq7soffGvcMuBYdPo+sktK5ANORelxpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBID0tKHjcCNvIiNjel0u2GYuo8bv5eXYvjE1QIyZEs=;
 b=F006dnGHMmHWkrCkRvsprlryDN/CBBK/vg743HyPsS2Fo3eCgxgePQm1+YMm272T45or+1chgEvzxpxpFJ4DS44WRyuBzGGKmjjHJQtltZI+1tb+zYZTFV5ybz0H0rJWASl23jy4+FiZkUscyoPUK/OHMRFcz04nRShCPiIIKYfddwpVe8IxaK2FCNZr0CbwBQymjp9X7T5yuaGZEGflnPPBvqNQfRJI8+gKYHTJpamjelHxuSVZY1rtIn6XGnImwnMPLb00ygSytLR3ugRU7B9XJ3RZ31nRJgkGGDN4l888IqcyHuajmX9lJC8yQY8tgALkqmoA2A0eIyS5CwBBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by DM3PR11MB8672.namprd11.prod.outlook.com
 (2603:10b6:0:44::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 22:25:07 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 22:25:07 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "jgg@nvidia.com" <jgg@nvidia.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
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
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCACkAugIAAmzsAgAARWICAACktgA==
Date: Tue, 10 Nov 2026 22:25:07 +0000
Message-ID: <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
References: <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
	 <20261110195745.GG738765@nvidia.com>
In-Reply-To: <20261110195745.GG738765@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|DM3PR11MB8672:EE_
x-ms-office365-filtering-correlation-id: 2e7a237c-caea-4a5f-e23a-08df3f7979b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|4143699003|10067099003|261028144727099003|261026121527099003|261026140227099003|261021135927099003|261022075727099003|261022105027099003|56012099006|38070700021|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: KRkZ5FgaHmspDIP4wVzwhZ+xTStNdL62muSn2d7IH49+9o1NPAeFGlrERdVVm5+VlQdUy9zuu1gn2bg+SyIPAgEUu8+9OSIolCr4NPSIUFWZBT26f06jdnnKlZUpHD0gpkSyzcMQ1TebjEgnBYXQoBqskX4LHIlhf1bbY9OKhX5JFgestlBzi+A5jb86QR8JhPwjBOkite9U9ipeMPDBUO456SEnhbfUmmXqlrwFSsf8mfuN4cbk1psBzAdhIThN+1F1MdsAt3PJWX/e3i/1R3dtzfrQKDZ3L/kEkZGilvtFGpaxTy9Sy53Q2wQLN6VAdvoZViZ3F2tIyu93B+qNxO/ru6SqN1El+iBi75KA+++Rt85w7+2FAGqct4Bmt9rIaKB13lMqs61k/jnd9EeS4qgBJFJ3Sb2aP7g+NcKuTo7DNwDDEM2A+M3LuiHE3mbMjd0RcpH1HgVXWakj/bYm95MDzAVN+GcIU8IlkPx7aiCz5aL07y7t4NbKGBxED2B4VfRrkOQXzMGItezi3AH/VdmdSQLocAlfawHn9QBRTQ6K3KGwh8l7cBaCPkevzdKkgPjJ05zmBSP0VqPeX9z2FLTfR8zLI5oCtddzaSbWvSpsvBvrxZ//3W6pWr27X4cWt0lSiaayytgi2v8XZi5wqrWgKgo5AmMfvoWBqAZAxOrs++CUJ/E3V/UCEpIxNLySPUCWKwNgYJQzBQStp90ue2KgHGhL9Ore+3/I2M1JTCU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(4143699003)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021135927099003)(261022075727099003)(261022105027099003)(56012099006)(38070700021)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ty8vYnVCckR6NFk2OVVsWWNVbUU1Zk82OUdFS1NVZzdiWXlEN2Z4YmNUMXgz?=
 =?utf-8?B?NnBDNjNQNmZrVlN0Q2Fkd2dkemZjVXJsZ0dHL05zUWNVSS9PMHMzSnZKL3Zu?=
 =?utf-8?B?ZGh0VEx4MGRJOEQxSURPU1pmcTg4UzFOQW5rK0xiRUxPQ0xReDNVM0pZdVg3?=
 =?utf-8?B?S1pzNlV2UE52SGVqd2hrZDBWK0NaTkd0ZFBwNmZ2dTZmUDdvbU5majc4Um9o?=
 =?utf-8?B?L1M0eHZQeFRrOGxZTDBkZnFEUGtmM0JheVRzWkNSd2dOd0VsMlNJMkhNUXBB?=
 =?utf-8?B?TENaMVRVbUVuc1F2cUxNVVBPRm50djVwcDc2eU1OcldZN05LOXBIYnliUmtQ?=
 =?utf-8?B?U0xjVE0yY2ZKdnVjUGJ6RTVUQW1BSmg0cXgxa3Z6WFh6dkQxOWZKYys4alBT?=
 =?utf-8?B?aURBR0Z6cklCTzBVcXcySTJqbXVEU21ZOGI2ZWc1ZVNHMnVGd3Y0aE9qcitW?=
 =?utf-8?B?TzRkc1dhdVlMaWlFbDRwT3dZQ1IvRllTUTgvSEZIWGttVUp1ZjhYeTR1RHRs?=
 =?utf-8?B?YWpCTXFIUmNNVm16SCtCVnJ1bGpLMW93Sk5mNUV3M2ZuS21xbEhkZTArZGUw?=
 =?utf-8?B?VFdVZTNHQVdYTUNXSkdBT3NXbmU1ZlY2UWVCVzc1SXZTUkxyWk9GeUVjTE96?=
 =?utf-8?B?S0pHT3h4NDFOYzR2ZStzZzJnUStKTVJJWFZKWHZZN0pWSElUZzhvbFFrMlV3?=
 =?utf-8?B?cE5oeFFPNjdXbUpKM0JmMFBnS3ZRSGxSdUJrZDVzWTdCK1pVdnRFd0Q4ZzlL?=
 =?utf-8?B?WG9tYmU3RXdqMXh2RWtaUjI0MnlCaVo4T0FPTnhsWTJGcTBUOGoyakRtNTEw?=
 =?utf-8?B?dzhtVnlaaUlLK0NpUzR6ZDBLUndwZUlubVUvZVVBWnVzeTQ0WFhSRE5GWVlT?=
 =?utf-8?B?QVpuWjJySFkvamhBSHZLU2orc21jUWhZQ0o4cVAvOExRVXF4WjhYc2x0QlBN?=
 =?utf-8?B?Nm9hU09iT0FTRzZFVitEYllTdnQxQzltbnlveW5PbkhzWm45UGJUbHNJeXE2?=
 =?utf-8?B?dCtoN2ZPTjNac2RaSE1aMlVURVNnNmsxTmJqZTBWZk1uaUpsTXBJdXg5MW01?=
 =?utf-8?B?cis3aHVoU0E2dURBNWY4NVR0N3h3amxCZnpObGoxSWdIVmRHSUNGbm55b0NY?=
 =?utf-8?B?dFBhZEQ5UGJuWHFNdHNUYjRyMVJIZGZGdmg4OEdia2UzWjY1c3lvUE9SY1o4?=
 =?utf-8?B?NmVGbzFZTUE2Z0NJN0pSSlQyZ3hZY0xPWTBzVnEySFpUcUJpeDZObExKcVFq?=
 =?utf-8?B?cEgvUVIyc09ZWVF4UEswSmdpR01aRmNFbml0RzF3V0RPQ1c0RDE2SlhuMzVR?=
 =?utf-8?B?YjVXUkg3R3QvUjBUNy9wUW9EV0paZnJrQ3ZnYmxGdkN1OFoyRUlpYzU4M2d1?=
 =?utf-8?B?SEI0K1Z5Z3VhczRVNDIvQkU4bWU3eXQ5SmxyenpYV0NMUk54L1prVVIwY2x5?=
 =?utf-8?B?Q0VHR3JzZUlPOWMwT3YvYldiYzQyUFVhc3JTZmlqTERFMEhVbCtVYTRWdFhm?=
 =?utf-8?B?UTFzQ0dsbi9kcmtnWWd1MXYzcUpCc0xrdXpEdnBGenROK1NFY1JHOFUyUE1h?=
 =?utf-8?B?SWYyTE1QQ3U5RWF0Y0psV2RTMFVUenhyTWNMamk5Vld6QUo1dHRLUTBYQ2lo?=
 =?utf-8?B?a3VwV2FnOWhzZlpOdEI5bktXcWNMa0hYRzBQOWhvVU84ZWFCVjRXVlZRMlN1?=
 =?utf-8?B?US9aODBZbVVpZUpraGJtMUIrNG5QRnBYRWJldTd2NzUvNU1yWVcyQXVuR1A5?=
 =?utf-8?B?MC82T0l2U2RtdEFQdy9WNXBYbWw1MmRaaE9jbzROa0hxZW16SmczMG9KV3Bj?=
 =?utf-8?B?amg1SjF1eVQ0SXgweWVudXpwTHF0dzhuclhNNVNuQ21oZW9PVFB4bCsveWpK?=
 =?utf-8?B?MmdUMkY3Z2paZkxrU0V5N2t0OGRNdlJ5ZmZaMFlVSTNWd0dGVlVvY3lrdXdP?=
 =?utf-8?B?MEJMRTVucThQMGg1a3Q5ZER3T2dBSGNEdWk4Um9yTmFkSEVNdWV3TFRxZGRv?=
 =?utf-8?B?Z05lSmwyN3NjQ2FiSVJTOTIrM0dyMWV3bEJNYnRGMXZmM29GUEIyQU50eXhy?=
 =?utf-8?B?VWtZRWFYVzA0aUxHWk4rcWVMZzArZGQwTlZIeThOR2lYTDF3NTNJUVNrOEVN?=
 =?utf-8?B?WUFrY3ZFR0ZqVHdKNjFyYUNiZTZzWG5HR1VFZmo2L1o0RUxHQllZcE1LWUJL?=
 =?utf-8?B?MjBaOXhBMmwxRFE2TWpSdFBYTTFiUVVSd0EzaHNHNkJ0aDhsVWhhSUVOdldH?=
 =?utf-8?B?bHhrWFJ1ZTBpUmU2TjhwOHZFeEtJd1lvQ1QycXozd3JmRHBGdFFrM0RDeUtx?=
 =?utf-8?B?dmV5WFBwSzQydmYvL1dwdFRqWTNoNjJuNjh2NzV2SGMxT3lCeUFtdDZRRW9y?=
 =?utf-8?Q?y+e7rGgF4t8zJWSQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05914EC16FADA944905C108DE97A5849@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: DmWNzN7xDpfV1FGe1BfEDO/9lEqyom4c6dQQ8iNQ7Jbob7Z49of8BmRAzjbUie4vjaCqRVUJQkcNnnOBO8YMWm5kXyxBn+eBw9W94ndiG6LP3oh5+NUwYHBhwjm7vwqfvr0T2uzq+y43kC0S0MhdmpJcEw8LCJzpA12g422rQZguCIBqtnVtmrwHNffzRvNJtVTXTxOHknQVjfNnv+v1gsLU4VPSNy7BepNQdB8qKl3w/j6sa+mIuWvIS4hYS5iUNk73tJDJUGL+RiZxfJgYMjeyUm8gQK2GGnZzJ6DEO2U6Caixp5SO6WGe3iq6aMbYmWDSWLHfnE1h4QiBrb3qvw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7a237c-caea-4a5f-e23a-08df3f7979b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 22:25:07.4727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MAnLO0Xzg7LYbrV0QBNsCQSwvhUYY4+3IJ1fLrfSjYpPdsR2KYqJp5+xJhOVtod6pNoVOGA7S6PYp/5X2V7Rve+HunUEcnLKmAOm6AVDrSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8672
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTEwIGF0IDE1OjU3IC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+IE9uIFR1ZSwgTm92IDEwLCAyMDI2IGF0IDA2OjU1OjQxUE0gKzAwMDAsIEVkZ2Vjb21iZSwg
UmljayBQIHdyb3RlOg0KPiANCj4gPiBBZGRpdGlvbmFsbHksIHdlIHNob3VsZCBwcm9iYWJseSBz
ZWUgaWYgSmFzb24gaGFzIGFueSBvcGluaW9uIG9uIHRoZSB0eXBlcyBvZg0KPiA+IGVycm9ycyB0
aGF0IGd1ZXN0IFRTTSB3b3VsZCBsaWtlIHRvIGhhbmRsZS4NCj4gDQo+IE5vdCBhdCB0aGlzIHBv
aW50IDpcIEFuZCBwZXJoYXBzIG5vdCBhdCBhbGwuDQo+IA0KPiBNb3N0IG9mIHRoaXMgc3R1ZmYg
d2lsbCBlbmQgdXAgcm91dGluZyB0aHJvdWdoIHVzZXJzcGFjZSBzbyBpdCBoYXMgdG8NCj4gYmUg
Y29tcHJlc3NlZCBpbnRvIGEgZXJybm8uJw0KPiANCj4gVGhlIHZhcmlvdXMgVk1NIHRvIGd1ZXN0
IHNwZWNzIGxpa2UgR0hDSSBhcmUgZ29pbmcgdG8gZGVmaW5lIHRoZWlyIG93bg0KPiBjb250cmFj
dHMsIGFuZCBpdCBpcyB1cCB0byBJbnRlbCB0byBlbnN1cmUgdGhhdCB0aGUgZnVsbCByb3V0ZSBm
cm9tDQo+IMKgIHRoaXMgY29kZSAtPiBhdHRlc3RhdGlvbiBzdWJzeXN0ZW0gLT4gdWFwaSAtPiB2
bW0gLT4gR0hDSQ0KPiANCj4gUHJlc2VydmVzIHdoYXRldmVyIHNlbWFudGljcyBoYXZlIGJlZW4g
ZGVmaW5lZCBpbiB0aGUgc3BlYy4NCj4gDQo+IEkgZG9uJ3Qga25vdyB0aGUgYW5zd2VyIHRvIHRo
ZSBFQlVTWSBxdWVzdGlvbiwgb3RoZXIgdGhhbg0KPiBUU00vYXR0ZXN0YXRpb24gd2lsbCByZXR1
cm4gdGhhdCB0byB1c2Vyc3BhY2UuIENhbiB5b3VyIFZNTSBhbmQgR0hDSQ0KPiBzb3J0IGl0IG91
dD8NCg0KS2V2aW4gYW5kIFlpbHVuIGFyZSBhbmFseXppbmcgd2hhdCBraW5kIG9mIGVycm9ycyB3
ZSBzaG91bGQgZXhwZWN0IHRoZSBWTU0gdG8NCmhhbmRsZS4gQnV0IHNvbWUgb2YgdGhlIGNhc2Vz
IFpoZW56aG9uZyBsaXN0ZWQgc2VlbSBsaWtlIHRoZXkgY291bGQgYmUNCnNpdHVhdGlvbnMgdHJ1
c3RlZCBJTyBndWVzdHMgY291bGQgZW5jb3VudGVyIGdlbmVyYWxseS4gTGlrZSB0aGUgZXhhbXBs
ZQ0KIltkZXZpY2VdIGZpcm13YXJlIGhhbmdzIGR1cmluZyBsb2NrL3VubG9jayIuIEluIHRoYXQg
Y2FzZSB1bmlmaWNhdGlvbiBpbiBUU00NCmNvdWxkIGJlIG5pY2UuDQoNCkZvciBlcnJvcnMgdGhh
dCBpbmRpY2F0ZSB1bmNvb3BlcmF0aXZlIG9yIGJ1Z2d5IGhvc3QsIHdlIGVsc2V3aGVyZSB3YXJu
IGluIHRoZQ0KVERYIHdyYXBwZXJzLiBCdXQgaW4gY29jbywgbm90IGhhbmRsaW5nIGFuIGVycm9y
IGluIHRoZSBjYWxsZXIgY2FuIGJlIGFuIGF2ZW51ZQ0KdG8gYXR0YWNrIHRoZSBndWVzdC4gU28g
SSBndWVzcyB3ZSB3b3VsZCBjb21tb25seSBuZWVkIHRvIGhhbmRsZSB0aGVzZSBlcnJvcnMgaW4N
CnRoZSBjYWxsZXJzLg0KDQpaaGVuemhvbmcgaGFkIHByZXZpb3VzbHkgc3VnZ2VzdGVkIGEgYm9v
bCB0byBzZXQgYSBkZXZpY2UgYXMgYnVnZ2VkIGZvciB0aGUNCnB1cnBvc2Ugb2YgdHJ5aW5nIHRv
IGNvbnRpbnVlIGd1ZXN0IGV4ZWN1dGlvbiBhcyB3ZWxsIGFzIHBvc3NpYmxlIGluIHRoZSBmYWNl
IG9mDQpob3N0IGlzc3Vlcy4gSSdtIHdhcnkgb2YgcGlja2luZyB1cCBhbnkgY29tcGxleGl0eSB0
byB0cnkgdG8gcHVyc3VlIHRoZSBnb2FsIG9mDQpuaWNlbmVzcyBpbiB0aGUgZmFjZSBvZiBob3N0
IGJ1Z3MuIEJ1dCBub3cgSSdtIHdvbmRlcmluZyBpZiBzb21ldGhpbmcgbGlrZSB0aGF0DQptaWdo
dCBiZSBhIGdvb2Qgd2F5IHRvIGhhdmUgdG8gdGhpbmsgbGVzcyBhYm91dCBzZWN1cml0eSBhc3Bl
Y3RzLiBTbyB3ZSBjb3VsZA0KcmV0dXJuIGFueSB1bmV4cGVjdGVkIGVycm9ycyB0byB1c2Vyc3Bh
Y2UsIGJ1dCBidWcgdGhlIGRldmljZSBvbiB0aGUgd2F5IG91dC4NCg==
