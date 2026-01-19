Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD034405F
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812091; cv=fail; b=fFTa0Xae6qU1VIma/9fMj18KBH5TBi63WTnSUa4VAeLiC/FaqKjG2wT6o4VvkDHrBkji3p3eVKo59HxMfzNb0hd+HLbGwR0goTHrx4U7ThK77BZvZiZ0nI4pchnCU1AUJihzk2nNRgKq459OWH0HIUtqK2SicUdayb9lpvueVGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812091; c=relaxed/simple;
	bh=MsxaPpnhXQvPG9KVhtob9e6/qud8McFagf0QT8d/oWI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FWsuyEuU7DwwpR8iAzyYhOR/3Xc/32y+DYZGwBnL5mX0t7mtul/eQylvIn6EelMtCHOT9bYPdSDD5oyb61CLNUE1LgYK3oMYS2r5oVCGOq6wzljzkQbn2kbK/MhweeQsnlYs7W9SIyMhn9Z/qcaJI4xbzpzPL+FxdIh3m+17Al0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMZCIu2N; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMZCIu2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768812085; x=1800348085;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MsxaPpnhXQvPG9KVhtob9e6/qud8McFagf0QT8d/oWI=;
  b=AMZCIu2NKGOlOlarhfdv1U0Sgoc1+xGtIZuBvsqaxHkkzMf8jHw461CW
   JGVb78opobCTd6p/8Fzkq+MelciW4PNGhWym7ZKaqNknF9pggyOu2K56A
   E3A4Wg3MutjZDrxnfCPKWrYihsndPXz4FSRBX3gcCXod3Jdz2MMyVnl35
   y4JgavhlDzqK27Of/vDL426dMUMxQwhjQ3W/3Rw2wKJQDbnQwQK2/zaUI
   u7eZoMeve+iHZKEq6EVLFrsqgWLWQrh5peq36bHdF1uXPh3Czv9ECr6C5
   gYJi6HhbPp1tYTFi0vRBz8c3vZMVXRC14OZqP3t1gITq91I9qccHyWlve
   Q==;
X-CSE-ConnectionGUID: IWFqkQnhQAq8Nott+7kLNQ==
X-CSE-MsgGUID: T4zwhqTFS0WOqBw7sbosYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="73649704"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="73649704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:41:23 -0800
X-CSE-ConnectionGUID: +3pKZYz3RQicogBW9qUCYg==
X-CSE-MsgGUID: godDdHCrTMuXNPWeMHTK4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="210295305"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:41:20 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 00:41:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 00:41:19 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 19 Jan 2026 00:41:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ5e+sD1cOO83QBgqnjZv1od3JhaMZfCwKSmLWunR35pEo93b6lM4EQ0BK3YsjB8JlZiSSneNMSZ0KC6JQYTSO2DEaXG9kGY3mPcCcGV8C/ljYy1uh0ZPLFmDksx7yQjdbeaLci2fqkISKEsgs2SHixPlQbVeqxaVhnsnZDjVifdcrFDgQtBEmSdv1cKlJjTigJuzSaxwbXvIfI1sBtrcprXQzbYOp+iu3HnNJB/7IwKW3tspo6pzpXCPxYqExbGKf47S9Br/HJiIE1q1j6uYsFVD4/DO/GexsS/mRwMa69twAwCbRYxRQnP8uoFRD/ord6JmbUjGn41Op0DG64prQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mM3IPKYNXMhPjXgkXIWSOVHI8xniWZQUcuzYiIEY++s=;
 b=flvHbo+ZK2sGkRKEWNANgwR3AhmWtE30xGBDW8E20aFhcWkBiq1qFZiCJjAYlnKfvRalfczv18Tn9TfvjnJaTzFlpDMbnHE0h4bzbTUPAeyMzX01EkwpglJ26vI4PaxmB4ptj84W5s7O2TPqVQ0l9gE6F83Bxx+fcR4oiOEZrIOjj97wnsfa2OrU0rcTGPX8618Cqt70Iz7T0wFx4W90i0vmrr3oStvNeAnPqFST40DVWk5SuCO3UfKjTH983S5mi22fLOSROrJ1CoYg/NQ33bL98xyLFJG/HL6Znuv5Ottsdqj9qwl/d8IXcGxgqyJmZ0rTZH0Z8z1sLhS6O9SUiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Mon, 19 Jan
 2026 08:41:15 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 08:41:15 +0000
