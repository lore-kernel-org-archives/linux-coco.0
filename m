Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E12BD911
	for <linux-coco@lists.linux.dev>; Wed, 30 Apr 2025 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045221; cv=fail; b=l0gCYQhwlkxd/Wj7Ue3hrtChEa7v2vgBieCpm9ETz7zA8Vc+2mi43xcS8qvBrdduHl8BdP1CSHzY7aTPHdLaN1Fay1jH4M5861DXvqWIhGs+IwtyALNhdRaVtfnL9cghjs0zzsDwrwbLJT3B3cUO2Is3dwQK726/1SsgRp2V9dA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045221; c=relaxed/simple;
	bh=rhNnjy/0D3QjGoOrB0oG6yELPLJQSWrIGg+0HH53SFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hC5Pi39LRuZvZUtOBUqpApgR8kMSMsqba1kJ/VSp0IE9rlazSWAntkqP1U3bXZwjt6UPGp7SFh40gVTH4ibjkbU4PXfF9BTk+I9XJ1pd9TfhFTIfj5jyr4NBW8BTwvseHNExVrbyZvTEYZ1DJqL8/vcD89oVHry5igcE1FAJnMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uqnc0ype; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uqnc0ype"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746045220; x=1777581220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rhNnjy/0D3QjGoOrB0oG6yELPLJQSWrIGg+0HH53SFA=;
  b=Uqnc0ypeW0E/9YbZ+VS0YP0+HHfSZr5r3Zt3PNmPbzxLhgU0DTIsGx3E
   rgrYbj9zkKM3su67VbXauQfNRGSOhmuccdlqmmW3C5wUsyRSOxQsfRUby
   uWrcYBfXew9LbrHESt063FXgKrJtNw1JDBKoJ5laUs0Gd+ikoco2StGMs
   hAjECMaul/zGiP8pISW8mTYASEI8YmjFb3gpaL4cYvM+PbxBntyAUCbaJ
   p37YekvtTeN+VBhO5nKVzdKdmhtS4BtN2C/MZuACb2h/bByAae4sbxxHJ
   SJqjSjKUy71AHaukcT1oiQ23YhqDLyFEwQwlwj4xOLMo8cQZ1LOiYdyPW
   Q==;
X-CSE-ConnectionGUID: RX9EPBh7S0e3MBMs0pyvgg==
X-CSE-MsgGUID: IA7ppVujQK6CwnKgCNmUAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="70224348"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="70224348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:33:39 -0700
X-CSE-ConnectionGUID: Cwvl4cbVSUCV7OWdxir7kA==
X-CSE-MsgGUID: tNTo5NOvQ0aXJNM2Panz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="157461716"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 13:33:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 13:33:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 13:33:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 13:33:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS1xsmwCaAJ/rtUdugYA3eGYU2euscKUow6HUlOWlHMTltPmiUQVWsSB9wwvOhGrtT2KqbdrGkwJOGPtV/GLMFZxPupfEd1oT3Vo96H4XPHPBpJrkQpIvXfmQFd6vag4eD5pVXpOoS/FD6FLBPBW487ewX6xThrIF2JKlmnFMEMSReSRmVVViKT+k+8LX65+FRO7IGiNXh2K8gATPchOENJXhYzt51rDmHiI2apa6JW7oktuISMG+5dv4amH1GNJo0sSe1ijHLYg/Mic/k9U+O9J1xkBtmkFAr1Nr41sZiD4uSAFbVqaPTgjUKCP9AjCkhhpUwFRatrsolFbYRSaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNxOCu2ZE/iTvOibwfEGQRcNXF3WOU2FNBi7aLZLdoI=;
 b=P/x0S1JJVnFaP9PrlvesbATG0rfq8JHuXy8cITDPYQcp7YC/9E35ijODMEy37hwOskryHZBHchcUnDeq9W2hTYxNKqTd1YB68A0Iww4gQqiSJBzPRN54gW35yxfOEiT9dh9qMA1HIBO8KstvUp7ZBPTIwFcKRfsGMvNlQAyllTGzdLbeGGA+YsObqWP7+gosxSFTQreV3Rbn5z8qt+IXJR85wKlpMYtjFgVzV1xZvQkQdWgf7RUSZXdB2OSRGlTCb18E9RVQdKmk+T51kPd3ATKgb+GaCIaOQM48i8Pv0kpjU2SMcoSlJJuSKA5EBYxj+3B8EbcDfuPuuV0x6NRfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 30 Apr
 2025 20:33:34 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 20:33:34 +0000
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Cedric Xing <cedric.xing@intel.com>, "Dan
 Williams" <dan.j.williams@intel.com>, Kai Huang <kai.huang@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Sami Mujawar" <sami.mujawar@arm.com>, Steven Price <steven.price@arm.com>,
	"Suzuki K Poulose" <suzuki.poulose@arm.com>, Tom Lendacky
	<thomas.lendacky@amd.com>
