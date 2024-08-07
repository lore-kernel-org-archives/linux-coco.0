Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD7136E21
	for <linux-coco@lists.linux.dev>; Wed,  7 Aug 2024 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723046701; cv=fail; b=edj8jnVwwRVD6Ss2hXVe6PAVMIV6M4vbzUR1k9mga821XWwXGYKUU7EQWOrRUxD40yVzUG3yp2BQ0SI6wOxPQdoD338bcM05grpwEn0HTl3dkfmNU6gve35X9D6tpbaCmvuymrTBnY0c8ZDOXpUMDfsX2zL33wgQ3ZJM7je57z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723046701; c=relaxed/simple;
	bh=R5ebrqBQGbXD/dxVULVt2f+km9YHCBPYQhvU6cSmYMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cXtZkC3OXyUq+VWGcdj5e7G+tShz95OVyrXdnHh1Lnb24ru9df1GndKlIRuNvF/SiHTl/dLQmeHmpjFWVsSQSzI1CBkubJSrB+rlKcfZiSpMkpBjkPu8pONyMWjwTolTOchjpw0xbBfjuIGG1KUJk/E6i9R4HRqpGJMgQXcCEzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ky7PND1V; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ky7PND1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723046699; x=1754582699;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R5ebrqBQGbXD/dxVULVt2f+km9YHCBPYQhvU6cSmYMk=;
  b=ky7PND1V5VHJrKnof7jdyl89iZ/0mBuSGZXcDFK10h/C4GzSUZy7+C5l
   1tTAz79gb524hmjOYPfBnSMtLl1q+I8cUztwyjzK02xFz939WK9i6wAx7
   DwkopPErqwxQXrzBO1I1g4xFg7aAu4TACM6YgzFEMV+dsT/bxO243qxQ3
   vmfrfKBhOOR+X2Ms7LJQnz2AJUW97VAC/60+Nfg9hFvTKy2xAXDLDijgC
   p/o/Go/bWnSE6Djxae8FWLrd0Df1ixBMJQ6Wn1IpVltuucgiox+o7UuwJ
   GaV2oB7o1sZJiY+pOacLGQy5RLwKzG3cgYT7B+3VjGEc1YUgdHaGJIwDV
   w==;
X-CSE-ConnectionGUID: PaFoF2uIRvy5u/9sCfvgsg==
X-CSE-MsgGUID: SGuUNKmPSRGj8CTfDanFKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31799075"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="31799075"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 09:04:58 -0700
X-CSE-ConnectionGUID: 01vYJkxHShiPCAsx12RR3A==
X-CSE-MsgGUID: BqV5olW5T6SL159RtT3yfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61549302"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 09:04:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 09:04:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 09:04:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 09:04:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IebJus39ZqxT+K2LuXiTF5t/qe+HupGQ80r5w+/cYmFLz69sUpH3ZQrr9emlQ9zNR870flJ5CHPqBQDG8IyyPFKx1u3fx4OpqOik+vpkOdONbkOCHB8JaHVrRTemQIUaPxh2okgq/T95GY8n2ARbDfeNrHvR1e6d8+UbOvAaGAHA92Mz1bUazHomg4ei5mfpzBsUCvcARIu+0vqZf2mvLKT4vutyrGN09zaD5ZLHrhjXKEH7g0+y5VOFWMjEn7HQJSZImw+GWhXIMtmdiA0lo0Z9sCL913mUnUuSLVCiIkIxeuwf0geZrmutbILgdA2zr1RkuS8WOwYtSFP/3ict1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5ebrqBQGbXD/dxVULVt2f+km9YHCBPYQhvU6cSmYMk=;
 b=rw6sN/LOuC5BzhAKpVE04vXdPnd3+O3oxWua83LtFIXyzgrUXU/abNGxH8kAvWg8odGv3oa0VwE9n9Ppnwh/4R6IxMAinJgaK/UvKie4Otgdghk4XSsPpEyrk3iWtecPteZ1k+fhj3NNwtsvB/uflpu+hUlaxoVVzzn0XDpFOaNgCv5v9ElF667sxfFjN8MUFI8urK1IYcZ8YbYdHtziyScELk9Fz517pFv/1FzdPSbEo6E7Fx+ICvzuAwK3o1vz3l0EtMO3sStXG4pY8gv3QC44F6gEr9cO8FWMHZJZWOtqlKSjhrlfve+hKbCvxucM+a8zqIxZdwiLGU5G0DlN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 7 Aug
 2024 16:04:53 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 16:04:53 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Claudio Siqueira
 de Carvalho" <cclaudio@ibm.com>, "dionnaglaze@google.com"
	<dionnaglaze@google.com>
