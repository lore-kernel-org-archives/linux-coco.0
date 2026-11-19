Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795130529;
	b=0/V/szZuxVXQ01upsooAwn8tHOXwQzq+3m9tL4ryXeItYXpf9BfZE50b1Xf4b9ibLuPz
	 tKfW0ckTHlfoYOH2milwq1gciJZqakRk/SK78QOMrBL8PoCgEqR0rvSibfoJJ97VAV/0c
	 TMhB6TIYksFkrat8h3YSsIbI1hISSHAV3/XR6jSDWWAjDsWlgHd8idzh62yKbSIZWrB/5
	 JMsqqfDACtoGIois+HAIgAwMtjugm36x6OWCtvlyAts0B6JEYk9184UqSgl4nyxjRY8lK
	 lwr7h0HuUGXljs83BYTolmHtAf9NPk53p63/HKM/ZrQsf14u/1+uq9juiEXoZrrAaVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
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
	bh=J1hHQsXdlnOtmTGnFBEnZ5cjCsGyXToXrHaU8hGXCxw=;
	b=tEvkcO1QS2SQAFbesfut0tLjn1lJkZqycgnL2Y3v6gve7niPOs8KeB0zhKNPvulhdB5y
	 yIir+gdxvsD/7F58GWjN2wWIJW5xKO5QnukX7d77apQbuy6voe49/VgW8OmdOisBXaTMv
	 jAE9pYVheq+y6ujpOkISVtxGkAtBZH6EO6oh+r7xhjoqz6nFYWn9SZOpkExWnt/APeZ2e
	 uBQ8O8E30Gn2014psFbVGTV1hBrSH9JOgSJSvZ0zNvfAq/Pxufo8M7c8c3Xshw1xcKXHV
	 i18aeLuIHAgwBth7GY4O1nca/iH3bqDLUAJOYa+7XjcBvFgl4ZQ33tpr15Vqh5hBKJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvjohOBp;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=b8oXEh04;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050AD606A320
	for <linux-coco@lists.linux.dev>; Thu, 19 Nov 2026 23:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 050AD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DvjohOBp;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=b8oXEh04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130529; x=1826666529;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=J1hHQsXdlnOtmTGnFBEnZ5cjCsGyXToXrHaU8hGXCxw=;
  b=DvjohOBpk69FIRCnvaORcd2g81Ca2OiXUg1eCV8z7QYzwrN75PW9yrUF
   oBiIRmqGug29UzH7GLIvlVDMBpiwR39Vii87YjCWPnm0xSrdDMnK9yl6Y
   2xquavS9p678DI8Dfajhkr3YrL+/ShG7rciIYNVqgLlqt66UlBdTP7dmb
   mm306TJ3nvwqzV72h5WBIcPASql9FKgX1a/LOhN2oeVP4vgqF33grh1SP
   CFN2iulqxhfOFP7S69GVSpiuFh1tAnJ/IVDgIee3Y0SEfn+Z44hlkNy1m
   5OFuDouGirzfhiBXXSUqKci6cWL/jd3gGZs/fLKV0yDK274UTekfjxa3N
   g==;
