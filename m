Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E013793CC
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376054; cv=fail; b=fJpm6j66mOcJcjrySsAyQBLw9nQ1Sa/k28GdEHKTAk5bxCHdJMqGXpJdKJigYV9MRQNVnEr3ZwenrPlzbAvPA51pdzJU8aRx7rPgR2vbY5BSB0lNnpiPVw50Dl/emY0qSCf81GA0S4qB5PXilkrYoF6XyZsCpv3WsPXH1Dz4VJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376054; c=relaxed/simple;
	bh=rPtAnqcBhwrzLSLT3N5qRDTD+npLwxre8V/brptnOtM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N7v0kSmPTiJZAKoRiWDCzSPEFlro3ybnlF/eVxTdxYUkhr8d1m/drrgLNTNciJaXzzusSuYUeaPaefePn1m1JLryCcE7a66t+gk4QZDE5/d/e4vLCCxDnSN8CuylVTBDPxu7HSMmrtPlAxICPILG+3jDptpF/zL0yRl62u5OLBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRFtU8IY; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRFtU8IY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768376052; x=1799912052;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rPtAnqcBhwrzLSLT3N5qRDTD+npLwxre8V/brptnOtM=;
  b=GRFtU8IY911hcNYO+c4J0uME0iFOKX+wDGAGPXrkXWGWePc21P/Ftiq2
   SYXZH9+V+TjsyZ93LGh6VKo6U99vKVqZuIA0gB/MqxX6tw8c6kXj5RQPY
   S5adSF+q3XfriXLjFLdks8aH8+47NODo13yiL8mW+fVxv5r7eMWUEZU7i
   XfGmkhNsVGZz3ZjXsKHezqfKRQg7leFcd+v5MvmHBvTAkqhgMUYj6YW0h
   sepSMaGuKg9rTnZ5iESPx2rpJUVxE8+JJC72bPutgF2E4g3aTnJ+GnXV6
   bRkWTBX7hRSk0V2hOHzxNO7DwQm/ISwCDwQHsEdhr2ml1kfKqUB6OZFBu
   Q==;
X-CSE-ConnectionGUID: L0ATA8UPQoCC9F23zeC67Q==
X-CSE-MsgGUID: 8phb3xA0R5iLX7zyDkZ9FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87084170"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="87084170"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:34:11 -0800
X-CSE-ConnectionGUID: QZq8Fgz5S3OpoqcEuGYS9Q==
X-CSE-MsgGUID: Hpoaa8xiQGiwFG4y/UxirQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204883949"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:34:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:34:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:34:09 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijZEW5MMc0d7YASYUKQEnPYi2EDcL6gOYjZDw7o6eh0JoL6jtMbMKFinPwU531sDeFOGSF/hx/pbHRkQ0UyPX8Kjw+lUAkiNpJcu5SQhkZ3fE5s8QL/Ul90nrsdg2K+Ow26gmFhw5HxdnuuGPgNwDdeOQ0DirwJ4wV+cwIIcH/KCiVQupGmhiXiCJZJOIJiaKBthlRyqn1CS8UG1LU7c4KqwnxJNzEEhZBcEuzMERS//BFRgKmIBLCU9ZKNgBLBRwtUOx6YUKEMGgwLyAuFYkpkKml0puj/QaMV0U4pY9RJ2B0a2z/qFedv2RjOailX+EvJKWfb8TsJp3CLlvvsb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+ic04RTAPfEGLFBgYw/FChdM+Wkn1qBUc8Keye2vSA=;
 b=ux23ZYzdfVzXC9o/1B/RIDsYqcf6BjKCT78qVBSXYNfecF/IcjsdwaZLqAFZcCAy2aqfrfqNV7PqP/OG66vFDWH3fgi/h8YNjQPhQYNwNY/SseuwH79MsZ8l0opIeIv8gSVaL/ueN9gqd2b+k2MHKV3P+mgLAo8Dzg6HeHwVx8DN89SBqdssCA34CUTgIGEThFz8Ssf+I7gk22oxbt9ikW+SrAbYYv6eyqTSWVe1DnmDI0AAtPQ3p4umvnRU0rRoXdAij2+NvvFgEC/td/hEVgyVusg3qe7cC7wYf+PwLJ2kwtvDP2nBumYtWV2lyziJFJDT7afHuulAhxZmltX0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA1PR11MB8544.namprd11.prod.outlook.com (2603:10b6:806:3a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 07:34:07 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:34:07 +0000
Message-ID: <193df77d-4034-4ebc-8c39-9f01ec9936a6@intel.com>
Date: Wed, 14 Jan 2026 15:33:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/21] x86/virt/tdx: Prepare to support P-SEAMLDR
 SEAMCALLs
