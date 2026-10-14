Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68153486BBF
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 07:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962593; cv=fail; b=MJUoHJJ1tqDINr/t/4T88hbFWI9oesdhpORUl9XtnqbbTWwiMIt648+qFS642yj3Ttm0FI/glFdV42z9JUK3cpFpwFZ9mpGdKXQrOjg2fvAN5YT8iyjBSogPmG/2YArkI55Bx6AURAqkj+7rTq5AlQOPa+ZbLGqtFnTKbsOcc/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962593; c=relaxed/simple;
	bh=/D7hJQ7ysAZAHjs8p9zJ0irqjxmaiDIkHkZDr64VJko=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qZJDmubqw3Z/WbRBVZnG9XtG2iX2d3ljKbt2klv0UzRU2V/SMAK/zx+Q8968bsseieQ4hIoUHXr45lfqVz/XrQpQa5COiGnrp7jhJ0FrqxEZ6xLTURA2ZeeCrIuWPb5aaGiBfoWpaGO26exXxjNoqbMNux/tZYY3KSMTqzfosds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT3cfMGB; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT3cfMGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791962590; x=1823498590;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/D7hJQ7ysAZAHjs8p9zJ0irqjxmaiDIkHkZDr64VJko=;
  b=HT3cfMGBdXikv3QdBWdZxvUzxRII/P9Nt3UlGK2OTxOUGeWQLpTeyZKc
   ZOkIxJuzesjehEOuO5vKRiqHiwA/aBu7ZT2VKxwmw2sO8WijIQh4jmEun
   tTbtWHe9V15SMfzqnVWkxsLbjxZL3b9XiqDJODfY6p4uGSeh4Ejlexim7
   ZyRRNKz4uA+j3EdXfbfCqBh1o/RPyTG+JqXwsZh0LMuSbNJrFvAIW4oNP
   B8ne6oZazWL9ENB77xHUyCizRQ9Q7eNoYMQzRFFWj88vsu0kYq5sq/YZc
   8xUyeamqXYiVt6pEhMKSDw4hoFSEAOL6Y7SkBjR1BLq9ycqtnp39IWYZQ
   g==;
X-CSE-ConnectionGUID: GuE6FjEATOec/q/9XlPQ/w==
X-CSE-MsgGUID: JGMZiIrvSDCj49NnxzUE+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="585272"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="585272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:23:09 -0700
X-CSE-ConnectionGUID: t3PoGHMqTOeT31lhoymX9A==
X-CSE-MsgGUID: ZE548qVRRyKYuFjSztE+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1460066"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:23:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:23:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 00:23:07 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 00:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcJOQMznuCzWzv9b0BDAp25y/wKyyDX8c9s8PW90voRXu7/e8qLDyVqCkW/hBwVnQwTp7vcwNE6moDu3uKT5Yvla01CIacnPTSaI6q/UPGnQGrWV6D1DIJKJlXQbZHZP+AaH3a28zV5aIbKUEZOns4Wrghgv+K0bxln1bMbRh7eWK49c+q2tepsrBASBK1zpWCt96dXgbGnHFJHzTyFZ8IeN7C7UFN/ifRL3SiX0y1+7UF4LEo2ykfuREolzcY55xeJUFO6jNdp4fCueXecXj+Fg5FVHZrDmoKWwya5yqs9aG7I71sf0vKFjwsd/ws/yleB5FpdvVpnD3V7zXoLyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D7hJQ7ysAZAHjs8p9zJ0irqjxmaiDIkHkZDr64VJko=;
 b=Xh+D5yPp7PGrVCd67Nk1UWWk3SB9hLsuVVokYymnx3LzVR02oakaVqimBg3tg8Hnspdxk5u2PtovUFmcrdEvhM1z+xQ1HmvjHvSfM+3zirbfJbHOG1kj4L89gYC5f5RvdBFQo25EOQJ43TlwOsMWuijBhHgLW/FXJPWJQjN9uF95hGlCbDdOqq3LGvlXStN2ONtg3+Lwoo/PttwfWOJVPtY+/4Hb0g1hFuGXlVYt2DXRDyXJZ8ds0plauRKa1Sa/yYcO2zkhsiodiEjAuorUbpxlOgGo0mp+Gf9eBC1qSYZFGgw5TXJ7Oixi6DkoHgnzbspOOE/T5nasPHwPPt+6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 07:22:59 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 07:22:59 +0000
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
Subject: RE: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Topic: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
 Connect
