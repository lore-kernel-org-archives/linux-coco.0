Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793654345;
	b=sSOK5VYG5deNAYjLBxdyi/ZpJmQPSUcHqtalEUq0sqxNdgPhF6titrcZCahylHNNjEj9
	 bxSX86w02zMNVmIjoo9tXkw0EYDl8xu3gfz4pY7GsLuy/gwTIio7dUbFCdlMTeOVhctEU
	 kRITQ1nRGAHdse1LjhVLuuxs82973ERAHoN0GB8RgVmwbPYSFOTztcHtQSGEKGCqQYGqq
	 NCzfSyEuJsr5dYE2ZCGCfUfXdBlEeHEhSA7AIlPqfrWWZxGIEck9XpszVryFhG6uJQna8
	 FnCk/hZfBRHmNoS4ZWH+otM6GtFYN+5yaE9Tnh4127QITj9M2knKlFDnFvaRvqv2NuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654345;
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
	bh=Iy+GNXO8S0EJBH23OON25bElzI4Db0VJmY8fUkvmKqE=;
	b=V1vbZIT5qLY6rTeX69qnnMKXwxPpn6nV/PrCWOWdo7RthzVRTsBpwhmR6uQgC7HGqxM3
	 i6igCY/z3whmiC7iOVX/HXCJht26PwJyJUjQktbxeJCRAby44Y+z0ZAiS99VI6DwwfZLu
	 sqrxPB5ClxdAlUASNIx+eRYcZQ5lmsSZwFHHTsgG5Bcuy0DTy/fjNw2qeNu+JAWc8gyPA
	 38w+fRtaEr3XSfVuL3dxfkcG5PtzW6uFgb+P1nVu1hrXxnjT18klu/18ZGdqQO8tVPbgd
	 C+JW7B3EV1IhWzUdmABVppTE/hCUfFX7AQw5BktE9P+yPuwRjqcq7sxtSHHLQwBw6NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dJBMYDo4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642B606A326
	for <linux-coco@lists.linux.dev>; Mon,  2 Nov 2026 21:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D642B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dJBMYDo4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793654344; x=1825190344;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Iy+GNXO8S0EJBH23OON25bElzI4Db0VJmY8fUkvmKqE=;
  b=dJBMYDo4AXQ5hnca0eutVG1w1ltlUAB4jl9hV0kDFbHuXaoSMN9PUbwe
   kpFCGvFPtzbNv3CW62J9Q/7Su5M2ctnubQypm4J8+CHliPO34XUxGoa/y
   I/61xroaVApYMqSEzZO9SqHMw6lDac82O3iQyQr+w9y4PnWgZ6Km2Vtx7
   NAQ5NSxqPfgPr+zBgL9j0RVshB+zSBjs6a1Tyjc1LJ3vjBiTcUrKqIi2B
   a9yobCd4n0PBA1CGe1+Ig+Ly9w0DBxSTP0yXKOSUfoQpQIK1NrvX8Y6HW
   Hq6prBpEkSXdhHRZokqzyXLQoGO0nhFtyoRuN7LWHP1LaJc7fQbI7Vw5q
   w==;
