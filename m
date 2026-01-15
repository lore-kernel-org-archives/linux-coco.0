Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FF35FF44
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472576; cv=fail; b=EsLrU9II1Bdde3FtbUn1SEFdpSjFxE1TboZp7wwNry5+CZhmTaggnpmtrQeKL0rDoqRaJ5+UIsilSDNtULO4Ugk4LFEYcRtybum88e67wBfESKc1+E+syTSW8RdtEaMawprKNVM+lsUIz/WsAtnxTd+8lTXByvujuHbcIjRXECw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472576; c=relaxed/simple;
	bh=Erg5YGZrOZsxjBPbKqg47UyoWknmHjJsqtBg7AVW/H8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vArhYmfwIx+wIMlfhGNri3Vad/o3RaKvoLJRvW5jvvjHEt0GowgyMFEuV1/iYHKDuXlsrZaHcO4T4j98elzzj6+ACoK2wwI8zXIgytbnFhMyr8kzzOMLR6w2pk+UVkwfLu9hgSpTEsIFXuAtbFkWdDB1atSh9NwQix/ZO/mkG2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3WflAlA; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3WflAlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768472575; x=1800008575;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Erg5YGZrOZsxjBPbKqg47UyoWknmHjJsqtBg7AVW/H8=;
  b=F3WflAlA69E2xFUglRWaMssi61ToM/VphQV1KSubEeTL/1J/fc66h4Rh
   e30BhhHXpxasfHABQau3wO61I4HHAWKsBD0+dwj/HcO6orjjaFXcRXyzE
   xIYQQ+nLzKf/QXTZp8pHXRVuBspLmHXfZFao+V18NMuUg0AUJD8v490UE
   ehlnmTHaY5PclrcGQ1Ob+lj9b5IESvMEvi9qaQdeG9cqu3GOR7nV9sELT
   LotTQ9h/xg3Jnq2rgKr5bxtsB2q9KV+rO6qfOjcUjWu1KCrY39e8yXj47
   5TllS2M4hWpTnCMN4mwbwWYuLRLc5wcNhia4J2or4LiG6MoFkb0+p3mWv
   Q==;
X-CSE-ConnectionGUID: pPeRlCQ9Ts2XqhiJoxXR+w==
X-CSE-MsgGUID: WtLB1YNKQaal65xW8MhbpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68983297"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="68983297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:22:54 -0800
X-CSE-ConnectionGUID: eNmyoUW0QzOwbqJoIAI+0g==
X-CSE-MsgGUID: DvThBvyySOuQqzHBpU2zGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="235631408"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:22:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:22:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 02:22:53 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:22:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUb2/gE600tHKw9N5ZefLBQTUioJPzRjkx28HOhWzicHPJ8qyVCeWr7R9/SM4FaiJ16eKwrX1MaoEX8djRvc64RcrKAEXTgFqlXqkj38kVsT4yaV2PkbL13nwgK+kJYuBx4QdyTfrSThyxtMHAaypT8tEDnRMVWl2B2Q5CsdbeXx6PCbCGRRfXKOcqFa38d3vncyEn+5R4IhiryvlKLDEPXlfmdVKRvgulu/a8/kXYEaUwECATUqUeQiyt8YGC4FHgFkyKCweWJbJ2gsMCuqNfuXf08qjYEv3x5Pb3VaBuD8kGx3RLE+f5UfO/meDiZYU00ligCs5GR5jaSI90lp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJZG6a0PpQ0pAp1nUQuq3j0XQktxI5rutEB5kS9TXlA=;
 b=WjURv/VwIwyHBCWoG9XraIePOtqBVBe8P6VqKuUxn5V3J4VUw3bXT04ZRVDjQqixzcI7ggDW7vaHmvgd3inv7Kye9IVsdKYiuh5lB34aF1jd4bulaP6vt1PAsxjMxxE8zbG9syGAH2lUfApCtv+dvFmX9pvfqAHXDNlxXedE7DzIZvJ2fSZrO7+NghjYF+0lUTUIgpicWjtsGlNlcQgL51gqiHO+JjNfYBEl8UpWPaCr9CJGTwpWLI2lnO0G0AKx4w3GIZ+PP0NuxRanYQpKTj3uNSUen2o6zWMQyDB9TCLUu/vFjrLHvgelLXIfnz1EPyJvgcWN8eTEMQDAzkhH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 10:22:50 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 10:22:50 +0000
