Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795747855;
	b=cnZUUy/P/du06OCebzsL8FaVtqWQMNHCvq2h0lAZbVnRGIFLDWeJIhLvuutfJCXUQrz9
	 I6mEuUSTQO9Ua71I3VP2lLjmrZmN201JgksPzHjv7A7X+Lr8P5SWss3hNIxswnnHerjtB
	 0rXZAbE2HW0hhIJp45VZXhDpIDY8UO6PJxcc5IDyzHxGXFLDFIyP/0NbI0wGRUNRIOkXS
	 7V7ssCdG3Ke8bPmilSEUvwhZr0U3DLK3RLRUh4YCuzGPYWV7kAlqk8kk/9rYpjgx8sHeN
	 Z59HxwGXFnJ+Ep1LSqLWdAF2zeB41OtAwfR3SrsSmYnIdLcVHz0g5CnKT04wt9b/Z+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=qMUdqsAylVhIR+ymPwhOzH5fQ3Q5w1dK6R7yeZcsvNM=;
	b=nfhZYVST0HQft2X89xZYoGe9gHcONoxtX7vy69xJHxIUd31aBMtI4MlUz2EtbfH1qXpJ
	 aYzzb9avPyjN1HzoPWyHw9Ls6mlbY+PK84X57qGgpbEJMOi2N8NoD0MsAY98e8nAiEXly
	 p5/iGcdzpbBtSpFLaYFmysfKbmlAzLBM3WuBzZkJmK+tdSEvSv6q5z9GSKVRtem0na6+C
	 3TX5ULmmCV33ILuQXw42eX3WR54iiEFiUedekDM9CY3ppn392FpHGmF4iJc6y2zJ3UTtu
	 +aLI074ZCOMctAXYTTO6yhxCfsBF2UdlM9KeTh3EjmuuYBbwQnm9u+HUtiTbfOoqmoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHhGkERS;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=K+IPAApf;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25808606A31C
	for <linux-coco@lists.linux.dev>; Fri, 27 Nov 2026 02:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25808606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aHhGkERS;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=K+IPAApf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795747854; x=1827283854;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qMUdqsAylVhIR+ymPwhOzH5fQ3Q5w1dK6R7yeZcsvNM=;
  b=aHhGkERSyT1G7/fFGaNMg6nG7ZEkjsY929UP4hcvK3LNMw/vtYVAhnWH
   8ZoBHddvLlgKm7RM9DpXpy+ruHNEA4uZW7BVoITEYnm2QyyJaZPMguqyB
   n2FQtf+SSggpOVxhMrKvOd/AjiefYaav8NLYLHMe9LAhq+ZK3Jx24n4/6
   xA9CFM9Ux0C3fNcycH4+HLp+Av3e1E93qCLSdke6aPPnneMzX5+pRaeqz
   kAhxtXHgEGcbR9yMI+sa944M+tZ0kNBogkJw38KTbwAV8gGPXHj/vJ952
   9hajjQag5LvREsbFKzbJFoozg65Dg3hhWs+dCwpHAS/gR6xqJDmK9PXqv
   A==;
