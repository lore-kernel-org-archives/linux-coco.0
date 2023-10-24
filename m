Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3440324212
	for <linux-coco@lists.linux.dev>; Tue, 24 Oct 2023 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9EnsJn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698167342; x=1729703342;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TFoATZ8RDMKWupMoOvC2eLWlYJN1sapo2QQw2inXswE=;
  b=N9EnsJn+ZJ7GZvpD/8vo+Rckl5PAe2Dq+jwPLtUME6RaEwOJ+sjNpjoz
   cdr9g1CkMV//+sGyU/25JQkyXUBNeDRg+BGnhNKowEcyHpw7G7DsMis3+
   Q32KGBo7jiGt7YHO38lnSsa0BLpOTb2kpGxyfaVUnGVcHwdOX8ia0QZF7
   Zl3kQUQlH92m4k36i2tVgUvs6ywlUok3aHlQIFPtX4CadZIUU6XAxA8OD
   JIUi2qmpQm+eSjZZk3JZRZAKk+4ssSUtTdl1L/NcoqsyrNJvXPN5Gxjnh
   S2faxi58zo0wwXydLVCQ1P2hP4MLzealkGaVtZ1WNd0bjaK48Sw+miQRJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="372177219"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="372177219"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 10:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708385032"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="708385032"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2023 10:09:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 10:09:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 10:09:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 10:09:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 10:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g650qR/gmTfVN/l0KEqMzMUDQttqCL0wE3UYRLfTu6rceBX7upsFwWgbnw0qRb+Q+Fd0Q1bq8ANg2ymqHeODLu6DlUhHsYHZNMKmOP2RK298vSRl7AHeZxE8ZVu6iHjIK5z4uyGzqg1noQ33JpVEUhrh6cZmlEpZV0wD+/KZ0TYvmk7rp3a3ybtcdd7BZlW4AebR0AvtZ3srbbQ4HrBfetiB82IBpW9Di2vRxbrHamTUDw3a68RnV8zZefw3d/NeY1T4m4q6Sy/Y+iDSBg0nASx01WdXnTvd6a73Ecyf4O/WKuIYmuALNNuEQuDITDW/mfYIHQ7Il8jHOlM2dSPLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jrbi212iAKLjC2Q64eRLK9ZC0C+/Sh+pFECWhcJkuM=;
 b=hxShAboIu0+h8escOdcbrzaP+gE4NFJZeqiQQKLo2r2ryZeBQaZHdmZv9WuMMhjVAgcy8AJQNuauQWReJe6FZ7fV2g8y2zXfjIhWjOYe6kQaNEOnkT5+liPFwMjY7AUks9Mswlv+GtWIDl+IDIKf+m+vRPQWUwrL+7Dd0RFuqiSTe/WcOdaoF0DhOEbj8vgyLOJMFhmdVArbn8jtHiwUBI2fOb500GaV+07Np49YmX2WCSYwMTvdV57EcJcWCxKRMVtxS4xx14J22uak0C8XbRbv0bDtUZ1RsvDCEyrOiQWeVt3qPvQ00GlVwU6YLxuK7HQcLiwhf+o1l29H32jerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO6PR11MB5571.namprd11.prod.outlook.com (2603:10b6:5:35f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 17:08:58 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4%4]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 17:08:58 +0000
Date: Tue, 24 Oct 2023 10:08:55 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>, Peter Gonda <pgonda@google.com>, "Tom
 Lendacky" <thomas.lendacky@amd.com>, <peterz@infradead.org>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
