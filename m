Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794390291;
	b=FunFFL0tZofAavu7r9tBEv5l6w+hGb4i+wPMPKp4G2iOEUS9hKfsj2ASOuysHiCQbdto
	 CpeM3T/q4YKNEqZivKBO1Xsszxpponrxz/lrkBwRi8+nMFk9JFxvtdt0gvcuCs1ny784P
	 xDnYbLpADKkhRnQk+cSnGpOwzQ2YA5u1qG7AOfVehE2dXLwz9UeVj2ivG4QX0SaWLDB+c
	 zF9FJfhlyAzzzmIsG9Yu3fflEJcXgnRlbTXM8nBuQ3VMZDeyYIYcBsoLydUPxbxXPttU6
	 4utl5+VinNUDU5hltN97cAWAXpH7oK5RaoW2nBW2dxCBl/qlypvhLcrSZe2W1P1BhIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390291;
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
	bh=NZc7lGBJgvlfabVlqDAP+H871HgT3qKxK1+7gtEpI2E=;
	b=sIyt9J2VN7KyAp9h42fCJ+5HLy2CDUFvNNHzYV+hBKYlL1RKesoDifbV8wHumQEv4FpC
	 d6yXPKD8wT322ShL/Q8tx/SdAKnKINktLRm84uEkDgCRcRj0J6rBI9MNN0HEx7y27lSr/
	 g6oBjnNCdZ/d7F42geqw1Gkp/uoH7xjX5D8vB5lvN+w8SflJwfjJWxdisT0udak7bVVto
	 FZ4wUQdCWZSoexda49mrdiDgnfhxPX9eoBRoprosqMo7FufhLoY02pXR9GyWDNbDpKrHs
	 wBO3dAeaQyEeRpeGY/85WNJwcfng8k2qzjiUa8xC9hSPrX0PhvSUoF0adxzMHfikgCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob8yebqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A9C60A2601
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 09:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A9C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ob8yebqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794390291; x=1825926291;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NZc7lGBJgvlfabVlqDAP+H871HgT3qKxK1+7gtEpI2E=;
  b=Ob8yebqSX8Qn/NvfgJptdnny0RrrpGnRcOiXoIjQAY+Sl6E9wpfP0o/8
   SYV09o2TkXg1TPPspcvhNB06PqQHFgbgdOp27aGQaSIAXdtjTqO0s0r/H
   CkoLEajg5fA20zk9R+E/LprZUh9clKSG489UIogkWCzdNfUoIpKK2O8aS
   hXsbe3u2jkuSgZgBGJLzRagJPG1xLjZT+vZ79nej07FyuAaP/YMPMqA7P
   N5tOU1delDviNF+YBIfwsvKeGGtRCX4y/PG5G5RQrhf+w3uYjrf39SPYU
   V/0TSALiFSsMnsDf9N4p8FsyolJdeOWKaq8lbemfy6jMeYAmr6moB9Fsu
   A==;
X-CSE-ConnectionGUID: j39uwS69Qzeov19bngYTMA==
X-CSE-MsgGUID: Q0+jaIeKR/ySp5zbPtIb0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3066275"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3066275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 01:44:51 -0800
X-CSE-ConnectionGUID: +mkwvxzVSESTsA6HZy3n+g==
X-CSE-MsgGUID: pkMrGPx6Qr6O4foGwCyl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8475373"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 01:44:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:44:50 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 01:44:50 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 01:44:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYzEhJ/CtfFEmzAgyFix9i9mIrzfO5xitVfn8E6jkGeT6gf8B+QciDj8Zsx4Aj90RJoIaz0PebBm2zYRSV4TtFpgN/9WGURik3pTj0hNKHm433Ujn1D9qQXpg9EunpCFeEwPMcSOgwBGWtvdf7F2AVnLrCtj857wynO61RDgOhOUft1XSBLvE4aI1CPNGBiJj2K78TCPRReR2UHo1msqOatB5rXmqzKPSncGyfYyUuGefncocVPe6hm+h/RZX6z+A7t79P2/Hx3m7Z9y/wqGjK0F43xYZuVaQWMj0kNkUT0kDNXpRSEgQPadtZMqJfkwiJScIRj6DhrrBrko/ncU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZc7lGBJgvlfabVlqDAP+H871HgT3qKxK1+7gtEpI2E=;
 b=IBh2DmNg9Jb2vGIlZVokPGAUdkXAYk2VRUKDSOyJQRfVgOiukJDkUr8Rk1zw7KAX5eO7gG0DtEXQvcVjfZDjZ0tOxctya7VkkvTJrTRum2OcXBMBcSLtc6SoqbK+Lp1o9Rn6t/qKG9qK+SQA6Ht/n27emuCK0LabMrOMDblPJAxGp1HeTyMSmoKz4ahJh9oNPbLWwIAq5gKTmAZOtF5ZyY7fcw72QTAE1kyo1FzbDdRRtmyx9uL7pbpe+sB6xQyry/uo0Qy+TOFO7lzMZovbXwdID+2k8xsmP4RwjhHu2IEmdrSFs8xQL5TV+EWk9YvSw2HdMGKKHvMIWfA51rT2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:44:43 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0615.008; Wed, 11 Nov 2026
 09:44:42 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFAltk+oc7EUexq/mpS9aD2rcCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJ4CACkAtgIAAmzyAgAARV4CAACktgIAAHwIAgABzXYA=
