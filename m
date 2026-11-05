Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793853559;
	b=p/htbtrGLwyAbgvzA4x96hH1OjucpVGY1L/yGo2zWExMSw3CCEe3/3Rl7sIf/qPrxIdA
	 9sFnaqotVB/kNXBhI+H+bCFg1/nGOs7Dk6zPKIt4l9iBi85yUSlnHnuGjoYAymbZCuij+
	 AVtOi5G8nR+swwabo+8WqZmmhICAAT3H86WLL9+hOh56hhKCntcGKx6DXgb+n0UqlT/s8
	 wJJgJt9kXz04qViPfb5SXd2YZ6AKfuokt3HsyAhKXA2a3hndaQawxedPmjXMB5WubV+Zf
	 Agg4nKVDrylWPAhzmc4WTfIemzFFS6oEwh0KEIlns4CoosCLjx8jJz2cy22yIqN+p2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853559;
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
	bh=cKai6IVNHzZSkbOyR4vR1N2uwEB++AsJkjcbPQG/cKs=;
	b=t6iXISlirze98h+Z/IeSTPwOlxEcP80Sw9Xt8NASquMO+mc6Zx4iQsZC/Hh8LxTkNFIl
	 HmmgX4bteFJtbu8l/23IeKUKO9oC3xuaUTYLEKBAEjAyZFnCZxpthZojEFDIpy9HRsoLL
	 SnNRE3v4xnr9SUubxHNTy5xADevmyA5k5RyguMc4dUzx4mFQ8U9ysTB5g4RGeseYRUVlQ
	 +ygiGhYh1clic/lrbpba8GW0QamqF9fTJ2nca+SKoQ9xlO2ULuSeU8t96MMuUAwu1Q9Mi
	 MGT8AVSgs86x82kfOCuqdGXI5FIS4EtPxXuTc2Yw17zpIISoobZMwBOr+uEsn77PnkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ojj7+ikf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67ED606A31B
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 04:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67ED606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ojj7+ikf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793853556; x=1825389556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cKai6IVNHzZSkbOyR4vR1N2uwEB++AsJkjcbPQG/cKs=;
  b=Ojj7+ikfTSXM4iYhvjxXRg/oJBo98nfFmPgifZU09wArjR9utVA1ugAq
   xCDAwSkyDayWvyM5OmrtWW8FHEZ/AJxm0TRTszeEGzok7IEt2ZaHHD+w5
   t2t3nmir1XFBgtHWcWWeZ9jDU/3I0QR2V12qyPlC2mzGmY+n9mhROtqWC
   U7efZW25Y2ZlT7U29SVsA3X9RJ5JCYhlaO/6IHVaTXss6CeqgdCGAt6tv
   tV0GZ6C/aAeF2J2Hxa7RiR/4lqC0PcvzzKTCIgYWU8aEyowsmyjpxtAFX
   VHyTFMjJJ7AX02mKYH3AP3p6d5EjttlgTNYRmSdm1KUMNQUL2P8LzDtgk
   g==;
