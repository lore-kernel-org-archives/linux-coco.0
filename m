Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9666190672
	for <linux-coco@lists.linux.dev>; Fri,  7 Jun 2024 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771571; cv=fail; b=HjzH1EiD8g802i8zSfbnneOAStFImVLLMm0ou1KFs1dSa5fBOQHc1rrn3ErRcFFV8zWDE/mJkL5WNSYOMmLjdJoOdNtGcgu1Rk30+qaciwOJGXS5bwapnNR0oVQXFZnwcOVhFWmLBrde8/oYefWw9cuqi+OUPpK0wMJN0R+9dEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771571; c=relaxed/simple;
	bh=ouBGtmxks8cSCj6ObLGpaWjUVU441bIRxSOdohbtvC8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pLPLcEIJAfwGqbwyp+K6ALyOZGt3xXNgNWJITJmbvQFVSzcix1dkEg74ejqnDgje3fcFAyuW/02EQGj8Fn2yvsHUd1+3ftJ16OTflTXESvxN0sRQxb79DKY4IAq2n7YDgTMauQao+g0clrk6f9bzrDccd4OTMbCLaO924D8xU0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkhbSbsC; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkhbSbsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717771570; x=1749307570;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ouBGtmxks8cSCj6ObLGpaWjUVU441bIRxSOdohbtvC8=;
  b=OkhbSbsCEQRd4TXEtfRXmMc/DJ52a89Apg0C7/XiXbqbJYmGSO1132kV
   BAmkT4jDVfOCjWG3Bcxka2lRnzQaqDczP7XL3h5WEike7AwkwYxkGrOtp
   9mllB1aSHHCZSvrLh/1ZCDqQSPm3c4h0tSyFdnZZyWVNDU8x8AT+dG2AJ
   jDU8Kv7xx2HvaiU/t8/A4YgbGVOm0lYmndpXzfj4xGSVA8iebF5bwf6uI
   FTpllzFoPI6EhLayNCFQnI8SyAHHQsIEpxWiRhVSZZrA99VhphxQkPuBf
   2JCnCYz69yrbA/EyD+lubGzTtI/ioucrDORK3PMKKRUf7KqnbW2jCRF3C
   A==;
X-CSE-ConnectionGUID: 0bch/WJuSJujVqsCdbzHjQ==
X-CSE-MsgGUID: XDBJNUT6SmaJvBU4B2LLzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14720207"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14720207"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:46:09 -0700
X-CSE-ConnectionGUID: Hlq3tblLTiS8HM7IxtgyWQ==
X-CSE-MsgGUID: SOXJxYB8TxK6H2TxjMCR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38466906"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jun 2024 07:46:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 07:46:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 07:46:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 07:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hL49IXvG8Tn61vp6dliRxqEb62ztX+v7SPxn5KV2XgMolrDDnsqpQtHYNpHxpcZfh9ZmT+pY9ebvcz1aX57jnhVzxT6clJ/99yTZ9Wgphi9gJgMjZSgUp1WEIZlAAK7RtYiFdPCcQ3sNCvFt7gXWZvXZP9v+VdNyZqF+kf3PM6NRB1lEUdbhcJPCXBueKQ7TyzjBaZRzyMrdvoI45LrJuTruQomF2JQClFgFj3SHyrivRI1/B136LTUlOHWY09af2Hq/YUqTSxUL3GuyjHpbi9e2SDK9oxbULyYqpjLFrSZtqe/m1BcRdDUwKP59em/SQZ5X1e2hz8A0TMPhZ8bJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouBGtmxks8cSCj6ObLGpaWjUVU441bIRxSOdohbtvC8=;
 b=LXModgTAhQbrDLZuzIhU6uaDmSIybl0tUJVZojxszkqd+Pp3SHZFy7LMPJcubYy0KDtb0mNpNS0dY8Xb2k1403q8Z4nrkrajRav7NhJ1I0ViGIFbaLHw9SuSpw0qV9lk+uUSaUas1wEGKPwIt3XQ0eAk5jzudqtua0K78xwgCl5aUBNtnPQj42dH0BdewtXlsrVMg2Ad5nMYtVoU72TV57JaBnK0Ce3E7eiySLN/ATq3q3Q4UFtOJGxgBpWX95FQNWZgT+AMoa4uW7aU1DB16gZoziyonESKc9V01SOmhHhGXu6cOnwWxt8tlozWleD7Jm7JOsXRWxMmCa2KM9057w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 14:46:00 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 14:46:00 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Graf, Alexander" <graf@amazon.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Kalra, Ashish" <ashish.kalra@amd.com>
