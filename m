Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793096198;
	b=xYEOiMQiQq54e3z32sj2ouk2vn38QPCe0qRL4gpTz1HFyKSNz56lKzsRMs9Po/DcWeo5
	 CuyPL21Y84wFAe+J7e+NuzZDGsGpfdDnTPkw+tHvl0s/tbHPn/t8UngctH34tp4LLD25K
	 dURkBLVhrVgXi5qyDkH8XY8BxWmTvJFCAq6v4xALZhbSwkZ77z8CiP2Wriivf5v0SOjzC
	 h5PWMeZOUiiJLGJywKWXs6+0f/sqxCAHiZGp+vM0L7wHHHbnSvQzTq77BNz2muB8j38W5
	 dsKuOAO5zngG4quqtvomV+wYPa6DYgpf3rGwWsNWMjGFej6wPGEVTKqncVv5Z29aseg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096198;
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
	bh=amLLG0AcJoUkeSY3eMl0kiM+c18Gbv0RVZphWp85xXE=;
	b=yHs8qQlamBhFRpKxFboZfuceDlv8C6BwCtD1xvMLgGbTAlH5G8KGGovSbj+FEXVuum7K
	 Qa1i47EmwWd2oSyKvVyZLq0eL9+O6/pHlCpZJO69kSTPbGMpWNQJce6cZKjUrd1pIuSXA
	 a8gs0JiLL4LF3qXyxfgSVdrnt2xA9yd1Zhd839gWC8aLN0/3jRepSGTw/SD9qeyvAMC6z
	 RRXJlcd+uvCm5Ilvr0fUe+Bxdb1wjMvDx+mwdJpbKs3zTqsPyVt0Cl8wzi0o2L7+S9tSu
	 W7xnabM+T7lYK5PyigXi92X4bO6kRTVil2iUwTy1HRaYLokxFROc6vlogBh8v1ImDew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwDF+5K8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5D1606A320
	for <linux-coco@lists.linux.dev>; Tue, 27 Oct 2026 10:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cwDF+5K8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793096198; x=1824632198;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=amLLG0AcJoUkeSY3eMl0kiM+c18Gbv0RVZphWp85xXE=;
  b=cwDF+5K8sX+o0hBhw/82KJuG2SIeIou/q9M+VIJpGzK8xHAcu54Lmg+K
   ZdS+6bxFFbAYG6XAe5L38IkedfP398n9halNhH2dee7DU0iZqkajbvcK7
   THeFcvHKQtHDUKZVUYbxeWtkI7zSfZU/7uswJa4YrO7VUusrltu97PZ41
   15T7yesRKcoF4oKA+X9yQtzBAF4Y4ECORQ4TSj5N11Q5eOZytX54MIo1+
   sCKAvpG9xfaqDP7kA76ODApkPQRUtDi1w4B/nywcdTxBwMJrtAAddqUDr
   fdzXWY6TqS4XjWy+K2tysvakfksSGT8fdvywBXIblPQjpf4/R24mYkH4G
   Q==;
