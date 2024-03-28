Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1190142A88
	for <linux-coco@lists.linux.dev>; Thu, 28 Mar 2024 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711613485; cv=fail; b=l4vNQiH5p6a/9wTMMDjNHMk9OOyhTvyZFUZ1ullAXM/T2o5SwWRy9NMOFm6FcHRjRwb8qP2QdIbMvgFbXPK9WRa/mit1zWStczmOxPAYaETXphEd+FCWmwlVc+AX42LFoAAuE/6FoVCK66APg0tpJ/dVDgKD/xl/DzHu/CWerec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711613485; c=relaxed/simple;
	bh=OtV5e4Fcwaa7ZhER6hrPI/TFFzqI4VlacwDYCL+XM78=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Fvk//giSTe7935fytDEwrBlG2tiZEHU5aF0yxiTh+n1rNvV6direNdiXLRg5E9b0rvdej4Bl2U7Aiaf6UBKVRyVEQvGJ58Wc6coLD1BTBwAo36bJrgFmY6tQq/b/2ybCgvgjWjvRoVJbTgl2Rv9MsucdnBbaNnnia+aLDBFqqPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+UfCPhF; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+UfCPhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711613484; x=1743149484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OtV5e4Fcwaa7ZhER6hrPI/TFFzqI4VlacwDYCL+XM78=;
  b=f+UfCPhFzA7VQqBoQ9JgeWYiccZ6EIAzCTVYqtTgFDJn4jIFt/2Bk1sW
   FQ57ACOTj5LC2D3uCIcWnJ8G4UgxXbsqrzjXsTmKZWAsPzkSupFWtuld6
   jeeKXQwQ8pi2krooRYo7/oY5/frAyqvTy8eNA1ATOLWaEivoq9SH86gm6
   0Dv9ly+faL6/hJVKIzAeOeyqZvDetU/gTK1ui9vduAQvtEm9PdCitBKNC
   kl5w8ajbMZ9sT7WjYlVttczNiLs5B2zgoMDBrAwqCOcSSj3gEMc8MoTZI
   12fvJWCaxtFKCAqXQttKCr/bCJwpCrPaJXTQv5yH93+KwZlUhpvk5rk8P
   w==;
X-CSE-ConnectionGUID: EgIHZOOpRZOyBb4ZTt+kFA==
X-CSE-MsgGUID: VHa02liZQTiZjNmucib5Ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17480846"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17480846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 01:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="21236786"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Mar 2024 01:11:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:11:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 01:11:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 01:11:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 01:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8Up4I4VJZdQ0pPHunxxomSIjI97ivSLMq64rZmZyydb/zXIsqnPUYlFdJcCvlcATeJvqB36lTZcqnRjUf8NNVOXGIbypYTE9eWfS0+eKd/Ef+1MPJXmUDdjB3F4cqDZ0i2XC2jYCb1tszxAL4ax8UYH+Slpm4+50duEQmF8hRZ4cVR0BHMMEQnfysDa1/8UczK2TukNU//o2pcU7dRlUJ0DdF2z5vB1aN14Y3E4oVWh/zpBaZGepy/TskgXyZ4tinCMB37SF/bkXa2WmpxHU7HeFu9sy2RclKL4UhD00hVSR/Vvp/FQVTl2gxukE64xSKQu0DdkrsqOIov2CjgUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtV5e4Fcwaa7ZhER6hrPI/TFFzqI4VlacwDYCL+XM78=;
 b=OxSNnIFa/uxk1bPrvKIMESlReJIbsQjYzAAIQ6ChxAGUdLEyZlDBAhM4hz5xifcWS5gMCMcO2XS13t8ekPbrdQSWh798B+lF2A0UHxC8vP0doTu73JyI4kyp0IUuUhhmRiLP0t5Ep3n62QmnPOnAkgLGVROD/+wUBVeLAtUkNRxZmHzcCR/tolNb5+5NljQuvUQKieuncaJboCB3eHmhX/viCXzHS9wJTV9jq0zQcFZYNlNTdNN34ZKhFj6exmS97PL6wAOt81qpGXhUwcnzgHpTWx13W/rhivmk28PRT6IJJ1YNnnT/+OzPVnYLxtrOCIElEu+YEB7tG3JGav8Alg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.31; Thu, 28 Mar 2024 08:11:19 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 08:11:19 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Yao, Jiewen" <jiewen.yao@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
CC: James Bottomley <jejb@linux.ibm.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, Joerg Roedel <jroedel@suse.com>, "Lange, Jon"
	<jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson, Simon
 P" <simon.p.johnson@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: question on vTPM interface in coconut-svsm
