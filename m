Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A691353A6B
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 20:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071371; cv=fail; b=XFyPGBoRfOBPD7q52h5NtUDjQC7VtmNCYs2ZS89BEhE1havKj/efM8EOgOGTkO8eS7Dog4nUAOt5TBK+SICbAncSD6rkifNiVJnJGJE+e2kpaYfp+ufBKpSoOlDBlbxd7+zpx9rijXAlIO/hxY0F6THW6Bk7ulhNn0JoabLLg70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071371; c=relaxed/simple;
	bh=Y8fJBxQ9qjGGbthKe3OyGqSNGddafTU7E6BFNaEzn00=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PVwOOpkuSZ3Q9Wp/ro6k2q1zuQwRD59D9pimK2GOpD8wGR8IjyMQagzSw+TBtHwBJVE5g77SF/YWNEhyWbuybZXLQt8Kuc+zl4gnGDbTKvsms9S4vEfumjHq//AAw1/EfE3G+o/iCqZrF515ITWKYi85xMlFDT6BYoE1Og0lzBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GaMyS4/b; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaMyS4/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789071370; x=1820607370;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y8fJBxQ9qjGGbthKe3OyGqSNGddafTU7E6BFNaEzn00=;
  b=GaMyS4/b4g6e7vodGxIbhME72hz/mY+PqlbkYkVu5K0MCc++19H5Jo6a
   b3+myHE4MTXCDsPrkZOQRwVgF7f6JlJJq0nNxE89PzTNCBS85ZilrFmmU
   UKIDXWmYmmcdfjxQjTZAJLGiN7X8AUHbctRq6xbWLhQx4EECRprAy8KoF
   oFGHGCmlmeoLKkrU+JkFzHi8TB5zlYNOLZqkVny+4zkMJ2ov5cZz+CEfH
   r+eQ+nxaMOVi9fEmLp0QGwprcaInf0MSMSOU5laofSzIVviiz0/8BL4JX
   xe7S4t4ANGqbXWAy/0jRNwCqL4X/tLXgMY2BG6Sbbp3j+Eug7Q2zD5kbe
   w==;
X-CSE-ConnectionGUID: tr7MoKdKSL2A1zBATd/rZA==
X-CSE-MsgGUID: v+o5x8fVTMO2B859p/jxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115075945"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="115075945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:16:09 -0700
X-CSE-ConnectionGUID: Yt7r/FHwTOW34Nl4Hv1gSQ==
X-CSE-MsgGUID: TWXKJDweT/Sd/68fdNURWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271260534"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:16:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:16:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 13:16:08 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:16:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPGa0w72VsV4SpLjUdrUrsYkscg0N9fqfzzi34lrAIOCna9UzvbtzdAtuEFEk7XL1/52MQLP76QZq8kS41ucOafeJxMWg1bkQxW+Ze3uwrnXPlUbr+HZKks4kgGjkDColOpaZ5lMJhizOZMHhaBsiwz0Uxp2+qJxy6DsmxYdaFMB/jkhNOvhI99KPsiqbkZ14ARtxg61mCB9mF/Uf1pg47So6dfjEZzpL784ebKQufeqzaZf5przNS72x1xMyHk7K1r21Y1uZJdThwZelxiQOZqsEAxDJcJBuQ98K9UxGgxXXVWurfqNFPTK8dM2CPCRLHSRv6Kpim9PEgP7gaxixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8fJBxQ9qjGGbthKe3OyGqSNGddafTU7E6BFNaEzn00=;
 b=GgBy980sgpcCsS1Ue99igl4rXJhy8MghDCvI+yz96oDu6w3tCCb8unb3l1AhO/xLrq00Ll6jDktCTqZpBmdoh5TLycKQgqes/eH8M8Mwo/2ywNcapcokgr5Wxpg1zdreB2H54x9z/yfFaDCYBSqYStt2+IhPzmigd1MG0pq+rGnv7yaWDS5l+/ehalCfjRt6tnpxX98n0DUnTuuhenfRcgTXeFrph6xSfbKPmBF5h8Ds+AVuQE95YgL875jqJbBQS0c9+JhMbj+1rnNTueUnHGUduQg45GTOupfNfk9lWLNI45lIoFDxlZbawuVfKzElkeEVqx/8ZJk81VFn8eELog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:16:06 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:16:06 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Xu, Yilun" <yilun.xu@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>,
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v6] x86/virt/tdx: Formalize SEAMCALL leaf version encoding
 support