X-CSE-ConnectionGUID: XJd6uIteSwWd30za7weKvg==
X-CSE-MsgGUID: 6hXyb6keRWGCUPOrlAJaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1793101"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1793101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:16:37 -0700
X-CSE-ConnectionGUID: LeMehffNQh+NPlsB5sB6AQ==
X-CSE-MsgGUID: YeKLySzTToichDQK5aysmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5023627"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:16:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:16:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:16:36 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdTHJNll0AUoYQoQs9rWB2pUvknDT4INouRjl6kt9wYQJoprLlgbZ39kX+DUSqcNrd7zIuVkw/o5MJzSOEWC1rjpxOPQtEKKOGFxqDlbJwbsmAJAAfPOnJZ0CuO164yW1rlu0KjOinkhaEXpi7X7Vyj+TIRIR50tjprgHNZwv3eO854Pnr+lf09BvMPSgyMUIqvurq/Lh+NlolpgWtt3q7q5MbZ/Ed+TDQY4+qszMcb05JpkSfLJEYky+Tegdc2jtGeOGpqlG084X4Ui6N30j3VzX+wp+F3PcjiRrcdV4nQrzxS10KTx1CXgEkBMSUi84s+X4oKFRmb6CuwXMX8FmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amLLG0AcJoUkeSY3eMl0kiM+c18Gbv0RVZphWp85xXE=;
 b=Nx7flmeOGgjgeuRSlPMk48n4/Tz1gC/WNvS51e70C2VP7fiY0YTHm4kzaAgZWTOGRC4no2pVPOsYxlEk5r4wNLvUWTdx1IEyssbhhGQc7JXxFUZOYgT2cMOZI0jQSxm408wE78sfamjiBQFKrCWkcH4y8ijVHT+2Rz9EOMnHLjLnivAsZeshj5dcefKAhvJDzj7S2C1D7vAi4i+n4pu/7zHzivRHdYt2TsowxZQU+BA3RF4fxk2G443u5WP1+o60Kc25uFpC9ZKZ3dUelUikvlolCq+nYS/IJJWSV5XHrCzPBC+hLUKRKhilRSaZgDlQGcC+iBwcBDi+POd2r+pCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 10:14:31 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:14:31 +0000
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
Subject: RE: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Topic: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Thread-Index: AQHdS9rFOalajx5+oUCDkC5Yzlha8rcPTnYAgAIN30A=
Date: Tue, 27 Oct 2026 10:14:30 +0000
Message-ID: <IA3PR11MB91367938F3B6501ADF619C0C92602@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-7-zhenzhong.duan@intel.com>
 <78f8a175-40ce-43c9-b542-45bddb443fd7@intel.com>
