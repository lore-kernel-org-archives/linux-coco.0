Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974356472
	for <linux-coco@lists.linux.dev>; Sat, 14 Mar 2026 22:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773525874; cv=fail; b=CHphoUpPD/1qZ8NU8onW5bRl/29782uT4fjy0e/EVqX7YBlkaUuyc5WTRWi7xoz4JuGihQ8YwjdAhticgpLecwJrGTJ8jeFybz7C8bbpj8vr49lfXWuaUKPR4cuYU7LgJmGxVKFbGdaZPLoT1g4bv0Olprns+TtvTpE6LzOeyUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773525874; c=relaxed/simple;
	bh=gCN7ao9e7MjL2FH3Ir9LTZrfrrUxAPA4opQsWAaE2Dw=;
	h=From:Date:To:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=JWOAKARf4R3WpcwFiIn07GWOkWvWbA2L9S6vXQmc5RgEP9YRze8bGLMRt+jOoZz7paP9kJQQ+aw/mJEr0KOtHyBlGifbPfLljkpoq5JMJWoYqTfY/sxhjwNcWQBQDQBtr7ejleHYCyJatKgTosSK7zOAyAC9pCAOUSsJIHcJ83c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+c19XfG; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+c19XfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773525872; x=1805061872;
  h=from:date:to:message-id:in-reply-to:references:subject:
   content-transfer-encoding:mime-version;
  bh=gCN7ao9e7MjL2FH3Ir9LTZrfrrUxAPA4opQsWAaE2Dw=;
  b=m+c19XfGIusTlMnseg6t/97ITKT3r1np1CEvVuDn97p6/vnawxEtNc/F
   mrzZ7Hg6ZKEp1PpPljWUnf+uqK2b8jCm9xFb/GW2AJE2MrCz+3WzlfxxA
   nx7UuGmkFUzbnSV+oDAZKuza4vaS/lEdSy70dd4CCJSQwxUFZm5IsukuF
   foK+wGblbrtzLhSK1LAdw553wd+Bb05aWyC5rm+8nVbZ6xHOCbCALLPZl
   TfjVdq6BPitNyiwBcr2F/h7m77Rteiu6XCYY3+gUnCpSjuxzi3bLPPwvQ
   JIj/IWaJ1voiC0OnnDyl9WMXCz2CZGzh3uJ2ksjYpnAdKGASTNo9cpNJv
   g==;
X-CSE-ConnectionGUID: mi0EX4bZTau4fQ8da9qRhg==
X-CSE-MsgGUID: o4S/FrkuRUWg09Z8l8OmkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74477571"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74477571"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 15:04:31 -0700
X-CSE-ConnectionGUID: RvForBoXRl+BFKnu+X7h+Q==
X-CSE-MsgGUID: 3W7qfwMLRF2aN3EKkVpFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="223823454"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 15:04:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 15:04:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 14 Mar 2026 15:04:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 14 Mar 2026 15:04:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7IPk7wTa9ImHgdzS16+eUNQN4vyaOptr29jkVKjmjWlosTyxIXYEVFx9TRPewL2/h1+ez+f1qfw25OYiv8AS+b/b/hVjMdlKq7HN9R+BcHYmDZjbRKUsOG8vhmrZ4lndFZJ6e+td/plUg0G05rmN9Kj2rQOhLmEvpYC1o6ZM5rhGXMWMg3uY7HVHUAJ2bPY2R6EWYNhpvlOUbkuX2Dv9EG7N5AX/H0zSomFyJyAq/sPovpd/p/2W69aBtFJ3pRky/JRAvytPH01kVf4BEDmVw/6MczUvz4waFqZAfqdoHsZEVzYLMWcGXmANOGQzrUR0DuhOxSj+8b+tnYRQCZfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDTBf8yhgXxFuiPw874AU686BVY8wiey6SM+hcQCTxk=;
 b=gsthhATE+Lk4fNZEeHZhat80Fdg9n1OiTLpEQMkm4Zs2IpcFO+lC5XBolm1P4WKQx7IycnVlakxb7psV4I1GZpB75pHJHxCXQYnE0cYccz7pkqCBeQkP0MYbIE/mWwRQKDbsy7ysy87IonrYi/9lna50Nhm84qJbqidS88NpImjzvduj1+xOoJ3Ozw+0aOthEJEi+VvYGJ3HY2xGVtiyeL7DbB2YjKZHffsRwrfofa18eWh1/ua0wduLcyE5ckhFVob5a/Y/3sBshHuZfyr0kuOPOB0LUXi+k1rZUj8D1TvOE3131JFkONogzeTfi/fdjU0KETlkUovXWeDz9UfMpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Sat, 14 Mar
 2026 22:04:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%3]) with mapi id 15.20.9723.008; Sat, 14 Mar 2026
 22:04:04 +0000
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 14 Mar 2026 15:04:02 -0700
To: Eric Biggers <ebiggers@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
Message-ID: <69b5db52e0aac_b2b6100b8@dwillia2-mobl4.notmuch>
In-Reply-To: <20260314205533.GA45660@quark>
References: <20251204055512.494013-1-ebiggers@kernel.org>
 <20260109022620.GB2790@sol>
 <20260314205533.GA45660@quark>
