Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82979DA
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657760; cv=fail; b=Ndvap8vsoG88mn9oDS6w5FCWo3T9/+GLbX8GbGsfbA5fjP9CDk7QMrIAeh+yxH0sMVQLBZuS8WgcaaU9ip/L7IWkTtJ7WU+D5+4XNA36sbS3tZLMJ3Ci6+o2qq3lYDSQ+7SPf0pg5yiDvvMbuKxJg8WiwgFMJLoJYlz2SllhsBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657760; c=relaxed/simple;
	bh=r76RUIYkbhLPJP6O1BvTtZ2pxc0gqMnK8yGXXWJhzAU=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=ZTMtN1nNLod8Qft2+heQKhcVpnxhBsyteUfga2aWV+bSGrPvHs6D/sbyCcEMDQ2bXGB5GOf7gfswulJ6Ifi6zY9+znANnorxGHSBgTuUBF82VxZN3n12Ioq5/D0xVr6aiqiKBUqPcWx7+Aq93jTLSpjbruOrh85jab3ho5BOFuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdVjPQ8X; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdVjPQ8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767657759; x=1799193759;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=r76RUIYkbhLPJP6O1BvTtZ2pxc0gqMnK8yGXXWJhzAU=;
  b=BdVjPQ8XkMoF3KpUaFtnFJYwXZu6NELbr/vjk4bhU7aDHVeBgsPEzhVH
   n6XJSAHe6AScCU9TIC8cqfAGz+Gwfm3ZKa7gjeK2Oj7JYrNlgdACFEh52
   UX7P6GEljyDTTxMrKEZSd4fJl9GxS4y1pJBvfI+REYgsu032hA1ZAbB0F
   ktOMZpyzho710wUztJXr9sILJ+M6jNa5Vt8ah1HB7vNQv+0X49xGHIi9g
   BR+lGoQpzIFozCJ1hDhPC67Rjiyuksn9ac3ChZ5csE5tHibpknP/FaNwF
   xxAJWChqjGqgxMPe3X1EJgOPrJqD/gnra+BUhAG6UoFJkKP0LkJ3SaJFV
   g==;
