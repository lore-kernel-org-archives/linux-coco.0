Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793157843;
	b=m2fCQJiuuqKgw12ju5Cy9oETi49LjtbJufbWns22GHJ9XjLKt7yaHpkws8tLi735Q8AA
	 3so5c5r7B1CGSEW3UJ0LIweXHBDCSn3Jprln0LHyXIfAVOLW8Mg7prd6RyNQ0p9C4wBXH
	 D7AlHSo7snx+G1yucfXSTrIIo/LrzNbOxqGGXTBhr6GyKyj18HvfkUD5KKyMzPaCIKxRk
	 QH5TY4TDifmxix0DU57P+pvyhajiGW5V3BPPsmetHNbPJaJHN8DxvoFl11UIVj26nYXbD
	 ysln04h0iPad6pRfXVdeTSy50uG3hgXk5BXnrUof9MoLiussz/53lvnr8zdTbUDhIAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157843;
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
	bh=L8sGJ++avWAWJhM3ZqIQ4XKBiwxgxNnxGQ56fR5oJlg=;
	b=t8nbSWdCxpY0RqK4Qe1nJ4lDnaHjliqZ6kO5JKsNiKjT21hBqCmN5L36cJql1GBSJntb
	 F4purX9vg3GHe/IJAZmN5fZv/uMpELfD0ZT900ncAbuDUKr4RcZKZarD+Bg049VrM9F7Q
	 VXiCMO4+D3CcYPcjcCcvgNAz96xgut90u9ugkmjN3fKr1EqWQzGfSgAzDrWrinni02LrJ
	 XAMqn6081aot/Zhau9grDtcpVv1GhVC7W19xvnA8iDmQaX8emdmpH+81sXZ0u3hg4ZfoH
	 JqfJ3LinWbY9h1Jgz6c/toSYpOyjnYCOWqMGndqr7C6NrRIpdWqX8TmYYunVdFSFN/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QKqbnKk9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573C4606A31A
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 03:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 573C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QKqbnKk9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793157842; x=1824693842;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L8sGJ++avWAWJhM3ZqIQ4XKBiwxgxNnxGQ56fR5oJlg=;
  b=QKqbnKk9yZF3i50Hzo3eLuBJLY+N+hVkwPExLJNS8EZjGw6iQGz+FZp+
   5X3jveo4LCBkfLlrbB9I/BIMktziIHNb/zUkmVQjWsJzASuyIWi7As8vT
   WtiMFh7XDV7+1TkpOEFKHs+KBSI5CRei7R8wIUQ0dbnXVV2LvwScfODG+
   hYNUvLl3+xBJv4kr8LvzOrdOhMHEdFUtlmSTOZH/YnNZNwRRSBnyWaJGC
   yGMWvjkyS3S1oGoSisgZpdFab8IhwjpjzU6MmirrdhtmeWyGbplPWp1zd
   rHsGugZhOpW4jiybLRP1ABjs8vEY1jgYdTwtrx5OAXWM+YpQkQGWA1mPJ
   Q==;
