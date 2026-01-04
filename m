Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60514B96E
	for <linux-coco@lists.linux.dev>; Sun,  4 Jan 2026 01:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767490779; cv=fail; b=NRQBG6U+4j9xPGXRE34eXbRykRfUMhNFNX/Cc54O/ZQq1qCxtTw/XnBlTLZDJAVKcWNZKzb+G6R/ety/s06iPUFbiYqREshu2+LcDncXJKtQkNAooqN7dO8gM6EGPJYKALxOuWncpSGJTVPx1zB679OhMsdtsKqkGYRKW4WCj6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767490779; c=relaxed/simple;
	bh=xUMKuh4UompONZ1ctxiL/E5WCOXVmXBRiEOFXS+dRJU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HR/76CcbyttdUkfwBmhknuWSyMZ0MFx9zVfkSllIDRLoorw+do0I1ha3ag6wL0bv+wQ2x+GXveZPDQJy0pf9ambEtybJgyd1ZeotX3t69MlLMCVqjPN7gCWo44s7Dbs46fJoYHXWBxmlrSoHU2/T0P4q10533yfmb34SrtIyeuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC1hs6XR; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC1hs6XR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767490777; x=1799026777;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xUMKuh4UompONZ1ctxiL/E5WCOXVmXBRiEOFXS+dRJU=;
  b=KC1hs6XRd9TukxkM+EDYwwZ1IjhgeD10kAbXG9DomyO7aMhN0CMXuKnW
   9oMo6WWwyFiLojnu+aMq6e1pmge7nsxJOkGFfhRTJ36DRlQuf1fsacNj3
   pbCFxsCcpczJQwuOxGfq/kk7REmrhoDFpxNFHy//tHGadMgYwE+aLJ0ZL
   ui4g2IW4uViNY4f2Oi25gYoib1pb5fIe67ytYjmz4QblbNcmBvJTSZIGZ
   fqljM/uyFUXhk2yif6zyTJw/QNUxIrD6Z4YsI2At1GZu1+QnD2bh9uJsq
   9gt8SrrcMQgK8NLSIHvZRUjK8N1PVaPQ5LghIBse/TpNnV2OARDEh5mo5
   Q==;
