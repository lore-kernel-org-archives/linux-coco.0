Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089961;
	b=3H/l4LkhyskFSkttpyo7lU+odB1KFOraaSxc6DlWseCnDZ64CXj1DcXE5fnolUFoXnVs
	 PMyubN/DkupSfkloXlcqxUDK0yrAAo4lLlj9C1BaOvdgGjjQfuc4j1wXF4+cParYN26U6
	 HEmnDzl/aYZ38bXp/BClWZVRJt9yN9nI0EONwOL+qsxAx8iMsAnJlix89vnulRGPd11sA
	 ok0tSKyLb/qmDWQq9EpbojBNWcDILDkmS8Ow9QMxb2w/XYJSb5U+yNsgTKO0oEKJtAwVT
	 1KAWC91X02bnCSTyWt4G4b2pzzoJ2cdJs8iBizCcFhjrlJCFjZ6AGQlCIHh59L7t0vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089961;
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
	bh=ZGH87iCMxfyk2xorpMdshxjQOJSSFNc7JKDuAyGCFeE=;
	b=3cJQPbnYk4nkmNZq7NF7TQOZ941/rijSEfB76wP4Xotx8u5SZbGVjNXy9M4OYsVbVwsD
	 UzUhRG9vjBM3v2vlVGQiugJieFpXq47fbXfgKQv6WdiQrBC7JijhOEnm1R618fGibeqd8
	 BXYpRoOZdBh+fwihoCoImA2PW5+ht9MMASLzS8oOu410Cb7JlQ5xz4EmQ7u0jsotKu5LT
	 C3MSGCmVBud3azbZ5zO1MmzvXcxuCSSIRkur8XZ6eWQCnaa/n85VlXD8aJQ/re5ZtyeNu
	 Fe9+Z0sDSd5XuvEtS6nSc5snqSgIej9xwPfgBG4iT7MBfyC321bO/d21zaCqjrr67Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+SpH68U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238A606A31E
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 08:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D238A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+SpH68U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793089960; x=1824625960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZGH87iCMxfyk2xorpMdshxjQOJSSFNc7JKDuAyGCFeE=;
  b=Z+SpH68U2mEpKXoyrb3P+Hs4uC5dWBOmxbZxFomDt7v3JX0jg53nlxX8
   wekyZp88ITU1gVYrKwSZHbxdgbBwt551KRUUbxz3Rm7Bufx8TLXZd0Ssn
   0jnNxej7ZMUpSZOwM1bLqeLvAfDw7biP3Pw2RnDCTUVI/CKV473LDcDph
   Z5PpZ6g68z2OuFHu7NHQxyXrCZpG4YQ5BUHFkcgcMi8qTSiliR6ywXxCv
   egEIhIFY5V+DTMprwhn1PftEQgi7gc34wqcsFKmyy5rcKxDraWCXS935B
   3Jiw4cCIbyhAA7v+Whsc2bhJoVg5kSOYQocx/j6W8Ido0A5HZ3eWmo8X+
   g==;
