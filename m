Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793267826;
	b=MIuxM0ApEeeqPlGkxHfWHHFJ0GV0K2aGzEc7cakzw+d8xnTRWE+88ekvwQrWGL1svrFw
	 7ElnbF83xTqozP0MsxKPZ1gRBM8Rdw43WNncc8UHKekG1AkxRxOVdOJASAGuqPx2DR2nU
	 8YMaibxE8N4ZtxQC6CcEk9+xgXLNFiUrZdD1uFWbP1x3uVDgXJcvcLOVShO3lokV7jyqT
	 gVxiA1PEFnvTzkNqCft7XCTzpEh0RYwaEk1CGfZ3V6TWhXiTOySE1JF1leSABqYso9pTy
	 Cs0gqS22KRB7gVUJUjDpPpuGqoNxhDphgM4HLgsDSM4yly6xnWJD0vs0iAuaQl65i5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267826;
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
	bh=9TE3VHDz60WzTpDXa7YLGW39CE4KrBkBjBDv2TRPjRQ=;
	b=WaeePJZ+1+J1ptIO84WCFONYptL2SQrjxkQPLlwXNOW/6wwUWz/Cnrzar86Lhdnl2xbj
	 gUn6YtVTQcaQWrY/1/pt5kb7ZjrB80Viq75qrVQOKoQsGff1CYwxYIrJnCxT1mlpUuLsG
	 wHqRYvgrgfIhvGb5th0EYwFGKuYZTXUwfEWh8U6pWiwrlc4t1WsY+ti9fB9+dt061f8yI
	 /EjHhQMZtevTtGwcUFF/CglG0ue/nho5HrB/Zd+cT7wpW8Y5HwTDrn3BO5vI71HXt9dHs
	 NRNjNxxjDWQyuUypa6Neud+WSqXmjAHuuMFO8mG9v7zcRypXkhCh5MPUnPTbjpgLcyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ifc3jWTI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB4606A321
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 09:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ifc3jWTI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793267825; x=1824803825;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9TE3VHDz60WzTpDXa7YLGW39CE4KrBkBjBDv2TRPjRQ=;
  b=ifc3jWTI6tdRwzXTbcuVs9NER7FkQMDpVCzKSAHdEZSYBwhmH2knBdyt
   /dKkmNAbTjIzOWOsqNR3vug38ZNsiT7vCGQCZAETWMzv77D80mYkQxRAY
   V5CMtZlpAaSvK9fSWCmkg+kLdbIF/OttT+XZGrgPBuH1sn1LDg2LsiNYw
   KgwpjgJexm3ZcTOrxMB513G3+lVeQkBdRHo4/P/gBEC2byc4/jC3qhO7V
   CpKaA2tyJ0D2tm7me90oOD4iH/IwYGZG7zzQ/hPsbym9c423b3JzH88PL
   XS+jSFb+XTzA7hI3s/guJLi6i/IpaE2g+O5Obcl5E/xGcrbpdGs07PzAW
   w==;
