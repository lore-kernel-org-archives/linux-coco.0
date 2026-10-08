Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E911246788
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438605; cv=fail; b=iTgPhzsAoJIc3pUhHBbcdnbHtT+d43LUjkqm3xeKR4j7PLWFTVTAyyQWtX1oQBrsyozjhErs3mS9z90Dc4vu/IV2j2o4egxfJEQHHZ6btQcZsRrEkpqTnLI92H/ArBEuCmbRt5YqPdiKUE54s3Boj2zHoIvGe6RLTGpYawtBfNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438605; c=relaxed/simple;
	bh=6WqJdlXZecZpCH9XfZTfHiLo5Le1/XWPQfOJf+pMRzs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UmHUikmFrdEZWlb+WT+xYyJ75FH+zfWH+qY3R2LvKDtGqk9mgqc0Kjkwr6egmr+tFbrI8WaEl7+evPD9+uD3LQwSy+g3KFFzWKbiubBndvrY2X0hGri+CHEVqqSQ1+R+AM5M42EfUzlvlaMkgO9vg/sFfNoYhlt4/CTXkN9cI+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c2RRaTa4; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c2RRaTa4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791438603; x=1822974603;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6WqJdlXZecZpCH9XfZTfHiLo5Le1/XWPQfOJf+pMRzs=;
  b=c2RRaTa4/7jNDUuHZhw9lL/olhj7IKLC4kR3/X6BfuQ953+QZCZfiSiy
   SHApRLtvAWvrsFPi222I06gFsV3z9vpYySWHY1XNWSWzecyltZzbaaMpj
   u9XLJE9aumUd073e2sHsE9SitXATcEpwVAt+oDuXEdFKkx46skpBuOawq
   sbZ8G4CE0SEYefEmOdk95RO+8ME9haZljXGBNqsXhBtdgsYOAuAXVOqSL
   IzQc7Pzl9z1rC0R6GQDQmwzYyiwC1ch0lj/mLDYBPR68amFGEyOSrFYJO
   HjHvlVMHMYaPGqawoKuLWYU6wVv2CN2OaI/0fCAZbD1Rd0EbeAlghHQsF
   A==;
X-CSE-ConnectionGUID: LaTsREGeSsGTzZAG5jEGKA==
X-CSE-MsgGUID: FJpCvdO4S7eYr5rwGWydJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="99669"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="99669"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:50:02 -0700
X-CSE-ConnectionGUID: oC/Gol+ZR2OECn2oBU3Dhg==
X-CSE-MsgGUID: 8S2C6aY9RTu8w6x0toC0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="255557"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 22:50:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 22:50:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 22:50:01 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.34)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 22:50:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz4IczQdXhSLseSHE++yYBLmbU74HNphtBP9Eo/EW1TN9SjnHxJEm3pSfXBzrOZYzLlY0F7gJpA8nWQyM2LqMb3JfD8ZfBvo6/wq9ATUy8FXnz0FWmQaqvGV+FI9Gu7qw9ej1I6l6g7Nv7TZC4S5ciErQJJPnD1EVror4dFEDDblRoLEzloFBI090bPUgo0FCYebA0KQv6VJkmwyIXiF3ZXTPJrM48yZGXh/hP1bCXN/37uvBQpXUYrdHxKnLD/FfbfPcH5RXbm5RUssBK/S4LBsefsiNsYk4wsMbcfX0yh3JyrC2MAfS0edAPORsOU6w8k/C/Lkqf2vhVMHWw8XSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vvoDOgREhDf3W7lZrJCvL+pFGE/McKzA1cnalqqsVU=;
 b=NN7L8r259GuQcnlDvU5yNaPOOz4h8IRHrlPqr7a4WVUnNWMYKpixpPvvU/Jor7Gwn9ikPX5yUMU8v8q3iELXdyPIT1iMCrdFoxJndLPtRRlibWrA0fXzBIPYwknW4YExJ2oDpltMGthU2+mKj0J94cXTitudDWwOEO0MOiO1suoMjJg7hUNGjCaS3itZVt8QBlS/BXO4vQa6t5TM5LZgmWbnc6HUuj71LI8Fhtah1fHbrDAtcQt3yR8A5ROsm1QdWMVg/BMCiBYrR6zWDEPyqu3547NYWCjeLJLVHA/njOoxipimcyfMIFgiNt9u8aDDhZ+J7468Qa13LOP9VHfPQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 05:49:58 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 05:49:58 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Peng, Chao
 P" <chao.p.peng@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Tian, Kevin" <kevin.tian@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>,
	"Gao, Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: RE: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rIdRCadJg8uEm6GsazTtQ82bbeZNsAgBSotGA=