Subject: RE: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Topic: Confidential Computing call May 10: RTMR ABI & TEE I/O
Thread-Index: AQHanZPnXDME9v4Jq0aAj3sHCS9+NrG8kbKAgAAFESA=
Date: Fri, 7 Jun 2024 14:46:00 +0000
Message-ID: <DM8PR11MB5750ECCF396D756D40BABF42E7FB2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <61b65115-5945-4e27-89e4-bb6cba657f7f@linux.intel.com>
 <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
In-Reply-To: <0ebfe6b4-ee5d-4909-8a3b-bbc1bd7623c7@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|BN9PR11MB5275:EE_
x-ms-office365-filtering-correlation-id: 152977df-5fc8-44b8-804a-08dc87008c9b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?aXFOM0I3Z1l1OUQxbDIvdEdCUTBpaG5jeEhvUmRNNVc2Q0tOdWh6eGJ3M2lG?=
 =?utf-8?B?MUdsVTV6cnFkT1ArSG4zcVl1RGVRenRhWklnakZTdGFWVG5jRmhWTTdBeWFq?=
 =?utf-8?B?T0hKcVBYbWE4dlU5Rzh0NnZKeEY5dWNkdXR2eG44dDl2aUdaR0JsSlpwN2h0?=
 =?utf-8?B?OTVEU2VzZ3pKdnBOeXVJb3REeUJHeVdUdzhqNk9yZmVTNUdZbTBvUGsvelg0?=
 =?utf-8?B?V3ErLzJrNTVDZFZiZkdtU0pYRFFlU05GaUtIczNQWmNyTkE1SGZrTStYdDBH?=
 =?utf-8?B?Zk9JN2FLakJTamJvNVRpOWYrT1NKS0RFNjRXdy9BMTJPREt2QkZ4Rm1rem1T?=
 =?utf-8?B?MHVnc3dMeTVjS0o5OFp2MW5EUjlZd2NoNWpzR2RDT1ZCYlMrUzM2MXY1bGNS?=
 =?utf-8?B?S05nbWR4N0JrQS8rNWhGMkJOTGVrZ3FOeTQ1Sjd3ZnpSTGJjank2dWNnV1hp?=
 =?utf-8?B?TFZmSitoNTF1WmEzSmFUNU41SzgweVBWRWRaNjZ3VWNGZzJibEV1MUdNMHdQ?=
 =?utf-8?B?WFUzd2tiQVlSNEgvSVJGaXdQYVV1eVNPQVJmUFdNWGV1aXQ3VE9GVVpQZXM0?=
 =?utf-8?B?cEI1eDNWTnhDbVhWREZWeGxZbGpnV2xncy9sMXRqRDNCVDk1aFdsa0RReWgv?=
 =?utf-8?B?NXpxNGZLWTdjRzhldUZoT1ZQTnVaS0lyZ1gzMFUrQzRiRFVFWkgwOGwveCtV?=
 =?utf-8?B?ci9RQWFFR29tK0ZuSkc0dy8vQzh1d2VqZytwQWwxWEhsQnRjaitjWTl2TWJY?=
 =?utf-8?B?MEFlWlNYUTFzT0h6cHhJSElCbVJ1Y3E3YXlxanYzOUtLc0JWWHhJcGhFQXpY?=
 =?utf-8?B?UzZqMnF4YWt0akZSYzlNUVVWczJrcXZjUFRtVzVYMGRpM1VocFBaVWxSVWNE?=
 =?utf-8?B?THhwVHBoQWw5elI3UytkTG42NlNkWkIxdjdLZ3pER3VGblU4Qkw5ODByNWVC?=
 =?utf-8?B?V3p5VStmaFY0WGZqU3hPY0phQ3pBcjNuSzNRTWk0WkRLbzFlWit5VVF3UjZy?=
 =?utf-8?B?dTBGRi93MG9MbDhmUDdiaytpMisxdWVCakVqYUNJYmJ6NGpDeTdtQ281TTly?=
 =?utf-8?B?elhUdHFyZHJraWh5ZDAzRE5sUEdkS3lFTjBUOFlZVUo2eU1ZUHNPalVZNS9R?=
 =?utf-8?B?Yk5hRnFyalNFSlNDRHI5bkcrVWZ6ZUVadEt0Z1ozbjh2b3huQllobVRCZFg2?=
 =?utf-8?B?d3FRQmlrUnhaMktjT1FEcWhZQjY4MXdKN1NJVTVRUFN1NjdZUHQ5NWtMb2NQ?=
 =?utf-8?B?OGZKQnRpYldmQkptdVNGUWRrVEphc1lFWmF6dWNLTEdnbjZhVXF4SDE1NWFh?=
 =?utf-8?B?S2hHYmQyd3JWWFVEaDJkSjRhaHB1TGlnbVBSWURUZm9mcFhySzFkbXEwUjN0?=
 =?utf-8?B?QlpXNC83M1lmRTBiSGk1TnJoa1dMVVhwbTZKM3RqU1JOZVpoT0o1dkJGam9J?=
 =?utf-8?B?bzBmVzMwejFYSjArY2FyenBFNktlRnlZV3dkM2VSQ251dkNIQmlZTEN2Qkx0?=
 =?utf-8?B?b3lPWkdZeXRYS09UWlpIVFhJS01CNjhudkdBVXVmdTUzNjZWa0tFa0RDTFVp?=
 =?utf-8?B?SU14aVAwZlM0dTVZdWhIdk1Cam5nbVRwbGpMc085RTRCK2NQZExRelh4dHRX?=
 =?utf-8?B?TVVXN3pmUDVsZERVWTYyRFJ6dWs0Uzg3UjVISXdRS05TM2JjYzJ6TjhLaW9B?=
 =?utf-8?B?Tjl0bEFiSEU4OFIyNy8wc09qQ1hmV3BTWmFjRzEwY1BnRFprZnNCUnBjci9q?=
 =?utf-8?B?czZaZmNQZElMa0hJVlBVeEJ4bkEwSlRRSkVwOEJhWXc0Uktpd3cxbkFkV3NE?=
 =?utf-8?Q?I3VEGVP/mb4nuOg+RolO6UDp1bzHbOByVsqt0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M29yOUhUYmVEdHFURVZmazNFQVMxdkxSMU9CWmcyYjR5ZTZYZUw1UmYrUUZ6?=
 =?utf-8?B?S0p3aDZ0b1FZV2pwdUlXZk50Wm1JdGlvbEFyY2IzeTdPeEI1UWJrOEFxRXVv?=
 =?utf-8?B?WkRpVks1MXNacU5zem9SNnZlVGVyS29kSFZVUWhkdklxY3dKdVFnZHQ2Z1gz?=
 =?utf-8?B?RkFQMEViQzBXaUEweUxiMEp0V0lTRlJ6RWNtcklraGh5eVIvQUM5TnVOUkZO?=
 =?utf-8?B?dlZHNXh2SnJNZ0o0eGFReGJDeTA3UGFlOVJIa2xMUDFucjdsZzQ0eGJlOExp?=
 =?utf-8?B?ZGovN2J5V1BtMWkwS1lwWENvMi9uZHNKNmVxTWNxV0V6anNnWmtGNGJBVDNC?=
 =?utf-8?B?MmRIOEVwSVFCOEhWOFVCak1GdWNtMjF0R1BYOVNuN2FRUTVxNWpSZTBGMlMx?=
 =?utf-8?B?YmpTSlB5M3ljOTlRdFZkdzZIcFRNbmVrWEV4TDFudnNrQzdjOTF2K2UzMHMx?=
 =?utf-8?B?dWliTUNSb1dVdlByaWljTXlpQnVuaktLa1VwYy9sZkpWWWE0TmI0cURreDNz?=
 =?utf-8?B?Wi9haS9GWDNFTjZCQ3dHRk90c2lmQllYWnVzZytmNm5GSVFKUTBTRUY5NUFD?=
 =?utf-8?B?SDhQUlFoTFBjNENuSW45THVNRVFRYWJtRWMwblFBYlp3d3NiVWJZNzI1N1pk?=
 =?utf-8?B?UlZZd1Q3STVMem5YZktLTk9WMnMvR3NFaHBRYVozVVhnUHkzVjhieng0T1Zx?=
 =?utf-8?B?QVBxL0d4eFZWK3k1SXJGWlcvSUFzc2t5S2k2ZTdpdzZOell5Q1Robm1kVzNE?=
 =?utf-8?B?Rk5icncyTUNKcnVwZStUMUU0L1BDZVZlc2RXUWdGdmd4eFY2Y3ZEeDg3bXFk?=
 =?utf-8?B?TVhMeHhQSS9mT3hvdEtEOXNZUU55TGYwVUdzdFpMUkRaaEt0RzJMMmk1WkFl?=
 =?utf-8?B?T2JvVUk4TVpmZUFtTzg1WGpyaytEZ3VPR1dGL0s1VlFZYzk0ZEx1WlZYRjls?=
 =?utf-8?B?QmkwWG1iR09nN2N3eGJQME84Z3lvYUxhUXBhT09vM2x6VjRlM050OUx2YlFW?=
 =?utf-8?B?TzVvZ1dWUHFtTWhQdG95d0xOU2tKVnpxbzRMV0ZCSzZoZnFwbEVlV3QrL2ZM?=
 =?utf-8?B?WkVEL2pVYWZxVEVzSWd3YVV2dTUxTFFseWVUM3hkTDFZclIwcjdmYlZQYzc2?=
 =?utf-8?B?MGZ2bXAxU3JVdGpjMVR3dUdhcUtLVzIzMVE1QmorOG02MWJEc214SW93TTJ4?=
 =?utf-8?B?OVZ5ZlpLdFZxUjlucW5TRnpwbDcrc01ONC9uWUxzUGlDNGpVZXZwS1Y0Vmhj?=
 =?utf-8?B?UTdHTEE4S2w5WlErYnpmUmh4S25jZ3lmWjhvWWFhNUx3aUlLYlZLWmNNTm1n?=
 =?utf-8?B?Ym5HTEJjWFkwS2NEcW96SHhHSy9HWWVwaU1HeDNsOWJrQ1dHNnN2REZ2WTZY?=
 =?utf-8?B?aEhHYVZvMlhUSUhBL1Q5SlM1NUtnWnpPWSt3aythdDNlWU02T0JLaXVULzMr?=
 =?utf-8?B?VGdFWFhNNi96NThjT3JxYTgrdXM3b1VqMkZTemhZVUZGdnk5c1RrNGYrT0VC?=
 =?utf-8?B?N0RJK3ZqQU40YTNEcTFWZ0NXb3JUNGYvOVl5a0Q0MmNRTmhWNjRVZ0t5WURD?=
 =?utf-8?B?ZUY2OFNHLzRYRlIrSXNUNkdRbE1HZllzQkEySnBLSGNhMTBPSzVkOThDZ3hM?=
 =?utf-8?B?cHZrTHdId2xrYndLY1YrTUIvbkxQZGFqRFEzWFFrK3dSRWQ5eXBTdmJxMjZK?=
 =?utf-8?B?VXpEVFRMaUtkVHRSYk5xZUpCRTVLVHMzd2VQcGFCZ0xFcnZxY3NnSnlId3hX?=
 =?utf-8?B?MWZ6TXNzRXU1N3lyUHVMZWliL1VadUJYYVlRSmRRaythbE5Wc0JvWWhrTVB5?=
 =?utf-8?B?dHJBQVZSWnU5d3UrMWFXbDhxbG45dE1tRnFVd1c4MmppSG8rNGJpMFV1WGxN?=
 =?utf-8?B?MnJKaFVodmZieUlqcURJRjBmNUEvZm9JVGp6dGFoSXQ1c2VJWVNFOFl1cEIz?=
 =?utf-8?B?NU5XR1JaRXY2UW5CSnZLMW9jaXc3OVQ0RVU2N2V3VzFQRjR4U2dUS3NhbHJm?=
 =?utf-8?B?eFYycTVUUW1ZNDl0b1JLWThzY2tNUDA4SXNzT0xOWkdLeVZQWVlMc0JiUytu?=
 =?utf-8?B?N2liMGlJR01ZK1JGOFpyaitqWVdNYVpZcm12TTdEKzh6Zm5Fa2lLdW9TMXJD?=
 =?utf-8?Q?osOASX1MxREWZU18kn13yjXq+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 152977df-5fc8-44b8-804a-08dc87008c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 14:46:00.8330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5moGHHIOkEfxsNMp2h0LHk4f14Pci0WAEyiobtbiLe+4WhKBF05L1a7FWaZV3hQSYeCVPZj9J7/lIua7X0xygvitTlM2xx5Tb9jxVzvJNuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
