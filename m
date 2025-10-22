Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4F320A0C
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 10:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761128071; cv=fail; b=YLrrtWTFAxudOHZMlT4IS8BZdAeeNWLaaVp8Ebe5qs63OGC0xN3Gs5qkuLoex0PmSjvT4MLHVrUk6+DTSomWgNzpTB5KZPbO0eWXySM/TyOH96Erno9yPoKe9clMBhTJhVNQSUmdAW34++YKI0ORSIB6nVukbdWo8IIuCPbjoxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761128071; c=relaxed/simple;
	bh=whVea1y6u6hg82yLkrUA1y7xz/wcY9yBPwPAzBkSlbI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RsVwyN6ukvrgmOzks9Ya7wd9lY00ZbIFvs6zvVzrHZ3IpQww6S4G3vPwIntKI21BL1eU7gqgZ7tqwBJrPSyBhMiUS/jcchS6UsFzQV56kzCAN76Wd/u6jNllkH8pm5IoDIVk/4eXc8xJiQQPhlXm6S4Nq55LzeYZfYnORFED5cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIGKrtKg; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIGKrtKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761128070; x=1792664070;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=whVea1y6u6hg82yLkrUA1y7xz/wcY9yBPwPAzBkSlbI=;
  b=RIGKrtKgvKmZ8zgvuDjW8LYdbQFdYAouXP9lBaDE94NmGn5EsFBJmFEy
   Sjiq7y4s6H4EwBlcCpmXvSr4ruqlZKYRkg2+z3RO/Xery6Y33aqWAKQrr
   fVOUBrCPAaiA/iQGiGJCcE8t+zpF+dQpDVljCwsPRK57dvxVfxbkYdcP1
   55FGdRwnJTKNjPeEbxRVtb3pZNPdHvk0mGC7hMvBOLPFpygCGnxB8RIgs
   bxdU5B06+Plq8xdVyCRbmIZBSmdlh4jpBoIcWp2C/evvFzuji9NqJ+vRp
   kxZUfA5rczKVhQ93iUxTEq8XYfy5Ucx5kp37HuR83bA4bRgIbA1ARoq99
   g==;
