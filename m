Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E8B320F
	for <linux-coco@lists.linux.dev>; Mon,  7 Oct 2024 18:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728327559; cv=fail; b=MtZn3O2Ujyj7QLnQ3DTsYKZ235ttYo7Kxlrn05q3WMkbP/L3UQX7kB8UuELIkt1p7yHEVf1st/oApZLq75C5uDqDFbp1eYenRoy77yqzA4MhEYbSMn8EB6WmHd9XpIATJApMRKPpFFjeOpAjYmU5kHDTJb0qejPPLEEIKBIgiT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728327559; c=relaxed/simple;
	bh=1Vyq3Mog59VCSX88LJiJgCrT/oLbptsDY17mZOvpnVY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V9kBFSbhbQv9i6liF1QOSTBt7z0+d6/zqg9b9ryZiz+ePPq3LOrUCCIfBnAJmLr9y8qCQMA84Ey9U1oBeSRmOjSGIL+bJNBbJr3Sb2/s7x2hepcyHd0dscc8QI1knko8cAtzGI2uiKANWvkHxZl4/tj8iPlWBFLaOVvBxTspayY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxmZ0Wv0; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxmZ0Wv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728327557; x=1759863557;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1Vyq3Mog59VCSX88LJiJgCrT/oLbptsDY17mZOvpnVY=;
  b=RxmZ0Wv0uOWPNw81hwpdUYxOO8eyyAoWUYx9nV5rhVpTpCYYMa6+rmIA
   JZgGISmVaroI8yIidX6UQtc9cAlyNI2ST1gd8rat2XTnLbyvP3QGkp/F1
   x7U7o2bVjIzVW7hnXfbU0n1XPzL/qtrmnZimeXb2sf9O38BT5T9Dhg4Eu
   Nd5fVRRsBUFiK0EoJaLOKBb9CO0VglRf+OXcGiht/5XRFTBrAE2mDDiVl
   SncBrhqGBgJ9vhw4/ZIAcXBrJyGHBevYbW2Nz0n2o05mZ74c1mJKrBWEo
   j108dhTtFT2OeIVihWZRYW7AvCgywb1BHB7XWBLwiWqQOkQHahpKlX9Gd
   w==;
