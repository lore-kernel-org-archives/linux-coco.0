Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793905575;
	b=nn5JbJwPnmECIiQW3yRroRrDanCpeU+/UL4HsyFRQmeKH3wOnmiRIfSXCBn2MR613gjq
	 qsEU/9HBYkyMEI2TphI/niAbqmyK8a/gQ6r1rr1FQZmwm2/TbL6D1l8jMGpwBm/fy+5GU
	 sKvtFm3rSaKED0UkchTiM6JY6GCZcs5wTQz8Nks+NbC8ONQrn3RsVfUQSWAa3XDM8g38t
	 EoRqJWHPQwH790z8hMMYA/VxAubRZaXdSS3mOLx2jgAnE9pyuCwVymMPDQFqHQ9h7Kd8H
	 aP8WPPFCR7wIUIm41BZkAvWfgxcOCdomNlEB5PtZiZVm41GUpDZZIKqUhE1NOsR+uCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793905575;
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
	bh=AOjctjScifPKVX3Ti77DvYy4zgtsH41jB9O/l1no84k=;
	b=c/K3bmn/zZVCthEYeNHmXTMavWZzaASQIja4htw6c30nxAKJsLYi1+h6F/VJfaBEZjer
	 Qg9b0fxoSz/xQkrruLINr/n61JN0jUc/fa84c/UFKrm5vOisw05wAxOUETXrvWd2pF3rv
	 rumpe9R+KkAhbk4paNNReei1nlrUWQi/IgVaTiawxt/CrDoOMn9E9MbXCQtoZoBkvZY8U
	 bVtDg+Ha4Qm7jRDEtxeLzquXbQv3fSRzOaCSZhS+OlKJbBJbACVGNeDxL5ByTohB5oody
	 7xrudM6wg6cIHnOUnGiPDyqNgI7g5T2IheM8EcYjgkIvngfs2ZmtVa1dHRMNNWO0arg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="YXWU6c+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0538606A328
	for <linux-coco@lists.linux.dev>; Thu,  5 Nov 2026 19:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0538606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YXWU6c+/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793905572; x=1825441572;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AOjctjScifPKVX3Ti77DvYy4zgtsH41jB9O/l1no84k=;
  b=YXWU6c+/G5tuF2fa1+QMkbyObNELhdXD84CRnEzjL7HWSuKEHTExX8EC
   tbOqO+ginxaS/Q/+ZVwFIVuBvKungvFUP0SIVvJqUmg2irxmqEHTCaC0A
   9MZ3ceQ1YXDGiPchDtuKAIJ6D2GfQnmLhEGW754lCouITBXtVMvO8iyrU
   bLJ83fOalVrCU3qgwuCR2FySHltob3SxdG/TpbCXcj7zpmoBVwWztEv6A
   czZBLjQ8+IVOWGTamiX/0wRsa8f95qUcGdRawNLvrJWiX3slK7XSTbQlK
   CGdeEslCmwLr3EhaZ3JeB14puK+62JOrYTZqPSXABGoIVL52Uln99CYxX
   Q==;
