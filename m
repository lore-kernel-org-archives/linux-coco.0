Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794952832;
	b=mtQZwgznEiFp2DK+l1nLdqjYXQBMJMmBvlWtE5RX1Rwx9enF9kq86vp/iTVb0r3QNbV5
	 ecQgaY8beb7lHQXb2lQ7MQ6X9xdLq9FEEo21HRPQJHgVYxpvho/o8kUbbalXz4MqEIMMs
	 yPATHFHl3AZuURgWTVakJCirDvIuVDA4b+vwMtUoS5/mtUIb1FMezon8eAUN6hUByipAn
	 0HawNTAwyGBLvE4OoHet6+U5eLGL7EJ44PIdHgk8H7Ojjjat9JdqKKdZaz23aY62UmPoS
	 gPfVQennw4zEvBgKUaNSJshdgnqfUZeHy/Op9XBRQASmBJYxR5IpLuuo2r0h20KXwJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952832;
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
	bh=sZJvDO+H1aE3i4mNHcVDHyThporCeiXTDouQU4aH63c=;
	b=ulCXvjX2cb+EQF7gpfXMg4swWrXHvEWgokagdjlMjUqgJbn+AjFRzLp033RzQtj3pxUK
	 SpNtGS7pEnfD6uI1enfzv2UGtlAV03KcaYyFcLVY4Eo7OXUThC9QGUjQ/MiC2Z/eOlpLf
	 hD7BlrH4i1+zllaVwr1hX3m+qcqaWcBYQwpl/S946vUTm62nEMoBeFo9GXh/fqOELS5XX
	 DGUOBYg1LhBqmqfnOO39B7UdYeTh0m0JkgEnXHAMklpvmik1cJho5Q8npFCf4Mqd8aOb2
	 r20rUbyP8Hx6olB/QDSicO0i7M5WAPa4po6+4gkZZ5aj73PGQkqdnttcRSNFQmbpdRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=igksHLuH;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KRK4eNtN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E59606A32A
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26E59606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=igksHLuH;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KRK4eNtN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794952831; x=1826488831;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sZJvDO+H1aE3i4mNHcVDHyThporCeiXTDouQU4aH63c=;
  b=igksHLuHh4l3XHLpssKVJRanzPG/R051Elh0xVsk54z92tQ4UtYVsRMe
   li70vKxawgPdzBwF/7Vu61/FcMufgWFVm/G53uEqZRvF85qul4UUCB34b
   ZzaJbfBxvQ6aYL/khv4W8YZ0ZhHd9cz1064wGSEa5ML5sm0R0pYQuQKqm
   2YkyYjLxW5HQBjYpMLV2r3jj1Rf4wSPbI0dDqWp+nAMwUs6gad5t5EZLq
   czGjpS4mHZhn6EQC1Iu0lIVkCEQ5SDIKe8FXLIeRQfuibr5RuqiSk6cCn
   /wH65U318nQtlC2EQVC0ThPEJcA3Fi7XSasCX/TdXa6/ezHlKAEYLY4DN
   w==;
