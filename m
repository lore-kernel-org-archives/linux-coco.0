Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB1231C9D
	for <linux-coco@lists.linux.dev>; Fri,  4 Oct 2024 21:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077786; cv=fail; b=Tu/YQF5yZwEC4fwD50KZZMgV5PT9H8ywGst4yfaPR1shKCX2JVSAO71KVBaIATg20bC1GUBJ2TCe51htwCXLXStT77pmk1Lm1cm3n1reyEzW/5in/4DQSaliH08fByu9V+xwF8ji3w1WJ/Za0jbWCZDctnVphyedK8CGmeL36SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077786; c=relaxed/simple;
	bh=imY5EkXXKsP6i5BsW5s1e5bTb7SCSbJoKPn9x7sFgJA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cHw46CsCBudsF+vVib5IuG2SgYzR8OpjpSfihWKm7IsX5afsTf7AaJrfY473NzvO4ofCqc53VVFydCLx2czReP/xea6iAEsFRkxt91LoIkCe81+fdbC86x+hx2JFWNByOkzNp1lmHXX50937ZuyJdUlgWOCoXhL5OTIsSlKPSQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNJojL2Y; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNJojL2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728077785; x=1759613785;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=imY5EkXXKsP6i5BsW5s1e5bTb7SCSbJoKPn9x7sFgJA=;
  b=JNJojL2Yjjg3p4dK1yBABFxLMb4O6osyWRX7WlG5CGK1Mfy3tzm3BcG0
   fuydurHvhYdNQAGdsWh2eqP3isGUiVa2TQ3DZ90Kdiax6ZrT54Fh/dk0I
   v88vLWRhCdVOF7L0qyOjh8UgwYuFAqkhTCsfi5DNPZFUF6X5QSfrC57TO
   c/GgRto+4ne3tTl2hInr8nNurD4WDLa9KfcDf95YrZ9wUpJQu9HXVLqV0
   VREYbg2DI4Tlj5ELEvp3yjH/v6LXBDJni0zJkFDugX8Se1/KbxvObNkb3
   hpwmJwuNHPPzKpmPP9OU+2toPtH/tFI+YMO6XNdYcC0LV5IFqt2Z0dsuZ
   g==;
X-CSE-ConnectionGUID: /g7b2s5LRO+PB7mxTUHphg==
X-CSE-MsgGUID: /y0gBVVMS2OQPBbMNvgDHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37969967"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="37969967"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 14:36:25 -0700
X-CSE-ConnectionGUID: bV+Ger7DS6KkidW7f3DpNw==
X-CSE-MsgGUID: sCNGyTb2TWGDWKd/0b+lrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="78811819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Oct 2024 14:36:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 14:36:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 14:36:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 14:36:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 14:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9GbpVIPFzLI+tYDox0VXbIaR3O1TLR4/7qwZXr9eMSQj6cxFeBwdLXIlypvP+y1RwXCCmFVxWW89bah4lxZ9yto3ZDn2O4xt8oo5otToN4eRwH1rev5vDWAR0jpFiPolStV61x66MhZVMAkWkuyeS+sjjvC2sXUEyRdtFWPvuJHlN9ffYk6zmuKhjxdez31Xg4MMcsex6RbSXhBEGiwdVlxssi1+aE3S/FSayhv+6kX8Q9VYjBFGfHIxo7EvutDiiRXQrw7dkrD5UsoKzhMQ0NirlAtJEwHlcyHoCQh4/o6EO2WiFAQGdEj3CTPlnPhPkQDt14USN0wESCNodaoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1KZq+6PV67HB72eT/P9/Rn2HApuq/Te2rJ2P2qWPDE=;
 b=kY1CvL8hoCYG++i7efUBnu79a7+gXafZ5xquRzvMMB4Ymec363BTFxbu8CAJ8p1FDphfMN02ySqH0GKvtQVwRIF7LRwcASAkQzeZQG1EWE/O1F2eqxoeL3Qt4V/kt9iYG5ojzEqnDLLjWBOPJAMaJTA2/S+1t2pWpDJGo5Ww2F8MgwsjASte7+luCNOI3V/DXRNYGF73K6iSEVDttaUCU2s9osIMrflYqXLSjR2IehyqpplyzuS8Zny5DX4aIYkt/WATr7t2/X0DBBHXKlTy1jOXFhFFFutrp+yk1ocA2bpw8heqf1QFRS9Z0CeetesVyCmZwayRq3GWGJt76PVwSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Fri, 4 Oct
 2024 21:36:18 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 21:36:18 +0000
