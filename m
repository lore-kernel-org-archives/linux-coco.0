Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9063166F36
	for <linux-coco@lists.linux.dev>; Tue,  6 Aug 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932487; cv=fail; b=oCTjrjkg59Rx1mkdFpwbmMs01F5fToofXYjKPSQsU++8uEaASXoDAQ5id3HGDYV8mbCKxoOIFWeUytauxpUlo4bZWMWwcQpl9r8tUy0PWFJt0Lh5SYI49VdbF9r23D113OFgvHhrMYUn5LWPGUlQ40H42aCrXGn6yUQCSnRf+ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932487; c=relaxed/simple;
	bh=q3GL2jW0u3D6Hez92MxUSE5MBC785LDC9Egol1kgdks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JYt7GJlOQaLVZqvbxcMAmFmAbn+6wLfDcTSlFFbRxDcIUuQ9wowKYpRfjZMIHyWRJqNIRuiTTSlHsOEaruUHfO8cZJXBWoKvbaRuVsxNQCzhYtW6WwJUgier1pTrJONuW1x46NmEcRLUiG7ewCd/XH27AM004/zaSA5B4E5PfLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqQCDIT6; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqQCDIT6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722932485; x=1754468485;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q3GL2jW0u3D6Hez92MxUSE5MBC785LDC9Egol1kgdks=;
  b=NqQCDIT6shYB3wq28hxAhWkbtw8e1e9OJxMKENGbdMXVHqgM/2/vEALT
   s7L/qV2uW7k9twHx+W8ges16A4UlqRrkkVtz78BXwieIXCUId90tvPMOn
   YgqXR667Vn5SplkLVEFbZfI2lSASI1awISJ4cxjbROjBcgS8AI63tGBj8
   biRO1EG+sj+qNzbvEjtrPyUn96OYdEtgHIz1b4PbXdG/77cHlV/5txkip
   6qU7zk+IW6dElX9aXZsfi4KQXjnUE2KiA5ZtSX3Da9ajKqKd3Q4lujxOb
   kOioFNorvu+9qtHeuMIHp8YzWjzqOyUbg1NwRqVBnX9KDG2GJkgNXPx4u
   Q==;
X-CSE-ConnectionGUID: UlMMWaQSRaCA15cff1hJ4w==
X-CSE-MsgGUID: +51wbmDmRReOFGWhnM19YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24697775"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="24697775"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 01:21:13 -0700
X-CSE-ConnectionGUID: wnwGbEzYQ3G7ogKnHLutBg==
X-CSE-MsgGUID: QO1oUOTXRAWVza42iK79sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="79693029"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Aug 2024 01:21:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 6 Aug 2024 01:21:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 6 Aug 2024 01:21:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 6 Aug 2024 01:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkWgAhVB1RTHaQEKaPDHccVPe8BoE/hHsFlQetMM1oodzzU5t+SfWxQZbS75KoasgJSD10MLMScnyQ5lJsPpRe4DQkITgXreS0wEYgpqyo0rSUYKiIaMB/mvQwEb3UxmY5unWMpPI0olhzFdZ986xa/jZYYL+wfyL/kILcicFZziKudIzGdjOGH0KRFt5XUR24k7CRYatMqw9Hps5mgJ6Hd74sbLV0mtCuUgIj/l9xkyhRrYI5tu1+IO166EXCwFY/VwdwooGC3NYMq9Uz9P/FggThXkM5K426OVArgFgFjfcOMUC175w/J+zyOMu1iwHOzZVxKIL73OykdarolDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3GL2jW0u3D6Hez92MxUSE5MBC785LDC9Egol1kgdks=;
 b=UG3xB3Zf9P2g1pblVogf2Bw9F0Yt55EuTARIIUHjzKPEyuieDSFUEBj7yBbIKH7U9PIdYbXwsxLJNiUt/n9+jVjfyczxNiqH43+Qx9BN20ZHwq4cdWn/SP5PonmI9vuzomiHaMj1aLSAL+sl3CAnQ2vgTZXi8OnR9zxULbh2O+uJtei2z9TseeBpdixpKAdzjeGbve1nt6M8WOp4oMyFzkhWH4ArqoMjgqDaSalCkXBMnpBm30bLg+nmHjD+9xnOx4UyuAyN9TYqQkx8680gRXymSoGVu0xjCnoOO2gG5XkjOdkt4b4q8y1tcD6HSDucej9/PHD1Zf8MgRL69qMIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 08:21:08 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 08:21:08 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Dionna Amalie
 Glaze" <dionnaglaze@google.com>
