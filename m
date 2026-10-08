Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD91A3A48C2
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 16:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477896; cv=fail; b=Xnmsh0C6GjidMc4bWE26pWBcBXxS8rSnyRE2pUteRyIAQKqt+wwoBeP3OE2u6UCviXHxBvtF6aLFpdSWrgy7PHaHmKTYIHSkV8A/YndCLJDEdGQg8EBOmod3pGDSn0JsFHN9+J7oEMfaye+wcpQOVLAbbsNfaKPcOlr3rTQb/E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477896; c=relaxed/simple;
	bh=BEnp/AHlV3y6NKssDONkfQ2urzvP4jD/oTQvv5r7rPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o2pVrR+bLVdRLvGMbARyXBu+LOXKjmg9dRNOyK3gmoqspWvgIho4NGbpaK53s8EglO2rbng5WdueY/3EjpDA3DInBsCUEObh6TLD7PLAT8NRRBVLk1zWbjepAlv4l1qbq4GjMgI1zaIsJ6QFBslhh7l7xewPIyx2p46Wu1hy+68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeCPkfbo; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeCPkfbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791477895; x=1823013895;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BEnp/AHlV3y6NKssDONkfQ2urzvP4jD/oTQvv5r7rPM=;
  b=SeCPkfboq0kIxEmrwXmah2CnP0fkb95RUCxSY3bCjP/vqPq5L+Oz1Wtz
   6eLhNy+crNSbVNuZhQRViMHeLrlsr49mhgDUmKyYMdLPvzJ2SqBrdrjN1
   LxLTXvXahy3u6UR+VvvOAX6YE0MrtNuZkL88QBW3jF2VmT3HJzJki4vlj
   gPXGTwReYglFTKgT1y0fUCTthVsBVZtEdgX5spypHU2obJYGhvuhNtdvH
   6m82vju3KqBQ+Y6HrzUxZtddeRl2Fg4bfkj6DVwBq2n2+8mZa7LsWgRZj
   6rBBTHLV28YemKvzZfpgoBRVzROvUPnXqRqvuU0bK6Yy0EBDGZxzAoPDN
   g==;
