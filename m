Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4692645
	for <linux-coco@lists.linux.dev>; Tue,  1 Oct 2024 00:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727742803; cv=fail; b=fY1tgBEnRVPy5eAvmQWOOFB83k+ELhDgaA5fxgQHFM3lF+dyBCGyEjqnj+TN8fzs6MAI2dUAz9TVhr9Ra2ATX0X6/tsJ3nOPCjBpgdXXIE4PoWj8+VX6fAZeFEX7cJOavI1QTGP/5DVDCrlnWUgxcLfjK/E6ZbfXe1rKeg3cnuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727742803; c=relaxed/simple;
	bh=7mvueB2OipQVcMthpKNqWA6X+Hns0BWMg5gDOnrNbE4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dPiTlqmek0D1gML7V+bvZROgpV+0H3JP5HiUL/j5MfGby6AqoY4rv7mUyMqhQ4eDK6mmacnj1pkejgA3No48Ecgy/VVb4g++B8icSF370+7XFFbftxuxQv8gLKPGE/aaPBb41VyK/CaP4jVefObgzEg4tAUZY/IvuGC9GbbkBmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N032Cdsi; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N032Cdsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727742802; x=1759278802;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7mvueB2OipQVcMthpKNqWA6X+Hns0BWMg5gDOnrNbE4=;
  b=N032Cdsi7CzHgWn9qdjDpRPqc8QfAc/TNhQ9p8lsMseuGQJK98m6crKO
   898fJlW+ZlH5E0a7hrIxn0AftTPjKdlFWiIPL39pIpOULii7kXBl9YDdW
   FUZ9KFY5CAxLWnktNga0ziBOL2vqQXrLlogpEOwE8BlTm5ad+oGPa6yQu
   UXcTKUYFFScQM3UZOQIvMSYao8e9QuDoyt6KZ9u4jBFbdFBrrEyUzBKcD
   Ct5b42TnYuY/E1UR2oD2d6f2UJIPZLWc9P+Aph3yEQfSwIWhLOPyOVr9J
   KBZ/hMsDGwPYS5lW09VLlB+5yOqgwY3vQyKOn+adjWp9UQ6YWwhwXz9gx
   w==;
X-CSE-ConnectionGUID: L/4vbDNrSl+HsmkLNDH5Hg==
X-CSE-MsgGUID: 4PQWwFXRQ7uBphsqzqGG1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30650132"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="30650132"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 17:33:21 -0700
X-CSE-ConnectionGUID: PpnDy85JS3eI2reCAJiCqg==
X-CSE-MsgGUID: Nc573ixtQvO2FUcjWbs70A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="104258506"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Sep 2024 17:33:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 17:33:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Sep 2024 17:33:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 30 Sep 2024 17:33:19 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Sep 2024 17:33:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKfgidUhMxWr6Uk4cNuhkhnRHDkCNuMXYroynl7u22/IZvWXyHtUIR8/BrmMlmnc3cGonwx4ZdzrIZ5DkdFEPgB46fJv5wN712CWNB1NZ3kpnuszmVz4o/nsmpEI4WnWE4wh3uu4fghQYAG6hKqYL8vmtoVJQVE/lXR/G7uHEfCjrKyIbMP2F76H6kiBG0wM2PovMNPgPs9UxGqvEmywzF2/I0ch86WsUGcPD8EacmUtuhsg2KYK1m5DX8IxZYuZYwVDiV4rWBrI2Eb5wQy4nuRljFWQusPaS7SeY49bqkRjxVQ3vtQkPcg1E8ae7pzaOJSht5sdebsR2kPc03Cuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjiaEK02Rf37I5DCNVxOuaHQpb7DAQRamPr6bjg49jI=;
 b=FpXxnFvaAq6ZSvCTViJCMJ8EsseOxcs3svgc6hLdeqZd4wNNw+Tu2NPYTLmmneyxZelybw6xAoZd/XdLZggceCxFQ1OolImjRncszbrvvM3DHwRbybj4bMKcLCnMCfcH0hWOb8nRS2wPWtxjITxY5tzmvlzcleUe4xYWWGb+HchkqkUsVgYCtbzQa+h0cU7RdEeVk2klRVot/pS6ImLNyzl8UXeda524wAlw9sdsgHS7Wbz6XYZQK8hT/sUOSp8ujbrhHCIxm1Wql9IKjTZPQSbV3vTZxYUNZAasBrDG/vubT74hTTbiEzftAYp8tWmwFHHGc6J6BFzZD2N/TzYrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 00:33:17 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 00:33:17 +0000
