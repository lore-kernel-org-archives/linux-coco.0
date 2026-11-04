Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793782794;
	b=lH/3nGpuevdGfKGj93Wopvxff13vhOVqNV+v4TcBWRappGSpEQ09NSVS8Iz1PP7gtrBl
	 fzqTSk2jo53zuELbvaYhRwqLXcrz+fikkfOQvnRslk38mFbdZH74q66gL3rlAOYFAq67+
	 VtBo1BCqRdHsB7J4XZ+fxLuXXfiRyMvr2i3SXdYkpslo7k02vS1kKc3etJ8zm6cLvSlk9
	 evrOVfRDc+kl2YW4fyZuDtRi0xyWDZqy9Nd2EmrC3sRPsseQQDGRfwQGhtilyhd0h3jBO
	 3HFZnAscviTj4WAGnHoS4P8+DWfcKSFZN0jouDi0iFkDZgALcW/nFlaGo3pdgpV9ohw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782794;
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
	bh=WNVtCbBlv6la3CumAVXdhb2CtCIaHPy+n8xTlXlVFZI=;
	b=IgnF5Myz4hVESWaeCaomiL4rwzLF4mCUAwOizg7RKv83LyP+nY21jxXYHqpQHE+XfoAw
	 Kq006MX9FFiOtnnlVsASBx4yoUKWagVrA+FXAbD+mzQxsntT5d3icf1xYYTqepAac0Po2
	 ILIMT07aqtQn5nqqBKF/xdWXwP4y/DZTBU7Pmn6aPUO013n1jzgpbgi+/NH1xe9HmEXY7
	 AqO1tYvavmSfIcySPlsZOG73KxTwXrvMnDwWq9DQths88ztMOfzHWL/Jp4nlC67dZBseP
	 Np+q9528wWGftOio8DDt9FRYmJs16dYIrZQozknff1XyjVJ0c322WnX5wPI6s46xNaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eh+bPECF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF018606A336
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 08:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF018606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eh+bPECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793782794; x=1825318794;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WNVtCbBlv6la3CumAVXdhb2CtCIaHPy+n8xTlXlVFZI=;
  b=Eh+bPECFIRkF8UiwXB8XvhFTRcjdFsI5hlbSDwfUV4FNzk/+nKlTZcxQ
   8VBMB2i1gX4AH/5OVYd+h6mtfvPUJXRDoYlZUeCFgl9QvAueiQArPHMBt
   dvJeQ7Gmd0iJ3Hl9iHRTULIUYiVNgRkW6j7Yulyu9WyZQetaJHMiyzI7x
   NtRc2CEwl/SrHXXPZKzZb2rO+kobupAF9qRSxezLpD4P4vAE4H1UaGEft
   jCJOwbYX9YgJ0VbkZunbiO/6GGATbQ+cm71GrfKjCLyV+LgM5X4jMFn9M
   5hFf26fe/HxTVRIh7ilu2EGmCPLy8hWXz++OnxZRjlHyyCBBx1fSOgHyk
   A==;
X-CSE-ConnectionGUID: 2WY+QfKqQuatgBV2kpFlJw==
X-CSE-MsgGUID: gMvnvxopTiWvuLhKEDeXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2404543"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2404543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:59:50 -0800
X-CSE-ConnectionGUID: x+AnWOfHQOC7lrlqYPJH4Q==
X-CSE-MsgGUID: 17NV9nllQ7K8qFsAvk4VIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7055068"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:59:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:59:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:59:49 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:59:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF1+Ryl7F51cx+OBPCuZ07Fhzk07HaSiAfctUzjJfJQ4jNraAtXqMPg17A6Occ8NNNeLZLpstbx1wZPVnYVqOlUxWPQir1kMUjHHkwKPl9i6uwt6v1Hs76a84VVqlqvwnJWb5IKwn4R12oumz/BisE+ztard9KMDeQa8zeLvPpWYFqcXCpHx7Uwyda3PPSccahYHEzlzRUGn2dvyfPc8bUwXTFmOIaGffC07a8xWadkOliAOTNkBbgnTV5TWLqTJrOaafdo8/8hoNMBImDl3uaEx43qau7niDbu6qeNOqmryPv6qNvC2Y4ZbbZ8KLMyo+vd+QJRhPagjz+XX0qF8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNVtCbBlv6la3CumAVXdhb2CtCIaHPy+n8xTlXlVFZI=;
 b=qtqPGu1erRjm9QA8f9J1He7+IINfy5AzJ7n0kHCEzAh08twJYYr5XB1QjLYdSGReip1TUuS4ZtqDXalKaN+d/PaNz5GwIT1/Xn6pDWUMPGZWWFWizPuWIbvqcYt8DvBthriiOiL4gTxztRhXrsinIRgTGY0ry+bFyqYEN6gpbDeDMy8ZZFi/GQafLydzZXNlP63YB8hQ5HvTWA7X6IkBAaTcYNojcIXUdSQguSVRpMckXgex70JbALjGxzde+vl8zZv6p/NDabBQK+B3F7oxK81Z2y7XiFS/WU4CrR8VULWbHpR4TykYlBWirACnXff3L+0dJfryJ1wcwtA2D5ul/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 08:59:44 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 08:59:44 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALZp1CAB3RpgIAAwCFwgADRDICAAL+JgA==