Date: Wed, 11 Nov 2026 09:44:42 +0000
Message-ID: <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
In-Reply-To: <20261111001606.GH738765@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|CO1PR11MB4995:EE_
x-ms-office365-filtering-correlation-id: 534abf6e-7947-4d91-adf7-08df3fd869b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261021135927099003|261028144727099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: IqIhoeVSwRx3cSTXrPPj3jvPBp6iB6Tqe904zdOXr5i56EBB4vKonZNyduoJoV9HF+MqNA+2wST9e7IcG011/MlcBaSJW6py42t8myFk5pP/ZmaAoWJsFijvzjXY/NOk1Jp4H3Bjt8GWy53t+L5avqj52SNmNhHm/MJzRdMkDcL+WnwvASF1kzLodtVCK13G/GTFTkKe2XwTPC9jCXYKZ/d+ycGav0nblsA2o4mxOp80sPhCaKt7vXC4IazK+k7l9rgSwVeuCP+ceuHVPq2ZX+lByY6rEnnx1+rDW2athHuFiT0p55n6XrPAOrEwUTfhkjBWtc3P4R0+eZY9AmFHveJvgcQdUXZUUPXB7Xlh6HG8Gjdiy/KJhfw9q6Wwt/EYjV0jfnlz/lDdtOOHAJ8oM/PRXFhUXB06Y3Ul+1ud+GRuF5NDsabEYoBKYjr1t5WMm3vg56bir4roYuWm5pZxkfPKVyXiAIGsWj2SEoom/3zxYSOP9VFYt97nQ1xT4s2v8IxQFMnSCyaEwLOZKYTi65zrJhes8x6EhGciiHeSmsVZVEtwhLOXlbQfPoustM+UFGAhA1vue3FPtGbQE+wr2q21a7pLfVQv+mfx+k4TI2IPPBKBsJCQ8PQBSekkJJ9hEI7q5pg1P1SMmcGubkt3zNKkmEPoA8WvWSzwmKXQ03KMPeEmWzM+dt020P46c+uRFajTKBA3uBlW4dBbOKHHmnArjdZs5Q6SlIrmZU0kkEY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261021135927099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhhMGtKalRXMklwNUswUGovejRSblo3UjRpdlpnSVhoRG9zUVFxSzdCRjJ1?=
 =?utf-8?B?aUY5NHhjTjB4d2o0RS9uaDd1Qk1XRVRheTY5VDg0a2hWM3JmMDByR1ZnQ2oy?=
 =?utf-8?B?REgzT0dsK0w0bGN6amp6VHVBNitGVjREUGlOdjU3VzArcFdYbkdvYzZkek9W?=
 =?utf-8?B?Z2dIdlVEZ2FWcWMrUjhDSXVHQUFwVCtodVBZU0dGem5iVDdhY29iQ094aWJU?=
 =?utf-8?B?ZXl4OS9wNnAvTW9QamxKdE4vaXJVQUJudUNRNHg0WWNKNmV5WkNrclBSM3k5?=
 =?utf-8?B?NC9qUzRDVWhSblI1UCtpblBuU1lhUXFrS0RyczFaMksvZkV4WGVSOU1zenE4?=
 =?utf-8?B?YjJRYVdVc2N4azg1U2tmNEdnUnB0UmlJQTd4eENhSW01WTE2bURNSzliR2wy?=
 =?utf-8?B?bkNySWVjMjd3OWFyRFcwaWJWdUZ5ZDVuQ1JQb0pRckYrdmFUSTJlL01VK2pZ?=
 =?utf-8?B?akhkMUxMaENKRzIvdiszcTB2cmlBUEdqLzRoTWJtNVcySEpUdVA0N1lWcDla?=
 =?utf-8?B?MG1JbmZqM0VqYVRROStsYk83Q0c4c1YvYkRRRW0wU0ExYnVGbWpXelQwM1lx?=
 =?utf-8?B?M3FyOVcxS0o2ckhDVTNYaWFJSEljcUNsSGlBVWFEVmtiR1Z0aGxvYkhJcGla?=
 =?utf-8?B?Ry9zamJwVzRlcm9pYTk4L2NmbnlSWGZiUytEb2tGa2Zhc1BOVlZreWxiRlhD?=
 =?utf-8?B?VzdzRERPTG9xWFdTMnorLzV0MzdveDVWRU9VNzBrdnpkYVp4QWhQL2h3QWRP?=
 =?utf-8?B?WGpka21mQ1gzZmkvWXpjT3Zhb1lWS0NPSTZxbkNsUzZidjJ6dGZYeFppbWly?=
 =?utf-8?B?aUEraXVnRE1jNTM3WDRoZ2xESXgyTXp4c1czTk11YUdHM3AvTGIwb05YVjdC?=
 =?utf-8?B?RjE0TnJmRjdURDJCZ2FrWmp0T2d5dUgveGE5NndxSHhNSWxFemdzWit4RXdI?=
 =?utf-8?B?d2wzT1pwWFl4a091UFZwcWVwZ29qVzBxYk0wWlNBRVNwSFlPbEhVVVlVM3E3?=
 =?utf-8?B?TlpWUnN1NzBLOE1RWU0yRGg2cDczR2RLaVNpK1ZVN3FVRG1raWxaTW14eHhq?=
 =?utf-8?B?NkkvdW9iQno4YWlmMHlHcjVaQ1JYTWxVRGd5Zk81VXFodGxzYWtvTlgvZXV6?=
 =?utf-8?B?RU80VmJuZjlmUFh4Z3k4MktITGF4NmhkVnhaWUtnM3J4Um4yb3ZwMXQ2SEli?=
 =?utf-8?B?akgvNzZaQ1dCWVd6ZFhnM0hlZU9QZVFyYnNWSWdiWFRzZGs2ODBOS2l3UUlB?=
 =?utf-8?B?Mk5xY3dPYzdmbkxkY21aSUR2TDVOTmpuMEpPTVRmNUhIYXJ1T092UkFldGxa?=
 =?utf-8?B?UG9LK0JOdFpyR0czSElVVDlRaGtiK3lVb2QwSUlCOHNwbHBtK1g5Q2ZZSE1G?=
 =?utf-8?B?SG5OVnZyR3lMN3VZdlZxaVM0eTZrdEVSWHM5ekFrMVFIUEdrMlJLekpMb3hi?=
 =?utf-8?B?WTNxT3lzOTBqODFBaDBRRUluOGFaRDl3emlUYXp2emN0aXVZZVZkVHhUNlgz?=
 =?utf-8?B?U2FKZmV6dVBycWhwM2hkU2EvbWY4cEk1WjZnb2RETlV1WFRsODFWYlRDVDYy?=
 =?utf-8?B?QWNPSXJOcC9vM1NxUFd0cjFsakFGR1BxSXA3aHVGRmxWbWJodEF4TTRHYUNY?=
 =?utf-8?B?VHNGL05BVUFYdG5jblVPcE12V1hwL2l1RXNQWWVPYjY5VjI4NXY0VEFFYzVl?=
 =?utf-8?B?R3hLTnpkMkFEWUIxS1NhaTdDKzA3TVlwSXY4UTBwQXkzRHNoRUhhOTVoenRl?=
 =?utf-8?B?Y1hra1pCNEdKMmlxSkxsTEl4ZVNzUmFrMzFzNTRnYnRkMjlPcW9FNmhkRlVB?=
 =?utf-8?B?Y0FRYUFZN1VweEJ2MkJYUFVpV2xUb1ZSNHlyaTUvMlU3ZmFHeTU2ZDFWVDY2?=
 =?utf-8?B?enIrOEJheGZwWnAvTmVRTDVNSDRZRU1JR05QNytUTUxTelhKeXc5OEdyaEty?=
 =?utf-8?B?OWtZSDI3RnllZno3WWZaNEdDUm5CbWx4MzJlWUJEenJRckFTa1MvbVlQaDlP?=
 =?utf-8?B?WVlpcnI4bG5RRWRvTlZ4Vjg3NVk4YTJvbTlUNUFSWCtwWWxnSTIvSFJkTk40?=
 =?utf-8?B?VzNVRkJ5c3Z4YVA4TE1tcVE4UTlWMzlZZ21laFdwMzIzNG15Q0VjY0NXSzdF?=
 =?utf-8?B?MHpoamVHaTcrRnlLQmh5WjI0NDAvOUh6RlIvRFgwb2tQNVhqc3NSZVpoRjBs?=
 =?utf-8?B?UVdoM3Zwd0I4UkgzcFM4cnhGQnc4dlY2MUcwVWE2ZC9RdGJiRjBPb3hrOWw1?=
 =?utf-8?B?Zm82SG56WEZwTE9weDJYY3RCcnZVRjRuRkZWVTIrQWJySGJab01lTTVUaGoz?=
 =?utf-8?B?VHhrMy9aY3FYbGRhem14SkJIT1dvRU9jOWtsWSsrUU5KWVBrcXNGdz09?=
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
X-Exchange-RoutingPolicyChecked: a1YYQQVjuFHBY6O0oPeBi/TUyMONaoEJ1dqzVR8fEYM0VRiUEBQDhAJ1VzPz6Lkd2tQ8ujyeMnNZwu4bEnTjiiF7Yn++hB+zOdz3BbtcQQRUhLdTMBOEIrj6Jk5/L7CDl43etLeRPteMZ0q7UIV3GzFgNRj2EI9THzpfOXQ3Q2xSm29YaZpycj1wvIMCAzKaL65Z9ujJfK3TnaR+J3R9otdpQCcznQejkfl7wkzoSZj1x2tIHO8+hAz22qH4XQge1jiXTrfAPlptn9f6DyyJzWtO0PPXMuXJN/24RAUmATnjYVH3ujCjLMKJ9Bf/inUG4GGszCpLDYtq1NfLAVD+6A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 534abf6e-7947-4d91-adf7-08df3fd869b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 09:44:42.8380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0HMUXtNTa+OPhl6WFQQRRyPmDLgU6ILiPOVQgnfbqTE2xkBKpnBUomAg0bVLmTl6HzAOiLpd3QtvFykYPWBSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIE5vdmVtYmVyIDExLCAyMDI2IDg6MTYgQU0NCj4gDQo+IE9uIFR1ZSwgTm92IDEwLCAyMDI2
IGF0IDEwOjI1OjA3UE0gKzAwMDAsIEVkZ2Vjb21iZSwgUmljayBQIHdyb3RlOg0KPiA+IE9uIFR1
ZSwgMjAyNi0xMS0xMCBhdCAxNTo1NyAtMDQwMCwgSmFzb24gR3VudGhvcnBlIHdyb3RlOg0KPiA+
ID4gT24gVHVlLCBOb3YgMTAsIDIwMjYgYXQgMDY6NTU6NDFQTSArMDAwMCwgRWRnZWNvbWJlLCBS
aWNrIFAgd3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBBZGRpdGlvbmFsbHksIHdlIHNob3VsZCBwcm9i
YWJseSBzZWUgaWYgSmFzb24gaGFzIGFueSBvcGluaW9uIG9uIHRoZQ0KPiB0eXBlcyBvZg0KPiA+
ID4gPiBlcnJvcnMgdGhhdCBndWVzdCBUU00gd291bGQgbGlrZSB0byBoYW5kbGUuDQo+ID4gPg0K
PiA+ID4gTm90IGF0IHRoaXMgcG9pbnQgOlwgQW5kIHBlcmhhcHMgbm90IGF0IGFsbC4NCj4gPiA+
DQo+ID4gPiBNb3N0IG9mIHRoaXMgc3R1ZmYgd2lsbCBlbmQgdXAgcm91dGluZyB0aHJvdWdoIHVz
ZXJzcGFjZSBzbyBpdCBoYXMgdG8NCj4gPiA+IGJlIGNvbXByZXNzZWQgaW50byBhIGVycm5vLicN
Cj4gPiA+DQo+ID4gPiBUaGUgdmFyaW91cyBWTU0gdG8gZ3Vlc3Qgc3BlY3MgbGlrZSBHSENJIGFy
ZSBnb2luZyB0byBkZWZpbmUgdGhlaXIgb3duDQo+ID4gPiBjb250cmFjdHMsIGFuZCBpdCBpcyB1
cCB0byBJbnRlbCB0byBlbnN1cmUgdGhhdCB0aGUgZnVsbCByb3V0ZSBmcm9tDQo+ID4gPiDCoCB0
aGlzIGNvZGUgLT4gYXR0ZXN0YXRpb24gc3Vic3lzdGVtIC0+IHVhcGkgLT4gdm1tIC0+IEdIQ0kN
Cj4gPiA+DQo+ID4gPiBQcmVzZXJ2ZXMgd2hhdGV2ZXIgc2VtYW50aWNzIGhhdmUgYmVlbiBkZWZp
bmVkIGluIHRoZSBzcGVjLg0KPiA+ID4NCj4gPiA+IEkgZG9uJ3Qga25vdyB0aGUgYW5zd2VyIHRv
IHRoZSBFQlVTWSBxdWVzdGlvbiwgb3RoZXIgdGhhbg0KPiA+ID4gVFNNL2F0dGVzdGF0aW9uIHdp
bGwgcmV0dXJuIHRoYXQgdG8gdXNlcnNwYWNlLiBDYW4geW91ciBWTU0gYW5kIEdIQ0kNCj4gPiA+
IHNvcnQgaXQgb3V0Pw0KDQpHSENJIGRvZXNuJ3QgZGVmaW5lIGEgRUJVU1kgZXJyb3IgY29kZS4g
U28gaXQncyBtb3JlIGEgVEQgaW50ZXJuYWwgcG9saWN5Lg0KDQpBIHN0YXR1cyBieXRlIGluIHRo
ZSBHSENJIGRhdGEgYnVmZmVyIGluZGljYXRlcyB3aGV0aGVyIHRoZSByZXF1ZXN0ZWQNCm9wZXJh
dGlvbiBpcyBjb21wbGV0ZWQgYnkgdGhlIFZNTSAoc3VjY2Vzc2Z1bGx5IG9yIHdpdGggZXJyb3Ip
LiBJdCdzDQp1bnJlYXNvbmFibGUgdG8gcG9sbCBpdCBpbmRlZmluaXRlbHkgc28gdGhlIHBvbGxp
bmcgd2lsbCBiZSBjYXBwZWQgYnkgYQ0KdGltZW91dC4gVGhlbiBhIDJuZCByZXF1ZXN0IGNvbWVz
IGFuZCBvYnNlcnZlcyBwcmV2aW91cyByZXF1ZXN0DQpzdGlsbCBpbiBwcm9ncmVzcywgdGhlbiAt
RUJVU1kgaXMgcmV0dXJuZWQuDQoNClN1Y2ggZmFpbHVyZXMgKHRpbWVvdXQgb3IgYnVzeSkgYmVm
b3JlIGF0dGVzdGF0aW9uIHBhc3NlcyBhcmUganVzdA0KcmV0dXJuZWQgdG8gdXNlcnNwYWNlLCBh
cyBKYXNvbiBzdWdnZXN0ZWQuIGl0J3MgZmluZS4NCg0KVGhlIGludGVyZXN0aW5nIGNhc2UgaXMg
YWJvdXQgc3VjaCBmYWlsdXJlcyBhZnRlciBhdHRlc3QgZS5nLiB1bmxvY2sNCndoaWNoIGlzIHN1
cHBvc2VkIHRvIGJlIGEgdm9pZCBvcGVyYXRpb24uIE1heWJlIHdlIGRvbid0IG5lZWQgZG8NCmFu
eXRoaW5nIHNwZWNpYWwgaW4gdHNtIGNvcmUgLSB0aGUgc2VjdXJlIGZpcm13YXJlIG1haW50YWlu
cyB0aGUNCnN0YXRlIG1hY2hpbmUgc28gZnV0dXJlIGxvY2sgd2lsbCBmYWlsIGlmIHRoZSBjdXJy
ZW50IHN0YXRlIGlzIG5vdA0KdW5sb2NrZWQuIA0KDQpBbnl3YXkgdGhlIHN1Y2Nlc3Mgb3IgZXJy
b3IgY29kZSBmcm9tIEdIQ0kgaXMganVzdCBhIGhpbnQgYW5kDQp1bnRydXN0ZWQuDQoNCj4gPg0K
PiA+IEtldmluIGFuZCBZaWx1biBhcmUgYW5hbHl6aW5nIHdoYXQga2luZCBvZiBlcnJvcnMgd2Ug
c2hvdWxkIGV4cGVjdCB0aGUgVk1NDQo+IHRvDQo+ID4gaGFuZGxlLiBCdXQgc29tZSBvZiB0aGUg
Y2FzZXMgWmhlbnpob25nIGxpc3RlZCBzZWVtIGxpa2UgdGhleSBjb3VsZCBiZQ0KPiA+IHNpdHVh
dGlvbnMgdHJ1c3RlZCBJTyBndWVzdHMgY291bGQgZW5jb3VudGVyIGdlbmVyYWxseS4gTGlrZSB0
aGUgZXhhbXBsZQ0KPiA+ICJbZGV2aWNlXSBmaXJtd2FyZSBoYW5ncyBkdXJpbmcgbG9jay91bmxv
Y2siLiBJbiB0aGF0IGNhc2UgdW5pZmljYXRpb24gaW4gVFNNDQo+ID4gY291bGQgYmUgbmljZS4N
Cg0KQXMgbG9uZyBhcyB3ZSByZWx5IG9uIHRoZSBzZWN1cmUgZmlybXdhcmUgdG8gbWFuYWdlIHRo
ZSBUREkgc3RhdGUgbWFjaGluZQ0KcHJvcGVybHksIGl0IGRvZXNuJ3QgbWF0dGVyIHdoZXRoZXIg
YW4gdW5jb21wbGV0ZWQgbG9jay91bmxvY2sgaXMgY2F1c2VkDQpieSBkZXZpY2UgZmlybXdhcmUg
aGFuZywgb3IgYW55IGludGVybWVkaWF0ZSBzb2Z0d2FyZSBsYXllciBzZXJ2aW5nIHRoZQ0KR0hD
SSBjYWxsLg0KDQpHZW5lcmFsbHkgZm9yIGVycm9ycyB3aGljaCBjb25maW5lIHRvIGFuIGFzc2ln
bmVkIGRldmljZSwgdGhlIGd1ZXN0IGp1c3QNCmtlZXBzIHJ1bm5pbmcuIEluIHRoZSBlbmQgdGhl
IHJlbGF0ZWQgZHJpdmVyIHN0YWNrIGluIHRoZSBndWVzdCB3aWxsIGNhcHR1cmUNCnRoZSBkZXZp
Y2UgZXJyb3IgYW5kIHF1YXJhbnRpbmUgdGhlIGRldmljZSBpbiBpdHMgb3duIHdheS4NCg0KU28g
dGhlIFREIGp1c3QgbmVlZHMgdG8gaGFuZGxlIGVycm9ycyBhY2NvcmRpbmcgdG8gdGhlIEdIQ0kg
c3BlYzoNCg0KW0dIQ0kgZ2VuZXJhbF0NCglUREcuVlAuVk1DQUxMX0lOVkFMSURfT1BFUkFORA0K
CVRERy5WUC5WTUNBTExfU1VCRlVOQ19VTlNVUFBPUlRFRA0KDQpbVERDTSBzcGVjaWZpY10NCglU
RFhfTU9EVUxFX0VSUk9SDQoJVERYSU9fREVWSUNFX0VSUk9SDQoJU1BETV9NRVNTQUdFX0VSUk9S
DQoJSURFX0tNX01FU1NBR0VfRVJST1INCglURElTUF9NRVNTQUdFX0VSUk9SDQoJSU5WQUxJRF9T
VEFURQ0KDQpGb3IgZ2VuZXJhbCBlcnJvcnMgbGV0J3MgZm9sbG93IHRoZSBjb252ZW50aW9uIGFs
cmVhZHkgZXN0YWJsaXNoZWQuDQoNCmZvciBURENNIHNwZWNpZmljIG9uZXMgdGhleSBhcmUgbm90
IHVzZWZ1bCB0aGVuIGxldCdzIGp1c3QgcmV0dXJuIGENCnNpbmdsZSBlcnJubyAoZS5nLiAtRUlP
KSBmb3IgYWxsIG9mIHRoZW0gdG8gdXNlcnNwYWNlLg0KDQo+ID4NCj4gPiBGb3IgZXJyb3JzIHRo
YXQgaW5kaWNhdGUgdW5jb29wZXJhdGl2ZSBvciBidWdneSBob3N0LCB3ZSBlbHNld2hlcmUgd2Fy
biBpbg0KPiB0aGUNCj4gPiBURFggd3JhcHBlcnMuIEJ1dCBpbiBjb2NvLCBub3QgaGFuZGxpbmcg
YW4gZXJyb3IgaW4gdGhlIGNhbGxlciBjYW4gYmUgYW4NCj4gYXZlbnVlDQo+ID4gdG8gYXR0YWNr
IHRoZSBndWVzdC4gU28gSSBndWVzcyB3ZSB3b3VsZCBjb21tb25seSBuZWVkIHRvIGhhbmRsZSB0
aGVzZQ0KPiBlcnJvcnMgaW4NCj4gPiB0aGUgY2FsbGVycy4NCj4gDQo+IEFueSBmYWlsdXJlIHRv
IGF0dGVzdCBzaG91bGQganVzdCBwcm9wb2dhdGUgdG8gZ3Vlc3QgdXNlcnNwYWNlIGFuZA0KPiB1
c2Vyc3BhY2Ugd2lsIGZhaWwgdGhlIGF0dGVzdGF0aW9uIGFuZCBub3QgZW5hYmxlIHRoZSBkZXZp
Y2UuIFRoaXMgaXMNCj4gZmluZS4NCj4gDQo+IEFsbCBmYWlsdXJlIGNsYXNzZXMsIGluY2x1ZGlu
ZyB0aGUgY2FzZXMgd2hlcmUgdGhlIGd1ZXN0IGlzIGNoZWNraW5nDQo+IGRpZ2VzdHMvZXRjIHRv
IGNvbmZpcm0gdGhlIGhvc3QgaGFzIGRvbmUgdGhlIHJpZ2h0IHRoaW5nIGNhbiB3b3JrIGxpa2UN
Cj4gdGhpcy4NCg0KQWdyZWUNCg0KPiANCj4gPiBaaGVuemhvbmcgaGFkIHByZXZpb3VzbHkgc3Vn
Z2VzdGVkIGEgYm9vbCB0byBzZXQgYSBkZXZpY2UgYXMgYnVnZ2VkIGZvciB0aGUNCj4gPiBwdXJw
b3NlIG9mIHRyeWluZyB0byBjb250aW51ZSBndWVzdCBleGVjdXRpb24gYXMgd2VsbCBhcyBwb3Nz
aWJsZSBpbiB0aGUgZmFjZQ0KPiBvZg0KPiA+IGhvc3QgaXNzdWVzLg0KPiANCj4gSXQgZG9lcyBu
b3Qgc2VlbSBuZWNlc3NhcnkgdG8gbWUsIHVzZXJzcGFjZSBpcyByZXNwb25zaWJsZS4gU2luY2Ug
bm8NCj4gZGV2aWNlIGV2aWRlbmNlIGNvdWxkIHBvc3NpYmx5IGhhdmUgYmVlbiBsb2dnZWQgdGhl
IFZNIHdvdWxkIGZhaWwNCj4gYXR0ZXN0YXRpb24gYW55aG93Lg0KPiANCg0KWWVhaCAtIGFzIHNh
aWQgZXZlbiBmb3IgZXJyb3JzIGFmdGVyIGF0dGVzdCBwYXNzZXMgd2UgY291bGQgcmVseSBvbiBz
ZWN1cmUNCmZpcm13YXJlIHRvIGRvIHRoZSByaWdodCB0aGluZy4gVXNlcnNwYWNlIHJlcXVlc3Rz
IHVubG9jayBhbmQgZG93bmdyYWRlDQp0aGUgdHJ1c3QgbGV2ZWwgdG8gRElTQUJMRUQuIEZhaWx1
cmVzIHdpbGwgYmUgY2F1Z2h0IGluIG5leHQgYXR0ZW1wdCBpZg0KdW5sb2NrIGRvZXNuJ3QgY29t
cGxldGUgc3VjY2Vzc2Z1bGx5Lg0KDQpXZSBkb24ndCBuZWVkIHRoZSBndWVzdCBrZXJuZWwgdG8g
ZXhwbGljaXRseSBtYXJrIHRoZSBidWdneSBzdGF0ZS4gOikNCg==
