Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533D126C02
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294819; cv=fail; b=j9/vFR4Ma/rNLt/HqDJFZBXJPia0ExQ8Bax1Sw4iI5Ij8wHtTA4YpRMaO4XeVWV6DZ529mdlG/K14b9olam8/GgaF3kTpGsgMwbzF2WrkwwJN6JNWv3yErdttq4CGBM2EfWmrtxQoHx9ItH/fBmaVhFGrB0mmS7bMFUl2z+MIQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294819; c=relaxed/simple;
	bh=6mZaGF8sHA3nKMMv3lYmkXjYtMWy5t3+dym2wRzNWD4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CA9jwqEkfFu5nqUw1iRe/poMKfd/6onPpg5mXdksQAQtNqC2tkyLeVqUeQ4WNGw+0fMQwdcgnG6y80IE8kLKwSwYu5lGEefAeUwmSmGJZIaKa+IvMrpJsipcAe9pYtmPgVqsCDf7/XPDlYMpbEH3txVP9AhfogAoKWVI+gTPfCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXiq9aZa; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXiq9aZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790294818; x=1821830818;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6mZaGF8sHA3nKMMv3lYmkXjYtMWy5t3+dym2wRzNWD4=;
  b=gXiq9aZaQXycmq7/CytN+CrNKBnMFcgLlbIB1uVZMDeI0/EaT2NTFwCQ
   zpSaEXz0KxzFMaE2nkis6LvIcwQgnnw/qVXVRkfcYpTCe8eXFINYvJ+uZ
   drcpL9FYtbZz4icqrWCir7gg6RB3z1g8H00yVJ5Wj2t3RXWNHH/XgwmHI
   env2G48KEE1LIS4YBxZR+ZocJ/NDOq0guAGYb79Fr8g3sqMyP16NTj769
   3reM5uglkQTYFy3EEWIj09o5gZD1gJ/+ldVrnPWevXNjrhYvZcShCtiCv
   gYIsbASbL7aPeQGSKK9YzsSS9cO5owew7o7dCBhrKsMzIGw25h9pfMIVM
   A==;
