Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA08352C34
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 06:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958279; cv=fail; b=QkpU6NF7c75NEwlZTfsMBgalaOaFHADPmwR4aSAw48UDrRCD5tTZv5vSc6SP1h3zO9jwogR2zGOS8XnUSNSRlwcQ4OBsk8idAwhHxtSCMaxKkxGuvLH28qw1t5qz8rgiUzcI81pOzqYfcKb+quhTlVlKHeMv3reE07JrWFW1Az0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958279; c=relaxed/simple;
	bh=DqMUe3YWghuppSfa/ClW8DOMddaC+Rmp+YIclsjF5KI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MR5D1Pyv/xooFfJNq/D7O0rYYhIs+p/U5yQSQk/OwkW8dwFIQQ1zA6yOMAvxdCspIVaGDEbnx2uloYPKoUX4RK6AsvG3aG5Y5xyTvR8N8ZJ9O2xAYAi1JlUu/m3hIK/i+1z6gGL87eYny4DxunWsLt6T2WNOzu1j/Qacs64w1m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7u1oBSv; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7u1oBSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791958278; x=1823494278;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DqMUe3YWghuppSfa/ClW8DOMddaC+Rmp+YIclsjF5KI=;
  b=f7u1oBSvLJqBUGHtIM//wW80ZgzhMXDTm01UZQrD06gIz7XQo7CsJgeE
   y3qGr4EhXASma66+h4nr35WTS0VdnU3nuJ0o5Qg5L9wKPyXkApr82vuSC
   91jLEIHqdY9TOq35jpXBIosT5n0GOlbVOPzTIbugFjvqRFSVo6Otc5xzH
   GVzaOzRtCxgijqfH5uRkqsEMEvABZDoac7Vs1QHJ+KslFNeUNFmeyuRPp
   x9VJEJx773DHUoDt9MM0hOx3RmfxTJpHPx9ttoIX5ZpfLKqR3B7N2X6NY
   cIQgtjhpiSqdRf+r536OGjenHBhunG9POfIgoxs2Ck/iF+pOJqUZQHMdO
   w==;
X-CSE-ConnectionGUID: x3/nAXMSTliffVI5boQ4vg==
X-CSE-MsgGUID: kJ7bS6hLQZGz4jlt/ChDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="725917"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="725917"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:11:17 -0700
X-CSE-ConnectionGUID: 0BuQCg+DSumIgzq7cswEPQ==
X-CSE-MsgGUID: mpEJWvBNRNGB3Th3jw20wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1312343"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:11:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 23:11:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 23:11:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 23:11:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvkRzgWFK55DdXzaU3SyjoNJzHFjav0cIySlR6iyuomPaVHcrPKHmFXcekr/WrH93HVOR6rngNrdyFB5gJQkGF0UPgyXl7TIOx0dmZKMBQPf+iWigQyvWO6UoYrY0OVC8V57pYu3qyJFt5iIiwrNTFbwS1oQH2tGX1kWDYYJBW/jiEiI+KxlUtc9uKl28P77fbAqlcCxdbfQDOcpLK6iyEUSzSuD4JPP2gwaJWWfnbzaczDpfgaX5AwT1BpG2MSae4bE+fjTW0gLu00ZMpi+06zf/+kgAMX1UTHhnGyDO1yvpXbMvWYVT/kwoQh5pe98o4eF57dDiruj4vjbo04aiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqMUe3YWghuppSfa/ClW8DOMddaC+Rmp+YIclsjF5KI=;
 b=c/OysiQIermRUShV7PZe6mhaTLGdiO1kA9nFN5UFWD9AksJohvaRaXyG45k32POJz2vdzyH69uJI5WXoXmAM/TanFwTomsKrClezFD8MEtlqB8aNfE2xXEW8psY5ajUQFbGi6VKnR77q6mlsfCQTFR4x3YRQnqf/CzmPR9DOnxz7uJnFmokRaTjMkqOFvSu8dunTFTK3Oy+LZQd6y+03Ftu/6/TjTSU8j3JRNbANgQoNa7bzckFX+2UMZVfuPOKFirZxkIWGfSNtAxL77+KTAK2YaC8HJd1Nv5ZuoiA1wS/2AjzsB+B3sLlcgUI6sRsIh/QmoJ1pueYdJVkvHH/HZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 06:11:08 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 06:11:07 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Topic: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Index: AQHdS9rFj3TOaGBm102dHqDSOZ3G+7b7p24AgAD8vrA=
