Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C8D1A6834
	for <linux-coco@lists.linux.dev>; Fri,  9 Oct 2026 02:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791512194; cv=fail; b=oya1/LnDdSXnwpK74IQ1CExeqrmQczWHG4N8+w7B2AtmyYdRXDNjBgm+jgYKO66YOl/4FRxWY8uhEvtfGUVzQacQexCVltCHlSmIjwgdcGKHUSAdgbfFASMefJjtxqEnFb/8hubP9yK7YfNH/SLY89t/HKDQSw3DbOtbN5FrdV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791512194; c=relaxed/simple;
	bh=bSn7f1W3ddQHxfbeD1l1dyihJDmBmf2xL/qJBafUmbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AVdTRbU38mk0dTVHJUnOaq3pannLK+hcBArEbzoVlNKjePlob1ODHlYmdxd3PIuc3nUlOKyCV+PtyLUlq4jpl+HgQHfCbYiLQqwMYKyaxh9l/v3TqFF3Lbym82tgd82WJRD7Fv1uL0hXa3NVt2/+W0Bg1kjG9Qu2wqzQ68P28Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMk2LmBZ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMk2LmBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791512193; x=1823048193;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bSn7f1W3ddQHxfbeD1l1dyihJDmBmf2xL/qJBafUmbA=;
  b=nMk2LmBZbEmzwYstCjLO4w2oaDsdklVnDWNocz6bQjyxBLwyr+5AEncU
   k8/l5oYaXoEZnb5Tw1Jznrwaf2HfXGxsvN5t2fUxFCkfW725pPTmRAodw
   iJaSM0Z6Sdy87+d/u0m/JAzm7Gn6sBDcDxjkAWyESUZ5aIpI6y/5DMYMX
   VxzaAE2uOVXw5m/9TJEIIjRmYHVsM+566VJ49jxwW0k2l6tV9XL1rX5k1
   5WvJen4/njsM40dWQSsnmMdn4Vm4CPZS6WFnqWGmNRqG3iVldxENFDCtK
   16tEsokp/DfKuT4csq/8Ga4M9gC04GCXGBfozPy+cVw3YG9hbPXN29rmF
   A==;
X-CSE-ConnectionGUID: XXV8sTVSQQSiEPJl92SvSg==
X-CSE-MsgGUID: y1eYjfKWQl+tETe/47TmBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="211250"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="211250"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:16:32 -0700
X-CSE-ConnectionGUID: Rd4Oq+SuQNClvSa5f+ZEhA==
X-CSE-MsgGUID: J1KtKmeVQfubU6UdpDbweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="2003398"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 19:16:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 19:16:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 19:16:32 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 19:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKVE2TDF47S0ECQcB2wHIX8Jc8//YRIKRK6KMAFbMz2tb/w+yMmKyyVPxoMAytnWEOddIUgw3kxJwRyYVIosxP+7Oojnv8jEcV6zMzXhWxRbt9SeteDh3QK4gxJUQlUuYZ+74O+IwjciNZuZbmzFipvXpxRhmyOuwn0oHdSH3X/dItkgAjE37zeeai2wAw67VuH+0jYsjHtJ0XdlRr71i3dkv9lVEZ9cKt1dTOtpcUIMnGI0BRa8M9QiAc6l/Nb9jYZh0uDGQ52ZWrFQzxgYnj5VQbnxZO115XNpKik9Epam3kcXWqH2rP+CLAWmdPhr7PeIIzT2jDga5ubitNBmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSn7f1W3ddQHxfbeD1l1dyihJDmBmf2xL/qJBafUmbA=;
 b=f6sbqBSwIVarr9KqK6QkSJ/QDPi5qrCONDv5Ma1piDDo6ZqHoX+cjIqhLXsayaJWGA6CeFu166h7TXodw3wbq+2hcY6ze1yY2DQPWkHVbbcLqOOSMMJPWYd+F8zIJyXz+qBj7wDkbtUN/xoMJI4zZ4/NJc9FBATKiP+dN/CXgQXJNHuiE6SGPcRnECExa6DJNSnp+HxK2VL9BhPLvJxxjIbvId2jezQNu/CfZ+zR99O6yEvTeSXxCdXR73gLlAYHSlqcNqJQI74VHdBM7jgJg+zLHzBQR5/QGvKRPdocdUGVROdLGJyNmziUH9zddv+w4fG6Lv6SB8XOMLLcNldFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Fri, 9 Oct
 2026 02:16:14 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 02:16:14 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
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
Subject: RE: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rIdRCadJg8uEm6GsazTtQ82bbeZNsAgBSotGCAAONOgIAAn6iA
Date: Fri, 9 Oct 2026 02:16:14 +0000
Message-ID: <IA3PR11MB9136A20188705839D709AD6392922@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
	 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
	 <IA3PR11MB9136B922CD5755958ED5D30892932@IA3PR11MB9136.namprd11.prod.outlook.com>
 <c619e00da1f5c6d21f1b9a1129082b6938cd6575.camel@intel.com>
