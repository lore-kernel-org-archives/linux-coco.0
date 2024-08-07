Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95B1C8FC8
	for <linux-coco@lists.linux.dev>; Wed,  7 Aug 2024 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723030128; cv=fail; b=LtSXs/wrvsWItddCSSgZhIVmh2qePMAbEeifFdlbY3XiTbqQeLQY5j9kgMeoRExZLyZP1WPXJ7XcYD4Rb2ucV5n0tZJZmqNvfLtgSS9ZiZX98xy2mOiBCCtSFwjyplYEgLX3tpOHNB699CEYY6sETbAc4ZwN3H6K7nmZmY1xiYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723030128; c=relaxed/simple;
	bh=tZuf7NKlIcyRvR372ebPR5A5Y0HDwT8kxiIxaRLScZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c3H1ET7XvQ7ut864s+D0r0rVJSMhlo6Jn5z4gLsZu+vr7bOE7pGNbYd/dIpgZ29bIkypdi/9vV7rYwU0KeOhHuVJSt5dMoXRm6zj4wvlvQnamMzWytoFG8CfblkYuUxMtDNCKwUrjWf7iwo6WjXqsQbYytNB0U9wB4PNRBR79pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZdSmlF8; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZdSmlF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723030125; x=1754566125;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tZuf7NKlIcyRvR372ebPR5A5Y0HDwT8kxiIxaRLScZY=;
  b=hZdSmlF8dmItqEhIRoDUMpCcWCHONHXqwWoR9vBt+TaSDu6uu4bwWNIG
   7aNcWv8qj+FpxxYo80Vz8erbUoqWVCavh2l6w0zewtryyTWyTxnnZpLxV
   yMTWV8ALr7Fv8UakZgRg4/XJGJl5uROhaXQxGf8qH4cST3QPTkX5lVzhd
   KqD6flzCjqnpUwnOa1+H2Lgjg6YEoPNewkOabDTDeesMQny5LUJJtQNpI
   YysTug5ykgtDzcH1K/5up3wp8FR3KnwiYZAIm6A4daX+eYrZ/xETEp4I4
   Jt6ee/og5SS908LkIE1BMkdNc6Z/cQS8CkwPUzdGnk/Xf0E1sx/szAFF3
   A==;