Thread-Index: AQHdS9q3p3OwHlhwLEuB5opu5u+Cqrb7qCMAgAEGRBCAAAQJAIAACvZg
Date: Wed, 14 Oct 2026 07:22:59 +0000
Message-ID: <IA3PR11MB9136840C01273645FFB92D3F929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <54846068-d545-4591-b850-2980ce57f40e@suse.com>
 <IA3PR11MB91362D1D89BF53AE630A9567929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <c5105600-e7e6-4727-8a25-141955bc433c@suse.com>
In-Reply-To: <c5105600-e7e6-4727-8a25-141955bc433c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|DM4PR11MB5996:EE_
x-ms-office365-filtering-correlation-id: 34db5fb2-7702-472d-2c98-08df29c3f9ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|3023799007|38070700021|11063799006|5023799004|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: c7dCzkWPyoYf+gbYww8k/R1XAtpMaikAOwKnkzapl7sV1ZvlHuPKgRg4FfDZQLfiYRm72vJWZl7obcqvNPvS3Rjd8e754DCnOolPRHLQqugUk9nCFlKeouDu3pNxcy44V8NS4jBIH0ZBAq8kaMxJM54YKDo1A4Yg5UDl/sCGboIFUsbh2gIcESoeCY3hsptynC0wNGYtv7T/uewZgAf59ClDO14WCmta32AWnr3zBWdAiqqWCeCNT0Tbj9itu9Drgm5ylaOgxP1n+6Ti3OGHKwCImzia8glkki0MmGjAEj3yCVo7F9CrK4/0xmJidhYKcK/5wrEj4vK0TQnVX2pJAdLETo8fU9mLclSONah6qryIQLQJxVtEw8UQK5QyCss/Yfji3iqftXJCnd5Rxvr+r+1XaxanDpl30GI+RfItSK4wiGAfoFmkstRyc1SFxG97b8W2HcVQEfYicLaIYdUxWYkSLESqmYsw/WSOyKYvcy4VkWZ+NOam8ogGbHmM8SNjw56urTzSHwe0G6+25etEIeRyMErLjhL1bFe1fCkK2nm/lZxob7JVGpMKvbUUwjkj00Svlc7wRFw2mHdTtljl7bmp2/m8Q6iAOAkOShnZifE7uA3BRjwttTw48vVv6+2FlUHqNeeA3RCCJ+HiauesaxXKD3uXKTw7jl96fi33OdHJT9WZegxVl07scXlYNO50yJtn/tVJeBxP7EDInJCVtKnzFPA7a9BKfpuoHAMSxuo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(3023799007)(38070700021)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?Os/08gCv6IwrNUI0Se7FXlRHufb2Nq5cfVnY7BQfxx8f73cG+xC3v2Eg1ROuhK?=
 =?koi8-r?Q?NzyWzWObzxpHDGq+CLgHjasWilt04aXSVi1/kPxqQFSm0+sbl9q6tAdH5BD5eF?=
 =?koi8-r?Q?IOb2PDCykxrJvAPEVq1PfvhA7KYi5JLy1UAnnQdNEtEXGvnWIjxOsqlo2vq1rY?=
 =?koi8-r?Q?hNBISx+KqhgtAU8Xf1xvgV+UHktszQx3nDf+B1/zjk5cgdd3y+eE9XOIAh3wZM?=
 =?koi8-r?Q?JFxb4k+hB2bmsyiH3gUyNvG7qUHFPQBCFBJaLS9QwKmgSH1wLtv6wHVfYNp04W?=
 =?koi8-r?Q?ZjG9CN8WbwyT2CZfB3N9m2sUv9fC23/0kBxkUh69u2XskHQuQ8H7L5cYtFehql?=
 =?koi8-r?Q?j2s9tcxTW3N9qSBeNWAz2PRFAfVjvbMT3u8tQ1+mEX1HL8Hz1W8gyul3/0tExm?=
 =?koi8-r?Q?XZSXklVuPhSo//GLbcv2OilfkReaQxajJZVL7R+ih815meCZu4bsQEKw//234y?=
 =?koi8-r?Q?Mf5q8zesAyQWK2/pwFjf3VW3H98jvALSdL8uE+Ko7fkC1UoCzrp/4iMCRt5stL?=
 =?koi8-r?Q?fTedm/9CJERoRcUtxqIL3QJT9eZQ0y/fpQj/jLNh34Lv0BnJLJQ2/lzx4KM8Hk?=
 =?koi8-r?Q?cPSpVtQE26ArCTVsr4EMqiBmyMXKLBY6lWG8i99HMZnEe7oog0df3Ixbvi5GlY?=
 =?koi8-r?Q?7YcWvgU1rdzoVdXTYe9CEQfYFplkegkABJpFHRJfyWp7jM/2Kiiwxy3bzuD73h?=
 =?koi8-r?Q?mFceU7g5fqySkvTn1NmlGPKT0ldBJO5pzvDktjK64BR3JeQE5D/VakYbAX+Z+A?=
 =?koi8-r?Q?lwQ7YiX91SCa4mP5RAOWDsKuChOg59t74mth0kusmIFXGXC9Fw5KUsB5GfIEXG?=
 =?koi8-r?Q?s88afnEJKOMkUpLdyD4K3i2fkuSJ9WAzl5jYwO3CrZ4NNRPkK2oo6m+349f1w9?=
 =?koi8-r?Q?GHwlDHm5KIzbrBrniDD/HPNXKfGoUJxQJyuvh4gYSx9QmSc9K2lMpLJ84KKpLt?=
 =?koi8-r?Q?My/sVsfbY7PjOkOzbbQA+2LoHDzkrnAoDULWyYQ/hOU5g4xohdrIk46pH4IuAe?=
 =?koi8-r?Q?DqlklQchb80MKSmN84y1ju5L3ShMe8odykky2FhiSNGflbVggpxI2vb9ppEyR6?=
 =?koi8-r?Q?Z1MYRUgjnMhL8TpOkW0E8r/Zwr+wPVcvTcG3higWFVBPQVF3wD38H+LrZRiNjX?=
 =?koi8-r?Q?riPzxToOkYuRk0dv7SluwqwjkP6uC26DzBnHUG8zUVQpS2CsiMhlxH/W+DHynn?=
 =?koi8-r?Q?hShFSHfgsFlre2GkTf4GmruoyGEa4xMgqQH6nYgWor0pDPt/C3d5gg5laV33nE?=
 =?koi8-r?Q?VR9udjAGnW7B+EOsFCw2Wnme92enz7PeHtdU9PejLTm5GKv8nxc7plAGq4MEXY?=
 =?koi8-r?Q?HPd80851js3pSLNqwaLcOyf7Q56QNCGLNbEY0iZ+ddoRyGRodY0e850VPPpJaF?=
 =?koi8-r?Q?1brHz9Q64f9dOdYCKN3C4QPf/LPYqSY6HZ+eTPkEr9imftXtfA/iyFqBzYHLQM?=
 =?koi8-r?Q?vyxV7wzL6sdZblFimm2hz/wVMVwVIF1Pe4QH3Gy4+RD6Eo5qOUWIPcxTZDW36Z?=
 =?koi8-r?Q?UemADBCgenD2Tdy2K4wj+wENNhFIUvNzBnR+kdJPN1oiNcawwmLFF3gyvmCsUo?=
 =?koi8-r?Q?niD68q+MIL6KLGRpDrRtYtPclt5wuMtbzCvUwj3GyN41OBlzz1R9URS9Y2hr1E?=
 =?koi8-r?Q?Vsga5uF0QTU2CmetiicV4EUkzS0pBv4+9Ll+4NR78682+dwaFON9RFwx/KFP50?=
 =?koi8-r?Q?VqyYeMmeMV7Aow=3D=3D?=
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ku3d0judOXYPwfr1m1g4+Puq2oZiEkt3ja1u/H4JeVHCPAY5qENg9mX7sjnGw8+5xv0q4q3Uaxu1GRXWNopKbI9dTzQ988aUQf0ISBHOjPdmFjxi3ryOEBJpAe9DUDmv1RhnE+RZd+PdNK4Cob2gt4FvJ37fGbyT6TtTweecfr/T9Ybl3SBpc98ypQdyE+8jlW5MkXpdG32JlHYsuYeXWxHC7K6F8rEnP4YLlkChlr5Zxhi5FmnLp6mX4sTh8RblUw4hkMot2XcnllQFUPrLoAQjDp7Y9UA2sHIRB+bEwtN1qHEjS2g78ebNubqTPnzpmkZvVijrW2M2a6L/wsFAGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34db5fb2-7702-472d-2c98-08df29c3f9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 07:22:59.4030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNETowpAVGWxJCAHeRfTAL7rkGCGXuzW0yoIWKLF/3/39ONephVvQJb1ymsPQkq9YQXNy0qNmciGtK1kyW1dyj6Or6FZo+wD1Xp14fNdK6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Nikolay Borisov <nik.borisov@suse.com>
>Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for TDX
>Connect
>
>
>
>On 14.10.26 =C7. 9:19 =DE., Duan, Zhenzhong wrote:
>>
>>
>>> -----Original Message-----
>>> From: Nikolay Borisov <nik.borisov@suse.com>
>>> Subject: Re: [RFC PATCH 02/15] x86/tdx: Add TDCM hypercall wrapper for =
TDX
>>> Connect
>>>
>>>
>>>
>>> On 24.09.26 =C7. 7:10 =DE., Zhenzhong Duan wrote:
>>>> TDX Connect is a TDX feature that enables secure device assignment,
>>>> allowing a TDX guest to directly interact with TEE-IO capable devices.
>>>>
>>>> The TEE-IO Device Control and Management (TDCM) hypercall
>>>> (TDG.VP.VMCALL<TDCM>, defined in TDX GHCI v2.0 specification) is the
>>>> primary interface through which a TDX guest issues device management
>>>> commands to the host. The host processes these commands and returns
>>>> responses via a shared memory buffer.
>>>
>>> This patch contradicts what's going in patch 5. Because you make it
>>> sound as if TDCM is yet another leaf of VP.VMCALL, but then in patch 5
>>> you introduce the polling code to read the result. And there is not
>>> enough information in the changelogs to understand why this added
>>> complexity is needed. Isn't TDCM handled synchronously by the VMM as th=
e
>>> rest of the tdcalls, is it perhaps handled by TDX NRX module?
>>
>> TDG.VP.VMCALL<TDCM> is the leaf used to submit a TDCM request. The VMM's
>> return from that VMCALL acknowledges the request; it does not
>> necessarily mean the device-management operation has completed. GHCI
>> defines asynchronous completion for potentially long-running operations.
>
>But this is essentially an implementation detail, and currently we don't
>have the host implementation. In that case this choice must be spelled out=
.

Oh, we don't make a choice for host implementation. Host may complete the
operation and set the final status before returning from the VMCALL, or ret=
urn
while it is still pending. The guest handles either case: it checks the sta=
tus after
the VMCALL and polls with a timeout only if completion is pending.

>
>>
>> GHCI describes polling the shared status and event notification as
>> completion mechanisms. This series uses polling with a timeout; it does
>> not use event notification. TDCM is not implemented by the NRX module,
>> although some host-side operations initiated by TDCM may use NRX
>> internally.
>
>Right, those operation falls within the TDX connect spec. And TDCM is
>just a subset of the VP.VMCALL interface used for tdx connect
>management, in that sense it's not a "separate entity" i.e a discrete
>module but just a collection of functionality, implemented in the VMM?

Yes.
