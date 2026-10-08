Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F06E3A3E73
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477791; cv=fail; b=BPFzS0prNORhiJxFEXXaVS/dnpLodA3d4RT/4s5L2pc8B/zKFZQxW4RAjTpz6DyxOVawAMruik/8T11Ex5GlMh3m8xsNUDq5Dld5LPiXm0BSevDYbOTTaEqoLinbdAIET0z7D+/PlpEW0CnhzK4fEumck8FESABenEA0Crz4sUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477791; c=relaxed/simple;
	bh=Rvzd7x9YN33fK3uch6OcpxTTU6E6P8mlZatDM06xNFc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ntuxi0j/DSbOIt/tqPsO/B9kKdwGH8PxxV31oykm8osoNQ4zwdTgeI3dCx9f3LiYG4NU+2+fG8SnA81iLIUDMTJWOMKgupvDLseQrq5hLVoh9EtpheoCB4IDGY9c4Lt7JpCjJR8qaV5C/zi08xHlSMPMRDfTkl6DZzu9uFf/J6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQ1rdY5W; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQ1rdY5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791477790; x=1823013790;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Rvzd7x9YN33fK3uch6OcpxTTU6E6P8mlZatDM06xNFc=;
  b=aQ1rdY5W/zqwhpSSWF80+PJGouNT6bqEEkuX9FL2ggYU9M+IP6mNFlZr
   it5A2B1gsxta45pNTjJniBb75+rWpSKU8BDk5pWPyOlJ45YXjiDAJ/MBd
   +nV9ACY4wC5IHbcZx4EBtWFMBV/V5iOHQlumm0/fcSklaeA2tGr8qyVDq
   Mxxg4VmUc/oPjcNYOKZKxB5gVbGOm9UYA8sr8423XtrpkGJEIEabf4KMb
   gBFxUlGQslk0YXePAKEl15sVGH4lYU7T2ul5lU9n8i6nwpMclCBVvOQNS
   2gWDVT89ab3nO6XWJddDBczcSu3reWTsvZIhw//+y3kIO/qI2ARUCz2eV
   g==;
