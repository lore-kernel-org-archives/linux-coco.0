Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793740071;
	b=YXGxXhXcsASI+ZJXTvbEevcnUVNRmNacBGpviX6RJA+Y/wc6chLRyPLpTGEQf2H1/mln
	 M2yENC2a4PqzE6OECWuPUj82iVQhZeiH8LkmaGYmDtBrHJkmrmeO9ljV9XMDxh4llY664
	 ygm2v9nZTNIV49hiSuxcLc4IlfXBssYKwqEUPCAF8wJSDJNUZg3VUT0tstWXa3KqekfY3
	 JphVGis7buUQsU2ycCfeISJ6QYj2M8EmVsvEfZY/+/NwQ/FwTSYF0pMSnwk5p5MGYOJw1
	 x8eq2/JHYWclFivOqiDSbP1aQIIyIcsTwUqevf24Tm9W4Bk5QMCVlmWZonae0kIpqqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740071;
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
	bh=/4Fyp8X2ER7RY8Bo1w0SL8mNEUpfRgQDeUbMhEz6id4=;
	b=0F19DwxO3IpzIuHkg7WTU9t8d4VOPBGmonaOGmgfS3AhpcE86vkeOb3Gs2yON9rA3jRO
	 Ovp0Vb456U6kSt7gnEzJdKU89igNWnvUBr878x3TLqUlgo4H82YM5h/vXy5W5a8BYbs0B
	 1cTU2OIFFxU9yhYL3ketkLHf/gJFvyCXcvqWXBGWkinmqDMQ/CnSN/7ToPNnwBRaWel0c
	 FybjizbIFXj9QQSHLSbkZ1lSdv075peS5iijU4bPsRi+tbD7HWwV455TogsXbTRovmcsb
	 S7M51g/iWNbWd/X+lIgXn6iZZhrwATci12mKsgkyQQmJDzKbVgEkQ7z3511JyQfELLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMckykjK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A329606A331
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 21:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A329606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMckykjK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793740071; x=1825276071;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/4Fyp8X2ER7RY8Bo1w0SL8mNEUpfRgQDeUbMhEz6id4=;
  b=mMckykjKPVUTlw2egfMwqU60HL2/QO6ZUJDD2XCbkSQ16lksjD4Jv/Vo
   3t5MBz8PIJ7fw2qtz4ylnIheJwHI8P6x8bvWvy9teRtGstLRCLL9+3OjH
   PDhMLCctua2zwgThobTQsN8oXUrnBi3f1k6rJnbIphRhjPmnk8WlH40Jo
   l//ntLYtpnWXzDG818AdEtD00hvYy+si0HWhSF2bowCMJQj6fiBRCK513
   lsc36oS7HT8kt288uJ/1ytYoTXw5k2waPs62XBpTDKLAU3aJw6HNo0pJJ
   3GFqIGVewyWTZ+vUZJ0fA10Rd17vkvNJZOpRnmDoozWOsWZDfrLiUzBgG
   w==;
X-CSE-ConnectionGUID: gUwNGExvR661KCQuCq3aSA==
X-CSE-MsgGUID: dBMtrNGRSSKMRNmPMcVqQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2499539"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2499539"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:07:51 -0800
X-CSE-ConnectionGUID: ue46x1G8SzihLnuzjgLtLg==
X-CSE-MsgGUID: qZdM7SdyRrmTxNZpgY/NdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8308861"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:07:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:07:50 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 13:07:50 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:07:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UV1s4EiFI6go1dUP1uw8voRW+Uyry78cHCzmxNujICvvDNXkxay2YZfN4z07jSdcrFvTIsDFhpU1YLAjRpR3+GHOfTroHl6HXWqmm2E8WhIQmw2Rf4IwVLz6SvOfEko87wD4jz1x24ga3nHMvNMV7iWzLjHcZjeodrOt+WgnE5UdKIwSaLVcX6KA6FWmwq5vua9tAGhhjugVyl1+CRejJFBNw0HpF0bW97ukaL05EDCacO32x8KuqKWgDjNI7W4sgFg9Q2eI8h654XLZKwXIKf55TarrFpmC/syXG1PFREY9acuehStYDnSF/KwoX2oI6H+3CZWU8xsZ+FeHT2dY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4Fyp8X2ER7RY8Bo1w0SL8mNEUpfRgQDeUbMhEz6id4=;
 b=LHfrVOHkKyggcHX9K32EiMc4jeCaq8qpECaWKT6E0kzsimuiwAQnCUL51f9PTs92WhBN46XUruQSYpNxH5jI4kOQbly98N3mvt2YRj0VRnATdC+i713OcMSjoFr5MxA1wKRl5OwTZOtQ6+jq0qKCSpDBUzJHG3GhY+r1SUq672Nii4jEZboORTqWE2uaWGXV/wOqebcLIy1gtvrSMy1JJqqvkpxyny8/sH3kXB4DC4Jz9XMDVuQACRJuSgnVDnjm/l9fYEONLcEyNdcnOocy+EiJv3aSAsi7TBsisG0TDNxcEAaQXBEbiWrk+N6PNaZcqJq9lUgibdooAxtrXc6UmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SJ0PR11MB5086.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:07:47 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 21:07:47 +0000
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
	<nicolinc@nvidia.com>, "Gao, Chao" <chao.gao@intel.com>, "bp@alien8.de"
	<bp@alien8.de>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgA=
