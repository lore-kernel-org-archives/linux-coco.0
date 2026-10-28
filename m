Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793169904;
	b=SblHUYufmM+241NbdTDaRdwY7EhaBXBjm0GYnAvDa41f1gKEfRVzys3cDpN1t17xJoY6
	 r4yPOSNuE2HPJ0wS6wZxCuN1tYFiWwlC1F4qjaXC/5bmDITVCGEJNiMbSevdUjzo/xay/
	 b735i9wr/gadVHp5Y9MRsGyBZM6bKlDHfldH2WwVUubE+X80NDt1DABF5VaR7i1E00b5M
	 cF/xKSgtFQrSsVz1TxDW+A3fYvbuupZKWOfUawsyjgi7tHX35LVErSnmkdkNnzVpqXZn8
	 AtVdJOWbW4nNA4sScUl3roxsgl8+aJAJ9ib7wMRdsCayIGnwFpa8HZSGCWbo6alinEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169904;
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
	bh=tyWKlYhER5AroZZKS3eWDIkVfmiYwk31o5YTHM5ykV4=;
	b=vpq9W4tYBm5klmfcBzZX23EPUXqBKKaCEP88ubgg3WI+aS3hpVsUcrnN/TMT4QgucdFA
	 4tx9otqy4ZjQeZqfH7u/tqMbZcoXGZacAyT51fBI5kl5iub240KhJi+Acgf5GbE8qYAZx
	 ON/k5Z/s1bU3h/TF4DrYVYx8AFr1MY9pAi4NhRZMaaiAVNtt7ncmaL9nZABJuJxjJPG65
	 5AOfaEYhJde2TjUebDtJtgt+X684v4l7QzXZmz78QWTfwr5Zu5xyfJVsqBxDVKpsnHKgW
	 EapRysJYrMsqcpkG9DL3IrYxgWeixb6zaWiiaZrHyMW3usr041gHXWJvtQb6uimcJBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrmGvbZ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AC0606A31D
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 06:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AC0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrmGvbZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793169903; x=1824705903;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tyWKlYhER5AroZZKS3eWDIkVfmiYwk31o5YTHM5ykV4=;
  b=lrmGvbZ0xHpQuwyC4ZBdmy38ShUoCY8VTBnksjjOBQ/0jLjY8I8zRF7V
   57fF+dPX0kWBUCe/zhd6szeL0Th9d7/Ukb5GNwD3FYp5/hm/ql7xCv09R
   ftrGtwtHUdC8NZhGKuUCWrd4JnaN6t9COS8aXQL9LxLxA4d7JR7dVVBlm
   QN5SJXTq42+UNoefw3OeOpouZFqj7ak6d+Iuy15xj0cdjiimE9/X83l2K
   uT7vdsEfNn8/95JVJgfbSQOn84UOPifYN7qhxn6sms45Q/i9CPe7Y1FW/
   CztqNQ6ZW6JuaGIGeBiw+rvElP5TswXDkvbRy2ydZiiwlPXnQcqGzDsIO
   Q==;
