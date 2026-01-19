Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421BE1A238C
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 00:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768782529; cv=fail; b=T6q85PKmSVK5anFBNFM+8B+BwJpp+vXx2T98KnJ+ToF9fEJgXz1nnoshHCP9BcQe174rE37pyQp66hzAx6eqdjr7IkaGyxdcNRsUKXqn4pUC1xyI3aCWjQDKd1S4tSrkFz3Vbf5AcpkoA8t2eftI2GBrDbFK3aFT1kPfQbJgFG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768782529; c=relaxed/simple;
	bh=4Uptxdv4Y11q29dt1eLDpdPtyAcjFn7QXMzSMGGnfLo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aesQUQb+QIaxyOkQdr7ZXZU5oVr7qHLIHXo3/0n0clQUqOp9JNNMEr9AMs+VfrPlt1SBKe90IuwfFqlOJALhxhKRzj85CuK87YMaMYLBXp/bpaDEHNOcB9qXSraT2b7TrKD51ohaYAXkQ79gujZ6oHwwlSF6RFfcdWRyQq9Qrd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOO0sQtE; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOO0sQtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768782528; x=1800318528;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4Uptxdv4Y11q29dt1eLDpdPtyAcjFn7QXMzSMGGnfLo=;
  b=TOO0sQtEaKDS1B6vkABsDj8bF0Z9lyQqE9K3J9vpDhDhs9XVzCHCIqR4
   5VRzA/EGI9sv6cBYebso4qJKhZiyCoBeOcpp6/gHtIx0s2y8IPj+BiUu3
   VdAJfP5rsF74/Yzk57HGCzoRHtnEqQlffXkIWngTGNtwvXYTSxzh94JQL
   NqM7i/Tw86E451oFfLvObzHb8zJhUQDtiv9P85SrDhuv36wuWWcVCY29T
   G670LLhx3qFKkKmO826rpArQoHGboCt/UqumF1j7eByBT1cNguZECxUNK
   4m/vZ5DEvUQzoSOML4C2opsgOYspsQpUN+Z0x91oOOdkOnMlNEcv107g/
   Q==;
X-CSE-ConnectionGUID: Qhm79HAkR+2ZYR08bjFUwQ==
X-CSE-MsgGUID: STkAHb8JTFGeej6csYn+JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69006134"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69006134"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:28:47 -0800
X-CSE-ConnectionGUID: E98BcQLgRaOM3fvLGeAuWA==
X-CSE-MsgGUID: mwuIP2crTKG5P07JBy7BlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205341159"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 16:28:46 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 16:28:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 18 Jan 2026 16:28:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 16:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMIx1OtULNVaV92qMQFZEL4H5D4ZWW1fhdsEwDUoxmBHCRqM9uc8L44TdMxy3wdJGGZ/Fl03gibOvyFlzkX1W1t24C+bAHA4dx7GfPvaNVBC8uyJ4pt4FozsZPNIlfwrj+Heo128inODXQrW4NI3IUl2P7Rcb7T26HpwrBX3vKCfm4nxYxOTqiAj0/vvBxrKOGNMhRRSObQqmYIzgSQC9cf+jUFeu8x4jCQwOdqICOdO5xHYRig1xpYNb3GIALiqW+o0tUqwbw33LsPTfb0ljsUFnA4MAcTyYb8LDqAdMryXNzRMeSmIXbcyl3tU1rLhppgPnU+o6farEPIWVAxdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rND2epMlusef0eE+S9horHfV3MphlvZs5xvEMV9fSRw=;
 b=EJQEKjL3GXn9UqHq8HoBJTA8yr1FqOy1DXfy5q9frvbAt1Ef9ioxrAKPS6zAjhBEOLbdA+WdQG7wiGCAJMbLU9msOepLRYCQswIQ4vDSqvZXJq5z5zx7iiLVJuVSfLNsTvGOsbfd7tCS3YoIStqQMYsh51Ij9qwPMnUrQ95+0G9fOCGusJ3cxRGfNkwTotD0arSgbdptLUUTz3d0q3hixRsdrNZvlWiwtA4sbwxZ6dIukIUwvYaCRVj1cDQd7kS+vnSEIk3/gE6ouimTr5iYHZkn+q5ZF6oWv3Sg0oIE0DL3E6aPT5e9UlrAhm+xDt7VUfphvePWXZlTyeH8o7hECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 00:28:42 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 00:28:41 +0000
