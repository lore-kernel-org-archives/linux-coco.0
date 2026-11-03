Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793666941;
	b=HmKKVL2dK2gtzYjcP0eSufkXgFQI9gL5qAWs1Kj25VpjULEAXrShmYcgjWeelceYnhZp
	 myW1Gw/NZurxwx5S5IoVth4pG6YPylcDHRIowO6l+aEQQ5x8jgMyu+zH6RTCmoExf1qLe
	 tjyv9D3sFOjZVA0Qb3iSdi3L1hZJbUeiNhepZlJzYNxkJLmCowlvEkKy2E+TpvKKTHBS9
	 eFY33FpuOBqgQ+J//R+C+yT8M3DOflMM1byxf+0qzVAyh4eTLlgFZp31u5tsd4zz9IFxh
	 4bWxRkDI/pa65Xi7HDOnDLVBon/hNEP1/acpDOt50GHyQdlgs3T1Brt+j1Qszm5a60w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666941;
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
	bh=Fqj3qYZ3Q/yhfEXn0paEACTeGqi8SuVJyAvxAuilG9Q=;
	b=mJzfy8mEBSjFfXUXleM+gqOXb0jZnc+bSq5H9t6UlcVNSCIUGKJeQrPSzlgMN4Q8J37i
	 k22YZyepUx9FC1QadWVPONlp+Q5pjObNwALqkMjpZaI4Mcv4FqqrzTdLZiYHOwH8Kv0T+
	 sw9N+6LN6BxkSo27swF3CXpOAyNolfx5IulCRKyqm+tlpct9xygSA/SX9ZHxZ2fnwf3aj
	 +Y8V1m+5UBMZT14Fk29RCo9U4HZEQnpZmDRfibv6WXU8UOZt5DUu+b49UN1ssbf4VzeYg
	 xBVrDDKMln0xAJHhu1GQNvPvt/fnArFDgyw8cPO7yZPHwxxpbaaXYJzVP3KMBZTcx4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TA5Pb7Ty;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347BC606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 00:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 347BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TA5Pb7Ty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793666940; x=1825202940;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Fqj3qYZ3Q/yhfEXn0paEACTeGqi8SuVJyAvxAuilG9Q=;
  b=TA5Pb7TyQRpF3A8ZF2CpsFr3TgRgQDCHkG4UC2fGs/ap7GAwKCQW75KW
   Dk5LN5tC1naBMpE2EV84TPE8AzNLFsDAg2RebMejkHmQcY8UPPf+vy4wS
   tI8ZGiebBELF64nlAEXDWYPmWpvgw/Qt8jWkjE5zuJ4AFbex8+ucsq+V5
   tfyPErj297n6XRGN3ieiNGZEsG9rxUjTOayXGAPo06VX6EmDOZqNGf5GE
   uf2M+nhrQgsBy8TB7nrLfmIb/gBuE1DuayFiiCM9k12i+Fj3H88mJHEbd
   szmABhDz5NBp6SDNHUp+E2dyUeGUcJeic1IH2bYsWO00h/SNMY8IPi0Is
   A==;
