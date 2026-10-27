Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793081297;
	b=FnruhJGp+d7Y/CPWYFK5iA+yS1FtzGApWNv+CFf2Q/UCHgnOqRUVVfOIO+ZYj/dk8RUR
	 /D43pEsr6izWD1qgn98WozdXDXZ2Woqqz//t5tMvZUUNtV2CxkrU6fDBv3egd2RnviiPq
	 zKS9zpP+gjCMGAFwJBW/Pdx36ax/IzmS8hDvskj6Q92i7CbAE0lUKjuQXmCXE2jWkeXKH
	 LhygronYc6duH6OVGOhzSKduo4L7xoO224spaQDh2PS0q3fyeseW3guk+rFfil3BDVb83
	 WmMNploCGX8akA7HWKOyq0PXxFrDOJBVWERGh+gDZK4DUZrul70SuWAhfZC6v9els4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081297;
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
	bh=szf+sxCH5+NLFW/V95ShE3v2pxOA7ELBirJ/0gm274E=;
	b=au1vrBbM75csopMDKk+GgB1uzXtezzyyoLqKpaOZoWhSBhXbXgbmm4bAmm5As3T17KPD
	 KOiKTSt8RALkMWdzXF7b0dp6RNEgyN03hukWh9rLU37CFoLnD7YfDnZTkoOx06q5qsG/J
	 1/8rgc4nJWPK4kLPEqbr2AJUTEZNOgD5yq9huWc9/c+115OPV997exTQE+YTWwg+Cr1Vu
	 XGz22+yGW8u7zSBdlLw7U2CypocN9dpy3YVyJI3H1p39nvlilWgqAhvUcoL0VF9UqNw7p
	 xaqpkUtezPXX/PBw4acgMmyI2dZqjvXN4KS+aoYq1+YEVuDp9gibA+fI//jbhtxVJCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l44SykaI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EE606A31A
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 06:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC2EE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l44SykaI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793081296; x=1824617296;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=szf+sxCH5+NLFW/V95ShE3v2pxOA7ELBirJ/0gm274E=;
  b=l44SykaIok7lolxqLm7bjpMrr2IYdHRTEratcGRcpVFif1AQJ3nfJemC
   LeKrDfzCdXGMJJsCh+ZAX1/quTRHZMbe92RE2Y92c/EjZT3Y1dCZ1Bke8
   lSmxA6nA+V5vSBCWgfnim1nvGjsk2eRDD0iJ0fMKfYUd34sjeLiWomQfB
   iMTtPycIQHZa2xCYp+Tt3MQNTmvaEIf9ktiZOuuL9yf8MMfSEHA6zu7tG
   ZFsUw/qa0JQxy/fisxo37CHvTsUSBWZsp/17oT/XIQ8V1jl/hR08Q878t
   q9JvHZFqXc4QCnYPP0Cvk+0QMmHna/Q6Nnz51Dg08l99fj3CkPq6TWsc+
   A==;
