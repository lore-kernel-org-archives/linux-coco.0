Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C86E7E
	for <linux-coco@lists.linux.dev>; Sat, 14 Oct 2023 04:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVyNzwiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697258827; x=1728794827;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=b5BEUNW4ekMht/YtRzWXG8GrEaFJw65vbH1eBU48p9E=;
  b=YVyNzwiYgUM8w62mNviWflxtLJAAKQFkR7ssi82WAC0bQNzb+tAu7YUP
   0qZbMKExZ3MkI78a0w2l0HxBJSd5TF5Y/eCCHcDVG/8H0PY/itI2JehqL
   EBBeSrZIP/sIjRdAhJenKttbYAUTwN5vYYplavbM9GocFQd12bbzqe4UJ
   VnP8soPiPvHdpUCQ96PJQzPp0E+91QhVzpAbX2kHbeHhCluVcZ1WXeXPS
   LQeTYNMLJdyDn2BXRijcWE5mKxZbxowE+H40a2gB8e4STo+skmCLogYQd
   rwE4eyICjcSJXmHflQs9wJw8KVDvtGhPEdM7DhVasbJf/rnPvij9AmZc3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6865628"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="6865628"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 21:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898795902"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="898795902"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Oct 2023 21:45:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 21:47:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 21:47:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 21:47:03 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 21:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfDApD2sP6EIFAoJd700EfkHDc0YtmXYvhSrudxKC5xO+aZEx40N/DuL11Z1h4tghrrh/LoWhcBselXmOI2sluJOc+cQYHyjfLvau0WhnE8WquDYGn2dJdeoKFtTTXZaUeTQTjnkHi2EEHTvM8IYvFzntnMPIs9JpgNyRKcOHSe/c8SLmD9EBAVCu6jMf3CaILIX7fqHmbROhKAU2oH9ZlWZLWDklmYMP7EimQTao69bAowUNfSQI9jl3Q6Ladus04Soq3fxhEQONWwyn/QDNz55kJqvuqyK6tUtwHEF5CKuTcaD2nEso40WseLCFzEGsIGszzFKvW32SZD9O842XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiUcvZjvTKB6BJYQFiJ6Oo5+ws0zQ5QNXYVKAcziki0=;
 b=f/xgWBxXi6GkOOMjzl/mtEtjaillt645POl5ggesEL2P+fczxKlBqAee8OnLQlAJQa/PgeyUh88mm8RVdyOQLVfMGOVzEwji1MdOxHPyb0l4jv3cZgxr01ISBK980NMUbLmXgLavFTVhvodX5iFg6yppzdPClOV3U5I+zdTeW9WcieLLcPq25t9NceXyHsMvUwkmDnBMIEKZWRMdYmmF31qpL2T7vuazOrk/bu6lOgPJQCJ5hUEcKcbLOHeTYcy7CXn4JDnm4TOuLfzJpOxLn2CdnQq/XiHtiZUmP/GEUU3B4lLo7ns5mv6CuiwhwoywTTek5qZSz3CaDpde8x41Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MN2PR11MB4533.namprd11.prod.outlook.com (2603:10b6:208:264::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Sat, 14 Oct
 2023 04:46:55 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ec95:c199:551f:2d11]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ec95:c199:551f:2d11%4]) with mapi id 15.20.6863.046; Sat, 14 Oct 2023
 04:46:54 +0000
