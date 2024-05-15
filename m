Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A9219E8
	for <linux-coco@lists.linux.dev>; Wed, 15 May 2024 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715774694; cv=fail; b=DU9cT9gJ5cAUrGADEyVL/rHKxFmOLq3AFQqflkNHnFXk71sh4NXRaZRRLreGXGvqQ/4xgIK7ap55gz7K3EsRly1PK5WibzNMCOfsxX/sAtolMTgEWq34uZJsUh7PZM2wLYamJWG7Rky2hLgLPoG2T7dZlDSSLSinzQX3jUwYQzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715774694; c=relaxed/simple;
	bh=WftkYAOxIjzUD6VRfTXI/wJzBd26B0sDK7LTGJZ7crg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GZ8I2Mh4F2s7sUg1rY78Pfvvbzk7n5m69yK1XXkqaIWAkfbhiJ/eb4G2FbL5Pna5+rHz+fSkH/vDj43ucrplfo6Cy46+/TICIBVppggnVg0fJ6eB9qQSw/y7g5pSTtZeMkVw5A/b1RJljp0TOXTjFKwT3mMHcqj6ZIQMndqha24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apUc6qb0; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apUc6qb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715774693; x=1747310693;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WftkYAOxIjzUD6VRfTXI/wJzBd26B0sDK7LTGJZ7crg=;
  b=apUc6qb0F5bQU1QESWWBn7XZiuI/Vr9OhlzlP09q+m9MRBlSCBZfuB0Z
   vyLAFfsQ4KphbIqgt1Io912vkrAHReL/JEZLdlLpryoUOMpLOisv10Vhy
   NTQT551xauHCC5d0i3niUB+h1itKL1bFEh3FaXFm5C1XYqY/Ku1o/Y34f
   dRmUTWq65z7MCFI8ijsvCuloTRQTz9Roa8rTUSBPloVNmWdSNKfRObXdL
   ZqjuP2Fch4cEl4NERAvrhS0cQqtYbm8JpSFn+4rdnIVqVjXZ7QYbYTuNK
   HYqGOy/WTPMs1nhWYB1XBlx12DyFwstSpoozkXI+gURPEGbWOQfW/IkbT
   w==;
X-CSE-ConnectionGUID: /RmghS4fTy6LVBj448smRg==
X-CSE-MsgGUID: EcsBRo7nTA2MQn1eWexQaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="22488263"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="22488263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 05:04:52 -0700
X-CSE-ConnectionGUID: /OL3GlsVShC4TkfU/XlSnA==
X-CSE-MsgGUID: Kwl49O8dTIyMutZKgJNnpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="35911830"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 May 2024 05:04:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 05:04:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 15 May 2024 05:04:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 05:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myLZfkX4OzrZQEJAetDn6fIExnd+M5euMtUaX+lGCC9OrSfDtuF798tm25U2sK0b+tgBqnFJoTqMN3svt1ESU40eRwd6XKr0ICMJQwZAg94BlZ6PnTRBU4GEROnj83y3+eTzs0NbrLFH+1lv7sZDkJ1OivahVoIhgqrFFWUHV+PbdJCll+ji2ERJq7u/rUmK3fyLySlwdzNanJ7afqPn8gLjSD8Mv+oL+eEhZgbJN1IRTUczY4+1nh1Izpa4rxtXK0i3Xjq+yQVbmiOed76dLWhZMs4CFvcs9hxUjaeqJsh+OiH8S3nczn0rCnZJqeYpNsJKoeHxUqEIq4jzZnKXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WftkYAOxIjzUD6VRfTXI/wJzBd26B0sDK7LTGJZ7crg=;
 b=IgaMjUT6RC+IS2ifOaOF7uDfRdX2H3n/24Y4HDoQhJ7EnvhUTsprxTA8xeJNkmhBBg2RlCQ0WDw/YwgtwzvWnbKuJAEK83mqGjfhDJ1VihPNPdNGX4j2mA1evQOD60/IVchCu8pn+5F2XrLkwRENltENt4cbDk2NXeaZK7tS1ns/8FXqwgZXoNLTY13X0/XREcS2N509lTJbzn/MlOCbclXi5IKO1fPtrynFfkBc+UF4anydflyiD4xG9xYe0IKpixEObu0SqvAiMVsEszoMjhvl3vYspGkxIyqdGB9KWD8iHhkHuINULLxzZ0VtiHl2IUIFJjNGN3NlMsUHRRJPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Wed, 15 May 2024 12:04:47 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::9958:681d:b39f:94aa%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 12:04:47 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: =?utf-8?B?Q2FybG9zIEzDs3Bleg==?= <clopez@suse.de>,
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>, "svsm-devel@coconut-svsm.dev"
	<svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: [svsm-devel] Development Plan Document