X-CSE-ConnectionGUID: VJcxqGAQTaqABYOnwPXQcg==
X-CSE-MsgGUID: 9/F2tuB+S/SflfeY41gw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2467585"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2467585"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 16:48:59 -0800
X-CSE-ConnectionGUID: dMx/6+gDTZmMN+Pi74Dm9A==
X-CSE-MsgGUID: gUIkAvGLQ9WlqSpK7XslFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6123040"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 16:48:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 16:48:58 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 16:48:58 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 16:48:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5oVC9llb4UGXBrfToTl0Sf3d4tQ1n2AXf8LjRxZ5nJu5wiadsT+fq1FLrOQwxBtvis9953O2St3UcZmKA4tQCFbK81Gaui+SVLziqbmJmfowYn5smg6kZqLiwoe8h/FrRnTvHO7bXiC12UpTmb/Zh138ECpwraqqMSF+NhBAmzKHg/MPajx29labM1pSsj7hwstGnP70zfTXdbLmvzyIATv6uAXIJ2MxU0oLeseDsehHAJe0KcceNTNjxwnKKWsy4YSHVQpCKs/BdxWh5DDYB1ET+0jPo2Hg1qodhp0jU+Q/fu1LlTapiawXr1E3NzJB90HzzKzscVbjBHfFWLu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fqj3qYZ3Q/yhfEXn0paEACTeGqi8SuVJyAvxAuilG9Q=;
 b=pCkWUu4G44wGxmsWC2+oRvDT1yK0Oz54t+uIyI0vjiMJqtEHjQFD7fMq9t2FHj18aWTJBUXZtosPOQu1f70JEgzc+IRQiOaRz0roBRe7N9e3jhw7ysOWIRRZs21xBQwFf+gqaO2cURusbJul/L8yjTIzzGJ8cNUgTVAu545TZULGnaWyNgnnmP8qbh7GqOAFZHfTDEMd+HFGwxOa91XMWChcLKnYYwY2bq6pJtq1C1HJEEETVKBfwPadgUK19+KHHumQqNzRUWfce5CIGfY2YEIIEPTUIMzDBa1wl0XtBAH1eCrNQo4/879mzNBgS7DtQzHn5BzDsIsi/y3Q2zI17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS6PR11MB281697.namprd11.prod.outlook.com (2603:10b6:8:529::12)
 by SABPR11MB9963.namprd11.prod.outlook.com (2603:10b6:806:509::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Tue, 3 Nov
 2026 00:48:51 +0000
Received: from DS6PR11MB281697.namprd11.prod.outlook.com
 ([fe80::e581:a963:8374:69ba]) by DS6PR11MB281697.namprd11.prod.outlook.com
 ([fe80::e581:a963:8374:69ba%4]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:48:51 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "jgg@nvidia.com" <jgg@nvidia.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Duan, Zhenzhong"
	<zhenzhong.duan@intel.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Topic: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Index: AQHdS9rNF++PSNGXuUGGFGwkpIea87cPd0SAgAMIjoCACQgFgIAANxuAgAADhwA=
Date: Tue, 3 Nov 2026 00:48:51 +0000
Message-ID: <1a956c4714be8a9488dbc5806efbb89e47beb6ee.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
	 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
	 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
	 <20261103003613.GD274202@nvidia.com>
In-Reply-To: <20261103003613.GD274202@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS6PR11MB281697:EE_|SABPR11MB9963:EE_
x-ms-office365-filtering-correlation-id: 686cf749-812a-423c-97c8-08df39443a94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|38070700021|4143699003|11063799006|261026140227099003|261028144727099003|10067099003|56012099006|261022105027099003|261022075727099003|261026121527099003|22082099003|18002099003;
x-microsoft-antispam-message-info: yCRao52RkWvswbbckscQ9K/sBjqB1KybR43huVS1DbEEzQq4ZTUHIUoKymujjEXoEDqgWgproinTDYa+mpmPV1DiT0o3pQY125t6amgFriGfkbkCoFfnHkPCvHLt0vXBHL4g5CDtrU6YDabGYURSuN9uajB71PvfY1sTKuWU9JF4qvk6TamULLRhNhZjibXjj0ovZKcOYil6dmrQEAm3IovyBu2DHUeYvutY1C47eSNStwV0HoHTyiV8dnUsJsYowPug3I2uhb5XzhAkywJWK/TFZdMlKudpkLOckcdMBWHSOLnTuw2+K5OTo0FsZcujbWOtiK9X7W4KSI1NFoPk2CNvMIwv8pFDlAP9/gg6SkzYpY2+KKqJn0kXbNx13iuuEDjWazzyn5S1UN9NiUwehV/InmTVb3pQgkuc3Y7rkZp1nJWebMbOOiVy9NZHyiABFLTLV34IUt1RmpDvmy+7QeciqE/3g64SBL6g/jnMrulTAu3h4aNRODfQL45R22y9RWDxXlg49K5jpgZcgUa354g5vYIfecyesDzUZM0YihSVmH72YaXiWDWvZb9n9BYuajvv+Wj9uuE6UbSwlZEsfbBnaPw2ktHpuPJu8h+W6xWfKZWVx6tgZpHOGhenEx6Cvjl0vThSuzZcL459V/o7s8Q8Hi770q1/G6KZ6GGQ6CXSesMs8yjqzGRDDryilaT58Gn0c+hWPj72SaIfcyClRnLDZdHjuhbRDlcDmIE/RHQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB281697.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(38070700021)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVVUck1GWndUdHljbzlvK3V3K0hwdm5IVzF4cDJLZEVrZ0pYRXJqYm1ySDhp?=
 =?utf-8?B?Y0xCelU4UFk2Q05ZUkxORjRyQldUNVV6c3lUWEF6SlJVTFpidmNQSUxFcFJt?=
 =?utf-8?B?OUpUbVQ5VTdjV3QzKzJZOUdBQzZoM01OeS9ja3pUTXFLaUw3eCtOZWVxVllO?=
 =?utf-8?B?Um1sc1hwVWoxZ0hMUVU2dlBNdGhndTduOTdHQ2dVKzFKU09JOFlnOEtVMksx?=
 =?utf-8?B?amQ1VHd0UkwyUFlYNFRhVnB6eWxtR0puVjZiK2Mxb05IMVpyRWFNVkJUbUl4?=
 =?utf-8?B?OENKd1VFd3diZVBlOWNjQnpZR3p2RmJQN3ZLMTB5eFNOOG5EdHYvYWFtRy85?=
 =?utf-8?B?RGJ4Z3BWdmVlTWUzVFBRdE16aUlQbWZrckRRcVV2eXNJMG9pejNrd2VJZ2lt?=
 =?utf-8?B?T0pGcGpnRmg5YXZxTDhBYU9MVFJWcnpsNzNjdTErTGxkOFMvWWRuWDVlMEg5?=
 =?utf-8?B?RDFSdHdMait0QzRWYWVNeXZPQ0Nkd1RxUDFkQmRVZHVSVGVkaXl4L3htTnlV?=
 =?utf-8?B?VEVrQ0hxZlZXamZzNnRZYk13VXNoa1FKOE8yQ3BDM2ladXdwQ0NVVHcyV1Qw?=
 =?utf-8?B?ZWw4U0R6WUVSVDNPTzdvVkVHdHBlUDdLeXIvcnhqbisvQm5CZis1emRpQ2hx?=
 =?utf-8?B?ZC91Um5rZzIyOEd6NVV6OW0zOHY0Ync3S2YzcnAycjBWT0J0c24ycVNlVXdQ?=
 =?utf-8?B?ZzFZcHFwZlVQZXdKazA1VVJ2dEhtTDk4VzdxOHIzODZaTFp4L1l0Tk1hdW1F?=
 =?utf-8?B?S2lCTlB4QzkrTGFqQU5BN2VsdUExQUNWckxacGtRZ3ZtQnhLR0NnWElvNW1x?=
 =?utf-8?B?TXVDalgxL3JoNi90UmtTLzdtRXVFdk1zNW9rVERsZ1EvdWpyV3dCMFcyaHBU?=
 =?utf-8?B?Y3Fxc2oxbzAwZm9WQVMzaCtpQjJEd0g4Wkwrc2tUeWhNK2VsalR0dm5HQjMw?=
 =?utf-8?B?cHZaRlVDNHRoMGR1Njl0blE4STBORzZRcUg2TTMyUHhmc1BmckRpbGRUY3hk?=
 =?utf-8?B?a0FiajNMSlFnNXEyOFduVWc0c09IWWVjMjBVOEQyVStUMUJGNjhBMncrdU5I?=
 =?utf-8?B?cHB5ZzVvZ0NJRGZGNitiRDV2WG1TNHU0dnFUYWhLWTZwdUtaTURjK2xUWTRo?=
 =?utf-8?B?cjJjZjNmRVE5VmVleEZ1YWR4L1hWNnc1aW14ZXhoblRSRkxmQjZQekc2dUxj?=
 =?utf-8?B?MFh1MTlUTWR4T1EyaGtBc3g4WnpYMi9vQkZaM1huYllodXRuTEFHL0NCVGs0?=
 =?utf-8?B?cmkwS3BKYXdVMU5yc2VBa3B1RkJaNmEwK2xHejkyM2FHK1NHRFN6djNiME9B?=
 =?utf-8?B?Mk5pajI0eE9ITTNuV0d4UEozVStHOHcxWlJqRFhDMlZMQklJT21ZdUFIY0k5?=
 =?utf-8?B?ZmxGdFNjWXBqMVhDRlNZWTd3b01HRC9ydHR3SE8vcGF0M0I0bUlRSkFXVFNE?=
 =?utf-8?B?RHd3UEY4d0lOTHpjTW4vbXVBRTlqMVBiU3FSdGZ3MzcxbytWRkd0cEtNQTRo?=
 =?utf-8?B?NTNZQ25DalI5VGdwcGVJeFVMazd2QytUVDdVS2wzdDlPNjJKdEU0OGM3eU9S?=
 =?utf-8?B?eWdZdGFWMjBmdkVHaHJhbDZweUZaNkxCeWFoWmdVQXFYdjc5aFFkSVBCMVBk?=
 =?utf-8?B?ZXVpbmxSMXpvVHJlSTg1ZnlzblRCaGR1Tkx6TjVsK0t1WjlqeSt3bmdiQkJE?=
 =?utf-8?B?NFpKOFRYSXJJdWs1UzBkN093Um9XTXBWMGFzYUc3ejh6a3VSbzQyV0MzVTlj?=
 =?utf-8?B?djllUXdhc1FjN1RKSStCejExVTV3SWwvT0JKR001L25wZ09KRGxUdTNEK2FY?=
 =?utf-8?B?V3J3SXpNYmJ0ZWdURUlhZU5kaDIwUHZidjZ5Y1J6Smt5ckZLTit0VlhoZzZJ?=
 =?utf-8?B?VjZ4ZkorbUNwUTcrL0JGRFl0cTBGMG5Oc25pK1IwU2lSVUpFazlIeGFLR1FC?=
 =?utf-8?B?bkR5THFEWEZpWFdwUTZkT0taUFFWS1gycWV4cHlSQWN4L2w0eEVlRnR6U0pI?=
 =?utf-8?B?akduWDhPZiswLzVwbHAwUkhOQnF0eFRITTZWelgrY3VIUGp5SEx6N0VxbG43?=
 =?utf-8?B?UkVGamFURUFNTVpVMmJ6M2xhZ09uVXFVamp0N0xIODUyUlNONjRnYlA0K2V3?=
 =?utf-8?B?QzFYZyt6eWNRSzIwdHlCRFFEY1RKQmxnUkJKeUJpNFkwVzZpNGxJN2hhbDNj?=
 =?utf-8?B?SUFyaGdYbVFZT2FTVjE3cHFESHhZTFlEWFN4OGxPNXdzUW5KVUpybVlQWWox?=
 =?utf-8?B?eVpEMHhzczZnRWt2d3ZZVEpMRjNOTmRxb0UwcFBVb1ErK3NuZzhTclYvNU9x?=
 =?utf-8?B?ZlhkQ2pvNUhNMnBlRys5aFpwU1FFbFNFODJxMGltK1V0Ny94bk5aV3pIWWor?=
 =?utf-8?Q?xAr5Z3OyrPYLA2dI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C4ADC9DD2236B4E8B7D345D110D419C@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: JO5HoPPG90gjNeAWEhr/cvCTP9ENT9N4hC1fDbWrYxGispI84D1GsodJurXTe0ogvtKR0DLHoEf/Cer+52dVscr3YfagouPXj7mnemZagPEli6hNxrkpM2cCLIEZ/A2rCsS3OxSTTsvLjo6rAqoX85iRcaMlj5aS+dlAxWmR9TVMOqsEvwzT6aQp37XePdxuDxYzB/HmNZ4x3o988xxSTpt/qL2bpVrXWnKy180P6e8WQi3BeyBiRkAK/3tbxOxUHW7fl3stadxIOXWcl0r7y5CnS2Gf/fp6QE9ciB60hbEquUBqPbnuwJJVuRBTFpYVRwJKGll9NRIFWLivd1XSdQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB281697.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686cf749-812a-423c-97c8-08df39443a94
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 00:48:51.3015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6IDGGpDMFzh4orNtsRDvBzOEOK8DoGbG4V44q72Q7iYICjVG5YXvXTVyhbPz/NDtSl+VAsxa7XajaxobJPQqoVdqbx/GI0WOonxG4/yF+3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR11MB9963
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTExLTAyIGF0IDIwOjM2IC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+ID4gWW91IGRvbid0IHdhbnQgdGhlIHJldmlld2VyIHRvIGhhdmUgdG8gcGllY2UgdG9nZXRo
ZXIgYSBwdXp6bGUgYnkgaG9sZGluZyBhDQo+ID4gYnVuY2ggb2YgdW5yZXNvbHZlZCB0aGluZ3Mg
aW4gdGhlaXIgaGVhZCBhcyB0aGV5IHJlYWQgdGhlIHdob2xlIHRoaW5nLiBTZWVtcw0KPiA+IGxp
a2UgYSB2YWxpZCBjb21tZW50IHRvIG1lLiBCdXQgdGhlIHNvbHV0aW9uIGlzIG5vdCBhbHdheXMg
anVzdCB0byBhZGQgbW9yZQ0KPiA+IHRoaW5ncyB0byB0aGUgbG9nLg0KPiA+IA0KPiA+IEJ1dCBJ
IHRoaW5rIHdlIGFyZSBzdGlsbCBnb2luZyB0byBicmVhayB0aGlzIHNlcmllcyBhcGFydCBpbnRv
IHN1YnNlY3Rpb25zDQo+ID4gZm9yIGdldHRpbmcgeDg2IGFja3MuIENvbnNpZGVyIHdoYXQgY291
bGQgY292ZXJlZCBpbiBhIHN1YnNlY3Rpb24NCj4gPiBjb3ZlcmxldHRlciB0b28sIGZvciBkZXNp
Z25pbmcgc29tZXRoaW5nIHdpdGggb3ZlcmFsbCByZXZpZXdhYmlsaXR5Lg0KPiANCj4gSSB3b3Vs
ZCBwcmVmZXIgdGhlIGFyY2ggY29kZSBvbmx5IGNvbnRhaW4gZW5vdWdoIHRvIGRvIHRoZSB2ZXJ5
IGxvdw0KPiBsZXZlbCBpbnRlcmZhY2Ugd2l0aCB0aGUgVERYIG1vZHVsZS4NCg0KSW4gdGhlIHBh
c3QgVERYIHdvcmssIHdlIGhhdmUgYmVlbiBtYWtpbmcgaXQgc28gdGhlIFREWCBtb2R1bGUgY2Fs
bCB3cmFwcGVycw0Kd2VyZSBkZXNpZ25lZCBiYXNlZCBvbiB3aGF0IHRoZSBjYWxsZXJzIG5lZWRl
ZC4gU28geW91IGRvbid0IGVuZCB1cCB3aXRoDQpzb21ldGhpbmcgb24gdGhlIG90aGVyIHNpZGUg
anVzdCB3cmFwcGluZyB0aGUgd3JhcHBlciB3aXRoIHdoYXQgaXMgcmVhbGx5DQpuZWVkZWQuIFNp
bWlsYXJseSwgb24gdGhlIGFyY2ggeDg2IHNpZGUgdGhlcmUgaXMgYSBkZXNpcmUgdG8gbm90IGhh
bmQgcmF3IHU2NCdzLA0KZXRjIGFuZCBpbnN0ZWFkIG9mIHByb3BlciB0eXBlcy4gVGhlc2UgaGF2
ZSBiZWVuIGNvbnNpc3RlbnQgeDg2IGFza3MuIFNvIHlvdSBlbmQNCnVwIHdpdGggc29tZXRoaW5n
IGEgYml0IG1vcmUgdGhhbiBhIHJlZ2lzdGVyIHBhY2tpbmcgZnVuY3Rpb24uDQoNClNvIHRvIGdl
dCB0aGUgeDg2IGFja3Mgb24gdGhlc2UgcGF0Y2hlcywgd2Ugd2VyZSBnb2luZyB0byBwYWNrYWdl
IHRoZW0gdXAgaW50bw0Kc21hbGwgY2h1bmtzIHRoYXQgZG8gc29tZXRoaW5nIHNtYWxsIChzZWUg
UEFUQ0ggT3JnYW5pemF0aW9uIHNlY3Rpb24gb2YNCmNvdmVybGV0dGVyKS4gU28gd2UgY2FuIHN1
Y2NpbmN0bHkgc2hvdyB3aGF0IHRoZSBUU00gc3Vic3lzdGVtIG5lZWRzLCBhbmQgaG93DQp0aGUg
d3JhcHBlcnMgYXJlIGRlc2lnbmVkIGZvciB0aGF0LiANCg0KSWRlYWxseSwgd2UgY291bGQgZ2V0
IHRoZSB4ODYgYWNrcyBlYXJsaWVyLCBzdWNoIHRoYXQgdGhleSBjYW4gYmUgcmVhZHkgdG8gZ28N
CndoZW4gdGhlIFRTTSBndWVzdCBzaWRlIHN0dWZmIGlzIHJlYWR5LiBPbmNlIHRoZXkgaGF2ZSB0
aGUgYWNrcywgbWF5YmUgdGhleSBnZXQNCnJlZm9ybWVkIGludG8gYSBsYXJnZXIgc2VyaWVzLiBC
dXQgdGhlIHBvaW50IGlzIGZvciB0aGUgc2FrZSBvZiBnZXR0aW5nIHRob3NlDQp4ODYgcGF0Y2hl
cyBhY2tlZC4NCg0KQW55IGNvbmNlcm5zPw0KDQo+IA0KPiBFdmVyeXRoaW5nIHJlbGF0ZWQgdG8g
U1BETSBTaG91bGQgbGl2ZSBpbiBhdHRlc3RhdGlvbiBzdWJzeXN0ZW0sIGFuZA0KPiB3ZSBhcmUg
bm90IGxpa2VseSB0byBiZSBoYXZpbmcgZXZlcnkgYXJjaCBkdXBsaWNhdGUgdGhlIG9iamVjdA0K
PiAiY2FjaGluZyIgZWl0aGVyLi4uDQoNCk1ha2VzIHNlbnNlLg0K