X-CSE-ConnectionGUID: kCrVeGhnTIOPYs4vJhK9MA==
X-CSE-MsgGUID: Glbq42OvR2CyLYF/V/y6Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1901636"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1901636"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:57:05 -0700
X-CSE-ConnectionGUID: tv5vGKGuSTWN3K2WwdhvEA==
X-CSE-MsgGUID: oOFEjzWJTlKIWWLYHU/LeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5088286"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:57:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:57:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 02:57:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 02:57:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLTgBzykV4unIOAFJU2PKAYeM32MqxtjzXQqOILZ1fU7wO0+0tRWJEJaYZkhZkGo2GL95vv9T758b9o5gM6mvtrVf5S5g1sE35UDtvdH7Z5/NGnuFIXlXR9AneKD6dn2AWpH982efL9B6Gac0Wq8GkVYflWKF/hA0MpEYdkFQHGedKlSVhpAwx60wXDj3qxhINapL7ry//f2g+ScZTi+DsW/Lgexd1oeFRsJ9Q5z+pTMM1qB9aXUJqbD0ex6BCTJyEAFH1yniuL9A4T0D9ctPFSSIyFBXp+9WkBtyAMd+HPZs0LVUMzzLIBfMarWIxBQNO2E2Z5mUWVws6UKcIeWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TE3VHDz60WzTpDXa7YLGW39CE4KrBkBjBDv2TRPjRQ=;
 b=KE+3Qk4XcMhkBRm9dE3ayfzgLlL0g5Ej1znUrqAddJcjHlmDLTwLx0Z7YXPLm3ZDp6UXeGamPgI9r2CkXigL1rO/q9AWNg6OaOYB0mg0zl5Y2eR+O6EJRfN6h7ud8JYBkk4Lp1K8xrVuk7p6eaxuauU6m/EIEr+/zkEGcTaZZ0RbT80HmntNph5+E7c1PRcV3+15QLffc8z6lBonI7mv08h0n2P11sSyecjcqXecwwRCtb34h6jsHrpuU80SY43QsOvrrMFqhQddMDEB9CoRz8VyofpZLQH/OjDizD/sbnf5w7SVzs6nT0HZJ/GbgtXU59UxElGhz/hvF1Fnl9M/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH0PR11MB7635.namprd11.prod.outlook.com (2603:10b6:510:28e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 09:57:00 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 09:56:59 +0000
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
Subject: RE: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
Thread-Topic: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Thread-Index: AQHdS9rOgVTKgp8btE6rbHqQSEDr2bcPfC2AgAT/L3A=
Date: Thu, 29 Oct 2026 09:56:59 +0000
Message-ID: <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
In-Reply-To: <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH0PR11MB7635:EE_
x-ms-office365-filtering-correlation-id: 9de48d37-3319-458f-6d67-08df35a2f968
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|38070700021|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: iAGvOvO5AiTHu8XOIeXlRKc98K0dKOafursecG+lBcsbGnM1g55M2x0zzbliEzk1n+A8lfvI3NqZWuw4pZ9WYNl4z1UOkVzu6ZFEiIpByUlWVfgOZFkv/2YYk+h0sG8j9FJCUfOLIuhJEmIsXrukYHCvvEcZl6s+GrxWQC4bE2Tebwc+PwdCMb9hQiBazqG7WT58O1wRVywbU4SRj8zaxIOOBkln8NGV3uitSP6of7gwsjMFsPHz5EeT+OAHkBIDcucJiUZucrnorxkx06mL36uWzAUPkYI0ZNoMkTQMPfjP/PHbg9sHsYMKNDJl+IaiAhysaa67aNffU+hv931B8eo2o9j3yuv497IjPsXGKj53OJA8J7DZ/TFfWWeTsha/IIGW8R3/9T+W4ixiXdWh3ifYG5Kma2fC+46RblI2aHN+mRzL5vJXkw7wBr9TA1dVfHwr+ARVE6sQWoPF2VOtJsdtXU6qEHRDKaqZJuNd/BqHmTpgw/9Awg673AsXOyhFec/MdexGrXaBvpSk3rdHFozW8m3Zqk5OaTs5P43qPUpS44zwgxmZCxyA19XGBsQlJrns3Kw3/AnppwK1nZI5Oa5C2t2x0P9z3ofdPfRCTiZM6w71vebQc2rFJoRp/GSC7VB0RuhgXM/7TkMG6n8hHgEJ5SdG0TInCsAKm1Htphh2FFu8m8rjNjHgpnt4v/BcVAbVktjHOnlCqhR44BiRbEjpmxD2tl+exvMPYTd6za8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(38070700021)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFU4UmNHVElqbmFlcXNQREh1YTZyaFpuN3dlVHREZlN4K0NVb0pOTVVrODZj?=
 =?utf-8?B?bnBaZGFFY1NPWDZiVjNOVXJScEhrVHFES2hCUm13N3Zvb3kyN2J6S3NUMDlq?=
 =?utf-8?B?RkV4TzNNWEdaaFJUSzF6ZVh4cGJzRDRRY2JBWStRWGRaci83WHdqZzBYVWRX?=
 =?utf-8?B?ZjJjMUxpVGtEK1NZcEppaDNyM0dHckJFWkNqQkNWWENZNUZKZU1ZeU9tK2NP?=
 =?utf-8?B?cmgyMGtuQXhoU2p3ZVBFOTJqQXhvTGhvNVlESFRNOGhQaWptKzlnQmNQT0th?=
 =?utf-8?B?c0hyTlpOOTlWYUdhT2xYYTBRb1BRbTNoZkJIYmRnNlYyUTlLb2NKYkhEZTZi?=
 =?utf-8?B?Q1Zic0UyMjliVTBzWFl4QUtmZXZQWUczZzZUV3FyUS83QmNzNEREQTFUOEZz?=
 =?utf-8?B?SzlvaWs2WlU3ckpFaFE5TmtUOTdocW9MdFVSNjVHelNYWVhqdU1mK0dMQnl5?=
 =?utf-8?B?OGUzeWVIVW1HY2t4S21hVERJQzFGVUhDcFF3a2s4eUtwd3JMdHhPZW9LZWdX?=
 =?utf-8?B?NW5jc3ZLeEh0cEdrelAweW9xRVlmRnc2WWgxbThkaXlnS1VGcS85eUtzVlB3?=
 =?utf-8?B?bUI4V282WDM4TFFnTFIvRXdnclFkVEhrYTdMM3pEeERkOW05N0RnbHdRUGdh?=
 =?utf-8?B?bXZhbXM0bzdvRjR6b3N0dVh6VTJFRHRCT0JIRm1VdGJOZXRYbGE2aHE1R1NZ?=
 =?utf-8?B?NGpjOTB4cHNaV2RKalpRcWF2WTF4TzV5VDlaTU84WkROMGVheFp0OTYwd3dU?=
 =?utf-8?B?c25hbmxPWUs4bEVYMTl4cEhpdE9FYnMwUUhyTzdrcjE4YWlJU1Y1Y2V3TlBS?=
 =?utf-8?B?Ykp4SnRVQk5mcXp6M1pNUndIbDVMZ2VsTnVHd0QrMjR1WE82MUxlNGpUcG81?=
 =?utf-8?B?dkgxMHp3a2ZlVWVHNTd0blRKUmtZRTdqWkVWNE9iTGNwZVE1R2hTNExlTkhy?=
 =?utf-8?B?VzZNZDVWbk93b1JkUWhsb09sTlM1OGxSN1RDN1dpUVNvc0Z2NUdlOXdES1ZI?=
 =?utf-8?B?QUdrUmhOc3RFMXZwT1FrUmdwU2RkN243eHBMUVZKNUVjWTdqa01rdWVhODAw?=
 =?utf-8?B?eE90cEZQOVB5endENUowMWJLTnRPRTNiUC9HU3FPR1ZYSEl2SVNkMFh4ekwy?=
 =?utf-8?B?alZOVC9kLzE5dzlJK3JINmp6YW9RcnBGdGppdG9IOTU4dHI4eEw1TUo4aFpF?=
 =?utf-8?B?TytpenFXcUlET0NtNmZLNDBDY0x1RGhEQmZOVlo3YUpSZXRDZmpSLzliUDg3?=
 =?utf-8?B?cDVDRXp5UFl4RUJTZm96OGVjZjNBbS8xSFpoSWI3bXc1OENGWkIyNlA1cDgy?=
 =?utf-8?B?SWVPNVRmN1U3VTh1ZWVUVVJDejAzNFNucGpGb3I3Y1l2WjJYOG8yTmR1K2hL?=
 =?utf-8?B?c2lJRVpldVhITWd2cEswSVc4eXhpaVc5cGxYSi96dGNjVzFpWnpSbDVLQkk1?=
 =?utf-8?B?UVI3RE1ZcmNnVk9vOFJzNWdwbXNkbFN1cm9nRDZ2cW1MNXowQ3B3VmZvQ2FU?=
 =?utf-8?B?VTVxS0ZTa2dtcHg0V0NvQ3JWT2cycC82T21MZnh4cEc4SVlXSFh5anYrMTRC?=
 =?utf-8?B?Rkc4cWFIVVN1MVk1MUxnOUgwRWxORGNzTkEzMzZ1NzJyell2YVB5VEdwcTFC?=
 =?utf-8?B?UFJISS9qNHhSVGhzbnh2UWQwaVlwSWNPRGxQNWM1Q3M5WGwrRnA0NHdaZFIw?=
 =?utf-8?B?SWp1ajRLV2FvMVlIVnREeWpvQlgvV2doSDN4TmkvOFB0ZWRKQW5YbXQyVzNs?=
 =?utf-8?B?SDhPSGJUaTd0dlhsazJTdUVsajg0SVRLYTA2R2ZMWGRveUw2YzlVcjhBSDhJ?=
 =?utf-8?B?c09uVzhyQm9NelpzMHppYityakVlMTc2YXU2aWVrSVVid0x3OGxtQWNlaHBr?=
 =?utf-8?B?ZzVUYU9iMHRCQnBKZU5wWnNFNjR5cTZsNUFQUmF4b1ZZV0J2NncxamM1V3p2?=
 =?utf-8?B?Ykd6WWhEb2hDNXFnYVN4SGFvS2JnRHBpL0YvdUM3TnE0ZXptZ2VtYnZhU0hU?=
 =?utf-8?B?Nmo5aEdBblhpSk84WnR4dmgrSWFqNzB0VzR4MUxhbXZUckVWckdPVGpVdmNz?=
 =?utf-8?B?aUNiSlUzTXBVc2R1Vjc0VXFQKzhKaVRZa0Q2SGZEYzA0Tlhva0E3eERzd2xS?=
 =?utf-8?B?Tjh2Umt4cWxJMGJ4aTJvVUZ2cmMrSGhCZXdZRVBHb1J1RFJTUWVHY1FlRldi?=
 =?utf-8?B?dTR5ZnpUY054OTJMdXJ4dDVmVjFnYTNkNlVMM3A3eGRiemw5dG9DdEdobGY3?=
 =?utf-8?B?dENOYUg5L3FPYW14K0tTL2lFZjZ4TDA3bDM0aFB0WnRKTVVJUWtTem9HVjds?=
 =?utf-8?B?OE40eXdYRmRMNmpQVElCOWVPZUNTSklGbkJ3VkR3Y1Zqc1B1WUVLdz09?=
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
X-Exchange-RoutingPolicyChecked: o0TxrC5JntPKBcv09NoKJ7kJMIzaD5ib9ucV8tBbkI35b2gPMhbkTWvZJ8puHkTeUFSgeEVcCc0lU+9BAhMZikxG6MBPNBMCAPvG9HxJu/XZisX2jwaUvsU5FzWzI1nPx+BwBOSiOiEOeIOovroqxWC8joUems7NJ+V8dHJWPzce8MPnhqsMXCo2g9+mp23ZvWuReA1p16eoB86g5KZxY/89UhO7s+E7ctxyVkicwDN03jXcbdQ7q7PUOGozqjhPzLIkdgZ8M9+zOMwmEn4F074QehgMLfl8uLjJ4WnB7rDKCqObCiZCw0GwGxB9DB4OACsLBZUAZH0+Fei/cmZgtQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de48d37-3319-458f-6d67-08df35a2f968
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 09:56:59.4734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXNI4O8JlNFvAMtrEeaNlwhqhSNwRLq7GT2/PlckxOAq1rg76HY8jy4wnKUnIA8zTk3eWiiQdOTrl59K6zIGfPaeAb8tvo5WN0ROst8p3bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7635
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5PbiA5LzI0LzIwMjYgMTI6MTAgUE0sIFpoZW56aG9uZyBEdWFu
IHdyb3RlOg0KPj4gQnVpbGQgcHJpdmF0ZSBNTUlPIGRlc2NyaXB0b3JzIGZyb20gdGhlIFRESSBy
ZXBvcnQgdXNpbmcgdGhlIFBDSSBUU00NCj4+IE1NSU8gaGVscGVycyBhbmQgYWNjZXB0IGVhY2gg
cHJpdmF0ZSByYW5nZSB0aHJvdWdoIFRERy5NTUlPLkFDQ0VQVC4NCj4+DQo+PiBLZWVwIHRoZSBk
ZXNjcmlwdG9ycyB3aGlsZSB0aGUgZGV2aWNlIHJlbWFpbnMgbG9ja2VkIGFuZCB0ZWFyIHRoZW0N
Cj4+IGRvd24gb24gYWNjZXB0YW5jZSBmYWlsdXJlIGFuZCBkdXJpbmcgdW5sb2NrLg0KPg0KPjEu
IFRoZSBjaGFuZ2Vsb2cgdGFsa3Mgd2hhdCBpdCBkb2VzIGJ1dCBub3Qgd2h5IHRoZSBwYXRjaCBp
cyBuZWVkZWQgYW5kDQo+d2hhdCBpcw0KPnRoZSBkZXNpZ24gY29uc2lkZXJhdGlvbi4gRS5nLiwN
Cj4NCj4gLSB3aHkgY2hvb3NlIHRvIHNldHVwIE1NSU8gaW4gdGhlIC5ydW4gY2FsbGJhY2sgaW5z
dGVhZCBvZiAubG9jaz8NCj4NCj4gLSBpcyB0ZHhfdGRpX21taW9fdGVhcmRvd24oKSBzYWZlIGZv
ciBNTUlPIHBhcnRpYWwgYWNjZXB0YW5jZT8gd2hlbg0KPmN1cnJlbnQNCj4icnVuIiBmYWlscyB3
aXRoIHBhcnRpYWwgTU1JTyBhY2NlcHRhbmNlLCBjYW4gdGhlIHNlY29uZCAicnVuIiB3b3JrIHdl
bGw/DQoNCkFmdGVyIHRoaW5raW5nIGFib3V0IHRoaXMgZnVydGhlciwgYSBzZWNvbmQgLnJ1bigp
IGF0dGVtcHQgY2Fubm90IHJlY292ZXINCmZyb20gcGFydGlhbCBNTUlPIGFjY2VwdGFuY2Ugd2l0
aCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4gSXQgc3RhcnRzDQphY2NlcHRpbmcgcmFuZ2Vz
IGZyb20gdGhlIGJlZ2lubmluZywgc28gaXQgd2lsbCBlbmNvdW50ZXIgYSByZS1hY2NlcHRhbmNl
DQplcnJvciBvbiB0aGUgZmlyc3QgcmFuZ2Ugc3VjY2Vzc2Z1bGx5IGFjY2VwdGVkIGJ5IHRoZSBw
cmV2aW91cyBhdHRlbXB0LA0KYmVmb3JlIHJlYWNoaW5nIHRoZSByYW5nZSB0aGF0IG9yaWdpbmFs
bHkgZmFpbGVkLg0KDQpXaGVuIC5ydW4oKSBmYWlscywgdGhlIGRldmljZSBpcyBub3QgYWNjZXB0
ZWQgZm9yIGRyaXZlciBhdHRhY2htZW50LCBzbw0KdGhlcmUgc2hvdWxkIGJlIG5vIGRyaXZlciBN
TUlPIGFjY2Vzc2VzLiBUaGVyZWZvcmUsIHJlbW92aW5nIHRoZQ0KZ3Vlc3Qtc2lkZSBNTUlPIHJl
c291cmNlIGVudHJpZXMgYW5kIGZyZWVpbmcgdGhlIGRlc2NyaXB0b3JzIGluDQp0ZHhfdGRpX21t
aW9fdGVhcmRvd24oKSBzaG91bGQgYmUgc2FmZS4gSG93ZXZlciwgdGhpcyBjbGVhbnVwIGRvZXMg
bm90DQp1bmRvIHRoZSBNTUlPIGFjY2VwdGFuY2UgYWxyZWFkeSBwZXJmb3JtZWQgYnkgdGhlIFRE
WCBtb2R1bGUuDQoNClRoZXJlIGlzIG5vIFRERy5NTUlPLlVOQUNDRVBUIEFCSSB0byByb2xsIGJh
Y2sgdGhvc2Ugc3VjY2Vzc2Z1bA0KYWNjZXB0YW5jZXMuIFJlY292ZXJ5IHRoZXJlZm9yZSByZXF1
aXJlcyB1bmxvY2tpbmcgdGhlIGRldmljZSB0aHJvdWdoDQp0aGUgVU5CSU5EIGh5cGVyY2FsbCwg
d2hpY2ggYXNrcyB0aGUgaG9zdCB0byB0ZWFyIGRvd24gdGhlIGFzc29jaWF0ZWQNCk1NSU8gbWFw
cGluZ3MsIGJlZm9yZSBsb2NraW5nIGFuZCBhY2NlcHRpbmcgdGhlIGRldmljZSBhZ2Fpbi4NCg==
