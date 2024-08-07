Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285E41C7B7E
	for <linux-coco@lists.linux.dev>; Wed,  7 Aug 2024 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020411; cv=fail; b=TKmownBsU9uvRXYwFB/B+r6RmsShNGAG0dCty6dLic6gs54nVNKeqa9C+QJ2h6bHGmKmWkVhODpjnks8CFq+3A2MREfLVQNYHHrSi2xKOv0ue4PxG0WRg9fOzEvbSvkkm3mquTcEiqlrBRt8+IDyTb7/rMLtxitjTmlC++79zzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020411; c=relaxed/simple;
	bh=L9c2Z0/JTWiZcc0ep4xNwSjmaKDBOJ61yPBWPPn374w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nvLH8Ux/gNvluobfnC3cTsryAgOJtRr536c13+LS1e+Wn3A90CmISQhGuoQd131dI/KdnexMqRS04xg2x7l6TiHnlqlZP8A1rVI/He3HTuNRCVwEInCu5lEdiVSFvaTYTSyS34COJNqU7i704TodFhpnQUR7SwT0Zgifc/y6wNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZR49DAS; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZR49DAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723020409; x=1754556409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L9c2Z0/JTWiZcc0ep4xNwSjmaKDBOJ61yPBWPPn374w=;
  b=YZR49DASLs4hhi0FDY0lN+7mpIW6JmGWrVkIPR9EED9sVtjGOOxKSiyt
   oFcRaiYdpnCvAy4lXjaIVP3b4ibIQRSQ/tDR2ikgchqV21FJYFy2oj3Dv
   Q5oRMSwJJPuuV8ilgle0Od1dsEcxQF5Shxg1Lxy1jvx5hjmAACsbJsVSB
   JStRfra1fpc2ZL37hQSRnustP2H4UvTirlRAr+JY4MlCQrOEYrlXlR/8I
   rinHHHW1pCpEhtuFI7XDscralnV/V6VybeiH6rZxt6j7E+9QxE/qpS9YF
   0NxCmm0c0kANnkt1OFvk4q3RQJIfMjZ+Iit4QkllZDPdPc+n3rfP7Ck+U
   w==;
