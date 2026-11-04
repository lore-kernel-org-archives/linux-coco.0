Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793803172;
	b=rID2u3L7oM36RtTc6WuRu5/XrB5VOJRUNNt3+9aSbqO++VIFGkhBik5kMONH0mwOwkU5
	 nCsvXVRZ0wh64YaukCeHP4LfbCKEuirwEzN3licvNp8Mz5zzOgEkIwhHJ26hbNM5hXXg5
	 JAMWUc0fkocz28XMIcp5Bp4wJWoEJqJgV3tlk4SssqHBzcOGYHnbpj6KzW/XRirWlkK1q
	 rlB5YViz7aPPZDVIGLsLBdPXroPuER2MsJjLW7mPF6b9AARA3rcqYatkmdAbqV99ptQgQ
	 pMvwbENX/V70KVaPpGVZk3PE/RG7fBPs/5lA/XcBeuDDpfHiM9f0rZ539ZMRWjN7D1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803172;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=EIzGhEarVZwpLYP4ccor1Q/l+dqv7pYKwYcdmVDoncI=;
	b=IjUNeaYwNRjAlPqK/RYK30GiiHoXNt4IGOO3jijwAAX+IJGPXU0nB/EAsb6SY93AmGTH
	 pZZHtEfV/vMc/Rjp+QS1DB02RluJ7Kw0e0AXOZIEFHXU70RiYFstC34Dfb7I87mGBlzjA
	 lS7btA8BhHHLV1uwzj+t1O6frpEScdPChiOtIVP1lZEjeGHNcJ0bVXk7uuyt/u1VROli/
	 4QvLuKZpofSgiqFzqtbOOuFiSbo2IE+LGA6lPajG92CvZjpWkxXgFVf9jluZxZNpsXsEv
	 yKFh4qJexlsMZ5hdOotEYZFy16T99MmOFerjaz2+9N0cUmNqmovs9sf1nOBw/jRAiFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFF606A326
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 14:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793803165; x=1825339165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EIzGhEarVZwpLYP4ccor1Q/l+dqv7pYKwYcdmVDoncI=;
  b=McdrtjUTLnvLCTTiG31dzp+jnj/n9aV8GwVZ3vuhSmgcWELtqaoAcBKz
   vE/v/sU27ZBH8tqRNYvpeGtfRIoKMvJEl+rZz3HKz1VTxmixTCwQ96hcG
   Xah5l0xGmvp5c2piB/ZmsGwEQYqZm124YtGGiEJe0xBiNSXRLRSA4pDkj
   SqHFWqQbFa6WBHVa3NYjUZaoo/ktnJ1725lG2x/xmz9aM6/51KoZdZ91l
   D78bnh6rSP8CovqU8njO/o89ZsJ2jp0v3xIBDwl/tBwhWz4aKP3nVfuT2
   lMb8O3R8+87nKgj0WHVpECzQxI5AywplPr5HeKT2qLNxUf8R+yqlr8fi4
   A==;
X-CSE-ConnectionGUID: p6u2q9gFScSJgZ0U4B3xHw==
X-CSE-MsgGUID: AzPryBogSAya780K/AT8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2458450"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2458450"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:39:22 -0800
X-CSE-ConnectionGUID: lV6sc8MESkCNWVe44nNUyA==
X-CSE-MsgGUID: DVpjYiqCQbe2urAUIZOOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6836099"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 06:39:21 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 06:39:20 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 06:39:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 06:39:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmOX7Y9eisdTd3fmPu/Ir23Kg4il5nU3dG2mXEx82md1/cNyDFJBnWf1FWdWNhqNkpLlN9YaGJPI3EBmZwiC1vSi6QNZh1IiwDCHf/KOccwqjZ/OqjRgOjMaMuO3dTq/8RV6yXs7g/TC5Hwbt7vn9CW/b1OYDTpWM6EsCvL2Y/mw5FoQEbXxX33pCqlCn+zr9m2zGz3HmxSLJRlCSqs4wp+OlXK3hnyyhzAqSGzJx50pYOrGHld6zR4F5QABkq+Vb9RD7i4x45MgdtMt7C7Wg/wIWw1DR0cbU2wzREsZwsdL9LUyaHc0TnX41Fhl8OAzh1/uTMxTpGiWRG4Z7FfStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIzGhEarVZwpLYP4ccor1Q/l+dqv7pYKwYcdmVDoncI=;
 b=MbEJi0d5goYcRc4k5SEUPzNdXkfzTRBlHLWEHlu+JTkpRRfUr7JaD8+3MGf51mtgrdR87XBXZ/W8rWMkUWGQ1nd+f/kKH9p5wn3uvzkZNvSNvRLshpfN1pimLczP6wLft9A10mhlyPT7MuCAmupfkHFQmkoY+ERNPG6RdLoqtlLpiCif6TUoF1rkqUseqGEgwSN9XfT4sB84ER67dYYCaukJWDsT8tjo+XG388JBbkI085/odbMERstDVpug0gr6noEcMndEKH/ixGHG2WlsO+ayFptrQFBdWUCM8kKZ4LmprtJJxavUGZ/XUhYy54mtlYxaqiAUcVu3gLu3ndopBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by CH3PR11MB8518.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 14:39:15 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 14:39:14 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rF50k7lxnBBE+JUA+1gdhvT7cCNcsAgAISOACACwTNAIAB/ggAgALIGICAB3LugIAAwwYAgADOJgCAAMbrAIAAXtqA