X-CSE-ConnectionGUID: aSaRVClHS7Wbnkh4jwl9iA==
X-CSE-MsgGUID: wFPUWYczTCekI2cJ1nVyxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="152412"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="152412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:43:09 -0700
X-CSE-ConnectionGUID: ca0xbstoTqucq4G9VhOnfA==
X-CSE-MsgGUID: 1bmZFNK+RhyVxxZk0hY6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="87005"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:43:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 09:43:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbF5frWZr1id8zLuZCoii8Faqwf+/2d2WwPZYqXyJeWbjMLegxCmYDBtt4eFvyUp1JXlD0h6C19ypsaz2kNVjXeZ777l2pe12nFHfe8oE9oDKYs+pkbK5vU5a1y7qMANwQcdY7xxntLzUXgfiDH30u8VbZ7p7ZliPEjJcj/fgsqgkYul/CWrS1pKKsmmU/EAwYBk+mqW9YRnURq8hF+PqlGPks6hqwLV4xRc6Wpl0KFXKDR/p657OwT6Y5dZ+MFftNv09dm3Y1HxWgSyZHORoWD+PXYc0QaPG6mRvNQ89srwIOavV255AQRFWfcFVe5tQH1j3agqwudrK/JbRWJrAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rvzd7x9YN33fK3uch6OcpxTTU6E6P8mlZatDM06xNFc=;
 b=fAWpO01L66swNXJ+xMts2/dhm4EFodqtwkpWCSK+a0b1NXV1FvabGkykeC1RtuuEpJFFIFry9l6cn/TAZgwkHvonVSx+2Jd98S6ObQ+ZvZPu0Kb+AogyoAUE5w8rzxpQ9jE8oT5KHnb5+pAA0h0km0Jxb7BlSSr2iFBQgEeXI6vm+QkDusf1mbLw1/hRxu6yz/7jY6urPA/9OKIJycA7mHbeHHivAleqPWkoTEW9fBnofe1xRrHnPcHrJKUhz48pgn6Z6ZzKLxLqU5WtvOz0uuFJPGV6grVOaDJy1V0llRQHOJucEja6g72gpJ8ap3iI6v1imumpRS3scsrHYPQkzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LV2PR11MB556157.namprd11.prod.outlook.com (2603:10b6:408:410::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 16:43:05 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 16:42:59 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: Re: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5wB9qnnI5wkC3DPnIBykUmbbea9MAgBTYtYCAAKvoAA==
Date: Thu, 8 Oct 2026 16:42:59 +0000
Message-ID: <269f4fb357efba0727dc6217627aa15cd8a0b002.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
	 <fcd71764ae5d7a0e0cc2c2d2264ea5aefb3fca24.camel@intel.com>
	 <IA3PR11MB91362C18E4C4BA2F735D9EED92932@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB91362C18E4C4BA2F735D9EED92932@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LV2PR11MB556157:EE_
x-ms-office365-filtering-correlation-id: 76335a06-82ea-4eb3-530f-08df255b3646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: qAiFEzBxpiebNshC7FKBWoSzJrTyONSNrzM2khJeoeoXpIIls7DxF2HzfCeoTE/Bm7iey4JPhWm6xmCj9abhrwDDymSAaKYCSvuIW2mG6h5qDfJG8zKtqjOYn6Ymo5IHEcKQD7CDuv62cmjNuvnPlx1O1qm5rrWt0OYLNmqrTJyXbIW5yXONnI4ISc6FtZfcGXiF+0sZfLG0bxXPI2+fk4bIhJWJG4ucmBUvIiWOSTJY4gLvSZt4lVtmdh9UvamL1GZ1SV4eTm+KisUTjISiq30LGi3n4jlTTKOqMIhMmUY9Wh3NFkRpH80oqpMkh1qY9WKYUBEmpGQIG2/4VrC4mVlDkhofGqM7pK30zxk5nYUg7rPFMwB5b8Uj8x+cyuvZGHrjqr0hbK6gJQpig53uuoSYkEQob8Aqo6JFuDlCuyT8t91cBpC1Bmk/S8R0ztKOkk852Y+7RPdoxzo9X4M/c4v9DDcSeOPn4fmUzUSfYGPRPtUvdwvQKJuDVXC//sy4OIC3wH3wqU8AOegD+su9I12ikaV3rHDLynU1N2GgWeKOPynywLrgM2yiESjII8+gnWq3jzJVHvFVCnYof095NNCY4yJTPgbR1dfz/TegfNTNFS0uhsOVwmgxWU9dAqqWGNqb7DZPWh+iq1q87emlALzZdvnT7uxssTI9jOjs3VcMqkOokZ2Bzio3WHcRSQ16e3zLuakOzy/9ak3k1uxYd0Q5UL64/U1qxfW+18a1dNI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzZCbU16eGoranpWR0x4bnlJenBpOFVoZSs5OFRWa1ZsbjRlTXJnUFVSbDVO?=
 =?utf-8?B?QkVmNEhlVGl0aWVVZHI2Y3FXV2owb1QrSSs4Qmx0NDcrSkhZc21EVnlaZ1p1?=
 =?utf-8?B?RDFleDJYYmt6WUZWTUdsM2VyZGtCcVNoVzQ2Qk5FcDAvMFJKUW9BTWlvd0J1?=
 =?utf-8?B?blRjUDhyVmNoNmFmOFlBNGpKMGljRFFnQjVSczhZbXBjdTJ0ZXN1Z1p4YWQ4?=
 =?utf-8?B?aXZMSTArbzMrS1pJaTdDczR6ZDNjYXZDbDJ4eXQ1TlRDVWR6SUw3cnBvc3M5?=
 =?utf-8?B?cHFQYW9oYlFUNVd3VFNXR2JFRytLWG1SZ0NGS1Z3R1lwNzBaUGgzK2Z2T3Fk?=
 =?utf-8?B?VjJ0ZXFCZFQzTHBieG5zQ3lFdXI2L3N6VUc1OHVkOHBUbHU4cVhWVEJ1WlBP?=
 =?utf-8?B?RVZ5RGJtdDVEUDFBYUVmMDUxUkZlT1orWTRHVFdsN0l3TUhQS2JadnZwbVdR?=
 =?utf-8?B?REdEbndwekxZRDJIblNiRjA4TlFweGI5RHhTNXVYY2F2WWJpYzRtYmpoSFBK?=
 =?utf-8?B?RkNCeW5FWVVteUJWcHA1MXB5cmhwSVNlQml1bkxFZWVvNExpUHNvZGczbkFh?=
 =?utf-8?B?NE5GcnR6eUdiNGJaZDhkVDlCWEtDRndpRTBHekwrOHJJekhLVWxvemRQcHda?=
 =?utf-8?B?YkN4UmhDZm9FT1dPc056NW9uWGxaVzdPeW1mcGlIOFNiWWhpUUx3aHB2RWQ0?=
 =?utf-8?B?MGM1NFZNOHFhR2tUZWt2T2REeVlIVkw3WEh2a3d1TGFldXhyc1hwMW5kU3Av?=
 =?utf-8?B?SjRLY1dUZFd0Q0daNkFGZGZ3WWt5ZVh4eTlYYTFYQ0k4U0R5SHFsODFrZmVS?=
 =?utf-8?B?c202NGc5YVdaVFdVV3lyUlJXQy9DWVBDekw5OTI1bGFTSlVNNTdYMjFFMFFZ?=
 =?utf-8?B?b0VXSTIycm1mMHhDSjJtWWhoV0FwdVBvUzVrVVFjQThuRWlQeXllcm0xaVo1?=
 =?utf-8?B?MlEwVm9OcmozWTN6RHVya2V2dmpUMUhYenJiQWlCVk84azd5Uk5JbnU3aVRW?=
 =?utf-8?B?blErTTA3OWY0L3VaeEsvVHVEN3AvbkQvYjlBdnQxYUFmaXdRWDY4VlpmQ0Fs?=
 =?utf-8?B?YTM3OStWNGVRVHJkb2ZqVXFGNGJKci9iQkM4Nm1MV01US09jOGRKMDlhWS9p?=
 =?utf-8?B?bW9sRkh5U1NoMFBwOEVJZVM4VThYWUhQY0xzMXFTcnVPbEZtQVBZSVFaeDVu?=
 =?utf-8?B?czd6dHpieHQ3L1kwUWliQ2ZmNGtLeGNSc2JXRXNCRjZhbkVVdkFKbEVDUUFR?=
 =?utf-8?B?UlNVeWhDeiszSkJDOUVLekF6Wlh6TWdrM2E2QUNYYXIyZE5jTWtVNTRtcGVr?=
 =?utf-8?B?aThJclo1djhxUEtaZGp4azJEbVpEQythZ1AwZmJEWVpqVU1YdGRHdm54dktK?=
 =?utf-8?B?R0RSQytRcWlSTXhxQ3FaMkxNeUlrZUlJK0F1KzJKdlJheERlb1ZIeG51ZHcz?=
 =?utf-8?B?Zit6YWMyM3h5ckRsVlRBOG9pemdCem9TcjIvTWVkWVBQVUs1ZUJBYWEvcGg0?=
 =?utf-8?B?akFqUUFHS3p5dmlwbUR0Vnc0ei8vdS9BVVhwREp2a3crR3VmTnNteEtlc2FH?=
 =?utf-8?B?R1NDSWQwVHYremVSWkJjcmRYOG5aRlZRNGVvWloxODQrQUpUb1BjSzlSRGFH?=
 =?utf-8?B?UTQ5UXlTNWkxQjc4OHBTUWZ3VUpRNEJHT3VZSUZRZjJqcXNWOVB2SVAzd25Z?=
 =?utf-8?B?UGVLMnh4ZEcvblVWcHl5cFNGSC81QTRqaSswSXdZYzEzQ3JCTFVsWFdrYm5G?=
 =?utf-8?B?anY5cHIzRWZYRmVFQk5lUjlNRTFFS2trVHdnR0NqK2RqNXNuWlBybWpKRFZa?=
 =?utf-8?B?YzVHaUJzZk5UblkzcU9rUTROUHNKZklUWis2RW9pRzlOUUNPQUdEaE5YZjhR?=
 =?utf-8?B?Yno5OWZSbDdITy9KY2xlWlplMG9vUWx4ck9SU3U1cVludTdXR20zaDZSeE02?=
 =?utf-8?B?anNPcHl4Smo3dnNUbloxaUthVjhmTVpDRkVGSk5BbzFkS0U5QTVDVW4vb0pQ?=
 =?utf-8?B?bDg3eXorY3YxSmhsZlU1MGlzcTM2aHdzTnMwYzdIbTcrUFdNRVBLOElQc0lI?=
 =?utf-8?B?dHZWbEhkaDZETzhleDdoUHZZTDZiMW1uZjg3SkJJSVRGOEt5aVNaNkR5Skla?=
 =?utf-8?B?UC95a0FkSnlKcy9jQlJWVWM2bUhURUU5OEdCcTBQVzRiVklDUEYrekFzT1BD?=
 =?utf-8?B?blkyR0FGRms2NHhqL2orRkNHYzN0cXpXbVJjcGNQV3g1NUxTT0UzNWpmeCtM?=
 =?utf-8?B?NW9mZE9jN3FPbVdhOHdvcEcyNGgxcVEyL1lYRVljRkk2aWxqL25GMGx4cXFE?=
 =?utf-8?B?ZGd1WmcwTVNyYS8weEpQK1FBTVN0QXFHQTdnaTJMNkhXcForZTZDVmdEZmJG?=
 =?utf-8?Q?lqV8KfG+sogZBWek=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C583E6F6376C6F4092DAE5BF95411982@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ljiUVz8+EN/t8q2MQDRuFjnv38IUaHV98WREIbqgnAsXFH/OUeULhS4v1gF3meyWz3q4x0CYzamnmu+RlFr0SLOgG+WI4kYCDrzeuQnK3iUfUbtW90sUVahawJGSDkyKPy32KLyc1ysjdaipnkEuPBLdlmQObLDD4SYnWxJ7UXwGkYPQxkzmTAoUtHf0vW9eoNHLV+JsiOy1gj5DKKezlY1mAzQWQtrgX13Idke2LrEcWYY/SBo+ZHrbD8VjO+iuCUaRDO6MxMdG0VNe9VSX+Qbbq+dxQkvhCc4XbF2xRPWmM2TuNvIEXi3FozSVGxU9kgtyi66lGGP9XReBwfbWaw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76335a06-82ea-4eb3-530f-08df255b3646
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 16:42:59.2552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bpUGDWnUVQiQ+d2Es2jPmMydgdhvdOeXnCAMxTenFlSggVOPyixPtWMVbno9zi1tzt+zNsOvMniosaLeDq8q8ipnB4+TMI337SRq8j8MlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB556157
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDA2OjI3ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gQnV0IEkgd29uZGVyIGlmIHNvbWV0aGluZyBpcyBsb3N0IGluIGhhbmRsaW5nIHRoZXNl
IGFsbCBieSBkZWZhdWx0LiBEb24ndCB3ZQ0KPiA+IG5lZWQgdG8gY29uc2lkZXIgZWFjaCBlcnJv
cj8gRm9yIGV4YW1wbGUsIGlmIGFjY2VwdCBnZXRzIGEgYnVzeSBhbmQgd2UgdG9zcw0KPiA+IHRo
aXMgYmFjay4gSXMgdGhlIGNhbGxlciBzdXBwb3NlZCB0byByZXRyeT8gRG9lcyBpdCBleHBlY3Qg
dG8/IE9yIHNob3VsZCB3ZQ0KPiA+IGRvIHNvbWV0aGluZyB0byBhdm9pZCB0aGUgYnVzeSBpbiB0
aGUgZmlyc3QgcGxhY2U/IFdlIG5lZWQgdG8gYXQgbGVhc3QNCj4gPiBleGFtaW5lIGVhY2ggcG9z
c2libGUgZXJyb3IgY29uZGl0aW9uIGFzIHBhcnQgb2YgdGhlIGltcGxlbWVudGF0aW9uLg0KPiAN
Cj4gWWVzLCB0aGUgY3VycmVudCBtY2FsbCB1c2UgY2FzZXMgYWN0dWFsbHkgZG9uJ3QgY2hlY2sg
Zm9yIGJ1c3kgcmV0dXJucywgc28gSQ0KPiBkbyB0aGUgc2FtZSBpbiB0aGlzIHNlcmllcy4gSSdt
IG9wZXJhdGluZyBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IFREIGd1ZXN0cyBhcmUNCj4gaW1wbGlj
aXRseSBkZXNpZ25lZCB0byBwcmV2ZW50IHRoZSBURFggbW9kdWxlIGNvbnRlbnRpb24gdGhhdCB0
cmlnZ2VycyBhDQo+IGJ1c3kgc3RhdGUuDQoNClVoLi4uIHdlIGFyZSBkZXNpZ25pbmcgdGhlIFRE
IGd1ZXN0IGhlcmUuLi4gc28gd2hvIGFyZSB5b3UgZXhwZWN0aW5nIHRvIGRvIHRoaXMNCmRlc2ln
bj8gQnV0IGFsc28sIHRoZSBob3N0IGNhbiB0YWtlIHRoZXNlIGJ1c3kgZXJyb3IgZ2VuZXJhdGlu
ZyBsb2NrcyB0b28uDQpQbGVhc2UgaW52ZXN0aWdhdGUgdGhlIHNwZWNpZmljIGVycm9ycyBvZiB0
aGVzZSBjYWxscyB5b3UgYXJlIGFkZGluZy4gUGluZyBtZSBvcg0KWWFuIG9mZmxpbmUgaWYgeW91
IG5lZWQgaGVscCBkZWNpcGhlcmluZyB0aGUgVERYIGRvY3Mgb3IgY29kZSBhcm91bmQgdGhpcy4N
Cg0KPiANCj4gRm9yIG90aGVyIFREWCBlcnJvcnMsIHdlIGRvbid0IGRlZXBseSBkaWZmZXJlbnRp
YXRlIGJldHdlZW4gdGhlbS4gVG8ga2VlcA0KPiB0aGluZ3MgY2xlYW4sIHdlIG9ubHkgbWFwIHNw
ZWNpZmljIGVycm5vIHZhbHVlcyB0byB0aGUgVERYIGVycm9ycyB3aGljaCBhcmUNCj4gbW9yZSBj
b21tb24uDQoNCkVzcGVjaWFsbHkgaWYgdGhpcyBpcyBhY3R1YWxseSBpbnRlbmRlZCB0byBiZSBh
IHdpZGVyIHNvbHV0aW9uLCBwbGVhc2UganVzdGlmeQ0Kc3BlY2lmaWNhbGx5IHdoYXQgaXQgd2ls
bCBoZWxwLg0K