Date: Mon, 30 Sep 2024 17:33:14 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, "Borislav Petkov (AMD)"
	<bp@alien8.de>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>, <x86@kernel.org>,
	<aik@amd.com>, <elena.reshetova@intel.com>, <pgonda@google.com>
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
Message-ID: <66fb434a7ad94_964fe294aa@dwillia2-xfh.jf.intel.com.notmuch>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
 <74ne4i5nzgqzoxdvh2f5acqeffa7cx7nkpi5cknl5c66kbm63v@v2m52cgxy2ko>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <74ne4i5nzgqzoxdvh2f5acqeffa7cx7nkpi5cknl5c66kbm63v@v2m52cgxy2ko>
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3c5769-05fc-48fb-d686-08dce1b0a46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6wvJYZ979JcumHH+AMW93GHy1fHg7f1nZj7dGZEm3JLsnMk186yI7yqBAaPP?=
 =?us-ascii?Q?bmiW07bjtSk8+fhCGZOco80jc+TtC8lkiPOf6bNWf75aQ0W2FJDoNO1zP9sz?=
 =?us-ascii?Q?edo8e9sN2E0SnFirwKEn5wN+oICYVx5iJFP4MSU10ZGBuDwyLL5mvvGkr/B1?=
 =?us-ascii?Q?hqzCyy3fuV1IYi1F0v+13+hORZa4ktpvuNKMKS+S7+FqXVwMH8d5k2LzK6r2?=
 =?us-ascii?Q?KvUE+07Y9V09hSZJ/SIEw7rRxCXuj68FcQTPXbxmI4FMjnGh2iB6PiRRixhk?=
 =?us-ascii?Q?CrJw4wAp5Zr20N/LiQUbabRwBwDFPDOfBtZ2zct+Or8AyA0VunFSwMr9RZ8Y?=
 =?us-ascii?Q?wvK7T9fOWacvr4m1avPXddg6lYUhjYEuo9VLRUvYnDia9WVr++ZFgLwW/Byn?=
 =?us-ascii?Q?5uX11uh/WqbnxMZIt9miZ7hSvGQRymuOhR2YUYPZcWG4FNmFbvrEdE/3RBMt?=
 =?us-ascii?Q?NrbHOKw/JFuyDsrq4I17lJPp64me1StOklevP+OhTrKSHqy8GuXoAJaJQ4Q5?=
 =?us-ascii?Q?g3btI+ctUD4g1QwvvPY3sdYnKjAweLo9nFnNi3xvQmJ1lT5cBqr2SkA1ASMz?=
 =?us-ascii?Q?S/thzNbeNqCGYxzFx6BamKdgFMzy1YRcbAabtywL8+oB0HDQC1MZeFLQZZYo?=
 =?us-ascii?Q?DnNHvnNjqxpCfoftPhpjygO0SWGsrtnjarDk0MSgRbAqPWuwzDtN9nFkOyhC?=
 =?us-ascii?Q?DdLBwFRLRAN/IA8Pa2r8yFdVJaWn1fRJL+qo0KGLf6/Kje0/HvObYhyXbVCK?=
 =?us-ascii?Q?Oi87e8RGOvcm2ncfGqL7wP0qoDnOnaKG/e29vcv4CLVbaJTvIkkQ7F1yDJnJ?=
 =?us-ascii?Q?k01hn2jod3Pml63MS6AdexSERJQElViddVzCYzv3cXnBvH8wWNJwQhjSLfEp?=
 =?us-ascii?Q?a/f8QDdhhEnlh9K8s970zQJw/rbdFG9Na5oSZeSWmnRN7ZUvBd63T/rsp1gI?=
 =?us-ascii?Q?Hz69I2pB6jVNH2G5Zi20/olzBBHedQQZn9dxxDISriqNnbcwl8br8O1Def4j?=
 =?us-ascii?Q?G3dEJmH7lXNT27YpzYnnhfkkX4cpAwL5YUWQZUNIEjqGmIXf2XMPNLdExjnB?=
 =?us-ascii?Q?pcCtv+I4MBO791BNaNgS2XNQdq5WQMBLJJfMmAdPEwQKoQbmedy4Qx/GoDQH?=
 =?us-ascii?Q?nUHMzJUqnbk0ai7JU/CmDK52wp5+P7MNCxvcwEibUfbTTfM2QZbd1VhL52fW?=
 =?us-ascii?Q?Y1jROqeaiNJnHcfg9AHmRz4A+h+96vCMFXBFv006nEWx9zTk+tFsyCkD8w0w?=
 =?us-ascii?Q?M12w7tYhoKD8YRKdyHKenHCfY7FUvycDvPIPiuNMVw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GYC+mfwswbGymNu9jBrP36KpNxdhE+pE5n82fNzWgTHf/ejbrj4/cqWuQqPZ?=
 =?us-ascii?Q?e+GvjHRaFgTsNi1ZDOCFqbTvn96o9qLf/IesHFY6efFTgf0vix0Pz9iXC1wg?=
 =?us-ascii?Q?GG1aMyd+tXL8GoJlbMtW6qvPeESMOWZ7b3ePUNEKQuva43JqULbFnp5xOx4E?=
 =?us-ascii?Q?WuY1XP1Ka0RTWZDY/EY2I6na5sedAN4AG8gmpfM+Wvze+AXwZmJDpg4f6HrX?=
 =?us-ascii?Q?I3qWxPC5DU1zsnjpAdQOeTMYnHa2cIWG3sm55EMBRBaG77FIqGmFn15PQmxW?=
 =?us-ascii?Q?VJaXscHcDpxcn3+q6N0WAf5ZRuc4RcPYYR92VBJKDIg43fjgxyoJTU3VljKq?=
 =?us-ascii?Q?8vSQePjbrYgb0uBfu0nCIzaU8f4kLd7huiDJCONlVFNvCjEaC1ayjtGQ/YVE?=
 =?us-ascii?Q?9wWkQJWeR+ekwd9QHsyOrc1cKcNMOH4KMR66AZbl7PvopaWaqLml8kTZfI91?=
 =?us-ascii?Q?GdHJrLZu0U7eU0W2ziRB2EgCju7xWIwqahriJMIPIBK3plwr+WBnWIhmc7Pv?=
 =?us-ascii?Q?SVUUAMtfW88K62dbZYFybwAVMkbkiBzYnwjWKS6Dc8RWSvY+QFrDK0bd6jz2?=
 =?us-ascii?Q?g+mZVyq5drUMMYtz9D8anoigy9NZN2ta9Y0Col4/vvHxtiofn5NsPob7dPon?=
 =?us-ascii?Q?m9yy9uO62jVMEtgG63n7cuMkcTgqnwD3vHJsWbev3bs6kczZvY3N8hpIuQ8c?=
 =?us-ascii?Q?4CNp2caEaLVxxmRQQsouK1DWHimIo1D0OQUfncn7yYoqpH2qVeHaWiE+jMLS?=
 =?us-ascii?Q?xo0z07P8dbUYE917Xjd0rMPORvPP9QPKLfgzrajZ/VM0Tyu8P6kdf/ysWF7q?=
 =?us-ascii?Q?98LK1yU1lDjdOLXX/mCah8v+C1Ay7kuvU/QeHXD8BeWwZx/uwxuzdJo65HXj?=
 =?us-ascii?Q?qpulErOJuv//vVYnohhv58kRNgjIUe378vR4QeluQ09q+CnK0efthtNUnSwD?=
 =?us-ascii?Q?gloHEe7EMT7vl6V79z+ISRzIMjcigUdh8XVcaW/CJbBpNQwAYZ2aGKt2HVkL?=
 =?us-ascii?Q?MsBRS7Gb4HK2DVa5k6XKFaKtyAFtVDliGrUz025WjgvyD4AV/sU4w7OXh6Cj?=
 =?us-ascii?Q?2pCMMNIL/OP1k3J4jLRHBJEM3p7U17aczUiLThx0XhZfUY8oXe8EHNSyHM3Y?=
 =?us-ascii?Q?TQ22uW/dq0pp+DknvqoztHA8gsopt+6Ki/DzkxOQRRrbs4aGav+f/mVi6KVc?=
 =?us-ascii?Q?Xxb+fio/F0JAPwtYqI6FyTXL/BzNyRlblGQ2ntuhqaQvb5l+sHIYP9cM+Hpv?=
 =?us-ascii?Q?IlyZ70PFZp7lr0WW1JhhU/FQRDxGrvOXO/2ICamKg0MpP+RomjHPwJDhmp8J?=
 =?us-ascii?Q?OjQzbv3GAMgXiYtcCOtVaobqWuY+i6xtSfLWvbIcHyX54GryXD1FQ5e/AnoM?=
 =?us-ascii?Q?Tp8rcmiT7eTQNJnn5nVfXia7hxoncgovcnMbnZmgBIQoG5Usm0wvtW60lIAz?=
 =?us-ascii?Q?qciHJgAVm35T4MLpqyc0A8J+Jmrz6n/236/R1UZJsON6q3iHXUugeRJX3jcf?=
 =?us-ascii?Q?upZuRyqi1ntmFQ5Y/ZLOEIvBfmQ7ULpBuEdpLgZtAWoqumftKDq5vxEtngmo?=
 =?us-ascii?Q?GiQvUFSMobqUxcxAAcJIMls2EOj38vx1usSYf4RbR+URUSgyz4gjEKkK7Nt/?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3c5769-05fc-48fb-d686-08dce1b0a46c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 00:33:17.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9NHFkRLRHnYxbht3l0ekG88+c/27N66x6cULHRGEdI8pedkHtWLJztcvmkDMAPImQeIT1pMhuR5R3VHlTxWKb+V/ankBpbWAFIziNYMSio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
