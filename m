Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12026ACC
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 03:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767669874; cv=fail; b=DQqezf9UVpr836T0mO/Q3lk0gtnl8LN5ffqnpNj/kd9azf8zTdgNK27b/L5mbRgUv/PRNmvfcg0xiHBTHQ5tKQhN/Sekhm7QzOVcjWEsmNIOv6e5vmKCF8arUmHyFRXnJmX0Z8ew6NvHwjSvw8bT2Gwo8WQxgOpfjsb7QvyDaqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767669874; c=relaxed/simple;
	bh=3WsrFdACJF3MsQe0CEs/x5ijIenB+wZGXAwpeez7Kcs=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=Cq4cDksJeTirgFWUYptDHD+/KDr80yxLv2gGtTvdezHpSzJbdZ1x52n1Ca7+keUbxfhU3Vr4bPSpflzTKrGHWbg9JYrlMGUKBq+ZDaP2fK8PdZM87V/LbE0oTpTJUuN1PK5L4Bzywaoq2CFJ7h36V0gFwN92D4dvwWrasdsiIOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfdzS1Sj; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfdzS1Sj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767669872; x=1799205872;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=3WsrFdACJF3MsQe0CEs/x5ijIenB+wZGXAwpeez7Kcs=;
  b=hfdzS1Sj5a6uj78Lx9S2X3UMdeQTQ8FamzUW/HP73LDf9wQd94lVGkiT
   QPVyTNsM0k2kr5M0UCZm4c4wJTArHxC/wVPV9HF1vyI1DuV9R1Ub9tWuY
   bajPWDrv/2wD9Y8LRmr22MN2OO2/MNLBZ1OtDMuSlAdKrCdIZBsOUKfSu
   VBERF1vD2ijXTe2AC93WNzaGX+VPbeBm3FOkLiRLQsimAe1mi2h6nUGHb
   WvNgL66me6BYuwbl79iF/LPSVfKS2S5SyKEANVb3MBUymZsPr2+Ug8ldS
   of3t6LfeIx8NrrpUU7weFseF7uLdiRHpfGsUdVA0Kf0mugYYSuSgd5q+a
   Q==;
X-CSE-ConnectionGUID: k2E8kmXHRTSbFgdfhaqiog==
X-CSE-MsgGUID: HzGZAZ56QMmG5jqVOV13BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71616293"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="71616293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:24:32 -0800
X-CSE-ConnectionGUID: mjhE8u4UQ3m6CN6WueD82A==
X-CSE-MsgGUID: 8V9EAPmcS9SgJvsPs2S8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207589523"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 19:24:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:24:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 19:24:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 19:24:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A68wFwArjk/b31h4nEOBcbAtPQNA5lj1j0csHpqBilJqxtOLygpiigV3mZ9FPau0ciYpl7gUMR+ZU1TvNt/7TiLhH180mPGFmbV8gs0FVJ1TGX/e7CBDvhDxWkdVg1t2EQxc+yzUP0h7/MC9WCcSVtZpKDDK1HrGdv5hyhSOpYvDeUEGWsH1VD8ZptLRnPyJYBhJHObxghhcVJADFS8tuQDrs6QMpuqP9+kcIGfCBLxBr0QnnpJ6Hvj9Z7FAhBcJGR/U5457yxK8/xj/yI9+0m6TszKGCSyjKFJ0Ne3E6WlVcRzFhkEqGdBjz5aPDX3xOyNHwWzqBPqJbOblBNTTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFdR2OPEtv5daqJKrOLFhwFuWCb+G8rdYJBgf/igLfA=;
 b=PsGKIJrNlLI0Koh6ApeJ0WfHkdtRozNJiVfUHOekTO2QOeUc3/0y7fNSgIURRYf/L+BD7ddTkyERPzFaII8elB37d/uVWGLklC30Lt/Ab7TdxurWaYpO3pztSW7xBJGufIVpommITCbI4Nl8zK6am1Olf13AswYXNHHLGtOLiX1TAIFoS+ZbQ2sHuje27E12nhQ+7YgAb/VMSLvkaSyE94a9EZGXsgpAEnDcOjam7G8ZLE0bCaFqlw6HYnhiv7vx9hG4WBcemxUv+j/bprJcX3avA0rRMm6GZS8JKHUHgGn4hmP8sy/QIAtXhk+5InCsT2xU/2fNWohYpD9SM6qR5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 03:24:29 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:24:29 +0000
