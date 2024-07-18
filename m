Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79D77E0E9
	for <linux-coco@lists.linux.dev>; Thu, 18 Jul 2024 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721343572; cv=fail; b=JpPQyG40rGzHIDNgJG7DyGp22OReWbg+AuUxcvJnZKwmETjAPGXOlkaYQgwA5dYgsTdc0By6lCEupoxjpRgCdg3EWdVxbpSVTDxIE1fxQca9FzxFXTJI1N0y3TlClFGYBm3HKv7Fi8qIIeRPjopHpewGJIQbXKhZmvelsYCVtYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721343572; c=relaxed/simple;
	bh=oUzfjTgdSc8T/0Wv2R4YGosThvw2wsEWlS3q9U50sNM=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=HjB+2Z5YyMZMaCgUU5VpbpueOUCojBD5vXOrUVAexcZ+FKy87QayWBla0TkKo4eXRmLXkvhAJLBpapFncCeuPlZBIQ9Q1rA60MZvjgA+0o2tsGbxl6SNVomXScfAnWbTLlGacvD+o+spr0XgQHdRDCjKftevftQl5+0VAHB1kmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMDqQMFv; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMDqQMFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721343570; x=1752879570;
  h=date:from:to:subject:message-id:mime-version;
  bh=oUzfjTgdSc8T/0Wv2R4YGosThvw2wsEWlS3q9U50sNM=;
  b=aMDqQMFvnA1z0a0euXCPWqKAhAHG5X0k/o0IQtUqD50e/1gmvlQEk7uv
   +Sk5DzefKQjJ6rsGWs1o2Jok1dNNYNpYgy1S4n3vouhf+hO8VcPdUOHh3
   XgsY1KnKyxZ676FvkjaTDOM6t/y7k8N7R9lvOpZF4Aq+a2QkREEeZryio
   dWunEEkHQjztYQFmIoT7I1KdxQIIrktGiRDPrSoyw7MfA2yf2Kw6kMQhp
   4DJjLc8ULNfkKyBN+Zdpe9zOWHt/B3VKob4ixNLoCaNNSmBgVm/uPO0dY
   or2AV8pKLZfwGvZm+WgA0VwO+cXMLMzHj+I/W1A584rBXXcFktMbERP8a
   w==;
X-CSE-ConnectionGUID: Vh1Rek+AT4O7VkXCVNc58A==
X-CSE-MsgGUID: GSG5wvSRSuCcRjz9V/+M8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19073680"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="19073680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 15:59:30 -0700
X-CSE-ConnectionGUID: QkwDP7rKSza076b6SKwaFg==
X-CSE-MsgGUID: PHxROdtNS7unk96GBb0CuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="50784118"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Jul 2024 15:59:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 15:59:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 15:59:28 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 15:59:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 15:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwHgIrVJK1He3cTVbcGKTGOnoCTxGtR04raugfXAZ6s2H5DAWraZP2M4G4wtDBmbRWBpmpqBciQPy778wVhBUG7ehKUH9mBYZqQpakfwzt0va27hhT+JgTgn+QbNSrLjnkAkf1F1AxjyEu4sa7LsSZKXsazszsuWSnMsQLQwGiqCnQHp8LH0aFtBmjk7rhlGE2yKPy2XfzvkGyRvfpcf3/T/iTjKqWlLwnwXeX6uwLcINdbx5nszcerRd1XBetDDeIE6oCx0EYIV1iUd4M4mAV8F+2LXG3caVx++723N/WMJLWT4CVeake2KL6xaNVMcc+F1lhGAX4QU5x5tIpAPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUzfjTgdSc8T/0Wv2R4YGosThvw2wsEWlS3q9U50sNM=;
 b=ywzzoT319D664TVEr87rksW/s0Z2O/RyuzprpqphUIA+P5ybKMiUbWc2pVl9q45hAuuMXAe9Nxm326DORJvNdWDTnnEJxTFJcAnfKNCRU5Gsn+AHX+iH+Hb0/1p2A8NILUngyZCuPF85bdDVd0HqqGyl1RmapiY2oQW3jwKMfm3Ra02raoPlb6jrvczsyUFUGYfexskFfMFHMlSCpvU+c1tZxXRwIx6AGdCII93CJINi9+KmuqAPOZOxebbe9IDiQ7k1gym60M4b0AcFps873iuVizV480dYN6ybBlY/vUhlnn0kKrBHcqTZWg8XKk8l/vGSFgvWvHXlmLhaEIUVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 22:59:25 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 22:59:25 +0000
