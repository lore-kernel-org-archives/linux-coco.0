Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793166157;
	b=kJZZ/dt5l0vJtE49mRK0kHELiGpi//rF0hVyZpbY9PTUC+NJP1xiE8q1TbQxiK7VEODl
	 SS5hy2v9ltUkvkKdWOBwzTfqLb3St9OnmN0Hhs3ho4DtDmvc1J6kBCCRSYCvIHpLgylvv
	 UevCkg1nkOzEOtTusaKo3Gmi7WeKDPrkiMRX0blPOlkgTFhK9bNKaq6067t+Jg0F6dyEr
	 a1MPhvyyKOkmQ2a13Ckv63kCe7qEmC+QqMQzSKR6OvtFIco7yuYFMfQEdXglBjNs55Tng
	 hdmgr1k5wWMPTWcUl0/adY5Vlf/Lj1DVQDhx5oSMU5e39tsr2QtwexuBfQaXUpo4O8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166157;
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
	bh=Am7bjZBYScLgyoyWbFhZTPXxZ/d1bUd793wlxqGNnVE=;
	b=lCbKaCrCNWlJ6SOdCj3xhqOgBaFPpBLhkH/6W1ChKJdXF4a4oEaH/N848fprL2k9amfS
	 KDeAsvEfE6rTVlkVt5M0lvJtxWhxd26/DnZUWhue8meY4gu6byNN3mO1T7wq9AthcyB83
	 5uL88pfcCUa/f8oc52t0Z9L9u5hrEwHGDEoPuX45kBYKQBl+GdvA+FW8sWmOyd/EmaGb+
	 /mEuevCju5oBTgtfnSDPUgu5jCwHseVhxBCu98o5I7UOolef/u9ahYx2ZVbmSzkuLdEXT
	 3K5eThGRVCu/mMMhK+2Upw/Eaowv42bI8Ob6dJlGY6T2YvqojslFNJeXKy9ND0tpetQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WCkU5u8t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B2D606A31D
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 05:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B2D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WCkU5u8t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793166156; x=1824702156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Am7bjZBYScLgyoyWbFhZTPXxZ/d1bUd793wlxqGNnVE=;
  b=WCkU5u8tMV6dIGmxm8hty0X06QdhLuglQT9U0KA/s0STWpHk8mzK8LWU
   Ie2csP4YejKZ0NVnaglmeqRirq4/a74ypM3mEN03znH1D82hIfXCKVdJh
   i169lOLA+OoiRXs+XZiLcHkezK4OiWvuI0qbXejTkuYhXq3HZr7GOwum9
   6505CgtJr0wLnrzRX+ldySlWsqYrJDZqEikWx1N9A8ep6thVyCK0fhb7H
   0mzjc5TqBGk5BFQEIRcD9XnExAIEj3PZ5/syRcyYVdI79kD9WtNZtR91g
   CFwEjXB70awa0S+O5wUFXoCkXtM9C3gQTLukW22IOiU+VnaUMso/D4CP+
   A==;
X-CSE-ConnectionGUID: 069dniGASti8TPDTnQR8Ig==
X-CSE-MsgGUID: PEJv08YySM+hK1WgNAjYqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1983632"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1983632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:42:35 -0700
X-CSE-ConnectionGUID: zHrTC8NKToumX/PMs41cHQ==
X-CSE-MsgGUID: yFx6bzp2S/u/c136MRcX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5122576"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:42:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:42:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 22:42:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 22:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbDG5o5SXaQujaeoKuVg4wABOLxDPVnt4819SkIb7QiqbR2/ziCyNloRE2KxHGKUBjsVleLk+4vHDHTROrX2+kiCMD7YAiTtG7shdF2oQTg7XiaAuaalZAdbHDPGYkvw+qmLArxZx3qUBWUqB6BbfQ537qIgivD3tYPy74Jr2eeLrtiSC5LwJsQRnKweFIpSkAdHLlYweeUIzvQAuRK1YYAZz2Lmv6biUYyJFwPMFD5h3c+5mBeElKh396BmQxmUtBVebsOItAMYgr8kNMhMnWsRq2/ToMWpqLXsJOJ5UXXLkJyUTX0l77F2wRzCYI0jRgURmYjTIzzbGbiplpENSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am7bjZBYScLgyoyWbFhZTPXxZ/d1bUd793wlxqGNnVE=;
 b=PKdSr51nGVss6zhDqvQ0aa02Xe77gmG9jWiTMPVDMdJZg1PCwFeO8gYG03tGxH1/88urTTux9tIl1fxxUqUr058UghN72EqFjGQd1bw3wRaOhFWH8DvecwotaBOhQGUxsRl8g2BUjPOmuiwRZztCzk90Zktmiw/DMkXcMz1ruokNcJ2pzLD0FYWcG8cEdbn4fcaeCjy1crFxc1LAguDQ3wW2sIhXa0v6PdO32PZx/AaY02c3gzf5toxEsxHnSu/u6mb9l0w4jf3OgcdLI/qekrXA8StclAV5ULbgEygXuDCZ0Dc8QoQxwr9JKE+BjqhZrG5yg4xg3u3xRn1JWnSkRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SJ5PPF64191BB3C.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 05:42:26 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 05:42:24 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Topic: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Index: AQHdS9rFj3TOaGBm102dHqDSOZ3G+7b7p24AgAD8vrCAEpY9AIAAYPoAgALnyyA=
