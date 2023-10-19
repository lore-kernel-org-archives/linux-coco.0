Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2610A38C
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 01:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dymYSzUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697678955; x=1729214955;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IMDcgQ64Tk9qygJjebLf7vbnbJoUWZWen3zWNMhb8w8=;
  b=dymYSzUL8ALQ5u8E4OXAlPXjx0Jl6XJPBWNskCUwxHUE3GaXu83fqB0a
   EbxPaY50MEijenIjcPr8Qg73isZv3Ps6qy1xWPKQWh3uFTEop3WwPF5I4
   4RV/rhHAdJR/W1GOK66LNfXTp0CDPFTChHAzT1oLGqIO3GEIMOWUdFtuJ
   hOyZzWxdzDeEPNBk1SnohoMlk31TXG9csJzO9zhgoUcLTVydD1eV1hVjf
   +JK4dKX9GJ+ark2LDEIjcwoKuhhYnejREFiIFtWiphROIe6r+3N/p5Y8R
   2+UoXd3+5gh2oqpE+j2+tQJ2MsPvH7Kyzbcdapy+IaZ6SaeGzcr9JO7qK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371212554"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="371212554"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 18:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760451982"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="760451982"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 18:29:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 18:29:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 18:29:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 18:29:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 18:29:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m42HmYqi4bnGhgQAM9LA15dd0aBbXNtzZJVJw35Hz9G0bn+5iHDAjqKKM4SHpxJMyEiHHlM4k67PkW7dL/Aku7Ax1xVriFCJLfh91ye9wE9Ed/HMMi7dIskKsD38Sx3rY8zw4F+qwUWMnIzlJR5zCQJn2cH7x1BnsGegIJdpg77eIFcY4rckcopKPjZwus8SJH8n7h3D6D1YuKj/AFsQoC5vVts923ubOktvIfBmOABT8yBk1JD8RiY6z+XRIJHliUO5kHboTojeha8aIle1P00wyfvXOuH1vLcPN1t5YbtbmjyCxkOAt/7xtXasbQd4UkkyX7jq3AEBER6rxhyF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhWEclBLgK6CJUf84QOWNCDliD16AkDuYdqCW0o1ngk=;
 b=cp8eTx6jBERdBUIfgXnh9UM/vAamy/X0LfIww8TDIDjzqCDdLDpXtxYuWzBcEpWcXT5/pBIFUv46s2mZHs4YmTKkNaeb4HjUzq/QaRIHuw/P7dG2lxzcA6w96sSj+EBM+kcorGIkjHOBwVhk8OR4FkgkUZFcGVacrltW+LihCqxo/Cn9coJBaCoG2Iwz9F99m2SYP7s/Fm7GI/MvyHGYqkEJcwhGnhs/Zno08yknsDkIx6cbim82ki1frfBoIlPV15W83LS5W2D/vkBN/3FDZFwhLJtrU5q1L8T/WpGyzXZcCdXzSm0Hn/FZGu+K8XIri1nwD6tKx1ljMnhuwg1cKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 01:29:06 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 01:29:06 +0000
Date: Wed, 18 Oct 2023 18:29:01 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dionna Amalie Glaze <dionnaglaze@google.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz
	<sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
	<peterz@infradead.org>, <dave.hansen@linux.intel.com>, <bp@alien8.de>
