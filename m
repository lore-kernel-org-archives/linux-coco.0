Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795507539;
	b=JgViBLd+QdE96q4Co8zx88t0GRzoJROlTV+bm6kXxWInQKIqFJF2MmwrHlBdzfspZLQI
	 dHLVinFag46v5ScjnhdojthCvIqpwDpfBJ5bBBWau0pta30ihhTz46ycwmY+xuiMtTMeC
	 J674jrzT9a4yNIFj5HM7Br/g7Uomik5fh5hB3E/owgprdXvpl68i6/AFdEF9jiLz9OFxo
	 1OBU7MB1xcOow+l8LgzkkPXklXoLMaRZu3+PLARBzCfST+6DjTxKp+El39L6ldokAcXlJ
	 9r4KATPhbVDHr0GX9Lbx2KU5Or/EtP8gXXZ03JS5F193ZObZPCXlqkP9skkSHCdLj6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507539;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=9BdTCn/ayJ8BR44rXYFIojCRagx4/QoxTvX/qB1nTDI=;
	b=ku8EMW6+77n70+Iy/UAFEo33YmvOyQfWpVoFK6Wqhw+/xnUKaO0Zj92N3OAmfM2ur0N9
	 8WjJGnUpOBz3MhPc5eCWhss7UC7Rg6r/YhVvyC9+rLMJrAHShx3VP7UmbtBwFrfHcVSib
	 3xJQyRpYNAzSKUABRwFiwk7XfyDBbkjJUWh1W6sqRDlVH9zhN/Sz0Qe/xyc26IRQYM/ml
	 1EoEx86mgwvFXl71nvUK+ZAMI3km/FN1AETH02lK4FM+OfiSGNKHohh2xT/IMW5874at5
	 Yuo1N6r32xF2n5vy0iWkIqHnDm1+FoJHio/Mm5KBrO4hKLwUU78tQnnuNUfZ67wM9SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QC1HBBzf;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="faw0kb/s";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D63D606A326
	for <linux-coco@lists.linux.dev>; Tue, 24 Nov 2026 08:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D63D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QC1HBBzf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=faw0kb/s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795507539; x=1827043539;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9BdTCn/ayJ8BR44rXYFIojCRagx4/QoxTvX/qB1nTDI=;
  b=QC1HBBzfC68GbBp51ZkXoBdCOiW7dnGWXvAh4PBWvI5oxn6NyX8J527R
   Idb1JHNsrnFHl/53ZZ1HwhDEV/aNf3yhKeVQab7r2H2j5Ylb0NN58AYF0
   wXPc8UdJAaM5gns9n6n4TAGszTLTxe0ur2viNOP+KjONTOathT7eGfP+W
   9GTnnnwqpitfehPZa91TARzTKWhlMnYz+zecR2unz/AfP27HmxVBOgLjh
   f3pzLSK2sg7dmjvkVxCbCwhyJgrmEn8xBV12ZlMwtSZjh+DsTYu3YDGYE
   z+kx7lY6rzJJtEGe6/bH9dbKsgHAQCizGrspYY/ulauw3hc5jfowtSlyK
   g==;
