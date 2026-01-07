Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4933D6F3
	for <linux-coco@lists.linux.dev>; Wed,  7 Jan 2026 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811352; cv=fail; b=JeJGyCr2okGKeDR/hxUNhFx6Zin720YAEjNk3gUqQkpAQW+CUq7jF8rYRtg8PjpnX2rzyrZvgo8QUK7w2X+vR6hL61GsMDmfooB9cR06WY/aCFmxbnMGX55QP/eELu9TJvaCgUZat0iUnZPIvqlaUGnSyX31JzgrLmTWyudLDUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811352; c=relaxed/simple;
	bh=uDA6IMaZSK1cmUR+cSXrgjMAwHRTy79zJ4N8Y/1LFKo=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=SK1rBdNrL4kygGui4aox+PdukHkErXrrch24uXvjzh5x6xUuB9BOnWy7bIR7qgyZBt8v6IyyqVItC5CxgfNytyiEPa3J7VRtrwUmgdshboTCH2iSfUkW8VW1PyMb7tUIRpiDeXmXU59EcDIR/Aa3hy71iMD1aUxF2Uud+UZmtjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkaB6aJA; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkaB6aJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767811347; x=1799347347;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=uDA6IMaZSK1cmUR+cSXrgjMAwHRTy79zJ4N8Y/1LFKo=;
  b=IkaB6aJADZZutaKcXISmnZDPiKSVt1L4rKzsCF6I+lXoP8vtrrfJENl4
   RfkTVLrY7igi6+uVsoDH4QZMbeuvoMytaaAKzuZgbLsF3B3j0Oruwfo3r
   t9lPYyCclTXSYCJLAfEKUXDAv9clEcfGXk7xvzEkXnQ5cab3NfviBn6Hg
   MbJZ/Pgd7JQ3BUAy9ilhrdAtkkx4mEHbR40C+PGGbmU1JM1yoVSgD6IEH
   h/MJGWeK3Wp3JmDblFUytGOwq1zL00Q28Z4sleHzDZS5CAknnBjIqklJF
   mPQHy2LkeWGrQodYFEuGpQTirwSQSDnkbqj8JH8lUPJ6ATEdZZpxGFho+
   Q==;
X-CSE-ConnectionGUID: WmyijT9ITESli59nS/wSyQ==
X-CSE-MsgGUID: ui+UkdXSSwm3ti9iTXqkEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68380846"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="68380846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:42:24 -0800
X-CSE-ConnectionGUID: tiKgLdPRTu2KRqgg8d+4nQ==
X-CSE-MsgGUID: ItLGQqPfRQuCaahxDIaOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="203016163"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 10:42:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:42:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 10:42:23 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 10:42:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTIcSN6FSWGNgikl08gF3pPPXEd1Dz17xsnn7njayheIoKs3UTDJfr+VYGXI5xn8hywRiVVNduisib5ET/veCfor2TcMj0vRQayIk1AgPUD82SVUFpuRiw07s/lhcQfLzN4Ai5HSE9TofzAufWJjKgYcb4wdWSIHqJwPtVYR72Rv1uXLq6upWsOZy4bjW1uuWIzMPVb5pCXBvn55cAJoYphc5ezU5j04rxYI21Vo3bzTecZENCHUq/iD70izdsLgFFYrKqK6VTYprfhlYeG+D3f4ccGSIIVJyJIhtnZbrAOTzPRFL2F0Sa/kexJtw/kPyPq27UV23UaOlfJTvYnLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lE+H/AR0gNweaaJpwHw4/CBZOmHcUroBBtqJoX3BAdA=;
 b=X4IbSdq8bmHu/1MyYc3YrwvXj9aik14AcpaVdcst++lGA8kVnz4hch+XKYFTG3DdtR2Wx/KFH51oK4uWUoQKcEGZOBNt/7RanOdBP7giGq0sFL1zGYgAuWcZnhdQfLoqfe7XgFq4UmY5lCDOUZMU4pQ4bsMjTzxL5g1GYwqkywm77glHupvd8UZlKgEFm3xiFFgpTgy004TQbVRX8szEaKAZhboPlYQUEWSqKisi5mgoKdiKUxFULVToAPGzH0K+SB0gcQRNku+ML++4oUy1Lw/sSm3AvyBf43JKold4Tc3cyLcNMfeACx848+c6BvvSWh0dO1uIh3a9xjWTynybyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:42:14 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:42:14 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 7 Jan 2026 10:42:13 -0800
