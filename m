Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31F378D69
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374836; cv=fail; b=KWu8+w/bymezFtRy+m3qemxvxtziGuMZit6mWF8lhNqFBehnT2jH9FoAhZmBGScoIRyCL0n++RKFt/TwSjDtLAB1NJi63YuiyaSTyI4YBAMZaaFibVMyE5fMoEHwwMcQaXwy7QR79lMf0kD6bCsEVyI69gPsJbID5EhaIo9P7Ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374836; c=relaxed/simple;
	bh=fG2gHuC1NMFGTS+Tr7ci+sxTW5BLmFtmM1NJUoRv9dU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=reoYvYy6RHnRreeQptAZ4yAcI11PLW9flW7+0gMNX38vr6XGxRC4PPqyR6DyKR5GwUkGM2q0XiFjNwf10rQJ2kGb3++ZZwa/LxNwJMWoER7AN0OInXzV5szKLYmpeKT6JJrkP9NQQsHUco4m0OilsZmLqADDDrq40eA8kP4GriY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDXXJ7Dr; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDXXJ7Dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374828; x=1799910828;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fG2gHuC1NMFGTS+Tr7ci+sxTW5BLmFtmM1NJUoRv9dU=;
  b=FDXXJ7DrHbmvpx+N920Fy8kjXA9ouuZx4oehOyHRCDNSbppTN5W8eMFP
   bjs/D2I1jWVSzyyEv+LbOv44iz759vPdWYS7pIeAFUuB8rJ0HhxsIGRpK
   FofXjzCPN6bEdXfxEs7d3LIm2E1LhM+xlcz+N3HkvrgF/b9ydfDIZYQsP
   i62d3maLdMOOLGRpfcNNtBoP0oyxQJebVZDt3jwnfqEds2lSy7bnFk6Q4
   oYxpV/CgcOsiFJKYacjjGaSSfz8S6Rdo3WWqoIQ2quipU3jJRS20RvGDe
   aaJJHT0JJawhe6jA1zv8yBTf839EoN54IUG5+BkwJyTdw0kH9lRujwza0
   w==;
X-CSE-ConnectionGUID: 9r5LIBYLRvq4KJN6LNzu/A==
X-CSE-MsgGUID: /Gq8ZYFgQDSrQVBWTNtwXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69752954"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69752954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:13:44 -0800
X-CSE-ConnectionGUID: 3DkgvljTR+mV4o1voTEunA==
X-CSE-MsgGUID: NWUKc2CCQRWHIDBw0XGELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205160933"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:13:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:13:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:13:44 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:13:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti8zxwmk1RASKuM0AhRhUWGTtfYXUG+U/Ptr6rxMlzMhQTq+kdiXa2SiCOiNJzjY5ZI7j95Cn9WMg5y1XyyDkshe2Y1t54bxpLUMrhAJIGErxR1q8BFTGh6u4nc3JisrJlGivu/xK2RiitwzlPQ7wKr1T04vLrRnFjyYl4Ze6peT6OSbwklDwD5MD2SqhXloGhlUjC6yLLVmWBE3dRcNXucd09/NF+vjJEzDO4MTHBC+W+ouCYRdLw7BUu4EcOmvzeyyhMWop08QL+qYeAtl5T1LmsppgRHBUglAfEpKFGWZBZpT/uzGOZanEEE/AMf4/0JRyaiqmvgLQRWABxD3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHt9PB583UPc9BqP0BS/Nih2rT/IuoxRDAi4mqaYMG8=;
 b=l3eHL90wOzB8aJq8mSX9pMLh/A+yKk4TT0j5pi5bwuBXtp7nWxFXENtTqediOZ5grQUuI59fHQIqPaQIAbIiKjTmUAc10UHqqAkKkwAx7mcy1eZABYaPc1JAtlmtds41TjLfPbV84uO4Ko7YOeWyEqKxXMKD+rtDGEy8tWz5f1C2KgJnk3KZTn4FsfEGThaNetd6C6C6SKoktu+77onYAXKHJ8t+fy2XMFme1roahuPx1F2b/HXQVssxwN3SjdYfsIIVxcKMNbr6bNSO/rXPMMZTlnO06ymJNyIXF+rKJNaVxfahLn2OlDRLpYblyZTojuGlp90wSjmAXn9G60Vq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 07:13:35 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:13:35 +0000
