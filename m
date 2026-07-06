Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B0347ECDD
	for <linux-coco@lists.linux.dev>; Mon,  6 Jul 2026 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374283; cv=fail; b=jUxcm6WDMIerdplkQxQOTxALLFrpfrnA4eOYKINseOkfqfosWW55R5jzrZkJCA74crgv6zujWQAX620hoO7yDl08B/L6kfc6ri1OxSuCDpuUCT+2va1LPT1j8/NM8d0HrEAXu/7vFJWOlJB0oNPyxQpvDYQOmuq5THTlaevyzGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374283; c=relaxed/simple;
	bh=RnfXrtkonQdbKuHY2NZXMHLX8esjopNXNiohjVPrFtw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TNC53QWQZZWsPHudfZxN+MqHkx978kpIiNHOhvcDtQgRY2liOUPYIpX4ATo8FZih1S+tEySCXewa3cyQdZy6y0zgDuDf5RXelTiAwSVjm4H+F/8iH8ykNbBTsG4cg+UvPrt7vlKzcWUtJdfGBBSS8tngHmCifnJkxfO4QPvxIqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bPSruAVe; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bPSruAVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783374281; x=1814910281;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RnfXrtkonQdbKuHY2NZXMHLX8esjopNXNiohjVPrFtw=;
  b=bPSruAVers6AqguAjPm7TsCRFRQJ9PC3iuDg+Ih+hJpzAeW7KNKkGBL2
   9JzlDzxBtFH7KyDywijNjHLoBt+EFfOB6iDX0lcjlSSzxrCIfWyT/f1wm
   nMrN58YM5Q5znlxLKbVbAJEyCugK8zIkc+K6nIwdW4omldDjzSV6RL0ne
   fyXnnwv3+ZRZiuoseXTr8HXpMONueCq8AfRWwj3ZuWSPFnRDjtP1YVsF1
   n2NcCVMw+XHJ2tiqM+8sC1bcJME4IDpDcSPEqhpXWnIntgIegW1OwPMk2
   PWbtHGA78rQNqSI7SeLAzgy8ZehyAEUitIjA+rIO9124biKgezr26jeml
   Q==;
X-CSE-ConnectionGUID: M3rdXLm8Tby+lgPRingOMA==
X-CSE-MsgGUID: S7Z0oMVwQjeQmbCPkjOI/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="71538317"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="71538317"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:44:40 -0700
X-CSE-ConnectionGUID: D9XPtJD+RNmOmqc723MIzw==
X-CSE-MsgGUID: NjgaD1C/RhaZRMv7lyFcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; 
   d="scan'208";a="249389708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 14:44:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:44:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 14:44:39 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 14:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPvhqgC7D2MWrEaNDhyQ6BPOeKTxjAn+gHBbgKf9na7NXckSL48FW7+LG/I+RjTI23BDAV4PaPNzURFRQVFzpzpBWq0k//wxm97VNWJpzzRbnvzn36GNVvXRlMWaE/RJE+fpQTjCsZIsXP2Ls8HpQuSIPo+XbuSoJ3I+vEZCDVanbfn2rMjaFibEGRXLLRabEihBLtUPmxm1zmfiTbmufsWA9ypBWthTojqS8yEtjfB8rrtueCzJ4D70ABdsq/QaEhrNouYFwOCBw/vOFiRaCXqt80MLCyUHk7gmFulX2hLVOv5RAeAqBSG+qM/vOd1GfsPA1uTaCTOFh7lKNU6SQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnfXrtkonQdbKuHY2NZXMHLX8esjopNXNiohjVPrFtw=;
 b=FMfe/gj4z3Q1SEkbQX6Jb38TFwZycRP+1RAtuVjzSF/M/ewc3nmOpMY2uaenVZFDNOngtcbP9BgmLaSNZiMvAdGQu5mnRK6WXUI9Zhey6urJKioxzdf64cyI5idsA6JbYqpDkAm1Z6Sdr5aQHG6P3vSmtjsIgIzI9g1+4mNKIXhXUkbuR9t9F4LCj8mu1uWDPPNXiWGYflXKZFBnw1nyCvtknLFD3ksYqPCITQhMaMlbeuXiUes17oRn1wP125ayPEcYGoAvjSVF4hZ1aGLrGkKpGl4L6CkGd2iDZgEuP4BaoxYVL5RtObZ2IIf6FCN8RPpdcUDPMZo1/hFvZOab2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 21:44:29 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 21:44:29 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "Gao, Chao" <chao.gao@intel.com>, "Xu, Yilun" <yilun.xu@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"djbw@kernel.org" <djbw@kernel.org>, "Fang, Peter" <peter.fang@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding support
