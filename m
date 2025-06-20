Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA441AF0CE
	for <linux-coco@lists.linux.dev>; Fri, 20 Jun 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387145; cv=fail; b=lQ/WIvOjG2ax0YAick1K6DpmMQ4JiQLSStcfpen6tpcow4uoJ5p0F2c1GqaPrVXixhuuIrpsPf38AEasxIVU03if5GPW72/RiM/cS5teLEZMYYnDSBI3Pa6tqXb84MPWix+3vUD1pr3/P2rjE8cIDgcjxXgdhmRK3bTcMkHFqA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387145; c=relaxed/simple;
	bh=EGjuBNPawV0lhTJGKwS4ZJBQjWj0NiHt2QP8ZclPlBI=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=g7HGiPbPizUQrYkL7TMqSA/n4FJ3zUoAjLdmgKgOwehVrakwr7l6AnU6LMTOVvNxYRAYkiu2CEtS1lW3qQNT4QOUIVAkTfMhsX4kW3y+B1Dkl5EHgoCfrNdzT+O38qZFxyR6yg7YxCB7wm2/cOnGe6ztRdhHP8dZXtvlchKRe9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQmwALb4; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQmwALb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750387143; x=1781923143;
  h=date:from:to:subject:message-id:mime-version;
  bh=EGjuBNPawV0lhTJGKwS4ZJBQjWj0NiHt2QP8ZclPlBI=;
  b=lQmwALb4NCseVdZzpbhLnUBfjuy+6z3DvlHn8EYVmd5kLhmK8cHfhRV4
   vcbBU4mU3DPXf/2O739wMxlgVOtqSnr/SfmkZzYX0YTw5SaKiK/692KaN
   5nxHa6H33rZGgKp9IJ2d2ZFbNrJFEItc9fXA1Z7zjFTEuGwYvXYLnJ7sF
   sSYdk16vk3o/548lxek+peqENEJR9nC3ilj1fj31m96zk9mQ0PnuSWicu
   Ha6ENsSvxvYV8Ee+WVhEkvigetm8x0C3HCQwFj5wQiFU1n2kaWwNoPJpk
   YzFWWxtRnBzEr/h6eEdETRpy55YEl/9TsGM3wjPWUgSjwrFb9vDeGEuC+
   g==;
X-CSE-ConnectionGUID: XRK0D5ENQLKiB3ccuAf/bA==
X-CSE-MsgGUID: QE3Tws6KQyaAuYAdqqP1Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="55269066"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="55269066"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:39:02 -0700
X-CSE-ConnectionGUID: /03aAUHsT/uJMfJy/H3SAA==
X-CSE-MsgGUID: 3z1ougitQIqbLhYlwr9oTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="150219849"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:39:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 19:39:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 19:39:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 19:39:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAlJZqB/uuw3na4SN8Pnl9kx81CENwHCsmja1rzQ0t7dJFQ0aIQxzeQcA/4Ufobgz9QHRCmc2UtYxc2nKLSjvI5ncka+LfL/Rbt77jneiKNW4TNBtYMziRJ80dEqAQ3scnLDmQW2+aOD66D7mnakCIXLCKM7Vf1r4xldarwL+uEnflkvdiK7uozitVM17AqixAsMS8QmJMdVc7t3uOmyQqMB24mGfssaXr3CjJ6f4yLs+SSFvNNld/vB0Qwsm210P7I/MXQ5K9x9tgIlgk3veXYsd53zObHHSggW3zbmftZ/82U25T4TZmLfKUBt76/reVZpzDKJgncNu2Om7ZBwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujwLSqxBbUVALGvlryNSBv40N57AR//Rc8zXhvsJIT0=;
 b=y31ufsLlHTi4wX8KF4sL1UQUY6CtI5En2jmXkjfXOC8wjJI6fI4nDmSXFFXAfu6UIkzIOcg7BbFZAmon5eSNr106sg6PxyPdAQToAWduzhU2QwaGP3N68WARadaGUlEBSJjXhHN3kR2lzgMmZGCBgm/TrnP5dA0D0o4CyoHRMmiPBigaZ6RamTxlGO8RV6oEJJ32LZu+AtvVSqNx1fL6hhIXO43/HcIFPyD+5hfCk7mbHbPjlrwFUkryf171/UurJEyOjZ+1hH7v5VoUBzGjv1m+BHzyvZfTeBoDj1SMfeduZxOk/o3xwBWean2KHQLsR0WrryyS5AT1JAmxTguH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 02:38:32 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 02:38:32 +0000
Date: Thu, 19 Jun 2025 19:38:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
Subject: Reminder: Out-of-cycle Kernel SIG call starting in ~30 minutes (8pm
 PDT)
