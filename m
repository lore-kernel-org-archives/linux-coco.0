Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4EE23EA89
	for <linux-coco@lists.linux.dev>; Fri, 16 Jan 2026 03:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768534298; cv=fail; b=Ahek7tyZKVPxXFpTHQ0UQhL99AT7J00tkAu0LG2bUlWo26Ji4lOQ9vB4MnlYxzGt49k3bFsOWpPxF0I+lKSPR0m6BmOyXePy1J+z3gzWEglfNb0kBe1wedIi7pupfpn2zwtRH1ncokZewoWVs5iBeklqt25CBgHeThJMORRBqdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768534298; c=relaxed/simple;
	bh=qEZRvOWnS0UKu0tNuvuhEjz8lSioHiX+eD194Vp9Jpw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UlCe7KAZ30q+XggCkKiouk0OMumKt14OfYMKvNYnbRJNfISM81TDbyb2pC57Y/Kau8ub78eOGhIFPx8JckNkGlmtvCFX3Qtr4nBwx24N+yiSeyrEEqNZWsBiUxShKuBEZVcTmmho0eV5R75zRRvnpE4tQfJtT0SHt9yG+gjl3LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fbQoNsfO; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fbQoNsfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768534297; x=1800070297;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qEZRvOWnS0UKu0tNuvuhEjz8lSioHiX+eD194Vp9Jpw=;
  b=fbQoNsfOqaLXc9ZtNic2Ly4N5Dzho0g4DPL4wxJoYrtK1qqRgB5WtLkg
   Oye2xoBAzjkZS61P+KLk00/ZY0FYEyvAuNTlh+H8T6AfE3rveTWxTz+uA
   MRkZVpSKvX9gY7aeaE5Zh+Th1tpX3bX53igEiUd4pJBWVNJVHJdGYDlhq
   0ghtjDQ/bHK5DtuHNrbDSpbX1Syr/GjbaUf3AqW22oewLW99zCGSavPeJ
   FPZ/xuN6nSEHfrB4xKZlRAvY0MCUGiNMoaS2pTLk+npYHIUXzaYkpvrPt
   YO5dRPuO3Z56+IuvjQlW0QFWe8LLTIuuAIaoWwxnKqR1VbHp+yd3pftny
   Q==;
X-CSE-ConnectionGUID: gU9Jd6MFSG6ghhcKzBCfOw==
X-CSE-MsgGUID: UG4tXFH6QqGjH3daGRDQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69745738"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69745738"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 19:31:36 -0800
X-CSE-ConnectionGUID: 8JAJcHdSQOe0sCd9OaYHQw==
X-CSE-MsgGUID: EPLLkqCdSL+q0zID2Vg0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204748265"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 19:31:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 19:31:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 19:31:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 19:31:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r88lWFivV3Ej3H9tzYeuI4FqXdUJji9X8Dv66MuDkcSRoKbYOzW7mYVKYX5wmWY9o5HYJZv486MTAEa1DUZzF9S1P13fABLsMBtNgrP6IbUP8bsfV6rIzddKT7/JQs825CUAgQCTaDkn95df4WEiqrIfhe9y9SYjOxGLwnLDavZ1YtS93d+salhJDhXS4wuSmtEJ+gKRQB2lREq82If6iYJEp2AFb/xS+V36ayOyjzmDNUfBlIq6WZ/UZx/hyElG6+3+bT2O9Om1fBV+1rvSDWtwZzd06qVmH9QRbrgDtjdWbzMq/XdHkyyQDIxRyqp2tF7AnxC9r7HJvnRDkvU0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9OHBym1Qqwp4u40Av4CAzr4o/nIAxZbOfJIoPcQ2vs=;
 b=IlLQgSdhoCENkyGQAA3OM845H6nXMZqxl9hqe/ZWDvVbWnesmS1RKJRd2oGISCdo7TPWbHRCl/LYlMnl+jkVJCXGDFHezY00BK2aeHuNu8Yg48/xe0TMSYaXAOoNAcveD1WsY3DGsPPcNDYB4n5JPPU9pygH3BmXmvIoFGFKb7iWECeJ0+FiR+o6+sCgRiyFX69UPS+uZgqzx7yehd6jypSJ30qMFNWjdBEapBTGHwKmI9uxCeeSAEjbK9cRj8hNfZMIwIq5NyrO0Lpeq/xU7fKqEo9TUHifGQh3vh34Aig+fccYEv45zW3wUgtefhDa5/V3UpsfkgGcA/40IBYsQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DM3PPFC89313B1C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 03:31:32 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Fri, 16 Jan 2026
 03:31:32 +0000
