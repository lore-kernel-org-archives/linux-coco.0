Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793711471;
	b=o48phQB+IWhIQEY0TCVjSHKU7xMBj425GevoVxfvNjLIMY9vJmXru/Ee0jpfEuv2jqeS
	 c5rTAep6c1UFt8+FRvSg/PS6y0/jcrmiqv4mLeVf5x3qOYy74yaQSMM86BW3ztOBA18G2
	 05zfcJe7QXr9DQxElAznAD0CE5R3GOYQp2Bxk+8rQBFg5pQBFL9kfc2T3Zk96OXvI8H9+
	 dDUchGvLN1VTQr3/QZgZFQDyEkWCz38VIniLZwXBcYsUMxBK/Mm3fdPrHjNCdJgFzId6j
	 6DXlTeQCP+zRmlfzCqMuXVrv1j2aqCBO51xmV6g2NouqpAPetf3XYaMzyoeKg8nvS2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711471;
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
	bh=hJu492Bz+1bV6zohPq15F62HIfB5nY4v588z443NQjI=;
	b=bapDcEsdXdDmsBNhIqemGW4WbinideetUHkThX2s0csoMnXvQ52yqMPxDPryEKnxjqAv
	 JyCpJT/DmUIF279DM7rGa0Wy85frSqrcihObYDA3YrG9jRyfj2nSUdVHYeRCxRGnJSGJb
	 j3tGfEsRIdK/bcLS5JDFvVWrUgJA8dY49xA/KlBjfO3447psoUCCckREj96y4pxxAgZse
	 QXB6FKmQKkMNYNQkYOvy0qm/F8RkxVR1JKDh1BuwXS+RcXW9uLu4afm2ZWjhHJx5nHwB1
	 nrqaqWQVJdaDBynWsIT513T5DGsPPrpQVUa8tlZjdwMQeFsUGOUo4mQ1DlLcU6uljRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGUsq2Z1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C09606D81B
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 13:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C09606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VGUsq2Z1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793711471; x=1825247471;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hJu492Bz+1bV6zohPq15F62HIfB5nY4v588z443NQjI=;
  b=VGUsq2Z1BRmUsVPPZXmD4sLd943bEO29mr1KSmcXz46+6FOtYs15JHyD
   2NF/qEJBh8AFzB9+jJnqQcZETbnFBJh+5YP16+guR7EZNiqutOeT7oKNM
   ablUcUrw6N74AoADl5NkH+iCWpRM3QFem4WtOFifbLPBCxQKyzC3kuGKb
   7xnlM8KR5KDanrbNWc2261HHhOg8SuYZkOkqo1QfjuBedNJK/ceelikCr
   KnaKvRA/8deZhEnXZCWsWB9hXvvr8kkErtmXojp66waebuWBdR8HCZuZW
   2a/oz5C6lU2vPt5TJP2PeuJkF2ynwBFVZ209Jvu4lMBPlnLWq/jNJdHwE
   g==;
