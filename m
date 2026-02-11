Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76861A256B
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 02:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770776192; cv=fail; b=tCBfJ/R/VPj4d4AL9RFAHAblkAftwzImeRV+iFYWDrz3Q48Oq0ytbh9tJGntsDx3sdPMfuCCORrj6UPe5SF6L88K/EgqYlFyjBE/1u98Xbwfl+f3p70o6lTCJQ+hxcvmqdzgMkOu0UDXm68WKv2ylZ1ryOZuWmC11KTnXz1fqSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770776192; c=relaxed/simple;
	bh=cH8kkwDfbfsAKsrbCbJWSaMRttIrSbpN2JCVsk+NwGw=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=f/ec+qyRX5XAAqFOOZ63tW5cKZi0ZVdeOe5Zs8wTauFQ/5AoWXdA2RKHBPnTMIL9+9kbBCxZgcjIIzvhs3xqE2QHjIo7yuVnMZn+G+Zf6FaYWEeImJGWnOO1p4HQC1kwbWC9Fmty299YywrYDPEhdqg/nPKOt6BxhEQglkNFshM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L91eEiiK; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L91eEiiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770776191; x=1802312191;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=cH8kkwDfbfsAKsrbCbJWSaMRttIrSbpN2JCVsk+NwGw=;
  b=L91eEiiK0XtygKJalDzCaG7uFyAnRkUVvarpVO4xJvtG9Q21Fb/KwVP4
   AIuNPvwiE7Db1BOJZNoj5uw/oFuaOd0GHqeL/JX3ul/fcdvX7zvswQVOI
   pBh4pvfBKzSRJVpEDQLlENgZDcqikw0v/PAja2+RNaGXEXJiuv/u1WDWs
   SUhfHWNm4Uhn68ry4Y2Q0DxZlan1LCKJQdm/tavq8EdQCXoeswzozyQIA
   qnD2TnkeOHy6F6/e5wPK9/GN4o5QGFvP9K+OQE3HIv29AHjvY3V15OSsL
   /dgbK+y8W6djnIdhIGR3L0wl3aokLj+XAmgOwMVWwSaS4O+oUQP3FkYMw
   A==;
X-CSE-ConnectionGUID: K8FvrxRMS2e6f0GSHkD6NA==
X-CSE-MsgGUID: UF7gdly3Sk+JPyAEGYXaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72104683"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72104683"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:16:30 -0800
X-CSE-ConnectionGUID: jpj+LODJS26sgf0JFJDgbg==
X-CSE-MsgGUID: dGn6couJTq2PXjQHliR31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212196136"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:16:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:16:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 18:16:29 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sek/+w0Q3sDK0YBYKeP+4JyWQ7+QvT182BAzv2uts47GsNhh6LDesipNiTRm7mDUUujJwzk8g29g/bxKh+0oGbjPRC1E6YQBs+Rmlc8Q+sh9s8aUyU6QLg2P/MgAJQ8IZeMWcj9UQ0DKXvUqOzTxU/N+RWDZslYGNXpGKjnkyQCDFLB2G0v1M9iLe8mMfxDe2n3WTF3uxhvpK/8M2fmlZlGmbL5Ow/th20+gfUEL/3mNZeGUhyk+wPKng0Ew+DsSSN6Qpm2aKJ74usiMw76FC4DRFtTCeY74NLIfYiyUFGJardV3s1eHcdA7FP43gGyo6nhCeLK+UZq2QoweTTI18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNAgYqHOTDTqMqzA3Hv5D/JkjETQINVMkC4T8hxWcJM=;
 b=ufDAUxyJHIqoh6az/ROagKwzxjs+yJ4EZtlQMS0om6EAM7FXcFvwFlTKoWovJs7qa+n2lc32iRgSbBDqOUTPklDcBBlhXbGu6kn2wC0KXmvHy7rWrfN77z4MNSDY9RjTyBeji2Ey2/uOmHuDuy6P6HFId7nt5unkDkq9Ae0/fEB5RGBGMfkefRJV/YqA9Ddba+rJr02BK/+39LmCWB4mL0n1pDjHuP6Fom6cOBcL2cp/QvR1kreV7OQlclvjNnYBZGOM6GxL4fX3A7adWTfm8WQ3DiU7iK3YfkvMyoNIPSjDO1w1kJ+aT9hFbrOi8xNT5AUKrTVYEgB4Nz92KFsrhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:16:27 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:16:27 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 10 Feb 2026 18:16:24 -0800
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>, "Kirill A . Shutemov"
	<kas@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Message-ID: <698be6787e2de_8c321007f@dwillia2-mobl4.notmuch>
