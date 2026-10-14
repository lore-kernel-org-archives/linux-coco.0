Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E31A2F7F05
	for <linux-coco@lists.linux.dev>; Wed, 14 Oct 2026 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958806; cv=fail; b=bVD6Aws0sKe0L4/L5jdx8e9UmayVF9C2UxjRTPvtXaA86RwiWqznbEU4KsCI6bVpEh8WUu8jP2PyyD7cGqS1dSzB28CYZKlpqTYY6+wv2BptYy8kkNo7fgubLMzf6kVbZ26sNKZ2VE7n3329OfiPECZ6nCTmG1zRcne2qNS9fAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958806; c=relaxed/simple;
	bh=07SLjKmN/8QP7Tvyz3715CarwOIZhBL/hrSnLJlzBf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ci6cj5dbgKIuYT+Yjh6/w1LtNHk4WwnDEwtrG9otlebkdDHID1B03MCNVSiaksD8sde7yb6SwnFrxV8px2ow6z7v23urTmHvBR8UXfLGcMhXbUx07dbAKMDDLQsofKslG4gOaDcx2YzwCF/vdKuu9z0+tV8umRr0FEou8vMVAUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knpVMouK; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knpVMouK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791958806; x=1823494806;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=07SLjKmN/8QP7Tvyz3715CarwOIZhBL/hrSnLJlzBf8=;
  b=knpVMouKim+4WXzQT15s5JtPPMZ7nC6onGGJqKpLRKbybm43h/wbs2lj
   GJ6DHUIyM5+mQ7O1DemrlXok5c+gv69VQ97X2zjkfW3I7TKJPdYEOvI/c
   dqVt4vS830u4WG1o8j4pJZNc4YUeiSru8tK5MiZ+MZ17tvnFjWIpzTJNm
   2KrqgIsqIqeVkA6Wo/3cPc2nBnUNwSbRI2DVtybVpRs7XVnGEu6rHFsaI
   YBVz+DT0ZZsdQbJqS5jxtaYfU8QS5x8utBkyJiG1f8tlTEH2OE2Rdq0Fu
   Fsj+NaqVQUxc+BmdBaK4f7R7qoTotFJmESbg86oMi7J73zW3bJ84t4fp2
   w==;
X-CSE-ConnectionGUID: O6k4dvoYSTC3nX245CqQzQ==
X-CSE-MsgGUID: /3BrFAFlRkKu7pcZTx71tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="682468"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="682468"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:20:05 -0700
X-CSE-ConnectionGUID: EWXf0dgQToW4PESYga88Ug==
X-CSE-MsgGUID: 1vtDrV5mQkSoVntzYDo7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1805247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 23:20:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 23:20:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 23:20:04 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 23:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEiiYsCHPAR7XD8vef1tbQ/OlibgfOdjNgrOMHSntv6YC9z6/e3HyDWS7Ri1OfWd+0iikWA0g4DerhWQnDEnh9ULVqTm3CVx6nTXcXts2GBkggycDg3gpUKDpJaTonKOsHXnze46Zf0Hj+xV/K0toCCMrr6qF0O0L5YXNqNd3kFZARtbCXueB2b7vxjkIL9BN2VNlnOJYIbM9e6T8s9iJfcekgyhy9zFKq/pY3n4qcbFpUJyvq7wTwp1jWtVVNHtFznJr4dberArDb27hEDCBORd2xAgho+7uSS7B9uD77AWwe6Nq6zE2wiVgLeKaRNPdF5GM8aVTlyHarHpdP++ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07SLjKmN/8QP7Tvyz3715CarwOIZhBL/hrSnLJlzBf8=;
 b=dc2Nb0FtnDBGa1YbIJUeu+DbIqIeUMVOvEkCMN0pBq7kvKxnsxxBX9Sn/vckjM+7rdjTFlQ+UHQxV8kyQFCEFJ3A7PYn7Wmq77B4B2eetq8NNXI+OXxvw21WJXGrqCpY7aMRDX1urN8FTYRZDspL4FmZqPurGko947Stx0XRxHqLoSVLIIUydL5hOrDhKBSROu8nqEa1OrAScPe5RaTlRLV8zGH7UnmgRbBlc1QdNol8cLv1h1aaJNZXtyTYWKCAMppkrLgti2QjXBjvE4B0FYZmHJWbA/z+LWMoAKl9hwtlRfCENYJjOAooPN25tJCGw7nwHK+WtqJXE4zWtZxUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 06:19:56 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 06:19:56 +0000
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
Thread-Index: AQHdS9q3p3OwHlhwLEuB5opu5u+Cqrb7qCMAgAEGRBA=
Date: Wed, 14 Oct 2026 06:19:55 +0000
Message-ID: <IA3PR11MB91362D1D89BF53AE630A9567929D2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-3-zhenzhong.duan@intel.com>
 <54846068-d545-4591-b850-2980ce57f40e@suse.com>
