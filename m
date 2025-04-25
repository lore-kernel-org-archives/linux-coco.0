Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F8D19BBC
	for <linux-coco@lists.linux.dev>; Fri, 25 Apr 2025 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557456; cv=fail; b=N2IeITDZ2mIXKtDLpGfpOBzboxxsTtWnTFeK9P9bDHEwJ8hAWXu0LRFp++Zhxgt6PrBO3/8d2s6sAvjQZTf2y6tR2nvtSYLINrgtej4iKUJrZK+IYiPtHsIm8NPyx+rbaVl3j/PyqDjn4koCU8snm2wvJtre4s2bH85kmOk74HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557456; c=relaxed/simple;
	bh=G2JgHzFzyyRKYnHBrooS5McuS523us2TQguPZbQeRoU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SSTysLiJik3YqvL92WEJ1hQAfT87LDePzYvgwqXs/GfX/V+oHm8nj2eqM78nBerDmhAEu5LQPj9AmzLvI3b4t3gAQrseGk+3tqmuahpoT1l8QVuQVJgojycfPUF7IYl8782wWpJx32MXI+66YclhP6x+MnVSchaDmZEhRRfhvIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBx42kyP; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBx42kyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745557454; x=1777093454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2JgHzFzyyRKYnHBrooS5McuS523us2TQguPZbQeRoU=;
  b=IBx42kyP6ZllnqJP6aO7KQrV1ydngAUTRgTk9AH9UhrhcmsE00YKmo6v
   G4xz/4Q5U2+RtE3uoV6nrlf46YQdevs2f1oKxVSTF7+14xAb5KHqPDvnS
   zVQywSFKueuriCEovBetXnG8Kbp4YgiDmMJYnAm+POc+92Qdd7TcSx/C3
   bGGd0YID7N+SDdk9e505VnGPUZCTe+9414o5x9Vyn2jpGh7ju/I+zcxFo
   fKXmZxXAEF4m0m+1v/UPDPRskJmF7nL0CU+kvvzXmygULEDSNqGpPT4sr
   FQrPZawCpeNbxc2V9NCQJzrSjExCJOiRLyL091uXdEOWGFlBO2EazIkIH
   g==;
X-CSE-ConnectionGUID: R9Mz3b2lRX+Frm2vX8pe6A==
X-CSE-MsgGUID: IcTqnWDXQBesJCH3JY0pcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64628444"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="64628444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:04:13 -0700
X-CSE-ConnectionGUID: BHM2L3PFQr6qTwy4PQcjfA==
X-CSE-MsgGUID: 4DsBWpqaQZinyGp9mLl98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137647804"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:04:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 22:04:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 22:04:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 22:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9jtlCiyP1k7ITJPg2xV6aVTqJPCXYbMUJC5m5+N0OMLOIVc/7bFi55DQZnF1gly1Uh2dYPxhGbUlacBMID1VodW6cZk8MqPCkD+eylIwTETTk1Zm1ublUlV7Ux+COwvsnf0NOIdUfS1A6yrtjsYaLOBalMPYfISKycagEPOo7rcR4+fRscvQ7nIfainDuv5NN43VvfW1kzq3t6l6Zrkm+2YoW/2HAbBfKBh8fZUjc6wHIRoTNQhEBYNR0p44dwLReiQb0dUgP/g+PlS8y4eVc3SfSx6SzBJDELhD6P0XaYmRwag+q3mpz1g80CMFpvBrbKZhZQ3/XH5y+cmvQaU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0loLcSpB4F/KAp72G49GKATiEFyNbUD1ldaiarCjJ8=;
 b=haTmW7X0qaRHT6XMakyOxnszA6CvEZDTF4koOfbsLYFWd5U6X8tM9ZLoN4eOY83PtfQYZQrelmeO/q0F3U7lL1TzZ2UsiXHy9N95pUNu0xxkeH7JwRhGUt9uJwScLFhexcVlxFSPYgzrwKZKG0YpmcOaFHbrFlv3QvuhcKIrcWULuMkpw6BZ2WQ2vq00mVpppaSAJw2DaKuRUxxApnYykBgYeSVUbqGt6nk1coPZjJQDtvhoZmtpIQFa3rHen09di/wJj2GVQNNjVPQYEkpdVS1am3vznZgbDj9gP9SaTctOuZMZcf6g2xtoYwBnNYdsn+bODmwSJsF5ZiwFZzW3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 05:03:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8655.031; Fri, 25 Apr 2025
 05:03:54 +0000
