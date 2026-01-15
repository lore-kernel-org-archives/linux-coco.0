Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E82236EB
	for <linux-coco@lists.linux.dev>; Thu, 15 Jan 2026 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461966; cv=fail; b=kVOrPiFAsGdVWw66SRbh6S7eAfKM/mhnvJCx85eVympCrp1zS5BAJOcH3aOcJsGyvKcnTnfYhlkNunDs8iidR/fOwVgFerRd00iybk580WASDGEgYkV8BxX2iIhu+YKEAKTFExDj9EbX4cnP3s1L866NUNwJwvrsk8CBe/6drjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461966; c=relaxed/simple;
	bh=bRSzYJ5UQNFNW1CgaeDm3HACLU0AttQAlOwOTdscevQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fek51A9MMWjM4vtUDVQxZTCvkoV5XUPQU4U0MckMlr0ig1ipYhnuKQp7tsRcXDsN+PAYP5ZU7yb0FPMJuM4civRNxXroGlixVdIOL4Baxv4+RqHtf+dzJ5Gb7ZaLrbsqW9HyMpQaESeLYjduXRFAfnfmW3FoyXDlzrqUtdkMxXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbUv+KMH; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbUv+KMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768461965; x=1799997965;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bRSzYJ5UQNFNW1CgaeDm3HACLU0AttQAlOwOTdscevQ=;
  b=YbUv+KMHfUgqhevaWYgYZiMhTufeI0Jusf2fyAWlo4Vo54RDuB4MeawR
   e9KEeu7o/oizqEQ8NcAaMCKQhWBu83rS/7LAVcOe6ivXccWOoCMHXoPjX
   prrm98SUjjvfYsF5WvZgs582YHqvyhydlPtmPg+0Um08f+jl+8GoVrmmO
   xMkSKESCxfcS5EMxaTuEFkdwIZ4c4l2zJmGE/g+SQfeiqxzAynsCkDeg6
   M/vJueF3LBpoCEaHMnWMa3eic7qld0keOBvSbBZZ9rQdtVyHvVJh6zl9g
   bm1qjD6mh9eVBiltIwNJwxTp8qVFEzZ0Cw/uAJ3nrbFPKo2SXwWul4UMz
   w==;