Date: Mon, 19 Jan 2026 08:28:27 +0800
From: Chao Gao <chao.gao@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>,
	"Farrah Chen" <farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 17/21] x86/virt/seamldr: Install a new TDX Module
Message-ID: <aW16qxPrMjkSLJe9@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-18-chao.gao@intel.com>
 <aWiGA7sOPEs+7ifs@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWiGA7sOPEs+7ifs@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: KL1PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:820:5::21) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5850a245-bb2e-45ff-d8e0-08de56f1b289
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jtwwmfAyUE0tjkJq9bpzMA0AdrMBaTAY0mh7skcdqpJyFr5AxL1qDJh6TyuD?=
 =?us-ascii?Q?+B4O3sZIEp+mu4OBSl3WB82yOxBF9ovb8cfPDNqlR36f2OFz6SoM1I+SsUFZ?=
 =?us-ascii?Q?Q93Uruc3M3kDB64F1Pjvb2h4o0d1tfwHtQHbagJCOLGsa8rOkklRHLu1xP2v?=
 =?us-ascii?Q?gmaXshnBP+liis4x9jc3IWd7EuTvmomnwQAQ8AEl0m6REFZH+8xXXR4YxfHn?=
 =?us-ascii?Q?5ykJlZwYdKAJM610s37LIx9ibFjiJmzGjhM9G5F5XEoftiqaNRrUSM0QJy3p?=
 =?us-ascii?Q?TMZE6kSo/mx4K3lyGmkUHLZZSk667bqUzE/6ijI+ocZvdvb9geP09Wxg/IWj?=
 =?us-ascii?Q?kXne5WJudCDuVyi1fHD8Ozaxf8OeiLuWWjs3x9GQWwcltblQ4Vj6O7ZnG7Te?=
 =?us-ascii?Q?4OZ2tKtJ4S98LolK54BIK8RhljAKEQuHI6ORb3QSW6RMrQ2qADjbvyqIvvSq?=
 =?us-ascii?Q?ohrueMoYGyduVlHXYaWgOafiCu65wOtBKmRnL0eLLPS4PcK/bOipttH+eNjF?=
 =?us-ascii?Q?EBbdRlpwqZ0NYOmb0W7SLFd7hpq8tY4xO8rP1SKQLPL/j65MMNrRcFizs/EL?=
 =?us-ascii?Q?OTS7yfp95pcBmv2enUqRXiGC+vIX0pmKyde0zwfMDfZbq4bbWMmwuylSVtW/?=
 =?us-ascii?Q?5ElvtY+QuRn9kQrP6FaiDdUJWMW/n1q7qMrshVfDr4qtYHvIYDaXhN9mExwa?=
 =?us-ascii?Q?fP0ElgAl/edl3i09RSXvbUEasTlKCstWQkqzNYnTJg8Yggum0hSkH8uomhc1?=
 =?us-ascii?Q?OrmIoOCZPkIkbSO0B9mB+AXFJ5u6xjvEYtaqdFAVQeqs2/eIhPOgB2mNafzN?=
 =?us-ascii?Q?t5KDYalOJ9dEb66H79CiSgzzkYC74GUj6OGACuyi7o1Y6LTKuRPb/FRmRgsx?=
 =?us-ascii?Q?Jj6sn6a0GCTSdBPC8yJboegfQ4G0iaat9/96gNmmuRbrWUl7Ofy+ZDFXiXTd?=
 =?us-ascii?Q?gBp/Y3CYlzHWxiUI9Znm1VP+jz7ZZGZ0A13guIZuwWOtZFECGWnajmenaTpV?=
 =?us-ascii?Q?KO6USnokGK0+zuFnSQtvbKQFkcNODWgO2g1BncTGqh6hR/a1J17cGwVNYbjQ?=
 =?us-ascii?Q?Rj5AT3O1yS8nx5Mp12YweODSSidapgZWrHWpSxFU0VyDhts3CiIVU0XRPiKR?=
 =?us-ascii?Q?d0cxfluB1tQZOcL502zsMXZYWABmuAGfxQbNNcCOmPcF6+nb79ZFSyi0sUjY?=
 =?us-ascii?Q?ntuU+FWgB6c+5239yd2lZKcm+4KwbKeyYe9rDBBjxbgbXqxRmku8fhXNNrrR?=
 =?us-ascii?Q?4te5DhPDoHTgrnypI1U6Iq3XtDrsTvgENkgGwc6BhVkn54/0P0Nd3PoZVn2V?=
 =?us-ascii?Q?U+FNtTCjntq896kJPwoebZZcKeVpp+Gokv63VCB4iw4psXZDycY+4Qy1F6LR?=
 =?us-ascii?Q?d5birKeRgx3z/ynYKOIVA45yJ1fS2m1p+76jGGibt+SDIcKYT+YX6zO4E1fK?=
 =?us-ascii?Q?PpLBiKGeCDCuJeff4zGC/YClGHDTnJ4A8PbgkdC6jEhAIr1MrDoSXSs4hXtt?=
 =?us-ascii?Q?EYXonZyuCXZ8j6epjTpRvkqIqMFIy0enyWGuu5lmv9I31JGyA5snuxoiSmWk?=
 =?us-ascii?Q?1ndoVBR1j02e3pgZpG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cLv9+/NREeBqjSeZfhhPOonXwPFkseoYhPu/Q0wUkCin92VKm/Smkr1j9ERv?=
 =?us-ascii?Q?35TEyMsX1pppqHEXG/QoLzyoTRuDEH9s0I/gg7juf3t/sRn56gBBvsyRnFBY?=
 =?us-ascii?Q?R50nMc5yVxB2IO5m9gHRVFwEmdj7KerCeDORXFfJAy7whnlZQ2f1wWujuN3O?=
 =?us-ascii?Q?2kfja8jogDsyhccduJfy/JM6Od3vgRp2gBlNgPkTNb5/PSyb+ur/6Hs1BT+w?=
 =?us-ascii?Q?YgBpeWuJEfdhnjOa4jtSUoZNZFzpGLeUaDSwBQM2MLdoeURF9clCX8mZNJkG?=
 =?us-ascii?Q?5T1/Owu0WoTka2m8JH+JITuzWz+9sl5M73H3GsRV4ZIpJL8sOrr0F7K1j1yO?=
 =?us-ascii?Q?jH8ZPe2vv/pFznPwOgYPddSdIEfFf/hP2FHWYKj3hkFqSfmfS4XD4GTx+sUz?=
 =?us-ascii?Q?lvS2Ufru7ZnaM4HF0FZbHLQUnAjstrWryI2PDc7I2PZJ7JieZiWNwYwuPK0j?=
 =?us-ascii?Q?37SiDUOWBMIHPaPfWv02xyhrmQAvW641oeOEF6QWqhDP4sh2I6fTDBwMvQIW?=
 =?us-ascii?Q?5p6J919u1e2MtSa1m4Jd07p/Od+SUa8vaOIFUgW63igxyFogesilEqk4hA/+?=
 =?us-ascii?Q?GlmxyGrvpXhmo0sVgIgx63T9HZ8VhWovoqVIyfhqiGslkf9jzYaDcw4XFHTf?=
 =?us-ascii?Q?VPz7ua6ym30xJ/ePSRhS2uH9XL7bN0BNSVhuscFD4vuVNfsYgTVOAICkVeSj?=
 =?us-ascii?Q?348ePlkFqyBzSx/BGCnoNjXMaUd4L7jZZqXuDDlDphMY0LyBdqThwTec2WcP?=
 =?us-ascii?Q?wLqXMBFNt9b9+6UHtc45DqpOn78tqvE4z3AGE1+HnadMSS1nmlDryHhsp5Rq?=
 =?us-ascii?Q?TQgvkasjExNVaMbqc99ixnR6t9R4DvdQxzGRYcSdVogT1ERS9kDv/1eDs1jq?=
 =?us-ascii?Q?PhQQ4YFP1Cg8CnKbvzJc4LrQ87t6BgoUUzRWBs/0k+KJE1FHckzVPeIC/rOD?=
 =?us-ascii?Q?cecq0g6eI/aoMcu0a8hDcFFMN6YJi/CryC301q4rVmCSMRs/sv+hawF4f/5M?=
 =?us-ascii?Q?on64Y68TOxYECTVGT3i8Y8SEJSOo0Tk2zfeYWn1LwrJJfHgExk5z8t4xkq6B?=
 =?us-ascii?Q?tLdLvYVTI3/qIquB4wPhJwSSFTG/G5pO3LM6dRzU/fpuYwZglaNXZmJ2X2UV?=
 =?us-ascii?Q?aU1DZJULml3HhIKWyijyyZ1vjdhDpgn6+Qb8g3iyICqSYJj6XVYaRxt1i0TF?=
 =?us-ascii?Q?jgMSPbQ4umQ2iWhUWO7/GyYRUpEhZ8S9wj6vZzodLAkCaXKjDbYqR8liyz5h?=
 =?us-ascii?Q?naIRJRIS3F+qPMaruseGPq1by9E0aFBdGRpzWvLBcjAYZ1QtVzJQ0NA92fFc?=
 =?us-ascii?Q?TnBGkI3iEXBPVRFSdVe9GF0nKvJXxyQFw/fydTc37lXhMaa0z3X2OEAHxDoV?=
 =?us-ascii?Q?hZyPrOCUyesaHr0GzwZunb8EOKtqckh99Pz194btqcV7bjXd5yJO/uS2Fkkq?=
 =?us-ascii?Q?5WXyeJEzW0EXm6E7Ws7GoAxirktO+0fNQJlwIEts+yHT81WBvJeV9nyRR6Yd?=
 =?us-ascii?Q?pUJ3pQ4rDBX3KHEeumJ57P1lMuZ0b/JTCV1JkGrTDFwK/pvfC0FU7pf5rE3f?=
 =?us-ascii?Q?zq+d+gAYBQhES8sBh5C8ffCuyTLrzUgCEzhPQ+ed3xowNMefCCTNJ0mutYQH?=
 =?us-ascii?Q?NCqT6YNwOIV5hk/VwM8d0FqcWLdkOTEMhvIO5ZdL0XtMffevs+B4fQOaN9UF?=
 =?us-ascii?Q?z33Vddb+d48nXC0rMPqCkvZmQVyB/qaddn5pBoyXvMCsN8o282KWpEooKra6?=
 =?us-ascii?Q?08IPhRszmg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5850a245-bb2e-45ff-d8e0-08de56f1b289
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 00:28:41.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn7q56QtdqDdU9f3vdbEOuCyurVo+Ywqol5AEai9MhgQQX9VFblk+9j1OuSjGJebI6FPa+DuESCqdoPZkAJvGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-OriginatorOrg: intel.com