X-CSE-ConnectionGUID: 3j4GctwuRRWrbY9sr6QEOA==
X-CSE-MsgGUID: b5o+ioNRRzGTpZEkaxpZow==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32464710"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="32464710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 01:46:48 -0700
X-CSE-ConnectionGUID: zp9OfA7eSWOs14Qb80YD+Q==
X-CSE-MsgGUID: Q8vRUAfwRCmDe9QAzvvMVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61178735"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 01:46:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:46:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 01:46:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 01:46:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 01:46:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrXK6cbm359gr3K5ij5+1zoXU/S8T/gTs3Q4wfIB0/XggHe6IT9GmnKiU4f5E1nghgdGuTsL1JekdFzUhwAbvaroQm4chZjMgH+gUEAjAwZ/Ew8Nf9NwFcr32hZzF84LnhSpsw6Q+n5lXOv6lGd8Jf71xsjAwM7o4D8EEOLa1osbaxh+cGgVjJ2OO/mFyTIC4r2FBh4q1zlEvon5+MXvDCB6ne7jaUaXk0ZaIh91uly3m/gT5/Jk4gycDQTLyeYbDZvXrEs96eMfspP7A5N4X7pMhrphfZYc/ipL1RG6eLp2WyxtOFuftb6CCdTX/OzYvFzhXhGMkH+yaLLUcjWm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9c2Z0/JTWiZcc0ep4xNwSjmaKDBOJ61yPBWPPn374w=;
 b=zBNzBlyX+RgD/QBmLwPOneDntDAxSG1t3+e0A3uCfAV3yXm9RE5Yn8ueOcslcpyBYmhsQOInCEuW7cC7YJkDWxw3ZoREQeukI+vlHq4GJ1waOknjqkS7AHmOWLa38M0krd9zTRqdIXu0I8SIGOxE8gmrRRa3shvZZAV+MtpbLH3YfIxF1qd4oQFWfYNnPnFY0yA8fZP+ysaRlIZQIIk+alrnrSnOhmSJBmbjTW5q+3tv+2vnRT+DZ+ClIY9QxOPjazZWTCvDe0g9Umf5EzM9or6L5hbMMYjqb8/sCfkucSt7UHaLmfgzODXw5Rj8H3OZmdu6057eU0xHfKHE2FX+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 DS0PR11MB7410.namprd11.prod.outlook.com (2603:10b6:8:151::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Wed, 7 Aug 2024 08:46:44 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 08:46:44 +0000
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
Thread-Index: AQHazb9SCoxtMRLFK0GjoRY90TKvZ7ITK4eAgAEdeICAAKutAIAABwuAgAOiBfCAAF0YgIABGYlggACI6gCAAQpkEA==
Date: Wed, 7 Aug 2024 08:46:43 +0000
Message-ID: <DM8PR11MB5750FE8336C6DC96B02550DBE7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
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
 <afd3bf54fd77a1d6922192e1865c5cefadff7d92.camel@HansenPartnership.com>
In-Reply-To: <afd3bf54fd77a1d6922192e1865c5cefadff7d92.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|DS0PR11MB7410:EE_
x-ms-office365-filtering-correlation-id: 76290ea9-5f49-4dda-c268-08dcb6bd76e7
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHY0Nmp1bUdjeDhHUlRrSVU1YWlJZTFaL0xONWV0MklqZFg1dUpaUmhWRFFZ?=
 =?utf-8?B?RjF6R1VqZUMxd2VEZXFkeXhDNTBZOENUZFZiRjVkTHBqRHgzWUNWUWRPYXNo?=
 =?utf-8?B?VEJGbHdNUk90VTZDc2s2MmpLcFJRLzMzL2lnNE9Uc2d6QkVBcE9WZC9aQkpz?=
 =?utf-8?B?TEx2TmQ5d2p5Q0UwNHpTRnoyTWRaYzZHUm40aDJTSE9XaDNka1hDS3FIK0Ro?=
 =?utf-8?B?RXVROHRMZDJuOVpjMmlkY0cxRllpdWJmOFlwQVZ2eFF2a2k3QnlYWk44SExE?=
 =?utf-8?B?RG40MGRrSFBaNVJkSDBKcUkrSUJXZUV5R3hMSEU5c3ZiL0ZpNzFBaENBSHl4?=
 =?utf-8?B?Vzgza2UxV1ZPdTd0RHhXVXhHVkFhMHpWQzNET2JXQVNZbC9LaFBueXdha01w?=
 =?utf-8?B?RC8vbUFqUm5kUUF2T1RpaFRPNEhHRE9MRmNuekwyWXdlcndoVE0xeExzT1NO?=
 =?utf-8?B?L1FXcVNBYUhyUm15Z2JLUUZDNE9hbVh6TjlCQnNlSVpGNzJJb1lmdnJuQzl6?=
 =?utf-8?B?Umt2T0pGTE9jSkc1dEdVYlRQL3BhME9NOHl0S1RCWTl1Z2FqM3FHV091NTQ0?=
 =?utf-8?B?NWxuYm5xQjdVcHhvbXAvWDJNeWVKZlNjcEFVZk9RV2lRSFg0dmEvTW0xS0w4?=
 =?utf-8?B?aHptTnBrc1hEOG5kR0Q4dEI3M3g1K2Z5S3pSUnRhOGQycHJEUElkbVhaWXRt?=
 =?utf-8?B?YVhpYWxVVW9ncjFMRU5mSFdqMXgyVXhUVURFVDZQRkdBNVM4eFdhemdCZjBh?=
 =?utf-8?B?SWJWQ1VmVW9BajZ0QTNUNGlWZFFkNnEyNzdJbXRlOVlYb3FSUk9IY1FwZ2xa?=
 =?utf-8?B?bXU4REpJeGV6SHNpNEN2ZVdwTkpDdUpab01uSjg5WGZ2d0F2V0JJeHNWYzh0?=
 =?utf-8?B?V0Fyd0Y5a1A4VGNpVS9NVEtZbUJoWEM4K0lTd3BsbmdEcFVpem9XR0lJblFq?=
 =?utf-8?B?Y3BKckVibWVRQ1ZlbEpnNlQ4MXh0NHk2cGFFK0thYXB2RGNFZ2dXRndzRThE?=
 =?utf-8?B?cTcvSXZ5dFIyMm9LNHpucHFIaXdrRkJBZ2F0OENFclNSa3ozYzdyTy95cmJF?=
 =?utf-8?B?UlVCMnZER1lMenpoWHA1WEE1d2Vub0FkWHd6T1p3MURiUXB4UVVLbnVzSjhX?=
 =?utf-8?B?WFFTeVZlZjNrT1ZBWWhMbmhHZ25oM2VEMXBTa0dWaWRDZ0YzSitSU2daTTNy?=
 =?utf-8?B?WEREWXBGcVNEMTlEK0VXTWc0TWJRdjhnNDhWazJURm9HZ0cydGhVR0VyRjgz?=
 =?utf-8?B?QkpQRlFSZG12cU9PZGtkeEovYlMvQnhQVEh6T3dVMFo5OHducExsREMzV1pS?=
 =?utf-8?B?Rys5ZXFQRnZFbytuVzBmelhXRzVKYUxRK2dyZlZrWFNPcTFWWDloeHdhNzBT?=
 =?utf-8?B?UFRGSFJ0bG1MWWRlVFZpZ1ZVbHJWRFVBMGhKalJkeUU3eGszTVl3TlJIT3RR?=
 =?utf-8?B?M0d4LzZjNFZCVnhLcW9XSERzU05iRmtIN2I4UG9KcVcxZDJIK1ozcXUxZFhP?=
 =?utf-8?B?ZkFhaFV4dmVqOGh3Z2M5bXB6NnAwSEwvclMzQ2JQYmxrc1d5Yys4T2JFUDF5?=
 =?utf-8?B?bmhhWVkyZFloeWtuWXIyc0NIQUh4clhUUXhWdS9NMGZpK25vaitLQTBIVnhG?=
 =?utf-8?B?aENWM0U0bTdmbFRxYUY0STRmYjhON0NpTE5sSEpQVm9hNk40aHJNRnd4K1dt?=
 =?utf-8?B?UlZjeWtNRWpvTEp1VkZCTjdHeGExK0dISmtvM2JnVVJBa0UvZVI2ak9kUnFP?=
 =?utf-8?B?cXIrQ2VTakVQTkF5WUFTVEFIbDRmTEsvQmhoZ0gxV2UyZUIveTdZWWlXRTBF?=
 =?utf-8?B?Y3FBN2V4TmZIWVM2dHNRaWVwVmRTa1REZ04xSE5DWS95aFdkS0ZMbDROZ2ND?=
 =?utf-8?B?ZEFiWVhVZUVJdldSV1diYzdSR3I5QUhPL1J6RU51TWJSMkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGorNXJSS2xwdmltVkE5T0pwUk5VTk9wY2t2OVExNmtmSUdjYko4Y05xRld1?=
 =?utf-8?B?eHJEdGd6YkpyUklnMGMwMDJ1Q0RBVURxbVNqaUk2T1VqN3R0bjRkZG1KaFB5?=
 =?utf-8?B?SWtNbEY1UEtxUU9yZStOVHRaaDdieHhxL1N3YUdTUHpnaXN6OG80eUxmc1lP?=
 =?utf-8?B?QmVKcDRWY25lNGlFM1RQMXNpRVdWTGxzeGZoMnFhYTdOSWRhVngzKzFoc21R?=
 =?utf-8?B?SXpidG9SRWplSDRLeUgzSFBQbjRmVEg5NzRuRjZqMG56MzdqRXdyNEJqNzVS?=
 =?utf-8?B?QmU3RTZBOTQ3QkNMSFZENVVqTGpUTHIzaVJwSm92cjNwR1VpUW9ERk5wN0xF?=
 =?utf-8?B?SW0ycHkrVVdLM3dXOGVtZW5xNlk3Y2ZlQzJ6eHdZdVNBc0pWN2RycVZLY1B6?=
 =?utf-8?B?dmZqNVIrQnVHS1ZIU0h0d0k2YzZSMGRDbmJ4NUsrblE0S0diUVVHaUtySTVZ?=
 =?utf-8?B?UmpraVBZcnF5NmhjTTRhSDBsVUdtd0JqdWVma2xrdW1rR05wS2FUL3NHMXVm?=
 =?utf-8?B?cnZqL3FKMkxRMmx1aUdBOE0ydkR4MFJuc3pYbVk5YkdGbWxIZjNJOTZtMVJI?=
 =?utf-8?B?eFlxM1NDZmZ0WFgrMUZZT09vMTN6Vy9VQUF5WEQwWC9jbTFmWTdtWHVkcFo4?=
 =?utf-8?B?cnJ4dG5keU01d2Y4VEVEMVozcENrakZrS1dTZlB2TzJ0b2dXUk1OMm9QaHZa?=
 =?utf-8?B?UWNDN21aK2VJdDFBeVNoendZSkpOOWZ0UzVpb25UcklJV1pEUld1OGpKRkQz?=
 =?utf-8?B?ME1jaHFXa1ZOcmN5RTVGWjJVL2xyK1BmbkNzQmtWMHhtTDhxUXVxTk9hTzBN?=
 =?utf-8?B?VWx2ejlCUWRZSlBiSmZuK3dHc2FzM2JaelBYNkVTc3RmODVLb2Jac2xtRC9x?=
 =?utf-8?B?RWRqVWZ2VEtDTFBobGRjekdmNWF0RkpOR0JIZitmZlNoUzAzZmVDMWg3L21s?=
 =?utf-8?B?Zmk1TVdOT2hQeXp0VzJxbUdPcEdnR0NkdUFFRFpjNGpUeXVYV0lIajFhaE1x?=
 =?utf-8?B?L24yWXFsMzFNTGh4bkxCNkFJakFWR0xIOXFRR0drNzkyNDdPdVVjZTRCd2RJ?=
 =?utf-8?B?VUJ6ZUgyZjl3UjVsanpLWnRwZFFsdHZyRFQ2TzRvTHVuMkc0Z3ZGcE1YZlJI?=
 =?utf-8?B?R2NGaE8yYk16TXV6UlRsNEJNeE5HNlNvMjZNeDQxM1RObkhXcDREV2JTQnVh?=
 =?utf-8?B?QmMzVC80L0dqNGNGT2dQYmdMOXFIWXJKVFhnUkJ5SmVzRjQ0TEZ3OFEzbFZx?=
 =?utf-8?B?cExRZmQ4Z1dLaStodnROU1N6N2Zjb1dlRkFBZEdJOEhaenFYaDdseEZkbU0y?=
 =?utf-8?B?cHFvOGUyaFIzSWJ6QUZ1Q21ZN3hPQm1ERnB1MTdRTk9iL2RiSkJCZ3g0dVpJ?=
 =?utf-8?B?NnNlNUYzSDlVeEF4NStJa3lZOXJHcWtYcU81VTFIQndGdDY4a1dSbnoxbVJR?=
 =?utf-8?B?dW94dzFHQ1VVUGlPb0xWWGJETDFDNEtNRFJqVHhuSVRaYTRPL2NGZm1VdHZH?=
 =?utf-8?B?QU9MOE5PNzBtN1gwbUpSS3J4K2x5OE96VmJiamE5STFxYW1PMkxEK3FzNFVH?=
 =?utf-8?B?SVRNQTFhRkNPS1pkRGNwVWM1V2wxbmF1bWZkQ2QzejNXQ2VycXB5ZWY4Y3dJ?=
 =?utf-8?B?YmxBM3VXRlV4eVVabzZ6V3JXa1R2dXVBOENVczRNMHVyb0hhZWJJT0tRRUFE?=
 =?utf-8?B?VE01ZExxdGIzcWs2V2lDSjRqdU5xVXI0VHl3a0ZxNUJ5VTc3cTJ1cklSMWdU?=
 =?utf-8?B?K0prc25CVXRIbG9SUXdoOWJRaWZsTzdSZGVZdVp2ZjVlRkRkcFhSSzZ1UXFv?=
 =?utf-8?B?aGdnN0Q4a2Q3bTVHdVRMZlJBeVI5dWNidGoySDQ0dXAvTUFjOWwwY0o5akVy?=
 =?utf-8?B?aXVZcW84MDZpSVdGaVVJbHNxREt1dHY3emptWWwxT1ZlejdTZWk1c2JDb3Fw?=
 =?utf-8?B?TW03UlhlUEtrUVVlTnhWZ1ArSkZOMEdRdVQ1amFUUm05VytWbTlET3BQbFVh?=
 =?utf-8?B?RCt5REdvK3k2RlNzbEg3Zk9XbFVBaDVTaWN4VXZscUhSN3B2Njdncm5TSVhD?=
 =?utf-8?B?eWpEMnpldVgvNmlHcERidFl4SDZUUEg5VjBSZ2RKb0tSM0cvc20wZ3NPbHpw?=
 =?utf-8?Q?80S3LYaX2ar3Gvw/HzcSKf+S1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76290ea9-5f49-4dda-c268-08dcb6bd76e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 08:46:43.9176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOvAQ+aVhAClVEUlMZxaOwSitoNCMpT19VX7L5ubqPeP467VOUBfiK8oGKS4qsGk3t4eD2j2vRfA/xTgFOcRBxy1KJgkzNCumV0qotEUve0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7410
X-OriginatorOrg: intel.com

PiBPbiBUdWUsIDIwMjQtMDgtMDYgYXQgMDg6MjEgKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3Jv
dGU6DQo+ID4gPiBPbiBNb24sIDIwMjQtMDgtMDUgYXQgMDk6NTUgKzAwMDAsIFJlc2hldG92YSwg
RWxlbmEgd3JvdGU6DQo+ID4gPiA+ID4gT24gRnJpLCAyMDI0LTA4LTAyIGF0IDE4OjU0IC0wNzAw
LCBEaW9ubmEgQW1hbGllIEdsYXplIHdyb3RlOg0KPiA+ID4gWy4uLl0NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IFRoYXQgYnJpbmdzIG1lIHRvIGEgY3VyaW91cyBwb2ludDogaXMgdGhlIEludGVsIFRE
WCBTVlNNIGdvaW5nDQo+ID4gPiA+ID4gdG8gZm9sbG93IHRoZSBTVlNNIHByb3RvY29sIGludGVy
ZmFjZT/CoCBiZWNhdXNlIGlmIGl0IGlzLCBpdA0KPiA+ID4gPiA+IHdpbGwgbmF0dXJhbGx5IGlu
aGVyaXQgdGhlIGVubGlnaHRlbmVkIGludGVyZmFjZSAodGhlIGNvZGUgd2lsbA0KPiA+ID4gPiA+
IGJlIHByZXNlbnQgaW4gdGhlIGtlcm5lbCwgc28gaXQgb25seSBuZWVkcyBhY3RpdmF0aW5nKS4N
Cj4gPiA+ID4gPiBIb3dldmVyLCBpZiB0aGUgSW50ZWwgU1ZTTSB3ZXJlIGdvaW5nIHRvIGlnbm9y
ZSB0aGUgU1ZTTQ0KPiA+ID4gPiA+IHByb3RvY29sIHNwZWMgdGhlbiBpdCB3b3VsZCBoYXZlIHRv
IHJlaW52ZW50IGV2ZXJ5dGhpbmcgYW5kIHRoZQ0KPiA+ID4gPiA+IENSQiBpbnRlcmZhY2UgbWln
aHQgbWFrZSBtb3JlIHNlbnNlLg0KPiA+ID4gPg0KPiA+ID4gPiBJIGNhbm5vdCBzcGVhayBvbiBi
ZWhhbGYgb2YgdGhlIEludGVsIFREWCAqU1ZTTSogaW1wbGVtZW50YXRpb24sDQo+ID4gPiA+IGJ1
dCBmb3IgdGhlIExpbnV4IGd1ZXN0IGtlcm5lbCB0aGVyZSBpcyBubyBpbnRlbnRpb24gYXQgdGhl
DQo+ID4gPiA+IG1vbWVudCB0byBzdXBwb3J0IHNtdGggbGlrZSBTVlNNIHByb3RvY29sIGludGVy
ZmFjZS4gV2UgaGF2ZSBtYWRlDQo+ID4gPiA+IGFuIGV2YWx1YXRpb24gb24gdGhpcyBkdXJpbmcg
dGhlIHNwcmluZy4gVGhlcmUgYXJlIG5vIHVzZWNhc2VzDQo+ID4gPiA+IGN1cnJlbnRseSB0aGF0
IHJlcXVpcmUgc3VjaCBuZXcgcHJvdG9jb2wgaW50cm9kdWN0aW9uIG9uIEludGVsDQo+ID4gPiA+
IFREWCBhbmQgaXQgZG9lcyBicmluZyBhZGRpdGlvbmFsIGNvZGUgY29tcGxleGl0eSwgZXRjLg0K
PiA+ID4gPiBJZiBhbnlvbmUgYmVsaWV2ZXMgb3RoZXJ3aXNlLCBwbGVhc2UgbGV0IG1lIGtub3cu
DQo+ID4gPg0KPiA+ID4gSWYgeW91IHJlaW52ZW50IHRoZSB2VFBNIGNvbW11bmljYXRpb24gaW50
ZXJmYWNlLCBJIGNhbiBzZWUgeW91IGFyZQ0KPiA+ID4gYWJsZSB0byBnZXQgYXdheSB3aXRob3V0
IHRoYXQgU1ZTTSBjb21tdW5pY2F0aW9uIGNvbXBvbmVudC4NCj4gPg0KPiA+IFRoZSBnb2FsIGlz
IGV4YWN0bHkgdGhlIG9wcG9zaXRlLCBpLmUuIGRvbid0IHJlaW52ZW50IGFueXRoaW5nLCBidXQN
Cj4gPiB0cnkgdG8gc3RpY2sgd2l0aCBleGl0aW5nIHdheXMgb24gaG93IHdlIGhhdmUgYmVlbiBk
b2luZyB0aGluZ3Mgc28NCj4gPiBmYXIgaW4gTGludXguIEluIHRoaXMgbGlnaHQgU1ZTTSBpcyBh
biBpbnZlbnRpb24gdG8gZG8gdGhpbmdzLg0KPiANCj4gWW91IHdhbnQgdGhlIFNWU00gdlRQTSBz
ZXJ2aWNlIGZvciBpdHMgdGlnaHQgYmluZGluZyB0byB0aGUgZ3Vlc3QgVk0sIEkNCj4gYmVsaWV2
ZSAuLi4gYW5kIHlvdSB3YW50IHRvIGFkZCBhIENSQiBlbXVsYXRpb24gdG8gdGhlIFNWU00gdGhh
dA0KPiBjdXJyZW50bHkgZG9lc24ndCBleGlzdC4NCj4gDQoNCkkgd2lsbCBsZWF2ZSBpdCB0byBK
aWV3ZW4gdG8gY29tbWVudCBvbiB0aGUgdlRQTSBjYXNlLCBoZSBpcyBtb3JlIA0Ka25vd2xlZGdl
YWJsZSBvbiB0aGUgZGV0YWlscyBoZXJlLiANCg0KPiA+IMKgSSBhc3N1bWUgeW91J3ZlIGRvbmUg
dGhlIHNhbWUgZm9yIG90aGVyIFNWU00gcHJvdmlkZWQgc2VydmljZXMgbGlrZQ0KPiA+ID4gZGVw
b3NpdC9yZW1vdmUgbWVtb3J5IGFuZCB2Y3B1IGNyZWF0ZS9kZWxldGUsIGJ1dCB3aGF0IGFib3V0
DQo+ID4gPiBtaWdyYXRpb24gd2hlbiBpdCBjb21lcyBhbG9uZz8NCj4gPg0KPiA+IENvdWxkIHlv
dSBwbGVhc2UgZ2l2ZSBhbiBleGFtcGxlIG9mIHdoZXJlIGxldCdzIHNheSB3ZSBhcmUgbm90IG9r
DQo+ID4gd2l0aCBleGlzdGluZyBMaW51eCB3YXlzIG9mIGRlcG9zaXRpbmcvcmVtb3ZpbmcgbWVt
b3J5Pw0KPiANCj4gT0ssIEkgbG9va2VkIGJ1dCBjb3VsZG4ndCBmaW5kIGl0OiBob3cgZG8geW91
IGN1cnJlbnQgYWRkIGFuZCByZW1vdmUNCj4gbWVtb3J5IGZyb20gdGhlIFNWU00gaWYgeW91IGRv
bid0IGNvbW11bmljYXRlIHdpdGggaXQ/DQoNCkkgdGhpbmsgd2Ugd291bGQgbmVlZCB0byBkZWZp
bmUgdGhlIHVzZWNhc2UgcHJlY2lzZWx5IGZpcnN0IHRvIGF2b2lkDQpjb25mdXNpb24uIEkgZ3Vl
c3MgeW91IGFyZSB0YWxraW5nIGFib3V0IFZNIGd1ZXN0IChMMiBndWVzdCBpbg0KVERYIHRlcm1p
bm9sb2d5KSBPUyBwb3NzaWJpbGl0eSB0byBhZGQvcmVtb3ZlIG1lbW9yeSBpbiBydW50aW1lLCAN
CmFrYSBtZW1vcnkgaG90cGx1ZywgY29ycmVjdD8gV2UgaGF2ZSBzdGFydGVkIHRvIGxvb2sgaW50
byB0aGlzDQpyZWNlbnRseSBhbmQgTGludXggc3VwcG9ydHMgdGhpcyBjYXBhYmlsaXR5IHZpYSBk
aWZmZXJlbnQgcGF0aHMsDQppbmNsdWRpbmcgQUNQSSBob3RwbHVnIGFuZCB2aXJ0aW8tbWVtLiBT
bywgdGhlIGdvYWwgdG8gZW5hYmxlIG1lbQ0KaG90cGx1ZyB3b3VsZCBiZSB0byBtYWtlIHN1cmUg
dGhhdCByZWxldmFudCBjb2RlIHBhdGhzIGFyZQ0Kd29ya2luZyBmb3IgYm90aCAxKSBub3JtYWwg
VERYIExpbnV4IGd1ZXN0IChydW5uaW5nIGluIEwxIHdpdGgNCm5vIFNWU00pIGFzIHdlbGwgZm9y
IEwyIGd1ZXN0IHJ1bm5pbmcgdW5kZXIgU1ZTTSwNCmlkZWFsbHkgdXNpbmcgdGhlIHNhbWUgY29k
ZSBpbiBMaW51eCBndWVzdC4gQW5kIHRoaXMgaXMgd2hlcmUgb3VyDQpkaWZmZXJlbmNlIGluIGFy
Y2hpdGVjdHVyZSBjb21lcyBmcm9tOiB3ZSBjYW4NCnVzZSB0aGUgc2FtZSBjb2RlIGluIGJvdGgg
TDEgYW5kIEwyIHRvIGRvIHRoaXMsIGluc3RlYWQgb2YgaGF2aW5nDQp0aGUgY29kZSBvZiBzdHls
ZTogDQoNCmlmIChydW5uaW5nIGluIEwxKQ0KICAgZG8gZm9vOw0KZWxzZQ0KICAgZG8gYmFyOw0K
DQpTbyB3ZSBjYW4gaXNzdWUgYSBzaW5nbGUgcGFyYXZpcnQgY2FsbCBmcm9tIGJvdGggTDEgYW5k
IEwyIHRvIGRvIHJlcXVpcmVkDQp0aGluZ3MsIGkuZS4gbWVtb3J5IGFjY2VwdGFuY2UgKFRERy5N
RU0uUEFHRS5BQ0NFUFQgaW4gVERYIHRlcm1zKSwgZXRjLg0KSW4gY2FzZSB0aGUgY2FsbCBpcyBp
c3N1ZWQgYnkgTDIgKGFzIGFueSBUREcuKmNhbGwgYnkgTDIpLCBpdCB3aWxsIGdlbmVyYXRlIGJ5
DQpkZWZhdWx0ICh0aGlzIGNhbiBiZSBjb25maWd1cmVkIGJ5IEwxKSBhbiBMMiAtPiBMMSBleGl0
IChob3N0L0wwIGlzIG5vdCBpbnZvbHZlZCwNCmV4aXQgaXMgcHJldHR5IGNoZWFwIHNpbmNlIHdl
IHN0YXkgaW4gc2VjdXJlIGNvbnRleHQpLCBMMSBjYW4gaW5zcGVjdCB0aGUgYXJncw0KYW5kIGRl
Y2lkZSB0byBlbXVsYXRlL2Ryb3AvcmVqZWN0L2RvIHdoYXRldmVyIGl0IG5lZWRzIHdpdGggdGhp
cy4gDQoNCg0KPiANCj4gPiAgV2h5IGRvIHdlIG5lZWQgdG8gY3JlYXRlIGEgbmV3IHByb3RvY29s
IGxpa2UgU1ZTTSBmcm9tIGd1ZXN0IGtlcm5lbA0KPiA+IGZvciBkb2luZyB0aGlzPyBJdCBjYW4g
YmUgZG9uZSBpZiB0aGVyZSBpcyBhIHZhbGlkIHVzZWNhc2Ugb2YgY291cnNlLg0KPiA+IEFsbCBJ
IGFtIHNheWluZyBpcyB0aGF0IHdlIGhhdmVu4oCZdCBmb3VuZCBhbnkgeWV0Lg0KPiANCj4gRXZl
biBpbiB5b3VyIG1vZGVsIHRoZSBTVlNNIHBlcmZvcm1zIHNlcnZpY2VzIG9uIGJlaGFsZiBvZiB0
aGUgZ3Vlc3QuIEkNCj4gdGhpbmsgeW91IG1vc3RseSB1c2UgdHJhcHMgYW5kIGVtdWxhdGlvbiBp
bnN0ZWFkIG9mIGNvbW11bmljYXRpb24gYWxvbmcNCj4gZW5saWdodGVuZWQgaW50ZXJmYWNlcyB0
byBnZXQgdGhlIFNWU00gdG8gcGVyZm9ybSB0aGUgc2VydmljZXMgYnV0IG9uZQ0KPiBvZiB0aGUg
aGlzdG9yaWNhbCBsZXNzb25zIG9mIHZpcnR1YWxpemF0aW9uIGhhcyBiZWVuIHRoYXQgcGFyYXZp
cnQNCj4gZW5saWdodGVubWVudHMgYXJlIHVzZWZ1bCBpbiBwbGFjZXMgKG1vc3QgcGFydGljdWxh
cmx5IGRyaXZlcnMpLg0KDQpZZXMsIHBhcmF2aXJ0IGVuZ2xpZ2h0bWVudHMgYXJlIGltcG9ydGFu
dCBhbmQgbm8gb25lIGNoYWxsZW5nZXMgdGhpcyBmYWN0Lg0KV2hlbiB3ZSBydW4gTGludXggYXMg
bm9ybWFsIFREWCBndWVzdCAod2l0aG91dCBTVlNNKSBpdCBpcyBhbHJlYWR5DQplbmxpZ2h0ZW5l
ZCBhbmQgdXNpbmcgb3VyIFRERy4qIHBhcmF2aXJ0IGludGVyZmFjZSB0byBkbyBtYW55IHRoaW5n
cy4NClRoZSBjb3JlIGlkZWEgaGVyZSBpcyB0byB1c2UgdGhlICpzYW1lKiBwYXJhdmlydCBpbnRl
cmZhY2UgYWxzbyB3aGVuIHJ1bm5pbmcgaW4NCkwyIHVuZGVyIFNWU00gdnMuIGRvaW5nIG9uZSBt
b3JlIGVubGlndGhtZW50IGZvciBMMiBjYXNlICpzcGVjaWZpY2FsbHkqLg0KQW5kIGFnYWluLCBJ
IHJlcGVhdCwgaWYgd2Ugc2VlIHVzZWNhc2VzIHRoYXQgcmVxdWlyZSB0aGlzIEwyIHNwZWNpZmlj
IGVuZ2xpZ3RobWVudCwNCnRoZW4gdGhpcyBhcHByb2FjaCBjYW4gYmUgcmVjb25zaWRlcmVkLiBB
dCB0aGF0IG1vbWVudCB3ZSB3aWxsIGhhdmUgDQpzbXRoIGNvbmNyZXRlIHRvIGdvIHRvIHg4NiBt
YWludGFpbmVycyBhbmQgc2F5IHRoYXQgd2UgaGF2ZSBhIHZhbGlkIHJlYXNvbg0KdG8gc3RhcnQg
YWRkaW5nIGFkZGl0aW9uYWwgY29tcGxleGl0eSBpbnRvIG91ciB0ZHggb3IgY29yZSB4ODYgc3Bl
Y2lmaWMgY29kZS4NCldlIGRvbnQgaGF2ZSBhbnkgY29uY3JldGUgdXNlY2FzZXMgdG8ganVzdGlm
eSB0aGlzIGNvbXBsZXhpdHkgYXQgdGhlIG1vbWVudA0Kb24gVERYLg0KDQpBbGwgdGhlIGFib3Zl
IGlzIG9mIGNvdXJzZSBvbmx5IGdpdmVuIHRoZSBmYWN0IHRoYXQgd2Ugd2FudCB0byBzdXBwb3J0
IGJvdGg6DQpMaW51eCBydW5uaW5nIGluIEwxICh3aXRoIG5vIFNWU00pIGFuZCBMaW51eCBpbiBM
MiB3aXRoIFNWU00uIEl0IGlzIGFuIGludGVyZXN0aW5nDQpkaXNjdXNzaW9uIHF1ZXN0aW9uIGZv
ciB0aGUgY29tbXVuaXR5IHdoYXQgc2V0dXAgKG9yIGJvdGgpIG1ha2VzIHNlbnNlIGluIHRoZSBs
b25nIHJ1bi4NClNvIGZhciwgd2UgYXJlIG1ha2luZyBzdXJlIHdlIHN1cHBvcnQgYm90aC4NCg0K
QmVzdCBSZWdhcmRzLA0KRWxlbmEuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBKYW1lcw0KPiAN
Cj4gDQo+ID4gwqBTaW5jZSB0aGUgaGlnaCBsZXZlbCBvcGVyYXRpb25zIHdpbGwgYmUgcHJldHR5
DQo+ID4gPiBtdWNoIGlkZW50aWNhbCBvbiBBTUQgYW5kIEludGVsIGl0IHdvdWxkIGJlIHZlcnkg
YW5ub3lpbmcgdG8gaGF2ZQ0KPiA+ID4gdG8gZG8gaXQgaW4gY29tcGxldGVseSBkaWZmZXJlbnQg
d2F5cyAod2l0aCBwcmVzdW1hYmx5IGRpZmZlcmVudA0KPiA+ID4gdG9vbHMpLg0KPiA+DQo+ID4g
TWlncmF0aW9uIGlzIGEgc2VwYXJhdGUgc3RvcnksIHdoaWNoIGkgZG9udCB0aGluayBoYXMgYW55
IGNvbmNsdXNpb24NCj4gPiB5ZXQgb3IgYWdyZWVtZW50IGluIHRoZSBjb21tdW5pdHkuIFdlIChJ
bnRlbCBURFgpIGhhdmUgYSB3YXkgdG8NCj4gPiBtaWdyYXRlIHRoZSBndWVzdCB3aXRob3V0IHRo
ZSBndWVzdCBhc3Npc3RhbmNlLCBzbyB3ZSBkb250IGhhdmUgYQ0KPiA+IHN0cmljdCByZXF1aXJl
bWVudCB0byBtaWdyYXRlIG91dCBvZiBTVlNNLiBJdCByZW1haW5zIHRvIGJlIHNlZW4gd2hhdA0K
PiA+IG1ldGhvZChzKSBpcyB0byBiZSBzZWxlY3RlZCBhdCB0aGUgZW5kLiBBbmQgaWYgc3ZzbS1i
YXNlZCBtaWdyYXRpb24NCj4gPiBtZXRob2QgaXMgZ29pbmcgdG8gYmUgc3VwcG9ydGVkIGZvciBp
bnRlbCB0ZHgsIHRoZW4gaXQgbmVlZHMgYQ0KPiA+IHNlcGFyYXRlIGFuYWx5c2lzIHRvIGRldGVy
bWluZSB3aGF0IGlzIHRoZSBhY3R1YWwgcmVxdWlyZWQNCj4gPiBjb21tdW5pY2F0aW9uIGJldHdl
ZW4gdGhlIEwyIGd1ZXN0IGFuZCBTVlNNIGluIG91ciBjYXNlIGFuZCB3aGVuZXZlcg0KPiA+IHRo
ZSB1c2FnZSBvZiB0aGUgU1ZTTS1zdHlsZSBwcm90b2NvbCBpcyBuZWNlc3NhcnkuDQo+ID4NCj4g
PiBJbW8gbWlncmF0aW9uIGlzIG9uZSBvZiB0aGUgdG9waWNzIHRoYXQgd291bGQgYmUgZ3JlYXQg
dG8gZGlzY3VzcyBhdA0KPiA+IExQQy4NCj4gPg0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBFbGVu
YS4NCj4gPg0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPg0KPiA+ID4gSmFtZXMNCj4gPg0K
PiANCg0K