X-CSE-ConnectionGUID: NHceclGqRpelYvfyoVsWUQ==
X-CSE-MsgGUID: d3/n2f3fRCqV9vS9cbTtcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="57319087"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="57319087"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:26:03 -0800
X-CSE-ConnectionGUID: t6qFAz1oQVyzAU3OHSulYA==
X-CSE-MsgGUID: R56cCk0IRaKSlnAyNhAAyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="236141307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 23:26:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:26:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 23:26:02 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 23:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvHarONfOcuVk1p0NqRAbOtEI/XG/+Ma/zTPQVGm1ulAjgyyarkYZfUKDT/VYxjZgt+D3rrlK/AuwwR+zgMhDx/89WRo61d4F0BLMa4QGoj2m+tt6ub4cJ8WIMw5/C4inGSA0bGyxPOiJtA7dr1BeF/pA53MuB7qSNuEGtuRQiItwg4+O77BkJBTdOklqmDdiiWqejjzW0waHvjyxvZ0NNPlly+MaxLeYhxfMA5xwOwbGzQmzH/jaLAJl20j/EQFaZOTvib7V0j8AwVwmAiZwUjzWIG+QQft1F5k8JYRBRBn9RKvPE6b6p3qkRtBQRmhLbyoKAiCCjLrPxAsUFHbHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBtZxiHbe3qPghFeZLj4RfY3Y0lYIxQEzBGTDgxdSqI=;
 b=uSOKSPrUaxp1dY2XljKF2RwyIIUVynnnpABPzA+FkAYp8YWzQPRWzeYCOaNqIgTrFb22njj97nQ/Gt3LVz+h/otP3hdjDR+7mucW6v3l84/NT/t1rrH5V2I8/q1MOUgCcGrh6KUGO8mhJp74ZlKt7OnuzEzRICV+Z7/T2KmdZwV1ZWAJbcXw7PsP+YMCOvM0yL1SLJUga9vJF7Pi55nwDSj7latFIoD2h6ERan+gAasST307REZ1I0sH5gZf01crqrzeH5EfZXpUmjwXsVcjKeVsnYk6xcWGvmmLVr0mZlBjtQ/8rpTAaGyWgV2Tt0cUK3KeuNnBlCLLFJoVtnYHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DS4PPF11E6CAE14.namprd11.prod.outlook.com (2603:10b6:f:fc02::c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:26:00 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 07:25:59 +0000
Date: Thu, 15 Jan 2026 15:25:47 +0800
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
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
Message-ID: <aWiWe4h6wxpSKcFJ@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
 <aWYVCImRjhIogogF@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWYVCImRjhIogogF@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: SG2PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::31) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DS4PPF11E6CAE14:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b703d2-f5a4-4a19-b181-08de540754c8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QvZa62LtrkzXiItTRC9rj7Y4sd1YevasqSCWWWiq71ftWbclILSel2VRdph+?=
 =?us-ascii?Q?tEttCcOmF17Tnm9burrtuFrwBs8ieate/cZAx01infcqvRQfcT+nGWp/8NFs?=
 =?us-ascii?Q?jgxSNtSRaAUUYggfQL3MksM1oQjHlJiFC5BOnRGXD2yZYZ/MVfXB7LLlGZVJ?=
 =?us-ascii?Q?hpTpWKc23uNBgoPgjPzAGkd33CEUQv15XDPlOaaOIhUnMtEW9Fiswvra4nhj?=
 =?us-ascii?Q?Zw/RSPBt4THbzurkTcK9OmX9DWvA1fyR2Ct4n8/JUmJcibYF1oS4DVQDlcPL?=
 =?us-ascii?Q?2heZocUXjMF0u4wR3JuHO3xJVNDc44RvIH7f8zQcyymI6sagliamsWqJ7IIH?=
 =?us-ascii?Q?FXRWS7FkRSrztjMJvFArMihfuNJUHE3DwYjxx14S4GGyHx2R7+s6DARabzGC?=
 =?us-ascii?Q?nLL+oQZt+KT9+y4I62MDy79UBdKKUyY2TdIqo5fAGk7nxic+xzIcYAgjugJt?=
 =?us-ascii?Q?ee0Zj/8XnqYrX8jXkHNxOczi8GIJai7FUukc9PykondEMl/Y5jTKCdHs2gWw?=
 =?us-ascii?Q?znnxMJEpd80COI/z7E6ljDRWtV0QsyBuAUeEFrPGxBY5whbM91muXWelZNT1?=
 =?us-ascii?Q?pO65zukPI9kJL6zTsBc78Kyc2GEzRAzPBMz06ZhjlKWELjdHIXbzpKYY5xUB?=
 =?us-ascii?Q?saK42RpBKuzv4qRAdGgkhaWn0FNPIABRGhH3ANTw7y0RJGOwhpNnXL/uWek9?=
 =?us-ascii?Q?JVgpES0kWzyfAtfqV+2xeZ//aJNt7k9/cQiDSigy41QyKSy+hfSgdi9pmh+E?=
 =?us-ascii?Q?aQ2NomsRpche8fu4hGomGsKcAGKRW/FbgtqoCTG3fzjsyV/l9EQP46mLXjKv?=
 =?us-ascii?Q?xoRjX0b8TbjHIedLnF1Uciu0+Jsojb+T8Ziiv2zdi+K8IyAtsRq8Q5LhLGbm?=
 =?us-ascii?Q?dJk4S6NaFNokpJjdAiAaq6DokEh6h61CBEnzpjB7o2cYjdntHJoTE2EEdB4E?=
 =?us-ascii?Q?cQJA1TSguuRtpmbQD8hbWyxkCnNAx5inMjjRIqlvz3resmAPdrgw9C1dfnSq?=
 =?us-ascii?Q?s3sClBc2RXr+8CtrV2l+I1yaojbVFwxVyoSXGJ+NbMBBFfi/5qvccEKGdR9a?=
 =?us-ascii?Q?T75mFhveT2LgebJbkOh4Qim3tqeA33u5pyKEsSvlKBHUQsqeyEr1JrWy0tsy?=
 =?us-ascii?Q?hhvMooMG1/W7VYNZNCIlqRzUdp08Mr/aWcZ1MCFwrFXV0eGgSIisg2BGD/JT?=
 =?us-ascii?Q?ivQ2GpkqTBvrG4PzX3PijyJNqS5f2z/inywnSBcZQvl1HxfSwsrv4PdDEH1B?=
 =?us-ascii?Q?tE1LuqjCRAlJ57980HpcPAmYQ/Fu634/WFsMI5AWr+yrl0RR2q5LoCPsGwD7?=
 =?us-ascii?Q?hxGkfj58+wUyBIGyIPL/3ywUaxP1G7KCNaKia8JZ0B6yuFRONdmI2QmmuiCY?=
 =?us-ascii?Q?r/pqxyGpJlI+VQrLy0uAVtMwJY4JIjuwhaibrtf/fQ4uREAGINCdEnVInvuE?=
 =?us-ascii?Q?ztwf5SV+1Ol6R80wvkQ0N8URD0t0BReCpxsVgp3mcrWU+nRQvSPykPk4u+qV?=
 =?us-ascii?Q?tJC+tJoXlIKI5DDKJRyE4KZaNlemq2dbJzpsoWAhVd2b6ojcrl/MGy6bPfCE?=
 =?us-ascii?Q?13jhKYn3ilFi5afSmXQ6A+JMcHIVbOOaYStu7F/Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WE2B9/A4s0Pr6McBJrDG2C2SFkSf2dQdrUMdO/Xsg0/Z6ed+wypJh8uhhngn?=
 =?us-ascii?Q?clMQsv9vMWRT8QhTyW591PP2KxJoncBl3Te6POWgdk7gdmQbwHRK9hghHn18?=
 =?us-ascii?Q?mrxCYkl9eYy7fpmFWFL/Itm5ntXhXTbBEZX+AyArVq9ZLv+VvQ1fU/jYUJBn?=
 =?us-ascii?Q?uebMz34vsdZOHK4eN/75aKMAaE86qIyuBCqeQpC4a9ZRK5GHYsvUP+QjWFyq?=
 =?us-ascii?Q?5y1rNwvvHELSLDRg5vu5lnCWepWBsfAtyqXGVCjumxHVaUqQvMMMmKkBzQta?=
 =?us-ascii?Q?AaulkUv/kuqeNoyJs2pEhvHw1mZ2VTYM5yPY1/GkRw0Rv8lduP4HoonPcET5?=
 =?us-ascii?Q?GOiFmWXpNftbQXSjEHZFqAOqKSlOsDlw46ZnRS6biJ9jkJXL/KBuCDUWmnh0?=
 =?us-ascii?Q?091fi/CRDo8nXWZsFyoOFt24RmQEq7dRHzUA6F2lGvT2E/fmCxKc29vp4+vo?=
 =?us-ascii?Q?2UhtFBETc/IhQ/8O19MKPupISdXKBvmfvawrVdLOx/0BWV4qBh1X1wA87yPE?=
 =?us-ascii?Q?ajaNNq6+9/8Nfo4GNXIy6hjyg1r75jtgrP26j7tFha4hAZ5wukRMc6dLVuyU?=
 =?us-ascii?Q?zuZVUnCxYthNIf9tVf05DQCUBB7K6nesA3TV2ClfocslBmtwMJjhT8y6zq+e?=
 =?us-ascii?Q?Uy9xAJis1nBkOMypjVz4dnFxEnin5+K38QRmYLRUG/eH+So5/a2XoSl5ORgW?=
 =?us-ascii?Q?pv5YW0F+qj+sXe5bLK3lJl8AgDMGnPz/zrdANHtpIvF3K4RzQ/lfoMOvrIb5?=
 =?us-ascii?Q?lwwQCbW5b2S+UAGbfiXuJ0uoJ8s7Fjw3FVx5m6wKT6PQfJLFvydr3pUpwbYl?=
 =?us-ascii?Q?i4lal89dA9KAPIexSgD/LL6v4Wj6i0qM9upqCeNLX3aD585F1SabIVXefOK4?=
 =?us-ascii?Q?rFnJHuZYFxJdSRToaUIkEj8enopGVCnnrTdIQ6kI38f9MF0T73YPKkWxsAFo?=
 =?us-ascii?Q?ovGNzxeE7hI0EHsXExR53So0r4kXC661oNe5mCXdq8h6SrMMTytNkRsD3tA6?=
 =?us-ascii?Q?vts3gKAU4lyJcp05tiWN4JxwFoppopSTXj9HslVRyfJDrzTKn3+M5HVmZoqJ?=
 =?us-ascii?Q?xw1VKGaB/7EAOTLVm2jCWoqux0cCISmJiJrRv57CFJwtNe8sTSREjhKhxFR4?=
 =?us-ascii?Q?F28sPA8c65HgfTWf/DHnhPDOanZKzQqg/F666cITFeeGrSE9A4FS0xsKEDc9?=
 =?us-ascii?Q?nq3wJgV7qVSq8YzkMS/6996jwIA+GJT3OuzVnJtM1BGE9oMGUOys8XR4ZdXo?=
 =?us-ascii?Q?ICv8S/WLQjS4iXjEQ2p6AvC57HTNnoin5b3Q0FgZSlk94hnUUVJq0F97sEh5?=
 =?us-ascii?Q?aySTp88zKPGQcSyUQn0fZDbIU0bAIJSUiOT/Rn0V8w83IPrK6X6VMVt82fA5?=
 =?us-ascii?Q?TC7yDbCnBi9h1t55e2aJTBNP/xsb7JppEHS1qVxkbR7U8SSXU0b0T1OT21OI?=
 =?us-ascii?Q?EqMhdnLFzMjUHIP14bHacxVdTwzhoDlSkta9sPOcw4guenX8dmg2yBbbJVaY?=
 =?us-ascii?Q?i+4SjZcPRpG0FJ++pr8tZhM7XTPRi+oMTSQtH1icic8cCM3MvXheb4kPvNEF?=
 =?us-ascii?Q?Cpp9/eHRtaFUwZ+LAqPsW3//vDaiCipuCMGo9mwDwICzJ/9rGoRtCD8U4+3U?=
 =?us-ascii?Q?Y62ki5BwBKG0E1eub3D/y5PyWC3L6cpF1q3e+k6mHk4Tv+UaD5spfoAKPZnS?=
 =?us-ascii?Q?OHq4ifAluDs4bd82jODLe0eiIw1fgtKZA5lXELrwb9LQW4C6q0YX2zJSSTMI?=
 =?us-ascii?Q?0330ZS37RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b703d2-f5a4-4a19-b181-08de540754c8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:25:59.8730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfdWxsm8hnPHJeMnrKtDU5iaTDWTNAQNNUj23W+8yvceqedCY+5quDm7SP7oes4iVAJYnmbXlhqs5mEJ2Q11dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF11E6CAE14
