Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B13AB29D
	for <linux-coco@lists.linux.dev>; Thu, 10 Sep 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071264; cv=fail; b=bKEeU/jxFoF7QIj5lC1uxLjI4/7dcuiY7RhqZ9B8soTMupo9977nI4pcDZ8J0izMYb5zaqJSSwnUtNPfLAkXiQmE8PnuCON5Wjqio4tnRSbk7FPuz+VxHw3xYFyE2RAzALT+RiOrEXH8kySdom/TlmgSc+CTGkXkpgcFgN0n/oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071264; c=relaxed/simple;
	bh=q0wWg9nYbVBQhJj5dMLEzwF/Ndlwwd8hAjlVM1FRrcE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IPiJVqd5FgONQrL+xG4RpJIG+EqiEo+rXIbuwn8Y0WDFfDOEG2N6596nJ1frZ3Q7ykmyN83vFeVCfmb+LwQ0nkXdZmDzv8IMaF5zK0snaz/N4n0F6az2Ff/ZFiPKZ0633RNNZt2IPs6mNkD3m8PAEO3ObS7xG3WWd2CvJdziRiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9I1uEd3; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9I1uEd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789071260; x=1820607260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=q0wWg9nYbVBQhJj5dMLEzwF/Ndlwwd8hAjlVM1FRrcE=;
  b=h9I1uEd3Cboa/edJ84PYzAemDbAuwsdB7AOlPLkXuVEsqAuGe0vWU3+v
   igQ5Zs6kpCUZG9hBDPEyUHLpzTdiVJ4irmv/mC4q0HW5JHXgn8GZrj5nQ
   VX3ya7KXPc/tbSmjGgb1smXrtOSuv4ic6+D86besF2O8TSf5hUhJwPuAf
   BVKbND8N8llkmcOExJ/SN8hYMAaVmiXx950o+0Aj7TQNW3X0DhfgKkfsD
   dgvuv7KLcqn8AYdfdB0pCCNFNMJTJZOEESXkiWWBn0C6bYYGSIqafClF7
   mPdM0BgDNTfS1EhxGOfxR3vQzMKjNORcxc6Ofduz4Z3750LzYq5vk8ulr
   w==;