Date: Mon, 19 Jan 2026 16:41:02 +0800
From: Chao Gao <chao.gao@intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, "Rick
 Edgecombe" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v2 14/21] x86/virt/seamldr: Shut down the current TDX
 module
Message-ID: <aW3uHllXbIs2SVcL@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-15-chao.gao@intel.com>
 <daa72134-387b-467c-8eed-88591287c983@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <daa72134-387b-467c-8eed-88591287c983@linux.intel.com>
X-ClientProxiedBy: TP0P295CA0037.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::9)
 To CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a27053-84f2-4f0d-4350-08de573681fe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWY1rgHRO8zLAJv6ANOPuPM3IDT6wRBxckiHx0RavvneIUhgxODXGso03tiO?=
 =?us-ascii?Q?2+PoQqywN5+ofdd2qK3vluqVYjeQSN+tmVdxCKaRjr6LMV0p3gcIuybpaW0U?=
 =?us-ascii?Q?dNWKA+YBZnRb8+ST+LDUQocmxI6LP5s4ku9+xyP+YxcOv1F6Q/72OtwFTbVo?=
 =?us-ascii?Q?hKqwJ3wYSAH47gQLkAISwGoU0vH6nzC5oNwdYENjhHXRQ/hs7pK08PMKvMs0?=
 =?us-ascii?Q?X9BXd7FXNIfcDEyZ2d3G8yQaYqf3C7tzeajVFqzzypKwM98Fx8FLvBXSqjP8?=
 =?us-ascii?Q?SOf91cTiGi5+NH8KgEyH6O0AJJXvFPrb0ca9gaCmRQAfnWBvbOhX7KmOPvX4?=
 =?us-ascii?Q?DxVLq9yQ9SCWPCvU81x2X8PzMDrXjLzem7XxUlM3PYfO+xXwHBhjdEToaRp+?=
 =?us-ascii?Q?h/GzcvyKK3CoZo5xRGJS75ELtC7c4SIqbKkuav9pJHRMmbicuX2uKtumPV6X?=
 =?us-ascii?Q?kfcGs9tBN2e45C8okxvm1VVd7zXMrXzNzRWgVFLQRgYKwTcd1Vbue17mTdSz?=
 =?us-ascii?Q?HZsx2/znDdIhXZ7EWlc/LM4v7j998hOv9BcOXNuNQ6ULPqeS4M+vw5c74Pzz?=
 =?us-ascii?Q?dHavYLLSyb8fnFBAq7P4TFlkP0k3eSRLgXPXFhVyLswuMDx7Ry9w9b+r7D+w?=
 =?us-ascii?Q?5TX1ZlCSu55PgB9Y2Es95da1GXaplNtKBwPwUELcAnxK9A0nsEZGF4NnA/lz?=
 =?us-ascii?Q?yGClgR2V0+HCT2RhtBEPM5qhhXDSF3PGrZ70Gaq3Qwih4lSs3BIPHL7uSM1q?=
 =?us-ascii?Q?Id43mvYG7+exKMHsiZC9fC5GI47tC+oD7pcDwEEXgkbp4uBDf4/IHTFpr1a6?=
 =?us-ascii?Q?8d+Tr2e/RnOakjFy+ps696xy1L9BpvJZQ/+H02sSWkkHjRJnAabT1POU4b14?=
 =?us-ascii?Q?rMNZv/h8iqekoZ2jVkzTDjiV1kRQ0GvQLWPUXI0s/hc2KnkUtpGkxa/aYuef?=
 =?us-ascii?Q?i7r+gqfwkjZlEmN1D1O8ffgrH7cJpzI6bhtexNaJ8R4ZA7R0LZKNAXXcloEJ?=
 =?us-ascii?Q?5G0zzKT9xcFzPjWZP3lb9pUgM4NsNPVOMEa1mH4tNkYxgrEAUlH4/Vot4bGx?=
 =?us-ascii?Q?BqJPUMfC6cbSb85XdkKiCzVbdunmn030KZx/rnxtXeXQUK7yu9m1A3fhBV9e?=
 =?us-ascii?Q?pa53bAKM/cAw+YuoBQrKWzgeB/i1vMoztYDwQVHCpbfuZ0z265vrQSOHVvsZ?=
 =?us-ascii?Q?9Cs0RnPHClOIQcDUYaKFoiwnkVWG5KkBUJBFQh9qRU5D5PJWlDy5AzSp3Ee/?=
 =?us-ascii?Q?3hJbgBJ4aJ5ahl2pAmZq+TKL6jsxOMDhkm84J41ghfbCgG7tHrT3zzkB8N5P?=
 =?us-ascii?Q?rWdKNFKq54WHLmvjzGU4gw9q/iAinGh0ZwLzg7yNadl4v/X4P3w9O15XpK8F?=
 =?us-ascii?Q?gCqo57kIoG+ahNAfyLjMpVrB5GK3rCuGDvnz1pBdGPo1f0uWQPN/8GmAf/iJ?=
 =?us-ascii?Q?QcluNERr5OwEyNjNUKke9yOeyNDX4kHU1amKXZtObFuMUiCVY63biFbUsGHR?=
 =?us-ascii?Q?eI9+Cbft4l4OUsiktCpF46NqRbVyUI/cHTqQdcKprqM2E4bi0enV1ckusCYa?=
 =?us-ascii?Q?dxd1BO1hXloPhgOJRnY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D5r6WhjfeBH1mMN+DPry8uSe3Dm1Lf/QGZLshO0lT+liI6twe8f4HzmbHR7f?=
 =?us-ascii?Q?QyJwH8EzowFzNofEmIpIvQlGSq0PdO26fkEBcv37zAQDCd63EN4IqRqqmEP7?=
 =?us-ascii?Q?M5M2fYN61okIAH7ceMxBjMK2QxE27RJuacJLvELROhY1+t5eadlngy7gRtTC?=
 =?us-ascii?Q?sWMST7tB7J7KPvfgkyhKBtqM68xcThFGyP/r4S89Ic2QTwJGz+GH6sih5LvY?=
 =?us-ascii?Q?bHkwgn05NfJ6oTVcaKYl7akNARrtkZYbAl8iu1eKr9O9tLrKrBlx1Gmo/jJn?=
 =?us-ascii?Q?CZIqRj/GrlfwHcJgIVIQ5zzn8YBVfqYlZRpe3qYbNrURNIEbZRac6UU7J8HL?=
 =?us-ascii?Q?41X+NJigbb8iyY5Nv0NMZyenxINXaXQPizMmVBEp1DIAMoxHzG+dihhm7w9T?=
 =?us-ascii?Q?u3mfgVeXvy/LLFfmq/k6KDgnxEkl90lzmunhVbuUUuowEbiW2zn7wcSgGBK+?=
 =?us-ascii?Q?efEP+24uBzTgjzm4zzASk1s6fLxQFxxmI7oHip3QBLxmv0HabFAV5eXjIvfM?=
 =?us-ascii?Q?juEyEpQkpTg8UFgs64tWyF7eqwObCl9pjFOk20/elQZY6Qd/1ZmF82Z1xsAK?=
 =?us-ascii?Q?kCfIQD3OVE+rrAFzL0TyR0nbxLFyvdQvdBoiTq5aiYPL01HlgUg5O5uTS6a9?=
 =?us-ascii?Q?DJGt4LFr/e9KahD8jsvcOr4h0zXDLC1QwynSHwsUI788wE3yXwFdbn0QIYZh?=
 =?us-ascii?Q?TzLemkNxGS1WviUCENKLkquu34WvryGDnWNvTa71Yat2H+mCYvETAEGz6R3p?=
 =?us-ascii?Q?ZrG91encspjZ2ztCFv/Pslf6q/dZighM3hJvAu7R61aWHOVH/o3eIthKMQcZ?=
 =?us-ascii?Q?9YcvV97Tv9QSZfX7r3U62/nW1Aixbc5KuaZkVjA2+m3p/c5GtGprsSyDjwaU?=
 =?us-ascii?Q?nYGWrHme0lnBJjAGZm9+pS95w1T+8EPizF0KmxYKViV7jIl1rc6fdPmX1FV3?=
 =?us-ascii?Q?p+7PX2gFPZ20JwX6I5cYKoJIRP6RgZUpCNuibpcqsCrg8BgyaSGkT0c9uagE?=
 =?us-ascii?Q?HBCT+icbJTunRxsqLMcy9R5zSIyepEyH9mjfeA43qUyYmcb9cdGqneTHuEs5?=
 =?us-ascii?Q?SQvrxjue2NxoDZ+sWOiC1+K1X6R66rGq2Ycm59wb9bHmhSHOYfyvSTjexsgG?=
 =?us-ascii?Q?e1TxYb4JqhkQXPNtDpqb5NokhTcwvob7Pl9KA/OCQfujw7KPjUap5LrVqP5R?=
 =?us-ascii?Q?QW3jvoO1+UmEJnsNdZRjLTC5/4m0mu3/Xy5tV+hhUedCn1Mv8AnVdaX0WFd2?=
 =?us-ascii?Q?rmBB4xFMJxYPMjB9p3dVLvlJ35nbuTKXgOaAEKEOuK2i60xLTSkiI3AnFn/o?=
 =?us-ascii?Q?1o7uIlUK5pH0zk0Zd0ZYro8aunnnyyC8iCq0XFTuXPUD3WI97nTiX2K6/HNp?=
 =?us-ascii?Q?0dk4PX0Yoe7NxWKzCU1XbAGS9uwT124KO45y0t6FCBHSrzdOUCPbxDJ3AKGj?=
 =?us-ascii?Q?Yl1AqPzTCyKLgLl6PDyWVfnzBXUbnlw8hUhCJQ8yx/tU4/a7vP2ONS/T4aFF?=
 =?us-ascii?Q?KMS8/6BTd1wtA/s3kWHRsmN6oDTHrIc9S21L8zBO+An3EZREtyRZ+BjbGJqR?=
 =?us-ascii?Q?aFHKp0YNw40D0agUHTpsNWFpLkCNchtxWlXdeAzbXvjceulr1az66l728WJf?=
 =?us-ascii?Q?gvOWJcO5hCQt2AoKADGnfx3aPKZjLgEv5WP4Hj496vVyM5k3IJYGjV/tQZTO?=
 =?us-ascii?Q?buVIKq0bF906XZ3w7l00K0qJkezRh91fwYcL0X5aT3eLsNb98vZYCdTjeUJ7?=
 =?us-ascii?Q?raxQBGVPIA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a27053-84f2-4f0d-4350-08de573681fe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:41:15.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZcTRSyiKXmW+Rc+zIk2AffZJjEqmftYEep6Aj4W6PJvnGaeSofTCdjZCvrkxfT/PNVPQ8jcWSsNe9nnocGY2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
