Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190326;
	b=ixLxVVpKugA8KsvIwveQMUusMDWGyshyo/ru/dTIranaA/zDjjyV1gfGQsHiEpHPrLcO
	 0N4sFfrq/2Ul6MS9DDNUgd3ym0wu6A8GVbH764OruIdkS/qsH8R2BH3WPlLfuw9M2g5OU
	 7+fwjsJKQMiTDZ936pc9UD7xZ6bAngS+FclJfipZxKeHA2zMtprPqFj5KGZXbEckZuQCC
	 go7kBtkArbLFhoTszCU6+dRjBVqLJNfMEoAiCbi6uT++CIWAARs5595qqhvng3vKV0MYe
	 DNaAMO76LQH3b8QiAdf9wYit3XE7DhmP04fEEm6fnW+/PnkMDAQ5B4DLfgkeedStrNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190326;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=xk+l57S6khbi4QI7xszWo9Ndfm7EAimq2hFGq8ScfcQ=;
	b=atkHL6VA5Tar5NsdEGDjAl8KTASReKz5n2YakHOyEwIeyaItvdVqnx3ManDmDoQqpqve
	 T2b0uTiznvir1pguEKs4nYxqoRjQygi5UhlTDkRDm6cZ7af85FskaTaMyJnT7yXBfRgNC
	 Vd7QuWzprUx7J20B7bPfWFhqjq98nzp1HiBHQ3zXUQMTpaLvK4OdNY1PzR0jxIKaIZ125
	 GuQ/t9TlhLFJjWJZmIe1QNB0wAQ4z1uYLO1o1FJTCcmMryjLR3waUx04lGkte3LqBVzlc
	 DaJ9uIONENxMVu+Mjjh0fxzWavS3u0EwhfjXxokNWjHKUzXVHSF18bGDS4CJdqvyd9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ReMGFs+C;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="Mm/gSRHe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99060A260A
	for <linux-coco@lists.linux.dev>; Fri, 20 Nov 2026 15:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F99060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ReMGFs+C;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Mm/gSRHe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795190321; x=1826726321;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xk+l57S6khbi4QI7xszWo9Ndfm7EAimq2hFGq8ScfcQ=;
  b=ReMGFs+C/XNVMB1/bVq7GQyXmCM2qTAtB7bhtY+/TycYY5pcYXsTxz5O
   zgxL3GdskZ8n0SvYOViebo8y1/EPMxwYQE0jhDOW2NpkvGGh6reUeSWUx
   2G+kaUZHDph8ZjyWHpzeHIkvhpiUcI1nipq0Mq3WZEJagFcT9DwVtDwb4
   y4GF9qQKWEJ/jT3z2Sb27sHwS+zuGXwMTf0cDXzOgPH42iCKM+hn5kzW3
   kkRHsByI50lR47kBFG17PP0TZYSoT71UhlevvwnXt01hp93/oaXsyxFXE
   xE4/waF24Rvm0CUQP/IFwuvTrCVQMU/cjPgzdn/f5Tro6Zpcd2+XyrWCt
   Q==;