X-OriginatorOrg: intel.com

Kirill A. Shutemov wrote:
> On Thu, Sep 12, 2024 at 05:26:26PM -0700, Dan Williams wrote:
> > One of the points of contention for enabling runtime updates of the TDX
> > Module has been what to do about the fact that it results in
> > confidential VMs seeing surprise updates to their TCB. The general
> > concern is that there is a non-zero confidentiality regression risk for
> > updating measured TCB components. Not only the TDX Module, but
> > microcode, SEV-SNP PSP firmware, RISCV and ARM equivalents etc. The
> > degree to which the TCB is or is not compromised by an unexpected update
> > is unknowable by the kernel, but it should at least try to be
> > transparent about what it knows about TCB stability.
> > 
> > Ironically, microcode and PSP firmware update flows predated this
> > launch-state attestation era of confidential computing and resulted in a
> > "permissive" by default policy. So while TDX Module update is a new
> > concern that triggers fresh questions, the resolution of that question
> > reads on more than just the TDX Module.
> > 
> > The proposal is: update the cross-vendor TSM Reports mechanism to have a
> > unified response to this question in the form of a "TCB Stability"
> > build-time configuration stance.
> > 
> > Likely hosting providers expect tenants to be permissive of updates at
> > all times in which case they can just mandate
> > CONFIG_TSM_REPORTS_TCB_STABILITY_PERMISSIVE in tenant Linux kernel
> > configs, and no need to read the rest of this changelog.
> > 
> > Outside of that case though the kernel has a responsibility to be
> > transparent about what it knows about the stability of launch
> > attestation reports, and it has the ability to supplement the lack of
> > proactive notification of pending updates with an after-the-fact
> > watchdog.
> > 
> > The expectation is that userspace that depends on remote attestation
> > (the common ecosystem expectation for confidential computing
> > deployments) already has everything it needs to periodically revalidate
> > the TCB. However, similar to how the typical watchdog backstops
> > unexpected lockup scenarios to limit downtime, the
> > CONFIG_TSM_REPORTS_TCB_STABILITY_RELAXED policy backstops unexpected
> > remote attestation connectivity losses in a common way.
> > 
> > Lastly, CONFIG_TSM_REPORTS_TCB_STABILITY_STRICT, for completeness,
> > allows the kernel to be toxic to even the possibility of runtime
> > updates. The inclusion of this option is mainly for the communication
> > value it provides to later survey how many Linux distributions, cloud
> > hosting providers and confidential computing host platforms offer
> > compatibility with a "no runtime TCB component update" policy. The
> > maintenance burden of this option is low compared to that communication
> > value.
> > 
> > The enforcement of "Relaxed" or "Strict" violations is expected to adopt
> > the kernel's "panic_on_warn" policy. I.e. a violation is only a WARN()
> > in either configuration.
> > 
> > For now, only tdx-guest is updated to convey when runtime updates are
> > disbaled. sev-guest always asserts that runtime updates are enabled.
> 
> I am not convinced it brings any value in TDX case.
> 
> Whether TDX module supports TD_PRESERVING depends on what TDX module it
> is.

...and, do not forget, what the tenant is willing to accept. If a
sufficiently motivated tenant wanted a module that asserted no updates I
have little reason to doubt they could request to run with such a
module.

> And TDX module is already attested, so attestation server can just
> fail attestation if it is not okay with it. It seems to be functionally
> equivalent to what you are proposing.

I address this in the cover letter. There is a measure of value for
requiring the connectivity with the attestation server to remain in
effect. That is the value of watchdog's in general, the kernel can set a
ceiling for exposure to an unattested TCB.

The cost of this mechanism in terms of complexity is negligible when
considering that small (userspace can always do this on its own) value.

Recall that the motivation for this mechanism is to allow forward
progress on update enabling while mitigating the impact to
theoretical hyper-vigilant tenants, and to survey the prevalance of
hyper-vigilant tenants who may not make themselves known until this
technology is more baked and widely avaialable.
