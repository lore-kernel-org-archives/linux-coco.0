Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C193B220F2A
	for <linux-coco@lists.linux.dev>; Tue,  2 Dec 2025 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764660224; cv=fail; b=pKVCaeC13dy58WBpuN05NHdU0pFvWM3JBtPd5gXTb63/m+dPz2w8f/KbU21OrTmrAh3x+iLxf8Kwxx29uJXevQ5FHCrpUyw7NB1BcdytB+wb1diJ8Y3jyU7/c6uszCBPpuOSIE0SLNvIIaU6MRxfsgtdvEx0GrQkskqR6ymw7rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764660224; c=relaxed/simple;
	bh=6tTPQ7Y8HYDUyfZ6K6tYD+0M0Y3ztI6xW7bfwMDnv3k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZvMbTaVUAj0ry2VM1TXOlf2jOxHGrXnnJwO0o+14Xq0sR2YOs3PPprGKweEWIcx6OVvnPhMMoSSG4UV2m12XGA/aM8eF25kbG4iodR1uPHyi26vhwDOiMvWmg+226rqd7jQPW7EzCcajGEq+Q9LL8PJcbEijjDyRzG+ZDuj6bhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejECA8J+; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejECA8J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764660223; x=1796196223;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=6tTPQ7Y8HYDUyfZ6K6tYD+0M0Y3ztI6xW7bfwMDnv3k=;
  b=ejECA8J+5Bfs19Z9N1r/SLiZezqwd4DPgC1x3c+Q/uV61spKo+krjFCU
   NWLlXXl8GjSfyrIV2PIsnYlOv3p7oedJPxfh93GwCQlrRucS2kKNpfhLg
   c1PXnJmSduxbtmSAE4kIUEdYT2Pt3RatffIZ4tHXqmdMTc4WVe/hEBe3v
   Q5gV52YFd7+43P5sYc4Xp2uk59FPLj3BXa+TZuRjmx4rwaxbKYNgA3t1c
   T65oFMeTWVkE/4pZowO7lMi4w9cyKvwFr+w2w1Z4Ug09hdtNB/gSbN23c
   afXJRGvkFbHD+5FGswv4+tSWyBU5vGreL8ThQINu3QqlFMCCqlMmOFNJD
   g==;
X-CSE-ConnectionGUID: QybyI0u6S8apsvZn+PETrg==
X-CSE-MsgGUID: 0Z6I9/2eTKePbUDJyR1Ajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66653452"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66653452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:23:42 -0800
X-CSE-ConnectionGUID: 75sYGHmYSLKMs3j530G4Lg==
X-CSE-MsgGUID: r6lcYgY8QGaQcM1pDFd7Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="225264477"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:23:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:23:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:23:41 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:23:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZLSvHTeDrcGqYt+EaA8XwI5ZeJ25/XUGHFgrTddlWkBcuh9EqN+Q1RCp3wbHBeZgodWXESU/BU9OenVdcXf0075oi+kBSC4g+F4yr0065Vn8iosVmegLy8hY724dqGy6U4WHqsAiQto9u+61gjxIAS2AVegBUKu+EmQOPt+13HXH2z0mwZePdkKJkEhdmYotkcX2jKqGVGHZmjjdzsX21jv+v6VLQvHB0R2kp4+gPW/kr0X+wrQ7n2MPiusaYk4lfUJNwtoSbI5eZ69XXVzeh2JFRV7q7dVHf+E2aBBVpDDA/n1FJPEm9BNfKZ0FFtl8VJ7L4N1U9TwrPduAIhmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBk0BkBWxWhgn9TfaFux/nLB2hCrnvtrzzAXNJwshy8=;
 b=tnEcCn+Q/a3XbWwn3MvWL8fcDCGPd9wg410oEKdYfGviefxPOOIVcWgS8ZZ4xTwOKvyR1Y54xlMGG7OUF/inv7YXvRRvMUf85JI5GvdrPRL9X50HLH1jVNKNucsVGCl25aasFGh6HIJbiRlx5J+4dUWutRy2zhhv1tuCzBnZ9VET2GcQ5xXMXNymNW5yJ9PMmH+4e1lVVhD5TISQPeP1mdy9NjlcGAutP/tnBzifUHlbL9/gEGqmFsLiPVCWQdd377rw+jJGSexti25k3gGVNKIV/6Xv3BsrtmKIKjPBbPQc2Kv0YQDAfeqKnTpCE9dLYptvWGkdneuXiJPwUs1ZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:23:32 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:23:32 +0000