Date: Wed, 14 Oct 2026 06:11:07 +0000
Message-ID: <IA3PR11MB9136E76982E260079081A59F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
In-Reply-To: <686a2511-1d4b-47cc-abdb-951693cf1771@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|IA1PR11MB7809:EE_
x-ms-office365-filtering-correlation-id: 71b12943-c7db-4b86-adb8-08df29b9efbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|6133799003|18002099003|22082099003|10067099003|3023799007|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: Ou1F7kQQ+aktwZPSqPk0CccVIMMeIC9RnKulDd0rSoB3Fxo1zTyYjGO3LmTaxZ76W4PgJudoRaHBOix12MPxHzPjMD1uElrWWDF21G+qxOsoSiIbEZiY9u5nysu59YbhS7bTQ/DKrc/T9ALYBv9zVwYEzFmvtnfeJ3YdcPlu/Dxly75MARvF6JQheFq+sPtPxnIR762/JG93omc6da6v9bHyv4fjRuurSvYASWp+x6IcfjiLcX2N7neD0S0XbP3yMn/tWVaCjFKJsIIbP4YUt+9FLNrPX+HjxsuA3uEujrKIQWndhyIirRo42V94cE2L1tgec9431GZLa3NEq0o2ryXHOkbH+AkujNsTKK8eMXmLsYCX60otUPz0bwLS9R4WGdki2qG3el15r5qgLqTLHsW7lk85249WJhTCKgfpZd0PvYZuvH2HYBdX2b2p12bxz2be5AM/86V3WRulcII/nRA3LtTuaB9pGdt0HTMr6FAx4dd0ohtqpWwSPKWBtkSak0DxwV0XLFUstWeMfyZ7IWrCNZrSxBPidyLETevz71RsFXaEjK/v1qgYZZQMgWZM8SHZZAq2djOdim9MPjm0Ng4Flx0WsVCwUGMFy/J1p1TQrRC/b9Ofh4bsOssWLZAVhFFMP/WwLGZ8GqVC/7Q1/5BVyScn45AGf/aM527/IlFiV29E2wL0p5bP1SXm6W6oFHqrrvMnLrpa2fgG5/I1FFiHxOTPjlh4YLSnx4ZwqY4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2NnTkE0d3pVODdWQTFvNXQrblAvUXlzT29EdmZWRXh4RXdjcmR0MmJVVWI4?=
 =?utf-8?B?TGtTME9XZ3F2SENhZFZaa1M5TitVazVYQ3Z0aUVzQ1ROcHhkMXJ6WFErU1gy?=
 =?utf-8?B?L0pGY3FxQ3ZBV1JoNHRQczNsYjhzNU1oRDltNWovK1dPbWh0bnlMQTBEcWpa?=
 =?utf-8?B?VVZCVlptNnJFQ1hRVHFmbVJpM0J3VlQvNFlSaUQzUlQ3QkdXRENDR0NOd3N3?=
 =?utf-8?B?VUYvZll4amthdmpJYmpHdDI0ai85T3dRaEM0bWxXS3RQUHlxU2wrM2NwSHNE?=
 =?utf-8?B?NkExTzM4eGNsaGRFeFh3d2g1a1FSM3loeWxqVFNMVHhjZEZyQ1drOHRDWEZY?=
 =?utf-8?B?aCsyOWxNQTdJT1JOcE4zR0VMY1hNVjNtWVZqeEdXeEw1MEZsM2cwTGhvR24x?=
 =?utf-8?B?VUlPdVNWR3lhVnVqNm81VFhBREdpT3lkNzhZMmFWcWQ4S2M2dFd4dU1nZWJZ?=
 =?utf-8?B?T3JqbCtmMEpCYmpkVW1yaDRnTGk2bFdhb2Nna0IwMS9iN1ZDcXJLMGtVQUlP?=
 =?utf-8?B?ZFYxMURiZkpTZUZYNnB4d2plc3RVTHNIMThrSEpIZG9PMERtVDF0UzROeWE0?=
 =?utf-8?B?ZDlVWStCLys4QW11ZlJZUENpYjF4NVFtMXRvMlFPZDhpNllORXcra0dKNkdv?=
 =?utf-8?B?WDBUQ1I2a2wxUzgrSGtEdm9mQm4wTGFiYWtKNEdmdnhWYW1tZnM4cVBhbC9l?=
 =?utf-8?B?SUFVWHVRU1VDSzlSc2o5SzRWQjAzT25malJCNmsyUU9IWjk0YjJyUnVvUWc2?=
 =?utf-8?B?NDdXMjlKb2RTZ3dNN1ZMbjdFMlVXKzJ4OG9TelhVZ2lYZVArZzFGakJsRVY0?=
 =?utf-8?B?RGpzc3A0cDBlZ0JFUzY4Z1V1L1FVL25URlR1TCt3TnJxSmU4RlVLSVBidm1V?=
 =?utf-8?B?VFRYajNjV2dvNFNmMlpHVGtLWk5mVnZZN2hDRzNXL3V4Q0RyczI5Q3BxbC9h?=
 =?utf-8?B?Tm1XdlVwWHBJTHFLSDhtUlZCc2lJSVFrUmVkcjJ3dno2NmF6a0FoTTdIOXBm?=
 =?utf-8?B?enJyTiswdWNZb3VmeGVyTnJGMGhqUWVkbHAxOWVmamZyelRDUTZQbXNzM0h2?=
 =?utf-8?B?aWM3UmRNelVQdXRPSmdEZ3B6eU02T2FjbzlEbnFibnFPVFRWYk1hbUE3YzRk?=
 =?utf-8?B?dXhPMWU4V1JISTZBQ1BlaFdxMW91SVRyc2ExamlHVENsWThyeWJxVkxKVmt6?=
 =?utf-8?B?bmNJTklPeEtLRzJqdVBOYXJBTjA4RS9DcHFnUUw1MkhlWWlNMW5NS29HRWE1?=
 =?utf-8?B?QXBrZ1Z6blFJUEdPUGpqeHdFMGNjVWJHTnd2Zk9zN29GTmIzSE9Pa1R2V1Mv?=
 =?utf-8?B?ZkNSUWJnSDZDazgxL3pMQXFsMXdmRWdHR3Q5WGlKQitjOGFuK3JYTzJmYUph?=
 =?utf-8?B?bURKQkJnKzRHOHFwWC9RN3dBL256YXlxQWk1emVxOTZxVVZHb0ZjR1dNMkw1?=
 =?utf-8?B?OVJvV0dBMHE2SmNnay84WmY3aktodXhLWk5PMmdQWXhTdHJwOENOaGhWcVM0?=
 =?utf-8?B?RVlrSzFwN2VrSldSUGRxbWdrOXl5TFJLVG5va3JmNmsxMHBOanNoVW9scTVu?=
 =?utf-8?B?TStNVXhBRlcvUm1NdFBML3Fxd1llS280OXRLU1kwcDJvTmpKM3I5a1ZSWndG?=
 =?utf-8?B?WEd5Y3dmV1dsQTFTcUY2N3kyNjNUdDdmeE5FcVpFam41c09UdG9aQ1NZMFBm?=
 =?utf-8?B?U3dGZUd6c2VuQTdvbjNJaXFYdFhyM2F5Wm5iYjF3ejhwU082cnBMUjR6MVNU?=
 =?utf-8?B?SjhpeVdNak9aQmFncDRaZnRnYkV5MXppQTZjelVHRUVJWnc3dklYNlF2THF6?=
 =?utf-8?B?OCtPMjJHREhZc0pWVE9UVHZCa1NUYU1jU2wvbExSSW9lTkxTQlBsYTBJSUJs?=
 =?utf-8?B?T3JnQ2JsL0dKVHBQTm5RR3BEcE5KU05yOFdHRlQyTzFyTXJDT0VyNmo4Q2VW?=
 =?utf-8?B?OFlwdlV5bjVBNzdmNkNXQ29tVHJDN3ZRdCtmM092Um9WbUJGeDBGNjlWZXpn?=
 =?utf-8?B?ZjRlckw4d2s0MFpISWVmcjBLY2tyL29XUURqNlVRWUdiY2VDTWlQWkxscHV1?=
 =?utf-8?B?SmhSa0lLb1NtYmc0b3pZT3MvSm84Uk1NVy9ZZ0ZrajJLTmw0M2xYT1hoVktH?=
 =?utf-8?B?WFJyejdQaWMvM21MbjNEaDlRcFU1cmF6dHViQ3lsaHNacU5QYVJjVzhXK3dY?=
 =?utf-8?B?MkplY0pkTFNUdFFKWjVETjRnVGxENUVqTURKaFRndEVKSVR3YUdJTTJVTXBF?=
 =?utf-8?B?TkF3QWtPbU8vaWFFSjJZL2xDN3F4MjdJSmwvRWFMLytUTk44c2pQTWU3TjR0?=
 =?utf-8?B?TUpjMWMyOXR0MTRSVWw5MThicExvMGlyM25Jd2FNN3BWYy9FbUdKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Nhg4WV37sLQD8g0Zpy5HstjFkEm6l87fFRxlzC7rjNKDkJnYVZ8x+GnxM9Y9ocKkBjh3i2m3P8NEN7Ulm9AwtVdZ4dusfOyj6z1NASIlYfNGlfrf9ydWCUMmyj3o98OmVrTEAf2TUZ07oZON4OnkENXgxx6WmTz/2IxwX6Ya1DvjKrfG/yKmnlp/2rnsmCnufznDiYia4Hy7QruP+DNqxZ3/JpG2hFmTZei5UZr0sMcILAJY2DtBgbGRy5R393p9BwLEzKRZ7HA/m9o2hE6sIZIIjMbZYSXaCgpjmv2Vz2KOZIREv3OMDGiwb+b4rE9H5qod1CJ/2ugNv5OymVxsRA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b12943-c7db-4b86-adb8-08df29b9efbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 06:11:07.7365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UlP8shFCMSvZXeydf+kCNqz7fy6ie92ruLd5MgTbyUxXOREV6fRAOyvdaWvEm3SZUM0fTwrnyFURuu9Eg8lHxFvw+ipQ5s+b+PTvDOKxqtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDUvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogQWRkIFREQ00gaGVscGVycyBhbmQgVEVFLUlPDQo+c3VwcG9ydCBjaGVj