On Thu, Jan 15, 2026 at 02:15:31PM +0800, Xu Yilun wrote:
>>  static int do_seamldr_install_module(void *params)
>>  {
>> +	struct tdx_module_args args = { .rcx = __pa(params) };
>
>Is it better we put the definition, or at least the value assignment in
>case TDP_CPU_INSTALL? This pattern always appears here for a seamcall
>wrapper but this function is far more complex than that.
>
>And the .rcx = __pa(params) also confuse me a bit. Better we name it
>e.g. seamldr_params which looks reasonable for seamcall arguments.

Sounds good. I will do the following changes:

diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
index a0b59d6c53c9..f2933c7e3852 100644
--- a/arch/x86/virt/vmx/tdx/seamldr.c
+++ b/arch/x86/virt/vmx/tdx/seamldr.c
@@ -313,10 +313,10 @@ static void print_update_failure_message(void)
  * See multi_cpu_stop() from where this multi-cpu state-machine was
  * adopted, and the rationale for touch_nmi_watchdog()
  */
-static int do_seamldr_install_module(void *params)
+static int do_seamldr_install_module(void *seamldr_params)
 {
-	struct tdx_module_args args = { .rcx = __pa(params) };
	enum tdp_state newstate, curstate = TDP_START;
+	struct tdx_module_args args = {};
	int cpu = smp_processor_id();
	bool primary;
	int ret = 0;
@@ -336,6 +336,7 @@ static int do_seamldr_install_module(void *params)
					ret = tdx_module_shutdown();
				break;
			case TDP_CPU_INSTALL:
+				args.rcx = __pa(seamldr_params);
				scoped_guard(raw_spinlock, &seamldr_lock)
					ret = seamldr_call(P_SEAMLDR_INSTALL, &args);
				break;
