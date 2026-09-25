Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D711C69D
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294570; cv=fail; b=eS1kfWjfvuaYc2SExq0TDSzpCnhyfFh3wO+aMWepMmjau1pOGqZPbFw36QyEh+pwmZ4ParOmeViwnRLVzaYjewTNc3Eym2IARoNKHKztPYXrFBFjAOlcK98ahUz0SzpcGNq111eJKikf3S3XIIPdWkLphKzjQREF/FgxfKyFhdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294570; c=relaxed/simple;
	bh=hPoTbdbN10p4LGq0yawsHIDDSKKi9N5tNTf9GAFanfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FXFRKU6DPtgG4nBAhvxai9RJ9YX5qAcqM8cSVWOjx7XJw8/EDx+02IWuVy/ETEMFsq7saepEDTat/RhvdqBMinu9ReMCXBArrbY00yE1hEfq01UUSj8MWCPzR9wdxTwdJUo0R1tY3QniIeCJYS4ZaPow6oqIkjLNOZpjvMb1tz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDigu811; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDigu811"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790294569; x=1821830569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hPoTbdbN10p4LGq0yawsHIDDSKKi9N5tNTf9GAFanfs=;
  b=aDigu811rbPQjX0y9wyctrcVp50FrHWBZ67JHEwnVsEyvB6Ttpj6lQFm
   l0rKZq78+Wowh7SvomgPvXVGQUW5puIipB98LVOzGNP6K4XWuMU5FeQAD
   LrGVw2injZypzoDG+eqeckoEv70MJKEMObXoM2W+uv75jZ7UGzOiiZbkX
   Ri4wkjvU7OagUVEYP09He7Tkh/hm0eo6Vj/Fvba4XVhBX/6x4Gcjw/yZ8
   UgKpWVqLleLe1j7090dWQGn0Za8B3uEcYiqtgyx1w3cIrrKJGH2k2VDz9
   cWP6w8xf5A+kdtf9+iP//+taUwqY1RgVn3ms+X4d6lHaWn+Bmxua9o96N
   w==;
