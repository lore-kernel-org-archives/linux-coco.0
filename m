Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8E95697
	for <linux-coco@lists.linux.dev>; Fri, 13 Oct 2023 05:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsT9xeMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697174117; x=1728710117;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BZyxp6WuGkZODkl4uYvwFzucPUa2uYLr9RyazD4TQus=;
  b=IsT9xeMlKI4ue91Y1tuJY4nIG9QE8jGtytbWE3/lAIEkXnD83PVTdaev
   knnWGUwVkvIkrXfVx1KlftoESPnzEcrto3iSaN4GxqZgPWXBD3Z+6oQqF
   YNVQGhacFUCbyDDKxwi9lXtXnwIZsVTFP/72ixsawKGkBAZpHvw76ROWm
   hBTwSvx319IUNgpYhd+96aj7aPOBcGTT0C/mg8qej4pCFwWGLFRBs/jGm
   JzafehRJJ1FT0vEz96LIW0hONb8LG5iR2TwYjerLkSEVm2YZwWvZ9ISIU
   xqTNtJW8TDYs6Dd8ib0bWDvdLO2HR7HxE4Q/A0Qadv/2CNNmTOn6hsApV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416162300"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="416162300"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870903232"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="870903232"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Oct 2023 22:15:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 22:15:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 22:15:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 22:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzhoVxlnahGE6+GnwU4rUo/OML5UO4IUmwkt/hbEzx08QVNeOYuJNwa0DEq7I+nayMepgqRbLTCWw72MWxHkWyAXVSKUjDNVliQ0tZcbFR73/56B44EL4TtY3eOFjbCiXi3S0swm+o42yLkq25ZKDSXHRoTmTjf4adRe/9RbbDy7WylDgDkgG1n1HlJ8l0vClfLNEJH3gL3eeI7SeD9vMbLQS5uaSnE6FdFEpknUbpp65QkG9+tZq4hGcxgDc8W6AsLJCJdcIlrZaGv7qKl/Z44ejrGgGlOTdEnBKNZNFrQJFdEilIQc/qETmXqtnfMUDzy4S15MjhkaOgN8FUMFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiKyI0Hiz//LiLbGS+Yi1XABlTltIPf4IvtAHUTrHzY=;
 b=kXduy3QTeGP1cdCkEw9WZXnjpCYmpnsw9oXngxL06TVEhe1rBTOl9vnJnND75SDZMu92N71Sri9pvZ1jRGyvWKy37YgZocxxX5gW7e6pY3zl8JFoZe4XU7oZDtBw2i1V+GPV6zefi4UulktX59Qa5P0CCHDnHnetJAntxhB4WadVDGHAwUEZveeGjSjJAdU/uVIRQL9yKfbK96alZSe5QPZ23dKhuRgVd0bIdj+JPg84pRodJ7/+HmOonNEQPN2s55IyQdUx5guWON6MerqbcbNKc6Q2dOVB0JgYajn4i8qXAmvlRPY93rAFpR3J5zoEUgzwOy1nKG3v8pkT2v9IGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB7552.namprd11.prod.outlook.com (2603:10b6:510:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 05:15:14 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ec95:c199:551f:2d11]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ec95:c199:551f:2d11%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 05:15:14 +0000
Date: Thu, 12 Oct 2023 22:15:11 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz
	<sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	<peterz@infradead.org>, <dave.hansen@linux.intel.com>, <bp@alien8.de>
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
Message-ID: <6528d25ef1bc3_bfe229442@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
 <CAAH4kHYKOJcVdbEgey82aRcoaKzRi7qhHAtwG5pVNLWTwV0MGg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAAH4kHYKOJcVdbEgey82aRcoaKzRi7qhHAtwG5pVNLWTwV0MGg@mail.gmail.com>