X-CSE-ConnectionGUID: lzWk7ca9QQSld2G3vr9wug==
X-CSE-MsgGUID: 4qmXUjL+RgGWpeHZSU08YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38621253"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="38621253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 11:59:17 -0700
X-CSE-ConnectionGUID: zZYNSikVSHWUBCYprire2w==
X-CSE-MsgGUID: G15M1tpbQ5+CuLjr8SUL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75405657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Oct 2024 11:59:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 11:59:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 11:59:16 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 11:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCUcLXHnx3y3LLHvj7iIV2XUQXFPs9LSg2fsEEQWpDwlkOBG91uuZyhXcshKBi7D6WSAz18y2xvsIrrEr7KvOWJxElhVL0w51sMP3XYVw3yga2y4w4JNnu4de3uvXk/Izz3AgLd52YGQrEvSsSCZ6GCqx3tRPO+bVZqW/r3hTdr5YEfTQ9QTAkWPzCivZJYTux/JhzDxEWtRKBxvYkbzFFMBtKZ1X1xHKh+LZbU37UWLoZQ2GWzUWxry6egSjmsIUWlzUxNEAFR7yJNPi0kpBu0fRE2/RluMzBrU3sOYMtxwlllTSW/U/CkzF2cbEnKvvE0QAd5Xx776v9iw3e911w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vnlwq+exWAZMPimzILBpM1qtWk9dsHpwoncGP7zzGE=;
 b=ujYtADw0HmeZ+/ZDMbiAtULoNTsv3AYrFcdpYcL+7t0p2Aztwe0UJQBQa2R53ueHsekjsvZftDBydT8fDL1bri8McGNz64i9w2m+ko8EDQ6bcFXcIvkMWhU3Qz7w2hOPFexcnoYcpisMfigHbeME8Pd2eKedfnEkfi+w0YypjwfEuVNwc0yhWut3d+7Ohrwmy8Cmsun91HUHuwzfH1yxIDJbaKHJV/THcfnjZc19EItIgKjQiH/KBDo431fZfe4Ney4EwnHhw/Fe9OIhNbYoqB83JvjeOTOBsyOl7NsjN+6eJ0mB3+Qn6mSkH0XYQ+mWm6hrfDwkYUWV2oInrWZnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB7778.namprd11.prod.outlook.com (2603:10b6:930:76::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 18:59:10 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 18:59:10 +0000
Date: Mon, 7 Oct 2024 11:59:07 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dave Hansen <dave.hansen@intel.com>, Alexander Graf <graf@amazon.com>,
	"Dan Williams" <dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Michael Roth <michael.roth@amd.com>, <x86@kernel.org>,
	<aik@amd.com>, <elena.reshetova@intel.com>, <pgonda@google.com>
Subject: Re: [PATCH 4/4] configfs-tsm-report: Introduce TCB stability
 enumeration and watchdog
Message-ID: <67042f7b5203b_964f229455@dwillia2-xfh.jf.intel.com.notmuch>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618718534.516322.14804707935022669853.stgit@dwillia2-xfh.jf.intel.com>
 <665c5ae0-4b7c-4852-8995-255adf7b3a2f@amazon.com>
 <67005fcf46742_10a0a2945@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <5d1da767-491b-4077-b472-2cc3d73246d6@amazon.com>
 <94d6047e-3b7c-4bc1-819c-85c16ff85abf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <94d6047e-3b7c-4bc1-819c-85c16ff85abf@intel.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: f52dae6b-6a93-4006-ce55-08dce702205a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cO1ilTglt7mAkc9SKT9cDUTTZY6gfu4Pl4rpQ3Zz6/nSVnk1NQa5cQQGHIY9?=
 =?us-ascii?Q?gJAiQCoi+S0+MhtM3qfzkp/oipX0aQYU5/LwIBLFlrEAaCAK3bjH2SP+L5K/?=
 =?us-ascii?Q?D+S0C0Y1OTRfa2if2ysQlzUj221XCyUrLeTJKUk8lp29/M37SL/8/CjA5N8e?=
 =?us-ascii?Q?lQHASvPEH3zoI4XmyJrH1CNHBtOiSNwqQVCRvLp8HvEL96wA9YgCinVodAvK?=
 =?us-ascii?Q?W1R12k+XucmkJqdJdH+NJ7TiyCbC60XAAquOUCZOgDOK8S4Fe1Ce6wY6g1Iy?=
 =?us-ascii?Q?U5TvoZyT38YSLAHZsNn89cp7Jva1SrLfoD3KJlqnLwjZ8GNqqU6QzMASIxue?=
 =?us-ascii?Q?MeeQuaF5qzWxhw8j3PoY5xczLIaimHD4w/G/F1vbJMX4Z+LplE3xV9AYTj55?=
 =?us-ascii?Q?w1DmA9CcIL/j1Jl/4h0fnGl5+hgJV7bRTAx6tVMF0entGceyCa1+qLGaTj5C?=
 =?us-ascii?Q?TeCptQaGo4yRt/736McGrUisL2l52jz/6LRNajs1ydfzfbROsu9KT7ZwtUFR?=
 =?us-ascii?Q?5/9cCauJzzGc9Uu4IEJ4LARnSzzoDNinG7/DOoCN3I2zPNTFqkykOjXx/T8o?=
 =?us-ascii?Q?+5+IBUBnbjqndDLmis+Vn07NjkE9VRb+oaFs3aAY9G2Yi/NsPTYoEfXr7GST?=
 =?us-ascii?Q?lFjMkN2TmhymuFsAjegrkRCdCHperIMTNeloJD5jbPdKMitmyR8mSgKFdFCZ?=
 =?us-ascii?Q?dxcvLLFe1F1xzTOOpX0xaKUVb+IUUNTzBZv7Q5LhQmX7KPdNktjlh7P5ytrW?=
 =?us-ascii?Q?GNYI0uqTK/5ecvZcYCecTeEZB51o9r/j3iSOh7GOZHF7fmyblKpsXbd6DFhV?=
 =?us-ascii?Q?4IUl2Eb9ybvZITWXbKHa0ha+T6crVW66dKuJJSODdRF+IsiZqemig0+y88wK?=
 =?us-ascii?Q?BEt/jYsZJaJG1QJbiwuwW/yxNeYKKVs1foPkYytmXiCWJmPE72oAGnxSYDHT?=
 =?us-ascii?Q?+oLkdbf9WFwYnYNjlxTeqdK5vaMY+ZfUrzma9l5qx9oRKWw1I2GsIFSjTb2p?=
 =?us-ascii?Q?XSNqUHAzpQ/X9xRZR3IpRmwRs5va64BI8JUq4/o7/tx1gcwx1B9zCj82FW4U?=
 =?us-ascii?Q?sRsmVgjodMZ1lh3IrF3Zo1ypHWmXy7/BPLtG64uJTjL7HFApcfIfsZOOG0RK?=
 =?us-ascii?Q?VR8R3c9npA4i3LbtYvxWNCy4I6duaTCcdRiSLpFuzEdO4D+AZxvvx6YTd1Ee?=
 =?us-ascii?Q?VrM+ubi4m7s5yIZyuoBBhv50NZlu1CFrNOd5j35gfBRyJAMX6w6lC1D5SHXy?=
 =?us-ascii?Q?8nfXIo1NjHWXXa5ylhRFdPOmG7iMwLixwCYyQn9qMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?McOkMO61ZpIsQ05hUgEgDzh/wz+HGAzg8Z/0O1LQn7XQEr3IQEL3GUaIfxJd?=
 =?us-ascii?Q?QmZ7z9qPE3fSsrlhCKmb6j3NruUhX41E4yn3UMvLsXm5ju30DBovyrYiFkqd?=
 =?us-ascii?Q?i0LuIgoO6kRLdjOE5qZe2iCdsJ0iK5k+uVoizIEDA/v7oQtWdbjzC3uIkcH4?=
 =?us-ascii?Q?VoYxXlaCop0j/OwwMUkrtvH7x1Vt3fZ2hZ3M9Ek617Uw7qJ4GbWbB4y8Bme2?=
 =?us-ascii?Q?TUVuuFi5j+1hX6eRtbHEcjzHrURHBMA/PCi+LaxWc+dCyucaavolhblfACoH?=
 =?us-ascii?Q?NwMac3Prkyq0BDE3cPIKErZijLnqhLfNGp/0AfktQxVlI0bcwMz2f95o6iqd?=
 =?us-ascii?Q?XH7SHq8BdgJAjuVfk4nwHCmWqz3eHBOhkzuYJgCQDwMVxOhGJe59sd3oQHZa?=
 =?us-ascii?Q?Ej9MqI7uHD5rKeURYWK6RZfBjS0HU1cExNEqvLgrY021DNIa9GJ8on8Sozql?=
 =?us-ascii?Q?QmhI4s2LeEH3jjkY1KDiCBeboMWfx9loIX3JzpviKVWToPlywNCEOiytzAlW?=
 =?us-ascii?Q?UDa+k+Eyf6HOns9p8FfoTUYYqvDPLRZvM2rPvSJTBcJRJUN+ovz6RONzMRny?=
 =?us-ascii?Q?bRI9Xk5v21GGWmVtzV9Aw6A06e59g8IgCX1Z4+rDNICO4rZafoWsdJ8GdYJN?=
 =?us-ascii?Q?lIDpmtjGzyL+g0i0XUkDwpcR7qAGpwOpuJy5KM8JDdXFCejcZa6AD+ptOFBj?=
 =?us-ascii?Q?9JvOhB4OtdLgCio96kypeCggcqFOOJH9cRCdRLtBBnVZK9aOqzLSWvT1hf9K?=
 =?us-ascii?Q?1BNtbDD7UFYOr39qqZyfXBO5o9xwi2k9RwtVkJuCajTzhRFV14sPkf0z2zfz?=
 =?us-ascii?Q?InBOfT/XLT+tcnvK5GErk4GI+L+sh1qNbjHE0HA9lYf1sZaIQyeyZS2f57Wz?=
 =?us-ascii?Q?kghI6A5zHnq8c5x15TmKCBFEqZ+xWzU0otQVydzGGwSpj4LaDjhROjOyXW/Z?=
 =?us-ascii?Q?zncNhkXcZ6LsEs/Cp1TUED7XF/yZcwOY5ANlhl6+D3c5wbPLuVhHQmFjHweW?=
 =?us-ascii?Q?NaSC3k71Ku/yjOkuKdQhPJUqcbanhZhcwxFGyeTR0zmxWJwMrCuFLeINQQRH?=
 =?us-ascii?Q?UckRAiy4E8y8sjdVOeyvh/3U2lw/EBE1IZqz/EeOGCp1XVFcdz4rXZJGRFRf?=
 =?us-ascii?Q?0exxXsPUTPrmmQj0tfB26eDMDzwMULk05SqK4npOeRnt4LhuGuAGZgt4czXV?=
 =?us-ascii?Q?GF8CTS4g+J3u4lELtaUSUZqdP1r7Ub/jTa3oYfJkaYfx+7oJ4mRdVB2MMLg1?=
 =?us-ascii?Q?F+2rYCedewVLhg03DsymXC+Z4eVLzx33Je+k4fQcctYXswMKT4gpydx+CCJr?=
 =?us-ascii?Q?SxSD85pEJajbEa5woa4U3bdVBKhLd3iSXYLQHHSrWDfJUYOqdua58DYrgy1w?=
 =?us-ascii?Q?x1rzy20HJtK58G4RgooIWlSzi6pRqXhcNTRlFObr5/NHxRSyLO9uKd+srMv2?=
 =?us-ascii?Q?JnEidssTvQh528lcf/CxLsSJ1MT4kdJkASHxJSKHs6p2gbh9sPgxevTaXwgH?=
 =?us-ascii?Q?2nAKovthxxmO1iti7xWmvgQUlOMHGSk4YJ4bYSG+1B+tq2kWE76nAPfFFgU3?=
 =?us-ascii?Q?QVGICAknVMAHYFGr58+6n3DdF2rQntBBBIF9XpNNV///M8bPSYnNvlkaP0y2?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f52dae6b-6a93-4006-ce55-08dce702205a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 18:59:10.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNDtkWRTuH7KNlWIQGs+pjLTsMT/AafWGSPl2pJf38x/W2YvQ7aCQLUyAyPRVmyFtp0pXmLsFCstg0EA8RUdh+hbjGv9sbv0EilJqYGH5kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7778
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> I figured I'd just write down what I think is the contract that we're
> trending towards:
> 
>  1. Attestation includes a snapshot of the TCB, which includes the TDX
>     module and microcode versions.
>  2. There is a record made of each attestation which includes those
>     versions.
>  3. The machine owner is in control of the components of the TCB and may
>     upgrade the components to a later version at any time but can not
>     downgrade them.
>  4. If there is a security regression in a TCB component (say microcode
>     version $V), any TD that ever attested with microcode version $V or
>     any earlier version should be considered exposed to the regression.
>  5. The attestation record is the sole means of limiting the scope of
>     the impact from the regression.
> 
> The subtle part of that is that the attestation really isn't for a
> single version.  It's fundamentally for that version or any later future
> version of the machine owner's choosing.

So, in summary per Alex's last note: "there is no operationally viable
way to be a confidential computing tenant in the cloud and distrust
updates from the platform vendor deployed at will by the cloud
operator".
