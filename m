Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795628827;
	b=Xgw79XDti3R5NadmSyhdoYqzQAhIhxDXtLLxE/cthDcHQkHCbu0nrKvoyY3F0leBWGwj
	 wBe2gbwTNFAD03WqnrCC9MaZ3MAHkPA9fyp9cU8TgHn5YT04LIFTmSA8yRuNHBL7m1GJv
	 o1OlNXHDSaSCORtv6pxirB//+4kCQUz9QedZF7hnrdC5Vl24Q9KLPkrfPOUd1sCU9r/CG
	 YZh7JTjTDNEGaLKzdDhgd1VhU0ZQ6mi7DCeIQ42NrY3OOwWQZPGRhPPGqNrEeE5Mo6Ynp
	 kTeDIrcG8cHLDhaq/w5DJwthslnjgtzaqwMwE8COgdWKwAC41VcbQXC4GKCuUlKISUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628827;
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
	bh=uXTjXc2dUg1xd+dy8ngQ1sG8owc6zUc4LGuX6+4Fm4M=;
	b=pjef2QWQJj1zhrb5duO19aO/PXlWVyZXvNnkMZA4kFb80WVdLQjuzzSFMhaoqrPnKEem
	 VqUps7grlZ7hxS76cuwpnPR07EpdgTj3VQp78PgBpvBM+ErF17Yz5zeN/6CUDg0f3mLNK
	 O3MPueA3TBfOsgHdNvLC9X0a/FAUb518QFhKLWYpxA/8o8o9owIMVbKclRE2mPd/KIes7
	 H7+LZKtvAagcJkbddqnTXLrST6bSdIAhAfTZ6aGeBYq/1rZYfZw/n8C85LnXLx0FsQcur
	 kaJmwdQUi97WqymsmXcbsy8bGPT0X/8wu4hYY+1fLPYrIpIL7I5ia9R6KMUWhbZ0e3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPSIo+w5;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KGFuAVs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD007606A323
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 17:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD007606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jPSIo+w5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KGFuAVs6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795628826; x=1827164826;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uXTjXc2dUg1xd+dy8ngQ1sG8owc6zUc4LGuX6+4Fm4M=;
  b=jPSIo+w5KFzRw1TQF/KwUe+DW6LpgGmzsNPsWURDhb1KlszjolabkgcZ
   NS+DewVXfqckzmQ9CqpzAdY4/uvoNDz3EBPm9/UVBxu2nOJAmVIFyf/6r
   OrjSL2+2qnlR15ZPwKfAMZiGhiRyYqB5XZwAAGCe1c76Sb6XRMQ0DZ+9V
   Opyt5cCiKCWAPpYc/DWGJpkeH/UCsVN8u+8GFVTawfxIlcPRDtbtjtYu3
   HnEHeZLhsovHh6J9UU6G6XYcU7NLg8fgsEHskZCXWkPdXwg5Pglz3pT3m
   +fZOUq1uz0kT0YhSLrpLOdehFMKivhQMvW5d4I6JiiEFFDNqWRmksB7JS
   w==;
