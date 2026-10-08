Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018238DC73
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477029; cv=fail; b=mww6d8S2PIZgDKaAxsC88kuOGKEvkwQj2FtMBwNeceP8z4HHrignw0YL0J+GRMR3M0Uf4atpELTxRagFlSgj+cEVWl3etZtHtpbEU7U7jiKp6J9aM1xFO+Z7g/0DMaohCX09y/Gbc3EmFTJKU3aztkzIzJshNJFSzMV8SXOAAlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477029; c=relaxed/simple;
	bh=xnq55pHtVQmP00qDlHNgc91ibjA+KPTXpjRzf3FSJKg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kS5F5ODsRxESTOsPMDcJ+mAs6pLLQcg25zkRLz+ORergZHZ762zXtuhJZl5DkCcdNV/xGyphNHKqTJLFAHt9USEsISXxCfef060owPST6U6L2eJJf6VvLFQi2TtfZY3Z7muR7cHQbFBCvL4ZzSW2gaI7TcqWgNwGDtIAGOvQTvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nziIyksN; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nziIyksN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791477029; x=1823013029;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xnq55pHtVQmP00qDlHNgc91ibjA+KPTXpjRzf3FSJKg=;
  b=nziIyksNsBpC60y1jfP/tEVr61B9YoYaIVz7f4GvgZl2YxKn79gGBUw2
   WxJ8EbERUFiBB1hibbSEknv9SxefJBCFzGqAMt9wcc4s2ucN07N/Lt7Mu
   Zsgoq1puXj6G+hHG4H2SZZhu8b82h9e9MMHfJJzWU29GvLaYKEl/XFf/I
   rFseaB96enz/vKphbcR52iCgAyPQFih/8nbacF6D3KmU0LcdgJPuTmJXX
   DY17PZ9T0K4aZlPogezwLb6TYVTYf3TZLLx7RBjjI2acIo2GuxQDoGFfH
   ikShdz7is377AT5XiXT7Esx1GVXIWv+piNz5fI6xZ4LZvXdyE3fmrdpEO
   Q==;
X-CSE-ConnectionGUID: gmd8QAwPQFeybOU7Tz7VlQ==
X-CSE-MsgGUID: 9uKQ5ihwQ5KacnsCmoGm+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="258520"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="258520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:30:29 -0700
X-CSE-ConnectionGUID: SHhSZGxjS4afntZBilBLyQ==
X-CSE-MsgGUID: o2aXfh4mTfmEiWyahNLeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="451985"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:30:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:30:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 09:30:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:30:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1+IHzd9bvFF2LKcpfYgNR+NPWVIDwHEW6vAxwUPnBhC3OJuSAcYMxItNiOXeF0Q4NFKEobQjuxWHuMJhqdMGLZrigegQVcoHQSBeVCiR/VZ9Y2lE9UWgz4WJEPRPTUXzUHzCL/uJVyNkWfIN+/NNzstreudVw5DiWjyqAgIxFACkIyXuDUrYBPlK4S/8/kcSsO2Oa9ZzBJg0auxW/Sd5X6BN8jyHYQ1oqS0Ijs+Qls8a9rSdF6hBiMh2jK+ABOdCn8wg2JAimQEgvYMOsMsyyiib3ZjXDBCqo/6Bw1iilttQ7966uy+cyjJ9Lriww8oWRsla5ZQ4hwA1K5veIIouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnq55pHtVQmP00qDlHNgc91ibjA+KPTXpjRzf3FSJKg=;
 b=XkRtYHbWUjwD+0K/5I2/tAJZNafq9stP7yrTjoFRfyL0Ymz4DQYtQO1/2U7CvO0ILIoM6O8SUDMj3UfOV5EfqVNIfeJPMWSm1Fd7FvqHrg5rk0ZwOxwv+VN/AXfAgm9YNWMwQiFAROl/5H+JOXgpf1+PaM/z+ZDjE9G68gWsVz+F+x7zzdkFXO+rhKhc+VFxfTN5nU4gM8ArIgoQUOu/jUeqPFXxlM9UKKgYlVT2URfgx5ZbC4sMoyW2fD80kSMn2fe4uTGpUzgKiQJH6WemFj8V1W3+V8ThM1xF6VFUavUdOwVEldcg5iVh2d6qSOaIjGD7sMy5/1lx1pKhGghioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 16:30:22 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 16:30:22 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Fang, Peter" <peter.fang@intel.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kas@kernel.org"
	<kas@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng, Chao
 P" <chao.p.peng@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: Re: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Thread-Topic: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Thread-Index: AQHdS9q0u5m7/KSHA0+l9tJLWdCSyrbnui8AgADxnQCACp2kgIAAo3qA
