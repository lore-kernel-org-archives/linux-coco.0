Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B471A9FB0
	for <linux-coco@lists.linux.dev>; Tue,  2 Dec 2025 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764659023; cv=fail; b=OO+fB/FaqPUwLcAi+hKUrREYNmZwPV7k+4BfZJ/Iu456Vzge5I9mUl11ziHRBousO7MBvAV8SRDS7TJqAPFbBIQ1sFD9H8WGQHCYFun1M5Y+tnOBMAyut8lPmXWB47ckNSCtsTqlPlNMt3dqQfUpMuK5elM7PF29BHzU3d+TGMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764659023; c=relaxed/simple;
	bh=DOXC3R9l7IaydBhKnSnygqq3WBjT6dnOsWUD8T0XBh8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XcRN/U0JoJb2BRDLQTfHN2GzVmAX+n30NWi3ILblGYXx6MzBcTheQ3fEK/PN/d9nrUukVeVznZmce76pqtwjwm+eZayo4MP5+sQLzX8f45jaUF5z5fw653AMuKoFerGJ22t1zUuQm54pAWHutEylW/cFN8OyXRgiAyXggzUAqzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N92G2d26; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N92G2d26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764659022; x=1796195022;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DOXC3R9l7IaydBhKnSnygqq3WBjT6dnOsWUD8T0XBh8=;
  b=N92G2d26y2PnR075D6zJ2H4ByAD4HktqsZSFT1EtuoAhGnNqcVY8kS68
   URxYkbl+pgkNz3SH3pjoXKfVuFW6E4nhUJGA6jzyOBVGV6zc/BsU24wpc
   clmZNORBWfpujTqAEA/DXKIPkMlPUarbhC2FuIJlR1zuJ3OkpPVbzttoZ
   8q/VZeCc3RwmEpHnJDujHwd74+xZSLMMHwYBasizlibOAmLP0+sBsFb7e
   NehX5kPrW84r7x0Z1hOCroTCnu3Ti3nQFnD3aE/UlycXgVYpc2M6cpbao
   l60rW8IJ0PqHZfial9SQJS3830FYaBhYYUCjnh8GRA2en1EfcJkQkYBSg
   g==;
X-CSE-ConnectionGUID: 4NXQf9dPSpyZ3Z6ofr3jlA==
X-CSE-MsgGUID: aDdloCIwS/KG0R5pJrppLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92094763"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="92094763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:03:41 -0800
X-CSE-ConnectionGUID: 3KOwLjrAQbKnLcimf0vZyQ==
X-CSE-MsgGUID: t4thuOaxRFOlINaVbNXi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="193591441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:03:40 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:03:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:03:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:03:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJadY2mIoo54SPMpdDj6QHFCfodS6mzuzTqIwz+uT23TB449ysyAmbLnpZyxY+3pcUVCcbV2S7eBYIHmMzPBaRlTA3knIxriJLggg4I2pi4jbZuZYBLyEYtRxFyYeQ28daPsT1r7uZkFFsK69T79vGDFrg6lGP67wEoweRwzrIilJpUG3jUnVyuapaK+9M13ruRexxco4b0nA6KZkYT4vYbLPOxvvRC0DvEPldu0TXGewviittKIyKSRJToWI47N4tQ+95FULohVQF1g0efXDWcVD4+CN9Vb8wSBrDcYFtT+qra3r3kpwGxRqY0H3zm4owQ7Y0UhB+KXPo3Y3Jg9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ2wDyC0JW6ylcjSnG+ZOGnqTW5Wv4grYV+b274kKZ4=;
 b=nvGX+5s9aCAthl970DrmH9WHJaY7ZUOnm85y5wR9FtZOxa5kLnJ+uvdus2X89yYYwRf+wImAcdRMpooUOQyIGAMowDFXlLSAIFqzpWOiRBhLjCfHV8Ktoj9RHQ53DHlWR6tWEEg929ULu6I6qEcfruj4RbpWKxtOHGcAzEWfr5b73RyLc0eiSNGZXSPJKDsJNS6TvVt0T5CkZKh0TQf/1LkrDY1e72V6sLLkfQIx/RrLIGLL+3VDY5o7cS+dwzrYXxZJh0h3U/e99xbuM8xPB5BIpgyrkCqz6RSQvaauYRn4kSvy9jbET0i64OYbLkCKtYTXyjApN6KtPmNHiyl+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:03:37 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:03:36 +0000