To: Jon Lange <jlange@microsoft.com>, "dan.j.williams@intel.com"
	<dan.j.williams@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Dave
 Hansen" <dave.hansen@intel.com>
CC: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, John Starks <John.Starks@microsoft.com>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>
Message-ID: <695ea905645a0_4b7a1008e@dwillia2-mobl4.notmuch>
In-Reply-To: <CH8PR21MB5222DB4477497784FC170791CA84A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>
 <CH8PR21MB5222D4771880715FC8104835CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <695dbdbb37d41_4b7a1003@dwillia2-mobl4.notmuch>
 <CH8PR21MB5222DB4477497784FC170791CA84A@CH8PR21MB5222.namprd21.prod.outlook.com>
Subject: RE: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0073.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd34523-1292-4012-d9c1-08de4e1c7a02
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnVtYTJtNzVvcmJaUXAva25US0JucTlObVRBWFlORmFtNTY2eFIzenV6d2F6?=
 =?utf-8?B?a1lramhNMUllNGd5YUM4VFVONWtQdGdvSTBBZFhHNmRUT1hvVUlTT1NMbERv?=
 =?utf-8?B?MEh4UHJtT3RocnpaWlcrOTh4eW5wUFNDR3UxZVBEakhnMmV6VERVVnpsUGJY?=
 =?utf-8?B?WDJ0N1RiOW1jamFadmo5d0pXd09wTE9UNmVRcHQyeTRZUEtKVzZvZGVkYWsw?=
 =?utf-8?B?M0pnOXhQTGdrMEtLalUzRHZVeDJHUWVHdk9nM0pQWm03cDdKa0xjYXZnVWlZ?=
 =?utf-8?B?aDBkVEo2dlBqV3g4azJVNE9hdjBJNG4wQlJGd3habG9sTXJHVDZIdGFiVy8z?=
 =?utf-8?B?cXVCc3pIVW1FZlA3eFBYWG5rSXpVdHpmUWpyZjlucGZ1N2E2c0QvL01udUEw?=
 =?utf-8?B?QVlrdEUxeEtqOUpodzBvb0FSQVEzQm1qaUwxcHFLaTM0QjBxK1hWTWNWaHQ0?=
 =?utf-8?B?Y1I1c1ZYaGRHZkM3VDhKSTRvSDEzVGdmMFRTZWpUU3BjTkhGVFVuWUFOeFIy?=
 =?utf-8?B?RmRDY3BTbXBjeVpDTmlmUklLUTNpZEdmVGNrNGV2azJLY3VZTEpnY1pnbENi?=
 =?utf-8?B?TFNBZm9naURsSWhRQ01QYXkzTmI4NkJVN1JVUElMYnd5V0Rub3VqeFl5akEz?=
 =?utf-8?B?eHY0ZlU5MDlxc091SDdwZHF1K2wwdnRiT283TXVwRStINFA2NkdpSVRmUGpz?=
 =?utf-8?B?RCtCeFBBcVlRRkVKdWtMNlAvbzlENU81RFBVbW5HNHNROFRVT2xwWHFvNEdM?=
 =?utf-8?B?N3BwdW4wNVQ5RnRTbGJ6RzBWQ3ZVN3FQZUFWWTBHRUF3enV0aWw5aHp3ZVhV?=
 =?utf-8?B?M2ZFL292a1NJUmNDTWFreld4c29CYVI2MW53SzVHMFBiYkdEQ2N3Mm1zTTJC?=
 =?utf-8?B?czk0c3JBT1FhUjZGRSs5SkFVdkljbXNBMTQvdklGQlFaWUdNb0hta0ppZW8z?=
 =?utf-8?B?YkFRVlNLRVJLd2tCbW9KRUpBZkgzYmxBbWFoekJ5MkNhelYzb2xvSmRtMEJw?=
 =?utf-8?B?Y3VzQlNkL2crUDZiNXlKZHVwc0FPS2FNUWFObEkyaWczdlU2czA3RWZJcGJq?=
 =?utf-8?B?OElwMUNyQW0ycGRoTlZ2cWUzemJtdUx2SWtVaDgxZW50UmxmbjJkcHdHTmFF?=
 =?utf-8?B?M05aY09PUTVrdFlJdGxKNmdVbFM4UEh6WlN4KzZzVTlETVRTb3JhemxQcEpZ?=
 =?utf-8?B?YzB4RWZsRy9iQXJLTEp3cmtGMTRleXF0NkFPZDYyc0pkV3ZneDFoVStGZS9R?=
 =?utf-8?B?b3NXblYxMUk0dUtuTUN4K05rc2RNMUNwUmRVZ0lNbTVDelFjYzJKcHo5ZVRo?=
 =?utf-8?B?eHVqZWtVT2ZsMlRFbit4UkxMMVloZnE5V0VRdUpMbDRlV3lyRUxtaFplc09K?=
 =?utf-8?B?NHZlY2UzeURXMVlIWlBvK0tJenorcjlyVDZQU1lOWUhoNGJUc05JVlpMU1I4?=
 =?utf-8?B?RkNzQ3RqNS95RllRTzB4SmQ4UW53cGlzUTFsamlQUVhXMmJmYTdPS2g1Yk9W?=
 =?utf-8?B?VXE0TkZrbGJ4UEtTcEJHNHpYUVVkVmt0T2N2VWViVG1NQW5Yc3MrYlJ1d1l0?=
 =?utf-8?B?NHpHUCtqMUF5dnV5RnY4TUJDdEFQNDFMcFFaQ1NybGVvZklSRktwOUxRUGFM?=
 =?utf-8?B?UkUyZ0JWaFdQVTllUWpUS0xqcEowdXhhOHFhZTV3L09mWVFDRjRPbC8vVWtw?=
 =?utf-8?B?VGgrc0dMNzN4OFRpeDFQSHcwclJUdUxoSjkzYnY2QTI4OGhwdkQrMzF4ellZ?=
 =?utf-8?B?TXU5Q1BxRHFPbk1ud0lwYm5RK2lzZmRRT1d1OWtxYzBFbS9nclkrVUVVVnda?=
 =?utf-8?B?b1BEU3FEc0N2Rys0MXZzOTR6MjdrUGRnWTFMMHNVb1hkTHVOUEFmREpyUmhD?=
 =?utf-8?B?QXVmbVhxY0gzV3l0VUxRelZQTFRQdjNHbnMwYldxVzZQMG5VSTR1M1dJbHJP?=
 =?utf-8?Q?UHVx1b8AcrOKpOujBtRWu8Q9tehIIG12?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVV4dTFXT2RkZ3ArYmZvZ0xpYmhaeFB4MFUrdDNpRmxzNnpucW5FZ2QvOWk3?=
 =?utf-8?B?emRxaTZhK3Z4LzBwWjVEMi9iQzJzaW1qSXY4bjNjcmViYmhob0V5dDF4Y3B6?=
 =?utf-8?B?NmYrM2dURjdiTXFlMzArV2VhZGhlSG5iZ2Z1QmU1cHVKdU1JOHpSdnVpL0ow?=
 =?utf-8?B?YmM3U05hSHVZN1dLSlZRNWE0d21ja1NNK0NpSFh3a1l0WTFZc2FpYS9BMHQy?=
 =?utf-8?B?WXlSZXZLcnR4aTNOcUY2TW9odTlqQ0hvR0o3L3ZCd2Z4THo2cHhla0JwcE1S?=
 =?utf-8?B?bEt0dWdRR1E0bGNqSE4xUE4xcXphZ09JdkNSeURRak5URUtsVXluR2FBYVhx?=
 =?utf-8?B?c3g3YWQrVFl4WVZVblNyajNpWVNUZEZobXZhUS9MTmk2M2xWUXRrM05NL01C?=
 =?utf-8?B?YkRSQTUxTHJnZHFDM2FHV1lIQU9WWFNxTWRXQ0NoU1lqYnNiK1hFdkdUV3RP?=
 =?utf-8?B?alNqSFQwaVoyNGp1VU5IS2dCRWNnUG9NVXRKUXVxOWY3bXFrbFFsN0l4RWVZ?=
 =?utf-8?B?YzF3Z2dZTlltYW5JZk5aWDljZkdTRStwYUlMYVgrcittVmU1QUIwYTVhaTQ5?=
 =?utf-8?B?dHlSUTFPcHFNNHhXQWNTaVNoQXZXUmYyQ1BNZVRVV09vV3Vwclo0U1drNCtX?=
 =?utf-8?B?SVdDVUJSTHQwdmtJNFdYK05ST3NlQ2FRRWxRanc0MVI4RHRDYlZxMVlybWNF?=
 =?utf-8?B?ZGhlWW9rUG5TZmpiOUh4QkhtTEplSnlUTHFsSnNZYnpSRVJYbS9oZHR3TktW?=
 =?utf-8?B?TVNTTkt4TUVzeG41M3pLQkNxZEQ5UFFJWWVtTmd1aUJOUjgvMGk3ak9ibTlr?=
 =?utf-8?B?QmkvSFVzRTlRZThQYmg1NmxVSEZhQ2ZLczJvcnl3QmRHdHdSV1B2Z2FyandY?=
 =?utf-8?B?QXlRc0pVTzBJU0hsZksrVDZmV3YxK2NyUmgzeVJNWU1wK1NXZTRLaDY1S21H?=
 =?utf-8?B?M2p3ZFhsM2lEWW11MW1jbHJyQitVcDBxRE1QSk1lNW9qamphNERVTmR0RTVH?=
 =?utf-8?B?aGV0M0F5Y3ZSUGhTWUc3QUNTNU4vZUFKdS9BaWUrZzJld1BWUGVxclZ3MkZs?=
 =?utf-8?B?NXd3TU1yelhxQnp4ak9JQW8xWU5oZFBGWGFLbDd4MEd4YjlIdGE3cDIyc1FT?=
 =?utf-8?B?RkxrcU5mRWhMVmhrZTNkaTR6bXNaaWxFU0kwTllFejJmQWl6a29VekNVbWEr?=
 =?utf-8?B?ZzVkYXhUNmZER3R2MFFVTGk5Z1d4TEIvbTB4MlJLN2xwOE9NY21zNEcwN1Ns?=
 =?utf-8?B?Y2x4c1B2cEIzTnAwNklPemZhSnRVMmdYdzMxc0lVNWJZZ2E4ODVVOSs3Z1JP?=
 =?utf-8?B?UHNxd1JmcndJSEFzTlVFTVhQQzdRZGJQTGszcUNmZzA1RTJ5SGdzeEhrV0tU?=
 =?utf-8?B?OExpa1RRM3ZPeXJYQlZSeDArQTl5dmIrWHZLVTBJQmsyM3NhbkJaMGJNNGZ6?=
 =?utf-8?B?V0hxYkxKOW5lS3pOYzgvc3EvSVgrRUg2WjNuUk9rSEppb005VWR4OEsvZVZG?=
 =?utf-8?B?OFIwa0h5UkRuZHNxeEhSb0FvQkF1ZkhqQitnZ0ZMMithRSsreXFWRkR6S0ZZ?=
 =?utf-8?B?YTVPQnk3MWt5bnV3cnR4STRQZjBNTDIwWnZZSmVPdjNNWitTTkFOSTE5byt1?=
 =?utf-8?B?N3VqUmoxL2pUQXBIekVyM0NMV0JZMEtjZ2pGOTJvbWxBN3I5N1VMb2ZxaTVW?=
 =?utf-8?B?RnpIUGNkdVIyR3FyUlQ3M3Y3cUZBaEJFVjdqVUkxYlhSaFBzRFBia2RYSXc0?=
 =?utf-8?B?QmFTbHpUUWdGQ0M4SGJNa2x3V08yL3pBVVhJdzNJZHNGZ1o1RzFKZ25ROTZH?=
 =?utf-8?B?OHVoTlJWSDRtMlJwMTEyMzgwMzB2RlJkYlpqR2NXU0d4U2dzbG1oVStCSi84?=
 =?utf-8?B?cUptQzlzclVqMWhYNUVReEdhazJxbytjR0lqbC9UMS83bDgxOWc0ejRjYlQ2?=
 =?utf-8?B?eHA4b3pSbU9ROEFaRGxGMGRTZlc4K0Q3R290YXk5YlEwOGo1MzZFVVA3TE5u?=
 =?utf-8?B?TE9TZ0ZtZml2NE5DOExHTnppT1lQOEc2R2FsUlZIZXRIbTZmMlFBaGJZZGxY?=
 =?utf-8?B?NjRDWmF3VXJBZHNkTWp4Y21EeTNVZEM4Vy9CMlhveisyVlB5N1FZYVhPUFlq?=
 =?utf-8?B?MHRlY05HOFJ2WWNpWUNvUXFLWGN2Z3RsRWxOUjRTclBhdHBvdHZrOWZUV0Z5?=
 =?utf-8?B?d0psV3V1VDBNZ21XUVY3Q2NoZmxLMnRndlNBMWlLZHRpS3FLRDI4MzVPRHU3?=
 =?utf-8?B?MFV6SG5GQW9tSm1DRWc3NE0reDhrM0c1WXlldlZyZHBTVGp1UTg4dW1iMys3?=
 =?utf-8?B?c0U1MDFQa0dYaHpqRXdQQmJ0QlphVXQ4WkhIV3ZoWlB1K1lHbmpZaEtmTGIx?=
 =?utf-8?Q?Jcjehp8rzfYAR5cc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd34523-1292-4012-d9c1-08de4e1c7a02
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:42:14.7303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMXJPcNXqc8S0oM2JVtWPL8cLdHhcnZzZ5l8OMPhkIgx54R6sCtONvtG5OCKWiSt2zKWwPuAeIK2dVWBhx7btjUW9JEzW6WBdcEwFOQdAAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-OriginatorOrg: intel.com