Thread-Topic: [svsm-devel] Development Plan Document
Thread-Index: AQHaosNMU4SbFNvs80KUhczt4nv5QbGWdneAgAGXFJCAACu7gIAAADEQ
Date: Wed, 15 May 2024 12:04:47 +0000
Message-ID: <DM8PR11MB5750AC439A7666358636DBC0E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <Zj30Nqq3OS58DwpP@8bytes.org> <ZkMpkfepqUWfq1RY@8bytes.org>
 <DM8PR11MB57503B95AFE00B2BC99B3F88E7EC2@DM8PR11MB5750.namprd11.prod.outlook.com>
 <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
In-Reply-To: <d62c34bd-62c0-4f09-8612-0c20dc62ea44@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|CY5PR11MB6488:EE_
x-ms-office365-filtering-correlation-id: 02d0756e-2de7-4e81-d6a3-08dc74d73767
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dkdBS2sza0dOY0ltMXJENlZydGdNR2RldnYxSGtvNG01elBJT2pta2t0NDkx?=
 =?utf-8?B?WGNIa3BuZkdsUzZDOTRzOXdqRzhNOHpoZFkxT2xRZ29CRllBTFR0aVFOZjl2?=
 =?utf-8?B?UGhqYWE2aHdEQ3d3eGQrOTd0eGdpb0hMWTJ2Tm5adlhrT0NIQ3Fzb3lDKy9q?=
 =?utf-8?B?VlFBQ0FQR0hObmx6WFExejNaMEVwNUtwaE13Q0Q2eFVPczJyMWJaWGVoVk5i?=
 =?utf-8?B?WkRxUDhENWQ1T1J1TGRzcUZERXJhL1BZN0w0Q0YrSXRnVjRyd0RUb1FIMXlo?=
 =?utf-8?B?eHlWMWppME5wY25RRUl4V0YxRWJyc1NLcVJyY3pDQ0lOSzk4ekZ4aUpENWJK?=
 =?utf-8?B?WTlMRk1CcEJQejBRait5YTN2MFEyK3BhS2dlTkZQU25XUnUrVXlqb2hSemlW?=
 =?utf-8?B?YXRvNk9ySkZXbHFIMTRwbDM3UFU5czdRMWRzSjdkMGtXOGpMaTNPczhEUUtn?=
 =?utf-8?B?VUhiQlpCbG9JTnFQNnlUR0NwV2hUcGRJWG9RcVpkRUhEcUo4MkorSjVWYWYx?=
 =?utf-8?B?YjU0WWdZNld4MXlLZk5rZ0thc2ZDVjgyUG9uU21TS21weUE1bGg5NVpOUVY4?=
 =?utf-8?B?Ym9udWdmQ1lqSExFQTRwUTVKSVZHMHQ4OW5uUUlZY3ZyT1JQZjdmZ2JucjZn?=
 =?utf-8?B?ZHh4TVNPQmRMdTcrblpYU2JTcDAxVEVWVUFrazh0MUpVU2FXdkpYcWEwZnBz?=
 =?utf-8?B?S3d4cEZ2dVd2eEFCYSt3OWJQdFg0TURKQ0FmMXBkcnpyNXVvbER5ZjdmeWJY?=
 =?utf-8?B?RVlsVG44cGt0WHkwdVh4NXV3NFIrZ0xxajNXVExEY2d1bU1yZGRBRjErZ2FU?=
 =?utf-8?B?R3I4UGF1SVc3dDJhamc2bWtHMkdyQ0JOdVhrMHNPcXQ5SEZndWprK3dUNVRU?=
 =?utf-8?B?aUZzamk5VGE1Wjl1bHJxdS9sVDdaTmFXcXprd1BmV0JCNTJnQnZ2UkR4UWk1?=
 =?utf-8?B?WC9HQ2VvV3g1azFrZEFKL09kYVdnQUNTdWFETmpGaldKdWE3T0cxcmVBZ2gw?=
 =?utf-8?B?KzNvNVI1QWZXQ0EreUVHSGIrSEl6d0ExSlcwWnN1eGROVTlmanYrQ056RW5u?=
 =?utf-8?B?aXhEOE83UklYQzJMV1JDRVBSN2kwNWJIT3MrSXl2MXNvM1lqbVd6aWNYbUEx?=
 =?utf-8?B?ckwrSDVkWTZvMWhPNWZzT0o1emdJSDByeTI4bUtvNFk2LzFuVjRtT2lrK2Zu?=
 =?utf-8?B?eStOaFlLYjY0MkFHb0pDT2Rzd1hJTXlkTThrbmJ1WW94SlNLdk5qUkMyYmNu?=
 =?utf-8?B?aWYzNDJ2dEpOTmZFdnJRSU1LOUtUdzdWL1J2UzliRWI2Um5PdXZncnc3MXYz?=
 =?utf-8?B?ZithWmZhM0lZakc5VmN2d05sSzJWa0JlK0FiWVJ3RE5jZGsycXVPRWhJaWxz?=
 =?utf-8?B?allGRmcvZUI5a3pvM3c4UGw5YTQxM0J6S1dXaVczMERJeXFyRmdBcHVlYWdE?=
 =?utf-8?B?bWFyUFh4MnVMZ20ra1RmNEtMNWgzUUVyTHJQQTAxeDdQemt5cUpFWDIzRkpq?=
 =?utf-8?B?ZnFTclVKdFRaWWRaY0lmaFhJaWdGWUtmcTBTM0g4YjI4bHZZZmR5R2E0c0Za?=
 =?utf-8?B?ZHU5VzZDTEhPK2JyR0szZEh6QXhEMlBLQjd1VUFZYmNpd3lpRFM5K25rRU5m?=
 =?utf-8?B?Z1ZXaHhBbW05RnE1aUNwWUl5em1ITENBMlpxT0NSNjVhVFJ1M0N3VGF5cUdo?=
 =?utf-8?B?WHVZNi9oRDdKbm1xS2sycUIxaDM2WEQyNVR0OXROc2dudFRUNHl1Q21sY3da?=
 =?utf-8?B?OTVFSXFnbnphZkdJSDlMYS9vSHptbUlYK2NFVGFFK3VkZmZFeUFEZWpZT1VT?=
 =?utf-8?B?TllncmpzbFZtSVRjdk95Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmQyWmVsT2RoQVVOeWpLSk1QK2l3eUMwL29nY3BobXFudlpJN2kwYlZaS0V1?=
 =?utf-8?B?STNiUFg0SkZwaUl1WUZ6Zzkvb0V6eDRLNmorNUtHbmhGK1NpTVd5TlNLNXhU?=
 =?utf-8?B?eUptU1MxSU1yZGhPeEcyTmZGNWJwWTlCU2p4bmJUVlV6VWxTejRSdVVKZnFs?=
 =?utf-8?B?UHpzWlcyRWVjNUdZOWZHeFNiVGZzcDhJZkNHeTdjY1VuVDBQd05BOFJzVlRu?=
 =?utf-8?B?SUJZd3VpQ2NLY3RFT1FvbXZBaktIU2RxWkdBWmwwWU9CMDYxUk8ya1dHQ3Y3?=
 =?utf-8?B?WEx5aUFvN0cwMGJtWXVEdjMrbzFFa3dTbTc2TkNsNm5TRGNocU4vZlUwL2s0?=
 =?utf-8?B?Tm9KUHp2VnBsS2lBcWxVMU1jL0kxTW84VWJjN3JDU2ExYlh5NzkwSjVRRDhC?=
 =?utf-8?B?RkN4RUMvZWxza0tYZUpaMm1sU24vM1A5TVUva1NCdlJrSWV3UG96TzgwSnBx?=
 =?utf-8?B?ZEkyc01aYzBmYWZzNUU0ZEh3QnlLNlluSnlDKzJZNmZFbXdKNldTelZNa1FF?=
 =?utf-8?B?YW9UWVFUWUVaK3pneWFRVmtQZm0zUnN4MWIvS0grbzNiY0xhRWFCeFczcnhO?=
 =?utf-8?B?eDdscnNXK21mZHNNcWk2MEZObzlCdGFFTzNWM1R0NE9ZZGVLOFd4RkZTcGRq?=
 =?utf-8?B?aW53dndMcFdYOEtvckNPcFNZOFlGQ1hobVRabFUyWTlJNUFPaTNxVFd0L1NN?=
 =?utf-8?B?d2ZWOWFGUytNekxrQlBtYlJBRWR6NjZBRFAvM2NuMUZKTzUrbmZHSkhiUk5k?=
 =?utf-8?B?VjJOd0RjYXlaN0Q4bVlVaHZBVHRTdzBGUXJvNTJ6R3hJdEMzL0lmRzBvWjN0?=
 =?utf-8?B?ZUZwcENWTGFHSkZVOUc5RDhQTnh0RHE2L3k4T0oydHl0M2hMeHc3aDNYSWlk?=
 =?utf-8?B?b254RTdLOUd0NUFaKzNBbmVXeFpMREZsd3ZCV2VaT01od3lYTUZrZTlwSnRt?=
 =?utf-8?B?UUpXNGRMeTJ1RisrUTZVMFNVbDhONTZWaUhrQVV3MkhhVkp6ckxOYTJuSlNY?=
 =?utf-8?B?RWN6ZUdNNUE0VU01bVJFbHhFVWQ3NDRpalpVUXdPZk5pQm95a3ZpbXpFaGdi?=
 =?utf-8?B?TFM1bExOeHVrb2VQdmQ1YmU2NmNndTVJRG9YeWtxS1NOdzZTeHBZSGxKa3d1?=
 =?utf-8?B?bjRKQ3htaCtTK0EwTkFwOTJNNWQwV3BGV2xJSm9wdXhPVVdIQ3lLTmltQUFp?=
 =?utf-8?B?aWVGS3NYVXFsWFZXTmZNR0FaMHo0SU1oMEpYZVJGQmdDTy9CNEtqUU5obFdJ?=
 =?utf-8?B?dG41bmlzNlc0Zm9yQ1JLM3d3Nk0rYXVjV0Y2Y29RWHhuT01HS2ZQWjExZGFu?=
 =?utf-8?B?YUpxekJEekxuZkd0Qk9WbVUxYk05YlhzU1RTcWZnZkpLeEg1K1JmcWtKa0g0?=
 =?utf-8?B?d1d6MWhtVHpwNThQSi9HMFI2bzJTQlY3VWtaY2kySlQzWmtVVXNiYTUrdThV?=
 =?utf-8?B?N2JqYnZic2MwTStvVlFNYVduMG02LzJTeFJxTDlaQ2M3TzlNZTJLejN6WXBM?=
 =?utf-8?B?Ym4wYThYR3kvZkM5cVZ6aVk0bHk4bmZEU3l5VHg3dCtxVHVOVnFWUDRLVUgw?=
 =?utf-8?B?OEpVS0prMVBBZTlqV3JhQ0oyTFFseTRlQWRWMGxJdVFXajN6blhhaGtwNUI3?=
 =?utf-8?B?Y2lrUG5HWWtRVnNwVlY1UmZ3MUF1ZGlXanpocmtZTUF5VW1XS0NsaThBZzlX?=
 =?utf-8?B?MjBhNmo4R0czOFRxMU50RWc2VjYxOVNUdnVtZXlUUTNndDFKeHVBT0xMMmtS?=
 =?utf-8?B?T1NaaGlDaVBHbCs1SnU5ck11SE03QXZ3YzRyT3JBV0tZKytqY25pU1Vxb2hl?=
 =?utf-8?B?dnhNSk4yZ2QrWDdVN1UvY0s4SkVlaHpYaXczQnpMZTZaSlUyWU5oRkUrNk1j?=
 =?utf-8?B?SVZPMGFDNUlZaEF0aHFyeGlJU1RtWFNVazQ3V2VoT25zTlJQa1RnVGlvV3pM?=
 =?utf-8?B?OGY0SjljemdBeEhDM09qWTk1UWlMbkV0SFNRY3ZiOXJrbUlPdTNBeDNjd0p3?=
 =?utf-8?B?dkUwZVNDZEpWWE1HZUdDSTJmK0w2VFVrNXlvSW9scTZiMGJrTHBtQ1VCTEtE?=
 =?utf-8?B?QlMvdjZzSGRQTlEvWHVQRzliTGhRSjZPL3NOeHdvVFlwYjRCVFlZSnBNd0NT?=
 =?utf-8?Q?onlVPyiwr5saOHKM0ZJxfLQVt?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d0756e-2de7-4e81-d6a3-08dc74d73767
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 12:04:47.5984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGHPs0m4UslTVIZ0syrDGFhFUks4cvmVlbiZwasjunxE3nMDCwWWkKPw/8D9oRJgqff45T8nLqhcn0AXA3cbTJZA9Dd5aw8zA/KQ09qw88s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
X-OriginatorOrg: intel.com

