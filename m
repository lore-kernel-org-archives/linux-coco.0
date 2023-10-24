Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19B2E625
	for <linux-coco@lists.linux.dev>; Tue, 24 Oct 2023 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8ruAH/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698176037; x=1729712037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=miec5s9YPznNb7JQgJ+XRi941r5LsFfHWWd1+Ybal5w=;
  b=m8ruAH/q9TEudQ/PBJeD7EG3ldwz8YpxIVXqym2d1Fl9FFQ38tV4yZPR
   t9q1FonONTDiHOpMTRmCx+kjM8V1/7GaffHJ0d4H0+NDTMpxoifNxlp6I
   fjQ3Vmb2IuRcDj3Qkus/y0aLUCXKQXmQdQbo9HQlAW90eo6z6XvP5ps3D
   z42V1+JX7S6o0U0Sai6i4XCOtFddyqMWKBjh5AeO8FOJL6LQZ02Yt+ik1
   aUurCsQuw9gx18RQlP461AhzHQgmoPmU0NA6l52LakIBTHVi3uFGOBLA/
   FMF0bFWBifCDGYI58GBpXF3v1nuLQ6rZtHBBxGEMUjWzkjwM2u5gxmz13
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377526306"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="377526306"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 12:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752093195"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="752093195"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2023 12:33:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 12:33:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 12:33:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 12:33:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 12:33:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFpAdyBAI63Fq/E8UN6Ot5n2BmqPNP9J+31+Jt1GYwUZScXKWrsszACQ59RfJt5JoDHjoQ8FBqnMNMtWnEQzVClIzblAwfh9cJGjqo2UAK3ZqzHl+sPl6tQBbs21ASe8yLdPTo3syQKwEob82SrdEMLHrU2ulcj65map1UnpHLCdQpzei4AK2+rQWhPWrNsKPY3K32DtraqseGPZ6AFihHhO6DhGjYMkXZdWBUnKfC4tC0F7Y3pTF6d25cwB99Jk09sRmgY4Roe9PCvDc3Uve9VN4q7hKr3xgS7f9D0AuxpK9BeDODqE3raC3GC44x0ZnX6YhYwp/SadXixgmBAmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFq0yml/kBkwX4hOVUmE/jzM9isq7kkrE1dOPbN6Sks=;
 b=T/5SAVzeB7LXnD5asIqQukCEQm7t/htpNSINEyKMJaI2/2uFFnv50FsuxdZN0gq9PEuXbkYeuXP51SSkVlHpWm+ugaO+LYkyeI7uD5FBam06k8qLKd46nNvbU7PCiQnxJPah64AIXupLJx5LYXEp4FPbcqFKTkOD9ZiP5f4FTnpZF1XKnbbgAlGg2vx/kIGMzz1qDEnmzJEofLe0njt4nBZ8UZuv7mwc/kT8wQws3fRnaTC4oSVjRD1kA5Z94A3ikleKM5I7DuztYmDofMOPsJfspIRpTJRjh5U5d/NAMIvmblkLm8oM5AmCXaIYVAk+NeDItNK6TOPn49ic6g841A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Tue, 24 Oct
 2023 19:33:32 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4%4]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 19:33:32 +0000
Date: Tue, 24 Oct 2023 12:33:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <sfr@canb.auug.org.au>
CC: <linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Erdem Aktas
	<erdemaktas@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, Peter Gonda
	<pgonda@google.com>, Borislav Petkov <bp@alien8.de>, Dionna Amalie Glaze
	<dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz
	<sameo@rivosinc.com>, <dave.hansen@linux.intel.com>, <x86@kernel.org>
