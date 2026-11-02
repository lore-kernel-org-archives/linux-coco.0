Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654153;
	b=d+ZfUz2o0StHpIcOsBKTSsVjEknnBcRc5AAAe6CJvbFnL4jRq2SfK0H4KVB4QY8QShR4
	 cpVNFl3nC3SsPlfxQF6oaSNKfEjj6wJyAfZ+kP+yidsTyFlOMpjg7lYfTJxcwLCB430a6
	 ZHcwA0WUgpEoAltcJGfbN5AvvZJQET1hKhA85ZpLHkxJpHcQfW5pcenZyoWaVr7n+w3Q6
	 mhOihwJdIFs9aVNYe2+UFIoOA6B1vTwDE+okXivRmM8rMOquO6qv7pmfyr4tfjHomX9NB
	 ZGia9fQvBlQ/7EkfdiWq1V/EEWrYaFOcz4I3E8Zk+M41xVTvxoDrM+e9eJNrM20HPeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654153;
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
	bh=MCPosUAGNjSfrD+w3EsqBsM/jdqh6ocGC7HIGxMCIM8=;
	b=oXdVbg8SySWEtZ3iagZzXBwH8C1OTUlXAnxr7ySUkFq1V9VZdGk7jyESAykPptJP7R2R
	 odmEmeJIGQOP1jV9Cokgr+RejoYKpIecLEFjVqYzqkwWEeC5eaRiLpcdROFdJjUh1NU98
	 8BESM1VC/0dJADxci8K7+Kmtxn3abReohvbKsPa4RJjSJ2kACOMzk0BmebcHOkL0iJD4X
	 Qe5zTVlbAru6xsxwwVjiS6xvgL4ZnZYTLgASM0aXN6pTUb731HcIGi7074ag/6jM0AQZE
	 3x83tT77IzAQ0+4Cg23FKy/nc+44As/HZRrsO6tbOjWGxcCerP0f9VIEgOLGQSu5efQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bPq2wiQX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D73606A326
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 21:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D73606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bPq2wiQX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793654152; x=1825190152;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MCPosUAGNjSfrD+w3EsqBsM/jdqh6ocGC7HIGxMCIM8=;
  b=bPq2wiQXxvQk6jyXJO3d9kuWCED+PDQp7ONHI2mxieJBmEfdlo7zOI9N
   1XIMoVazRIJwE+nrt0YMbNFnLfXrtSynIp63cC49Mf136l/NLBNcolxtP
   b5A5pzxGh8gozaLILGSCdCq+j6oiazshwksPWDMHxQsgzmfm+akMumOMv
   6b6EeaQbF/3kJkcKAVstJiMnxrHrZ8mR4NiKWyz9AVh2qH3pCKeFL64Sv
   NnXk8SP1Cjgi6UKz2Z17AXWSodUfYdMlU9ZPgnYyZP7KRXmst4PlpJ673
   0ZkUZppA6BQOY65YEAx0MLC0PWQEWWuEDZiAEhUpHyTO0hv8AavwdMqVo
   g==;