Date: Thu, 8 Oct 2026 05:49:58 +0000
Message-ID: <IA3PR11MB9136B922CD5755958ED5D30892932@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
In-Reply-To: <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: b5b78e01-8848-4c14-eafb-08df24fffc79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|1800799024|376014|366016|18002099003|22082099003|10067099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: Kwf9iE2E0kBrQ/79RS2HweQxf+76CiD9QWDxyfF9PgvcY1dZ3yobPeddkbZ22azlLMyWSBVe6jhfPcuAVdbXSHHrP3UhQ2yU9c5Kz/7/0zYRzjvy81aOlIRtPZPoCN2698P4G0KDcmf8h9oKSyIJTmZ3jl93mq/fboX5obTaWj7uD51N/vD/9tAizhNnwQQWVtrD7W2AgqoS4aZYsSgNr1c2+kITOha91ybcGPtcHPqItHHRb83lavrkPsuss4lH9RbjLqLCOy/QY+vZeBuhizlak8p3trZpuCDevqV1X3nLQ+eRDr5ZQgQ9LZQQnkRhkIEgdhhsyUgpdf0/JrhP/GKVvy8NN0C06FBnoxcfmIlVQDiuvS5j94eBPztS2X/Dbv5ZGnfpwXGC2tW7BTPuWLOYUB1hsZWHHGSRvE5oGeVb/08ClAWFEdcqdn+tiIJevlFy1Si4KZ6DF4FJFzdw7n75SGdO4TeA7borlMHPGleS5g5MwndnF2d1UVQxf1IEt8F34c0Zp6XistFUgLaPrNmtvds2EJFA7OdHHFL4KHeuooXIRAQzIiw+IjQmHmeJYze+DENg6qhktfmgGPF8aGQVBoR6AlK14Xry9/Oi+IOcUd+edob/BooE9wzUTY7FtMIAM62AEZtB2UPRe8gOGRidVYX0Mjh6VR3tgDfpDjbgGdAYoGzZ5Wf/orYT3uozq6bHSXffUT+peApkGwMOzK3Mmlp65I97byl8m2t5F0A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(10067099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bAyj+zW/rKfN2uxM6tOiJ42boHLxotbkIdN57+UgPWRlU4tZcrzSTL0eg8Le?=
 =?us-ascii?Q?NW7WZhWCdYQXlpvMNcikR98ge0qI3vsmf9Ej8V4jV6UneXQnpxXeyYB2jpz/?=
 =?us-ascii?Q?jOsiEz8Kdba4jx5gfCWwFgVEKjSKEqp1PKUm5UXnkEQlVODXEerPjmSiOXMP?=
 =?us-ascii?Q?Y/98Mtbt0wxtn1ZQSVBgGsNbpgDWw0VWS6/1HgX6Q+e/5x8cvKXMuIR9vB3b?=
 =?us-ascii?Q?qErXAJ56nrBTGrKhhhHYRECHKyirXgYjXmI96aFnNlTPMJJ4komBSR0FRXnT?=
 =?us-ascii?Q?8cn8FVZhwSZl9BiIU9onjQ0SuDVoAdSnZlJ+IbQ7xHH5wLVyaKNL+LS8lGb4?=
 =?us-ascii?Q?NltT6W6lOLs/Udfg6+y76cAHKnd55NwECVP+7ruGQMCaoNQ0cEl2I2cOuiNY?=
 =?us-ascii?Q?0iYlnijLgQAaLPZz1E6PqL1JFandFWZvMt0F/SI0IjZu7lcfIubg3hcUVET5?=
 =?us-ascii?Q?/vBMIRvwuXIDNj2FWXbtFFsCI+kT5GxYtg3Drqas0Q6PmrzHWd/jXx2WbzyV?=
 =?us-ascii?Q?bSVpNIv8atZYPoEf8Yxjc6hKhVYC2ukT6l/+rtUoZa8KB9hZ87awZsGdsARe?=
 =?us-ascii?Q?FOO/pm8FpPw02j1DMgeFPl3VR+wyRCdsOdMYd9j/C3t+0l5XBHyQ7TyDie8U?=
 =?us-ascii?Q?Abc9t+RQhSofQ9UwcME5I6q9CzhghiW8xutmikQhvrJ1G55T2FnIde4YRdcQ?=
 =?us-ascii?Q?VF232Jli5dHQ3nlJE/kLFQELZnbbsKI4Q+mkAC79uHQsw74TtEOfjma+7vZm?=
 =?us-ascii?Q?kHxf7P4/utykN5nWili+K0mQIZ4aE/20d8Qh5ImSMmSVjHc0b8qLmyCv3vXz?=
 =?us-ascii?Q?pmrHMxwNseFPP/Y5gT8cVcGvbFoPqT9zqlzdj3t1qFDeqfZxWcejZrOYkKOo?=
 =?us-ascii?Q?IGT7ZhaoFFO21eP4UgRwYys9pWgeOaNzLv2I19Kv3xN2UV96kOvfiGo0hlRt?=
 =?us-ascii?Q?4P989UTrUn6EfmpSEfCeTzqGtZmO5sXrpUd88qGiBvUBlk7t02NRFYmzRjP3?=
 =?us-ascii?Q?d5LyWOKEhtO1wt5TqHQoBV5eLh0MRjxKTGqy6ZF66lmhnKWtBr63qfnoPkWp?=
 =?us-ascii?Q?45M13vsdAFQLBEbAqBpJy0CkfeEloWepxuXFdV7hN1rR5IC+w3k3GlWu/rRh?=
 =?us-ascii?Q?G4UHmgK29SI+wxlZh022wOuNv8xZSensibIdJ37MzUn3u6TdsNjxwsvZOtB5?=
 =?us-ascii?Q?u3G0Jh5m/PBUCFGbqp0t+NM38nYnOxzhQPMhU+K43jf1AO5ICFxxSxhcJ263?=
 =?us-ascii?Q?Mn7aLC1gfOEUJLOexhTDIDk+Eb7FDNUtdrvKd2rBOFVyT+4BY9KAo//PfHM0?=
 =?us-ascii?Q?z/rvi1ZNIXXyoPJr+wODoefoSXQSqflEcFMZrjQoabmiMkkZIteAY6p8x307?=
 =?us-ascii?Q?gSoQtzGnw89Ar4LgVvylPDLuWjYEDqzb7uUs91S1eqBlJtA4jFiZ0mms3Z4d?=
 =?us-ascii?Q?Djx+ZqJOw1W4SnqHV8qJMQ+5RK4Jnf5XGyLo34r+ySZFye6J/8Yv0RIC0xG9?=
 =?us-ascii?Q?2XRgUDh/I2XsTYjzIUabbS3H/KpyK+slis7p73F/3DRvtyO0LlUfd6nZ1yZw?=
 =?us-ascii?Q?vIBCl9exhldpZmAqrc4/mXX4MPVCK+0kzClSI1Su3qhNiYtw2oILnKBwPeUI?=
 =?us-ascii?Q?8f8ViFSLNyeukKdApAMEFdyUIk4wIhvXljpOUrWFsdPFXxkHNKCWg+sTMcVo?=
 =?us-ascii?Q?NtHiuZCttPXHIznyLJvQDVU8/up3mb/tzMtvderwGQRfagEitUx/Zt0J+mPL?=
 =?us-ascii?Q?08XFxgRONw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SVEcmlXAgEy0oQvAGS8Ba+p8pDGxDyxPWhq6F34ZTajY3VsiJIiOFwGo5rpWcf6jRa1U/q/hET5Y0KeyD0fJvMgkH7D29Va1cOoVL74s7NN9BAqxJTrO6eOMQ1VOaL3DGJkl7LqyniiXh2r6mxjOjIQW9iDH9ykG3ZhVlUTdnwUWrUUNMXySY0c6pC7QJ94CRGE4P1CkGSO/JUrFdZOvxZzwC2/zT03aPtDx7yrC/Bo+Xl4VOkKETz8L/Y5fVsqrzSkGjEbGgbwSL4juQ/9QHqlCuSNeQPY8dGL6A4H/dEAx0xF7dYWcSFerHdhsCxckou1JTuN/QqSvZxsqe2ZfSA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b78e01-8848-4c14-eafb-08df24fffc79
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 05:49:58.0957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PCe4uBsm6xS6I77e/LHEpV1KfqJNc2yC9oRVBPj4SUpliBCfi5zUwA/lgCGAFcpje/qQZIlKSafIsbQfULjQNRToEU1FuNpBEaCnp9jmOXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
>Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
>wrapper for TDX Connect
>
>On Thu, 2026-09-24 at 12:10 +0800, Zhenzhong Duan wrote:
>> TDG.MMIO.ACCEPT verifies and accepts a pending private MMIO range for
>> a trusted device.
>>
>> The MMIO range to be accepted can be a sub-range of the MMIO ranges
>> originally defined in the Device Interface Report. Because the TDX
>> module caches these ranges from the Device Interface Report, the guest
>> does not need to pass the explicit physical start and end addresses of
>> the MMIO range. Instead, it only needs to provide the target MMIO
>> range index, the offset within that range, and the size to be accepted.
>>
>> Translate TDX module return codes into Linux errno values.
>>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>
>We are going to need a lot more info about what this TDG call is doing. Lo=
ok at
>the host side seamcall wrapper commits for examples.

OK, will do.

>
>> ---
>>  arch/x86/coco/tdx/tdx_connect.c   | 38 +++++++++++++++++++++++++++++++
>>  arch/x86/include/asm/shared/tdx.h |  1 +
>>  arch/x86/include/asm/tdx.h        |  1 +
>>  3 files changed, 40 insertions(+)
>>
>> diff --git a/arch/x86/coco/tdx/tdx_connect.c
>b/arch/x86/coco/tdx/tdx_connect.c
>> index 1409b1a30cc6..09a92fe23357 100644
>> --- a/arch/x86/coco/tdx/tdx_connect.c
>> +++ b/arch/x86/coco/tdx/tdx_connect.c
>> @@ -71,3 +71,41 @@ int tdx_mcall_tdi_read(u64 func_id, u64 field, u64 *v=
alue)
>>  	return tdx_mcall_tdi_to_errno(ret);
>>  }
>>  EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_tdi_read, "tdx-guest");
>> +
>> +/**
>> + * tdx_mcall_mmio_accept() - Accept a pending private MMIO mapping of a
>> + *                           Trust Device Interface (TDI) instance
>> + * @func_id: Function identifier specifying the TDI instance
>> + * @index: MMIO range index from the Device Interface Report
>> + * @pg_offset: Range offset to start accepting the subrange from, in pa=
ges
>> + * @page_cnt: Count of pages to accept
>> + * @gpa: GPA base address the subrange mapped to
>> + *
>> + * Verify and accept a pending private MMIO mapping. Upon success, the
>MMIO
>> + * pages are set as mapped in the TDX module.
>> + *
>> + * Return 0 on success, -EINVAL for unaligned GPA, -ENXIO for invalid o=
perands,
>> + * -EBUSY for busy operation, -ENODEV for TDI not present or invalid me=
tadata,
>> + * or -EIO on other TDCALL failures.
>> + *
>> + */
>> +int tdx_mcall_mmio_accept(u64 func_id, u64 index, u32 pg_offset, u32
>page_cnt, phys_addr_t gpa)
>> +{
>
>offset is 0 for all callers in this series. So I'd think to drop it unless=
 there
>is some other code coming very very soon.

Will do.

>
>Can we turn some of these others into proper types? Why not pass struct
>pci_tsm_mmio_entry or struct pci_dev pointers instead of raw unsigned ints=
?
>
>Actually, the only caller just accepts the whole pci_tsm_mmio_entry, so yo=
u just
>need:
>
>int tdx_mcall_mmio_accept(struct pci_dev *dev, struct pci_tsm_mmio_entry
>*entry)
>
>What do you think?

Yes, it's cleaner. But how about below to use func_id as first parameter to=
 align with other TDI specific mcalls.

int tdx_mcall_mmio_accept(u64 func_id, struct pci_tsm_mmio_entry *entry)

Or maybe passing "struct pci_dev *dev" for all TDI specific mcalls?

>
>> +	struct tdx_module_args args =3D {
>> +		.rcx =3D gpa | TDX_PS_4K,
>
>Always 4KB?

Spec says:

"RCX	GPA_BASE_AND_LVL: GPA Base address. MMIOMT_L0 level (4KB pages) is sup=
ported"

> Needs an explanation in the log at least.

Sure, will do.

Thanks
Zhenzhong