X-CSE-ConnectionGUID: CCp5y22vQ767FVMjeYeGkQ==
X-CSE-MsgGUID: t6xI60xJSNmIb8BL3ky/EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112307218"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="112307218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:14:18 -0700
X-CSE-ConnectionGUID: 642mmdrdQYaScNUJmoypUw==
X-CSE-MsgGUID: rf0aNPPBQxOCvIUgc2GbDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301625307"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:14:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:14:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 13:14:17 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 13:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8YqzVYI1BKt8KX97UFGqJmF97mYIvZNuxWULOxSVbxVzsDF/ukVKI8wi9Mfi+WDWKOAFnNwaU3qKv8a4i3FAFnmK9QEOEll5eWZPOEgjJ7DahHDbdbH3sTAaUc6gsP9v7BrMFVD8RYhPOiMngmjsR4gvdOaCYmv5WWHQ6Lip0p2VtHoa3H+dmH7JFVhFJJEnaE3FZtUa4YIhBV/QB0ntB//jKw2yFYVAE7c9BXam9ml61Ak3je8QtdZCxO8ctd5El2n9V7quGMc0eoeNBQr2r6AjeoIT5SF/uGrN62Tynk4Lr2yafzg20/rBwG9Sw0ybjtlOvtoqnkK4rW/R3IJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0wWg9nYbVBQhJj5dMLEzwF/Ndlwwd8hAjlVM1FRrcE=;
 b=AxLMFtYusC9GMcEJY+JlCtjdvoqqSoW8BIuBtUG4GY0Bhno1kI5qxtS9Gvsf7H3yKSufyEULu134pp9xnhHPEQzkGy54uXMBIeGfa6Lev4Ml3d2VX5CP+zcag/NfmYk8AEsBv8NmOP5LJaxQECFXg39ZW87xqzSqdInGN7GrhJkp+/TKGrtmoNlU3+lVbEtty4Aaz2aOHs6ztotN5unZwyEw9Wy+lHik4GVs7IQcMkxSDkJrE0JQpspW/TxXJoCrSfU9rvb0zbBdgNkDqt5qZarOwttrMC8+v3sT1RFxWrdlDhUaK6DHrwpbXZpQ5qeIfRo15idw2xCCGQ5P740v0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:14:02 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 20:14:00 +0000
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
Thread-Index: AQHdOgBTJE7IZnZNV02DM/PRVurnnrbITdIA
Date: Thu, 10 Sep 2026 20:14:00 +0000
Message-ID: <9e59449810c33a41ff37a2babc322261c1d918e0.camel@intel.com>
References: <20260901105436.461823-1-yilun.xu@linux.intel.com>
In-Reply-To: <20260901105436.461823-1-yilun.xu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|IA1PR11MB6217:EE_
x-ms-office365-filtering-correlation-id: 8ab7ef72-33f7-454f-68cf-08df0f780d3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|3023799007|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: uh8Z8WHhzdIge9mEhnELSasaJX7aVsa3sMdqckQtkOWTsLvYeVVGAWmpRWIEs4nLqGkjqAMkuXhakouom70BDOXTeMcOBTXYjdNYftb5sU3Zwu2LQC44X11wLFtpRNU3xnfhwigmMgrrQIXgykxvq45xDjRTvyr/Cpm6TJoNbb+hLTLH7N0IiuELNriX2fKodgQM4FhYifk9tC3lCrvwAZH36reqF2zLSU9NTuBOzfJ8iUcEKhnG8JJQ66/mRFA0WlD4AyNAdybGuxrj1fYSOiO5aqoCCCct4LQLUsiHJtwfNvXb9k8MNb4FpBAhbXrV+KwQLLWS1ddi7T43N09sECKuZ+3g6C+t7fs8VfoNLBHhyH2rzG+0V8zroJzd3BDBNa7DT8pShZemHDLvlrUivroEsNFK7/2TUgwyDpDEqL1sFioJ7IFDPDz/3vMVZXITQ2K4Wl/fvVdf57M0YgbTk0gDwopIOvg8I4XY2GJLAdbe5e3SJno6KWfTD6U6N6vJEws4tONCq8R0nvhW6ochdPfI5b+WLtwu61Oj7dDCmOf4EddDDnyhu+6+CKlUBE2Su3OJFa1mI9ca+xdWgPf5MYFnzoH4EO6AedgF75h54eKKs1UhwUOxlZy3a1YWieHm+F6FmBdD0a3SCGIDBGt4iSSDrebW2qFMajjmzazzVWT20FXOVMKMznoBKQm2uNtUGygMBCh9igHjEpBJOJ264dCpXyAV/HSUfPoT0l8TFlI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QysxLzRFOHMwUXhEOC9FUi9tMi9DVVpscDhGNUFmZVhWOGJjOFZrVFFWY3d0?=
 =?utf-8?B?UktrL1ZLaFZWVXNWRlNzL0crSGlPRXZWQVhZZk84S3NNRG9sSEFyYzJXN0U1?=
 =?utf-8?B?WTZGdFpmK2UrMTg5YWN4bjdpVnpZQXVSSlZ3aGQyUGJUdHVUWWtCQVhlS2pu?=
 =?utf-8?B?QURHTmd1MWNFRy9Ocjk1UE1FUmtqL3lkWEtnNnFvekZtQllOMjFKYXFJc3Jl?=
 =?utf-8?B?N3haVXpHMkhleWpWLyszNnVSUDN1UDlJcytzTW9DK0JUSkJGTmx6UDgzTkEr?=
 =?utf-8?B?Y1RvVjZGZ3puMXJENWN3MVlQcFJONmFPM2w2bnV5NkhLZDRabFd4ekNvQUMv?=
 =?utf-8?B?VGs5TDd5V3JhWmNqc1VlOHNxQUl2RCtobmlnVlI4bjNFVWxZWFN5OU1wcXAw?=
 =?utf-8?B?U3pLNVdFR1hjNnAyZ0s2M0taOVVKWnJWcktVQk5tOEtHL2RBcjYzQXNDWnhq?=
 =?utf-8?B?NWdXeDA2MlpkeVMwT3JlaGsvZFZKcFZab3VQZzJBQ3BNNkwyZU9RM1M2aUNL?=
 =?utf-8?B?T0VvTXdWbDBORGQrZkZrLzJVQ0ZYZ3FDbzR3d1gyS0Qzc3NRT29BOGU4SHRR?=
 =?utf-8?B?R1Z4MEJXK1JpaW1zTHNPUzIzOUpHRXE4VHRWRUhOVFVwYlFZMzB4ZXpVUzNN?=
 =?utf-8?B?cnJHd2V4eFZsUit5L1NmQ2dMcW92ZWVKU2UyVVdGVWYrb1QwN2Y1Y3VBWmQw?=
 =?utf-8?B?TVRyams2ZWNXd1FHMVFTMTBVN0V2Y3htcmFMU1ROSXQrT2tCYVA0UmtTdzJw?=
 =?utf-8?B?czRFWk5yZTZra3hoQ3hLUXdtb3Q0MEtGV1c2MnFWODJzUHRhNitWYSt0dU5o?=
 =?utf-8?B?YTRjOCtxdEJOejc4dTl4OGoxcU55UFlueWFuck0wWmtzZ1FrdVMzdHZIU3VE?=
 =?utf-8?B?Q0lTQ0thelBHL0hvWTE2SnVleG82VXFBZHBKbGRrWDdXL1Y3aE9zUXFNNHly?=
 =?utf-8?B?RkJEaGJjV01wU3ZzbUZaWUpIeHh2R3oyaC9ER3ZsWWJXdjdHRndDajI4UGkz?=
 =?utf-8?B?Y1ZEcFFySWRaY21sTnVOUEdFdTRFT1pUbzM0UlFuOXVBRjUzT1d4eG5taXhD?=
 =?utf-8?B?OFhLV3JYVnhBaHczVCt6OUludnc3L2NLWWN6dnpBOWZIQ3FFNy8rc0tNbVlO?=
 =?utf-8?B?bWg3SFJVWWxvanNzbTFsSlZYTGNveFBiQ0VjbVlHYXhadVJwa0U3RjBsSVRw?=
 =?utf-8?B?U3hmOVZGUFZobTl6R3ZqOFRoa2tnQ2VyZS90WUg0SjRnT2lCUFZCQmcxQlNv?=
 =?utf-8?B?eXRTN2JiYUZSVHRYc2IyT3ByUkNveEhjSlJJT3ZkNWYySE5FclI2SzZSaXZw?=
 =?utf-8?B?WG1nQzFGTkhneTB6eHRoUGVoOGdMdVFQVXJZL3ZkVVNzdDQ5R3VGa0EvSXJB?=
 =?utf-8?B?dHdIaitHOGcrUENqSFRqZmppWlBGOEEyNzErVmJzM0JIbUpiQkJEU08zR0l2?=
 =?utf-8?B?MFVObXphNTFYdXBPNXRMVkRtSGYxYk5JK1VpS05zSGZmbnlhUXNCeFdYMmxr?=
 =?utf-8?B?SzAwY3RxU0RPaERZMVV0OHh3d2N2cjlwaHpmSGlLUXJVRHdySnB0dG9qRzFy?=
 =?utf-8?B?V085eWJFN2NvWHJ6Uk9xQzl4c2tVelRLUmV3VVRLQmtuZnVycXVwMmpVQWFI?=
 =?utf-8?B?NGZ6bHEyNFlSNUJ3cm5jQWRydGNDaUhlNlBXYUY4cnEwbFRJMUNoVTQ3bHFN?=
 =?utf-8?B?bUQ4cnBlbnhCeEpqTEMrZEdDcURyQ1AxYlQ3ZFFWeTZiUWhGWjI5anV5aEM5?=
 =?utf-8?B?WXJCNjM1THBnK0JvNGUxQSswYnB2QzEyeFB1K3BoS3lFeUtWR1NaaWZtcnI1?=
 =?utf-8?B?TStvSHk0Z2NTWmxGSHJUbWlybWxOZk04NXVWejQrUVR5bGN3UU1reTBjS000?=
 =?utf-8?B?UTErVEpqQTgrS0ZrRGVRUE9LR1k2eTR3U3grcGsrVDlWYmtwaURyQjJuckR6?=
 =?utf-8?B?UEc0bXZmRE9ZMDdQZWxqWkhKWElKSm5iZ0FQRjlXRmJVcHhKL2tyS25Ra0FK?=
 =?utf-8?B?c1JUTVM0b3pvZDQ5RzRDMjUxR2JRaEhzN3BwVXZWNDVpS0dQQlNtSWp0ZThN?=
 =?utf-8?B?SmxuZ3h5TGlHclRwV2xsZGlGQ2t1N0JBU2NkUnRwUlhTbTh5MHdrbTBNMDd1?=
 =?utf-8?B?bzRCOUpUZ2lndEhUWER3NmFONVZ2S014SEkxN0EzOHJabzdRZ051TnBpL3BX?=
 =?utf-8?B?ZVB2MFVJZWx5SG9FSS83Vkc3QVNGLzJRTHZSZGkycHpVa3NNcTRGdGN5Y3NK?=
 =?utf-8?B?ME9MOWREWGxLWDZ6SEhxZUpZNTZZK0k5cFB5UXdRR2s1ZDMzNUR2WjZ0Slho?=
 =?utf-8?B?dzZ3RzFpWGdZaE8xdkc2aXZkUjY3ZUQvbUU1SnhRdVM4VDhKRVhDcURPT3NL?=
 =?utf-8?Q?VyWqwxZpV4OB/P1Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83BFFDC0F417F14ABF8279A23355B9BA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: PK9j9vbdqg15zqHn5xRFSUflbymTVyfR6yJc2DAxuuqTAQ+qXJN8F9CLNqu4wyeNB4JM/sXUJgGrww7dDESLpNSIbxkBgZw/WhtGnGwODQK1sMDYEU4xcRxaCWuX0QOk7kwbI3BzMUgMwV8ViHH9JWBMfVT+dP65GjXI0ioGSNJpKvpc5HbYq8dft8vjcU4dmgbFLW9ZVOs/k15gDKpR4138NCzBhNTFHnK2DUHvY98FtsH88ew7kcjF39ft1REydjdtzugZxfdEG7Gq8ySDygo0jFGX0KQ/o5dr61Ww3NHBkBQOAfD1yFUiuEDg1ORTWE+Y4MSRzpIAUAuI49Cf5A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab7ef72-33f7-454f-68cf-08df0f780d3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 20:14:00.1879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Taz57KOusuUpQo7DCV0QPSyEmufhgYpV1+YN1hX7PUIKykBz/Gmb92ma17vBIN8qPJ2sHsIl8jtMjdmZ1shHVubiyRSUYE6SsnfpjuHPSyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTA5LTAxIGF0IDE4OjU0ICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gVGhl
