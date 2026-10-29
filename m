Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259282;
	b=TG2NrwsbRZ2UjWDU0zv0KWCZj7/yg7x2pyqkrrogEpa2Z7cADxMZhiIi3R7uDLRgxIpV
	 RMB3mOb42sJUphOv02S6tujHEuTgAgZnCGP97Jn06fute0DJHkorx+iapXE2qu9GJp4lb
	 Bjkuv4GzXlxzH1NoOxIOSDHb3ea4/8sGRJmXLXZhKztfm5fJQaz+ZK6W/coLuI9WM6vnb
	 ZY+o/M/kIxIQ9H4SOFb0Zkxmp/Wv1RMFoaruokKYXONvsWK6+GvZQv9pMPqUvPsMLmA7X
	 xJr3czep5FVGpufAEDZk8FGkOpTEmt0M1bQYKGSOmnHqH7R5hHxMODw7fMbrPk0/p2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259282;
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
	bh=eH0xPPwT3YK1GdLXJsG/LUovjDG3CkaoZxhP3+/0o80=;
	b=lu1B8LBGrpYNlXaugUvOoac5neTsJiBTKU65XfaMptu+mRpc9wqJ0pQis0i8v4rtMKq9
	 5PlB0STieo6LMpCc4q8EIo2PLWhqRw3vDY8UUZA2iovVJPVrMlMLImpXUqJyMlgM8s0fZ
	 JIX2aoWn1DJBWoFAoaQX5su33pNsKPCg1i4N52ZbK89zKFlCtDIrjwbky4soql0I2Imxf
	 zXmE/LvPhw4ohmKxNbNO/ar6YdQEm5Hopn+ST69XUi5dHKkdkzmCtdC+eWHfm/QIdMgZ4
	 wKuIOsr3g7HrTpmA0wvxfmR+m8jXFdRVVgCHLftO3GHLLhN8SWw87/UpOfwe0fL+Euw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="F/clE+48";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E80606A31A
	for <linux-coco@lists.linux.dev>; Thu, 29 Oct 2026 07:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F/clE+48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793259280; x=1824795280;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eH0xPPwT3YK1GdLXJsG/LUovjDG3CkaoZxhP3+/0o80=;
  b=F/clE+48jz5yspctOYTatrj9dB/7lP18AK6ASo8d7LMmHCFCH/uwaO2M
   r8vJSBjR/mdtv3SeyEXuwPKHwF2YrluzjsPySMzYszu9jSxQvNUzhIo9o
   wq5KWi9saf9EbPj7qC3FpAPueWiOVv4qADqZgCsrV4orRIDW9MSXa1z5i
   5Dvk0WRFOz+snYKFwSgpq5G1sXkjpmZnwBEoXgUbqVpqKdW+4ejxCbnKT
   ZqHuTZbwkSZRp2Hf7bW2OruNZLasz2oaKiWjd8L2CMTgNxWiOCQJMRIgk
   mcqvIC1VyGMD7oArd7ABL8K2qQpzfWSZGc1/VUIuQy/g7lHqtEnc9LKOR
   g==;
X-CSE-ConnectionGUID: 0oRjE/jASqarby4LDNobMg==
X-CSE-MsgGUID: JM5kSHu2RM2qCmcNGix7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2026797"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2026797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:34:39 -0700
X-CSE-ConnectionGUID: An33kxWCSFioB66n9pik4A==
X-CSE-MsgGUID: XRsYr5P+SH67yYRxsKLamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5067122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:34:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:34:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 00:34:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 00:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3dGNU5/8s8KQSSqdiC+9R+CTuhtI/aXIDfPnsMaJ0cv0krIkxX3JBdyIvWh/7o2UN9JiehOyBcWpVsgEZ/ztbAPe16vkzqNeDQmks/IqhY0rs2SuDMnXR7QleYRz1pzJ+tQi33jbz+N2bRLZlwSzi99Qwn5Uqwg2u3Vlui5fYv8JQHV0qSaCD6E0q3JUwKHd6yAsTez66Pl5Fptvq9/NyVj4MNQkhBTsKJDjwx9md+jvxC1r/o8kT4ZsIqOUTqiwzJeT90httKROXv+DjR6mpbZ+7peUql7niSKF3+P3zO33JXWa6yAGhcDt2yV8g6pgDdf+BMputrqVG/p2m++mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH0xPPwT3YK1GdLXJsG/LUovjDG3CkaoZxhP3+/0o80=;
 b=Rm1P4ac5/RM3h8R0yJeNsDdidnxlhD4Zbw8UK7WrrR1vgfOQeucpWwrI46eJehYVTu+oV69YzgieyEbu3PUnftyhQGAxbUHeU4AOYCfKy1mmVwQuzk8/KwIjf3LGJrTvcqepFB6NZvtAr5WG3aSX+EKdGqYly1KRb/LsivocuJsfFww2O1utr8NL7ZNURD+khrybNvJwA9UVg194o5rzxr+OTFEQz4Rwz1dkxILVMEVqjYyHEN/cjasZ2ys4Z1AnBTUhfsLLuAwAjrVyqb3cL3gHUJGiA7giUqzuhDlX3DVprzpnGWUKfAQr3WOqLN/S1+idcOh2WTBrWCtSNHYGEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF93A1BBECD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::3c) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 07:34:34 +0000
