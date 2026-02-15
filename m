Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543513AF2
	for <linux-coco@lists.linux.dev>; Sun, 15 Feb 2026 02:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771121261; cv=fail; b=TkYY6oYbKgZi88mHIT5zaXrZi6/ZzwTwuoTTNCy3Yfji4XKRNDc9Xm3JECwlin9vvpL2Ua9i0PBqKMV29aepZbXXFLJ5jGdAQ+YeKwJDPgRaIEoBlyOmPocR/2qq2LY1S8k7mXWRZemda0wWjpAnqRzCGVqaRUc4U+3hrivdRbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771121261; c=relaxed/simple;
	bh=Hh4oGdCQ3pYLl1p/L/P6k/I9+264GA/rZwele36DaqM=;
	h=From:Date:To:CC:Message-ID:Subject:Content-Type:MIME-Version; b=rRJPA9QtumwSmSE4EnT2HUdiS1bqsxDNXoQWMwOmmENzXKd8G7lrVyxUUuEO/XPZqlqU8nYpcjjuQjDYiVJi5plqT5pcY+0b68gVp81VlcaJRPKY2uMChBeD1ukceMfodGqnxOc4baOL/ydnSvt+ogjp1GIymPnL4GZ5O7/l/gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9qQPGNf; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9qQPGNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771121260; x=1802657260;
  h=from:date:to:cc:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=Hh4oGdCQ3pYLl1p/L/P6k/I9+264GA/rZwele36DaqM=;
  b=P9qQPGNfepVXHFqIJJRRJuUTis3sbmdYR7R57Nvxhjw+ErFgooMukFh/
   3RffozScrkuqXD6gstVg7xFTZXdf6hXRrQkgY0nZb8Y6gldQN85EaYpNJ
   wx1gYCo0ORFQ6AEoc2NIqU4rYl3ucZ+5vk5R4amvim2JDiUwiTAbAOFOG
   M7LIgamNmc0NF3Lsa2jjMVxoAUcLfLL6m39dRIHGcK+PboyU4lrxaSMGh
   xM53GJWsTxpM6eMeLK8Icsg7ChGC8ooIPneLM3Tr8TLFsl/h8HjQ66m8q
   iTd8BOhk2nYZOw5qO9BOXZV7w37fqOL4sY5jZqty7U1Vjqv0m1j1psDHZ
   g==;
