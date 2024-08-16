Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6D6F2F8
	for <linux-coco@lists.linux.dev>; Fri, 16 Aug 2024 03:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723779489; cv=fail; b=LoK0rEvxi6tioONSvu5Nz0nFOaN6i7OLXAwT0LhEAxiv8IMuoSTJv3vOGso5Wy7UQEA6UBAyII19Qnv4TbfmCtn/GeiqwjcMRdbq9yYfukkdQc+/T9MMwPmvnAw+YUMBthrnNrg212hWDjaKG/rPJFOf4GJRt23w9uyAACiiz9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723779489; c=relaxed/simple;
	bh=H5NI44ncTVrVy7KUlAS7ihRvZ9vDO1pSiM1V1tabXNw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dagKzSWunMIsoDrkG3a4EoryJZAqVMqJ+4scY4mzhzXS4z3fbeFXXFf+329eIoeRm/dcE4h8EfMjiZd0oMlHqVLLka3zbxBUyKbvmNKGdDyD23NttVCFqXrTTXQarYXGOd5NzG0qmOP65SL9IFHk1qAY42D4NECyu99ioCPjcpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hudixus+; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hudixus+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723779487; x=1755315487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H5NI44ncTVrVy7KUlAS7ihRvZ9vDO1pSiM1V1tabXNw=;
  b=hudixus+h1X+86vUyXdcBcXbO0tB4N7JCHS+3GBgeWicuuj5ewJAdITX
   +lyP567T523qu9e87VQlIp/Y9eQR9V44H/WVWJMbQVVcO5cuQzNVTqjdf
   O1xT/5A8IThUs7oKweoum1l4TSzKK+AhAl35TSU/mIKZHRerDmLgcX0Sv
   5Tv1lJErcQBuokmsJ7gy71sjjLvWtseYe7LnypH72Ird8+s7zSiljChW5
   s4aZB+BZVFbvXao2Q935cWY+FpvEJNoG9wT7BipejI/EeBhwXIUMQwk1E
   dWbsFFj85FjDwjV4GCSOz80XUm8LDCFw6SF7UkjrT4ueuAXuZs4m4uRo7
   Q==;
X-CSE-ConnectionGUID: FHDjb7E6S7eiZbqInlmZTw==
X-CSE-MsgGUID: y3Mzu5WZRI+NHm/ogDc0HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32704878"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="32704878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 20:38:07 -0700
X-CSE-ConnectionGUID: mSXT37fIRRm6wOgwdKVc0A==
X-CSE-MsgGUID: Bdf4+2TOR9ydJuBFtY7VRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="59391828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Aug 2024 20:38:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 20:38:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 20:38:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 20:38:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 20:38:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWEQA9wTJ3+cn1yFaiA4UE0AztJnBqPFp+2K4HelTXMMqWLrTC7M8Xoa+WYsXi7TYvo4hwN8jxYLwMVoFJxqh+p9fcBCAByGPkaoZfdPgxZuQMF+9t6vyym+4YpI99eGleX+EL1m0D5We31o1vdEB5t4qImqWvgjyDGILRqTtWTwP1njMAnm7FaEOrtOgyKaVRpdiQbwAKLUCUaXuYAKqOlKaKFvm8wbxDeRAPuQ4jM2k1x8krlKepnUxJFS15sIxs5bZFwGn6wEahxsQxq38hbkrHKrDnNtLE6uJcQJpbdEkjjWa3DFT7bUtAvSL0YJOxJqRmbYdj0DlClEw4GHKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5NI44ncTVrVy7KUlAS7ihRvZ9vDO1pSiM1V1tabXNw=;
 b=Hw17u+7ruowoHl6Y+s6e/ZSDIBg+6WaeFr1Uet1aBupb3QWGlNyivG/5tDjt241CBC4cFl3m5WdwbzdrAgVB6/FiFsXYOs7ISl7qvut60kid4Fwdw/tATDuT1WXCNnRdnkzW8pKjkLIrw3Z9ax3aYkegzZTvbZYLGLwSNUtHFTo20CB3ldwOYwAPVJqUqsNj4vMQbAqX1Ga9I0txYjx+SnZQYKiO0QkrVnYilcawzrkT2XoWBtvyf2fgpZxyvPl/ms9gYT/IqispNbqgEeZmvyuXPn3OtPsD4tnKrX8RFDdhlbvVrU9b0BQYsgBY7VwVsiU24lHWDNySwkA5y93wgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 03:38:02 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 03:38:02 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>, James Bottomley
	<James.Bottomley@HansenPartnership.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, "dionnaglaze@google.com" <dionnaglaze@google.com>
CC: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "jroedel@suse.com"
	<jroedel@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"jpiotrowski@linux.microsoft.com" <jpiotrowski@linux.microsoft.com>, "Dong,
 Eddie" <eddie.dong@intel.com>, "Perez, Ronald" <ronald.perez@intel.com>,
	"Lange, Jon" <jlange@microsoft.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Johnson, Simon P" <simon.p.johnson@intel.com>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDwgAEez4CAAKutAIAABwuAgAOj6gCAAFszgIABHNoAgAB9xYCAAAkjgIABP8+AgAAOvQCAAD5zgIANU5Fg