X-CSE-ConnectionGUID: 3mHnjBTFTB2JBKq2gfqRQQ==
X-CSE-MsgGUID: NMkodtd+TAiHto3IV0LbNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72541963"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="72541963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 17:39:37 -0800
X-CSE-ConnectionGUID: 3fPnImC4QVqMU93q4UG1Qg==
X-CSE-MsgGUID: YNcRp6xATkCfCD0J2CdLrw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 17:39:37 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 3 Jan 2026 17:39:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 3 Jan 2026 17:39:36 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 3 Jan 2026 17:39:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hktdYuzcedOTGVF2urYri2EAPca21oBCubQlXcy+7JwnyuyAPjAQNym+vCf8NOcFJh7mcRHTiiT4WW0prsmD4K2fYaNkY3Okd9nCm8P5DVPqk786umuSvWsPgn49wWOL2q2RlANISYmelw4xGgCAB71dhLLcTes0LRYL5VCSqAaNkMkGS8oe/EHFSm6z+TzAEx9+dmlozuUrWW4duOyvjvA0zf4G6ebNPHja3WWP406oMNTdIC1WjKfmxHKY8vMc/EQ7ntNt/aHRL+ys+xIiGZtLCw7is30cpEAbvkokbx9+qtjX8FolyhhatlmXc6p9L1ZdlwStHqH9jjusE4GI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYrjxvCeI3ckwgL7XXzOHFBZSP1MKEX1puTaKJOSKoA=;
 b=CBiFsTuLs3HLiK1CTRZRG8RpsxtXqgEWyXNG/myD2ncx+gNiU5Bynn/a3Hfmm4ee9217l/PVhg5OnGsFRCy/1GLAkOWIxExCkPvxE8xw45quqH1lIcPqi5teLMBwQoXtrJCu8oDoMu0w43fAQrU4kRka1V++9g68azMQOUkSvpsWX0r0m7ZvNeIkcBLu+/88MJLsBs84PVmAmcQJQqmoDPio6F+1aTU19Idje5rtbkkebnwRsZNhSRa0vgKuXIvZRu+HnxVqa96AjMeVdzjhDv6Y6ex/rcmk2DFcufRxI6P/EcmO10ovnQWN4U8e1Smu49bE5+lE3DKv2/Iu1iNhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DM4PR11MB7256.namprd11.prod.outlook.com (2603:10b6:8:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 01:39:34 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 01:39:34 +0000
Date: Sun, 4 Jan 2026 09:39:19 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
CC: "Huang, Kai" <kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"Weiny, Ira" <ira.weiny@intel.com>, "Annapurve, Vishal"
	<vannapurve@google.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "kas@kernel.org"
	<kas@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
Message-ID: <aVnExxYDGQBKS+yO@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <aRSVB3TQxpgZPj+F@intel.com>
 <4bb43ec912f3bfb92d0f9071143b4b046d5db08d.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4bb43ec912f3bfb92d0f9071143b4b046d5db08d.camel@intel.com>
X-ClientProxiedBy: KL1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:820:d::7) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DM4PR11MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e92800-c284-4b86-fbfc-08de4b321cea
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QGZYdP9IwMEi2cEf9annc0i/vqO34kMaB5FuaPX+zgZYJjUEG18nHItgP4ds?=
 =?us-ascii?Q?c4dJSqXOKDyfl5m93rPGh+XRKJenOTKJ+eRXZK9HVH8phfYl7L4LMoMaAxPL?=
 =?us-ascii?Q?5I9nNtN10CQ4zhF2Nb6o0NfUgcX3mSd9s2AYrBCi0Eaf7vixGhN3orygjKSj?=
 =?us-ascii?Q?S/q16HEAv5GROU0FXgMV6Atz0utLop5fWHsqecR8a30ZUmFR+uy1+r+8DLL7?=
 =?us-ascii?Q?2L8lT+QXCjQGxCDZBx1TphqChm5Qmadb/Sm5zbkzLI1YLIbzKRdm9/B9Kn9a?=
 =?us-ascii?Q?j6S2as7GcSM/PwnQZwDlvtHfqgWlBJZxYTb/CE06abqou9vNkXWFRlQ3sKq9?=
 =?us-ascii?Q?7koSiWS1TIl2W8Zx0SCY5VFWXV+Y89EyxillboaMUs9eBkg8tIv1R/suX5m5?=
 =?us-ascii?Q?SbugzSs2EeJxLjTY8DtxxKuSdyote3KMG9b5lSV1DLJ/O8EWhW5Ag1ATTKfu?=
 =?us-ascii?Q?45WPjjU5hoYyHjz71yEEYmr3bUjsb5oSQZkePOmcZmhv/hpapPTPnojgKUZ2?=
 =?us-ascii?Q?e4dFSGqzpqiaNU736qN7RouAUZKJVKYigWEdyoU1giJlydam5zwCFXJdsuV4?=
 =?us-ascii?Q?5abfHyR81F5njLyVdz9kg5qr32PvStCXGLz0uejVHEG1AvZxuKiX/GF4Q5/s?=
 =?us-ascii?Q?GHFq/ulASYYcya2XBkwXJPk6Auoucfoq+tnRyhQu2WHHID1d2sj9jHVgbktJ?=
 =?us-ascii?Q?QPYGk9qFA3NDNKdFpn7SCoGQszPt55eLtEHK5GbOW3gOlPc89mApsXTkdVH3?=
 =?us-ascii?Q?qztY3wMLsaaDGimS1JKl9Y4mceeHAZDvgGQ7ovbtv2XOaypqq1iwu7LDkijg?=
 =?us-ascii?Q?AnTQHjOVHNApV4u+R9UcKWJhWMEHMCHkBATdDcNxi0zpw9yRj9oNXpfP1cxz?=
 =?us-ascii?Q?xFNeIGrLFp1U8TtHnfMg+rHXUzvECwwdfDrIsbUemy+VJjxnPUcCucbxzvvX?=
 =?us-ascii?Q?/AVpiY6H52Bf0/qRVUa9Ax+9E3ob54lcwslUz0Z1cTFYsqUach2i0PH0WexN?=
 =?us-ascii?Q?MpPmQyGLEUZ6O4FUjDXIJkPHZRr4Vd5/ZZuB+WUJkC9tLNnHiAAfGi7kY/qM?=
 =?us-ascii?Q?8yy19V4rFJxxFItZmExGRYVUwZ+EMna1L1aLUYVPc3CmKeWqu9hOuYN37m5U?=
 =?us-ascii?Q?BxgnPX+qTHcHUrNqe85jhp/gdLl59LJx3jkKxo4qhZNyFM1dS1XVt6vXM01R?=
 =?us-ascii?Q?BNVPNUBUX2nEBUuoqeMXdyicQHfDqXOG2NXHR+XEU5Tvs1Ymg4CVpn3xN4Xc?=
 =?us-ascii?Q?by9OpqhgCVT9/T94NS0qLyTkLO03I0XJS9onMqlv9uFjL60TBqtfJaIJQRXq?=
 =?us-ascii?Q?cpjotPkWgjFKD2rZT1ViFeWbqozoii5ifsq7in0VLbdWYblc+oGmAyGvt3Wd?=
 =?us-ascii?Q?YMii1FHHMIZQUXkgMpVur+w3qg1pv0OIAtfKtFuAtdlsYxk0wphKPOGhyM9r?=
 =?us-ascii?Q?DsLRIAgU5Ux9qSMRVM2tzzhjZ086nk/hdfh6uQIJ+Nw/euUDLPymCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Qkv8PBMZjr907ZN+g0OTDbUDPyo6PSjBukwGlGJvoquun0SQIEVjsF2H3PX?=
 =?us-ascii?Q?4bwySLLi4k+xgi5c/vvLleTyj8p0GhsYUvy05jlriwMI2B4rNDhVI3Pvc3RC?=
 =?us-ascii?Q?mLsrqbljltcJsogYC1igJ7FGj+NMebr+sUdkEzYNt1FQVV15ybviRnV2gO1H?=
 =?us-ascii?Q?wD3Kbg/xnoBsM/82TK5guH5IJqet0Rvd55tsbdfuH4TX4rdqr+876646Rqrk?=
 =?us-ascii?Q?PM3A1hLUPJJMb67jHqVbIc2XySNnKQO5uhy0BvXDyUOjQ0b6HM5D/G1tb0ZI?=
 =?us-ascii?Q?pN1Wuh8GChMpB0nbSuN8Bj92FUDPTu4+0wpd6MrIQYPrgjIZR2SL4oQR5p/t?=
 =?us-ascii?Q?U83HtQtrXEdLTLWbvNXWm97xusYaHYrnmbCla+smGH4VBxEayR8Dg5K1nUBz?=
 =?us-ascii?Q?6owGvQKIw7JATQDQxVKYTFXzEIe0XdMgMxYcBUbjbPZUXcYyDQEsUg2w/2Sy?=
 =?us-ascii?Q?MCGkx6AIc0rDKEHSb9U+qK2RmNsEknXgHcROcK0UBkA91/P+qu3WEnYC1OFH?=
 =?us-ascii?Q?AB/eE/U9tsvDEIfbcAsIMFOlfP0Ol5eGk6krHQVu3kUs6BzebI+SFDvPmBeX?=
 =?us-ascii?Q?DmQTHBgmWcZaxhpAYzeu0FQP0SJ5QLQ44L5lphmkEbF+H7bZVoKeZjFvReVv?=
 =?us-ascii?Q?t29fey55MO/hJ164T7rox4ZmlIHDJg4i9vXk8K13MK0z2GeR3jeaio1+FkKg?=
 =?us-ascii?Q?iggEOEcfQP2bztsJnhXInyjkyyAi00U/sZBcBtaGSjkiCUPnjSkWdBmJp36R?=
 =?us-ascii?Q?8g5GDBXykKmJ5fQ39b9ys9i6VPUUAsuUhVetQqFStCDIcA/Nv0UP4X2Zr4EG?=
 =?us-ascii?Q?cDy1NqyGACMimhnplYeex/avFIHpQrPDmAXHeKBuNKDKtHmKD0bjm+CaowQM?=
 =?us-ascii?Q?vjierLHhldIBy9P5LjBGX7DCkx0gZrAAl3ctYyyopnr6l2DEIHf2zNzjfbYe?=
 =?us-ascii?Q?mZ1JgSPYTpyYsWioKR0PwwFFWYQIkOmvUj3JtOEFFojoDhC/OcmDU7hteoDE?=
 =?us-ascii?Q?nLhg8LvA9+rcDgOwGrdP1Mg8GChUnMhLmmiwnRMDU+S1bch9B3AuxxgZC71o?=
 =?us-ascii?Q?L0Cyhxgl5Tpt4pkHzqJILxp/Az6ptrWniqx3BVYA9ly1r04ypZUUrau3+2M+?=
 =?us-ascii?Q?bvl3/AImEq/d3mrZfmZd74SVrvJ7QepIDa3AL0rKo5BEJTBLDv83Ee87OQHL?=
 =?us-ascii?Q?z7EVIfE/vNmpGruYsMQMyr+EevhDtePNFl9D0M/lURijKZU9/lw4TmBy4VA5?=
 =?us-ascii?Q?uoLU4+Dopvhr7GF7R+QkWJVDWQ8mcHUJ3QAmv/4Vmqx+gnDsU2wuvJKm64PB?=
 =?us-ascii?Q?x9GpYrkuHPH+fk5jry+TQyQGlPitEYqp/GfLweVJXvwVpa90VpqbBDHuT5TT?=
 =?us-ascii?Q?Mm6O9kKfZ1sqOByW3AOEY6YQ1UNjTGZx9N+Po2qLrd0VLdsIXXs9aNa0pcWn?=
 =?us-ascii?Q?rEFaKHqkYfxi0TSlGoZZZzKK1c+3Wy9N2H2i9uoAlx/dU0Kj5sB9+iLaXvVQ?=
 =?us-ascii?Q?XTcoLBFdzS/lmmIJhmcv9QXXRIhRyOaSqSpuTppP/eSMZfoQBj6tFQJTTGzR?=
 =?us-ascii?Q?CaVbPHTt3llwFjoqJad9fgcF7ZR5Xq1ddFiINnxFUARFFAiVQp2916NAAf36?=
 =?us-ascii?Q?k9UYksP77eID4/9LYJeQa9J+qEANBpi8zxk5Z6P19T4VRLUIu9aK+dGcHols?=
 =?us-ascii?Q?4YvL8z5rsw7kK07RfKIYvffiajaGq0FXxLKbh3U6RM2A3H+9Va1n7XjPQvel?=
 =?us-ascii?Q?ArLrzFJMag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e92800-c284-4b86-fbfc-08de4b321cea
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 01:39:34.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpqrI5RL+xYmrxL5B2Ezblcz4YBkv9rc9SuY9DjSwebr+9RRKOfiuiA9xOv3dS1R5Tz2drZ4zxPMOIzjKmveOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7256
X-OriginatorOrg: intel.com

On Sat, Jan 03, 2026 at 04:52:43AM +0800, Edgecombe, Rick P wrote:
>On Wed, 2025-11-12 at 22:09 +0800, Chao Gao wrote:
>> On Tue, Sep 30, 2025 at 07:52:44PM -0700, Chao Gao wrote:
>> > Hi Reviewers,
>> > 
>> > This series adds support for runtime TDX Module updates that
>> > preserve
>> > running TDX guests.
>> 
>> Hi Kirill and Rick,
>> 
>> Would you be able to take a look at this series when you get a
>> chance?
>> I'd appreciate your feedback.
>
>I can't apply it. The source commit is gone from the tsm repo, but
>besides that it requires applying a bunch of dependencies.
>
>Can you push a branch somewhere? When there is a stack like this, it is
>kind of needed to ease review.

Sure. Here is the branch:

https://github.com/gaochaointel/linux-dev/commits/tdx-module-update-v2/
