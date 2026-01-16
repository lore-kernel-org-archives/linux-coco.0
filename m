Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8BA34CFB1
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768544070; cv=fail; b=db0ZyyO21qUYITTh17yLWTcjbcyUa8Hn1fWQtplcGGdOB2IOg2yy3+bUGMxEnmf2X+Il1AQ48ibjZhDGxQHQDuPGz+rr6+lRtWXdJJLp0rQCIswiDYOPqMdjjmy5OXLGvMJbqyNFSAy35kzlvE8EsdY2mBDDSHqKHctHk/YS6AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768544070; c=relaxed/simple;
	bh=2aFrEvK/Dkn7AgvEleovZbmYTM4H37CP2r0Jrj3AVD0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PomXid13VUVERUsbdM+8EHx/E+UyfkwGnkIqtBDpO+jYa923M1k46c/nsyrjlsYYu9xNBTPeGRGg70BH7ro+HQw2dva4t7hNb0AUliXvA/BBhHmef4zTTspVbTR64jXjvcWYhqJ+q++JfCEMA3Ht3dn7OX1c1oupvZUilmLyb/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBocoyJB; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBocoyJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768544068; x=1800080068;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2aFrEvK/Dkn7AgvEleovZbmYTM4H37CP2r0Jrj3AVD0=;
  b=eBocoyJBtAxRJ/BGJ8kLrAL/hqCD9kDqddGBMTQiDfBBlnKz1u3QJ02Q
   Ryix9LLJiTtYWQg/IbiVqPQUdq3zlkczHrRLJmOeMzHmEC982j+UFeopG
   2/FOZrEd53A6cKPAxPPYblg43nKvDsQUgrUnSJhce3xxnpOJurgnhPnTQ
   egN8POHmLwC8BaeyOaKW3V6qEyVUsNI2csy9NZmz9i64cXo02Ww22OUsx
   FnKbXDfbtcMdS5qR6HD2z9a1iE2GD9ct76GetQteMFKvSi+utT0fZcnZK
   eBFLS/m4CCRDY6vLmQL8frZ5oUg6LHWh09s6gMw5fjSBnbj5X4AYvPrCo
   g==;
X-CSE-ConnectionGUID: Jn/ja0I5ROa7iIb4L21jCA==
X-CSE-MsgGUID: WUA7c7OgSE6b2F7Hq9Lv5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69948842"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69948842"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:14:27 -0800
X-CSE-ConnectionGUID: LuPgyxIsRJCGCHxqE66iHg==
X-CSE-MsgGUID: HZHVYoVbQRq9NeTxisxLOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204303807"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:14:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 22:14:26 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 22:14:26 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 22:14:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiGQb9pk0vrOpBUkXVjp7KaR4jxd9705wkjQuQsvSW3xVVk237vd0DxX6eokA7/lOrU9FEfpTvdkSkbPv4TVKCXkW8HRCX6cAFB4fzlX9vq1qtYhL66KM5skwUAJr7KwW7dvb/aKgCjPmEAt9/Zl22HriG2JzlHAp3GwuRq4mmEOTgmQOgVtBot/A1TtHTfgxUO6LMOg93Z0ipM/kzlsJQ18tkfvV54MR6sfvWJlln7dAGGRYWCVNd8amtrLjYSwsg4R0lCp94re4FlirPi2+Vm1Z9RVnCQZbjENaLYRBR6UO4JgAigFTenPD2++s9xLo0mQjfM5Ftw4ue1exN+ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWwZCQYlQyOOp0aEzmP8qQzqLVD3KNRxpntBEvw1Zlg=;
 b=cjI/a+w418Pfdv2ryDsbRk320RfDmfDYN2lG2IGXcdmSzj2AN/6uB6GvrVUHJPCh4Z6qYxAXFhJSFJY5QgPrf0leiTVwls8rHflMQkr8zPOV8Mo2s2Ok13Hei2WwbK2mVSxtvgVEPmJprXAyBv/E0UGa9DGoctgviV8oP7Gkl2t8cJ6qX6FOuZ19QSSPbc3g3a4oN72Takk1JQuFSN3P8TSPfCHG4MaLKci9LzVBa5Hu3YR0uThtAEY5fbHPnutS9kAta5UMcHSDl8cJJoRoj2LbGojnVRY8lZ50oZzb3j1cQ9LLs29ujgJ0VPDItDturQ1r9/gQA413rl1ZwtMJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by SA2PR11MB5209.namprd11.prod.outlook.com (2603:10b6:806:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 06:14:21 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 06:14:21 +0000
Date: Fri, 16 Jan 2026 14:14:10 +0800
From: Chao Gao <chao.gao@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>,
	"Farrah Chen" <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 11/21] x86/virt/seamldr: Allocate and populate a
 module update request
