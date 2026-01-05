Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83226CE2D
	for <linux-coco@lists.linux.dev>; Mon,  5 Jan 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599674; cv=fail; b=J0LCzw4Qd8c2/Q2Lvh0Dp+hB/odywBkn2VJtbLW40FZEeA2GQUfSfryOGKAJmKm0YG0+7aYarluuDUkS8U4lHsJrqrYdphBiVmBtagUzm9iJTMsNOEwep1k4aMNPdHcXWdTpp5WHwHjD+QhVuRXc1GtwXn7g937mVk+zq2jB13s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599674; c=relaxed/simple;
	bh=uLsOnvewEA6/KBSYqgGbQYnTzghULssVsKvja5m47ws=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AJCwqpEK5jdXUpnQVKPOiPv0ZwQHry0o0N557fI6zHa0jVAbh3IaGzvuIOv7PLRzR17yRXW8OQJZs+DfQcDzpLV255moPX9/AVW0n8DNqtkfmwz09CkD2tWLh9dQIqP5ub6+atEZC9IFLyvPp2qIm6uOOA7RoQUKifx/tO5VM2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DU5BzOvJ; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DU5BzOvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767599673; x=1799135673;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uLsOnvewEA6/KBSYqgGbQYnTzghULssVsKvja5m47ws=;
  b=DU5BzOvJRliAHUl1XPAOq7a5Iux6yCXZ2U5MebbW5QkadexxmZvme1Rg
   gbaaHRq0tim9P+kxgNlRy5VyKgFvxbgnB4g4pyJlC8EEHTHFWAQgudbVh
   fVSUUWGw3g6wbWVOzRbTM+ZHXxmc3xpPNiugnwnE8OxRcTrYvn6GJSSXR
   CX6oLhN0knIOegmW/rtqEer7QFIiZjn4LribGaRUYcQwNQK2p8/0L7qD/
   CQZhGMhiNjzWRoezU4ydUv071PPQ543eE2DFDIQqVbBcYQG66D1J1F0hK
   SGjx21ik0KOEK06DfXELYxvrbZjf6jIT+gjh2WCVAR5HO6LiBKKEdKC48
   A==;
X-CSE-ConnectionGUID: Hf84dmp0TKu7g6USUHSc1g==
X-CSE-MsgGUID: lMdAzkVkQz6wF7AyWBEKkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68869288"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68869288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:54:32 -0800
X-CSE-ConnectionGUID: 4PExqsgsQbOCvbngHGiFBQ==
X-CSE-MsgGUID: 856ReEmpQ3irZzARO6r1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="206814555"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 23:54:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 23:54:31 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 4 Jan 2026 23:54:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 4 Jan 2026 23:54:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcWImckjmzg8qOg53HqsdE8Ok17FMYkNSt0LvU69DC2UgxNQHwCw7KjgMVIkeLRXa08bC3YN7e+j2XeJ2z2Qznd97ELwMWqx2dDmfu8h+0+5CeRhW8u/i99zV29TU/QSENOO2czggSKs8LsitT/AbvXwMJKWvXC1rEpuD3FhYOHY1Pz7A7SBM0w7zsYt9E/dS9mqU6oaNoZEO7RC/LPnM0vtRRWDhOI0h9YHBqY3NWHXSAT0zobt6KiXh88QOczH7B+z5EWSC7HFCF2IGP1TbQTPy4QoOwPmJc2JzkYqGECaX/4gIPXZdPNYd81zrUPqGkwjrUyeDTW7Cka/mi2HDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AR2nqpbXMbsVhLde3Rm6Y6Stkhf38LPWWggjMA52tfE=;
 b=xOSr8W4LznF6QTowcuXiuNUNR9uB2Kpq4uSH//kfMutL/Alm+2kdjgZcica9G0FX4upn953nAF3RwBLtQ8fOHhgIeRuuXi22VbUadkLPhGY0xbIhPIzgMkWGO1xVKiYGrsma7uW8pnQjEO65mTKdio59FAXJQlugnk2o4yQpUTMt94sOe+5dTDCd0z3aHaMucUtKzGeMGbDNHNluhRWNLUNuAXtNOvljlN4pZfWbbWl7yWWYL4O5gQ4RiUj/3Rc4EcmoLKGcipZdB01XEGJOJN895ZStkddxil6OSsDERLSPiSrbCOaz4/umGMtEYEj2SKwE07e4RbL60oesYxnhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 07:54:28 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 07:54:28 +0000
