Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6F2E03E3
	for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 21:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769462544; cv=fail; b=Pbm4VF+X/eUm9IlrquJ2Fg2hLNibAIfQLfWi+3dwnknyI7EFADYmcTQoTNwqddavXJgrQ9TaVWoLo5An8HSrKgWLXuNqa6kewgTD8Q+1KZimldPHdPUL1gIdoW9irAjVgVsAMajCs5Xl+NcYHO8b6sgFqFqUL/NiR/GtC0nxFjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769462544; c=relaxed/simple;
	bh=YJx0AM3X8qNK9RCZhylQriDjov4DSJ3ClBVVAR/yedM=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=H/cu+RUctGaP7TRWf4Vja+ZBmMGQCTIuuINpEaj+5IVnhR8E16XJLxV3KgChGF2ze6yfgvKQLHF79Lw9EiMMK3jyRBklTUYx6sBI4mQaLIFBkxza4/2mKk5q2I+v4Z7vecJiI8k8yYpvLr4Xuf14iFmTYU5cbdzXYik61Giyxqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzmCY+4V; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzmCY+4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769462544; x=1800998544;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=YJx0AM3X8qNK9RCZhylQriDjov4DSJ3ClBVVAR/yedM=;
  b=CzmCY+4Vnqg/+30tH8r2+27f0uwnYPIe6S0kCbIIOBZ4GQjg+eqGhkmq
   bbu+mxa4K3txsN9f/f1dnCrtjeMtPmbgiq/PxBpCkfazEDCfhYkypakfD
   Nz/bY5ltQ9zBV2ykHwuaEE1f2VcsL9c124MRiquBsFfKC1kNBjfaioPF6
   gPWeZSgkxAr9a/cLEL8Q91fZFiOduqEu8ceMQkiLDzvTeBD3WsqbSFldv
   RrCNevCT0gDjv/jRH26HCyeoWvYKhuB5VcCTjDzFZkxwW0x+VhU1eCFH7
   7OI4eO0gMKyrQKnw0kIxKF9EdruoaspwdshxLjuiElIdGcJdlTmIOp1fs
   w==;