X-CSE-ConnectionGUID: 1DgDYhxwSP6m5cjIO+xtkw==
X-CSE-MsgGUID: KxZtsWLiSOOee24eZwVEoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2242514"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2242514"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:19:04 -0800
X-CSE-ConnectionGUID: sm364FZcSdelmIWZ5pin9A==
X-CSE-MsgGUID: y21U60TiT36xEfpVA+KH7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="8062216"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:19:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:19:02 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:19:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:19:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maBELF/1wbDaw9TE1aswhlpUrS1Qdn9a6yAIA75J+2zWwfQijOY1TsUJl4qxuVDO6gysU2pAirxUhnQN0xQ3L+qx962nEz9T0uU/PtSLlVVsPprIKVf3iyzz3sUP2eLr/ytLTXZl9+W+uLDuTyuccN4vmjMwg1WxYVgdWvhFS5I561XKt9NNP3oD2nSSwAg1fvtzlR12S/0NDBuypAnyXFsygXzZnp0SGk2VDfXdR3Xt/1/i0MWMeDEsZy1S+dDkjB2fXHHCP/mcR5Gmoj2X/j/rL1Ch2JdXhMJ8xsMKlH1AHGsYngSKBpCqK8peXZRXebupidx2FpxAE/3vyTRaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iy+GNXO8S0EJBH23OON25bElzI4Db0VJmY8fUkvmKqE=;
 b=hAeLoiO4ne7mfiA+USlMcqi/YJy68kVtQ6kDxmPN0HYZ0LSsqVSOAr0NOAlbUBshj8hi58yJV1VEWXNYJ+IpC/I4g9WIhg7Z82ZyF+KTdDQ648ZWCv4hs/GTl9L2N8ff6OUgtlJxGItDGATV7yj2TLgeFbV/RFZzMTPX2gcmpbQX4DVI5YGsfYck4LMtG3bGuUv7CyLwVAvw2b8JoJXsxebVPolt8tx3OlG7tb5tSN2LVyFBGPxWA/PcBlfTBaavkit8uxoKubFtnGg62Lc12GmUid9fmR0EX5yIvOSg+vTGAL7RuJBhVwY/fH2fAKdbDYdT74NWwx1FLMGhhhmLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SAWPR11MB9548.namprd11.prod.outlook.com
 (2603:10b6:806:4e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:19:00 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:19:00 +0000
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
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Topic: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Index: AQHdS9rNF++PSNGXuUGGFGwkpIea87cPd0SAgAMIjoCACQgFgA==
Date: Mon, 2 Nov 2026 21:19:00 +0000
Message-ID: <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
	 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
	 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SAWPR11MB9548:EE_
x-ms-office365-filtering-correlation-id: 8be2bb41-0d7f-4df4-c677-08df3926e9a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|261021121427099003|261022075727099003|38070700021|261026121527099003|11063799006|4143699003|56012099006|22082099003|18002099003|261102123227099003|10067099003;
x-microsoft-antispam-message-info: 2C4Pc/VI/321Wl+0TtJIytCg/GT6prx0zjUshQy8Y2ujbQTr9HWQ9cmfn41INkNQWglm2uYmmfJkxLXyhRxdkILqsNmXj5MK+/t7B/6vuKmskysOQM/tsmpXQmnulwmEC1rtwPlEKuSKdcQxBU7GRkKBB+YN+7ZomCl2PmdLCsPQ+8n45o454knMfE/vBCMYfXz5b3RQz9+lDcSOTh161iGxo3PT3QeNkS5Kij6sv4DIsfTWveeb6xeiSTk18ZPLXoinpAaeR42fQCQBCT2cpyOW2JNpUzI88CRvi4v9T8Y4ITxYFfZ867diq8pyAp9hU1yRbBrpIBs5lsSfvFatA71sE4bwCOLOVqaBZpnpBSop77FdSX71cQOb0MdIKgr+shPaIm2bD3qm3Nhr7lxHmwI/Eu9VpC3S2/scitNulv/fOlv6xSYxjI7aFRglGpeg6TRu3q0J2/ap9Yzi+EWYbYxNPKAORjHI3WShUojnDtKTFYAn32USNTlSU6SVIcXhVC+8jedESsv5wSQxRADS+e/biBWPtrK/OTVRUQNod3jXBUzoNmdLQR1hNyVXuqoTQIIn81Uk3lNqG9NEbLPCRppu2NCXoMLzpX7IDZdecX6CSIEUpIJRabSe6rf4bgRAugV9zAeNveDs9Tph1CJDMTfHc+hCil9q0TbpsMwF4DJ/hHxMoCA5IPv07QQXJAaK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(261021121427099003)(261022075727099003)(38070700021)(261026121527099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDJkRmNxUFcrWjBlVWRHRlRHWlZ4ekVReS8rRGQ5cm1wQVRzckxucmdiRytt?=
 =?utf-8?B?RTJiU1lFZmNRQ2UvTE83Y0h2cExlY3J1cnBocHVGazdSN29aTjNRaVdyaUly?=
 =?utf-8?B?N01kY01rZWxrdzVVMHRxR2haUmRiRUpudHExbHh2Y0xDOWF1aktTcmU4UTZS?=
 =?utf-8?B?M1JaTGFjcjFYUnV4RWdqU1BYSDJBSndGbjZEMUxncFZKQXlyV25IYkoyZFh1?=
 =?utf-8?B?ZVVLcnJQWXlUVHltNmVOR2NVdjl4Z3ZuY1A4N3NVblM4Y3FWSXV5TjhHNDk5?=
 =?utf-8?B?dXZNL1Z5dXdXU2RZN25zN2Y1aUhhQXlVL1g4b1FWcjdFZjNEaGtLNVV6VEJC?=
 =?utf-8?B?Tlp3bktRYVlRSEJDejlPcFJISGJncjVxbzZtU2NocTVNbFVkalg3a3IvZ3Av?=
 =?utf-8?B?d0RnSjdPYmdhbHNBaGlLUzl1ZnZkaHJoMGRuRTRkdGVwcGsyU2EwTGdFeXo5?=
 =?utf-8?B?Mk43S2VKRVE3cnNUcHNNelY5bE1ON0JJczFaSWhzUXpkZTB2S0U2L3pQWUNL?=
 =?utf-8?B?cnNIWExiWFIwaFNxVVZ2aGk0TU9zY0tsUHVTZTRCY2ZSdTZkV0JlMUQ4N2pI?=
 =?utf-8?B?b25IcHZiQjJUVGszcXBTa0dZNmFCb3FLQkl3Z2hpT3BSV2paMDA0K1k2U3Js?=
 =?utf-8?B?MWZWK0dNQnlSbEd3dDZtdk5vRXN5ZWFBL3Z4NUZqeVByZEFSMzdyUWgyWjZy?=
 =?utf-8?B?dk10dWNRMEtHOHNwMTE5WkY1SWxJdWJURDM2NnZNQlhxbFFBc1I1VndQTThw?=
 =?utf-8?B?Q2piQVRmbXVqZlVMZkhjSythV2h0V2tHUjVjYTVwc3IvMXRhRzFOOHFxR09Z?=
 =?utf-8?B?ZXhoNEZaZVhNZ1VLVmlYcWFGMUNNdmtkVHBMQWJWbmovcnZDZ0JSNmxyazJ6?=
 =?utf-8?B?SEVvYkFpMDJ1WWl3SFdvKzBsTVpMRkRvMDhxTGxtMjhHWUM4eTVBc3RpMjNB?=
 =?utf-8?B?NFVnVEh0VEp4ODVOOUtKMUhXcDNKeGdPSWRjU3hscVoxZHRUN3gzM2NUbGIz?=
 =?utf-8?B?STROckVOU1RUd0N4V2ZSUzFnZmJjNnZYSXVRZmlzcXBUcE92R09GcHU4VHpO?=
 =?utf-8?B?TDdvYmJKbEJ1Zm9PakFRY0x4eEpuOGNGVWIxM3crczIxZk9FbEtuTDhEblNh?=
 =?utf-8?B?bWlrVmxhL1Nnbk9mV1RrTGRNY2k1a0E1b2Y1b0NJSTd3ai94NjJBYlN2N2xw?=
 =?utf-8?B?dVZ3VERTMmd6OExHL3ptVkVLTWF0RFNzd1Z0SU1iZFNxb3AwbENIdVVBQ0xp?=
 =?utf-8?B?T256L0FnT01KejY1OUw0MitkamNHMUFubnBhTGtNTnF4aDNCbEhjb0lFTlp5?=
 =?utf-8?B?WnpCRXUrek1HRXBaeER2eEhISFFvTjNmS0hHUzUyeG9Bd0tKWDE0ZnBTQ3pE?=
 =?utf-8?B?NjNjV05qZEpXR0hLRWZ0TEg1UW9SSDNsWWp3cCtid3lKN0xRUG9NMW00aXZR?=
 =?utf-8?B?a0Q1QXFSVUVSbWtSMW5FN21sMVJnVkRCTnVwNGR2enovM0ZXdDY2UDhZK2Z4?=
 =?utf-8?B?dVc4LzYvWjNqN2tLZlZzQ3Q2ditPQklYdThWVzRDUXE5L0swTVp3N1IybEtO?=
 =?utf-8?B?cWVWcjMxT0JiOEdIUEFzV2kyV0ZGUkFwYUlVajkvU0dtb042YWNyeW9LbmdP?=
 =?utf-8?B?SUpFdGplbFYvZ0wybWdhQThRYlRQcHhqekt0NXUxU1Y1UnJXVkpFSVpPYU1P?=
 =?utf-8?B?R0JjWDl3WXVOa2xnZDk2Rkg0a0NsKzUwUWZvNjFwd0FzWkw0Ui9Odk10SWcz?=
 =?utf-8?B?ZjM3MFNzb1RNVFNsQW5DdTdoclZnczB2Nm15R0VqV2FRV3l4dG9mQ1ppcmda?=
 =?utf-8?B?K3BDK1BIc1llOGExUkkwOER2ZU5IeDh3bjUyS2dBV3NDSlBFZDZ0R0hGREN5?=
 =?utf-8?B?ZnN6R1ZJbnRUN2JmeHhFMzl4ZHdiUmxLZmd5VjFYVW5rTjZRUitFMDNVYW15?=
 =?utf-8?B?VndvVFFLMmY3MWY2R3pWV1IyOGx1M3Q5M0EvMDBlQ3FVSGVtQ3NEUU0vOXFV?=
 =?utf-8?B?S1Q1UDBhSFdjVWVHZE9mcEJHRkxFVHMrK3piWDlnM1plM3RpOXJhTVpqdUYw?=
 =?utf-8?B?ZUp3UGQrU1RsWTl4Qm1qb0d5MlFmNE9mZS9UaTB3OW0rM1NjdGpoLzJuM1NH?=
 =?utf-8?B?TGY1dzZhSTczOVYrRGN6NGJBdEs5M0tvSkNkeGRQSnJMbDhVMlF5RFBqMGx6?=
 =?utf-8?B?OFJKODhBdUxCZFVrS0FQTXc5YlRVdnhVM3JjbmdFZmx4UnIzeXdZRUJtc05R?=
 =?utf-8?B?NkVjOUNsWndMYnJsT1paQ1lnQmIvVzhBL2w0S2VybnF1YTViRUFVTzBOYVJT?=
 =?utf-8?B?OEhkQktkWU02NkI2Q21wdi9zb2JIS1hyOFhxdGMzeTFBK2J0TitqTFRzWmsy?=
 =?utf-8?Q?RNr7QZAKUq6pUyq0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22B32367485F1F47A4132362045FBA56@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: bXJmoQqahsv/pg8w8fin9t+DJp+8VY8eg5ZSryyD99G/0JwpaLM/ydsHBarj1jNpU52Ck/L1ZZbYalzTZtsaLzW0zx0LztcbAuW8iFy13ivPxI2XopfC9XlNRnOo32VKAoSJtHlVH7YxZ0rB6rj30hTGlS42/aHy6zHjLq6LPK0zyHVE5NarBnOO/ywGSYcE8CAleBxB/6mE4+Yx+QD7Mu1ypuEAURC6D8wuTFcLdrhaZJQSsOQaLJ8HWzRgTI3tEYHRS2eCWf8lMSt3l7C40deoqh6x3/SE8zO7DXIS9+rGihKL3WM8lUskmqmws4eNL+v6qf6tY3XDIVB6HERWjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be2bb41-0d7f-4df4-c677-08df3926e9a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 21:19:00.1013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tjIVM+W/O9oOp11B5tm/b6RsjSSoJKSTYyCjGiemKZhGjkFBVNz3+9DV2/orDLMsPrWNrjq5OJsK4XA0NDg7Sw1vnnaPhcqNTAPpxH2ZpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9548
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTEwLTI4IGF0IDAzOjIzICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBMaSwgWGlhb3lhbyA8
eGlhb3lhby5saUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDkvMTVd
IHZpcnQ6IHRkeC1ndWVzdDogQ2FwdHVyZSB0aGUgVERJIHJlcG9ydA0KPiA+IGR1cmluZyBkZXZp
Y2UgbG9jaw0KPiA+IA0KPiA+IE9uIDkvMjQvMjAyNiAxMjoxMCBQTSwgWmhlbnpob25nIER1YW4g
d3JvdGU6DQo+ID4gPiBSZXRyaWV2ZSB0aGUgVHJ1c3RlZCBEZXZpY2UgSW50ZXJmYWNlIHJlcG9y
dCB0aHJvdWdoDQo+ID4gPiBURENNX09QX0dFVF9URElfUkVQT1JUIGFmdGVyIGJpbmRpbmcgdGhl
IGRldmljZS4NCj4gPiA+IA0KPiA+ID4gU3RvcmUgdGhlIHJlcG9ydCBpbiB0aGUgUENJIFRTTSBk
ZXZpY2UgZXZpZGVuY2Ugb2JqZWN0IGFuZCBmcmVlIGl0DQo+ID4gPiBkdXJpbmcgZGV2aWNlIHVu
bG9jay4NCj4gPiANCj4gPiBJdCBkb2Vzbid0IHRhbGsgYWJvdXQgd2h5IHRoZSByZXBvcnQgaXMg
bmVlZGVkLCBhbmQgd2h5IGl0IG5lZWRzIHRvIGJlDQo+ID4gc3RvcmVkIGluDQo+ID4gdGhlIGV2
aWRlbmNlIG9iamVjdC4NCj4gDQo+IFRoZSByZXBvcnQgaXMgdXNlZCBpbiBuZXh0IHBhdGNoLg0K
PiANCj4gV2l0aCBiZWxvdyBwYXRjaCwgSSB0aGluayB3ZSBkb24ndCBuZWVkIHRvIHN0b3JlIHJl
cG9ydCBpdCBldmlkZW5jZSBvYmplY3QNCj4gaW4gbmV4dCB2ZXJzaW9uLg0KPiANCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMDA1MDcwMjUyLjg0ODEwLTItYW5raXRhQG52aWRp
YS5jb20vDQoNCllvdSBkb24ndCB3YW50IHRoZSByZXZpZXdlciB0byBoYXZlIHRvIHBpZWNlIHRv
Z2V0aGVyIGEgcHV6emxlIGJ5IGhvbGRpbmcgYQ0KYnVuY2ggb2YgdW5yZXNvbHZlZCB0aGluZ3Mg
aW4gdGhlaXIgaGVhZCBhcyB0aGV5IHJlYWQgdGhlIHdob2xlIHRoaW5nLiBTZWVtcw0KbGlrZSBh
IHZhbGlkIGNvbW1lbnQgdG8gbWUuIEJ1dCB0aGUgc29sdXRpb24gaXMgbm90IGFsd2F5cyBqdXN0
IHRvIGFkZCBtb3JlDQp0aGluZ3MgdG8gdGhlIGxvZy4NCg0KQnV0IEkgdGhpbmsgd2UgYXJlIHN0
aWxsIGdvaW5nIHRvIGJyZWFrIHRoaXMgc2VyaWVzIGFwYXJ0IGludG8gc3Vic2VjdGlvbnMgZm9y
DQpnZXR0aW5nIHg4NiBhY2tzLiBDb25zaWRlciB3aGF0IGNvdWxkIGNvdmVyZWQgaW4gYSBzdWJz
ZWN0aW9uIGNvdmVybGV0dGVyIHRvbywNCmZvciBkZXNpZ25pbmcgc29tZXRoaW5nIHdpdGggb3Zl
cmFsbCByZXZpZXdhYmlsaXR5Lg0K
