Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D535235BE2
	for <linux-coco@lists.linux.dev>; Tue,  2 Dec 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764660066; cv=fail; b=OEKb6ObOPBbI3mTfJmsoq7cRX5IQgLnQAeXcvBuEFtlb2JPaTXcwQxBylA1ormaa9JVUU9KcL2y3g7rX8T1h4l9tTNEWHhK8I04XUY3hYopAmvzs/hBNoKMrBHjwUkxgwttChbcnfl0krk9Z2TQzPPSVpKZt2Y1/tUO8384hH/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764660066; c=relaxed/simple;
	bh=rulhKoOtqJTOWMHfzIVj8VfoieNKXmVSEawq9/KCi20=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rcDzY8NZepfSX3U9XM5awKcDDx+v0pA5dKFkOnKtoj1rYtWdBnZSRnGuescRHdootC16ZtIAfkm37mvWvkiMZphwKpa0/nE5696Ob/v9NIR6BFExs6Jpl6++L8yHspWgkRDcsCg1WRQ7DgrQATwblRr+DGaLie77Kqzy5yxFhUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWW2wSmb; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWW2wSmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764660065; x=1796196065;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=rulhKoOtqJTOWMHfzIVj8VfoieNKXmVSEawq9/KCi20=;
  b=eWW2wSmboIcwLwm/y5IclIAa77jI1hM7iJ5TjMZlFJU3hp0l3iNyy7fN
   VolITMXA20tRodglEiXOxlSl4My7q57VKlwwhamR4Ep7pLqCwk9iZVzKS
   6jYcTDrmamg9FaluW8cWGJEcpQj+SAOHLtmAcUIIFUn/gxSHI3gzwUD7G
   qi07qiQeQbvXvEr652nuP1oe3lK/OqG1WnIFCFrzTTNTscNzR7cN3i6eD
   +6K5dX65Qw7AXtyecsPrkR/TTavQZLiEQX4SX3NE5B+b2QLaX/l3+k9XQ
   +mPlYgpxiTNMm1Oxb3iu7IOw/6gOT1/W+8zhQYaa/mid2CUCuQ6ABSuyI
   w==;
X-CSE-ConnectionGUID: dlGSxOsaQIKcAH/SPZtazw==
X-CSE-MsgGUID: 3yZ5dinuT1mzrwlQLh5XgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="76937391"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="76937391"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:21:04 -0800
X-CSE-ConnectionGUID: iJ6fxpe8TMaWPkaSmwKnNQ==
X-CSE-MsgGUID: 8AfemeNXTySyxL8MYG7WzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="195111022"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 23:21:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:21:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:21:02 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:21:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpA1qt/oM0HAoZwtrtMTo4lkw4JnAE2Dv8e2sw37zfv5ifD20aX3k6RxRlmWKzpheQNLI68spUlmgTJjbsEsU6BNwIpZGq7KPox+E5G7DiXeIwUFQW8EUETsVniaze+W7xrEdf6pjzUBj35TzYFOJ1cxdES1kY+GjEET1b7hY5BaHOoDOAnhPxi9BnXIpPEw7Dyz9P77qwfl4y1iVpa5HDL6IszWeyiEcTAcOrUKaPzMiKo25w+D0Yr5p9wbJF2V6r7vEvw3eskCjVkDC1W2tlia9qM7xMRN9+Q1BUzKGnQr0mhSn43SqOXt5EIYo3P9W8v76qR/2Dvo+V06RbwDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0mvlJD1YKl1vYKllMrP7glvoJvxJNO5pZJyLTdJkTQ=;
 b=xqdfL4vsfQTlYfmxBQic1260uadsyMaia7XJjCDHMKfqIPK6hW4aZVjy+O1uA7cPZCoOH2JVQbfbESoTSufpMI+T2ixMuPGOT/KE62nC7NI30tArhnqCgI2Flmq2JCHfk/uTB7jtrOu/iJ0JQ73IoZi/Yfu6xkU4V/iT7ZdrqH3i04UXe2IrQkryTge3ekXX2ZCGYyCp3d4DPRqooQ5FH7Xj99KqBExngc+r3CQGVy8CZaWPba5d1O5wCHAa0DeUIL8JI75DtY3Ntr2L0i59Ohiygmw3AeaQRe3ZiXxwZXt9koBuf/ECfmtt0FeSlqHy6ZpSodd24ggRomXZs6E1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:20:55 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:20:55 +0000
