Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793244410;
	b=c95L34pWHPpMRERbWrirATAubTt24ep7d+O6Lo9yN6cbklSXV9Cj/Yf2PcssPiDszoVK
	 IXm71SxfsDuSF6KGvXGQxXwYytGqeGYB8SCiDqScu5v+64x86dzx5rIeqVvaKISC6Hpf8
	 9MFOKBJN2yD0C1P0HmyZHTp8QrhSJNINmIO9ESrVThJvKxC6nCPB5AMCJU3EExHnEBgBA
	 tOxZDPWR/7ak8PCdp0nWVPZRsCB8xxeUR727JzxhAUTlZqPIpeEdZIidHj8VJvjLdeNa/
	 KuiXuycKvFoo7bJxg3jo8kmd72HnX1J2w6n2bxUO73FSz1O0oHrW4qMPcuZ4Xj4gAjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244410;
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
	bh=5v6cB2f8gx3aC6qYy7rghtGRVK1uNSELizsbtAphAX0=;
	b=g+FGhlqpy+EHO9pn/q3bGOerbgtCRS66fQarUbsbKgbOzBAu5ZDWctE/cJzIDEj+uGZa
	 DYx1N6QbdysMWgXYfkUuGjWp+q9t+9pTuEwqkda77cZ9cmOzj+PFNVx3cSG53LL3QPbvQ
	 Yt/G5Y3ZTWW9rx/jZQMClxHjACbEA1f9IeB/DHnSCferhErKAS4tNyozosdhIiES8Tf1b
	 HKfw3yFb00Hr0fiOQawvkuIiZC98df44PfwHU6Cgvrf91mFDEmUORJO1NqnrUCSs5I6R5
	 rl+b1PDacZhOBvjlashR7ALBsjfRS88Yf5p2Zx14nJE9D88cfzxjocX74OMbJoN/rPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oDcPaUMZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4965606A31C
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 03:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4965606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oDcPaUMZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793244409; x=1824780409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5v6cB2f8gx3aC6qYy7rghtGRVK1uNSELizsbtAphAX0=;
  b=oDcPaUMZT2qpXtbYUxJDuP9vnFn8d5IoYgNItJkW8c8H9LRG8gmZuHKI
   zbEAh+/I/UYSd+0kKxi37k0FmgdL9Twge5PsAIO6tembd8t6QINU0sIsU
   fZI65/H0k/r9bJL4CXoPd1CINzfRRXDe4BqQfvajDpBjr+aJSTcaqI3tx
   Ve6itrVjoFemtvUBZTiGGkK4wCqx6pW6jgQiBEm1Bto4J7anyz/xEuajZ
   K7lJYJY5MKmDfgpR2NVSjARhSX6x8mk7uRoNtW8WLtpd7s0fEyl4waSRo
   c43Uhs4+2uCA9/WXnJlXuh0Fbqe7EXCjkh9C3G7y9p4MqQXa0VFWUs0IP
   w==;
