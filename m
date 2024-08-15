Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F10370
	for <linux-coco@lists.linux.dev>; Thu, 15 Aug 2024 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723764357; cv=fail; b=BFScXBRnVN98Ka37N3E9YfUqJT6snCcIILrZNXqHqRrrZSskWK2oMrzulUM3Zb20nRIN7P+mUBJIDtKTLE7B+1XTtaneLevCyN5V/g8RS52SzUb7OUZqtw7ClhPsTkcj/sI03D5rw6MSUgPGncZEhaB4XB0EA+BfJfQp/gGrRDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723764357; c=relaxed/simple;
	bh=np8E131xbFMZz/ZFchm1p9mGZzo0XUorx/WDkGMNluQ=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=BaMmeipJgVNaPYm+Z/kBSQAQgFONI6C2Un17tF33xVx3ue5BpAG7d3rfnHpqhoLt3zgbwNxGlRQolRZ5TMGzyTBgch7MK9LX5tEKaLrM1xA45N+f104GU8rM31yIcQhp+3VWqVqzKfthmyLxEQGq5gOaejw+4Ai1PHMIq/4j/Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhGH8Cip; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhGH8Cip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723764355; x=1755300355;
  h=date:from:to:subject:message-id:mime-version;
  bh=np8E131xbFMZz/ZFchm1p9mGZzo0XUorx/WDkGMNluQ=;
  b=WhGH8CipleuReVwxuCGEuBvI5Dymj8nnEhjro8XYl53Z2DAI56Pvxccp
   AxE9tQQdw+L5QLztnRCSaYI2gAyeGB1PpuLFJuKwjipxpw37QWUvLLLpq
   fJKfH1SchJCUaEb/hNkJio8cmkulOzpNwy/hOUYkkrPuqTguiQM+Zbx1u
   P/j7w/2Nqlu9BmgGA/RDnbt7URcZuyTNqSjq3Qx0aZJFb65YMBNguUSa1
   exiMjINIX5ucBUKu9OEFeGsooCJdNVLHMuSmkmeb0g60wa4h2+rQa7NFw
   VIrTmsjzKusc7NlbCuAnRVKQzxwS8pKDQQTnzhIQrzHteZ3TJ+6XsGqKS
   g==;
X-CSE-ConnectionGUID: X9rKDs/YSW68fJgWxnqLBw==
X-CSE-MsgGUID: WILb0o1ZQB+Euuv8p5HSWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32720803"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32720803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 16:25:54 -0700
X-CSE-ConnectionGUID: bRuOgx/JS1Ob2BWZ/AaFmg==
X-CSE-MsgGUID: WlgnMm52SJCqKniMFVdMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="64180171"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 16:25:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 16:25:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 16:25:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 16:25:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 16:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXFLgTqq0SLu4ihBbYe+VGs1fS6kA1kjyvrZXB6zNslfDLEBDEHxBq9GyFSnFFaJefPJKhf/xEV7NyCbgC9Vqq9X1nlnlT7XJPfii/OHjePx+KmbwZGR6wXkavuBjjl4ebnFfU9Cub4VIaBGqZT30r20lzTHmrMA5J8wU5GtYyS++3wCO3tu8xdzMZTZpnQX2Dcm14n5An1ev9o6aFFmXiUQj+eTbm04CjiYo+p7KXCDJyOEUajYzlU7PnRrGvUnhvXtkIsyZAT6xAORR/CvFdFN8i4Ex716g2QP9hONg1ZPEhgyS/6RzQ/MOLE/TVXU7Y7/M1Hjx7LPcwW6EakvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np8E131xbFMZz/ZFchm1p9mGZzo0XUorx/WDkGMNluQ=;
 b=BerqtjjYSxqzJLqUVaJ86hyJZiK2AJGzcdbpP8wgmfQsxNOSv+mr9PEnbsNog/45oO+4wMvT2u0A7hVOsMS2OFO7nCdL1SESmI023SL01M/SO3mQk551o/Hc9reY0zzGue9oj46okdVD5PyYOAohtT4U1MT7fvAPm4J4xru/copsZg/4owreTIfAZygDMEGjxWtGy6rZ0w+IeGXUGTyZ1WSuVh+fdJTOlzk7rOLpuw3a+Eni3CVL312mdmXOjLagZCxJLJhygjIG92IPjyl5fcwyZntQAIC6KnxPNDb4dSEIgETWbA6izprXDICEQe2i9kyIN1KtGvFIaPBSdCwaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 23:25:51 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 23:25:51 +0000
