Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F0F3E48C
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=134.134.136.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730623; cv=fail; b=f5+er1DQouCngIYkKJn3O6MeQrlMbk1o2E09D44syxdydhHtBggIPj+lp+l8uSvfsWtmkWldcjDpLRLYIafHXHggzt1BdzvpE+OmixhMmNqrixTHoB05RkRKUPe5NRUIky1rriUSUB1tM8Z5Qsm5IhjUCeYX0hVYja2JR0/7ips=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730623; c=relaxed/simple;
	bh=bKOVxwV4DPRyyE4FgXBEHTrVDDQDvOPQ5Fp3jiUxZps=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZOHikGjZNE3fGWIp/C0uEMWeJ7AV/ubjAdPFSeTvApLvlRb42qnlA5nazWtaSAgJ9T1cDELP7u5+By8UVOM7vaADFWiSmAikKm0C0yoy25JFEbZDY2pN34coG+KNHMITvZFUrpagciOQ/68udqc4oIygC2uwnMw+lP0NMZf89HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAKgI1NF; arc=fail smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAKgI1NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706730622; x=1738266622;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bKOVxwV4DPRyyE4FgXBEHTrVDDQDvOPQ5Fp3jiUxZps=;
  b=mAKgI1NFUXKGmZ8ZF6Oqy3PrRXlDB9QyLnXA9+0BNIEd3IhD79704Ec0
   mZlpR0kvoDVBzpfRjnDYQKXN2HvEX7Ode20nUuSBKiJMDqBHFo8mD8m1J
   SJJJU8VRr9mdFQmyPcgawtpeaBIuXGs8lNZ0Q4DqTjzEv6+kcN0iClNxK
   phgwubmZnNM5w8aiday25483OiYzESilmvNEtjRFiCPiVZKOuS1Gn2eJg
   AF23nFNDzvqbaRd8qTZG8kQvTiscKsf6244insq7gNitMMR2fODZYLeif
   4rhY1aoI90MmA9p1/Flmw+lM5Vtsn8+O/prUw1r0N0KrlVz/qXpv6HUuX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394150342"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="394150342"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 11:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738196598"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="738196598"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 11:50:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 11:50:20 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 11:50:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 11:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+50Y+6tOoYxCZImRRUhMKgSGphoRTn6T03RqdJ3lqTJu3DNAAGquOBRV6RHr717Ccfi1U+zjxtS73JD5a+0tD2EdnyhBZJ1sc6+3ko8Cl+QarCI/Hm9zr/nWQgaAr/CRwJSj6fq+27mxGPjckxDjTeStIw5uwiRcYnEo6hOMAXJbkkXpwByPQ8B3T+Pjt+9eXFuyMkm0Eovr3ZiDzMgCRpi3gJycdZePKS+1lUpeOdimTEIdKwY2uF1mivjSdkviLVslgg0oFogAzZ7MqHAq6YgQf1EvwCFl8cqasgD7j0yUDm/tDFfd20ZfDd+/J8RFQHhmYs2zH8/QBrjWHk8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81lgkeF0E7hYzchbbM3FQkJprahDXqtNQbeslFQ15fc=;
 b=EyGzECEyi1Mj6UJKz/NkSeItcko2uhMV24q9q5JP3vPSBnzTq06wY7UyOtRhKv+8LNOBpKJ1+jwm/yhxJW7Kzh192890lc9bS2plgDmUnaNy1fpgf0ybGT1Ffy+bROEAZAr+O4K1geJ+V+waZmqq6LjChJfkQqL6CIsLRw8qWa+HTILvaZjyCoMwovL41MCV6MTaHigJPxEpDAjLosNBT+mPLOts0XDtrsyR7smS9QXstm3MrOmU+0DWnEtkSzGP0ryqQbvplA1/lwDFCpHBG892BTNg7rItXOnNbnzU5no63Pgqw91GpBSxGMOqGYms6Nfmqw0DzsZTsLUKEy4WAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 19:50:18 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 19:50:18 +0000