Date: Wed, 4 Nov 2026 08:59:44 +0000
Message-ID: <IA3PR11MB91363BF2AFC2ED5E126DBFA792682@IA3PR11MB9136.namprd11.prod.outlook.com>
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
In-Reply-To: <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SJ1PR11MB6249:EE_
x-ms-office365-filtering-correlation-id: 6860bc14-4be6-49c6-a0d1-08df3a51f85e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|18002099003|22082099003|38070700021|5023799004|4143699003|11063799006|261022105027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|261021121427099003|56012099006;
x-microsoft-antispam-message-info: 2mbiQgPnQlLmvrJUo0TiqYvowfEOJcujzPIuur2bGX59v6gNcrsszRQAms1Yn6ip7nx9tEbzU2WGlEt37AwzUduwrQzIZR4u7fnvRAqookYTlayRG6pI7u9jrNzLArQjG/IhHtDeuatVMeK6LUI/PUytRiAWqSEMT/lOP5d+ABxVWOBDY/37wlT/4+VAArISImJZcXRI2j719kOOTkrCZyxGfaEiknhow2Yf69hT28SSF00fKB8ytzXusbZ7R1iKEjsAhBnmmp6btFjwGrm/K80dMr/tFOkDIke0ZP4yMaR0aCwQO58Q+JskTjj4QB2/PSpv8jdp1h+u4sm2Kl94nzanUUqVdWkMirnGwl8lgYCSK7fdZZ8o5hcFntXu/MyLzjXbM2s/Wfmt2nLMrMAS5eGVU/yJvxtdkBgEp0T/DdK+VYrTiNrs8Wb9+QoN+2Dim2onWOZoUm/o/sSccMUa4XTo8Smq7ozKIf8BVhV5tSZ4BeK6PYdhJUaOzYzc5B4RL2uO79mJk1sZFs+60LogKCR6ZMd/cJRmRwPYybfSbqUptVi0xCVAqYIg0g6ZBGkXOIW9P1qnt0PqsQYrwz17gEwJVMm5+zhsispIt/lPhMjJTwhlZ6UcBH4Qgm0UBaVPYqB+Wn43mj40CoP8ZA2X4bVYyinmUiXr0t+vg1jNoD625yK59qv7md2eSDJ01agB78a4b5ObIOlwQEzMlG3rQglyWUBrECg3XxRQlV/W4mQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(18002099003)(22082099003)(38070700021)(5023799004)(4143699003)(11063799006)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUpzZlJLV0JmbHdiWE9IWGNEUmhCV2k1KzhhYXljYTdObWJXZzRkVGI2Y3BY?=
 =?utf-8?B?bWoyOTRIWjEvT2lWVzBzL25JVGY4eDhFZjQ3Q1E5Q204YjgydStzMTR1TDVF?=
 =?utf-8?B?K1FHUDlWU0l2VnJ2Q081MjlRb2xKYnRjdFhOeEJFUTQwdVJ3UFRWNXAxbER5?=
 =?utf-8?B?U3VTSFI0eWRKbjVGNUQ5djFCWm92WUp6WU43L2dqZVNnVEU0WnA1UHR0Z1dR?=
 =?utf-8?B?dnFPeExNRXJWSzhoc2NSUHVYTHJ3cXduNW9IYWlGQ09rcEM2RXJZVERSQWVT?=
 =?utf-8?B?eW5LTUNKbWdDU3AreE9BWll4VFBXN1MwOXVDM1hNTEs5NCtpU2kyQUZkSDJG?=
 =?utf-8?B?RW5DMjhaRkI1S1EyVGR1Nko4MGVaWkhPd05WTzJwaU1aT3c1d1hwVmp0cjcy?=
 =?utf-8?B?N2dMSkdyeXZOc0p6MGJKQ1UvcUVib1F5VWVOdk42aURFdWFnSmUrbUUzcXcv?=
 =?utf-8?B?dFRyNE5OOTFGOHNqKytVSjlkMVd5K204cTRpV2tyN3ZmbUVtUEU3OFpWMmQ4?=
 =?utf-8?B?Q05zUFRVTm1nZzBiVGVBVnRhWG1SSDhVYUJESlhnMWwyWk1rUjNuL0YxOTBN?=
 =?utf-8?B?dkZobjFxMEdqSmhrdmV2akVuVzVJeVJDYXd0OVVWV3habklRajh3cWVtanZt?=
 =?utf-8?B?QmxpOGs5V29NbzBWTm1lUE9XL1R6QzNxb3lGSnhmZnEydU9pZFVXdEkrZ3pZ?=
 =?utf-8?B?Sm9va1NnTERrREFBdlhRTy9NNGtLcXNLbXlMNnI3REdZZTF1cHNUTHJvbFVT?=
 =?utf-8?B?aFRsNHYwMzBtZ0N2SW1pNjVGS2tlVHVRQ3lJcmFic054SW92QVp1dk1lL3Fi?=
 =?utf-8?B?TW9DRkpRdkZjSVRrTDBNbEFnRHR5a09HWlZWNDN1WHEyMEU3QnZJYXpVUXZB?=
 =?utf-8?B?MFJSalhteWlYdnREQXFqV2Q4ZlUwNVRVNHc3ckhYa082WlkwdVQ1QmQxcFh1?=
 =?utf-8?B?bGczS2xhc0ZRNDdHSjJkanlxMTVnSFhmWlk0ZGprWkViVlc3NzE0RERkZ2VZ?=
 =?utf-8?B?Tnc2Y0JCdHFiSm51eXQydjJCc0JTMlNJTFFWeWwvZExOWTVHY1dVYTJPWXBx?=
 =?utf-8?B?SlkzTEcvVVZjY1VGL1p0bHJtSVNwWFZDV1cvRnQ1N25pU2JuQ3V0eGM4em80?=
 =?utf-8?B?ZFlWNHd0T0h3R3p6OG5waE0wd0UvekdyaExJYXJhWmlHVkVuZXJQSFlvOW1Y?=
 =?utf-8?B?UHZ6VUppU3VnMjFRMGFOaVlFa0cvOFVwN3dXUFluRW5lUkM1eVk2R0tMem5w?=
 =?utf-8?B?U3VsQVdES1grRlhOMDdpVWZJNmZOZTA1UGlwaWcrMzF5QXlqMXQrLzFiY25W?=
 =?utf-8?B?NGdnQW05aW1DTU1WVm1UOFVFRERUSDVkcXU3OVlUUEV1ZHU5SFRxWHByakhR?=
 =?utf-8?B?WE0xYXFyOEx6MjRpQTBseG5Ncy9LbTJEdnBLZ2RGTmlrVmlwOUxlaXgwSVU5?=
 =?utf-8?B?QzBwRzJjNU11N2xGYTRSMjByT3l2UHVaQXVNMWw5MXkxM3IvSWdZMFV1UlNq?=
 =?utf-8?B?M01lR3lNcE94djEzLy9LQkZMLzNIeC9lZjZzUnUrUUhKalV3cnZNNVVHM0Fj?=
 =?utf-8?B?ZGZiQUZud0pjUjlMUWVabk41bUxtU0JISERYTmtZK21YWUNPZjRFQ0ZDbDhL?=
 =?utf-8?B?R0xZMEpNdFhaYTRQWjF6cVFZc25kMERGWXh2cVIwTGdybmpsM091UFhtdGhn?=
 =?utf-8?B?eDF0T3QybDdwSmZnZ2FnWFN2UnVEZjkzK3llUmJtbHlOYUE4NDRha3FRcmxi?=
 =?utf-8?B?Z1gzNUJLbkF4N3Z2aXE1ZW5GMFBSVkU5SEVnVlVQcm91ZFVXREVCNS8rU1cy?=
 =?utf-8?B?RUlPRjZpTEpnZnUwb0hNTWVnb0lPT0dZcWd6SWN6YmUyVnNTYlZhUUJxbGcw?=
 =?utf-8?B?cVU0Ry8zS0pRcDhZYWhGQXBjSnVJUG0wM3Q1QS9oT0dSZDlUeEw0WlRlUEdn?=
 =?utf-8?B?ci9EdS9KVVVQVHBZRldXVHpWRzZGbWtHeHZlUVI1OVhFMnFLN3BGblorM0h3?=
 =?utf-8?B?MDRPRUxhY05teWtaSi9ySGxjQ25DTmRmWnR4bjJsOEY4dlFkZUw4V0dGdXQw?=
 =?utf-8?B?Z3V0bTNVR0pNa3d3RTlyeG5qSnhwakVPYnpKUVpPa1luUnI0ZlhVUS9wZ0ZO?=
 =?utf-8?B?ZXQrUEhoaUtocnowSXNXOVAvU1lRQnM3c1RkdVNUQlp5Z0JHTTIvYXRwdnV1?=
 =?utf-8?B?TGJOVW9HUEl6c2FsaVJDWEs0SVZVckdvOGhteEU0bDkzblVUc1liWUdLRzAv?=
 =?utf-8?B?dUZOQTgvTlZ1ZUIzTTRKT2NoelBycStMdVJTKzNjV2lVZ0lSNEtnK3VRSHR3?=
 =?utf-8?B?MU1idmNHWU8wZTBhUTBoK29hYmdQRDg0ZXpVS1J2YlIzck1IeTFWZz09?=
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
X-Exchange-RoutingPolicyChecked: DzmGzbbGjcWLo1uPGQ/IEh/nvz2jChxwpffHd6L+YNISRgEXSwCcRjt6HJ7n0t//QUOgDUKOlORwiH8UCV6CjbnSKGfOI3kjNwVrPNny0Fk7tlVM6f3DVvawXiGVjvR0RvTi0YiHB537D92ZvMSyjkwL0E4dtHLHw7bHqr+PZwgVbHwynO/7PAB1XovXZf3E7FTaEetV5BY2Xj264RhBWGLpgY3itxkshNbC8EGwVqJTsqMnKuknBwWSgLhqfOjholuBNNHrnn0g6HeUxtF9GVcQabero6Yb8u70pxtQ+k2BauNqEQbOHEYK7lIFk2C/DWb5SULi7xazOkJIdloINA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6860bc14-4be6-49c6-a0d1-08df3a51f85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:59:44.3351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66UiGPSYbaig9W4U+XVurwG29eKQ1oKqAN3J+oZvMsj+CXWBf1j2WTRCx8hkLWHJLq50l6ABZ9EDhl3hcwtKh/t/DseMiVruGwwYguIXcnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
X-OriginatorOrg: intel.com

