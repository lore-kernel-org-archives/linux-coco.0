Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793158380;
	b=sxSv5tkUtstr/UkGdEdzxK1thst0bvYP3wZbAAN0pih92d8iJTiYxNrfn9jewD3Zyk/E
	 kFCXUf43iJ6CoaRxC6lRreN4mq0OZzIb7wc3275Su5zkLL+8wzpL/BBD5SojIrTExbQ4X
	 odzmqYLbUSGxcIL4c7pTzDMstBfwHKKhQvCp5mKtrXCZ5LTUT/e3xHHV8bQwexhv4GH5S
	 7JoWjoTXXhSGwkTlhH7Y7yHHxtdTQgluK16fwclYljZHnn0Wbh7s2qB5mtfSxYlsy1xTV
	 aQjr75WUSuYxO0cYYq2kqk3tL2neMWZ4uerEJh1SEjjb7Eq3Qb+EbilKfIJKWLw96tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158380;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=l4um7QRYsBE53SCmd/U/U5ZPAHePiHLavxTD9dlxluU=;
	b=PfuVfSS4c5YCW9OfSgoCZ0QwkcvxFIY1kqHTQaV9I5f96Ovy/BV8rInxPOL5fgkuvey3
	 uO1v4EdWnNyMHcc4djiPgLaHJ12Y4SwPhNoo3bkbsmGVnyB8VkTemquUsrMJE6OG3vH1w
	 oDr1gjzk9n+nbnfGAKVB6yDrjmStCsm7f1gmzj7tX5wu0rwoGz/MSOiFDfQkLbOp2mrEO
	 p3a/gQn30p55eVf/D3yMEmsY+ezzOxfI4b+TYuJnoveIaHtDVypLBO8M/Ybv+kTHm0w+t
	 3eHtELepFHHP5SW1FC2Bkmf5MVYl5pjB2m+wVkHG1zWzqhuqyMnxHmjJ0pH79qsDraA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVMH9zWm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A779606A31D
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 03:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A779606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVMH9zWm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793158378; x=1824694378;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=l4um7QRYsBE53SCmd/U/U5ZPAHePiHLavxTD9dlxluU=;
  b=eVMH9zWmHCR9Q/xvd2yp7Ibv7g9jiu6z580J5sFzM7TFG+AUu/H/c5BD
   PquAwrDDFHZEECLpti/tirpaaQh8DuCAmI8CmKhaWEvYbpIcl6lg88Zvp
   eC6/graZgsfkhNxRwspF6d4eSBkjNQXkmpzdElOy3PURpPHVTfn/nEyid
   78gfs7Au3JY4HM+Fw9zrQhjcU/IGDMuv6BV/U6J/8Bl6zeScIVD+CK96O
   tvHEot6dUV6+zCY7ebxMpP4pvhv03hLWn66W0DvptyELuwJxQpFCTVNen
   E6ixGdi3HOYb/RA99TZypswixuZJxufqE+hguwpF+7NcvaWxaPFagU4DS
   A==;
