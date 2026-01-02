Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A954924BBEB
	for <linux-coco@lists.linux.dev>; Fri,  2 Jan 2026 20:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767387171; cv=fail; b=CKJE0ZncV+/3cDzuWav4ghzBlW0xhHkSlcqt1vFF3/kYHRm+2y7PCl5VSXiji9iBhMKMxwUq7WTD0k1LEJsN/5cw0FypT+zjvs9U7iGp6/BZKIrw1MiEek6ukPu7pRhBj9jo2gjNWsBxa0sDeZ3AafaU7bWphtAF3rdW5WGX4c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767387171; c=relaxed/simple;
	bh=8ElEstKldNAqwCWafpp1VyhAAW4St550VWC/QUH2MeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UUa4369WDl/wTnB+AK/PDf7RH/pqqLqf3KaGS5g+mOCcRGHA6O2b5qVAWu5x8Vy/NSKk8Qb7gNYujYoX68QDSt05wb5PoSsg/Pr1OkMqMGz49pZCs5kZDWHxKLrRjK2OMxEiAHvPNuu37caxI5yemaXb3X3sTuQ9UtSGGlNrt3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps4HmpeD; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps4HmpeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767387170; x=1798923170;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8ElEstKldNAqwCWafpp1VyhAAW4St550VWC/QUH2MeA=;
  b=Ps4HmpeDdm74YPbsFfDTIozGyYTU5Hx0t7YKYQm27Ypbnm+N1QjhCEgr
   o6F0kMAVic5kBkxNM4lre/W3naexXTVmio7bSID1In1vqPvakAxBXIvqJ
   DwnF67KjczFnHICM68Guh+RNsi82aAy3DxOjvOsh5ruy/hmLkEFVajXYg
   8bHmVBdwFVZBZL2+ihtIpGiHZaqmQI1m/ZEq9kcq9aM/miTXLiO3PpKna
   SVScZkrPW8LOv3YQCE3GRL/qOcQJLyso4doRmBspnWYeEQ1Zy85IBwFuY
   //jiqhFUEZdKhwkkxl/0xc6C4rRmM4ZNc3DYEesEddL5U2cx63U+RnvG+
   Q==;
X-CSE-ConnectionGUID: CjIb9A+7THe/NNbNsKVxFw==
X-CSE-MsgGUID: Cmxcf5kFT3+G1gGl53BDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68919746"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68919746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 12:52:49 -0800
X-CSE-ConnectionGUID: RYETIIrrT1CXyAfqTLhOgQ==
X-CSE-MsgGUID: mUFh/KoCTMKvOkwxA58ZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201122328"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 12:52:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 12:52:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 2 Jan 2026 12:52:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 2 Jan 2026 12:52:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9BvDtk89dMmjUKJaLOunek8AtP5zeopACXrwXphpj+KWTpC5NeoHdogZXIl33YpKYAeIRFw0sDjCC2csoVLJY68COZPNtDVnhWvGzaqlWdy74g9t1D6bukbHxJSHgGIvPPJuIA9kPJlWWSGTfOqWhx58lXjHUOSjlDgq6pLv4hPUGAN4Xecb9wl5jHZLMDUvQnkoQxYVqCyJ9WDW30ve3kon6u6df+ZojtYbDqi4Zi3P2E6mC2ERe1rVX/nJmA+HD6sjMdiW2tP6vYX78b4jiRlyEXpZPtLBACIsgxiteAl1+ROMbDgQSiSobwrY5TVNFTYsfC7BHGDQuYeJ2Fgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ElEstKldNAqwCWafpp1VyhAAW4St550VWC/QUH2MeA=;
 b=EHEbgcikdam8bmCU9lLFzAewlaszuPtJgrPc80t0eWcMcvbbl/NhxtKp8sCev81MB1Wu85b3F9cKTYU7S71kZjYfVqx0xP8uSltEPpAASaKdtpvxgBJl4p29Q7t+bAupHte/YUC++OzYe4GYGnCl3+fFOrdEtWpjBLOtZZe6x9r6A/BefK9dige6C3LZGdMzy9f2V//YqmqPndS5g75AGjbesmaRGOMDq+6g14ojNmZ7v7kxxekPlbOS4r6Hy4kUOgRq75JUly53cJVcSd6BDF7cQn2/tullUcnmr+E1h32tHJvzi6TQpzGabhKZTxEsMgRGstDGQGJ2haVH6xOzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 20:52:43 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 20:52:43 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Gao, Chao" <chao.gao@intel.com>, "Huang, Kai" <kai.huang@intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "Chatre, Reinette" <reinette.chatre@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Williams, Dan
 J" <dan.j.williams@intel.com>, "Weiny, Ira" <ira.weiny@intel.com>,
	"Annapurve, Vishal" <vannapurve@google.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "sagis@google.com"
	<sagis@google.com>
