Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A34271A94
	for <linux-coco@lists.linux.dev>; Tue, 15 Sep 2026 00:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789431551; cv=fail; b=GppJlpqYoUAE7vWzST2SUwyesI4NEf8BnEv2kv0xKk2QAVcBoZ0hnkJOizNlwaifNKoKVt4oS/ImrifhKNoz//Tn9caQ3d2643HmVuiMjPVyFp41hRCx3NshGygSjyims0Gmfn86vOp2aRm/6j7dzl+pwtRIddMx5ae68/tvgl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789431551; c=relaxed/simple;
	bh=h1r4UouCjsRU7KeT/3fwxzx2TOVv1BZREQ53wqseXRs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KCAqn1e3+HVoRD/xFwV+jEximsg5IJK4WXh1wU//1jzTKTJ3Sq2AQVBiWi6FMRqa+VxtGCmgw7/nTVdxJhjXJV4iayUUEEGgR6AthraGO+Ua1/aDMYb2KBV2G4EpSbB7YJpNk91KqWL2foycVeWcxWUlyzv45fDWj9/yBUYjavU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOqllkro; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOqllkro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789431549; x=1820967549;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h1r4UouCjsRU7KeT/3fwxzx2TOVv1BZREQ53wqseXRs=;
  b=FOqllkrolI7Lbn464BswpNZAKpjYZf+zx0bDiiAvQ+GUYwZtpoJVr0mO
   ralsiQusp+ALbznldMJy3+Vf6smku8cuhml6uHuH8LHIv6CDiFCmW1g0U
   vpX8vwceOhdzvsT8nE55DOu+mp28PQKXQ/4bt4iXvywiBgSBs+ywB/oOD
   sB/YYCsBg+QxjchcD1z5L+Xv+YgOiZqxCmXzi6/0XYvmHMgFETrx55AXN
   0eYXdWXRAQitIapInBj8dDqtHeqGa71CfjxDXSqzZR8EjpldoAOYJAWiy
   +lrJF0xgku1g6Arg3kn3gxxVIV7opjk1JLebMY8BlmRQ1PEX+DBe0VUcM
   A==;
X-CSE-ConnectionGUID: HPSJHUYySbGPI0WpniFEJA==
X-CSE-MsgGUID: rdYgGunGSK667V38B6M9KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="300273"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="300273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 17:19:08 -0700
X-CSE-ConnectionGUID: L7sckVnVR5GckXWi1gbdqw==
X-CSE-MsgGUID: 50oM3TXcTq+HuGkIzDRCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270973024"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 17:19:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 17:19:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 17:19:03 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.18)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 17:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBrVgILjjAwVz2xYFZmWm8+DKyr3QNXQHBbxe14O/dKNdZqyOb6a8tOMXz5vSTIvhOOyGpnvbr2xwWgMy41bJVMfC0LPMg8JTSnwPhwxxEARmeVyqXYfX5MH3u89W41Oc5fqUf95DNTKyiXhM8DM3HVNdHUIHFpLyUlOkVaWCMqZ7vfRiv7umJw4g+XLCV5TYsOqHkP5xQ5f2U5JH8G9oErDYEGMkbBcIezV817KFdEKgUnlEBg3TWoAC5OSLfRlEVzMtPgHPEviC8JZ27Y2cBw4m3sJJ4tWtUisFAiOEbJfnIogM7ldcH+8BlmEb8HgAGkYth02V4uYpsWn2QDZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMXVl++ezkG+ao758PQk8ewzo3npzt+JCrXl7LyWz0I=;
 b=q2NBcGXFHWCzcpFsh9BnOjAbU7UbzhTi5fWk9RnxPNLpg6otwNwMknxfRQ/7tVoWK7hITdIY/x+kiqpD+bUO45iJ9rNCyxMJbucvTJTr0x1quOpK2W/+fq41ijWVvgIwqx5ai2NJQ94a1k3ssJRanTw0Iflm+sOYpiWYHBoy3d/ZiFZ8sNG4pNPoiJ1kXml3kTA3N9CUEy7qux6hWafv6vji8D+1K3Ch03pjpsXa4UKfaoVNKuoe99F/n1C8dV+cd8n8JUBY5rdj8agzkZQ8gQDVkZSb41lZOjt4BA2DVA4xvhteepFa2PwCIoRavE6wLaMMTRk01NjQG1MF94sz+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) by
 IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Tue, 15 Sep
 2026 00:18:58 +0000