Date: Wed, 4 Nov 2026 14:39:14 +0000
Message-ID: <b15708f7cd770fdba4082b19488422a376c2aa9c.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
	 <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
	 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
	 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
	 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
	 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
	 <IA3PR11MB91363BF2AFC2ED5E126DBFA792682@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91363BF2AFC2ED5E126DBFA792682@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|CH3PR11MB8518:EE_
x-ms-office365-filtering-correlation-id: 1ce4c060-8bab-4109-87f8-08df3a81662a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|38070700021|5023799004|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: pDuLftjFl+qW8E/M2XvJ1LB8VsRWVCkfVOoQ2bpCEeYj2dSPD0QQXzJ5VFJJxrC4cQatd/dxFJQZ86lQdf7iH1axLv7/+8PsWW6n5NwldLnY8TSnHduChh9MzwLmE+yWUxi3AxgEX20z9gfTBfuEc8KI8cT9XyqRizG2hGCiJhDJExKOT20DvJeLzT8ZTFcfkNdypOnRjUCB1aGr9im1xlAF7gJTTI7x2AZIlylJgIUNCHytq/uM/nNtZdC+JqJT2sLPJMKh+nFCjSvO6hR+fPCOmhGyJSQkv5VAbi+Z5ZPndn6pfOY9xx2nCYCxkkAvRe04a+RhuxAarUTz/XXuT7yWtqezpvh/xIVZegMs5rILHAn9Jxjh837E8CXiB7Fv8KjBZhJhzDv11m2N07mASgZr9y6tnrMDk+YJYzzx7EfbCsPEidhfGNP/BQ4781qrvczp6GqTs+NFKied1qgSnOJlXbxaxvdzs89VMd30rUn+S/YGr5houTraYtwO1zN8V5k+Ss6PmvH5NKb4/Y9zSaM0XUrm8FRaz0++rGVvKqAUGjOG4ARZM4dZKbLoEjZOdKjE/k3y4l60JgNIaxE4AmXasull6HiRJGCcgcRibj7+zNuj3YFKzzoHrVGWl7NhEWv/aCOHEZlprYPczHoWYZIj1or2svH9P+3tYiOxlI+cWxvXjkFQ+sHX/0+FFegOdonHPSRPioZFLcRTYNWf2yaJeQRzttbzz/spU/hQWyI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(38070700021)(5023799004)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGpQK1BHZ3MzODRKaXpqV0FPRTJud21ON3R0Zk9QUHYwdVMzMitoaURLNkdN?=
 =?utf-8?B?dDIzVUxCektqblh3YlRXSnJ2dGlxRTF3ellUZDA0ZlZCYzI4NkJtNmZBMzg4?=
 =?utf-8?B?SGVhVEg1cDl1RzNpRHMrQ3ZaMTdYNlR4dW1GOXF0OFVNYlV3WmpwRnp0b3M1?=
 =?utf-8?B?c3dzWHBEdEgxZTBaVUhuQ1FKSFlZMzRsTWxxSWw4d1Y1c2JhcnR0UnhrRXRZ?=
 =?utf-8?B?RFRqS2EyQVUwNUIzRTQ0bC9ZU0FQWnlnWnUybTFRY0dJQyt4YUlnRUQ4Mm1F?=
 =?utf-8?B?U0VDS3hsSUFNKzhSZzBadUZMUSs5bE44SDgyR1NDTEJHSWUzUkg4emJIZFFq?=
 =?utf-8?B?Z1N3dWZMMURTNE5JSTgvejJya0MxMWFManJVZ3VoM0VMMlFLV0NPb215akI3?=
 =?utf-8?B?OHRWZUhsSVMxZ2FrS0w4d0dLVXlkMzczVjRxdGdFMGN1MnJwZjliUUoxU3Vy?=
 =?utf-8?B?YUVaTWZMQTBraGNLa3JlMG40NEhjYmw1SVBUaU9xVTdRL2ZZYVg1UlhqM1Nv?=
 =?utf-8?B?aS9DY21PbVZnYmRwOUZwU240SnJ6QnRML0xjeHgwdFRoK1FDb2xqSzZRVFdH?=
 =?utf-8?B?MEU5aTVhdGxiczJCbmdLc3E5NmRqa0lFampjSjZFL3pvTVMrd0ZvRmJCSTZN?=
 =?utf-8?B?Y1RYdkZrQ3NYTjRQYVdUL0Z3c295VVB2eXFjYzBaOVJ3WCtqb1o1L0dFNzBw?=
 =?utf-8?B?c0xldDIzQTF6UXUzTFE1TGhhZ1FYNzlobUgvUXFIcmhuR2lTbFpzR3VWOTBn?=
 =?utf-8?B?K2wwanEzN1E4WnliMUR0aVltT3VPZThBanpOY3ZPTDRGZlZKbGIxSUUyV1VN?=
 =?utf-8?B?djFZb1M2U2tpdTdxNHcxYllVYkV4L3RrcWVnOWl2eWUyZ0hRNUMvTVZHWUNn?=
 =?utf-8?B?YU1pS1FJYXFwZXA2RUtCN2pWS2hDajhObzhEVTQwVHd3MkVKSmZmZE5nR1pQ?=
 =?utf-8?B?WkV1bFcyZUs0QVBNUnlzV0FGSElNVXZ4QjN2eDN5M0duY1NWQkl3ZnhTcXlP?=
 =?utf-8?B?VVdOR2VRdjFvTU9vTEY1dEYwbGM4SjdraFBWYmtjZzJRVTlka2NHaTBFYmNr?=
 =?utf-8?B?U0xLOTg4cmprckxibmJjZUZodXNXQmludmpvWExJb2Nwa3lNb0NFL0NWVU5Y?=
 =?utf-8?B?WmliS25MSlowVVdKSXFUdFA1bHZXTkM1N1hLNkVZTktKa3JMbThRTWIvKzJp?=
 =?utf-8?B?RWlTbXpXZytuYk50R0oybkNJUWM1WDZZUjlBTXlwRkpVRkpPTjhlSDBlaXNx?=
 =?utf-8?B?b3Y3Q1pVRllLSWlHdU1VZlVwbFZjdGx2Z05KQ0dNa28zdTJzdmY0Wk55ZXRU?=
 =?utf-8?B?dUxIdS9xN3Iwd0EvcnFuNG5lWnp1elV4eDFXU0t3amMvSGoxM1JFdkZPUXRH?=
 =?utf-8?B?STdJSUIyKzJoSlVXNFhVT1pCRXBLZWtvY09INzVISWIvcWRmeEhTNDYvRFBa?=
 =?utf-8?B?VXpIdlRmRTZyY0NRNXF4MEN5aWpxcjY5dDlwRTJnNG9FM0hNa0Q4cVBGSDMz?=
 =?utf-8?B?U2JHY0VwWDZsTm1MUkNVMi9Ca1FlWkp5Vzl4LzJnM2lpL0xrcW5IRDRiTVpW?=
 =?utf-8?B?OXNEUEREdy8yaDRvbVNicnA1RSs3VVBIclJPN3FjVTExRVh6SnI5UXN2aUlK?=
 =?utf-8?B?bEVmR0RIS3lUNFFzdjFmeStWalVvRGg2K213SjZibU9BZFlHSmNoWm5vb0dZ?=
 =?utf-8?B?OFB6b01ZVmoyK1NRd2RmUEV6WGNLYktUVlhoajAybHlTK3pkUGJ2Y1JIVTA5?=
 =?utf-8?B?QzdjYUJ6aFJCYTYxK2IvcUlDRzBPYnRhbjlucTJFUTljRklGMTRzKzFaT25W?=
 =?utf-8?B?YjVQMWxPaitQWDZwRFhnak4xb3o0RGNxVGRhRm9WSWdWOGdPVTEyaUFUWFhQ?=
 =?utf-8?B?SFZnRTRBdlZXQUhKTmwxc3ZkajNOdGE2M2tiMzgxblkxK0Z0YTRPanNLaGtk?=
 =?utf-8?B?ajdBb0RHMW56RUFZME95Z0hsQnZEbklDYjJMaGI0WHhVTGRBcGlYeGRUT0Nz?=
 =?utf-8?B?NHNSVE4rMUFQajE1N1NqK2RiYjVDbjJITmd6S3dsZG9WZWtOTUtRWGZ3dzNX?=
 =?utf-8?B?UEdyNHRxMWNJd2taNWRPb2d4Nnp0bldDM0E4TGl1WG1heEZ0bnhFeHM1NGkw?=
 =?utf-8?B?WVFWVlpuTHp1WUpSMnRDb3g5OGk1TnkyZjU1ckF3VWFpejZXNVU0bHpqaWVY?=
 =?utf-8?B?SCs5L3JGTUxiQlRDMkdQYnVaWlRSQktsbFRrNWNNWGJXdWY5djA3eStiQVB1?=
 =?utf-8?B?TnJ6NTF6RDR0bG56MjhuYkorWjJxNzVhbjgwZWgyYXQ3bUJaNm1RcUg2NW80?=
 =?utf-8?B?bzJQL25BNVQ4UUFLQXhhSGE1VE9GeHNncHQxSjdRTWM4TlMrZzZGcVVsbkFj?=
 =?utf-8?Q?1p3vsyQUgLj9cJCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5858F5BFB076EE479C93034DE40D189E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1dRRQcDWmAOuAgqY8CK1mnMnqXvAIBLhJYMHCkGrL/6pJiJjOEtQ9p9sEsLC25nuj6Y9b0Tli8p4h5yVPZ7yNL9XTuJCF1LdT9uRyzJgJ7FEdropM1QpeReMfbqEpDrSHraSXZESpAqWjhDRT45NSkC1hkERiXNjxsYWlOb4P1ohOWyi5s28de9l3OgDiM4q8ys6DPO6b6bYQvJq37bFsEDxCrKZc4p0pQurAd8fH5EiUN2oGOoV+z3ex097gL9A79MWGP155YFhO0wq/XBgHC97tgvEkHUBRTuClNni61HMzTGPVz+/dfgx1JJAF2jFQx251d1nRy9/XKLaF4Kq/A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce4c060-8bab-4109-87f8-08df3a81662a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 14:39:14.9121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /K1/xpAJ3YUpMqrJG/btvn3IRm8J9R/hUv8Owytvk2nhiYFTP/rZiqEVA6HFVgjqDjqaW3PRhO09okV3T1FS65ADqq3aSm9Iyj2XceAcXfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8518
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTExLTA0IGF0IDA4OjU5ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gSSdtIG5vdCBjbGVhciB3aG9zZSBmYXVsdCB0aGlzIGlzLg0KPiANCj4gSG9zdCBzaWRl
IGZhdWx0LCBlLmcuLCBhIG1hbGljaW91cyBWTU0gZG9lcyBub3RoaW5nIGluIFVOQklORCBURENN
IGh5cGVyY2FsbC4NCg0KSWYgdGhlIGhvc3QgKmNhbiogYWx3YXlzIGhhbmRsZSB0aGlzLCBidXQg
anVzdCBkb2Vzbid0LCB0aGVuIEkgd29uZGVyIGhvdyBtdWNoDQplZmZvcnQgd2Ugc2hvdWxkIHNw
ZW5kIHRvIG9uIGhhbmRsaW5nIGl0LiBXZSBjYW4ndCBwcm90ZWN0IGFnYWluc3QgVEQgRE9TIGJ5
IHRoZQ0KaG9zdCwgc28gZG9uJ3QgdHJ5LiBTbyB0aGlzIHNlZW1zIHNpbWlsYXIuDQoNCj4gDQo+
ID4gDQo+ID4gPiDCoCBvciBURENNIGh5cGVyY2FsbCBwb2xsaW5nIHRpbWVvdXQoZS5nLiwgaGVh
dnkgbG9hZCBpbiBob3N0KS4NCj4gPiANCj4gPiBIZWF2eSBsb2FkIGluIHRoZSBob3N0IGxlYWRz
IHRvIGJyb2tlbiBmbGFnIGJlaW5nIHNldD8gVGhpcyBpcyBwcmV0dHkNCj4gPiBzaW1pbGFyIHRv
DQo+ID4gdGhlIGlzc3VlcyBhcm91bmQgdGhlIEJVU1kgZXJyb3JzLiBZb3UgcmVhbGx5IG5lZWQg
dG8gdGhpbmsgdGhyb3VnaCBob3cNCj4gPiB0aGlzIGlzDQo+ID4gYWxsIGdvaW5nIHRvIHdvcmsu
DQo+IA0KPiBIbW0sIHllcywgbXkgdGltZW91dCBleGFtcGxlIHdhcyB0b28gdmFndWUgdG8ganVz
dGlmeSBhIGJyb2tlbiBzdGF0ZSwgaXQncw0KPiByZWNvdmVyYWJsZSB3aXRoIHJldHJ5IGluIHRo
aXMgY2FzZS4NCg0K