From: <dan.j.williams@intel.com>
Date: Mon, 5 Jan 2026 19:24:27 -0800
To: Dave Hansen <dave.hansen@intel.com>, <dan.j.williams@intel.com>, "Lange,
 Jon" <jlange@microsoft.com>
CC: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, <john.starks@microsoft.com>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <695c806beb4d7_4b7a10080@dwillia2-mobl4.notmuch>
In-Reply-To: <71f42b9e-793b-4f8d-8159-a6ca7800f292@intel.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch>
 <71f42b9e-793b-4f8d-8159-a6ca7800f292@intel.com>
Subject: Re: "Paravisor" Feature Enumeration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0135.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::20) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: ceeca9ea-14fe-42af-1367-08de4cd31a34
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRGdk14eS9BVTRaeWppSTA2aExrRzBtZVVWem9Eb05xMnFobmltQ2o1RnRq?=
 =?utf-8?B?M2dFQzNQTVgrVnZubHFaSUFBeGs2eUY5OW9QWHBSS2RvUzRBTVZXdno3RjlZ?=
 =?utf-8?B?Q2VZT21ndGQzMDFVNEVPS0Y2Z2REY3psaGFwdkxTdWRKbjVXcWRVZ0FIOVhF?=
 =?utf-8?B?R1hYWGQzZ1crcUtXN0oweGgzaDlyYlB3bnREanJmUGRRN25MeDMyL1NFU1E2?=
 =?utf-8?B?NlB0aDZBQ0RFdXVLV1h6SmVJU3FrdjQwNGhOZC85cmdpcHVBM3ppbFV5eWFK?=
 =?utf-8?B?bW1LTUN4OTRPeitLQ09VbURFVjJUbjJiZGlYMjVIdzNBMUx5UlBCaFUvQU5D?=
 =?utf-8?B?VDNUN1JGUy9HejdIcDlvSnpNYSs3ZVJkRXcwZU1oVHRwalhXbzMwc2Z5Vzc0?=
 =?utf-8?B?djlMbDZjMWFKMU5OWVlPRWd0QlhXYkxoM2FRMFNVNUlwdStxci9RM1dTeEFV?=
 =?utf-8?B?UFlnbDcrYnpFVENZYmRUb1lBWUUvZlY1bmZNT283ajZQV3ZjWGI0OXZSWDNO?=
 =?utf-8?B?a0laUXYxeTBvMGVENjNUWTRkdjZDeHpSUG84Q2pQWnRYN1ByT2pxaS9JV0Zz?=
 =?utf-8?B?RnpIY0M5bVFBQVJYZmkzN0pVd29rOVlzZE5iZHU5WWRveG9TTDZ4ZDE2WXU4?=
 =?utf-8?B?K3N4QWFqV05HNEFtNFZTMWhzc2o5cFJ3VVNaZ29uWDc1dUp1dFU2QkhhQ0t1?=
 =?utf-8?B?d2UvcHppYW9QMzBVVXR1cjV2MlZXQ3JIM2pLNm1WZFFzZjE5TjI2dkRVckd5?=
 =?utf-8?B?akVKelk0Wm9XTTlhRE4waXUzelhuWW4vL2doRVJwRTRTOWlqOWpncWJBb0RK?=
 =?utf-8?B?ODBvbXFxRXhZNkhxZUh3eDdJa0xXdWFXWDVpUEt2SVpMZDRZQkdJYnZUMEsw?=
 =?utf-8?B?YnlWOHJwcTZHVkdHVTY3RXdGeHRqWEZCaklldFcxT3pTL0tDZUhPVWt3UEpz?=
 =?utf-8?B?NWg4K28zYUx1dEtDL29YSWFnV1JCaStlQXpSOUNFQTJZSmt4ekp5bWFCWkMy?=
 =?utf-8?B?T2haaXpCL21TMXJuQWc5VEoyczJleDBES1JQRkVWVEhiVEgyNDc2bGo4Y0hh?=
 =?utf-8?B?SXc4WCtOT0xNM1REY0cvWHRXZTlYeVEvVm1iUE1ILzVybVFxQkg1dldkcHVI?=
 =?utf-8?B?V1NIMEtoRjN6R2hUc3FWT2tpb052RnhpMmFoOEM2V3IyOW15MFphQnR4cDh1?=
 =?utf-8?B?Rm5rcWdmRWdzWktuNlRGUWVkTjlIQkoxYUlLaWhvMlNvZDZwYVhVTHlObnZG?=
 =?utf-8?B?bUZCVkJsdVNBc21UUm9lRmhTc1NpQkxxN0NGUUlKUmc4ZUZWNFJ3R2VIeGV2?=
 =?utf-8?B?aHg5dEJ3Zk9rTjlFRmxxTnNGcW03SUczS25JT1BQVGdyR0YyRlRpSXJNMnZH?=
 =?utf-8?B?cEFobktiMGdqQTQrajM0NFF5bzI3dFRxUkIrekZGQ1ZUTERGZDE3K1paYlRO?=
 =?utf-8?B?R3ZlWW5Ydm9DdHJFTzJmc2s2RCtMZFpRbk04NHRoNldHNTBGSFJ2SlRidWUx?=
 =?utf-8?B?eStITFJKOWlMb05UcHJJb2hrSkxteU9MZ2ZBOWtCd213dTRxdEdoWW5qa0pK?=
 =?utf-8?B?c241ekZzbUVQaUsxUUd1L082My9YeVFhRkI1cUhHQm5WS1M3clk2enorRjQ1?=
 =?utf-8?B?d2p0eVY2b1lvWnViWUZ2ZmVHOUNrdnJQa3FKc2hsdTMreTFTQUx3bkpSK1lk?=
 =?utf-8?B?ZmNCSldiei9qZGxndHF6S0tIRkFRdWNvREkwRm1PZExFTmxVVmVJUzdjWnlI?=
 =?utf-8?B?VXVIakJ5alJwZ3ZLY084V3E1RnRibjRZM29pK0VuNVByNjJvYkxtQ09Ta29y?=
 =?utf-8?B?Z1QvOWtWNEgwUUpDVllkazBhTElacmthcTdsVEVnWkFVUlV3eHlLNFBsUjY2?=
 =?utf-8?B?N1IzSEFzSU0vYlptN2wvVjhqQnhvYXlmbHNsOGU5OVoycjhGaE4zYURzRSta?=
 =?utf-8?Q?FVKa1It28kXPc/1dVuCU2tWNgLUWkxBu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekpRbGdmNFdjdjBzZlFrUEtlSk51ZDVJeFZKTmFrK1BSYWljUm1kRU5BL01i?=
 =?utf-8?B?dHRKTkh2Z3lnNzJVZjNpak1WMC9NRGhvUUM3TGlxUldWR3JkOGJ6K1JpczJO?=
 =?utf-8?B?RUR0ODF0OTFham91VjdQTmFaLzBUWUtwT2MrVUwrLzZ4blVrRlpuaWJjcmIx?=
 =?utf-8?B?U2dtbUN4K0JmOVEwK0VEVlZwK0k4YURicEF2UzZrK2FqZkFLWVhkWWRFeHVL?=
 =?utf-8?B?OXNrMkRXd2VsMWFRcmtYeVpXdWEwbmNZU2F3NEhaNzR6TWZBVGtBOGlDZWRy?=
 =?utf-8?B?M3NRRGVZaEdhQjR4WENnWXFyY245S09pSkF1SjIvMEt5VVBKTmYzMmFrSlRO?=
 =?utf-8?B?MmZvNGpXVU5JZFBHVUhVVml2VGNkVU1ZTStjRFZKRXpZOStPdURyRER0cTJx?=
 =?utf-8?B?eFprZzJyeEdWRERkdmcxZTNnVnRDc1lCWkp4SDBtdW02cnFzM2JRYkplY2Na?=
 =?utf-8?B?N2R1aE5hQnYrZVJwMTFPckpLNk5RaTFOUGJRY3ZMTW1QQzVLZndIS1c1VXBT?=
 =?utf-8?B?S2h6a29lendtRkhHdWVxZ3o3d29Sc2N4WWs1YnA2YmpwVjc5WmJDL0M5eTZ5?=
 =?utf-8?B?clAraUVMRzIzWC9Zc282dEM4ejdJdmN6OXNVeVJLTW1ybXQya0NtdDJNaDJo?=
 =?utf-8?B?dDAwN2doOVNKVkRXWG9mZVNVa1Z5bUpEeG1RZCtkZDgwQ2ZROTlYSFhOeWhm?=
 =?utf-8?B?d0VxSHlaR3hhU3ozL0ZKQkFvenF6YlpaNFBheGtiWGgybk5tblppRWZ2Y0lK?=
 =?utf-8?B?a0ExKy9ZQjMwYmZnRXJ1dXZsZXZzaENaOVpkZjRnY0hGMGZ0QmhvZTB0bE5Y?=
 =?utf-8?B?azVxRERrbkJMeDV0ODdtT1RhbSt3MXZYWlN3ZW9ocjE4WkI5UUNOQlhvcVg4?=
 =?utf-8?B?NmZZYkRyYjJmNlJmN1NRRHhQNHQwZkhjanQyaUF0TGJyUlJPK3ZJU21TK2ZS?=
 =?utf-8?B?WVo4d0V0NkJZYlpwbzdqTDdRZi9MdVNWUi8vUWRvNFZHbEtuUDRjUzFUU3hr?=
 =?utf-8?B?Skx4aldoa0JZNnhCODBuWE9LbXk1WEFuK2tGeHRMRzJsejRRcmJucm5CbHVw?=
 =?utf-8?B?RzdZRjRYTHUzYmdUdGdNWjJZQkhSdlBIanRRNHBBNnNEWGh6Z0NqWWZFL1d3?=
 =?utf-8?B?djY5Z2QyUElmZ0U4ME1Sdm5pTitrWFhEWnpRbUQ3d3l1cUNjbXlZZ1FHemN0?=
 =?utf-8?B?dDJZa1gvcVlWaTVIWk90TmNIMVd1bXdqYTl3bm82emNJVmFibzMvS0xEejBJ?=
 =?utf-8?B?ZkxmSG92MkdsSDRCNXMyQTk4WjJEczBaYlZYRjNYUjY3dy9wTEQ2NjZHTXJx?=
 =?utf-8?B?WVZaVXY5T21TNXFpQzNqOHQ2dlBGWVJDT1l4ejhqOGlKVjUyU1hCV1pCdFVw?=
 =?utf-8?B?ZEdZVUdObFlKQ0VTRHNTeUdTSW5lOW1ZZ1NLelB1RVQvYnNSQ3NrRnZ5citk?=
 =?utf-8?B?NDRrM21oNkdDTEN6SDFrd2RTSHNuUjVTRXFkcE5PM2Z4NjgzcUZyeVFkVE1I?=
 =?utf-8?B?SitXWHQxc0RtY3NGS3U5R2hJVy9HNjh5dmpOazBITW5WTEd0U1FGK1lGMmhi?=
 =?utf-8?B?RnRiRU53T3ZCZi9XVFFXdm1QTHlDRDJpQVNzNk1HaUZpelMwWkk0aFBIeTE4?=
 =?utf-8?B?bEFoMmRaQm9nN3d5WVBkanpvTURVbzI0YkpVQnVrSVh4cm1TR2JDQ1dtbEZu?=
 =?utf-8?B?aDc5YVhFV2oxME1iaFdBYnlIdEVJMFRkYzRwY2ZOM3VQVmtZWlkxZVl3dlRu?=
 =?utf-8?B?cWxqbkY2bkZlUjBramRjS0VjRTlxdDExOUROTE5rN0VpYkNZdHBtUmcwY0pJ?=
 =?utf-8?B?WFl5OFZZTEkxd2tDQ3VycjdYYm9FUDg1ZFl0MTJGaG5hWm9KeE5kUmlzaEFD?=
 =?utf-8?B?dFVHblpDVjVMSm9YdlRFRjdkRUJ3VUM3MCtyMi9pa0taeUoxb1psemx2NWpN?=
 =?utf-8?B?dlJPZEZ2T05pYmFWa09WZ1VGbFBjVHhCQXcvaDBTYnhrRzNhQ1ovbVB2NlFm?=
 =?utf-8?B?Nk5MbG81M01jNURsUkxrUWt1Y0lmbG1DL0lYVkFhaEFhdXJuTFBNSjJpUGI3?=
 =?utf-8?B?dXNIRWVYditTOTJ0STVSU0dPaExMVUk1eDBHYVpoZmwvVDluVkFCTkp5Zm5r?=
 =?utf-8?B?Nk1acWhiTVpieXZ4dENwN09wWGxCUk9BcmdDdUREWERNQ1I2akJON3NNc2w5?=
 =?utf-8?B?MzVaendXb1NsZ1B6WkFtc2ZrdzgyeGx6cHA2WWNQSGR1VUtZZnBnL0U0K0lW?=
 =?utf-8?B?c2szNC9ndEhlZ2wzUGlWYnhUbmZweU5EbE4zZXhvUVo4cDJBV09pK2RYM0tp?=
 =?utf-8?B?bmZwUVoxd0dvUjdyOXRVZ1RjYmxsbTdRWkhLSHBMUVBUbUJlYXRNcEh1Rm9V?=
 =?utf-8?Q?sNJe/tC9GD4M8bAI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeca9ea-14fe-42af-1367-08de4cd31a34
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:24:29.6168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DHTTKDX7WY92JtNMm8c79KvBOx6cN45t5VbTsoop/qow2iagh/QxdZUJ7WSAVQZnbNZv6X7bufTQCmY2NJrGUrL6HmLkQ9M1Xh+OlUlHSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
X-OriginatorOrg: intel.com

Dave Hansen wrote:
> On 1/5/26 16:01, dan.j.williams@intel.com wrote:
> > Dave Hansen wrote:
> ...
> >> 	X86_FEATURE_KVM_CLOCKSOURCE in arm,pvclock
> >> or
> >> 	X86_FEATURE_KVM_STEAL_TIME  in arm,kvm-steal-time
> >>
> >> As far as I can tell, these aliases are all done ad-hoc. This approach
> >> could obviously be extended to paravisor features, but it would probably
> >> be on the slow side to do it for each new feature.
> > 
> > "Slow" as in standardization time?
> 
> Yes.

That speed problem is mitigated by the EFI/ACPI Code First process.
Linux and any other impacted implementation that want to be party to a
new mechanism just come to a public agreement on the mailing lists per
usual and ACPI Working Group acks/naks that public proposal. That
effectively gets you in the same ballpark of time as landing a new
invented Linux enumeration upstream.

There is a lag between the ack and the spec release, but the intention
is the ack means it is safe to assume a future version of the
specification will adopt the change.