Date: Thu, 8 Oct 2026 16:30:21 +0000
Message-ID: <d94d9727815f47b4de7f3069f6be2fd78154f933.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-2-zhenzhong.duan@intel.com>
	 <ar2JlI0ApPCb_C2G@intel.com> <ar5UQg/Q4zePFSzb@yilunxu-OptiPlex-7050>
	 <IA3PR11MB91366518288A65E26D9C9BA192932@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91366518288A65E26D9C9BA192932@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|SA1PR11MB8476:EE_
x-ms-office365-filtering-correlation-id: 0d37f832-53fe-4c31-900a-08df255972f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|38070700021|56012099006|11063799006|4143699003|22082099003|10067099003|18002099003;
x-microsoft-antispam-message-info: UIAy8TEl7P8y1sg8U1IHvZtFmdp1LjCoLL8CJecTPFv2hsREogtIqvQkUO2W35ZtYHWZaUHs0XcaZGBmzsIhz4HI260vaJ17636FlOUtkY2bPS59lUgN+NN7n/4Ygs9q0YcDgbr/GmtCDarnqmJFmUqTnYMbLsxfUWk+Td0kJpxzRcvSHtSkLnnRoCiQUiGUlxr7ZhbE7AFzcYhsprRn5JFsr2A5YYFyMyDc9efEunqZ0wOUYRI0gVeYvC6YdM4sbQaiu7/ozWSZ+PjddJ97BM2MzQIvbNHaLATTSrV9mhyc5KuW3vMx/hqo62qgvcqdxxZZVdWUSF/oph8DL30FUK+Ldgqbmsbes3PFbKpPyM59UGt0RUyOn/P0Eq81AzCmN8lAgYWhylImuGTGI/8ZaBF1fmXBe4gjqbbp+V/Ng60gpQ/f2NI1f134+27x9SzmFM4RiSqMh4lukgUQAJVmgJSlBmKuYJrZ6K0RTzi4+/h8BinFdr8MVRamYQBLjksvxVT2aHwfi5m0A5j9jkfvQtEO4FHXYHsz9hs6XcKzGtlu6JHwMLKtfAbRT6kkJnn/ja1xLewwUgCkIiWUurynSFqn3Do6TO8gC/vpBAakBUCBaJH+jsoBrcgP/G91911XHiERqLeadptMjosJxKaaJZh+AGFFfKpVG1xsErl81jcdc8ZzoRbRXFIyMcmlgiUaFTqy++lEbXQeZ1CyjSQXvtsyNTPBl3BU4Foksm0zRh0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yzg4Wk1qbTZRVnp4bmRDTEZJaGMzN1FBUkpVeDhhNzZhMm50K2xwNnpwTmhW?=
 =?utf-8?B?enNZdnhLWTJCc25hSUlqSnlwQmZ2Ky9SN0kxSEpqY0N6MU84cHk2bEJuTm1Z?=
 =?utf-8?B?YzZkNGlrTFR1Z2RIaVV0UmdOU2wwSmE1VC9Ia2p2Y2NpK1JzOTJGM2NHRmJs?=
 =?utf-8?B?WExQcGNOVnBDY28xTE1xZmI0ZjJrbGFpZXhYSWlXU0E2OHNFNG14KzZRcHdU?=
 =?utf-8?B?Y1JKYndWSWduUUlmNmgzMmxwN3R1cExYUG5CbnZnWjQ4YVJxRjJLWDFjWHAx?=
 =?utf-8?B?KzJFcXhZNG1PTytwR2x0SVF3eEpvdjJCb1c3TWVZRUNPY2NnZ0Rmd3UyZ0Fr?=
 =?utf-8?B?MHdEcWlrbnZhbC9FL29IRHFDa3N3OFBOUTRxZEtiaWp0dXBvWkJnOWZJTWZF?=
 =?utf-8?B?N01COSs1aFpnNm5HeUpaTVlTSXFLaG53YU5CanloL1IyV0RleGxidlFxb1lx?=
 =?utf-8?B?N2RucjIzdEVHbGcrSXBtWE9MV2xuL0ZBSkN6RVo0aS9BdG1OclJheUkxdG5Y?=
 =?utf-8?B?WDFFeUs2YXZGZi9WRWxoMStXSDhZTkZsR3drWkJNNnJOcG1SaTlRMVNhRXNQ?=
 =?utf-8?B?OEV5eW9lNVA3cC93MVpTWWQrNjgzd1dvMTF4TUpKWjVWcjJ1QzJEeEZDNFRh?=
 =?utf-8?B?MXRMa29uRHFoazhuU01rRE5vQlRXYkNXS0xVUmVRZ3Buamwrc01ObXpTTzlR?=
 =?utf-8?B?dDdKbXJ4MmdpS1hBczNDcW9LekExdWI3Mkllamo5WW9JdHlpMEZyeFZLOWVF?=
 =?utf-8?B?aGZ2b0hiK2lTLzVPZ3dxb2NubXNraHFPQVV2bDVURkNuTjFsM3dUb1BIekNi?=
 =?utf-8?B?a2RuaDFEa0ZveXFLTGV3cEprWHBGMWlJNWpUK1E3Uy9xTk9SNHU2S0xWdEUz?=
 =?utf-8?B?ZEdVbTNyUURHd0w1R2g4ZDg5cUNMaEtlZU9xQmVLYUJyd0M0clFpV25UQmxt?=
 =?utf-8?B?RlhsT3JKekFiTXNuUGRCWU1ySWg5b1N4blZsU2NVeVllWHZzeTc1RkZnMFVW?=
 =?utf-8?B?ZnFlR1oySjB4WVFJN3N1UVdoWXVqSzRnRHBYbDhSTUhNWlMxQTJWWGt6aFhV?=
 =?utf-8?B?VUJsb2h3RUM1RXllekZObnBLUnluQnRhZVFDK01Xd1E2VzYyMEtyRlFkSmNB?=
 =?utf-8?B?bDFoVmxwbjBTbUc2STA0bmdRSWpKL3IrUlRYR2tZSEpZdC9xY2tRSUZ2MldP?=
 =?utf-8?B?Q3UzOHg1dHhLb1FwZWEwRXJ2ZlBvZW52eU9ad1JKbDVLVEd4NEJBVHptS21y?=
 =?utf-8?B?Ny85V3g4bEdaMDBETFVBYXdZazVQbklyUy9aaHpzMkNWLzlBVVJXT1VFbFlN?=
 =?utf-8?B?UHpOSzhyZFp3b0pNK3ErRW15aThmWndIMTB1KzNvVUVPZXM5Wkw4dkZMUGpE?=
 =?utf-8?B?WFRkMHo4VGVRb0RXcWErM0VEN2M3WCsvYWFCRjAxeWVoL1lDbmNLOVJSMXly?=
 =?utf-8?B?cU4zMElqWG1ncEh1bnpmRTUvT0V6U0dJaGRnSzBFSlZ4bVBJcnp2WitYenpU?=
 =?utf-8?B?UHRtZlF0QmhnTDg4djc0R20zUE9ab1VkRHByUXlFS1hoL2prVGRmMm5MUHY2?=
 =?utf-8?B?cUNMdG1hU3BReHZEVUtKTm50NW1sdmM1Znp4QlNVUXdtR3dNdk4wYTlWOGVD?=
 =?utf-8?B?U0hOY0twMkRudHRWbXFjaEcyVHZqM3dLZ3lram12cXc2Nmw5NUE5TGlTYVdX?=
 =?utf-8?B?aStVQlVjNm9MMUJBQThhenNvREpmbUV3SVlMK3Jualc4cXBWS3lIL3Q1MTE0?=
 =?utf-8?B?VVljcjFUNVRKZktWSktGWm5sREFlQkxLejd1TzFCRnBPRkRZMFR6MWoxY3Jx?=
 =?utf-8?B?VUhXampsZ2VoZlIvZmlPTzBiVzlpc212UzFkR2dvUW9pdEUzbmpuZWtNUExq?=
 =?utf-8?B?S09mblBYRzNxaWtRSjFWb2Y0ejhmZzhrMU04RU9Yc3RDa2V6QjgzNFhYQWZM?=
 =?utf-8?B?dzN0WTFUR2puZGxQNUoyenV3TTZFSjVjMFlQVldWVkQxNEo3dTJicDlwS0RW?=
 =?utf-8?B?NXVEWDVmdVFNanRPL0tKZEl3L3oydE5HNm9yYmwwRHdvampBYzFRWmppdnpr?=
 =?utf-8?B?UG1TeSs2T0hGOWxRRTVITkgyQWpiNmI0Rm13Tnl3dTl0TnNMTXorU2I4WlFr?=
 =?utf-8?B?OWlnL0sycWVkR1l5QjVYc0pUc0ROYlhaeXhMRnNzK2xrV0lISFRGZnJPYi9Q?=
 =?utf-8?B?cTNIQ0I0SGJtd3hGOEwwY0hGdlFIclF6cVd6SHhnMDgrMGpLbFNJTDVNOW5S?=
 =?utf-8?B?SVNQWHFteGJ0TDVnOEIyejhJU1BuOUZkWmlMcTB6NmJNd1pYdDdqTW9jeFJx?=
 =?utf-8?B?Yk9NMEZ6OW1oeDl4YkFTMG9iR2FuY0JGeVlORU1JeWUxQ1ZmTytNcGdXdkdm?=
 =?utf-8?Q?Q8fGcOTBf2WEr8gA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D331E41B8A2A0C4AB09782EDA37C0F7C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sMgykFUDuG4B0JfhipBYvYYiHIQ5UHUuLFcsJ9Zf4Jcvd8Kq9AGSiyeF6NGnLfmTttgBZOMnPbms0zLOm4FYQjndXvzpIcazPF7myvsd2B6d6zL6n4+4+5raa3l2jCrHOpdaGVibgyIu9R6l3As6CTKlDcv9ZXNrJAAjGU3NIbseb5Sz42bL6brqAKqfZucqvdo2Wh5ah6tyRBRJaEReKteX2PMq5O0bnH36zPaXAOAyFG/QefaVGeVXFjBPoAbXgNvDzVF20mc48nVhRLUNVMzObaUQ1KRg2rZFrDXIUal7pmBadAfPGy7cwmoiCIOh1pPTBTnMNdwgKS/V88aWcw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d37f832-53fe-4c31-900a-08df255972f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 16:30:22.0569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56lyWvmJR7lGfuHTjsPY3ix7QfRhNUd2cbQH6EbVkvdCcEqluhNqCTrY0tE0+IObHd/Whcu3dZX9PtPRo9K1Df0TTlsaRop9r0yqjIOMH7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDA2OjQ1ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gVGhlIGNvbmNlcm4gaXMgaG93IHJpc2t5IGlzIHRoZSB0ZGdfdm1fcmQoKSBleHBvcnQs