Message-ID: <6854c9a527731_1f9e1005b@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c33430-831e-48d9-d6d2-08ddafa38c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NQbKu/R7I9TrSSywkIOTIxgsxJEqIlvCAPUw2EMNK5Y0xv4+kizd9qHaZsgs?=
 =?us-ascii?Q?RIqyDA0Yukr3c8pMuccPaag2cHh+PzE1meZvqbbhyb86/udF9a8X8pSYB4Gu?=
 =?us-ascii?Q?jWuW7C/V97xHos2oialWGWs6vdeH4oxId0JCgm32LlOEyEKV8Na3d3+uiJX8?=
 =?us-ascii?Q?qq9EpBFL05MuAxhlkD7jvUgVKYEor6GJTsLA0cjZQGgJSBZFdipEnY7PxeFa?=
 =?us-ascii?Q?a4nYQv2ahjmu0hAgdg247nd3mZP64ncrroqy3SCTjyolfX746yZ3pJjkHUFj?=
 =?us-ascii?Q?KdWk5oASeLE+fu/5iIfu+MfNTEVa+Lbb+nlUINBxGRlh3QptXIRO8oW1x8eg?=
 =?us-ascii?Q?XwLG++FrRYVNm6x6+Qe6sV8exrhYjlNXsnqyvBnQT7teXLqNMzM4v/9xMT+0?=
 =?us-ascii?Q?Jaya00L1SK6GQTzNP3ZM/e3O6aU+DtsKHZAtRMEGzjbRHyo8eptBpBgvFyRH?=
 =?us-ascii?Q?RFVp1G3ESEk0G0AgmizBhdWny7IluZ62zVFQNoYYLNSH/2duAfx3tZRn0LAp?=
 =?us-ascii?Q?Q1BS3yI4FsfMxBoHbt7ChecqfKjNpt8d3Q7/ejkx76cFDsWhnLCBcFQ5/fXY?=
 =?us-ascii?Q?HXt2wlj4hI3gFXAst4SV26sterrg/nFi+gA+40mk/iF/5LxExgb1uUiNgcrS?=
 =?us-ascii?Q?5HaH9/otiOxq2WFxnNv16pMXIuSZmVp4uLjauwnyrrv6EHspft7o8F/aB9kH?=
 =?us-ascii?Q?KrbDhfD+n66gnjogtv728vM/vRnFLc6ZreGvEAoAm9uISGVxZTKW8+vSlqJV?=
 =?us-ascii?Q?7gmMyckp21WfznBwn3F3aoOXRm3LnP0QT+FkmEL8/aHd0cNJjT7Kj/TllTlH?=
 =?us-ascii?Q?3qb+sZfaxwfnCC9OHK5IRj3jhg5EFrVH/4gYyTrN1jRL0UYfvUla4SdnvgrP?=
 =?us-ascii?Q?ZJjotC5UX2hNUcROR3zQnlI6C+j+Xq5yQ/9hGiRBBrVoPHtc0IFLlbRRjV7q?=
 =?us-ascii?Q?06jutkoTsYTd7VBsOmLI9d1FYbwgaQZ5HK1dijjC+hiBbQngNL1kL4puSzfg?=
 =?us-ascii?Q?xy1k5uwl1EJg6N7QDEvbw/ruAHvTWycmbmeLOFdVAGnbPLygPIJx3ArdrIEM?=
 =?us-ascii?Q?KKLUma9uSGgLmRqS5PMat4PnXKSuM+zZ5APrfR27DMEZhj8Shn5JvrBYOq7z?=
 =?us-ascii?Q?BNfiAG4RmaIk4i3HKtsw/UihJmyCfg5j0re3c37+/+VIlV8bI9PeshXwVgsq?=
 =?us-ascii?Q?SNEkllDF8r9EW7lZnLjrrTfm07rGkiixPs2+9gkfIUUNvug3BrRC8giTRwQF?=
 =?us-ascii?Q?+DabhPULA61Y7LCabMm7pMo5d5g5ocfIF9g9MTG73q5KAWvJhs9+5DY8nZN1?=
 =?us-ascii?Q?7enT9Lz2kp20udMSohdf1zghxYd9rCYW7u1yssVlu/JdfhrA33XuVkDWRpS9?=
 =?us-ascii?Q?/jfe6BFMU2heiPmHjnEcQROETBiQESetqEi+kmuXhnywQulz5p2c5PuMo4Ab?=
 =?us-ascii?Q?MKS5yJO+yew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JHRDhoW4l6aLlE9PHdIjyTa4sdfarfzUGh9Wk0DI03kW3Y9wtDaaiZ51vTe?=
 =?us-ascii?Q?PvFk7R/MDzAP37wOe7DYpij4owYxEM69G/MbdfIAbhCdh0saANoMTLAVXCc5?=
 =?us-ascii?Q?7j3UPzMYhy/SRozI/FgKtQXnMqLxSQfi3MKZlulkGMSGhQwFPoagTCJOxpjX?=
 =?us-ascii?Q?3ZtVNAbCmbgcmWo6A+LaTMfTN3Dh3rOwyCu8Fx85QQ7L0R1tFnq50RlEwfej?=
 =?us-ascii?Q?Ozl5aru6zDheaVlcd+7pNR4Ewgz6MRLaKpZY0NfcYiMSUv7JKbeG4PPBitwE?=
 =?us-ascii?Q?XPyYlrxzcOpk09bt3m1eLbgHMRXlp6AkM0SthpMYPqSMNMqAF+T+sjPTDVLA?=
 =?us-ascii?Q?oloypt37IfhY6KZrzpo9J2oozM3abvQ9VfMBiWm+2paSIBsg6DjDFXduUlbz?=
 =?us-ascii?Q?iZNiTL9ONEtRleWolQbVox/+PV5Ju7qQJogIs2gKPhumiH6KQ47zVkxNqy/u?=
 =?us-ascii?Q?2QCc5oBEQh5vaGsjttvURUp51OdZh4d5rIV+SyFCR3hEb1ozR340jJg/U1ap?=
 =?us-ascii?Q?uwAzDegqf+0+dcGjN0E9sLoWR7uvP2Rnr/+aPbjmvjt3ojG02rr7vr3AS8Gz?=
 =?us-ascii?Q?Sn2y4aTXdEwXBDI3zhEiop7KBJ50i56HxJjbeIpqvjVRyx7DkeadjZClqheG?=
 =?us-ascii?Q?cM6OKczeeAjXtKgM/Uypv/ZpaTfIojhRmV0TEzLGNPnj5wxZA7rPHp3gWRvS?=
 =?us-ascii?Q?Fp6OkcPyJpPBXojvjPws0i/zFvRWrHpENh/9SX2w829RU1HOktAQyppbYXcA?=
 =?us-ascii?Q?7ue8JoBOWLSrgS2g3udiAmo0TtrL9u885QryofJTasn0H74lyUP5uuLxNhD5?=
 =?us-ascii?Q?Dp7ZcnHA8Q60+OiH2JfnaPqVNBQlBFSqbCCTmd6G1SMX4jRXq1HjZ7ftyN8m?=
 =?us-ascii?Q?8rMFEUjS0u7URTE7XYKnbpYsUWW52ZxoNR+pGTkx3WWyfWnM0xgtTPmOoXAe?=
 =?us-ascii?Q?1fMhoQd0Rh7bufZx+KG/R9BcysOIjcF2FtRfg8bY3bDGtLBvccUMJXBeVE0f?=
 =?us-ascii?Q?5bihwCsKJrDEE+s246MrmAuD6neSRZgMmB78fpkTWt+65br3ml2uGsCdKghP?=
 =?us-ascii?Q?TzKumhXfjPanoUhkJKUAkgrcu1W0VB3OSYjYQa4yYtO8PXearEGBsYBfaOdZ?=
 =?us-ascii?Q?uoIGGbHcXeD0vxRMTXdGr22lrexdd/VOSWBsActBe2xmo4dfMHb3rFrQVg5D?=
 =?us-ascii?Q?pCTB8LcSGgksGBapt4ho2LsoKc/IiPMo6OETxHY5gLKjl4JAf0UJ1IuiHjkl?=
 =?us-ascii?Q?JuLzZ0XsBN4tUywSY9kHz5ZbUMP4j2KxVg+FrAzob6yUWhQhcqFxyvqZZupc?=
 =?us-ascii?Q?EkgFNRtnoThqQ4Z/0+QLPH3de4EYLITFcIfUdjpi2MZIUBTojYt9bj4Bkuaq?=
 =?us-ascii?Q?RjJ9dY0ggeZLy5BuMdwdCY3jVEa5mVNzVQYIL+66dvMdqfB7mMMFiSf5v8in?=
 =?us-ascii?Q?9SuRKP7mUErO0lBSMBkig5ri6Z5WV2FBiIZTibl4K47gt99hX6K6uR9HgQnM?=
 =?us-ascii?Q?VVKI2Uh3eMMYBZOoSdiqYAuyChzCWtIeAWuKEsGpQcpONC5qK1t0E/jsqAOS?=
 =?us-ascii?Q?9YYJBn95fBTsDyufd1E+WwUtAQ+mDTOX8xWEPGJbl/i9Lzm+6aXRfiPkrfZ5?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c33430-831e-48d9-d6d2-08ddafa38c42
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:38:32.7398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DArNCKj0H6Xb8Izod20/V/iLDMKmNad8KU5erpkEluEb6O1peCheuOE761xiJxoL/7E2+vRWsO1d8qeop1yVFU8uM3ip4VMzNNl/YATDSg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com

A few of us, ARM, AMD, Intel folks are getting together to talk through
next steps on advancing the private device assignment infrastructure for
the tsm.git#staging [1] branch. In particular, next steps on the proposed
interactions with and between DMABUF, VFIO, IOMMUFD, KVM, and TSM
drivers [2] [3].

https://zoom-lfx.platform.linuxfoundation.org/meeting/93219227394?password=80705486-101a-4e19-8f11-0baaf92104be

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/log/?h=staging 
[2]: http://lore.kernel.org/20250529053513.1592088-1-yilun.xu@linux.intel.com
[3]: http://lore.kernel.org/20250529133757.462088-3-aneesh.kumar@kernel.org
