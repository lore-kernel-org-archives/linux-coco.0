Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E71B4F0A
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440866; cv=fail; b=EEozZUhBS7CMBVD0QJjUFKHlmR2mohOhIla8Oc4xxFpaP23iRL1rYouvU/nPyeB20I5nuscTfaM3dXma5jv0s7AHrJnKWlZUQ59tSOy72yXNVCAQ3PDFrXPXYy7SJE40YEUQ+OeFlgAIsXtsyawOHrIA/DIfHNR4AgMQjW94+fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440866; c=relaxed/simple;
	bh=8juBhCDMyfowDZB+3bO0TzJyRY27wCM1YwveFJyzLQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=baNDrlLgDiMHbtfS1/y7tJNYUpp1OxSt07U1GqmGHIoLEjZS4UFDb4YHov3/MR5hnmHzZtnUmisL9arqKH3B6C0avzYVk7bXwUIg7snWuhE8D7CX7iIkYJxFLeTDFyshQIjCmOHA15shY2bxhtc5yomnd1XFU8v8U1o36BNYflE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAQAoFFS; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAQAoFFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791440865; x=1822976865;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8juBhCDMyfowDZB+3bO0TzJyRY27wCM1YwveFJyzLQU=;
  b=ZAQAoFFSvF3PLYBQoGfdElYC7+yvenzPjEVYFkW8UCGONvEbswNWIFBU
   qmSo0SyE1tmWLZzhNtn6SUUGFYgpYXphraZGLvuOcINSdjZbm+5vhUdT7
   /jncsHoRdVAcxwsu02nDPDVGBKyjZxBC/PQ1/9/KRPQyGwVWp4V8tpr7j
   zpvNITFESUUTVFtAPo6VjXkrPholXHNc2/Y/Y3DjRtj+tCac3cVku3TaD
   T40G57zD+f5C8z2/3+xG9VfNNdeIKukYlt3dcyS3FEEObm83tapBB3ADc
   lNOhaRzsHxoTqlTp7o7S5/DaamGu6vHfE82FZdqI+wfigd5WDZpTwzLsZ
   w==;
X-CSE-ConnectionGUID: tYYnBslzQAukh3SJOL0xiQ==
X-CSE-MsgGUID: vm3gNQp6SrC+5OkIYl3RrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="223564"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="223564"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:27:44 -0700
X-CSE-ConnectionGUID: Ztg9ATcfQ5+GjKBypoj3bw==
X-CSE-MsgGUID: Em7IJE/fTnqdIR2QzKu7LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1765258"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:27:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:27:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 23:27:43 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:27:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESnET1baCXqPaZExIzi5P+7mZNP+caCAPa4gBfmZBcYgRfwW/FONu2MmL7gCBteKKF0Z63APq0NtAS3pJgMfEUWvThCV5gkuekOwRmq9hMbJ0omnDutDrCGJxk2LD0GOKIAIh9CnlSgpLrtvqY/zY4MpDq4vJD4ddSKmDfaHufHbaevh6ymBjxA+q19lp8wZlfFBMpZjaJsdNSq+UTczY2ER95LSHksSzBVQjWNTAFdh2eDFhvplFz/MFJzd0TERbuTpUxy2BtOUGdS5ZZVJZG2d2K5Ifm98y4Y/f91Ym3jz4Vhq4ZM5L68WxM/F5yCcYvaX3EP7PPCvXd4fff+Mtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8juBhCDMyfowDZB+3bO0TzJyRY27wCM1YwveFJyzLQU=;
 b=ExObqG9PMhNVHLLrkfZtsONtL7WY4Okyuo15dgDCeRYw/QmiqX1bqkPOiGjIRfC6GIqsYCyRMwelMbOjPtbenKDag7DRZH5QHFjvqM5CRLsdGdmXGdg/6Q0cwhwOl4OpWMNA+T5YUGj8F8BSszm/vx6EoV8vPjiR+APTbZjibt7LF0G2yqLTo7uw4yfppL2kcBwaUbJy8OF50QTlzcX+dSWySiBWXqilYnnmfyu8SKvcNWuWbSgByoPiJzlffI3jHTa5ZYzY9ElYtGfqdY9GMu8xakY2q7Woa+fGoP0KnXykTX1FUF+KG3f/QC80hmPDPj3Pu9UE+f0Eyx+dzdhhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SJ5PPF3F833FA49.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::823) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 06:27:41 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 06:27:41 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