Subject: Re: [PATCH v6 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
Message-ID: <6530865da2845_1289042943f@dwillia2-xfh.jf.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
 <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
 <652def355ef34_f8792949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <d6515cba-1751-417b-ab11-980010472aa4@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d6515cba-1751-417b-ab11-980010472aa4@amd.com>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 29732097-08f2-4222-5aed-08dbd042c7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtEHnJ165ctzAQiklOhOiWT26S3xfNS66CXmTzVpvOgFikLVx3ZGMhhoZM0rsUzPrzw2d27IqOmMooF/3Azcz1qrG9O1inXcNfMkneJQTFcqEn6Lge3/yQ64NNsXKmJqtgAEy1VuvTK8Dg0z5aJuu9ghEZMjkPM9SR8uAPSw4mFqgbd6G9ENlxzUYdjy75D4+7RwvREFTvjp9ZvaDUhJ2XKZ6RI68vNTBvPJh042fpyOLNtFOI8MREqPJOTeD6lwDcGwWv7ZhVdR0ZSM3iCJDoQ0ILlbq1kxjJSadAyiMAI6hyCVxu1voyGNdyt+loPIYj7UWOOID4UjfUqR4ndfZt24wySgq3hNXx+HXDB8tfTfbxtroQMhdcRnmrvb7r1/vLEDp/9QmzQS2K73TlE+xgbeyLT9HO88ISs8n/ENarIbT/hAaKT0TUP3bq1EAIc6cBPn01yxYGjNM+/fljXgkzwbYKkhs8yItogQw6kl8IXjOJeWKgcPvmr6mKS0oDLOWV+NNWm3AH5ZHXxbZ3U1G6kqY2zJM0yzCJrzNhE4Y0neV8SXJb/Un8ZvZ9ki3vtK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(6506007)(8936002)(316002)(6666004)(83380400001)(5660300002)(41300700001)(8676002)(4326008)(7416002)(478600001)(6486002)(2906002)(66556008)(54906003)(38100700002)(66476007)(66946007)(110136005)(82960400001)(86362001)(9686003)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wqFKtdu1WP/0zztEriosHY3Ke4msfLqWryuVcujq7AO4qg6/EgQa9zwhF1cY?=
 =?us-ascii?Q?hQCyp2UbQ2GEeT+z337F5/L+dceETZ1tlZxvxC354/W/AHMXP/Ww/dlYBQ98?=
 =?us-ascii?Q?HWFX+UX74CeCp5O0Ml3O07WBsekCHCYTp2fhvam7TN9KICGQ7MeXYddq/WSG?=
 =?us-ascii?Q?m6zKNbqgq/dfIg76Lz5JaPNbbHRPWT+pLNiPCy24vMvFgTiHGcKXvIjQLJYi?=
 =?us-ascii?Q?Vh0TAMclAVst//VhTFWQdOYlEOOqapYggzMNsIpn66CEE2L/EwiaG3/Z1syz?=
 =?us-ascii?Q?6QgHr8DDTwhJtluTvJAE+Li1nxB65lGNsTdJoq0QNZXttjnn9PA4nUPO7ZTm?=
 =?us-ascii?Q?HiUfC5098cHT9d4GX2iSP/ALVWpK4HpR2dQ6nSYHum1b9u6W3X+yjnSuE2k7?=
 =?us-ascii?Q?4qMxGU3ScgEDtD9JgT6YU8HcBtsfWTe3ZBHMSqYlXDAtV+zR6sC/0K5Cc6t9?=
 =?us-ascii?Q?EApGWmemnPAuNObGLR8icaWo+dmWl3sSmG9TZOl3DAKyMomNJSCNhlpj3yXw?=
 =?us-ascii?Q?a5EJixyTm1qMTIuFtW6fCx6zjgZMs4BU83Z8Ay1T9AXm4W+0Rgee4veO8Uv9?=
 =?us-ascii?Q?yoJ283T8rNr+etPNph0E6akjMbhIruMyoP4mCyRbRAKINwaSEAzUz4To5P4b?=
 =?us-ascii?Q?tCbThShWr5dMmArs4vGwmuOZujmpNFg11UsO890BrY7EqnAbQ2NHrvg3hp6D?=
 =?us-ascii?Q?zdNx9rkt+vjGRIY/dJMWsynSrOmRNBA8soj6MU0R1RwQ1iAxcR1VWbSCqNwn?=
 =?us-ascii?Q?GOBV9cD1QBt0nU9E/aNqktfchyK2VMrt27eEyqEoxAb54ekl60Tm5LpVlib6?=
 =?us-ascii?Q?EKRWppThTaDcVMVUirF2XGQNCG5SIAi0tXHoQ7r051epEUeft0AkA7Lae8lX?=
 =?us-ascii?Q?TxE3X/MNJqyYt4s8KTqac+mr5OgmyCoaPb1uOB5dyzf52gD6aGWFfilLSTYJ?=
 =?us-ascii?Q?M8frBer6ckFfjaupAhEYzQ+tK5aEx94q8w+fK/oTetVgCEGiuPWjscF+OVYE?=
 =?us-ascii?Q?uCSpSbyeyFjnq2kLHDqpUWs+DPJ7TgXdpAfIG40GbweBcXDGgQNoNLYp6G8R?=
 =?us-ascii?Q?rPidHAvQ52p7jZo7T5B1i/9qW4zqpEDdmbuZ9xDzZB3hnwgGlU1OA8I/RuIO?=
 =?us-ascii?Q?X+xv06OQdN1kBtnxKWwutqV9s26Bq6L0o3wq/DytruB1P9QtO++pQM4YWrMh?=
 =?us-ascii?Q?4nVLGVg+Mqw8T7insPyj0YjkvmMtaz1F9zlx8G1ZY3fB+Z8/CaaVgXoUR5RB?=
 =?us-ascii?Q?CqJQtw5KRatHheijAy8A7NeDYOyol2FlztekcIg7LSzbLkDnNhDYCYUckTso?=
 =?us-ascii?Q?NUtOABMyYqGdRlExVl3zkAfcFhUq8VOnffiT1fudJmqcNLAbclKcBUTylK8P?=
 =?us-ascii?Q?XS2SAfilut9cw40LCc0lektIvGWSmQ5lwSBtJRBVLbjwUdN06t4eNfydjq/K?=
 =?us-ascii?Q?U/NfdfPmVXrf4TjxZXOUkhyTIvArBhvSWE/ymmN8fuFZvXOCXsGXVruLb7It?=
 =?us-ascii?Q?8ZeuG6DeuTyKi5KZQ3AAkMWXUtD/MGlA8A1eNSzwMR6tYU0MoXupdMc1JamQ?=
 =?us-ascii?Q?+Iy0b6dQemuimgoh3FG0TCCgFNcDUR+xYGHbWk97hXV5SLscgW8QwGUrJctK?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29732097-08f2-4222-5aed-08dbd042c7fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 01:29:04.9861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjDGEx/62sxftDlEfpfqi9l1Qt/XdYu7LIxwlziElqDt5C0VT5u3X/GAEJqVzwB64sMVBugXcHnlk/+TpE7FLPu4QK8C+ImlcbyuqIghhhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
[..]
> > It is meant to do neither, it is only here to make it clear that
> > tsm_report_bin_extra_attrs[] is a super-set of tsm_report_bin_attrs[].
> > What I really want is sysfs-style group syntax, but configfs does not
> > have that same declaration capability.
> 
> The order is mixed now:
> 
> TSM_DEFAULT_ATTRS
> tsm_report_attrs
> TSM_DEFAULT_BIN_ATTRS
> tsm_report_bin_attrs
> tsm_report_bin_extra_attrs (*)
> tsm_report_extra_attrs  (*)
> tsm_report_item_release
> tsm_report_item_ops
> tsm_report_default_type
> tsm_report_ext_type (*)
> 
> Grouping (*) together would make the superset thing clearer imho.

I can do that.

> tsm_report_ distract too as they could be just tsm_ (as those in capital 
> letters). Either _ext_ or _extra_. I am not insisting though, just 
> whining :) Thanks,

The "tsm_report_" is deliberate as these files are all associated with
the /sys/kernel/config/tsm/report/ directory. If there was ever a
/sys/kernel/config/tsm/$other_thing a new prefix would be needed.
