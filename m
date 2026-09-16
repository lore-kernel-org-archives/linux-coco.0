Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C22382299
	for <linux-coco@lists.linux.dev>; Wed, 16 Sep 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550017; cv=fail; b=HAONgMHvAI0LK5Mc2LG9uqFKGg7ZskDHh/nd3vPG36sH8OBfHMqysAfC0hd/TC6G2y77kJjYM3nTCfno0AILe43MsVrXOPYLGVJDm667dfTEtRm4x4rV6Ke/++qIcOeK7LgnKIN+tis/76zmDrncmEmBze91stMCgmNxr3cee2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550017; c=relaxed/simple;
	bh=p1N6dwz39jy1//nf5yv80PGtTmlPu06q20nynQfUIoI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Oey1AMK2ZgmWg+/X6IYc0dpZISiZel6u+vKomA8yY1EktjzTHMu5q5Rk+fxIM4bG2pSc2CYC2AQyE3hR5uZ3tosO84sTwFOcdHFBvMlY7YYUJKQKK1xHnA4+W+YGdWL8VAwkhs5JV+HMux3y/k508/dVC8wZdtNgH/8e3mYtyM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzPX2dU+; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzPX2dU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789550003; x=1821086003;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=p1N6dwz39jy1//nf5yv80PGtTmlPu06q20nynQfUIoI=;
  b=TzPX2dU+Wj1TJnaxmaG5H4iZ2Kum4wKLo2soXxqMBoWg1bBPvRJPfG63
   QxpjHGJMzZKW4Q67k6FPfwz/R7H5zVH1yuMXgt6tgWjoKFH/VuVsyRfIc
   oJXejuq7J8tB+KRcdmHJyZySeTnfwDvU9TTXJ1efr4aWhpUMF2ulNBs69
   gBvXkiznV8tLJpCFjWYfx9QJz7OmM3dei7aw3lX+aSQJYdSC+YqGjBEXq
   DjIL+dz6+x4Xw3dEOOnOovapPKRhCm48PjCad3v09f/GWmaGu2ECVI8GF
   Yv5ad6Y9Vm2/u5ezvYRJ6czQHCHVVSgM6/vywA+xmZ/1FyBulXJ5bH2FT
   w==;