Date: Fri, 16 Aug 2024 03:38:02 +0000
Message-ID: <MW4PR11MB5872C42AA225F66AC0F845928C812@MW4PR11MB5872.namprd11.prod.outlook.com>
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
	 <DM8PR11MB5750F26CA8292B1053722E10E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
 <f3de5c989f718ba999d4c3b00ffc6a06a1898c6c.camel@HansenPartnership.com>
 <DM8PR11MB575007C975ABEFED36C8D027E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB575007C975ABEFED36C8D027E7B82@DM8PR11MB5750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|MW4PR11MB6839:EE_
x-ms-office365-filtering-correlation-id: fda051a9-5e6c-401f-7f72-08dcbda4d4bc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWl0OGxxSzJIZjR6eEFGUFM1NlFFelkyelIwZ3hPcE93YmRKdlg2eFNwaTUr?=
 =?utf-8?B?R0ZUTk5EcGU1bVRwajk5dnc2YTVqMnYvZkJkY25sODI2T2szMVRwbnVIV2NF?=
 =?utf-8?B?TGN5R1RoSVJoQis1RDhodmRBVGMyWWNLaCt4ZXZhaXBjcm9KbXRWMDk4eWFh?=
 =?utf-8?B?WjhFa3VlWjVDcjc1bkZZRVNYdFVPM2RWK0pwZDI5eDVMNVNlZ1MvTmtyNndP?=
 =?utf-8?B?K3pRVDJML2RDdTRvWStmYjArck42M3poN0dFTTBZcDdNQnFLYVRncWlyUGY0?=
 =?utf-8?B?UnVmY1BMYy9kR3VHakJzUEZ5MTA4L3VISUJ1b2JGUkhqdEU4bW9FcDhBTVBC?=
 =?utf-8?B?ODRKYXlRaUd6ZU1vNUJZNFpCRCtBRkVqcXBEclJ6c0tJbjVMKzhueXR0cWIr?=
 =?utf-8?B?b09tTGpBRXRkay9WcXY4UkdnT1BLREI0QXRGTUJZWG9QNEkxYVk0S1Iramxi?=
 =?utf-8?B?dGptSkpmKzEvL2VnSzJzUkZPaVpXQXFhWkZEUDZ5YTU2b28yd0dRRHNXbVRQ?=
 =?utf-8?B?dVZ4UDlwa0FLQ0kwdlRFWGdUbXFhdkxteGlxS21XL090bTNjVnJOK1hmUytM?=
 =?utf-8?B?WWhHSXNSck9qT2FHYTl4MFJnS3J4S0VONUtDQjdxd05NYjZmQ1QyNmNocXRN?=
 =?utf-8?B?QUJ0aWVkYTRhV2UxY1lpWFhsNktMVzBrbGVqLzdGb3JrWGxsV21ReDNndHVy?=
 =?utf-8?B?cFg3VnBsUVlpV3dBcnFCVnpZTlBFV2owMzlDNGhJTVUyZkRySFI3QWNNSWZJ?=
 =?utf-8?B?TVdsZGxDazZYcUc3b2F4ZVR3dm9HUStFUnJ3Z1VLelZ1aUdPQ1F0OEVlVU0z?=
 =?utf-8?B?TVVJeEpGS2xrRTJpanc4dGFncXlsSkw1Ui9hMVZjRm5PVTcyZzh1MW5wMFRM?=
 =?utf-8?B?NVVCVUljQ3lLTTB6K1VqR2VUVFlzUnVaU3ZrWC8xenR2Q1FRbjFySWtWYnR5?=
 =?utf-8?B?bVdlMElkYk9ObmE2djhjTTE2dDlMUXlTYk1QbHBxdzlmVmZjL3dwU1lVaUNk?=
 =?utf-8?B?R2tCQjdOc3Exd0xYN0s1aU5kNWw4WlZYU0huQ2o3aDVrSXk1dy90eXZMSkxH?=
 =?utf-8?B?Mk5UWWl4MG1YRDc2UldocGJwOXdsZWZPZStoRXdrSFd1T3RpVFFSQ1NHbi9Y?=
 =?utf-8?B?cllaNDRaVzM2azBOWC9aZFRld0VCWUc3dnY0ejhzUHVmZmRVU0txVi9pVDVD?=
 =?utf-8?B?YnpEa3lMYlNhYTdHZ2tnMFFVbHpkVCt1Y3p4RUJPbTlNaEloWmVTaWZKY3lX?=
 =?utf-8?B?anM5UVVJUzI2RGRyb1dwNURaNVBRVEVBMkZkYWg4bVRyREFWaVdVOTBYNEJB?=
 =?utf-8?B?ZVUzUzV4eFQ1OTZNbXAwQ0MvYm9HSmZFVUhlb3pkbHlCRUl1cUM2RFF0MUtD?=
 =?utf-8?B?YnZOTDhyWjJNTkpuZFNvbitjb0R5NGVHVUhKNUk5SjNrN0drZDJETXUvMDBu?=
 =?utf-8?B?Y2F3akxRbWVrN3lCSlhtcVVXa2F1YzZDcTUwdG41cStFaDRLL0NWN2R2YVo4?=
 =?utf-8?B?YU5zaVFSR2o0bXBic3M4K3J0TE9PSVc4bnRvc3l0UVl3Tk1iekoxanRJa2JS?=
 =?utf-8?B?cWgrSDlqdnhSUGtSV3RSMjgzamVnL01rN05jSFRtVGhQeHpkdDlCT1lOU2JJ?=
 =?utf-8?B?U3VnMDAyZE1tbVgyemk3UmJncUNBRUpULzNkTEg2TE1HdlJZY3NacVlxbFNE?=
 =?utf-8?B?RXpGVmhNRHVHVmhtZlZsbTFETGZEMlJGZ1pXcXRMTFlER1poVmN0SlN5dWwx?=
 =?utf-8?B?QURSN1o1bW9zaUh2UVlFdnI4QjA4Qkp0MUhNQ2FyY3JSUGFOUTJnTVZCWWN6?=
 =?utf-8?B?WFFYRjh2OEFTQ2k1UWJUWGZnWTF4YlRDSXhMd3RNNWdnYzM0VTl4eVRzOEcy?=
 =?utf-8?B?Q083ejkxdzhzLzhPQTNobFlBem5PaHpVT0UwbXZNZDhoK0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVFnN1F1d0t2RnVRUzVOWWd0MmJiR1g2T3o2REZISXNHTEdPTk9SZE8vSCs0?=
 =?utf-8?B?Z3JyazA2bGo0eUc1dFg2WlNiZENEN0Q1RzVwU080VkFQYWJvZzhkV0RWUXFt?=
 =?utf-8?B?bUZ5THVqbzRlL21KdjlzUDNlYWJBdkNHREdEbmdtTEozcVo1TE1nbHkxTVM5?=
 =?utf-8?B?dTlmWHZYQlBvWTM5MEtTZ2hqTnVweVBkNVZobmFRVmZIdFFtWGhqRElZdllo?=
 =?utf-8?B?VWtyWHBUbEQ1bmdRVnlZeVFRNlFCZER5bjJlZXU5RlIwUFhHejBOdERGUXI5?=
 =?utf-8?B?ZGpWempzZ0tFRW1McS9GWWlzVG9rUnZKaUpXaXFHVW1LdEFhTThZWlh1aEFX?=
 =?utf-8?B?MXFXanVWeWxMRGZzUHpxZ1lNU1kxa295cytZQzVad1pQWkt6QTY5c1FJR2tn?=
 =?utf-8?B?TUxrTWcyY3A1YmR3RUQ5Y1hHSDJ0WmxFOXp2UFpKSmpqdy9OemwvUktpOFg2?=
 =?utf-8?B?eUZOVkVGY0dXZmdsenFFclJGSmlCSmZlZ21QSGZ3UjcwREk5T092VUluTDRh?=
 =?utf-8?B?amxudzNxWkMxQStGT0RIcnZOTDFQWXdjSlRtdkFqd3hkdnpldHk2UGg5WlB0?=
 =?utf-8?B?d25zRnZXWERCVEprVzUvdk5BdSswYXpmRm9Qem1QZlozN0RWUkVOcGhtYzJl?=
 =?utf-8?B?NHRxZUJ0L1dCSWRxaTR5Nnlvdllva0MzbE9ZTzg3RkhERnVTWmVKNTJHMnlN?=
 =?utf-8?B?QUhGdTdwVUc2UGlXclp0UWxRYnFXWnBQejMwb0tFNkNROTl3aVZWZVRzM2la?=
 =?utf-8?B?NEc3aitGUjlYR256S3g5c2JPWXl0eDdsVUFCYzcwR0RCYU8xem5xZmxTUU5z?=
 =?utf-8?B?VTh2eitaTUYvM0dZYTVwWkV1UitDM1NVTTlsNmp3N2FLWkpHamJSWTBFM0xt?=
 =?utf-8?B?aGxLeWxDK1BpVjk3V1JXRWN0YXdBcy9VZ0hoUmhyNTlyOEpQbTd5bnBseUdS?=
 =?utf-8?B?M2dBWDFCQUhyYlB4cE15Snc4NWNsRURVeWxlSjhrSWdDcDFQWGtDbnRWVFdQ?=
 =?utf-8?B?ZU95RGZ6c3JPQVllbUU4a3VtNUxhclo0emlPTWxWOStYVTI2QmgxWWhXckdi?=
 =?utf-8?B?ekMwZEt4MXM2c3Z6bncrQjU2bDQveFJJRmFLb091dzhmWmV5Rmo5REJLUEhy?=
 =?utf-8?B?SVBCY3Ayd0RnUGJVdHlYOEU0UXpORDhiV1ZLUW1EdEx4cTV6NkQ0QmlpRzZa?=
 =?utf-8?B?ak1ZdU8rR0pNSi85c0kvQkY2VnlTYktSYmdES001THpyZzVPR1N3QzhUeGE2?=
 =?utf-8?B?Nkw3bEk2Qnl5UTJxS3hSVlBVYm5SaFVpcGtUTEtQODVabU1ZcjRXdlF3M1JY?=
 =?utf-8?B?VVRxTnJJRU1rTEl3cTM0dGJ0MkZtVjFnOE5HUzFBNitNanRNQUhOR2tmNmkx?=
 =?utf-8?B?RmVQSE1VQitvc24yU0lyeFI1ZFZjSnhmYWJwNUZQMlpJbXJpakRVMGNkZ1VF?=
 =?utf-8?B?RkdPMXZFOGNBMTdQck1zK3ExcEVENitNU2t5U1h2NnRTNDRQNGt5RkI2WTNB?=
 =?utf-8?B?OTRXKy9teHZ0c0R4Tno4eTkxMkhWeUVyYmE4T1FtYlo4dEVQWEFUTnZXdTZN?=
 =?utf-8?B?L3lKTWtibkxGM2s1MGVDSjBUVnR4Q1Qzbko1d2xPa0ZhTkdtMjJ1QlY0dXR5?=
 =?utf-8?B?T2k0UDRBTGR2WTRUS21Zc041WUpIWFI2b290a1c3eXMza2VySFBsU3ZiUkdK?=
 =?utf-8?B?M0FrRVRHdmxMTFIzSEZ4all5ZFZXWENvallRN1dXa0J2a0phSXpuT1k4dVpn?=
 =?utf-8?B?bU4vZGViMndvbEFLSDRPaFlaOG1nb05aUldWMnZCbGloYjFLczgxTFNqUng2?=
 =?utf-8?B?dU10SFplOWVhRWg5aXp3bVlKazIybVBMODRLdW1hV0NIT3hPMlhHRk0ySmYr?=
 =?utf-8?B?bEJUTmVoRDcxUkU0dStueU55Vms3T0xmRUlYditJeWxwNTlqOE4xaGl6OExS?=
 =?utf-8?B?QThzUU1GY0luNElNdHNZQnZNVFloQ0JzbVhiWnhuanhiOWVwM1NrcHIwWERk?=
 =?utf-8?B?K3BQcmpTK1YrMXRFMmQ2UmM5QjJpYWZyR1FLR2VTRHpESE1ESnFwbzdVc0dt?=
 =?utf-8?B?VHFVdi9BaUFGRHkwTWdMZGtzeElBZ0NWcnByRm9KOXh4cEVuVEZ0Mk54aXYw?=
 =?utf-8?Q?n/0E0ue4bY+i6rnHnjTyhQfS6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda051a9-5e6c-401f-7f72-08dcbda4d4bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 03:38:02.0621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WG07z+OearugCe8poMP4S8DheDVDSf4jOZD4vYudXott2JIXLxz6omx0KDet11CcR9Mk7VcCcjaAhd6zpvtJaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
