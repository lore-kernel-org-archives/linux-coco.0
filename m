Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199040BEF
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=134.134.136.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732596; cv=fail; b=X5xIuP4TtC3TCnx/qhHEcBDjsrbxYXJZnOcHj0guEAC6Dg3TvQP64m1Gob1RKCekMK5Wjl9hP2NSll0y0LmUco9/tzBn13JbeBA1UuzEBcE+fyjRXfmxN+U2eIyBzQIoR1UXMaO3ezkeF92+bQykJlKmp9woIXVqX5PnhfiqNpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732596; c=relaxed/simple;
	bh=5oP+NTkkVBCKfsVYuLSd40eyGt6MIgDTeLtZSgodU+c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fUwN+u5rzw/y5UqAj47Qcd06KQLLdTA2EQUjp7Lx8HZzgjoTKAWbQ3jxhzQ/Sr4ALhmSt56FM/1Y0bPhiwpfJtzzpxeqCmjENf96WQJbTjSvaHxyFlGTss4mL80Mo8rHIHbycTVx9KzQbemcJusKplunf0JsmWVVZ+EBekun56g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nfykf37m; arc=fail smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nfykf37m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706732594; x=1738268594;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5oP+NTkkVBCKfsVYuLSd40eyGt6MIgDTeLtZSgodU+c=;
  b=Nfykf37mIs1vllp79ZDYAuRzb3wweeIuXRyIN3EgK+xpai/vJMjvpNen
   vb/pNrvIpZ/X23MO2GoLDQB+qvwQWfnA5Nom8/fsa0r1pepwFI951nP1i
   sp/lwEeTQoyhwxg09SQNk5sT4BtE+uNeO+XlRGFfipG2Tsv4tFdFI2Lzc
   6/PXSbJIxK3aijII+wCnpsamzE1ll90ebiAJykRI0XgclarHvJdh8HhL9
   F1NetgswAOZ6u+BRQdiaPL1cUnJr7r8pOC2ERbcodYx09jiWisVej9Vfq
   lDs3OPj151enVvPIM2s3+E4FR/aLkzFvnyaNqkrWeZsePAWXAQaWaWFmk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394158783"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="394158783"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 12:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="22893183"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 12:23:13 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 12:23:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 12:23:12 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 12:23:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBrWAQEIu6oR1gvY+mnd9AXcd2Hx/4WPptbTn4EJrp154/YqRVkuo8ZPk6IJyFR9WdmhTVjfrgkLSbjWRiV54mBBnIrPPLXyo0Xc1lVs6QznLy7JOcLDloTNQwB0lll59tunV2jnxL642v6+HAG4/aOKkREcLH2vbJ1gxFslxiIr+CYIBu/+zfcvLimMTPc+kZJVEBeOv85wEWyuMTakP4RwnEObiCLdJF+0VYrycxT3uAkBSDTPb90DGMrr1tQ0O7C4yV/ktdZLakAGnBtdLZ6qntd6QIyGiiytfulQbvE4FqRkzmBr2Y+6EDc4ODEYq6s1ucYANrNTFJZyIJxBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5etlZ8YZVc5c8K0rSwtDqb8OxNDLICl1L6m9DG9E6g=;
 b=Dknm5F16faBSJkq7EOJjAB/ClW/g9LGDe8y7v4rsqu6BCkLzKkOo1AM0JGsMf1Nmum4eRPlb70x6ykUUaBmmID5vDZ6UyIpMcxtF+5Svbhl90oIgYu0eMPWYZEXsF8YFQFziyGnDLBHO+yGhW8Rzo8kN1gieNwa6lR4k0xkA5SSIaJAT6esiPU+0Z+zbA70yDGI3Fu6lV31AQbcXPK7I8zJR5gC9aTEQgMleuhX09my2+NdDZcyjqmWOTvXTSS/1sS+vYhmpeRc6VnbaTm4lOX/PG91S1ZsnKYpTC27Nh/E6kWF9xsjVxCC8pVc49XX63JLC0IRTWRc+zVPMI/hFhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 20:23:10 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 20:23:10 +0000