X-CSE-ConnectionGUID: xnD03ryGSOeNw6WIgRYsRg==
X-CSE-MsgGUID: zUbepSVJQtKDNvNF0IC6KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2393029"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2393029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:15:51 -0800
X-CSE-ConnectionGUID: eVIkPiVUQxq7NMbhqwhMTw==
X-CSE-MsgGUID: 6b7M9iAFT9CtfaiexFAP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6292503"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:15:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:15:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:15:50 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:15:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkilGSke5pSFDjSnDqj0q1HcDtOC/Q8phxrz8zoiEshWgRKOG1p56oJcQ8cyexRsafgfXNJCTwavg3bu7e0rQ02m0AMD3IdqR5QUebz8bMulHN9Q9PsI35wJ+Ih5zvzO/TPOGB+Pm9lTB2e3yP6a41JoI4h790PuZNQcPaHvvOGSDr6X5WxSJ7YN/UulwKvfJSfcc9SpTNOEOSWQ44M8Kpag8GzcR4scvN54u/SPcpsVg7+JzspBZGmte4zUhBENXLYujSLjiJqkL9ivgS2hy0KnO42zOxWk+2LJacLroIUAWSO9YenmOhkqr7yLzEiy6XGHzhiIWjmQ3BXuvCcfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCPosUAGNjSfrD+w3EsqBsM/jdqh6ocGC7HIGxMCIM8=;
 b=GF/9THC7HtRNcvJA3JbyX07wDJBA9itjx5r7LWZmfrArlOpsZSC5m2SwR1TB3+ujTJQFaakY1+wIelG2gXBwcpCCyh+3wOLXvyabCG07QWr91khLyDEgolLEGjLnsPUdzB1sHktDc0pVV9s1X+u4lcdnWHMGOycphhFRqzy6agFyPW1z5NIISMDXi5kRf2r20fHztu7O/h6D5IQV+gKKZl7yOR+ca0pC71lxPpoeDY4d85fHl7lire5Nu0xXPckO+EoqVpCCB+UjaEXRQKAYbwxCxffdkqLLVG+8ff38ou43x7G0gSpEpjzwEh9j9wWkYMF72r/wnfVqjXiUJpdIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by PH3PPF91320C45A.namprd11.prod.outlook.com
 (2603:10b6:518:1::d38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:15:48 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:15:48 +0000
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
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cPTnYAgAIRvACACibAgA==
Date: Mon, 2 Nov 2026 21:15:48 +0000
Message-ID: <fbe2ac5f7006c09ae0ca351092087f0cc7bb65b0.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <78f8a175-40ce-43c9-b542-45bddb443fd7@intel.com>
	 <IA3PR11MB91367938F3B6501ADF619C0C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91367938F3B6501ADF619C0C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|PH3PPF91320C45A:EE_
x-ms-office365-filtering-correlation-id: c99e42a5-d6cc-4d7f-5e9c-08df39267744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|11063799006|4143699003|56012099006|261009223027099003|261028144727099003|261022075727099003|261026140227099003|261026121527099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: RlaROtDnrJJfm0reuKvCrX0FlQiNBJnBFIMKaRO9jcC4bQVS/3S8SJ/c82Q68hSWO4Fydgp6Y+SQej4rCtdwBNxGpHnW5MbyiYHQoVL2POz4mrvU0sIwfQEiNZhDZmHBVkdA79hE6zZPu+xKBR2AEcAZ2L8R4dFPGL3c5dImoFvb6rd3PrHgQZyD+qBQqk9UGcgSASMEFgE+5qHeUJgzSHM1sluSt1nHx9F9vqrtiGHBjVfNN8mdjkUSYebKnhZpGs+JYWlF40YJv8R+01n+SFmkjqCylYiAfH4rKsVM1KdLK+A81i8h0gXipWcnM7ZZl+A0+MOAWVwiawCCTkvMcgj3NIOV4pCJxBDx7OgNPtR6MxXLQAnL5sPfV5Moep+m3PO6TD4Dof3D2zIXjva5P33jNymfBmlksvpTvyrdZqNgsTxgzeCi+Lb6KbQ51RBD8U76mIShVD9lsIEgSelXaPLIA/Ah4Jjhw95N5u85lTT03cBjj4ZIehonkdF6N/iLDEXmtr+lZjT8I530R91RblHmRy7oMj2iWnf/uV8YRpEqC1oO3lvktqqhewcFhMNvcPTEVKcMnxosVTpHFstGyYULXxAqO6yjWrzcdljoZv6SpEQzA0ZDGVptmXD3WGvG+HPNUYtD7y6a4cz/Y34QDlhUvcP2BvdoexlzP3k5iEc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFNOdmFJUHllTWJVKzFuOWlHNGRkUGlKdzJ3TG9oTU1ycmFhekJHZUdQQ0Fj?=
 =?utf-8?B?UTJEbGx0UmtkeHk4SWxmOWVmTHlseTZYbGo2TjlCNUxSUzJyYUc4VHp4bDMx?=
 =?utf-8?B?YnJxME9GNDRZWUJ1eHYrQXJ6UkFQUXlQRE5xdUh1eDRwNHIzSXIrOUZKVFZ2?=
 =?utf-8?B?amk2VnFGSllVU0lNTHZ4MVBia3ZBTTVoSFJINnl0ZzloTXkvOXZkQTdOcEkr?=
 =?utf-8?B?QjVQZ3NaMUlWdGJOa2xMaUdMblMxYkdvSW9PVk5PQVUxSFA5UjBZdGorRzJH?=
 =?utf-8?B?RitNQVlPeW0rclE1UDNERWFRQ2lSampzUFBIQWlhQmFWbFBBenVNL0pWMzdP?=
 =?utf-8?B?SXFPTi81TVVHWDFURloyV1BaMksyUi9hTnRlSGErajRMVHVvMk5taDhERzh0?=
 =?utf-8?B?QXhhZmdWVGNjVHFMa0tEQmR6LzU0UFl4b3cwK2c1RmtYelZrWVBTeVE2N1Jl?=
 =?utf-8?B?V2Jzd1M1T0RuQms5am00ZkhoRE13b0g4UVdRVmFiOUNkd1NCT0xpRU0yQkhv?=
 =?utf-8?B?THJBQmFYZ2F5citlODVNaWViVEN3QUpTanQwckwvS0ZjUjNSWmRpQzFDTDlk?=
 =?utf-8?B?SFJ5c2JnOEVVMzRZTXp6OGo1cldDYzRpZ21POXk4MmFDbkNOU21mZnhwaGkx?=
 =?utf-8?B?VXZHVmx6MklZVjcxajI2R1NiZWc0dDhuY1lrNmNYUHJRTGdVaXJJVkNvbnY2?=
 =?utf-8?B?d0RuT0xqUHIxY0RjVVNLU0VRY29MNEFrSTN1ODJpWng4eW5NMFJWY2I2dDRF?=
 =?utf-8?B?Vi9WbEVZdEUrRCtrS3pwZVBJeUxVZTJ3ZHJ6Y3dqRE5JazR3Wk1Oa2pzMmVv?=
 =?utf-8?B?T1EySC9IMWl5a1VMV3ZsWVl4K0trMm1aRTBtOFJ3anVkSEFxREQ0UCtzQTRX?=
 =?utf-8?B?emUvSlJlaXlpZitIY2xQTmNSNTdZQ0oxWUN4SUhyWk5FWWt2c20yNEZubnlC?=
 =?utf-8?B?blRZdWlEYXhqT0pBNy9kYnJ5NGViTktKdzNPTFJnU3NMbFZMc0pWSXdHVUcx?=
 =?utf-8?B?MGhucXRLZExnaE1qdVNIa2h4Q250QXNGMWVNcHh5aXAwOWtpYnNvKyszMysx?=
 =?utf-8?B?ZmU3UjJ4SThsWnhkWW4ySm90VDlSVHNKUzhvRkFHbENQNm9HMVY3ZUdYc0Rr?=
 =?utf-8?B?Z2xnSStWNVVkL0Yrai9MWkd1YWk2NG9xUThJcmwrU2lyU2s0cGNFQS9XOHd0?=
 =?utf-8?B?VWh1MUY5TWVya25FRmdvRXZxdFpRT3FsTVR0eE9qNnpXc0VoT3QxQ0xFOUtl?=
 =?utf-8?B?YlNkWHl2VjErU0t3cjJjVC85aEk0UWdnL2g5K2tQVmQycWRNMkVCRnhJZmVP?=
 =?utf-8?B?a0p5Y0w2a2RUVy9lTTlBZk94dythSUQwOGxMWVJVTSt3eVF1dmkyZDg1RTRJ?=
 =?utf-8?B?c3ZtOEREMjkwRUdraFFHakdaZFBIb21uQ2k3UTdRTkhKRE82RWdoL2VCUk1V?=
 =?utf-8?B?UTNnM29UdEZoUXREZjBOcUFNZjV0eTUrQUJtL0ZHTG9BakhNVkNlRDBmeFhr?=
 =?utf-8?B?cmJaMi84RFlCZEpyQitaSUgwT000OTVLcUpTUHpLVkwvUnIvNjVVUVNhU3lk?=
 =?utf-8?B?Lzg5NldyZnRSQU9CRlh0dEJpVDJ5dTlkaUJFS1owYml1UnlYOW5lUVR4VzJY?=
 =?utf-8?B?OFZMV3hpbFZUWEpqMDZ6OUsxZHkvRzN1dmw0THdiV1lUc1JwTXJBaExxdC9p?=
 =?utf-8?B?Mmhod29iMWtsWUM0TW40cGJmM1hlMUk2Wm1sWXVEMmdLaGR2OFpHd2FBRWJz?=
 =?utf-8?B?MHl0VjY5ZzllN0JmQXJnM2dhYUFLd1VTVjhQWFB1anNnSXllUm9HZjBjWUFS?=
 =?utf-8?B?eEo3cG94b3VQOElOR3NFdU1XUkNGUFNnRlVQbTZldDB6Ni9OUVA5dUVoRUN0?=
 =?utf-8?B?ZFlUMGYxbkNnN3VBOHNBUUU0N0QzMWVaRXdudEtFUjZ1MFFHTHpzRVRVVXlh?=
 =?utf-8?B?NGZtTERzNEFjR1lqZ2JZUHlTVXh6dGRWZEJtTmM4d2dZYngvUjl6MzFsVi8r?=
 =?utf-8?B?WENuMzdPZ0lNbFdPeWFKUG9UUWVvcEtUcHpmRVIxMDNuUUEva0szdjFLNTR0?=
 =?utf-8?B?RUFjWTJ2ZFBKV0MyK0d6byt0NHJTNnk3NlpUZ1M4OXYxZUwralZLZGZjSUxi?=
 =?utf-8?B?UmtqZ1A3WjJPZk5yK0lleVZoSGhrUCttUnBidmVmQlBpVjVNZjliaXp6RE9J?=
 =?utf-8?B?M1pWQ0RrTmJZcXRVZjFVbzFBaktPRjR5ZzFiTXFUMTF6UkdUNGZzOW5qcTlS?=
 =?utf-8?B?NHRrQXJMZ0lFTi8rZmRsdUI4K0kxTk4rbDJoYjFWTEVuMURKMEl0ZTB2SDdN?=
 =?utf-8?B?WElGd0tCenNqaG1icHhnanlTL2xMVEtYdjA0R21XZU9ta2FNclowOE81dVpS?=
 =?utf-8?Q?ScHYylf4EibNLmEY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB94CA339A454E4FB2EA91F1261C2880@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: RXW93rcL/ijWS7N6ixgewbbnGvZPdLifMycnTaT0aCaTv4K9TUJyUuUMvdsOaNkHza7ToFru3ETtPUVtKPQxwcqnTvFUX8hYR2jxtcFVqHMpEGG5qyiV1jkw+/3S8fKjNF3K8hd/Ad3eegJUv77eUWBzqa4qlNQTl0iyAc8ZawkR5VTedAN53/ej+ATYJPbGRgOAEjf3BAKoRdLobHRYtmqxFM9OyJteBc3OLqz1X5TlR0gWHnPNMsdytStSals/inuEJIQBONvRk2Ct9K8qTNyCdSUAFjmIziZGPoq1zTEMnGWNlAoCYEImkVgMWjj6tlN3ttBbZ76GRhSrayPcaA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e42a5-d6cc-4d7f-5e9c-08df39267744
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 21:15:48.1899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wYuaR6m2c8gzO597WSlVKJRPaU212Ab0srG2DChHqJThXGF40tm34fbk3ryiA37orIRrucNDfpqGFUYbNTLB2ckZxoXrt9Wh46o+Woqbocc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTEwLTI3IGF0IDEwOjE0ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gdGR4X3RkaV9iaW5kX2Rldih0ZGV2c2VjKTsNCj4gPiANCj4gPiAuLi4gdGhlIF9fZnJl
ZSh0ZHhfdGRpX3VuYmluZF9kZXYpIGFyZSBub3QgZWFzeSB0byBmb2xsb3cuDQo+ID4gDQo+ID4g
SSdtIHdvcnJpZWQgaWYgaXQgaXMgT0sgdG8gRGF2ZSBnaXZlbiB0aGUgcHJldmlvdXMgZGlzY3Vz
c2lvblsxXQ0KPiA+IA0KPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvNzAwNTY5
MjQtMTcwMi00MDIwLWI4MDUtDQo+ID4gMDE0ZWZiODdhZmRkQGludGVsLmNvbS8NCj4gDQo+IEkg
c2VlIGluIGFub3RoZXIgY29tbWVudHMgRGF2ZSBzYWlkICJJdCBkZXBlbmRzIiwgdGhvdWdoIEkn
bSBub3QgY2xlYXINCj4gaGlzIGNob2ljZSBvbiB0aGlzIGVycm9yIHBhdGguIEkgdGhpbmsgd2Ug
Y2FuIGtlZXAgaXQgYXMgaXMgYW5kIGRvIHRoZQ0KPiBjaGFuZ2Ugb25jZSBoZSBjb21tZW50ZWQg
aGlzIHByZWZlcmVuY2UgaGVyZS4gU3dpdGNoaW5nIHRvIGdvdG8gaXMgYQ0KPiB0cml2aWFsIHdv
cmsgaGVyZS4NCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9lMzgzMGIwNi1kYWM4
LTRmMjItYmQwNy05ODA3Mzg4NjY3OGFAaW50ZWwuY29tLw0KDQpJIHRoaW5rIHlvdSBzaG91bGQg
anVzdGlmeSB3aHkgdGhpcyB3YXkgaXMgYmV0dGVyIHRoZW4uIERhdmUgZGlkIG5vdCBtZWFuOiBk
b24ndA0KdGhpbmsgYWJvdXQgaXQgYW5kIGxlYXZlIGl0IGZvciBtZSB0byBkZWNpZGUgZWFjaCBj
YXNlLg0KDQpJbiB0aGlzIGNhc2Ugd2Uga25vdyBfX2ZyZWUoKSBhbmQgc2ltaWxhciBoYXMgYmVl
biBOQUtlZCBzZXZlcmFsIHRpbWVzLCBhbmQgaXQNCnRoZSBmYW1pbGlhciBwYXR0ZXJucyB3aWxs
IGJlIGVhc2llciB0byByZWFkIGluIGdlbmVyYWwuIFNvIHRoYXQgc2hvdWxkIGJlIHRoZQ0KZGVm
YXVsdCB1bmxlc3MgdGhlcmUgaXMgc29tZSBkZXNjcmliYWJsZSBwcm9ibGVtIGl0IHNvbHZlcy4g
UGxlYXNlIGdpdmUgaXQuDQo=
