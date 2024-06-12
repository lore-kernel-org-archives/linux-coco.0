Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCD616F0C3
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718191190; cv=fail; b=EYIUIekzcvfNdJyiJz5MVwweZTWOZ/TbFqvfKiLEJ2MAv261RiiY9iFIvHi+cpXwI52tOQgzu+nf5inD/fZ2by4Fx0hgnLQEnvHNC8sBM3YWTxFfr8JTfrmdBG/gYcCKWiPdizMhjs4HTvKkDt7F0PEcOHm6StBLADevbqpW83M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718191190; c=relaxed/simple;
	bh=u9FsGUbjL1y9YH3oP3f01ap91mw1ZYiNjseVxVf3S6A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kwcOiXRXk7suzczpFLJqPU804E3B0+y2knjOO0JfqVtM7XS0wlGFP8uFXPbrPfLQsHqsTpzmET8NfC+fmVkb48E2S85GLK4rKQYhkBBwYHdZID2K8D68QffhC/iAOSaYsjvrTz5svJSAAn+I6WdMabb077KWEK36XxofgYjo9fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5Ac14wr; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5Ac14wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718191188; x=1749727188;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=u9FsGUbjL1y9YH3oP3f01ap91mw1ZYiNjseVxVf3S6A=;
  b=Z5Ac14wrpxN0wiM80iOCSL/ExThP8ZBGVrH0qg3OtdqrNUtjy0W2yRrQ
   u2aC02RwRPdKZG2WGbOAnx644GW1HWvQ8FgCcFz6Q/piskH0UgrLdHwyY
   lq9TQC7hWzKEs+cmURGoIoGH8DEkJCy/q8S6e+DIHaiNd2lcS0KSpr51y
   yK/nm6ld/WRpG4U1/LZGyu5b47+qz88NrNLRP5CnrHLfDyeMDWJdZRCo1
   hUO6Jh/OvRZ/q5MndVKeJJ8n+ZjaCBchIlP3zHEdD5xl5rlxyy5/1q828
   1B3CLBXMG1tfy7aWol31KJx5/38imon/I98SSzYLI3d+qy2fCt3uo82oY
   g==;
X-CSE-ConnectionGUID: bwVVCK1aR0iCCd7LjBDdzA==
X-CSE-MsgGUID: qsdXlI62QCKbS0vV32iULw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15116870"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="15116870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 04:19:47 -0700
X-CSE-ConnectionGUID: vUZnErlTS1mBNWlic5QkIg==
X-CSE-MsgGUID: bcO2khz3Q2C0NQ7wOJ9fiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="77210802"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jun 2024 04:19:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 04:19:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 04:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQSZSCjWJ7Gr9MudFzTOIadC+cXQtVq5tGmWHFBrAeAi6978e+Iq4PyoONqWAZpXnqv22YPHm4QoG16f6YJpfVfvl6CNmwjtG5MoCXjIxz1Mk16wGMPz2s9WkJh1hd9IcEQle7c4qlTuB3COEgmYagZPW3gWIOer199cxvNY/OlHkzqMu9pc7FJocwgAmGupOV97VH4bXSw+3EYaTHf+nEMBc9KApMcpq07idmqpPgvgw6clpNwsCOi1eejLfSFudZNKWWISC1as5oFwkuEzDcEOAOrx1eLEn0Y+YPHztfwYmMirKg5Q8Kp0IvWj6NiZtcjI8p6tVNXElZLxMbEKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9FsGUbjL1y9YH3oP3f01ap91mw1ZYiNjseVxVf3S6A=;
 b=ODqA+0MsNjVEl2VFLitRYCs9KoD6lbGhk4h/AAPm0kMzpibWE+l7S8l3ErOMgEgCWbszYBW8XoBjT/Lk3m8E67SoCbcDCD7oPt873xFmR0DSwXMSJS72Bzutd5C/qhgIDYWvlWEsue84JHR0aG8vCjTB9UkKyuBQTy3Nml66BaNkm/ue3l1kT7fRYSIjmzN4L9wht6o5aWX/OhXLpd0i+KT9PvAFfB7jYqkclMTmYBw6qH30mw5gqChkcB43wzEqYfLrsV3uo2DMmKSbcqsq/OkJ9P0zqAnL/RVwXUVbARGhivahYjBNDJdHHLQaVDH3Ctj/dl2l/fVJenCoAUjRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 11:19:38 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 11:19:38 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Graf, Alexander" <graf@amazon.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