Date: Wed, 31 Jan 2024 12:23:07 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, <linux-coco@lists.linux.dev>
CC: <x86@kernel.org>, <dave.hansen@linux.intel.com>,
	<dan.j.williams@intel.com>, <dionnaglaze@google.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>
Subject: RE: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65baac2b79c90_37ad294e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240124093858.1818497-1-nik.borisov@suse.com>
X-ClientProxiedBy: MW4PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:303:b4::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 9091ef29-56d6-46f2-82ea-08dc229a7120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NTos/jDrt28bj5c34sY1WHCERYqQCqtEAyTeICy2zM7gZYEFc/P3ywwAa+ZCeDdL9jOs/UKg/Flq63qZZpaYRAaRqiDkwbf0ALwaIbydhZl6JDyx95FHr5BUmKECHw/b4ssGQxg1Bpb5VvrgHVeov2xEl0NOGHEUce5Gp91n+aYPshjGfMvzQ1GShjTOtc8aLXklJB5F21gWTZwhJhfpc629T0I94oy1rtNi0pM0Ho4aSImk4y3qziWXlb5L2X8/N2t/med4aQxMksWur4C5581AqxG/6aRszbLykucZ3GYCAlKRqGP8wMFJ+djnf/28+yHaD2R6eul7De9l5oo9htl192wsLIlH2p5oW7jOoeFXu8GpO4qU9ePC/ZZd95b6k9hOJ4zvB8/2/+3ga7y7FiPncS0bxQKfA5NXWkHMlCIbmV3AaZbZ/TTh0KFsiJcRqvwgUtkiKUiNj55tLJJ9pxhHW3gHlL9KWdSX3kuwvcFB6l0vhIZhaepZswwLJeTwtr9SFHoKX2tXQotcWJWwmbzeaoytS3G7Wpdqg/roBZ1B0N+kFMoclRQUUYgZU2z9CxTP5JnKJTsRiGgoguEmkYmWb5lw6hXl2p4jRyha6L1Cti2g5CPomfnbQbouCKgw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(5660300002)(2906002)(41300700001)(6666004)(6512007)(9686003)(6506007)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(83380400001)(86362001)(26005)(8676002)(4326008)(8936002)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHbGPc4aabnad940r2fctIYXmB7Q83bfNrLxPhYNLK4+h+rfBX+7lRtynw77?=
 =?us-ascii?Q?VEK2zjz4gozJvU18cyAwvq4Y0Tua1B7dq367v7X5r1xaf7yieW2mevv4VJUh?=
 =?us-ascii?Q?GSn2UpbkWydDG3iASr1gIYqFIeOoUHjamH2arOfirP6iYCvvduUuAWYCjUzt?=
 =?us-ascii?Q?yRxcSwxbykx8DruGmr4wZdxoUlPXBU6dy/clCmGy99AA3sxTvFdSHOoNStCw?=
 =?us-ascii?Q?4W2Zi2TRgkNodNQPvVlktDcVSALvtqjEDBakUyYdC5vJAd/7Memk0G4goaG3?=
 =?us-ascii?Q?N2k3jzaaOcGbohH2VvOxDQDZ1AXS8i4QKfV4LNDE1b1QcECqqofNQQSGXEqE?=
 =?us-ascii?Q?a066Yje6vraeuOmrAJ2aFUeHKAhmC+R9Kue4gZEsSwDHA5vL+lC+WZEURVCr?=
 =?us-ascii?Q?l/FNAKB7NzBisPKFMlkjPrQCK6VPnaIa4F3gvwlL/cfGfJcYTJhm7ARUaT1X?=
 =?us-ascii?Q?egZRzId94s760tV9NDPkdyqej3KrDLHH594+9V2Cty5cGuWDtaymWUAuYcnO?=
 =?us-ascii?Q?bTB5AwZeKCdfMCF/gTdLR4MC+MlZaKbV+NMdsFr9b3e3U/yvjR4OBWhtCO0C?=
 =?us-ascii?Q?EDxOZWe6KaUrBiKG3UhiVGm2VsnbPQX/f7LUgiWsepcCywjSGUPAjwvYeGUo?=
 =?us-ascii?Q?cmav0XTCFKhVi4bfWmm2nPiNDn7n+WJhyq8c6GiUWV76h9tC9JoggzL5j2rQ?=
 =?us-ascii?Q?gaWSuY24KQH3mLWgIaoFDks+tIt0OgqchmNSDKLbKZc2NEBuL98b75kY719J?=
 =?us-ascii?Q?jRbddpUvF+2QB83wT0nVY2Pe8R/ZRQYOEuh8AHi/HI41YZzNRDN+8FYzFXYE?=
 =?us-ascii?Q?sqEIWpzXkeHydSOGj/xRQ5B3XVuuy9WyjkwC8Q4KxHzryeeJNR4uhtrG6C7Q?=
 =?us-ascii?Q?KQzc5uxBhWAI8Z3FBLDVyPKCjEPlI8LaBU02emw8wWyU9YRMgSIDKkpzDADL?=
 =?us-ascii?Q?L7Rt3k9iznBCdqPETlgUEpBsJL2BniBRl4QNsBLzOVHk9DH8fnGqOZ6bBGGo?=
 =?us-ascii?Q?JUsZDRQYqzyb+pnwF+iD71az8IyOLLiJjzGiqlOmnFKTv6crDu/Afhex3Fwm?=
 =?us-ascii?Q?HjUk6GpdLrk20w2/6yxAlx8HKwX1+GC1WypL34Xjpnn/l+LX6JrcbQwyFhaY?=
 =?us-ascii?Q?Qk8tD6MYyRmqqut1BYJwBJct69i/LxrB1300S042DEuNKjB1SIf6iA/THJFA?=
 =?us-ascii?Q?OY1JzqqDQE6MpKIK9NqK0ByMdSCmOU4rbtoNSxC+EWaFGHTTU72B4MkSzv2/?=
 =?us-ascii?Q?QlH/ixKLCFIQWz1wCorY1nKhZDdqEeYiyjZM1OtSo6IigwWBK6avmaCvc+EQ?=
 =?us-ascii?Q?b7tsFIrrSpfdM/JkBfyNUPvYhUKtJmk5yndeCGlA3tpiLGEioBJ40vQXsORN?=
 =?us-ascii?Q?hlQxliO1eIGSo45XZUSH/e9+RGMj3ALBpymYnojXyaNypCAJpZswqRPl45N+?=
 =?us-ascii?Q?ygXlLnK96t26HlIv54E7CetfiQIO6f0JYv6anxIrPk7MF7V675amah59vQiI?=
 =?us-ascii?Q?z/iIOyrQB6S80DGuvk1jZsW/cSOfWNf+0QQlVo9Ww0crWwNYeJ0M/LI20lWu?=
 =?us-ascii?Q?x3eLqcDGP3l4YeR6P7QgLOI+G1wgUs6GuCwo6Nb+3LJtJjTszbwSlK/+pT32?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9091ef29-56d6-46f2-82ea-08dc229a7120
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 20:23:09.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EUKALNX6ltDcGrMetcsrCssUNwtkS8hOpdPdokppPXz62CV/wpvawQaB8/hDyHooi9iUDhQSRDd6OzwKtTlY6LOy1mhBqO9E+jOKkh1YKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
X-OriginatorOrg: intel.com

