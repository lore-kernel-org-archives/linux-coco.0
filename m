Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3885637F75F
	for <linux-coco@lists.linux.dev>; Fri, 27 Mar 2026 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644917; cv=fail; b=FEiAnH73KA1mO0NpoU19xlj9ngiK0PgtCC9P8WQklM1NE1pv+zohFTccBZSFHk7ciV/tq7qNgyZK3YLOvmN36u5v4D/LzS8GjmkW6y/TokyTkmFqjVXvoJ6HDj0x9y+JRYVviGYHGj5kI4wh+5OQie7h3ww7kHmjhzcCVNWynEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644917; c=relaxed/simple;
	bh=/0PP+0o5DuckTO46LFBIoB36tyQ1hO89qB+YobwbCd4=;
	h=From:Date:To:CC:Message-ID:Subject:Content-Type:MIME-Version; b=R8xrBCMI/CHlW9EdwPVDfie61kFEfvE0ku28brTyaLiacMEvoBfYIdp0m/xDkUfvCkWo/RTgPEajo2MxlGjpwik82KUr5kns0XaC8xw6Hk28CumZIXbE6SRMeS/FSBN1Ygl582By3UcBSqvUrnX9uR8aFNa6mBgcxW2jF3l1MSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfJx8Oy2; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfJx8Oy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774644915; x=1806180915;
  h=from:date:to:cc:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=/0PP+0o5DuckTO46LFBIoB36tyQ1hO89qB+YobwbCd4=;
  b=hfJx8Oy2xqqsTdLlfrRa6n0UWsYNqL3dxq1jynlvzCUK51kMRGhtcEZ3
   kimH1aq7RwPUjTzDvG5IOHhsCt+iC2t+DCAKiz3iuV59vL89pAc/ij5P/
   fAvZKg3web4j0N7ZrMs7mKxOLg7520W/9G3QbLRahv9r7ETMoEvrbdhuM
   s6jiYbLjRIrd+1gs5OjVr3kogpZVV5P1upUPxllCNZEQRSVmY/PXgELrL
   FAQQBMp47KdPmx1ccabfT/T80RdWSxOg4hdnfR2tD8XCjpAsUwWNSR5SR
   tTQLvI/DNZ6Zh2CqwyL2z+osPD7zdqJVdS5Ahr/mFpat11VXrvksT6Uv3
   g==;
