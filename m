Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793659112;
	b=WKtBU53rMX5V8nTcnZKTZAQBl66xrIqqricSrn23qLGtwd2w+rGJZQs/W09hdqibQ83b
	 FC3V0atIIleYBUqyFgvMZ0iR/EpbGCZhM+hCId2yksa38yrjCl3ferGZUkysioFXXACwL
	 DE9GaPyODypWloYcfvgGLIDi9hNfXel2I+BEpgGf8eiK0niNmG9ZVmqiB9JOMwX+6X6Lz
	 uMFi5OfsGWAmKsEsayw+iSKDwSqF46EdZmn5OR8ghjlhYS+q7/qyRxfkGHJWfliGRzHq6
	 BX4Qj/gv48hkbBOK9pmGBp0dAANrJtpQzTFcFLeHf8nKwmQn4stLNSJ7156rWUwD+ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659112;
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
	bh=FPVulPPpAGsrVZxIhylBCVJbV/iI8kX9bISwQF6bXTA=;
	b=bxNBGyjJk0iA7THT3aBiWTV9Q9YLqAiGFKAYhsppKVN2rH8bj0In14vkj6TMFnMaXK/C
	 oIJaUw1hJAlifDspZrCRCt374UGYqRkPrpAvFf77qJLX6XjUhZhY2Vt+WsXOi6pdc3LZ3
	 8p7v4+b2COAu+1UqPtrKcinBTBXq4g/uyaFYFXVMaTP27e+38wBMOSyVgtH0yNF96igJU
	 qv7Q4Aa/Oes13PYb8gTmZGcyI5B2C5PWNe98n8QC/2U1BnlXyNBK4f46I19Av3B654wSi
	 SqE8JF79HIuadcVZbbycZqc40ckB2U7pjyPI3bcrBCj9kVeaISV639geHwu+N2m3wOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZ1HKcjd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B6606A32E
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 22:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005B6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZ1HKcjd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793659112; x=1825195112;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FPVulPPpAGsrVZxIhylBCVJbV/iI8kX9bISwQF6bXTA=;
  b=TZ1HKcjdE68BI2MInT49OwNMIKI5zheOWSnKpOiBsDjjnCEY+tKW48p9
   YaV68eJ/T1Tbpd1uEL8WfUYd2c0JVfjZg4cZ09T0IWnqWPsLLTHykL65A
   veAHYQaEwnLkahbSBXG0Fwbdo9EkaP+rVBuQuSxCUuasmtGfVqyv/8lGt
   oLTekQgOiO7S87+PClfXlCJylGvPRkx4age+Q18nBTmDL2FeqR+DcVN3p
   6OUkGOIcf4QD6Rv4uyp912Uu8YQYr2SQwtOM/STK4DfxMqNu2Wh6gryCb
   jK9Il6F/PKZzo68zGn7Jj8PXI+NRymXOp80kA2AicZpDCS5sjs2x3Jx1G
   w==;