X-ClientProxiedBy: MW4PR04CA0044.namprd04.prod.outlook.com
 (2603:10b6:303:6a::19) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: fcda2ee7-d2cc-41ef-64d5-08dbcbab6132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1I5c3I9RrizO5rx2VJ8XiJe1ld2wTR5qMv35mBLAjdFpjU7uMzrINH6gG/gk3zJoTp9zIKG+C6ttZQ0aKNnmqL8GvhfpQfWylze0SyY3oNDnqCa1BWQCMqwHRlt3s8KC7rC4sMoCC9Cr523+ktdPUOJWqIHgdifK9/UqGBAam3junUESTH592Iu6v5bXhpKXUOpIUoZkregY4Y94Hg5zNRdHWwltaR4NGP3re8D+fhKEY1YUCAkiM5txmIAmv+dkBtJhbQQtbfmUiNqb3gw/lTWD+Ya3SzDdKbyKX1hBTwYfXhkLd/cIBLn0t/5JINMRlca42b/bOfByvB6a6OgSfaAWM8s2J7i7lkf3IhB95958DGwoUNgYy17qSsmioZdWvi2DZgpul+a9y0faAxFEadSuwpryOvSOCU3nh/uFZgW1la16EY+kNr12N98CxB4GEYmC2RENUiAai6+twT6c0fabIT5tfVUk9UFLg1vznkFSgFkMq2rlU0XTZUZx66AlhLx2ArmPvQfFTvhxEMusqn293ImJzw1ZyAgNNyVWdldlmjMkaBRIlfHwX65IR3p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6506007)(83380400001)(26005)(82960400001)(38100700002)(9686003)(6512007)(7416002)(86362001)(2906002)(5660300002)(6486002)(8936002)(8676002)(6666004)(110136005)(316002)(66946007)(54906003)(66556008)(66476007)(41300700001)(4326008)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZveJicpNigHBWbw56lyhvBJsGHaQ7D/tz+0lNAO0s1eHLebAApJKeQA1SyW?=
 =?us-ascii?Q?7PodMoMTHKXoutEDzQ7EkafPk7QNKl/4IDgu9Bi8qPV4mQnHH2NzZYd6Cltt?=
 =?us-ascii?Q?PsTPBasAE6EGxW6Y9ZxLgZlUpRDYbjuYbnQloS59roygEMJmldIILmpH7t4q?=
 =?us-ascii?Q?u3pzCw8RO6KPAJOYSoEp+ojF6DqJFZfPwIiM4dur3SJFbPGE1yQY17Bbx3qg?=
 =?us-ascii?Q?nM01fJZefx3ndngYDloHU9ihIoiF9ZifBOlmlk18QLBK0k/iXpwZ+XgFrVcL?=
 =?us-ascii?Q?k1Lq381CJhdCQBNf5fviLH+bneX38MkaGTtuszwZdqVL3a8eciMVdFmIs+K4?=
 =?us-ascii?Q?PopPPNkCyCWHIAk2z2IVL1eAySior4f9IsYTP8OzeySPemZIpt2wK9fxGGg7?=
 =?us-ascii?Q?Mrx2w2XZjg8fVSaHEzV0CTuBpXoqunyzyb/NyOsKnvG93ZCol+DuS7WMKJba?=
 =?us-ascii?Q?Gd4XJHI9AoQT4fvaXOZOoD0KMLaCJhEqbU4mIjmVSADElqweFk+KA8+QuUL4?=
 =?us-ascii?Q?MzqkW6I5S8368DE3GrcjGMnEImy5/d+0wwhf8wh0RrO6G/uBVu6KBrUH087N?=
 =?us-ascii?Q?2x/bk6DMQIfWAKFEgK5pFU9YMHvowRNcTJOtpUOMF8EhtBGV+ZOezNSsTpAy?=
 =?us-ascii?Q?/EAe+Rc6m8DoIY+CV2zFk+Mt1S9/zCl6FwpEHyE6vTY4s+PIwk225EIrL7Ho?=
 =?us-ascii?Q?S5S/W4OG3rZQTZSi25MUe/yW8pyRqPBQxYiLw/Q3b6axauSA/GuVQyFZRKDZ?=
 =?us-ascii?Q?xr4PH4fPDYz+qVDBFisDwKW7UIV3OFX1nOzhkHHAJm09HF18uUmqW2bohbpH?=
 =?us-ascii?Q?WSRtWh3VuO5QuGJ0PQ2m1eUPlV6BPoNjGDFm1tErHIHqWrWhBXUN+Gib075Q?=
 =?us-ascii?Q?rinmVmFeqbSdZx/cJTQ3BLIuVsuLwOqxbIHQ3V7DxuYjlKlS2CiodLKV9h6o?=
 =?us-ascii?Q?Zi49X+vUPfDZevmj+e8HRT1U2wWCvpEPznpqwDVW12ugzU2FQqf3QEwTq0Vj?=
 =?us-ascii?Q?i6RuHYX27DIHMMhZCx43n64QaCaL5QoILNuCqKCVz33/BVeksG0C9Pf3AAar?=
 =?us-ascii?Q?4258wNCk1kaW+H1xCdcLur3tZ4rRuWQkz6CxrVCLHhvsrAQF12ZaOnqqwruZ?=
 =?us-ascii?Q?MNfbaLD0WEjrUisReivILyy/vURKWeh01vEpt5WvA/10o3obgzQ3hIbLhD1d?=
 =?us-ascii?Q?A2bz2gORIlT/UNyDGjGGNwjTcIGoaiytYSHbIspalKnfSVkZAF4hKhs7kyGc?=
 =?us-ascii?Q?A56Qtu1K3z7MmikZ7CAxHHoPyeEy/WDPmyT5ZGksmXGbkqfbqcXJwacuGKL5?=
 =?us-ascii?Q?gI4aMI7bpGWISPCuTQOPktNooSlwUYr3fzrNJGTanOvf40NiqieN+jFn8W1W?=
 =?us-ascii?Q?GsvpJDOUPhUEJs6iB4hT7z7SWY9ks+gio/PO6+n9RYs6le4AZw48+i8eI56J?=
 =?us-ascii?Q?QwyBphGqy86APO3X77b7evk8NXdd0Yar1/LX7WWgG44D7Jxl8HjfBgbRBaRI?=
 =?us-ascii?Q?9k5iA8ydh81L6yAYcQM9J38jWoiTo+OvjpnYLQXDydr7ACIutv3U/9qieQmF?=
 =?us-ascii?Q?MC3Cx+PGAbjTBzxGCLBY7ZZcP6u+vyuS6r376rlqP1HnLSAwvgIVz6uZ8jFp?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcda2ee7-d2cc-41ef-64d5-08dbcbab6132
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 05:15:13.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8X4T3vYxghhcodgJpT7NdA4jMHqklGP1jvsc/3Jwltta16e2gne1cfQRUY391U4WNPk5JDjo/hH6BcDMCRCTQIQOw8Q8grL30jQEDEUG0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7552
X-OriginatorOrg: intel.com