Thread-Topic: question on vTPM interface in coconut-svsm
Thread-Index: AdqA0eAumCfddllhSAC8Bgc8QrCrvQAB1U1QAAMibuA=
Date: Thu, 28 Mar 2024 08:11:19 +0000
Message-ID: <DM8PR11MB5750F62889411B10570C61AEE73B2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|SJ1PR11MB6131:EE_
x-ms-office365-filtering-correlation-id: 0cd3dfa0-4411-4fda-bed5-08dc4efea61d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xDhTumrcv5sUxjb/Z3VZjcbOTTfDzhSQ1UuN6x4mdSTkLlHFv87P+Ww3H2owC0aAe9cDxl0dOnJd5w8qwkSbLgB9YgSI5PT20nxdsxp6xEoekqpw4zOHIwRrTPw95YZsqu86FMX/AHtiAsiC9udE2DufP7/5ysA13/mEWgVuZEKd8lTU6zXo/v3TUV2eLlLJB/O06BWnXyhu6fb0Qeuwp9COIvKCbh2GR8q6FTwE5wknOcuF/n/QyehAxULPkLd0DdSaRAGNdj5f/uV91Mm/VgVJHA+T0F94LiKGRf3qskjN7QQvv8N/xMPYn4itu7hbbNz0NW6i8cBBSzB4Bs9r1S7uYjaviAH8rGORIBN1dJsOz/0Rib6+EBpiKszxyVU4tHl5/HVF/IJBGDtyi53GNXH2yOBHMSfCtE9z93ZeoWcXeLB0JRwwn4wWPtc/UWPzz8gAKkTl+FeZxBgF+RcLs3zdfhexr5AI77q14GopEHMXdD/r1qhzuWWVdevR+WyO50YzfOrhJvLgL4k8Tkr16UfqZ+1z8eQg6yd0YfJGYOY6zw0gmbGpY3X0gTLBPO+6cPL8Z4A7EpbhREQvLQ9+kw6RcOhZTN9Comx2rQE44Dt6McSseZKTmfR1LTSD7tRe1vM2RGLxcui0JE+yBIrL19kDrZ7990JbHaU1H9JWsCLyQF45t/DuxPhHAtHvbHxyH5QkLRl8+gnrJyQFf9bLbrMqh7hQ7JrIg+cUzt/htZE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlE0dmdFSldMTmEzNWk1VUluanhWQVdQZC9Qc0hmenFGeWVxdnhQa3dmTmdF?=
 =?utf-8?B?aW9oakVkMzlLbzhZeEI3alhsZ3BRVUhRY0NLdnJKMGkzUE9HVTdROS9wK0RU?=
 =?utf-8?B?RTcwUTJRTnU5eit3NWJ2V1RaeHgzYmNpL3gwY1Rlay9zcDVtdWUrN01lQ1BT?=
 =?utf-8?B?bGJvam5mSlljMy9TOUFTN0F3bnVENE9GaGRHYmhHTVBmTkZBTjhteVhGTzJj?=
 =?utf-8?B?c1hraWFXTmp5VUxrWitkU3RLbmFzTnc0U01iNVZZbFRsWjNFYWdJd1M2aU9J?=
 =?utf-8?B?WXl0OWxYS245Qm8vaDBxenRvUWFMaCtKTjFJS0hQdFlUVTFnSEFWZkMzTGxD?=
 =?utf-8?B?VkxPd3g2Y2YvWUROUldrSkdLR3Zsb1F1NW9FRTdBN0ZqYUxNUlRPaWdvUjE1?=
 =?utf-8?B?TitreGM4bW9jZ0dsVWtSLzdIa2haMjJXQkRndkxTaTd2NDVrb0IzbE5Hb1U2?=
 =?utf-8?B?U1B1blNWSDgwVitJeXdFcEdLNzhTWjRySkFFOXl0VVhuc1Q1bm5SbCtFK0JM?=
 =?utf-8?B?N0pXd01VcnJGMkNzMklJVWUrcXNtaVdmYjUzUWFqVnpYY0ViQ2JFZERyN2Ny?=
 =?utf-8?B?ZTNvWWZFbnl2T0pSSzVGN05WeFNRWVo4eU15NWg3bkFWRjk5Ymh1dWp2MzdP?=
 =?utf-8?B?dWN5bGNnNE1zNHVTa1ZXRk1xdGlBRVE0blI4ZlU2OGVzUFVJMDUzL1IrU3ho?=
 =?utf-8?B?NnJhek5YYXZ1WHlpV0JXVEhnd1hJdUh4VTZRYVFSQW8zQnY4TlVTTWJLKzZK?=
 =?utf-8?B?cnF5bEEyS1NHR1lPU0RXOWRsTUJDM1BMZHFRdUNIU1Fqb3VON1krdU5mcG56?=
 =?utf-8?B?QklGUjdLTW1rZy9oSUhuMThSbUtuOTYyVjBaYkpyRzVXbDM4aTJwbEpmdm9O?=
 =?utf-8?B?SzQ2L09wK2I5KzJQM09ZK0NXc2tYenVUdTB4eWxQTS9zK1o5bzgwRzBGVGFL?=
 =?utf-8?B?MXFTaSszUW1QbUR0UTZycWZjL1NoRWs3Y3JzczBUNTNabWkzNFI0d2F1M0k4?=
 =?utf-8?B?T25rQlBmTklsYXdWc29nN2ZWaW10bWlaYW9wWjE5LzRhcklWSDBvMjNQSXlV?=
 =?utf-8?B?T29NY3ovSlhyWktLZVFJQXJlOEpZYlFNTWtLcVBDQ1ZZRUNIamh3TUs5WEVL?=
 =?utf-8?B?Q3hYM1hTbUZwVUxkTkNDWS9TSGNLRDFSMmdGTXk1TE5kSW9xdkordVdSbkds?=
 =?utf-8?B?Z1I4WUM1ZDBaVys1NTM2ZHJSay8wU0FvQ3c3QlpYYXh1eUZQNmdadzFKby83?=
 =?utf-8?B?S1BubUlMelB6cWM4Vy94WGphR0tRYmZLZGtoT1QvelJaTDdTMHB3V2QvcDV5?=
 =?utf-8?B?R0ZjZXhrMUs4dDNNZEN1TFFCNGNCWGJtOFNyR2c5ejRKMlJLY3BqSllnMUh5?=
 =?utf-8?B?aWpLZW44YkRSa3FnSVJ0LzZEOGRGY0RkSG9KOUg4TG5oTmdXZXJWL2JRcHJ4?=
 =?utf-8?B?SW1qVEJibTZZeHM1U0FtTXdTL3ptS0RrZno3ckNOMFpqQ1hUV2tDZFBmakJJ?=
 =?utf-8?B?SEY3cVcweVpFTUtnNzFaQnBLb09NN24xZnZxWVcwU0NPT1YrQ1d6VEMvYUdt?=
 =?utf-8?B?eU0xNkZKa1B6WnBXZUFnaStkRHR4NUZlZGNYazJaS0lxRURNR3VTNGp3Ukdq?=
 =?utf-8?B?RDBDckJZS0hSYzlrbW1jTVBTVGhTc280dk5DWXBYcFUydWRCOVRXUVpGWUNv?=
 =?utf-8?B?YVRNK2VVbUQ5TktJekc0YWpOTzdaZk0vcXJsUytZK0tkdFhzQ29UMUxFYkV6?=
 =?utf-8?B?SndHTU53S2xsTG1CQ2VkUlZvQXVQak1tb0xnbExmMDl4RjVhdjlvWWdqNmdW?=
 =?utf-8?B?NG1QR25uaEJKOXdwaEZ5U3FNeVk2NWF4LzZJZmtwNHFlbFBLVTZndHloSm51?=
 =?utf-8?B?SEJSenhOVkZia3dwRkpNVVhJbzN6SkltdmtnYzNFM3F3Q3dTUEw1MDhMb2Ir?=
 =?utf-8?B?ZFNBSkJoUlRZVHFTR2hId1lqbDZzR1IvbzhjTS8wREgzblFCWTBRdU5teGtR?=
 =?utf-8?B?VGdNOHRsZnZqODhlTmZTSEN2cUNRTUZXcHgrSFJoMEc0ZUhDM3VrMmtzMTZJ?=
 =?utf-8?B?aGlEY0N5UE0vckM4RHM3dHg1c2NoUFZBbmV0QWd5Z1FIRXU4a0kzVlhMVG14?=
 =?utf-8?Q?6+CiQ7o670ihAwe5+IjZadAZc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd3dfa0-4411-4fda-bed5-08dc4efea61d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 08:11:19.5045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCv7RUq3jdLutXqbxzpQVhj52ztq1YSlhYbCXsJCcIeYWheR7SbZbU2xvWK20HDHnwFSV+dm3yq3W2gNdLg1Q0/MW2F8Fz8hwDIe1In6z7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-OriginatorOrg: intel.com