X-CSE-ConnectionGUID: tuSkzX4gRVC++9j2tbbuAw==
X-CSE-MsgGUID: +qswEgLOQ/eH4139iU4Jhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3886101"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3886101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:22:08 -0800
X-CSE-ConnectionGUID: wqaQCTBQRXeuVzKN8jWWgw==
X-CSE-MsgGUID: ukVFc2qLTPuHi5S8egR6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10909082"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:22:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:22:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 15:22:07 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQKjLxGRueCJg3R2WCxckuRlMem39FdYzD3jagf+kSO3K29zxXyBzjRBhbtgLOviCvnVdEKu7DVlE8Z7Vk8CgnhODFRn0K7suIe+Yi5RWBFeWOuQKUfjVPwoy2jJtbYsIniCFuHRt3otJHqzJoWeZbfhIJH7Ft7+DpcXwFdpKNUX4Om9a3Pp/kYmc2eoFKXLtRW0+Iuiiuu2TVuFFeoARAne1v7tk1uV7MNkJIJ3sFLV3XPCjpAHakMbTHhgDHQfq0LSlGuZf3nS3oG7c7URQyCer+Kb5LG8oiwDIhRVxITc/udmM0ewiQftgrrmjdOaLTIV3jNVA1mI0GpC7WOp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1hHQsXdlnOtmTGnFBEnZ5cjCsGyXToXrHaU8hGXCxw=;
 b=VeTYUvGcDX2/yWtUIdjAltNgd0QppVlXwf42D1u1ZpSWk1MDosGBC/VpKUST1sVk+MHMK3xK9qCUiEhziRLyd9xwjBW5NzbE+MSYQWybqoQXgROoSgUQYyqUqbXl7jbDjChNkS+bmik5VTQAnAVoGcbofbW54F7LiFaOunM+DF3QRIwxSROeIidhw5Y2uMqQ5a/34cNe/aGFn2qF8PKCbuw2gQ3iWRxwSlwNXu/znh5L7P6vHClqeYJTyqy9bDJ/+Yujjw8kO35elSIJipZ1JhtQsMiYM5zefXQd/ALVN4IGg27IULAqs0mlaXMaos0S1KrVR+/ACgJeP25upc2EJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1hHQsXdlnOtmTGnFBEnZ5cjCsGyXToXrHaU8hGXCxw=;
 b=b8oXEh046Fad71i3hjFl8L7wG7PtXuj2LpQuD67yjuCev8sKi9PWaq5MIQRdJC7b3D2WSeVjLPKDLfpruXcYN/x7EB3/5rtG/oerZkeyylBeBd/+y9Py8G95hlissFOGmZqxr1Sx6gPK9u4r3XPhFy2gnzn9mWpzg5R06gUfHZE=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by PH8PR11MB7143.namprd11.prod.outlook.com
 (2603:10b6:510:22d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 23:22:03 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 23:22:03 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
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
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
Thread-Topic: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Thread-Index: AQHdS9rOiS8lYl8h5USZJ7PbdHTlXLcPfC2AgAUDyoCABx4TAIAZ+0KAgAArSACAAJ1GAA==
Date: Thu, 19 Nov 2026 23:22:03 +0000
Message-ID: <ca4c5aa76780edc1e2387d84ae219ff0f587168a.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
	 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
	 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
	 <eb3a3d57-fd98-4167-b6fb-27025e737097@intel.com>
	 <20261119135908.GR2245175@nvidia.com>
In-Reply-To: <20261119135908.GR2245175@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|PH8PR11MB7143:EE_
x-ms-office365-filtering-correlation-id: 0fec25f1-8d3f-41bb-dedb-08df4693eb63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|5023799004|261026140227099003|261022105027099003|261021121427099003|261022075727099003|261026121527099003|261028144727099003|261102123227099003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info: uvdBwdf1Es71XG1H6N7ha9GYwcU9l8BcWjJlr4kTkkF6leFlPUQAWVUFuubLXcfOfg+84cEsRC+41/eZnHzu6HZ29Ao2pJbjh15TylVJ6hnb77MdM52CotJ+/BtOHsRmLOebJGLkcSNdLC1vCT+yVxaRoWasS0/36Z56NHayzsTvivG+B0sJXpWRc3uOcd6GYO7k0wuUaP3Cpp4q07NschVJhj5fnC3rUn3zS1pEdfgXs7kfEHpibTmFORZ36qMQx7rz3brMA7FdWfW+Ck+inzJK8EA9neiwbKgxO9TfPZxahiIihNhJ4U+2vYW4Gba0RFbNk7VAE1Y5q4YeAXs/8ZslfIR+WwLpzsQhUwy1tpaIq4BrL+nxCb/KbfObNAg9Y5Slcltf9wrIUkZcS8YKC1Eiq1rkItfA9a1xDUuvuPgXrbEm2VC01UoOx26bpjSYJP9708R04AaOW1/Yz39BaV0/+1N3xtWn84FITSBEHNRLOUBrc5z8cAcmwo5Kt4oejzBpIrFyCCjOUeJd21fyZdsvU0vBMaod2rlpWs0tXHlCyEZkuwLDfiJQHN171029+RXFuphkewxDSZ8LW65kydRQwP0reB0LA4VWDvNpQAbBRtXy9PwzcuFm6zf8KHEeNjKsIC0/ig3+bCqU3Lbj+7/swpxpFi6zQEIq1LblLaFWQpm66cwJRbizGA0cHIJJLJki+6gyUvLjc4RglYZmBWn/oMdE7k4qR+fHRQ/q8cc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261028144727099003)(261102123227099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFhVExta0ZybmhNMjAvditYWC90Ky90VnJTbHo5MlA2bWRTNGh4bXc2aGFm?=
 =?utf-8?B?Mng1MnQvWHRHZmZkcUE1elhQWXpabHNhQWIxMXJYZDZFdXF6MzhrblhxR1VP?=
 =?utf-8?B?TDZIVmZwc215ZWhFWjdvTTVFYVI1ejJVOUxOZ2R5bDhjQ04zT2lLb1QvaUhF?=
 =?utf-8?B?dlROQnl3azZqdnhGWFZURVlXdDRLZFpVaXNKTGErME11U0JDZ09aVk1YbHNj?=
 =?utf-8?B?dktwQStUektZTm9ndGNHbHZvdG9hWEoreDk2NEVuUGZIbzRRWmFEcElZVmpB?=
 =?utf-8?B?MVlDSU9aZm5tam9sKzhEMG81ZHJBU2RuK3NrWWlicmdQZUJJUFYxd3B1OEtY?=
 =?utf-8?B?TC9Sbk01anNiWnFkczF0U0l4MjZ4d24zRHVNNGRSY051bWg5bGpnWFRVdmtv?=
 =?utf-8?B?Rm10U05Id1hicytNVCtjSWVNZVFDUlc5Z0UvSjR1VmtucDN6bGNMQ1Ayalpn?=
 =?utf-8?B?aFR6NU9vdG1pN2FJNFRBcElGM28zVnFySnhKWHBJN1NCaDRoQnJxZ25pTm5Q?=
 =?utf-8?B?UjY5ZHVxT3Vna29jbU5yNE1LcnVPYUFqVy9QbWdJRGlhdUZaT1dXM2xqdW45?=
 =?utf-8?B?ZllCcVBjUithaTQxVzY0TjZ1QmJ6OHFZMW1HYS9SeFoyRWZMdllyOVJ1TjFq?=
 =?utf-8?B?Y1JHbEl2MnNUOXVwclFxVHprNlZZOVFUc1JkazNiYThYcThUSEdZSEs0ckts?=
 =?utf-8?B?bXJqTWc0U1NHWG1BeTRQdmp2Q0V1NWpRMU1TM1FMTWpSWmpNeHM5ZTFMbTQ3?=
 =?utf-8?B?eEMzc3hDUktDYmd5Y3pBUXZoRVo1R3lwTElNSExoWmNJWGJDOWc3aDJ4V3RW?=
 =?utf-8?B?c2pDcmppZ0ZRVjNiZTFiRzNVbEwzbFQ1bGM3OElpZWNocUdEaVlqNjNQSGU5?=
 =?utf-8?B?Ri9QYTVUd2dDZVhUR0NYOU0rbmx4dEpFOW0xaTZhSmRNWHhmdExMb0pSUGEv?=
 =?utf-8?B?VWgxaUliZ0xocDdhVkhpTVZMVkphNHNFSnc1dkVSZ3NpTVNZYU5tVnZaaVBp?=
 =?utf-8?B?a1JpK29yU0xlb3FIZ3ZlZHFMNUxnVlJYNWNQQ2NKR2p1UVVNSloxczFidGl0?=
 =?utf-8?B?ZlZsakNQNU0rbmkyODZZWnBIeEdNOWFPR3lFYmd5UDdadmlCRjBxVlVEV05j?=
 =?utf-8?B?UWhMTkduODNlT2gyT283dFVyUGxIOUFEcW8xMzBUOWZHWWxUMWFVTThZdjVE?=
 =?utf-8?B?RndmTDRKcFJVVE9UNU9wcFNSRzRGb3hVZzBJcDZDeHFwRUxVTWNsWnBtWXFJ?=
 =?utf-8?B?bVlVQWpXUE83MTF1dm1nSW9qTWtoeTh1dzUvazJkbEdaRURDMmJFdGhMdU56?=
 =?utf-8?B?eUY5WEdYRFpUd2VOQWMyczlSTUJESkFseit6NlhrM0ZOamRoREg3dEhTZDJE?=
 =?utf-8?B?aW4zVkYzYjlZZEY3YWRES0hEeHRNRGlCWnJNeUdmb1crL0ZPK3c2YmZuN2RN?=
 =?utf-8?B?NnRlWmtDYVRNUDMzMnh4Z05HSm9WdjZ4ZGdxdTBDZzFjRkFLdCtqN0NXemRI?=
 =?utf-8?B?V092VFhXSUJrcGg5RTZVY3B5SStqd2ZkMGgyVTIvOVFTSW1RVVFYWkJhTkJQ?=
 =?utf-8?B?YkpMeFhjN0N6dnVqTGFmY3dKUGlkR0hxRmxxOWx5Sk1EeThCNXlmKzdmYUow?=
 =?utf-8?B?YzhDb0ljV1VVNmZ3UzIrcTNHZkQrVmNYWG9LTU9vVStXSmk4YkxqZVM0WFJP?=
 =?utf-8?B?MU5hVlVJbHlxaDJ2Q1NnaDFMd08xUGJEYjc3SnFVNnA0U3FBVmNZMGRmWWVh?=
 =?utf-8?B?TUIwckFxWFZkWGdVd0RpOW9FbUNzM1phTkxuMERaeWV4TDNiZ1JDdHhIUDMw?=
 =?utf-8?B?N2p6MnRTSmMwK1FIZGtndU92ZXpDY0F6V1hVQ3plNkNyRVZvWC8wZWZhUlY4?=
 =?utf-8?B?OEQwaHJKR0hLY0YxU3oySHFLU0EwOS9pM0o0UERlZFVhQVJPaWViMVQzbEFn?=
 =?utf-8?B?U1hwRElUcitlQzlEbFE5V3oxeWZSdmREZDFzZEJEYzNad0lkcUtWWEFBMnFL?=
 =?utf-8?B?VlhXY0cvQXliS1pBcXJLbDJuZmdoa0dLRWJRak9yaVFYVyt5N1hXTlpDN2dS?=
 =?utf-8?B?WjBWZFRqT292WDNFdU1yaXpHSC9rdnlCaTdCSk9iVXpBdDBiNG0ra3ZJSzAw?=
 =?utf-8?B?ZWpvbHJJcUhFWEhPSVlNUkJ0cGJIY2FHSXF1NWdNRElpS2hJM0Y4MHlGb2p3?=
 =?utf-8?B?V3Nmc0FYVjJ5RHVzM3VkVFJOOXZMRTNFcUlBR1BuVEtTRzh6YTBnTmU5V0lE?=
 =?utf-8?B?aWRBVjZEc1E0akN4ZWtEeFkzaTdHYitVMUNKVVo2Zys2S3k5MUVKRTdmTkR0?=
 =?utf-8?B?bXlQOEtMKzhNWGw1alNTbzVqa25sdUhMZENxUUhiVHNGSTErVHRmYmw4dE1y?=
 =?utf-8?Q?WIeXv52RwBL1f5SY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0C40B90CC7A6944BA96E46FDA1B510B@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: lJVaAzkPIcTOdCCKbNiet12Ppx/HtM5PMrn4AJsfh6ieCmQkxUxLoRj+A5XSoOBP5ie+BhtdkBqymomFOC2iB902n4nd5CzDi+NVZ3S6I2CTmOZXi5+7bkag6/EY7lYELyKUtBmBwhC/37+kEwv52aRymaaaC6tXjGisSHbE/Os8O0eKt1oGFmLgtBQY7vY8XIT4Op9V3TYvNVsoqqM0hKsnoaFTGjxhaJX8bwNyx6DVh7PE0u8rmxKswEyunm3hRiCkxZCsZNx4N1+r2hmJ8v44uNfHp60MtkD4MIBEvebh18m7nlnY+KprRYcXNw8RwSFvjIrkmhNLY4WTn29VaA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fec25f1-8d3f-41bb-dedb-08df4693eb63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 23:22:03.3195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wc4QuDrvlWRQBeoNtM+qQ23L4uU2Apreo3p76vXsdolOTlGQD7FCA1nZQ0k+blrd24VuFKzvn5Cogw8cOxQoZSqPVpBp/hsv4TDjDyiZAaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTE5IGF0IDA5OjU5IC0wNDAwLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6
DQo+IE9uIFRodSwgTm92IDE5LCAyMDI2IGF0IDA3OjI0OjEzUE0gKzA4MDAsIFhpYW95YW8gTGkg
d3JvdGU6DQo+ID4gT24gMTEvMy8yMDI2IDY6MzggQU0sIEVkZ2Vjb21iZSwgUmljayBQIHdyb3Rl
Og0KPiA+ID4gT24gVGh1LCAyMDI2LTEwLTI5IGF0IDA5OjU2ICswMDAwLCBEdWFuLCBaaGVuemhv
bmcgd3JvdGU6DQo+ID4gPiA+IEFmdGVyIHRoaW5raW5nIGFib3V0IHRoaXMgZnVydGhlciwgYSBz
ZWNvbmQgLnJ1bigpIGF0dGVtcHQgY2Fubm90IHJlY292ZXINCj4gPiA+ID4gZnJvbSBwYXJ0aWFs
IE1NSU8gYWNjZXB0YW5jZSB3aXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBJdCBzdGFy
dHMNCj4gPiA+ID4gYWNjZXB0aW5nIHJhbmdlcyBmcm9tIHRoZSBiZWdpbm5pbmcsIHNvIGl0IHdp
bGwgZW5jb3VudGVyIGEgcmUtYWNjZXB0YW5jZQ0KPiA+ID4gPiBlcnJvciBvbiB0aGUgZmlyc3Qg
cmFuZ2Ugc3VjY2Vzc2Z1bGx5IGFjY2VwdGVkIGJ5IHRoZSBwcmV2aW91cyBhdHRlbXB0LA0KPiA+
ID4gPiBiZWZvcmUgcmVhY2hpbmcgdGhlIHJhbmdlIHRoYXQgb3JpZ2luYWxseSBmYWlsZWQuDQo+
ID4gPiANCj4gPiA+IEhvdyBkb2VzIE1NSU8gYWNjZXB0YW5jZSBmYWlsPyBXaG9zZSBmYXVsdCBp
cyBpdD8NCj4gPiANCj4gPiBBY2NvcmRpbmcgdG8gdGhlIENvbXBsZXRpb24gU3RhdHVzIENvZGVz
IGRlZmluZWQgZm9yIFRERy5UREkuTU1JTy5BQ0NFUFQgaW4gVERYDQo+ID4gQ29ubmVjdCBBQkkg
c3BlYywgaXQgY2FuIGZhaWwgZHVlIHRvIHZhcmlvdXMgcmVhc29uLiBJIHRoaW5rIG1vc3Qgb2Yg
dGhlbSBhcmUNCj4gPiB0aGUgZmF1bHQgb2YgdGhlIGhvc3QsIGFuZCBhIGZldyBhcmUgZ3Vlc3Qg
ZmF1bHQuDQoNCldoYXQgYXJlIHRoZSBvbmVzIHdpdGggdGhlIGd1ZXN0PyBXZSBoYXZlIHNvbWUg
ZXhpc3RpbmcgaXNzdWVzIHdpdGggbm9ybWFsDQphY2NlcHQuIEknZCBwcmVmZXIgbm90IHRvIHBp
bGUgb24uDQoNCj4gPiANCj4gPiBUaGUgbW9zdCBpbnRlcmVzdGluZyBvbmUgaXMgdGhlIFREWF9P
UEVSQU5EX0JVU1kgZHVlIHRvIGNvbnRlbnRpb24gb24gc29tZQ0KPiA+IGxvY2tzLiBFLmcuLCB3
aGVuIGhvc3QgaXMgb3BlcmF0aW5nIG9uIHRoZSBUREksIGl0IGZhaWxzIHRvIGFjcXVpcmUgdGhl
IFRESU1UIGxvY2suDQoNCk9oLCBobW0uIEJpbmJpbiB3YXMgZ29pbmcgdG8gbG9vayBhdCB0aGUg
aG9zdCBwcmlvcml0eSBiaXQgVERYIGFyY2ggYXMgYSBnZW5lcmFsDQp0aGluZy4gQ2FuIHlvdSBz
aG93IHRoaXMgZXhhbXBsZSB0byBoaW0/DQoNCj4gDQo+IFRoZSBob3N0IHNob3VsZCBoYXZpbmcg
bG9ja2luZyB0byBwcmV2ZW50IHRoaXMga2luZCBvZiByZXR1cm4gY29kZQ0KPiByaWdodD8NCg0K
T25lIG9mIHRoZSBjb250aW51YWwgY2hhbGxlbmdlcyBvbiBURFggaXMgdGhhdCBldmVyeSBsb2Nr
IGluc2lkZSBURFggaXMgYSB0cnktDQpsb2NrLiBXaGVuIGl0IGhpdHMgYW55IGNvbnRlbnRpb24g
b24gYW55IGxvY2sgaXQgYWJvcnRzIGFuZCByZXR1cm5zIHRoZXNlIEJVU1kNCmVycm9ycy4gVGhl
IGNhbGxlciBjYW4gdGhlbiByZXRyeS4gRm9yIGV4dHJhICJmdW4iIHRoZSBndWVzdCBhbmQgdGhl
IGhvc3QgY2FsbHMNCmNhbiBjb250ZW5kIHRoZSBzYW1lIGxvY2tzLg0KDQpTbyBmYXIgYmV0d2Vl
biB4ODYgYW5kIEtWTSB3ZSBoYXZlIGJlZW4gc3RyaXZpbmcgdG8gbmF2aWdhdGUgdGhlIGNvbnRl
bnRpb24uIEFzDQppbiBkb24ndCB0cnkgTiB0aW1lcyBhbmQgZ2l2ZSB1cCwgYW5kIGFsc28gZG9u
J3QgbGV0IHNvbWUgb3RoZXIgY29tcG9uZW50IGJsb2NrDQp5b3UgZm9yZXZlci4gSW5zdGVhZCB3
ZSBicmVhayB0aHJvdWdoIHVzaW5nIHZhcmlvdXMgc2NoZW1lcyBvciBURFggbW9kdWxlDQppbXBs
ZW1lbnRhdGlvbiB0d2Vha3MuDQoNCj4gDQo+ID4gPiA+IFdoZW4gLnJ1bigpIGZhaWxzLCB0aGUg
ZGV2aWNlIGlzIG5vdCBhY2NlcHRlZCBmb3IgZHJpdmVyIGF0dGFjaG1lbnQsIHNvDQo+ID4gPiA+
IHRoZXJlIHNob3VsZCBiZSBubyBkcml2ZXIgTU1JTyBhY2Nlc3Nlcy4gVGhlcmVmb3JlLCByZW1v
dmluZyB0aGUNCj4gPiA+ID4gZ3Vlc3Qtc2lkZSBNTUlPIHJlc291cmNlIGVudHJpZXMgYW5kIGZy
ZWVpbmcgdGhlIGRlc2NyaXB0b3JzIGluDQo+ID4gPiA+IHRkeF90ZGlfbW1pb190ZWFyZG93bigp
IHNob3VsZCBiZSBzYWZlLiBIb3dldmVyLCB0aGlzIGNsZWFudXAgZG9lcyBub3QNCj4gPiA+ID4g
dW5kbyB0aGUgTU1JTyBhY2NlcHRhbmNlIGFscmVhZHkgcGVyZm9ybWVkIGJ5IHRoZSBURFggbW9k
dWxlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlcmUgaXMgbm8gVERHLk1NSU8uVU5BQ0NFUFQgQUJJ
IHRvIHJvbGwgYmFjayB0aG9zZSBzdWNjZXNzZnVsDQo+ID4gPiA+IGFjY2VwdGFuY2VzLiBSZWNv
dmVyeSB0aGVyZWZvcmUgcmVxdWlyZXMgdW5sb2NraW5nIHRoZSBkZXZpY2UgdGhyb3VnaA0KPiA+
ID4gPiB0aGUgVU5CSU5EIGh5cGVyY2FsbCwgd2hpY2ggYXNrcyB0aGUgaG9zdCB0byB0ZWFyIGRv
d24gdGhlIGFzc29jaWF0ZWQNCj4gPiA+ID4gTU1JTyBtYXBwaW5ncywgYmVmb3JlIGxvY2tpbmcg
YW5kIGFjY2VwdGluZyB0aGUgZGV2aWNlIGFnYWluLg0KPiA+IA0KPiA+IFRoZSBVTkJJTkQgaXMg
aW52b2tlZCBieSB1c2Vyc3BhY2UuIFdoYXQgaWYgdXNlcnNwYWNlIGRvZXNuJ3QgZG8gaXQ/IERv
IHdlIG5lZWQNCj4gPiB0byBoYXJkZW4gaXQgdGhhdCBkcml2ZXIgYXR0YWNobWVudCB3aWxsIGFs
d2F5cyBmYWlsIHdoZW4gdGhlIFRESSBpcyBsb2NrZWQgYnV0DQo+ID4gbm90IGFjY2VwdGVkPw0K
PiANCj4gWWVzLCBMZW9uJ3MgdHJ1c3QgbGV2ZWwgc2VyaWVzIHNob3VsZCBiZSBwYXJ0IG9mIHRo
aXMsIHVsdGltYXRlbHkgeW91DQo+IGNhbid0IGNoYW5nZSB0byBsb2NrIHVubGVzcyB0aGUgdHJp
c3QgbGV2ZWwgaXMgZGlzYWJsZWQvaXNvbGF0ZWQgYW5kDQo+IHlvdSBzaG91bGRuJ3QgYmUgYWJs
ZSB0byBjaGFuZ2UgYXdheSBmcm9tIHRoYXQgd2hpbGUgdGhlIGRldmljZSBpcyBub3QNCj4gaW4g
dW5sb2NrZWQgb3IgcnVuLg0KPiANCj4gSSBoYXZlbid0IHNlZW4gYW55b25lIHdvcmsgb24gdGhp
cyBkZXRhaWwgeWV0IHRob3VnaA0KDQo=