In-Reply-To: <54846068-d545-4591-b850-2980ce57f40e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|BL4PR11MB8848:EE_
x-ms-office365-filtering-correlation-id: e4e4178b-7927-4230-1f45-08df29bb2a98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|10067099003|3023799007|5023799004|4143699003|11063799006|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: aJvQ4tVob6Iwi0c3LPf15Dg2rwO7BElpPe6QjmSxTmy8t2Jb94hF3YH5Hgrg3loqYGIxTdgOktA0CPc8DThNRqgcLqkVKjJn8VWspfItvhTO9DwFJ7BOy4QK4yLSU+npeh3YqPw2zPvOopUQgTKTurdhxFbzD+hYap+SuwtxWTSH4YYh5TK4LEEcDvLqWuLbEcSo+jqTNfunnHmzT8TaCQDki7CAja3QImn+vROGXlGb32P9Y6/jElFUD0XVFm/hvNuHakuSDLYiLetJgJ68WMnhOvIShDHHU/z9IyR4hBOZ5AzxxzAtbaDJMuh/QPVEX6wyHds+R7LkMxf83Lt1hYYNO5RctVxXGizofPzLsZStTTvYBpJ6evC9rnzlB4R4q3UA34/UXQwnTMGyCPYKIQkJ3E+/yL16BtkzuDrK1Xx/KS++Gxt6aYr0o1Qtd7HVZxrsqyeGxCuaRLj5Koz0X5EXfUHZ49fdwb9dOU2fPtO3fgRjasBJWSFIey319J1L3kupDeXRJleqnzfX4hQaD8hFEdhnMRzVIHk2tJ6ydPXkkuPxe+p3mO6fNszvhC51f0g7yX9kalKSFYie1kHIRyVC6H4u4xilGK5xF95e+i9Lntb8eHTDEguSfizTc32T1Vl81rN526uXdzwFDzdYqBTIUWMPCvlRwaq/B4+qyZbe8VkpLwmWH8z85Xcmy9pEZbQ92976jJn8odKOSZr0QCG+alYRVYrMREa/dh5nuU0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(3023799007)(5023799004)(4143699003)(11063799006)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW1nMlN5QUs1bHpXbmxlRjFXZldHZ01BVk9aMHRSSkxMMGN2bWNJRU5MOWs4?=
 =?utf-8?B?cGlrelBnSnBBWFVUa3A0SkpMZFpnZ1ZyKzRkS3hmaWE4S21vSm1CN2srcTJV?=
 =?utf-8?B?amtrU0xReVVpVlUwWHZtQ0FJWDlyYnY5VHhYUlZ5eUpaZlhoeDZpSGdnSzJ4?=
 =?utf-8?B?c3NKcVU1eWhxV2VSM0hFMjBJZnp5d3oxTmxrQnZRT0VyTWVvYlM3M2laSzhh?=
 =?utf-8?B?NVRYZ1l6b0JhWGVMdW9Xc2h4d3pIV2tFSXpscWNLUS9ZMWI3TWZaMUxhMTM4?=
 =?utf-8?B?ZkJvbmZYZ0pxN1pQVUY3Vy9kVHo3c241UzdGNGQrTTFGYWw5MUJ3cFZXdkQ3?=
 =?utf-8?B?Y0ZlMklRZVk1bGlsUGNzRGFQYlhjYUFJaElrcHd6NzBaNkV2UnhiZzlnNExL?=
 =?utf-8?B?SDQ0eG85ZDFvTVFGdkptTHp6di9nVllDR2pHamx6ZkNXQVdaWjFheHJiMDZv?=
 =?utf-8?B?cFljMHA1OTc1N2VqU0NpZjQ2MVpMWVRUeVR6YU81NTVCV2owaTR0Vmk5YjQ1?=
 =?utf-8?B?WEN0ZURtcWFwSlhxWVovT3JoQXlqZjJaa090YW44Z1o2MG9MSGdYZnFrQ3RC?=
 =?utf-8?B?aFl1d1ZlSHFLVERFc1JzTkxKVjFEc2QySFdPa0J1T1lMSElXN1V6QlhpbnZQ?=
 =?utf-8?B?ZW1vdzdoSmJFZXJaVk81b0VrSW96UElCTUVLUlV3YVRaSExaWHB4VnZRNmxY?=
 =?utf-8?B?UVA3OHJuQis0amROb0t5NjNpRTZvZjRxVjhpaXowakx3UUhWSjdSMFBDNnNE?=
 =?utf-8?B?VEd3WndkZ2JHemdZMy94ZTZuM1JvakNjdGExUFlMdTA4VWxqY3RIRFBDTkhm?=
 =?utf-8?B?TFdwNVQ0VmR5MWdQZmd6cXdPT1hiZnVsbVgwSGRqMjRFWUpwQWJYVGtGZVpD?=
 =?utf-8?B?ZDVCYnN4YmNzRlNsUXhnUW5IbC9BYW5VZlpKcFRxM0J5RjJDVFFmV3VkQk96?=
 =?utf-8?B?QlZGQ1VWeW9uTjlDbjFPb2JyaERlMzdZZXhNWjVJRnlzdTg3Y3NiazF4b2ZT?=
 =?utf-8?B?b1FpYWZoQm16amRUL29QRm5GNDY2TUk2aTh1dGRrbGZWckVtejdseXo3NXBq?=
 =?utf-8?B?dFdXZC9kR2tpeHdUTnhsbVhyTExmTjdXajJMa012YURSLzhDN2JVV09JU1RY?=
 =?utf-8?B?UWtBZlBNZGI0SW0rUG5IYkprdDJXdk1SYkVrVUlleXhaWmdkVHBoV2xJcWlv?=
 =?utf-8?B?QnA2c3BQTVEzKzM5d1ZXa2dVcWMyRm9QLzVkaFl6b3FwWWFRaTNma2R4UmxL?=
 =?utf-8?B?a3BhSnU5NjhaRG9qSWltVzlRMGV3djFrZGFtYjFHN0dmUjN5Rjg2ckltN01u?=
 =?utf-8?B?Sy9oYWZKM2pBemFZb1ZDZkFOZGpZOUZrUk9WbEN0MTAvcTkvV0dpMCtOTzIy?=
 =?utf-8?B?Nlh3N0tBQ2dJTzBIeU5NSHBhenBsYzlYWVF2YzBuZlFIdmhmTlBBSnA4aFpn?=
 =?utf-8?B?VHo2Q29XcjZWSW40dW9qVGFUaGpwUktyam5JTGhtQVlDSlFmMzNYOG1aa1RW?=
 =?utf-8?B?dDh2eVdSakJZbStmQ0pwYlRvcDh6bFFtZUxNVi9YNVRWbGhpb3RMVE9TZnlz?=
 =?utf-8?B?alBESjhaL2E2MWE1RlNaSzMwNU1OSUQzeW5USmpxUXFYcHpodkNkUGQxcUZz?=
 =?utf-8?B?UTd4dzI1Y212b3lPYlBrQTdnU1hxRjJQYTN1d3VudVJZcGJ4MTZ6YWJtaE4z?=
 =?utf-8?B?ZERNY1pFMkNhV2VZOUlDTUZxR0RuSmo5cDBsRnBadUwxbVVSZGxodDFGR244?=
 =?utf-8?B?Y0M4NDRjemtsRis2WUZZLzd4V25HdXZuZnRMVU5iTXJ0R2puanBtS0VKUmE1?=
 =?utf-8?B?MXZnVFVtNXdmMTZNWklFekpwOHJ4eU80R1NzYjFYQnlsMllIQ1BFQ2ZydDlH?=
 =?utf-8?B?em9VNFFTeDBGYlM5cE00T3pZa0tHalFpaXRieXdsYjNLbG4yclVxbW9JUnc4?=
 =?utf-8?B?QWJwOUI1OE5FdzRkRUdrbGhKd2JmMDUrZTI2bW5PT2I3MFFhdkZ4TFVsQ2pQ?=
 =?utf-8?B?MHluNmtZQXFJZ1ZNNjNkcmhzREd0ak5odW5lN2FabWQ5b0tlOHo1bkhEc21n?=
 =?utf-8?B?UmNlMXF2T1d0UXJLOUc4dXAyOWZVZVoxZnM3KzQrb3NGbFppSGRTVkFqUGpQ?=
 =?utf-8?B?L2hZQkQ4clFRSFlTOTk1Nk5JZkExdGVEbnBnclRYUTZrV255ZHN1ajdCdmdn?=
 =?utf-8?B?cnkvaUM3RzJxN0M4Y3FwSks0L1lZZzB4S29CTWRnRTZuQ2xZQjZzT1ExMSsx?=
 =?utf-8?B?WWY1cXVOQk55dE9FSXdENUZLNXRZUzhDL0djSXpoWGg3ZE5aU2xHT1lIUHFV?=
 =?utf-8?B?VUhSd3FGc29sMlIzZkVIelA4Z2F3cVVHdmxUa2xvc2dyeXg0aVJZdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0DCRJlWnwqfkCTXe1LwqQRql+rkOcDtfoGhhEMA2IfRNDBrgdafOMdGEMmopLGdf64fgvb+gHxw5bb7vYkOFd/0vZSTwXwqD6xvR5lqV82e6p2K+RpqSJ6zrJxP0KjGaEhtk3KxFbmBFMwnSNliVGgH9DAqdKTn/OUUMNNhJnOfHeVYdj4UmkB4JP1+fWKXabK6R6H/SzBUukc+EHPoFqPmb81JXswmGbTI+mC31ThUW8e+BokFs0npSLzS+MR+xlH4aAzwP97wsy/KL7JGti5CD+MZmqPI9S5+f3EcyNXrbZ1sTjdo7Nf2l5X5ytUBp9w9hqM87+P4giDsLZafKgA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e4178b-7927-4230-1f45-08df29bb2a98
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 06:19:56.0024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2EqUZyufJ6J1Rq5tQ+pX/7WXTpUilXPcmRYux++kxXJCJKnL4TaEDZn4WyBME0QKdFLnqKtSFyMSAPPTrX1mH1V88mFFwT/fEc/vms0nmC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDIvMTVdIHg4
Ni90ZHg6IEFkZCBURENNIGh5cGVyY2FsbCB3cmFwcGVyIGZvciBURFgNCj5Db25uZWN0DQo+DQo+
DQo+DQo+T24gMjQuMDkuMjYg0LMuIDc6MTAg0YcuLCBaaGVuemhvbmcgRHVhbiB3cm90ZToNCj4+
IFREWCBDb25uZWN0IGlzIGEgVERYIGZlYXR1cmUgdGhhdCBlbmFibGVzIHNlY3VyZSBkZXZpY2Ug
YXNzaWdubWVudCwNCj4+IGFsbG93aW5nIGEgVERYIGd1ZXN0IHRvIGRpcmVjdGx5IGludGVyYWN0
IHdpdGggVEVFLUlPIGNhcGFibGUgZGV2aWNlcy4NCj4+DQo+PiBUaGUgVEVFLUlPIERldmljZSBD
b250cm9sIGFuZCBNYW5hZ2VtZW50IChURENNKSBoeXBlcmNhbGwNCj4+IChUREcuVlAuVk1DQUxM
PFREQ00+LCBkZWZpbmVkIGluIFREWCBHSENJIHYyLjAgc3BlY2lmaWNhdGlvbikgaXMgdGhlDQo+
PiBwcmltYXJ5IGludGVyZmFjZSB0aHJvdWdoIHdoaWNoIGEgVERYIGd1ZXN0IGlzc3VlcyBkZXZp
Y2UgbWFuYWdlbWVudA0KPj4gY29tbWFuZHMgdG8gdGhlIGhvc3QuIFRoZSBob3N0IHByb2Nlc3Nl
cyB0aGVzZSBjb21tYW5kcyBhbmQgcmV0dXJucw0KPj4gcmVzcG9uc2VzIHZpYSBhIHNoYXJlZCBt
ZW1vcnkgYnVmZmVyLg0KPg0KPlRoaXMgcGF0Y2ggY29udHJhZGljdHMgd2hhdCdzIGdvaW5nIGlu
IHBhdGNoIDUuIEJlY2F1c2UgeW91IG1ha2UgaXQNCj5zb3VuZCBhcyBpZiBURENNIGlzIHlldCBh
bm90aGVyIGxlYWYgb2YgVlAuVk1DQUxMLCBidXQgdGhlbiBpbiBwYXRjaCA1DQo+eW91IGludHJv
ZHVjZSB0aGUgcG9sbGluZyBjb2RlIHRvIHJlYWQgdGhlIHJlc3VsdC4gQW5kIHRoZXJlIGlzIG5v
dA0KPmVub3VnaCBpbmZvcm1hdGlvbiBpbiB0aGUgY2hhbmdlbG9ncyB0byB1bmRlcnN0YW5kIHdo
eSB0aGlzIGFkZGVkDQo+Y29tcGxleGl0eSBpcyBuZWVkZWQuIElzbid0IFREQ00gaGFuZGxlZCBz
eW5jaHJvbm91c2x5IGJ5IHRoZSBWTU0gYXMgdGhlDQo+cmVzdCBvZiB0aGUgdGRjYWxscywgaXMg
aXQgcGVyaGFwcyBoYW5kbGVkIGJ5IFREWCBOUlggbW9kdWxlPw0KDQpUREcuVlAuVk1DQUxMPFRE
Q00+IGlzIHRoZSBsZWFmIHVzZWQgdG8gc3VibWl0IGEgVERDTSByZXF1ZXN0LiBUaGUgVk1N4oCZ
cw0KcmV0dXJuIGZyb20gdGhhdCBWTUNBTEwgYWNrbm93bGVkZ2VzIHRoZSByZXF1ZXN0OyBpdCBk
b2VzIG5vdCANCm5lY2Vzc2FyaWx5IG1lYW4gdGhlIGRldmljZS1tYW5hZ2VtZW50IG9wZXJhdGlv
biBoYXMgY29tcGxldGVkLiBHSENJIA0KZGVmaW5lcyBhc3luY2hyb25vdXMgY29tcGxldGlvbiBm
b3IgcG90ZW50aWFsbHkgbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMuDQoNCkdIQ0kgZGVzY3JpYmVz
IHBvbGxpbmcgdGhlIHNoYXJlZCBzdGF0dXMgYW5kIGV2ZW50IG5vdGlmaWNhdGlvbiBhcyANCmNv
bXBsZXRpb24gbWVjaGFuaXNtcy4gVGhpcyBzZXJpZXMgdXNlcyBwb2xsaW5nIHdpdGggYSB0aW1l
b3V0OyBpdCBkb2VzIA0Kbm90IHVzZSBldmVudCBub3RpZmljYXRpb24uIFREQ00gaXMgbm90IGlt
cGxlbWVudGVkIGJ5IHRoZSBOUlggbW9kdWxlLCANCmFsdGhvdWdoIHNvbWUgaG9zdC1zaWRlIG9w
ZXJhdGlvbnMgaW5pdGlhdGVkIGJ5IFREQ00gbWF5IHVzZSBOUlggDQppbnRlcm5hbGx5Lg0KDQpJ
4oCZbGwgY2xhcmlmeSB0aGUgc3VibWlzc2lvbi12ZXJzdXMtY29tcGxldGlvbiBkaXN0aW5jdGlv
biBpbiB0aGlzIA0KcGF0Y2jigJlzIGNoYW5nZWxvZyBhbmQgZXhwbGFpbiB0aGUgcG9sbGluZyBj
aG9pY2UgaW4gcGF0Y2ggNS4NCg0KVGhhbmtzDQpaaGVuemhvbmcNCg0K
