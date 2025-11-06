Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DF6FBF
	for <linux-coco@lists.linux.dev>; Thu,  6 Nov 2025 00:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762388030; cv=fail; b=ohWHe7wU+I2oFYeL9WmqR3ZQmJ0dPz1eSGIKwvWm3uA6pevfd7oy7z8X8gY+Kxk9wkAslEmk+iVTt8Rmhfpw3B+lQJWsSLMCV92E6AOwsjbIsAXx4BF+nF+zbLNdMj8O7AghR11Nuc6pWiCA/ihJQd/HXw+IvtYzgyjbsH+qIQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762388030; c=relaxed/simple;
	bh=1FwPIJr9U+rR7NdZTHxnHjXHX5W7PzAPs6N7NpqfbLk=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=opMhqd2yNjtjEae/+UV3uub2DsqlPPw0nnKu3uER4dBScuxtuJ5ZfKRQUZKmuptkFg+2irCR3a7gZ59wTfU99JbkkG6t0Kvwwndmp9RHfaSbFeucDC/TWB8X4l9vkTb6I/mBIzme4+zWn7VZ/1h4HjkYKikkBIw8o8nH7PUUvig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSSIeoHo; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSSIeoHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762388029; x=1793924029;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=1FwPIJr9U+rR7NdZTHxnHjXHX5W7PzAPs6N7NpqfbLk=;
  b=KSSIeoHoInSzZ1IFdhfqAJ/Suoe7FvLYXKfNytd9oXCTHC+Z0GLD3OZU
   SpmeKPJi1qzg6o1d3hevkEpai7ObjDNpO/GFweYTBDdzIhLXDm9PaeT1B
   0ejd7SemyRA8KrM3C8cozNywT4Rm5t0MJJT7jD2z+jhY0agPVhClqESj8
   4JOauI2ACsKDWYXjDFTulnlcGzMBLdMMGK4bzZ1rJH4g3Xf5lACX8KiDM
   lwq/pZG1wtkF8bMkL1kBFRlt+URzWlugZjWbLA9ETd0JIpSAj+0eXINcg
   d96yv9vpyD/ERM0dkAELEgTTpSDdHbsSjHaAWmFfqMuAmQasmNew4ZF6K
   w==;