Message-ID: <f125843d-bcbf-417b-b7ba-4dc125c1669d@intel.com>
Date: Wed, 14 Jan 2026 15:13:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] x86/virt/tdx: Print SEAMCALL leaf numbers in
 decimal
To: Chao Gao <chao.gao@intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <yilun.xu@linux.intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>
CC: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-2-chao.gao@intel.com>
Content-Language: en-US
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
In-Reply-To: <20251001025442.427697-2-chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0050.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::12) To IA3PR11MB9136.namprd11.prod.outlook.com
 (2603:10b6:208:574::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9136:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee74ef0-8e6a-47b3-a5cb-08de533c6e92
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWhCNWx2MVBTSUVVOCtOLzlqZlg3RmFBYmhBT0N1OHR6R0Y4SVJuOWxzeG40?=
 =?utf-8?B?SGFUbGZUOVpCd2JSQUNldzRDNExFM1B6K2drMkp6RHFISkFXcWhZNW9nVkcr?=
 =?utf-8?B?dkZnYzIvUkVEa1RPSHJ3ZittZE5SbmttZFVyNzExNEJVN0N2QTl1Wk1xVFFh?=
 =?utf-8?B?YjBEbGZwWGk3Yk9UbnpDdG5PSFF5NUZSNmp1SnFDNHFzNE5ESkpTNlVQQWFR?=
 =?utf-8?B?eTNBaUVKbWc3Mi9PZW1OaDZmZjNiaGlLczV1bzNYMXE1VlpSRFdJTEpwVENY?=
 =?utf-8?B?M0htUHlIOXpSRDRNTHROc1NFMWdPbUFDOTNlVXpIdVp5U1djMm15aVl0VTRN?=
 =?utf-8?B?VlVzS3dla25ocGRRNWVZNEZ5QjExbWJTVm9vQTY0VDZQYXlRY2F5blI0M2U2?=
 =?utf-8?B?MFVEZ1NsTW5sc1RjcEpTNllNSDhrNkpzaksreEpBOEszYjZlaFFJa3RFbE1Q?=
 =?utf-8?B?NnhNenhYVTNzQ0RzYlVVc282Wkh3Rm5laDkwNjFGT0wxSkQ4eFh3VVJvbThH?=
 =?utf-8?B?NFAvVXd5MEh5eW1QWU5FM2VCd1pQMWYzQzhTK3doWmkyUTNsUGY4YzkyQTRz?=
 =?utf-8?B?bDZYSDN4VmQvM0EzZnBEbnQyaEhNVXJMaXRMbW1POGE1MnY0Rml1TStoR0hw?=
 =?utf-8?B?eU1MMms0QUY0ZGY5TEhYUkQya2U3clNzNGEwOWRidHhwWjdnNXNGTVFqaGJL?=
 =?utf-8?B?YkJQZ2d1Tm1oNEdMZk04bWRlYkpLWXR5WmJYcmt0NlFxQTlZZWFkVmpHUVBJ?=
 =?utf-8?B?SVgrUzg4Nmo3Z1VXOEFMbEJCT0huMGxvaUtNWFRSdnR0TGJOVUNsYmlCVWpq?=
 =?utf-8?B?RU16U21kSjUyTExMNGF3b2NvY29PcXhQWWZzR004dlhZd21nZER2SFlOTmZl?=
 =?utf-8?B?WkFTbmZoTk5lbjVydkZvYW84Wmh4dzdJYU1nd2haSFFGbXJrQ1V4bjJQOGNl?=
 =?utf-8?B?b2lvS3lnZ2IraVJ2N3RvcUVzbkZZLy9BSHZLQmw1L21PMEd5RFYxaVhqQ0sz?=
 =?utf-8?B?T3hERFZZdFpQTVhrazJIZ053UFhBNldzTEFVcmpEdDBESGEwdnZJcWpFaFpz?=
 =?utf-8?B?bVJRSUJZN05tS01uUWw5Qys0aU43dnhiU0ppTnJnVldvbmx0cW9pZ1laQ3ZY?=
 =?utf-8?B?K295WE1Wd3ZYM3ZoVTVST3hWekgyU0ZWOW8zTHd2cll0a2loZExDVTJFckJZ?=
 =?utf-8?B?SXNudmd6Ly90K0svSWVFQ3lyYzR2Sm9WR1JZMVRLSVhjeWRMUkw1VFpzR0FL?=
 =?utf-8?B?ZXlERmpvZ1hOYlVISVpJWE55dVB6eFVaMDd1MFF5Vm5DbHU3UHRKVkVZQU1n?=
 =?utf-8?B?WWw5SGl4MXNKcEdzckxGNWIwYTBENVYrVEZsVnNGSXB0TEtSSFptaHB6Sm5q?=
 =?utf-8?B?NzQzM3kyVFJMcnltOExoeG5KOG92Q0RvS1dPVGFnbG9PMnRWT3RkYmJ6d2w3?=
 =?utf-8?B?U1FnbzN3clJoTm04TVFYRjhDZXI0SE51aFRtd2FIT1o2dy9oWlc5cVJxczFQ?=
 =?utf-8?B?ODJDTDJZNW13bGFwTzJUcEQ3SXdvK3haVHJyN1RXdmg1QzZpS3VpREFVaXJR?=
 =?utf-8?B?aFRIK2ZuOXFGMHhRTDhzS05HS2k5bnB4NGxpMG1BL0d3N0lHSmUzaU9idUFW?=
 =?utf-8?B?R0I0Rm15cFU3dlZXSkpMVGVrSHAvVzcxRzMySXRHRkxnUTZOL1cwVDNuRkVX?=
 =?utf-8?B?NVpHSGs4Q053VGFudjVJMWFDY21qOXV4TnJ3ZWlha1lzcGw2a29ERkJ3SFk5?=
 =?utf-8?B?dXduUTFqNW11ODVhRFNBREMwNkw1VTA5eFI3V3FTVjBuYTYwcFN1UUk5Rm1w?=
 =?utf-8?B?NlpRUk0vK3dKUmRrSHdETDhvbkExL2hXLzZwQ2h0RHVXUUZoUSsxK096N2dG?=
 =?utf-8?B?ZDBySSszTXBZRlZKbktGejFrQkFvM0s5bzgrWFl5MkxCZFV5U1I2VThrZmEx?=
 =?utf-8?B?RlFSNEk1VFgxZnpYdHovRFlEeE80SVVYRVhpNUFoTWIwQy9IaTE4Vy93dXBZ?=
 =?utf-8?Q?PaQcC2YPFGZ7OKL92iE4Lwe/5gFUyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG4yRHkwbk9GbmR3ODcrN1dMQzRZTlh6Z3gwV3BhZ0JJTjZqYktkQTZxVVFx?=
 =?utf-8?B?aGcxRTFwZGZsbFVkakhYeVlLajVjYXhVeFJMRDFOaEFjOEU0M2k2a2JSVXI5?=
 =?utf-8?B?bm56dnhsZU16Y0tncDFsQVlvN2pvSWMyVUJzMG00aVpHWXplU1duM25hUHN1?=
 =?utf-8?B?QlYzYVB3TTVINm56S21Qc2hmVWJGWWw0YjJtMVpDWGZVU2VSc2d1RzNPcytI?=
 =?utf-8?B?N0V1MVZrU3NTTnJ6N0ZCMm5RK29KbDJlNVJjc21XWnduZVVTZVpZMytJS3Vn?=
 =?utf-8?B?THdtR2lua0lxL0liSEVQdTZPYWtkY3dwSm96KzBObkxBODU5WXFTcHJYUDls?=
 =?utf-8?B?RDM4NWxzMDlCcFBHakJFUmdhRU94bCs3N1ZUNCtlMGg3T0lMaEF2ZEpJcnBm?=
 =?utf-8?B?NVp3VERheFc5TUhsSjZiclAyOUJVQ1hraXVwVHZ0c3NsaE00QTg2MlhyZzlh?=
 =?utf-8?B?YWVBeERZUnZpRlJnMzIyYnBteVZDcUZtbytndEFxdXFJVFI3WVhTTkU2UEZp?=
 =?utf-8?B?Z3hSdjNxTU1uZVExSDc1MEQ4Uy9FWUxTb2t4ekFzUzNoVyt1Mm9oU1J0M1Zq?=
 =?utf-8?B?Mld5QzV0a0sybkphdmRMdnpNdERoRi95ZjJMRWJiR3JTcm9yaVkvNXlSSnpu?=
 =?utf-8?B?ZmJPYzFnR3kxR2FrWWJ0YjZuZll3ZkthYURveEVPcDdJSUVLNTRVZ3cxK2NJ?=
 =?utf-8?B?aGRDWjNGamRHWlBONzVJSnl5d0tNUWoyOElYMHcxMFA2UXFxcjMrVkw5TDYw?=
 =?utf-8?B?MXBrVWMzeHFlcVMyU2VyZFFHelQwd0d1NDZpbEV2WGwyNmw0N3ZET1pyNHdj?=
 =?utf-8?B?bGJsQUtpZXI3ZFRGMVhoUUpIbEF0bW9CR1pUNVo4dHRGWitwZlJlNjVOR2Vi?=
 =?utf-8?B?YmRnV0RoWSs2QVdsbVdaeUdVb2ZydjI1eExsSmFBNFA5NUFmNzEyWmd0T1N0?=
 =?utf-8?B?SmdTT0MvMTd3T1dGMHlhQmxSM3VLaFFNdXJOOW5rbk5iT1o4VzJ3RFF6UENJ?=
 =?utf-8?B?WTdRNm5hT0dDQ3MrQkw4SS93ZDUzaXBhSE9iWE93UDNEaUtxVHVCMzdVb3pD?=
 =?utf-8?B?eExwTGJZNzN3YWJ3dDlXbVU1bGZ6cjhKdHFxbnd4YnFDaFlvV0pzc3RMUi8r?=
 =?utf-8?B?U05GbkRGVWExUjB2azBUUWlMNDhDaTBUdXVXTHE0a3FNU3dKUFdQRDRQakZs?=
 =?utf-8?B?UElMTGdsK0VVUHJjYUxsNU1hYmxIb3BZQ1BiUjQxV3JwRU1CRWxSS3ZuL3pk?=
 =?utf-8?B?aWordnd4cStXVEFCc3ZrY09jRWdmQ25LbWdsU1hWYlB1dEZiMGVneHB4UTFl?=
 =?utf-8?B?VjRvNkNSUUt5aVJmTVBnWll5d0pmY2lsWHdOMG9GVW95VWhSTEFKWlB5RE0w?=
 =?utf-8?B?a1JZSzRHVG5FakxGSHAwdURNWkZKSGc0d25DN3JTTVVBc0NqOFd2NG5NNDFz?=
 =?utf-8?B?M3JrTXNYeWxGMk5mNnhlUUhQLzgrZ1l2WTcvK3hINEM0SVJOT0IxR2RaZnBq?=
 =?utf-8?B?d25jOFU4ZHBtNWF5eGJUOXlSN1dOSWxQQkFYcW1xUFY5cnlQVDh0RUhQcmpv?=
 =?utf-8?B?VUJmYk1mWkVtWG14RGV2QzM0LzlJUjExSXIxNng0ME96VzIwMTJJTnhCRzIr?=
 =?utf-8?B?SUZMWWNNYVJRUUMzVUdyK2RNdnR4QUs0UWs5WktFU3Y1UkJPRnkvei9OcUJo?=
 =?utf-8?B?SVZzcG12YUU4N3p6dmV5b0pONnI3ZWlydnUxMXJjcno4S01pSzByTXdaL0Rt?=
 =?utf-8?B?OUoxU1ErbXkwTUY3cnZXR0owUVdieW9hTnhMUVIxMzNtdlNNNDRuNXlXVS9t?=
 =?utf-8?B?QUVDY0RnN2oybjhuVnp0SHBPM21iek9qVFBncGJFS24vWW9CTmt6R2tVRXhX?=
 =?utf-8?B?dmhBY3BHWDNBeVZrWVNVT2NNWmJWbUZiMTF5QnZWcERieHZveXVrOWpDYXUx?=
 =?utf-8?B?RWNlVnZ6cmJEWlcyWUYrNVN5WnZicE1rcW51Q2s4TDFYTllOZ1AxQ2JGOGdl?=
 =?utf-8?B?WEMyUGlBT3VaYmNZTXBwQ1VHK2Fkc3dhVXI0M3UwVlJPSWFrMWpJNndxaTNT?=
 =?utf-8?B?TDlaRUVPL1p3ZXpyb3RrZm5kQ1Y5aXJKZEtsVEZhYVpFbURkUzFaZHluY2xP?=
 =?utf-8?B?aFZ2aCtNVGRvRENlVWVPQjlVdVV5M0pudWFEeVJSSFJ2Unl1VVV2b3FSNzlX?=
 =?utf-8?B?ZUVlOGg5d2hVT3pFb2g3aGlia0dJQjRHNVhDdWFBUEg1aG0zZDNnK0gvdHdo?=
 =?utf-8?B?ditJUkxrcE5sUFU3b01sbDNPZ1NoMEZ1b1NHRGZ0MnhpQ0dBaUpkMmJMT1NE?=
 =?utf-8?B?a2g2M3l4YzVPTzFXZXFTcEhYQ2Exd0d0WjFSaTVtay9DMnJIQzljZzByTUdu?=
 =?utf-8?Q?7+vLbdvk4tJoQQyQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee74ef0-8e6a-47b3-a5cb-08de533c6e92
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:13:35.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7JXHR8+yd8M4dDGn2wBZ+2irlTMU7KESg1IiEAXCojmsUVnT58B9cn5eyrSo6oaypOWa8+fg6qZwqCDKR0UDNJ1l7uSUHsBgj3XkMAWcu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-OriginatorOrg: intel.com


On 10/1/2025 10:52 AM, Chao Gao wrote:
> Both TDX spec and kernel defines SEAMCALL leaf numbers as decimal. Printing
> them in hex makes no sense. Correct it.
>
> Suggested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>

Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

> ---
> v2:
>   - print leaf numbers with %llu
> ---
>   arch/x86/virt/vmx/tdx/tdx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
> index ada2fd4c2d54..e406edd28687 100644
> --- a/arch/x86/virt/vmx/tdx/tdx.c
> +++ b/arch/x86/virt/vmx/tdx/tdx.c
> @@ -62,7 +62,7 @@ typedef void (*sc_err_func_t)(u64 fn, u64 err, struct tdx_module_args *args);
>   
>   static inline void seamcall_err(u64 fn, u64 err, struct tdx_module_args *args)
>   {
> -	pr_err("SEAMCALL (0x%016llx) failed: 0x%016llx\n", fn, err);
> +	pr_err("SEAMCALL (%llu) failed: 0x%016llx\n", fn, err);
>   }
>   
>   static inline void seamcall_err_ret(u64 fn, u64 err,
