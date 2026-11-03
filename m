Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739854;
	b=GH9alLLHLRDJXPy3vbx72y9DhM+cVUjtUpEPn2nshN0bHuPPixJDgPoq3Yn332pOvMLg
	 Q0u+A0ljPH5eyL6RitedDUdS8x49fnwMC8jqMoNhYlBXWGtRimh9ndvzYGYYCNiI4VuEV
	 Z1jTADV3LzezAuv8ueGDxSHObm49Y0Q/KaY4DWB2ehuEWD5XAsPBQQI2CXoPTA4KJBIde
	 RjC/XQPb+fpts8Od1hVjXD2MyW/CXPRmeMpBZKgzl/m3cx1d0xaimrpfIKBZqaPWIKNFm
	 yWSRwvrNpLDABm2BUgvsqz/izidyxS+HlvTbN/KEf91WT82GgAbdM0ic9/rqX5wGZag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739854;
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
	bh=tIOm+2oUcXOAoB73eVzbHiDPgZOD9yk9uQCj/5N0jBs=;
	b=MR7trAdd79gEsXOjHQyGhdfZ9405Sui9vhpkhPUWZI1vntZmpPwfaBoyDMr9RVsRnqqS
	 X7Xtvgra5mX1gU7N+bZ6cVB4KKLvutbgOYJZ2DWSztIYMDaczHBY12d6wpB2909fwirWb
	 GMWAsug7ezOag2EECimjg4v7tPRBYdEIP9d4ZrH4kYAW7udsIekNvsAWngy6kmnVJEzA2
	 DdfmePBS1Z3VDmiHrSPc5wfAZVyaO0dZH/rpBgq/O4oxMq6kFKbL2Ti4eQiM2YCmisQyZ
	 VqDLVfWGwAsxvanQHXSlB81mk+EKbmi2BhV3grxIZhSv+We36XnfHxpqkhe5eXltKhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DqoAAfE4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB2D606A328
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 21:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB2D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DqoAAfE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793739852; x=1825275852;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tIOm+2oUcXOAoB73eVzbHiDPgZOD9yk9uQCj/5N0jBs=;
  b=DqoAAfE4tLvgD4Uchs3MgUeXWbLHRHAdtg+wmVWKzRfEneyUUfo+A39E
   7JL4d8KzXCKgvzDzRM6I5yEQwgaf7EgMJ4ZtAFrpaMsEaNnOuHeV7Skj8
   kOU6ezSO53vnj6NtoaPleCXUhkZ6CxJRgI3Em8iT+Na7T/dez8R/7ybzF
   OZNkrQQmGHOD/7+7sj/X0GOXjpTQv0WKUq7riy2AmuL8lHnutdWuq9TSN
   2IR9zvVhkJSV4giIPNnjM04bNlxhAxWdSoRcWzKdU8JBMxEuIYCQJgWXh
   CVbavVGhcp+a8p4pdBPC5yC1XmsUyl76OR4NrcxA+u1kUFx4fzxVXq+OK
   g==;
