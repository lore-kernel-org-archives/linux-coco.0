Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082183;
	b=HFpMsLx20HPt+VBUoG1kbkzo+pTAWoSU7SYPxvFK0QmmYb+IFJ9tR/8uSVJ+rFSy8ezH
	 c+g5cPu7fGOcuCnNBI3IFBoG+S2Td1CpdleQkDAsPQqshwTNxO69NZ9QtpDeEm+InZLp+
	 VRmpsdUdZ5ixnHidsL0zLDP2ZmciQbcmKBdW8MwHG3f0ck/g1ONuHJ1sblc69N6tBLOLT
	 Y8R4j4nW9j0mAnV5bgKLqC6k7BkUXn15MapachgOAbN2jBrFeB/N2BmXiwE1h8VJL5MPg
	 KcnUxoScMK+E4sv9z3juwMsB53WDgdI+h0y9jcCnrx0kklnS8OSgKT7q2OBHRZN6Gyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082183;
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
	bh=wU6VZN+lxtQlA7rY3O4x21PnPn7UmagMDzWV0CugC1Y=;
	b=VIk64scad1yparDB/HokVtjlm2NVcoEgd7Zi5kG19BrcD0TzIW457n9lA1dCNUaEkZUx
	 yjLQEq2xa+AfbbFryjd80DLxGO59hzFM6AQW2gKr3w84Nv0GVJjXJYrzfsWsAC5BBijRl
	 N7m1YyGbw2O0LR5hiarAG3qbdD4YKSPCvz+nEF13G/pfvkD+H1SSiw6kE1Wy3xOt1sSrW
	 Rh4fX7+5N3PAnL3KiOmbLItVCLSXid+W2V3bxvdm7Ql6Vz0cF5j7K8t1CzQ1nBSmgVXCu
	 E08k/1n7eLnXw9yE8GL4OvDpxVAGis9d8rgZKGwgrjTeLUq3EZ72frYvtyrFRQ9Be0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BwKenDd3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB9606A31D
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 06:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72BB9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BwKenDd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793082181; x=1824618181;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wU6VZN+lxtQlA7rY3O4x21PnPn7UmagMDzWV0CugC1Y=;
  b=BwKenDd3eUJ/8cAw8KNMbO4xPVzGDOFUD9umo0kgIJx9voQXbYC8VDBh
   AfGF9yvp9aVL1iV8bXDqldyjGiHiZnDTpYX8ADGe0G1L2N/1MNtPDxqYf
   eAbJCpY3ELI2su3/wRMdbqz6IuZ1+zva77Ji1Y0klh0/pFRTQ8Ow+vNLO
   HmUvO8I6Y7O1/aTPkr6/1C8uH8e/oztTH3GrtvpWFAOs7FD7MJ1sgXKBo
   S4jAFqeVXV/amHcdZq48Z0HU/rXOLsJwouDeXYN1vyKSHZ7ZE/KqRpIJE
   flycrpIdjikhOi6A7JtHG7qAhGHYTs2/He2li7NE/mxTnLK/EVFPCM9Ml
   g==;
X-CSE-ConnectionGUID: t+b6mhGTQZOWxvKYh7ZHwg==
X-CSE-MsgGUID: LXLdf7SnRKeu9YPD2sT2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1657929"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1657929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:23:00 -0700
X-CSE-ConnectionGUID: HNvkN7oaSRGQ6hmqJxBJ9w==
X-CSE-MsgGUID: BjZ+sA4xS0GUsNJnlRQe8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4974001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 23:22:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:22:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 23:22:57 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 23:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvihTjB+8OM7Yq8ORMz9gBOO2YggSnVa6F+gGAbJgXDnv0mEz3DZW+2SIP2RlwK5baVzHFg3zH2PEN0gYcsrb1/+Shm2DOjlaa6BV1psw6LvaFRrgtm3hk0PBFz/3wzJ1ndXsLOI9CWmV1pEpAd1g7NfNlRuqTSRLNrDHsPDQAv1eau6XI2djbUiUtsZilsW+NqkTpTx6kztdH/LziSumv29/j98/+lT5497+XCkYf1WgC6UlqgYhQibTdrqfG1g64LNkgE0Ecnt/49chji97m+zqBakjFKAq1tCypoVtVFTm+Nbi5LceVdX5igEOo4uHqBTv2ICDSx1v5vwEiK7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU6VZN+lxtQlA7rY3O4x21PnPn7UmagMDzWV0CugC1Y=;
 b=Y8wmaKNkpME4f+TPmUKk0b0SP4rYeIVicPx9f2M96KQmNlroYARC7W5a8EAWoEWxK/JqPi4H2I//+6jT1yHG8cTpjliRU5oEJt8D73yCTvyfhi+SdHL9TgWr1+8z70MBzTq/5H779enEWD48G1BaoiMcd+qCx7w2ZniZOlh16Snn0r9sxo7aNWt2hpZhtZO9znJaAdwmuFLggD2W8iGnwqZsf4YOULQb3JtYBJuKEqSEJgUiFcCbPywjcFS57JmUv7bpVD8iqnyF9l/JirnZIEtmuo8EPMbj90nqxPN/L85zVIh7eaki3mogIeTEqv0kSffytGI78ReSfRejcpjIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 27 Oct
 2026 06:22:55 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 06:22:54 +0000
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
Subject: RE: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5XsnTSswCpUuCn5uop/dh5LcPMKyAgAHkxFA=
Date: Tue, 27 Oct 2026 06:22:54 +0000
Message-ID: <IA3PR11MB913639CABA0098406C4AECD892602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
 <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
