Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34D948AE20
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963202; cv=fail; b=jKrVU4cJukbpMDqceMSHD/Q86nnFruy7EEDfRlEDTToZVBOmkPlyw5aUJd29ZvL2WeRC+nx6PSFk7LFrVJkHSp7czlLz9uo5wkHpZsFy0eQHVdmm5ibDt91lOI1nSgQGTxKXtenWQylsdet9ygjsKh231IapmVlHTvv4lSh1YlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963202; c=relaxed/simple;
	bh=kYH/dDyP5QPimYX6RPMhG4rgdz4BozcCupCnp5qzRNM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hN4KDw7eu646+UdFzPwD5VyNsdC43KPzwpRBDZXoD01x6E6sxUc3JsWV6UoRe70w26PEZo8pFjU1VOHRkWNhQwheHq3WD+9OqFdjP/WpOFDxmnJXzQk+2GRSdCqCCmL/HE523SOQnc2DkFXuS0vH1YsJBPa1THdh/jgmD2bl5v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cx1vRWLk; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cx1vRWLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791963197; x=1823499197;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kYH/dDyP5QPimYX6RPMhG4rgdz4BozcCupCnp5qzRNM=;
  b=Cx1vRWLknfM7Cqhl6lsZZYMDW/d+T0THSRD2QGo2a230qZRaNh8alZsR
   JfW6WGuxTFmiMVj3UGOKP3EX/FqJVx7HMaqJXoohx0p2pO0kzBGXEMhbh
   +45DAQXZjU3AcXj6KQ9fxQk9rkjEhVS3KrbFuGiAkY83Px0A7kbSZsjDb
   NVWw/XifZHmMnbkSGz3lvcbmLEseCK1sMhhAxqGrc16bKIP50P9Gzhw77
   5CLA++sGOnpwFBcHQf/QVgyGfBFsm5duQzfCVTXNKfg71P2v24z/I024D
   B9nnaCyXHbFoS+/icfhDNQ9HZGYnRAwo5xHR40xU5+FP5yJmp2odAsHGm
   A==;
X-CSE-ConnectionGUID: Kzg3yKL4QFCjrgo1Lainzg==
X-CSE-MsgGUID: 1cEQvzwuSF2HMs7eAAi4DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="602889"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="602889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:33:16 -0700
X-CSE-ConnectionGUID: 5aD0rNA1TdWzb+rZ1x9QVw==
X-CSE-MsgGUID: IW7y+zsETcOSOggaRm2yVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1335887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:33:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:33:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 00:33:15 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBh0HRCpCa181S2G87ieOvHgDDICJf9njdrOH7EtLufg7ovnhwhw48FkkYVOIn4tOicVZVdHF3EqL35yMKmoPfshbqf/MGCTGw5KInqp2OURmzk0hAtD4oliU4aQzzUdTciGGG2DcjsW9khfL4pClggk33E93HvlQ2avCufpxB8fMEBESAqy5XzOtjS4QI8FAW3WMWTaZdFh4hYPgItx/2vPCbPl9A2V5J+K0mWP2e4lGWw+KgzjCWWktiMt1ylbL+6/y9y3YuiLUHm6PlyAcXF5Tl9so/NMbHuxZjV3KsgUQPZ6Gy8BNv4BC78ColrO0QGX4pqnpAYh7xHHtSzXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYH/dDyP5QPimYX6RPMhG4rgdz4BozcCupCnp5qzRNM=;
 b=agP8xRH/7l8sKEjwgwkcEy68CCocQEiOKshRxUql1iBwysqg8J4tNC9jzsI3YyhFSMbgvpoJ4sYkey3+FKPRgMklWn9+ejbfcJ7+evvV3dD/zB/YrI2eY6uJ8qWuvot03GPdfT/ANsvByvRPveRIjlMLP8SZGujrwWFCYnhOK274w7jLj9QJ/kXAZ/XacyEMDQsKxVjHT1wFR2T1Gy3ErGDs015QOjFAB95X4sz3+smNyvWyTkYfqlIXX9jScGsaOCPlCX4Xa10AVczkl199pUlwRcjCp+YtmNLhXUSNhs8qKsBOFb8j6oc9u3nCiaoJgGZaTkQYKVOXDfD6RM6WOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 07:33:12 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 07:33:12 +0000
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rb7f+SAgADtsWCAAEYrAIAAD4QQ
Date: Wed, 14 Oct 2026 07:33:11 +0000
Message-ID: <IA3PR11MB91365402E40953E928008DA6929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <00a4b474-eb13-4caa-90c6-b9cabb1ec621@suse.com>
 <IA3PR11MB9136F32FBA9D830C48EBA968929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <2b73666e-d923-4042-b719-b9bdeca783c8@suse.com>
