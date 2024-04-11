Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14460B95
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 01:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712798414; cv=fail; b=f7yqgRhgHjHLo/MJqMOQmTz6LEJjkBEjt0fuKXmKwlWGsxTiYYzQW0PZowy1y6u81JdIK4qF+e/SMzXAcZoGKuxnhSCCyt6wueV7pfyuBepJ7HLAF1I++iKF7UBoKKIAWUJ4EUsAOD2hMQeTbSKQVba7gdsBviNZc+XfoxE0UT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712798414; c=relaxed/simple;
	bh=URx0Pz0b1cEt4EmUD7gMNO+J4N9FQ0UjTul4uqe3LzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ncQEC+FAr+OmWddXF2tZTxAvbXvqsSp8EX+JntH+uvg2JtXN933nf7oFhHZRkUc1PFKnIj9eM0LXGVIBnRx64Pv39/MxWJ096+3p0D9XHYHRQF2Fe4MMAHfTTk3ddAvvMYc/tO3zFVJjWnLjB7IeOHEpjfTx1MCm8uHfJI+XiYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dr8eJZKJ; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dr8eJZKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712798412; x=1744334412;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=URx0Pz0b1cEt4EmUD7gMNO+J4N9FQ0UjTul4uqe3LzU=;
  b=dr8eJZKJ8iwA38TL0HEvDQ+RnYr39GqzQpu5LifewRvxIX+cxY7+1QBW
   C3gMydOtAsMsw5e5X3IZ1dh9sWnhLFx/glOW6tfGaa+Z6IkDNDisH5ckO
   QfJfrSzpxx1FcqHrX8e0Yu2D/zKIslNhJYAHG06hY13M3CtY1O3wHTduB
   4IWak6qlwHSkbjX9erreYrvLS2/dVpXKZZOx4Hno0I2FsipgXrVVWM7/J
   XX8q1+fRgUmLD2hLzjV637dgKvnD3z2zCbwn4CvXbRaeDe34JKvKI44L9
   WeG5TQzA+Ppco2nWeR8+i+5P6qycewJdTI+IF2FRgancD5mFh3nhTN9pL
   Q==;
X-CSE-ConnectionGUID: S3rYvi83SguWNjAA2mPGOw==
X-CSE-MsgGUID: JYcfJrCsQo2EjFDun1XtCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8319298"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8319298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 18:20:12 -0700
X-CSE-ConnectionGUID: pKj1fHosQxWtKMk/xp3Rtg==
X-CSE-MsgGUID: Jq0T088GTNWcezODCm3BFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="21180090"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Apr 2024 18:20:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 18:20:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 18:20:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 18:20:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 18:20:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm1NpDvGGczItwmhldevDeDRXmr3hIfIzQAvZVQt1TWkROorPjh2wQRvCSuU6Zfwl227+xbqh1J22vhr4BML4sSeD/QTZ4KdmCMHZgd31qdQmtb7llYwY9IRQvKmYmVKvZPptaMfoc5sf2vCat8Gv+86bsLMdHDLyARMhVu0SY0yT/hRErMWCYK+Ll/emomw5vJz7fGjg8S8sPGtRo+IKeiqhaA12XAsPdyZ7h9hJVmgcfU1oPNXI/pWrI//hk5mnXj2sSM5K+eq4z0dz5+nxCrQOo9F/DRONPojtHpAoTW49pxwl/aFcGgsd5DeXp1AXd49djZFN2H84HGfbDyCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URx0Pz0b1cEt4EmUD7gMNO+J4N9FQ0UjTul4uqe3LzU=;
 b=LIIDU7AwBF2pGRSfDTG8M1iecLciWxUeElNMMkUU5gjYdsuMrDyCHP1WfovnXkMxX55pEHgRMngBkxkLlKbJq6P7Wu4PmH2Y8wnqCk0+JfHuGaU/qGeL+4LaO1eZulF9JakIZ1xrVyE8tJpIcrTdDpBhntx2MTShp1KNoVKeN/2gDUy0ReS4BhcpBVYaggVu704Ag/Ho1G0k4lbEqUFfBduC1NvJV+b2KksJJmrkwGTlD++hKrpg+lt3lnMI8dXdS+BD/JB/A7m69GwBIwkajcp0HB6vhbCLcMqfbLiXZ5hdR0NFx/Q4pz6P/cyrA8pPgABrtkBwKDfKS3FEcAZHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Thu, 11 Apr
 2024 01:20:07 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9%4]) with mapi id 15.20.7430.045; Thu, 11 Apr 2024
 01:20:07 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen
	<mikko.ylinen@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, James Bottomley <jejb@linux.ibm.com>, "Tom
 Lendacky" <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>
