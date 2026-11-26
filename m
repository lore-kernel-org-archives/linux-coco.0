Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662701;
	b=Yf4/IKwF2wm307KR/Ky8oXKB4lqpxjCdcrbtKreJuZw/2/hzmVOyr5BgUkwcsIBR9qtE
	 YEA04ybnSrokrDLemqToar5rYpxw8RIaC2NLSigHdfku0VbigMIwtjPrHjk2wHsStybNu
	 ODJsNxrc+yttvIdvP9KYsKmnWIj9b89FMdmDWemB4hPlgddpbDMV6CBaa8ySz08w3sc8x
	 PjWuRrpob2bNVkuG2Udux+Pw/jKn1jYE7D0Vzk5c+W7G3UsyXFNyvTfJk2TCZuXSIq8n1
	 9Ivmx6h6xGF/lUDlLfNxRbdlU0WZ6tjbARG6+06lzNOV+KSnu8cfpxqaqSuLgxHeaNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662701;
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
	bh=X1cTsd0QRQfmGzyRUg+rbzTuF0Ke/IorSrLYrEN6W5Q=;
	b=E/cYgfGq137fxWXBgviKFKhMravxUn/WfqPuv3sRcqSE9adn7bbEv+cjlKrWJUanZXNU
	 EkWp5c8O872ulcUutNthuiexN4Tt0hnzwJg1zYgJ38+Sw1greuK9myNs/CYaAhYSPFrOi
	 gfb/eVQPfBQ4gjDtE/UU46oAmPIWmXk/UfCU5l9ebCPForx9yCzJ28nBoEyOrMxnnbLt6
	 xhg7+lud3X7LxKvVE9L6FJrhYz3pmwjjiZ63a4L8AB21omKxlatyWklqddXcxJ+Ink65K
	 WdZqJUjvVopw8U9QEkpEHIUV4QkEIDzzJsUt42SVPMR9iubLzu/aRQ8VLKegKtcTz1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6Kcd7jk;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bXlLIpCr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29846606A321
	for <linux-coco@lists.linux.dev>; Thu, 26 Nov 2026 03:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29846606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U6Kcd7jk;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bXlLIpCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795662700; x=1827198700;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X1cTsd0QRQfmGzyRUg+rbzTuF0Ke/IorSrLYrEN6W5Q=;
  b=U6Kcd7jkMoROfkxtPAccK22bKr8Cs+3VJMAEPjXTMWl6hwHK9ZaJcr2x
   0Y62dmAQt+0s53FoCpJssUpBkc6aG1yP7dUxebPLOwlhQ76PzgV5GWBZD
   e8cOKDOurg9+W3on+9O7s30jGCbsURfzxfxXQSoCbwRNMzp+XT+Lws1OR
   Vd4jEjCJr5xuhfxFqXK43WYUqvTavlg/qKXGAVQDOh+KxcFebmH8yXxv4
   vDmIhc9ln8WmdFur97X44wrXY3GC9OiGvGENF/GC0drTWeMqEDF0gOoQf
   G/f+uGSepbk3LtxegG1M3e398WsHC8ILfYlI+Od76/F+gwq7RS3VFrwqa
   Q==;
