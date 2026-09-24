Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB2495057
	for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293323; cv=fail; b=tbWFDsHs8nBSVVdRcM1bhhJEaGwDh0Gm+jEg5/1UlDicNeG1kvoqOUVHzUdR57k52HsYxDUWmac1T1eFtTYPZQat94+QTbfvnx9dLc76C507ifKUE+MwNiRlE3HOS36Pvp04lLohbCOGk/mRQU3ow4L7xxZoQoNFY1UEsCN4UBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293323; c=relaxed/simple;
	bh=8dDYKXjtBg/DB2D4v0BK6OmTOtfG1cVk2csRo2Q4JnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qd53ct0iNbqGsA+2W4soIXtF3aztHdpwNl7ZrhKiIVaeR+IJZzyecpC747oFkrDrq4EKwTB9hpHLCXTE1mtrkp3f3U36t+iP+I7bRBpF1Tg7FJgfQ71b07Z53Iv/CjdYjPts+cSatzOA7yl912WA8Nq/IKTWpB8KzPDhuAkFlnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjwN0wDD; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjwN0wDD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790293320; x=1821829320;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8dDYKXjtBg/DB2D4v0BK6OmTOtfG1cVk2csRo2Q4JnA=;
  b=MjwN0wDDWC5kcAjaam6A0eaLjnhsaB/siQvxa7J/MYoWiP1sPWhTI+/1
   QUQJ2+BX+cNPKFJXM9nZNKULmN7U4SA4DERfHvtYvQhzWBA24UfM2JrVq
   EL82shuI+1RFnAYroC/YxU9FvF62cjOkv6ifW+UvESMeDb2vmF305BjFa
   9wHRaAQ0+hsOl7+hk1LwwrInr8gRe1UrcrqICcM0WDlb3ai6QvCS1Ju1/
   68i6gpHDEM3UbWV4lQPqLnOharMr2jk5ItMfosIsaEPAKvgdEyR+r1xro
   0k1WW4ytf5MerkYswYhT8QvCYt/550gqDLOb3RlKTd/MmPuB7UlmmzpmC
   w==;
