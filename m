Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692AEC147
	for <linux-coco@lists.linux.dev>; Fri,  9 May 2025 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746752473; cv=fail; b=UBcUwq8QSM5v+pOWjvWC0bFagTLgOaVUaBDdQBw4Kdbe8c3P7bjDWNxEY70PyxhN/Nswh+TStYCPHGgJKjF+80ZhIoil9vytJ4sNDhKky3Z2lRWKqLx9RKfz5nDjBJKcAcSOzD+8TEPeqETHguopa0vcMFuRlAiWJl6tuDCgg0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746752473; c=relaxed/simple;
	bh=e8uEDohBdTmPRF/uCfZgiZ567/KkD6d1GOvwxVNUve0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OdbtBS6YYR/ghvZYXIyduNKwr9dIcjaUoCENogRdFGhHqq57ok8/i5HrKUlo8NHGga8LA87JUvId0h6Zk098ORdP8y5HcD5BDrcPj5bhG9V8OkSSf2aqvZ3xCB+MSzsi2dW2ZwxWxFD3qlXtyF+dQ3/4iIA0wO7U98w3dkDrkk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1lSqDRF; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1lSqDRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746752472; x=1778288472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=e8uEDohBdTmPRF/uCfZgiZ567/KkD6d1GOvwxVNUve0=;
  b=d1lSqDRFeWAZ2Xm+S7Pu+qH0NzpsojltBsmy42GAsLHsFy5TDcm0Omui
   5KrK9FqPXLYS4seasFzIM/i+4ReZ20PIlnc8459uN+uisrjo1Calnxt4R
   XU2uYvWT+uAN95lbMdMjUMi6vPUFUwgzZeDAhdw0lMNO8JieTlOgJE96T
   gBa0qZtwUKkJ2u3e/8YaLH1l+6gXDHpT5BV8Kp/bXUMuqlVT+LZMkR/Tw
   P4o21pi1laRMgL/rrpCRz0XRiudsnJwzXajB1+HbV+xP6amaC5b2ZP4fE
   94qdlhcJh7VUj6FmAC7RLicXUhWYG7PLpE4OSzITB+zWQt5+zyK8eNenz
   w==;
