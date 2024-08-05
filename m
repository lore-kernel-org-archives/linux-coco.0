Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4810953
	for <linux-coco@lists.linux.dev>; Mon,  5 Aug 2024 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722851720; cv=fail; b=E/rXzPkzDfsaCZsOHggGvyVS9cmzZXWKOYgVb7+it7CxHdEPOhKr6rlghC0q2j6B8aKceyxKsIY/WxtGd51Kuenur/TcWrC+hqrXvWzOmbqXMABWYijrcJPzrFbLCUObo7/hB8Sn9CiNgjtL4t7U2GXgg3gPu2eMSyY6H74JAv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722851720; c=relaxed/simple;
	bh=yEhQBpYvG6E3N2FEYYL7M4h+ZUk4lzRPIKZ3nul/BeE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pBPYoqxfZYKOjQlaloFqubYJVxV/n8FQ9XV1QwUJdXpm4dbeiVL7pLGC/eSRED3VhEXzsFuoo/UKlpZ0cxCvORzxE4b3QyKDEgbeYDhtLjel29wV2nLNM16lyY0RAD+/MR+uKM89idUZN/mawHkKf1MsULvxNZ1Fe7/FVS1U5k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdUPk13p; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdUPk13p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722851718; x=1754387718;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yEhQBpYvG6E3N2FEYYL7M4h+ZUk4lzRPIKZ3nul/BeE=;
  b=KdUPk13pqjg+8i9eCdoowtFvOuj4yA+lrNMROgN96+VGi7Wo9mCdwUUy
   1d6aGPk1FUjjtRgbInYWxdMW6/4Wnvq0ihK+xvXdlK0eACINq4JphjpjG
   ynQqB23hcyJXkVmEOBXVL4vNA6yjuBLAoMykILuxC5OLt9yzoV4G216lh
   57+sAc0aC8lNtMTh94v7q5fsFs4nI8pxSC7Qwft1ZnN02WHRQovdw/h8p
   8MmIFtpxFSS/Lj4MFzhHDbndiPJNMBGdJRezRQbSOtpI+Jq7Moo230TlI
   JJdONJRFSkWZIsq8Jim5V31Tpz/5hzBD27yVeNbjH+g3I6UrOAwS0ua8X
   Q==;
X-CSE-ConnectionGUID: 7ctums5aSCSjaO5pXN+DrA==
X-CSE-MsgGUID: xP7W374OQGOPU47VPnUorg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31432842"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="31432842"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 02:55:17 -0700
X-CSE-ConnectionGUID: 3hczI1p3Q2qMpFeKVvP5iA==
X-CSE-MsgGUID: y5lOq+6MRyCeJJC7pdQX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="79391556"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Aug 2024 02:55:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 02:55:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 02:55:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 02:55:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFvXaDWxsSzBERImR/WtymjoD0HOr4x9+W28ZBQuuEbxGl0V2pyTIiJAqzaHp0ZHrsPSkr/HdyPaepjY82OWBtW5Qp9+pUVv4T5Hs6ADdrjlHMArQ3e4Vnw1aS1zVMqKusQ7HSdau1mTojMLLrSC6J2qYSOrDOidWmQl0h1Oq+7c7JQXoggm3lJXw/o+zQmciipTqcq8yyL5In4RyiNGOOhhmhT/xqvwYFkkPy4zNIXEtf9vxFDPzvrk7RIvV70RQLArnbmYBY3A51q86Y0EmayeYZYs6KzLn6B34DoTa7Jz9+caA/DFpvelhliLtot3b+Oam18harMp5kaKzbGvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEhQBpYvG6E3N2FEYYL7M4h+ZUk4lzRPIKZ3nul/BeE=;
 b=VXj1zqQiyCuye+ELuitw4GJSI+5vloA+d5FXrAMwx0UWjnM8+ipzYjvDWyIKi6pJMbBnjJv/GbyvqtZwFcMhXDdwq6e3cjXQQFC8hN3pCy1kgy73d9YQLv81Bez2NMz4mfAapDI4FC44TuI7HZ6nuGGwn/dSUkA4Ej5tOkf3n+TlTHzLyWOBtufAA/hJ8oLK8MWqbXg2Vp0osvbK80pU1bDElk3sDafS0Yu0JZORm/mp6vPtvOR5nQ/6LU+1toVHc98fbuRNvzoNk3ssU0tmsemc6Tdr4SCMBfG5i7SPe7oEbid0egyo6Cf4m+eUJIqmS/1PFchiMM9O0jO8sgmzBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 09:55:13 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 09:55:13 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, "Dionna Amalie
 Glaze" <dionnaglaze@google.com>