Date: Mon, 5 Jan 2026 15:54:13 +0800
From: Chao Gao <chao.gao@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Huang, Kai"
	<kai.huang@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"Weiny, Ira" <ira.weiny@intel.com>, "Annapurve, Vishal"
	<vannapurve@google.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "paulmck@kernel.org" <paulmck@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "kas@kernel.org"
	<kas@kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v2 00/21] Runtime TDX Module update support
Message-ID: <aVtuJYb9Fg7/Y0Ci@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <aRSVB3TQxpgZPj+F@intel.com>
 <4bb43ec912f3bfb92d0f9071143b4b046d5db08d.camel@intel.com>
 <8d7817ea-317c-4ddb-bb5c-a7b2fab1ad3d@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8d7817ea-317c-4ddb-bb5c-a7b2fab1ad3d@intel.com>
X-ClientProxiedBy: KL1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:820:c::7) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e550395-b78d-4256-e47d-08de4c2fa699
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uBdFZdmnnBWnJpM8GfWQSZP90/mRXjQmEA9UCNPL6kqgTHw0aY555T9nL3KG?=
 =?us-ascii?Q?0kDQoDLxLlGet95R6SfOFstpo9/BFxZJfwRnY19za6NvRIKyuuwOWDY7eYZb?=
 =?us-ascii?Q?ztg0oydAd80d+KCWZ4Eq/K5kfe7AXUyxSvF+y4Ph1EQGQHQRxQG4L87kP/mn?=
 =?us-ascii?Q?xtmju08Arzn9Ob1OvLgT1Epn6QwKlAQdaT+bTms0sNJc9Qj5K3O2oOPrjly1?=
 =?us-ascii?Q?EQUIv50NPc0tQzQE5d1NNosM8ugIX/vedsSYxuksCvWnpbaMQWU+H6XAfTR7?=
 =?us-ascii?Q?qIJ3RwPw86BFXsK2/qKpTeJawfTOo94g/zBQ9r4FztGVWrLYKsyRf28b7b1v?=
 =?us-ascii?Q?jvgAgK2tXblTIdVmz+kQo7xkuMVOqE9W5YSIBFFjj8OZoPW54T71odxyPEFe?=
 =?us-ascii?Q?mYAfozVk+8fifRI0G2/kGx3CNAtJ8iXZ1R204/sJVk2XpwxXsRBreHJv/Vax?=
 =?us-ascii?Q?bgHY6oLFiZVyjsUfhykNZQMRKzDUc+arlX9r8KMtwpy7bKWhiTjec5lUukzl?=
 =?us-ascii?Q?yt1WCy8clw18lNdJvbS6fy45blVl8xN8Mg7O4WL03+mg42KEiKx99ObgVw0J?=
 =?us-ascii?Q?OvwIP00ivGdDvLFZq57oVsX1xAYpZ7ywiiq5u8h1Y5OWEYkSPg50hql0glRc?=
 =?us-ascii?Q?UUjoQHZ9BSyodFN7HJOExGc8Uy7A45cvZfsAu1b9jDz/cw7AOjU3RcNe6Hca?=
 =?us-ascii?Q?gjOswRjKARdmJrPGPCaFEUHd9/Ig0JuCsfOpkyN5guHa719UEaHIBYg9IDa4?=
 =?us-ascii?Q?Dm1ZJXl+s360yLRF32OnJ7MTUaJuKyKRk+V5cIGc6aPwvukEUtrOdPmpu09I?=
 =?us-ascii?Q?gxGRChdWJCkzr8DnI6fBNBDLMIQ4cYTQqDdFeuzgrkevyv7NJ5tzX/DBTOYg?=
 =?us-ascii?Q?DCb/P1tL3gWinfWnerAXw1MJprKMSCnIl7lIfhRXefFPbQ4Smfon4+prs4sZ?=
 =?us-ascii?Q?jzb9vG3o0ArtxbJ6R4xw8hLAY29Gls3heScI6vxu4wSXBmc+VgmMVoB8sV/V?=
 =?us-ascii?Q?KNlwHaAM2yAc1Ml0OgmUG1t/mddNilNpfdZNXJYHRivB1L/zQXHMGog2ey7/?=
 =?us-ascii?Q?OEKa9ecglKU3E36VJF9VMbkKo0OkEegNcxgVvi2202KohJ+Qtc2VcB5h96ls?=
 =?us-ascii?Q?R3aNqjr3G4qdFpSpgTmUe00WZohQk87x63L7/l27IB6082FXsC7E8AqzIuSW?=
 =?us-ascii?Q?ER8tk6l1AjdSxAHVeW8fiwRcyhSVn3Bf9n1eL425XP64LHzf4AwEbKRXgXMI?=
 =?us-ascii?Q?NEAFCXzi4QIVZecx5KDh+K7LWu/31HaoM/g6WNu/uSCN/ZatJhHMS5brpq5E?=
 =?us-ascii?Q?C/x7GtQX2i7IxnqAnEr7mfv8Qf7X8itzcNQDWJxQqChHvIzltiu5mRw3NB3b?=
 =?us-ascii?Q?VajbCz8CawIWxYQJEEW4BdcmNqkObjx2gYUNZ/EV4GHn2xeFdBpXUgh5yPbq?=
 =?us-ascii?Q?qzszzZlnUcGYe0HfqB4rPWTFHYxyRTKew2yz1ZgWcs8C8Ctsqqacmw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tx7ouorX/miID99QozCwPvnakKT+OIhmPDxdH/PrIu7rK3OKugEMZXHAomtC?=
 =?us-ascii?Q?wXFwjrnBoH5FXncxNHTtJVd0LIWR4FZ+OSCsCziv2gQEOlvvsYdYhQQAItFd?=
 =?us-ascii?Q?ySeCDZlbfA4nvw2nmsxmAgTIRsFKyRoOMbnX8GBiueiJ5Z5UepEMOZu0xnN/?=
 =?us-ascii?Q?J8WIANxxiyDpmNW3Ktn45DSi5s1EwFidj/ed5WoBvfAac/j7dFUqHbKwwG9W?=
 =?us-ascii?Q?rLt6mYrTPmIqF5P1uU2Z2ynWbAz8uI1dhFEgF7OFRgSkNm2PUWpNFeNFP0bl?=
 =?us-ascii?Q?KCtPysxBsik7FW50Gcx0v09/g0S9+++5bxKyaxzYhse6z15NZGBPFBsNfYTi?=
 =?us-ascii?Q?9HWeQLdi7B41NIq9XZbAuoYiZvF7Zlw2OnwPN3RuOZG0qVC5RnxxHgdtqJ9Z?=
 =?us-ascii?Q?KMg2dqNBPeFqq4Lggo4T+yVqye5QO0sJE682ghr6MBbdvSSWAihWeytXzb1J?=
 =?us-ascii?Q?N8Tvq3sSGnXT2mpL4DSBbX9jJItb2l8azBKqpcrdDmMo8X2Hlb/FNVTazCVP?=
 =?us-ascii?Q?wAB4bH6e6te6e9uUNFmeHgHq5B8lyQjsefw8Yr4ChUpvsywwxanxXhIJ894m?=
 =?us-ascii?Q?wrERPYnx0U11EIv2ugEl6wh2X293eA/D+EXQ/s7yGsR2KsycDBcgnUTfOi+p?=
 =?us-ascii?Q?g/mfsZHyMu9+84epf7yHt3hD8hSqTWOCfaYl7LT0iCbWCmr9yfrLOPylkmEP?=
 =?us-ascii?Q?0m11IprOIb0m++xQiK+amq5t4/d75wUAVpukoRVMeCtF5sLn4WzXyiUesfos?=
 =?us-ascii?Q?2PyHYxtWGmWXvqUReVrWh6cjkNzxed9F6GCMKItTssshRmX7RMKbPx9lNsZE?=
 =?us-ascii?Q?D3ETZCcTLU5iYDIqMW6EAukhVDES7YwpRCjrk85TOMYR01dM/CIa982CqDem?=
 =?us-ascii?Q?QLzE6WfCUB3sRo1f+YKel8XydpZx84bdAsSnw9KVJhL2SBX1/Bv64UELvNES?=
 =?us-ascii?Q?H856MbmVHOBx/CXsgajpP6SOrJrpCT1ryKcxiOywAPQYWwzMb+zV0sVyGpli?=
 =?us-ascii?Q?rOi9bJzlPcGW0j+icbclag0esbua/dsX16btpVECBtvHaeHEuNSvsEOFaxOG?=
 =?us-ascii?Q?Ekvg1aTBmmwcemVlIBUEsnkUvGakZYOB/k8xi4b1EyBL6o6qK0ix12KIhFWJ?=
 =?us-ascii?Q?j9i88r9cptYwLdVjaAOP/fsdYERKvBwTUV9Q0CV/mJtCaLCRavbhFQMffWzl?=
 =?us-ascii?Q?B7CwitQkwwCvgeWb6cBOoX8zUJW3macg8eaC4Cr2RibNfI12R8aZLPpcWMX3?=
 =?us-ascii?Q?ZEwiFlmxAl3StwUYDZESwntf+t5jwCnBDAPhoqegM8acXrcMEzGCQJIp/pC0?=
 =?us-ascii?Q?sVANKGwsK+QRwRAsAb9yY4LxzJ5EN7TOSlNfgbnXoJawnx7yRlfuS6uvxDyh?=
 =?us-ascii?Q?OCLlwUOY4KEBIVaziwUf0kdRKo5rimGgonXmnINFhahdttIPm7EaSVoL8/Dr?=
 =?us-ascii?Q?aAnF3A4WsTyNOJ0FGMGbC9+codFQyWlxcb4IWb58is7yzqITQMmdWoNo0IjF?=
 =?us-ascii?Q?Il+dpdgW6Gz20pn/9q12ch+F74fwAKduJEKOBwxunbWhC070WABQbqTlYxh/?=
 =?us-ascii?Q?cel3//nocrk9g3QnsJS5LC35SXW8inoN98JoxGIt/x6CG2hQ4cq3wKgXh9E3?=
 =?us-ascii?Q?ptJfEsd9fSrJm97SamYrswJfj7IJBuhYU0M1QfigcPolx8dvLWmHMjzh2UM+?=
 =?us-ascii?Q?oVVUoBXbPWX1b7xhzE2njkVq4RRx7yHbHsCVTYZQO3GYzKw6ht6QNlpIbpFA?=
 =?us-ascii?Q?iXIl7o4zFw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e550395-b78d-4256-e47d-08de4c2fa699
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 07:54:27.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9/u39qqQpZVJmGxFSHrPWNqrJF0x+6o1OXJpFk+JY+ZwVJi06YVLjFThEIc0tyXp2wLvJ2uOE0SweC9Rxrc1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
X-OriginatorOrg: intel.com

On Fri, Jan 02, 2026 at 01:15:33PM -0800, Dave Hansen wrote:
>On 1/2/26 12:52, Edgecombe, Rick P wrote:>> Would you be able to take a
>look at this series when you get a
>>> chance? I'd appreciate your feedback.
>> I can't apply it. The source commit is gone from the tsm repo, but 
>> besides that it requires applying a bunch of dependencies.
>If there are dependencies, is this the right thing for reviewers to be
>spending time on? Shouldn't they be making sure the dependencies are
>reviewed and merged first?

Agreed. Please review the dependencies first.

TDX Module update series has three dependencies:

1. Sean's VMXON series:

https://lore.kernel.org/kvm/20251206011054.494190-1-seanjc@google.com/#t

2. TDX host virtual device (the first patch in the series below)

https://lore.kernel.org/kvm/20251117022311.2443900-2-yilun.xu@linux.intel.com/

3. TDX Module version reporting

https://lore.kernel.org/linux-coco/20260105074350.98564-1-chao.gao@intel.com/