Date: Tue, 2 Dec 2025 15:23:19 +0800
From: Chao Gao <chao.gao@intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
Message-ID: <aS6T5zvKbRDzI24p@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
 <526f295a-326c-4999-8078-53fb758759ef@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <526f295a-326c-4999-8078-53fb758759ef@linux.intel.com>
X-ClientProxiedBy: KU1PR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:802:18::29) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d1ed44-ba72-4bc2-7387-08de3173b2c6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ky7gcvcquZio1ogfkbVe1HLitSYFcUXbt5I10WS3k7oeqJdgpq93GcpLT3y7?=
 =?us-ascii?Q?2eSAkiVcnMOZdPckP1Io0YxT/H44jvn2XCbHpOBOakiTjKPaglBXcdiU6GBe?=
 =?us-ascii?Q?UjGx/sxl1L2I7MQ72KHLGZlHa/gA9+ETlWj7ucZYyUR696yN+vxWEQBg29ck?=
 =?us-ascii?Q?2JCSCxx9RtN9pLJi8tDB+SeQld5mjj6lmwOAAD19o3UZ68KpLCfynHIYKRFE?=
 =?us-ascii?Q?XubA2fNZr93pRQj550yMM2O20SNQHV7W+6QB1L46790SCIozZf7C49o1rWkC?=
 =?us-ascii?Q?hAHZeZR9tuOZaYp+B0SUeIGCPCrrquSSZFIUoNIWk18cNP3JcbPRkkEda5ea?=
 =?us-ascii?Q?VO9xB0L2rptV0syGlyD4GRHFEJVx0cUAuxaJfRd8DKhh3Iyd/tKMPDC/8WzC?=
 =?us-ascii?Q?/KMfUyCfsXM2+IkLrVzWIfBWdTOhdQUoYjXqr9gkoLo/e6l84qZYaNliFAai?=
 =?us-ascii?Q?JS+hwoLSOYeD55kpdlR6VZSJt/RGO9Cnl4gIZhdGau1nuhY8zJFnCnbVkNYz?=
 =?us-ascii?Q?OEr9R+KtLpGNvcYjvFk3if48qbrfn0iedxVKRg1yNaiWL7SaDIP5VQGysUxE?=
 =?us-ascii?Q?OfzWtW8EwXCyi5BCoIy9UlxX8vAEluhsjji/n06sjjUAiPHbQSh1mrxGXeM/?=
 =?us-ascii?Q?a9Z+yGwC9aZzs6vCP7YBPN5b6UBuwl4KAh/aIO7atxz5FyAtT/hjXfuMwcvk?=
 =?us-ascii?Q?TQSZ0fHxMUkTue41KVZjVVqHTp5CcEA81O2DrahG3NFJuF3zJqiDpf23pLXp?=
 =?us-ascii?Q?AreOoFcLIEjrNJzoBQybnQT735WcmwP+Jm4F1c7EFrFU//NSQSKUXfgPMQ9O?=
 =?us-ascii?Q?kpZO/WJapzCbLzHwn+qLLxf3jb54RWq+MmIK4TASKS2WSLGwqbWWsxEceY2B?=
 =?us-ascii?Q?HxvBuJbamu3GvZXSGt45e42QUIalBFajMoOa4hq25/wvqKLUEk6Q3IvKEj78?=
 =?us-ascii?Q?MyEsMLLzWJYjB/hmJn82I3s6i+HMpcD7iZkVT4KeM+mAjGIeeQJSA4YileQk?=
 =?us-ascii?Q?ZQkx/g0yp3FVPb8pAbnTQk/TEOEDJ5tvayn3V+bSG4UHUKHVVSXx05/hTxRw?=
 =?us-ascii?Q?5whW/GEP1gjDa19kudV0HP6+XpzmhmTs7r/TZENmrNl32DFBG5Yk6T5/6HSb?=
 =?us-ascii?Q?uyacx1krjFUY+QqUWDnsDb6p4rjQs/on5Ikg3qtBa2qY3pLcNHWb4arOsG1m?=
 =?us-ascii?Q?vc2dPA0nJ+EGFDAOx+rtjWF6ST+tgrxxzpz07zGog9wZkfb91jFjMxpt6iuA?=
 =?us-ascii?Q?Rqdlc225TuEeJo8QVixc6ryGyCNAsB9zg/wh2anFMjE5GIW2JzRR1AvBNR20?=
 =?us-ascii?Q?447PXZWJIVjEnOVR0wMPIgQQ3js01tRH8OnT6VN8tQlDO6Pcl2xUvGXlQHO3?=
 =?us-ascii?Q?n537CADs199pmZ/Cdlijreo2ZrP7s9taUYNf2v12qJhin5ds8XpdfvmRQA9S?=
 =?us-ascii?Q?A8Gusom6UU2yqBUEwCFV59gwYIWRyLJh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ClhDznOShDdPfTwi7JHjjtqUTxd66bPHDhryt2L2AFfZFbv/z6/DMwEim8iY?=
 =?us-ascii?Q?W5TviasFL8dJIq5PbRogm9TksSO7rzZ0QXX/3PIcRlJeVEgtS6WGWEHnmQgH?=
 =?us-ascii?Q?ZRTdOuHIQEGz0yZyM982Wd0jzOCs3SS8FxYDog2IA9Sslnf9QAJOAd+gghkv?=
 =?us-ascii?Q?eVPsABeUzdRyBTJs7XQeS2cqun9sTgX+oSvVuTqq4B7Sa6UMwwyXbGAeLM9X?=
 =?us-ascii?Q?VqJOTMxV0kbtxTJpS10HFvQSOFSmzixruB3vtvHk2F0miDDI6vt1algK9qAl?=
 =?us-ascii?Q?bwHfv17PO3fVSRgrjCP1CeEao9Dz8OK2mGiX34lzdK0Iz13R6BwXqtUn6TcT?=
 =?us-ascii?Q?8nVJLdiPeZ128shMUk3Mc5/47e4AwLiYgzkON2eMQOFqNkXVeEhpgf058REC?=
 =?us-ascii?Q?94vwme+BqjSJPNTuw0osTMzPQJC55wiQojHZMOAgs1XbRdbJu6m5vrX0mUBD?=
 =?us-ascii?Q?JLa8YcgPnW/0e4kpHXDI80oIKHp6+ZouSNNDUN0vzmdUfIXFJ8i1eZvwMdBO?=
 =?us-ascii?Q?ph2T4wuzcSMMoXqmmtiWN3kXdedQ/JWEWeHobu1vkriun+a8zjMBCWclghzE?=
 =?us-ascii?Q?rDLAGP3Hujmcy3EVcsaySj1A0NlCyOLgMSIhV9QZ0yfDC5xAUtJSvta1Gqw8?=
 =?us-ascii?Q?q4ntD9ywDqdRRX9xgv5ER5WJ4iqbrvJbdcQtfk0+5G2sRJnYTkAiDFfwwh+G?=
 =?us-ascii?Q?n1bZp8hueBLGgCKd3QheRPtwj0l3oBmx6RZ8cPG23NgXJdNDxC+bw7ILKWpW?=
 =?us-ascii?Q?fohvOSSQNg3oad+Ga2NXBw8gI1+m0nZyz2N3lrh+4qdAamegnsxU9q9fbf+8?=
 =?us-ascii?Q?Yl9YlnkSGgnA8Afoiu1feYBalNgYJ9/W56Va5DhkUf4CLvxiOGV82xhxkgn3?=
 =?us-ascii?Q?AOFHviRz9X8loH7YWgdobCeacBu/sJixZWtUM6K5nxMq4K8fjG8CH5n6UWTM?=
 =?us-ascii?Q?ydHsqU3R7UDAEcK+stMm3UPLilt90xdrQBRtnEV0t14QVLCrqppz/3ofbdql?=
 =?us-ascii?Q?wMoos51CBhIgSN9E1W0Y7edWvAAKbMaarV8Ok9H0xKbr4v0fibJBvCg9cJa/?=
 =?us-ascii?Q?ol+jCPxgQ6N9shSNtJq7gf0ei0qLZi74niGVtSwupQC7Ru0bLfragIAKFlVL?=
 =?us-ascii?Q?rySBguNK1lIxgiXZCaXCy5E/j2D3ngYxAOUNY5iWKKkLkp7Zp+sp0lOG22sT?=
 =?us-ascii?Q?jUSF4a8u9t5YD48vzSRt1lX9D9J5hHVreN4kyxh1Nlmj4J+QpgtK1fQMtRh3?=
 =?us-ascii?Q?RnTS3tABydsaTs5JXxY1U5B/7XjUMc6/qMWKzwLR7WbFUrpToYOlhmT4DC+3?=
 =?us-ascii?Q?wiZNtiJQ8SjCQ0o7VgSUdqXc0P+tTpabNTLHOsuAkyxCfkSEUNjG0UsY+RzK?=
 =?us-ascii?Q?eu7YkGM0IAFyGz3s5YYV+hTNAVOyerQ+7kd04iCRb48dPrV7/5JxgSNXUNqU?=
 =?us-ascii?Q?iXwPMqp26RRx0dbhnKD7AhA6wct8xM49wjVcXZr6FJEnkQheMAptZ64mt6U7?=
 =?us-ascii?Q?4uuE5pjhRe39ZGMhSZd9W714aozoo6XlsreIOHNyKVF7DzrgWU8dilEtyhWd?=
 =?us-ascii?Q?wVPIZD9e4vxfWMqc1T4mOuJv+zWCmoOBLbDGHMfC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d1ed44-ba72-4bc2-7387-08de3173b2c6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:23:32.6735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+f5EzseUBDHHpZq/oSzPvQsP9Clr/iQJWIC0lxLCmgXvom0BtvfDbWs1S+JuhY/LKa3EPHYPwzOdp3XFNaS2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-OriginatorOrg: intel.com