X-CSE-ConnectionGUID: S29D7UZ2SYqFV87RU53YlA==
X-CSE-MsgGUID: jqIWVoufRGyEJo9zmdkMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4470043"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4470043"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:11:39 -0800
X-CSE-ConnectionGUID: qjhiYcrLR5q8+aXX0cBWxQ==
X-CSE-MsgGUID: WJDszRd4Q0OlB/14KYA+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="13825377"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:11:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 19:11:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 19:11:38 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 19:11:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVMyTdO2rt8eRY0MRGf2OeJaG0bToYEUDI+3KuMsZffuBS/c+3xfycDCrwF+jZastwtC+1ZS5YqKRDDUSfF11leeZh7MufxnTHRiq3bfdiDIjQBsfWCGbl0erQt1ulYx+wBfgIhYz1xiGqQnQcFgemjhYFyuPokj6oLo5ngiF4mxLSz0cbronYPXSkpyDHE8OfTyWKdpr/ejgeg0vIAP7tH6nzfJkMZoeQ+vk8gxE4xEJJc1WdQ0aLIAqpSjgTlC3F3BVYo6DkAC3C/y0Afh5MPbLQOWHK9ZFW/PsyBkQCe7f81NnE20liIx7iP3Jz9pkP/gTnXr0aw8Dnsi3FNhcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1cTsd0QRQfmGzyRUg+rbzTuF0Ke/IorSrLYrEN6W5Q=;
 b=yqwU1Zu4JwsiTNwpx14Q26sX/ut92mT3wKd3wZCIhRZsgypGcHTvpfuOizsBua7c7M6Hu+BNVKqsauDcki/nwQXkdXfnB8g5htlPucLSPZveB3eA+19GDs1Tdyxp3GlA28It4Ah7urmbLT/G7wlrfDnaoM/GecAVUYpZQcSlc8Qq4A7TRFrY/lXdVQ47hXGruNbuIjckze7ocvHo++QgZIxXEqhQ3D7epXQFEyt5PxQzwmxBaSFQ6nG5jlLLc/4DrNzMsWE3CHDGc+bddV+Fms/hmnGUltfdZahDDCHJhaoNehEYYoeF+H6hQ+Figz97k6KHLdRryIvUkZgnFdPXrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1cTsd0QRQfmGzyRUg+rbzTuF0Ke/IorSrLYrEN6W5Q=;
 b=bXlLIpCrtvMDroJQqx2SvplPETq7AH1zCcNTlg5k0XJRRSLsfGg2tW36YIlQk1YHWHUa53Ag9jfQVqYogOC2Ea8HbHWf3cAVv1J6dMZGnZDes60K4JSlVnO8TgDsVFQueQ4kHQRm7H+6yNFhmwTIG0T9QE0nDQc9+thUD2D8XrE=
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by LV0PR11MB9840.namprd11.prod.outlook.com (2603:10b6:408:383::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 03:11:30 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 03:11:30 +0000
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
Thread-Index: AQHdS9qwS7r1H6b0x0uLj0D9aHrAKrc9GswAgAATJ+A=
Date: Thu, 26 Nov 2026 03:11:29 +0000
Message-ID: <IA3PR11MB9136465096B2B1D5152C1E1C92422@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
In-Reply-To: <de1262f3-4097-4aa0-bcee-0dad05ec5538@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|LV0PR11MB9840:EE_
x-ms-office365-filtering-correlation-id: f5f68dd5-8ed0-4fe4-b860-08df4b6af7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|38070700021|10067099003|11063799006|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261021135927099003|56012099006|261022075727099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: 2r0zf6pXj4W6TE5Im3h3s2QUzTYJDpXBqJDjgwqEBmtx/0JAHsJhOd3ee/weBkv4SyDwSy/GVcnUk6LOWNJ624nNlXoFGURhuO5m7HAsh9yXEVSBzcac/QqqMIOdoWnMYGbcPt7XAl2ua5lq0uc27NWBTNm1dSj+BJEslCHq6eQE4aHv2d5UdhCWoO6ey+kzxMRRnYlsCz/qvBpH1UNzYjHBg7r5V6HCoDw/WdkcMllFwD8ewTSXVEpk5E2KFwUhy6x1sBqPz1nb3YQd5N/FU3keLt2eJSR8O9LMRbq/hBNC36z6b1nq3NXBy+0g1Au89rcqk+jLB2rj5ZPFotCqw/WtfODtxuy1XHo6xKWqk+EKvQIce89htjl14E6Xq/9siX5SP4J7uTheYG/sVFAAqBsz6qgw2kFJvJj4+tA97TR4LKgjRImAdMaSAS14t5KYOIeVNIgnzd4uyGVxE0OOVfIVsC6/bhVi0xK8Qc50EoEJKo5Ti6WUNmruAsgMEJ2yX7fdHcCA1+dXSguGGBnrhpO5OEeVHTz7yaLQ0SaTLkOKD5XHPeNi0OM9TwcPWjHwwzdaJ3gfXxqHe91Bi/R5sXxzzPHSS6nQsvq5hX5OY3AluQSnI5mx+4NAQ0yv1Qih3zQZU2k01LGI3NsRQ1Ax2T8jjoQFo2lvLIwrfmXVa6Voy6XdWjFz/Jp8v99ANE4JDL+d4le3B41tKfIqV/5tOSUyUvWdcuC8nNSAJDzAYpU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(38070700021)(10067099003)(11063799006)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021135927099003)(56012099006)(261022075727099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODlqWno0RFpPcSswL3cvVVhGK1RIOVFZSjlQQVlsdDRFMDFTNm1yL1NaazRq?=
 =?utf-8?B?ak04OEpsTWdJUG5JM1dFemduM052dlFDRTUrR1BhOXdpbFB5S1ZXaEtoQlVU?=
 =?utf-8?B?Mk1CTXpOMk9rNUhJc3FsWlZlY1VHT2psN3h3TVlJQUs3aWppTFZ3K09kTmZM?=
 =?utf-8?B?QytCRFBjMERFeE9GcUE5TVByby94bTExNEwrVnE5SE5Yajc0czNWa1QyZU96?=
 =?utf-8?B?OWdSdTNLZHl6emN2SmNHWktnV0JSNkp4eksvN0JXL2haRmdyNVBtT2RyN2dU?=
 =?utf-8?B?Ynh0OTJUUGtSVUN4ZTJ2OXBoczN2dXJOaGU0MHBPT0xmeDRka0RqRVk5Vjdy?=
 =?utf-8?B?Nyt1RWRoWjNYcDQ4cVQzYkI1ZGQyb0ZlSlVRZEZIa1lheFJxbnUyaEpkNDh4?=
 =?utf-8?B?RWRYdk9FV2ZFZWNhdHppaGlIRENOd3AweGNsVWZ2S0VkV0s4K2ZsemRNMHI0?=
 =?utf-8?B?RHlwT2ZBT0IzUVVBOUhRTWZTakVzUkR3RDNKWTAyTFRlbmRMdk1pNEJmeXZH?=
 =?utf-8?B?eDdKa0FHWmdVZWhFTkxXajJmdXFtREJJZmRkWWlqeFBUaFF2cFZMbHJmdmpW?=
 =?utf-8?B?TTRnRnprYng1bVlVRFlRdEg0dmhKcVN0WDBQSHE3ZUx0RHRCNUk1ZTVEUmhT?=
 =?utf-8?B?Y3V0ZkxCbHgwRlJVQVl4ZXduY0JqNHlKVzBwWWMyNytIT2xZYTg4dTJqdFhR?=
 =?utf-8?B?ZlZvT3dkdmtiYlBHd1IwYmhFMUI1K1lraktKWW9aZXA2TjBDV0NXR09hT3Nn?=
 =?utf-8?B?emV0NVFDN1VuU1dHSGgxQ2pBQ28zTmtrTnBSTVZ4V0dsRXdSSGd6ZHJyaVd0?=
 =?utf-8?B?S0tjdWoxSTg4MWlQT0h6d2VRdnZrSmZyMXVRVSs3bWdRa3JKYmFqR3lISFNB?=
 =?utf-8?B?amcrY1BoSEhNekhPWk5FRjBzb0ZVTnUzd1prVEpRcytpS3VyekNyQ1BOR09Z?=
 =?utf-8?B?d01NazJGV3VQTmRiVHAweHZQZHlFQVFrbmNPMnMrUzdzZGFzdnUwYkxhWElI?=
 =?utf-8?B?cnZ6WFFkeVEzQjBOQmptdmVsM2JhTitTR2NzUk96b0w1YitrSURVMFBBUld6?=
 =?utf-8?B?aWV0RnUvYklUVUdBMUZ5ay9KK0IvejZpNzFRd3NNNnA1dHRaVVo2YlQyMzZw?=
 =?utf-8?B?bHRrcDcwbUJSdGZIdUd5WlN3aFdvVWNpcTVCbjR5S20wUktDSkJFVVBISEZz?=
 =?utf-8?B?WXM4MGhKZmNjM1JHZC83MXh0YzF6b2d0RjZuUjBiWGt0d3Q2VnorUHVGOFVM?=
 =?utf-8?B?eWVOT2E4UWdRY3VNUXdLcm9qUFBESnV5VW5kSXlPL1J5NXhBeDY5bldlUzls?=
 =?utf-8?B?bUhCUENjZGNmMTdheFdNTUJvdmhqdm9FUmtnZE91aUJCZEQ4NFVMWStDamtW?=
 =?utf-8?B?UUZBbGNSUk9oU3lnMnRERVFITG81STFmUG5QKzJTZGhQNVI3SXZaVS9tbmx5?=
 =?utf-8?B?dXRmaks4YlQ3cURkZ1V6Ly9SWE9kYWpEM3hNcjQxOTBBam9PcXlaQmJMSkRG?=
 =?utf-8?B?akhTbW5TOVpRalhsT1dVck9HS1d0MDZKL0xHTHloMmdUVlVDVVRmRDJiOEVH?=
 =?utf-8?B?WTFIRWFwZGo3ZlV3akNpcE4wY2xzMlZEN0lIRmZjWEorcUNjTVZzNkZKQ0Zi?=
 =?utf-8?B?UEpFNmYxTEJuQjJxUWRJMlcwbXMrS1VObHA5RFM3NUdaZzVkZ0pDZEl3emN3?=
 =?utf-8?B?VGlodjZwRGdTVlRoWjVZRzhySkFFdUVjM05jaGJQNVhnQ2h1WVZteW9BVzRr?=
 =?utf-8?B?WXhTK29nU1Ivd0tzc3p6KzNPWE1Kdml5Z0xqTG5LTUNaNHBiWUVRSWY5RFpL?=
 =?utf-8?B?bGF4UG5ITlRlcFM4ZU9lcC9kZys1WmR6YjJkeGZnRDdoMm4waUZpZmtFMVVq?=
 =?utf-8?B?dkgvQlpzOGVKa2dMNzdBUitXeWo0MUhGY3A1YmM0cTJQaHUyc2RkVmU4ak5K?=
 =?utf-8?B?SnRKbWxLclMxeGN2Q2pmWVY2eTd0ZXFsU2FEQzF0bjJKZFZnTzlrUmtNeWoz?=
 =?utf-8?B?WG93bFFuci83NGlISGI1eU1jQjhSSWxCTERablY1UW04Wnl4Tnl0VTBZNWli?=
 =?utf-8?B?Q1BzU0prL1hGcVQ3RkE4c3B2c2RwN2w2OWV0cjQvQ2hCU3NGbVRDNEdpUm9l?=
 =?utf-8?B?QXZ6VUIxL3RiUStJRmNGT2ljcmR6RTNzTG1TNDkrTC9JUU95TG5RdlgxTUtt?=
 =?utf-8?B?ZXJhb3daZ2ZXQjVJQ3IvOUhPaHJzTzM1bzZkRlVhOHFEODNUYkR2SHRqMWtH?=
 =?utf-8?B?QmJYOWpBLzBUakJiVWxCWllpRnBXR09lWnpTUTNOWTYzY2MxcUJHaDFNdEcx?=
 =?utf-8?B?MWZLVDdldWZ0Ump4b0VFV1lreUthdzBnc3hkVUR2V1haMS9NYUNnZz09?=
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
X-Exchange-RoutingPolicyChecked: Fcatd2llcUVrNA2Z+0mMKYYKKrp5/T8Djxw6FsXs2mMfdshxRRqyRQ0ly1PpytJU1QbulCAaeCiEEzGX1OnXFXrbTGanYhlwgTR/N1OJcOdk31N4YKDfppG+RjIfKtwJuxbyreJm5hS1Zuc2BIx2plWjHMRfi5v+ywVKdB+oBMTTu4SeY+wgiGbAgfoKhe4zFLbayOHKdtPs8QAiF84pR0zdHhtXgZNKtKSGdhwJPFAPulWspJThyDopVROIssfVa4WR1lpd5Rg53vsGIoqKVe1G52gtEM7RtpQGVSz1N1hTU9JDz5wA0TJx8QFty9Rs/Pz0uk5cwCq5TgTGX4X5Ww==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f68dd5-8ed0-4fe4-b860-08df4b6af7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 03:11:29.9302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vzl+3DynZuezm8Y6JE4xm5gFcBnFBh4kIwxVGM1xlqemI/OSk0X3fcwKicbkhWfZo/xPUBLDXkPLJVqpAziWvU9oLoDKgOFkayzNgvGKCpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9840
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogTGksIFhpYW95YW8gPHhpYW95YW8u
bGlAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIDAwLzE1XSBQQ0kvVFNNOiBj
b2NvL3RkeC1ndWVzdDogSW1wbGVtZW50IFREWC0NCj5Db25uZWN0IFBDSWUgVERJU1AgKHBoYXNl
MikNCj4NCj5PbiA5LzI0LzIwMjYgMTI6MTAgUE0sIFpoZW56aG9uZyBEdWFuIHdyb3RlOg0KPj4g
SGksDQo+Pg0KPj4gVGhpcyBpcyBhIGNvbXBsZXRlIFREWCBDb25uZWN0IHBoYXNlIDIgZ3Vlc3Qt
c2lkZSBpbXBsZW1lbnRhdGlvbi4gSXQncw0KPj4gYmFzZWQgb24gRGFuJ3MgbGFzdCBUU00gUGhh
c2UyIFsxXShyZWJhc2VkIHRvIHY3LjMtcmM0KSwgcGx1cyBOaWNvbGluJ3MNCj4+IFBBVENIMy00
IGluIFsyXSB0byBhZGRyZXNzIEphc29uJ3MgY29tbWVudHMgYXQgWzNdLg0KPg0KPkhpIGFsbCwN
Cj4NCj5BZnRlciBnb2luZyB0aHJvdWdoIHRoZSB3aG9sZSBzZXJpZXMsIEkgZm91bmQgc29tZSBv
cGVucy9pc3N1ZXMgYWJvdXQgdGhlDQo+VERYDQo+Q29ubmVjdCBhcmNoIGFuZCB3YW50IHRvIGdl
dCB5b3VyIGZlZWRiYWNrLg0KPg0KPjEuIFRoZSByZXF1aXJlbWVudCBvZiBSOC1SMTUgYXJlIHJl
c2VydmVkIHRvIDAgb24gVERHLkRNQVIuQUNDRVBULgkNCj4NCj4gICBUaGlzIGlzIHRoZSBmaXJz
dCBsZWFmIGluIFREQ0FMTC9TRUFNQ0FMTCB0aGF0IGV4cGxpY2l0bHkgcmVxdWlyZXMgc29tZQ0K
PiAgIHVudXNlZCAgcmVnaXN0ZXJzIHRvIGJlIDAuIFdpdGhvdXQganVzdGlmaWNhdGlvbiBvZiB3
aHkgaXQgbXVzdCB0byBiZQ0KPnN1Y2gsDQo+ICAgd2UgYXJlIGdvaW5nIHRvIHByb3Bvc2UgdG8g
cmVtb3ZlIHRoaXMgcmVxdWlyZW1lbnQgYW5kIGl0IGhlbHBzIGRyb3AgdGhlDQo+ICAgUEFUQ0gg
MTMuDQo+DQo+Mi4gQWRkICdUREknIHRvIHRoZSBuYW1lcyBvZiBUREcuRE1BUi5BQ0NFUFQgYW5k
IFRERy5ETUFSLlJFTEVBU0UgYW5kIG1heWJlDQo+ICAgcmVuYW1lICdETVJBJyB0byAnRE1BJw0K
Pg0KPiAgIFRERy5NTUlPLkFDQ0VQVCBoYXMgYWxyZWFkeSBiZWVuIHJlbmFtZWQgdG8gVERHLlRE
SS5NTUlPLkFDQ0VQVCBpbiB0aGUNCj5sYXRlc3QNCj4gICBwdWJsaWMgVERYIENvbm5lY3QgQVBJ
IHNwZWMsIHRvIGNhbGwgb3V0IGl0cyBzY29wZSBpcyBUREkuIEl0J3MgYmV0dGVyDQo+dG8NCj4g
ICBhZGQgJ1RESScgdG8gVERHLkRNUkEuKiBhcyB3ZWxsIHRvIG1ha2UgdGhlbSBjb25zaXN0ZW50
IHNpbmNlIFRERy5ETUFSLioNCj5hbHNvDQo+ICAgb3BlcmF0ZSBvbiBUREkgc2NvcGUuDQo+DQo+
ICAgQmVzaWRlcywgRE1BUiBtZWFucyAiRE1BIFJlbWFwcGluZyIsIHdoaWNoIGlzIGFuIElPTU1V
IGNhcGFiaWxpdHkuDQo+V2l0aG91dCBhDQo+ICAgdmlydHVhbCBJT01NVSBmb3IgZ3Vlc3QsIHRo
ZSBndWVzdCBzaG91bGQganVzdCBjYXJlIGFib3V0IHRoZSBETUENCj5jYXBhYmlsaXR5Lg0KPiAg
IFNvIGl0IGxvb2tzIERNQSBpcyBtb3JlIGFjY3VyYXRlIHRoYW4gRE1BUi4NCj4NCj4zLiBUREcu
VERJLk1NSU8uQUNDRVBUIHJlcXVpcmVzIFRESSB0byBiZSBpbiB0aGUgQVNTSUdORUQvQUNDRVBU
RUQvUlVODQo+c3RhdGUuDQo+ICAgQWZ0ZXIgVERJIGlzIGJvdW5kIGJ5IGhvc3QgdmlhIFRESC5U
REkuQklORCwgdGhlIHN0YXRlIGlzIEJPVU5ELiBJdA0KPnJlcXVpcmVzDQo+ICAgZ3Vlc3QgdG8g
Y2FsbCBUREcuVERJLlJEIHJlYWQgdGhlIFRESV9HRVRfQklORF9TRVNTSU9OX0lELCB3aGljaCBj
aGFuZ2VzDQo+VERJDQo+ICAgZnJvbSBCT1VORCBzdGF0ZSB0byBBU1NJR05FRC4NCj4NCj4gICBU
aGlzIGlzIGEgaGFyZCBkZXBlbmRlbmN5IGZvciBUREcuVERJLk1NSU8uQUNDRVBUIG5vdCB0byBm
YWlsIGFuZCBpdCdzDQo+bm90DQo+ICAgbWVudGlvbmVkIGluIHBhdGNoIDEyIHdoZXJlIHRoZSBj
YWxsIHRvIHJlYWQgVERJX0dFVF9CSU5EX1NFU1NJT05fSUQgaXMNCj4gICBhZGRlZC4NCj4NCj4g
ICBUaGUgU0VTU0lPTl9JRCBpcyB1c2VkIHRvIGVuc3VyZSB0aGUgaG9zdCBkb2Vzbid0IGJpbmQg
YSBuZXcgVERJIGFmdGVyDQo+ICAgZ3Vlc3QgYXR0ZXN0cyB0aGUgVERJIHdpdGhvdXQgZ3Vlc3Qn
cyBhd2FyZW5lc3MgYmVjYXVzZSB0aGUgU0VTU0lPTl9JRA0KPmlzDQo+ICAgdmVyaWZpZWQgaW4g
dGhlIGZvbGxvd2luZyBUREcuVERJLlNUQVJULiBBbmQgbWFraW5nIHRoZSByZWFkIG9mDQo+ICAg
VERJX0dFVF9CSU5EX1NFU1NJT05fSUQgdG8gY2hhbmdlIHRoZSBzdGF0ZSBtYWNoaW5lIG9mIFRE
SSBmcm9tIEJPVU5EIHRvDQo+ICAgQVNTSUdORUQsIG1ha2UgaXQgbWFuZGF0b3J5IGZvciB0aGUg
aW1wbGVtZW50YXRpb24uDQo+DQo+ICAgQnV0IGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBhc3Np
Z24gYWRkaXRpb25hbCBzZW1hbnRpYyB0byBhIG1ldGFkYXRhDQo+cmVhZGluZw0KPiAgIGJlaGF2
aW9yIGluIGEgc3BlY2lmaWMgcGhhc2UuIEluc3RlYWQsIHdlIHdhbnQgdG8gcHJvcG9zZSBpbnRy
b2R1Y2luZyBhDQo+bmV3DQo+ICAgZGVkaWNhdGVkIFRERyBjYWxsLCBlLmcuLCBUREcuVERJLkxP
Q0ssIHdoaWNoIG5lZWRzIHRvIGJlIGNhbGxlZCBieSB0aGUNCj5ndWVzdA0KPiAgIHRvIGxvY2sg
dGhlIFRESSBhZnRlciBpdCdzIGJvdW5kIGJ5IHRoZSBob3N0LCBhbmQgaXQgcmV0dXJucw0KPiAg
IFRESV9HRVRfQklORF9TRVNTSU9OX0lEIG9uIHN1Y2Nlc3MuDQoNCldoYXQgVERHLlRESS5MT0NL
IGxvY2tzPyANCk9yIGlzIGl0IGVzc2VudGlhbGx5IGEgcmVuYW1pbmcgb2YgVERHLlRESS5SRChU
RElfR0VUX0JJTkRfU0VTU0lPTl9JRCkNCnRvIG1ha2UgdGhlIHN0YXRlIHRyYW5zaXRpb24oQk9V
TkQgLT4gQVNTSUdORUQpIGV4cGxpY2l0Pw0KDQpDbGFyaWZ5aW5nIHRoaXMgd2lsbCBoZWxwIGRl
dGVybWluZSB3aGV0aGVyICJMT0NLIiBvciBzb21ldGhpbmcgbGlrZQ0KIkFDQ0VQVF9CSU5EIiAv
ICJBU1NJR04iIGJldHRlciByZWZsZWN0cyB0aGUgdW5kZXJseWluZyBvcGVyYXRpb24uDQo=
