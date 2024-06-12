Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7716EC0F
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 13:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198368; cv=fail; b=KMnIUGVhQS2Y+Eyn4LQbak4ZK9VE23cBSQda/1MXlfkoyFK6e7Vfw40rN5ISJ0LTmyUlezO8m4rvXbgLlRgpsY4g06CoKCvfuilRF1mealIffy+akn/ak3DUXy/EcdTtwULr2EMLN1/TpxZtvICDhDt+9fU2cwXbmhj8G8pu7V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198368; c=relaxed/simple;
	bh=nQOCpGmG3UjxxQUDRwppPYUH8Z/U2FFbOjttVOu9v1Q=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NbLK9A+275Cl+OktEqbvvJyVpjNCPhLFsd7YwQuTm0tSRz4jPT7TvZzQRAcaYZTSOrVnwflJ6Edu3dyCh6egOBNfpoKN8kgsQTljFEC9lzOINxW5SunYKAWN6V5STbfkhejegO/yhtpVRbQr39+11Ij+K1xRkdGmOv+IMQjx9ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIRloe1s; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIRloe1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718198367; x=1749734367;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nQOCpGmG3UjxxQUDRwppPYUH8Z/U2FFbOjttVOu9v1Q=;
  b=dIRloe1sWEmiBuDPummPjWHu9otZpdyjnzYpIh9gNzrkYPpbxhv0hPl7
   a5wI1xPlauQJv2xzATZ0vdI1NTegjDJSEGjn9l8tj0NUZf0fp6UZLGgq6
   cpQCwMpKoXM3O1ZPOxFpvc60qb1KEP8ugHHJ3g7UojzCM97VDjPHsWRMh
   xLlFRuLsCr1TXI3cf9i+FGlsdrsy8qOpfub3gnpCXgjHVyAq44+RXmxCa
   lwb1Zd+6E4V+G2jfeCI7HELb7nEfYCWdqvIdHA8viPpk8Iua4xGkPWyhl
   i6CHQUmlKdWxYvEXRnt7H0HJ7+543KOpsVoZnh1JnJlE6SESrCtBKsF1+
   A==;
X-CSE-ConnectionGUID: 0GEj+KoOQ9mwprIwVbR8ow==
X-CSE-MsgGUID: oKrbgbJJSkyGuspU54zjxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32445486"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="32445486"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 06:19:26 -0700
X-CSE-ConnectionGUID: FdnzLiJLRUiEA2FgCmPYTg==
X-CSE-MsgGUID: OasQkfHhQRqouA89CxPAaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40260864"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jun 2024 06:19:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 06:19:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 06:19:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 06:19:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q54PHih/qowkXhpFaevXO3/V4urs02/Q0JqLs6u+EtGvX3wXo11M6KPmQp/VLofwxvES0d80ug+e+fvGLka3SCJt4hpx7cNCVJuwYWjX2INsKGuW+42yLEyboODGs2x7y8c45DL8IwaGcu7zEhRMJ56rdUYNLZmDvPnaOzdRFNSET5WxdLZjMC4uOLCZwyCfo//kD99+Gpivgyrt5Eph9+AfX3+ENw3QuZ3a+l95m1+c7/5SKKZngFySF9f3Be3ONIyzEBRvdQcy5pwif9JYHWuYLcibNJ7FcoR0dGQjlP5q2unkqvVv0a88MZt1+okJOpdwKji/QFowA4cXQIyWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQOCpGmG3UjxxQUDRwppPYUH8Z/U2FFbOjttVOu9v1Q=;
 b=X9FmtNe9E9cAusGsiXSQQVng7vsAr5+ssdPtGGZaojDIKvB/G1+CNRZDrPxq/dIXi8x769L4SckEev6mI8A8GV40MI2ENBHnfL1Ywjq77UXXeU0x1dyaAPMPoFRul4BfVwDcE39IOTJEiq1ZNphJgs/kfVHwPtcMaUZbY4ngGJtSgjJ3tsGCvOttPHB9LjrRjWYWOWmb5xn1Edv32xSvXRAboCVMDzFxCW0332lZhopl3b6ritPM/xjMAgDKCacZzMrIApIHl9ZDmTySs5PgIbnYob1/VFZMBeUlzsMli/GwuGNi6v8GTqsZSs+pjU5xMd/Op1XrUX+38njTtsDUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.20; Wed, 12 Jun 2024 13:19:21 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 13:19:21 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Graf, Alexander" <graf@amazon.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
Subject: RE: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Topic: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Index: AQHanZPnXDME9v4Jq0aAj3sHCS9+NrG8kbKAgAAFESCAABcUgIAHiQiAgAALKQCAABGvMA==
Date: Wed, 12 Jun 2024 13:19:21 +0000
Message-ID: <DM8PR11MB5750FB4A0C87D13CACB11D5AE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
 <DM8PR11MB5750B08CA4CBFD459268A42CE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
 <98756bac-8de3-4eeb-97b2-9fa0bcf869ff@amazon.com>
