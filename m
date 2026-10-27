Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793085629;
	b=LPoeYNF3+e6P1LmfWyYaqctZkQnH47jtFiYM+ORo8oyPyYHmI0NWS9VcwacBYxxMMPeo
	 dD4t9s3awe8OV5SWMx07PQA/DJZeFgmuATV9lvznb/OeaFGcH5lWE25fciZ+VbPJjEv7B
	 aRhgLGu1o5JAZbVbsn4X9ka5+Ct+CbwsS6rlzg3nyh1EE0A8JgDpTW+Xk24MnyWXwTpRO
	 JF3uH6+ltrGlC1vEReEkvtvORzTOEdBK9ggg4fpVIgUOPiadwaErYsmXBjvdOSpiPdswz
	 zRU+HWkp8p17F3ERTOfTUi+ISG482IFVUu9kl4hREYdfeRD1G+JryFVSQce8Ka5cOxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085629;
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
	bh=thIf7iYReKEZsqlFUYkeWkCISQ1Yia024LYAQ78aixc=;
	b=bT1BJ0RiGvH4Bqw/nGSB/zbnuGs/5iOFXQTcb5YoO6dNM0cRdW7DVcfxxAYN1u/T7M5T
	 dWjjV/9mZlTcSuKd65ZQ1SXCvFluCZnjHF0f4RNkO8ImnlY6EvDVY03R1EiRfCctGb41A
	 U49fDZnIrz1eO5Q1peXjX5//GnqlCY5bDxh/st95a6AIT+fcCbfDwXSkeQhO9AAnmmyV+
	 VPzNjZ7WxkEKohDerMKqnEmtfo6mP8buOyGrIwUF4szyfRsAlPdcHgsN8YUewbUZctSMZ
	 XR8C7zBruQWLQL3GkDpOfjxHxlQ+1GU1sMmdwlWJMIco7S3/dHz6k6iX38C6q2WmOkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3YyjNE4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55404606A31B
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 07:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55404606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I3YyjNE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793085626; x=1824621626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=thIf7iYReKEZsqlFUYkeWkCISQ1Yia024LYAQ78aixc=;
  b=I3YyjNE4+Y/IJ20Py8uJa3R6LYMNGuLE6uexk6puBpSJHWNStcSLGQUo
   zlOnNtQtF9he99u+c6Jx9g4AzGVBjOPWrrg9xrBdfdESEUuokcElBSi75
   yndZ6oovx3CraJxGN5CkcYVRWojj89X4Oa5rj+vg9DxHr+OIv/O+K5b/L
   FkA3+PtFiI1RtBH4OsNU0Sgfldpjwxy4KqmYuEFQ92waVCj8/VJ7rHP6j
   t0EEQxSfneoWuGoDpu4u/KMF99UI0qipdVwqQWpqEWs0X6FkSxDT5FAFR
   8udoUbiV2sstUwnQ5KmPeSq7AuWR3Y4mkNoZXQTSYAj1CVZ3dVTdf+Wkk
   Q==;
