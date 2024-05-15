Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6EC59154
	for <linux-coco@lists.linux.dev>; Wed, 15 May 2024 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715768421; cv=fail; b=uaA+UWjrdKHIgJTBZ1VoS8g5L5whKx5brdjjeHf7QsP6iWawMxoAdIuWFNRho+sv1K/S4d6ITacXBMPFhTYOAIUEy2Wt1/bjFPulyFYGfPBnhTKTkeOPjuPiCXBkyW1lsud/PeKqhAgghSYAu0PrOt7N9QxadGZ6J/6u+z1Uws4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715768421; c=relaxed/simple;
	bh=NENhinFFN7EsO9zqxcah6JFyyR8xKll1QBSEPl7Ls6Q=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SuGWpdELKmIILR3hl8vV0iZiy/H3SmNnu4alCwSE4QzgarMM7tvsrZ+X224U/ED+i8/Fl+h0YMWlJX+cygqKjYnqd1XmO7Z0I8EFJ55SN7itv5Wnd72vYLEvCs0P84YFUx2vkuRnBKv2HqiqSh9ZBQIAEz4Uvdizt9aAN1jjpD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFkMC1/I; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFkMC1/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715768419; x=1747304419;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NENhinFFN7EsO9zqxcah6JFyyR8xKll1QBSEPl7Ls6Q=;
  b=eFkMC1/ISpjNCCdzB+fb1xAr8V9novt4um4QnlHFHITVeA/pJqvEAU2p
   BXVMt38VUG2aVtshp9u7viR5MIvfH+AMz5Sf5esl2/a+XajBfaCdLpHI2
   98cjHQYluVj+7JK6aa0HJF00YtXQhq19MF8qsyk/9R5qHUG46QnnEBb3+
   gKOc3TkXwMVWKXsIn9hrTO0BZy/IunMK+YSfCWZ3IoDWB01hRyrdqDneW
   GsNFpBhF4vv25uohEA73ab/DGsX42ArSamA8cTFtMHY5kY38My+5/h5Lc
   e4N9CBAu3u83MH3eZY1Ty9Rtw8giEpwtarhaxvr8yVwWGBJ7k04ZNDWrY
   Q==;
