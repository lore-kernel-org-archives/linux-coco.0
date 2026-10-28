Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793167067;
	b=3owocZb4t4xEYTrWtwY/1MBuqhhxW/JcZU+9eKnePY+fJa94k07aaKiib0vruyKtlfhK
	 VNTulg4EyXU6HuEhZrCN/3JIKqVRyPgJh4PumHMMaxqDFaohTb83YHR+UMXw8/zf10Rnt
	 SWXrMQXxpcf9/noyx9ZMFLOLSAaEPVl+9j9+kAMXLqTQgN2rcIio5y51sBo1G1Jn6OYuU
	 pMKhKJiCZ7tIdUTQOmnjQu2iUpuas9hvvK3dDmKrYOOMgW6PoZKqByrx+J5uTfVsYxP+j
	 EadBafiQE05eTw+5wn5J3kVrVRo40acH07ncKw613PTN5TpzOOI08BFJurrXLP1CgGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167067;
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
	bh=7Iy4wcwoU4KYkq1o/2yRVigpZK1PHTorDa9nUdIsk/s=;
	b=HtLXPweh9Il4iv+tmpOKoJBhRXVrW62RVQShj1HxyUeyNiXra8HYIluvrWLV+NOcdNr8
	 f22booOMvCx/X1N/aUwElvcIsvqFyK0SgbrAG261R149Hl4r2aZbCAvJEqkdeibYAlJTN
	 DWdnd0KsxGX5A3YMTgERrnrfvVhw0rR+xzgLVf9AFB9XB49dric3lFIXEiZePtk2ew4KD
	 yHKzc0dvepSDAhoc2CLiVt/+/6o2sItV51/ok6YE9yGeItqme6pz+xxyxSf0M+I098KVm
	 XzFpZ8XSmddxcua6QFlNS59ZDr8ZzSrF+kBSJa5aSoBbLbDcMpVK8ckESHbhzUI4R5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hzZjq+AH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B4606A320
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 05:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A25B4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hzZjq+AH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793167066; x=1824703066;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7Iy4wcwoU4KYkq1o/2yRVigpZK1PHTorDa9nUdIsk/s=;
  b=hzZjq+AH+y+VaIBfIHkgEMYu4V7FAdiofZlCBHNkcEoOuat2Mex/yBMO
   VituFx5XtI6AtMVv1ZLtVpuPHsF3nptn28V+dxQkQC6dUNuSuVHvPcoYR
   qzinrGBQ/pP9qu6KBHgHB+ZnX/os8ZYM61HwDq43xOrXqq2XGr4BdDYe3
   pScZEmoSN31rbqsnkz9RWCyoq3i9YbVRWNfbD08IPAp6l4HCZVzrc9Wdv
   Ni/jDFuyyeHcMjRIsS0B0jSVSeFemNF0eIxkM/UZoKf+l2YtTYq6JTWB4
   ylwNeXvimqlBGtg/cDMYx5F4D7UNA/cmcuydJuoElK+dHN8AOP6T7wRrc
   g==;