CC: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "jroedel@suse.com"
	<jroedel@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Yao, Jiewen"
	<jiewen.yao@intel.com>, "jpiotrowski@linux.microsoft.com"
	<jpiotrowski@linux.microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "Lange, Jon"
	<jlange@microsoft.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Johnson, Simon P" <simon.p.johnson@intel.com>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9SCoxtMRLFK0GjoRY90TKvZ7ITK4eAgAEdeICAAKutAIAABwuAgAOiBfCAAF0YgIABGYlggACBFoCAAAkjgIABPB1QgAASbwCAADwzEA==
Date: Wed, 7 Aug 2024 16:04:53 +0000
Message-ID: <DM8PR11MB575007C975ABEFED36C8D027E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
	 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
	 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
	 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
	 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
	 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
	 <a5911223c2e23283674de4b85395acf0326363b2.camel@HansenPartnership.com>
	 <CAAH4kHbiDaZjae21b2XPpWyPehBhGghshqz0jYf29G2p_vGKVQ@mail.gmail.com>
	 <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
	 <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <ab64151d817e32ae440668ad8fc7b42eddc59d07.camel@HansenPartnership.com>
	 <DM8PR11MB5750563E06F6E7C278667768E7BF2@DM8PR11MB5750.namprd11.prod.outlook.com>
	 <003d1f1d654525afc736d84ec9a9e22debde1785.camel@ibm.com>
	 <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
	 <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