Subject: Re: [PATCH] coco/guest: Remove unneeded selection of CRYPTO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA2PR11MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f6d9d4-9de2-4d98-847c-08de82159b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xMudM/+jSY0xVtJPaELd+fTIsO7hb4lTp68dPzLzZ+C4Oxkz6zJy4hBm4a9nZzkpRjYb7i3q/R1qPcuesJbRF0Vg15d1acF5OuPOfqJIvwMJepe+dAj/rPFBquEQx7u1B6yKU1vSM6YOWbsgzr1J+A6/PwSRnslEGNg3+FWlt/qu30hhNply5ZsrHBryvT+nyqPAmMkUgFekqDPRWw2da/42krCR2VYOvghtGefLtsu6cNG6jZ2OHO2wwP8mrGXFa5NBGL38jJ2a3d7gENRBeMCmx/mQ6Y1xK0Bo2BpUVZoA1R1NM1N3TuRIhj/AXDg/0PosaUd24700+Bvfj8esu4ziyphwWckCB6+LSELjoVdVZBn2oXtyFevUIhIp6BCvQW8iYkgo1ttTPsgNylQc+jKiY4cRAQ6aPOVvMNCTrgWSc+36Ff1T92f77Fpxi2RX9AYlrQspra5XSnUB36cfd0lm5Z3Q2wyRoCCwZkVCBgW+CEMYDUuRy2pz1Nap9/yLBr7XiDrjDVhc3B9ViHGpJSI1uKHxGSarPa61aXQSVUgw6n+yDb6DcIoTpqFJEALwZEjO3MzGrv6/SxhzvgDWK921tUnjajPZU2md25QmskMYtEVUZ5qBr7wlZVI1CaTsMBOIgGEhCUxHuA9Qa1yEIerorh+LENt4PjdmctV9x5/HxcM7k9OuVR3iRHABVgqLkO5y0O0kJw6OrEw+ifgH73tUxSk4SdyNDK3D+4+lIXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRMTVFnVmMxZHB3ekZBQ0luc1dpRWd6bGVLdXkycXZPVS9FbjBKOHl6YUJ0?=
 =?utf-8?B?NUtzcFZGMmY0SlpFYWdXb0VCZ3dMMUZjR2JLQmE4bEJ0ZnR4VEtKMGloQTho?=
 =?utf-8?B?dDROOThkNDJXVmtzZnFNajNPUlpFTU5sM290ZFJYNWhOemhkeGZwWXZpTHVv?=
 =?utf-8?B?SmNlWSs4N25jbHF4R21yaHcwd2Rsb2ptUFd6V1dNbzZ6NVM1ODNPYUpLbDly?=
 =?utf-8?B?MDNTdDdMMlhqbWN2UFNwZHJ5amgzTnNIa08vNFdtZmE2MWttUTlxT080V3JP?=
 =?utf-8?B?TkN1c3VtcldGaWFPN0ZkVHB0Q2hCay9aOThoNnZXbU4yc3hQNk82cE9zU3pp?=
 =?utf-8?B?Ui8zdkJpN2dFcGlUeDRlUGwvU0lienBKcVcxM2lDK2RFbUNsb0ZHR0trdDBF?=
 =?utf-8?B?YjQwRmhWUmNXRFcxR0RTNHBQck45Yy81S1pWa3M1WUpMZmZTSFBtSlBuNHIw?=
 =?utf-8?B?NXMvUmx6TEVPaGtCWkZ3UkRRL1A5OTE3dHR2djl5Vkd1V1F2bHJoTWZhamxz?=
 =?utf-8?B?eXlpQlF6dTMwRHFoYk9SWlQ2dUxRNEZMN0JKNXV4aVg2ekN3R1pDSk91bkkx?=
 =?utf-8?B?TWdQOWxFL3JhekxtVGIvQW5Od2xqdllZMVh5T2Vwb3Y0VkFQK1haVndYVk53?=
 =?utf-8?B?V0R6V1J4MkEveTAvTSsrVGtKckluWUdTa0NpYkY0SkFRRDdDWW11Tmg2UUs1?=
 =?utf-8?B?dUJNd21mOFZsazBrV2pBZG9GTGlyTXA5ZUJxZmJVNnRnLzUzVkQ5dGJuaDJZ?=
 =?utf-8?B?SnNQUWxqRXJBQWJ1ZEpXeU9meXBpWmxsM05ZVWpjbUR3cU5tSkZyRmVDeC83?=
 =?utf-8?B?ZzluaXNseDcraUhkZFFzd3oyVGJHajNTR3R1V1hFRU5YS3c5M1pIdytTbmpG?=
 =?utf-8?B?S0l4OXErMEtEeC9HVVVDZWsxRkJMdDR4TmNXcWZaT1Q3N29hMStxTnFLcGM1?=
 =?utf-8?B?d25QSlI4N2JnR29FQjB1Q21oSXhwV2RLdWhzdm9JNGJlZ3Jjb2lqaG5Eck9j?=
 =?utf-8?B?RFU2ejc4dW1EUHExeERhUGpVeUEzeUpydVk4eHJ0YVlPTVFNT2RWZlBQOFRJ?=
 =?utf-8?B?QzVpeHpoT043QmZ6bUgrZlZHQ3VvQkhrRXdDUnl4dlQxVVFYUzZhaXVZZXZ0?=
 =?utf-8?B?UWZLWWJ3TXA4NVBKTFYvWlB1WjZvTUk3SG9nb21yTUlGSG1VTHgzOENoMUFP?=
 =?utf-8?B?ejlER1RKYmpnMlI4VUs5cml0ZmVsamZVOG5ZZy82T2pIR2o2SnM5Rk56dWY1?=
 =?utf-8?B?Q01jd3hhUWdJUXE2V0sxakNSSGhyVnRXcnIwQTVEVExmRjRPRDJ6K0M4U1pu?=
 =?utf-8?B?bDQvby9RM1krd0pYZUI5a3dTc3lXaWJTTnV3YU5lc3YrZ3U3ZmYvVHU1OVZR?=
 =?utf-8?B?TXNIU3F6eFVCNzdUY0RDNk1PZXJNZlJxdjJpTlV2czBWc1M4NXBXbTRsNTZK?=
 =?utf-8?B?dUNmS0h5Y0RocUZ4bFFQTk5nWm1xU1YydDVqSk9wTXlnRjBvMGtmMHhhSDdz?=
 =?utf-8?B?MjFvUTl2S1loZDhwL3A3a3M5YTVuTk4xQU5Nd3lwWkVuRi9nTlE4Q3NOdlVC?=
 =?utf-8?B?ZFppeHEvUWsvM0RyUFZTbkxqR29EUUFaVDh2NWRldS9aQ3Y0c1loTzlyMEpp?=
 =?utf-8?B?QStQc0JnanZoaXJCVU1CM25FZm9USURSM2ErZVN1Nmxkc1dpOXUvd2d1VEdM?=
 =?utf-8?B?WnRxQy9qMElDSWUweXMrVzNTa0dYZlc4Tmptd2wyaElreXpURFVHaDRTZXgr?=
 =?utf-8?B?Uzk1Q2h2ckdSZHhzTmJlZE9QWHdBQXJaeVRlSnd4M3phbFFqVXNUUG9tYktN?=
 =?utf-8?B?YVYxb0ZUUFNmNHo5SkJ2VFRPaGRUSkNCQ1VmeHBlR0xCeVBKNUtoYTVYZHJz?=
 =?utf-8?B?TmVmem9kdVJWQ1BUVjRuZ0N4NXhuRUN2bzBzNExtcWxYTGJrdzlNS3dPQkpo?=
 =?utf-8?B?OGsxbGlYOXZqakRKSVAxWHhyYTJPYlVaQU9qaHloTWxmRzJiRUgvdG11R25W?=
 =?utf-8?B?bUZMb2V2T0FuK2ZoZzV0MzhoR0Fkc0VHUHBNOCsybGlpK0taV0g0VHNwUWc2?=
 =?utf-8?B?N1FBVG8waEEwZm4xbTRPUHV2V3BjNGFPOTJqNkNzY2dvYlpKTmx2SHFWTkVp?=
 =?utf-8?B?SGRoL0xseUpITHRUNjlmaWtsUm5kOGxYTm1NaDh1bitlV0ZmQ0RDQkVISERC?=
 =?utf-8?B?YUJQcXhvSC9IcEZWNzNRK0gzWk4yT3RnSkJtVlU4aVhxOEdsekRsVXBGaDhM?=
 =?utf-8?B?VE1lRXpIb0s2WEdzTURRdllPMFROcXVTZytaeGJXb3ZLc2NBcVphd0h5bTVa?=
 =?utf-8?B?bzlpbzN6TndaYU5GK01Rbm9QYVRxbGgzclI1VTkyOHJrdUJzZ3IrTUQ2a3pX?=
 =?utf-8?Q?xvsjq7rcQGWXxEqs=3D?=
