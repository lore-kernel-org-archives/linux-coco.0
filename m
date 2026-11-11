Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794438316;
	b=2tynnC9BWPYv3dphvEOPiLeIypT1fSrm9M9FlbPAaT5HvtQGXeM7pDqR7UApGYOL8P5j
	 e8/SREvZiuV5+mm0DspXIgVfvYDhAP5pqlBZPmoz7etge42S/ghZofrCFMp5Dz2Q3WioX
	 pYH1akreSoCGX7wgUAhGvKz54DoTRN1qXrMO8dMXt1+TmbRzA4eukTFRaVzvvW05tm15F
	 rqUE59lko8f9lKFk5yCqGXowgzMVVefn1yj8BLwqOH8ivYcw9VTm2nmYPozYMo7gsctqs
	 XS5w0LJq1j4DtEerD0f9SVLiOFqRT8nRu6VNiN00kX5Axq4RyX3+ry5zbb1dt6NgseA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438316;
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
	bh=8ZJvnvcQJ0Ge5w/DU4K1Tg6tEaUDQB7/jyEnQ0tusyg=;
	b=VDDHLxLdVwNgqf4Ki3tCdB8C95hkf0rrq1jng0JyzU82N/o1rLTue1G0+F/4YS4Vy/H8
	 hwn2mtQ8KjIO1+PeUTOzXwkaLxTLktKrtioZhzIZG07KsSHhfL0DLz2aCGhXPkMFQJ9Ir
	 ZHMHCIw13Tf/km+Sy55TpPaUFBMC2zSOm4D1oDw2r6XH0Kr9wVkjXPa9Wni8o43XG/05x
	 fLixyuWdEjXTWh8qV3gzsOK4sJ/scoREjfy3Xk/Bbu1mFg73zftgUIvuQfSZ1C8kzCX4A
	 BK0jWQQIOeXlIAWZZ7SuhHLK4DW5HMpqqzdzKxcwxXQ1QUZXhOy3jzMnZSoe2b55zpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JqDSL27v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C703606A31C
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 23:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C703606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JqDSL27v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794438312; x=1825974312;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8ZJvnvcQJ0Ge5w/DU4K1Tg6tEaUDQB7/jyEnQ0tusyg=;
  b=JqDSL27vjy03YwMgE9kJugZqMEmCd1cINsxjWlrZE5UrW9+Bv124IQ6J
   2IqPL1/hXX56MTflW4pR8x6jCbjKbNXKJHuCXP+7OwpSJcMAenaDO8GAm
   qQ/3TczMsSTnZ7AZVluicGJaZJIGxJSC2uUPkV9tjqH/oD3E9JBYDUF2u
   xKmJenDEpgVPR2fBkeF4YNIStUERDMFPhdSBgHgGEnMQeXwX2U4QBmnUL
   PeA8c9xUxaVs7dRnPdZH9el4bCCAwoOwJr5ZLibzac3Fu2XjdabRfF0dg
   okv21v/ArFWxaBhfmFSoBiltDi6A18r1KOq7imlhJrE61lp7Swm3Mhq7+
   w==;
