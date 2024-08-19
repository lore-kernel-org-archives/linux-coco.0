Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344C1171CD
	for <linux-coco@lists.linux.dev>; Mon, 19 Aug 2024 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724046877; cv=fail; b=i/L6diOFEwHZ39AR9nmVbOFHYbW+7r8es72ykG9yo5lfgYbl+UpCmZExtcaxhky97sMBIIKIbFYAcZNImChyHFXjiG4mUJtEa/3h8CxyQ9GU8a3il6Xk9fb/OUqQO2fkqhqI4kdxjJlrxXGaEkiZZ+L3WqHfYLwdWLcXV98N+s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724046877; c=relaxed/simple;
	bh=uMEwEaFAeH2CxRCd3msxezZkgEggFHGDoFzxDYeE+Bk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SWlLGjcISW6+oeISlhME4NbaMv57Is9cTLPzHDUIiVfKPOb+oi7Ta8oHSDVs8lIUlZjQMN6P/b9B5F4ztfZk6vsp9Rk0Lhbd9htknhrP04XUD8pTEZz1l/QIySBWZZmo+jjZ1Jlo9jIWVxuCZcKeLjqbxABy56rtdEjUL3R+IU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PhAY9GoS; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PhAY9GoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724046875; x=1755582875;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uMEwEaFAeH2CxRCd3msxezZkgEggFHGDoFzxDYeE+Bk=;
  b=PhAY9GoS6SGTV/SzKLjDgxK5c6tL4gETGpBdUBsp4LSzMXOJRKW0sTDM
   QJL4I+YwxDUWrrOFXxGiqbanigBykggoq7pWaO+BhJHhwgq0BKvWtJEas
   SwLTiwxAtnMiXiLfmWEddg50p2Em2AcXUyU8LrdkvvCWCVf9+Y65z84V7
   NTJrePrPazLfqhw/jMWHqeamv1bx9lSvHuGLMY5MGycBDIEs3u3VDj99r
   4XIqlqYlsl0vSHHIF9Fp4vnaNaA8Gb5hiPSyh1iWaCTL6ZwiBJ1FKX0VN
   5QGWPKlY1+96bZXPaeFEGK27KQoTe8qGmt5bLGvoz0vZCmA5F+dL6HYD5
   A==;
X-CSE-ConnectionGUID: qIQrqx29RXWMBrHwHkFPFQ==
X-CSE-MsgGUID: y8PteQLeRHSyqfINZqa/HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22416972"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22416972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 22:54:35 -0700
X-CSE-ConnectionGUID: HATRNslESteZ3bzHCmY92g==
X-CSE-MsgGUID: 6WNDlIuLSzORg1BDE9I1Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="65237298"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Aug 2024 22:54:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:54:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:54:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:54:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:54:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiVv0OuHomB6kZmT4Gm+bXPOWurwpxTBCyo5M1x43TxvBswSQTLTWfoSqPTkv6sM9vHylxye364P5ZapuEQN2hWzXMuHceZHPNXYHPz//R8IwJOTs4vVF3D15kRcpCs7SkApmGzqs9KMtWZQM/r1LZxBneP4es96tGgEzS6rrbuIs0CrL0E1tmsYiL97pqQXo11ftFczM9aV+1rSBg77k7O2hFw97Yv6N5SXJ+RrZ6eahfc/aTL2Y0GxsmvVIc3/5g3LqnEwAZqzGhPw5cJDQNe3bcMzonDKrX5+UIv24sC2XaqbGA8NHRT7IuHBszeXvSY8pCtMLBuDZdhxousuCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMEwEaFAeH2CxRCd3msxezZkgEggFHGDoFzxDYeE+Bk=;
 b=iwb902gR99FYiAjHmh95MWQgqoFqPZaWCjZgvWUvBxg2MZW4UXFyUSrYV3l+mamSza8jtlm5ZCDvkgzFpv8YSkLe+gTsxzWNF2Sawn5AlREkRkZOWjKoSPVUDzBGQWy9wng5KM5fwFExcj5MPqJxcSQ3C1O3il4nQnIsUmz3osnM8/Cuk65mCFd3uedLHTus/29omzvQcDh3QdbCO8Z0Z4sJ6M3G8WungAsG8ENYdFQfqu9SpTkO/LbF/yrD0r1TNHfo2TGHBzO2yAHkC0o1Z+UCMnn6yUP6Si26N/dC9OJQpZpNJlOeOZM79+WGTJQD6Ft0KE46S06D9N9ZbIOQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 05:54:30 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 05:54:30 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