X-CSE-ConnectionGUID: 2iY2MeOfRiuw7YRliZ8tMw==
X-CSE-MsgGUID: HoB8LS8nSwaldtkXpmJ02w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87198548"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87198548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:55:15 -0700
X-CSE-ConnectionGUID: JlsdbfzmRdejhG3v8bq6hQ==
X-CSE-MsgGUID: z3KXantEQ6ScWluolge/DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="222547051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:55:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:55:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 13:55:14 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 13:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9tDA4YBwBoAqoQkU0FKQjsMjIfRJ6aiV8LKbvrFT3vwtbh+ezXQPNFduq7hjNZnXIhQTouyg7Yfc2x9sLmbqcnUWIMl+0ZjFPmU4TPV0+k2n/MtR6SaG57zG/z6XyPDwN+o+dsRDETIucDxakox7cNNYeGrFLBWn6a2DkiYsYUkMDLd3f501Gp6aGlO4kXDQHL447RSbTXttVB26CEIMfaOT5VeRSgjcrOmTZlA8ZYjqUsZ7qjI/nf0CD0h3YVdNCbQAE1v6gFB0BguLnS2InMiOiTuMnhv4eN7YOJLFhTwJydQoEmu8Chuu/U6ozv1aeE6tCtfzMrZs1fECPSkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T73QQS3i4+4ySgWLlR79OBkQm9S0ZI4EIM8eekmQN2k=;
 b=XNk3MtSFlB8mo14iNwnhrk5M8KGMiZVxTAW1g19TjRYn/KSTj5B6gus3aXjflHrWakYbxdhHU5Xb2npkIlf23zdpyqxypDU57yMcg4MmQA94OdUZ5/gTywgArdGemQKPm9hvcufGySw2iOjxT7G2G4BGxWA0b2VRGf8aS/79GFyhOIUf3FNUEKHcDrbi8ljMgmNCi7cBSY5Xze2Mjld85FasLTzgsleyA+oszQZaZz+XF/QITxGdhErvbAjHHfh660kBP4aGPU8CrO/4XKP+igKV7YdZW/nXFi+pwE6/J2B72mn5tc95tWtEB+P42w+o5NUt3nQ+r5pwOrp3ZLuKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB6895.namprd11.prod.outlook.com (2603:10b6:806:2b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 20:55:08 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 20:55:08 +0000
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 27 Mar 2026 13:55:04 -0700
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: <linux-coco@lists.linux.dev>, Zubin Mithra <zsm@google.com>, "Kiryl
 Shutsemau" <kas@kernel.org>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, "Mikko
 Ylinen" <mikko.ylinen@linux.intel.com>, <linux-kernel@vger.kernel.org>
Message-ID: <69c6eea861b3a_1b0cc610021@dwillia2-mobl4.notmuch>
Subject: [GIT PULL] Confidential Computing: Attestation fixes for 7.0-rc6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:303:dc::16) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c254b8-6675-4f71-1d26-08de8c43216c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: vtegdp3+KFq2qtTc8IcwaabERYCijblfH0B/jLVuTYpMr/uUQrurGlPTsa/xptgfJubkhYQTx64xe6SIyNYPN4/J8dkIOUqEOZLplVB1QTxw7GN4rTSm9rtRwzJV8ZRywVi3qkaCUz2ewwD0tJfmvLoiARig2YZOrJt8yQeUGCpP0IL3/L5T1sZfFHHuMZWaEKvbHwQrezk1Sy7x8XC/BcjfhncK44VBHa9Bio6P+QUiK+l6GAWQj6KZnpgJlUfprW1opMFL/NJrlJFseG4oOFSOpKJBM7bLysnnMqnw13zhHlPcTEr5i3yeYzLO2H9V4XGiUiS2F6koAiOPYSeI/IekfyCAw/xwzXwYTa9YI+oqT45cQFzF57S1ugnlaSlF1KZqzbWBLR7M/gNIEoBurXxHo8aQ3JLUXp8kY/QMnTyT2Yuu60MGQUQLAu5d9j5oSXXSfifsJmBt7hEcTqMbSNrvKUa72Z9mG4wHKLtif8j+UnAOAYpwUdmXk18/8ZINtWDtl+3bzlhYHDe6dS7ye9T1TADPa2bLWO8Cf8z33a+10SHODKlbeRM459DZtUwgK5bmsjrHFurKpvX+dXRaCGgRWXsSh60cKxZCVdkXVHzqT4BzOL/Lsj8ZAEWFQteBA39TOonC+LFcdv7n/OCNZ9U3VzQDIDL0NrKoY2ArYOLR2hjT+02r48R4/ZBBjD6pgnSvkXtVzPE/kuD2SCr2at99zjDAz0sbov7DbZPoVAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlliVmRMYU1SZENBNkJxK3B5aHpLa0U4RGxTczBpKytSYVpHQTYxdXc5WkhD?=
 =?utf-8?B?ODh0dGVrUWYxMkp3dkpHdHB3VGFqdjJuN0MyaGxjQ2c1dmg2a2QyWVBqajNs?=
 =?utf-8?B?VER0SEtkdDhYWkdVZitLbHEyZ282YWNLRzQyU20zbUxmckZQNDQ5NENWZWUy?=
 =?utf-8?B?QXhCaVZkOUJLaWUrYU1yT3FmbkpRckRmUjMzYWpiWUNHSHNTekFFRHBtdEJu?=
 =?utf-8?B?NWs1R1ladTFyTDAyNHRiSVlNUVkvNW8xU3BpUzlJaUduYzNLckRycnFtNnpM?=
 =?utf-8?B?d1JWMkZpR0Q3MmpYazhhd3ZWWGNPK1c0aVZ0bGhSVWNuTG5GWmpQNTJ1WmY4?=
 =?utf-8?B?ZkovdXNhcjA0cTZ6YXZVUjd0dDlOUzN3TlY5V1NLK3B2dExJZnJ2WlZMZnN5?=
 =?utf-8?B?MkthcGlRcG0yVE5BUFM2bTVJYVdYb2pXYndHODlmWFUySExVcG4xWTFFVm1Q?=
 =?utf-8?B?aWROdzl6TG82ZGtiTU0xMmZDWXZyVW11SEJhNGl6bC9UMlJrWUgyUmRmWi9N?=
 =?utf-8?B?U0xMS2tGRVRHdFdnOVlaTEtmMlFRdVM3dWdXZGt5SW1vSTkwZ1hodnVEQWtO?=
 =?utf-8?B?QkdVcklHOERObEpxSTg2WmFVZy9sUlMwaUhKWVZvWnRLQmMzRzlFV0JhZCtt?=
 =?utf-8?B?eXpoSFlvWTlnSENhN1JJTkF1VGhla09OSFhic2NYT2Q0UjBMYURMdDh4RGRr?=
 =?utf-8?B?dTgvMnh2RFpPTFNvK0tqNnRsSnJ0a2VyR2dveUVDRytFU3dYYWY5NVFHVlVh?=
 =?utf-8?B?L1VScDFEclZwVFVReTJZSmtrZnZwSHB3TXVCWTBBOG1SQmVETXRaNUdiUG00?=
 =?utf-8?B?TlpERmZMQnZybll5WXZIcG5wamlJcGIrRFBlZjI3WmtaWHdtMmpKelMvdjNL?=
 =?utf-8?B?d24xaml3MFA0WEw2dnVxREJmQThxUFR2V1pIVVlWd1gySWwvd2t2Q2RuSXpF?=
 =?utf-8?B?T0xWcTJXU1BuSGZDS1NxUmlVUnhhZTJaOEtZaHUzT2lVN0IwWHlkVm9iaW5V?=
 =?utf-8?B?QUhuektPd2xIbE1hbHRSeFBIaWNHaGVOa1MyS3NNSlp2MlBOU2xqWE9zUUtF?=
 =?utf-8?B?bFZKcWlQOGdYazlLSmgzVXhBaHJCZ01aVjhEb2FQT2RDUm9OM3JtbmpKWUxG?=
 =?utf-8?B?QzdGbEVKTHR0a1hMVWY2U3UwM2t6di9DLzdsMEdGdnhWNThpbnpkYXNzRzR0?=
 =?utf-8?B?d2ZpREhLNndrQXVRR3piWTA4SEN1NjJtQWdDakh6UEtydE50dGJmMmhWSWtL?=
 =?utf-8?B?VE14LzVvNEZzdUFCWTZEMUc5UEVMVyswRmVJRGRrK2pwSUFQOVpzNzdUTmQz?=
 =?utf-8?B?ZDhrZktmNjFNK2QzTXJIeG1xQnVmdlVCb3FFODZ1aEVmdjdtOWVNVmNZM1I0?=
 =?utf-8?B?cG9JRkM3bk1rOXU5N2Ixc0dmeVViYVUycHBVNG5TM2U2WFJJRldBWDduTGNM?=
 =?utf-8?B?am85TmZQV0VOTTFlazBlM2tMRmxTRFNEZmlseENBc1dHS3ZzWGVtVFNvbE1s?=
 =?utf-8?B?TXlwUWxyd0IvQzBaN21DRXQwU2U5dWZ2NXgwQzNlNGFLVExlSHpTT1AxQ1dI?=
 =?utf-8?B?REhMR2FVY3hKTEdEVlFkVk5FcEZPYVBTTVg5a3owUE5tdHZYdExCd1ZJMXZZ?=
 =?utf-8?B?MzhVb2RRVCtoZGo0WFBWZWNqYUxDYWF4WDdFMHJWQXZFYVplOFRqZ1BVbUpa?=
 =?utf-8?B?Q1NjQ25DeWFyNnlhbHJ3RjMxMitRSitPZkhlazZCMjNlU3AxTklsSExXSW9u?=
 =?utf-8?B?czJlK2daZzc0TXBUQmg2K3N3YWZud0dVMlJsZW53aHE0bUtnSDlTYWZKMEdr?=
 =?utf-8?B?N0lzRHI3OUtBdnNnMUNVbWdJZno1aEcrbC9HTXVtSmNUdUs5VU82enVka0Fv?=
 =?utf-8?B?QTRsNWNJc1B0TUhnclM1eGdxMW8vUFVvdWowOFdjOUFYMWEyVkpGbVpUeGNF?=
 =?utf-8?B?SHlEaDArcnlSMGlUZzZLMk0vOTgvVndiQUdyalYzbWRNOEdzamZLOGdZNXA5?=
 =?utf-8?B?QkxRb3NSdGJ1bGNzRisxOVdFdjlHQkptd1d2WUpDMWYyZHkyZ2dGMWxvbURY?=
 =?utf-8?B?cGcreDEzNEIxL3NUcVlwc1oxellwblFGUU1rWTcxTWR6Uis5TkFST1FpTjJ5?=
 =?utf-8?B?Q1JNQ1pHTVl3RGMvVjZpbFpWUDdYZDlSbDhKT2RuTGlhZ2hoT1d2N25JU2Yz?=
 =?utf-8?B?UXM2S2FBNFNzRzYvRUlYLzAxNFlaS0p6dW5wWFdFcXlpejBSVXZ0NjB5VXhv?=
 =?utf-8?B?WnNkSG1Pd3Z1MHhUdkVFMU9Ha3B3Y3dGRGFRU0JHTkpvTjJnZEt0amFHeWpa?=
 =?utf-8?B?NE43RGdKS0F0dG5ldHRqZjBMaGhkVGlFMVB0NDRGYlgxS1dCdWpFSS95V3lG?=
 =?utf-8?Q?Llh+smcEQN54c1cA=3D?=