X-CSE-ConnectionGUID: 2VmzEME/RV26eH534yog6A==
X-CSE-MsgGUID: bVxSpumjQhG4TS/XT2BW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2603408"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2603408"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:06:12 -0800
X-CSE-ConnectionGUID: DkeKfSsERwSjyXRFIf2/vw==
X-CSE-MsgGUID: WoNhjIXdTp2Hnj7fKbuU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7407794"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 11:06:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 11:06:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 11:06:10 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 11:06:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dj58ypwXA3uC9Clzq8BrPznh+0g2TMdgSjApbzl+RrCPJO8ic50M/Z8fABgaHUm6/fn66Q9UdMa3KPkvk18I+d6D3+7l+QpNg/nkoXbXUED4s8RaZN+BULKFD0TrnuD41GUu9MUmqFA9/R5ITakxwdgXclsttXXrK5TXQNEeS5o2RL51lWkAIu0gAerQyXgZnt9zSlZM1WbnZjsVVXHOqmISNB9dctLp6bJpYvsFfbaX7X0dR7Chlq/5AhQC1XEWAJ18ujwE1+LWN+s+vms7hSSihOuZ/RLZTq/RZl0hDPfmadQQGKEVse7PP5gF0gfMJ9DGfj6wsd1hoqRwfwM2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOjctjScifPKVX3Ti77DvYy4zgtsH41jB9O/l1no84k=;
 b=jTzQ5vK62hKD9YK68Kvv904XYQlExOAXYMVQEMG2/ih1hAfgEbGl6JHr/ZeiT4xLno5FCupMOj9BlKxz2N11Gwtp3H7SgBB8cDNwClGW489aq2URB6ikgwLhhvgNylv6fgKSXRmJfFJ5keJzjrjnM0Y8TSFFhvEWatbjz6riIWsZByCtDs4I7CmaDgnjdv7Cd/U+xu/c65IzSHeosKy7ZQHeWMjOwHjpYt2ILA2w2eJrxjd+xUkDuwyj7ys0sgu3GzaOZ2Qr8WThOfFWMS61GsaYWsMBj0pzwtm2PLAaG4TgVrHb7JB/zYCFYE3tY6IiC75HoVIZ1qgEOHqf3OicgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SAVPR11MB9549.namprd11.prod.outlook.com
 (2603:10b6:806:4e9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:06:02 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:06:01 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCAAMbrAIAAXtqAgADqQoCAAPKdAA==
Date: Thu, 5 Nov 2026 19:06:01 +0000
Message-ID: <d1d48263791816b2f361bca2d3a9923e5395a49c.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91363BF2AFC2ED5E126DBFA792682@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <b15708f7cd770fdba4082b19488422a376c2aa9c.camel@intel.com>
	 <IA3PR11MB91367791D58F8DA63D0F2B3692772@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91367791D58F8DA63D0F2B3692772@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SAVPR11MB9549:EE_
x-ms-office365-filtering-correlation-id: b7240875-f4d9-4611-ef28-08df3b6fd519
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|11063799006|5023799004|4143699003|261026140227099003|261021121427099003|10067099003|261102123227099003|261028144727099003|261022105027099003|261022075727099003|261026121527099003;
x-microsoft-antispam-message-info: 2UvTK07q0SfsePpPkLe7qj/J4/Pi/iYqy81D9XES5HtK0siWTQ0xdGzKQu2BX0YJ8Fg3xPqELar6foPN9apq3+HDc/D55q0zySYjm0wHzwrp0uNOdaeCXo4yvxGXOXaA3Wd5uYsBYEhzOIziEG6v4NZcPqoiFZCtGgh2EhyJMsS4lp+zXjfRJj8mN6FqmuhqRMMo0gJWfJurxqEGi+6HJUHhz8BgKiDFDmmZOI+osSEiUwwuDK6dVMEXGypO+O2exp7kNJ0Vd45UIBZ0x28uiCNGZBdsV28YJ42rielaNBZhRthV6/da81TqTVA3SzECFvW/Ig0/vtxgBWWxrT3iXpbJMD02sniDmSIE9Dvp6ITMbZvXaMWJbEoxRT2O/b6W30YP7YViaFr5Z8sEEzWCycv6PgSTR0IlWWkyftHATzZDOy5XJl26RYVt4ONCReMJ3NSY/t9jyHSnQhGBd2O6uI7WLxlkv66CEcDJoHfRfAqNkqTpLoKz2bOUl+20CVDe2a4mZMK5Vaz7GLB/tVs6C3x8OxWYwNoeELxNg8QgW/o690HE6RO/YsTdxcdRnWFNAxaDJF7XBHkArDYghhx8W4d4eg8IBCB2RVNMlZve1BTGVyc0zMLPCbW3m0KyvuogH5JPXPHodJEFuYFNG1syXjy4qBkVkPIMGcV07pJiYpDEqwwIDoFKubzYyjEiFMoUfqZLl2SnWAOvhSj+3KApRMoAel8Goket/qpLpPY/lFY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(11063799006)(5023799004)(4143699003)(261026140227099003)(261021121427099003)(10067099003)(261102123227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDZqUmFpa3FQdld4R0pFY01KclhTRnJwYUp2QUZyMi8rYTBuT25HSnRPbno2?=
 =?utf-8?B?RHpjbE16SnE4UkRMZ1RjZSt3YW53NTJYa0Raakl5b2NFSlJzVGJDMGJQYjhH?=
 =?utf-8?B?THBGZWgvcUJ1bkJzNUpBSFhqNmZFNjRpcjMzRFg4ekhCRUxNMm9JMjdMeTQ5?=
 =?utf-8?B?SmFyR0dVYlFsWlBWdFFUMjhsYytKekZ5Vko2WjU5QkZnQ1BaWTZjK1lzM0tG?=
 =?utf-8?B?SHp6Q1d5UEt2LzJxSjNmNTZSczg4ZWVUWHp0QnYvUEIySVh3SlNVUVVqWmZx?=
 =?utf-8?B?bkQxVW9VTzl3T1NhUldHUG5jeTZpUzNPRDQrVHZ1S01SOTNzOUxVWDE0RHZi?=
 =?utf-8?B?eTk5VWVwSUZKbWgxQU9TRkhkbXEvMW1SOWZ5c1MzR21nQ3RQNEdMTnBsTi9k?=
 =?utf-8?B?N1ZNZTc4RWk2aFZxUU0wRXNLTXB3N05IUlFsT2hCbkJxUkd2bDZqaFRpZVhF?=
 =?utf-8?B?QUNpYXltb3VjMWJyWW02blJEU0VxQ2p1UzcxTVJ6NVIwMU9EY3EyQ1B2NmJl?=
 =?utf-8?B?K2pyL1ViL0t2UGZyOUV3MUowYTE2YkNGZU16amIrUGtzWWhjOWZwaUpoRkho?=
 =?utf-8?B?V0wwaTIweHZFVnZUSHNFMjBnNGFzSXoyUEtNWkpIT0doY09iNlBMRFpzbGVC?=
 =?utf-8?B?SHN0Tk1ISnJVTjlIOVZPK0gwOXgxamxqUFRUTFdUbVExUmYyMFh0YWhKTUxJ?=
 =?utf-8?B?ZUgyUlVrQ1NKSGlxcitqc3NYaDNocW55VE9pWVZJVmlxbERxWEJQME1hOS8v?=
 =?utf-8?B?Y25jSnpLeWwyQ05Cekd6OERmNWtIa3RocnkwYmVmZlBCOHVSOXdRbEVFVnc2?=
 =?utf-8?B?bEM4eWEzRnVNaVEybHh2VGhtSG8xRWJvRCt3UXBIVEtxTVdQKzF6eFJQa2RP?=
 =?utf-8?B?V0RGbThBbGp6UlZ1eDFTMEJFTHZlSmNPSmlLV0wxS1ZhNEFWM2JJb3E5SmZq?=
 =?utf-8?B?Vy9XeGJoQmNEcW42bEx6SmlYdURXcno4cnNFRHVSUFg3REVRNXNubGJyanMx?=
 =?utf-8?B?T2ZIR2g4M2JMRU1qVnZKT1ljaGJqS2pHM3ljZDFwMjNwWmYrM2ZIY0UwZlV2?=
 =?utf-8?B?N1h6dmY2c0kwbUdRb0toekNsbTRmRlBzc25uT3AycHhlQzFjK204akNIcmU4?=
 =?utf-8?B?eVF3N2thOHBWeTN5QUhveTh1V3hJY01MTVRWS1FkTGVqeTk5YXdwekNkVUxE?=
 =?utf-8?B?ZHlYYW1ndEpiK3RTQUVxbi9OZlkvUjNOelJOcTJDTWlPRi96Q3VXWkR4M2dj?=
 =?utf-8?B?VnQ5Q0xicUUzYzVpUTR5VEZrcVY4RnU2SjAwQzBFMEkwOHc0cjZpdzkwalI4?=
 =?utf-8?B?dVg2VysxbEROMFJKY1IzcktGQVVhVGFsSTB3VGZlRDBEQTZybnZ2YTJ4eWoy?=
 =?utf-8?B?S0ltcHhNMDNDK0JpakZJdE0wdXR5QnVFd2huUStiOWlvV25hQUpvUWRhWDdS?=
 =?utf-8?B?Ti9CZFdMVUsyamJFTkp4TlZvZDRUckZtT2tlL2ZtdkRIUk1QTVpGNzRncnJX?=
 =?utf-8?B?K1Nhc1AxdEhzVzFaRzU0dHJXRi8zVEhoTyswTC9nbm55YzdDaHdrWFZteC93?=
 =?utf-8?B?a05ObE5jVTJLUWlPNkx4OWJTNEY5Um1VbWRlVUVmSm1GdFpXbWpsaHp2SmJY?=
 =?utf-8?B?VUMwVVgzTldKOWZ1b1ppeVNNTXRvRnRreXV3L2tYZ2J1SnJCQ1VxK2hyazFR?=
 =?utf-8?B?dmRsVVRENEE4QzI4MWFBdVVDOURzQ0ZFR011dWhzNGtIcVNJNFNsZ3dWV2lt?=
 =?utf-8?B?TGM1LzhGRlEvNnQyY1BKeWp2TmtvWFUwTFRwRGhuaFFYRHZsUVluUkltQ3Fi?=
 =?utf-8?B?dnNnbFBJdXJKbk5GdVVjVnRvSzloSmpaZGcvVXNBOGlHQ2YvUWN4Mit4VEJO?=
 =?utf-8?B?SXBmM2VuMFN4cUkyaE1XUEp3enJTbEJVTmRNS3JLY1oraVl0cFV6Zzh6VFIw?=
 =?utf-8?B?eXdUSCtrT1ZIbWgxTDJuUXRXUFpQNlBrd3pFMVhEdmxpN01QazZWdUxFbW5z?=
 =?utf-8?B?NmNRTU5Gbm1GdGt0UkFvRXZCdjZ2MWRwUElEcG9tME93ZDZnL2hCS0FMaThD?=
 =?utf-8?B?YU1GM3UxSnhoMSs3MGN4M1pSRnpZNFc0d25xUjFocmFSK0tuci84WVgvVmNk?=
 =?utf-8?B?NndDMEdBcnRSQ3N2WCtHVFIzTmtxRWM5azRkdHN2NkRDUXVRekU1enRtNjk2?=
 =?utf-8?B?VlhpckJuckVLaVFzNFRwdlNPN2UycWJ5b1UrMGp3Nmp3TERXOVlBVXBVRlA5?=
 =?utf-8?B?N2RrQ3d3YUFOVUNza1QrNEhkN2JsSEdvSVJxa0plZ3BRUU9OTGt4NHJlNU9i?=
 =?utf-8?B?d1FURXdDd3RJekV6WTRCTndOcFhIc2lHR29hQ2NKRFFpWSs5S0I4Zmg2Rjcx?=
 =?utf-8?Q?bakvE6FQn97MMJ5w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A5CA0BFBE91CA4FBE63C88A077E1A37@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: is6wI4pQUsGbI20irLSp5XUkaLv+YDEsjMYGCS0WjEgzLYHOVP2s0o7wM2F427co4KOUeloNUS/3/76uXOegq0iDc2t1WPC2JfjFaOo/cL/rXwCU60Lcd/07y5C9EoGxrSYrXkZh4rPUifpX50AEr6sHXMmszK/VvUD8PxBzOVxl88qSq/ZXpA8Wc4ByKpbtB1is0MqSjPZblDpJN6Om1ncr5qDdx8EeV2GFXH3YwXZBJeYXJgme0uQsW26gljClXzRGGozPs10twq4jTJn7PBF5RjTyD7SwRr8SLCg0FqugeFWSAm2oFvCkiweNLm63boyp29b0M1RSRBw+BRg9ZQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7240875-f4d9-4611-ef28-08df3b6fd519
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 19:06:01.2327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKOZyEyB93x4u0ufg1m/7P7G80CAN9E3KAC5AUDjDAIpAMAKn+jqN/kVb34DTIMzI2lrxw0ysvUb+R0Iwl3FhDH7SDBifdcxa7+MIiViIvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR11MB9549
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTExLTA1IGF0IDA0OjM3ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogRWRnZWNvbWJl
LCBSaWNrIFAgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIIDA2LzE1XSB2aXJ0OiB0ZHgtZ3Vlc3Q6IFN1cHBvcnQgVERJIGJpbmQgYW5kIHVu
YmluZA0KPiA+IG9wZXJhdGlvbnMNCj4gPiANCj4gPiBPbiBXZWQsIDIwMjYtMTEtMDQgYXQgMDg6
NTkgKzAwMDAsIER1YW4sIFpoZW56aG9uZyB3cm90ZToNCj4gPiA+ID4gSSdtIG5vdCBjbGVhciB3
aG9zZSBmYXVsdCB0aGlzIGlzLg0KPiA+ID4gDQo+ID4gPiBIb3N0IHNpZGUgZmF1bHQsIGUuZy4s
IGEgbWFsaWNpb3VzIFZNTSBkb2VzIG5vdGhpbmcgaW4gVU5CSU5EIFREQ00NCj4gPiBoeXBlcmNh
bGwuDQo+ID4gDQo+ID4gSWYgdGhlIGhvc3QgKmNhbiogYWx3YXlzIGhhbmRsZSB0aGlzLCBidXQg
anVzdCBkb2Vzbid0LCB0aGVuIEkgd29uZGVyIGhvdw0KPiA+IG11Y2gNCj4gPiBlZmZvcnQgd2Ug
c2hvdWxkIHNwZW5kIHRvIG9uIGhhbmRsaW5nIGl0LiBXZSBjYW4ndCBwcm90ZWN0IGFnYWluc3Qg
VEQgRE9TDQo+ID4gYnkgdGhlDQo+ID4gaG9zdCwgc28gZG9uJ3QgdHJ5LiBTbyB0aGlzIHNlZW1z
IHNpbWlsYXIuDQo+IA0KPiBGYWlyIHBvaW50LCBJIHdhcyBvdmVydGhpbmtpbmcgdGhpcy4NCg0K
U28gaXMgdGhpcyBvbmx5IGEgYmFkIGhvc3QgYmVoYXZpb3I/IE9yIHNvbWV0aGluZyB3aGVyZSB3
ZSBjb3VsZCBleHBlY3QgaW4NCnByYWN0aWNlIHRoZSBob3N0IHdpbGwgbm90IGJlIGFibGUgdG8g
aGFuZGxlIGl0LCBhbmQgYXQgdGhlIHNhbWUgdGltZSwgd2FudCB0bw0Ka2VlcCB0aGUgZ3Vlc3Qg
cnVubmluZz8NCg==