CC: "Yao, Jiewen" <jiewen.yao@intel.com>, "jejb@linux.ibm.com"
	<jejb@linux.ibm.com>, Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>,
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
	=?utf-8?B?UsO2ZGVsLCBKw7ZyZw==?= <jroedel@suse.com>, "Lange, Jon"
	<jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>, "Johnson, Simon
 P" <simon.p.johnson@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9SCoxtMRLFK0GjoRY90TKvZ7ITK4eAgAEdeICAAKutAIAABwuAgAOiBfA=
Date: Mon, 5 Aug 2024 09:55:12 +0000
Message-ID: <DM8PR11MB575078E846B4E1E70D6A317AE7BE2@DM8PR11MB5750.namprd11.prod.outlook.com>
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
In-Reply-To: <f809dfb51e14d93ec5538fba31d3d1478d69484c.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|DS0PR11MB7264:EE_
x-ms-office365-filtering-correlation-id: 15b72ddb-df99-4f4a-6c73-08dcb534b347
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akRUSzFnb1RYN1RYVURhTUNjcUpLR3Y1Nmk4VzF3OU5rOWZCSFE2OEZnT2Qv?=
 =?utf-8?B?MitUMUF6SWRDSnMzbEtrSlpyY2FoUzYzM1lBUkFnQzFaSTRraENyVXFGSkxP?=
 =?utf-8?B?U2p5UXBhV1RzWkVGd0NnSDRFWG05bTBBSk5TVnNOdzBrZThpOGFxU1JENHF2?=
 =?utf-8?B?T3drdDYzc3ltcGNKQ2NXS2F5SXpVNW92TzVNSE1yRUpIMG5VVjdhclA3V2JC?=
 =?utf-8?B?V3JLbXkwa2NXTU5XbGg2NzdYNmN1SWttMFYxT2duMFp0OXlIRWsxNWd2R3U1?=
 =?utf-8?B?ZHVJWGtIR05xcFZNejdEU2ZzZWRyMC9VYnFYV2lUV0IzSmU5NHUyVGc0SG5x?=
 =?utf-8?B?WVFLWnMwVlN0WkkvZVJjQVo4YUZnczZxbDBkREZCbEl3Ni9BQ0RtQ1N4QWIz?=
 =?utf-8?B?L2tmcU5mSmxUVzc0NkZkWjFRUTRJYlhEWXdIVmw0c2J5eGxkdDVVd3BTeklK?=
 =?utf-8?B?QVdnRlgrSCtOeER2SS9BSmlWVXJYZitac3B2VnUxeUVKNmVONWN0SHNhQ0o2?=
 =?utf-8?B?TEJtYjVuQ2toUFVMRE8xa3JmZU5OM3BGNm9rd3JGbFI4MG5HQUNLcUpZWExG?=
 =?utf-8?B?YVRoMGhFcDFDaXZXRXoreHk3WU9sd0c5TGk1TlNub0l0ZUl0aTdNZWEyNVR6?=
 =?utf-8?B?NS9xSllId05PaWNWaEVEYlRGMWIyMVYrTVhYZWxRNU9UczIxMDA2NjdPRFlU?=
 =?utf-8?B?RzFPaWRhak0zQW1QK09VaVBOekNJM2FHYWluRlJyZWVGQzVBaENPWTR3dFYv?=
 =?utf-8?B?QlRTREhxazIrTUhsNzdScGdDQjdaRCtCTkNzWjFRVlFWQmJxSzk0b2JFTWJp?=
 =?utf-8?B?Rm9GeUlMNTdrdmloY1EwUzYvNUtZallsclZtZ2JGTjhJeVh2ekJWMnh2aFE5?=
 =?utf-8?B?TERtc0s3NVJCWGJjeWlGdEFJZDA0NEk0bnh0Ym5MYUJpOWpPV3lBdnJwTU14?=
 =?utf-8?B?a1dlR2ZCU1FZa1ZUUWVtRWJYelNTVFNETnlUM0lJL1hNbHhMZ1hXc2dVRjdu?=
 =?utf-8?B?bnREZlJleWZnKzAyenQwT0FDRFdjTU1UaFZxM0R3RHZ5VnZrSk1kRGY4WFRr?=
 =?utf-8?B?Q2VvaS85ME1pOXhGSDFZeCtnYnkwVzArR2MxYkxFUEozc3BDeE53TTEzQ2tC?=
 =?utf-8?B?c2QrRDNBSUFoQkd4VHM4VG5kYTk5STJuSUFFL1NrV2pKMUlwU2dVRzZ4TzVr?=
 =?utf-8?B?UkMrSzZPZ05pTm0rQWNRYW1UdmN1Yk90RnVyNkN1SUNMWjR3S3dyMTYrVmdO?=
 =?utf-8?B?ajJCU1VteFlvejdsNENXNUJCY1Z3SFR0bkJrUk5lVzBOb05oMHF1SzFlSGps?=
 =?utf-8?B?dEdIY0xSMTNMMU83dy9XWW4rL1Npc0xOcjdoOWk0Q3NnWmJYM3U0czZTbDY4?=
 =?utf-8?B?NHVqMmJ1QW1VSFZaS2NWbjdKK2xOcGt4dG5HTjYvaFdPejVucVJ2WkxyWlNz?=
 =?utf-8?B?QmxEYmpiN3lMOG40czlOV2prMWZiamQ0NVBXdmFjTFpueUtZRm5wRFNTdGJS?=
 =?utf-8?B?QTVvYlJkdisrR1YwKzVDa09QSzJhZUgxNlFmRVg5QzB3LzFEdk43eGtNajhB?=
 =?utf-8?B?dTI2QU1JeCs0WFZWcDcwSThLWTdscGcrY2k4Rk15bC9RTGdiV2VNOVc4cW1L?=
 =?utf-8?B?YStJa3FFYjhXb2tWWEtZK3liZFhPRzllSlJ2bGs3OWtoTkZERU1DdEl6ZGFR?=
 =?utf-8?B?akZRV05pbURTYkJ5a2JnVkFTcFdmeEd6ZTF3aUdPY3piUmZjc0FhOUhyVEE5?=
 =?utf-8?B?L3BPTy8ra21hUkdTRXRLSkt3Q0R0TVdBaXlSNHhaQTRYak02Z1dsRVVad1pR?=
 =?utf-8?Q?qdTlJVoC6TpLS32Fkx+wV05erxbW+7t7DbwOc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3lvNzc4MlluK3QwZFBEb2VXcGlSUGlPbkpKZnk2YnVDL3pPZ1BOMlRGUytP?=
 =?utf-8?B?VWRMdWdHOVd6SFBDZEtiQmtNdWtQSm9XckJVNVdObTNXZVFMTUs1cWJ1V2RM?=
 =?utf-8?B?ekFKUnFZalBFZ1NhcWRIU2xNZkhvc2U4TGFZd25tT3BrQThIVXVDS1dTV1BN?=
 =?utf-8?B?VTVCWERkbE1XekQzRGw4azIwWlByQVU4ZnZqMmg2L2diNzQ1U1JnWTJyVWxq?=
 =?utf-8?B?Ti9mQ3FPaWc5ZFRzTmVNaUVxMDF5TjFleXM1enV0RXVQNXdxMnNrT2lDU29s?=
 =?utf-8?B?cGNKM0dUZXVmc2hjOFNjaVIwTmx4bHlaenRXM3h0UHN6VkVyN1o3RG12MTJz?=
 =?utf-8?B?ZFlveStycXdkdlBuYlozcjh2ZW5WSjRCN2NlS2laTkV2bjVHQURqYjVRR0wz?=
 =?utf-8?B?c0l3NUhoQmdLUTczWkd1dTdBZXdzMXRjR3dvdHRHZjhsOEpMSFMxN0RhdWpr?=
 =?utf-8?B?SHFaZ1FLeVRDR3RjZ2E5NG03dmVYeStNMjRQOXloWW8venNzKzNFU1d1WElL?=
 =?utf-8?B?djlCTS9NN210SEg3U2hOR3RPV05YTDErVlFNa0J3NHBOUnRJSVBlWmZUdDF2?=
 =?utf-8?B?V3MzSjV2NXd4cUpDemk3OGlTczFpa043OUJKNUprRnpKeFJCamx4V3RVVDNn?=
 =?utf-8?B?K0w3U1dqa3NTQlg0ZXFXaDEzSERpbVVVRHkxYStveHJ6RjMwYi9BL0szRldk?=
 =?utf-8?B?TFQ0bHRxYnBMVmRhN01UQ1ZuZHVwU3B6ZCt2TUFSVjVmQXNyTlRyWEo3aWlY?=
 =?utf-8?B?N0o3NU1LNHYvSjYvYXZzS05TWGE1SVpYUjAzTjlNaXVDNDNjU05McnNLUDNH?=
 =?utf-8?B?VG9TWDlZWUlnSFI1ZUttRVFCUmhUOGJkTmZmSzAwckN5bWlzWkQ4ZnB3ME5B?=
 =?utf-8?B?Z0lXNDJqcTVtUlR4M1NBZGp0d0NqM1ROR1VJLzhIV3RQN2FQZi81T3phSGk5?=
 =?utf-8?B?Q1hNdk9RZlBXSWtSdURGc3htMjdScGNaK1M4M2tDNEh5TFkyNFpMSU40dDV1?=
 =?utf-8?B?V29iYmU4ZWt6RUxsekxyL1hNbzZqQzE5c0RkYjIvSGZ4aDVpQ2tqN1c4NlNK?=
 =?utf-8?B?bDFGUnRqelczdjU2bWRsM3YrYnpIK211OFNiVmRvUWlpZGFwb2IwbkhBVTFB?=
 =?utf-8?B?aXFvT0kyY05TOVhLc3FKcDhGdERNVDNBcGdVK3IvcE1uVm05K25hMEt6a2Jt?=
 =?utf-8?B?eHFlOStNZGlacnJ1OGNaWCtqelNIeGF6bDMvS3NEQlFYTUtLL1ZZVncvc1p5?=
 =?utf-8?B?M1o3b3RtUHV6OWJMbFErMkp2Y2V2Z2V1RFFTZDJHYmsyQ2M1K0dEVnp5YTdL?=
 =?utf-8?B?VXhEM2JEcG4rTWM3N1JaSWQ5MFJlWGxYeUtSNDFidEp3QjBlVGRKYVphd2tT?=
 =?utf-8?B?WjZReU5uY21tN2JsSlVHYzhydmh0N3hPaTZMWjVraitoWDhWRk8ydkozQ2NW?=
 =?utf-8?B?dG80SFFRRHBBMFE4emc2cE5vQ1JFY251cEJrTGZsUDNHRXc5SENTT3lDTUJ5?=
 =?utf-8?B?Ykw2Q3c3YmQzRG5IcUZhYWVvMHdSbkg0YzlQMDMvelJXMjBUeVJnby9aUHZw?=
 =?utf-8?B?eEJISklQekJ1LzVnMEJwUnQrVy9lUnFWMzl3ekwvSENtY1BNZjJHVitXWVlE?=
 =?utf-8?B?VjN4S3U4SlVOSjhYUTJLdjd3azVXbEdSTFFJREF4cTdNNGNuSVVoVnNXREVU?=
 =?utf-8?B?Z0RTOVZUanNpS2FYQ1lVM1ZwczVhNm0rdVk1a1VoaFdnRkdoUlArT0ZQalVS?=
 =?utf-8?B?bngyMGR5MjVTUUJCY1B6T1RqL0p4YmhhMlZWRHZ6MnlKb1M3cERxd2FQbE4r?=
 =?utf-8?B?VXVGeWNZaDlHTEZzWEpPK0F4cHZsQU5iamtGUEU3dlIwWHlObzBKN3dkb294?=
 =?utf-8?B?LzBLTkRyd2I1d2UvMWlPUFNiVjdSTjI3M0pwdTY2Y3d3TUUwWkJsZ0g4Zjhy?=
 =?utf-8?B?aGF3ZWdTKzZBdTlqaUgyUVMzNE9sUlBsZWFzd1kxVDdDVVJoeWJLL2xtSmtx?=
 =?utf-8?B?NGh2MkFrWjc1dm9VM1VhOUVESFI3dE52NG1EMlhVNjNUd29TSlp1aWpadFVm?=
 =?utf-8?B?SThRZFA2TVorWndlSDJGb094VzNBaThlVmtpVFpKVHRPSnZHYjY5Q1g0WWtj?=
 =?utf-8?Q?b8DhnxbQ3fpqW9dUD5EJsSbWS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b72ddb-df99-4f4a-6c73-08dcb534b347
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 09:55:13.0094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lO2I7d6H98l5OcxrNp6g4u0kFaQ8vDvxpkKwlX1nbIt8Wq9mDjkLjfy5nCSvnh/W8bfK0++Q3blFXkHXnM/95Tr2fEeLgXlfL+R3C0izNm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
X-OriginatorOrg: intel.com