Message-ID: <aWnXMiIa8MzQt8qj@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-12-chao.gao@intel.com>
 <aWc7bq+EiQiME8nl@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWc7bq+EiQiME8nl@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: TP0P295CA0050.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:3::6)
 To CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|SA2PR11MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 61c2f7d0-ddcb-44c6-f9a8-08de54c67ce9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wKTEMaxEyFT3OfdMzUYggf4DwvwvFbGaYOwI2vYjVZfNXYUIc+5r11ZP25dU?=
 =?us-ascii?Q?7sneixwZGedrZtbnTjCJDFEEOCjMiIpNmKu6YK1TKLoOPLvy6eRwS3+4wIQm?=
 =?us-ascii?Q?JYm3K53w7Pokp5DHxSyZpfZCegmyZRFZKUVP23iEhay+nFm2Le/4X6BpFhdh?=
 =?us-ascii?Q?QCoEL4m3rnYZRUGegktvLHie/NJVECXNMMayTZ/xVdu8V8kuWLXyuiNyD0QX?=
 =?us-ascii?Q?+V6n/6KItTnFgV26cdSXxuAgOvfhNkXxaU+wjCRlU55czBNsy627JSBvpdI/?=
 =?us-ascii?Q?xn2a9tqz2kf4oNIM8YBi6l0Ud7DqAOlEpW8Qt6i2K5Ymd8Bc9am4tbdovvu6?=
 =?us-ascii?Q?VDHMI6KRdH2jc6jjEbmmQxyF2USGcuEop3eIbBW0EdW1o1fYCld5Z/MkVq6Q?=
 =?us-ascii?Q?GNBQiPHG2n6HCBnLcvVsjyf8JpCGqjefNHlKndp0R2goojFO7Gx/Msa7V5vv?=
 =?us-ascii?Q?q8nF1T2YoIatrbjI+CbkYZ/JPF8Ajeguv3kEImJZGrXFpLVYEh9ZOl1zNYeg?=
 =?us-ascii?Q?DSSI4yfLabEfcMBXMVGbCph7OV6x9yrA7s+yBz8bboO5wj3OnOm4/SWfthjN?=
 =?us-ascii?Q?KK2yHVKdmUfM6WZmCLHiWFZMCT6suOjNyc56Bu6XRzPnE2rLflEoViqswVVZ?=
 =?us-ascii?Q?WLmjvuszPcigR5eMV+IMvO13Gg1KVm7koypVdzjoCi0tsNQ3ot9Xosptmq9p?=
 =?us-ascii?Q?maa8VyiUEDCvWc9yT8/jVaFtsNIpzAfAEhf8ZL0wwj8yQf32H62Stbtmj+ZR?=
 =?us-ascii?Q?jVKyhYP+7PPYsBvPQwlnT/CiFySJ7y38NJI/Eu9gvB/yQwL1seL8YCWsTTft?=
 =?us-ascii?Q?dWMcB4JaVYXbJpH8OX8AL3vdkbHlnlx8p72/GOnKIC7kpN7hPnwJzXvA0m6A?=
 =?us-ascii?Q?4KlhCSGllZgNDytTXDaIol2OWRiku9vo77k38z4GzTOtT6UBe5xQEBXmHmhY?=
 =?us-ascii?Q?2SAP+So4NNF/VeRCrsQOtY04LZGd2lTO8Fe7DHHqkny9QUBF5f7c5g4u6T/O?=
 =?us-ascii?Q?NBM3NSiafo0kQwcTv1ubL9rDOG3o3Apstf4qk1NrrLSDUxR84+RPqufmDOBi?=
 =?us-ascii?Q?eoDS6I+4xwos5TrlhEXtZ7XQ3AR4ow4tJmlRWM63dP8rfJ/CdUY78zdbiX8Q?=
 =?us-ascii?Q?aJXppMEidsFxPtnF/BQvRtgvxpgXHfRV7S0aE43eYCLdpJ0egc9PH+rtppgX?=
 =?us-ascii?Q?egPts3fSIm7uJ84S+kFD1UhHAE0FeLE9SM9rhHzaigmENOx2lWq2LrfacSz4?=
 =?us-ascii?Q?AwHRwbqzVi1mhhL7jLQQX8v31+iT/XNEnnXRAkD95yvlbuvlSK+d7UrKixNz?=
 =?us-ascii?Q?yFQ8DoUxyJPxPkvx2fXXoo5PIwiLlQZToNdCRg+c3pz6fTVQUdBfw5b0/Syc?=
 =?us-ascii?Q?dIDsuXHJdOYgUTWXnPyZ6vz8Vt7B3/s+hvzLgulXHadhFcsX1QBtrmLJ9Zzh?=
 =?us-ascii?Q?HtnD3O/ZerGn2aVar4zCe+zVmC3Dyb7fXhtvROXkI3eZYzvOpSTvFMWphGVl?=
 =?us-ascii?Q?xH+IJU9WftOfmn0SB1W744y73zGwEx3/NE7EQAvJDTJXjxwD8I/L3s0kxz8q?=
 =?us-ascii?Q?YBTN9TP9/PXhci+026s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTq9cjAzuLI+EEv0K2YkxrevBxZ4NTF4F5EXGMTXqDF/NIpOjmojOkdzaWnn?=
 =?us-ascii?Q?bYlMFoih1sxh1vFHKZGIZWYCWDArJW2TVaaS7MR5AeH1E8D0eaTGO7McEow+?=
 =?us-ascii?Q?R0a2xufa3aXNecr/GTMyLh1Ak9HfWHzvMJKoJpUyXltL5BZjtt6Yg/ZaTBqY?=
 =?us-ascii?Q?afQUgPARWKQkYSIudJlkCBu9c0brUoOA670gnfQGWqZqcD4ZEYJWAExwU+DR?=
 =?us-ascii?Q?0ywi9gFZtexvRECE06V+juDBmWkH4varBElJq9gqr7EyomA6AIVERB21dV+n?=
 =?us-ascii?Q?KCi9vRY/kg01AfB1AfRkboblZnkzksMwHYi1UWeDTIt1WWtH9RwCsdEaByou?=
 =?us-ascii?Q?x6oGFSIN1+0ASoT5fR1WKqb8mQJBtCLXoU7H9ja+5xlPNza+YlEplMFnFi3X?=
 =?us-ascii?Q?8kYN9YryVtWWEwDE42YF5BJs28B+sWybj+6CxYUwcJknnY+MVQ1yZyP7KOXA?=
 =?us-ascii?Q?Iu20DH7a5kFnPJ6vj7Xm1UDkZuBDVr99+MltkxJo27s4YsdUAcMFNJ7ium7p?=
 =?us-ascii?Q?Izb4XiuFWb042gUe3rMJQhgSyD0qbHj0okeqeBrj8+zQsEn7Vaa2242vXtoa?=
 =?us-ascii?Q?F7UMtlMrEkVlgVjhqkeSD+m3bisFFc0BQA69M4pqOzNUdeJM36NHwI+wdSfH?=
 =?us-ascii?Q?9dpMziAGHrkhYd3UWW+deUKXcvgSlDCJ5+qcbhOytEzvkU4h6Kbixw+4cuFu?=
 =?us-ascii?Q?9pgPWLRIr0IYdDmgREnCqck0kEYRZXHLz+DNRUOOQGBbpfHhq1q88G2oZJpS?=
 =?us-ascii?Q?Bu9TytBle44SPTkJFBeXVsioETTfAYgtsv9c6CtbrxoxfMgA5Ex3bAxRkh//?=
 =?us-ascii?Q?dJ9ckKyQ3YmfoTJXxjuUVw8+M1NIZp1yFjmQlJCY/COS8tObs1vBZ7juWpef?=
 =?us-ascii?Q?oHbgyrgCB7zzlJrEvFTVly1G2lIG2wxbY7QBXGpfu7kLfSiGNXnyMtJslRui?=
 =?us-ascii?Q?4eOBuHWXnZXjx2fuEn2OUQtkSaxU9Q7xMCU9hw5rpblFIJ1/l1KeFQUcSaVM?=
 =?us-ascii?Q?NL18UC3WkfrLQS71e2Hg1ImAS3WP3JBmckgVocul+CY/W3yfRQuNstc6roJP?=
 =?us-ascii?Q?0YU7/Yr9ddn6CJqKNas7YS5Je9LVQjeAKt5fucCgsuasJuiLb/fwCRB6W6lL?=
 =?us-ascii?Q?Bw/+F0ENoxTk1KhnZcnSKgInjYUnNuMD9mGX3QJHHerGrzlwrx8gzciES3w7?=
 =?us-ascii?Q?2xPGo917i2Voha3whC6/55UcVeg38X/NhFMUyF9Vqd11zNRsCy8tDlxbyEMh?=
 =?us-ascii?Q?5uYTtGtyquB0CFwU3OOlpBa3psrQjH9yJOUCwqCF1pTOjBGDk0oEY/p1ysLP?=
 =?us-ascii?Q?VE08X/m3C5g9Dx0EBcEG4PCQ33ELj8krrtZRuZ6jnmfiYZzZehdZ3WK+tHi6?=
 =?us-ascii?Q?J7KvJ+l1tlQZoK9fzYZoBkfgRMuEavcRaWiku8NOl367lclgRWMFOyRNegTp?=
 =?us-ascii?Q?Roe1nf/tUPSpxb+2OEVIqsITR1fPjlBGSkcJhviwzKNpRy31UfwaeezTG+Wa?=
 =?us-ascii?Q?pD8h00GD6XmWX5OYeA/cxhxCkggsW4+O+hn2BSrLDm3gHmmtS0L+FB1qSyRB?=
 =?us-ascii?Q?9ESkGDk8QWyqFAZ1omnSqDdov2sPRjpkziuT7o88n8Z+HKTAtO/41rRPbZ6s?=
 =?us-ascii?Q?CxSH7M5rtLKYE6EMHZ+WkUEmK064YAkp4gdka7nBIgVOeQ94qOQvwMH4wkuk?=
 =?us-ascii?Q?lmt4NnzyqSnoLsMkoVKEIfVUipmO7TDdNWt9PNxUwGXfDgmo9y6zyzJ6kYnT?=
 =?us-ascii?Q?1X7kj5j/eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c2f7d0-ddcb-44c6-f9a8-08de54c67ce9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 06:14:21.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EweHwVFkEGx86574jpwm44zNxyl0IQ8Wo+hs1ANIgB6DXmcF+a5RLa69hV8mFJsvfomc3i9Ste8qb8OaH2OgBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5209