Date: Fri, 4 Oct 2024 14:36:15 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexander Graf <graf@amazon.com>, Dan Williams <dan.j.williams@intel.com>,
	<linux-coco@lists.linux.dev>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>, <x86@kernel.org>,
	<aik@amd.com>, <elena.reshetova@intel.com>, <pgonda@google.com>
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
Message-ID: <67005fcf46742_10a0a2945@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
 <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com>
X-ClientProxiedBy: MW4PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:303:8e::13) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c3c3be-7679-4754-c401-08dce4bc94bd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?doYNwuFx8rINfQQqkScHRbPygOqGq+1Ul8u/xrey3LYJgePsWJhYGsh3w8xP?=
 =?us-ascii?Q?TjWIFNjrHke5UnxLDc+IYkoVjRJAg6IQ0dfiutkTLLs136oORPI6bxw1C46t?=
 =?us-ascii?Q?VnfrzZvO0mrqGKETpjjSQ167pu+wwGxuWANicplPEMjbtsav80kt60sbniNJ?=
 =?us-ascii?Q?AXF6memTqX634IvFzgLi3MOrdIOhN2TwQ8JDd1kbrUvj7RmLJHUZuevtO4mR?=
 =?us-ascii?Q?t6TnZA/8BXCB1k2sG3WP0uxbCgjEmZcGt068kjupEFBYt+8hcVMvy0YiEqqm?=
 =?us-ascii?Q?wDaG8omv79NeQ6bL1gQ3LVs3nvznFgx0W7yBaqA7kiW5pqCOG0AdeDJHdchF?=
 =?us-ascii?Q?rZ2r5STC12TGdnXSSULU7af+l1UGxB0wcf8qIULnCIdhjibBOmUAuQjkdUXe?=
 =?us-ascii?Q?DBhk21SqQd7EuWf2MigCsQg0JnKdLVMOT2w0wa4idEYG6AS4PgTGhgq7IN9C?=
 =?us-ascii?Q?7SuyOjWSc+SC5oaB2+krulqbIycEsMEtpbdtBFdcC3WCaaP3uNLEOGU1Pm3k?=
 =?us-ascii?Q?YD3SQFDbhkTWS+XquZEldo0fCuqze+KNE4gnUteudFQqecOBU6t5KbVF0Eft?=
 =?us-ascii?Q?iZiPwRAtJBpW8ISdU0pRf6pVAYMV6LsGZ7JDNKU7OTrFmHQK5hdUlOHvbrXm?=
 =?us-ascii?Q?ekQUTAhgZ1DJiqiFQRJG8KNPkqNuOJ9hG5AIyQvcktXiqehtK5Z07ULkJ5ZW?=
 =?us-ascii?Q?jgLOW5SWhxF8VJPjqBfbXTXoPo4U+sUogxwPXlnTQd8mY7PO90tV2LMrHpJg?=
 =?us-ascii?Q?mCJup5FtacjelUZrjG369a7aaJB98hydXeUi7Aaa2RiP9i8YYNq+jaxhSkxv?=
 =?us-ascii?Q?Yv+u/ycd0OXGrcl2IuyrsFeBK3kU7v82v/uP3v4alRki0TiaRqH7o6pvUO8J?=
 =?us-ascii?Q?DZMKYKl1nG6GlPW+zrDh8lNovc90ZhVxjKkynyTTxo/ou9Bg9DUYg0EFenbr?=
 =?us-ascii?Q?tWUjBOzdmO+7GeVqYVVHUtD6K00Zfeo/Sfv86Hiquy/KjvSKBB+BPUfx4+tY?=
 =?us-ascii?Q?FD5AcJ0fCEr0j8X2Vges4OhDLkSQ9n6irPoQieG174Xf4DiwpCKHox0S0oq1?=
 =?us-ascii?Q?nS2IE8DioCbV7PFvUZ0qkJ8dVtpfkWb3zNvYzbhN9M5kLJcaJVAsB7+QVPQc?=
 =?us-ascii?Q?Crv47u/NYahzb/sDQKjpj3D/0+l/E+kdA4ORJ1QR7QhzPlHwbomoAZQQiDIJ?=
 =?us-ascii?Q?0gzsMOMbMimaHkUQJVhl4qXStAinj7ENU3+Fdit2aKazQqijt0Hku5XCf2SV?=
 =?us-ascii?Q?1kI/pOAGRnC/62gckYRAe9dP7NoEahQewI9Y/8zIOg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9rw0jbcuj7mWj3XkvXruVE/wSwncBCRr8M6fKg1GY9jPRS9dpDB/xJOJdY4E?=
 =?us-ascii?Q?IX4TikCIh1IoSv30A6C6yGhbX61XZqR0w+CeBx25Ie7bJrhSBG2Q252OcApe?=
 =?us-ascii?Q?s5ouglWGHssOgnPSzbsRiXADrOWGbtYbCMujsVhyC+ZfbeEzczhN59kCeRq4?=
 =?us-ascii?Q?zjUzEAJelqVOLR+LFeJYJTe8SZu0WPNoJ4iw5FdQudEs3PFP9jcEogQmIzVx?=
 =?us-ascii?Q?V1eNygtwNinBimqLEj3Ug8LHHXR/jTWO3qIbUDRWy/gWonUKDkzI1CdSeu9X?=
 =?us-ascii?Q?rIRiY1tnztvEbutUchEmp9qkMTHEINkRc8R7X95eU8b1ZZNPdigcd7C2ZwhE?=
 =?us-ascii?Q?h7M8BWospAGA8RUfBWeK1f9YirImNCq27JaeC7GEy07cibXftDlku4VUePU+?=
 =?us-ascii?Q?g3wOgXHkLNfXhm2H7hkD5qKaz3Y7ex2ipnMSlWrWHJ90RCdKlzWYQIjX49rf?=
 =?us-ascii?Q?vlYdkkZO8rew4gpzlbvr4EnXV0L8FGSfpviK7GO6IW+pHnk4aTJInUVtUGnE?=
 =?us-ascii?Q?u3Ycm3lqFjEPWMJ8wMZRaU0Ch/SQ0malObtBZY88WfJdJ1gGpcRpiNF7YCsZ?=
 =?us-ascii?Q?0hDh8GqvRDz3tV6fhaPOA5XdIcbijlNYyuhkpa1/3wLKxmGUHUIqEQX26ah2?=
 =?us-ascii?Q?BWGB3jryJDkvr+IkayU9MLDyv5/78Y8/aHIraUvDqoDyOpHn+WYqQUPFiw39?=
 =?us-ascii?Q?8rV40G6QlT2K5pfCgT4VytaUKpbfzaHK50S/8pEe8ZoqPpfOpdaxBvC8r8uy?=
 =?us-ascii?Q?ET50iwrSuD61VBlP0HEsr7J4p+drCz6SnGsk/ZAuk6ndGuiuuB/67KgPhiQw?=
 =?us-ascii?Q?yEc2hnqbwUUc7IsUXwQxSdYDhk+EfnuJVf+LfxgP53wiHUZe6OWyLB44PnOX?=
 =?us-ascii?Q?FIEB0otAHCjc0OYv+XIIg2THQ1kh+nYhmgoFXVanwe/TAAYU/pvWAHScfjqG?=
 =?us-ascii?Q?EpUHOwp+TKum7G7sSP9uYMb2uiH69mBiMT+nzrTv5tBm2XW+Jh2eRjgWBIoz?=
 =?us-ascii?Q?4uyCLNBiKfMarhvi5T28UE6kuaa1eRiHOU18Mrzph6wY/S2MS0Zevd2Utt7+?=
 =?us-ascii?Q?4wfcCRvpx8mk/7AEneN0ccHH7DRqICqMOErWaRLr4aE/P6qt9pnUJk4CBwOz?=
 =?us-ascii?Q?u9A4qaOr+tLZCpt1Ms/egHpCWaJDyW2KiBsdYMXXJi7GtgpdzoQxGkscksIN?=
 =?us-ascii?Q?+XvG3NBa0T+EClPAeOpRoTL8XmkYqOIsN1LSQga7toIa2sdLRtOSCpJE7p4d?=
 =?us-ascii?Q?pPnatsZ0k9CvEPW3uz8TA7ApJQ+tTMGegz23VIudDDKNc+nwgFY5QCyJPqxd?=
 =?us-ascii?Q?1gxFEO1pojbuFclLDjTIvMaKLNFY9G+9fULECbd3T6UlDqCRp/MIXGmQgG2L?=
 =?us-ascii?Q?vElZNk9GiWTetfnMTgArBh9iwOWr31UHugg9QhhVu+cJljmkD1JZQPW27CZf?=
 =?us-ascii?Q?pjWSMSvrM4leeMVytgsj75zsyhzmodt2qMWMz6xg+Vm+2fd1jbHH+BXtqjpk?=
 =?us-ascii?Q?d/YmsNLcPTlPN7uxrNAOOx73/XLotAqTHeCsfKLPH+Z7mQloxwaih90dljRb?=
 =?us-ascii?Q?8wQ8KBeYV7JxubhJNCQqVuweBW5hSfO7Nk47PBjzftpRKNPaVrOWQ8OveKZ5?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c3c3be-7679-4754-c401-08dce4bc94bd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 21:36:18.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUZ2yulejeHd3spJrIrTPIRgGYqYswqED6SR6XEoWH2a2q3W5Y65hQfpS1V37fhQYvG3NZb3RQ3mQYvY/xNy+6RjBY9h1s7NZzK9YE3cmf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-OriginatorOrg: intel.com