CC: "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "kas@kernel.org"
	<kas@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
Thread-Topic: [PATCH v2 00/21] Runtime TDX Module update support
Thread-Index: AQHcMn7FzMherYaWPkiYhyI9Amp/nLTvVtiAgFCX5AA=
Date: Fri, 2 Jan 2026 20:52:43 +0000
Message-ID: <4bb43ec912f3bfb92d0f9071143b4b046d5db08d.camel@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
	 <aRSVB3TQxpgZPj+F@intel.com>
In-Reply-To: <aRSVB3TQxpgZPj+F@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|IA1PR11MB8100:EE_
x-ms-office365-filtering-correlation-id: d19ec61d-458d-496b-1b82-08de4a40e06d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SWpsTHcyR0hRc1FYM0JVY0lqMnJRWUtWVWpPSU54NUNWeTAwdEtKWjkwd3Bv?=
 =?utf-8?B?YWFBOG5UR29QdWFNZ2tSd3BPcmlBTllRb1RDUGtIRFZrdDNVL3FUbXJLNmFT?=
 =?utf-8?B?eU9uaWZ3M2w3NHh0QXZJcC9VQm80Y0hOT1VNZk10d21ZSm9XL2Z3cXNmK2F4?=
 =?utf-8?B?dUtwd1dDNEpjbVAwNlFTU21RZk9TeWcxRGp4ZVdoOElzY21OZUo5WDdGcTll?=
 =?utf-8?B?MzZSclJUNVBhNXlDNnQ2cDFvc2NYSnh4b3M3OXJnclFRU2ljcDZ2YnFEN2c4?=
 =?utf-8?B?aEo2Wm95VmRzZmhvYmVyUXZNcUgwQkczMXNmZHFTRUYxOWZHejI5Vld1SVFI?=
 =?utf-8?B?SFdZSG1mTDhleUdaOHhQWHBVUFZSV2ZvNXR4SVhkeUVQSWRRNnhUc0RZWXlr?=
 =?utf-8?B?ZWxUSXYzanZZWm1FQXFjaVhUMGRYYVBZenVWbnNrQjhNbWZVTUFKbVFaYUU0?=
 =?utf-8?B?R2Q4bUcrNDRPcm9DbFZwUjIvUnp1ZUpzVDhUcTBFMG11NngxMmtNYXZTOU1r?=
 =?utf-8?B?eFZBZnh3K0ZXeVp2TDMxTE96clI5eDFqM3Ivd1UwcDJ1K2ZNNkl1TEx6U2ZR?=
 =?utf-8?B?T2Q3WXZidEZ6TUxzR2tFT1JIOCsxQWk2U0MzS0hWNUlQQ09SQmNOS2FrTEFM?=
 =?utf-8?B?cWFscGJLWno2cXRXbjc5L0ltOWcwOEx6WTIzcGYxNXJvaG5JMHU1R2dGUFVk?=
 =?utf-8?B?VHhycW9obXJKZnAzcWN6eHp4TkloanRSc1V1SC90UVlUdWxqQlh0Q1hPK1Bw?=
 =?utf-8?B?cFZFenNxUW9ub1UyVy9NcUFyZHJSeWdnWTZSOXhtSHZUei9YR0pBWU5ic0Iz?=
 =?utf-8?B?bVgzQ0hvRXBBZmxUVWNjalF5T1JtSHhmWHpMUjNnZ1FweGZHcTdFRDd2MWdy?=
 =?utf-8?B?NnFGdWx4SXFoWWNJendCZ1BKb3ZIc3dsV3VvbHVGZC9GVWV5VGFZdnYybmRr?=
 =?utf-8?B?U0hUN3ZuY0ZKS0dxcmVsTnVpSXhTTVdpYmFQMS9VQUI5TTU1UVF0V2tYQXFC?=
 =?utf-8?B?NlhqWlNxT3N3Z0dHbXRwb1FjQm5HdXJ0b0NCYXBsdDdlcWhJNWVwMkxXeW1C?=
 =?utf-8?B?R24vZ3BhYis0aFZCWFJBenNZajVLQS9iTkFtSXVtTmZpU1ltRDBrYWpoUGVN?=
 =?utf-8?B?WGpPZ3FTanZrUWQ4akpTNkxHNmJOSXpacTR6a1h4QTBsMlJkU1dSSTM5TVd6?=
 =?utf-8?B?WG1JNUhVRVdZYk92bU1PZFpKcWdjZG5NUzd2R0pFT1RkNzZCaVpVeHVlWU15?=
 =?utf-8?B?U20wVGo1MG52YVVuYjhjVFpjcUtaQkZWbUs2T2VVeGhBZ1JGamVXSGt3NWdL?=
 =?utf-8?B?emxuMjNTVTQ2MXJTOHk4bi94TjRZQkR5alA2ZVIwcEd4RUNpTkcrS2wwOUpG?=
 =?utf-8?B?eFRJSjFOZUpBRTZTUXVnTVNPY2FLTWRKODRPNy9zUFRodXkrV25VaEVhOUdS?=
 =?utf-8?B?TWxTTnRmS0NxckI3ZHB2WVI0R0VLbGcrS25FbkVOS2NxRVlaVFVMM0hzaENF?=
 =?utf-8?B?WTE3YkhxVzZoOUlrOHJpeXo5QkNJczZ0VDZCUXB3L3NTRkdRUHpZL0diN0NE?=
 =?utf-8?B?Ylc2NDg0QVV0UkhOemJBRDBHV1ZnblBpZFlBVVFDVU5kUUZUZE5yN3NOME9m?=
 =?utf-8?B?R1BxQXRTM2NNR0l2SkhJTGZpT2JQSTlMSlFNRi9mZTlLZU9RNDVoVEdGOU95?=
 =?utf-8?B?eE5FejF5cTdvK041ZkVOSE5BTHN3VXNkbG15ZFFxU0c5NGJWQkxyYjNISjBr?=
 =?utf-8?B?akNIKzZGVVFkUUVjc2lFNDFhSFdJZllNKzFYSnRqTUZXTGhNb1hYTE5sSlZ2?=
 =?utf-8?B?R3N4SmJabzdsRmpqMXo0YUI1RU1NM2ZCTks4Ri9NZkNKK2FjWGdBOU0xa0t4?=
 =?utf-8?B?dkNpTXNJaXhXMUM2MGNWOFNoZElXRHZmY1pucE92bUM2VUhDOWI5S0xjVDZ1?=
 =?utf-8?B?M05ZLzErS2c1ODladGM4cm0rUzRPeFdSV0JpNFlUa1MwbEpVSHhEY0ZvcjRj?=
 =?utf-8?B?SVpNZm5IRUdmZTN4bHMwRkhMYzIrdmp5UURaamdWK0I5dVM1NDdhcHlONkFN?=
 =?utf-8?B?eUJrTy9XUE5YTjRHMlNYaXF6cVhJc016djFQQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3E5K2FzcUNRWGZsTkRuVkRMRmFuN3dEc0ZySmRsaVF6dHJ2VklaYnVzNWpl?=
 =?utf-8?B?YzlmUWFReE1JZFBodG1DSVhsNGN2aUM2ZGFLcDMyd25HVkxIemRsQXJaeXQ3?=
 =?utf-8?B?SGJhS0lkdmZ3NHFobkM4Q3RxSkticGZ1TWFES3NjYWw3RHZMTlB5RUlDTFh2?=
 =?utf-8?B?OTAwd2lLMTZGcElHbDdHNlF3eXZ4N1g4MzlXVFI4ZmhBUmc5Tkc3YjRCYnRS?=
 =?utf-8?B?dVJENy85amVEUUJIcXJJa1hiQ1hDcDcvMFNKVy85T2VVQkt1N1RyV3d5aGp2?=
 =?utf-8?B?VFA3WDVhcHRKV2VjbldvYTN5U0I1ZlN0Zjl4b2QwMUhuQzFDanI3ejVnZU9u?=
 =?utf-8?B?dVVJSjBuNHcrL3ZSankySngzc09Sbng0WUZOdEdibCtYWE1qbVRjbEswa3Zs?=
 =?utf-8?B?Yi81cHh5K09zeDFtRm5iKzZ2RmorQlE0N0NvUkdMTXZQRC9BaFV0Q2JYbFRx?=
 =?utf-8?B?NUdneDVFTmd3ZzFhVHZZdGFpM2hHOXRSU3ZjaWdxaEE5cVR0ZjNOWWROc1J0?=
 =?utf-8?B?azQ2dFpWRzJrSEtPcW5sWW9RMWFwWlVhdWl2QzJJT0NQVGtMRGVSbzl6WmYw?=
 =?utf-8?B?dVFYdnBvbm5ZK2Qza3kvaXM3VFNIanhuVDZhQWdwalpTZ3V4TVEzQmN5MXo3?=
 =?utf-8?B?UHhseXM3QUZzNmFQRFkyT0xaNGMwckFFQ1VKY0RxbXdWblB6Vll3NWJZb0dl?=
 =?utf-8?B?VXA4SE85WEFWYzdDY0grVjNRY2ZjNUxtUHZvOWRxWXhXWEFHd2RhTzhXUjdp?=
 =?utf-8?B?ZWJadHp5bVYvWkZDWjd3V09CNi9DbUMzaXRNc1VOWGF6MStHcEV5RWhYS3dP?=
 =?utf-8?B?c1NHNlJJWnNQODV6ZHJ3U2FxSHRBcEcxQzQyRG5XWS9xa0FvNWVZN2VMNzBK?=
 =?utf-8?B?NnlrVngrTFFKQ080bDBReElLdWJBbGdjQlJOSDdkS1d2TWRPTmxCMDF1c2tS?=
 =?utf-8?B?QzNSMkRIRno4Mmc5N3hEKy8rYytmZlM2cEJBQTVVMW5OVzd6cEZPT2V6MVdM?=
 =?utf-8?B?SThDODI4SDJEc1pzSjRNak0vYTVoOW5KTjFnT09vNFl6d0tkM1lRZlczc05L?=
 =?utf-8?B?QmZvemJvZ2I5TFNHbjl4djB6YUJTcmlIWnZpMW44YVJYbEZpQjkrODN5M2ZB?=
 =?utf-8?B?d2pZbG5DTVpmYWJqMzBBeEVxRlZxM1BIa1NWWkRYRk0zaVlVVXpQYU10SVNu?=
 =?utf-8?B?WTNkeFNyeG9BYjNlMlZWejlldUdNYjc4TnpzSjRSeHh2NVRydFJuMzNwOUp3?=
 =?utf-8?B?aFBEK3NiTWlaSFI4T2M3Z2tnQmcrWlkrYnA2VVZpbHZ3L09uYXZWSzJiOXF4?=
 =?utf-8?B?QnZXS056U2hYZFhqdU1pdUdMRTgvU1liNUV0WEs2OFpSSlNSTi9VcjlZMTdL?=
 =?utf-8?B?eURZeUp2SVVSaENUY2xFZmdEZ3hpVjUrb1dJYnMxcU9NMS9MVEQ0Tmw2aEhQ?=
 =?utf-8?B?bzBVQklBSjg4djF0dHUyMS9QZ1FwZGxHYVdNNThtV3NSM21kcGxPVjdVemxE?=
 =?utf-8?B?bHJYQUdkaU4xRmxYMm9lc1hHYlNvRFY0RTlBcDFzOFpnd3NlN3ZVUCtONkdH?=
 =?utf-8?B?NnJpKzBzSVU4bGs2MGozRGxsalQ0djdManB5bGZKZ0tkVjNSZVFTWkM1bUsw?=
 =?utf-8?B?S0VqMGFFOFlVbldrTGpFYUEwWjFaa1BRdmFEeUZLWjFIZmtIVVdsaE84cVhp?=
 =?utf-8?B?c0pkVlpvR2F3NEE3UXNuUCtIL09LSHdDQ0JSbzdvK2w1dk83WEthb0hnRk5a?=
 =?utf-8?B?aHB6Mm5Xdy9SdVZKL0hTSFQzVnJiRGlqMjNVNGJqR0dmcjFhSkVOb2N4Z1Zh?=
 =?utf-8?B?cWtick83aTkxaWpTZ05ieVk4QTVoeXEwMDNvSU0vckZYMHZrVTZYaGtpa2dC?=
 =?utf-8?B?SmUvMWR2empQOXpQYlVFdXBPTWNRbHNvc3pzVDhLbFJ0MGdmREk2T2tFUFF0?=
 =?utf-8?B?WFNCeUFvNlhBdThMVUNHK3VpOFQwN3lyVXNaZkRaTU5rQVEzOVJ6a0R4ZVV5?=
 =?utf-8?B?ZTJna01oWW5KL3lwNmo2V1hsanVJME44eVducHRpajM0aHpLZ205ajRPcGJW?=
 =?utf-8?B?QVdySlIxY0NXNGcvWVlUTldrTXNSN3NVTTZjUVBEVDYydnZDTDBBMytHMDNk?=
 =?utf-8?B?UHd0VmFDdG1VbkNFaUloZHh6SStURVc3VFF4cDd2QitXWDBWMnVyaVNzRGlU?=
 =?utf-8?B?dTZSSzNPZzAyRVdYWGV6Nzh4eGxKcmx4U1VRdU5yck1vUGRCU0JuM0w5Ukww?=
 =?utf-8?B?ckNiUVRhMVIvVnJSdk9jVitlR093bk9BTldnNTc2eFpBalExeDhqbHI0NTNy?=
 =?utf-8?B?elVjR0tmcUg2RXpmV2JUd3plRVJMOFpCM0s2V29aTGVGQW5kOGtxbFBqR2FX?=
 =?utf-8?Q?hqp9Vl9LR35WlXxE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45C5CA7E08940340B219EB23A55C6261@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19ec61d-458d-496b-1b82-08de4a40e06d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 20:52:43.6711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bq3e5MbR0jkZxYxqr1q2mwWa2MIS+ZN5suQefLbbVFhuRKcuEgCKeXxcCMpH9/e4NTZQzP2dqRpp/T7gU6lnOgg+/S1XhFQo0tX/QFO+Fks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTExLTEyIGF0IDIyOjA5ICswODAwLCBDaGFvIEdhbyB3cm90ZToNCj4gT24g