X-CSE-ConnectionGUID: jewaUx4zSrKrhEAqOQ/UMA==
X-CSE-MsgGUID: jnlTQMyvQW6354tnsqzJyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1886007"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1886007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:57:45 -0700
X-CSE-ConnectionGUID: SlbUY2D7SZq60kql90k2Bg==
X-CSE-MsgGUID: 2P7jTcTuSnWe+X1A4887ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5141491"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:57:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 22:57:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 22:57:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:57:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD+QBJyYz+y54NL7Z92xaOnSvU0+xLV7lbpppraP4s5iuFox00d7Ia8O+glfS9xrtFJVspyBoYCI3BaA9yau8bW2KmEt2BawCtagMTsCYec20Ja8WWoG1kY9eQqNGtsB8sQZ3qCjqCaofoQDm2A5ogb5Ywi1OSK8VxuuFARUUKB7DskF7/DJMFyi8BzS0nXbKafIWqZCR1Kc0g50lNhpeBv7ea7ygRDoi/MFNZU5NxP+x9r5pw3NEbjL4D/FK4FHpiMK8e93L7IDtLtlJH4m7HwC6sT2Y5FAJpfL5dLP7Qvy5HRPcG+aoCXwxiGEj867kyUnSje4dFrAtS16Yw+YIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Iy4wcwoU4KYkq1o/2yRVigpZK1PHTorDa9nUdIsk/s=;
 b=REQz72yANhbXrVGeNpvBG9qbLQytzmsJErLGkKW/FdYFw0XpXmw4IyI8YI48IT44nvw/gVGlxXikXA0HaMVxP33D9h7i90YF47hcps0xu4URy+TZCIP7KH2CPwprobfhCTekqoorxdGW5Z83ucUNchcloox7pLqHgiH6kFlfUY3xGWYqGZvmCnJHTWxHjx7UYo20giLiQCgLlDVveg0NNAzYbTGykJgHBJF5BQBmyNCwxs8EH1d4sas+NHqaMptdc/wLJ6J5Xr1Xvd8l+u9TnGkYJQuPoTv4o68eTqCGCu88XQ1okYi1cTqnzfHeltmSyBItOpHGddxnvw3ns0TsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 05:57:34 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 05:57:33 +0000
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
Subject: RE: [RFC PATCH 14/15] x86/tdx: Add TDG.DMAR.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 14/15] x86/tdx: Add TDG.DMAR.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rcUDRU/HL2a0CZtMIXl65RArcPoqqAgAMH6PA=
Date: Wed, 28 Oct 2026 05:57:32 +0000
Message-ID: <IA3PR11MB91367BF13A23FF40FD0536A7926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-15-zhenzhong.duan@intel.com>
 <bc2fc3a1-b2e0-4262-bced-40211db5f0df@intel.com>