Subject: Add 'tsm-next' to linux-next
Message-ID: <65381c093d0a3_1894294af@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:303:83::25) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SN7PR11MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d16a654-298b-4953-026b-08dbd4c81b43
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RuQ++eQmmD5TJqjnWd6Iex3aInmWowBYw2dpioqPe1GQptw9QfvrOORxDF1HCuNltHPnsqehj4sUiUkNi4zZ9kqIDOgFsovlB8DOuWM0/eDF2YuL7VzokqKPSQ5BnCr0byzneAuupx8lb7R736co914/2yrC4BV5ZT4yWLgi+DI57jznCQzTHA3xjjDodcnKeHUHvL6+HzD7IJDmHzu/OfdGfIrIsvh5pKCt9KxhFdYFuANUiwHFGEtk39yMDCu+Z7Qd7sg3zNtFidBI7gfMKEtheGG2v5sbJ7UpA8URoIkROpEluN/1hIKaVuBS5UzI+9571CZkKTBJ68sTRSayoN9r8WVwVUU3fDmAMvElmSwa32Qz8w11/zCuYMQrY52xwIk58iZsDldGMGQpWnCVP9t4It4ocCaBHa7YVTCqjoeFBu+Uxdl1yFLZhy1Kj1Yv8gJjzT7zI2qB0ToQ4U/6Ydo0HhTylpicGvuEZ/9jp4HvKDwO4SZKACpSYflydTSQbUeA4xI3NoIfyQKX568SqHZT0vooBR1v/TiEyl6Y5BI6uBdCZ6JlIVFjq2izKjiH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(4001150100001)(38100700002)(2906002)(5660300002)(41300700001)(86362001)(7416002)(4326008)(8936002)(8676002)(6916009)(6506007)(54906003)(478600001)(316002)(82960400001)(66946007)(66556008)(66476007)(83380400001)(6512007)(6486002)(9686003)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1HvnQiXzCRyzeEn7AbsvXorvg5ebsUj8YxZEdZJ64VJUpldGvt0A+Et6ig+F?=
 =?us-ascii?Q?ok2Fm/5YyRQfNH768RbFwEt7DWPz3XQb9UfyYWbjLkwZZm6CMaN7Fel8j2Pm?=
 =?us-ascii?Q?vtObJN1hykfW+Ac/+2DC5DIcQtB1UB1rhSpWSptfBL8cRaPysFgHBqzJQ8+/?=
 =?us-ascii?Q?Jf8refopNAPV2xQvRO/OiR93HMT/clxzN9UQbgolO/R0lf/SHfWmqzY+qhip?=
 =?us-ascii?Q?Ctikq0gSVuYVN3f1gFtj49hJe/v5bqV7BAL1SXjQL1X1ODcNZUtLuUIK8Vrt?=
 =?us-ascii?Q?xz+i60ZvEngNZ/kr7If2djO+iq1Eazdm/CuhkyHaZk11eNSBRUWEmatrswQI?=
 =?us-ascii?Q?eBRSjhvtsJSnAYrYLc72ClFP65lGhx0IT9AlGeVH4xFCkdpz7uwc2UUN+Y8Q?=
 =?us-ascii?Q?pUbT6RtlfiA2d0cmyKVvtJqmC0FFuxmKeQ0e6rKQvcD4Y8cSSDbhXf/+DJ2/?=
 =?us-ascii?Q?ihXDh3p10aK63mS3Vy119qzSTeiIs3WMw7qBolo3VMVYcrPrn0vjrLsJMSfU?=
 =?us-ascii?Q?rNQZMokfE/mpuLOouZ91dsxtxnCSF4y/LgN3Ygv+0DiZOKUw1SM2ta1boqNQ?=
 =?us-ascii?Q?udWapwmxsaAj2yNWOquk/YFcUBGit9hwMdaq/aAA9D+Y0PUqqd3TJQc6bOlY?=
 =?us-ascii?Q?StZNbepMiMAAxVno7emdUmSopXtltotsgFF6t+76wKbxDogYgUbhWd0VU341?=
 =?us-ascii?Q?W6YCgVX/E2Q7eF9PSk/aXTDhyzqsq+zGiqbb8liZVR8wCfOikm2Oks/m4AwU?=
 =?us-ascii?Q?h9XHY54XbV2kPUJjxee2aFP5Y0QBfAplpHmITBKd5r+Of4xH37Jf4wPQ8byp?=
 =?us-ascii?Q?DjrACZRrrfgKKlbF8rNrGM8k/T2W72VsQGU7pBLHXMqz22ycJJXHC49Lv6Pn?=
 =?us-ascii?Q?TVZMalAhW93lIl4S2Z8Z4XXPLWjl9h4r5+38N1lQEmfyF5p4liMa41kmgyC4?=
 =?us-ascii?Q?COtn8RsfpLEk0ntigkNysMssboimdn4QKpqYgayRSLy7n8DD6mFqJ3gxQ6BX?=
 =?us-ascii?Q?9FXUt6OBqSMdUmW9dCwp0RL1JOSzoZUOID7BwVbpVWM3XORKsz37PQq4P/uK?=
 =?us-ascii?Q?B7ETVE6lAPdDTVQdx5u5m9u/gsspeAZXEprNO8SEeZS+GNWfIEnS2YPDO8dF?=
 =?us-ascii?Q?B7QoalkXDvohqfC6NDrr39FVTIQc4fdQZxqQX37zGzezpZpRCLqOrwThjIdx?=
 =?us-ascii?Q?O6/HysJ46QlluHi98B0wnAfNYyVCjWyX9Rqj8aLCfXOHsILGTkQvyhxpEOlg?=
 =?us-ascii?Q?h2GIZP57AAqx23X38vHnEppayCDwWIaIctpOSBcOPJJZOiEhJYsMjdywbesS?=
 =?us-ascii?Q?kuRluhDwuVglkKryz0Gy1jddsqcmAM8/18DQIp1KTY439YzGzGiF6lGFgtAr?=
 =?us-ascii?Q?jw8AvK99/by1h2LN3itigTFme5bwSlcEkj/Nwl6ylud03tcBLWCStPij+2N1?=
 =?us-ascii?Q?o/iYrmJiGeiIVd2KpmTyMnuj4bwH2q9ylUr7VNTePfgydnMURjMauAx52kal?=
 =?us-ascii?Q?gMFbEsoi1lrtUJNzf17Y892i396VBVMnNCMI5K2aM4cdnYwsE9gZHAfnkTno?=
 =?us-ascii?Q?FtYdCFKqkYTnIEeifNhQQ7igjyPy7KTo71FOCoXBtudWCjBqMMxqS3ceaac7?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d16a654-298b-4953-026b-08dbd4c81b43
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 19:33:31.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kMlY/g9e3pIXjyBJYzUIKOea+LZYXrAr9A9fqdBQbYWJTqRH3Jf3qL7OM5Zl2Qg2pR02kL/as7CWLvNupAALedeP4p/SnORYI8NqTGxXpYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-OriginatorOrg: intel.com