X-CSE-ConnectionGUID: sCPPgjejQJmFIzMbhGkQ9w==
X-CSE-MsgGUID: huAPCRLPTs2Tn/2dqssOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4062895"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4062895"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:58:41 -0800
X-CSE-ConnectionGUID: Mh+SQFHVR6iUnofZrrFmTg==
X-CSE-MsgGUID: VqgTc8tPS2yhYXsCoRgUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11059312"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:58:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:58:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 07:58:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:58:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncZsamGgpsXmKo3+iCsisCHLR+PiElm6/lnbNl8lsH+x4cZgeqZS/77vHPLuRIjiDs4dOHicgFiv3dZhyZ5Uo2MOPcQt63rBK4hGTbt98KcxE4k9FyqBDyjRUtZyk8f/FOz3HJhBBlq5iTXmkUDKZ5+XqVg55nuJ4vtskhbSx653w8lukwA3+bmc7VKDTRZqn3evzUzJOueRynY8qehdXQk2hXoYmLy7FMgOe5WpIWuqxNB3nw/F0A2aEIE5w1sm0lUaJNk7FP/LV19j5ekHnpjY7c+/2qKWgaKcGpyKDlKCAfMQx2yXp0fkcvpxuqagf/Q9+ZSatyz1g1sPdYA4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xk+l57S6khbi4QI7xszWo9Ndfm7EAimq2hFGq8ScfcQ=;
 b=pFzlWmlTsjjvRqYy3IaM8OnVAuO5POiOjWkrTmh8nJEm/rA7DWznjnhTHbSKUAj3D3Dxl93eE7eYijqVBWS4mMLMBnuthRava0YeLSnTl+agnC57czb9fQ+/BvX4+iWVBwfOiXdvJwhiCKXv05v7RanctrUFawit6OIbD6jZ9oGalpjrXnYJw5DWnP1jVK99L34MZ9BUkFvsW90rkPxiRj+MSRixePzbJZvWd8E7FDKaPHCxCrLt7DKAh+BThauwIJhSe62dJqjT8+Hm/MBX+IDvCvTfQa3RNo1vGwZOsT/SruzwBbvfXtEOK1sukMBFNqUNI68C1PewftGiN3oREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xk+l57S6khbi4QI7xszWo9Ndfm7EAimq2hFGq8ScfcQ=;
 b=Mm/gSRHex5h1LhJW+vxkxGFvaWK++30j9JcFgtNraPwhAo73NBY0xVJG2ppcwV+NIEUTbZIvZxdIMdnqzDFJEwuR3q5KJjZ4ruFemHL/AkEnnZHZN0w4kIn7p8ndayWiVQGjdJ6qwWnnwsq0ImupdxeQB3pETyPC5ZMJuLv9ZUk=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by DS0PR11MB8133.namprd11.prod.outlook.com
 (2603:10b6:8:15b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 15:58:27 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:58:26 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Duan, Zhenzhong"
	<zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
Thread-Topic: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Thread-Index: AQHdS9rOiS8lYl8h5USZJ7PbdHTlXLcPfC2AgAUDyoCABx4TAIAZ+0KAgAArSACAAJ1GAIAAi9IAgACKn4A=
Date: Fri, 20 Nov 2026 15:58:26 +0000
Message-ID: <95fffbacc6532ada852f3d47226072cb8012db64.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
	 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
	 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
	 <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
	 <20261119135908.GR2245175@nvidia.com>
	 <ca4c5aa76780edc1e2387d84ae219ff0f587168a.camel@intel.com>
	 <f5a13a36-8736-40c4-946a-47bcd27e61aa@intel.com>
In-Reply-To: <f5a13a36-8736-40c4-946a-47bcd27e61aa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|DS0PR11MB8133:EE_
x-ms-office365-filtering-correlation-id: c2b2ff89-4e55-4fd5-4d01-08df471f1ce3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|56012099006|38070700021|10067099003|4143699003|11063799006|261022075727099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: U4Nkdh/QL/DMmtdfkgB1EI/8s8SSXalUiodIZiyjpGJWKPlcLPSpw9hCxOwhRn1WA+PIykhKTFEGLbat1G+jGIK9cYq60FliKTmwowAQI8jvOd5Ia+COiEQxBnERO5/DbWu2/TXxOg0NIEDIWyEVGRAQhxj2dPOL07Y2QekpPQZiSnKT0MyGAN9keaOqSawhhFodAL9472WTimwLxTH1e/90YEX1JSx0YE6NEUiGdlJAhlB9rCYuEFwyh13akG/6bg7C26u93zeEEj4Q57Reh7YRiaqd/sHKaSa0ba87oKJ571fAcc4dxHjIvTSdLBNHwpuUM0KAxx41PCgGbBs5fXD3Rcvv3FlifKN2Kfj7hh8oq7dWeDZt0XdiAE8rn4zX1kU6gUitiz4W98XZ9DFj5KyGhO2d1ffyR4s3boA5qeZkGl8GFzcw6UlPvnXNNheg6BX+neqT/HqkbLBN8n9tLf8hV1qslxFoHCLL0hRfUPdCUDiswv7/3b7f6zHwFnS+E0G7+kEWkheuxvmD5xC3ZbPqyU79sBd5brUEg0pR+mB5hWixDbtQPoUmt38v9efp0QtwcwWK6QWOyLy1nHCkFDDYl526OklxpHvP3tF2njaNFtnDZ1d7ryKWriIzD2n1wxjyLYwKvNeNvWAzNgWkl4unWyb6YrB3HzMQV9v4NyJPMS05jApDSAneClUcAv3pkPTR2jCYAlWuLZMypENZrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(56012099006)(38070700021)(10067099003)(4143699003)(11063799006)(261022075727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDlMckJvMHl6SmFQTXljZzVKSFpkNUNxa09CU2dBZ0lKc3B4NUY5WGhMOCtE?=
 =?utf-8?B?UUl4bVV5UUhZZThWUkRDckRpOFNNditYbU1ONitoMXhzeHlCZEhBWitvZWcz?=
 =?utf-8?B?OCtGdENub2tkb3RNajRIaHRBSVIwYjVOL1d2N3d3cHZ1R0xJcmtYNExHeVVH?=
 =?utf-8?B?YVkvcVcwczdnR1g1NzJ4Slc4Q21RR1dwaFhCcG9vSmdQbTJOZHJ0aHJwMld4?=
 =?utf-8?B?clVHVTZ1ZWdTMmZGbUtvWDZzdUw3c1Q1OTIwTWR5MmhpNTVHeE5rL3huY2J4?=
 =?utf-8?B?aG15blZDWVlGdGJ0dzlpZytyWkc3ajJoWitMOGhDK1JCN3hpbzBwQjFOb1JL?=
 =?utf-8?B?alFBQngrNDdEZGtqT2xzNTQ4MFc2RVkwdDhOZGIrd2pBb3hseTVSbWdkVGdX?=
 =?utf-8?B?aEJHQjVzU0N5czVnSjl6eGh6blJBOTR3ODlIVm1RWXVnZXhkaXlQRVB2cklJ?=
 =?utf-8?B?ZVBzT0xITlJueHhRTlozV2IwOS9DelhnZzlPNm1KMUk1ck15TDF4cG1xbUUy?=
 =?utf-8?B?Ym1abHNlb2hjR0NDUFppWFo3a011QVZGSzM3VWphaTNGdUhuT1I3MkUvREZQ?=
 =?utf-8?B?bUtUWjkvaTI0b3E0UjZIMXZKaWhPVXFLczlnc3dZTEc0VEZOYzBwdTlpV1Vu?=
 =?utf-8?B?ZnFMZklGdzExTzdwTi95a0FSM2M4dmxJYmowdDhhNDNyU0hiT0Q5TDdOZUQx?=
 =?utf-8?B?aG5wbDdkL21NVFJIMWNtb09RVzA5V1lVZFFPSEFtbE8yK1hWM3dvL0lqTDNB?=
 =?utf-8?B?Z3AzQVVBWnlEMFBZdWE5Um1kSERBeEVJMWF1OFM3Z2YzQlpNM09Wbm5kcVpZ?=
 =?utf-8?B?SU1UNjdVLzBpREFxVWp4VVA4T3MwTVdSV2tvV1lLR2RYb0JObE5qMkV2d0xK?=
 =?utf-8?B?S0lPWlBIdmYxZjlmd3cxb01xT2RseHIxVEhnZzhxTEF5Z0dmLzdnUEpvamc5?=
 =?utf-8?B?UXQvdkxLeFJDT2poRzBKZXNmWS9pNFJlV092VTYya1cxN2FVLytRR3lzT2ZK?=
 =?utf-8?B?KzF4c1JBTTR2WXEyLzZsZE5kcVVSRmVhQnpnZmF1cWxUV29QS25tYUdqWnNj?=
 =?utf-8?B?ejZ1MXlsbFUvdFRvQlNNZFpJR3QyNEpCdzV1R0I1OWQ2cHVjSFk1U2ZIRTA5?=
 =?utf-8?B?ckd5NlBXYWFlRHhRNCs4NVNzYWNueGpTeHE2MzhtTjNGaDhDRmVrK0NHY0Yw?=
 =?utf-8?B?bGh1bGNwU3Vyd3phc0VJM3lmVEl5ZlFZOStpb0NTcGIwRGxXbk9CaUpDWGlX?=
 =?utf-8?B?LytUK2NtbE8wOTdMUUVYRzYxclRUZHkwbXB0YzFUL2p3aGxXdXBxd2JvL1ho?=
 =?utf-8?B?OEl0MTNSVEZSZ0NwTzJaVGdxSkpobzlQVXFPeUpJT1pjNVZ5YmlIQXhHc2lz?=
 =?utf-8?B?a2cyOC9sOGcxbTlZWkpDb0hiQ0dSZzBZYmZVSndRUytKMTl1MnRlbGMyeEJv?=
 =?utf-8?B?R2dQRjJtTC9HMFRxM2dhTzJ1QmNSSDFKSER5UW1NM25iNXQyRDY4emVJU3ll?=
 =?utf-8?B?TGdXeW50enBJQld1VU9GQWQ2dDNZZ2FxRlViRzQ3SUdsa2ViQVhnMjhza3Vr?=
 =?utf-8?B?blRMcjV4ZjZuY2o3UjhUSWJXQWFpdmpORW5vT0lpMXpHTmFjc0ZUVmJmc3B6?=
 =?utf-8?B?cHh6TDNtRTArayt6dE9Pb1gySE5YS2lwYnhsVGRndE9RbzY4em1IYWp3dGlE?=
 =?utf-8?B?UGJoY21jVWtSYTZtYzFZeFJtZVh5aTFYYmRETU14MzI4TWliQU5ZeXNObHZB?=
 =?utf-8?B?eE5SeEFqMmkrUmJFV2VWb3UyWlFZLys0OHMwSmp0OWFuaDF5ZDBZNTIybkhG?=
 =?utf-8?B?U3NmSTg3OUhOY3pwY3JpcTN3U2hMVFZnbjFhaDM5Qit1K1A4UmJjZXYzVWZ3?=
 =?utf-8?B?SVd6ZUYzMmZlWWJSOEV1MlpRZ1pReGhmNVNudE5yMXdPWHRYUSsyMkpPRUtW?=
 =?utf-8?B?ZU1uSlFTN0piRC9UM2hGamthU3VYVHZWcXl0cW42b1BEQXpYVjJqL25mOTZQ?=
 =?utf-8?B?d3BmcmovcnlKN2hhMThHZkFzYnpoa0NTaDBTMHFsR0FoZi9FNThGTFhSTnlR?=
 =?utf-8?B?MWlCL21wL2g4SE9uVFNNZzhIQ2xaZXJmSGROS1VHcUNRU0NqUHNJakFTeHJ4?=
 =?utf-8?B?V25TWU1XbGs3SHdLTExFbGx3S3hVMDBOK2JFWnAwaSttOEZ2cTZrTkpjMlU2?=
 =?utf-8?B?b2o4elNJS2RIR00xUVg2N0tZVG9NVmVCZjd4TUJhd1djS0ttaCsvM0kwRHBt?=
 =?utf-8?B?RXFRdDl1MWg2bHkvZm9ZNHdBSEZNZUxmMDdKZ2VldHJJVFBtTVBQL1ZQTjFq?=
 =?utf-8?B?MS8xU0ZRVXZTUEQ2bUxyNi9NVW5BK3NCbStiOTRDZUhhdkdDU0R0Rjk0TDdP?=
 =?utf-8?Q?oFhIsJwOhNgurghI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E89CFE85B2489340B6CFB13EEB174BD7@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: CLotTFSTN+b5Khm5aB+IWrxswr9v8v3Zx3SgHJEOUpu3OAzyseAgpEQNWdHa6EzxgPaW5H2GadlmmLkPq18bKxL3A/pheAo+KV6XNIwjhC1txYxJ7dd5jFEUyqolMoYko3BWUber5hC5xYrFQRXce6qv6zmsHQElF7ttrZQepcv2htR7FzIzv6Q0mvNRdIEmiaGBsi79DQYOkM7+b3AdzRQaTB4PQgvDM+V7Vp1OIAR1ERWUAB5Eu5+qv60NFYcjLoC4ek+y1xDYIHiR8bP9efjoVzeXdKC9esBGE8kYirvHEsh9t7E7gvAWY1vf2iHSNjHHzcGBpAtGAXPW/jkezg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b2ff89-4e55-4fd5-4d01-08df471f1ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 15:58:26.3602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hgS2JNxV1GOcygd2iijK8Dm52dVmAFsvegWR7miMlM976vbs19A6tjP19VYFDNT+VhDxrIh+MNn4HlzZNP5PXzV/qlG4CbosUPPFqA+eqMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE1OjQyICswODAwLCBYaWFveWFvIExpIHdyb3RlOg0KPiA+
IFdoYXQgYXJlIHRoZSBvbmVzIHdpdGggdGhlIGd1ZXN0PyBXZSBoYXZlIHNvbWUgZXhpc3Rpbmcg
aXNzdWVzIHdpdGggbm9ybWFsDQo+ID4gYWNjZXB0LiBJJ2QgcHJlZmVyIG5vdCB0byBwaWxlIG9u
Lg0KPiANCj4gwqAgVERYX01NSU9fQUNDRVBUX1NJWkVfTUlTTUFUQ0gNCj4gDQo+IFRoaXMgaXMg
dGhlIHNpbWlsYXIgZm9yIHByaXZhdGUgcGFnZSB0aGF0IGhhcHBlbnMgd2hlbiBhY2NlcHRpbmcg
YXQgYSBsYXJnZQ0KPiBsZXZlbCB0aGFuIHdoYXQgaXMgbWFwcGVkIGJ5IHRoZSBob3N0IFZNTS4g
SXQgY2FuIGJlIGhhbmRsZWQgYnkgYWNjZXB0aW5nIGF0DQo+IHNtYWxsZXIgbGV2ZWwuIEFuZCBz
aW5jZSBjdXJyZW50bHkgb25seSA0SyBsZXZlbCBpcyBzdXBwb3J0ZWQsIGd1ZXN0IHdvbid0IGdl
dA0KPiBpdCBhY3R1YWxseS4NCj4gDQo+IMKgIFREWF9PUEVSQU5EX0lOVkFMSUQNCj4gwqAgVERY
X1RESV9JTlZBTElEX01FVEFEQVRBDQo+IMKgIFREWF9URElfSU5WQUxJRF9TVEFURQ0KPiANCj4g
VGhlc2UgYXJlIGR1ZSB0byBiYWQgaW5wdXQgZnJvbSBndWVzdC4gTm90IHRoZSB0aGluZyB3ZSBu
ZWVkIHRvIHdvcnJ5IGFib3V0DQo+IGZvcg0KPiBhIHdlbGwtYmVoYXZlZCBndWVzdC4NCj4gDQo+
ID4gPiANCkFoIGdyZWF0LiBJZiB3ZSBjYW4gYXZvaWQgaXQgaW4gdGhlIGd1ZXN0IGl0IHNob3Vs
ZCBiZSBubyBwcm9ibGVtLiBJIGd1ZXNzIHdlDQpjYW4gYXNzdW1lIFRTTSB3aWxsIHByb3RlY3Qg
dXMgZnJvbSBndWVzdC1ndWVzdCBjb250ZW50aW9uIChpLmUuIG11bHRpcGxlDQp0aHJlYWRzIHRy
eWluZyB0byBtb3ZlIHRoZSBzYW1lIGRldmljZSB0aHJvdWdoIHRoZSBzdGF0ZXMpLg0K