CC: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
	<jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
	=?utf-8?B?UsO2ZGVsLCBKw7ZyZw==?= <jroedel@suse.com>, "Lange, Jon"
	<jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson, Simon
 P" <simon.p.johnson@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9SCoxtMRLFK0GjoRY90TKvZ7ITK4eAgAEdeICAAKutAIAABwuAgAOiBfCAAF0YgIABGYlg
Date: Tue, 6 Aug 2024 08:21:08 +0000
Message-ID: <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
In-Reply-To: <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|DM6PR11MB4531:EE_
x-ms-office365-filtering-correlation-id: 478ee736-4154-470d-3b53-08dcb5f0b91a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUtIODdWQWFzRGYrRjFndUhjY0RIcUZkY2o5ck1tSzUvblF5QkVvOWNQYm9j?=
 =?utf-8?B?UHAvUFRVVk9QVVBEcnRZODV6SXdDUUZaMmRCN2NvbEVBMHI1YzFvUEVRa2Rp?=
 =?utf-8?B?a1M2MGNIY1B2dTNucUNoTWpPckJsUFpmN2JvQ1dmWjN4WUpLanhiWUk1M0pn?=
 =?utf-8?B?SjhjN3BJRFhGa3VpU1JWdHRaTUJmaGEwLzVvOGNBbDkxZFVFbHVwU1dGaHg4?=
 =?utf-8?B?eSthT0VubVh0clpNaHBDZGVDd3YyUXgzKzM0b0FPdzFnSncvSTBZU0lhZSs4?=
 =?utf-8?B?eTl6eUplUFZIcHFEYkhCNExuamQ4UW9wSkdoS2JYbjd2WDdJaHdVMU9wc2o4?=
 =?utf-8?B?Z1BrL1p4YUI4SmVYbThxQW9IWmt5NHk3WFZCWTViN0RTeTc1MTRxWEo0U09h?=
 =?utf-8?B?c2Nkb1kvekxSSHd3N3lXMnBTcU5VQ2c3Z1BvK2l5V3VNV1AwVUl3YnFqRU4w?=
 =?utf-8?B?VDQ1OEh1d1pvc3lmU1JHVHlJcHBJT0Riekc2WHRnSjQ5NVd3ekJwSG9YaFIx?=
 =?utf-8?B?WEZBZVU0dzNBU0ZqQmUzVWZBekNxR25WQTBoWkMzcFF6U0w1WHJwVFU4Tkta?=
 =?utf-8?B?cXIwclhqdHNhS3BMRk4xSXZJcmgvamhVT1ZBZjNIUGNmeDhxeW5UYmplMnlX?=
 =?utf-8?B?b3NOVmtMVWVJTlZHUG1VdjAzVjlYNlNoY2JpVGJJYUprNTlqNFdwWHlhMmx0?=
 =?utf-8?B?bC9iYnkyU3kzTEZvS3pDU0NuUjcwNTN0VXczVFRlWThQY0ZXME9YT1MvQ1By?=
 =?utf-8?B?aUpKT2Z4OFJrSG5KcVpRUWFjUi82K2tlb1BmVG5hVklRM3loNkFrZmVidXlq?=
 =?utf-8?B?aVlwbXdicEltMzhyYUxoZk5ESzhtSFFMOExJSjU2c1RibTJDM3VOS3hYWll2?=
 =?utf-8?B?TUE2YStiT3FSeUNnVDAyL1o4ejJoMVlGN2x4cmVHZ0tFSktwSnNZbVVicXNq?=
 =?utf-8?B?bHNQL3NXNjRoNlNXZy9JM255YVBLN2NaTGNoUXdGQVM4bHpXeHJBY1MrQjNQ?=
 =?utf-8?B?cDJWWkl6ZXd0SDJ3b21XcWM5N3hrOVovSzNJR292NTI3Qmt6QVAycmNQYlU4?=
 =?utf-8?B?NS9kNHdGL29PdlB3RndNaFllbndYRDExcE9FZElqNS84aFFsWVlTeit1TUtj?=
 =?utf-8?B?TjJtcit6WG9KNy82MEcwV2JYL0plOGg4YkNsajI5R0cwc3VhVmpLTk4wYmU0?=
 =?utf-8?B?aHRqRE9aNlhvcnQ0MGhiSjcvV2hPL1V4akNoam5iQ05qdE9qWXpzRTVSdTlO?=
 =?utf-8?B?Y0c5K1Bwb00xTlhZV1A0bktFcmJqVnRwc0VrdmQ3bzdFa1FuK3NSc3dlK2V1?=
 =?utf-8?B?bWk0LzdWOTlqdy9zR0RTV0tncmZIMXhKVDBHcHJRUUdkTm9IcFBZVjlNN1dt?=
 =?utf-8?B?akJiM21YVHRlWWM4eU9FT0kyN2FTZVIzZkxjYUJ0WVFwMTk1S0RZM0tkeWlD?=
 =?utf-8?B?U0pjUUt5UEQ5cmJ4T2lpUGxlK2dSN254K0FJNnpUSnhEdnppbkFIank0VHo0?=
 =?utf-8?B?MFQwQmxXV3FyK0dmQng5cmwrYUR0T3A5MENmUUtQTGpySkttSXNTc3o5MktM?=
 =?utf-8?B?eUN4NC9rbVp6UGVaWjZra0VHd00zSlRKQnlhS3BpU2lZVTU4c09FOVNDSXBJ?=
 =?utf-8?B?a292SS9XYy9WaXVLTHRjakY3bUdnamxqaElOR2Fud1lJMzNXL29rZk1TU3Rt?=
 =?utf-8?B?akVvTC9YcFVFdEt0dUhKeVhHMUtMZG04bkRUN0hJaXFuOHd4cS92YktnMXhH?=
 =?utf-8?B?WXFtbmltUXUwZ3VIdjdqd1BvcUpXVEFSYkhBcjBNSS9uSXpraGEzdWF2QlR6?=
 =?utf-8?B?OWZUUStQZ2t3SlFFU3lQM0ZMejBDLzkrcEZhUUFuN2h5TTFyUzA0dkcxakQ4?=
 =?utf-8?B?M1VIRWlIdkVHeWttUlEwdTRqRGhGVjkxV0JiRXI5ZTljUkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW5nWWtabDR2anVqbzNRdjZZdW0zUGM4WUJOQ2UyKzZmNkxXbHF6dGVqZ05w?=
 =?utf-8?B?T0oyYkZVSFhPcDdPc0tMQzJiS2tFTnRFTngvRUs3Y1NKOXhWc2JDYUFIMlhL?=
 =?utf-8?B?SmdYYzFuU2NIOFJkYlJtd3dDY09KMFlpT2hzaTlhYU5maEVlbHZQZTZZODRU?=
 =?utf-8?B?b0JkSFg4MTdnQmNLUVJ1blVZb1JBK3VpUnd4UTFNSEVGZ012bFl4SWRrWWta?=
 =?utf-8?B?Q2FCMHpYMDF4K0RlQzJvUTR2dDlSeVZqMS8xOXZ3U0dCUkphY2gzWlhJNUxQ?=
 =?utf-8?B?aXV6NlgxbWI2bFdOd083RVhVcFM2dEVBTzRJb0RBeXhpeGIvUUd4dWJTZTg1?=
 =?utf-8?B?YUVUZE1pUkxPb0ZZZDdhTWFwN0p0Q2prZUkwN0ZDQkc3RkdCRjFENVN5ejc2?=
 =?utf-8?B?SFB0WngvakNBNDA3MTBrRWZMbnVhakVDSVpEL24xaFZtWmhOWXNvVkpXS3RX?=
 =?utf-8?B?Wi9iWk9LUnYwQS9iTnc5V2lJT2NYVS9TdXFqZ1UxNWZJUURSaXMxZnI5NmlZ?=
 =?utf-8?B?S2hjR1pneTJESWsxeUxMcGRwRnhTaGZGN2pOUVJGMlcwTUJCWUdWRFhKcktO?=
 =?utf-8?B?Z1Z1cVB0WUtnbjViVmNXeDVraEtWcnFuM2pNbmVCRU1ORTV4cmNSWmxEZWFy?=
 =?utf-8?B?WWZ5SWpNdmVmbFNJWEJWTnlLakdnS3djRW5INEh4anY2UWgrNkxHbGt2enZq?=
 =?utf-8?B?bFZGaEpBdmwvdzMxOWZHRjkyZFJaaEg3enkrRENwT1FuNTNxVm9OSUxoc0dC?=
 =?utf-8?B?ekE5RStiRWRSS2IrcnIyZ3FjVU9jQXZORWxpczN4RDFtREZ6Z2lJaGxWNzR2?=
 =?utf-8?B?NnkwdDdlK2VibWYwcVZyZEtVVlpmYk1CSTR1aEY3RWdicnFuc2pRcnFueDVE?=
 =?utf-8?B?aG0zVDBlaGVWMitENGtMdEF0UXpkeWk0cUFtNU95MkpJTGxkY0F0N2lxVlFu?=
 =?utf-8?B?ZTNJaEQ1VGU0M0d6YnlCOWlLcnpSTmlkbEh1V2lSa1JjSVNPcEYyZ0VWbzZ6?=
 =?utf-8?B?WmRkUGdraERSeU1iNHZhQlU1aER3aUViOVNNTjNtNm9Dck5RbG1pSXRGRkR3?=
 =?utf-8?B?V25ZTTBiQ1BRWE5GMzF6TzdpVGhPQlJJQkpSNmZaeTJqR2N5TUFtTEQwSk9R?=
 =?utf-8?B?ZlRtTTlidDFyWW9IM0UyVTYva3YwVzNzNHVHdFBSdGhYZjdkZWcxVFIxcUNB?=
 =?utf-8?B?c3Nkekcweit5cDMwbkY4N1NFZmRUeXFVL3ZUdmY1ZFozV1ZsdlFGQ0N5ZUJx?=
 =?utf-8?B?OGxoVDJVS1ZxU1cvcUROUnJWalU5cWt6M21NSE9XVnlXQjRwOU9BRFUydWs4?=
 =?utf-8?B?WU0rZG5yVzdrY0hubHJsR3NsM1ZVZXFRSlE5MWljc1cwU0hoTFBHUSt3RkVh?=
 =?utf-8?B?blc1TVh6Vlc5UXNkN3ZLN2JZRnhGeERLWk1WQmpZY0lxbGVkWFFDcGxYbFVD?=
 =?utf-8?B?eWxPWFFWdWsveGVxOFcrbWpqMFRTOWtpeHlBcEY4azNmL3c5WXpmVjBmZnha?=
 =?utf-8?B?RlhQVHNHZW82WThMMWlrcFVBamU2V3NxS3VteWJZenA5b1NIVWpaQnAwaU5E?=
 =?utf-8?B?RWFmb1dRQjdMRnljeTJoVXJzUGVEN1pqOEJQc1BmaGc3alZNbktia0xQM2xR?=
 =?utf-8?B?eHFibEtkTFBLUzk3ZnRIVHNMMlVYT1ExWDhZdWx1YUw2THlGdFhTRWJ3dXVI?=
 =?utf-8?B?NUxQcEZoL0pCQXpvUjNaSUZ3MDNxZ2htWW10S1lRMzJpenVvQkljZHI2QlRm?=
 =?utf-8?B?MlRXSFIwWlhiK2wxU0psNkZCeHprdGVnZk1BczNCRlAzQ1hCc3FqemFITlJV?=
 =?utf-8?B?YnlJWlE4cjJneDZkdmxRdTBmY1I5T0FYcTZSOE1EWHUrMnRYei9DMjdobUhC?=
 =?utf-8?B?MUlhckV3YWE4bjFvdUVZejgxdU10ZG5mNkFFNFh6amI4WFZTRnB3a2hYTUgw?=
 =?utf-8?B?NWszR014RmNHU3EyOWJwWjhLNzhKWU5NZEtLUk1oSkZPdTZDTVdLdU9XQ3pP?=
 =?utf-8?B?eUhqT3BBZnRrQUNFSCtXaVBpMG8vajlQMHNBZ1Q2YWVGQzVmR2NjMmFNNVpo?=
 =?utf-8?B?dW8vT2t4VEtEQjFlMmtHSnAza1dEM3J2VUd2aVhXS1FObE9aRGJQbngwQXNT?=
 =?utf-8?Q?rNZ6eK+U8c7BS78v2SQB+Dv18?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478ee736-4154-470d-3b53-08dcb5f0b91a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 08:21:08.2003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzHas2MhE197DNMGN11IUiP/sneqmxsvjx7n8ufxCLLR+aLj6zKAbdPtz++94TNa+cwRtgN4QhRZzieuqpZFoMSouoeRIeTKrSaTBi/tvz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