Hi Stephen,

Please add 'tsm-next' to linux-next:

  git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tsm-next

This branch contains work to unify the "attestation report" flow of
confidential computing (for both AMD and Intel platforms with hopefully
more in the future) behind a common ABI.

As this is a new proposal for confidential computing infrastructure
(outside of arch/x86/), there is not an established owner for
drivers/virt/coco/ common code. So, Stephen please add this branch for
now, and folks on Cc please holler if you would prefer to take the
patches through another tree.

This merges cleanly with current tip/master as of this morning, and the
arch/x86 touches are limited to supporting the tdx-guest driver.

---

The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:

  Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tsm-next

for you to fetch changes up to f4738f56d1dc62aaba69b33702a5ab098f1b8c63:

  virt: tdx-guest: Add Quote generation support using TSM_REPORTS (2023-10-19 18:12:00 -0700)

----------------------------------------------------------------
Dan Williams (6):
      virt: sevguest: Fix passing a stack buffer as a scatterlist target
      virt: coco: Add a coco/Makefile and coco/Kconfig
      configfs-tsm: Introduce a shared ABI for attestation reports
      virt: sevguest: Prep for kernel internal get_ext_report()
      mm/slab: Add __free() support for kvfree
      virt: sevguest: Add TSM_REPORTS support for SNP_GET_EXT_REPORT

Kuppuswamy Sathyanarayanan (1):
      virt: tdx-guest: Add Quote generation support using TSM_REPORTS

 Documentation/ABI/testing/configfs-tsm  |  82 ++++++
 MAINTAINERS                             |   8 +
 arch/x86/coco/tdx/tdx.c                 |  21 ++
 arch/x86/include/asm/shared/tdx.h       |   1 +
 arch/x86/include/asm/tdx.h              |   2 +
 drivers/virt/Kconfig                    |   6 +-
 drivers/virt/Makefile                   |   4 +-
 drivers/virt/coco/Kconfig               |  14 ++
 drivers/virt/coco/Makefile              |   8 +
 drivers/virt/coco/sev-guest/Kconfig     |   1 +
 drivers/virt/coco/sev-guest/sev-guest.c | 214 ++++++++++++++--
 drivers/virt/coco/tdx-guest/Kconfig     |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c | 229 ++++++++++++++++-
 drivers/virt/coco/tsm.c                 | 425 ++++++++++++++++++++++++++++++++
 include/linux/slab.h                    |   2 +
 include/linux/tsm.h                     |  69 ++++++
 include/uapi/linux/psp-sev.h            |   1 +
 include/uapi/linux/sev-guest.h          |   4 +-
 18 files changed, 1055 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-tsm
 create mode 100644 drivers/virt/coco/Kconfig
 create mode 100644 drivers/virt/coco/Makefile
 create mode 100644 drivers/virt/coco/tsm.c
 create mode 100644 include/linux/tsm.h
