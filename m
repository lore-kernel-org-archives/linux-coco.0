Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AA1E47C5
	for <linux-coco@lists.linux.dev>; Wed,  7 Jan 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767751107; cv=fail; b=SLPYUIJ/KZz/bV4DngWVWCpFpKeQC8rSQq+7wkzduLaDPcmVkFBPwyf4+ZdhuH6gGAE8TOy2qKbx1JDwqXoZrTh++qxI/NsO21pEuLFRWy6wAjVAq3Lq+My9/PONBae/nwCVd6AVmSxc68TuTfV0cloLOOWVoBOTSEvAxM0hzW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767751107; c=relaxed/simple;
	bh=61Bu2VuUhN7N1Nos8lx3CBsXq/fbts8381BQnW6i4WU=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=T8aI69b12btwEWt/coMUlHiek4/bqsDA/8fM4aFLxCeCa4GFntpB0rxPchbW7DxN5QMU3kl8R9FEkFgfL6nTFkI8QwY8CJZFgIP5OkNVUtKj8gWSjZLZx5kuQ97YTEo01v/iYy/aZDQ2+noZTjsO3F5bWMMx5DmTWkTu8i0/jSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UO7ik2ny; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UO7ik2ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767751105; x=1799287105;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=61Bu2VuUhN7N1Nos8lx3CBsXq/fbts8381BQnW6i4WU=;
  b=UO7ik2nyfKXEhYPyFPl9gwu8Czzis36xqwmrMVvtNqJDGyjpgLDaPuIH
   LwlXxAj8Q9aJmUUPyO/rfih1RG4wU4amaWDQUC1lUV2bjo1jPiRwIWoqd
   tP0/wEv/BoJm8yNvBBbnf+QM5HFu0Xo+ZWdGaNVYJP58dgh/q0ebj5tEq
   TTpDJEo9Ph1OlFw3zMAmTSUeGLOCwfWTsOQ4UpeDE7vzjWzdBXSNPKkgI
   sy5iQ0CdCgfAb4uDTjWqakDlcIngZJZCHyJGmvNgnkhhCHfmYMtp6dFoZ
   3Bl603Q6k3rbdA9muR0xugK++12ipfI0WFC55AD0YlHLb1kuQyRtp9Hc7
   g==;
X-CSE-ConnectionGUID: W4qcAO1QQeCxDrSiAQwByQ==
X-CSE-MsgGUID: NBoDErBsRG6s65++5QkkaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72967575"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="72967575"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 17:58:25 -0800
X-CSE-ConnectionGUID: ndW5uPRfRlet40w/y8mf+g==
X-CSE-MsgGUID: n2MiD2UpTdeSlaoJsKEtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="202810146"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 17:58:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 17:58:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 17:58:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 17:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/EWHOjJLJrZGZc+4oI/edS6E4AEz4pMguga7KjcB7/oEIUcCjOz3iyzZ0wV2GX/opOTvEc/6OI+GlAFpaoWSQeyz5Rj8IN/KPAJ36fVmHAs5y3XksSk83mVvy8OU3hO/ejPj7KZNrGeHBLg06hh58HaTRvffiW71iAshvGe+BeyBaoUU5En6FMkzPNLn0I1unf9qOP/b56JNnQQDE4/rg/wlognc3NbBc452lYjfLmGn+gN/B+jRD5caNOEF8118Ry2OnWmD3WZ8r1gSb0z7GOgwocvclWRUb28eIXoIJ0XelqWyBd4EcJS2U0GfIdkGyzoCeNnrQhqIF/b1ucJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aoiVUpGHv8Kim0QCuLWcMeeUBWhFIis6KWFnxUNLo0=;
 b=NrCeJ24+hSPg6lxB/BMzBwVcu34a6mnIDIbss1LdNZHqiLo9v0WHHHldJa723HELM56iIlFmLRk441r7kO6t0Y38epPuppphVrCBfjRSPjCC/hC28Zq4gDBTbgjccgbVxNYsvPxNMfPj8VJVnO6yvweG0vPPR12zBPJ5hZHE46xN/do8VU9JupjqIhro3ISvlj+nrg0owrlnAfrioUmHLVjjgS2Kz35Rv0oF92Kh3hPQVCTkbgjsTfClV9Fg/pDMsgma7u89k+CuRfPHjTknNeZgrZS49WnHROQ+IQQDGDzCXtOnuePUxI/JnIrCY0k1WdPpjfU6vSl9Q8BYBNlkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 01:58:21 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 01:58:21 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 6 Jan 2026 17:58:19 -0800
