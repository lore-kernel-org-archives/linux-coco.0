Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645631BE851
	for <linux-coco@lists.linux.dev>; Tue,  1 Oct 2024 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727769419; cv=fail; b=fWWOfIC6eUBPWItefZHoGzM4coEuoTZzwkx/RaMdUocNGAkAguIzmRmuwYtW8Uc0hAx+IPPZuq0nJ8v9dTXqMhP1vWq1gA+iAgb/lfEvcf13lpNsu0u/JDlVnpdjQSSK8c/EYgfjW+oKHwuNQ0iauF9LM9ze34VHDupV3Y2wya0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727769419; c=relaxed/simple;
	bh=eHe3u+EJTS3gKc4vSXpPKyhaG5f1+hp6NaA2Mb93cg4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fd53fEjTA0LtHA6sdgQ7As34zJtNbN6PQPYoM2WsTwaPDKNc3MI+ht9g8W0aP6oh/77N5bHc6OhLSVuLysmH/UskWwvMp4XYPy0xmuoCY8csvBedBa6nutlighwg6EWj2II+i1I2ZGmLi3J55wcdHGDrD4CcdFXxJBZMvMJLamY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeBV0HZI; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeBV0HZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727769417; x=1759305417;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eHe3u+EJTS3gKc4vSXpPKyhaG5f1+hp6NaA2Mb93cg4=;
  b=WeBV0HZId6Jj+XEy6hLVW+rvv2CSE19g9dQCAKN6Iu185Nu065hhzRYP
   /KQACp7BrX/8fi4kXjmK//qK2BgocbNzKz4Tk7nc3ysoKGdJj+3Tr+XTt
   nkwZzz4OQ0SiuLBu90TgAv6MBMhSPJ0rVdnYrWf+uWpKOPql53PaKU/yn
   HkZ46kf5402dtbIaYOeHyVhyy607VrXMXw5HU0fp/a9oQQsHRyhEgIPFY
   NyutnmNOvOYS3ewKA7uTjW4rqsN/ntgRE4h215gKzsC+sq2/SOAQvlD2n
   2Qvn7fe3O+y8Vz07xV7XMn44f6Yd4PGIZ8q1vJYphK6uoMabLPGjNkz0Q
   A==;
X-CSE-ConnectionGUID: sMx1aCPBTCKCN+GI26pbbQ==
X-CSE-MsgGUID: dDusFKdKTqeXJci34g7d7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37562606"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37562606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:56:56 -0700
X-CSE-ConnectionGUID: ImYz/nnORV+qFCbmmbOvPA==
X-CSE-MsgGUID: 7otHEnNQRpW0X6DE/fuiwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78310790"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Oct 2024 00:56:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 00:56:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 00:56:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 00:56:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4e0KZx64hCfjncc0gj0cNg523IW1YhrYQkjeSYxP4u2CLaoxbdx1MOHf/okxjAmNcMuqcziEF/dKnZ4nkUEK9turxelFryxzwt8T8JMc6Bfe+bdUrQ97XGKasqX3MulVH2MjO0wU8qZLrRFAazVtekw2nnX1X56H24WuVegI9DcVZp6Zppd/dTAfo5ieK83Vebj3/tT7CFQGFG8Mx+VcKQ34X9hFp+ckeeTGP8ntxLhHCfzp/DYu9xcBoaQCgk53md5AgdBqqkGa4NN3i12XHTiML83cD5T+nMnIcxqs7rgTTSFeCm3rfcjGVkQy7sn3sou8OyMixF+IwbHjCBFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPw1ou13LDz7HYo7VQLI1seOVBkEJXcENtsA7kv0og8=;
 b=r6Y/TrSsRM8Trw6EPYth7YAfPfL+MWv3o1ywrv3G8eZkQ9LfoPdOWrG1B/+OUmlxWZIksy8SKDXQdvy3DOoZdn5ovQ5tHzyKOGQMiDhgjrfr3wwkO/WUAdjdPYU6emV5by/AD9JZFdLrA+ZXHXL5RTNw3o8WVIJgVM7/Y00TRwTtPYB70OW6faFgp5xicV75kpJT+W1ZsMOnbTXiIGPy36v77ZgLeOGsYJcnVrdGOv/qSH6FL3rDrwQmkL2j//ku6KMX+dvf/DHM4TzsXcn1NifRfJRnORV09zlvvtpddu0d4zmBbPYmOJ4FkVkcLS2KtI6YnHIMjcKwDBBMtRenTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Tue, 1 Oct
 2024 07:56:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 07:56:54 +0000