In-Reply-To: <98756bac-8de3-4eeb-97b2-9fa0bcf869ff@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|PH8PR11MB6657:EE_
x-ms-office365-filtering-correlation-id: 3b8f4dd4-a27c-4a2c-4433-08dc8ae2458d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|1800799016|366008|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?dDgyS3VXNnpYVFdTQ0dRbGxzRENqYWhEUjhETEg5LzRYdG0rczhHN1dDa1Rj?=
 =?utf-8?B?NllITSt4QjJuRXlQOWw2aVVTM2RBVkhHU3F4SWhsSEdadFgyYXlKM3F4aXFM?=
 =?utf-8?B?ZVdqYmFBM0ZpelAyd3lUN3VJZ1owczl2alI1QlZ0OWlGVGRxWDhmK0Q2Y3cr?=
 =?utf-8?B?R0NCTUl6UjlrSmVhb2ZzUzJSVDhsdmw3b29iWGlTeHNjTklxVjRDTU9pZFUr?=
 =?utf-8?B?cTVzY0RPSU9kSzJaUDg5T29qNjNzbWY0aUJwL3VCTDNVQzhuYjB2R1FWcGVh?=
 =?utf-8?B?bkJrSFJ2b3l4WS8rdnhrWVhKdVVqb1BYN0UxYUZFdE5wS0tjWVZqNW9Gbm55?=
 =?utf-8?B?RXB5Wmt1OEFKR3BSMmRtZDdqM2hJMEEyRkRsNWdocFFkZ3pZV3JMWEUwbmxo?=
 =?utf-8?B?RENBWmRzQ2ZlVkRvaW8vU0dMMFdhL2JYcVhVTnV1aG5zV1BVeEh3NnBYU2ln?=
 =?utf-8?B?YW9jakk1b1U3d3Bjb01jT0FWd0hEZ0pMSVhlM1hZeVU1d3VKbHZneGMvT25X?=
 =?utf-8?B?dm0zUk95aFNMVmhraXNMY0JMMGZUNFRoOVRnZ25RbEthaGlIdXNIRm90T2Ex?=
 =?utf-8?B?TGIzZHpIS0JsT2xWeDV4UmpmNzNpb1ZkdHBWV2xacTBVMzJTUWxlR3J5eVV2?=
 =?utf-8?B?UjBZZmc4cFJWbGxob1Q4SFRvVDlKT1RxcGJ5Wk15c2FiSGJsaGNmOVFLYkxS?=
 =?utf-8?B?RG53KzRvWlUycVdJV0xPMm16YnFOT3RjR09UVkZXSVpKMHM3MUtrNFAwS0ZK?=
 =?utf-8?B?bFlIL2VBbzRaMEt1RUdodERmR0hScWViVTZ4YjVjUlpOVXpFOUxIb3pnNUhq?=
 =?utf-8?B?SVNQY0RVamJmQW9yQnRlWTR0L3pLZEpNT251OFNLcmw0VU1oVlc0ZktHRjRx?=
 =?utf-8?B?VlI0TVdhZUFsK1ZoMFoyMFFXaFNDL0FzTFdZQ0Y3Y1FPaUdZZm02bm9jZDB2?=
 =?utf-8?B?S1YvRDJ4b3Z4YzR4VEU0dnhIMCtJNys3bWZmTDRUOHMxb3NxOEhnVWEwL2ZJ?=
 =?utf-8?B?WkZLUWViT0wvZjA4aWhoOGkvL0Q0ZTFFUDhlcGFPSjg5UmRlOTN1TGFOQnJl?=
 =?utf-8?B?VERjOHVGNzhueVQ0TU00a3I3a1R5TzdLRVAyR2hWTGwvTzFoK1BVVVltRmVI?=
 =?utf-8?B?aDlUbFM3dm1sQmNaZDNKNnp2T2VLbytaQ1lDRFdXRSs0Z0R4MHlEMGtTVWZj?=
 =?utf-8?B?Z2Nzd25uMkV4MGIycHRHOGJxZ3VuUk1Xam5ZaGxJWmdnTU95Uk9mTzhITS9q?=
 =?utf-8?B?dm02Zjk1QnN5STI2MmZEQmNOay81dUZGS1ZWdGlPTWVFT2dVTDFQMlMrVzli?=
 =?utf-8?B?YjZycTEyWG5TS05NNXlyazZyYkFKUDlSajVnMzNRMTZzTmpRa2VYWmdnQiti?=
 =?utf-8?B?ZCs1OVJ2RlZrb0NoU2hnOTk3ZDBMR0M5VkRHbVlPc2lnMDVpQndYR0lNNGxS?=
 =?utf-8?B?RkY0aUtZdmgrQS9mZXZyd3VPVUZua0pKaThRcG5DTE1HU014MFBOd3hDSHRG?=
 =?utf-8?B?RUpGQVJheUtxcWNOTXQrYWFZT21hQ1pOMVQrWWh4cWpMNTRWSm5SclN6QmRz?=
 =?utf-8?B?OUNJUjRyOHcvMUxZeUIxSTVLRFFhOFpSYXM1dzZTSXdLd0FPRXRhdWd1Q3JZ?=
 =?utf-8?B?djdxdnBhSkl3NU9kTmcwbVJmaXVZNTkreDZOT2hWc08xYUd4MFRhZ3ExK2Y5?=
 =?utf-8?B?U2FCaHlETG1zNTByYmdZcUVWQlkxSWVKOHQ1czBxWk12eTEyVnhHZlBSN0Jh?=
 =?utf-8?B?SmJWRHQ3bzFiMGI2aXhjZ3dFS2Y3QklBZ2JScVFYeFlsMUltYVVObWVldVhm?=
 =?utf-8?Q?joSAZstYwrguuTkJx/2jiVnhmHGzq+Gf7sQ5s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(1800799016)(366008)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHBCMU9SdXRwd0Zhenh3WktXMy9XdFdmU3M0amd0RFdSVjRDSldCdUd3Vk9v?=
 =?utf-8?B?SVoyUWtHeXA4azJ0TEt3VFhZTFFVQ0lwYSttbUd6MUh3TVV2ZDdRWXpPZThs?=
 =?utf-8?B?bWJmSUJmYjRyNXNtNWtsdzExUzFSUkNSb0Y0NGVEWHlQc201eHNybmY5aWM1?=
 =?utf-8?B?bExqUGJnclMwbjNxMlh0OXl3KzBBNzgvdFZsUXNmMnZ3TjBmVkgzRzBNSERj?=
 =?utf-8?B?cnJHb1FXNVUybGdNcUxTODM1b3BHbXJxWDk1NkxPWHNPaXc0VlJhRXloSWpw?=
 =?utf-8?B?bnBTaWlnNE1OR2xXZTNRWVQ3YkV5WmoyVnNOR1BhT2NwQUFZb1g0NEVWYkF4?=
 =?utf-8?B?U3Vob3BDRjNlTmpPaVBPcWZLU2hHUnZNdGRHNVBMZHJYRkVBamo0VEJkdHd1?=
 =?utf-8?B?TDRJWWFlUlBkcVVkV0xKZ0tBZHplYmFNRUZuWEZudE4zbDM5YzI3cXhtSFR2?=
 =?utf-8?B?SVBOZHl4eUVOS3JGZ2g1dkxBVVBRbWs3aFhRb2tqUG9FeTJsRnBHekw4bGY2?=
 =?utf-8?B?THVYZm13QUoyWXUxaU5rYnl5L1AyVVMxSDBWMnN6VWFVaDVwczdVOHF2bVk5?=
 =?utf-8?B?UDZFMXJSb3hVcmlqYUtneVZwMVFPcGwyNG16UlluMURacU9hZXd1QzB4c0dz?=
 =?utf-8?B?cG9pakVNU2IrcGNLakx3N2hvSVZOUXlXT3BudXQyK1JQWjljWVpzVWpqdURV?=
 =?utf-8?B?cVlPSVVwY01kaFpteEQ1bDlCVUw3elBwUElMdjdWV1N3OURGWmJyNllrT3B3?=
 =?utf-8?B?SVZrMkQrMUMrNDMxZE9rM09ZTWtkZ2I2Ny9mRm4yV2dlUURKWXI4d3VHS3lT?=
 =?utf-8?B?QjFNNlRtRnFCOHBlN2tDdEExR0NmTndjNVJKTUZTUzdDUmNkK0JEVlMva0xk?=
 =?utf-8?B?VVdOTit3Ry9FUXlYcHNodCtkRTNaTXAwSWx4ai95UVdsZC9pazZCRjg4UTM4?=
 =?utf-8?B?OG9wR2d0MGxVei9zMEhFN3Jua0NmVTVmUTRqQi9CZW9GazZINUpZY0MxV28w?=
 =?utf-8?B?ek5taXZTd0VZUVRCRFBVUEZnc1dWWE1Lb0ppSFMybG5BREJTTjQxYjdWRUF4?=
 =?utf-8?B?S25xSnEyOTIxdWwzdE9IYlhvSzViSFRYa0ZFQXJ1aFNENHhWRUxyRU5IeUl6?=
 =?utf-8?B?R2NmTlExeVJ4RThwUDVuclpmYTJsVHB6ZGprWTJMa1NTV05NOURZRFFtekkv?=
 =?utf-8?B?MERuaktOV0VnZGNsaVpweGhLZmdsc1ZKaHh5eUVJaGtpK1puV2R5dnIwT0t3?=
 =?utf-8?B?SmFJWmkvdWVtbmlHaUhLNjlkVWQ5MjBYb3VpaHcxYXZJOXFUOE8zZXhyOHYr?=
 =?utf-8?B?U3pMa1FVaGZPNFJhWExLay9aL29qTlJkREM3bUx1SnFzQWpBSGw1VWtCblNw?=
 =?utf-8?B?dldQbUsyMUQ1V0FwdDRuZThET3JvZWJZTGtndlE1RUNMdDU1OVI4SW0yQVlO?=
 =?utf-8?B?NFRoYWhzZTVvY2ljaXY4RUgvWU00RnQxSmNsUThERVd6czVvQ2FUNFB2T2V4?=
 =?utf-8?B?QmplNEN0Q2pLVWpZbW1ab085YUlHUlI3cHNwTk1LSkZCVTFSMk5XUGhVaGxG?=
 =?utf-8?B?U2lGdVVIUXdrdVQrdmlYREVQVjFNekJ2N0hFZjZBTkgyQWJ0VjNqVEE0eE1s?=
 =?utf-8?B?Yk4ySGMrMWd5RlBxdWdSNHZLY1dvSkcwRFltNnd2R0VPMXRJcFNHNFgrSFVu?=
 =?utf-8?B?RStSMW5HWURzWUN3OFlUNGUzUEJOOElQY0pBMTV4TU03UHVMWVYvaG8vOWFG?=
 =?utf-8?B?djNLcXEreGxMSFdRWFl6MkprY0VJMmF1bzVvVGF3RmowY2dSSzdPb2JkaDNU?=
 =?utf-8?B?L0FTaTJNbmNXb2tFRnVVRXJRRjdsbVZIT0pGcHJrN1haMVF3MEJUTzg3THA4?=
 =?utf-8?B?NThaeDhUY3hndFQxcGcyczBPK2JYd1AvWGxHK2xZeGJWcHU4RGpkKzhvaU1X?=
 =?utf-8?B?YkJmS2xsUGhJeHd4UlFnZi90MDZjZVBzbjB4ZzBVb01teFdFWThGc0RkQ2Vr?=
 =?utf-8?B?cXZubExRbHlSOElBZVlsQjBWbDA3cnpXMWI3ZWtsVmlvOFZVaVA2UkY1bDYw?=
 =?utf-8?B?UGUrbG12MzViQTcyUXcxdnBma3BVbUFHTVlTMTFVcnZRR0hDODlCeWpXY09w?=
 =?utf-8?Q?R2HTlCuFF/7wSc9HmjY886i3I?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8f4dd4-a27c-4a2c-4433-08dc8ae2458d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 13:19:21.3780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjuzLrM+ypKHKIpZHEKtmj280D4oKpnnxNKFkSOm0MNqWIa49hoxeLn//iRGteveE1lytflfQMTpYVrq9hc8BmHUvmm/n09BCCvL0tBX5dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
