Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793092296;
	b=GZ2F4VkJotNR8+DYMl/jaqPWHzMGubEepe91KVcxivZg0E7RybsPdI9frV/mmJuEIH3I
	 LfJz64jN3hQlaENX4QtxwS1uM5Nb+9f6ZV3oU9LwZf6DaPlJukgGEoP7xtfH4ER9+Cig0
	 QgQdyfINiNkflWAkcc6vKlN10VSu8kRNbeNb1VQBA12G9JrwtPgDoTF2zgj77VQSkPf6y
	 t/H6VnuZtsIVYeG6Iu55yA/UhpnZlI3IjVeHUg0Q9ICFvZe7VWaQgc+14x6rIqfdWf2Ok
	 zs18C5sSROv5PXTiRUO2U8g2eRU02sHWq05mkQZu64dgKDcbZoNxxlH5JkBxjssOapg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092296;
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
	bh=fbVDPU108IxL+DSTglHq9F7aPpRXmEIJ0CigpRvQvDs=;
	b=sYdyk9JYkGGmX60M0Rj2DZAB8Nnho9o7mOKnrb/igsZmmBGAV33yXGZIIyKwPbFIbeNt
	 M9kqIV3Qq9khl5+lI8Rw4hIXIX+DIdriw/gchqeLx7qbAttxhBSrZr7ZmPg8nBhqMCNST
	 qwNJW5ZoZxUrAv0zK5Q8ofcFA5StLmcMXNQcA1JM0QKKk7NG+cRpnywcj5NP5XePr7zrp
	 +dZh6Cuk7ZpqNBU+/j801N0Z1dKl7eyKpaJZihOGFbg3Zu19f1pmI7doco99nAS+dPo8z
	 LrZpoRoAsdY4kcXHbReubKvKTesNWCTQfQJ09OOWI24bWiW8SsARFJIAEgp5b9wypWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwCVoyYL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C80606A31B
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 09:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C80606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwCVoyYL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793092295; x=1824628295;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fbVDPU108IxL+DSTglHq9F7aPpRXmEIJ0CigpRvQvDs=;
  b=hwCVoyYLgmpqllVI9MhSOsw3e4ZNlYfCuuCgQByNnQILv0V4dHaSHNW2
   qY4nYOo8yYh/ZO3iI4nk4TyTTGLMO1MHjZPMDISxBPjtSWCjl6zbCrmIl
   xtBsS61zgUBxZatd+bGDLOwSrk4rvMP8Uu/2+sABO4rpNNLYg3s1S2zT6
   uQDy+d+8YMS7dgRj6Kfg4OEB5h9t/aa4k7fdCSr3TJb+0mGauSPG7OEKl
   i6VSX8Km5O2Ar8pWXv9nDFKQ4nwGTUCuOe0weqRcHBBHMK/fT/T98b272
   Q0Q13++b7IsQlpXZ3ltDICnyalTkR6kgJuwAdNPJxJP/ki1yIUPHvFDd9
   w==;
X-CSE-ConnectionGUID: Dp6yjQ0lSPa4c4+OaUCXBg==
X-CSE-MsgGUID: QalKPWO1RXqCIUVPFVX/Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1663292"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1663292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:11:35 -0700
X-CSE-ConnectionGUID: XrEFChorQjmcxryKmQ6jmg==
X-CSE-MsgGUID: vhi/5LSOSdWS5t67hGh8vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4491232"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:11:34 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:11:33 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:11:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3gNlFQuLGASB3TXrthtz42M4ulb9gXs8eD+J/ocoRk4E1gwFWOvmwnrrSDAGAy7Y1+y2gBglY9jZ5gSfc7BuT4pPcUnTShTemCDp7cS9DrIi5a5N2jOTzC9WTlqjKrEqsFbvasUpRHDoo+Dcqcr9vyA4Mx8odKVdRKiJwVK/xfW2waUIiY1y6mPLmnRFzf6/PkOCD4sfXj+c42lnt9rtvPZfW9quPIraHx6UHx0Ue/3bd76LgC73P3MR4lYYbyHb2kyUidYY38afh7q76kuYoT/vTCAKhKl0f3nZaRZBpxncTaYDdTTvyybrWj73333TazgpAc3jMgqSEKppLlQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbVDPU108IxL+DSTglHq9F7aPpRXmEIJ0CigpRvQvDs=;
 b=rNJbisAjsq0PjnZv2ark1yBC/7Z4a+VTwN/xgxFtU76y8/AqM468SUf/BSHWZX9wzFlNn6mZ/1OTaD+KK135fNzUiDK2wxAEbblO7LLEZQGEkf0lWUV/RoRANyLhrARPR7Y8SQOJA2NDfQmDtsD+jSPmtmnK+Ml+QRh6O8OgQJavCjl5AIOUXmVyC8AkoNaxwLGxFv9p7C5SZ1Iam5lxK663PKcwEwbok840MPV+0QO9pnn57GAx4OJFyqHBBeLG7Ru/sBfxLuhko+I7OqFmOLEyu8vgTtyclxgr6iWubEfn5H2uOZH360QTZ9B0v36/9kg6o+gspjqAzpCVi6vnrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:11:24 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:11:24 +0000
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
Subject: RE: [RFC PATCH 07/15] PCI/TSM: Track Device Interface Report MMIO
 range index
