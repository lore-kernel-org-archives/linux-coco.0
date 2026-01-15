Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F21391
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768455481; cv=fail; b=fYGwvy7n+t3nI6uJLhQYVGYhhE8tlyWoCmTRF5hhcLfZbLd3YQKHPgFe1ZpU+Nw98Ryh+voj48yQM+fcNGX3ukSBD8PTfRYSYtQeiifV9IIIACHpgxmo0Ozs2hpFhxEHERFu0YtZE8mVp8GD1i2WhNaDdjwwQRssAhhQpkMnOmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768455481; c=relaxed/simple;
	bh=0mzKK4HhLGOAXP+xVhZXBk4HvrFwjk1C+P4xIBnmAIs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mTvTmqqnnxLzuOmcU6PO/OBkvRpBFEJU38UCw3oxR62auV1dqpgFdCn5R/QwiIdR9xbPweQkFGITLrYZy3TsJR7VrNv+gZH00NQj/ppr8ZpvkgCTlX4ZBy2meWwBu3xPWJeXy/ncpzDaN8JtZtQcQdeQlRHjnqtxSRF4NiaDA24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJxN4ZZ3; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJxN4ZZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768455480; x=1799991480;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0mzKK4HhLGOAXP+xVhZXBk4HvrFwjk1C+P4xIBnmAIs=;
  b=IJxN4ZZ322Pm/xCkeh8uvggb7IH38/lNhnjHXiGL/IlKLUUAJFaujfei
   ZJjTJXtnRUzQ/NXY6i5JwbnNPRsforU3HzV/KShqUxR7EcUknETqPtZj+
   WZMhsKA5/Qs179Bf0sZTk6Vh0q3PHsdCjH6BrzEC8McxtziVYLOw5wOPz
   l/GNlRGUPFqdxG//B617g3sB8zYjXQu7+xPQ/h5NZRhWc7q2N4MYj5DLH
   1YQrUCL/ZuhnL6Qy5qRLtWmJ81HXsApo9a9CMqt6+l56+HIaRchURD3ot
   LmgU8Q9Z2zkXnl8UL98Lodls4eHyNOalMyhp1wh3zVePRS+rLkk3elnHX
   A==;
X-CSE-ConnectionGUID: huWR+KpCTQuidSl08nmgXw==
X-CSE-MsgGUID: DwYBYKdjTZOPpkJmar214g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69846503"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69846503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:37:59 -0800
X-CSE-ConnectionGUID: GXFbGvkyRNikXAQbzuM8Vg==
X-CSE-MsgGUID: /eml0TmrQqCPQ9lZ+zQREg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209732914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:37:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 21:37:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 21:37:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 21:37:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsEhxwBMqb0xxKkCL+GcbbonP/SFOj7PBvtM6EKnYpEVKtCeohsf9orx/SJe/Z80jcEuz5KQJl5eYuWuleM/27VeGC2pnK+ZUSCBLXl5O7nb8d/NlAI8Q0/QcQQ1plL09JljxXp0/3CJSgTSRBmYvRFSpmusqgcMIztu54CnTpHPnJA9wCqpOXTOA1jNNc2N7tRWBKNq8aaJauL+GralxXvqQvA2fgMqfzuG4m5YMPPpoWv7WsWma+Pc0F5sEo6UUnz1d9jWDIwVDflkZt2I4giNadn3Yqi76ywB27nt2VODekGCo+mBp9EdzBlLnof6FRzDTi8pCL1HC5qH2jDNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYBnauIJWMXf8W5D1LKP+93VFiBgDrnXxg/wA1ecVVg=;
 b=AblAaR1CHCTmj6iz+znSDO32zS2+hpYHIDHFfKuqkE8RA8YipWEC+byENb6nRthNT0E4f6u3wZ6WV9wy5le5kXuIiPn61/gXJg2J+osdkVYwVyAbGCPDCk/1bf8nHkE5rrus2nh2YT9Ty7pwTppMJXzuJamfs97611nt2gvfI22cgwKKv5kRV5DNI8fO+6a8ctYywOv8Og0X48P7mq9P5rc39UMLgD6/oKHfIuEvlpVkWctFaGtWtWOl57kt/+5xpkdY4I1gO8Nd62rTMQ/2Wn5KxZSZa1w+/sw082/q6rRr0+jZz2ZmnJ+tdKbM9qv9IBxvpjk5BRA+cl4uLaoEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 05:37:55 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 05:37:55 +0000