To: Chao Gao <chao.gao@intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <yilun.xu@linux.intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>
CC: Farrah Chen <farrah.chen@intel.com>, "Kirill A. Shutemov"
	<kas@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-5-chao.gao@intel.com>
Content-Language: en-US
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
In-Reply-To: <20251001025442.427697-5-chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To IA3PR11MB9136.namprd11.prod.outlook.com
 (2603:10b6:208:574::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9136:EE_|SA1PR11MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cff95f-bd0c-4e08-5636-08de533f4c9f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDlZSnNJRmNBLzNxb2hsOGVNTHIzWHZ0Q0w0alkxMzdRRmdHODBTUkt6TXpZ?=
 =?utf-8?B?T05lVUxyNytZUkgyajVFUFB3YWU2eVgxV1lPSy9uemQzYkFhN0NITklKTUow?=
 =?utf-8?B?cHZmSmVDZVpYbnFYb1Y5cW5TQXU1VTVCZ0tETElOMWpKMFdlOHU3TTNGQ3o4?=
 =?utf-8?B?NnpDRWExK2JZMVdwd2U1WG1oOEs1TFhuL0tSSUtXRnNVU1ZZQ2FJSUdQTUdr?=
 =?utf-8?B?anJjRG4ybVFtMmlhZGlUWjVkalZyRGxtY09rNWFnSjJLQ1hvTjZ5cHFoRXZn?=
 =?utf-8?B?TDVTQVc3ZE9NcWdxeVdmcmxXZ000emRka0JyajJCcktCZ1NKcUxMa2g3THJa?=
 =?utf-8?B?U1NkeEd3Z00xVllNWEgxWmNORUJjVXBSWFdoSmQ3WjEySU4rbG9iUklrU3hL?=
 =?utf-8?B?VloxTHJpMnMwOWx0Z29BdmtUTU44RllkOTlSUTdGbU1lWnNzUjI2aWxtTHpk?=
 =?utf-8?B?K3VSbkhDWVgwOGtJSnQ2dEN2SXBidEkvNDRLZTg3eHY2dk93T3pKTmw0R0VZ?=
 =?utf-8?B?QmtlM2tiYjVPTzNsNkEyTEg5MkdjejJ1TGVmbkhLZ3hGODdOL3hxNk0yUlBj?=
 =?utf-8?B?Z2ZBRUxEUHhWN01WRkNHekdmRXdINGRVeUxla1pLb3dvOHhEakpPNHQxbEFZ?=
 =?utf-8?B?a1pKZHJlN1YvUkgyK0M0eU5mQU02aDdZQ3lKU2tGNUdMcDFubVhsQnd3STlR?=
 =?utf-8?B?UkovU2JwTDNHbUJvZ200Q1REaTlwWVNUTU9zU0lsWUNTMW0zNU01U2YrM3gw?=
 =?utf-8?B?WnRNZ3hVYlpxT2hHYVM3ajZISUU2eTZSbmVJcDltdjZQOTFpTmhxSlVremtq?=
 =?utf-8?B?L2Y2SXpTajhRaGhoSk9VcUVDRkttZVorYzJvWWRZelZ5V1BzWmJDSURadFpO?=
 =?utf-8?B?T2tqT3N4YnVyTjdlbFg5ZndBeGtVYXRHTXNNd3JWQUh0VkVxY1ZBTnJQUGlz?=
 =?utf-8?B?ZkowKzhIUmVMRk1JUUUvOXdqMU82cjJqbHdzUFhhZDM0WHRBWUJxMjI0OUJ3?=
 =?utf-8?B?emtLMmJ0RFFZcVIrWEFjaWMzWFBRNE5yc0Vma2tiZnZiVU53K2FqSGNJbU0v?=
 =?utf-8?B?OXZmUThpSldaRHhBVGhhRWlLRy85Y3luaTEyUGhkNEZHY05uOEhacGljc0tJ?=
 =?utf-8?B?YTFBWUt5TjBuNVN5UUNvWndSZHBUcE8rMU1LVEdxZnhHOFlhaDBwTWwyWXZo?=
 =?utf-8?B?dDJVcWx3SlZNc2NGTlJEaGgrZUtRaXN5M3lRVGJtSGRlakg0ZmdDMnlHV1pD?=
 =?utf-8?B?UHhVM1J6b3VWMFFDaDI5QmFJQlFiTFIrWUthK0ljU29OSkZ0NHN5YTRseGJ3?=
 =?utf-8?B?dDlXbzBmdE1TRThvRlZveXJqUCtsWDRpWTdaUFJLaklUclp0RE1iT2p0dFdR?=
 =?utf-8?B?eGRnZjZSS1poVXZLWHpSOGZiSlJwWHJydjQ1NGtUaVdrT0JpQm1PemNxWVNI?=
 =?utf-8?B?b0IvWWhCSGhvejkwU2tOZGRDT3B5dlkxZ3hzdmJ6eTVsNkJXQkVodklGQi9V?=
 =?utf-8?B?ZnV0MTROeGlWMUxXVGp5QU9ZMFFnbnU4UXJxdGRWenc0UlQ4bDZmZVRDeHJq?=
 =?utf-8?B?T1NtMjNJK1BySy9pcGc1ZFd2bSsyZkhmSHBQamNMYWQvNVBXUzB0akE3Rkc2?=
 =?utf-8?B?aERkbVpwZmgyZXV5MHFLNjFHeHVJeUt6R01pbGYyWFhCWTlHa1ZDeW16SHZG?=
 =?utf-8?B?UExHblB0dWtMZ0FTQjJlRzAwWElUNklTeWJsZFkvZ2JXMHhvZGJhYkdsUWlt?=
 =?utf-8?B?eE5yekhidUNDbEVkT0JlS0loNldDWW1rRW1oem5Kb01OYXlKclBZaTZxU3pR?=
 =?utf-8?B?eDQ5MlZDNDV2TkZqckxxODRBTU9VZzRVbVFyREJmU1VNU2dzdkFrYjBhcWU4?=
 =?utf-8?B?U25rV2RRY3V2UmczWkJwRmJDdkNuVUZ3VklFa3dqUm5lMTVjVmdiWW9iNnUx?=
 =?utf-8?B?azcyZ0U0YzhzVHFoTFBnajlINnJaUDZqZjlESmhrOVBHT1dNOUJVRnpBOExm?=
 =?utf-8?Q?1Kdw5jl0JaoPfXy8lI4YZ7Te42zol8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJ1K3VIb2JCU2Qrckp4aWNPOFFPQ0d0Vlp1OFQ4UTBoZ1ExVFloOS92UjFY?=
 =?utf-8?B?RzZ5eVlZQTE5WXRQTlhuL1NqcEZPdFdmU3RuMGFOTVBjUkFUdUFkOU5hOGVh?=
 =?utf-8?B?SlZiQUJ0aUxqREtPdjQxakFlRitRQmgzcEFKMjZPL3kyQ25zd3Jzc3czQVJx?=
 =?utf-8?B?dktrRWZScHd4Nmw2S0ZGZXFnb0xnUW5Tc2g2MGszWHNrTkNiaElKczdtTmlp?=
 =?utf-8?B?VTFJZ0ViMmxBSFpCWC9wS1FwYmlkSUdpQ0xoMHVycW5xV1lod0M2YkVGUEVZ?=
 =?utf-8?B?YWZiU1ViQnVQOHI0ZXc3aUV6YytIRWlEYU45aVU1UldxQmZzS2s1eHBReDRZ?=
 =?utf-8?B?dlk2SGtkRjR4eVNjeEp1UzJXWncvZlpJOXh6QmtIaXg0UU95YTdZM05vU00r?=
 =?utf-8?B?S0FLSVNxVlJOaEkzREFvY0tWN3VkTGUrNUNjNUtnYk8wU0l5RVQvcEFpNXZm?=
 =?utf-8?B?VGZOV05pbzRLaW00MFVpU3RhNXZkZnB1bTgxY1AyWGFvc3hnS0FhNTc2eVhR?=
 =?utf-8?B?d3JuSFhwMFc4NGdMYUtzL1RPYmhUTkZMSEpRelY2eWhER1kyS3dxNU05MUEy?=
 =?utf-8?B?RFZtaTBCbWZkM3lCczZJMTVnK3Q4NzZka1ppSDVkVC9uRnA2Qm10NlNJR1BH?=
 =?utf-8?B?VHRlOHpBN1dKdFM0QjJSNlg3azBFUUtLeW4wR1J1QXFVZEhVWjRCeTNqQ0xn?=
 =?utf-8?B?RG0xclFWbC9nYWpWZC82MmlHa3RRUWQrNkdPOWNXMitUeGt0U2NJdnVCanNO?=
 =?utf-8?B?RHh6Z25ONmQxT0Q3SXFiQU50NmhwRDEwOTBUNHhqMWdOaGk0cnVGSWtYdFJT?=
 =?utf-8?B?TlliS0RIQXNubHFYM3A5eXFHN1FhM1B2S2VMQ3pKWU9NalB0V21SaGJMYnlh?=
 =?utf-8?B?dkRyOUlueDZOZlJaNEJNNFFRSm14QWRMdW02NFhzMnpXZ1d2Yk9kdGRKa21Q?=
 =?utf-8?B?RzJWbUZnaWFkUXIwaGtTdmZGSFhKWlByVEJnTXdMdXplLyt0Tlhqb0IyNmFB?=
 =?utf-8?B?TVBOYUxPdEVlZnVweE14UVd2YmhuNnpDSFdXVFNCUEJuVFdFZHBmak4wVEp0?=
 =?utf-8?B?aEcyemVDdTNEd0JxRCtxbHFuRUpmb0FOVDFSbHNDOWx4Z2FmeTRvUTNTTFYv?=
 =?utf-8?B?aXgvK1MyMzU3L2FJbVRGaXRuRmNtRDFqbWpxMG1TdkpSQnNseFhpcVF1Yk5u?=
 =?utf-8?B?cFRWeHVoSVl5UE1UVVpUWHdEYmN0QytDS3dreng5YXZpcG1SY1Q0Ym5SK1Jv?=
 =?utf-8?B?VWRmTWNJb0NmSGd3SmtwNW4wMFN3aTlVaUhYeVo1cm9YWlJtcVAvbmRZQkFz?=
 =?utf-8?B?T3B5NEx0RmRsQkhMTWZoOFJSWnh6VUt2TFNPMUpmWEkvTjF6TnZtMWF1bzhO?=
 =?utf-8?B?VTF2K2tLUWEyVlprUGhVWDhvamxwM1QyVWxNK0JzVkc0UmRZeHNrOVI5M01j?=
 =?utf-8?B?OWJyRnVoR3JPR0lGdnJEcWdzeGlJQUkzbHdHRUY4Um44cjMxcUJ4NEdkK3NV?=
 =?utf-8?B?UmYrM0Z2bjZMUDBtMDlOaSs1THRjMTd5UG4vV1NWWW5YVWg3TGttVVRmOW44?=
 =?utf-8?B?Sm9lTE1Jcm1HZ0pxb2hQeWhnRlNIT3l1ckpQeTBBMllucU9RaVowMHltTmRM?=
 =?utf-8?B?emphQSt3ZERacmJWazlkUDFVcFA4YnU2VnpCQnI2RC9YSlJFZTdSWXlZamxP?=
 =?utf-8?B?Yi9ZdTdBQVpTWDBVZm50cDZqRXVjZnRIVHFQV2hvTFlaQnEvT3FIbEk3S3JL?=
 =?utf-8?B?eFJTS0FlZUtqczVJNDA4dFIrbFlsdXQvNUhOVkFwblZYZmRPMjdXSkdiVWdt?=
 =?utf-8?B?Qmk5T1RtNXkyOFBUdUVxUkpXN3RSdEl4RXd6Z25mc3I3YXZNQm9SK09HZm1y?=
 =?utf-8?B?T2MrL0FFYlZob2FPOW5VZmt0dXNyUkIyOUk5UWpkdHZSdEw2bGFFMHZXeW1a?=
 =?utf-8?B?ajVDWHBmWSthb1VPL2UwVHZoSU8zWHpOS0NYTXJxY0dyZ3hUOTZyZFRUS1pn?=
 =?utf-8?B?ODZRTTlCVVJYV2NvWkZ5SmZycFFvVVc3eWsvQ0M5K0RaTElGeE1QOHUzVUxW?=
 =?utf-8?B?THYyb1RqZ3poTEI0enQ4YmxxY1JxZ3hzVjVyTXN1UHpDcmZ2bDlOUFdQT09s?=
 =?utf-8?B?MWNoOUk1VnhaNzE5MG9QTzVvM0owejduNTZDbGsvK1NXbktiV1hGQm5tTDhW?=
 =?utf-8?B?eWF3Mm0yNGVRUjI0QlR2Zk9WcWw2Sy9KWDhTZkJoM2JVUUJPVnBWaWxJZTMz?=
 =?utf-8?B?L3Z1VHdsREN6dDdpUlJBS0dBMUZXWXZBZTRmVXhDNHVVUUw1di9XalZ2WHJ1?=
 =?utf-8?B?aFZSL1hobEhOVUN6MU05NFlOV3dZUnNJa3NsalhQbi9ESUwwTHRPWjNXU0RI?=
 =?utf-8?Q?jVkTCizh9bshXXQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cff95f-bd0c-4e08-5636-08de533f4c9f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:34:06.9749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyN2tQwnKPhCvqc1vLpOPTpngL4WEM93vqCJoX1sNpY0G2bp02KmmcQ1CpYcYur68MNqi1R0NAfWdjeQ/X1U5wX6wpQuGknmzkT+5fE5sjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8544
X-OriginatorOrg: intel.com


On 10/1/2025 10:52 AM, Chao Gao wrote:
> P-SEAMLDR is another component alongside the TDX module within the
> protected SEAM range. P-SEAMLDR can update the TDX module at runtime.
> Software can talk with P-SEAMLDR via SEAMCALLs with the bit 63 of RAX
> (leaf number) set to 1 (a.k.a P-SEAMLDR SEAMCALLs).
>
> P-SEAMLDR SEAMCALLs differ from SEAMCALLs of the TDX module in terms of
> error codes and the handling of the current VMCS.
>
> In preparation for adding support for P-SEAMLDR SEAMCALLs, do the two
> following changes to SEAMCALL low-level helpers:
>
> 1) Tweak sc_retry() to retry on "lack of entropy" errors reported by
>     P-SEAMLDR because it uses a different error code.
>
> 2) Add seamldr_err() to log error messages on P-SEAMLDR SEAMCALL failures.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
> Add seamldr_prerr() as a macro to be consistent with existing code. If
> maintainers would like to switch these to static inline functions then I
> would be happy to add a new patch to convert existing macros to static
> inline functions and build on that.
>
> v2:
>   - use a macro rather than an inline function for seamldr_err() for
>     consistency.
> ---
>   arch/x86/include/asm/tdx.h       |  5 +++++
>   arch/x86/virt/vmx/tdx/seamcall.h | 29 ++++++++++++++++++++++++++++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
> index e872a411a359..7ad026618a23 100644
> --- a/arch/x86/include/asm/tdx.h
> +++ b/arch/x86/include/asm/tdx.h
> @@ -32,6 +32,11 @@
>   #define TDX_SUCCESS		0ULL
>   #define TDX_RND_NO_ENTROPY	0x8000020300000000ULL
>   
> +/* P-SEAMLDR SEAMCALL leaf function error codes */
> +#define SEAMLDR_RND_NO_ENTROPY	0x8000000000030001ULL
> +
> +#define SEAMLDR_SEAMCALL_MASK	_BITUL(63)
> +
>   #ifndef __ASSEMBLER__
>   
>   #include <uapi/asm/mce.h>
> diff --git a/arch/x86/virt/vmx/tdx/seamcall.h b/arch/x86/virt/vmx/tdx/seamcall.h
> index 71b6ffddfa40..3f462e58d68e 100644
> --- a/arch/x86/virt/vmx/tdx/seamcall.h
> +++ b/arch/x86/virt/vmx/tdx/seamcall.h
> @@ -14,6 +14,19 @@ u64 __seamcall_saved_ret(u64 fn, struct tdx_module_args *args);
>   
>   typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
>   
> +static inline bool is_seamldr_call(u64 fn)
> +{
> +	return fn & SEAMLDR_SEAMCALL_MASK;
> +}
> +
> +static inline bool sc_need_retry(u64 fn, u64 error_code)
> +{
> +	if (is_seamldr_call(fn))

Do we need to have this check, can TDX module seamcall return

value SEAMLDR_RND_NO_ENTROPY but for different reason?

> +		return error_code == SEAMLDR_RND_NO_ENTROPY;
> +	else
> +		return error_code == TDX_RND_NO_ENTROPY;
> +}
> +
>   static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>   			   struct tdx_module_args *args)
>   {
> @@ -22,7 +35,7 @@ static __always_inline u64 sc_retry(sc_func_t func, u64 fn,
>   
>   	do {
>   		ret = func(fn, args);
> -	} while (ret == TDX_RND_NO_ENTROPY && --retry);
> +	} while (sc_need_retry(fn, ret) && --retry);
>   
>   	return ret;
>   }
> @@ -48,6 +61,17 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
>   			args->r9, args->r10, args->r11);
>   }
>   
> +static inline void seamldr_err(u64 fn, u64 err, struct tdx_module_args *args)
> +{
> +	/*
> +	 * Get the actual leaf number. No need to print the bit used to
> +	 * differentiate between P-SEAMLDR and TDX module as the "P-SEAMLDR"
> +	 * string in the error message already provides that information.
> +	 */
> +	fn &= ~SEAMLDR_SEAMCALL_MASK;
> +	pr_err("P-SEAMLDR (%lld) failed: 0x%016llx\n", fn, err);
> +}
> +
>   static __always_inline int sc_retry_prerr(sc_func_t func,
>   					  sc_err_func_t err_func,
>   					  u64 fn, struct tdx_module_args *args)
> @@ -76,4 +100,7 @@ static __always_inline int sc_retry_prerr(sc_func_t func,
>   #define seamcall_prerr_ret(__fn, __args)					\
>   	sc_retry_prerr(__seamcall_ret, seamcall_err_ret, (__fn), (__args))
>   
> +#define seamldr_prerr(__fn, __args)						\
> +	sc_retry_prerr(__seamcall, seamldr_err, (__fn), (__args))
> +
>   #endif