Date: Fri, 13 Oct 2023 21:46:51 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <peterz@infradead.org>,
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <652a1d3b68ca4_f879294c3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <4778317a-af55-40a6-912c-cc685cb431d9@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4778317a-af55-40a6-912c-cc685cb431d9@amd.com>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MN2PR11MB4533:EE_
X-MS-Office365-Filtering-Correlation-Id: 26760e9a-9c98-4a5b-ae2b-08dbcc7096f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p98tGZ48hpuKX/78IaHBmmlQf1nAaCd/oWAgTweaxHPbsJb8rG1Gc1B7zPvySTbelc21bpoQS+SLpVLPdrBW9TQWDY07GG1Bs7YmDQHD4LZXODLi6kviK69Tsqz0iaP2iWh+JcE+qvCP+aF8D/31ze2NqYZLfsTsgxst86NfWSSGLvP6V91qzDLdC6gWOlrgS1F++rCZ5KzFciHYkB//mL/E/DAwfo21X9a5kgljQj4HM/MXVhHQ4ZlNE1sKQ8sKEYHmu0H41o/uKDMTNikyNoBqNCb14dFTaWktl2COqlBF5IAIisgj62qaPb2cveVick11katIojASIDWiAnqyVLXCUvFhF22HnbqB6rDuOzLANjYtXShkeLySlEmo0RhzhgfflGWamEJcLUNSmxRGSTLfovZBmqlHcNB32R7M90P8EqBsLWSm8hoBxjhiFG22w8M7+5IersltgfHkxoBlni9EQPLjDxkd813oRfDY300MQDzQGUVR8o/iOQIUkAenf9BgKuNHxUlX4BUghNc8VFBJKjQvxdM00hGKSi0Gn26I4bNl1OhzCeN6mWy35PWA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(5660300002)(6486002)(2906002)(8676002)(8936002)(4326008)(26005)(86362001)(41300700001)(316002)(82960400001)(66946007)(38100700002)(66476007)(478600001)(9686003)(66556008)(6506007)(54906003)(6512007)(53546011)(6666004)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z/K/yp9Z3OFrxclXZxq+/yLQNpf8QbX13iUIaH6t2pJ3m89T1ngd7UWDKLJ9?=
 =?us-ascii?Q?4YQcOE/7woHAXxqSZE/9DETkAKgo7cLjpFproJ9NRehGmQT3sHt9c9MYYoo7?=
 =?us-ascii?Q?g3FGKvbnTyFCK+r7CxJD591MBdYKwOFjWgXC5pF1nijAHv77hp3wEma8O/jt?=
 =?us-ascii?Q?X9erN1izzooh+VcmwWUjFdvSYqT+4l/Cw80/3PafIOQbLhD1qG7Y0tIg27Ng?=
 =?us-ascii?Q?7zvRNUFoy8JRRUomZn1ROP25xO1tVpE4yINqKs453wVhuxqULX6rFk8jFI7u?=
 =?us-ascii?Q?d3FzRUGeomJmqECAGwiZpZvT+DLmkZVb0oIGLMPsHpAIzpZcbc8K/LxeiAmP?=
 =?us-ascii?Q?vLO/ShB+oRyFno1I5+6oTb1WjG+uRPAMK2YD+AotFRGlIScE0QIivufPQcy2?=
 =?us-ascii?Q?Whil4xPeUmoHUKdzVq8S7Fjm0dysdRAFH9WppXlWLcVntGe9s+YICTP0V4F3?=
 =?us-ascii?Q?55AE1B5nuBuwoCD8y49m3H4/nbyDDr4s6KRDyfgp5aXO8yPwAtGSeL4kVi77?=
 =?us-ascii?Q?EtdPKGAj1Zob9sWm6P4PuhpvWVjq5IhmcTGiWBALR0HhJk56DwBywoZWXcUa?=
 =?us-ascii?Q?IYhS4f00ETIBgWtfqtEVoP5k/UrBWcoUgRerTDSWNchNnA+6vWp59+g76Y9b?=
 =?us-ascii?Q?9pBA4X7pxa/NP6aqemmpudCcd5NE6ypuRWWAY676KrXtbyeGMkx0dKXRBX6d?=
 =?us-ascii?Q?lkCGzr54YgfqdCGB8gNFWSRhQ/JGp3vGzw2EAKifVeqD9goK4TBiVGGHyQMZ?=
 =?us-ascii?Q?s4gJnrSUbpUYrDhXpuUUEEvnd6cXyjY56upH3KIxFMSMDclrn0cjrKK5PNZo?=
 =?us-ascii?Q?JffSfvCctehLfOSKCFBVaQj4RHtyXE8pQyZf+UxohvG4vQtbwt+WN4pXXFMZ?=
 =?us-ascii?Q?as+Ncg6Ljtjn6wv8Azv5xV5sieh2XJ3/Tkn2IyOKpsNqUBFarCfxpIN/gIkr?=
 =?us-ascii?Q?0AziiX58X0oLpg0Cufj6nls9T0zHJDAQ5KZ+L1bHkF9kM4I97GMWIzEX4mSI?=
 =?us-ascii?Q?fJQ6fK450L+1kp0Hti1qO/NJVfFJ7+6wKOK0EagF3Tpz+9WxnOc+13A27IE7?=
 =?us-ascii?Q?HOcu3Qd68sseE3Ki2RWiCDh2QfBJoleGnFFNe0A0nnRaP9Bg1R/LvS1bnJq9?=
 =?us-ascii?Q?1lwLPE5mXRxj5ONGqkCRmmRKerwI3bUUM++6OTXuAm4lKKJeWl9nc1agloYb?=
 =?us-ascii?Q?j6yuOkPEJDKJNVnYEM/uFDv2JINusrO8iyhxtlM+dC1eMrJUMwqz+qQeK5BB?=
 =?us-ascii?Q?L4/3gTQyuPq36W7n1XYcKgOaDpqQ2w5tFG5GC++Eg/akK2RRUc3J/155pZPJ?=
 =?us-ascii?Q?WxM3UDPHhMPHlVLu2tntjvPcvDMoYfjIrZMvkLJ5nfTnwehWMtm72hU6xk42?=
 =?us-ascii?Q?4EsdGY/34AmZIWRd8AgqhhmFQFvzAgpsWRP7RK37UtmRAJO2lGPEyUt37uaQ?=
 =?us-ascii?Q?oeL4NUfbsCVf9/5U9E5nTVeGSaiLo6VKc/vOpyY2WdA7dblS93+vEVceyaA5?=
 =?us-ascii?Q?Yv9aubZWf10IX6FOGucehNwLOtck/8mj+lS43fRuiNantnT90r040lPHUrNV?=
 =?us-ascii?Q?XaMatg4qe4UpCanHHd1XFg6tH5TbPPKgejifZCSJeJhAiEWYHscdJnoj08Xy?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26760e9a-9c98-4a5b-ae2b-08dbcc7096f0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 04:46:54.7626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKpa8NloXy81oBGHRn/kj0GJ0sPCum582NJPrSEfTV1oK2v87qLu8slfmZbT9isT39TzDpYld3Dq+NhUsNm9ud449eaj+EvSTAiO90AXZOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4533