X-CSE-ConnectionGUID: ju1q3wnpSIGj9CjMuMN13Q==
X-CSE-MsgGUID: Wvd0ENdYTVOM6ObD1AvUGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2391760"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2391760"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:04:12 -0800
X-CSE-ConnectionGUID: xK+Fb2hVTaWWh+PFsIYawQ==
X-CSE-MsgGUID: Z8LIgRYHTLKPkgwbwO/j6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6385674"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 13:04:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:04:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 13:04:11 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:04:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoHgRvrxBYdejU9Eu6jyOnBINvQr4B+cFjaiDaI7tCmCPHJOALlu1+YWAmJFOV8pS17sZXwHRL+M28zoC5IzmvJ0sdoRu4go9dg0fh94iY5ChSVYROXDn9TXNGAgwDCXu8B+lfHTV858cRmvm8addI/yt1BL3F3oR33aNAgfx0WSfXVcDMu5OgNfh+IKBMDPGc2KSku0Ku3bDkh75V01Rl0aRp7fqV/6lAFTWkQFeki5dWxV/39Dt2OYfd2c0IS4pFFki6iWPSZzsavTG5mxB8z7sbSJo+MLqT60iYLlOljMRvZUGTIxSm4vgGZAV99fwnk73CAbZezIruym3aydrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIOm+2oUcXOAoB73eVzbHiDPgZOD9yk9uQCj/5N0jBs=;
 b=GHAcaHsJp8qL+r4lF1yz2EU6h/Jxfx9q6UEvplvDZyTRlZ4xThS7PWtsk7vz77EgC1s3Vri8nPbf8t+U2iE/wgGS1/rp5DwAivdTi9Ha/+LEIJabfyEYiMIvOZ9cQYHu/3zRAku+Q+uPuIL4D5if8K0HymMQQIE1b3WaN9Ei+ku6i+XNVz2EgRNZ5MWlhxY+NINP2UlmI9s4qvVvK7UxsFujXYN+epOU0ZkCHjSAPkmsvXgUybcIyWIwQPpGG7JR0YBcLOdZyBS0/hY+7rHhrVu+ZEayvSQaaNshFeaoT9I+ly4+g+qBlA31DPrCW1GxLca1vzz0oYenGKtJwVbYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SA3PR11MB649961.namprd11.prod.outlook.com
 (2603:10b6:806:532::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:04:08 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 21:04:08 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
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
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5wB9qnnI5wkC3DPnIBykUmbcPMKyAgAHu0QCACmUogIABDTIAgACELoA=
Date: Tue, 3 Nov 2026 21:04:08 +0000
Message-ID: <a1e734c99a6bef94e1c39f9881a4a78f69b46926.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
	 <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <877499ab0c8f3575ac6d424b5be59ff464aa9026.camel@intel.com>
	 <IA3PR11MB91360A6B4A959FA41F0D1C9592692@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91360A6B4A959FA41F0D1C9592692@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SA3PR11MB649961:EE_
x-ms-office365-filtering-correlation-id: 7e72f2d2-e208-4e11-0026-08df39ee0067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|261022105027099003|261028144727099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003;
x-microsoft-antispam-message-info: gdxGGJw9TIJyyVH+JXt5DfzBKN/1U2F2YRo+xZzPoUa0Tgws/JwDFG8Fnl+GWtc66wPFsDjZi09C46pGlRhkaenMtJpO9mpldQyynsDg3kNu6yPtsIW/C3QRUXT5yRS1RZP/exfZNJHEU6xyaSTXwK0IBcUecPmR7lKIylx2k9mfy3f+kbeX9OeQjvaZB+2Nr2rB1/UCbSmklpZFcNuzUVZyNOoB1cDYfme2dkHLut/Cuqcpz/A51F4I4j0JcNx/cd5+TeiwQsoI/bEDMsqcx8b+GhkphEvXICL/K+zqV8hxgMIYuAbwgRJc/CKK7mb06JzMhJX2wkZh5qwIgCCjpNAZFBoqK2J8V3ylIXWDevuGslTJxec8grf0OzEENrg4aurom9JYwtp7UPvQ4l09I/sttdYADBQzc2N2jIgXGXs4SoLnky+Ag8yvyLo774AekPcEamCY7EQh/silHOukUFP6hZW4BkheY7iGVpSy4E6bHOnfwYoVmISFHXtjPHXvL9HB5KaMGUmj7/kBMZiVYNlFLE/ALNP9Px8xxSNPHvUBeF+rMo9FEqzHwUUEc8aFqLOByI9siscFHVetqgyTpZkTulgOfh3SNrskd+IK2FmixT3DnbV4EttZyYNVSRBQxKX02RCh6i3YVQ/05LHKz6LnnanvbO5TNAFp+y24GiBvm6sBwBQ0Z4t7/xDpMjuk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UU9UMkpWSGRiREFJN0ZTMWFGSGZ6OHdNcFRtZnpsTnNXWkxybXVjK04xbnVm?=
 =?utf-8?B?c3lCRVFKUFFmUTdyc3VzNzRLYTBvakVBODRFaFhnTTRGREJNRkFqRzJkT2hq?=
 =?utf-8?B?ZmhXYnVxakNQdDRkMVVDYnpzTVBYVWRRTGRMSnhHd240d1hRdk52SGl2bU42?=
 =?utf-8?B?NlRuRGNrdEdsZWJQczh0L3d3dDYvM2hSMVZ2WUFpek5leEVidXhNVDhxbGFm?=
 =?utf-8?B?MDQ2YmM0SlYzb3RYbWEvY3Ivd1hMeEpGeDd0cHF2UXhpMFpLNm1HYlZZUVdw?=
 =?utf-8?B?M1krbnNvNjF2ckRzZmhrdkUrOEF4eUFGbTlnN0x4eFhYQVZ2U1g0VkZiOThT?=
 =?utf-8?B?b1BDQ1FqVldWd2RhNjc5cWM0WU1Rbm1SdTRZeWlLbk9HOXphZk13L3JsVGgr?=
 =?utf-8?B?ODZkQ0xCRVNFTmZiMkVHeEpHK2REdXJsQUVUa0p6cDQ0eXRhY1RaTmFSOTB6?=
 =?utf-8?B?VVRPN1JVMUxCZWprV1VFekU1Zm1zSGhSM243N2VwUlNQSGRNY21uWVhvWHd5?=
 =?utf-8?B?Y1JZbVJxNGw0bUF4eGNJTFAyRzlSNGt5djZnV1B2TmZhVzd1UWpwWXVzQTBV?=
 =?utf-8?B?bm1zdlRtc1lsSHVnemlGb0ZnWW00cEpVWmVmQ1hieUdDSDBKNDE0eWRtVkh5?=
 =?utf-8?B?c040YmdsWWdVdWoxMWw3WHlLNDFXaC80TFZCclVOVmJ3Ryt5U0F4dUFwcXV6?=
 =?utf-8?B?OWNINTB5MHhZSjVubWxOdFhCR2RoU3NTTVRPdmF5bGhKSDNJeXZJSm5DSkpr?=
 =?utf-8?B?UGZDemZVSm5kR1ByZDJ0a2tiMkU1VlNTRXRlMmV0czNpa2g1VC9QcW1JSlRm?=
 =?utf-8?B?dDdkU1hBeG1DTTlPRDBXTE84VCtFL0piTEtsVUFEdGk2ZERCY0k5dEMxbGdP?=
 =?utf-8?B?SHIvTGl2bE15MXR2MHd2YnN4QjhWUXVrVEIzNjRpN0U3WG8rZkNkeTJKc3Fl?=
 =?utf-8?B?VW5STWRZeVpMMkdZK3Y3SGhRNGpmeDMrd2Rod0dESDBnWDVxN1JtUGJyNnRq?=
 =?utf-8?B?eFZWS1BQUDd4NHBVSWZkMnNhaDJRTGJvak1vNkJla1A1YUptY3NkM3dvbzNS?=
 =?utf-8?B?ZGh3aTNKRUZBMDB3OTlWREtmNkFFT1Z1bzJueWpjMlBONnQvK3FHR1JYMGpu?=
 =?utf-8?B?VThKdnhkTUc4RUdUOHhxbnY1REU5b2RCdTVTTnE2VjJoeDBybGI1azNWZjN2?=
 =?utf-8?B?eFV0THg2WXoxc1R3c0VOeUtrekQ1QW90VGZsU3dKTGtqRXVYRWg0Q25TSlFw?=
 =?utf-8?B?QWVQa21YOWlkSE1Ta2QzekZlUlNhV3M5ZVNLcFJ5akRwVnFMazhocEMreHBx?=
 =?utf-8?B?eklMSXhsZXMvSVFHMnNOcWZyNGxaSjJwMzNCR2EwdUpHSXFvejhzeForLzV1?=
 =?utf-8?B?UUs3QXJPZitSdVB3bHNuS3p5SUJrR3NIcW85dXpnWit3RVFUN0phM1F2WFFr?=
 =?utf-8?B?RUZ4bGJEMCthZWdKN2JwOG5RUnJlT0pleDd6TnhxSXAvZDM4UUdLSVQrU242?=
 =?utf-8?B?Uk1EM1FLNitBd2RRRStScW8wdXpiVVhoQUtYNlpTenZhQkNNS3JOeVFiT3dr?=
 =?utf-8?B?dEU5MjAwN3FqbEkrS0ZZQ2wxVUs1UXo0TFJ2eXRRZE83MEE3YndPbDh2Kys0?=
 =?utf-8?B?dlVvSVBiL1MrT0k5Z1RtUjBPL2VDYi8yR3ZidjNsZGxjWmNmekNIdERxajE5?=
 =?utf-8?B?Q2xXTi9OS0JEY1dhYW00QmRsTFV5OTNUQTVjNkpDNjRtYTJmMEhYV2VFY1VZ?=
 =?utf-8?B?QUdzS2NuM2FvTjBzM2RxU3E5UXY3SEw3VjJUUUNva2JTMmVLVHpubEtLQmlt?=
 =?utf-8?B?TFp4MVZqaWNCSmY1VTNaVzhmaDFjRkxjMWQ4NUFYSFpPRldIVnN4SVI3bXdr?=
 =?utf-8?B?SDhYL1pQV0lPa05WOEhVakQ0cE5VUHpzVmNUaFpOZ1lZTFg3RXRaYjdYMlor?=
 =?utf-8?B?NnJSSzB4Vm5QR2k0UkNUb3BCcWc5VFVLbkhBK2NVUEQwZHgvY3B1ZVFqTzFo?=
 =?utf-8?B?Z1BMV2FmTXo1dDloYVJZOEdyWGZFcXE1d3BhWS94c1hzTk82dEx6SExpcHNl?=
 =?utf-8?B?eGtPUG44QVM2UXg4S3p6enlhbkNvNFR5M3FVYSt6dHR6UGxjRXJXV2VkN3NK?=
 =?utf-8?B?aWMyVkNVclRicnZENHA0NWwrMDhVTWl1aVRZeUNVdENwZ1VORzhCWVNwS2RR?=
 =?utf-8?B?TEJZdDUzQVo3WHBHeTBaTllMemNKK0ZicTR5WWpNaEVJV2s3Q0RnbnFEV254?=
 =?utf-8?B?Q0YrQ0xueHJSRVp2a051eWRUbjhwMjRSUVdkR0RlKzJydXlHYWRZN3F3ZWcw?=
 =?utf-8?B?Q2dIWkttMWF0RzRWR3ZrMWNZS3c5UjlCUG5idEx0R3VvRHhETlFZaGErUUF5?=
 =?utf-8?Q?NeTbWXcsS1h+vsME=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CAF14151EBC2249924D27D92674337A@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: lYH3C7Xl25vr9K61UmUBLQBXUX6jqOMTXVyY9KfdNNcfmBZYmAvH62cbOePsrlUcp48JwMFgCQAVTAJQ84clTebAlTsRbnGwJAW0/10pZ4+dJmi96ocOMHHIt15Hd8uheSsPCAA8eaLcZwN0ITU2YTUgao546cBRCw4xnW1k/qkHlbobxiKH3TLtg2Q+kkMgRchxKlJmrH8pCZsJQJ9koV2IaHjRPOpCH3sf2xplwrtrhtpayQCxhSYnk4Ayjw92FY6ItsVacOxEBtALoa7b5JOgtiVQXforbrXW5BZuxL43zyRfzSU9ewhKJx4GXn2iHaRkn2cjNUZ417hRj3qNNg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e72f2d2-e208-4e11-0026-08df39ee0067
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 21:04:08.1547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJdToX0btQIGLe023zaTIx4gKo/OnLrJpGcZeLh6qf8YUbBm9nPIOj3c0UoKmPMY40zExpWKHb31gFoZPOlkkzmSmF4Ki3QGjxfDJkL3Vcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB649961
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTAzIGF0IDEzOjExICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gLi4ueW91IGFyZSBnb2luZyB0byBoYXZlIGp1c3RpZnkgdGhlIHdob2xlIHRkeF9tY2Fs
bF90ZGlfdG9fZXJybm8oKSB0aGluZw0KPiA+IGZpcnN0DQo+ID4gYXMgZGlzY3Vzc2VkIGluIHRo
ZSBvdGhlciBwYXRjaC4NCj4gDQo+IFdlbGwsIHRkeF9tY2FsbF90ZGlfdG9fZXJybm8oKSBqdXN0
IHRyYW5zbGF0ZXMgVERYIG1vZHVsZSBzdGF0dXMgY29kZXMNCj4gbnRvIExpbnV4IGVycm5vIHZh
bHVlcy4gLUVCVVNZIGlzIHRoZSBvbmUgdGhhdCBjYW4gaW5kaWNhdGUgY29udGVudGlvbjsNCj4g
b3RoZXIgZXJyb3JzIGFyZSBwYXNzZWQgYmFjayB0byB1c2Vyc3BhY2UuDQoNClVoaGguLi4gWW91
IHNhaWQgeW91IHdvdWxkIGp1c3RpZnkgd2h5IGEgd2lkZXIgc29sdXRpb24gaXMgbmVlZGVkOg0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0lBM1BSMTFNQjkxMzZEQjUzMzczMUQ1Nzk3OThE
M0FGQzkyOTIyQElBM1BSMTFNQjkxMzYubmFtcHJkMTEucHJvZC5vdXRsb29rLmNvbS8NCg0KU28g
YmVmb3JlIHlvdSBmaWd1cmUgb3V0IHdoaWNoIHBhdGNoIHRvIHB1dCBpdCBpbiwgcHJvYmFibHkg
ZmlndXJlIG91dCB3aGV0aGVyDQp0byBoYXZlIGl0Lg0KDQo+IA0KPiBJIHdlbnQgdGhyb3VnaCB0
aGUgbG9ja3MgdGFrZW4gYnkgZWFjaCBURENBTEwgYW5kIFNFQU1DQUxMIGFuZCBjaGVja2VkDQo+
IHdoaWNoIG9wZXJhdGlvbnMgY2FuIGNvbnRlbmQgaW4gdGhlIGN1cnJlbnQgZmxvdy4gSSBmb3Vu
ZCBvbmUgY2FzZSB3ZQ0KPiBuZWVkIHRvIGhhbmRsZSBub3c6IGNvbmN1cnJlbnQgVERHLlRESS5N
TUlPLkFDQ0VQVCBjYWxscyBmb3IgVERJcyB1bmRlcg0KPiB0aGUgc2FtZSBJT01NVSBjYW4gY29u
dGVuZCBmb3IgaXRzIGV4Y2x1c2l2ZSBsb2NrLg0KPiANCj4gQSBmdXR1cmUgVERHLlRESS5SRCBy
ZWFkIG9mIHRoZSBhdHRlc3RhdGlvbi1pbmZvLWhhc2ggZmllbGQgY291bGQgYWxzbw0KPiBjb250
ZW5kIGZvciB0aGUgSU9NTVUgbG9jay4gV2UgZG9uJ3QgbmVlZCB0byBoYW5kbGUgdGhhdCB1bnRp
bCB3ZSBhZGQNCj4gZ3Vlc3QgYXR0ZXN0YXRpb24uDQo+IA0KPiBTaW5jZSByZXRyaWVzIGFyZSBv
bmx5IG5lZWRlZCBmb3IgVERHLk1NSU8uQUNDRVBUIGFuZCwgbGF0ZXIsIHRoYXQgc3BlY2lmaWMN
Cj4gVERHLlRESS5SRCBmaWVsZCwgSSB0aGluayBpdCdzIGNsZWFuZXIgdG8gZG8gcmV0cnkgaW4g
dGhvc2UgY2FsbCBzaXRlcw0KPiByYXRoZXIgdGhhbiBpbiB3cmFwcGVyLg0KDQoNCg==