X-CSE-ConnectionGUID: ehYEP1KES7yhBdLi3olrdg==
X-CSE-MsgGUID: Tje4iJ6XRwaQcJi7SksN4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="71077281"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="71077281"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:01:11 -0700
X-CSE-ConnectionGUID: VygnZYDwRdq8Jo6/fon6Ww==
X-CSE-MsgGUID: Mir7NF/1ShKX2ofoeHy7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136985575"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 18:01:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 18:01:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 18:01:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 18:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBg9OVYX+3ZOc92Pc6J1d5CL+2taqlaAXoXha/bddn8zMsnVeJ8roJvTCms/vhQWYiwny28m/N/xEVS7u36frObPEJMYlmMZSwcCSxqMG+9ihg+6CWqJcl4VY/s5w8ui31hZ+XRqmaRjQth2p8rhOmJkbGEV0J9YZQiBtDTJzNsLkhtLaskSY5dtXHgHO7Urj0t9XkKLZMgztVA1q88IZS3zgS5BSvop8LZGhmMFy+NvpB6CGRL1frLcfMJzO2l6TVFFk1uODHgSOWTvFMI5Xo7GN75yZwRXoe5huHkvZtPaMDsriiocbR5ImZYCLpnMFS5jPBZDH1gSkwm5+TnfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVvnfS8Eiy1zwe+wk0BgxdtQriFhrDNObiiI2pCn044=;
 b=TsSG6HxnIQTW16U6627RMYwLzpKZfaggpq4T2g0+oCYctRr312GsPtU+PQ6ohGi+gCoxL5Z+YYyWCX4pqQzSkGt5zRJWe/8Apb/UWZzOPt23yIOg8K9ai+AO7XgVcTTkIYzedLJKenc+LcLF6ZKJNbjd1nm8Xc1n+TrMsd10oyosS4DSxbzP2m88u4USot0Te08cHluaOQfD/zTpfXNLrSlQzJxDUFHqOvxTWiNMrZIuALjwC0VUbtMCncXY6BmmDZbXtFHW0YGnfaShHfxgHETcBX9xCB2Ckm9/gT3rO33HzwPQQynXSmbR8+7T/7Qr2c76EcDDu+HiJy6XaOnjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Fri, 9 May
 2025 01:01:07 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 01:01:07 +0000
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
CC: <cedric.xing@intel.com>
Subject: [PATCH v7 1/7] tsm-mr: Add TVM Measurement Register support
Date: Thu, 8 May 2025 18:01:04 -0700
Message-ID: <20250509010104.669669-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.com>
References: <20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6a855b-cad6-4cd3-0e4e-08dd8e94fad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wODFGJNQbK4mn9ZGiKQzKyEQCMIUhWtjtwYoYuAW8jB8Dr5l+nKszXX+ykFr?=
 =?us-ascii?Q?5iS6lKs1YrM+lf+h42rVoJeQgegKlv/pn31ZE0qknTn6SNETgJ5JT19IaUi2?=
 =?us-ascii?Q?SOG33xroYD7OF3AKMlXDFuICWs9eLpe7pCxaYqq8YG3fSyBf2nuETZzTauxk?=
 =?us-ascii?Q?LDjWoXcW7UaxrQZ5cTHEXCUnIdyTNimLYq1KgKMG8mO/sHFME7x98xHo1DMr?=
 =?us-ascii?Q?1rUNi+LfDU2L3yRhLy3Mej/9CZHkuTxjINHdeirsG3Cjvxu3wnTDkGN7cbYv?=
 =?us-ascii?Q?8fWyjnh0RLSpPLFrreLMRAEmRQOgPnWTVAUL8IsIibnUtuWvxFPuQw3cC2mb?=
 =?us-ascii?Q?oS53TZhnlq3vB1SR0lBMavwzWArq+WW//yybekSyuxMuY9ErWzx6gxKnhOoY?=
 =?us-ascii?Q?pcN7XSmDmIzzapMFpY8D6oBhZUynP3XQe7EfcejxbuliCSKFWK+YkKpFp5Zz?=
 =?us-ascii?Q?ZR1egM2j1BZ+9FxqkCZevLZ1CBdR9XH56Pzf07CjrutRTfrvkxsN7/GCNpcu?=
 =?us-ascii?Q?MKXzA1eT4m0jWwk0w4+H+cdcbTSrjKrbR88GcqnlKDOVRtMTDt8zjIHWNIxG?=
 =?us-ascii?Q?mwghbypgqOonkQHfXvnRSBjfd/p3CZjYmPG6vWC4zcQoxH8QAO4tMbuPxmEC?=
 =?us-ascii?Q?ZsPblu585l74r1kayZQm/F9OvryVogFfoBccmgxNk04ydr70+OecdKal8nq+?=
 =?us-ascii?Q?4R0zFNbBLJCwbSSHzFg1C6ReCg3nz1FxdD+0JG6F7TllXL4dqRZdj8Zmqr1O?=
 =?us-ascii?Q?FaCKAe5gEQDXOvL3ywNzs2JryQieQ4dW6wyqvIX7DMXbMLmq7TLJbXHyBo47?=
 =?us-ascii?Q?cL9LN2qPoiDsGTw1EdHyMYzFJLm5L2Nr9dek8lMf/3sUCTF4Fwn4rBHHiM2v?=
 =?us-ascii?Q?x1P7Ro5AS3R6j7NsXbyFzbMt+pKuXRzyE59nn5GiTgHCYA+TFFMAJJ5YKdYm?=
 =?us-ascii?Q?8wLgbHB5du03l0NhYbknH93mUsE7pEy+YhcbFEmopfTOT0KvQ0Q7f1Pictvl?=
 =?us-ascii?Q?P/aGLaRxZWJR/YD/sGWgu6JQrPWTyH4taXJqK3bsJRa0bncysiZGE2BQx7YU?=
 =?us-ascii?Q?njV6xlttHHhSVyapDQBLDb0HzhseeTKuTXV7SooEOrrW8rdY+Nc5+qVLHMSF?=
 =?us-ascii?Q?PShwBj0D/dmPMcVwHbSNYCdxgWf7cdhPVw1Uo1SWIEoqcYjLRrLDZH3Ip24Z?=
 =?us-ascii?Q?v7wUp6LYP+CbO0D+g+29gx72HD55H5fOxymkd12cQkPOZ3IoxHqdYB5J3/Cr?=
 =?us-ascii?Q?dYArKY0wZSttQ/CHZWwW9k9bFa97E9tN/xWp54Coi/Q5U4McP5pxrFu3f0Jv?=
 =?us-ascii?Q?9iCV8XweSpzVgvt3gueVTi9v6Plz+FarU3pwoELqVbPB4RT2pMD/OFZM/ftf?=
 =?us-ascii?Q?m/cSb8rXMSY2YDAUrFZrJXYs+nKen5RJCEJxMwuI+Q5a1qTCHOiE1488ey2I?=
 =?us-ascii?Q?7XemHcgLnR4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEvHi3fU3+SlO/vQpUxlebHiO1KyDm4zYqDKzmvY88D+pG1qMlRVCyzDOpmm?=
 =?us-ascii?Q?QZ+cgEyLXC2M/crgMQN7tivWFqmRTG1Eh7W+ALMZYH06f+5OiMXSb8Uz/dxv?=
 =?us-ascii?Q?TlwJa5tTR/+IplMQw51zkF/uN2QDThy0lrIIAfV3M5pwe7kLc5Wxw8AgMmUU?=
 =?us-ascii?Q?lthhVzEBbeNvOQ1pysP71iZ57d55U+9w9RbuSNqJStf1+sJtusfW1TRwtZ+w?=
 =?us-ascii?Q?3A5/mzbxQ4Ta9XxK0n/0xtrYCTXxMbJ4RoUVq87/MdyZncF+Mg49flBc4d1O?=
 =?us-ascii?Q?L+QSfIs94O78on0c1cxWjJbxPTDWAUtMwB2sHZ+YY7awjdaw7GpAnNZafMtK?=
 =?us-ascii?Q?kQP1j5gA8b2uwArIvvk5SZEs95i9lgncdUjPCQPdXX6x3k+SwvjMtj4rrIJP?=
 =?us-ascii?Q?JDmqiNABS6URcOYN9zodHAzjt+2TlfMPfJ6rhyiNCVoj1ACD9rWbPZXOU7zk?=
 =?us-ascii?Q?W5CKDj+uHcvoQGaVr6/2cwu24QM7Om7O41OE2A8MBp/PVKx1uQimKPrUhUJV?=
 =?us-ascii?Q?z3SHCyllSxxhSeXPZMEoAkyCQt2BWjVgu1OKYz+mBpIkzn8KecGchtXnguDW?=
 =?us-ascii?Q?DvOTUKlSt9DIaSOA5SXqSiMMQ0g0D2mM+ISfmmL8kRDYSS4Nupj13ycozm37?=
 =?us-ascii?Q?Qn/nTsqLLZS/wB+WtzQN1pAZamgByvQ4FQlSOfhMy+W20oDBYmbc0SfNp2Sh?=
 =?us-ascii?Q?ciE+DW0qg746kRjYGwb8Txthvk2DCXuZSe5Mx7iA2LeN3Inpd4RZYOLqgyBp?=
 =?us-ascii?Q?6Kmt78eIJhdRqkrSv7G/umhD+s8fZo475Ynueba63VSxNIWvW3lYxsirX11u?=
 =?us-ascii?Q?ryuWMqDD80bd7KX3IdSu4tbuof7vhczSRHYAM8cK1YHnZMZSIh2yys6DCwk4?=
 =?us-ascii?Q?boqbUbPIXRGcY8O/eN91ZWFPjAJ47xu9RD897sHW6gdQfJuvNM3DLuolt97G?=
 =?us-ascii?Q?LOW5v4skeRVfogre64BogiAg7+V0yMs/kPau0qxH2e3clA08kr6t2ZXauoo9?=
 =?us-ascii?Q?YK5Ahii7+GWVW4y+8xQxSqEVM9HJgv1OjY5eJe9WX8ZfcB0y0ANs3gvSIaEB?=
 =?us-ascii?Q?aYGR8k0wic7GLb18A3FBx6hl05iF78ZPdPJLKmUoBUitAYCsI2tQiPp7VHJQ?=
 =?us-ascii?Q?TX/sv0QvEBRKNvez1nuOHDBa3AGl6c7UxzKrKcakFSSzt/FT2EFR2q51C7rz?=
 =?us-ascii?Q?xNJYN11cCZyn12PLTkFpxdN8NI9/vP+I/2xfNgAL/OPmFtq36ByOuHy6PaDM?=
 =?us-ascii?Q?qWUoVPKX9H0VIqiU5Ppf9EqYM73NBP98B1Myk3c4DEw4lEn18QPq2jSszaiu?=
 =?us-ascii?Q?Pilzz9UuMNMUVJSZFqBV8w4sRIy+AKbHst3xkBMBZo8VreRUlYRTNChJ0aiW?=
 =?us-ascii?Q?DkRoAMqrFoaVn5oPmJ7/uzdM/AOBxRS/wbJ89XcPSzgIwEkhKLDxxjvyr3pF?=
 =?us-ascii?Q?fYU7etm0ZjUwg+jat/rZw4v5CFwFCUO4LpF1Wj6qVQtyd8/vM5gGwqStke2f?=
 =?us-ascii?Q?YbybiwB4kTydsyvAITMtZzpPiRJLzkjUk9fFg7sfvbTKKOoIUHX7S0nlhorO?=
 =?us-ascii?Q?UPZQwh00j2cDc/qjBedJFhrR4LKryFaH9JYypgY+jicoh/5DzRkCeohPMQfp?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6a855b-cad6-4cd3-0e4e-08dd8e94fad8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 01:01:07.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEnjhBs8ZKwHpV0yQ4ScPgfhXnt6cY4H6nsq867yrNzruvka/7bvSG8IvO6PhfLTpPTg0jkYeBVFnRZJpYLfv1/rEXjOtdYXjD6HeFjjGA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