X-CSE-ConnectionGUID: iLwailSmS86H6FA7XwJyaQ==
X-CSE-MsgGUID: 4Wk6KiyUTBiNE6Fv4iTXrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1815500"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1815500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:32:39 -0700
X-CSE-ConnectionGUID: SyUzZZ3cSm2BDSatsPUyzg==
X-CSE-MsgGUID: w3aqNUpzQfKZ1Hw/RNQNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4881672"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:32:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:32:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 01:32:38 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECKZZYV12yOeups/Evmj0kKvxcf+PeQIufk7GA1PmljmYn+b9dGflQD3KzQZP01mEGdkuy6pwDxjpwyFhF0sobOx1/oEdtYTIrnfjrSRe5Sfq9BSEHRj66ET8igvsZi+9mxHNRicU7mJGA709YzChPje349VQ9KM9E5HJ+C1YrAhYjwMeABmrCgvFkRL+9nYVmXQIdADJz5QXWhGU+IcZddHZdLLzOyIzSK/4WKHqY2Y9scrD70MOsCIsozk0tSfGmwn3Q4PJtX203QRT08Bn2Way1CzejHk3ybtj4uhWnPjk521CUiIIEjtyaEJzmSoNE0FL31v95RuP6nQMqVx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGH87iCMxfyk2xorpMdshxjQOJSSFNc7JKDuAyGCFeE=;
 b=aCbkv48baoJlHiFDY2idnGyFuvnlM584vAHseeDboaEQ1ecRuuZ/xeWZLEyb/1qhTwOcsCBYUnImu+fQOFXciCimTEEm9qBMUOw7yNEyq5rJ6tCvxTOadjHY4dIzB7dj4sjupCUFLvqTFLeYRPtdWWGPZjCMY+GJacA57FedDhEOyr9Nl4FMGXwcoDBDfIPFZT67BUNQbGTDaQqZSRG2AEsCDYZAIJb4Uu/XVENem6+q3Th8ZzYTWfQHWzStJ5URvsmSyZXgoIEbpl6jmDUW7yjexgLoLXooB/lt9Ab81Edof+zIzmKhr1EBxFeqQrqNqINKTiNFbbUXSGA09l0j3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH8PR11MB9746.namprd11.prod.outlook.com (2603:10b6:510:3a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:32:36 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:32:35 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
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
Thread-Index: AQHdS9rFj3TOaGBm102dHqDSOZ3G+7cPRZeAgAHsAQA=
Date: Tue, 27 Oct 2026 08:32:35 +0000
Message-ID: <IA3PR11MB9136287858A6C3B47C09AEF992602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <1b28a8e8-7836-463f-a2a5-129a1dba5b12@intel.com>
In-Reply-To: <1b28a8e8-7836-463f-a2a5-129a1dba5b12@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH8PR11MB9746:EE_
x-ms-office365-filtering-correlation-id: e4bb822c-ffe1-4f6d-94ab-08df3404da45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|261026121527099003|11063799006|4143699003|56012099006|261022075727099003|261022105027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003|3023799007|261026140227099003;
x-microsoft-antispam-message-info: SXoFNiA9kamyQDKgbjHTMzQdHd4vVxsH92aoYfPpdp5nJ7XcRqEv6gXS1s/dNyiAtfATt4nrKYvBdlk1kg9ayRrDHpyXTddSopIReYzcPzzakBQ3rTilf8wdwTuQTpl5ET0cQmZ7HdVrAXtgcYP6PeqhK4tYz7+zheI/qr5BQrk3r7joY0uJLg14zOGYXypvaqUU4uz/SjSfayG8e+SFwv6KuG86vj1/nCX7uu0ZPrtkSXnbRdKYM5f41t9iKp7ELAErgFFCKz35ebES+KlYeG2rRQS889BHT+Z+HBxGC1uV8FEGEOi643CAOAukxqZxvcO3aaGS9579ghA5UDi6lnSM7HhRJSP9NFVOXe00mj1GClzW+AgZJWHa8LZEtpQ7qoMUr+AAqGVP2YGmFbHB6gFAkBERzPPhtefSbudnjPtcCugIQp+DbRjEnFP87/bObJ94pNqZ8V9/IaV6ravaTi0VFsJmA0/ic6RzLLvJ5LBGCoqdmTM5Z7O2uwlNrMvDjKIkhfmz2UR759ljpdRm94IQ9FTnYcwb8NBukuL6I0pPjoYrfEXyR4gtT3l0qaYTZaYpW7CnuhTVSNYlcN2qOpbzLgi1fSAy81ewDv6b4JW4dnPr8bDR4yX2OqpO0nTTMwWw9RF7YqzC34P2sOpHCJgdWCYb3fE4irOi0qDPwxx5bvBTqdiNL6xUoSCRSRqywsLU5VbZIk//mSJYC2pzIIDzY4aVlfvqFPWEBuNF6XI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(261026121527099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022105027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NktaMnNMZWVLc29GMWc3WkNXdEZraDlJUElrNW5jQ2ZFQjdUcXFIZEJTZGZX?=
 =?utf-8?B?STZ2K1B5d3FVanZWYjlqVWw5cFRCcy9ZWm9kc2VxRFRISVBGTU82K0RpUk9m?=
 =?utf-8?B?V0lSa0svTVpTOXphV2RkeG53a3BBTmtaSEVad1ppbjlrS1hGc0JDcGFXdFk0?=
 =?utf-8?B?K2J6bWs2WjNVaWpITXlGbGhKaFNZeWd2SDBpTm5vSitNaFFKUTVBcmhMUXY1?=
 =?utf-8?B?djlLWDg3ZWNmOVJ3QnVicVNPTnRhQ2F6WGVZaHJXcXA5TjlpVWEvSUZJU2oy?=
 =?utf-8?B?a0pEUE9RdXJ4QXRMQ0hhOHoyYTU4TXR1bmNtU1k3MmI0RlJCVGhOWVp6TS9E?=
 =?utf-8?B?M0ZDR2NBQlZHZERXRXdpRVA0b1ZhQUwvY2gyRzlZRHExZjdieFNnTEFYWHdo?=
 =?utf-8?B?LzFCVzRNZldTR1RNYTVVZFhrTjFxOGtCbHY5R2ZKMkh2VEhueGoxaWhOd3lR?=
 =?utf-8?B?OS9ZTysvR1luRzVSeFBjRjd3aXBUVm45dGVvSmNuS1laN2ZzdUhQTjErelJp?=
 =?utf-8?B?eGY5MTI4MjJZVWFsYjMwN1JFdTZTcXJLd04zSEwrNCtZMGZGVXNTd2ZzQ3lk?=
 =?utf-8?B?eEt5WE1BaXF4VUJOTlNGWnRhRmtXc2p3dkJ1WnpWQmRTajZtUTdyTDR6T0ov?=
 =?utf-8?B?bEVQYWJta0NDRHpQK0Y2YXovNjk2R2g4NHY5K1dzcXFybkoyT2xMTisvY3I5?=
 =?utf-8?B?bDJwQ3F3bDFITWVjbS9sa3V5d1VXL0d2R3JaRjVyMXphVThRM3Z4TXBvMWhS?=
 =?utf-8?B?REFma0VyK04rM3ZldW5FelJuU1JNVWpFanZabTZTOTJRZGxhdHZuTGM1RGNG?=
 =?utf-8?B?T2NmS0YrV0s1L0g5RVUvM2tKZDl1NXA1eEZlcGFpSkN2SmdIb1FyZGdpU3lw?=
 =?utf-8?B?MXR4alhoUjYrVlBlQlFXaXozeDc5ejJydE5qMTlWb1VJdkRZTlVNNEYyOHB1?=
 =?utf-8?B?cDdMa3REalkxWFNDY2p4WHdvcWZkRjZ2d240OGhndlRwdDlOTDAzM20vd2hW?=
 =?utf-8?B?YVhlcGNSRzV1eW5GN21JYnZVSEtiS0RZR21jWEVtV292dHRmWEdHOGdiajlW?=
 =?utf-8?B?dnFheDdzajNqcTNyUVZhUFMwUW1hYWhzbHhVNnUwUjFUYmZWN1pEVGRMQmx1?=
 =?utf-8?B?cXlIK0lrT3QyR0dmL0pGWDQ5dTVmd3VWeDNKNlZaWStkUCtmbEVrUGZ1dXV6?=
 =?utf-8?B?MTkraldHSnJ4VEtyNm1sc2U0MzUrL3YwcitsT3RvTEIzbzRDd29ueFpzZHB4?=
 =?utf-8?B?T1Z3ZXdDdEllNnoxUi9qYkpnWm5FRUhPVmVsTUdGZlZFTFExTk4rc0xtS09j?=
 =?utf-8?B?bUZFY09JVk5EZ0lLTExTdXhMeDNFTXcrcjZnZGhzZTNmZThyM3JQcnM1Qmly?=
 =?utf-8?B?aHBEMFlpZmRITEx6QVkzUzI5bXpuQnJGU0pWM3RGR0FRaWd6REZIUlZEWVYy?=
 =?utf-8?B?V2lvckJsRWhKVGx1cnRORFZsQXNya2ZKdkZjM0crQU1tenFMUGhxcUJSTCto?=
 =?utf-8?B?My9GVDJLVkNIUFg0S1VJV3NXMHc3SzZ6ZTVTazNxaUIxQ0dFTGZ4cWR2Yjdv?=
 =?utf-8?B?YlMzSVQ2Tk1oODA5ZFhYZkFUZ2ZHNWp5dldTOGFnclR4K1BxOVp5MjVrN0Qw?=
 =?utf-8?B?cmxwQmhtaHlGNkhiQkRiK1hwT1hCVjVNUlJNOWE3elZRQUxBQWlpU3NaZ0h6?=
 =?utf-8?B?V1RvWHZrZHdHeHY1TmxmWStrWk9xRHpMRkM1eW1Rd2hNK2oySnViU1p6ZkRB?=
 =?utf-8?B?ZmVnTDE4M2xCbUtHUStYNXdjS01wNmliL3dITm1KN0ZYTzhEbURacWtiUktz?=
 =?utf-8?B?TFAreWlSL0xWaDYrdElWelBCTjRuc3JPUjdSL21ubzdmMGkzVGpyZTdtWDdt?=
 =?utf-8?B?QUtLK3NyU2JFcnF0dXMvVzhzd092WXU4VDdGa0FtbEhuMHdxUWdpT1NGdFhK?=
 =?utf-8?B?OXg4VzlkSnB0MHpocG9KTlo3YXFuOExrVkJDVVgrSjVPMEZQRjZmbXUxMlcw?=
 =?utf-8?B?TXF2SHhYRzNuRlhJWVU2QXhsN1VvazZ2NXI0Yy9ubm51R0lFWHhLMmpFeWFY?=
 =?utf-8?B?a1VrbDUxR1lLTW9qSGwvWVM0MXZrVk5uUkkyRi81ZWp3aXdJOFJablVyRm1a?=
 =?utf-8?B?dnowSGNVemZ0OXFibjZlYXd6YjZHWU9ObkJVSTZJMkY2K1NXbUx6aWZKSktN?=
 =?utf-8?B?dlNvbUhXT3FnSk5Bb2wwSFZzZ3hRSkpYS0kzdUhFa0plOHMybUFUQWJvTWVB?=
 =?utf-8?B?UEtoNm1HMEJYVFY1SStaT05Xa2NaOHNXelhLSGZLNzdUeTRkUWdHTmZMNXdJ?=
 =?utf-8?B?Tk9LNjVIUEFUUy9xVVM1dzIrT0xjQ2YyRkVsSFRlaFJWdXdLV2lnZz09?=
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
X-Exchange-RoutingPolicyChecked: kDg1d1nbAduLCk5S2ThP0MLWaozzLYasduqr4QJv28ox5aBxm4S1D1/FUQ5hYdCyKWnUaItgY8/50YoXYmX8UtxuKBh+rR/CMgIhoN4pl3tTwAMiBWEL3eyOY6es1fab2negiESZfKltb1WDQPdxLqm7EDY8FcKVjtdp70OuOgKdqENpumSudzdf4CP5n8HHaCBnfkZzEhPsOz60hAD2pFZQQ5PPEoYakeM5jmZlkVMXUr1qpkia4sadQj9AnFBlvABE+v4byfU5/O79icWCdC/654IcCxi7NZ/7tPnA52UgYh4Z2VfF/nT4N5qjd4I5idCkSYPKRl4tCck14SKsgg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bb822c-ffe1-4f6d-94ab-08df3404da45
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 08:32:35.6043
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: th+C+V7emkyfmQ2LdQDPmqddguZONSRmZf4/MiN56IG9Eg6RVI0tfokXon7uVxyc9+QpnIFJAAXf97eCxzEdlp8+3192LwSAu3tpZGbF30g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9746
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwNS8xNV0gdmlydDog
dGR4LWd1ZXN0OiBBZGQgVERDTSBoZWxwZXJzIGFuZCBURUUtSU8NCj5zdXBwb3J0IGNoZWNrDQo+
DQo+T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IEltcGxl
bWVudCBpbnRlcm5hbCBoZWxwZXIgd3JhcHBlcnMgdGR4X3RkY21fYWxsb2MoKSwgdGR4X3RkY21f
cnVuKCksDQo+PiBhbmQgdGR4X3RkY21fZnJlZSgpIHRvIG1hbmFnZSBleGVjdXRpb24gY29udGV4
dCBsaWZlY3ljbGUgZm9yIFREWCBDb25uZWN0DQo+PiBURUUtSU8gRGV2aWNlIENvbnRyb2wgYW5k
IE1hbmFnZW1lbnQgKFREQ00pIGNvbW1hbmRzLg0KPj4NCj4+IFVzZSB0aGVzZSBpbmZyYXN0cnVj
dHVyZXMgdG8gZGVwbG95IGFsbCBURENNIGNvbW1hbmRzIHRvIG9yY2hlc3RyYXRlDQo+PiB0cnVz
dGVkIGRldmljZSBtYW5hZ2VtZW50LCBiZWdpbm5pbmcgd2l0aCB0aGUgZmlyc3QgY29tbWFuZCwN
Cj4+IFREQ01fT1BfQ0hFQ0tfVEVFSU9fU1VQUCwgZXhlY3V0ZWQgZHVyaW5nIHRoZSBzZWN1cmUg
ZGV2aWNlIGxvY2tpbmcNCj4+IHNlcXVlbmNlLg0KPg0KPkkgdGhpbmsgaXQgbmVlZHMgdG8gYmUg
c3BsaXQgaW50byAyIHBhdGNoZXM6DQo+LSBpbXBsZW1lbnQgdGR4X3RkY21fKiBhbmQganVzdGlm
eSB3aHkgcG9sbCBtb2RlIGluIGNob3NlbiBpbnN0cmVhZCBvZg0KPm5vdGlmaWNhdGlvbi4NCj4N
Cj4tIEFkZCBURENNX09QX0NIRUNLX1RFRUlPX1NVUFAgY2hlY2sgdG8gdGR4X2RldnNlY19sb2Nr
KCkuIFdlIG5lZWQgZXhwbGFpbg0KPndoYXQNCj5pdCBkb2VzLCB3aHkgd2UgbmVlZCBpdCwgYW5k
IHdoeSBpdCBuZWVkcyB0byBiZSBpbiB0ZHhfZGV2c2VjX2xvY2soKSBhcyB0aGUNCj5maXJzdCBz
dGVwLg0KDQpIbW0sIHRoYXQgbWF5IGJyZWFrIGJ1aWxkIGJlY2F1c2Ugd2UgZGVmaW5lIHNvbWUg
c3RhdGljIGZ1bmN0aW9ucyB3aXRob3V0IHVzZXIuDQoNCj4NCj4+IFNpZ25lZC1vZmYtYnk6IFpo
ZW56aG9uZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQo+PiAtLS0NCj4+ICBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS90ZHguaCAgICAgICAgICAgIHwgIDQ4ICsrKysrKysrKw0KPj4gIGRy
aXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMgfCAxMzkgKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE4NyBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20vdGR4LmgNCj4+IGluZGV4IDQ5MzdlMjNkNTQ4My4uNzFjZDcwMWQzNDZmIDEwMDY0
NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdGR4LmgNCj4+ICsrKyBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3RkeC5oDQo+PiBAQCAtMTA1LDYgKzEwNSw1NCBAQCBpbnQgdGR4X21jYWxs
X2V4dGVuZF9ydG1yKHU4IGluZGV4LCB1OCAqZGF0YSk7DQo+PiAgdTY0IHRkeF9oY2FsbF9nZXRf
cXVvdGUodTggKmJ1Ziwgc2l6ZV90IHNpemUpOw0KPj4NCj4+ICAjaWZkZWYgQ09ORklHX1REWF9D
T05ORUNUX0dVRVNUDQo+PiArZW51bSB0ZGNtX29wZXJhdGlvbiB7DQo+PiArCVREQ01fT1BfQ0hF
Q0tfVEVFSU9fU1VQUAk9IDEsDQo+PiArCVREQ01fT1BfQklORAkJCT0gMiwNCj4+ICsJVERDTV9P
UF9HRVRfREVWX0lORk8JCT0gMywNCj4+ICsJVERDTV9PUF9HRVRfVERJX1JFUE9SVAkJPSA0LA0K
Pj4gKwlURENNX09QX1NUQVJUX1RESQkJPSA1LA0KPj4gKwlURENNX09QX0dFVF9URElfU1RBVEUJ
CT0gNiwNCj4+ICsJVERDTV9PUF9VTkJJTkQJCQk9IDcsDQo+PiArfTsNCj4+ICsNCj4+ICtlbnVt
IHRkY21fc3RhdHVzIHsNCj4+ICsJVERDTV9TVEFUVVNfV0FJVAkJPSAwLA0KPj4gKwlURENNX1NU
QVRVU19DT01QTEVURUQJCT0gMSwNCj4+ICsJVERDTV9TVEFUVVNfRVJST1IJCT0gMiwNCj4+ICt9
Ow0KPj4gKw0KPj4gK2VudW0gdGRjbV9lcnJvciB7DQo+PiArCVREQ01fRVJST1JfVERYX01PRFVM
RQkJPSAxMCwNCj4+ICsJVERDTV9FUlJPUl9URFhJT19ERVZJQ0UJCT0gMTEsDQo+PiArCVREQ01f
RVJST1JfU1BETV9NRVNTQUdFCQk9IDEyLA0KPj4gKwlURENNX0VSUk9SX0lERV9LTV9NRVNTQUdF
CT0gMTMsDQo+PiArCVREQ01fRVJST1JfVERJU1BfTUVTU0FHRQk9IDE0LA0KPj4gKwlURENNX0VS
Uk9SX0lOVkFMSURfU1RBVEUJPSAxNSwNCj4NCj53aHkgbm90IG5hbWluZyB0aGVtIFREQ01feHh4
X0VSUk9SIGFzIEdIQ0kgZGVmaW5pdGlvbnM/DQo+DQo+VERDTV9FUlJPUl9URFhfTU9EVUxFIHJl
YWRzIGxpa2UgbGFja2luZyBzb21lIGluZm9ybWF0aW9uIGF0IHRoZSBlbmQuIEZvcg0KPmV4YW1w
bGUsIGl0IGNhbiBiZSBURENNX0VSUk9SX1REWF9NT0RVTEVfRFVSSU5HX1VQREFURS4NCg0KTWFr
ZSBzZW5zZSwgd2lsbCBkby4NCg0KPg0KPj4gK307DQo+PiArDQo+PiArc3RydWN0IHRkdm1jYWxs
X3RkY20gew0KPj4gKwlfX3UxNiBvcGVyYXRpb247ICAvKiBTZWUgZW51bSB0ZGNtX29wZXJhdGlv
biAqLw0KPj4gKwlfX3U4ICB2ZXJzaW9uOw0KPj4gKwlfX3U4ICByc3ZkMDsNCj4+ICsJX191MzIg
cnN2ZDE7DQo+PiArDQo+PiArCV9fdTggIHN0YXR1czsgICAgIC8qIFNlZSBlbnVtIHRkY21fc3Rh
dHVzICovDQo+PiArCV9fdTggIGVycm9yOyAgICAgIC8qIFNlZSBlbnVtIHRkY21fZXJyb3IgKi8N
Cj4+ICsJX191MTYgcnN2ZDI7DQo+PiArCV9fdTMyIHJzdmQzOw0KPj4gKw0KPj4gKwlfX3UzMiBk
YXRhX2xlbmd0aDsNCj4+ICsNCj4+ICsJX191OCAgZGF0YVtdOw0KPj4gK30gX19wYWNrZWQ7DQo+
PiArDQo+PiArc3RydWN0IHRkY21fcnNwX2NoZWNrX3RlZWlvX3N1cHAgew0KPj4gKwlfX3U4IGlz
X3N1cHBvcnRlZDsNCj4+ICsJX191OCAgZGF0YVtdOw0KPg0KPnNpbmNlIGRhdGEgaXMgbm90IHVz
ZWQgaW4gdGR4X2lzX2Rldl90ZWVpb19zdXBwb3J0KCksIGlzIGl0IHJlYWxseSBuZWVkZWQ/DQoN
CldpbGwgZHJvcCBpdC4NCg0KPg0KPj4gK30gX19wYWNrZWQ7DQo+PiArDQo+PiArI2RlZmluZSBN
QVhfVERJX1JFUE9SVF9TSVpFCSgxNiAqIFBBR0VfU0laRSkNCj4NCj5BZGQgc29tZSBpbmZvIGlu
IHRoZSBjaGFuZ2Vsb2cgb2Ygd2hlcmUgdGhlIDE2IGNvbWVzPw0KDQpPSywgSSByZW1lbWJlciBp
dCdzIGEgaGFyZCBsaW1pdGF0aW9uIGluIFRESVNQIHNwZWMuDQoNCj4NCj4+ICB1NjQgdGR4X2hj
YWxsX3RkY20odTE2IGRldmlkLCB2b2lkICpidWYsIHNpemVfdCBzaXplLCB1OCB2ZWN0b3IpOw0K
Pj4gIGludCB0ZHhfbWNhbGxfdGRpX3JlYWQodTY0IGZ1bmNfaWQsIHU2NCBmaWVsZCwgdTY0ICp2
YWx1ZSk7DQo+PiAgI2VuZGlmDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0L2NvY28vdGR4
LWd1ZXN0L2Nvbm5lY3QuYw0KPmIvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0L2Nvbm5lY3Qu
Yw0KPj4gaW5kZXggODBhZTdjMTllMTc5Li4xZjUyYTE4N2IzMGYgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+PiArKysgYi9kcml2ZXJzL3Zp
cnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+PiBAQCAtNywxMyArNywxMjcgQEANCj4+DQo+
PiAgI2RlZmluZSBwcl9mbXQoZm10KQkJS0JVSUxEX01PRE5BTUUgIjogdGR4X2Nvbm5lY3Q6ICIg
Zm10DQo+Pg0KPj4gKyNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4+ICAjaW5jbHVkZSA8bGlu
dXgvcGNpLmg+DQo+PiAgI2luY2x1ZGUgPGxpbnV4L3BjaS10c20uaD4NCj4+ICsjaW5jbHVkZSA8
bGludXgvc2V0X21lbW9yeS5oPg0KPj4gICNpbmNsdWRlIDxsaW51eC90c20uaD4NCj4+ICAjaW5j
bHVkZSA8YXNtL3RkeC5oPg0KPj4NCj4+ICAjaW5jbHVkZSAidGR4LWd1ZXN0LmgiDQo+Pg0KPj4g
Ky8qKg0KPj4gKyAqIHN0cnVjdCB0ZGNtX2N0eCAtIFRFRS1JTyBEZXZpY2UgQ29uZmlndXJhdGlv
biBhbmQgTWFuYWdlbWVudCAoVERDTSkNCj5jb250ZXh0DQo+PiArICogQGJ1ZjogUG9pbnRlciB0
byA0S0ItYWxpZ25lZCBzaGFyZWQgbWVtb3J5ICg+PSBvbmUgcGFnZSkgdXNlZCBhcyB0aGUNCj5j
b21tYW5kDQo+PiArICogICAgICAgYnVmZmVyIG9uIGlucHV0IGFuZCB0aGUgcmVzcG9uc2UgYnVm
ZmVyIG9uIG91dHB1dC4NCj4+ICsgKiBAYnVmX3NpemU6IFRvdGFsIHNpemUgb2YgdGhlIHNoYXJl
ZCBtZW1vcnkgYnVmZmVyLg0KPj4gKyAqIEBtYXhfcnNwX2RhdGFfc3o6IE1heGltdW0gZXhwZWN0
ZWQgc2l6ZSBvZiB0aGUgcmVzcG9uc2UgZGF0YS4NCj4+ICsgKiBAcnNwX2RhdGFfc3o6IEFjdHVh
bCBzaXplIG9mIHRoZSByZXNwb25zZSBkYXRhIHBvcHVsYXRlZCBieSB0aGUgVk1NLg0KPj4gKyAq
IEBkZXZpZDogRGV2aWNlIElkZW50aWZpZXIuDQo+DQo+QXMgSSBjb21tZW50ZWQgaW4gcGF0Y2gg
MywgY2FuIHdlIGFkZCBtb3JlIGluZm8gb2YgZGV2aWQuIFdoYXQgaXMgaXQNCj5zdXBwb3NlZCB0
byBiZT8NCg0KV2Ugd2lsbCB1c2UgcGNpX2RldiBwb2ludGVyIGhlcmUgaW5zdGVhZCBvZiBkZXZp
ZC4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==
