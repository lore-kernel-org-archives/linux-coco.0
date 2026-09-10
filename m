Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C535AC01
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071339; cv=fail; b=LKlW8BzwlAod9BYJI0ZGhirlJ98o9aTgiTLm3ZOH4hYJa8M9OhXvqaXFgS90QS5n37rxREmQ4yxFTJMKMYylxI7+F8V48rnEVVT2VX4t6iow7R2ZIwjb4OquF8ORiZ7cnB667cR5XVcDzEt6mD2DwS2cESRD28/xHouOWKHjSvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071339; c=relaxed/simple;
	bh=Y85L99igmBNXROoTY1cg5biLLR0Z3/l3dl75c+7B5kA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JQeeosqWx2q/fJ+uX5P7Mi93ORxDSG/yf0b3JkH1i3HuEOoAKtGLB7XbM4DefohYmgD+kInMubqf73Lozq8S//VtMccQwadx4ae8V/IVd4VTRzl2lfUhDjK4iSj0RXsCyLTOZ+XZjx2A4I9MIfyXCQ7y8/XYhx1mYqE3SaKeWSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqdguRlL; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqdguRlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789071336; x=1820607336;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y85L99igmBNXROoTY1cg5biLLR0Z3/l3dl75c+7B5kA=;
  b=RqdguRlLj8g9L7icWI4ia8VP5WAAASsYL4R2TYncziJrBU1/hTUB1wXe
   /m3nkrtw/CZr3gUeLzkZofttb1U7L+G77kzDN8sgY4EFGcDlloUoQzLgL
   euZ9d38EuNn6iOQRharoZC39FCRD2db8+PdRMCNNu2a6J/AGqMcv7Fmc8
   Pe463mGwRC3v6RiQL3zerEmH6tOCZjJ+FK3bq+zxNsGsf+Gk21rIqtzFZ
   5GCfbEyPeS1jjTWr6MBo8ds4da0HorWfE+gXq//6xTNnPU9bAUujl+BhG
   xKMe4cuH4rKVhDPixdWzvMDN/3AfE9YkBikz51vDFGHwweFEvqGluw+Z4
   Q==;
X-CSE-ConnectionGUID: z8IqRPYlTj2vNl+HQWF9RA==
X-CSE-MsgGUID: ykQ5RnTcSEWS+CxtWnFCRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89298717"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89298717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:15:34 -0700
X-CSE-ConnectionGUID: o+VNSyDcQN6N3ETbUBoV2g==
X-CSE-MsgGUID: 5D/Rm9L9R/uQFLYv6humuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="275259524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:15:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:15:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 13:15:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:15:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6ev/05ZQgVV9GZ5eWzUjFhzIIJgWn/4XdrcUHk9TvNjzNa5jefEna6lzmVr7qV+L8huhqKRh/AD0PF9XtHTtz4ypbrm0fsW+g/mFHHzz1X2RuO0/8Zug8zrvZcXe7NG8/5hueE2Pl2jqDZpug9+UuuLk26hTqOYSTNqmII5Cyhrk9OK0kqpER1c+/x4Vi5Tm9CzMttgBjsrk1sG9AkZNfh5bcLlkt2y7RLY2W5+G5+keQ79kNRma6UV6ZLvTm4kCzyBKUdqtFL21e5ULC5x9NtGImE0SfSybomVEQSvgI7100X0lVqdkqIaP6kgjfNRZR5Y8xc0jQvtRsEzbv3xBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y85L99igmBNXROoTY1cg5biLLR0Z3/l3dl75c+7B5kA=;
 b=e9GIlWai0REEwCI6qex4xR3zTer8vrbva4XzL+E4+ua6SYDd4/0Etk9ViVInZybxZYFRJBNpy1AKsVTM5+hvftXqvo3SinjHjWdvSMtvbEfkDv6mqyCdS1bRoqbK6VeuPAI/mtu5QmzReB72oSfj/JkExOLYAtals+y/aIjcnhpAxCeExC1yglfRrEE15W3ImTZ51qI3RqDQ8D4dxvSc8njh2plo6tOyiKMb8skdBsM9YrXsVAUY3Wjf7BG0gwhIMNWC1dsPHQLFRfH1IzLYGvQtN7Jxwq/ohRocS6wkJ16yTvdo8AJcMAk3cOeDeFCZOZDpUYBtPc9Adnsc1QrClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:15:29 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:15:29 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Xu, Yilun" <yilun.xu@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "kas@kernel.org" <kas@kernel.org>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version encoding
 support
