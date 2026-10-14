Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AF37C936
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 03:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947223; cv=fail; b=aupbrUAbMlMcSUHR2o24PFAnS2jrqhaBp3b60q+BVy+VcPOLngHvmykZMgeNraCxvGGV8/Zh79KGsL2NO23zdikCC61geIcj6g3xPSiGDCnlZ33DoS4oImaaUfPzR4jYFrZT7psqu9JMnHhj23DAbRfEjNY4DN2NBhXpVRFhzcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947223; c=relaxed/simple;
	bh=Au11+2xCv69Ttj3KMTJd2seIano2fbE000ThQOx0uVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mTEafZGkF+DoXgskfjZBANw/xvphhGbTtAC7RMNMEStjNqKZKae5jIzelFjTQpaKKN7lNwsG22m+FJlPJCFHilU9jYzM1UP5Z6SATIeCAO5JJ8ePJeL4Vlh4d/5siqH7zhbvoJEGgbJcXpF2m7T+XJg3egPe8n0o9u17eDrFeVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENF9n+N0; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENF9n+N0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791947221; x=1823483221;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Au11+2xCv69Ttj3KMTJd2seIano2fbE000ThQOx0uVs=;
  b=ENF9n+N0QsXSUAVItuvNLTTrnDbX8E3Cadd3sZJRWiOwjNj1S3E5ZMyy
   6ELKq2i1hA/SZ20mJ9M7ABXD71eJMeuKLANt7yWMjwhHcaCtjc8DOGRRS
   z2or0pfwOECbZqYAyKarbF4dKrNICDl1eHpxCZ9xjd4i8LTPLMMYdLaiY
   +1IYt17vrf8FTB1SfaIyoEdo54g9gNEFAYxXJj6xj2AdRygn2B+LkUMd1
   6ZJnh+ENsp3i1I+kTIcop4MS3yIYLBuAkFu77iXVs9wpjXR44cfaeIlfz
   z0+FEwsJXIhNej1ozRNoNHPMKVhvi+Fbcydj3olkdW1YvM1leNjRgt9A/
   g==;
X-CSE-ConnectionGUID: CuQVVcSrSZW3sU5n2bZPKA==
X-CSE-MsgGUID: RL+PJ8ThT3SofB6O5tYhlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="585439"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="585439"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:07:00 -0700
X-CSE-ConnectionGUID: Bek5qWhYTu+xrNPZMxYz/A==
X-CSE-MsgGUID: m5mIW6Q6TwyHMdys9VbVqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1641565"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 20:06:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 20:06:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 20:06:58 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 20:06:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ee4uagioPVbUDbC4ElUar6VxlKU62yBwBgXxC/BpubZWYFd1FG65TQU1IvEs+7RKs2xyahIX6HGlIWq0NF2egbXY6AA28MyYtOCbFFY35cckakd5I+BJOaN+1wfhAZ0Dag70aIjaLs4JUjrGCuketHq1wN8GoKg4hHtwgzIgkTPTW6RiYIC22nnL8xe+DhIusN4p76btlQ18pJk9ypn3LpZOMfW042toVYwG4PpiGyP9vvtsZ1u8IdlyGx8GgRt2/R3jfUr5WkLh0831UxG3NsdoNJIzfi7vKWADOxikH0657zcI13QiRrKOPUBoC9McOuHhnjvl4i2AvNO8HOeqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au11+2xCv69Ttj3KMTJd2seIano2fbE000ThQOx0uVs=;
 b=TVPeNEmICcrSA8Af2m/OS5baXMGd844rx6KSdmTvG7GkFmb9O/rqfDsUB/ncMq+Gawwdmz9VBPLGmyStPlo9Nne6eMJNQ1vTtprMXcyS4XEQmSy2UIZNqeeo3sRTRrKIKmJhxfoQhmi41AdWHpFSaxe9OL9zlfclk3f7ts3fwAImbpNekeR712Xx9nBWyCY7jz1ZVN1cyK5j6Cp/WCYQQwLGgOzpPFzmU03oSeitbrJZeRrA0I4MudpICXuySrvNj4JqIFrT5j/hlLOYlCk8AY2VxaT8mj4fP9FGBhK/slkp7rdf7iQEfxaP8maj3+baYsBvSKI/16+GZSxuOpUhwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Wed, 14 Oct
 2026 03:06:56 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 03:06:56 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rb7f+SAgADtsWA=
