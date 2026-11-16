Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873556;
	b=NVFA2mxbfGtLwcIguyDDfO1Zs5wdGo3ih7oIObUsbpfU17q6eJeJIgtw0i1xfo8ZhhO4
	 /TM/v2zzChiWBxsCDkaCSpyChWSMxGtmzrR4vRxh+by2yH2dk/HUcKUHPT/Cruqpgain6
	 VUeV1ayjQcaBTatdX3ccG4vHFB6O/niL9Xioassk92FHQ2eO1I6rieW+ePT9iImseO6HI
	 ++O27kisw41/ofXytIFM+gRcfwrVhjNZXVxE7AYwq203NIT2XCKs6GGbadPGw26RH679h
	 IrfPGOmb/4D8d3WE0u8VBIMKcZuen3pijGSWvWkJ6rqetVsCPLhkv3GNBM+T8fUIpxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873556;
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
	bh=goIEaVT1Re4A9+nwYJzHwxNOZVW0d04B5hCyVLpq9oM=;
	b=bfpW82ca0NdYM8f6YZIWRi/QiF0C/U1UM4Deqxwnnrko1Hr8bPC20lDn7Ygpqohs23UG
	 1lu7oJpaHxnuffAQsqFQl53w9geY6RtW6qk+7cE/OdrQQfQ+I35k1Y1JRKFkxixwWFVoV
	 qZPXyDtjrUn68YgyRuaGExShBLJhpa+wdJtq1ZFgTkXzo+O+EgqbQmH5XVeMoDkxteTni
	 RtjkBn18bUB1a3StF2ZQojA7oSvydMiaKqT7cAUxhiDQKLykGwU2phDAa5Ep2Q4shUkwO
	 lOUcFTPa9dBBbky5GcUEB+l56KFUho1J+OPRqLkoB2b8WzT1Xjo/CLo3DvnHJTgstsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HDUo4v8p;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lF4xBIeO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D619606A323
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 23:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D619606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HDUo4v8p;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=lF4xBIeO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794873556; x=1826409556;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=goIEaVT1Re4A9+nwYJzHwxNOZVW0d04B5hCyVLpq9oM=;
  b=HDUo4v8p3ohtLc0IFA3ua1zTuRk06O07JmJkHYR56PRawBJ04pngRHDX
   lOFsu6tze8gf6Kv/dLtk7sDEm4jK55tLeEvzzQVI6/pOW4thHF8fY9jY6
   j3s0HiWdDNIazAx+986Em+ckMguh8KtJ5Tfbb5+DZajMu5UeMhzRB0GgG
   boL0SV4ATaUeqfvKUGGwk51NL0JZl6xCNbVBWfoIGUFKbU9MG61gwsVSk
   PKgs39508azKny/IA2M9f1WtOds6+q9e15DO5w/O9VJuqy0H5IA9vYnyx
   I6XVW1iFq9ihz0WKiyKseLefUwOuBcGOzqhG5Y2POV9HCKMAPLs79UQ+6
   A==;