X-Exchange-RoutingPolicyChecked: QN2drvsJNm8Imh2ewSYdCnJMgI+BtGrcxABgbpBbi7snbq33NSNIeoO0BGlMYDBb7zLYKno5bl2zoNu6+J9bqxaFKO3NZwC/5fCsadFN6zvlnYeKxkjObM4jgsU9FXzi+XI5MoQbcOas6h2Wcr60N2SG3nlKRcvTarRqeUZuoN+k3PPOln68pl7XfbW9kcfAhgU6nHpv69hTSnmWthgPWUzakJDfkWUI7Qyx2BZkVym46J2IW2uzWeCoxlLwOai/Z9rXtv/2/u/95ce7+eiXyx001ZOIMVP9QlklT6ew/QJiiG8ohQBjXr1GdkYkWsRv+CZ52kyn0OCHQ5mW9RHfWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c254b8-6675-4f71-1d26-08de8c43216c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 20:55:08.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtQsu30b/xyHalupG4cWzRSBSkU5XlVdD9lF5H7P/1O+E2icIpBA6uTiMw6CmNPNaGIy46BB9t4FaUJ3C9iJ99D0yRJWHVJWAz5RUs6Gfuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6895
X-OriginatorOrg: intel.com

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-fixes-7.0-rc6

