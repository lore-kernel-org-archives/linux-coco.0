Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2650D13A3F7
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800912; cv=fail; b=DwN82SbaYE0n9dqBUw9Lw3Yoa68ZmZsUAhsvUqg5p4rlQVmq4Md+BTS/pCOD38xByV+rowcFbVSLPKmPvNCXo+cGBqVRmDnay6XKiJkYn5U4Avuo1dpIP7M7W88yVuN8bmHkD42JePZrIOq5BTQGgg0h45eIC1mE9dHHKohgSCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800912; c=relaxed/simple;
	bh=/wAYtVXTnFyfEN/vS/ILV2uwQjjO/1ShI2+4Pap/Vj8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dsn/z2+iEFVdHq2fCsgb99pZiFHmvmlzipUpUzHK9wHETHuxCt48YtK3n80+MrIPwn4ZC0b78Ka5Ib3AvY3DwDYr3y5Z93pe+GC62+Ub0zM9cYNwIqZHdhiW71IcZJsW7PgAYsMNAaAr/7voasAImhH3YSDx4DQANLk/V8r6/fI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+2cEn+0; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+2cEn+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768800910; x=1800336910;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/wAYtVXTnFyfEN/vS/ILV2uwQjjO/1ShI2+4Pap/Vj8=;
  b=I+2cEn+0tLyTcT3+tnXhBmdTQq0apiK9NZJnu2oe+Bq7o2Y6kVLNZ+CL
   FaoH5TxFxHrY3RSxbPkyzHtdzg7gVRsEWNVZZaRARdi5RU/ixbCxWBx+d
   uncc6md7kWIZs8Df9FWOX1abMteSYMIFdArtguqe97Y8sVwq2Lq3epOqr
   ybtVE4cvqnemI/pMspwvS8kZMwO8sZae6YuuizwjOq/hiUVwSlt8l/FQy
   JSczxACuicg3dj6w9kaPYF/O7cfwpNBXhg2Pcn99eWevv9VKrWA2aryqJ
   XU3gtqFIVbODESoay2bYNzFib2wQy8HPthQWyBco4szWd8rhA/P2+JVsc
   g==;
X-CSE-ConnectionGUID: S8uDl9elS868t8B7v+J9fQ==
X-CSE-MsgGUID: WVDlvvLBQYKJCxAcghGlZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="95481761"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="95481761"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 21:35:10 -0800
X-CSE-ConnectionGUID: QOOFeA0UQyidQjRnsxA0TA==
X-CSE-MsgGUID: NgaeUotMQ9ilJxUc9hbJjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243344021"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 21:35:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 21:35:08 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 21:35:08 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 21:35:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ7Xk1koWEr4o74UHVde8wGoJ3fXpsWOaKWJ7AoER2aGDvsjBCXV4ljgKqxj+7NAVq3u2sJQdCwox7kbxZ3+nwxceaDrp8tlKXkT+pFgmFJxrarkBXTCIjWFmh9WsuWcmHDUtkVEc9sjmJVQvwgeMYD6Igk8QY2gH2kcimmJ2y2Z2rlj6wrzAhPKeWOL7A0tjqZvAxYm7GxT7ojgudVem8H/KWwhrsy7tZ3dV2GZ25NANQMn4844rGRy3OUIIZysR6kIV9qXlhUFWb4vDNcCKFEmvoNi7WBg0gKqlRAARl05RFDzNn/erx8hpM0bYPpB1Jf14RTt/oMeOLiormgPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wAYtVXTnFyfEN/vS/ILV2uwQjjO/1ShI2+4Pap/Vj8=;
 b=Cmrpxg4XxvAW5F1LVHmWt31uQqbNvU/QpNm4pfyZzA5Ml83InrZaE1s92z+5COsah73Dgyli7aRw2SYOH9vdm1KB4o5Ds3E2K4QAvQ2A32ilDVFt6DNV1hHnfO3XBocD/fs8be7nva9n0egM4Z5eFekwIjzLJCQVoEQTAXbKRnlLr2pJY71paKp8ZK5b2D8d7YUvZOQkzhhH2m0aKN6Ay77g4tVdB+sVLZHUZRA+RhnhzeuTz+mTHCgz/jgiF1xGfVpmpHIzEd/W/cVi3gFlERxbdfKTxVJjDDNQwr12aoI2SWizQl591rdXWs5FbPQAcjVZ3GL16CoGNksnFxBG9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Mon, 19 Jan
 2026 05:35:06 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 05:35:05 +0000