In-Reply-To: <bc2fc3a1-b2e0-4262-bced-40211db5f0df@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH7PR11MB6450:EE_
x-ms-office365-filtering-correlation-id: 756cc06d-4643-4876-9227-08df34b85bd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|5023799004|4143699003|56012099006|261021121427099003|261009223027099003|11063799006|10067099003|261022075727099003|22082099003|18002099003|261026121527099003|38070700021;
x-microsoft-antispam-message-info: XFq4bgVveAoLULlq1uPbsFMWs1TUxZxFF0eLP7Nzzy+6puB0s8DoLVWQwIaE+SeIoWtctkYQP+L2k2qgOP7krO4vwKeT7I0PVmc8+8PgfWR4tB7Hw5VxhqFKqsFaQZK3mtyeZiIARcbUWfWskGmu3I7fp9mGYe3q/HlKiufwwN15ykIJh22PIOS4jsd1mrSIrM+Di/qze3L7rGxCTbCiqK8N1fs9PgaL0F0UT0whqVu/ohdO1ZajbByL/LxQVEtmV+qOfrxpa26y/wo2/lbtS04ndMmB8OL9OMn2fUjsOSjBcvgDMWhyHqvQZMTiZKbfIC72jdVdLkTV2ZQO+lZ6RHKk/T1+qOcH4z8uJY3OEHj1Q9PFlCCmMS6+LVCRG41pSlqKtC8hStZ80JmHpZSc5IyixVcz4UfWTEINcccDugk+I4BP779pkdrkf5wG5WzxfCN6ndASzaB9BtZwYPQrys4Zv7uUrnacvaR1OttSsQJkBAMUVpve6jF64NIVsuc8JJFK5K6XRlVsRS1ub2tCW8SxGXxHZKHZMyw3ukehmbMTC9B4wDIj3842qi2YjtNDw6z6Oll+qDPkLL2Bcujb0ummsYTov7aaQH1PItoOQO9MLSy4YCDpyoO8mAJYFpv5kdiIGr8tS1q56ppfZdX4Qsk68Hsp+Hzz1Gyqwg1DBVLDxPiBSlsowcZBmcjm9AU8ApI8/Dl029fDOwmfEnsR5jTASc1lUUc+VrCAGa6AZXw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(5023799004)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(11063799006)(10067099003)(261022075727099003)(22082099003)(18002099003)(261026121527099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVFyYlpsaUdnZUVkNFQrMzBJbXRxVUllZ21qdEJCbUFPTDNCMmFSR3Nqd0g0?=
 =?utf-8?B?SlQ0OGo2R1d1d0dMQTZjWCtGbjFWdlRidnFzdFVhSm80UVVXclg1OHJoUWdF?=
 =?utf-8?B?YVNDc2dHVy9hNnY0b2ZNeHU2bmh6czNnbExvMUVFU09GYnJybWd5Ti9XK3R4?=
 =?utf-8?B?K1RhTHMvRkg5aFF1ZVFBTkQxbk9rbWhJSnBLUzJxdkVocFV0a3lpV1lnTGky?=
 =?utf-8?B?dUZoUytBMVIwb2dGNlJya0M5SzdNcnFubDNGVS9zUmtIZTRkdWppcVE0a2Nj?=
 =?utf-8?B?WTZhYldlQ0xrOWw0VHdGR3QrVCtuaVpiZXZaMFc4TGU4c0VWRjc4ckpHK0lk?=
 =?utf-8?B?Qzg3TnZwbVcwUkcwMy8yVi9LdEI2eG0wU2xWRmIyYStGSkw1REdJSmNhdkxr?=
 =?utf-8?B?Mm5Lc3hmVWxZOEFYdGwyRDNzS3JaekpCV0kzNHFtZzBPczgvVTNJWTJoZ0Fw?=
 =?utf-8?B?eWFlV2thczNDa1N3L2NRMFNtWm5HVzQ4bWxpWUFFTjJMZCtXSVl6WXdwNUV2?=
 =?utf-8?B?NGNTVWxMWVNuU28wT0VYdldWckx5MFpUN0lOR3BGMnI1d2szMFg0Zlc2dWFE?=
 =?utf-8?B?b0lYaXk2UkhsOENTUmJIWFZkM3lxSzN0S3FMRjY5SXova2EwZkRZMDYyZjVv?=
 =?utf-8?B?eDh5YWluY1JLQmZ1SFZjbHZSS1RrZjB1eDRKS1BpNW0yandDdTFjaWhaYzdk?=
 =?utf-8?B?WEVPT0lnbmVvUFd1ZTRrTVFEVDduQTFlNU5Wc3JCTEFZUHV6WmxTcWdEa29z?=
 =?utf-8?B?ZEJBWktJc3BCc1Z5bk9hbjVHWEd0Njludmc1bC9OL1ArR3ZyOGhXVm5VY2dB?=
 =?utf-8?B?MkNFWXIybDdWajdwaFdLS0dWTmdZSStqbEZ2OWkzVFBGbldBYS9tWlhESURl?=
 =?utf-8?B?TGZLbEczMUVSSTRFQXl2eUlESGZ1akZrNDJEUnplQWk2V1F0bnlPbUE2VDFP?=
 =?utf-8?B?OHhPTmMweTZLQURaTmp2enpvT3g0WEIxcndoeUthQzI5cnhHbVBOTldxTkJE?=
 =?utf-8?B?R2xDR0EvRnRVeUtjd1NESmphdlg4OEN2WmJlMHBnV1ppS0hyQm9MdnJNN3cw?=
 =?utf-8?B?MmM5UGFXTU8rVThtVkh5WkNZc3hoY0h4V0N6eXZHclUraTlNc1FWM0dhZGNn?=
 =?utf-8?B?T3lMdnMyNnNCRHhTNUNmazJ2TXArREpvSlFzdFlaeDJreWlqclhtS29FeVhG?=
 =?utf-8?B?MmI3YlE1N0h2dldlakZqMUwxbXEyR0gyR3hxemtZSUFVOUk3OUZpSG94Tmtz?=
 =?utf-8?B?WFo4RkZhSkpGL0ZXWWZ4bmIvaWVBTmtCY3kwcm42UnRlcjI2SmdyNEg2MEw4?=
 =?utf-8?B?WlpVMW10UW92N2RpZFlRSlNGYkFvZUhkV2N1Uzh1dzQrei9HUXZ0V21WdnZR?=
 =?utf-8?B?dit3WDlxYjRwR2NVUHdIRnE4bk00cFZnazFlRHAwcXB5Q0J6UUNIbkZ2R2dO?=
 =?utf-8?B?eitLa2dCSm0rT256cnp4VThJSjdycGk2VkNFZEUrc1FVZ2s3ZkVLczZ3Wkpq?=
 =?utf-8?B?bXd3WjhsTzFEREZhVWdSV283QVFTWmdpaTJ3R0RNd1Q1dVY5MHdSK3N6NU1E?=
 =?utf-8?B?N01uTDRacFlDakJ0c050ZGlyRnRkeWw2YlNNTHRWc3hNS29Ga01PWG1DL1oz?=
 =?utf-8?B?UDdGMkV3S1BHQTdNdDhzUTkrQUhwaGpFWGdkNjQyVWVNNFRxVmd4YjFWZ3NO?=
 =?utf-8?B?b281azlRTlpBQ3NBT2dmN3QzZDd3Smg5Znd4aW9od0VtdVkvZ2tIajlubDBp?=
 =?utf-8?B?YVJQZHRiMUdCcy9UZTIvbStTUzU5b1BlRFdxdTFoK01mK0o4dEpSeDRIRlZy?=
 =?utf-8?B?VGVNT1JWUzJaQ1RpTTBHV0hySDVPYnpFWUc5OFhUNkFib1VydEJ0ekJRRGdk?=
 =?utf-8?B?UllOc0tYdHhJZmswTXc3ZURTcmV0TE5KR2thZjRHb3NGT2dyNDZZNGVqSHZ6?=
 =?utf-8?B?WHJ5K085ODdQdGxWM00xQnNkOVU2QVRDTUZEenA3ckhYV25DV0RONDBiSllP?=
 =?utf-8?B?Snk4Q3JaRytEdUxmQkRpK2hLWkxxaFN4aDlLamRMMlA3TU5ObFR5ZlVjVnl3?=
 =?utf-8?B?NUFIU3RYZE4vQTZqVG90SkREZWpKZlRucGVjS0tXd29DMkpGcG9pU0xwUzhv?=
 =?utf-8?B?clpKKytYeit1T3dNMnpYU0Z3dTMrdWpHcnEyNy9VMXhkTng1M3BjWk9EL1Fo?=
 =?utf-8?B?VGNUU0EwSkNERmJDaTBkdEZZVGFzay9Tb24wTEpvMlVWMFRrUERKejVoWnUz?=
 =?utf-8?B?dkJsY3V6RXBZdXh3aWtJT0JyOUgrRGJGUGVVSmRRTkZaN2ZKOUw1dDFYaFlD?=
 =?utf-8?B?UjlFdTVHSzliM0pVQlJxZUphSkprOWZkUnJXdW9XSkxZMXRPQ3BNQT09?=
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
X-Exchange-RoutingPolicyChecked: AL7EQDYdBglimNvznmkTtX9sZ8BMz8OhDIdwx5oElE21lh4RV8AAu1ICx8viIX2DQu9EMCWF2q8mUiY959DjGzxt0F2fay6U/EMiBXQ+9zigttLxiKlJtTQQcWJm+TwDTTPYPiSkrJCjxNZhHfiKQyCagCRWdSs7eESYFfoO0I/4YkaH4noSNp+HF63zUNSCZEwpnUOvEAz0oIjMLcA/d0IhH8OQxrQ8VzQK4rpQH7gsi4QQxZoIUVQjCh5SmQ8y69mxBeWSwCS/ungFEBZa7Ny7eL4lcmfZUltJi+lFiZnGoia/aBH5FTIuCFa4n5Mfaqw2lVhbHA1fYRwt2ofq6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756cc06d-4643-4876-9227-08df34b85bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 05:57:32.8613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4G2QAkQddHxt1qYG9kZihp5AUbsO0WK34RHJjY9HzknrlwJW6S20WsV4duNw/5n+PZvk0h++1Ed4qvYORbalz6giaGmBdWshSNRzJ2jqGw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAxNC8xNV0geDg2L3Rk
eDogQWRkIFRERy5ETUFSLkFDQ0VQVCBtb2R1bGUgY2FsbA0KPndyYXBwZXIgZm9yIFREWCBDb25u
ZWN0DQo+DQo+T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+
IFRERy5ETUFSLkFDQ0VQVCB1cGRhdGVzIHRoZSBQQVNJRCB0YWJsZSBlbnRyeSBvZiB0aGUgVERJ
IGFzIHByZXNlbnQgdG8NCj4+IGFsbG93IERNQSBhY2Nlc3MgdG8gdGhlIFREIHByaXZhdGUgbWVt
b3J5Lg0KPj4NCj4+IEZvciBUREcuRE1BUi5BQ0NFUFQsIHRoZSBSOC1SMTUgaW5wdXQgcmVnaXN0
ZXJzIGFyZSByZXNlcnZlZCBhbmQgbXVzdA0KPj4gYmUgemVyby4gVXNlIGEgemVyby1pbml0aWFs
aXplZCBhcmd1bWVudCBzdHJ1Y3R1cmUgd2l0aCBfX3RkY2FsbF9zYXZlZCgpDQo+PiBzbyB0aGUg
Y29tcGxldGUgVERDQUxMIGlucHV0IHJlZ2lzdGVyIHNldCBpcyBsb2FkZWQgd2l0aCB0aGUgcmVx
dWlyZWQNCj4+IHZhbHVlcy4NCj4+DQo+PiBUcmFuc2xhdGUgVERYIG1vZHVsZSByZXR1cm4gY29k
ZXMgaW50byBMaW51eCBlcnJubyB2YWx1ZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpo
b25nIER1YW4gPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gveDg2
L2NvY28vdGR4L3RkeF9jb25uZWN0LmMgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysNCj4+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmggfCAgMSArDQo+PiAgYXJj
aC94ODYvaW5jbHVkZS9hc20vdGR4LmggICAgICAgIHwgIDEgKw0KPj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9jb2NvL3Rk
eC90ZHhfY29ubmVjdC5jDQo+Yi9hcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jDQo+PiBp
bmRleCAzZWYxMGIxZGY0MDEuLmEwM2IxZGE5YTUyYSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2
L2NvY28vdGR4L3RkeF9jb25uZWN0LmMNCj4+ICsrKyBiL2FyY2gveDg2L2NvY28vdGR4L3RkeF9j
b25uZWN0LmMNCj4+IEBAIC0xMzYsMyArMTM2LDMxIEBAIGludCB0ZHhfbWNhbGxfdGRpX3N0YXJ0
KHU2NCBmdW5jX2lkLCB1NjQNCj5leHBfYmluZF9zZXNzaW9uKQ0KPj4gIAlyZXR1cm4gdGR4X21j
YWxsX3RkaV90b19lcnJubyhyZXQpOw0KPj4gIH0NCj4+ICBFWFBPUlRfU1lNQk9MX0ZPUl9NT0RV
TEVTKHRkeF9tY2FsbF90ZGlfc3RhcnQsICJ0ZHgtZ3Vlc3QiKTsNCj4+ICsNCj4+ICsvKioNCj4+
ICsgKiB0ZHhfbWNhbGxfZG1hcl9hY2NlcHQoKSAtIEFjY2VwdCBQQVNJRCB0YWJsZSBlbnRyeSBv
ZiBhIFRESSBpbnN0YW5jZQ0KPj4gKyAqIEBmdW5jX2lkOiBGdW5jdGlvbiBpZGVudGlmaWVyIHNw
ZWNpZnlpbmcgdGhlIFRESSBpbnN0YW5jZQ0KPj4gKyAqIEB0YXJnZXQ6IERNQVIgdGFyZ2V0LCAw
IGZvciBub24tcGFydGl0aW9uZWQgVEQgb3IgTDEsIDEtMyBmb3IgTDIgVk0xLQ0KPlZNMywNCj4+
ICsgKiAgICAgICAgICBvdGhlciB2YWx1ZSByZXNlcnZlZA0KPj4gKyAqDQo+DQo+TGludXggZG9l
c24ndCBzdXBwb3J0IFREIHBhcnRpdGlvbiBhbmQgdGhlIG5leHQgcGF0Y2gganVzdCBoYXJkIGNv
ZGVzIGl0IHRvDQo+MC4NCj5XZSBjYW4gZHJvcCBpdCBlbnRpcmVseSBmb3Igc2ltcGxpY2l0eS4N
Cg0KTWFrZSBzZW5zZSwgd2lsbCBkby4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==