In-Reply-To: <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|SA1PR11MB5777:EE_
x-ms-office365-filtering-correlation-id: c5adddb9-64bc-447d-f22f-08dcb6faac8a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZlU3R2lEMFM3azgvVytkT1JQbkhibTVwbTBEUEtJbGV5YVVqVnE0OS9JNE9V?=
 =?utf-8?B?QmpEd1lLQUdrWEpmUHZNTHEvS0JJUk9XTFBHQmp1dVUvVjdwcjQ1RzZQTW1I?=
 =?utf-8?B?RGYrQ1gxeVFudTFtTmxQMVhHNXlpSEtOT0dZYlBPakpUQ1NSeGk0eitqTStj?=
 =?utf-8?B?M2l2Z2FQdThRVHhyd0NGVGNaZnJuWGlrRVhpOXBJcThJSmsxbytwUC9mTDR2?=
 =?utf-8?B?YlhJQmpkN3dEYU5LZHNMb3N0dU1XZ3FUNHZ6dURjc2tjZGVzczA2WHpjWUxq?=
 =?utf-8?B?UXYxMjJPUHpxMEQxN3Jtb2dpWDk3NFYxcm9pYjMvbjBUanhBWVFjYkdZNXF4?=
 =?utf-8?B?NWZhNGd6VDhFaGV6NG5FKzRsSTB5VG45QnVIWngrVE04US9VREcxZm8vbTY5?=
 =?utf-8?B?UzNhZU5oM0drSStmdS81dW9jbEtGcjVGZWwvSCtISlI3TCt1ckVBNStoT1Js?=
 =?utf-8?B?ZytDSHVSNEZxdUdxNkZIRHFMczRsQTNsN09QVjZJMGNISng2akFOb0ZZZm1Y?=
 =?utf-8?B?bG96dStlS1pqcGZDMlBBdWk1bWl1MTh5Y1VFWXE2eTc0b0ROc3F3Q0U4SmhE?=
 =?utf-8?B?Sldsenl1NlZjZXFncmFCNXdFUWE5V0J2eTJmbXhUMUhHQy82SUJDNUlIWk44?=
 =?utf-8?B?c0lPQnBwUkpwRmV4N3EwNk5Rd1c1eVVnSmpPaXZxTEl1UHZpaVJpKys2M3da?=
 =?utf-8?B?S0JOTFZXY3A1SFgzdDBrNnkvbGlnd1M2Rm5nR3VIaE9tN05FV2hjNXZUTFNZ?=
 =?utf-8?B?ZU02V0g1bnZjV1JhQXVsZy9OazkybUxPMmZVL3Z0bmlTTUx2eW5vdk8wbHZJ?=
 =?utf-8?B?NmZkVlA5eTRYNjkzZXJFNnpVZzFGQjRVQUtMMTdGK25NaisvdDBlN2owa2Fk?=
 =?utf-8?B?V01JcTJmVmFKR0NKbi9xN1VyZFozOHJOa3UrazhqQ0xnaEFSblVnM3dXSXZR?=
 =?utf-8?B?RnlzUHRnenNtQkkvNFU4UGhwMXYrTlI2ZGlLdGxLR1ovMmN4V3cycnRTbXE0?=
 =?utf-8?B?eFU1NkYvbkJpZHFNT2JhQ0tmUUF0SDFtcnM4dnhXZlc4TVVxbENFZWZibE5z?=
 =?utf-8?B?a1V5dFpzem5wWnl5K25TSEo1VE51RzJTWXBRaXZkMHVmMjMrSGlFUTVLaHlw?=
 =?utf-8?B?bFFrcTRsTlRmeGhMcG5XWjJtZ0FuZ29welBWNFMyRi9WYzVCcTN3UTg1UGtP?=
 =?utf-8?B?OG51blZPYnc2SjhzOEFnS1JxRzVNUDF0QWoySlNCRzRNeVpaZHUra0lmTXQ1?=
 =?utf-8?B?V0NOUSs4Q3VRWVlmTUJCSmFvZzkzSkQ4cHBrWmNFYWcwWks3MjA2V0ZhdFJl?=
 =?utf-8?B?V3FraGZ3R2xpUWs3WUpodUdOMnIrWllkZExGcU9WNGZ1RnhDd08vakhSUk9M?=
 =?utf-8?B?TWRvTE5kcHBmMTZJanZEYjdadE5NNUV6Z0NjSGJ0UzJRazVvQWVseGVzNDdH?=
 =?utf-8?B?TkpkUnBxYTVSbDBIcTRWUEhnLytMWkxuMytuZ1F5ZG1rbXhRemhnZFVqbXl2?=
 =?utf-8?B?aGdZbUpLYVp6M1ZGT1JIdHMvbGgwak1nN0RLczFoUzBLS3lMYkVWNG9Cdlhl?=
 =?utf-8?B?V3lEZ2k1R1MyRnlSdU5OcFFqN1ozNjE2OGhIbHpvSEpWMGk4RUtaOUZhUlZ4?=
 =?utf-8?B?K05sZ0sxcjcvb3dveEFDQ0dsVXNDRWUzYUZ3T2lQWUtSczR5Z0MrcWllbTFQ?=
 =?utf-8?B?aitzc1BteGZyeWZsdGJ1dTlQQnE2VWtYYTRRalF5RkpQVjg4QTFsOFVDejNK?=
 =?utf-8?B?ZnVQdkMvYkUwdWNndGRxeGtOTnNmbjU5U3EyNC9pNGxxem9OOEVMRnhTUi9t?=
 =?utf-8?Q?NDiYaWd/IsKmjVsnpIj+wzCA0B0eOs8wAMBwI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z200Qmx5emJDTkFzbEhTVXFwZGFWM0RHYlFzeXd6VmU5T0NranlCaDl0M1Vv?=
 =?utf-8?B?WllVMUdwNmd3cytsUUVRRTBUUGhRU2xIV1YyYkZhUk1uaW9PZEsyWTViaTJx?=
 =?utf-8?B?ZUFwa1lhaXpDMmFPYmRjbnJYNXRDN1BydFJKckovNjYza0NVLzdlVXdPWTBG?=
 =?utf-8?B?UHBMcEs0OVVLbXdQVVQxaTVUTEdHcjJ4dzVLZm1KSGY0K3NyR1NnZHkwTERO?=
 =?utf-8?B?enBON0NpM1ZDZU1JdHZhT3lQZE42cGZLY0lUQVRQSzRIbTNNU2FjeUxaeE5Y?=
 =?utf-8?B?VllPTlg4RnVZRThmR3lQSVErVlZObWdIc1B5RGtZOUZuQ0hqYTlDWkMvUVFT?=
 =?utf-8?B?Y21WWHA1djlwdHlpZ29lLzhuQmttZUtoQ3JaUFpjR2tHRXFYcElKRVNRaE1Q?=
 =?utf-8?B?WEFHVDFPWThDVXhWM05rczFUWkNDL0VLTVJPR0tSclcvREhNYVhjN05PTkFo?=
 =?utf-8?B?R0ZqcWJjVUw0a0JISXVUOFFOYnExeUs3Z2ZobGQzWWxTQjk3QmdyZnhZSkxB?=
 =?utf-8?B?bXhPQ0dXRXh4dUJ4N2FSY29MYnJGejEvYlVlWVJvdkdQM2RRWEFJeWtTZ1NF?=
 =?utf-8?B?YVRCS2lmb3VSL0JJZ0I3T0ZPcVJtVlFBaDV2YU0zV3JLUDFmcFNtMU5EUGpQ?=
 =?utf-8?B?UEdnS0pWQnJ0YlRYNnVIdkZoZVA3d3FqaFBOQnhYYWxxRGsyWDU5Q2xySWNL?=
 =?utf-8?B?c0U5UWxwZTlabDV4R2RndGFkNEhrVmRDazl4ZWY0R3R1ZEFyeGpPR0xJY0RL?=
 =?utf-8?B?V3o1dHZiNnhXUENPQy96L3ltemtEenZJdHZ4N2tCMXpPdzhyRVo5bVIrb3lV?=
 =?utf-8?B?RUJ1Z3g1d1p4Z2NJMmZHOFh3dnZnT0xmcFRvdjZwbVc4T1k0V3cybEZQU0xn?=
 =?utf-8?B?bjJTOEdTaVBWdXAyTnpjejhjR0hYd3dTSXNHRjZGUklhYTRaZHI5TmZkaVI5?=
 =?utf-8?B?WFdSR0NQai83RXhVemZrY0xiaTRXekQxS0xyaklkVVlZK3FGSnlhN3VCeGxa?=
 =?utf-8?B?bDlHYXlxQ09BczVLTU5rK2xIa0tpckU1NUdrQUZoSXNYVExNY3NvbVBMM0c2?=
 =?utf-8?B?WXg3alpFdnc2RFhvSHJKWGRjRlIxM2E3VDYwTjRKMGlVUVdzZzZMSCswMSth?=
 =?utf-8?B?UnZGZW00eFlSVVhnUUduV2oxemxGVFV3eDFzUXlYcDlWM2ZNd3dBNVNZbThq?=
 =?utf-8?B?YzRtUEFrVGRhVEx6aVhOVFIwbW9HS1hmc1VLSlhvZlY1bCtrVE1JcWFHMDRN?=
 =?utf-8?B?U0ZtL2IrN1pLTmU5My9UMlNSSTcydXRoVWhNSFhGVElIazZyRTYzSE9WN0Ny?=
 =?utf-8?B?eDlqRFJ2RnFDZFVRdWs3S0Q4M1ZENnF6Y1QwZnptZTErbTF0SHp6MGpkUXBi?=
 =?utf-8?B?empIU2ZnY3hRcWNCSGJodnRSUkcvWXBUOFZnZzJiYkE0UFNYOUhwZFhVUUJI?=
 =?utf-8?B?bTJzbHVncVZrazJ0N3BpMHorakwvWnZvd1lyclZjTFdxY2crV09EUkZvSERw?=
 =?utf-8?B?d2JEdmxUaGFIZlBqUnRrdEtRdTRrbXZPelg0cFlvUkNvbFR6dDRGa0ZPelBE?=
 =?utf-8?B?a0RVR2VuQmVlRkx3cFQxeTFiWE5CSzlvMVJ1TGhpSCt5M1hnd0RRaFBnMHIz?=
 =?utf-8?B?YllEVmZZMGhSdkRsVDdGVElmUzE0dlZLcDdudVFPSlQyRjhlTUdVckY4OWZB?=
 =?utf-8?B?OFkwUVNlbzNNSW5LV2NSMFZiTUQwTVlIOVplbnVpaEd5VnBhOFp1My9LQ3BY?=
 =?utf-8?B?OGk3Z052Zi8zUXd1OWEvVThpNm9DTWp0NHYyV0VjbjV3UGc4L0tJN0N1N2JC?=
 =?utf-8?B?ZnF6SlFaRjlxaGxHc2FZWjhlMXZZdEloQTVHSlBBWStlYVdhRmpoQWRkSmRL?=
 =?utf-8?B?eEVtRDRVQlVRL3NHc0ppR3FJd2p0UWZEcEhoTFROL3pYNTlOTXBHcllkWHVN?=
 =?utf-8?B?b29JQmZCaFFLUzM1NHRGYmw1ZzhZZDM0b1BSWEdtS3BPbmY4d1FFcnBjT2E2?=
 =?utf-8?B?MmE4dVNBSDBXRG1Ia2pJOHM4MnZzVERndmIzbCtoajVaTDVOdyt1THJuZDgv?=
 =?utf-8?B?KzNURjBnTGU3bTdMKzdzTSthZWlLYmVZQVpyb1J3cW1FdFc3VDFESkw3Um5V?=
 =?utf-8?Q?xrw6mk1J4b/Coe76LMN2ejDfd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5adddb9-64bc-447d-f22f-08dcb6faac8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 16:04:53.2442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTP2WEDRFF4fJMGbfVFvsnVo/bvi4E3SZrRXxUb83c7MvoO/MF8W3LppAdMz100WprHFvMWqPkcuyD6vbYY3gqGKdRPIZIhi5kpctAU8OEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