Date: Tue, 2 Dec 2025 15:20:42 +0800
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
 Shutemov" <kas@kernel.org>
Subject: Re: [PATCH v2 08/21] coco/tdx-host: Implement FW_UPLOAD sysfs ABI
 for TDX Module updates
Message-ID: <aS6TSlT24kB80rL4@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-9-chao.gao@intel.com>
 <41cdd3d5-c45b-4991-ace9-bef7cf9ed197@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <41cdd3d5-c45b-4991-ace9-bef7cf9ed197@linux.intel.com>
X-ClientProxiedBy: KL1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:820:c::15) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 01641515-5581-4ba2-36c9-08de317354d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9d+nJbm4TEwxP58+ZblEw7lcjdl2jcoljJ6fThyNmlRyOl5ZQ2J0yhYT38Ug?=
 =?us-ascii?Q?/AETd/bS0vS6lhabT4j5HTEvMAnOEaiZxK8gEW4M727mPMZ+tEp9oxv7XnDq?=
 =?us-ascii?Q?D/cj2FqVQxlGOrbTQa3nmEbql98oDWylkgKMGUdNhajLk8Hj/qEnNGkmXqwH?=
 =?us-ascii?Q?PHeueZz5bGsgBCox4zeIwWxfIxMFTDUbKeJWQJdXmYaT+mzQo9k5Kv5mwFbj?=
 =?us-ascii?Q?qdyJIO4udgpao2JmubD8F35LS26Ymlc3zt42z/TgX5f+wURKlMFyWF/Tz4TM?=
 =?us-ascii?Q?hj9MSNdSNl8jZawj/O7K4KFJbodTQiMH9ChLEElwVHw8+kkqFtVr2UavQSS9?=
 =?us-ascii?Q?XdJ7TU3m5evzlph+ipBK/18EmVQ/0af6c/BtK3Ejqei6NM5rmyn9R/rS9Xjb?=
 =?us-ascii?Q?/XLG9sNR9cA03Z+mp/yC4wWV4Lmtbnn/alatR8D4E8ZJUzuAVgpGZ9pUUJPX?=
 =?us-ascii?Q?ZJ/O0juUkvQKfsQvScuW7MBZinbfU1gDUGF9Y5Ta33Zt7mvHbh+UpRAdv0dk?=
 =?us-ascii?Q?Qsqt9WLNZJkFnV6ZnnyKtEu80+FAm2UmdKRr/bEUGrfliS5BuQbMiyuV3B0u?=
 =?us-ascii?Q?PXhdt4fahUS+VRItJhrxCNTaXL6I+XFnegomnt5qKLEaIbilIK15GPs9Gs3V?=
 =?us-ascii?Q?DbV63VU4aJ1YqURGVUPvr0OQnHATKnBSaveYaLAi3+upebK7v6FYXK2uU5uR?=
 =?us-ascii?Q?BN9LFgdg3l4F9P13QrT0moPBDdSpHZ0gRRjCkABOlg4N6DowIpUV+TAqaQ95?=
 =?us-ascii?Q?/raufs/jVXb3EQFBy3iiHTBvV3Fob29EjZHjh/dbfvqZf6RSYPjLJEF9dSwN?=
 =?us-ascii?Q?ZJvGe1kNxq0RknGFwL0pbIefz6dA4c4PNmXco9PxCpsPFHngqPQhoH4O282z?=
 =?us-ascii?Q?vT8nm3Ggg6Vdm1bJV1oLiVeXvgE40GrDB8zPQuLJNfDErvNCPsMyWftGnUvF?=
 =?us-ascii?Q?SYa95UNY+Mx7Zn601tPwCltVp/CeKmUdmDdH9KSybVcIm1Q4W0h97QYPsNea?=
 =?us-ascii?Q?C9sl7AKnjfWPxi/eje3YSdgBZta71qFwJmQ5kMAkdpbVTCD7AHTHmg7u53L0?=
 =?us-ascii?Q?d84GffNa7CJHFZsIW4Nu0cT9DbHG7Wc3CG5o2ZszaWJ1NZ0yNREExRDsHNr7?=
 =?us-ascii?Q?S5P98qxCBIJsrnziaWr87SOkHtnlsEAHcrokO4oBJR+G+7L1n9PIOUelLk92?=
 =?us-ascii?Q?CwMCO0dnzz9kQjV1CKY9CuA5OFFHGPvPmnUm1oR2fzkbZXEFTWw5vB0T8ZyA?=
 =?us-ascii?Q?8AyFVVVf1DVgKAFJO86WPIlm2JIXM99WSoJhcU6ZRcBC+Q/sCf1+Jtn/zZzQ?=
 =?us-ascii?Q?ow+Ni3iW+aaP9MrEEUskHCmJJwF57uHkWFbRLN3ezARlJ40rKjDiHBDvayI7?=
 =?us-ascii?Q?H54vwBv/PZKCwCUnQzsF5dLYtxxzZzYv4vGjFNL5Whg34Zzb5ipA5cB/2HGo?=
 =?us-ascii?Q?2fTvF5MhBX9693N89w56kOtuHlVYRQNQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f6e8TzKpVZO8+/FUCYwfL87zqEDlYAHjH3u7EQ13DCDtA2O0z1doNxjHxUV5?=
 =?us-ascii?Q?UnbpnB9KfKm53pbX/BXAx9lFql5xZGURFJtwZBMddPTtAEmLydXCcC7ZPLB2?=
 =?us-ascii?Q?kudpfLRTzoUJsFMblNXf7NK7ngvi5sX3FQKES3S82aMIRFwzqNLyXwh6Tex5?=
 =?us-ascii?Q?6XpiyyY9xpijx7Aqf7m/9NSHaKq2XT/foVbvJdfXoNqUkRias7RBlsB3DhTi?=
 =?us-ascii?Q?dCPXMUvGQrWPOnBNIpvSfhg0nyFO+jOhk8cTqbyGN1FlBlp+/4eiQvjfHmgL?=
 =?us-ascii?Q?0x5V49dKUDfeudJSB54pNvgElzunqykDK7m3Q5U71+qilRkO3g4YouS/FNnV?=
 =?us-ascii?Q?F3R6EgSVumxN+484BYkSowWk3/DwQ6JsCSl2Y+lXfB4D83Rf28Ttxe19UlmW?=
 =?us-ascii?Q?dDZzZs+tDFSAFyn4DDHC8rsCXmd+c4/+KJ7pGI0JPLfA6B89Cex7dtvzfU2r?=
 =?us-ascii?Q?RU0SNroWZ7XLmgk7sdGjkAT906TvCcMyjfWdzDgES7i7Z+e4UbnUoNnRwO3F?=
 =?us-ascii?Q?4ZS8r1OwoHcXZv2N+02IU11ULUKuxMrOR+yZa8zeIQ7xR143HK6jixEz0geK?=
 =?us-ascii?Q?RCyYgeKNfZJ+ZEkFdLutGPfEptMe5moPNlkqVviRkZygGA+DCq31GOHLMQZg?=
 =?us-ascii?Q?COxJ3BQ9VQ0OwhhEDYMrMsVxURuNG5Bq9X3CPEMvxFbjDsOuXN43K9tqSMfc?=
 =?us-ascii?Q?ZFIVHz1LFqntAEVLHyBU6ZGjpvRZTcqh8LWa5HsB3H54G6mDKM3iSmOBN7dU?=
 =?us-ascii?Q?VOOSkhtnbI8LfjdGDC3DYX6YcfD3KClLDCL7ZZ8rMfpxGKa+Y+yFB4m0s92C?=
 =?us-ascii?Q?eCZ7DOP+ewtLeNiWu4HuIzM1ruQQ2PQw+XidU1a3AcG96kEKi9O1VVD4VpoQ?=
 =?us-ascii?Q?2Vtd1/QbKtZ/rwS+8aWURXqMt4D2C06jxC29S3z8lvI8McLyDGHLsc55UDr4?=
 =?us-ascii?Q?mol61OeYo3Vj0UVdsRI2Y83Lrc99dKf/QftNySXfojKnI192vIpOSCbVjZSF?=
 =?us-ascii?Q?+pxPf89kFGLmsveQl9p5XbLtWKlrfWqO5UmDzNLxALwikvxy6EiYQeGPEsiG?=
 =?us-ascii?Q?lK8GQSm4r6LdF/5YSslaEbO8M5zvlHtjpT05mEgBhE8M8+fdKBy07ZgNtEs6?=
 =?us-ascii?Q?H9WYRB32ozEtTbSm0PlOPEHLOJAu0Qfw46wLNiCV5C45zcpQxZkeLmdAjx7g?=
 =?us-ascii?Q?ve0Fj3bDdfxb6ZA7xkEKv21nwT1NmPOqMqlpVKgmrx2wKRkByeCC+82St0Bd?=
 =?us-ascii?Q?IrphYOEAAFWsBnMIwEnSS3WWlzw8DHu3eETDHVeCWMAlXceu4NUn5vOrhYZp?=
 =?us-ascii?Q?Gxnml0dN+QGkdtRMQWPnHGkpJsjr80viI2oH1ONHtwrMvWMfnDDiInuDVo0y?=
 =?us-ascii?Q?xjfFua3WxenBRH3eLy7x/9EWB0guyrhPEfEi9tCez6wms4RzL2YAFtpjNMJg?=
 =?us-ascii?Q?enpc5zIuoimAIzhAOv0qY7KEw9yP7sVKbB+UgRvaJQszb4wBU5krWuW4fQ5Y?=
 =?us-ascii?Q?WqIJOJgzsNu5O2ee8rH9IBD8qu+nbP1dSfFWyjA9bZuXQIPTA9G4tPbFp6i4?=
 =?us-ascii?Q?MoIh9ODZ4BUrDhfO/mxg6au2q2J6gjPa7BBM1MBN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01641515-5581-4ba2-36c9-08de317354d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:20:54.9513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxmVBnw3MSXSr5PONeAMC/yh6xJVubCL4nS0Dym2AAnLpbMJYhqWrL3YY2CktQ5RQ2GyZgJlmHZPMgU9WXOSkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-OriginatorOrg: intel.com