CC: "Reshetova, Elena" <elena.reshetova@intel.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
	"jroedel@suse.com" <jroedel@suse.com>, "Nakajima, Jun"
	<jun.nakajima@intel.com>, "jpiotrowski@linux.microsoft.com"
	<jpiotrowski@linux.microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "Lange, Jon"
	<jlange@microsoft.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Johnson, Simon P" <simon.p.johnson@intel.com>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDwgAEez4CAAKutAIAABwuAgAOj6gCAAFszgIABHNoAgAB9xYCAAAkjgIABP8+AgAAOvQCAAD5zgIANU5FggADT8ICABAjeQA==
Date: Mon, 19 Aug 2024 05:54:30 +0000
Message-ID: <MW4PR11MB587202ED87AB440ABCB9C46C8C8C2@MW4PR11MB5872.namprd11.prod.outlook.com>
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
 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com>
 <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
 <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
 <DM8PR11MB575007C975ABEFED36C8D027E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <MW4PR11MB5872C42AA225F66AC0F845928C812@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAAH4kHYSf_jEKV6uFVBViCYtpLYCXe0S_zF6=+NHzeFRKc+g-Q@mail.gmail.com>
In-Reply-To: <CAAH4kHYSf_jEKV6uFVBViCYtpLYCXe0S_zF6=+NHzeFRKc+g-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|DM4PR11MB6019:EE_
x-ms-office365-filtering-correlation-id: 730da54c-753c-4432-12f3-08dcc01364a8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y0tyUVdtdTBubGh5TzNWRFJnbHoySkNEdldwZkd5bWRyVmY2WXFCKzE4eXBS?=
 =?utf-8?B?MWhISXBSTlBrenBXVG1VRmJxaHFhZUFJYmwySFVMN01xRVNOL0dycXE4L3lM?=
 =?utf-8?B?WHMyOWQ4UlZqYmN6bzlFYTZPTm1qa3FhY1ViNHNuRFUvMWlZWFA5aDNjc1Fl?=
 =?utf-8?B?ZXdrOWJsUkppRkQrelBzcGVpamZ3QTlXMnQvYVZRUXhYKzRDT0VCV01oYlVt?=
 =?utf-8?B?OVJWT3BlcWMwdE9BUGxZalg0eHZLaG5DTWRhUWVxMmFpUmNkSXBOMkVHb3Uv?=
 =?utf-8?B?NEVwZ2FjRkM3eFFxSFdsaS9SNDhpd29leUI1eVEwSDBiZG56alNVWlNpaUhi?=
 =?utf-8?B?U3FoRldnSXNRRkVUclhnUkNGNnVpR0d1V0lUaXFla3BVREp0bFZscXUrdCsz?=
 =?utf-8?B?OUFzTmw3a0tBZFBnb0VGQzNIV1R5UnJiWEtzdzEwdDRqUlk2Vkx1MnUwWkcv?=
 =?utf-8?B?Q001OGV4RVU0ZmlXRG1xc2krQ05aRUdXVHBZdXVJZk9kNnk0QkFpZFJ1UFNR?=
 =?utf-8?B?dHF2ZlE2TTF3S3p3TWxjN1VMS2toOEpkN0R6ZFpVZ3A0T0RRZHpQb0ZTK0d1?=
 =?utf-8?B?dHVIdlBUOXpoTDloVGlDT00wSnY3MTJEZGlMdDR2N0tUQzJSZlB6TWc3cFNL?=
 =?utf-8?B?ZTk2Yk5jeE1vSkl6QnFNeldDWjBLM295K3MrcHQ3eFdaRGZtWldIbnV6Qnl6?=
 =?utf-8?B?VW9oWHpPbFlFSTNGUEVST1p6VU4wRGowT1ZwV3AvZlo3elp4RWltRXVwanJB?=
 =?utf-8?B?dm1YaUg1S3JxaDNjVG0yZ0pYYW1NVFJCMGxJQVBPTTFuK2Y5dENtOW1NYkhC?=
 =?utf-8?B?d0NCcFFhODRJRU5sTFpZSHBXRVpxK0l4cExCeGNIRVEvWXRIR0J1MHAvVkF0?=
 =?utf-8?B?SG5lUGxuUUxRNE9IdVBNUHpnaUhla0ZyVFRTL0REaFRUbzZ4LzV0R1AyZDhx?=
 =?utf-8?B?M0JXZlNMWFB3cXgyaFRlZTY0OG9ZK092d1oyVW94bHVyZHdJQlkxeUhIVkda?=
 =?utf-8?B?aHd6ZnpNSjI1Z2ZLNW9hNkwvRWNzS09oOFg2SmFKRmhBYzQ3Qm1FNmFiWmkr?=
 =?utf-8?B?YnY2eWJhOVVTa0U3bkY3WUxFRTZHSk56RFVndmIvWktJS0tTRkpMaDBjQjNM?=
 =?utf-8?B?QmJVMCtnRlBXZzN0TTh2S0VCc3htTWZNbWllNk82SmpUcFZUMUM3UFo5bWFt?=
 =?utf-8?B?SGVRVnRYTTRCcEo5Wko3QkUyOWJoL3ZaeGtoQ254NkZEbTNYN1lEbUkvRkZt?=
 =?utf-8?B?UVpaNng3YlZGd1A2UXpYTGg5cXVkOENoeFVaWnpiVHhkQUF3K2lOSDVMcFlP?=
 =?utf-8?B?UHM4WmhqUnpZaUdkdmltbFlTM0JIVWE2Q3o1L0puS0RzbjNhTFJFdWxYTmpG?=
 =?utf-8?B?QVBKTkk2anZ6eXJRM21NR1E3SnV6OURkaHMvMzErM0JCTGZMdkNTZkRLZEkz?=
 =?utf-8?B?VmNWMEJIWXAyUFB1Z05RbitCZ3R6RzJyMHlGT3lzQVNWL2xJL1VHd1g5cHpw?=
 =?utf-8?B?ak1YcXc1bC8yVHpMYWwrelJzbGlzTFpHaDJsQW5GakJEaHVuQTVSOEpxcTV3?=
 =?utf-8?B?d0cwVXVjYm1qbG5NdzJ5RUZVWHgyVkZuWFNGV29lREZnSFp4YVdkTC93MHhX?=
 =?utf-8?B?VDhFWDh6Y1loQ251R3pWc2JReDluY3dMR2JXWXFhTGE2d2Z0eVhGNmJMSk5B?=
 =?utf-8?B?SFVEYlVDQjVqdzBkNmwrY1JjRS9LdktzTFh4Vi9BWW1hK0lMOEhwLy9nZkFI?=
 =?utf-8?B?YU5MVVp4QmFRNmFOTWxWelQ4UVZ5UHUxOFg1VGp4L0o4ZnpaeHRwRHViTnBm?=
 =?utf-8?B?Ky9WUjNxTm9FN1FqVlFjZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ujlud1NVL3NLQXozclF4aXZROEtXVjJBODV0RHR3bm1yM2JoMk1yTXJrMzZj?=
 =?utf-8?B?UTlmT1lxUHhNYThLVDd6REpzWUo5aXYvbDh2UC9OMEZ5a3FKNXRIUThjNzVj?=
 =?utf-8?B?TmxQN2FOUHlNWXZJdjVwc3IvTjk5L20zZHhES1Q0SE1QSGlLNGowT2ZKRGVZ?=
 =?utf-8?B?ZFkvSk4wZmUrV09NMW5EUTBvODQwdDRvOHNYQ0hRRkVJaE1CbURaQ0s5My9Z?=
 =?utf-8?B?S0RPL0dvQkwzTElqd29ZSkNCQ1JsVkluckRJa0Q1UWYyNm1pR1BmWGNwb1Av?=
 =?utf-8?B?KzErTU9leWIwcTRZcXl0ME9JUDB1Qm1vcjhxL1YwanQvM2c4QXg3UW1uTmM3?=
 =?utf-8?B?MC9HaUkrbDAvR3VqeXd4c3M4MG4vOCtDeXEyRitPY1NrclYxMlJTaHQ5NnVj?=
 =?utf-8?B?NXJIQ0xOa051SnFxaHR0RGxtRFVycTBzaHhPZ2VuZ1ppamYxRUJmaEpaK3BW?=
 =?utf-8?B?OFVKSGpEOGNFY3VKbHFWeXNJM3NqSVlEdjh0UFBwUFRqc0E5YklrWjEveUZ1?=
 =?utf-8?B?RGo1TDQwNTEyRHd2ZHd0aitGM29WaE1CU3ozSUpVY3BEb2ZTWVNKSzAxYi84?=
 =?utf-8?B?T1J3Q2lpd0N2bHd6MUJLbjVrbCtqUjB4VEpNZ25CL3J3cFlEM2FSYTJndGcr?=
 =?utf-8?B?UVRFaTE1dm9pRnBZbFpMU2hWTW9yOVlCUU0zeVFUdHk1aVBlN3hGdmR1L2dC?=
 =?utf-8?B?YkRTWTUrYTRsb2c1S1MzVGtxclBlWmFDQ0dNTy9TSHpTU1hIaDdRVkw1SThm?=
 =?utf-8?B?ZU9YVjhBSmZmRW9VWmx6YmMrRUozaGNzRkFBNEJ4dkY1eVMvbEJRZGdnREIx?=
 =?utf-8?B?RnZjM3hmRUxkeFRRb29PMkEzTDk2dmVraWs0SVg4VWI5cnlITGlsSEVaNGp4?=
 =?utf-8?B?Y1BTeDJRSW9Bb1h1b0E2QS9KcnczM1NIQkw1b3h2Skk2N0R4RkdZK3M0YkZu?=
 =?utf-8?B?dW0xakVpU1luaXBoZi9TRFNXWEZNWUI2dmtLaitBWXJTSnRtNnd6WmJYQmZC?=
 =?utf-8?B?alNEblNLc2gwL3ZYOHRZWTRxZFhueG5WVVcvWmQyd3d6LzA4OTMxUUI4T1dB?=
 =?utf-8?B?OGY1c2I0VmNyMUtXZ3dUaFFjcDRvbXl0eVRaZ0N0RnRKMktMUkNiaHl3OXY4?=
 =?utf-8?B?TDBrRGM4ZktFbEcrYUdETUVsMzUyMi9mR3Q1ZzV3MlIzZVNHcGZZVDE2a09U?=
 =?utf-8?B?eGl3T3JULzhFdUlvODJQdWg0ZHhaNWtBL3pibzlEZXdQNFBmVHA2ekw0ZlRZ?=
 =?utf-8?B?Z1M5WG5rQ2pzUkJWWGhPeFAyRWJjODBZaklBQnB2cmZ0Tll2ZjRyTFZFYVJw?=
 =?utf-8?B?R3F5L2t3Z205ZzVUZTFJd2Vtb1RvZkUwNmZqSGZUVWhIK1E3Rllxa3l4UEVn?=
 =?utf-8?B?TW1NUy9hUkhEVU96OUw2QTRsV2pHa3JYdCsrTXlSZCsveEtGSGpXNTNrWC9r?=
 =?utf-8?B?ZE1kS1d1dU4xVEtlWjBTdHZuWDFMWVA1aTZEQUd0a0JCVDh2bTRjbjhHdi9I?=
 =?utf-8?B?K3QvejgvSExjU1pjUjVIN0dBaUlkYTJLSTVwSVlMNUU1dGJUVjRPT0FhYy9U?=
 =?utf-8?B?OGVrWmp3elArbjBETnl0MHRyT2tianZ3aEhQU2JrVitDKzRZTS9lWGlkV25v?=
 =?utf-8?B?V3NiMDJvUHVVTzZlTlNNeFMyMnpYVzVFZmJWeUt4YTFUMGpwclYxaDdUZHEr?=
 =?utf-8?B?clZJM0Q1dUlpeFovZTJvbWxGa3NyZERLWFJnYmU1Z2x0Wklqd29CbnlWbVhk?=
 =?utf-8?B?Y2JrdUU3aGlsKytWTThvbld1SGRrbGxEeWZkcXlhUHVUMzNudnNWOHh5MzBH?=
 =?utf-8?B?NWdOQlpLR1dKajJ4U1V4c0RucTFlWVZNblBXMHQ2UWNWWGlrc0lZZVpFTGl2?=
 =?utf-8?B?SU55aXVaRWtjNUtlWUZnWktnY0U2Qkx4MlNWZ1dJRjRIUzhXZmF4NkIzTnZp?=
 =?utf-8?B?TUFjUXplSnQ4ZENQSFJoK3c4MDZBUjF2TFN2YjNIOXVLMFQ3dm85bTFBdE1Z?=
 =?utf-8?B?cGl6SGFLOExXTWh1enRBQkI3OHhQVFpvMnJzVlJna3Z4cHg0M0R0YXkrUHFN?=
 =?utf-8?B?NHRoU09wTzRJQ1hTVys0SkVmVlZpZ3I2aGZQL2hMYldJZHpjNUxocndMeDhV?=
 =?utf-8?Q?K7fhzeY+rNudthLwfLYD/7oQk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730da54c-753c-4432-12f3-08dcc01364a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:54:30.5006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZ5Na6DLA0hrWcGkjmDYzbHNiDbHZRr2ojAWu/Jxon+IjWRNdlhGkKRsSPYgeq3/5KlXgFEh23H8SUr0UT4Jbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com