VHVlLCBTZXAgMzAsIDIwMjUgYXQgMDc6NTI6NDRQTSAtMDcwMCwgQ2hhbyBHYW8gd3JvdGU6DQo+
ID4gSGkgUmV2aWV3ZXJzLA0KPiA+IA0KPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
cnVudGltZSBURFggTW9kdWxlIHVwZGF0ZXMgdGhhdA0KPiA+IHByZXNlcnZlDQo+ID4gcnVubmlu
ZyBURFggZ3Vlc3RzLg0KPiANCj4gSGkgS2lyaWxsIGFuZCBSaWNrLA0KPiANCj4gV291bGQgeW91
IGJlIGFibGUgdG8gdGFrZSBhIGxvb2sgYXQgdGhpcyBzZXJpZXMgd2hlbiB5b3UgZ2V0IGENCj4g
Y2hhbmNlPw0KPiBJJ2QgYXBwcmVjaWF0ZSB5b3VyIGZlZWRiYWNrLg0KDQpJIGNhbid0IGFwcGx5
IGl0LiBUaGUgc291cmNlIGNvbW1pdCBpcyBnb25lIGZyb20gdGhlIHRzbSByZXBvLCBidXQNCmJl
c2lkZXMgdGhhdCBpdCByZXF1aXJlcyBhcHBseWluZyBhIGJ1bmNoIG9mIGRlcGVuZGVuY2llcy4N
Cg0KQ2FuIHlvdSBwdXNoIGEgYnJhbmNoIHNvbWV3aGVyZT8gV2hlbiB0aGVyZSBpcyBhIHN0YWNr
IGxpa2UgdGhpcywgaXQgaXMNCmtpbmQgb2YgbmVlZGVkIHRvIGVhc2UgcmV2aWV3Lg0K