X-CSE-ConnectionGUID: +byFAbQwSECOS20sZTp9mw==
X-CSE-MsgGUID: qjRZqxv8QiK8FAcwDor1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2635152"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2635152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:37:49 -0800
X-CSE-ConnectionGUID: ra0UI3VnQPejRkLUZyq8tg==
X-CSE-MsgGUID: H2P8a1U6R6K70P14QKV1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7061784"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:37:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 20:37:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 20:37:48 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 20:37:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+GerlE9oNTdg+5iOuvNveM9dGQjmx+nbg9C3Io18mphe+1MckJODsl/3biXHUNNlJTa/HMpjli95ewVKd8PO5oAuatu0WFx6VAIAiTQQS9mfB91EYiz3OWbBodpzwU19oWFGpd7MAMMfzIDb6sCj0jmvC1lYYQXR9COlMJ+b+pU1h6LggIfv0SQOg4p6elb+tUfbXO31HG0jUGP9jduwI18kfQ11S4HR0fN+A59c1QhV3DgkwalH3pjmHzVrwwyQ7Zfyn6ZU3IUrvrOtUgywLWArAJEgxcQhfpTA6mh94AsXa145nHR6LpSX3eYXzC1284RZIOyuX7Z1A0VJk9CTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKai6IVNHzZSkbOyR4vR1N2uwEB++AsJkjcbPQG/cKs=;
 b=s4PWZwN0iD1QaCuqgN3u8FZ80aBQ0/RNH+vWcHVPz05emDTv4f8C85of6YSVLTqj5eo8ju/3K9leS05IFyPR5i1w+2L4rwhoOaTVcZ6edMbp7vukY7FberJbLNjJIAKzmGqgie0bcMffSTP2qM6SkrbPzjeAiKgrQPnzWhoqzj/rzkUV0Kt+y2pXTr7GyZqotm4XgOVqSGZXzilf0PC576+sA6HdaZbo7pdkf2W+voKh+uy2884cFwAvacZSYDrJWqMnFikbMTPLOuFmTXGo+phqUn2bXoNiT9+86btuKkhVUGtgOx5BDczkD73+s8M2MGXdAQyfJ9y+z/u7Equ52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by DS6PR11MB9894.namprd11.prod.outlook.com (2603:10b6:8:464::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 04:37:40 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 04:37:40 +0000
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
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALZp1CAB3RpgIAAwCFwgADRDICAAL+JgIAAZjwAgADpviA=
Date: Thu, 5 Nov 2026 04:37:39 +0000
Message-ID: <IA3PR11MB91367791D58F8DA63D0F2B3692772@IA3PR11MB9136.namprd11.prod.outlook.com>
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
In-Reply-To: <b15708f7cd770fdba4082b19488422a376c2aa9c.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|DS6PR11MB9894:EE_
x-ms-office365-filtering-correlation-id: a43cf318-3e2f-4af8-2bac-08df3af6865b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|5023799004|4143699003|261028144727099003|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261102123227099003|261021121427099003;
x-microsoft-antispam-message-info: T8ormy3soITL9w6tZMJycaBFKZSiiN/mXDdOx0kTArPPtILFyrDC1BbhcsHWaTa7mBbZr2Os0SdJ6bF60D3oTHVdPrMEDJNRSat6v8JCkVvbWTmo64FOVGPfzE5SnwFSyLcgb/i23V8Oh9zJiL4PPJI2ek4jhFoZiGlt+1aYGG36o7FcWltqybIfHXQShphB6lcpgNnfNl8xAKIOjVeigeqBwzPuzTJ3zO2evwMokKtMNI+uClzi9I3j+Rw0k/R6ZKiUehDsGX3CDyCB618OFRXMw9qBAGeXthMnISZseaS7N+sTE0HzktHvGn6qEcXCWJ9SggOoXtkMWnlEP6rXgKLDvjtJq5OiSEksLEimgh2pRJcx4+/0WBmlDeAQYJBJGw72m2DLLoEdy+JoGeVdIWkKr4JQ8DZIyp4VZPYPDndagRLowUnf5smIarv5GWGxno5jznAUQApxPzklGeD2p8MXKemV7hajbCZPAC3Zub/yE/S9zuo/g4GWkn4QEgAc3XY0wkKV3uuHAiq9cnX2G/D/jMSMz4KiKkspvG0CHJrHKgDvlYW80c5wUC3+ibBaKj7/EManhz9ylKLc2HPFhFfpYtWCPe2vz7iwBCRxQtLHlmI3QeSziakhPd5MkZFvCpcUp9S7lO4P4OXeEVWqjz2TKWAC6wFZ+OFMJtEN3jmG7LzAGJCOedk2vfebHzYASTzU2Phz5sq6fonE/ct1QdLcOroCe7OQKiePmO07ADg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(5023799004)(4143699003)(261028144727099003)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkRqNjF0SUY0YWFEVHlZS0E0KzFUblJIWkZJV2JVWFA0R0ZFQVdHYWZYcXZh?=
 =?utf-8?B?SU9IOGg4VHg4eEVFaEExSXgrTzRETlpPcXJJaVlqZlpTOElCWEt4d1JxQ2RP?=
 =?utf-8?B?eG9YL25ydGphRWtzcmN5aXhJWFlIUHpiZnJ5ME0yV004andnM0ZmL3ZOQ01S?=
 =?utf-8?B?OGdLVUdiakhyVzVzblc0My80SUxYZVR5TVFkL3hOaXFIODJ3R1ExaWl2eHor?=
 =?utf-8?B?SGNNSTBWOXFPMlYwRkN1T29GeEs5RHNTdm52c3c1QkhjeVRFUDZEK2VFdmtK?=
 =?utf-8?B?MEhsVStyWFRnZ3ZEMmtnekY0aHBXTHFEWTRsR0VCQW1tU2QwQmhFeHdZdHIv?=
 =?utf-8?B?cXZSc2VKNlZMSTVYUFAzRDdrekh2T2pWc1lYMFBQT3FiR28xcmpOS1p2Y1o2?=
 =?utf-8?B?UEI5ZXczZmZoYXRvTWhtMWE0dVZXemhreldRNnU0d1pQWWhqTEk3WmgxZXQ5?=
 =?utf-8?B?SDNaY3pDOUtveEs4aW80MGg0VTJOSWdKWG1ac2Y3aDRKczRYeDluS0lmbjJO?=
 =?utf-8?B?Z2FoUWZQdTZRYzljT1l4QmdZbTRyc1ptVnFrL25QS2xmUEFiUy9wcVE1dXcz?=
 =?utf-8?B?YnhpTTRveGNvamw0aHR5b0x5b2NhTHFLQWEzZE1iUnFiNncrM2tmYncyN2lH?=
 =?utf-8?B?VWZQT0NaUU9iRCtoQ0tGZVFSMnpJT1JPWlFqU2puWmExRW56STZOMHdQSjdU?=
 =?utf-8?B?RllicmUza2Y1NEM3ZTBUUGM0eHNmUHJ3RCtHWWxoakc1Y05nSjhoQXF0dHdM?=
 =?utf-8?B?dFM3NEhmeUppcmVuTjMrZ2RXQTVhdUNMT1ZhcnZBdndXOTRFRnhOOUFyb1VH?=
 =?utf-8?B?eWw0WE5ocTJ4cmtHUnJWa2ROWHpoSUsyLzZlbktZV0VOUThmdmxGdHFIVXZv?=
 =?utf-8?B?ZEVrbFd6MUtRc2Q4V1psSk56L2Z3UGF3L01DZU9DRCtDbE9XWkNhSlRFOHVD?=
 =?utf-8?B?Z3lCSEcybWwvK1M5N1NRRVBMSklXSllkRE5lWjVHZVAwWVBteHVlajJEdGtK?=
 =?utf-8?B?RGV1ZGJkY29pdS9yd0ZPQTJ5UFZqSTBWU1JpV0xyU2JQZTZqWlhuek5iZ3hp?=
 =?utf-8?B?Y1BNM0JZU1N1YnpCVWY1ZUVhU0RuNkdBYkxaT3ppODNqd29LMUVIRGgwTkNK?=
 =?utf-8?B?UGhiVWVic2s4dlJBbDFLNzRDUGFFV2lDUGFWdXlIUWZEWXVXMVBxK2N0aHp6?=
 =?utf-8?B?Mzh4RjVNMEwvTDlUeFRvZ0ZWS2wxQXlsdTd5d0JvU0VyM0hPNSswYUVmdytt?=
 =?utf-8?B?OG1xd2FZektndDZPL0VBYjhySkppSEE3NHU1VldQYkovTkx6aiszdEliQ2VW?=
 =?utf-8?B?WWl5SllhVGcyRWJLMEt6YVNwN1FrK0UyRVIrWklscUJiQVowSTIyYm5Veiti?=
 =?utf-8?B?VVQwcW5QTHdMd3M2ZVNIaUxoTkRKKzRpWm9jdERteFJUME1VZ2pESjNnTzdq?=
 =?utf-8?B?SytDRy8vc0hHbEdsMGZhRUdNaDRhNGIwNkV5bGVXOWF0K3FaS1lPNWtIdWdL?=
 =?utf-8?B?UzJ5L3VtRWhJSm83aDRSRWxCUFdLZ2pmcHR6V1pxYkRsOElCU2pCRzBKZERX?=
 =?utf-8?B?ZUhtNTRleHl0YnU2TVlRbTlrZGJOU242cVNXVVhKZjRmWEcvTCt0QURDLzla?=
 =?utf-8?B?WWI5Q2Roejcrd2RnZjVCdnYxbzUxck96anF4enV3bm45UDVMNjNrakJ4ZE9u?=
 =?utf-8?B?bWUwY01MOTFFbXVsb0NpMVdHcFhJMEQxVHk1Zk1PSUhwd3pqc0ZHYU15YXpi?=
 =?utf-8?B?aFdweU9BNHEyeVhqaDZuYUt1UVpoVlNuenlmdWgyNTZNazBpbmhrZGYwWlRh?=
 =?utf-8?B?dG5USENzOEpBNElOQzVyanA1M28zcFBYRHBjZkpoVnhrdlNJNmZGQXpqVWVr?=
 =?utf-8?B?V1dWUk8xSXlHcXNGS3pDakMzNzMzVlhKRzZPeTRDVHBOT29SMG1sZ2RZM1dl?=
 =?utf-8?B?TGJRNW90Sy9LU3dqSkhIb2R0UmtjUGNWaTgrVXZwMUhrbFFNSnl2ck51eGVT?=
 =?utf-8?B?T01Hc2lDbXd1OVdPdWZKQTE0cXA1VDg5N0FTdlVZMTkxUEw5VVE1NTdwcER2?=
 =?utf-8?B?MFVIYkJhck0yanVHckYzTnZzY05oRkpDRUs5VVNtTTFSVFFwYmNEbkZqN1Y4?=
 =?utf-8?B?NmxsdThQbUNETW5KVXpOanpmZHNrSlJUaWRpbzR0ZXFYOGFJYTRDMm5RODda?=
 =?utf-8?B?bEJjOXBPNUhPQmw5NWtoN0xtWWZ1S2pWOVREZ1UwdVJPVVordWI2L1pqaVM2?=
 =?utf-8?B?M1BSYWRNNGxXdllZYmk2ZkNGdzQ5cHVjRHhVbWUwcFVkSDU5T2dzYUJleXZU?=
 =?utf-8?B?SFZ1Tjh4Tm5vK1NiWmNidVJiVVpaZUpON3d4RkN5SzdXRkRmbHhpQT09?=
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
X-Exchange-RoutingPolicyChecked: k535GPL98s2oDzZNn1HAbwtKkIqT7wPt9cbsrBAuS/EgIdiVl12tbO76L+uJmStgoldSYJyxZJAOrTg/kBUd8Nu2V6Y6jUc+lDvxi84dcHt4NyVhQo0l7bkKHRgxdRX8cdddnjz9N4hBMZRC6r7v4EhnR10E1t5+I7oa3CrK0w5/R3JILYZzaQ4rLUb7ZL2uoQpITjxuwmBPMalDE/poz8UQjxbVt1meflbq/Tth8de2YyiiEG5cYg3CSIPDWTdFhatjD8v6KE4Dte9CvSobM+mhPPDW+7attJlsxmLyGSuiQBgTfBLIyQ5v8hS8phGMiE1pJ8mCYx9ob3J4xAj7aQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43cf318-3e2f-4af8-2bac-08df3af6865b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 04:37:39.9866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wZEB4jKwopOvfnRr66+ktJrEP4ZbsSN/UwfJ/oAUWwDj2eZMAAVXLwHEZLAKx0lrdVmgDc/DXLw3LflVlwPI6rbB5uoPj3kIHFNlDa71xSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9894
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
Ni8xNV0gdmlydDogdGR4LWd1ZXN0OiBTdXBwb3J0IFRESSBiaW5kIGFuZCB1bmJpbmQNCj5vcGVy
YXRpb25zDQo+DQo+T24gV2VkLCAyMDI2LTExLTA0IGF0IDA4OjU5ICswMDAwLCBEdWFuLCBaaGVu
emhvbmcgd3JvdGU6DQo+PiA+IEknbSBub3QgY2xlYXIgd2hvc2UgZmF1bHQgdGhpcyBpcy4NCj4+
DQo+PiBIb3N0IHNpZGUgZmF1bHQsIGUuZy4sIGEgbWFsaWNpb3VzIFZNTSBkb2VzIG5vdGhpbmcg
aW4gVU5CSU5EIFREQ00NCj5oeXBlcmNhbGwuDQo+DQo+SWYgdGhlIGhvc3QgKmNhbiogYWx3YXlz
IGhhbmRsZSB0aGlzLCBidXQganVzdCBkb2Vzbid0LCB0aGVuIEkgd29uZGVyIGhvdw0KPm11Y2gN
Cj5lZmZvcnQgd2Ugc2hvdWxkIHNwZW5kIHRvIG9uIGhhbmRsaW5nIGl0LiBXZSBjYW4ndCBwcm90
ZWN0IGFnYWluc3QgVEQgRE9TDQo+YnkgdGhlDQo+aG9zdCwgc28gZG9uJ3QgdHJ5LiBTbyB0aGlz
IHNlZW1zIHNpbWlsYXIuDQoNCkZhaXIgcG9pbnQsIEkgd2FzIG92ZXJ0aGlua2luZyB0aGlzLg0K
