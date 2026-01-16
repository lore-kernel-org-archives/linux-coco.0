Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534A71BBBE5
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 03:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768533363; cv=fail; b=kfwcTIvQo0u9wUgrto0VSQp11De7Lq3Z3nPG0rF+th2w67ThtqDl+vA+Ckr7XRtLQUAIolIg8D/PoUS6IQfZ/eEevellOhsfvQT4eNnMZBHc0pZVF31fojYqsC7cpLBkB8VYdzYxWHXjVAYRtJDwzA47UnRvlJ1VbeKmI4YbGxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768533363; c=relaxed/simple;
	bh=KqRaU6x2m6OCPFHES7cCAglTmn2G/C4esbBzU7hgEvA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DuKMvaNVgPWE7virnwdAFhCvziiyqsJWxSYBYgxdK87hNIo/N4kSErxlLd6VbtOIhz6uYsotJV/Iz9Uy9I47VciYB0unNyt+sOjb6kSEwFeLVJO9i7+khiUGi175pqeVTh7NMcznfkyaBdooeQtyZ02CqxLq0eaVVl+DVkfitKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWPhYgbJ; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWPhYgbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768533362; x=1800069362;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KqRaU6x2m6OCPFHES7cCAglTmn2G/C4esbBzU7hgEvA=;
  b=MWPhYgbJKlbvZgujLV9TxgsvWgheE1/ND4iqNhQgK1ofF5w/wgnL/Biz
   ZqAhawS0ckwHFLypUB84pXR3F410EuJJka3tx3DXFSJ+BZyOte0Hn098X
   rjXeTkFdck2GhwndVyWs5CPnlVP1AYr1z6BIezMfUcvMpjg0X8H8exxBe
   qBiwu8Mgz+nSpFl57XPBuuP89pTWDCRxYi+Cntux89shnzHdNU7zp74xz
   ut5OiZEAwph+5LbX4DPL0W9uZB/MUwMAbhG1YHkWe6nIV88v6KGJEv1Cw
   f9Ds2Alm25lH3ZrUl7czIjcq07d0gKqjgupdBlk9hN3eF68X7PlqjKils
   g==;
X-CSE-ConnectionGUID: jrgXc9yaQi6gMJtIpWg5nw==
X-CSE-MsgGUID: j0Byn52iTG6eqpURZo70mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="73478964"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="73478964"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 19:16:02 -0800
X-CSE-ConnectionGUID: EhoEU659RA+KVPwkAHggaQ==
X-CSE-MsgGUID: bef8zu4vTHCxRklpuls0vw==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 19:16:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 19:16:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 19:16:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 19:16:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRU23ZBiLzUtSF9Wrz+v9hpMhijU+QoznSLnggc3HLhaC4LCh/APtZ+Ll+T0yWrVTfjRhvWpZvC1yZQIijXWF/DEYSynikguBfHm8CAMZQm6XlfoD0yKniYCaSLTZn1Vk6w5hVUzzPJnN+W8eA3lZ6txINA4lObGa1UIKug5wAq/tI6z+1Okx2UMJgVayfy/5UtqNbCqRjLPNHpDG3b9p4bv4t1+aDSHj/PgH9iCDrgts/KTEmDWLAQAhp4VL1COREWHy3DcOUJQfPM2bk1GyrM8wGvs59TeLXQ7ux/3NNlKul1kjV/adenU/a0ztZJRZbz7iiUm9iGkteueM4D1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYDNZWKjDHzdgHT0wmS8CB9t8ZV1Xkc38tHPzeOVs3A=;
 b=PMkCVwNbTO4ZrYu6HhdxqCPHv/hU5VMg5LayLZ4XsfqlBWhpn/jQHubQdCFFqrxaPp7Mwynruu1S9c1iFlPITtp1qhzeOqyeHfNOdJCwJhsSbMozLeZJHfXeET2adG/eJvoTt45gOsAr/UH0KdQM3uWA9z00aSaQ7jKnP4kfF+sV8eva/3M1aU1iFqXPH1RhTo+F0pfVOFgJ9qjR7XRKdwqxG96L7T1htb3pBUv5H4bTajzTsYZ27g/v7xnLg3zGVTybP0PloIRJ0LjACExUWbUcDj53UayjpIvVJHm/nRHGH35lo/uAJO9sn8soIEqVxFkJnFn50r6xwyD8UJXOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 03:15:58 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 03:15:51 +0000
