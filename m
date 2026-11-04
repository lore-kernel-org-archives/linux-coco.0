Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783042;
	b=lNpIGe8cKsROA5hliCySlzgFasR03RdxpxYza/4NuqABTW5vQJXL7tc7FEEy2dsTniNk
	 1lTSwilfIj3prhaF4Z3DYQq01BA7kT0+3zpwBlTyxOMKvWFpZ/O7KazjO6Yrz6i6cM4Sd
	 sOJEleLn8UWQcETiSUJfEB3BlW/teYrfUXL1JXoTApHVoRkPm1oLJyo5YFcvfSrBPKjf/
	 MLQ86yDnBOFXPNXBQdakQ1E+LI0CtBILYnLReEYPKkgJRBi0iq/1HosnoYUsfHJzOLlYd
	 Ou9DSoMLju6Opztrslg29RdGfTNtHDR2jQl2d1mPqNYIi6XFiryMPCTjlWm6BgKvS6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783042;
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
	bh=sD4pqzlNKG4lY5OmuZJboKbJCO+fBAQR2KODRTVSJAU=;
	b=zXuTM4lA9vApD06D9qzi74Mn7J6MUBh8tckFdBkhanZDZF1RnxazMlnKDRg679dRdNYT
	 NOc/HVc3JkiOjLIYq1U/QFVewnZrRYUmdAOdVdnvFgbrNaiVd8s0E+dCUnvNsSOoNTdVQ
	 GZcEBGKb+o7tt7hSSbTcJ1PRHj0b9r7lHeX1NUCnt44bl7MtkJujC/BEB3JEVkYKtEZ/8
	 da84Co6YSTytUPF88l40cmwhOh+reU85rh3NgX/ABbGQ+QQeqJuro1JY1qOveaXnstlva
	 0WByHXRPd2K9zAqt662wpz4R6cH8T9DaFmgsbtOh981lYRcd9pzxuciHI0eA23raHrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hej5lwDr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABD606A31B
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 09:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8ABD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hej5lwDr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793783042; x=1825319042;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aiECsqPt1T5sLlHvypW4gLDhrxS8hkxI0eybsHyKT0c=;
  b=hej5lwDrAREqNSp4oSYciCYOujrc5cF1svthjnpBP2DxnfFCXrnNf29p
   0e6zrmDlwNaCHT8pBKQ0VfF418UbKLmB/c42P+z3O0nSJE7P2dIrKqxHJ
   Z7cog5+cArAITKJlMJ0CUX6qbYj9uDemH+OHteG5iW2DtyRnooJqy7Uod
   B6+dZ3aoMDhSzPigzQTZAERlF2piJU7UrZymkx0P8ybMEdDt9RBdYJ1k8
   w3GuSLHY3MbPCsfx/u8b6pb1TAOWMpkC9ssrFvyIZdLJWsmcS0xuQBap5
   WhTjRVDEWPs3mpXg8ZNIXlfVT7GSBmfAXc84iq3QE3943ipSDOFbtrYdM
   A==;