Alexander Graf wrote:
> On 13.09.24 02:26, Dan Williams wrote:
> > One of the points of contention for enabling runtime updates of the TDX
> > Module has been what to do about the fact that it results in
> > confidential VMs seeing surprise updates to their TCB. The general
> > concern is that there is a non-zero confidentiality regression risk for
> > updating measured TCB components. Not only the TDX Module, but
> > microcode, SEV-SNP PSP firmware, RISCV and ARM equivalents etc. The
> > degree to which the TCB is or is not compromised by an unexpected update
> > is unknowable by the kernel, but it should at least try to be
> > transparent about what it knows about TCB stability.
> 
> IMHO this looks at the problem the wrong way around. The typical flow 
> for firmware updates is:
> 
> 1) Researchers find an issue
> 2) Intel fixes it, ideally in TDX Module. Releases TDX Module update.
> 3) Infrastructure providers update TDX Module to resolve issue
> 4) Embargo lifts
> 
> If an issue impacts your confidentiality promises according to your 
> threat model, you are already affected by it after 1). You are able to 
> assess whether that is the case after 4). This patch tells you about it 
> during 3).
> 
> If your threat model really really considers hosting infrastructure as 
> malicious, 

Lets set aside "malicious host", because as you allude, why cloud host
at all in that case? Instead lets focus on "theoretical paranoid tenant"
that wants to trust but verify the TCB in the presence of updates.