Pj4gPiA+IEkgd2FudCB0byBkaXNjdXNzIHRoaXMgZnVydGhlci4NCj4+ID4gPg0KPj4gPiA+IElm
IHRoZSBUU00gZHJpdmVyIHN1Y2Nlc3NmdWxseSBsb2NrcyBhIGRldmljZSBidXQgbGF0ZXIgZmFp
bHMgdG8NCj51bmxvY2sNCj4+ID4gaXQsDQo+PiA+DQo+PiA+IENhbiB5b3UgZXhwbGFpbiBzb21l
IGNvbmNyZXRlIHNjZW5hcmlvcyB3aGVyZSB0aGlzIHdvdWxkIGhhcHBlbj8gV2UgY2FuDQo+PiA+
IHRoaW5rDQo+PiA+IGFib3V0IHdoZXRoZXIgaXQgaXMgcmVxdWlyZWQgZm9yIGFuIGluaXRpYWwg
bWluaW1hbCBzZXQgdGhhdCBkb2VzDQo+c29tZXRoaW5nDQo+PiA+IHVzZWZ1bC4NCj4+DQo+PiBJ
IGNhbiB0aGluayBvZiBzb21lIHJhcmUgY2FzZXM6IHRoZSBURENNIGh5cGVyY2FsbCBtYXkgcmV0
dXJuIGFuDQo+ZXJyb3IoZS5nLiwgYSBtZXNzaW5nIFZNTSBvciBUREkgZGV2aWNlIGZpcm13YXJl
KSwNCj4+DQo+DQo+SSdtIG5vdCBjbGVhciB3aG9zZSBmYXVsdCB0aGlzIGlzLg0KDQpIb3N0IHNp
ZGUgZmF1bHQsIGUuZy4sIGEgbWFsaWNpb3VzIFZNTSBkb2VzIG5vdGhpbmcgaW4gVU5CSU5EIFRE
Q00gaHlwZXJjYWxsLg0KDQo+DQo+PiAgb3IgVERDTSBoeXBlcmNhbGwgcG9sbGluZyB0aW1lb3V0
KGUuZy4sIGhlYXZ5IGxvYWQgaW4gaG9zdCkuDQo+DQo+SGVhdnkgbG9hZCBpbiB0aGUgaG9zdCBs
ZWFkcyB0byBicm9rZW4gZmxhZyBiZWluZyBzZXQ/IFRoaXMgaXMgcHJldHR5DQo+c2ltaWxhciB0
bw0KPnRoZSBpc3N1ZXMgYXJvdW5kIHRoZSBCVVNZIGVycm9ycy4gWW91IHJlYWxseSBuZWVkIHRv
IHRoaW5rIHRocm91Z2ggaG93DQo+dGhpcyBpcw0KPmFsbCBnb2luZyB0byB3b3JrLg0KDQpIbW0s
IHllcywgbXkgdGltZW91dCBleGFtcGxlIHdhcyB0b28gdmFndWUgdG8ganVzdGlmeSBhIGJyb2tl
biBzdGF0ZSwgaXQncyByZWNvdmVyYWJsZSB3aXRoIHJldHJ5IGluIHRoaXMgY2FzZS4NCg==