CC: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "kas@kernel.org" <kas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Peng, Chao
 P" <chao.p.peng@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"jgg@nvidia.com" <jgg@nvidia.com>, "aneesh.kumar@kernel.org"
	<aneesh.kumar@kernel.org>, "Tian, Kevin" <kevin.tian@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "bp@alien8.de" <bp@alien8.de>,
	"Gao, Chao" <chao.gao@intel.com>, "aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: RE: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper for
 TDX Connect
Thread-Topic: [RFC PATCH 03/15] x86/tdx: Add TDG.TDI.RD module call wrapper
 for TDX Connect
Thread-Index: AQHdS9q5XsnTSswCpUuCn5uop/dh5Lbea9SAgBSXjDA=
Date: Thu, 8 Oct 2026 06:27:41 +0000
Message-ID: <IA3PR11MB91362C18E4C4BA2F735D9EED92932@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-4-zhenzhong.duan@intel.com>
 <fcd71764ae5d7a0e0cc2c2d2264ea5aefb3fca24.camel@intel.com>
In-Reply-To: <fcd71764ae5d7a0e0cc2c2d2264ea5aefb3fca24.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SJ5PPF3F833FA49:EE_
x-ms-office365-filtering-correlation-id: 8f4a5e13-838f-46db-e377-08df25054161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|4143699003|10067099003|11063799006|38070700021|56012099006;
x-microsoft-antispam-message-info: ZVrDpBUPU9WYZ0HIZfHrTZb17gQH3YxW7DNm9KkWXQB6YqguOiO7QW3ud5h0MMICH1EWAWkqH1paD6NcCWBOmJxE0sZvnOoZi0LBlJizI0EctheXcmCJh6Jt3+Y5xkZg85sxK/qRzdgD7iO5x+gi9xkCNZug2G03jiWRdnLiMcSTkEagm4/m1VRU3s2iBmP1vVE6BoflRULMsKehaIf3BnoMNLmIyeC8xLdXV0qrD9nUyw5YSbVZF4te+H6A91JdA9cSgIJkJYd9ebtzN6Ts3RDlSxAV+XFyl2sP5u5Ww6oH28bvwlBFMFApYKkwVSoIY9NN2hiprsc7lefzK24sC1UGj18kI5erW1PrCaPt4LSxymzN/xDfT1EjzhmYOUaJkzAe+SRtmmh2wVHUqAQbyVQ9Rj20QvwUT/cRr37G88yQu1HlZf4vfzHzwvIm0EXmmgBEFgz4sN/i5ZWRaBlUSWCTIpdnxQstq9jtlWoq/v35gA7UBtPdpSY0f3L4Zh6gGa8D82xuk5xik6qPUsXVPK6w7OXLsc99fMndxDR52tQT3AAbEzjoEHYnjCCu/o7vTauoyeDPzyP6jD9gtFPRqgux1o3JG8Kii/T8Tp2fTov0qroPidnt3hu8AvQn+iwLZ93eW8JpCLjCGKsW/Xh54dVdoTPD0GWY4iUWhq1uJrH1sql8n6IYj/kTJJbpascr3R1+a23zR/V5SbGLz3vuALyh/Ls/4WsqOjzvjEY6WSI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3drVlk0TWV5K2dvSU1YZXlRUTNobE9XNlJKdFdsRy9lbU5xNnJjYUgxMnVJ?=
 =?utf-8?B?MGxuYkpsZ1BrN1FETWlzdVBHenJxQUE0QkRGWW5pb0kxQ2dSdjN6VlNxSHg4?=
 =?utf-8?B?M0Jva0Y0RURJSTNWUEtCOXlXcEV6b29mSytJeEUxWGtsaTJmdCtHeGI4dGJa?=
 =?utf-8?B?M01KMVpJVG81Y1RXK1ZURzcvdEVmc1VRQ3U4VmM1UHBFYjhxK0NoTnUzS1hR?=
 =?utf-8?B?bmRPSE1pd3QzQmxUZUdqSnRXQkhWeXFMNWt5empkRHF4VUZEVlRqaUJuaVg2?=
 =?utf-8?B?Sm9FbkQ4TlovbEVTcm14OFNVVWRxdE5FNEFvN25kQzUvMERFbzBiUk1CQmxN?=
 =?utf-8?B?NUs1aHNJTnhjVE5DQUQ1YXlSalU0MHd2ZENDQjVUcGVtNTVNWFdobUN2c1hh?=
 =?utf-8?B?eHovUDNxYkZOZC9LM3p0c0l6VmdPeWc3cDBkNUZJNXVqNDVzdGxTR1cxZ3dU?=
 =?utf-8?B?eVFVOGVCT3dCdDQzVWZWOHU4N3hDVkJRRzRLMWRyNFZJY0k1NUpISHA2cDFr?=
 =?utf-8?B?L2VQSnB5NDFldlprT0dHNVM0U2xQcExRRkplaVVCdjVaM2ErcitFT1B6Y2sy?=
 =?utf-8?B?MXZHa0MvdTlTRWRhRG40WE8zTlBxOFdtN2pwL1ovRktHS1BteCtMQVpCTFk4?=
 =?utf-8?B?Vk1lRVdrOUlZTU9memlsMHg2OXQ2c3dDNEVjR2I0M2VkOU5GTTN1MEVuWXBO?=
 =?utf-8?B?OW5YRU8yeTZaaEtReXg4VXFrU1dUQkhXWDRoc1FWRzY4TVlPRG1GUnNteGFo?=
 =?utf-8?B?M2hBTThxRUJ4dSs5L3JCVDFWdCs4eGRSN29UaHBzTWRwbTNJWWhBYWFISFZh?=
 =?utf-8?B?TUJ3TkpRMHRuSy90Zm03elhET2lCR0lGM0xTRW5pM0M3YzhMc0ZQYUVqYnhJ?=
 =?utf-8?B?MkJNbW1DaFpJak83Q3VjbzNoK1NhZTVYUXFYOHUxaU16L2FvOEFCa2ZQajhQ?=
 =?utf-8?B?TmRWK0pnWXdZTzVLZUtybWF4WGdTbVlKWDdaSnZkd3ROdlhHY0wxZGk4bG92?=
 =?utf-8?B?aWpwL1Y5YzkzRnAyVTBSV0Jnd3I4YzgwZ09xTWtvdmFMamFlZDJWb1V4MXJE?=
 =?utf-8?B?VWpzbEtPdUsySGxoZG1Fa2FmTXF2YWNtMm1xZG9sdm8vTHA2VGZsMWFVbnFv?=
 =?utf-8?B?ck1YaWhpSHNuZjhqeXhxVWNVRS9NVDUzUUZtTlFrZkUyaCtOTWJ2cWR6K05m?=
 =?utf-8?B?MThrMmNPSTl3ZkVQZ1IrY2loSHVNZ3ptbEx3ZUZLelF4U1ZVOVFSenlkV1Iv?=
 =?utf-8?B?aGo3VkZvWmRIaTBiUm1mZ3JwdEdFaEw0QWpuY0lOZTAwNmV0V1RrRkdBd1Ix?=
 =?utf-8?B?N3Z4MGhST2tKS0hqakJyVW9hWTVScm41SW9BUjlFelhTUnVkWVpuNkVyNVZM?=
 =?utf-8?B?dDZ1TWoxTGxBRExXbDF5RHF4TG1ISWdGS2N4Sng3b1RBS3FVc1NFWUlkVmFI?=
 =?utf-8?B?YXpjS3dMZWVLOVgveG0vZ2RJVmpPL0Qvcnl0WHBlV2pZUi84WXJsMWhVTkw4?=
 =?utf-8?B?cjI4QThka1BNM2N2YWMyN2x2QnB3RTdiY2ZiR3hGa3NnVEpyT3FFQ2k1YU1K?=
 =?utf-8?B?QTJCZGlwMlZhUU9acWJMS3dNd1g3bFVzOHNUQ0MyRkwvWUpGZVhlYUNJRmZh?=
 =?utf-8?B?SnE5aGhPNUIyRXc5d013b0JkdFRWQnljdjE1RnJicXFEZHpiaG93bS8wMm1P?=
 =?utf-8?B?dTNOSnJUUitpbmo3NmxzTEtWYnVqTkl3UHFPeTMxZU9JT1BTWUYvd2t6c2N2?=
 =?utf-8?B?Smtwd2poV2c2bHhoYTNiN2picUlLajRLSlVhQTU4TFRZUHMrTEorNnBpTzFL?=
 =?utf-8?B?Wk1TVlNTb1QxQTRBVndtaXRFa0RTUTFBN2dOVW5sYnF5WC8rUDlJWEd6ZURm?=
 =?utf-8?B?L0thL0JjRnBHSFBLOURtQ2t2WHZPbnNERERvTFpFZm9JaXk3am4wTGZ3TWVV?=
 =?utf-8?B?cEp1KzE1c0p4K2ZEYm13Z0RFbUFBUzdSYzN3cmRNNFVPNCt4TExxU0NWYlh0?=
 =?utf-8?B?Z2R6SXgxMHFoQTJ0TGdvOVhmbzhuQXh1cVZ0R2R5N3NURkFucDdFaHk3TTRF?=
 =?utf-8?B?RGxXZ3U5R3JFWktPVCtUREdDRHl1VmhwUWdMU0t0QVVGWVZZNWdKUlFHeVU3?=
 =?utf-8?B?N01LNE9acmV3ZWtOajR5Q2c3bHg5WkJ5N08zQXJ0OFMxYWxHNm9NQ1JIRTJX?=
 =?utf-8?B?cHpRTFRZcks5Zk5jcW5pSDJJYzFEQ3NlRTBCMVJ0VEpucktmRldqbmUxOUtx?=
 =?utf-8?B?Q1k5eEtaeGdmbjZaUjBwT1N6SjZtdkFCZjFTekhOSW1OaFphM3EvQ05ZYVRo?=
 =?utf-8?B?elg0WGZlYUJIdHF6V01UcmJFYzA3MWJMRFlnYlBRZ2hUcnJBZFZ3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: javBpqH4i+jK/TQt+fsCakqz9aKXJuVb/jqgc0FlfeBAL9d4bk/XTSILSDCfuDQpnpUq3g7ayVPwnoOx6YYba6JomRFCt9tw9OwfQkA8f3pFCO5LUk+9cWEvTlKHvHKlNY62dTIB4pd5ZF+B62fSRmSeDQef4iZ0JGb/G1lI95k4QsYkBfHZ0RlCFgt3IFVSAYZzObyZWXCS26ZsZL7MRtj5G2J7U375PATUuZC8yhqUAJyki3aWKrYm1JLXMhLEcQAbT4QtcpOqr/zeQW2XwVj51fWWR1PELwqcxXosBfYoL+01vyk14e1Wsufu5ilYF/+qOkWap8avN60hCrgMAQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4a5e13-838f-46db-e377-08df25054161
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 06:27:41.1661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PosaNcdJ5yVreUT5qRA13AxzSDH43UDwr61g4If0EIaATiQR6Nb6sXv9S2E6CsCyd7MB6T6xmoGctnMAPhEBb5Xxd6GFigQgZ2JaM12g1Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3F833FA49
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEVkZ2Vjb21iZSwgUmljayBQ
IDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAw
My8xNV0geDg2L3RkeDogQWRkIFRERy5UREkuUkQgbW9kdWxlIGNhbGwgd3JhcHBlciBmb3INCj5U
RFggQ29ubmVjdA0KPg0KPk9uIFRodSwgMjAyNi0wOS0yNCBhdCAxMjoxMCArMDgwMCwgWmhlbnpo
b25nIER1YW4gd3JvdGU6DQo+PiAtLyogVERYIE1vZHVsZSBjYWxsIGVycm9yIGNvZGVzICovDQo+
PiAtI2RlZmluZSBURENBTExfUkVUVVJOX0NPREUoYSkJKChhKSA+PiAzMikNCj4+IC0jZGVmaW5l
IFREQ0FMTF9JTlZBTElEX09QRVJBTkQJMHhjMDAwMDEwMA0KPj4gLSNkZWZpbmUgVERDQUxMX09Q
RVJBTkRfQlVTWQkweDgwMDAwMjAwDQo+PiAtDQo+PiAgI2RlZmluZSBURFJFUE9SVF9TVUJUWVBF
XzAJMA0KPj4NCj4+ICBzdGF0aWMgYXRvbWljX2xvbmdfdCBucl9zaGFyZWQ7DQo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC94ODYvY29jby90ZHgvdGR4X2Nvbm5lY3QuYw0KPmIvYXJjaC94ODYvY29jby90
ZHgvdGR4X2Nvbm5lY3QuYw0KPj4gaW5kZXggMGM2Y2E2NTA3NzFhLi4xNDA5YjFhMzBjYzYgMTAw
NjQ0DQo+PiAtLS0gYS9hcmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jDQo+PiArKysgYi9h
cmNoL3g4Ni9jb2NvL3RkeC90ZHhfY29ubmVjdC5jDQo+PiBAQCAtOCw2ICs4LDE3IEBADQo+PiAg
I2luY2x1ZGUgPGFzbS90ZHguaD4NCj4+ICAjaW5jbHVkZSA8bGludXgvbW0uaD4NCj4+DQo+PiAr
c3RhdGljIGlubGluZSBpbnQgdGR4X21jYWxsX3RkaV90b19lcnJubyh1NjQgcmV0KQ0KPj4gK3sN
Cj4+ICsJc3dpdGNoIChURENBTExfUkVUVVJOX0NPREUocmV0KSkgew0KPj4gKwljYXNlIFREQ0FM
TF9URElfTk9UX1BSRVNFTlQ6DQo+PiArCWNhc2UgVERDQUxMX1RESV9JTlZBTElEX01FVEFEQVRB
Og0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArCWRlZmF1bHQ6DQo+PiArCQlyZXR1cm4gdGR4
X21jYWxsX3RvX2Vycm5vKHJldCk7DQo+PiArCX0NCj4+ICt9DQo+PiArDQo+Pg0KPg0KPi4uLg0K
Pg0KPj4NCj4+ICsvKiBURFggTW9kdWxlIGNhbGwgZXJyb3IgY29kZXMgKi8NCj4+ICsjZGVmaW5l
IFREQ0FMTF9SRVRVUk5fQ09ERShhKQkJKChhKSA+PiAzMikNCj4+ICsjZGVmaW5lIFREQ0FMTF9J
TlZBTElEX09QRVJBTkQJCTB4YzAwMDAxMDANCj4+ICsjZGVmaW5lIFREQ0FMTF9PUEVSQU5EX0JV
U1kJCTB4ODAwMDAyMDANCj4+ICsjZGVmaW5lIFREQ0FMTF9URElfTk9UX1BSRVNFTlQJCTB4YzAw
MDBmNDANCj4+ICsjZGVmaW5lIFREQ0FMTF9URElfSU5WQUxJRF9NRVRBREFUQQkweGMwMDAwZjQx
DQo+PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQgdGR4X21jYWxsX3RvX2Vycm5vKHU2NCByZXQp
DQo+PiArew0KPj4gKwlzd2l0Y2ggKFREQ0FMTF9SRVRVUk5fQ09ERShyZXQpKSB7DQo+PiArCWNh
c2UgVERDQUxMX0lOVkFMSURfT1BFUkFORDoNCj4+ICsJCXJldHVybiAtRU5YSU87DQo+PiArCWNh
c2UgVERDQUxMX09QRVJBTkRfQlVTWToNCj4+ICsJCXJldHVybiAtRUJVU1k7DQo+PiArCWRlZmF1
bHQ6DQo+PiArCQlyZXR1cm4gLUVJTzsNCj4+ICsJfQ0KPj4gK30NCj4NCj5WZXJ5IGZldyBvZiB0
aGUgb3RoZXIgdGRjYWxscyBjaGVjayB0aGUgZXJyb3JzLCB3aGljaCBpcyBhIGJpdCBzdXJwcmlz
aW5nLiBUaGlzDQo+bm93IGludHJvZHVjZXMgYSBnZW5lcmljIGhlbHBlciB0byBoYW5kbGUgdGhl
bSwgYnV0IGp1c3QgdXNlcyBpdCBmb3IgdGhlIFRESQ0KPmNhbGxzLiBJcyB0aGUgaW50ZW50aW9u
IHRvIHVzZSB0aGlzIGZvciB0aGUgb3RoZXIgIm1jYWxscyI/DQoNClllcywgSSBwbGFuIHdlIHdp
bGwgaGF2ZSBhIGNsZWFudXAgcGF0Y2ggdG8gdXNlIHRoZSBnZW5lcmljIGhlbHBlciBmb3Igb3Ro
ZXIgbWNhbGxzIGluIHRoZSBmdXR1cmUuDQoNCj4NCj5CdXQgSSB3b25kZXIgaWYgc29tZXRoaW5n
IGlzIGxvc3QgaW4gaGFuZGxpbmcgdGhlc2UgYWxsIGJ5IGRlZmF1bHQuIERvbid0IHdlDQo+bmVl
ZCB0byBjb25zaWRlciBlYWNoIGVycm9yPyBGb3IgZXhhbXBsZSwgaWYgYWNjZXB0IGdldHMgYSBi
dXN5IGFuZCB3ZSB0b3NzIHRoaXMNCj5iYWNrLiBJcyB0aGUgY2FsbGVyIHN1cHBvc2VkIHRvIHJl
dHJ5PyBEb2VzIGl0IGV4cGVjdCB0bz8gT3Igc2hvdWxkIHdlIGRvDQo+c29tZXRoaW5nIHRvIGF2
b2lkIHRoZSBidXN5IGluIHRoZSBmaXJzdCBwbGFjZT8gV2UgbmVlZCB0byBhdCBsZWFzdCBleGFt
aW5lIGVhY2gNCj5wb3NzaWJsZSBlcnJvciBjb25kaXRpb24gYXMgcGFydCBvZiB0aGUgaW1wbGVt
ZW50YXRpb24uDQoNClllcywgdGhlIGN1cnJlbnQgbWNhbGwgdXNlIGNhc2VzIGFjdHVhbGx5IGRv
bid0IGNoZWNrIGZvciBidXN5IHJldHVybnMsIHNvIEkgZG8NCnRoZSBzYW1lIGluIHRoaXMgc2Vy
aWVzLiBJJ20gb3BlcmF0aW5nIG9uIHRoZSBhc3N1bXB0aW9uIHRoYXQgVEQgZ3Vlc3RzIGFyZQ0K
aW1wbGljaXRseSBkZXNpZ25lZCB0byBwcmV2ZW50IHRoZSBURFggbW9kdWxlIGNvbnRlbnRpb24g
dGhhdCB0cmlnZ2VycyBhDQpidXN5IHN0YXRlLg0KDQpGb3Igb3RoZXIgVERYIGVycm9ycywgd2Ug
ZG9uJ3QgZGVlcGx5IGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGVtLiBUbyBrZWVwIHRoaW5ncw0K
Y2xlYW4sIHdlIG9ubHkgbWFwIHNwZWNpZmljIGVycm5vIHZhbHVlcyB0byB0aGUgVERYIGVycm9y
cyB3aGljaCBhcmUgbW9yZSBjb21tb24uDQoNClRoYW5rcw0KWmhlbnpob25nDQo=