X-OriginatorOrg: intel.com

WWVzLCBjdXJyZW50IGludGVsIFREUCB2VFBNIGRlc2lnbiBvbmx5IGNvdmVycyBlcGhlbWVyYWwg
dlRQTSBzb2x1dGlvbi4gSXQgaXMgYSBrbm93biBsaW1pdGF0aW9uLg0KDQpJIHJlbWVtYmVyIHdl
IGhhdmUgZGlzY3Vzc2VkIHBlcnNpc3RlbnQgdlRQTSBiZWZvcmUsIGJ1dCB3ZSBkZWZlciBpdCBi
ZWNhdXNlIG9mIGNvbXBsZXhpdHkuDQoNCklzIHRoZXJlIGEgZnVsbCBwZXJzaXN0ZW50IHZUUE0g
ZGVzaWduIHJlYWR5IGluIGNvY29udXQtc3ZzbSBub3c/IEUuZy4gaG93IHRvIHByb3RlY3QgdGhl
IHZUUE0gcGVyc2lzdGVudCBOVlM/DQoNClRoYW5rIHlvdQ0KWWFvLCBKaWV3ZW4NCg0KDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVzaGV0b3ZhLCBFbGVuYSA8ZWxl
bmEucmVzaGV0b3ZhQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCA4LCAyMDI0
IDEyOjA1IEFNDQo+IFRvOiBKYW1lcyBCb3R0b21sZXkgPEphbWVzLkJvdHRvbWxleUBIYW5zZW5Q
YXJ0bmVyc2hpcC5jb20+OyBDbGF1ZGlvDQo+IFNpcXVlaXJhIGRlIENhcnZhbGhvIDxjY2xhdWRp
b0BpYm0uY29tPjsgZGlvbm5hZ2xhemVAZ29vZ2xlLmNvbQ0KPiBDYzogamVqYkBsaW51eC5pYm0u
Y29tOyBqcm9lZGVsQHN1c2UuY29tOyBOYWthamltYSwgSnVuDQo+IDxqdW4ubmFrYWppbWFAaW50
ZWwuY29tPjsgWWFvLCBKaWV3ZW4gPGppZXdlbi55YW9AaW50ZWwuY29tPjsNCj4ganBpb3Ryb3dz
a2lAbGludXgubWljcm9zb2Z0LmNvbTsgRG9uZywgRWRkaWUgPGVkZGllLmRvbmdAaW50ZWwuY29t
PjsgUGVyZXosDQo+IFJvbmFsZCA8cm9uYWxkLnBlcmV6QGludGVsLmNvbT47IExhbmdlLCBKb24g
PGpsYW5nZUBtaWNyb3NvZnQuY29tPjsgbGludXgtDQo+IGNvY29AbGlzdHMubGludXguZGV2OyBK
b2huc29uLCBTaW1vbiBQIDxzaW1vbi5wLmpvaG5zb25AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
RTogQ29jb251dC1TVlNNIC0gdlRQTSBzdXBwb3J0IGZvciBJbnRlbCBURCBQYXJ0aXRpb25pbmcN
Cj4gDQo+ID4gT24gV2VkLCAyMDI0LTA4LTA3IGF0IDExOjI4ICswMDAwLCBSZXNoZXRvdmEsIEVs
ZW5hIHdyb3RlOg0KPiA+ID4gPiBPbiBUdWUsIDIwMjQtMDgtMDYgYXQgMTU6NTEgKzAwMDAsIENs
YXVkaW8gU2lxdWVpcmEgZGUgQ2FydmFsaG8NCj4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gT24g
VHVlLCAyMDI0LTA4LTA2IGF0IDA4OjIxICswMDAwLCBSZXNoZXRvdmEsIEVsZW5hIHdyb3RlOg0K
PiA+ID4gPiA+ID4gPiBPbiBNb24sIDIwMjQtMDgtMDUgYXQgMDk6NTUgKzAwMDAsIFJlc2hldG92
YSwgRWxlbmEgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBGcmksIDIwMjQtMDgtMDIgYXQg
MTg6NTQgLTA3MDAsIERpb25uYSBBbWFsaWUgR2xhemUNCj4gPiA+ID4gPiA+ID4gPiA+IHdyb3Rl
Og0KPiA+ID4gPiA+ID4gPiBbLi4uXQ0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
PiA+IFRoYXQgYnJpbmdzIG1lIHRvIGEgY3VyaW91cyBwb2ludDogaXMgdGhlIEludGVsIFREWCBT
VlNNDQo+ID4gPiA+ID4gPiA+ID4gPiBnb2luZyB0byBmb2xsb3cgdGhlIFNWU00gcHJvdG9jb2wg
aW50ZXJmYWNlP8KgIGJlY2F1c2UgaWYNCj4gPiA+ID4gPiA+ID4gPiA+IGl0DQo+ID4gPiA+ID4g
PiA+ID4gPiBpcywgaXQgd2lsbCBuYXR1cmFsbHkgaW5oZXJpdCB0aGUgZW5saWdodGVuZWQgaW50
ZXJmYWNlDQo+ID4gPiA+ID4gPiA+ID4gPiAodGhlDQo+ID4gPiA+ID4gPiA+ID4gPiBjb2RlIHdp
bGwgYmUgcHJlc2VudCBpbiB0aGUga2VybmVsLCBzbyBpdCBvbmx5IG5lZWRzDQo+ID4gPiA+ID4g
PiA+ID4gPiBhY3RpdmF0aW5nKS7CoCBIb3dldmVyLCBpZiB0aGUgSW50ZWwgU1ZTTSB3ZXJlIGdv
aW5nIHRvDQo+ID4gPiA+ID4gPiA+ID4gPiBpZ25vcmUNCj4gPiA+ID4gPiA+ID4gPiA+IHRoZSBT
VlNNIHByb3RvY29sIHNwZWMgdGhlbiBpdCB3b3VsZCBoYXZlIHRvIHJlaW52ZW50DQo+ID4gPiA+
ID4gPiA+ID4gPiBldmVyeXRoaW5nIGFuZCB0aGUgQ1JCIGludGVyZmFjZSBtaWdodCBtYWtlIG1v
cmUgc2Vuc2UuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiBJIGNhbm5vdCBzcGVh
ayBvbiBiZWhhbGYgb2YgdGhlIEludGVsIFREWCAqU1ZTTSoNCj4gPiA+ID4gPiA+ID4gPiBpbXBs
ZW1lbnRhdGlvbiwgYnV0IGZvciB0aGUgTGludXggZ3Vlc3Qga2VybmVsIHRoZXJlIGlzIG5vDQo+
ID4gPiA+ID4gPiA+ID4gaW50ZW50aW9uIGF0IHRoZSBtb21lbnQgdG8gc3VwcG9ydCBzbXRoIGxp
a2UgU1ZTTSBwcm90b2NvbA0KPiA+ID4gPiA+ID4gPiA+IGludGVyZmFjZS4gV2UgaGF2ZSBtYWRl
IGFuIGV2YWx1YXRpb24gb24gdGhpcyBkdXJpbmcgdGhlDQo+ID4gPiA+ID4gPiA+ID4gc3ByaW5n
LiBUaGVyZSBhcmUgbm8gdXNlY2FzZXMgY3VycmVudGx5IHRoYXQgcmVxdWlyZSBzdWNoDQo+ID4g
PiA+ID4gPiA+ID4gbmV3DQo+ID4gPiA+ID4gPiA+ID4gcHJvdG9jb2wgaW50cm9kdWN0aW9uIG9u
IEludGVsIFREWCBhbmQgaXQgZG9lcyBicmluZw0KPiA+ID4gPiA+ID4gPiA+IGFkZGl0aW9uYWwN
Cj4gPiA+ID4gPiA+ID4gPiBjb2RlIGNvbXBsZXhpdHksIGV0Yy4gSWYgYW55b25lIGJlbGlldmVz
IG90aGVyd2lzZSwgcGxlYXNlDQo+ID4gPiA+ID4gPiA+ID4gbGV0DQo+ID4gPiA+ID4gPiA+ID4g
bWUga25vdy4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSWYgeW91IHJlaW52ZW50IHRo
ZSB2VFBNIGNvbW11bmljYXRpb24gaW50ZXJmYWNlLCBJIGNhbiBzZWUNCj4gPiA+ID4gPiA+ID4g
eW91DQo+ID4gPiA+ID4gPiA+IGFyZSBhYmxlIHRvIGdldCBhd2F5IHdpdGhvdXQgdGhhdCBTVlNN
IGNvbW11bmljYXRpb24NCj4gPiA+ID4gPiA+ID4gY29tcG9uZW50Lg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IFRoZSBnb2FsIGlzIGV4YWN0bHkgdGhlIG9wcG9zaXRlLCBpLmUuIGRvbid0IHJl
aW52ZW50IGFueXRoaW5nLA0KPiA+ID4gPiA+ID4gYnV0DQo+ID4gPiA+ID4gPiB0cnkgdG8gc3Rp
Y2sgd2l0aCBleGl0aW5nIHdheXMgb24gaG93IHdlIGhhdmUgYmVlbiBkb2luZyB0aGluZ3MNCj4g
PiA+ID4gPiA+IHNvDQo+ID4gPiA+ID4gPiBmYXIgaW4gTGludXguIEluIHRoaXMgbGlnaHQgU1ZT
TSBpcyBhbiBpbnZlbnRpb24gdG8gZG8gdGhpbmdzLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSG93
IHdpbGwgSW50ZWwgYXR0ZXN0IHRoZSBTVlNNIHNlcnZpY2VzIHByb3ZpZGVkPw0KPiA+ID4gPg0K
PiA+ID4gPiBJdCdzIGluIHRoZSBkb2N1bWVudCB0aGV5IHByb3ZpZGVkIGF0IHRoZSB0b3Agb2Yg
dGhpcyB0aHJlYWQuwqAgSQ0KPiA+ID4gPiBnYXZlDQo+ID4gPiA+IGFuIGFuYWx5c2lzIGhlcmU6
DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzEzZWEz
MWUyNmE5ODkxNzIyNzQ4YzVkNmU4MjNmNzdiNmM4Yjc4MDkuY2ENCj4gPiA+ID4gbWVsQEhhbnNl
blBhcnRuZXJzaGlwLmNvbS8NCj4gPiA+ID4NCj4gPiA+ID4gQnV0IGJhc2ljYWxseSBpdCdzIHRo
ZSBvbGQgdHJpY2sgb2YgdXNpbmcgYSBoYXNoIG9mIHRoZSBwdWJsaWMgRUsNCj4gPiA+ID4gYXMN
Cj4gPiA+ID4gdGhlIG5vbmNlIGZvciBhIFREWCBhdGVzdGF0aW9uIHJlcG9ydCBhbmQgd3JhcHBp
bmcgaXQgaW4gYW4gRUsNCj4gPiA+ID4gY2VydGlmaWNhdGUuwqAgVGhlIHByb2JsZW0gaXMgaXQg
ZG9lc24ndCBhbGxvdyB0aGUgYXR0ZXN0aW5nIGFnZW50DQo+ID4gPiA+IHRvDQo+ID4gPiA+IHN1
cHBseSB0aGUgY2hhbGxlbmdlIChub25jZSkgc28gaXQncyBub3QgYmVzdCBwcmFjdGljZS4NCj4g
PiA+DQo+ID4gPiBBcyB5b3UgeW91cnNlbGYgbWVudGlvbmVkIGVhcmxpZXIsIGZvciBlcGhlbWVy
YWwgdlRQTSBpdCBpcw0KPiA+ID4gYWNjZXB0YWJsZS4gUGVyc2lzdGVudCB2VFBNIGhhcyBub3Qg
YmVlbiBpbiBzY29wZSBvZiB0aGlzIGN1cnJlbnQNCj4gPiA+IHJlbGVhc2Ugc28gdGhlIHJlcXVp
cmVtZW50IHRvIHByb3Zpc2lvbiB0aGUgbm9uY2UgaGFzbuKAmXQgYmVlbg0KPiA+ID4gdGhlcmUu
IEFnYWluLCBvbmNlIEppZXdlbiBjb21lcyBiYWNrIGZyb20gdGhlIHZhY2F0aW9uLCBoZSBjYW4N
Cj4gPiA+IHNoYXJlIGhpcyB0aG91Z2h0cyBvbiBob3cgcGVyc2lzdGVudCB2VFBNIGNhbiBiZSBp
bXBsZW1lbnRlZA0KPiA+ID4gaW4gdGhlIGZ1dHVyZS4NCj4gPg0KPiA+IFN1cmUgLi4uIHRoZSBw
bGFuIHdhcyBhbHdheXMgdG8gZG8gZXBoZW1lcmFsIGZpcnN0IGJlY2F1c2UgaXQncyBlYXNpZXIu
DQo+ID4gVGhlIGJlc3QgcHJhY3RpY2UgY29tbWVudCBpcyB3aGF0IHRoZSBzZWN1cml0eSBndXlz
IHRvbGQgbWUgd2hlbiBJDQo+ID4gcHJlc2VudGVkIHRoZSBwdWJsaWMga2V5IGhhc2ggYXMgbm9u
Y2Ugc2NoZW1lLiAgVGhleSBjYW4ndCBmaW5kIGFuDQo+ID4gYWN0dWFsIHNlY3VyaXR5IGZsYXcg
aW4gaXQsIGJ1dCB0aGV5IHNheSBpdCdzIGJlc3QgcHJhY3RpY2UgdG8gbGV0IHRoZQ0KPiA+IHJl
bHlpbmcgcGFydHkgc3VwcGx5IHRoZSBub25jZS4NCj4gPg0KPiA+ID4gWW91IGtlZXAgcG9pbnRp
bmcgb3V0IHRoZSBwcm9ibGVtIG9mIHRoZSAnYWJzZW50IG5vbmNlJzogaXQgaXMgbm90DQo+ID4g
PiBwb3NzaWJsZSBmb3IgYXR0ZXN0aW5nIGFnZW50IHRvIHByb3ZpZGUgYSBub25jZSB0byBiZSBp
bmNsdWRlZCBpbnRvDQo+ID4gPiBhdHRlc3RhdGlvbiByZXBvcnQvcXVvdGUgYW5kIHNheWluZyB0
aGF0IHdlIGFyZSBtaXNzaW5nIGFuIGludGVyZmFjZQ0KPiA+ID4gZnJvbSB0aGUgT1MgZ3Vlc3Qg
KEwyIGd1ZXN0KSB0byBTVlNNIHRvIHN1cHBseSB0aGlzIG5vbmNlIHRvIHRoZQ0KPiA+ID4gU1ZT
TS4gSXMgdGhpcyBjb3JyZWN0IHN1bW1hcnk/IElmIHllcywgd2UgaGF2ZSBhbiBleGl0aW5nIGlu
dGVyZmFjZQ0KPiA+ID4gaW4gTGludXggT1MgdG8gYXNrIGZvciB0aGUgcmVwb3J0L3F1b3RlIHZp
YSBjb25maWdmcy10c20gaW50ZXJmYWNlDQo+ID4gPiB3aGVyZSBhIGZyZXNoIG5vbmNlIChvciBh
bnl0aGluZyB5b3UgbmVlZCkgY2FuIGJlIHByb3ZpZGVkLg0KPiA+DQo+ID4gT0ssIHNvIG5vdyBJ
J20gY29uZnVzZWQgYWdhaW4uICBJbiBvcmRlciB0byBiZSByZWxpYWJsZSwgdGhlIHZUUE0NCj4g
PiBhdHRlc3RhdGlvbiByZXBvcnQgbXVzdCBwcm92YWJseSBjb21lIG9ubHkgZnJvbSB0aGUgU1ZT
TS4gIFdpdGggQU1EIHdlDQo+ID4gY2FuIGRvIHRoaXMgYmVjYXVzZSB0aGUgVk1QTCBsZXZlbCB0
aGUgcmVwb3J0IHdhcyBnZW5lcmF0ZWQgYXQgaXMNCj4gPiBpbmNsdWRlZCBpbiB0aGUgc2lnbmVk
IGRhdGEsIHNvIFZNUEwwIHByb3ZlcyBpdCB3YXMgZnJvbSB0aGUgU1ZTTS4NCj4gPiBOb3RoaW5n
IHByZXZlbnRzIHRoZSBndWVzdCBmcm9tIGdlbmVyYXRpbmcgYW4gYWxtb3N0IGlkZW50aWNhbCBy
ZXBvcnQNCj4gPiB1c2luZyB0aGUgYXR0ZXN0YXRpb24gQVBJcywgYnV0IHRoYXQgcmVwb3J0IHdv
dWxkIGhhdmUgVk1QTDIgYXMgdGhlDQo+ID4gcmVwb3J0aW5nIGxldmVsIHByb3ZpbmcgaXQgZGlk
bid0IGNvbWUgZnJvbSB0aGUgU1ZTTS4NCj4gDQo+IEl0IHdvdWxkIHdvcmsgZGlmZmVyZW50bHkg
aW4gY2FzZSBvZiBURFguIElmIEwyIGd1ZXN0IGFza3MgZm9yIGFuIGF0dGVzdGF0aW9uDQo+IHJl
cG9ydCB2aWEgVERHLk1SLlJFUE9SVCAoYW5kIHByb3ZpZGVzIGEgbm9uY2UpLCBpdCB3aWxsIGdl
bmVyYXRlIGFuDQo+IEwyIC0+IEwxIGV4aXQgYW5kIG5vIHJlcG9ydCB3aWxsIGJlIGNyZWF0ZWQg
YXQgdGhpcyBwb2ludC4NCj4gVGhlbiBMMSBjYW4gYXNrIGZvciBhbiBhY3R1YWwgcmVwb3J0IHZp
YSBvbmNlIGFnYWluIGNhbGxpbmcgVERHLk1SLlJFUE9SVA0KPiBhbmQgaXQgaGFzIGEgd2F5IHRv
IGluc2VydCBhbnl0aGluZyBpbiB0aGUgcmVwb3J0IGRhdGEsIGluY2x1ZGluZyBub25jZQ0KPiBm
cm9tIHRoZSBMMi4NCj4gDQo+ID4NCj4gPiBJIHRob3VnaHQgSSBwaWNrZWQgdXAgZnJvbSB0aGUg
c2xpZGVzIHRoYXQgdGhlIGVxdWl2YWxlbnQgSW50ZWwgc2NoZW1lDQo+ID4gcG9pc29ucyBhbGwg
dGhlIFJUTVJzIHdpdGggYSBzZXBhcmF0b3IgYmVmb3JlIHRyYW5zaXRpb25pbmcgZnJvbSB0aGUN
Cj4gPiBTVlNNIHRvIHRoZSBndWVzdCAoc28gYWZ0ZXIgZ2VuZXJhdGluZyB0aGUgdlRQTSByZXBv
cnQpPyAgV2hpY2ggc2VlbXMNCj4gPiB0byBpbmRpY2F0ZSB0aGF0IGFmdGVyIHRoaXMgaXMgZG9u
ZSwgZXZlbiB0aGUgU1ZTTSBjYW4ndCBnZW5lcmF0ZQ0KPiA+IHJlcG9ydHMgd2l0aCBTVlNNIHBy
b3ZlbmFuY2UgYW55IG1vcmUuDQo+IA0KPiBBZ2FpbiwgdGhpcyBpcyB0aGUgY3VycmVudCBkZXNp
Z24gb2YgZXBoZW1lcmFsIHZUUE0uIFRoZSBzcGVjIGRvZXNu4oCZdA0KPiB0YWxrIGFib3V0IHRo
ZSBwZXJzaXN0ZW50IGNhc2UgYXQgYWxsLg0KPiBBYm92ZSBJIHdhcyBvbmx5IHRyeWluZyB0byBl
eHBsYWluIGhvdyB0aGUgbm9uY2UgZGVsaXZlcnkgYW5kIGFza2luZw0KPiBmb3IgcmVwb3J0IGNh
biB3b3JrIGZyb20gTDIgZ3Vlc3QuIEhvdyB5b3UgY29ubmVjdCBpdCB0byB0aGUgcGVyc2lzdGVu
dA0KPiB2VFBNIGRlc2lnbiBuZWVkcyB0byBiZSBkZWZpbmVkIHN0aWxsLg0KPiANCj4gPg0KPiA+
ID4gVGhpcyBpbnRlcmZhY2UgY2FuIGJlIHVzZWQgd2l0aG91dCBtb2RpZmljYXRpb25zIGZyb20N
Cj4gPiA+IEwyIGd1ZXN0IGFsc28gKHdpdGggU1ZTTSBlbXVsYXRpb24gc3VwcG9ydCBvZiBjb3Vy
c2UpLg0KPiA+ID4gVGhlIHJlc3QgaXMgdXAgdG8gdlRQTSBhbmQgU1ZTTSBkZXNpZ24gb24gaG93
IHRvIHBsdWcgdGhpcyBpbnRvDQo+ID4gPiBwZXJzaXN0ZW50IHZUUE0gYXJjaGl0ZWN0dXJlLg0K
PiA+DQo+ID4gU28gSSdtIHN1cmUgeW91IGNhbiBjb21lIHVwIHdpdGggYSBkaWZmZXJlbnQgc2No
ZW1lIHRvIGlkZW50aWZ5IGFuIFNWU00NCj4gPiBwcm9kdWNlZCByZXBvcnQgdGhhdCB3aWxsIHdv
cmsgYWZ0ZXIgaXQgaGFzIHRyYW5zaXRpb25lZCB0byB0aGUgZ3Vlc3QsDQo+ID4gYnV0IGluIG9y
ZGVyIHRvIGhhdmUgdGhlIFNWU00gZ2VuZXJhdGUgdGhlIHJlcG9ydCwgeW91J2xsIHN0aWxsIGhh
dmUgdG8NCj4gPiBjb21tdW5pY2F0ZSB3aXRoIGl0ICh0byB0ZWxsIGl0IHRoZSBub25jZSBhbmQg
cmV0cmlldmUgdGhlIHJlcG9ydCkuDQo+IA0KPiBZZXMsIHRoaXMgaXMgZXhhY3RseSB3aGF0IEkg
d2FzIHRyeWluZyB0byBleHBsYWluIC0gaXQgY2FuIGJlIGRvbmUgdmlhIGV4aXN0aW5nDQo+IFRE
Ry5NUi5SRVBPUlQgY2FsbCBib3RoIGluIEwyICh3aXRoIEwxIGFzc2lzdGFuY2UpIGFuZCBpbiBM
MS4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gRWxlbmEuDQo+ID4NCj4gPiBKYW1lcw0KDQo=