X-CSE-ConnectionGUID: 4DnQ9nQJQS6R2t1PmZKB3A==
X-CSE-MsgGUID: eR2tJAKFSYS/+g2XkPS2TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3774774"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3774774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:00:28 -0800
X-CSE-ConnectionGUID: FaJje5ZSQ4iy7yLYYsfKXg==
X-CSE-MsgGUID: aZVdprE2TiqW7OasnW5ihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9838760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:00:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:00:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 14:00:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 14:00:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPM6YS1gsZxq2cd17PBGpCM3HAcGkAqB0iKk0n+UVcVr5qxRFChSt+Zi+w/H5qkSfFXZzWsLEqvVSpnFJBOg4LLq7FbddvNmZp4JDrUAcTKOLfotirge6hGoeBQzwCb8+o577Sf7sqdMNt+z7NrWfE7YVBRTP2KFANHeqi5DYdVBJ9rThxKvHR89j/Ex8Lp12DyLue6VWKeJ3+pdOJchzpK2wNyofmKosIzHAub6Tu+9MdrUJzE9N/ZJFr0YXJqr8HPEzRhcjSKk7JQceyLxWk0rDE22DiNwHOO8wdQnggYQvAy7COP3VA0t0fcW+/CxHFbY9l9VSp3NBtKSXxFPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZJvDO+H1aE3i4mNHcVDHyThporCeiXTDouQU4aH63c=;
 b=tu9GpNpXb/+dGexqlzFW0QO4dqzHDSOBRH2iJrLN6cNVHYOgk83Mu7lHGs1ZDMt2aJREqT8YnBOYlSfMZtSzFKPhD2mTVqscqycVaFOsoeYF/C+WKCrgACYesEjGBH/8K2zK/RkE2SDgyaeznRrYnl2prxiGT6aoxwcF1bbvkq/SWelNL6VFE4N4CelguA/TDeVwbLAXE4iIivrSk+nBYQFuqjSqqf6sU4IFN21M4WWyr5NkYewRKNC54trsqxL4LmGS0k8KP1rFIlP+ehTHJon3Pe9GvWVXmOXNlD9/kXf7x/Z9/f4R8i89YSEZHGb0EZ6GGfpxEkZrLzYiZs9i+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZJvDO+H1aE3i4mNHcVDHyThporCeiXTDouQU4aH63c=;
 b=KRK4eNtNiQtiSdFbl65rz+WW1wmZca+agqy4W6Ae02Cyv7ScrsZR8gfbwL5+yQjrddcxiyZqGFR8lEIsblJHXuzrTYKXhMLCl+unp21tSqiqE9z4gyGLzGtNwv1xsoynLD09Hj/ugklmDSktvNuc1pgOmvPhgrIvTght2UqGZn4=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CHAPR11MB9677.namprd11.prod.outlook.com
 (2603:10b6:610:300::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 22:00:25 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 22:00:25 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Peng, Chao P"
	<chao.p.peng@intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "aik@amd.com" <aik@amd.com>, "Gao, Chao"
	<chao.gao@intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCACkAugIAAmzsAgAARWICAACktgIAAHwIAgACe3QCAAcf+gIAHAeeAgACyo4CAAL8LgA==
Date: Tue, 17 Nov 2026 22:00:25 +0000
Message-ID: <b64a7c8e5b2cf37fc39453b83e7256d5004a02dc.camel@intel.com>
References: <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
	 <20261110195745.GG738765@nvidia.com>
	 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
	 <20261111001606.GH738765@nvidia.com>
	 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
	 <avW3jZYB5/L4WaGL@yilunxu-OptiPlex-7050>
	 <49b19bcfa1b0658cc0aa5cd280acb439bbba8287.camel@intel.com>
	 <avwuPRylKEs17+UV@yilunxu-OptiPlex-7050>
In-Reply-To: <avwuPRylKEs17+UV@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CHAPR11MB9677:EE_
x-ms-office365-filtering-correlation-id: 26b68077-1dff-4b8d-6da5-08df44f62f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|38070700021|10067099003|4143699003|56012099006|11063799006|261026121527099003|261022075727099003|261026140227099003|261021123027099003|261021135927099003|261022105027099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Vb3an6f4mgTIFieI48Md35XZ23yj7bmGDPZnp3wjj+V0gZb/iJNr/zR7tELLx79gWlxqae2J98hbxcDdEEn0NIJYgXuRpMvQpWB26dRp9bE4lq6iaIOXEYJcXxMH5EBBi7CePYKC+mE99Kz5cPJlqFYX76tk8lqxcUM2OGmKXMS9FVWnOggGkS62a5oaJD4l1PaIMItuvHt9SWXG5pFfV6kaFlDy2qy1BdI+GLW7I1/qJpm8Is4Hg/UqUbTYPCIUM4kLoIWoAM24HjRLj4k+oQ/K9Fu2RqPOJUYotWYSOVxRdi96V9WUm4ybEaifXYsnBrmL339QN2xSX+KTrBfLbnAmS86GZXFyc4Jm47Idw4CHREM0HvZiShHGUEGSAweJtJgofag0lxU//pj3KQy5WoYfUycTBJpRAUFmMWtPl/nCD9krhzq9rugSit18+/0P6fzmCBUDln0Eo95EnBWEOA7VeRL6w5JskOkAgJeKzyBFfNTPLIuKuDi6iTzcIriigcjHEoYVSRthSakorNlOvY9A4b52I2e7nU4N1LoIixw8hojAY8O5jfSbeFwzJ7XzmCTu5SRLh6a0xl94nIxrf5H3Sov053IuV4IH3Wt12Lvu5KH5qxnK9MFEq2xESAjJ4oWw1LZA+ADzwndXEHRmZ5cUy/lofdDVD4bkK1a6/zWDMynaZIxUHsPMvuHlwXalqO/ncabX5cd/5e1+ieYH2Gj+Ah1WTt8VLFdUUTSKOJ0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261022075727099003)(261026140227099003)(261021123027099003)(261021135927099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmRYOUZMRCs4TFdYdVlhTTBWTlRhNUt1bmpDQmU0dHJuTDI4UWRpZGY1elRD?=
 =?utf-8?B?R0U2QzZJUys1cVI3UC9xMmZFenBSTWtUb2hjNzVaWHgzTjZTUFZqYnpCNytG?=
 =?utf-8?B?MUMrTktQcDhpUG5OZ1MwV25ZalZIREpBSUlibWRFRzUwYnVtdnZ0Vk9oTzF6?=
 =?utf-8?B?R29MMEE4QkozTkFuS0lkU01vajFQUVEwVUpoNGhEUFRBSm1ra3ZaR2t1Y3Vw?=
 =?utf-8?B?a01yNUJRSENXMkZ0dmc4OGpsL2loTEorMlhEbWwvTXllenhpTEI2NERMTXhT?=
 =?utf-8?B?YWg2VEFNRTVjREhnR0ROVk1PU0o4eERFOXhiSnpNaVlGeEdmbnpBMFc4WEpU?=
 =?utf-8?B?VThUZm96NCt3V3BmWUVLS3BlYnhMNUNJOFoyN1QrcFFrRzhYNEJHcVlYVko4?=
 =?utf-8?B?VHVWODNGR0t0aEhQS2ZLcEZsKzRacHg0QXRnVGg1VUF5Y05zQXR4cWErQ3dn?=
 =?utf-8?B?QjZseEtwdlZnaTNHWkNpT3VNMEhoTGpqcjkyVzZLakEwbTVnTnFDbUdON0xl?=
 =?utf-8?B?RHJZalFhTEsxMEVkOVFvRjNORUJOckF1STJKWFY3VGNRVCsvSG4rRmpxOFVy?=
 =?utf-8?B?UVU3MW9VNWxpVVYrTFRKeS9hMWIxRjdaVDJDOHN2eWpBU25uVVcvaDhvR1Vr?=
 =?utf-8?B?akRSS0ptT1JBWVFBb3FGVWFZbUVnU2M3c2ZyQUJMZXF0UXFubFFrRTZLQWMx?=
 =?utf-8?B?eGswOTlTL2pRbk1yTU9ST2hkU3pjK1c0aFRaeU5SRWNjQm5LNUVOVjdCOVZh?=
 =?utf-8?B?M1dhNXBydEJOc0oxM3FLcTJxSTJWR3hwblNNNkU2QzYydjROVzd3QUtDR0l0?=
 =?utf-8?B?WWVnUW1CNUU3QmcvNDNPZGlUd1BkSk5TYVB1L0pYWlJPVzdhUExRY0FNdWFp?=
 =?utf-8?B?TWduQVNYRVozTkVGMWNrVWptZXZnL2lnQThuMldJcVQrNkJjNVhOOXc4RGVE?=
 =?utf-8?B?bXpYd3dJZE1lSGx6cGhOY3luOXpyZ2xHamFZaDhVNmxRL1pPc010VXFiMjBo?=
 =?utf-8?B?NmJXcWxBMHVqcVMrNmFKazVLbnVrTkx4b1VGSmhsWGpmU1NFVnJ6anVMcGt6?=
 =?utf-8?B?cEExd01OZDEweHhxK2Rma3BjeFNNeWdpTitpb204UXdYT29JOEg2WW1DVWVZ?=
 =?utf-8?B?cjlVNSsvb2pidXB3em9xMGl1dSsvZWtzZC8wZ3daYWE4b1lKNlBxUUo5OUJx?=
 =?utf-8?B?QXVvemdVLzJxSmJtck5OYkFGZDNoSmxYbDUwTmsxZUlMVzJvSG1SVm9jT1hE?=
 =?utf-8?B?Q3RYUTJsS2pzU3hKMWZ1NkxpNzBJOUZQbDFsc1d2Q1BXSjhFZ1Rwd1k4WDFr?=
 =?utf-8?B?ZUplYzBGQzg1ZDhMd1BFK2ZpVVJid0c1N3NOaGViaTluRUEyVlNSdjBxQWIw?=
 =?utf-8?B?emFWNVd0R1l3dEI3dlpmb2owOEw4MXJpWWY3ZkFFVFBOS2FiL3NKNGNpMndp?=
 =?utf-8?B?a3ZIZFVxNHVUT3J2dVM3OXk2enNGNFZMZGNQdHFvcjJRb3VZL3JuY2dVR3Er?=
 =?utf-8?B?dXNSNW4vQ0FRVzQvMkd5MWhMQndYTkE5dTcxaFE2VzNqY3NXbHZqRTVXaFpv?=
 =?utf-8?B?MFB3Rk54TFQ5OUlBZ1ZidzY0N21JbkRzZUdCcGVBZnRDN1A3RDU4cTFkdmpS?=
 =?utf-8?B?cEtTM080WFRqQ0Q4ZU04amdNU3FsaWNYOXdicW55NW5LZzFvU1RIQjJ5d3Iy?=
 =?utf-8?B?U3M3alNJMnZCTHcxUE40djViUGdkVGFmVU1ld09rdDVMUmJRMEpNVDhsRkx5?=
 =?utf-8?B?TmEwSnhRSDEydEJ3K0lmSWRRWVU5LzZCcjN2Y0tWSUtKc3NIQjZvbm1rNHZV?=
 =?utf-8?B?U2FoQjViaWZoMWx1S0J1OWI0Q3VVYk91U01wTVkvN0swQlBnSGtCODM3Y2JM?=
 =?utf-8?B?aVFmNk9McER1OE56a0Y0S1ZmUHF5Y1ZIMlZCT1MzREVHKzZQOUo1SFBHTERE?=
 =?utf-8?B?WlFtcWF6VHpnazFucWFBRXJndUFFR0hpdGRJYUZlVjZvam9RZHBEV3F0ZFFr?=
 =?utf-8?B?QVVtTHZQMldjNC9HeGNJcG5hVWxFdXpzTjF5V2xaZHJxT0NTd2RqOWhYM3Er?=
 =?utf-8?B?SHNKa3M4U05ZOVF2VkxaTWpiVDJMVmtlMis1Yk5SYy9ZYjBMOWJETEhnKzli?=
 =?utf-8?B?SEFBNmNDSGRmWkJla3lIeElaa2d2TG5GSFdCZFNZSGJwQWdLWkxoeUpLdFhL?=
 =?utf-8?B?UmlXWlhtVDh4M2FtYXlMaUNLYnlTLytxcmpPZ3F1YUg4REtod2NqTWppcHN3?=
 =?utf-8?B?bnhKK3dWckplazRCNUhkM1IyejJ5aHZpZDhXWk1HOEtsVXlRZjdLbUFkWjhT?=
 =?utf-8?B?WUZub0lHMS9EQ0J6aGpqZ3lBLzdSbUpsL25KVzMvK1RDM1hoem0wdEozWk44?=
 =?utf-8?Q?RylahrvjHYCO0Aa4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97704393B24B734F8BF3F3791804AA29@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: fZH+2uFmMaEsJF3QMIDGkP5mhxXLSAEWx5+low81wWFqY/KOhTZcErviIPS6suNCD3YE3xagW6kqUWJX23WZIc42bhbto5Qak9E8wSpUihogYZbL7saPtmIySm9et3GvCeAT73gQzjY9Be103yh6OhpWMoFyPvDyZgaT8ROOxnUHu0Y0F35re1N5PV6tukfGDAkihplWKGkx0GDkmMgOrXD3ImbouQt9Eac9Pyg2uPG3r7vQiTTwS5uojKgrKL27ceZTciJ0wdfpIYFgZK1zvO2f5QBJ6URcQ8oUJ2XMEdfwQnPIQe0TFegI26gpX8t3nF1vCoJlY5wnBKvfRIzAYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b68077-1dff-4b8d-6da5-08df44f62f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2026 22:00:25.2680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntxzmLuERg+u+eLptbwX/hHVAk1JFtOzaog7IoCCyROBxSGIgr+NCJ6fgAyxXWg+HOFratkSnQIAv7J/Xdt3Iz/ZbinrtlMIPH61iwnmTx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9677
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTE3IGF0IDE4OjM2ICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gT24g
TW9uLCBOb3YgMTYsIDIwMjYgYXQgMTE6NTc6MjNQTSArMDAwMCwgRWRnZWNvbWJlLCBSaWNrIFAg
d3JvdGU6DQo+ID4gT24gVGh1LCAyMDI2LTExLTEyIGF0IDIwOjU2ICswODAwLCBYdSBZaWx1biB3
cm90ZToNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gRm9yIGVycm9ycyB0aGF0IGluZGljYXRl
IHVuY29vcGVyYXRpdmUgb3IgYnVnZ3kgaG9zdCwgd2UgZWxzZXdoZXJlDQo+ID4gPiA+ID4gPiB3
YXJuDQo+ID4gPiA+ID4gPiBpbg0KPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gVERYIHdyYXBw
ZXJzLiBCdXQgaW4gY29jbywgbm90IGhhbmRsaW5nIGFuIGVycm9yIGluIHRoZSBjYWxsZXIgY2Fu
DQo+ID4gPiA+ID4gPiBiZSBhbg0KPiA+ID4gPiA+IGF2ZW51ZQ0KPiA+ID4gPiA+ID4gdG8gYXR0
YWNrIHRoZSBndWVzdC4gU28gSSBndWVzcyB3ZSB3b3VsZCBjb21tb25seSBuZWVkIHRvIGhhbmRs
ZQ0KPiA+ID4gPiA+ID4gdGhlc2UNCj4gPiA+IA0KPiA+ID4gVGhlIHNlY3VyZSBmaXJtd2FyZSBz
aG91bGQgZ3VhcmFudGVlIHRoZSBhdHRhY2sgY2FuJ3QgaW1wYWN0IFRTTQ0KPiA+ID4gc2VjdXJp
dHkuDQo+ID4gDQo+ID4gV2UgaGFkIHNvbWUgaXNzdWVzIGluIGNvcmUgVERYIGd1ZXN0IHdoZXJl
IGlmIHRoZSBWTU0gbGllZCB0byB0aGUgZ3Vlc3QgaXQNCj4gPiBjb3VsZA0KPiA+IGNhdXNlIHNo
YXJlZCBwYWdlcyB0byBiZSByZXR1cm5lZCBwYWdlIGFsbG9jYXRvci4gRHVlIHRvIGFuIGVycm9y
IG5vdA0KPiA+IGdldHRpbmcNCj4gPiBoYW5kbGVkIHByb3Blcmx5IGluIG1hbnkgY2FsbGVycy4g
VGhpcyBsZWQgdG8gYSBkZWJhdGUgYWJvdXQgd2hldGhlciB3ZQ0KPiA+IHNob3VsZA0KPiA+IGV2
ZW4gaGFuZGxlIHRoZSBlcnJvciwgb3IganVzdCBwYW5pYyB0aGUgZ3Vlc3QgaWYgd2Ugc2VlIHdl
aXJkIHJlc3BvbnNlcw0KPiA+IGZyb20NCj4gPiB0aGUgVk1NLiBVbHRpbWF0ZWx5IHdlIHNldHRs
ZWQgb24gYSB3YXJuLCBkdWUgdG8gdGhlIGZhY2UgdGhhdCBwYW5pY19vbl93YXJuDQo+ID4gc2hv
dWxkIGJlIHNldC4gRm9yIHg4NiBjb2RlIGF0IGxlYXN0LCB3ZSBzaG91bGQgYmUgY29uc2lzdGVu
dC4NCj4gDQo+IEkgc2VlLiBJSVVDIHRoZSBwcm9ibGVtIGlzIG5vdCB0aGUgVk1NIGxpZXMgb3Ig
bm90LCBpdCBpcyB0aGUgZ3Vlc3QNCj4gaXRzZWxmIG5vdCBiZSBjb25zaXN0ZW50IGFib3V0IHRo
ZSBwYWdlIGF0dHJpYnV0ZTogVGhlIGNhbGxlciBpZ25vcmVzDQo+IHRoZSBlcnJvciBhbmQgc2Vl
IHRoZSBwYWdlIHByaXZhdGUsIGJ1dCB0aGUgZ3Vlc3QgUFRFIG1hcHMgaXQgc2hhcmUuDQo+IA0K
PiBBY3R1YWxseSB0aGUgZ3Vlc3QgY2FuJ3QgdGVsbCBpZiB0aGUgVk1NIGxpZXMgYnkgR0hDSSBy
ZXR1cm4gY29kZSwNCj4gc3VjY2VzcyBvciBmYWlsdXJlLg0KDQpFeGFjdGx5Lg0KDQo+ICBUaGUg
Z3Vlc3QgY291bGQgYWx0ZXJuYXRpdmVseSBpZ25vcmUgdGhlIHJldHVybg0KPiBjb2RlLCB1cGRh
dGUgaXRzIFBURSBhbmQgcmV0dXJuIHN1Y2Nlc3MsIGxhdGVyIHRoZSBIVyBjYW4gZ3VhcmQgdGhl
DQo+IGluY29uc2lzdGVuY3kgYmV0d2VlbiB0aGUgZ3Vlc3QncyB2aWV3IGFuZCB0aGUgcGh5c2lj
YWwgc3RhdGUgd2hlbg0KPiBhY2Nlc3NpbmcgdGhlIHBhZ2UuDQo+IA0KPiBPZiBjb3Vyc2UgdGhl
IEdIQ0kgZXJyb3IgZGV0ZWN0aW5nIGlzIHVzZWZ1bCB0byBrZWVwIHN5c3RlbSBzdGFibGUgd2hl
bg0KPiB3b3JraW5nIHdpdGggYmVuaWdoIFZNTS4gU28gSSBhZ3JlZSB0aGF0IHdlIHByb3BhZ2F0
ZSBlcnJvcnMgYW5kIGhhbmRsZQ0KPiBpbiB0aGUgY2FsbGVyIGZvciBUREkgTE9DSy9BVFRFU1RB
VElPTi9BQ0NFUFQgcGhhc2UuIEJ1dCBJIGFsc28gZmVlbCBPSw0KPiB0byB0cmVhdCBVTkxPQ0sg
YXMgYWx3YXlzIHN1Y2Nlc3MgLSB0aGUga2VybmVsIHJhcmVseSBmYWlscyBvbiBleGl0Lg0KPiBB
cyBsb25nIGFzIHRoZSBndWVzdCBkb2Vzbid0IG1lc3MgaXRzIG93biBUREkgc3RhdGUgdHJhY2tp
bmcsIHdlIGFyZSBzYWZlLg0KPiANCj4gPiANCj4gPiBTbyBpdCB3YXMgbW9yZSBhYm91dCBleHBv
c3VyZSB0byBidWdzIHRoZW4gaGlnaGVyIGxldmVsIGlzc3Vlcy4NCj4gPiANCj4gPiA+IMKgIEZv
ciBERE9TIGF0dGFjaywgdGhlIGd1ZXN0IGNvdWxkIGFsd2F5cyBtb3ZlIHRoZSBkZXZpY2UgdG8N
Cj4gPiA+IHVudHJ1c3RlZCBtb2RlLg0KPiA+IA0KPiA+IERET1MgYXR0YWNrPw0KPiANCj4gU29y
cnkgZm9yIHRoZSB0eXBvLCBEb1MgKERlbmlhbCBvZiBTZXJ2aWNlKS4NCg0KVGhhdCBpcyB3aGF0
IEkgdGhvdWdodCB5b3UgbWVhbnQuIEJ1dCBET1Mgb2YgZ3Vlc3QgYnkgdGhlIGhvc3QgaXMgbm90
IGluIHRoZQ0KY29jbyB0aHJlYXQgbW9kZWwuIFdoYXQgaXMgRE9TaW5nIHdoYXQgaGVyZT8NCg0K
