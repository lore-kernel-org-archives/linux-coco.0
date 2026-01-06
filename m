Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6472FD68D
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727046; cv=fail; b=TtQ+xyo2cuJlFG26TbmUumRhU7t4ycdly6Ud9ghBVcSj00YNsWhUbJRoRo6rF1mec1qujVIki2pPBlz4riHXXzT3CzoA+oztDLeDBFGcYwZw2jxsMcoHcgKaOsEAcc/CHQJOeppeHGdFQ51Jn0dj8NdF0+0wXQujAPAKfOKE57k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727046; c=relaxed/simple;
	bh=s7/7UNdiupn3Uh62akhuEJubOznMCgmajEBGJhFL8b4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uq2A3J9hUmJkWQCdiddwPwoElu6xtYoQP2j1zBpueu2heao9oU+/mvNVC6UaJtnEADcG+pAzSnUDFk3l6Vab0Mm8xIx/3MZjtLD51rnqrvcJYe5FSd2j80c2rcF2W5WSAnxMi5aCOmuQqp2P/KUmwvfO1t8ZWO3JR/egxl9KEsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKNCHqTZ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKNCHqTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767727045; x=1799263045;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=s7/7UNdiupn3Uh62akhuEJubOznMCgmajEBGJhFL8b4=;
  b=kKNCHqTZRKcV1Fq1MExsRT69MWIlBqJRRiQ2gAMSmM58lnQTj5384yCI
   ukscaPW/CFQB+xgfSvy7HV7NmfIkiYF48zPY7MeDKFCBR4ns2HAQH7rn7
   UMrhjwLDr1BaVyb/eHYLvwkHZfzAdoY7Ud5xPuq5FxTktIX72XXlMaBWk
   XNDcN6Jp/OkfE0Ovcxeu05Myxw2ybCgvpvmZf6sP22R4tSbWJ6TVgrzwR
   PXKSKD/dps2f8KoAw0zaPAxZv6l9oFrcCNq3a9PUmWSSQIpAbDnx564ZK
   2IlHP2HnqDXkBK/bVWYOd+pqmCPtDnsOcDwW+K5cbEtxWrTGavga0Ce7G
   A==;