X-CSE-ConnectionGUID: NvSZc8ThQTeUMK2x0J6w0Q==
X-CSE-MsgGUID: HXtO9Z+cTjWjqlm/OHnINA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4654637"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4654637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 18:50:53 -0800
X-CSE-ConnectionGUID: s4xxgZkaTVmusIhxWeGzoQ==
X-CSE-MsgGUID: gaNJBRyGRCewgTLxUnkuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12325609"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 18:50:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 18:50:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 18:50:52 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 18:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flmLn2X+0/gicR7KuMaajHxxCobCVmKgxf4Hdah0DHUUDP0ypzznC0YjD/teMOaVa6i+rXTb9XTCzImF1SIZrZKgBycSG6U1PRwFycYIDtbCu5oNE2DWy4y6XrWQQBUu8FmWRPt5gRW6cr8yq2za/fQwghyHxJSABdrXIzfqqlwVXb/0/QM0FD+4j9OotR4hhOJJJTP0oIE8Ob2zi3pb9A2MwW4UYbvcnmV9wv8lcHq220r4gJsXpzvrVnm/Ix+PsTInlPK0+KMXTHH9/JyB3mFz4VfFDLbjSpVySZVJ+cXZHpRJVimC2U/F6vNn+k5CtsTHUOsDDXoGPcK/nU5xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMUdqsAylVhIR+ymPwhOzH5fQ3Q5w1dK6R7yeZcsvNM=;
 b=GMimwd3gD2zEwi5U9yHuw0P3bNXKiMZYOIfR+j0nOiffjJjdrEwaTAPWQOrfctB6/tmMKLJWLSINrvd8Hzv1Frh9Tfs2cZfeLgqB3HJP9TY3kupGkzynpwAsaRjaQFIShRGmMtbrqr1X7tn37Dc5fayYdKlxVbs84OwKCOXEWOxXSG4G1s/YA+3ddNlw6WAci9pzNHKXgYa0q8IopcXNsMtPZ8bbOKleTZA1QwIu/Ao2p6yClkIEJGKlxrZJrSNAK5cm3LYvdHW09TfSTxyBM9mPr7QOY9c1IxWune12g3o/ruY6A4ZrJxlyF004izx3+kU/LuUT3cGWS5f0Ry5jwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMUdqsAylVhIR+ymPwhOzH5fQ3Q5w1dK6R7yeZcsvNM=;
 b=K+IPAApfsr6AYSwtBjFWgOd7bLf2scMFk89TrTJGuRPM+NWkVAV6O7Ygin5xUQHOHg5fi9OeVKD4A8iuil5NfQZXe2DvVdxYYHoS26wwmu8CGh6Oz4Fsk7LhQbdle4ngPd6hyrMNUpj8bR4ohSRXypGyf29o83/mirylxFfSEE0=
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 02:50:48 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 02:50:48 +0000
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
Subject: RE: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Topic: [RFC PATCH 00/15] PCI/TSM: coco/tdx-guest: Implement TDX-Connect
 PCIe TDISP (phase2)
Thread-Index: AQHdS9qwS7r1H6b0x0uLj0D9aHrAKrc9GswAgAATJ+CAAzbRgIABNqxQ
Date: Fri, 27 Nov 2026 02:50:48 +0000
Message-ID: <IA3PR11MB91360A79574D0A70EDCBEEFF92412@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
 <IA3PR11MB9136465096B2B1D5152C1E1C92422@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f8102f9d-118a-4255-a332-11aabd47b7fe@intel.com>