X-CSE-ConnectionGUID: UfP8SggsQ0SmUoFJxEpe+Q==
X-CSE-MsgGUID: OBUBzAdZQpyE6l5Iktu5+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1783516"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1783516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:08:16 -0700
X-CSE-ConnectionGUID: CA+5xqGYSQyF2KvBwStngg==
X-CSE-MsgGUID: t9qhegpPS9CCD4eE+XZZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4571718"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:08:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:08:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 23:08:14 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.2) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:08:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpXVFG5GKk/mnbiQ7AzOKc8hBqTmKgiZdadINZ1mHrq2tLgegADCUM3UiOvWNRyBTWGjaeuTUHZvewiWBTqt4coBlY7F4nzM1Wab74cuFlhdFQlCiy0/Va6G1B5Y21pI4zlv+9w36n+Nqics1bKon7pndnvVMunX9pzLwJB459/Q/JQ9kuj384pvIFYUl9wOWrH0V+SC72wlR/B/hodUI5Bw53e6h4QU6fqHs1g70S3lFqH0B5yGJ7G/8qlRRiiUx+ks/+Mt+FYwduXqsrHoSRSFpOdfgCcLBsO2hjHTvvfn9ekeF2xwRebA20udldab0MMJ84fDN6uavkJKHKimLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szf+sxCH5+NLFW/V95ShE3v2pxOA7ELBirJ/0gm274E=;
 b=ywqtAeb8mOxiBbZlKcncCDgmvYWCyOTgxhEfGvDushq3hi8ohPuqUZIlHzC+DgcMqyYih9l+cTk3ydo5VXUljV41qP4Nq03if6VuzDs6sRxdZtHLQlxy0HSTaq69dbNabSrWiKE6RZI8TS6favPPobSCrUrXmwxNt3TTZJiwBTL/CLsabEzyFp5amWdTWDd9bAvVYdIKvJUHAx+PvPcTQQgHLZ1vru+ncQ4p3YmCdn5ARrUNrtHu5qhgc33xeXy2uT1npUX3FOQHP4Kgye64knGJzMPuHpleULcsGuUb4J9EELbtiNP8R/OBxWZvkFgQZN7NAe7Dgk/rDX5Qdqx6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by IA3PR11MB8966.namprd11.prod.outlook.com (2603:10b6:208:572::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 06:08:09 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 06:08:09 +0000
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
Subject: RE: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Topic: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Index: AQHdS9q3p3OwHlhwLEuB5opu5u+CqrcPK4AAgAG354CAADLLAIAAAwnw
Date: Tue, 27 Oct 2026 06:08:09 +0000
Message-ID: <IA3PR11MB91368EEFC32F4CBF3F3CD16E92602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <023f3254-c368-4ef6-89b2-8bbacb42d89d@intel.com>
 <IA3PR11MB913636B33BDBD49DBC87555C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <920718ed-16a5-426e-9407-6ed37181615b@intel.com>
In-Reply-To: <920718ed-16a5-426e-9407-6ed37181615b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|IA3PR11MB8966:EE_
x-ms-office365-filtering-correlation-id: 68bfea37-9a46-4294-105d-08df33f0ace6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|22082099003|261026121527099003|18002099003|56012099006|11063799006|4143699003|10067099003|261022105027099003|261022075727099003|261026140227099003|38070700021;
x-microsoft-antispam-message-info: BeZJCwKM1aVbgZYa0vWpgtn82HQD42k39NFDIYEJ+aOErueLA269T5PXEivf6tpHAI+l8KYRaChJu5ytDd5G6HkBY8p2Dz30eWU6xQv/QXk4U9MwEfd+C7OY6EQ1RSPaF3e7sNWszoAs3gz30hjWSMSePhfMKbZ1HKl542ZOWxtK9FWWAtdo5FwBWg90IC7Q/OxJJkcZQl3mmq/8dXQ+eXbzIG+EFGkAvOi6HmsMr8AHFan33pLOU0IeaL2kpjb9RhXTJen/XT3AlLPMr07fLV28mFd0HYEpRhCbgR969aKvniB1LPKc62l4HtvAkr63PH0cfnDuVC3gl2sD6EOSrT4txxfyRLQzromwFN+u/XsHj8Y7PxcWAa54cS14qASsv52diGRL/KPAzRBlJapzYTGxyjVibFLGWeIkhw0oHhzWZ65w8/MnwfPDy1d6UE21XpmUXNZQcZ/cRajAQ/0tX88iOZcp2UEJ5tNm8nx8UQZWHAbWAZML0uDBaw/rfLFC5+C0Su+Ms6jN9F8mCMLYq9i0yXAEwrBYzky7YlP8Jjl7kKdRV91+LgD/mjSav82qzkihi2V1M02NLwykG4o5AQlafhOyPevmA2z06wCMtMwxseDkX5ND9EwQsC7nPrn0h+7Vr1ZlFLxseEfMF7VBLag1OCbfgnoJJInQrR6UM4duHiH9XUj7B5Ww220O8PSjJXEjvYZ6Dy0ADw05YA2AJD21d4PQUds77/pxLCoDTgE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(22082099003)(261026121527099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(261022105027099003)(261022075727099003)(261026140227099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVY5LzBzRGU1Wk5BRWZ3L3M0UWxweFN2aitjYjh2UGpMejF6aktRbVN3bUQr?=
 =?utf-8?B?em83aDBNNlJNYUg1dlFtcjNjdWV2VEV6NFNJZVptUmtqNUtJQnJmaEJhVUJN?=
 =?utf-8?B?Q0U0aFlTREZnVWkyVWhnWVZTS1hOQml3MzdsUWZtcC9oMlhWM0o3cWZvcXBi?=
 =?utf-8?B?am00bzEvK1VMRGprbkl5VXFXc1Jxc2J4dHpHN2VpdHpjNzhqdXV5OGw5YVhs?=
 =?utf-8?B?Qi9GVUE3MVZ6ei9udXUzVlFRWGdNcmliWGpwVlArQVp1b3JFYmw0N2NuTU1I?=
 =?utf-8?B?U2NoNFkvejk2aUFqNldKM1RuT21vMEtmajlpdDlSRE1abzkzeUtHY2c1VFdx?=
 =?utf-8?B?VnliSXo0cGlHZHVVMC9mR3QzNy9RRU45clk3NFRReFEvK0tZNmxDMWxlQnBq?=
 =?utf-8?B?L0pwMmxYYTVTQksxQU5wdW5XcTZIdjVGZ0EwN0xkU2dGd0tGT25pTjVBM3VW?=
 =?utf-8?B?SW96cmdENzlHUGxBTFpVUHRqenl5OU5QREsrMERyQlhVck1SclNaZWR4dWpi?=
 =?utf-8?B?RWYxQ0h0dE9SNkFmUkJaRHhXZEJtMFRxb0RLcVRvRDRtbDRrWjMvTFZvdjJt?=
 =?utf-8?B?RDNZVDN6NjlpVDJNOEhNNWpxTjFxazFTUUtEcUg4T3VWR0FtRkMxR0k5K2s1?=
 =?utf-8?B?eWVEMFVML2pjUFVuZ3h2NWJxYmZjcHJhc2Rrbm92bjd5MUk0TDJuc1RrNVhF?=
 =?utf-8?B?TmhwSEgzcWZsWStMeGJiNk0xNC90OUtZYzNtMm0wQkZPLzVSUnBoY2c3b0cy?=
 =?utf-8?B?OVNBRlRueFJvOGVxSW9UckFvT0hYNXZGTDZ2Y0paTElPY1RPODVhODFtUXNz?=
 =?utf-8?B?dGxZbnlRS1JJRXgxcEtyR3hyNnlxbGk1MzFIald6RG1LRHVieEZvZDRyQnFD?=
 =?utf-8?B?ZzllVWFmMXBnWTdlcjZYMDZDZk9zcElQS25uN1NQUE1XMWwvWUJKUFQyMHhk?=
 =?utf-8?B?alVRTmZ2SUszYXRjbDRSYksvQmdJTXNOeTFodzNTaVhQT0NZdXNIWVI5aGRj?=
 =?utf-8?B?aGVzUVhhOWI4bEZhZFprNndyRDhocEFsNUdDYmpJeCtySmxRb1doZ2VySjZk?=
 =?utf-8?B?dmFCY0NBT0tyQ2tnenR3TnEyODQ1Z3NXSzhNZ2pCazF5STBoT1BPbVgzT3pr?=
 =?utf-8?B?ZVVINTJwUXJmRTJFU3llS0c2Rk05VWpjOUg5Qm1aR0VXVElMcnJicXIyWXYw?=
 =?utf-8?B?N0ltUjJTeHNYaFErWlE4bkpGUlB6MHBhR25Selc1bkZNZXN4MGNRbVJxanNl?=
 =?utf-8?B?OXRVT0p2M0VDaGtEV2s3ZzZ1OGFxVnZ6b2dka3JIeSs2Y2xUQjRMZXNuRHNY?=
 =?utf-8?B?WFc5bklqWkxoS055emw5T1YzaHJWTThBVHM3eVVmazhEdmxyV3JFWUNhcnVV?=
 =?utf-8?B?VXhOY3RHSk40TUtNcjUwYTdPSWtUMExpT0JoaWZKVTRoUlJOVGFueG85QXBV?=
 =?utf-8?B?MWdjeTB0M2w4c1Mvd3Jvektja2c4dHE3TTJCVGVxTXdhOFZvYS9KTHZEdkRE?=
 =?utf-8?B?KzlycWVuVjJtS0YwVC8zRm5JdGIyeldmenZLMmZFdURmMXM2OU1LRldzbEs1?=
 =?utf-8?B?dTVDdGV2OXJzTm43azg5cEdRYXpIaWNnTE42K0Exbzl4R0NUOFdtZzl6L3Zm?=
 =?utf-8?B?YW1Yb2pqd3Vsa2VPekJrSHlmYS8xRWxaTlRTS3JaOCtoT1lUc2VnbVVpZFdR?=
 =?utf-8?B?SURvNlZheVdXVllIVDhnd2VMV2ZNVlF6THNuSng5NHo4UVk1cGo3TFJHeDRO?=
 =?utf-8?B?c1lYOWtMSkNWUC9FSW9HeUJwbThWcVNnQW5WbVJPbVhPQmQrc1JKVEEyUk9U?=
 =?utf-8?B?TlQvK3dKWFdkb0RyNDF0dUxIU29PK1VxSUJnWHZOWDAySGxTZ0FnOE50TVhu?=
 =?utf-8?B?NDFPcmtWQUR2OElHdEFWNitnK21QSVVkK0NybWVPbmZCajBIS094aFZWQ1FG?=
 =?utf-8?B?TzBhdjE2TnNHTFVVRVE0NUgweExseHp1S0VMT1hZcTBRdmtUcnAzeWtwdFpX?=
 =?utf-8?B?YzU4eU1hV3ZYUGFsbTZjRXFJUDRzRmozK1NTSzR4QThrYUVDUW8zSXpqTVgw?=
 =?utf-8?B?T3h1cEJ4eWpHSHBKT2w1NXFCWWdFNXlEUDBnUHZ1bURQN0xkeXNpQS9KU2Jw?=
 =?utf-8?B?UEc2T09hdlhDQU9kVVpGWnNkNStzTVJtcDJxWmFjOU1kOC9jNnVIQ3VmQUQy?=
 =?utf-8?B?eFZPaXMwRWx5QW44VWxlYlhhZUV6Y2pYc08vY1JLQnB0ME1LUUJPcHltUlYw?=
 =?utf-8?B?VkhmSFpjQ1RFazYrNzc5b0FOOEZxWS9SR0J2NlZqNC9NcUl0ZXhBbCsxeXJp?=
 =?utf-8?B?bTZPa1VXRWJaVWJTSHVGa0tVeHhOZnBmVG5XU0V2cGUrQks2L1NTdz09?=
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
X-Exchange-RoutingPolicyChecked: sE8dCF7e+32JxcPV5ASlZsKmgrkGDH6eGOVafxjFog+LvJTwODxZWmopjRu8zOgY4oGAZJYY1dwuID8OW5sU+jhgStf5epfrtW9BihCblMFxGtd5B3lSsk8+ct4lFKdhwoYrJj/RDuCPR1MqJu3QDcP19zLD73Bc2xZtK7x1E7zjLKKCOALFd8yoC0FvFYrZgFjYRxxPSVgSbHqVN4dtstwilpLnDdwxDznUnAIawbzGvkGLNlK0kzIJJ6s0aiCZufULrcDfQO+xQNHI5kL4Tb6lyXvJQvAk65g8c/1ObKfm2I41JamoY9i3bJrxQlv9KVnAXNoqTvfXE96tpaqbHw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bfea37-9a46-4294-105d-08df33f0ace6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 06:08:09.5157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vwzzna+ijQlDsc+7O2WqqkE9W1STqJL048cqe2uzExSAVHzWeHA2ZM5ysanI9WwsX7R+EXOCdhKKXYJPNVqBpBtY4JoUBQApM3USB0x+X2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8966
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMi8xNV0geDg2L3Rk
eDogQWRkIFREQ00gaHlwZXJjYWxsIHdyYXBwZXIgZm9yIFREWA0KPkNvbm5lY3QNCj4NCj5PbiAx
MC8yNy8yMDI2IDExOjI4IEFNLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6DQo+Pj4+IEFic3RyYWN0
IHRoZSB1bmRlcmx5aW5nIGxlYWYgY2FsbCBhbmQgcGFzcyB0aGUgc2hhcmVkIGJ1ZmZlciBwaHlz
aWNhbA0KPj4+PiBhZGRyZXNzIGFzIGEgZGVjcnlwdGVkIG1hcHBpbmcuIEFkZCBhIHJ1bnRpbWUg
cGFnZSBhbGlnbm1lbnQgY2hlY2sNCj4+Pj4gZm9yIHRoZSBidWZmZXIgdG8gZW5mb3JjZSBjb3Jy
ZWN0IHVzYWdlLg0KPj4+IFRoaXMgZG9lc24ndCBtYXRjaCB0aGUgaW1wbGVtZW50YXRpb24uIFRo
ZSBjb2RlIG9ubHkgV0FSTnMgaW5zdGVhZCBvZg0KPj4+IGVuZm9yY2luZw0KPj4+IGNvcnJlY3Qg
dXNhZ2UuDQo+PiBZb3UgbWVhbiBiZWxvdyBjb2RlPw0KPj4NCj4+IHN0YXRpYyB2b2lkIHRkeF9k
ZXZzZWNfdW5sb2NrKHN0cnVjdCBwY2lfdHNtICp0c20pDQo+PiB7DQo+PiAgICAgICAgIHN0cnVj
dCB0ZHhfZGV2c2VjICp0ZGV2c2VjID0gdG9fdGR4X2RldnNlYyh0c20pOw0KPj4gICAgICAgICBz
dHJ1Y3QgZGV2aWNlX2V2aWRlbmNlICpldmlkZW5jZSA9IHRzbS0+ZXZpZGVuY2U7DQo+Pg0KPj4g
ICAgICAgICBpZiAoV0FSTl9PTih0ZHhfdGRpX3VuYmluZF9kZXYodGRldnNlYykpKQ0KPj4gICAg
ICAgICAgICAgICAgIHJldHVybjsNCj4+DQo+PiBJIHRoaW5rIHRoZSB1bmxvY2soKSBjYWxsYmFj
ayBzaG91bGQgYmUgZGVmaW5lZCB3aXRoIGEgcmV0dXJuIHZhbHVlIHNvDQo+PiB1c2Vyc3BhY2Ug
Y291bGQgY2F0Y2ggdGhlIGVycm9yLg0KPg0KPk5vLiBJIG1lYW50IGp1c3QgdGhlIGNvZGUgb2Yg
dGR4X2hjYWxsX3RkY20oKQ0KPg0KPit1NjQgdGR4X2hjYWxsX3RkY20odTE2IGRldmlkLCB2b2lk
ICpidWYsIHNpemVfdCBzaXplLCB1OCB2ZWN0b3IpDQo+K3sNCj4rCVdBUk5fT05fT05DRSghUEFH
RV9BTElHTkVEKGJ1ZikgfHwgIVBBR0VfQUxJR05FRChzaXplKSk7DQo+Kw0KPisJcmV0dXJuIF90
ZHhfaHlwZXJjYWxsKFREVk1DQUxMX1REQ00sIGRldmlkLA0KPmNjX21rZGVjKHZpcnRfdG9fcGh5
cyhidWYpKSwgc2l6ZSwNCj52ZWN0b3IpOw0KPit9DQo+DQo+aXQgd2FybnMgb24gdGhlIHVuYWxp
Z25lZCBidWYgYW5kIHNpemUsIGJ1dCB0aGUgdW5hbGlnbmVkIGRhdGEgYXJlIHN0aWxsDQo+Y29u
c3VtZWQuDQoNClRoZSBjYWxsZXIgaGFzIGd1YXJhbnRlZWQgZ3BhIGFuZCBzaXplIGFyZSA0S0Ig
YWxpZ25lZC4gTWVhbndoaWxlIEdIQ0kgc3BlYw0KcmVxdWlyZXMgcGFzc2luZyA0S0IgYWxpZ25l
ZCBncGEgYW5kIHNpemUsIHRoYXQgbWVhbnMgaWYgd2UgZG9uJ3QsIHRoZQ0KaHlwZXJjYWxsIHdp
bGwgcmV0dXJuIGZhaWx1cmUuIFNvIG1heWJlIHdlIGNhbiBkcm9wIGl0Pw0K
