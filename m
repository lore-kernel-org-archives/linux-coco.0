Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53033C518
	for <linux-coco@lists.linux.dev>; Thu,  5 Feb 2026 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770333579; cv=fail; b=F2SCvyt7n8A/DGwBRCgAJoJZ1l0ORHRD9lcsM6qHwtCQXVGkzmpdbmX+5AVnekZf1JerqVh5CBxVpdipsJaedUtl4N+4Gs02S1Qbg+DsthXu/CwER0d3aD+Am8wKiav3BD/9Y2v0I7mepoNkS2IwQEZA1ge/0q4iFO3dCJc1L18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770333579; c=relaxed/simple;
	bh=1iKtFGpcJr1Q7OkDrwBWe2I0O9hnUxWhEl4YMsThNWg=;
	h=From:Date:To:CC:Message-ID:Subject:Content-Type:MIME-Version; b=HMkBTIGaKjrvpkU+0g/jqmf36tKcmJdwgXfAKw646niGx+Tyt8mPR/FZI4QkKVIYpKgAPlNHJVxPa7/cgMb9gdJqJHRMOWOymJlEo1k1x8f6oPtxMavySzdkbZwvGjIAh9oKmjtM8TomTIqjEl5nK0Bdjx9vtxcigFlkpm7ZPfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9IZnNSC; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9IZnNSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770333578; x=1801869578;
  h=from:date:to:cc:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=1iKtFGpcJr1Q7OkDrwBWe2I0O9hnUxWhEl4YMsThNWg=;
  b=B9IZnNSCxWV4iw94/y8GujcHyTFK66n2jBl2iTutQByO4TefsTFJpxrG
   Fosxuf2rV/tavgwaHZLBGcNIuuVFMBHQ+GAe/J2BftHJddKmYSmnV0gZQ
   xsWv8TnP5Qhb6gg+bmvh293ugPB5ZlukYOmXVqTQA1/8EIU2KopUfU8Kg
   c7ZDn43DE20I/EXSH8cf1NGCwkipYvCw92+jlAA9rqv4QHyVOdHlVDPM7
   1TTVHkMlYu/kuleVFmERGSSnCgmygdcb0X1E22alq6VfBwVMVQY9QEcAD
   sk6/5Qp6g8oju8pIWD2f/JT2nMRYVF9rGsouJ/rocs/dg6e77AqEBQ28d
   Q==;