In-Reply-To: <f8102f9d-118a-4255-a332-11aabd47b7fe@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV8PR11MB8746:EE_
x-ms-office365-filtering-correlation-id: c6e8d667-029e-4b4c-dac5-08df4c313dbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|10067099003|11063799006|4143699003|56012099006|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|18002099003|22082099003;
x-microsoft-antispam-message-info: dqxKb5l1CC4f+ARZqZwQwgMJyFPRLVpHd4dgC2/nPfrGlCZLWNP0n/o8xVLzgDlS8Im4XUUAsFM0Px09LVc6O4q0lv5329p7mS0XkztvV/Kr3/o0dYe64v+2yUOR6iIFxhfOwpHJDwyFYtwYNDQNG2Ib+zN+Alz4688F32XNJGs54quK6wnoy2TDZdyqE20LVzDMpoF1TcOqLZsd0xL0HJcCxAX09yBECXR+GQjLttza1IGv9MNm15onQ01hdo/AzBYcPtYgPy/gOEiP/vcwuQQeQVN2aPjyw5ASpKaxF5OMPMsRJR1Se9VItRAgRzdJ1eDuvfI8BXBhl/C9icZaZZ4Fdwv9Yruz32G79BXajl/Xcgm0vfxf6jn3XsQzB4NG2oNAWdKh90WfJKXjIIjRlzun0aVt3WzBK86RkaKPdAU1PBhEDCgg+UCgEs/XA1PZeQvrv9nBcUspJyYTL0cJ7DXI/VSr9EjRtOUE3emQFsspC1YeUfj3qFCaKXAAU+kqGhSyFapsUmT1s0ruciXPaTCdWUs0sT+OL4E29Re5mYlsxRs6FmAXdcJry13OPZPJYdYVCyVkjSrdz5x6qICAxXDhxQ/TdWEmwkPYDuvreIPSkmop+9rFC/dOHXpvCiZMnafNk2OkxBs7X40KSzxgxKGYe38YjbhKNMceheEU2O182h/oup/Jv+2K4jfatn3CYHZGRx6x7/n6qSihx8d6z2te6UY9iwWlSQ001c6HdjA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWRXeTRFeVltZENBMU1OeUU2U2tBaWZlNDFOYkZJWWZHQnlBREJpdlBjZ2ZK?=
 =?utf-8?B?R1VVQml1V0dIbnFNeGdXZ3hmU1dkVkNWcHNnZXUxV0NFVkRMc3FoVVdNNnJi?=
 =?utf-8?B?OXVTbmFITFI2MmUycEhYV05JejVVZDdTZlVuS0dyNWtlUHYrVWxoakZMaFBG?=
 =?utf-8?B?bjdYQldaYk4yOS90TWZWaXNiRWt2MUFEZ1k4UFdXVTZ0SjY0Z1dJVmJ6SU9U?=
 =?utf-8?B?N1daejZ1am9oNnk4cTBwTkw2dVVMTXM5UTA0SnNkWWpQV2N3TGEwc3ovMmN4?=
 =?utf-8?B?V0RQVk1yVE5zcTlBTGdLZ203b0hoaU95dWtFRU1pRHBRckxmV1RUVDVUM3Qv?=
 =?utf-8?B?dm1mRU1QZXlsdmNXRE9jMzdUZy9xd0dOdU1qZnJ3RllERjdoaGlqTklSbG8v?=
 =?utf-8?B?SXpEU2N6V1d1cEVRSWhremFXVUJBSzZWdDhRRFF4S1Rza1Q5UTFXbjZRbENn?=
 =?utf-8?B?N0RSNXhNaEd0MVlKQmVuYkFqRUNmeVVMcGdBMzNrR09HeHRaSSs4Zit6cWg4?=
 =?utf-8?B?NlBpdUthQXZ2NTRYME41bUM4c213cVhRNkNvSEEwRjEzb1ZVS0NEUUc0cExT?=
 =?utf-8?B?NS93cEU3dUMxOTJ3WktaRU5sTTNHZS9udk1zTHJLUzNQd3RRb2d3T1pBakFE?=
 =?utf-8?B?VXloV3Y5QWV1K1lGQkxCMUlnNnJJbEd2NjRrVFNxNTcrdkpjZ0hVZUFTeXZE?=
 =?utf-8?B?d1E2a0pudHFldFhDT04xYml0WlJLMEEwcTRPeFpGbEpqSXZ3SkhOdEcvZHln?=
 =?utf-8?B?NXBKOThNdk9aWmVFdXRWNmxvRlJ0R2c4N1F6dUUrNDZIb1lxZ21hT29NODNm?=
 =?utf-8?B?d1lFcDlnRFRhelVkR3UzMkVUWmVDNmJaZk9KT2oyQ0dxdlpGdE5jb2orUDJh?=
 =?utf-8?B?MkZRanlneEtpdjFnL2U1QmZYdmh4Mi9RWVVQcUZibDdWck15SGxpU1BIdFJ1?=
 =?utf-8?B?T1FZNG5JZlZET1h3cmZ4RUdZMnVLVWs4WkpkZkhVMzJmMndVbzFjTHRzUkFs?=
 =?utf-8?B?a1BEeWlsbVNKaE9WVFlyMjJqQUZJa1BFYUNrcmxaK0ZLTmVqeTNXUmlRQ1VV?=
 =?utf-8?B?U3UzSEFkRjdjbW5QZUlpd2kwM2dZem00RUZnNTFucTJuMUtLM1A2MVVETEVP?=
 =?utf-8?B?RGZDVy9mZGdHM1RKaVVpdzJUeDhLcjZFRWZYQnA2ZU9WY1g3QnNYT01tckF5?=
 =?utf-8?B?TzRlb3h4T2sxUWs2NDF6VG1CaFVFdmlKOCtZU0dYdkVMYzBDQ0VuckJpU0lS?=
 =?utf-8?B?ZXJuT3pYdDArWUREWHV5U3ZjdHBUV1I3cHlTK3Vqc3FJSk9oNmVIUnJ0MTZk?=
 =?utf-8?B?blRlNTk4dVRxQU0rS3M0U04zeFZqbWYyNHBERWtDRWZjQUFhQVBiOTdKWDha?=
 =?utf-8?B?K0kyYS81aWlsSzdMU2ZPTHJ1ZzNnMldDNWE3dWdjSzhmZmJHeVpoU29kQnB1?=
 =?utf-8?B?RFoxLzdia2FoTG5qN1VZdWd0MGpqdXVMaUc5blY5VWtzWVNzNjJBeUlFVXE2?=
 =?utf-8?B?VVQ5RXZPcmZmdGtVb0tRMTIxUlh3Wlc3MExmQUhRN05CcWwyZkhzaVZQWWVH?=
 =?utf-8?B?N25aL1ZYT3QzVFRSRW8xbjIxbUE4RnNIUWN6ZUc4Y3NUN3lZbEd0OWduMjNG?=
 =?utf-8?B?eEV1aTFIUjVMblpRbWgwTzRoUjRKUm9ucGtNYkFqQk5TUndiT3FJK1Y1WkNm?=
 =?utf-8?B?bmd6L2svN014U1llbmZpNTBDeUgyNnovK2FYdENYbXhZT1luNE05cU1EWHhN?=
 =?utf-8?B?Ym5GVjc2T3lRMXZEZnRJdm5kUk9OblRxeVVCV0dqTnc1RkwzU0VsMm1WaXFr?=
 =?utf-8?B?ZXBFTjJ1bHcwMVNnWW9mL2I4dDZnUE1TT0JqMzdqdFVGeVB6Vys4Wlh1YnlN?=
 =?utf-8?B?WUFWemptUnNJcnZtNnp4b2lLeHNnZXFSaWpYbzhLWXVWMUFqRmhNbFE4OEZL?=
 =?utf-8?B?eHMrK3hCMVdGYTUwVzVrV2dwZm5Yd1pJR1piZk5kYS8yVldtRjJ3ZkZFT0tu?=
 =?utf-8?B?ZXlDNnQxQWhCdTNKSi9uR3ZWS2ZTZlBpOUQ0L0dlUnpZcmJsY3Z6bFgxL3pN?=
 =?utf-8?B?RDBCUzdnWGVvNGF0R3ZQaXVhWkhVeWZTTlFJVDNWRFVUZ3FzTHZoMVRsSXlS?=
 =?utf-8?B?dllsMG55NjVFQXFPUWF6eGFNSUJhay9GL1htSFlGdXNHMlQyTzVkdjdsQTNC?=
 =?utf-8?B?c2FubCswZ0FvUEJGYTRCT2VlR1RPdmRsdEFmR1MwR05Dak1LOHdod1I5ZHg2?=
 =?utf-8?B?RGlLWDdQd1M3Y2pIbjhMMHlOOU85WlpmbjR1VWdnZU5JWHhxYU54ODdSZ3hY?=
 =?utf-8?B?M3hDTUZqaUduNXNlYURnTmRDMnZHcTZsT3VPSGlESlBqeGpycW43Zz09?=
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
X-Exchange-RoutingPolicyChecked: ElTaKi5w0iCHP3q9UbZczQzXipXvCkr4iH5/X/+a7XPI4Zlu27QWLI2ATFEOsXSMbL7oB77YFpK3lpKCWismlgMsB+0eXdPFm7KaCKrqIRKcAcNhiLkDlBkhRdxQmGNLmtbXlG9GI0AlMCSVe4A0BrinX/9XF/e96eDndtGQdbPrbCN7+kmr0neFcpAEh5J8jHOSoOpuPPXM5kBP1bQcRWQqriJrgqimMHxp82Z6ahMR9531Um69q7iQxdd+wHldXwlDgpXz6YxKbZEatE5z6PO//1vQC9MQ7boL85ttioQ/ZWkO6/iTkH9u6abb+0bQt9FfUWRHNgMs6atLkAJXfg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e8d667-029e-4b4c-dac5-08df4c313dbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 02:50:48.2449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8tfSoFtZ96HoalS+XyPUjTsDVqWNRmj+FFIOXCQsTFduA0R/FKphy5+vVcBbKrUYS0efwdOSoj6YgR08Ae7ZjMJnlPFBkfIA6+jdqpa5JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IExpLCBYaWFveWFvIDx4aWFv
eWFvLmxpQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMC8xNV0gUENJL1RT
TTogY29jby90ZHgtZ3Vlc3Q6IEltcGxlbWVudCBURFgtDQo+Q29ubmVjdCBQQ0llIFRESVNQIChw
aGFzZTIpDQo+DQo+T24gMTEvMjYvMjAyNiAxMToxMSBBTSwgRHVhbiwgWmhlbnpob25nIHdyb3Rl
Og0KPj4+IDMuIFRERy5UREkuTU1JTy5BQ0NFUFQgcmVxdWlyZXMgVERJIHRvIGJlIGluIHRoZQ0K
Pj4+IEFTU0lHTkVEL0FDQ0VQVEVEL1JVTiBzdGF0ZS4NCj4+PiAgIEFmdGVyIFRESSBpcyBib3Vu
ZCBieSBob3N0IHZpYSBUREguVERJLkJJTkQsIHRoZSBzdGF0ZSBpcyBCT1VORC4gSXQNCj4+PiBy
ZXF1aXJlcw0KPj4+ICAgZ3Vlc3QgdG8gY2FsbCBUREcuVERJLlJEIHJlYWQgdGhlIFRESV9HRVRf
QklORF9TRVNTSU9OX0lELCB3aGljaA0KPj4+IGNoYW5nZXMgVERJDQo+Pj4gICBmcm9tIEJPVU5E
IHN0YXRlIHRvIEFTU0lHTkVELg0KPj4+DQo+Pj4gICBUaGlzIGlzIGEgaGFyZCBkZXBlbmRlbmN5
IGZvciBUREcuVERJLk1NSU8uQUNDRVBUIG5vdCB0byBmYWlsIGFuZA0KPj4+IGl0J3Mgbm90DQo+
Pj4gICBtZW50aW9uZWQgaW4gcGF0Y2ggMTIgd2hlcmUgdGhlIGNhbGwgdG8gcmVhZCBURElfR0VU
X0JJTkRfU0VTU0lPTl9JRA0KPmlzDQo+Pj4gICBhZGRlZC4NCj4+Pg0KPj4+ICAgVGhlIFNFU1NJ
T05fSUQgaXMgdXNlZCB0byBlbnN1cmUgdGhlIGhvc3QgZG9lc24ndCBiaW5kIGEgbmV3IFRESSBh
ZnRlcg0KPj4+ICAgZ3Vlc3QgYXR0ZXN0cyB0aGUgVERJIHdpdGhvdXQgZ3Vlc3QncyBhd2FyZW5l
c3MgYmVjYXVzZSB0aGUNCj4+PiBTRVNTSU9OX0lEIGlzDQo+Pj4gICB2ZXJpZmllZCBpbiB0aGUg
Zm9sbG93aW5nIFRERy5UREkuU1RBUlQuIEFuZCBtYWtpbmcgdGhlIHJlYWQgb2YNCj4+PiAgIFRE
SV9HRVRfQklORF9TRVNTSU9OX0lEIHRvIGNoYW5nZSB0aGUgc3RhdGUgbWFjaGluZSBvZiBUREkg
ZnJvbSBCT1VORA0KPnRvDQo+Pj4gICBBU1NJR05FRCwgbWFrZSBpdCBtYW5kYXRvcnkgZm9yIHRo
ZSBpbXBsZW1lbnRhdGlvbi4NCj4+Pg0KPj4+ICAgQnV0IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0
byBhc3NpZ24gYWRkaXRpb25hbCBzZW1hbnRpYyB0byBhDQo+Pj4gbWV0YWRhdGEgcmVhZGluZw0K
Pj4+ICAgYmVoYXZpb3IgaW4gYSBzcGVjaWZpYyBwaGFzZS4gSW5zdGVhZCwgd2Ugd2FudCB0byBw
cm9wb3NlDQo+Pj4gaW50cm9kdWNpbmcgYSBuZXcNCj4+PiAgIGRlZGljYXRlZCBUREcgY2FsbCwg
ZS5nLiwgVERHLlRESS5MT0NLLCB3aGljaCBuZWVkcyB0byBiZSBjYWxsZWQgYnkNCj4+PiB0aGUg
Z3Vlc3QNCj4+PiAgIHRvIGxvY2sgdGhlIFRESSBhZnRlciBpdCdzIGJvdW5kIGJ5IHRoZSBob3N0
LCBhbmQgaXQgcmV0dXJucw0KPj4+ICAgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQgb24gc3VjY2Vz
cy4NCj4+IFdoYXQgVERHLlRESS5MT0NLIGxvY2tzPw0KPj4gT3IgaXMgaXQgZXNzZW50aWFsbHkg
YSByZW5hbWluZyBvZiBUREcuVERJLlJEKFRESV9HRVRfQklORF9TRVNTSU9OX0lEKQ0KPj4gdG8g
bWFrZSB0aGUgc3RhdGUgdHJhbnNpdGlvbihCT1VORCAtPiBBU1NJR05FRCkgZXhwbGljaXQ/DQo+
DQo+SXQncyBub3QgYSByZW5hbWUgb2YgVERHLlRESS5SRChURElfR0VUX0JJTkRfU0VTU0lPTl9J
RCksIGJ1dCBhIHJlcGxhY2VtZW50DQo+b2YgdGhlIHNlbWFudGljIG9mIHRyYW5zaXRpb25pbmcg
dGhlIFRESSBmcm9tIEJPVU5EIHRvIEFTU0lHTkVELg0KPg0KPlRERy5UREkuUkQoVERJX0dFVF9C
SU5EX1NFU1NJT05fSUQpIGlzIHN0aWxsIHN1cHBvcnRlZCwgYW5kIGNhbiBiZSBjYWxsZWQNCj5h
bnl0aW1lLiBXaGVuIFRESSBoYXMgdmFsaWQgQklORF9TRVNTSU9OX0lELCBpdCByZXR1cm5zIHRo
ZSBzZXNzaW9uIElELg0KPk90aGVyZXdpc2UgcmV0dXJuIGVycm9yLg0KDQpXZSBkb24ndCBuZWVk
IHRvIHJlYWQgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQgYWdhaW4sIHNvIG1heWJlIGhpZGUgdGhp
cyBmaWVsZC4NCg0KPg0KPj4gQ2xhcmlmeWluZyB0aGlzIHdpbGwgaGVscCBkZXRlcm1pbmUgd2hl
dGhlciAiTE9DSyIgb3Igc29tZXRoaW5nIGxpa2UNCj4+ICJBQ0NFUFRfQklORCIgLyAiQVNTSUdO
IiBiZXR0ZXIgcmVmbGVjdHMgdGhlIHVuZGVybHlpbmcgb3BlcmF0aW9uLg0KPg0KPlllYWguIEl0
IGxvb2tzICJMT0NLIiBkb2Vzbid0IHNvdW5kIGdvb2QuIEJlY2F1c2UgZ3Vlc3QgY2Fubm90IGxv
Y2sNCj5hbnl0aGluZywgYW5kIHRoZSBob3N0IGNhbiBzdGlsbCB1bmJpbmQgdGhlIGN1cnJlbnQg
VERJIGFuZCBiaW5kIGEgbmV3IG9uZS4NCj4NCj5UREcuVERJLkFDQ0VQVF9CSU5EIG9yIGp1c3Qg
VERHLlRESS5BQ0NFUFQ/DQoNClRERy5UREkuQUNDRVBUX0JJTkQgc291bmRzIGJldHRlci4NCg==