Date: Thu, 18 Jul 2024 15:59:23 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
Subject: Reminder KernelSIG / Devsec call for July 18th
Message-ID: <66999e4b2a0b1_255322945@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:303:b7::10) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: a446cae4-08d2-45e1-f053-08dca77d4549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0mUjhFB/ZlvOyujUYdx6nnwSA9/6QPUdL0iAf/vNRBr+FrMo3OiqEbD+PmGh?=
 =?us-ascii?Q?x/g2WqMequ+KN3qcBI0vpex7Xz4p6aJSmvRuofXS+fIijMJdaPRbEUxJ15V7?=
 =?us-ascii?Q?jXUqpDqVUoY9qD4gqC0PQLs8JnsS8TRo6RPVfqP9Q/OYTYgf2MTp6JR4NpVd?=
 =?us-ascii?Q?CXT4wZG1imbpieYZqkA/93WqoIZCwaG7H3FugZPqD0ZzjRMxG3Qs6foT0oN3?=
 =?us-ascii?Q?Lma1zGIhRm9xjeGnlbuG2tvx1AUrZrpb5Z2cwGMWa+aI5UupXHvYzKbCUsN0?=
 =?us-ascii?Q?Z3q//J/iODJPRDaLsfil+JYkawgqjXlgZnoVry8Ve9AF3+zoQihfKCZayxGG?=
 =?us-ascii?Q?L81xfh0n4IDQOcVaj274iUKB2BS/YDNc6C96648sfjHr0TKRM6BtwAvWUQci?=
 =?us-ascii?Q?/6xUBvpDMjcBA4xmqUFD5Vz/pPiHbrJe6TnKj2MC+iMXSv8f1tR4P7/lXNd3?=
 =?us-ascii?Q?P6Jk/eHeIR7tRKhM2sHmT/jpG/qeaCTzBCgnhKmXqVESfQHX0LQ5dD89/pVy?=
 =?us-ascii?Q?HHishG/sqWRnBVFS+q6Uuwg7DH0S79D+j+dxzFyLcYUyYxrEvtYkCLC2XHML?=
 =?us-ascii?Q?PlyhoiTjpcfhKtXUffxyPdJi71knIOpbN2j5IIGEoF1Z8rBWcmRQ6xNKReUZ?=
 =?us-ascii?Q?6jEHEimS6iPLTHz/SV1mCC+XQT1K9TMpAmOf1rWvKL06ctDQ01Tk7EnxAH3P?=
 =?us-ascii?Q?x3Hrns8nRD6ATOvL/wmUh4ouW0l84ucQBqKPwCPgYH7BG5msgCE4yfkNM4Ab?=
 =?us-ascii?Q?WNhB4CRA0A8ZfRsCLfBsPGe5cD2Ju5MpfBzXIRV7NrttncsFx15HJFKPCgLT?=
 =?us-ascii?Q?/E5dXFwjwbHPpTtuQz9nzpETCLH9AObEwe7wTq+rlyUBizT4ChyxmblGs0tn?=
 =?us-ascii?Q?utSPTAdZCmSt0YDms04lTz24R36CqC1kdW69eIT1v7IuYEYIfBRb5MO3liQv?=
 =?us-ascii?Q?f0SKEsnpLmfhtiwHi9NylT4Sca9K5P4Xk7Pi5QWSx6OwGVx01aCPPaWiE8lG?=
 =?us-ascii?Q?a+t+pSgZk6x8PNSpY3Bu4uEh2++m+Y67//YHs/oQYXCFdTxCneg9Hf9AWO5F?=
 =?us-ascii?Q?M5Bob/EOt2csISiwzpba78JTz431oohyDpdwyvoii0UQT3hh6pxynONxBb/X?=
 =?us-ascii?Q?gzJtkr2aBAydQmK2EEvUbjLyYhtxAdfyGl/v4irkl2MGf9igFokYpk2PBlc/?=
 =?us-ascii?Q?GRdcV5u4GNa/JL3JtZJeZM1eFo6u1t2KihUIZEJ8wnwL8DsvF0ksnzXQhMBd?=
 =?us-ascii?Q?hHSk+Vw+em6TZUF3lpMq5MqkjwZD5E4mKbEgC/0yHTcOWK1+SEibF1Gflepd?=
 =?us-ascii?Q?mkk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GFQbA7DuItJ/l7SxaPyVfbMnySMQeMGiuwrEj98prPPstygL1TkXcRLAlVBO?=
 =?us-ascii?Q?Sd6ofAt0XZedwiY2Q32C+oMWll85PMx1LFCTHiVJLo/SnIReCa9uuNoYT8OU?=
 =?us-ascii?Q?w3HffFr7e0D+dwSEbEFb1VJRHmjo25lFKEf9C03hQ+pIC9xtLwbODoTXZ1sO?=
 =?us-ascii?Q?PUfLiSAf1Id30CMlDn/9IaZNP4wJZAzrZOBCmR24njZlNPuBMhWzLCUq/Oqe?=
 =?us-ascii?Q?+qlwIV/iP3X+Pt21IdKMW+7rmYXkt+yLaFLdwt4m4DY4oSG5Y7QUzWHEFCXz?=
 =?us-ascii?Q?MaCLiUVPtXqFTOI2WXoNNaIUtDWMMBZ1LmlT5qiUUhBbTruYFTL8t53bU1ll?=
 =?us-ascii?Q?+dNb+taK4OmMIaUKdwviYJO/GOEdGkY9B9qbhK1Frq5C6yzSuwy1+eOYeUGn?=
 =?us-ascii?Q?Dk89XNE5LVi/0nto22SclglTrHAAtzJUhO7cjq9Mf2rPjLTkRgPchnhC41Tj?=
 =?us-ascii?Q?Y8jAusM89MWPPNsRhok/X58uJ6c0irtvKk9JHLUQsOtMsRbbW9O96U0SGRs0?=
 =?us-ascii?Q?WyXDcgAm7BuxFZWyf/Ok6BQBNhq4AHXUdKvjzmpEQk+nGLRScvPwMMElQAtL?=
 =?us-ascii?Q?kWa+M8YxIlTwtmU/ruvx58ItRZtMX5PDIrx8c1QxIX42ziMg8GaHzrB415KS?=
 =?us-ascii?Q?WcXoTNpQ3CAfqSf5Z/Z55XXUoayddDgbDXuVUtfhMl0MCdg3E03MB/B7eoFi?=
 =?us-ascii?Q?wvjtjL7p0uyIptNNjPh+hnJL8RowFxXb1fGVm3nGeeiTNe1YJZf5+04Bce5U?=
 =?us-ascii?Q?XHtL0GOMhqVvaH829t5qhrlqC6yWO5Rloz6I6bUNPS3hWmwdZRMg27ixoYB6?=
 =?us-ascii?Q?x4DKnHO22U3nGafLz3AyFWyLGgfcnMeYqwpQjL+C77HJtMjGr/gIX0Y59qD1?=
 =?us-ascii?Q?FyXOdXMU0BV+14oITnRgJxAZq3iLDmR76cfYskyuZlSv4TEPtrB8yV0FYOGp?=
 =?us-ascii?Q?qHXA1q5T36o5i3D2LyJBEncWb/Wa45euhGX23kPCXA4PxYHAGKC16Ku3H3KD?=
 =?us-ascii?Q?lQKqp4gKTfeDlOgjgj8GLJxkAYtemokrJIN8ID7W8NQ6DsL9aWaEi3T3nVNv?=
 =?us-ascii?Q?Vt6Z8IyWI8M6phUiFOFkvSKp04g516ZyBj1fLctUS9cSDnTVoYTuS7xC4Rp5?=
 =?us-ascii?Q?qJRiwuChv9Oof+N027vJN4trMFhUDFuSEUmtXw+/HMKVN9N8HtXEGEmxXQEQ?=
 =?us-ascii?Q?X0QbVxPAVqZqbi9i8a72Coy/TdhOQIhooPiRIL5FM/Pc48wLg5Npf7VphJUP?=
 =?us-ascii?Q?jV+ktoO00zeLr6bhsaf0vnW4pxpz9j4qPK3xLexoxcpHTXAochQwk1jHMJuS?=
 =?us-ascii?Q?sysS034kFcrU4Yw9vhzDh5/zpzjaqdMRa/k91zo101noTXl9V4q4MubkbAvE?=
 =?us-ascii?Q?Szrg3oWKqZzl1rUzBc2OLmy2mGW5ZqBQpS10v44E3rjjPsOf20qhpDlw6CNM?=
 =?us-ascii?Q?cxJYwa4GnIrdaQ6YKkHXo6KB8UJmBDPH4QGFJpskPIUMIROG9ODVPa1bYp9X?=
 =?us-ascii?Q?gjgmF1v1RsaugsHdY904wQYOriYoCO/PHoMim3gw9N2BBDDchUQUejuWbyjs?=
 =?us-ascii?Q?3ZFcsKmpVUI3owCP0aMH8jbHSZdLFale0/J1Z/ujn3/abxurEhQIsvfYs5CG?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a446cae4-08d2-45e1-f053-08dca77d4549
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 22:59:25.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q07e2zQK72aQLpWi/3HT646iA6rqI5HO0gD5WCXFWp88BnlYKNJn+36jMtTudPMCRBfupugMxk+WnnyGNMAj1YQPvF6mXz86SGrm7GHhKYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
X-OriginatorOrg: intel.com

The KernelSIG call returns this evening (5pm PST):

https://zoom-lfx.platform.linuxfoundation.org/meeting/93839468474?password=96856146-3e07-415c-a783-9edfe840eb88

The agenda for today's call is:

* Opens
Reply to this email to add your open, or bring it up on the call.

* Review the SPDM ABI for userspace validation of device certs
http://lore.kernel.org/cover.1719771133.git.lukas@wunner.de

* Shared Device Passthrough: New RAM Discard Manager
Early preview

* Device conversion vs DMA API, near term vs long term arch
http://lore.kernel.org/20240715235510.GA1482543@nvidia.com