X-OriginatorOrg: intel.com

On Tue, Jan 13, 2026 at 05:48:56PM +0800, Xu Yilun wrote:
>> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
>> index e872a411a359..7ad026618a23 100644
>> --- a/arch/x86/include/asm/tdx.h
>> +++ b/arch/x86/include/asm/tdx.h
>> @@ -32,6 +32,11 @@
>>  #define TDX_SUCCESS		0ULL
>>  #define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
>>  
>> +/* P-SEAMLDR SEAMCALL leaf function error codes */
>> +#define SEAMLDR_RND_NO_ENTROPY	0x8000000000030001ULL
>> +
>> +#define SEAMLDR_SEAMCALL_MASK	_BITUL(63)
>
>If we do want Patch #3 [*], I think no need to expose this bit in
>public, define it in your newly added arch/x86/virt/vmx/tdx/seamcall.h

Makes sense.

>
>[*]: https://lore.kernel.org/all/20251001025442.427697-4-chao.gao@intel.com/
>
>[...]
>
>> +static inline bool sc_need_retry(u64 fn, u64 error_code)
>> +{
>> +	if (is_seamldr_call(fn))
>> +		return error_code == SEAMLDR_RND_NO_ENTROPY;
>> +	else
>> +		return error_code == TDX_RND_NO_ENTROPY;
>> +}
>> +
>
>Maybe we can remove this single-use wrapper and integrate it in
>sc_retry?
>
>>  static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>>  			   struct tdx_module_args *args)
>>  {
>
>	u64 retry_code = TDX_RND_NO_ENTROPY;
>
>	if (is_seamldr_call(fn))
>		retry_code = SEAMLDR_RND_NO_ENTROPY;
>
>> @@ -22,7 +35,7 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>>  
>>  	do {
>>  		ret = func(fn, args);
>> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
>> +	} while (sc_need_retry(fn, ret) && --retry);
>
>	} while (ret == retry_code && --retry);
>
>Seems more straightforward to me.

