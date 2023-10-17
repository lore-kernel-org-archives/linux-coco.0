Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0A1FB6
	for <linux-coco@lists.linux.dev>; Tue, 17 Oct 2023 02:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmQ14sEX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697509180; x=1729045180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JVYci4dPjztqnuw4CCGXNDO/S27SEwG7LJmVmhKgDTg=;
  b=YmQ14sEXweqAcf3r4mUW/rZnjBqarrxFRWfJc7gjAUIz+jGaYQ/F3Uq3
   FY+0jE2O1J9GZ74rgZVvon92IdP6WP8AMxj7yusdopJPsp3KbFqCXkQrG
   gEDmbCTNJ0/c+/tFQPPmDDy4MLFt2F/PwI/4JZD6WNG5Spbm1TizzGPKm
   2LvwonBUIIscD//+Wqv+wyCPVCckmIVX0HkZKACh9zlobWxdnD5mzxZeb
   wDHOF6H9p97Ypj/3mio7+msZkEgr51j1z6qhlD22a1HT1ToobDuEU6i8t
   kPgBRwH59rR3FdZSssEKa5eqVU4vsKpMbR1S9a6BL2ZYlymJ/ll+4TdVz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="385524342"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="385524342"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 19:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="929582354"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="929582354"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 19:19:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 19:19:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 19:19:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 19:19:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 19:19:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKV07WLJJSEet5/+Malls5wvcpoNHbnD5nsG6olQDxBJdiOe+8MuwBVQNPiAc2IvnUazOt54G55v8aVlLZRQqa5w/QP8UGHRiaYexEJWwUplxLvaReOaScJnSJNHvDqiusqOohw7v9O4xKyZrYVZ2UYJB/xrUZaq8SHn0+ZZ1hT6xF+80UFK574V/dIH+bxUEPmXWZ2SuyhxowEnlbejf587Xurtx7FapgCzIlbdUC3ltZ1KHk6ZteT+cQ1399wMTdDs19ekOqmhiX18uVC1T/VWbu2HvXInK9j8154pF+gfRNFCdU37FGqVsHunYgLzVigU7BPiZtNZVcKqUe6Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhJehLnOJVRXW1Eo1ZoKMi1HQODg/QY/DaPEj3p8rSI=;
 b=PEVtU22fcMgVNNZhdxb1FOR92DHw/ByiUUTNZ43OtIGsvfnx/8+ndtfL7znwrtKaT2Sguva36RbCzBhSj2LzRDlAyskU2q0i5Xg02K/To66DblzmfUwl5PuTkYrEntNX5f5vFlg0hoWUesh0hduN2DTWhEnx5NTbyyFaAOUaWOJjrP9DGTBKi6TnMIpO9UXMoNPYhpgAP9fV/hhrNbytc+Blz+AC1d6My1fyI0eJ2WMgnjeeq/HAQSq2XKntLn/zih7MEH8pK5K6m42zOGD7gPYNpf7NHorPYkm/wSiVvHSS8vw1QcPqBIxPfmEAwOKQWfKN6w2KfEv98bSsdLFzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB6730.namprd11.prod.outlook.com (2603:10b6:510:1c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.42; Tue, 17 Oct
 2023 02:19:36 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 02:19:35 +0000
Date: Mon, 16 Oct 2023 19:19:33 -0700
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
Message-ID: <652def355ef34_f8792949c@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716325275.984874.18286682727336216616.stgit@dwillia2-xfh.jf.intel.com>
 <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b919716-127d-407a-85c2-df81cbbd9ba9@amd.com>
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4730ea-2a8f-4c5c-f4d9-08dbceb781d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eecPrdnlS19Y9YMxBZ6R1JgyMFO1dT5PA5MyTEE6TdTi5xZU1hWOEsqRTIIU7k3HEjwm2qwHOPJHHYpawlaHGrE+q5ihEr/zvyIXVElxvzP7aqiZEIX2dBXyjVWpkrXMZvMrptUGbjHdOVsCok1v43YreCAYHYU1GzClPSMZytFV7dSgcgSXi15g9B8+s8Z1V6Fg9JiuFjUxDBare3ZiSXoDaksjnH/tTfFRrryzJccpcHeseR+/ae/DwNKzxCjqWCGjYmQw7z/EZRnba1JDz+AJ7Zy5voEBntvQyMCbHpCKlpTbZXAF6FP4MRWN++F1VayhpfqwzL5b9yBChqrjDa6v9z4okxiQZ0UuNLOvqlArZ6jr9rm/8qQ2Jaxn3sf+ZmlxvflRZ0NdT7hbW4FL9Pb5TxpbSsFcyGIhcg93sMfdzRfihMs7QkBTVQGs3L3bXDLsauSCAM3BuLteepmITX9rF744CjgV8qPnw0R1orDZmZnwjNvL5E2w7kg+tq44G6DtfqB+RMwWh8+ycSvIoUCY+nzvnI6qUxyfRofCUfbuIym4D/KEByHcxJRPMylVlw3EN90jK1q721ajrsEBhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(30864003)(5660300002)(41300700001)(8936002)(4326008)(8676002)(2906002)(86362001)(82960400001)(7416002)(478600001)(66556008)(966005)(6486002)(6506007)(6512007)(9686003)(26005)(66476007)(38100700002)(54906003)(316002)(66946007)(83380400001)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vmtmUj7XURkhvqTR4mItQn1sTubfoCLNmcOLrYiwk3zEKx7v2F+jFcue2B?=
 =?iso-8859-1?Q?Xze3uu5gBf+5YLV31Gf8Y1Dlo5Eh01qJYyaOninlgkWVnMWoHn9i35uNYX?=
 =?iso-8859-1?Q?5kWFl2sB+KCYt4AcvBdnzOgBoMsO04INssJ18ykkrCaZOylJ71PKei92tj?=
 =?iso-8859-1?Q?6KxyP8twERtw5KFc8fN0BH95x1lDUbHpjNg32QiJYS9WUy3QNFJPS7TIew?=
 =?iso-8859-1?Q?5kv+GbjhipfAZnxdabGPVcT0DcX3KOZr03+kbA26qFLd87fHoQuCIAVv+N?=
 =?iso-8859-1?Q?fHXfDIZfrgaiUFTRs8sJoPYjIQ4VKYWoV2Gf/+dPAB2OgWzKDf6e8tQBi8?=
 =?iso-8859-1?Q?cIdcUBS0b4X9cDKTwTlzEMiDgZLk1kSH5SUGFbqK5ChKzxZ5ctksNBfNXB?=
 =?iso-8859-1?Q?+Ipa4ShnniL2S2iQUNDQ4/id+v0flVUosnKWnOV6M30BtTxRJetx33HJeB?=
 =?iso-8859-1?Q?TfDuuj4iBAZ0eu/vL3NXDlWmz9ucRZ53DMdOfIoF0hX9hEljU+Ck5ezjTg?=
 =?iso-8859-1?Q?4QhEAYhdvWAoXz+OQHOZJPEnryHGrA2AHIsUTMZF7I9N9ApXlVO+I+P7AF?=
 =?iso-8859-1?Q?y57lr0hj7m3FVnBcXcHgUqMwZk7OYdm06mliZx672bvLk8itxyBe6qykZu?=
 =?iso-8859-1?Q?8SXhDxXatgDTWNIWyixOnj6PWOTpQQY/jnguW5QbCjUt+F9vaNeu89cOuM?=
 =?iso-8859-1?Q?xaBEPg9Ry4MsGgV5wms1zc0d/LVDo2DML9xc0CpwLXQYoLEjlujYTUExLh?=
 =?iso-8859-1?Q?bEnjOsLKwwX4N0nW1+I2BE8+13bPINXQed5BRW3CcoCnHFpqvebKMjMy1t?=
 =?iso-8859-1?Q?+/SbQna6ZYGjgwNbgjn+/rUS2Uow/W1Ca86sxhdmicfvlOexpj5YEpwa6V?=
 =?iso-8859-1?Q?iwPUY52jOOqmLzTPC29TQXovrTxbIcC1T8JDfZW3bjlH/RUBSEBRNp+xSa?=
 =?iso-8859-1?Q?Mlo+xF91jScxcZuUVGoqpOP76OcTuTJvFGsQccOvudamCLwXSquBYGHSo7?=
 =?iso-8859-1?Q?tp8ZWdrvrX0AuRBqlTO3i67layeGXmFTo/FWKE6dtOlmxVMiGNbHdnLwwM?=
 =?iso-8859-1?Q?ZXh3F9fgbnYMHRz5BP8JtucSCA7Tmb1p49e08EZY0CYIR5elk+p1YF9/TF?=
 =?iso-8859-1?Q?VhEfQWCacEl3UySqnz51XY+WcxL82+dtkkJazDoAjGZbU1O9RP/CYCZ5Av?=
 =?iso-8859-1?Q?pF45Bas4kYniaZ3felDvPr4qv94pe0o8Me6Be9tGhn9EpBxtz5MokuByju?=
 =?iso-8859-1?Q?k7I/CsBZrih9M4WuiCN9HD5FxY6LEbFybsA/DXUcgQmYrnuFYb3PUk1Faa?=
 =?iso-8859-1?Q?USUYUJeAJMwpbSPPkGN1y9TndBnOsi4Jc1fYUGEsllwec758gNPeEpRQf0?=
 =?iso-8859-1?Q?uL8FTROVKgt/92iMFmRXwnToBAmR8Xfn4dl7DtuZVUw0b9Ric4pea2Kz3C?=
 =?iso-8859-1?Q?f1qjjPNd5GniVp7i9TtZa0JxUUH7dgD3V3FBLYCwSl+hBTouPhtp0ex9rG?=
 =?iso-8859-1?Q?TexJmk7mOqToSjsfPCQmd0Dt/yIwnP+XQ9a7d5RvlKWzIq/8u2JDnMBNzg?=
 =?iso-8859-1?Q?JMcWzeZT8aWli9f39hci//k0FL48m9QeXpgc8faQVez08WknkL867Rl1wg?=
 =?iso-8859-1?Q?N55NIoPlC6cvvyBG6hAbG3CWT29r5OxtS/uTnHJNCLUMVnNvRlCwhL0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4730ea-2a8f-4c5c-f4d9-08dbceb781d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 02:19:35.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScArGHPzqTWQskziDBpeGkxPs1YL9Diyfc0nwHO5Lgstek/ipzutp1RCKeADW4D6JX4qDLJod0Nya7CXFyD58uFqeJgl1c0+VJJluip6Ekk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6730
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
[..]
> > +What:		/sys/kernel/config/tsm/report/$name/provider
> > +Date:		September, 2023
> > +KernelVersion:	v6.7
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(RO) A name for the format-specification of @outblob like
> > +		"sev-guest" [1]  or "tdx-guest" [2] in the near term, or a
> > +		common standard format in the future.
> 
> Nit: /sys/kernel/config/tsm/report/report0/provider contains 
> "sev_guest", i.e. "_", not "-".

Yes, will fix either with a follow-on or a respin if more feedback
arrives.

> 
> > +
> > +		[1]: SEV Secure Nested Paging Firmware ABI Specification
> > +		Revision 1.55 Table 22
> > +		https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/specifications/56860.pdf
> > +
> > +		[2]: Intel® Trust Domain Extensions Data Center Attestation
> > +		Primitives : Quote Generation Library and Quote Verification
> > +		Library Revision 0.8 Appendix 4,5
> > +		https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_DCAP_Quoting_Library_API.pdf
> > +
> > +What:		/sys/kernel/config/tsm/report/$name/generation
> > +Date:		September, 2023
> > +KernelVersion:	v6.7
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(RO) The value in this attribute increments each time @inblob or
> > +		any option is written. Userspace can detect conflicts by
> > +		checking generation before writing to any attribute and making
> > +		sure the number of writes matches expectations after reading
> > +		@outblob, or it can prevent conflicts by creating a report
> > +		instance per requesting context.
> > +
> > +What:		/sys/kernel/config/tsm/report/$name/privlevel
> > +Date:		September, 2023
> > +KernelVersion:	v6.7
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(WO) Attribute is visible if a TSM implementation provider
> > +		supports the concept of attestation reports for TVMs running at
> > +		different privilege levels, like SEV-SNP "VMPL", specify the
> > +		privilege level via this attribute.  The minimum acceptable
> > +		value is conveyed via @privlevel_floor and the maximum
> > +		acceptable value is TSM_PRIVLEVEL_MAX (3).
> > +
> > +What:		/sys/kernel/config/tsm/report/$name/privlevel_floor
> > +Date:		September, 2023
> > +KernelVersion:	v6.7
> > +Contact:	linux-coco@lists.linux.dev
> > +Description:
> > +		(RO) Indicates the minimum permissible value that can be written
> > +		to @privlevel.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b19995690904..8acbeb029ba1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21889,6 +21889,14 @@ W:	https://github.com/srcres258/linux-doc
> >   T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
> >   F:	Documentation/translations/zh_TW/
> >   
> > +TRUSTED SECURITY MODULE (TSM) ATTESTATION REPORTS
> > +M:	Dan Williams <dan.j.williams@intel.com>
> > +L:	linux-coco@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/ABI/testing/configfs-tsm
> > +F:	drivers/virt/coco/tsm.c
> > +F:	include/linux/tsm.h
> > +
> >   TTY LAYER AND SERIAL DRIVERS
> >   M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >   M:	Jiri Slaby <jirislaby@kernel.org>
> > diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> > index fc5c64f04c4a..87d142c1f932 100644
> > --- a/drivers/virt/coco/Kconfig
> > +++ b/drivers/virt/coco/Kconfig
> > @@ -2,6 +2,11 @@
> >   #
> >   # Confidential computing related collateral
> >   #
> > +
> > +config TSM_REPORTS
> > +	select CONFIGFS_FS
> > +	tristate
> > +
> >   source "drivers/virt/coco/efi_secret/Kconfig"
> >   
> >   source "drivers/virt/coco/sev-guest/Kconfig"
> > diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> > index 55302ef719ad..18c1aba5edb7 100644
> > --- a/drivers/virt/coco/Makefile
> > +++ b/drivers/virt/coco/Makefile
> > @@ -2,6 +2,7 @@
> >   #
> >   # Confidential computing related collateral
> >   #
> > +obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
> >   obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
> >   obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
> >   obj-$(CONFIG_INTEL_TDX_GUEST)	+= tdx-guest/
> > diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
> > new file mode 100644
> > index 000000000000..0200a86f1efe
> > --- /dev/null
> > +++ b/drivers/virt/coco/tsm.c
> > @@ -0,0 +1,423 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/* Copyright(c) 2023 Intel Corporation. All rights reserved. */
> > +
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/tsm.h>
> > +#include <linux/err.h>
> > +#include <linux/slab.h>
> > +#include <linux/rwsem.h>
> > +#include <linux/string.h>
> > +#include <linux/module.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/configfs.h>
> > +
> > +static struct tsm_provider {
> > +	const struct tsm_ops *ops;
> > +	const struct config_item_type *type;
> > +	void *data;
> > +} provider;
> > +static DECLARE_RWSEM(tsm_rwsem);
> > +
> > +/**
> > + * DOC: Trusted Security Module (TSM) Attestation Report Interface
> > + *
> > + * The TSM report interface is a common provider of blobs that facilitate
> > + * attestation of a TVM (confidential computing guest) by an attestation
> > + * service. A TSM report combines a user-defined blob (likely a public-key with
> > + * a nonce for a key-exchange protocol) with a signed attestation report. That
> > + * combined blob is then used to obtain secrets provided by an agent that can
> > + * validate the attestation report. The expectation is that this interface is
> > + * invoked infrequently, however configfs allows for multiple agents to
> > + * own their own report generation instances to generate reports as
> > + * often as needed.
> > + *
> > + * The attestation report format is TSM provider specific, when / if a standard
> > + * materializes that can be published instead of the vendor layout. Until then
> > + * the 'provider' attribute indicates the format of 'outblob', and optionally
> > + * 'auxblob'.
> > + */
> > +
> > +struct tsm_report_state {
> > +	struct tsm_report report;
> > +	unsigned long write_generation;
> > +	unsigned long read_generation;
> > +	struct config_item cfg;
> > +};
> > +
> > +enum tsm_data_select {
> > +	TSM_REPORT,
> > +	TSM_CERTS,
> > +};
> > +
> > +static struct tsm_report *to_tsm_report(struct config_item *cfg)
> > +{
> > +	struct tsm_report_state *state =
> > +		container_of(cfg, struct tsm_report_state, cfg);
> 
> This be one line of 88 chars (less than allowed 100).
> 
> (I'll comment once on this, feel free to ignore :) )

Unless and until the kernel's .clang-format template is updated to 100
you will find my patches wrapped to its ColumnLimit setting (80). I did
manually fixup my sev_guest changes to 100 since there was precedent in
that file, everything else I just let .clang-format do its thing.

> 
> > +
> > +	return &state->report;
> > +}
> > +
> > +static struct tsm_report_state *to_state(struct tsm_report *report)
> > +{
> > +	return container_of(report, struct tsm_report_state, report);
> > +}
> > +
> > +static int try_advance_write_generation(struct tsm_report *report)
> > +{
> > +	struct tsm_report_state *state = to_state(report);
> > +
> > +	lockdep_assert_held_write(&tsm_rwsem);
> > +
> > +	/*
> > +	 * Malicious or broken userspace has written enough times for
> > +	 * read_generation == write_generation by modular arithmetic without an
> > +	 * interim read. Stop accepting updates until the current report
> > +	 * configuration is read.
> > +	 */
> > +	if (state->write_generation == state->read_generation - 1)
> > +		return -EBUSY;
> > +	state->write_generation++;
> > +	return 0;
> > +}
> > +
> > +static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
> > +					  const char *buf, size_t len)
> > +{
> > +	struct tsm_report *report = to_tsm_report(cfg);
> > +	unsigned int val;
> > +	int rc;
> > +
> > +	rc = kstrtouint(buf, 0, &val);
> > +	if (rc)
> > +		return rc;
> > +
> > +	/*
> > +	 * The valid privilege levels that a TSM might accept, if it accepts a
> > +	 * privilege level setting at all, are a max of TSM_PRIVLEVEL_MAX (see
> > +	 * SEV-SNP GHCB) and a minimum of a TSM selected floor value no less
> > +	 * than 0.
> > +	 */
> 
> Sounds like privlevel_floor should be "unsigned int" rather than "int".

Sure.

> > +	if (provider.ops->privlevel_floor > val || val > TSM_PRIVLEVEL_MAX)
> > +		return -EINVAL;
> > +
> > +	guard(rwsem_write)(&tsm_rwsem);
> > +	rc = try_advance_write_generation(report);
> > +	if (rc)
> > +		return rc;
> > +	report->desc.privlevel = val;
> > +
> > +	return len;
> > +}
> > +CONFIGFS_ATTR_WO(tsm_report_, privlevel);
> > +
> > +static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
> > +					       char *buf)
> > +{
> > +	guard(rwsem_read)(&tsm_rwsem);
> > +	return sysfs_emit(buf, "%u\n", provider.ops->privlevel_floor);
> 
> %d  or  change the type.

Ok.

> 
> > +}
> > +CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
> > +
> > +static ssize_t tsm_report_inblob_write(struct config_item *cfg,
> > +				       const void *buf, size_t count)
> > +{
> > +	struct tsm_report *report = to_tsm_report(cfg);
> > +	int rc;
> > +
> > +	guard(rwsem_write)(&tsm_rwsem);
> > +	rc = try_advance_write_generation(report);
> > +	if (rc)
> > +		return rc;
> > +
> > +	report->desc.inblob_len = count;
> > +	memcpy(report->desc.inblob, buf, count);
> > +	return count;
> > +}
> > +CONFIGFS_BIN_ATTR_WO(tsm_report_, inblob, NULL, TSM_INBLOB_MAX);
> > +
> > +static ssize_t tsm_report_generation_show(struct config_item *cfg, char *buf)
> > +{
> > +	struct tsm_report *report = to_tsm_report(cfg);
> > +	struct tsm_report_state *state = to_state(report);
> > +
> > +	guard(rwsem_read)(&tsm_rwsem);
> > +	return sysfs_emit(buf, "%lu\n", state->write_generation);
> > +}
> > +CONFIGFS_ATTR_RO(tsm_report_, generation);
> > +
> > +static ssize_t tsm_report_provider_show(struct config_item *cfg, char *buf)
> > +{
> > +	guard(rwsem_read)(&tsm_rwsem);
> > +	return sysfs_emit(buf, "%s\n", provider.ops->name);
> > +}
> > +CONFIGFS_ATTR_RO(tsm_report_, provider);
> > +
> > +static ssize_t __read_report(struct tsm_report *report, void *buf, size_t count,
> > +			     enum tsm_data_select select)
> > +{
> > +	loff_t offset = 0;
> > +	ssize_t len;
> > +	u8 *out;
> > +
> > +	if (select == TSM_REPORT) {
> > +		out = report->outblob;
> > +		len = report->outblob_len;
> > +	} else {
> > +		out = report->auxblob;
> > +		len = report->auxblob_len;
> > +	}
> > +
> > +	/*
> > +	 * Recall that a NULL @buf is configfs requesting the size of
> > +	 * the buffer.
> > +	 */
> 
> The comment can be one line (or even dropped as it is configfs api).

I got a comment from a reviewer that did not understand why @buf is
allowed to be NULL. It's an oddity compared to sysfs binary attributes,
so I don't mind the comment.

[..]
> > +static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
> > +			       size_t count, enum tsm_data_select select)
> > +{
> > +	struct tsm_report_state *state = to_state(report);
> > +	const struct tsm_ops *ops;
> > +	ssize_t rc;
> > +
> > +	/* try to read from the existing report if present and valid... */
> > +	rc = read_cached_report(report, buf, count, select);
> > +	if (rc >= 0 || rc != -EWOULDBLOCK)
> > +		return rc;
> > +
> > +	/* slow path, report may need to be regenerated... */
> > +	guard(rwsem_write)(&tsm_rwsem);
> > +	ops = provider.ops;
> > +	if (!report->desc.inblob_len)
> > +		return -EINVAL;
> > +
> > +	/* did another thread already generate this report? */
> > +	if (report->outblob &&
> > +	    state->read_generation == state->write_generation)
> > +		goto out;
> > +	kvfree(report->outblob);
> > +	kvfree(report->auxblob);
> > +	report->outblob = NULL;
> > +	report->auxblob = NULL;
> > +	rc = ops->report_new(report, provider.data);
> 
> 
> Drop @ops and use "provider.ops" here?

Shrug, ok.

> 
> > +	if (rc < 0)
> > +		return rc;
> > +	state->read_generation = state->write_generation;
> > +out:
> > +	return __read_report(report, buf, count, select);
> > +}
> > +
> > +static ssize_t tsm_report_outblob_read(struct config_item *cfg, void *buf,
> > +				       size_t count)
> > +{
> > +	struct tsm_report *report = to_tsm_report(cfg);
> > +
> > +	return tsm_report_read(report, buf, count, TSM_REPORT);
> > +}
> > +CONFIGFS_BIN_ATTR_RO(tsm_report_, outblob, NULL, TSM_OUTBLOB_MAX);
> > +
> > +static ssize_t tsm_report_auxblob_read(struct config_item *cfg, void *buf,
> > +				       size_t count)
> > +{
> > +	struct tsm_report *report = to_tsm_report(cfg);
> > +
> > +	return tsm_report_read(report, buf, count, TSM_CERTS);
> > +}
> > +CONFIGFS_BIN_ATTR_RO(tsm_report_, auxblob, NULL, TSM_OUTBLOB_MAX);
> > +
> > +#define TSM_DEFAULT_ATTRS() \
> 
> imho this one and TSM_DEFAULT_BIN_ATTRS are not really helping with 
> readability or a size :)

It is meant to do neither, it is only here to make it clear that
tsm_report_bin_extra_attrs[] is a super-set of tsm_report_bin_attrs[].
What I really want is sysfs-style group syntax, but configfs does not
have that same declaration capability.

[..]
> 
> A little confusing thing is that this guy is neither near the beginning 
> of the file (with other statics, this could even be a member of 
> tsm_provider) nor the code which sets/clears it - tsm_init/tsm_unregister.

@tsm_report_group is only used in tsm_{init,exit}(). I'll move its
declartion closer to tsm_init() in a follow-on.

[..]
> > diff --git a/include/linux/tsm.h b/include/linux/tsm.h
> > new file mode 100644
> > index 000000000000..5fadc382064d
> > --- /dev/null
> > +++ b/include/linux/tsm.h
> > @@ -0,0 +1,68 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __TSM_H
> > +#define __TSM_H
> > +
> > +#include <linux/sizes.h>
> > +#include <linux/types.h>
> > +#include <linux/device.h>
> 
> device.h is not needed.

Yes, an earlier version of this interface referenced devices.