X-CSE-ConnectionGUID: QXXSfOfhSASliGZFDg5OcQ==
X-CSE-MsgGUID: S/YX0S18SpWqPwy5lZts/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="271142"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="271142"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:44:54 -0700
X-CSE-ConnectionGUID: KGMM9WrVQQ6k8oP9t5RbZA==
X-CSE-MsgGUID: EvVutVFpTBW+bRx9v0rlBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="455708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:44:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:44:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 09:44:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:44:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnRzFarsNkevGuzArDapFkCK3fr47cXYQBfNNG3fKWAGuS9qrWHR64n14fL3jPZQgeTJsBAaRsXpY7Voq9GtjGaKvNcgrePFGdd1GeMb6n/huNB8cy6l2hqLfZY4VQa35wwvAv84L6ZSlQnhnfviv50jCRKytGMPH0J8yGxu2wiUF+RHhAyF9NBtlkJ74zwpKFoEZlZoree+NouXfdaden6oJo0+1TnPG92HhQ2NEs+jm+mJ5rT0qfH1bEIg1esNmkIfpPOTKQMWay6cHet5aGSNSl2De9vV7r5vb1UqzdVFuEWepyZJ9XoMdZclOBOImIzxP1SDnsavMbHz22Mhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEnp/AHlV3y6NKssDONkfQ2urzvP4jD/oTQvv5r7rPM=;
 b=rThrO/PGQ1Dn8KwcVuHiDTia2c4HB5SXZzNJ0P3vgHyn0+8TLPq+JBHS9YHKe+C+nYU1IBAhRy4bOFaF5hb/5EEfLcViCjP9NywhOzI9OlJpWzzZ6OfkKxS4Jl9QgYRSEpuFCM0LWpt2Xj19L/nrgxzK+zodu5lYAMVB2Qcv1asBvSVfqMXvNq1sMbgpsDRTrEi7iu8vTunZbbqruAJzNs5Ff36+CbnzTpiP5OJf/PWiozUgIl6MW+5FW8uZLizhcMGeWXdzqa9hlET/s4nbJlRP/mMcgslk1sR/qp8T2KbMBSzVuKs4KHebc2dGYYMudfxJg10mpBTOyvCf1Fv1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LV2PR11MB556157.namprd11.prod.outlook.com (2603:10b6:408:410::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 16:44:29 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 16:44:29 +0000
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
Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rJ7FgWIHNhvU2XNEh+FPULkLbeZNqAgBTVJACAALbdAA==
Date: Thu, 8 Oct 2026 16:44:29 +0000
Message-ID: <c619e00da1f5c6d21f1b9a1129082b6938cd6575.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
	 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
	 <IA3PR11MB9136B922CD5755958ED5D30892932@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136B922CD5755958ED5D30892932@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LV2PR11MB556157:EE_
x-ms-office365-filtering-correlation-id: eb6944ca-ca31-4683-36c8-08df255b6c02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: YqZaoLMK7ijy8j1YcgGgeSpbgxb4Mr1LTYGmO1zQLZUPuHLLY0ZyBC4PSD5ZJQCjxOPS0/IEaHdpXWuQHEL840cma51vEFuaZxm6Mln78j/atEcHPDwZ247cdw6bUTRqRiHiPtCm189YQG9dHL1CR4vNyxXAKY3w/QCm8KBVeJOW4ua1rAiUAIZXeRWGHqG4T/9Y9bXtRgE9SWaMz+2rMTWhbxFEO/okQwHkdLWCBEkRlMiaGIkheM92+S+79wvWc7Qa3sdOXsmEjcHC/P67z46x/MbQFrI+cMdWwoG2vxhhJ4yjYNiUruMwobIh/eGqw0t/3VPGrUYzPsJTiZtJMUF3csYucXhE5lzyMSmjs5Wqk/EzxAmTr/HAUylN5j9eOOrtlFXmwK2KqV7sgghsQh2abZunxV3A5Qb3yxv0SUeBSd+EOkoh8sTrIezYVsZglO6+vImWTCUe69c3g9MH0UnoJm8sciLNdarQioyowZ3u6PRFsroaS28N3wLAQ8iLJ+sDsQtoSSDa9j26w7hXZPTFuBfJSXigeZfXHr5hlPGUWxHTn0HZV05w5O4Q5Lxom0K540+5a1YH7OW5lAUBEX6XeKmzrFWLb56m2i6tsQtxU+JORYDLToRf4xc0ncurnbycFya+JbwIiNrRhlRRVC9fW1IAtW4wG54WUPpmcdxxrp5dVPMW3T5NtE62Vosm/kXukfVN12VPGUFxRNQsRo7XXwK06nsII4GWPFW737E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TllNY2RwWFNGNmF1M29TVGZOdzhFdkZscW1HWjg1QWdnYUpQaTZodEpGQW5v?=
 =?utf-8?B?b0hUYjJJbjZBaXUzeElNMmRybnl1c0tpSUJRQjlHTFJnMXBieWwzTm1hOGdy?=
 =?utf-8?B?am9ZZm9BdTNyNmE4V0xkbjlPVHZYd1k5aDh4UGZjeW1xcGVKVW0xUXN0Ujgy?=
 =?utf-8?B?ay8xZDA3d0RkUU9QUGJob2kzZWRZV1J2ZVVsSkxlRXFTVWRoRDV5anlROGZm?=
 =?utf-8?B?dnR6Rmx4cEw0cFZ5d0R5cENJVzJnejVtOUJ6YWxBOWc2aW1LazRWOUhUQWFx?=
 =?utf-8?B?Z1ZOeW5vK1BxZGxmelRlWWJ0SzhrNDZ3bFIrS1Fxc0JybnVXSVJxUkxFN1k4?=
 =?utf-8?B?a2pYaVVvOGZPQ2dabjhMa2dISmd0MmJPL0NFVWR0MUZDOFpCSC9JN05mWEpw?=
 =?utf-8?B?eG4wL1NoWmlXMXN4K1NMMWxjRkx2dUhsckFWSXg4Y2p2N29zakpUTTZ4dnFh?=
 =?utf-8?B?WjQ0Y3lhaDBsSXJqb3R4STA1QTZTT2ZURzMrTTZkekxPK1MvbGNMRkhSY2VB?=
 =?utf-8?B?WkcvaHFjbzBQUTJMUVRvamJqYXBkR1VmUGNwemlpdlpWb0I5eVlLeHlYbkFm?=
 =?utf-8?B?ZXhvTS90dnpaSDk0NFpYMFM4OVZSUm9ORWtMRTZMQUJVcU1TSzVLc2NsZGlj?=
 =?utf-8?B?T2ZNMzdvL3ErUnZ0SEpMUUdvVDRWcFVXaUJET2FhTHp0WWxvLzBDSGFLL1VE?=
 =?utf-8?B?VGZIQWZuNUlmOGIzTlYyWWRlbnhCZjhoejZCdU5DeXFLMTFwWXFIWXphV3Z2?=
 =?utf-8?B?VkNHUkFNVFAxZlVnenREWFhYdkVHanM2RVF0V3B2c1RtL0pUUzFheHhEa1Zv?=
 =?utf-8?B?YzVpTjFXTTcvS2pXTHBMdWw4NlVleDhTaU1raHdoRENpVENReFh2dWx2L3Q0?=
 =?utf-8?B?WWUvMjdvUlk4bWVzSGp4c2c2NjRIMVBXNi81WFdnSkpJYnVLVWFZOEtIaHdD?=
 =?utf-8?B?ZDcyYTFQQUlMajF3enBDWm53QnFPNWhxdGxGYnRrUk90blVhT1NoYWlpUXJ3?=
 =?utf-8?B?aTV4QkhsaFRjVzJkMEVvZmc1M3BlSGhsYUNwUkNveEhVMlVNQ25LN1V0MjZt?=
 =?utf-8?B?RlpiQlpTWm56dnZGREVKQXRTd1BWZ251MDNKMGozTkpJTmtQaGZmd0lyQW9t?=
 =?utf-8?B?UjB3c25FSlp5N1ZsRFduZkJaZVVwakpvZS9xbVVDQWJIRjc3Q0RHR3FwRTdP?=
 =?utf-8?B?Z0dNUDVkcEljbFVZTFFqMk9EQms5dEZ6MHFxS2xMVko2alpRWnFibHdEejA4?=
 =?utf-8?B?T25RbnhFRlFsczl3c3dDWUVoazcxTDB2b3Z0dkdCVXlmY29xRVl5NVVGK2tn?=
 =?utf-8?B?L2lMenVmcVJ0b2JVNXhtd0xVMGdwR1g3NEVXSFN2c2puYkdjL3M4WTYzM2Zk?=
 =?utf-8?B?NHVkajZhNTVPK3NEY2RGRHc1VUtSUndxTXhBazUrWDFWdTQ0aDRSc0JHN3NR?=
 =?utf-8?B?UGVyR1ZPYVpXdXNSRzhqanhUTmtwZUVQd3pqWUgxU2JzejJLdVQyZmxVQXRo?=
 =?utf-8?B?R296NEI3YXEzMEdGUlVkckJKTlZVdEd1WDVTSTRhMXJBYmljTHo3eVRSazdM?=
 =?utf-8?B?b1dQYmZPZ1JzZzZrMWhBNjgzemh3UDVtWXVIbnJaOGRweXdOOTNNQ3J3aW5i?=
 =?utf-8?B?b2pXNWRyeDIxdVFQSXo5c3MwNTkxNmhZMnNCcHhjWThZSnRXblFHRXhWa3pD?=
 =?utf-8?B?cjcxOUs0UVRaYWJ3d21qWi9PQVhxL2VwYlBXU0pEd0cxVkZWYjJFVGwvcWlW?=
 =?utf-8?B?SVdidGF1bnpSVys1OEQzRTdpa0E2TDBiaXMyT2QvM1pYNmtwclk2Um9jN1dq?=
 =?utf-8?B?Zm1TdUlFdUIwSEFJdGdLUlF4eS9nNFZGYTEwall3Und6WHJ5V1A5YTJVQjF5?=
 =?utf-8?B?Y0RuWUJkcVhPM3B5ZG9HdlRMZHRJZXVLUHo1Z3VBM0tWV01QTStCZVEybW1h?=
 =?utf-8?B?UGtnT0tjb0g5eU5YOU9EaHFHZVZ3QzNoaHJ4ODNOMHJZWExtRXVYTVFuMDFw?=
 =?utf-8?B?TklCL0FEWmFqdUFYR05pWHQxNlBKdVdISFNISlpwemE5WFIrQ3owdG15OVlv?=
 =?utf-8?B?OFdTRmN4aERtUy9xRlFOMnNvTEhFdFVtc3U2VjdwQVA0aUlPZHJtRFJzeWtq?=
 =?utf-8?B?TS9PQkVRUXZCZTBjU2hHVWNvYlN1aFZiaHc3VldzZ2Z4R2hhMjdvVlZaRDFO?=
 =?utf-8?B?VW0rNTB0TkpaQVY0N1VyeFN0dTB0U2o3TUk4MkpCaWNSTjcvV1NmajdpeW9O?=
 =?utf-8?B?RGpWTXBWWTVmay9OLzF1cEpXKzNCTTN3SXROOENsSWs1N2xNbEoyMGl3Y2F2?=
 =?utf-8?B?LzBnVEZBeW5hb2ZycU1KWWVKR3lvMWhRMGNZU2dLUEJjL2YyMW0wWlk3Qkl5?=
 =?utf-8?Q?+ROMrU79DEdovRX8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D024B880988ADE4D8560428A2ADCA54B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hK7fWbuPuikCBIwoLjyYOYNHO6434OYZLE3PpOkHiGFhVnPxMN7xbCYdLhXL/TKu6zy87+i/fI3roSupxrZMLzmq676avzgVZBclDEXz2x04bVzhMWpL5n4vlKISQmySf2WjXt+Vt2LZEpWqStKlesvOi+4PlvF+pEbB+G1H347ZM9dYosgUS4trm07d0ad/BiQPmR7hrHZFTvGbi/1O9VgzqGhomy02oXh5p8rzrFHBUWE9if0hdnnHOfLCce1KQ9gGU1jSJJaMPEqtm0oxvEg17gpbC4iXqc2j/1MIxPY+HFF4kjWMcYJBQThCLe2LrnyABZ49fzkvpAYusHxrWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6944ca-ca31-4683-36c8-08df255b6c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 16:44:29.3955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQtU5P+Bk5A/Kg9gSmWGnIgNRqNyM1s8b/Q++q8yBBA1cjiAZrZ0E0VunFUTvUNIhE5IRmYkMSn3jvadSV4AMFsBXuey2cBR/5K8AyzTX/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB556157
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDA1OjQ5ICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+ID4gaW50IHRkeF9tY2FsbF9tbWlvX2FjY2VwdChzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1
Y3QgcGNpX3RzbV9tbWlvX2VudHJ5DQo+ID4gKmVudHJ5KQ0KPiA+IA0KPiA+IFdoYXQgZG8geW91
IHRoaW5rPw0KPiANCj4gWWVzLCBpdCdzIGNsZWFuZXIuIEJ1dCBob3cgYWJvdXQgYmVsb3cgdG8g
dXNlIGZ1bmNfaWQgYXMgZmlyc3QgcGFyYW1ldGVyIHRvDQo+IGFsaWduIHdpdGggb3RoZXIgVERJ
IHNwZWNpZmljIG1jYWxscy4NCj4gDQo+IGludCB0ZHhfbWNhbGxfbW1pb19hY2NlcHQodTY0IGZ1
bmNfaWQsIHN0cnVjdCBwY2lfdHNtX21taW9fZW50cnkgKmVudHJ5KQ0KPiANCj4gT3IgbWF5YmUg
cGFzc2luZyAic3RydWN0IHBjaV9kZXYgKmRldiIgZm9yIGFsbCBUREkgc3BlY2lmaWMgbWNhbGxz
Pw0KDQpJIGhhdmVuJ3QgcHJvY2Vzc2VkIGFsbCB0aGUgY2FsbHMgeWV0LiBDYW4geW91IGNvbnNp
ZGVyIHBhc3NpbmcgaXQgZm9yIGFsbA0KY2FsbHM/IElmIHRoYXQgd29ya3MsIGl0IHNlZW1zIHJl
YXNvbmFibGUuIFNpbWlsYXIgdG8gd2hhdCB3ZSBkbyBmb3IgdGhlIGhvc3QNCmNhbGxzLg0K