Subject: [PATCH v2] configfs-tsm-report: Fix NULL dereference of tsm_ops
Date: Wed, 30 Apr 2025 13:33:31 -0700
Message-ID: <20250430203331.1177062-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <174544207062.2555330.2729112107050724843.stgit@dwillia2-xfh.jf.intel.com>
References: <174544207062.2555330.2729112107050724843.stgit@dwillia2-xfh.jf.intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0013.namprd16.prod.outlook.com (2603:10b6:907::26)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fa149c-1609-42d5-682c-08dd88264771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4yF1D42+8nqNxZSUC8OQTqwkBIWisUQEz+JwNp0bPBuKdThiSGsGhwSsKApS?=
 =?us-ascii?Q?m6DuIFhRGZQdwey20dyQxSREw5OzWI/n8NfPpyNSzSa3VHrlqTknkRVjm+Px?=
 =?us-ascii?Q?5jQOStakUNqjsNYzDaQomZzMYraDeBeuPlY5/wSHFsmDYOg2rBPKq3m9OQ2k?=
 =?us-ascii?Q?hfRuJX0bTxw68lBap0RlKJEPtpvbeH4xOAbI5zaxqmLm6UOBc0PR/Rl3nRBp?=
 =?us-ascii?Q?EuGcEOvyt9fylk2DZ4QdHkH2siIKHRR7oaUssGGylZ7uXjTNwSnuIDzZ7Isv?=
 =?us-ascii?Q?bYt4Dun/O8sBkoD1KJufU+fnntayYajgDtscEtQ/u+70othZ5Foc2EV6IOy3?=
 =?us-ascii?Q?cuWXV2QIHofShRz3FLnh2y+frMZJrSRz8Es64AWAb9r0egBo5kANrN/Lm419?=
 =?us-ascii?Q?hpXLFlwstrDJ55O0ZybAnbXjA20bnaXP2OT9ifxeCkkmHFR5p9Z/Tt7GqdRW?=
 =?us-ascii?Q?Sy5OajU1x0DXvv3V6YNzhET78velNeW1p+iGRmzYTtuF/s1D9gnkjJWRaQZn?=
 =?us-ascii?Q?Gtqrd17iUeXhp7F39ky6tN026rBFb5HJxLOZEeQbRjuQBGD0pgC4f8P/PeVO?=
 =?us-ascii?Q?i7oIyKXNRVAiySSi6je/yQVBCSC3j6fZ/9HmMyHjj1RMT/O2pCvWZOEp/EF0?=
 =?us-ascii?Q?sbhI/ZezCOQ/X1mRN97AFPdDKSrG+JJvEbnBqvaQ/mC7Ge3PGRf5schDt/Qx?=
 =?us-ascii?Q?XOoEYj41KTGA8qN9DudIH5LsmMOTcZl+wMWbGxr/2OQIuwftXofq6j/0lpRf?=
 =?us-ascii?Q?ZB1PG1JKeYnlvVWis8zDF5MDAcfG5pkWWuIZAikAR3qSG3HCvB2DdLxp/CLr?=
 =?us-ascii?Q?mOEn73SDdEwddulQHQJBCGymJb5W0JHYt31jPGvFV+xlY19QqVC7mBddm83y?=
 =?us-ascii?Q?faieML+L4PwBe3SQexPG0aiqUN0X3BCAyCqGNmmCKcoEvdxB5lltV7aRMIhJ?=
 =?us-ascii?Q?YUqQLt+6GFl5cXUqqxisnriE0aoDNRY4M7AqkIVj5Dpt+WDvEtRldqTaZze1?=
 =?us-ascii?Q?XncfYa+I+/ZBGuoJR/Nn6LTqAnQewZN/dDG9CdZaccQ3oIljcyRE5KzFK4Jc?=
 =?us-ascii?Q?DR3hLVpA96pSPe4Tct1QwpMUkOWcmOCovKrRwlAM8wddNZvMZgACPN/xobag?=
 =?us-ascii?Q?+5XWOwwVFh0cjq2DwIu+pvBxSmvtr9b/X2jEPHJlgTZC6dP29UkYx2NneltF?=
 =?us-ascii?Q?2Khc9gFyrfUpmNZzKSctuK4hjf6CIHrdHo4rxppA7f1y4qHP0ajLHfIXUxW7?=
 =?us-ascii?Q?To28jILjTwMiUVcSPs0o0rccO8j4TBw8TNqgc7FfozCe2ZANp8fVf0MwbLrd?=
 =?us-ascii?Q?ODL1dyT9XSMVjPD4e8BIthQ+C0yDFuIEgVVIOx44olgACG39DL+7bYyQKsrQ?=
 =?us-ascii?Q?fmh58ThIarNkNT7+Q6A2FfNWF/xb1ljwQl3mMnBsaaM3K0BDKiq9KP9IRH6S?=
 =?us-ascii?Q?fwXiDQyywbE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uore6rbQ20sMeeXbnW9jOUHmv5dbFAyFEI7onKV9DgHyotxYMr8OuLUm7HvJ?=
 =?us-ascii?Q?fZyg3bnb2azztImEZaOffO99LZkgqnxuDPVt1DcVRTzwX/ghcG7X0GfdZ9yF?=
 =?us-ascii?Q?+WmqWmvVK8DpGGWOF+j6cMvJgrvDDclhYrySC4ZAJ3EPB0B5c+gf17ViaD6a?=
 =?us-ascii?Q?1Lf8wnJLf1TLYhTqW4DmqQ7B22y2Z9HNqVq0fulmFNQ60P7+/7NnpXIgjhv2?=
 =?us-ascii?Q?25bX3tVShenB7eM2RsWcp6IDPJko5pB0DgQ4eIc+DhHFn/Fb1XQfV9kUwLV6?=
 =?us-ascii?Q?hAStxRDqNxovUsHPpvMZriMpaHQtBW8wO3RoqKLPaofmlA80fdprOl7SizDI?=
 =?us-ascii?Q?ajMbgv/C3FhQJSowWGzA+MzwMVYbqcvMpnXNpmrz4VC/NZTvkY+lvWGSeTG2?=
 =?us-ascii?Q?DolURGVn4W5jcuR+m0hugJF6vUzZmMwJtByaCK687RfBndWD7/fEMNxZGAzq?=
 =?us-ascii?Q?9eswWB1VpaTR73jLboSJUZVKs9JNDmi2p/OhYu0ZUt5C/CsuVRNDNBL+nWo2?=
 =?us-ascii?Q?J6m1Xs6fIYVVYt8e7Ia+FjShb83CGfUHGU7n22Qu73guYSaF9+Cna1Jm6+Zn?=
 =?us-ascii?Q?CufQMDZL2SC/sBjGy1SV2rFmOwihUdp7Ta97BsgebwiNz4rvFQmHM3UtqqUg?=
 =?us-ascii?Q?UAL86/G9AvRBN8G9ljU9Oh4uJX8Q+c2pkdWIRZv9aw2KOF4W28Pw+1Wx2+WS?=
 =?us-ascii?Q?RpjgDe6GdZN7S0lDQeOLV4Nn3o6rP+c833NGv9hgi3vplSXo1IsltVvpBO+c?=
 =?us-ascii?Q?V996OIrUqpLTI6T9BexqX5oF4ehsB1sgDaMFdfyJdv+wSiFQI9dKvH4fXVyW?=
 =?us-ascii?Q?df8V9tGGgy2hQNGPWeJAjLjnr7M68kTVK7l9GRpvWAMim0ZRF7kOGyjOme24?=
 =?us-ascii?Q?5K7H+adk6CzCda2E/ZHdqKdYjqvAurp3yzGFwB1kVAh8zSUxaF4Epa/TLxFo?=
 =?us-ascii?Q?Qu4TJ4Oq7W/pEP/NqwES9R3R5c+Bo6H620e71Gbwxi4UwsYLK+m2PYBlWQAo?=
 =?us-ascii?Q?ggX6ZC1bZYhMK1DioRxfwAMgO57vEQNhhjMXTGyZDjdf5113VeJbxSBI8g1h?=
 =?us-ascii?Q?XVPy7m1Jt0ZsnJJmc1QndwRfETKKqYKAFUOkmZOktUbfB5y6IdzBzwKvIfvi?=
 =?us-ascii?Q?2OlC2coh4JC7nitdMDtLliV04PyTCP9nJ7GI5giFBjbyHx3W1d7tgM0vCu7Y?=
 =?us-ascii?Q?rIIpoX48sn+Qs4tGPANP+o+q97uklBgo2dDJxRmSMHNf2Q6TOK5pODeqltWW?=
 =?us-ascii?Q?FRHlvde2n1+cc5+bAylTT3JGqbIvtF8bTVaEY4pPwsBsQKpNg0aUUcD9boJa?=
 =?us-ascii?Q?z/6kdoYGAEINV5umeTCeKzyzmO24BBmsv39Kd4WGTNARL2Msw4jtN9d5ZAYS?=
 =?us-ascii?Q?rpVxfDntOW6ySN5Y3EStQQRKb3eSXXzeODouYPeYGz5lhKKwzj6ZNSmDTEjS?=
 =?us-ascii?Q?nXxxbthwV+t7wrhkHBQwin7XGzz5PN5EbA19MAW7W98WN7gRUlI5pB3S1QnK?=
 =?us-ascii?Q?2hX725jrlbLtGuiMlX1kJ46KEdZwRUJDsLDoNiUpJak3I1WOAM1a3oamBuff?=
 =?us-ascii?Q?/CUEkHdQ3XHrS0UETFftZxQBdGAKeZ/tuynMDqblxPkV2Qgg1t+gnguIS8EH?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fa149c-1609-42d5-682c-08dd88264771
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 20:33:34.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TltGr53rMHB4XG4bOJZWsOFKmU3kTpYELO16oncbF0bFBgr8hk6Tdsesyt4E1/N86wSzfLDxVfTGazwx//iO4Z7hn3YZHM6K3B11vTI5zuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
X-OriginatorOrg: intel.com