Date: Thu, 15 Jan 2026 13:37:42 +0800
From: Chao Gao <chao.gao@intel.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
Message-ID: <aWh9Jq3CM+dkzqLl@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
 <193df77d-4034-4ebc-8c39-9f01ec9936a6@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <193df77d-4034-4ebc-8c39-9f01ec9936a6@intel.com>
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 736ecd14-3721-4346-4ed6-08de53f83b6f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nP06wTF1PXMOIH/zIh3Ohwref/X3bNgdjwVcnnoIZMfl1oY+BasFBSkiANlV?=
 =?us-ascii?Q?XcobcGLDreeIgZM3wWj762coBVXB6z05jXAvmFja18LCvhEL0yAiIJ844hcI?=
 =?us-ascii?Q?T28jZLYnyO8UrW9/+UdETHxxo8Y/FJv9D6MdWMbiGd8wSFDj96N4K6CoFby8?=
 =?us-ascii?Q?KedtslirFwQb6b9XOgkSL2Cb7k/1Hisq7hLh6O9f0sCUVG6NJa/DT41Yx+D6?=
 =?us-ascii?Q?fzKaq8d5VMJOjp9gW2Ejterp2ER1iHJDUMaOqkjaqesJlziVR8lVsRda1Gss?=
 =?us-ascii?Q?EHpfggC/uVGr/f5U3dL546FCVz992xo5LivOTXoNwoxWmGmgy9S4nttglQ+7?=
 =?us-ascii?Q?TRPtG3mXtHtz8eTPGPvkJjQryoD1RRx0nT7waeTe+wIrxvQXUYRpbrS/nZyh?=
 =?us-ascii?Q?FEZ+bNs80dPKg0At745agDIDC989+eVs4WcrK9MB0hDhu1KUIM9Lr2VkMXtV?=
 =?us-ascii?Q?qfRO0tZ3fG5Eb2xm1Qqbjf8NyIN0h9tyoD61mX2lvPbz/2H8bN25bTKpLiNo?=
 =?us-ascii?Q?LL/2B62FhEEc89XWni/foCxJPM4al8nDPIWcCuZJsPANy69AKetIPcFytdSq?=
 =?us-ascii?Q?yaI6BIguKEPoo1ZX2TKzqchySG7rbfz6O9y710pNaZ5gXB/jwGhACVEE/kKD?=
 =?us-ascii?Q?qWXdGEYehwq1nTRwGQcfdCfTpCMd7xqz9+VPsEvXDpBhYcPkbqlowG9JJ1Pp?=
 =?us-ascii?Q?p+ZrXE1yvsEv/G+U33jmIIjSVEuyChRDxlPascBHqZ7q75EfCWlvAi73cdPv?=
 =?us-ascii?Q?5VRA206EzlSyN/FDBzuQsupzzPCKlC4MuJxDm/yK1vUgE4MafmtIh9sMs/Ka?=
 =?us-ascii?Q?Ya/N8YfFFJZ4bwHWebG5t1HXShb8wXVG10Muz/40/DwwyqfHC77BtX3cSX1n?=
 =?us-ascii?Q?3jI7/TvK9nJv8BAuWgoAMGVowFMYVlX3OOUeLk4/JI6R/hfa76WznNvT4vdx?=
 =?us-ascii?Q?g7EKP6Hs3Ehy6Oh1MBm+sTJbjT2qASo1GFnfiTLpBaDuwiA/sIo1ORNaQuS5?=
 =?us-ascii?Q?O5A9jvs4TqgqnFoa2UbgjOkdsnLsbDS4cSRZ476lZ/f2CdOQ2B38LjCtGNEY?=
 =?us-ascii?Q?3WUocxAMweoF4OgaJs4sn0w0edikmLg7doenH8IqxTJopmEDj9HwlSqSP0D2?=
 =?us-ascii?Q?RVeA3BSwq0Qg8MUIhNmGtQrw9ypIsrMjInTKrfq5XPqYM6NRFOLn7QTMzuaX?=
 =?us-ascii?Q?ZnmHHdYYdAHE+Bk0jCCl1gv4xDYFrJNMgrIu9fkKzHWMjyyX/NqVVM9XAVTE?=
 =?us-ascii?Q?KsIDgBPu7272xrGmBgHZQhSe76MJi8STmTKj7DoQXuGmYv7CXymmncCgkEM4?=
 =?us-ascii?Q?OXY2JZog+oG3Aei+K8c90KPV5hu10hKV584EJL83NGyOb2zpo+3AIEHFz5Xj?=
 =?us-ascii?Q?lXIDiKDuO0jNmOdvn/IaN9L7SF+EMA2nghNW862AtqL5tmM3OKcRTQsUZuJU?=
 =?us-ascii?Q?WELtB0XYDLpZsuAZ/JIirM5e/72SPccwFZcjMRdK9zXwx5tEZ4BQWWVEeHLC?=
 =?us-ascii?Q?QyruPC8WD4bKt+FnwAw/nHVgSGf2ly0Tv7BX6I7sVljZT6VFRrbr+Rh4KhUk?=
 =?us-ascii?Q?4VKDnE8tYs16lpjO2vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1TZoH991xTP7yLins4zyZkCd4EwPuk1UC1aBv20c77J8YK1mYMJzE/4XiZfg?=
 =?us-ascii?Q?V8kPIHn7/bIcAcLdX8MNRxRWP9MEMDhS46hVRtO/Ecrjmvkftz0MRcdXYOJm?=
 =?us-ascii?Q?26nO+p3pu97U0nrewzl9ZG9ktIVzTXz94Kz7NBlSonaX3LX/hPkDCbW10xcW?=
 =?us-ascii?Q?NdZ79XhWZqngcCSDhhrgwwtoNO8RpevbHP14TT8PcgdydMskuGr/3eKnAesq?=
 =?us-ascii?Q?0LlWpuY2P++6AdC//3FPanYxx+L8odcNPXLhZrs/TxH57VeybW/ldUSW3Lix?=
 =?us-ascii?Q?JYYCD/LRr6Jplhzp6B9ANRG24VMilqgDc3dKC0WWVZHHYkCQNDbc22HB+K6U?=
 =?us-ascii?Q?jNmhwLGD3hdAicjtUnXIbzhsHP3XG8jLihOvjGvxv1ru0V9GPh4mRpLSmPSK?=
 =?us-ascii?Q?2CHJdWLrC1PxT5xbYPqQyBhzAQ5Niu9ywZsx9ItFvpgtypUJZif1UmDtTT0Q?=
 =?us-ascii?Q?IQcwePRRnUqu+iuL5ML5jHSLZ+MaZ9mZyPypumYEBAAGxODsi7osTtWVDnxb?=
 =?us-ascii?Q?pQGSEK9u7vdmy1FfrscHKDlrxCk5ErNaL1yFxyM2NL3dMq/qraJhTsDCO18B?=
 =?us-ascii?Q?uLgABcwxNBtZLcdNVoCRzU9T8dEXolkQJH3S+Fg7x9VfxpFJJ5tE8ndGGVPg?=
 =?us-ascii?Q?lxzUyhdMN6DyBGgBApPzcgp0Bckzr+X/t34vYokOGYEju3qe4QoJ9hVg1e0b?=
 =?us-ascii?Q?6UCFe6cuZTguJvxYFDwWUd9YglrRrUmByIcq7yCJHUsYHflfFiiG/0ILL8gS?=
 =?us-ascii?Q?W1k6BDnTk6P5kySQbukZrGkVOM6Do3MG9Q0Tk+AxTGDrH0IzxQ8yLie2VMjl?=
 =?us-ascii?Q?8MGwRcGcnKCR/4c0VmbTmQWDzO64oeWEB+UC6zEVFWpi+QptP8t4ptf5mExw?=
 =?us-ascii?Q?aZErg/Bzu6IkkxPvWG3UgX8F3BC4+AVBut5u/3+7yRSLRUS9ltIqHX9Vq3//?=
 =?us-ascii?Q?7POillujhjd04cAXUei86SoGIKnBxsw54hq37leBrDX+wdC7mZpxTNgL5uzZ?=
 =?us-ascii?Q?DBdZgQD6mflns3+E7X3GhKcMz6p9E5lGAiWnUGDwfU0VrkTIcpUWx9PTcPNF?=
 =?us-ascii?Q?TGdmJApsjO+RzGO4cc9sZJabzvlhGIz0Aa4V4C93khHI6kaMUCsP4bMK8HaS?=
 =?us-ascii?Q?ROkYjqN3AmVRCrywFvOgumgubTIudJDzSRoRjM0zAxlgI7UtoLA5aDwG+CI4?=
 =?us-ascii?Q?8a2UI4ITiIffc9qa8AgMUg3UYlajnml57OLxDl/qn2xrO/DyhlkJXvwTw1RN?=
 =?us-ascii?Q?9M3Iwfx05MJYuiO9IpWOUi8YZiGgqs0U5tmRzXJmBGLwOj7ykayeGIZvp02e?=
 =?us-ascii?Q?jCcJlULH2hzE5WbBHgmYQmSYwHDvGbbyMkZMq3toqqfWNXnSftNUyd3m2Dlo?=
 =?us-ascii?Q?aZrnkdk+vG10OrYwq1DNBfcdPTpwGohEukBt1csBjxhvhL96cLYR9pn0aVcO?=
 =?us-ascii?Q?evF2C7mOJSDLmYsFNSWJraGJfiryY4sFaRYwgDXerBm2JC+Z+C+3cLhJJ4Kk?=
 =?us-ascii?Q?z2N9GSBUh0s13cXq/LQbq2Y1QslS+dQEiwAtsCvlkevPsRYDgMlqUB9tDqPi?=
 =?us-ascii?Q?qGfGv/nxxxL8iqiqku6wqPhVf+q/3P+A3ARC/+brpimT0hlm5m8KkRrTGCVh?=
 =?us-ascii?Q?il0wjz1KFWfdViz5r/kYJK3tK7UVi6h2AHX430YkDrlrz8QtlcU6e3X/G+Py?=
 =?us-ascii?Q?rnee99bSzcvFvdRloFHp/onWHjjxzhr0Kwr0bBQCbMmsslJiRCbYvIQ1IoB2?=
 =?us-ascii?Q?rOtqNow4aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 736ecd14-3721-4346-4ed6-08de53f83b6f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:37:55.1736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxjpKfve2pg4M8Va5qF61sCqnVNDb5euhFHE+7xN7BNrd9C/GL4NDwvl68wc7TnlQIX0h+RxQ07/TAxohBo/Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
X-OriginatorOrg: intel.com

>> diff --git a/arch/x86/virt/vmx/tdx/seamcall.h b/arch/x86/virt/vmx/tdx/seamcall.h
>> index 71b6ffddfa40..3f462e58d68e 100644
>> --- a/arch/x86/virt/vmx/tdx/seamcall.h
>> +++ b/arch/x86/virt/vmx/tdx/seamcall.h
>> @@ -14,6 +14,19 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
>>   typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
>> +static inline bool is_seamldr_call(u64 fn)
>> +{
>> +	return fn & SEAMLDR_SEAMCALL_MASK;
>> +}
>> +
>> +static inline bool sc_need_retry(u64 fn, u64 error_code)
>> +{
>> +	if (is_seamldr_call(fn))
>
>Do we need to have this check, can TDX module seamcall return
>
>value SEAMLDR_RND_NO_ENTROPY but for different reason?

Currently, The TDX module doesn't return SEAMLDR_RND_NO_ENTROPY for any reason,
and I think it probably won't in the future. But it isn't ruled out by the
spec. It's the same situation for P-SEAMLDR returning TDX_RND_NO_ENTROPY. So I
slightly prefer to keep this check.