I am ok with this change. Will do.

>
>>  
>>  	return ret;
>>  }
>> @@ -48,6 +61,17 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
>>  			args->r9, args->r10, args->r11);
>>  }
>>  
>> +static inline void seamldr_err(u64 fn, u64 err, struct tdx_module_args *args)
>> +{
>> +	/*
>> +	 * Get the actual leaf number. No need to print the bit used to
>> +	 * differentiate between P-SEAMLDR and TDX module as the "P-SEAMLDR"
>> +	 * string in the error message already provides that information.
>> +	 */
>> +	fn &= ~SEAMLDR_SEAMCALL_MASK;
>
>Why we must strip the bit from leaf number? See from P-seamldr SPEC [*],
>all leaf definitions are with this bit, same for your C code:
>
>  +/* P-SEAMLDR SEAMCALL leaf function */
>  +#define P_SEAMLDR_INFO			0x8000000000000000
>
>So my feeling is, log readability reduces without this bit. We don't
>have to make all developers understand this bit, just expose the whole
>leaf as magic number.

Agree. Printing P-SEAMLDR leaf numbers in hex without removing bit 63 is
better, so the values shown in the logs can match code and spec.

>
>[*] https://cdrdv2.intel.com/v1/dl/getContent/733584
>
>> +	pr_err("P-SEAMLDR (%lld) failed: 0x%016llx\n", fn, err);
>
>I see no problem we keep both "P-SEAMLDR" string & SEAMLDR bit printed.
>
>
>And could we handle it the same as sc_retry(), something like:
>
> static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
> {
>-       pr_err("SEAMCALL (0x%016llx) failed: 0x%016llx\n", fn, err);
>+       char *call = "SEAMCALL";
>+
>+       if (is_seamldr_call(fn))
>+               call = "P-SEAMLDR";
>+
>+       pr_err("%s (0x%016llx) failed: 0x%016llx\n", call, fn, err);
> }

It's doable, but the conditional is unnecessary ...

>
>And the benifit is ...
>
>> +}
>> +
>>  static __always_inline int sc_retry_prerr(sc_func_t func,
>>  					  sc_err_func_t err_func,
>>  					  u64 fn, struct tdx_module_args *args)
>> @@ -76,4 +100,7 @@ static __always_inline int sc_retry_prerr(sc_func_t func,
>>  #define seamcall_prerr_ret(__fn, __args)					\
>>  	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
>>  
>> +#define seamldr_prerr(__fn, __args)						\
>> +	sc_retry_prerr(__seamcall, seamldr_err, (__fn), (__args))
>
>... we don't need this definition anymore, just use seamcall_prerr()

Having this seamldr_prerr() (and seamldr_err()) is to eliminate that conditional.