Date: Fri, 16 Jan 2026 11:31:20 +0800
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
Subject: Re: [PATCH v2 08/21] coco/tdx-host: Implement FW_UPLOAD sysfs ABI
 for TDX Module updates
Message-ID: <aWmxCMAhiH3h51gZ@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-9-chao.gao@intel.com>
 <aWcIt9AUMo2N9RKw@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWcIt9AUMo2N9RKw@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DM3PPFC89313B1C:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cc185c-b3c0-4ac0-7acc-08de54afbe2f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NXGSAX9YPOFJ3mrbnMrUDdAqZNpr9SCKCT/+aZgEyuRAfLp2WvAydRHAXa18?=
 =?us-ascii?Q?hpI0TFe1Q8WNq3vIkJnF+GiKOIz1dq0g+ZVwd03cLDKSSKJryC8cXeaklSnz?=
 =?us-ascii?Q?5wiYqTlQ+GeLv1uereSUIi2yCNlXkcYNOHHzA01rpj2XFHqSGaJTUOMl1cM/?=
 =?us-ascii?Q?Mw2hAJuSLot0PsGqHhqz4JDvRg0O/PZ0u2b+/alEwHNNlX7byqK0AR7Vg3MM?=
 =?us-ascii?Q?J+Vbshiq8RPM3Whc0cSl5wWvLPWhLTSPrtwCpHTPbxIze5EABwlJNM7m4yCS?=
 =?us-ascii?Q?8+E+HagT7Gzcc/uHuVT4lxLmZ3FxaLxJKNZX2qCv68TfeSEHLbZ8UHZdzcDC?=
 =?us-ascii?Q?g7ZwGSMipdQpwcYiiUV1x+ULcuDBg0/NiIS35yndVTpb5kZH8HVJ4Hr2Nz1+?=
 =?us-ascii?Q?SbZg6vM67ZrbgKIsKeMXRmGf/H7hDYRKfmc6PpP0k59S7LSoyCxbU7YFIEcC?=
 =?us-ascii?Q?ODcN2TwkgdfXJisdti98HvoM8fnXKiG3XTbScSWFh3uu7kZfv8fjDWcvMuHm?=
 =?us-ascii?Q?rTD5g8D5LhSW+izBRf+hZ24trgTQcSyj7LYhuSKfcrxy23oNYz8rSTnHM5ZN?=
 =?us-ascii?Q?hNVgnLRJpdmOcodOobKby/cHzt3ynjIp8xdjoTCvlV0PWilFNzYwNjqKP1/X?=
 =?us-ascii?Q?nQYKdmFkFycqN46Wsxsp8ZQW/BzvGMnaS+OwuG3EsBnztLsTG+a+h9ehZcmP?=
 =?us-ascii?Q?mkO28VN0hVu7pUXVMtIWvLd4Zg21+Bf/p5VipucYdztDFPnro5Y589sGpzsc?=
 =?us-ascii?Q?oaRed5wUE+jtE8MAD0iederBDjzY79sKTYalMSYcd4BgaB9vKFgGoxTV7fWR?=
 =?us-ascii?Q?XVcjphEhu7YxtxdixIUrSWmIqdBDFJtjyCWbxv+kKdLqB2yeIvt+beMKaHoJ?=
 =?us-ascii?Q?XH+o54NowLzCZ5NVZtynBSVo5fN5vlGnDcW6wOm3trfrjhT+0NNP+/NmgO37?=
 =?us-ascii?Q?sWsUK+gwAtqhJPIttxnx+NGMyfIe8WbvtoIUverYQt9wSUK4FJwBimB2DP3x?=
 =?us-ascii?Q?obZ0Oe/Xh+UtilAv7mjPCCntaJgS4KJk8Zu6UXNoW6QJrASB+2mtfCAKpUra?=
 =?us-ascii?Q?3Hi2AcsxLe990TM6PoAzXMGS44wKCHEYPGLJcowd7tJ4bhiiqf+8OiGSWpGW?=
 =?us-ascii?Q?y3YJPPge+EET6pKLalJlsBksz49/mCShKEmW+VB7fJiW+ezYs/1j18s6nIRv?=
 =?us-ascii?Q?9nwzdJqq+Ks/SBc8C9PMrjiIBfewmRVnL/uzmIaawkUqx0MGFAHLRirN70ef?=
 =?us-ascii?Q?c0gDz5YUobRN2CaVTDRzKO3lZILqmA8KXw57YQInwe4VMt21tTyTxZasxiMw?=
 =?us-ascii?Q?jP7/mwggSH9dcBvjHDAniDxgEWjvotOmOYHBPlfr+QMhIWTa1Sh6ED80ZOMk?=
 =?us-ascii?Q?0l83Q+PnXjCHogbHjJsp1Q1sJ2lzibSncFMxVjmnAy3tIxgFE/hW/eTlEpqq?=
 =?us-ascii?Q?4Y0TQXB2KHfrgB6thGeWCdqmn3ACvfz3w6QD10vSI+zepFcGVkRBxWJGySe1?=
 =?us-ascii?Q?5x1zzYu+44G0yvaD1e6P86vnzUJXFVBLBAnGjqckc1zcMfenS7JuD8DP636N?=
 =?us-ascii?Q?ojo2k9dFESnU9bnGVKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1iFjLwvCuF5imlCgRbjAFqR/P2nsrlTPVan6BhJdQHIHp1aFhDM6wMbePG4T?=
 =?us-ascii?Q?jqW4u6zw3afkmDo/Qjs9IqjdH4yl/UFbb6Fe2U8PwTeoa3pmvv2WXaMmNg93?=
 =?us-ascii?Q?igJGSGXIPdsjMOBA2Z8s5d1rfL3ToeVgCkXMP0yM4665Ut51mWnQuJUcqLke?=
 =?us-ascii?Q?MxuztclU5d5OP91yJUZoYaIMgPNP1U1n+4mTepd3UGJt3SUiwpkiW9bEs5cV?=
 =?us-ascii?Q?Di9yXqTp4w0WOiYMlCZD1EppGtWMyuVLyw+sP1RtLCAXaKMVqnYOfutFzcJ3?=
 =?us-ascii?Q?L8FDNfAmxbgeISK+pN91GBF4LdcIySbyZFfL35JmKIoxFdpGPmvk8prhP+ap?=
 =?us-ascii?Q?GOeR1ZQdK/vHHcjV44Erd5nwfBgEVUm/GTiRec5BQThQJHvaGv4L6rjrHjWF?=
 =?us-ascii?Q?AUoTBHCzvtJoeGO6vmUzQVAHzQ11fMDGXoOA0THbVVPdbhbE/jfz/vNGr+nV?=
 =?us-ascii?Q?EyOrOye21eC0V+KkKjlq32654nk0oq3un7GAjtmtz+HfMd5UwUX9BycTcwLh?=
 =?us-ascii?Q?ay1e3aLTRBLe0EUly3FTml7Y8MHBQggQNUcht4eW74BP9mSVWfGhSpIfhD5O?=
 =?us-ascii?Q?8UpWlTdLYanL2raU55vX3zqxp+xWriraF2UH1tvCXVgKzs9RXQlfN4xU6zOX?=
 =?us-ascii?Q?5PVucU/zgq73gN44XRMhdIn0xjD7NlFUE1huSOaCoqEDyOhtcvK2OYe3e2lT?=
 =?us-ascii?Q?K7Q2CbrEoa51iw/sFIPNqQwk+l44WjxGYCSD5QR/5/AAUed0/oecwA6TxCww?=
 =?us-ascii?Q?ZN+Msj4j4tdTERRp3ldlzzkiy9PFzzDk6whT8maGy4ICpCQTafei7vGVRWYT?=
 =?us-ascii?Q?zV7lcURli+x0LJcb1oL+37Dzj1p3rUwGRwivS5lhze18GW8uPGxnTF2NhYYA?=
 =?us-ascii?Q?fMzd9c6v411R7vNvE8TcoQ08yGGx+L/Ba5CPijWCJ4F8b0qiFPU3HwdPJ9Bw?=
 =?us-ascii?Q?x7KHQ27vjI08nM7FgRf59+D5wjZL6NjFE46G44RpJCTH7nt50nmHtNAMZ/pc?=
 =?us-ascii?Q?B4/yWpBwrrp/4gm6rlnw5DDQ6EgWlnHeo5/Z2E+X1eqwqj0zZEyhYIZJP+mZ?=
 =?us-ascii?Q?wyrYuqfkwSrcK2YbZknnegGaa6j/FxDCi14rtXeWGz4Yvbh/JC8jG3J3U0O6?=
 =?us-ascii?Q?QktsjChAM6SXOxjFbjaYBKFCbSE6II1qOL2u53aUzSUmxG3U4ILPe7nXPWv8?=
 =?us-ascii?Q?6wFwT6bKEdUi2wZ7cq1pQWv2CowN26qLFIiFOpi5uUEzyKjerM3Vz1g9BoX4?=
 =?us-ascii?Q?1PmZbX39ruiNViXFCudOQz9THDXNoyZtzGLVbZWYMwUQfmEJV1dO19wRIsGZ?=
 =?us-ascii?Q?OGsLJonbSiHRGBmcKAoXiO2t6GXVbYrDNDg6K6KStKua7gDFuJKPjaS+9MuO?=
 =?us-ascii?Q?un3VScYYD1dnW6Xmezy1Q/EL9vKoFcKdsoNifNlHG5gtAvsH7fjilC5G4arT?=
 =?us-ascii?Q?uQQM/6e85htgfZ9EjnIjXFjxa9lOEW9oHqx+MypuJEQ5ejzSmY7NPWOs1Djj?=
 =?us-ascii?Q?BZnR14nAUSj8bOML4VJgxGW9jmMEeFFkex/YweGuLKOZozh4UUQNgn2ZGsZx?=
 =?us-ascii?Q?SU77HcQyWUYr68nLX7e0NxY2F0tg7h2DEcKMxJvGcX4gU0lCcTE14DGvhZMc?=
 =?us-ascii?Q?Kr8U/PqzbsdxaNYZy130OLuF+X9IPJj3/X2AUELZFbMV6JQ+1u/jssMgSgmz?=
 =?us-ascii?Q?RtUcmdwip3DtTcTBVYh0yXUaayzweLWVXeUeNo5+od4DW/DFz1tHVBVS1A7G?=
 =?us-ascii?Q?jqODRFrGHw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cc185c-b3c0-4ac0-7acc-08de54afbe2f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:31:32.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbWHrOwSdCDJeDAXjNazVShFkqWuyth+KlCsjSlqXOJn+0yqwRGcgdk6mlUxnSXDT95a4BbT/Ygj6HWvmeQySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFC89313B1C