Received: from DS0PR11MB8050.namprd11.prod.outlook.com
 ([fe80::f099:a504:2ad6:1d12]) by DS0PR11MB8050.namprd11.prod.outlook.com
 ([fe80::f099:a504:2ad6:1d12%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 00:18:58 +0000
Message-ID: <c833430e-f096-4933-b9e9-b504aec71692@intel.com>
Date: Mon, 14 Sep 2026 17:18:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: <x86@kernel.org>, <linux-kernel@vger.kernel.org>, <kas@kernel.org>,
	<rick.p.edgecombe@intel.com>, <dave.hansen@intel.com>,
	<dave.hansen@linux.intel.com>, <yilun.xu@intel.com>, <djbw@kernel.org>,
	<linux-coco@lists.linux.dev>, <chao.gao@intel.com>, <peter.fang@intel.com>,
	<xiaoyao.li@intel.com>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
 <a9eb5e96-1e2f-4662-9863-61317c163800@intel.com>
 <aqd/BGL7MPGKVoqc@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: Kishen Maloor <kishen.maloor@intel.com>
In-Reply-To: <aqd/BGL7MPGKVoqc@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To DS0PR11MB8050.namprd11.prod.outlook.com
 (2603:10b6:8:117::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8050:EE_|IA1PR11MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 544cd9a5-fe61-46d1-8b9c-08df12beef96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: c9oxBz6k8VQswIZnc2d56b9cace1QL5EZqwmEXWLZvzJ5dXOUbWC0uJly8wqRBYOKOzElBTStWvGkx3HmbkNALA9nWTwgF95AOIwLm1UeHrYIWGgjI1LFASCg5FP4fk0G8LTGgZPB93TXqyZDOcH9InhPZryjk2S9LwwtPLRZwgoC0mTtJoqENRWmKtj5xk/aABxyhxOz39eIzPKVkx/DHfvBKdPRpxL2rFHkg5NJ3lmDLJdOXRydKKJE4WkZOhHxyewaJmupSfGxD80kiUEeM7JIptpj+T5fXXT29PEKQb7/OJMKZxXeyGSy0Im2AL1VPsAdK+yjXMawR0QzxGmPls/Wc4wE2Z+Fz0I8hkT2TNzbvqGR3dM0nY3NU9CPnKLwjL98OXW3lyIHDHccfaNMr+KuDwU6gsTcDWXiHZPQD6dz4x3X2DaVj0Xa1BNNy0YKegdf+f+k0Um7eOnS25wBfdfJBf08a0D2OK4P3t/LzW698rF+eGTRBxNx0upmn48vvIDIaFp7j6+M4wg7kdBI8cfu35n7uQf4RNKMDjyn6swNJuRiCoFm3q3tjJFy15/DC3exghuLrytji/0iLkFQ4J2vS/qckLh2/sYQ+fXmp+exe3DsLZCHjtMMcObi4C+/PsFtNoi1LU3AS+XkEwE2D4IlbNsDDo89SfxRE4Y3CM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8050.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVdqZXJ6OStOR05ndkNWMjhObUg0RGlPcGVzZURwbjdtbUxDdTJBQ2FFaWtR?=
 =?utf-8?B?REhkOGpBbkFFdDJ5K0ZnQWFwT2JnSTRqOFI3enVadnpPbmZMT2cwU1pCZmsx?=
 =?utf-8?B?WVJSaDlXQ3RxSHphVGRSNjNOa1VqMGFGSkNRSmF1R2o2ek83M2lxTHJuZmYy?=
 =?utf-8?B?U1pwaDE3YXhRTlY4U0l0ajNXWUVveDd0R1Q3cVRyTXoxakpqQ0FwVjE2dzZu?=
 =?utf-8?B?elNkVU0wZjVLOXkydFRHVXlTM2MyU3ZHUEpYVG9CS2Q0SXBYdFZtM3VTaHRJ?=
 =?utf-8?B?c056K1BwYUZqd2hxUnBwWHhwY2dWWmpUTk5oWmd4ZTIwME1KNlk4NThjNGNV?=
 =?utf-8?B?dEIyYU8za1lEdktEOXBhc2gzMFNHMVRzVzg5SGFkeURnVlFNc3dwTFBPZEU5?=
 =?utf-8?B?ZldhMnZWamx1a2hpbE5PTnhUK0lWUllMT3BYOFp3aTlpMUJYK2FhWFVMT2VF?=
 =?utf-8?B?ZmJTdjVQZUhpQnJiRmMzVjlHVG11cWM1UHVlL2JpUjRLeVl4anVzVG9hdnFv?=
 =?utf-8?B?OWlhWlBQdU1qQUNVYnFIUnlnZ0pDQ2RsVHBVOUpaWVJJbnBjM2RWQWZLZnAw?=
 =?utf-8?B?WWRpY0o4dmdrc3g4ZE1WQ3d0Tjh4L0l5UVltQTkrS21RN3BjU0pOTnM1bFlI?=
 =?utf-8?B?TlN1SlFtb1F6L1hBKzByTnFhblB5OWhvck1DTlJDQlhCU0NUbUE0b09waW9k?=
 =?utf-8?B?RU0zY0htMkEva1IzOVlqZGFYSFh6bmc3M3o0UUhWRW1FaWxNNmFxNm80cTgr?=
 =?utf-8?B?cS9FU2ZRclM1YldHcFdVeC9KdmhPMnBxZHJCQlMvVDFTY1g5Um5QWDE2cUMw?=
 =?utf-8?B?Z2FsV0pWN2huTlJWY2FEa2NkeGF1SnpvNlBEMkdnVXJRbnlTeExISkd6a3ZI?=
 =?utf-8?B?ci9CbGpaNmQxVFlaMThSbTZRbjNyYlV4Y3NwZmcyQ0VwYXNtZUdRSGVZRFVi?=
 =?utf-8?B?WnUwWmdGNTNXSnM2Q1Y3aHdWTU5nTzJZR3FKMlQwajF1MnlPYjJOd2loSC9y?=
 =?utf-8?B?MklCSmpsQ0UwTFdOU1FoMkxDdEZ0Z2xUelZBMXE3QisyN0FFWGpsT0VhYXZh?=
 =?utf-8?B?Nko2TXZTVUF3NzBiaVpidHlNanJvZHFwRDArVlQrM2NPWXI5ZklPMnN4Z1lu?=
 =?utf-8?B?cFRwblpjOWtGdCsvQkV3azNWbFdQOVJBeTJ1KzliL2MxdmhqWlhmRTNPakQ2?=
 =?utf-8?B?dFZ6ZHNqTmh2clZuRXR1a3lnVHRGZnJhRzhRK3ByL3VDdlBMWHptOXJ4d1Yy?=
 =?utf-8?B?T0Z4S2lYRjNlS3pkbmRTWmFHTlhDclpRZ2FWY2h2NE9LTERJRm1WOGVQaUJ0?=
 =?utf-8?B?R3lIYkx1OUF4cnhReE85eUV2dzhQdnVqQkE4NU9TVllzYUEzeEdBa21INldt?=
 =?utf-8?B?MzhwMnB4YUhwV1ZqMS8rQkwzNHNBYk1UL3JOOEwxcHdQK0hoemNRTnpnK25G?=
 =?utf-8?B?NGZqNHQwYnlxTmt6WXM1QTBjSnVLNUV6ZjdLaXhQN3N5d0JreVFDMVdpU292?=
 =?utf-8?B?RmZZVnZaR25ycVNPQTlhK0IzUXFoNzljRFloekx4RndWbnZyUmtZR3NCbVBD?=
 =?utf-8?B?eTArc2JoeEwrVXNhL0dOL1NCVFF3OTc0cCs0a25EbFNlTktKMnIvUXJ2R2pW?=
 =?utf-8?B?Z3k3ZVRVTzdxRVRtOXNnUUt3S3B3d0hVTU0yR3lUdUlsc3IvTGJYY1hoWXEz?=
 =?utf-8?B?V3pUUDlDTVhtM2RBL0JnSUg5Tzg3a2JWalA2OFdHYjlqZmwreTY3VGNiOEJ3?=
 =?utf-8?B?WkhxWEtLbnM0WTFOWDkwRENzeE9CdDlNSE50UTJ3S2lHblJVQUhZd2JSeFhX?=
 =?utf-8?B?eVpFcDM4YW16a1Zrdk5EWlFyRi8rNnlPNWlHT0FCRjNkclphVytkQ1ZQam9o?=
 =?utf-8?B?YmYxby84ZkZMOUt4STNhR2JjeVE4azJpQ3Nza0ZKSDhFV0NITzR1Z0F4WU1W?=
 =?utf-8?B?eksrWnhvMlA2YmxucHpaU0Rvc25oMHJNQTlmYkFSbGRvS3VlR292UE5wZjFj?=
 =?utf-8?B?emtaRDJjeFdKNDRqS0VDUjBudDZ6c2RvZndYZEFLdHJ0VDZQQ0FhY1h4c2FC?=
 =?utf-8?B?eW5ONlJOYlRmRkU0cDZ4OGtsMVAxRmdrajFYSnhSWUZSVVNJcEFURDFwTlZn?=
 =?utf-8?B?ejhoYnEwd0g1UkxaTmhGUlBHS0drZDNMSy9YdkFxUUJjK2dOeXJxVEZWSi9D?=
 =?utf-8?B?Zkp4R2pRSzNBWW9pWFFTWjZyeDRNaHd3eHJwOXk0TEViZDdrRGZmS1lXZzB3?=
 =?utf-8?B?UXpwOWlCVXNobWQ3Qm1aV1NkU3o2bit4RkcrbGJxMTc3RXpvYVZDQk9USmo4?=
 =?utf-8?B?NmpZRUtod0orak5YVis3MkpqS1J4Qlg0eVZjcVVkRldnenZkQis4dz09?=
X-Exchange-RoutingPolicyChecked: BgtpTtFqIA7Kfg8sfNE5lWLgxgpEsJV7+9XDaE9q2rQwpKomnoBeIuEOKKhjwL80YUEFhLKKZo+yNWYym/k2gGSe9xah1WfRa21hwJu3QfjF0+lIvvchc8EL9GjNMInHfk3w7nrWaRNiffJO5n0Co7Ar5RahiWZO6QherEXDWPYivgkB0t0baF+OdYIkUyZle4IvWGMwyJxmn5p0xG+t0nj6+nImj6tH2IYxK/8Ufhk4jRcqiZhnlp6CI7cemU8+1X63CsHbkuPOoQUmoscHYvUfvUF2iPjpI/1BMpbWtM010OEewg9LjWe2y9Lyokd8pTfRsSNb5i3erRSED6UhQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 544cd9a5-fe61-46d1-8b9c-08df12beef96
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8050.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 00:18:58.4480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nB7RpT8SuYNzKoqDBHx9VuGUdF77tWTa9tjkLWy7BRrdXCgmsuhbBpkVOSQ+XYTeEzFwMXeP6GO89kvxH1OcjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
X-OriginatorOrg: intel.com

On 9/13/26 9:58 PM, Xu Yilun wrote:
> On Fri, Sep 11, 2026 at 12:58:58PM -0700, Kishen Maloor wrote:
>> On 7/22/26 1:46 AM, Xu Yilun wrote:
>>> ...
>>> +/*
>>> + * SEAMCALL leaf:
>>> + *
>>> + * Bit 15:0	Leaf number
>>> + * Bit 23:16	Leaf ABI version number
>>> + * Bit 24	Pending interrupts detection mode
>>> + * Bit 63	1 for P-SEAMLDR leaf, 0 for TDX module leaf
>>> + */
>>> +#define SEAMCALL_LEAF_MASK		GENMASK_U64(15, 0)
>>> +#define SEAMCALL_SEAMLDR_MASK		BIT_U64(63)
>>> +
>>>  static __always_inline u64 __seamcall_dirty_cache(sc_func_t func, u64 fn,
>>>  						  struct tdx_module_args *args)
>>>  {
>>> +	/*
>>> +	 * fn contains base leaf number for TDX module calls and P-SEAMLDR
>>> +	 * calls. Other fields in SEAMCALL leaf like leaf ABI version number
>>> +	 * are in struct tdx_module_args.
>>> +	 */
>>> +	BUILD_BUG_ON(fn & ~(SEAMCALL_LEAF_MASK | SEAMCALL_SEAMLDR_MASK));
>> The changelog lists the SEAMLDR flag among the RAX fields that are not a good fit
>> for the function number definition, but 'fn' still carries it. Why does 'version'
> 
> Yeah, it makes confusion. I deleted these words in v6 [1].
> 
>> get a field in struct tdx_module_args while the SEAMLDR flag stays in 'fn'?
> 
> Because SEAMLDR flag is now defined as a part of the leaf number for
> SEAM loader calls, for example:
> 
> /* P-SEAMLDR SEAMCALL leaf function */
> #define P_SEAMLDR_INFO			0x8000000000000000
> #define P_SEAMLDR_INSTALL		0x8000000000000001

Okay.

> 
>>
>> Otherwise, looks fine.
>>
>> Reviewed-by: Kishen Maloor <kishen.maloor@intel.com>
> 
> I assume you are also good to the v6 and added your RB, please let me
> know if you object.

Yes, v6 looks better, and you may include my RB.

Thanks!