Subject: RE: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Topic: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Index: AQHanZPnXDME9v4Jq0aAj3sHCS9+NrG8kbKAgAAFESCAABcUgIAHiQiA
Date: Wed, 12 Jun 2024 11:19:38 +0000
Message-ID: <DM8PR11MB5750B08CA4CBFD459268A42CE7C02@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
 <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
In-Reply-To: <c3457141-1b62-4a7b-9cba-0ecec4dfb693@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|IA0PR11MB8400:EE_
x-ms-office365-filtering-correlation-id: 68293ee5-cb28-44b0-7290-08dc8ad18c60
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|376006|366008|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?TGNtNCs5bXQ1WXhvRlJZQnZuME9lcTZkUDBSbzlFcVR0NXo3OUM2ZThoOFBZ?=
 =?utf-8?B?b3RTd1IxbDhDUkhORGFtcHBhK2NFS0FYL0NHaU5LaEd4VWxDamtRelYwbkhN?=
 =?utf-8?B?UVhaam5UQk5uOG9UVURXVy85ZVdVQU40dHQ3TnUzTU1sSTJkcG82QVZKejhI?=
 =?utf-8?B?Nk5yNDFtQzlaN0J2OFp6QkFwRU1aYWM1ODg1R3BtaG9KcnFYY05nU3RUakhl?=
 =?utf-8?B?Sk16UXhUdkVRejVjMXdjMkxjanZERHhSSWl5NHBXRDM0NHI0cjl4YkVsTFVE?=
 =?utf-8?B?WlptQ3NobHpLVmtwKzhmdm4rSkNyWS9zdjdrUmxFK2xoamhBMjBQR00zUFlt?=
 =?utf-8?B?djI4UVlmTmNFSjBROVFHVU5VMDd5aTN1MDBkQmN0U3pQWkZYRTBSWlBrdHQ3?=
 =?utf-8?B?d1loOVRHdmdWUlZlU0ZBWHhPcmZ0cXlnQ20zNFRONnJxdG5SRjVsalpyek9S?=
 =?utf-8?B?RW1CNXBuRDVzM0lKSlJ4R3lSNExqRHNDYUkrZjdUdmR4MUJwVWdNT01uUWFm?=
 =?utf-8?B?NFlvYnhVeUhjNzJzVWRTSlVwWU9MbG1tSzZ3L1RaRnNoY3oySXR3MzBXdlV0?=
 =?utf-8?B?MWovTjJYRExHK09zM0dhVnAraFo1Z1hsM20vaWxzeFBBRFJ5cjBzQlNWYkV6?=
 =?utf-8?B?ejhlM3FwK1hLcU9rVm9oKzJ1d1JYZjBRcktWaGJkSzRCUDVCVWthenYyRzhy?=
 =?utf-8?B?QWdEY2dCeG9iQ2tGRlJuVkRwN29jZlFTQ2Y3NWdpRVArVmk2OWU2UlBCVU04?=
 =?utf-8?B?eUVjRi9qVmJod0lyMzlwbDFHRklaUUhlY1JvaGd5QmZ2YTI1eW5QZzRrWWEw?=
 =?utf-8?B?N0pCTTdBQTQ3NFM4M2orYytiRUM1UnlkbkhYVnN3UDR5MGgwMDVjYldTMzF2?=
 =?utf-8?B?WjNJc0w2MUU1dnh0UFZQUFNudU1KdnhLNXdEL2l2TVlDNVZSc0lHYi9seW5h?=
 =?utf-8?B?U1Uvbk41bTM5RlNINVByOGJaQkZkOGc5RlloeTJqZWR1dFk1TW8vczFIMnV4?=
 =?utf-8?B?NExteURBWGF0TTNwd3h1TXQ5OHpTTHVEcGQ4dnZrR1hGUVV2L2tSWUV4bTZJ?=
 =?utf-8?B?cWpYQWFCaHB6TDVYVXZYL3ppaEFyL20zclB2Sm1xY1dEMU56TUp5c2syUmZu?=
 =?utf-8?B?RGJkL0tyWWVUSVNyU3k3RTBxYkVIWndUZm95d2ZGdXBXWXA5ZlZKdy8yNVJO?=
 =?utf-8?B?dURQOVRxTjF1K1FQZUo3cDRneXJxQ3FZZUR2WE1DdVpYQ2dPb0dVUi9vZ0Zh?=
 =?utf-8?B?TjNuck5sUFhRRW1YZ2RVRWcvMmJLMkRRL21PUmdsQ3BQcXVDOGxQcndLc0ZG?=
 =?utf-8?B?dERMdWlVeXFYbDBTRCt4WmhyNVFHRWJyMkxKZW5OK1JtWTY5RkFXb3FqTHdC?=
 =?utf-8?B?K0VlRUs3UnZIZnZYaFJFMFh0cTVQQXJDdDBBczBlN3lUMytMT1F4dXR1SU56?=
 =?utf-8?B?azJjeXNnZldFQTVRazNLamNFWUMwa0djZWY1TDFQOGd0LzdPR2lKZ3VZc3lG?=
 =?utf-8?B?MElWaGw3K2kwS1JEMkROSTB2TEFWN0Vka3I4NGNJNDZmRml0VXJZVlFibXd1?=
 =?utf-8?B?OWpQYnErbm1qQldENzNFOUpkZkNCTVpQanhwVnZLSUtqUEE1ZzJYL0Q1SkhU?=
 =?utf-8?B?Z3BBM3BDOXRpRW5HRS8wU3BTREh2MnV4bzBDYlM1RElVcTJ4Q0hIOWhWYi94?=
 =?utf-8?B?ZUsrNDNsQVR3aS93TG53T0dYcFl6ZE5NSmk4M0gwZDhRcmsySmJSTUpFd1l1?=
 =?utf-8?B?dzRVd3B5R2c2Rm1pTDducE5CTDhDY2JhTEM2TTZRS1hySUFXRUNrazl5NEZK?=
 =?utf-8?Q?ru0hkz1Yr/+W119LW8cwzYWnzTwd7EVlFd3sY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(376006)(366008)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHVBZ3NjaDlHSmVSUTZ0TVBVOGtsczRRTnBjOTRNUjRDV05OQ1lGSUx4RlI2?=
 =?utf-8?B?ampvcXF1M1RQNTUwbmRrRXNOSlpIT2tWTHJkWnpCMldWbC9LTUV4aGlCTFRM?=
 =?utf-8?B?WTVxSDhKYS9mMVBKdE9qOGtCTHB0M2YvNHlwVVEyT2lDVFZTQWNKdmkzZFBj?=
 =?utf-8?B?SmFnR0hSeFlOZWpIQmxwME5CMTFrZHR6UzhJVXBGeWhzczJrNnFlVEpPb0M5?=
 =?utf-8?B?OXZIT1VzZHV2am9vNFBZZ0dUSjdUOFJDd1V3eURXdE5INC9SVGhOTVVudExE?=
 =?utf-8?B?R25wNnd3TENzNmV0RjJiL1FqZm42c1dTNzZzM0kyVkU1R1V0UXVpS2RmaW5s?=
 =?utf-8?B?SHIzUUF6QzVmWC9oaXc5WmNWeEhKeGpvMmZ2Vk01NkxXdVRPYk5SZTRiM29K?=
 =?utf-8?B?YXU3Uko0bHBCcjlmRmRLZkE3TmtUYitvMXc1RVNkYWNPVGZaekdKNlBudElr?=
 =?utf-8?B?ZUg4aThxZ0lmT25oNFJ0U29odS9VeDFsOEJTRGY1OW9WRW9XVXRRQk5ocklw?=
 =?utf-8?B?cG83Tyt6cFMvSVpZeUhGNk42Yy9tWlhLbEp1UGx1cndxckpqaFExcWxjWXNO?=
 =?utf-8?B?NTRFNlo0bEtyc25BRE1scmFLZlpGQjdGMjdQY0M3a3RnNFBSWC9JYTBzek41?=
 =?utf-8?B?Q3dySWZqblBTVG5ySDEvVFlJNFJlY256eWpvd3lKSURkZ0t1SFhoVVFnZHpN?=
 =?utf-8?B?Vi9zV0tTMmt3NDdIVmFnT1ZadTR5RS9vc05FSnkzZmlQZnhSZzBTaFRHS0xQ?=
 =?utf-8?B?SmtQd3BOb3REdDg0VVA3TVNCYXVsM1ZWT21QUTJGdG5NazhZN1k0bzMxZjJo?=
 =?utf-8?B?a1Q1SnAvbWhVaWZzajhocnB5ckVrZ3hMckVUK1RZWUtTVUtaYkVjTzZVeUw1?=
 =?utf-8?B?RytNQ2xQcE8rTi9aN0xwUFhHREYzOW80Y1BneDlmTXd2Z0JJVGdiaTdBK3dV?=
 =?utf-8?B?NGYzcmwrN0JHZ1F1U3ArZTdpMC9WYjdWUG4vUDI1ZDVRSWxkUjZBR2hyTEpM?=
 =?utf-8?B?KytCYUtrdFc4cWZISzh6ak52dE1naXYyVnkyRjZUQlZpcUpHQktramR0TW4x?=
 =?utf-8?B?K1Q4UGdXRkxVU0ZudWtxQ1I3TUdCWHovQWtxZ0hiVDZWVG1VUmRuanJhTVRq?=
 =?utf-8?B?NXdIWUtma05IL2hPeDFDNE9DS0VsMTc4ZSsxRGlNMlJXVGFWN0hKUTArb0tk?=
 =?utf-8?B?a0oxNGxHRVRnTU5WWCttRVBWeUtyN3ZacWg2WmRkSXpiNko5MEhid2tGc1p5?=
 =?utf-8?B?ZEZCM3pPTVc1WWRDRE1hNGZxdXVXY3RjSGthV1FSUk02OS9wUDk5UWhTd0Zl?=
 =?utf-8?B?ZnFuZTJwQWMrV3Z3c2FnOGpsK1c1KytlOWhxOUluQzR4ZEE5c0MzdGdCL2dh?=
 =?utf-8?B?c0Y5aXg3OUhNRmIzcjkwS0xjVmJGYndQb21YQm1pMmZzRlhxYlBzM2U0NjZt?=
 =?utf-8?B?azhvaWJiRzFRaGMyRmRpQWhvZVFhTE5kTFVFNWRhWDQwTmNpWDNsc1Yvbm9r?=
 =?utf-8?B?ZXBwRUN3bHk2cUdWbjF2clluaTdJek9wRnFQdDczRUpRRWdBbEMvZkpSbGtu?=
 =?utf-8?B?YUFHN0hGMm1VbUR1bk5CeVVkbXZCTDBsVnZVdC95THRXbnhBRzJuelVSQU81?=
 =?utf-8?B?Mi9LM1FQVkU3ZFVDaHZHQjdRazlBY1I5bVV2aEhDNFg2UThZZkdPN1NBMjRL?=
 =?utf-8?B?K3hOaSs2dE96cjBQUzRxQ3pFMithaVI1SitmejU4QjEzQTQyeUo1WjMySnJn?=
 =?utf-8?B?MmxQSURhWEhMY3RmRTF0QTJDU3ZTUjNyelVOSUgrd1lUQjFlZGhzR09RMEoy?=
 =?utf-8?B?czZ2T0trQmY1OUpFdnRaY2NQcTcxZkc3aHAvelFXdXhiVG8yOFJ0R2ppNElB?=
 =?utf-8?B?YVVOWm5jTG1jMDM1VTh5S3FEOVpmdHB2UVBScnBSMXdkNFhnOHp3bHE1aVQx?=
 =?utf-8?B?UmpOTTVMUWtoMTlnVktNRklsZWQxQnRieWx2aWNKbXlNQjJsbGlWUmREVUo0?=
 =?utf-8?B?aTZJd0tiTlo2dmhMbGE1U2JZU0lFVTNVcmI4WDFISTJ4ejVFK2haRTkyZnVD?=
 =?utf-8?B?VzdIQ1VYd3VETE92emh5SXJSc25Pdk1FQXFmdURtbitiNjJ2TVBMUG1DNERy?=
 =?utf-8?Q?8uAbK86TCmSAJqjGZpduN39ds?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 68293ee5-cb28-44b0-7290-08dc8ad18c60
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:19:38.7180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10jrk4dMB5yiFC15Q+dDCcSdV4YvHcQojiF5eJyjP9YYw0uEucHJsbKbKVAHaVqNqHfr/UABA42P/B/MDHFfEy/agjNU9WSFJZi61EMfvXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
X-OriginatorOrg: intel.com