X-CSE-ConnectionGUID: M+Wq1VHLSauUHGGuk2WtlA==
X-CSE-MsgGUID: LJEJYhPDSRaAoS3Hlpl+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112690772"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112690772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:13:19 -0700
X-CSE-ConnectionGUID: njkyE7g5Q62LEGnvH695Hw==
X-CSE-MsgGUID: BQhiNAoPQgKxWf63diM6Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311554109"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:13:19 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:13:18 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 02:13:18 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 02:13:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrwUwD6w81YvQZTK7kVKJ24OhQ7F32GaIho7SZc8Mfrzlh+4E1HKG7A8SeaiKhzW7el9Fl4h0WcdRIUXMtAz3eKwF/3mVRCCniKFRzyrOm8kpqTG/od84w/puSgUbvJER/aOf8TyHHdAiZFZLwjqPRypoCV2UOoomLjPfMrGwvI0mw2eSThf7mcwtbuaVXaLpFSj6ZXNr47jB7nGsOtcV6wnAUcWbFYWmqowhlYC2BeoXtIFZWiCcNgvGxZZfzMZXgl8NiHVUWtakZeo/8C02/P3uA+KnXKe7eEIxn8JbaC5owyS1GsfRCNaQVzveJVfsKPmwXiLGSyMRYELbc5nCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tzBE9GQTys0JpQ7pgBWADY9FAHH5QoxfRnswdF+/D0=;
 b=RwH9Mf4gEa2rfKkg1JklUrPdvFWu2qX+VGufa5PK2/C8bcRsUa5nqphxUicO2R2IxX1HG3Q9P+zm35Sb3oUDjLZX7pYzV+e1qv/Cv2ZXgktwe2MsuZBrkO6RK22TiTu314LX//KX6Cm/q3LkRwyJQWDNXHgiVCmOXK6DHm4om6xOuKFrqAm1GeDSGjZCVYcNKNVSXWZeXYhkW9sQSY43H9aUu87mOXRnI1UL+DVee2MEva8nYD/ynUUUov0+b1KsVUCGZlrQlO/HUuCRE45cjMw3fhfSYELe+j2kCLFWFRwg8D/RlKw3kVnsexvLQ4SrdCIvIDnfkFFo1nCqFb70zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB435924.namprd11.prod.outlook.com
 (2603:10b6:610:34a::8) by DS6PR11MB9894.namprd11.prod.outlook.com
 (2603:10b6:8:464::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 09:13:16 +0000
Received: from CH3PR11MB435924.namprd11.prod.outlook.com
 ([fe80::1696:c90e:60af:a0cd]) by CH3PR11MB435924.namprd11.prod.outlook.com
 ([fe80::1696:c90e:60af:a0cd%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 09:13:15 +0000
Date: Wed, 16 Sep 2026 02:13:11 -0700
From: Peter Fang <peter.fang@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>
CC: Xiaoyao Li <xiaoyao.li@intel.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <rick.p.edgecombe@intel.com>, <seanjc@google.com>,
	<linux-coco@lists.linux.dev>, <binbin.wu@linux.intel.com>, Michal
 =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Subject: Re: [PATCH] x86/tdx: Harden exports
Message-ID: <aqpdpxlc54DCskK9@intel.com>
References: <20260911113150.1022344-2-nik.borisov@suse.com>
 <bd287f7d-bd80-43d1-8a52-343242233b2a@intel.com>
 <ac14f791-93aa-4390-a0ed-d27687141b04@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ac14f791-93aa-4390-a0ed-d27687141b04@suse.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To CH3PR11MB435924.namprd11.prod.outlook.com
 (2603:10b6:610:34a::8)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB435924:EE_|DS6PR11MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: d0de5c28-5d40-44e5-95ee-08df13d2bdb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: JEuoAH8bg5p4HpqwCzNe45JHc5yVCfaI+n95WW2l65TUyyhNwYxXrA85QPShbLRYJnT0C70KOGa3+vj/ElFcMc4LwDH/m0QCzfIzmOCKnpX0nv57tK96qTu/SVTqW7ulGzS1urU3/CJeg9CvxJNZ5LK33edxtkvrxII7HKMdoAebBCw+/4Ozg4sRg3BKq7c0w/MsGKKlbmLAbKqyNe7T/MbWBo0E8JseDMEegXwvN1LoODHfYUT8APShwHoz3V4FGoZezyitG+notozGiyqewV9yVUOdpJnZ/9QtXs8CTUbuRVWRHe6cWucX7wEDJoX/9wr6DdCFxc9oF3RQjYYlHvzYv2LGAP5wz7MfTkSgU/eiZEpnxz1LL+8zVUsq5hFozvUXeFph1H7livJWxc/zW+19swwpwvj0CkN+4rIjPWSNdTH1SURum4ZdJDJHkD6l35ofH4gI53DjgEVkoU9TJn3HpgWOzH3TGr+xKw68y4HJnYuW6/jgPejVvuuKvBdyaDi2WKeHY3cFnSBoS09KS4AED8+rK4XzSpp4+IVaN0IWY+Frf8AdQWHJAvI9oci49ID2gIC2KNAqFnS9ctdAzawkOCSY9lW1YrTIG1CkSH2wsmmFdoQlZwcNfKLdMNoIm5GZVOP/xBZIvsW3X+UEUT+Gz9pTz8Wo48kKZl5RbGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB435924.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2SBksiRNdFUQCBhn43YRfmlWdNiNs2AKS7IhMotSxOuTxmF4wn50Zw7YR4Lg?=
 =?us-ascii?Q?lNeOfC7T9AekzLstatzFTvKsPgGNINortC8tpCZ+VCJRdJL6cP1khx/ZdeOh?=
 =?us-ascii?Q?rjF/lhBYRpC6TgzpaN5iyA8EFDEA4cJ+omi/PKphTgvH3n9Hql4RXsOurqV/?=
 =?us-ascii?Q?pMzq7fHiHBTbpK5J9dneXLwqAHUvGVhVaGci5n+sDwB2v8XEDvFlBH/qMf0k?=
 =?us-ascii?Q?tzo1FE9OhiFz3GIcDjjbuRdQozMOITHcQWDfoFvq/mTgmfrm3/h47oTJVDSL?=
 =?us-ascii?Q?Zk4ovefTZ++QjODfxFKRlDC0vQyXQcfz3wzpnbxwO0+M4b3uaDF9Rb/7lCS8?=
 =?us-ascii?Q?vhp/E7CkgHX/MSibMLugZNgD/73u96tB88ikGQZAzpzN3VAYIK/5OK3/lHVG?=
 =?us-ascii?Q?78Fjby+58Xzda+R0NWXnNx2LmN8jqnL82uLau+iToX9BRlQueFMXAU8/ruZB?=
 =?us-ascii?Q?EpqWOT5MrvqJmt88OHfFzdN1TceSQAkVPFnbKmekcB3alLEroj99wyAFCMQx?=
 =?us-ascii?Q?MzGJOPUecu76/HdJef933Z4xfYY9sWnw/lr0JkCDd4RKLc4jinRZ1CtwzGrd?=
 =?us-ascii?Q?NBSzFi2vrMCd/qM0FWRo9mgqEILJt9gd83gpNufqfYV+UjKfldR0qJahTI6I?=
 =?us-ascii?Q?p/J3+4blHFhS5DgzEXgF1gubxHJhUa/pRi3MKs/BoJWR/s07DWFzBij6c2WM?=
 =?us-ascii?Q?Vyu7TVEmOWdpczJgLo5hPH0a1neVd8kdWL+IPknT8AZu1c+4fX0nhEzKgBC1?=
 =?us-ascii?Q?0A6AriO+D0vFke9e74327AOF63ibwIahLMf7hTAdQ5GtgOtsNKu1SaktFWzO?=
 =?us-ascii?Q?Uge+15nTnPJizNuMcQ4VuhX/kp+k+G4Tfkk6uzpeutPHWf6SDKm8zUE1fdNM?=
 =?us-ascii?Q?3lYq28SQhHg3HU7KqL5yn2oVew+g1jy/7ux1raPH+Bn27vlEUYjJYoJV41ab?=
 =?us-ascii?Q?xKIEwCf9V/dTUoDS8Pvs3/saT2w2jzvL7E84ibEduByZM3KhHO73/6pseXoZ?=
 =?us-ascii?Q?8m8oiK8RWmtsosaxeXfxKD48/2e79stUxSXYJV2URg+LbchQdkN7jyaipxb1?=
 =?us-ascii?Q?L4MzW+n6z9Z+VZh8dzX2EiiyBnYmea4kH3gRNobEUpoOA3HASQpIUERoSKU6?=
 =?us-ascii?Q?EOx1kUZ0XQw7Re60Hf2OrHOCLr32at/HkQGv7AopuZ5Bcw12MlyHWoM3PYrw?=
 =?us-ascii?Q?8WbOhdbfOzeWg2xQF2BU0SGbtZYvPkWWjy2he+6/a6lWcZjIf97dnZ0f3LdV?=
 =?us-ascii?Q?JhJA3+js+xTXn3+tJTEZplz/v6INQ0MIRyn8+v6inPFcqkF+kdMC5PF/N8GD?=
 =?us-ascii?Q?80X/OhaEx52PGsu4q1OlmwHzB2kUdUIRAoQRYvddVdDO19OSEGBuRlojtuiE?=
 =?us-ascii?Q?GIZB/eKVkvrV3AEQiQBQF7LQVijWgetEQQO/uQC4hz0nLQqW7IQa4hLNvR4K?=
 =?us-ascii?Q?Nzk2uL8h8HumIxtJ3GKjsOUoqYEbgpIHDz/WEPd84dxz+JU22xf3kjnVMTD0?=
 =?us-ascii?Q?64oHWlXCFuvh6KcPqKOPdXb58HWlXZPCo3tjaS/TMpL29NAfu7pL077piFuG?=
 =?us-ascii?Q?vooZMwQvhxoL9cVYY0CnyTvQ0DPZ2s6ZtEq7prw2zNWFgg4IlPlpzPkaaH/8?=
 =?us-ascii?Q?swo48buIPkBI71KOoJZS/x8gbyPoGjxT51j7s6KyoDFE5wLibL+Dpul3vV34?=
 =?us-ascii?Q?/+tuyzJAM+MefPoYWdmyoMYzYwNlRmN3OjffD0vf2DCnLfNhyUEikHASrVFp?=
 =?us-ascii?Q?PcVluLbU1A=3D=3D?=
X-Exchange-RoutingPolicyChecked: jQuVdaALIgZXnqieK+eVkqAw424VpONWIQXojKAbsh2j+JSxw52Cx2PXFEyJn5aPrKAdFtyOnPJPDg4qE0kPqExdOaEvLiKJTYYVQZH2mXvjUVkKZYJVYP5D1UBLuHNGoVPiGTVW9DbGpIiwSLYaCqJR2gvr6n6i5mixqsUMeF2DtxWfNJujIhSipPfZZRqZLy8S4lSCIlyFghB+/RxZe59nEbG0JJ9XcJ87lrOcRh2x11ib7GN6pEqNqF/V7O8J5AK+9yi7eb8vcg59xUAhn7teqMKyi1mEcWbLa8jNkf9L9C+rXJQ2+ViUlb14mr9ZOcDUmRMHG6WOYYSzS8FtPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0de5c28-5d40-44e5-95ee-08df13d2bdb2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB435924.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 09:13:15.7455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CVesolkFsvE1mgHxLuJrm426ki1yNBYDXctGtTAqHZMKlkLI7u5BslA2eMoSwoSnR8nabj7KH1plVG5XBJI9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9894
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 05:19:36PM +0300, Nikolay Borisov wrote:
> 
> > > 
> > > diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> > > index f904a636d449..3055a76c0dfd 100644
> > > --- a/arch/x86/coco/tdx/tdx.c
> > > +++ b/arch/x86/coco/tdx/tdx.c
> > > @@ -64,7 +64,7 @@ long tdx_kvm_hypercall(unsigned int nr, unsigned long p1, unsigned long p2,
> > >   	return __tdx_hypercall(&args);
> > >   }
> > > -EXPORT_SYMBOL_GPL(tdx_kvm_hypercall);
> > > +EXPORT_SYMBOL_FOR_KVM(tdx_kvm_hypercall);
> > 
> > tdx_kvm_hypecall() is used by kvm_hypercall{0,1,2,3,4}, which are not used by
> > KVM modules, but used by guest kernel code when running as a KVM guest.
> > 
> > It seems the reason we need to export is kvm_arch_ptp_init() calls
> > kvm_hypercall2() and kvm_arch_ptp_init() can be called by guest-side PTP module.
> 
> 
> So what do you suggest the correct export is?

I agree with Xiaoyao here - EXPORT_SYMBOL_FOR_KVM() isn't the right fit.
And the tricky part is that a lot of it is used by arch/x86/kernel/kvm.c
(e.g. kvm_kick_cpu()), which can't be built as a kernel module.

EXPORT_SYMBOL_FOR_MODULES(tdx_kvm_hypercall, "ptp_kvm") probably will
get you to build, but I think this would be going in a wrong direction.

So... Probably leave it as is?

The remaining EXPORT_SYMBOL_FOR_MODULES(..., "tdx-guest") changes look
good to me though.

> 
> > 
> > >   #endif
> > >   /*
> > > @@ -139,7 +139,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
> > >   	return 0;
> > >   }
> > > -EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
> > > +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_get_report0, "tdx-guest");
> > >   /**
> > >    * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
> > > @@ -175,7 +175,7 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data)
> > >   	return 0;
> > >   }
> > > -EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
> > > +EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-guest");
> > >   /**
> > >    * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
> > > @@ -196,7 +196,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
> > >   	/* Since buf is a shared memory, set the shared (decrypted) bits */
> > >   	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size, 0, 0);
> > >   }
> > > -EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
> > > +EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
> > >   static void __noreturn tdx_panic(const char *msg)
> > >   {
> > 
> 