X-OriginatorOrg: intel.com

DQo+IEhpIERhbiwNCj4gDQo+IE9uIDAzLjA1LjI0IDIxOjU1LCBEYW4gTWlkZGxldG9uIHdyb3Rl
Og0KPiA+DQo+ID4gSGkNCj4gPiBOZXh0IEZyaWRheSwgTWF5IDEwdGggYXQgOWFtIFBEVCwgd2Ug
aGF2ZSBhIENvbmZpZGVudGlhbCBDb21wdXRpbmcNCj4gPiBkZXZzZWMgLyBCb0YgLyBEaXNjdXNz
aW9uIEdyb3VwIC8gU0lHIGNhbGwuIEV2ZXJ5b25lIGlzIHdlbGNvbWUuDQo+ID4NCj4gPiBUZW50
YXRpdmUgYWdlbmRhIGluY2x1ZGVzIFJUTVIgQUJJIHYzIGRpcmVjdGlvbiBhbmQgVEVFIEkvTyBu
ZXh0IHN0ZXBzLg0KPiANCj4gDQo+IEkgaGF2ZW4ndCBzZWVuIGFuIGVtYWlsIGZvciB0b2RheSdz
IGNhbGwsIHNvIGxldCBtZSB0aHJvdyBteSB0b3BpYw0KPiBzdWdnZXN0aW9uIGhlcmU6DQo+IA0K
PiBJIHdvdWxkIGxpa2UgdG8gdGFsayBhYm91dCAiY29uZmlkZW50aWFsIGtleGVjIiB0b2RheTog
QSBrZXhlYyBtZWNoYW5pc20NCj4gdGhhdCBhbGxvd3MgeW91IHRvIGRlc3Ryb3kgdGhlIGNvbmZp
ZGVudGlhbCBWTSB5b3UncmUgaW4gYW5kIHJlY3JlYXRlIGENCj4gbmV3IG9uZSBiYXNlZCBvbiBh
IHBheWxvYWQgb2YgdGhlIG9sZCBvbmUuIFdpdGggdGhhdCwgd2Ugd291bGQgaGF2ZSBhDQo+IHZl
cnkgZWFzeSBhbmQgY2xlYW4gbWVjaGFuaXNtIHRvIGJvb3RzdHJhcCBhIFZNIGludG8gYSBmdWxs
eSBtZWFzdXJlZA0KPiBuZXcgZXhlY3V0aW9uIHN0YWNrLg0KDQpJbnRlcmVzdGluZyB0b3BpYywg
SSBhbSBjdXJpb3VzIG9mIHRoZSByZXF1aXJlbWVudHMhDQpTb3VuZHMgbGlrZSB5b3Ugd2FudCBh
IGxvY2FsIGZhc3QgbWlncmF0aW9uLCBpLmUuIGEgbWlncmF0aW9uIHRvIGEgbmV3DQpDb0NvIFZN
IG9uIHRoZSBzYW1lIHBsYXRmb3JtPyBJIGd1ZXNzIHRoZSBkaWZmZXJlbmNlIHdvdWxkIGJlIHRo
ZSBhYnNlbmNlDQpvZiB0aGUgb25saW5lIG1pZ3JhdGlvbiBwaGFzZSBzaW5jZSB5b3UgYXJlIHBy
b2JhYmx5IG9rIHN0b3BwaW5nIHRoZQ0Kb3JpZ2luYWwgQ29DbyBWTSBmaXJzdC4gDQoNCg0KDQo+
IA0KPiANCj4gDQo+IA0KPiBBbWF6b24gV2ViIFNlcnZpY2VzIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgNCj4gS3JhdXNlbnN0ci4gMzgNCj4gMTAxMTcgQmVybGluDQo+IEdlc2NoYWVm
dHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MNCj4gRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDI1Nzc2NCBCDQo+
IFNpdHo6IEJlcmxpbg0KPiBVc3QtSUQ6IERFIDM2NSA1MzggNTk3DQo=