CC: qinkun Bao <qinkun@google.com>, "devel@edk2.groups.io"
	<devel@edk2.groups.io>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, "Peter
 Gonda" <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>,
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Subject: RE: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
Thread-Topic: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for
 coexistance of vTPM and RTMR.
Thread-Index: AQHae7ExDojlpEcMQUidaqlRqr5fRLFCeBiAgAB/ymCAAH0nAIAAZe6AgASYWgCAACeXAIAZxSBQ
Date: Thu, 11 Apr 2024 01:20:07 +0000
Message-ID: <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
In-Reply-To: <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|IA1PR11MB6121:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmHYQd5R/hdtqTbowS7c31qXwQDNpyoPYIi6hXPPrXY/16bXpVzVe6UJXOYXNOPDzoABJgO72pEzn06EK5e/EO7ObJwqrmLj8Y2A0363T8Mm7tWad9I4wOcyN4ppi8LoTkHo1Z3JGd1TZd8CRRJxp4dRS3BNTJHZ312EjY+qBwC2fHMhQfeU80LFB5hi0n3ImsPyS1Lc7nbhCZxv+idi6db2pOQ3ooZi9vOe6jzf6HnO04OBz8IU8LrOqLwswBFkz8eKntIQJMLy+aoyMgHiLv82u7yJwt+jqzbHfXBm8szyzlQ5w4RBMitnkTJjTfuDlut3BQMw+NTLmama847ruLRz6CQNrtQXWD6nfYO7ZfLK4QKo9JDxO+Klao8sZi0VWylJGQ6YykvDvYGHd4nqaQInhXdWz/KyYKjxDMXCVPWeoEyul3g4tKNWIA5N/DhcssaFZ7+U2EvIK0rA2Bx8XgERG0tcLNgAFlre6bxI5u58tWIu2vTYAyke7UAz1c/khAmC4SPVfYEXF7AKo3Fq9un9KnICOiUirLZP4q07PTNHhAxX9Pfj97GkUoDb9Mu5Dqw8HOCHJdOTiA3Q3I3avgzlrc3YvlqLRBsPgXPekKuvyuu7v3iFnJho55IfUvBiT76oF21rXni8gQ25NBer1/AwlN6R9pUStxThwMzwScI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjdxMnZoV20wczRKd3VKVFY0VmlzWGoxOWFTL3YvKzlZRUlJRzlpczBJcFlq?=
 =?utf-8?B?RXVzWjNwcVk4bjRFM1FxYUJuSXN2VXlrVFJYWTdnc201OVE1cDBLV21Eclk2?=
 =?utf-8?B?QkJnSVZZSGo4WnR2ZHBhN1piR0VBMTBIYVg2eGUzOUdGaDhGdTVpRkNGTXJa?=
 =?utf-8?B?TmRRVC80ZVBIdS9PSk5zQ2xyQXkzTUhpd3NCNHlUZlZwcm8xSVVUTUdmRUdk?=
 =?utf-8?B?YUx6UE1QQmJXVmo2ZEdqY3ZvaHpKNjlPYSt1UXNySUpid1VNWXVXbWVKTjNC?=
 =?utf-8?B?Qlo5Uis0dlh5YWhzMG04bmgvd0tQR0lNNkRsTnRZV2dhd3E4ZWNER1hzSnUx?=
 =?utf-8?B?Ky9DVUwzdDBwSEZUVmo2NlBNTlY5MklnR1I5WnU0ODI5OVZYbmt6bW05cHE3?=
 =?utf-8?B?M09adTc4cnhqYVZ2VFVEaG8yL0NTWCtFMVgzS3JVZlVrMmxCYjN6SHlyVkcv?=
 =?utf-8?B?a2NBNlFNUkFIcHI4UVErWThvQ2lUbFpEMWozSnhiQk00OFdzc2k1VG5YcDBB?=
 =?utf-8?B?T1ZCU2F1bzhONkw5UVk5NzVuMDZyKzZZZnhSTFg5UUVmUS90UHp5eEFja1Bp?=
 =?utf-8?B?bTV6b1FIcmxUMzI4bXNDSGxORmE1Q01weDVBV1ByS09vSmg2YzdWbVFZeWoy?=
 =?utf-8?B?RTJUNXhhSHJmazRUZWtYSXN1ZHBxWWFjQVlqS3o5YmJIY244aC9lUnU3Y3Rs?=
 =?utf-8?B?VmFJd2lrcktyZXk1YTF1WEdHUy9iV2w5eFMvUndqWDhFYXlVdWtTZ1FtRWhy?=
 =?utf-8?B?akpjQXFKdTNNZ2Q1WTFVZFNBS3ovR1VaMFVaV0FpQ3cwT1JpZ0xHV0c4V2Za?=
 =?utf-8?B?bU1nUTRLcGJjVXVXYVc1dzk0a09JTURhakhzMVJwSUNESHY4MFBuci9EQks3?=
 =?utf-8?B?VExwdGZyaU9nM1JlaHc5bHlYdUd5ZzdqOGlobU52V2sxb2h0WGJmTXNRSit2?=
 =?utf-8?B?YWZDazhyY1ZRblZoVCs0ZE15SVpVQ1JIYjkremVUOStkMkxTRldZK0lyNmYx?=
 =?utf-8?B?cEtvRDdsRkhaOHJaUmlQb1hZSklNaVJYMUp3TUV2RllNQTBKS1RUS1dCMkNq?=
 =?utf-8?B?N3NXUVB2ZE1kdTE4NmhwOGNhaU1ZRXFUQ3h2OUM5c2ZDY2l4TVkzaGlsY0o4?=
 =?utf-8?B?Z1VDUkUyYWxxMkxubEV0dWFaN2FlSnE1Ym5OTUQ1RWx6UmFHNllmd29EVWp6?=
 =?utf-8?B?SXNOSWY1UldERUdRVGQydFRja1pVaXJpZWlpQ3dmNlNnM1NRUWhsREh1WS9F?=
 =?utf-8?B?THBPL1llWXd3Yy9iRmd5Nkd2UzFhZkpReTV2MTMzZ0c2NlJCQW9wOGtYVVFh?=
 =?utf-8?B?cStRb3ZxTmpnRFFJN0JlOGhMRVRvK2dDNzkvdmMxaFlCR1UvVXRsM3ZoTitB?=
 =?utf-8?B?Q2xBL1M2YmprSkVjczJvY2VmQkxyWjk3SWpVejlMWFNwUVkwUmhXaURaa05B?=
 =?utf-8?B?Z1BPWU9TVm9JNmRTY1ZCWWhpUlU3YkNWWnlMOC9uY3NKZDhiU0lJb3h2R05Z?=
 =?utf-8?B?UWRJQWw5c1hza2pMbnpCTXhDV0gyNm4xRXJINkhZSXY5emhEUUZFSXppdkh2?=
 =?utf-8?B?WVNEQ25ORmtWSktPYXVvRXBuUWNMaUtiejAycStBdVVRa1d1ZFR4YVRwcXg5?=
 =?utf-8?B?MTF2bU1sVHBISWJRemZUMitJNWJ5ZWhlUFpDTFhOaW9YSzYyMHQrQitucHBC?=
 =?utf-8?B?TGJrdTExeHVKSFF5Z0xuZ3VFYUhGYWFmNzZSMm5kb1l0MlY1NzN6TVRpTlVQ?=
 =?utf-8?B?OTRpZjBSTzZrSDZXNlUzdDVUTy81UEtmK0ZTTFBDSUtuTkJZaGdGSi9UM01H?=
 =?utf-8?B?KzFCeGcvNng0SzdSMHMzVUpVTlVGYkJlM0VDR0pFVGVERFdsZGFmWjhiY0Vz?=
 =?utf-8?B?NnYyVHFlT21GekVlNzM1ZXdobGtGMGtoWHF4d3BNSDNXN01GMXQyVzU1dXlv?=
 =?utf-8?B?MzYxckQxQWwrbVl0Sy93R2pTWU9YWWdxL2VEOGhGRjBsNXVCN0ZyV1M1Ylcw?=
 =?utf-8?B?VDNaMTd2Z2laai9uKytKaDRza3BYYndVMXdwZXQvLzZ5eThKdVRkd1ExUUlV?=
 =?utf-8?B?dUNGajFVQjMxbXB5NTVsMXE4R3E1YjZyVUNxWitPK1F6ZFRXVlRXczRERFFv?=
 =?utf-8?Q?Pa9IjPThQCKZFosICEAWZihbK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb466198-cfe2-436a-d3ea-08dc59c58624
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 01:20:07.3703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dhp+YJEf7bzJv9fDsu9UG69/2BGYyNy66MFcaxP8V0rbWdiTERN1C2Tg/hzTvN4b5Ciz+vrSL8XI7SEbkPjjjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
X-OriginatorOrg: intel.com

