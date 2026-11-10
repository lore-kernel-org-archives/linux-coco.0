Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336948;
	b=gemBeM4a7JsD/7CjylgrmFa/Ej9Oh9Ex2s9MbtGGLS2u9FbGWafND9jClGLV+DChaPSZ
	 lCY1RdLdAPL7Cbu0SR5zAlYdjueKveL7lHq/JnJeNbUL8PbVxfLrDuMmV9YqqEvGiAlfZ
	 sA97YUvVHZz0fj0fn8bU10zZgnyWVi1w+ICC2kVeMv1+7912T29KmA+Ds6HFH/eAPx30I
	 EWA28OZBUvg8XC8Gbg6TbMtLnpAAdwUWHFZn5MuSS1hhOzmQr398xXv6htpnBqWkQkPdv
	 tgts4+DF5TXlZmOFIgSR0S3FZfnB7KtCLV4XEov62vhDouHA0FUt/ryqiCDhCPGEfzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336948;
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
	bh=Lm8h691DHaDFepuNFANA/TJY37Stn7Xv1pTUJarMzvM=;
	b=Zb+wvcY/Qr1oFDuNVRr7JbCCBbmOl8Qa0M97BC08PuVmpn51RHyF6JgpIuYRd5xrBc3+
	 xTtc5OcobrXx1cFVjAWdehqEzN52Z7CuM3fjWLj4GU+4FdojhpU86eyTacTqXNUktd1oU
	 buo/bJ1mzPxf4CI0npSUdm4HApYRYczWQujgEqfjpW2baYFr58p+zorysWZbLHa4L3nLg
	 cyj2qqrSypVdnhR7Ve4KYmkr0QCTQmtcW7iPa/kuUe/9KHCPMW+UzP0TWTK9c1r/eHsRe
	 bhzaAC2yvsT+wFlrV8M4WPTPo2YZgJHrx/Be5ZagyBUTcMMq44BfVJ12CDnZ3YjLZDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bU7POvZk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFC6606A332
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 18:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFC6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bU7POvZk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794336946; x=1825872946;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lm8h691DHaDFepuNFANA/TJY37Stn7Xv1pTUJarMzvM=;
  b=bU7POvZk342W6zg3D+65jC3tXIWvrJKfS3AVmVtYRsp8p7ssodTw7bt7
   yefhEd7/avNNhrnUiwuYInQ6EHr24nhqRsfmLeFCkowQsX1YntxvhH2vA
   yl1jY+v81VGZwC1uxQ3b1ykhADBR0gI+5MboEDK3yER0aZ0DD4dyMnnT9
   6fq/w2gdDvsftEnAnFdwovPtywuYfLyE72rMeozB/sAVatJUfpy/IUq7s
   O1/S1bA+77O/FZObwE/bdozd0BPLAZZpMggKC9kQcWIrpYJQvHGhSG7Sf
   b79jH10z2m1FOGBj5Z22dOQoLi7zoxDm3WaMtFYEh9WPwJyBaGUQTGAkR
   g==;