X-CSE-ConnectionGUID: EU0ixtEYSDqb1h16j2U8aQ==
X-CSE-MsgGUID: 1g/kkiPxRZKw0E+u2vbWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91755892"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="91755892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 11:17:24 -0800
X-CSE-ConnectionGUID: 1SoswRXvRzyF8uv8UIvhLg==
X-CSE-MsgGUID: lI1XQ6yjQ0OsvBljxRJILg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="203668021"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 11:17:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 11:17:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 11:17:23 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 11:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcPDTtJ77fp2zSbosADyABSh1IPI01Am0DRVW1ybkYN6AwV7RQ+9KU+FcK4+vqxabv4O3bmXLYSxBxYYvriquxiSUl3b9mZBuXKFR2MDC9KCaGKaRGRctljnW3Y2/0D1/dukW1gYJjjonrZr2zg5JtnLbjeShB1AR1gb0sLYJcKfwsWmJG/YWAoLO2zKYNyFJ/lNlfK7apMX9RM4c6CA+mvsLrOZflMLf4zjIUtpYAZHenmIWgU+P5GSiDCWryRtNX4Qf/amx/BKHAwKUy7U/eBXHhIIF0wPhsa/qhPdsAXsqD3GdlahQSPImiWIZWx+O5JVJtHbciMmQ808JK8biA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7/7UNdiupn3Uh62akhuEJubOznMCgmajEBGJhFL8b4=;
 b=IcGredRSZXy/9Twv4OB+m3HgxU3yPbVVwTidGlsSssg9ZdAiYJGlVfBsY+r/GI3iI9Ns6WK62GNgGPwMC+Z8D5FwQeus5TQUUFYKymGrNrElTK7Ozishdyh/+U6V7ZEcmbJLE40h58fFqcP0Xa9UCFHJoYwGYZJYP/dSBU1RZB+qQqmIsbO/sGZfyjR/gCL6Txh2yJYbxfOdClsnlaQuWrCma2AsXWD+ftwhOptLU920bKp+vbwAi9mq1BowllPGu78tMNYLdHZ640hdFYCNxeF95FHJI4aQ6o6BqcFvTrgS0StMVdvipS561DGZIlnyIibEVyh1CCKn8tlhew5uhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA3PR11MB8022.namprd11.prod.outlook.com (2603:10b6:806:2fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 19:17:21 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 19:17:21 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "Lange, Jon"
	<jlange@microsoft.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
CC: "seanjc@google.com" <seanjc@google.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "john.starks@microsoft.com"
	<john.starks@microsoft.com>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"will@kernel.org" <will@kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>
Subject: Re: "Paravisor" Feature Enumeration
Thread-Topic: "Paravisor" Feature Enumeration
Thread-Index: AQHcfow0RCFtcJgBlEGz9iN3ka5sDbVEXwmAgAEmBgA=
Date: Tue, 6 Jan 2026 19:17:21 +0000
Message-ID: <4ed7bbb991de771e68d435ff5aca929f20616295.camel@intel.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
	 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
In-Reply-To: <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SA3PR11MB8022:EE_
x-ms-office365-filtering-correlation-id: 5c51b13a-61a6-483a-38d1-08de4d583733
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SWZveVM0VnZoY2xRUjgveEJXN2xWK2Ryamd2Tyt2OXJUMEFWNHBxTHVSM0Zn?=
 =?utf-8?B?cWdSSk5ENHBveXdSNkxsSnZmZTlrMEwybFY3Vk9kc0Jqb1F0QUpkOWxNaXBX?=
 =?utf-8?B?UHNucVV1MzZiNGluSTI4VTBUVEFXN20zQjZZU0dJV3VsVUpIRm53enpuazQy?=
 =?utf-8?B?VnpEb29zZ2JpMFdQcEdZUnlWYUNtbm9Scmc5QWtHYnk5WU5oRWVMbUtUSVpF?=
 =?utf-8?B?L3NIQ0g2NUJEa2RVS2FwaFlYejlyZ0ZPWXJSSkJsT0NFWmFaTVVBVHg2R3Zr?=
 =?utf-8?B?TlZLRmFNS01md2dTbWNVQlRrVzlwZzlsMDh6QWZtWXQ1QjBOaDFtNTBmN0FK?=
 =?utf-8?B?MFFWUU04M0dhVC9RQVZEN0dEOHhYenhKRnBjUzVjMGE2L0plYlpDY3gzTUZG?=
 =?utf-8?B?MTVqU2J3QTkzTUdaYWFOZnhRdFJhNTQ3dDlCSnN5djVPeDh6bkZCQUNZTlhW?=
 =?utf-8?B?bWIxUVY0QTVNR1k3NW15NzBDSlhXaFd3Q1puaEJNTEl4dTdIbVdSYXU3TU5P?=
 =?utf-8?B?Ulkxa2NVYUg1bEhQbDZwSVJINmk4T2JEOEVYbGZnQTgzVDhjNTdxaHp0N1Vi?=
 =?utf-8?B?Ny83czdCZUt0YldEMG5XL1dSSkwxNTAva2dYUlB3NVRZVTBBbmpqc2tHRjhY?=
 =?utf-8?B?elVYYWw5TlpzQ1RZRXEzc3JSbklCMlhTK1ErclB6Qkd4NnZFcmNqcW9SNFFO?=
 =?utf-8?B?bzlnOHlwbTkvRU1EZHlEbzVQd1BGK2cvMTl5cS9LN0NwYjBzWVR3bExTNWx3?=
 =?utf-8?B?NzArYTgrWEpjaUhLNGhXVmtORFVtNkVLY0VwMkFoMTNOQVRqdjdiT3JTR3dh?=
 =?utf-8?B?NjhyVGdGTjRhKzZSYjFCajd6cWZmamRnemxBbCtxSzREQU9laWdLM0srd1F4?=
 =?utf-8?B?L0tIMkgzblZRenEwTmdPNFNueWI3TTZlUW1zYld5Uk5vRTNNTkFiT29yM0dy?=
 =?utf-8?B?L1dXbThmUmYxa0VJZ0V0cVY5dEhsUnJGWGVLZThIbW9weTIvK0RBNkFsaWZU?=
 =?utf-8?B?RnZKbVhMWjdtS2EzR3oxZnEwU29MZ0lscWNqSnR6Myt5TGNwOUt3VkpFdjRF?=
 =?utf-8?B?MTg4ZHhJZE1URHdPbzkrYmtPeVRaUytFbnJXd2x2dEdSUmlQbjBvVnZwYkFm?=
 =?utf-8?B?ai9TT0VQZGovUjdoZXpQQjAzYWhETFdOeDBCSGtjVFdnbXN4dCtJeWJ3S3Q4?=
 =?utf-8?B?UUhudER1ZlJINHhEUVBMTnFBMnRCMlJlTUZsYUJuMWs3RGh5TU9WVzZ4ajl3?=
 =?utf-8?B?TEUwYVhQZUczMkNhamIySnBldTBpb1Y0VThFRkc5bnhWY3cvZDN3aHpyL3Vl?=
 =?utf-8?B?elZYY1A0NHM2WmpablI4T1hKK2drY1d1SU1rekdCbXJSRWhzeTZJdEVLZUN6?=
 =?utf-8?B?YXVtcDNQMW5nUlM4WllpY3hFL1dERklKeTM1VmVNUUVtckxySGZuK3JRUTJH?=
 =?utf-8?B?d1FOZkx1ZFFRSEkycnlFWEdkaHhaZTRKZUhwVzhPMlQ4dXRLSTNyNGVUYy9Y?=
 =?utf-8?B?RjhzV2c5em9YdUh1YzMwcHFVSktYTE1jY0xmTldpclY4S3B2ZVpXMEhRZWZH?=
 =?utf-8?B?ODd1UXVrK05lcitzbnliK0ExSkRTalRIZ0tvbXc0QjRwVTZIdWxQR2JKeWw0?=
 =?utf-8?B?VXEwYUpIa0JLeGdoNUFoUVIvYnNYZ2tFMXJoM0E4dlAyRVFDdWhkWWFzMWlj?=
 =?utf-8?B?djB5SGxZVUJ5NzN5K25oc0h0eUFqYWZsN253Nm1BNkJsRHl4a1lDVi9aUUo1?=
 =?utf-8?B?NStQS1VOM3A0ODVPMUcrWjRxU01TRHptNHdlUEJhN0g0SVUrT3VZbmMydTdu?=
 =?utf-8?B?MVNuTVNaMWNYK0k0SFZic2w1bXNYTEp1alhmNkdnN2JTeW5XQlVWYlFOMEI3?=
 =?utf-8?B?anN3THlaYlh2R1ZhK3Rjdy9GVFpIUmFtQW1tSGVVYmtpVnR4TWFNbGh3dks4?=
 =?utf-8?B?ajdmR1RPQitVT3B2b0lCeVBoNUtvUWpmTTR4VlRpd00vNkFxU1pOODFzOGo0?=
 =?utf-8?B?ZFcrYXlWSUxmWTFXQ0xJUXZjTW10K043RkJwZENCMGw2YkJPU3BEY0NrV2Fo?=
 =?utf-8?Q?Re9r2I?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVZHT2xPZ2VMMzZSdVd6T25xejJGdExxOWpCSWVyYnZFLzVReGtkbTBRMUlo?=
 =?utf-8?B?YkIva1hobWVhd016VWV0NzRMWW54ajRLNW9HREVpYlY3RWhCakJjdVB6elBT?=
 =?utf-8?B?bytGUlZINGVKSVVReG50bkExRTE0RldyeHlRS2s4dHp6SHdCeTl4MnhQZEsy?=
 =?utf-8?B?S3lrZW9wU0VxcnZWYUtPdFBIc2lTMG1SYjhNbjN2dEI3OHFpd290NDRMTUM3?=
 =?utf-8?B?Wjlhc1hnSDdlVUg1OGNQVkZJamE4aTVJRzczVnVFL2JudFQ1MHFGYU0vRndH?=
 =?utf-8?B?d2RRTEh2MEUyb0FGMnVoczF6UWN3VitDVm4vNzFqSTZRTVV6QzBxMmxVYzhS?=
 =?utf-8?B?TnFYNkhIY1V6ZFdxc01IL25hcnFaVkpVQTVvbjBSbkdqaHBTQVpsbTYxaG9I?=
 =?utf-8?B?aTE1V1ZjanQzUEZkQ09zZzIwYmN3S1FBVzdrQmNGREp2WDRVRHA2YzVreVk5?=
 =?utf-8?B?WVpPT3pOVFIrSXFNVm1US3JEL2cvTjhMcHZ2aklmSG9PWE9RVEh5ckZaN25H?=
 =?utf-8?B?SDdvZUtQcm05N2lSMVIrbGdRRHF4OVBHT3lCbDRHREUwK00xa080UVZvOTVq?=
 =?utf-8?B?c0x2TStCcVkrVHdTNVlPcUN4RnFSRUFCWFc5NW5LcXhXMGJmbTMrRmhPeWkz?=
 =?utf-8?B?Vktxak5SK3ZkRERpOGtmVlg3cVFVK2R6UnorQWZQSmRqQndYTjJsb0M4Qk43?=
 =?utf-8?B?NmovVXh2SjlMQnRSQWZMdmI2ZjNTckRVYnhvSkNmSEd3MXN5dnhLTXVHdW9l?=
 =?utf-8?B?VkFOakgra1orQmVXMVV0WmEya0NyK202OFRNVVAwQlIzK0o5NFo5UWJRS2N0?=
 =?utf-8?B?RTZwZFRmNExBUWRmcVVmNVAwMGJKUEMyelVFUUtPUUFlcnBKTmU3TGdyMFYv?=
 =?utf-8?B?UlpJNmdkbmoyNThxNlo4dFF3S1pKVHBabkZQQUg4RzJDTHlvSnRIczdFQkRw?=
 =?utf-8?B?OG5YRHdKSkFVT2YvUjBwU1NvTHVFWVA2TDdLZUpUeXlSOUxKV2wyU0JXdWFw?=
 =?utf-8?B?Tm4vUGJuZUdqVHVZWjE2akJiZWxJaTVFNXFuckhCbFhzYXh0TEQ5SjNCeEpx?=
 =?utf-8?B?ZFVRck80OXJjMEtqekJWU3pWNDdNcC9oWDQ5Q0RBdk5YVWlpTjAwS0ZoaU1n?=
 =?utf-8?B?emRLM2FZOXhMSXMwMUR0eEZFb0lOVEtmci9FN1luV24ydytpWVh5OWcrWlkx?=
 =?utf-8?B?TThkQVJJOXRwV0QrbklQT21UMTl5UG01ek5TdS9FVjgrK1lTUmtuMXpKd2J5?=
 =?utf-8?B?L2JDU3ZwVEZTTVoza0duaE1UV0lKa0ZadHNPaFFrVU9GWEczK1JGMUg0Y1Uw?=
 =?utf-8?B?c2JGekdzaytaMERXcnVEOFNCNmErQldZNFR5UDNzbW5ManhtbzhSYXVVTTZh?=
 =?utf-8?B?b3poMjlwWXErcHp5SDZaNVh2MEdFQU9nRUhlYzZBZHRjMHBkOHBzdVhkS2E2?=
 =?utf-8?B?WGg3Y3E5RDZ5YVl3Ym5FU1JnUUM2cVgwRlhJaURhSGZnVWNOZnNZeU8rNmNO?=
 =?utf-8?B?V0IrRmtMb29XSU4rZElydzVQUVViMVFNTnRROEE2aVdnc3lVZktnSjJMK2cw?=
 =?utf-8?B?bVlEeWwxb0Irb1ZwVUJNakZQYittelZXNUQvWFF5VjNyNmFEMmhueWc1QTN1?=
 =?utf-8?B?S3BoV0NWc0RoNko0eTBhdU41OHlSWER0empKYWZxOXMvT2tBaWV5a3FOVVpi?=
 =?utf-8?B?M2xvdjdzeFhXbzF6NWN1VWgrTlhiMDlRNnFaK04zRXFRbjZlRkprNkwzc2Nm?=
 =?utf-8?B?OGNGL29Da3pHb1lxQUNDTmlTa2RyQTlML2FjYUJudWNJYzRESytYek05bEVQ?=
 =?utf-8?B?MFB3VUVUZVFhOHZYWnVGZUtEclhwV3RsZURYTGtYNDRHM2J2Vk9Db3dTRXBM?=
 =?utf-8?B?TGZRUE9rNE4zR0M4SXdFOFhRTFhZanQyZjdYaDIwRjZ4RnRJQmwvMjE5alFh?=
 =?utf-8?B?dUhlNWU2RHhPQ1hjYm11OHhIN1B5L3pFNTVWOFdHQWVtLy9PZHBKNzQwZkZy?=
 =?utf-8?B?cDNuTWtldVlwM1pSdzlXa1JMY2pUd0NHcE5CWmdEV3pWeHV4OWZyMWJxaFp2?=
 =?utf-8?B?dnBHTkI3YnJ5M2JhenY1cUV4TkcwbmFSWFJzRjl6UHJBNnpmODB1c1ExMHBv?=
 =?utf-8?B?cTIyZkpNdjMzenExdGpiWmRFc1E3Tk1acXZMb1NvWndOcmE0R2FpV2JNV1lr?=
 =?utf-8?B?bTMxdXp0OGdqVk1KeExaTHFHR3pCaGowaU5WVU5lNkJPNDFZd2gyUm4rUzh3?=
 =?utf-8?B?K3FxWlU5djBZSVVYWDVSYzVNTnB2QU0xaE1yem9yRlNhQWpkZ0t3OEFPNm1h?=
 =?utf-8?B?b25TSUtUZ0JVdWRPLzI3eGVmTGZBRytpZEJObVZybXhUR0xEdDJLdlRFd1hE?=
 =?utf-8?Q?8TzeJZ5Nxy/lDfIQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FE326B45E85A54CBEEA6799426B1827@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c51b13a-61a6-483a-38d1-08de4d583733
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 19:17:21.1116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dmR7ZHLDkvXFXm5OqvL0LheJi/vv9g92E0ePPrM6567XW+UjKDgIT16UcwRcN5A9Znq8WgDbDcnUiSa9zeL7SUKjSwDI9X/+3JZAzBMHST0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8022
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDAxOjQ0ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBJIGFncmVlIHRoYXQgaXQgc2VlbXMgbGlrZSAianVzdCIgYW4gZW51bWVyYXRpb24gcHJvYmxl
bSwgYnV0IGRlc3BpdGUNCj4gYXR0ZW5kaW5nIHRoZSBwcmVzZW50YXRpb24gYW5kIHJlcmVhZGlu
ZyB0aGUgc2xpZGVzLCBJJ20gc3RpbGwgbm90IGNsZWFyDQo+IG9uIHRoZSBwcmVjaXNlIHNjb3Bl
Lg0KPiANCj4gQXJlIHdlIHNheWluZyB0aGF0LCBpbnNpZGUgYW4gb3BhcXVlIGJsb2IgdGhhdCBh
IGN1c3RvbWVyIHByb3ZpZGVzIHRvIGENCj4gQ1NQIHRvIHJ1biB3ZSBtaWdodCBoYXZlOg0KPiAN
Cj4gKiBhIHBhcmF2aXNvciBhbmQgYW4gdW5hd2FyZSBPUywgb3INCj4gKiBzdnNtIGFuZCBhIGZ1
bGx5LWF3YXJlIE9TLCBvcg0KPiAqIHNvbWV0aGluZyBpbi1iZXR3ZWVuIHRoZXNlIHR3by4NCj4g
DQo+IGFuZCB3ZSdyZSBsb29raW5nIGEgd2F5IHRvIGRlc2NyaWJlIHdoaWNoIHBpZWNlIG9mIHRo
ZSBpbnRlcmlvciBzdGFjaw0KPiBvd25zIHdoaWNoIGNhcGFiaWxpdHkvc2VydmljZT8NCj4gDQo+
IElmIHNvLCBpdCBjYW4ndCBjb21lIGluIGZyb20gdGhlIG91dHNpZGU7IGdpdmVuIHRoYXQgaXQn
cyB0aGUgY2FwYWJpbGl0eQ0KPiBlbnVtZXJhdGlvbiwgdGhlcmUncyBhIGNoaWNrZW4vZWdnIHBy
b2JsZW0gd2l0aCB2ZXJpZnlpbmcgdGhlIGludGVncml0eS4NCj4gDQo+IEl0IHNlZW1zIGxpa2Ug
aXQgbmVlZHMgdG8gYmUgcHJvZHVjZWQgYnkgd2hhdGV2ZXIgdGhlIGZpcnN0IGNvZGUgdG8gcnVu
DQo+IGlzLCBhZnRlciBnYXRoZXJpbmcgY2FwYWJpbGl0aWVzIGluIGEgdmVuZG9yLXNwZWNpZmlj
IHdheSwgYW5kIGRlY2lkaW5nDQo+IHdoaWNoIHNlcnZpY2VzIGl0IHdhbnRzIHRvIHByb3ZpZGUs
IGFuZCB3aGljaCB0byBkZWxlZ2F0ZS4NCj4gDQo+IEFuZCBpZiBzbywgdGhlbiBpdCBkZWZpbml0
ZWx5IGNhbm5vdCBiZSBpbiBDUFVJRCBiZWNhdXNlIHRoYXQgbmVlZHMgdG8NCj4gYmUgZml4ZWQg
ZnJvbSBwcmlvciB0byB0aGUgZ3Vlc3Qgc3RhcnRpbmcgdG8gcnVuLCBhbmQgZG9lc24ndCBleHBy
ZXNzDQo+IGR5bmFtaWMgcHJvcGVydGllcyBvZiB0aGUgc3lzdGVtWypdDQoNCkZvciBURFgsIHRo
ZSBndWVzdCBoYXMgc29tZSBjb250cm9sIG9mIHRoZSBDUFVJRCBiaXRzLiBCb3RoIHZpYSAjVkUN
CmludGVyY2VwdGlvbiwgYW5kIHBva2luZyBhdCB0aGUgVERYIG1vZHVsZSBndWVzdCBzaWRlIGlu
dGVyZmFjZXMgdG8gY2hhbmdlIHdoaWNoDQpDUFVJRCBsZWFmcyBnZW5lcmF0ZSBhICNWRS4NCg0K
VGhpcyBpcyBpbmRlZWQgYSBjb21wbGljYXRpb24gZm9yICJ0aGUgb3V0c2lkZSIuIEl0IGhhbmRs
ZXMgc29tZSBNU1JzIGFjY2Vzc2VzDQp0aGF0IGRlcGVuZCBvbiB0aGUgQ1BVSUQgY29uZmlnIHdo
aWNoIGl0IGRvZXNuJ3QgaGF2ZSBmaW5hbCB2aXNpYmlsaXR5IGludG8uDQoNCkkgd291bGQgbGlr
ZSB0byBzZWUgbGVzcyBvZiB0aGF0IGluIHRoZSBmdXR1cmUuIEJ1dCBtYXJraW5nIG9mZiBhIGNl
cnRhaW4gcmFuZ2UNCm9mIGxlYWZzIHRvIGJlIGhhbmRsZWQgYnkgdGhlIHBhcmF2aXNvci9TVlNN
IGFuZCB0aGF0IEtWTS9vdXRzaWRlIGp1c3QgaWdub3Jlcw0Kc2VlbXMgYmV0dGVyIHRoYW4gY3Vy
cmVudCBzaXR1YXRpb24gd2UgYWxyZWFkeSBoYXZlIGF0IGxlYXN0LiBOb3QgdG8gZGlzbWlzcyB0
aGUNCm90aGVyIHBvaW50cy4NCg==