To: Jon Lange <jlange@microsoft.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Dave Hansen <dave.hansen@intel.com>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, Sean Christopherson
	<seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, John Starks
	<John.Starks@microsoft.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Message-ID: <695dbdbb37d41_4b7a1003@dwillia2-mobl4.notmuch>
In-Reply-To: <CH8PR21MB5222D4771880715FC8104835CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>
 <CH8PR21MB5222D4771880715FC8104835CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
Subject: RE: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 18eaebb7-3b2b-4332-6f88-08de4d903be6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlBUUUtCeENvZnc0a2lXRVdCN3ZIZDdxRkY2V3VVcGVYMzQ0NDI4Wkh0d0dp?=
 =?utf-8?B?OUJCVU9IaENscm5lMGlMc3JzREp1bWQ4alVSVWZabVN6REMwRGNRU1I0ei9z?=
 =?utf-8?B?dWhOZGtUa2t3ckpHQldJb2FxTy9wWUVoQUZDL1ZtcnlLSHBZU0JSS3h1c0N1?=
 =?utf-8?B?UjZGU0pRNktJandxVzN6TmFHOVdKak9xMHlJM3hvL2lQSnBOMHE1Nm1OeFR6?=
 =?utf-8?B?QVlOTERsUXd6am9CUUp3d2NyOXhYZTUrWGt4WkQwc2dnZUlMV081MmFhdVZt?=
 =?utf-8?B?NE11MW9QQUJPZUtoM3g0RkhBQ1VPcCtUaGNEd000L3R3bUh0M080bzQ0Nk03?=
 =?utf-8?B?M0pjbk9yUkhKOHBRNWpEZnhyeTdSM1dlekd3THVGL0wvUkZLb3N2OTZkSzhO?=
 =?utf-8?B?NDl1S0QrNVp2Sm9zaCtxWkgwclJ6USswdVhCcWhXUWxXL2ZlNW5FMFcwZS81?=
 =?utf-8?B?SXhQNDZ0MkU2c0J3OVYwdHNEZmxmREUxWkQ4TUVwVkI3R2tsS0h1SE05L0RS?=
 =?utf-8?B?Z2RSUnF0d2ZFN1B4WXdPSmxzRytMc0JOdHl0ZVg2WW1ONGdlODBGZlVqL3pu?=
 =?utf-8?B?MUpYRyswWmIzRE9wd0hwL25rRnpoVVlLZ2ZvTnA3ZWF4R2x0eGFEN3dPMUNh?=
 =?utf-8?B?bGRWK05kbUVsaW4xR010N0p0NTVQTG5idEhXVUZhODc2OEpteUJLdzNOdXpy?=
 =?utf-8?B?QVgwSEdsYU1xclBYY2MyN3VRbFEzZ3hhMEMwQWNWMFk5M09lQWl4aEhDdUcv?=
 =?utf-8?B?b3pMZVNCeWFKcG5nSWZJTS93S1ZkWFRWQ3BjbHpQN09oWWtldDBiSlFBdTlI?=
 =?utf-8?B?Y1dBd1V5VVVKSGlHVmo0QTh2QjBRVlBGc0YydFhOMFU0cFlyRDBsLzZzczhP?=
 =?utf-8?B?VVhsemgxRlloQVZvVXZ4YllvWXhqa3Z0QlhGdkU3RXFXNWtWc0xJQXBMd1lj?=
 =?utf-8?B?b1dtM3NRb2JoWUZNUVFVR1cvZCtVQ1VCQnhkYzFTbENIOVhlM095OFhVdlFF?=
 =?utf-8?B?S1RoaEJaZTlja3UxUGNKcUJNUDlyVFNiaVUyL3ZiNW1ETG5BajZadW9PUndt?=
 =?utf-8?B?SHJCdUprS0RlelF3ZjA4K2pnU0tnOVVOSDZDVk54bXdLbUJxS2dja0pmd2w3?=
 =?utf-8?B?N3M3TnpwZ0hsK2NYWmQxN3BuR2lLa0Vmbm1RbDN0VlpOakFWSXZZVmowWkNk?=
 =?utf-8?B?ZGVSMk5JOFVLZWt5ZE9QNkYrSzRvY2tiUGVCTW1GTDV1SUZ1RDlZS1RNbEFa?=
 =?utf-8?B?cnJ0QmFUbHd1WUFzL2lTbnFsaFZFUVhJY1cveU5DNHorTmRuR1phQUNkZzdv?=
 =?utf-8?B?QXdvQXVsMDVBeDNNbitwN0pNdk96dUZ4am5WS05pRTFIMDErRGZDaTJyUnpM?=
 =?utf-8?B?QkozbUlRZStZZ24rTHZQUmNQLzE1Y0NiMVhhNEtuTFpmYThLaHhxY29hUDJL?=
 =?utf-8?B?ODNoYUtzVnBBQU01RHd1am9FK01qUlhNeTRTVytGQlFhUnNPVWRNZ24vdGFT?=
 =?utf-8?B?OWZ3L0RzaHAvNTZHTzJ5TXVQWTVJM3lya1JFQVhhT1Jka1pBZWxrcmViUnZh?=
 =?utf-8?B?WW9yTGpyNVJtSUJuS3k2Y2JnZWZ2SUZqUTZrWG8wR1JERHJWSWlBUHlYU2dQ?=
 =?utf-8?B?K0lvR0ZMUWhPd2szRGUzQXdsRi9xZDVWaERBS3VTZmEvUEVKaHg3aDJIVXZW?=
 =?utf-8?B?ZTd3eEZneWZuMUNiU3JvMVM5LzFDbmxSQ014QTVHM0tyT2hsNWJNTFd3TUNG?=
 =?utf-8?B?amZtQW9tSjQzZC82U1ZrUjJZelJhN052UC9mOVNQSTRFUDkvU1hoTU9BYWJw?=
 =?utf-8?B?QWh1UExwL3p1MTJ2eGI2S3U3aExDcXd6T3NKR25VVUR6TFM4cW4rU3BLTVJW?=
 =?utf-8?B?UTVzR1hrM2d3Wk1KZFpiSVZzS0xsZGk3VjFCV3YzMzBiSDJXYnl2Y0pUT0tJ?=
 =?utf-8?Q?NE3m5QYObjbSjDLr2zxT2Z2YHNVnqatg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2gzVkQ2eTJSRDNXTzBoZ0gzMDNvbDFsdWZ1Nyt1ZHM1WCtJc2FwV2tXL1Ru?=
 =?utf-8?B?RytUajdUNi9IUDRiRzVpOFMrM3BTRGtuT0QreHlEUWpsZ3ZCcUhqRTNrcDRJ?=
 =?utf-8?B?cFUzbUY4NE9XUGpzV3RIZjRCU2VURmRvd25jaFhJN0ZTaisxekJEdzA5Zmt2?=
 =?utf-8?B?cmUxaWpzczZJMmo4bzEwSVNpckNSMEtpejk3dmZyWStGRGd3MHF6NFNVdlJt?=
 =?utf-8?B?c2kvSnl1STBYMEVXR1k2SEJ2L21JNlc2eXdNdnpVdUwwbzQ0Sk9uT29UYUcv?=
 =?utf-8?B?MjkxdVYzcTUxQUNSeW9Oek1TeXhDclBDaThIZmJLQnhCVkVOSHFxR1R1N0Fu?=
 =?utf-8?B?S211MVBPTXN5RWl4SlBGZm9mQ3htVmcwQXNqY0VhQXBLeXh2QXlsMWE5RHdt?=
 =?utf-8?B?eWoxUGJvSldleDV4S3FKZm5wWUV2Z2NPc1BWNUNGYzNNK3F4a2xMWkx2TGc5?=
 =?utf-8?B?ZjhIZVY5TERBU2UzZGdJYmFyd3RtS1IzVlZyUFhkSTdjQUZuN1UxTHpXdm01?=
 =?utf-8?B?S2xia3ZvY1lqVE9PRDVTeTl0L0RuaFIySWtoUS95ZVdWRCtNSVBueDlDMHJ5?=
 =?utf-8?B?aVhEOU85Y1NPNzM4RWJXVnRQZGIxOXZOdGtjaE1JaWxWeER2UzhXTW9RUU5p?=
 =?utf-8?B?OFo0aTdYUWh6Z1dsTWZNSTZlckVVclBJRjFJeXFzdlYyeVNTeUhLSForc1RZ?=
 =?utf-8?B?YU54L2k3Y09hZ3BzR3VVbTZCN0t4UzJtaktqSU1vbEhTeXhCUU90Q3pVNGZ4?=
 =?utf-8?B?S0JMaE1xbzRTemFEOUZ0RFY0TWN5Q2pweEtxcDk2VDErNkxXWGxHVGtWRVly?=
 =?utf-8?B?NzNXWHhVcjdzZzZNK1V3dHFvZ2Z6QkxPYkdheXpjNlUrQ0F0dTAwUVVjd0tC?=
 =?utf-8?B?L1JteGhsclZjNHdscGdOeklhR0hMOUFMMXhFRkVYUkhDaDQyZ2IyQkthTExa?=
 =?utf-8?B?cGkwdFAyVFlsM1RLdzJFRTFSZm9CWnFob3BTYUtKdElEMFdGWFYvZExIanUz?=
 =?utf-8?B?S0FsS09HWFY1RjNEQ3hERDFPdEUyTlIxeitCUHBjVzVPT2IyRW5na2s0WmFC?=
 =?utf-8?B?NHdsY3Jrd2JFWlBIcUxPUWxMbUdiSE11bW12ZVJnRk9jZ1NSdHk1V3B6a2dX?=
 =?utf-8?B?SEt1cDJGQjB1VEk3SWU1clg2K0J6K2VHWCtndi82cmQ2T3FmUkE4akZjVDJr?=
 =?utf-8?B?dHVnRzczWXB6RTJ5OC92SnRpUzJBRnM0UFpjeThuc09GSkFnY3Nhc0lJUDdn?=
 =?utf-8?B?RTdmaGJkRzJsMDJ3R0VCZDlDY3cwNUxzMytuVHpEdVFjMUxpTHViMDRpQnVa?=
 =?utf-8?B?b1h4YnBBQ05yYXdVdzgvZzVHcTFLaTVJRCtrZ0liLzZkTlp0NnNZNGlaczhi?=
 =?utf-8?B?bmlRSXhhbFZHUWRSYVZDakhCVS8zQ2N6OXJNanN6UkdmNElybjk2RmlOc2pG?=
 =?utf-8?B?SXdXQ3lYSnk4UWw2SFQwRjlwMktYbWJrbWJnSlN0NE40N2kzYkJISFFhNmNP?=
 =?utf-8?B?NFZ0UW1abW1uak5VaTFEVW5ucXRFVmE3Yy9YUDVnYkhaalZTNTZ6Y0M2QStJ?=
 =?utf-8?B?M2w0M1pIUGV4RHdWcFNnaEZNcXVhV0tYQmlUcUtkSDlRRk1peS9PVU1ydmQ2?=
 =?utf-8?B?bmJ4ODEwYXJnMnhwSUxNc01JeVBjK2tPZXd4SURSNnVIMkV2d0JHK2trZUhN?=
 =?utf-8?B?cXZTR2pSZk1BaUtkMnQ3bVZjMEp0YlAyZStQTGtXczZsRHlnTGZ3ZVhJQXla?=
 =?utf-8?B?akdUY0tLcEd1ZEpXK2w5Y1M3Y3c5eDVleGptK204b1lLK20rcGFZd0dKYmlU?=
 =?utf-8?B?bkZPTy9odGUveS96Q1FZNlBZMzIyZ2ZUL2JMYm9TL3R2NFE2QTQ5MHNOL1FH?=
 =?utf-8?B?OHZvUnFmL2JBdUJqNDUzV0VVRzlTK2tLdURHQ2p3U2lFKzkyYTFYMDdpSEhG?=
 =?utf-8?B?RWd3bW9yQzN0UmFNY2tBaGRIblNMSEJ4NGxjYnFMMHYyWTlpczVpQ2I4QlRR?=
 =?utf-8?B?QS80SUtxdE9GMGllS29mbmd3WDRKRklma1hXcHZRTEoxSzhpWm5kS1ozWHF5?=
 =?utf-8?B?d2J4RzM5NlFCbFFWbmpwMTVHRXIwMzB5TnplN1BhMFFFdWY2cmxFNXFDc3Ix?=
 =?utf-8?B?NGxlRlF5R1Q2QWNlM2NRcVp6WTRpbU1PSkMxdG5hdy8xZ3k1OEZGZHdaRnc0?=
 =?utf-8?B?ZTEyYlpoSjBNZ1VhODMxelVjZHQ1YVZKb1E5K2swVFgwbHFFVHQ1U09zS2Iz?=
 =?utf-8?B?K2hUMmtYRWtQN0wzMSszbExxbnVoOUU5OEVrWDFtVTY5aTVCcVc3SG5JVUd1?=
 =?utf-8?B?czNKNC8rdGlVZzA1bWpxOG5yVW1VeVNWUTJPaXFaOGU5Vkw2akVCN0YzYzgy?=
 =?utf-8?Q?Yq/FRTxpkWb/xY2Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eaebb7-3b2b-4332-6f88-08de4d903be6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:58:21.0157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01Q+ZKw9O7WwaJe4KjpedOMQ6rlnJ9/i5Hxu1o2IlkXHwHTJZ2Z0gAS6LmU/yvrvmWmMf2DQfgN0qUTA2jwvSi0G7Nq/9P/mV+eKGaZegxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