X-CSE-ConnectionGUID: eJzC9FYlQSO4jtWqIQ1c0Q==
X-CSE-MsgGUID: J7Wjxx8UQtWiChKc5lBi1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70688380"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70688380"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:22:23 -0800
X-CSE-ConnectionGUID: odh8IymeQKWk+TwwsuDVdw==
X-CSE-MsgGUID: /U0UqJHHSKGHfe9yjXTtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207812297"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 13:22:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 13:22:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 13:22:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 13:22:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9jOGHmWlrCTWbKrYg067G27gc6eQKEOAbLyggZe8syV9vcW637N9z7LHmquNPlJEHqX7xm5UfLdP6AKThBKQEwY+KfNBQf1ucXVLUawOwOVJoNUBgLzcp3V8tMyBaF3L7zNB2F2txlxOR84cpN17edrxtdmyVOogh8xEA6Y7Wy0EoAS0fgF+M7OLo/x6wXOv0QYxwW/NF7NFgt0oIjdAU57Mg5XhQXlbFIzmxfKsOZ94w1grW6gs+vxef9bFM1Xfs3Z7nFA1iMhTvScJBGtK6F44+xZHVuK17uH1lb2ferg5vuLcoYDGSiycq/XSeWP95X9ibilr+eXeQXnzbZUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJx0AM3X8qNK9RCZhylQriDjov4DSJ3ClBVVAR/yedM=;
 b=tef0plap75+0+cvb0sOnTY3wJJ1zDXjAQ8X5xrojiyFYnWn373FZhgbMQA6533hmUmJxBt7+VTCA6fq2U71pZLxKziKD8gWwO6Nxa8j3UWo4M5r2YcRuc8HD+BnE4/MXV/fF6MCDDjoHSH5RsXsnkw2iVWVG14954HPu/2eoWEvAV8ibYJKpN/yTfPn/Kk3dK5Una/VRwUZYpYc9Ea111P9hQCHiseGrSHHwxF+PUqDa3TM/rTg1wa2S7mKA5keukwyuFMUSNNa/VkOjlO95LIS2M/vsrU8r9yqXcRlGBssJkGXq8L+oZXSO3kk/CQsFj8GHirQ2Xl6nw6Af4Bdygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA3PR11MB8937.namprd11.prod.outlook.com (2603:10b6:208:57c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 21:22:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 21:22:12 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 26 Jan 2026 13:22:10 -0800
To: Chao Gao <chao.gao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
Message-ID: <6977db02ebec8_1d33100f5@dwillia2-mobl4.notmuch>
In-Reply-To: <aW34Z7CfQORSFZLh@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-21-chao.gao@intel.com>
 <a648b7bc-11aa-41f0-bf42-ca9b66afe6dc@linux.intel.com>
 <aW34Z7CfQORSFZLh@intel.com>
Subject: Re: [PATCH v2 20/21] x86/virt/tdx: Update tdx_sysinfo and check
 features post-update
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA3PR11MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: a471877f-a07e-422d-256a-08de5d20f86f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkMrY0VUSHRtWWdBajBTUGI2bFJNWnpUaW93K2sxSUlMdm9NYUszZ0U0M3My?=
 =?utf-8?B?Q3lVSWFoTnIrSjU2RkxlQnVJUWhjbHR5Rmd0NWF0ZXpKbGNCUWsxcFprT2s3?=
 =?utf-8?B?akpiUm9FMnBVUWpRMmt5SDhmNWRYWFVJa1RaOHpNVzIxa0dXT2k1QXV3cmNK?=
 =?utf-8?B?K3o2NHpBbGNsRnZwdkdoaHhqeFRWUndxTTVCMExBaGRnNEFBT2NUS3J5L21x?=
 =?utf-8?B?akRnZEpvU204bmtpYTVjaVlub0RNMm1xMGY1SmU5a0YxOWp4N3NXZ3hXc0lH?=
 =?utf-8?B?ckY0QlVRYjYwbkNlZDRTN2s0OE1RMnlwV2JsSXJHUi9yZHNIVlAwVTRTYlQ0?=
 =?utf-8?B?ZVRoTjR1Nkw5Q2dLWkdqbElSUzZzMVFZRytpd0xMVGsxMnV6ZDhrTG5LZmJQ?=
 =?utf-8?B?ZlV1elJob1RNNDdLOXNhZzlOYStnVXhNaE45L1Nja3AvR1pUMS9nVHlqeGsw?=
 =?utf-8?B?SUdVUlliUmdVVG9OYzVremVseHNBQUJIU1NrL1hMczRzbmppZHdYYjdzSVJB?=
 =?utf-8?B?K3MweTQydnlSREpIVUh5WWxZMFZZWjluOW1VWVlBek1NUVQxZjFDWHRiZDVj?=
 =?utf-8?B?bUtKSm1jZHg3ZjJOSkZCby9KVktMQUt4cUNEWkdQbVhMK056eEtWU09KcCtj?=
 =?utf-8?B?YjdnLzlHYVBVYm9CMTZ4ckxGRjMzNjlFVlVDcktHWjlaT1QrYnFINkZJNXFP?=
 =?utf-8?B?ZmpuOVlqczYya1hhd2dtbW5VbjVlWEVEeUdwa0lFZTkyNkp0M1lTbElieDY2?=
 =?utf-8?B?dC95UGw0N3JXbklrNFVLdUVTNmJWZTQwd1NhdVJmTE40aHRVRTNuNUNLN2da?=
 =?utf-8?B?alNPSXpCcjl1ZGkzalJQcDArZGR6NUJxOGQ4SGtKS0Jta2VyTENtbVVrTU1C?=
 =?utf-8?B?WXNFN29hMFVUbFArOUVockxrck53aHNQTldsYVh4VXJOSTZTci9KTE9BcWt1?=
 =?utf-8?B?K2NkQU9ib0NYYjQxYkQxY1ZWdXU5aEU1eHF1VDQ2SnM1cmR2SWFpWDhRdFN0?=
 =?utf-8?B?ZXhrVThTVHR2S3ZFb1RmTmFQSnhwVERYcXVDdmhLUUhDbS9wL0JGU3NxSSsv?=
 =?utf-8?B?L25BOXh6b3hUUUI0TWlxSjRtMWt1NEcwV0RMWEptbXc0VXltdHV5cUJvbFZ3?=
 =?utf-8?B?OHhMdmNiWGN3cHdVS0xnNkRvWUxoTDV6cnFOY0Q5aUdMSVhEN1lSVTVheG9i?=
 =?utf-8?B?TzA2eVFOZnJhSStaSmtJVGZsek9HMHpIa0c3Q3UvQ1FxMGFFOWNnTTJmV3ps?=
 =?utf-8?B?SVFmYnMvTjBIQ1VFdFZMQzRRWEpkRFE1bUJOc28yMENrR0V2eXNNbU84cDda?=
 =?utf-8?B?V3BvNWhrdE5oVERxR3NzSkYxb1Zad2N0RUMzMVp6czFKNEUxQU1ISzlvSktQ?=
 =?utf-8?B?Ykh6aDYwTTd3c0thVVQ2OUlnUy9ydmJwWE5mTHM2TVAvT2E1Z3NUVWJ0bFpl?=
 =?utf-8?B?SndjZEtyZ3JZRTQxTFZubk1xeVRYd1hDemxobGI2VzRVdHZzRC9VRjI4ZkxD?=
 =?utf-8?B?OWl2WXdEWjNTQU5nemJqTE1aZUxiOGpoNFMycWN4d1QxcXN2WCtJbU50a2pV?=
 =?utf-8?B?SjNPYkt4WFBtQkI5WXEzcEhlR2JxUGF1YmJkQXNPUzduRlJDbXVXVWsySUl3?=
 =?utf-8?B?dzdnSFpEdTEwNHdDUENlNG9KeTJ1UThvZERsMFFLcWhwak5QL2VCaTlrOVlj?=
 =?utf-8?B?eWJZTU8wZkVLZlBNdHVMZ2xaanZZN3JoTHVqWGFZTENObGNCdUFvYkpvUDhS?=
 =?utf-8?B?enpOS0VkRTJQblpCWDEyV1RCSzBUaWhaU2IvTjE3YVlnc3Mvdldja1J3RUpz?=
 =?utf-8?B?ajBJeGZ3RUJWanRQQk5WWkMxeFF1cFdzcFZlT2MwQVV2b3BPN0lZZ1crWGJR?=
 =?utf-8?B?YUhqYmV3UmdtVGxtUlQyOGJ1b3kyNTVOMUFiMUlZZFRSQ21TZ2ZaazlBRXor?=
 =?utf-8?B?bzV2SEY4RmVIa1F0U1JRMmZoV0h5U1phRi8wWmpBUjZDd1NzVHBpSFJEZlpw?=
 =?utf-8?B?RENCTWN1RUlWUEl1ZXVEcmhDdFBtdzhJVENWaUY1SXJ4VTdhdllXUEpTbGVk?=
 =?utf-8?B?aFRJS1piaEROVUpSQXZTOWhOVWlGSVErVjVEODFZdUg0a205b0xLU25sMmtT?=
 =?utf-8?Q?9+sw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uis4YThncFptcnkyVlhLTDMwOVg4SStDUmFSdWhHQnpMS1h0U1puM010NFRt?=
 =?utf-8?B?WFpISGFPOTFMN1FSL1paLzVZMU50dVFjTDRtTUJhcW0wQlJ1L3ZUZmRORE9q?=
 =?utf-8?B?RzVDWFJXVm1OcFJXcGdxOTM4U0pTZHZoLyt5dWQ4c1J2bU1QWXhMTitjTjFn?=
 =?utf-8?B?VGZ4aXh4c082V2F0eHN4MW5tTDl4RkJNZE4xNmtwVVVSOW55NVhzWjZ3K1RP?=
 =?utf-8?B?eEdnUnhDR0xRVzJ4NnM0R2wxN0c0T3I2OGpJTmpIZ0VQejV4MVhzR2hCZnU5?=
 =?utf-8?B?Q0xZUGJKcGs5bTgvZDRlOWhtcnNEa3YwUWpUZG5XdlNIQ09VZ3hNS3RBS1Ux?=
 =?utf-8?B?emFKWjV1My9uRlZLZFBaTG9GbFl0SS9VU0lDVk5HWmFPcDJuaE9ZQjdRK09i?=
 =?utf-8?B?TS9ZZ0NnKy9UWDBTWHlQSUVIVFZXQ3ZqYnU4QmI5THRvU1IvM2IvUVVLZ05L?=
 =?utf-8?B?bFJubFhEaUtMVk9iSk0xWk9ZY0NNaU9zcjRFR0NMeVBzS1pCWWhhcE56bDVB?=
 =?utf-8?B?TVFma0dONEFFb1gvUHI3RWVINnBZWWt4blRCTEpmdjYvRklNVHcrMDRjQmpj?=
 =?utf-8?B?c3JVbmdQbTVteXZFMkpCM0J0THZ6UXNtVVl3K1V0N2NGeXNTMktuaktCM3N5?=
 =?utf-8?B?TzUwSUlacTVlYVFMUythZGpydFcrZnpCTHlVSGpSWDhvQkxnRER2WHp3WVIx?=
 =?utf-8?B?QjJEQW9sS1NFK3dhcFVZZDZMMFdYTXAxamxDSjVyQnZwemtDbWw1MFZZRFVV?=
 =?utf-8?B?Rk81bG9hdk05aDY0WTJPbU4ydmVudkZoWGZrdVpOTGNIS1owWkNCdjB5aHA0?=
 =?utf-8?B?a2ZGemhJb1c1U0FkWkhJbkg5R01EZ2xzSUc3UmV5QkhwQlVWWmFHWDBsRTlS?=
 =?utf-8?B?MytReDArMGM2L2R1QnJpQko5UTMvRkcyQXFuMzFOQ29WMDBGMVFrYUtsbmVW?=
 =?utf-8?B?cTZ1KzRVcFhQMW04eFFLU2NwV1hqZnlOeDdZNWNtUWdqNE1TaU0rZk8wZWJR?=
 =?utf-8?B?Z3ZoUDVuZ0pndzQ2TFllVkxHYVpDMXF2SmRDNVpUQU1XREFxc0ZTeTB3VjFp?=
 =?utf-8?B?VFFjYit0WkR3Z2EvektMK1RPN3JZaUtob294VzVMRmUycWtBZ3d4djNINXh2?=
 =?utf-8?B?RUt5L2kxY1hSQTRZb1FsVHp3VDdESUhqcVdEOGFxWWRjamtuNnllY1dmVDY1?=
 =?utf-8?B?RlZXOURDZTJVNTQ0aUMzQTJ0Z1oyRXlLVjlDVkZZSC8wZGRqRkdPbHBleW1t?=
 =?utf-8?B?RjhTMnNoam5sdHhwRnFjMGRzd1dQaThlUGQyWUlqaWJrNm1GR1ZRelkrcFZW?=
 =?utf-8?B?T1ExemxLNSs2bWl0NFpyak14dll4b1I0a2p1SEh1NmRORU8zK042ckpla1NK?=
 =?utf-8?B?SnRnV0I0U0NBeEwvS3Bad1UySCthOFFvS2RIWmxMODUrbWVXNDA2MHkvRWNx?=
 =?utf-8?B?U3hjb0didTJLclpNaXV1Z3ZiQld0NWVzRnY2T21HZzJqdGJyb1R0eUdXcU96?=
 =?utf-8?B?QjlYenQ5R1JQTUp6bDM2cTJCTnVYRWhOekxFVjZqNFg5MUFXRHFmNVNMNXY1?=
 =?utf-8?B?ejRJRFp4SVBMa1RuZG5PZmhKdG10Ry9UK01Tb1BoQS9KbmIwaGZJWDRaTVJp?=
 =?utf-8?B?VkJOQTF0V1NLZnFpR1RXM2lsTlhTQm1vVGhEZW8wSW5MUXY2SjhkNGxwQng0?=
 =?utf-8?B?TjZSUjdRQm9HbWQ5anZ1ck5uSzBMeUlUSkhCVDlsMjFmNmpvcnJ4bzFXRGdm?=
 =?utf-8?B?a0dmWUJrdVF5dEttUlRSNlZBUFdaUzY4V092NEF3cTBsWUlGQ1VOekdVTFZC?=
 =?utf-8?B?UThTRVB2eUNiY3RhcGF3NEZNYkIvTFJJMjNpMUlQLzJzRC9yM3c0eFMrc3lW?=
 =?utf-8?B?RHNXWmNiTWZDNEJrbXROVllhL2E5RmFsMTJ6T3p4b1dYTG1wOTI0SXJoaWl2?=
 =?utf-8?B?MktSSEw5amRoaG5BS0M2cDhTeWNYZURydWt4SUtvOGtJV2Q0MzhlZUR3MklQ?=
 =?utf-8?B?bVEwOFpuN1NQU3BjdGE4Q25DeXlVQzhOaExDaUtGMVdjQUx5Wkc5aWJxaXRU?=
 =?utf-8?B?M0tLQ1BrcjhsUEk4a21xdzBQd0toNVpMdEN1YS8yblYwYmpyeCs1MGhZTnhY?=
 =?utf-8?B?bjBmMmtLT29vN0t6N3FyeEdUT0lUR0tjdHpETE5HQUcwNzV6UkFrc1JxNlJs?=
 =?utf-8?B?MThWYzFjcllhUUo5MFo4bk81WGZCaFU4Q3ZiSXo5MFlpNWxDdkljQnhwbzEy?=
 =?utf-8?B?aWJjNTdoZkp0WXZvRm1xa0FENzVYdHFoSW80NXkrRW10Q2lYMmxGSnBDT0JD?=
 =?utf-8?B?aHFxWVdtODF1YzVlbVA1VWUzNkhaSUZ2UkkrMTd3ZHhjUXFIT1hYbVJ5aTNy?=
 =?utf-8?Q?uU0YxOC5v2QA1lmY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a471877f-a07e-422d-256a-08de5d20f86f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 21:22:12.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGCStbjdBJlnosm3yJaeABovqqhHAdESJKPbtrfdCJ9XgSazblg8esY3OjdIeUZO3g9z/pJOU71eOkzj5KV6VOASxvnRWQUxBFaZP92yJB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8937
X-OriginatorOrg: intel.com

Chao Gao wrote:
[..]
> I think this conservative approach is appropriate for initial support. New
> features can be gradually enabled later as we prove that other components
> (e.g., KVM) are ready for new features introduced via runtime updates.

New features over updates, and revised software contracts (broken
contracts) over updates are not "compatible updates". So it is not a
"conservative approach" to start, it is more a hard barrier that updates
of that nature are out-of-scope via this interface. The Documentation
needs to be clear that the problems caused by update are the Module's
problems, not new kernel problems.

If you look at other platform mutating update mechanisms like ACPI
runtime update and CXL runtime update, the class of updates that expose
new features / contracts require reset. TDX is not special in this
regard.