Date: Tue, 2 Dec 2025 15:03:23 +0800
From: Chao Gao <chao.gao@intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: Re: [PATCH v2 11/21] x86/virt/seamldr: Allocate and populate a
 module update request
Message-ID: <aS6POwWg4C7sPwsn@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-12-chao.gao@intel.com>
 <a8073390-b952-43a1-8e63-18c2a10bb721@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8073390-b952-43a1-8e63-18c2a10bb721@linux.intel.com>
X-ClientProxiedBy: KU2P306CA0037.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3c::19) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|SN7PR11MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3968ac-72de-4173-e6c0-08de3170ea0d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KvZmxem3nKjC3ahnNgU2DiyleIC3pCtcXN7Gtuj2St66fvK1ZTiCpiMfNy?=
 =?iso-8859-1?Q?+SzZLAWsxsXpz0D+brYoICp9WtuQXVqReW5qee7UN1wanqeZJpl5pBga0x?=
 =?iso-8859-1?Q?PdwSJsT+w1Fgl5mAbpyzAg6yK1oR8qs8RRdiNsYcdM3RP/pKGLGDpMj6lp?=
 =?iso-8859-1?Q?IAWh6yHdZk5ISKMp5pB48T4tTYyHOSTpdy4uBO40vFDQILg5i660Yfat9y?=
 =?iso-8859-1?Q?0E86jexzhE+XQ+a6V2jQ6M/RY7xQZ5+0A3NU6h6nK6jZY72WOKwCpyxc1v?=
 =?iso-8859-1?Q?29MX1ZQhcolGTF1bymtjBfLTE8g8QAb2WeQZsELPvPYYBuYh4XYFFrLGgJ?=
 =?iso-8859-1?Q?gq/UXFiQpdu4TsacbqtqqN4DayKNMlMfHvn8e4VwTZW8gBNyHy0m7FSp7/?=
 =?iso-8859-1?Q?1MzzBgmos6+ZLjePsMSID4T3l485zJEWjxWNmZ/4mn+X8+KvB8Yql2gxpg?=
 =?iso-8859-1?Q?q2yqPb2t8UmMydo3kzI/PBBDKcky54Ibt7tRxNPpZ7PVsAqe7b+27Cwr4C?=
 =?iso-8859-1?Q?hpmIun74eBy6DcPvnZuZj7vuI3pUntD5szfyqPINLZVJgu/5wIGY8FK/we?=
 =?iso-8859-1?Q?qjiNeTkVUjmgtWcABM/gHFfXaOFmm8n8nxVLBZjSZ31JAycr848HO/9vwU?=
 =?iso-8859-1?Q?NHqCH16Rek7zXEFHcOds3Z6FtapWIpUSG4ViMnMOG0GqYhxayRzwISRfm/?=
 =?iso-8859-1?Q?fjdaR2gdcQ0AGkFsiqTWLfeP3vQBinyhmwUST7q7CYzo1pZAgx43cRqUxp?=
 =?iso-8859-1?Q?HWL33fIEwwvVXx6JpC/evjyQxs8BGJWZqjOgegj44txGj/gHGqg8K8fp/g?=
 =?iso-8859-1?Q?GMMHbwBm9OJ5mrB8f+bLX7fmotWOvKA4hiwL5kGB8vyN3TY8I4an6FMrDt?=
 =?iso-8859-1?Q?kXRARuTdWx4wUKSogBtFFpmWjX2O4DjgCIvqSfB37z51AB6wiwhyZfCsJ7?=
 =?iso-8859-1?Q?ux0VVWNhglYeFoIUMj+O+6PoLodkAcAuN1cVO/hpm9LLD0I2wh2EVpwX8q?=
 =?iso-8859-1?Q?sCMMXQvkS6PaVofaOk38HMybGaAijMwhaT3Be4c6vC9/Gx+mzk3A9/7+VJ?=
 =?iso-8859-1?Q?wUJnHkhYoWndcJQ+cnCxaTFxJY+3GmzUoAgXIuv2A9IvVS6eoSUqRl/fcb?=
 =?iso-8859-1?Q?PdH3q2n9RxMyyRk4SrM8LQ8BEI0pcZxqnFBwxBqndqFY0wZU3QSdeBIMi8?=
 =?iso-8859-1?Q?OMZXRXO4k7J2sW3XgbNj64IC8CRiOpBIc7f4AuB+UBogWhkMxJoB8fWv14?=
 =?iso-8859-1?Q?wQkJswgz68E0//nt7XgdQhHQsXCbs1Nq+9w3vOVufA5YFcH1Ky3T1QfdQM?=
 =?iso-8859-1?Q?Ny7R1JyNgDIfxVS0JWkIp8b7IS/bC6cXZRjBPzV+zygnAxs7s7oWQcxSE2?=
 =?iso-8859-1?Q?pRaC7ZRS8nkS2yi0sthAg5HuObIBmqeKmo93x0UvLUwDApC5vSb0tpDWf4?=
 =?iso-8859-1?Q?H1vUDyXISXV6XWLrKrEgzEigBvgkDV6I9iCQzVj8dvI6Y6ixtW1nmqa9K/?=
 =?iso-8859-1?Q?4lzBCAznStb+ONWcfdATCj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?C5PrRYIweDqxLOAmUNnswqN+yF2HDmZHRRjeyrABNMgsR8aXuhopLbNHi8?=
 =?iso-8859-1?Q?4nsYdkK/sbt7q4BJJTu0ijmHJiaTNSBDaU5ZsZeZEb7u1FT+z5RStYOBbz?=
 =?iso-8859-1?Q?78QV4yc2fGeKliT8p9jnAWRTT8HCte8mOkCHEcVjiRGMTGzHpqeXPOgt2c?=
 =?iso-8859-1?Q?M5uP+KEpK7dRnjgfSZoZrY4DNZJOwMpfCqKICz3OswbUPgFUbBBgJ0/gvK?=
 =?iso-8859-1?Q?6VKL+q5IuuB0L5AoE9H3ksuv32+Xsmmnu4oVTxGLqUe7Dgd3cXct3QMSRR?=
 =?iso-8859-1?Q?2rMCzlBc5QIYIoopN2sTG/myt315dh+QGLhj05My/pfUHjuLm/sTx1ejBG?=
 =?iso-8859-1?Q?srPGXTdRBqwZVxkvCSTqljtAISBoL3Uz/B9KwNg3Ybr7XC04LUC+bVcnT6?=
 =?iso-8859-1?Q?nghidQp9hJ2k5lisDdiVQfp5DQnbLldN9cOJ3HHhYMYQsyLRPG3vyLL7Cc?=
 =?iso-8859-1?Q?h3UIZPVJKPXBsnb54ZQlArWex1stXKVO9lKSMZqwG8X7VH68SIAPO8F6/7?=
 =?iso-8859-1?Q?NdVNc2DJnqgkv5RBFrCcNc/dF6WkS5+NXsArFd8bX7Dhm8dNeyaSU4fSpv?=
 =?iso-8859-1?Q?JMhXs5kQKZuoslDtiuWZ/3cM4YlFiiGCZELSoJQz7MuZzr6kujMI+JoVA0?=
 =?iso-8859-1?Q?poIkAQwwFya39TRhv7XJ2dmh1Ta/rZiTusD0Pg0gSm/yyeImHFk5U9FTV7?=
 =?iso-8859-1?Q?Hl5fXeZ7styYT7iEZd31MS3ZVnMaOZJPX7FdrQl37SxDahSmrvtzXOqgiR?=
 =?iso-8859-1?Q?+PCgdqSXRp5LLRiVTwjlxjrl90On6iDJomQOzuo1DminSgWt7eADlVs9h6?=
 =?iso-8859-1?Q?woKeycYCSnFBGcjAMooQQk17a4i7BihAh0Gmf4CPYySrvJSJLm8VRDAxxs?=
 =?iso-8859-1?Q?tPx4JSagIo1ceB8REXMQ3R0lNQLSxWgsCLYF5oHcf8y8sqoHwonzWkFMAU?=
 =?iso-8859-1?Q?b0RklGtN0Q34rQe1WQ3N4VU1ovsmWTxhetUPx2saFWHuEu+PczgBZC/Odg?=
 =?iso-8859-1?Q?D9nPZJ95znMI/K2mWvpNEXCrwIHoxSnHE9flpAUPwmM502JCby4loIM+Qs?=
 =?iso-8859-1?Q?2LQh8WYhf27yjXh9C9nYNDznQYLf9UOeedw92SYa8HTgOCddE+1D8sF6Jj?=
 =?iso-8859-1?Q?WJtnm/yKlZkcY5BlEWvw+Y6gB11DOPsvxuUJi1WVpjAfiOPYCmxfzWAr0p?=
 =?iso-8859-1?Q?zz6eYQucMWTQpWRsswlkxy5JSADnwiwugNHaHOzNlPGJM1f9IR4F5RPRgU?=
 =?iso-8859-1?Q?CMbAagbBWai0g3io6Lr9HKOCyY/bge3RS1/TG7UkvtuVkcI5FrvuYE+oU+?=
 =?iso-8859-1?Q?E4O65XaI2jnFWFHF/OQxWoyFPQpZPJ00bzC5oQsAvIaJMTui3RkFlHx0rc?=
 =?iso-8859-1?Q?5sb2R/ZjKwDPTajd3HrJAYl8kd1Xlqkmw3eOkmES0XDonkptslnnZLEzJY?=
 =?iso-8859-1?Q?Q7s3oE+BbVyaewHT4fJzDSY9VsyLG+ebjzvPZYx2H+slPn7HxeA3rs8rkb?=
 =?iso-8859-1?Q?tA8aT/mEjT7DDMFXrB126mjDwsMnmfbZLW2ynDxK5RF+SBF+Uxc9+CG98v?=
 =?iso-8859-1?Q?JfILHRmOqTB5vUzrljbTmk77DAdLYZmTbIr/kX36HCVURySE85jwlismLQ?=
 =?iso-8859-1?Q?75KgmXKPrx1qDIr7VXFvQ0T06BC3sxwKqU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3968ac-72de-4173-e6c0-08de3170ea0d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:03:36.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLFg5D3NP0kstIK6TOvxHnah0s8oPLo5I5wyxw7hrFhP6kyleMHYZwDmcBDM3HDwIThno6KRnAOLGjwugj/4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7017