On Mon, Nov 24, 2025 at 03:49:34PM +0800, Binbin Wu wrote:
>
>
>On 10/1/2025 10:52 AM, Chao Gao wrote:
>[...]
>> +static enum fw_upload_err tdx_fw_prepare(struct fw_upload *fwl,
>> +					 const u8 *data, u32 size)
>> +{
>> +	struct tdx_fw_upload_status *status = fwl->dd_handle;
>> +
>> +	if (status->cancel_request) {
>> +		status->cancel_request = false;
>> +		return FW_UPLOAD_ERR_CANCELED;
>> +	}
>> +
>> +	return FW_UPLOAD_ERR_NONE;
>> +}
>> +
>> +static enum fw_upload_err tdx_fw_write(struct fw_upload *fwl, const u8 *data,
>> +				       u32 offset, u32 size, u32 *written)
>> +{
>> +	struct tdx_fw_upload_status *status = fwl->dd_handle;
>> +
>> +	if (status->cancel_request) {
>> +		status->cancel_request = false;
>> +		return FW_UPLOAD_ERR_CANCELED;
>> +	}
>
>Since the execution of the work is not protected by the mutex, if userspace
>requests cancellation after this point, after the TDX module update finished,
>it seems that the cancel value is left over and it could impact the next update?

Yes, I think this is a bug. A few other drivers just clear "cancel_request" in
the "prepare" phase, e.g., pd692x0_fw_prepare(), mpfs_auto_update_prepare(),
m10bmc_sec_prepare(). I will follow that approach.