Date: Wed, 14 Oct 2026 03:06:55 +0000
Message-ID: <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
In-Reply-To: <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 9096447d-2766-4ed4-d80e-08df29a03455
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: EKfFdSqeKZFNkBGbat2HzRqZCsaPVwsrIxFqtpDyqH6RJSfWtY4Z+4O/1VDnbIRaYMUZTXTJTOlKwr6R/vbEG3ByBIfJRYag1c7I3gx+/W3ipIB9Q1207JVWeBw1toTCGAvIBSMW4wjqvrxwCZpndmKDjUHPX3o+vpdf4nq3qI6+7pZc8Bi4QsBNYAiAHN9+uNXH8LeFvn3iGnnEP5+VYCFA70BWTrpTPvjLsdFUKUVbeZMCx2PGm42v/rOyYOwiz6eYz7z/q2J5eobhBs+xPc3oEH+kB5xV9aZJjD5EL0KNZMutx6dQX2ouxVXimlO3nooREigcFVP+YPcnqGe3/4PpDH1ET00X431L7l2MkYipIHV7Aph+IXehIsThAWUCrPXac+xVuLBlm0UjTTSlQxraTFDJO+7cSObrXtKjvGrPVmsF7/Gp5YnILng53/DYmzN156+FGPnOt1iaOPEV+0ml2421uK2JEsJwUa4DXZsZuI2ThE6mkHgDzEzUHYr8fKhCkYiq15p3JEMAH6NDDsGRmbDxuilQnwq/Wl96CxNYbcSTmZ8Oj+/6OusA9QHmhWeUrdb6+Da3wp27gDwecuec+PrMSG4sxWXk850e4fTb9WKrpnlKucaXbbQL7RbDSk5RlhRUjtygf+nB8YvVLhnBJRppCH8fhZYdX1xxak+xPucgz5bAr/NLINcDEjMfFyd5JlZWjRLn4JDxPRyzoEoQKgVM6IoETYCwA7ktGcw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkV2c0l1T3N2cUg2NEFrOW1FNlZ5ZG96dlhvZWFpMkF6ZmIzb25NVWp2M25T?=
 =?utf-8?B?dkRkbzF6bmJEamJFcjJ1NzFIdVNlaEd1SVV4UTdXd3Arb1pTY216L2J4RXNC?=
 =?utf-8?B?ckNKSW1iMkNDNklCTkZLb0tnUi9neEJydTJUT0RFa0x5NGcyRlNPU0ViOUFT?=
 =?utf-8?B?MW9KYVUxUExuUlM4TWM3cUhhK0xYM1dUcFV3OGpUck1hSldoSTBKWjVOamRG?=
 =?utf-8?B?K3RyS1A3alR0N1l3c3FYMk4wSXJtbWdOMzk0c1RCdU1LTnVBMWYzQUNOM09J?=
 =?utf-8?B?a2UxU3RMRXd0UU1aK1p5bGVITWdYWEdmRHQxYnFhTlo4eHE3ckowZkxLbE5y?=
 =?utf-8?B?V1FicEFXY1BWbzkyWmFSWmFkNElaNFNPa3lGTHJ1ZGVZamVJWmpWQTlYMXdv?=
 =?utf-8?B?ZDRUc3lOMUJsNHpiY01OQmp4anNLb0NpN1YxZCt1K1RpL3piZEIxR2p4ZHFD?=
 =?utf-8?B?QklhSnNJM1N5d0U3ZlB0SWFtelBKbnBQWVNqcEtmZTlrd2QvQjBwMnNIcW0v?=
 =?utf-8?B?aHR2THVxVDVsZFBJYTFBNHBEbGJJMFRBK0NieVFhTVlWSisvak9Ob1VBWWxI?=
 =?utf-8?B?MEQ4UVNQcDVuL0ZjMFlJblFEZERTVm5jNk53QVVOTnVCbkROanpJZUc4ZUZH?=
 =?utf-8?B?cUI4SElmb1FpUkV2UE5SYWk3RUQyemJ3aTJFeDFrMmthdnBYd1gzYkVlMmpP?=
 =?utf-8?B?ZG1hVHllVCtQVWxWVk1PK1U4dFB6SXNkS0VOMVE3ZWptc0xlL3QwV2RJSmYy?=
 =?utf-8?B?MDRFRG8zN3hmOWFrSnJwWG0xQUg5K1JKK2VkUlVVRWtDZ3RwUzV2OEs5QTFO?=
 =?utf-8?B?SE80ZnZVT1NucWJ5Z1lVVDJoeTdPMUdIaElDb3BJZktaVEdLV0QvbmdyZkNz?=
 =?utf-8?B?Nkx0dm42Sng2aVBmZUNYZnFTYUNjY0pKVGZsVVY3ZFBxRTVuY1FtUFlOS2RP?=
 =?utf-8?B?OHYyTVZOMlNSVVl3Nk9vWFdFemJteVJmNDRhYUtEQnN6U24xMlNSOXlUbk1U?=
 =?utf-8?B?U09Id3JGNmlEZEswa0NGaGxKRUZjblRxMWFEdkkwT1VrTjhwWURtUlZJUDEr?=
 =?utf-8?B?Y2QrdzFHeGdaUlJ2ZlExTzV4a1RPWjZ3UEs2RmZHc2d0TDF1Ulg3dVlrajJY?=
 =?utf-8?B?ZWozaTZ2L0tVWFBJTkptSkQzMkljRHVENE5OS05NbGdzVFVmaHFwckVkRXhB?=
 =?utf-8?B?S3UzREVtc3hCK1FHUHZmMENPUERUM1kvYlowYVdmNFNrUEwwY0ZsMVVPVFBT?=
 =?utf-8?B?MHVrZWI2cWJKMElJS0xKaUQrbFZKQ1lGWTVQVzFFeXBKVThDVFBFL2dRT3Fm?=
 =?utf-8?B?N1VrWkVxeTlXZG53TFVkOG1mQ2RhdFArWWs2M0c5bXRMQll3TTFmYWwzQkVX?=
 =?utf-8?B?aVpwSm04ZThZRkJxSENDVUZZMTMvVGRMYmJROXl0aWMxOVNwTXFTeDgwYVpM?=
 =?utf-8?B?Z3BDd1ZPN2tpcmdZVGhPbGtlSEtXeGhVdTM5K3ZJeHo5YkpJUUxrS2FjM1dX?=
 =?utf-8?B?V1oxNWMxM2d2RUNnclB2a0hDMUMvZWlxZEVIZlNVVm1Ua0dUQTZUUGVWZVp3?=
 =?utf-8?B?M0t0ZnZOc0dHaVh6amZUOWtQRjk0UXI0WWxOamQyWWVuckJvNW0rbWJxNmpU?=
 =?utf-8?B?aHArTHVQWjlIMDNUUW4rNUNkbURLSEJoYS9CNG45TjVqV3B0RUg4U28zZnc4?=
 =?utf-8?B?N2JHUnlMSEczL3VKSFFRQ0xhdUVqam9sNDE2K2tiTFVnQkRZekx3WlF5NHY1?=
 =?utf-8?B?MXYwdm5lOWRndFltdGtkcXpVM1NpMXdzNkFlZFZnUTNwZFpKeEVaUC9JTUdk?=
 =?utf-8?B?UFlRdlFDbDFUVjM5VUFPR1k1TG9tS0V2OXYrKzd6VFd4ejVXZzgySFNHbENy?=
 =?utf-8?B?Vk1PRmFIS3QwZmJ3ZVdCQnFOTlMvTmIvMGJIZDZqOHBPSmozN2hBVTBZbGQ1?=
 =?utf-8?B?c05yVnhUUWpJU0RDUzVqcXlseWQ1d1ZlOXBxR1kvZWg0NmlBRlI5RE92WVFN?=
 =?utf-8?B?RDRNMkVOK0Q4cXVzL1Y5Nll1OE0wZzQxNHFQVVdsQmxCcDFydk9heDYwL0tz?=
 =?utf-8?B?eEZhSHUwMmFUMFFxaTJGOHVWOUU1RHdOdUFpYTVUSGJuRWxBR0IzTWRJL2Rs?=
 =?utf-8?B?S003OERpd2RUZGhrUm13dW5ZdVpvamFGdHdRVlYzK3QxcUM5cldNcHhJWm5G?=
 =?utf-8?B?eG5VaEhNVG9oMzlNcmY3c3FCYmlqOXIxMGZ3MXJCaGswWkVUQmZjb2tSYy9w?=
 =?utf-8?B?aTBWbzFoTXU4WDMvWXNYL3JmRHBGNm5JWGs4SllZV2U3YWE2eGg3TVdrdFlm?=
 =?utf-8?B?aGxvSS9GampPajFSS0p5bnpXUWlzcHBIQlJwNHUxbE12WFYwOERzQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: pZiAFuPCP08VMAQ7pu4vr+XbkanqoJCEXZ0D2fzJq4RYAU8P3qdH1n0fs+dRuvlSXTnkJLTeiU7XZolacO2hMmehSJQMrpFQeduH+bl700wYZHYeOtJq8lQHYPnGrWQp0GpTCK8j9NXwr8Lt7j6aM5bfeEDtu2nyHufYvlB8V0exp2E6i3WKGsVeFUGQXPqfH0qDw0LgTIVJXm1oYUdwNeiOzdS+ayFRr/pBu7Iygz/VZtlji77mWAc0kEGZ+EaUblb+hpOEZxib+CSYmL46uY7QxXLNY4u0ohCRtwIuXNK9xQCEqmZnQ9yHHzS6M55+vCe9Tr7ajnIuAiUl9u6nDA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9096447d-2766-4ed4-d80e-08df29a03455
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 03:06:55.8953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KihXSc4cx43tnWxOejV71XHcUKRfhPPmSzAbRCEUGZ1TxwX8ShnPjcMye3+xG44cnGfIFtrhpLrHXxerr26li0V60CE58iItYy82KUdwZQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDYvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogU3VwcG9ydCBUREkgYmluZCBhbmQgdW5iaW5kDQo+b3BlcmF0aW9ucw0K
Pg0KPg0KPg0KPk9uIDI0LjA5LjI2INCzLiA3OjEwINGHLiwgWmhlbnpob25nIER1YW4gd3JvdGU6
DQo+PiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgYmluZGluZyBhbmQgdW5iaW5kaW5nIHRoZSBUcnVz
dCBEZXZpY2UgSW50ZXJmYWNlDQo+PiAoVERJKSB1c2luZyB0aGUgVERDTV9PUF9CSU5EIGFuZCBU
RENNX09QX1VOQklORCBjb21tYW5kcy4NCj4+DQo+PiBFeGVjdXRpbmcgVERDTV9PUF9CSU5EIHRy
YW5zaXRpb25zIHRoZSBUREkgc3RhdGUgdG8gYSBsb2NrZWQgc3RhdGUNCj4+IChURElfU1RBVEVf
Q09ORklHX0xPQ0tFRCkuIEFkZCBhIHNhbml0eSBjaGVjayBmb2xsb3dpbmcgdGhlIGJpbmQgb3Bl
cmF0aW9uDQo+PiB0byB2ZXJpZnkgdGhpcyBzdGF0ZSB0cmFuc2l0aW9uIHN1Y2NlZWRlZCBiZWZv
cmUgZmluYWxpemluZyBkZXZpY2UgbG9ja2luZy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVu
emhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPg0KPjxzbmlwPg0KPg0KPj4g
ICAJc3RydWN0IHRkeF9kZXZzZWMgKnRkZXZzZWMgX19mcmVlKGtmcmVlKSA9IGt6YWxsb2Moc2l6
ZW9mKCp0ZGV2c2VjKSwNCj5HRlBfS0VSTkVMKTsNCj4+IEBAIC0xNzQsNiArMjMzLDE5IEBAIHN0
YXRpYyBzdHJ1Y3QgcGNpX3RzbSAqdGR4X2RldnNlY19sb2NrKHN0cnVjdCB0c21fZGV2DQo+KnRz
bV9kZXYsIHN0cnVjdCBwY2lfZGV2ICoNCj4+ICAgCWlmICghdGR4X2lzX2Rldl90ZWVpb19zdXBw
b3J0KHRkZXZzZWMpKQ0KPj4gICAJCXJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4+DQo+
PiArCXN0cnVjdCB0ZHhfZGV2c2VjICp0ZGV2c2VjX2JpbmQgX19mcmVlKHRkeF90ZGlfdW5iaW5k
X2RldikgPQ0KPnRkeF90ZGlfYmluZF9kZXYodGRldnNlYyk7DQo+PiArCWlmIChJU19FUlIodGRl
dnNlY19iaW5kKSkNCj4+ICsJCXJldHVybiBFUlJfQ0FTVCh0ZGV2c2VjX2JpbmQpOw0KPj4gKw0K
Pj4gKwlyZXQgPSB0ZHhfdGRpX3JlYWRfc3RhdGUodGRldnNlYywgJnN0YXRlKTsNCj4+ICsJaWYg
KHJldCkNCj4+ICsJCXJldHVybiBFUlJfUFRSKHJldCk7DQo+PiArDQo+PiArCWlmIChzdGF0ZSAh
PSBURElfU1RBVEVfQ09ORklHX0xPQ0tFRCkNCj4+ICsJCXJldHVybiBFUlJfUFRSKC1FSU8pOw0K
Pg0KPldoaWxlIHRoaXMgZG9lcyBzZWVtIGNvcnJlY3QsIGl0J3Mgbm90IHJlYWxseSBmb2xsb3dp
bmcgdGhlIHNwZWMgb3IgSSdtIGJlaW5nIHRvbw0KPnJpZ2lkLCBuYW1lbHk6DQo+DQo+U2luY2Ug
VERJIGNhbiBjaGFuZ2UgdGhlIHN0YXRlIGFueSB0aW1lLCBURCBjYW4ndCBmdWxseSByZWx5IG9u
IHRoZSBLbm93biBSVU4NCj5zdGF0ZSBpbiBhbnkgc2NlbmFyaW8uIEhvd2V2ZXIsIFREIGNhbiBy
ZWx5IG9uIHRoZSBLbm93bg0KPlJVTiBzdGF0ZSBhZnRlciBUREcuVERJLlNUQVJUIGFzIGEgY29u
ZmlybWF0aW9uIG9mIHRoZSBJbnRlcmZhY2UgU3RhcnQuDQoNCkFib3V0IFRESSBjaGFuZ2luZyBz
dGF0ZSBhbnkgdGltZSwgZG8geW91IG1lYW4gaG9zdCBjaGFuZ2VzIFRESSBzdGF0ZSwNCmUuZy4s
IHRocm91Z2ggVERILlRESS5TVE9QPyBPciB5b3UgbWVhbiBUREkgZGV2aWNlIGdvZXMgaW50byBU
RElTUCBlcnJvciBzdGF0ZQ0KZHVlIHRvIGh3IGVycm9yPyBDYW4ndCB0aGV5IGhhcHBlbiBldmVu
IGFmdGVyIFRERy5UREkuU1RBUlQ/DQoNCj4NCj5CdXQgaGVyZSB3ZSBzdGlsbCBoYXZlbid0IGRv
bmUgYSBTVEFSVCwganVzdCBhIEJJTkQsIG5vID8NCg0KWWVzDQoNCj4NCj4gRnJvbSB0aGUgR3Vl
c3QgcGVyc3BlY3RpdmUsIHF1ZXJ5aW5nIHRoZSBJTlRFUkZBQ0VfU1RBVEUgaXMgYSBjb3JyZWN0
IHdheSBmb3INCj5URCB0byBxdWVyeSB0aGUgVERJIHN0YXR1cy4gSWYgdGhlIGNhbGwgc3RhdHVz
DQo+aXMgVERYX1NVQ0NFU1MgdGhlbiB0aGUgVERJIGlzIEJPVU5ELiBPdGhlciBzdGF0dXNlcyBp
bmRpY2F0ZSB0aGF0IHRoZSBUREkgaXMNCj5VTkJPVU5EOg0KPlREWF9URElNVF9OT1RfUFJFU0VO
VCBvciBURFhfVERJX0lOVkFMSURfTUVUQURBVEEgbWVhbiB0aGUgVERJIGlzDQo+VU5CT1VORCBh
bmQgdGhlIFRESSBjb250cm9sIHN0cnVjdHVyZQ0KPmhhcyBiZWVuIHJlbW92ZWQgb3IgcmVhc3Np
Z25lZC4NCj5URFhfVERJX0lOVkFMSURfU1RBVEUgbWVhbnMgVERJIGlzIFVOQk9VTkQgb3IgaW4g
dGhlIEVSUk9SIHN0YXRlIChUREkgaW4NCj5URElTUCBFUlJPUiBzdGF0ZSBpcyBjb25zaWRlcmVk
DQo+VU5CT1VORCBmcm9tIFREJ3MgcGVyc3BlY3RpdmUpLg0KPg0KPklJVUMgaXQgc2hvdWxkIGJl
IHN1ZmZpY2llbnQgdG8gY2hlY2sgd2hldGhlciB0ZHhfdGRpX3JlYWRfc3RhdGUgZGlkbid0IHJl
dHVybiBhbg0KPmVycm9yIGFuZCB0aGF0IHdvdWxkIGltcGx5IHRoZSBpbnRlcmZhY2UgaXMgQk9V
TkQ/DQpVcGRhdGVkIHRvZG8gbGlzdA0KDQpJIHVuZGVyc3RhbmQgdGhpcyBhcyBhIGJlc3QtZWZm
b3J0IHNhbml0eSBjaGVjaywgbm90IGEgZ3VhcmFudGVlIHRoYXQNCnRoZSBpbnRlcmZhY2Ugd2ls
bCByZW1haW4gaW4gdGhpcyBzdGF0ZS4NCg0KRm9yIGV4YW1wbGUsIHN1cHBvc2UgdGhlIGhvc3Qg
Y3JlYXRlcyB0aGUgVERJIGJ1dCBpbmNvcnJlY3RseSByZXBvcnRzIA0KQklORCBjb21wbGV0ZSB3
aXRob3V0IGNvbXBsZXRpbmcgVERILlRESS5CSU5ELiBJbiB0aGUgbW9kdWxlIA0KaW1wbGVtZW50
YXRpb24gSeKAmW0gbG9va2luZyBhdCwgVERHLlRESS5SRChJTlRFUkZBQ0VfU1RBVEUpIHJldHVy
bnMgdGhlIA0Kc3RvcmVkIFRESVNQIHN0YXRlIHdpdGhvdXQgcmVxdWlyaW5nIHRoZSBpbnRlcm5h
bCBUREkgc3RhdGUgdG8gYmUgQk9VTkQuIA0KQSBzdWNjZXNzZnVsIHJlYWQgY291bGQgdGhlcmVm
b3JlIHJldHVybiBDT05GSUdfVU5MT0NLRUQuDQoNCkF0IHRoaXMgcG9pbnQgd2UgaGF2ZSBib3Vu
ZCB0aGUgaW50ZXJmYWNlIGJ1dCBoYXZlIG5vdCBzdGFydGVkIGl0LCBzbyANCkNPTkZJR19MT0NL
RUQgaXMgdGhlIHN0YXRlIHdlIGV4cGVjdC4gQ2hlY2tpbmcgaXQgY2F0Y2hlcyB0aGF0IA0KaW5j
b25zaXN0ZW5jeTsgY2hlY2tpbmcgb25seSB0aGUgVERDQUxMIHJldHVybiBjb2RlIHdvdWxkIG5v
dC4gVGhpcyBpcyANCnN0aWxsIGEgc25hcHNob3QsIG5vdCBwcm9vZiBhZ2FpbnN0IGEgc3Vic2Vx
dWVudCBzdGF0ZSBjaGFuZ2UuDQoNCkJScywNClpoZW56aG9uZw0KDQo=