X-CSE-ConnectionGUID: pZ6IeX0ITtCMVigM5O5WbA==
X-CSE-MsgGUID: 3nsQpwntQue3kZdPfsRJAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64213674"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64213674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 16:13:49 -0800
X-CSE-ConnectionGUID: /ysun5ITTAiYn/6SpyYEsw==
X-CSE-MsgGUID: NwnmEZf4RNqp5Y7v/kwrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187307990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 16:13:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 16:13:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 16:13:48 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 16:13:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF5gDjjqIbdr9A8+rk6YOvvm5Tdl+KhfaH6LPSL/UW5VGBW95OysLMp3YksEU0ItB6AgziM1C5SMqAD6wIHpvXyudHRYrkEDI+DlwFLE2kZpo8swm9me1K5JL4Ot+ttkRyPIgW/88u4wgOZ2u4nY8KhSTIil5kLEEpDCd637tdvdDGwC0j2MDPDMn8uY252i/H5+O9ZIEvNX1C9J4pieVaQqT5GnBn769TAs/geQcMIQ7QA+UGeYWdbCDFuV+E7lFbFu7IOX1PS5g2QZGG0OA2z2bt6EvTwzJ1lR/MbB5qhYyYZjUeD/MHBy7MCaMsGyEIjshPPA3UhbA96FyKOE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFxLrwGocgrsMbMoevn/hKUGzKJIveJXFJKrA+UkCzc=;
 b=RidPrsto+OWGOndVg7kldChQ/CBNYPzgQoh2caXKG7BO6ESLi4RIzR/rB1sXp7VwAJyuGpjQeW6xSn/avzDq8K8piMmy2jURUzd7kXRfPnbxHKeADuZAhMzxvVU0jZK4gQycvl2s/3qzjqdUiM0YVtOHTdbwMQ2QWbzl0a9I0dPFkZatmW3jvTmDlhBEB5wC2x83rPdH5JSaVcGlpr5m1PisOEoMlTxE3lbH6rG9x8VP+lRdK0/KTZ2LSisl6tQWNifgFA8WordTeSLVt9E+zhVegkPs19iYY+YB9vtZTAxqQ/Efna8Spcn+sRhqYnRoej5OIyDEgqcghIYqIKEMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB8832.namprd11.prod.outlook.com (2603:10b6:208:59a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 00:13:45 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 00:13:45 +0000
From: <dan.j.williams@intel.com>
Date: Wed, 5 Nov 2025 16:13:43 -0800
To: Jonathan Cameron <jonathan.cameron@huawei.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	<bhelgaas@google.com>, <aneesh.kumar@kernel.org>, <yilun.xu@linux.intel.com>,
	<aik@amd.com>
Message-ID: <690be837cb8f0_74f761005@dwillia2-mobl4.notmuch>
In-Reply-To: <20251105153802.00004ddc@huawei.com>
References: <20251105040055.2832866-1-dan.j.williams@intel.com>
 <20251105040055.2832866-6-dan.j.williams@intel.com>
 <20251105153802.00004ddc@huawei.com>
Subject: Re: [PATCH 5/6] PCI/TSM: Add pci_tsm_guest_req() for managing TDIs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ee2d02-2321-417b-28d0-08de1cc959ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEU1TjdsTkt1b3VMZzlxeGpsQ2xIbk9nRnRYSE5iVGVUcEFiMkZmU0NjZFYr?=
 =?utf-8?B?Rlc2RkxpQVd0MUxXTHBmamJhK1hNU3VGVGVRM20wR28vcWNOUk9WRzZ3c0N0?=
 =?utf-8?B?a0VzRTd3OUV0Mk9FWFlxMFdRODd6WGFlcGhQN2k2bElON1ZFQlNHSGNqQTFI?=
 =?utf-8?B?L2kvbWtWSkF3WHd1YjVQcmRVQ1pwSmdLK05qQlB2b0J4aFNTU3Zham9wYmpO?=
 =?utf-8?B?V2NkR3FoYmNWZHY0TDVKTEJRTS9XdlV6WEZ6Qjd4ZzNGVm12R3VPakdzYjE2?=
 =?utf-8?B?Q3MrOTFBdjdIRkpqZDA5RWNTNnBmZytGaWV6ZDNNWHQyWUJRcmRFZ0ZxK21Y?=
 =?utf-8?B?bFVFa2dWMUNFOGdvdDdoMXIzbU9wMzROSW95Smt3Rm9HYkhkT2NWU24yQzE3?=
 =?utf-8?B?aWNEb1duNWswcjF6djcxVUJrbmdFa2ZwQ2dkUjNjT3FpSldjTkZGd01nVitp?=
 =?utf-8?B?cUlicGNzTXlxYXZsSzVxVUJheC9HRTJ4d05meU1SNXB4UDl5LzFvNjhTbjlz?=
 =?utf-8?B?MTQ5L2Q2eHh5QVJSUkVGcnl3YWI5b043L3F2UlFxT3hmREdOZGFSaG15UDRh?=
 =?utf-8?B?WXh4Zk5rWk5ZVUYxalYvcEdwcGdPWm1hc01jSTMra0hHUUhyN3hCQVByR2Ny?=
 =?utf-8?B?aTVjZWl6R3I4ZEs0VUFBbTdmMUJqTXBIQzRrNFF5SEV4YXc2TU1zalVXdjdR?=
 =?utf-8?B?LzdOZGNNK3YzZ3g3a0NnTWlwbXdWUUhrTG1qM2ZjeW1Xck5oL2FxNXBScU9K?=
 =?utf-8?B?bXR3Q1JJczhxcEZTMGYzanpINkV0cWt4VHNWMFdGbTBQOHo4cUVBOEZTYm9r?=
 =?utf-8?B?VURpZHRpWTlKZEVYdFkxMHYvSGhwMFF2RFNUTk9PN29ERUk2VlV3VEpQYllO?=
 =?utf-8?B?L3pmSFkvRmFpcUk0cGlkcFFNZS9oV1puaTVIRXFld1NmazExUDdzc3VET1hx?=
 =?utf-8?B?MVhuLzJTRE55OE93WVlHRVhJVXpwTGNqeXBBQW9vdzBaZEhSa3NGTFYzb1k1?=
 =?utf-8?B?UUpOK0RsNjU3MzgwVnZhRGFTZDJNY0dDaTlXanR3WXdVcnJqS3EraWNHeXBI?=
 =?utf-8?B?bXZCUXdNeTZDT2xNYk5wOGxvZWkrQjdEdk1odTY4YVh2VnYxbGZLQS9RdFBO?=
 =?utf-8?B?NTRtaUl4ODJ5MXgrV2tnWkEzalVXMnJ1UHZncUFBeEU1eXoyZUNOWEF1dFFs?=
 =?utf-8?B?WmlQMXNTT3BMZDVXT3VTbG5ta2x6bnREVEpoVzY2NFBGQkhQR010bmdUd1g3?=
 =?utf-8?B?dFFNdmR6WkJYSjdBaSswR2xUN05sOEdBWjlYYkdlMGFRTVVuajR4WFUyT2Vj?=
 =?utf-8?B?bTlTclJqbzVId1ByL3F4UFd0SzlRdGV0MTZKTXExSU00YVZJMytWZG5SNE5L?=
 =?utf-8?B?SjlRRWkvbXdkZEVQTmxXYmlEdWhZOGF5Vys2U0VJRWdxS0hNUzNwV3FxT1Jw?=
 =?utf-8?B?U1JjcGU3Mkw0c1hHT1hpVndnTnVWU2pvNU1Ed3VjSVFsMFRzRjNGMVNCMEdT?=
 =?utf-8?B?Sko4ZXZlb05sblo2MmpoUDlDSWlkR0xhU1AwanREYkdOS0d5Q2VaRGxzWGJB?=
 =?utf-8?B?WERJOXE5MzRkWDhoV0htL3FkRmU0Y1NIT3pleWN0M2h5TVlFZVdqUk10b3RF?=
 =?utf-8?B?NFRqbk5CaWh3TWRVWjBPTTBMWjVONnlUZlZxTHlERWNycDlDNEEyWlIzaUR1?=
 =?utf-8?B?NWJkcnh3cUtPSGtweC9oaWJ3b1FycWF0allMTkpVbDNFbU5qOG1jL0U1QXRm?=
 =?utf-8?B?VUZPNkMwa1puOHYrMTBqSXFIZEJ2NmRxYlAwMy9rakc3cXljNXVGUVZIL1Ax?=
 =?utf-8?B?R3d3dXdvaS96NTdrWk9HQURFSUdvN2MwMmRnZGJBQS9XWGhkUzJNU3R5SU5C?=
 =?utf-8?B?b3lFTGRhVmgzTTN2UWxnUHBuRUV2REVwUUZWZUV5THpHaTdkVnoxOTlOY2pz?=
 =?utf-8?Q?EEca9NtfqPxrpVhkJdGT+wPpisE10C6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDNhcUZmdGN0aEVCaHo5eXpNZkprMU5aTkNnNDVwa0lnQW12WkJsbnpPbDda?=
 =?utf-8?B?cHJibjAvOWl5OFNkT3BnMXNxZVhERXFTdjM3VENuNUtndm8rQ09DTnFuTWht?=
 =?utf-8?B?cWtxc1NDbzBpRU53dmo4TkZub2JHZEhYVk5JZkMrSk1vUjE3QTNvdlR2bGJh?=
 =?utf-8?B?d1FHZS84dkpLUVYwZVN4cWMzdWRUNTBrL0xQR1ZUSC96U1RvQmIxbkg3My9l?=
 =?utf-8?B?QzdmeTc3dEdpZzZGdVNHVFlDbEl1b2RyWGdCeENzZjB5cHgwUzFlNjJYSFVJ?=
 =?utf-8?B?ZEJVVlV5dlBFV1BqeDRaL3h4enFOKzJTMVY1MmppdXhRWlNuVEo0eStFQTRJ?=
 =?utf-8?B?bDBtaytFM2YzWWc1N2hQUWJzbktZRTFQcmJhSXNBUmtXTW8xSnlEeUNpd21p?=
 =?utf-8?B?Nkt6c1haaWNOSGh1WUZFTGlxRVhnbWlkbVRnVGFQM1N3RGRrVE1VVnRpLzJx?=
 =?utf-8?B?TDE5Z2xYeHhIRzJpcmtGREFnL1JRd1JhcVNTdEwrODJIakFRUGgyTmpSL1pK?=
 =?utf-8?B?NUVaK2twOWxibVB5WklEeXU3enltUWFmVVFNVEZzWFJJSEhYK2ZrbnRMZVc5?=
 =?utf-8?B?MjNjR1BTa1NqMDBpbDBlbXE1L0VwOUFZM29rcTljZ0xweEFxa2lPUGNnT3Js?=
 =?utf-8?B?aHpKVEptbC9uSjVFWFYwZ1BSMi9yWk5ORy9zR2dBZ3NLZmhVbG03RTdzOFdh?=
 =?utf-8?B?dGJMeXovNzVrazZBSkNGOWl2MUw4Z2ZBT1lSKzB0ZHBGTXh6QWJ5WVl3bS9X?=
 =?utf-8?B?WWkwaHJxVlE3aTFjSlppYTZXNldoZklwUlIyUlVjTjlPT0N0VFpidm9yTlR1?=
 =?utf-8?B?MTBBMjZnTmEwdmN6VDhaK2xZeitGRkZqOE9jM1hueEFYcEVKS0tHdnY4T3Rj?=
 =?utf-8?B?S2oxRmZFNTBBbFd4Y3cyNFE5bHBQQnBQbFZFazU5RU4zemNlUWtkWmJuWW0v?=
 =?utf-8?B?a1VPU3kxd1dVRVEzTEVETWJPb0pKd2FSSW5ZbmR3MlBWRHFpellQK2U0SW1r?=
 =?utf-8?B?L1ovekgycmxyOU1yR3hlVWZhdTMyY2paM2R5TFVLSklCL3dWa3ozZ1F2UG91?=
 =?utf-8?B?bDNEMjRKSVBYUFJBOEhqYmdQZmZaQjRFMTVmbkdBdlZDUC8vZUxYU3kwajdo?=
 =?utf-8?B?WmhMa3ZZalF5c0NiN0VaYS9KQjBoNlRBU09FR09qQmJBWkZYTFZMd2Vxc3ln?=
 =?utf-8?B?SVhLTS9vS013MGpaem5xeU90TlZWR1JNWUxxeUppT2trSUR0VEpidHJRMkdJ?=
 =?utf-8?B?OVlrOXdsR25vMjdDZzZjUVRlUG5Jb3dYMnVWb1ZqUWNUOHpxQ051SHVHelVx?=
 =?utf-8?B?bEtGY2IwQmFGd1F2ekkvZEdvU2hmaHU5bGorT1dESEpXMTFPV0g1ZSs2bU9M?=
 =?utf-8?B?RGt2czZGL3hHT0Q3UUZXYis0MCtaU1IxRm5vWm92WGJtMjZrdEFyaXRuN3Zk?=
 =?utf-8?B?QjA2cWcvMDFtQi9jTXhmODE4ekhCK0dJdHE3Yk5pYW5UdDRkYzQrWnNlR09T?=
 =?utf-8?B?cXZFSW4xUEpTdFlHR0N5czhKMU16OVFOUFJMamI4MWsyZnl2U0xibXlrZVBC?=
 =?utf-8?B?REczYkROeVhKUlM5Z1RQUkpkTkcyblhodCs5QnI4ZDVpSGhnS1pVZ3ZMMHdX?=
 =?utf-8?B?QXdOa0REK2Q2ekN2NDM5bGpSWXRzVGg2NXJ4NEQ0Q3hDMTM0VDIxbTBKL3BC?=
 =?utf-8?B?T21KQ3VSdmRRa3hGdy9CalZWSnlNTS9tekdNQmxrRmo3emE2V2cxQXJkN0Rh?=
 =?utf-8?B?VWdnZkx3UXVKSGRzVml2ZEJzQ1dNRGNvWVVDL0gyS2RuTlNsM2VjRWY3cmY1?=
 =?utf-8?B?WE9zbUZRRUZNQkQyUk83T1pTQTBHNk1JRzhtdHBvUUZmTlRjeVlNVHJGbm42?=
 =?utf-8?B?aGtCRDZrVG5uekcvczNkd2pIUnM5WHdxSWNJd2FGTk80c2RiTUZhbnBES2RW?=
 =?utf-8?B?ZmM0SUIrL2R2djFRWWZBd044SHlCOS9ybzhETWFCaE9WeTgxcmRJVTh3YWkr?=
 =?utf-8?B?dE45dGNMK0hEQlZRdSszVHNEb0xvQXFDdy8xb1ZaKzFkcG5tTTY0L3ErRnlL?=
 =?utf-8?B?ZlBPa0VNby9HQjM0YmNWQUxqaEFHdlJvZFZsRWFnelhXSzd6TEE5dUdmMjQz?=
 =?utf-8?B?YWFSeFRLa05lODQ0ZVA2ZWhIQUZDeUYxKzJsbExSUVoxTkVwTytWTmFyMVh6?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ee2d02-2321-417b-28d0-08de1cc959ba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 00:13:45.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVocpNZqT+QLM7KNYWsC9fF/fzI4PuTmBShb1QWLQYeF2tb7Qee1rdPeccAP17VY1LIMvep750SNVCn4l/Xk9TWD4jJSIjxYofXnHQPGYYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8832
X-OriginatorOrg: intel.com

Jonathan Cameron wrote:
> On Tue,  4 Nov 2025 20:00:54 -0800
> Dan Williams <dan.j.williams@intel.com> wrote:
> 
> > A PCIe device function interface assigned to a TVM is a TEE Device
> > Interface (TDI). A TDI instantiated by pci_tsm_bind() needs additional
> > steps taken by the TVM to be accepted into the TVM's Trusted Compute
> > Boundary (TCB) and transitioned to the RUN state.
> > 
> > pci_tsm_guest_req() is a channel for the guest to request TDISP collateral,
> > like Device Interface Reports, and effect TDISP state changes, like
> > LOCKED->RUN transititions. Similar to IDE establishment and pci_tsm_bind(),
> > these are long running operations involving SPDM message passing via the
> > DOE mailbox.
> > 
> > The path for a TVM to invoke pci_tsm_guest_req() is:
> > * TSM triggers exit via guest-to-host-interface ABI (implementation specific)
> > * VMM invokes handler (KVM handle_exit() -> userspace io)
> > * handler issues request (userspace io handler -> ioctl() ->
> >   pci_tsm_guest_req())
> > * handler supplies response
> > * VMM posts response, notifies/re-enters TVM
> > 
> > This path is purely a transport for messages from TVM to platform TSM. By
> > design the host kernel does not and must not care about the content of
> > these messages. I.e. the host kernel is not in the TCB of the TVM.
> > 
> > As this is an opaque passthrough interface, similar to fwctl, the kernel
> > requires that implementations stay within the bounds defined by 'enum
> > pci_tsm_req_scope'. Violation of those expectations likely has market and
> > regulatory consequences. Out of scope requests are blocked by default.
> > 
> > Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> > Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> More triviality inline.
> 
> 
> > diff --git a/drivers/pci/tsm.c b/drivers/pci/tsm.c
> > index f0e38d7fee38..4dd518b45eea 100644
> > --- a/drivers/pci/tsm.c
> > +++ b/drivers/pci/tsm.c
> > @@ -354,6 +354,69 @@ int pci_tsm_bind(struct pci_dev *pdev, struct kvm *kvm, u32 tdi_id)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_tsm_bind);
> 
> > +ssize_t pci_tsm_guest_req(struct pci_dev *pdev, enum pci_tsm_req_scope scope,
> > +			  sockptr_t req_in, size_t in_len, sockptr_t req_out,
> > +			  size_t out_len, u64 *tsm_code)
> > +{
> > +	struct pci_tsm_pf0 *tsm_pf0;
> > +	struct pci_tdi *tdi;
> > +	int rc;
> > +
> > +	/*
> > +	 * Forbid requests that are not directly related to TDISP
> > +	 * operations
> > +	 */
> 
> 	/* Forbid requests that are not directly related to TDISP operations */
> Is just under 80 chars.

Indeed it is. Probably a case of rewording but then not reflowing with
clang-format.
