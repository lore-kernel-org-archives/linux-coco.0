Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A1515D1
	for <linux-coco@lists.linux.dev>; Fri, 19 Jul 2024 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721352672; cv=fail; b=iGQpFdoLA7OwrZuyGB3mWWd4COaop94YEKN1D3TtjZer+2uanY+dDvMtRZ3MDYVG+qN9w8eY0fDXdXMEz3oyLE6p4varDTJz8CVrBRj/dlyn5+9Abslks4S2CNPKA9mCI8knatB1N6uAfeFrJCN4VWyJPbefGbc9Qbp0NDbWgpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721352672; c=relaxed/simple;
	bh=6ihHrrnn3+SHI8K2sWAXSYGbbVyKFSzyxZNgq2FOvv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a1shYJMGkkvFqOONgh+uOVEWTIX3JGAGcVFQ9X4UyM/YD4ARpyW59eb8f+c3so/rWz6xRaaNZNXOpFAdPESqxhDymXVO3sO8ywuItUwrglHPiXWZXK5nkz8BNzPIWcdLXOkhuOV1evzPFeVSF1fAp68TNZwFn6aq8Naqu1myRV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNaa8lQH; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNaa8lQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721352670; x=1752888670;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6ihHrrnn3+SHI8K2sWAXSYGbbVyKFSzyxZNgq2FOvv8=;
  b=PNaa8lQHHkRE+Y/wlx4L5DylMzYXS7z5yY3qqP79XcbU8DNwD3WLZlO2
   9hcoxSAPRIn5DSb6kB+Mwokja7kxSBZ1181W8LMtoFZenpHZ2dLttGQj6
   MY5lQP9CDM/Z1/FOJGSSTGo+mou8hcgw8/+rAnzH35b1kYz3u59v8rWHP
   fjXnxdftR6UlTZQGSIEFRvNHCNskdeh5xpRJcYB8YSmFS8PqKof2xuljy
   mBSV07eCOB/IbAN0W99Hv6AqmSHSUFcTXtI/NhIjF4sKR9+HtxGSrDZbG
   yE+Hf760SIvPcoIUCVIQo+tgPa+AyFb8P19w0zSWI/nnZWuzhY/tKklAH
   w==;
X-CSE-ConnectionGUID: gRmUuS48TxuhbAthxZ5U2A==
X-CSE-MsgGUID: IW1E4jZLQluc+O3T+iIvBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="30107047"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="30107047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 18:31:10 -0700
X-CSE-ConnectionGUID: MdqThsqbTBKxmvGlkmD+sQ==
X-CSE-MsgGUID: xV1PNTlCRmSlzW1hdE6SKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; 
   d="scan'208";a="81589244"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Jul 2024 18:31:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 18:31:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 18:31:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 18:31:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 18:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXDMnWG2UtdTgTzR0+OQBBFA0cudVD2qvCUNgH7EpqfIkWtOBRu9UwNz+jXoA2Omk/Q0KmGCPpsOi3hRWKu/FYuE6SqEzv8pjRtK1V3K9+R3rQ+LWjLHV4YtQBpkTGEz4aLIPSDSPRcWGcd61EmFVYtfWo9Tv4Hs4kAK0LHVaSBHuyC3UHzYgtM2VK1Xp82Wk0UXdOTD0j6u5qxP1dAo68xZU1YOg40gG44gUfdpPNzVS1kSaY47HUpV6Cm0OmZIXvF+eXLZUcerNl38i9f4LWKGfnYJ06rHWroDFpqNXVIWvzo0nf5EVsLP2t60rJeImKgvjbyW4e3KXUopWRb5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ihHrrnn3+SHI8K2sWAXSYGbbVyKFSzyxZNgq2FOvv8=;
 b=uBOxL6UlbHfa9FL3y79MaBFNXm5e9CATMbQbBSXd67PtUXKnHv2EdTVdjt+VWcL/d/ow3hNVJMI0G5HSJjRJbUN4U0lUFvZ4oComob6OksZXBrDPqQR7Up3hNJRO6dN25Q9P31I95L/CapDt19LVLZcAfViPY3tblzIQOOD5iU4kzO8IL7p8vl5rrV9Vzy7I6A28sf1dcXHKZAm5iDOaWBrgGmimB8jbgPSD8fJFl9uCRqwdGGL03OfGaxZpr+XalIvOjrX10wXBP3xCs9XSTKijBeONjs38cJFjknP3zRN1vgWbVckXm5iWGwLi2U0JQli7qYWshWUxo8lKwundeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Fri, 19 Jul
 2024 01:31:06 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%6]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 01:31:06 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"Miao, Jun" <jun.miao@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH] x86/virt/tdx: accurately distinguishes TDX module loading
 situations