Subject: RE: [PATCH v7 7/7] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
Message-ID: <6537fa27ca536_1ce459294f0@dwillia2-xfh.jf.intel.com.notmuch>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <169776462726.1705513.6571107715919082569.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:303:dc::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO6PR11MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4010ac-cd42-42f6-92a4-08dbd4b3e912
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIpAq2QbzMA6JVDFpRh9fGx7hno9C08ZIAYDLt5aCchERZ3/XbZldtRuzj7I+ZkvmPKdanuIGK6XlvE/2rtCd9x6pXwsQPmYqp+z5sgx/fr8rC0a0px9MBvCE0razn03ADA7rDAm0JMPc+UzG74CAqyfN82Y1e7qFmagEBCZAD5dsnnt7rahNoqqfYLMR9DvJqHn2OXdWPyP5XGh4e5/7dqucltZw0SHK3+ZLEUVgEGyzRqV1TfBQzFX7KiF7FNBBL3asrdQbLdSx3aC7nvQ5XiNDHIFJOUayLEFVdxBo7IHXob/ogbstRv0Y55zkrd2gZt2R/jJmqiBiWVlEpnCDxQPxvCG1gnAHq/c6mKqRY25NXaDODnznU1Ej5qSebvrwLZVfvdKUfKH0oqKixUzNrF5Lj/g/f2DezIFQLLkXfGz/78y/J7tFg1LMaSgkSAITK+mcKzdMTUcJs4zlXyyoDvq79yTxXKSWBOZ25Rpf7+KAuvWsLh0pAKPIVyMasgsn/pitpgnqY84IFvYO6H94uxReUTeq4dqVkFE7CNGIBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(66476007)(2906002)(86362001)(38100700002)(41300700001)(82960400001)(66556008)(54906003)(6666004)(66946007)(316002)(478600001)(6506007)(9686003)(6512007)(6486002)(83380400001)(966005)(5660300002)(4326008)(8676002)(8936002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vDp0XDSSoGbPeKvZTcsIWTjIUs9xtiU62at+iPL+R5J4wdbxMvmnY72B1gIv?=
 =?us-ascii?Q?yP7fIxaIxzKMcLjB6ng+xbyni+cmysgo5gY2VfiJjBMplLCR2H4mcPcrerNe?=
 =?us-ascii?Q?OHtJnCfgwgifOr0K1ynXmoSC+RyASKXNCez+RDTAJxEy1BvbZrZzebwa3M5L?=
 =?us-ascii?Q?Yc6wgbC5AY5WrSS09mLkpR6duQp1Wo3+LST3oZ6JbgGj9Z/5qjPtFhQ4D2hy?=
 =?us-ascii?Q?zQzHuGA0TfhFzn0bK0j7/OIihOV7EU1A3nIPUphbWYJ87xqW64gIAYKS8Dlh?=
 =?us-ascii?Q?/OVXoobJs1IVnWbCWKs9GgDjpKG5QXgRRtPJ8MyLEgET9MVJkeTqa2Ipyvxv?=
 =?us-ascii?Q?IQlYZt3wLFjI4zqSkZw1mkGXqiH5/I3JyPTL37sJPaB5QsdYQUgJJYAv38e7?=
 =?us-ascii?Q?exfXcDppWHpMfcCWf/c832yrIrYNq1YTddz7ks6Wu6KlBKk6i2gTmHOqpqQR?=
 =?us-ascii?Q?/oN5XUW4PUSSZCEWIwW01/2ERh2rYjPab73Yla6QbXko2V2EcNe5CnPtEdCH?=
 =?us-ascii?Q?wlqHlXYEG5u3tZW1e9g9CwN0VEgDVwMgc4SH73kIiUxlhfdSR/LqDOyIKNhO?=
 =?us-ascii?Q?wRe9Q/jcvS8YdCFuXHwiXYT28E+mScTYisiRMs6+3e7rEkRrJ7Zx4YU0XQBD?=
 =?us-ascii?Q?VS7ZEPEsPw+Z4nouVqZJjZZUeAtlj+O2LxHy/YFIyZ+1YE9rDAbMngCNZ4Xx?=
 =?us-ascii?Q?I6lh1yDX+djQOdB//l4oHwf4opNoQI1oNGwCBVKucCh/875aL8u4zYkw0K1t?=
 =?us-ascii?Q?ZwKoVNTBGttx2qbcOuywWNkhXi4BrrjlvMoXOQJIPUU3v30QbKmKNjNVDT4h?=
 =?us-ascii?Q?WhSDZrebjWx9AJ2k+vxVXi+ZZ+GYGWRKIUsCvRFpM5lDq8ogR6z2VSAlkKnM?=
 =?us-ascii?Q?/kRHRnxJJyC/AkpdAmkm/ZOTio6RO0wutfDWSJTxET2iPo4EN9qv9hpypQ94?=
 =?us-ascii?Q?PaF+4DlOX2FGEct9tKE2rUeVKlLa3y02HGlL15heSvOhvrni9JdUFpYLaz3X?=
 =?us-ascii?Q?6OmQi2lIf2vTlJTZKiEBPg+9c33V7n+MuuF4TR8cwE/8tmu7cC0c5vHdUYgk?=
 =?us-ascii?Q?jdT/pcE/83VhRsRBuF/JZlr69gUgXrLJ7/fMTFs9t4bXFYKXFDZgMMMWvEOB?=
 =?us-ascii?Q?OVczAMVbg7hQ/LTG34D5K6NMn7YMSMOGhfPK+to9cs4l+EZUD3LoDfIzMg9b?=
 =?us-ascii?Q?3OBXrGqUlBwQ/TAKaFCbXkVu8AEl9UkpLD4shqoRWkabaafGd3l0U8kA7HdB?=
 =?us-ascii?Q?5a/RZwU/Aab+R4rRtGP/4LqvEOHgDsMP/Vroj9ziowTopfD6VschuX3QgvZA?=
 =?us-ascii?Q?CtHtaUhnhGyYtpgHwKjChUEHDIdK6PaUPCBvUjHBBw3RPBUyLH+wYNQ0khuP?=
 =?us-ascii?Q?eaJTvk0udz5SMNN8V5EcZX0NtfQb+EHXL1WH1QQZxbSf8cl2BXxa/Ka5hp8A?=
 =?us-ascii?Q?7RZP7x2Z+ZEZQHih5BnDqrmHhz3N6vCtBb6vNXnAzjWYwbkDyYuLAN8kdGl/?=
 =?us-ascii?Q?H7mQtxcr9bvDKB/HPSLXZMksGBKXSMlL7OgFN5L5CALtSIQi5XY2Y7rjdP+n?=
 =?us-ascii?Q?nq9Updgyr3c0oYqwPqVKPpfPjxMqg+2vX8MH1AoZiluikpEsacE807EWazW0?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4010ac-cd42-42f6-92a4-08dbd4b3e912
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 17:08:57.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVlV4YCnIFjZxGsV0iLn1rnmts39awKIxRpiuk9J/Gw37ptnV3f043a68S3ZrccHgJhrYq8Sk4LAPk7gblzBakqiVsDhct/c7oUxoe1Lky4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5571
X-OriginatorOrg: intel.com

Dan Williams wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> In TDX guest, the attestation process is used to verify the TDX guest
> trustworthiness to other entities before provisioning secrets to the
> guest. The first step in the attestation process is TDREPORT
> generation, which involves getting the guest measurement data in the
> format of TDREPORT, which is further used to validate the authenticity
> of the TDX guest. TDREPORT by design is integrity-protected and can
> only be verified on the local machine.
> 
[..]
> 
> Link: https://lore.kernel.org/lkml/169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com/ [1]
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Reviewed-by: Erdem Aktas <erdemaktas@google.com>
> Tested-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Tested-by: Peter Gonda <pgonda@google.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/x86/coco/tdx/tdx.c                 |   21 +++
>  arch/x86/include/asm/shared/tdx.h       |    1 
>  arch/x86/include/asm/tdx.h              |    2 

Given the proximity to v6.7 window opening I am going to go ahead and
throw this into linux-next for some soak time. If an x86 maintainer
wants to take it, or otherwise wants me to drop it out linux-next just
holler.

Per above there are limited arch/x86 touches in this series, and it
merges cleanly with tip/master.

I will also copy x86@ on the linux-next branch add request.
