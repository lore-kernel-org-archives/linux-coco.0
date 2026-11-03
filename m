Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793695804;
	b=VbLTtcTo46BmUEHUYUauhrlZVX01mHJ3e4WnuPvN+GqrMiCOtvVSfi3zzOZ/coRSzdNY
	 0WwY51nNUKsFbaJV7yC3rRERHDoymbz6788O9d7SzBTWtMVi7QaaQbAyYaYvQ5CYNkgrs
	 t8n6WJsrtokOJu4duE4Hhc3iUezvd79CygvBqpFBVWDHzjgebKl/jcEW5njyJxQH1W+5h
	 b7fbi3CLtQBAZb3OCB7d9syl182I68vGcAHui1j4Yp8+cDyJC3rUKtlrj4tRCX5+5k9nZ
	 zqhHWmm4IXzak0w56R9cKHHzmAeiNJwmy/Nl7oX4RL15Bv3i2mZwJoNUALxPIXI5PXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695804;
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
	bh=sUs4JX+HSChLsfAZPDdVpAo1vb3ivpcKHGQX3zq/SR4=;
	b=asdOyb9brcMurSeKvekFRORepxjcPT9hLZl1Yq6hpmOXD5NvSehkRsm4A1BtOgQwlwno
	 qxgqHBp8h2t9LoLtmPwfNfOs9m0+HbN7AxkUngjed+Loyorw+3QiXZFeXPSdQy4hmLp1H
	 9JPWLk9/9qwGUQiXMttVKx4zcFAnf7zFQAu1q7f7LqW41XVbVZIJnb91aBsfCpZSN5/JK
	 bBg0aTFGBx+Gu0Ub3KfMavPHhAwLnQtnX9GiAJRw3DdX8cH3Bjw/XKLrQHI8C0mC58KNC
	 EWfhVv30Ah0ibbYcPFCoTS1L0kn1zlm7hMIITCiBIqh1W980vD5liLjpwV4x43r7Pww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6PlQrnE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C77606A324
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 08:50:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C77606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G6PlQrnE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793695801; x=1825231801;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sUs4JX+HSChLsfAZPDdVpAo1vb3ivpcKHGQX3zq/SR4=;
  b=G6PlQrnEM8LJnWqxIwsZ2AnVNX+smsPvnr3r27xaKCbTqKO3Pq1btrFQ
   1LX+ihyAMzveAWn6ZAXSAA/sVElA0Xuyh16AAorEJtuPHf2h6BKKGbPQu
   Ts0wrVHncT81ghWpAbS8xszIM8GBym88bmbJKSZFC4o2j1TzOkc9ps0a8
   VFBk7c4svpQRwrbUFUoT/Jag9lzP2IaPmHQLsDE/ZqEMGvlBDhi1hMPq4
   pgwQwprrg27fwImU+Gs0wwGUxC2CUkxf8EU39tYHsVU+bvTJmPtjY/EVl
   6d2cBB1FBBhv4LXrTQnttXySdNhCWSwUGx1L3RfsVsDu0lrq65RQR06w3
   A==;