...to receive a fix for the tdx-guest driver. It has appeared in linux-next and
collides with a fix coming from tip/x86/tdx (resolution below). Going forward
all tdx-guest updates should move to the tip/x86/tdx topic, and tsm.git can
remain focused on core attestation report infrastructure.

My conflict resolution matches linux-next's:

diff --cc drivers/virt/coco/tdx-guest/tdx-guest.c
index 23ef3991c4d5,7cee97559ba2..a9ecc46df187
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@@ -306,12 -309,12 +309,17 @@@ static int tdx_report_new_locked(struc
  		return ret;
  	}
  
 +	if (quote_buf->status != GET_QUOTE_SUCCESS) {
 +		pr_debug("GetQuote request failed, status:%llx\n", quote_buf->status);
 +		return -EIO;
 +	}
 +
- 	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
+ 	out_len = READ_ONCE(quote_buf->out_len);
+ 
+ 	if (out_len > TDX_QUOTE_MAX_LEN)
+ 		return -EFBIG;
+ 
+ 	buf = kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
  	if (!buf)
  		return -ENOMEM;

---  

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm tags/tsm-fixes-7.0-rc6

for you to fetch changes up to c3fd16c3b98ed726294feab2f94f876290bf7b61:

  virt: tdx-guest: Fix handling of host controlled 'quote' buffer length (2026-03-20 21:05:50 -0700)

----------------------------------------------------------------
tsm fixes for v7.0-rc6

- Fix a VMM controlled buffer length used to emit TDX attestation
  reports.

----------------------------------------------------------------
Zubin Mithra (1):
      virt: tdx-guest: Fix handling of host controlled 'quote' buffer length

 drivers/virt/coco/tdx-guest/tdx-guest.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