Received: from DS4PPF93A1BBECD.namprd11.prod.outlook.com
 ([fe80::7fcc:9f43:b0e9:943b]) by DS4PPF93A1BBECD.namprd11.prod.outlook.com
 ([fe80::7fcc:9f43:b0e9:943b%4]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 07:34:33 +0000
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
Subject: RE: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Topic: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Index: AQHdS9q3p3OwHlhwLEuB5opu5u+CqrcPK4AAgAG354CAADLLAIAAAwnwgALl5ACAAFfR4A==
Date: Thu, 29 Oct 2026 07:34:33 +0000
Message-ID: <DS4PPF93A1BBECD65E19B8033A7446A50DB926E2@DS4PPF93A1BBECD.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
 <IA3PR11MB913636B33BDBD49DBC87555C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <920718ed-16a5-426e-9407-6ed37181615b@intel.com>
 <IA3PR11MB91368EEFC32F4CBF3F3CD16E92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <c144541f-71de-4791-889c-d7c354eca2af@intel.com>
In-Reply-To: <c144541f-71de-4791-889c-d7c354eca2af@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF93A1BBECD:EE_|SJ5PPF7DCFBC32A:EE_
x-ms-office365-filtering-correlation-id: 4df23c15-b327-4dc2-e943-08df358f13bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|261028144727099003|261021121427099003|56012099006|4143699003|11063799006|261009223027099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: YBcY4egdinhDOld/XUJivQxMs015JhDhvtMeuXKv8TwwkVrtUL/gFIsJBGzAN52hR83swiVwe2JKV4eNLcVc13KWC5JR1kE5YL/o+JU1xoOCqKDmUY4erYRS2dahsod0cXrlG5nVsqzeE9yIoYCo+oSKbvags+k9FmiehXJzYbnRXU6jYWIEcm6U0w9qDE5hTcoRj3eU1EkXYuxxul+JumTkH1EHUlzj3SrWYinq2ZkNM4IuZhktzhIys4umjy64Ua1rvC3VTaSlC4CCNMsJh70rOXRMLqSXEJiIL3yYB5HcFgukDMEUAQpysGrXrm/wfAfLC5VdAs3+EW2cnEUJt1gouDbRXrRCbBQFj0EDi8VZX+hIC3vTFlcF0yZcgivOjpTnBB4wgt+EYYs3815COq7JtV1sHFAUmkGhz2JUUBLm+gHp9OTIsVjoM8+PtY+zNRVmPabAJ3sgFyH21l+B+X/EAIT4hw1JsOfPSSiaMvr6E0Tz7sUpWs+1EgJi3JDf2VdkWRprMDvLOwSiYOv6WIAxZ+ylJDBeG1Ykua0T64MbAQKaJ/ThJn86gUgQd4RYqFMlyQDzbToDNAWXsDOOKPB4szaSlMLqkSl5cHyJFg6JblvKa0Qf8F5as9lHIBT3ZBrw9w5LolmuDCXFDm2M/gXmKU77pVRH4Mg83L5Tsks5S8fINxMKqu8Ci9CdjVWfLV4aYWRLfAXTl8JJ8pusC6ScUs3wMeacU7uUTo0rk40=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF93A1BBECD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(261028144727099003)(261021121427099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3RWYzBlUG5zN2Q2cUFORks0Nll1NEhleUxHOWw2d0NlM1hHRHk2akJwbFVz?=
 =?utf-8?B?ZXo0OVZoV1U5NnBwbUova2VqVlU4MU1oeXlOcHB2aWdKc0VyclhFd0NBQ3ph?=
 =?utf-8?B?am9wekFpM1graXhuLzh0SG5wZE4zbEFYdUpzbTNXblZsbGFsY1dyQVJtLy9H?=
 =?utf-8?B?ZU1ZS3pRN3c1RlNJUGxqRVY0S3VuUUdML1gyVU5hRExIQytwTjN6RDRjNThG?=
 =?utf-8?B?ODJ2a2ROVkVtbTZEV3JHUHdJa25xa0lLYVYyL0JFdlM0akoxVFp4K2M2ODZQ?=
 =?utf-8?B?ajhkUEFtamdwL003d0t3TTRQYWRPSlhmejN5dXNzQlBPaURPNm1pL3piRkxU?=
 =?utf-8?B?ZzFqTVVIZTNCVkNMVE4zYXFpY2diQUpoOEd2TEpPL1NxSzVPNFNHZlJQclFF?=
 =?utf-8?B?WGc0Q3ZPbjNaTlUvSXlCbnBQVUFraVVMU2JVQ1pVcHlPRm1vOWZDcFJaSU80?=
 =?utf-8?B?UmdZZzJCSUNOd2N1V0NaaEpNdjdtOFZ1MlZwVnZGMElzUjYwRDhBSjM4NkFR?=
 =?utf-8?B?TmxuYTIxejhRR1FjN3k3Q3VFMzlleVpNS2hjd3JNeUpPbVVzMm43UnhzY1oy?=
 =?utf-8?B?V3dIT1QvUWMvU3BxS09rOHE1OUxxbzdaUDVXMWJQeWFzWnNpeW13KzFsOXRB?=
 =?utf-8?B?Q0hVRTBrWWFneHJLaitqUjBNR0VTY29Za2d1eGZRQllzZVp3S0FlL3VwTVFG?=
 =?utf-8?B?ZkxYci9WTUt3UzlMQjBUclc3Z1gzQU9ZL21KTzRXckJTR2xUU1pIMmxwNlFJ?=
 =?utf-8?B?WUd5WnF6VDhBS3F4UkhaMlRJT3VneVpVMHRpUmplWVdoZ2RtaTZXZk9WeWlv?=
 =?utf-8?B?SHpvdVdBc3gvZGpoN1YwQmdWbm1vY3lkUk5qM2g0ZkFNaFh3KzlGWllPMFA4?=
 =?utf-8?B?LzU0RDdKbnUzSEJLTlFBbXNLY25rMTJCY0pDa3JacHQ1S3JwYzBnQUlRam0w?=
 =?utf-8?B?WVVnZGtYdm9kU3JOTm5CYWxrUnhDZUJtMFpCbDVPU2d0RVlWZU9wZDNHU3hF?=
 =?utf-8?B?QjA3WXoyTjJQbi9vSlYrVzZ0L1hGTjF4NG5RUFljenl0MXVSUjJJd21HdmJu?=
 =?utf-8?B?ZVg5L1lsbk15dkNlNTJEUmp4b20ralB2WkFWcEJVMUk5L3V1SXQzZXA3SS9N?=
 =?utf-8?B?YmtGMExqb0hZWE01ZTZMZkY2bnROamJINnR2dHZ6TFVvRnlOajZKaytUd2Vh?=
 =?utf-8?B?aGF0UVNqZm5pUkVNcXZvdFdBK1FrWTR1dDJrTGVxeVg0NmUzMHVIY29ZMUFT?=
 =?utf-8?B?ODJWMGpHaFcraUNYZEVaNTZUN0NFbDVtQjUyNkNmRHBhamZHbmhwTTJLVmxs?=
 =?utf-8?B?WE5sWkhQaTNiL0J0TlVWeUtOSmgwYnVLNFdtaEpSMGZRWUFZZVVHVVBwcGdj?=
 =?utf-8?B?bUhxZ2kyalAzdldGOW5KZDNma1F5SUdxUHJJd1NVZkFyUjIyRVFISm5NdGZm?=
 =?utf-8?B?WGRMZXkzMERVMWkyYTA2QlNKUDFDdFlMWEpGTFFENFMwWmxQRW5SQkxWaHJk?=
 =?utf-8?B?U0ZYMDVvMUpNM0ZXUE1PL1kzVnJWSkZYR0VYK3ZCbElRem9CM2xhbEpVeStW?=
 =?utf-8?B?Z25sejVNOG5kMHlud3pkWU1mTTFwRnM3UWplN2JIMm12RUxZWGh5UFhUWmhO?=
 =?utf-8?B?cm1HQkRMa3huRGlzdTlIQ21CM3dEVzNQYmN2RWs0c2txMWRaUmlNZTJtMllT?=
 =?utf-8?B?L2Z0cUQzd1M5SVFBcXgwOXJpRHVOQStBQUg0SU9XMHhyeWdSS2xsYklSUUc5?=
 =?utf-8?B?bFdaLzFQSHFkK2pKKzhXL0dMSWJjUCtLU20wdDBYeUFsaXFEM0o1SERCR1Bi?=
 =?utf-8?B?bDZqelp2UlhpSloxQUYxSVhPdWxXS25UYWg2dVJLSmFkQUtFWU1IZGN2ZDNy?=
 =?utf-8?B?d0NrbjFRd0pzYUxLN3lRb25FVTcwZGxpVVNqZ01pMWZyZmIvalVxZWFibjBq?=
 =?utf-8?B?QmpUc2pCT3FqSVJHR01EbGg2Ty9HMXdXK0RuL3NlUWtsbzdZWXdMSHRWNDYw?=
 =?utf-8?B?Wmlzei9SVE5zRU9PSWM4dEtYSDNCWlM5OWJDcVpXRGdoU01SWTRtYmpvbm9r?=
 =?utf-8?B?WFprZ0JxWnk4d3VCcXNUS2JjSFFBWUczWXhGYjNkWW44b3pFRUllb3lnMmxx?=
 =?utf-8?B?UmZaTm9mY1F0S2Rsa1FUVTNKWXdhYzd6Vzh4ZWdDRnNEOXhYUERFMnRwRkl3?=
 =?utf-8?B?b0pmNEFXVk4vVStWdFFqYk5ESzg3YVoyL3hkYmhqT2Y2OWhMNnpzbCsxRjEy?=
 =?utf-8?B?akVyU3B6NTdVajg1UjZEZVR1c3VYQkRrNmN1aFhwZjYxMlhOOVhsVUV0RGg0?=
 =?utf-8?B?YmRBWHNDczlBUVQ2aGhLODZhRnh2NW10U0R2cEMvQW84b1NIVVlBZz09?=
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
X-Exchange-RoutingPolicyChecked: 2FLlNeIhc9qydB8tCslcMR0qnD/aAuFtvCImesB1+M4U/oRDCv7/gCrF2SrrxX2Af/jL49JUXHoTUaL2p6TH9KacX8gM1GWqUXWU5hTPcWLYsI9QC3h5vyC3pvdoKufE+rBsEX+owXtYV5EnuAYmAjNO/b/CI/M+/cqmsLMnLY2vIowU1Jpr1yN3WsqE49dYDALsw4fesIFPNjzWSsz+vIVvgxgvVkbs9f+ME1m0pr4ReKodwRW9u3lgXhlKS4u+XB0WSNBSecQV5HqoIkkt9WI61vadhYjGkb+s4qhSwv4HqYw9zJk9IH13oaLVDSG7KyWzsewZgRc2Su1wht/lpg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF93A1BBECD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df23c15-b327-4dc2-e943-08df358f13bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 07:34:33.6716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nne8nDzIDB8knIB8MTLRifp7cSCLKEuaNbDJrFPXuOfahbXGnPLafh1zAX602AUHIPouGo4ueyDTun7STqgYqRh34V7WBBKXN9ikioA/CmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7DCFBC32A
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMi8xNV0geDg2L3Rk
eDogQWRkIFREQ00gaHlwZXJjYWxsIHdyYXBwZXIgZm9yIFREWA0KPkNvbm5lY3QNCj4NCj5PbiAx
MC8yNy8yMDI2IDI6MDggUE0sIER1YW4sIFpoZW56aG9uZyB3cm90ZToNCj4+DQo+Pg0KPj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogTGksIFhpYW95YW8gPHhpYW95YW8u
bGlAaW50ZWwuY29tPg0KPj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAyLzE1XSB4ODYvdGR4
OiBBZGQgVERDTSBoeXBlcmNhbGwgd3JhcHBlciBmb3INCj5URFgNCj4+PiBDb25uZWN0DQo+Pj4N
Cj4+PiBPbiAxMC8yNy8yMDI2IDExOjI4IEFNLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6DQo+Pj4+
Pj4gQWJzdHJhY3QgdGhlIHVuZGVybHlpbmcgbGVhZiBjYWxsIGFuZCBwYXNzIHRoZSBzaGFyZWQg
YnVmZmVyIHBoeXNpY2FsDQo+Pj4+Pj4gYWRkcmVzcyBhcyBhIGRlY3J5cHRlZCBtYXBwaW5nLiBB
ZGQgYSBydW50aW1lIHBhZ2UgYWxpZ25tZW50IGNoZWNrDQo+Pj4+Pj4gZm9yIHRoZSBidWZmZXIg
dG8gZW5mb3JjZSBjb3JyZWN0IHVzYWdlLg0KPj4+Pj4gVGhpcyBkb2Vzbid0IG1hdGNoIHRoZSBp
bXBsZW1lbnRhdGlvbi4gVGhlIGNvZGUgb25seSBXQVJOcyBpbnN0ZWFkIG9mDQo+Pj4+PiBlbmZv
cmNpbmcNCj4+Pj4+IGNvcnJlY3QgdXNhZ2UuDQo+Pj4+IFlvdSBtZWFuIGJlbG93IGNvZGU/DQo+
Pj4+DQo+Pj4+IHN0YXRpYyB2b2lkIHRkeF9kZXZzZWNfdW5sb2NrKHN0cnVjdCBwY2lfdHNtICp0
c20pDQo+Pj4+IHsNCj4+Pj4gICAgICAgICBzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlYyA9IHRv
X3RkeF9kZXZzZWModHNtKTsNCj4+Pj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX2V2aWRlbmNlICpl
dmlkZW5jZSA9IHRzbS0+ZXZpZGVuY2U7DQo+Pj4+DQo+Pj4+ICAgICAgICAgaWYgKFdBUk5fT04o
dGR4X3RkaV91bmJpbmRfZGV2KHRkZXZzZWMpKSkNCj4+Pj4gICAgICAgICAgICAgICAgIHJldHVy
bjsNCj4+Pj4NCj4+Pj4gSSB0aGluayB0aGUgdW5sb2NrKCkgY2FsbGJhY2sgc2hvdWxkIGJlIGRl
ZmluZWQgd2l0aCBhIHJldHVybiB2YWx1ZSBzbw0KPj4+PiB1c2Vyc3BhY2UgY291bGQgY2F0Y2gg
dGhlIGVycm9yLg0KPj4+DQo+Pj4gTm8uIEkgbWVhbnQganVzdCB0aGUgY29kZSBvZiB0ZHhfaGNh
bGxfdGRjbSgpDQo+Pj4NCj4+PiArdTY0IHRkeF9oY2FsbF90ZGNtKHUxNiBkZXZpZCwgdm9pZCAq
YnVmLCBzaXplX3Qgc2l6ZSwgdTggdmVjdG9yKQ0KPj4+ICt7DQo+Pj4gKwlXQVJOX09OX09OQ0Uo
IVBBR0VfQUxJR05FRChidWYpIHx8ICFQQUdFX0FMSUdORUQoc2l6ZSkpOw0KPj4+ICsNCj4+PiAr
CXJldHVybiBfdGR4X2h5cGVyY2FsbChURFZNQ0FMTF9URENNLCBkZXZpZCwNCj4+PiBjY19ta2Rl
Yyh2aXJ0X3RvX3BoeXMoYnVmKSksIHNpemUsDQo+Pj4gdmVjdG9yKTsNCj4+PiArfQ0KPj4+DQo+
Pj4gaXQgd2FybnMgb24gdGhlIHVuYWxpZ25lZCBidWYgYW5kIHNpemUsIGJ1dCB0aGUgdW5hbGln
bmVkIGRhdGEgYXJlIHN0aWxsDQo+Pj4gY29uc3VtZWQuDQo+Pg0KPj4gVGhlIGNhbGxlciBoYXMg
Z3VhcmFudGVlZCBncGEgYW5kIHNpemUgYXJlIDRLQiBhbGlnbmVkLg0KPg0KPlNvIGZhciwgbm8g
Y2FsbGVyIHlldC4NCj4NCj4+IE1lYW53aGlsZSBHSENJIHNwZWMNCj4+IHJlcXVpcmVzIHBhc3Np
bmcgNEtCIGFsaWduZWQgZ3BhIGFuZCBzaXplLCB0aGF0IG1lYW5zIGlmIHdlIGRvbid0LCB0aGUN
Cj4+IGh5cGVyY2FsbCB3aWxsIHJldHVybiBmYWlsdXJlLiBTbyBtYXliZSB3ZSBjYW4gZHJvcCBp
dD8NCj4NCj55ZWFoLiBJdCBzaG91bGQgYmUgT0sgdG8gZHJvcCB0aGUgV0FSTl9PTl9PTkNFKCku
DQoNCkkgaGF2ZSB1cGRhdGVkIHRkeF9oY2FsbF90ZGNtKCkgdG8gcGFzcyBpbiBhIHBhZ2UgcG9p
bnRlciBhbmQgcGFnZSBjb3VudA0KbG9jYWxseS4gSSB0aG91Z2h0IHRoYXQgY291bGQgYWRkcmVz
cyB5b3VyIGNvbmNlcm46DQoNCisvKg0KKyAqIHRkeF9oY2FsbF90ZGNtIC0gU2VuZCBhIFREQ00g
Y29tbWFuZCB0byB0aGUgaG9zdCB2aWEgVERHLlZQLlZNQ0FMTDxURENNPi4NCisgKg0KKyAqIEBk
ZXY6IFBDSSBkZXZpY2UgaWRlbnRpZnlpbmcgdGhlIFRESSBpbnN0YW5jZQ0KKyAqIEBidWZfcGFn
ZTogRmlyc3QgcGFnZSBvZiBhIHBoeXNpY2FsbHkgY29udGlndW91cywgc2hhcmVkIGJ1ZmZlciBj
b250YWluaW5nDQorICogICAgICAgICAgICB0aGUgVERDTSBjb21tYW5kIG9uIGlucHV0IGFuZCB0
aGUgaG9zdCByZXNwb25zZSBvbiBvdXRwdXQNCisgKiBAbnJfcGFnZXM6IE51bWJlciBvZiBwYWdl
cyBpbiB0aGUgYnVmZmVyDQorICogQHZlY3RvcjogRXZlbnQgbm90aWZpY2F0aW9uIGludGVycnVw
dCB2ZWN0b3IsIG9yIDAgdG8gcG9sbCBmb3IgY29tcGxldGlvbi4NCisgKg0KKyAqIFRoZSBidWZm
ZXIgcGh5c2ljYWwgYWRkcmVzcyBpcyBwYXNzZWQgdG8gdGhlIGhvc3Qgd2l0aCBkZWNyeXB0ZWQv
c2hhcmVkDQorICogbWFyay4NCisgKg0KKyAqIFJldHVybnMgMCBvbiBzdWNjZXNzIG9yIGEgVERY
IFZNQ0FMTCBzdGF0dXMgY29kZSBvbiBmYWlsdXJlLiBTZWUNCisgKiBUREcuVlAuVk1DQUxMPFRE
Q00+IGluIHRoZSBURFggR0hDSSB2Mi4wIHNwZWNpZmljYXRpb24gZm9yIHN0YXR1cyBjb2Rlcy4N
CisgKi8NCit1NjQgdGR4X2hjYWxsX3RkY20oc3RydWN0IHBjaV9kZXYgKmRldiwgc3RydWN0IHBh
Z2UgKmJ1Zl9wYWdlLA0KKyAgICAgICAgICAgICAgICAgIHNpemVfdCBucl9wYWdlcywgdTggdmVj
dG9yKQ0KK3sNCisgICAgICAgcmV0dXJuIF90ZHhfaHlwZXJjYWxsKFREVk1DQUxMX1REQ00sIHBj
aV9kZXZfaWQoZGV2KSwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNjX21rZGVjKHBh
Z2VfdG9fcGh5cyhidWZfcGFnZSkpLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJf
cGFnZXMgPDwgUEFHRV9TSElGVCwgdmVjdG9yKTsNCit9DQorRVhQT1JUX1NZTUJPTF9GT1JfTU9E
VUxFUyh0ZHhfaGNhbGxfdGRjbSwgInRkeC1ndWVzdCIpOw0K