Unlike sysfs, the lifetime of configfs objects is controlled by
userspace. There is no mechanism for the kernel to find and delete all
created config-items. Instead, the configfs-tsm-report mechanism has an
expectation that tsm_unregister() can happen at any time and cause
established config-item access to start failing.

That expectation is not fully satisfied. While tsm_report_read(),
tsm_report_{is,is_bin}_visible(), and tsm_report_make_item() safely fail
if tsm_ops have been unregistered, tsm_report_privlevel_store()
tsm_report_provider_show() fail to check for ops registration. Add the
missing checks for tsm_ops having been removed.

Now, in supporting the ability for tsm_unregister() to always succeed,
it leaves the problem of what to do with lingering config-items. The
expectation is that the admin that arranges for the ->remove() (unbind)
of the ${tsm_arch}-guest driver is also responsible for deletion of all
open config-items. Until that deletion happens, ->probe() (reload /
bind) of the ${tsm_arch}-guest driver fails.

This allows for emergency shutdown / revocation of attestation
interfaces, and requires coordinated restart.

Fixes: 70e6f7e2b985 ("configfs-tsm: Introduce a shared ABI for attestation reports")
Cc: stable@vger.kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reported-by: Cedric Xing <cedric.xing@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes since v1:
- Report leftover config items on tsm_unregister() (Kai)

 drivers/virt/coco/tsm.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/virt/coco/tsm.c b/drivers/virt/coco/tsm.c
