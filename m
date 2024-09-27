Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254781E4AE
	for <linux-coco@lists.linux.dev>; Fri, 27 Sep 2024 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468144; cv=fail; b=BSPIa3s1jn/DWX/LTSL108Ry+3gJdt3b3z2yrIoUhJYnj9nlSYhjxjD+KhraR3Z1UeS6mTSrSG+6x2g26s8vXYPg9Kkjmq7akerCV3qETMWVYE8TaM8w7u4Pg7gbbfFqzEJ+JErYpbSXUW+OEEYv+4mVcT+ZS7d7F8cZK6swSeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468144; c=relaxed/simple;
	bh=jHZb6w5rxs7af3L+r/U8OnHEbtjDMkibaMP1tIK9niA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kzjUBGSHCx+oib0ynCiEiA9Jktg+8DxiDqvVegs5JEaqfMIw0bLNKV+Cz0UUEtRM3EomMKfkXh59Sd691p8DOj7s+LIkd4We6mDvrYCUM7ip/E1kZGI2qQJkltgkWPwsmAmimUCS2b1602OiEewU8AUAdr9Fxk8peS7UzZVMKc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6GaStx0; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6GaStx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727468143; x=1759004143;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jHZb6w5rxs7af3L+r/U8OnHEbtjDMkibaMP1tIK9niA=;
  b=J6GaStx0Z7pulunFqbkic+qMXluY6yiBX0BlJ+ESlba7UJNqY/FSsJGm
   ZQQXVmCgahciOaxB42rYcZirMZOhh2N11S2PvMBHyeQN6Qhj8B1GrdKU5
   hAp90m0RKHmVlI3kXIPJXZnPp4hAfMILOYBcNXKRVhCUC6JJSnx8GjLPa
   hH1PzA+NwGwzKrrVALZm2RY2pco0BMAw1l0LdtK+KPe3O9VfBmTmfLHUu
   lvaCXr0WZE7+drs6lCtFntXIdfRRFKiWkCBJqQoHjU3095sFGS4ytm43a
   1e7dAblM4ZIT4OddQ8umzzyupVilXXI9SR7sipNnGK0a5pyVoxOt4cC/F
   Q==;
X-CSE-ConnectionGUID: 16dtBQVySbikpeR30FezYg==
X-CSE-MsgGUID: wsY3KMV8QviRf3cnaspqqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52041479"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="52041479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 13:15:42 -0700
X-CSE-ConnectionGUID: fT3ks/cNRUOGtacH1jgoQA==
X-CSE-MsgGUID: 7b3l7rIBQmqaaWyV6MNYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72218907"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 13:15:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 13:15:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 13:15:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 13:15:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyIlOjrVr3zjLsE+DPk9QLnsfYdEagQycWtmy2qn9cidr2aKDSdQSSBKWk6JiC76PKdLX3rE/juZvzVd0ZWMs1hm538QgkdN3e+GGhXIy/8zloXxIFCMs3lW9BeHQ/z0khKXi+9ZijYvR15G3felPt6frNlyYoc6+Fh7Cs7U2ZALeu95AQ0RBrqY9utvUYdrc9WI8t7ebWpbXUWvFdwnMd7gbLT5C9ukVAXSH1UGHioDruCogHnJRR5oABAuEGXkLkqnKLdYVBEyczXuSt+V28u1+PCSqJ3rKqZNyX79G8xCoZP9DevRutRR1kVkHBl3x/KFjBeuh+kWZZOzQ37m7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHZb6w5rxs7af3L+r/U8OnHEbtjDMkibaMP1tIK9niA=;
 b=SBDxqvY7xS9lFUoNJO6VQRvP4Q2lAaXFayYZaBZPt/8fLwhVWauCzZvPpFmqNMmsULpaF+p8gztNPpfXTGk5oi1KTRq+j4vYxa8JH6vuDVDd2qLCZBHVQQc+TWy64UGKw7hOJPYCmTshewZj821Y4QqhiYlsLelHhub8EBM670Vwjd55NtsUpXdMU45oxnrTjDSs62UqGIukBZLnoBQaIM5E4tqQijhKyw89cWngi1yBcZRck+iI/HthOoR9uA+XL1kRJ19l/b+1RqkhLlMRhu0cZ0tfVjmfaLhxwcgRStWCUI8RKIsmesvfwuCRLdujgL1FVD4a2hmqn86IEvV2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 20:15:35 +0000