X-OriginatorOrg: intel.com

From: Cedric Xing <cedric.xing@intel.com>

Introduce new TSM Measurement helper library (tsm-mr) for TVM guest drivers
to expose MRs (Measurement Registers) as sysfs attributes, with Crypto
Agility support.

Add the following new APIs (see include/linux/tsm-mr.h for details):

- tsm_mr_create_attribute_group(): Take on input a `struct
  tsm_measurements` instance, which includes one `struct
  tsm_measurement_register` per MR with properties like `TSM_MR_F_READABLE`
  and `TSM_MR_F_WRITABLE`, to determine the supported operations and create
  the sysfs attributes accordingly. On success, return a `struct
  attribute_group` instance that will typically be included by the guest
  driver into `miscdevice.groups` before calling misc_register().

- tsm_mr_free_attribute_group(): Free the memory allocated to the attrubute
  group returned by tsm_mr_create_attribute_group().

tsm_mr_create_attribute_group() creates one attribute for each MR, with
names following this pattern:

        MRNAME[:HASH]

- MRNAME - Placeholder for the MR name, as specified by
  `tsm_measurement_register.mr_name`.
- :HASH - Optional suffix indicating the hash algorithm associated with
  this MR, as specified by `tsm_measurement_register.mr_hash`.

Support Crypto Agility by allowing multiple definitions of the same MR
(i.e., with the same `mr_name`) with distinct HASH algorithms.