X-CSE-ConnectionGUID: wj/JbnIMT4SMa5v5Faudtg==
X-CSE-MsgGUID: y03kHOtLQ0e6Zzkm0J92mQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="37183449"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="37183449"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 03:20:19 -0700
X-CSE-ConnectionGUID: QRD2YyBWQ+OZRKn89f8Ozw==
X-CSE-MsgGUID: YxKGJCn5RIuDL6xFJgSnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="35711358"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 03:20:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 03:20:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 03:20:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 03:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgamiT2MRrnuWvG+8P1eKNTTDdUGsI4HgaG+rbSwsBqBSXWsdR1vSJfhctBwPjI+cSGSGgHP+kj6t6h4dt4O2FNFoGcuhotZMiBuqlFKKWAjiHV9UKwTbc7zytSEMHBYh26+i1ktFKo0PpfIWr4A5hR5rbhv/WO5vtCX1byuW5DjY/6MFB+ejKDWbLq9W+UiJ9W/CgECijihSfv+o2wIY1qGsx0wRKPCkUiSjs4SAG84WpRw+AK6rJwOtof28CP5Q+Wa60vI1z2qDHPoBuol6yLbDVR7e0Hwj5pzv6WEXKCfIGadFi+IqLeT81yura7K4Kz3ut3eDo4Zs51qOjQZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NENhinFFN7EsO9zqxcah6JFyyR8xKll1QBSEPl7Ls6Q=;
 b=ofrmo67bGMOwgN9lNfKXn47d34nXLJBVSjBZUXK256RwGr7UCYVrjZYI5Gk/3rsClQCgxq8Ca8uCLERuwpoknMuJ/q3XMGEeaUyQO7vNetvZf7zJaROBDbLTUSDxyqmkSYYhjFalRfKjDHUZz93mmTmQxZrnrKiiCU3vs5GuTa8FKADVKLO0rkcnXWWxJ6OcAv6jlNWHyxaj+gGMS3l32KphSpPpbTP/5GmOEeGEbjvYtJEh82uxkYOQ7Rj4WBd9waSp+GejJa56VBpXacyuabJYOxjZ1l5wj9Oz1L6/VPufPqzUtppkcumS88MbH9WOn5/qdYO7R7MVh2MC9k0UVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 PH0PR11MB4935.namprd11.prod.outlook.com (2603:10b6:510:35::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.26; Wed, 15 May 2024 10:20:16 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 10:20:15 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: [svsm-devel] Development Plan Document
Thread-Topic: [svsm-devel] Development Plan Document
Thread-Index: AQHaosNMU4SbFNvs80KUhczt4nv5QbGWdneAgAGXFJA=
Date: Wed, 15 May 2024 10:20:15 +0000
Message-ID: <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
In-Reply-To: <ZkMpkfepqUWfq1RY@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|PH0PR11MB4935:EE_
x-ms-office365-filtering-correlation-id: 5095f7b1-642d-4641-2abf-08dc74c89d1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?azgrK2kyakwyNkJaVExPcTE0R2JkZmxxUjZqTjNPZ0VnQlJuS1lnamhxUktm?=
 =?utf-8?B?RDhDOEEyb1hJUTR5a3dKa1EvRXhSck43RHk5OGVobHVVakdtMkFxc1pnMjFB?=
 =?utf-8?B?RHByc3RBNk5sOElxeTQ3RWdaV29BT1RQZWlxOWdyRWtneVNqUjJZZXlVKzVD?=
 =?utf-8?B?L1Uvd21ZbFVJTW54TngrN3ptQ0JHL1pacXFVMFIxdDRoRUlHTWpnQWxJOERF?=
 =?utf-8?B?VDM1S3E0emQ1SGx5TC80RTVhYWxFUWNOTlBvWTdKVnI1S2hheVpOcFhvZUpt?=
 =?utf-8?B?eHhLdUZDZjZoWVpOQkNFRysxMjB3ZW40S0pwbkN6ZW5uMXd1SVd5emdxR2FW?=
 =?utf-8?B?L3VSZUY0L1ZYNHFIZkFLdlFtV21mL0JDUUVkajRMeEg5TVQvbDZaTUpRUHUw?=
 =?utf-8?B?eW1pTVl0cGdiendQeEpMMC9ZSFBMOVBLOGNaUlVLbW5ZQU96anIwd28rdmFs?=
 =?utf-8?B?WHJzZmZ5akNNWU1RV2lCOStEaUhHbXhjZE1XOXpkVkhmQ3lRTi9BZ2tuMTVW?=
 =?utf-8?B?dmFNNXdjM3J0Wno2YUMwTGxBZW1kbXpqRTdjdDdrdUJPbWpMN1NXTHd6Skkw?=
 =?utf-8?B?WDB0MW5uUFl1ajZRcnhrdjZwem5pbTRYbWY1NDhzb2RDSjRmREF5Ry9LdlBR?=
 =?utf-8?B?cFczdDcwUitUa0RNRk9uNzNlcDgzSFBHOTRQYnFSMUVxdUJNaFE2dExrUzZj?=
 =?utf-8?B?em5hT2R3V3plRTc4cXl0NUdaczh1cG9FdzIyYjBSeHhOR3o2RzJaVlcwdlhT?=
 =?utf-8?B?cGhaNU12REp4eEhwTm1Na2krNTBRT2RkWjE5RTJ6Y1VnSHA2SEluTjM1Z0lU?=
 =?utf-8?B?OVprVkM2NmFTaFhvWHBCdGx3Yzc2L1MxK0hwdzlGYjlxYUprM2NlSmMxQVhZ?=
 =?utf-8?B?blhKbURMTGlYbkZmbHRtU1Rzb0p1anVDUmd4OG83ZXEvZGtnQzJLSG5JNjR3?=
 =?utf-8?B?SEwySkZVRzhkM1R1ZzNDUXlkTS9sRDJGb1lGYXIzbGUvaDIwNEttVHNINHgw?=
 =?utf-8?B?eDlnZDNaREFYTXpiQUo0RWF4RUNOeXpBQnRzaWNHWHBDTXJVeDZlVFFtSXp0?=
 =?utf-8?B?TGVYUUNjOEdpSjQxTFV5QzcrdXE4dHJ1N3RCbHkyd1Q4OFRZenlBYTMycUJr?=
 =?utf-8?B?Z2xqUmJDWUdoa3lhRXRRL1RYajNIejVyOEhzeDgrSFJyektPRXFqS2Z4L1F1?=
 =?utf-8?B?d2NFNEx0c0RwcnVvcEcwOStxSkFxMTNzdmQrMUhoeEQ1YVVJVytsMUFKUllw?=
 =?utf-8?B?bTJyV1ViOC9WdGppMVFxTmpFUzdnTjQ2NWJHb090aGNjR1h0N2daTm5valVM?=
 =?utf-8?B?aFY3UFlrcUFIbGE5Q0FhUllld0h5VjhnRmd5VStsVmR6dEc3eWpVaHNvM05o?=
 =?utf-8?B?bmRzbHc3U2NXcWwyRHJOZVlmZEpuWEN4NXZDaGdoaU1NNFVWUTdoU3hHNkcr?=
 =?utf-8?B?Rk5ady9ueGpSM3kxaWhHSDd5WWJqTUljcjFUcGJvOU9yTlNYbE1HRHY4bDVI?=
 =?utf-8?B?SEtFcnFiV0l5amNSdkVXVy90dlpnd2xncVFxMDUxNDVlY2F4QTVBSlpaYXA1?=
 =?utf-8?B?a3lpSEloMHU5SGxwc0paazVYRFlRakJKTi9OUzJtazc2b1ZmTmFGV044d2x4?=
 =?utf-8?B?Nm5UeTVJSDYvWUdKazlIU2dYekhCTEtmZ01ZMUQ5Y1lIMGF0RUc5UnNWWW4v?=
 =?utf-8?B?eGthMENPVUJiQ2NubEdyQlVpYms5aGs0QWt0Y3FJVHd4Sm9na2JvY0ZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWE1bUtUOUVjWGJuazNnZ1B2OEU2UitzWnFMaEwzQjJWSENOQzFvUE45dTdj?=
 =?utf-8?B?bEtzTHBEaWJCUVJoaDNaU0ltbnVwc2VlTFBsMDlVNW5ITnZHL09YRGNUL1V0?=
 =?utf-8?B?QUlHdjBORzBNMXlyTXBBeTlENEVnUmUyb1VuNml2M2Zub25Lc1Q2QkNNQ1VJ?=
 =?utf-8?B?c3BnRUdkeTJRUnBKejNyc2hBTmZhc0RscG1VUXgxWERRWGdOUngxQkNpZFY3?=
 =?utf-8?B?N21Hc2hubGRTWGlvNmd3VGsrWG13U2FrbTZBbWtNM2ptNUVCWXRGUzRzY3Vx?=
 =?utf-8?B?OHhDRnNMMHFXVW9GZ1VPOTJkNytCN1hCTnFaayt5TElZN0dtdzNhU2YvNjdR?=
 =?utf-8?B?MzZXeGt2YlRMOXR6RzlqN1d0RmtVdm1WaXFVWjVpWHlSckZjMWQ0NGZpbzB4?=
 =?utf-8?B?S1pUdG5ZOUZ3UW9HdXp2MTJpUEN5elFrcUoyV0IyZks5c3BPbFBRUEk3dFZu?=
 =?utf-8?B?dVQwaWtKMXUvNUR2cFF6bGRpTmdQY05nalNIRUhDUXgrVTZNTDVORlBpKzU2?=
 =?utf-8?B?TDM1RlhrVlgwNnJycUk3ODB2V3hNQVZpaCs3VGo2UDNPdnJJWlM2aHIxNmY4?=
 =?utf-8?B?eXgyNzkvaDNrZnR0UEZseE5tUjJwUnVxbGtVMzhIbFVqNDY4dGdQM25ZVU5q?=
 =?utf-8?B?b3FCYkFOMEdqbkE0T002d2VTSGV4RzVSWjY0S1cxVWxEbVVOc2ROS1dnWnhJ?=
 =?utf-8?B?MXlheEFlUVhrZWtpQjQwc1ZSaDV3bHd2bERSY0o5RWpNWE91RkoycUV0SE90?=
 =?utf-8?B?WWp0UFIySWlkM2ZEWXZPQUJrOTVLNkl4RlBJeFlUL0RKYUNUeTh1TVdkcEND?=
 =?utf-8?B?a0tvYUFIUmp6RFF1VDNpb2c2RUlkL2xBZjFENjBPUlFVS1Biby91Qit3K09x?=
 =?utf-8?B?emx6N0wzU0xLdllGdGV1TStxV2RRdXp5MEJldnhFS1p4OW5KSGh0bVdRMkJi?=
 =?utf-8?B?M2NoU3F6L3lGaUlyaHVqNGJpNW53UUFqdG5zbk15MWt1US9qUEtselFOdTla?=
 =?utf-8?B?K3RRZVI1LzQzanpraG9QTFFuYnZMZ2kwdVozSUM0ZkdDcGEwZS9lczd5b1Y1?=
 =?utf-8?B?Zk1WdDMzeUd6bTl6c1R0aEhWaDVzNHpxWGhCUlhIT0V0OUZrNEFBaC9NVThz?=
 =?utf-8?B?aXQ2TnJSbzJkMFh1RU5YUzE5Z2tLSVd2TFR3MFFhK09tMmRWWFB2MTNvZWFK?=
 =?utf-8?B?c2lKdzR5cHZKQVJjT29HZUUxQi9VbnhGeW1Pby93TVVSRUgrcHBZZzNKcnhD?=
 =?utf-8?B?UDQ4QS9ERi9Ec09zdzdLRjJiVFhmdWpQTmVZWWhOTDI1TzVuQThqQ09lODQ4?=
 =?utf-8?B?N3VPNTJZQzF6QVBiS0tvc252RFlSdGgzRDdFSVA2QTdsNTNHR29KejNITWVw?=
 =?utf-8?B?UHF0a21JcGliYUcvNXRiSXcyZ0lPK3NPTFByS1EvTk1OeHRRQWxEaTJ3ZERU?=
 =?utf-8?B?ZUxwSzIzd3FEMGJ3SXo3Y3V2VkZXc2R2blc2UVFocmlvV2xsNXRtTlZoRlN4?=
 =?utf-8?B?SWl2ZllPQ1hZbWJVUGppM3BSdmJDaVhGd2c0VnRmTDBLMWpXWkN3STVUOFNV?=
 =?utf-8?B?UXRjaERqajlYTTFGQWNocTdNczQ0aXlFd01PNHppWUJvNy9JdjBzUkhIdzhp?=
 =?utf-8?B?bDh4azhKT1BtUy9BZHhYRWpUNU9IQXNCMkNVTnhybmJnMUE3b2ZMNlkxZEdh?=
 =?utf-8?B?aDhsUC9Ha1JjdjFlak1tMHZJZng4S1I5ZE1iT1Z1RWh0UVVhTnNYUkZ3OXVm?=
 =?utf-8?B?WHd5M01kSzFLR0lrcnNFNzJDZHNreW82bFN2dkczczZ4RExiVjQxVW5kTS9S?=
 =?utf-8?B?dU9QdWNERFBhWFo2Sm95cGRQRHdJSVRQV0VJNitxMzFiajgwbXhrWUFmUjQx?=
 =?utf-8?B?TW5FMG81dWtxNGdSbGdCZWRZVE5wUmY0Qkc3UFRQbW5pK201ZU9udUsydXdi?=
 =?utf-8?B?Wm13emRhU3FMcTFGSkFLNExNaUFQclhhQmFwM1RDVWlrUTErbnVMQXdlWktt?=
 =?utf-8?B?cGtIMDcyWXErZEljVVZNTHNvU29NU1ZHc1A4T3pidXppbGhCK3V5UG5CYW9B?=
 =?utf-8?B?WVpUb25QWUZPZW9GOURudGZWTHRmVWdvVFZBR0pqV0FPaFZnb1VIN2Nza1lT?=
 =?utf-8?Q?druAR1l6EENuCqJB6nKVcyc27?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5095f7b1-642d-4641-2abf-08dc74c89d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 10:20:15.7548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8t4ZziKT9Kw/T1m6UYadJbYEfloyvPag4duRKDPAciyBom/E3ic7sC2fkuXdkDKR5uf+8p/g1pyCnPXipeGwU2CubmizD4ofWWqySIrNnAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4935
X-OriginatorOrg: intel.com

IA0KPiBPbiBGcmksIE1heSAxMCwgMjAyNCBhdCAxMjoxNzoyNlBNICswMjAwLCBKw7ZyZyBSw7Zk
ZWwgd3JvdGU6DQo+ID4gVGhlIGRvY3VtZW50IGlzIG9uIEdpdEh1YiBpbiBNYXJrZG93biBhbmQg
UERGIGZvcm1hdDoNCj4gPg0KPiA+IAlodHRwczovL2dpdGh1Yi5jb20vam9lcmdyb2VkZWwvc3Zz
bS1nb3Zlcm5hbmNlL2Jsb2IvZGV2LXBsYW4vZHJhZnQtDQo+IGRldmVsb3BtZW50LXBsYW4ubWQN
Cj4gPg0KPiA+IAlodHRwczovL2dpdGh1Yi5jb20vam9lcmdyb2VkZWwvc3ZzbS1nb3Zlcm5hbmNl
L2Jsb2IvZGV2LXBsYW4vZHJhZnQtDQo+IGRldmVsb3BtZW50LXBsYW4ucGRmDQo+IA0KPiBGWUks
IEkganVzdCB1cGRhdGVkIHRoZSBkb2N1bWVudHMgd2l0aCBhIG5ldyBhZGRlZCBzZWN0aW9uIGFi
b3V0DQo+IHByb3Bvc2VkIGNvcmUgY29kZSB3b3JrIGl0ZW1zLiBUaGVyZSBhcmUgdGhyZWUgbmV3
IGl0ZW1zIHRoZXJlIGFuZCBJDQo+IG1vdmVkIHR3byBvdmVyIGZyb20gdGhlIFNlYyBzZWN0aW9u
Lg0KDQpIaSwgDQoNClRoYW5rIHlvdSwgdGhpcyBpcyBhIGdyZWF0IGRvY3VtZW50IHRvIGhhdmUh
DQpTb21lIHF1ZXN0aW9ucy9jb21tZW50czoNCg0KMS4gSSB3YXMgc3VycHJpc2VkIHRvIHNlZSBh
IFNlcnZpY2UgVk0gbW9kZSAocGFnZSA0KSwgYmVjYXVzZSBJIGhhdmVu4oCZdA0KcmVhbGl6ZWQg
dGhpcyBpcyBiZWluZyBjb25zaWRlcmVkIGZvciBDb2NvbnV0LXN2c20uIElzIHRoZXJlIG1vcmUg
aW5mb3JtYXRpb24NCm9uIHRoZSB1c2UgY2FzZXMgYmVoaW5kIHRoaXM/IEkgY2FuIGltYWdlIHRo
ZXNlIHVzZWNhc2VzIG15c2VsZiwgYnV0IHdvdWxkDQpiZSBncmVhdCB0byBrbm93IHRoZSBvbmVz
IHlvdSBhcmUgdGFyZ2V0aW5nLiANCg0KMi4gU2VjdGlvbiA5LiBDcnlwdG9ncmFwaHkgc3VwcG9y
dC4gVGhlIHJlcXVpcmVtZW50IG9uIHRoZSBpc29sYXRpb24NCmlzIHNvbWV3aGF0IGNvbmZ1c2lu
Zy4gSXQgcmVhZHMgbGlrZSB0aGUga2V5cyBvciBjcnlwdG9ncmFwaGljIGFzc2V0cyB3b3VsZA0K
bmV2ZXIgbGVhdmUgdGhlIGJvcmRlciBvZiB0aGUgY3J5cHRvZ3JhcGhpYyBtb2R1bGUgKGV2ZW4g
aW4gdGhlIA0KZW5jcnlwdGVkIGZvcm0/KSwgd2hpY2ggSSBhbSBub3Qgc3VyZSB0aGUgcmVxdWly
ZW1lbnQgYXBwbGljYWJsZSBmb3IgYWxsDQp1c2VjYXNlcy4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgZm9yIHRoZSBzdGFydCB0byBkZWZpbmUgdGhlICpwdXJwb3NlKg0Kb2YgdGhlIGNyeXB0
b2dyYXBoaWMgbGF5ZXIgaW4gY29jb251dC1zdnNtOiBpcyBpdCBqdXN0IGEgc2V0IG9mIHNlY3Vy
ZWx5IGltcGxlbWVudGVkDQphbGdvcml0aG1zIHRvIGJlIGV4cG9zZWQgZm9yIHVzZXItc3BhY2Ug
b3IvYW5kIGtlcm5lbCBwcm9jZXNzZXMgdG8gcGVyZm9ybSBuZWVkZWQNCmNyeXB0b2dyYXBoaWMg
ZnVuY3Rpb25zIChsaWtlIHdlIGhhdmUgY3J5cHRvIEFQSSBpbiBMaW51eCkgb3IgYSByZWFsIGNy
eXB0b2dyYXBoaWMNCnNlcnZpY2UgaXMgZW52aXNpb25lZCB0aGF0IHdvdWxkIGJlIG1hbmFnaW5n
IHRoZSBrZXlzIGFuZCBleHBvc2luZw0KY3J5cHRvIHNlcnZpY2VzIGJhc2VkIG9uIHRoZXNlIGtl
eXM/IElmIGxhdHRlciwgc3VjaCBzZXJ2aWNlIHNjb3BlIG5lZWRzIHRvIGJlDQpkZWZpbmVkL3Nw
ZWNpZmllZC4gDQoNCjMuICJJbXBsZW1lbnQgb3IgcG9ydCBhIGNyeXB0b2dyYXBoeSBsaWJyYXJ5
IHRvIENvY29udXQtU1ZTTS4uLiAiLiANClRoaXMgaXMgZ29pbmcgdG8gYmUgdHJpY2t5IHRvIGdl
dCByaWdodCwgZXNwZWNpYWxseSBnaXZlbiB0aGUgZnV0dXJlIGFpbSBmb3IgRklQUw0KY2VydGlm
aWNhdGlvbi4gSW1wbGVtZW50aW5nIGNyeXB0byBmdW5jdGlvbnMgZnJvbSBzY3JhdGNoIGNvcnJl
Y3RseQ0KaXMgcHJldHR5IGRpZmZpY3VsdCwgc28gdHlwaWNhbGx5IHdlIHRlbmQgdG8gcmVseSBv
biBleGlzdGluZyBsaWJyYXJpZXMgdGhhdCBoYXZlDQpiZWVuIHZlcmlmaWVkIHRvIHByb3ZpZGUg
YWRlcXVhdGUgaW1wbGVtZW50YXRpb24uIEkgd291bGQgc3VnZ2VzdCBoZXJlIHRvDQpidWlsZCBh
IGxpc3Qgb2YgY3J5cHRvIGFsZ29yaXRobXMgdGhhdCBpcyBlbnZpc2lvbmVkIHRvIGJlIG5lZWRl
ZCAoc21hbGxlciBsaXN0DQppcyBiZXR0ZXIgYW5kIHByZWZlcmFibHkgdGFraW5nIHBvc3QtcXVh
bnR1bSByZXF1aXJlbWVudHMgaW4gYWNjb3VudCkgYW5kIGJhc2VkDQpvbiB0aGlzIChhbmQgb3Ro
ZXIgcmVxdWlyZW1lbnRzKSBtYWtlIGEgc2VsZWN0aW9uLiBFdmVuIHdlbGwta25vd24gcnVzdA0K
bGlicmFyaWVzIGxpa2UgcmluZyBsYXN0IHRpbWUgd2UgY2hlY2tlZCBkaWRu4oCZdCBkbyB0aGlu
Z3MgbGlrZSBwcm9wZXIga2V5IHplcm96YXRpb24sIGV0Yy4gDQpBbHNvLCBhbnkgY3J5cHRvIHNv
bHV0aW9uIHdvdWxkIG5lZWQgYSBzZWN1cmUgY3J5cHRvZ3JhcGhpYyBSTkcgd2hpY2ggaXMNCmdv
aW5nIHRvIGJlIGEgc2VwYXJhdGUgcHJvYmxlbSBvZiBpdHMgb3duIHVubGVzcyBldmVyeW9uZSBh
Z3JlZXMgdGhhdCB3ZSBjYW4NCmRpcmVjdGx5IHVzZSB4ODYgcGxhdGZvcm0gcHJvdmlkZWQgUk5H
cyBvciB1c2UgdGhlaXIgaW5wdXQgdG8gc2VlZCBhDQpjcnlwdG9ncmFwaGljIENQUk5HIChMaW51
eCB1c2VzIENoYUNoYSBidXQgd2l0aCBGSVBTIGNlcnRpZmljYXRpb24gaW4gbWluZA0KdGhlIG1l
dGhvZHMgZGVmaW5lZCBpbiBOSVNUIFNQIDgwMC05MEEvQi9DIHNob3VsZCBiZSBjb25zaWRlcmVk
IGluc3RlYWQpLiANCg0KNC4gU2VjdGlvbiAxMi4xLiBVc2VyLW1vZGUgc2VjdXJpdHkgRlcuIEkg
Z3Vlc3MgdGhlIGFpbSBoZXJlIGlzIHRvIGNyZWF0ZSANCmEgTWFuZGF0b3J5IEFjY2VzcyBDb250
cm9sIEZXLCByaWdodCAoYmFzZWQgb24gdGhlIGNvbW1lbnQgYWJvdXQgU0VMaW51eCk/IA0KVGhp
cyBzZWVtcyB0byBnbyB0b2dldGhlciB3aXRoIHNlY3Rpb24gMTAuNCBmb3IgZmlsZXN5c3RlbSBw
ZXJtaXNzaW9uIG1vZGVsDQp1bmxlc3MgdGhlcmUgYW4gYWRkaXRpb25hbCBEaXNjcmV0aW9uYXJ5
IEFjY2VzcyBjb250cm9sIGlzIGVudmlzaW9uZWQgZm9yIHRoYXQuIA0KDQo1LiBTZWN0aW9uIDEy
LjI6IGJ5IGRvdWJsZS12YWxpZGF0aW9uIHlvdSBtZWFuIHRoZSBjYXNlIHdoZW4gYSBwcml2YXRl
IHBhZ2UNCmlzIGFkZGVkIHR3aWNlIHRvIHRoZSBDVk0gKHJlYWNjZXB0IGluIFREWCB0ZXJtcyk/
IA0KDQo2LiBzZWN0aW9uIDguMS4gU3lzY2FsbCBpbnRlcmZhY2UuIEZvciBURFggd2UgaGFkIHRv
IGJlIHZlcnkgY2FyZWZ1bA0Kb24gdGhpbmdzIGxpa2Ugc3lzY2FsbCBlbnRyeSBhbmQgb3RoZXIg
Y3JpdGljYWwgcGxhY2VzIGluIExpbnV4IHRvIG1ha2Ugc3VyZQ0Kd2UgY2Fubm90IGdldCBhICNW
RSBldmVudCAocHJvYmFibHkgdGhlIHNhbWUgZm9yICNWQyBmb3IgQU1EPykgaW4gdGhlDQptaWRk
bGUgb2Ygc3dpdGNoaW5nIGJldHdlZW4gdGhlIHVzZXJzcGFjZSBhbmQga2VybmVsIHN0YXRlLiBU
RFggcHJvdmlkZXMgc29tZQ0KY29udHJvbHMgdG8gZW5hYmxlIHRvIHByb3RlY3QgZnJvbSB1bndh
bnRlZCAjVkUgd2hpY2ggcHJvYmFibHkgd2lsbCBiZQ0KdXNlZnVsIGZvciBjb2NvbnV0LXN2c20g
YWxzbyBhcyBhIHNlY3VyaXR5IG1lYXN1cmUuICANCg0KNy4gU2VjdGlvbiA4LjIuIFRoZSBpbnN0
cnVjdGlvbiBkZWNvZGVyIG5lZWRzIHRvIGJlIGV4cGxpY2l0bHkgc3RyZXNzLXRlc3RlZC8NCmZ1
enplZC4gV2UgYXJlIHN0YXJ0aW5nIHRvIGxvb2sgaW50byB0aGlzIHByb2JsZW0gZm9yIExpbnV4
IG5vdyBzaW5jZSB3ZQ0KbWlnaHQgbmVlZCB0byBhbGxvdyB1c2Vyc3BhY2UgTU1JTyBkZWNvZGlu
ZyBpbiB0aGUgVERYIGNvZGUsIHNvIG1heWJlDQp3ZSBjYW4gcmV1c2Ugc29tZSBvZiB0aGF0IHdv
cmsgZm9yIHRoaXMgb25lIGhlcmUuIA0KDQo4LiBPbmUgaXRlbSBJIHdvdWxkIGFkZCBpcyB0aGF0
IGl0IHdvdWxkIGJlIGdvb2QgdG8gZG9jdW1lbnQgYW5kIGNoZWNrIA0KdGhhdCBhbGwgcmVsZXZh
bnQgKG5vbi1keW5hbWljIGFuZCB3aXRoIHBvdGVudGlhbCBzZWN1cml0eSBpbXBsaWNhdGlvbikg
aW5wdXRzIA0KZnJvbSB0aGUgaG9zdC9WTU0gYXJlIG1lYXN1cmVkIGJ5IHRoZSBDb2NvbnV0LVNW
U00gY29ycmVjdGx5DQppbnRvIHBsYXRmb3JtIHNwZWNpZmljIGF0dGVzdGF0aW9uIHJlZ2lzdGVy
cy4gVGhpcyBjbG9zZWx5IHJlbGF0ZXMgdG8gMTAuMSwgYnV0DQppdCBpcyBub3QgYWJvdXQgdGhl
IGhpZ2hlciBsZXZlbCBhdHRlc3RhdGlvbiBzZXJ2aWNlIGJ1dCBhYm91dCBob3cgY29jb251dC1z
dnNtDQptZWFzdXJlcyBpdHNlbGYgYW5kIGl0cyBvd24gYXNzZXRzLiBJZGVhbGx5IHRoaXMgc2hv
dWxkIHdvcmsgd2l0aCBib3RoIHZUUE0NCnNlcnZpY2UgYXZhaWxhYmxlIGFuZCB3aXRob3V0LiAg
DQoNCjkuIEkgcmVtZW1iZXIgaW4gcGFzdCB3ZSBkaXNjdXNzZWQgYWJvdXQgQUNQSSB0YWJsZXMg
cGFzc3Rocm91Z2ggdmlhIGNvY29udXQNCi1TVlNNIGFuZCBnZW5lcmF0aW9uIGluIHRoZSBDb2Nv
bnV0LXN2c20uIFNob3VsZCB0aGlzIGFsc28gYmUgbGlzdGVkIGZvciBkZWJhdGUNCnB1cnBvc2Ug
YXMgaXQgaGFzIGl0cyBvd24gYmVuZWZpdHMgYW5kIGNoYWxsZW5nZXM/IA0KDQpCZXN0IFJlZ2Fy
ZHMsDQpFbGVuYS4gDQo=