IA0KPiBIaSwNCj4gDQo+IE9uIDE1LzUvMjQgMTI6MjAsIFJlc2hldG92YSwgRWxlbmEgd3JvdGU6
DQo+ID4gNS4gU2VjdGlvbiAxMi4yOiBieSBkb3VibGUtdmFsaWRhdGlvbiB5b3UgbWVhbiB0aGUg
Y2FzZSB3aGVuIGEgcHJpdmF0ZSBwYWdlDQo+ID4gaXMgYWRkZWQgdHdpY2UgdG8gdGhlIENWTSAo
cmVhY2NlcHQgaW4gVERYIHRlcm1zKT8NCj4gDQo+IEkgYW0gbm90IGZhbWlsaWFyIHdpdGggVERY
LCBidXQgSSB0aGluayBzbywgeWVzLiBJdCBtZWFucyB0aGF0IHRoZSBzYW1lDQo+IEdQQSBpcyBh
Y2NlcHRlZCB0d2ljZSBieSB0aGUgZ3Vlc3QuIFRoaXMgb3BlbnMgYSB3aW5kb3cgZm9yIHRoZQ0K
PiBoeXBlcnZpc29yIHRvIHJlbWFwIHRoZSBHUEEgdG8gYSBkaWZmZXJlbnQgSFBBLCBhdCBsZWFz
dCBvbiBTRVYtU05QLg0KDQpTdXJlLCBqdXN0IHdhbnRlZCB0byBkb3VibGUgY2hlY2suIERvdWJs
ZSBhY2NlcHRhbmNlIG9mIHRoZSBtZW1vcnkNCmlzIGFsc28gYSBwcm9ibGVtIG9uIFREWCwgYmVj
YXVzZSBpdCBjYW4gcmVzdWx0IGluIHRoZSBwcml2YXRlIHBhZ2UgDQpzdWRkZW5seSBjb250YWlu
aW5nIHplcm9zIGluc3RlYWQgb2YgdGhlIGFjdHVhbCBkYXRhLiANCg0KQmVzdCBSZWdhcmRzLA0K
RWxlbmEuDQo=