X-CSE-ConnectionGUID: JareceUWQKucQfM4jMQ3BQ==
X-CSE-MsgGUID: ZjdF5SbyQEq8lU4ofRuQkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3099349"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3099349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:55:46 -0800
X-CSE-ConnectionGUID: 5x4lgZtZSimO/Dzk78yIog==
X-CSE-MsgGUID: /IgBxaPrQU2Hh4Mb/7hZBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8226916"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:55:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 10:55:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 10:55:44 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 10:55:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyDJVqxPJUawJHOCjNqjaqGOvltWx13xeOj8NMhiG5RCejM657eqVroXxyGs600W2+3neSEpMauScgjbkEY/qWC8R5FkKKR3dhrf0+FIq58u3w3oBXPM8GJpuIQIfTi15PpgYKpNMfB9cJcVGF+zQMqQp6hYnsX5steA8XFRN9SECJUHgcbkByMXsY7aMk43v4lnTIblZpcVuF8Ai8wzsvjiy4+VNrYqXp9UFXEGSx/fHJU9dYiblLnqqGekfIlWH6yEPeVqF6Y//VTvu/XMNpSTjYwUWm0VqYVRQnUPpe3EOjawLjw/ojMNGfAIL1Tw2vv2tzoD6/Q64f8yNts/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm8h691DHaDFepuNFANA/TJY37Stn7Xv1pTUJarMzvM=;
 b=MdiHmnZTQK3UK5kEMOTZ7zCPX8fX1C93oCnKN6cf6dSz3NiFCp9PerhPV5AfZquLJSbaaI7otd8Ejm+NWRb+e+AcN2pbAmWP2OQIQqYWptRB0ndFkkmkgecBCpGxetKF+62KLnIwqNy+jENRZCVn4b0mGsaZPvqVNLDo4GLU5owgTWxVEQMcNimx35dS4aKtC99qgTMP5fQjX/3vupd8a/QtrooX2unngY1yle6mKl9FOogY/VYfcrXahUEv9Nr32MehXnfQTVEPjNGvI20f5d0WBMCNUuWLk6s9/oWkuVpdV2E5gehi6iSi4QyJvX28stbziGjJoILux9D8iH1B9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CY8PR11MB7266.namprd11.prod.outlook.com
 (2603:10b6:930:99::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 18:55:41 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 18:55:41 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
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
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCACkAugIAAmzsA
Date: Tue, 10 Nov 2026 18:55:41 +0000
Message-ID: <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
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
	 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CY8PR11MB7266:EE_
x-ms-office365-filtering-correlation-id: 568d2863-3e5b-4a88-c4d5-08df3f5c378d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|38070700021|4143699003|11063799006|261021121427099003|56012099006|261022105027099003|261022075727099003|261026140227099003|261102123227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: 4SnoLRDCLe+/GMod+E/pHoChGv4mS58bmaJsSb4jNPzA3VH9D0b3fQ07/XwMkx06rOtFeReVTlY6MkQlCLcsZc+aTJ4oi2h2z55WAS9ZxWkWnOPm4wXV0Y4//5B1XFzB6qcvs2kjXUqaO159JbEh4SMT+ObJvVCj30GXbCEXA1D6TDb9EsNjYqZVtMJucJo6GdTg1TO0ApUS6pqcmvxGQ33LVmnMamxzsfXZsKUVFMifvXHy+gVCEEyxx58UMkSj3HW83nmqxs+AclOE9OwW6B20lN0Z4fbDD2i0GVc/z0DQjNEdrHA5ZJNu1bCa1kiOY8QIRc1S74P6UigRhqzeI6oflFfVdVC69G/7YW5auDL4RMIv9o47IIXEigjKbRl9Sgsb9etvAtnOpYXt6y3+oSIp7NY5cNmlGRYsum3LkFRU0upK3A7YK/hvn+TTK0k7mStWwsE+Vdokg/qoM2/zLUJpJc9ZioWRRyNb0uu+6InW9tFsuOxhoWHxDAvw+IoMaVPFm6STpwnaj+La4YtPoAbXLyrtzs5PJaTiOKQBakpwUyMqOusFA6GS7hKcWNDv40h8Cy1x92U0U6M0a2tUbKNiRXxjB5eM8MT96jAPizqnO7TF+onUzMn40MSmrLQ1foCwsyU8LhD80IMuZMwkecrdsVk7nhIEh57OwurLU6rO0roCh08FjQIxexCOEdSaHH0qmtAWNRnKcijtQLKunCb+ZyGqco5C4cdATd7XtrM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(261021121427099003)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SExqK25tQlpyUWF0a01tTWZ4eXExbjlUQXZwckEvQ21NSnBTaHE4alV2NTl2?=
 =?utf-8?B?dVdvVEQvVHVGcmJGeGdSK3J1cEExZmsxRzM2U2VmbWxEVWVsR1pLaEtMWjV4?=
 =?utf-8?B?R2xhVTJpWWo5VnhBdTBDR3NOZEIxWUJRVElGZWVKWGlPZVo3K015YUhteWs4?=
 =?utf-8?B?TVl0MDB2SU9lRzhjbnE5VmpPb1FyRnN6UGp4N0tsbWJxSXkwQW5YYmRkNFhp?=
 =?utf-8?B?WE1CZTk5UTlnMzlUMDZGVytOaVkwTEJnYUFJMk9sZlBZeGpKZ3lCWGdJTGYw?=
 =?utf-8?B?bW5ya2l3UVFpNDNHQjNIa2ExOENWY0YzSUdJNlQyOTdwZGVZSDNsWCt0aFZJ?=
 =?utf-8?B?TXZoOUx4dGhlV1RFdTNKOWgzMFJQVjBjUzJ2UW8ybnY3cGFvS2U5SzM2ekpo?=
 =?utf-8?B?NzR4U3RZODlHdW9LdUhyRDdpOWtXRnVGbDM2UDJJV0loaDVWK1pLWEErd2xt?=
 =?utf-8?B?TEhUMlQrSHNyUnRtcjZLZGJtUGRXSGhzcHA1RHlPU0VEYW9KejNlVklWaW5m?=
 =?utf-8?B?K05UZHAzaXg4QkxUVHQ1SHhWSjgweWVSYjlVekVFMC95MGY0WVNYVE9Jck43?=
 =?utf-8?B?ZFJFQW1pWE9rdkxuSDUyYjY2TzI0N0lQOU5Rb3ZZOHBHSTNNVmx4Mmc1ZU04?=
 =?utf-8?B?VkRqSnNLQ0tnRW5vcjc3N2w5RU1NNDQ1ZFRzLzFVb1lRSkZHYU50M1pIMkQv?=
 =?utf-8?B?bzkvaWF0d0N3OUpNQTRndzRhK2pPYjNFKzZuS0VBS0pBTFpuL2RYeEU5SWJp?=
 =?utf-8?B?R3lkY2UxRWJsdkpxTFBhRUNLQzU5V2NiVkdLSndxUk05SDFnOHJWenB4cHRh?=
 =?utf-8?B?a044aVcwcFJSeEthSU9wZlIxWHU3emJnb3BNM3k5VytHcXFBMXBaczVKYjFW?=
 =?utf-8?B?a21BNFdleGdoSkVvNHlHUnlRb0VaKzBFNnJIcnU2TWUzakpmRWpTenB3eUNV?=
 =?utf-8?B?aWFURVFmSloza2lYbGR5bzBDUWJPbmxBanMxcU5uZEowd1JseFlta2Q5ZFFL?=
 =?utf-8?B?aGN1Zmp1MUxYZTlBT3dKZVkyZUxGc3Q5c1Nia2txS09SbjFQdE1KZmZ5L1ov?=
 =?utf-8?B?eHorTkNXTjRMS1B4U2FnTFFRaUhHTjlwZVd4a1lmcldxZ0ZabEFHS2JvZHlz?=
 =?utf-8?B?MUdGbkhPM3cyTVkyTDAyemZwMWVTeHBzaVBzcXZJUDhIZ29oNmUzTHVPcFdw?=
 =?utf-8?B?QVg2OFArblZMYTY3b3VZUG5wNk5McVByN2lvenFPNithQXAyRyt4Mkx1WldS?=
 =?utf-8?B?bVZGQmIxQldDa2FaenpqYjFkM2hrV3JZOHYxL0pwOXVFWUxuaWRPa2ozQXln?=
 =?utf-8?B?ODF4QzcxQWY3M3U5QXlsL1R1WWhjS1dZNjdnTlEyU0xNUXpKUks2bkljNTJw?=
 =?utf-8?B?VVY4TWwxTHB4NDNZQkV4azZiQmt3NUNLSkRXU0hFMXUzS2NPNWJnNGNCMmdp?=
 =?utf-8?B?SEVQVHRqZkZkMFFMK3c3dnJlK1RyOWxYR3hWOWFDYmUxSngxV2tUd3c1VUlW?=
 =?utf-8?B?MktoQnlkQ3M5azhlUGN2S1ZzRi9ZdloxZkpwaVI5QkhyYngxSGpwb2dqN3FW?=
 =?utf-8?B?QUtlcnMyc3haTVJoR09UN2dhT2NQZWZnRXNoNllnMzhsZkxJTkRhSW1hclVN?=
 =?utf-8?B?NkNJM0E0STJNR1piQXZOMUt5WHI1OTNnbEYveG5iZ0Z5Y2w5aXgremY2NTFJ?=
 =?utf-8?B?ckVRYU9BSGxEV2NUVnhJRndCUnNWU1BrNVUwUTR1OVVhdU1hdjZUM3JNZDgz?=
 =?utf-8?B?N3BLWDB1NXgzdFFVQ3ZKUFpEL05PcDFndUNLSS9COVZHV3VZL0RobGtuMDdo?=
 =?utf-8?B?ZE5Lc1JmbmJ2TUl2dVA4MHAvU3pZbE56RUEzZHdJWW9zcXQrdWRjc3R2amRF?=
 =?utf-8?B?dlJ4dmlyREpaRUhiTmdDQmEyOXlmNlJKSitwQUl2TlpjeTNDQWZtQkZrVFV4?=
 =?utf-8?B?STAvaVFFNmZFYS9YOUlNMWk3b2JwdGN1b1hMVXd4MHdmWVRseGZEZkxwM0Yy?=
 =?utf-8?B?SGpkZTlKeHh5d3l1WUg0UjFRcVR2ZW0rSG96b3ZwOWJIdWRnbTZYSDczdFpI?=
 =?utf-8?B?SDczbWZ5c1J1eHZwQ2NIdEd3OWkybnlPTjQwNnlPV1ZycWVvVzZmMWF2KzZC?=
 =?utf-8?B?T0RzSFFHQUh0aG1iWm9FUzlKL1pkbkc1ZzAxRXJHRnhxaDdVREllOTNPZjYw?=
 =?utf-8?B?WnpibHhaNVozMU5kYTdZcGNhSHBkUERvNHN1VkIyMnZsMXZ0bWFKbTJLTVIr?=
 =?utf-8?B?eVlTOGZGcXNyRnlLcXBBS1drQ3VBZXVDUG5ueHhmZkVCYmJNbmxBcmlvWXNB?=
 =?utf-8?B?aGdxQ240cnZScmpWOXduV3AzODRXR1JkT3Q2MFNHSlNMRm9TMDlOb2dvVm5p?=
 =?utf-8?Q?eTc1AddeGX3KdP4U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4FB57DAD40A5C4895453278AB38E26C@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: b+xdA+sFX/PQ4FYYUqkYt3iKnVYlQmfpWIvYwhRNMil/2LAxcxOkQ92s06ev3LfKwOJB/Kw9nh86hgINGzWKwPD2SZwWXKA2Rj4xH0P/g0XlQhCwAC3AbWJMoe7kRjRDCBaCH9tfnZRU+mPkZeF23vGcqVB69PS38pCeZilpiGYJ0eU3h/jhFM2bd+fEefEObp2ebku5dqFlFrsp2jiipKHUyFIXB70nrpBUMNQfZCmczEehMjgYf9Zh0J82u1NVnCNbRP402mMUl4bBljQ4/a0s8JsAeLPn1vlsu/qMuZ5CQ3GPs0TYzeQ1+lEe68LW4gQJIXbip445gm9/APTjUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568d2863-3e5b-4a88-c4d5-08df3f5c378d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 18:55:41.1462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbO5One7RrggXSAXyCLvUnwwf9N2ejXp8Zy9Q6N+q5YQACgR7NkKA4Xhaw1PYRD9Ky6Ld13cg2v8C1RDRIS4Ugv42JuPlK8QwuxXOsSurro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTEwIGF0IDA5OjQwICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IA0KPiBJIGZvdW5kIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZGlkIG5vdCBoYW5kbGUgYSBw
b2xsaW5nIHRpbWVvdXQgd2VsbCwNCj4gc28gSSByZXdvcmtlZCBpdCBmb2xsb3dpbmcgdGhlIEdl
dFF1b3RlIGltcGxlbWVudGF0aW9uLiBUaGUgc2hhcmVkIGJ1ZmZlcg0KPiBpcyBub3cgYWxsb2Nh
dGVkIHBlciBkZXZpY2UgaW5zdGVhZCBvZiBwZXIgY29tbWFuZC4gQWZ0ZXIgYSB0aW1lb3V0LA0K
PiBmdXJ0aGVyIGNvbW1hbmRzIGZhaWwgd2l0aCAtRUJVU1kgdW50aWwgdGhlIFZNTSByZXBvcnRz
IHRoZSBwZW5kaW5nDQo+IGNvbW1hbmQgY29tcGxldGUsIGFuZCB0aGUgYnVmZmVyIGlzIGxlYWtl
ZCBvbmx5IGlmIHRoYXQgY29tbWFuZCBpcyBzdGlsbA0KPiBwZW5kaW5nIHdoZW4gdGhlIGRldmlj
ZSBpcyB1bmxvY2tlZC4NCj4gDQo+IEJlbG93IGlzIHRoZSByZXdvcmtlZCBwYXRjaCB0aGF0IGhh
bmRsZXMgcG9sbGluZyB0aW1lb3V0LCBJJ2QgbGlrZSB0byBzZWVrDQo+IGNvbW1lbnRzIG9uIHRo
aXMgbmV3IGltcGxlbWVudGF0aW9uIGVhcmx5LCBjb21tZW50cyB3ZWxjb21lIQ0KDQpUaGlzIGxl
YWsgd291bGQgYmUgcG90ZW50aWFsbHkgZWFzaWx5IHVzZXIgdHJpZ2dlcmFibGUgdGhlbj8gRG9l
cyBUU00gaGF2ZSB0aGUNCmFiaWxpdHkgdG8gcmV0dXJuIEJVU1kgZm9yIHRoZSB1bmxvY2sgb3Bl
cmF0aW9uIHdoaWxlIHRoZSBvdGhlciBvcGVyYXRpb25zIGFyZQ0KcGVuZGluZz8gU2hvdWxkIGl0
IGRvIHRoYXQgaW5zdGVhZD8gRG8gYW55IG90aGVyIHZlbmRvcnMgaGF2ZSBhIHNpbWlsYXIgcHJv
YmxlbT8NCg0KSSB0aGluayB0aGlzIGlzIHRoZSBzYW1lIHBhdHRlcm4gYXMgdGhlIG90aGVyIHRo
cmVhZC4gV2UgbmVlZCB0byB1bmRlcnN0YW5kIHRoaXMNCmVycm9yIGJlZm9yZSBkZWNpZGluZyBv
biB3aG8gYW5kIGhvdyBpdCBzaG91bGQgYmUgaGFuZGxlZC4NCg0KQWRkaXRpb25hbGx5LCB3ZSBz
aG91bGQgcHJvYmFibHkgc2VlIGlmIEphc29uIGhhcyBhbnkgb3BpbmlvbiBvbiB0aGUgdHlwZXMg
b2YNCmVycm9ycyB0aGF0IGd1ZXN0IFRTTSB3b3VsZCBsaWtlIHRvIGhhbmRsZS4NCg==