X-OriginatorOrg: intel.com

On Thu, Nov 27, 2025 at 04:30:41PM +0800, Binbin Wu wrote:
>
>
>On 10/1/2025 10:52 AM, Chao Gao wrote:
>[...]
>> +
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
>According to the link [2] you provided above, it seems that the layout of
>tdx_blob as following:
>tdx_blob
>|- u16      version
>|- u16      checksum
>|- u32      offset_of_module  --------------------------------------|
>|- u8       signature[8]  |
>|- u32      len                                     8KB + (N * 4KB) |
>|- u32      resv1 |
>|- u64      resv2[509]  |
>|- u8       data[]  |
>            |- _u64 sigstruct[256]   //2KB sigstruct  |
>            |- _u64 reserved2[256]  |
>            |- _u64 reserved3[N*512] //4KB aligned, optional, N >=0  |
>            |- _u8  module[]  //<-----------------------------|
>
>If N is not 0 for reserved3, then the sig_size passed will not be 4KB.

The "reserved3[N*512]" is there for future extension.

The current P-SEAMLDR ABI only supports one 4KB page, so if a blob's sig_size
is larger, the kernel has to reject it. The P-SEAMLDR ABI should be extended
first, and then we can add kernel support accordingly.

>
>
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	params = (struct seamldr_params *)get_zeroed_page(GFP_KERNEL);
>> +	if (!params)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	params->scenario = SEAMLDR_SCENARIO_UPDATE;
>> +	params->sigstruct_pa = (vmalloc_to_pfn(sig) << PAGE_SHIFT) +
>> +			       ((unsigned long)sig & ~PAGE_MASK);
>
>Since sig is 4KB aligned, is ((unsigned long)sig & ~PAGE_MASK) needed?

This is done intentionally. Otherwise, we would need to assume PAGE_SIZE is
4KB. Although this is true for x86, just in case it changes in the future and
subtly breaks this code, I use SZ_4K and apply PAGE_MASK here.

<snip>

>> +static struct seamldr_params *init_seamldr_params(const u8 *data, u32 size)
>> +{
>> +	const struct tdx_blob *blob = (const void *)data;
>> +	int module_size, sig_size;
>> +	const void *sig, *module;
>> +
>> +	if (blob->version != 0x100) {
>> +		pr_err("unsupported blob version: %u\n", blob->version);
>
>Based on the link [2], 0x100 stands for version 1.0, Using hexadecimal seems
>more readable.

Makes sense. Will do.
