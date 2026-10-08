Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60678389116
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478050; cv=fail; b=i+ITP5lIetQStydnkGazftaqZO6thaXFEyEGobB+9s26B8DZnR8xZUyPJ+NIskfhpnwnLWMgL1XAUGsc74BoCJv7691pYKTVe5gvkAOIXRuWlEG0d5z4hyHOHseX/ZSjBb3FlAJUTdxwdOHcJNc9r/SnUM8WZ7gZg8Sx/gjVPuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478050; c=relaxed/simple;
	bh=CpFBiS2UexNd8zSFTrUkU6uUHSbBTFToSlkSjhCc+xY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PU9+EJ0IQkeZ35pnyqKsQtIrOecfdxNgkEHh4OMqjz7YLyzgZSurrklQ10VJAxBRGqmbvprd7cgUhk6xKPVs6jBxKXzPnMyMMdceBXrOKbpMJqZ5zBprEwuJ+c8PEoGIS7WWlmp/jZSnBtqAeCBl1Pr0jdJCyisX5N6b6aRvZuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpT99lkw; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpT99lkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791478049; x=1823014049;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CpFBiS2UexNd8zSFTrUkU6uUHSbBTFToSlkSjhCc+xY=;
  b=VpT99lkwG9hJBb5Q/3pEMwQHs7PImvDOC0B2TieynFdlfHiHcFcns8NL
   aJZltDKntalKXk/5GvXyMnmM8BM7EUbEJJK7wR/HP4+m2L5AXQnCCANVs
   fpk03VP5upgkQdKBdazH6LhmvG3K80iqfF2JGREbAxFNWu/Ns1WYP5YYe
   AsZNzJuHUZ0S6tP6n7KyJxzUwkEa9pVdM+6HHn84oMPcXRHctCizWn8cP
   mY2dErOtlXYS3H8MOvY4uBUxc/UMsAR0TxL7Srbso35kYG1ATgvZrtiTB
   /MjvkNmhbBgA4v4rpadtwPZsUOHDxJnkwjYWfZKXh975eRf5tByjEUyA+
   A==;