X-CSE-ConnectionGUID: BjQ7RDpgSYC4dRDnF/JcJg==
X-CSE-MsgGUID: ifTyxK78SgeOjmN1G2a8kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2379944"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2379944"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:38:31 -0800
X-CSE-ConnectionGUID: LO0CNqKRQM6/h0ynIOJ6wg==
X-CSE-MsgGUID: kwHTzLWHShOAidaetZN2tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6357795"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 14:38:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 14:38:30 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 14:38:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 14:38:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcO8YvFVlwtANTKHp9uaN/9YdAfyB54yD57KUtnq4+d3tAF9YwxsjkqyT9vGj68s2dtRNFfMFAFubb5JHyrBRUz1i1gNHYFow59LkKXXh5C7XEUVwSBdWvwDOR4eAT7rpbZxvX3XbWloya5XXzd3Ns/H3yrCEcjwNsodgDbYtYk50gpvkVTBZFSq3fLdLF+rOkNKgS/18ufG7G8ozBavDcrOH/wlAkZ0o8IO018jBxFHzP9ymbT2m4YlgshTr9a77yH50BzUtbSMGZwW7cs/aXUi1otBjlCFPWzKYnu5Ry4pHSa3FcSSxt/rwkZjQEdj1+iyYe562PC58iNYmCDiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPVulPPpAGsrVZxIhylBCVJbV/iI8kX9bISwQF6bXTA=;
 b=IuzUMZ82LUmx1iPYdLxA+xDedGah6rP/k60wTYQRreuOTG0ak5nTYfld+XNlIjvbkvYKiSFZPU/eD/SVRJWxyTI1a4SfTvTltkWRaE6QBy4u8ZWv/vQYs0u5j+ur+zlfzHnEJgJfF1rCHg/ZPcy2zscWUZwLCDNFRS+3mwB4xeYr252Lemp6pAJ99nIwVU8RHc0C1oCWRPpHj33kaV8j+wtaHERNf1BxdkvQ1crJftD9+f3aTesaKF1HHOTbioEItg7TSDPsr2O8vUjYk20TAwnuF17JyDAfQ7YIlu5x95j5M4bTjJy3i/JVaJT1mzcaEQspYCrpzY/a93IEU5YZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CY5PR11MB6511.namprd11.prod.outlook.com
 (2603:10b6:930:41::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Mon, 2 Nov
 2026 22:38:27 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 22:38:27 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: Re: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
Thread-Topic: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Thread-Index: AQHdS9rOiS8lYl8h5USZJ7PbdHTlXLcPfC2AgAUDyoCABx4TAA==
Date: Mon, 2 Nov 2026 22:38:27 +0000
Message-ID: <a3ee7e7be28462bff75383f0ca3af1cb8275d125.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
	 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
	 <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136CAD09013FD9A79EB06ED926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CY5PR11MB6511:EE_
x-ms-office365-filtering-correlation-id: 7c63b438-0e16-4f96-d923-08df3932035d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|261102123227099003|38070700021|261021121427099003|11063799006|261022105027099003|4143699003|56012099006|261028144727099003|261022075727099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 7+z/Qe4yQLUUFNtOgNYKE0p2cHzwq93hZ2XsZqRkriqAAf3zQFaChPAlb9DsNTIb8ouJeDQt2ilIuuJlgeDllr2F+rwulNwnqatjgmfHoxlGwVB4wLGshgs2Q3ERq7LuYURAn0zBVvG7vuezw01wB+nP08vxEh2lxRI587oMbbVCnmH3dx+ZNPJ4SmaqMO1ZyX6wl8WHkHXpwbmsZFQuU3w8Go0EvuqFKMhrNAzUEv1SJOylJ3suAKPnbYXu7dME4UsFN2NWWGM/8ok3aMP11Wxnnses/RpED06Llx0rAM8HFWJfTokvUdcBToRrafQVHnbeFGDafYMBGudZq7Mm0aeGh06BZfDaD9OEGI3ORV1zrbH4LYayxLEEH7yXzHnSZQ2JTb9KN47VJCMgOvqE82c9GtkfSseNMI+cXNjLZx88EIdqY/BkGn31bxXSw3t/18mwBHHRb8MupTWhRNNEsKJne/Uep4bGZuUpdAMQFnK51KGgCvzIlz31gXn5m+bM+Mri0Ewkth8DN04gSqDSy1A+RhjYy9KOrw2PApC4e92hfPhQwg5LUATelh+VD2zrgMb0bMDovBPozjqKNFfP2gP0vzzDv4GR8kYimJD2hMBv6xxKdgbagmz+0yRWnZ2H42toZ83JdMbH0BhwAGjyfCtg2+Yp1mAda33X0uIZ9C9CML0c/PV5x/ETCA3pqsXBsdKbKd2pEL2yL+nr/9ol9SFVgQoO+j/pRmGB4Y6aTSc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(261102123227099003)(38070700021)(261021121427099003)(11063799006)(261022105027099003)(4143699003)(56012099006)(261028144727099003)(261022075727099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmVHUFV4NFIzak9ra01MSFZyOUNZQisrNVF6UDRtdDRJYUdOc0lsaXdaY3VE?=
 =?utf-8?B?VWZmUVgvTjlZRWlrQVNZeTN4cW54U1JSbUxjNHYxaEFrWVljRzgrUGZrV2p6?=
 =?utf-8?B?WGIzc0FtTUtRN2dLd3h1QmVuQkhoYkFDU0xPeTNraWZnL0IrUkZMdWM5TmJ0?=
 =?utf-8?B?WHZvcWpvbE1XSDVWOHQxcStNdWtOeHEyaWJCREdWd3FYRDNFaVdpQnJNWm00?=
 =?utf-8?B?akF6dDhCK1o2K1F5NThlVklVdDBWcjkvRmlaU1VDb0hMNWhkNm0xTWpIZVBP?=
 =?utf-8?B?RGs3ZHZGM0laWE5VcEdHWXBEVVNFWlA1TEloMDNLZzdaYXp2OHRvMXVQWE5N?=
 =?utf-8?B?ZVA4cUViT3lvVjk1cVE0Z21UbmJxZnJhTGVzdnU3dnZZbXQrVi8rL2c4S3Bo?=
 =?utf-8?B?bk9GcVdDaG9hak9KRit4dFlDT2J0ZWNTWEpHWmNOUHc4dFFPeWhXT2VqdTJs?=
 =?utf-8?B?am12WGwrY0JvVkpHOGxwRkJJUjJxTFp1dVhQa29PSmIxblRBc3B1UGhaMUUw?=
 =?utf-8?B?dFNSeWdJc3NJa0JyYU1EZ0J5V1hZRXJ6MDIyRnVqblVKc0Fyd2dSeDJaSmU2?=
 =?utf-8?B?WHgra0hJWWY1bUxuME1kb01iNStmUDRSNXkwZE1laVBtbkI5ZTRXRW10c1FJ?=
 =?utf-8?B?UU9kdExsVG5yOEhxZzlIb0x2NTRPNXpsU0grbjNwSDVkc2kyWkdiWXNYSTh4?=
 =?utf-8?B?ZFkzdlpsV1p3dVpBYkFWOW9zN1QwWlhKOVc3TmtyZXlYUzNkbjBjT0Y5TXZC?=
 =?utf-8?B?dFNhOGtaOWwxTVdCS1htVzJpYmtzRnNESmEyM2t5YityM0MyT0lkVVlIN0FN?=
 =?utf-8?B?RTdPYnpTQjkwVFZ1NDJxSlczM3lPcE5DblZuWm5FRVQrREE3OFlmRHgzRmg1?=
 =?utf-8?B?bjJDRmVBalJQVXNjbDI3TjVWZnlmeGRqSXJua1JCVWdQNkM2eUxpbkp2d0lW?=
 =?utf-8?B?bHdtUk9jSjBHSEtRbThRWVNaa1VOVThuWEFKZUJBY0ozNksxUjhmc1NtaGU1?=
 =?utf-8?B?eVE0VDJjcUJqWm1uOEd4MkRpZmFxZStOeTFncDEvNUhKNGlvYXU3RkZDYjdK?=
 =?utf-8?B?R2ZQQm90TW5FbUlib1ZUOEJWNEtxeTh2MHpuK0pOWmkxNVhpMzdUZlNSOGhX?=
 =?utf-8?B?ZzR2c01MRnhUbWF1eHJ1bDNJMU9SVExoVDhRNTVDelJKOVZBUHRneVpBVUZn?=
 =?utf-8?B?ZnQ3b0hPN1lNVHY4VUpLdHlleHFKbmZUVS9QaG8yRTRYVHNBMitXSkwxZDlR?=
 =?utf-8?B?dnJEQmJHdjZvdUg1bXJFcUplN05PcFlWN29xK2RyalVMTWFqZGQ4cXp2eE5y?=
 =?utf-8?B?VDFwSkNuVlNnd1R4L3pIY0NtWXQ0VFpUN1dSYzNiUjVROXFJTzRPVFVSVUpi?=
 =?utf-8?B?UlVKRW9zQ2srSmcvcUhDMERnd2RWYWdJVjFMUXR2amNXeXFTMzFWUS8vWmlP?=
 =?utf-8?B?NTNNRUdaY0QxY29QMTZqNld3VW83dWpVc21pakNsL2s3eXNHdHhRVEU1WjJn?=
 =?utf-8?B?WGhEbFJ6bllwSFkrNzA2RW5HM1VoSlpTVEN5OVpOci9kNG9Qd2ZYYnYxQVpF?=
 =?utf-8?B?TmxDZnZtVHlmWVVjSnBqOVZwL1VHTi9ZMTNVRCtrWnpzM3NhbXU5NUllMWFJ?=
 =?utf-8?B?MlEwbENDT2d3Sk1EcUdOL3B5ZkFsZUozcXVLTzJsdXpZYWFOUUhZb1l6V1cz?=
 =?utf-8?B?bSswazVpcGw2cHhLKzdmcC85NXYyVGsycEpPQVo5ZXNzWi9KbzVvaUpoM0ZT?=
 =?utf-8?B?NUw0OEFwRE4yK0RBdHJrNkh0YUhLK04xTVVEU0s3QktYcEdtMysrdkZ2akxx?=
 =?utf-8?B?eTJ2cFFBY3k5eDM1WXRyTVN0SG5oakJ3QVlKdUV6aWhDRjA5QXVNdmJGbExH?=
 =?utf-8?B?QkVDcVJWa01YcTBKMUhlRWhiaUJLNk9VWjY3UldBQkZwT2VoRTBzcy9TL2tv?=
 =?utf-8?B?ZlJvZVl3eGJaTURuTzc2bDNVMlYxd1hLZFAwUlc2Y0ZxU2xVUGVEVks4NVp6?=
 =?utf-8?B?SnF3SXVITGtpc3I1bW9OYTdJTTd4cTZHb1BjLzU0SCtTVEpqRHRKOEcvcTIr?=
 =?utf-8?B?VWlMVHJONzlzZitEaC8xVkN2SGNNM2toV3dPM2t1c1VqMUEzZ1I1bnc3Y0h6?=
 =?utf-8?B?dzNydWljNHVtSDBsK0c2dFpvN1owS1FtblhjcHJHY2RRUjRBL3lNeHljZ3hl?=
 =?utf-8?B?Vnl4SEo1MFozcjcxNk5CNHMxc1NkcDRITldleTB3a3NXZ1JORFlxelhWRVgy?=
 =?utf-8?B?YUhJckgzZnpWMWJ5TUdKSXJvbzZTYi9xNW1SOENxUkRDZXZVL0dobTE2Z0ZZ?=
 =?utf-8?B?ZFVpa0FETWdRNjgrcEwxOHMwY24wTGlaRmNyN1k1S1BYMWFJYytkK09MVUdK?=
 =?utf-8?Q?BYEt/VKVF1Pu2WkA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <255D834FAA1B984DA701282CE80B877C@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: Jvz/qAjsGJF5YjHqE0TKw+aZLpks2PTsOlsJ+gQWN351/HnSxpNCRAhKVboAvAUq/MKgwTnhfL1httGf44jy4n13Lw31LSeL58tLmsmp3gp4djIhbYMPBWFpRswa9wvW2QPH0yOwyDCI58cRWZaruS2Nrk7kRGG33JcMm1frShN4j2Wey5lvkAj9jtHoQ5sJlaXecetBu/Bpn/E66Co2rXjADV6OXidIQf+gslnXUnuGIptjxDuBrEwJ6ph+T5PlLADEe+PirJPEftM0BlhguU4dJwe7V4BQc9FXuQHjJoUXwqLlYgcKmAMORucGaU6uhe6Z6lKA6yTjJ6ukcjX7CA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c63b438-0e16-4f96-d923-08df3932035d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 22:38:27.7031
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8py5noeLW7R3QiCF6ov/0NlnBn/NiNxMv2j30CXQlbD7qUMc6w8E9Z8Cnm2xmYUob6XQMFMzD+2H+f+NGMRd7FO68ua8KNM9KJ6XZvjoek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTI5IGF0IDA5OjU2ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IEFmdGVyIHRoaW5raW5nIGFib3V0IHRoaXMgZnVydGhlciwgYSBzZWNvbmQgLnJ1bigpIGF0
dGVtcHQgY2Fubm90IHJlY292ZXINCj4gZnJvbSBwYXJ0aWFsIE1NSU8gYWNjZXB0YW5jZSB3aXRo
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLiBJdCBzdGFydHMNCj4gYWNjZXB0aW5nIHJhbmdl
cyBmcm9tIHRoZSBiZWdpbm5pbmcsIHNvIGl0IHdpbGwgZW5jb3VudGVyIGEgcmUtYWNjZXB0YW5j
ZQ0KPiBlcnJvciBvbiB0aGUgZmlyc3QgcmFuZ2Ugc3VjY2Vzc2Z1bGx5IGFjY2VwdGVkIGJ5IHRo
ZSBwcmV2aW91cyBhdHRlbXB0LA0KPiBiZWZvcmUgcmVhY2hpbmcgdGhlIHJhbmdlIHRoYXQgb3Jp
Z2luYWxseSBmYWlsZWQuDQoNCkhvdyBkb2VzIE1NSU8gYWNjZXB0YW5jZSBmYWlsPyBXaG9zZSBm
YXVsdCBpcyBpdD8NCg0KPiANCj4gV2hlbiAucnVuKCkgZmFpbHMsIHRoZSBkZXZpY2UgaXMgbm90
IGFjY2VwdGVkIGZvciBkcml2ZXIgYXR0YWNobWVudCwgc28NCj4gdGhlcmUgc2hvdWxkIGJlIG5v
IGRyaXZlciBNTUlPIGFjY2Vzc2VzLiBUaGVyZWZvcmUsIHJlbW92aW5nIHRoZQ0KPiBndWVzdC1z
aWRlIE1NSU8gcmVzb3VyY2UgZW50cmllcyBhbmQgZnJlZWluZyB0aGUgZGVzY3JpcHRvcnMgaW4N
Cj4gdGR4X3RkaV9tbWlvX3RlYXJkb3duKCkgc2hvdWxkIGJlIHNhZmUuIEhvd2V2ZXIsIHRoaXMg
Y2xlYW51cCBkb2VzIG5vdA0KPiB1bmRvIHRoZSBNTUlPIGFjY2VwdGFuY2UgYWxyZWFkeSBwZXJm
b3JtZWQgYnkgdGhlIFREWCBtb2R1bGUuDQo+IA0KPiBUaGVyZSBpcyBubyBUREcuTU1JTy5VTkFD
Q0VQVCBBQkkgdG8gcm9sbCBiYWNrIHRob3NlIHN1Y2Nlc3NmdWwNCj4gYWNjZXB0YW5jZXMuIFJl
Y292ZXJ5IHRoZXJlZm9yZSByZXF1aXJlcyB1bmxvY2tpbmcgdGhlIGRldmljZSB0aHJvdWdoDQo+
IHRoZSBVTkJJTkQgaHlwZXJjYWxsLCB3aGljaCBhc2tzIHRoZSBob3N0IHRvIHRlYXIgZG93biB0
aGUgYXNzb2NpYXRlZA0KPiBNTUlPIG1hcHBpbmdzLCBiZWZvcmUgbG9ja2luZyBhbmQgYWNjZXB0
aW5nIHRoZSBkZXZpY2UgYWdhaW4uDQoNCg==
