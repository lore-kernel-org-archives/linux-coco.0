Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E544CE681
	for <linux-coco@lists.linux.dev>; Wed, 30 Sep 2026 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806444; cv=fail; b=MA8YxUMAi5hNpkVNFntfL7JcCRaWqmUYvcZ6b6A0WApB9IpE49vdbSrLQW1rUe1XJ6BeJUnApdNZXbNYmDMJVG1oP0xYZUIkWacVQ1IWLAypIEbHjE3d6PPg/bjA8kwFgWUKFBkZw4oToA7dPbsx7hyi8A84iS3CzB6gSfLCX9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806444; c=relaxed/simple;
	bh=Va3DEwz2oBEEgfnVBfnAqCObcLSEWb3ZI993GIQghR0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eDPgcRlEYrBD2YT+gWa62gefQ9D3FEJ/nGy5bYvVTF1zYifY7u95cZ23ctpapMVcYIGNqzVF/tgPXNsQ6nNlaNKRgx7vpTNMCii46eITKS/+EHE/AkmboLmJ+JKVDGDVDzLrd3nLfAtpAYJ5e1CYAs/LGEcInVTAARnrhv1LHA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEfU39gg; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEfU39gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790806437; x=1822342437;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Va3DEwz2oBEEgfnVBfnAqCObcLSEWb3ZI993GIQghR0=;
  b=JEfU39ggnmf/AgHALdvX4UEhOWoQQFK2Ia/HXneyb03NY9VdGFbAyByL
   KG2Jj+y4W3p1L5EgPvNOLoW4KK/euw75AzfkiLjMeIch8V3rFqa9aDFIO
   n6lUsnI7m7eOHpWSb8STed9aA4Vji6EdIL7XxZzNcmmuEJ/KARFVP8VSs
   GbaFGZfMraJB8d7Gg4I4dpkBFCSNqrw3HGyT45OfmnxH828kxOYNUlTAj
   xvyN2qXHIPZRaWLklCSUllEsGfZwqkyJWeAe4wUrGtxa3+FCqBuwcsKz5
   YzuW5ct8cWv9kMtO8pO0aX1cTenX8uCzWAYHx91UyW3jouxTPm3bz3yt/
   A==;