X-OriginatorOrg: intel.com

PiBPbiBXZWQsIDIwMjQtMDgtMDcgYXQgMTE6MjggKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3Jv
dGU6DQo+ID4gPiBPbiBUdWUsIDIwMjQtMDgtMDYgYXQgMTU6NTEgKzAwMDAsIENsYXVkaW8gU2lx
dWVpcmEgZGUgQ2FydmFsaG8NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDIwMjQtMDgt
MDYgYXQgMDg6MjEgKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3JvdGU6DQo+ID4gPiA+ID4gPiBP
biBNb24sIDIwMjQtMDgtMDUgYXQgMDk6NTUgKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3JvdGU6
DQo+ID4gPiA+ID4gPiA+ID4gT24gRnJpLCAyMDI0LTA4LTAyIGF0IDE4OjU0IC0wNzAwLCBEaW9u
bmEgQW1hbGllIEdsYXplDQo+ID4gPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBbLi4u
XQ0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gVGhhdCBicmluZ3MgbWUgdG8gYSBj
dXJpb3VzIHBvaW50OiBpcyB0aGUgSW50ZWwgVERYIFNWU00NCj4gPiA+ID4gPiA+ID4gPiBnb2lu
ZyB0byBmb2xsb3cgdGhlIFNWU00gcHJvdG9jb2wgaW50ZXJmYWNlP8KgIGJlY2F1c2UgaWYNCj4g
PiA+ID4gPiA+ID4gPiBpdA0KPiA+ID4gPiA+ID4gPiA+IGlzLCBpdCB3aWxsIG5hdHVyYWxseSBp
bmhlcml0IHRoZSBlbmxpZ2h0ZW5lZCBpbnRlcmZhY2UNCj4gPiA+ID4gPiA+ID4gPiAodGhlDQo+
ID4gPiA+ID4gPiA+ID4gY29kZSB3aWxsIGJlIHByZXNlbnQgaW4gdGhlIGtlcm5lbCwgc28gaXQg
b25seSBuZWVkcw0KPiA+ID4gPiA+ID4gPiA+IGFjdGl2YXRpbmcpLsKgIEhvd2V2ZXIsIGlmIHRo
ZSBJbnRlbCBTVlNNIHdlcmUgZ29pbmcgdG8NCj4gPiA+ID4gPiA+ID4gPiBpZ25vcmUNCj4gPiA+
ID4gPiA+ID4gPiB0aGUgU1ZTTSBwcm90b2NvbCBzcGVjIHRoZW4gaXQgd291bGQgaGF2ZSB0byBy
ZWludmVudA0KPiA+ID4gPiA+ID4gPiA+IGV2ZXJ5dGhpbmcgYW5kIHRoZSBDUkIgaW50ZXJmYWNl
IG1pZ2h0IG1ha2UgbW9yZSBzZW5zZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSSBj
YW5ub3Qgc3BlYWsgb24gYmVoYWxmIG9mIHRoZSBJbnRlbCBURFggKlNWU00qDQo+ID4gPiA+ID4g
PiA+IGltcGxlbWVudGF0aW9uLCBidXQgZm9yIHRoZSBMaW51eCBndWVzdCBrZXJuZWwgdGhlcmUg
aXMgbm8NCj4gPiA+ID4gPiA+ID4gaW50ZW50aW9uIGF0IHRoZSBtb21lbnQgdG8gc3VwcG9ydCBz
bXRoIGxpa2UgU1ZTTSBwcm90b2NvbA0KPiA+ID4gPiA+ID4gPiBpbnRlcmZhY2UuIFdlIGhhdmUg
bWFkZSBhbiBldmFsdWF0aW9uIG9uIHRoaXMgZHVyaW5nIHRoZQ0KPiA+ID4gPiA+ID4gPiBzcHJp
bmcuIFRoZXJlIGFyZSBubyB1c2VjYXNlcyBjdXJyZW50bHkgdGhhdCByZXF1aXJlIHN1Y2gNCj4g
PiA+ID4gPiA+ID4gbmV3DQo+ID4gPiA+ID4gPiA+IHByb3RvY29sIGludHJvZHVjdGlvbiBvbiBJ
bnRlbCBURFggYW5kIGl0IGRvZXMgYnJpbmcNCj4gPiA+ID4gPiA+ID4gYWRkaXRpb25hbA0KPiA+
ID4gPiA+ID4gPiBjb2RlIGNvbXBsZXhpdHksIGV0Yy4gSWYgYW55b25lIGJlbGlldmVzIG90aGVy
d2lzZSwgcGxlYXNlDQo+ID4gPiA+ID4gPiA+IGxldA0KPiA+ID4gPiA+ID4gPiBtZSBrbm93Lg0K
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IElmIHlvdSByZWludmVudCB0aGUgdlRQTSBjb21tdW5p
Y2F0aW9uIGludGVyZmFjZSwgSSBjYW4gc2VlDQo+ID4gPiA+ID4gPiB5b3UNCj4gPiA+ID4gPiA+
IGFyZSBhYmxlIHRvIGdldCBhd2F5IHdpdGhvdXQgdGhhdCBTVlNNIGNvbW11bmljYXRpb24NCj4g
PiA+ID4gPiA+IGNvbXBvbmVudC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoZSBnb2FsIGlzIGV4
YWN0bHkgdGhlIG9wcG9zaXRlLCBpLmUuIGRvbid0IHJlaW52ZW50IGFueXRoaW5nLA0KPiA+ID4g
PiA+IGJ1dA0KPiA+ID4gPiA+IHRyeSB0byBzdGljayB3aXRoIGV4aXRpbmcgd2F5cyBvbiBob3cg
d2UgaGF2ZSBiZWVuIGRvaW5nIHRoaW5ncw0KPiA+ID4gPiA+IHNvDQo+ID4gPiA+ID4gZmFyIGlu
IExpbnV4LiBJbiB0aGlzIGxpZ2h0IFNWU00gaXMgYW4gaW52ZW50aW9uIHRvIGRvIHRoaW5ncy4N
Cj4gPiA+ID4NCj4gPiA+ID4gSG93IHdpbGwgSW50ZWwgYXR0ZXN0IHRoZSBTVlNNIHNlcnZpY2Vz
IHByb3ZpZGVkPw0KPiA+ID4NCj4gPiA+IEl0J3MgaW4gdGhlIGRvY3VtZW50IHRoZXkgcHJvdmlk
ZWQgYXQgdGhlIHRvcCBvZiB0aGlzIHRocmVhZC7CoCBJDQo+ID4gPiBnYXZlDQo+ID4gPiBhbiBh
bmFseXNpcyBoZXJlOg0KPiA+ID4NCj4gPiA+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8xM2VhMzFlMjZhOTg5MTcyMjc0OGM1ZDZlODIzZjc3YjZjOGI3ODA5LmNhDQo+ID4gPiBtZWxA
SGFuc2VuUGFydG5lcnNoaXAuY29tLw0KPiA+ID4NCj4gPiA+IEJ1dCBiYXNpY2FsbHkgaXQncyB0
aGUgb2xkIHRyaWNrIG9mIHVzaW5nIGEgaGFzaCBvZiB0aGUgcHVibGljIEVLDQo+ID4gPiBhcw0K
PiA+ID4gdGhlIG5vbmNlIGZvciBhIFREWCBhdGVzdGF0aW9uIHJlcG9ydCBhbmQgd3JhcHBpbmcg
aXQgaW4gYW4gRUsNCj4gPiA+IGNlcnRpZmljYXRlLsKgIFRoZSBwcm9ibGVtIGlzIGl0IGRvZXNu
J3QgYWxsb3cgdGhlIGF0dGVzdGluZyBhZ2VudA0KPiA+ID4gdG8NCj4gPiA+IHN1cHBseSB0aGUg
Y2hhbGxlbmdlIChub25jZSkgc28gaXQncyBub3QgYmVzdCBwcmFjdGljZS4NCj4gPg0KPiA+IEFz
IHlvdSB5b3Vyc2VsZiBtZW50aW9uZWQgZWFybGllciwgZm9yIGVwaGVtZXJhbCB2VFBNIGl0IGlz
DQo+ID4gYWNjZXB0YWJsZS4gUGVyc2lzdGVudCB2VFBNIGhhcyBub3QgYmVlbiBpbiBzY29wZSBv
ZiB0aGlzIGN1cnJlbnQNCj4gPiByZWxlYXNlIHNvIHRoZSByZXF1aXJlbWVudCB0byBwcm92aXNp
b24gdGhlIG5vbmNlIGhhc27igJl0IGJlZW4NCj4gPiB0aGVyZS4gQWdhaW4sIG9uY2UgSmlld2Vu
IGNvbWVzIGJhY2sgZnJvbSB0aGUgdmFjYXRpb24sIGhlIGNhbg0KPiA+IHNoYXJlIGhpcyB0aG91
Z2h0cyBvbiBob3cgcGVyc2lzdGVudCB2VFBNIGNhbiBiZSBpbXBsZW1lbnRlZA0KPiA+IGluIHRo
ZSBmdXR1cmUuDQo+IA0KPiBTdXJlIC4uLiB0aGUgcGxhbiB3YXMgYWx3YXlzIHRvIGRvIGVwaGVt
ZXJhbCBmaXJzdCBiZWNhdXNlIGl0J3MgZWFzaWVyLg0KPiBUaGUgYmVzdCBwcmFjdGljZSBjb21t
ZW50IGlzIHdoYXQgdGhlIHNlY3VyaXR5IGd1eXMgdG9sZCBtZSB3aGVuIEkNCj4gcHJlc2VudGVk
IHRoZSBwdWJsaWMga2V5IGhhc2ggYXMgbm9uY2Ugc2NoZW1lLiAgVGhleSBjYW4ndCBmaW5kIGFu
DQo+IGFjdHVhbCBzZWN1cml0eSBmbGF3IGluIGl0LCBidXQgdGhleSBzYXkgaXQncyBiZXN0IHBy
YWN0aWNlIHRvIGxldCB0aGUNCj4gcmVseWluZyBwYXJ0eSBzdXBwbHkgdGhlIG5vbmNlLg0KPiAN
Cj4gPiBZb3Uga2VlcCBwb2ludGluZyBvdXQgdGhlIHByb2JsZW0gb2YgdGhlICdhYnNlbnQgbm9u
Y2UnOiBpdCBpcyBub3QNCj4gPiBwb3NzaWJsZSBmb3IgYXR0ZXN0aW5nIGFnZW50IHRvIHByb3Zp
ZGUgYSBub25jZSB0byBiZSBpbmNsdWRlZCBpbnRvDQo+ID4gYXR0ZXN0YXRpb24gcmVwb3J0L3F1
b3RlIGFuZCBzYXlpbmcgdGhhdCB3ZSBhcmUgbWlzc2luZyBhbiBpbnRlcmZhY2UNCj4gPiBmcm9t
IHRoZSBPUyBndWVzdCAoTDIgZ3Vlc3QpIHRvIFNWU00gdG8gc3VwcGx5IHRoaXMgbm9uY2UgdG8g
dGhlDQo+ID4gU1ZTTS4gSXMgdGhpcyBjb3JyZWN0IHN1bW1hcnk/IElmIHllcywgd2UgaGF2ZSBh
biBleGl0aW5nIGludGVyZmFjZQ0KPiA+IGluIExpbnV4IE9TIHRvIGFzayBmb3IgdGhlIHJlcG9y
dC9xdW90ZSB2aWEgY29uZmlnZnMtdHNtIGludGVyZmFjZQ0KPiA+IHdoZXJlIGEgZnJlc2ggbm9u
Y2UgKG9yIGFueXRoaW5nIHlvdSBuZWVkKSBjYW4gYmUgcHJvdmlkZWQuDQo+IA0KPiBPSywgc28g
bm93IEknbSBjb25mdXNlZCBhZ2Fpbi4gIEluIG9yZGVyIHRvIGJlIHJlbGlhYmxlLCB0aGUgdlRQ
TQ0KPiBhdHRlc3RhdGlvbiByZXBvcnQgbXVzdCBwcm92YWJseSBjb21lIG9ubHkgZnJvbSB0aGUg
U1ZTTS4gIFdpdGggQU1EIHdlDQo+IGNhbiBkbyB0aGlzIGJlY2F1c2UgdGhlIFZNUEwgbGV2ZWwg
dGhlIHJlcG9ydCB3YXMgZ2VuZXJhdGVkIGF0IGlzDQo+IGluY2x1ZGVkIGluIHRoZSBzaWduZWQg
ZGF0YSwgc28gVk1QTDAgcHJvdmVzIGl0IHdhcyBmcm9tIHRoZSBTVlNNLg0KPiBOb3RoaW5nIHBy
ZXZlbnRzIHRoZSBndWVzdCBmcm9tIGdlbmVyYXRpbmcgYW4gYWxtb3N0IGlkZW50aWNhbCByZXBv
cnQNCj4gdXNpbmcgdGhlIGF0dGVzdGF0aW9uIEFQSXMsIGJ1dCB0aGF0IHJlcG9ydCB3b3VsZCBo
YXZlIFZNUEwyIGFzIHRoZQ0KPiByZXBvcnRpbmcgbGV2ZWwgcHJvdmluZyBpdCBkaWRuJ3QgY29t
ZSBmcm9tIHRoZSBTVlNNLg0KDQpJdCB3b3VsZCB3b3JrIGRpZmZlcmVudGx5IGluIGNhc2Ugb2Yg
VERYLiBJZiBMMiBndWVzdCBhc2tzIGZvciBhbiBhdHRlc3RhdGlvbg0KcmVwb3J0IHZpYSBUREcu
TVIuUkVQT1JUIChhbmQgcHJvdmlkZXMgYSBub25jZSksIGl0IHdpbGwgZ2VuZXJhdGUgYW4NCkwy
IC0+IEwxIGV4aXQgYW5kIG5vIHJlcG9ydCB3aWxsIGJlIGNyZWF0ZWQgYXQgdGhpcyBwb2ludC4N
ClRoZW4gTDEgY2FuIGFzayBmb3IgYW4gYWN0dWFsIHJlcG9ydCB2aWEgb25jZSBhZ2FpbiBjYWxs
aW5nIFRERy5NUi5SRVBPUlQNCmFuZCBpdCBoYXMgYSB3YXkgdG8gaW5zZXJ0IGFueXRoaW5nIGlu
IHRoZSByZXBvcnQgZGF0YSwgaW5jbHVkaW5nIG5vbmNlDQpmcm9tIHRoZSBMMi4gDQoNCj4gDQo+
IEkgdGhvdWdodCBJIHBpY2tlZCB1cCBmcm9tIHRoZSBzbGlkZXMgdGhhdCB0aGUgZXF1aXZhbGVu
dCBJbnRlbCBzY2hlbWUNCj4gcG9pc29ucyBhbGwgdGhlIFJUTVJzIHdpdGggYSBzZXBhcmF0b3Ig
YmVmb3JlIHRyYW5zaXRpb25pbmcgZnJvbSB0aGUNCj4gU1ZTTSB0byB0aGUgZ3Vlc3QgKHNvIGFm
dGVyIGdlbmVyYXRpbmcgdGhlIHZUUE0gcmVwb3J0KT8gIFdoaWNoIHNlZW1zDQo+IHRvIGluZGlj
YXRlIHRoYXQgYWZ0ZXIgdGhpcyBpcyBkb25lLCBldmVuIHRoZSBTVlNNIGNhbid0IGdlbmVyYXRl
DQo+IHJlcG9ydHMgd2l0aCBTVlNNIHByb3ZlbmFuY2UgYW55IG1vcmUuDQoNCkFnYWluLCB0aGlz
IGlzIHRoZSBjdXJyZW50IGRlc2lnbiBvZiBlcGhlbWVyYWwgdlRQTS4gVGhlIHNwZWMgZG9lc27i
gJl0DQp0YWxrIGFib3V0IHRoZSBwZXJzaXN0ZW50IGNhc2UgYXQgYWxsLiANCkFib3ZlIEkgd2Fz
IG9ubHkgdHJ5aW5nIHRvIGV4cGxhaW4gaG93IHRoZSBub25jZSBkZWxpdmVyeSBhbmQgYXNraW5n
DQpmb3IgcmVwb3J0IGNhbiB3b3JrIGZyb20gTDIgZ3Vlc3QuIEhvdyB5b3UgY29ubmVjdCBpdCB0
byB0aGUgcGVyc2lzdGVudA0KdlRQTSBkZXNpZ24gbmVlZHMgdG8gYmUgZGVmaW5lZCBzdGlsbC4g
DQoNCj4gDQo+ID4gVGhpcyBpbnRlcmZhY2UgY2FuIGJlIHVzZWQgd2l0aG91dCBtb2RpZmljYXRp
b25zIGZyb20NCj4gPiBMMiBndWVzdCBhbHNvICh3aXRoIFNWU00gZW11bGF0aW9uIHN1cHBvcnQg
b2YgY291cnNlKS4NCj4gPiBUaGUgcmVzdCBpcyB1cCB0byB2VFBNIGFuZCBTVlNNIGRlc2lnbiBv
biBob3cgdG8gcGx1ZyB0aGlzIGludG8NCj4gPiBwZXJzaXN0ZW50IHZUUE0gYXJjaGl0ZWN0dXJl
Lg0KPiANCj4gU28gSSdtIHN1cmUgeW91IGNhbiBjb21lIHVwIHdpdGggYSBkaWZmZXJlbnQgc2No
ZW1lIHRvIGlkZW50aWZ5IGFuIFNWU00NCj4gcHJvZHVjZWQgcmVwb3J0IHRoYXQgd2lsbCB3b3Jr
IGFmdGVyIGl0IGhhcyB0cmFuc2l0aW9uZWQgdG8gdGhlIGd1ZXN0LA0KPiBidXQgaW4gb3JkZXIg
dG8gaGF2ZSB0aGUgU1ZTTSBnZW5lcmF0ZSB0aGUgcmVwb3J0LCB5b3UnbGwgc3RpbGwgaGF2ZSB0
bw0KPiBjb21tdW5pY2F0ZSB3aXRoIGl0ICh0byB0ZWxsIGl0IHRoZSBub25jZSBhbmQgcmV0cmll
dmUgdGhlIHJlcG9ydCkuDQoNClllcywgdGhpcyBpcyBleGFjdGx5IHdoYXQgSSB3YXMgdHJ5aW5n
IHRvIGV4cGxhaW4gLSBpdCBjYW4gYmUgZG9uZSB2aWEgZXhpc3RpbmcNClRERy5NUi5SRVBPUlQg
Y2FsbCBib3RoIGluIEwyICh3aXRoIEwxIGFzc2lzdGFuY2UpIGFuZCBpbiBMMS4gDQoNCkJlc3Qg
UmVnYXJkcywNCkVsZW5hLg0KPiANCj4gSmFtZXMNCg0K