X-CSE-ConnectionGUID: L/+p7psFQVu8oIoO1WMPrw==
X-CSE-MsgGUID: wUVgj5wSSk6H1qkwgzDyEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="20969891"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="20969891"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:28:44 -0700
X-CSE-ConnectionGUID: lWkref6cTM+cs1ujMb8L5w==
X-CSE-MsgGUID: /PM/JRP0Q6Khlq8KrKzpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="80074118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 04:28:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 04:28:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 04:28:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 04:28:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 04:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzjCydB0stYa6F17y5Zo2vUxsUTKC2J1Ys9a1tvrnSG7hmOrx38bqtUbm49NDJPvWbloT7ngU67Hj/BjmRNkf+QO+YFueOK7Mb3VS5V4jB4uIaj1OkAOjde0bd3MLZfkxN3Ww528JB+w52gQdr0JyG1P5rjfqz6HbRJhPwf6a9m++9F2T+NtBTENQFLxXHdzq9OoQIIJm4MSpe3SalZo6toZncGr3/aoOKNbgQUM9eAQo9PrPrs74Z+puBrUBUiPZRvB5aSBnS3ys+bl1rsPKK2xEMXitpVrTqF8qvNXuCFykzmlzrRskwgYX1nO8vDg169jUDm7sZuQVkiwa2GCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZuf7NKlIcyRvR372ebPR5A5Y0HDwT8kxiIxaRLScZY=;
 b=PPFXCy+St0cc/h9A959AbalUHS30KqrC97F6OHgPlUm03TFcKEpzEm3U7ELz4I4Q8tFIaLRg1WU/n0WjA0eysoNhdqJY4KTLZKHc1279E1yThxdZm2xTjD+xVKd7h/Yh88+qzH/xyGOzjfDpa6FRrtwCq+5eN3GyTZIYTSWqiJXOKNZUo3t28EVbQjrpW6BA9Ba1quLcGkxPtssQNBMnbpgp3fdcvo8J+4929W6vUcMirY8L3MCwu9oqXdMZwv6nJjyHDIRVgTmOcA3cA5WBJqhL5Cr+T56fJn8O770lMe//doTeiGWvH8I5gDl3FA7kdElISo0HRWLV2YTEhK3eAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 SJ2PR11MB7645.namprd11.prod.outlook.com (2603:10b6:a03:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 11:28:38 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 11:28:37 +0000
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
Thread-Index: AQHazb9SCoxtMRLFK0GjoRY90TKvZ7ITK4eAgAEdeICAAKutAIAABwuAgAOiBfCAAF0YgIABGYlggACBFoCAAAkjgIABPB1Q
Date: Wed, 7 Aug 2024 11:28:37 +0000
Message-ID: <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
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
In-Reply-To: <ead3a13611e209bd994ca688e5ab0a9fa309383a.camel@HansenPartnership.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|SJ2PR11MB7645:EE_
x-ms-office365-filtering-correlation-id: cb5af644-8865-493f-ec2c-08dcb6d41498
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UFNiK3QrcHZ1MnF0YzZJWHNZQnlOTW1SVFFuSU1kTjFFYTVxRGRGZWxTMTBZ?=
 =?utf-8?B?SnpTM3RMN29NRzNrTVdtZ005L29sTU1sMlRyOGZ2OHJlU0ZaMTVZWmE0Z1Yx?=
 =?utf-8?B?RHpaVVhteVFTMml1b2dpVU1BMGE1TysvZFY5aUtyYmlDRjQ5cTZTWFJDdU9p?=
 =?utf-8?B?T20wTE8zQWF2VFFzeGdCZkZnQ3VGUTErZ2RHaXBkWFZPcERsYlpaUUlacktM?=
 =?utf-8?B?bWdaRVdJVmtVbDZHaGh3Y21jSjlKREtrYlBvbXdGSlBtNW1Vc1JxNVNPWHdm?=
 =?utf-8?B?Y040Z2s3Ly83K3NreC80S1JESm8wNjE1R290UkVzUllJd2VrYVYzQ0ppTld2?=
 =?utf-8?B?a2hFY2VzVU9iMHExQ1JoeC9RVWg2N1hrLzZEcmNpV2VQNFhwREozdlZrNmxU?=
 =?utf-8?B?d1dIdlAwb0JMYUE2Nm9QUTFYVmJDTVRLVTlNcitRU3FQRXpEN2dwdkFFT3FT?=
 =?utf-8?B?bHRQQnp6L0xrZWhhQTdCUjFmVHhSa3VwbElJaVVwOFo3NmVwRy9HMlhITCtz?=
 =?utf-8?B?UnBQd0IrOXIrVmhNSFlCYXBtQ3A1OE10YnJsazF5UUhsUDZEVzR2UHBlUnhO?=
 =?utf-8?B?Y013K1JWOGNORjdZV1Mvd2ZhUWM4QzlWN1NzMFFXUnFKV2JGOU4zYkdKem53?=
 =?utf-8?B?UkFJNTIvbWhleFlzKzlOeUJSUGkvRVZNRVlrU0VyaUd6TUpVSzhEMEJHUkhT?=
 =?utf-8?B?ZUZGVlJwWTZPMmtnZ0FDUHBndWJLRTFqTnNyeFZ0cmZSRVJPZnE3Y2o3U3J1?=
 =?utf-8?B?cHhKd2ErK0tzdFVvbHA2NEFadys2dEo4c2t3T1NhREJwNUdwVU1jTC83dU9M?=
 =?utf-8?B?eEZnYU9VQXlYeUhLOS95cmhQZjdTNTczVmlacEJiZHVlSWJrbms5bC93cTRo?=
 =?utf-8?B?dmp2em9rbXJFeUVVdWgwRFJuNVlNdWZrR3dhck0rWTlYblZQQkVjOSs5Vk96?=
 =?utf-8?B?RXR1OGNpT2xhK0dScW9QU2owTWYxSkJmRVpFWVFCYkFRKzZHZkJyd3RVV1dR?=
 =?utf-8?B?SnRQVVVYYU5wL2llNG5kcEp3SUlZd1hnVi9HU242RHNFbjhGTDFtZzlOMkRy?=
 =?utf-8?B?eEtDZ1NiQzVIallhU0ltS1NxVTZoZzBjV2g4cCs1U2R6UndQeUVyU09SMUYz?=
 =?utf-8?B?cFlMbzdQazJEeGZQbmNwSnpQdFpnSlV3ODREM3U0VlB1UGVYak1RMGhoMHQ3?=
 =?utf-8?B?d3pGV1NqcmNaVXdtbStKNjAxZ1BNU0QrVGdLVlBtMnNlOGF6REQvOGNoNlZG?=
 =?utf-8?B?US9XZXhVUUFPTmU3WHlVaTlGbFhVQ2tMdDJ1RjJ0ckxjWGZlTkRiWm5DTmFE?=
 =?utf-8?B?U1AwNmM3bC9NNmRhY0FSSDdhN2Vmajhmc1JkL2FPYlg5K28rOElRU0RVODVW?=
 =?utf-8?B?UW1wcjNtN09iY0JEZTRJYmxQb0x2MEJzUFRNWmE2UDd4RjFBNFh6R2RvMHVL?=
 =?utf-8?B?MkxpMFZEWlVYa1FaSUs5VlE2cm5BZjI3Nlh0cStieWFwOVNES3ErcW01NDB3?=
 =?utf-8?B?RDcwVmpkYUhMdVpScVcvVXRjVjZJN3h4cDFXdjlrYXlkdkVXbmhSVWUxTXJZ?=
 =?utf-8?B?L1gzTXh0UVQzOVBzOXlqZHo5UHRENUZRNmpVNUQvN2dOZmdlYUlVTEZZZERa?=
 =?utf-8?B?RVdDd09kNkxxbko1aS9JM2VlTEN5SXBvbjZyQ2ExQ3MwTzZwc1lLVFZRTG1R?=
 =?utf-8?B?T1lKRGEvbndoMC8rWmZ0YmU1NUs5NFZWY1lUeDcrMFRicTlLa1Evckx2M3BQ?=
 =?utf-8?B?cXNZK2xURlgydDNjWkhZMFMrc1RTNHdSZk8yRHFycjNrNDRKbDJscHBOcFdW?=
 =?utf-8?Q?3wr4Dumg2wAwxBS2JyHnkXltW+1CYIxr5k4xM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1AxN0JwZkRVQWJWNE14bVB2Y1VyeXordlFncURFZzR2Nm80YW01c3JIVGFW?=
 =?utf-8?B?UGJhUFpGUFBuY1dYVTF0S2ZtaGlmZ2VxNWpUbzlJK0JoN296eFpkQjZCcnhG?=
 =?utf-8?B?OWVlSHZzNmwrVm56b0pZRFJrdUh0M1ljYkdBbXoycGJJczgrcnJmZFdTTlJ2?=
 =?utf-8?B?bTlwbFY3NUNtUXJuSFB3WDZpRVJpQTFTVTJWS3IzTTVRQWIvM3JxanBIT0Vr?=
 =?utf-8?B?Yk9HbVZlZ3FkWk5kRGRXUUg2SmlYMEtQQWtkODB4Z3VCWVBSMVFacFdreC9O?=
 =?utf-8?B?ZEt5WG1xeW5yWlI3ai9yeFNWU0FSY0RYN2l0YUtmMVBEQm5xdmYwSDB4c1dH?=
 =?utf-8?B?MWwvY2VTK1dycFdsU21NK1YyRm1WWW5WbVdra1p0Z1NLdittbkkwOWVxbC9i?=
 =?utf-8?B?UzFxZTZ2VEVTOTl1Y1h1Z045bk42MjlvVTFXUk9IbWtwVDNUL1dUOEMyWFRC?=
 =?utf-8?B?Z2Y4eE9FVVlwNHVHYW1PdlZaeExvS3RmSXA1dmc5bXl3RlhZOUd1N2xJdHdY?=
 =?utf-8?B?bFJVaWZUQlJpcW1YaTZORm5USzhhNEliMld1cDlUUVRlQ2I3cmtBdXRpaTdY?=
 =?utf-8?B?azZnSDcxS1RuM09NNHFPSmthNlo1dkpQVzB4R3F4UTVSTmZZWWtZMkRBd3dR?=
 =?utf-8?B?OW42ekpLUitFNzNkMHF3SS81TGdKL0o3aUNFS0l3Q3Ric1R6aFVVRExSTUow?=
 =?utf-8?B?UEdlS3F3MFAxZUpJcXBlbXJPMFF0ZXlDV0s4enF1R01qNms1VkRmd1dlWm5N?=
 =?utf-8?B?Wi9CaGNTRE5vcnZJSVFoelVPRDBtbGdXek9tZzFRU1lyRFkyTldncDZlRGl6?=
 =?utf-8?B?dGdYSzNYODFCNDJLU28wUTJJcWxuaTQzQ0tMdFBPNDB5RHVHQjdpM2lycWV0?=
 =?utf-8?B?TTUvc3F2aFozUk14MnhSWlZHMGdoc3R5SWNpY2R4b20xWlhlaXhESVN1NjhG?=
 =?utf-8?B?aEVRR1RQcGRmMjNiUTZDZFkxTVFWSGtCR1ZBVUsvbTg0RmdsalRZUytRN0hn?=
 =?utf-8?B?S1N2bDNqQnVsaW9PM0ZuRGQwVW9VTzQ4akErQzU3ditXS2dzcDIrdlh5Z2ZN?=
 =?utf-8?B?U0RwQ3UwUDlwVktuQXE4cFV5b3NBRmt5M3E3UnhnTW5iRFlJWEZ2RmlxWUg5?=
 =?utf-8?B?Q0gwNlp4SFI3ZU4wcGlBanJZS1RWeGtkemNmb1g3VjhMWWxjandycnZ5U0U2?=
 =?utf-8?B?azZQdElsazdxZHBPV2FldW5aOWVTREZsRi90ZVJYemxoYmVLdHpZcC8wSk9l?=
 =?utf-8?B?TE1EVXYxNUhVb3QrdVpYZGpVRDZTN0RORy95VjBEZFRmbDN3bThUUVlWME5I?=
 =?utf-8?B?N2RNMUs3Zzl5UCtKdVZwK1hrR3l4ZmVNaE84SklRekZxNWpiaDBBNDlNOURo?=
 =?utf-8?B?eXZJZXQ0OG5WOHlhNytsV0pjMEZYUE5VTEFhNE1pYkk2NkV1U0lsSGg2MFBH?=
 =?utf-8?B?eU5uRUtuRnNUV0x5ZFBqeGxLUGdOaEJSaXYvRTRvUml6bUZpUVFMcGtJUnoz?=
 =?utf-8?B?MGxVbnBiSExrMkJhc1NrM2Y0L2NOYWNCdU1xUFQ2VGlQUnVRMXJsai93MzRZ?=
 =?utf-8?B?UnJCV3k2MHc0N2psejRxc3drZ1VuSmlVelc0Rlc1K1BmemNBYzNIMEhUSUto?=
 =?utf-8?B?dFRkZUdMZEd3aWYrWWZRQ3FvamQ0U1BZOGJFb3p4UzlzSy9ZZFkwd1BJelkw?=
 =?utf-8?B?QmJiVDdvOUtlallJL0U4RWdpeVE0aTZvN1F6V0gzRDMzK2F0RDJyNFluVUI2?=
 =?utf-8?B?QlYxQjAxSWxkQ1ZIVE5keFR4YWtFc1lxOGIwcHR3aUpMeG4wR1FlUnhBNWxv?=
 =?utf-8?B?ankrdGwzUzNSQUVaUjg3ZkVQOXVQM1RtVXd0UkhZaTZldWpndklmRDkyVzB5?=
 =?utf-8?B?cm9RK0loMkZTazNzM0Yyd1dvcTJUUU1Lanh3cnhSclBCTUErL2plKzc4dmJJ?=
 =?utf-8?B?UzB5aVZMVExQVXh3a04wbDZ6OWE1R3JLWmJlLzQreGJmUnVPREhBME1TNm9B?=
 =?utf-8?B?WnVQTVZsKzdjbXV0OXcwcWp0bU5sREdsQ3phcittWjNaZW95a3RxSGpwY052?=
 =?utf-8?B?aHU4TDhsT3BIMTJ5YU04b3h1alY3Y2VRNzVGaDd3dGxBL0pZb0FlSWdLc1RG?=
 =?utf-8?Q?+WcmsMN+/KKqxXVZjEzg7Dhl1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5af644-8865-493f-ec2c-08dcb6d41498
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 11:28:37.3998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMUN5X5w3Xw26/dEubtvd75R+k/vs2bGIZijQdOHGDeTacEb/wfz3eaTiYYU8tHG+RDBFh85Ts6EMeQTnrbnpFKaXH0ua9tCKEaRtlpNPKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7645
X-OriginatorOrg: intel.com