NOTE: Crypto Agility, introduced in TPM 2.0, allows new hash algorithms to
be introduced without breaking compatibility with applications using older
algorithms. CC architectures may face the same challenge in the future,
needing new hashes for security while retaining compatibility with older
hashes, hence the need for Crypto Agility.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
[djbw: fixup bin_attr const conflict]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes since v6
* fix a linux-next build where 'struct attribute_group' constifys
  bin_attr (sfr)

 Documentation/driver-api/coco/index.rst       |  12 +
 .../driver-api/coco/measurement-registers.rst |  12 +
 Documentation/driver-api/index.rst            |   1 +
 MAINTAINERS                                   |   5 +-
 drivers/virt/coco/Kconfig                     |   5 +
 drivers/virt/coco/Makefile                    |   1 +
 drivers/virt/coco/tsm-mr.c                    | 251 ++++++++++++++++++
 include/linux/tsm-mr.h                        |  89 +++++++
 include/trace/events/tsm_mr.h                 |  80 ++++++
 9 files changed, 454 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/driver-api/coco/index.rst
 create mode 100644 Documentation/driver-api/coco/measurement-registers.rst
 create mode 100644 drivers/virt/coco/tsm-mr.c
 create mode 100644 include/linux/tsm-mr.h
 create mode 100644 include/trace/events/tsm_mr.h