Date: Thu, 15 Jan 2026 18:22:40 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Kirill A.
 Shutemov" <kas@kernel.org>
Subject: Re: [PATCH v2 05/21] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
Message-ID: <aWi/8A7vWBx062TT@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-6-chao.gao@intel.com>
 <3354385d-b1a0-416d-a3cd-53d515840b1c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3354385d-b1a0-416d-a3cd-53d515840b1c@intel.com>
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 454d74b9-9990-4291-53fe-08de5420091b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ozflchxJmhuaNJpyfUBSLmdZGKjmhVyg8ZPJHC9k1NQDFCkwb4OPtJShG99w?=
 =?us-ascii?Q?JjaqjGEh77EX4OKp6v0PiY33MBclpH+I76J4qY2X/iiuGKKZhBLxuuPSjPPM?=
 =?us-ascii?Q?FzwSAbtXjZBAjpPg0SiJ8ybP4CwIXlBR/CXwgItmzTv6m8ERx5gmc4dRbD0s?=
 =?us-ascii?Q?QBskSUeKdkR1xgYFZzjVoUE2QTZGoJlfACnUvXySI9x9zAofmLBS1WfPEJ1d?=
 =?us-ascii?Q?nWBtF2+tYjaWLzfaFtByXB4KZs7+A6+9IPmHPS3KZDHrU7AWY77Bu++vddPR?=
 =?us-ascii?Q?nZwayyda9SfCV3s4HhXOG22O/heUhUnwXNCuANg27mGxDW3K3J5AV6evcHML?=
 =?us-ascii?Q?ZaaOxCT7Pb1tPSVQMjIiKtYVluIiLr19i1Zha1puSKI5xU0kP7gSM9cDIKIj?=
 =?us-ascii?Q?ZMD9Ki1LGeMxRQ94diDAJ0LyvPoXYJtdAZvDkj+c+oTGlwbYSXUsKCxFxtCG?=
 =?us-ascii?Q?4lMlPjht3ZMIpH6kxg8mgKstX3IGxuq1WnT/qEVNCnwGqXtIx0NZkzbQ/GzZ?=
 =?us-ascii?Q?3PxEOzv0ylhIxxwHHd5BHJEvssUtg5l7iZXmI5Zkz5Soj3gPXsieHnLwepuT?=
 =?us-ascii?Q?7fuyifklHn4kDFdxnVcLDUMmqounVN6N6YLlHvS+Z6WHNV+2vXXuiKKMM5QP?=
 =?us-ascii?Q?pGBB675lmIPeQKyVBJO4nplc/kON/z7L4jGEnrxK8FBs5TQFVB6tZVqFoMG8?=
 =?us-ascii?Q?AkPpNEnQVGGa1OEGaAAZZCEr2ICkljhL+qW5UV7imlmbYYv5Ddmn8ssqSrHF?=
 =?us-ascii?Q?5lsCWKrnlYq+VKi2Vcq4YXzu/Q1XWTgp6qfAPEiVlfYC/3xo6xotchlQngQS?=
 =?us-ascii?Q?FR1M1fiY5a8K1NQMOhdS7D8m3lPNU0P1c50klM7xgKIlMZRvcQFqegIFRJ2y?=
 =?us-ascii?Q?x8VTCPWbUQFrWHnnKIs+mAdVyRDOBi22ZolN46kO3qDZQ1Y6vM5MbnL1TbJ9?=
 =?us-ascii?Q?xLQUcw6HwB9RNkdlKy8oZPTcbNEeE9ZFnzaqBapTL/Hs2dZvbzxYY7hhkxFB?=
 =?us-ascii?Q?CxnGTA+hYe0uLh5pJdLA5heg5yBi62JlXq3h/M87T/HGndugEhRtF/veAjEG?=
 =?us-ascii?Q?mKOKaIuheuYE3sUeNxG38DycbEPfcUTwDbnGL5axHFhpMtkG+x9OTeIYTDW6?=
 =?us-ascii?Q?nAUcuF4D3uL/6O0ztORdmYVEljUsRF3jqHg5auoiUTdCsmgGNolwfuilStw2?=
 =?us-ascii?Q?DAy0cds+wlj8IZ4UokOMVz9B+XebF979I9+v9G6bZIR/thHHYrzMxJDXQssW?=
 =?us-ascii?Q?ngRto7/1Q9P0dg5os2IFBLNpcV0imJxcBSMkwEbQJrboE+O5Vn/AhOYvVJ+W?=
 =?us-ascii?Q?R02r7fZ0VnoCmCHWomuKEfdwhjletj8spuTmDTMvQLWTEucCWspN0aHjeQ8b?=
 =?us-ascii?Q?9v3mZ8USuMSE48KXvo5H1u5sR4W9Pixj8d03S9QPNVpFH+aSzxFY7iMXyLY+?=
 =?us-ascii?Q?MgasuWXPZIP39er/x47Tr63bw3cWR9sKA89Cgu/S/vPsxPwNsckn+DHsC8yY?=
 =?us-ascii?Q?bJiV7MmxN4gW9kgXZskH2x+MZZ8ZDu3H6eJ0OX+MyGz7rBkC00ks2lciVw70?=
 =?us-ascii?Q?eYDJvQxIOvD+4SxVERw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXkik8vm4JQlnQ+FcuAUTkSbRexkWlxG7CkgD6JqVdHLf0g67yVn+4a9erLT?=
 =?us-ascii?Q?0XVfwKmJegp5qCF4O/NszuNtzVdAmxYo+R6p3IZsNNBOw/RE4CEtlOOBl1Ji?=
 =?us-ascii?Q?T0xL3BdnZq0DkefRv31jt8MLEX1yXmzy2rCWU5R9qyRBTuqducTKFYjUlFjD?=
 =?us-ascii?Q?1Fjv2pEUIKJf9A1AGHdNGjHiTqpY8RTD5NeDMakp7GfOcdSO/gi+lRy2Enlp?=
 =?us-ascii?Q?9j3FDc8EK1Py7q0wXu3Yf8bas5OSTK6RmkmQ4cmcO5SoTM9hTtYXm7fk8DUp?=
 =?us-ascii?Q?B6jnkeDcFuWV3pt5dxwpD6/W2WHwsuswFg+bxN2P//vp5xfF+X76PVCliQj4?=
 =?us-ascii?Q?Eznq2Y0PS+vkZP0rMsmXWL6+YN+LW1wTDerKtddB2R1eK9TfulBnTY2EcZZh?=
 =?us-ascii?Q?1+4/KQLv0wI022eZnMBuLokNP9rG97/GJ3HrTmnvhCZxaUrBZadEl+3qb+Oc?=
 =?us-ascii?Q?9YubAJf5hZ8TyvW9+5JhOoupcBlFfaAmVh8kI5u0nhdF+LwOq1uKm65jxqBB?=
 =?us-ascii?Q?ss+YtOv2R2hHkXe7XKP4+aDekzFlorsgiwIPEN/w7gSHg1axsfqogv4Bpi38?=
 =?us-ascii?Q?rhvjtRtjt4FQVnXNEWgA1RQW+ATn1P4fj/gPBv4BtzUzPwGdCJFhSgCyJYOW?=
 =?us-ascii?Q?mziYhEznwp4jTwb501bIcFYYO8gJow8cdUB1MlsfE8PpI5BaNVWQ8kC/wTyN?=
 =?us-ascii?Q?4L2vd+TJWhBtcKrzHa7siOooTiH93LiGqhX1pnGVSNSQbySRJ/xgnoT4m2QB?=
 =?us-ascii?Q?6XGcUvO21w5cQpQlDZEHYyePOBRt8Iu6+mJmKQ/njTB9CeZe/Lmw/GqIMfhG?=
 =?us-ascii?Q?tNZZ4bPyIjf8uNQ3vspBGWwJMJDkkSf2EboCSpdyejmmJkDxFDnWwJ5SJq9c?=
 =?us-ascii?Q?hyfJEseVjgv2zFDt5EfTYWXZVMnHDqPtj+jEiEkWYNlFuj4SbSD8sVEWcsUi?=
 =?us-ascii?Q?J6WGOj9Q6N7v1UiEqrWMyQ2dC2JmjGO4yVlaDnjX1i9M1R7m8xGyLm/MajdL?=
 =?us-ascii?Q?yUmAodC9IRDU11SjhQhvRhOWF9KDFT7/Gd3DgKR+Nqst8v7OZBnwGJ8Rcr9b?=
 =?us-ascii?Q?acMe0GIcORxH4vR/ZWYiyw6cdr1k8Ik7Apm4+EgU4GiQK2RFdsT7kC8MynxQ?=
 =?us-ascii?Q?YH1Yi1cyIQv+R2A7bcjqAn4vik4vyYvGf+9D7rjzs6wkMYdvdTgOCzXHUBIM?=
 =?us-ascii?Q?Du6teD8gbWIEIzBrdoooKlyxAb8/R4kvqRjBVOyZOMKNnFXW1xzZ5szKBW2H?=
 =?us-ascii?Q?jLBpHJfUh3LM+vji0C7VgMy2+qtKrYm3IjbIZEGTWkPpSvaideIrKFuRXGNg?=
 =?us-ascii?Q?VwbMaRn8LlYc93lqySRQG5SMikVpA2qm6DMIK+PUSZtOTXxaBoBFI6QX0C4g?=
 =?us-ascii?Q?guQPk+VdshaUSpjZcfGPh+uTTl+YDXur+W78k0O0pgYAwLY2z4tEBLEv3qMN?=
 =?us-ascii?Q?lIyxalF0OGIxUOpBUdSKe5s6KCbfD824CC53x0HR9/dV16kZMMjmEEfSfdA/?=
 =?us-ascii?Q?XtHV5/Rfu0PQ6rfHLrUb2K4QYo9hzpZTNfyIdkoVmA7+LHx3vuYlglM9gTQt?=
 =?us-ascii?Q?dCfJ8qXBHY0QnQ5aepyA4KaojUzRNMZfmu+7YdnORieQrITmQfY5RgMVMIyR?=
 =?us-ascii?Q?KJ33/X2cvo/bLu99EthaR2I8oxq6K3pkF+Y6RKyawXdAPR2eSe1luiHFQHCJ?=
 =?us-ascii?Q?gKLDZ0P27jlZClctbN+xtvTdOe4zClcO628wrQcHXSkoaGj8Up/zfUwkGxlh?=
 =?us-ascii?Q?nX2hOmc/fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 454d74b9-9990-4291-53fe-08de5420091b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:22:50.2606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roJTX0XST/QIlsgP4WXYw/R1LNXK5wbz5ddYoK2g+2zujFlvrRTUWNheWwj8ZYVsJvVLHnz8qW57f09Gm0NZvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-OriginatorOrg: intel.com

>> diff --git a/arch/x86/virt/vmx/tdx/Makefile b/arch/x86/virt/vmx/tdx/Makefile
>> index 90da47eb85ee..26aea3531c36 100644
>> --- a/arch/x86/virt/vmx/tdx/Makefile
>> +++ b/arch/x86/virt/vmx/tdx/Makefile
>> @@ -1,2 +1,3 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   obj-y += seamcall.o tdx.o
>> +obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o
>
>Not clear if seamldr will support other features besides TDX module update,
>
>if yes, maybe more general name CONFIG_INTEL_SEAMLDR?

Currently, no other features. So, CONFIG_INTEL_TDX_MODULE_UPDATE should be
good for now. If some new feature emerges, we can add CONFIG_INTEL_SEAMLDR and
make CONFIG_INTEL_TDX_MODULE_UPDATE and new features select it.
