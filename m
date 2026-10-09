Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEEC3537F8
	for <linux-coco@lists.linux.dev>; Fri,  9 Oct 2026 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512932; cv=fail; b=ewj1MyZ3dna9uEL4efluZiI3zH6hT0lMIFHAddcKAfgtU0lAFr+pU+2G/caC62LQSrOGehfUDIIPL+3fu3AVd+Xv3VuWOLmf5OqxGbUbSvh+zzGPKZHTw4XCC7F5yqZ95wuQhWz+hVvI291K/cugiHhjjqMTTPaYtV3NqR+hIVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512932; c=relaxed/simple;
	bh=0kqZdZd0A+KcIE1edK7wuGYltO7K2rL4uWgwDpCvoxo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kFjFG8CkQJQzRehs+VvGlRLE19huVNPPQ0eEWmKEjVRsOBK4mAWbgSe4oejE75Yr5gj7Znv+QjmQsTtUw0JoVBDNQA8YANXVwv7gs6Wj3axbnzMcd7fOcSwD+/eiWgIQKgJkfF4szsPOscaQ5v/ANmuE0jSNZRMGBHK+2hMrm3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+nsGQgi; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+nsGQgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791512931; x=1823048931;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0kqZdZd0A+KcIE1edK7wuGYltO7K2rL4uWgwDpCvoxo=;
  b=X+nsGQgiTaEUiJwS1NuwMbuj7M6EbIaV3Pp6ya5J90ifgjHr3prlJiyv
   wSt6xhy4v4x6y5vzj1Lbw4l3rDnkAJfc1l51ngjbnbTltvfb2AUqRIpDr
   hf5SrrmZ767wtXO79XnS6wo1Ih5emip71V3fLX8nZ+Uvq9RuQso0vRz5/
   2ZRb57WuKBSwjZtyeOilZ7XMW1lQdp+JN8K4/rJl79a3tCFuf0beY1IkR
   7O8sPmHpPqh8YroDZemCaGYnYe2li2pLchuKq5sHw1eEZwL+ZyPOfAcvY
   LbFRX95J9SOjbGNHOPaEaPeRYfXuTXTybRp9+wF82ydGFgNqInygefJ7g
   Q==;
