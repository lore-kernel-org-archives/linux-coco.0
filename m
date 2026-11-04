Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793779702;
	b=JqKFtIGIJAbklOZt33O3OvuLH4yz9BtsmquEnDEJYXJGBONTfSBkgTSl3AcQa6LO3BGJ
	 3xjpOfRnMshIaKEt+LghyWIbazY9ezeleBzLBcBHhjnvpdSU86mKVjxbpUbKX594TptCW
	 6WZsh03VnMzq5CqnprWwrlBXHhUGiteLFQBd0aU9y2krvzdthqgX6qo2CTTpPNGG0HQc5
	 RYSADCqAc7RtdDHQ+s+Hklh6v+QbMPHbcv/6iCH6HH9/7UkHT/wnDghHMkpmdSIyvDLwm
	 D1dX0mEuBY1xJvTf5Exq6fkFrPd4s97pabuGyrtSD6dD1i35vYF38a3y6pIfQGOn9Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779702;
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
	bh=RGRl9s5QsX7IUVr3XNOVOY2ztb63XKHlDhJt9+di2Xk=;
	b=yA5F2/iYe+3ilpeo80cgCIVyXchIP2EKq+EWlznzw+tSMcz9JsSg0Mw0WEcRYaBqoCzQ
	 7ZuRcqDTJcNae4ps3Q3q0pJIxaVs38ySj4QOfJ/iv452sDdqAu5hOdWa1JQbg7YEF186y
	 C0g33ImEm1zIC2WtEZOp6zVgsVAiaIYE7EN3M5wuTkxrLpxrguZqLuns3Dw3TDF+OK264
	 T6OXdCSrhlyjxT91jsaQ91tLadzTzK79bvwMqUyJwev7aD+kAidlAJNkRPEJtoZix2+as
	 5Y8KrRF7hyRVlaZ+z+HUkv53yFJSWNn3tDqSNe6GpaBZYQKjMjVeDXjj89CQSoqYHoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AQS+XFo4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BA1606A31B
	for <linux-coco@lists.linux.dev>; Wed,  4 Nov 2026 08:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44BA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AQS+XFo4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793779702; x=1825315702;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RGRl9s5QsX7IUVr3XNOVOY2ztb63XKHlDhJt9+di2Xk=;
  b=AQS+XFo44Q38iLsub0cp/RVPHJcr2/Qnty/30+7OL3+i0LV0iH9NpYKi
   ulpd2JoMRXOTV1arCwxgczgRe0tp2/lseXSEjb6eS+oNMSxnCbUe2OqmG
   XfkCYgRxQUquwTcGDFDyyqgioWqyXrLZ6X4oNT2Skmzq5FP2Z62DlAiwI
   9+0Mi6qeMOFC+zKenGRb+aZ5l6cQRZ9AJigYA9nDyjvVJ8Tn2U8lbnx7Z
   uti0/VNeoAamEfz3TNnNfb+jj+leZpJ2lepHItd93boLQDHn0B7oKF42X
   DcMsFwXCJ42EEjadiF2BOpbxuL9zWMn6x07YyuNbYI5p1XP/pFIbx+vM9
   g==;