X-CSE-ConnectionGUID: uKXyMQL8QhWUu7eIkJLCfw==
X-CSE-MsgGUID: VUWEb7QfR8m/nvwLiXqMng==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4348410"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4348410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 00:01:42 -0800
X-CSE-ConnectionGUID: 4x2ymxyvTCKLiavie0gJRw==
X-CSE-MsgGUID: s5xhAu3XSBeH7AF7ZFSTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="11711457"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 00:01:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 00:01:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 00:01:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 00:01:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVWxcDTiBAHKSWTNfz6Jrq72CmrgXROtRkWw3ttrBZPNNiK89CQcUgVQ7ClPtMQLdZk46TrTC8hPFCy8cbBqQMNKz9Lc8GUCdi9CIMzntDn4eBCx8ABfGcufqMZHQGAkHduxNxHAT1uJj2gEXyexVWYM34CcskaFmOG/FXKh+eS60Uy+EBH+cZucVOK4HhIKhzWe6ThGSdFd/hlQt7aJUzvcwIrv0nD67e6zsljUqP1PJ+gtDGt+fRprW+JXNNDawvj+PT4IiJx4IPU9tcHh+jcbRPsgYsGLaXbAdikry4/B3vMOevOuv4nBc9Hr40orszOVDTWii3KK2ncK7ldm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BdTCn/ayJ8BR44rXYFIojCRagx4/QoxTvX/qB1nTDI=;
 b=ve1mYQAApNxvGrSjyWnUAMRvuWnJWPVFwTOmijWYZd9Y9p3lDpikc+LLfi7TXTeCuF4uWLvA7c9X2aN8rbNzUrBEllVWInOPP7mnK7llhuCAmzpney0+AESjSHe8ikeuz/cHAjztl1eaUTMcE/vQj8Rv8ymSBFxhS6BUonlgIwUThgZu8hzDjIvraoxwat7LOiPirEqaNwJpJDCdCinh/4cHrR9ZbbSbwN4d+0bY2BlvqrAn47xqbV7h7fVlYAS7rKdaO8SYLIcVfS+fdLrm1yAWuC9HAEOOM8Y8+Fy+rkano8eTcAc5sS6YHg/SZ1oZP5Q4kzs1as8v8jN186PGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BdTCn/ayJ8BR44rXYFIojCRagx4/QoxTvX/qB1nTDI=;
 b=faw0kb/sMOi56Hot94aQs+40nV9/VjKZ8JXlTifkGP+B0S1YR3yfeEWv09S0WcFo9IS6owjKwgia0m3/xQpV9jdx1PLLzqikC3wJ7NWyHy93DNTNcdawGkMQGmZSlwWzuX06N9mDjVTPUu73nRlY+XcmRa2p/x9MpR7a5uTOHMU=
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:01:39 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:01:39 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Kiryl Shutsemau <kas@kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "Xu, Yilun" <yilun.xu@intel.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "Mehta, Sohil" <sohil.mehta@intel.com>, "Hunter,
 Adrian" <adrian.hunter@intel.com>, "Maloor, Kishen"
	<kishen.maloor@intel.com>, "tony.lindgren@linux.intel.com"
	<tony.lindgren@linux.intel.com>, "Fang, Peter" <peter.fang@intel.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "Duan, Zhenzhong"
	<zhenzhong.duan@intel.com>, "Gao, Chao" <chao.gao@intel.com>,
	"artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: RE: [PATCH v5 5/6] x86/virt/tdx: Make TDX module initialize the
 extensions
Thread-Topic: [PATCH v5 5/6] x86/virt/tdx: Make TDX module initialize the
 extensions
Thread-Index: AQHdcZDknsqscl5nvUqTUPC74fRGfbc87tEg
Date: Tue, 24 Nov 2026 08:01:39 +0000
Message-ID: <CO1PR11MB4835398A9726ACBA73621C218C442@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <20261111-tdx-module-ext-v5-0-c74f764abc3d@linux.intel.com>
 <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