In-Reply-To: <c619e00da1f5c6d21f1b9a1129082b6938cd6575.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SN7PR11MB7420:EE_
x-ms-office365-filtering-correlation-id: 514898c4-7acc-479c-bb71-08df25ab4b73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|18002099003|22082099003|38070700021|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: jGNgSRavowP2CvSlXSvCxZ7Gvfb3bidzKWpAiSO104Ah63PN7QF2Is6vXQynNCxLdLz6819aswUBDSfcC3JkMgjuNQFJ8gQeOEp5+46CDIbiut9gCasmMeF8C+dIC9lFSEROR6k/9sL1h57MpgkPW7MObvhJnupv9ARd7KMhyU4DrJcIH0Kq9lZe3nqcCIK3bN4ToBO8/l5ufBh1TFGatrYvM7npS6YtxZ78uXEf9dinXT8DuZH7a56H16WKhEoGfDDWELm5xt/HuIYjlMC3mnALsvPg6WE6sgYxy0lmAY62TixFBeIz0hM0il4CYs70sezHpf/Lmp+Wa07beTVO8BayEOoK/6TVZZ0QHIU5wIOV4E+wJmXxkc/JJrmqr2VuSP5Y9betLGi6A6QJtLC1hsT/SoBYVac9GATt7GfRHiGlaINjJokJ5snjVvO92mUO2HdSqOlSaOhxkxYndnVPr5yKMM2sZr/n15OSsv2Y5uHBkfrA7fT8OQPtNtcQ5FFlm73XrjvHD8pDt881ElYmn+jKA4wC2NeOwkD/ENv0ehjZdEJpgV+ILdMj1ELFUlmRdtO3kC+IExAugU1dZsmz7po4ddXqRUBUfbb2aebiyo4kM9aoXzvvY72W37js76vXfdE6FvkluPpBfnrQR3BT9Azz/RleMtEMmlsoBsD26urMgTW1J2zf4PwgSD0/28hgLEasjpjdetfE1GnCXqO+/nSAznLh19Aq98BV5mUVQPI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(18002099003)(22082099003)(38070700021)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHdNcjZ3MEgyNjFxZkM4UVBlSzFiY3YzRW05b1FZNjZTRWRnb0Z3elplVSs2?=
 =?utf-8?B?SmIyL0MrK0VPTmQ2L2UveENwREh4WDNxdjhSUUJkQWp5V3BFZ1RXUFp2bHla?=
 =?utf-8?B?STR0MFljUGhQMXYzWEN6QnJnZmdwLy9TWG0ybmMzd2ExNTFKMXpMamVHVkVq?=
 =?utf-8?B?MjhzRzNxd1htV3Q0Nm1SN3VwL0Fucnp6dUdxc1c4ZURXdlpBRFUrbjNvR0FG?=
 =?utf-8?B?Umg2Q3lrTFl5QUZ3U1pIalR0blZwdFByYjg5UEtZd2V1M3lXU2V1aCtmeVUr?=
 =?utf-8?B?K2d4Rkw0ZE1qQ3UvbndaU2JNYStmbWl2ekc5eENuM2ZsZEtqZVNXdUdBRE52?=
 =?utf-8?B?UWxCbDU4U3VYVzZXZzc5Vm4vbjJpYXdPaUtwVEhQMkxEZWZqbGhZVS9Dbis1?=
 =?utf-8?B?VEtIKzV0OVdGRnU2K0xEb1lRazhPK1lndTE1YkU4cm1rWThwWWk5QkhEWnRJ?=
 =?utf-8?B?TDNxQktRZHMzMlhiVDF3SjBJL1p5Z3R3ZStMUzBPQVBILytISjN1akViSk5m?=
 =?utf-8?B?dWdZdS8wWU1zRUU2M1pYby96anZpd1VjdHBLVGdnTW8ySGVzcTQxMHVNeHNp?=
 =?utf-8?B?YThPVDNKQUE3ekY1VXJSUFRXREtSZndWekpyL1Znb2I1NzBYUVJRNStocEdX?=
 =?utf-8?B?TG9rSDN0V0dBelNQMUtxaVYwNkx1V3FGeEZ2YmUveUFvSCtwMEQ4Qlo4R29n?=
 =?utf-8?B?Ulg5YjlLOUo4SkVtd2hiZGlRSVVoRlJMU3F5KzhrR1Arc0xHcGNqVTJOZy96?=
 =?utf-8?B?ZHgyc0lSZ0dDVjE3MDlOcE9mcnV3RkNGVmNzL3o3cTZlUDViRnUzMUF4T0Z1?=
 =?utf-8?B?UjBoZlkzMGtJL2ZEaW5CblMvQU5wY1g2dDRuL3k1cnhCajZXbGRrSlhuTDl2?=
 =?utf-8?B?bFZ2S05aYmFFYlRxYW1OTk4xNXI2TnpGemVGUlZIY3owRUxvaXlMTnUzN1pI?=
 =?utf-8?B?cnpNdmxya3R4QkErMmhhL0NHREZrNEtJRVRzdUpmaU5kYXpXaHRkRitCN0x5?=
 =?utf-8?B?UzFzTWo3dzNKOEhQa3plUzJQQ2FwdHZTM0VydGZWZER3OTFUa1RTWlhLc3l3?=
 =?utf-8?B?b3QvcS9oQ2huazlGQ2xFMC80T1dreDI5QVhydG9TMmYrbG5ReEtBbCtUR2g4?=
 =?utf-8?B?YzRvSUUrK1k3VWJVQ3M2bURiNlpEbWlwSkdkVXdJb0Q5WWdIblRBR0RMK3F0?=
 =?utf-8?B?d0JvZk1reVNwSzBBNjFtNDBmbmxlS2tDMWxJR0hUVWI4czAyV3F4ckcyODNY?=
 =?utf-8?B?bjFKN2gwdEZ3L1hrdlZkNkovcWVRT2VyUXNRUTlhYTVWak5CK0l6dDZCWitw?=
 =?utf-8?B?Rk0rN1VpME1NOGlmSkI4bFZtMm00TFMxRmFRK0F1Y0NadWh0c0I2M2ZUVTBr?=
 =?utf-8?B?Vk9jUi9Wb3pmN0ZrL000bG1zYWUwd0s3blZvdllySjRURHdRU3dsZGNIckVj?=
 =?utf-8?B?bjl3QitldzJEWW1YNHFCTXZ4eFl2WWx1Y2VOcmZYS1RmRitLRVcvdDh6L0FI?=
 =?utf-8?B?SWdzKzJkcUhrMGE1emhQYkd5OGRZcHN1YnZZOU9kTHBLUXQ4amtrV3VsZ2Nj?=
 =?utf-8?B?T0wrOTZzQXNvMGNPL01NbDBGUjZyS1R5ckJ0NEh2RDkwaGFFN0ppME1JcHM4?=
 =?utf-8?B?MXJZclI5SExFOW5wOGZ0b3ZkeHFGL0FCVUE4eU5NMTA1cHJUTGVleEdEakI3?=
 =?utf-8?B?SS9OYzlzWmZlaGRYY0dSVzVXWXlMNERRNjROV0pVamxzak1KMUJpdWk3L0Ft?=
 =?utf-8?B?OVQ3TlhLdVErVEwwV3VuNnR0ZHpWTjNZclNlNVdIOG1SMU5xci82M1NjbExz?=
 =?utf-8?B?N2hzUHdweCtkNXRSTS9iVUVaLzlHR2tLOW9RV0h1Tk9NbWt0OTJPUVZnZ3lF?=
 =?utf-8?B?Z0dEZ2FuWklYeVNWUWwzSEgyUFhQbHhwRkJFQjU2ME9TRUp3QjhxSEJhTkk5?=
 =?utf-8?B?WUY1MGpoc1FtNHpTaC84b2lORXpTYkorS2hRSFg0czRRTURyYnROSGdiUDAv?=
 =?utf-8?B?QUpDS255ZTdMSFN2aGhBVlFmYXYrNml0Y0VUTmdHWGU0VW9EUkdwNitKR3NM?=
 =?utf-8?B?TVN6Nno2YWo4ei9Qdjg3bzMyayt4TmlsQ21FY2VQU1gxeWJ4VEFCV1BUUzE2?=
 =?utf-8?B?TE5FZTVCaG9aWEZ3NnhlZUNqaFNOVlBKNk1VcUxhTU5ZUGI2aVZ6cWdLZkdM?=
 =?utf-8?B?dW9EcXM1WmsweThzUWwzczV6TXB4L3d6Tk5Za2hwOG91MTVRMlQweUJCRDdF?=
 =?utf-8?B?N09ZS2MzMWNEempmTHViV29kaFRGcU1SREhMVHNjL2xNUHVBQmRIajd2OWVG?=
 =?utf-8?B?WDF0Z0hVQnAzN3lycnhoeldWc2t1emt3RXR0c2dWamJoRVhtRVI1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rwz90bMUXkVj0OiTOltnUtklKPDtGnMOYQG45d9PSM/f+DjQLdHtSA7mMvjU0YHv6FMBz4t7NCIuDSxt+wRsEfL+oqQk1GkAKD+4rhyhXTQa/QAk/HxvJ8e2iVsNGM0Xw3QkREQy8VzC2mOpi35ToX8BfYMN993mboKLPKG7S+LZJuQk/Y3jPMdsmzcCqOHi+eEyB/8GY7kKplaJgvNXUPohv7ScEqOQnX5MGjmx68R2SJJEj8xkQgEKnLTURWyGyQea/1eUZvnFS7UaE6Xs/yI/U3Mx+YHUXs6uXJgmxb0yS2Cc9nYagouW4fZcr1ocrSm+qKHJVe+EHnJMRoiZ5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514898c4-7acc-479c-bb71-08df25ab4b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 02:16:14.5369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzlBWKnB45L7FORfJYa5CQu3J3MFy7u6Kf5zjM+9S9aIMcH0QogA2p4BRoj7R1c81DSBxRDGxYuS6CvaeAtQ9Gp9i6UweTOchFvdFtPFEYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
