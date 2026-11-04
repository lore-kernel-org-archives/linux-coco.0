Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793787392;
	b=usQ1vN7Ef5L7dJTb5SXKgHKvHhQk+tN1GA9MA1163dnYDHZXyRP60RVUe67Y3iTE3rpy
	 n6gO30NnFgNRfg6I6SgndpLkuEImXN+RMsf3XCmWMT+9ftv6b+44+oc+SFx6cnW7hnZrY
	 0Xd/0TAmMN8pjpptVlFcQSqWp0ws8OBcVCbN/OEQWpYmeB81v2/Zi3Um1iDWnNKxZnwvl
	 isCG2HXvQrNpA+pBTkmadGgSj7tQUGdbsZut9JfpLGAx1S4UESVLuYq38LcXmc7zSQN3q
	 YTxjNQuzLWvamXht2iOYxuQAEm78zFPG2n7XwXlyj1Gg1rwktCWybCXp2UKkynr0Kzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787392;
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
	bh=KMTJGwmNTUhSnQlTGEr0qR3ffg2a0lD4dbc8kP42Mx8=;
	b=igKPslw2t9zQbZdr8joNxV5oGE/zBZCe2WRe535/N2M26WkEJnjgTZG0yhWQUgKiuEbg
	 atbAKNtO4XP+JmIGNZHKvNLWJ6wIvKioWo6RI4Zw9ncFpqRfszJKmJxEIp3NhdsFx99Tv
	 6HshOACQWHYRqS36YmckgqvH7FV1oy93KHudmZJGQYDXYNYiLFEjCkGkvhhjRloG5pn2W
	 B3OVwMT/b4zJyoBXzCLq6OlKHRu9SD1cAF3y1wTeS5wkC5U1MsMcuEC63sOE/Cya7nQd9
	 S3EMluz9L2AOb1cexA6qULdwJs9t06ja1GmiQvdrblhk6tF8NGce63jxBCGiJScZEWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lB86s5rD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379F606A332
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 10:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4379F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lB86s5rD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793787390; x=1825323390;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KMTJGwmNTUhSnQlTGEr0qR3ffg2a0lD4dbc8kP42Mx8=;
  b=lB86s5rDnnkdgChBjPdguIK+7C6SlbMpwSHaItIFTQU42Qz9WKWirZgP
   9W+CAXEm6uC6N051TJciK+kocFUS46yZNW1Kh3XFo2c68MpneXLm6cVzq
   O4l/bLUxWqvYMRxWQ1egSSCYdeC696wPwfSiXvVFW31DBpFO4H/35epHj
   ZGAdxZzAXBVYvVcXRF3U5zqyNjxi5JOZ2dV9Vlvwt6GbYygnqOIPTTEQ7
   p5O3fbxIXK5f6b49qomyPbe8vPX/I4lQThsdxaMkagzhrApIyWCZV/Ffp
   smI87yNCJVdQ7EjdRxjoDieIPiBrJnvmjr61i9G1Z5T+JjNZLbKmPESSX
   g==;
X-CSE-ConnectionGUID: S583T19bRIC3cJYZy5XeEQ==
X-CSE-MsgGUID: xez1qYuaQv+nyxfZZDtyKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2567782"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2567782"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:16:30 -0800
X-CSE-ConnectionGUID: QAeGd0Z2QdmGyxNHZLYfrw==
X-CSE-MsgGUID: lH/7fHZVS7Wy3m3RxdDNPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8472078"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:16:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:16:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 02:16:29 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 02:16:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3eeA+ffffynqmyAv9G7wx5enHq9p/kG5vq1/j0KtwxNew+RcG9ESRcYO7czVzQwJMT5JHF8ZYldJ2EuWjQI5xiGoFWVCcUJNyiL53A0pKsWWzIDNM41ChMNOeRdgTqbNw+tV1Kac+AhE9LN4eAEafSDpPdIP8pR6tGSsbI40QCVYmaFfxmYLm+9WPCEc5Ixk1OdtRXHu3oD0qZ+M5kEL/NPZwwOtWgn5siaA71oYGRL+YosXuaRL9EkiyCscAe5A+hLRxwVjj1qumYHL5PUiA3O2oSDal+vks/8HFBHl0o16g3f7zJWZ2c7PE/UfP3fimSsHxFm9cwagE7JNGgYog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMTJGwmNTUhSnQlTGEr0qR3ffg2a0lD4dbc8kP42Mx8=;
 b=iLGlkXCpAr2B2A6+NB83AnvTH67NeBET4YC16lZuqNzT0z9Y5yfLqIvYEc7oncOf/GTzfgniFGhn4nVXy3h3lhIJaw3rMESkvYny4Gi7k0tc3Q22lcQOz1btch6ikiz1OTDzx9lGEIes+VgabOCBU6dyt+EGNOXMmSdO098k5VU/hym7BkPz6H2eCEVD7dsa+A4HjEXGCPLqa0Zp3aoJODw2wJR1YhiL4m8MQNMN7Cbk1uNr9lF8Fd/FJXh7O4fWs0PuxzIAHOGGH0TtjKcQW3NBqnR/f55kmXHhELhHiQrZuCA0PyHTlitDdj9e/wO5ELAAilUDqqmlIa8yNj4lEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 10:16:14 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 10:16:14 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de"
	<bp@alien8.de>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: RE: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5XsnTSswCpUuCn5uop/dh5LcPMKyAgAHkxFCACm82AIAA3qNwgACyvQCAANprgA==