Thread-Topic: [PATCH v5] x86/virt/tdx: Formalize SEAMCALL leaf version
 encoding support
Thread-Index: AQHdOgBTJE7IZnZNV02DM/PRVurnnrbITdIAgAAAawA=
Date: Thu, 10 Sep 2026 20:15:29 +0000
Message-ID: <36b6bee1883878690393f364f5858fae428c7b57.camel@intel.com>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
	 <9e59449810c33a41ff37a2babc322261c1d918e0.camel@intel.com>
In-Reply-To: <9e59449810c33a41ff37a2babc322261c1d918e0.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA1PR11MB6217:EE_
x-ms-office365-filtering-correlation-id: 4425ac37-5364-464b-4ad8-08df0f78423e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: cHh4T5j4iAiqELhzfxOLgIYtMftgiq2s9wLxkn3uQmkjjbqrIOFhwW4I3MC505OBtXL0whlyUeX2wkiY2xxqc7YVLIWk9yO9fcJQOxwEe84RbhpSoomZuxNdczTOAKAo47yUwKbh4fqZ2wGFYBmVZI69PxRoHuf+OEB7VAMjCD9nIljBUd20GlwAkZJe176pUsd3r6uiuVRKYKBr8g7kN80F99LLlqv0GusjFpCHErHG3DO7pTGAeaAlQXM1hpsP+evdEGyIhYwK89NTTbbJOXs6hjBgAG+NEV+sZ0KV4oB+7Q5l8Ny/8cAO6fAEVfgm4XlOZSUKWIbdzvkQynPMbrKnadNZEe9dzITmYQxksvNb/Q2MWBkrFgKYtbvOCoWCsAIwYJZulh0Y6PG3ktpha4Tq/4SNY6hA7UdKJp8nvuJtFPVg+iOGa6g1vZ6taMHEvVcXB7hulSYLRtbzfQRIhL2FHSgxkBKnwgg4L8wslyam6q0hPkeSasZuUOKpAI+wf0HEWXPc1cgyyrCM+yFsdDvhOnTHfUFIF4w0y39ZDtme3IZtu47HQd4R8MQn1WAHPKz6gAHoZAHKpvjs6LjTg/eeoozKcwbvT0/bnXM4OawuW9uza73INRwRq9dhhx1WWm7/+aU2mMW8oNikq9aU4AS54Bv4w6Pg49C0TB70+U3zQopLSUY2Rs02tW3AXsfEFUJ1UPhkI5m6Hbv4F2q5cjORMtw24qdqZHfCH9F4KX8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFdkcFBuME44dklRS1ZmZzdMclhmcFhPSFl5QmVESWR6Slk4TFl5dHJ2RXZl?=
 =?utf-8?B?TGlsczhXSjVEVjdYVXZMREhnbm1NdlRKaktESXJOd2NRSml4STY2eDgrcDh1?=
 =?utf-8?B?MkFScUFSWVVRTHZMRW01bGRJTTB3eVJjMUtjYkhEZUhqcERhNXR4UXdHakNh?=
 =?utf-8?B?aDhWK1FVSW5CcHRoT3N2S1hZL2pwRkV3NFpPQnBRUng5ZjE4b1NGazdsZFE2?=
 =?utf-8?B?elh3LzB0ZHZvM1NhK0tuWHhGMjhsZnRpVnJLaG9YMWo5QzR3R2NqRkZYQlMy?=
 =?utf-8?B?YzlwQVE2S1VVNUtsanJVOG9MRGNUbnVxTHAvb0lqUEhWRHg0Z2FZZ0dWNldE?=
 =?utf-8?B?WG8wRWhuZW02TkcybWp3UzAvNHV1SElnN2tDeVFjdUV2bzQrS25vUnZiRlF2?=
 =?utf-8?B?VU9WeHNVZStUU1BFYkdwbXZOaHNqRkFGKzNuU2lTTEsvTUc1V250SXVzaWQz?=
 =?utf-8?B?NFRMWHRGWGZsQlBjY3Y0a1VJd1BSNE5iS1FQRVlxUGJucXIxeGJ3L2ZHUmNp?=
 =?utf-8?B?VC96cHdheFZvSEJKcE8rZGpIWm9BRi9tZ202UTFqdGVyZXlNa3pzWXNxZGk2?=
 =?utf-8?B?WWJjVU1MZTczWXpMQ2hQdlVZN0tQbjRTWjJKdnplRmZ2NEhaWllZVU43OWY1?=
 =?utf-8?B?L21wTEtTQmJ0RWkrbU9NYUNLM0Y1WGhVZGNBRFNna0ovdkJYeERvVTZyRC9i?=
 =?utf-8?B?NjVJMmxINCthUHFEMzRpczZ3Z2pTdG5oVGdEMXpxUWZFUzdqSStWN1VyS1BE?=
 =?utf-8?B?T2pySDJvYXpXVlY5RVVWc05FYXdhRlFVTXlYRHdYblpmdGFKSkdBVnl3N1JT?=
 =?utf-8?B?akx3bjI2OSs3NjhWZEdyQjlFaVR6UGNhQm95RGwzbmN0cWtqTnNQbXR2ZWox?=
 =?utf-8?B?dnhVdkh6akxONDlQMnpvaUMzRUJZQngxMnl0NUlETVpoM2dtTHJ5ZWNvOXNG?=
 =?utf-8?B?eEFTanlUbnNZRm1ROG1VN0dWODlMRTY4ODZ5b0FBNzdWMnNYUlJpbGlwZVVw?=
 =?utf-8?B?U0VlTzlFYVQ4Q1lEbG5ISGlBWnNMZXJhK25XaW5jelBqNU1lYkNMVXUrNUFz?=
 =?utf-8?B?c29CMS9sQVYrSHFleTdTbFNEN1FuWC9YN2tnZjk4emxRcSs2Ym4wc1RnRDdM?=
 =?utf-8?B?WjUrcEJDTVlFMkkwalRydjkyOHNjcmxlQXo4Vi9xWFFpY21uRjZ6K3lCWHk2?=
 =?utf-8?B?Ym13NTVqUHlNTzRnTzJVM3h1UXhQZkdKQXJ2N3dCSFZoSUhvRncvMnNmblY5?=
 =?utf-8?B?RWR3Nml3ZVltZDVVY1d3b24rb0FOakw3cnNyUzRjTHZ5TVUwQy9UVXB0bjBL?=
 =?utf-8?B?UVFPajVIa3crSG5xNDdwbURZRVhhYXlRM1dSdmVPYVpnZkxJOGtWMm95Vk9V?=
 =?utf-8?B?UTV3bFlrVFMzRXc2OUZWaVNJamoyQXB0UVA4ZDVWK3NmYk1ENXdOUnNwTW1s?=
 =?utf-8?B?YmZ0ZmdFeTl4RFlZM2xTeUh5a1NQaFFlTGxBZFVrS0NIVHRMa0xWK0dCVmVw?=
 =?utf-8?B?S21xT0x1M0xQRE5iR3ViRzFhUjFuMUpRL0VFU3hOWmM1WW1jamk3NExkaXRL?=
 =?utf-8?B?Wi92SVM2UEtRQVR0SkZsMG5tMDZ1MDNHNko5MTRtZ2hLbzJBdld0WCtTUU5F?=
 =?utf-8?B?M2lnT0tXR2xWM2JsL20wUWpkL0RKVGJ5ZjdKcWpWa0I0bTE3c3RUSGVxV1hW?=
 =?utf-8?B?ck9nbGpEQVp6elNzSlBaOHlYd291dGhmdWI1N1dLTFhuL3BwMXpVa0tCZWZ0?=
 =?utf-8?B?YWY4MnQzVHRQRG4vS1ppV2NSRHRHQ3hMZXVwK2Jua05EbXdXYnlFL1BhaE5L?=
 =?utf-8?B?bFZUOUlJWUdaM09md05RZHZLUVNBRlRNdGRSUUMzU0NSNTFaOVp3bFZESkJx?=
 =?utf-8?B?bUFyTWk0aEZLV2tWQnN0aSt5Slo4NmRpMVhoUFk0U2dlbEJzdXZpd25oQ2Vi?=
 =?utf-8?B?WWk2UndSQklEeHpLbE92SDI4VFdMMWp6aWZCVzVRVW5KNjFablQwZlVIcVlj?=
 =?utf-8?B?aDZJdVJ2c0lMaEVYYURYSmJtRzYxcGl1Zm5JUFVpbHc0bkJ6OWRwM3FvOEZU?=
 =?utf-8?B?amg0NkxPS3ZpK2QxcVE3WmdBTThWc0xpb3VBL0JuV2lKQ2I5dHZRVE8xNzRV?=
 =?utf-8?B?dFF5cmNYMEhKQVEvcWhRNG5hZG9wak9hTVVzS1lMSndOS3BubFlGNkYvY2tz?=
 =?utf-8?B?QVd2dnZ0WTNJK3ptRTJHTmJkQ2NTVmFYWDJSd3UwSktOanNQdzZ3NElDUWtM?=
 =?utf-8?B?OVFWRGhJZUtnbFBSb3AzN2sxMGhSQVNtMlpVWFo4U3d3SUo1UG1BdlQ0SGdG?=
 =?utf-8?B?VUIwMmd5T2RqckZ1am82NkFvWlJXQUpZMlpkVk50U1I0RXJmSWFKOFJ6Vm05?=
 =?utf-8?Q?XW53+Rxas7zT1Qm4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4237FC7C517CF428CCC0054072301DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: G8dq1QWfjjNUFbWg/3Y6vx8jYKhyBfjkh+QXr22Ms4jh4D78Ien9MwSzjB9AwUaJHECK3Ol8GDIrqNOo/zROf1rd5cWOmBNhiV9+ANQYGDLMb1ygLqEd7DVpgQxNHUePMHr9W0x246ljAfdltUMsdhUfJdK+lEVUo8v4PSGb5WhaMR9uIKnH5GRJRKi2SplwdCginB7W7bNitj/AP+/1YHXanIRVc6ShUywt/V6OprTNSMGQpV9BqgkCyUGbx2XT05XtCzpFLABmHvxomPehZK7GiVMKmce2P1Js08Iqb/kawRHtEaNK440bYjIxsu8e59vnlOwd+yi2oyBWBCZchQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4425ac37-5364-464b-4ad8-08df0f78423e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 20:15:29.1098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IMcnrau/xTGnLjAYkHS+OvCryB/DyucHY5dumZ0R7MtZ6lYNNWII0QAPjuRDR92+vvO+885/k3Al+QBw7/ob7Oxx2Zws5OuoCAhUSCz8Da8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTA5LTEwIGF0IDEzOjEzIC0wNzAwLCBSaWNrIEVkZ2Vjb21iZSB3cm90ZToN
Cj4gT25seSBuaXQgaXMgdGhhdCB0aGlzIHdvdWxkIHByb2JhYmx5IHJlYWQgYSBsaXR0bGUgYml0
IHNtb290aGVyIGFzIHR3bw0KPiBzZW50ZW5jZXMuIEV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBnb29k
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGlu
dGVsLmNvbT4NCg0KT29wcyBJIHJlcGxpZWQgdG8gdGhlIHdyb25nIG9uZSBhZnRlciByZXZpZXdp
bmcgdjYgb24gbG9yZS4gUGxlYXNlIGlnbm9yZQ0K