In-Reply-To: <20260211001712.1531955-3-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-3-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 2/3] virt: tsm: Increase TSM_REPORT_OUTBLOB_MAX to 16MB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::40) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 20acb655-dcaa-4133-c495-08de69138f3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkVUWDBBL3NBZ1Z1ekhQbEtjbkRPcjlLRlArcUozYmJoS05lM0s3MHlNd211?=
 =?utf-8?B?S2tEOXZOVmw2TitZQkI4TTR1NGpoN0QvSVF5bTdDby9KbElXOXY5REFFSWRF?=
 =?utf-8?B?b3JVSVphTy8xbHR5WndMZVJHeWd1NDlTT2JuZHdCMTMrRjN1cEI3eDdCUUlH?=
 =?utf-8?B?QUJmUlVuSlFLS3hKRmQzdDl1empPYnV4RXlFS1oyRktLZFQ4cUJlWWtiUVYz?=
 =?utf-8?B?M3lvWHBtclB2VFZqK05mdFpsdGZ5M09aQnB0d2FnOTdWV1Jsc3VEdWk2RlNj?=
 =?utf-8?B?bDhJTDcvNksxREFuM1BKMnJwSkVHUWtrMHlKaEFsVUhUcmZQTzV5UTlsUmN6?=
 =?utf-8?B?a3FmMG1FZTdIWWdGOFdzL0twY0Y1WWZMTlVNc0cyWnZKcFQyTzh3T2xVNEV1?=
 =?utf-8?B?ZVNSaWtKUUwySGErRk1PbGtSSlVtZ1MrNk5mOXF6N0lra0poZnZhSm0yRzVJ?=
 =?utf-8?B?MEo1VnR2Q1l0ejdncXFraGdBbHZOcGtPT1hTMWxsZ0hBMUdDSkNOMGpXOEZ6?=
 =?utf-8?B?STJlTmJQaHU2a09TNEYwS1lJaG9lUFUza2JLTXlUbzZXcjFpNXhsUisyWTZZ?=
 =?utf-8?B?eXkxQi93c0UzVmR0MGFjYVpBRkJjd3pzNExqdFJsc3pxMTJabUR1bU9vRkZp?=
 =?utf-8?B?a3Y2Rk8zQkxQUW9WNkNrOHFjWGlEdUY0Zlp5R2pVeXFkVGVCdnY4dGlmTjdv?=
 =?utf-8?B?aEZmT2JNdmw1UFVETVUwZkZ4d0tucGxwVXVGODFaZjk1Zm1LNmx0WHQrYkN6?=
 =?utf-8?B?U0dQOERERTVRRXFoclljODJhMi9WQjMzaERCNDVZZFgwTUF6aDdBOTB6WE5Z?=
 =?utf-8?B?L2djbmEwaUY0Mm9yU3NGcnVqeDE0Q0FTbVBnWnF0WkVBZk5USDVFRlo1K3hv?=
 =?utf-8?B?TllJR2RuY251ZkQ4NEZsbSs4UjBpYU05NUMwaEpzWmhJNHlTUTVnMjdGV0I5?=
 =?utf-8?B?RUQ4YlBuRWJYQlgweEE3cXVlYWc4QzZEdFVUSjgvb1FaYU9KNGo1eXRMWkZK?=
 =?utf-8?B?UXlQSTY1Zkh5Z3JjMmRaRktBQ3YrYnJDakRPbk1MUjc5WXpMR1JrbFdvTXdF?=
 =?utf-8?B?NTZpSU5XTUIvVmNKQVBxdU9YQzk2dWlScS9xVW1Mb2N2aWtOd2RqZmZQbkpu?=
 =?utf-8?B?UjJuZzduWjFNa2dFbXlWSGdnT1p0SUIyaTFrTjVSQ3NNWjFKemg4WHEvNHVM?=
 =?utf-8?B?WGFvTmtNTTlYSzBnNGVEc0FLRy9aVlF2c01UZlE0dXREOHI5a0V4SFRieUFX?=
 =?utf-8?B?Y1lERHRJMmovMTl5QUt0VFdVSFNoSkp3cTFyVzRsVG8xRHh3TmJRVDc4dzg5?=
 =?utf-8?B?Vms3cEpWdDBMS3hpMEJZVi8xUHhuK0hkZk1ucVB6ZU8zMzZQaGRFWis0dmdB?=
 =?utf-8?B?enBKL0RidllXck1zckpPaVQzSVphY0Z6YkdLakpHcDJDejN5dHl0WE1MaU5U?=
 =?utf-8?B?TnphbGVZRGxzYUtnb0lHc1hWMjRXbDBoNHFzbS9SeExuZGwwZGh0L2RtK0ND?=
 =?utf-8?B?Z0VVMFdWaEtjQmxQTk1RbGxuRVJMODdnSVVNTWg0akY0ZGJmSTBxL3M0NWpi?=
 =?utf-8?B?Vm1kdVBBU1QxdTdlbmhaTDlNWkxRMjZjQzluVWFqSE80TWRSeGRuNmNlK2tw?=
 =?utf-8?B?VTU5N3I0Uk9BQzJyRXdNRlllN3RIdkdHMDN1eFFpSUs5ejB6eTZ5OCthZWgz?=
 =?utf-8?B?VFBLMFVsOEd1QTZGWmpFeW1UVWxYZWJ6MHVjTTdrbVhCQmtyWFEweUI2WVBM?=
 =?utf-8?B?cThoVEh0cm8yUFhjOXFqQXlBdWZJWmVnZWtIV1R2bWJDMWhqaCtBZDRCeFFD?=
 =?utf-8?B?Z0NoZ3FBemNVMGcrZ1hGd1AxdlJENDhhZGs0b3NEYWhaYXlHQVA2K3k5dXB4?=
 =?utf-8?B?S0pQaWxGcDRRdGJrNWQ0YnJqbVJjcmlqWEJNVTd5OENaZUhFMDY4RW8vTThl?=
 =?utf-8?B?WDRuOVNTbWJvOTUrNXpBdUxOcmRqdjZzZXhibHNuMVVIamVjUFJkZlFZK0h2?=
 =?utf-8?B?dE5HV1Z6QW1KSkcxYWRRb0hVMzE2L2RQcjNucTdKWGlZenFyNUJLZll4V2VN?=
 =?utf-8?B?T3JySXRXejFWeWpvQXdxQjM4QzlaaHVYZnZRVHBSQUlhS1ovNk9uU0RMN3RE?=
 =?utf-8?Q?5dGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVpqYjk4WC9TNXg0NGhzb0RKZVpWelo1SGZHbWFIbUFlVlVtZmpLOWhuUTRj?=
 =?utf-8?B?dXJWY2ZzTVQxTzFoNHhtNFNSZ2tkYmhGRmVHVXZFb1VXelBpV280RFQwaSsx?=
 =?utf-8?B?YXp2dWN0R2pVYmFZYzdtTzNNK3Z1NEF2a3ovbWtUMVJhVzRyQUhoWE9ObEdo?=
 =?utf-8?B?Q0lqMHVUUi8rS1luL2d3cjFYYUFDQ2xaUkVGS2cvTTZmbklDL3hMNE9KVSt2?=
 =?utf-8?B?OUJOamIwakhnZmNyTzJtTmZPYlRNeXpHRUpRaWlmWG9GaG1Oc0hwSEQxTGh1?=
 =?utf-8?B?aHFSSW0rV2ZEdnc4OUZ1Ly9WT2xsUG5zY0JIUjlsRllwa09Bc0VrdE5Lb2hP?=
 =?utf-8?B?SjhvOW1KZWZhNTh5WVZ3WGlpTnBXRklWY1R1dUNac2hGWUhCOFd0SVMxbWVx?=
 =?utf-8?B?dWVpcWl5YnZKL0RiVEF3cFZHQzZZS1BZSzFiSG5iS1o4eWRGTnI2c0wxcWlt?=
 =?utf-8?B?Uk15UWFsbHJNZktEc2haWDNwWmd5cjBEMVFXbkppem43S21NNlhVQUovbldl?=
 =?utf-8?B?WENiMmNkeUwyZjlqb3lXbWQzN3JlYndMcUQ1NXpJWXhaUGsvL2pOc0VCU01B?=
 =?utf-8?B?VmI5Sk5tNFV5enYwbXpjTHBRZHJKYWdWRytZV0NEQWdZTUxhY3NNQVFVUk0w?=
 =?utf-8?B?YlBGck9HeVVadGZFTGhCK3k1QzArd3J3b2huZkpKUUkyR1F4VEpFRHFlMnor?=
 =?utf-8?B?c0w1S0hNVTBTdnYzTnZRWDJKMjVsRndYWi9rTWJUN2Q4WjRNTTRidDQ3RDhS?=
 =?utf-8?B?M0xqTmNETnRCMWtDcmowL0tHTkp0RXAzYmdwUHY3MGJDQzdDU3Rvd1V1L21x?=
 =?utf-8?B?N3hJTG5FUldYYnp2TGxxVE5MU2pQWWEzREdQZHpsOXprbUFtNDZwaFZYOXFH?=
 =?utf-8?B?ZEQvUUxEOFNNS29BbHYyWGpzZUdDYlFJSEJLbG5mWHNlSTRjVytjMVpxVTJW?=
 =?utf-8?B?K21XNlk1anVOOVpkNk5DK2ZsdVorbEVrWDZva0pPVkFrVTMydjIzZHRlRkJy?=
 =?utf-8?B?OFVmYWhjVml0cGFhalRnL0pOS2pZL0pQaGZrV1J5SHZBczltaXEzNmtyMWcz?=
 =?utf-8?B?ZEk5RkI2aVFhOGtFa1RYaW51VnF5S1dWUWM3c1MrSk5jZ2RWOC9pN25oa1lp?=
 =?utf-8?B?K0tLZFFLa1VPMU9nK0UxTjJyYWtyeEl1emEyK2NYTXhwdmJaQ212QTdEbzZE?=
 =?utf-8?B?MkZmWHF0SHBoMWE4b0FreWhzaHpLWS94dDR5b3gxdmwvTVIvMGlFYkJyOVNu?=
 =?utf-8?B?K0hHc3lVVWpiaUFEWHM1UmNlRXJSeXdXeGdCUnA4NDA1Y1pMSE9UUGRTbkpt?=
 =?utf-8?B?S2U5QWhPSEJKNDN6WDExMzBLRFprUkFXem5LUllnYS9HemFjZUovekNrTjUw?=
 =?utf-8?B?d0ZWVjRyci9LRmxaQXF5Y0laYlZaK2dGZ0NDM3BhZU1PMkhTUm9FdHdxRlhJ?=
 =?utf-8?B?dHE4ZUl6cHJxYkp1REZWV1I5cHorL2RsZEx3d0JTVmk2cVd3dnRIM2RmVmpJ?=
 =?utf-8?B?aEkzWHB0QlE0SndINjRPQjcybllYdklOYTJKNGtmb25hZXJXa2pLMXNzdDlD?=
 =?utf-8?B?R3V5UE82MEEyVS9nenZBR0dYRkZqVzcxamZLenpqaXUrbnBQdDRNYnEzNytZ?=
 =?utf-8?B?NVgrekZwSHpmVVhCazNIbW9naGVnTFlJTmFXRmNrdDRuMjlEd0pYMUdRQzU3?=
 =?utf-8?B?bGZzMFcxMzNwOHJiRE9mR2xMdVdHR3U1WWx3QnM3YVFGQnlHMUFNRE43SDJq?=
 =?utf-8?B?L1YwM3RVQ2paTmpIaGVyRk5pV2RMUmV5S0xiM2M2SktocEVRVG54WG9jWVdT?=
 =?utf-8?B?bnE1Qzd4R3l3YjRxNlUrVVpwcWRLcVNCSkxhTUNkNFVTczFPV2tkMXpheWdt?=
 =?utf-8?B?OHI4K05FSFFRcGlDYTdRTHFzMWFpMVEvSDFEYnk3UkVxT1o1TFA3a1dIVWM0?=
 =?utf-8?B?cklIVkluOHFRNkRNYUl3Q3BlUDMxYjhBdURzSU56eERuL2Z0RjNyQWNjdCt5?=
 =?utf-8?B?aDh4Wkc3RFBueDRBUi95TU1JQlNSUnozY2RLVlFYWkdNZmdxakhWTE1OckNI?=
 =?utf-8?B?ajNuYWtMc1QvTktEWE9uaWRZcVVjUzFsemc3a1hTVTRIQS91NE5XdDFoYWhh?=
 =?utf-8?B?Qno1dDd3eXZjckhBakJjc3djVzRWUGIyY3N4SmRiYStQM0VZSXZrWWR3R1pv?=
 =?utf-8?B?QnVPYnRMblZmVTdaK3pJUXpqTGFBZ3ZJYmVhUWJTNkFTSWYyVHNDVHJ5NTJG?=
 =?utf-8?B?OVE3cks2dDJxdU5YOEZyTlY4cldZaU9TSSs3NVBsMWwydEtuOHNXNmpaTVNp?=
 =?utf-8?B?R1hFTXZWdXNIa2R3UmtmZEF5N2JOYVg1SUFQR2oyOG8wY1RjOTFSN2R0MUtX?=
 =?utf-8?Q?EUWK+jqJvQjjB9Is=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20acb655-dcaa-4133-c495-08de69138f3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:16:26.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LaOo493sN3jsw0K4zP+qmt8VxwA7tOo5ItXMK+JCwKa5KCQxU6sj5ZGxWUoZTWT40f0nzla2cMN7w2rCAQRZn+JdtrZCcbP+IPjILLweQSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> Confidential Computing (CoCo) attestation is evolving toward
> standardized models such as DICE (Device Identifier Composition Engine)
> and Post-Quantum Cryptography (PQC), which rely on layered certificate
> chains and larger cryptographic signatures.
> 
> A typical PQC certificate can range from 5KB to 15KB, and DICE-based
> architectures accumulate these certificates across multiple boot
> stages. In such configurations, the total attestation evidence can
> reach several megabytes, exceeding the current 32KB limit.
> 
> Increase TSM_REPORT_OUTBLOB_MAX to 16MB to accommodate these larger
> certificate chains. This provides sufficient headroom to handle
> evolving requirements without requiring frequent updates to the limit.
> 
> TSM_REPORT_OUTBLOB_MAX is used by the configfs read interface to cap
> the maximum allowed binary blob size for outblob, auxblob and
> manifestblob attributes. Hence, the per-open-file worst case memory
> allocation increases from 32KB to 16MB. Multiple concurrent readers
> multiply this cost (e.g., N readers of an M-byte blob incur NxM bytes
> of vmalloc-backed memory). However, allocations are performed on demand
> and remain proportional to the actual blob length, not the configured
> maximum.

Looks ok, again I will change the subject to:

"configfs-tsm-report: Increase TSM_REPORT_OUTBLOB_MAX to 16MB"