PiBPbiBUdWUsIDIwMjQtMDgtMDYgYXQgMTU6NTEgKzAwMDAsIENsYXVkaW8gU2lxdWVpcmEgZGUg
Q2FydmFsaG8gd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI0LTA4LTA2IGF0IDA4OjIxICswMDAwLCBS
ZXNoZXRvdmEsIEVsZW5hIHdyb3RlOg0KPiA+ID4gPiBPbiBNb24sIDIwMjQtMDgtMDUgYXQgMDk6
NTUgKzAwMDAsIFJlc2hldG92YSwgRWxlbmEgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBGcmksIDIw
MjQtMDgtMDIgYXQgMTg6NTQgLTA3MDAsIERpb25uYSBBbWFsaWUgR2xhemUgd3JvdGU6DQo+ID4g
PiA+IFsuLi5dDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhdCBicmluZ3MgbWUgdG8gYSBj
dXJpb3VzIHBvaW50OiBpcyB0aGUgSW50ZWwgVERYIFNWU00NCj4gPiA+ID4gPiA+IGdvaW5nIHRv
IGZvbGxvdyB0aGUgU1ZTTSBwcm90b2NvbCBpbnRlcmZhY2U/wqAgYmVjYXVzZSBpZiBpdA0KPiA+
ID4gPiA+ID4gaXMsIGl0IHdpbGwgbmF0dXJhbGx5IGluaGVyaXQgdGhlIGVubGlnaHRlbmVkIGlu
dGVyZmFjZSAodGhlDQo+ID4gPiA+ID4gPiBjb2RlIHdpbGwgYmUgcHJlc2VudCBpbiB0aGUga2Vy
bmVsLCBzbyBpdCBvbmx5IG5lZWRzDQo+ID4gPiA+ID4gPiBhY3RpdmF0aW5nKS7CoCBIb3dldmVy
LCBpZiB0aGUgSW50ZWwgU1ZTTSB3ZXJlIGdvaW5nIHRvIGlnbm9yZQ0KPiA+ID4gPiA+ID4gdGhl
IFNWU00gcHJvdG9jb2wgc3BlYyB0aGVuIGl0IHdvdWxkIGhhdmUgdG8gcmVpbnZlbnQNCj4gPiA+
ID4gPiA+IGV2ZXJ5dGhpbmcgYW5kIHRoZSBDUkIgaW50ZXJmYWNlIG1pZ2h0IG1ha2UgbW9yZSBz
ZW5zZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEkgY2Fubm90IHNwZWFrIG9uIGJlaGFsZiBvZiB0
aGUgSW50ZWwgVERYICpTVlNNKg0KPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uLCBidXQgZm9yIHRo
ZSBMaW51eCBndWVzdCBrZXJuZWwgdGhlcmUgaXMgbm8NCj4gPiA+ID4gPiBpbnRlbnRpb24gYXQg
dGhlIG1vbWVudCB0byBzdXBwb3J0IHNtdGggbGlrZSBTVlNNIHByb3RvY29sDQo+ID4gPiA+ID4g
aW50ZXJmYWNlLiBXZSBoYXZlIG1hZGUgYW4gZXZhbHVhdGlvbiBvbiB0aGlzIGR1cmluZyB0aGUN
Cj4gPiA+ID4gPiBzcHJpbmcuIFRoZXJlIGFyZSBubyB1c2VjYXNlcyBjdXJyZW50bHkgdGhhdCBy
ZXF1aXJlIHN1Y2ggbmV3DQo+ID4gPiA+ID4gcHJvdG9jb2wgaW50cm9kdWN0aW9uIG9uIEludGVs
IFREWCBhbmQgaXQgZG9lcyBicmluZyBhZGRpdGlvbmFsDQo+ID4gPiA+ID4gY29kZSBjb21wbGV4
aXR5LCBldGMuIElmIGFueW9uZSBiZWxpZXZlcyBvdGhlcndpc2UsIHBsZWFzZSBsZXQNCj4gPiA+
ID4gPiBtZSBrbm93Lg0KPiA+ID4gPg0KPiA+ID4gPiBJZiB5b3UgcmVpbnZlbnQgdGhlIHZUUE0g
Y29tbXVuaWNhdGlvbiBpbnRlcmZhY2UsIEkgY2FuIHNlZSB5b3UNCj4gPiA+ID4gYXJlIGFibGUg
dG8gZ2V0IGF3YXkgd2l0aG91dCB0aGF0IFNWU00gY29tbXVuaWNhdGlvbiBjb21wb25lbnQuDQo+
ID4gPg0KPiA+ID4gVGhlIGdvYWwgaXMgZXhhY3RseSB0aGUgb3Bwb3NpdGUsIGkuZS4gZG9uJ3Qg
cmVpbnZlbnQgYW55dGhpbmcsIGJ1dA0KPiA+ID4gdHJ5IHRvIHN0aWNrIHdpdGggZXhpdGluZyB3
YXlzIG9uIGhvdyB3ZSBoYXZlIGJlZW4gZG9pbmcgdGhpbmdzIHNvDQo+ID4gPiBmYXIgaW4gTGlu
dXguIEluIHRoaXMgbGlnaHQgU1ZTTSBpcyBhbiBpbnZlbnRpb24gdG8gZG8gdGhpbmdzLg0KPiA+
DQo+ID4gSG93IHdpbGwgSW50ZWwgYXR0ZXN0IHRoZSBTVlNNIHNlcnZpY2VzIHByb3ZpZGVkPw0K
PiANCj4gSXQncyBpbiB0aGUgZG9jdW1lbnQgdGhleSBwcm92aWRlZCBhdCB0aGUgdG9wIG9mIHRo
aXMgdGhyZWFkLiAgSSBnYXZlDQo+IGFuIGFuYWx5c2lzIGhlcmU6DQo+IA0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMTNlYTMxZTI2YTk4OTE3MjI3NDhjNWQ2ZTgyM2Y3N2I2YzhiNzgw
OS5jYQ0KPiBtZWxASGFuc2VuUGFydG5lcnNoaXAuY29tLw0KPiANCj4gQnV0IGJhc2ljYWxseSBp
dCdzIHRoZSBvbGQgdHJpY2sgb2YgdXNpbmcgYSBoYXNoIG9mIHRoZSBwdWJsaWMgRUsgYXMNCj4g
dGhlIG5vbmNlIGZvciBhIFREWCBhdGVzdGF0aW9uIHJlcG9ydCBhbmQgd3JhcHBpbmcgaXQgaW4g
YW4gRUsNCj4gY2VydGlmaWNhdGUuICBUaGUgcHJvYmxlbSBpcyBpdCBkb2Vzbid0IGFsbG93IHRo
ZSBhdHRlc3RpbmcgYWdlbnQgdG8NCj4gc3VwcGx5IHRoZSBjaGFsbGVuZ2UgKG5vbmNlKSBzbyBp
dCdzIG5vdCBiZXN0IHByYWN0aWNlLg0KDQpBcyB5b3UgeW91cnNlbGYgbWVudGlvbmVkIGVhcmxp
ZXIsIGZvciBlcGhlbWVyYWwgdlRQTSBpdCBpcyANCmFjY2VwdGFibGUuIFBlcnNpc3RlbnQgdlRQ
TSBoYXMgbm90IGJlZW4gaW4gc2NvcGUgb2YgdGhpcyBjdXJyZW50DQpyZWxlYXNlIHNvIHRoZSBy
ZXF1aXJlbWVudCB0byBwcm92aXNpb24gdGhlIG5vbmNlIGhhc27igJl0IGJlZW4NCnRoZXJlLiBB
Z2Fpbiwgb25jZSBKaWV3ZW4gY29tZXMgYmFjayBmcm9tIHRoZSB2YWNhdGlvbiwgaGUgY2FuDQpz
aGFyZSBoaXMgdGhvdWdodHMgb24gaG93IHBlcnNpc3RlbnQgdlRQTSBjYW4gYmUgaW1wbGVtZW50
ZWQgDQppbiB0aGUgZnV0dXJlLiANCg0KWW91IGtlZXAgcG9pbnRpbmcgb3V0IHRoZSBwcm9ibGVt
IG9mIHRoZSAnYWJzZW50IG5vbmNlJzogaXQgaXMgbm90DQpwb3NzaWJsZSBmb3IgYXR0ZXN0aW5n
IGFnZW50IHRvIHByb3ZpZGUgYSBub25jZSB0byBiZSBpbmNsdWRlZCBpbnRvDQphdHRlc3RhdGlv
biByZXBvcnQvcXVvdGUgYW5kIHNheWluZyB0aGF0IHdlIGFyZSBtaXNzaW5nIGFuIGludGVyZmFj
ZQ0KZnJvbSB0aGUgT1MgZ3Vlc3QgKEwyIGd1ZXN0KSB0byBTVlNNIHRvIHN1cHBseSB0aGlzIG5v
bmNlIHRvIHRoZSBTVlNNLg0KSXMgdGhpcyBjb3JyZWN0IHN1bW1hcnk/IElmIHllcywgd2UgaGF2
ZSBhbiBleGl0aW5nIGludGVyZmFjZQ0KaW4gTGludXggT1MgdG8gYXNrIGZvciB0aGUgcmVwb3J0
L3F1b3RlIHZpYSBjb25maWdmcy10c20gaW50ZXJmYWNlDQp3aGVyZSBhIGZyZXNoIG5vbmNlIChv
ciBhbnl0aGluZyB5b3UgbmVlZCkgY2FuIGJlIHByb3ZpZGVkLg0KVGhpcyBpbnRlcmZhY2UgY2Fu
IGJlIHVzZWQgd2l0aG91dCBtb2RpZmljYXRpb25zIGZyb20NCkwyIGd1ZXN0IGFsc28gKHdpdGgg
U1ZTTSBlbXVsYXRpb24gc3VwcG9ydCBvZiBjb3Vyc2UpLg0KVGhlIHJlc3QgaXMgdXAgdG8gdlRQ
TSBhbmQgU1ZTTSBkZXNpZ24gb24gaG93IHRvIHBsdWcgdGhpcyBpbnRvDQpwZXJzaXN0ZW50IHZU
UE0gYXJjaGl0ZWN0dXJlLiANCg0KQmVzdCBSZWdhcmRzLA0KRWxlbmEuDQoNCg==