X-CSE-ConnectionGUID: vjFxZkkIQyuBM9bJxOTouQ==
X-CSE-MsgGUID: Gu/TV5XYSR2NzM9N+e1kqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="206873"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="206873"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:28:50 -0700
X-CSE-ConnectionGUID: RutYOA9ISF6G1pIhQK+RbQ==
X-CSE-MsgGUID: 83Mn7ncDQyqFkR+ZAP7sqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="560625"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:28:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 19:28:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 19:28:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 19:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pve+9G+nl/gnuWSgsyZBKIgHeLBbD6Wef5vVpr0yJ0K7XQdxzX32dtvat2rvBs7+0nT3y2yGDkYOIqpVli+pPBaTzQV78i/xDnN9J+BMUtbAxdivzeF9GfcqcMUo9PoEsWooc6Ezx7h0YxcL8KSJBHl/dk5Wp8V4e9IyOiLWCdl9tPMJWa31XW2rxUiBpy81cgTAVtqTIh5VZSKlu5iILkLjMLVMqihi+x8VCnaJo1tvxQdfo4W93dLrGuoDqY4IrjCL4jJLLqb4JWPRMFgeWC0etSnXzfSxbVMVjVp8iP7UdYdwT/U2KFcHDlc2kEaUlpbLM2wX4UvkcEQKVR+AEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kqZdZd0A+KcIE1edK7wuGYltO7K2rL4uWgwDpCvoxo=;
 b=rpJNE1E7fr/ToWQ+ibNlO/cu0Z5v4NCx/LjYM2PDCqhW3BKEFDALBLwZ7lTrLflixFPBtTH3rCd3qY7hFc8EcwAfoK/Fm4ez+2LTCwUVlo8HHgTrXr0aektAOaEnz+kJ3jJoomnXMoeVsAcqoLj4xu2lpKt5tb6KTNJy081WxJVoN1NdTykrch59nDx2VmT7ZYa92Yn5Cy49ejEFN537WEANrP1eT1YhzN4IJmiviFa1u1MYjiGn/WsQ02sqC53MaRWMiEeqyVVi8eqoOwAsy/eB+sjUAexuveXSfCG2JuuZiilkRhVSqdTbId53pdkFg/KUELIaD20fWErprn6EDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by MW4PR11MB7128.namprd11.prod.outlook.com (2603:10b6:303:22b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 02:28:40 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 02:28:40 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: RE: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5XsnTSswCpUuCn5uop/dh5Lbea9SAgBSXjDCAAO0RgIAAorcA
Date: Fri, 9 Oct 2026 02:28:40 +0000
Message-ID: <IA3PR11MB9136DB533731D579798D3AFC92922@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <fcd71764ae5d7a0e0cc2c2d2264ea5aefb3fca24.camel@intel.com>
	 <IA3PR11MB91362C18E4C4BA2F735D9EED92932@IA3PR11MB9136.namprd11.prod.outlook.com>
 <269f4fb357efba0727dc6217627aa15cd8a0b002.camel@intel.com>
In-Reply-To: <269f4fb357efba0727dc6217627aa15cd8a0b002.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|MW4PR11MB7128:EE_
x-ms-office365-filtering-correlation-id: b1c4b9d6-8602-4930-1c05-08df25ad07f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|6133799003|22082099003|18002099003|4143699003|11063799006|10067099003|38070700021|56012099006;
x-microsoft-antispam-message-info: zmGGLKd+cPRRWnD0yU19SyodT871bpVpuKVasGeNiBpazdyI4C0kyF6ZIiku57ZWaxhX8rhsjHNCrwKsoPmeRlmC7s5z/puPxMvAgBVcLjyrj4xlPo8jBIMGW9X4kHiJuDu6IijXMkShEPfLCS7gFY5WNxKg2NCiS7bmA1nfRO+kRPN9tvVuv+y/848EC1Ykc0lekKt3OwbhAWK2jujgCugvmYDuJpaEI7FAhIar6hlCqijZc9bdMDoJRRpDB3c8OzXs/zNQix1BKxGZym8qVl+406bSXY5b0BUT4bZpzHIfpFadQdbmWYehPKRgfYiH1LZpNV/XMSeB8dKXLOFf8bRgOnrsvFXix6D66SlcqoOdbXjGfgXhkpm3uPFAd4NACtJ+OCMNViJN3XbyKQOl+rlkZQI3qOdbd/kSqHDS2VzWbYdOs6gwHkr+bZAB8XuQSrbJPGuwfjplJxwU3fn9V+OmnJb5IZ9wNypt8PD01OUF1JrUVIzGXLNQTAMZSzA2v+IcjI4mNpRMe4yUq2oEnyLzXyjewdCwBI5PSGaigiNbxGBadqSrPveZrmzMHiDmFJq9YWhCuBUncpVW58fmhGdB0lvgN+uq8mhSlw8tdYm2GCT/oBIKiQ5MnE+csc0vDXu/xAINEDlM6g0fftg3xMO0ke18xzO3XQU/T4fvQ6dvTvjMoip/DRY8g07M7bneeqSPjN0f8ZYi6xqtHLpKz3nWIRbAPUheRD4HRbU2mvg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUlxL2Ntd2dWSi9SV2xJOXZiNjBDYlBuSUdrUG9HVTJyMUVIaTZqR1N5ZExv?=
 =?utf-8?B?ZmdsNnhUQks3K3M3c05rZVBHYUFCKzJFeWFsYS9EclBHMHI2ZVF3ZUh0cmlp?=
 =?utf-8?B?VDBxSmtrQ2VzalpueDZnQnhaNi9SM1lNTDM1RXpnTUlnUE4zaDZtSEdrMFp5?=
 =?utf-8?B?RmIzUk93YkZBaGZ3Y3JVNkJ1VjE1bjZGWEdHdmFSWXdScGlTU09pV0tsR3VM?=
 =?utf-8?B?UXdyV2NTc0kyY1lzUWh5MGwyZ1I0TjFzYTl4ajNQTnpIZE56U2wxN1luMDFN?=
 =?utf-8?B?aXNadldpMFlyS0gvekR5Sjl6ZUFiRGxRajlBYTgxWmNNeDl5NFlyeHpNNGdW?=
 =?utf-8?B?WVQ5N3hZQ1JJVGZhNmxxQWNYZlQxMjFzREgyZDY2QmsxckErU1VJNEtEeU5F?=
 =?utf-8?B?YTUyTG5zV2daRlB2MERreE1uMEl3ZEc5MmlpY3F6anNvMDlvc3JQOEpGWXpD?=
 =?utf-8?B?SlF5Q0lSa2tBRTBaU2NqOEZ0dTdNeEFjamp2MWpUSGpWQTJxZWU4dW5LU1g5?=
 =?utf-8?B?UU54RnpzcmxWS3RrZk0vSDFnVUxhK0ZYYzIwWnFXRHNrWVRKM2gycEFLTHBN?=
 =?utf-8?B?VHJLY2FpbFZhK0lTNkFxa2oydFk1dmpLUTlNa1ZnZVUyMXA2SzZtSUxMdm5Z?=
 =?utf-8?B?SjhNNW05Zk1WeExPdzRDRUUzU2lTdTVta3FTSW1EYW1UTFpoWHQzSHdIK1hX?=
 =?utf-8?B?RUV5TW53b29YQ3JpTW9Od3R6WkdvdldmZnRoMmo4UXpwbjhEMHhqb1hIaFNM?=
 =?utf-8?B?eEwzNXRCMTFwL1VNeVVHeU5qV2p1S05XMGhWWVRFcWJZc0hVekx1cG1XU05U?=
 =?utf-8?B?OGp5RWVvQWswRXdBMVdHZ3ZIaEdnR0hwV3lPeU1Ick5yTnVCRHo1QnFJWGMv?=
 =?utf-8?B?eklaK3Y4TWhOTnNGQ0VBZms5M3d5TU81cmswaGlJVHhHNlhJQm1KMGhPajYw?=
 =?utf-8?B?SGlsSXJ6Qmh3Y3VSWXRFNjUyMk1la1BYWENzUTUzRTVSYTRoc3NnYkgyaXRR?=
 =?utf-8?B?MVVCS2I0NGJoS0x1anlrMVdmWjNRd29mUkw4ajhUMUd0ZEdrTzdqYWVXQ0JK?=
 =?utf-8?B?S0Njejk4NUs2ZENVVlRWc25UVlRWNHkwWU5kaUJkNGJPUHlxT3lXVU9NMnNC?=
 =?utf-8?B?Q1pGNUt1MWZ4dythbzc1cEN0K2JlU3U5T1RzY25iMkliVTlGWUdkY1N2ejl0?=
 =?utf-8?B?SFhoSXZGRXdBU0l6L09NUHBWUjFrUzI4ZUwrcHBBUFlkLzFBUm1RMkJFcmZh?=
 =?utf-8?B?TXJzYnJrYW1JNkFMTlpEeXFwT28zZnZ1QkxGTUpYZytGQlJBaUxFMVl5bUY2?=
 =?utf-8?B?N1Q2M3h1U0tPMTV2SUlkbWlCSEFUWVJhejU0Q1BEN2NPaVhCd2FlYW1IbHBX?=
 =?utf-8?B?eHljM0xESFE4eW1KbFRzaU1LMmkvY0R5R282Z3R1aVBoRDBXZHVkVVNkK3p5?=
 =?utf-8?B?bXRITjRNVUxQckdPMWM4aEVaMTh5Z3ZwMmxOR3BqcG10MTJqZmNuc1dEUHE5?=
 =?utf-8?B?VFJyeTB6TzA1NlhRV1h4a1IycjNEZXc1ZWtvU0JwTjVvbXZwS0s0QTVEY3hK?=
 =?utf-8?B?TEltb0FEd0ZlL2YyVmRxNmtvVHVxZ3BOS1hYb1ZkVERISGpDQzl3cDNaT2pt?=
 =?utf-8?B?T0xibXpHUDg2b2dVZGhZZXR1dUFJR0Y5dVYxMmVLRkVmQ1d0UnoxNTQ1bjlv?=
 =?utf-8?B?NjYxZmpjcllEaEJWUFFiZ3JYUitHTVBWb2NFWi85UzNRdnJiN3RsR1JTRTl4?=
 =?utf-8?B?Zk04OTZhb2JYaENpMHBDeGlZbWsyMmRYNjJ2bUpxOWxBeEdOSnE0MkdmcXp1?=
 =?utf-8?B?R20vNi8xK200UjQwOTFIL3lhejc2S2g1MGYvemJXKzhJTk0zeWR0MkxPcjE3?=
 =?utf-8?B?eTFsUVJtRkpIKytHMnBuNW5sNU50WGdLUnQ0cmhEWlgvWFgweUlEaEg3aTlm?=
 =?utf-8?B?TWZNWk5vVmVWRWNHWkc3dkszRFZha2s5VmV6NWo1cFEwclpWa0NzcEVjMVRI?=
 =?utf-8?B?U1dzOFNONEdxWHVzNm1DUDZFK3c5TXg1ZG9TNWxva3FNWjB6ZDVSU24wNk5n?=
 =?utf-8?B?TnRRcXRCc0VEamhQOWc3N1liNjVEQWJrM0dldU16cU1Mb0dkRy9ZNGZaNS9J?=
 =?utf-8?B?cUNGZUxtQ3lwa24zWmFKMTU4RFJDamZPaTNiTWc4WitkUm9ucmkzSERjMUc5?=
 =?utf-8?B?MFRCeUJhODAxRHU0SEc3dXQrdlgxb2lHQ2VvZXNkOVA5TFJlNXFLSS9zU0NH?=
 =?utf-8?B?cTFvUkpWUUxqQWtHV1JCZVVhOWIycHBPYUJkSzJlZk1QQWhqcnd1K2NnRWNw?=
 =?utf-8?B?RnlZTC93NEZQa25QekpLNXZheUVRaXFKYkFaSVJqS3Q1R1oybWtKdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: v+RAsphHW1t8XlNbiystXqiLKm0OpKOd9boPKO+cBvQwuEyIL54LzfmWbj6Hd4hLfaFtP23oFmVpZB04/WJ4T6wUMWQ/n/E2mAFoY7dQadV9aVzXoJ8Ry8q93p7IPLIvLcMjK6Xzpu7jF6XfdHZrwh+Qzhdy/PR9uXWkwf8+OgBV+rekrpU7P49eZdwOXtiEierq0RqBICR8pt4ZW1kCWXAkNy/M+xmP7A2z+QbKNPSGO8IIWs42XiZ9en/026ZybUc3E65kPPDnsk6IhrxGkSy60Hm0pRECNKLWhJB5rOrBU/I0+ouToSNZ1DVTCq6sRxiYQHgLQxky2ujoSdruAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c4b9d6-8602-4930-1c05-08df25ad07f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 02:28:40.2622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X2TBHeR/yZh8xzNnh8/1pokMrlVRSgfkWFimPwTS52Tzx9SuypMaAoz+FAazVTjJNBF7Czcig1zrJJPOV7fb7iEP+rIWbi5Kz2bXm4X589A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7128
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
My8xNV0geDg2L3RkeDogQWRkIFRERy5UREkuUkQgbW9kdWxlIGNhbGwgd3JhcHBlciBmb3INCj5U
RFggQ29ubmVjdA0KPg0KPk9uIFRodSwgMjAyNi0xMC0wOCBhdCAwNjoyNyArMDAwMCwgRHVhbiwg
Wmhlbnpob25nIHdyb3RlOg0KPj4gPiBCdXQgSSB3b25kZXIgaWYgc29tZXRoaW5nIGlzIGxvc3Qg
aW4gaGFuZGxpbmcgdGhlc2UgYWxsIGJ5IGRlZmF1bHQuIERvbid0IHdlDQo+PiA+IG5lZWQgdG8g
Y29uc2lkZXIgZWFjaCBlcnJvcj8gRm9yIGV4YW1wbGUsIGlmIGFjY2VwdCBnZXRzIGEgYnVzeSBh
bmQgd2UgdG9zcw0KPj4gPiB0aGlzIGJhY2suIElzIHRoZSBjYWxsZXIgc3VwcG9zZWQgdG8gcmV0
cnk/IERvZXMgaXQgZXhwZWN0IHRvPyBPciBzaG91bGQgd2UNCj4+ID4gZG8gc29tZXRoaW5nIHRv
IGF2b2lkIHRoZSBidXN5IGluIHRoZSBmaXJzdCBwbGFjZT8gV2UgbmVlZCB0byBhdCBsZWFzdA0K
Pj4gPiBleGFtaW5lIGVhY2ggcG9zc2libGUgZXJyb3IgY29uZGl0aW9uIGFzIHBhcnQgb2YgdGhl
IGltcGxlbWVudGF0aW9uLg0KPj4NCj4+IFllcywgdGhlIGN1cnJlbnQgbWNhbGwgdXNlIGNhc2Vz
IGFjdHVhbGx5IGRvbid0IGNoZWNrIGZvciBidXN5IHJldHVybnMsIHNvIEkNCj4+IGRvIHRoZSBz
YW1lIGluIHRoaXMgc2VyaWVzLiBJJ20gb3BlcmF0aW5nIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQg
VEQgZ3Vlc3RzIGFyZQ0KPj4gaW1wbGljaXRseSBkZXNpZ25lZCB0byBwcmV2ZW50IHRoZSBURFgg
bW9kdWxlIGNvbnRlbnRpb24gdGhhdCB0cmlnZ2VycyBhDQo+PiBidXN5IHN0YXRlLg0KPg0KPlVo
Li4uIHdlIGFyZSBkZXNpZ25pbmcgdGhlIFREIGd1ZXN0IGhlcmUuLi4gc28gd2hvIGFyZSB5b3Ug
ZXhwZWN0aW5nIHRvIGRvIHRoaXMNCj5kZXNpZ24/IEJ1dCBhbHNvLCB0aGUgaG9zdCBjYW4gdGFr
ZSB0aGVzZSBidXN5IGVycm9yIGdlbmVyYXRpbmcgbG9ja3MgdG9vLg0KPlBsZWFzZSBpbnZlc3Rp
Z2F0ZSB0aGUgc3BlY2lmaWMgZXJyb3JzIG9mIHRoZXNlIGNhbGxzIHlvdSBhcmUgYWRkaW5nLiBQ
aW5nIG1lIG9yDQo+WWFuIG9mZmxpbmUgaWYgeW91IG5lZWQgaGVscCBkZWNpcGhlcmluZyB0aGUg
VERYIGRvY3Mgb3IgY29kZSBhcm91bmQgdGhpcy4NCg0KSSBzZWUsIGhvc3QgbWF5IGNvbnRlbmQg
d2l0aCBURCBndWVzdC4gV2lsbCBpbnZlc3RpZ2F0ZSB0aGUgZXJyb3JzIG9mIGVhY2ggVERJIG1j
YWxsLg0KDQo+DQo+Pg0KPj4gRm9yIG90aGVyIFREWCBlcnJvcnMsIHdlIGRvbid0IGRlZXBseSBk
aWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlbS4gVG8ga2VlcA0KPj4gdGhpbmdzIGNsZWFuLCB3ZSBv
bmx5IG1hcCBzcGVjaWZpYyBlcnJubyB2YWx1ZXMgdG8gdGhlIFREWCBlcnJvcnMgd2hpY2ggYXJl
DQo+PiBtb3JlIGNvbW1vbi4NCj4NCj5Fc3BlY2lhbGx5IGlmIHRoaXMgaXMgYWN0dWFsbHkgaW50
ZW5kZWQgdG8gYmUgYSB3aWRlciBzb2x1dGlvbiwgcGxlYXNlIGp1c3RpZnkNCj5zcGVjaWZpY2Fs
bHkgd2hhdCBpdCB3aWxsIGhlbHAuDQoNCldpbGwgZG8uDQoNClRoYW5rcw0KWmhlbnpob25nDQo=