In-Reply-To: <20261111-tdx-module-ext-v5-5-c74f764abc3d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|SA1PR11MB6783:EE_
x-ms-office365-filtering-correlation-id: 691ccdcd-1081-4ffa-e142-08df4a012b5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|22082099003|18002099003|11063799006|56012099006|261009223027099003|4143699003|261102124527099003|261026121527099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info: MJbp1RMvr+b4FY1DUN57qM1w0INlvbzF6x8CxhuL8aM1ZbWmQiS63ZEdlkCdfu9p+0KtSKcWkrNsCSl5IfR3iOammG6elG6kLEDN7XcD95QwtJ/m6GvpKQSbohUBZQf+f4Tq+Qjj16HgL5dLCyUUjyKfcMArgSPhAXxOVDhVsKflLnpFBkKPCuW0tcyW7N2zl27zQJFOU6jPQsxYuojFopPQTw8u9a6Vh/zBkKHv3qHiU9cB+TnrcjAVld1u+yb+QT95s9WQSHiI8q7xJx5IETMgovWeq532foSeseBPQmLtXnzju/3Jsnlc0Nfmf4pGTAAtdrX3NePfVDU+N4kSqndWkcz2UtgS5RP5bp9pNa/A49oYSA5R/QGvajH3UngxT9n83aWkYWOYGVUhg032B/pz/oyPrx0XvdCTL8iomNDVRXTvDMUK7rHqU0Ssq6ITFhROi0/f4QqAI9YQvxXu15t0N0i2nH6HPOWP1leRGbDweNWN44kXoznCicTTCPU9sKub6c5xayKdSv8s/YMbSJBnlNUJ8Xpcd8GQc6R6jiecT8ywzQhg7dsa4qtEnvZqY6I1nz9LPwolu/TzwxStMqpA4uj4VlnztwZ4ohokQg3RoS6NTccfc2TcoqHBYnQ4q8dl9VI1vfcq473OHdMpyS6d3LnLIVR4WCfdLi0OqdRx7ZZ/4/m0RAp2dW2DjomM0cuGJWm26Ngv5BvxvHS7YaFZ+3dv5SMYRKjOU8wZkc4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(11063799006)(56012099006)(261009223027099003)(4143699003)(261102124527099003)(261026121527099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW9Eb1pQV1RuRHZ5dUNzb0RRUHRGR3R3aUhIQURwWlVZb0oxL3JIY1J3SWxt?=
 =?utf-8?B?WGdWOHpBQTRvU2pKdUY0TXlqWGlFUHh4aWJlNzdsc1FIQllKNWQzYkJVU2xl?=
 =?utf-8?B?Y2FmUENxbTRxeTNVQUdsdUVNcDNKRVBUMExnRHp4ZTAwT25ZRUlvb09YVzBP?=
 =?utf-8?B?cGxCY1Nmd3RaYXZXSkpVK2xVVHJtcHRHa1VZMzJnaDJydjZyQk5MNyt4a2dM?=
 =?utf-8?B?N0JjMmx3d0VUaW5xdUpocjNzeWFDSzY5cFBzWTUxWVVCamU3bElWUzBKM3dk?=
 =?utf-8?B?MXoyblZNckNDQWVPT0Z0WW4rMGNTNWsvK2dYbEFWRHBGc1c2VSszS3lvQjRD?=
 =?utf-8?B?RU5BQjJCMmgvVmJ5K2dLV2t0ZlNRQ3hBai9lVTlXVTRDY2U5N3lCc09icVBx?=
 =?utf-8?B?WmNpeVM3T3h0aHk0ckl0M3ZxSFFIT2lUWlAzVU1JNmZ0ck1ydVF5RC96NXdn?=
 =?utf-8?B?RnJHeFRXZytJTitOZXExM3F2U0J3TGRraWxnQTJKL1FXY2hodDBDdFVXZklL?=
 =?utf-8?B?SHBrYXZueGM5Zml1dzFTc1V3U3U3RVR0VHFUTUhzWjM4MTZUN3NzVW1ON0tS?=
 =?utf-8?B?ZkxnWFdQazhyWkZnb2M5UmxGZDBDVkF4eFZXUTc5YVlhRXloSWUrendSMExk?=
 =?utf-8?B?VEZJZkpqa3d4MllGZ2NrelJFdmdwczh1Wi8zeXJ6OHprbXlSTjNjSm5DZ0sy?=
 =?utf-8?B?UzZ1UjZZWlZaNUZqN0NBS0pTeExtOWg4MjBaSC81WkJHTzF3amhobnNLR1Ju?=
 =?utf-8?B?UnpWMXZ0ekszZi9mZ3hwK1dkRlBhR1pVSFVIRFRhRTIvMDQ5YUtPWm9EYTU4?=
 =?utf-8?B?ZXFrVlBFRVdFbGQ1cHdLYkY3ZHJ5WU8xZEJ5d211QWhRREhWbVZ3Q3ovSUNs?=
 =?utf-8?B?MVRqYjcwbUdVcThObkRBeXIvQ2FUdzR5QUZ5aWJzRGpwM2RxMHB4NnFxVlZB?=
 =?utf-8?B?K3RlY0hPaCs2aEYvZ2UralJVWWlPNHVueXZpWUY4SlEwQ1hscnQ4SjVXajNp?=
 =?utf-8?B?ejMyU3lmbVpHZXoxL2RCUnhibTUvTlo1ZmpGQ1JMWDVRNk1LSWhUMWw0djhU?=
 =?utf-8?B?S0d4UUtOZ1pRV3IwU091ZGVqUWJyajB6RkV6S2EzRTVHaFhQZWhHQWpPTXFz?=
 =?utf-8?B?c2JuYmRQc2xNT3ZzQmhjUzVwNDlCNGxPNHVnbmVsc1oxQ1BkVk5JUWdJeWZO?=
 =?utf-8?B?OTRpUjBPa3FQaXFGY3hET085STFaa3dDaEhPNkpuNXpLVHVDcnkxeFEvVFZu?=
 =?utf-8?B?NVFlaS9GUVBDbEs0MEw3dU1JR0ExUUxwTVBTQ0plOTZrR3FsZVVWTWwzYm1h?=
 =?utf-8?B?aDVRMVJMUk1wTGxxbW5ibUJOVnpDY3liaWd4c2JLTmhnYjdsbmFUNmN2ZWUw?=
 =?utf-8?B?WjUzSVByQzFMUUlWZlJVakRGaG12dEdmazR2Tml6elhIaHM4QnBSUWx0S3hT?=
 =?utf-8?B?NVJQUEo3UHlYTVNoT2xFQmlzVzZOK2doTHVpa0c5alJrSDJxa1RKVk42VElF?=
 =?utf-8?B?dnJLTGJWSGdkQm1zTEkrWTFpaXdwcUxOTWdYZHFoeTQ4VjZER29ZaW1FK28v?=
 =?utf-8?B?eUsyUGtUQjBNS3hiS0l1TUlGN2RnNi9CVTNwMzlkQ0hQeHZpSFZoZDZaWlFQ?=
 =?utf-8?B?bC95NURIU3FVdldKekU1Tk5INEhVMFdGK0FvWCtka05BOHpLZ1lyRklNVHRk?=
 =?utf-8?B?QkxtOW9JOFFwd0svdThqajlOdXNoak5HN3hWcjhaL2ZoTjhpVjNTTUo1ZU12?=
 =?utf-8?B?U3ZGYzRlSVBLOG13a1VobHNZWEZsZU5rSGFTKzdudjVkbHRRN3J6eUcxdEQ5?=
 =?utf-8?B?UVhYWmxzMEJ3MUV5UUpaVmV5ZGozSmhXZm9FdDVOVDM3WnJySmVrd3FBU0s1?=
 =?utf-8?B?SFhBNGFqSnNXQ040OHp4Zm9mQXM4bU1iZjllT08xd1RSeHpUeFE0c2VmdExX?=
 =?utf-8?B?RFArVmkrekVvdU00N2NTeXRBcmVsN3ROZ1JIVnRuL2xuZzVKc1RmUWw0dDh6?=
 =?utf-8?B?cGJ2dGh0ZkhMS1VYRkg2YkZ2eUhjbmdoOUJ2QzZVK2pLZmkxSVhhY0tkalZF?=
 =?utf-8?B?bTFrQnVpSjZSR2xLN1hhMDRpSkxaREdFZ01iQ2lNT3JPdGxwUC9XUGdST24v?=
 =?utf-8?B?cE05UEFvUmNjTFdBWkgwdURPK3BlcTJwdWVTem9EWEVublN4ZFlFamNFSkw2?=
 =?utf-8?B?SGZjeHJyc1J3SCtSaFhiK3Y4eVN6NktZdnZiQ0ZtdHBtbTJsUEtDRFNMQTB5?=
 =?utf-8?B?dDJZUnVwaGtvV2tQbENDWkNORGhRRlhkQUhzeElrNVRaejU4ZFNaTFF4c3VC?=
 =?utf-8?Q?dWzRQFicYHC2YLRWkM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g68dPHpMMuaS85U5UO0KbNeczP+DqB8RgygLCqI957dt3oI1V2EZnyVYEfltQ5BPyqbbx6URfOLe3/z+OKzkuLoVgQockleNazMfQrfjyGXs/Mh2uToXYPTjj6T/Ns3Oidwpud9uTZm3BLtSx2/b6k3yeTDZlFmkQqVfvVS1PjZgkY89x+2sZbn6O3XHUK1rniNXyuHDbY36UsKMYMIRCTKRCmW5VfmxKqod+OGccp4TchO2iwQpe3ZMFPZmSe4G775nd2Anu3T88aKuE8yXsVncAafqEDJEyo3DuPBJegZJQ/kDE1aUBJhLuldjpeQWTaKe2VJllmcfOF0nKx32Yw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691ccdcd-1081-4ffa-e142-08df4a012b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 08:01:39.2532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gRvOLEmcb/Ps500I5SSTxLm7dUxwPPUqicMaX/VSxoQbB+pc61163ndgEIAfVoVSlIXRZxJESjBz8Zlrt07JEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
X-OriginatorOrg: intel.com

PiBGcm9tOiBYdSBZaWx1biA8eWlsdW4ueHVAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIE5vdmVtYmVyIDExLCAyMDI2IDExOjQ5IEFNDQo+IA0KWy4uLl0NCj4gIHN0YXRpYyBf
X2luaXQgaW50IGluaXRfdGR4X21vZHVsZV9leHRlbnNpb25zKHZvaWQpDQo+ICB7DQo+ICsJaW50
IHJldDsNCj4gKw0KPiAgCWlmICghKHRkeF9zeXNpbmZvLmZlYXR1cmVzLnRkeF9mZWF0dXJlczAg
JiBURFhfRkVBVFVSRVMwX0VYVCkpDQo+ICAJCXJldHVybiAwOw0KPiANCj4gLQlyZXR1cm4gdGR4
X2V4dF9tZW1fc2V0dXAoKTsNCj4gKwlyZXQgPSB0ZHhfZXh0X21lbV9zZXR1cCgpOw0KPiArCWlm
IChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4gdGR4X2V4dF9pbml0KCk7
DQo+ICB9DQo+IA0KDQpBYm92ZSBtZWFucyB0aGF0IHRkeF9leHRfaW5pdCgpIHdpbGwgYmUgY2Fs
bGVkIGV2ZW4gd2hlbiBleHQucmVxdWlyZWRfcGFnZXMNCmlzIDAsIGUuZy4gd2hlbiBURFhfS0VS
TkVMX1NVUFBPUlRFRF9BRERPTl9GRUFUVVJFUzAgaXMgbnVsbCBhcyB0aGlzDQpzZXJpZXMgc3Rh
bmRzIG9yIG9uIGEgcGxhdGZvcm0gd2hpY2ggcmVwb3J0cyBURFhfRkVBVFVSRVMwX0VYVCBidXQg
bm8NCmFueSBhZGQtb24gZmVhdHVyZXMgKHdvdWxkIGl0IGhhcHBlbj8pLiANCg0KSnVzdCB3YW50
IHRvIGNvbmZpcm0gdGhhdCBkb2luZyBzbyB3b24ndCBoaXQgYW4gZXJyb3IuDQo=