X-CSE-ConnectionGUID: iSBhBa0kRZyuSt4TAPa/QQ==
X-CSE-MsgGUID: IMjfIYtWTWeXYtTFv8ZEdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72299785"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72299785"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 18:07:40 -0800
X-CSE-ConnectionGUID: FmYJ7czuRdafOjriBQMazw==
X-CSE-MsgGUID: lSYCe3OkRsOqzKPvkA5ENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="250935623"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 18:07:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 14 Feb 2026 18:07:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 14 Feb 2026 18:07:39 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 14 Feb 2026 18:07:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3j/6lnnTr2HwkO9V3RcwiX8LYWc4/MAFsTujjdcHSY6vvNBIv9yTegdvXn2u79sSkKPyaIP2Ic96XdyrHwg6anZL0xE1qaXXo1ldxt7LUGNR88vPScV9+PsuGufhX0cgDPoRngMAxq11HOa5u0ZXJEA9BubnJBPs+N795vn4Z6qcT+pb/KecL/03vRI6uWGjpoA7iQ3Equ4DpZUfbP7wEmM6MPCr3DZzjFXBL3wDlwr31Zm4YivUA/X+GgoHSFOYhw74JZs1xwXb+pxx/GOZ2OscabrX3XUaejRmCLnh+oZMzpuCoVY0YhWJgt0pNe06r3nc25vOxSrpZhtORU63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aCpjLuXdxaicA+gMStUOb5tCDhIQH6j4cuzfyRFLIA=;
 b=dV/paiRnxCo4Ql9htyjiELPNJu5emc95/yEVYJBnHIWY9E+XqmvCIqZINWUVPEINy/c4GTEdcFCX5rvgh73P+xuXGd4B6uWBtfX+iuzh8SVjEN5Bp64B0HrqZQ5TGM3rboG3Z5uZOrLsPpW3W0uqMu9USoohI5KwfAhCqruLyjZsO+tj4TTp1FQSpmhy0IFhSqDXyL9HPQ28SDGhyqGilBeb7gfS+KrLcTAlNrxL9Q/oXuRnswSAvKIe+0j3nxpLHVzUb6Ma/8vpxaf8homtjOKfMiAemqV0Gq/pCmXGP7OKYbimJU7RNUi8FvVmiapPOhvi8BAbY1fZTBdMcn/1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB6663.namprd11.prod.outlook.com (2603:10b6:806:257::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sun, 15 Feb
 2026 02:07:35 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9611.008; Sun, 15 Feb 2026
 02:07:35 +0000
From: <dan.j.williams@intel.com>
Date: Sat, 14 Feb 2026 18:07:34 -0800
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <linux-coco@lists.linux.dev>
Message-ID: <69912a6621326_2f4a1006b@dwillia2-mobl4.notmuch>
Subject: [GIT PULL] Confidential Computing: Attestation Updates for 7.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cfdcb3-71dd-4f47-8909-08de6c36fcaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFBoK2hTd2VuR0dhSWEyU3BHYUg3VGppVEJYRW5iWHNRNjVCb25iYThQek9M?=
 =?utf-8?B?ZUFhcmtVSzRHbWRxYVNWTWc0V1pmVXB3VlA0K3dHWTM3aU9nMkxHWjJ5UjRi?=
 =?utf-8?B?VTJRcjIycTA3QXFydGZYV3FLaGVPcGp3RFpmZTY5UEdPZVY5UXlVQ2swdVNX?=
 =?utf-8?B?R0U4UzRCWTFEQ1pvVFBTMDZVT2tIMlpZY3k4WmV1SWhRSXVleHV2RHpjVU5r?=
 =?utf-8?B?VVRvU2NSc1pFTSs5UTBJMG9yTUxiUFdFWk5UYzY0aUtuYkJmd0E0OEhYWlp1?=
 =?utf-8?B?b3JQMXB0YTJtbjZlVlNWblM1STJ1dzUvNHNIVC92R0dNZWNSQUZYZ01OZnZO?=
 =?utf-8?B?VzRwR2RUYmVUZGp3TnIvQ2NCcldtYXJPbnM3cGpLNVVvVmp5U2JLSlpXT3E5?=
 =?utf-8?B?R282aUQ4ZUFaZW90WFdVYkYyL1E3TTRSZkg0LzFoRmNCL3QrSHpQeHlOK3pI?=
 =?utf-8?B?MkpTbnJ4QlFib2N3V3FEek1CemxqM0t3dnJhK0hoeVdzY1pPcHJOZG9kcUdI?=
 =?utf-8?B?YUxKV3lyanlTR3B1Ni9kVzlhU3YrenFUdXFHNjU4bVZnL1JKZ291amc2UDBx?=
 =?utf-8?B?RUJyRE9Pdyt0dkpzZ1g3dVRNWkYxQzhqYnl3REFlVndVSktGdmZzRXM5MmR2?=
 =?utf-8?B?eWp0V3puYjVLdUR5S2phVHY5OGxBZHZoWWRoT3JFUUt2Vyt4bHJ5Y1BybHpU?=
 =?utf-8?B?Z1BjTUkzZ2Z2N1hhVXlQVEVvUEpPQTNLQ282elp3Z2VlY2QxSjBxbWNrdW1k?=
 =?utf-8?B?UzVwL2RkU3ViV3VPTUJPR2dmUjlLWmpEU3I1UElyaUxDRmdFNDYzVUdMSVhj?=
 =?utf-8?B?d1M1R3NoTUhwaHg3NkFpVU5WY2RSZ0x5RGpIVC8vUm1YbFd4MHJvMUs2WTVN?=
 =?utf-8?B?a0JqeFBuaVMzcVdMV2VUS05ZUXFGVnVudnV2Q2FVampnTmQrRU1sUkZhNGU3?=
 =?utf-8?B?dVZWQWZ2V00wK3RabDl2bXBFYVY2YnpPaURxcFI4bW01OGZHZEF6a0lGSUlB?=
 =?utf-8?B?WXVyYlJOTFcrV2FhamYyb2NBeDExL0o0d2c1N3FIQVIzaVZZVCtJTU1xSHln?=
 =?utf-8?B?MDFkL25KWjJzTmxWNXpsVUxmUWFjdUtjR0dDNHFVR2JnSG9rVHQ0eFg1cWVr?=
 =?utf-8?B?Zk5qZnBncGU2WlFYcVBHTm03SE9FZVA0bkFzd0dRVk9YbUhDNytHU2hUc0F3?=
 =?utf-8?B?S0JEZ2c2RitwSU9rd0h6NmpJSVlpUlFmRmo5QWc1bW1tV0hBeEtHQ2dCMzFS?=
 =?utf-8?B?cHBQUVNhWWR3THNTNkc5a0JOYWZjWGU0bDRHVk9JSmJzUmhZUmU0MHRXbHdu?=
 =?utf-8?B?ZjJEK0tNU3c0OHJnaVBlSGliaGFPQk9KZGxDekhCRmVuckxVZTFUQTI3eVVF?=
 =?utf-8?B?UTh1MGpZNlBNOEdyNXhNNTlPYXc1QWlRNUFMZ1FzdTJzOUQzdTlkT0dSQ2N5?=
 =?utf-8?B?SE45WDFvQ0JsdzFhTWozWGxNWXUzVlhydEFobkttcGMvbnpvL3FMbU9QeXVo?=
 =?utf-8?B?UjhYUkYxbFdDTzFpUlQvdllpUmtOa2hTWXRyaE0wNmNhMWpBeFg4dHRGUWVX?=
 =?utf-8?B?QjNnVXNoOWVhc1ZjQXlxc3dXQW4wSU1WYTNYL0s4dlltd1RLME5sVDRIMEhS?=
 =?utf-8?B?TGwyZlUrRjlER05lL3dWdkE0K3cxOGl6NnNwZnluamlzTVNqZG1TMk5uUm1D?=
 =?utf-8?B?WWYvSmNteDd1eVdmMENNL2dmSUlNckxvVTB2bEdsb0NENS9IeWM3aHE5TXpZ?=
 =?utf-8?B?RncwbHFTRWdxUkVyUllGaHo3Ymg2S3dJZTR0RXZnazFkQzJ0ZnBxTnhlbjBI?=
 =?utf-8?B?bGtGUXNKcEV5Vmt2emN3SlhBdGd0dUJIM2toVFEwZEZQSUUwaWVHUUVTV0h2?=
 =?utf-8?B?R3NGT3ZiVURjNVZ4Sk9Yd0JtZFQwL2toVUZZZ253VSszMWNNQndwcUFkSCsz?=
 =?utf-8?B?SWlIa010WW1CM2xyWHN5THZrK2k3RDdXV1g3NnNPcG1wRU5PZ05pMko0RlVY?=
 =?utf-8?B?Z2g3ZngzeFhZU3REY1JZTyszS2U2dEJ2RUF0Q21TSndKV2xFWldtRGs3eW9h?=
 =?utf-8?B?cDFFb2w5T1FIRTdjU2YxckFob2ZOSG04c3hYUEs5VGdZU2ZnUXIrWHBTSG81?=
 =?utf-8?Q?UibY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUVFSHVGaW1CVUlrYkthQnNtS1BCdWdzSjJmMG5yNjhFLzYxYU9vMFgvdnF1?=
 =?utf-8?B?NEN1djd3RlI5VkJjNDRQMFlNZjlwMTlNQ1RjY2F5MUV2aGc0aDhLbHcwNHZP?=
 =?utf-8?B?THJPeVE3K1F4QVJLVENaMXRtY2lRcGN5OWlKbkFzSFdlNmVIcGt3Q2hmZU9F?=
 =?utf-8?B?b2NteVNjUnFPOHIzTVRaZHFvUUNRTWMycEh2UnF0WmZFM0RSbEdlZTNCdDNm?=
 =?utf-8?B?ZjZqQStjdDJnUWUrQ0FLNEptTGF1Yzc1d1NBOVhabzFNZVBCTUxaTVNZd1RS?=
 =?utf-8?B?MGpIRmMxdlRmUWlmanNpMmYyVUpJYm5UUWVlc2ZDWXFhV3NsaXlZdXFpNzJ2?=
 =?utf-8?B?K0M5U0pFMlRRT2tnWFV6TFgzRzRZRmZyOGEzOEl5ci90anJHSVhLTS9qdExY?=
 =?utf-8?B?aVl2dHBPUFFNdTlEaGVsUmQ0SDVvN3hxR3FPL0plUUk4ZEM1elJuUUdYVmEz?=
 =?utf-8?B?K2JoYXNISzZkNUFmNWwzcVV5MnJ1ZmxDVGdGN0dBTlc2SkN2MXdxV0M3THFS?=
 =?utf-8?B?Y01XMmd0Z00xbFdRYUx5UU0yM1BTRjlHdGYxaGVEVUhtcUxuMVZLd2lZR3Na?=
 =?utf-8?B?aWJTZGRZZkJoQk5HU2ZyOTVkOS81ZWVUYms4OXZBVVZLVDhsenJXQzBETGZx?=
 =?utf-8?B?L3VFYkUxcDRqbGZGV3ZCajN4cytJYUxNcXljaWd6L0FwZnZMY0dicVY5Sksx?=
 =?utf-8?B?YVI0UndwV1FNcUtIdGFQaTFRZ09nVDdWTStyK2MxNmNUeVVTTVdKb0s2aXpQ?=
 =?utf-8?B?WTNGY2REcjFMSlNaZEtBSDh2cXk3aTh2VytJZElMajUyVEtuSGkvNDJOTmI5?=
 =?utf-8?B?S3g2N2NJN2NqQUtIcjlHUklMSGZGaW0wNTE4cGtxeGNsY0ZxNWVpOXd4UUcy?=
 =?utf-8?B?N3gvTGg0Rlh2eVNtY2FpWnlwdFFpTTZSYTdyYWt2UEZWa2VpMkV0UlZDY21u?=
 =?utf-8?B?TUFQSUNTYjlsMDl2VlpYdy9sc2V1clJSTzBlTHBsTFR0SE84dUVsL01ldUV4?=
 =?utf-8?B?c0NFU1dQQitCRysyclg5UkZMOEJMdC9BU1JJL2wzQWpVQ0ZKdlNudWovbzVK?=
 =?utf-8?B?MzkySkNBYk5ySVczSnV5MzY0Z0sxa2VHMkd3d2tmZkU4Rk10cTJ3a2FvWDhH?=
 =?utf-8?B?aThnWUZqZm5URVloWVE3Um5sVXJLeDBTV1duSW1xUm9ocGdhZjRjUDhnWWZs?=
 =?utf-8?B?SkZ3Tk9SNVJoTzZzdnpicjJSTTFSaUNwSlJZRkk0aExyc0VZTmF1RDdIcm1N?=
 =?utf-8?B?elU0bFdmSDhkNm1Rd1llSTN0MDVMWDhMN2hUcTVCYi9reC84MXR0WklZOS9Z?=
 =?utf-8?B?Z05JUFpGOGFndyt4UVlEY3B2YkpqQUl3b0xlK0tOYkhiQWQwaXlKWkptRFJx?=
 =?utf-8?B?K2xpUS8zVFIvL2FseXhkbDdCdGhLUHdaOERtOXEvenNXSVBqcnV6cXoydCtW?=
 =?utf-8?B?VmRNSlBiTlhuQjhrVkhpRkZiZVZPYmUzZ1FFUVByeGNIMHpQKzdDaEhtdndM?=
 =?utf-8?B?RDRQMFZzUGkvUXNiQlZ5ZnhlUzJCazFKQytUVFFnNWlCRllVNml0RHBxWVd6?=
 =?utf-8?B?OFIxTmM3Qlg0WjhuczBiKzdKNWJKS00vbEZIcWtnRTVOUVRuVmIxSDZqMk51?=
 =?utf-8?B?b1E3elFaSys4WWxoL0dYSGVjb2o2TmI5TzNEWDZPdk1YZXpLSjkzSGRKbnJv?=
 =?utf-8?B?MEdMMEVHT290c1hJdjZaQ0F4ekFpbU90U0ZpcEFHTks3d2JMMzQ4Z1FnMzBi?=
 =?utf-8?B?aE9yVFVoZWw0VFh5VHJvVy94VmxxdnFHYmhSYW5abHp3VE4wcTJKQ2loVlBM?=
 =?utf-8?B?MmE2WU8rcGZORURuWmdBVE9abGFsZXBmQ1ZtMjd0djF5RTBnQ0tKT3A0N0py?=
 =?utf-8?B?dHRJTnQwWGRpakVWR2orZjBPdzYwdiszVkx2YlA3bWRhOW9BcXhUNy9OQklm?=
 =?utf-8?B?b1BDYms1VlJrd0F0QmtraFlzMWxZeTREanlSRXJ1TkRNQWJmOEkxQVgxT1Jm?=
 =?utf-8?B?d1Z6UFh1QWh4OS9GWW9pRnFhOENqeEFKdGlqVkZvdnBGVTVDS1BVQ1JPcWp2?=
 =?utf-8?B?UlpYZms0c0dmRnFYVFlFQmtNYTlpODQ2R3NWZm82em9hTUpyczBoM1l4VU5X?=
 =?utf-8?B?V2JQd080WmoxS1VSQzArKzRad2tLTGVGYisrYy9DdHl3c3o0RUM0VkxrWTRU?=
 =?utf-8?B?RWNWeHRUNmJqdVE1cS9xdk5NVEUvSUpieVVsWHovNzVvNFhVdTYvYWJQYnhl?=
 =?utf-8?B?cGlma1pWTVlCUWM4UjVBM3MwelNSek9mdFB2ak1FeUVtVHIxUGVzY09jdjN1?=
 =?utf-8?B?UkdTTG5FdkwxeTgyYmI5VVczb21YdjdNNGEycjVyZnF5STFBOExaVkw3NEJa?=
 =?utf-8?Q?U4t9fm1Rx1FQ4pg4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cfdcb3-71dd-4f47-8909-08de6c36fcaa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 02:07:35.8679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uJZAsmF20zriOg2AWqCZZoUNP8xOF8mI6FnPa4CS17DXal+/V/ObeAHVIlnJOXoXw6JmTOv7B2B+qDZAYWB6TP6ZPC+oVedMPCSSgRRpnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6663
X-OriginatorOrg: intel.com

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.0

...to receive a couple updates to the maximum buffer sizes supported for
the configfs-tsm-reports interface. Recall this interface is a common
transport that conveys the varied architecture specific launch
attestation reports for confidential VMs. 

They have appeared in linux-next with no known reports.

---

The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:

  Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-for-7.0

for you to fetch changes up to 43185067c6fd55b548ecb648a69d9569fcf622b5:

  configfs-tsm-report: tdx_guest: Increase Quote buffer size to 128KB (2026-02-10 18:24:09 -0800)

----------------------------------------------------------------
tsm for 7.0

- Prepare the configfs-tsm-reports interface for passing larger
  attestation evidence blobs for "Device Identifier Composition Engine"
  (DICE) and Post Quantum Crypto (PQC).

- Update the tdx-guest driver for DICE evidence (larger certificate
  chains and the CBOR Web Token schema).

----------------------------------------------------------------
Kuppuswamy Sathyanarayanan (3):
      configfs-tsm-report: Document size limits for outblob attributes
      configfs-tsm-report: Increase TSM_REPORT_OUTBLOB_MAX to 16MB
      configfs-tsm-report: tdx_guest: Increase Quote buffer size to 128KB

 Documentation/ABI/testing/configfs-tsm-report | 16 ++++++++++++++++
 drivers/virt/coco/tdx-guest/tdx-guest.c       |  4 +++-
 include/linux/tsm.h                           |  2 +-
 3 files changed, 20 insertions(+), 2 deletions(-)