Dionna Amalie Glaze wrote:
> > +What:          /sys/kernel/config/tsm/report/$name/privlevel
> > +Date:          September, 2023
> > +KernelVersion: v6.7
> > +Contact:       linux-coco@lists.linux.dev
> > +Description:
> > +               (WO) Attribute is visible if a TSM implementation provider
> > +               supports the concept of attestation reports for TVMs running at
> > +               different privilege levels, like SEV-SNP "VMPL", specify the
> > +               privilege level via this attribute.  The minimum acceptable
> > +               value is conveyed via @privlevel_floor and the maximum
> > +               acceptable value is TSM_PRIVLEVEL_MAX (3).
> > +
> 
> I'm unaware of another CC technology that has different privilege
> levels at which to request an attestation, but I'd be much happier to
> see another example here.

I am also unaware of such a CC definition, but the concept seems
generally powerful that I feel (speaking only for myself) it may see
adoption. If that happens it would need to be compatible with this ABI
definition.  In the meantime this @privlevel attribute only shows up
when @provider is "sev-guest" to not clutter other implementations.

However, if another CC platform never adopts this concept then this will
be another casualty of the early stage vendor divergence of these
interfaces.  The fact that these files are called "blob" and the
Documentation points to per @provider specifications is also evidence of
that. I hope over time the @*blob files become deprecated in favor of
common files with standard formats, but that too remains to be seen.

> I take it my feedback about VLEK vs VCEK selection is going to be left
> for a future patch series? I can drop it if we can agree another WO
> attribute for that won't be met with a lot of barriers, but I think we
> may be generalizing a single data point with the privlevel and key
> selection attributes.

Apologies, I should have addressed key selection in the cover letter. In
general, yes, I think it can be handled with a follow-on patchset, and
from your description it is not clear to me that this needs to be
promoted to configfs-tsm ABI. When you say:

> This is more of a customer-wide policy or machine pool policy.

It makes me think it is amenable to be solved via other means that do
not immediately implicate configfs-tsm ABI. For example KEY_SEL==0 is
defined as:

"If VLEK is installed, sign with VLEK. Otherwise, sign with VCEK."

...so theoretically the machine pool policy could be determined by which
certificate is installed. The customer-wide policy could perhaps be a
sev-guest driver compile-time decision, it need not be something that
each invocation of report generation interface needs to be worried
about.

As for:

> ...if we can agree another WO attribute for that won't be met with a
> lot of barriers

I think peak-level barrier was when I suggested that tdx-guest not
follow the precedent of new per-vendor ioctl() ABI. If we can overcome
that then the relative angst for a KEY_SEL discussion is low.