Date: Tue, 3 Nov 2026 21:07:47 +0000
Message-ID: <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SJ0PR11MB5086:EE_
x-ms-office365-filtering-correlation-id: def7bbf4-7ef8-4b2c-5990-08df39ee8330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|38070700021|56012099006|4143699003|261026121527099003|11063799006|261022105027099003|261028144727099003|261022075727099003|261026140227099003;
x-microsoft-antispam-message-info: hZMBfpaiEO3XwxbkneCV/ZBXS93lKieraXnI8G94i3XhLglUuExuFyBfU3VOf0RxuzZphtSoqdrHJXTsIrrJTgbsHHa/hKpTZhqla+Q6D4CQWHGy4x4wHBzZ6yJYoHlxlxCHSM77cHBQn9uFoRCRj04+5TbAULAVKiSGb5UrWzhLXB/WyQrNrPo6YdCL4xDBthDWL7LBW9fOU8m1TZvqKggIH3tMCapWE2KDFK7TpVb7NE81nkJ8nai0kbtfjfCKeqHfQCBv7ExDNfioDnoRG6U++RBbv4kHRPp8fPMFSbE15cReoEmzprRiG3tNTq5FDPmyRlG4EuIL0t6J5m1OwLJWrRCg3XaiR0ZLxHutbS552CK0PS56Qdle9V9Y0rB6vqRPX+sHKTh8Kv77DR8LSFsefODU6i66q8Yv7BfM5LDRyIQeK4mwX06JM4x10jzBeUNaAtAMrc6rIykE9xTlhNYqqen+SJEqrdwcdrJ+9B1JhAQBC8A1XCSh68D6JuXFKTdSmLRNe6zNwBOW84sbqrTkMVu6GQen/ki5gQZ8OU8nQgFzN/MZzIaxAwCqJAOXbR/Zk81McCMXXaGzq/Df9ztp3FCQ4YM3J4OPBRxVUhFlZPZsHhPtrrA22eS88x2vPFqSh6damdCSbPX/F/ThEpRYzw82/u2Ysd/206qXkUTHdNg+q/qFUB2x2VVM7CsdLIKp+uXyxlMVL4Sf1NVkS5saieCAK21zpf+/wqlMuqQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(38070700021)(56012099006)(4143699003)(261026121527099003)(11063799006)(261022105027099003)(261028144727099003)(261022075727099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3J1Ly9FK24vTFNHV2psQklVemYyQ3ltWFdmM1BtZXBibWZOYmxOS0xuTTh6?=
 =?utf-8?B?S3gvOXp0YkEzSmxHaWpQdUJUVXkyb3Z0c1UrS0xmcXVWZUlyd2kxZWFkaENM?=
 =?utf-8?B?c3YvZXlHVGtPbEhxWDM1YnBUc3kzMDhsbmZBVkEvTXdTK210NXJFVUhrQmVL?=
 =?utf-8?B?T1FaemdOeXd3MktMUERYeEV1Vy92ZnVFNEN3NzZMWDVndFdLUkllSi84eC9s?=
 =?utf-8?B?SXFKVG4zNVRoZ1IzZkZOTUhmQzR5ZjV1MmtnUzBpNkhsVVBMeXUzanpvelM5?=
 =?utf-8?B?R1FOcTN6aUhpRDhkVGMvay9seTFtWXpYRldYbDZDZmtpT1laaUtIK0dJbmw1?=
 =?utf-8?B?elZtMHkzbUQ0SWMyOTJxcHZyYW1oY0N4bGNnQW1Ybms5ZkF0MTFQb0t3b2Vy?=
 =?utf-8?B?aldQNHpNdVVuVVRVbysxUEdZREV0ZTRqenREcUZNVmdWQjBwYmQ1NTZtdzEz?=
 =?utf-8?B?cWFXbFlsMnYrWGVXSDlWNVVnZ1p4aStuUmxMTDhIaW5ZVnFaY1B2eVBraDdv?=
 =?utf-8?B?ay9MS3BGMDZ3dXJVZXNGb1VoUndRZWF1MjJWcUQ1blNlSUExZzB3Q3IyMlM4?=
 =?utf-8?B?c1BFNVVoNDJ2WENKdVVVNURPRlBDd3lmSWtENXV3cXJWWjZlcy9TUVAxRmo3?=
 =?utf-8?B?cVJDQUk1N2ZCMXVDS3pvb2dxcWtkR2RZSU5sNElTcHd0UUgxN2JFMnZwM3k2?=
 =?utf-8?B?VE1sOW5zbmtBclNlM3M4STAvYlp5ZHNMNXhsL1VyRHNQY0RFemZVSnl6VFhv?=
 =?utf-8?B?YXg5NDUrOFcxeEJYUzR1OU8xTWJSekJMbnhwY0xFb0pFK096RitJRnpLb2ZI?=
 =?utf-8?B?aXdiNzEvb0xzRHZiWjh5d2VYZXhHK25KUUN4VkY2US9lNU11SkkwaSt5ZUN3?=
 =?utf-8?B?ZDRnRzhSU3VtVEVhR3lqUXordHB5c1hLODNuSnZsRHNhQlY2UHdZbzJqaTJx?=
 =?utf-8?B?dmtNWEdwb3BXeWtvYk5TSnFmbDNWZm5ja0gwc0l5SnVJMHBGT0U5S2l5VDYw?=
 =?utf-8?B?TUJuN2MvMjNFSXB2cDF2bEMzVUFBZnpzejAzNWxPY2tURGFaMEhDWmsrM3ZJ?=
 =?utf-8?B?QlU0aFFVT1FMTDBhR0JiZk1EWEZSSjlFSzNKOGJUTGc2WkJyR1dSVlpvQ1Bm?=
 =?utf-8?B?YWVtMUVyOEJSRFpXbEZpUmJUNGRvcFU5bWdBUHp0N2k3eHc3RFZicGl5OFNJ?=
 =?utf-8?B?TExHVVlwajVBZDZQbVVHUXZzR1pBcWNobEdmcHRjcnFlWXVRdkkxTkdNMEIv?=
 =?utf-8?B?VkhTZm95QnloWkdmQ3FocExWSTRJMkdYcXA0UHk3YitOcDVHczhET2hadThX?=
 =?utf-8?B?N0hJbXI2amRhWGtnSCtadUlSRXUrWGwxN2JmVU1ldFJ1M0EzWW1wZUtQWDhY?=
 =?utf-8?B?TlN0Y2ZGbmtna0pFM0M4YzV3MGJLdmlhVGdTN0loY24yVGdtaEM1TWRYbkc2?=
 =?utf-8?B?TW1PMTFWb1VacDR3L3R1MWZ0NHlqSFNpSzFHSUVhcHNPZ3pDNWx0eFhNZENv?=
 =?utf-8?B?Sm9MTlBuSitzc2l6eUtNV0JROUVVcmFPY29MRVJqSFRwS3BLcElXNEFGVHZ1?=
 =?utf-8?B?WXhwYjhVRmdwMmJDMVZEcEhLQW14N21VTFdYdEpkUk1VdXM2OGVuQlZRZzIz?=
 =?utf-8?B?elBxb3J3UFpQM1FETEFyMGRjU0lHUWtiZWdaeHJod3k3N0NlWkFaN04xV0VN?=
 =?utf-8?B?UjFzcGJMc2dRNm9hWFpYUUQzOHk5VWFSVTZFQ2Q2NUdCemRDSVBnWWRZRUlr?=
 =?utf-8?B?bWViMzZwQ0EvUUx2cDJxaVhOdFEydVFEb0d2ZTd3aGtBaXZneWxEL3h0a1Vx?=
 =?utf-8?B?RXU1bTFYVldqYVlMUjdDRnlReVdiS1RBRmlWa2o3U1NHOE81aDlqVENhOEZr?=
 =?utf-8?B?UG0rZUpEWDIyYitpem42dGE2dVdxWFRnekVtTWdyVldwYXZISGZURVViYlY5?=
 =?utf-8?B?KzU5VmxFQzZJdGZWbVVDem1nbUZTQUtidDhTT0REdTEzTXhObVliWXlCRkRL?=
 =?utf-8?B?SjR1UTB2b0kvMTAybVBzZTUwNDBBd1pRS3JWYjQyVmxZU1ZTRkJzUkUwYUJP?=
 =?utf-8?B?MWczNTRzbEJudkF0aUVFb1E5bFZKN002bDd2WkVCaDhlQjByYmYySGM2c3lz?=
 =?utf-8?B?S09kL3FDZXhLZ1BycEtpcUFsWlVxaGd6bHcyeXVtaEl5dTg5TTU3ZFlsemJJ?=
 =?utf-8?B?b3hBai9yZm9VRzJoMEFPN0ZNS1liMnBqd25LaWR1dUl2RjFKWUxSd0JFUWxx?=
 =?utf-8?B?dDBxRlpBazRVeTUyVUpmUGtqT1lleDdDSUxBZDJkWlpUMndzSXUzYXlvcTgx?=
 =?utf-8?B?UisvcWkvb1F6czJCRS9qL0h0ZDBnRU01NkN4eHhSK29ZaGVJcU1XK0pSMzh6?=
 =?utf-8?Q?fWx56OdvHn9MmnyU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A725EB25D4F944CB9DEB2E06B3EA5FD@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: XbS+Fgk3evZUKQdNt6ZT75g9cJG7OeYVkTHKw6Bh+43vp/qsU4tXMcdTcZ510blhGzJ6CgGpg9MOiqUotcRxPzNi3nw/OtBqDlpL78l9GoTGKqJtrKUNltVBrVGoiLds7EwHtOtWofZep07LkruTGeOSEVPUoEWLH8PKHiramuINrnSn3RdFwwCA5Mpa7vYFp1cSbR3cB7UJ/NaqGlqhVjISyUE9LqPUb0NFdXPE/1X88U4oOYooFzAti9vpKgIwhiBx/RxLhqAQatxHr3dmkxV+oquoPVif23QXVqsZ21w4Po8sDZhRXB1iGmnVafRLPvSouupe8VXZbwmB8yXpHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def7bbf4-7ef8-4b2c-5990-08df39ee8330
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 21:07:47.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BpbxqblqnUmvXSqO5mSIBlCsJLJdA93N7ePtzzo6Hm2fzALIQNcLW0h2QouDoc6VClRKuiCqLbxzSsAq/XTAyqPZCuDfqRegGMAtDMXxW7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTAzIGF0IDA4OjQ5ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogRWRnZWNvbWJl
LCBSaWNrIFAgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPg0KPiA+IE9uIFRodSwgMjAyNi0x
MC0yOSBhdCAwMzoyNiArMDAwMCwgRHVhbiwgWmhlbnpob25nIHdyb3RlOg0KPiA+ID4gSSB3YW50
IHRvIGRpc2N1c3MgdGhpcyBmdXJ0aGVyLg0KPiA+ID4gDQo+ID4gPiBJZiB0aGUgVFNNIGRyaXZl
ciBzdWNjZXNzZnVsbHkgbG9ja3MgYSBkZXZpY2UgYnV0IGxhdGVyIGZhaWxzIHRvIHVubG9jaw0K
PiA+IGl0LA0KPiA+IA0KPiA+IENhbiB5b3UgZXhwbGFpbiBzb21lIGNvbmNyZXRlIHNjZW5hcmlv
cyB3aGVyZSB0aGlzIHdvdWxkIGhhcHBlbj8gV2UgY2FuDQo+ID4gdGhpbmsNCj4gPiBhYm91dCB3
aGV0aGVyIGl0IGlzIHJlcXVpcmVkIGZvciBhbiBpbml0aWFsIG1pbmltYWwgc2V0IHRoYXQgZG9l
cyBzb21ldGhpbmcNCj4gPiB1c2VmdWwuDQo+IA0KPiBJIGNhbiB0aGluayBvZiBzb21lIHJhcmUg
Y2FzZXM6IHRoZSBURENNIGh5cGVyY2FsbCBtYXkgcmV0dXJuIGFuIGVycm9yKGUuZy4sIGEgbWVz
c2luZyBWTU0gb3IgVERJIGRldmljZSBmaXJtd2FyZSksDQo+IA0KDQpJJ20gbm90IGNsZWFyIHdo
b3NlIGZhdWx0IHRoaXMgaXMuDQoNCj4gIG9yIFREQ00gaHlwZXJjYWxsIHBvbGxpbmcgdGltZW91
dChlLmcuLCBoZWF2eSBsb2FkIGluIGhvc3QpLg0KDQpIZWF2eSBsb2FkIGluIHRoZSBob3N0IGxl
YWRzIHRvIGJyb2tlbiBmbGFnIGJlaW5nIHNldD8gVGhpcyBpcyBwcmV0dHkgc2ltaWxhciB0bw0K
dGhlIGlzc3VlcyBhcm91bmQgdGhlIEJVU1kgZXJyb3JzLiBZb3UgcmVhbGx5IG5lZWQgdG8gdGhp
bmsgdGhyb3VnaCBob3cgdGhpcyBpcw0KYWxsIGdvaW5nIHRvIHdvcmsuIA0K