Jon Lange wrote:
> Dan W wrote:
> 
> > It sounds like the paravisor is going to hide confidential memory
> > management details like page-acceptance, but it is going to advertise
> > and intercept higher order operations like generate launch attestation
> > report and TDISP paths like lock device, get device report, accept/run
> > device.
> 
> I think that's roughly the right mental model.  The paravisor will
> additionally hide confidential details like MSR virtualization, I/O
> and MMIO handling, CPUID virtualization - all of the sorts of things
> that would generate #VE/#VC exceptions in a fully enlightened guest so
> that the guest doesn't have to worry about those, and the paravisor
> can provide useful functionality (like device emulation or
> hypervisor-type functionality) through those primitives.

Ah, anything that causes #VE/#VC helps, thanks.

> > So does this paravisor need low level intercepts via pv_ops and a
> > confidential memory-management model independent of TDX/SNP etc? Or,
> > does it only need the higher order common "services" like attestation
> > and TDISP.
> 
> I'm not following your question - I don't understand what you're
> envisioning when you describe confidential memory management
> independent of TDX/SNP.  It is the case that the paravisor is
> responsible for the confidentiality state of all memory, and therefore
> it will have some implementation to fulfill this responsibility.  It's
> natural for it to do so because its own operation has to integrate
> with the state of memory.  Following my earlier analogy that the
> paravisor acts like a nested hypervisor for a single (confidential)
> guest, the paravisor itself will have to implement all of the services
> necessary to satisfy the virtualization requirements of an
> unenlightened guest, which is far more than the "common services" that
> you mention.  Can you give some other examples of the sort of
> distinction you're trying to highlight?