X-Exchange-RoutingPolicyChecked: YbdI2+G1gX6yXplfLkhRLbKlUbXZ8tEiKCzXC7Pl5mPLb65u26alCwcFG5kgxiHUXhjjARq7fss+kF+KWC0Y2D9YcRKkVRgFWgNiXPukAlpcwEDoiySjfFf74wthZhfbMXHfiZg93oBpc8e2/NjvbuZa8Fk/st8Kv+uMrcDZ4aBGkbHXZgJETjDgA23LLZeIpINQ/e2N4AGxn0A00JPvazQrgMv+EBji+8HWnVfh3cqFj14lmRm7DLtx/7z+Dx9vldwy4HWeyOZFvQayS3a+JpCh5T2OC8dRuClIPoGWMpxjlemxspQYwR/SVWgtmzTdFfhfH1e4e1NarcnXsqdXZw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f6d9d4-9de2-4d98-847c-08de82159b64
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 22:04:04.8294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rctITvFiJyKhSntJgc4Q507t3W+w9mV2gSV16o4+Brw5naQIGvE5zZ1uOZMgloYGYt/Bm1PgZ7wCnH2NiqZe1wjdCUSojOEoYFvyNogRWEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4985
X-OriginatorOrg: intel.com

Eric Biggers wrote:
> On Thu, Jan 08, 2026 at 06:26:22PM -0800, Eric Biggers wrote:
> > On Wed, Dec 03, 2025 at 09:55:12PM -0800, Eric Biggers wrote:
> > > All that's needed here is CRYPTO_HASH_INFO.  It used to be the case that
> > > CRYPTO_HASH_INFO was visible only when CRYPTO, but that was fixed by
> > > commit aacb37f597d0 ("lib/crypto: hash_info: Move hash_info.c into
> > > lib/crypto/").  Now CRYPTO_HASH_INFO can be selected directly.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > > ---
> > >  drivers/virt/coco/guest/Kconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/virt/coco/guest/Kconfig b/drivers/virt/coco/guest/Kconfig
> > > index 3d5e1d05bf34..da570dc4bd48 100644
> > > --- a/drivers/virt/coco/guest/Kconfig
> > > +++ b/drivers/virt/coco/guest/Kconfig
> > > @@ -11,7 +11,6 @@ config TSM_REPORTS
> > >  	tristate
> > >  
> > >  config TSM_MEASUREMENTS
> > >  	select TSM_GUEST
> > >  	select CRYPTO_HASH_INFO
> > > -	select CRYPTO
> > >  	bool
> > > 
> > 
> > Any interest in applying this patch?
> 
> Ping.
> 
> If there continues to be no response, I'll take this patch via
> libcrypto-next.

Apologies, not sure how I missed this.

Acked-by: Dan Williams <dan.j.williams@intel.com>

...and yes, fine for this to go through libcrypto-next.