X-CSE-ConnectionGUID: ntpNHRRcRyGw1c9oRAkN0A==
X-CSE-MsgGUID: WnVUcszxQ8Ch0NRL0UjKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2420891"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2420891"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:08:19 -0800
X-CSE-ConnectionGUID: 7R89GsVqQxCb+nw+AdA1uA==
X-CSE-MsgGUID: yrDjyWuTTdmRx1305FHFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6790764"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:08:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:08:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 00:08:17 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 00:08:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSzKr53yyXhOUhvydpdqJlxSFSMP5ymzcbUsY+T9FQVIPPPtaEyMNlgSpZJcPRWyJA4liRYNPW9CQSwrNP33bVXXVyOWV66CwNXoNV4k/TeksDYzlJ8OL/QFdx1GrdPO9c3YVPNb2Lcs3l5WhMRgF77qYYOju7fMChz8FQQbvv0gHDPSPqntNUsbERiL41Z+K+yZGAuvb3fttsIO7CKJe0fxyMa2YIP/b9IHZX38sjrsRe/6Or0jdxbcj8vVeBWHbbByuyXdsOFQuoLLxRldy8NwPfpuY/n0yw3hlPPp0Gn0AIRCpG5LBXdRO0lezdMksDLw7NSMCzQ552pYzmAHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGRl9s5QsX7IUVr3XNOVOY2ztb63XKHlDhJt9+di2Xk=;
 b=l678njhGychcTKuttrxjnFProE2SEahq/eQ4Gl0zoK3/GmO239XzDXTvuT3/bc9cE+QhGXRvFCtOljD/n0NnJc4zaDd6ZDKCZa8c/9gWwqvX59Vudq8Jhz0R6eon2iuPnpnnBb0Lo+e8z6oVFuyEInISqU6eLN6K3qm0WDf3c7hwIGZeST4j/6dByASJ1CLnUMVv2YdvprZOST9mAj0LSiEGDJPeDJKhL3NZFdLijG0FKygkMidZws+TrN0c1STpBIH72PKL9pSJmBbbqGKxMvoH2G2jhX1NSMNfHPbBZi/YkzbL2NJoiovZkWyoUhZEAWx7y/ro+l3+DnGK59zTUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV2PR11MB391849.namprd11.prod.outlook.com (2603:10b6:408:410::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 08:08:10 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 08:08:10 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: RE: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Topic: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Index: AQHdS9rNXE2qGidiq0yMV6qppTayarcPd0SAgAMHKdCACQlrAIACRzcQ
Date: Wed, 4 Nov 2026 08:08:09 +0000
Message-ID: <IA3PR11MB91368E9C365AD23E500CE3F492682@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
	 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
	 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
In-Reply-To: <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV2PR11MB391849:EE_
x-ms-office365-filtering-correlation-id: fe3ce21e-204a-4c35-fc3f-08df3a4ac3e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|261022075727099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 1+RDvMT/8s7IGmZP9Vl7RmqTC74VFLVqTjDFJxGk7Pa/miMAqz7uWLr9MVLVzV8u4lR3FyOFCQO8lJcz2xtDDg5eIyu+pDDpaFmUqXt0gm4Uwkyp3WVD3uUrSX78Rt4REbRfffqbQNH8KNZUpFkczEM55D0qV5OCBLxNa9WVzi7QF7wt4NQ0P8bGqfMgZJQRe3iwoOP9DEnLHunXx2VOw7jVdDgZJRs7Wl4vLQDhmHklcUg9qiaKet+qoITfW+macjRJEc/ijsDe+w/HwmSIrsR2Q5350Eh9q/Mv4Cv5tUx85aochf3PVOXDrFxIzvAV1g5ccwdlSMAC3DYHtCXrK7C414wLOa+2rML/CE9fxj5ZnmTk6zYywcBvAH0jRjyo1mDz41p4Tv1l3xwhZ3lYNX2Ovq1eJDtQug+iocE8qQFSPDJQ6ITakowWMz0/lXqFUbeT13JR6aTf+FOMYt8rb3f9SMSI3O0SAGzzg+5SZcrlnFksJr8UmzOWWyq/7auqAgaDBCY4mfc/Cr62S2+oYrDu+P8ot/FNluK/AErlVOg9ElltTPQnWP/yZyFA+JGqgYBvMjhzQ/QQQOUkb5DzgVx1CV5KsaVPLDRVomR2qmLiiER64gxLfPaSXg5IRaW504LeH3ULGmyKddkPjBFd2ABGpkEpDpoGofpcoJ5d8z3dJAuSVfL9M9zfYMOquPL5Ajhdc/ZttmzH7bZ/ZqsFaRC1Ypb6Gm9niXsrkLkIh1o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(261022075727099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFJVR3g5L1BUUGxlSGp5bGxWWDlSTG51RGY3cHRoeEIzL1RraWNTYmp3RFhh?=
 =?utf-8?B?MGlYOHNTNGlHbnAyRlczNGRVZ2VHRmtBYTgyYzJCTys1bEdyY0NEMUNscFNi?=
 =?utf-8?B?bjFTOFFMdG9Wc1JobVk3NW1Ta3REeVBIME4zUEFNZFJhZHBzQ1gyQjBianZO?=
 =?utf-8?B?VUNrZFc0Vms2ajlZbFpNMExtZG9Ebkt1cnplMHg0ZmEvRmM2MitzWEg1Qmt1?=
 =?utf-8?B?YjJDNEVkZlNWbFpibHBhMVQ5WExackZUN0pTSDljRnQxZVRvMUpBNGhKYjNv?=
 =?utf-8?B?NnppTnFvZ0x2ZkxCL0s1NFE0NHkyeEJVazRKWWUxckFrOExTTERpN2ZMbGJw?=
 =?utf-8?B?WFBKVFRYckxlM3VURWhBVkpkZDVnQklVOXM4UlN4VUxDWmowUzNxeStDU3Mw?=
 =?utf-8?B?R2tPVFhzUW9RUUQ5VTVtZkxVSFBGbkY2R29rMEJteit4cW5rSTJGeWdGd2hh?=
 =?utf-8?B?VStiZjMxY0VwSTA2Q0JVeGhYMjNtQzM0cDcrQ2ZiWmNrbmRFREpwWGYrd1Yw?=
 =?utf-8?B?bTZYSmtDaVJSdndMRFQ3c3VFL293N1labkg0MjFmOWpoY1hKWnJLNmF5RUU5?=
 =?utf-8?B?anhsRlJ3VHJnNDZ6SitPcnV3RC9vNm9wMkVBTHhROC9odGVMMUdCMk1RQWYv?=
 =?utf-8?B?TTE1QUF3aEcvUHNld0lCcXBiTkMrMmcvVjBxNGRvUVpOa2xZcWR0ZHFrLzRo?=
 =?utf-8?B?WEdvbHVTbm9PM1FWQzBKNFBQWkxxKy93d3N2V2JDTjhMM3FDdmRDOGk5WE03?=
 =?utf-8?B?eFNwQnY5bTFxMHdYVVU2bkdrcnV6RCtVUWtqbmlFVEFtZmRZWUQrb2JnM3dK?=
 =?utf-8?B?YkpvRmh6elAxcWduT3MxWTcxVVNIU0xKM1YrM3RVTEVQUUNQelhzVTFic3ly?=
 =?utf-8?B?YUk0dTRheW01NVJIL1JyZU9OUGhlSnhTZ0dxOHlXeHBkRWFZMTVvSFprSFVN?=
 =?utf-8?B?NVhNc21EekFFc0toQWtFTEhqRDRrTllaK3E5dXppSi9ucDRJdThYSHVHaFJM?=
 =?utf-8?B?aTlQalNiT2VxVFBlV0l1NGZjSHp6SVdYUmhJcG1taHNDVmJrQ3BCcmJya1Fj?=
 =?utf-8?B?a3dMK3dXTVFNU3Q1T3Qyb0hxSWlPNEx0cVlEaktreDFmME9wMXUyS3pCSStP?=
 =?utf-8?B?bm1XWVhBZnk4NG8xdWZHdFdBdk9DcHVNM1BieURnNUFNU04wVStqVzBCSlBX?=
 =?utf-8?B?UmRnbVlveWlxbjdJdTZxcXNhaC9odkc1QWhlYTZtYWpNb1ZrbkszK2E5L2xQ?=
 =?utf-8?B?NmpkcnIySHNpMGJMOHZ0NWl6WFEyOEtkRmE1SGN1NGFqb3ZHNVFEUWZBK1VT?=
 =?utf-8?B?Vk0rUVl6S29vb3NZR2dsVExrSm9uVXljODArYkswZGNzZldwV1h0bmN0MFE4?=
 =?utf-8?B?N2JXd0ZWVUFGNXp5Z0xHNVJIcDdNM1hDTDhUSUUwa3M4bXMwdklHeVdRZkJC?=
 =?utf-8?B?VDFLNG53NUN0MUp1S3h2VFpqdzlXNi9JWjFIamFVVGs4SXU0NEJKNSs0NjJz?=
 =?utf-8?B?N1pPblVQMGxNbkUrSkluVk5FbUdTMmJzYkZtQ080UnhzNGdpRmVFcUNJTW5E?=
 =?utf-8?B?WWpvN3VMVS9MUDMyZnJxMEV1WWZPUUpyMHBBSUUyQnRiQXkrdVRJMDZNbjB3?=
 =?utf-8?B?N2g4bU9CWmJkVFh4UytId05xUEFzUXNrSE9wbXAwcEdDWnpGa1lyTkFUTEV0?=
 =?utf-8?B?WDErTE5RR3NnNTRrVytTZzNQWStSaHluZlhYUmtjaFVYZnpTRit4alhKUnh4?=
 =?utf-8?B?ZTN2M3k4YnFaL2xzVHRReWVGYkVwQ2dzbzIwbmZVQmtnV0VMT0U5Z0tGN1FZ?=
 =?utf-8?B?UXZhVURYNU5WVFlMRmlwV3lNVGJBeG9yR1F1akFSQjNUSjJvbTJiWnA5ZXBM?=
 =?utf-8?B?UGZQK2gxVW5wblQwcW9sdEUxU1BiVUV3d2RGS3RMaER5ZnRiWUNBN3dMSWRY?=
 =?utf-8?B?cVorRWVOYUt6aVNvUG5nWnBzWXBpZHh2Mk8yNmo3VlA4YllDSHZmb2hBemlW?=
 =?utf-8?B?S2FPUEliTDhnTU43bEFVbjlmWHZLMnh3RFdNdXN4a2lPZFJ5VWxmeUFYN1Jx?=
 =?utf-8?B?YURwOVBwbUNmN1VoSUFtemFxY1NUaVVEOVVoZGg4R29ybDZwZWpTMTlYcTlB?=
 =?utf-8?B?NkVzaGhtR25zWmxxV0VIWFQ0eHFIM2ZCR2tsd1c0emVCUTJzRzM4dTZ3K1ll?=
 =?utf-8?B?TndTaHlEeVJqNkNpZU50S2o0STY2NmxRZlNzU29lMG82MFh1Yk1pWll2YVZT?=
 =?utf-8?B?MFRMcGNOM21BL2lPNDhCN1IyUEVTK0RWSWFYdWlXMnhZV2YrQVFCL243Rkpy?=
 =?utf-8?B?dk15Q1lwYjZwWUExMEdEalJTd3YzSzBaMk1DQnRDQVdlQ0NwRjJhZz09?=
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
X-Exchange-RoutingPolicyChecked: 50jQ37ygjBSGyh+eBZoOu6sd75JUTTbmxkO59dYteO8hu9rWsaEl6HNpofX+4djK+ljFyraOtUQ4pwp4CsgP7nKzqQVC/Cf/+NeOpa3k2XoK/4E6bxdgmgRa5VrWTjc0D4MPUHDUl0oDR721g4sVh8MqA1P4idjQseji29XNb9YZK/te6FWtT5xL0zU9YE+SvkRtTEMbeiQuoiWs5mrbgROFFEYnNIXc+oyazymSCjhD43zlLFpALk0lq359S46s1bHSN7FlayEqRq8X4wg7nXVbe9SVz1/q8zf1XMRtw/MHKVS5NRJhWoA5k/ehc6Q5myLiQMo8KldMOb+fDTzVXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3ce21e-204a-4c35-fc3f-08df3a4ac3e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 08:08:09.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SinXzJIHcbDjUo1HkUlROPnVLvbbrZyKNrp7mPA+Dsd8Rbze0aAbqgd1onlQAh4j5tZgtBl4Vl+nJJi03t1ppbnmsJHLJZQ8jTJ1tp207nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB391849
X-OriginatorOrg: intel.com

PkJ1dCBJIHRoaW5rIHdlIGFyZSBzdGlsbCBnb2luZyB0byBicmVhayB0aGlzIHNlcmllcyBhcGFy
dCBpbnRvIHN1YnNlY3Rpb25zDQo+Zm9yDQo+Z2V0dGluZyB4ODYgYWNrcy4gQ29uc2lkZXIgd2hh
dCBjb3VsZCBjb3ZlcmVkIGluIGEgc3Vic2VjdGlvbiBjb3ZlcmxldHRlcg0KPnRvbywNCj5mb3Ig
ZGVzaWduaW5nIHNvbWV0aGluZyB3aXRoIG92ZXJhbGwgcmV2aWV3YWJpbGl0eS4NCg0KWWVzLCBJ
J20gdGhpbmtpbmcgYWJvdXQgYWRkaW5nIGFuIG92ZXJhbGwgaW50cm9kdWN0aW9uIGFuZCBvbmUg
c2VudGVuY2UgZm9yIGVhY2ggc3ViLXNlY3Rpb24gaW4gZmlyc3Qgc3Vic2VjdGlvbiBzZXJpZXMu
DQo=