DQoNCj4gDQo+IE9uIDA3LjA2LjI0IDE2OjQ2LCBSZXNoZXRvdmEsIEVsZW5hIHdyb3RlOg0KPiA+
PiBIaSBEYW4sDQo+ID4+DQo+ID4+IE9uIDAzLjA1LjI0IDIxOjU1LCBEYW4gTWlkZGxldG9uIHdy
b3RlOg0KPiA+Pj4gSGkNCj4gPj4+IE5leHQgRnJpZGF5LCBNYXkgMTB0aCBhdCA5YW0gUERULCB3
ZSBoYXZlIGEgQ29uZmlkZW50aWFsIENvbXB1dGluZw0KPiA+Pj4gZGV2c2VjIC8gQm9GIC8gRGlz
Y3Vzc2lvbiBHcm91cCAvIFNJRyBjYWxsLiBFdmVyeW9uZSBpcyB3ZWxjb21lLg0KPiA+Pj4NCj4g
Pj4+IFRlbnRhdGl2ZSBhZ2VuZGEgaW5jbHVkZXMgUlRNUiBBQkkgdjMgZGlyZWN0aW9uIGFuZCBU
RUUgSS9PIG5leHQgc3RlcHMuDQo+ID4+DQo+ID4+IEkgaGF2ZW4ndCBzZWVuIGFuIGVtYWlsIGZv
ciB0b2RheSdzIGNhbGwsIHNvIGxldCBtZSB0aHJvdyBteSB0b3BpYw0KPiA+PiBzdWdnZXN0aW9u
IGhlcmU6DQo+ID4+DQo+ID4+IEkgd291bGQgbGlrZSB0byB0YWxrIGFib3V0ICJjb25maWRlbnRp
YWwga2V4ZWMiIHRvZGF5OiBBIGtleGVjIG1lY2hhbmlzbQ0KPiA+PiB0aGF0IGFsbG93cyB5b3Ug
dG8gZGVzdHJveSB0aGUgY29uZmlkZW50aWFsIFZNIHlvdSdyZSBpbiBhbmQgcmVjcmVhdGUgYQ0K
PiA+PiBuZXcgb25lIGJhc2VkIG9uIGEgcGF5bG9hZCBvZiB0aGUgb2xkIG9uZS4gV2l0aCB0aGF0
LCB3ZSB3b3VsZCBoYXZlIGENCj4gPj4gdmVyeSBlYXN5IGFuZCBjbGVhbiBtZWNoYW5pc20gdG8g
Ym9vdHN0cmFwIGEgVk0gaW50byBhIGZ1bGx5IG1lYXN1cmVkDQo+ID4+IG5ldyBleGVjdXRpb24g
c3RhY2suDQo+ID4gSW50ZXJlc3RpbmcgdG9waWMsIEkgYW0gY3VyaW91cyBvZiB0aGUgcmVxdWly
ZW1lbnRzIQ0KPiA+IFNvdW5kcyBsaWtlIHlvdSB3YW50IGEgbG9jYWwgZmFzdCBtaWdyYXRpb24s
IGkuZS4gYSBtaWdyYXRpb24gdG8gYSBuZXcNCj4gPiBDb0NvIFZNIG9uIHRoZSBzYW1lIHBsYXRm
b3JtPyBJIGd1ZXNzIHRoZSBkaWZmZXJlbmNlIHdvdWxkIGJlIHRoZSBhYnNlbmNlDQo+ID4gb2Yg
dGhlIG9ubGluZSBtaWdyYXRpb24gcGhhc2Ugc2luY2UgeW91IGFyZSBwcm9iYWJseSBvayBzdG9w
cGluZyB0aGUNCj4gPiBvcmlnaW5hbCBDb0NvIFZNIGZpcnN0Lg0KPiANCj4gDQo+IEFsbW9zdC4g
SSBiYXNpY2FsbHkgd2FudCB0aGUgVk0gdG8gYmUgYWJsZSB0byBwcm92aWRlIGEgbmV3IGVhcmx5
DQo+IG1lYXN1cmVtZW50LiBTbyB0aGUgb3Bwb3NpdGUgb2YgbWlncmF0aW9uOiBXaXRoIG1pZ3Jh
dGlvbiwgSSB3YW50IHRvDQo+IHByZXNlcnZlIHByZXZpb3VzIHN0YXRlLiBIZXJlLCB0aGUgbWFp
biBtb3RpdmF0aW9uIGlzIHRvIGdldCByaWQgb2YgYW55DQo+IHByZXZpb3VzIHN0YXRlIGV4Y2Vw
dCB0aGUgbmV3ICJzZWVkIiBmb3IgdGhlIHRhcmdldCBWTS4NCj4gDQo+IFRoZXJlIGFyZSAyIG1h
aW4gdXNlIGNhc2VzIGZvciB0aGlzOg0KPiANCj4gMSkgTWVhc3VyZW1lbnQgcHVyZWx5IGJhc2Vk
IG9uIGluaXRpYWwgbGF1bmNoIG1lYXN1cmVtZW50cy4gSWYgdGhlIGZ1bGwNCj4gT1MgaXMgaW5z
aWRlIGFuIGluaXRyYW1mcywgd2UgY2FuIHByb3ZpZGUgZmlybXdhcmUra2VybmVsK2luaXRyYW1m
cyBhcw0KPiAic2VlZCIuIFRoZSBDb0NvIGVudiB3b3VsZCBtZWFzdXJlIGV2ZXJ5dGhpbmcgYW5k
IEkgaGF2ZSBhbiBlYXN5IHBhdGggdG8NCj4gdmFsaWRhdGUgYXV0aGVudGljaXR5IG9mIG15IHRh
cmdldCBlbnZpcm9ubWVudC4gSSBhbHNvIGhhdmUgYW4gZWFzeSBwYXRoDQo+IHRvIHVwZGF0ZSB0
aGUgVk0gYW5kIHRoZW4gbWVhc3VyZSB3aXRob3V0IHJlcGxheWluZyBhbnkgZXZlbnQgbG9ncy4N
Cj4gDQo+IDIpIFVwZGF0ZSBTVlNNIChvciBzaW1pbGFyKS4gT2Z0ZW4gdG9kYXksIHlvdSB3YW50
IHRvIGltcGxlbWVudCBUUE1zIGFuZA0KPiBpbnNpZGUgYSBoaWdoZXIgcHJpdmlsZWdlZCBjb21w
b25lbnQgdGhhdCBpcyByZWFsbHkgcGFydCBvZiB0aGUgVk0uIFRvDQo+IHVwZGF0ZSBpdCwgeW91
IGNvdWxkIHVzZSBpbi1WTSBtZWNoYW5pc21zLCBidXQgdGhhdCBsZWF2ZXMgYSBwYXRoIHdoZXJl
DQo+IHlvdSBib290IHdpdGggYW4gb2xkIHZlcnNpb24gLT4gZXhwbG9pdCAtPiB1cGRhdGUgdG8g
dGhlIG5ldy4gSWYgd2UNCj4gY291bGQgInJlYm9vdCIva2V4ZWMgaW50byBhIG5ldyBTVlNNLCB3
ZSBjb3VsZCByZWFzb24gYWJvdXQgaXRzDQo+IGNvbmZpZGVudGlhbGl0eSB3aXRoIGEgMTAwJSBn
dWFyYW50ZWUuDQoNCkkgdGhpbmsgSSBhbSBzdGlsbCBjb25mdXNlZCBvbiB0aGUgcHJvYmxlbSBz
dGF0ZW1lbnQuIFlvdSBhcmUgc2F5aW5nIHRoYXQNCkNvQ28gY3VzdG9tZXJzIHNob3VsZCBiZSBh
YmxlIHRvIHVwZGF0ZSB0aGVpciBjb2NvIFZNcyAod2l0aCBTVlNNIG9yIHdpdGhvdXQpDQp3aXRo
b3V0IENTUCBpbnRlcnZlbnRpb24sIHdoaWNoIGZ1bGx5IG1ha2VzIHNlbnNlLiBCdXQgYXQgdGhl
IHNhbWUgdGltZQ0KeW91IHdhbnQgdG8gZG8gaXQgd2l0aG91dCBhIGNvY28gVk0gcmVib290ICh3
aGljaCBpcyB0aGUgZWFzaWVzdCB3YXkgb2YNCnNvbHZpbmcgdGhpcyB3aXRoIGV4aXN0aW5nIG1l
YW5zKSwgYnV0IHZpYSBzb21lIGtpbmQgb2YgZmFzdCBydW50aW1lIGtleGVjDQpvZiB0aGUgd2hv
bGUgbWFjaGluZT8gV2h5PyBJZiBjdXN0b21lciBpcyB1cGRhdGluZyBpdHMgY29jbyBWTSwgaXQg
c2hvdWxkDQpiZSBvayBmb3IgdGhlbSB0byBzYXZlIGRhdGEgYW5kIHRha2UgYSBmdWxsIHJlYm9v
dCwgd2h5IG5vdD8gIA0KSSBkbyBhZ3JlZSB0aGF0IHRoZXJlIGlzIGFub3RoZXIgcHJvYmxlbSBj
dXJyZW50bHkgd2l0aCB0aGUgZmFjdCBob3cgaGFyZA0KaXQgaXMgdG8gcmVhc29uIGFib3V0IHRo
ZSBzdGF0ZSBvZiB0aGUgZnVsbCBTVyBzdGFjayBvZiBDb0NvIFZNIChtYW55DQptZWFzdXJlbWVu
dHMsIG1hbnkgdXBkYXRlZCBjb21wb25lbnRzLCBsb25nIGV2ZW50IGxvZywgdGhpbmdzIHRoYXQN
Cm1pZ2h0IG5vdCBnZXQgbWVhc3VyZWQsIGV0Yy4pLCBidXQgaXQgc2VlbXMgYSBkaWZmZXJlbnQg
cHJvYmxlbSB0byB0aGUgDQpvbmUgeW91IGFyZSBzdGF0aW5nIG9yPyANCg0KQmVzdCBSZWdhcmRz
LA0KRWxlbmEuDQoNCg0KDQo+IA0KPiANCj4gQWxleA0KPiANCj4gDQo+IA0KPiANCj4gQW1hem9u
IFdlYiBTZXJ2aWNlcyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJIDQo+IEtyYXVzZW5z
dHIuIDM4DQo+IDEwMTE3IEJlcmxpbg0KPiBHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBT
Y2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzDQo+IEVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENo
YXJsb3R0ZW5idXJnIHVudGVyIEhSQiAyNTc3NjQgQg0KPiBTaXR6OiBCZXJsaW4NCj4gVXN0LUlE
OiBERSAzNjUgNTM4IDU5Nw0K