SGkgRGlvbm5hL1Fpbmt1bg0KSSBhbSBub3Qgc3VyZSBpZiBzeXN0ZW1kIGlzIHRoZSBsYXN0IHNv
ZnR3YXJlIGluIGd1ZXN0IHdlIG5lZWQgdG8gcGF0Y2ggdG8gc3VwcG9ydCBjb2V4aXN0ZW5jZSB0
byBleHRlbmQgdGhlIG1lYXN1cmVtZW50Lg0KQXJlIHlvdSBhd2FyZSBvZiBhbnkgb3RoZXIgTGlu
dXggZ3Vlc3Qgc29mdHdhcmUgbmVlZHMgdG8gYmUgdXBkYXRlZD8gU3VjaCBhcyBMaW51eCBJTUEg
KEludGVncml0eSBNZWFzdXJlbWVudCBBcmNoaXRlY3R1cmUpPw0KDQpUbyBtb3ZlIHRoaXMgZm9y
d2FyZC4NCg0KSW4gSW50ZWwsIHdlIGhhZCBkaXNjdXNzZWQgYW5kIHdlIGRpZCBzZWUgdGhlIHBv
dGVudGlhbCBzZWN1cml0eSByaXNrLiBBcyBJIG1lbnRpb25lZCBpbiB0aGUgZmlyc3QgZW1haWws
ICJJbiBjYXNlIHRoYXQgYW55IHRoZSBndWVzdCBjb21wb25lbnQgb25seSBrbm93cyBvbmUgb2Yg
dlRQTSBvciBSVE1SLCBhbmQgb25seSBleHRlbmRzIG9uZSBvZiB2VFBNIG9yIFJUTVIsIGJ1dCB0
aGUgb3RoZXIgb25lIG9ubHkgdmVyaWZpZXMgdGhlIG90aGVyLCB0aGVuIHRoZSBjaGFpbiBvZiB0
cnVzdCBpcyBicm9rZW4uIg0KDQpBdCBzYW1lIHRpbWUsIHdlIGFsc28gcmVzcGVjdCB0aGF0IGl0
IG1pZ2h0IGJlIGEgdmFsaWQgdXNlIGNhc2UgZm9yIEdvb2dsZS4NCkkgd291bGQgbGlrZSB0byBh
c2sgdGhlIG9waW5pb24gaW4gdGhlIEVES0lJIGNvbW11bml0eSwgZXNwZWNpYWxseSB0aGUgT1ZN
RiBhbmQgQ0MgbWFpbnRhaW5lciBhbmQgcmV2aWV3ZXIuDQoNCg0KSGkgQXJkIEJpZXNoZXV2ZWwN
CkRvIHlvdSB0aGluayBLZXJuZWwgaXMgT0sgd2l0aCB0aGlzIGNvZXhpc3RlbmNlIHByb3Bvc2Fs
Pw0KQXJlIHlvdSB3aWxsaW5nIHRvIGdpdmUgInJldmlld2VkLWJ5Ij8NCg0KSGkgR2VyZCBIb2Zm
bWFuDQpEbyB5b3UgdGhpbmsgUmVkSGF0IGlzIE9LIHdpdGggdGhpcyBjb2V4aXN0ZW5jZSBwcm9w
b3NhbD8NCkFyZSB5b3Ugd2lsbGluZyB0byBnaXZlICJyZXZpZXdlZC1ieSI/DQoNCkhpIEphbWVz
IEJvdHRvbWxleQ0KRG8geW91IHRoaW5rIElCTSBpcyBPSyB3aXRoIHRoaXMgY29leGlzdGVuY2Ug
cHJvcG9zYWw/DQpBcmUgeW91IHdpbGxpbmcgdG8gZ2l2ZSAicmV2aWV3ZWQtYnkiPw0KDQpIaSBU
b20gTGVuZGFja3kvTWljaGFlbCBSb3RoDQpEbyB5b3UgdGhpbmsgQU1EIGlzIE9LIHdpdGggdGhp
cyBjb2V4aXN0ZW5jZSBwcm9wb3NhbD8NCkFyZSB5b3Ugd2lsbGluZyB0byBnaXZlICJyZXZpZXdl
ZC1ieSI/DQoNCg0KVGhhbmsgeW91DQpZYW8sIEppZXdlbg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogRGlvbm5hIEFtYWxpZSBHbGF6ZSA8ZGlvbm5hZ2xhemVAZ29v
Z2xlLmNvbT4NCj4gU2VudDogTW9uZGF5LCBNYXJjaCAyNSwgMjAyNCAxMToyOSBQTQ0KPiBUbzog
TWlra28gWWxpbmVuIDxtaWtrby55bGluZW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+OyBZYW8sIEppZXdlbiA8amlld2VuLnlhb0BpbnRl
bC5jb20+Ow0KPiBxaW5rdW4gQmFvIDxxaW5rdW5AZ29vZ2xlLmNvbT47IGRldmVsQGVkazIuZ3Jv
dXBzLmlvOyBsaW51eC0NCj4gY29jb0BsaXN0cy5saW51eC5kZXY7IEFrdGFzLCBFcmRlbSA8ZXJk
ZW1ha3Rhc0Bnb29nbGUuY29tPjsgQXJkIEJpZXNoZXV2ZWwNCj4gPGFyZGJAa2VybmVsLm9yZz47
IFBldGVyIEdvbmRhIDxwZ29uZGFAZ29vZ2xlLmNvbT47IEphbWVzIEJvdHRvbWxleQ0KPiA8amVq
YkBsaW51eC5pYm0uY29tPjsgVG9tIExlbmRhY2t5IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT47
IE1pY2hhZWwNCj4gUm90aCA8bWljaGFlbC5yb3RoQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIXSBPdm1mUGtnL1NlY3VyaXR5UGtnOiBBZGQgYnVpbGQgb3B0aW9uIGZvciBjb2V4
aXN0YW5jZQ0KPiBvZiB2VFBNIGFuZCBSVE1SLg0KPiANCj4gT24gTW9uLCBNYXIgMjUsIDIwMjQg
YXQgNjowN+KAr0FNIE1pa2tvIFlsaW5lbg0KPiA8bWlra28ueWxpbmVuQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gTG9va2luZyBhdCBzeXN0ZW1kLWJvb3Qg
SSBzZWUgaXQgd2lsbCBsaWtld2lzZSBub3QgbWVhc3VyZSB0byBib3RoIFJUTVINCj4gPiA+ID4g
YW5kIHZUUE0sIGJ1dCB3aXRoIHJldmVyc2VkIHByaW9yaXR5ICh1c2UgdlRQTSBub3QgUlRNUiBp
biBjYXNlIGJvdGggYXJlDQo+ID4gPiA+IHByZXNlbnQpLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+
IEludGVyZXN0aW5nLiBUaGFua3MgZm9yIHRoaXMgcmVwb3J0LiBXZSdsbCBwdXNoIGZvciB0aGUg
Y2hhbmdlZA0KPiA+ID4gc2VtYW50aWNzIGhlcmUgaWYgdGhlIHNwZWMgaXMgaW5kZWVkIGNoYW5n
ZWQsIGFuZCByZXF1ZXN0IHBhcnRuZXINCj4gPiA+IGRpc3Ryb3MgaW4gdGhlIENDQyB0byBpbmNs
dWRlIHRoZSB1cGRhdGVkIHN5c3RlbWQtYm9vdC4NCj4gPg0KPiA+IEZXSVcsIG15IFJUTVJzIHBh
dGNoIHRvIHN5c3RlbWQgd2FzIG1lcmdlZCBxdWl0ZSByZWNlbnRseSBzbyBpdCdzIG5vdA0KPiA+
IGluY2x1ZGVkIGluIGFueSBzeXN0ZW1kIHJlbGVhc2UgeWV0LiAoSXQgd2FzIG1haW5seSBpbXBs
ZW1lbnRlZCBmb3IgdGhlDQo+ID4gVUtJIGNhc2UgdGhhdCBhbGxvd3MgVERWRiB0byBib290IGEg
VUtJIGltYWdlIGRpcmVjdGx5IGFuZCB0aGVuIGhhdmUgdGhlDQo+ID4gaW1hZ2Ugc2VjdGlvbnMg
bWVhc3VyZWQgc2VwYXJhdGVseS4pDQo+ID4NCj4gDQo+IFRoYW5rIHlvdSwgSSd2ZSBwcm9wb3Nl
ZCBhIGNoYW5nZSBpbg0KPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL3B1bGwv
MzE5MzkNCj4gDQo+IA0KPiAtLQ0KPiAtRGlvbm5hIEdsYXplLCBQaEQgKHNoZS9oZXIpDQo=