Date: Wed, 28 Oct 2026 05:42:24 +0000
Message-ID: <IA3PR11MB9136C5455D0EA04FC3624824926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
 <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <d4183670-c640-47b5-a70a-659861b0a21d@intel.com>
 <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
In-Reply-To: <c3a973b6-b222-46df-bd79-fb0df6d7b0c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SJ5PPF64191BB3C:EE_
x-ms-office365-filtering-correlation-id: 0a2d5dd5-96a1-4352-c1f1-08df34b63e97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|38070700021|261026140227099003|4143699003|11063799006|5023799004|56012099006|261022105027099003|10067099003|261021121427099003|261022075727099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: B2QKPbrBxVpAld5h06iZeV0LsQ1VIFDDfAHhZVHqgH58hb8zHDnkCBIgnKvEy9Oeh6oc/OuEtmzSdCooH85pweOICAyonkVPIjcFikk3l9WBYE5vSK7GiHh0IJxJ+zoxxpTFU9fH3a/0E32a92yif34MupRMV3OFu8aUlhSHosxilyQQvGBXUHJaSvVdm09byaUlJ8FG8V80AKeymvLMI233dXm80iCk2jcHwpky2klvZQ0O9nQgVD2dmosHGSSyt89xUNwnX7E+r4IEZ9uIG22vWEVVeOcsDrHDWN6YFNZ1k2xnd6eXhNsPgotaUbnwU3XcD36p07AfLyMVAceLG+wuTJq1+X8R80MpK9qGnK1jEYU4M9IzUmsoiTror6aaOmKjBY53UlGueDxvY3X+LKmg8LXFlcVehJoaYKPVK8Xn351MkmYbCb2xJ05P0ncVJ8NIjDBoY9RoG2fvvNMu96/u5450SXnSuEweyP4oj03JElzan/3ZJefnyqcNcyVrPVuuO54vVkqB6gVIppEASQHz1AdtlU9cDK0SzcDU1ge85pL1dD1JOkBvtv5qKQ3Pq7ADFFruHHTKAZA/VWcRlvYAK7jNK5U3ezzFQZK9jhO5wh56lmS6815pPZfKF1dAtrvZJG4+TDNcSrSZESvTkCl35aLwc2qGhkoP080+UeWbcaWGivTSEe4B+1DFayrLalrNfKGJhtBEHezjGB6r1stmAYzyfVIHmjrD6P7SRJg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(38070700021)(261026140227099003)(4143699003)(11063799006)(5023799004)(56012099006)(261022105027099003)(10067099003)(261021121427099003)(261022075727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU54WlFrVmIvakVzWno5ZTZzVU9NVFBCaDl0c1dtdzhRV1dEa3VnRkxETlV1?=
 =?utf-8?B?Y3Y4VTZCdFA3azgwaXZIWmJZVjdQWE1vWEdrVDQ0UU9XQ1RCdC9kOGJTLzJt?=
 =?utf-8?B?TWZOWmIzSklBVUd1L21ZaW8vZjhjZy9maFFzSEE2L05OMHlCci96MjRTNlR5?=
 =?utf-8?B?SDROQ0tUakQ3Qm5XNXR5cXk2Y2pnVCtXVEtRMGNmMWVUdE1PZ1hHYXZPc1d0?=
 =?utf-8?B?ZW1xdCtKdUYzT3QzMlR0MGRNOFlralZGMUhoQTN0MmVOU1BxOWNlQzR4b2dV?=
 =?utf-8?B?R0R0bDl2TFpCS0gzQzZnRHVTc3kvNTlGM2FFKzB2S2NxYm9Pa3ZaV0F3c3d1?=
 =?utf-8?B?aDFNeHMyL3lCR3NjQ0JTWUpNRzQ4djFKcjFDOCs1eHRNRjRZdjdEZ05tRUJW?=
 =?utf-8?B?SkJtNmJKa1JmOHFtOWZSdFIvdHFmbmc3NnkxbE9YcDl2OU16VEVid25NQzZp?=
 =?utf-8?B?eFE2RXYxNE10eGo3dXg2WndIcFpDelZFWTU0YjQrZm01NG9CVzNqcllZK1VO?=
 =?utf-8?B?RWdwZGF3M01UZ1BzNEhWWEkwTWthc25Xbk5Fd2tOU3FqMkw5OWtvYzFuZ0Vo?=
 =?utf-8?B?eVo2U0xpR0xvSDkwUjRIZFczNHJTWWVaWHVXNE04Q2pUYmZLbnBpazlSTy9r?=
 =?utf-8?B?dlAzb0pLc2hIc1J1d1V0eGNabmNiTUVPQ0lhandLUGxrQ2xiNjV0ckhUblZQ?=
 =?utf-8?B?Mzc0NTJEM00wNEprcTNkRWF4MFZ1UmNHcUZTTGllM3JwR2NpMmhRc2RoV2dH?=
 =?utf-8?B?U1JGNDRZcld1Q2tWMjRlNUVuMXdrNHhwUDVtSWtHaW4vWmJnb2d5MExtQnNi?=
 =?utf-8?B?V0F1aXAzemUxdXJvSlBTODRKZW1xRWEwcE5LU0ExKzI5RU9yUzNhVkNaMS9B?=
 =?utf-8?B?dXdiR1cvYnlhN3BJb0xJZmthODAxY0VlODVGYWh6NFFJajdwMDFzSEZHcnZU?=
 =?utf-8?B?SmtlbDZoSUhyZks4VW5KcUNobThjekFLVFBLT3RWMlF5U2FkWSs0cTZMU0M2?=
 =?utf-8?B?N25mZStrMlNyR3V4eW12VTZjcGRaazJGMkluSkdiSUFMTWRIbDE3TnZ6YmlX?=
 =?utf-8?B?YVZlOGhJeVdwVlhJcnFNQmc4MlIzejlETzNQVWhHNkIvS3FqY2pRN2VKbExR?=
 =?utf-8?B?dXR5ZWVCT1FxaXRkYVFtMUJUTjJTSWQxekh0Wmc1NGJQa0FTV2N3cFN4eCtK?=
 =?utf-8?B?bzMyY25NSWdPNk9yR3dKRkJWc3hwdDZETzRxNjhyb0p5NEVUeXk4K2R1Rkpa?=
 =?utf-8?B?THRCVDlJeGM5MDlraU5BNFBWdjhsNmYzd2hJVUZ5dC9DVzRzdGpMSENzRWpD?=
 =?utf-8?B?dTI1K1E1anQveDIrSFY4MFdtVERxK2IwMHJsREdocWU1TVlQVW1CNUpFYnQ0?=
 =?utf-8?B?TkE0eDgzZGN0MU5TTmxQU1JtT1RBK01KWFhNUHRSM3FSaEUrUHU3ZVN4MmZp?=
 =?utf-8?B?QWVtRk1lM2IxK3FZaFF5QTFtSS9WZTRiaDNZU2tCNDlENTByRTNlWk1mOXVZ?=
 =?utf-8?B?ZTNOT0paeDdUYUcyeHJaVWRVLy96dFV5eTUwOVE1aGtsNXFDY2hDZkd5MllR?=
 =?utf-8?B?ZDlFdnJrR0haUU01THYyWmxXWWdoNWkzZnpOQXhrUXg0Tjk4anp0cmd6d1FW?=
 =?utf-8?B?YUFjYVNDVmhjdmdsM25PM2lHdzR2d0JYaExncittRTJzYlRoMU5wZU9YdXg0?=
 =?utf-8?B?UEx6VDQ2TlJLUFAvZ21PNmxlUWRCY2dwVzRQMTdvV3lrTjJpbGRnVlFaU2Jo?=
 =?utf-8?B?N2h3UFBoUWRTdS9QaHh0ZWMxS3hVdUNPSlR1c2ZuQjJJa3RybzVRQTFpVnNr?=
 =?utf-8?B?U0tkbi9uRC9mdlpzQ0IrWjBRL0c1UlBDUlhxZDNCdkZlb2RnM01yWkttdWNN?=
 =?utf-8?B?UUNGRkVYdWE5aHI3K1VrMHlyWTFaeEpnNDZNNDZ0bWNqUFBSSExxYm8reXo4?=
 =?utf-8?B?TmpaYW5YcVVibnZlbElsdktvUnQyQXNXRHNDdnNJMnNiaGZpVGczS05IQUhL?=
 =?utf-8?B?R0tSbTJZcVRpbGlTR2NSVEp0VE0xNC9lRWxFeVB2K3oxRkN4MjRSb2YwZC9O?=
 =?utf-8?B?ekNVR1p3QzRLU2VjUVk5dTVrejY5RTBha1ZYWEVvcHpPOC9sOFcraUMzdkNm?=
 =?utf-8?B?ZVFBUjJHSGJXaDMxaE9NUFZJQnkvY0gzYVRVNDRpZjVORit3YkZ6dVZ6anE5?=
 =?utf-8?B?ME44VVJtclVuNHkzREIyTXNJdEp3N3pRM0dUWHRFM2w1NG1UUEV4eGVUcGwy?=
 =?utf-8?B?d2VXUmxNOHVkVW92MFpNNThQM2ZoN0JCNk1heGlWZzRlT2UrakVEdzlCQ1Z6?=
 =?utf-8?B?OUxZNURmUU9HR3dqQ0xkZVJGc0wybzN5a25zS0lnY2dvbjdKUEpTZz09?=
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
X-Exchange-RoutingPolicyChecked: b3nA9c9h4huPnRSr2O7C2k5bj+zwK4feKIwAxRYsrMjwG4QqNpD1DWIL+s1XRNI71DDT824LD5A7MPBNRkSViIjIP6F8hbh21QSs2ItXbuJYeJXlUCGLO3oyHbXoO7Vr3DW9vnuh4xOcBYPTFPK5Ptt6boTteco5iHjVoiIpov3+arpvfjq+U15tM1zG7jzosvkGJ1YZrvWaBWkYaP3AbMiZn/RKEyYDqd4H5+6qLXCjkkeHRwTk/wJNm08GT6SDUebNmtSXsFgY8kn/5cyxUs1Oja+sr3gNlyjR35ugUKjiAqMDgHh6BZl6yzqeEhAzV3FDEBRa2fO+K3LHvkeQ5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2d5dd5-96a1-4352-c1f1-08df34b63e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 05:42:24.8206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4bHkXSjlps0whRluex8StPxR+KSS4d8KDinLK0epasiD1DNXdOlZkV8czw/Kmo6oQHeomyqueEwqqvUvFrr4R1bMaOFR+HhLHvKkl0Tg28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF64191BB3C
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDUvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogQWRkIFREQ00gaGVscGVycyBhbmQgVEVFLUlPDQo+c3VwcG9ydCBjaGVj
aw0KPg0KPg0KPg0KPk9uIDI2LjEwLjI2INCzLiAzOjI2INGHLiwgWGlhb3lhbyBMaSB3cm90ZToN
Cj4+IE9uIDEwLzE0LzIwMjYgMjoxMSBQTSwgRHVhbiwgWmhlbnpob25nIHdyb3RlOg0KPj4+PiBU
aGlzIGlzIHVzZWQgdG8gYWxsb3cgVEQgZ3Vlc3QgVEVFLUlPIERldmljZSBDb250cm9sIGFuZCBN
YW5hZ2VtZW50DQo+Pj4+IChURENNKSBtb2R1bGUgdG8NCj4+Pj4gbWFuYWdlIHRoZSBkZXZpY2Uu
IFRoZSBURENNIGxlYWYgZnVuY3Rpb25zIGFyZSBkZWZpbmVkIGluIHRoZSBmb2xsb3dpbmcNCj4+
Pj4gdGFibGUNCj4+Pj4NCj4+Pj4gSXMgVERDTSBtb2R1bGUgaW1wbGVtZW50ZWQgdmlhIHRoZSBO
UlggZmFjaWxpdHkgPyAgVGhlIFREWCBDb25uZWN0IHNwZWMNCj4+Pj4gbmV2ZXIgbWVudGlvbnMg
dGhlIFREQ00gbW9kdWxlLiBBIGJpdCBtb3JlIGRldGFpbHMgYXJlIHJlcXVpcmVkIGluDQo+b3Jk
ZXINCj4+Pj4gdG8gYmV0dGVyIHVuZGVyc3RhbmQgd2h5IHlvdSd2ZSBpbXBsZW1lbnRlZCB0aGlz
IHRoZSB3YXkgeW91IGhhdmUuDQo+Pj4gIlREQ00gbW9kdWxlIiBpcyBHSENJIHRlcm1pbm9sb2d5
LiBJbiB0aGlzIHNlcmllcywgdGhlIGd1ZXN0LXNpZGUNCj4+PiBpbXBsZW1lbnRhdGlvbiBpcyBp
biB0aGUgVERYIFRTTSBkcml2ZXI7IGl0IGlzIG5vdCBhbiBOUlggbW9kdWxlLg0KPj4NCj4+IEkg
dGhpbmsgdGhlIFREWCBndWVzdCBUU00gZHJpdmVyIGlzIGp1c3QgdGhlIGltcGxlbWVudGF0aW9u
IG9mIHRoZSAiVERDTQ0KPm1vZHVsZSINCj4+IGNhbGxlZCBpbiBHSENJLCByaWdodD8NCj4NCj5J
IHRoaW5rIHdlIGFyZSBlbnRlcmluZyBhIGRhbmdlcm91cyBiaWtlc2hlZGRpbmcgdGVycml0b3J5
IGhlcmUuIEJ1dA0KPklJVUMgVERDTSBzZWVtcyB0byBiZSBzb21ldGhpbmcgd2hpY2ggdGhlIFRE
IGNhbGxzLCBiZWNhdXNlIGl0IHNlbmRzIHRoZQ0KPlREQ00gZnVuY3Rpb24gaWRzIHRvIHRoZSBo
b3N0LCBzbyB0aGUgVERDTSBzaG91bGQgcmVhbGx5IGJlIGltcGxlbWVudGVkDQo+YnkgdGhlIGhv
c3QuIEJ1dCBJIHRoaW5rIHN1Y2ggY29uc3RydWN0IGp1c3QgYWRkcyBtb3JlIGNvbmZ1c2lvbiwg
VERDTQ0KPmlzIGp1c3QgYSBzdWJzZXQgb2YgdGhlIEdIQ0ksIHNvIG5vdGhpbmcgcmVhbGx5IG1v
cmUgc3BlY2lhbC4NCg0KR0hDSSBzcGVjIHNheXM6DQoNCiJUaGlzIGlzIHVzZWQgdG8gYWxsb3cg
VEQgZ3Vlc3QgVEVFLUlPIERldmljZSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IChURENNKSBtb2R1
bGUgdG8gDQptYW5hZ2UgdGhlIGRldmljZS4iDQoNClNvIEkgdGhpbmsgIlREQ00gbW9kdWxlIiB0
ZXJtIGluIEdIQ0kgc3BlYyBpcyB0YWxraW5nIGFib3V0IGd1ZXN0IHNpZGUgLSB0aGUgVERYIFRT
TSBkcml2ZXIuDQoNClNpbmNlICJURENNIG1vZHVsZSIgdGVybSBpcyBjb25mdXNpbmcgZm9yIHJl
YWRlciwgc28gSSBwbGFuIHRvIGRyb3AgaXQNCmluIG5leHQgdmVyc2lvbiwgSSBwbGFuIHRvIHVz
ZSAiVERDTSByZXF1ZXN0IiB0byBkZW5vdGUgdGhlIGd1ZXN0LXNpZGUNCm9wZXJhdGlvbnMgYW5k
ICJURENNIGltcGxlbWVudGF0aW9uIiB0byBkZW5vdGUgdGhlIGhvc3Qtc2lkZSBsb2dpYy4NCmxl
dCBtZSBrbm93IGlmIHRoaXMgZGlzdGluY3Rpb24gbWFrZXMgc2Vuc2UgdG8geW91IGFsbCwgb3Ig
aWYgeW91IGhhdmUNCmFueSBvdGhlciBzdWdnZXN0aW9ucy4NCg==