VGhhbmtzIGZvciB0aGUgc2hhcmluZyBEaW9ubmEuDQoNCkkgYW0gcmVhZGluZyB0aGUgZWFybHkg
YXR0ZXN0YXRpb24gZG9jIGFuZCB0cnlpbmcgdG8gcHV0IHNvbWUgY29tbWVudCB0aGVyZS4NCg0K
VGhhbmsgeW91DQpZYW8sIEppZXdlbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IERpb25uYSBBbWFsaWUgR2xhemUgPGRpb25uYWdsYXplQGdvb2dsZS5jb20+DQo+IFNl
bnQ6IFNhdHVyZGF5LCBBdWd1c3QgMTcsIDIwMjQgMTI6MTQgQU0NCj4gVG86IFlhbywgSmlld2Vu
IDxqaWV3ZW4ueWFvQGludGVsLmNvbT4NCj4gQ2M6IFJlc2hldG92YSwgRWxlbmEgPGVsZW5hLnJl
c2hldG92YUBpbnRlbC5jb20+OyBKYW1lcyBCb3R0b21sZXkNCj4gPEphbWVzLkJvdHRvbWxleUBo
YW5zZW5wYXJ0bmVyc2hpcC5jb20+OyBDbGF1ZGlvIFNpcXVlaXJhIGRlIENhcnZhbGhvDQo+IDxj
Y2xhdWRpb0BpYm0uY29tPjsgamVqYkBsaW51eC5pYm0uY29tOyBqcm9lZGVsQHN1c2UuY29tOyBO
YWthamltYSwgSnVuDQo+IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsganBpb3Ryb3dza2lAbGlu
dXgubWljcm9zb2Z0LmNvbTsgRG9uZywgRWRkaWUNCj4gPGVkZGllLmRvbmdAaW50ZWwuY29tPjsg
UGVyZXosIFJvbmFsZCA8cm9uYWxkLnBlcmV6QGludGVsLmNvbT47IExhbmdlLCBKb24NCj4gPGps
YW5nZUBtaWNyb3NvZnQuY29tPjsgbGludXgtY29jb0BsaXN0cy5saW51eC5kZXY7IEpvaG5zb24s
IFNpbW9uIFANCj4gPHNpbW9uLnAuam9obnNvbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBD
b2NvbnV0LVNWU00gLSB2VFBNIHN1cHBvcnQgZm9yIEludGVsIFREIFBhcnRpdGlvbmluZw0KPiAN
Cj4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgODozOOKAr1BNIFlhbywgSmlld2VuIDxqaWV3ZW4u
eWFvQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBZZXMsIGN1cnJlbnQgaW50ZWwgVERQIHZU
UE0gZGVzaWduIG9ubHkgY292ZXJzIGVwaGVtZXJhbCB2VFBNIHNvbHV0aW9uLiBJdCBpcyBhDQo+
IGtub3duIGxpbWl0YXRpb24uDQo+ID4NCj4gPiBJIHJlbWVtYmVyIHdlIGhhdmUgZGlzY3Vzc2Vk
IHBlcnNpc3RlbnQgdlRQTSBiZWZvcmUsIGJ1dCB3ZSBkZWZlciBpdCBiZWNhdXNlDQo+IG9mIGNv
bXBsZXhpdHkuDQo+ID4NCj4gPiBJcyB0aGVyZSBhIGZ1bGwgcGVyc2lzdGVudCB2VFBNIGRlc2ln
biByZWFkeSBpbiBjb2NvbnV0LXN2c20gbm93PyBFLmcuIGhvdyB0bw0KPiBwcm90ZWN0IHRoZSB2
VFBNIHBlcnNpc3RlbnQgTlZTPw0KPiA+DQo+ID4NCj4gDQo+IFRoZSBkZXNpZ24gaXMgb25nb2lu
ZyBpbiB0aGUgZWFybHkgYXR0ZXN0YXRpb24gZG9jdW1lbnQgWzFdLiBJDQo+IGhvbmVzdGx5IGRv
bid0IHRoaW5rIGl0IGNhbiBmdWxseSBwcm90ZWN0IG11dGFibGUgTlZTIHdpdGhvdXQNCj4gc2ln
bmlmaWNhbnQgVENCIGluY3JlYXNlIHNpbmNlIGF2b2lkaW5nIG1vbm90b25pYyBjb3VudGVyIGR1
cGxpY2F0aW9uDQo+IGFuZCByb2xsYmFjayBpcyBoYXJkLiBXZSBjYW4gY2VydGFpbmx5IHBlcnNp
c3QgYW4gRUsgYW5kIFNSSyBvbiBmaXJzdA0KPiBib290IGFuZCBwcm92aXNpb24gYSBzZWFsaW5n
IGtleSBmb3IgdGhlIE5WUyB0aGF0J3MgcmVsZWFzZWQgd2l0aA0KPiBlYXJseSBhdHRlc3RhdGlv
biwgYnV0IHRoYXQgYnV5cyB5b3UuLi4gbGl0ZXJhbGx5IG5vdGhpbmc/IG92ZXIgdGhlDQo+IGV2
VFBNIHNvbHV0aW9uIG9mIGluc3RlYWQgcmVsZWFzaW5nIHRoZSBwZXJzaXN0ZW50IFNSSyB0byB0
aGUgZXZUUE0gb24NCj4gYm9vdCB3aXRoIGVhcmx5IGF0dGVzdGF0aW9uLiBUaGUgRUsgd291bGQg
bWVhbiBhICJwZXJzaXN0ZW50DQo+IGlkZW50aXR5IiwgYnV0IHRoZSB3YXkgdGhhdCB5b3UgbmFt
ZSB0aGUga2V5IHRvIHJlbGVhc2UgaXMgc3RpbGwgZ29pbmcNCj4gdG8gYmUgYSBwbGF0Zm9ybS1j
b250cm9sbGVkIGFzcGVjdC4gWW91IGNhbid0IGF2b2lkIGl0LiBTbyBqdXN0IGFsbG93DQo+IHlv
dXIgcGxhdGZvcm0gdG8gc2lnbiBhbiBlcGhlbWVyYWwgRUtwdWIgY2VydCB3aXRoIHg1MDkgZXh0
ZW5zaW9ucw0KPiB0aGF0IGluY2x1ZGUgcGxhdGZvcm0gaWRlbnRpdHkgaW5mb3JtYXRpb24uIFRo
YXQncyBtb3JlIHZhbHVhYmxlLA0KPiBzaW5jZSB0aGVuIHlvdSBoYXZlIGEgcGVyc2lzdGVudCBp
ZGVudGl0eSB0aGF0IGlzIGJhY2tlZCBieSBhDQo+IHBsYXRmb3JtLWhlbGQgc2VjcmV0Lg0KPiAN
Cj4gVGhlIEVLcHViIGNlcnQgaXMgZXhwZWN0ZWQgdG8gYmUgInNpZ25lZCIgYnkgdGhlIGhhcmR3
YXJlIGF0dGVzdGF0aW9uDQo+IHRvIHRpZSBpdCBiYWNrIHRvIHRoZSBURUUsIHNvIEknbSBub3Qg
c3VyZSBldmVuIHBlcnNpc3RpbmcgdGhlIEVLIGlzDQo+IGdvb2QgZnJvbSBhIHNlY3VyaXR5IHBl
cnNwZWN0aXZlIHNpbmNlIHRoZSBjZXJ0aWZpY2F0ZSB3b3VsZCBoYXZlIGENCj4gcmVhbGx5IG9s
ZCBxdW90ZSB3aXRoIG5vIHdheSB0byBjaGFsbGVuZ2UgaXQgYWdhaW4uIEl0IG1pZ2h0IG5vdCBi
ZQ0KPiBiZXN0IHByYWN0aWNlIHRvIG1ha2UgYW4gZXBoZW1lcmFsIEVLcHViIGNlcnQgdW5jaGFs
bGVuZ2FibGUsIGJ1dCBhdA0KPiBsZWFzdCB3ZSBjYW4ndCBmaW5kIGEgZmxhdyBpbiBpdC4NCj4g
DQo+IEFsbCB0aGlzIHNhaWQsIEkgdGhpbmsgZWFybHkgYXR0ZXN0YXRpb24gcmVsZWFzaW5nIHNv
bWUga2luZCBvZiBrZXkgdG8NCj4gZ2V0IGFjY2VzcyB0byBzb21lIGVuY3J5cHRlZCBwZXJzaXN0
ZWQgYmxvYiBpcyBhIGNvbW1vbiBuZWVkIGJldHdlZW4NCj4gZXZUUE0gZnVsbCBkaXNrIGVuY3J5
cHRpb24gc3VwcG9ydCBhbmQgcGVyc2lzdGVudCB2VFBNLiBXZSBjYW4gZXhlY3V0ZQ0KPiB0b3dh
cmRzIGEgc3RhbmRhcmQgcHN0b3JlIHZpcnR1YWwgZGV2aWNlICh2aXJ0aW8tYmxrPykgdG8gaW1w
b3J0IGENCj4gc2VhbGVkIGJsb2IsIGFuZCBhIHN0YW5kYXJkIG5ldHdvcmsgcHJveHkgZGV2aWNl
ICh2aXJ0aW8tdnNvY2s/KSB0bw0KPiBpbXBvcnQgYSB3cmFwcGVkIFNSSyBmcm9tIGEga2V5IG1h
bmFnZW1lbnQgc2VydmljZSB0aGF0IGhhcyBhbg0KPiBhdHRlc3RhdGlvbiB2ZXJpZmljYXRpb24g
cG9saWN5IHByb3RlY3RpbmcgcmVsZWFzZS4NCj4gDQo+IFsxXQ0KPiBodHRwczovL2RvY3MuZ29v
Z2xlLmNvbS9kb2N1bWVudC9kLzExWnN4UDhqc3ZpUDNkZHA5SHJuMHJmNmludHROd19QYm56MHBz
DQo+IFhseGxQcy9lZGl0I2hlYWRpbmc9aC43anZwc3E1aWxseWQNCj4gDQo+IC0tDQo+IC1EaW9u
bmEgR2xhemUsIFBoRCwgQ0lTU1AsIENDU1AgKHNoZS9oZXIpDQo=