Date: Wed, 31 Jan 2024 11:50:15 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, <linux-coco@lists.linux.dev>
CC: <x86@kernel.org>, <dave.hansen@linux.intel.com>,
	<dan.j.williams@intel.com>, <dionnaglaze@google.com>,
	<dan.middleton@linux.intel.com>
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0354.namprd04.prod.outlook.com
 (2603:10b6:303:8a::29) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: edc1a2e2-8252-4b80-b1d9-08dc2295d9c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LyXWMEOiUcdVQz2XK2+PTtXps6RYjLZRNr5ckeLPHoTm5MObsPNnfFMzqSDyz/IpgCbJULvOki4bJrWuoVAGe6SydHK1gReHWWyEapuRKfAGlrn/56GYH81BTexCzZ93LbXdmdi3fbZkiZma22u7EaCWQk83Wp3X4iVjhCxMZjwfSiwmM0xw993mf7qBnWsl9TpxwEgNlEkLTa9r3UkD/Tb56UsfmPXppFTmf5BWIP+B9avlFdqZC+d+PTv7jX1o+PSv/k/kaRktn22NnzfshF1fo4hL2nNBOiOrdyvCoPpD8Avkzxl5qT+as/h+0CF7NNZf3XVyLn43VVaCNei9FJwf8pxwkyFhFtjmBDZ7EEv8bytulH6Oag1lcojkSIthm0+4San1MC3QhpGrvKh6RwBKlcIAs4OOMHZKPFJbgIihgQcBtOl2KGJlGKFQCckmMQXWHvD8wiZ1AlAMJDQkgbB0bHzMZhfBC2U1U6TGm7SjAZW5TYX9CCCbEZS5Kn21U4NvJAcDsrSdFfDZXXazEiB9xTTZ292Tb39QIP4cB/VWbUw600FjvY2ui4SnyGoiC40uIVWdZVulyl5YnrrPxlHsazXQkXJT4VLAMZG4k3Qq6SlCqfzfb0ZtVq4nWzDV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(396003)(346002)(366004)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(6512007)(9686003)(26005)(38100700002)(8676002)(4326008)(5660300002)(8936002)(6486002)(2906002)(966005)(53546011)(6506007)(316002)(66476007)(66556008)(66946007)(6666004)(478600001)(110136005)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4P/iIRL43CH9Tm5Kr+w+MGqiMjK5e6WK5l8tlB2xmYXEhfqB9dXzGNd3S1Jl?=
 =?us-ascii?Q?9f0NAdioGf54ejwagQjQgT3/NKsr1mwSXMIf4NWts8tJYDabmWR/BzaRgdGY?=
 =?us-ascii?Q?evwQf/ngaeQzIjNJ8fmJyeqsaXh8BErILY3JjhTkUu76uMzlXnLbSMxcZGsA?=
 =?us-ascii?Q?P0eZCLb9GFapmqjldBRzhHL2i7SWDBsbbAw3z2WCR9AO7VPlwyn9jqCSwE+x?=
 =?us-ascii?Q?i8IuPOW24oWtM2AXu5lVlt3izaFY49BUSEZHks5edOO6QhPLxukAMVVL8sb4?=
 =?us-ascii?Q?8fvsswmQnLqx2Dyk/+WKQ6+NlPIPNB0R4jbGKfi6kLJFyP3AnTDs3U3CW0xn?=
 =?us-ascii?Q?9AoE1D197+L2NrrIpRUpMBoiy8JJgGsI34N4RKGIAD9bITNTQMWT9LiM0XrS?=
 =?us-ascii?Q?8o7nU3cctd7CwSibVtGoBu3SPrkFanZsofmftBErxbYqS8Tw0e8EI0T1f+lN?=
 =?us-ascii?Q?tLM2S5FhTtOOiq3TPQAjlB08yeA/dyKQjWH6rgBUOS52HNawPZiLANuIotQf?=
 =?us-ascii?Q?lsUlYTY6xWt+1EuoJ5l43XXV3HfUEDZHHSw3ucZPJ8LKGLm10BHlvoHiJ04T?=
 =?us-ascii?Q?wOiYpH3+4vpsaGI2KbbVLl3nEirz3eLgfepKeZO8v25NDIho1Tqju5FTAEdA?=
 =?us-ascii?Q?poWX/XEC4AN1DzvLRwN4rfnp9dAnsEXweLVcMW6FvueGDX+rElpzEeJknqc5?=
 =?us-ascii?Q?x3tAkBYGUMwSgTB36aqmMZ2y7TZFM73GWb1BWVwRyJjNNwLOzqH9/YcxW1lW?=
 =?us-ascii?Q?DdC74GIlr+pv3iwy8iLvGRAB0bpIj3HDGFqILj/egi1gwjZtTLm3RjzLJtEk?=
 =?us-ascii?Q?qCDPcDG0FquphPD3SEClZp08AVRDdYzPL/EzMzAwSIsgZo70arw6dJ+Kfwg0?=
 =?us-ascii?Q?6VnTOFcLFk/y3SUpSSVtlAyaUr6pBxh24Oftq2XzMUZeLe0opRSmkIL+yIhl?=
 =?us-ascii?Q?fepGTnqex44oVWy7bPNkX0STusRQd305DgY0BaXYfllq4sTAsXpaTbIulzMe?=
 =?us-ascii?Q?Au/IJuo/0aHqfgnNK314bZRFttlg/KQNZoP9c8cFfqRJu5ea5oS6hpSktFm9?=
 =?us-ascii?Q?bqjhQmp91kEA0QoYUHW669MGWIgfTXppHmzg1Ksorr3wBshxaH2dU47I9eFV?=
 =?us-ascii?Q?QBZUpc2yBES10dSZOffqohNtF5QPRbCdbzs9mTuRysQlb11bH17jBMROQe3+?=
 =?us-ascii?Q?HbFTNglE8ibHpoLhOXp99a1z+06FpsChsCZ/v91fgTiXVsig4SdsQnRBPvBH?=
 =?us-ascii?Q?U2ZUrb7oq1gdQ5dY5xEl4GaWMfKfSf8JQcWmX/9+u0z7eRIoTl7Op57LRc/t?=
 =?us-ascii?Q?a0l1kK1n1PSbWi5MQr1QMlryKasLHm21RrP1AVUZStgodeDyfG6T+zsbz8yM?=
 =?us-ascii?Q?CYjk2IdkVDLVoROvEPAem/GJCIJrNSFyButtzg6WP18yrKnZkCJd8YULQYrI?=
 =?us-ascii?Q?nv5E7N4JSEFFMVDmMUC3iuEEZUMa9+DfF+VBWKbP7cM3yo6Gc6SsiGgh26Sr?=
 =?us-ascii?Q?0F5sDOKyd118r79Da5W3JMEsYY1HQe/OPwnDmJZcAGIIms41/Bh55VSfM4L4?=
 =?us-ascii?Q?e20yGNqYGKuWQoCWqlwQyhhOEfRB+r0yMbdmSfIM4tECqql1sgJcLkWlT/UQ?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edc1a2e2-8252-4b80-b1d9-08dc2295d9c0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 19:50:17.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz+6KQ8Sw/n1KXczyn/OW50/lqijkUzANCZlxE/TQLl+jMJA/IBmhBKjzZJ2F/sDhsFzJBw1g/9dkCChCmtMcZEhTyOQrLyAM8LuB3hEjVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> + Dan Middleton
> 
> Hi Boris,
> 
> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> > IOCTL based interface was the natural choice for interacting with the
> > quote generation machine at a time when there wasn't anything better.
> > Fortunately, now we have a vendor-agnostic, configfs-based one which
> > obviates the need to have the IOCTL-based interface.
> >
> > Gate the relevant code behind a Kconfig option, clearly marking it as
> > deprecated as well as introduce a runtime warning.
> >
> > Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> > ---
> 
> In the following thread, Dan Middleton raised a point about this interface
> being used for local attestation use cases.
> 
> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> 
> Currently, the configfs-based ABI does not support the local attestation use cases.

What are local attestation use cases, and what happens if Linux does not
provide a local attestation interface and standardizes on remotely
attestable as the standard?