More below, but I readily admit that "theoretical tenant" already raises
the "no practical benefit" objection to the proposal.

> you did not gain any benefits from learning about 3). You 
> know that something was patched. You do not know what. You do not know 
> whether anyone malicious was already aware of the issue. If you were 
> strict, you would need to consider all data past 1) in such a VM as 
> compromised. Given SEV-SNP's patch track record, I would expect security 
> relevant patches multiple times per year. If you are really paranoid 
> enough to care, notifications at point 3 will not tell you anything. 
> Instead, your conclusion would probably be "I could get compromised at 
> any point in time, so let me not expose data in the first place" which 
> means you can not run in the Cloud at all. In most risk assessments, 
> customers will typically be ok with a temporary, limited risk between 1) 
> and 3). And that means you want to optimize to shift 3) left as much as 
> possible to fix security issues as quickly as possible.
> 
> Instead, what we do by creating FUD around the patching process is to 
> create a false assumption with customers that "unpatched" == "secure" 
> while it's the exact opposite. We also encourage a shift of 3) from left 
> to right: If I only patch you after embargo lift, you can assess, so 
> it's safer, right? Not really, because you prolong the time an 
> environment is unpatched.
> 
> The crux of the problem is that - by definition - a VM can not 
> autonomously determine step 1) because what really happens here is that 
> the world around it changed. We need to ask the world. So if Intel is 
> really concerned about the update flow and notifying customers that the 
> environment they are running in is potentially insecure, Intel should 
> provide an attestation mechanism to notify them as early as reasonable; 
> probably around 3). That way, customers get the chance to learn first 
> hand that they should be running on a newer revision of TDX Module code 
> and should no longer trust the one with known vulnerabilities.
> 
> The in-VM logic suggested in this patch such as "I'll die if you patch 
> my host" or "I tell my owner that you patched me, but my owner won't be 
> able to tell anything from that info" is not going to help anyone for 
> TDX Module security patching situations.
> 
> Instead, let's start the conversation from how Intel can provide a 
> mechanism to customers to evaluate whether their system is fully 
> patched, work towards closing the gap between 1) and 3) and then build 
> whatever interfaces in Linux we need to enable customers to make use of 
> the evaluation mechanism.

I quote the above in its entirety because, "no lies detected". However,
reframe it in the perspective of paranoid  / vigilant tenant. It is
always going to be the case that a vigilant tenant can see updates
whether the kernel is polling for them or not. Also, it will almost
always be the case that the platform vendor release schedule for updates
will come at some inopportune time for the tenant, or that the CSP
update somehow races to the tenant before the notification from platform
vendor that a new update is available.

At the discovery of an issue impacting TCB1, that is potentially fixed
by TCB2, I think it is reasonable to support a tenant that wants to
pause TCB1 operations until a TCB2 audit is complete and then resume
operations. If that is reasonable then the question becomes how to
ensure periodic renewal in confidence of TCB1 and non-surprise update to
TCB2. A kernel watchdog protects against userspace hangs or exceptions
that block periodic renewal of TCB1, or otherwise confirms that an
update to TCB2 is expected and welcome.