X-OriginatorOrg: intel.com

On Wed, Jan 14, 2026 at 02:45:02PM +0800, Xu Yilun wrote:
>> +/* Allocate and populate a seamldr_params */
>> +static struct seamldr_params *alloc_seamldr_params(const void *module, int module_size,
>> +						   const void *sig, int sig_size)
>> +{
>> +	struct seamldr_params *params;
>> +	const u8 *ptr;
>> +	int i;
>> +
>> +	BUILD_BUG_ON(sizeof(struct seamldr_params) != SZ_4K);
>> +	if (module_size > SEAMLDR_MAX_NR_MODULE_4KB_PAGES * SZ_4K)
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (!IS_ALIGNED(module_size, SZ_4K) || !IS_ALIGNED(sig_size, SZ_4K) ||
>> +	    !IS_ALIGNED((unsigned long)module, SZ_4K) ||
>> +	    !IS_ALIGNED((unsigned long)sig, SZ_4K))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	/* seamldr_params accepts one 4KB-page for sigstruct */
>> +	if (sig_size != SZ_4K)
>
>Why we check both IS_ALIGNED(sig_size, SZ_4K) and sig_size != SZ_4K, I
>assume the former is redundant.

Yes. it is redundant.

But in the next version, I will implement an extension that increases the
sigstruct size limit from a single 4KB page to four 4KB pages, so this will
become:

	/* P-SEAMLDR accepts up to 4 4KB pages for sigstruct */
	if (sig_size > 4 * SZ_4K)
		return ERR_PTR(-EINVAL);

>
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	params = (struct seamldr_params *)get_zeroed_page(GFP_KERNEL);
>> +	if (!params)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	params->scenario = SEAMLDR_SCENARIO_UPDATE;
>> +	params->sigstruct_pa = (vmalloc_to_pfn(sig) << PAGE_SHIFT) +
>
>This void * buffer comes from FW_UPLOAD callback, which is a kvmalloc
>buffer, so we do vmalloc_to_pfn() here. But that knowledge resides in
>FW_UPLOAD driver context, the kAPI entry, seamldr_install_module()
>doesn't say that. So could we add the kernel-doc to specify this
>"const u8 *data" at ...

Good suggestion. Will do.