Date: Mon, 19 Jan 2026 13:34:51 +0800
From: Chao Gao <chao.gao@intel.com>
To: "H. Peter Anvin" <hpa@zytor.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v2 16/21] x86/virt/seamldr: Handle TDX Module update
 failures
Message-ID: <aW3Ce05mZKCYYoKo@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-17-chao.gao@intel.com>
 <aWiIFlbrGqBjpyvX@yilunxu-OptiPlex-7050>
 <CB733CD0-C5B5-464C-AD75-DD5475BCF194@zytor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CB733CD0-C5B5-464C-AD75-DD5475BCF194@zytor.com>
X-ClientProxiedBy: KU1PR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:802:18::30) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DM4PR11MB6550:EE_
X-MS-Office365-Filtering-Correlation-Id: f7ca400b-1c98-4fd2-64a9-08de571c805e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e5E+hYB0qxIo0EYhnagXSDr9rS3JSJ0g3ngSEE8qHl1jhq7132Eg5qVo4ThL?=
 =?us-ascii?Q?RuisTs4pWTuLr2CwYbOzOEVPVYaaWjErOco9olylC4JXh70ULjZyV8eynSGm?=
 =?us-ascii?Q?wGHeJk+yhCY3XaHzfq4vb1ItUJMajq0VaflUb8v9dt33qkIaEO291QEbzFlt?=
 =?us-ascii?Q?GPflLFwTy149J/6sebuyidfeNjaAyQbIiXt+R/5GvYRSEctRIrwW25mZo4AU?=
 =?us-ascii?Q?67E/TKYm0GuGW5EQkX1iU5vqwEG/0ze6eKQlHKxK7KCLQGRXdCiA9xV711fp?=
 =?us-ascii?Q?IUOAZhzr57O+vSM3VKg+z0exuotMpPFvY8zP//25FmzjsmupPZ8qwiHZvE99?=
 =?us-ascii?Q?ObyFZsbl3u75C+RSFl1pBGBPKLwYZaE0scH/FivCx45VjYDQ7uRj2lKfOUe2?=
 =?us-ascii?Q?sg4G+IvakwJIaDWfcPiR7gYzyjcrgG6sRyGxe/K+cK+BKFji1GFjZGfQA5OH?=
 =?us-ascii?Q?01TfqOi2u1c9HfdXJN+rOKPAamuUDrvdhoUwR8rWdORN9TVYoqoLBTF987VM?=
 =?us-ascii?Q?PNWrIDICPyl2Z6IodhEtOlU2CoemNeqRn5U1jrtF37E2BmL0eJOy8ldfoMP2?=
 =?us-ascii?Q?MtCohkbl50uVh1AFXjZ6xMRCxEg/j+uGshcK5UeSJpT0CTMxooy61ju1K9DQ?=
 =?us-ascii?Q?zpDi78QkZIVo+MfOQWaDOfpU0+NaW2neOfrcoX8Jr+4qlSa3YZlCXsvvYBD8?=
 =?us-ascii?Q?Zv+ThxaTEdCk2u9o0ufbGRH7cyou/vPBK48qtiqM6HJ9fcYhrBvLcTrfBxqn?=
 =?us-ascii?Q?LosS6nvilJjHpXF4pArYjE1njo/i4+gMnG17YwWlYVLf0v9THeACkziVBVnf?=
 =?us-ascii?Q?qNFgiQZXLiv11Olblyzv5mJmI7MD+LDSK9GdHdHxA9N4ChPNJlO1rLtVSIdP?=
 =?us-ascii?Q?cQN7mQJegqzuIQGJmYk7gJkmdbt7grOSI+oQJtLFxButIE39/Vir1Y1GuXw2?=
 =?us-ascii?Q?oSx+8LVUrdE7sfLlx3fErfri1yY7MPqWe1JfhsGqH9zeuN8nP2e1OB2PXBPW?=
 =?us-ascii?Q?hc2PrX6pR8BblTSdR9YfUcjTYAe2Mp1rOIPuzngt0jCre0+am8kcFByLrKBJ?=
 =?us-ascii?Q?mM/8J20G5p27DHY9wwqZpjfUwfyqwFU+NVzRUfS8Oyy7Re3BeoYosJrz81kC?=
 =?us-ascii?Q?2Ytk7VgabCNbB96C6YX+XtVdRX1UexY1NkqJQJ4wuhk9G2N0Zvl9jaVoxYCC?=
 =?us-ascii?Q?5aRgdfpf1bozFQWNZ3TK6RGqNfcke1snH8bhtUeAOnEF0U4YyAK27VXuSdrX?=
 =?us-ascii?Q?z5h8W3D6Mc/NXfvF+uNwFq5lzBUJCYXUGoq+7fZQ78NMM0+I24VgxrhiQrUZ?=
 =?us-ascii?Q?TMo3OAvzc/+hP+JC3pBy8u3CxTV9H3AAzZzBjmuLeyjIcfFOvsHm1f2k+oKd?=
 =?us-ascii?Q?362tX2rRPBE5OvRMwJdQFcPUzbE0L+j6cliBhPMbrMKDShQbIy0tZsUF8c+U?=
 =?us-ascii?Q?hBh1HSVskXiwDSdzjzKFA72c8zNjvi7plgQZdTUcgWQhdWcwpr1Hn5BLI44S?=
 =?us-ascii?Q?KLPrRHu+twP50fhMaMZvDlDtfJUKs9qbmIGha/WFXvKK1UC2dY+TatHWMgjb?=
 =?us-ascii?Q?BeIPuLsmUTF429RrMBc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9kF2cZEvy3Zv5/svJxSfAdARHyecbpG4UpPgwmMRYOkKXunDXJ9eIdVouL+l?=
 =?us-ascii?Q?tvwhyEQMDaj4frXIjmu45+mrOrEdxgsyX5WUNTXYXHGKQmqcckuaQ9QiIrMs?=
 =?us-ascii?Q?03F894FMxYgA0HfTnwLZyqEXb0RFINd7EEo083Hcf6wfJphppIWjJWram1nW?=
 =?us-ascii?Q?EyKV3C41WmECijxKNc5gUYCyoxMs43Ny2B/ayKOy5zwzm66ANvu/R0Tle3SX?=
 =?us-ascii?Q?8aacUdHVFWb3SfSCAxmNXDXrEkNERta67jSS6Cgx62p4c6pPSUz1qjEq0foy?=
 =?us-ascii?Q?3GO+FVinN2TI8XNqwmNcxZ+M3ePQ/Y/cSQYoDUSWIKvOiGHWfK/S7xbEz62p?=
 =?us-ascii?Q?SyO2v3G06fbFV4sUzhjirTmMutDWaWvcHYOxbx1DyYD78OZQSjIpR0Ld010j?=
 =?us-ascii?Q?i1hGtQMBBJLMlifQjq6O38aOk1FP2luwCRsoy0OXy1N7odm5upMZL9MiYA/D?=
 =?us-ascii?Q?EVVXRZm7SUS1cJLNx6yiXm1EphrnMfPjx4GlgwCqDPS06k6YXJNMfWu84AYd?=
 =?us-ascii?Q?LlLZCbZ/EncNhmMEsAni8uQ08nsVmGEiW9fxuSRKWdC2Ifg+46lWj20TPub6?=
 =?us-ascii?Q?Z8wpGzzck4bX6DY/kn0yZdelhp3fk25ai95YioDcoUjbuuQZ7DFwMaA3gNlK?=
 =?us-ascii?Q?Rh1bvIthaHjUoa9GTbHx3fgPeTopT7mj6pvuKGvxkKmh8L7g8vVwb8uCmabo?=
 =?us-ascii?Q?I2yC5oI4dl3PD3+lyHLK3Si5GbBiDBt7wjqu4qhP2XlRh/Y2k4E9QhImmJVl?=
 =?us-ascii?Q?QfVKyojiQ6qT/QMuEe2ihBfJ+zn6X0iF3UeACy9src01xquWCo8p9DyFaW6K?=
 =?us-ascii?Q?EfT/n91ZrUjEsfEb2mdJsva2o08hKxya6AU7470R58eb0ITRmE7RyeC1h7xw?=
 =?us-ascii?Q?74jACPi6QnO3PnQpUUCi+dr3cMpeaOqvfkyRdMm7o4U+5EqIo9wqNm2SyZSb?=
 =?us-ascii?Q?m8qiwdZ9bLf1fi9LM1FLfodyIeDTC+3UQUyqKn2peW+nacGoDOxg99acb9GC?=
 =?us-ascii?Q?Te5Yc22SycKjluFilCzDOqVtwwXJQz/qtVRjfVS4KdVUEjFvxUIiwJQvJ/bw?=
 =?us-ascii?Q?0kwQXqrzCIv3Jh4gsJJu/M9Zzchy28vOZ48xd2fKZCmZyJkJoxfOob7A0XGW?=
 =?us-ascii?Q?HJ79NBKnb7VdOuDHDS6uAj1Zf2QUJi+mzAR2nST6r+AjBH2d4IuYROB/35Ci?=
 =?us-ascii?Q?S0JeaMOem4SxT5YMaeus/+ll95LxcUfLc7y7fJl5yWx1KhIsGCpT0PP1bDCd?=
 =?us-ascii?Q?UEYM7hWSOshHcc0Lx5Saquk+vYUOmap2KskuL7bycxGi/ozipxw+nZ9GkenQ?=
 =?us-ascii?Q?SgGjyPgoAzQRMf0/xO76o2lNH817Jn/L80GmCaVVLJg2rSdJ/p9iHJdTgACK?=
 =?us-ascii?Q?860NnTlmbuiYWYggUoZ7gi9KVgLGIu8YPb5De/CXrrF4FtRRm6V5YnwwwaAv?=
 =?us-ascii?Q?BpfOvragi/zNaPl4cNKV8zZhORKeGK4ZHHXGh4171mBsBYV0Ts2vdGM29O9u?=
 =?us-ascii?Q?Oib2u1AA6di/WKZZNm3E+In5xXovS/GlSAbQegGSzT5Aj8yXSbZoqX72aAz9?=
 =?us-ascii?Q?FMS9ynzXp9VZ0UEFh9L5Oi1Mlkm8+uaQRcB4Av1vUYQ/jY7miwWdNa2IOz4G?=
 =?us-ascii?Q?Tpa5O5DgMw2rn1MQGXgk6uDAbtdvAmqD4yu5b0dqaCfLoAj77s3UoZSyciHN?=
 =?us-ascii?Q?I7bu0/0iQXB4BYdAuZXIhgdZ0qO9fVtjRAJo4i/9D2n3WT/vgj6RpZ4xWu7E?=
 =?us-ascii?Q?TvdeEq4bqg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ca400b-1c98-4fd2-64a9-08de571c805e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:35:05.8859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR0Sm/PGdy4qQJlp/1iAWhGTMwVc6MmVQGu8Bl05z6aTR3NcMDC5VVahKB0fhfjHulZRXi78qqb5n3KtvBREpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
X-OriginatorOrg: intel.com

On Sun, Jan 18, 2026 at 08:55:22PM -0800, H. Peter Anvin wrote:
>On January 14, 2026 10:24:22 PM PST, Xu Yilun <yilun.xu@linux.intel.com> wrote:
>>On Tue, Sep 30, 2025 at 07:53:00PM -0700, Chao Gao wrote:
>>> Failures encountered after a successful module shutdown are unrecoverable,
>>> e.g., there is no way to restore the old TDX Module.
>>
>>"e.g." is obscure. To me, the following sentence is explaining the
>>reason why the failure is not recoverable. Maybe "i.e." or "because"?
>
>"e.g." (for example) means the following list is non-exhaustive.

Yes, 'i.e.' or 'because' would be more appropriate since the next sentence
explains 'unrecoverable'.