Date: Tue, 1 Oct 2024 00:56:51 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Kai Huang <kai.huang@intel.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <aik@amd.com>,
	<elena.reshetova@intel.com>, <pgonda@google.com>
Subject: Re: [PATCH 3/4] x86/tdx: Introduce guest global metadata retrieval
 infrastructure
Message-ID: <66fbab43963ad_964f229422@dwillia2-xfh.jf.intel.com.notmuch>
References: <172618715121.516322.9909313629463814714.stgit@dwillia2-xfh.jf.intel.com>
 <172618717675.516322.6087817418162288917.stgit@dwillia2-xfh.jf.intel.com>
 <fg4oibulhylpceczrts2wt4d6cbvfwnyu2gnji63u3hx43eeks@ksdkcowisam3>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fg4oibulhylpceczrts2wt4d6cbvfwnyu2gnji63u3hx43eeks@ksdkcowisam3>
X-ClientProxiedBy: MW3PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:303:2a::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|LV3PR11MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: d831344c-b964-4923-4063-08dce1ee9d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1W71xQPimzDWn+dha64cHR6Uuix17c7fHC9fs2N4fQBSHNWjifn5421OJM7u?=
 =?us-ascii?Q?gOQptUIzziKQL8AQ/atI9DfzqiMZHQae9WOHd3q197O0QKaSk6QDxFcYnVRm?=
 =?us-ascii?Q?0DNuelH8MSl9+/XyTERnyMjzIFg4NPnBUUKGXqZoSvmW3wVFs7YtwcsDZh8P?=
 =?us-ascii?Q?dvIGbKvjhWVIMTenPSm0hKNJJHP59xMRxkFkbNMEgQ7RWezpd2PHYAYocXeY?=
 =?us-ascii?Q?oF0bi0eA60ItHUpX9LR/JdtogLQk/clmuU9kUjFysmPP/WY3ZEtmXB5m7dVL?=
 =?us-ascii?Q?V0lvTaLQj/wA+E4JsSEm/WKIbKpguIz1vqUKmLANM5tYzVa7a+ephTFQH4L2?=
 =?us-ascii?Q?GoJGAxKmwlaomd0bD7kO8QeRgmire54LlKLqqrAfEx7ZVAs4eYL9+WHh5reZ?=
 =?us-ascii?Q?ICPF1Gca7TfCTGUvYgtbyGiHV7I+p5OMfiuIr9SLaa7rLpTQ+l8rmkBrbdbe?=
 =?us-ascii?Q?ONzyj4mBrunDA3ONV4AKJ7jCU4ztqvgsIMpFSdegbpKHMqTiDEQOTwMBdhVF?=
 =?us-ascii?Q?maNzpgoPwuUlESUo1n1A0rStEo7OxhMo9LFBXrVh3dL19X80qasb97zTIQQU?=
 =?us-ascii?Q?AoQoHgoyleEw4vnM5/bu8xgrDVyWh7Ak93K32ZaOKysCz3xi34AuSuQAsfKP?=
 =?us-ascii?Q?RiD6LqJ0cKSV8HOWp9KcVnnIBy9gEfbAR3mpV5JjXXs9IFpLcZN/Ye7NzWKE?=
 =?us-ascii?Q?BzNUNeSDe0EcK0xaTmyAtUVhEy7Cnbl2jAEA09608Y40rLSW0RM89ULW7QY/?=
 =?us-ascii?Q?4xWwb33yE4Q0FZcsarY2iM1QSsH+/UELlFXkmVwdO9uXpMDtgcahWQ0uae9A?=
 =?us-ascii?Q?mDQ7DNc1uzhZm7XvRbwwE+7/z3VtR9YwD6SAoXhN04yUWB2ZgmKvsDXHBZBW?=
 =?us-ascii?Q?oDxon998Kn4+ykx7ilfnBkbVN/HFoQUgfcPrfsETJI8M4qKhcXh1JkIDqbJW?=
 =?us-ascii?Q?O4OvuwQV8HTUXaUpCtWWnNrBTK52FLbnN5W8qEvridx4v7MoAQVKPc5qSd9t?=
 =?us-ascii?Q?FG45bNkSnx//OWBmnT5EYUKsYlpFX37k3dyDUWV+ghHIR4ofEN/ETgELqFRe?=
 =?us-ascii?Q?yXMprtSwVEe5ea+2JHFdCliUiJJFWVuNWHGdC0vlacZ/TKZ2CYZOsusPVhtR?=
 =?us-ascii?Q?hnhIpRL+WCmhMK6+JOfFUxyAouG8t6C2KzsgrGP+x2zZS3wQT+wa/m5BUDPr?=
 =?us-ascii?Q?4InprB+hOlRrf6GlMgtWzznrr5EScykvFQAP8U6BFeddYLYv0c138oQP3s4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OfpGRiO+pq6pZy5nKIe0hpT/g+GujgQ5l025FFdJV4W2b5GpAo+7MYFdQn74?=
 =?us-ascii?Q?TGro3qzg9lgI8PmPfhtz9QT57LBRxu1lQobLC8jmfqJ+kjGi9k1LysW4zaMu?=
 =?us-ascii?Q?EHPml9I74tSSoheoJ2NGZCRHxleuHsyC31s1ErhIOCrpS9gJ+hGHoRGyF22K?=
 =?us-ascii?Q?FiW6fwSopawkpQ6B+II9bVSy6U0OZy2nu9efaPEQc5JlW9/bt+IOgUNppK6b?=
 =?us-ascii?Q?R12WsFRBYyMO6DtLqtrfTai117jWDVsDeAzd0rQFvfsbs+znLmQzxl5pqBea?=
 =?us-ascii?Q?qJqVO8YvueSzyxn9r/jj7rwXjnpFX0BVbPQqy8//hKP1HDGCZzEjY5b6h/rO?=
 =?us-ascii?Q?bRgTacYDuNS1dJEyDylzSCWl4Q2JFazYKYYTYMwdHSS0ROsjBhlKAqs+7Cfd?=
 =?us-ascii?Q?lQkOlM6gmXqnxxk4q7AJ1WVoetHsYpRQvRZ6FdGsOfXsNx3kGebd2qRVLTNQ?=
 =?us-ascii?Q?IUc1ohPfj+G4vrkF+CzRXEL0giENLZZbb4XOakpgwnf3DgNfFd8d/VaicKaD?=
 =?us-ascii?Q?35Gr5NZFVsfKFAKNKxPcAEET6MgqyZoEEVPGn7GWDHVi6uyQKJ/x8UIUdtqT?=
 =?us-ascii?Q?NiU5Y2Zp5Mk2NYQ7ITAC6U34WnjOnoyctkFkhpwOlXSbArhL2MJU3KPiPjLO?=
 =?us-ascii?Q?Clmk25lQrwYZDHjZOI7Q7AYKNaQw0Q+7R8bTrgBydbLgvGuDrf35BlYx4lAv?=
 =?us-ascii?Q?E5bnLiyHK3RMoUG1BsVva+oktq1pXzdPysLX7BVckoN633VDW7fPyuI/fUka?=
 =?us-ascii?Q?Tx3mvX2GI2rno6HHTN780JSZKzID47Yq3j8Rhuf1747Xdok10jsjtTS5Rp9G?=
 =?us-ascii?Q?WOk3RRVh7cYcwgkMmCgTXDLRvx/H0+LKH30/3KsIacRBRARx7Am858L4dTuQ?=
 =?us-ascii?Q?vIOYsZpmYoPvFqUw+T3etske9SfDX8X+O3iViW+VeXCiYug8lQ6V94YETQ0H?=
 =?us-ascii?Q?l6zhUFH9QhoVdOKJnG9lDThdgJC+MWYnIkGwp7BR6wm9X8KdezRrG4aBZewy?=
 =?us-ascii?Q?lGVEnisdwGGp8SBCMGTY0YEWguHn9n4egYSkhqX4/82iYN4HxFO90NcIxD5q?=
 =?us-ascii?Q?ySpHIN2/yArz4vH+Xzt9dptFCH6utav+WoiJvn2TXoC/wvH5P/+xN4j0myoa?=
 =?us-ascii?Q?tpPhAIgCpO/dnwtzKWiZurBP4SYMQw3RtlmimaafIan//kmgrzXjkINx7Rys?=
 =?us-ascii?Q?joHbg+1zj1zJnPT3tGdTIhJ8HKCbO9ctYb/B1o55asZBqvSIuIwa+SPfwfc8?=
 =?us-ascii?Q?itATEdCLT6XeONmDaVvPAt4IKg3K/h8wLpzLaIM8C4eOuNB0NEPJBjbAiWVh?=
 =?us-ascii?Q?54l9tSQ1Kyo9GPazZJ/iHJQqkNqOhex0uyORCHeGU85O1plTitTKq6PQugTB?=
 =?us-ascii?Q?gG6vBjZGy6L7wQIWg6K/YR44LMECCAwJJpsKOJrc5KoIAtbqmaJsYUlHx0Yy?=
 =?us-ascii?Q?cLWa84+B2Ohpgr6pP7nI7irCHJJ/U3SNM4az9U0zXJ1nV7DXAIdik22nNtaF?=
 =?us-ascii?Q?ROzFS5mznYAnRxCoaQW3ON7YRuGofaBcqyIihF2OYK4Uc5bAkxJk9J61U2eO?=
 =?us-ascii?Q?/0Mc++hIVnq96/KyL+aJl+ERwpzep37PfvkZk2j38sles9J4EemanzWB/dj0?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d831344c-b964-4923-4063-08dce1ee9d5d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 07:56:53.9419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tURbbEmPQugRLWiu3N1rISzrCpmyGBJt4SFgCnBbFacnEFObJBLAQpIZmMUa+uPmd7Q39pfUG1f7AGWl/d9EcNJsYd4WcFEhC9bseKfLef0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8695
X-OriginatorOrg: intel.com

Kirill A. Shutemov wrote:
> On Thu, Sep 12, 2024 at 05:26:18PM -0700, Dan Williams wrote:
> > Similar to the host side [1], build some macro helpers for retrieving
> > global metadata fields.
> > 
> > This infrastructure is overkill if the guest only ends up consuming a
> > few fields of metadata. Some of the overhead reduced later by
> > refactoring the TDH_SYS_RD (host side) infrastructure to optionally
> > support TDG_SYS_RD (guest side) as an alternate low-level transport.
> > 
> > If this moves forward, expect that it is rebased on the host side
> > metadata patches to share infrastructure.
> 
> This patchset already introduces helper for TDG_VM_RD. The same can be
> done for TDG_SYS_RD.
> 
> https://lore.kernel.org/all/20240828093505.2359947-1-kirill.shutemov@linux.intel.com/

Shouldn't this be reworked to use the same metadata reading
infrastructure as Kai is introducing for the host side?

http://lore.kernel.org/1b14e28b-972e-4277-898f-8e2dcb77e144@intel.com