X-CSE-ConnectionGUID: hViUQPqTTcOxxbX39biYgg==
X-CSE-MsgGUID: lDK61a52RxK/4TtDwyRL+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="271427"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="271427"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:47:28 -0700
X-CSE-ConnectionGUID: 91668Q5jT3uXMTlyy3s8nw==
X-CSE-MsgGUID: EwlL4krkQsuXidWrv+8dkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="456555"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:47:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:47:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 09:47:27 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 09:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNrmRGcR4euwoA9o6BT5j5M8fwcD18EH2Lqep3h7DFcoai5eVH0KcjIv+O/GHhrNgAt+QbVegw+e36Aan9YXzfFKb+AauTc2tuSWD1cOBdeD1526TGMeAqfhv/hnAT+BxOvzAZKsejoDug2TZuk9GNy4dt1AzaXiJIuVTyp2P59xJ2mUntLP9a3PWtGldYyT2HdiXi9bibe/GQPKCwZ3xEi2fZXM+1O6RH/oFHppv2S9XSN5H6z5uM0IsKILJc8yt5ReF+AALtE8hPz/B4sDxnm69xpOjkzA5DPxYmIM9myL1KKYIw9yZesrT2yeWFvzHkpJKAL9TWfkEWJIJciJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpFBiS2UexNd8zSFTrUkU6uUHSbBTFToSlkSjhCc+xY=;
 b=lIuSkjSue3aqpgne/aKxURFsUDBnG5Ik/Pe6eEB7rn8FT3pXMhTBVQlOsnI79WVFpbFJlq/5HWBXhCxrx6yNayUmvOteixdoE08KgJvoJR++RNIuTDJy4xH88xI84aXJg4u/L/gqd5IKpBBXIBJbv+8JGmKBkNeN2trdauD1MPPutlhNp1Q7B/ujF82KgkqrjJ90d46GmiQJzW6CYotoa0xsBqUOrHmJ/Gyz17lPve09jhS/nv+Htf8RTt/1hQ9jNlHQw/ngZqQD2Fh/DFeW5uT0cRz3aPKe2K/jwzKAuwxgNL4f8CuZLlDVLVu7wZ8RVqOykRDAoRufFq3K6JPxTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by LVUPR11MB9857.namprd11.prod.outlook.com (2603:10b6:408:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 16:47:25 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 16:47:25 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Duan,
 Zhenzhong" <zhenzhong.duan@intel.com>, "x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Tian, Kevin"
	<kevin.tian@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "Verma, Vishal L"
	<vishal.l.verma@intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "nicolinc@nvidia.com"
	<nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>, "Gao, Chao"
	<chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>, "yilun.xu@linux.intel.com"
	<yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rJ7FgWIHNhvU2XNEh+FPULkLbeZNqAgAAFy4CAFNJ8AIAAtIwA
Date: Thu, 8 Oct 2026 16:47:25 +0000
Message-ID: <6f357b30a335a2e46e91794334e15caf285afe89.camel@intel.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
	 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
	 <697c0117acaf51076b274d461262e36453948478.camel@intel.com>
	 <IA3PR11MB9136F9C18ED0AC4C86258C9892932@IA3PR11MB9136.namprd11.prod.outlook.com>
In-Reply-To: <IA3PR11MB9136F9C18ED0AC4C86258C9892932@IA3PR11MB9136.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|LVUPR11MB9857:EE_
x-ms-office365-filtering-correlation-id: 0718e481-ca19-4ebe-ab69-08df255bd4fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: rFy+iZeEnb4vH43GatcxZaxMuyXQ2og2baloP69xv6HBCsYMO9to2xH/JKzR0vHxDXESHImRx1TfolT8y16x63+CW39rmogLuZM3CpvtUm9PstkPAM7perfUh4n3kmp8NFVsXHv7ZxIWiYQwisDVXg+FEveIcIknCJvJ5bsHMD2nHs8aFFEe/LH4bUhsMRep4+jaYbQfiiwJlblDZAuxiCFLYSVMb0+M6MR3aurGtVbfUq+hFeZJhrSvKPYoUc7Jf18B5itjJaAKiZgVknz+Uk2PQ/qB7bXVhBoTT4U1gBLdsipwNDbl6q3Y0GhlNsx65Wm+bedbC+evpw4tgj73ThAeTMeXrDSAxVZhWLAiQ12DZ71kDFVC22cWo0oMQwt1tTPaNl79CUUcqbabsdGeAuOEDBtJOg+8Mc9mnzgXxCW7oc22HKWLkTGpYHkaHvLEYlH+F2oFg3YepxptoTRtciE1P5A5gmC3lnNlj9286A+51D9/EYtZKMUz7Obmtu2PhNMITIeC6TukvEkRi5jw2neq6n9IlUUSgsnE9T0tSJJUfBYiwyxNOPA09kAX0Mdkj4u/lU7bM8htfvkkZtzyCbFtGeMEZdfQHcXioIgkwQ4JYPNFqiV+lq6n36Qn8XamYMgZUNDh/qz1bQ6YsRKzk01FQbBDsqODkhTJJa8GSqLDUo8ReXARMvQO0Bzh/2Huh1AGvudwJzGXMjrBunga2ZvDSynjSTHaL/OdBunc3UA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU5KQzliYzl6YVU0STFsZ1E4cmJqREJFNTNHaGdaUk5wTXNvRUErYWxPSFN3?=
 =?utf-8?B?WVZwTTJPWFE2dGx1TTVQOXBxR2N2cWZyVFpTZUM4SzkzVUJFdEF3S1dPREZK?=
 =?utf-8?B?Yy9scytpclluMnNLRERCY3I3RVJaWEM2SWpJcUd5dzFiRUFMNWNhTm1JLzEy?=
 =?utf-8?B?ZW9LVk1mVUJuS0pZMG9RTEZZajNBOE0zYWVNaEd6YzhDM0h5NzlXKy9WVWNO?=
 =?utf-8?B?REdXY3Bwazk1WlEzaU4wK25JMEZpOVNJdVh2UVYxY1p3VjV3c3pWek5qMDhF?=
 =?utf-8?B?MFc2SW52NkMrQmptNEx2N1RraWd4bSt0Y0Q5Z0d2bWo0NWNBS3VZeCs5NEJU?=
 =?utf-8?B?c1Q0N3dTaEM5M0d1Z1liSXpoSloyb2JlSWY1RXZ5QlVpUzdwY1EyaXR5UkFE?=
 =?utf-8?B?bkkxNi9yZ3Q2a1BtekVjVDdwYjlwUElFeW5nRUNMbzc5dlZ3ditMNUdKV25z?=
 =?utf-8?B?YkZQdjI1eUNQZHQ2c1RUR0c0d0NKdzNubWc1R3Z5RGRtSVAzMzl3Wlg3b2kw?=
 =?utf-8?B?SlhYNTNzeFNITVRSY0duL3d2TitRdXpMcEVZblBibW5wMlZsZTV3cDI2UEs2?=
 =?utf-8?B?aUNBTTVYcXF0aklLRVVVNFRnTEo2c0czSW8rcEFhaGFWdm1ITzNxelkzV0Jj?=
 =?utf-8?B?LzAzNmdVWCtjVmd5L0JueVZ4Z3VUcVhPVFpKVVZ0bWtzZjkyV256SS93ZlVW?=
 =?utf-8?B?ZDEvVGNSUEQzV2p1S3FyRmJUODFuLzdTaDVQZkdZcXRuNUxld1lnRzdZeHY5?=
 =?utf-8?B?TzM1eEwzZmwvc2pDM2QrWTlFMkRheGdORWRkWlpPZTgzSnNLRW5qTUE4OC9L?=
 =?utf-8?B?Ri95eFpmbUZNUHg2S3VQNEQ5dWt3bmFxWnNpdTAzRkwxdmFQTzNoRS9DajBD?=
 =?utf-8?B?dVpBQ2R3YnZTcnlZbmI5dklYZEgxUzBJWGg2bUdsVUpHZmpvaUlVazliVzFL?=
 =?utf-8?B?dlRObCtYQ1ZrdWtrN0ZudFN2cTRFMVBpTnpGTDhSNUx3Y2Y4NkRSMlI5cWVy?=
 =?utf-8?B?L2V6MGJPSXZ6MTJpVmxDV1c3N053T2VvRUZZeFNZWHdqWHVIUW1aSUh4dXoz?=
 =?utf-8?B?RTN6VlhVQy85a0U2cG5nMnZ2K3p5ZjVteEdvREV5RGlqbXdtNkZUWDhrYzVK?=
 =?utf-8?B?c25CWHcrbm1CV09TTFliR1VMaFV4ZnE1UzFHcTBML3JkU2VRd1Y3M1l1bkJS?=
 =?utf-8?B?dUpTVWlQQmNpZi9WQUE1ck54VzU0Rm1QR25Ib0I5RC9DbmxKVC9UMEsrWFR6?=
 =?utf-8?B?dHYrZk9nR3VvSkxxNVhSaHJpUHVIeUlRd0o1bUpiQXpmYU5OV0JWdktyU2Vk?=
 =?utf-8?B?UWVMM1VTWGVvdVNXU290VjlxVS83cVROTWd1aWNnZk5XQ3NnSEcyc3ZtaUs2?=
 =?utf-8?B?RW11QnllMU5OZkhOZktmU2pZWVV3THdXSHNGRm85VDZ1bmNMTFdxME1qYjlu?=
 =?utf-8?B?bEt3YzNDOFV0WW9Zc0lmb3lmWHMzb2NpdXdQM0RKK3dSZFZzSjFoRzRDWkJC?=
 =?utf-8?B?akRZSXR5QXQydTBaWmhlRGJ5aE5SOHlJSFYzTVlYeUVpeVRDNmNNVXdFVWhB?=
 =?utf-8?B?TTV6dWdNUkxjOXZjVSswRlFuWTJPTUllN3JUWUNUWXFzZUJoNnhnaDNJYzB0?=
 =?utf-8?B?Qm9GZlNubEp2NEtvNEhvVU5rbVlrRGJHYndrVndjU1BzdU5nRjdXSkZtSGty?=
 =?utf-8?B?ZXdxYzdNeTQ3a2ZrMDZXNmhqOHh1MmFrQ3FHSTlYTlh6ZDZUMGVZRWVlWkNp?=
 =?utf-8?B?NU9NZFNrdWh3NG8vY1YxdHlIOE4zLzh5RzZwdlRjYWdWOTg4ZHVFbkU2cC9l?=
 =?utf-8?B?MVJLU280dDQxekRTdERrcFF4QklORW9NVmsydE9yQmliaU9pQXpYc09qZVVJ?=
 =?utf-8?B?YnRmNG41ZnJqZnVlQzF2SHRKMVhjOW5HZXBoQWJIRjJyeWdGMWE1UjB2Mmg5?=
 =?utf-8?B?MGlDSmhXUmJiL2Jsdi9EVlpjZE1Xc3dtQXJSbVJ0VmlkOEpTeEFvdGVLMmFX?=
 =?utf-8?B?N1VKQ0VNdVZERWlSQS9CZWJMWVpSbFhXR21WYmlJY2tZSGg4Z2Z0M2w0NmNM?=
 =?utf-8?B?L2J1R0lwSnJGcUY5NDAvOUdRMVZtODRSbHlxdStiZVRpV3hjaFJMM0Y0WWkz?=
 =?utf-8?B?ZS9zblRySkNGQUV6ZWlONVorbnRkYnpYSFkvemVCbWNnVDQ0Qk1uajFZdUJ4?=
 =?utf-8?B?WGtva01DQWlvc2p6SllsaUtHWDhjdzlJc2w2cThseXZ3bmdpVWVVdDE5aUF4?=
 =?utf-8?B?czB1L3VEMENIK21DWUZVOUN3QjJoZVJRZ29OSHYrRUk5T3gzTERkSHZUOFB5?=
 =?utf-8?B?MmpMV0VnVGdLSU1zaDl1UDR5M3JxMmRSOUF6UkRCd2gyZ1BCVmlkRHhGUnlF?=
 =?utf-8?Q?RLzSIvbhrVP26hNA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F44BAE93F095A048BD9D4CB9B665EAE4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: y5VnEvL6MqeHpdlSOZULHn+EORjjUHQ3j6lRfSae+CJbOXvxdZjTTSPQsd4z9vhd+5FlLKBKUC7vu13h7j0OhPtZRSvK3+t1SaIUcXuQib+i7wYHPXp8fwfduPj8ISKzbdf/4mTQfEI576I6kCa2VW5Yigm0swANBmBb2jMm77ynzdMZA7lNAKNJPUOs+UzAg4AkBy1Ag7S5xphXehSuCDRuwI96w/9S+f1lOt36Fh6p+H1l4j2t9m7ueRWXTJMjlSLjCC9a0S3BngGnzTmjuAUbUnbikoMUh4O8t5FDxk6J8bFfJmPolAEy8tgcw8jxnKUls/wY7OLRCaLvRp9RVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0718e481-ca19-4ebe-ab69-08df255bd4fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 16:47:25.4941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wj1si4JHSAQ6XQOt+uge78EeV9OUq268SMZXsevyn+5MMmRJZv9zi2ZKFXDM9Kuh8jv8NlOmKXqgpefv8obZu1C66wZA4OGItz7y2JJOGgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9857
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI2LTEwLTA4IGF0IDA2OjAxICswMDAwLCBEdWFuLCBaaGVuemhvbmcgd3JvdGU6
DQo+IEkgdXNlIFtdwqB3aGljaCBpcyBhbHdheXMgbmV3ZXN0Lg0KDQpJIHRoaW5rIHRoYXQgaXMg
YW4gaW50ZXJuYWwgbGluay4gS2V2aW4sIFlpbHVuIGFuZCBJIHdlcmUganVzdCBkaXNjdXNzaW5n
DQpnZXR0aW5nIHVwZGF0ZWQgcHVibGljIGRvY3MuIEkgdGhpbmsgd2UgbmVlZCBpdCBoZXJlIHRv
by4NCg0K