X-CSE-ConnectionGUID: HjTt6svHTLuaJgReumBBCw==
X-CSE-MsgGUID: 7dnKeK53Tu2HmhYYahh5Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1762311"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1762311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:32:57 -0700
X-CSE-ConnectionGUID: iqgKchQrSBqA5FP+xasHiw==
X-CSE-MsgGUID: XcE9hGpoSZSXbG/vMAnCFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4623323"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:32:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:32:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 20:32:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWucxBd/CxJeI4S6W2M7qF4cscbxmVyldl6LuX9QmiBb/TVPUeuu+y2PTKIPSyrPA5wcBiIhx+/X9UlkBTAmnyJ3/qrziRwXMSUVAeDYDk2S9kmt9g9zLZ7NW87pBM5jCt4tINEdyGjFJjhPm8wWWdf6f947iBd8d3nNZ9WrTxB7NgtKteBimIOMSbgsd+DkXnnZJjclIR2CV53b6dW2Tmz1W5bKn5BjCzjlO6op/ixJDg3DEf+i6j9ilagOHrv0WVAGjTDC980dY9UtG5JI804J+mxUJvylxzMn9wB6u8+Fx/P4Nx+QolxYFthMX1RqSr7G6mKl+YwknKRAnehIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4um7QRYsBE53SCmd/U/U5ZPAHePiHLavxTD9dlxluU=;
 b=Odl7WLFDgtuMmRuIDaI/kR9cxCu4GQmZsAPqHAfumcGa7vW2oTerdlfEqcOa0xPerP68KN96EOgMdxse2/I/UMSAI1bg7Og1ClhoijaG/H+yWeYqcrJ4kPRDwsg06wMKJ9gXURD/NjS+AcfADt7EKSZUJzrfeUxF43VUj2tkGWEWv0VZdZ7FrUcu8lR6stZiVoaVt+/YJDUCx8MvfqQeQrWW8cnkBeFRYb/x2G6mdvGlSbxbVPupRoELOwzZixWJOgpczyG/c0cRf4A2TbHSezlfNq/vUlA9khVSPYmDSGCIUH4WOVFzXMXL9Baw+DCv22W58myXQiNlTtXOdGtpGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV8PR11MB8536.namprd11.prod.outlook.com (2603:10b6:408:1ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:32:46 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:32:46 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
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
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private MMIO
 ranges
Thread-Topic: [RFC PATCH 10/15] virt: tdx-guest: Set up and accept private
 MMIO ranges
Thread-Index: AQHdS9rOgVTKgp8btE6rbHqQSEDr2bcPfC2AgAMFsXA=
Date: Wed, 28 Oct 2026 03:32:46 +0000
Message-ID: <IA3PR11MB9136EAE3C8C27B34A6A4BC56926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-11-zhenzhong.duan@intel.com>
 <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
In-Reply-To: <328109e1-2848-42a4-891d-7c7c5b40fed7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV8PR11MB8536:EE_
x-ms-office365-filtering-correlation-id: fd01a5aa-b2ff-485b-209d-08df34a42242
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|38070700021|261026140227099003|11063799006|4143699003|56012099006|261026121527099003|261021121427099003|261022075727099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: b2zjVE5nUt/Ww+gno4/IC2qPf0J0SRsQYUvojRK8xBrkZ7zx14jmNg2y21F67bTBgi/uAFCNyilOmzcKGqsVf6WU2/xjao1UmmV4JErhvfDI57YQKDPSF6Vtcr0rDo0jTJKaNsDHFc5UZvMF6FRYJuYnC9pW0+wlxNC66o4Tms5jkOM2QzkpyyKGQIAFTDkp1+i8B/2x7kOOlNEC1f5HzpDswCU45d1oIhsJ6dnyLNOzMWMpiRWtgeAcJvS6A/Hc62Dgt618FO6rh5D3BOMU7kF93bWQqbZdrvDzDBOfyI2IKbGHWL1ZNJgxK4PWeb+AtJ7Sm5Gvh+o0hq2yyRBOGwxS8ccbWqRajT4vCpis9DETJIYazT4ck7o6PqMaJ55PddC9bBOhASvwkhI2B0C+Viwi7o8c3SQBsbhaBOuuLr5O8cW1lO8/mLc63Wyq0Jr4gvgeUKKPug5bKBtAYG3tFAFXfKhLoydwY1qCRgPzXornaHjag2QnYfRxzG/nFPeZfW06H0SP1iuH62MIDfR0mHeiubMTP9zUK7CVbNhe49ZN1v3soIPLrJ++B04GmXqg+I9gYI4K1E3hY5AXE9WGeYVpSeex1cU7l0gm4RhIu1d0xXwL+QoUBx/uLq1myuYlIlzk7r0rSC+L0Nt5BmmjqMhyWSOqxnxt5WgfFPk1ILTf6lL82XH08tj9csn+VGNFQ8L0Xa3jvTRbTEHqa85RBfkw14U2v8LC0TUYvq5c8FQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(38070700021)(261026140227099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTl3dFpPdldjSGJkTG84SndNZDc3OE1lTXFXVUhka241SmtpWkhxd2pYSEhJ?=
 =?utf-8?B?dkV3T1N1Z1RLcGxTRC9uRGw2Rk8rQUQxaDVkMVhoODk5NGI2UmFxdG1waDc2?=
 =?utf-8?B?bGxQOFhqRkpMN29WckQxSWtpTVR1MDhaNXp5K1ZML0E5bWQ2UzdoWUwvbXhu?=
 =?utf-8?B?REg5eHorckhKNDBOZ004MlpGSDNGRlhWdjQveitwWFVyMlo5L3dIVm5FQ2c1?=
 =?utf-8?B?SFl5TXZIY2ZKRThrQVZXUmFaVjE0dUdrV1liSGR5WkxaVGpSeVk4RXk2SUJ1?=
 =?utf-8?B?cVBSVFBFMUx0dk5OVko5MkNVWGNCSk5MbVFXd1crRW1vQllPWHB2cURvdXNw?=
 =?utf-8?B?UmYyRUxKZ2FGWkIyUk5WcXQ1QlZhd29QRHA1Y1BpMTVyaWhMUVFBejlySHVi?=
 =?utf-8?B?TTkzMnpCMjVpZmtMc085dEM0QzlWVnZjS1pybXdRd0s2R2tnWEJVczg3NFhV?=
 =?utf-8?B?THI4OVpRU0w2TVhpVlk5RmRwa3kyMjR1LzVLL0hJWUsvVHRCc1A0MlB4aG1t?=
 =?utf-8?B?M3hwekw4cElpR0JvWWRUOVV2NlIva2ppMmV2TzBFUzBwRmhqbVdldkU4Ni82?=
 =?utf-8?B?MU40MEc0MjB6dVJZWVZyWFFFbGpBUTg3TkRUNnFpWVVIVXI5WGplZExQNHV1?=
 =?utf-8?B?cjNwRXp2S2RmZng5RlZEN3cwekVZeVhqNXIySVBKOWt1ZUZLNGUrNEdvV2ZU?=
 =?utf-8?B?c2dpT2FQL2VTNmM0eElRTTNiRitQY0pTb0U2VktIQmdtamdOdjR6UVYraVgv?=
 =?utf-8?B?ZWVmalR1TkVSYUY4MjlLR3V4VDZkWDVqczA4Q2EraXhNNkl4eG81WnVtVkhK?=
 =?utf-8?B?aERjR3lvQllnTUltT29QYTFWVUJNWUttN2h1OFVtU0s4cmN1cnp1cnFMbWxm?=
 =?utf-8?B?eFZoM1FYeW1tRGVlcnZ3VEVoejQ3eWRUb3NocVV0R0ZuMDk5N29ucHh3ZDdK?=
 =?utf-8?B?KzdrRW8zTTRJTmpyU29wbGlZbFBHMFVHMFZEUytYVlBJMWhzazZBak9jUnow?=
 =?utf-8?B?WkliV0ZDb1I5SnVncDdaakxGbk9WL0xIdUZoYUUvajJBRHBZWFpxbjlNeElF?=
 =?utf-8?B?SG9oMHZMb1V0L1F0VE1PMEZ4enA4YS9BZjhoc0NzZFRoWGZjbURoWWMwSUJo?=
 =?utf-8?B?QmZKR1dFUE9wWUZ4eFJrUklabGw2OWl5dElYNE1lbUZxUTllNFUvRXloNDBz?=
 =?utf-8?B?R21Ha3d0bkV4VVpoeXk2dGVWUnNHd0hxL1ZUd1BISEQ4SmxUdnRod3R2UjE5?=
 =?utf-8?B?RmR6VjlxNEVWRFM0SjF4QitueUsxdUZXV24yblppaGFBZmd2cjZjWTUzR1ZX?=
 =?utf-8?B?SFVkQTkweTg1REVrdDJGdFNuZHRxVGdndjIvaGNEZzliV3pwLzdiQmhCMFpl?=
 =?utf-8?B?cWphaXFIYnZkNGJJUU4rMCtrOFVnVUZsaTJmMWtuU2FVRVZ0ZjFpN3pTRmFX?=
 =?utf-8?B?QXBOOXpObENjajBMQmg1bmRPWmVBZ3BXVlp4OXJpWDQvU2ZhaDNsYVFsMHk4?=
 =?utf-8?B?c3U0NkFqK3drZUdBRkFqQnZ5KzVFak1raXp1WU9ub2RLd0FrK0xvd2hlTW52?=
 =?utf-8?B?ZGZxZUpuWllmYXhYUGs1aTNpbG1ibHR5YWhlMWRBRzhicmpsSkp0dkcvVFM0?=
 =?utf-8?B?bTRMNGtONmFMaEJtMStBZGduWGZ1d2VtajlwemZKNFpoTEJFUTNVZnVXVzJw?=
 =?utf-8?B?Rk1nek1ZdmVmUmxPMlBsZCthbTc0UFppVFJPZ2FvRDc5c3BIRGhSQWhYRmgy?=
 =?utf-8?B?dkpNUVdCNXlHRVcyUm1mcE03N1h1VjMxMzZ3Q2lJYUZHaFc2alhqeURicmdh?=
 =?utf-8?B?VTd1YlZYUnlwNmFmam52dkxSQXlMUGxUUXJuNnpmbmpUMzVsaHB5bDNTME1C?=
 =?utf-8?B?MlBVMFBtYXRMVzdVYnRQb0pHUVd0aERZVURTOHNiUE5mSUpXR2hkNi9LeVg5?=
 =?utf-8?B?bGpOVUNoRnFHUFN5VWhmVVBhanBRa2QxNjFja1Bqak4yY1krTjd6RHFBcjBo?=
 =?utf-8?B?MW41VzZZNUxlZzUwd3Q5RHJmc0FtcVFCVWRkK3RuUVFkY3NZaXBFN2tpcUZU?=
 =?utf-8?B?S0xUUUUrSFZqaCtLRTI0eEJrRW5ueGFxSWxKdGRkVXFOMitJb3N0R0xzYk1X?=
 =?utf-8?B?dHVjSHNZQ0ZXOEpmaGpyTDVBYmZRRzl0UTZxS1Y1REUwRytjZ3luWmVhMlh2?=
 =?utf-8?B?UmtlVGVqVmE1MElWK05sZjZzWGw4Rkd3aEhuZlpyZEhWWTdqWFJFQlAwZHFP?=
 =?utf-8?B?V3YyZ1pUYWV1UmtMK05LSzE5NU44MTB4TXBnSmNWczk0c0M5Y1o3cWZ1MC9G?=
 =?utf-8?B?d3BvRzJiWXdSVE1QaHBnc0FQWmFRTnFvaUdkWVpNRnhrUmV4cEJrUT09?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: nSFeDHeIEMmb4b1cEUWezESVglIh+y0b4VeJv0DudLWtVFERjoNCtMHyb5BDbZts8m04+qlXhsfAqHGvTvL6wqmvA9bzpRRrdJbpRKDYjZIAG0gSPjH3FqrHKVWgqgqI36aC6xs6UYPfClwwIMjad9J7H9K7PE0ZlSwB0A5FAq05P588P8N+levMBmxGFsy17bUE6rsepWnFvxwMgWdcoHbnbyTZyemYlVtfZ0ZkeC5cS2OGfLkhGsUkDjfzjZf200NFDdlWnBjWGJ4wBVpCt2kZINCmnxvET5dorbl6ebYat2TzWLSj+NvcxHFAnLLJoiHsxiadcrY2Ml0dfRob7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd01a5aa-b2ff-485b-209d-08df34a42242
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 03:32:46.3287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3tzBkP46gIVLxmJ59wvFnY4uUZmj8a802VNw76zyzuz7eZ7TBt8DgNdt2ZR64sD7iHMM6PzP9BqV1AcfPk2pWdWnNszsWAvwPMHp45cBokg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8536
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAxMC8xNV0gdmlydDog
dGR4LWd1ZXN0OiBTZXQgdXAgYW5kIGFjY2VwdCBwcml2YXRlDQo+TU1JTyByYW5nZXMNCj4NCj5P
biA5LzI0LzIwMjYgMTI6MTAgUE0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPj4gQnVpbGQgcHJp
dmF0ZSBNTUlPIGRlc2NyaXB0b3JzIGZyb20gdGhlIFRESSByZXBvcnQgdXNpbmcgdGhlIFBDSSBU
U00NCj4+IE1NSU8gaGVscGVycyBhbmQgYWNjZXB0IGVhY2ggcHJpdmF0ZSByYW5nZSB0aHJvdWdo
IFRERy5NTUlPLkFDQ0VQVC4NCj4+DQo+PiBLZWVwIHRoZSBkZXNjcmlwdG9ycyB3aGlsZSB0aGUg
ZGV2aWNlIHJlbWFpbnMgbG9ja2VkIGFuZCB0ZWFyIHRoZW0NCj4+IGRvd24gb24gYWNjZXB0YW5j
ZSBmYWlsdXJlIGFuZCBkdXJpbmcgdW5sb2NrLg0KPg0KPjEuIFRoZSBjaGFuZ2Vsb2cgdGFsa3Mg
d2hhdCBpdCBkb2VzIGJ1dCBub3Qgd2h5IHRoZSBwYXRjaCBpcyBuZWVkZWQgYW5kDQo+d2hhdCBp
cw0KPnRoZSBkZXNpZ24gY29uc2lkZXJhdGlvbi4gRS5nLiwNCj4NCj4gLSB3aHkgY2hvb3NlIHRv
IHNldHVwIE1NSU8gaW4gdGhlIC5ydW4gY2FsbGJhY2sgaW5zdGVhZCBvZiAubG9jaz8NCj4NCj4g
LSBpcyB0ZHhfdGRpX21taW9fdGVhcmRvd24oKSBzYWZlIGZvciBNTUlPIHBhcnRpYWwgYWNjZXB0
YW5jZT8gd2hlbg0KPmN1cnJlbnQNCj4icnVuIiBmYWlscyB3aXRoIHBhcnRpYWwgTU1JTyBhY2Nl
cHRhbmNlLCBjYW4gdGhlIHNlY29uZCAicnVuIiB3b3JrIHdlbGw/DQoNCk9LLCB3aWxsIHJld3Jp
dGUgdGhpcyBjb21taXQgbG9nDQoNCj4NCj4yLiBTbyBmYXIgdGR4X2RldnNlY19ydW4oKSBhbHdh
eXMgcmV0dXJuIC1FT1BOT1RTVVBQLCBhbmQgTU1JTyBkZXNjcmlwdG9ycw0KPmFyZQ0KPm5ldmVy
IHJldGFpbmVkLg0KDQpUaGlzIGlzIGludGVudGlvbmFsbHksIGFzIHdlIGhhdmVuJ3QgZmluaXNo
IGFsbCB0aGUgd29yayBpbiAucnVuKCkgeWV0Lg0K