diff --git a/Documentation/driver-api/coco/index.rst b/Documentation/driver-api/coco/index.rst
new file mode 100644
index 000000000000..af9f08ca0cfd
--- /dev/null
+++ b/Documentation/driver-api/coco/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Confidential Computing
+======================
+
+.. toctree::
+   :maxdepth: 1
+
+   measurement-registers
+
+.. only::  subproject and html
diff --git a/Documentation/driver-api/coco/measurement-registers.rst b/Documentation/driver-api/coco/measurement-registers.rst
new file mode 100644
index 000000000000..cef85945a9a7
--- /dev/null
+++ b/Documentation/driver-api/coco/measurement-registers.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+=====================
+Measurement Registers
+=====================
+
+.. kernel-doc:: include/linux/tsm-mr.h
+   :internal:
+
+.. kernel-doc:: drivers/virt/coco/tsm-mr.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 16e2c4ec3c01..3e2a270bd828 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -81,6 +81,7 @@ Subsystem-specific APIs
    acpi/index
    backlight/lp855x-driver.rst
    clk
+   coco/index
    console
    crypto/index
    dmaengine/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..5d36823d26b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24648,8 +24648,9 @@ M:	Dan Williams <dan.j.williams@intel.com>
 L:	linux-coco@lists.linux.dev
 S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm
-F:	drivers/virt/coco/tsm.c
-F:	include/linux/tsm.h
+F:	Documentation/driver-api/coco/
+F:	drivers/virt/coco/tsm*.c
+F:	include/linux/tsm*.h
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
index ff869d883d95..737106d5dcbc 100644
--- a/drivers/virt/coco/Kconfig
+++ b/drivers/virt/coco/Kconfig
@@ -7,6 +7,11 @@ config TSM_REPORTS
 	select CONFIGFS_FS
 	tristate
 
+config TSM_MEASUREMENTS
+	select CRYPTO_HASH_INFO
+	select CRYPTO
+	bool
+
 source "drivers/virt/coco/efi_secret/Kconfig"
 
 source "drivers/virt/coco/pkvm-guest/Kconfig"
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
index c3d07cfc087e..eb6ec5c1d2e1 100644
--- a/drivers/virt/coco/Makefile
+++ b/drivers/virt/coco/Makefile
@@ -3,6 +3,7 @@
 # Confidential computing related collateral
 #
 obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
+obj-$(CONFIG_TSM_MEASUREMENTS)	+= tsm-mr.o
 obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
 obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
 obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
