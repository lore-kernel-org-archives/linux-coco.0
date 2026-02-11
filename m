Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0952FCC04
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 20:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770842946; cv=fail; b=TZWIe+JRwSFZe985xvX8wcKxkWJmWcTLg1gSfrPTdQt0SAZdG/ZLLdm32AqWtiIDBwpnMKlMFOqPlBUXKAPM0fTGpdCEMsNJn7HES3d1Kw0o9XBsMMqmaNsQtp1HB8EQoIiwat8qnW2+v+sdAgRaRxLMuPNt7BdyI4g7pTRtmjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770842946; c=relaxed/simple;
	bh=6FsSxwbnsMJ9e1N3Llao7itTriYeQZbbIXu1Faozxw8=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=iu+lI1zmkjr7SfCmj1kg5TFCuftvbaZR9tKpNxAU3kjeKmKcKhd20lCIHtgNEDqSKOxcRZmkCGYFEn64ldOkWUOsCpZFMQ1V1srkFRRlvfMLMwGkccFN9YAQJGwVRMA9oy/fGrEedfTMMetzxcSHyxwOx2ETdj70tcxYHXoqcpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMs8n9cF; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMs8n9cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770842943; x=1802378943;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=6FsSxwbnsMJ9e1N3Llao7itTriYeQZbbIXu1Faozxw8=;
  b=gMs8n9cFwGZVORxKcXPc4OnmwY+UcJRPNSgB+zmxRYA74VE+FT12jStE
   KUqoeURNUz2VaGFePu2QINZZJhHl1ndxLIUeBYhdEpmPVlQyVCoj38Nm0
   6sWlGYHo7TbNQ/SzaNTHohOqgomu7uDNMRW6HYqxJR1opUp72qRrhg3OO
   qNDxJKoKhSdnYf6HJYAzH1YW9AWLQvRR2REFdpTkjWzSrRFgmMExE21kC
   jBLNjhnvIwzJhrb3HBRr0ZveNcz0ou/L5Z5yhQEPteM9ujCVyTfxx3h84
   1Tgxt5N79k/Uwszhnr8rZ5xMMKLjIqLvHKwa0Ar8zuUhaippZFgNg38MD
   g==;
X-CSE-ConnectionGUID: K9BKk55MQBSBUMd6AMdUQw==
X-CSE-MsgGUID: Lrehcp0sTjSC4amdE86dIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="97459948"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="97459948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 12:49:03 -0800
X-CSE-ConnectionGUID: 20K4/1s9TAmaC2y7M9iysw==
X-CSE-MsgGUID: xmC38sMIRfSItGy12GCx0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="235346811"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 12:49:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 12:49:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 12:49:02 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 12:49:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvLAMDhcrOXSLgHkRbf0t9xivg9X/3fWeZBQEM103+zZ9DKzqRC+VE+vr1g3dsLPIeCtZsS6t1LTRYXFnTC+E/cohLb9Zww8wulhZYvgY00JARVUaGzJyaG7Xw/bnEaomDQOLTg7Q/ZwvvetppbTgAh8mlDxR1tlfGbHTB9HL5OtsFrv9EzgokW1H2bIxlge3IH2XZidanHP6bS9tlNqPkyIUBc0zONqEVt5lnK7t7TpxBweIaypZugLqWIEWEVHjqOzq4r9D8NNAXa3KlIJHwNcShbPK6kqV0NMoDjuA6BICZXWTGtlKmRlKNWzW8pQdawMYpYb6gOzaY7fu20YKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4L/xi8kjhWZXG9GXYRVBlZtmYRv0h31QBSTlxbmhGwk=;
 b=JaZxci1QfzeateObElq10v56MZcnHzXAabURiw0KDxMyF514J5u/F4bQu2G8xyudqZQ1N58CZACbGUDJzAlQo/rpc/eMNM9UxsCvqZ3tSZOzz2lOBr0x4bsUzLIeo172SLhK6rPOrs6C6Doff/aGbHaYSTbzwtU+SrGrllgFyocVws3PT1oP88DYUAM5nRO5lQJExKrYAM3SHYbWwvPiBVnzOLiKlsZwirJ1YNGKUgutS1Uu1keL+5JV3ypD0/YTajM/fkvjei77m+ivecXtY91oSG9u43ii/QfJbwagCD6wbsvN9RplLdP6c4zHIebt3BzOeAb0/OPh+oAnK1DGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 20:49:00 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 20:49:00 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 11 Feb 2026 12:48:59 -0800
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<dan.j.williams@intel.com>, "Kirill A . Shutemov" <kas@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Message-ID: <698ceb3b9b35_8c3210068@dwillia2-mobl4.notmuch>
In-Reply-To: <163b74e8-eede-4872-9319-047db25c0050@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <698be62f7802_8c32100e2@dwillia2-mobl4.notmuch>
 <163b74e8-eede-4872-9319-047db25c0050@linux.intel.com>