Date: Fri, 16 Jan 2026 11:15:38 +0800
From: Chao Gao <chao.gao@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>,
	"Farrah Chen" <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
	"Dave Hansen" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 07/21] coco/tdx-host: Expose P-SEAMLDR information via
 sysfs
Message-ID: <aWmtWh39FrdLBhiM@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-8-chao.gao@intel.com>
 <aWb2aW063ADCxUyd@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWb2aW063ADCxUyd@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: SG2PR06CA0210.apcprd06.prod.outlook.com
 (2603:1096:4:68::18) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DM4PR11MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: bbde4286-ca94-41e2-93dc-08de54ad8d3c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hKjHHli/c5OyMRW8oed0eD7ZoZw4dAY+c8l5ev9K0Iun1lOHbbZQKLBbb3/p?=
 =?us-ascii?Q?15XEerItOR/oqZ9ZuabfyQET0B7sNMJ+AVl1t7wFAgpUjdmZlXbXQ4Ab11xO?=
 =?us-ascii?Q?PwUtBWnw5bhSdKMQwwadzvWFWp6DTR68QKEnSgdOy/RGzG7cs4nyUXqNiIjy?=
 =?us-ascii?Q?5nwrmfkBmTSmc9TPMxRh02UtLiU5+gW3LDbxXk2aV5fDcrGyDngjPgrkVLIu?=
 =?us-ascii?Q?lgPABNkX5j5IfwDcmOdssdJbOsMTfIfjOzuEc0GT25sTbB2u4NeCdZoKMiT1?=
 =?us-ascii?Q?JxslSjPCLdEytkkDx+RJoJvc5YP9casbzQ4rOx3Eiz+lqnNXp7/UnV4aOf3l?=
 =?us-ascii?Q?fS6NOTIxHz56eBtJxNu8nboWAyx46XKzbz/9G8Cji9NQ6Ukg4qjagphIVOtN?=
 =?us-ascii?Q?46XOLci+QbI6r0hnq0A9hkpTcYaL8QQRClbnVBsyDkaTj425hTvn700LM272?=
 =?us-ascii?Q?w4wPYCzk36d5I4SRld6jkNFY2scm3HZiuLJyWSZ2eG2ZF/fZPONxnci9w4Vc?=
 =?us-ascii?Q?LKN3Z+gKmfVOBrzuvxwQKR0RZ/SbwQBwIEGJPP+w+DGZ90EVZMdx7nlRKwAb?=
 =?us-ascii?Q?oDteyilobVRy08peYv5SOXVfvv031yxGCKLa4Blu9Sw8MDZ3DvaxsSdN88FW?=
 =?us-ascii?Q?xccUEYP/81CJsAT7UWQHi/JzfJk5Q2y8MOeupnPeafyZJO8VEssCFPM31aAF?=
 =?us-ascii?Q?/I8uTfwgUGSeM/sUD7PVPqdceNgxJJlARXFwXP9MY3+0UlHdCsQUociOBSDE?=
 =?us-ascii?Q?KozsF1/XUP/eUPovaNQAOMcG9UU9npGYXwOH1EnDLCT6DotxUqw/YLmk7Ih3?=
 =?us-ascii?Q?UxIxBSsfkrgc5y4AK6BOEED1EKeqgDc5ESUaB2/09jbd39uAmL+NgYm4Q2fk?=
 =?us-ascii?Q?hoNprPoasyLP2iFpgp31TydF2Vq84AaEXTMvzAr/gM0NdRLwROQIzmXnSMar?=
 =?us-ascii?Q?9vKOBzrUPX5Idwt0oJzj4PCLJm8g61S2kvRKDsOHgIZ1K/TG33CEXS6LpCss?=
 =?us-ascii?Q?HmRaytNAjbxBi1XYsT2jfsCv+zAlUrFucM9sUX3fiQgxyPe7MR6cQs9wQNUi?=
 =?us-ascii?Q?62POMpWnfmV856oykyx0jBeByegEJLuXoOlcz83v3SruevvAXAc6CkQ5q3a1?=
 =?us-ascii?Q?PFYD586H2gk0V1D946Hp4rBo+MgsdjkFd1WurieTINeho8r12kZqoJYPJUUu?=
 =?us-ascii?Q?1ZbKbob2hMvkc/UTyBZAl5KyQl6EHutdrDZnd4eeDEtf3hRpwpumEMC2G/F9?=
 =?us-ascii?Q?0VTsFrhB67ynC13hdTlC01qBm6LBthdgy6WHWZoPSJWJ/Apd7BFWgEVkuSJ/?=
 =?us-ascii?Q?0U0GBY0KuchKC41Kj2B65qRp7YkfmmeOqgINd0ni5Ev28L55XFCZJcb+Q6FV?=
 =?us-ascii?Q?WiksbCaE7SWxSbX4ZVYBx4EnGsLU/56uN4Tn17b0f5rPGkaTtpjLxSpDHt7k?=
 =?us-ascii?Q?CsauDjADwgJMwgNVedelwEMW4CczfRbJVax0MYzOcMKGOhlhRmYJl59ynf5L?=
 =?us-ascii?Q?6bvm3O4VbH6+lA6FSFn5kdWmVxFQMIv0FqLhBRKnaCNZF/n6VCoD5GgHiFKT?=
 =?us-ascii?Q?l2BbxDP4TbDtMKy9duU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3gPI+1mNDgjKCiL84I8z8u2G5L203uo/QpPngYRnS0E1PfKnA69+mSF1XGm?=
 =?us-ascii?Q?SsfQ2CfhlfClAKgm6MEhgsRYp8foj6LfjzgK4jLWgjBHhTqDQ/l2c705cSBF?=
 =?us-ascii?Q?3oDTzj104EtGrrkSV/X/47cY3X1X8XMieXq4lapHqs93S/gm9YWe1Q89dBG8?=
 =?us-ascii?Q?OBwSqUC0JkK1PJTVbXMQiKmIw4Tgmwig7h45EeM6akXGAcu64w99HdLqAPV3?=
 =?us-ascii?Q?8yxg1Np8dKjMbP+Lw7FbrwizzH8nFqwT/7E6p1Bz6zP9X6DYG+hW/c1C18li?=
 =?us-ascii?Q?5jYFqvRtl9P9bKpThc1dfJNVdXZ+Ls3L4CN19X2KQHTN3EmfmD4UyebFCBDG?=
 =?us-ascii?Q?9xH2jkeFjyhJXd/rD4kJFW4IdpnbZKcdKF+KaVudjiq9Axzoz62oEhRegvkD?=
 =?us-ascii?Q?JqVltBV8a6mZGKOw05KcguyQEHLFMyG+8LGp66CVMlwJNkTjw5+JxDQ6VZaO?=
 =?us-ascii?Q?ucwBxpjIg0kxoiwZtrVlXuS6LLtrx/tFgR0xrPAUOpSSEJ78xS76S+NT4diN?=
 =?us-ascii?Q?MZ/lvE1JOoVnHGZ9jLQG3X9h612zOfFksbgzlc7/G6+ehqA6bx6YskoXsTmk?=
 =?us-ascii?Q?pnptA1JGtujm20ivf3wmE9tZul20hlLGxahm+DEndaRgXNnm/GC7wio3qzuc?=
 =?us-ascii?Q?qttDeztOhjH8Bz8XO2VIbvTylHSkg8TsCfWNd5qT9d0SclWR9KZei3tLXekh?=
 =?us-ascii?Q?FGP4iEK+uPjxqlEYz0xK9MyQqxhis775p5UAkFmh+yezFiw6n85hvmP4ZI9M?=
 =?us-ascii?Q?7lm1j2dTpyiqZWGjUbdGouqOZdaH1oAnELWiC/DyZGp/3y7emjs3Les1RdoA?=
 =?us-ascii?Q?LbUYSh6e0K/bmG2C51TiPYZCkJSuv/fSqEgpZfJRWkt8udbtrmVg3RDv5XFj?=
 =?us-ascii?Q?KCNzpHYdYEaLODyIekGclAKz3dCeNfKrUaCAjNwH/uoJXbYjKbIOn8UaC9C/?=
 =?us-ascii?Q?gkIylsPOkyncd7Z2gAbCKXMfVS+186bYyBXSd5kxdtpKERXwlnxrwn5rrPDJ?=
 =?us-ascii?Q?aSfqbkPkugudZy7qKTMWIvYBvDsG/gM8jADBjjraMd5crot20xU/KIZ/kxQF?=
 =?us-ascii?Q?Vc5KlZiyUI31hLLjJ2FocYvfbHyiOm3zPzSFNWUzbQu1TzNvgQRL/s+HbTca?=
 =?us-ascii?Q?+tQkHyn8zUoiEGQZ+FhWNRMi6KPiT2ZTMyNG3UPVPMF+A48g4sh1RyaIn5sa?=
 =?us-ascii?Q?+PT9y5e7u5EL2s6EzLAat1a5LkD+bZ2DGjvInMY9x0Fztwnzgx4V/8/mezcn?=
 =?us-ascii?Q?XLlaekyPJqy/ag14XO9xYGTT3pLs701irQ2GMIXDQlJhCp6MaeTRXz5HOhua?=
 =?us-ascii?Q?SITNUjbsgoVpszqPHO8ue8Y0blONIu+bNoE1P1ENMgph/7oQDeaIpikw+hRc?=
 =?us-ascii?Q?qeKEQlVHQqMfUvQHDw7tEZs/y7ECEbPHd+hmemq4eCUzBpqQ4gsFBLDaK97p?=
 =?us-ascii?Q?rYBYX8En5rQeDV+/LGd631ikYMLgu1Rm08KFQq+tDZy7+C9vK6FAsD1M2sBb?=
 =?us-ascii?Q?c5EUFDAkHGc2uSfOkSuC0C0umcbzGU8Lx3tAan0L23AcBqZIiTYGOvdN4a1C?=
 =?us-ascii?Q?tzIKm5BFWOTYT+de/H+iWgJ56lu4glnKMLwV7P03dgVK/DHUPDJdC/OqxZQh?=
 =?us-ascii?Q?jCbWbFyrsc9APY0B3xFNatbM2qq7yXI/CI8wGPS/pDVtVTHdYi7I3L33nm2t?=
 =?us-ascii?Q?PCv8f8H7YbqAev0UPya8HJCETaNziaFghll3+G6AcG7jr17/v74YXBcgwZ5R?=
 =?us-ascii?Q?ozQ5jUxsWA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbde4286-ca94-41e2-93dc-08de54ad8d3c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:15:51.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rTq6a56hB+fdJGBnQUjFiVa+9MdQ2dRe1gURE1IzDkcwVlHbH+jBf6EaxBdRFfB0OluRuyoxBMX4w0GcoOZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-OriginatorOrg: intel.com