X-OriginatorOrg: intel.com

DQo+IEhpIEVsZW5hLA0KPiANCj4gT24gMTIuMDYuMjQgMTM6MTksIFJlc2hldG92YSwgRWxlbmEg
d3JvdGU6DQo+ID4+IE9uIDA3LjA2LjI0IDE2OjQ2LCBSZXNoZXRvdmEsIEVsZW5hIHdyb3RlOg0K
PiA+Pj4+IEhpIERhbiwNCj4gPj4+Pg0KPiA+Pj4+IE9uIDAzLjA1LjI0IDIxOjU1LCBEYW4gTWlk
ZGxldG9uIHdyb3RlOg0KPiA+Pj4+PiBIaQ0KPiA+Pj4+PiBOZXh0IEZyaWRheSwgTWF5IDEwdGgg
YXQgOWFtIFBEVCwgd2UgaGF2ZSBhIENvbmZpZGVudGlhbCBDb21wdXRpbmcNCj4gPj4+Pj4gZGV2
c2VjIC8gQm9GIC8gRGlzY3Vzc2lvbiBHcm91cCAvIFNJRyBjYWxsLiBFdmVyeW9uZSBpcyB3ZWxj
b21lLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBUZW50YXRpdmUgYWdlbmRhIGluY2x1ZGVzIFJUTVIgQUJJ
IHYzIGRpcmVjdGlvbiBhbmQgVEVFIEkvTyBuZXh0IHN0ZXBzLg0KPiA+Pj4+IEkgaGF2ZW4ndCBz
ZWVuIGFuIGVtYWlsIGZvciB0b2RheSdzIGNhbGwsIHNvIGxldCBtZSB0aHJvdyBteSB0b3BpYw0K
PiA+Pj4+IHN1Z2dlc3Rpb24gaGVyZToNCj4gPj4+Pg0KPiA+Pj4+IEkgd291bGQgbGlrZSB0byB0
YWxrIGFib3V0ICJjb25maWRlbnRpYWwga2V4ZWMiIHRvZGF5OiBBIGtleGVjIG1lY2hhbmlzbQ0K
PiA+Pj4+IHRoYXQgYWxsb3dzIHlvdSB0byBkZXN0cm95IHRoZSBjb25maWRlbnRpYWwgVk0geW91
J3JlIGluIGFuZCByZWNyZWF0ZSBhDQo+ID4+Pj4gbmV3IG9uZSBiYXNlZCBvbiBhIHBheWxvYWQg
b2YgdGhlIG9sZCBvbmUuIFdpdGggdGhhdCwgd2Ugd291bGQgaGF2ZSBhDQo+ID4+Pj4gdmVyeSBl
YXN5IGFuZCBjbGVhbiBtZWNoYW5pc20gdG8gYm9vdHN0cmFwIGEgVk0gaW50byBhIGZ1bGx5IG1l
YXN1cmVkDQo+ID4+Pj4gbmV3IGV4ZWN1dGlvbiBzdGFjay4NCj4gPj4+IEludGVyZXN0aW5nIHRv
cGljLCBJIGFtIGN1cmlvdXMgb2YgdGhlIHJlcXVpcmVtZW50cyENCj4gPj4+IFNvdW5kcyBsaWtl
IHlvdSB3YW50IGEgbG9jYWwgZmFzdCBtaWdyYXRpb24sIGkuZS4gYSBtaWdyYXRpb24gdG8gYSBu
ZXcNCj4gPj4+IENvQ28gVk0gb24gdGhlIHNhbWUgcGxhdGZvcm0/IEkgZ3Vlc3MgdGhlIGRpZmZl
cmVuY2Ugd291bGQgYmUgdGhlIGFic2VuY2UNCj4gPj4+IG9mIHRoZSBvbmxpbmUgbWlncmF0aW9u
IHBoYXNlIHNpbmNlIHlvdSBhcmUgcHJvYmFibHkgb2sgc3RvcHBpbmcgdGhlDQo+ID4+PiBvcmln
aW5hbCBDb0NvIFZNIGZpcnN0Lg0KPiA+Pg0KPiA+PiBBbG1vc3QuIEkgYmFzaWNhbGx5IHdhbnQg
dGhlIFZNIHRvIGJlIGFibGUgdG8gcHJvdmlkZSBhIG5ldyBlYXJseQ0KPiA+PiBtZWFzdXJlbWVu
dC4gU28gdGhlIG9wcG9zaXRlIG9mIG1pZ3JhdGlvbjogV2l0aCBtaWdyYXRpb24sIEkgd2FudCB0
bw0KPiA+PiBwcmVzZXJ2ZSBwcmV2aW91cyBzdGF0ZS4gSGVyZSwgdGhlIG1haW4gbW90aXZhdGlv
biBpcyB0byBnZXQgcmlkIG9mIGFueQ0KPiA+PiBwcmV2aW91cyBzdGF0ZSBleGNlcHQgdGhlIG5l
dyAic2VlZCIgZm9yIHRoZSB0YXJnZXQgVk0uDQo+ID4+DQo+ID4+IFRoZXJlIGFyZSAyIG1haW4g
dXNlIGNhc2VzIGZvciB0aGlzOg0KPiA+Pg0KPiA+PiAxKSBNZWFzdXJlbWVudCBwdXJlbHkgYmFz
ZWQgb24gaW5pdGlhbCBsYXVuY2ggbWVhc3VyZW1lbnRzLiBJZiB0aGUgZnVsbA0KPiA+PiBPUyBp
cyBpbnNpZGUgYW4gaW5pdHJhbWZzLCB3ZSBjYW4gcHJvdmlkZSBmaXJtd2FyZStrZXJuZWwraW5p
dHJhbWZzIGFzDQo+ID4+ICJzZWVkIi4gVGhlIENvQ28gZW52IHdvdWxkIG1lYXN1cmUgZXZlcnl0
aGluZyBhbmQgSSBoYXZlIGFuIGVhc3kgcGF0aCB0bw0KPiA+PiB2YWxpZGF0ZSBhdXRoZW50aWNp
dHkgb2YgbXkgdGFyZ2V0IGVudmlyb25tZW50LiBJIGFsc28gaGF2ZSBhbiBlYXN5IHBhdGgNCj4g
Pj4gdG8gdXBkYXRlIHRoZSBWTSBhbmQgdGhlbiBtZWFzdXJlIHdpdGhvdXQgcmVwbGF5aW5nIGFu
eSBldmVudCBsb2dzLg0KPiA+Pg0KPiA+PiAyKSBVcGRhdGUgU1ZTTSAob3Igc2ltaWxhcikuIE9m
dGVuIHRvZGF5LCB5b3Ugd2FudCB0byBpbXBsZW1lbnQgVFBNcyBhbmQNCj4gPj4gaW5zaWRlIGEg
aGlnaGVyIHByaXZpbGVnZWQgY29tcG9uZW50IHRoYXQgaXMgcmVhbGx5IHBhcnQgb2YgdGhlIFZN
LiBUbw0KPiA+PiB1cGRhdGUgaXQsIHlvdSBjb3VsZCB1c2UgaW4tVk0gbWVjaGFuaXNtcywgYnV0
IHRoYXQgbGVhdmVzIGEgcGF0aCB3aGVyZQ0KPiA+PiB5b3UgYm9vdCB3aXRoIGFuIG9sZCB2ZXJz
aW9uIC0+IGV4cGxvaXQgLT4gdXBkYXRlIHRvIHRoZSBuZXcuIElmIHdlDQo+ID4+IGNvdWxkICJy
ZWJvb3QiL2tleGVjIGludG8gYSBuZXcgU1ZTTSwgd2UgY291bGQgcmVhc29uIGFib3V0IGl0cw0K
PiA+PiBjb25maWRlbnRpYWxpdHkgd2l0aCBhIDEwMCUgZ3VhcmFudGVlLg0KPiA+IEkgdGhpbmsg
SSBhbSBzdGlsbCBjb25mdXNlZCBvbiB0aGUgcHJvYmxlbSBzdGF0ZW1lbnQuIFlvdSBhcmUgc2F5
aW5nIHRoYXQNCj4gPiBDb0NvIGN1c3RvbWVycyBzaG91bGQgYmUgYWJsZSB0byB1cGRhdGUgdGhl
aXIgY29jbyBWTXMgKHdpdGggU1ZTTSBvcg0KPiB3aXRob3V0KQ0KPiA+IHdpdGhvdXQgQ1NQIGlu
dGVydmVudGlvbiwgd2hpY2ggZnVsbHkgbWFrZXMgc2Vuc2UuIEJ1dCBhdCB0aGUgc2FtZSB0aW1l
DQo+ID4geW91IHdhbnQgdG8gZG8gaXQgd2l0aG91dCBhIGNvY28gVk0gcmVib290ICh3aGljaCBp
cyB0aGUgZWFzaWVzdCB3YXkgb2YNCj4gPiBzb2x2aW5nIHRoaXMgd2l0aCBleGlzdGluZyBtZWFu
cyksIGJ1dCB2aWEgc29tZSBraW5kIG9mIGZhc3QgcnVudGltZSBrZXhlYw0KPiA+IG9mIHRoZSB3
aG9sZSBtYWNoaW5lPyBXaHk/IElmIGN1c3RvbWVyIGlzIHVwZGF0aW5nIGl0cyBjb2NvIFZNLCBp
dCBzaG91bGQNCj4gPiBiZSBvayBmb3IgdGhlbSB0byBzYXZlIGRhdGEgYW5kIHRha2UgYSBmdWxs
IHJlYm9vdCwgd2h5IG5vdD8NCj4gPiBJIGRvIGFncmVlIHRoYXQgdGhlcmUgaXMgYW5vdGhlciBw
cm9ibGVtIGN1cnJlbnRseSB3aXRoIHRoZSBmYWN0IGhvdyBoYXJkDQo+ID4gaXQgaXMgdG8gcmVh
c29uIGFib3V0IHRoZSBzdGF0ZSBvZiB0aGUgZnVsbCBTVyBzdGFjayBvZiBDb0NvIFZNIChtYW55
DQo+ID4gbWVhc3VyZW1lbnRzLCBtYW55IHVwZGF0ZWQgY29tcG9uZW50cywgbG9uZyBldmVudCBs
b2csIHRoaW5ncyB0aGF0DQo+ID4gbWlnaHQgbm90IGdldCBtZWFzdXJlZCwgZXRjLiksIGJ1dCBp
dCBzZWVtcyBhIGRpZmZlcmVudCBwcm9ibGVtIHRvIHRoZQ0KPiA+IG9uZSB5b3UgYXJlIHN0YXRp
bmcgb3I/DQo+IA0KPiANCj4gSSAqd2FudCogYSBmdWxsIGNvY28gVk0gcmVib290LiBCdXQgSSBh
bHNvIHdhbnQgdGhlIHByZS1yZWJvb3QgVk0gdG8NCj4gcHJvdmlkZSB0aGUgaW5pdGlhbCBsYXVu
Y2ggZGF0YSBmb3IgdGhlIHBvc3QtcmVib290IFZNLg0KPiANCj4gVGhlIHR5cGljYWwgcmVib290
IGNhc2UgKENvQ28gb3Igbm90KSBpcyB0aGF0IGEgVk0gYWx3YXlzIHN0YXJ0cyB3aXRoDQo+IGlu
aXRpYWwgbGF1bmNoIGRhdGEgdGhhdCB0aGUgVk0gcHJvdmlkZXIgcHJvdmlzaW9ucy4gVGhhdCBt
ZWFucyBhZ2Fpbg0KPiB0aGUgInR5cGljYWwiIHBhdGggaXMgdGhhdCB5b3UgYm9vdCB3aXRoIGlu
aXRpYWwgbGF1bmNoIGRhdGEgdGhhdCB5b3VyDQo+IFZNIHByb3ZpZGVyIGRpY3RhdGVzOiBFaXRo
ZXIgZXhwbGljaXRseSAobGlrZSBpbiBFQzIsIHdoZXJlIHdlIGdpdmUgeW91DQo+IGEgcHVibGlj
bHksIHJlcHJvZHVjaWJseSBidWlsdCBPVk1GIGJpbmFyeSkgb3IgaW1wbGljaXRseSB0aHJvdWdo
IGENCj4gc2VsZWN0aW9uIG9mICJrbm93biBnb29kIGxhdW5jaCBkYXRhIiB5b3UgY2FuIGNob29z
ZSBmcm9tLg0KPiANCj4gWW91IGNhbiBpbiB0aGVvcnkgZXZlbiBzZXQgdXAgc2lkZSBjaGFubmVs
cyBmcm9tIHRoZSBjdXN0b21lciB0byB5b3VyDQo+IHByb3ZpZGVyIHRvIHVwbG9hZCBuZXcgImtu
b3duIGdvb2QgbGF1bmNoIGRhdGEiLiBCdXQgdGhhdCdzIGNvbXBsaWNhdGVkDQo+IGZvciBhbGwg
bGF5ZXJzIGJlY2F1c2UgaXQgcmVxdWlyZXMgQVBJIHByaXZpbGVnZXMgdGhlIFZNIG1heSBub3QN
Cj4gb3RoZXJ3aXNlIHJlcXVpcmUgYW5kIGl0IG1lYW5zIHlvdSBuZWVkIHRvIHN0b3JlIGFuZCB0
cmFuc2ZlciB0aGF0IGRhdGENCj4gYWNyb3NzIHRoZSBjb250cm9sIHBsYW5lIG9mIHRoZSB0YXJn
ZXQgbGF1bmNoIHN0YWNrLg0KPiANCj4gTXkgcHJvcG9zYWwgYWJvdmUgd2FzIHRvIGRvIGEgcmVi
b290LCBidXQgaW5zdGVhZCBvZiBzZWVkaW5nIHRoZQ0KPiAiaW5pdGlhbCBsYXVuY2ggZGF0YSIg
ZnJvbSB0aGUgcHJvdmlkZXIsIHlvdSBqdXN0IHNlZWQgaXQgZnJvbSB0aGUNCj4gcHJlLXJlYm9v
dCBlbnZpcm9ubWVudC4gVGhhdCB3YXkgY3VzdG9tZXJzIGNhbiByZWJvb3QgaW50byBhbnkgdmVy
c2lvbg0KPiBvZiBjb2RlIHRoZXkgbGlrZSBhbmQgMTAwJSBvd24gdGhlaXIgbWVhc3VyZW1lbnRz
IGluIGEgVk0gcHJvdmlkZXINCj4gYWdub3N0aWMgd2F5Lg0KPiANCj4gS2V4ZWMgY29tZXMgaW50
byBwbGF5IGJlY2F1c2UgZnJvbSBhIGN1c3RvbWVyIGV4cGVyaWVuY2UsIHRoZSBmbG93DQo+IHNo
b3VsZCBpZGVhbGx5IGJlIGFzIGVhc3kgYXMgc2F5aW5nICJrZXhlYyBtZSBpbnRvIHRoaXMgbmV3
IGZpcm13YXJlIi4gSQ0KPiBzYXkga2V4ZWMgaGVyZSBiZWNhdXNlIGl0J3MgdGhlIGNsb3Nlc3Qg
YW5hbG9neSB3ZSBoYXZlIGluIExpbnV4IHRvDQo+ICJyZWJvb3QsIGJ1dCB3aXRoIGEgcHJlLXJl
Ym9vdCBwcm92aWRlZCBwYXlsb2FkIi4gVGhlIGZhY3QgdGhhdCBrZXhlYw0KPiBkb2Vzbid0IHBl
cmZvcm0gYSByZWJvb3QgdG9kYXkgYnV0IHNpbXVsYXRlcyBpdCB1c2luZyBmYW5jeSBzdHVudHMg
aXMgYW4NCj4gaW1wbGVtZW50YXRpb24gZGV0YWlsIElNSE8uDQoNCg0KVGhhbmsgeW91IGZvciBj
bGFyaWZ5aW5nIHRoaXMhIEkgdGhpbmsgSSBnb3QgdG9vIG11Y2ggaW50byB0aGlua2luZyBvZiBr
ZXhlYw0KcnVudGltZSB1cGRhdGUuIEkgdGhpbmsgdGhpcyBjYW1lIGZyb20geW91IG9yaWdpbmFs
bHkgc2F5aW5nIHRoYXQgeW91IHdhbnQNCnRvIHByZXNlcnZlIHRoZSAqcGF5bG9hZCBvZiB0aGUg
b3JpZ2luYWwgVk0qIGluOg0KDQoiIEkgd291bGQgbGlrZSB0byB0YWxrIGFib3V0ICJjb25maWRl
bnRpYWwga2V4ZWMiIHRvZGF5OiBBIGtleGVjIG1lY2hhbmlzbQ0KdGhhdCBhbGxvd3MgeW91IHRv
IGRlc3Ryb3kgdGhlIGNvbmZpZGVudGlhbCBWTSB5b3UncmUgaW4gYW5kIHJlY3JlYXRlIGENCm5l
dyBvbmUgYmFzZWQgb24gYSBwYXlsb2FkIG9mIHRoZSBvbGQgb25lICINCg0KQW5kIGJ5IFZNIHBh
eWxvYWQgSSB0aG91Z2h0IG9mIHNvbWUgc3RhdGUgaW4gbWVtb3J5LiANCg0KQnV0IHlvdSBqdXN0
IHdhbnQgdG8gcHJvdmlkZSBhIHdheQ0KZm9yIGN1c3RvbWVyIHRvIHN1cHBseSB0aGUgQ29DbyBW
TSBTVyBjb21wb25lbnRzIChzb21laG93LCB0YmQgZGV0YWlscykNCmFuZCBoYXZlIGEgd2F5IGZv
ciBjdXN0b21lciB0byBhc2sgdG8gcmVib290IGludG8gdGhpcyBjb250ZW50LiBUaGUgYWN0dWFs
DQpjdXN0b21lciBkYXRhIGlzIHN0aWxsIGNvbWVzIGZyb20gcHJvdGVjdGVkIGRpc2sgYW5kIHRo
ZSBmdWxsIGF0dGVzdGF0aW9uDQpwcm9jZXNzIG11c3QgYmUgZG9uZSBmb3IgdGhpcyBuZXcgVk0g
KHdpdGggY3VzdG9tZXIgc29tZWhvdw0KdXBkYXRpbmcgdGhlIG5ldyB0YXJnZXQgbWVhc3VyZW1l
bnQgZm9yIFZNIGluIHJlc3BlY3RlZCBLQlMpDQogYmVmb3JlIGl0IGNhbiBnZXQgYWNjZXNzIHRv
IHRoaXMgZGlzay4gDQoNCkJ1dCBzdGlsbCBvbmUgcXVlc3Rpb246IHdoeSBkb2VzIHRoaXMgbWVj
aGFuaXNtIGhhcyB0byBiZSBmcm9tICp3aXRoaW4qIHRoZSANCkNvQ28gVk0gaXRzZWxmPyBJcyBp
dCBpbiBvcmRlciBub3QgdG8gZGVzaWduIENTUC1zcGVjaWZpYyBtZWNoYW5pc20gZm9yDQpkb2lu
ZyBpdCB2aWEgc29tZSBDU1AtcHJvdmlkZWQgd2ViIGludGVyZmFjZT8gDQoNCkJ1dCBJIGRvIGxp
a2UgdGhlIGlkZWEgaW4gcHJpbmNpcGxlLCB3ZSBjYW4gaW5kZWVkIGN1cnJlbnRseSBjaGFuZ2Ug
b25seSBndWVzdA0Ka2VybmVsIHZpYSBrZXhlYywgYnV0IHdlIGRvbnQgaGF2ZSBhIHdheSB0byBk
byB0aGUgc2FtZSBmb3IgdmlydHVhbCBGVw0KYW5kIG90aGVyIHBvdGVudGlhbCBjb21wb25lbnRz
IGluY2x1ZGVkIGluIENvQ28gVk0gYXQgbGVhc3QgZ2VuZXJpY2FsbHkuIA0KDQpCZXN0IFJlZ2Fy
ZHMsDQpFbGVuYS4NCg0KDQo+IA0KPiANCj4gDQo+IA0KPiBBbWF6b24gV2ViIFNlcnZpY2VzIERl
dmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgNCj4gS3JhdXNlbnN0ci4gMzgNCj4gMTAxMTcg
QmVybGluDQo+IEdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRo
YW4gV2Vpc3MNCj4gRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50
ZXIgSFJCIDI1Nzc2NCBCDQo+IFNpdHo6IEJlcmxpbg0KPiBVc3QtSUQ6IERFIDM2NSA1MzggNTk3
DQo=
