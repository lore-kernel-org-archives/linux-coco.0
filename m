Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1417B341057
	for <linux-coco@lists.linux.dev>; Mon, 19 Oct 2026 02:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376202; cv=fail; b=bM1RRoGFG3JfvprKn/+ViXikJiOelvA6116Kelhu95jLOXIYie++UB27VOdUcSxDtSutGy+eBAsAtm68WU9Ohzao0qjQtpCmSK4SjZfe/8Imbw8XmsbQKpP9tpBp5U4BYN1mXGll2oSsyDN7DhumjxnPQGFldOtcJKrIyyW7k7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376202; c=relaxed/simple;
	bh=BX62+qyTzXR9Cayb6GJ9/rjr2fwAwOo3bZd0iFBTtXk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hb1J16FDvY0G/lB7In1r4/rFxcatJwP0m/NxBeLVGX6zvC7MhlapOcfJe/s/V6bp6FIwAkW5EHlKa6C++gBmiCjLBugLf/mzV08imjnbFVmcOOsAcVD0fqXRhDrjMlfAZFyweLZf6uEjx/yg1M5nabuhiug3Vg1/4DarkWzyrOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8o7tpPR; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8o7tpPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792376199; x=1823912199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BX62+qyTzXR9Cayb6GJ9/rjr2fwAwOo3bZd0iFBTtXk=;
  b=Y8o7tpPRW6nTLwRnIOyw0vBRSFvR6bvltknQx4ZdqwMtm0ELGwuvfovt
   tFu6s+lL5WEWPX4dTX0/H8nlhAd6KWMSESBLvr2ddhhuQjvmfZTossjqf
   0BhFJd6GJezoVKSxOgv4pKF07SaW+BJHYJKqFu/DhNzv59b3oXjk1Kybz
   KtNIk87j4PCEEu4+7o870c/jeoJo4YA4W3CnjIlMCr58DAKoKrmCMbu/J
   rWsUer6uyzCsEiGdz/Gsk0nhKNwYzEcG4hQ4iWtsU73psH3MZG83Kh3Aw
   Ej+hEYFouylM5eujDGsFZJjB43Oc6YUMAGwp8VqT6HBqL9AAqFg7b+aUf
   g==;