X-CSE-ConnectionGUID: lojSH9+bRLiDXhYXMnUCUg==
X-CSE-MsgGUID: tbXHaGkhR6ygSRN9nbxydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1884303"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1884303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:24:01 -0700
X-CSE-ConnectionGUID: YsoIoAb6StmBTzICZ1b/9Q==
X-CSE-MsgGUID: xrkOIUp3SgegFHaLByVYtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4702449"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:24:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:24:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 20:24:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQTsLkXNkybkgkwqLOLii/AGpPJol1AU1BacC1OohYUbOmLYkjtHKGe97B4voybx02EoDJ4h3tkYhzQAHzLnhIOZBGLqdff2pbB9ISmxkPVHoqEA4dX6ad3TZXKxM518e5Y+t4I8kmeMdpPS2REO4wt2Bhj+HO0u/62Z/GuuIqlzUNyYF6ujNtST9DUJJ+wMzbsoBdDIYOnLst8eDUs5ktM3XPRZN3R1Jt3GX2j60p6UCs8OIKwXAwG3vvkPNslFbelahl+qJf0QXD3R5goS1LR7lsDW7FWrLfHifOGxWWFeh/YwH+PFy6Ck8CN2pXERRnRB1g6ubQ885Nln2AhMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8sGJ++avWAWJhM3ZqIQ4XKBiwxgxNnxGQ56fR5oJlg=;
 b=tKsVJlCDyCyt2ZM+FPfJOymLv4nUVvvsH/vfoVQfpT8drKElFVfFwC1AnSZu42r+vScQbmFrCdAkJBHueKuwtCAYvta8vIb83vebntmEPKkPWgt0zt7squHldyoO6l2j7xkLcBYf++Rpq4tAkImJpVeGolHhdwdtY8OZa99fMEoiMvubmDAZRhpi+QBbGCjzXdWeDdqJLx2CLUZApYBHQhfXmMls57BAJs73Tel+RhTWMldYLEKVaRDGtxlolgLvncHYxPsf3KZsSuCuoBtoV7TOCnlOClfLMffgNA1e+si+Js+jwRjT5atJWBqQs1pPpyD8Gskpcl0B0mgYUGYTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH9PR11MB006246.namprd11.prod.outlook.com (2603:10b6:510:414::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:23:57 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:23:57 +0000
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
Subject: RE: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Topic: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Thread-Index: AQHdS9rNXE2qGidiq0yMV6qppTayarcPd0SAgAMHKdA=
Date: Wed, 28 Oct 2026 03:23:57 +0000
Message-ID: <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
In-Reply-To: <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH9PR11MB006246:EE_
x-ms-office365-filtering-correlation-id: c9f03331-8efa-4236-86c9-08df34a2e6d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|261022075727099003|261021121427099003|38070700021|10067099003|56012099006|22082099003|18002099003|261026121527099003|4143699003|11063799006;
x-microsoft-antispam-message-info: XZnIFrQKtCq/fK3dbBjRqHXstMz9w8za1VN7jnQHXQSbdZzkFQ6gDo6xJMgWvF7fDTmA6exhIB8ZW3PuFTIyaQCj7MbfyAMtAVxvPyRVqoatoqC0VBIuUKhWagWZ09X3kBWf+GUWZtrRc/sFL2g87q6M/GY2lScxJhpKZNl0J5Bd+HVdNV7dglXZdBc/AWNUOQluM8hXX0lRIPYdbxNJU0uhhtuIuIolJTzHyPDL590uis6Wsf6/8A02dAeoiOCBHKtU7xgIHv11N7TEEJ+Ceseona8/QGdEH0zNM7vg9VSaaUlOyd4LOVmnITMI8c6V6vc2mddrfh/p9KpsK1/6uDCGSfGFKT73im3caa2d3jszvSZmlN+RfUjBN+ED3Zuwl3+6S6N0jtxxJpxyiB6rtXyv1DovNNQX0uds0W9BHbkMOkuFgdjB0JWfHheU1O+vbnv9tSkCfkyHfG8hAxMaL8OQxIr1VhcG4V+hm978Iyjihrzd33akWiOE8fJFfyXKad+LrzQzi8K/g5BKXUhdbb6/Zup1tzaQl7k/zgFzppenHjV9cNiXqXqOIPs1kRjT1pZ97JYiqMptxUI5gFTACTEFZWXIIPAI3vl1+wwrUccO9ryVXEwFm/BtMQTyq1pxENuGih/PAZ6bIMjG7vDuUhoFBoMHEgNf397NxdOpcmIIbW6U8FrRkA6SbG7s4sDv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(261022075727099003)(261021121427099003)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003)(261026121527099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekpvZVZNMks0K2tDUGVxdnphbHlkN21CYTBnN2lyVCthNmkxNFBza2dLNSsy?=
 =?utf-8?B?WldZWDZ3V2ZBbkZZVG5Xa3B6Y3BaUkp6L1J4MElLMllEQ2N6ZmR0M2NveUVp?=
 =?utf-8?B?NjZCUzNTTEJjQkpWUlJEdUFqV202R2xQejdEcVBxelhjZkJHTWpXWHNNNk9Z?=
 =?utf-8?B?MzFKQmQzbXgzYjFqb1V2Mll4Z1RlajhjNUFFSWtuQW1xeGx0Q2RUb0JkTGhy?=
 =?utf-8?B?Q2RBd3Z0bndrVlBGalVBOFRaL3V3alUycDBDTDgxR0hPR2JMeHlteDlwajc1?=
 =?utf-8?B?Q3FmeUxxaUhOQ3hubGhHRFF0NFBLQjZnaXkyMERmeVltY2QzYVlDSytsVGgv?=
 =?utf-8?B?SEFhRFJRVkgzbjlzcnZPUGhGRmlSTFE5M2FxbyszaFBGVE05THhVcUFKSVVt?=
 =?utf-8?B?ZWdmblk0VHBDTWs3QXBsdUpXODBscEhmTUpZNTJ1cW1odDhsbXU0eTFIQmtC?=
 =?utf-8?B?U0tlMU81dllCaUVQRURFeHhEcnl0VWhNWVJadzVwRStaYkJ6anVhbGxuV0lS?=
 =?utf-8?B?d0lqaHB2U1dGS2NXcnliNzlIMHN6bE12UVJPdytTbWhLazNFY2dPeG15L29B?=
 =?utf-8?B?dkRCQ2xvd3M4MlI0d3Y3RWwwelg2TDNzdHozY2NiRCsxbmthSi9kNWRPRytG?=
 =?utf-8?B?ZDR1L1NOdnd2eGU3bE1zMkkrM1pPZ1RvNExLWk1CdDJJcEF5SkZyNXFKR2ly?=
 =?utf-8?B?R29MNGhwNTdYWVpSS25LK3g4L2ZGc0FsaXF3cWw5TGw0VjlOejZ5T0ZNYVJt?=
 =?utf-8?B?dXAyUVF6R0dyR1BJUEZ6R2VWRlB5Tng3VU9qNjNlN1ozdDlZV25UaVhBZnBq?=
 =?utf-8?B?eVIrblB3NDF5aFc0QkJuSUhtRkd3cVRKUUs0UEZmQXlGYmZZM2YrcXRoVUc5?=
 =?utf-8?B?YUI4WmdFd29xVUxwL1FJcUw4VXhzNzFNZGVkcnlheDFjUmpObEVqcWhPUG9E?=
 =?utf-8?B?dEtGakN6Zm1GSlh2VHJ3bXkyZ1F1ZWFxQXVHbWdDb1NJOURod0syaFdkRm1j?=
 =?utf-8?B?M3ZaOHlFRG04aXlubEE4NnN1akJvR1ozSTgxbC9jWjJNSk5GNi9BR3M1UHZy?=
 =?utf-8?B?akR0RStCQXJ6cmF2bDBvTEZZSGRwVVVCL3pnQ1p2b3RlN2dJWUdLODM0WlVq?=
 =?utf-8?B?NndKSGxJNVlIeHp2N0pEbGVWcVkvMlZyWHNwVzBoaVVoZlRWaW1wc1pxcWxM?=
 =?utf-8?B?MVBCUTIvUHhpaEVvUit3VjRtaklnSUZtSHNCb1RCSUZjeEhKR1VPMnozTHl3?=
 =?utf-8?B?MEVOVWVsd1poeW9ibXozci9aNXNhSjJyc0JxVW5kcjZwc1IvNXhVelRVUEN1?=
 =?utf-8?B?QXh5QzExbUlVdXZPcTlWb0huMUJmT3RPcFUrWnNtczJNS1lwaVVrY2NSVlpN?=
 =?utf-8?B?eHBwbEdJT1hXYnhNREd0eklLSVQvVkFJVzlDQSt2Uy9vS3NoQS9tdFhQOVZu?=
 =?utf-8?B?UFI3NFVySzg1RkpCTjYyNmd2WDVBOE4vVVRZOFFhcisyUFdvcVVOOTVpV3R1?=
 =?utf-8?B?QlBMQ3pLS3FHc1hrcEhuQjROY1VFckxsUTd3RHlVWTNCZmozU2dQbVcvbXJ0?=
 =?utf-8?B?dDdFVGtKYlVPRmcwZk40a3dtSktzdXNmQ1ExQVptb0xQdUxmbDAxTEVGUEpT?=
 =?utf-8?B?SGIrN1Frd3J2dWRuTDVqalpkWW85VjZiY01MTTVjUFdQMzdJUUQxOE1veW1S?=
 =?utf-8?B?cENTUXB0aklKamdqZWVEblloV2liNEJUZDczRHBGbmVsSW9CMlBVUGp4ZWRr?=
 =?utf-8?B?engrUzh2TDZBL1EyUUREZEVkbWt4L0Vkc0hLd3BaUitXa3dWdEp0dGIvb1NW?=
 =?utf-8?B?WG1mVStVZWVvTzhLNWUvNEM2MThSL0pKcXdteUIyRG5VNUNnaUU2MnBXSmZW?=
 =?utf-8?B?WmMybnlTZkVId29IdHdZNFdlQkRWWXMybS9YUmxIbWdyMnNEZDJ3SE5pejZz?=
 =?utf-8?B?RGVVeFFTQkdjVnRPOW1SYWlzK0VIa2x2OHJVdXZ4Z1RsSjBOTkd2aWtjY0xU?=
 =?utf-8?B?UWpqYkQ5L2hxWUFGcnozcHhBdHRwSDZEK2JvNE1LREdqbENBRXB4cXJTRFlP?=
 =?utf-8?B?V3RBSjFEak1XME01ckVpM05WUEQyTmtxc3FXOFd3MFlSdUhBcFF3d3Yyc2ZE?=
 =?utf-8?B?K1Y2TDZYaVB6NnJLamFZT1ZPcm5lWFFoM0lqWEJZdVI4RzFiT3V3UU9RWWJ6?=
 =?utf-8?B?eG1rTlpXQVF0WERKTDBnaVY4VXNCbXhXOW0vN1diTFpoOC92YW1sb3hRZmFL?=
 =?utf-8?B?dDBPTklSaDNRYlB3V2E4OEs3cUVNZmVQTmdwVTQ0YWNoOGQxZ0p2eUg0N1lG?=
 =?utf-8?B?SVFwRGJtbDJ3ak5XNys1NW5rSE9qSStxYlBubk1uTW1CWitCRWR0UT09?=
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
X-Exchange-RoutingPolicyChecked: LiSAePzPtPBAAjJRIot+2DfFmjDEd/ZvQRwLlIkrHk+00osfskzvnsmpd5SjZuzg3o4KNFAgp1fiGz40VDhXkAqPxa9jB/3ZXmmtENnvAC1wZ9+NCq4EkucgdoNT5v1zOF0+SLeqUEzObmgp0DJ/lIAc7fX6xunkfFAZJbHljP8PwdikA2e8hAhPUvjOCwI7dN3dbQ29A04oZdsb09+ShdRa+sHjhy9xQvvC2s/xYAXi6qhtjyixKj1TYOwA34zLw+rsLzC4UsDWKbjLealrDBJjWT5a75fCqgcKxYqU6vbiohMpsocZtx6sIoSyXDuORdGsZyHhNz8IwQzBUJQIkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f03331-8efa-4236-86c9-08df34a2e6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2026 03:23:57.1812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cq1x5ubuB//zfjx9y1sKmvrz2rIl0TLwXb9L9AHYUt1+glSd9RgtOh2ajSOIIuxYJHKrDtOFPwphdYRAdSoLkJ40kqvwHckEIzgnzorSA1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB006246
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwOS8xNV0gdmlydDog
dGR4LWd1ZXN0OiBDYXB0dXJlIHRoZSBUREkgcmVwb3J0DQo+ZHVyaW5nIGRldmljZSBsb2NrDQo+
DQo+T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IFJldHJp
ZXZlIHRoZSBUcnVzdGVkIERldmljZSBJbnRlcmZhY2UgcmVwb3J0IHRocm91Z2gNCj4+IFREQ01f
T1BfR0VUX1RESV9SRVBPUlQgYWZ0ZXIgYmluZGluZyB0aGUgZGV2aWNlLg0KPj4NCj4+IFN0b3Jl
IHRoZSByZXBvcnQgaW4gdGhlIFBDSSBUU00gZGV2aWNlIGV2aWRlbmNlIG9iamVjdCBhbmQgZnJl
ZSBpdA0KPj4gZHVyaW5nIGRldmljZSB1bmxvY2suDQo+DQo+SXQgZG9lc24ndCB0YWxrIGFib3V0
IHdoeSB0aGUgcmVwb3J0IGlzIG5lZWRlZCwgYW5kIHdoeSBpdCBuZWVkcyB0byBiZQ0KPnN0b3Jl
ZCBpbg0KPnRoZSBldmlkZW5jZSBvYmplY3QuDQoNClRoZSByZXBvcnQgaXMgdXNlZCBpbiBuZXh0
IHBhdGNoLg0KDQpXaXRoIGJlbG93IHBhdGNoLCBJIHRoaW5rIHdlIGRvbid0IG5lZWQgdG8gc3Rv
cmUgcmVwb3J0IGl0IGV2aWRlbmNlIG9iamVjdA0KaW4gbmV4dCB2ZXJzaW9uLg0KDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMDUwNzAyNTIuODQ4MTAtMi1hbmtpdGFAbnZpZGlh
LmNvbS8NCg0K