X-CSE-ConnectionGUID: Ipp0EOXiTmSc6rUYLljjXA==
X-CSE-MsgGUID: 2Q85fGOQTTiPSsOu7IpNgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107462851"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="107462851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:02:49 -0700
X-CSE-ConnectionGUID: wNGj+303Q5GXksoeA72wug==
X-CSE-MsgGUID: YYvjUCjQSXWPcy0czn2rVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278896112"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:02:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:02:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 17:02:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+dykgp8RX9EQKenz44+4b4YTKMDAuhpe2BHbiSE+L8o0dXAy5esWaannDekt+UpwykKlTyWXQjUNcdpNnBiYb/9OyPzNIw3SI6T2kY+InscVjYdd4MzkBxAPrT7qbhieLCkd4ly6xtD8MJbHSQbn9qdm9+gqC9C1e0OFpSx5YxmlGmYTc8xhYQzGx+q4ARaPds6vDaLqy2lg+dZve37S4cDTZcuxx+yYisIPDELUrigf9rSw9oKUYMGIWu9cJbrNdn4itcpj98o2jSav+nfPEU0pEWskFq84qreD3i50hPU6ul74y5pbsyULdODpHHa33+8IWTUEAXPgFNcyZpo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPoTbdbN10p4LGq0yawsHIDDSKKi9N5tNTf9GAFanfs=;
 b=ao8qCQrl66oS7YKXu4aY1FWQc9XyvJswNpdsRWYEzkXChvT9wVWXZ5D13/nvPq7QiCeuliD5N/TqYh108UG4c0Pqo/PQnS/siRX8Qf8x5/EThvd83CUiwwaDq+VDO7R2TvCdAb8R5A3bJhMggBar/5mkkNNd8Ntn05zO1SUf6rT1YJ2y/SJHN5qdVj3IWp2VQzgXz2aZ0d/1gOwKSeX7xxVGTMyiYtae7H9alrNCYQ6s0+hzAQbJ6LughQLhqx0rFDTmmqqfQqKKu1k4ahEGtY/OW9592P+FL9kKErSUTeknot2jqMVQISXyG697ARDAS33d1abxF7lKbdJ5hKnieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LVUPR11MB9565.namprd11.prod.outlook.com (2603:10b6:408:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 00:02:40 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 00:02:40 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
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
Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rJ7FgWIHNhvU2XNEh+FPULkLbeZNqAgAAFy4A=
Date: Fri, 25 Sep 2026 00:02:39 +0000
Message-ID: <697c0117acaf51076b274d461262e36453948478.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
	 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
In-Reply-To: <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LVUPR11MB9565:EE_
x-ms-office365-filtering-correlation-id: 76cee2ed-7fc0-40c5-9bd6-08df1a98509e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: hM2dkijTpWIbsbGo+LrjiMpn9KTbntBRczUeNRrOHucIpTPEUB7rfGRRAz6bZ0P5fvwuDzhV58Jk2sgboT42hIL5GgE8ANzVKwNQs+pujZD3pP0bbrcKk7MXmdArQ+kITTHoLPno6OCYtIVfEs1LlG+6cDG86yZQraWxqkAC5TBgO2aLPkbJWk2cOfJKnwrTRKIjLenKv3NROHdAiBuhGgJw+c2HOn1/yTzp0y8Y+TpSaALNTLqdPYURHK2k6PhNDia4sZ4IcEYETnykJCqe0stqdGGKs5a3CJmp80fqsGJ2KBtn1Jd88LR9ncwBEknXON9Xo01OHVpStlC5n+opSyRcKEN9houkBF3HR2XhpeompbeAmSb8VQfwGp5IkwOrtMHT/woQoTK063SLXeGt6Apd3il/AKO/BSsuoVP4b2k4omH4mIVTGA/henwKUj45A5NYShMaFAziDheWmTnHNAenIdERQoQb00hv8JuTx4p3InfGzFfemMlWQmvY1Xq2RBo9079fB/qBm54n12W+p4HkqZ1/kN4usX8oac6fxqrApDCv0ifehTVv7oG4qvTVYB6raIUyqnZSAT3pZIFWMSo6BtBuXMUYmeS8CKExVNLe6yc6K5GT8C3mt7IjxyWuOLO2eghx7soWz1fnXPSRf0wrFE9oDLptZUglwKFUsgYsnjjBRaXvl6uX/ZP3BIi7vP4qz1vsg8ur94xs4jKHA5meM8NG10tbKLxgqBMkOP8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmZvcmhvUjUraXRnWXlFQ2hKRWlwNXVMVjRzS0RJejRXRllQbC8rNEl6cVFm?=
 =?utf-8?B?aU1GNmpxT1RWWWRucktLQTJMVStpNFBhaHRBUHV6QWc0QXdKdTZWSWhmRFA5?=
 =?utf-8?B?NG9oY1VhblhOUS9WNllZeGJaMmZPeHZQQjE0d2hseW83RmQ4RzRjb09mQStC?=
 =?utf-8?B?WXAxeU9lYUFMaE0vZGZULzNNb3BYQ3lBeDJmNjV3ck9udFBrYXZlZzRoVjF1?=
 =?utf-8?B?M2cvQ2JHbTRja01iclBzdk5LcEdKdnIwRmdsbVJEZTN2a3ZmTmJMdUFremkx?=
 =?utf-8?B?NFh4ellBeUZZcFQyWE9vWjQ4bTFYZHJhRWFlTmluWUE3TDJFSTlqVFg0dWlW?=
 =?utf-8?B?TVY0OUpOY05PdHZjNktMQVFZR1dKV1ExRnN5NTFUdkY3cnhVQjhBSDRzbU5G?=
 =?utf-8?B?dUFDMTB6NFBSSnJMSktjdUZwQ0VOVytIWmkyS093R1RtNjQ4QkhqUWpVLzFp?=
 =?utf-8?B?MmdENHEvNDJENEtJL2xoUFVJVnlrTFZWS2J1ci8zb2paRUl2RWtXa0wxNUVs?=
 =?utf-8?B?MGZ4ZHg4MnZVQWE0blRnRlhyOWV2RFo4SktNRWtRK2V4TG51cnlGWGtKYklN?=
 =?utf-8?B?d1g5QkVOUk42bGg4TjRWb3pRemVJUDZjRFRZd2cxWk9CUjNrcTV4VzVUdDJD?=
 =?utf-8?B?R3EwUDh3ZFFpS3EwT0Y5WTNra3Z2d08wdU1SOXZIbzh2UW9pSGNTNWhsRHVo?=
 =?utf-8?B?Umd2QWhzYUQxS1dLUXBUeTd2VVVaV1FKZkhOTllEYnE4UlBCR2lmc2RSU1px?=
 =?utf-8?B?Y2E4Q1FzWmE3L3FRMlYxaFQ1VjAzWXZvYUFaV1Z3WWk1a1V5ZVU1VTgrZmJl?=
 =?utf-8?B?M21VcktuVC9hR2hTRGdHMU1HV3pub2tWUDNtekI2VUk2S3liSnZicDM0OWU0?=
 =?utf-8?B?d3NSZmFtSDhjMkpBWHVOblpPSnZJKys0SkdBVGdqM1ZYWEJiTnFicEZvdjY1?=
 =?utf-8?B?Um9nM0FHa0pQY1ZFbWRzazdxck9RSUFsakExOVhSeXJLVzE0dCs5QXhYWDVN?=
 =?utf-8?B?bWdtVk5MNDhjYlJmTnZGa0RnbHk1WTlRc3FzVnZSK2ttcXFBV25KVnVFZWhs?=
 =?utf-8?B?aVlJc2s5d3ExbFVwbHpYYUpwQ0hmMm1qaHpPTEU0T0p2MUs5NWlJcDd1c1FO?=
 =?utf-8?B?czJGV1Fkbld3bEdydTlzOUdRRGY2Sm5qR3g2Y2hwVk9iUWpQQTNwRkZWdWFC?=
 =?utf-8?B?R0x6S1BWRzMvQW9VTHkwbzJybCtid3pGekZRZmtDYU5SVkU2SkZzYmRiYzV0?=
 =?utf-8?B?aDJWMC9YWk81aFQzbkdUcWVEblhob0EyVEVqV3NHemZBWEZpU1RiRzh0UDhi?=
 =?utf-8?B?cHU3QVdGTWQ2V0R2N2hhVU1wVFdtakxYa3ZGc3QweFU4anpPUUZUMHdLY0hC?=
 =?utf-8?B?M054dXpBd3htZ3ZkZVVETE90N2NFUnJGcnBZUFlqNGdjY0tBRmJUSlN3ellC?=
 =?utf-8?B?WjUxRmFKeCsxdTVBYXY5YnRlaFBUNU9HdVk4OTlka3FGZmlHT2dGMmJzaGla?=
 =?utf-8?B?Y3gybDAvQnAvZ2pKOUxWYlJPV0JCNXJic2U0SXB6MkVDVDk5Q3lQeVd6NFhJ?=
 =?utf-8?B?WGNlOERZUlhBYU55dFlaM1ZzY1Y3NzIzQjE1bW0rbmdHdFBscDVRdjZMSWUz?=
 =?utf-8?B?SFJ0R2QreDQyMmZVK0pjTGlWdmNhZHdtRkRFc09URXgwMTZLMm1DQ05YaTJs?=
 =?utf-8?B?OGNlVTFoK2pGTzZlblBUZmFsYitYVEsvVEZQMXNuQkpTOW5jRExLR2RSUVQz?=
 =?utf-8?B?eUpRb1JwdEZuQjNVcmU5dE5VRGpRV2dPQk5iNUtEZEV2M1BBemN2L041YnF1?=
 =?utf-8?B?U0N0NkUybnFZVTNJYlUxQmxrSXEweUk3NUxFR3RkVytXd1gwUFBoZkZ0N2o3?=
 =?utf-8?B?TzNnQ1Q4N1dOUG1RQmt5c0pVM2FoMWJydmZGSENaT3VoUHJsRXU2Q3E2SGRt?=
 =?utf-8?B?Q1VFOUE2UGJTb0pERzczYXd5Y0NBa1lmdDh2czY5cm10K1EzbWxpWHp3RDBU?=
 =?utf-8?B?bDJaaGpJc2ZVYWYzV1AyZXVZekpiR2U0Z3FVVm43K1lkeVFldTZ1cUhlcjVE?=
 =?utf-8?B?dXVyb20zV0g3OXJpcHJVVHhLMUtucUdzUDc1M25meEdHdmM0VTY2bEFpOG12?=
 =?utf-8?B?eXNsL3JTZkFteXBoK3VtdVBadWdBQnozdGpXamdHSFJ4clgxdUJ0THJOQ1N5?=
 =?utf-8?B?dkNUaTlJckcyUHdRQjROK29qVXlYcDRpOE1YSmhjL1BhekZCd3hOcjdnc2hX?=
 =?utf-8?B?YUFuNzgzZUVhdXRReTdSZUQvK0ZTUVV6WWhBV3grQ3JuVFZuL2R3TDJQc0JW?=
 =?utf-8?B?SG45YXZyMDRGOGVSY3BkTmQvenVVMUx4bnhEckNkbzZjYnRnQ3JaeVpFWDda?=
 =?utf-8?Q?ki2FvdqZ1g5NIiAg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78CDE9F3DED97C469C27962F798A7195@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dgo6cUNAbE7/NpTRRRDrAK1EeyrvOrHyC09brhOInLStA4g1ovBB4CBmSyhZeSQmxZahdUuSDdMHF7PwyVpB2D12nedOMjhVBJJBYNYWLfW/f3l2O1fGdZafKJYxdQ+jJ5Ox/t/Y/obDQNMWVjfJ5lFTUDxZBNYjXGOz1ddNbNVCItqS3DOlRtSgnG9Q90T0OA/kHwchRchK8jGXr+c1w2AkKzvu7UyLqKk2RTrXctX9xhV90gCBzFvchSMixeGTxaJN6MtWEohz6uIE4uCGDW63wlFQQ9s0npOHvcwne/a1oK4qH8yWHk04ZdSQoKWjLg/1xiz0EDUKwk+qCtZX7w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cee2ed-7fc0-40c5-9bd6-08df1a98509e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 00:02:39.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78IgN0Wkmie6MuOKkI0uUMRJ5QwPygfiD1k/Dgbjv44p0aT1ui6cxoJWJUvzeHt+Uo1N1hXz42sLCA6mSahYxtPCN0/FGzZ4bP++Fhd7dVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9565
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTI0IGF0IDE2OjQxIC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3cm90ZToN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwu
Y29tPg0KPiANCj4gV2UgYXJlIGdvaW5nIHRvIG5lZWQgYSBsb3QgbW9yZSBpbmZvIGFib3V0IHdo
YXQgdGhpcyBUREcgY2FsbCBpcyBkb2luZy4gTG9vaw0KPiBhdCB0aGUgaG9zdCBzaWRlIHNlYW1j
YWxsIHdyYXBwZXIgY29tbWl0cyBmb3IgZXhhbXBsZXMuDQoNCkJUVywgd2hhdCBpcyB0aGUgYmVz
dCBzb3VyY2Ugb2YgaW5mbyBvbiB0aGVzZSBuZXcgVERYIGNvbm5lY3QgVERHIGNhbGxzLiBJIGhh
dmUNCmFuIG9sZCAiRkFTIiBkb2MgdGhhdCBoYXMgaW5mbyBvbiB0aGUgc3BlY2lmaWMgYXJncywg
YnV0IGl0IHNheXMgaXQncyBhIGRyYWZ0Lg0K
