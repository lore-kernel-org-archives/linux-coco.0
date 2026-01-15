Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCED6357705
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471947; cv=fail; b=Vmr7dyLnFsb3UaziB6fBFJDYg/ke5lC8BJVRrM5ZLwqZahWzaFulUbUktwImswv8/1bbgOtRbMfwf52CW6v2OFaHcNV+ytJDuq9iRk+RS52Bcgg5Cg+0VgEe2VQd5ZAr28v6QPyEgXahZT0lAaCH+/8o0+FlPCRw9NPn/V6yqqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471947; c=relaxed/simple;
	bh=Ob9NsgXROStjhAToCH9Kvck4iOsrY+iQ81pEwwun73g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MjQf1ZRvp1brKuOEqP6tX7S16Lwn8CKsd4TQgu+sIrNG5U9oBYy/hHDPu5WqEZ9rdKrZfM071jChUZAmeulrcx8tg1yQmtF0F81unZoPz6DSxnDmomhkomaNOQHHFe9lnh6fBynyVmB68yLwJTgkQpyBR1WpnwdZhv7C+dQfxBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX1kFJ2x; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX1kFJ2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768471945; x=1800007945;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ob9NsgXROStjhAToCH9Kvck4iOsrY+iQ81pEwwun73g=;
  b=aX1kFJ2xFQxj0eGuxXx5SymU7k547PvRJYLhrEh26biLFAJwZI74KwlS
   akCdmEj63bK4UQCNEQojiWSMWDK4D9qqR17SsZp/KZJIxJsX3WT4atY1y
   A9SaHNSIKQ2M1MMAbvkrITodZgmpjhdKzpa1kizWN33IOGt8u8SbK9Hjc
   SW/CVr9BYUg7ya5SZANj/A8aPVampX3WAtzCxSoZ/dAtynug36ZW+PF07
   GAu9wwqaCTh3EtoR6mg7j9XW9/6aWzY8LFTdsjA41bRFyAUKMQlee0wNs
   2m3YD1TUoYaEbgxC7Yj0wF+VP0v6cv2DLMjnG8sGJhwQwhi2jVgtf4db2
   w==;
X-CSE-ConnectionGUID: rrvVPmRASb6mYqeGsWz3Ew==
X-CSE-MsgGUID: N5LPrwtfTzCwL1y07uq6lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80419729"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80419729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:12:23 -0800
X-CSE-ConnectionGUID: r4dcc3eiQwW9cQJInnAmMQ==
X-CSE-MsgGUID: BbEpoDzqR+KmiqQH13xlxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204975201"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:12:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:12:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 02:12:22 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:12:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU/F4YLoAgJucGgYImAUkRLPc+mMJfmt60NxrLXK5/TZocXm0J0SomQUrV8XWgz4WGfNOHUUUrhmhg57ZuYagscjTe8ovjkBcnd60yHJDVJGaqp/ZN0xJiOLn3a5VPhpeYSQNXJ5ZjdofgQdwFKAIOtcZqtfTue6bRgIwyQI2+fNIUzhwBkmW8LWN5M5sje+9MHH7r6B0bBlEl2/t8KLI1aachbnDZ2c7xbZLyb625hdBs9ABL5QvGHhxPUfzrJv3kWmQANy81czDguoMi9XUAgLnnYqYdNL7kocOCYx/61YHuW/ruNt6N4B44BLIbPQUzEWkbeyFzNX1fg1DOH19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7pZcx5hDwNX79MOG2gOLUtIgKbF/UPB4WJjwxx+IdU=;
 b=mZdX8Auk/WP9iohrmci4SjkByAr9SNuqSaych1s1zCOogVr8ZsB/P4fmuMZgsI0EIiBgPS9DUgjAKFqpD9l3dJ+Zv/MdihXw+0ARRkb6em9iMzzTxYp1ZExodhdSX7OKE7OOfO58gCj/GgP52Lq4Pv9lqsZQJSkfJHvVHHaIj+1qKlviOfW8Tzj5KED/GfmnGNX/IRkvyOaV+18vLYNOB5hwRjX8op4JdWGJWWJetIlMjBHMEC8sr4dpBR7i5qgmxDl5Hm+jPh/ISQyyF2aVaA5qNzAvA7VH74jdz7/nmuZBp38jPhpX10IsQlSdMPD+1tDjprzBDZE0A2+MfvATyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 10:12:18 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 10:12:18 +0000
