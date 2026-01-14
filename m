Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F636C0CA
	for <linux-coco@lists.linux.dev>; Wed, 14 Jan 2026 07:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377375; cv=fail; b=TJnkQ460wQMbg2Hjt5rkbdW4JhqLu7DnSK2PvPt67PK39gtJg94MxgAwKVxFA45An4atLUk9NT4inAkXPZnaCSJEo2rECOCB898HGiNKaVJCUpGFfrC2qLzOsVbHHGQZT4obZ3uIuOA4kE0Zf5UxjwSnnOetW64B64f3whMrgWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377375; c=relaxed/simple;
	bh=TxKIH6uMlZk0uywGApoDwI/pvlUZ+SA4f4UcZ9GqzKo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YVSVMauChjbVUGGRy/YHKljUcEB/GiBBYBa5Er5eyJNZSXA4RIxPi3kroAuEpJDQYfwGwE4UfvE5HnwdbhttZMX6oziMDI1aRAOTUEOCDwoS5YznXaQMpHuLkSj5YkHG29UOdN7kOqfpHc73iQu9CgGuPGEaRCtDNGDM50XaVNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egpHUa71; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egpHUa71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768377373; x=1799913373;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TxKIH6uMlZk0uywGApoDwI/pvlUZ+SA4f4UcZ9GqzKo=;
  b=egpHUa71gicDzBUT2JUpDYip72mamkEzJga+WaGznlE+3LFgSmOU7Lkc
   rLKSDbtBpny+rnSDBiH2FV0hM+sO/yVqv2b4ihHJ7diy8jULYndBDVCOV
   zSjZAGT7N+LCGlI0MUGDf/ErwGCSmy23rm1jmzpOXwwFdgfUyXwcx88f7
   6031zFyhibofgZ7CreWoJo8nPcnpt1FihJR4uckx2KwvyiKxNrW8cxwPy
   LEtZjBZActKugtk/npngSc/z/JF6vAjwhyZRF27zTNWTxbxo9oZsWm+xx
   1KflRtNCuZrVK2ElUY1Dk7kcZbOyWfxe7Bbpi01GaKuTaCJFsaTkjONMf
   w==;
X-CSE-ConnectionGUID: 7Eo075c9Rimp1mPu0NcZAw==
X-CSE-MsgGUID: mt9vSf4dSKS5cTeoKRSVPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69591444"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69591444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:56:12 -0800
X-CSE-ConnectionGUID: xY8P2eh1TImgt2ci2hgWeg==
X-CSE-MsgGUID: uLQePW6JT36bo2GOmY5K1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204401709"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:56:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:56:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 23:56:11 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.14)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 23:56:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAt+ONeKjybuKLhrCqBGcWleJ4khyY3ZzAElopJ0Rjs1HVDUpMD9O7vcFuJPrGLsiEwZtp9m7B/PRIrDnkHj6iJ3M7GYNajVoUjSPW6T2doZ+yk2HwQgMK0q9r/8R6ZgXdqnD0d/F7eBbTM40sguuzXQPRbBxAjFMUw/HO+dIED7fxC9aLNiqljLjL1GrYOI65aOkO3imTO2PV39RPDU3tnD8Ny1UQ0Fxenw60PxAigTJ43yWEHYyu5BhdyDktYrZ9hY8G67JB35hTOOXh2gLTcGe6kdh9ip9AmDjyS3mEqMLHzYxG6gnPoC5O18mmwkJKe32UTafXwi7qaEkzS7XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5PyD0sA2QbMpTFKMjTL8AnreXtMvEdyGJDFptqk0ak=;
 b=lZriK71QhD8D9geY6vyvcsltc4+t4qcPPtuYKMIV0rsxfe8ZSSKWZ9E7grB2k6tmFzvWMV8Vu0243NF7XwCRqV6rIsAa0SjQPG8IYtnW7W1GBZCWbxVc57hL0tR4Sg6SC+Yir6sO06WMJYytGzQ68ypYq94PTa6prmbCPE4/M6HXw7MJ6nFNsaVv5wS6wwKICgHcf6C5HEa1Nl5r7oNBGSNuUdHbomm0OFE59xlE4RrkYcaxiXnHzoiTTi4L542qzCLyMtWUQRBTJiQIzeQf6qIKAmHfn/o4JWh8qMoj3Ge4DBQFFfA3JZM26clsZ+P222sa6S3pcDqkT1OnbF6TiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 07:56:08 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::604b:77a4:b1be:3f13%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 07:56:08 +0000