X-OriginatorOrg: intel.com

On Wed, Dec 03, 2025 at 10:24:58AM +0800, Binbin Wu wrote:
>
>
>On 10/1/2025 10:52 AM, Chao Gao wrote:
>> TDX Module updates request shutting down the existing TDX module.
>> During this shutdown, the module generates hand-off data, which captures
>> the module's states essential for preserving running TDs. The new TDX
>> Module can utilize this hand-off data to establish its states.
>> 
>> Invoke the TDH_SYS_SHUTDOWN SEAMCALL on one CPU to perform the shutdown.
>> This SEAMCALL requires a hand-off module version. Use the module's own
>> hand-off version, as it is the highest version the module can produce and
>> is more likely to be compatible with new modules as new modules likely have
>> higher hand-off version.
>
>According to the TDX module base spec (348549006), each TDX module is built with
>TDX Module Handoff Constants, including No-Downgrade Flag. If the current TDX
>module is built with NO_DOWNGRADE=1, the hand-off module version must be the
>current TDX module's HV.
>
>This patch series doesn't seems to handle No-Downgrade Flag, IIUC it needs
>to use the current TDX module's HV to avoid failures.

Note: this patch always uses the current TDX module's HV. So, it won't fail
regardlss of No-Downgrade flag.

>
>About "hand-off version" and "No-Downgrade Flag", I still have some questions.
>Is it possible that two TDX module versions have the same hand-off version?

Yes.

>If the newer TDX module built with NO_DOWNGRADE=1, is it possible to downgrade
>to the older TDX module when they are using the same hand-off version?

AFAIK, this is possible in TDX architecture as long as the SEAMSVN (TDX
module's SVN) doesn't downgrade.

But for now, there is no plan to support downgrade (or roll-back) in any case
as it may result in lost features and cause compatibility issues. so, the
userspace tool [1] now rejects any downgrade attempts

[1]: https://github.com/intel/confidential-computing.tdx.tdx-module.binaries/blob/28a4baabc268b1998ec553ab9009f4fd3efd309d/version_select_and_load.py#L301