X-CSE-ConnectionGUID: 4jw50pgsQh2e4zUUFvz4nA==
X-CSE-MsgGUID: wj1Na7T5TTGI3U93v82dEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68959789"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68959789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 16:02:38 -0800
X-CSE-ConnectionGUID: 8jxn+xG6QeitIkEWQr/YRw==
X-CSE-MsgGUID: 5oGU9NiqR7GmNSBgo1GHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202133232"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 16:02:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 16:02:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 16:02:36 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 16:02:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ1L7NVy9N6Sl6zT98UKhhKMh3lWW2FMU2DeqORDPoRgkeD44l9I55Mf5g5W0JrMNiaCjGdo2R1WvETCvoHEOg9akZLeEppvGE5k9ylV/vlpy5Lhoqfz0go93RirMk8tBSWgqIxCjWiI1LX8S76XUJTJFWGMPjWVOcaamGUlkfO+stZt7U2dox5WmFQm2Dqqcs73Rs49Bs8s2jW9u6ZNAQxScg1Dnz38s6BdFVHnNUSMiEaZRJ2bovTDLJClbTSbdScuzgpg+VI2VJOrmI/rxb4u/q4//z/jgmQNFvr/8Xa8OXRrrCHsJqCIvpLM4nPun3Q1aDPWDuz2DiGEhsZrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsSjwr20kf8l7mh8suEbbsPwXdOZq+Y5PnmRGw7WoAY=;
 b=S/bX8yLAC6O6t59tglUuzEiyRkv8KoWS7nLrgpDevDQC5T2AYa/3OzClgwTYq7KHQDJIhsuLNeWykoIawEZJxNXIRbZdBZqQbfL9RysF3C7c5WbJamtPcFOyTy2yZDplyjkZFHx+a44JrUhO/Sh4diPZ/95Ql8nyttHAzxd3ba4j7HxEpkiTnh9przxPEnzNXPJ0Bgh6bmgpSGsPnyNulLOMAWK8xucB+htPKsDJvJfyhEhePXkRvRh7FxRM9CHKn8WjrObc4m6CGG3nssXs29NeSPIwySkneKRyDiggx+rYu3gOmIisHJyppO7WUdPI/+BxdiY3iPhIOwskPZL9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB8492.namprd11.prod.outlook.com (2603:10b6:806:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 00:01:53 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 00:01:52 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 5 Jan 2026 16:01:50 -0800
To: Dave Hansen <dave.hansen@intel.com>, "Lange, Jon" <jlange@microsoft.com>
CC: "Williams, Dan J" <dan.j.williams@intel.com>, Sean Christopherson
	<seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
	<john.starks@microsoft.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch>
In-Reply-To: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
Subject: Re: "Paravisor" Feature Enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bc8711-1faf-4d58-3990-08de4cb6cc2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWM4YXRNOG5xWVo5VnFxajMrcTJoc3l3NWNnaG9tTkIrdmNuaXJDeDV6dmlO?=
 =?utf-8?B?SkZMU0kyWnBzbkZpeVpVeVlxOFRjZ3B2clZjNjBUTTg0ZlZ6c0FrSTkvQTNV?=
 =?utf-8?B?dEdBQ1JqYnZxOTJSTkI2MW9oZ2NtdDhWY2NoMCtWM3hjR2E2TDlDSHRNRGZx?=
 =?utf-8?B?OXR3QlBRSkRDeGc2TGRFd21jSHRQSnlFSkxnb2VwYUJuT1FRZ3FJbzBwRWk3?=
 =?utf-8?B?NjJxNHpIZWEvMHlXeEVmR3Q2UG9IbkkwOG9mVThBaWRxSzRTeVNKTjRjcVFm?=
 =?utf-8?B?VEwxL3FKcXhjeW4vSk5oVGtNclhMWDQzTHpBQlhOZ3BKRGRCTkcyUWlkWSta?=
 =?utf-8?B?VndITHBnZi9LTzErZHNpM0I1YzNhWG1GeHJ4bEJZQXpjYkgvdmhnVEVLcnJ2?=
 =?utf-8?B?ZHNTZjl5czNYRUo0ZjdFeDB0aGpxdUFBb1RZM1JxWmU5MDgxY1FBOFoyUlV6?=
 =?utf-8?B?UXVoZzlGZVdNdTNHMWJvMDlqN3NzSjE2SEpROVp2RURQRTlpSmFOd2p6dXcw?=
 =?utf-8?B?dlhEazIvbkM3U1J4R2RTL3pYQTVuNStOZE9iSWIrWk8yUW5Wc09lSXpjVVdl?=
 =?utf-8?B?WGltV0FHeGtTdlM1MXkydkpmSUdTblFERnVSdklmQTlacmtRQ2RYTTZSaThI?=
 =?utf-8?B?ZzFxc0tKeXZBMjd5aVc2RWtiMFMzQWMvRmg2RmM4VjBuc2RnR2h2bzhTSG1a?=
 =?utf-8?B?dlBZazZhWGlWOFpJL29PTW0rMkdPMWVVekFrK1F6dE1lOWtvMmQ2T24vVHdN?=
 =?utf-8?B?b01YZkZDWW1teG5Kd3krcXVTY0ozaGZJS1ZuWm02MmZNb1lld3k0Z2xuNmpI?=
 =?utf-8?B?KzVwalZuK2pzL2F0VGs1eWRBTVg1eVB0N1N5ekNud3JlUEErZGRuL0tDVUJp?=
 =?utf-8?B?d1FTR0tnaU9pUGZVZGNQS3BkaEtFM0lEdlpVU25mVTB2Y0x0bDBjOFF4YlJl?=
 =?utf-8?B?ckVGbFJYcmxQQXpZRzJVUzN2Ymc2WEIycDlhb2hXbmxYSUNQS1JBcHZDVWZq?=
 =?utf-8?B?cmFFdEJMd2FrMDBmQTBEODdWa3Q2cHVvMTRBNElmcDI1Q3hNTzlaWUdXb0w4?=
 =?utf-8?B?V1BTT1BUNStYcWtMQ0hjeTJaM21wbmhZSnpDM3dwMUltemFIZllLK0NacmNK?=
 =?utf-8?B?bW1XUmtnQWhGRERlWHVpaDdSelJqZ3Ezc09tRFRtcUl2TE9DZ2ZkMyttZkho?=
 =?utf-8?B?blZJeTB2ZFlTS2k1WSsyMjJTMmVwUEp3R1NSeWEyOUJNWXgwdm4vNzM0d1Ra?=
 =?utf-8?B?R1FCQ2YrWkRFSU1OdG9QZkp6UEFBRGROVkdDZkg2RHg2Z3Z0MHA5UFV5Nm9W?=
 =?utf-8?B?ZjFGOUVyaTFRdVhGTE85NTJkYlZEM2xLTHJWTXlVb2JSQ3h0bWZsdlRydEdD?=
 =?utf-8?B?TGpLNVRSSDNyNWxTcFE1M243TitKOGd1eGdIQUVnSGdiQ1lSOW1Vd212dkgz?=
 =?utf-8?B?bHZvaFhYN2hHR0ZJV3lqS1d6TU5jYVorSU4zcXU3UnM2b0k4cmRRb1NTdzdV?=
 =?utf-8?B?VFdkNmlESWZJU2oyOENXWHArc2pyRk5wTnVsSjFKam9UeSt1clR4TlpGYlVa?=
 =?utf-8?B?L3Fvc1psZHFzcGlPcmQ0bHlrNENUOXNVRUx5alF2TEovaGFvdzl5SE9rNThi?=
 =?utf-8?B?WnA5U1NxR0JscWtXSXRaWThrMGhaLy9XaWsrOHpxR3Bab3FkdHJKMGJWOEht?=
 =?utf-8?B?eG5vSFNsbmhCZWVvQlNuSXJ1eERZdk9wb25EcGgxUEpOL21taWNseGxOUDlS?=
 =?utf-8?B?cHc1dXQ2NDF1aXlWK1pOaG5kQlA3V1Bla3lzUXFFVXJEMGZ4VkMvZG1xM1cy?=
 =?utf-8?B?VDVLVjV6Zm9pazlSMnF5RWR1LzdDUllUSkc5cDBlSlA2NUFxZElZeGRJYjJR?=
 =?utf-8?B?aXhYczBJOW40dEkwRUF1YWgvOWlVZk1FYTlsMTJMQTVzcmljN0FvSWJTNDVO?=
 =?utf-8?Q?uAWpFQLk5H8kpDFWttpcAgWHehktU48c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2Z0N1l1am5xNndBT01DclhCQTB5VFBXMHdOT1EvVlhlUThCb0lDZlVLeFB5?=
 =?utf-8?B?LzFydHQwWDJ3ZS8yTmRHd01pR01ZVlVYdlMvdWxIVEY4eXpLaXJZWWJudjRo?=
 =?utf-8?B?WkN4RVlzOXJXajBoTnh5SXJ6aUR0aSsyV1NxeXgxMHpXNFB6N3BHT2xEcGph?=
 =?utf-8?B?bUtmRktpT3UwYVJxSFJHeDZIcHZxNU5Oc3FzenlpVDREN1ovYUQxTytsb01C?=
 =?utf-8?B?TTlWOHJscWZlVU0zaG1BNHhCM1g0RGI0azdnVXVnY2FwVkRuMFEyQXBUQm9Z?=
 =?utf-8?B?MkVJQ1dmSDFoZStCdmRWc3ZZY2ZzR3huL1huNDE2M3RJRWx6V1dZUVRnM3B6?=
 =?utf-8?B?aUNKWkMyNzNYcE52Y3hZNzV6bnNyMW1RT21PSC9GMWY1ckIvMis2VWR2alBs?=
 =?utf-8?B?aXFvUEQxbHZ5cWNkVSswMEdRYVFYejlYVk5pemJPZ3NwbEFHZHVSSnBXYnVS?=
 =?utf-8?B?bTFybDY1U1Vna1hNSTM2UGUycGJYaUt5SDE0WGh5eWwwNXJrZTRnVENhOVM2?=
 =?utf-8?B?WEVZTWhpRkQ4QTlTZ05mNW5MSWtnUHl0ZUM5YkNoQTBSb2tuSlA5cnNHOFRt?=
 =?utf-8?B?ME1XeUYxaXZ2OFlGZHkwOExXb1R0QTd1MkpacFRoQnY2clBSK0xUV01Ic2wx?=
 =?utf-8?B?TzdyUkRQNGFHVWcxbFNabUwvSEYvenRhUUJQMnJGOG5NRXMyQ0lQTEZWb21N?=
 =?utf-8?B?b3VGaVJFT2JROU9EOXdOQ0U4MXpzeVN5dUFwZWlnL1JFaFBEK3lDRktwZEM1?=
 =?utf-8?B?dXZWckFxWFlNQ3JJcDRZeElhV1ovbnlicXNRdnJ1aS9WQXZrNXViOGtZb1RX?=
 =?utf-8?B?UmxUKzFHdHJqdGlkdC92akhMamNaSFVVZFF5cC9MV0NSUWh5TTJGYTJWR0dD?=
 =?utf-8?B?YVliWHZSdnpQZTFWbndWb1FGdEl2Vy9ncE5oZWJDWmZiWEFqY2hHNit2aWZy?=
 =?utf-8?B?L3dQT3ZBcThVbVFqUVRoL3A0dDI2MTM3OFJqaTZhdE1nY1NrbWwxRUl4bzQ5?=
 =?utf-8?B?aFBUbjQ3YU5WZGRqdGUxc2xVWkhwUmx3YllRSGY5RFJUa3MzRmVCUTVVOTl4?=
 =?utf-8?B?Y1NzSVJ1MXhWeE5yMThXUmVkQ2NrUlBPYmpRc3RwODMwTkZKMm1JcWJEUFIw?=
 =?utf-8?B?VDN3aXhoYjFKbFRvbTFKbGRPRkczQndSd0RWVnZuMmtjd2g2OHBIMUM2R0E1?=
 =?utf-8?B?NHBBMHl1ZUNKVk9WcGl2a2ZONkt1QlJKR2RqclRid0ZEeUhDYW9sR2JsZ1hw?=
 =?utf-8?B?djRWLzkvekpyOEhITnpabDMrdTdERFUvRnRsQ0lGNU1KemlJVjN1MlUwTnpt?=
 =?utf-8?B?RWYrdW9mNGxoQWZheFNHTS8rZDhNbFFNdlc4aHFKVnprTUpaQjIyeVZPa1FJ?=
 =?utf-8?B?d3lraVVOWjZ5L1dyVVJSeHcyK2Mzcm9DNVY5N3J3NXpZOTg0VzRWVjdsWEJi?=
 =?utf-8?B?WUNtVDVDc1Q5QXdVQ2xyRlBKcDFUL0dBWklKS0xQbXVPWFc2SzBvRDhRNS9v?=
 =?utf-8?B?UXhNN29pUDhTVnJ0UWo1anJxcTRuVEhvMDg1K3Nxd3Q1WXgzTFExYjdQcU1y?=
 =?utf-8?B?L1dUY0VsQmV0RzJLQzlKUWdySWRlWVhjRHVLOW1vZFY5MURZRjhzME9mYXVn?=
 =?utf-8?B?djZmc1M1L2swTDRpNTJYK3lQRUk3NUlDTmJ1ZW1qRENKQ1Zlbk9PVDZ1WVVI?=
 =?utf-8?B?YkxkeThMWDhQRXBWa0FtYWZlOGlCVEdJb3ZuQVd1c3dYU0xSRFVOZXNGem13?=
 =?utf-8?B?RXFqaHYyRHg0QXlkQmxQT0lYUEtlblUrOXVKUzMrR1UyRHdrNGtHSVoxYnl2?=
 =?utf-8?B?ZEE1ZHZoYU1FUDlZWlprdnNVRFVxM0Y4dzB6Y1Z4b3MxZVRZSlc2SDhPVzVD?=
 =?utf-8?B?WjNCZjRVVE9JcVk0RHNQOTdKUHpTSFVvR1A2NTU1N1dGNTFSZy81NDluV0Qr?=
 =?utf-8?B?NjhlOHZUNEozbXE0V1hTVm5NUVVRbFRvbkZLZWpqWm9HSWdjRGw1dnZFSXN4?=
 =?utf-8?B?T004THBTMmp4dDFyMnhCZVRjKzdzc3NUQzNXT3c4RmN5T2ZTSjBEMHRDZ0pT?=
 =?utf-8?B?eVBkMWdleEIraDR2dDZUdk81N0VCZVltQVdmRXNleUZBSmN2cG9NaENidW96?=
 =?utf-8?B?UURrNVVzazhnVzJyQ3JIc3dPYnZ2MWhwSkJyb2pKbkRJRjdCSUErUUx0ZDAz?=
 =?utf-8?B?TlRuSk5OL3BWWTlsOW0ySlBMcmFhMUE5UmlyZll4SWRQOFRvaUpNSG9TcEdt?=
 =?utf-8?B?ajlreGlDdVlSOTJDZitWelVWMGNmT0RhVUl1cHJqaEdrSG51VTdvYm9LNDVt?=
 =?utf-8?B?U252TE9ZM1Z5cFQrcGJGeVJYR29HYXFsTXIzNUtDM1N3OVJ3dDVpRW9iYWYw?=
 =?utf-8?Q?Zfj4IAlYhv2C1lhI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bc8711-1faf-4d58-3990-08de4cb6cc2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 00:01:52.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +V+gmvENy/OyK+zaoGenIQ83xc2XblKYsuNI7EKEpfb58xtojE72lu8HIoDeue9A5zQXEDYRpouzo9+O+UOEekQOU2LHNouGNkn6DaWpEfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8492
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> First,
> 
> Jon and John gave a talk in Tokyo about feature enumeration under
> paravisors:
> 
> > https://lpc.events/event/19/contributions/2188/attachments/1896/4057/05-Paravisor-Integration-with-Confidential-Services.pdf
> 
> The tl;dr for me at least was that they'd like a common and consistent
> means of enumerating these features in OSes, regardless of the
> environment: TDX, SEV-SNP or even ARM CCA.
> 
> I wanted to explore one corner of the solution space a bit. There was a
> pretty limited audience of folks in the room. Please feel free to flesh
> out the cc list with anyone I missed.
> 
> Dan Williams' first thought seemed to revolve around having some kind of
> platform-independent device that could do the enumeration. Maybe a
> synthetic PCI device. I'm sure Dan can chime in to fill in the details
> that I missed.

More that it sounded like "just another firmware enumeration" problem,
where a platform device is one of the results along with related
firmware tables and objects.

> I immediately just thought of CPUID. We already have a whole region of
> CPUID (0x40000000) that hypervisors use to enumerate stuff to guests by
> convention. It wouldn't be a large leap at all to carve out a chunk of
> that so that paravisors can use it.
> 
> But the biggest barrier I see there is that our ARM friends don't have
> CPUID. It seems like they _mostly_ have bit-by-bit aliases in ACPI or
> DeviceTree for the x86 CPUID bits, like:
> 
> 	X86_FEATURE_KVM_CLOCKSOURCE in arm,pvclock
> or
> 	X86_FEATURE_KVM_STEAL_TIME  in arm,kvm-steal-time
> 
> As far as I can tell, these aliases are all done ad-hoc. This approach
> could obviously be extended to paravisor features, but it would probably
> be on the slow side to do it for each new feature.

"Slow" as in standardization time?

> It _seems_ like we could pick a chunk of CPUID space (say 32-bits of it)
> and alias it 1:1 with some DeviceTree/ACPI property, say
> "arm,paravisor-features". Kernel code would just be written to say
> "check feature 13" and the arch-specific helpers would either steer that
> to CPUID or DeviceTree.
> 
> Is there anything like that today that's cross-architecture and
> cross-hypervisor?

That seems the definition of an ACPI description.

> Is there anything stopping us from carving out a chunk of CPUID for
> this purpose?

At what point does an ACPI property become a CPUID? In other words if
there is an ACPI / DeviceTree enumeration of CPU/platform capabilities
in firmware that can supsersede / extend native enumeration, does it
matter if x86 maps that to extended CPUID space and ARM maps it however
is convenient?

I have no problem with an extended CPUID concept, just trying to
understand more about the assumptions.