X-CSE-ConnectionGUID: ufVEkkErQrSQ5Vk6M4rupQ==
X-CSE-MsgGUID: iTghrkDiR6iT+56FWt3naw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1895935"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1895935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 23:45:02 -0700
X-CSE-ConnectionGUID: 7AB7l/xGSI6wtLDYou4t0g==
X-CSE-MsgGUID: iIH+AocHSUiAKc0MjDlS8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4839207"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 23:45:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 27 Oct 2026 23:45:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 23:45:00 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 23:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM2I6uBecxV8XUCTxWkFd36g7DhHyEU88asAe2IioVt/RScSwi59ILFexMSxfwgldC0JMeChhHipSkgLN/xgzldFAuF9IWix8AUX+we1dp2s0p50bCG5WZ8zlyhtYjeDw6QDEomGFWFpRzSL5Ex+U25daOfFwBIY2kUyKRpKOA56GipCTTe/SKMvgwnguQIxSrbWTCPktnqg7bch5mQZEjJBb5d7HgfzKXZrSJkEetXvDN8jKDeS7JQnrrE9OIaTLF30yRMTdss3XBaiU0olCdGrUU7LHoC+U6kETeFxXdRlrxGHnccnf61d7tK2FpoIKGKRAt5hTDLQ/2xRnS38xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyWKlYhER5AroZZKS3eWDIkVfmiYwk31o5YTHM5ykV4=;
 b=Vp/8MJ6E9bzSvJVo2lbwDxN7CPYgNT3KlJr821a3koraP9qdd9qbSIJeoPtLXUBcIMcI1b8V3cKdykOdNAFpKtSwnqboi65HBpMEq9IVFVcs45x/mOJTzxMeddixRs2p5D2nBF+hs/VtT3xp0ZmDA2DONvCmLaYHA8P8eQ3o3wWWutiRAr56pMy2er311NDCWO2EayIKTSZRXoXWicbS8l2er/WgE/FsXRRLlSma/4wfhGm+JqzhkcaAESkYhpj57wtn1UnoBrTTL48GxA4UtYF1Y/t+WYgl3O9MlVNggTY9VSwE0yuZkdEcm3Sy7EZuyeZiY+aW9Y6WcPhDe57dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA0PR11MB4734.namprd11.prod.outlook.com (2603:10b6:806:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 06:44:58 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 06:44:57 +0000
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
Subject: RE: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device Interface
 (TDI) activation
Thread-Topic: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device
 Interface (TDI) activation
Thread-Index: AQHdS9rXga6cgPHlGUSTJRY7liaL3LcPnPOAgAMakBA=
Date: Wed, 28 Oct 2026 06:44:57 +0000
Message-ID: <IA3PR11MB9136FCB9ABE0B3171BC3A6E2926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-13-zhenzhong.duan@intel.com>
 <c81b4b51-4412-4d5d-a073-55fb346a766a@intel.com>
In-Reply-To: <c81b4b51-4412-4d5d-a073-55fb346a766a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SA0PR11MB4734:EE_
x-ms-office365-filtering-correlation-id: 6dd9f98e-3f84-4bab-0b6f-08df34befb67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|261026140227099003|38070700021|4143699003|11063799006|56012099006|261026121527099003|261021121427099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: YpiT8DZolEeWtpzghxSB3289bmLzGk7HWVoPqhBpoNnQxUGcL2yFuysaffS4jSph3JvXM244bhqA3UkB0lI9gBySqLW2x72SBGWgkdtkxVsYuRDa7dsL/Lxy4cKEglfOkYPFHdza6hZCU3rqEikD5E5/bHBDA4reDO9Aqj5GyoEIX7KV7/PDhg3dKYchJ3F+hku6udz8ig15lQZ6kkQ9U/f9kTlFEKPIfSIbC/0Ca5GgzOA85ASXHu+2qwF6JvT0rTaPpIRNQS/Cw8zCHpjZ+Wo2xlc0nKI9VnVWmec7dIbfY519uM50CkXXZtl33/mB4i8KLlpUhGne93NZ/A3uzvE7TEmkmuNFXC83Fe3qddtG+8SDaDW5uwkcg/DEmeOoOE+EJZYi59JsAve6ozY4/vskqHFELhFUc8wajKpEzlrbCF4+adR4lF44eFrM4rEmFE9YLW1gGVnDzz6SAqz312xsTpYCAWxMGr63L++lfi5swTL0WApkeZ1JifTTJfPibNQ7qJ8zsyTYbOZefUYdzUkUVGyH6ij8J37TT9NLngV9raRR4q4OUGA8M5cEH9pphogSbRsx1qkYqZ7icMrlSD/zRM0GpnR2tay1g1/kM0FlSNtmO+pb2ufYeP8v7h82jMgHvtzULPOOYqZGsjb2pugPQZp4wPBbtl4GWFVdTvf5vzsktfPNEsBAiM8kFDmqECQXWcKfwkCCW3DKzfupMZEjSmVvxbLlOxOak/XxYjc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(261026140227099003)(38070700021)(4143699003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHlKd0VnbE40Q09RNVI2VzQwNVBJWEVCcHkydDhvVXhqd1djWkV5S0dPeUhv?=
 =?utf-8?B?cW9mMlJDR0t6NGdkZmFmUk1CZjZVV0hPUXRIS1ZrVG9JaWk2RllRUXFOa2d2?=
 =?utf-8?B?TCs3aUovaTIrTmJxLzVnR2Z4eE84a0ptRFZaZEtVb212bk1WWHdQTmR5UTZB?=
 =?utf-8?B?TGdlTldSKzkyM1cyRG5lOUZSS2ZGZVpqSDBqUW84dVRacWdudHBWUE5IOGs5?=
 =?utf-8?B?VkNuS0hkeFVxRld2Nk45ZVA0T1lGVnZOTEoramVPLzJ5QXc1SjdlVXRDNktE?=
 =?utf-8?B?aSt5dEFJSDNKeENGR3JaeEo0ZWczdUhEaWhlS1VSdm1WaEFHa240cDVVdnQ2?=
 =?utf-8?B?MXRHMG1zN1ZWRnRZUXltaHRlVTdRV0xaWi9lSXdFcFVXNjUzcTRUT2tJVHFo?=
 =?utf-8?B?SjNmRGQ1NmtXOGEzTGlWWS90L3NHMCtWSVpYMHVoekp4UEtJMklITkpMdW81?=
 =?utf-8?B?MHo2SzNsbWl5V3ozTWpLY05jVzNOUnNyL1lUSjFCTXlhRDBaSk5mcWJKWEJV?=
 =?utf-8?B?ZmxDdHBCRlIweXQzV1ZQODNuVk03cml5cU1xMjE0a0hMZStOUGdQaDA0ajlw?=
 =?utf-8?B?em9IVVpMVHBLVld0OG5DeUpnaE1xTHhyU3Z0RkpseDFWTjRqamtKWlRwK3Ex?=
 =?utf-8?B?UjdIUXR6RWlmOXdaTUtNNWVoZWsyTGoralhYeWdScUMvNHVtWUlsK1dUZ2pJ?=
 =?utf-8?B?VzdiazNRVjNRM2RvdVhyN3Y1aUtLdTVzQ2tTTFlBVTE2UWdwSVlPM2ZKc1hS?=
 =?utf-8?B?MWNCMmRqOVBraHBSMFJPeG5yZmEwZnd0a1R2bHltcENDYWZwMVR1UmpuckJJ?=
 =?utf-8?B?MnJWTUhzNVpBYVpEV1pIc3BhQmJ0dElIU2cwTzh4MkkyeDhsTk5oei94amd5?=
 =?utf-8?B?MEdvRC9SUU5jN0RSbkk0RFdIZDl2eFdaMXp3TTdIU1Rra29HVEtRQU9QNUpi?=
 =?utf-8?B?Yzl4SlV0K3VoS3VrcE9sZ0hUcTJTQWZxbXVjVUM2WStheWlDcjd6aEJtaDlD?=
 =?utf-8?B?c21HQXNUK2oxTGZHYVNPSXZkVlA0djJZamExMDdaeU4ydlZZTFJiUXc2RjYz?=
 =?utf-8?B?K00xd1dBb1M3cFM5c2xBaEo0RlFCTVJhR25wT05BU3BMUnFvRXk2Y0Joellr?=
 =?utf-8?B?N1JCdHJvWmNGRzhMaHZyN3Fld1VHZDlLR1JHTVAvVjNCZlpqYUl2QzY1YWZZ?=
 =?utf-8?B?c2k1ZFNxWk5uT1hHTjJNTUx5TXVsY3ZJVENiWnJLVFh6NXVIYitBaExZMmNP?=
 =?utf-8?B?b1FIZGI2MzdmaUxpNXdOQS9aUDU2eGVMaDU4VkIwYkRaZWp0bE5BVTBnd3JM?=
 =?utf-8?B?WTlCL2UrdUJUZ0JDUFIwc1VOVm5KMWUyaWlHT0h6VE81SjcwU0VSd252UXI0?=
 =?utf-8?B?d3BidDVrYjVuLzNsNnpVMVYvM0VMb1FwWUY1S093YXdwWURQQzRqa0ozWURC?=
 =?utf-8?B?VWNuMXpVd1RBd2RTemdxTWRSOUNqVTd6RXZPeU01MDM0Q2hDeWFsTTZFeFJ0?=
 =?utf-8?B?MEJaeEFYTUhGcHl1RkdGRSttTjZyemtGcGVmbnIrWTFXWG1RTTU5TVRZSVlK?=
 =?utf-8?B?aDIzdUFLV1hwTVFUbXFkeFRKaWQ4U3pDK0hxVWZmWXdNNmVySC9ITnF2dmlJ?=
 =?utf-8?B?ajJsOHZsYlZHZFZIbnZqQ2I2VHZiL2FPNTUwLytGV2VWRGtTb1hqS09YMFNo?=
 =?utf-8?B?cHNnOVhsN0MzOFVGbDdRV2tpK1FzOEZXQlhZdXhKUWx0SEFBRldxczlBTnhx?=
 =?utf-8?B?aHdzeEZtdEplMG1HVFV1TWVPOUpDRHNLZmZodVVlSjNMckduRmFkbXBJTlkx?=
 =?utf-8?B?aG1YRmlGKzU1QmViTnJkN0QwdTB2Q3IzMUM4NWkreVF0eVpjREkyQ21Xb2VQ?=
 =?utf-8?B?dTByamZobHJxWHF0a3IwbU1TdkIxb2lxd0VsK2k0OE9pODhKU0lOTndPNDJM?=
 =?utf-8?B?SGdRZlFmY0pQQ01VL3F0c3hySjRCa0d0V3ZnSTJWbFQ4VkVCSFJPODFoeFY5?=
 =?utf-8?B?NXJ3Wk5iNVRkalVscDdVeVBvU3pPRDA4cE5tUTkvNjRIQlcySFg1Zyt6VEVE?=
 =?utf-8?B?eHM0dDlIcU1mbUw0VHRsVWNzWWZtZ2NpcnhZQXFnOCtqbzZKZHNseEw3aEdP?=
 =?utf-8?B?aEQyNVI4ZHhYZ0VqNjVoMklYaHNnQkpwc2pYYzhnVUs2TUpuRjBjRVdIWmtN?=
 =?utf-8?B?ZXEzVVV2SkhMQ29kUTVoYmxrZ2w2QzZxK2NpR0YxV1lBNGN0dDRXQy8rTVdo?=
 =?utf-8?B?MGlXTEFpWFNJNHdOcnptZitaYTNELzA2ekUxWFZRTHc1SGw5QnB1OFFaandm?=
 =?utf-8?B?a2VaK2Y0RmM0RVZnTC82a0M0S1o0R1R4L2hPcjRKYklSWmVpOGJFZz09?=
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
X-Exchange-RoutingPolicyChecked: qmZvz1qoc3Pg4KT6d1Dt1eCNhNPwh8gVpMAq557OrctgYd2Z88o32ahgwTjB81ndagjk7+v5JQYGH6EdW0p3DF4+Vc70BZlboCaueqSbnBhNUC4RHfZf0EGi3Q1Kl0p+uCiZaB0/Eky9BrWJxJKcy5vJQq2VHpmc4ZUzHwLVCc2LXotShKTfBJM9efGEyy1yHy6ubN/NLVe67dDxJyVmOB+n0wc8HTGgJu3y4GZlX8Ky29S41zplUQFZzM3tjI1fVhyTaRUelb9EFO3x3FHbyFIRd84gPPaldfbhwMsb8uzxFHpLk51hUd8D4DDBCuG4JeZWjA1K2fY0ArNszrZEcw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd9f98e-3f84-4bab-0b6f-08df34befb67
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 06:44:57.5743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LW/qoD9Sv1XIufsYvvv9r7GAoidY/vmfKHFJipM+XNfpTdX/J1lOD20pjCWC5oAf2tjTMq3pIMPFu1yQ7w+eQe69ImRIhnahn9nOsdTCyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4734
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAxMi8xNV0gdmlydDog
dGR4LWd1ZXN0OiBTdXBwb3J0IFRydXN0IERldmljZQ0KPkludGVyZmFjZSAoVERJKSBhY3RpdmF0
aW9uDQo+DQo+T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+
IFN0b3JlIHRoZSBiaW5kIHNlc3Npb24gSUQgb2J0YWluZWQgYWZ0ZXIgYmluZGluZyB0aGUgVERJ
IHdoaWNoIGlzIHVzZWQNCj4+IGJ5IFRERy5UREkuU1RBUlQgdG8gdmVyaWZ5IHNhbWUgYmluZCBz
ZXNzaW9uIGVzdGFibGlzaGVkIGJ5IGhvc3QgYmVmb3JlDQo+PiBhY3RpdmF0aW9uLg0KPj4NCj4+
IEFkZCB0ZHhfdGRpX3N0YXJ0X2RldigpIHRvIHNpZ25hbCBndWVzdCByZWFkaW5lc3MgdG8gdGhl
IFREWCBtb2R1bGUgYW5kDQo+PiBpc3N1ZSB0aGUgVERDTV9PUF9TVEFSVF9UREkgaHlwZXJjYWxs
IGZvciB0aGUgaG9zdCB0byBjb21wbGV0ZQ0KPmFjdGl2YXRpb24uDQo+DQo+SXQgbWFpbmx5IGlz
IHN0YXRpbmcgd2hhdCB0aGUgY29kZSBpcyBkb2luZy4gV2hhdCBtYXR0ZXJzIG1vcmUgaXMgdGhl
DQo+ZGVzaWduDQo+Y2hvaWNlLiBFLmcuLCB3aHkgdGhlIHNlc3Npb24gSUQgbmVlZHMgdG8gc3Rv
cmVkPyB3aWxsIGl0IGJlIHVzZWQgYW55d2hlcmUNCj5lbHNlPw0KPmNhbiBpdCBiZSBvYnRhaW5l
ZCBqdXN0IHdoZW4gY2FsbGluZyB0aGUgdGR4X21jYWxsX3RkaV9zdGFydCgpPw0KDQpXaWxsIGFk
ZCBtb3JlIGludHJvZHVjdGlvbi4NCg0KPg0KPklzIHRoZXJlIGEgaGFyZCByZXF1aXJlbWVudCB0
aGF0IGJlZm9yZSB0aGUgTU1JTyBpcyBhY2NlcHRlZCwgdGhlIERFVkNJRQ0KPmNhbm5vdA0KPmJl
IHN0YXJ0ZWQ/IElzIGl0IGFibGUgdG8gYWNjZXB0IE1NSU8gYXQgcnVudGltZSBsaWtlIHRoZSBw
cml2YXRlIG1lbW9yeT8NCj4NCj4+IFRoZSBydW4gY2FsbGJhY2sgYWNjZXB0cyBwcml2YXRlIE1N
SU8gcmFuZ2VzLCBzdGFydHMgdGhlIFRESSwgYW5kDQo+dmVyaWZpZXMNCj4+IHRoYXQgaXQgcmVh
Y2hlcyBURElfU1RBVEVfUlVOLCBmaW5hbGx5IG5vdGlmaWVzIERNQSBzdWItc3lzdGVtIGRldmlj
ZSdzDQo+PiByZWFkeSB0byBETUEgdG8gcHJpdmF0ZSBtZW1vcnkuIE5vdGUgdGhhdCBwcml2YXRl
IERNQSBpcyBlbmFibGVkDQo+c2VwYXJhdGVseQ0KPj4gZHVyaW5nIGRyaXZlciBhdHRhY2ggYnkg
YWNjZXB0aW5nIHRoZSBkZWZhdWx0IERNQVIgZW50cnkuDQo+DQo+QnV0IHRoaXMgcGF0Y2ggYWxy
ZWFkeSBjYWxscyBkbWFfc2V0X2NjX3ByaXZhdGUoKS4gV2lsbCBpdCBjYXVzZSBwcm9ibGVtDQo+
d2l0aG91dA0KPnRoZSBmb2xsb3dpbmcgcGF0Y2g/IElmIHNvLCBpdCBoYXMgYmlzZWN0IGlzc3Vl
Lg0KDQpBZ3JlZWQsIGl0IG1ha2UgbW9yZSBzZW5zZSB0byBtb3ZlIGRtYV9zZXRfY2NfcHJpdmF0
ZSgpIGNhbGwgaW50byBlbmFibGVfZG1hKCkgY2FsbGJhY2suDQo=