Message-ID: <eb5c74a0-bff3-4bea-b0e2-30886ab55644@intel.com>
Date: Wed, 14 Jan 2026 15:55:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/21] x86/virt/seamldr: Retrieve P-SEAMLDR information
To: Chao Gao <chao.gao@intel.com>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<reinette.chatre@intel.com>, <ira.weiny@intel.com>, <kai.huang@intel.com>,
	<dan.j.williams@intel.com>, <yilun.xu@linux.intel.com>, <sagis@google.com>,
	<vannapurve@google.com>, <paulmck@kernel.org>, <nik.borisov@suse.com>
CC: Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Kirill A.
 Shutemov" <kas@kernel.org>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-7-chao.gao@intel.com>
Content-Language: en-US
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
In-Reply-To: <20251001025442.427697-7-chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::14) To IA3PR11MB9136.namprd11.prod.outlook.com
 (2603:10b6:208:574::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9136:EE_|DM4PR11MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 41451d04-a4af-4edb-5ccd-08de5342606f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHVqcHBOdk4rL2hZclR3ZUx0Q0paWlZWTUZvZ1FyMTk1aVBqVXMwcUo4ZDRK?=
 =?utf-8?B?SzFmRVh1alpSWW0zNWMvQlMvZDVoTGN5V0wwYlp3WWsyN2QwSUp0aDR4ZGdC?=
 =?utf-8?B?a1lnTGVYWDZVWk9RRlRHbEpaK1I5SlM2ZFdYWTgxeXFzNW1HaDRMUlIyZEl3?=
 =?utf-8?B?dXhxR3pDcGh0ZWpDM2RIT01teTN3dUtNSFpCa0RycWUrMk9EYmtiQ2NDa2cx?=
 =?utf-8?B?eHF6WFVkQ25VRkRtdkdGMnJBa28yZWtkMzZ2UFc2UWJ6MFJBU3lPamhZZWFl?=
 =?utf-8?B?TTFaNER4TS9LczYxQmNETU1IZEZCOG8xZUw4b1JZTDNxSldqY3ZFSk5SZ3FI?=
 =?utf-8?B?Kyt1bWF5UFJQaEp6YWI0TEZ5UHZzSTZNVmhZWnhXMzZRazNZbEVtNFp4YVNt?=
 =?utf-8?B?V0FNb0l6NTZmc0pYYm5tTzRIYWxpRi9NVUt1N1A3blp6TVhoYUszN2k3N2Nk?=
 =?utf-8?B?WWpqZFBudS9pbWV2V2NleFdGUEZ3c0QvekVIZHQvZmhMSXlMWHVBTUsyNTVG?=
 =?utf-8?B?SlZIVEdRNnpLUEVhVjF5cWhPSS9DaEdJbzZnUnR6aTJQRDNNWUp2NDNmQnNp?=
 =?utf-8?B?NGVKSEF3dmVlRHNoR1FDTG9HZHExVkNvaDl4ZFRIbW5IWFJacytDTzZsL0Rz?=
 =?utf-8?B?MVFySnREZVJnSjAzUW0vajFTVVdPM2YxdEhvNjBYTmFNdU00K21NeUpGNE95?=
 =?utf-8?B?REpKOVFVNTc0WWI3RlF3VXZLdDNFQUIxR3RGQ09kNnl3Y3dSd096YzNDSXFo?=
 =?utf-8?B?TllxMlkzYWZHcENmZ1dXLzI2VExDTkpySTRlOUZIWWk1OFlPZTNEa2FINDgy?=
 =?utf-8?B?SUMxVkhWMzkyL2w3azgvbG9wWkpiemRxcHV1dFRuSnRUMEtZa3hVSjYzZXBC?=
 =?utf-8?B?bE5pVW12UnBPUXFyUkV1QWtZRFZwcFdvWG1HK0VuWGplcTBvU1V2N2JSYWk2?=
 =?utf-8?B?NHhTY0gwb2lVY3NhU3VDdkYwaEhXY0Q1L1NoMHQxVWJacThTWmJId2JkcUdj?=
 =?utf-8?B?bG8yV2lrZFZTZDZQK21WT0FZaU1FbU5QeFhqUFlUcXNZZGhlOGFtNUNGYmlB?=
 =?utf-8?B?aXFIM3pSWldySzlBZ1kxVnhCc0UzQXpROFU1cTdoTncyQUUvYnBtTDNRTE5u?=
 =?utf-8?B?MGtlb1JzK1lzRWN0eFk2a2lLb3hEak55em9QUGE4R3JzZzhTY0kzcWc3b2JC?=
 =?utf-8?B?ZzdvcEhZRnJmak9HbjM3cVQ1Q2dCWURxN292WU1yZzl2TEpROFhlVlA1VFR2?=
 =?utf-8?B?clFFUnZ2OFFLWU1QOWFoMlBIM2NIUjVBSEFjUHJEYnhkM0x3SE1NNHc1MnAx?=
 =?utf-8?B?eXMzQ0RxR2wrcUhYZHR2RDVScVh4NUNIbTZoeWYrNnRMZ1pnQm5yWUJWOTJr?=
 =?utf-8?B?bjNvVFlaUjJTTERMVWtueEZJelJXd2FwdHRRZUJMUGJpNXJ6cDR1aG1aQlBx?=
 =?utf-8?B?TVdNTDF3VVQ1alNPZmJQaVpXZ2hjTnhiYXdHdmhIZ3ZmQWZkTlBoWm9IRmtO?=
 =?utf-8?B?d0kwVENDSVRjNHJVS0ZtZEtYVEExMjNIaEtzNEd1UkFTY0NYNmlnK3hCd2Vo?=
 =?utf-8?B?TzJrYU1ybGtyYWJiTUpoblN4eitDdlY2TnlDZ1Z5KzIxR09HbUNQcDJGdWpi?=
 =?utf-8?B?M1kzZzJYOCtKVkRweFhOeERsTjlDSlVFbVFBMExmN1FIVXFmY0RCaUZZdW01?=
 =?utf-8?B?N2tJMXRUTnJXRHRZSlAxcElqT2lGNSs3U1NnOFc0S2R5VnBva2xTMHNIWUNJ?=
 =?utf-8?B?SURlZ2JVMjhFMG1xQ0FuTGw2VWwrMDFIUTV6MHl4UCtBMXg3NDVBamJNMFRa?=
 =?utf-8?B?TG16WWRMdDRwL1BLZUhRQmVmZURNbG5ncXJRbEhhWWk1ZUM0aWlsRmJzY0xD?=
 =?utf-8?B?MVhBaWhvNGkzZDFUR0ZHdXRlNU10Yk81QlhTRkhkMUpJTUUzRXNWMmRnZjFN?=
 =?utf-8?B?ZCtSeVoveG5ZajdXK2J1czNGWjFqandZUmVPazBHYUIrQ2x2N2RuVGo4WnJK?=
 =?utf-8?Q?mMhSOikHehpN7k3b+o+HzIvWFZwFkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzdoTTlrUExTR3NvaytCWWZ1YkFCWnFPWmgxV2ZrMmFJUXhRZXVseVNoQS91?=
 =?utf-8?B?TFdkVUlqRDc0ejltUHVRSzY5Mk8wWEpuWmkxaGtnb21obGRTRFRQQ2hpa2NQ?=
 =?utf-8?B?N2hZNTcxdTdkcno0cExYcU1jUzRWcDZwY3BXcWs0Wk85ajRCQlpHd1FxSTBj?=
 =?utf-8?B?TmU1UGIySTc2OVZkNDBYdEJWczg2dWNHNzUrSnBEQ2NTenExeklsc1BNUGpq?=
 =?utf-8?B?TTZxbFlDT2FiMitUTnhYOFFEK3B1SUdFdEU5SUsvUVBLRyt0WDdOdEl1K0Mz?=
 =?utf-8?B?TzM4R2w1ZWRDdURxSmFRSzV6cHNwUlIweEk4Y0Z4eU1LcERISFFGcVU0d2NT?=
 =?utf-8?B?eXZzM1p3dlIxUFd4SlpRQ21uUFFuUHRRY29zZXc0SUpNbWQ1L2xubWNoR0pU?=
 =?utf-8?B?djhhNnFGUjZtNWFVaFZ6bDlDTmtrV2FyRnNodUJCbEIvakdHa1JRcm5rZDRl?=
 =?utf-8?B?dG9PRGM5QXQ5cW9VNGYwVTlZNWFPbkVyVWdQeEtBdlU4ZFp0WExyYnF6NXll?=
 =?utf-8?B?eUZEdXdwbUF6WGJha0xKeWZkWThobk94dmYrUHpuRFM0aUpiUFRYNzhONlcw?=
 =?utf-8?B?UzMvZVlIY1NoZmhRbHJqTFQ1c0hqUnRXZU4yK1lsRG9JSk9xUlRCMExTR1Bt?=
 =?utf-8?B?R0tIVXdVOSs1SDgveEcvWlVsZTJPYi9YSTA5NkpJbFRlWi9Cb2dZbm9jRHNH?=
 =?utf-8?B?ek1IKzBaSmlTZ01DYWZIYU1jZnFicTBZSTVsYkNUQjRYSTdXVUpJOEVPRTky?=
 =?utf-8?B?aS9GYzZWRFFiZE5wTU1iTHhSRGRIMjZlai81WWU2N1lQazZvazEvb2JZTHZN?=
 =?utf-8?B?a3dkZTY5N3BESENOVU1CZG5WZFJMbDFNRGQ3TXpCanhpMUc1NURleldzUFJC?=
 =?utf-8?B?ZUpHNDE0YUJXejJvWHFKenFjalFnZ2lPU1d1cjBDTU5kVitmU2R2OUF1R01O?=
 =?utf-8?B?QW1vR2Y0djBobjFrNUlOcWhEMzNXMXF6UTdFcnRDTEZwMEVjNzJsbkpXbmdy?=
 =?utf-8?B?aVlxSnVpUUtsT2xjNDFXNnVZYWpxcXhmTnBOR2Vsdk1DTjljbXVXbkZqNmhl?=
 =?utf-8?B?eExSRkFNRWgxSkFuVXMxdlpOdnVvc3ZBT3daMDRZRm1FRmZ4bVF5b1FYemls?=
 =?utf-8?B?WWl0aHRjaU9qT2xLWFlIOWlPeXlPUXFpR01sb2FuQ25qWjJZS0xMTjY1QVNU?=
 =?utf-8?B?MVBxNHh0SXFhdDcxZjI5ZWdYMU5UcHp6U29CRVA4bjNUcEg1ZWVHQkUrSUt2?=
 =?utf-8?B?T0k0TFREbENqalE4Um1mOHhrZGVjWklBOENqZHJpLzZrV3B5QkFiUVVyZDd2?=
 =?utf-8?B?WktRUU05NWFKSk1hejA0V0RKT0ltVjBkMXhwdGdGL0JWK3JVVFVxMjhia0J3?=
 =?utf-8?B?cWVsSk5RRnlPYTYyMW9wSXBkRDZJb1l2U0JMVDJEcEs1aUp0dmlQTGpueUZG?=
 =?utf-8?B?TjUvUXBLNjhHMWVLZGtuSmZpQ2poMU9FV3JNOFZjYXdWYWpNUWVIY05DaGRI?=
 =?utf-8?B?ZHJkR2FvNEZad3M0a0FSbWJPT1UyRmlRZDFGdUVVUm4vSklQSjBQeUNUS2J2?=
 =?utf-8?B?K2ZkWERNVHFuYWRBYXdVY1doN2wvNmEvNXpVYXRvNUhCWk1nVEk2Z0l6Mkxn?=
 =?utf-8?B?SVpKNVZaQmhEWm5KQVpPNkFkYVFpeWYveUNPUUNoS0VHc1Vydld3OUY3UnY4?=
 =?utf-8?B?dlcwRnpJdW1rVjBodGZlMHN0TThVc2lNelRaTnpFSzVqclI5eWZSTlJWUjRC?=
 =?utf-8?B?Q0dZZGdIalgvemFrNjQwTlN6YkV2TWxqd1VkdlBGODdvQjJBeUUvZkRhUDdl?=
 =?utf-8?B?ajhtYmMzY29Vc2dRdHdMdVB4amh6YnRKSjc1QUMrMjU4VHB4L0RSbmNRSXNs?=
 =?utf-8?B?MVNmK1oraFgrdE16V1d1bVJudmV4OFY2dVhWSGFGRUtuaTBNUnZRem1mUXhi?=
 =?utf-8?B?Mk5HUTIzVjUxUEV1SEQwd0F0THd6YlFVeFk2YkJsR1FocitHMVVQNFJhSThv?=
 =?utf-8?B?eDVJTlEzRitqZ3VOcjNXeC8wTnhqTjRXZC9VTTNxWDU5VmRMZndaOUx3cVZp?=
 =?utf-8?B?dktkcitjellOeVl5SjA5TVBKQnphdElDdWxJSDlJRVViMHcxWktqZDBudzJ2?=
 =?utf-8?B?bVVUckhGTEJXc2UyWWIxQWVqQ0pmdWlmM3ZkaStsNGNrYUo0TktMRjRrNnFn?=
 =?utf-8?B?eGU0WnpaMDg1a0lhTC9NcVo3T1Z5djBkMzgvRDRYQmRNR2hjdUhEZlBRd3Br?=
 =?utf-8?B?V0cybTFqRWR0SytjSHdTS2s3TFZUVU1YL1V4R2VvN0paMDJvZmpwcG9XYUlv?=
 =?utf-8?B?c3hEd1Y4VWt5aEwraTR2VC8rdHpiSjdtZFdrV3U4bjE5Qm8wdHZUNEVUTTdW?=
 =?utf-8?Q?/H7CnqALGlOHMpiI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41451d04-a4af-4edb-5ccd-08de5342606f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 07:56:08.7285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2R+n8hmiSBZr8Km/9JpuiWk/r4w/gVVFrz++Rk7McvjwGWtKAm8J99chZ8E3wZzv7Uslyvo9GAgAJsqS14Y8bCsQbCHzavzsaugyjxY5OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
X-OriginatorOrg: intel.com


On 10/1/2025 10:52 AM, Chao Gao wrote:
> P-SEAMLDR returns its information e.g., version and supported features, in
> response to the SEAMLDR.INFO SEAMCALL.
>
> This information is useful for userspace. For example, the admin can decide
> which TDX module versions are compatible with the P-SEAMLDR according to
> the P-SEAMLDR version.
>
> Add and export seamldr_get_info() which retrieves P-SEAMLDR information by
> invoking SEAMLDR.INFO SEAMCALL in preparation for exposing P-SEAMLDR
> version and other necessary information to userspace.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Tested-by: Farrah Chen <farrah.chen@intel.com>
> ---
>   arch/x86/include/asm/seamldr.h  | 27 +++++++++++++++++++++++++++
>   arch/x86/virt/vmx/tdx/seamldr.c | 17 ++++++++++++++++-
>   2 files changed, 43 insertions(+), 1 deletion(-)
>   create mode 100644 arch/x86/include/asm/seamldr.h
>
> diff --git a/arch/x86/include/asm/seamldr.h b/arch/x86/include/asm/seamldr.h
> new file mode 100644
> index 000000000000..d1e9f6e16e8d
> --- /dev/null
> +++ b/arch/x86/include/asm/seamldr.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_SEAMLDR_H
> +#define _ASM_X86_SEAMLDR_H
> +
> +#include <linux/types.h>
> +
> +struct seamldr_info {
> +	u32	version;
> +	u32	attributes;
> +	u32	vendor_id;
> +	u32	build_date;
> +	u16	build_num;
> +	u16	minor_version;
> +	u16	major_version;
> +	u16	update_version;
> +	u8	reserved0[4];
> +	u32	num_remaining_updates;
> +	u8	reserved1[224];
> +} __packed;
> +
> +#ifdef CONFIG_INTEL_TDX_MODULE_UPDATE
> +const struct seamldr_info *seamldr_get_info(void);
> +#else
> +static inline const struct seamldr_info *seamldr_get_info(void) { return NULL; }
> +#endif
> +
> +#endif
> diff --git a/arch/x86/virt/vmx/tdx/seamldr.c b/arch/x86/virt/vmx/tdx/seamldr.c
> index b99d73f7bb08..08c2e3fe6071 100644
> --- a/arch/x86/virt/vmx/tdx/seamldr.c
> +++ b/arch/x86/virt/vmx/tdx/seamldr.c
> @@ -9,9 +9,16 @@
>   #include <linux/irqflags.h>
>   #include <linux/types.h>
>   
> +#include <asm/seamldr.h>
> +
>   #include "seamcall.h"
>   
> -static __maybe_unused int seamldr_call(u64 fn, struct tdx_module_args *args)
> +/* P-SEAMLDR SEAMCALL leaf function */
> +#define P_SEAMLDR_INFO			0x8000000000000000
> +
> +static struct seamldr_info seamldr_info __aligned(256);
> +
> +static inline int seamldr_call(u64 fn, struct tdx_module_args *args)
>   {
>   	unsigned long flags;
>   	u64 vmcs;
> @@ -54,3 +61,11 @@ static __maybe_unused int seamldr_call(u64 fn, struct tdx_module_args *args)
>   	WARN_ONCE(1, "Failed to save/restore the current VMCS");
>   	return -EIO;
>   }
> +
> +const struct seamldr_info *seamldr_get_info(void)
> +{
> +	struct tdx_module_args args = { .rcx = __pa(&seamldr_info) };
> +
> +	return seamldr_call(P_SEAMLDR_INFO, &args) ? NULL : &seamldr_info;
> +}
> +EXPORT_SYMBOL_GPL_FOR_MODULES(seamldr_get_info, "tdx-host");
We can trigger seamldr call once and cache the result except seamldr 
itself could be updated.