X-OriginatorOrg: intel.com

Tom Lendacky wrote:
> On 10/12/23 21:14, Dan Williams wrote:
> > The sevguest driver was a first mover in the confidential computing
> > space. As a first mover that afforded some leeway to build the driver
> > without concern for common infrastructure.
> > 
> > Now that sevguest is no longer a singleton [1] the common operation of
> > building and transmitting attestation report blobs can / should be made
> > common. In this model the so called "TSM-provider" implementations can
> > share a common envelope ABI even if the contents of that envelope remain
> > vendor-specific. When / if the industry agrees on an attestation record
> > format, that definition can also fit in the same ABI. In the meantime
> > the kernel's maintenance burden is reduced and collaboration on the
> > commons is increased.
> > 
> > Convert sevguest to use CONFIG_TSM_REPORTS to retrieve the data that
> > the SNP_GET_EXT_REPORT ioctl produces. An example flow follows for
> > retrieving the report blob via the TSM interface utility,
> > assuming no nonce and VMPL==2:
> > 
> >      report=/sys/kernel/config/tsm/report/report0
> >      mkdir $report
> >      echo 2 > $report/privlevel
> >      dd if=/dev/urandom bs=64 count=1 > $report/inblob
> >      hexdump -C $report/outblob # SNP report
> >      hexdump -C $report/auxblob # cert_table
> >      rmdir $report
> > 
> > Given that the platform implementation is free to return empty
> > certificate data if none is available it lets configfs-tsm be simplified
> > as it only needs to worry about wrapping SNP_GET_EXT_REPORT, and leave
> > SNP_GET_REPORT alone.
> > 
> > The old ioctls can be lazily deprecated, the main motivation of this
> > effort is to stop the proliferation of new ioctls, and to increase
> > cross-vendor collaboration.
> 
> Everything looks good.

I appreciate the help here, thank you.

> As for deprecating the ioctl(), you will probably only be able to
> deprecate the certificate related portions of it. If we ever have a
> common key derivation interface, then the complete ioctl() could be
> deprecated.

Yes, lets cross that bridge when/if another implementation develops a
derived-key retrieval facility. It feels like the unified ABI approach
there wants to be wrapped by trusted-keys. I recall James had thoughts
about that relative to vTPM, and whether vTPM supersedes this facility.