PiBPbiBGcmksIDIwMjQtMDgtMDIgYXQgMTg6NTQgLTA3MDAsIERpb25uYSBBbWFsaWUgR2xhemUg
d3JvdGU6DQo+ID4gTW9yZSBxdWVzdGlvbnMgLyBjb21tZW50cw0KPiA+DQo+ID4gMS4xICJHZXQg
VFBNIEFLIENlcnQgKHNpZ25lZCBieSBFSykiLiBUaGlzIGlzIHNvbWV0aGluZyBJIHRob3VnaHQg
Zm9yDQo+ID4gYSBsb25nIHRpbWUgdG9vLiBUaGF0J3Mgbm90IHdoYXQgdGhlIEVLIGRvZXMuIFRo
ZSBFSyBkb2VzIG5vdCBzaWduDQo+ID4gYW55dGhpbmcuIEl0J3MgdXNlZCBmb3IgcHJvdmluZyBv
d25lcnNoaXAgb2YgYm90aCBFSyBhbmQgQUsgZm9yDQo+ID4gQWN0aXZhdGVDcmVkZW50aWFsIHRv
IGdldCBhbiBBS2NlcnQgZnJvbSBhIHRydXN0ZWQgQ0EuDQo+ID4gV2hhdCBpcyB5b3VyIGludGVu
ZGVkIGNvbW11bmljYXRpb24gY2hhbm5lbCBiZXR3ZWVuIFNWU00gYW5kIGEgQ0EgZm9yDQo+ID4g
dGhpcyBjcmVkZW50aWFsIGFjdGl2YXRpb24/DQo+IA0KPiBXZWxsLCB0aGF0J3Mgb25seSBpZiB5
b3UgbmVlZCBhIHByaXZhY3kgcHJlc2VydmluZyBtZWNoYW5pc20gZm9yDQo+IGNlcnRpZnlpbmcg
dG8gb3V0c2lkZSBlbnRpdGllcy4gIElmIHlvdSdyZSBhY3Rpbmcgb24gYmVoYWxmIG9mIHRoZQ0K
PiBtYWNoaW5lIHRvIHRoZSBtYWNoaW5lIG93bmVyLCB0aGVyZSdzIG5vIGNyZWRpYmxlIHBvaW50
IHRvIHRoZSB3aG9sZQ0KPiBlbmNyeXB0aW9uIEVLLCBzaWduaW5nIEFLIGRhbmNlIGFuZCB5b3Ug
bWlnaHQgYXMgd2VsbCB1c2UgYSBzaWduaW5nIEVLLg0KPiANCj4gSSBqdXN0IHB1Ymxpc2hlZCB0
b29scyBmb3IgYWxsb3dpbmcgY2VydGlmaWNhdGlvbiBvZiB0aGUgbnVsbCBzZWVkIHVzZWQNCj4g
YnkgdGhlIGtlcm5lbCBmb3Igc2Vzc2lvbiBzYWx0aW5nOg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtaW50ZWdyaXR5LzIwMjQwODAyMjAyNjA2LjEyNzY3LTEtDQo+IEphbWVz
LkJvdHRvbWxleUBIYW5zZW5QYXJ0bmVyc2hpcC5jb20NCj4gDQo+IEFuZCBpdCB1c2VzIGEgc2ln
bmluZyBFSyBmb3Igc2ltaWxhciByZWFzb25zIChpdCdzIGxvbmcgbGl2ZWQgYW5kIHRoZXJlDQo+
IGFyZSBubyBwcml2YWN5IGNvbmNlcm5zIGlmIGl0IGFjdHMgc29sZWx5IGZvciB0aGUgbWFjaGlu
ZSBvd25lcikuDQo+IA0KPiA+IDIuMi4yIGl0ZW0gNiwgbWlncmF0aW9uIG5lZWRzIHRvIGVuc3Vy
ZSB0aGF0IHRoZSB2VFBNIHN0YXRlIGlzIG5vdA0KPiA+IGR1cGxpY2F0ZWQsIHdoaWNoIGlzIGEg
cG9zc2libGUgaG9zdCBhdHRhY2sgYnkgc3Bpbm5pbmcgdXAgdHdvDQo+ID4gdGFyZ2V0cyBhbmQg
ZGlyZWN0aW5nIG1pZ3JhdGlvbiB0byBib3RoLiBUaGlzIG5lZWRzIHRvIGJlIGV4cGxpY2l0bHkN
Cj4gPiByZXF1aXJlZCBmb3IgVFBNIHNlY3VyaXR5Lg0KPiA+IDIuMi4zIGl0ZW0gOCBJIGRvbid0
IHRoaW5rIHRoZSBjb21tdW5pdHkgaGFzIGZ1bGx5IGFncmVlZCB0aGF0IE1NSU8NCj4gPiBzaG91
bGQgYmUgdGhlIGNvbW1hbmQgcGF0aHdheSBmb3IgU1ZTTS1iYXNlZCB2VFBNIGR1ZSB0bw0KPiBw
ZXJmb3JtYW5jZQ0KPiA+IHByb2JsZW1zLiBUaGlzIGFwcGVhcnMgdG8gZGlzYWxsb3cgYW4gU1ZT
TSBzZXJ2aWNlIGNhbGwNCj4gPiBpbXBsZW1lbnRhdGlvbiBhcyBhbiBlbmxpZ2h0ZW5tZW50IHBh
dGguDQo+IA0KPiBXZWxsLCBubywgZm9yIHRoZSBBTUQgU05QIFNWU00gYW4gZW5saWdodGVuZWQg
VFBNIGludGVyZmFjZSBtYWtlcyB0aGUNCj4gbW9zdCBzZW5zZSBiZWNhdXNlIGV2ZXJ5dGhpbmcg
ZWxzZSBpcyBlbmxpZ2h0ZW5lZC4NCj4gDQo+IFRoYXQgYnJpbmdzIG1lIHRvIGEgY3VyaW91cyBw
b2ludDogaXMgdGhlIEludGVsIFREWCBTVlNNIGdvaW5nIHRvDQo+IGZvbGxvdyB0aGUgU1ZTTSBw
cm90b2NvbCBpbnRlcmZhY2U/ICBiZWNhdXNlIGlmIGl0IGlzLCBpdCB3aWxsDQo+IG5hdHVyYWxs
eSBpbmhlcml0IHRoZSBlbmxpZ2h0ZW5lZCBpbnRlcmZhY2UgKHRoZSBjb2RlIHdpbGwgYmUgcHJl
c2VudA0KPiBpbiB0aGUga2VybmVsLCBzbyBpdCBvbmx5IG5lZWRzIGFjdGl2YXRpbmcpLiAgSG93
ZXZlciwgaWYgdGhlIEludGVsDQo+IFNWU00gd2VyZSBnb2luZyB0byBpZ25vcmUgdGhlIFNWU00g
cHJvdG9jb2wgc3BlYyB0aGVuIGl0IHdvdWxkIGhhdmUgdG8NCj4gcmVpbnZlbnQgZXZlcnl0aGlu
ZyBhbmQgdGhlIENSQiBpbnRlcmZhY2UgbWlnaHQgbWFrZSBtb3JlIHNlbnNlLg0KDQpJIGNhbm5v
dCBzcGVhayBvbiBiZWhhbGYgb2YgdGhlIEludGVsIFREWCAqU1ZTTSogaW1wbGVtZW50YXRpb24s
IGJ1dCBmb3IgdGhlDQpMaW51eCBndWVzdCBrZXJuZWwgdGhlcmUgaXMgbm8gaW50ZW50aW9uIGF0
IHRoZSBtb21lbnQgdG8gc3VwcG9ydCBzbXRoDQpsaWtlIFNWU00gcHJvdG9jb2wgaW50ZXJmYWNl
LiBXZSBoYXZlIG1hZGUgYW4gZXZhbHVhdGlvbiBvbiB0aGlzIGR1cmluZw0KdGhlIHNwcmluZy4g
VGhlcmUgYXJlIG5vIHVzZWNhc2VzIGN1cnJlbnRseSB0aGF0IHJlcXVpcmUgc3VjaCBuZXcgcHJv
dG9jb2wNCmludHJvZHVjdGlvbiBvbiBJbnRlbCBURFggYW5kIGl0IGRvZXMgYnJpbmcgYWRkaXRp
b25hbCBjb2RlIGNvbXBsZXhpdHksIGV0Yy4NCklmIGFueW9uZSBiZWxpZXZlcyBvdGhlcndpc2Us
IHBsZWFzZSBsZXQgbWUga25vdy4gDQoNCkJlc3QgUmVnYXJkcywNCkVsZW5hLiANCg0KPiANCj4g
UmVnYXJkcywNCj4gDQo+IEphbWVzDQoNCg==