In-Reply-To: <78f8a175-40ce-43c9-b542-45bddb443fd7@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH8PR11MB6777:EE_
x-ms-office365-filtering-correlation-id: f4c83fbe-928d-41fc-ea9c-08df34131745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|261026140227099003|38070700021|11063799006|4143699003|10067099003|56012099006|261021121427099003|261009223027099003|261022105027099003|261022075727099003|18002099003|22082099003|261026121527099003|3023799007;
x-microsoft-antispam-message-info: No2xnJ5aoy3hpk3Q7Bin7uv+BrbeTrKvbsmCV2hK1etstN6atEMArCWDEDOkfn2WkVRimF1es+5htqDHPbOBT1oE9bYaQcmhW2RcGgOvzE1xdd2Ha3m0K9ihFXwcqWpzQsW8HGmxNXhhnqqggZBKiZntgeQm4wlCMOxPnxE+i16qA94pH2QEniNpWK4SKWUyG93F9eq/p1uylpMS+HL/w03+SGYHt2Jaj4ss/IxPDCHtisPcXZyIXuI+c1LuArQmzDbe6QLd7+PsNuDcUi+Mvn6qGe53RJvA0qXwPPe/edLLtMGAmL+nASl93tChKvcAEkqPDtRixp3bHe0ZJREmwGlSSl3btVzEwb/Z91AeC780FGCk6S5kw8S+kLI0jag5nDddzipZCqj+rbbJcdXn4bw6mdfqa/4HnUNjoE+gxaL9WH5KSOXHoZa73IIbWvpe6BHvfKYfmzghAcXWW8mA0SLgF7pKOSi+ZJHDANTGs9KKI6MhArgbwWPZUMcWHaYck7rx937+Bs3Eui5MirSeleoeVaTFkRBIDsCw0Z0NtMyWC64C+dL7GFZfEXD8BJrwwJlkqGc/GkR7qhCm7MvIh+f7gE24xnxtD2VOR+H3VkK8690Kg+V04qAXjGurr87ClL3ZMR/x66BK9nPTjmxTI/AxZZBy807p96S53EmYueU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(261026140227099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261022075727099003)(18002099003)(22082099003)(261026121527099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blBLVmNRMFFYSUp3cXdtNU14SEJqVnVZb29hYlV0bG4rOG9Fa1U1bXljckVv?=
 =?utf-8?B?QkNnazVCSmQ3VHVZNll1N3hISjRSblhPU09Pd05zVXZUbGwyUld4NzVEK095?=
 =?utf-8?B?RDcvWjRsTWVtRmlLaTl5ZFMydFlVWjJLdzREMjJSVi9iKzZZaS9qQXduQXFQ?=
 =?utf-8?B?NG9qYWdpdXpOR3N2NHJaVGxreGg3d1MzcmFTTm13Wm15OWl3WE5GSUhqKytZ?=
 =?utf-8?B?QUZqdlB6Vi9kUi9SSVVEK2FaNG5uaHp2Q29DVE0yRXhSU3k0WnhMY0xUYThq?=
 =?utf-8?B?bjZweUVjVU5UWlpaYnBSNnF1Rjh3YnhIdmVieEIyNVllV2dQVzFGV0VxT3do?=
 =?utf-8?B?ZnZlUXNaRHN5OThxNU5yUGlNTHJZdnN2WncrZjZDZFFRN1k1UU0yeG9TdWQ0?=
 =?utf-8?B?enVBQUoxZHRoRkdMdktKYTZOUzd5Z1p6NjJRcXRNVFFZa09jb1UwY2RzSHoz?=
 =?utf-8?B?bVE4S0d5Umd3NnU3Mk1wbXVqWm1TRFBzMXNvNmdsWnMwWEdYemhlMEVGZ29W?=
 =?utf-8?B?NENRMFl5U3Q2UndMK01YTmhLeDVjbzdFc3p1cXV3VEJHZFQ1RFFvaHBiaFlv?=
 =?utf-8?B?bG5NeXU4NUhXUG5vOFR4RThJak9tdktaNjZOdStiOXJhRElXTGVaZ3ZHUkpZ?=
 =?utf-8?B?TjU3NnFiWmpTaGJrMkJGcHdFV1JlMjRvZ1dzTlNNaUxQUXZyK0VhNkFacUc0?=
 =?utf-8?B?ellIdGwxN0RBelp5YlFsSFF6NFdvcHcyc3l4NmpTVEoyUlVXRkZvNFRuUEtm?=
 =?utf-8?B?SkZ1Q3NPbURRb0tjanZaeW0zUTZGK2lYaWx4ZG1qaWNWQzR3V05pVXJRSDZm?=
 =?utf-8?B?RWpvUWRJUzJDWWp6bFZlWXdrYlg5TGxYRTVGRzc0cThBUSs2Z3VsZmU1ZU1w?=
 =?utf-8?B?a2l0cEk0cUNaYmtKdnc0bVY5aFF2aVR5MVlNbGJoNjFpUHJ1d2dseFV5UHpm?=
 =?utf-8?B?WXFwTnRzYklUaitvVFRFMlRlQk9GNFFPamJZMm5GL3paeDZiMUdFdGxjcTB6?=
 =?utf-8?B?UGdKbVBCejljWUdrWXhmOW45OS9uQTcvTTg1RUFybkZrdE4xUzBGU2xJNE9M?=
 =?utf-8?B?UGx3cVhIeVRJaC9ndGlaZWJrSmx4QXNLNWpQS3hIYnZZRUd4dzlnVFVTRFJW?=
 =?utf-8?B?aURtZTBVUGZlSGJmMG14dDBuamx3dDRORms3bXVqOWNmdXhGWXVmZTFYa2s0?=
 =?utf-8?B?ZWxsOE9KWDlKOTAzeHpiWkVkdTRLOUtMOXJmTm16emo1Mm5IK3ZTVS9SZ0kz?=
 =?utf-8?B?T3FPbUN1eHRocHlKNmZHVVUraTAvUnVpN3FJZklOVjhxTTJod2pLNUl5Z2Fn?=
 =?utf-8?B?dnhIZTNkTFpHSGZBbm93eW1NVExYTkc3TTZJdVlHR3BqSFlBRnVhYUF3Witx?=
 =?utf-8?B?TUVzc0RrQ1JuQ21nSVZyQ2IzWm9qbDJRMW5zaTZpR3lVelIrQ3VRREF2NHh6?=
 =?utf-8?B?dzh3RlM2QmhqOHVUNWNKNkJldTFJekFlcWRsQlZ1OFI0b0g2MHRSUWU0N2Nl?=
 =?utf-8?B?cTA1VGFsNzZwZnlDS245S28xYjZuUWhmaEZOSWlucndOZ2sxdjB2UzRhcjZk?=
 =?utf-8?B?TXkvbXdJMmxPd242WDEzYVhTTUFkV1RKSkx5SHJMc05hR1B1RFNCWGVpaVlE?=
 =?utf-8?B?YWVlbWQxVm5NTUoxQVhxUUpVa01vSzhLdUdlaG5tNDN3dHZ3SEVnUEE4N1Nh?=
 =?utf-8?B?aHV6KzRGOEtGN1ArVmM5SVd3REdrV1lvZjV3TWtiUVVZb005S2psWVhjRUtI?=
 =?utf-8?B?RFJTUk5iTkJUYUgvRFQrUmJQOUN4M2RZQytMZFNoOCtsSUpuSXkzNmlwZExo?=
 =?utf-8?B?eWNGZXhNYnViTitjZEczbWlMOFN0TWdvYkYzNk9aSFhBdlNDOHpndW1UREp6?=
 =?utf-8?B?dFFGSjRWS29FNzQrdXRGRDlrSytwdWdXVUhodGtvTHdRRzUvZktwYVYwUVZZ?=
 =?utf-8?B?c01rbXgzUzhtQXF3QldXUkxhdnh0ZVdBSWY2ZEdlMDNKU2lFcXZYMlVoTDJX?=
 =?utf-8?B?WjQxNmlyTnY1L2ZYenZ5UkswaWl1cjRNamxvaFQ2SllkczV3M1ZrMkVnUTds?=
 =?utf-8?B?c0F2ajNTdE1lK1dSTG9UZDB2Y1hLVVdNWGppRkxEMXRpZ0N2Zkp6cktwOGIw?=
 =?utf-8?B?dExSR2I0YU1JbVRISllEdHNJbU9wckkvaGhtb0ZYZlQ0UHdCN09raVVLTzc0?=
 =?utf-8?B?b1gxenV1VHpYa25sZzBucGZVcGFBaHduZTNhcHlRd2NtOW1Ddnp5YVdSNzV2?=
 =?utf-8?B?VDE4Kys2R0dieGJhWWZmRnQ0T1RmTHI2NlgrK1ZFYVdQNmgva2llRnBNVW5S?=
 =?utf-8?B?dFVZa0pIODRrTFhhYnRMNHFoNDA0R3F2NE9hNUNCZDRzZjJZbVpjdz09?=
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
X-Exchange-RoutingPolicyChecked: eyFf1Amlm5ksFAPJjuNQ0FaSz4eV5zwi/mPgGNisUdepMpWyYA/ri36FMecz9YLNTOJ7erpJXNZP6aGjmNSz5Lm6MgrrUqxFWith90Su+byb9aHto1f167FvMbl2iIds1Y1d6BJebOTsQBTUe8MBGKw/g4H0BFWWO2p5N8aEJgO2rnFkRTuF0n6HUVNte0LFjESy12fhdj+cpvchbBxEA+YeLNbNp1/zWCJf3lIWQGIGCO+TjlAF8IYHbLt4Roh6ZyBkq/ALGaBcezHe942Hv/ZnRi45eWRomkg4j3ROFkQjHUT/OGeQ76YSGVy/JYP8UlG0BPpQSWIqiE3awnPMSQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c83fbe-928d-41fc-ea9c-08df34131745
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 10:14:30.8858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: swre9Egq8qNZ+hiOJjnXZENbYIY6G8umnZ5VEy95kQxipCFy20AD4ZyWAtm2kwsnhHUiEC/VfyPGDvUZVKXRioBNkn4T3zNi0hMuhbIxDLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwNi8xNV0gdmlydDog
dGR4LWd1ZXN0OiBTdXBwb3J0IFRESSBiaW5kIGFuZCB1bmJpbmQNCj5vcGVyYXRpb25zDQo+DQo+
T24gOS8yNC8yMDI2IDEyOjEwIFBNLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+IEludHJvZHVj
ZSBzdXBwb3J0IGZvciBiaW5kaW5nIGFuZCB1bmJpbmRpbmcgdGhlIFRydXN0IERldmljZSBJbnRl
cmZhY2UNCj4+IChUREkpIHVzaW5nIHRoZSBURENNX09QX0JJTkQgYW5kIFREQ01fT1BfVU5CSU5E
IGNvbW1hbmRzLg0KPj4NCj4+IEV4ZWN1dGluZyBURENNX09QX0JJTkQgdHJhbnNpdGlvbnMgdGhl
IFRESSBzdGF0ZSB0byBhIGxvY2tlZCBzdGF0ZQ0KPj4gKFRESV9TVEFURV9DT05GSUdfTE9DS0VE
KS4gQWRkIGEgc2FuaXR5IGNoZWNrIGZvbGxvd2luZyB0aGUgYmluZA0KPm9wZXJhdGlvbg0KPj4g
dG8gdmVyaWZ5IHRoaXMgc3RhdGUgdHJhbnNpdGlvbiBzdWNjZWVkZWQgYmVmb3JlIGZpbmFsaXpp
bmcgZGV2aWNlDQo+bG9ja2luZy4NCj4NCj5DYW4gd2UgZXhwYW5kIGl0IHRvIHRhbGsgbW9yZSBh
Ym91dCB0aGUgQklORCBhbmQgVU5CSU5EPw0KDQpPSy4NCg0KPg0KPj4gU2lnbmVkLW9mZi1ieTog
Wmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGRy
aXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMgfCA3NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+Yi9k
cml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvY29ubmVjdC5jDQo+PiBpbmRleCAxZjUyYTE4N2Iz
MGYuLmUzNjUxNWZjNDNlZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1n
dWVzdC9jb25uZWN0LmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25u
ZWN0LmMNCj4+IEBAIC0xNTksOCArMTU5LDY3IEBAIHN0YXRpYyBib29sIHRkeF9pc19kZXZfdGVl
aW9fc3VwcG9ydChzdHJ1Y3QNCj50ZHhfZGV2c2VjICp0ZGV2c2VjKQ0KPj4gIAlyZXR1cm4gISFy
c3AtPmlzX3N1cHBvcnRlZDsNCj4+ICB9DQo+Pg0KPj4gK3N0YXRpYyBzdHJ1Y3QgdGR4X2RldnNl
YyAqdGR4X3RkaV9iaW5kX2RldihzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlYykNCj4+ICt7DQo+
PiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdGRldnNlYy0+cGNpLmJhc2VfdHNtLnBkZXY7DQo+
PiArCWludCByZXQ7DQo+PiArDQo+PiArCXN0cnVjdCB0ZGNtX2N0eCAqdGRjbSBfX2ZyZWUodGR4
X3RkY21fZnJlZSkgPSB0ZHhfdGRjbV9hbGxvYyhwZGV2LA0KPlREQ01fT1BfQklORCwgMCwgMCk7
DQo+PiArCWlmIChJU19FUlIodGRjbSkpDQo+PiArCQlyZXR1cm4gRVJSX0NBU1QodGRjbSk7DQo+
PiArDQo+PiArCXJldCA9IHRkeF90ZGNtX3J1bih0ZGNtKTsNCj4+ICsJaWYgKHJldCkNCj4+ICsJ
CXJldHVybiBFUlJfUFRSKHJldCk7DQo+PiArDQo+PiArCXJldHVybiB0ZGV2c2VjOw0KPj4gK30N
Cj4NCj5UaGlzIHJldHVybiB0ZGV2c2VjIGFuZCAuLi4NCj4NCj4+ICsNCj4+ICBzdGF0aWMgc3Ry
dWN0IHBjaV90c20gKnRkeF9kZXZzZWNfbG9jayhzdHJ1Y3QgdHNtX2RldiAqdHNtX2Rldiwgc3Ry
dWN0DQo+cGNpX2RldiAqcGRldikNCj4+ICB7DQo+PiArCXU4IHN0YXRlOw0KPj4gIAlpbnQgcmV0
Ow0KPj4NCj4+ICAJc3RydWN0IHRkeF9kZXZzZWMgKnRkZXZzZWMgX19mcmVlKGtmcmVlKSA9IGt6
YWxsb2Moc2l6ZW9mKCp0ZGV2c2VjKSwNCj5HRlBfS0VSTkVMKTsNCj4+IEBAIC0xNzQsNiArMjMz
LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX3RzbSAqdGR4X2RldnNlY19sb2NrKHN0cnVjdA0KPnRz
bV9kZXYgKnRzbV9kZXYsIHN0cnVjdCBwY2lfZGV2ICoNCj4+ICAJaWYgKCF0ZHhfaXNfZGV2X3Rl
ZWlvX3N1cHBvcnQodGRldnNlYykpDQo+PiAgCQlyZXR1cm4gRVJSX1BUUigtRU9QTk9UU1VQUCk7
DQo+Pg0KPj4gKwlzdHJ1Y3QgdGR4X2RldnNlYyAqdGRldnNlY19iaW5kIF9fZnJlZSh0ZHhfdGRp
X3VuYmluZF9kZXYpID0NCj50ZHhfdGRpX2JpbmRfZGV2KHRkZXZzZWMpOw0KPg0KPi4uLiB0aGUg
X19mcmVlKHRkeF90ZGlfdW5iaW5kX2RldikgYXJlIG5vdCBlYXN5IHRvIGZvbGxvdy4NCj4NCj5J
J20gd29ycmllZCBpZiBpdCBpcyBPSyB0byBEYXZlIGdpdmVuIHRoZSBwcmV2aW91cyBkaXNjdXNz
aW9uWzFdDQo+DQo+WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83MDA1NjkyNC0xNzAy
LTQwMjAtYjgwNS0NCj4wMTRlZmI4N2FmZGRAaW50ZWwuY29tLw0KDQpJIHNlZSBpbiBhbm90aGVy
IGNvbW1lbnRzIERhdmUgc2FpZCAiSXQgZGVwZW5kcyIsIHRob3VnaCBJJ20gbm90IGNsZWFyDQpo
aXMgY2hvaWNlIG9uIHRoaXMgZXJyb3IgcGF0aC4gSSB0aGluayB3ZSBjYW4ga2VlcCBpdCBhcyBp
cyBhbmQgZG8gdGhlDQpjaGFuZ2Ugb25jZSBoZSBjb21tZW50ZWQgaGlzIHByZWZlcmVuY2UgaGVy
ZS4gU3dpdGNoaW5nIHRvIGdvdG8gaXMgYQ0KdHJpdmlhbCB3b3JrIGhlcmUuDQoNCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9lMzgzMGIwNi1kYWM4LTRmMjItYmQwNy05ODA3Mzg4NjY3OGFA
aW50ZWwuY29tLw0K