X-OriginatorOrg: intel.com

>> +struct tdx_fw_upload_status {
>> +	bool cancel_request;
>> +};
>> +
>> +struct fw_upload *tdx_fwl;
>> +static struct tdx_fw_upload_status tdx_fw_upload_status;
>> +
>>  static struct faux_device *fdev;
>
>Make the fdev declaration right before tdx_host_init(), try best to keep
>the update stuff in one bluk.

ok.

>
>[...]
>
>> +static int seamldr_init(struct device *dev)
>> +{
>> +	const struct seamldr_info *seamldr_info = seamldr_get_info();
>> +	const struct tdx_sys_info *tdx_sysinfo = tdx_get_sysinfo();
>> +	int ret;
>> +
>> +	if (!tdx_sysinfo || !seamldr_info)
>> +		return -ENXIO;
>> +
>> +	if (!tdx_supports_runtime_update(tdx_sysinfo)) {
>> +		pr_info("Current TDX Module cannot be updated. Consider BIOS updates\n");
>> +		return -EOPNOTSUPP;
>
>I don't think we fail out the whole tdx-host here. We should skip the
>optional feature if it is not supported to allow other features work.
>E.g. the TDX Module version, the P-SEAMLOAD version, TDX Connect.

Yes. How about making seamldr_init() return void? Then any failure in setting
up TDX module update won't impact other features of the tdx-host device. e.g.,

diff --git a/drivers/virt/coco/tdx-host/tdx-host.c b/drivers/virt/coco/tdx-host/tdx-host.c
index 540f9af7f81c..d653c594bb94 100644
--- a/drivers/virt/coco/tdx-host/tdx-host.c
+++ b/drivers/virt/coco/tdx-host/tdx-host.c
@@ -176,32 +176,22 @@ static const struct fw_upload_ops tdx_fw_ops = {
	.cancel = tdx_fw_cancel,
 };
 
-static int seamldr_init(struct device *dev)
+static void seamldr_init(struct device *dev)
 {
-	const struct seamldr_info *seamldr_info = seamldr_get_info();
	const struct tdx_sys_info *tdx_sysinfo = tdx_get_sysinfo();
	int ret;
 
-	if (!tdx_sysinfo || !seamldr_info)
-		return -ENXIO;
+	if (WARN_ON_ONCE(!tdx_sysinfo))
+		return;
 
-	if (!tdx_supports_runtime_update(tdx_sysinfo)) {
+	if (!tdx_supports_runtime_update(tdx_sysinfo))
		pr_info("Current TDX Module cannot be updated. Consider BIOS updates\n");
-		return -EOPNOTSUPP;
-	}
-
-	if (!seamldr_info->num_remaining_updates) {
-		pr_info("P-SEAMLDR doesn't support TDX Module updates\n");
-		return -EOPNOTSUPP;
-	}
 
	tdx_fwl = firmware_upload_register(THIS_MODULE, dev, "seamldr_upload",
					   &tdx_fw_ops, &tdx_fw_upload_status);
	ret = PTR_ERR_OR_ZERO(tdx_fwl);
	if (ret)
		pr_err("failed to register module uploader %d\n", ret);
-
-	return ret;
 }
 
 static void seamldr_deinit(void)
@@ -212,8 +202,8 @@ static void seamldr_deinit(void)
 
 static int tdx_host_probe(struct faux_device *fdev)
 {
-	/* Only support TDX Module updates now. More TDX features could be added here. */
-	return seamldr_init(&fdev->dev);
+	seamldr_init(&fdev->dev);
+	return 0;
 }
 
 static void tdx_host_remove(struct faux_device *fdev)


>
>> +	}
>> +
>> +	if (!seamldr_info->num_remaining_updates) {
>> +		pr_info("P-SEAMLDR doesn't support TDX Module updates\n");
>> +		return -EOPNOTSUPP;
>> +	}
>
>Ditto. And keeping num_remaining_updates sysfs node visible and returning 0
>is valuable, it clearly tells why update is impossible and aligns with
>the situation when the user keeps on updating and exhausts the available
>updates.

Makes sense. I will drop this check.

>
>> +
>> +	tdx_fwl = firmware_upload_register(THIS_MODULE, dev, "seamldr_upload",
>> +					   &tdx_fw_ops, &tdx_fw_upload_status);
>> +	ret = PTR_ERR_OR_ZERO(tdx_fwl);
>> +	if (ret)
>> +		pr_err("failed to register module uploader %d\n", ret);
>> +
>> +	return ret;
>> +}
>