In-Reply-To: <2b73666e-d923-4042-b719-b9bdeca783c8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|DM3PR11MB8716:EE_
x-ms-office365-filtering-correlation-id: a126d065-b698-4f3e-5f0d-08df29c566d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|11063799006|38070700021|56012099006|4143699003|261009223027099003|22082099003|10067099003|18002099003|3023799007;
x-microsoft-antispam-message-info: Wx1CPI0X22/TGjISxHV57saWp8RMoa6Gt2EWcZz3ZEY3CSVxZewnIz1yYxcG/+9pz6xU3euzCHt91DzhtiRTRk7gDuc8Wm/j16TJrDAmDgKITHvJBVgVM6P8o+4WrYBVAJxsI9ErkgA+46PeI8llcyZVp8xE5oQSJJO0s+kE6YcsmEG8XEwuyveB9v67jLGSvvyk3K4/2QxTRP+pfwWYBt377gxcoBfozs6AAQkJt/b5iq66u0kyhnik5lHRdxdHyoZeKDBNNlW84K2nUrg6DJ8YJuJC74qwxdCf7AUpx1fkKj6iel1Bl7db2TJBWfDqbP4ZStkphuRJ6oVbVfjW/NZa8D/q/NmnsWgbMUX6hy+5PYDAtIZ7qtbAoO5ysMPOmAVwYwT0vtMLT5FoOmPXxCVb95daPRlbPK4k075GBpac4b30CIs0FKgHiqJ+VH2skwyJ8Rz1vBvTOOcd5+18XhtPyXaoT8Sbj5Z3vepzMrSlFEvEFoEE03O1VFUo2O/jTJgPUw9HRWS6KvkZI0rldyQwQ6bEK/Q9WRxOVezzDTiFJVTjox7rQDOQokkXz78EPZe/dSE7pN9Gki7kfwbtd8CWfwT7whh4x6Yb8Npq4Lo3C/WAj38yxhk0w8M2oK2Nd8SY5y0I4Av17r+DtvFl5swSobT6H/6ijChWx4uPdnUOtomL4z+18Ccl11Cx8e9xwmb0Rmvt6RNstZjBLM4eY5fC1XirVikqElHNfev9Bok=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(11063799006)(38070700021)(56012099006)(4143699003)(261009223027099003)(22082099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThkZ3E0Y0dxYXVaOE40NUJIZkRUMkxCcnd6Z2ptWkx2VnZ4WUJ2OFVUVW1F?=
 =?utf-8?B?VkJtZVB6TnBzSnMvMGZSdXlJMXZPOFZadEtSSFVxTnVFTkc2WU5Mc3RaUU9l?=
 =?utf-8?B?dXhCcCthV3NPMXlSVWdIZXJ5bkVMWXN4bERxQkU0TWh6ZmE2Z3RQK0lDcVNG?=
 =?utf-8?B?ZXdxcUZaRUsrRXZRaTBPMjhSN2NMbGdSd09mTnZOR2RGMnBGbjRYbzlSMEFm?=
 =?utf-8?B?dmxkNWZzeE9GcGx5dmVETHlNNW1Fc3k2clR2T2tmZUFXbis4cTNKOUREbW9L?=
 =?utf-8?B?d2xLY0w5MW1nb0dvdEplRjhRL1RESk10ZHFseFN1Q2h1ajFGMTJlQ2FBdEw0?=
 =?utf-8?B?Q2dyTXg2RGk3dFdKTDcwK2RpcWh6bFlZZmhpVTB6VnBQS3FZSmVZcnZkMDJH?=
 =?utf-8?B?b2dRU3lMaExPT0N5bWRwWmdTQjhLZmdtT2NCME5xdVNlR0JyU1ZwbXQrM2Vu?=
 =?utf-8?B?MXRyRTMwNDQ0c0ZEazhUS0hHaWlsUmM1cmN6VGNhWWZ1VXlwYmRDanNXOGRE?=
 =?utf-8?B?aCt1Nm5pY3BNcXdTZjB2eHBaRzNPN21KWTRrWXVNU2Q2Q2Y1UjNtVWI1QzV4?=
 =?utf-8?B?TEUyaFVDL0o0RC9sREF0NzFSMXVpbmFHMEV0bVVCc243ZHlQcnA0a05GSU9y?=
 =?utf-8?B?R3cxRFZSY3hzRUczYk5DR1RVUSt4dnB2N1BIWHFFalNPSU4xUG9qaGdRNm5J?=
 =?utf-8?B?UXdJTExMaHM2Wk5xbStta2dPRFlCdlFaSmZ4dWd6RHhMV0dQY1ZkVDdBblFW?=
 =?utf-8?B?Q0ZUVWN3UjZxYlNjMjN5Q0VtZ09wd3FCeXRjeGZWSFYvRWswYkVSTWUvV1Z5?=
 =?utf-8?B?VUVYdHZzWFBZMUZYY3pQZmR0aWl4YVJiOXkwRDFOZFF6NEhVYkNpYlZxNU1h?=
 =?utf-8?B?U2h4Y0wyMldnVFg0UWQrWnhuQkJqT2VKbnhrY2RXVWY5ZkJkVEtLanhZaVhk?=
 =?utf-8?B?MUIrUUNGZWVMWTVCSmhvYzVxbUJhQUVtOTVzUnl2WXdwTUtYdWQ3bmtoaUE4?=
 =?utf-8?B?ay9XWmNGMHNuSFl6MkhFNCtJUkpDZVQxeGVpeHlIL3FsRUFyek5UM1V5NnBr?=
 =?utf-8?B?MG9qNnFnZUJ4T1RuSG1mODVyWHViVFplNW93cmtYenVhUG9sUUNMQWxnWVA1?=
 =?utf-8?B?cmc3WlUzZHp2Q1V2Zkpiak5nUUxIUHFEdzlUWmdlSVVyakhUejNxajc4WFBy?=
 =?utf-8?B?cHE2MnNTamxhYnkvU2dSSDV1c2VZZjZRWDBLOTU0WGczSEt5cWphUDFJVTVq?=
 =?utf-8?B?a3l6YmVHdUw0RzNDY3NuQ0ttazhmbFZKZ2FsUmxwbG5pK3hoSytUaSsrb3Vo?=
 =?utf-8?B?UXZSTVcweVRJSFhOV3BMOFRZVGxyK0VGYmpWWGd2Z2thaU9Ga0JENEZHM0Ro?=
 =?utf-8?B?dnNneDYwOHJ5Q3JMdWpyTy9jQWxkOGw3SjFqVytBdE9HaVAyM09jTFdnMzY3?=
 =?utf-8?B?bEkzUG9IQ3VkeW1qZjg1c2ZhQ0RyNks1b0pCTlhCeUNDeWRnOVJJR3JXYU5X?=
 =?utf-8?B?QUtqK0FSQmJhZXJHakxHUHVTMGt6SEhCdXRCYVRnK1BPS2hMWmNiS3E4cHQz?=
 =?utf-8?B?SDNXbVV1U21JWU8vUjFHL0RLb3N1MGlUSlVpOU1WZ2xzL1NCNmhNWUtNbVI1?=
 =?utf-8?B?ZUZISlVCcVlhUGVMeGlSRW1Rb2xTUC9Ea3Z2TC9WOGpHN0J0Qldyay9BVklM?=
 =?utf-8?B?Z0ttcStsSUU0TGxUZCtnUlc1N0Z6ai9iWVhON1ArcERHR2c2eTZSV0N0REpy?=
 =?utf-8?B?cVJtbEdRN0VaT29jK0VBTzgzdXNBbDhWZmIwbEpnL2FJb1pENmw1THY1VWJX?=
 =?utf-8?B?UEwzSCs3a0VVTkUrNkErZGg3S2FhWjlYRnV3S1ExbmU1V1l6N3Rmb1pBOWgr?=
 =?utf-8?B?MFpRYXY2QjhFaFhQVEFMRXU3aW1jdEtLRWpxS0JzMzJvYjMxNTVtWXJNRko5?=
 =?utf-8?B?Z2xNdlZ0M3VwRis2UUdJaExvZkMrVkYvRWNsWlNaYkRMVXhzZGZMblZHRmxt?=
 =?utf-8?B?UzNUMit1cEFDc05rWkg0S1hwY2laTXUralVtbnZQUHpFYUhTNWxwOUtyTTBR?=
 =?utf-8?B?d0JTN29iU3NhL2h4V0UrM2FsNjc2REtnVHRYT2VsUy9RYlpLNjlZT1lIOTNE?=
 =?utf-8?B?dXRoS0xiZ1VoUDg3ZGxjMzBQblpDLzRENW9hbWphNG50RUlpV01UbWt5a25J?=
 =?utf-8?B?ZDd6Qm9SZnpzQ3h0TEgvR0JHQmlrRzRuekJBRTR2b2tjbTB5Z2FlZXBpTEVK?=
 =?utf-8?B?Z3JkZFNzRkR3TEM1ZUlyNzZXT1dUYTJuQ1Y5bjI1R1lhdklRNGdaR1J2dmF4?=
 =?utf-8?B?RnhqOE9FTGJLWDA5a0s4UVN0dFVUTEU5QmRXWWVEMEQ4Vml2TTVpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GMFP19aRdbEeeABqMGo0ZmBstH7O9LmGusXGQpoKW7gBhsrkgJeaMu0AesBgaYnRnC9a0i6znmZrUxNOHdo3OWbS0NAVTqTlLOZVAU8T9toU4RrHuNlR9b2Pd5u20BREdy381RFivjDadu2NaYsY4+kG5aYo5J2UDb2lBNjDaXcDnuOG+7inLt5K5b4nW2mGWMhLMKgSGQEw63/kCNXLv2kCKLmVt45E69SMyavYuKSJrT1ddpEArUT1e/JnO8RThXlov6QHlKtvOIPVeK+tN2gizfNF07HAt13rr+g5B4uKKOPnoxIi3KLkHxPa37Y0AIk784b1liiE7Atm0Wkvow==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a126d065-b698-4f3e-5f0d-08df29c566d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 07:33:12.0155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx/f4RVLPQIPOY6QIRrAVTUMutriuBVtaeJNW6Lg628hQ1s6q1AhgqlZmXDwncXY2J+7CMMNStbfWGJ9dbwMxCbNsMNv55aLtPMdnLEVEo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8716
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDYvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogU3VwcG9ydCBUREkgYmluZCBhbmQgdW5iaW5kDQo+b3BlcmF0aW9ucw0K
Pg0KPg0KPg0KPk9uIDE0LjEwLjI2INCzLiA2OjA2INGHLiwgRHVhbiwgWmhlbnpob25nIHdyb3Rl
Og0KPj4NCj4+DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBOaWtv
bGF5IEJvcmlzb3YgPG5pay5ib3Jpc292QHN1c2UuY29tPg0KPj4+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDA2LzE1XSB2aXJ0OiB0ZHgtZ3Vlc3Q6IFN1cHBvcnQgVERJIGJpbmQgYW5kIHVuYmlu
ZA0KPj4+IG9wZXJhdGlvbnMNCj4+Pg0KPj4+DQo+Pj4NCj4+PiBPbiAyNC4wOS4yNiDQsy4gNzox
MCDRhy4sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPj4+PiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3Ig
YmluZGluZyBhbmQgdW5iaW5kaW5nIHRoZSBUcnVzdCBEZXZpY2UgSW50ZXJmYWNlDQo+Pj4+IChU
REkpIHVzaW5nIHRoZSBURENNX09QX0JJTkQgYW5kIFREQ01fT1BfVU5CSU5EIGNvbW1hbmRzLg0K
Pj4+Pg0KPj4+PiBFeGVjdXRpbmcgVERDTV9PUF9CSU5EIHRyYW5zaXRpb25zIHRoZSBUREkgc3Rh
dGUgdG8gYSBsb2NrZWQgc3RhdGUNCj4+Pj4gKFRESV9TVEFURV9DT05GSUdfTE9DS0VEKS4gQWRk
IGEgc2FuaXR5IGNoZWNrIGZvbGxvd2luZyB0aGUgYmluZA0KPm9wZXJhdGlvbg0KPj4+PiB0byB2
ZXJpZnkgdGhpcyBzdGF0ZSB0cmFuc2l0aW9uIHN1Y2NlZWRlZCBiZWZvcmUgZmluYWxpemluZyBk
ZXZpY2UgbG9ja2luZy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4g
PHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+Pg0KPj4+IDxzbmlwPg0KPj4+DQo+Pj4+ICAg
IAlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlYyBfX2ZyZWUoa2ZyZWUpID0ga3phbGxvYyhzaXpl
b2YoKnRkZXZzZWMpLA0KPj4+IEdGUF9LRVJORUwpOw0KPj4+PiBAQCAtMTc0LDYgKzIzMywxOSBA
QCBzdGF0aWMgc3RydWN0IHBjaV90c20gKnRkeF9kZXZzZWNfbG9jayhzdHJ1Y3QNCj50c21fZGV2
DQo+Pj4gKnRzbV9kZXYsIHN0cnVjdCBwY2lfZGV2ICoNCj4+Pj4gICAgCWlmICghdGR4X2lzX2Rl
dl90ZWVpb19zdXBwb3J0KHRkZXZzZWMpKQ0KPj4+PiAgICAJCXJldHVybiBFUlJfUFRSKC1FT1BO
T1RTVVBQKTsNCj4+Pj4NCj4+Pj4gKwlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlY19iaW5kIF9f
ZnJlZSh0ZHhfdGRpX3VuYmluZF9kZXYpID0NCj4+PiB0ZHhfdGRpX2JpbmRfZGV2KHRkZXZzZWMp
Ow0KPj4+PiArCWlmIChJU19FUlIodGRldnNlY19iaW5kKSkNCj4+Pj4gKwkJcmV0dXJuIEVSUl9D
QVNUKHRkZXZzZWNfYmluZCk7DQo+Pj4+ICsNCj4+Pj4gKwlyZXQgPSB0ZHhfdGRpX3JlYWRfc3Rh
dGUodGRldnNlYywgJnN0YXRlKTsNCj4+Pj4gKwlpZiAocmV0KQ0KPj4+PiArCQlyZXR1cm4gRVJS
X1BUUihyZXQpOw0KPj4+PiArDQo+Pj4+ICsJaWYgKHN0YXRlICE9IFRESV9TVEFURV9DT05GSUdf
TE9DS0VEKQ0KPj4+PiArCQlyZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4+Pg0KPj4+IFdoaWxlIHRo
aXMgZG9lcyBzZWVtIGNvcnJlY3QsIGl0J3Mgbm90IHJlYWxseSBmb2xsb3dpbmcgdGhlIHNwZWMg
b3IgSSdtIGJlaW5nIHRvbw0KPj4+IHJpZ2lkLCBuYW1lbHk6DQo+Pj4NCj4+PiBTaW5jZSBUREkg
Y2FuIGNoYW5nZSB0aGUgc3RhdGUgYW55IHRpbWUsIFREIGNhbid0IGZ1bGx5IHJlbHkgb24gdGhl
IEtub3duIFJVTg0KPj4+IHN0YXRlIGluIGFueSBzY2VuYXJpby4gSG93ZXZlciwgVEQgY2FuIHJl
bHkgb24gdGhlIEtub3duDQo+Pj4gUlVOIHN0YXRlIGFmdGVyIFRERy5UREkuU1RBUlQgYXMgYSBj
b25maXJtYXRpb24gb2YgdGhlIEludGVyZmFjZSBTdGFydC4NCj4+DQo+PiBBYm91dCBUREkgY2hh
bmdpbmcgc3RhdGUgYW55IHRpbWUsIGRvIHlvdSBtZWFuIGhvc3QgY2hhbmdlcyBUREkgc3RhdGUs
DQo+PiBlLmcuLCB0aHJvdWdoIFRESC5UREkuU1RPUD8gT3IgeW91IG1lYW4gVERJIGRldmljZSBn
b2VzIGludG8gVERJU1AgZXJyb3Igc3RhdGUNCj4+IGR1ZSB0byBodyBlcnJvcj8gQ2FuJ3QgdGhl
eSBoYXBwZW4gZXZlbiBhZnRlciBUREcuVERJLlNUQVJUPw0KPg0KPkkndmUgdGFrZW4gdGhpcyB2
ZXJiYXRpbSBmcm9tIHRoZSBsYXRlc3QgVERYIGNvbm5lY3Qgc3BlYywgSSdkIGFzc3VtZQ0KPndo
YXQgaXQgcmVmZXJzIHRvIGlzIHRoZSBUREkvZGV2aWNlIGdldHRpbmcgaW50byBlcnJvciBzdGF0
ZSBiZWNhdXNlIHRoZQ0KPkRTTSBkZWVtZWQgc28gYmVjYXVzZSBvZiB3aGF0ZXZlciByZWFzb24u
IEkgYmVsaWV2ZSB0aGVyZSBpcyBhbiBpbmhlcmVudA0KPlRPQ1RPVSByYWNlIGhlcmUsIGJlY2F1
c2UgeW91IGNhbiBhdCBiZXN0IGdldCBhIG1vbWVudGFyeSBzbmFwc2hvdCBvZg0KPnRoZSBzdGF0
ZSBidXQgdGhlIERTTSwgd2hpY2ggaXMgaW5oZXJlbnRseSBhbiBpbmRlcGVuZGVudCBlbnRyeSBj
b3VsZA0KPmZvciB3aGF0ZXZlciByZWFzb24gZGVjaWRlIHRvIGVudGVyIGluIGVycm9yIHN0YXRl
IChoaWdobHkgdW5saWtlbHksIGJ1dA0KPnN0aWxsIHBvc3NpYmxlISkNCg0KQWdyZWVkLCBpdCdz
IGEgYmVzdCBlZmZvcnQgY2hlY2ssIGVycm9yIHN0YXRlIGNhbiBoYXBwZW4gYXQgYW55IHRpbWUu
DQoNCj4NCj4+DQo+Pj4NCj4+PiBCdXQgaGVyZSB3ZSBzdGlsbCBoYXZlbid0IGRvbmUgYSBTVEFS
VCwganVzdCBhIEJJTkQsIG5vID8NCj4+DQo+PiBZZXMNCj4+DQo+DQo+PHNuaXA+DQo+DQo+Pg0K
Pj4gSSB1bmRlcnN0YW5kIHRoaXMgYXMgYSBiZXN0LWVmZm9ydCBzYW5pdHkgY2hlY2ssIG5vdCBh
IGd1YXJhbnRlZSB0aGF0DQo+PiB0aGUgaW50ZXJmYWNlIHdpbGwgcmVtYWluIGluIHRoaXMgc3Rh
dGUuDQo+Pg0KPj4gRm9yIGV4YW1wbGUsIHN1cHBvc2UgdGhlIGhvc3QgY3JlYXRlcyB0aGUgVERJ
IGJ1dCBpbmNvcnJlY3RseSByZXBvcnRzDQo+PiBCSU5EIGNvbXBsZXRlIHdpdGhvdXQgY29tcGxl
dGluZyBUREguVERJLkJJTkQuIEluIHRoZSBtb2R1bGUNCj4+IGltcGxlbWVudGF0aW9uIEnigJlt
IGxvb2tpbmcgYXQsIFRERy5UREkuUkQoSU5URVJGQUNFX1NUQVRFKSByZXR1cm5zIHRoZQ0KPj4g
c3RvcmVkIFRESVNQIHN0YXRlIHdpdGhvdXQgcmVxdWlyaW5nIHRoZSBpbnRlcm5hbCBUREkgc3Rh
dGUgdG8gYmUgQk9VTkQuDQo+PiBBIHN1Y2Nlc3NmdWwgcmVhZCBjb3VsZCB0aGVyZWZvcmUgcmV0
dXJuIENPTkZJR19VTkxPQ0tFRC4NCj4+DQo+PiBBdCB0aGlzIHBvaW50IHdlIGhhdmUgYm91bmQg
dGhlIGludGVyZmFjZSBidXQgaGF2ZSBub3Qgc3RhcnRlZCBpdCwgc28NCj4+IENPTkZJR19MT0NL
RUQgaXMgdGhlIHN0YXRlIHdlIGV4cGVjdC4gQ2hlY2tpbmcgaXQgY2F0Y2hlcyB0aGF0DQo+PiBp
bmNvbnNpc3RlbmN5OyBjaGVja2luZyBvbmx5IHRoZSBURENBTEwgcmV0dXJuIGNvZGUgd291bGQg
bm90LiBUaGlzIGlzDQo+PiBzdGlsbCBhIHNuYXBzaG90LCBub3QgcHJvb2YgYWdhaW5zdCBhIHN1
YnNlcXVlbnQgc3RhdGUgY2hhbmdlLg0KPg0KPk1ha2VzIHNlbnNlLCBJSVVDIGl0IHN0YXRlcyB0
aGUgc2FtZSB0aGluZyBJIHN0YXRlZCBhYm92ZSBpLmUgYQ0KPnNuYXBzaG90LCBzbyBwZXJoYXBz
IHRoaXMgY2hlY2sgY291bGQgYmUgY2FydmVkIGluIGEgZGlmZmVyZW50IHBhdGNoDQo+d2l0aCB0
aGUgY2hhbmdlbG9nIGNvbnRhaW5pbmcgdGhpcyByZWFzb25pbmc/DQoNCk9LIGZvciBtZS4NCg==