IGFuZCBob3cgaXQgaW1wYWN0cw0KPiA+IHRoZSBleGlzdGluZyB0ZGdfdm1fcmQoKSB1c2FnZSwg
YW5kIHRoZSB0ZGhfbW5nX3JkKCkgZXhwb3J0IHdoaWNoIHJlYWRzDQo+ID4gdGhlIHNhbWUgZGF0
YSBzZXQgb24gaG9zdC4NCj4gPiANCj4gPiBNeSBpbml0aWFsIGNvbmNlcm4gYWJvdXQgdGhlIGNv
bnMgb2YgdGRnX3ZtX3JkKCkgZXhwb3J0IGFyZSwgdGhlDQo+ID4gU0VBTUNBTEwgcmVhZHMgYW55
IFREQ1MgZmllbGRzLCBzb21lIG9mIHRoZW0gYXJlIHdyaXRhYmxlIGJ5IHRkZ192bV93cigpDQo+
ID4gYW5kIHRoZXJlIGlzIG5vIHN5bmNocm9uaXphdGlvbiBiZXR3ZWVuIHRoZW0sIHNvIHNlZW1z
IG5vdCBhIGdvb2Qga0FQSS4NCj4gPiBSZWR1Y2luZyB0aGUgc2NvcGUgdG8gcmVhZC1vbmx5IGZp
ZWxkcyAoZS5nLiBURENTX0NPTkZJR19GTEFHUykgbWF5IGJlIGENCj4gPiBnb29kIHN0YXJ0Lg0K
PiA+IA0KPiA+IE5vdyB0aGVyZSBhcmUgMiBjYXNlcyBpbiBmbGlnaHQ6IHRkeF9nZXRfbWF4X3F1
b3RlX3NpemUoKSBoZWxwZXIgaW4gRElDRQ0KPiA+IGFuZCB0ZGdfdm1fcmQoKSBleHBvcnQgaGVy
ZS4gTWF5YmUgd2UgbmVlZCBtb3JlIGNhc2VzIHRvIHNlZSB3aGljaCBpcw0KPiA+IGJldHRlciBi
dXQgYW55d2F5IEkgYWdyZWUgd2UnZCBiZXR0ZXIgc3RheSBjb25zaXN0ZW50IG5vdy4NCj4gDQo+
IFdlIGhhdmUgYmVsb3cgZXhpc3RpbmcgdXNlIGNhc2VzIHdoaWNoIGFyZSBvcGVuLWNvZGVkLg0K
PiBNYXliZSBuZWVkIHRvIHN0YXkgY29uc2lzdGVudCB0byB0aGVtPw0KPiANCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRkZ192bV9yZChURENTX1REX0NUTFMsICZjb250cm9scyk7DQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZGdfdm1fcmQoVERDU19UT1BPTE9HWV9FTlVNX0NPTkZJ
R1VSRUQsICZjb25maWd1cmVkKTsNCg0KWWVhIEkgYWdyZWUgaXQgZG9lc24ndCBzZWVtIHRvbyBy
aXNreS4gUmVnYXJkaW5nIHN5bmNocm9uaXphdGlvbi4gSXQgaXMgYQ0KbW9ub2xpdGhpYyBrZXJu
ZWwuIFdlIGRvbid0IG5lZWQvd2FudCB0byBoYXZlIGV4Y2Vzc2l2ZSBkZWZlbnNpdmUgY29kZS4g
V2UgY2FuDQprZWVwIGFuIGV5ZSBvbiBpdC4NCg0KRm9yIHRoZSBxdW90ZSBzaXplIHN0dWZmLCB3
aXRoIG9ubHkgb25lIHVzZXIsIHRoZXJlIGlzIGxpdHRsZSByZWFzb24gdG8gZXhwb3J0DQp0aGUg
Z2VuZXJpYyBoZWxwZXIuIEJ1dCBnb2luZyBmb3J3YXJkLCB5ZWEsIG1ha2VzIHNlbnNlIHRvIGV4
cG9ydCB0byBtZS4gTGV0J3MNCnNhdmUgc29tZSBwYXRjaGVzLg0KDQpJdCB3b3VsZCBiZSBnb29k
IHRvIGhlYXIgS2lyeWwncyBvcGluaW9uIG9uIGl0IHRob3VnaC4NCg==