X-CSE-ConnectionGUID: 7rveTr8URFCi8jHMx6gEOw==
X-CSE-MsgGUID: CtrJy62WRKKhAOx3rj0auQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3662734"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3662734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:59:12 -0800
X-CSE-ConnectionGUID: +vIVMgnGSke0pPjBgyJ06g==
X-CSE-MsgGUID: kcD7H7H+QzeU08u9dvxETA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9748527"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:59:12 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:59:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 15:59:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 15:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lr7afHhBbJ5ZB59lR8eFq8V8zpnHc1D9rz1VS8Wy86izqw9xAwVlk+JegD6Htp3C7Jit62vTaVm4/wVgnFBu57NFVYyMgW7t9+sMCaCpkJbcr+55na2QC1EvuzhAOFyMwsq3lgO1/PtVLlv7hewdZp8dHnEvq0h+T4dnQhycnfZnEq5EDIfaKUEwrRabd5fHUcqtfJSIBJ9n99PW09ZDt0ZP47mMQ5xz/MIuTqUKCwwv/JqfWeHMPn2HbSh2+Cm0XwYAuCrXxWwdzBk7xaJvtpAf3msqdFFe6LGyuo+DGiRVBP3O7aMRtwHj2Pn8Y4vL3GA90eHzDp3z/QQnHuaXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goIEaVT1Re4A9+nwYJzHwxNOZVW0d04B5hCyVLpq9oM=;
 b=stLPgK5gHXyhNms/Qd7W8pusOVYK/AjBbdv4bpWIBkzb/g98GBCQWBESZfpFog2w6XL2mknnvElgaEaaahE0S97EvJuLmiCG8StEs6VdSKmpVmSnJzC+pNnhGpmc2rsp9lWBxrgtZ2LKhS6XFoRIa/gEuQLzuZeY7bjjWnlBBAkEI0Gv/qbzJ7IQ9sYVQB77fnONHUBCV3gJPAYeH8G25TN47jOtNrIDSUSIbPdPLVmyPHgRNSAiEC5qcq8JtiPxcpSF+YhsEsxwh2J8P0EAT+JFtK9YU4CtXYwDIvMvRAg6SF3xr/dxKCP+5GepnKfIsnmdYEGpJDJBdTd6qy9NXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goIEaVT1Re4A9+nwYJzHwxNOZVW0d04B5hCyVLpq9oM=;
 b=lF4xBIeOFMDRS5Zzeudma1o1UKv4F6c/uRVul+nCT6xpZ3A2+HwmhnIllT+umSTUUhrh9tbTFK6Jnl91ovPIam60JWz5UXZlDZ+kL1OnP2o5LWeDUTg0eKeZTjgTDfvWOtNFqWgemD9jQ/vMMSrPVwI+1anPLMMoWCzvv63ROL8=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SA1PR11MB6616.namprd11.prod.outlook.com
 (2603:10b6:806:257::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Mon, 16 Nov
 2026 23:57:23 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 23:57:23 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>, "jgg@nvidia.com"
	<jgg@nvidia.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "Peng, Chao P" <chao.p.peng@intel.com>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"aik@amd.com" <aik@amd.com>, "Gao, Chao" <chao.gao@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCACkAugIAAmzsAgAARWICAACktgIAAHwIAgACe3QCAAcf+gIAHAeeA
Date: Mon, 16 Nov 2026 23:57:23 +0000
Message-ID: <49b19bcfa1b0658cc0aa5cd280acb439bbba8287.camel@intel.com>
References: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
	 <20261110195745.GG738765@nvidia.com>
	 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
	 <20261111001606.GH738765@nvidia.com>
	 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
	 <avW3jZYB5/L4WaGL@yilunxu-OptiPlex-7050>
In-Reply-To: <avW3jZYB5/L4WaGL@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SA1PR11MB6616:EE_
x-ms-office365-filtering-correlation-id: 1fd3fc73-9a76-4eaf-93e4-08df443d5bff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|11063799006|38070700021|10067099003|261022075727099003|56012099006|261026121527099003|4143699003|261021121427099003|261102123227099003|261021135927099003|22082099003|18002099003;
x-microsoft-antispam-message-info: isfOl9DgLYQTxXo5zEm3HY4FLpnJQv1oifWDL7aaT81wEaYUT9KxzOOXVEOek99mq2rMuxBtgMUPlaVVThq3smBN7t6LTVd2H5/oay/eQ7lkqV7fBHFpBc1mDFscT+LK9sN6lnijSKkoGdYiSKjS5AYHN/Ok6Hj9mNajwRx1RyJX1AgxVbtkJY0S5VUpwenai4yF6i6m7q6D+qrmJ+YSADWVhPmtGoEbRLACpYQfCUI6krT41VJBDWyXZFGEmUUTXiMmkpgWiZWu1Sy4sJT7LVEXubRk/Xmebter6l1Bx1lWzPbuB8FIb7Kg0AjQH5jrZ+p+47MOc5+aNAESoYdynPPp4n7FFBYOPR30ezugUxPgyTGCEvHdI7bMIeKVvQtBgkWEWP6O4p3/BxFXDdQE/Zwazjedmfj6CWDkeDvcIPngyvSrHGGVaG2Vhi8uCMYxuXCpTfPbo5TH5LtRTgHjIfPaJYppNu5tjnzVRX0y8CupP948lqxJhS2zNv5WzcwX1jVFYTPecjFFcHgl8M/1gvVpWyoow2jpY5V1qEos+EOlvm66PI0bnmOJ/3XAEAntUkuLpyOoESnr0KAeio8505IXy0Ox9SmcCkENf0dQgJGlwyClLpbyG/SHcvQn7tjOw3MG0Hxo+Np3W56pcWEBcaWV/PxR9fO68jjTesh7c7q0dlKy5Q3Ion1U+8+p22YjJzIq4KghzTpgYXLZFl+bbg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(11063799006)(38070700021)(10067099003)(261022075727099003)(56012099006)(261026121527099003)(4143699003)(261021121427099003)(261102123227099003)(261021135927099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1dUbE03SGIvMzRvN0JqTDRIMnJkUWR3bjJWdHVHLzNWekJGWWRNblIwZlF6?=
 =?utf-8?B?OU9jc2F3eXl0ZmRtWktvVnBxand3SFNIRS82ZStsbkRaaVNMOFJKeW0walBl?=
 =?utf-8?B?a0RPZU9hK2hRL3BQUmVLc01YM0pteXNuRCs5QnpwYlBJTi9Eb0xSek5BMTRD?=
 =?utf-8?B?dlpETjZmMStFdjFWVjAwOUt2eHZuWnlNY3NIczU0MWNIZ0pLTzZoRUw0MG5w?=
 =?utf-8?B?S2xmV1JzaXlhU2c4YXVnWGVHSnB5KzZNbS9paFk5WGVNcSszTWRBaklTS1NG?=
 =?utf-8?B?R3dsTHRLbkN1VGZlS0FyKzVwckJrYllWRzFPRkJBVmlRQzRVdmsyOU9EK0JJ?=
 =?utf-8?B?dW1JbW0wcFVOOERNWG9RcjJwR3IyUjhSQzhVVHVjY09WVDVLZHRTU09XeHhT?=
 =?utf-8?B?Z01BcWt6V296WEM5OURQUW5VTGFFY2p4ZmxhaGdMY0FwQnNWejRDT1YwMkNQ?=
 =?utf-8?B?QVZoNUhJRDB1ekM3UVBBZ0kzYWFYelBFbG81anlBdm5zZTVrU2lIL0NJVTFD?=
 =?utf-8?B?SVFKUTdvSEFkZ0VabkpWM3ZjMEsvRXlYa3BzSERxVFMybEdDelBGQndHdTlR?=
 =?utf-8?B?NzFYTGJiRkZOaVlnVExWak9mRkRDL1pMZ21hL0FuMEtQa0s5eElMNFppOU5l?=
 =?utf-8?B?TDVBTksrb3VjQUJ4R3hDMHVYdkpGaWtXQ1JYTDRTdUxTSzJvMWpLd0pUaDJq?=
 =?utf-8?B?a0hQN2ROall4WWFRTml4aEpxZDZaOEF6RGU5NDhEWG85TjM4Q0NVWHBLakZa?=
 =?utf-8?B?TFcraWo3TW8wUlJpSHUrNmk0M1I5SWorVkJpYXRmR2ZKOTBKRkdVQUNpYzRh?=
 =?utf-8?B?ZnA1NzJCeFFSaUkweExDQTQ2SDBsRk5mNHRJQUZBek1hSDJmdm9ha1pUZEZV?=
 =?utf-8?B?d1VjTmJFTlpHdzdONXo3YVJvclNwMUExQXovL2hJNzhkM056UXF4YnpNcXJC?=
 =?utf-8?B?c3lwaDg0K0FTT1RSb1RYTzR3eHlia0t5WDYyWUlwNHUyMlFFemhQelFMZlpB?=
 =?utf-8?B?eDVzSFBxY3MrZ3lOdkQ0a3J6VXBvajBUN0RBUWJiMTcwQkh2c1ZkcFB4aWtp?=
 =?utf-8?B?SEYvQnRyMnVtUzJkdG10N0Z0V3FXcXk4TTBrTkJXVDVQR1QwVmNGdjVMMGtH?=
 =?utf-8?B?ZjZNRll5M2NYWUNjY21wZ1Q2MGs1eEZUZWNUU3dzL2x5djR5QnBERTBGOUdS?=
 =?utf-8?B?NkI1VWV1S3VZU3VBbHNIY2FZMVoyVlY3SXJDQUxnN3BMYTdPdmNEcnBhakRs?=
 =?utf-8?B?b28yeVI0OGVNV0F4blcxblpBZmZxcHNhOGkzamREZUpFQ29aZHo3N0lOaVJn?=
 =?utf-8?B?R000dk5ENTV6TTZRVm10R09vUjJEUHNIdDU1dUZZV2lYQXJuYkVWMU5vM1Ir?=
 =?utf-8?B?R0E4Y00vYWF4NVJCZFhtWnBka0g1QTUvcEVZNU1NTTcxT2VueU5DQWlUeFl1?=
 =?utf-8?B?VmpFYklaektSY3RJU0ZZajJudE4xbTh5MDVtS3UzYXRXTlBXRlZaM1pyTTMr?=
 =?utf-8?B?WllkN0thT3BJVWh6MzZMVFV6bUt6c1JJUFpqeU1wRjRFR0RjK2ZxdmJzcEdP?=
 =?utf-8?B?ZVNYUVFmSlpKdlFSVUFzRUEwQzNQWFZjbzFiaWZIenFnUWVjcndoZ2JKQWd2?=
 =?utf-8?B?ZjVXd3BhVUtxMEV1V2pZLy9jeUNiNzB3LzlRd0RubHdVWktWYjdNcEJhZTdy?=
 =?utf-8?B?TFQvcVdmMnI2ZGlwTWl1bkV4anBBamZEdmRnSklLWXIyQlFwUEtGYlFud1d2?=
 =?utf-8?B?eFpodk51K3l5Y0NSS0htazMvSjhxcjFSRXJPdGsyQlFJak5Qd2VXYzkxWDJD?=
 =?utf-8?B?YW41Q01BTmRHeGpoT1E2aFhMaTdpekZ1S3cxUkl5UlRRZXAxeG9NU3ZVdVRq?=
 =?utf-8?B?cUlwNHRDSnFoZHMzWjdvTlRlV0pnWTZ3N2hNSFVuL3lrSVJzZzNRQkdXVDdI?=
 =?utf-8?B?MHZva1dZWEtrN0E3aFExNVhDbFdwOEZCVGVvaGpMVUFIM1BLNnlxK3ZxU21s?=
 =?utf-8?B?bkh6Wktqdk9vTEVmN1E4VUp5SFo2MTA2OTNLSmIyYkl5NTNPYm5BNE5tcUdL?=
 =?utf-8?B?TW1vVEJWWjdGSTlhdzk2Q3dvM0VkeUhNdzFtbjRyWktBRmJaVms1WGZqMmJU?=
 =?utf-8?B?NTR6Y05pK0lkZE1hcU8vRXNDS1N0T3p3TUM2RWFSdVdrMlRkRWVaMjNBZ0pW?=
 =?utf-8?B?N0xhMjVLeTlvbVdBalhVSE5JV2tCV3l2RmljNnQweVE4S0lXblh3Szd4N04y?=
 =?utf-8?B?ZGRoQnVHNU9wODVWeGpzNmJPOFZWejNiSTZhME80RzJpcUZXRHVjc3dMdkNh?=
 =?utf-8?B?aFVJeHlDRkF3ZTlHb3Fmcy90eW9jemI5REpCcHdsdXRXNEpxVFBka296QzRo?=
 =?utf-8?Q?9HShhmiFxyxHPqQg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBD3253D65876543885150BD389EEF11@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: jxDKtwLtg1ehv8ZvFRjp9XyXKBU4kNHpVEXCsejx/MVEQqya8KP6eOP4rPWsjqu3lzKwO6JAxBPA5eFTZeKFtmVaK5/mlhOJvxRN9dboOT6uyAkkU8zT1qRUVrWz3KAc+mM/eYA3Yndt0jR9Ba00NOsNy00/mYmMf8UzbZ3b106R9u1QWIAAsmPsibnRw9NADveAhVIYkeuL8L1dDOiwtC7LQCoOIbX+M6uTNcZTkuRtAjxANrlbAy8nTeOIPKuL8HBIsWbpFt+OsRf/v/27wx5MZUUYWVmUG2stJgFxKSPfPs/HfGyjwg6ix0BxwBUYl9mSWM+KdBl1mKbK6Nu53Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd3fc73-9a76-4eaf-93e4-08df443d5bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 23:57:23.7000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTu9ww8FUgnsl16OsycsR7VYa9gtbDn8e4MZeSFctGID29e8f+bjFWYA3dnzEYWx+f7Th+jOdQZE74qeD7U5micz+SL3Gdi7aZ0AQMSR5zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTEyIGF0IDIwOjU2ICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gPiA+
ID4gDQo+ID4gPiA+IEZvciBlcnJvcnMgdGhhdCBpbmRpY2F0ZSB1bmNvb3BlcmF0aXZlIG9yIGJ1
Z2d5IGhvc3QsIHdlIGVsc2V3aGVyZSB3YXJuDQo+ID4gPiA+IGluDQo+ID4gPiB0aGUNCj4gPiA+
ID4gVERYIHdyYXBwZXJzLiBCdXQgaW4gY29jbywgbm90IGhhbmRsaW5nIGFuIGVycm9yIGluIHRo
ZSBjYWxsZXIgY2FuIGJlIGFuDQo+ID4gPiBhdmVudWUNCj4gPiA+ID4gdG8gYXR0YWNrIHRoZSBn
dWVzdC4gU28gSSBndWVzcyB3ZSB3b3VsZCBjb21tb25seSBuZWVkIHRvIGhhbmRsZSB0aGVzZQ0K
PiANCj4gVGhlIHNlY3VyZSBmaXJtd2FyZSBzaG91bGQgZ3VhcmFudGVlIHRoZSBhdHRhY2sgY2Fu
J3QgaW1wYWN0IFRTTQ0KPiBzZWN1cml0eS4NCg0KV2UgaGFkIHNvbWUgaXNzdWVzIGluIGNvcmUg
VERYIGd1ZXN0IHdoZXJlIGlmIHRoZSBWTU0gbGllZCB0byB0aGUgZ3Vlc3QgaXQgY291bGQNCmNh
dXNlIHNoYXJlZCBwYWdlcyB0byBiZSByZXR1cm5lZCBwYWdlIGFsbG9jYXRvci4gRHVlIHRvIGFu
IGVycm9yIG5vdCBnZXR0aW5nDQpoYW5kbGVkIHByb3Blcmx5IGluIG1hbnkgY2FsbGVycy4gVGhp
cyBsZWQgdG8gYSBkZWJhdGUgYWJvdXQgd2hldGhlciB3ZSBzaG91bGQNCmV2ZW4gaGFuZGxlIHRo
ZSBlcnJvciwgb3IganVzdCBwYW5pYyB0aGUgZ3Vlc3QgaWYgd2Ugc2VlIHdlaXJkIHJlc3BvbnNl
cyBmcm9tDQp0aGUgVk1NLiBVbHRpbWF0ZWx5IHdlIHNldHRsZWQgb24gYSB3YXJuLCBkdWUgdG8g
dGhlIGZhY2UgdGhhdCBwYW5pY19vbl93YXJuDQpzaG91bGQgYmUgc2V0LiBGb3IgeDg2IGNvZGUg
YXQgbGVhc3QsIHdlIHNob3VsZCBiZSBjb25zaXN0ZW50Lg0KDQpTbyBpdCB3YXMgbW9yZSBhYm91
dCBleHBvc3VyZSB0byBidWdzIHRoZW4gaGlnaGVyIGxldmVsIGlzc3Vlcy4NCg0KPiAgRm9yIERE
T1MgYXR0YWNrLCB0aGUgZ3Vlc3QgY291bGQgYWx3YXlzIG1vdmUgdGhlIGRldmljZSB0bw0KPiB1
bnRydXN0ZWQgbW9kZS4NCg0KRERPUyBhdHRhY2s/DQo=