Thread-Topic: [PATCH] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Thread-Index: AQHdCjGTVn/IG+JfKEWgWy1/tfs/rLZhDNoA
Date: Mon, 6 Jul 2026 21:44:29 +0000
Message-ID: <7d3eba7a5442cf3e84fe3658ae53337a183290b1.camel@intel.com>
References: <20260702144614.59464-1-yilun.xu@linux.intel.com>
In-Reply-To: <20260702144614.59464-1-yilun.xu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|PH7PR11MB6329:EE_
x-ms-office365-filtering-correlation-id: 0775716a-ca1c-42f8-ef55-08dedba7c1fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|5023799004|3023799007|22082099003|18002099003|6133799003|38070700021;
x-microsoft-antispam-message-info: sMpEw1wqx0OC8RYABBU+lRhxKIRaLp5hgmvxXxZuamlQCk0SFiHEu2B9PNrc9S7S9VgfF1fl/Nj+fba9pXhK5A9HDTB4tmIRAq8nrRCMXyCBR0QjydO5CAbnw2TnFpk8stUFOwgzoXxe2o9xhI1TsY/IgmCre5QW35ja2v6Vpw2Z5XdwrAwgXeGD9/oJGIL0AbMAw2/CEkEB9aeIbiEHBmlUswnoU2Au4dkLxqjgycTPdWj/LwN2Zf51yky04TM5Ixis54W9BWRvH3UAFnZ+MJ4uN1nTX1qZVR79fs9LGeE8p75eV/lZuG+n/+7rrvf8Xsdlwi/alnZoPMG45PZXZbyCmBnr0iIbm6pJMi0egItRrdvGhvL19ufEQMyuvQl79oECKy4+LFo5xn4xab2UUYnTYbXqcv4I8YwPJPjJBmqnCKO/l70tnCw66ip21UDx1oVs1s3OkXV8ltYR18rx4NHjvljpWWu3fGCG/CpTrDwAsSKLHFKBNaETCwBVnhM5RV948OBd+O4BkCTKtIHCvmxRLP7Y1gqQgHt70fccNc1Rc2Aa8HytzAm8L0qXM5rDy2lrx9nQtDUQACfzU7w1mdo/lubK2x6gm1pm6RV+AfC56qafc/43+DnrXvAVR8YJH9sZPJ6FLTpcgodEobx0Fjlj5YA7ULjxXcM5oH4Z4ZMwqMDPuvkdduXW1XRF+l0j/af5NXpDgd7ekCG56ZJP8eiDMTHjIlxEM2sUkG27Hp4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(5023799004)(3023799007)(22082099003)(18002099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjFqbzZLd2ViRmRkRmtqdDdwdWtudWFXeU9telg4dFRPMGNzbE5lMlpOUFFu?=
 =?utf-8?B?RDY0V1JjL0E3Q0FuUFRlSFFnQWJpVjhLVDNYRlNjOVJ0NUZwQWNTbEhER2Rh?=
 =?utf-8?B?ZGdLRHZsWEk4Y2d4STBWclBYRW9qMzg5d3JuSkNIbjJBa1RKUUxMVWpaMytH?=
 =?utf-8?B?azM2SXd5UEpZUFFQVjN4enBhbFNWb3p4Qi81VFZkNWV0eFliUGVDdkJ3ZStp?=
 =?utf-8?B?N1lmT1pzZ25jcFI0NXNCM3hmUVhlQytPSzVIT0xNbFFTNFFoV21ERlJxK2hG?=
 =?utf-8?B?elVrMVIzSTR1dWI1R0FVSjVlV3dNTjd3aVloOWNRWmg1OFNTdzF4cllGc1BO?=
 =?utf-8?B?Ym9wcWxmRmhoaERXSEYzUnR6Wjhldm0xbnBnY3FXc0dpK01OYU1nRkdBd1Zy?=
 =?utf-8?B?VXBUS0pMd0RQa0hXRExDUlk4c3NJL0dEdS96bi9PUmpodHRLTWptVVp0VWhi?=
 =?utf-8?B?dzlYcVkyTy94M2grTEQraVVBNkdlTVMvNU8vQ1FFN1Z4dnFibXYrSTh4UzZy?=
 =?utf-8?B?Y0ZUN05ZQTZDMnlIMkhBZ2kxV2FJVTRtRjJpcE5ieHB6RCtJV2xUREVaOWJW?=
 =?utf-8?B?bnlqQ3F1NHVlc1JCTm50SU9sVERUQml1dDF5TXpVdFBnR2JBTnJNeitFd3Vi?=
 =?utf-8?B?RitxMVZMenVlM0JYYXBpV1hvNFptNzBFbGtaUGJ6TlRsczFPcWorLzdkNlF0?=
 =?utf-8?B?bGpHWC9mbUFLREhlM2RhekpBYXZIK05wZ3Uzc09id0RwSkp6L01zdm42RHBF?=
 =?utf-8?B?RzBySG5SWFVlVmRaMG9vTG1iWG0vaWFja0h3WTh3STBKM2FVSU9VQlkycGlW?=
 =?utf-8?B?WTlwSmhsS2kzVHgvUEtJdUtIRFpNZkNra1lUMmdVZ2xGQTRGaEpZTHRNMnlZ?=
 =?utf-8?B?eUVkVytlVFRydVB2RWVDOGJRajhCamM5V25yRVlOVGtsWjM2V3ozR3hwaUly?=
 =?utf-8?B?VWNOaFAxeVM5NXZEdjQ3Tm5DaStIWHdaL3JLUGQ3WFVyR2F4NDZ4VWUwRUow?=
 =?utf-8?B?dnZ1ckFNTUhIZUZzZGRQZDRKTjZUQ20xdkt4TlBoeTFRR1g2WXdzaEVSOVNn?=
 =?utf-8?B?WjR2T2N2TG9zRHJTcnNFb2JoRytETlZoSzExb0pBZmlBTUYxeXhCTkZYbnU5?=
 =?utf-8?B?M3JYb1NWZno5TlBQSmllaGJucGVmTVVpd3BpcjlMOGlzQk9DUjd5UWQ2bDk0?=
 =?utf-8?B?akJPSTRWUTBOclVsL3hRTFFOMU8wK0dacTUrWEV0dkg3L0h6MWYzTkUrTlJC?=
 =?utf-8?B?S2tsdnVNRU9GQ0pLQ0podHBJQTR6dnNhRHBsK3Y3OEVqdjFKdkVxcXQ3eWxq?=
 =?utf-8?B?TXRBRHJHWmV4YUo1bkc5MllmZURyRG5jWWVqZlVWQVU5MmVoaWk4NUpiTFhq?=
 =?utf-8?B?N0lXMnBjaGttSG9KMHJwZm54VWdJbGtZbmN5bmFQdTlsazZhWUNkN1Z1dW52?=
 =?utf-8?B?MEF3eWhqb0c0MFFaZ3RYcVB4c0k4cnhPK3JXWFlPeVkvaEV1aXVwakl3M0Nv?=
 =?utf-8?B?QVpDczl6a0QvNlltWERHZU5sbnpkZkt3SkVzTWtqdmJ2ZFZuOXpuU0hoemdG?=
 =?utf-8?B?NXBVSGFocXh1ZGt0QzhMOXFRRGI1M0Y4TXVJUE9mVTZsbGxTRmg2V2NzUTBv?=
 =?utf-8?B?L2dVMno3WGhKNlNjRmlVODdIZnl4TnlzWUVzN1NVaVpWTHpmR01UYjZZYnNF?=
 =?utf-8?B?OU9zVWRiWjVTbW5tWE5xdFFFaDdNazdqcysxcWhsSFhpU3l4WGRTWS90bmVM?=
 =?utf-8?B?RnJLaURib2hkYm9uK2N0QUI0TW51QlpSeldSUGxwblVabkZRNDNRTXdoOWlE?=
 =?utf-8?B?TkxjSFlHSGEvL3JHRGwrcjF5VVgwSnkrampYT2dxOURnY1BDazJ4dnIycXJv?=
 =?utf-8?B?RjRsbVdvNGZNZmdhYWh2N1hScU5ub1p5eUgyTFFjQVJ5MzgzbzVGdG1nT0RJ?=
 =?utf-8?B?cmpGMml5S21OajBHMExwLytxY3E4OHV0MW9Sc25uL2JDOGZzRGlQMzFuTnNr?=
 =?utf-8?B?MHlTeHhSdWs4Z1hhZmlmdVZ2V2E5QkxBVFpua1kySUoxM2JhU09jZ0FyM0RR?=
 =?utf-8?B?NUd4VTh5Z3RVSy9zTGhaRVBmRkp5YlpmVHRTdFhJM0FQY0ZPd1V4WmVOL1RN?=
 =?utf-8?B?SWlGTEV1MUk4b2srWVZ0anRhZk5yT2RINytSSTNNdksvVEltaC9xV3RHNHlG?=
 =?utf-8?B?TXgxb0ZySUwvTTdPYk5YYmEycEo2MFBvSmluRXQycFNRTENwSlBOOU1EaUdp?=
 =?utf-8?B?VWVmdnl1ZThNNzhPb2JxeCtNRzN5YXB2SkJubjF5cUxWOGt6OTVOU2pKOHpz?=
 =?utf-8?B?WU10VEdkZUpkajEyVlN4UVJyU3BTNHFBTjZFcGNMTC9kbWhlU0JlTzVRWHRn?=
 =?utf-8?Q?bL66Q9byRsY/U/uE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79FC0B77D4C00D45B8F829B014219EF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: S+zXpdm6ISubPtRlTDwlAuDlxnZg1rfkSPFw7MYIIIf6AlNZUNgDx7vJPn2ZCOCN0GUu2fb/d8RSoABzkrr/F1vv+Yvg5JYWVPNHLDYKNPCKAU08qcbYYRkX2T+lQkZFhGA9X7OPK22f/yKfm2r/vEnXHFPUwu4/b9yHXeIvBpHsJrrMAbW9Wp1zgNm/CkxeBUjDlESECRpDDvZO8SImHiixmeo1ho7Ui1ccamNNhDlu/vkzNlDFjxhMokqGNgX26Bo5znNdxJP/0zY/qGy/+fnINa1wBpkgRI5z/7WSzrHs47w+9UNoMgIVj36MZVOmxuRwk1Zg97fCvHyX+psLUg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0775716a-ca1c-42f8-ef55-08dedba7c1fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 21:44:29.2848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vuk0abZPrAxfQkf1RK1xkLtv2+j25vTlh69WoBoHJShrXY6gFKpMVdhIn5s5on0rG3L1Lzj+su8p3CKtRKNcGX0PzqCUU9EisJJMZb3eKIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDIyOjQ2ICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gVERY
IHVzZXMgdGhlIFNFQU1DQUxMIGluc3RydWN0aW9uIHRvIGludm9rZSB2YXJpb3VzIFREWCBtb2R1
bGUNCj4gZnVuY3Rpb25zLiBKdXN0IGxpa2UgdGhlIHN5c2NhbGwsIGEgU0VBTUNBTEwgc3BlY2lm
aWVzIHRoZSBvcGVyYXRpb24NCj4gdXNpbmcgYSBmdW5jdGlvbiBudW1iZXIgYW5kIHBhcmFtZXRl
cnMuIE1vcmVvdmVyLCBURFggYWxzbyB1c2VzIFNFQU1DQUxMDQo+IHZlcnNpb25zIHRvIGV4dGVu
ZCB0aGUgZnVuY3Rpb25hbGl0aWVzIG9mIGV4aXN0aW5nIFNFQU1DQUxMcyB3aGlsZQ0KPiBrZWVw
aW5nIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuIFVubGlrZSBzeXNjYWxsIHZlcnNpb25zIHRoYXQg
YXNzaWduDQo+IGJyYW5kIG5ldyBudW1iZXJzLCBURFggc2VnbWVudHMgdGhlIGZ1bmN0aW9uIG51
bWJlciBpbnRvIGEgYmFzaWMNCj4gZnVuY3Rpb24gbnVtYmVyIGZpZWxkIGFuZCBhIHZlcnNpb24g
ZmllbGQuIFRvZ2V0aGVyLCB0aGV5IGVuY29kZSB0aGUgbmV3DQo+IGZ1bmN0aW9uIG51bWJlci4N
Cg0KU28gaXNuJ3QgdGhpcyBwcmV0dHkgbXVjaCBsaWtlIG51bWJlcmVkIHNlYW1jYWxscywgZXhj
ZXB0IHRoZXJlIGlzIGEgc3BlY2lhbA0KZm9ybWF0IGZvciBnZW5lcmF0aW5nIHNlYW1jYWxsMiwg
c2VhbWNhbGwzLCBldGM/IEluIHRoZSBlbmQgeW91IGp1c3QgdXNlIGENCmRpZmZlcmVudCBudW1i
ZXIgZm9yIGEgZGlmZmVyZW50IHZlcnNpb24gb2YgdGhlIGNhbGwuIFNvIGl0J3MganVzdCBsaWtl
DQpzeXNjYWxscywgZXhjZXB0IHRoZXJlIGlzIGEgcGF0dGVybiBpbiB0aGUgc3BlY2lmaWMgbnVt
YmVyIGZvciBjYWxscyBvZiB0aGUgc2FtZQ0KZmFtaWx5Lg0KDQo+IA0KPiBBbiBleGlzdGluZyBT
RUFNQ0FMTCAoVERILlZQLklOSVQpIGhlbHBlciBpcyBhbHJlYWR5IHVzaW5nIHRoZSB2ZXJzaW9u
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIG1heWJlIHN3YXAgdGhlIG9y
ZGVyIG9mIHRoZXNlIHR3bz8NCj4gZmllbGQuIEhvd2V2ZXIsIGhhdmluZyB0aGUgY2FsbGVyIHBh
Y2sgdGhlIHZlcnNpb24gaW50byB0aGUgZnVuY3Rpb24NCiAgICAgICAgICBeQ2FuIGRyb3AgdGhp
cz8NCj4gbnVtYmVyIG9wZW4tY29kZXMgdGhlIEFCSSBsYXlvdXQsIG1ha2luZyB0aGUgU0VBTUNB
TEwgaGVscGVyIGRlZmluaXRpb24NCj4gb2JzY3VyZSBhbmQgZXJyb3IgcHJvbmUuDQoNCkRvIHdl
IG5lZWQgdGhlIHNlY29uZCBwYXJ0IG9mIHRoZSBzZW50ZW5jZT8NCg0KPiANCj4gQWRkIGEgdmVy
c2lvbiBmaWVsZCBpbiBzdHJ1Y3QgdGR4X21vZHVsZV9hcmdzLCBzbyB0aGF0IG1vc3QgZXhpc3Rp
bmcNCj4gU0VBTUNBTEwgaGVscGVycyBnZXQgYSBkZWZhdWx0ICJ2ZXJzaW9uID09IDAiIGJlaGF2
aW9yIHdpdGhvdXQgY29kZQ0KPiBjaHVybiwgd2hpbGUgY2FsbGVycyByZXF1aXJpbmcgZXh0ZW5k
ZWQgZnVuY3Rpb25hbGl0aWVzIGNhbiBzcGVjaWZ5IHRoZQ0KPiB2ZXJzaW9uIGRlc2NyaXB0aXZl
bHkuDQo+IA0KPiBBcyBhbiBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwsDQoNCl4gSXMg
dGhpcyBuZWVkZWQgdG8gbWFrZSBpdCBjbGVhcj8NCg0KPiAgZW5jb2RlIHRoZQ0KPiB0ZHhfbW9k
dWxlX2FyZ3MudmVyc2lvbiBpbiB0aGUgZnVuY3Rpb24gbnVtYmVyIGJlZm9yZSBjYWxsaW5nIGlu
dG8NCj4gYXNzZW1ibHkgY29kZS4NCj4gDQo+IFR3byBhbHRlcm5hdGl2ZSBzY2hlbWVzIHdlcmUg
Y29uc2lkZXJlZDoNCj4gDQo+IDEuIERlZmluZSB2ZXJzaW9uZWQgbWFjcm9zIGxpa2UgVERIX1ZQ
X0lOSVRfVjAsIFRESF9WUF9JTklUX1YxLCBldGMuDQo+ICAgIEhvd2V2ZXIsIHRoaXMgYnJlYWtz
IG5hbWluZyBjb25zaXN0ZW5jeSB1bmxlc3MgYWxsIGV4aXN0aW5nIHN0YWJsZQ0KPiAgICBmdW5j
dGlvbiBtYWNyb3MgYXJlIGNoYW5nZWQgdG8gVERIX1hYWF9WMC4NCj4gDQo+IDIuIEFkZCBhbiBl
eHBsaWNpdCAndmVyc2lvbicgcGFyYW1ldGVyIHRvIHRoZSBiYXNlIHNlYW1jYWxsKCkgQVBJLiBU
aGlzDQo+ICAgIHVubmVjZXNzYXJpbHkgZm9yY2VzIGFsbCBzdGFibGUgU0VBTUNBTEwgaGVscGVy
cyB0byBwYXNzIGENCj4gICAgbWVhbmluZ2xlc3MgJzAnIGFyZ3VtZW50LiBBZGRpdGlvbmFsbHks
IHRoZSBtYWdpYyAnMCcgb3IgJzEnIHZhbHVlcw0KPiAgICBhdCBjYWxsZXIgc2l0ZXMgYXJlIG5v
dCBkZXNjcmlwdGl2ZS4NCj4gDQoNCkRhdmUgd2FzIHJlY2VudGx5IHNheWluZyBzb21ldGhpbmcg
dG8gdGhlIGVmZmVjdCBvZiAibWFrZSBldmVyeSB3b3JkIGNvdW50Ii4gSQ0KdGhpbmsgd2UgY291
bGQgbG9zZSBzb21lIGZpbGxlciB3b3Jkcy4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBYdSBZaWx1biA8
eWlsdW4ueHVAbGludXguaW50ZWwuY29tPg0KDQpIb3cgYWJvdXQgYSBsaW5rIHRvIHRoZSB0aHJl
YWQgd2hlcmUgdGhpcyB3YXMgc3VnZ2VzdGVkLg0KDQo+IC0tLQ0KPiAgYXJjaC94ODYvaW5jbHVk
ZS9hc20vc2hhcmVkL3RkeC5oICAgICAgICAgfCAgMiArKw0KPiAgYXJjaC94ODYvdmlydC92bXgv
dGR4L3NlYW1jYWxsX2ludGVybmFsLmggfCAxOSArKysrKysrKysrKysrKysrKystDQo+ICBhcmNo
L3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmggICAgICAgICAgICAgICB8ICA4IC0tLS0tLS0tDQo+ICBh
cmNoL3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmMgICAgICAgICAgICAgICB8ICA1ICsrKy0tDQo+ICA0
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJlZC90ZHguaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3NoYXJlZC90ZHguaA0KPiBpbmRleCBmMjBlOTFkN2FjMzUuLmI5YWFjMmRl
MjMzYSAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vc2hhcmVkL3RkeC5oDQo+
ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJlZC90ZHguaA0KPiBAQCAtMTQzLDYgKzE0
Myw4IEBAIHN0cnVjdCB0ZHhfbW9kdWxlX2FyZ3Mgew0KPiAgCXU2NCByYng7DQo+ICAJdTY0IHJk
aTsNCj4gIAl1NjQgcnNpOw0KPiArCS8qIEFCSSB2ZXJzaW9uLCBlbmNvZGVkIGluIHJheCAqLw0K
PiArCXU4ICB2ZXJzaW9uOw0KPiAgfTsNCj4gIA0KPiAgLyogVXNlZCB0byBjb21tdW5pY2F0ZSB3
aXRoIHRoZSBURFggbW9kdWxlICovDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni92aXJ0L3ZteC90
ZHgvc2VhbWNhbGxfaW50ZXJuYWwuaCBiL2FyY2gveDg2L3ZpcnQvdm14L3RkeC9zZWFtY2FsbF9p
bnRlcm5hbC5oDQo+IGluZGV4IGJlNWY0NDY0NjdkZi4uNzAwMmU0MWNkZGFkIDEwMDY0NA0KPiAt
LS0gYS9hcmNoL3g4Ni92aXJ0L3ZteC90ZHgvc2VhbWNhbGxfaW50ZXJuYWwuaA0KPiArKysgYi9h
cmNoL3g4Ni92aXJ0L3ZteC90ZHgvc2VhbWNhbGxfaW50ZXJuYWwuaA0KPiBAQCAtMTEsNiArMTEs
NyBAQA0KPiAgI2lmbmRlZiBfWDg2X1ZJUlRfU0VBTUNBTExfSU5URVJOQUxfSA0KPiAgI2RlZmlu
ZSBfWDg2X1ZJUlRfU0VBTUNBTExfSU5URVJOQUxfSA0KPiAgDQo+ICsjaW5jbHVkZSA8bGludXgv
Yml0ZmllbGQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPg0KPiAgI2luY2x1ZGUgPGFzbS9hcmNocmFuZG9tLmg+DQo+IEBAIC0yMyw2
ICsyNCwyMiBAQCB1NjQgX19zZWFtY2FsbF9zYXZlZF9yZXQodTY0IGZuLCBzdHJ1Y3QgdGR4X21v
ZHVsZV9hcmdzICphcmdzKTsNCj4gIA0KPiAgdHlwZWRlZiB1NjQgKCpzY19mdW5jX3QpKHU2NCBm
biwgc3RydWN0IHRkeF9tb2R1bGVfYXJncyAqYXJncyk7DQo+ICANCj4gKy8qDQo+ICsgKiBTRUFN
Q0FMTCBsZWFmOg0KPiArICoNCj4gKyAqIEJpdCAxNTowCUxlYWYgbnVtYmVyDQo+ICsgKiBCaXQg
MjM6MTYJVmVyc2lvbiBudW1iZXINCj4gKyAqLw0KPiArI2RlZmluZSBTRUFNQ0FMTF9WRVJTSU9O
X01BU0sJCUdFTk1BU0tfVTY0KDIzLCAxNikNCg0KVGhlIGFubm95aW5nIHRoaW5nIGlzIHRoYXQg
dGhlIHBhdGggdG91Y2hlZCBoZXJlIGlzIGFsc28gdXNlZCBmb3Igc2VhbWxkciBjYWxscw0Kbm93
LCB3aGljaCBhZmFpY3QgaGFzIG5vIGNvbmNlcHQgb2YgdmVyc2lvbi4gVW5kZXJzY29yaW5nIGhv
dyBtdWNoIG9mIGEgbWVzcyB0aGUNCndyYXBwZXIgc3RhY2sgaXMuDQoNCj4gKw0KPiArc3RhdGlj
IF9fYWx3YXlzX2lubGluZSB1NjQgX19zZWFtY2FsbF9lbmNvZGVfZm4oc2NfZnVuY190IGZ1bmMs
IHU2NCBmbiwNCj4gKwkJCQkJCXN0cnVjdCB0ZHhfbW9kdWxlX2FyZ3MgKmFyZ3MpDQo+ICt7DQoN
CkkgaGF2ZSB0aGUgc2FtZSBxdWVzdGlvbiBhcyBYaWFveWFvLiBXZSBoYXZlIHNvIG1hbnkgd3Jh
cHBlcnMgYWxyZWFkeS4NCg0KPiArCUZJRUxEX01PRElGWShTRUFNQ0FMTF9WRVJTSU9OX01BU0ss
ICZmbiwgYXJncy0+dmVyc2lvbik7DQo+ICsNCj4gKwlyZXR1cm4gZnVuYyhmbiwgYXJncyk7DQo+
ICt9DQo+ICsNCj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdTY0IF9fc2VhbWNhbGxfZGlydHlf
Y2FjaGUoc2NfZnVuY190IGZ1bmMsIHU2NCBmbiwNCj4gIAkJCQkJCSAgc3RydWN0IHRkeF9tb2R1
bGVfYXJncyAqYXJncykNCj4gIHsNCj4gQEAgLTM5LDcgKzU2LDcgQEAgc3RhdGljIF9fYWx3YXlz
X2lubGluZSB1NjQgX19zZWFtY2FsbF9kaXJ0eV9jYWNoZShzY19mdW5jX3QgZnVuYywgdTY0IGZu
LA0KPiAgCSAqLw0KPiAgCXRoaXNfY3B1X3dyaXRlKGNhY2hlX3N0YXRlX2luY29oZXJlbnQsIHRy
dWUpOw0KPiAgDQo+IC0JcmV0dXJuIGZ1bmMoZm4sIGFyZ3MpOw0KPiArCXJldHVybiBfX3NlYW1j
YWxsX2VuY29kZV9mbihmdW5jLCBmbiwgYXJncyk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgdTY0IHNjX3JldHJ5KHNjX2Z1bmNfdCBmdW5jLCB1NjQgZm4sDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmggYi9hcmNoL3g4Ni92aXJ0L3ZteC90
ZHgvdGR4LmgNCj4gaW5kZXggYmRmZDBlMWUzMzdhLi42M2UzYWNmYjVkMGMgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHguaA0KPiArKysgYi9hcmNoL3g4Ni92aXJ0L3Zt
eC90ZHgvdGR4LmgNCj4gQEAgLTUwLDE0ICs1MCw2IEBADQo+ICAjZGVmaW5lIFRESF9TWVNfVVBE
QVRFCQkJNTMNCj4gICNkZWZpbmUgVERIX1NZU19ESVNBQkxFCQkJNjkNCj4gIA0KPiAtLyoNCj4g
LSAqIFNFQU1DQUxMIGxlYWY6DQo+IC0gKg0KPiAtICogQml0IDE1OjAJTGVhZiBudW1iZXINCj4g
LSAqIEJpdCAyMzoxNglWZXJzaW9uIG51bWJlcg0KPiAtICovDQo+IC0jZGVmaW5lIFREWF9WRVJT
SU9OX1NISUZUCQkxNg0KPiAtDQo+ICAvKiBURFggcGFnZSB0eXBlcyAqLw0KPiAgI2RlZmluZQlQ
VF9OREEJCTB4MA0KPiAgI2RlZmluZQlQVF9SU1ZECQkweDENCj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L3ZpcnQvdm14L3RkeC90ZHguYyBiL2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHguYw0KPiBp
bmRleCA0MmRmOGVhNDY0YzQuLjdhODllMjliMTE4YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYv
dmlydC92bXgvdGR4L3RkeC5jDQo+ICsrKyBiL2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHguYw0K
PiBAQCAtMTkxMCwxMCArMTkxMCwxMSBAQCB1NjQgdGRoX3ZwX2luaXQoc3RydWN0IHRkeF92cCAq
dnAsIHU2NCBpbml0aWFsX3JjeCwgdTMyIHgyYXBpY2lkKQ0KPiAgCQkucmN4ID0gdnAtPnRkdnBy
X3BhLA0KPiAgCQkucmR4ID0gaW5pdGlhbF9yY3gsDQo+ICAJCS5yOCA9IHgyYXBpY2lkLA0KPiAr
CQkvKiBhcGljaWQgcmVxdWlyZXMgdmVyc2lvbiA9PSAxLiAqLw0KPiArCQkudmVyc2lvbiA9IDEs
DQo+ICAJfTsNCj4gIA0KPiAtCS8qIGFwaWNpZCByZXF1aXJlcyB2ZXJzaW9uID09IDEuICovDQo+
IC0JcmV0dXJuIHNlYW1jYWxsKFRESF9WUF9JTklUIHwgKDFVTEwgPDwgVERYX1ZFUlNJT05fU0hJ
RlQpLCAmYXJncyk7DQo+ICsJcmV0dXJuIHNlYW1jYWxsKFRESF9WUF9JTklULCAmYXJncyk7DQo+
ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0ZPUl9LVk0odGRoX3ZwX2luaXQpOw0KPiAgDQoNCg==