Thread-Topic: [PATCH v6] x86/virt/tdx: Formalize SEAMCALL leaf version
 encoding support
Thread-Index: AQHdQRFLKGzwKs0xwUqL31eZDaoyGrbIQEeA
Date: Thu, 10 Sep 2026 20:16:05 +0000
Message-ID: <49a5893fd1d3748b4b8c5e1842f52ad29b060760.camel@intel.com>
References: <20260910104347.625378-1-yilun.xu@linux.intel.com>
In-Reply-To: <20260910104347.625378-1-yilun.xu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA1PR11MB6217:EE_
x-ms-office365-filtering-correlation-id: 87bb7555-b71f-4095-a505-08df0f785837
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: I01cYxnYxWV1nOVWTTkN6cTQ+FHmRZ92WJV/StgKzjAxSUKlDbZwOPA94I3uvdmiK2CbAM4NHm4x+aGd24A3VCpeAgxcC3D1b/JYf0u3bitwv1H87LCFfDgP0yJZOGJb5yBxP73V+PYEYkZmwefiJAfE+UosgyQTc+pycVbARFNaXFH18uvUHrJExFd1L2Ds9Zc1GyBG6toGlnigq/6jyI9DA9iio1w6Q1gxojHn1GR4m6U6T+PV8LUhsFKWUAmZU+c1DsarejyPzfJo0A/5FWpSFepZ6V7dMhJXuS59eE372CMumx93qmwgmTwdwcN8qRD7j2sj9ep8UoyjHiecBnsXKps5ZAvVgWR1+KRNGOSaurvQPJRzPKIkojWGCUqcmh4CBZg9ag8JoovJ/pnO3qbYZOYFuTWOtGodEgfWTL0EjWZ0WbZMN/JD+FtTZx+IqRn3/lgraAPcbL2sDCsV8+dndAxlcGwFPbES7OzLZTlFfHdaAIrUHpDrdu4n5ETWHzWyH71cI1ai6TZ2wBbzgyNX5ZXNEfx6ZvRSl7xLhgaoZ64LbVb4Omey8lGIMeC1ZyJokJ80R28Ph55/KzDlK/3cDAmGXbCDM6U5/oMyolsPOCz8pdgwdPnQgQs3KMALwXBcCMFcUib7htHpkezq2p8G97jTKwgMJMlZHql5gGHU6dTz6VhI6o9+6F6gvxSl0ku+53tf96SIMh8+hpSs0Gpfpr3FQlbLoYNGbK6JV5s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXVGeFBhTXg3QjhyK1BXT3F5Zk8wUUhaL2p4UkVWWnlCa3RVT0FaMFhOR1NY?=
 =?utf-8?B?SjJlNUlESWdsb2hNSXFmNFE1cytPbmh2TjdDM1lrdUo2L1o2aXY4MkEwd3dB?=
 =?utf-8?B?UkRoS3BKaGdvU0lEZndkVXp2TVlLcWRYc1RRQUloWDNmY2xhUnZCYUVuZ0lS?=
 =?utf-8?B?aldUcGpLWXZnL1h0Q0hwMkMrWmtIUWlQYml4RlBrTFI0NVdMc2VoU0xsYkRL?=
 =?utf-8?B?MmIvZHFOaFRWOFpDOXZXcEMxcExBLzNuSXZJbVdobVhGYk1xMEV1Z0ZzblVV?=
 =?utf-8?B?bisydGNaS2prSmU4WWpjcVdNYWkyRFRMY3F0OHNiTWtBWmFPdlZuVytmWlhN?=
 =?utf-8?B?cHhMSm1PM1UwT29OM1VwaG1OZDhCbG90K3NaMGJSaFdmT2lja0t3eENRYmtP?=
 =?utf-8?B?SEVIYkRwbUJHa2U3ZjM4enRXdkZxendvd1RLK1V2ODcxd0NUYVpLSjFwRmk1?=
 =?utf-8?B?R3ovd2tvdTFIVDBVZlNJWkZTL2IzVjFSd1FFZnZsTkZ1ZlBZc0NhTmJuQ2NM?=
 =?utf-8?B?TG9DaElJL0o5WW9mNXpBYVRPN3NzQmVzOE4wZFAza28zZ3hBRW5nUjlTQVFK?=
 =?utf-8?B?NHRRczZuVFYwWlB4ZC8zZFBhS1o1YUJrWjV5WEpkUEtFTTFPRVNQRllJcDZz?=
 =?utf-8?B?THhDVmpWQUYyamI3UFU5Qk5EY3hDTUVsWFVBSThOWjhQYVdXTDRiUDk4Mmdu?=
 =?utf-8?B?MUR4eUdjNHZLcS90ZTVzREtoTGt5eFBmTDVPT0RUL21selBqTnpoT3ltUzZz?=
 =?utf-8?B?Wjgxb0ZJNDRKWStnMWF4MTg0WHp2UndheFBRMHMwN3B5VStBSGtoNVdNTkJx?=
 =?utf-8?B?QlRPeUJwbWYrNjRnYWJxL21HckYrYlNRSEtwZWlGWUJyR1ExeGQ3ZWNVcUpk?=
 =?utf-8?B?OGRPMUl1ZjYyT2FEZXE2MXZKVmM2WnlnV2JnKytvZEZicTlSMURyV1VjZkZk?=
 =?utf-8?B?bi8vckNuY3NQYW5XNzE0TFl4QXhrVjY3N3FSUmpKVVJYaVRVZllScWh1bFgr?=
 =?utf-8?B?UksrSUNuZkc4NWFiRGV6cnFzazhibzcyQWc5VGNvdmtwaWRHY1UzVURSNjZw?=
 =?utf-8?B?cVJkUGpiRVBSUmRpVndjQkE0K3I0VFhsS3FaV3p2WXExQ2hsNUxjamJMR2Fq?=
 =?utf-8?B?ZExlTTRFenpkdVpJVEZZS0g4T3FJQVNxNnhhM2NieVF5aGJGV0RiTmNqREpn?=
 =?utf-8?B?OGNSOGxEWmlUa25CcC9DQlNjYWJ1M0I3R1JIcHJ1anl1QkVVaFRZeDhWTFJZ?=
 =?utf-8?B?bVZpNklOLytUVTZoRVFwTUF1cVNhTGM4aVYrZ29zb1dXS3kyOStUdk1iZGtq?=
 =?utf-8?B?TEl1YXJMV1RpVkpweDlsM1JHMXNReW9mNXNMK0JxT1ZWOFgxNzRBSVBqZVhn?=
 =?utf-8?B?YkkyMDNMSThxVU9oek5aeW1EOW9YMGVYSE5iWHBvUk55Z3R1TVZWVmgvekhk?=
 =?utf-8?B?aGdwTjczTTAybTZxaXpLd2JWaFZ6VTRYNjVCbGRwNzUxZWpGMUhxSEpGeGxP?=
 =?utf-8?B?NkhPOVl1Z0tKejZrd2l2OXp3M29ma09hcHBKcEU3dENHUnFtMWpUL3dXNEJO?=
 =?utf-8?B?Tklrblc3akN2aXcxcnY4OTZQbUZBUVNobWw2SHZxWmgxRTVwb0JMZnR6YWpI?=
 =?utf-8?B?RWw4YUttbWlJSHg4dzN5dUk1OEU1aXV3M2xVM2c2b1BqYW95SE9TaVUwbFp1?=
 =?utf-8?B?MjZqRVBPNGFrT0RQMDVub2tsTWJIUk1QL1hONWZvam9iV05jVURVeXV0VWE2?=
 =?utf-8?B?aE9mc2ZRelFKcUxoTWtyVlhyMjNJVjdWSDBjU1hibWh4NlA1cmNLUlNLL0FT?=
 =?utf-8?B?R1IvdnB1QUV6TzllcU5obFluNDFGUUMzZ3ZFODU0Kyt1a2JJbnBzZm5LY1h2?=
 =?utf-8?B?VWtWUDdYK3FuWHdPdWw5amhUV2FzWU9QU0dTZ215TWFXbGVIdTJKVlEwdGRv?=
 =?utf-8?B?aWo4eUtuQlBDQ3VnVGw4eHpZQzR0ZE5SRzJkZkFSMmRjOUNwNnNWeXppM3JH?=
 =?utf-8?B?SUtUK0hhQSs1WWwrZElaeFlhbElEN29iK2pjZFpwMVB0OVB0bzFoQk0zZjRU?=
 =?utf-8?B?R08xbUtpb2lhVCtYd3I3ek5kWUdvQVJwVVdVNmo4SHd1ZlJHc04raUNmOXk5?=
 =?utf-8?B?WEQ3MXZSOHJFeThmMVhtUGU5QXNtK2pmbWhzTzJYdGRXVGhLVlNFc09tWm9C?=
 =?utf-8?B?cERyQ1pUV0FBTHREYnZnRGlFaWJOTUFUV2ZVM1M1MUVRaGQ5bE5sUG5wK1F3?=
 =?utf-8?B?cG5QVit5M2hIeXZZVFRUVEQwNndzOWROTTJHTExUajh4ZWhpbXRYb1lSd21J?=
 =?utf-8?B?QThNTHc2RTZVd09EVk9LTFlvRDdqYjJNTDMzWDlxZUhvcldMeU5XZHBrcEZQ?=
 =?utf-8?Q?Ah0McRCpDYFgqV90=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B1C0C3F051ABD4AB379185B5487E04B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q6jRgnKle27LFMIQbauIcBayN6iAnos+G2VouMozNz8/Do1tFWsC5Vk10ZlNRhXiN5yo9vEMwLTkej5iWMJhvNhNQ9dFNEJuykzV3vv3z+T30n6ji5+704AHtKp8bAp7DcTbR0snkoU4KJ60v2gpLczX4mrnXGI/fcRZzSEPk8eA3DELwdheDHdKGb9kpL6mL+xSfcO4qAW5rppRQAq/+GBpG1+YKMit24cem6sn5t342mChdR2nw5xnareun8ABSmHpJ/k2Qgdb8CS87AqUGSFW5zgmMxS1ru8hFa3gH52gMwUFakVlVXK/MTcH1nxMa/mE8Vhxa3VH9SAKpHDvSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87bb7555-b71f-4095-a505-08df0f785837
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 20:16:05.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rugi5JOjcxZrJh0YWkZ1fSDo+3H8ouWENWfwK3FNYSxHLHJ9QoYV8Vj9vCUtaPfuMVHBjXRJf6g7ps3GmOY5zaIa0+xQ//3PkidNCzw4W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTEwIGF0IDE4OjQzICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gVGhl
IFREWCBhcmNoaXRlY3R1cmUgaW5jbHVkZXMgYSBzeXNjYWxsLWxpa2UgQUJJIGZvciBPU2VzIHRv
IGNvbW11bmljYXRlDQo+IHdpdGggU0VBTSBtb2RlIHNvZnR3YXJlLiBUaGlzIEFCSSBoYXMgdGhl
IGNvbmNlcHQgb2YgYSAibGVhZiIuIEVhY2ggbGVhZg0KPiBpcyByb3VnaGx5IGFuYWxvZ291cyB0
byBhIExpbnV4IHN5c2NhbGw6IGl0IGhhcyBhIHNldCBvZiByZWdpc3Rlcg0KPiBhcmd1bWVudHMg
YW5kIGRvZXMgb25lIGxvZ2ljYWwgdGhpbmcgbGlrZSBhZGRpbmcgYSBwYWdlIG9mIG1lbW9yeSB0
byBhDQo+IFZNIG9yIHJ1bm5pbmcgYSBWTS4gVGhlIFREWCBhcmNoaXRlY3R1cmUgcmVmZXJzIHRv
IHRoaXMgaW50ZXJmYWNlDQo+IGZ1bmN0aW9uIGFzIGEgIlNFQU1DQUxMIGxlYWYiLg0KPiANCj4g
SnVzdCBsaWtlIHN5c2NhbGxzLCB0aGUgVERYIGFyY2hpdGVjdHVyZSB3YW50cyB0byBldm9sdmUg
dGhlIEFCSSB0bw0KPiBleHRlbmQgZnVuY3Rpb25hbGl0eSB3aGlsZSBrZWVwaW5nIGNvbXBhdGli
aWxpdHkuIEJ1dCB1bmxpa2Ugc3lzY2FsbHMsDQo+IHdoaWNoIGRvIHRoaXMgYnkgcGlja2luZyBh
IHRvdGFsbHkgbmV3IHN5c2NhbGwgbnVtYmVyLCB0aGUgQUJJIGVuY29kZXMNCj4gdGhlICJ2ZXJz
aW9uIiBudW1iZXIgZGlyZWN0bHkgaW50byB0aGUgYml0cyBvZiBhIHJlZ2lzdGVyIGFyZ3VtZW50
LiBTbw0KPiBpbnN0ZWFkIG9mIG9wZW5hdE4gYmVpbmcgd2hhdGV2ZXIgdGhlIG5leHQgZnJlZSBu
dW1iZXIgaXMsIHRoZSBTRUFNQ0FMTA0KPiBsZWFmIG51bWJlciBhbmQgdmVyc2lvbiBudW1iZXIg
YXJlIGVuY29kZWQgaW50byBjZXJ0YWluIGJpdHMgaW4gaG93IHRoZQ0KPiBSQVggcmVnaXN0ZXIg
aXMgZGVmaW5lZCBpbiB0aGUgQUJJLg0KPiANCj4gSW4gTGludXgsIHNldmVyYWwgc2VhbWNhbGwq
KCkgd3JhcHBlcnMgaGF2ZSBiZWVuIGludHJvZHVjZWQgdG8gaW52b2tlDQo+IFNFQU1DQUxMIGxl
YWZzLiBUaGV5IGFsbCB0YWtlIGEgdTY0ICJmbiIgYXJndW1lbnQgZm9yIHRoZSBsZWFmIG51bWJl
cg0KPiB3aGljaCBldmVudHVhbGx5IGdldCBzZXQgaW4gdGhlIHJlZ2lzdGVyLiBBcyBhYm92ZSwg
dGhlIHZlcnNpb24gbnVtYmVyDQo+IGxpdmVzIGluIHRoZSBzYW1lIHJlZ2lzdGVyIGFzIHRoZSBs
ZWFmIG51bWJlci4gU28gY2FsbGVycyB0aGF0IHdhbnQgdG8NCj4gc2VsZWN0IGEgc3BlY2lmaWMg
dmVyc2lvbiBvZiB0aGUgbGVhZiwgY2FuIGphbSBpdCBpbiB0aGUgcmlnaHQgcGxhY2UgaW4NCj4g
dGhlIHJlZ2lzdGVyIGJ5IHBhc3NpbmcgaXQgaW4gdGhlICJmbiIgYXJndW1lbnQuIFRvZGF5IG9u
bHkgdGhlIGNhbGxlcg0KPiBvZiBUREguVlAuSU5JVCBkb2VzIHRoaXMgaGFjaywgYnV0IGZ1dHVy
ZSBrZXJuZWwgY2hhbmdlcyB3aWxsIG5lZWQgdG8NCj4gc2VsZWN0IHZlcnNpb25zIGZvciBtb3Jl
IFNFQU1DQUxMIGxlYWZzLCBzbyBhIGxlc3MgaGFja3kgc29sdXRpb24gaXMNCj4gbmVlZGVkLg0K
DQpPbmx5IG5pdCBpcyB0aGF0IHRoaXMgd291bGQgcHJvYmFibHkgcmVhZCBhIGxpdHRsZSBiaXQg
c21vb3RoZXIgYXMgdHdvDQpzZW50ZW5jZXMuIEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29kLg0K
DQpSZXZpZXdlZC1ieTogUmljayBFZGdlY29tYmUgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29t
Pg0KDQo=