Date: Thu, 15 Jan 2026 18:12:06 +0800
From: Chao Gao <chao.gao@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>,
	"Farrah Chen" <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Kirill A.
 Shutemov" <kas@kernel.org>
Subject: Re: [PATCH v2 05/21] x86/virt/seamldr: Introduce a wrapper for
 P-SEAMLDR SEAMCALLs
Message-ID: <aWi9dlL4Wl4rA936@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-6-chao.gao@intel.com>
 <aWYntT4AIRrnGvv0@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWYntT4AIRrnGvv0@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: 83472ad9-21df-4e27-9125-08de541e909b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nOwH38+GnZ8dGsrevy8cUwldSWHPgsPalykaPTrfY7HS+1Kk0tb364mdOzH2?=
 =?us-ascii?Q?7ukc80PA4uDLIBhMJnCLLSBJdJo7AY0kg13VBRdCSOR52ZudZKu+8bFIZcMS?=
 =?us-ascii?Q?9R2yuhEm7ATn+fYmdUV+oQFEi19Y7d1zCcP4L2dxbNiL/pLUYFthcqK7EVqK?=
 =?us-ascii?Q?yOmqyvwnJQ5aV8Rh2B2QMiGln3r+HB4vs9aMWNUujEJkqcvGXuXh3416psLl?=
 =?us-ascii?Q?wrWrMdftOMMRx0nHyEQ/UFdudoAaOflLjSc7ucdinIQAq7JnW1GUxo6TMGMS?=
 =?us-ascii?Q?tq2W4o+cuEwZW3zXA/j5l2RTwCHQzJagzwlIjFyk0RKCy3l+FUPUFYZ4Wyte?=
 =?us-ascii?Q?AqYfdTkfRC2qrRHOLhwZ9aIHYvw3w3G6lFxwKcOGHIrrgEsxUezoF4dQ70KX?=
 =?us-ascii?Q?f4gs17XxLn/cq7i2iqF5AWQ2nMZw8KxlihFTx+k4AgIFFa86bQ1+5WMTbMnM?=
 =?us-ascii?Q?AkBOs4xkvgylxZZOrIVoRSqbdypQconbwemcgcrAt9XOHH6FBhFqA4dxS8mz?=
 =?us-ascii?Q?r2Z6zyieKd9jQVK/zdtdkmfiuMIrfwnxehJx0xEpAVTR2x4mPnr4o+LIi57X?=
 =?us-ascii?Q?SLKU0z8p2RgpNcDCkv5/dyfWgLxTQ9E3rz2gVH017E4gkmVJjoVTxuwkI4Zx?=
 =?us-ascii?Q?VaIicUsSBsyacy6QnLXDdunUsV0NzUebpZf0wfwDPNluEg+5Gu7v1Vp0/3in?=
 =?us-ascii?Q?4upnPJ9Uv9hNR95W866tBHuTI9BrEUjqiOu+ePrK+/Qcu+zpZvae8FnKFdz4?=
 =?us-ascii?Q?nywhiGq2YoUXwWTcZDjObMg8IwzpO5HeBB+bCY922yIP46T4PAVqMH1bIVXk?=
 =?us-ascii?Q?yKamn+4xa2sc3ggtLkAi/Wr9TVtg1KqoZqhAswqQuAeIUkGyKQ3OPuMWGjgJ?=
 =?us-ascii?Q?3Ya4lCYEwD7Ue8Q5I/g1nE/P6QHgOTZl72Tp/3pVe0ha29Ozz3jnmmCUy9bv?=
 =?us-ascii?Q?sutr5ZHZWVIs5hmJ5cDhB4xevUFu9Vsy1dJq/kAjzXMgxuDxlAJl4AWXvfUW?=
 =?us-ascii?Q?vuOoCefykRVlz4u2qgE1oqcwIJ4zdiASAar5vXEwgjl4X8G5RtDAIyAxsJQH?=
 =?us-ascii?Q?DmChQ3YV945aelpGoa/u8FG8N3UozHWrQWIvwsKxICdsV+RyD3t7vdKDcwLk?=
 =?us-ascii?Q?AbQ8TXbUgx5Gvho7QW0Rqdp3NNzHrmfcgyFmquibi97W3/jHHmniLskk5Pit?=
 =?us-ascii?Q?mx2t+pfITcwgBV2HNOJ1cPPMT6ETdoYkkh5AbiW6gwK+VPQjyeED0t0vX4mW?=
 =?us-ascii?Q?mJqsPGv3mc43qxM44jANmE5hYUSk69HnAvi94Paeeis8CEpAdPlS9U920f/E?=
 =?us-ascii?Q?KbKXtEziNL1nMA+M9YRZEr97DUBk2gZsrUCoul7Ritlty2W4TjIiq1mYLYUG?=
 =?us-ascii?Q?V2euSEhH54Bl7zivGVkgGYySxIOjLLbAMwQPQWATY2hPP8eTRpEKVeezQhFB?=
 =?us-ascii?Q?FCMub+4NIM8G0HyDmV698PMcx58DHsi3dP2CuVj9iYvjGZ9C+w9bYnZu5hbk?=
 =?us-ascii?Q?E8oeYMlB0PwNwpfZD4upLRrUR03zwSDnyY/JsTxLGs/ZO8JKfU+qvOwA4rL1?=
 =?us-ascii?Q?HeFoKCmcto9BALrQrAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pD+yjacwK0ogXEQLwTjBuld4yr0bPtXW8+xD1EZbHWTzB3YTAZPGxb/jEadM?=
 =?us-ascii?Q?2hUWHIRyoVbTwHij7bMJIiquX+3GQEmD3ZaM/VCwJTVsHV7/4OFNNP6ReWw0?=
 =?us-ascii?Q?e38p+BIc3jfGR5CQQCwVlyxlwHS1KGkJEazXFgUT+VtJAwn1y0ob7hjg/pJu?=
 =?us-ascii?Q?RHY7eYNFU1oEthByXGDO32SBNa2nmEdKC878K0xfqTuCdFNeAWR8Gg6obcif?=
 =?us-ascii?Q?PQXT5anteLsqzGh0ZTQX5UcayJiiFZa/Xocu+XgA7AZ64vP5U82tryTPpOqs?=
 =?us-ascii?Q?y8WoYT+gi35K/j0chRusYJi9ST2QBQk4XUdNTVRJaPqTxpAb9UipCdO55np0?=
 =?us-ascii?Q?8I7qLBSZYslVeaaFsZVzQ9PsOGcKdwdwEjaRDDVlLjEuIKTsyhSIoMLhx1Wz?=
 =?us-ascii?Q?0LWBbJxCitp38TJOJF2X4AogEacO6AUpVsXBv8HDRQBPxtnOZ8HFZpWmCYBW?=
 =?us-ascii?Q?yelr/gJeAgBmd6+n0XWIZofMVLNZEr4j9KXCFpuAhO5ka7xsXNkmU1AoWObU?=
 =?us-ascii?Q?ba1bor9qetPQmjOCQxKsWTSWsWo7X3DawMNcdwSw5kI4d+sjzuugWzHlTsQj?=
 =?us-ascii?Q?lW9v+/L1vr6yyt6RAmeVK71wVcsvEV+TL1T0Fx3Gw81f0xtnBLrC0kOx7B8Y?=
 =?us-ascii?Q?HQhbvgvbaODM4kaAXaWP0qBnjSPIFRFvRjS4s5oPW799MXYER5FD4VAvVJBp?=
 =?us-ascii?Q?rm4LvRrpSAuPLYyieGSyTWB5UfhlMEZqXuMDlkwa95iVGRXRkbxrr5L1Mxve?=
 =?us-ascii?Q?QHnDJ7yFp37zIYFHlfeqVK1V18pSVwYudiQwvuGvG/q3Fj9dzGgW+JLAt2B/?=
 =?us-ascii?Q?QnqY08lOvsy/v4Um2IXZSd9KieK94PtShK2FYuxqfz/dogJ8AW50igQXWVw5?=
 =?us-ascii?Q?dpTBHRXXp+a0rS/5a+jEdfuig/OiRpU7TrC8plENTYjWG7rfAJVDj2pxjUVC?=
 =?us-ascii?Q?LyDbeCaLxq7M9dXRDRInzEr/CcbwDvMBsSsMio2yk9bOjRwz2hLyU2BxaIv2?=
 =?us-ascii?Q?8ISqGakuyXMkHaAoU5nOMH0jl16FpsE1n6CFnjVNG7ZRFsCPrMYNnrDd36i3?=
 =?us-ascii?Q?qeUl7b2+0lRwD6vvrIcZ8PtRwItYvE1dFW5SlOQEM24/qiNUcQ5gaMynxhQY?=
 =?us-ascii?Q?mrxzAW9BVuqoQKJx9Xnw4z1Hw1BuRfe+lWc9zaIj9LpA9jk/c+oulsI+VO7W?=
 =?us-ascii?Q?VFY7O1nUQzek/mbz7L3dl0niL2UmoYTWwQqAODrwSxqQ69b3UVpsYUw1yRTy?=
 =?us-ascii?Q?tK6e9Fc3d8zOBEzRzq/p+HiQSYQxMxWG7y/ARB38cy3LFiEEbrm9G6IOPAN1?=
 =?us-ascii?Q?DtGazeipI+E2XSTQGQP/9FwLR6PVzrR17i25EolZBtuQnnfcv7D3/xCQgaIQ?=
 =?us-ascii?Q?+9bX2JJpUmvariTEiZVtLYGp2CdBBXTwh4zGFXRioa3asw/ffSW2//8po2w0?=
 =?us-ascii?Q?OLs+R4V+BTmJVK8Zmkpw0HAgnsANlO8nCgoBnOPhcMixotzZCXdt7ztCCSF+?=
 =?us-ascii?Q?IHllG7vumxSQ3s80n5ANQFyoJi7bdHKf5ixZGUawRVuV3uqZVx3PzmYAfM/i?=
 =?us-ascii?Q?tt9jaJ9KyfVzrs6Y8mfLu1fwI430PTIpRN8vMovbH+Koe8g6b5XgzCiBBXB/?=
 =?us-ascii?Q?Jx1HnQ0bWTkY3x75aTK6Q2x+xWkRa0Yq+ABZwfkO79PJIunxQlVtOnpdKuAc?=
 =?us-ascii?Q?4iFqlzDeWDC/q2d4L3+PNAa+HJbFuclF3L0XS/7LgPEviuZIlPS9KmKNjkXk?=
 =?us-ascii?Q?p3VlfxXYYw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83472ad9-21df-4e27-9125-08de541e909b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:12:18.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xjBSjqHsWw7p4halh3gnFhaR52Zi7cnVUpqM3QGulhh0QLqYXzYAvXuKC75DigsTjmnfwhZZ4e0UwqIVRr3xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