Received: from LV3PR11MB8458.namprd11.prod.outlook.com
 ([fe80::99aa:8acf:4bf4:1210]) by LV3PR11MB8458.namprd11.prod.outlook.com
 ([fe80::99aa:8acf:4bf4:1210%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 20:15:35 +0000
From: "Quigley, David" <david.quigley@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: No CCC Kernel SIG / device security meeting 9/27
Thread-Topic: No CCC Kernel SIG / device security meeting 9/27
Thread-Index: AQHbEFWiztf93OgLXUGxtta7AVvQHLJryYfQgAADBwCAAEaQQA==
Date: Fri, 27 Sep 2024 20:15:35 +0000
Message-ID: <LV3PR11MB8458463D0347DF7A217B5CCDE56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
References: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
	 <LV3PR11MB84582F1DDE696387B6272874E56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
 <4065661639dd917f3410e51c23a65e4bb88fdaf3.camel@HansenPartnership.com>
In-Reply-To: <4065661639dd917f3410e51c23a65e4bb88fdaf3.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8458:EE_|PH7PR11MB6055:EE_
x-ms-office365-filtering-correlation-id: dea465b0-7311-48b9-22dc-08dcdf312571
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SDZvbXFha3N3OFBCbmVwNUZLSVhwdnVvZ05CSFZ3d054T2lnYWJHRkttcHoz?=
 =?utf-8?B?bmpSOHZoNkpuNlpmdGNaSkI3dXJsU3BES0pKS0doUHA0aVJyMElMNDlWMFRR?=
 =?utf-8?B?WE5KMHo1NlkrbnA2SkwvMTJSTFNJQW5pcnR6L0luYjB3b0gxQWRzcGtIRU5u?=
 =?utf-8?B?bmF4QmIxdnl2cmx3MXlJM2M2L1JHS09tZXV3SitqbTVrKzZXcEJibzY3R3pq?=
 =?utf-8?B?V240cFUwdzBPWEhRMHNSRDdaWEVTMGVKSGppYUM5WjAvRm5KNUY3czZrS0gr?=
 =?utf-8?B?MmZzRjdlYk02eHA5MWVySU44VFdEMktkZEc3azgyRjV4SEVsdWN1UXZtcjFC?=
 =?utf-8?B?UWIvRkZDODE5N3ViUkE2RnUwRUMzWXM3bGY2Q2RMVlovNXZTbS9nbUkrcXdJ?=
 =?utf-8?B?V25RcWtmNWZIcXUrN2NlRVU5K2VUYmp1UDVDKy9KdzFmSm5UczdDVjdUSE9D?=
 =?utf-8?B?REhta05uYUEramd2aWRKVUFWRUxqZzd6bi94Z284emZPMnVnelVpd0NsM1Y4?=
 =?utf-8?B?ZTRKZHBQMnMvOVZjVTRXVjNUYk9JdkVvdFZFaGgwWXRNK0IxZXdDYXY2Slg0?=
 =?utf-8?B?NGwyMFRTdTNMbWxEYWZJSlc2TjJ2UDV5QmFiSWwxdnNIV0ZRaHQxci9IQTZa?=
 =?utf-8?B?T21sMFZrTmZXUlh5WitFSG1tL2JMME9DcmtObVhGcFp4aUxCdG5iRjB2TThi?=
 =?utf-8?B?endsbTQwNlhHL2tPdDlmZnpqVVloTEhtK0NVZTRvaE1GMElsWnRLRXozcXNL?=
 =?utf-8?B?NVNqNGZPSnN0UjhGc2puRmp0N3kxRlZyN3Q0K1hITUZLWEhxcmtlT1Y4dE1Y?=
 =?utf-8?B?OHJtMldSQlVQUjZlY2VxaTJRK3ZoeU9CRTl1eStUTTlIZFBNaXRQQzNhNXRt?=
 =?utf-8?B?OFIwY0c2ZVNMY2lGcnVNZzRKdmxTd2pydFdIR0ZWeWljQkZ6dmJudXRwazJm?=
 =?utf-8?B?QmRPNUk5cDIwMm9xMERDMnZBMEx2ajZiSmxST2F5WkpkYkJGaXdNdG44WFZ2?=
 =?utf-8?B?cWUyNFB6Rjl2S1dTbUphWTRobHl6M1Y2T3YxZ085YlN6eldHQnlwSktwZ2Ns?=
 =?utf-8?B?U0o0MzBURGh5QUN1VGV5MHJvcnFvd0pmeGJlbE9IMmYxOFFNTzArQk5SOWcr?=
 =?utf-8?B?M2NVOExBcFZnQ2d6R01FYldQNjA1dXZpeGpnb1Q5ZlZsVkZWZThCWWJyWHdX?=
 =?utf-8?B?VGExRGVzaTYxb1d6dFRQS3RZeVNtdEIzT05HeHNZOHhmN0ZzUmF6NXFhVHhj?=
 =?utf-8?B?ek5KdC9OKy9OSVlBV3ZyVWVhMUl0d2V2Y2NodmRYOWFOYUF6MHBTdEVUaG1H?=
 =?utf-8?B?RnZaQ0lpWnljTVpvWFR1eGNNUk5Nek9Pc2tEYlJLUmpkLzJXeDlpZnZ5MUgr?=
 =?utf-8?B?aEJORWVSWjQrN1BhdkJLcUdIN3k1REpzZzF4SE9IN3JYcTNKUmk2ZG45UzI5?=
 =?utf-8?B?Q1RwTmF3anc5T3Y0OGhUTVk4ZWlKQlBZNndleDRLcTYzVWthRXd4WThjYXF1?=
 =?utf-8?B?NWxpTTRCdHlkaG9rb3hna0tYTytVeWp3UDdRMnlQZkEwTzRvM25YM2VBVWJR?=
 =?utf-8?B?SG1VWVRoS1M1U0hLM3o2emxQMm5XcitCV2JMWnBhS0R3ODFpRytmZDlRSXFS?=
 =?utf-8?B?WHVTQkQ4bmZrZnZFYkNVN3A3SEwzazZNV0U1cm5oTHlIVE4vUWU2ai9HZWN2?=
 =?utf-8?B?WkQxWTg2QnFiMU9sam9hVW5aV3JUcDFNbHIyV2tjelVsK3B5Y0VvVlZNQmNw?=
 =?utf-8?B?cmhyZWtQVGFWNW4reVU1dmFhYll5TjFoS3FiZXl1bDZXK0Rvc3ZoYU85OEk5?=
 =?utf-8?B?cFBuanNDRE1aTk1yTFBydz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8458.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUlKdFZyb0VVRnAyZ2xzckgvREYrMU5zdTExRTZ1UWs1NE1sTEFtK1RGMEUy?=
 =?utf-8?B?RHNQQklFeDZYUjBicVQzaEx4RUdiVHoxcWJTUFZsYWplblhsaVN5Q1lmdS8w?=
 =?utf-8?B?T0lmYUNyUXVkTHZkNDgxaS9ldzNQMDNuMU1GQVhYUjlOSmtpcG1CTHk0bXoz?=
 =?utf-8?B?aktpclpaNHp1MVp4YUJsUHdESEpibWtzcS94cXBHQk1wTGFHeGlJYlExZFlN?=
 =?utf-8?B?SW40VER6RlVtcElPV05XN1JvbWtSQjZ1RFhkb1FUd2x2TW9KSzkxZ1NwZ0Yz?=
 =?utf-8?B?eEJMK3pOOVNjNjViOTRDRy8vNkZ5dFVIczV3bElQZU9jWmJPbEdjUk1zUGVo?=
 =?utf-8?B?VnJwbTNzbHNpS1F6eUluenlqZElkZk5SYmxJWVJzajFzeGpJM1F1TjFNYmox?=
 =?utf-8?B?R2MzVEhBQitYWmhoSlBmTjc3TnUySm0yTzRWaEpTNFZ5TlpmOE1Mak1xUU5p?=
 =?utf-8?B?a09VSE8vTndBTC9PQ093SGY1TzJrQTFPR3MyMXZDSVZkeHRUbUxLVTFqd1Fw?=
 =?utf-8?B?MjlMVmJkZDBQemtVZElOUFZtWkVkSkpCVU1XOW40d2V4dmFwaTJTNzVxQmVI?=
 =?utf-8?B?MGhtTnFPYXAxdlJxcDdOS2RrUGRicERPMCtPWkF5dCtlTitLUlNZZGxFTFNl?=
 =?utf-8?B?dGdtd1BBNDVZcGg0R1VpM1pYUWExbFpqTElEYXo0a09GOUNCSWdJL3NOZkpI?=
 =?utf-8?B?WjIrdENTV3VlY2x5YlVrTFhsTSt3aW1xRkdpZDNaTlUvNUNldlVBRGVxRUhq?=
 =?utf-8?B?NmFwbWFaYTFnN1FTbnVMZktjNlBJMkN1b3ROV211NERhTWkxVFY4WEg3azE1?=
 =?utf-8?B?RE05Ull0aDBpVjJrQXVlOWoraFM5L3l2SVpYRGlCbHpHME90cDIxT1hqOFRk?=
 =?utf-8?B?aDJuVXg1MlBmT1hEcEFhQVNCUU9sdjE4OFpDUEMwTS90cmtyRWZkQ2c5eG8x?=
 =?utf-8?B?Zjh2RllpN3pRcGQyV1QzTkhTb2lDb3BhYkpmS2d3eVYwZlIyTDlLRW12WlFF?=
 =?utf-8?B?Uy9rS0JzWXI4TzUzZlRjMkY5ZXJ2Wk54bHZ5TXZBNGRFVWhVUDJtN1NRSHJW?=
 =?utf-8?B?TXNhUnluaDhJa0ZNTlI3T2ZQY2YrcGFWalJQZEF6NnlFMXJCVm5MQU96UDFn?=
 =?utf-8?B?SHBKV1o1WnFuWCtGUk1FTjlNRjk4WXg1Zi9ZWGx5cEllMS9hZFFOTWE3ekpS?=
 =?utf-8?B?TlNjS1ZZQ0QxMHBBcU1GMDY4VWJkTlRuUjNjcVAxUEYydGtZb09UcEpaOGQx?=
 =?utf-8?B?ZFkrRFBqcy83M29wWXhRUkpGWmhJQlQxZFVUdGN5Ti91OXB5S2JoYUo2NVdv?=
 =?utf-8?B?WHBDby9XYlFqN3NOQjhsdUUzUzcwK0Z5ZWRHaXBvNEM0NjFvdHRheEM3NklF?=
 =?utf-8?B?NTMxdVl6ZHZ5YkFQb1BjYm4wT1pVdGNEakxFL1kzK1p3L2x5bXBaSDRtczZV?=
 =?utf-8?B?ZEpwVVhJQVNRcEp4QnoxL1NUUG1ZZnh5dnlVRUJwVjQ3MDRuZWx3bW54c0dh?=
 =?utf-8?B?bFZtUXYrUWkzMmlaaW9QQ3Y4Z2pPV2Q1czN2Z3NTZzBZTndTUmo0M3RBelp6?=
 =?utf-8?B?d0d6c0xkRlpiODlQOTRPWjRBNEZkc2RJZ3RYNm96NlpkZklpSHBFRWJaMFRm?=
 =?utf-8?B?cFdJY1NoU3FZNmFJckdaS25CWVoxcDRsY3orYzVWS1hTZ2tlOU11NHZMUWxl?=
 =?utf-8?B?YUgxbVpIT3FiUlBBWWsvQjBvVWk1amdacVFnWUZwSEZyb0R2WGFYRzU3a2F3?=
 =?utf-8?B?OE5QL1VhM3BqODhZNTEraTN5WFJhNXEyUUkyY2JVcEhTNGtxSlNXT01FWm5L?=
 =?utf-8?B?RVdXYm4rRDJtakFPd0pseVlUamw2dmRkbEU4cG90dHI4dmJlWCsyZ1lHNHN0?=
 =?utf-8?B?OHdyVFAvWDdrWXNYaStxS1RJdWpseG4rcEtUSzVvTkhxUVJ4T0R2TktKMkJq?=
 =?utf-8?B?MHV1WmZLdkIzZjM4cDZ4YU9jTEVDbHU3QjlOcUpNdi9YU3A5M2NEVWVVUUVl?=
 =?utf-8?B?em91V0ZZWlFOcGp1TWJXeXNWVWxGVDVsNHR3dmNOLzVFRENDeVRjQjhhbExi?=
 =?utf-8?B?WGVxejNPYmxKZWNwOXJFZ1d6YnFDZVBtK2p4eU1sS1ZJbHZEaW9keXU0Unhu?=
 =?utf-8?Q?ikKjrEruNN0JkNriQ5ojn+99O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8458.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea465b0-7311-48b9-22dc-08dcdf312571
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 20:15:35.3877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHvEU1aDfVrZ27ZA2epFAqDEDaaBPspJwNsmy3lVUoTryfA4J8ESXtYKvo5nowZMUS6qbJbg7Ja8iDZjAkGrOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-OriginatorOrg: intel.com

RG8geW91IGtub3cgaWYgdGhlcmUgaXMgYW5vdGhlciBwYXJ0IG9mIHRoaXMgc3RyZWFtPyBJdCBh
cHBlYXJzIHRoYXQgdGhlIGFib3ZlIGxpbmsgc3RhcnRzIGluIHRoZSBtaWRkbGUgb2YgRGVyZWsg
TWlsbGVyJ3MgQVJNIENDQSB0YWxrLg0KDQpEYXZlDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBKYW1lcyBCb3R0b21sZXkgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVy
c2hpcC5jb20+IA0KU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjQgMTA6MDIgQU0NClRv
OiBRdWlnbGV5LCBEYXZpZCA8ZGF2aWQucXVpZ2xleUBpbnRlbC5jb20+OyBEYW4gTWlkZGxldG9u
IDxkYW4ubWlkZGxldG9uQGxpbnV4LmludGVsLmNvbT47IGxpbnV4LWNvY29AbGlzdHMubGludXgu
ZGV2DQpTdWJqZWN0OiBSZTogTm8gQ0NDIEtlcm5lbCBTSUcgLyBkZXZpY2Ugc2VjdXJpdHkgbWVl
dGluZyA5LzI3DQoNCk9uIEZyaSwgMjAyNC0wOS0yNyBhdCAxNTo1MiArMDAwMCwgUXVpZ2xleSwg
RGF2aWQgd3JvdGU6DQo+IEFyZSB0aGVyZSBhbnkgcmVjb3JkaW5ncyBvciBzb21lIHNvcnQgb2Yg
cmVjb3JkIG9mIHdoYXQgd2FzIGRpc2N1c3NlZCANCj4gYXQgdGhlIG1pbmljb25mPw0KDQpUaGUg
YnJva2VuIG91dCByZWNvcmRpbmdzIHNob3VsZCBiZSB1cGxvYWRlZCB3aXRoaW4gdGhlIG5leHQg
ZmV3IHdlZWtzLg0KSG93ZXZlciwgeW91IGNhbiBzdGlsbCB1c2UgdGhlIGxpdmVzdHJlYW0gcmVj
b3JkaW5nOg0KDQpodHRwczovL3d3dy55b3V0dWJlLmNvbS9saXZlLzhYUXd6VVp4TEs0DQoNCkJ1
dCBpdCdzIG1vbm9saXRoaWMsIHNvIHlvdSdsbCBuZWVkIHRvIGtub3cgdGltZSBvZmZzZXRzIG9m
IHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yLg0KDQpSZWdhcmRzLA0KDQpKYW1lcw0KDQo=