Date: Thu, 15 Aug 2024 16:25:49 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
Subject: Reminder KernelSIG / Devsec call for August 15th
Message-ID: <66be8e7d2050c_58e329424@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d95f2f0-013d-4b69-e66c-08dcbd8199f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VxWLU5AdLC2Pgq67F/TM0bLOltGrB5o8yo19TJyT6lWsE5B0M/bSbTWivSUv?=
 =?us-ascii?Q?3taYA+E+U2O2yd58N8hG3fwr+vaYhCwlrWZYUMN9+IZYP80eGQTZq/M1QZGj?=
 =?us-ascii?Q?xG3nyAfRTS/7mvn5BW9wqCSUJbhkwNIWFUn4YX+yFKX/WujEOfUrzffRWR9n?=
 =?us-ascii?Q?mepB5UmXpWJ3iwi8KY2NRrzQDEXEfbREZOTM51gkVWZPlqDXXoC45eNHcg+x?=
 =?us-ascii?Q?2bvVGX+gvHr33Tp6KIJLCPw1XkjK11xcZqsr0pLCzvhVkydGjaVw3XqdU1pN?=
 =?us-ascii?Q?2W3xWrAzDgVrlmssJJsd2fKLQ72u6UT8rHTCtapjStrYy4rdSsjhMZrdFvbF?=
 =?us-ascii?Q?taGJzhz+nJnpjAFNheLAcBztjrD8iLhZPVKsc+J+CuqVFKNZu/fOhcQ/2jp2?=
 =?us-ascii?Q?Ih1gkSzpK37CUo2dwPGfyoAx5VkYIxdek74NyvMAZ+VgygaNld3BApyT9nXt?=
 =?us-ascii?Q?K7sfBnEU04WUKcv+bQPsTB/a9bwTdUmQ/YCtgmKlRm4CuVT0HS9L250L2O3T?=
 =?us-ascii?Q?HeffyglYE/YY9lJnJtpbR64fCI1nn3+Nu7+kubDAsG6BQx34c86EQL3bdjNV?=
 =?us-ascii?Q?Cq7vz3VIfuy7rv7UAk/14qGlBdCuxrZezKBv8ws4SCjfhCdz1RYK5VTKeZsz?=
 =?us-ascii?Q?SGaoK2Kvg8Qm3IxZqbJ0zbltKRZNAKypQtXRSw2LKDIQodJIxdTXMFxTEQD4?=
 =?us-ascii?Q?AVAST6rm8wDi4GhO2tZGxjpXhEnH2CedPWlNyOak0l826xzJq9CEeOYAN0RB?=
 =?us-ascii?Q?/CxLI7A+GWkU/C0d29c2HYa9wMTsCFxNzi2XQMqOy0ugn1cB4Jx0XYP3PGPi?=
 =?us-ascii?Q?K0aOa1LyJgbn+486GB1tVTbkBfNdVrqXtH4cPP3FJK2MXIRISlE8p6FS7mCl?=
 =?us-ascii?Q?LTIKaynnJ4bxDkDSBtb3yNjT0MEI9pUKRkE3zaBUmBApSMVbxrd1mmyH0GXZ?=
 =?us-ascii?Q?xtE+jfnGoVWhfSWZRutgGJsKDXcJYqmeuF5n2GlWiT6jWv5QNf2Sb54W+QlG?=
 =?us-ascii?Q?LOIPuKVVpjxL31/242LIEevBEqXnDKw/Ppm/a4IqJ8wUrvGjVMoKySigBAML?=
 =?us-ascii?Q?x7MgH0WrVQdNGYiyPQ2h7Z4A4lkbR2dWPptquTnfFrzJsw78R/O4RVukL4i9?=
 =?us-ascii?Q?zOX8EtGcThplmGkMvEZalFIs5AXidTFzm/i6/TEPVt5tbAmbzGTHjANNWNQ1?=
 =?us-ascii?Q?91p13F1oIOCWQwPCpHXE3FNfvdGqOo6VuaEjkOUqYH8xgmUetEKI/W/nTtEZ?=
 =?us-ascii?Q?MdDb7M3dPQIAzDzKikUlynwYJM0DONcFEEem8O9iorJiEvlgzGhtYlbor+Vt?=
 =?us-ascii?Q?f60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aedP2MkEI2Zkg082xJGrjur8VB9AsCm+1LPyRDDY23KPHcfJd/SWij7MYF4/?=
 =?us-ascii?Q?lGkIu01dH5Qvuqt0yj/zw6I5rv6nYJLgcYYC4zp0JQEMuNeECe2/Rq9H+EFj?=
 =?us-ascii?Q?McrljX2836qtMuUsFBfHb3AFA1dXkWYS6ljrGSsQhvNg+V6V6mQjDjRMAnSV?=
 =?us-ascii?Q?uaz+pMC61jKbPqq5vaBQAwnNSa18cH/cY2dOUOVaS2x5dMcoorBKU4VqGDCM?=
 =?us-ascii?Q?gDt6aewmpgngHPn9C/UE+KqjJQN+07K/S5JU2gAzB189SfLTwh/ZxHhRcw/G?=
 =?us-ascii?Q?x4xwmvJ3KL6xcC44Y1ijX6AJ4svYf+iGLud2HfU+LowlQLu2UrAmahCwy4I8?=
 =?us-ascii?Q?oANsNzvavGDE+BH+i94Prto5XULBmMlwCH9nJgm3nXjXyvHe8WCGdnnhgK6b?=
 =?us-ascii?Q?TS0a4V6arAGNCUaRsuRcuueoY+tpqokTqBYH6vyknEzmbFdtkY4GvDv4m8ag?=
 =?us-ascii?Q?3mf5qk9oA7VUuVqG45K0Tk1Kk1RrtV4eDa4oiCFxMgzzidNq5E06dt7382dK?=
 =?us-ascii?Q?kZk84IDTtlBBB4Hhtq4kzGYOqEpjYWeYV3c8bzid10i/TP+er5PG/D4HBEOH?=
 =?us-ascii?Q?acIlUhX3gTFEEEnfIJV6hIXod9lbw3qS31cqn5Mg570eH3WqwGnuI9/HV+Oh?=
 =?us-ascii?Q?uvCOWI4g0CvbCksALXEB7uKiowJvtFavWRt9W3JQo4c8jFVwhwThoJpKbss8?=
 =?us-ascii?Q?Emj/52nc1gobvokCrdC5nvTWR/Frrmq8SNXwP2QG70E8fLBB82V7uyfOLZFK?=
 =?us-ascii?Q?QBME5LSPRAWufGpVDHEv2huc90D7zEXQHH48V+kxac4xn9X0eKepZBLoQfvw?=
 =?us-ascii?Q?1OLZ3+QkWlhWiZWN9nrr5yA1FUwOmOspr3Siwnvj+Ecnx2/QJ5A+jzo6oeU4?=
 =?us-ascii?Q?mTPEpjXopM9Pso/EUsx+AOj35sdj3r4qfpis5ypn/704CMdVug3Pnezez4RV?=
 =?us-ascii?Q?KEe9HkXZAY/1i1aVfX6suT58PR6pM4Tqh53LsiOFqtkjMkOiYZuLqBvJls28?=
 =?us-ascii?Q?zUkYvxXDcRIfaSZtUI92xkyqEllF6+14s5Dw0cZmficGWxPaf9WvNIqqG2eP?=
 =?us-ascii?Q?tHa3ECi/Rx6r+5Yl43YsoLot8WGrBPFcuMvGGPSM35PJ08wQ4ofrxqYifG4c?=
 =?us-ascii?Q?UDbeyWdNjtt3r/uxHw7uEhx3mpiixkyOKkO95I9+os3XVfzLLgFoo1dGlCxV?=
 =?us-ascii?Q?s6idoX48Z/t9dXKMQgW930rMeJpzftPSuR0z1e8ejVuhTFRPCkvm6aUBppYf?=
 =?us-ascii?Q?htRb6UvjhoJeXHjkEDUds9FnYO4cu6x+fzleuDnjelyU1ibAcoCMS7tR0uNd?=
 =?us-ascii?Q?eLYB0Ldd1LvPlYyXlo7+DXZR+fPg3cBnuKF5rfDVnTtoFAHdjGm+MtGSa6q3?=
 =?us-ascii?Q?mpTbSWa0ZDA8jNHtYtxFQJKIlhVh0Jrjj/H0r9rqv12tA0LA005KkA0ylocw?=
 =?us-ascii?Q?YlZEVPgk9a9PodFBiHCFZfUWbAYqlIqGr7PV6cGpiCUdo1wy4MJPgmXzuuNw?=
 =?us-ascii?Q?3wMHMoIGqYl/USPfJwbDdPdvN8jrORjiy7XMybJTuJdICBnaRk8aFHH1KcyE?=
 =?us-ascii?Q?s3AVFCp/tX8qOElI8fgut4yBxxjZo/4+CJxNZHoeVPTB51XVbjpvkoj+w+tn?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d95f2f0-013d-4b69-e66c-08dcbd8199f9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 23:25:51.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 35goDJNKZ4hlTnO2QUqKoNn4sRTCOVSvcxpZJ8BUpiy7d/WsMUk9QSVlfwyIFJHfbK0JLXKjw89JeSJyYotp3taYJ/+zsWkePuthwPLaWDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-OriginatorOrg: intel.com

The KernelSIG call returns this evening (5pm PST):

https://zoom-lfx.platform.linuxfoundation.org/meeting/93839468474?password=96856146-3e07-415c-a783-9edfe840eb88

The agenda for today's call is rather light. We can continue the RAM
Discard Manager overview, and have some time for office hours on the TSM
driver core, but otherwise might cut this instance short.

September meetings are cancelled for Plumbers.
