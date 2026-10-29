Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259758;
	b=PhPDzg7FdwfUN2BIf/YBk8+cy3XYwzn3GE1Lt2XSgvNaZbc2NGjfbbIPeA+X2jTTFHol
	 fK6SOUX6jiJ8KCoTKXibgHFAyLs8jfSHt7ymvBQl209osC4Ih0VtaeWU8Psgr5hSbO167
	 Qf5JISsF4vytY7w8mEwIzSkBfahHJeSZnhjVAmowbNTVSzrMBmOTRmOxPGATgPi9h+Kh+
	 DbyS5U8DRxPKOJzd0zPERUp7i5MpLH4x2CWvd6VqADjs4xtZyL2MaO+545lS9foSpldbF
	 tL5s6G5c12jbwEDz90hS8ECDFe04o1IUtRoCSeVl2aD/6bX2cjXpO8rsixckbeMd4sQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259758;
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
	bh=dY8KX/UyWMSGfcmwFwz3Tk/cgiVQXdfDIbontacQNrM=;
	b=QS/3fNoppZscudSLGIutL5f3jnjMYgOjMcdqCycmMIBXMc+rZiZXvFSwWH4jB48ds9S0
	 r01WwV5XjSoQK4HoX79i0d2iv2s1JKk59mvCb//jtbWVnJPZmfYhrPEX1LmpES4VjlboV
	 AurDu+t1onay0oYrdJKZnaV5gGFTMBwCpaEDlozm4yFiYxjGk0zji0BIAW6jYic66do5O
	 vQLhpcKIAFjtnuDpHjeT7ORDjsdfvzv1T4P4/iqhXYEHFQO+nvAhdspEni4Bbd/keqrg3
	 OTt62MlH2y2zSBPSBV/G7dk6V1hFwaRaZZVbPZj/qAzHOrlPIJ2PiOtAMIkZ6ZBQJPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TVXIT4IH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F9606A327
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 07:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1F9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TVXIT4IH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793259752; x=1824795752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dY8KX/UyWMSGfcmwFwz3Tk/cgiVQXdfDIbontacQNrM=;
  b=TVXIT4IHQ5KwJp8ocfZPGwuc67Q8YouR3nj/xOde/fkb2UdLbCY+eKVw
   sAzhYW055AVpOyktaGwsuNNQNcgBKcXhRnitvZ+WTO5ztLcePZZ9cTsrG
   ZPKas0arjkYSHn6hUxXon8OA+yqe5uiBAMFSIgTen39AnT4qAf9UqD5+7
   lPZeMqZuMABc65CstEG54+/7MnqfNPv1VLG+Rui47deAfvIaM5v9k+xJ2
   LnV9V4XTBKBkjMpJOMDOFtUhzeLKHwJ2pHrT7uNOi0gIXG5Buke9BvEDk
   NwxWmP3KmZquCKmeEKegzrbXkWsBdzwF8p+evJFjewgtmAM1fh+3jZfK3
   A==;