PiBIZWxsbw0KPiBTaW5jZSBJbnRlbCBpcyBwbGFubmluZyB0byB1c2UgY29jb251dC1zdnNtIFsx
XSBmb3IgVEQtcGFydGl0aW9uaW5nLCBJIGFtIGV2YWx1YXRpbmcNCj4gdGhlIHZUUE0gc3VwcG9y
dCBmb3IgY29jb251dC1zdnNtIGFuZCBMMi1HdWVzdCBmb3IgSW50ZWwgVERYLiBBcyBFREtJSQ0K
PiBTZWN1cml0eVBrZyBhbmQgT3ZtZlBrZyBtYWludGFpbmVyLCBJIGFtIGFsc28gZXZhbHVhdGlu
ZyB0aGUgaW1wYWN0IHRvIEVES0lJDQo+IHByb2plY3QgWzJdLg0KPiANCj4gQ3VycmVudGx5LCB0
aGUgUFIgZm9yIHZUUE0gaW4gY29jb251dC1zdnNtIFszXSBpcyB1c2luZyB0aGUgQU1EIFNWU00g
ZGVmaW5lZA0KPiB2VFBNIHByb3RvY29sIC0gU1ZTTV9WVFBNX0NNRCBDYWxsIFs0XS4gSXQgaXMg
YSBicmFuZCBuZXcgY29tbXVuaWNhdGlvbg0KPiBtZWNoYW5pc20uIEFzIHN1Y2gsIHdlIG5lZWQg
YSBzcGVjaWFsIFNWU00gdlRQTSBkcml2ZXIgaW4gRURLSUkgT1ZNRls1XSBhbmQNCj4gTGludXgg
R3Vlc3QgWzZdLg0KPiANCj4gQXQgc2FtZSB0aW1lLCB3ZSBoYXZlIGFsc28gcHJvdG90eXBlZCB2
VFBNIHN1cHBvcnQgZm9yIFRELXBhcnRpdGlvbmluZyBiYXNlZA0KPiBvbiBjb2NvbnV0LXN2c20g
WzFdLiBGb3IgdlRQTSBpbnRlcmZhY2UsIHdlIGp1c3QgcmV1c2VkIHRoZSBvcmlnaW5hbCBUQ0cg
ZGVmaW5lZA0KPiBDUkIgaW50ZXJmYWNlIGluIFRDRyBQVFAgc3BlY2lmaWNhdGlvbiBbN10uDQo+
IFdlIG1vZGlmaWVkIGNvY29udXQtc3ZzbSB0byBwcm92aWRlIFRQTSBDUkIgZGV2aWNlIG1vZGVs
ICsgVFBNMiBsaWJyYXJ5DQo+IHJlZmVyZW5jZSBjb2RlLiBJdCBpcyBzaW1pbGFyIHRvIFszXS4g
VGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB0aGF0IHdlIGRvbuKAmXQgdXNlIHZUUE0NCj4gcHJvdG9j
b2wgWzRdLCBidXQgdXNlIFRQTSBDUkIgaW50ZXJmYWNlIFs3XS4NCj4gV2UgbWFwcGVkIHRoZSBU
UE0gQ1JCIE1NSU8gKDB4ZmVkNDAwMDApIGFzIHByaXZhdGUgTU1JTyB3aGljaCBpcyBvbmx5DQo+
IGFjY2Vzc2libGUgYmV0d2VlbiB0cnVzdGVkIEwxLVZNTSAoY29jb251dC1TVlNNKSBhbmQgTDIt
R3Vlc3QgKExpbnV4KS4gVGhlDQo+IHVudHJ1c3RlZCBob3N0IFZNTSBjYW5ub3QgYWNjZXNzIHRo
ZSBUUE0gQ1JCIE1NSU8uDQo+IFRoZSBUUE0gQ1JCIGludGVyZmFjZSBpcyByZXBvcnRlZCB2aWEg
VENHIGRlZmluZWQgVFBNMiBBQ1BJIHRhYmxlIFs4XS4gVGhlDQo+IFRQTTIgQUNQSSB0YWJsZSBl
eHBvc2VzIFN0YXJ0TWV0aG9kIGFzDQo+IEVGSV9UUE0yX0FDUElfVEFCTEVfU1RBUlRfTUVUSE9E
X0NPTU1BTkRfUkVTUE9OU0VfQlVGRkVSX0lOVEVSDQo+IEZBQ0UgKDYpLCBzZWUgWzldLiBBbmQg
d2UgZG9u4oCZdCBuZWVkIF9EU00gZm9yIFN0YXJ0TWV0aG9kLCBzZWUgWzEwXS4NCj4gQWZ0ZXIg
dGhvc2UgY2hhbmdlLCB3ZSBjYW4gcnVuIHZUUE0gaW4gT1ZNRiBhbmQgTGludXggR3Vlc3Qgc3Vj
Y2Vzc2Z1bGx5IG9uDQo+IHRvcCBvZiBjb2NvbnV0LVNWU00sIHdpdGggbWluaW1hbCBjaGFuZ2Ug
b24gVFBNIGRldmljZSBkcml2ZXIuDQo+IA0KPiBRdWVzdGlvbnM6DQo+IFdpdGggdGhpcyBQT0Ms
IGl0IHNlZW1zIFRDRyBDUkIgaW50ZXJmYWNlIFs3XSBpcyBhIGZlYXNpYmxlIG9wdGlvbiBmb3Ig
dlRQTSBpbg0KPiBjb2NvbnV0LXN2c20uIFdlIGFyZSBOT1QgY2xlYXIgd2hhdCBpcyB0aGUgbW90
aXZhdGlvbiB0byBoYXZlIGEgbmV3IHZUUE0NCj4gcHJvdG9jb2wgWzRdLg0KPiBXb3VsZCB5b3Ug
cGxlYXNlIGVkdWNhdGUgdXMgb24gdGhhdD8gV2h5IG5vdCByZXVzZSBUQ0cgQ1JCIGludGVyZmFj
ZSBbN10sIGJ1dA0KPiBpbnRyb2R1Y2UgYSBuZXcgb25lIFs0XT8NCj4gDQo+IFdoYXQgaXMgb3Bp
bmlvbiBmcm9tIExpbnV4IFRQTSBkcml2ZXIgbWFpbnRhaW5lcj8gSSBiZWxpZXZlIHdlIHdvdWxk
IGxpa2UgdG8NCj4gYWxpZ24gZm9yIHZUUE0gc3VwcG9ydCBpbiBFREtJSSBhbmQgTGludXguDQoN
ClRvIGdvIG9uZSBzdGVwIGZ1cnRoZXIsIGl0IGlzIGltcG9ydGFudCB0byBub3RlIHRoYXQgd2hp
bGUgdGhlIGN1cnJlbnQgIzEgdXNlY2FzZQ0KaXMgdlRQTSwgd2UgY2FuIGVudmlzaW9uIGluIHRo
ZSBmdXR1cmUgb3RoZXIgZGV2aWNlcyB0aGF0IGNvY29udXQtc3ZzbSBtaWdodA0KZW11bGF0ZSBm
b3Igc2VjdXJpdHkgcHVycG9zZXMuIFNvLCB3aGF0ZXZlciBkaXJlY3Rpb24gd2UgZGVjaWRlIGhl
cmUsIGl0IG11c3QNCmJlIHNjYWxhYmxlIGFuZCBhY2NlcHRhYmxlIGJleW9uZCBqdXN0IFRQTSB1
c2VjYXNlL21haW50YWluZXJzLiANCg0KRm9yIGV4YW1wbGUsIGFyZSB3ZSByZWFkeSB0byBjb21t
aXQgdG8gd3JpdGUgYW5kIHN1cHBvcnQgYSBuZXcgc2V0IG9mIExpbnV4L0VES0lJDQpkcml2ZXJz
IGZvciBhbnkgZXhpc3RpbmcgZGV2aWNlIHRoYXQgc29tZW9uZSdzIHNlY3VyaXR5IHVzZWNhc2Uv
ZGVwbG95bWVudCBtaWdodA0KcmVxdWlyZSB0byBiZSBub3cgZW11bGF0ZWQgaW4gY29jb251dC1z
dnNtPyBPciBkbyB3ZSB3YW50IHRvIGRldmVsb3AgYSBzZWN1cmUNCndheSB0byB1c2UgdGhlIGV4
aXN0aW5nIGRyaXZlcnMgZm9yIHdoYXQgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgZGV2aWNlIChm
dW5jdGlvbi13aXNlKSwNCmJ1dCBlbXVsYXRlZCBieSBkaWZmZXJlbnQgZW52aXJvbm1lbnRzPw0K
Qm90aCBjaG9pY2VzIGFyZSBwb3NzaWJsZSBhbmQgZWFjaCBoYXMgaXRzIG93biBzZXQgb2YgdHJh
ZGVvZmZzIHRoYXQgd2UgbXVzdCBkaXNjdXNzIGltby4gDQoNCkJlc3QgUmVnYXJkcywNCkVsZW5h
LiANCg0K