Nikolay Borisov wrote:
> IOCTL based interface was the natural choice for interacting with the
> quote generation machine at a time when there wasn't anything better.

That's not quite how I would phrase it. Perhaps just quote configfs-tsm
changelog? Something like:

---
"The commit that added configfs-tsm noted that the concept of
attestation reports is '...common across TSMs, but the implementations
are unfortunately vendor specific. While the industry grapples with a
common definition of this attestation format [1], Linux need not make
this problem worse by defining a new ABI per TSM that wants to perform a
similar operation. The current momentum has been to invent new ioctl-ABI
per TSM per function which at best is an abdication of the kernel's
responsibility to make common infrastructure concepts share common
ABI.'

While the SEV-SNP implementation exposed remotely verifiable reports
from day1 the TDX implementation started with a locally verifiable
report retrieved over ioctl, but adopted configs-tsm for conveying its
remotely verifiable report"
---

Then there needs to be a discussion here to describe who is still using
the local attestation reports, what their migration path is (if one is
needed), and some indication how does a distribution vendor know when
those users have migrated or dropped their interest.

> Fortunately, now we have a vendor-agnostic, configfs-based one which
> obviates the need to have the IOCTL-based interface.
> 
> Gate the relevant code behind a Kconfig option, clearly marking it as
> deprecated as well as introduce a runtime warning.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
>  drivers/virt/coco/tdx-guest/Kconfig     |  9 +++++++++
>  drivers/virt/coco/tdx-guest/tdx-guest.c | 13 +++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
> index 22dd59e19431..0f1cfdfbbd28 100644
> --- a/drivers/virt/coco/tdx-guest/Kconfig
> +++ b/drivers/virt/coco/tdx-guest/Kconfig
> @@ -9,3 +9,12 @@ config TDX_GUEST_DRIVER
>  
>  	  To compile this driver as module, choose M here. The module will
>  	  be called tdx-guest.
> +
> +config TDX_GUEST_DRIVER_LEGACY_IOCTL
> +	def_bool y
> +	prompt "Enable legacy ioctl interface (DEPRECATED)"
> +	depends on TDX_GUEST_DRIVER
> +	help
> +	  Enable the legacy IOCTL-based interface to get the TDX report. It's
> +	  deprecated in favor of the configfs based one and will be removed
> +	  in a future release.

