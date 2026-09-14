Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3B43AAF5E
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414176; cv=fail; b=MK8NQ9HyO/JOEy7AXSPMMokSp6jUe4KuYvkxp2bnsewpekxMpW+4MDTTQWqI19jhLUoIgmKCnvlKn1VKbimQ8Mue+56TjuhbSSTBRIMG0Z8eDKWxZ8ZW4oXPwNAUfxl5fRG8p2f0f8rVdnrVpieZXgLGRhZf23dsIU3bbD55eD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414176; c=relaxed/simple;
	bh=Q8uL6UYzIFsCQixsdaQ2L+7KIWKLE2Gf63/BL0X/bDs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EKau3zpViQ5Nvpm/X+uXfRFjA79UCFe4DJxRUSTPDU0ZTHjY/6YzPnYYcsHMQyKhH7ghGEMHbpyy0spuMtlX3IrMwBw9QgTWrUL4J/Vt0o6odMOMDJeC6nh35XleggAO9TD+OC4RQaVbEt/LqeECUULBr/rvbZhHsvzoi/Tft8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cg3jteh6; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cg3jteh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789414174; x=1820950174;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q8uL6UYzIFsCQixsdaQ2L+7KIWKLE2Gf63/BL0X/bDs=;
  b=cg3jteh6q1bI7MiBcNpJjHWdEvLXxPvWzFAUIvbtPiCv+h6Z1ZqmBzNX
   CLfC6TrhYV72iD3xdBLQKUv3+6CHZOFeSpsw/kcg8f66lRYBebUQ71Dm1
   r+4tky66YVUToQGzbPWDqP0p6rkMF9CeMQyLjdn6tFd15CEBFbCrWEorA
   1cfO5DRdtzafo3rpZ8fqHcJ/pIcMP/TmeGsL/DzB0udJlCvIu/DfpTVkb
   ohijt6eCUQEDrqKHaFkhdcG52Ke68LMhSpaKCK9FhK02r9ocuIGDlhFr6
   FG692f3k4w26YzIO3gu813dy6IwKhbMhPloVGtpCzd2EESP1CUwxocK1m
   Q==;