IFREWCBhcmNoaXRlY3R1cmUgaW5jbHVkZXMgYSBzeXNjYWxsLWxpa2UgQUJJIGZvciBPU2VzIHRv
IGNvbW11bmljYXRlDQo+IHdpdGggU0VBTSBtb2RlIHNvZnR3YXJlLiBUaGlzIEFCSSBoYXMgdGhl
IGNvbmNlcHQgb2YgYSAibGVhZiIuIEVhY2ggbGVhZg0KPiBpcyByb3VnaGx5IGFuYWxvZ291cyB0
byBhIExpbnV4IHN5c2NhbGw6IGl0IGhhcyBhIHNldCBvZiByZWdpc3Rlcg0KPiBhcmd1bWVudHMg
YW5kIGRvZXMgb25lIGxvZ2ljYWwgdGhpbmcgbGlrZSBhZGRpbmcgYSBwYWdlIG9mIG1lbW9yeSB0
byBhDQo+IFZNIG9yIHJ1bm5pbmcgYSBWTS4gVGhlIFREWCBhcmNoaXRlY3R1cmUgcmVmZXJzIHRv
IHRoaXMgaW50ZXJmYWNlDQo+IGZ1bmN0aW9uIGFzIGEgIlNFQU1DQUxMIGxlYWYiLg0KPiANCj4g
SnVzdCBsaWtlIHN5c2NhbGxzLCB0aGUgVERYIGFyY2hpdGVjdHVyZSB3YW50cyB0byBldm9sdmUg
dGhlIEFCSSB0bw0KPiBleHRlbmQgZnVuY3Rpb25hbGl0eSB3aGlsZSBrZWVwaW5nIGNvbXBhdGli
aWxpdHkuIEJ1dCB1bmxpa2Ugc3lzY2FsbHMsDQo+IHdoaWNoIGRvIHRoaXMgYnkgcGlja2luZyBh
IHRvdGFsbHkgbmV3IHN5c2NhbGwgbnVtYmVyLCB0aGUgQUJJIGVuY29kZXMNCj4gdGhlICJ2ZXJz
aW9uIiBudW1iZXIgZGlyZWN0bHkgaW50byB0aGUgYml0cyBvZiBhIHJlZ2lzdGVyIGFyZ3VtZW50
LiBTbw0KPiBpbnN0ZWFkIG9mIG9wZW5hdE4gYmVpbmcgd2hhdGV2ZXIgdGhlIG5leHQgZnJlZSBu
dW1iZXIgaXMsIHRoZSBTRUFNQ0FMTA0KPiBsZWFmIG51bWJlciBhbmQgdmVyc2lvbiBudW1iZXIg
YXJlIGVuY29kZWQgaW50byBjZXJ0YWluIGJpdHMgaW4gaG93IHRoZQ0KPiBSQVggcmVnaXN0ZXIg
aXMgZGVmaW5lZCBpbiB0aGUgQUJJLg0KPiANCj4gSW4gTGludXgsIHNldmVyYWwgc2VhbWNhbGwq
KCkgd3JhcHBlcnMgaGF2ZSBiZWVuIGludHJvZHVjZWQgdG8gaW52b2tlDQo+IFNFQU1DQUxMIGxl
YWZzLiBUaGV5IGFsbCB0YWtlIGEgdTY0ICJmbiIgYXJndW1lbnQgZm9yIHRoZSBsZWFmIG51bWJl
cg0KPiB3aGljaCBldmVudHVhbGx5IGdldCBzZXQgaW4gdGhlIHJlZ2lzdGVyLiBBcyBhYm92ZSwg
dGhlIHZlcnNpb24gbnVtYmVyDQo+IGxpdmVzIGluIHRoZSBzYW1lIHJlZ2lzdGVyIGFzIHRoZSBs
ZWFmIG51bWJlci4gU28gY2FsbGVycyB0aGF0IHdhbnQgdG8NCj4gc2VsZWN0IGEgc3BlY2lmaWMg
dmVyc2lvbiBvZiB0aGUgbGVhZiwgY2FuIGphbSBpdCBpbiB0aGUgcmlnaHQgcGxhY2UgaW4NCj4g
dGhlIHJlZ2lzdGVyIGJ5IHBhc3NpbmcgaXQgaW4gdGhlICJmbiIgYXJndW1lbnQuwqANCj4gDQoN
Cg0KPiBUb2RheSBvbmx5IHRoZSBjYWxsZXINCj4gb2YgVERILlZQLklOSVQgZG9lcyB0aGlzIGhh
Y2ssIGJ1dCBmdXR1cmUga2VybmVsIGNoYW5nZXMgd2lsbCBuZWVkIHRvDQo+IHNlbGVjdCB2ZXJz
aW9ucyBmb3IgbW9yZSBTRUFNQ0FMTCBsZWFmcywgc28gYSBsZXNzIGhhY2t5IHNvbHV0aW9uIGlz
DQo+IG5lZWRlZC4NCg0KT25seSBuaXQgaXMgdGhhdCB0aGlzIHdvdWxkIHByb2JhYmx5IHJlYWQg
YSBsaXR0bGUgYml0IHNtb290aGVyIGFzIHR3bw0Kc2VudGVuY2VzLiBFdmVyeXRoaW5nIGVsc2Ug
bG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNv
bWJlQGludGVsLmNvbT4NCg0KPiANCj4gRXhwbGljaXRseSBkZWZpbmUgdGhlIGFyZ3VtZW50cyBm
b3Igc2VhbWNhbGwqKCkgd3JhcHBlcnM6DQo+IA0KPiDCoCAtIEFkZCBhIGJ1aWxkLXRpbWUgYXNz
ZXJ0aW9uIHRvIGVuc3VyZSAiZm4iIG9ubHkgY29udGFpbnMgdmFsaWQNCj4gwqDCoMKgIFNFQU1D
QUxMIGxlYWYgbnVtYmVyIGJpdHMuIE5vdGUgdGhlIFAtU0VBTUxEUiBzZWxlY3RvciBiaXQgKGJp
dCA2MykNCj4gwqDCoMKgIGlzIHBhcnQgb2YgdGhlIGxlYWYgbnVtYmVyIGZvciBTRUFNIGxvYWRl
ciBjYWxscywgc28gaXQgaXMgYWxsb3dlZC4NCj4gwqDCoMKgIFRoaXMgYWxzbyBtZWFucyB0aGUg
ImZuIiBjYW4ndCBiZSBhIG5hcnJvd2VyIHR5cGUsIHN1Y2ggYXMgdTE2LCB0bw0KPiDCoMKgwqAg
ZXhjbHVkZSB1bnJlbGF0ZWQgYml0cy4NCj4gDQo+IMKgIC0gQWRkIGEgInZlcnNpb24iIGZpZWxk
IGluIHN0cnVjdCB0ZHhfbW9kdWxlX2FyZ3MgWzFdLCBzbyBtb3N0DQo+IMKgwqDCoCBleGlzdGlu
ZyBjYWxsZXJzIGdldCBhIGRlZmF1bHQgInZlcnNpb24gPT0gMCIgYmVoYXZpb3Igd2l0aG91dCBj
b2RlDQo+IMKgwqDCoCBjaHVybi4gVXBkYXRlIHRoZSBUREguVlAuSU5JVCBjYWxsZXIgdG8gc3Bl
Y2lmeSB0aGUgdmVyc2lvbg0KPiDCoMKgwqAgZGVzY3JpcHRpdmVseS4NCj4gDQo+IEVuY29kZSB0
aGUgbGVhZiBudW1iZXIgYW5kIHRkeF9tb2R1bGVfYXJncy52ZXJzaW9uIGludG8gUkFYIGluIGFz
c2VtYmx5LA0KPiBiZWNhdXNlIHRoaXMgaXMgdGhlIHBsYWNlIHdoZXJlIHRoZSAiZm4iIGFuZCBz
dHJ1Y3QgdGR4X21vZHVsZV9hcmdzDQo+IGZpZWxkcyBhcmUgbWFyc2hhbGVkIGludG8gcmVnaXN0
ZXJzLg0KPiANCj4gQUkgd2FzIHVzZWQgdW5kZXIgc3VwZXJ2aXNpb24gdG8gcmV2aWV3IGNvZGUg
YW5kIHdvcmtzaG9wIGxvZ3MuIEluDQo+IHBhcnRpY3VsYXIsIGl0IGhlbHBlZCBldmFsdWF0ZSB0
aGUgYXNzZW1ibHkgY2hhbmdlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFh1IFlpbHVuIDx5aWx1
bi54dUBsaW51eC5pbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBLaXJ5bCBTaHV0c2VtYXUgKE1l
dGEpIDxrYXNAa2VybmVsLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IE5pa29sYXkgQm9yaXNvdiA8bmlr
LmJvcmlzb3ZAc3VzZS5jb20+DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS80
ZjRiMGYyOS00MjRiLTQ1ZWQtOGNmZC1jNzdkYTJlYTM5MGZAaW50ZWwuY29tL8KgIyBbMV0NCg0K