X-CSE-ConnectionGUID: awLGm4UPQeaFn0fTeZle4A==
X-CSE-MsgGUID: kM/tHKdYSJW0uHYxZfFsuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102231049"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="102231049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 15:13:55 -0700
X-CSE-ConnectionGUID: Uppayf9ZR5eDZ1KP11EDjQ==
X-CSE-MsgGUID: eNlYpwuVTqCK1enTK62HOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="273620048"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 15:13:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 15:13:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 15:13:54 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 15:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbF1gOX8kLw04nBp4MSCR10iD+ShtRhiTGJxpQYquoZ5fmFZvNbZxsczDP8WmIFpSDlYexH8ryxJ5lqEWx9QbZVCAd2fUFxVtltum8QLtW1pJ61161o+SOS4jEH8NsTJp/gvxwtX9ddN6oUPIq7BdDjVvuj1jnmo7HBirmq9fL1OYOVKbU0SWucvrrLcxkJlVq/D3EiTg6+NsCCrR9dd0T8dgWMv/qNMHU3+BzT/3NhslSzj+l8KWYOUsqOXAHVHE8Bc5GcDVuRBFLCHSChoaAt3HLN/GfQ0xVol1Ge0wMj72zBgP8GlHd5kc2Xr0pVjZdUp4bEohsyw9R4On7O+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i56AH/txuE+UEWlg3NLrQE67pEslDIYb1QR0xSZfKs=;
 b=yhXAvxZCbyrWvnr7mU6Yp/6kvgCuduTgEINn5g1qQk1phHsMuMorOC9HbaBkN0k2FR7B6gysqnzJXgc0u1veQ13FH/Ixesn1D/H3UlpXnjRusjBGqSgCzzcdPKLsQYbRgWqhHQ1r9O1KRmGCsCKv1mdAHEyXS3q2mvfaZhYv9iOuQGMdKlLmMjeb80PRnqb0/DAW2uTiGNbzBIb0vHfJtjfKGOQJmlcTvYYwmLh8OlezouLxnsw92ygRRKvLRs2UAZgQqr4KpOLQv0ilK0T1hW3/r57CbAx6Bqc5MwMlrJvCzZfQ/Iw+hzC34qb+GHSehnpx348v2DxTD6i95FEHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB435924.namprd11.prod.outlook.com
 (2603:10b6:610:34a::8) by PH3PPFD9B78DE02.namprd11.prod.outlook.com
 (2603:10b6:518:1::d53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 22:13:46 +0000
Received: from CH3PR11MB435924.namprd11.prod.outlook.com
 ([fe80::1696:c90e:60af:a0cd]) by CH3PR11MB435924.namprd11.prod.outlook.com
 ([fe80::1696:c90e:60af:a0cd%6]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 22:13:46 +0000
Date: Wed, 30 Sep 2026 15:13:40 -0700
From: Peter Fang <peter.fang@intel.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
CC: <x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <dave.hansen@linux.intel.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>,
	<dave.hansen@intel.com>, <kas@kernel.org>, <rick.p.edgecombe@intel.com>,
	<jgg@nvidia.com>, <nicolinc@nvidia.com>, <aik@amd.com>,
	<aneesh.kumar@kernel.org>, <seanjc@google.com>, <pbonzini@redhat.com>,
	<yilun.xu@linux.intel.com>, <chao.gao@intel.com>, <vishal.l.verma@intel.com>,
	<xiaoyao.li@intel.com>, <kevin.tian@intel.com>, <chao.p.peng@intel.com>
Subject: Re: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Message-ID: <ar2JlI0ApPCb_C2G@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-2-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924041032.1096569-2-zhenzhong.duan@intel.com>
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CH3PR11MB435924.namprd11.prod.outlook.com
 (2603:10b6:610:34a::8)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB435924:EE_|PH3PPFD9B78DE02:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a739855-67e9-4eb0-44be-08df1f401883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JIakrU53zIwCwfJOvUxZzM4RLbvDR09ueRu/vA8Ll5qHPQFpZaDkH2rSbGbdzJ9HdCreCAYTN3Rr1+hCS4q5GKbzFOx5bdVsh88xEvwdQW/HjV/5cvu5hNu9wMWDIMgc07BrFdEifhiAoFBAu3FSatGktRxMC5NodL5wFHtrOi4aO2ZiGNRIGVpl2N974kzV/OMBi7zz0WoDh+Zotdko6H5VB6tl9LBsp4mTU224uYyXrlikVVP67cQLLoQ0iqpELAlo8V9CFJDrv0Cp5UmDarHBKSu1L86+ueoojUHaoYh5CNl+g70LlBk0dqgmQOTfJwNKOUPYkFqPmt1afRvJH34emDWLbZf4OA9WN1DgvFnR7rsPQg68i5fPyWn++SkH/DnFkJJcC5A0gqrrqDPPS1bDAVtd2kYGyuBUe4VCe4FLccIkE6JxrxwQ8K6VS+fBSNqb7fRG2YWrFQfrZE24uybXoOZF+jje34czx6MXvKvnGLBzF99D1qWs3DsnanlHFzwWBx+1aKU5MiNIb/iIfskUPEMSFiy/s2lyYYx3YsEeV1EeDktjQyQif9E5PKmGmN22NhP4SdR3XrlXlC9wzxSLtJT4dSqHKqAYs5CEHHpar1vPmnk7Y8BS7S9nfcYHDCiDCSJcDeYau4x2mURueKdDHBTiL+D7BhZh05nuF7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB435924.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5BIp1FAk8dbxmnTww7W9iSKZhQ3JHN/fppElHJhvwksczux9VQPBaBZltcSd?=
 =?us-ascii?Q?VTvFydzksfHg0Ug3Ph5zwxtdgQH1b75I+5yT1/2f2DwJ+J8+vLxfJcKHytTs?=
 =?us-ascii?Q?+nGRmMSTB6Ea9u5Bfgo3iINhm9QxR6BmQzqbTh7enwNWSgbZ7FNZAytooCfU?=
 =?us-ascii?Q?36NuHUezxhOoCmCjrLasnFA+nXzQi6+gDhNZDDMyL3/AGHLqhYoq003yNMnT?=
 =?us-ascii?Q?8z4U7saE4k9z4fX5dGFA5A0Fe5TEmA8di0iyUZ/IBvXoZbEzls4tdtiS5Dy8?=
 =?us-ascii?Q?hfJUnvt22bQ8UBztlmZHRNEK1JTBmfVKhNBTmflalGkyxRMufnaL8SsMzFgf?=
 =?us-ascii?Q?2HG+T68Sez8FYSWvLU3dWGft4KSAu2kgc4kTvXRjxXOvGU8BMoK18RSa5ry1?=
 =?us-ascii?Q?0PdY6FxdWuBDsUJ2guP1G2CHeHB8pGrJH4Wx38E2guTnGve9XRBSRHu8VTdw?=
 =?us-ascii?Q?DiapsAxJs/Ry9y6l8ixhC+2Pt0/n8zzB39myIkpHYmK1qCBsIC2oOTfu78DF?=
 =?us-ascii?Q?D9XuTwc9drtgeySZ0HECpRCLg18RuRWw871HyzLfqDnKsgSngSKse6NflxFM?=
 =?us-ascii?Q?3zyL1Nh6/oPQ9z/UMDkLIJeT2kcE+zMAMOgfh5NcxJV8geFv53fyOYFx3rMX?=
 =?us-ascii?Q?PmbBQLCitJcg3e9z9GKThQTGpQoWw6JGEGoB23c9WcIeyqX6aDQ8frXnTH70?=
 =?us-ascii?Q?PZGkKvO+ESVlHlm25jfIJq6xYQ7/bE0h66SmvyQDXrsmhLr00vuU9Ad84+80?=
 =?us-ascii?Q?bk9EA8EGl+d06kzxvpynHT3y7RC5SZbQ1HcSn2OGlfHzqFUsPq9I7//kVCqH?=
 =?us-ascii?Q?DFSRF/ApSGauP1oEo4EKXi/D8bhwXXhFBGRxwe7Sx3KaIveXZFv8yajm6ICl?=
 =?us-ascii?Q?bYQz/nBoVfI789lxEUszJKZ3tjUADSwHO+/P4cV3h8UtmD2xgncQ7p3dwxke?=
 =?us-ascii?Q?kqugf/6j6tzZh7Mz6mVEmQ3LEWTGp6cnNrW48w5zmZiZUxcOJ6MX/zfDcdcd?=
 =?us-ascii?Q?Dt7GqfqNdCiqdBXf3f3QuaCDFB/V+RjRAI9auK5ZZRwnFbGYggkKOa1HXcEg?=
 =?us-ascii?Q?qo2trfpNAytMWrC5gVy+wrKBejj/U1zL0pE4zsToVT6C4ll0EpRCcGIBwHS7?=
 =?us-ascii?Q?2XqUd7ZLm8YPES5cPDwZFdE8maq1VnQgu9RsiiZb1WcuDT7+2xdqi/wyf4oS?=
 =?us-ascii?Q?W/cAnXPPdQ7CSWe+jAll91JsMSwqrbHCOy190YLWZsJ4ICUFUYnP/JrOeKNi?=
 =?us-ascii?Q?2GRl5pStXmi6jK21FVLaq9Pi8S5K5cxeX5pLF/cfDArDGoi4Cuwl741GnHof?=
 =?us-ascii?Q?I7C1ne7oD6cXGY/GEcHxGOblis6BfTUfXTXa9bysJcdyo/XU8/7Hf5rpfnox?=
 =?us-ascii?Q?M9+WHYJ3TYwoxxXBaiNZND/LNEwsIk8jF6ZvGvf6OHEbXAyKGwIv/vt2Y6Pt?=
 =?us-ascii?Q?CVY5G31pQh9yZa+shiHtndHi/e8izPTR+sp/RFDHtnXTdUttaQmsVh+xFVvN?=
 =?us-ascii?Q?smaDP+rWFkqRVmb9G7yX0/pjx0lUt3jj79ydCgiIxuyUZYtvmDQdfjxFXB0U?=
 =?us-ascii?Q?An0rRUj1TbQUit/aDlpIMvSLqniVFHLFJCGDdwHVyx+6KipSjfdw7LFTkUqM?=
 =?us-ascii?Q?K91/uDpNHxwuZtDZh1up4BpZ2pv5pMhjfgFEXpa23xURzrNWDG7/9fknQ0m5?=
 =?us-ascii?Q?wbhfAMBEOMgk1aYK8vwzKrbzsP3Lw89peO+ne61w7MQR1mySuJKaY4bnwmFg?=
 =?us-ascii?Q?UAD6PxNMqQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: rBd4l3kdlTy+/fxCeRwRhXoUNrfUoAZvFBPCf/0h302WtFPekldu3l8aclgBqE/PMwInyMz9A1khLzkSRXLDggmueNj/MlSyTESUNmc3gdTdjjZP0eVJrStkQTsafF/aeoYDBzQ5kpQvixxMTin1ybMAFcpYrzoQFTKn4VdaXhkveWU/JH1cVLah8MSe8/cn+0OKqI3p5ULuvQTn5rKqRQ+dxclby4TqjbLqqcyLOXgDedNsUBm61HEi8fAZ0yOAf9x97WbtB2aV0azjbJYIwk0hQU18b2LTuFw7CcLZjKm8fvM3Q6djESy9YKbWxl8RV3hw0X70E10td//JKsVmqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a739855-67e9-4eb0-44be-08df1f401883
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB435924.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:13:46.0497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIQNRS3eXgeKerkXPmNnOxn7xa3+Q4Bu3VTAnq+n91Hfjky+Ies5SmC6zS2eCP5QJ1yZc76CaRQd0Gu4TC80rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD9B78DE02
X-OriginatorOrg: intel.com

On Thu, Sep 24, 2026 at 12:10:18PM +0800, Zhenzhong Duan wrote:
> Export tdg_vm_rd() to allow the tdx-guest driver module to directly
> read TD-scoped metadata fields from the Trust Domain Control Structure
> (TDCS) via TDG.VM.RD TDCALL.
> 
> Since tdg_vm_rd() is read-only and cannot cause harm, exporting it
> directly is simpler and more flexible. This allows the tdx-guest driver
> to read any TDCS field it needs.
> 
> In a following patch, the tdx-guest driver will use tdg_vm_rd() to read
> TDCS_CONFIG_FLAGS field directly.

Can this be a separate helper? I'm adding another helper for
TDCS_QUOTE_MAX_SIZE [1]. I think maybe their patterns should stay consistent.

Yilun, any thoughts on this?

Thanks,
Peter

[1] https://lore.kernel.org/kvm/20260930103739.2851980-6-peter.fang@intel.com/

> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