Date: Wed, 4 Nov 2026 10:16:14 +0000
Message-ID: <IA3PR11MB9136996562D4C80A99E1570992682@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
	 <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <877499ab0c8f3575ac6d424b5be59ff464aa9026.camel@intel.com>
	 <IA3PR11MB91360A6B4A959FA41F0D1C9592692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a1e734c99a6bef94e1c39f9881a4a78f69b46926.camel@intel.com>
In-Reply-To: <a1e734c99a6bef94e1c39f9881a4a78f69b46926.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH8PR11MB6682:EE_
x-ms-office365-filtering-correlation-id: 2321bb04-b17f-407f-9e54-08df3a5ca824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|261028144727099003|261026121527099003|261009223027099003|261026140227099003|261022075727099003|261022105027099003|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003|38070700021;
x-microsoft-antispam-message-info: ldX480MRpRDchyQ0jFc7wXaZY70Ua/Uogzz63KNTA771GkxXmbUTuV/u4cz7x9lYweaSKPgLVjF8yA1vy+vHcF0CO7LyYtMXUWGP9TrpyzUCc+uL26VxSDpDE2Iri1ogOVavsoIpZQK5PtvLASk5DgIZj4QMcXhefiy6HoYX2+HDt1UhU6O00HLY8pyKVF+cWhR//wh2BBjJ4XNEd0RSmUI42MtP96i84oiPFv6e7tbFTS6I8Q6ZcQcsuNsr6R72Kse3cMOOIRFmZAuIEKSYNTe0uIOJKC0JODi/nc5j0COhzu5uQBln7DH6QxH5kCMspdVHpq5wsM6h7PhgLvt4O9FA5Iqmf6y/OQFgW/4z5fUoiAuawkFu2GxH3Q5pW+yywb29KtCLoWu1RuRRmRWTE4M1NRWpyccUvS/INZBB4as8FKCkGzlHRrnFflmeU9Tw3FNI+LnWR7ZWjIYYxTfjO1N+0afQKiqvYg5MF41iR/l/h+uANPOW47r35oU1u/UGFPeO+XBXWTa1hM4jfCLONxNa/v5z3EAlRxHlKJH0kgGp8/gDVJNqtvo4LvrAZdQjCWNuhwySHDTyMiNb0mPwMncyf8Eip9trBVeh6ChTWbh5wofeILH/SHVCw/tP/d/foVT/3/1s9WoIETKG4GwPZ4/rYpyyXyWpaFHdkmdifr8FyylbCZ7HIE8n0SMqvjgx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003)(261022075727099003)(261022105027099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2ZlWFZZb3RvbGNxcDFCODlhc1hQbHN5UEJjV29UM3RnTmVYcDRXb0UrRXBR?=
 =?utf-8?B?blFMU2xyVG5vMjhOelFwd3lRUzRVV3FCSlpFOWpacjMwK1dyRGRtdkRGM0VH?=
 =?utf-8?B?QnNWWTNlOWFnZWdPcmQyY1E3MGxFc2lXNngyY0VpczZTSC8xbm4yQ0tLdXVY?=
 =?utf-8?B?Z1J4WGhpN0ZmeXJwUEFOY0FaVGV2ZXhBK0RwRExzSE1nZW83VVBxd3BBZ2Zp?=
 =?utf-8?B?dTVCRitwOTRwcjh6WlEyU0hNd2ZTNFZvc1A4aklKVVphTVVYOXh0WHdjVDlq?=
 =?utf-8?B?dWl3enVFNitEZVF5bWtZYVRxbFFsM0lSY0tpbXNxL0k0dlhWblEwRUpiWWRK?=
 =?utf-8?B?dFAxVGdtV1pXUjhvU2xlNG1DaGNDMldhY28waTh1QUdLM2hDRVk5L09WWGQ4?=
 =?utf-8?B?dmdrOGgvM0hOUCtoYkh3QVF2am90dmlkbEFTQWJSK1RhNEtwUk9xcWFhMGto?=
 =?utf-8?B?VVU4bXFqamdJTmZkdUpJV2loTjRrTkRVTEtYL3Z2N1E1OXQyemt6bjUvaDlY?=
 =?utf-8?B?Z0JrbG5iU2lxRFJ1OG9tSG5ESk16dGR2QWY5K29PS2pQemZzeVZtRnRQS3Jh?=
 =?utf-8?B?RkFMUjkzR3Z6OHRuNEJpRHo0ZHVtcU5weXQvdVV1cWc4RXA3ZmlvQnFlSXoy?=
 =?utf-8?B?R0dtb2lkbFNSeitaNkdMTWpxYUlDNFJFU3ZpR2Y3U29RMzVoYk1DbXhCSmht?=
 =?utf-8?B?NFFqdDcvaC9OTENCSDc5NjhDUnpDYlJsQmE3cVIrUmxidjRmWS84dXZNSHYr?=
 =?utf-8?B?SnJBN01wK3JWUjdSSTFBSXVybTFSZXFTRE01cGpHS3dNaCtHTDZpT0Q5MWxS?=
 =?utf-8?B?bjNMOWNUWjZnek9KWTdKN0ljNjZPcmlpT2pCV1FhbU45bGpGak04UStsWFFl?=
 =?utf-8?B?OGt5L3NlQ1NEYjJEaWRrUkZHZUFaUXluQjJudWdqZjMvT2hGd294eUNKbFBO?=
 =?utf-8?B?aE03aFExb2RKbDEwUEFDN3NqNDJjWjVGQXM5TVNjTnhZTXQwVTJiU2c4NS9Z?=
 =?utf-8?B?TGYveUxNNy9rYjltRlV5SzRHU2hraWxIV1drUGpQQXFBRUlnaWgyVWJZclBt?=
 =?utf-8?B?RkhmWCt3UThlLytFWDErTVpRaFZ3UU93K3BHMldmcEY0cjRYeHFHNW9HNEli?=
 =?utf-8?B?WkQ3emF2YVY0aUh5dnlSK2pXVllxYUJwbXdxZmZiMjYzTEtUYUhxcDhnNVZm?=
 =?utf-8?B?eXJVZzBwb3dOdkpicHlyNy9sbERGVTlaNDBpM2RKckhxMnpCQ3d4aEtKMlZ1?=
 =?utf-8?B?UE5XYUV3M1RsWVhiR3NmaWMwWXZFYXZ6MFRFbU52eFFTdk4yL1dxVzBPVlYy?=
 =?utf-8?B?QlpOWVJqczhQMEp5QnAwK1AvclZEeVd4ek5BRGR3UU1ZL1pJNVMzRERLakZU?=
 =?utf-8?B?WVV6L3Zsam8rYm13dDlvTHlRZ1RORHo1TjBpSGwzdm1FRW4wTEhzU0lBK2FD?=
 =?utf-8?B?VzlIV1AyT1NEMm94VGRIQ1o5OGVLc21lRlhhUm9rRDFBZGxidTNLQnRUd3Bx?=
 =?utf-8?B?YXNoYWk4UFFabWN1YVY5MTJpMWhjbGRyelZJd0dKNDFLMjM1WnlndThiZmRJ?=
 =?utf-8?B?SitBRkV2SmNmcisyZVh3NFNJeWE0bnZjSEcrbTd0Z3d5YzU0bFNwMVhuZEJK?=
 =?utf-8?B?T0V6cC9uNVdQVk9ZRmNhVVFIQjQ4T1I3NGs3VEF0bVUxUVdlNmc0SUVrWkpJ?=
 =?utf-8?B?azFaUTJZT2xuUWFXRTVHUmh6VXRSWGpMaDRaM1M4MkRGQk9iOVQ1c3F5OEIy?=
 =?utf-8?B?SDdqbXcyM1Blc3UveXV2ajhMN2I0R3RyZTRvNWVMZzNBU0JoaVBZSTdGUEMz?=
 =?utf-8?B?ZzNGSnRQay9CM0ZWMTRCSnN5NkVvY1hOVEErWWJ5M21MZlFLZHR6OXFzNmc5?=
 =?utf-8?B?OHlJMHNnTnJJSS95Y0FVdFo4REl2eUpjRnUzbGZaaHY0SWJRRnRZK1Z1Sk9Z?=
 =?utf-8?B?ZmtmeU9qd2doeklQZG83Yk9SZmRaV3VlTC93dVFjQkdreU1zbnZtNk0xVDF3?=
 =?utf-8?B?bTlVODZ4QVJ5eUZwaG8vbTQxVENhU2Rpd2REbWUyTkd6L3VhVlkzTlA2bnQv?=
 =?utf-8?B?Z0ZtOHY2SStGaFlJUUNUR2pUY1lwNWFNMk1KZG5pc2dVc3FqMVlRTzJqMS93?=
 =?utf-8?B?VU5tbVhIOVpuVHdpbFdjU3NVdm5mVmM3TFd6V1JRczlnUE9qRGVuMmZaRi8y?=
 =?utf-8?B?RnhqUU50RTNWTHpzUHZ3Z1g4OWFhWDhxK2hMaTFUdWtCMDFjK0p4Nm04MVhr?=
 =?utf-8?B?K1pJWEl4eTJEUDhobFRsZTBMdTdmYis4ME4zNTMzYTFobzIzY0hVZ2d6aUdT?=
 =?utf-8?B?dE1Ydjl4NmtMWUJGWkM4V2xLdmVrUjFiUm0vbVFzN1hRVmFybGFQdz09?=
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
X-Exchange-RoutingPolicyChecked: qkKcCHF1Vd6RK8m9Qi8rAvUTfyVTPyU3S34OUWXuTv8CShUKWdg189Kz0htBTwf3etj3ZufSykJaiJ1KgQMGMM7PySFgTnplUdqYkgBCO7Fuui+YA2ApaQVbYQPTGLtuZz5ajeXAbAdVe7ZlcSzHLBogJbVvsScc48bpyW+gATDkk92gYPePfZUHlY9DNtxaPzndgCnLQeHvR6chGUPCZqCTMTWBrFAAfqRlmJu4XHVRgdGgGae5tEgHaOL55gzcgm5AOs0ECFnh+dblJfiu+P8tItEavqKHCIW8e+ZkOiPpT7r8aGBPGoPgiTsjxbmCyuSjK6AGSuZpZ0M+iAFXpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2321bb04-b17f-407f-9e54-08df3a5ca824
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 10:16:14.2116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wj8g5k1cRhNGKBwK3RmxeUwcP8uqZtNS/025PyKnnyqvHZDuAQXctJ5RvO1B+PdOV0LAOIweJQAe4c9FVxF8LNzwSF9DmaKl9z8rbZmAxH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6682
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
My8xNV0geDg2L3RkeDogQWRkIFRERy5UREkuUkQgbW9kdWxlIGNhbGwgd3JhcHBlcg0KPmZvciBU
RFggQ29ubmVjdA0KPg0KPk9uIFR1ZSwgMjAyNi0xMS0wMyBhdCAxMzoxMSArMDAwMCwgRHVhbiwg
Wmhlbnpob25nIHdyb3RlOg0KPj4gPiAuLi55b3UgYXJlIGdvaW5nIHRvIGhhdmUganVzdGlmeSB0
aGUgd2hvbGUgdGR4X21jYWxsX3RkaV90b19lcnJubygpDQo+dGhpbmcNCj4+ID4gZmlyc3QNCj4+
ID4gYXMgZGlzY3Vzc2VkIGluIHRoZSBvdGhlciBwYXRjaC4NCj4+DQo+PiBXZWxsLCB0ZHhfbWNh
bGxfdGRpX3RvX2Vycm5vKCkganVzdCB0cmFuc2xhdGVzIFREWCBtb2R1bGUgc3RhdHVzIGNvZGVz
DQo+PiBudG8gTGludXggZXJybm8gdmFsdWVzLiAtRUJVU1kgaXMgdGhlIG9uZSB0aGF0IGNhbiBp
bmRpY2F0ZSBjb250ZW50aW9uOw0KPj4gb3RoZXIgZXJyb3JzIGFyZSBwYXNzZWQgYmFjayB0byB1
c2Vyc3BhY2UuDQo+DQo+VWhoaC4uLiBZb3Ugc2FpZCB5b3Ugd291bGQganVzdGlmeSB3aHkgYSB3
aWRlciBzb2x1dGlvbiBpcyBuZWVkZWQ6DQo+aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0lB
M1BSMTFNQjkxMzZEQjUzMzczMUQ1Nzk3OThEM0FGQzkyOTIyQElBM1BSMTFNDQo+QjkxMzYubmFt
cHJkMTEucHJvZC5vdXRsb29rLmNvbS8NCj4NCj5TbyBiZWZvcmUgeW91IGZpZ3VyZSBvdXQgd2hp
Y2ggcGF0Y2ggdG8gcHV0IGl0IGluLCBwcm9iYWJseSBmaWd1cmUgb3V0DQo+d2hldGhlcg0KPnRv
IGhhdmUgaXQuDQoNCkkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyByZWFzb24gdG8gaGF2ZSBpdCwgSSB3
aWxsIGRyb3AgdGR4X21jYWxsX3RkaV90b19lcnJubygpDQpoZWxwZXIgYW5kIG9wZW4gY29kZSB0
aGUgd3JhcHBlciBlcnJvciBwYXRoLg0KDQo=