X-CSE-ConnectionGUID: R2pi6jbrRR6+GeBbrgWTHw==
X-CSE-MsgGUID: jmVWqg97TiKS7dhynvOGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2318163"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2318163"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:11:09 -0800
X-CSE-ConnectionGUID: 2fSOvRhASNCagCGKfA4H+Q==
X-CSE-MsgGUID: 8cL6IfKMQtSjiybOie7pog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6576999"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 05:11:08 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 05:11:07 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 05:11:07 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 05:11:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7egLim2h3uvevzXiMIA8MQ7h3iclh9pF+8ds9xsb31PCpD2QrTfEhx0JwSHZYo2xKyf62z/4j+t4ve5ipf7B3lvAKYSg9gQJakqa2dEUjAg3dPf4VY8gMMG8oSH03uVFJA8hNCWw1LPcakqHd+mJpxzOoPkWNcqLe04ywEhiBZA93OAi3sD1Aqdrxz/4Gq5zDOw1seTLZGdcF7MJQUWicO2OI5/2Ld85wdktHJeak6eKnO/S0yzaHD0fmWW25bhj0dVcCBA3oEK3laAhrpnpcbCOytpCBV5E2w6euJ/qLoqHlKPb89EbwvmMWwVi8rMLM7JayrxuW48QQk8vMSNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJu492Bz+1bV6zohPq15F62HIfB5nY4v588z443NQjI=;
 b=nTYx7d4+4jS7rHrbbbWXrDSMJFRrHKV0fZ1WcV0r7D4mGNe6MEd+CuqewI0S4rg+bcf5GGe/je5osuNk1lElnn5hPg5BoHL8Fjt2cYmB2xhk/Edq9cx0JU85yn5kBv/14fLxYi15JRQKPtfrKUz2d8dY05xyxcv5VwN+7tAE8GztUv+giW0o6xakjRdhpSge9MpdE1I7H/emMr8MNB2uq4kIkZy09QVbj+SccFNtmI+bmdr7GhYH0yQWw9r5B4bYM8XcxeN7LmNKsANBmYihp8OijyVd7mX9oORvjT6tnBwiCvdZqUcjJ/gqx505lzFA5KybwlzHsoSB+xC39u7q1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 13:11:02 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 13:11:02 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
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
Subject: RE: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5XsnTSswCpUuCn5uop/dh5LcPMKyAgAHkxFCACm82AIAA3qNw
Date: Tue, 3 Nov 2026 13:11:02 +0000
Message-ID: <IA3PR11MB91360A6B4A959FA41F0D1C9592692@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
	 <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <877499ab0c8f3575ac6d424b5be59ff464aa9026.camel@intel.com>