X-CSE-ConnectionGUID: LkuVQUq0T9qkGF6tO3NlPw==
X-CSE-MsgGUID: 6ijWvXwXS4Wpkeajmv7PhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63419013"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63419013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:14:29 -0700
X-CSE-ConnectionGUID: cY39JXMNSjOcNY02CsemxA==
X-CSE-MsgGUID: emyPYnt+QeGq0NSmupnlrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184613112"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:14:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 03:14:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 03:14:06 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 03:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCCQXSrjbDzL6iWDGlpBwMLON0kxCpWPTeswNvvioHWf80qsxUhhLy9Va7K6bJzeFvR6k2Tpl6jfKgte4rGJ432+3eteeKap4au30BpXphM1ALN7uCdcnmopqeRlZclkd1A2Zg6nBG4iKoj4fFz1tTPNj8z2BOmwkErUISs3PL6XGbBK8GqW1BuzRIgLu03Wc/ca4CF0rIPkqNnlCpAWdjCzJVXqWQZTH5WZDO9GPoM1Fwz82lfpkSSGP1KPZJn6TANQODKOvvGt8pWfqIYMUH6qaWxNrV8VsytiMKOrXuCE1e97JiE2Oiq0bF1TXqRb/V6BHcdTbihHHBY20UDdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whVea1y6u6hg82yLkrUA1y7xz/wcY9yBPwPAzBkSlbI=;
 b=vBaNzduelcLbnVwjKtIgUN4hJgq0OfCjH1LFUYCeOA1dNYZx2KI9FUaOLi2uS68RrJUpn1/QZnRWJ9ff5VPl8J6d7FulpHdYaOTblsBO5FNhfatSWXIl6rEO9nzPHLNPh1lYmMa/LRDsksqVvQsMaTJa25s3/KWCDI4ZzpLts0R/ZZ1+Y9IhGdaH6gZELvTAeFPmsgwUlW/m2iCsNNUS9oxxZAIS2svLHE5Oipq2OMvDa8YXx3SYtzC5+vWpQNmNiat5dWfWFmvFgbND17e3kdLcGAGsZL3kplkgYLiUlh0Ce1hE6ZAGhW1IqkbUWLxi8hgQMsMB5KJWuseDjlEJAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB6707.namprd11.prod.outlook.com (2603:10b6:510:1c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 10:14:00 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:14:00 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "nik.borisov@suse.com" <nik.borisov@suse.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Thread-Topic: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Thread-Index: AQHcQzdy4oRnfNFPCkKevsuzrs+pKLTN8rkA
Date: Wed, 22 Oct 2025 10:14:00 +0000
Message-ID: <7821da3d359f6df510bba3bc4323ede303dfde3d.camel@intel.com>
References: <20251022093644.320207-1-nik.borisov@suse.com>
In-Reply-To: <20251022093644.320207-1-nik.borisov@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB6707:EE_
x-ms-office365-filtering-correlation-id: d82f4009-b4d1-4de0-2075-08de1153b866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cWNBbThMK3dKSExiWHh1VU5uZmxlNGlFWXBtYTFFY01aYkI4TTcwRDlZeUVW?=
 =?utf-8?B?ZGZRS3R1Zm5tZ2dFcm9QRHVYY0RWdlFhc3BkeStPbnluNWdEK2k5TEZqd1Uy?=
 =?utf-8?B?TVkzQldRd3VoYXpaYVBUbzkyVzZQenlOVm1yOVUxOXA1SVhLbzdpcldWSGRO?=
 =?utf-8?B?bFIwQmdtUUpHVVVPWVNNRjh3eTZiRWU1cy9ZcjlCMTdHbzRkNGRHajd4RitR?=
 =?utf-8?B?OUgxQzA5RWpJbFJyVk9jNGd1cE9LNTlYNkR3TGtZNDgwQlliNTgwQ3EvNUZ0?=
 =?utf-8?B?eTlaU3h4cGpWTmFjSmlWdXphODVFL0haaTlDQ0xWK0J1cXFlb3o2NDF2T1Fz?=
 =?utf-8?B?U3ZFeXhoZDVycVhkY0FPUWt6bjZSUlJWZmt3MGZ2R0xtcG4yYWpFcnNNaWp4?=
 =?utf-8?B?UmwxNUh6TWk3eDZybFpKNHkwSlBPWVcwUzhRVlpoU3JOV2pVZUVOYk5Zeisx?=
 =?utf-8?B?dmRsRjlVTE5pcEU4VTBJNG96WThmTVRDUE92Rzc4WmVnRWhkVkVGenBrTkpQ?=
 =?utf-8?B?K3RuMDU4cklZMlp2bXFDN1pTWVhrK3FsMUVKdndlUjdBNjM0U1JKeXdaRzdT?=
 =?utf-8?B?dy9oS1c2VDNNMG1WM3FtdWQybDdiK01UV1c0S3EraDFHMGRsV1g3ZUpsSkZx?=
 =?utf-8?B?RUZmQUpvb01Hcys0b0g5bXdPY1RBMEV0WGtRTjgzeU91WURZZEhRS2d3Qlpy?=
 =?utf-8?B?VnlDZ2NLTWVJcUpxUXluQVRMcERPUERIM0lZdG92Q2xNM0pyVGNxZ2dYUjJs?=
 =?utf-8?B?eldWZnhLR2o4MWRtU0E0bG8xVTZzM2c5OUkxc25MUktzc2VLc1pkRHRxZWNM?=
 =?utf-8?B?YU9XRlE4Q0YzN3BFY1lnd2tjV2NHVzB3MWw2UzFSZHBQM3M4RStoSGl5N1c1?=
 =?utf-8?B?NEhNeTExaUpUdG1keWY2c0ZkSHdSNmJ3TGNBRmZIenVCMEwrdVIzMXE3U2pz?=
 =?utf-8?B?R0huT1V5MTRBRWxwOXAyZ0pVQ1ZmVVBZWHVoaTZ6NXcwT1dIRXgwTFFzNENT?=
 =?utf-8?B?elo1b1E2T3paaGgzTjZrTWh3WC8xMlJRL1Q4QTRvSXV6cUVpYkNqMVh5U052?=
 =?utf-8?B?MkN3RDFUYWNYVTRrMkFSbWpkaEZrVnR4K2NPOGdLWVdIN2RUNW5RTG9pcDRK?=
 =?utf-8?B?Tkk2UThxUVVseVJmbTk3TnRhT3MvMEhrc0ZSSEpMTUdSSVNiSlNHdVNOUXox?=
 =?utf-8?B?Nkx1UlJZR0tEMUtjY01UeG5La3orRjJqQVBzUlVvTCtGNEhwMjJnWE56VTlS?=
 =?utf-8?B?R0l2SVQraXlYRnQvQWNZTXA2MFVpOW80WkFJTmNVYWFhTmIxQ1gydTVFSEo4?=
 =?utf-8?B?MUkxQnkvRERWRnlzRUVnbnJsOUdiaklUUHJuaXRiN09kRkFIV3lrNlZaSXhR?=
 =?utf-8?B?VThSOGRvaElDS0hSaDBXanFPcmxiOUFlU3lDd3VucFd5RFEra2o1d0VScHM1?=
 =?utf-8?B?R3BUaC81dUR4NmNEOTZTYVMzaU1TRU5PcVl4Q1FHazZJZlhwYkZzWTFMaVE1?=
 =?utf-8?B?ZHB0SzBKN1Uvd00rOXFLdEcxYkhNRWFLQktVQVptbmQrRVBZUE8zMXRJWUl4?=
 =?utf-8?B?eDBuZFlEbnY0R2pHbmxHeWYzVkE0dGxyNTdYaXVDTUFlZk4yYStvb3VUeVhP?=
 =?utf-8?B?S2pZTEFvaTMveDlCZ0lLUXc5dmRZdnM1QlFJcjVoVTAvaTM3eitIbGt2ZThw?=
 =?utf-8?B?L2k1L2szeHN0QitLaXR1WGpjem5hbGVMODBTM1BDMzRsd3NYa2sybzlnTi9F?=
 =?utf-8?B?dC9IbTVNQkFhdFVZdEcrcnZReWFZUzNWbUtNOThSMmduSHppYVRSMzJWV1Qr?=
 =?utf-8?B?K2N3RjJ1bU1sM3l1K0IzMU9UR3Q4SWsrR1MxZW5qZHpZSDk3MkJYZnIzbVlX?=
 =?utf-8?B?QjR3ZW5MUWZZMUM2Y09MMTNFOVRLUjl3aHo4T3NJVjNSK1A5M3RVSlVqcldX?=
 =?utf-8?B?cXhSUzdnbGJiM0JmS1Foays4S1BBMWt3ZFBQekdhY3Bnd3NzMUd2SFVEODRt?=
 =?utf-8?B?dFJPclJ0MmJPb3JTVG1TY1RISWkwcHJnWVE0Wkdka0JHd2pHZ1FvN2g1M2Vt?=
 =?utf-8?B?RXc3cTRpYmNpQ2JteTIrYjRERmF6YTByc3BuQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjdaTE05elk5bFhXT1ZWdWttOHB6d2RXOENXcUI4SmwzUUpqWHVqaTVIcEhL?=
 =?utf-8?B?NE5sSHUrY0NnQ0lLTjcraE1EUDhmTjhFNzg1YU1yc3ZwZ1I3YTNLemptME1h?=
 =?utf-8?B?aG8xa2oxOThZdGxNeVYyTTFYczliaGFYUG1HZ2FWMGppaytHK1BnbTEvYWtP?=
 =?utf-8?B?MStWcFRQTDFJbmlxTFR4K0R5T09uTElXSGhCYnF2M2creGpIb1JBRjBmOG42?=
 =?utf-8?B?aEJvYnd1aHNweFNiK3N4Y3p5ZjNmU3k4enFmSkhCbEZOQmZLSGczeDcveG1P?=
 =?utf-8?B?d1BPY0w4SndOcGV4VUFyVzVYbGxmckFnVHNxTkErNUFVdGIzWEdWd2JxZnll?=
 =?utf-8?B?ZjIrakNaVjZ3bHlMZDhtUUdabTh6VmVSOER4bjRTQnI1YktkdnVNRmxvcTdT?=
 =?utf-8?B?czJsSmx2K0tidExkemFpTXFjYlloVzBFQ0xVRHBGTHlsWnB3TTVKSzJra28w?=
 =?utf-8?B?bGRoZWRGdkIxWGpxd2tZTFlCdEVnQ29ZVlB4eWR3K2xEMzZHcHFsaFFHVitK?=
 =?utf-8?B?aFlpcWN0Z0hsTndMdUU4eGZtSjlmNVBUSFhsYyt6UG1nVis5OC9PcDVXZWJJ?=
 =?utf-8?B?aGRiZnJRQllYM0NZT2pUSDQyTU03QnZmNFFOeDZuaXF3KytBak95SWVoNGtZ?=
 =?utf-8?B?MHhkVUxMMWw2MWlJUVBBa1NvUmRaSGpMaVEyNlVTc2hGMFVqTC9aN3o0TEl6?=
 =?utf-8?B?WnBSenN5NUNnbjB4eG92VnhqTnFNeDJERlNUZ3B5ZFVld2R3NlJ3akY3cVA0?=
 =?utf-8?B?cUxtN0NBelNBODdHS0hqNHFUeXA5QjdOYXorT1RLeEpMdlIydzNuWERlY2NO?=
 =?utf-8?B?L0Vzb3RMVC9LbHdVL1Qrd3NHUSs5WlFmVVBMcUdHMDkxMGM4aEJGUEpQOG82?=
 =?utf-8?B?R1NZaEZES3lXRW0vMVV3TzZBZGtoKzdEUHJHZjBLdjVrdzRyN0M0U0x5dUM5?=
 =?utf-8?B?MkZJNDJQL0xNYnhYTXIwSTdsSkQ5eHZxUURTdnBQSjJldHpjVHRJZm9GRkhL?=
 =?utf-8?B?WFpWRkRZZWhlT05UNzV5b2oyaVhiRGQ4VW9UcS82dG52OW5KVUlpMzNWNjFy?=
 =?utf-8?B?VjVkZFU4NzIvVTlBcVpINzc0YjZPSldBVVdBYnlLUjhZb3ZIYXRpRWx2QVUw?=
 =?utf-8?B?dzJ5Y1dWU0NRa0FDU3JyaEZjalRvWUR5amJzZ0c0ckZYSUkxMjBLRG9aVlZz?=
 =?utf-8?B?NmFJQmpERkFKOEtMTlJOVFBIajlHblUzWTVXNjRHbHYwbmNwRWp5ZXVxQTFm?=
 =?utf-8?B?dEIrOVpGaWF6d1BKSTdjVTVZb1BHek1CQzR3V1o3UHNRTEtmZ2ZPR1JvQ2Ri?=
 =?utf-8?B?YjBTWXV6YlFxczFqTjl3U1QwWUM1aDBDTTNwdXMxZHdEdVpLWng1ckw0c1Ew?=
 =?utf-8?B?TE04YklPek56WDdHd242eE16MTRFWWlzbnp1RlBDTUxwbXluNUE3RlF6SnlE?=
 =?utf-8?B?ZEJKNkNNcTYrNmI3Y2c5V0pjVVZ1amNjSUtCRmc0S2FxNTNxeTRZd1hsTzlp?=
 =?utf-8?B?KythVE5kbDRTNWdLOGszdFdQbERMc0dDVkxLNTJJN3VZKzRscnFBN0tUL3NB?=
 =?utf-8?B?bnEvQVFLUzZOMXZLU3JzOGNYV3dTeHVaMFlKeEZraC9ORXpBdWw1WkpFdnNF?=
 =?utf-8?B?aXg2ZjBIY1lMTWg2ZkhjNFkvMkFyZlZtZmo4eW9NcjU3OVl3aEg0RTNQQ1VS?=
 =?utf-8?B?SGV0TU93cUxEWmgyUFZHcVJheFMzV0laRDl0R0RIdVcyZ3grZVJ5aFQ4R1hu?=
 =?utf-8?B?RzdRc0d6b1A4cDZMOXJWRzRtVnhwMUZPNkZXR0dqTXJlaDhCbVNrZm5lckFN?=
 =?utf-8?B?dGMxdmxSbTBQZVcwUkhmZTNBZU03c2RkZmNQd1ZyRWxSVytmOEdxWlRXbkJj?=
 =?utf-8?B?N1VEa0xXamUybStOOXZBUnJmTWlHcXJiQzU1Q1h6RFVQb1p3Y2RVRDl2RHVw?=
 =?utf-8?B?V3lmdDRpK3Y1ZlNMQmMzbG81NDcrbUp5VUJiSU43RnFnTjJONlZsd2c5dXF3?=
 =?utf-8?B?aFVwYTc5ZDlIWEs2UmxQTjdndzlUMi9SdFR0b2tVU0Z5L0xlSllEWWlhVUY4?=
 =?utf-8?B?bWhqbkdadmRpSjBkYllnUEZFU080UFk1eWVQa1FOVkVCdml6cXBDbUovcGpr?=
 =?utf-8?Q?ueoNzEEMcqN1uGIg/eRSDB+kR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C00DE82F2F98C449262C75FE7774240@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82f4009-b4d1-4de0-2075-08de1153b866
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 10:14:00.6790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzGG5Z34aLJEwNZT65FUE91tJwi/g7NdZbnVZnPsBvYpJ1P4cUw+s9c5QDIlnxPADeTf268KVhDeYDiOgAilCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6707
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI1LTEwLTIyIGF0IDEyOjM2ICswMzAwLCBOaWtvbGF5IEJvcmlzb3Ygd3JvdGU6
DQo+IF9zZWFtY2FsbC9fcmV0L19zYXZlZF9yZXQgY2FuIGJlIHRoZSB0YXJnZXQgb2YgaW5kaXJl
Y3QgY2FsbHMgdmlhDQo+IHNjX3JldHJ5X3ByZXJyL19fc2VhbWNhbGxfZGlydHlfY2FjaGUgc28g
b24gbWFjaGluZXMgd2l0aCBDRVQgZW5hYmxlZA0KPiBzdWNoIGNhbGwgY2hhaW5zIHJlc3VsdCBp
biBhICBzcGxhdCBhbmQgYSBCVUcoKToNCj4gDQoNClsuLi5dDQoNCj4gDQo+IEZpeCBpdCBieSBh
ZGRpbmcgYW4gRU5CRFIgaW4gVERYX01PRFVMRV9DQUxMIG1hY3JvIHRvIGNvdmVyIGFsbA0KPiBj
YXNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pa29sYXkgQm9yaXNvdiA8bmlrLmJvcmlzb3ZA
c3VzZS5jb20+DQo+IC0tLQ0KPiANCj4gVGhlIGtlcm5lbCB0aGlzIHdhcyBvYnNlcnZlZCBpcyBh
IFNMRSwgaG93ZXZlciBpdCBjb250YWlucyB0aGUgY3VycmVudCB1cHN0cmVhbQ0KPiBURFggcGF0
Y2hlcy4gQW5kIGxvb2tpbmcgYXQgdGhlIHVzcHRyZWFtIGNvZGUgdGhlIHByb2JsZW0gcGVyc2lz
dHMgdGhlcmUgYXMgd2VsbC4NCg0KRG9lcyB5b3VyIGtlcm5lbCBjb250YWluIGNvbW1pdCAwYjNi
YzAxOGU4NmFmICgieDg2L3ZpcnQvdGR4OiBBdm9pZA0KaW5kaXJlY3QgY2FsbHMgdG8gVERYIGFz
c2VtYmx5IGZ1bmN0aW9ucyIpPw0KDQpTb21lIGhpc3RvcnkgYWJvdXQgdGhpcyBjb21taXQ6DQoN
CkkgZmlyc3RseSBmb3VuZCBfX3NlYW1jYWxsKigpIGNvdWxkIGJlIGluZGlyZWN0IGNhbGxzIGlu
IHNvbWUgcmFuZGNvbmZpZw0Kd2hlbiBidWlsZGluZyB0aGUga2VybmVsLCBhbmQgdHJpZWQgdG8g
cmVzb2x2ZSBpdCBieSAoZWZmZWN0aXZlbHkpIGFkZGluZw0KRU5EQlI6DQoNCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyNTA2MDQwMDM4NDguMTMxNTQtMS1rYWkuaHVhbmdAaW50ZWwu
Y29tLw0KDQpQZXRlciBzdWdnZXN0ZWQgdGhhdCB3ZSBjb3VsZCB1c2UgX19hbHdheXNfaW5saW5l
IHRvIGtlZXAgY29tcGlsZXIgZnJvbQ0KZ2VuZXJhdGluZyBpbmRpcmVjdCBjYWxscyAod2hpY2gg
cmVzdWx0ZWQgaW4gdGhlIGFib3ZlIGNvbW1pdCk6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvMjAyNTA2MDUxNDU5MTQuR1czOTk0NEBub2lzeS5wcm9ncmFtbWluZy5raWNrcy1hc3Mu
bmV0Lw0KDQpJIG5ldmVyIG1ldCBfX3RkY2FsbCooKSBjb3VsZCBiZSBpbmRpcmVjdCBjYWxscywg
dGhvdWdoLg0KDQo+IA0KPiAgYXJjaC94ODYvdmlydC92bXgvdGR4L3RkeGNhbGwuUyB8IDEgKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvdmlydC92bXgvdGR4L3RkeGNhbGwuUyBiL2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHhj
YWxsLlMNCj4gaW5kZXggMDE2YTJhMWVjMWQ2Li5hMjEzN2NkN2E2NjkgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHhjYWxsLlMNCj4gKysrIGIvYXJjaC94ODYvdmlydC92
bXgvdGR4L3RkeGNhbGwuUw0KPiBAQCAtNDMsNiArNDMsNyBAQA0KPiAgICogVERILkVYUE9SVC5N
RU0uDQo+ICAgKi8NCj4gIC5tYWNybyBURFhfTU9EVUxFX0NBTEwgaG9zdDpyZXEgcmV0PTAgc2F2
ZWQ9MA0KPiArCUVOREJSDQo+ICAJRlJBTUVfQkVHSU4NCj4gDQo+ICAJLyogTW92ZSBMZWFmIElE
IHRvIFJBWCAqLw0KPiAtLQ0KPiAyLjUxLjENCg==