Thread-Topic: [PATCH] x86/virt/tdx: accurately distinguishes TDX module
 loading situations
Thread-Index: AQHaxMzD6SzoKXB5EkuhmFBC/YsxJ7H9bQoA
Date: Fri, 19 Jul 2024 01:31:06 +0000
Message-ID: <0d36d5a74669b75b238181b99805ec6e232b39b9.camel@intel.com>
References: <20240622175037.2051612-1-jun.miao@intel.com>
In-Reply-To: <20240622175037.2051612-1-jun.miao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3 (3.52.3-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|PH7PR11MB7500:EE_
x-ms-office365-filtering-correlation-id: ffd812e0-4535-4fc0-067e-08dca79275ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q29wZ1NvWStBTTQvL3d1T0tUYUo4TkNHQ1BiZjFVb245NWk4OVg1R1JZYlFh?=
 =?utf-8?B?QlJ5RVhWeTJqcmdzRkg3anJQeWdzeWhielQ4YzVrUFo1akU2UGkzeHdLL0F3?=
 =?utf-8?B?QW9mM1BOOGdKZWx6SEE4bnRNcERIQTJqRkRpSzlzbENPYUJvV0d0KzJ2S3Ex?=
 =?utf-8?B?NWgrZVdXK0UvSWtYamtVbE5Xa0JMOW9GR1FaUXJNYXV2R0toV1RkZzA5bi80?=
 =?utf-8?B?bzFjL3NEK0FyUE9mTW9saG0vYnBHKzcvYy9OL2JsNUtsUXl0V0ZyN0FXZGxP?=
 =?utf-8?B?L3NtQTdNRjgvcHBCN095ZUtxMFppbkhoWFNWekhYUHd5Wms0Q05aakRDMHBy?=
 =?utf-8?B?RjhPdXUybEhIdHI5T2x6dm5KWUQyUDZGNmhUSjhQR1Z2Q283d1M4MG1YY3Q3?=
 =?utf-8?B?ZkFRT0JtR2w2cktIWmpremtlVkMzQ01KUVg0enYxVy9wR1pTeFlSZFdpU3B0?=
 =?utf-8?B?c0dlSEdUQS9qRTVSU3pEUVJRNlkrUGgzeTUrY3l5akVOSEhRMklSMVU0d1pV?=
 =?utf-8?B?V1JIVm8yRWszeE5UcjNCZk1wVExobmxVVzF0ck1hQTJjTlY5RG9qcHhCeVJ1?=
 =?utf-8?B?Tk54SDc4b2h2MkVJaDU3YkVUVVhtRVA0TDhxWlljU2Z4SmZWcStORWJsZ0JN?=
 =?utf-8?B?Nkc1b3F6Y0FLa3BZZTZXR203eXRtYXRnSG9ZbXFjQzNxN1VreUpESW1VbTkx?=
 =?utf-8?B?MW05WVVXa1FGODhZVXRuZGlDY3pmTjk1Qms0d01PN0M2blFYaUtZMDViaUNk?=
 =?utf-8?B?ODFlekUxdzMvQ2VvT2JHbjhDLzVKencxbW9CTVI4UFdTYk1yT1JJSm12ZHhR?=
 =?utf-8?B?ZFhhL2w5NkFaR0xJNmpHY05uTEVDUjJwa05jTHdmK1dadXBWeWZrd0ltbUYr?=
 =?utf-8?B?VXc1Wkc0Q0t5aHBqYjhqcERMMHo3OGlleVhVV0d0N0ZiY3dxQlo3TXlSM3ZP?=
 =?utf-8?B?aldhUC9uOXlXc0pKd1hQMHVGNmdQK2ZRejFyTS8zb2VzZlVOS2haQkJneGxX?=
 =?utf-8?B?Qmx2Qmh5aGJQQ3MzTnJPQ0FtOHI0dFFtYmVtK1AxcWR4bzdHWjYxZ3VkQmhq?=
 =?utf-8?B?SWRpeUxCM3o1TjBicmExb0lYNTVsTlhaWkNJQ0N1YmpJdVk1ajNxSS9JcW0x?=
 =?utf-8?B?VW9LWkxIOFVNaVpqeDNWSE1Qd3p1Tk4wYlV1YmFndHJSZk9WcWNiQzF0VzU1?=
 =?utf-8?B?UjFwMUlLd1hKaEh5OWVsOGlNSFhZUWdDaEpib0xpVXhqeC9YUit5b1VtcG1O?=
 =?utf-8?B?QWJIRmE0cXpoQUVxck91cHY0MDA3WnI4ZldwU3hnRW5zQ3ZDbXd3Uk8xUWNG?=
 =?utf-8?B?SE9ZcHVxZFZYa004U3dXdkxNNmF2dVYrRmFSQlNReFRTTUNleVpFM2d1bno0?=
 =?utf-8?B?enhFbGt2TjdocWh2WGdHL3RYUW1Ia3doTlIwSDk0cUdURGFwTVJzMXRRclU1?=
 =?utf-8?B?OEluRVlOenhSU25WV21mZ2dEVXdPV0pSQ1gyQUJnYVRtN0FaY2VRSFFxUncr?=
 =?utf-8?B?V2xITUNKRVhVdFRrSDh0NWEvalpQY1UwTFVOak9HandFQUpheUd6elJZM1hG?=
 =?utf-8?B?NGl4dlB4V0VSUkJOdkEwb3JYalVYcm1MT0Rld211WWhwam81eWZzRmVka0Nj?=
 =?utf-8?B?SlQ4SnRwTThYcHhoTkFhU3JGbUMrNSs2L2x1eVNNWkRYUXVmVENuMU1vREhH?=
 =?utf-8?B?YkpIM3Zsc2x4L2hwcElaWXpKVjZYc1hheVlhZktvT2FWamtGT0JPOVBoa2ZQ?=
 =?utf-8?B?RzdtaTBuN0cveGtYVTJGNkEweFZEN1NIdjlIZHZtVVA4QUM0NWdMY29ZQnJ4?=
 =?utf-8?B?ZHBDUWZxUGMwTnliMlhpMG45UjkwSVkzaks0RUdNN3I2a25la01YUmdqb0tq?=
 =?utf-8?B?SVNYZVRqOWdTMVZJcW1SWjI5NlVIempnQnFKQ2p5WDdzOGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHRndUxUa0xRamVOekplNVlrSDh1VFNuWWtxSUJGbUQ0R1BnRGc4VU42UDdk?=
 =?utf-8?B?cTBReXBYeFBjYm9sOTlMMUhHSExRUFY3Y2c2bjRZSVE2aGlSQWZKTGRzTHR2?=
 =?utf-8?B?OG1aUHlUcmwrTndtOHRZMjI3YWsyc01wazFVdnVNUXFSaVd2L0QxazFNUlBx?=
 =?utf-8?B?aWx0enJyU3hGbjJnUVZ2c2JrblU3eFREcktqRVU1enV2MTJDNjdleXdqTDFu?=
 =?utf-8?B?bHRLMVRhU3ErcnY4OG44ekhzVmN5U1RHTG1JSzhlQnhnY3JnRGF1NitpeUNO?=
 =?utf-8?B?OVlmalpRWE5qZTJCbFBKOWF6Z1lwZG5iamJMa0dKMlpCSUJPLzFxZG93RHdv?=
 =?utf-8?B?ck80Ykt4dlZDVXEwR216LzVFYWdhUlRqcWxqL2hKVGpzUk1qbDdoMVJsSFE2?=
 =?utf-8?B?VjNjTjhvTEVXZ2tWMjU5S0VaYmk0SUFkd0ZhTi8xS2pGZkR2c3gvNDBrWXgw?=
 =?utf-8?B?TE90Q0F4TlNGb2ZSKzhGOUIzNXNLbFdiT3RMbFhiZ1FYSU11REthQkhOMS8z?=
 =?utf-8?B?aUxXaENGRktGTkNoOElhb2RUQ2trcVBURFltWmx1K05zZHIxMkd3NUVlM1Ja?=
 =?utf-8?B?a3BaM01jbjc5TTMwRHlvUUU4K0F0MWhIR241Mm4zL05yT05FT3huQit1a2xX?=
 =?utf-8?B?V1BBY0ZrSkNRRUpzRUE2VVFRK0gyRS94S1B5K1hRQmxvZGkrdGxCYnZGU1Fr?=
 =?utf-8?B?ajBuNnFmdlNRcC93Y24wNU1oaGJlMWlBTis0d2hjM1U5VWgyTVBKTzQ3RGFo?=
 =?utf-8?B?UEptRVBqSm9qamdZZDgvcXoycVRnelNuYlloV0I2WUo5TTJpeVlhWFFVN1hZ?=
 =?utf-8?B?N01JRFI2VzcrOGNWcEp6bXp4WFNWSjlzazBYeEhvL0NwZWE3Vmh1QXVSMW5V?=
 =?utf-8?B?V1lqNHFXL3lKdVhOZUNscXM3bW04UXY4bEV1R3p6OE5TS1dSTkxrdDNJeGRx?=
 =?utf-8?B?U2hkTlNtZm1QU3BqQ2J2VzJoMllOdk44Yk5leEV2KzJpcGRyUVI1RnEyQ3ZY?=
 =?utf-8?B?RnZ0WGVFSlJiUFZVaUo0QnV2bHMwMEVUK2FNTzBldU1STUVKS053bVlMV1JB?=
 =?utf-8?B?UzNLYkFTdW9xQTl5cXRXTTRONkt1UmdhaUxISWhFakNrczdxMU5hOGdON2l2?=
 =?utf-8?B?cDNFYTZWckp3Yy9kbFE0R2hSK0NHcGFKL0dtR1l0OGpaUUNGN2s5WDZCU0hm?=
 =?utf-8?B?RFk3RHRaemVXdXRxNTZTaG5FRGo0LzJLSHJqa3VUVFo3OC9nYi84SlhmeXJn?=
 =?utf-8?B?MEtZRS93N2ZBMW5sWndLaEZwMG4xUWwyanpUcUxEUW0ybFZEOGtDTGVLUHFY?=
 =?utf-8?B?aXhMNm8yOUN4cmJnTHlhZDM3b0Zkc1pvTTVEc3VLSFVPVUxVcDhHYko1WGRz?=
 =?utf-8?B?dXZUNkR2dVVFay8xOUdmdUMwbHdjTHdZUHN1UEpkemJoV3hXT2o2M1piNG9v?=
 =?utf-8?B?cHVYZHhNazhTUnY5ei92N0czZDduSlJsV3lncXlMbGJNU2tHV1hjZGtqV1g5?=
 =?utf-8?B?T3NPdUNIaHh3eEpSeCtKZmdndk9oM1Z0U2tzaHF2b01aMU1na2hma3JVWVJC?=
 =?utf-8?B?OWd1Rkk0ZGE0UzhkMXRBMVFGM1M4K0ZIY202Z3VMdC8xcXF2RTY3c2d5R2xt?=
 =?utf-8?B?VnpCWjZBWG04NVJKRGdiY0IzaDhVSzV3NWZ1ODRIc3ZTSU95cUozVlNoZWN1?=
 =?utf-8?B?NW91VUJabkNMTkFlb0lLZ3pJZU1FbjRXem1lWDczVW04cmFuakRKbWVIclJu?=
 =?utf-8?B?aVAzTVpndFBLVnFMa0pXSk44TXZ2emdwblJLR1VBTVBMbXZlSEhiZkgrTjFz?=
 =?utf-8?B?NSt2OU9NWWN0KzZsWUtjd2MyeXR6VU96WXlRUEs4a3VYY20xZDJNbFR1TGpq?=
 =?utf-8?B?S1VkbWk0eWhZSHpMM0VyMkhwMmU5NTF1STVPbUxMNFpraEl2Y2kweElFN1Ax?=
 =?utf-8?B?d2lVZjArR0p3ZnhPTnV4REdPMFNoU01DeXJnUkhvSmJlS1VwZUZJc2JnRmVr?=
 =?utf-8?B?Z1hTeHhqc1UwZlNEWmxCbExncDNMTHhEK1prY05ZdzZjWHJ1ZCtXV3RlRWJN?=
 =?utf-8?B?RmVKZlhid0greUwrVGF0SEd3em1HQjdsWmIyaVM2S0FJMHF1RzJtMEhWR0dY?=
 =?utf-8?Q?/L765JfBpsOvIeTnCDoc4tV5I?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA65D2FF7B931A49B384AF61CFA11D26@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd812e0-4535-4fc0-067e-08dca79275ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 01:31:06.5061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 24PEAeB4FpDqMVTypbP/gd+TDA1eD2kk//MZ0v7msN5osyPekdQH4rgmdB8yOa10q9cO5u/wYaZPnMeWUUwl8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
X-OriginatorOrg: intel.com

T24gU3VuLCAyMDI0LTA2LTIzIGF0IDAxOjUwICswODAwLCBKdW4gTWlhbyB3cm90ZToNCj4gVGhl
IGZpcnN0IFNFQU1DQUxMIGlzIGltcG9ydGFudCB0byByZXNwb25zZSB0aGUgc3RhdGUgb2YgVERY
IE1vZHVsZS9CSU9TLg0KPiANCj4gSW4gYWN0dWFsIGluY29ycmVjdCBCSU9TIHNldHVwIG9yIGRl
cGxveW1lbnQsIHRoZSBzeXNpbml0X3JldCB3aWxsIGJlDQo+IC1FT1BOT1RTVVBQLiBCdXQgdGhl
IG1lc3NhZ2UgIm1vZHVsZSBub3QgbG9hZGVkIiBpc25gdCBlbm91Z2ggdG8gZGVzY3JpYmUNCj4g
dGhlIGFjY3VyYXRlIGxvYWRpbmcgc2l0dWF0aW9uIHdoZW4gbW9kdWxlIGxvYWRlZCBidXQgU0VB
TUNBTEwgZmFpbGVkDQo+IGZvciBzb21lIEJJT1Mgd3Jvbmcgc2V0dGluZy4gU28gYWRkIHRoZSBl
cnJvciByZXR1cm4gb3BlcmF0aW9uIGNvZGUgbnVtYmVyLg0KDQooZmlyc3RseSwgcGxlYXNlIEND
IG1lIGluIHRoZSBmdXR1cmUsIGFuZCBwbGVhc2UgYWxzbyBDQyB4ODYgbWFpbnRhaW5lcnMsDQp4
ODZAa2VybmVsLm9yZywgYW5kIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcpLiANCg0KU28g
dGhpcyBpcyB0aGUgY2FzZSB3aGVyZSBURFggaXMgZGV0ZWN0ZWQgYXMgZW5hYmxlZCBieSB0aGUg
a2VybmVsIChURFggS2V5SUQNCnJlcG9ydHMgdmFsaWQgaW5mbyksIGJ1dCBURFggYWN0dWFsbHkg
aXNuJ3QgZW5hYmxlZCBieSB0aGUgQklPUy4NCg0KVGhpcyBzZWVtcyBCSU9TIGJ1ZyB0byBtZS4g
IFRoZSBCSU9TIHNob3VsZCBuZXZlciByZXBvcnQgdmFsaWQgVERYIEtleUlEIGlmIFREWA0KaXNu
J3QgZW5hYmxlZC4gIEkgZ3Vlc3MgaXQgaGFwcGVucyBvbiBkZXZlbG9wbWVudCBtYWNoaW5lcywg
YnV0IEkgYW0gbm90IHN1cmUNCndoZXRoZXIgdGhlIHByb2R1Y3Rpb24gbWFjaGluZSB3b3VsZCBm
aXggdGhpcy4NCg0KQW55d2F5IC4uLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdW4gTWlhbyA8
anVuLm1pYW9AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGFyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHgu
YyB8IDYgKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvdmlydC92bXgvdGR4L3RkeC5jIGIv
YXJjaC94ODYvdmlydC92bXgvdGR4L3RkeC5jDQo+IGluZGV4IDRlMmIyZTJhYzlmOS4uNzg3ZGZh
ZjQ0MDM2IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni92aXJ0L3ZteC90ZHgvdGR4LmMNCj4gKysr
IGIvYXJjaC94ODYvdmlydC92bXgvdGR4L3RkeC5jDQo+IEBAIC0xMjIsMTAgKzEyMiwxNCBAQCBz
dGF0aWMgaW50IHRyeV9pbml0X21vZHVsZV9nbG9iYWwodm9pZCkNCj4gIAkvKg0KPiAgCSAqIFRo
ZSBmaXJzdCBTRUFNQ0FMTCBhbHNvIGRldGVjdHMgdGhlIFREWCBtb2R1bGUsIHRodXMNCj4gIAkg
KiBpdCBjYW4gZmFpbCBkdWUgdG8gdGhlIFREWCBtb2R1bGUgaXMgbm90IGxvYWRlZC4NCj4gLQkg
KiBEdW1wIG1lc3NhZ2UgdG8gbGV0IHRoZSB1c2VyIGtub3cuDQo+ICsJICogRHVtcCBtb3JlIGRl
dGFpbGVkIG1lc3NhZ2UgdG8gbGV0IHRoZSB1c2VyIGtub3cuDQo+ICAJICovDQo+ICAJaWYgKHN5
c2luaXRfcmV0ID09IC1FTk9ERVYpDQo+ICAJCXByX2VycigibW9kdWxlIG5vdCBsb2FkZWRcbiIp
Ow0KPiArCWVsc2UgaWYgKHN5c2luaXRfcmV0KQ0KPiArCQlwcl93YXJuKCJtb2R1bGUgbG9hZGVk
IGVycm9yIHJldD0lZFxuIixzeXNpbml0X3JldCk7DQo+ICsJZWxzZQ0KPiArCQlwcl9pbmZvKCJt
b2R1bGUgbG9hZGVkXG4iKTsNCj4gIA0KPiAgCXN5c2luaXRfZG9uZSA9IHRydWU7DQo+ICBvdXQ6
DQoNCi4uLiBwcmludGluZyB0aGUgZXJyb3IgY29kZSB3b24ndCBoZWxwIHVzZXIgYSBsb3Qgc2lu
Y2UgaXQgaXMgbm90IG9idmlvdXMgdG8gdGhlDQp1c2VyLiAgSSB0aGluayB3ZSBjYW4gZG8gc29t
ZXRoaW5nIGJlbG93Lg0KDQpIaSBEYXZlL0tpcmlsbCwNCg0KQW55IGNvbW1lbnRzPw0KDQpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYvdmlydC92bXgvdGR4L3RkeC5jIGIvYXJjaC94ODYvdmlydC92bXgv
dGR4L3RkeC5jDQppbmRleCA0OWExYzY4OTBiNTUuLmE4YzI3M2NmZTE3ZSAxMDA2NDQNCi0tLSBh
L2FyY2gveDg2L3ZpcnQvdm14L3RkeC90ZHguYw0KKysrIGIvYXJjaC94ODYvdmlydC92bXgvdGR4
L3RkeC5jDQpAQCAtMTE5LDEzICsxMTksMzUgQEAgc3RhdGljIGludCB0cnlfaW5pdF9tb2R1bGVf
Z2xvYmFsKHZvaWQpDQogICAgICAgIGFyZ3MucmN4ID0gMDsNCiAgICAgICAgc3lzaW5pdF9yZXQg
PSBzZWFtY2FsbF9wcmVycihUREhfU1lTX0lOSVQsICZhcmdzKTsNCiANCi0gICAgICAgLyoNCi0g
ICAgICAgICogVGhlIGZpcnN0IFNFQU1DQUxMIGFsc28gZGV0ZWN0cyB0aGUgVERYIG1vZHVsZSwg
dGh1cw0KLSAgICAgICAgKiBpdCBjYW4gZmFpbCBkdWUgdG8gdGhlIFREWCBtb2R1bGUgaXMgbm90
IGxvYWRlZC4NCi0gICAgICAgICogRHVtcCBtZXNzYWdlIHRvIGxldCB0aGUgdXNlciBrbm93Lg0K
LSAgICAgICAgKi8NCi0gICAgICAgaWYgKHN5c2luaXRfcmV0ID09IC1FTk9ERVYpDQorICAgICAg
IHN3aXRjaCAoc3lzaW5pdF9yZXQpIHsNCisgICAgICAgY2FzZSAtRU5PREVWOg0KKyAgICAgICAg
ICAgICAgIC8qDQorICAgICAgICAgICAgICAgICogVGhlIGZpcnN0IFNFQU1DQUxMIGFsc28gZGV0
ZWN0cyB0aGUgVERYIG1vZHVsZSwNCisgICAgICAgICAgICAgICAgKiB0aHVzIGl0IGNhbiBmYWls
IGR1ZSB0byB0aGUgVERYIG1vZHVsZSBpcyBub3QNCisgICAgICAgICAgICAgICAgKiBsb2FkZWQu
ICBEdW1wIG1lc3NhZ2UgdG8gbGV0IHRoZSB1c2VyIGtub3cuDQorICAgICAgICAgICAgICAgICov
DQogICAgICAgICAgICAgICAgcHJfZXJyKCJtb2R1bGUgbm90IGxvYWRlZFxuIik7DQorICAgICAg
ICAgICAgICAgYnJlYWs7DQorICAgICAgIGNhc2UgLUVPUE5PVFNVUFA6DQorICAgICAgICAgICAg
ICAgLyoNCisgICAgICAgICAgICAgICAgKiBTb21lIFREWC1jYXBhYmxlIGRldmVsb3BtZW50IG1h
Y2hpbmVzIG1heSByZXBvcnQNCisgICAgICAgICAgICAgICAgKiB2YWxpZCBURFggS2V5SUQgd2hl
biBURFggaXMgYWN0dWFsbHkgbm90IGVuYWJsZWQNCisgICAgICAgICAgICAgICAgKiBieSB0aGUg
QklPUyAoZS5nLiwgZHVlIHRvIEJJT1MgbWlzY29uZmlndXJhdGlvbikuDQorICAgICAgICAgICAg
ICAgICogTGV0IHRoZSB1c2VyIGtub3cuDQorICAgICAgICAgICAgICAgICovDQorICAgICAgICAg
ICAgICAgcHJfZXJyKCJbQklPUyBidWddOiBURFggaXNuJ3QgZW5hYmxlZC5cbiIpOw0KKyAgICAg
ICAgICAgICAgIGJyZWFrOw0KKyAgICAgICBjYXNlIC1FQUNDRVM6DQorICAgICAgICAgICAgICAg
LyoNCisgICAgICAgICAgICAgICAgKiAtRUFDQ0VTIGhhcHBlbnMgd2hlbiB0aGlzIGlzIGNhbGxl
ZCB3aGVuIENQVSBpcw0KKyAgICAgICAgICAgICAgICAqIG5vdCBpbiBwb3N0LVZNWE9OIHN0YXRl
LiAgSXQncyBrZXJuZWwgaXNzdWUsIHNvDQorICAgICAgICAgICAgICAgICogZG9uJ3QgZHVtcCBl
cnJvciBtZXNzYWdlLg0KKyAgICAgICAgICAgICAgICAqLw0KKyAgICAgICAgICAgICAgIGJyZWFr
Ow0KKyAgICAgICBkZWZhdWx0Og0KKyAgICAgICAgICAgICAgIC8qIEFjdHVhbCBTRUFNQ0FMTCBm
YWlsdXJlLCBtZXNzYWdlIGFscmVhZHkgcHJpbnRlZCAqLw0KKyAgICAgICAgICAgICAgIGJyZWFr
Ow0KKyAgICAgICB9DQogDQogICAgICAgIHN5c2luaXRfZG9uZSA9IHRydWU7DQogb3V0Og0KDQoN
Cg==