X-CSE-ConnectionGUID: nUSNqLBjQdSfUZrGwHfMkQ==
X-CSE-MsgGUID: 82xGOdioQHCMeXgPBgjaJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="938854"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="938854"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:16:38 -0700
X-CSE-ConnectionGUID: LbgxOMG8QgmDS/oJj0D7TQ==
X-CSE-MsgGUID: S/5oxdu9STiOxbp/dYMT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4205057"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:16:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 19:16:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 18 Oct 2026 19:16:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 19:16:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIdQOOJB6RjKcV5CA5GynF9LStBAzdzYK3n8voO/P6Tv6oEonp4bcXVKlpaHIsjTfL7A3UgQSLeSQI1IQN2y9qznSyXDKNuXQAQHhQ+TEes3ylcRXp9ZuQobshjaZeLYuiiy3/Y9rhUufEZIZTDK17uqreWCISpVtC/SGhDFG3a+o0i513ehwkty+MhNu7gG2G1BGOcpvcBEcLjsV/w6lXxQdO8p/oGGWoRJo0Bl7KhFVst/YegNY6bOScVJkNll8Zlqts6zjiBNyI3RRGSFYnIeujEaZVOSWNf6iOXb71i7xBsWgIGkUtE7bU+Xu8NsyessZpS4StsTEkYjCLs9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX62+qyTzXR9Cayb6GJ9/rjr2fwAwOo3bZd0iFBTtXk=;
 b=sOBEv2Alv4Pl9QQA+q6lrQ5oip+AUagllo6j99HTtDOtMHm4I93QLXzK2Qzs5hC1h07gl+abB0OVk7qRFxsAgv3nB7MZVY2O1k1W2Y76RijSU6ZUVQq/+qgfod3zucq3bLlSCXTTZwFLFormzxKFVWF/fmV3IX7qyOVJXtxGIQFS9q2LTmukO+3wGe8LuwMYOp95EG7ktD1rJ6g1umaplHhmzG58XRKbWztwmS/tLmNmBrAL80/znCNE+/nZhAPQsqHMzgEss13Ftf96MdpbW8PQ+yJkURP091DWvKB3ZdcXI1pRFD5bWt+pfGsFGCnalFc8c4Korkgre0mefhq2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 02:16:35 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 02:16:35 +0000
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
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcCNcsAgAIPpMA=
Date: Mon, 19 Oct 2026 02:16:34 +0000
Message-ID: <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
In-Reply-To: <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV1PR11MB8818:EE_
x-ms-office365-filtering-correlation-id: 72b48df5-f909-4547-c452-08df2d86ffd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|10067099003|22082099003|18002099003|3023799007|4143699003|261009223027099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: 33clY+ojkeYtvuQTxljP/gmCG9vlS4hlz1AprSe9xPEGx0yYrTj0muUpYO0k9IJmxbLpkYK6L0bOFRDtefW2ow82T/PQaIyGWFph73aMz/8Vvq1jUaKXQJBUdu73MqKfQhOCf2THscEcibQ/fdcroOZMwLXY6Y1IBIlyEzlUkVJofpK+kXPuESZ1vbB8o0nRa3hSrsTD0EV1n7dV172sQpD2W0lw6VtBpFxuMyNUbenkk7zFLyQDQBNFO/5dRIxhMECXdCRJin8QURJHcpnomqhG9iDBLQeXtUsCbu7OBYJa+S4TIchH/Se1jaMeZTO6iuHI70lUCRyP0cr/e+nYtEq9opeaNKgsVmVUFj/HY8lhJkgPTiG05NdzKZw5IJnMMY1d531mjodT/z5jWkgWKhLbzazu4gWYDvcFmo/vuUd8+Z5ZRVyZyeu+ZNE/k+cTqK1jNJbd0jZNJ8uTX1npUw104024/qaX76+1OAWSG9T2cQStl53EnMdFLzp9Z7Xp+14ZedJwughzpqpeWO6enkWSsUWz8OWxLzR9LsLahKqhTbdPbvsmAJeInMpusImt3QxX+hCqTUiq5gw9GfMr3EcRhpJK7YUYBmFQOK+VSbGc3vLm9/g0P3rIM4IWCxi6afwn5sRyARfQeVT0fikonAKPgk/55F8q+MCu4HrYt9e+hVVaiq/LrpnFpm3EGQas7p0ysvnHyIpD+4/+nlzusCl4mekCSFMFgj3+DMXKOZ0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(10067099003)(22082099003)(18002099003)(3023799007)(4143699003)(261009223027099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUoyZGM5WUhwLzR5M3l2bHdDQVpEK0RsNGhURG8yYnVnR3EvSW5UdlYrY0NN?=
 =?utf-8?B?alp3bVk5NHNTR3JRREZHcTg1clN2SGJIVTVPS3pxb2Y5U0NYMHVySWNLWkg2?=
 =?utf-8?B?SE9kUkNIUndUKzNLUms5Z3QzaTY3MmF0eHFQMjhXOHNORGRjb2QveWZvRVB4?=
 =?utf-8?B?czdyRUZSRXlvbVNVOWJ6LzNvbllCdSsvM3BpMXZENU55eEJVWC9tdExqK2xV?=
 =?utf-8?B?cHM2YTV1SmdGank4dVpudFRYQisrV3VuS1U4S1ZSK3djbXB0MnA3MmJTVjhR?=
 =?utf-8?B?R1p4cVBmemFTMEs3U0JuTUdHT3hHd3lEYU1wb21CdVdpOVZES3Z2QW53STVj?=
 =?utf-8?B?c2JSRnk0ZGhoNDI2RFFtSmhwMk1LZytQcG12VG82aU9RcXZUN2hWaENjN3BY?=
 =?utf-8?B?eHdrNmg5ZXR3UkllOTJwYnZDczBzZXVjQ2NsNjRGQUtPblc4OHJ0cmxJSUhU?=
 =?utf-8?B?bXdyeGNxeEVUQThQS0hSWXpkQ1gwM0pJMmNIUzZ6S1ppdml4WlZXTGZLaG5Z?=
 =?utf-8?B?Tk5CRmN2a2xmajYyR2lQNjJsRndXL1htWXZjT1QxcEo1ekMvb3U5RUFvRDlS?=
 =?utf-8?B?d0p5QTArY09CY0wvSW1uNzBhZU1EOVlGNG8rVnVIc1FaM3FGdzZXejkvVkNI?=
 =?utf-8?B?Q0h0MWFLRUdwUVRHbDJ0cjRVTFgxMWw4UDdocEw2VGk0SzR5Q1ZMK0ZFS0ls?=
 =?utf-8?B?bkhNRWRrMUM0b202OGdGblRpLzBvaDV2N2pkcHZGY2MyUHAwSDlPOS84WURZ?=
 =?utf-8?B?eGo0SzRQZHNMRms2V3RVU0c3L2w0bVpVQmtQMmdQUkg4ZXg5RkpsNXlvTVJT?=
 =?utf-8?B?NTZHWEFGS29qOGZwSmdDMEVnSDZCeGFTODVZU1RJd2JoVmRmenZyK0djTkJo?=
 =?utf-8?B?WGRTMGY2WktTNGxNODQyZ1hGdGppbmMvVDhSanVvNGVRVW12RXljU2FBUGdN?=
 =?utf-8?B?SENlTkpaR1JwbWVkaVQyOFFhaExxQldCYVdFY1VSZHF0NDhuelYrUU9qUmt6?=
 =?utf-8?B?MVpWUCsxdldidFFJc3V5MHZIaXA2cVJpdGcyVndXeDNHWGVDZ0NiK3diclZi?=
 =?utf-8?B?MFVtWG5Qd0psaGVOMnVRU1ExR3JTVEhabHVhRzdKOGZwWTZPc2V2YzJiUGNr?=
 =?utf-8?B?QWx2cVNpK2NtcGtiWHd1Wm9PdDBNb0FjdG1RWk4rQjl3S2xSRU9lWG02MVRW?=
 =?utf-8?B?UEVXTlNJMktuT0FvNFJ1Yy9YQS8yc2QxWEZNMjBtem51b2VGRkdwc0VUU0dP?=
 =?utf-8?B?TUVEWWtHSkIrT0RIMEpYUEFySjhxSTd1a1BxTmFQcDFRK1BrdnIvcHRCYXJZ?=
 =?utf-8?B?R0J6cWFXb2d4SVBTUXg1Q1ltQ0ltSHhUblBVNGtmZXhQUUJ1MGFuS3hVYXVO?=
 =?utf-8?B?WWQ4VXdOTjRhVmo2U3F1bU5VWkl6MUQ4QlJYeE5mT3pSbjROdVdzeVhiNjB5?=
 =?utf-8?B?Ym5SS2R1NHYyNE4rVEpkTGszclJRaEFPY3NhU2o2MTM2WEQ2eGc1T1pDTXU3?=
 =?utf-8?B?SmpxRHBQM1lFdWtMMTBBR2g4Mnk3R09HeFc1YzRtMGt4YjZBUDdCdzRDVGJ2?=
 =?utf-8?B?UFRaZ01TOXFCa0RvY1ZnMjlDd1o4Y25ONWRSdmZPS1ZyWXB1dFJ6clZZWTQx?=
 =?utf-8?B?QTZtc3FqY2tBWEJ1V08zRnRTcUZ1VmZzOGZzb0p6UDF5U2ErQjZRYTViTGM5?=
 =?utf-8?B?Qnd5T1FSSG9mUkZGNGpaZmFJd2lvSDFZeE1RUTRNL05PWE5jTHl3M20wSHpF?=
 =?utf-8?B?QWJ3L2lhUm5nSExvZFhsWElSMjVHZmZZRFhLL3U3MG1tZHZ2TzFZNTZDNlZw?=
 =?utf-8?B?VW1xWDNlV1JnVVhVZEV6NDdFQm5Vb2wwTVJCTHFEYkdXWlpqeGQyci9RYXZE?=
 =?utf-8?B?bzNDaTZuWWUxdjMrelBkUnF4M0x6N1VxVk1tQ0RrS3BHNEVuSDBLdFdCeUcw?=
 =?utf-8?B?UFRZQUExK2RyYUVDeXJaOUd0VmZvaldrclFnLytsaEpnYldvczluYytEVnpG?=
 =?utf-8?B?eWpsZS9zTlZkL0VhZEZOUGxubUNWcE50ZG9YTVJMaUZzeUZDZ2RjRm5DbHBS?=
 =?utf-8?B?TlZNNE42c3A2d1NpSFZVaTRmM2FwcWxJSURiZ3lEME5zNUVlRW9EZzVhTS9k?=
 =?utf-8?B?c0hreUx0WHhnZW40eEZ0Lys3cWczSEp4WmlHTlFEcHM0WHFldm9oT1JJdmti?=
 =?utf-8?B?SGFTRzAxenVtNGpsSWlGVXlPVk5ZVmJ1ZFlSYzNwUzk2UkhVRkVyQWExc3po?=
 =?utf-8?B?QW9aVmJWd3ErMVk4TG1RUFY5ZWJxUmo0Rk1FRU80eEpQcVVha3pCUWRiZ0pY?=
 =?utf-8?B?L3hJUzlsTk9vRDJnL1V3c1VUL1RJV2t4T3BWeXRvMm5ER3ZHd1gzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UlGw6+9cnlD3SExqfWBh9bCU96cLI+TQlEA7ygK3zBBdoxJbPuma0Au75Ecgx4XzcLgOj+G100H2tfeYtdt99jNQRKqiyySylT4zC/H0xRsyIxCFrVNAkvGQyitBhdA+gF7EYvY/hqqr2oVXmh1sBlqx/L2KZnFE7aYmT3sI3Td31Vqu6S2O42kQQ5Dvrx5vu89AJJjm/pC/ooc5o1BfUS0MNcl7N5lC8D4NjifX/ntlGNpqJiHNOOGGNTkbiZqHYJYoksPC97mhhWi5MUw5BZPhfy0uaFRpOtGlyhBKB6Hr3jT4GRxQbSd8bumfber/IdEGFmK/HBi28HOR8FcVdA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b48df5-f909-4547-c452-08df2d86ffd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 02:16:35.0297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zc1E+BUGWUfz3siM45Dx64+tgQppIMa6Iu00BYHnVmGbdp7zrAbj4lylogAnEONBwTthdw0QgeKMUMelXhzR8wrIQNpOH7fz75El6T6f0Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDYvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogU3VwcG9ydCBUREkgYmluZCBhbmQgdW5iaW5kDQo+b3BlcmF0aW9ucw0K
Pg0KPg0KPg0KPk9uIDI0LjA5LjI2INCzLiA3OjEwINGHLiwgWmhlbnpob25nIER1YW4gd3JvdGU6
DQo+PiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgYmluZGluZyBhbmQgdW5iaW5kaW5nIHRoZSBUcnVz
dCBEZXZpY2UgSW50ZXJmYWNlDQo+PiAoVERJKSB1c2luZyB0aGUgVERDTV9PUF9CSU5EIGFuZCBU
RENNX09QX1VOQklORCBjb21tYW5kcy4NCj4+DQo+PiBFeGVjdXRpbmcgVERDTV9PUF9CSU5EIHRy
YW5zaXRpb25zIHRoZSBUREkgc3RhdGUgdG8gYSBsb2NrZWQgc3RhdGUNCj4+IChURElfU1RBVEVf
Q09ORklHX0xPQ0tFRCkuIEFkZCBhIHNhbml0eSBjaGVjayBmb2xsb3dpbmcgdGhlIGJpbmQNCj5v
cGVyYXRpb24NCj4+IHRvIHZlcmlmeSB0aGlzIHN0YXRlIHRyYW5zaXRpb24gc3VjY2VlZGVkIGJl
Zm9yZSBmaW5hbGl6aW5nIGRldmljZQ0KPmxvY2tpbmcuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Wmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gICBk
cml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jIHwgNzUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCj5i
L2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCj4+IGluZGV4IDFmNTJhMTg3
YjMwZi4uZTM2NTE1ZmM0M2VmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aXJ0L2NvY28vdGR4
LWd1ZXN0L2Nvbm5lY3QuYw0KPj4gKysrIGIvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0L2Nv
bm5lY3QuYw0KPj4gQEAgLTE1OSw4ICsxNTksNjcgQEAgc3RhdGljIGJvb2wgdGR4X2lzX2Rldl90
ZWVpb19zdXBwb3J0KHN0cnVjdA0KPnRkeF9kZXZzZWMgKnRkZXZzZWMpDQo+PiAgIAlyZXR1cm4g
ISFyc3AtPmlzX3N1cHBvcnRlZDsNCj4+ICAgfQ0KPj4NCj4NCj48c25pcD4NCj4NCj4+ICsNCj4+
ICAgc3RhdGljIHN0cnVjdCBwY2lfdHNtICp0ZHhfZGV2c2VjX2xvY2soc3RydWN0IHRzbV9kZXYg
KnRzbV9kZXYsIHN0cnVjdA0KPnBjaV9kZXYgKnBkZXYpDQo+PiAgIHsNCj4+ICsJdTggc3RhdGU7
DQo+PiAgIAlpbnQgcmV0Ow0KPj4NCj4+ICAgCXN0cnVjdCB0ZHhfZGV2c2VjICp0ZGV2c2VjIF9f
ZnJlZShrZnJlZSkgPSBremFsbG9jKHNpemVvZigqdGRldnNlYyksDQo+R0ZQX0tFUk5FTCk7DQo+
PiBAQCAtMTc0LDYgKzIzMywxOSBAQCBzdGF0aWMgc3RydWN0IHBjaV90c20gKnRkeF9kZXZzZWNf
bG9jayhzdHJ1Y3QNCj50c21fZGV2ICp0c21fZGV2LCBzdHJ1Y3QgcGNpX2RldiAqDQo+PiAgIAlp
ZiAoIXRkeF9pc19kZXZfdGVlaW9fc3VwcG9ydCh0ZGV2c2VjKSkNCj4+ICAgCQlyZXR1cm4gRVJS
X1BUUigtRU9QTk9UU1VQUCk7DQo+Pg0KPj4gKwlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlY19i
aW5kIF9fZnJlZSh0ZHhfdGRpX3VuYmluZF9kZXYpID0NCj50ZHhfdGRpX2JpbmRfZGV2KHRkZXZz
ZWMpOw0KPj4gKwlpZiAoSVNfRVJSKHRkZXZzZWNfYmluZCkpDQo+PiArCQlyZXR1cm4gRVJSX0NB
U1QodGRldnNlY19iaW5kKTsNCj4+ICsNCj4+ICsJcmV0ID0gdGR4X3RkaV9yZWFkX3N0YXRlKHRk
ZXZzZWMsICZzdGF0ZSk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4gRVJSX1BUUihyZXQp
Ow0KPj4gKw0KPj4gKwlpZiAoc3RhdGUgIT0gVERJX1NUQVRFX0NPTkZJR19MT0NLRUQpDQo+PiAr
CQlyZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4+ICsNCj4+ICsJcmV0YWluX2FuZF9udWxsX3B0cih0
ZGV2c2VjX2JpbmQpOw0KPj4gKw0KPj4gICAJcmV0dXJuICZub19mcmVlX3B0cih0ZGV2c2VjKS0+
cGNpLmJhc2VfdHNtOw0KPj4gICB9DQo+Pg0KPj4gQEAgLTE4MSw2ICsyNTMsOSBAQCBzdGF0aWMg
dm9pZCB0ZHhfZGV2c2VjX3VubG9jayhzdHJ1Y3QgcGNpX3RzbSAqdHNtKQ0KPj4gICB7DQo+PiAg
IAlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlYyA9IHRvX3RkeF9kZXZzZWModHNtKTsNCj4+DQo+
PiArCWlmIChXQVJOX09OKHRkeF90ZGlfdW5iaW5kX2Rldih0ZGV2c2VjKSkpDQo+PiArCQlyZXR1
cm47DQo+DQo+PFRoaW5raW5nIG91dCBsb3VkPg0KPg0KPlNvIHVubG9jayBpbnZvbHZlcyBjYWxs
aW5nIFREQ01fVU5CSU5EIHdoaWNoIGluIHR1cm4gbWlnaHQgZmFpbCBmb3IgYW55DQo+bnVtYmVy
IG9mIHJlYXNvbnMgYW5kIHlldCB3ZSBoYXZlIG5vIHdheSBvZiBjb21tdW5pY2F0aW5nIHRoYXQu
IFNvIGFmdGVyDQo+YW4gdW5sb2NrIGEgVEQgbWlnaHQgd2FudCB0byByZWJpbmQgYW5kIGlzc3Vl
IGJpbmQgb24gYSBkZXZpY2Ugd2hpY2ggaXMNCj5hbHJlYWR5IGJvdW5kIGJlY2F1c2UgcHJpb3Ig
dW5iaW5kIGZhaWxlZC4gSXMgdGhpcyBzb21ldGhpbmcgd2Ugc2hvdWxkDQo+YmUgd29ycmllZCBh
Ym91dCA/DQoNCkkgY29tcGxldGVseSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQgaGVyZS4NCldlIG5l
ZWQgcGNpX3RzbV9vcHM6OnVubG9jaygpIGluIFRTTSBmcmFtZXdvcmsgdG8gcmV0dXJuIGFuIGVy
cm9yIHN0YXR1cw0KKGUuZy4sIGludCkgc28gdGhhdCBmYWlsdXJlcyBpbiB0aGUgdW5kZXJseWlu
ZyBoYXJkd2FyZS1sZXZlbCB1bmJpbmQgY2FuDQpiZSBidWJibGVkIHVwIHRvIHRoZSBjYWxsZXIg
cmF0aGVyIHRoYW4gc2lsZW50bHkgaWdub3JlZC4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg==