Date: Thu, 24 Apr 2025 22:03:50 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <sfr@canb.auug.org.au>, <linux-coco@lists.linux.dev>
CC: <sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>
Subject: Add devsec/tsm.git 'next' and 'fixes' branches to linux-next
Message-ID: <680b17b66af1f_1d52294a0@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0249.namprd04.prod.outlook.com
 (2603:10b6:303:88::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: b1aad8b1-3915-4c13-e3de-08dd83b693ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hDosFrKUo7BnBZQ8jhBfx7RTKvdbsHJhDHppcjZC+JM71hgHWW71oQhF8oEr?=
 =?us-ascii?Q?KP1YlzUVm07aCIPoTizOWdll9WgV/FujNQjAnZ7qEjoJF8/Ciep5q1ASY1uP?=
 =?us-ascii?Q?AS4TS0ajl1fexI2uGltBUZ4vqnVuS0ySn6ChWvsd5lYURP23Gr9nBlKWe/o1?=
 =?us-ascii?Q?gKH4R1gyLs+Lv54ZfMQ12ZzVeVVUV4Wqob7KwDjWGeP1PRW4Cs6CTwTfOMqK?=
 =?us-ascii?Q?r4JbAoyhWUi1JZQDNBxgYiEOBIcpoqMQcBAGi85U8kz7uf54kSRibprFAWBl?=
 =?us-ascii?Q?qeJwsjSbf4gGvwFA0LxXPO9Sc11hqA/7TMEtddfCB6sJZhXtFMFukBW5avRv?=
 =?us-ascii?Q?SItNvZpxq5tPA6Ikb6gzFDgsS0sIHfEqup9K1lBSBFVKjnU1kBFN7BIJBiNI?=
 =?us-ascii?Q?299xWu0s3joprIWb7GnKMdesMAglG1nKtsSk7rXkpErBeMNQbtVjmFG8MuxH?=
 =?us-ascii?Q?lg1R08O7bmWv4r86ejwRV//hjAu+PhZmcRX0ojxIC8HBHnAJxB6IqAPbBveS?=
 =?us-ascii?Q?dDdKAkQnF1WvMGvGF4oDANvBaIsj8LanMSD5FMsGw0Dcm8zjs9nvvPIHXIM4?=
 =?us-ascii?Q?DJ2gK13GyVXOEolaqmhFzai3f2vcuZqiK9K6fU+l6sC2mfoAK02mWrvfQQly?=
 =?us-ascii?Q?bh8VZQk6ifXFRirMkwVThV8LIiOThwpF5AJTpxXMvwsUhQ+66NIetXz/kVgk?=
 =?us-ascii?Q?a7tj9MXPicAGW9v4EP9MJZerl1D0nNJKtSytbe0yTSMQrAyTJSGZsIiF7NwH?=
 =?us-ascii?Q?fgGooirT/a7eBJUXX9kGaK0aSer+TKld8cyv373WtCXoTfoTpBhOD01csypp?=
 =?us-ascii?Q?cLj+Iuc6II4UdpR4hIUsL31TUmA/e2PIb0ieDYU8gL5gi55ECdLZshVkTfV6?=
 =?us-ascii?Q?Y6lpab/v4KGeGUlfrFjurmdTmV6tVoEVYd32c19IAoyo3yHeluGaxqCl9Lhz?=
 =?us-ascii?Q?nJxcZkQ+8tMGXYBzpXS+bFJ/aRQOMe5zPRfN4DSe1OnjOYthPPOOU5Uxu4wa?=
 =?us-ascii?Q?hQFC+pS2/4pIj0MQEoHxgW29V9av3f9cnQfkoH/OyV/50iauuzWJnwQ2TQsZ?=
 =?us-ascii?Q?5V65KN5DQEQH2W9z8326086OMtFnnpkd14wumYxgLnICc6EYgLmbgbEeYaoo?=
 =?us-ascii?Q?VuInKdzLTydZBUq0BRlzA7hu66cPTRKig7vLxbKnDCIy3buhlJ25LBbVRqbI?=
 =?us-ascii?Q?LiX1/WZiBdlFP9vwy/JSXwBR8YqxRKQP+fsaH4NI2xKJ3zSx808pp/n4QmZR?=
 =?us-ascii?Q?tobyI1Ynq8hrxRDjE8U1lNq2coffjGYe895QouABJCLWkMQ2DMB75zW2i7ib?=
 =?us-ascii?Q?S8YM0koJIJU/87V1WDiZ/w9PAkNUeY7iYTqA3pSSCSiC5nQxQXChk6s+wd6/?=
 =?us-ascii?Q?gMlN50KO5y57+JHv7SEcnRbbxqyCRCDTy8v8RZgmt2RvTkxUen6pOq8XZbub?=
 =?us-ascii?Q?ecZiClwMxjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/2/JZ/oXRGB501/pPiDvtIEtfjXikmKcAvRji6uvooK9a75TZadYLuZB7Z+v?=
 =?us-ascii?Q?m4k8LMQ/Q+oBE8ifl/K3cVMdNjnOgX180TvBhhS6K4ynCMgNRQkU0zFfvTdx?=
 =?us-ascii?Q?VT+ln+LgCoLMyXp+gth7qxzk7EZIlHVKFEs/KiNvtI32IVDar3YfpasXun0c?=
 =?us-ascii?Q?fsoi7aX2opRHVpyLU1B6oqEMm4e23ZbZnSgK/Ap7Ty7iLdzi5w6dbia4bMEE?=
 =?us-ascii?Q?BnYceshU6UfjDtsy0lzcQ4jRhWczH+0zkZlO0vK8d94Rk4wJEiv/O6dJZh1C?=
 =?us-ascii?Q?Id2UFKTqD4MVguUFfklKwCbvAKeG6Q14W4qW6E4+Ve/GsivKgx0AlbPu88ok?=
 =?us-ascii?Q?rhf1M55t80OKlMzPdeCnr72I3nTW3y943/CzQb6V3YSr1CiZgDC/JVHedihL?=
 =?us-ascii?Q?F3sW5hUQb44qZiN0X7pqtWXDWneTRwp/klXTimIsQmxJQnmEG674JB+gSZ5D?=
 =?us-ascii?Q?xBMJf228kNiFcX0hYnpF0KSojamW5TIFA6w4tHGecxVaeDAIsP2247jksNb+?=
 =?us-ascii?Q?L8cmFVIzRiNcx+qUUuNnqI86NmyC5f4QSudV2Ja7q4IPBG3zt63mpSm/t4Ow?=
 =?us-ascii?Q?EZZgkH5BgBN5RbE7oJJDOpbbsfu7VuGcpbMZTyEyJHcIG1Bpn3By4TeqELMj?=
 =?us-ascii?Q?y2Hb1Rz+6q5gcA61O7yGsZ/ysBVy97PfCDq5hfTahuKmZx7G8ZVczKgiV6I1?=
 =?us-ascii?Q?arOrVE9Y+twGdvpvwYLP9WYACx9KtR41Nf3f+5OCxISwWJF+ofOEatzBPrIT?=
 =?us-ascii?Q?vhpZaOAqL9ovXWgiuuZ35NflNtMK4r+M0Or92fo/t3LkZlODGpN5BQtguW5o?=
 =?us-ascii?Q?Rx2J382l0yDLsAhOUxdwuAV91nSwDUKgg0Yn7FtsZVmfTtecrT860tjA4+mQ?=
 =?us-ascii?Q?ZO2OtNoVmSNy9Vjrs1YQ1Py52wQ24bhTBW02o2+IQbzk2ShvfVYvML8XDpIk?=
 =?us-ascii?Q?kohTJS8lHsmdniswX1wq6IIx8Jt0AxIhnmEzyyLrYhCoYFN39lPGHrmpiwx+?=
 =?us-ascii?Q?g5agvjLHg6eY0K+8Ot4RGMt6QYNSXqaYlxvRqi3CP4jupCQxTVg8iGh1ReGW?=
 =?us-ascii?Q?Vs+mTuHIZKqJWhxh2O2wxAuR2iywC6cpZxaZKS5mDmwRfXVTPuFvv7ZjsTLF?=
 =?us-ascii?Q?0R7NdoU5XhfuB2qByCUeVPXG1TM1+66/KCwJypIzNX6petQJy+LtAMWFePG9?=
 =?us-ascii?Q?ePxOsN1ae+aF329+Tf+ucsDfnNcCSVDJ2WmgeWUVJVw3wICy6bur6RUD5JWb?=
 =?us-ascii?Q?U195hWwl5RJe4Imidsc/0ruIL07DiP9VUukmHrdBC5j3C7EqS8JtxvSfs2wK?=
 =?us-ascii?Q?Ep2kWRSQ0gsLk3ZqaZfrdkBtUkMQsDmg/JQEGhyVUce50WqkuUNRm39HXt62?=
 =?us-ascii?Q?UU3V0157iTjpwoxU45JSYR6pkt0pUaIsdBSz2OcYU/wFy2HBRjHdC51jEGXn?=
 =?us-ascii?Q?C3fge/EG6CExHkCfvxLwZWd5HzIfzbbGjzrvelfmBwbHUDN2ZxPJHuolW1FQ?=
 =?us-ascii?Q?7GrE8ALxu3CEwpV2MBaZpklKFgBJnW4QZ3McvzNSd9TbBhh9DHjrbpoITZJZ?=
 =?us-ascii?Q?/L5U7UaG1n2EFTp/UQ0FMRfUJmJ99T8EWMsWSokL79oJdPlWPNmO20oZsKN8?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aad8b1-3915-4c13-e3de-08dd83b693ec
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 05:03:54.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9rM3S3CmXIncXHKXEoE2x2ugEisRYU2fl7PEOVjlBo5kLB/fQ2SSwrNtM5n2/RX2Yom/o1LggbPSKr6b+W7BSnK3YSvv+NOH+2pDOF97hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-OriginatorOrg: intel.com

Stephen,

Please add:

	git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git next

	git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git fixes

...to linux-next.

This repository contains cross-vendor confidential computing content for
platform "TSM" (TEE Security Manager) functionality. This includes fixes
and ongoing development for the configfs-tsm-report facility, RTMR
support, and PCI Device Security (PCIe TDISP).

These branches merge cleanly with today's linux-next and pass an x86
allmodconfig build. 

The names on Cc: are suitable to add as contacts for issues with these
branches. The bulk of the impact of this tree touches drivers/virt/coco/.