In-Reply-To: <877499ab0c8f3575ac6d424b5be59ff464aa9026.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|MW5PR11MB5857:EE_
x-ms-office365-filtering-correlation-id: 05d42e25-f67a-4f3a-0b01-08df39abe8fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|261022075727099003|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261021135927099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: oqpGAcnz5e6KO4u3ReCGlaT7Zmgw8MWqL7c+j0lEChbJdJsGL2mPK8cwtFGqSKZhxSY7mNUTa7rS+fMHi98g0+sgZroswGWxRUl0WD/Np/5NLP3uKDqyMqyUVWGVWdPi2gX38fRJWAl+VHCjxTMy6A5nJgrmTOafEKogwk9gswuOQTW8zPWrvL/utrnbSlYZTeBrKNbpQtExF2ajzti5E4XcyJxyNqLzCarYydfqPJUkXNfvi1fsYueOUuYv63dUaevr3VQeRcwjLVA+Seyj5wJyT5TQXVZ9rEaV1Uan/L9kRgR/oKr+JIvXAPrehXKpQ8AnTFSEE/ncjQ9tFDr8YwHvrKsW/Xu2HDNjL2xmsQ6rfap8PLjwQq/2/ZFhtHdsntUW3OlcJaW/E3/4l9C9G+SP6dL2R/MR5hGyR1MxBXSD5XWgfT/TfZjRi4lmRULlgnDo47OHRjhbbiD2DoifvP23H+cZcUarPG5OjdvH+rbmZxI4Xiat7/C6bTETuQ5Cltu+hdbhpbcQFYqc8N9xr24dcRHt+7/xO0FPSRsRbNvphALaJ5UfwlcZVR1qPbRFyuyNpLYR7g9MWDFl6eTcCljQw3lDbhPUzPuZ3uThUyJFh0y3EPdgTxPyMGXZ/0UM6WDIfVcxdZsOqMruPTGlIQYEcUBhSa+NUKusOvltoaZMacfk2kGLMZNUJ5UYlbpoWFvqjjNOWBxrYYei6ytKMx2j81tXVEzrv4tfg9ZJcpE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(261022075727099003)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261021135927099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWFrNUZYSDF3YTFVWFhVb2xhcWtZeTdQSkVER1labFg2TG5Ebyt0MkM0akNj?=
 =?utf-8?B?alJUcElqbVptTVR1NlFGMExnNGJ0VTZWWk1TbjY4R0UrbStwT3o5WFNkT3Vl?=
 =?utf-8?B?Ky9qN085OUtLT3N5NHhNekw2Y0c0VmgyaTY0eS9hOTVkZWo3SWtNSUZUeGsz?=
 =?utf-8?B?RHVWQjZYQTg1VitaeGlCSmt4MUtRbTdiZnEwaytkck9KMlVKaE9INEd0WWFX?=
 =?utf-8?B?UmtweGYvNUNtT0lLdHU1NXBzdk9iUHRsU1dITDdYclFmVVU1TDZCb1Y3MFRJ?=
 =?utf-8?B?ckxQQkYyeThMMWF1Zit2eDdXT0s1blNRaGRrcW1IN2Q5cG51bnZBSDMwbFhl?=
 =?utf-8?B?UFM0Nm1nN2J3VER1a3AzSWtuY0pRdFQ2ZzVmRjRneXJGRnhETU9LQzUxZWtS?=
 =?utf-8?B?dW1oSFBsLzZEQ1RSTEVoZkFMSlI3TzFRZzRIcTc3YktCUDdOT3VpQ0F5V1NL?=
 =?utf-8?B?bVFJTHRZQkZIWk15eS9HM1d3c3NYOWs3M1JCWnR4Z09CUE53ckF6S3RUNEwz?=
 =?utf-8?B?SElwZXhPSkE0Skg2UFhRSmRFQmxjaG9YT01uWVZJRklnbzBYTk5Lc01YRjFo?=
 =?utf-8?B?cllxNmhCdlRKS1AzL05RS0ZYaG8rZGIyK1psc2lMRHA0bUN3YnpqZldsMzdW?=
 =?utf-8?B?U3NFRXkwUjFWNzRGVEJod2FPRHRrRUNqNGMxUDcrSlB1R0hOQ3U3c0srV3NO?=
 =?utf-8?B?SlhGWlIxVDNveG43ei9pSVRpTWpvdWpBWW1sSkgycFJHUDJLcWtaWjFETUNV?=
 =?utf-8?B?NUxrR0loNyt5Nk01K2JxQ05qOWlNb0RSdGpyUzhrKzNWT0tlQW9LbnNveGFD?=
 =?utf-8?B?WjI4K3FaaW1sa2hRS2VvYjNzZGo1bFk3VnI0akMrRDI4SjZNSFB4Y3hGdVlT?=
 =?utf-8?B?VUhEODY3MG9kQWpZYlNzaVpUQVZkdkdsMEx1K0V3N09HVFgzdmdIYXFqRVd4?=
 =?utf-8?B?MjZkNk5lTlhHbHFRWmdGNnR1T0h2emg4c0VVUTdoTEJjb1I1WjhFZE5UWUJn?=
 =?utf-8?B?OXk1Y0pqdmhGNXVLcFJGenlhWUQ4UjNZZXNoQ0lySjBTQ1E3K203UHMxMG9E?=
 =?utf-8?B?YnBiV1lkaENvcDNMdllpZU5OQXFtK0FUR0NjZ251UWZlaWVFV05QZlBWak1C?=
 =?utf-8?B?UkpUNGF4OGMrcVFjQ20vVW8vbEpROXdqZUQvVTFKaEpZZExQS08waCt5WDhO?=
 =?utf-8?B?OFo1NEZCekZWazAzcFJjYllZeVcrYi9Remh2WTg4UTYzOUlzZWtDZmtHTHQ3?=
 =?utf-8?B?b2FncHNCTWdkVzRwSzRJSnMrQnpXb0FJTnYrQUtXWHF0RGRSSTdtMU1TVjJJ?=
 =?utf-8?B?eCtieVUrVFlEWjJXUHc0WDAwWENaejZYR0pnVlRCOHRrWGRTZktNakRMVUZV?=
 =?utf-8?B?eFlUSmgxQWNyM2IzMXphbjRleDg2WmpuNjFzaURaM08rN0RSQmdBenlNRnQ3?=
 =?utf-8?B?R25wNHp4YzVEQXVGcnN2bmllWC9haC9wNTdSWEdzK1NFT2RMbTlSa1BOSjY5?=
 =?utf-8?B?TSttaG45RzRsZnZZMnd4NGVMVHhZUysydnh5SEYwY3l6aW80bTc1Mi9HTDdn?=
 =?utf-8?B?WXNvQ1ZUZ1ZvK1VJUHBVT3l4S3NaSWt3Q0ROQnNpdHhFWmZDcTdKTzVYRHRF?=
 =?utf-8?B?Z0hKaXN4MHZRMitMVXU3M1RDOWRVdmI2bVpJL0lyWGx1RENtNmExWkJzd3JN?=
 =?utf-8?B?VzlFZnZLOHpLcmlmVnhaVGtERTVyaWVVeEVuR01tSGdoSlhYaWFwLzROSzlP?=
 =?utf-8?B?N2xLTTROWEdpM1JZeTZwK2kwT0JvZEt6Um5sdFpRR1lFbHE1cXh4cDMrRTRp?=
 =?utf-8?B?dGlteGw4dTJtR29hVUhOL3Vpa1dsR21rSnV4THN1T2k4UHF5QktnQ2xONmFv?=
 =?utf-8?B?YXp0c1dyOENDcFRpbmJhUXFXcWlGdndLSmlsbUlXME9uTHdPdUJweU5SVW5L?=
 =?utf-8?B?NzVDWk9TVlN0Z2lIdlVlVm1JNXc0M0crRjV3alJySUlTbEFZM1hJWnNXeVBk?=
 =?utf-8?B?eUZQdlRrNFFhRkFiZEVkUE1yTTdOS25yUzBjazlsVVc5Wm1wc2hYQW1ldlI2?=
 =?utf-8?B?QkR6RkF6S3lKTklmMU55OVllR1R2V1ZhR3pHQW05YVhPZE1pa3FMenB6OHVz?=
 =?utf-8?B?MFhVNG11RDZtY1l0ZWNnRU1qb0NHaVJNa2lyaDMzRzV0bC9MV2Q1WU5FMW5Z?=
 =?utf-8?B?RTV1NU4zdUpndU9HS2RVL08rRStkNEFocWZJR2VuNURwei9mcytqS0ZObUVI?=
 =?utf-8?B?b0dMTE1ZSnp1c1FwUHdwL2t1N0FPYjZmTTk1ZVpNeWtuZ3JKQzFidFdrbzRn?=
 =?utf-8?B?T3UrWXRWd2ErUHYyc3hkSkM5SU1UMEUxZzB6QnZSYytMMDRvaDhRUT09?=
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
X-Exchange-RoutingPolicyChecked: rYnN1JUj5AV4wS8jSW2Gm9B8X7dLY9sB27NT5GtmCA6GFhCpc4fFwBsiAVs8GDuYAMg16CgxJm8Lldg+ML8IbXfJz8r+MJ4ML4d1Jxv10FUBWPe6+7Bkj5wDYdbs9+7NdfMKCpzZ0jXeIXvUA3xAfJWsxBtOv/yyRHU6r++64yPtlipqpOvYT6plgijstg1PW4YCwEwBF8mdFTXiSe8zsUgHE23HlxfKmu2Zigw0QmJcvUINshWdJCIquinRhuC9Ywv+B2e0ohwQL8wcR/gd8+qznMPy98q+gjisiw1qGJqCArqv9D82kUkUvNGYWuTAwdz1o6esQdgTAUPY8FHs5g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d42e25-f67a-4f3a-0b01-08df39abe8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 13:11:02.0545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PxrYlnEWLhcMqNhpjz8LrBXjk3jQTibD8rh4r/to+G4eHiBM5OjBIF3UU6JsX02EcXSAr0IZjo2wP0EWtglWwblrNy6XpPueRwas15bUuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5857
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
My8xNV0geDg2L3RkeDogQWRkIFRERy5UREkuUkQgbW9kdWxlIGNhbGwgd3JhcHBlcg0KPmZvciBU
RFggQ29ubmVjdA0KPg0KPk9uIFR1ZSwgMjAyNi0xMC0yNyBhdCAwNjoyMiArMDAwMCwgRHVhbiwg
Wmhlbnpob25nIHdyb3RlOg0KPg0KPg0KPj4NCj4+DQo+PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+PiA+IEZyb206IExpLCBYaWFveWFvIDxbeGlhb3lhby5saUBpbnRlbC5jb21dKG1h
aWx0bzp4aWFveWFvLmxpQGludGVsLmNvbSk+DQo+PiA+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENI
IDAzLzE1XSB4ODYvdGR4OiBBZGQgVERHLlRESS5SRCBtb2R1bGUgY2FsbA0KPndyYXBwZXINCj4+
ID4gZm9yIFREWCBDb25uZWN0DQo+PiA+DQo+PiA+IE9uIDkvMjQvMjAyNiAxMjoxMCBQTSwgWmhl
bnpob25nIER1YW4gd3JvdGU6DQo+PiA+DQo+PiA+ID4gSW50cm9kdWNlIHdyYXBwZXIgdGR4X21j
YWxsX3RkaV9yZWFkKCkgdG8gcHJvdmlkZSB0ZHgtZ3Vlc3QgZHJpdmVyDQo+d2l0aCBhDQo+PiA+
ID4gc3RhbmRhcmQgaW50ZXJmYWNlIGZvciBxdWVyeWluZyBzcGVjaWZpYyBtZXRhZGF0YSBmaWVs
ZHMgZnJvbSBhDQo+dGFyZ2V0DQo+PiA+ID4gVHJ1c3QgRGV2aWNlIEludGVyZmFjZSBDb250cm9s
IFN0cnVjdHVyZSAoVERJX0NTKS4NCj4+ID4gPg0KPj4gPiA+IEV4cGxpY2l0bHkgbWFwcGluZyBh
cmNoaXRlY3R1cmFsIFREWCBlcnJvciBjb2RlcyBpbnRvIExpbnV4IFBPU0lYDQo+ZXJybm8NCj4+
ID4gPiB3aXRoIHR3byBoZWxwZXJzLCBpbnRyb2R1Y2luZyB0ZHhfbWNhbGxfdG9fZXJybm8oKSB0
byBoYW5kbGUgZ2VuZXJhbA0KPj4gPiA+IG1vZHVsZSBjYWxscywgd2hpbGUgaW50cm9kdWNpbmcg
dGR4X21jYWxsX3RkaV90b19lcnJubygpIHNwZWNpZmljYWxseQ0KPmZvcg0KPj4gPiA+IFRESSBy
ZWxhdGVkIG1vZHVsZSBjYWxscy4NCj4+ID4NCj4+ID4NCj4+ID4gU2V0IGFzaWRlIHdoeSBtYXBw
aW5nIGFyY2hpdGVjdHVyYWwgVERYIGVycm9yIGNvZGVzIGludG8gTGludXggUE9TSVgNCj5lcnJu
bw0KPj4gPiBpcw0KPj4gPiBuZWVkZWQgYW5kIHdoYXQgaXQgYnJpbmdzLCBJIHRoaW5rIHRoZSBj
b21tb24gZW5hYmxpbmcgb3JkZXIgaXMgb25lDQo+cHJlcA0KPj4gPiBwYXRjaA0KPj4gPiB0byBp
bnRyb2R1Y2UgdGR4X21jYWxsX3RvX2Vycm5vKCkgYW5kIHR1cm4gZXhpc3RpbmcgdXNlcnMgdG8g
dXNlIGl0Lg0KPlRoZW4NCj4+ID4gdGhpcw0KPj4gPiBwYXRjaCBpbnRyb2R1Y2VzIHRkeF9tY2Fs
bF90ZGlfdG9fZXJybm8oKSB0byB1c2UgaXQgYXMgd2VsbC4NCj4+DQo+Pg0KPj4gSWRlYWxseSB5
ZXMsIHdlIGZvbGxvdyB0aGlzIHdheSBzbyB0aGF0IHJldmlld2VycyBjYW4gZm9jdXMgb24gdGhl
IGNvcmUNCj4+IGltcGxlbWVudGF0aW9uIGFuZCBkZWZlciBjbGVhbnVwIHRvIGEgbGF0ZXIgc2Vy
aWVzLiBXZSBjYW4gcmV2aXNpdCB0aGlzDQo+PiBpZiB0aGF0IHJ1bGUgY2hhbmdlcy4NCj4NCj4N
Cj4uLi55b3UgYXJlIGdvaW5nIHRvIGhhdmUganVzdGlmeSB0aGUgd2hvbGUgdGR4X21jYWxsX3Rk
aV90b19lcnJubygpIHRoaW5nDQo+Zmlyc3QNCj5hcyBkaXNjdXNzZWQgaW4gdGhlIG90aGVyIHBh
dGNoLg0KDQpXZWxsLCB0ZHhfbWNhbGxfdGRpX3RvX2Vycm5vKCkganVzdCB0cmFuc2xhdGVzIFRE
WCBtb2R1bGUgc3RhdHVzIGNvZGVzDQpudG8gTGludXggZXJybm8gdmFsdWVzLiAtRUJVU1kgaXMg
dGhlIG9uZSB0aGF0IGNhbiBpbmRpY2F0ZSBjb250ZW50aW9uOw0Kb3RoZXIgZXJyb3JzIGFyZSBw
YXNzZWQgYmFjayB0byB1c2Vyc3BhY2UuDQoNCkkgd2VudCB0aHJvdWdoIHRoZSBsb2NrcyB0YWtl
biBieSBlYWNoIFREQ0FMTCBhbmQgU0VBTUNBTEwgYW5kIGNoZWNrZWQNCndoaWNoIG9wZXJhdGlv
bnMgY2FuIGNvbnRlbmQgaW4gdGhlIGN1cnJlbnQgZmxvdy4gSSBmb3VuZCBvbmUgY2FzZSB3ZQ0K
bmVlZCB0byBoYW5kbGUgbm93OiBjb25jdXJyZW50IFRERy5UREkuTU1JTy5BQ0NFUFQgY2FsbHMg
Zm9yIFRESXMgdW5kZXINCnRoZSBzYW1lIElPTU1VIGNhbiBjb250ZW5kIGZvciBpdHMgZXhjbHVz
aXZlIGxvY2suDQoNCkEgZnV0dXJlIFRERy5UREkuUkQgcmVhZCBvZiB0aGUgYXR0ZXN0YXRpb24t
aW5mby1oYXNoIGZpZWxkIGNvdWxkIGFsc28NCmNvbnRlbmQgZm9yIHRoZSBJT01NVSBsb2NrLiBX
ZSBkb24ndCBuZWVkIHRvIGhhbmRsZSB0aGF0IHVudGlsIHdlIGFkZA0KZ3Vlc3QgYXR0ZXN0YXRp
b24uDQoNClNpbmNlIHJldHJpZXMgYXJlIG9ubHkgbmVlZGVkIGZvciBUREcuTU1JTy5BQ0NFUFQg
YW5kLCBsYXRlciwgdGhhdCBzcGVjaWZpYw0KVERHLlRESS5SRCBmaWVsZCwgSSB0aGluayBpdCdz
IGNsZWFuZXIgdG8gZG8gcmV0cnkgaW4gdGhvc2UgY2FsbCBzaXRlcw0KcmF0aGVyIHRoYW4gaW4g
d3JhcHBlci4NCg0KPg0KPg0KPg0KPj4NCj4+ID4NCj4+ID4NCj4+ID4gPiBVbmxpa2UgVERHLlZQ
LlZNQ0FMTCBiYXNlZCBoeXBlcmNhbGxzIHdoaWNoIGNvbW11bmljYXRlIHdpdGggdGhlDQo+aG9z
dCwNCj4+ID4gPiBUREcuVERJLlJEIGlzIGEgbW9kdWxlIGNhbGwgKG1jYWxsKSB0aGF0IGNvbW11
bmljYXRlcyBkaXJlY3RseSB3aXRoDQo+dGhlDQo+PiA+ID4gVERYIG1vZHVsZS4gVGhpcyBkaXN0
aW5jdGlvbiBpcyByZWZsZWN0ZWQgaW4gdGhlIHRkeF9tY2FsbF8gbmFtaW5nDQo+PiA+ID4gcHJl
Zml4LCBhcyBvcHBvc2VkIHRvIHRkeF9oY2FsbF8gdXNlZCBmb3IgaG9zdC1kaXJlY3RlZCBoeXBl
cmNhbGxzLg0KPj4gPg0KPj4gPg0KPj4gPiBJIHdvdWxkIHNheSB0aGlzIHBhcmFncmFwaCBpcyBu
b3QgbmVlZGVkLiBJdCdzIG5vdCB0aGUgZmlyc3QgcGF0Y2ggdG8NCj4+ID4gaW50cm9kdWNlDQo+
PiA+IGhjYWxsIGFuZCBtY2FsbC4NCj4+DQo+Pg0KPj4gSSB0aGluayB3ZSBuZWVkIHRoaXMgYnJp
ZWYgZXhwbGFuYXRpb24gZm9yIHRoZSBoY2FsbC9tY2FsbCBuYW1pbmcNCj5kaXN0aW5jdGlvbi4N
Cj4+IE5vdCBhbGwgYXJlIGZhbWlsaWFyIHdpdGggVERYIGFuZCBrbm93IHdoYXQgaGNhbGwvbWNh
bGwgbWVhbnMuDQo+PiBJJ20gb3BlbiBvbiB0aGlzLCBpZiBtb3JlIHBlb3BsZSB0aGluayBubyBu
ZWVkLCBJJ2xsIHJlbW92ZSB0aGlzDQo+cGFyYWdyYXBoLg0KPg0KPkkgdGhpbmsgaXQncyBvay4g
TWF5YmUgbWFrZSBpdCBjbGVhcmVyIHRoYXQgdGhpcyBpcyBleHBsYWluaW5nIHRoZSBwcmUtDQo+
ZXhpc3RpbmcNCj5uYW1pbmcgc2NoZW1lcyAod2hpY2ggSSB0aGluayBhcmUgYSBiaXQgY29uZnVz
aW5nIHNpbmNlIHRoZXkgYWxsIGdvIHRocm91Z2gNCj50aGUNCj5tb2R1bGUpLg0KDQpXaWxsIHJl
cGhhc2UgYXM6DQoNCiJUREcuVERJLlJEIGlzIGhhbmRsZWQgZGlyZWN0bHkgYnkgdGhlIFREWCBt
b2R1bGUuIEJ5IGNvbnRyYXN0LA0KVERHLlZQLlZNQ0FMTCBwYXNzZXMgdGhyb3VnaCB0aGUgbW9k
dWxlIHRvIHJlYWNoIHRoZSBWTU0uIFRoZSBleGlzdGluZw0KdGR4X21jYWxsXyBhbmQgdGR4X2hj
YWxsXyBwcmVmaXhlcyBkaXN0aW5ndWlzaCB0aGVzZSB0d28gcGF0aHMuIg0K