X-CSE-ConnectionGUID: fv5EZeTWRLeL//6qz9aoRA==
X-CSE-MsgGUID: 9Z339KeERee/h/AsavHXxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1800392"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1800392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:20:26 -0700
X-CSE-ConnectionGUID: VhdtvvIFTpCg2mHrzLkD4g==
X-CSE-MsgGUID: +9kr0k22T12izaVpFeUtgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4426929"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 00:20:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:20:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:20:24 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzU0D74FMm1b1w75ktTMW442+EWG0fq/iPN7Jusjb2qoMFFimEvlSLx5VhBRtWNYUUUYGGF1AscasMxF4DSZOvesSlF2pme9D7IcCQnGXGU383TAAZKz2Z0bR6OBonnXH/HruY0Z9Y2PG6u+MRVBfdtlwBCZjyYqdDeIVndEakRilHsHFt85qPvC68sOPReNU2fr+b/UydGH8qW8dABgxNOAYFVywb8KtBqfHh0NtpaorXBaHB7xLlrqhDUDlWrN3gK62BhVNNm/NXe1CtH1bNA2XqYWNl/tinMdQYFi54LvP5qPpHY0rxZ4+LsHWpLKhZRdvjQUOP9gmlZxfnDmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thIf7iYReKEZsqlFUYkeWkCISQ1Yia024LYAQ78aixc=;
 b=oTIC8WBum7t9yOCeXlhpYBGdwxjAw805RdM+Ljs535kfKeH2yBmb2o35jmL7PaTMVqgDbmr/lHnVvcOFlRbNossQEHDxYKcOPKGaTHcQ5WUPukKEKKUCGgVhtvxa9vKmQDATjxvwQm8Fq/anErv6MfO+UbX9663Ig21FKFXlHGoR7xMQ0dUdh9EETX0849kQBNOKsWdjptiPullnqu9rsHJCeDfLyB6FqcVS3j0g6MWGZt+gUz6AKOF5e0lrhhI4MD6A4gc0Fh3vrZpGojeDk7o211wlHZs41Xl+EqHIt4bJZHQ98W/Qly15qJYBfXP1ATG4Yt1IeUgnnoBPRvERcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by EAYPR11MB115281.namprd11.prod.outlook.com (2603:10b6:303:2fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:20:14 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:20:13 +0000
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
Subject: RE: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
Thread-Topic: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
Thread-Index: AQHdS9rCn/qQgtt4LE273DcA6V/OtrcPNlOAgAH2MkA=
Date: Tue, 27 Oct 2026 07:20:13 +0000
Message-ID: <IA3PR11MB91362CEA91C0F66DF0F4DC4492602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-5-zhenzhong.duan@intel.com>
 <59b997ce-f5b9-4a3b-9de8-91533289bfe7@intel.com>
In-Reply-To: <59b997ce-f5b9-4a3b-9de8-91533289bfe7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|EAYPR11MB115281:EE_
x-ms-office365-filtering-correlation-id: db59fe17-4539-48c8-f070-08df33fabe44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|18002099003|6133799003|261026121527099003|22082099003|3023799007|56012099006|4143699003|11063799006|10067099003|261022113327099003|261009223027099003|261009221227099003|261022075727099003|261021121427099003|261022105027099003|261026140227099003|38070700021|261021123027099003;
x-microsoft-antispam-message-info: MBCrhrnItKIcMalS+TyMT9ldr9KEX60JGs1+NPF6csBIq3ZVl34kiqKTNa4wE1kX20fxSk2rddC2fmTrk5awJaux4mgKJbId33hlR5ucZaZUEjlBY7MfJqm6atAA46Ki5VA85P2iT+WRqIvpsjtwBSp11ljMcQhtBTCuVESqwbtmm+8glI43hV6x64fVx+7aoEvBJN2rpgMv3wf5s030MWGl8nYHOxGJk6wvoeFC/kbLgxMRMazqf29FNOQmCEiHpgPEKkcYChHcX1O5RRoy1ZJ17+DfQ5xMSt5OJNSUYHFYzOYICj9gkP6swnFCRi1UKZ3ND28VDgozVU6QmuMLEo0JJkKytD1wt21AqXs8OT/fAH4PVCO0EHCwNgdNLstXvezdYjBX7BgFY/SItGjx8Ib5ulGFJuuEv6/1Z27epdyklshOmyEBWlbnXm9Fe3m30k/2uHeOTpmvw6zElKAGx1HrdVtpWjQz1hLjmW3eTEDjU0i+FheF7beW+zl5QPj31NBh6wfOU49nVuDQXzHCza2fgX688vr+dyuAlnKJkYP05tJarOsuZGKQMlw5XqWBQvXLGOWdEz7MWAdNDhiC7pj8sB6Fwi6mJjo573V2j+Wc0OPw5bcRJzipx+KudlXovA2FxnApusW3mcyKDlMsHLfojmuK6D3rvlNoaQ486L/0zshC5Ov/rYUrBQs/26+LRHTFWSvHt0CUneA0eqiSfenbRcZAZycNGN5zQmKdyiA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(18002099003)(6133799003)(261026121527099003)(22082099003)(3023799007)(56012099006)(4143699003)(11063799006)(10067099003)(261022113327099003)(261009223027099003)(261009221227099003)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(38070700021)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eS9mYzlkQnRzVlZ5dnhDRy9PSTJCTTBjTEt4cGlBbXlLclk4TitVWVo3VTVY?=
 =?utf-8?B?c29Cc1Fla1JGazZJemZvZjZMOGwzSGgzRkNvQklnRjZONVhLeklsaVFvaTcv?=
 =?utf-8?B?Vm4zR29wbDdsbm0wb2dRMzVjOW44MjBDWkNPWExJVnJJZFZwbTRRTXFSQ2xW?=
 =?utf-8?B?cnRnMi9wRDkyT1RKSjFFN0hNWkw2azZ0WTBSaHZIS2wrN0NYY0pmZVZlcndL?=
 =?utf-8?B?QUdIQWhRSG01RGE2cWM0MDJUb2VuTjNiazJxZFU4K21SUG0zcS9rclF6a0JJ?=
 =?utf-8?B?Kzc3ekd5Nm1paHBKQ1B6dENXTHMvOFVVcy9ObnNxS2RGTUpib1E5amYxR2RT?=
 =?utf-8?B?RUpWcEVqTTNWVXhkZkVNUGFobnFYTFBUU2drRDE5OEw3cmp6ME5XenJIZ0Z5?=
 =?utf-8?B?dmlLaUlibmFhRThMeHF6dGtNc2MwallqZTVhNXFBbU9oZytuUHNQcGgvMS9P?=
 =?utf-8?B?aXFsOEZSd0drUG5zcGl5OWtDU2RBQ25OQ0Eyd085VFZFdjVnUjdVcmNxNzk1?=
 =?utf-8?B?YlVXcVIyVkE1RlBQa1ZKTmlNdXZiREgrMllDbG1hd3k0RXVqOUJjYVJadW4r?=
 =?utf-8?B?QlZVekxadEVKY3lSSmV1c1ZTS0JLNE1BWVhoNnYyRGNibHdaSGpRbGZ2RUV4?=
 =?utf-8?B?QVRLT21RSWRlTCtoQ2R6QkdabG13blQ1TGcwMTk1N3Zzak4reEZ4anJMRml6?=
 =?utf-8?B?MkJPY252Z2M5YXdkMS9YTFNZL29oRGVwL2JnRWtWS0ZJRFkrKzJleWErNTcx?=
 =?utf-8?B?c3VWdnVITHdsUm9CWCsxVi9UQUtjOFkzQ21tcmxJOWlLME9LL2RqL0N0cWRG?=
 =?utf-8?B?bWpxejBkdThqNmhueGVmbE5DK0pNN1NKREhoZUMzNkNrZlVUOStQSUIxNTBo?=
 =?utf-8?B?OXpzQ2pPZllqenFqS0pYbWF1KzR6bUt1STN2K0F1eXFyTTRpUkphcllEQ3Ux?=
 =?utf-8?B?c1dsT2ZONWUyQnBLK09LdG54OTBqRlZoVHM2OVA4azE3ZFZVelVDUW1lMjRR?=
 =?utf-8?B?NFpNbGdNU20xOEcvRzlQZlplWS91QmNGaGEyUkpPaUl0SnhuRzJKNXNqTWdD?=
 =?utf-8?B?dzAwWWltWEFQbWw2VzlSajJscHhiZmlqQ2ZucmZaTW5BZForblJJT3ladmEr?=
 =?utf-8?B?bnk4N0ZTcHljc3RwVEhURXFxdUFyUW9nTExkdWxKMWJUOGtrakRtYjNnZlE5?=
 =?utf-8?B?eU1DRUFoZTJJWWRPeHhtNGVBZEQraGNmUHRRcGh1YmxXeW5aSlBvWlkvMGw5?=
 =?utf-8?B?Z0s0WjIwdC9nN2FQdnVDYlg1VW9vcW5oWnVhT2lGOHhtaTB4K1dza0g0NU9r?=
 =?utf-8?B?WS91eVZXREhUamRaZGNTT0prL200eDREd2VHL3FLVXAzZTVBM3JIamxwRWFw?=
 =?utf-8?B?Q0cxYTJlSm4vN2lNM2ZNMnA3ejZJWE1sOTdBWjBuNlk2dFJTMnozTFdHSmd3?=
 =?utf-8?B?Rk04eVEvMU9pdnVMVlJsV3lVVTJ0anpFMDFlWHRibzFqWmxpajJlZDlqVm9P?=
 =?utf-8?B?V1lpTC9lUXNFNXd5KzNnaEI3MlBFMWErdndPYkxnSnR1MmNqamtJU245Vll6?=
 =?utf-8?B?dndkRURFbGE1dmtEcUFkTVdXQWhDWVpaUlh3MlVPcWVUUm9aT08ybzBXMmZC?=
 =?utf-8?B?RzBMVkh6TDhnbE00K2hRR1E0QVZ0dW1ONDJzcUZ6cXJiNnJzSE5BWWNRRDJW?=
 =?utf-8?B?VHUzQk8wc3pWT3NSZGd6d25uL3VTekdjQmREK01lQXNUWWQ3TVpXcEdRQmpV?=
 =?utf-8?B?QXluSnkrZ2FDNE9wRWhRSHMzQlFZazlwdlhFWHZzci9SMWNjMmQyQjVxZzlP?=
 =?utf-8?B?VE40NTI3elNSekJyMnRYUHlBR2xXTmJvOXozQzhnOWE5aXU2encrVVBsQlg1?=
 =?utf-8?B?VFIvZENKcEFRZlNER3hZVE1NemlMVHl1SEhwNlZWcmFhUkkyQ0FhRUtXWGs0?=
 =?utf-8?B?TlcvaUFSUlVNZFRiMC9GK2RXb0tFV3YyYlVvbkFaQlZlcTVSOWVaMG9LL1BW?=
 =?utf-8?B?UEpwaHRJY1lmMHY0MHlNcVNlQ3RwaFdZTnpueURQeHc4SWRQMHhLWEhXbitF?=
 =?utf-8?B?ZVBmMnhCMXIzeE5vRGN2Q3VGMDRNSTBwMGx3Nm8xOHlwbTI1OXZGSHVqVE9H?=
 =?utf-8?B?RytvLzNQM1ZjRXBLeVIxam1rQW5nRVRmaVhSRmtFbVNQeGR5cnF5RlEyeFJy?=
 =?utf-8?B?d2haL0kzV3RCcTUwMC8wZThvZ1lyNG9qM0JDYzBmVkZYT3BaamhIcGJyb1hi?=
 =?utf-8?B?MkV0NDR0STNSaTdCUlpXREJZVTVLSXBmMzJ0WW91bWZheGh4UEI4cnQzL3lt?=
 =?utf-8?B?NUVOYnZkTlZIeU1lbytZZ1lhSXJTL2kwUER4cXY3Q01BM25jK3o1UT09?=
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
X-Exchange-RoutingPolicyChecked: ZuDZawtgoPIItt6Iw4mBkLJ/2stdU8NoLcenD9YZ3KLatTrPfPQvdaXtg9es9qTyvOJ3qsmTlyl5X5ApNSzERiPrwk9nfOpUwl3Cy8CR933201mEAB6ddvO5bsY2lmnrGRhsCA1rn2/HcgHQOPpuJNO1dXnziskojH8YsqSrc3zfwpatWe3B233z463Y+vcF4+HKeY3zUQT4AKImOCY3O8ys53hAwmxK1Y4qLzhgbgwh5l/oHyPudntEWsQXp4sf2mZAYKco+02MoEVuBZ9ywRHMZPAuq735kK/lMdvHQcTvf3BfQmSbgLLVwCwrue2xJNz8vbivQ41vsAKcg6bRiQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db59fe17-4539-48c8-f070-08df33fabe44
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 07:20:13.6125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSxnmT7vehtO3j+6nK28uHfKKKtyA5731FJiViGoQVuofl0fzwzmAJmUD16uu8s/Xwwew9GJ1JhinfJI+VHj/KangrdIZWi0Bfd7u4B6zX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB115281
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwNC8xNV0gdmlydDog
dGR4LWd1ZXN0OiBTdXBwb3J0IGRldnNlYyBUU00gZm9yDQo+c2VjdXJlIGRldmljZXMNCj4NCj5P
biA5LzI0LzIwMjYgMTI6MTAgUE0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPj4gUmVnaXN0ZXIg
SW50ZWwgVERYIHNlY3VyZSBkZXZpY2UgKGRldnNlYyBUU00pIHRvIHRoZSBUU00gZnJhbWV3b3Jr
IGFuZA0KPj4gc3VwcGx5IHRoZSB0ZHhfZGV2c2VjX29wcyBjYWxsYmFjayBvcGVyYXRpb25zLiBU
aGlzIGVuYWJsZXMgY29udHJvbCBhbmQNCj4+IG1hbmFnZW1lbnQgb2YgdGhlIFRydXN0IERldmlj
ZSBJbnRlcmZhY2UgKFRESSkgdGhyb3VnaCB0aG9zZSBob29rcyBpbg0KPj4gYWNjb3JkYW5jZSB3
aXRoIHRoZSBURElTUCBwcm90b2NvbC4NCj4NCj5JdCBvbmx5IGltcGxlbWVudHMgdGhlIHBsYWNl
aG9sZGVycyBmb3IgdGhlc2UgaG9va3MuIFBsZWFzZSBzdGF0ZSB0aGVtDQo+YWNjdXJhdGVseS4N
Cg0KV2lsbCBkby4NCg0KPg0KPj4gQ2hlY2sgdGhlIFREQ1MgY29uZmlndXJhdGlvbiBmbGFncyBk
dXJpbmcgZHJpdmVyIGluaXRpYWxpemF0aW9uIHRvDQo+PiBlbnN1cmUgdGhlIGhhcmR3YXJlIGlu
dGVyZmFjZSBpcyBzdXBwb3J0ZWQgYmVmb3JlIGF0dGVtcHRpbmcgZGV2aWNlDQo+PiByZWdpc3Ry
YXRpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5k
dWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJlZC90
ZHguaCAgICAgICAgICAgICB8ICAxICsNCj4+ICBkcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3Qv
S2NvbmZpZyAgICAgICAgICAgfCAxNSArKysrDQo+PiAgZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1
ZXN0L01ha2VmaWxlICAgICAgICAgIHwgIDMgKw0KPj4gIGRyaXZlcnMvdmlydC9jb2NvL3RkeC1n
dWVzdC9jb25uZWN0LmMgICAgICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysNCj4+ICAuLi4v
Y29jby90ZHgtZ3Vlc3Qve3RkeC1ndWVzdC5jID0+IG1haW4uY30gICAgfCAgNiArKw0KPj4gIGRy
aXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC90ZHgtZ3Vlc3QuaCAgICAgICB8IDIwICsrKysrDQo+
PiAgNiBmaWxlcyBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+PiAgcmVuYW1lIGRy
aXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC97dGR4LWd1ZXN0LmMgPT4gbWFpbi5jfSAoOTglKQ0K
Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvdGR4LWd1
ZXN0LmgNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vc2hhcmVkL3Rk
eC5oDQo+Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4LmgNCj4+IGluZGV4IDY2NWMx
MjkyNWZmNi4uNDk5MTAzZjdhMDFiIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20vc2hhcmVkL3RkeC5oDQo+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zaGFyZWQvdGR4
LmgNCj4+IEBAIC01Niw2ICs1Niw3IEBADQo+Pg0KPj4gIC8qIFREQ1NfQ09ORklHX0ZMQUdTIGJp
dHMgKi8NCj4+ICAjZGVmaW5lIFREQ1NfQ09ORklHX0ZMRVhJQkxFX1BFTkRJTkdfVkUJQklUX1VM
TCgxKQ0KPj4gKyNkZWZpbmUgVERDU19DT05GSUdfVERYX0NPTk5FQ1QJCUJJVF9VTEwoNSkNCj4+
DQo+PiAgLyogVERDU19URF9DVExTIGJpdHMgKi8NCj4+ICAjZGVmaW5lIFREX0NUTFNfUEVORElO
R19WRV9ESVNBQkxFX0JJVAkwDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0L2NvY28vdGR4
LWd1ZXN0L0tjb25maWcgYi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtDQo+Z3Vlc3QvS2NvbmZpZw0K
Pj4gaW5kZXggZGJiZGMxNDM4M2IxLi4yZTk0MDdmOGJjNzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy92aXJ0L2Nv
Y28vdGR4LWd1ZXN0L0tjb25maWcNCj4+IEBAIC0xMCwzICsxMCwxOCBAQCBjb25maWcgVERYX0dV
RVNUX0RSSVZFUg0KPj4NCj4+ICAJICBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIG1vZHVsZSwg
Y2hvb3NlIE0gaGVyZS4gVGhlIG1vZHVsZSB3aWxsDQo+PiAgCSAgYmUgY2FsbGVkIHRkeC1ndWVz
dC4NCj4+ICsNCj4+ICtjb25maWcgVERYX0NPTk5FQ1RfR1VFU1QNCj4+ICsJYm9vbCAiSW50ZWwg
VERYIENvbm5lY3QgR3Vlc3QgU3VwcG9ydCINCj4+ICsJZGVwZW5kcyBvbiBURFhfR1VFU1RfRFJJ
VkVSDQo+DQo+bWF5YmUgc2VsZWN0IFREWF9HVUVTVF9EUklWRVIgPw0KDQpNeSB1bmRlcnN0YW5k
aW5nIGlzIHRoaXMgd2lsbCBmb3JjZSBlbmFibGUgVERYX0dVRVNUX0RSSVZFUiB3aXRob3V0DQpj
aGVja2luZyBpdHMgZGVwZW5kZW5jeS4gSSdsbCBrZWVwIGl0IGFzIGlzIGV4Y2VwdCB5b3UgaGF2
ZSBzdHJvbmcNCnJlYXNvbiBoZXJlLg0KDQo+DQo+PiArCWRlcGVuZHMgb24gUENJX1RTTQ0KPj4g
KwlkZWZhdWx0IHkNCj4+ICsJaGVscA0KPj4gKwkgIFN1cHBvcnQgVHJ1c3QgRGV2aWNlIEludGVy
ZmFjZSAoVERJKSBmZWF0dXJlIGVudW1lcmF0aW9uLA0KPj4gKwkgIHZhbGlkYXRpb24sIGFuZCBh
Y3RpdmF0aW9uIHdpdGhpbiBhbiBJbnRlbCBURFggZ3Vlc3QuDQo+PiArDQo+PiArCSAgVGhpcyBv
cHRpb24gZW5hYmxlcyB0aGUgZ3Vlc3Qga2VybmVsIHRvIGVzdGFibGlzaCBzZWN1cmUsDQo+PiAr
CSAgaXNvbGF0ZWQgY29ubmVjdGlvbnMgd2l0aCB0cnVzdGVkIGRldmljZXMgYXNzaWduZWQgdG8g
dGhlIFRELA0KPj4gKwkgIHZhbGlkYXRpbmcgTU1JTyBtYXBzIGFuZCBhdXRob3JpemluZyBETUEg
cmVtYXBwaW5nIHRhYmxlcy4NCj4+ICsNCj4+ICsJICBJZiB1bnN1cmUsIHNheSBZLg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9NYWtlZmlsZQ0KPmIvZHJpdmVy
cy92aXJ0L2NvY28vdGR4LWd1ZXN0L01ha2VmaWxlDQo+PiBpbmRleCA3NzVjYjQ2M2Y5YzguLmNm
YTk5MWM3YWViNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9N
YWtlZmlsZQ0KPj4gKysrIGIvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0L01ha2VmaWxlDQo+
PiBAQCAtMSwyICsxLDUgQEANCj4+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
DQo+PiAgb2JqLSQoQ09ORklHX1REWF9HVUVTVF9EUklWRVIpICs9IHRkeC1ndWVzdC5vDQo+PiAr
DQo+PiArdGR4LWd1ZXN0LXkgOj0gbWFpbi5vDQo+PiArdGR4LWd1ZXN0LSQoQ09ORklHX1REWF9D
T05ORUNUX0dVRVNUKSArPSBjb25uZWN0Lm8NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQv
Y29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+Yi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3Qv
Y29ubmVjdC5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li44MGFlN2MxOWUxNzkNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RyaXZlcnMvdmlydC9j
b2NvL3RkeC1ndWVzdC9jb25uZWN0LmMNCj4+IEBAIC0wLDAgKzEsODEgQEANCj4+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4gKy8qDQo+PiArICogVERYIENvbm5lY3Qg
Z3Vlc3QgZHJpdmVyDQo+PiArICoNCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjYgSW50ZWwgQ29y
cG9yYXRpb24NCj4+ICsgKi8NCj4+ICsNCj4+ICsjZGVmaW5lIHByX2ZtdChmbXQpCQlLQlVJTERf
TU9ETkFNRSAiOiB0ZHhfY29ubmVjdDogIiBmbXQNCj4+ICsNCj4+ICsjaW5jbHVkZSA8bGludXgv
cGNpLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L3BjaS10c20uaD4NCj4+ICsjaW5jbHVkZSA8bGlu
dXgvdHNtLmg+DQo+PiArI2luY2x1ZGUgPGFzbS90ZHguaD4NCj4+ICsNCj4+ICsjaW5jbHVkZSAi
dGR4LWd1ZXN0LmgiDQo+PiArDQo+PiArc3RydWN0IHRkeF9kZXZzZWMgew0KPj4gKwlzdHJ1Y3Qg
cGNpX3RzbV9kZXZzZWMgcGNpOw0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCB0ZHhf
ZGV2c2VjICp0b190ZHhfZGV2c2VjKHN0cnVjdCBwY2lfdHNtICp0c20pDQo+PiArew0KPj4gKwly
ZXR1cm4gY29udGFpbmVyX29mKHRzbSwgc3RydWN0IHRkeF9kZXZzZWMsIHBjaS5iYXNlX3RzbSk7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBzdHJ1Y3QgcGNpX3RzbSAqdGR4X2RldnNlY19sb2Nr
KHN0cnVjdCB0c21fZGV2ICp0c21fZGV2LCBzdHJ1Y3QNCj5wY2lfZGV2ICpwZGV2KQ0KPj4gK3sN
Cj4+ICsJaW50IHJldDsNCj4+ICsNCj4+ICsJc3RydWN0IHRkeF9kZXZzZWMgKnRkZXZzZWMgX19m
cmVlKGtmcmVlKSA9IGt6YWxsb2Moc2l6ZW9mKCp0ZGV2c2VjKSwNCj5HRlBfS0VSTkVMKTsNCj4+
ICsJaWYgKCF0ZGV2c2VjKQ0KPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+PiArDQo+
PiArCXJldCA9IHBjaV90c21fZGV2c2VjX2NvbnN0cnVjdG9yKHBkZXYsICZ0ZGV2c2VjLT5wY2ks
IHRzbV9kZXYpOw0KPj4gKwlpZiAocmV0KQ0KPj4gKwkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+
ICsNCj4+ICsJcmV0dXJuICZub19mcmVlX3B0cih0ZGV2c2VjKS0+cGNpLmJhc2VfdHNtOw0KPj4g
K30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB0ZHhfZGV2c2VjX3VubG9jayhzdHJ1Y3QgcGNpX3Rz
bSAqdHNtKQ0KPj4gK3sNCj4+ICsJc3RydWN0IHRkeF9kZXZzZWMgKnRkZXZzZWMgPSB0b190ZHhf
ZGV2c2VjKHRzbSk7DQo+PiArDQo+PiArCWtmcmVlKHRkZXZzZWMpOw0KPj4gK30NCj4+ICsNCj4+
ICtzdGF0aWMgaW50IHRkeF9kZXZzZWNfcnVuKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sN
Cj4+ICsJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0
IHBjaV90c21fb3BzIHRkeF9kZXZzZWNfb3BzID0gew0KPj4gKwkubG9jayA9IHRkeF9kZXZzZWNf
bG9jaywNCj4+ICsJLnVubG9jayA9IHRkeF9kZXZzZWNfdW5sb2NrLA0KPj4gKwkucnVuID0gdGR4
X2RldnNlY19ydW4sDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkZXZzZWNfdHNtX3Jl
bW92ZSh2b2lkICp0c21fZGV2KQ0KPj4gK3sNCj4+ICsJdHNtX3VucmVnaXN0ZXIodHNtX2Rldik7
DQo+PiArfQ0KPj4gKw0KPj4gK2ludCB0ZHhfY29ubmVjdF9pbml0KHN0cnVjdCBkZXZpY2UgKmRl
dikNCj4+ICt7DQo+PiArCXN0cnVjdCB0c21fZGV2ICp0c21fZGV2Ow0KPj4gKwl1NjQgY29uZmln
LCByZXQ7DQo+PiArDQo+PiArCXJldCA9IHRkZ192bV9yZChURENTX0NPTkZJR19GTEFHUywgJmNv
bmZpZyk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4gLUVJTzsNCj4NCj5UaGUga2VybmVs
IGFscmVhZHkgbWFuYWRhdGVzIGFuZCBhc3N1bWVzIFREQ1NfQ09ORklHX0ZMQUdTIGlzIGFsd2F5
cw0KPnN1cHBvcnRlZA0KPmluIGRpc2FibGVfc2VwdF92ZSgpLg0KPg0KPkNhbiB3ZSBtYWtlIHRo
ZW0gY29uc2lzdGVudD8gTWF5YmUganVzdCB0cmVhdCBjb25maWcgYXMgMCB3aGVuIHJlYWRpbmcN
Cj5URENTX0NPTkZJR19GTEFHUyBmYWlscz8NCg0KSSBzZWUgZXhpc3RpbmcgY29kZSBuZXZlciBj
aGVjayByZXR1cm4gdmFsdWUgb2YgdGRnX3ZtX3JkKCkgbm8gbWF0dGVyDQp3aGF0IGlucHV0LCBi
dXQgdGRnX3ZtX3JkKCkgaXMgZGVmaW5lZCB3aXRoIHJldHVybiB2YWx1ZS4gSSBkb24ndCBrbm93
DQp3aHksIGJ1dCBJJ20gZmluZSB0byBiZSBjb25zaXN0ZW50IGhlcmUuDQoNCj4NCj4+ICsNCj4+
ICsJaWYgKCEoY29uZmlnICYgVERDU19DT05GSUdfVERYX0NPTk5FQ1QpKQ0KPj4gKwkJcmV0dXJu
IDA7DQo+PiArDQo+PiArCXRzbV9kZXYgPSB0c21fcmVnaXN0ZXIoZGV2LCAmdGR4X2RldnNlY19v
cHMpOw0KPj4gKwlpZiAoSVNfRVJSKHRzbV9kZXYpKQ0KPj4gKwkJcmV0dXJuIFBUUl9FUlIodHNt
X2Rldik7DQo+PiArDQo+PiArCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBk
ZXZzZWNfdHNtX3JlbW92ZSwgdHNtX2Rldik7DQo+PiArfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlydC9jb2NvL3RkeC1ndWVzdC90ZHgtZ3Vlc3QuYw0KPmIvZHJpdmVycy92aXJ0L2NvY28v
dGR4LWd1ZXN0L21haW4uYw0KPj4gc2ltaWxhcml0eSBpbmRleCA5OCUNCj4+IHJlbmFtZSBmcm9t
IGRyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC90ZHgtZ3Vlc3QuYw0KPj4gcmVuYW1lIHRvIGRy
aXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9tYWluLmMNCj4+IGluZGV4IGQwMzAzZTMxZTgxNi4u
ODAxYTFmMmI1ZjNkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0
L3RkeC1ndWVzdC5jDQo+PiArKysgYi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvbWFpbi5j
DQo+PiBAQCAtMjUsNiArMjUsOCBAQA0KPj4gICNpbmNsdWRlIDxhc20vY3B1X2RldmljZV9pZC5o
Pg0KPj4gICNpbmNsdWRlIDxhc20vdGR4Lmg+DQo+Pg0KPj4gKyNpbmNsdWRlICJ0ZHgtZ3Vlc3Qu
aCINCj4+ICsNCj4+ICAvKiBURFJFUE9SVCBidWZmZXIgKi8NCj4+ICBzdGF0aWMgdTggKnRkeF9y
ZXBvcnRfYnVmOw0KPj4NCj4+IEBAIC00MjgsNiArNDMwLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0
IHRkeF9ndWVzdF9pbml0KHZvaWQpDQo+PiAgCWlmIChyZXQpDQo+PiAgCQlnb3RvIGZyZWVfcXVv
dGU7DQo+Pg0KPj4gKwlyZXQgPSB0ZHhfY29ubmVjdF9pbml0KHRkeF9taXNjX2Rldi50aGlzX2Rl
dmljZSk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlwcl93YXJuKCJGYWlsZWQgdG8gZW5hYmxlIFRE
WCBDb25uZWN0OiAlZFxuIiwgcmV0KTsNCj4+ICsNCj4+ICAJcmV0dXJuIDA7DQo+Pg0KPj4gIGZy
ZWVfcXVvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0L3Rk
eC1ndWVzdC5oDQo+Yi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvdGR4LWd1ZXN0LmgNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQyMTg1NDFjN2Yz
Yg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy92aXJ0L2NvY28vdGR4LWd1ZXN0
L3RkeC1ndWVzdC5oDQo+PiBAQCAtMCwwICsxLDIwIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4+ICsvKg0KPj4gKyAqIFREWCBndWVzdCBkcml2ZXIgcHJp
dmF0ZSBkZWNsYXJhdGlvbnMNCj4+ICsgKg0KPj4gKyAqIENvcHlyaWdodCAoQykgMjAyNiBJbnRl
bCBDb3Jwb3JhdGlvbg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpZm5kZWYgX19URFhfR1VFU1RfSA0K
Pj4gKyNkZWZpbmUgX19URFhfR1VFU1RfSA0KPj4gKw0KPj4gKyNpbmNsdWRlIDxsaW51eC9rZXJu
ZWwuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+PiArDQo+PiArI2lmZGVmIENP
TkZJR19URFhfQ09OTkVDVF9HVUVTVA0KPj4gK2V4dGVybiBpbnQgdGR4X2Nvbm5lY3RfaW5pdChz
dHJ1Y3QgZGV2aWNlICpkZXYpOw0KPg0KPmV4dGVybiBpcyBub3QgbmVlZGVkLgkNCg0KU3VyZS4N
Cg0KVGhhbmtzDQpaaGVuemhvbmcNCg==