X-CSE-ConnectionGUID: pS7UE1onS2CBi1cte/LeZA==
X-CSE-MsgGUID: 6twR+t3BT9K5coOVv0j7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89944965"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89944965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:06:57 -0700
X-CSE-ConnectionGUID: rqOP43L5S+WX6er3VwUOFg==
X-CSE-MsgGUID: oTyGcTefTUK2kONdmCi9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="282259189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:06:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:06:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 17:06:56 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:06:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blG5HyBMrs1lJItUfpdnjmqpMXhlZWVJm5xlgeKsBkvKwyWK27gMSTwlKFmoeqTiMw2MT5YoIuRwlE/6xVAUqo7ipf5ZcvZEka+cCNgR6UQFxw6TskQGdWBSp9rNlSLTSvDcGGpR3VCkIjuva89qryEgESVtxGJRvlXG5+SYlr9nT51YhhizfWZuL7Vbl0HYH3Ocyn3C9TydPp32sRMNn3oSS7eKYRq2MKxX3WGuCukynmwgXOh6ZiWQGmhtkLCDgjd42sE8pJAwQccOQVHQg1bSZL2kM17BHFmfbGpJ8vkiOvL8x3TLz/gqfzJLaBg0bmb0l7/2hZREgZB/CvIWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mZaGF8sHA3nKMMv3lYmkXjYtMWy5t3+dym2wRzNWD4=;
 b=GFistBCTb92DdjJA5m5h0WtvrX5iJLir2kbU7y4JYGLHWwL88+FTzPk9WxYhVdhiDKLtL0iKDDX+cOu0ZwEcQx5beP0TVtWWaku20h/L4rXvtxRzjgJUpfVyXw+9n6xJa3aOoxFm+lltSQXOd86M4elynTf4xjJCqUSFb/edxwL63zffW/BM3RTEb4EsWtpEU29noqhEPUdD2LWZDBUHl60ycIROvk3ZopNkun9jyDE+FCd2hhCnoJFc16Byxb66OD2PZVXpuApXQ0NPbexpMgNfNDMWQW8IBMKe78e8A9V9GWB+kKUoUXue4/vS5yGJQqCrqMhxDlW9J4xWEh77cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LVUPR11MB9565.namprd11.prod.outlook.com (2603:10b6:408:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 00:06:53 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 00:06:53 +0000
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
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5wB9qnnI5wkC3DPnIBykUmbbea9MA
Date: Fri, 25 Sep 2026 00:06:53 +0000
Message-ID: <fcd71764ae5d7a0e0cc2c2d2264ea5aefb3fca24.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
In-Reply-To: <20260924041032.1096569-4-zhenzhong.duan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LVUPR11MB9565:EE_
x-ms-office365-filtering-correlation-id: 5c914913-bbfa-4e78-dc99-08df1a98e7af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: nXOzdpvBFDhB/RJZ892KCNK10YOVSObAUKjVgySrtbNjmNSSxYHp/u23n4dWlk8I6mcdMJTcMlQojTKYxHjByYxjJo9TRwzjUx9QssUoPQmQbo1CoPWkMxgSNXC5rujNiYyeYWNTCSLW+u41aF2hR8gEeHwVTa2Jdzo6WyB5941n042qqTZXJc5ezxBhVApwYrQ9h830nd7PkPdNz6EFxxh703rTm6BWsSG0P6PoO03HLkBno4QTRh6CC2/2vgRd0fJRCitpge6ZfIEhARSWAiZy7a3JehDJAWVRl9AFlUutAJDMH6slOYqk0IrBKxKeqizy2IN3uFFRPVzmUYjhWqTrW3NF9ff+8MBuVVSmzJdirHOp8HullhuEOM63Pheg0HwzGb0DhXGAC+UBqkS2LzoRwVqiBWIUzfyBxhm7zfYBxf0y36wNJh5bYZRb/7V6K/udAP6+SlpRey/WhiMHT32rxBWY2+SB9xFZzLjDckE9hXug4UBwEfRWHxLJKiqUtJ/sCx34WiKL7dtzbp5ap4Af61vY8LM3HEYPB89HpJ82VTcIW2rqc9qK+kP12tCIn4I2NUiV/KOiyuMRnndmTZmGJxcojcT+fsjZQyscZkhtFlLX///T+fj6lIEcAE5dBZ6Fqd+qyzUprqNtl0F+Ui+casZyO2WJhPDJCluBtnw55CsehML0/G/6a93/hSIYHuj9S8BKz+kyRNa+pzlLvsr44IgDdL9zwZpfsTtcSWc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWhQYUtQdkM2b1lzMklkckdjRXRJTlAvaXo2RVM3T244ZjFTREQxWEtoME9Y?=
 =?utf-8?B?dHAzYmEzdDlGcis2WXk3QkxWOGJKTjdKcno0YkY1cnNIS1RpRmV4djFMUjB3?=
 =?utf-8?B?aFRUMXFQRkZoNWNFSEdnTElEL2E5dm10UURGWUo5WG5zb0NBNE1XazB1aWNO?=
 =?utf-8?B?YjB1U0R0V2s1eHgxSjREK1ZrRElwcmhTWHBrMTJ5Nnd4L3NkVkw3RjdDYzlO?=
 =?utf-8?B?WkROdzByWitsVHMwMGltQms1MDRPZjFRelpTVHFXaGNxckdVUWlBdWZNbWd4?=
 =?utf-8?B?TmNVeGFZQk9SUFZwVVFqOHhmRjFrWEFxMjNtemNHajNWeUw1U0FJSWZvNlY5?=
 =?utf-8?B?ODRRREhLZVBvK2kwcW9yQ0d1UHdiRFFaYzUyWElnSTE4YlVWWG5Cb1Baakor?=
 =?utf-8?B?bHUwV2FyUmxYTDVWNWtsemVudmlnSS81cXZ3cTJMUlBUL1ViZDB2UmxrUkZj?=
 =?utf-8?B?TmJSSm5zVWNSTG5OR3ZidU1SNVgzMTZ2QjhhOUlqcUptOEh4SkFtVVJ0WWFX?=
 =?utf-8?B?dHJJSjBhVTlZV2VqaWVXV1Y1OWROVFF5anE0THBRQ2RtaE9La2U4UzByTnY1?=
 =?utf-8?B?Nzk3UDEvSjZVZXVWZ1UzQWZsanVzdTcxMlRGR202cnZMVGxDdWxhL1ByMm96?=
 =?utf-8?B?MnViZkpmOFZnNUV3enBRWFg2MjdYNTAvZ2hYLzJDMlZyN21yRjREUTZwZFlt?=
 =?utf-8?B?VG05MlRvNEl5bWJxQ2dtWmo3RVcwK2pTRnJJRHdnQlBCYTF5bUxPeFNwUUI2?=
 =?utf-8?B?ekp4ekREcTE4ekp4VWRYM0NsenRMa1p3allzQTZGRE83dmllZ2RWU3BVLytL?=
 =?utf-8?B?TTNRM3BaRmxrZXgyMlNiejFlRy8vZjg3a0pZSnNHTjVxT3NIS3hvU1A1VXE2?=
 =?utf-8?B?SHVoWjRZVWZyd2YwdTl0enFrS0NnMGVBd2dmOUZZYWozc2lrN3VMUUMxNU5T?=
 =?utf-8?B?bU9iZ2dCVUd2NXRIV25QUUZadXdoSm1UbDZBNDBONVhGWHFJN3dCUXZhUTBU?=
 =?utf-8?B?ZVprZGtEQlRjTzBNQjJvVVd5c01HU2R5a3piTG1JQ0U5a2p1MTlLbENLWUpO?=
 =?utf-8?B?SmJ3S0FDSmpsUjQrYWxJVnVkNmtwVWN4OTgvaTBYY1hCUFFCdUxSaEMxV2gz?=
 =?utf-8?B?bENHNmtmTEhkR2dId25ydkVlNnAzT1dTTGlXQW9pVmQvNG1CMWU4TGFMemtK?=
 =?utf-8?B?RWNjeWZody8xN1hMOWFOcHJ4cVcxMElzZng4UkJvbnZWN3czd3Y4REtWQTRw?=
 =?utf-8?B?NHBZNnMwNGFOeGNDWjB4M1Y4NWwrakxaR0hRRzNGMVJxakdMZXY1b2I0Z0JQ?=
 =?utf-8?B?clk5aWZjSkxYQzlpKy9KZGl1VnFCNjZvNWJYd2F4eGhqUE9sdklvV1hNZ05o?=
 =?utf-8?B?MTYwTWovVlA5elphRlA5ZFJWSmVDN3h2eWlFRkVBTU9LdWE1L2tvdnFEUDlm?=
 =?utf-8?B?RE5LZG1zTmoyRXNmblc3SUdianphSThKWldFZncycm4wUVh2MlEzNFFqVjRt?=
 =?utf-8?B?NDBTZ2JGanNLWHhtMnJtQUxBeDZyZzBvU2prVkdldExEK2FZeXRvVldma2tI?=
 =?utf-8?B?NXNDNHo5akdiaUo4RTFDOVFLQmNZUU9SWFJKdy9Yc2NRbnFkQjh2d0VKZUwz?=
 =?utf-8?B?UWtWVWVzTWVLT0QvOEk3b0tlRHNJNlg1emswWDUrbmFJR1p2ZzhJdEZ6UFoy?=
 =?utf-8?B?WGRBZVBhSTZNeDVhZWovVEJxMytMTW5lWTA5cjQyV3pmekVkampiMjNYWFNU?=
 =?utf-8?B?OUptMEUyeTlMR2JURnd5ZWo0VXlhZUdWcEdQdXR2OGVyYVZJeWlIbWtTemtk?=
 =?utf-8?B?YVkxS1N0U3Bta1V3MUtzTFZJZFRnb0V6aEx0R3IwRnZOK2c5ZVVuOHhrZm5J?=
 =?utf-8?B?elI1OW4zamdLQW9LblpLaDhUekRJQ0k0RE9DMmF0SVFZaVlNajhUSVM5OW9C?=
 =?utf-8?B?R2JLK2dKckVXQXBiZFhBWnYxZk02Z0Nnd01KWXBHTlVRYitnek9Kb051NFNV?=
 =?utf-8?B?b0t1Q2ZyS2N6VDI3TVdxbnhmYnBDcjVrc0twYXFSckludGE4R0lUTk1hNUdK?=
 =?utf-8?B?anc3NnFmakI5TkVFb3czRFJWN0NqY2JoOTNUeDM0aWxBbW4wWTZLQXRVMVVj?=
 =?utf-8?B?cTFJR0F1MnZoZSsxSWh5N0l2akEvaXdpdzh2S0NGczQzNTFzdDJQcktad0lJ?=
 =?utf-8?B?a0dCcElTekl5M3lZeHpaTG45cjFrMWtyQ25sVzNlY0lIY3R5aXNLZFZhbktM?=
 =?utf-8?B?NC9xNWpEQjdIUDg4RW5TVnBZelFWWXdYZnVxdmxXNGNpZk9yMDYwMGovemhw?=
 =?utf-8?B?SkI5WWtTM0tuem5rUy92N2t5eG94Q3BERGZFUGxEYlRFTlVjSnZUb1lMVnlv?=
 =?utf-8?Q?/i/A3Ym8RZN0nUyI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9219F57A26C0A44AAD5D2A468B232267@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hvFL3Kg5GJt9Kw2lWCKIXiEX+VavTAonzr1ocRzXs0a8E12dlH55Vmm7hcGjRSpUo0d9aAMBNhBfgZm1I1ni1su+5Rx7FK/ybQNG3kE/q/nKD/XT8HMRJF4hNBPV7nvxwDEqk6QPeblW7QJKgDgaZ99YctfFGqToC5YML3bRO2DmxkI5hDqQXxiSXocBaLNmGiTlaGZYZJQBEbELgFMpwcNfSeDe7uPVsGy8cEwVAXeRd5hkbOFlyCa7MOPrubDKZFS7zvxEHZlvIRaiKC+P/iaXi1enNLnk4UodoG9JNwgshM3t7TWcOmZFxAz2feCDk/kTh2X7Zaz4CYL+IzRmzA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c914913-bbfa-4e78-dc99-08df1a98e7af
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 00:06:53.3627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldeAKv2u2mtmeRIizI8LOUUFfDOIcP9qJsZQ4kL7dC/LMXlZ0Jx/e2DsKCypE/TpIEoe5Yrl0rpjYkyzeXAKRFXaig9E4l5L+VV4qagyh54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9565
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTI0IGF0IDEyOjEwICswODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToN
Cj4gLS8qIFREWCBNb2R1bGUgY2FsbCBlcnJvciBjb2RlcyAqLw0KPiAtI2RlZmluZSBURENBTExf
UkVUVVJOX0NPREUoYSkJKChhKSA+PiAzMikNCj4gLSNkZWZpbmUgVERDQUxMX0lOVkFMSURfT1BF
UkFORAkweGMwMDAwMTAwDQo+IC0jZGVmaW5lIFREQ0FMTF9PUEVSQU5EX0JVU1kJMHg4MDAwMDIw
MA0KPiAtDQo+ICAjZGVmaW5lIFREUkVQT1JUX1NVQlRZUEVfMAkwDQo+ICANCj4gIHN0YXRpYyBh
dG9taWNfbG9uZ190IG5yX3NoYXJlZDsNCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2NvY28vdGR4
L3RkeF9jb25uZWN0LmMgYi9hcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jDQo+IGluZGV4
IDBjNmNhNjUwNzcxYS4uMTQwOWIxYTMwY2M2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9jb2Nv
L3RkeC90ZHhfY29ubmVjdC5jDQo+ICsrKyBiL2FyY2gveDg2L2NvY28vdGR4L3RkeF9jb25uZWN0
LmMNCj4gQEAgLTgsNiArOCwxNyBAQA0KPiAgI2luY2x1ZGUgPGFzbS90ZHguaD4NCj4gICNpbmNs
dWRlIDxsaW51eC9tbS5oPg0KPiAgDQo+ICtzdGF0aWMgaW5saW5lIGludCB0ZHhfbWNhbGxfdGRp
X3RvX2Vycm5vKHU2NCByZXQpDQo+ICt7DQo+ICsJc3dpdGNoIChURENBTExfUkVUVVJOX0NPREUo
cmV0KSkgew0KPiArCWNhc2UgVERDQUxMX1RESV9OT1RfUFJFU0VOVDoNCj4gKwljYXNlIFREQ0FM
TF9URElfSU5WQUxJRF9NRVRBREFUQToNCj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+ICsJZGVmYXVs
dDoNCj4gKwkJcmV0dXJuIHRkeF9tY2FsbF90b19lcnJubyhyZXQpOw0KPiArCX0NCj4gK30NCj4g
Kw0KPiANCg0KLi4uDQoNCj4gIA0KPiArLyogVERYIE1vZHVsZSBjYWxsIGVycm9yIGNvZGVzICov
DQo+ICsjZGVmaW5lIFREQ0FMTF9SRVRVUk5fQ09ERShhKQkJKChhKSA+PiAzMikNCj4gKyNkZWZp
bmUgVERDQUxMX0lOVkFMSURfT1BFUkFORAkJMHhjMDAwMDEwMA0KPiArI2RlZmluZSBURENBTExf
T1BFUkFORF9CVVNZCQkweDgwMDAwMjAwDQo+ICsjZGVmaW5lIFREQ0FMTF9URElfTk9UX1BSRVNF
TlQJCTB4YzAwMDBmNDANCj4gKyNkZWZpbmUgVERDQUxMX1RESV9JTlZBTElEX01FVEFEQVRBCTB4
YzAwMDBmNDENCj4gKw0KPiArc3RhdGljIGlubGluZSBpbnQgdGR4X21jYWxsX3RvX2Vycm5vKHU2
NCByZXQpDQo+ICt7DQo+ICsJc3dpdGNoIChURENBTExfUkVUVVJOX0NPREUocmV0KSkgew0KPiAr
CWNhc2UgVERDQUxMX0lOVkFMSURfT1BFUkFORDoNCj4gKwkJcmV0dXJuIC1FTlhJTzsNCj4gKwlj
YXNlIFREQ0FMTF9PUEVSQU5EX0JVU1k6DQo+ICsJCXJldHVybiAtRUJVU1k7DQo+ICsJZGVmYXVs
dDoNCj4gKwkJcmV0dXJuIC1FSU87DQo+ICsJfQ0KPiArfQ0KDQpWZXJ5IGZldyBvZiB0aGUgb3Ro
ZXIgdGRjYWxscyBjaGVjayB0aGUgZXJyb3JzLCB3aGljaCBpcyBhIGJpdCBzdXJwcmlzaW5nLiBU
aGlzDQpub3cgaW50cm9kdWNlcyBhIGdlbmVyaWMgaGVscGVyIHRvIGhhbmRsZSB0aGVtLCBidXQg
anVzdCB1c2VzIGl0IGZvciB0aGUgVERJDQpjYWxscy4gSXMgdGhlIGludGVudGlvbiB0byB1c2Ug
dGhpcyBmb3IgdGhlIG90aGVyICJtY2FsbHMiPw0KDQpCdXQgSSB3b25kZXIgaWYgc29tZXRoaW5n
IGlzIGxvc3QgaW4gaGFuZGxpbmcgdGhlc2UgYWxsIGJ5IGRlZmF1bHQuIERvbid0IHdlDQpuZWVk
IHRvIGNvbnNpZGVyIGVhY2ggZXJyb3I/IEZvciBleGFtcGxlLCBpZiBhY2NlcHQgZ2V0cyBhIGJ1
c3kgYW5kIHdlIHRvc3MgdGhpcw0KYmFjay4gSXMgdGhlIGNhbGxlciBzdXBwb3NlZCB0byByZXRy
eT8gRG9lcyBpdCBleHBlY3QgdG8/IE9yIHNob3VsZCB3ZSBkbw0Kc29tZXRoaW5nIHRvIGF2b2lk
IHRoZSBidXN5IGluIHRoZSBmaXJzdCBwbGFjZT8gV2UgbmVlZCB0byBhdCBsZWFzdCBleGFtaW5l
IGVhY2gNCnBvc3NpYmxlIGVycm9yIGNvbmRpdGlvbiBhcyBwYXJ0IG9mIHRoZSBpbXBsZW1lbnRh
dGlvbi4NCg0K