This too should document how a user would know if they need this or not.

> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 1253bf76b570..b8cea9486daf 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -66,6 +66,7 @@ static DEFINE_MUTEX(quote_lock);
>   */
>  static u32 getquote_timeout = 30;
>  
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  static long tdx_get_report0(struct tdx_report_req __user *req)
>  {
>  	u8 *reportdata, *tdreport;
> @@ -100,6 +101,7 @@ static long tdx_get_report0(struct tdx_report_req __user *req)
>  
>  	return ret;
>  }
> +#endif

Please no sprinkling of ifdef throughout the file.  Create a new file
like drivers/virt/coco/tdx-guest/miscdev.c, and optionally compile it.
With a tdx_misc_register() that stubs out the setup, something like:

#ifdef CONFIG_TDX_GUEST_REPORT_IOCTL
int tdx_misc_register(void);
#else
static inline int tdx_misc_register(void) { return 0; }
#endif

>  
>  static void free_quote_buf(void *buf)
>  {
> @@ -249,6 +251,9 @@ static int tdx_report_new(struct tsm_report *report, void *data)
>  	return ret;
>  }
>  
> +
> +
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
> @@ -271,6 +276,7 @@ static struct miscdevice tdx_misc_dev = {
>  	.minor = MISC_DYNAMIC_MINOR,
>  	.fops = &tdx_guest_fops,
>  };
> +#endif
>  
>  static const struct x86_cpu_id tdx_guest_ids[] = {
>  	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
> @@ -290,9 +296,12 @@ static int __init tdx_guest_init(void)
>  	if (!x86_match_cpu(tdx_guest_ids))
>  		return -ENODEV;
>  
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
> +	pr_info("Legacy IOCTL-based interface is deprecated and will be removed in a future release\n");

No, don't spam the log on driver load, maybe add a pr_info_once() in the
ioctl path itself. Then you get some rough telemmetry of actual usage if
people post kernel logs to the kernel mailing list(s).

>  	ret = misc_register(&tdx_misc_dev);
>  	if (ret)
>  		return ret;
> +#endif
>  
>  	quote_data = alloc_quote_buf();
>  	if (!quote_data) {
> @@ -310,7 +319,9 @@ static int __init tdx_guest_init(void)
>  free_quote:
>  	free_quote_buf(quote_data);
>  free_misc:
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  	misc_deregister(&tdx_misc_dev);
> +#endif
>  
>  	return ret;
>  }
> @@ -320,7 +331,9 @@ static void __exit tdx_guest_exit(void)
>  {
>  	tsm_unregister(&tdx_tsm_ops);
>  	free_quote_buf(quote_data);
> +#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
>  	misc_deregister(&tdx_misc_dev);
> +#endif
>  }
>  module_exit(tdx_guest_exit);
>  
> -- 
> 2.34.1
> 