X-CSE-ConnectionGUID: JKu30gkWRq22M9eg3cgvbA==
X-CSE-MsgGUID: boLOAV8iThO6CR/Ndtnd+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1899042"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1899042"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:42:31 -0700
X-CSE-ConnectionGUID: YqY+w3CuSe+FGFFCn7I3sg==
X-CSE-MsgGUID: KnQTbzgITFiiGmZAqgaGDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="6822057"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:42:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:42:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 00:42:29 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzfXIr6ndyyv7Q3hIrECWIIq38OA9c3lLbp37GO40AnAb4Vxx+hL5V8ukaAkcc1qCKwHxnaHVyQ0ZxywFiQ7vvXu0vTuudOczrZq37SKse76UvQb/2Bb727T74RRCssV/CffDxIqCfvUgdNX7DJoWLY1CKeFFM9N3i7e4V1XNoBQV1fTJOkLcsBeG0XN4uibhxb3LgVbHQB6GwHDe5RGgesXBdHTpIitv8lAc/dNiQvp65fGc918G3j+L/mdds+sk+9Jibgq9zBQUIwwd6II03EuQS1GcDmtvBbo4gm9cUlnIdVYoJVAQpN9Qk/n6djCq2xPj1DlyJnfxaHc2Y8atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY8KX/UyWMSGfcmwFwz3Tk/cgiVQXdfDIbontacQNrM=;
 b=BYjS7YKHHftxAfQzTQt23aVYqqmjlAXpI3ovTCzFzw7tCwbD7DK1MbvT23J65N1reAFfK0bKWMFjHE8J8dqzJ1EOY7EH08Z9bJzORPSgzXSCwk5BrHndG2JsyUohlpuAvG17XreFzXzG32224B8QunS2FAcnN2lkVxrBQ48OsqY+4di2LUV5vfVLlGNff2E6KUiOT5scwKWij3EyIvYt6gFS8+dnqEfcLpBB0tsPZ2xlnyFfq4TgTa88uUcPXHW1xZD7HGzrHI57HfVALgyIlLBPh6yN/i/K/DUPt46ynSaTH6UUAcAYCmF/gXSIqZy538QUivw0/n9gMkluFXmPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF93A1BBECD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::3c) by DS4PR11MB9532.namprd11.prod.outlook.com
 (2603:10b6:8:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 07:42:22 +0000
Received: from DS4PPF93A1BBECD.namprd11.prod.outlook.com
 ([fe80::7fcc:9f43:b0e9:943b]) by DS4PPF93A1BBECD.namprd11.prod.outlook.com
 ([fe80::7fcc:9f43:b0e9:943b%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 07:42:21 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALNhwCAAFRjYA==
Date: Thu, 29 Oct 2026 07:42:21 +0000
Message-ID: <DS4PPF93A1BBECD796762591E71B100F8FB926E2@DS4PPF93A1BBECD.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <45327d29-e9fc-4b47-9145-9ae8e63042e0@intel.com>
In-Reply-To: <45327d29-e9fc-4b47-9145-9ae8e63042e0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF93A1BBECD:EE_|DS4PR11MB9532:EE_
x-ms-office365-filtering-correlation-id: 7786d05b-6312-4e90-0715-08df35902abf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|6133799003|22082099003|18002099003|56012099006|5023799004|11063799006|4143699003|261028144727099003|10067099003|261021135927099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: lMsAI0LWB3PT4A2ZuwRbbQPd2NkROJfjPf94PtcDd3j67ZT7PXew5hlvkNTg4gU8U18IizqbbO04nz5xD8SzaO4+ojgWWWH4mOmRdCIg+VZ17BlnTjUZrnfMTJhrYnov5PHR9KFgIdc83BQEyqZtG3cZJeuXL71YHdfERNIwsA3mgx+tDWPETiDwUZpTPTgAozGtGt87BmDvDXNViML15ABQkA1cJnR/qU6wG2q6Alg2y7zdt0VYIo8v1X9QHZc1LXiB9yWBjdSLkGEeoVibo1tMnjGcyFIn0abpKBmBegDjRxCZz24aZ/nz9LtDGCUNisdXcC091glsSaxWsdRLvxZnF0IwDsIr48WaCGf/bFTcTOc/JRV6BvzIBcBUB0ovre/hlXXs/fNhi7IQfpyuAbEql5AFCqT0QCZh5yc68FJeLk3XpxqI/extvmAifI5a60oVjbPHgQ+uHohtLy6EcrSLkM7CbkmAkbOKsl3YcMk69a5/pPIGhJkeb1BuCWjIjssIobkp7xP3DvHLcoGNC2MXEUbt0LgEMjSO5u1Okhx3ACdjwBN4sJYmJW8io0H3XUfNynqGW6x88mBQ9VfwGLdpHHFxAmln3L3VewgX042yU3Xz8YYYRFYfJU8b92rlsqhBcBeSh8yPmRKp/PEW+P8DA4kSHmVhZotGsjVzSquAgYp583IhiRKOH7sYibUD/7rzaISEeADSi6gP5xXwrAOrVBSPLabAnNowYWPxpmc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF93A1BBECD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(4143699003)(261028144727099003)(10067099003)(261021135927099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUxUdUV2bGtqMWdJbUt0Zy9sNkJVUWtJT0tkajV4d25NZm5yYkZKZW82ZGEr?=
 =?utf-8?B?YmlTYlJSWm90S2dUUWU3MXpBK2pkOTlpT01BOERjOWpLcncxc1YzM2NwY0RI?=
 =?utf-8?B?eVdLUmtna3pIVHg3N0dyUW5sR1RmU3VyN01IemsvNk9iLzI3bkN0YkdiWDF1?=
 =?utf-8?B?NUsyS2psSTRoMVB2OWZhNTl2UGVLOUdwRm00aDFUOWt5dlVoWTFzdzdVMVh4?=
 =?utf-8?B?MTkvVEJ1cXpoc0JUVmlqRHVyMU1oRXAwUmhPbE1HNVFtY0wxell1MzVUV3Nx?=
 =?utf-8?B?aXRMZVZXQ2JuV2RBVjRUNVNhZXVXZldHMERVNzVZUURRRjFpcnNscnpkbElD?=
 =?utf-8?B?alZFaVo4b2w1bklYYWhKUloyY2RyQ1FUa1VGYnlGSzlQYUF0TjFBMHl0VjlX?=
 =?utf-8?B?WE9yMzZZNkovUlpYVkhwR0lzYU5KK1hnL1AzMmxzK0NiMFROMTM1Zkg5eGpY?=
 =?utf-8?B?WjdqYjhPUUx4ajg4aHdyWWgrNjVUVFIyTVdnL0dYL3NLUTl3ajNwUWlpQ0dl?=
 =?utf-8?B?dFc4bG1NV0pKS3B2MWxqUnJVTGJiRjU0Z2UyOXRQcW8yRS8rSHNkREdKSmtZ?=
 =?utf-8?B?UXBOR2dmbWZNdGlpSWE3N1V4bFNvaWk2VmRGZHBpVVFLMlY1V0dBUEtCbnhm?=
 =?utf-8?B?ZDljRDloTEVEenQzd2k3cjViTlpoRDBzdmZjZEJjNlpGanhLYnhuQWpDRUlu?=
 =?utf-8?B?ZHVGRnYxeXJhbGVEVEdaZHhMZW5vTmIwQjRUeFNvRGpTN1NLUGd5TUJwUkZt?=
 =?utf-8?B?Z1FkWHVaTDJZbndtMkVZYlJQSGNYeWFDMUdGY1lvR3krbEpIQXVBZTdKWUo4?=
 =?utf-8?B?UzZTS0N3am96dUNrSVhCL09kcWZxOW8wTTJJNUNZZ0Jsd0pHWHVjL2pPTXA2?=
 =?utf-8?B?em9jNGdUSEh1ZlA1NUNmdVFJV2lva1pGclU0Y0RnRGg4R1RHZS9sU0dUKzc5?=
 =?utf-8?B?WTZ4QTBnVzZuZ0Fsc1pIZWJOK3Bsc1YvSTl2RThCakxCZmd3bDJjckpBMDhm?=
 =?utf-8?B?eG5oOXBNelZmMzRYelhlZUpRdzBFei8rT1l3R2ZieW02K1owN3ZJSm1BdFkz?=
 =?utf-8?B?aVRNYkwvUGcrWDhWQ2hWVDhWcDhZQ1BjL25uaytxa0RVOUs0YVgrNFVZamxS?=
 =?utf-8?B?UDFHL0JhdDBOVjVVYzdaTDdCUjdvK0tOVnJXTXdoemJwdDRpN1BsWncrb3BO?=
 =?utf-8?B?K1VoYXBnTTRKc2VUYXo1TEcxOHVaZG9PNExqMXlNNjNKOHFyRW1WM1NVYzRk?=
 =?utf-8?B?anBIU3E5TWlPdzNvclN3dVhDc1d4NUVWUmVIdk9JS2Zmd0hyV0tPd2FuejRV?=
 =?utf-8?B?dXRsMVF0MG1HanFJMkFXMnd0V0pCeWRmV3FJK0ZIZkxlOHBCNjRldzUzbnBO?=
 =?utf-8?B?b0NRN3RkZnN0UWdNNHlJM0RxQ0RkTnR4akQ5ZGZXbWVPdCtMM2I3OUwreEJu?=
 =?utf-8?B?Qi95NzkrZlBmcHc4bHdxU0FkZG9HNUtvandsekpveXZQeTFmTGo1bEhmMEl4?=
 =?utf-8?B?T3pmeWxUTjhSd3lLNHlRV0k5WHRkNzJScjFWZzJORjd4ekExK0tkTGlKSnhy?=
 =?utf-8?B?NTI5c0hhWVoxZEtNWjFDa2REMjBwNWpjVytKWGp2UXVzcmY5aEx4NlZScjhL?=
 =?utf-8?B?S1Qvck5aMmxVemcrRG02YTJpSHJqZy9BL0hieldaRmI0UzUzVHBtcUN0MHNt?=
 =?utf-8?B?WmlDOVlFVDhrVVAwU1h5MEFrd3haVmxyT05KMlFrTWNBOUcvZ2JmWml0dnFZ?=
 =?utf-8?B?S1VaMC9oUlVBS01iK3o4VUIwY0pqVXRaS3FYdUJpRHlqQ2tEKzRmOStYeWFZ?=
 =?utf-8?B?d01HUlVMaHhERFlyNzQ4MDdaaFRSZi9HdDExeFB4VUdVN1RWNzI4VUNRU082?=
 =?utf-8?B?Q2M1em9ETWdad2FOd0c3WUs4UzdWR05aTkJMWWVYTXlqOVl4c0tjdG1LemJS?=
 =?utf-8?B?K3U3VUpJVGdreEs4QkF0NjZzSnlNVmREVkZSdndrdW53eS9rZTg1TlNGMFov?=
 =?utf-8?B?VndEK1cvV1Q1UkRhVkdzUGZuVTZySFhCblVqTkl0UXd1L0dTZ0Nzc0w0TUN5?=
 =?utf-8?B?MTIzR2lrZVRVQlVnZmVmZ0k4c0M4ditMcnNPVDRxc0dWQTgvTVdFM3lkWXFv?=
 =?utf-8?B?cXloQnNZY3dNbDhUaHl1NU5zc2NqSThaODl4STNFRnphMDlpbFA1eW5FU3RO?=
 =?utf-8?B?VXRBNTBBYnlRSUZoM1VJNkVFMmZuK2xJOExkU3ZXd1o4V0RkL3c0cWM1eUtt?=
 =?utf-8?B?ZVorb25UTElUcEo0VFNxd3NCMHYxSlI5a1gxSzdOOW9LTVpLbGYzV0JnLzlu?=
 =?utf-8?B?RmxUWGtwd1d6blVPS25GdFJRZzhoQWVQbGJEemdWcHFvSkVsQUtTUT09?=
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
X-Exchange-RoutingPolicyChecked: 5mBeNlCDowg49yj55Rzkr/w41GcYipbrUYWTNTglvHx9Oy5EDJ5lSL6a4/7saL3ywBMnWbEDeI2Rnjt0z/LE9NzqUSiXFMj5bCIcR2Q0jOUIbtM6InN/QMNtIpJGxabknQVp1j6/TBq8KznreeaMUdkCdVBvV43xTYB4pe9U+XuRaTeiRM9O1U6utJVgAZvnb1XPvt0hiRe+y5fzBRhg8HtQpFjSQQ8aoMRrNMTbfNLjXc3OnkpnE4Ds9jFqd2Gb0bbGyTL6zWcL/Of6LPG/r4TdKVFbtHTPFBVqDbbsd+/isxlrRICly8L0Zw4qKkktMmTtjPo2kn1AtHMWJhoi5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF93A1BBECD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7786d05b-6312-4e90-0715-08df35902abf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 07:42:21.8236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HljvpiqJ+S/SJ70LcrkyFWItRMKElkRzdJCi7NPh8XV1aT5nd72ObyCYcu5RgWz6pejR1Jxo1W5VmHyLY4kt54y3X2K9S0L9hmZmVmin+E8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-OriginatorOrg: intel.com

Pk9uIDEwLzI3LzIwMjYgNDo1OCBQTSwgRHVhbiwgWmhlbnpob25nIHdyb3RlOg0KPj4+IEJ0dywg
Zm9yIFREWCBzcGVjaWZpYyB0ZHhfZGV2c2VjX3VubG9jaygpLCB0aGUgV0FSTl9PTigpIGlzIG5v
dCBwcm9wZXINCj4+PiBJTUhPLg0KPj4+IHRoZSBmYWlsdXJlIGNhbiBoYXBwZW4gZm9yIHZhcmlv
dXMgcmVhc29ucywgYW5kIHRoZSBXQVJOIGNhbiBiZSB0cmVhdGVkDQo+YXMNCj4+PiBmYXRhbA0K
Pj4+IHdoZW4gcGFuaWNfb25fd2FybiBpcyB0cnVlLiBJIHRoaW5rIHByX3dhcm5fcmF0ZWxpbWl0
KCkgd291bGQgc3VmZmljZT8NCj4+IE9LLCBidXQgdW5sb2NrKCkgaXNuJ3QgYSBsb29wIG9wZXJh
dGlvbiwgSSBwcmVmZXIgdG8gdXNlIHByX3dhcm4oKS4NCj4NCj5JIHRoaW5rIGd1ZXN0IHVzZXJz
cGFjZSBjYW4gaW52b2tlIHVubG9jaygpIGluIGEgd3JpdGluZyBzeXNmcyBsb29wPw0KPg0KPklm
IGEgZGV2aWNlIGlzIG5vdCBsb2NrZWQgYmVmb3JlLCB0aGUgdW5sb2NrKCkgd2lsbCBzdXJlbHkg
ZmFpbD8gSWYgc28sIEkNCj50aGluaw0KPndlIGNhbiBkcm9wIHRoZSB3YXJuL1dBUk4uDQoNClll
cywgc2VlIGJlbG93LiBJJ2xsIGRyb3AgdGhlIHdhcm4vV0FSTiwgaXQgbG9va3MgcmVkdW5kYW50
IGlmIHdlIHJldHVybiBlcnJvciBjb2RlIHRvIHVzZXIgc3BhY2UuDQoNCnN0YXRpYyBzc2l6ZV90
IHVubG9ja19zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLA0KICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpidWYsIHNpemVf
dCBsZW4pDQp7DQouLi4NCg0KICAgICAgICBpZiAoIXBkZXYtPnRzbSkNCiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCg==