aw0KPg0KPg0KPg0KPk9uIDI0LjA5LjI2INCzLiA3OjEwINGHLiwgWmhlbnpob25nIER1YW4gd3Jv
dGU6DQo+PiBJbXBsZW1lbnQgaW50ZXJuYWwgaGVscGVyIHdyYXBwZXJzIHRkeF90ZGNtX2FsbG9j
KCksIHRkeF90ZGNtX3J1bigpLA0KPj4gYW5kIHRkeF90ZGNtX2ZyZWUoKSB0byBtYW5hZ2UgZXhl
Y3V0aW9uIGNvbnRleHQgbGlmZWN5Y2xlIGZvciBURFggQ29ubmVjdA0KPj4gVEVFLUlPIERldmlj
ZSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IChURENNKSBjb21tYW5kcy4NCj4+DQo+PiBVc2UgdGhl
c2UgaW5mcmFzdHJ1Y3R1cmVzIHRvIGRlcGxveSBhbGwgVERDTSBjb21tYW5kcyB0byBvcmNoZXN0
cmF0ZQ0KPj4gdHJ1c3RlZCBkZXZpY2UgbWFuYWdlbWVudCwgYmVnaW5uaW5nIHdpdGggdGhlIGZp
cnN0IGNvbW1hbmQsDQo+PiBURENNX09QX0NIRUNLX1RFRUlPX1NVUFAsIGV4ZWN1dGVkIGR1cmlu
ZyB0aGUgc2VjdXJlIGRldmljZSBsb2NraW5nDQo+PiBzZXF1ZW5jZS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPj4gLS0t
DQo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oICAgICAgICAgICAgfCAgNDggKysrKysr
KysrDQo+PiAgIGRyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMgfCAxMzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxODcgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90ZHguaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oDQo+PiBpbmRleCA0OTM3ZTIzZDU0ODMuLjcxY2Q3
MDFkMzQ2ZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oDQo+PiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90ZHguaA0KPj4gQEAgLTEwNSw2ICsxMDUsNTQgQEAg
aW50IHRkeF9tY2FsbF9leHRlbmRfcnRtcih1OCBpbmRleCwgdTggKmRhdGEpOw0KPj4gICB1NjQg
dGR4X2hjYWxsX2dldF9xdW90ZSh1OCAqYnVmLCBzaXplX3Qgc2l6ZSk7DQo+Pg0KPj4gICAjaWZk
ZWYgQ09ORklHX1REWF9DT05ORUNUX0dVRVNUDQo+PiArZW51bSB0ZGNtX29wZXJhdGlvbiB7DQo+
PiArCVREQ01fT1BfQ0hFQ0tfVEVFSU9fU1VQUAk9IDEsDQo+PiArCVREQ01fT1BfQklORAkJCT0g
MiwNCj4+ICsJVERDTV9PUF9HRVRfREVWX0lORk8JCT0gMywNCj4+ICsJVERDTV9PUF9HRVRfVERJ
X1JFUE9SVAkJPSA0LA0KPj4gKwlURENNX09QX1NUQVJUX1RESQkJPSA1LA0KPj4gKwlURENNX09Q
X0dFVF9URElfU1RBVEUJCT0gNiwNCj4+ICsJVERDTV9PUF9VTkJJTkQJCQk9IDcsDQo+PiArfTsN
Cj4+ICsNCj4+ICtlbnVtIHRkY21fc3RhdHVzIHsNCj4+ICsJVERDTV9TVEFUVVNfV0FJVAkJPSAw
LA0KPj4gKwlURENNX1NUQVRVU19DT01QTEVURUQJCT0gMSwNCj4+ICsJVERDTV9TVEFUVVNfRVJS
T1IJCT0gMiwNCj4+ICt9Ow0KPj4gKw0KPj4gK2VudW0gdGRjbV9lcnJvciB7DQo+PiArCVREQ01f
RVJST1JfVERYX01PRFVMRQkJPSAxMCwNCj4+ICsJVERDTV9FUlJPUl9URFhJT19ERVZJQ0UJCT0g
MTEsDQo+PiArCVREQ01fRVJST1JfU1BETV9NRVNTQUdFCQk9IDEyLA0KPj4gKwlURENNX0VSUk9S
X0lERV9LTV9NRVNTQUdFCT0gMTMsDQo+PiArCVREQ01fRVJST1JfVERJU1BfTUVTU0FHRQk9IDE0
LA0KPj4gKwlURENNX0VSUk9SX0lOVkFMSURfU1RBVEUJPSAxNSwNCj4+ICt9Ow0KPj4gKw0KPj4g
K3N0cnVjdCB0ZHZtY2FsbF90ZGNtIHsNCj4+ICsJX191MTYgb3BlcmF0aW9uOyAgLyogU2VlIGVu
dW0gdGRjbV9vcGVyYXRpb24gKi8NCj4+ICsJX191OCAgdmVyc2lvbjsNCj4+ICsJX191OCAgcnN2
ZDA7DQo+PiArCV9fdTMyIHJzdmQxOw0KPj4gKw0KPj4gKwlfX3U4ICBzdGF0dXM7ICAgICAvKiBT
ZWUgZW51bSB0ZGNtX3N0YXR1cyAqLw0KPj4gKwlfX3U4ICBlcnJvcjsgICAgICAvKiBTZWUgZW51
bSB0ZGNtX2Vycm9yICovDQo+PiArCV9fdTE2IHJzdmQyOw0KPj4gKwlfX3UzMiByc3ZkMzsNCj4+
ICsNCj4+ICsJX191MzIgZGF0YV9sZW5ndGg7DQo+PiArDQo+PiArCV9fdTggIGRhdGFbXTsNCj4+
ICt9IF9fcGFja2VkOw0KPj4gKw0KPj4gK3N0cnVjdCB0ZGNtX3JzcF9jaGVja190ZWVpb19zdXBw
IHsNCj4+ICsJX191OCBpc19zdXBwb3J0ZWQ7DQo+PiArCV9fdTggIGRhdGFbXTsNCj4+ICt9IF9f
cGFja2VkOw0KPj4gKw0KPj4gKyNkZWZpbmUgTUFYX1RESV9SRVBPUlRfU0laRQkoMTYgKiBQQUdF
X1NJWkUpDQo+DQo+bml0OiBZb3UgY2FuIHVzZSBTWl82NEssIG5vICBvciB0aGUgcmVwb3J0J3Mg
c2l6ZSBpbmRlZWQgc2NhbGVzIHdpdGgNCj53aGV0aGVyIFBBR0VfU0laRSBpcyA0ayBvciAybSBm
b3IgZXhhbXBsZT8NCg0KV2lsbCB1c2UgU1pfNjRLLg0KDQo+DQo+PiArDQo+PiAgIHU2NCB0ZHhf
aGNhbGxfdGRjbSh1MTYgZGV2aWQsIHZvaWQgKmJ1Ziwgc2l6ZV90IHNpemUsIHU4IHZlY3Rvcik7
DQo+PiAgIGludCB0ZHhfbWNhbGxfdGRpX3JlYWQodTY0IGZ1bmNfaWQsIHU2NCBmaWVsZCwgdTY0
ICp2YWx1ZSk7DQo+PiAgICNlbmRpZg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9jb2Nv
L3RkeC1ndWVzdC9jb25uZWN0LmMgYi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtDQo+Z3Vlc3QvY29u
bmVjdC5jDQo+PiBpbmRleCA4MGFlN2MxOWUxNzkuLjFmNTJhMTg3YjMwZiAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCj4+ICsrKyBiL2RyaXZl
cnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCj4+IEBAIC03LDEzICs3LDEyNyBAQA0K
Pj4NCj4+ICAgI2RlZmluZSBwcl9mbXQoZm10KQkJS0JVSUxEX01PRE5BTUUgIjogdGR4X2Nvbm5l
Y3Q6ICIgZm10DQo+Pg0KPj4gKyNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4+ICAgI2luY2x1
ZGUgPGxpbnV4L3BjaS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcGNpLXRzbS5oPg0KPj4gKyNp
bmNsdWRlIDxsaW51eC9zZXRfbWVtb3J5Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC90c20uaD4N
Cj4+ICAgI2luY2x1ZGUgPGFzbS90ZHguaD4NCj4+DQo+PiAgICNpbmNsdWRlICJ0ZHgtZ3Vlc3Qu
aCINCj4+DQo+PiArLyoqDQo+PiArICogc3RydWN0IHRkY21fY3R4IC0gVEVFLUlPIERldmljZSBD
b25maWd1cmF0aW9uIGFuZCBNYW5hZ2VtZW50IChURENNKQ0KPmNvbnRleHQNCj4+ICsgKiBAYnVm
OiBQb2ludGVyIHRvIDRLQi1hbGlnbmVkIHNoYXJlZCBtZW1vcnkgKD49IG9uZSBwYWdlKSB1c2Vk
IGFzIHRoZQ0KPmNvbW1hbmQNCj4+ICsgKiAgICAgICBidWZmZXIgb24gaW5wdXQgYW5kIHRoZSBy
ZXNwb25zZSBidWZmZXIgb24gb3V0cHV0Lg0KPj4gKyAqIEBidWZfc2l6ZTogVG90YWwgc2l6ZSBv
ZiB0aGUgc2hhcmVkIG1lbW9yeSBidWZmZXIuDQo+PiArICogQG1heF9yc3BfZGF0YV9zejogTWF4
aW11bSBleHBlY3RlZCBzaXplIG9mIHRoZSByZXNwb25zZSBkYXRhLg0KPj4gKyAqIEByc3BfZGF0
YV9zejogQWN0dWFsIHNpemUgb2YgdGhlIHJlc3BvbnNlIGRhdGEgcG9wdWxhdGVkIGJ5IHRoZSBW
TU0uDQo+PiArICogQGRldmlkOiBEZXZpY2UgSWRlbnRpZmllci4NCj4+ICsgKi8NCj4+ICtzdHJ1
Y3QgdGRjbV9jdHggew0KPj4gKwlzdHJ1Y3QgdGR2bWNhbGxfdGRjbSAqYnVmOw0KPj4gKwlzaXpl
X3QgYnVmX3NpemU7DQo+PiArCXUzMiBtYXhfcnNwX2RhdGFfc3o7DQo+PiArCXUzMiByc3BfZGF0
YV9zejsNCj4+ICsJdTE2IGRldmlkOw0KPj4gK307DQo+PiArDQo+PiArI2RlZmluZSB0b190ZGNt
X3JzcF9kYXRhKHRkY20pCSgodGRjbSktPmJ1Zi0+ZGF0YSkNCj4+ICsNCj4+ICsjZGVmaW5lIFRE
Q01fUE9MTF9ERUxBWV9VUwkxMDAwMA0KPj4gKyNkZWZpbmUgVERDTV9QT0xMX1RJTUVPVVRfVVMJ
KDEwICogVVNFQ19QRVJfU0VDKQ0KPg0KPlNob3VsZG4ndCAgUE9MTF9USU1FT1VUIGJlIGEgbXVs
dGlwbGUgb2YgREVMQVlfVVMgIGZvciB0aGUgc2FrZSBvZg0KPnNpbXBsaWNpdHk/IEkuZSBERUxB
WV9VUyAxMDAwICh3YWl0IGZvciAxayB1c2VjcykgVElNRV9PVVQgMTAgKiBERUxBWV9VUw0KPih0
cnkgdXAgdG8gMTAgdGltZXMgdG8gZ2V0IGEgcmVzcG9uc2U/KQ0KDQpXaWxsIHVwZGF0ZToNCg0K
KyNkZWZpbmUgVERDTV9QT0xMX0RFTEFZX1VTCTEwMDANCisjZGVmaW5lIFREQ01fUE9MTF9USU1F
T1VUX1VTCSgxMCAqIFREQ01fUE9MTF9ERUxBWV9VUykNCg0KPg0KPj4gKw0KPj4gK3N0YXRpYyBp
bnQgdGR4X3RkY21fcnVuKHN0cnVjdCB0ZGNtX2N0eCAqdGRjbSkNCj4+ICt7DQo+PiArCXN0cnVj
dCB0ZHZtY2FsbF90ZGNtICpidWYgPSB0ZGNtLT5idWY7DQo+PiArCXU4IHN0YXR1czsNCj4+ICsJ
aW50IHJldDsNCj4+ICsJdTY0IHI7DQo+PiArDQo+PiArCXIgPSB0ZHhfaGNhbGxfdGRjbSh0ZGNt
LT5kZXZpZCwgYnVmLCB0ZGNtLT5idWZfc2l6ZSwgMCk7DQo+PiArCWlmIChyKQ0KPj4gKwkJcmV0
dXJuIC1FRkFVTFQ7DQo+PiArDQo+PiArCXJldCA9IHJlYWRfcG9sbF90aW1lb3V0KFJFQURfT05D
RSwgc3RhdHVzLCBzdGF0dXMgIT0NCj5URENNX1NUQVRVU19XQUlULA0KPj4gKwkJCQlURENNX1BP
TExfREVMQVlfVVMsDQo+VERDTV9QT0xMX1RJTUVPVVRfVVMsIGZhbHNlLCBidWYtPnN0YXR1cyk7
DQo+PiArCWlmIChyZXQpIHsNCj4+ICsJCXByX2VycigiVERDTSByZXF1ZXN0ICVkIHRpbWVkIG91
dFxuIiwgYnVmLT5vcGVyYXRpb24pOw0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICsJfQ0KPg0KPkl0
J3Mgbm90IGVudGlyZWx5IGNsZWFyIHRvIG1lIHdoeSBkbyB3ZSBoYXZlIHRoaXMgYXN5bmNocm9u
b3VzIGhhbmRsaW5nDQo+b2YgVERDTSwgd2UgZG9uJ3QgaGF2ZSB0aGF0IGZvciBhbnkgb2YgdGhl
IG90aGVyIFZQLlZNQ0FMTCBsZWFmcz8gQ2FuDQo+eW91IGV4cGxhaW4gdGhpcyBpbiB0aGUgY2hh
bmdlbG9nLiBBY2NvcmRpbmcgdG8gR0hDSSAyLjAgVERDTSBpcyB1c2VkOg0KDQpURFZNQ0FMTF9H
RVRfUVVPVEUgaXMgYW5vdGhlciBleGFtcGxlIG9mIGEgcmVxdWVzdCB3aG9zZQ0KY29tcGxldGlv
biBpcyBoYW5kbGVkIGFzeW5jaHJvbm91c2x5Lg0KDQpXaWxsIGFkZCBiZWxvdyB0byBjaGFuZ2Vs
b2c6DQphIFREQ00gb3BlcmF0aW9uIG1heSB0YWtlIGxvbmdlciB0aGFuIGlzIGFwcHJvcHJpYXRl
IGZvciBhIHNpbmdsZQ0KVEQuVk1DQUxMIGludm9jYXRpb24uIFRoZSBob3N0IGFja25vd2xlZGdl
cyBzdWJtaXNzaW9uIGFuZCByZXBvcnRzDQpjb21wbGV0aW9uIHRocm91Z2ggdGhlIHNoYXJlZCBz
dGF0dXMgZmllbGQuIFRoZSBndWVzdCB3YWl0cyBmb3IgdGhhdCBzdGF0dXMNCndpdGggYSBib3Vu
ZGVkIHBvbGxpbmcgdGltZW91dCBhbmQgZGVsYXksIHJhdGhlciB0aGFuIHJlbWFpbmluZyBpbiB0
aGUNCmh5cGVyY2FsbCBmb3IgdGhlIHdob2xlIG9wZXJhdGlvbi4gVGhpcyBhbHNvIGF2b2lkcyBo
b2xkaW5nIHRoZSB2Q1BVIGluIGENCmxvbmctcnVubmluZyBoeXBlcmNhbGwgdGhhdCBjb3VsZCB0
cmlnZ2VyIGEgZ3Vlc3Qgc29mdC1sb2NrdXAgd2FybmluZy4NCg0KPg0KPlRoaXMgaXMgdXNlZCB0
byBhbGxvdyBURCBndWVzdCBURUUtSU8gRGV2aWNlIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQNCj4o
VERDTSkgbW9kdWxlIHRvDQo+bWFuYWdlIHRoZSBkZXZpY2UuIFRoZSBURENNIGxlYWYgZnVuY3Rp
b25zIGFyZSBkZWZpbmVkIGluIHRoZSBmb2xsb3dpbmcNCj50YWJsZQ0KPg0KPklzIFREQ00gbW9k
dWxlIGltcGxlbWVudGVkIHZpYSB0aGUgTlJYIGZhY2lsaXR5ID8gIFRoZSBURFggQ29ubmVjdCBz
cGVjDQo+bmV2ZXIgbWVudGlvbnMgdGhlIFREQ00gbW9kdWxlLiBBIGJpdCBtb3JlIGRldGFpbHMg
YXJlIHJlcXVpcmVkIGluIG9yZGVyDQo+dG8gYmV0dGVyIHVuZGVyc3RhbmQgd2h5IHlvdSd2ZSBp
bXBsZW1lbnRlZCB0aGlzIHRoZSB3YXkgeW91IGhhdmUuDQoNCiJURENNIG1vZHVsZSIgaXMgR0hD
SSB0ZXJtaW5vbG9neS4gSW4gdGhpcyBzZXJpZXMsIHRoZSBndWVzdC1zaWRlDQppbXBsZW1lbnRh
dGlvbiBpcyBpbiB0aGUgVERYIFRTTSBkcml2ZXI7IGl0IGlzIG5vdCBhbiBOUlggbW9kdWxlLg0K
DQpURENNIHJlcXVlc3RzIGFyZSBmb3J3YXJkZWQgdG8gdGhlIGhvc3QsIHdoaWNoIGhhbmRsZXMg
dGhlbSB1c2luZyB0aGUNCmFwcGxpY2FibGUgVERYIENvbm5lY3Qgb3BlcmF0aW9ucy4gU29tZSBv
ZiB0aG9zZSBob3N0LXNpZGUgb3BlcmF0aW9ucw0KdXNlIHRoZSBOUlggZmFjaWxpdHkgZm9yIFRE
SVNQIHByb2Nlc3NpbmcsIGJ1dCB0aGF0IGlzIGFuIGltcGxlbWVudGF0aW9uDQpkZXRhaWwgb2Yg
dGhvc2Ugb3BlcmF0aW9ucywgbm90IGhvdyBURENNIGl0c2VsZiBpcyBpbXBsZW1lbnRlZC4NCg0K
VGhhbmtzDQpaaGVuemhvbmcNCg0K