On Wed, Jan 14, 2026 at 09:50:33AM +0800, Xu Yilun wrote:
>On Tue, Sep 30, 2025 at 07:52:51PM -0700, Chao Gao wrote:
>> TDX Module updates require userspace to select the appropriate module
>> to load. Expose necessary information to facilitate this decision. Two
>> values are needed:
>> 
>> - P-SEAMLDR version: for compatibility checks between TDX Module and
>> 		     P-SEAMLDR
>> - num_remaining_updates: indicates how many updates can be performed
>> 
>> Expose them as tdx-host device attributes.
>> 
>> Note that P-SEAMLDR sysfs nodes are hidden when INTEL_TDX_MODULE_UPDATE
>> isn't enabled or when P-SEAMLDR isn't loaded by BIOS, both of which
>
>I don't think we need to worry about whether P-SEAMLDR is loaded or not.
>The tdx-host device exists only if TDX Module is loaded, and in turn
>P-SEAMLDR is loaded.

Yes, you are right.

<snip>

>> +static umode_t seamldr_group_is_visible(struct kobject *kobj,
>> +					struct attribute *attr, int n)
>> +{
>> +	return seamldr_get_info() ? attr->mode : 0;
>
>I feel it is a little wierd here, need some explaination why use
>seamldr_get_info() for visibility. At first glance, I get the impression
>that we don't expose the attributes on 1st seamldr_get_info() failure,
>and if 1st read success we expose the attributes, then we return read
>failure on 2nd seamldr_get_info() failure. That's the motivation I'm
>trying to make the logic simpler.
>
>As you said, the purpose of using seamldr_get_info() here is for the 2
>checks:
>
>  1. If INTEL_TDX_MODULE_UPDATE is selected.
>  2. If P-SEAMLOAD exists.
>
>But P-SEAMLOAD must exist in tdx-host device context. The chain of
>dependency is P-SEAMLOAD->TDX Module->tdx host device.

Indeed, and the suggested changes below look good to me.

Thanks.