X-CSE-ConnectionGUID: SFKUbXnLRSup+bfQ0ujBow==
X-CSE-MsgGUID: mgJCqZC0Rf6fd2eYijdqMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2560494"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2560494"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:04:01 -0800
X-CSE-ConnectionGUID: Y/lCPQUvToe/W7Qk8lJN6Q==
X-CSE-MsgGUID: gFb2WVT5THKztqpNGep9uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6551279"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:04:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:04:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 01:04:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 01:04:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJX6f8rud7O9nEfPDu082sV6P2p/pJdBppgj+yNgLo1d4ydjPWLb6/Q/1yhksnlO+vDIIaSm+VNmopVf7Hxjh70VPuOrUxZtfx2r1JCVUNwcxyRR50oc/+So//pyS7y35INNbNMbPgcUnLzkXWzAYnuJjR3lC0qF6iLhYyUSfjCapfI3ePxxWQyBCGfDklMYXN206cpe+NOmf8n6yjU/mluwqrfPGcf3rIfO/dMGKWkxygiLT2W3kEnu8C0vk5ymx3q2OI2SdTE/tHApZ3xBuJak/mG9ht7R73xJxjZEeFJuSXaAaF3s534ftqn9BmLLKsAQxkfq0z8mXRIOkMmdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD4pqzlNKG4lY5OmuZJboKbJCO+fBAQR2KODRTVSJAU=;
 b=LOdQu0H5cegsxVR4Q7kK0NsoMr5X6A8kb9HmTyuztAT5BkonS8iZTHG34OkOqgkXXNrJY62hobUjoGxnQzxhEoieFazZx/LkQs5FS1+4NgQYtECJ0JcjTGrUyIFraVZKY+ILooO7b02UL6Blm6M5NsRomBmXAs1bKhB1dC0IzrbxZBG1yhAJbjUJLKV5HQHc1NhTno4/FSJST2ykZA9m8U9pyeNk0/TmIzRmIb7N+pqKXsNYDCmK/CXLMD3IqHzNw3Mea0pOaLCgVrvlyn1JHw8ub2RkFI9G+wPUyhKqrwCfF3619utweYLm33kDXpGjTv9ePyE1aSpuwY7ddqPi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by IA3PR11MB8895.namprd11.prod.outlook.com (2603:10b6:208:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 09:03:58 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:03:58 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gao, Chao"
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rb7f+SAgADtsWCAAEYrAIAAD4QQgCEPv4CAAAvfsA==
Date: Wed, 4 Nov 2026 09:03:58 +0000
Message-ID: <IA3PR11MB9136A0009B97CA34ADF74CF192682@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
 <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <2b73666e-d923-4042-b719-b9bdeca783c8@suse.com>
 <IA3PR11MB91365402E40953E928008DA6929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <aurq0V5ySfS5pSxx@yilunxu-OptiPlex-7050>
In-Reply-To: <aurq0V5ySfS5pSxx@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|IA3PR11MB8895:EE_
x-ms-office365-filtering-correlation-id: ed19dc48-fafb-42f8-5498-08df3a528fdc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|22082099003|261102123227099003|18002099003|3023799007|38070700021|56012099006|4143699003|11063799006|261022075727099003|261026121527099003|261021121427099003;
x-microsoft-antispam-message-info: xXzZOVr6uvAI4SiXihEeSe6RFAAtNRY20IEu43kNEZN948mCqI7cThT2pFUvxgyeddOa8wxdSxvGZmCDWxwtw6JsUWfYCJQUAECSZoBfSCBwvkffI1g4yxW3FEkI15a5y5SsyAByOdlW18HouzX3AxyQyOwF8I6evlFg/co53TfCooZBTDUYMsNYfxHJ9QeA6fcEMvZY1a1wnj/UmujIlHjGBpfKNYLL5rNKRU5Zj23FnXLdXIFMkns77Ilek7Q9Q7iK/VEvzMKs+VS7ngEgkDDhRsi6kfZxwDZ5JGiRM/u0mJM7h79gTmxvN7Ne/UFi3277n5BTxAaS7S0pCeS2gmfJKn2r80kDOfDd7AKm9UvxKwLsPFIUv3RJ335XRs5mRGqwgHxwH7aPj+E+HVyCVnMElvkhPyjzFyWH2/CSlInoclBfT8pXD49nFhtwMz4mI4mJFNMFm+p9ZMvQ4AHvDXYi0eeWfS4pfumWKrg/lKOEz2xYkRzJvyIyVWebgOieM/yir/kcm41IDvkBDXj7TUOWFYDRX0HCXwcSWCUhk/r6wK2r1stNciLJu9GO21bX2jX1miJPRnrZsMt0gQB+ON6mllaiH4rzlU5wVc4dbJmuWineBkLMD7nWtdI41+40dXgyLTPw2lgti0QnxD2+EXg2PjaJH3s4LX4BIuKF9qhoHXRMlF808yRSFHF2sHs9LPwRchAPb4AwDxjW04uiDa26BaUX27fh+pIE8DrvPIQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(38070700021)(56012099006)(4143699003)(11063799006)(261022075727099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bLltOAae4vn1Zw9EdXxl0uVjuw7NNsrh0EU/jCBLiPXg5+QMnGMFRSuWCiT1?=
 =?us-ascii?Q?3pYyCLlApOl1gwJdQ31NvN1N1CWAxxuy9F+2z/29XAf1sHce4tIVEEw9WcfI?=
 =?us-ascii?Q?kQPR+38zIwO9INbGFAkFmuE6go9WDosUdyHkPtKJvzKG+cYvePxsW/LreZqF?=
 =?us-ascii?Q?VvWTrtu1fPbVRqfK3H/4/bKMSzzuV90Xx3tRxEdoAT7Vc9nqoxUR5VkwEa7t?=
 =?us-ascii?Q?OsUCyzno94557GlGTn9up7HtQNtSvO+fvrGcMz6KsyW14mWZBdK+1k5pxqib?=
 =?us-ascii?Q?te0JM9qhMK+9X05I1gNbx/6Yh5Hc1kYVi/efNUl5PjlOC7aOawfggrbNXQjW?=
 =?us-ascii?Q?0VsXLOGTPn8RO1u4WD6dtvcmLIB9UNHIEe2il+KZ0zvNwX4GUWtV1dcr1y+e?=
 =?us-ascii?Q?ru+OItpo/TRbqAHDztPFpm9dlNbhUEDQoY4fAUJ5jiUzRfnnvm/9sFrQT1w3?=
 =?us-ascii?Q?iqeYjoCuDbsMYCiAlixciRAnIp0FhHMKfrCR9Fokb9N3Rum1ZifcMg79tCZt?=
 =?us-ascii?Q?in/s9IShFj23jkVjmkMb4YsP89XWpwb1TK4KC97K2bzk0jCgTMEJWCFhw4qh?=
 =?us-ascii?Q?IGhliios1vl18LnVMueLLYx2Fz95xN2q+iD1l7Ado4sjET0BkSf9ZmCAJaMd?=
 =?us-ascii?Q?tRC5Y2x9PYGg1kBXGzX6vO5c91XAz52I1aGZT1ybzYRA+Lszk1wrAvnAXxnT?=
 =?us-ascii?Q?1+BAFuKiq6mcSMU1D88NXzKUpfYICql8sL32dnWDsN40EiCtWmfpG7ZyBY9E?=
 =?us-ascii?Q?golqJh6sXImml7m9cL7ia3YWxzSzxCBna7zWzxCGoLqW8sQ8cig5DPLI3qLl?=
 =?us-ascii?Q?So7elRGURy4c+NFzg2DcYNafGLt3EDBQA+trM9pNQ+miDh79DWahk1BawJT9?=
 =?us-ascii?Q?cOoOqV95vZmoIPzf8fvMEriIzXq22VfldEGc3kp9PLyywCOdMUn5uE6RdZuh?=
 =?us-ascii?Q?dM+Yl+SRb6TAWZZVUoJrPgieN3JiZEksaH62OD4FhgHbJIU/xWebn05PT9qS?=
 =?us-ascii?Q?MNDqe/nrZWmYWFHyY9LY2YiC8hAF2bEZWyELfNafPX44jjyH7wHS1W0iAcjp?=
 =?us-ascii?Q?6UD/u8t7GxLHsCBdh+SdGbvIRlSqsfuQ9Tkuj+bU8035KJNpQw03dREPHLxQ?=
 =?us-ascii?Q?RLd9fWPzNTu+UNnUVp+FbJSgp7soo/T+ELhvOWGgGAAsKfkyFyK9yhN4Ns4/?=
 =?us-ascii?Q?+a5zJ0FydRkEagZ0/Fi3urH+slDjDDZoKhyFYuMDEkzKjNYoxbmSkZsAmQZe?=
 =?us-ascii?Q?3+E+vaFIHhu5DVP/LmTayWk6E+as6tf7DkuTrXKLss7XP16C1ZOfrVshAF9O?=
 =?us-ascii?Q?fSvhfxgnY0ns8PUiPFybSL8bs396MOc6dWHu8pwvbRuqdtCeBrR9QheRvp9f?=
 =?us-ascii?Q?CeKmHA1cmq33KCIBwfjeMYPUAhXBK81L0c/lqgE/NHJ8k+9HCXD8lJTvlJ/m?=
 =?us-ascii?Q?KwXODqYx9h42maQahYUCTxTNzlEI4gQE3Dsp/wXub581b6KEEwRBezTt7lhX?=
 =?us-ascii?Q?Qzhv4STEsVCUu2zk+iz7IGJPIHYIVwPBbQvcHWpA7inOuZM+nD8+UxqVbpjt?=
 =?us-ascii?Q?goiWKZIDXLSF389SA/WabP46wzjZCg6Z3c52PLni3fo4GRtGWHYtTZpRUIaS?=
 =?us-ascii?Q?frFx+jIbFuEQajhd1awRf5BKfY65iyjFPxw3FtdW54H9Ua/RdPA1LBXWV96Z?=
 =?us-ascii?Q?wXeboRM63EbZres7kRiwEZq2hMqp9mBv2USLrFZ44C5K0uRYrAK5y1jz8A8w?=
 =?us-ascii?Q?tNc0zffx8w=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: ki04hT3WXcSH+5Ni16ujDh69oaBs9XFqZrOBhTJ6LZooRvSsegdFSyH9bV99XcaDGQ2K7LI3R0rLhcuH3xgTwL17f+bwIOIcg7pJjSWnRNVDDwUpUuyfx82BneYPU6YtxzTM7jjMeYqoBOARFOl3Ld13ce6wfbxix0juO0fa2i1+0wPjyJnF2bZZBVMf9N45q/aS/k0qWIhceGtMwXi5uNNAKB7FSb5qMwU/7vAJYduv2UAbZ5wMhB4azEMXa2sn8ReutOBliX84cLGcjhJP+M7rABIbuaRgnrEQRjP4Xhj1cYqi6DAwgAsgtxcFrvNE6OBbpvw+CE/wGlJ3Yx7pmQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed19dc48-fafb-42f8-5498-08df3a528fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 09:03:58.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22jc4K/0WmlrwXLbFupK86YfhqoPXBZnkrOK2GbjCBo+FnpQqdrQ60jvkZmyKWwXJ0GfplwWQrYjnnqLObbehciEVY2ZMfdYp0G632YPXl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8895
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Xu Yilun <yilun.xu@linux.intel.com>
>Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbin=
d
>operations
>
>> >>>> +	struct tdx_devsec *tdevsec_bind __free(tdx_tdi_unbind_dev) =3D
>> >>> tdx_tdi_bind_dev(tdevsec);
>> >>>> +	if (IS_ERR(tdevsec_bind))
>> >>>> +		return ERR_CAST(tdevsec_bind);
>> >>>> +
>> >>>> +	ret =3D tdx_tdi_read_state(tdevsec, &state);
>> >>>> +	if (ret)
>> >>>> +		return ERR_PTR(ret);
>> >>>> +
>> >>>> +	if (state !=3D TDI_STATE_CONFIG_LOCKED)
>> >>>> +		return ERR_PTR(-EIO);
>> >>>
>> >>> While this does seem correct, it's not really following the spec or
>I'm being too
>> >>> rigid, namely:
>> >>>
>> >>> Since TDI can change the state any time, TD can't fully rely on the
>Known RUN
>> >>> state in any scenario. However, TD can rely on the Known
>> >>> RUN state after TDG.TDI.START as a confirmation of the Interface
>Start.
>> >>
>> >> About TDI changing state any time, do you mean host changes TDI state=
,
>> >> e.g., through TDH.TDI.STOP? Or you mean TDI device goes into TDISP
>error state
>> >> due to hw error? Can't they happen even after TDG.TDI.START?
>> >
>> >I've taken this verbatim from the latest TDX connect spec, I'd assume
>> >what it refers to is the TDI/device getting into error state because th=
e
>> >DSM deemed so because of whatever reason. I believe there is an inheren=
t
>> >TOCTOU race here, because you can at best get a momentary snapshot of
>> >the state but the DSM, which is inherently an independent entry could
>> >for whatever reason decide to enter in error state (highly unlikely, bu=
t
>> >still possible!)
>>
>> Agreed, it's a best effort check, error state can happen at any time.
>
>I think we don't need this best effort check. The guest would eventually
>verify the states before RUN with the help of TDX module. So to me,
>TDI state read is just a debug interface. For simplicity, drop it.

OK, will do.