X-CSE-ConnectionGUID: CQxnJx2gQHeTAQfehKZ6wQ==
X-CSE-MsgGUID: sD0Rvo1ZQOGSI1bwCMn0Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1994975"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1994975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:26:49 -0700
X-CSE-ConnectionGUID: q4HzMUf0RhiW1g93rwh7RQ==
X-CSE-MsgGUID: +0CAe+Z0Qmm71rEnwW9kfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4947651"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:26:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 20:26:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 20:26:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 20:26:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVL8fxaR61otHhzbR4tQ+JmTjs6PPDS5HaTJeEH4o2bCu0cGA02AxvaquGGsl9dmJZUdJ7nRIk7xAWyIspfNogYTn+2Iypo0ya76jA0O6OtmtqpgSfuNI0C/7CphSPAcIOjW9sTjjAVEMwWDGvsFbc1Exz4vV6F2+Jv0+Hr+UYXrxdWt5di8Unr4zLl1UQAZ0YnWc75N+HuOQB5MlTN7BQT9lvGBb4Vgsaeqt55FhD09MRVqa56N1bPQI76xAr3uUIFy13MF1qLBwww55lPYjBm5ti+dGyhb6n0hTavlz2hQgExoeVO/IA6nkgRjR9kAjQUKCaxqPuArB6k1X2PS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5v6cB2f8gx3aC6qYy7rghtGRVK1uNSELizsbtAphAX0=;
 b=SlVgnK/zmKKfaWeZ7VmPCcgMv4d+ebbLQFL5igSzEVft+wCxJQiEZyF52K4HQU+zRxUgE+y+yvwb344Hj1SOX8F5zEfuQoMf/AKQ0lY/dAD/Jut1Ju18TfBRRi2TuhO1Svhza0njOVLy2nnbl2mcu7fmz3QwQMXGC5jSchgQWgEMrn8TCkJ8WvEtSaip/iBnDM3ZbcPRN6IAF/jKRBafP2ywnbSRFh+AqDOJtdOAJdZvT+z5z49RJCTHeyZyk3A064IOGw+ZlO3TgmnV7i801fhobavXI09jgdjD39rVfv1rnWvsT8kDSxy5eEgHWaFUZMkQUpBbuzwplUUzbFjOeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA3PR11MB819107.namprd11.prod.outlook.com (2603:10b6:806:518::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 03:26:45 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 03:26:45 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALZp1A=
Date: Thu, 29 Oct 2026 03:26:45 +0000
Message-ID: <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SA3PR11MB819107:EE_
x-ms-office365-filtering-correlation-id: 7d82d3e7-5516-4a15-f0a3-08df356c7575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|366016|376014|261026140227099003|38070700021|261028144727099003|11063799006|4143699003|56012099006|261026121527099003|261021135927099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: eTavxKWQrEkMpcYJP6uTz/V88N2HyncJcHAsCVweDAmEKltX5y2EWix9caaj7ivO0Gnm+lwX6vPQqPLxRIX+ZnJZKDAOHU8FV08PmCPhrX7gV8u/3ZRc6rzh8OEmaSWHiDFdwaPYXz4i6Z9Wh11sR6nQe3ScsbkgxmTP+Ve6HUITs8BTLh/jS6+ypkxHOZ3S6rbi9HOed7qJn7uSUsEb1U516MfyAkHsSKHFwpgcslNTfkFXsd97YAGd39jE6ANfqeoQ9nLaJrDac70Gmsr+ADh0bm5j3ufbIbIf7QhA0MUDcPqDwY5S0IIlyNKkG46mQmLH21xUglpnio6mmqq4LbgF+MzkEU1vyu5rURzyiPJhkOSn1TVA/VtnyV+j+/gyAEAGWj0K9yGENqxQkyCZszDfDtFT5IRg/m8hS4l1wl6wiwX2duJnN8tEmFjLlohrvjxhj3JuXcu3CX4fUUZkMi1g4ODXgc0O9nVFS6DkUtuVlHrdrInni/mM95nLW94turPLiFT1gptS1oykwJR+HlCscs+w9Zv63tuOiDEVUSrHbLB9sC2y3SNtc4GjE1T+jgtEna9zlhG0CWO4wIjUlL2Eu+OssHcGIIjD0O0mP5rG11DNqTACQPGTSODk8Ljen0JW9TR0GvYRk7MYlhH+PBSFLoOFXATuINBsmFkFnLdUUx/PLo508u/R9pYozMSnPCmzfsbTSYTT9hWwiBUgQwKbnpRTbPaf6wnXJ3EO/eU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(366016)(376014)(261026140227099003)(38070700021)(261028144727099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021135927099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0owWi9aQmdGQ3luYjJtSHpZSG5WN3h6NGpGNVdYRmNJZ2FhRDJScTZEMWdv?=
 =?utf-8?B?KzJxRUJjQ1FDRTVCUU1qL1c4bFBnS0JxTFR0YTlSRlpQZUh0bldYTlRiUDNi?=
 =?utf-8?B?M3BlYUk1VFRETGJCZDhreVY1VVljWkliK2RidXJ0c1lucWVGb0J6RmZFclFx?=
 =?utf-8?B?eUQ2UDlMUFp0U1RqNEdad0pnK1NhSzUwaHZIK1lMNzlybFRPM01UYlBORC80?=
 =?utf-8?B?Szd5ZWozd0FDcVhuNnpaQjJNRHdyTkFwUjduRnJROGtFVDEybDZVVE5zU1kz?=
 =?utf-8?B?d2VQTm5rdnVYUmNBSlhvWWJ0U3BTTzdiU3NaWm1nUnBaUjRqZ0o1c1k1b1Fr?=
 =?utf-8?B?MHJaS3Z4YVJXbzVyenZwdWFWS2RGUm9Oa0Q4NThHa2oxQXBuS3lrMG1xZW1q?=
 =?utf-8?B?akNKZHlsVENlL1RtdU1YUVlMSzAxNUQxMnRCUFl5UGVWRTRDYVJnQ0pVQWRt?=
 =?utf-8?B?TVR0bysvTUJwV3BDMlhZKzRRSUJJMXd1YXp0K3FDRmdxM2dnODhQTDlBMS94?=
 =?utf-8?B?Wi9LTlI3NWdWUXJsRm9nbjduZ1B0L0N6V3g0MkdMT3NqVVRVQnRMaEZXU1pW?=
 =?utf-8?B?SU0wWmU2ZHE0QXNiNWJ6RkdBcWtPRmprZS9LSzVuUjBGNkZFOXl3QzhnUmZa?=
 =?utf-8?B?dzNaK1lDZWNvb1VuZEp3QnM5ZCtEOWhJMzlCZ29sV3dOaU9yZTI3NTQxUXRu?=
 =?utf-8?B?YndUZjA2bGFRbXNvOGNMeTRDYnYwSi9mT2ZPTHpPM0pFdklmcURuMkpzdXpZ?=
 =?utf-8?B?bkZMd3hmNjVuRkxSMVROOCtlZTZFdktESm1hSUx1MHREMGtUZ241ZlRCTk0v?=
 =?utf-8?B?K2tVNDR4OHhGM3UxQ3FsRW1NOEdFaW5NNXB3RTNsdWZ6WTRaLzh5UWhYa0Fy?=
 =?utf-8?B?ZXpmVDVDazZXcjZJVHY2WnlZcCtnQkQ0aW1LSDM1aUNHU2tQQnNwVlA5T1Vk?=
 =?utf-8?B?TytKSWZrYUJSTzREZTNkRnE0OWszWUJDUFdFVi93QkNPVFVIcVBNRUcvWkpC?=
 =?utf-8?B?aEdrZEVXRGpra3ZTZkFNeHZya1ZjWEZPNForVndVR0tsN3AxWjVISVJhb3lh?=
 =?utf-8?B?S2dtY04veGJTQUI2YzQ0NDFobnlTYVpTZlNaaFdVc21ZYVZHK0tCMlArMHFV?=
 =?utf-8?B?QzJmbnNYZFFWSjUrNzhqTzhzKzBXWkxGSEdTOEpHWk5rMGQ1bVRUS3NTYVpM?=
 =?utf-8?B?azFWaVRMalRyUGF2eWlHd3JaVDB6R1AwODI0VHJoTVlseHUzMVQzdHJicEtQ?=
 =?utf-8?B?eHh4aUkyQWFDdmw2amtaR1lPdnpTSTBHODB4bi9qb0RiZHByNEJaLzNRY3FG?=
 =?utf-8?B?L3J4QlZUbXhiOXFvd3ZMVFpBL2UrMW5tV2RxZGNwYlR4M2g1QTc5V0FQYzFP?=
 =?utf-8?B?Q3kxbnJReFZmL3Z4ZXZ6U3hhSWlVSlJ2ak1zMzRqQnhLaXorSEpaSVoyS1V4?=
 =?utf-8?B?Z052aWlwNEE0ejFnS3JESkxJbS9TeHNTZW1JODZiM1cwcm16ckpmNmc0RDQ4?=
 =?utf-8?B?NE40SFN4c2xOTUhhZ3B1bTRsV09jbllUUGxFeGhDaE40aXptTlJ3aFM5Qlh0?=
 =?utf-8?B?RkIrbTVvSkZBeXpvQVU1Z2VoUTllVVdQbUtoeWlOSXUvT1c3ZFc2eDlqR2VB?=
 =?utf-8?B?cW1FeU1oODBBbk1iNkoyYm5NTUlTemVrL2NCTm9pQWFjMHUyUkRuMHhBRHRB?=
 =?utf-8?B?ckxvT1QrUk9iN3BucXA5M0tQQjRCU3hheDZPdURmTmdERlk4Y2p5VmRndENK?=
 =?utf-8?B?NDFBVlVTeEsvQnRkYllDZ0hwNnN6RGFsZkgzR2hyeW1yZldEUEJzRXVkSnhX?=
 =?utf-8?B?K1VqZlFoMHQ2NVJCZlhIS21GRHVMM1hocDZUaG1FR0RIck1uWnFZL2FJOUJt?=
 =?utf-8?B?NUhrSVBvU20yL1VjVlE4eHpnQS9UV0ZwUXNRcVExOTRKUU5ac3M0WG4xSzZK?=
 =?utf-8?B?aFJENFVCc0U2cU5FM1VhSlJxdlRDa1JrNkRFdkpyT2lXVmdoK2gwT20vdzZO?=
 =?utf-8?B?RlpBaVJ6U0p1c0lSWlVSTndwRDJpamZXd2JvODVLYUI2UUFlQUtmSERiVUJz?=
 =?utf-8?B?UWNzd1F6eFRGaEQ0UjFnaExXUktiaXUveE05ZU9mUlgrY3dMLzRTaGQvK1or?=
 =?utf-8?B?bGhvSkhwTHR0Tk15dnByYmJDTFB6dnV6WFNyOVFRMG1McDdPTWJyTzdmbUJx?=
 =?utf-8?B?TEFPWW5HQUFvbjJSTVo4ZlBLWVhXQTY1VGhlZ0JONldNc1l2dkZqUFBsRVIz?=
 =?utf-8?B?V1d3ajFHRm1ZTnkzM3hJc0xyVkc4ME9GMUdOYjJUNDIxNHI0YzlCYTJyZmJ0?=
 =?utf-8?B?YWJJUHpqVG9ZTmFOSEpFVGZ1K0xXOURTMHVyNzdZYkxISlE1bTRmZz09?=
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
X-Exchange-RoutingPolicyChecked: Kz6fJcXC49wqGqn4LVUjV9PGOymDUGWB1J/2pZhsyVNgzfQ2CdDyRO69PeWB896R4yMeeIRBN6qwVqwx5zoNi8Sb0BO9oFJg/ula8o9SqL/atE4IUBEJAzem1uL5HSSSrcNg3CmNUT9L5IDAmF+rbdvAzk8Hkc0n4OKxUKO/4xD7RfpdRML26bCspUfrEEN9Qejow565L/8g+vcTZG2+fur7bZCYTACOJl08LsMSM/jCUx7ebmQn/dHPVHmzXWZ2o/z4+fChgYkFmMGJ/WKLcNM9YgCwQwV6JPTdsWza42TaN6wQd9Rcujk564VsozmhKC0C1f7W/IfO4LDReiYUAw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d82d3e7-5516-4a15-f0a3-08df356c7575
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 03:26:45.2872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQAVHKVrt5Cp2Nly+//llJWPqW3Kl0hsL1glg4TZbhFavSMwkdRuisgF5xgpwIXs9RnqDmz6FfhQC3/5TY5mLbxn7lVImdXTWzPmA0KAvD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB819107
X-OriginatorOrg: intel.com

Pj4+Pj4gQEAgLTE4MSw2ICsyNTMsOSBAQCBzdGF0aWMgdm9pZCB0ZHhfZGV2c2VjX3VubG9jayhz
dHJ1Y3QgcGNpX3RzbSAqdHNtKQ0KPj4+Pj4gICB7DQo+Pj4+PiAgIAlzdHJ1Y3QgdGR4X2RldnNl
YyAqdGRldnNlYyA9IHRvX3RkeF9kZXZzZWModHNtKTsNCj4+Pj4+DQo+Pj4+PiArCWlmIChXQVJO
X09OKHRkeF90ZGlfdW5iaW5kX2Rldih0ZGV2c2VjKSkpDQo+Pj4+PiArCQlyZXR1cm47DQo+Pj4+
IDxUaGlua2luZyBvdXQgbG91ZD4NCj4+Pj4NCj4+Pj4gU28gdW5sb2NrIGludm9sdmVzIGNhbGxp
bmcgVERDTV9VTkJJTkQgd2hpY2ggaW4gdHVybiBtaWdodCBmYWlsIGZvciBhbnkNCj4+Pj4gbnVt
YmVyIG9mIHJlYXNvbnMgYW5kIHlldCB3ZSBoYXZlIG5vIHdheSBvZiBjb21tdW5pY2F0aW5nIHRo
YXQuIFNvDQo+YWZ0ZXINCj4+Pj4gYW4gdW5sb2NrIGEgVEQgbWlnaHQgd2FudCB0byByZWJpbmQg
YW5kIGlzc3VlIGJpbmQgb24gYSBkZXZpY2Ugd2hpY2ggaXMNCj4+Pj4gYWxyZWFkeSBib3VuZCBi
ZWNhdXNlIHByaW9yIHVuYmluZCBmYWlsZWQuIElzIHRoaXMgc29tZXRoaW5nIHdlIHNob3VsZA0K
Pj4+PiBiZSB3b3JyaWVkIGFib3V0ID8NCj4+PiBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB5b3Vy
IHBvaW50IGhlcmUuDQo+Pj4gV2UgbmVlZCBwY2lfdHNtX29wczo6dW5sb2NrKCkgaW4gVFNNIGZy
YW1ld29yayB0byByZXR1cm4gYW4gZXJyb3Igc3RhdHVzDQo+Pj4gKGUuZy4sIGludCkgc28gdGhh
dCBmYWlsdXJlcyBpbiB0aGUgdW5kZXJseWluZyBoYXJkd2FyZS1sZXZlbCB1bmJpbmQgY2FuDQo+
Pj4gYmUgYnViYmxlZCB1cCB0byB0aGUgY2FsbGVyIHJhdGhlciB0aGFuIHNpbGVudGx5IGlnbm9y
ZWQuDQo+Pg0KPj5wbGVhc2UgcmVtZW1iZXIgcmFpc2luZyB0aGlzIHdoZW4gZm9sa3MgYXJlIGRp
c2N1c3NpbmcgZ2VuZXJpYyBndWVzdCBUU00NCj4+ZnJhbWV3b3JrIHNlcmllcy4NCj4NCj5TdXJl
Lg0KDQpJIHdhbnQgdG8gZGlzY3VzcyB0aGlzIGZ1cnRoZXIuDQoNCklmIHRoZSBUU00gZHJpdmVy
IHN1Y2Nlc3NmdWxseSBsb2NrcyBhIGRldmljZSBidXQgbGF0ZXIgZmFpbHMgdG8gdW5sb2NrIGl0
LA0KdGhlIGNvcmUgY2Fubm90IGNvbmZpcm0gdGhhdCB0aGUgZGV2aWNlIGhhcyByZXR1cm5lZCB0
byBhIHNhZmUsIHVubG9ja2VkDQpzdGF0ZS4gVGhlIGRldmljZSBtYXkgc3RpbGwgYmUgbG9ja2Vk
IG9yIHBhcnRpYWxseSB0b3JuIGRvd24uIFNvIGJlc2lkZXMNCnJldHVybiBmYWlsdXJlIHRvIHRo
ZSBjb3JlLCBJIHRoaW5rIHRoZSBjb3JlIHNob3VsZCBtYXJrIHRoYXQgZGV2aWNlIGFzDQpicm9r
ZW4gYW5kIHByZXZlbnQgaXQgZnJvbSBiZWluZyBhdHRhY2hlZCB0byBhIGRyaXZlci4gRnVydGhl
ciBsb2NrL3VubG9jay9ydW4NCnNob3VsZCBiZSBmb3JiaWRkZW4gaW4gdGhlIGNvcmUsIEV4YW1w
bGUgY2hhbmdlczoNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGNpLmggYi9pbmNsdWRl
L2xpbnV4L3BjaS5oDQotLS0gYS9pbmNsdWRlL2xpbnV4L3BjaS5oDQorKysgYi9pbmNsdWRlL2xp
bnV4L3BjaS5oDQpAQA0KICNpZmRlZiBDT05GSUdfUENJX1RTTQ0KICAgICBzdHJ1Y3QgcGNpX3Rz
bSAqdHNtOwkJLyogVFNNIG9wZXJhdGlvbiBzdGF0ZSAqLw0KKwlib29sIHRzbV9icm9rZW47CQkJ
LyogU2VjdXJpdHkgdGVhcmRvd24gZmFpbGVkICovDQogI2VuZGlmDQoNCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3BjaS10c20uaCBiL2luY2x1ZGUvbGludXgvcGNpLXRzbS5oDQotLS0gYS9p
bmNsdWRlL2xpbnV4L3BjaS10c20uaA0KKysrIGIvaW5jbHVkZS9saW51eC9wY2ktdHNtLmgNCkBA
DQotCSAqIEB1bmxvY2s6IGRlc3Ryb3kgVFNNIGNvbnRleHQgYW5kIHJldHVybiBkZXZpY2UgdG8g
VU5MT0NLRUQgc3RhdGUNCisJICogQHVubG9jazogcmV0dXJuIGRldmljZSB0byBVTkxPQ0tFRCBz
dGF0ZSBhbmQgZGVzdHJveSBUU00gY29udGV4dC4NCisJICoJICAgIFJldHVybiB6ZXJvIG9uIHN1
Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJubyBvbiBmYWlsdXJlLg0KKwkgKgkgICAgT24gZmFpbHVy
ZSwgcmV0YWluIHRoZSBjb250ZXh0IGZvciBzdWJzZXF1ZW50IGNsZWFudXAuDQpAQA0KLQkJdm9p
ZCAoKnVubG9jaykoc3RydWN0IHBjaV90c20gKnRzbSk7DQorCQlpbnQgKCp1bmxvY2spKHN0cnVj
dCBwY2lfdHNtICp0c20pOw0KQEANCiAgKiBUaGlzIHN0cnVjdHVyZSBpcyB3cmFwcGVkIGJ5IGxv
dyBsZXZlbCBUU00gZHJpdmVyIGRhdGEgYW5kIHJldHVybmVkIGJ5DQotICogcHJvYmUoKS9sb2Nr
KCksIGl0IGlzIGZyZWVkIGJ5IHRoZSBjb3JyZXNwb25kaW5nIHJlbW92ZSgpL3VubG9jaygpLg0K
KyAqIHByb2JlKCkvbG9jaygpLCBpdCBpcyBmcmVlZCBieSByZW1vdmUoKSBvciBhIHN1Y2Nlc3Nm
dWwgdW5sb2NrKCkuDQpAQA0KIHN0cnVjdCBwY2lfdHNtIHsNCiAgICAgc3RydWN0IHBjaV9kZXYg
KnBkZXY7DQogICAgIHN0cnVjdCBwY2lfZGV2ICpkc21fZGV2Ow0KICAgICBzdHJ1Y3QgdHNtX2Rl
diAqdHNtX2RldjsNCiAgICAgc3RydWN0IHBjaV90ZGkgKnRkaTsNCiAgICAgc3RydWN0IGRldmlj
ZV9ldmlkZW5jZSAqZXZpZGVuY2U7DQogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQogfTsNCiAN
CitzdGF0aWMgaW5saW5lIGJvb2wgcGNpX3RzbV9pc19icm9rZW4oc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQorew0KKyNpZmRlZiBDT05GSUdfUENJX1RTTQ0KKwlyZXR1cm4gcGRldi0+dHNtX2Jyb2tl
bjsNCisjZWxzZQ0KKwlyZXR1cm4gZmFsc2U7DQorI2VuZGlmDQorfQ0KKw0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGNpL3RzbS9jb3JlLmMgYi9kcml2ZXJzL3BjaS90c20vY29yZS5jDQotLS0gYS9k
cml2ZXJzL3BjaS90c20vY29yZS5jDQorKysgYi9kcml2ZXJzL3BjaS90c20vY29yZS5jDQpAQA0K
IHN0YXRpYyBpbnQgcGNpX3RzbV9hY2NlcHQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQogew0KQEAN
CiAgICAgaWYgKHBkZXYtPmRldi5kcml2ZXIpDQogICAgICAgICByZXR1cm4gLUVCVVNZOw0KIA0K
KwlpZiAocGNpX3RzbV9pc19icm9rZW4ocGRldikpDQorCQlyZXR1cm4gLUVJTzsNCisNCiAgICAg
aWYgKHRlc3RfYml0KFBDSV9UU01fRl9BQ0NFUFQsICZwZGV2LT50c20tPmZsYWdzKSkNCiAgICAg
ICAgIHJldHVybiAwOw0KQEANCiAvKioNCiAgKiBwY2lfdHNtX3VubG9jaygpIC0gVHJhbnNpdGlv
biBUREkgZnJvbSBMT0NLRUQvUlVOIHRvIFVOTE9DS0VEDQogICogQHBkZXY6IFRESSBkZXZpY2Ug
dG8gdW5sb2NrDQogICoNCi0gKiBSZXR1cm5zIHZvaWQsIHJlcXVpcmVzIGFsbCBjYWxsZXJzIHRv
IGhhdmUgc2F0aXNmaWVkIGRlcGVuZGVuY2llcyBsaWtlIG1ha2luZw0KLSAqIHN1cmUgdGhlIGRl
dmljZSBpcyBsb2NrZWQgYW5kIGRldGFjaGVkIGZyb20gaXRzIGRyaXZlci4NCisgKiBSZXF1aXJl
cyB0aGUgZGV2aWNlIHRvIGJlIGxvY2tlZCBhbmQgZGV0YWNoZWQgZnJvbSBpdHMgZHJpdmVyLg0K
KyAqDQorICogUmV0dXJuOiB6ZXJvIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdhdGl2ZSBlcnJubyBvbiBm
YWlsdXJlLiBBbiB1bmxvY2sgZmFpbHVyZQ0KKyAqIHF1YXJhbnRpbmVzIHRoZSBkZXZpY2UgYW5k
IHByZXNlcnZlcyBpdHMgVFNNIGNvbnRleHQuDQogICovDQotc3RhdGljIHZvaWQgcGNpX3RzbV91
bmxvY2soc3RydWN0IHBjaV9kZXYgKnBkZXYpDQorc3RhdGljIGludCBwY2lfdHNtX3VubG9jayhz
dHJ1Y3QgcGNpX2RldiAqcGRldikNCiB7DQorCXN0cnVjdCBwY2lfdHNtICp0c20gPSBwZGV2LT50
c207DQorCWludCByZXQ7DQorDQogICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUoJnBjaV90
c21fcndzZW0pOw0KICAgICBkZXZpY2VfbG9ja19hc3NlcnQoJnBkZXYtPmRldik7DQogDQogICAg
IGlmIChkZXZfV0FSTl9PTkNFKCZwZGV2LT5kZXYsIHBkZXYtPmRldi5kcml2ZXIsDQogICAgICAg
ICAgICAgICAidW5sb2NrIGF0dGVtcHRlZCBvbiBkcml2ZXIgYXR0YWNoZWQgZGV2aWNlXG4iKSkN
Ci0JCXJldHVybjsNCisJCXJldHVybiAtRUJVU1k7DQogDQotCXRvX3BjaV90c21fb3BzKHBkZXYt
PnRzbSktPnVubG9jayhwZGV2LT50c20pOw0KKwlyZXQgPSB0b19wY2lfdHNtX29wcyh0c20pLT51
bmxvY2sodHNtKTsNCisJaWYgKHJldCkgew0KKwkJcGRldi0+dHNtX2Jyb2tlbiA9IHRydWU7DQor
CQlwY2lfZXJyKHBkZXYsDQorCQkJIlRTTSB1bmxvY2sgZmFpbGVkICglZCk7IGRldmljZSBxdWFy
YW50aW5lZFxuIiwgcmV0KTsNCisJCXJldHVybiByZXQ7DQorCX0NCisNCiAgICAgcGRldi0+dHNt
ID0gTlVMTDsNCiAgICAgLyogaW1wbGljaXQgY2xlYXIgb2YgUENJX1RTTV9GX0FDQ0VQVCAqLw0K
KwlyZXR1cm4gMDsNCiB9DQpAQA0KIHN0YXRpYyBpbnQgcGNpX3RzbV9sb2NrKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LCBzdHJ1Y3QgdHNtX2RldiAqdHNtX2RldikNCiB7DQpAQA0KICAgICBpZiAocGRl
di0+ZGV2LmRyaXZlcikNCiAgICAgICAgIHJldHVybiAtRUJVU1k7DQogDQorCWlmIChwY2lfdHNt
X2lzX2Jyb2tlbihwZGV2KSkNCisJCXJldHVybiAtRUlPOw0KKw0KICAgICB0c20gPSBvcHMtPmxv
Y2sodHNtX2RldiwgcGRldik7DQpAQA0KIHN0YXRpYyBzc2l6ZV90IHVubG9ja19zdG9yZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQ0KIHsNCkBADQotCXBjaV90c21fdW5s
b2NrKHBkZXYpOw0KKwlyYyA9IHBjaV90c21fdW5sb2NrKHBkZXYpOw0KKwlpZiAocmMpDQorCQly
ZXR1cm4gcmM7DQogDQogICAgIHJldHVybiBsZW47DQogfQ0KQEANCiBpbnQgcGNpX3RzbV9lbmFi
bGVfZG1hKHN0cnVjdCBwY2lfZGV2ICpwZGV2KSBfX211c3RfaG9sZCgmcGRldi0+ZGV2LT5tdXRl
eCkNCiB7DQpAQA0KICAgICBpZiAoZGV2X1dBUk5fT05DRShkZXYsICFkZXYtPmRyaXZlciwNCiAg
ICAgICAgICAgICAgICJETUEgYWNjZXNzIG9ubHkgZmluYWxpemVkIGF0IGRyaXZlciBhdHRhY2hc
biIpKQ0KICAgICAgICAgcmV0dXJuIC1FTlhJTzsNCiANCisJaWYgKHBjaV90c21faXNfYnJva2Vu
KHBkZXYpKQ0KKwkJcmV0dXJuIC1FSU87DQorDQogICAgIGlmICghcGRldi0+dHNtKQ0KICAgICAg
ICAgcmV0dXJuIDA7DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2ktZHJpdmVyLmMgYi9k
cml2ZXJzL3BjaS9wY2ktZHJpdmVyLmMNCi0tLSBhL2RyaXZlcnMvcGNpL3BjaS1kcml2ZXIuYw0K
KysrIGIvZHJpdmVycy9wY2kvcGNpLWRyaXZlci5jDQpAQA0KIHN0YXRpYyBpbnQgcGNpX2Rldmlj
ZV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KICAgICBpbnQgZXJyb3I7DQogICAgIHN0
cnVjdCBwY2lfZGV2ICpwY2lfZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KICAgICBzdHJ1Y3QgcGNp
X2RyaXZlciAqZHJ2ID0gdG9fcGNpX2RyaXZlcihkZXYtPmRyaXZlcik7DQogDQorCWlmIChwY2lf
dHNtX2lzX2Jyb2tlbihwY2lfZGV2KSkgew0KKwkJcGNpX2VycihwY2lfZGV2LA0KKwkJCSJEcml2
ZXIgcHJvYmUgYmxvY2tlZCBhZnRlciBUU00gdW5sb2NrIGZhaWx1cmVcbiIpOw0KKwkJcmV0dXJu
IC1FSU87DQorCX0NCisNCiAgICAgaWYgKCFwY2lfZGV2aWNlX2Nhbl9wcm9iZShwY2lfZGV2KSkN
CiAgICAgICAgIHJldHVybiAtRU5PREVWOw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0L2Nv
Y28vdGR4LWd1ZXN0L2Nvbm5lY3QuYyBiL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25u
ZWN0LmMNCi0tLSBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCisrKyBi
L2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCkBADQotc3RhdGljIHZvaWQg
dGR4X2RldnNlY191bmxvY2soc3RydWN0IHBjaV90c20gKnRzbSkNCitzdGF0aWMgaW50IHRkeF9k
ZXZzZWNfdW5sb2NrKHN0cnVjdCBwY2lfdHNtICp0c20pDQogew0KICAgICBzdHJ1Y3QgdGR4X2Rl
dnNlYyAqdGRldnNlYyA9IHRvX3RkeF9kZXZzZWModHNtKTsNCiAgICAgc3RydWN0IGRldmljZV9l
dmlkZW5jZSAqZXZpZGVuY2UgPSB0c20tPmV2aWRlbmNlOw0KICAgICBpbnQgcmV0Ow0KIA0KICAg
ICByZXQgPSB0ZHhfdGRpX3VuYmluZF9kZXYodGRldnNlYyk7DQotCWlmIChyZXQpIHsNCi0JCXBy
X3dhcm4oIkZhaWxlZCB0byB1bmJpbmQgVERJIGZvciAlczogJWRcbiIsDQotCQkJcGNpX25hbWUo
dHNtLT5wZGV2KSwgcmV0KTsNCi0JCXJldHVybjsNCi0JfQ0KKwlpZiAocmV0KQ0KKwkJcmV0dXJu
IHJldDsNCiANCiAgICAgdGR4X3RkaV9tbWlvX3RlYXJkb3duKHRkZXZzZWMpOw0KIA0KICAgICBk
bWFfc2V0X2NjX3ByaXZhdGUoJnRzbS0+cGRldi0+ZGV2LCBmYWxzZSk7DQogICAgIGtmcmVlKGV2
aWRlbmNlLT5vYmpbREVWSUNFX0VWSURFTkNFX1RZUEVfUkVQT1JUXS5kYXRhKTsNCiAgICAga2Zy
ZWUoZXZpZGVuY2UpOw0KICAgICBrZnJlZSh0ZGV2c2VjKTsNCisJcmV0dXJuIDA7DQogfQ0K