X-OriginatorOrg: intel.com

Jon Lange wrote:
[..]
> > Do you foresee a need to pass anything other than "here's a handful of
> > services that are available to you"?
> 
> Assuming we move past the question of "are we in paravisor mode",
> something that is less clear to me is how components like the
> attestation driver know how to consume the confidential services that
> exist.  A fully enlightened OS that knows that it is in charge also
> knows that it has direct access to all of the platform services that
> support confidentiality (whether it's specific SNP ABI calls, or TDG.*
> TDCALL leaves, or GHCB/GHCI interaction, or whatever).  But when
> running behind a paravisor, some of that access might be restricted,
> and it might not be possible for the existing drivers to work without
> modification.  Since none of these paravisor support services have
> been built yet, it's hard for me to predict what kinds of differences
> need to exist in these drivers between paravisor mode and fully
> enlightened mode - it might turn out to be none at all.  I suspect
> that we're going to have to just try to build something and see where
> the problems lie in practice, and that will information how much
> additional information might need to flow (which might go beyond
> "these services are available" to "here's how you access them").  I
> don't think it's too productive to conjecture any specifics now until
> we have code to point to, but this is a potential problem worth
> acknowledging.

Where I get lost in this discussion is in the transition between wanting
to intercept operations like "private page acceptance" vs operations
like "guest OS is asking for an attestation report".

It sounds like the paravisor is going to hide confidential memory
management details like page-acceptance, but it is going to advertise
and intercept higher order operations like generate launch attestation
report and TDISP paths like lock device, get device report, accept/run
device.

So does this paravisor need low level intercepts via pv_ops and a
confidential memory-management model independent of TDX/SNP etc? Or,
does it only need the higher order common "services" like attestation
and TDISP.