So, I was trying to get to the actual ops that need to be intercepted,
and whether every operation that this paravisor wants to intercept
already has an existing indirection or what new indirections need to be
built. This probably becomes clearer when you have some time to build an
RFC, but the array of operations to touch exceeds traditional paravirt
hooks.

So, for example, paravirt ops do handle MSR virtualization:

struct pv_cpu_ops {
...
        u64 (*read_msr)(u32 msr);
        void (*write_msr)(u32 msr, u64 val);
...
};

Other operations are outside of paravirt hooks but do have generic
abstractions, like these for encrypted memory:

struct x86_guest {
        int (*enc_status_change_prepare)(unsigned long vaddr, int npages, bool enc);
        int (*enc_status_change_finish)(unsigned long vaddr, int npages, bool enc);
        bool (*enc_tlb_flush_required)(bool enc);
        bool (*enc_cache_flush_required)(void);
        void (*enc_kexec_begin)(void);
        void (*enc_kexec_finish)(void);
};

For attestation operations this effort would need to register its own
tsm_report interface:

tsm_report_register(...)

...and for TDISP it would probably need to register its own TSM device:

struct_group_tagged(pci_tsm_devsec_ops, devsec_ops,
	struct pci_tsm *(*lock)(struct tsm_dev *tsm_dev,
				struct pci_dev *pdev);
	void (*unlock)(struct pci_tsm *tsm);
	int (*accept)(struct pci_dev *pdev);
);

So my curiosity is whether there are other operations to capture that
are buried deeper in the arch implementations that do not have
abstractions today. Again, that is probably best addressed by an RFC
implementation.