X-CSE-ConnectionGUID: qu5NS14pQkmKzvmOvAb5gw==
X-CSE-MsgGUID: a2B8D306T1SOie4OBoqWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3242348"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3242348"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 15:05:10 -0800
X-CSE-ConnectionGUID: bgUICHYCSn6RxvdoSC44sg==
X-CSE-MsgGUID: /0Q2xhrNR5ywmnpQJMbXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8596198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 15:05:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 15:05:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 15:05:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 15:05:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcyiYZxGRZYj78cdM+nM4aO4pxGOPAb18GtnW4qHrUgY+rlXDClej5Ai02spi1KUuwNj7k/eBCiBM9umBPzgGHgkpkD89uQ1fhRYxEGsVxmNGug1xKrNLC+BnqYRxw0o+ygdSfVNwxE6yFAYrLb9hke2YKj7a/4AHHKlkXP+/yxPviGgppDVDLTezdrDyoEi1bk8YNMvtZC/3L/BB/LIPBINY0iA8elbBP/JWrnFBDqui6jYWj7fl/+K4qQPOzbVzVkXa5GlkPp/BExoGy12wcG78NmNZG+FPvIPZg0ul+R9aKkPaAdBAie8sJu5zpC3z+wWc0tft1U8Ne2556kPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZJvnvcQJ0Ge5w/DU4K1Tg6tEaUDQB7/jyEnQ0tusyg=;
 b=wGy/5bcWKWrbREZ88Vt1pnYbOyAnj6jpZTduhtuZdY0+jvda1yrLfDv1eRXh836ApNd470rgxMb54kfQDpjmPNvcFsmZxbgO34kINjNMFAkF2D6vDVXauFajVpEWO2ZxaJc6xZLge3S7bVIfbRG/SpfWfAE/liV4Z3TM2+nM6xdfKma8eLDo9S2js7vhULoO6b0Msx4Ek2ndFhNBlJZwOzBBMZBe62l4SlTShLFuOWKpQ7Vszch9EFxPB1jpW/+xD7Hun/bK8SHN5EaMdISeFiO8rhZSKfmd1LQE+9rs3/8NAV5GyFqT70oNZ20SiYzEwuV0ghTQUrtSnCAJ6LWFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by IA1PR11MB7341.namprd11.prod.outlook.com (2603:10b6:208:426::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 23:05:05 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 23:05:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFAltk+oc7EUexq/mpS9aD2rcCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJ4CACkAtgIAAmzyAgAARV4CAACktgIAAHwIAgABzXYCAAIO7gIAAhIow
Date: Wed, 11 Nov 2026 23:05:04 +0000
Message-ID: <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
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
 <20261111150029.GJ738765@nvidia.com>
In-Reply-To: <20261111150029.GJ738765@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|IA1PR11MB7341:EE_
x-ms-office365-filtering-correlation-id: 0c2a7a5f-75a1-4c92-9d03-08df404838f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|10067099003|11063799006|5023799004|4143699003|261026140227099003|56012099006|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261028144727099003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 3bLVdc+sWfklRKppM7acop1KY4/zi9xAskHD1NfWvp9ImIJHDztgwnWGw49GUrUfnH9S7uUSLus14H5Gi14fXSI6ifvBb82Nhewvh7Njuw0jskk5qZ+91c16C559y+6IMz2tHf4L1cm1FeJix5QCDrvsG2H04UQvFoC6G2OToukY7hpr8y2s6plP3QXvszu4nHO0vToyCTEvSb+HFMkTpgfZsL5zACf6MzEdssVh1VrLseU/QiV4KbTmT+jt52FOEUmQWWC+EPekCnWJcX2ZtZZqP1WTjsaebqxf+OoO6pTcCUAY33+vn6M2jigsFU7MNrGpI7LCyfRsZR1xlVgAgCA2pyxWtBvP8GvodhtgvSpPRnsLB+OsFztXy15/M5pvmurZll3GcqnuL+7JDJCdCydz6ofk1MqxAGcnS/t13ya2nYlaFM72hC8Ukbe7/bnj53GAUh/HeSWqnPvJ2hRhz0Io+mIWfVAuJsm462AC6RusRyBMhANMJ4Hjo8x86qSWuKE2hzYIDKwVxMwDRE1VT3DGwZuZ+j9a5ZUHFMPeDL/IMmU7ikEOIH1ZKAW7UoUUJpOAehhat/nrbZhKVDfX84QXm7DIfiFIvZAnDGtSOffCfsLNXeqkBTm9fDM8FV8qycZtj2I4TPXqUKPwjpCv7KL4SZi5Plg4/rXYcEHvNrfCnls7t7rcy3U86m5kQve5pK3lLuKbAU5C6FVdZhWudB6qukYkKaJOetea8ABdupY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(11063799006)(5023799004)(4143699003)(261026140227099003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bcJJiZ2HPRCEokPPI16UkQLwwvGWJ+/iecT7dKEnxslNYFvsUFTiCrYAMQNl?=
 =?us-ascii?Q?rbqw58WgV0zRE3nEVJDlH4sHMCvs0eDT0fw9ij9efWqXxf42Pljt75pF+cMG?=
 =?us-ascii?Q?MsnNCo7iwEoSNov8qXBVO1Kbv3WnTQ4zn1HbdpMIePe8ExGkPU3suH9vYQXO?=
 =?us-ascii?Q?3o4SXWKmTB+KfdyTmB7g06y+5LaPu2BnJOTvo8g4ZsgOkqJtL+kMm5DjwdsE?=
 =?us-ascii?Q?ss1mhiORc+U0zyazmgtQUKUFg+h1aVxUyr1vJ6P5aPTxoBbkHXDXQPDhrvCf?=
 =?us-ascii?Q?7esn1BF6YbZ78j6mWpMcvZru5CAHbv2iT2KWi9GefA0u8RkLD8bZgNB54l0e?=
 =?us-ascii?Q?x5Ka7bKvysGKomVCCcLANFw08TbPadNIKZbAuHEjvlZX9PT2mMt8h7j0oyM3?=
 =?us-ascii?Q?BHfH1YrDhiNncum+4t3hbKK1pGUbZdC/JXMAA+MvXlELcDiAwqbtctLmQ0vX?=
 =?us-ascii?Q?eK03fMB1vBAEuOQcvK8+StA0lWqYjn7/d6egu7GLGUqU/Onw0WNB6ps9KWi0?=
 =?us-ascii?Q?7MQRNe6qpO7s6UyvteDCr1ymQRyZ1ZIW3ofnDKwKShTogtAQUNbbpqNMJiIs?=
 =?us-ascii?Q?0p4q+NqHgPb3ib9B41XgCgpEz5CLZ5Tpj24ZRCB3KdeyoliMHN0PtLd5pgmO?=
 =?us-ascii?Q?mV/LYtXzZORytVQdEwwHuQN4pc4oNzQNGHgrHjLAw+ufXkgrXtWpnCUWvVL+?=
 =?us-ascii?Q?3d0DpNgewFNineApWClxLUyk1Vvyepgoqmg4TI1yYNft0Xz/GRfcuH8T22uN?=
 =?us-ascii?Q?Mjo3Fs2NyPm5H6kxPBC6ZI5x1jttwwpEzku9+B9Dg1b/34ImgB5X6EXW5RJ9?=
 =?us-ascii?Q?vLjP9ZAnhdthqiOOwHDPqbxnqPU9iX03k/Pt1Eabz0LJ+HvctF5fNHXMqNJd?=
 =?us-ascii?Q?IRWAQAqUgbhzt/Nuf/C30CcIaz75MitWKPqqxd+RaKXverWEYLbCzobXNaCF?=
 =?us-ascii?Q?Bq8/KozNxcOdDybvJsteah4YiKolYXo3UWM65Rs4kBIN4bR/Iyw/ZJdf0KXT?=
 =?us-ascii?Q?g7aNyiZL3NV0Yz9x6rfnicVcqIEK0pebg7Bz0Bds0nQbztQV73EEKtgs8DG+?=
 =?us-ascii?Q?qIdo9btLaZguz+ggt7KWs6/DqusxAfHZQ5Z+ROAC6OAdJe7ESeoCB1RxAxTg?=
 =?us-ascii?Q?2+feliwPYFR46sUmy5Q9JBkcEVY3HAfwleXQ55FPisx0s1ZKw3rcsfBBSkA5?=
 =?us-ascii?Q?v93Qvka7cWPy9zAwCnmuTFH27GHNJbKwDFaRSeDRmiNf4v3iguwmjmcEUQEj?=
 =?us-ascii?Q?40jOubJVggv/8lxJEvi2dc6bP0GWseHXloejdhPrzOJxsO59lpzRixxfvu/2?=
 =?us-ascii?Q?zs/XoBZBBkLoCXElGwSEjc2X3cVUsLv1ES/l6iOSZnN7Inl/CCw639MYweKa?=
 =?us-ascii?Q?kb62zoBNCabO0PnZihZAvRQlkosoXA5o9rKLixlgx6GPBhMtdVoIGTvDA/tR?=
 =?us-ascii?Q?liJivySxMBD4CKT27MZUuCb9hQXcYDfSBLTEygXwiGHS2Hc/wX1cy88LCRvD?=
 =?us-ascii?Q?g8hD7StV1R9ya7NoiehySiMplKA57KvZWujcaAJ9ZBhceJOkJEMd+GyxO+Jn?=
 =?us-ascii?Q?gEOj7IoHewawFHoXqhp5JS/pFO4ymRLVw8JcGSH0WZmuJy1Ac/Nb4g2NeeSo?=
 =?us-ascii?Q?t4a0vVAjEbY+I24X5C59GP/mz4y5Vxt5+koptOFxdBYK3hwTUqnqBSxGUOe/?=
 =?us-ascii?Q?j1JY2ZFKeE0WrHKQ40KL/UCVV002IxZj/YvUpLTy9kgEuN9AZkEPluQg8Idg?=
 =?us-ascii?Q?gZch4vA3Mg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Cdri9NZuEvnHB5Db99eOsxpAJ4+1cG4CFZ/ezmkQkJvNnIGGmvEFg57FNYgmtENZSrjQ5+sSW/TY/FdzSEut+Ws39491hVRpx0iJbnZfqJDvN2fMowVGtHNXUD7pkpGiHv8J8WI/WfGuh2VajOlPsvlS4gxFbZrow9g6LspOyxyaIpcHaJ4BC7r5MzrOyj+PvIxiJScPxTWsgl0bajKzsWLrq/ef/pbzM+DhxFso8eW35kTEKHmw7EEZnAdxK7YgocW6oTNzT3fq1iwL9L1yNegxUytuRbcU0se1IzotnfvhYLDPFfrmeT3veLtOkK+sAU1bitzILO1V9mPJwHbDog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2a7a5f-75a1-4c92-9d03-08df404838f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 23:05:04.7286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmAOQqsfv/K5+GKrFf09EVgkwXaGDcedePTtACj2Zv4rnl3qH2G+QJ8AjYzZKa8e4ORSzgVNAp+RJwLBcje0YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7341
X-OriginatorOrg: intel.com

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, November 11, 2026 11:00 PM
>=20
> On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:
>=20
> > The interesting case is about such failures after attest e.g. unlock
> > which is supposed to be a void operation. Maybe we don't need do
> > anything special in tsm core - the secure firmware maintains the
> > state machine so future lock will fail if the current state is not
> > unlocked.
>=20
> unlock can't fail, we have no way to cope with that.
>=20
> If unlock does not result in the MMMIO returned to host control then
> the system will surely MCE.
>=20
> This should have nothing to do with a crashed device, the disposition
> of the MMIO is under TDX module control, revert it back to host and
> accept you get AERs for the incorrect T=3D bit if the device isn't syncd.
>=20
> The OS would have to kill the SPDM session and FLR the PF to bring it
> all back.
>=20

Agree but we were talking about different scenarios. Your description
is about real device hang, while mine is about unlock failure from
guest p.o.v. which can be caused by either hardware issue or host
software issues. Or a malicious host may report success w/o actually
doing anything.=20

My point was that the guest can just assume unlock always succeed
and rely on the secure firmware to ensure future operations blocked
in case of incomplete unlock. We don't need to do anything special
within the guest tsm core upon GHCI unlock errors.