X-CSE-ConnectionGUID: awle4ql4SeaeATthe9uo+A==
X-CSE-MsgGUID: ERJNMKiZScWVWYnBkY61Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101121774"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101121774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:29:34 -0700
X-CSE-ConnectionGUID: 1KcoltEiRJ2eSYPFNbwWFg==
X-CSE-MsgGUID: ROhnCR7+RgCKS3iuHdlCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277987949"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:29:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 12:29:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 12:29:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 12:29:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwy7LuP1m3XCf+r1AG36BaFE48ITf1b52nIr3Lw2/5//v2SNmJS9gcFyfYsUVJFmPgnS3t+dj0EHEWZPfBDRlGg1LVMslaaBwHVhJs7PuiDMeKkx+6ww+PKp2n3iMok5mLN1rjCeZpVoj5qwJ5DtGcKLYtt1Sdm1rc5+3Q+z866aWO0Oz4VGtqJ4TlADgdehpTr4+bIUHGhWpfxiX+1uSJFm9plXyGBZ7LSeGDzsr54RHJGZM3ARZH5727uFGxRDkndV3UV9TPqsxpWUNH//mIsFk+woxgkZdpt5FF+RmDjkIX+8IxnKBG4oAPqp5eFmZWFlcrTaf2tMlDZwXTHwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03DdwoX7+i2TGDUkKhz1e+1KD42RbuVBb7E+5fc9yFA=;
 b=DF4OH3Enf/fUPfLBz+IqyAs9jFuGsD/BFMhqEbMtCpdh3Y6VqS5VcVUAI6EZYt9qV8XxUxq3fdABeh6KZL5zDLW3kvT/3kfUbtEfWbva4I7UYji2tGPJ/7aLQZKRyc5MoODfPdR+87ue2yYzXaWak/2+MBk+ZXiKz9nl7R0zbiujpyiJQTUet5ao7MCdZh+xI05DNPFxogi/s5Ig+l/DoruJtWblkAyyVvNHiKTe7iKglYqztxPMOd5Q45znMEsRBQgpPlm7XlQpfGBZQDCNpchSU5Hd+uK3WoqKZev5o18yaiac6dT/TUIjqfzKl2BaUO0hjPbn/m4jEe2SHucyRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17)
 by SA1PR11MB6685.namprd11.prod.outlook.com (2603:10b6:806:258::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:29:25 +0000
Received: from BY5PR11MB4306.namprd11.prod.outlook.com
 ([fe80::ac99:92ea:20f1:af39]) by BY5PR11MB4306.namprd11.prod.outlook.com
 ([fe80::ac99:92ea:20f1:af39%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:29:23 +0000
Message-ID: <612371b6-955b-40f0-89f6-7c8bc936093d@intel.com>
Date: Mon, 14 Sep 2026 13:29:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security Protocol
 (TDISP)
To: Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, <ankita@nvidia.com>,
	<aneesh.kumar@kernel.org>
CC: <linux-coco@lists.linux.dev>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com> <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050> <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
Content-Language: en-US
From: "Quigley, David" <david.quigley@intel.com>
In-Reply-To: <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:303:b6::27) To BY5PR11MB4306.namprd11.prod.outlook.com
 (2603:10b6:a03:1bb::17)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:EE_|SA1PR11MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf2fa1d-f137-43c1-c9ca-08df12967b7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: rJ3emohmNuyt8Yf42mcRqNuGZT/R5ddWYIiiA60FXmNtQFSKUUV28WjfNNXbkm8j7IwR6Yl3PxXWai3jtThOZagm5LCwzYbgbe2SagjN9vyZsGJVw5Kk0qzECYs24qKtYQ4hQyRLdBhkCtad5pLuit3JoSsTdBuBHrCscwmAwBkAg+D4Q7L8inJDNB5HP6KgfxpaXiDBDyIH94eCtt6Wkp19OB9B9arRtI8G2huxp8+QG2YnA6X/BXoJeEARJiR9zIehVSDuaern4BsYsUnmsb0Qxbcn83rBEznRLPTBwQyB2hphsY1GLqL5M+Q91Es4Jm0WyGw1LpyBi5Q4m7KJKwx3Orze8qrzKaXiHQzea/Y6bTWRXXPRhZiYu3dKzvyc1d5d+0ftTJI333oXeOA7Xl1Sy9MTZM5Lusn2kOWaSjVaDItw0TFvHxruceSo+TplSj+fNkPUtjugpAMfq8ihyzPyuUsg2C31P/voDRuCq7ZVLHpcItGEcNbWQnV900FAbI8dn+JAfQiJnsOReTFzMGApmMh/c71iUnDeLtXlf+f7TY7rYr79iqU0Vg/bx1THkDglTrY8Lyls/mKeFM5q1t++eLHLcUANjLYqFlghI3CLLNfOvp4YgSTufAnfXn9GJC9+icg7beNEpCWSCIfvDXenf1cxrJEOO1HydOMCUX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4306.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZSsvL1ZObEt3QXZvT0kzNC9uTSs2bFMrY3VHdFBXeGl3eXExbkpBYkFVSWJv?=
 =?utf-8?B?Rm4yNHJrSzJhTmMwYThBV1UvOStzL0tNalp6UFpYMFBpdEUydmJrN01STko2?=
 =?utf-8?B?VFlYZGlFZTdUcEVuQThmeTgvc3RlMHRjSDNZMGROWExOdHY3TnNGTHJkUjll?=
 =?utf-8?B?em5LUk8wYnRaK1NVdnVPdjI5aGVkMjBuZnN3L3NFMmJoZFRFYTFEYzJUYU8w?=
 =?utf-8?B?VVlCMDU1YS9SN2RyYUZnZExCRXd5UVRWRW85VlVSbHVwdGpDbTRMYUUzeW92?=
 =?utf-8?B?c1AzZWk1TWFhU3B1eklsTTFoN2d6b2s2KzFYSzJqMUVmUXZhMlhWelJmNHlC?=
 =?utf-8?B?LzRxaFhuTnZDN241KzVFdWsrSytLQmZ2NmxSL2NBN0RoeVh1aXA1Q3NJZ0h2?=
 =?utf-8?B?Qk5ielpKOTVGTnYwclVPbFhWV2pkL0cwQUcyYTB5UFVrTEp1U1RIdytxUGlS?=
 =?utf-8?B?OEVKc0FLcytoYVZFQXVyWlFQLzYzUHhId2VHWXYrZVpsTHpKTGhpaGUrejJ1?=
 =?utf-8?B?QUx5UGpWK05LSzVLR3E1aS9kMzlOSGZpT0JSM2NId004dGNSck82ajdiSU9Z?=
 =?utf-8?B?Um1OaW5Nak5yaG12WDFUYkZ6eldlU2NSaHZjUkxXSmJFNGRuK1RkMDZSdnE2?=
 =?utf-8?B?NEgzNG1OaTlkcnYwei83OWZJTkk1ckRRbmVxVXN6UDBRZkN0M3FhK0dxTENx?=
 =?utf-8?B?WkozU245NW1QSXBzeGNvSFk2Wk9nMmRpWVloQ2hjMWJGckN1SGJ4bXRmQUE2?=
 =?utf-8?B?b0N6MkltbXdQU0pxM1ZMRk44U3RCV2R6Zmdwc1VCcTBvckpwWFNVVEtGLzdB?=
 =?utf-8?B?aWc3QzYyQmUyWE5vckYyVHJXblpyRmpNTCs1VEFvUmYxK0lPQ2dQVHJ6WjJZ?=
 =?utf-8?B?OVh3dGZBTU52YW9DNkxrcExEbTRMTUZ2U3ljYXBLU0xnUllKNTk3UlVPL1RB?=
 =?utf-8?B?eE00YXFKbEowclh3UjRzYk84ZjMvT1I1aHZnMURTcjd2TUlqYzgxMzdzMkF1?=
 =?utf-8?B?TnNiY2VkUitIUHJ0ejErcndWcmZRSjUxSmlWSndaQTJlSDN3a3RCeTN3a0tO?=
 =?utf-8?B?cHpqZk0zbVpLTmtJZTdqbFNQdzZ0SlJTZWRobFJuVEFNMkNXaFRXNGdOd1NU?=
 =?utf-8?B?YzdqNEp3bE9vS3RsM3RiVno4UWJqWUt0T2FZb0Y1YkxxL3JRUzVYVEpHZWM3?=
 =?utf-8?B?QnZwaWgzbEhReUhzeWJNbjh5VE5Wd1QramUvRUFJcExIcmFwS0JMRjZLWUhF?=
 =?utf-8?B?dHR2RDkwZEo0ZjhiakJtc1dUUjFCWGhZYmU0NmVtVzhoMXFINSs3VUtSdldx?=
 =?utf-8?B?T3kyZDFRelZXaEhuV1llVE9pbHBJbDhyYko0ai9Jc0NZMkZReUhIWGhHQ0ky?=
 =?utf-8?B?bHZnS29yR2MyU1pEWWNYWk5YVzZTUGg4cWtrMVZFSzZzK0l1VXRLNHJoVU5B?=
 =?utf-8?B?TDc0NFVhc3pWZW5sam5OdmZqOTdJT3RuNnRLaW1LQjhnUG1nYVZMU2IremJX?=
 =?utf-8?B?anFGVHoxV1pHWFFHM0o3MXFUQmV2Wm9sanFVL3k2eEVXU3dsOXlzaFFYVWNp?=
 =?utf-8?B?ekk4UjV4d3JRT0wrVXB6MnZscWtHanNFZ2k4WjRPa2NNYmJoa0VlYm5QRWJu?=
 =?utf-8?B?T2sxR01LZ1lrVWg4cG5raTRkbmdzSDVCUWFJMkhhQy9KM2JzbXN0N1R4MStX?=
 =?utf-8?B?eFdRcG1uNy9UU1AvbHl4Zkp6c2RWUnRtUW51b2hIZUw2Q1hhcXV6WDNDS3pO?=
 =?utf-8?B?YzZsNldrcXp3cjV1akNIbG14c3Z4NlB3NEZXaGY5KzZ4WTl0YXJhTUJrb1hw?=
 =?utf-8?B?Y3pTWERlaG00b00zSldtNktqWFFzWXkzMnV2SlM1UUdpamZsb0h4M29KdzF2?=
 =?utf-8?B?bGJzRzFiYzYza1JVYmpmK3RJREZCb1Z4ZTRlVU5zdHkyZ2ozdlZWNjFvYmN5?=
 =?utf-8?B?VlhGZ2Y5MTdZblQ5L1dkN2o1Y3dxQkp1cTVBOUMwbCtuMzU2Q0o1T1l2bk5D?=
 =?utf-8?B?M1o5Q3FHN2pPblVLMmMzQUVjWmthdHNMM3JOd1dXMjBzVmMrQU5sMEtxMkcw?=
 =?utf-8?B?azBaOUtRU29CREN5SEdkL2tFbUVJc0hwNUxsT0tOWGp3aGJTT0k0OC8yZ3lK?=
 =?utf-8?B?QkpXTFVoY2hraVEzdUZTY0pBTWY5Tm82UG03ck1QMmJaTnk0bk5aODRNOS9s?=
 =?utf-8?B?WldleE1YcVdHVlB5ZS9CRXlnZU5ZRUFFR2toVGZrWnRJcEs1SGZYN3Fpd0VQ?=
 =?utf-8?B?UUlzeEpnVHVkS28rQUx0YXl4dm9hQUtUNTFsSjRpMUk0SXlMeXk3ZjMwaExT?=
 =?utf-8?B?WDNlZWFRZHNVU0NzOExGSktTMjBUTnpQWmpkMjB1WjhVTUZhYjFUQT09?=
X-Exchange-RoutingPolicyChecked: CgypVpH5cnc0AKvDJ2CiUBrvp8GRXtJNiPVWDjDXkYUTvIZK3Rqj9opxwkMebEhiBgurS2Z0aDjN3FnCs0yCJ3GSGmMfi01ON6sUtdT0d98zVt5JCqMSpmXxi+7pZGuXYiLkxZKRve5A5rfXXjYN+IiXkkjdQOSHJhbieMaptoamcPXB2QRei4Dw2Kj4UasBBM6w/vd+H3ocGrJAaIvXvu3MZnWghOVc+68EjRXpOKMy9z0jrdSjY7CnwZ0GnjUH7hogwmLuOFW7/Ona1pfQcwOOM523K/LWl88f8HUIYmQRWxNxgUgxYNxLWLiFg2u8PR5NgOPuGTkAiBYEDg43IA==
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf2fa1d-f137-43c1-c9ca-08df12967b7d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:29:23.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MixIYlLlMj1+/0FZvOHmwwaH/2hr+C2QTwgTHxyQgex7DkeMDngAHESng2fiFSiqSgiPVUd6tKLR4BN1bfYwRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6685
X-OriginatorOrg: intel.com

Was there a decision made for a new meeting time? If not are we still 
going to be meeting this week at Dan's original meeting time?

Dave

On 9/1/2026 8:20 PM, Alexey Kardashevskiy wrote:
>
>
> On 2/9/26 12:12, Xu Yilun wrote:
>> On Tue, Aug 04, 2026 at 09:55:33PM -0300, Jason Gunthorpe wrote:
>>> On Tue, Aug 04, 2026 at 09:48:30AM +0800, Xu Yilun wrote:
>>>
>>>> Glad to see you all here to make progress! Intel can also help on 
>>>> this.
>>>> Can we have a meeting to discuss on these topics? As Alexey mentioned,
>>>> previously we had a bi-weekly call, perhaps use that for our first
>>>> meeting? Or what time works best for everyone?
>>>
>>> I prefer we defer such community discussions till September, that
>>> seems appropriate given some dates I've seen.
>>
>> Hi Ankit & Jason,
>>
>> Do we have a plan to schedule a meeting to discuss next steps?
>>
>> If so, we can figure out a specific time on the Discord channel.
>> https://discord.gg/KKqC438c
>
>
> So I've been trying to find a time slot. Say, keep it on Thursdays 
> (USA) (kinda short notice), bi-weekly, we can do:
>
> Scenario A:
> Seattle (PDT, UTC-7)        07:00 – 08:00    Day 1
> Atlantic Time (ADT, UTC-3)    11:00 – 12:00    Day 1
> Berlin (CEST, UTC+2)        16:00 – 17:00    Day 1
> India (IST, UTC+5:30)        19:30 – 20:30    Day 1
> China (CST, UTC+8)        22:00 – 23:00    Day 1
> Sydney (AEST, UTC+10)        00:00 – 01:00    Day 2 (I can do it once 
> in 2 weeks)
>
> Scenario B:
> Seattle (PDT, UTC-7)        18:00 – 19:00    Day 1
> Atlantic Time (ADT, UTC-3)    22:00 – 23:00    Day 1
> Berlin (CEST, UTC+2)        03:00 – 04:00    Day 2
> India (IST, UTC+5:30)        06:30 – 07:30    Day 2
> China (CST, UTC+8)        09:00 – 10:00    Day 2
> Sydney (AEST, UTC+10)        11:00 – 12:00    Day 2
>
> Scenario C (which is the current schedule):
> Seattle (PDT, UTC-7)        20:00 – 21:00    Thursday, Sep 3
> Atlantic Time Zone (ADT, UTC-3)    00:00 – 01:00    Friday, Sep 4
> Berlin (CEST, UTC+2)        05:00 – 06:00    Day 2
> India (IST, UTC+5:30)        08:30 – 09:30    Friday, Sep 4
> China (CST, UTC+8)        11:00 – 12:00    Friday, Sep 4
> Sydney (AEST, UTC+10)        13:00 – 14:00    Friday, Sep 4
>
> The link is:
> https://zoom-lfx.platform.linuxfoundation.org/meeting/93219227394?password=80705486-101a-4e19-8f11-0baaf92104be 
>
>
> but if we want to change the time - who do we contact? Or set up a new 
> call (again, how)?
>
> Please, comment. I find these calls pretty productive syncups. So far 
> we were not having Europe in these calls.
>
> Alternatively, wait until the LPC in a month but I suspect not 
> everybody is going to be there.
>