>> +static inline bool is_seamldr_call(u64 fn)
>> +{
>> +	return fn & SEAMLDR_SEAMCALL_MASK;
>> +}
>> +
>> +static inline bool sc_need_retry(u64 fn, u64 error_code)
>> +{
>> +	if (is_seamldr_call(fn))
>
>Comparing to TDX module seamcall, seamldr seamcall should be much less.
>Maybe unlikely()?

Makes sense.

>
>> +		return error_code == SEAMLDR_RND_NO_ENTROPY;
>> +	else
>> +		return error_code == TDX_RND_NO_ENTROPY;
>> +}
>> +
>>   static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>>   			   struct tdx_module_args *args)
>>   {
>> @@ -22,7 +35,7 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>>   	do {
>>   		ret = func(fn, args);
>> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
>> +	} while (sc_need_retry(fn, ret) && --retry);
>>   	return ret;
>>   }
>> @@ -48,6 +61,17 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
>>   			args->r9, args->r10, args->r11);
>>   }
>> +static inline void seamldr_err(u64 fn, u64 err, struct tdx_module_args *args)
>> +{
>> +	/*
>> +	 * Get the actual leaf number. No need to print the bit used to
>> +	 * differentiate between P-SEAMLDR and TDX module as the "P-SEAMLDR"
>> +	 * string in the error message already provides that information.
>> +	 */
>> +	fn &= ~SEAMLDR_SEAMCALL_MASK;
>> +	pr_err("P-SEAMLDR (%lld) failed: 0x%016llx\n", fn, err);
>
>%lld -> %llu ?
>
>And 0x% -> %# to align with seamcall_err().

Sure. Will Do.