Thread-Topic: [RFC PATCH 07/15] PCI/TSM: Track Device Interface Report MMIO
 range index
Thread-Index: AQHdS9rGBm8ml+DoQU2hhaUkcyoM2bcPUIwAgAH9XtA=
Date: Tue, 27 Oct 2026 09:11:24 +0000
Message-ID: <IA3PR11MB91362AB99BED9F0DAE8F48B692602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-8-zhenzhong.duan@intel.com>
 <2b1f455e-e432-4439-8fc0-3b29548c45d3@intel.com>
In-Reply-To: <2b1f455e-e432-4439-8fc0-3b29548c45d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SJ2PR11MB7573:EE_
x-ms-office365-filtering-correlation-id: ccfdc8de-2d2b-48fd-4bc9-08df340a4678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|38070700021|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|261026140227099003;
x-microsoft-antispam-message-info: DulVBza+iNPkABzUBPpkcRu/MfCF0yqCm7M3q2Y3M9ArlU74G8XNX2WPP/tTqGmJwBX6t8fuNlJNdw2t/QUtF5Mbc+fw5NdLAdVga08v7YMLqGrwOZxicANtnrZkeH6UiA6ArdCNwlQHVn7eBUqaT0QUON4p0g1Wxs9GTvzP0Op1Ignbf9JzldpPMgcOzqT9M/Isvea3/eYZtx2/ZpEgIhpMkO7iuJWIqlKPhiJNEq8l9dL6woHOQgjbgnfuM+nrVmMtLepr2Rf/KfrkXXCfm//6rLkcmxqsdyq73ZnYrEW27u5uA40WElJCUbULvOrcAq1uVOcBcRvSS9p+wHik0TIiNB2M2zs0W6ZVBjbzTBMD/gyCzHkxxx3hjTCV7IkjsydIPpUJu9fjLO0766tGnZecZeXSqACg0dQP6DiU5NFEnCZkckiRBMV2UBtVki28q8SPyka3dkFRD32sfs5C8akM+4CHwnu7eD0Z+ZCHyAmVGJztKDLmFlY2xSrR/vYgihkK7dJE5cdmMRYGTQr7zliXIfh7aChMikaOLo0YzofOQC3W5r8+B0TwaR/VJ6GBkYWenk0ex1RtLvrMPRAeePPTXfkmN7O5P/JUm2n4w6JHMv7UwNqQftzTkF2ZlbSbIFEahv8UKy2Jjm2pOuAWZ8dNDiZpvg11Eh/UPs55R6M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(38070700021)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3JmOFJPR05FeVowSEI0QVAvdDVuRHdjUGNaUzhTQkpjUHlyMUFMVWtFbkN5?=
 =?utf-8?B?RFZ0aldvUzVpR3JsNGJXWm1zamgvdGJMYUw1RldWRGpzMHhPY1Q5Q2hlczl6?=
 =?utf-8?B?SnYvQjF3RmZXeTBZaGNrL1NkSmp4STNUc1AyUHh6cmplcGV6V1Uxb0dyUVRX?=
 =?utf-8?B?T2lzN2c5Q3Z5M3dXVVdxYWVmamY3OTFxc05LbEF2b3JXZnladEV5cUxqN3VT?=
 =?utf-8?B?ZXVlUmZUNTl5RWI0Y2R0Q1RxOWZOV0NZQk40aHZZMEVRSzUxTWxIQVU4R2Vz?=
 =?utf-8?B?bjFLZkY0S3p4YjNpT1VhRkJGZWdPZnpLZ3AxcnBFWWJNOWJidDdOQUM2QnEr?=
 =?utf-8?B?TFYwTnk2bFJybnVhVXR1N1dsejFhNWordHhaRjY3RStBc3hhZUhHUDhsbjhX?=
 =?utf-8?B?UHZubDJ2dmdrdFVTT3dsUytLdm1YMmdvYlVHT1pabnMzdXF4aXpNWWpUNFJ1?=
 =?utf-8?B?T1pCYXczTE1RTlhQT0dNS1NGSTU1UWJicEdFZFQ3cGo2eFVNZ0hKQVRwTm1C?=
 =?utf-8?B?UTd1OHlnWlA3a2tNdXdKTlBuUUtneEZJVkZSQXhDazFabTkwVjNaVGRGZ0hu?=
 =?utf-8?B?elluMU1STnBGOHVEaHlSM3BGVm9HUHNNMndFR0pNYkRZcUdxcjVmeDlHcHNZ?=
 =?utf-8?B?MmpiR3J6TFV6ZmQ5aW1NdDl2WXMrc3pBN3pXWFBoc0RQOVpsWmVhVHVnYmg3?=
 =?utf-8?B?TUhKM2tWYzc1bXQ1TElNbXBUajBRVlg5d3N1aWhMYVZWSENCWGpZczBabUVx?=
 =?utf-8?B?ZG16RGdJcDhSUVZyM1M3clQwcVl3a3g3emFMY0lrRTJZczJncUhBR0VjcXhm?=
 =?utf-8?B?bUlmN1dWNjNOYkxtSXRiL1E2QjFVbUluY3E0UDNoSVExMjZaUnZnN2JJRmhW?=
 =?utf-8?B?QUhzLzBueUhJN1JlR25FbHY5N1RGUy9oVHlKR0hVUWxzUDdZOUlvd2FTS0kv?=
 =?utf-8?B?dEFDNzI3Vjg0OER2WkRNbVJGbkVsdWRKUnE0bGI1UGFlaDRmaklCQUVhS2VG?=
 =?utf-8?B?TWdnN2JZYXZhV2RjQlhiSHRWODV2Z3Fuc0ZhWW9lSDB4NElLTjlHOHk2R1Iz?=
 =?utf-8?B?YjA5VDdJT1B4RE56YTdUQVFFZjZObG50MDdwZVgrcWN0S3krVXg3SUxQVkhu?=
 =?utf-8?B?emhKekY3REZpVHFXdUVDcXc5L2h3cjRML2FTVHpIMElWZzFwM0xQb25qMHhv?=
 =?utf-8?B?VmpiQXY3bzRwVnN6cnhObEk4ajhEcVRDTGFHcnNPSFR3Nlp3VHlrbDNsWjNa?=
 =?utf-8?B?eVFGUk5QVzY1a1FnZU9jUnIrNUNPMmpybVpLY1JwTVA2L05TMlppTUEzSjBV?=
 =?utf-8?B?ZFpMM2RwUmd2VmFYRzN1SGR3R0kxTmFrTDc5WUxIVGsyOTlkVWlScVNzU2Fw?=
 =?utf-8?B?Nmk5RVNpclRXU2xIN1UrT1ZWdHNnR2Q1LzlYUHBqMUVTVVFoeVRRckVuTjc4?=
 =?utf-8?B?c2x0d3E0LzdWZmZLamJQMFdsRzJweHpxVTRCMktKYnJKYXo1anAxTk5uZ2kz?=
 =?utf-8?B?VHN6dG96MzJSWVRuaGw5V09lTmtsWUlER3ZpUytKRlQ2ZjRCT1FtcTcxamIx?=
 =?utf-8?B?VEJYVDF5Q2JldWJIa0RzQzk1aktGVU0rVXJIelFCbkpjS2VJWkRtTk04Qm1Z?=
 =?utf-8?B?QTNUMjBWRWlhalV2ZDN0MEFLai92NC80Rm01cldONFlXMUJlODd0VkpBeHg4?=
 =?utf-8?B?UTh4WCsyRVh2OER1c3FqdzdlUml4cWl4Um5qMFE2WERobmxYbUlvQXJmWlAr?=
 =?utf-8?B?RUs5VFQ5YTJWWUZKMnV1cmNwcUltWHlJVm5SMTQvZThMNGNxb3RDN3lma2ZV?=
 =?utf-8?B?aGJkWnlSczZuNzFtZkxTWkdCWUNDOHdEVEJtQjJpWFNIN0pxdDFIS3FmUTVS?=
 =?utf-8?B?K0VhR2xzT0JNYXhVUXk4aUJYeVVhbXdjZzJ3UUhHRFY5VmdQdy9Gd29zWHJl?=
 =?utf-8?B?bG1jZzVTNVNieVZJMGgvQ25hc2lva09BaE9QbUFYTWVaSkxuZ0tZUUFodkpp?=
 =?utf-8?B?Z2dJWmJQS3JXZVpJaGZqTGp5RmxKSi9aTjFnRWlyS0x1ME1JQ0liaDdmaEJV?=
 =?utf-8?B?aXJGNTQwd1Q4ODBsSUVPRE5CNFpwenpOY3R2Skk2MkVIYmZJNmpmL1J2OVdq?=
 =?utf-8?B?blpCR002TTR2ZkNXNXR3dnhQalQ5TlNiaHM4Nm1ueXFCMTUrQmEyTUlaVDhH?=
 =?utf-8?B?RFAwalhqa1BxTThhem1RV29YSkVaekpTa1JtWC9MZHhpbExDVHVaVTJrQVRF?=
 =?utf-8?B?c3RPb2VOWGZYb3FGWUZvQVJwZ3dNUUpSL2w5clc4SnJDcE9hK2diQUU4M3Vs?=
 =?utf-8?B?L2ZQZ2g2YzZoUzdKWFZ6SkszM1dGN3hrNmkyczc1ci9xazNlUWphdz09?=
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
X-Exchange-RoutingPolicyChecked: zhjGtzkWFxJlqA8pi4Ka2RovsQV7Rh+menQ0AEmZB5ePei1BtNc9CoVw444/m3LUV/4iu/Z3Vs7sTqpG30FmlDDhbrsVMfgk/xMwvUNSvacTP9vjMmr9i3WdPASdjiP4uXEQ0SaewDu2gAcYglXwvUgAzvXBhgt2t6Qz84RmV03ETZln2QsRuCpSnm3dnTw7CnMs4/mLljnXyjZ+ecfFrD32ELa3TSCLGy3xcAzfDVIQEaGKY2InFKex4lpcLtajxg1Xk9wWiYaQPHAJ5vSgOOJIEpcxIZls8ODDu/L9/pGHefwFDKvJpM6zwfl5OhxyBGnPWtT2aYoIjHKPn4UJMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfdc8de-2d2b-48fd-4bc9-08df340a4678
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 09:11:24.6416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rNVpUJi+cqtUo5LvpsWQQscljrk50k/3DGuf85bsGS/z2kYxUqKnj9HzfYVeHouiE20ZMP5fGjJ9/a3sUfSCx6UwL1XcgSBe/oODfHMzavc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwNy8xNV0gUENJL1RT
TTogVHJhY2sgRGV2aWNlIEludGVyZmFjZSBSZXBvcnQgTU1JTw0KPnJhbmdlIGluZGV4DQo+DQo+
T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IFREWCBDb25u
ZWN0J3MgVERHLk1NSU8uQUNDRVBUIGludGVyZmFjZSBpZGVudGlmaWVzIGFuIE1NSU8gcmFuZ2UN
Cj4+IGJ5IGl0cyBpbmRleCBpbiB0aGUgRGV2aWNlIEludGVyZmFjZSBSZXBvcnQuIFByZXNlcnZl
IHRoaXMgcmVwb3J0DQo+PiBpbmRleCB3aGVuIGJ1aWxkaW5nIHBjaV90c21fbW1pbyBlbnRyaWVz
Lg0KPg0KPklmIHdlIGFyZSBnb2luZyB0byByZXBvcnQgaXQgdG8gdGhlIFRTTSBndWVzdCBmcmFt
ZXdvcmsgc2VyaWVzIGFuZCBhc2sgdGhhdA0KPnRvDQo+Y29udGFpbiB0aGlzIGNoYW5nZS4gSXQn
cyBiZXR0ZXIgdG8gcHV0IGl0IGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhpcyBzZXJpZXMNCj5hbmQN
Cj5zdGF0ZSBpdCBhcyBhIHByZXAgcGF0Y2ggaW5zdGVhZCBvZiBidXJ5aW5nIGl0IGluIHRoZSBt
aWRkbGUuDQoNCk9LLCBJIHNlZSBZaWx1biBhc2tpbmcgZm9yIHRoYXQgY2hhbmdlIGluIGFub3Ro
ZXIgdGhyZWFkLCBGWUkuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hdElZMUpvYSUy
RiUyRitoQ1JjckB5aWx1bnh1LU9wdGlQbGV4LTcwNTAvDQo=
