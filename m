Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7412F585
	for <linux-coco@lists.linux.dev>; Wed, 11 Feb 2026 02:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770776369; cv=fail; b=fKesqM0/zNydpTMBsL4JS6NPnY9FfqIIWFlp4LnZYonOmGQIFohpDTl9D5987CqQB3HqoY8VY3MkI3ZdybW+JV5vyzj2SosVnMQWyKRE3WmDitN7mWWlrZ7rIm6iFYDwskM07OieM5AkuV4y6yBiAtPTtqwQF22Mcw+zhVkkYA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770776369; c=relaxed/simple;
	bh=NYQ8I2+ECGU6fEafq5Hwk2AF7GJRBYkmfIcFCAB+E1I=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=Ui9v2JNmVvpSaASKV6bAKy0fmU+jY+WrPoluS3+rgPIqgK+WZesopCR2vujLVvAFkIgBpr1mWP1OEvHDeIZVLj7EgOo1ejkQ8sFV04nhyFpM0Sv2NNkXddeGwq5lZ5OjCJzGFCAnQlx1j8ZKfk+MBgpvMWliRUi3Zdu5upyhMIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU5zKv3R; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU5zKv3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770776368; x=1802312368;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=NYQ8I2+ECGU6fEafq5Hwk2AF7GJRBYkmfIcFCAB+E1I=;
  b=LU5zKv3Rgk04WEc3fNLQIagbMwRLxJJ6+v4Y1YlyIbWvAJTR1+n1E1JZ
   nBs/Tdjpm1psqe9e+aoYWO1LjAxAyN0VpL0idnJ2G4HEq9fXOrnL+xtt1
   THVvD4ypEyxZci9JXwqbCskipLmCO/8xkMphcvvoLjmsYT+ZF0EaOuEsC
   yPFKB/04i5XGtampdVy5MNl0TGoV+vrRRkFt0tVG+QeM9Knz/JcrAz2Sw
   C337Srwtwqe+VZMvXdZ2k+jb5bAHfR7AjZVcla6npCmf3APNkVlv29Q9W
   9eF1keWiGgVfCD6LKCf2m+fmXVgfSblah3rilakPFHrI8pmJJvWDOeTAA
   w==;