index 9432d4e303f1..8a638bc34d4a 100644
--- a/drivers/virt/coco/tsm.c
+++ b/drivers/virt/coco/tsm.c
@@ -15,6 +15,7 @@
 static struct tsm_provider {
 	const struct tsm_ops *ops;
 	void *data;
+	atomic_t count;
 } provider;
 static DECLARE_RWSEM(tsm_rwsem);
 
@@ -92,6 +93,10 @@ static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
 	if (rc)
 		return rc;
 
+	guard(rwsem_write)(&tsm_rwsem);
+	if (!provider.ops)
+		return -ENXIO;
+
 	/*
 	 * The valid privilege levels that a TSM might accept, if it accepts a
 	 * privilege level setting at all, are a max of TSM_PRIVLEVEL_MAX (see
@@ -101,7 +106,6 @@ static ssize_t tsm_report_privlevel_store(struct config_item *cfg,
 	if (provider.ops->privlevel_floor > val || val > TSM_PRIVLEVEL_MAX)
 		return -EINVAL;
 
-	guard(rwsem_write)(&tsm_rwsem);
 	rc = try_advance_write_generation(report);
 	if (rc)
 		return rc;
@@ -115,6 +119,10 @@ static ssize_t tsm_report_privlevel_floor_show(struct config_item *cfg,
 					       char *buf)
 {
 	guard(rwsem_read)(&tsm_rwsem);
+
+	if (!provider.ops)
+		return -ENXIO;
+
 	return sysfs_emit(buf, "%u\n", provider.ops->privlevel_floor);
 }
 CONFIGFS_ATTR_RO(tsm_report_, privlevel_floor);
@@ -217,6 +225,9 @@ CONFIGFS_ATTR_RO(tsm_report_, generation);
 static ssize_t tsm_report_provider_show(struct config_item *cfg, char *buf)
 {
 	guard(rwsem_read)(&tsm_rwsem);
+	if (!provider.ops)
+		return -ENXIO;
+
 	return sysfs_emit(buf, "%s\n", provider.ops->name);
 }
 CONFIGFS_ATTR_RO(tsm_report_, provider);
@@ -284,7 +295,7 @@ static ssize_t tsm_report_read(struct tsm_report *report, void *buf,
 	guard(rwsem_write)(&tsm_rwsem);
 	ops = provider.ops;
 	if (!ops)
-		return -ENOTTY;
+		return -ENXIO;
 	if (!report->desc.inblob_len)
 		return -EINVAL;
 
@@ -421,12 +432,20 @@ static struct config_item *tsm_report_make_item(struct config_group *group,
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	atomic_inc(&provider.count);
 	config_item_init_type_name(&state->cfg, name, &tsm_report_type);
 	return &state->cfg;
 }
 
+static void tsm_report_drop_item(struct config_group *group, struct config_item *item)
+{
+	config_item_put(item);
+	atomic_dec(&provider.count);
+}
+
 static struct configfs_group_operations tsm_report_group_ops = {
 	.make_item = tsm_report_make_item,
+	.drop_item = tsm_report_drop_item,
 };
 
 static const struct config_item_type tsm_reports_type = {
@@ -459,6 +478,11 @@ int tsm_register(const struct tsm_ops *ops, void *priv)
 		return -EBUSY;
 	}
 
+	if (atomic_read(&provider.count)) {
+		pr_err("configfs/tsm/report not empty\n");
+		return -EBUSY;
+	}
+
 	provider.ops = ops;
 	provider.data = priv;
 	return 0;
@@ -470,6 +494,9 @@ int tsm_unregister(const struct tsm_ops *ops)
 	guard(rwsem_write)(&tsm_rwsem);
 	if (ops != provider.ops)
 		return -EBUSY;
+	if (atomic_read(&provider.count))
+		pr_warn("\"%s\" unregistered with items present in configfs/tsm/report\n",
+			provider.ops->name);
 	provider.ops = NULL;
 	provider.data = NULL;
 	return 0;

base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.49.0