X-OriginatorOrg: intel.com

PiBPbiBNb24sIDIwMjQtMDgtMDUgYXQgMDk6NTUgKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3Jv
dGU6DQo+ID4gPiBPbiBGcmksIDIwMjQtMDgtMDIgYXQgMTg6NTQgLTA3MDAsIERpb25uYSBBbWFs
aWUgR2xhemUgd3JvdGU6DQo+IFsuLi5dDQo+ID4gPg0KPiA+ID4gVGhhdCBicmluZ3MgbWUgdG8g
YSBjdXJpb3VzIHBvaW50OiBpcyB0aGUgSW50ZWwgVERYIFNWU00gZ29pbmcgdG8NCj4gPiA+IGZv
bGxvdyB0aGUgU1ZTTSBwcm90b2NvbCBpbnRlcmZhY2U/wqAgYmVjYXVzZSBpZiBpdCBpcywgaXQg
d2lsbA0KPiA+ID4gbmF0dXJhbGx5IGluaGVyaXQgdGhlIGVubGlnaHRlbmVkIGludGVyZmFjZSAo
dGhlIGNvZGUgd2lsbCBiZQ0KPiA+ID4gcHJlc2VudCBpbiB0aGUga2VybmVsLCBzbyBpdCBvbmx5
IG5lZWRzIGFjdGl2YXRpbmcpLsKgIEhvd2V2ZXIsIGlmDQo+ID4gPiB0aGUgSW50ZWwgU1ZTTSB3
ZXJlIGdvaW5nIHRvIGlnbm9yZSB0aGUgU1ZTTSBwcm90b2NvbCBzcGVjIHRoZW4gaXQNCj4gPiA+
IHdvdWxkIGhhdmUgdG8gcmVpbnZlbnQgZXZlcnl0aGluZyBhbmQgdGhlIENSQiBpbnRlcmZhY2Ug
bWlnaHQgbWFrZQ0KPiA+ID4gbW9yZSBzZW5zZS4NCj4gPg0KPiA+IEkgY2Fubm90IHNwZWFrIG9u
IGJlaGFsZiBvZiB0aGUgSW50ZWwgVERYICpTVlNNKiBpbXBsZW1lbnRhdGlvbiwgYnV0DQo+ID4g
Zm9yIHRoZSBMaW51eCBndWVzdCBrZXJuZWwgdGhlcmUgaXMgbm8gaW50ZW50aW9uIGF0IHRoZSBt
b21lbnQgdG8NCj4gPiBzdXBwb3J0IHNtdGggbGlrZSBTVlNNIHByb3RvY29sIGludGVyZmFjZS4g
V2UgaGF2ZSBtYWRlIGFuIGV2YWx1YXRpb24NCj4gPiBvbiB0aGlzIGR1cmluZyB0aGUgc3ByaW5n
LiBUaGVyZSBhcmUgbm8gdXNlY2FzZXMgY3VycmVudGx5IHRoYXQNCj4gPiByZXF1aXJlIHN1Y2gg
bmV3IHByb3RvY29sIGludHJvZHVjdGlvbiBvbiBJbnRlbCBURFggYW5kIGl0IGRvZXMgYnJpbmcN
Cj4gPiBhZGRpdGlvbmFsIGNvZGUgY29tcGxleGl0eSwgZXRjLg0KPiA+IElmIGFueW9uZSBiZWxp
ZXZlcyBvdGhlcndpc2UsIHBsZWFzZSBsZXQgbWUga25vdy4NCj4gDQo+IElmIHlvdSByZWludmVu
dCB0aGUgdlRQTSBjb21tdW5pY2F0aW9uIGludGVyZmFjZSwgSSBjYW4gc2VlIHlvdSBhcmUNCj4g
YWJsZSB0byBnZXQgYXdheSB3aXRob3V0IHRoYXQgU1ZTTSBjb21tdW5pY2F0aW9uIGNvbXBvbmVu
dC4NCg0KVGhlIGdvYWwgaXMgZXhhY3RseSB0aGUgb3Bwb3NpdGUsIGkuZS4gZG9uJ3QgcmVpbnZl
bnQgYW55dGhpbmcsIGJ1dA0KdHJ5IHRvIHN0aWNrIHdpdGggZXhpdGluZyB3YXlzIG9uIGhvdyB3
ZSBoYXZlIGJlZW4gZG9pbmcgdGhpbmdzIHNvIGZhciBpbg0KTGludXguIEluIHRoaXMgbGlnaHQg
U1ZTTSBpcyBhbiBpbnZlbnRpb24gdG8gZG8gdGhpbmdzLg0KDQoNCiBJIGFzc3VtZQ0KPiB5b3Un
dmUgZG9uZSB0aGUgc2FtZSBmb3Igb3RoZXIgU1ZTTSBwcm92aWRlZCBzZXJ2aWNlcyBsaWtlDQo+
IGRlcG9zaXQvcmVtb3ZlIG1lbW9yeSBhbmQgdmNwdSBjcmVhdGUvZGVsZXRlLCBidXQgd2hhdCBh
Ym91dCBtaWdyYXRpb24NCj4gd2hlbiBpdCBjb21lcyBhbG9uZz8gDQoNCkNvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSBhbiBleGFtcGxlIG9mIHdoZXJlIGxldCdzIHNheSB3ZSBhcmUgbm90IG9rIHdpdGgN
CmV4aXN0aW5nIExpbnV4IHdheXMgb2YgZGVwb3NpdGluZy9yZW1vdmluZyBtZW1vcnk/IFdoeSBk
byB3ZSBuZWVkDQp0byBjcmVhdGUgYSBuZXcgcHJvdG9jb2wgbGlrZSBTVlNNIGZyb20gZ3Vlc3Qg
a2VybmVsIGZvciBkb2luZyB0aGlzPw0KSXQgY2FuIGJlIGRvbmUgaWYgdGhlcmUgaXMgYSB2YWxp
ZCB1c2VjYXNlIG9mIGNvdXJzZS4gQWxsIEkgYW0gc2F5aW5nIGlzIHRoYXQNCndlIGhhdmVu4oCZ
dCBmb3VuZCBhbnkgeWV0Lg0KDQogU2luY2UgdGhlIGhpZ2ggbGV2ZWwgb3BlcmF0aW9ucyB3aWxs
IGJlIHByZXR0eQ0KPiBtdWNoIGlkZW50aWNhbCBvbiBBTUQgYW5kIEludGVsIGl0IHdvdWxkIGJl
IHZlcnkgYW5ub3lpbmcgdG8gaGF2ZSB0byBkbw0KPiBpdCBpbiBjb21wbGV0ZWx5IGRpZmZlcmVu
dCB3YXlzICh3aXRoIHByZXN1bWFibHkgZGlmZmVyZW50IHRvb2xzKS4NCg0KTWlncmF0aW9uIGlz
IGEgc2VwYXJhdGUgc3RvcnksIHdoaWNoIGkgZG9udCB0aGluayBoYXMgYW55IGNvbmNsdXNpb24g
eWV0DQpvciBhZ3JlZW1lbnQgaW4gdGhlIGNvbW11bml0eS4gV2UgKEludGVsIFREWCkgaGF2ZSBh
IHdheSB0byBtaWdyYXRlDQp0aGUgZ3Vlc3Qgd2l0aG91dCB0aGUgZ3Vlc3QgYXNzaXN0YW5jZSwg
c28gd2UgZG9udCBoYXZlIGEgc3RyaWN0IHJlcXVpcmVtZW50DQp0byBtaWdyYXRlIG91dCBvZiBT
VlNNLiBJdCByZW1haW5zIHRvIGJlIHNlZW4gd2hhdCBtZXRob2QocykgaXMgdG8gYmUgDQpzZWxl
Y3RlZCBhdCB0aGUgZW5kLiBBbmQgaWYgc3ZzbS1iYXNlZCBtaWdyYXRpb24gbWV0aG9kIGlzIGdv
aW5nIHRvIGJlDQpzdXBwb3J0ZWQgZm9yIGludGVsIHRkeCwgdGhlbiBpdCBuZWVkcyBhIHNlcGFy
YXRlIGFuYWx5c2lzIHRvIGRldGVybWluZQ0Kd2hhdCBpcyB0aGUgYWN0dWFsIHJlcXVpcmVkIGNv
bW11bmljYXRpb24gYmV0d2VlbiB0aGUgTDIgZ3Vlc3QgYW5kDQpTVlNNIGluIG91ciBjYXNlIGFu
ZCB3aGVuZXZlciB0aGUgdXNhZ2Ugb2YgdGhlIFNWU00tc3R5bGUgcHJvdG9jb2wNCmlzIG5lY2Vz
c2FyeS4gIA0KDQpJbW8gbWlncmF0aW9uIGlzIG9uZSBvZiB0aGUgdG9waWNzIHRoYXQgd291bGQg
YmUgZ3JlYXQgdG8gZGlzY3VzcyBhdCBMUEMuDQoNCkJlc3QgUmVnYXJkcywNCkVsZW5hLiANCg0K
PiANCj4gUmVnYXJkcywNCj4gDQo+IEphbWVzDQoNCg==