X-CSE-ConnectionGUID: c+3G450JSy+KpwejU+OVig==
X-CSE-MsgGUID: fp5qhKSQRWCojSiabXzJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100414898"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="100414898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:41:59 -0700
X-CSE-ConnectionGUID: qnp7YjrKTZ+Pgm1XUBiItA==
X-CSE-MsgGUID: WFvedSruQ4+WEnwAaQf9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="312097850"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 16:41:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 16:41:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 16:41:58 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 16:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnyIcIb8p1qfSpGsPZNDUuX/VMTHiyOdnQgpNQx9bild2enpWGyTPek89OgJRk2eOMtAmUo3P5/ExHrNbFlfHO80JKU+l89llQeLHUlD5DWdLKlq3qiRE5UhMDuEEedMqTV7Z5eyIwGCrSafs+H5q8lAeP1D5H+sLiRzvHuo81c0X0R04JZbmMi5K2bfWLwIvnUnws9id9fZsPv/adjdfhCnLY/AXHM3vGRVqW1w6Y2jtQaJRN++9zzS0rSu/HrlAUI3VCpKVw+CWEOXci6wSdjO0ETveV6AFKYJjkmiLVf4SYt+95J3UbPHJM7KuberVW/cjbDXcyhecEvvPsIl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dDYKXjtBg/DB2D4v0BK6OmTOtfG1cVk2csRo2Q4JnA=;
 b=jveVgP8rt8ism5kQ1sF/PBiy24cs185blt4hm95Mdp5VtBFYnrRSHmG9Dz2k8G+DQHjxjxcAsik3tSAmDYIC1cS8EM0fIqaSATR53bGBFgNgOj50ylX/syMzQ/5D2W6lPTD2Vq6/fRivR1qHozIbj9tJ6ICoXbyiWNffhk0HOlmXrI6v0OijQbndO7E9hkyUpaHnodzpAtvi48mcVjmVfJf4jJffzSroYrZxrvmyPH5TEWqt27QJnaRLjRdHtJL0TfbPOwL9XRbuI053NisBdLHHdIuIASWeBOrHHYdEeeHrSOv/Bg3xny7lk54z5XEHmODOz4tfAm0kEeeU2Mxo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by PH0PR11MB4919.namprd11.prod.outlook.com (2603:10b6:510:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 23:41:56 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 23:41:56 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rJ7FgWIHNhvU2XNEh+FPULkLbeZNqA
Date: Thu, 24 Sep 2026 23:41:56 +0000
Message-ID: <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
In-Reply-To: <20260924041032.1096569-9-zhenzhong.duan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|PH0PR11MB4919:EE_
x-ms-office365-filtering-correlation-id: 340a53ed-9bc0-45d6-458b-08df1a956b71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|38070700021|11063799006|6133799003|22082099003|10067099003|56012099006|4143699003|18002099003;
x-microsoft-antispam-message-info: /zcvSggnGK8D1zQIaDevaFtmTftjY60ssHZOej34c85M5LDDU3y41jESXa5putyOibqqEF8VFOBecwd/DdkNGGSwGSYcLPQDS28zkB6m3Y/0mKEE4bdZRhrtreFHz3PmLt2U3+JBnkeii/2JwI0ck1zSh1v5gHpnkaAOyApvg5QDrxH2Y6blPLhY9S8NAd3cYMHq27a50GGsLm7ewt7K6zFoL046U+0dtWE3oTZS/5Q1zzmnNP8BsDMyEKsEOpQzxdtnxR0mgO8XXeRcRzq7++03U1jJZDSFdDIyLzZfMt3oMFFYH8qyjAQJxb2FRU+S+QHaqoT8b5js0dLm1ZaQ+Fv1obmGnqLaLo9al4cuDisAx/saJiVRxIZsZWTyGYbo3zOyYp6OBHcKkkFqpP3bMy/+cCWw2vC/R2BZjjCAZc8udtA37aF0dXhKIeyHZi+vZgCnE+YXJcJvUBpz67/Zuoxkdr4ub0MiihBd7UbAR4IKIsZyxZCzTj5I0/bOoavBlwFWWrTlyl/vo/KXkrl++zcUrdShVW/ivOKrI4gKdGNHrYN7t+BNSZaMUHLkbWL9PG3ohChyci3Z00m0tzaH4P69nB2Ke8QXprj0YvKAs2vhb6oGjlc5/R+rCKMBLOYDoIbQgiyWlJ+Van8MsyQ03Di5gDmBHNn4lKuV+SybH76LkTiiEf28003JgDYPivd/UVULEMtl4gt6bjpspcdn640TVNwWd6bQhSp+6pr4xuQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(38070700021)(11063799006)(6133799003)(22082099003)(10067099003)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhSUHFOWEpweHVpNjZhWkl3aFFPNWJTQWprUEkvRFAwYzJ2TXJuSnZSQzk2?=
 =?utf-8?B?dk1FZWw5aEs2NlRxRUdTMlkxeFBPZk9hbjJpVU5mdXhtUW5xZGIzd2UwbUJH?=
 =?utf-8?B?VHBxeE4vZXM4MVFoVjhWUjNVR2RBd0tvRzRvazJNTnlzYTZWNDhHdlpET3hU?=
 =?utf-8?B?REdYdjZ0dVViaHpHb0Y4bit4UXJXT201ZFZBREk2Q082ZEdFVExPWmlsK0V3?=
 =?utf-8?B?QjNLbFgyd29WMjBGUGJGSm4wUTJqMmpqNzYwcXgyVWVkY1hiUDN5b2dQMVZi?=
 =?utf-8?B?dllkUHBtMWZjRW51OTExV3l6eklyWUdSS04rQ2R4K0I3SDNPdGhKVEloNENm?=
 =?utf-8?B?QmRWQUlvR0xtYm02Z1NCaVBFODJIdG82TW9EdUVYZG83RWhxQ2tGSm1NckdG?=
 =?utf-8?B?YlpNL1V2QWhQemN3WEhHOStDWCtxWnUrL3YzcUU5MWFua1RTYTE3MGZkS05C?=
 =?utf-8?B?ZWhMRGN6MVpxcHJBZkpVL0NOTXdiTTgwMVozVUxBbjRJUTc1RkJ1dTlkZzFx?=
 =?utf-8?B?bWVjUlQ4NjBEcHJ2UDc4VUhIa01wTkJwNGI2ZXcyV0pKZjJJNEtFQ29rQ3hZ?=
 =?utf-8?B?MGd6elkweXlTZUhBa2U5MXFuZVdaWG80K1hPUWM2blhlQ3hZYjZ2RkYxWGVq?=
 =?utf-8?B?OUEyRWRyRDRRRERkeVo2YmpvR0xXcncvZTlIUmV0T3k5QXYwQUJRYm91bkpR?=
 =?utf-8?B?d0JKMTJGTHZpNFV0eG1iTHhZazhwTlcxSXlwdW5Kb1Y0SHNzaXNKTUJJSWow?=
 =?utf-8?B?ZmRZNmtnTlhyTms0R3dyRUdFMk9GTTkyL3JzOXEzUXJnTG92bGJoUkFLSXBU?=
 =?utf-8?B?QW04dHRHWUF0WGM0V0YrdmU1SHRkZzhvTjVFbTRtSmIvc01XczBHN2xDSUdP?=
 =?utf-8?B?SlZXelFibXJ6RXNQNDBhWG1xYWdaeXpuRUJKQ2srVU1ZOWVmdDJYZ2tZZmZt?=
 =?utf-8?B?eUFHNkFnSDd2c00veCs5aTA4Zldjb0FuOVp2dXVDWUE0dVluVUlVOGhScmZS?=
 =?utf-8?B?NU5ZeWNWLzVuYi9KbTUwYllFZCtURnNtRzljaFJuaWd0d3ZwVzZNdVJHRFY2?=
 =?utf-8?B?ZkhZSTgwd1ptM05IMk9GOUxmdUlCTmdCU2h4L2E4WUZZd0wzZ0hJMU9jcStj?=
 =?utf-8?B?NWx3TVBMclBkYjNRL0paaUF2Z3FieHNuaXdBSWtYZzUzQ0tiNXZEckphZlQ0?=
 =?utf-8?B?NVBGekZQdHNXUkNVVTAzOTgvMU1ZVEV2eUFXcXRjdTV4aCs2Mk5jY1lnR090?=
 =?utf-8?B?N081WE1GVjhMT3FSSm0rMzdyc1pCaXFtSFB1MlNmWmxzMUFHU21EYTNVbUVl?=
 =?utf-8?B?WnFDRytHYTU4TkpDTTlGMzZ5WWFjck9jU0huYmFEbkdzRUJub25YazRUa2tu?=
 =?utf-8?B?WitBTTZiSG8xZUZYY2NMTkFtaFJYcGtaajF4Y1BIbVpxbnRIVTBCVlB1TFZ4?=
 =?utf-8?B?Ym9LUFY2NTk1MzluWTZsZHFyRVg1c2pvbUhhWjNkZE5NR0tETGhWbmovdldr?=
 =?utf-8?B?NDVJbXM2bTRxV1VpSFdkbEJMQlF0VzlOcC9hZ2pjVTUwenVlMXY0cE5lcDA5?=
 =?utf-8?B?amt2OHF5b1h6NDJzWmN0cS9Xa3IvQkNEcm92Mkx6dENIOHU3VWszVmIzQ3BH?=
 =?utf-8?B?VlRLeTFuaFJEZGFwNXBwT2xwbFZRUHNqcHJ2bWRxR1NKR2sxazFFVURXKy80?=
 =?utf-8?B?S3lZUjVUVVZMak5JTW0yWU9STUluVVVUejV2ZnZQRWR0NGdmTlMxYktSRG54?=
 =?utf-8?B?Tzg5amFWTDczU2dKaUVMS283SFltc3JxVXFxRG5URXowSElRRTBLR2w1OXdE?=
 =?utf-8?B?TDJndWxQMjNHcG5CRDdTUllYWGxyb0ZLK0o5d3pRV0tZNWVTYlBGRzlJcDVw?=
 =?utf-8?B?UGloczZKMEFNQzRxMWNEWVBEaTFkK2lhaWFjSG9zUU53R2IvRFhDN3BmSVRx?=
 =?utf-8?B?MXY0czRFYmFLS3Y2eE9xeDJETmphOVQycG5JWTBCZ25zNDJxVTZBUVlaSytS?=
 =?utf-8?B?RlhaQXJnL1BrWjdoZEExN095NjIwZ0VIaEFFYU5QdGZLdm9CbTNrZkt3aGQ5?=
 =?utf-8?B?RjBUUWcxcnBQTDZLQkJKeFNvdGxUZW9nS21RWjNuTmZZT2toc01rd3RJOW84?=
 =?utf-8?B?M1Z4TGZVeTRDbmhpTzlMSzRITzNPWXdZVHkzUVVXUXJIRFQyRW1WOVJKNEFE?=
 =?utf-8?B?VDM0bXdLUFN0UFRNU1JaU3lzUWNMUDZwcU8yOGMvM3hGOXRLL0VaMlN4bVRN?=
 =?utf-8?B?VzczV1NhZGN1c1VONXdDL1VxOVRnanlTdWVMdkpkRFluaGFzYXJKY0x4QnRs?=
 =?utf-8?B?T3BpR3JxenRwNGZ2OGhjb1Ntc0xoSzdOZTZvcjR4dkhaQTZGWUVkbTRzcVNl?=
 =?utf-8?Q?bdYMkG/qrT3KIyjo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67737302C5311E44839CDE099EC318AD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aADLRk5Qu2AK9/Lnr1K6cxKGabXVPvKG2DU7w0/G7kKJQuhYs06aY3j93AqtuF8X30XkYfq72gtmnZkhjkaUj1me6/zBUvKuaaeKRYG9S7yu5gY6PeTrOh87cJXg/dan904O7O0+CX4bxJSn5+n3CUEP3vWLEnaK91GcCFQ9Ciqu9e+ZlI5ec9HQPFh4uz7Y/E6C2Y353+KMmdoVBJR36rEdYbdg02aaXfOa3IkOB3ldvvzJUlKiRWrpwkx2b+cOkhHBVLdDCuTNEMgUSaAagMtUPquEvO0jpDKY9sZRZhs4z+AFDQTGbcrbj8fPrrQrTQNScyMkZRZnKw0s55m6qw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340a53ed-9bc0-45d6-458b-08df1a956b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 23:41:56.4316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmQCAZaum80+TfKEz9fraz/6PmPnAsEYRvCVjyTLZj1PuFQ1j07y08yestsLlawJaGCP0Gwm14nLVaC2fHactTD4vifReOMFpcjlLlxcMSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4919
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTI0IGF0IDEyOjEwICswODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToN
Cj4gVERHLk1NSU8uQUNDRVBUIHZlcmlmaWVzIGFuZCBhY2NlcHRzIGEgcGVuZGluZyBwcml2YXRl
IE1NSU8gcmFuZ2UgZm9yDQo+IGEgdHJ1c3RlZCBkZXZpY2UuDQo+IA0KPiBUaGUgTU1JTyByYW5n
ZSB0byBiZSBhY2NlcHRlZCBjYW4gYmUgYSBzdWItcmFuZ2Ugb2YgdGhlIE1NSU8gcmFuZ2VzDQo+
IG9yaWdpbmFsbHkgZGVmaW5lZCBpbiB0aGUgRGV2aWNlIEludGVyZmFjZSBSZXBvcnQuIEJlY2F1
c2UgdGhlIFREWA0KPiBtb2R1bGUgY2FjaGVzIHRoZXNlIHJhbmdlcyBmcm9tIHRoZSBEZXZpY2Ug
SW50ZXJmYWNlIFJlcG9ydCwgdGhlIGd1ZXN0DQo+IGRvZXMgbm90IG5lZWQgdG8gcGFzcyB0aGUg
ZXhwbGljaXQgcGh5c2ljYWwgc3RhcnQgYW5kIGVuZCBhZGRyZXNzZXMgb2YNCj4gdGhlIE1NSU8g
cmFuZ2UuIEluc3RlYWQsIGl0IG9ubHkgbmVlZHMgdG8gcHJvdmlkZSB0aGUgdGFyZ2V0IE1NSU8N
Cj4gcmFuZ2UgaW5kZXgsIHRoZSBvZmZzZXQgd2l0aGluIHRoYXQgcmFuZ2UsIGFuZCB0aGUgc2l6
ZSB0byBiZSBhY2NlcHRlZC4NCj4gDQo+IFRyYW5zbGF0ZSBURFggbW9kdWxlIHJldHVybiBjb2Rl
cyBpbnRvIExpbnV4IGVycm5vIHZhbHVlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoZW56aG9u
ZyBEdWFuIDx6aGVuemhvbmcuZHVhbkBpbnRlbC5jb20+DQoNCldlIGFyZSBnb2luZyB0byBuZWVk
IGEgbG90IG1vcmUgaW5mbyBhYm91dCB3aGF0IHRoaXMgVERHIGNhbGwgaXMgZG9pbmcuIExvb2sg
YXQNCnRoZSBob3N0IHNpZGUgc2VhbWNhbGwgd3JhcHBlciBjb21taXRzIGZvciBleGFtcGxlcy4N
Cg0KPiAtLS0NCj4gIGFyY2gveDg2L2NvY28vdGR4L3RkeF9jb25uZWN0LmMgICB8IDM4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJl
ZC90ZHguaCB8ICAxICsNCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oICAgICAgICB8ICAx
ICsNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2NvY28vdGR4L3RkeF9jb25uZWN0LmMgYi9hcmNoL3g4Ni9jb2NvL3RkeC90
ZHhfY29ubmVjdC5jDQo+IGluZGV4IDE0MDliMWEzMGNjNi4uMDlhOTJmZTIzMzU3IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jDQo+ICsrKyBiL2FyY2gveDg2
L2NvY28vdGR4L3RkeF9jb25uZWN0LmMNCj4gQEAgLTcxLDMgKzcxLDQxIEBAIGludCB0ZHhfbWNh
bGxfdGRpX3JlYWQodTY0IGZ1bmNfaWQsIHU2NCBmaWVsZCwgdTY0ICp2YWx1ZSkNCj4gIAlyZXR1
cm4gdGR4X21jYWxsX3RkaV90b19lcnJubyhyZXQpOw0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTF9G
T1JfTU9EVUxFUyh0ZHhfbWNhbGxfdGRpX3JlYWQsICJ0ZHgtZ3Vlc3QiKTsNCj4gKw0KPiArLyoq
DQo+ICsgKiB0ZHhfbWNhbGxfbW1pb19hY2NlcHQoKSAtIEFjY2VwdCBhIHBlbmRpbmcgcHJpdmF0
ZSBNTUlPIG1hcHBpbmcgb2YgYQ0KPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICBUcnVz
dCBEZXZpY2UgSW50ZXJmYWNlIChUREkpIGluc3RhbmNlDQo+ICsgKiBAZnVuY19pZDogRnVuY3Rp
b24gaWRlbnRpZmllciBzcGVjaWZ5aW5nIHRoZSBUREkgaW5zdGFuY2UNCj4gKyAqIEBpbmRleDog
TU1JTyByYW5nZSBpbmRleCBmcm9tIHRoZSBEZXZpY2UgSW50ZXJmYWNlIFJlcG9ydA0KPiArICog
QHBnX29mZnNldDogUmFuZ2Ugb2Zmc2V0IHRvIHN0YXJ0IGFjY2VwdGluZyB0aGUgc3VicmFuZ2Ug
ZnJvbSwgaW4gcGFnZXMNCj4gKyAqIEBwYWdlX2NudDogQ291bnQgb2YgcGFnZXMgdG8gYWNjZXB0
DQo+ICsgKiBAZ3BhOiBHUEEgYmFzZSBhZGRyZXNzIHRoZSBzdWJyYW5nZSBtYXBwZWQgdG8NCj4g
KyAqDQo+ICsgKiBWZXJpZnkgYW5kIGFjY2VwdCBhIHBlbmRpbmcgcHJpdmF0ZSBNTUlPIG1hcHBp
bmcuIFVwb24gc3VjY2VzcywgdGhlIE1NSU8NCj4gKyAqIHBhZ2VzIGFyZSBzZXQgYXMgbWFwcGVk
IGluIHRoZSBURFggbW9kdWxlLg0KPiArICoNCj4gKyAqIFJldHVybiAwIG9uIHN1Y2Nlc3MsIC1F
SU5WQUwgZm9yIHVuYWxpZ25lZCBHUEEsIC1FTlhJTyBmb3IgaW52YWxpZCBvcGVyYW5kcywNCj4g
KyAqIC1FQlVTWSBmb3IgYnVzeSBvcGVyYXRpb24sIC1FTk9ERVYgZm9yIFRESSBub3QgcHJlc2Vu
dCBvciBpbnZhbGlkIG1ldGFkYXRhLA0KPiArICogb3IgLUVJTyBvbiBvdGhlciBURENBTEwgZmFp
bHVyZXMuDQo+ICsgKg0KPiArICovDQo+ICtpbnQgdGR4X21jYWxsX21taW9fYWNjZXB0KHU2NCBm
dW5jX2lkLCB1NjQgaW5kZXgsIHUzMiBwZ19vZmZzZXQsIHUzMiBwYWdlX2NudCwgcGh5c19hZGRy
X3QgZ3BhKQ0KPiArew0KDQpvZmZzZXQgaXMgMCBmb3IgYWxsIGNhbGxlcnMgaW4gdGhpcyBzZXJp
ZXMuIFNvIEknZCB0aGluayB0byBkcm9wIGl0IHVubGVzcyB0aGVyZQ0KaXMgc29tZSBvdGhlciBj
b2RlIGNvbWluZyB2ZXJ5IHZlcnkgc29vbi4NCg0KQ2FuIHdlIHR1cm4gc29tZSBvZiB0aGVzZSBv
dGhlcnMgaW50byBwcm9wZXIgdHlwZXM/IFdoeSBub3QgcGFzcyBzdHJ1Y3QNCnBjaV90c21fbW1p
b19lbnRyeSBvciBzdHJ1Y3QgcGNpX2RldiBwb2ludGVycyBpbnN0ZWFkIG9mIHJhdyB1bnNpZ25l
ZCBpbnRzPw0KDQpBY3R1YWxseSwgdGhlIG9ubHkgY2FsbGVyIGp1c3QgYWNjZXB0cyB0aGUgd2hv
bGUgcGNpX3RzbV9tbWlvX2VudHJ5LCBzbyB5b3UganVzdA0KbmVlZDoNCg0KaW50IHRkeF9tY2Fs
bF9tbWlvX2FjY2VwdChzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QgcGNpX3RzbV9tbWlvX2Vu
dHJ5ICplbnRyeSkNCg0KV2hhdCBkbyB5b3UgdGhpbms/DQoNCj4gKwlzdHJ1Y3QgdGR4X21vZHVs
ZV9hcmdzIGFyZ3MgPSB7DQo+ICsJCS5yY3ggPSBncGEgfCBURFhfUFNfNEssDQoNCkFsd2F5cyA0
S0I/IE5lZWRzIGFuIGV4cGxhbmF0aW9uIGluIHRoZSBsb2cgYXQgbGVhc3QuDQoNCj4gKwkJLnJk
eCA9IGluZGV4LA0KPiArCQkucjggPSBmdW5jX2lkLA0KPiArCQkucjkgPSAodTY0KXBnX29mZnNl
dCA8PCAzMiB8IHBhZ2VfY250LA0KPiArCX07DQo+ICsJdTY0IHJldDsNCj4gKw0KPiArCWlmICgh
SVNfQUxJR05FRChncGEsIFBBR0VfU0laRSkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQo+
ICsJcmV0ID0gX190ZGNhbGxfcmV0KFRER19NTUlPX0FDQ0VQVCwgJmFyZ3MpOw0KPiArCWlmICgh
cmV0KQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCXJldHVybiB0ZHhfbWNhbGxfdGRpX3RvX2Vy
cm5vKHJldCk7DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9MX0ZPUl9NT0RVTEVTKHRkeF9tY2FsbF9t
bWlvX2FjY2VwdCwgInRkeC1ndWVzdCIpOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vc2hhcmVkL3RkeC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2hhcmVkL3RkeC5oDQo+
IGluZGV4IDQ5OTEwM2Y3YTAxYi4uY2U4MGZiMjExNmZiIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmgNCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
c2hhcmVkL3RkeC5oDQo+IEBAIC0yMSw2ICsyMSw3IEBADQo+ICAjZGVmaW5lIFRER19WTV9SRAkJ
CTcNCj4gICNkZWZpbmUgVERHX1ZNX1dSCQkJOA0KPiAgI2RlZmluZSBUREdfVERJX1JFQUQJCQk2
Nw0KPiArI2RlZmluZSBUREdfTU1JT19BQ0NFUFQJCQk3MQ0KPiAgDQo+ICAvKiBURFggVEQgYXR0
cmlidXRlcyAqLw0KPiAgI2RlZmluZSBURFhfVERfQVRUUl9ERUJVR19CSVQJCTANCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
dGR4LmgNCj4gaW5kZXggNzFjZDcwMWQzNDZmLi5lNjQ5M2YzYmMwZDEgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oDQo+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3RkeC5oDQo+IEBAIC0xNTUsNiArMTU1LDcgQEAgc3RydWN0IHRkY21fcnNwX2NoZWNrX3RlZWlv
X3N1cHAgew0KPiAgDQo+ICB1NjQgdGR4X2hjYWxsX3RkY20odTE2IGRldmlkLCB2b2lkICpidWYs
IHNpemVfdCBzaXplLCB1OCB2ZWN0b3IpOw0KPiAgaW50IHRkeF9tY2FsbF90ZGlfcmVhZCh1NjQg
ZnVuY19pZCwgdTY0IGZpZWxkLCB1NjQgKnZhbHVlKTsNCj4gK2ludCB0ZHhfbWNhbGxfbW1pb19h
Y2NlcHQodTY0IGZ1bmNfaWQsIHU2NCBpbmRleCwgdTMyIHBnX29mZnNldCwgdTMyIHBhZ2VfY250
LCBwaHlzX2FkZHJfdCBncGEpOw0KPiAgI2VuZGlmDQo+ICANCj4gIHZvaWQgX19pbml0IHRkeF9k
dW1wX2F0dHJpYnV0ZXModTY0IHRkX2F0dHIpOw0KDQo=