X-CSE-ConnectionGUID: T225WVzRRbudR5efoCvOCg==
X-CSE-MsgGUID: PCJRGbboRYujd7y93Iav7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75546229"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75546229"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:19:27 -0800
X-CSE-ConnectionGUID: 48GocgFrSiSdJqlXNiK5rg==
X-CSE-MsgGUID: 2Z7nLF7pR+etlKUs3mtM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242706743"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:19:28 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:19:27 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 18:19:27 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:19:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL+VnjBvm8RvrJ4PvzpZGUZTj/yyMuYp+6LigSWMFig7Z2ieK2j84YhGx4ijL/ryzmiElBXPhUDRAdHcNkMHiJu16yYb79EB8ZM9NU7EKz0RolywG7uJjPez6PIE/2SBH0TtnUwEqMguSY1L+R2oOVgvl7qDsEglEn/7tGtsBn6RQjUHPs6p5pD/kBUK6OFGj4kaX8jZ1bgmeCtVFHgicjzyRAUYgkm7kJIDaZp4Vt0CUKK2OFlCroxm9mkQrfM9cywqNL76BMkWmMj9LlaiMQv590/qQsPiafSpTOTavvNTD2XBZhTsvR9Rmo8qW4rmf1bZ94NmOE/GNl62fg2vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DJXPMM1+VipIvr1tiYM++Q6z8c6bfHQl8alwxWuCOI=;
 b=nZPeMVEDdbZxLLoCHiUb5YSU5+CNXQwvphcN0FZkrQy/W63QdtrOYD02n+Co9EbEwM12fugrRu6izPculxeka8RpUT9QFk8gHYlnwbOLg9/rA1hqkhDU5BFuhodP0YBMImTRI3BIF+HW/BaS5lmrSQxmoiN/w8zW1T+CAWho9BzRnS52VkBUrRbGZI1lNzTsoBA1gSmr3cGjT47/BWycCT8F6mtogtNGJkCpDDlAeh/J5NZ8LVUxTTpOWeGwLYDSkAkipJMhLMxO6nCfcpta8m3z0ROD2OhQJ9a6VYMJN9Dv4JyjjnII/9KC616mPrbobYfDnjpqxcFIQ2akquU4Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB6817.namprd11.prod.outlook.com (2603:10b6:930:63::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:19:24 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:19:24 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 10 Feb 2026 18:19:22 -0800
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>, "Kirill A . Shutemov"
	<kas@kernel.org>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Rick Edgecombe
	<rick.p.edgecombe@intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>
Message-ID: <698be72a53ede_8c321007f@dwillia2-mobl4.notmuch>
In-Reply-To: <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260211001712.1531955-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260211001712.1531955-4-sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 3/3] virt: tdx-guest: Increase Quote buffer size to
 128KB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0057.namprd17.prod.outlook.com
 (2603:10b6:a03:167::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fe0b6a-5048-4800-f602-08de6913f901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjN2d0IyWjZvUlBEelFsTGxDeWIwZ004L1RWcjlaeitDdis0R2N5NzF1K1FQ?=
 =?utf-8?B?NjZFeWdTMitSZWR3QmVCeFRNUEhaTTQ1T1o0ODRicUFydUc0RFhlUm5DOVI1?=
 =?utf-8?B?ZDI3aExhZFBtdDIzMU5EWm01K1hmNjN4ckNubTJCUUVDUy8zWFJGNUVkSzd1?=
 =?utf-8?B?SGI4T2VWVVN1TTFxZnExSnNiK1FDQjRLc292RVFBcUtzZHBNbHN0eDVOa0Vp?=
 =?utf-8?B?T01tcENjY25KZ3A0SytITW5oZjZrSUMyK0ljeU05VGpyWGVnRUFBcmJNaEpK?=
 =?utf-8?B?bUVtT0l2S2MySkRhVy9yQ3J1ZVNicFVJZjJ6Tm5acTRzZE1WZlMrMm0wa1lq?=
 =?utf-8?B?K0ZTMy9lNWZ3bjE0RFU1blJ3cXpEc1N2YTNxTDZGQnppeExucGpscFR4eE9J?=
 =?utf-8?B?UFEydDBCOC83Ky9kY3NXVzFsMVFPdUFoUDNXbzB2Q3NITDJXU01Mak5qVE5D?=
 =?utf-8?B?MWxrK2xkVFhwWUtDS2F2NEp3M3g5blc4Yjc0SW43NXQ5bUFUOThSL0tsMWtu?=
 =?utf-8?B?MmRhSDIrVEV5VTh0T2tTQ1RZc0J1S3k3SERBd01XdGh0TlFIckZFQ2VLU3A3?=
 =?utf-8?B?U09ySi95S2VRWkFZdXBpLzZ1aVE3OXcvTnNnK3lZbjRTODFvdmdDS1l4NWRN?=
 =?utf-8?B?ajhTL05xL3VkcWxSRVVnU2ZRNFBTdGM3SitlTHI0ZW15cyswMzdTY1FEM0tw?=
 =?utf-8?B?TC8rMjdOcHl5OGJrTjRTRGIvZ1BPN2Y0VFhIY2RwUTBFSHNPVVhkcC9qN2dv?=
 =?utf-8?B?NDdiN213OTRlK0I1TDhONjB4SXZsWnJoT1JkTjdncm03c3h4S1hjYVFqQ25o?=
 =?utf-8?B?N25jRGhhcUJ0Z0tOMXRWM1FXbUlzemJUaDhRVXlBTjlENURnQzRFejBtaFdL?=
 =?utf-8?B?SlR4a0ZxcGJwcThTZXVNbFdZNHBsU1A2QW5QWTliN096aE1SaSsxeDgrN0Zk?=
 =?utf-8?B?VXhPQTh1R1JONVVPQjlWb0Q5Qnp3TWdNMzJXYXVKNDYwb2g3bWRtZlZ5RG83?=
 =?utf-8?B?U0dRZXExeFZWSnhxd0FTayt0RklrTWlDenVLTUJrVXNzQ25DQjMyOUR6YXE3?=
 =?utf-8?B?bTZFZExjalNMMXROOEw0ZDR6SGVUNHdiTEp3OEx0ZVc5aTRidi9mY0FkUHRk?=
 =?utf-8?B?VFVnMEZtSEtmVTZWQVpiVFNHQ29Xbm95Tk9tV05tL0JyTWNUMEtRTkpKY0Fs?=
 =?utf-8?B?THFSRFZGYXp3YTNvOExaamljMXovU05aY0xNS2pXbXFVdlR5YytoeUNPa0Na?=
 =?utf-8?B?OVZDZFExaG9UTWliSDAzcHloU2hZYlVsTjdiU1VqU0tLREZEY21ldVhqZFJO?=
 =?utf-8?B?U2ZaOWtlWUVIRWxHRkF5QzhBVXY5UXhmT2dMRnppbXJuRFlURjVvUm5NV29I?=
 =?utf-8?B?ZDRSV0dqUGpaM1l0aWcwTVRJS2xVYjNYelZ4WjU3TnRvUGF0Z3hqVWdZVSth?=
 =?utf-8?B?dVRFKy9QWW9od2l3SWF1NHJ0ZFhtV29WWVROVWkvdVNZeE9saGZqbXNNTUd1?=
 =?utf-8?B?VC96OVFUZEdIYUQ5RmNKUjRXaG1haWovbmY3bHU4ekgxRmJoV0JaejFwak0w?=
 =?utf-8?B?Um1qWUkyY3RSL3RpZ3VnMDhGc2FNRjBoTCt5cklUTHg0T1RlTlZtRDAyS1VR?=
 =?utf-8?B?MjgxMFVuRTFuMUFLb3NzRUFzWjBWblZubkNGZm1Va1QxbDAzc2tmM2dzQUhm?=
 =?utf-8?B?bGRUNTBRVmxZTEhSM3FNVHlybFZFU0hUSHVPNFAxSUN5bGo3dmNOOExCMlBM?=
 =?utf-8?B?U0tUeEhoV1NRd0ltME50cTZMd0t1emgvUW1palhCeVFobkpHWTUvVkYzVlhC?=
 =?utf-8?B?bWFaWTZYcHBMb3NVZENaa3BnTTgvaUVuVlhGRVpWRE1lRjhuTXF6VWJJR2dC?=
 =?utf-8?B?OTV1MmpZWUt2dWFFZ0pnUUp3aW1pRUFqa2J2RXIzcXFzOEhId3U0Z0daVU1m?=
 =?utf-8?B?VDdWRXphajE1MjBlNkdqQ2tYVXlhdm9iMTVjSmQ1djMrQ3lMS0F4NFF0VFpR?=
 =?utf-8?B?Ky9EL2RHUjU4M2VyWjVsd3AyUHI5T05oSXpRVTdnNTV6N0RzNnk2TjVCS1c1?=
 =?utf-8?B?UGFmdjYyczE4Tm45MEs3UDA0NGdrbVVmc1gwaUxWaTdCT2FLSkhZZHh2TEJy?=
 =?utf-8?Q?sqh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amwvVE9aQ3R2TExSc1N0aVIwSytvQzBZeHNoVEdCYVBJK3Z2bTEvQ21TcW9w?=
 =?utf-8?B?TThlU29aZ29Zem40R1ptOGlodzExblAwMDFZa3VHMVRaYUM0cnY4L3dtS0cw?=
 =?utf-8?B?dHM2ckFHWXMyeWFMRmZCL3YvbmtLVDduT2NrS2diNEpJMUcwYXN2eUl3a1Ja?=
 =?utf-8?B?K3NwRE9vZUZqbHllR24xZWU2eGEzTHN0M251aHVjOGYwcStrRG9ncEF0eUc5?=
 =?utf-8?B?VDlpMkt4dVpPeS9HVnBHam85TjljaitTR3E0OTM5RXBidHViQlJldVhGU0oz?=
 =?utf-8?B?YzVVWExTcFBTU0hxVEttV1pPclJncU5pa0VHdklUdlZEVmo1YVpUS21GSzRi?=
 =?utf-8?B?dElibjYvQzBoMVJyOGREMEFLTVRadzJMR3U4aFNHQlBaa3EyazNRdGNYWjB6?=
 =?utf-8?B?ZW0xSjRNSzVwQXNmQkRpRktEVHhGVldmQW95VDlkMGNWM3E4c21LWE94RDZR?=
 =?utf-8?B?L2xiMlFKYjJyNFpsZEZFVEdTd1dXTlJKam9UR0NGY1JaNENRZWZMc1BzWnRV?=
 =?utf-8?B?Q1NVeHpuRUpaUC96SDBjN0VpL3g3WjVla1hHbnVqV2JkZTVnSEtLSUdBTnR5?=
 =?utf-8?B?a210ZTFKSXNGaVhEdUlVOTluTFM4RmFnaHpjVXBDcVB5ZTIrdys2MGVLOGsr?=
 =?utf-8?B?aFlRSzhlcmZVNmsxUlRUMTdJWFV6a29saHViRDRIMDkxM3ZZS0QxU3pxenly?=
 =?utf-8?B?Yk9VWjRpK3R1ZTYzaDZscG9jZkpkY01wNy9HVW1MbkdHK1U2T0NGUDV0YmdP?=
 =?utf-8?B?V3c3dnU4VDV5Y1BIKzZsR05zYVpHb1dUdXdWYWJLbE54RGdnWXljTXdISk1G?=
 =?utf-8?B?ZCs1R0dCQmtnYndOTGFTOURnSHdjUWIzSVBKdzFCd05nSEN3WmZFbDB2R29Z?=
 =?utf-8?B?cC9RdjVac1VTQkpUUHVBWWY4cFI2dWNaS2xlMmtEK2VLUkxhRnhtM1dwNmp5?=
 =?utf-8?B?djZMb05qd2kyR29DSFF3NXVpQ1VHaXgzaEYwclgzWnYxYjlZaXNFOE5aTG1E?=
 =?utf-8?B?dVdxc296M3YyMmIvcmpVTjQ0a1FhTDBSYmdIZGxKOGR3VHdYY2kzbVQzVkFu?=
 =?utf-8?B?T2NmRTZUQWZabWxURGpjcmoyTlR3TmkzdnNpcnVxcjExVWJEYUlwd216SXZq?=
 =?utf-8?B?VWxxZDF2K2VrcTQ4MzBwTTBHaG42WHB0NU5nNVB6Q25vR0F4Z0FCcjFpb1Bi?=
 =?utf-8?B?elAxempyQm44MUhXcmFBRGYzRUxoTXd3bitmWUFhRGFOVkV5SFVUeEN0K2E2?=
 =?utf-8?B?MWg0TEMyd0k1T2pYRFpPTGQxSFFEenQzekFmcmtsMHl3TVZKc1FSakxUUkFF?=
 =?utf-8?B?Y1hHc3RqWlRCZnpEL3BUWTZWL1VSUjZ6cVJXNVZNa0RHZm9xaVdqTURFZFFz?=
 =?utf-8?B?cERnUlVXcmcvQWhpemxOMzNqS2VUUCtMbW5RZnlhdHlRY2huRkVCcGljSjBi?=
 =?utf-8?B?SHRvSFpTak1GQnJMMjgraFpRdUdpNEVQUTBhVFJyVTBoQTMyVW14R1BkSWFr?=
 =?utf-8?B?K2JDR0Ywa2lPMzJ3Uy8zcUl6QjhsZjIxcnF3M05yaUVLSlhZVGs2ODRNclZF?=
 =?utf-8?B?WjdNSTJwU2JScG00TFlJaHdlQXZqWStvUkN0c0JJZzg2UTV0QzVkL2pYSUdQ?=
 =?utf-8?B?K3pGYUNjcmY0L3k3a0wxVmEzQVN4elhWTGZJN2tIcFhjOGt4ekhFUHhUVHBU?=
 =?utf-8?B?VnVEZC9WSHlkV2JrYTdBNFRhV3pvR3VCTGE1Mm0zUnZWNVNJSGsraXUxYVNK?=
 =?utf-8?B?UVdiUG11SzBpcytmblNvcEhqUzdYcVpia01VaFhwZmVxTkhnWitqQU9EclNX?=
 =?utf-8?B?NFVyc3p6dldwdEFiZ01oRXdOd0hQRytwUVhVdHVTM3RoS1pGdjJ0YTA5ZkJZ?=
 =?utf-8?B?UXcvQ0U0b2pJb09nQ0owTnhqemwvOTdwTDhkZ3VoVDZuRGN2RzFCSkRtR0dR?=
 =?utf-8?B?aUxCWTE4aHRUMllnSzYzclE3TjBEdjlEVGVQTVdiQ2pmN0c1bVpjVFJrbjNJ?=
 =?utf-8?B?VFNWSU5RbWJ5TU1nNU5GcVpGT3ErRys5TUo0NDBmeStKdGI5U0tWTURsNllK?=
 =?utf-8?B?Wk9rRnlFY2VtbE85Y1JvVUd5Y3BYbjV4M2l2a0YyeEd6MVdkZHhlYWFvcHh0?=
 =?utf-8?B?L0I1SUhvd01UeTBSSlNsRUdhOW9wRFZXM1JXSGg5aVB0TFRZeU4vT3BkY0ha?=
 =?utf-8?B?Umw3czZmcTNlTG00V3lCWUlOazJoZU1HRUl4VmlLdU9WVUU1R2JFS1NHWmRj?=
 =?utf-8?B?VDNjWm52MEJHSVZuN2ZCejBKMDMwYisyTUIrVi9XUlMzMVRZVzF3MWxYTUlm?=
 =?utf-8?B?ZlBsdmtmVEhjUUZHbDdWbTJQRTF0UGpyWllyNnlPN0FQM2tWU1hwVGk4Q2E3?=
 =?utf-8?Q?VYXDmQX5LVXNb/vw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fe0b6a-5048-4800-f602-08de6913f901
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:19:23.8797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGKtWXNnf2EDlmNK4PxrO/GIw02FOvv7kBskI6A6OQw9e992itnb2Hlv5ZXekEAt42YO/Mruklh43YCU67KQl8L1rPEvfjAEDO92QlrvMg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6817
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> Intel platforms are transitioning from traditional SGX-based
> attestation toward DICE-based attestation as part of a broader move
> toward open and standardized attestation models. DICE enables layered
> and extensible attestation, where evidence is accumulated across
> multiple boot stages.
> 
> With SGX-based attestation, Quote sizes are typically under 8KB, as the
> payload consists primarily of Quote data and a small certificate bundle.
> Existing TDX guest code sizes the Quote buffer accordingly.
> 
> DICE-based attestation produces significantly larger Quotes due to the
> inclusion of evidence (certificate chains) from multiple boot layers.
> The cumulative Quote size can reach approximately 100KB.
> 
> Increase GET_QUOTE_BUF_SIZE to 128KB to ensure sufficient buffer
> capacity for DICE-based Quote payloads.
> 
> Reviewed-by: Fang Peter <peter.fang@intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  Documentation/ABI/testing/configfs-tsm-report | 4 ++++
>  drivers/virt/coco/tdx-guest/tdx-guest.c       | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-tsm-report b/Documentation/ABI/testing/configfs-tsm-report
> index ca3352cfd2f1..7a6a5045a7d5 100644
> --- a/Documentation/ABI/testing/configfs-tsm-report
> +++ b/Documentation/ABI/testing/configfs-tsm-report
> @@ -73,6 +73,10 @@ Description:
>  		Library Revision 0.8 Appendix 4,5
>  		https://download.01.org/intel-sgx/latest/dcap-latest/linux/docs/Intel_TDX_DCAP_Quoting_Library_API.pdf
>  
> +		Intel TDX platforms with DICE-based attestation use CBOR Web Token
> +		(CWT) format for the Quote payload. This is indicated by the Quote
> +		size exceeding 8KB.

Looks ok, please follow up with a link to the full format specification
when it is published.

I will change this subject to:

"configfs-tsm-report: tdx_guest: Increase Quote buffer size to 128KB"