X-CSE-ConnectionGUID: KVTe+hiwQQ2DXqpY9diybQ==
X-CSE-MsgGUID: zF39EfMlSauysC4GpIN/9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4410365"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4410365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:47:05 -0800
X-CSE-ConnectionGUID: QLvc6rkXRD+RBH6DUE/CHw==
X-CSE-MsgGUID: Qn1Si1C+SSiR2LvaCCEcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11934826"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:47:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:47:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 09:47:04 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 09:47:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkwfPbKrdm8snBihsYOVkbCY0QPjJABZbpa/dL4hzT3OIKCF7zXqEBGZqhsnm+evcgpOjsYDkD2HjCCl+5P9PqKIrWzVTtUXAaRzig805S3NNwa1oMasNjCPb5NDOo4ImaRg8KUnNFuVdYxX+kWTRJM201m1bRbNjrCShCtAkJGGWNPLAteSQH7+NnH6TxJs0sVaLB9lSsdahY66kq2GlkJA08V8eSqS4GvhSiI/MbReRZ6EPpzgSuMOk/Ps7sIYzl38q+JzKUHkCvotJEDciOPD3TRk+AIqjG4GHAH5E6hc7ROjc5l624cnxvynXUFnZVPlpWYnvicCX4cw3+KZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXTjXc2dUg1xd+dy8ngQ1sG8owc6zUc4LGuX6+4Fm4M=;
 b=QD8qSAeQLgS8KvjP9nfhr/Cl4l42ciUib2B4CBYhmpzxUgpLxrVDh364DSucTcGWdxzN2weS01T5iEQ8ummsc12GDV5vLqdcWlETsfJ8DrLqTFfF2hyggGE1VdoJwFqV7aBb/C8scU6fKLwCzSGpTsjzCIq4BO2sqifj/TaxRsBVClezhNEgwUXV+yTd4OtEbabbdoexnPbRWzEuBYrBpyvZrDJVSvgN4UGTj7CAgMDS0uQ9OVvJkACb45TusNu0v91WQthQ1PKaBnXik5GYq//AT67iUFlA5RqaOHLn8KThu7XhwaF+TJm4yNIGc0290EbMrtYvyXDkSccTWLPtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXTjXc2dUg1xd+dy8ngQ1sG8owc6zUc4LGuX6+4Fm4M=;
 b=KGFuAVs6GDtq1ZDx5qXpilPkPC9veirQjAw14J+HjMTqJhXZ4SdqfH1M4LeObm6VRV0zEm8q5tjeT6tkUG5BpFriHgD/nQREGj1DsjUuzSrVZF0mYWSlIi43ZOYafkFXLO1M4fqoCNAb9HUnzYNz6wlU8SoEJMQ/YWYAdEFKUcQ=
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by BL1PR11MB5239.namprd11.prod.outlook.com
 (2603:10b6:208:31a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 17:47:01 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:47:01 +0000
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
Subject: Re: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Topic: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Index: AQHdS9qwc0OagGwQfkqUpDLO231Klbc9GswAgADlJoCAANdTAIAAmviA
Date: Wed, 25 Nov 2026 17:47:01 +0000
Message-ID: <244d504ddfefd2c2bfc17da62f71685dc8b4205c.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
	 <8acf514600526e3a2b0af151b0fa8a7b7a779c81.camel@intel.com>
	 <5b6837a8-f8bc-4e7f-8419-01853eecd531@intel.com>
In-Reply-To: <5b6837a8-f8bc-4e7f-8419-01853eecd531@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|BL1PR11MB5239:EE_
x-ms-office365-filtering-correlation-id: af079cfc-5b1f-4640-7b37-08df4b1c1c4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|4143699003|261009223027099003|18002099003|22082099003|3023799007|261022075727099003|10067099003|261102123227099003|56012099006|5023799004|11063799006|261102124527099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|38070700021|261021121427099003;
x-microsoft-antispam-message-info: vuQuC2d2+3yAKj1I3TmROW/mTsqlGroM/PRJWmN6cVo+u9rUlbj0oMQHfuqK47iM9jQ1fqDr02DDGoeGW9SFqDQbevozvlozBZ5NN/hUBrvsfRuYD9eQ6G+9gZVwHrR1Ehu1CbcayhwuNJBAnuWYlWcSXRKEJywY+fbgXMLhd3b7eON2kXaUxOt10PPzffotSndtB6NW1ZoxD25uknMAy//9BPQePPQK4Q782G5o31TDYsYqjv1I54Gp1hRdXPbX1fjZ00+xZGb3hmIdbkXDiAV/KMxML45h5LPFC/Mcl53vh4CMNXXjt7WU+3UEGGP5POhkJH66XHtZln3nhJZ2hRdiAonGd0QbPAxrJB553kupEmnMRhcV9WFJV4O+i6f1X6IkC4j482Ub3joSc3MPi3grNskvVQoQSN6EiLROCBzKot3jj2NLtyZDdE9+9Gr1jZe0A4EsuFWnwktGNy5PJTCVEW/NJIXMcrmhGlbZ5slisPziDSWbIskLGz3rTTHt8tbR39i9W9dcmQPEwjAYvTeZLWCVJk/qFtV6F3kDmPvY7GMDxr83miSXjedxgHwvVI9TYR5vxDnFyk6qh6Y/YwrMmEi/PXQTHaQlBd76IcwME52iK8DH75boGgyNe3QHJzGIK5PMIBCwBICGub2B6DH6pQ7gbvsln7sXdyi2MiwHDk9lKkGNnnsyU55dPrwCbjNAOefpecAFc0rfvl7POoMxRcKIbR/4u5JZKwfSGrc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(4143699003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261022075727099003)(10067099003)(261102123227099003)(56012099006)(5023799004)(11063799006)(261102124527099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(38070700021)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkNxU0ZLaTBjNEY3WkxlWDlFZnpjNDFacjk5RjJNMVN2OVIrUUUvc3pUMzVB?=
 =?utf-8?B?bGlsMDk3TmtqdUE4WUEvMDAzZkZBeDM3YkVvYThzK3kxQWdCT3UxdnJObm9Q?=
 =?utf-8?B?b0NzZEZXYkE2Z1E1WEg5S09PRHZkRHpXVzVTeGpybExNWHU5MlZLdXdpcHFo?=
 =?utf-8?B?ams0WE8rYTZhdTFVZmdtVDBzK1hGV2lDb1VFVCtZSElsZzVzbFpxRUdKOWE2?=
 =?utf-8?B?a2pqYVh3NHh3RlZRdHVsTU1xT1N4ek5KV2xjNVhaQVFJOGlZOTA4dkI2aVh1?=
 =?utf-8?B?YmhaUENiRmFVbnFYclpjV3VkWXNpRkY1dGJxZ05iVzlnOXU0T09Vei9STld3?=
 =?utf-8?B?SWszYXJoNndxb0dtV2NkakdiYjQ5OEFReXFpd01PZXZGajBDNlU2czBodGE5?=
 =?utf-8?B?WXJLZDZzMDhrNlQ1Mlkxb2xtZjh2Nk10K1ltVlM4UWZINXJ3YVhXWDdsWmdC?=
 =?utf-8?B?ZnpqV3lEZ2t6S3dlOERiZ3owUW04bktGQzVKUXd6c1AxWXdKaTNPTmJFdzFI?=
 =?utf-8?B?UEFOZjlmWDZZS0JRZ3NnQzErVld1bmdnakJWM2FrN1IwRUJPT2s1WDNKY1F0?=
 =?utf-8?B?T3cxUUM2bEVaY05uR0RCMnBueUR4SFlTWm14ZDVydkVTZ2lkQ0tzS0FuNC9m?=
 =?utf-8?B?TFYrOWtLZ1F3OHRGQjkyRytNZ3htRTJQc1BLRHZ4eDNVVHNiM1Y3WTd1VkZj?=
 =?utf-8?B?ZCtRR0s4ZXZ0cExGY09VTDVORXNETXRzQkJRQ2tnNlBYeXN4UTVGazRDWmRp?=
 =?utf-8?B?UzVnUFYxRXpYQTBseGhJdHBBZk9PU2Z3cUcvNGN6UXI5ZUkzNUNVdStFdUZT?=
 =?utf-8?B?MUZpZnpPTnV3dElOMzU5K2JyL3ljY2txZ3hIUzBmajVvazBnUnRGd1FIdUdT?=
 =?utf-8?B?Rkt1bXdpd3lScGJub0YrNisxQ3M0L0ZlTVluKzhJRkdKRUIwWjJ6dGtyUmli?=
 =?utf-8?B?eSt1a0lVVDg0dEZqKzg1Q0hHaTBvQ1VOU0tOUXhyY0c4eGV2S1BsdnhXWHo5?=
 =?utf-8?B?bEZWS1B2YVZieGRhVUg2T2phV2VYRmROYUhlUE5Ja3ZyU3ZkMDVGaWxJc2l6?=
 =?utf-8?B?QWJDc21YSm51Z2J3T3NYYzJEVTA5c09RRkJLMCtvaFRSdG5XeDdMcFNjeEdr?=
 =?utf-8?B?U0gxTHAxTHhOdkdGcFF5YkxsWGJvazdmMHhQWjMrWHRRUWNYUUdqOTNvcWg0?=
 =?utf-8?B?MVJqa1pVM0hXcHRhY3pNYVlFQU5BVTZnYURxT25kb2syYUlVeTB6a3lIRUQx?=
 =?utf-8?B?ZnB4SElENFBFbW9HWlhxc3dXdUdFWC9CVUNTbS9yQk5lYXd6UVRoblZwc1Zr?=
 =?utf-8?B?bDZRQUttUGZBV0ZJMG9mRWwwai9menhNQ3BMN0tkbzZUQ2h4aXprL3ZRWkVm?=
 =?utf-8?B?dFhjMUFmKzVrUXRENlowR0FsTFJnR28yaThFVVdTbWs2TFIrMXg4ODNvc21y?=
 =?utf-8?B?bmJHWmQxMGFlaTJ4aTNJTlpLYWI1My90QVBqVFBGUjA5bDZlcTA3SUJQTU1J?=
 =?utf-8?B?QlZQNUZURzN6cTJVSU8wTkl5V25BSU51YlViVUxnSi9IdzZaSmZyYUFDYndY?=
 =?utf-8?B?RE1jTkRrVG55Q1owY21Wb3JBM0lLd1VmYzV4bVN4YytIZGxUTDVFNFVDVzB5?=
 =?utf-8?B?UUxUeUEwdktKRHBKN3pnbWdsVXVHcEtETnp4VkR5b3FRZ3BnaXlNUkRWR3dv?=
 =?utf-8?B?N1BMT01ZQ3haeThYNXByaUdmYk5ZbmpVK2ZpT0hDTncwUWx0UFEvY0trd25u?=
 =?utf-8?B?dTdrZXZLczB1WVd3d3pFWGlOaXp5WThJWnZnKzNGWEpuNVB1ZE0vMG5IaGhE?=
 =?utf-8?B?cjlrUkZGRU5XZlMvSFNubldxSHMyajZGWHhzK3Z3QjZSdjI2OG82aEJpNUhV?=
 =?utf-8?B?QmVhbUpmRkxhWWM4dkNoMVo1TGpJK3ZhaS9UWmJrZGx6OUx0YklpZzdGQ3pr?=
 =?utf-8?B?c3RKUU8zbU9keGpSYmkxdzNZS0s5N01LUTR5L3VjNW5BeGI3dHRFSlpBWjAy?=
 =?utf-8?B?aTVJZXdSN003bWdyejV3MkZ5b1F1c3c0djltclpValdaS0ozc3lpMCtjaEhq?=
 =?utf-8?B?enBjSCtPN3RNVE85bXRQbklrZCs3MXo2UTZocHN0bWFLSGdZd0NSdnFxN0Y0?=
 =?utf-8?B?TXM1WEw5S2RrWVp5ZGNRNk5wRFFVd0FPWlU2MEZ3OUpUZG9JM0Ivd1RaTGdN?=
 =?utf-8?B?Q09VN1FaMGlnT1htK1dGNlBJaGhTdkMxQ2dRemJtYmM2OXFIYnlIbHFtTHMr?=
 =?utf-8?B?b2RGQ1A2aGYyYTFpQUtkeUswUkphYTA5UnpkaFhHU3JtM1ROcmVGbzNZOXNP?=
 =?utf-8?B?bWNHQjlPejNNTWk1dXRyaGlxbldKdjRHMjk1SEdPUk12RHdOUkRnL1FUdGpW?=
 =?utf-8?Q?dgVstYmDQuAiosSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <129AE94F7576194BB4A56D775056BF25@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: obPdBodN4TWuOo4yyf+Rfh9rwjod3ed2QXhfeQHUUCt5KZpZcwWmKP2jR+28nWdekgHsXTzAzzg1CeXuBL0F65/eWR01VkwHHso9OW5HAnny/6h56tjkDcUQjLvOkOEqiVLjocaypflCqMjlk41F8Z0GEeqpM5qZtixmlTB7hEMB92todC6UN/LKxGOmiMn2GcQ7hclI7odEGZJjryJPfGAu/vZF/mJ5Ozlw4rkRXWWFOVdbJziz3w0FbvziZgUMCQv4+aELvuJl19NNXM2751ZOwuDBPgal6suw8UCFJSBghvbaq3arkixlLMo2o6PMmJoylpXouk9JISec4nrqjQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af079cfc-5b1f-4640-7b37-08df4b1c1c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 17:47:01.5466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a5zuLWFORbDAAKSNSZUaZzhDowzE8h+dwVPt7M1MHSyQBG/qqJNjmRQmZrOZo5IQWRzXbF/le9/6dAIamZV2md99Rr1XwdUy8yPR3IStXDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTI1IGF0IDE2OjMyICswODAwLCBYaWFveWFvIExpIHdyb3RlOg0KPiBP
biAxMS8yNS8yMDI2IDM6NDEgQU0sIEVkZ2Vjb21iZSwgUmljayBQIHdyb3RlOg0KPiA+IE9uIFR1
ZSwgMjAyNi0xMS0yNCBhdCAxNDowMSArMDgwMCwgWGlhb3lhbyBMaSB3cm90ZToNCj4gPiA+IDEu
IFRoZSByZXF1aXJlbWVudCBvZiBSOC1SMTUgYXJlIHJlc2VydmVkIHRvIDAgb24gVERHLkRNQVIu
QUNDRVBULg0KPiA+ID4gDQo+ID4gPiDCoMKgIFRoaXMgaXMgdGhlIGZpcnN0IGxlYWYgaW4gVERD
QUxML1NFQU1DQUxMIHRoYXQgZXhwbGljaXRseSByZXF1aXJlcyBzb21lDQo+ID4gPiDCoMKgIHVu
dXNlZMKgIHJlZ2lzdGVycyB0byBiZSAwLiBXaXRob3V0IGp1c3RpZmljYXRpb24gb2Ygd2h5IGl0
IG11c3QgdG8gYmUNCj4gPiA+IHN1Y2gsDQo+ID4gPiDCoMKgIHdlIGFyZSBnb2luZyB0byBwcm9w
b3NlIHRvIHJlbW92ZSB0aGlzIHJlcXVpcmVtZW50IGFuZCBpdCBoZWxwcyBkcm9wDQo+ID4gPiB0
aGUNCj4gPiA+IMKgwqAgUEFUQ0ggMTMuDQo+ID4gDQo+ID4gQWgsIG9rIHNvIHRoZSBwcm9ibGVt
IGlzIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRob3NlIHJlZ2lzdGVycyBhcmUgc2F2ZWQgaW4NCj4g
PiB0aGUNCj4gPiB3cmFwcGVyLCBpZiB3ZSB3aWxsIHNldCB0aGVtIHRvIDAgYmVmb3JlIFNFQU1D
QUxMLiBTbyB0aGUgc2VhbWNhbGwgY29kZQ0KPiA+IGRvZXNuJ3QNCj4gPiBjbG9iYmVyIHRoZSBj
YWxsZXJzIHJlZ2lzdGVycy4NCj4gPiANCj4gPiBCdXQgSSB0ZW5kIHRvIHRoaW5rIGFuIEFCSSBy
ZWplY3RpbmcgcmVzZXJ2ZWQgaW5wdXQgaXMgYSBnZW5lcmFsIGdvb2QgdGhpbmcuDQo+ID4gU2lu
Y2UgU0VBTUNBTExzIGFyZSBub3QgZmFzdCwgSSB3b25kZXIgd2h5IGNhcmUgYWJvdXQgb3B0aW1p
emluZyB0aGUNCj4gPiB3cmFwcGVycyB0bw0KPiA+IHNhdmUgYW5kIHJlc3RvcmUgdGhlIG1pbmlt
dW0uIElmIHdlIGp1c3QgYWx3YXlzIHNhdmVkIGFuZCByZXN0b3JlZCB0aGUNCj4gPiBnZW5lcmFs
DQo+ID4gcHVycG9zZSByZWdpc3RlcnMsIHdlIHdvdWxkbid0IG5lZWQgc28gbWFueSB3cmFwcGVy
cy4gQW5kIHRoZW4gd2hlbiBURFgNCj4gPiBtb2R1bGUNCj4gPiB3YW50ZWQgdG8gYWRkIG5ldyBT
RUFNQ0FMTCBBQkkgd2Ugd291bGRuJ3QgbmVlZCB0byBkbyB0aGUgd2hvbGUgdmVyc2lvbg0KPiA+
IHNlbGVjdGlvbiB0aGluZy4gSnVzdCBwYXNzIGEgbmV3IGJpdCBvciB3aGF0ZXZlci4gDQo+IA0K
PiBTbyB3ZSByZXNlcnZlIHRoZSB1bnVzZWQgcmVnaXN0ZXJzIGFzIDAuIFdoZW4gbmV3IFNFTUFD
QUxMIEFCSSBpcyBnb2luZyB0byBiZQ0KPiBhZGRlZCwganVzdCBkaXJlY3RseSBleHRlbmQgdGhl
IHJlc2VydmVkIHJlZ2lzdGVycyBhbmQgYWxsb3cgdGhlbSB0byBiZQ0KPiBub24temVyby4NCj4g
DQo+IFRoaXMgaW1wbGllcyB0aGF0IHZhbHVlIDAgYmVjb21lcyB0aGUgQUJJIGluZGljYXRvciwg
b3IgdmFsdWUgMCByZXByZXNlbnRzIHRoZQ0KPiBvbGQgYmVoYXZpb3IgaW4gdGhlIG5ldyBBQkku
IEhvd2V2ZXIsIHRoaXMgc2ltcGx5IGRvZXNuJ3Qgd29yayBmb3INCj4gVERILlZQLklOSVQsDQo+
IGFzIHRoZSB2ZXJzaW9uIDEgb2YgVERILlZQLklOSVQgZXh0ZW5kcyBiaXRbMzE6MF0gb2YgUjgg
dG8gYmUgdGhlICdYMkFQSUNfSUQnLA0KPiB3aGVyZSB2YWx1ZSAwIGlzIGEgdmFsaWQgdmFsdWUg
YW5kIGNhbm5vdCByZXByZXNlbnQgdGhlIG9sZCBiZWhhdmlvci4NCg0KVHJ1ZSBpdCBjYW4ndCBh
bHdheXMgd29yaywgd2l0aG91dCBzb21lIHJlc2VydmVkIGJpdCBiZWNvbWluZyBhIHNlbGVjdG9y
LiBJbiB0aGUNCmNhc2Ugb2Ygc2VhbWNhbGxzIHRoYXQgaXMgYmFzaWNhbGx5IHRoZSBzZWFtY2Fs
bCB2ZXJzaW9uIHRoaW5nLg0KDQo+IA0KPiA+IFRoYXQgd291bGQgaGF2ZSBzaW1wbGlmaWVkIHRo
ZQ0KPiA+IFRESC5TWVMuQ09ORklHIGNoYW5nZXMgZm9yIERQQU1UIGFuZCBhZGQtb25zLg0KPiAN
Cj4gSXQgd29ya3MgZm9yIFRESC5TWVMuQ09ORklHLCBiZWNhdXNlDQo+IA0KPiDCoCBSOFsxNl0g
PSAwwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVhbnMgU3RhdGljIFBBTVQNCj4gwqAgUjkgPSAwIGFu
ZCBSMTAgPSAwwqDCoCBtZWFucyBlbmFibGUgbm8gYWRkLW9uIGZlYXR1cmUNCg0KSSdtIG1ha2lu
ZyBzb21lIGd1ZXNzIHdvcmsgaGVyZSBiZWNhdXNlIEkgZG9udCBhY3R1YWxseSBrbm93IHRoZSBo
aXN0b3J5Li4uDQoNCkkgYXNzdW1lIHRoYXQgc2luY2UgcjggYWxyZWFkeSBoYWQgc29tZSBiaXRz
IGluIHVzZSwgVERYIGNvdWxkIGp1c3QgZGVmaW5lIG5ldw0KYml0cyBpbiB0aGUgcmVnaXN0ZXIu
IEJ1dCB0aGVuIFREWCBleHRlbnNpb25zIHdhbnRlZCB0byBtYXRjaCB0aGUgZXh0ZW5zaW9uIGJp
dHMNCnNlbWFudGljcyBpbiB0aGUgcmVnaXN0ZXIsIGFuZCBzbyBuZWVkZWQgYSBuZXcgcmVnaXN0
ZXIuIFdoaWNoIHRoZW4gcmVxdWlyZWQgYQ0KdmVyc2lvbiBzZWxlY3RvciBpbiBjYXNlIHNvbWUg
Vk1NIHdhcyBwYXNzaW5nIGdhcmJhZ2UgaW4gdGhlIHJlZ2lzdGVyLiBJbnN0ZWFkDQp3ZSBjb3Vs
ZCBoYXZlIGhhZCBvbmUgcmVnaXN0ZXIgdGhhdCBoYWQgYWxsIHRoZSBleHRyYSBURFggbW9kdWxl
IGZlYXR1cmVzLg0KDQo+IA0KPiB3aGVyZSB2YWx1ZSAwIG1lYW5zIHRoZSBvbGQgYmVoYXZpb3Iu
DQo+IA0KPiA+IFNvIEknbSB0aGlua2luZyB0aGF0IG9sZCBzZWFtY2FsbHMgd2VyZSBtYXliZSBp
bmNvcnJlY3QgYW5kIHRoaXMgbmV3IHdheSBpcw0KPiA+IGNvcnJlY3QuIFllcyB3ZSB3b3VsZCBu
ZWVkIGEgbmV3IHBhdGNoLCBidXQgd2hhdCBpZiBpdCB3YXMgYSBzaW1wbGljYXRpb24NCj4gPiBw
YXRjaA0KPiA+IHRoYXQgZ290IHJpZCBvZiBhbGwgdGhlIHNlYW1jYWxsIHZhcmlhbnRzIGFuZCBq
dXN0IGFsd2F5cyBzYXZlZC9yZXN0b3JlZD8NCj4gPiBDb25zaWRlciB0aG9zZSBwcmVtYXR1cmUg
b3B0aW1pemF0aW9uLiBBbnkgcHJvYmxlbXM/DQo+IA0KPiBJIGFncmVlIGFuIGFsd2F5cyB1bmlm
aWVkIHNhdmVkL3Jlc3RvcmVkIGhlbHBlciBpcyBhIGdvb2QgdGhpbmcgaWYgdGhlDQo+IGFkZGl0
aW9uYWwgb3ZlcmhlYWQgaXMgbm90IGEgY29uY2Vybi4NCg0KSSB0aGluayBzYXZpbmcgYW5kIHJl
c3RvcmluZyBnZW5lcmFsIHB1cnBvc2UgcmVnaXN0ZXJzIGFjcm9zcyBhIHNlYW1jYWxsIHdvdWxk
DQpub3QgYmUgYSBiaWcgb3ZlcmhlYWQgZ2l2ZW4gdGhlIGFtb3VudCBvZiBvdGhlciB3b3JrIGhh
cHBlbmluZyBkdXJpbmcgYQ0Kc2VhbWNhbGwuIFByb2JhYmx5IHNtYWxsIGVub3VnaCB0aGF0IHdl
IGNvdWxkIG5vdCBldmVuIGhhdmUgdG8gbWVhc3VyZSBpdCB0bw0KbWFrZSB0aGUgY2FzZSBmb3Ig
dGhlIHBhdGNoLiBBbnkgY291bnRlciBwb2ludHM/DQoNCj4gIEJ1dCBhcyBjb21tZW50ZWQgYWJv
dmUsIHJlc2VydmUgdGhlIHVudXNlZA0KPiByZWdpc3RlcnMgdG8gMCBkb2Vzbid0IGxvb2sgdG8g
bWFrZSB0aGUgU0VBTUNBTC9URENBTEwgQUJJIGV4dGVuc2lvbiBlYXNpZXIuDQo+IA0KPiA+ID4g
DQo+ID4gPiAyLiBBZGQgJ1RESScgdG8gdGhlIG5hbWVzIG9mIFRERy5ETUFSLkFDQ0VQVCBhbmQg
VERHLkRNQVIuUkVMRUFTRSBhbmQNCj4gPiA+IG1heWJlDQo+ID4gPiDCoMKgIHJlbmFtZSAnRE1S
QScgdG8gJ0RNQScNCj4gPiA+IA0KPiA+ID4gwqDCoCBUREcuTU1JTy5BQ0NFUFQgaGFzIGFscmVh
ZHkgYmVlbiByZW5hbWVkIHRvIFRERy5UREkuTU1JTy5BQ0NFUFQgaW4gdGhlDQo+ID4gPiBsYXRl
c3QNCj4gPiA+IMKgwqAgcHVibGljIFREWCBDb25uZWN0IEFQSSBzcGVjLCB0byBjYWxsIG91dCBp
dHMgc2NvcGUgaXMgVERJLiBJdCdzIGJldHRlcg0KPiA+ID4gdG8NCj4gPiA+IMKgwqAgYWRkICdU
REknIHRvIFRERy5ETVJBLiogYXMgd2VsbCB0byBtYWtlIHRoZW0gY29uc2lzdGVudCBzaW5jZQ0K
PiA+ID4gVERHLkRNQVIuKiBhbHNvDQo+ID4gPiDCoMKgIG9wZXJhdGUgb24gVERJIHNjb3BlLg0K
PiA+ID4gDQo+ID4gPiDCoMKgIEJlc2lkZXMsIERNQVIgbWVhbnMgIkRNQSBSZW1hcHBpbmciLCB3
aGljaCBpcyBhbiBJT01NVSBjYXBhYmlsaXR5Lg0KPiA+ID4gV2l0aG91dCBhDQo+ID4gPiDCoMKg
IHZpcnR1YWwgSU9NTVUgZm9yIGd1ZXN0LCB0aGUgZ3Vlc3Qgc2hvdWxkIGp1c3QgY2FyZSBhYm91
dCB0aGUgRE1BDQo+ID4gPiBjYXBhYmlsaXR5Lg0KPiA+ID4gwqDCoCBTbyBpdCBsb29rcyBETUEg
aXMgbW9yZSBhY2N1cmF0ZSB0aGFuIERNQVIuDQo+ID4gDQo+ID4gT2suDQo+ID4gDQo+ID4gPiAN
Cj4gPiA+IDMuIFRERy5UREkuTU1JTy5BQ0NFUFQgcmVxdWlyZXMgVERJIHRvIGJlIGluIHRoZSBB
U1NJR05FRC9BQ0NFUFRFRC9SVU4NCj4gPiA+IHN0YXRlLg0KPiA+ID4gwqDCoCBBZnRlciBUREkg
aXMgYm91bmQgYnkgaG9zdCB2aWEgVERILlRESS5CSU5ELCB0aGUgc3RhdGUgaXMgQk9VTkQuIEl0
DQo+ID4gPiByZXF1aXJlcw0KPiA+ID4gwqDCoCBndWVzdCB0byBjYWxsIFRERy5UREkuUkQgcmVh
ZCB0aGUgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQsIHdoaWNoDQo+ID4gPiBjaGFuZ2VzIFRESQ0K
PiA+ID4gwqDCoCBmcm9tIEJPVU5EIHN0YXRlIHRvIEFTU0lHTkVELg0KPiA+ID4gDQo+ID4gPiDC
oMKgIFRoaXMgaXMgYSBoYXJkIGRlcGVuZGVuY3kgZm9yIFRERy5UREkuTU1JTy5BQ0NFUFQgbm90
IHRvIGZhaWwgYW5kIGl0J3MNCj4gPiA+IG5vdA0KPiA+ID4gwqDCoCBtZW50aW9uZWQgaW4gcGF0
Y2ggMTIgd2hlcmUgdGhlIGNhbGwgdG8gcmVhZCBURElfR0VUX0JJTkRfU0VTU0lPTl9JRCBpcw0K
PiA+ID4gwqDCoCBhZGRlZC4NCj4gPiA+IA0KPiA+ID4gwqDCoCBUaGUgU0VTU0lPTl9JRCBpcyB1
c2VkIHRvIGVuc3VyZSB0aGUgaG9zdCBkb2Vzbid0IGJpbmQgYSBuZXcgVERJIGFmdGVyDQo+ID4g
PiDCoMKgIGd1ZXN0IGF0dGVzdHMgdGhlIFRESSB3aXRob3V0IGd1ZXN0J3MgYXdhcmVuZXNzIGJl
Y2F1c2UgdGhlIFNFU1NJT05fSUQNCj4gPiA+IGlzDQo+ID4gPiDCoMKgIHZlcmlmaWVkIGluIHRo
ZSBmb2xsb3dpbmcgVERHLlRESS5TVEFSVC4gQW5kIG1ha2luZyB0aGUgcmVhZCBvZg0KPiA+ID4g
wqDCoCBURElfR0VUX0JJTkRfU0VTU0lPTl9JRCB0byBjaGFuZ2UgdGhlIHN0YXRlIG1hY2hpbmUg
b2YgVERJIGZyb20gQk9VTkQNCj4gPiA+IHRvDQo+ID4gPiDCoMKgIEFTU0lHTkVELCBtYWtlIGl0
IG1hbmRhdG9yeSBmb3IgdGhlIGltcGxlbWVudGF0aW9uLg0KPiA+ID4gDQo+ID4gPiDCoMKgIEJ1
dCBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gYXNzaWduIGFkZGl0aW9uYWwgc2VtYW50aWMgdG8g
YSBtZXRhZGF0YQ0KPiA+ID4gcmVhZGluZw0KPiA+ID4gwqDCoCBiZWhhdmlvciBpbiBhIHNwZWNp
ZmljIHBoYXNlLiBJbnN0ZWFkLCB3ZSB3YW50IHRvIHByb3Bvc2UgaW50cm9kdWNpbmcgYQ0KPiA+
ID4gbmV3DQo+ID4gPiDCoMKgIGRlZGljYXRlZCBUREcgY2FsbCwgZS5nLiwgVERHLlRESS5MT0NL
LCB3aGljaCBuZWVkcyB0byBiZSBjYWxsZWQgYnkgdGhlDQo+ID4gPiBndWVzdA0KPiA+ID4gwqDC
oCB0byBsb2NrIHRoZSBUREkgYWZ0ZXIgaXQncyBib3VuZCBieSB0aGUgaG9zdCwgYW5kIGl0IHJl
dHVybnMNCj4gPiA+IMKgwqAgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQgb24gc3VjY2Vzcy4NCj4g
PiANCj4gPiBZZXAuDQo+ID4gDQo+ID4gPiANCj4gPiA+IDQuIFREWF9QQUdFX0FMUkVBRFlfQUND
RVBURUQgaXMgbGlzdGVkIGFzIHRoZSBwb3NzaWJsZSByZXR1cm4gY29kZSBmb3INCj4gPiA+IMKg
wqAgVERHLlRESS5NTUlPLkFDQ0VQVCB3aGlsZSB0aGUgZGVzY3JpcHRpb24gb2YgVERHLlRESS5N
TUlPLkFDQ0VQVCByZWFkczoNCj4gPiA+IA0KPiA+ID4gwqDCoMKgwqAgSWYgdGhlIHBhZ2UgaXMg
YWxyZWFkeSBNTUlPX01BUFBFRCwgc2tpcCB0aGUgcGFnZS4NCj4gPiA+IA0KPiA+ID4gwqDCoCBU
aGV5IGNvbmZsaWN0IHdpdGggZWFjaCBvdGhlciBhbmQgbGVhZCB0byBjb25mdXNpb24uDQo+ID4g
DQo+ID4gSSdkIHRoaW5rIGlmIHRoZSBwYWdlIHNpemUgaXMgaW5jb3JyZWN0IGl0IHNob3VsZCBy
ZXR1cm4NCj4gPiBURFhfTU1JT19BQ0NFUFRfU0laRV9NSVNNQVRDSC4gSWYgaXQgaXMgYWxyZWFk
eSBhY2NlcHRlZCBpdCBzaG91bGQgcmV0dXJuDQo+ID4gVERYX1BBR0VfQUxSRUFEWV9BQ0NFUFRF
RC4gSW4gdGhlIGNhc2Ugb2YgbWlzbWF0Y2hlZCBzaXplIGJ1dCBhbHJlYWR5DQo+ID4gYWNjZXB0
ZWQNCj4gPiBwYWdlLCBpZGVhbGx5IGl0IHdvdWxkIHJldHVybiBURFhfUEFHRV9BTFJFQURZX0FD
Q0VQVEVELCBidXQgaXQgd291bGQgYmUgb2sNCj4gPiBpZg0KPiA+IGl0IHJldHVybnMgVERYX01N
SU9fQUNDRVBUX1NJWkVfTUlTTUFUQ0guDQo+IA0KPiBGb3IgcHJpdmF0ZSBtZW1vcnkgYWNjZXB0
LCBpZiB0aGUgbWFwcGluZyBpcyBub3QgYWNjZXB0ZWQgYnkgdGhlIGd1ZXN0IHlldDoNCj4gDQo+
IMKgLSB3aGVuIGFjY2VwdCBsZXZlbCA+IG1hcHBlZCBsZXZlbCwgU0laRV9NSVNNQVRDSCBpcyBy
ZXR1cm5lZCBzbyB0aGF0IGd1ZXN0DQo+IGNhbg0KPiDCoMKgIHRyeSBhY2NlcHRpbmcgYXQgYSBs
b3dlciBsZXZlbC4NCj4gDQo+IMKgwqAgVERYX01NSU9fQUNDRVBUX1NJWkVfTUlTTUFUQ0ggaXMg
YWxzbyByZXR1cm5lZCBmb3IgTU1JTyBpbiBzdWNoIGNhc2UuIFRoZXkNCj4gwqDCoCBhcmUgY29u
c2lzdGVudC4NCj4gDQo+IMKgLSB3aGVuIGFjY2VwdCBsZXZlbCA8IG1hcHBlZCBsZXZlbCwgRVBU
IHZpb2xhdGlvbiBoYXBwZW5zIHNvIHRoYXQgaG9zdCBjYW4NCj4gwqDCoCBkZW1vdGUgdGhlIG1h
cHBpbmcuDQo+IA0KPiDCoMKgIFRoZXJlIGlzIG5vIGJlaGF2aW9yIGRlZmluZWQgZm9yIHN1Y2gg
Y2FzZS4gQnV0IEkgdGhpbmsgdGhlIHJlYXNvbmFibGUNCj4gb3B0aW9uDQo+IMKgwqAgaXMgYWxz
byB0byBFUFQgdmlvbGF0aW9uIHRvIHRoZSBob3N0IHRvIHJlcXVlc3QgdGhlIGhvc3QgbWFwcyBh
dCBsb3dlcg0KPiBsZXZlbC4NCj4gwqDCoCBGb3JjaW5nIHRoZSBndWVzdCB0byBhIGhpZ2hlciBs
ZXZlbCBkb2Vzbid0IHNvdW5kIHJlYXNvbmFibGUgYmVjYXVzZSB0aGUNCj4gwqDCoCBndWVzdCBt
aWdodCBub3Qgd2FudCB0aGUgd2hvbGUgcmFuZ2Ugb2YgMk0gTU1JTyBpcyBhY2Nlc3NpYmxlIGJ5
IHRoZQ0KPiBkcml2ZXIuDQo+IA0KPiBSZWdhcmRpbmcgQUxSRUFEWV9BQ0NFUFQsIHdlIG5lZWQg
aXQgZm9yIHByaXZhdGUgbWVtb3J5IGJlY2F1c2UgYSBzdWNjZXNzZnVsDQo+IGFjY2VwdGFuY2Ug
b2YgcHJpdmF0ZSBtZW1vcnkgd2lsbCBjbGVhciB0aGUgY29udGVudCB0byAwLiBURFggbW9kdWxl
IGRvbid0DQo+IGtub3cNCj4gdGhlIGludGVudCBvZiB0aGUgZ3Vlc3QsIHNvIGl0IG1ha2VzIHNl
bnNlIHRvIHJldHVybiBhbiBlcnJvciBjb2RlIHRvIHRlbGwNCj4gZ3Vlc3QNCj4gdGhlIHBhZ2Ug
aXMgYWxyZWFkeSBhY2NlcHRlZCB3aXRob3V0IGNsZWFyaW5nIGl0LiBJZiBndWVzdCB3YW50cyB0
byBjbGVhciB0aGUNCj4gcGFnZSwgaXQgY2FuIGRvIGl0IGl0c2VsZi4NCj4gDQo+IEJ1dCBmb3Ig
TU1JTywgdGhlcmUgaXMgbm8gc3VjaCBjbGVhcmluZyBzZW1hbnRpYy4gU2tpcCBvbiB0aGUgYWxy
ZWFkeS1hY2NlcHRlZA0KPiBNTUlPIHBhZ2UgYW5kIHJldHVybiBzdWNjZXNzIHNlZW1zIHRvIGhh
dmUgbm8gcHJvYmxlbS4gQmVzaWRlcywgcHJpdmF0ZSBtZW1vcnkNCj4gYWNjZXB0IGlzIG9wZXJh
dGluZyBvbiBhIHNpbmdsZSAoaHVnZSkgcGFnZSBidXQgdGhlIE1NSU8gYWNjZXB0IGlzIG9wZXJh
dGluZw0KPiBvbg0KPiBhIHJhbmdlLiBSZXR1cm4gQUxSRUFEWV9BQ0NFUFQgd291bGQgaW5jcmVh
c2UgdGhlIGNvbXBsZXhpdHkgb24gdGhlIG91dHB1dCB0bw0KPiB0ZWxsIHRoZSBjdXJyZW50IHN0
YXR1cyBidXQgd2l0aG91dCBhbnkgcmVhbCBiZW5lZml0Lg0KDQpJbiB0aGUgcGFzdCBkaXNjdXNz
aW9uIG9uIHByaXZhdGUgbWVtb3J5IGFjY2VwdCwgc29tZW9uZSBtYWRlIHRoZSBwb2ludCB0aGF0
IHJlLQ0KYWNjZXB0aW5nIG1lbW9yeSBzaG91bGQgYmUgZml4ZWQgaW4gdGhlIGNhbGxlciBiZWNh
dXNlIGl0IGNvdWxkIGJlIGEgd2Vha25lc3MNCnVzZWQgdG8gYXR0YWNrIHRoZSBndWVzdC4gSWYg
dGhlIGtlcm5lbCBpcyBjb25mdXNlZCwgdGhlIGhvc3QgY291bGQgemVybyBtZW1vcnkNCmZvciB0
aGUgZ3Vlc3QgYXMgcGFydCBvZiBzb21lIGF0dGFjaywgb3IgdGhlIG5ldyBjYWxsZXIgb2YgYWNj
ZXB0IGNvdWxkIGJlDQpzdXJwcmlzZWQgYnkgdW4temVyb2VkIG1lbW9yeS4gVGhpcyBjYW1lIHVw
IHdoZW4gdGhlIG1lbW9yeSBob3QgcmVwbHVnIGJ1ZyB0aGF0DQp3YXMgZXZlbnR1YWxseSBmaXhl
ZCBpbiBxZW11IHBhcnRseSB0byBhdm9pZCBhbGxvd2luZyBzdXJ2aXZhbCBvZiByZS1hY2NlcHRp
bmcNCm1lbW9yeSBpbiB0aGUgZ3Vlc3QuwqAoYW5kIGNhdWdodCBieSB0aGUgYWxyZWFkeSBhY2Nl
cHRlZCBlcnJvciBjb2RlKS4gV2UNCmRpc2N1c3NlZCBpZiB0aGUgZ3Vlc3QgY291bGQgaGFuZGxl
IHRoZSBlcnJvciBieSBzaW1wbHkgcmUtemVyb2luZyB0aGUgbWVtb3J5DQphZnRlciBhIGRvdWJs
ZSBhY2NlcHQuIEJ1dCB0aGVuIHRoZSBkZWJhdGUgd2FzIHdoZXRoZXIgdGhpcyB3b3VsZCBjb3Zl
ciB1cCBidWdzLg0KDQpJIHRoaW5rIGEgc2ltaWxhciBjYXNlIGNvdWxkIGJlIG1hZGUgZm9yIE1N
SU8sIHdoaWNoIGlzIHByb2JhYmx5IHRoZSBwdXJwb3NlIG9mDQp0aGlzIGVycm9yPyBUaGUgZ3Vl
c3QgY291bGQgZ2V0IGNvbmZ1c2VkIGFib3V0IHdoaWNoIE1NSU8gYWRkcmVzcyBpcyBtYXBwZWQg
YXQgYQ0KcGFydGljdWxhciBHUEE/IFRoZXJlIG11c3QgYmUgc29tZSB0cnVzdGluZyBpbnRlbmRl
ZCBhcyBwYXJ0IG9mIHRoZSBvcGVyYXRpb24gb3INCndoeSBldmVuIGhhdmUgdGhlIE1NSU8gYWNj
ZXB0IGluIHRoZSBndWVzdCBpbiB0aGUgZmlyc3QgcGxhY2UuDQoNClNvIEkgdGhpbmsgaWYgd2Ug
ZG9uJ3QgbmVlZCB0aGUgZXJyb3IsIHdoeSBldmVuIG5lZWQgdGhlIE1NSU8gYWNjZXB0IGNhbGwg
YXQNCmFsbD8gQnV0IHdlIHByb2JhYmx5IHdhbnQgYm90aC4NCg0KQW5kIEkgYWxzbyBkb24ndCBz
ZWUgYSBtYWpvciBzaW1wbGljaXR5IGJlbmVmaXQgdG8gZHJvcHBpbmcgZXJyb3IuIFdoYXQgaXMg
dGhlDQpzYXZpbmdzPw0K