In-Reply-To: <ded2ccb0-b551-4f04-ad4a-0139f12a3616@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|MW4PR11MB7102:EE_
x-ms-office365-filtering-correlation-id: 86ba518c-1678-4bf2-be42-08df33f2bc60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|261009223027099003|261021123027099003|261021135927099003|261021121427099003|261022075727099003|10067099003|56012099006|261026121527099003|18002099003|22082099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: aCZFi0dU1Xp9khKwo6CAtttU3eaxi6JA3e9WYQ6d+vkDFCMLw48IduhNNKb34QcJN2BTwS/bZ5HuodLEN9s9M4RJ/HTVKlyTiFRi49e/oJPu76IX5UtZBLqTpOz2DgVjd0RFrj0IpJ/2YQdAJBpv164wQiQAPnUuDJcSePHVZrf1aG4Cwi19IqaAm8gwGFfPxKWR7WUC7fUMz9FL3Pc1T8BfjYse+U6TmXQRUOVQOvXjGoPSxBhx6qOTd2hQf04Ar/tpzdD+Fs7+AIkFnPYrSOlUtrczunp4Er2ny5IjIZB3FScq/cYKJhmjIjXT3F61FMowh8VW4jcM/g5QGHjIUNt1wpVtu14+7j24fsYQzltSANqq82ca0PzFpKwGkKKRhDkem7AaK1oClhOL90WvEQC6eZbbK1TCIl3BlLqDBRUmkl9BOlT+yerYP8+bNFX6/D9BELOYguiyT3wuRw30UwIgOHT1nWcfRANzTSF2PmKYaMddDDC9PJQYpn9iT81HbSJvWCe2THGjNL2zd21oymTrjt2pS8W2xO5mF5sQdnO7FyZ3QSj22R+oGDLAB2JqNKqpNtdozDeC0bEluICjHs+vYJ5zf1D1V0K3f/Mgk2lrZaHIR0MwKxNCi/5+WPozIZw4K0YCmQw8iwCb8KgYi6NuCNUQ9tnv7d/T6TfaBInfJSm1qAqqylZcdYUYjbaHZaKy4qvki9IYxlUEn/t+AiDfB/res27afL23cbsXy+c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(261009223027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261022075727099003)(10067099003)(56012099006)(261026121527099003)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjdqSUpieXNHYXlWU2tFSHdpaWlSVkRyQm9MNG9PRUpkbDY5MlBWeDBCUG84?=
 =?utf-8?B?MUNGdUtYQkI0ODRuWjZLeng2WXVic0dVS2JIK0YwVHZvU0ZHWUUwQjd6U1Fk?=
 =?utf-8?B?aXgrMFdDSDRXZThBU1crSjlmNm5WQzllUXJsbFBZenlqd3ZXeG43anJPbndz?=
 =?utf-8?B?TnhnakttUFZoTlJtcUFkL1hzRkw0QUxIVmFkNU4rdlQyQlEvZmZCeittSUZ1?=
 =?utf-8?B?UXRvZWxDbHNROUNnZXB6dDROd0RzUHZqZFVPRmZLWDByRDJ4ZnVHNWsxT2NL?=
 =?utf-8?B?R1FLMTRHd1FPbUI4NTBwWU9raVJ4ZkNTa3ZwOGhUajN1UXNKUnB3Nk4wT1Nz?=
 =?utf-8?B?dHA0dDdEVld1bUZNRVJRQTk4NSthb1F0NG1DMldtWTlaN1M2Q2UrZzVLeHBU?=
 =?utf-8?B?MUVQUG9XK2M2OW1sVjZNUkdZSVFjOGREbDNWWUs0V1hmaFJ0U2diRXhHdklC?=
 =?utf-8?B?YjRVR0xiLzZ6ZXdOY3h2YXlrMlNheFd5bkFzQ052b2F1TCtENTEyd0lrcDlS?=
 =?utf-8?B?QXlJZmRkZFlJTWx0RjloSldld3M1ZDVOcFQ5dnFkRjBiMVU1Y3VVUTNGbDdo?=
 =?utf-8?B?K3pMZlE5dmh6Y0JRemxrajdTbUluMDZhb0phVVdlMk9pVlpBQU5GZzBMd1Vk?=
 =?utf-8?B?TkJORjBFMUUydjRoS0VMWkRmeVVMRzVUTWRIMHhhSXB0Zi8xeUF1cWJJaDNJ?=
 =?utf-8?B?UmVLVVFrTDBlYVMySEVRbmZEUzlQSlVDN3NmazhWNmJXVFZhT2FhRTlsRnQx?=
 =?utf-8?B?ZXI5SUtOd0g1Sm5DSDdocGtBVWw0ZzNTcUFOWWk2NFVLZW0ybFhCeCtWS25P?=
 =?utf-8?B?c1lsQ1YxaW1QNkNaRU9leWl6Ujh0MFJFZEZxbis4ejBBaC9ZMURHR2ZLUzFY?=
 =?utf-8?B?MFJGOU5VbzhUWUtLeWxKYWo3MEVOdlUyNFhLMDhuL244WFZpMzc1QzZUUTZj?=
 =?utf-8?B?RnZDdlpJZW51UC93WTBibmhWbUx2clJSam0za2xMb3ZDYUFBZEdzcmNGMGIw?=
 =?utf-8?B?WjNoZnFLb01weWRhc2E0SHhDcVRmRzRwRmM3azBKNWtISGFEeW5VSDduVmp2?=
 =?utf-8?B?OE9HS2RNcFBBMDIwUG8ySHpoSWQ5dUFoM29vRVpUa2tvZ2lRU2lRUXFXcFBR?=
 =?utf-8?B?dTB5eWN2cUFBWUhVbVZ6VDVsemVpcmFEOHVRSnJvRWd5M3ZiODdjWXFIbWhL?=
 =?utf-8?B?bTFmVVlPTmVnTU9FTTVhRXVHeDBIcUg1Y1ZRMVlraWRaMUFRTk5YQjJ6bjFH?=
 =?utf-8?B?ZTNKUlppaUhkTXBSaWNEYVc5YTBGV1Q0N3V5UEw5Q3pSZWtwVm5PSjg5MzVL?=
 =?utf-8?B?eWJsRytaYmVVSmpoem91K2JkZ1hpeDlZdk1CQU9Gb2RvVjlhUVM4RjZyRE51?=
 =?utf-8?B?d1JKa2h6RVdkdHFVZWRmOXJVUUhJaEd5a3AzeXQreDdsUHhOREtuZHJsWEZl?=
 =?utf-8?B?UnhEb1RMZUxJUHpYeEZtMVVzcDdmUzA4Wlc5NnZGam10R3Z3Z0hzTGt3alhX?=
 =?utf-8?B?U0dPTXZJY0FmM2lVL0V0ZUdMc1ljczBpVjdCZU9RWkNHamdQOSszeGNkdXAv?=
 =?utf-8?B?bk1MbVFtVUlmWEh2VDBhVXd6SlBzU2sxN0dpWUNXKytKYmpNK2pWd3A5NktO?=
 =?utf-8?B?R1lpa2FaUjl0MlBKVk1XUkkxNnJsbTNLcVJPUFlaeWVkd0ltQzdHODZPczl0?=
 =?utf-8?B?aktZREVOVEJkVVJ5VDlXZmxES1J3ZitPU0pMV00yV0ZJeDk0VHFvRUtGcEpo?=
 =?utf-8?B?S2lCM2hDaXA0cy8xMlliT1o3WjBuMGxiek1ZYW1YVEo4UjNUdHM1d3gvQU15?=
 =?utf-8?B?dmJnUVpta25qQjE2T2pCVWFWei91dm5IU3ZML0tKVGVaSmRPbENGczJtQ21W?=
 =?utf-8?B?MTkvZndJMElaY1JNRzFvVW80dzVYZXNwM05xUmZEUEtKTWxVekk1MEw2elIz?=
 =?utf-8?B?Z29Ya2xrcm9vbWJlREg4YTJhVnc4Y29PdWtQK0VhMXhEb096SS9hb0JxL1Nn?=
 =?utf-8?B?a2VDNzI5ZXphM3gzWXdKcDZZVHN0UEpiNlBXSExGTW5PaXp4d1FSYW14L3RL?=
 =?utf-8?B?WC9wWW5JZnBPbUkrUlFxOWppV2xhTXNFakpCM0JYd0RWR21tMHUvYkpBOVBZ?=
 =?utf-8?B?Q213cHdKVWU1amdKeTFsZlpiOVB2QStPdUhZbTlPMVl4aTZocW1TOUpPNnVk?=
 =?utf-8?B?Zy9kT3ZTMit2ekQ5UXFJcUErMUY1bWZ6RUxmdUYzVC9BRTNGUUVFUGF1bnR1?=
 =?utf-8?B?N0dyQVhybHZmUDI5c0ovdTZJck9WdlhoMGhIcjRmWVh0REJJUE96ZnRLZ3lI?=
 =?utf-8?B?UllKL0NaRkc3NUlTRDFHeGtyLzhsOXRtU0dreU9qazY4WlNsbXhDdz09?=
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
X-Exchange-RoutingPolicyChecked: VPSH15Obu5Wi2bsObLbQuPgQyb4CR7tLc0Mzdedf8kZHDhk4mHGQgFQa8ZcPvA41k+Y21E0pmWcN+wMQG32WgBn1pfWHU4BqVXG8g8iJQzzeq3UzkUxB99VgrYc0uTfFt4Yw9ZpUJ5We++Kq0DBGoPObN8wm8C0W3e2sMZJHQGPd/kr382Lqf3AKhh+CBRtoeTvpMa0lkwzcbBD/9w4MzqGzC8jnq/hDYVN4/kP7QKPExQbEyr+cyC2fQMn2ZhJ4PCI3TXcxdGtdCDdE+eYBdXeqf+3juyNxmco7St0giKI/f/yAGyXvzRqpvxpijtqdL9TQ+G8tS49nj+R68QrBKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ba518c-1678-4bf2-be42-08df33f2bc60
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 06:22:54.4864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lugdQ1cB8uRPLLHc6NbZwe/b35to/U+PVwbEcrWXdl1jCMSOHyRwLxTRNfYEBOIYPLOWbef1krTzw5igy6iHkeZyrkg8PoWcb9q3DEe8uHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMy8xNV0geDg2L3Rk
eDogQWRkIFRERy5UREkuUkQgbW9kdWxlIGNhbGwgd3JhcHBlcg0KPmZvciBURFggQ29ubmVjdA0K
Pg0KPk9uIDkvMjQvMjAyNiAxMjoxMCBQTSwgWmhlbnpob25nIER1YW4gd3JvdGU6DQo+PiBJbnRy
b2R1Y2Ugd3JhcHBlciB0ZHhfbWNhbGxfdGRpX3JlYWQoKSB0byBwcm92aWRlIHRkeC1ndWVzdCBk
cml2ZXIgd2l0aCBhDQo+PiBzdGFuZGFyZCBpbnRlcmZhY2UgZm9yIHF1ZXJ5aW5nIHNwZWNpZmlj
IG1ldGFkYXRhIGZpZWxkcyBmcm9tIGEgdGFyZ2V0DQo+PiBUcnVzdCBEZXZpY2UgSW50ZXJmYWNl
IENvbnRyb2wgU3RydWN0dXJlIChURElfQ1MpLg0KPj4NCj4+IEV4cGxpY2l0bHkgbWFwcGluZyBh
cmNoaXRlY3R1cmFsIFREWCBlcnJvciBjb2RlcyBpbnRvIExpbnV4IFBPU0lYIGVycm5vDQo+PiB3
aXRoIHR3byBoZWxwZXJzLCBpbnRyb2R1Y2luZyB0ZHhfbWNhbGxfdG9fZXJybm8oKSB0byBoYW5k
bGUgZ2VuZXJhbA0KPj4gbW9kdWxlIGNhbGxzLCB3aGlsZSBpbnRyb2R1Y2luZyB0ZHhfbWNhbGxf
dGRpX3RvX2Vycm5vKCkgc3BlY2lmaWNhbGx5IGZvcg0KPj4gVERJIHJlbGF0ZWQgbW9kdWxlIGNh
bGxzLg0KPg0KPlNldCBhc2lkZSB3aHkgbWFwcGluZyBhcmNoaXRlY3R1cmFsIFREWCBlcnJvciBj
b2RlcyBpbnRvIExpbnV4IFBPU0lYIGVycm5vDQo+aXMNCj5uZWVkZWQgYW5kIHdoYXQgaXQgYnJp
bmdzLCBJIHRoaW5rIHRoZSBjb21tb24gZW5hYmxpbmcgb3JkZXIgaXMgb25lIHByZXANCj5wYXRj
aA0KPnRvIGludHJvZHVjZSB0ZHhfbWNhbGxfdG9fZXJybm8oKSBhbmQgdHVybiBleGlzdGluZyB1
c2VycyB0byB1c2UgaXQuIFRoZW4NCj50aGlzDQo+cGF0Y2ggaW50cm9kdWNlcyB0ZHhfbWNhbGxf
dGRpX3RvX2Vycm5vKCkgdG8gdXNlIGl0IGFzIHdlbGwuDQoNCklkZWFsbHkgeWVzLCB3ZSBmb2xs
b3cgdGhpcyB3YXkgc28gdGhhdCByZXZpZXdlcnMgY2FuIGZvY3VzIG9uIHRoZSBjb3JlDQppbXBs
ZW1lbnRhdGlvbiBhbmQgZGVmZXIgY2xlYW51cCB0byBhIGxhdGVyIHNlcmllcy4gV2UgY2FuIHJl
dmlzaXQgdGhpcw0KaWYgdGhhdCBydWxlIGNoYW5nZXMuDQoNCj4NCj4+IFVubGlrZSBUREcuVlAu
Vk1DQUxMIGJhc2VkIGh5cGVyY2FsbHMgd2hpY2ggY29tbXVuaWNhdGUgd2l0aCB0aGUgaG9zdCwN
Cj4+IFRERy5UREkuUkQgaXMgYSBtb2R1bGUgY2FsbCAobWNhbGwpIHRoYXQgY29tbXVuaWNhdGVz
IGRpcmVjdGx5IHdpdGggdGhlDQo+PiBURFggbW9kdWxlLiBUaGlzIGRpc3RpbmN0aW9uIGlzIHJl
ZmxlY3RlZCBpbiB0aGUgdGR4X21jYWxsXyBuYW1pbmcNCj4+IHByZWZpeCwgYXMgb3Bwb3NlZCB0
byB0ZHhfaGNhbGxfIHVzZWQgZm9yIGhvc3QtZGlyZWN0ZWQgaHlwZXJjYWxscy4NCj4NCj5JIHdv
dWxkIHNheSB0aGlzIHBhcmFncmFwaCBpcyBub3QgbmVlZGVkLiBJdCdzIG5vdCB0aGUgZmlyc3Qg
cGF0Y2ggdG8NCj5pbnRyb2R1Y2UNCj5oY2FsbCBhbmQgbWNhbGwuDQoNCkkgdGhpbmsgd2UgbmVl
ZCB0aGlzIGJyaWVmIGV4cGxhbmF0aW9uIGZvciB0aGUgaGNhbGwvbWNhbGwgbmFtaW5nIGRpc3Rp
bmN0aW9uLg0KTm90IGFsbCBhcmUgZmFtaWxpYXIgd2l0aCBURFggYW5kIGtub3cgd2hhdCBoY2Fs
bC9tY2FsbCBtZWFucy4NCkknbSBvcGVuIG9uIHRoaXMsIGlmIG1vcmUgcGVvcGxlIHRoaW5rIG5v
IG5lZWQsIEknbGwgcmVtb3ZlIHRoaXMgcGFyYWdyYXBoLg0KDQo+DQo+PiBOb3RlIHRoYXQgd2hp
bGUgaG9zdC1ib3VuZCBoeXBlcmNhbGxzIChzdWNoIGFzIHRkeF9oY2FsbF90ZGNtKCkpIHBhc3Mg
YQ0KPj4gcGxhdGZvcm0tc3BlY2lmaWMgRGV2aWNlIElkZW50aWZpZXIgKGRldmlkKSwgdGhlIGZ1
bmNfaWQgcGFyYW1ldGVyIHVzZWQNCj4+IGhlcmUgaXMgZGVmaW5lZCBieSB0aGUgVERJU1Agc3Rh
bmRhcmQgKHJlZmVyIHRvIFNlY3Rpb24gMTEuMiAiVERJU1ANCj4+IHJ1bGVzIikuIEFsdGhvdWdo
IHRoZXNlIHZhbHVlcyByZXN1bHQgaW4gdGhlIHNhbWUgdW5kZXJseWluZyBiaXQgZm9ybWF0DQo+
PiB3aGVuIHRoZSBQQ0kgc2VnbWVudCBpcyB6ZXJvLCB0aGV5IHJlcHJlc2VudCBzZXBhcmF0ZSBz
dHJ1Y3R1cmFsDQo+PiBhYnN0cmFjdGlvbnMgaW4gdGhlaXIgcmVzcGVjdGl2ZSBzcGVjaWZpY2F0
aW9ucy4NCj4NCj5UaGlzIHBhcmFncmFwaCBzZWVtcyB0byBwcm92aWRlIGhlbHAgYnV0IGl0IGRv
ZXNuJ3QgbG9vayB0byBoZWxwIChhdCBsZWFzdA0KPmZvcg0KPm1lKS4gQmVjYXVzZSB1bnRpbCBu
b3cgdGhlcmUgYXJlIG9ubHkgdGhlIGhlbHBlciBkZWZpbmVkIGJ1dCBubyB1c2VyLCBJDQo+c3Rp
bGwNCj5kb24ndCBrbm93IHdoYXQgc3BlY2lmaWMgdmFsdWVzIHdpbGwgYmUgcGFzc2VkIHRvIHRo
ZW0uDQoNCkluIG5leHQgdmVyc2lvbiwgd2Ugd2lsbCBwYXNzIGluIGEgcGNpX2RldiBwb2ludGVy
IHRvIGFkZHJlc3MgUmljaydzIGNvbW1lbnRzLA0Kc28geW91IHdpbGwgc2VlIHdoYXQgc3BlY2lm
aWMgdmFsdWVzIHBhc3NlZCB0byBtY2FsbC9oY2FsbCwgZS5nLA0KDQoraW50IHRkeF9tY2FsbF90
ZGlfcmVhZChzdHJ1Y3QgcGNpX2RldiAqZGV2LCB1NjQgZmllbGQsIHU2NCAqdmFsdWUpDQorew0K
KyAgICAgICBzdHJ1Y3QgdGR4X21vZHVsZV9hcmdzIGFyZ3MgPSB7DQorICAgICAgICAgICAgICAg
LnJjeCA9IHBjaV9kZXZfaWQoZGV2KSwNCisgICAgICAgICAgICAgICAucmR4ID0gZmllbGQsDQor
ICAgICAgIH07DQoNClNvIHdlIGNhbiBkcm9wIHRoaXMgcGFyYWdyYXBoIGluIG5leHQgdmVyc2lv
bi4NCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFu
QGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gveDg2L2NvY28vdGR4L3RkeC5jICAgICAgICAg
ICB8ICA1IC0tLS0NCj4+ICBhcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jICAgfCA0MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgYXJjaC94ODYvaW5jbHVkZS9hc20v
c2hhcmVkL3RkeC5oIHwgIDEgKw0KPj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oICAgICAg
ICB8IDIwICsrKysrKysrKysrKysrKw0KPj4gIDQgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkNCj4+DQo+DQo+Li4uDQo+DQo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vc2hhcmVkL3RkeC5oDQo+Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9z
aGFyZWQvdGR4LmgNCj4+IGluZGV4IGY0NmEzMTcxYTUxMi4uNjY1YzEyOTI1ZmY2IDEwMDY0NA0K
Pj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vc2hhcmVkL3RkeC5oDQo+PiArKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmgNCj4+IEBAIC0yMCw2ICsyMCw3IEBADQo+PiAg
I2RlZmluZSBUREdfTUVNX1BBR0VfQUNDRVBUCQk2DQo+PiAgI2RlZmluZSBUREdfVk1fUkQJCQk3
DQo+PiAgI2RlZmluZSBUREdfVk1fV1IJCQk4DQo+PiArI2RlZmluZSBUREdfVERJX1JFQUQJCQk2
Nw0KPg0KPlBsZWFzZSBuYW1lIGl0IFRER19URElfUkQgdG8ga2VlcCBpdCBjb25zaXN0ZW50IHdp
dGggVERHX1ZNX1JEDQoNClN1cmUuDQoNClRoYW5rcw0KWmhlbnpob25nDQo=