new file mode 100644
index 000000000000..7fe90fae2738
--- /dev/null
+++ b/drivers/virt/coco/tsm-mr.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024-2025 Intel Corporation. All rights reserved. */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/tsm_mr.h>
+
+/*
+ * struct tm_context - contains everything necessary to implement sysfs
+ * attributes for MRs.
+ * @rwsem: protects the MR cache from concurrent access.
+ * @agrp: contains all MR attributes created by tsm_mr_create_attribute_group().
+ * @tm: input to tsm_mr_create_attribute_group() containing MR definitions/ops.
+ * @in_sync: %true if MR cache is up-to-date.
+ * @mrs: array of &struct bin_attribute, one for each MR.
+ *
+ * This internal structure contains everything needed to implement
+ * tm_digest_read() and tm_digest_write().
+ *
+ * Given tm->refresh() is potentially expensive, tm_digest_read() caches MR
+ * values and calls tm->refresh() only when necessary. Only live MRs (i.e., with
+ * %TSM_MR_F_LIVE set) can trigger tm->refresh(), while others are assumed to
+ * retain their values from the last tm->write(). @in_sync tracks if there have
+ * been tm->write() calls since the last tm->refresh(). That is, tm->refresh()
+ * will be called only when a live MR is being read and the cache is stale
+ * (@in_sync is %false).
+ *
+ * tm_digest_write() sets @in_sync to %false and calls tm->write(), whose
+ * semantics is arch and MR specific. Most (if not all) writable MRs support the
+ * extension semantics (i.e., tm->write() extends the input buffer into the MR).
+ */
+struct tm_context {
+	struct rw_semaphore rwsem;
+	struct attribute_group agrp;
+	const struct tsm_measurements *tm;
+	bool in_sync;
+	struct bin_attribute mrs[];
+};
+
+static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
+			      const struct bin_attribute *attr, char *buffer,
+			      loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	int rc;
+
+	ctx = attr->private;
+	rc = down_read_interruptible(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	/*
+	 * @ctx->in_sync indicates if the MR cache is stale. It is a global
+	 * instead of a per-MR flag for simplicity, as most (if not all) archs
+	 * allow reading all MRs in oneshot.
+	 *
+	 * ctx->refresh() is necessary only for LIVE MRs, while others retain
+	 * their values from their respective last ctx->write().
+	 */
+	if ((mr->mr_flags & TSM_MR_F_LIVE) && !ctx->in_sync) {
+		up_read(&ctx->rwsem);
+
+		rc = down_write_killable(&ctx->rwsem);
+		if (rc)
+			return rc;
+
+		if (!ctx->in_sync) {
+			rc = ctx->tm->refresh(ctx->tm);
+			ctx->in_sync = !rc;
+			trace_tsm_mr_refresh(mr, rc);
+		}
+
+		downgrade_write(&ctx->rwsem);
+	}
+
+	memcpy(buffer, mr->mr_value + off, count);
+	trace_tsm_mr_read(mr);
+
+	up_read(&ctx->rwsem);
+	return rc ?: count;
+}
+
+static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buffer,
+			       loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	ssize_t rc;
+
+	/* partial writes are not supported */
+	if (off != 0 || count != attr->size)
+		return -EINVAL;
+
+	ctx = attr->private;
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	rc = down_write_killable(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	rc = ctx->tm->write(ctx->tm, mr, buffer);
+
+	/* mark MR cache stale */
+	if (!rc) {
+		ctx->in_sync = false;
+		trace_tsm_mr_write(mr, buffer);
+	}
+
+	up_write(&ctx->rwsem);
+	return rc ?: count;
+}
+
+/**
+ * tsm_mr_create_attribute_group() - creates an attribute group for measurement
+ * registers (MRs)
+ * @tm: pointer to &struct tsm_measurements containing the MR definitions.
+ *
+ * This function creates attributes corresponding to the MR definitions
+ * provided by @tm->mrs.
+ *
+ * The created attributes will reference @tm and its members. The caller must
+ * not free @tm until after tsm_mr_free_attribute_group() is called.
+ *
+ * Context: Process context. May sleep due to memory allocation.
+ *
+ * Return:
+ * * On success, the pointer to a an attribute group is returned; otherwise
+ * * %-EINVAL - Invalid MR definitions.
+ * * %-ENOMEM - Out of memory.
+ */
+const struct attribute_group *
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
+{
+	size_t nlen;
+
+	if (!tm || !tm->mrs)
+		return ERR_PTR(-EINVAL);
+
+	/* aggregated length of all MR names */
+	nlen = 0;
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
+			return ERR_PTR(-EINVAL);
+
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
+			return ERR_PTR(-EINVAL);
+
+		if (!tm->mrs[i].mr_name)
+			return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			continue;
+
+		if (tm->mrs[i].mr_hash >= HASH_ALGO__LAST)
+			return ERR_PTR(-EINVAL);
+
+		/* MR sysfs attribute names have the form of MRNAME:HASH */
+		nlen += strlen(tm->mrs[i].mr_name) + 1 +
+			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
+	}
+
+	/*
+	 * @attrs and the MR name strings are combined into a single allocation
+	 * so that we don't have to free MR names one-by-one in
+	 * tsm_mr_free_attribute_group()
+	 */
+	const struct bin_attribute * const *attrs __free(kfree) =
+		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
+	struct tm_context *ctx __free(kfree) =
+		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
+	char *name, *end;
+
+	if (!ctx || !attrs)
+		return ERR_PTR(-ENOMEM);
+
+	/* @attrs is followed immediately by MR name strings */
+	name = (char *)&attrs[tm->nr_mrs + 1];
+	end = name + nlen;
+
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		/* break const for init */
+		struct bin_attribute **bas = (struct bin_attribute **)attrs;
+
+		bas[i] = &ctx->mrs[i];
+		sysfs_bin_attr_init(bas[i]);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			bas[i]->attr.name = tm->mrs[i].mr_name;
+		else if (name < end) {
+			bas[i]->attr.name = name;
+			name += snprintf(name, end - name, "%s:%s",
+					 tm->mrs[i].mr_name,
+					 hash_algo_name[tm->mrs[i].mr_hash]);
+			++name;
+		} else
+			return ERR_PTR(-EINVAL);
+
+		/* check for duplicated MR definitions */
+		for (size_t j = 0; j < i; ++j)
+			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
+				return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
+			bas[i]->attr.mode |= 0444;
+			bas[i]->read_new = tm_digest_read;
+		}
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
+			bas[i]->attr.mode |= 0200;
+			bas[i]->write_new = tm_digest_write;
+		}
+
+		bas[i]->size = tm->mrs[i].mr_size;
+		bas[i]->private = ctx;
+	}
+
+	if (name != end)
+		return ERR_PTR(-EINVAL);
+
+	init_rwsem(&ctx->rwsem);
+	ctx->agrp.name = "measurements";
+	ctx->agrp.bin_attrs = no_free_ptr(attrs);
+	ctx->tm = tm;
+	return &no_free_ptr(ctx)->agrp;
+}
+EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
+
+/**
+ * tsm_mr_free_attribute_group() - frees the attribute group returned by
+ * tsm_mr_create_attribute_group()
+ * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
+ *
+ * Context: Process context.
+ */
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
+{
+	if (!IS_ERR_OR_NULL(attr_grp)) {
+		kfree(attr_grp->bin_attrs);
+		kfree(container_of(attr_grp, struct tm_context, agrp));
+	}
+}
+EXPORT_SYMBOL_GPL(tsm_mr_free_attribute_group);
diff --git a/include/linux/tsm-mr.h b/include/linux/tsm-mr.h
new file mode 100644
index 000000000000..50a521f4ac97
--- /dev/null
+++ b/include/linux/tsm-mr.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TSM_MR_H
+#define __TSM_MR_H
+
+#include <crypto/hash_info.h>
+
+/**
+ * struct tsm_measurement_register - describes an architectural measurement
+ * register (MR)
+ * @mr_name: name of the MR
+ * @mr_value: buffer containing the current value of the MR
+ * @mr_size: size of the MR - typically the digest size of @mr_hash
+ * @mr_flags: bitwise OR of one or more flags, detailed below
+ * @mr_hash: optional hash identifier defined in include/uapi/linux/hash_info.h.
+ *
+ * A CC guest driver encloses an array of this structure in struct
+ * tsm_measurements to detail the measurement facility supported by the
+ * underlying CC hardware.
+ *
+ * @mr_name and @mr_value must stay valid until this structure is no longer in
+ * use.
+ *
+ * @mr_flags is the bitwise-OR of zero or more of the flags below.
+ *
+ * * %TSM_MR_F_READABLE - the sysfs attribute corresponding to this MR is readable.
+ * * %TSM_MR_F_WRITABLE - the sysfs attribute corresponding to this MR is writable.
+ *   The semantics is typically to extend the MR but could vary depending on the
+ *   architecture and the MR.
+ * * %TSM_MR_F_LIVE - this MR's value may differ from the last value written, so
+ *   must be read back from the underlying CC hardware/firmware.
+ * * %TSM_MR_F_RTMR - bitwise-OR of %TSM_MR_F_LIVE and %TSM_MR_F_WRITABLE.
+ * * %TSM_MR_F_NOHASH - this MR does NOT have an associated hash algorithm.
+ *   @mr_hash will be ignored when this flag is set.
+ */
+struct tsm_measurement_register {
+	const char *mr_name;
+	void *mr_value;
+	u32 mr_size;
+	u32 mr_flags;
+	enum hash_algo mr_hash;
+};
+
+#define TSM_MR_F_NOHASH 1
+#define TSM_MR_F_WRITABLE 2
+#define TSM_MR_F_READABLE 4
+#define TSM_MR_F_LIVE 8
+#define TSM_MR_F_RTMR (TSM_MR_F_LIVE | TSM_MR_F_WRITABLE)
+
+#define TSM_MR_(mr, hash)                              \
+	.mr_name = #mr, .mr_size = hash##_DIGEST_SIZE, \
+	.mr_hash = HASH_ALGO_##hash, .mr_flags = TSM_MR_F_READABLE
+
+/**
+ * struct tsm_measurements - defines the CC architecture specific measurement
+ * facility and methods for updating measurement registers (MRs)
+ * @mrs: Array of MR definitions.
+ * @nr_mrs: Number of elements in @mrs.
+ * @refresh: Callback function to load/sync all MRs from TVM hardware/firmware
+ *           into the kernel cache.
+ * @write: Callback function to write to the MR specified by the parameter @mr.
+ *         Typically, writing to an MR extends the input buffer to that MR.
+ *
+ * The @refresh callback is invoked when an MR with %TSM_MR_F_LIVE set is being
+ * read and the cache is stale. It must reload all MRs with %TSM_MR_F_LIVE set.
+ * The function parameter @tm is a pointer pointing back to this structure.
+ *
+ * The @write callback is invoked whenever an MR is being written. It takes two
+ * additional parameters besides @tm:
+ *
+ * * @mr - points to the MR (an element of @tm->mrs) being written.
+ * * @data - contains the bytes to write and whose size is @mr->mr_size.
+ *
+ * Both @refresh and @write should return 0 on success and an appropriate error
+ * code on failure.
+ */
+struct tsm_measurements {
+	const struct tsm_measurement_register *mrs;
+	size_t nr_mrs;
+	int (*refresh)(const struct tsm_measurements *tm);
+	int (*write)(const struct tsm_measurements *tm,
+		     const struct tsm_measurement_register *mr, const u8 *data);
+};
+
+const struct attribute_group *
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm);
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp);
+
+#endif
diff --git a/include/trace/events/tsm_mr.h b/include/trace/events/tsm_mr.h
new file mode 100644
index 000000000000..f40de4ad3e2d
--- /dev/null
+++ b/include/trace/events/tsm_mr.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM tsm_mr
+
+#if !defined(_TRACE_TSM_MR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_TSM_MR_H
+
+#include <linux/tracepoint.h>
+#include <linux/tsm-mr.h>
+
+TRACE_EVENT(tsm_mr_read,
+
+	TP_PROTO(const struct tsm_measurement_register *mr),
+
+	TP_ARGS(mr),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__string(hash, mr->mr_flags & TSM_MR_F_NOHASH ?
+			 "data" : hash_algo_name[mr->mr_hash])
+		__dynamic_array(u8, d, mr->mr_size)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__assign_str(hash);
+		memcpy(__get_dynamic_array(d), mr->mr_value, __get_dynamic_array_len(d));
+	),
+
+	TP_printk("[%s] %s:%s", __get_str(mr), __get_str(hash),
+		  __print_hex_str(__get_dynamic_array(d), __get_dynamic_array_len(d)))
+);
+
+TRACE_EVENT(tsm_mr_refresh,
+
+	TP_PROTO(const struct tsm_measurement_register *mr, int rc),
+
+	TP_ARGS(mr, rc),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__field(int, rc)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__entry->rc = rc;
+	),
+
+	TP_printk("[%s] %s:%d", __get_str(mr),
+		  __entry->rc ? "failed" : "succeeded", __entry->rc)
+);
+
+TRACE_EVENT(tsm_mr_write,
+
+	TP_PROTO(const struct tsm_measurement_register *mr, const u8 *data),
+
+	TP_ARGS(mr, data),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__string(hash, mr->mr_flags & TSM_MR_F_NOHASH ?
+			 "data" : hash_algo_name[mr->mr_hash])
+		__dynamic_array(u8, d, mr->mr_size)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__assign_str(hash);
+		memcpy(__get_dynamic_array(d), data, __get_dynamic_array_len(d));
+	),
+
+	TP_printk("[%s] %s:%s", __get_str(mr), __get_str(hash),
+		  __print_hex_str(__get_dynamic_array(d), __get_dynamic_array_len(d)))
+);
+
+#endif
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