Subject: Re: [PATCH v1 1/3] virt: tsm: Document size limits for outblob
 attributes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef24e14-58d7-4ead-ccee-08de69aefbff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDRRTjVOeFVQSUU0NXFoRDRzNEcxYTljZUtzTTZUbExJRThzQzBvaU5ZcGZU?=
 =?utf-8?B?ekV4K3RPMithVjg5enB3dXBFSUtDaGFPRWJRaFZiUjk2ZFJ4N29Bd0QvMHJM?=
 =?utf-8?B?emNYNWVxZm9hL01lVmpobzlJM1lwYmxSdFlFRjFVaEhWYmVTcHZhVXkrdEtV?=
 =?utf-8?B?eWR5OHN5Uk5maUNGUmRJNlRUeU1KK3RIZnkzbXhhMEhQQ1lFQWRXckNhVzdo?=
 =?utf-8?B?QmRuT01xclRuNjZwSnhHTmVSUHVOOGdQYWxXMFVIaStweFZCOVEwWUFzZk1R?=
 =?utf-8?B?TDZYb2N1R2txejYwNW5pcWYvMGlSYjhocVVrMDBqRkV1YlZhUTBwc2krMjZ2?=
 =?utf-8?B?OU5ZdjRyV3lyREZROVpoRnNDM3pWaGlrZmRyT3ozRmZJelpDTHdJNnFNYmo0?=
 =?utf-8?B?OW9tYnNrOXBNREozSFhsR2dJYlNPM1U1OUhPUVdZakpEbng0d2lIdTVhblRk?=
 =?utf-8?B?TjcyUHBrTzdQREhKTGNGdlpQbUs0S1ZpQmtMODRGWTB3MWZyckdqSnBnM2Zj?=
 =?utf-8?B?dFVUUHFNSWNraXdQaTlaVXpZLzNFY0oyU05Wak13a0FNc2JMYWJUSHFkMmtp?=
 =?utf-8?B?aXpKNzlkc1JKSWhQK2NhYnFmVHczZUY3ZmlLMlZkREk0NkJaNWZoQlQ1U0x0?=
 =?utf-8?B?ZElGM2xUVGl4bHRGbFpFb1Baekc5T3hvaUcwOHNiRzlQVVlkMHZ3QWovUFdt?=
 =?utf-8?B?VFEvSkpWWnA4YTZjU0RncHpPd0tUYW5tS0x3azVzOFJhMnVlczRscG5FcFR0?=
 =?utf-8?B?WFY5ZGRqdGphaEZrNkhuWmtneExxYXp1NFRZZXgwaGtUc3A1RnRQN3dncjRY?=
 =?utf-8?B?YTM4TnNQVTNxRWJ4SThFbk8xeHo4YjMrRmNBS2hUNEI1RlRFWmIvbERSRDBU?=
 =?utf-8?B?R2NRdExKeVlXQnBCZTNObzV0cGc1clNQMnR2OWJVSHdPOTZVU3g5ZFhVd09s?=
 =?utf-8?B?TW03eHZUYUY4TXYwOWQvcDhJSVNEZHhGRUtOS1NKNDBFNnB4UlU3d3A3K2dM?=
 =?utf-8?B?K0RFNGgwb0V6VEU1cHBROXNDRmRGYWh3QmRDQmhydk9ETmJUdi9xMW5nVzZY?=
 =?utf-8?B?Q0hFQlZyQzJTSG54UXRIaXBmWGtXTkUvbGd1Y0dtc2l3RUtjS1V2OTlIb3dt?=
 =?utf-8?B?V3dOUjRFK0U1cDFzc0lNam15ZmZqNm9IVHp5d3Z5N2pMbWQ5cTJONzhKQjdG?=
 =?utf-8?B?a2tLK1pqVEp5Z3d2YW1rT1VLOWwySC9Kd2NHTWM0M250ZVErdmQ0cXFKZGQ1?=
 =?utf-8?B?R001NEU2RE1hTHJ1ZFc2ajJFbTduMGhlc1ZkTnVNRXVDcTMvb3BzL1VSRTc5?=
 =?utf-8?B?T05kdjJWL2l3QmRGaU51TEdwcWZSdUYzK3VBZ2NmRnhLNWZqNXVTWmM4cVFn?=
 =?utf-8?B?bm84bkN5dm5uZmp5eW5hV2pkVldkVUFpQ0ZJcEZBQTJHTzdIZlhPTDVWWnR6?=
 =?utf-8?B?VzNZaTRuWnZNS2dCOFhCVEJQeWlOb3JNUWxjOG9VNUUvSlFRU1ZFZWt6enpK?=
 =?utf-8?B?c2FXQUJHOFVNUCsyTjd1UTZmNFhGYVArZndlN2lwOURXRkFxaVF6U0dzQi9G?=
 =?utf-8?B?NGUwZWhyYTNuMWF0UWNyOUhqdmcxMWRTRzhJbml2dDIrcnoxeE5ZMFU2MjNN?=
 =?utf-8?B?YjFOdSt3b2ZRU25Xd05YOHM3dmFrYWxScVM2Q3VKeUYyK1cxVTVIeDV4bkhM?=
 =?utf-8?B?STRTWDhDS0hrYUV4a2hqUGhiNXdXcm5hdzdQMVRNSXZnYmw1UWFkbVFLN2Q3?=
 =?utf-8?B?WDBWQmNLclBoMXRyVUhYTWw4Vk54U2pBdE1vSEN3dVMvQ3lVNDhIWE8yVzlQ?=
 =?utf-8?B?YlJjTHRoNlBkMThNdkh4bUNybXNXT2UzZnBULzRiUGx2OGMyR09CcHY1NHFI?=
 =?utf-8?B?eXdHYzV5L0cyUFdnQjBZa2Q5allCMjIyeGxvNnVPUTZzRnNIdzVsNXZ0U2Mw?=
 =?utf-8?B?WkVZV3YvUGorZkpqL25uTWVKa1RRYWFkSEdDRE9LSHVadko2MFZrb2VwOUYv?=
 =?utf-8?B?aWsrMU84RXNNZTJQZUQwemlsT0FxZkgwZ1ZoSEpnZC9jUEZjd3JJZ2o1VUIw?=
 =?utf-8?Q?Mu2I5o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVpMeWdlZHlxc0NxMkFNeHZ2UHgrUmJrd1cwbU5TZktrQnRuVm1yK0w0Z2x5?=
 =?utf-8?B?Q0hKcGJZU2hQd3ZoRFhCRVhvZndsMStZUEhrYU5hZ2RNZjNkL2dRZUdudytv?=
 =?utf-8?B?Zk1ZdTNkVzRFWFdDTktiaVM2cElMUzk0cnlZUFBqN1owd2F6NGl0S2tma3Nn?=
 =?utf-8?B?MFV5a3pWbm9qS3AwUU9qR0svdGZqRDNkcmZoY0pUbEgzeEdZcWFXbWVGUjk0?=
 =?utf-8?B?Njl2M3U3cXZBSGhCVVBIWkRIb2FTOUlYN2xCUkltTFBwK3lmSGxvdWRveGR4?=
 =?utf-8?B?SEJuSWlQV3J1cVlDV1hUenRNcjQxaVV6MWVzUGdZaWx6VENFenQ0QjJ5eDN5?=
 =?utf-8?B?OUgrdnhGY0J4WHN3U0toTDVNNk1KbGZVTGhuR1BOM1Nrb2MvSWE0YWtSVnBC?=
 =?utf-8?B?a1RKcjdNWnROSE0xb09HS0RKd1ltZkZmMW1IVVZhV2o1TjRrWWZKU1F4Z1RN?=
 =?utf-8?B?SmNJQ2o5cW9SMWRYUG5IODg1ZzRIZmlQTndKY1h1eHJ6aHJIQXp4R25xSElk?=
 =?utf-8?B?QkRObk9WRWxSTC9qc3UydlBjUXFVbWZ4ak9BcmhuN1FWNGIrdVVFZ0dkK1Zm?=
 =?utf-8?B?QTF3Rmt5d1hwaGEwUUZhQVV0Y2c5SmhGbVhpRUNKaU14ZUdxSk1kdVhyREtU?=
 =?utf-8?B?RUVTcEhWNUxUVnArYlhEekt3VXVtSFFKa1RreUZGWk9qWnNkZGJKc0pjenls?=
 =?utf-8?B?UjE1Y1BzY3h1OFlvV3dpdUpLeGRRc1pmT1hlb0Y3dFBLelVyZWxDL2dGZ0kz?=
 =?utf-8?B?ZXEvbmxKemtEZmtWRXZyNFRaZXVTd252aVEvbkdXZXdMZWUxMjBqRFVSMWYw?=
 =?utf-8?B?MGRtUW1oYkVzdVVmbDNqQm9DQXZscmZ0ZzhTUWlscUNzUkNkeGkvZ21Ra0Uy?=
 =?utf-8?B?ek9QVCtnWGFIOXlpV25SbzRRR0ljRWZPL1hrSyt3UmlWcXdPRkNHWVcwdFRh?=
 =?utf-8?B?WEw5OEsrbUJ5cEF2b2pIKzRhWlhNdk5qSGwwT2d3cHFHU0txbkljRXZ5M1hU?=
 =?utf-8?B?N24yOHNqN3d3SzFkY2VYb2JrbE1zaEhNRFlZY0VVMWppZHI1cHZtQnMrWGNH?=
 =?utf-8?B?NmVVQWhWQ2tTd3l3d1NmcFdZYVdaV0lpdmNqS3RjNmdKTENnMTkrZHI4Mlhk?=
 =?utf-8?B?R3lVRUtZM01vYXRnSGxhQ1BwWVlEWi9zLzIzVTZwaUdZNWpRS0lWUk9Ed3E3?=
 =?utf-8?B?aVlFVloyRys4Ly8vQmJwMVRvWXNKSTNVaFNtZUIrSnVndVJQc2F4aVhGSnBT?=
 =?utf-8?B?UzJvOWVOTS9rZzdROHFrMXdTeUYvUXNzVEpCdytDcE1ac2FkL3JEY2FEM3Jy?=
 =?utf-8?B?OVdpUmhMVmZZb3Fyc3FmZ0Nxa1NwZXl5YWN2c0xuV2d0WkNPUG1MSGprQkZa?=
 =?utf-8?B?TGwybEJvUTQ4OFpObXUycnIyZmdlRWRqZkJEa0VlTmp2ampsU1FlSnpnc2E0?=
 =?utf-8?B?aG4yV1pWakhBeXdnbHhEcURNeVI1YTNYVE01Z0g1TWVxUDNoczIrUVpBcjh2?=
 =?utf-8?B?SWJTYlp2SGJhQVM2b1Q0Y1FlK1JyeTRiTXNyU1VYdjdsekFwL1BVamRMU0ZR?=
 =?utf-8?B?OHAxM2RJZ1FIdFIybWJqNkJtM242eHc2bENZbHpDVnRmcmRJd252YkYrc1ht?=
 =?utf-8?B?NWErOWdLU3lZYThEQmlpNmZRNEhpS2d2a1FRY3hUY09yc3B1UzJqUWMwbWpz?=
 =?utf-8?B?b1RvS0JGaGRJT0xxd25ZRnZXc1g1cmhoTDhQODExMG01K2Y2MVU4cHlqS0ZH?=
 =?utf-8?B?Q2FKak1jaytjSFc4cjZCbWZYeVR6d0hrb1EwRHM2WUpCSUEwbjJMVFh1U2Iy?=
 =?utf-8?B?S0pZZFU5VEJTSE0ydVBuRnJ2OVhrdFpadkxRL0R2b3hRUWZqQmVRa2N0K3da?=
 =?utf-8?B?ZTl4MjNQdUJ3ak4rVnNhSnNPY2dralRqMzJSSmE3ZzEwd3R1RzREWWlrK0d0?=
 =?utf-8?B?NlBQcDBQbVprWjNzYjRCVFNLMTFuOTBpRGxhek9SODhrb0NjSU5KSUlLTEk4?=
 =?utf-8?B?M091SU8rc1B4R3Y5WXdIUzlPbE9CVjlONkcraVI5UGhoS2lWSXVrSzh1TTVG?=
 =?utf-8?B?T0FwT2h3VDYvRGRYMzRvTjV4UlJtQzBZWVI0OHhUcjVSVGJSTUpUeHNlWWZ4?=
 =?utf-8?B?TmUyWlNvWmM1NUtKU2lnckNiTitWZXBqM1BZaVhqcCttVTdmQUlXKzEzSEk1?=
 =?utf-8?B?aHU3UmEzR1kwODNsVTZIa0hUb0I4ZmFRTUgzRGxzUHA1UjEyMWhqS2dqbkpn?=
 =?utf-8?B?dVBDRjRHa0JHWTZFUURSQ0pKWXRycGx4QTVsV2VlY3ZxY3I5SysvWTVjMHlJ?=
 =?utf-8?B?T2k1VVFLdnNxKzZVMytpbzFqbk9YMEVZZUZrNWJzSGtHUmNneWhyNkhCUS9Y?=
 =?utf-8?Q?DSjCKEEuS9N4KsJQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef24e14-58d7-4ead-ccee-08de69aefbff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:49:00.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: po3G3RpTCCACm96IbxJi6AZIJ+aaJ+giQ3TQuyXV2zrgEwamdO2Sp1413imj1xcL92DnDdbcYJIMHb9Ug9bmOBB96MBvu8mzBDmuZiTwZ+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> Hi Dan,
> 
> On 2/10/2026 6:15 PM, dan.j.williams@intel.com wrote:
> > Kuppuswamy Sathyanarayanan wrote:
> >> The configfs-tsm-report interface can fail with -EFBIG when the
> >> attestation report generated by a TSM provider exceeds internal
> >> maximums (TSM_REPORT_OUTBLOB_MAX). However, this error condition and
> >> its handling are not currently documented in the ABI.
> >>
> >> Userspace tools need to understand how to interpret various error
> >> conditions when reading attestation reports.
> >>
> >> Document that reads fail with -EFBIG when reports exceed size limits,
> >> with guidance on how to resolve them.
> >>
> >> Reviewed-by: Fang Peter <peter.fang@intel.com>
> >> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> > 
> > Looks good, I will change the subject to:
> > 
> > "configfs-tsm-report: Document size limits for outblob attributes"
> 
> 
> Thanks for the review! Are you planning to apply this with the updated
> subject line, or would you like me to send a v2 with the change?

Given the late date I went ahead and made the change and pushed it out
to start soaking in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git/log/?h=next