X-CSE-ConnectionGUID: DjFMu5aKSWOHxpqTCfn0VQ==
X-CSE-MsgGUID: vXtmxdp0Qk27zB+00vCfIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82657325"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="82657325"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 15:19:38 -0800
X-CSE-ConnectionGUID: mtzdHwUYSc2Hnj0wzTPecQ==
X-CSE-MsgGUID: 9cAGXn25QR2b5Cn8JuM3ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210496481"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 15:19:38 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 15:19:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 15:19:37 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 15:19:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/VDTOmu2iLGrP9JSHlG+M94TOhjfyV+alWSRQLBN+o1lQXb1kKFvqpV2jGZfCp3fLUb7lQU1G6Yx0Woaxxn0j1oF+wgZ7bNXvXYDw7Ub0cGmSX6A3EI+Wn+l5VE8tVgofL27lMgkAuZmnZWj5uloySqoqU89DahoWKJcQOWXLYiyAaBBh0DbMPLc5/PIJlb9vUjLVhLincWm5T7lJ6W1KZDhcFc74nbmDi+fqtnUb7df3FgT+SJn+Z2iLHwiDf37qjWI3FQe+u1WvvjMSOfUvCZzk5aVaoIhVr25/FT1u523yQijR/WKHVcy2MMgi1SxdNLZcgPKb1UP38/lnM4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NQP1tx2eEPxpfV3oeDAZAhege+Fo3B56YSAv5n50ww=;
 b=rdZmX12QWSJj8aoCCJeHPJkmjdjH3g1Wwqde5uGKPkFM55Pw7jES6RWF8blqJdyXuLTQvbyMLwSBamH5mVps6d/4BFvcpS5O/X+5carDipDCzM5leoJ1h1rh49pWwN/dMS++QomRJ/YCnfnCYInlEAkFLwvotyOQeyhqhmv0agmNGnvzZwZ7nT3+AYOPSiq85kO6iBKU3R3IZdpoiXQ4YOpG87g3rrPE6T1KLSxy7unKyRuYLDG+CcumpHK771AUkVaBBjNHttuwSjoeT83tLf9tFAlXaCOieLcOHtS7IcwSHzeF8UBA1SueyJztr55+qnwhRE5CL1lEzjkcfZVLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA3PR11MB9328.namprd11.prod.outlook.com (2603:10b6:208:579::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 5 Feb
 2026 23:19:34 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 23:19:34 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 5 Feb 2026 15:19:33 -0800
To: <linux-coco@lists.linux.dev>
CC: <david.quigley@intel.com>, <mathieu.poirier@linaro.org>
Message-ID: <6985258510555_68d31001e@dwillia2-mobl4.notmuch>
Subject: CCC TEE I/O Meeting Agenda for February 5th at 8pm (PST)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA3PR11MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3239c3c4-29aa-4388-56fa-08de650d0604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1VGOFZ0eHZRZU1iTGZjZWZrRUR0WGhRRHczOFl6dllJc2d6eWRuQjE1Tjl2?=
 =?utf-8?B?d2pnc1RVNktyK1JmYmdxVlBSRjNOOGEzQjJiOEc4YVZoa28yMnRSdW5zUFlx?=
 =?utf-8?B?dHBOZ2d0aEZna3ZhcWFsODVxU0xGVkdLZ05nTENZK2p4dWk4T3NpSTNQNVNq?=
 =?utf-8?B?VjMrUExVdkNDZksxcHZNNWJVVzljbGwwSmJVRWJIeXROdkNSRWFQL241U3h4?=
 =?utf-8?B?UkJKczN4UW5EOGY3bWRFcElHUHNJYUU0Tmd0ZWh4S2dabWNLdnIzQTBBVUdl?=
 =?utf-8?B?WmJreGo0MzdsMndBc1VWb0c1ZEpoa0xWeHB3NFlkdlRUbE9leHgzbStqVW9h?=
 =?utf-8?B?RFRQejU0VHorSXdWdTVhSEJzR0J5UFgyVFpUNUdJZUVTTHFrRXE3UkpQUnJ4?=
 =?utf-8?B?M3ZNaUxyWnVrWTRjQ1ZmMlRaRlk0THA3ZkZNK1pBeU13VytxQndzVDZSY01K?=
 =?utf-8?B?UW90TTF1dEphMVN3OGc4dW15SEYxNnM5WHRGeWlhcitrS1QrU0svWVRjQU5x?=
 =?utf-8?B?M0gxaE5rOHdXdTZtRmE5REs5OTdqZjh6WmtrK3AxdHU3RTY0Y1lwdWtRT0pq?=
 =?utf-8?B?cGhTKzRaQW5qNkpxeFVhRGE0WmFkQTVJQzd2TFAvZVlIWGRaTFByTjVuKy91?=
 =?utf-8?B?U2FwaTVuU2QvVG40UDV2dHZaWmp3c1ZUOGhmd3ZPbHp1THVqS1RxZy8yb3FH?=
 =?utf-8?B?U0Ezb0dMbjBZZDJLaU1nNlN6TnBMVFJWZDE3MzdYa3JjUDN4eHN5czVCMGk2?=
 =?utf-8?B?NUlPbDdFWUlidndjR1l1cUVYU2pNNElCR1IrcUtLQVgzb2h2LzBWTFA0elEy?=
 =?utf-8?B?UnZ4YnBuQURjZHhkQ1hDUXQraVREZ2hRVC84UGJEeUgzeWYxWmdBbThveENK?=
 =?utf-8?B?WXdxM2VBZFA3Q0Z0Y0FzNzkzYTNZSkJiTEV0VzNqdDEwTXJ0TnJDNEdiOEdx?=
 =?utf-8?B?T1BIZk1xY3EwV3BIaUFhenB0MEgrQ2krL0ZnQStLeHRJVkl5bGlSNTdESHZY?=
 =?utf-8?B?RDdaMEViRjRMUWJBdnJTc0ZBN21NZm1mMFRTZHpUMFcrTDZTN3lHNm1XRng4?=
 =?utf-8?B?MlRPT0ZnREgvbFhBaFJYd1cvc3pxbDZJMXFWc3Z2QlVYNmZ6d1RYQUdiWDNN?=
 =?utf-8?B?a2lGUEpZenpPZTdvUEhMdEVMNklZVVNRRXc5MjhLNEtGV0duYmZNUDIvUktm?=
 =?utf-8?B?T3BOdEl5V0tKZWcvem5SRS9jOFMxd2NRU0lOalVwZHV6eVVPa2R2bVlXT2Jq?=
 =?utf-8?B?Q25SWTBtNHhhaHVqSStOUFlGMXdQQU1icUZVMlJCMUVMQkpvSm94dmx6SzVB?=
 =?utf-8?B?ZUUvMnJCb1h1dUUreG1pSzBma2I2QUE4OVF3d2Uwdm9PaUxVaGNDWHgvQS9I?=
 =?utf-8?B?R1RSY3BtT1FJdEhLQVRvTzV2eHN3bmxMSG5UVnN4WjdNNEJDeHAwOE9WOUtB?=
 =?utf-8?B?QmdnTGlIUlJpcVhPYUhaOWdaNm5UZTdPK2hYRFIvQVI1OFJvQ3N6WmxwNUxM?=
 =?utf-8?B?bUtUeG1HbGpKUzNZVVlZZksrdGNqeThId3dodlorTnZqRTBGSTJXbEFzczRO?=
 =?utf-8?B?dml1VmtadTI2dHdONWp6Q3NnTGVJazRsS3JoQ3IwYjdQNENVcTFoU1BhSWt4?=
 =?utf-8?B?STQ5UVEzWVNnU3pLUDU2UGFHSUZkcXJ4Zy9CalFjcWFIRHZJNUxQV0hKeTc5?=
 =?utf-8?B?OXordmJJREtaWDZ3eE5tMjhKTmJaR3l0bi9KNkxieStXd0FsMlk2VHJGTGFW?=
 =?utf-8?B?TE1POG1yMStxM3NndEFDcDFQRmpZMkdqS2tPN3dSWW9JMXA0VEREWGFDYWtj?=
 =?utf-8?B?bzRJWHJMby9YUUs0SnlDbTQ3UmRBT0dlckQvK1cyZm5LMGFjU2wzdXhJYVhq?=
 =?utf-8?B?WDcza1oxS21aclR5N05Td1RqbXVGZTR6d0djbDFwblpZU3VYdGdhSVpHVHdh?=
 =?utf-8?B?aUo4b0dpRE1SUmlPT3NjYmliUTFpbmJKb1pVNUlFSzRNc3RySjRoTGh3bXRr?=
 =?utf-8?B?V2tCK3hBcmtBampGTHI3QmFYNHJLR0hqZWJVODZUUU9BblozQ09zUitJVE1p?=
 =?utf-8?B?L3d1QlgxZTQweSsyVmoySEd2VlBmQ0VJMEZXS3k4YWxhdng5Yko3UkJYNzF2?=
 =?utf-8?Q?c5R38jnWzgyeeRlAR488r0Qhf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNUZHkvWEEwdUFSUThLZlhyd0NNeWFhWXNRVERGK3lIcEFJVExGYmhTY0R4?=
 =?utf-8?B?NWI0L1NsSjZNNUEzNjNMQTZtbWNLUDBJbXhiUnFwR21acWptelRSTXkzaUFJ?=
 =?utf-8?B?dVN3NzJFYUV3N0dMdTBOL2QwR2lHZVFzZFp2cTNVMjJFQ0p0VjRuTGlJMVFI?=
 =?utf-8?B?ZFNrRElBM3lRRjJmdVhHNjBGTlVmWGFlZjBpRnBCT0h0bmZrWEFhWTEybzFy?=
 =?utf-8?B?ZzRHTlVRT0RTekJzN3NvaUUzOTBBeURQditqVWV5Ny96cWMycFd0NCtFNTBR?=
 =?utf-8?B?amFieTdMdzhPMmFqRzRsZzNsRkI5OTBoNjhXREs2cUV4dEZlRnNvK01ETEFF?=
 =?utf-8?B?QVJ2dDQzN0E5SzgrblVXYVVnSjgyclB4VkdCTnF0bEVaV0k2RDZTbkdEdFYx?=
 =?utf-8?B?aDBxWGZOVUlUQnRTT1lxQTNRODNNN01UU3NkOXNxUkJBanI4c1YzcUpkV1pJ?=
 =?utf-8?B?VUhjdTNxa1FJT1k3WmhTNExydXkvT0duWDdqYUxYWDZvSzlIbjFQK090bmsr?=
 =?utf-8?B?R1g4WnUwekJJNnJIaDd2NFBSL3ljdHc3eXVmZU5qYWNYYkt0RExMRDIzRFJ3?=
 =?utf-8?B?WmF2ZGVzRUhBQkhxVXhEVzFTWFJhUVVKU1VKY3FZd2Z6N2V0azBVUnRWZ0h6?=
 =?utf-8?B?OUl5a1ptRCtMS0NtekEyN3RTNWpzbFp3cGtLRU5yUEE5bVlPcURMRVpuU04v?=
 =?utf-8?B?RW5JMXM3aE5mYTRjVTFOcFM5TGJXc1RQUWI5SjZBZFhRR01PZmFRV0hOMnBj?=
 =?utf-8?B?L2FTbWU3a0xhTW9GLytkaERQNTkzUlorc0hiRHk0YWpJa0F3V0EyT2dJcmYz?=
 =?utf-8?B?Q3dReFVsQXFVblU4U3JIb0dUU0d1T2NMSVhYT3Q4cEVCTnpYRHg2L2pzRnh4?=
 =?utf-8?B?eERnNzBFTVNCR3hXam1RNTIwM3BzZHl1dThCK05JeHFyVjhlOWtQemNsUmox?=
 =?utf-8?B?OEZxc3lsOHFWN2taZXFGNXBVUmpMZGJZY1l4cXVpUEFBdWsycXUyaHdDRklW?=
 =?utf-8?B?aHppTDB5dURVaVhrTnV3cDVDamtuWjM3bUk1VE5UTEJhUjRDUXZoTTB1WkUv?=
 =?utf-8?B?VXRPd0pqbFVSeVY3b2E2RjhUUWFaYkgwbmt4NUxyNk9XRGFaWC9CSGtXUW9m?=
 =?utf-8?B?Y1hySGxscE83bWNZNzh0blVubEhvL2NJTWVOQ3lqWnU5cUpVb04wWFRZaC9D?=
 =?utf-8?B?bHVVcnJMZ2dyNjVYMEd4azI5cEV4OTFQUmZlRGtFSkREMndYNkp2SEVKY2NZ?=
 =?utf-8?B?OVlONVFxbzN3c0FZSi9nbEVGRXo4aHRBdE9jSUUwMU45a1VEQlYwSDRIMFlO?=
 =?utf-8?B?VHJmbXJCWWQ4S1d3bTFESld3RHBia3pXZVl2MzVhc3BjZjZ3c2dvcHVTekdn?=
 =?utf-8?B?azZhNnpGd2RKcnFZdTRVSXdpTUk1MHZVR1ZNQ1kxb1Z0dG5zdnM0dlpQUWlV?=
 =?utf-8?B?UVlVMHIrVFJVc29MVHc2MGxQZGVseXlKd3ppMCtWUG85QmZQa1Z5aVNuZkV4?=
 =?utf-8?B?a1V6ZlJpTzdTRzhkaGg1RXNHUndWVm4xUzVvMndRTk5QN0pTK2RuYXJYVS9U?=
 =?utf-8?B?eUY2d1F6bUdTRmtJNEZzY1B1Y0wyTzVKRnJMNzdiZjRMMFdubFR5Sjg2d1F3?=
 =?utf-8?B?OWNabk1SczFHV1gwTmd3UTVmemllNDZhSVNSQ1Z5ZVVDdzBYV2gvMEhFRHdK?=
 =?utf-8?B?LzQ5U2FqcFlEdk1HV0ZQenM1QlFveVdRR2FKQmdvTnB5aVBvdW1VaWdxVGd5?=
 =?utf-8?B?WGNUbEZGdWdqZnF0MTFYck1MUVJvSVd4OFBqZEJPMTN1V1dpZ2ZsdGpzSTJX?=
 =?utf-8?B?TUM2SFArOGlhNlBkM3ZiZFdHZ095UERsY3FEcHQ3a1RwOGRCejVSMlJEOG5o?=
 =?utf-8?B?UW93YUM4eXV3b09yNWxzNXNjelVyamVZYWhmeks1YjVMdFJrRktVSTJ4S0tV?=
 =?utf-8?B?OUZYblZXcHEwdFpDdDV2T3hKeFRnSS9TSFhvMU1BR3FkR0NBbWdsOXp6eU9v?=
 =?utf-8?B?QkY4VnRRNURWR2ZqT0d3WjI0SFBYeURNRFZCRWtMN2FZMHk2OVU3Yzd5K1B4?=
 =?utf-8?B?Y25NVDlnVEJEbkV5NUMwSEdEdTB1amRCcXRsQmc0NmJTQytkREp6K1QwRHVo?=
 =?utf-8?B?VmxLZlJwYzEvNlg2aFkxUmxmcjN1Ynlyc0pMTHpvRG5ZZXBJYU04a2owQmlG?=
 =?utf-8?B?ZDByRENSVjNoYkRhbVJUWGJqMlRHOUhZSGpNOU16SzNTVlVzWVFrall1OWdX?=
 =?utf-8?B?RUlhWmJDb2pFOVNyS3Z0Um1OejJJdmhnWjAycjhmT3dYZnlmSnNFNU1VQXhw?=
 =?utf-8?B?S25nUXV3K0N3VXBwRXI0QzA0c2VTMHNaT1NpaDhlZ05IakwvOFk3NlIrdFIr?=
 =?utf-8?Q?PHRXHxa53HyLONjI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3239c3c4-29aa-4388-56fa-08de650d0604
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 23:19:34.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3jkAL0XZWm5P9GIjUmkqwPsFiWFr7Qmghndgm/dJ/SdpL+6U0YGXv3Q3+za6S+8kRbsXJqybVz8/PJPiQk6H+yu4X7Ji2wguR94dAsXgJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9328
X-OriginatorOrg: intel.com

The meeting [1] is on for tonight. I have a late breaking conflict and
will need to leave early. Please respond to this message with topics for
opens. I have asked Dave Quigley to chair in my absence. We may not get
to the "IOMMU setup consensus" topic depending on the evidence
collection ABI discussion. The other topics are short.

Agenda:
- Opens
- PCI power management vs DOE power management vs TSM operations
  - See pm_runtime_resume_and_get() usage [2]
- What's cooking for devsec-20260205?
- Next steps for device evidence collection ABI (Dave and Mathieu)
- IOMMU setup consensus (continued from Discord conversation [3])

[1]: Registration: https://zoom-lfx.platform.linuxfoundation.org/meeting/93219227394?password=80705486-101a-4e19-8f11-0baaf92104be&invite=true
[2]: https://github.com/l1k/linux/commit/f8343c60e130
[3]: https://discord.com/channels/1123803528377413762/1468465977376378910