X-CSE-ConnectionGUID: krYG5jKQSq6gvBXiz7hMhg==
X-CSE-MsgGUID: uMTiYg4xS9idpDFd6Lqwrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2500785"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2500785"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:50:01 -0800
X-CSE-ConnectionGUID: MnYHdF2uQz2yamj5qszBKw==
X-CSE-MsgGUID: 6iMD02luRR+hK9DCh0vnzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6359914"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:50:01 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:50:00 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 00:50:00 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 00:49:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwJuSOIcAa9UYFnGxDy4mY2wVDmXKt/snBX6+sshoKmoMIe48dOcmP8kjw/ArW7E0wOs9q9/EJOqumBXNTCsIPAeNYdz+SkXdUtCPRaHiialH0XwUiKf9K7562mQMLR0YS6iH7vrAbth9PbgILVc6/n3j6z/O8qOGxp3m+rvhlBGDd/9b+KsEenbo8qucpZ3ctK2p0MV32Fq5c6Mi1SVU+sjIuIb7XKnp2OP3J9P9OZ+bFsaU9MsT2zliUVo9jMA4qD8/g7eanvaTtgMqBOb8d/boylMHfWCd1mhIbuPfe8G7zc2fa4U3FdL1a4Ji5jb21PsBTwbMd8Y185Fz7Ggcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUs4JX+HSChLsfAZPDdVpAo1vb3ivpcKHGQX3zq/SR4=;
 b=t0zjIeY+n+1hQ2e+yf3UDJlNjZLsAo/lUcQJZurvGbUCMoVbrph8zJVUy1vAKZWNtKJfQaQcYHC/UDIsrb+RJDMHqlccWxSaQ13Fka2ajQx4qo+1BRTep6RDqHDB5lS4z+q6pvFRd5nOAaEnJAMCH4V2EN7qvgi1nVS95EVzBpNN9Q9EW3pUbSz6XTpAeheGgEOzwFzBsw0yu9W0vyeyU3RbnjBFGYX4rJSvCEpySGojzl3f5zvsxp+t3QHSOsNwdZ4Vt5sAHODryoLQFOMiHWYgCNlBZImsDoWM0IAvHfI6d0/ErKs4IdMPIgWAbuO4Dm3ngx+AJ38cRP2GoEIrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH7PR11MB8571.namprd11.prod.outlook.com (2603:10b6:510:2fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 08:49:57 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 08:49:56 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMCACwdhAIAB6v4ggALZp1CAB3RpgIAAwCFw
Date: Tue, 3 Nov 2026 08:49:56 +0000
Message-ID: <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
In-Reply-To: <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH7PR11MB8571:EE_
x-ms-office365-filtering-correlation-id: c8dd3b90-184d-44f1-76a4-08df39876fad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261026121527099003;
x-microsoft-antispam-message-info: eWj8Q5boUlSfGNVViYVz7YksnJMRbMOxMjd8NkVBCCoypNss5cwSnaMMG/CtNKa9e2meN5riu4QqDEUW3q+xdzlwT2jS7MdCwsy/L0v9wy++rLj+dqGKMojMvaJhugMHIfdmIY6SSkszg+lG5j9YIYvv5MOIguSK0d1Ix5/YYxe0bByapZtF1JR5txN4as0oDSue+H5bIeDaghkv/FsTkVgdgg1OQOBUNIOVVS/RpVpoGZb24G5kRLHCcHe4/20cS2aurccYBng4pD7Svp627RbqchhWhs4MGNUCHWmE4QwIFA7+kb0VUG6tH8AQf111sdehlMEHGzuQtX+RqcNITzklNi7WD/OV0NN7QOmBbiirpRUixvNVSFEnMRgEQaqO0gFlTnmz21GAfCbj7GcDQFO28kef1RhONEiDxb6DpsH6QJoyEmWYLQpBx6SMGbmAAj/Dq4mXpZcmAI8nRez0voJW2LonmdTgoNlpd2I1SrkH8cH4MfZ92qcSZDlKMXy2XBRRe4B4tRSXMy5TpZZiNGR3k2Qv8oIoQB9UYI+3kxlqeHWP/lxV43O6hgK4Cl3I7bJNTQhAyF7fyFrpJ9j0Lc5oVeah+n5Rkn4wXaRockQ+hMH6b9d1KRb8Nv6Niv270+oOpUHPTRPPEQaoRnC5xwVOBIXTASKo1LDMPY1N463BwcTQvc0KJfg9r/onfb8581b9se0Nq7K3wFkrWHrvmCAQme6cRtV6B4mAgPWBYSY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjRVMjl1WmlscmdsUHd3SjdTU2g4ejF5VTcyRWxycXR5K0RRL3JUWWg4OXIv?=
 =?utf-8?B?NWMrc0h5Tk9XTjdJOVV1YXZURmN5QzRlZmdlTC9YbUhKK1FKNWgvVTVqUzJZ?=
 =?utf-8?B?Vmhmcys0cHVXMVNwRWtENzVmSEZJVTZBN1UvQ3JmSVJvS0lqSmpRR0V5ajgx?=
 =?utf-8?B?c2dMYndKZ1JlZmcvOTJkdytUQTFxSnQ5Vk1VUi81bEdkKzY5aVdmYWU4a1Nl?=
 =?utf-8?B?VklCaG5oQjBJNjBTYkNUZ09IbHlBOHVwWGYra21XdE5YbVZrUHR1UE5CUlhJ?=
 =?utf-8?B?QTZ2QmdxbDJtY3BUZEU5MHM4bUV2R0xCdVNuVk44ZnRsWTVhZ3NsWGR1WFMw?=
 =?utf-8?B?V3dhSysyeTF1SERrTmJSbk4wRUMyWUQ1b3NILytJVXJiazI2U09qQk9UdFR3?=
 =?utf-8?B?Nks3RTQ2L0VMTEV1eG5zb0EraG0yanRxYzFHQjZnTWFJMm41dThGYXR2cUFF?=
 =?utf-8?B?cDAwQ3lyelB1UTFwc3FWajZpWXk2TTlxUlY1SkNSNC9WL0gxUHZDZVRhQnZ3?=
 =?utf-8?B?S09wcUo3OGQvS1duNWV4NGRqUUE3MEs1YmowQnpxemdKQlFkNzUva1UwMkMr?=
 =?utf-8?B?MnN4UXBSZkQxSndwTURZR1NtaXBVaVdCdExPbFpLNlFxZHZwczNyWXFqYTRy?=
 =?utf-8?B?VVlNaFJQbDhYd3FubFczcy8yb3IvVU1CTWhmZEI1TldhT1lJUlJxdTdLeHI0?=
 =?utf-8?B?dnN4TGdadDA2ZzNoSnNzZE1lMUdxUFpmYjNSSlZFSGRtMVFyNnpzYmJMY1d5?=
 =?utf-8?B?M3lWMkkyOEhZeXB3TnZFRzBNRmZIRDB1T1B4UHplWHM3TzlpZnZpTXRJSXZL?=
 =?utf-8?B?VVp1NEw5bUE5cjJlK3QxaVZFeHJhTVk0NGQ5cnpTOGEwblc2TnkwNmJPcVBD?=
 =?utf-8?B?YThsalpsTE1hWUwzR1orY1dVajcyTVhwMUpxbTlHa3hQUDFFYTF1ZmxpUE9W?=
 =?utf-8?B?VWExc3BXYkREellMN3ZBY0R1TlU3SGFFeitERDZpOWNpNGU3OWg4aWRudC9v?=
 =?utf-8?B?dDV3c3Azcjk4WUtoTlo3anNRRXVBdDdFL0E2QkxRYXlLbFVSajFvb3p1WXdK?=
 =?utf-8?B?L1RRMVRLcjhNS3ZaR2NQYWNhdjE5TnNVQ3o3S05NTGw3blBzeDhKRFNuTFNY?=
 =?utf-8?B?QkZYSjExa2dYQmhwU0dDU2wyL3NBSGZSSTFqaU8zQU4zNW03V3FYVXV1dm1F?=
 =?utf-8?B?bk5MTlJ0MGsvK0pPMCtHZHBWWGdGUkgxNkU5eTF5SXJXUXh6RHA0K0U0VUJx?=
 =?utf-8?B?b1lqNURtb01qZzRUYVlKQnJhdkhBa1BjaWJNSzhHNXBBYytIODBkOGJZS3VL?=
 =?utf-8?B?RncyV3NZL2NsUEsxRmlKTEtTOXRzNSs5elJkbE5ScWlIcE1kdWs2ZEdVT1lz?=
 =?utf-8?B?azFLemIvZ212Uk4zZ09waHNjdk9PdnR1QmhkSjRTZ0x3Ly9pNXlIK2RIVXNT?=
 =?utf-8?B?QktlQmlyUkUzUDFlNXZSbjFDTEFOVlA0cVJPQzhBYUhHam9oNi96dDRXQm1n?=
 =?utf-8?B?RjhuTVZvRVZJV0NhcU5ySEdWY3JyQnBPaThnNHhzOUl0YngwZFJKSUh4aDdH?=
 =?utf-8?B?bytZaTcyYkpIV3lrdjkyZFVnK0tJaldzbGpYclN2WC9TNnFmc1RvWm9OYWdu?=
 =?utf-8?B?VHZrelEwM0o4c0ZYK21YYzBNQWsxWlZ4ZFMrc2NoQlI2clRraEhDNzcraS90?=
 =?utf-8?B?STFaakhkTTExS0pTcTIrZmdYUnF0QzBLVk5jNm1SMzR5ZUFBeEhtcHNyQlJq?=
 =?utf-8?B?VmhZbkhBMFBDNExITTRmU2tqNWorYjIwTEI1Zk5MOCswbnRQOVJCeHN3ODlS?=
 =?utf-8?B?eFB2ME1KVlMybDMrQ3RRZlVNTjdyNHFNRFlDb0NVL0tNYWFmM3pjYXZEUlZE?=
 =?utf-8?B?WXhTTHcyRTRTK1BYY2ZzL1RWaERkTXI2TDdTMVo0ZDBMcExHak05TEd2SzRL?=
 =?utf-8?B?WnhOMVVLY0lXTTJ4bkhSWmZZUFlreVRXWjZ1T3NTVDh2dWNVSm82Q043Y2lB?=
 =?utf-8?B?U1hjQUtJaWZDYWh4dlBsaElBODhSUmw5bUdERVNCNTdGOGd1d0taRXl1cU1O?=
 =?utf-8?B?RDBLK21pRWlYTnIrbE9TMnp4ei9QUmkzSXRZZEY3b0l1YUI3RGNSUVFxRHhJ?=
 =?utf-8?B?MXFpRkpoM3FBeG8vd0xyZHgvdFE1V0JWdjRlWjEra2hEYkcvUUs1QzlZYlpP?=
 =?utf-8?B?RDVtVXZOYitGOS81SzVGeUZlSmNJYmVRK3lvVWxhK1hEcnRWaUdUUkpLREtR?=
 =?utf-8?B?MWI3T2tPOXdqRVFmdFNLNFdjM1hPS3pNcDl1T052YUpySTlDREVwU2hZS0hm?=
 =?utf-8?B?YmhZMVJOTVE3U0FWNmJzMGgvNHpDdGticWxFRjZGZjRpUGduTUpmdz09?=
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
X-Exchange-RoutingPolicyChecked: RAfIomJxKlI1TRPIUzZlpyuBRGqVwcnSLIirmF7NdbaD8fkAe4ri9Oh8EzLsLInw70z1yAvZKUfbJlwT+JxOUi8rYKGmRPjPuTjiVpANboWNDTm8cHeNYsu5MxtSDVjIVqGNl4S1NKCFugZy113X/c5NgqxCB9ipLs64aVGCbUFQCHobQkPSNpRXZZTXUhV+T4jW/L0tKVIeXI+JLxiFFgMpD3dXB5XLdr/N5eH7aeqtvP9emSgA1AQpdnX1pVSA9GQEwXij7MC4DkuFPvVy1ZbYXRjcewtA4xGv8EvwHs0uMO1C4sbVJudzRYKYr7dFETataE3ksF6jCplQwiTLRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dd3b90-184d-44f1-76a4-08df39876fad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 08:49:56.5822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4exkek7QqLC70Ycal3jRNLzAyGb08mp2WxNGmkdOLYkqmTcDH+m4FrZqyQUioOXMeUDSu3rWCVswULmfAN3IPGeFNs0B4D/jLcahqqsGso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8571
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5PbiBUaHUsIDIwMjYtMTAtMjkgYXQgMDM6
MjYgKzAwMDAsIER1YW4sIFpoZW56aG9uZyB3cm90ZToNCj4+IEkgd2FudCB0byBkaXNjdXNzIHRo
aXMgZnVydGhlci4NCj4+DQo+PiBJZiB0aGUgVFNNIGRyaXZlciBzdWNjZXNzZnVsbHkgbG9ja3Mg
YSBkZXZpY2UgYnV0IGxhdGVyIGZhaWxzIHRvIHVubG9jaw0KPml0LA0KPg0KPkNhbiB5b3UgZXhw
bGFpbiBzb21lIGNvbmNyZXRlIHNjZW5hcmlvcyB3aGVyZSB0aGlzIHdvdWxkIGhhcHBlbj8gV2Ug
Y2FuDQo+dGhpbmsNCj5hYm91dCB3aGV0aGVyIGl0IGlzIHJlcXVpcmVkIGZvciBhbiBpbml0aWFs
IG1pbmltYWwgc2V0IHRoYXQgZG9lcyBzb21ldGhpbmcNCj51c2VmdWwuDQoNCkkgY2FuIHRoaW5r
IG9mIHNvbWUgcmFyZSBjYXNlczogdGhlIFREQ00gaHlwZXJjYWxsIG1heSByZXR1cm4gYW4gZXJy
b3IoZS5nLiwgYSBtZXNzaW5nIFZNTSBvciBUREkgZGV2aWNlIGZpcm13YXJlKSwgb3IgVERDTSBo
eXBlcmNhbGwgcG9sbGluZyB0aW1lb3V0KGUuZy4sIGhlYXZ5IGxvYWQgaW4gaG9zdCkuDQo=