X-OriginatorOrg: intel.com

On Tue, Jan 13, 2026 at 07:08:37PM +0800, Xu Yilun wrote:
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 58d890fe2100..6b47383d2958 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1905,6 +1905,16 @@ config INTEL_TDX_HOST
>>  
>>  	  If unsure, say N.
>>  
>> +config INTEL_TDX_MODULE_UPDATE
>> +	bool "Intel TDX module runtime update"
>> +	depends on TDX_HOST_SERVICES
>> +	help
>> +	  This enables the kernel to support TDX module runtime update. This
>> +	  allows the admin to update the TDX module to the same or any newer
>> +	  version without the need to terminate running TDX guests.
>
>I'm wondering if it is better to put this option in
>drivers/virt/coco/tdx-host. Just as TDX Connect, the
>functionalities/uAPIs are exposed in /sys/devices/faux/tdx_host. Better
>the 2 features could have aligned config pattern. The TDX Connect
>configuration is here:
>
>  https://lore.kernel.org/all/20251117022311.2443900-4-yilun.xu@linux.intel.com/

Agreed. TDX Connect and Module update should align in this matter.
I will move this kconfig under drivers/virt/coco/tdx-host.

>
>> +
>> +	  If unsure, say N.
>> +
>>  config EFI
>>  	bool "EFI runtime service support"
>>  	depends on ACPI
>> diff --git a/arch/x86/virt/vmx/tdx/Makefile b/arch/x86/virt/vmx/tdx/Makefile
>> index 90da47eb85ee..26aea3531c36 100644
>> --- a/arch/x86/virt/vmx/tdx/Makefile
>> +++ b/arch/x86/virt/vmx/tdx/Makefile
>> @@ -1,2 +1,3 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  obj-y += seamcall.o tdx.o
>> +obj-$(CONFIG_INTEL_TDX_MODULE_UPDATE) += seamldr.o
>
>And I'm wondering if we must disable seamldr core helpers if Update
>uAPIs are not selected. TDX core now are expected to expose various
>helpers for different features and is it necessary we have to mask
>in/out all helpers in such a fine granularity? For example we may not
>disable tdh_mem_sept_xx() helpers if KVM_INTEL is not selected.

I would rather keep this. seamldr.c will have other facilities that are for
updates only. It's better to compile them out if there are no kernel users of
them. I would agree with you if we needed to sprinkle a few #ifdef/#endif
throughout the C file, but that isn't the case as the whole file won't be
compiled.