OC8xNV0geDg2L3RkeDogQWRkIFRERy5NTUlPLkFDQ0VQVCBtb2R1bGUgY2FsbA0KPndyYXBwZXIg
Zm9yIFREWCBDb25uZWN0DQo+DQo+T24gVGh1LCAyMDI2LTEwLTA4IGF0IDA1OjQ5ICswMDAwLCBE
dWFuLCBaaGVuemhvbmcgd3JvdGU6DQo+PiA+IGludCB0ZHhfbWNhbGxfbW1pb19hY2NlcHQoc3Ry
dWN0IHBjaV9kZXYgKmRldiwgc3RydWN0IHBjaV90c21fbW1pb19lbnRyeQ0KPj4gPiAqZW50cnkp
DQo+PiA+DQo+PiA+IFdoYXQgZG8geW91IHRoaW5rPw0KPj4NCj4+IFllcywgaXQncyBjbGVhbmVy
LiBCdXQgaG93IGFib3V0IGJlbG93IHRvIHVzZSBmdW5jX2lkIGFzIGZpcnN0IHBhcmFtZXRlciB0
bw0KPj4gYWxpZ24gd2l0aCBvdGhlciBUREkgc3BlY2lmaWMgbWNhbGxzLg0KPj4NCj4+IGludCB0
ZHhfbWNhbGxfbW1pb19hY2NlcHQodTY0IGZ1bmNfaWQsIHN0cnVjdCBwY2lfdHNtX21taW9fZW50
cnkgKmVudHJ5KQ0KPj4NCj4+IE9yIG1heWJlIHBhc3NpbmcgInN0cnVjdCBwY2lfZGV2ICpkZXYi
IGZvciBhbGwgVERJIHNwZWNpZmljIG1jYWxscz8NCj4NCj5JIGhhdmVuJ3QgcHJvY2Vzc2VkIGFs
bCB0aGUgY2FsbHMgeWV0LiBDYW4geW91IGNvbnNpZGVyIHBhc3NpbmcgaXQgZm9yIGFsbA0KPmNh
bGxzPyBJZiB0aGF0IHdvcmtzLCBpdCBzZWVtcyByZWFzb25hYmxlLiBTaW1pbGFyIHRvIHdoYXQg
d2UgZG8gZm9yIHRoZSBob3N0DQo+Y2FsbHMuDQoNCldpbGwgZG8uDQoNClRoYW5rcw0KWmhlbnpo
b25nDQo=
