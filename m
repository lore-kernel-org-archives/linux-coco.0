Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90D28C035
	for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 06:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045462; cv=fail; b=RicbXQR8DV1U0fTZn7iXxEt5HTWxCNq2KR+7dGNzfzdT7JcS79b+6xaSs56Ib6q1laadp0DRoG3g1GMNEnFj5DPGVZY6yvJsKxyx9nbxqzrTbcK7Bb/OeDAUhd2YioYswluku0Av9HXZ5IjjAjCCm4egdHmfV0bhyMVHGV4KE9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045462; c=relaxed/simple;
	bh=6Z484U4gXyhM8OBy+l4vCuB5BkKZEq1w9zRKdGtS4fc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L9M7CreUkkUfgFu/BJZHZSNoxUhLRIks6Zce5wnTNA9RVFSPDSOo90R+utktLP0IjibASoEMY0HeXiALytjJRFGOatew9Oadzndp+D6roSv8VKgTcCHIo/CcVoq70UGpE6o2KKINHnWYe7O6lTnh9wH28X2OvryFoiyxEqqriLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y08iDujW; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y08iDujW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792045460; x=1823581460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6Z484U4gXyhM8OBy+l4vCuB5BkKZEq1w9zRKdGtS4fc=;
  b=Y08iDujWRwaO0u/APKhh0vFQuamtrx+5jr93G3flyJf38unbhoDBDkr5
   +MzZkIE/F59KpQHplbKDFNBJs4KY3p3hy63xPqTvVMZuGAD3IiDRcl8ZG
   zEjy4lrdz8JX5LL+S1qIex2BbU/EfcLz7SjS2blIa5hTqBPY42Jnrf/IJ
   mOHdU2DzR0AtuudaHM2flvVcZSvC3RwwGbOInBtQVdTrUHvZk6WPScDlh
   ebBNY+2wHsC3y5/e00IW9ImTGf1vJ2LmGKGU1IlPp8Vx+OUDLQyNTm1og
   ljr2pL3o0z42eh6zUIWGHo2Mp37/kuQgvkcpKK5tKmbo1oC+qKK9hX8+u
   Q==;
X-CSE-ConnectionGUID: gOYrdYG/Q1KdRNcQZ8Ivzw==
X-CSE-MsgGUID: mZviISKITjyCn5ZREsoUBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="795485"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="795485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 23:24:20 -0700
X-CSE-ConnectionGUID: ivGq2f6nSGebGp66nu+gkw==
X-CSE-MsgGUID: K1SP8v02Rki16Eq3ZufvrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2080305"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 23:24:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 23:24:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 23:24:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 23:24:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFlKgjt8KrIEVqxCudzB+1PJv1y8HHCQiB/jV6dZF1g1yw1v2xwvsN1WXSHoqfF3p8idUWb/IL3MVgmRA5tSGi4EvvAQ4utTHjr+HyHtQUr4v3UOaSH3zth3Nq20iibZeq6AZ4+eTa3RtnPuQc/2TLhiMmrQmjbsn87BF4kXU8QSqRtzeSVSbTwir0xJmw8bxJ0boAHf8oTwJKdIxiJhZ0K8NqFZRFW/gnLq74kfmL3kwa4Ofq0YJhQTnArUsCjLx1QU4Ahbi29uFcTPmhzKSOEl0i8cKU/BPX0teY4QX3JSYCiF3Y+CEzHybNPVHJsHUUu5f6eK0ut1zdquLqHJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Z484U4gXyhM8OBy+l4vCuB5BkKZEq1w9zRKdGtS4fc=;
 b=ISZ9i4A3RbMRQK05jOOm7bGeuERehbTxiUBiGeoxfw2ctgoGDi0jYBG/B8PYQ6DyeWmEbdLBVpvNb2xqARtD3p/9DAxuIlPVto3t+LrOo5fUGxzHu5K+TF5UytK+GG4h2G50gG/jsT8RduYKwkBTys1XkO/wppfc4f5Ib2fJ6SUiZdwM6MfW7YWOSB2vbodMx9MWovwQ3Ocv3jxrXVTK7Ob2yhl+FGFlpwjpI/Oy2FHvQInBvRglj7Fve79DOJPmqtc3wO6YvyqsKbYvBe/nrg3fXO2gcQqpMAVC1cC8yd4npcadBtI6lCR7TcExn+nafsxTNjcfBfEm5QDYKMMVNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by PH3PPF2CAD058EC.namprd11.prod.outlook.com (2603:10b6:518:1::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 06:24:14 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 06:24:14 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kas@kernel.org" <kas@kernel.org>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>, "Gao, Chao"
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Topic: [RFC PATCH 05/15] virt: tdx-guest: Add TDCM helpers and TEE-IO
 support check
Thread-Index: AQHdS9rFj3TOaGBm102dHqDSOZ3G+7b9Hg4AgAEjeSA=
Date: Thu, 15 Oct 2026 06:24:13 +0000
Message-ID: <IA3PR11MB9136408DF1EA28E1D1345FB8929C2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-6-zhenzhong.duan@intel.com>
 <0c5851bb-456f-4191-b951-94c8c3916ad3@suse.com>
In-Reply-To: <0c5851bb-456f-4191-b951-94c8c3916ad3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|PH3PPF2CAD058EC:EE_
x-ms-office365-filtering-correlation-id: e7e5e077-480a-453a-2dd6-08df2a84eec2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|38070700021|4143699003|56012099006|11063799006|10067099003|261009223027099003|6133799003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 5w6L6j5728MfT6ZpCR5leSQz0PI5NZt5bYYwakgcdADf3BTDJgTjwRlsuT7SCd/iGTsiPodhGElx0i+cm2HTe3l2DPfThRglxT3oOvfUknS/8BzsRLkf34jm4SdJBiTIrgDw/YD0n4vJgQWmEchqUBaHd7rURECC3rV/umnb9iCZqMsYFLeLsatyPUdvf9DBoj6h7yhmogcYBlCbmru/A55UAs320HS7j9+yM+Y6YJXAcl8psl62h5l1Pj5R8s/GgCzybwkU6eZEdRpJgJ+tGuREW46ElQ+dIPGRIyv/WcQ+d3sDtvog7WsYVOtCoBXIRM4YPo6NkRbVfrcnUjErwQLSEgqmFu19UAjpx4NSU7OR7kLuWoqlHZ8zUZSqv1vMdw9bFFChtxsDn8SYWgyIQoQIQ3iZp/SpwjZOlAuIPBRQ9I5q0+8/gXecEeWJlgGvFJl8YNYf8pSwfFxLmuJ040VhGBtn2w8Xysc4MKTxBa8WRMm0DWZR+OJHME5sq59hbxzru6QcREdShRW4tYAMdHu2gTpZld5bVsBZwIl7ksRTbCzUQvZkDo5fMIqoiDwmAiEkB3qQPvVfKY+Bf0Nzey8wbwlOkqBidzxSQHGxSA/gnciAWfTKnXqHrOOfB6ctvAAOgdDV2eZ8/Y8fH+9+hAstFV3jgjqPUHUOD13AwsaiX3kyYGicGqWNZBRhUyyiIosAzJUbE2A/qOjxlGUWHvQW4LnxL2p11VU+4444Vvg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(38070700021)(4143699003)(56012099006)(11063799006)(10067099003)(261009223027099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFFYUHlSa3AyYkFaNHRPMGVIS0FOdTVmaXZ4MElYalVjdEpCaE5IVzhJU0Fh?=
 =?utf-8?B?RUJXNDhLTGptcG5kVHBDUWNhU1BlZUlITVpRdzk1ZDVObEJIRVUwT3F1UzNI?=
 =?utf-8?B?UHFLUGxHb1ExVFljOGJ3ZVc3aWVyMGMrZlpad1hrZVlIR3dNU1FYdlR2WnFJ?=
 =?utf-8?B?S0VJZHZzb2pFTmtWSHhKc3NaRWYvc21NK0JLY2RqUWhYbVV0MDhOS0Fic0Nx?=
 =?utf-8?B?WFh1WGdGNnBjdCt0My8yS3JJMFQzYXBlb0tHNGtjaDdhTkRlY21wS2tYN0F4?=
 =?utf-8?B?NFVtR1hzZTMwZ0YyTjk4NjhGUCtiS21ubFRzWVlGS3dxeWh4VzdJSDJqelJ3?=
 =?utf-8?B?cDg1UFZ1RkpSZlhaeU4xZHZqY3FkZ3M5SnJEcURuZkVOU0QrMFFxOHdMUnFh?=
 =?utf-8?B?TjJsQm82Mk1pRERsa1FIeFZMSUcydGxBSVV1dVAzL3VDcjA2T1pNN2p5MmFj?=
 =?utf-8?B?WW1RK0wvc054Vno3RVVUYkZTelJKVURKQ1V2d3BJMlpZSnJZd0kvMVpadFFZ?=
 =?utf-8?B?ekZJK0dCWWNPUTlSU1ZKK3YvWk9kanFyYTdIQUhacDVuUGloWHUvZFBqVWIr?=
 =?utf-8?B?QmVxQVdsVGZpTU5aL3VGOG0vZFY5bkV2ZlppQjV6ZHhhRFFVa0cyWmkxaFpG?=
 =?utf-8?B?MnpuSDR3cnVJa1lkUmg2QVEveXBjN1RNVWxyTmtHRHNodisxYXBoQWlYNHA1?=
 =?utf-8?B?aU0rN0NyQnJ0NktQbG9VQ3BYR3dQdktUNzFzMHphRUh2SlNNMUdLOU9uSng2?=
 =?utf-8?B?QnppRzhuU3EvNmZpbkYxNEp4MkxoU0Nkam5maXJFQkdMN2RrMVV6VWRxalhR?=
 =?utf-8?B?OHpyRlkxWTl1K0szckxTbDlRdHRTRGsxeEtiNTBQSmx4MXZWcGJyMTMzT1Zu?=
 =?utf-8?B?NEFpblZjQ29BMFhCZHZzRm11WkkrR3RpYXJLUUduWFlWZlZMMWxWbzR3ZU45?=
 =?utf-8?B?b3Y2WnJuNlFhK2VKY1pnN1dOT0RDWEFCWFVocmNvVGJQN3ZGNFlKdjZFM3JP?=
 =?utf-8?B?c2ZvVWxmNUVwQWttTGo4RzFQZkZVSkphbkhRSFZxNmxMSVptR2ZScTY4ZkdB?=
 =?utf-8?B?QmRCWkNqblVWUjJwUk91RmpsaTY2ODRVdTQyVTFVNm9relNlYUlxYmJYSXd4?=
 =?utf-8?B?UTBzSURtbGVtZGRUaWxlelBzaitqTEV2eE1TOURSYTFwdGxKMVYycUNlT1Nj?=
 =?utf-8?B?SGExZEFpYWFpMjNLS1NYV2Y2WlFmU2hUbXZJVEFWSWZncmx4TzNsZ2JHY1V1?=
 =?utf-8?B?VDN6R09kRjU4ajQ1OVNDZ0ZxOTJpTzlWNlJOMEFEZmdRSUJrNkMwcDlERHlj?=
 =?utf-8?B?eEVwMUdiUWxpYXNBUFFKOHpiVUtlZzNXZ2dObGNCWTZBSUM5ZSs1WmdRS0U3?=
 =?utf-8?B?N0JFMC8xZldYMmhBWTgrL2NNNGZrYk9zbVdwTXZkbXpWODdoVmo2emNlN0ZI?=
 =?utf-8?B?Sy9EaXl3SDQxVEJNRXhSdGJBWDZVUkdheVNaTmlzUFI0VDdMcG9nN1pILzcz?=
 =?utf-8?B?YTVaRUY2aHNCZWh1bi9JL0NMdW8yK1Z2cjN5SXVZdlVsRytOdm84SWJzSnpD?=
 =?utf-8?B?azQ3c09iRG9NYU45dGo0amZYbHZwdmdPK0dMMjFuSlMrZHV5WXEyOVhpMmN2?=
 =?utf-8?B?c1VMU2hNL0luYjVSemRud2JuSndXTW1BK3lIdjUzSWZ3WU0xR3E1eTh2aHp6?=
 =?utf-8?B?MkxxLzNqeVJBenQzUlFZNzdNeHpCbEJYck14Qy9UbHd0ZHphWHJ4TDIwTk9M?=
 =?utf-8?B?SHpnSGxaUTI3ZFNDbDIyeTBtUlhpclArT2JjUmc4ajFseDh5UXNabUcxdGtp?=
 =?utf-8?B?TjhVYkFuOE5KNUhqMFljK09pT0ZqWnN3TzdwcU9EcFhFZFJCNm5ZU0hJdVZI?=
 =?utf-8?B?bkZvZGlabXQ3QU10T3JUT1UyUHl6ZW9Md2RXN2RpSlVPL3Q2NmV0L25wNHR5?=
 =?utf-8?B?dDZSZ3dHSmZ0ZXYwUUU3Y1lnNk16WFNIb3hya1VHeUlaSjlNblI4bGRsRGEx?=
 =?utf-8?B?YXFkb1RzVFcwc05tclVMUXZTZVN0eEpKWjlSODBCYzlxSnpyUWVQSmFLVU0r?=
 =?utf-8?B?TktNMjQ5c3drM2ZtMDJJVC82aW1xWlpqQTBhNWpDdXVUVEI2VmhxM0xobmtK?=
 =?utf-8?B?enlHWEI5NHZ3THBtNkVhVDduL2tqaXB6b3dwcXIwSGpWYXhLK3ZuQWFtV0NX?=
 =?utf-8?B?b08zRTJ6Z1dhejJ4dXJKSXJDZVNBa2ZxRDJ5aTJRYWUvUUN3TlllYTM0dDZQ?=
 =?utf-8?B?MlkwN2dMWndKWHZUSzhLZjJwbGtrZkN6alhwNDdqQW9XRUd6Wi9ZQ1pYOFpC?=
 =?utf-8?B?cnFLTll2TTZLQVNuTmZwQzU2UDJsdzBEQllJdklMTU1EMjBUdk00UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: suoarStXJjwChT5jZ9a56XSbSNCyMRwaOgIbokKVwv8f5AOKDFSRQqZECY/Kqjyfrzx0OGnsYn+k3BdAGguU+wWUx+kXCPGHOtqnQOS/su5y6LES7C+VSd4g9sk7g9AvROb3KgBYh7obS5AVUT8+I+0EAR7CzZj+5moC/8Jf9Tn2/SFnkG/gzkvkW5FG/W/nxiV6DQA/Gi5fryr8HjXC877MB62IZi5w55vPBQ4SSyPOeNIl6six8IbBlPRi8hP1gvFJT02R4bbuBLVMyg+n0e+VPYXvpdO/TOiZ0lCOWxdIvGpTyNUWLOSCMutyAcdC3UAYgOTbshp8YDG0paOUpQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e5e077-480a-453a-2dd6-08df2a84eec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 06:24:13.9631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnuAMp+iGn00ufCikKKCtvwVW+CVsZ9asvmjTyVmckGuToWdK42wZ2DdzQpoQOaRsCdGinnpALGOH1UlbZxURAQ0gQs2duPNmbLRrJ9BmBU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2CAD058EC
X-OriginatorOrg: intel.com

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IE5pa29sYXkgQm9yaXNvdiA8
bmlrLmJvcmlzb3ZAc3VzZS5jb20+DQo+U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMDUvMTVdIHZp
cnQ6IHRkeC1ndWVzdDogQWRkIFREQ00gaGVscGVycyBhbmQgVEVFLUlPDQo+c3VwcG9ydCBjaGVj
aw0KPg0KPg0KPg0KPk9uIDI0LjA5LjI2INCzLiA3OjEwINGHLiwgWmhlbnpob25nIER1YW4gd3Jv
dGU6DQo+PiBJbXBsZW1lbnQgaW50ZXJuYWwgaGVscGVyIHdyYXBwZXJzIHRkeF90ZGNtX2FsbG9j
KCksIHRkeF90ZGNtX3J1bigpLA0KPj4gYW5kIHRkeF90ZGNtX2ZyZWUoKSB0byBtYW5hZ2UgZXhl
Y3V0aW9uIGNvbnRleHQgbGlmZWN5Y2xlIGZvciBURFggQ29ubmVjdA0KPj4gVEVFLUlPIERldmlj
ZSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IChURENNKSBjb21tYW5kcy4NCj4+DQo+PiBVc2UgdGhl
c2UgaW5mcmFzdHJ1Y3R1cmVzIHRvIGRlcGxveSBhbGwgVERDTSBjb21tYW5kcyB0byBvcmNoZXN0
cmF0ZQ0KPj4gdHJ1c3RlZCBkZXZpY2UgbWFuYWdlbWVudCwgYmVnaW5uaW5nIHdpdGggdGhlIGZp
cnN0IGNvbW1hbmQsDQo+PiBURENNX09QX0NIRUNLX1RFRUlPX1NVUFAsIGV4ZWN1dGVkIGR1cmlu
ZyB0aGUgc2VjdXJlIGRldmljZSBsb2NraW5nDQo+PiBzZXF1ZW5jZS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5AaW50ZWwuY29tPg0KPj4gLS0t
DQo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oICAgICAgICAgICAgfCAgNDggKysrKysr
KysrDQo+PiAgIGRyaXZlcnMvdmlydC9jb2NvL3RkeC1ndWVzdC9jb25uZWN0LmMgfCAxMzkgKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxODcgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90ZHguaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oDQo+PiBpbmRleCA0OTM3ZTIzZDU0ODMuLjcxY2Q3
MDFkMzQ2ZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RkeC5oDQo+PiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90ZHguaA0KPj4gQEAgLTEwNSw2ICsxMDUsNTQgQEAg
aW50IHRkeF9tY2FsbF9leHRlbmRfcnRtcih1OCBpbmRleCwgdTggKmRhdGEpOw0KPj4gICB1NjQg
dGR4X2hjYWxsX2dldF9xdW90ZSh1OCAqYnVmLCBzaXplX3Qgc2l6ZSk7DQo+Pg0KPj4gICAjaWZk
ZWYgQ09ORklHX1REWF9DT05ORUNUX0dVRVNUDQo+PiArZW51bSB0ZGNtX29wZXJhdGlvbiB7DQo+
PiArCVREQ01fT1BfQ0hFQ0tfVEVFSU9fU1VQUAk9IDEsDQo+PiArCVREQ01fT1BfQklORAkJCT0g
MiwNCj4+ICsJVERDTV9PUF9HRVRfREVWX0lORk8JCT0gMywNCj4+ICsJVERDTV9PUF9HRVRfVERJ
X1JFUE9SVAkJPSA0LA0KPj4gKwlURENNX09QX1NUQVJUX1RESQkJPSA1LA0KPj4gKwlURENNX09Q
X0dFVF9URElfU1RBVEUJCT0gNiwNCj4+ICsJVERDTV9PUF9VTkJJTkQJCQk9IDcsDQo+PiArfTsN
Cj4+ICsNCj4+ICtlbnVtIHRkY21fc3RhdHVzIHsNCj4+ICsJVERDTV9TVEFUVVNfV0FJVAkJPSAw
LA0KPj4gKwlURENNX1NUQVRVU19DT01QTEVURUQJCT0gMSwNCj4+ICsJVERDTV9TVEFUVVNfRVJS
T1IJCT0gMiwNCj4+ICt9Ow0KPj4gKw0KPj4gK2VudW0gdGRjbV9lcnJvciB7DQo+PiArCVREQ01f
RVJST1JfVERYX01PRFVMRQkJPSAxMCwNCj4+ICsJVERDTV9FUlJPUl9URFhJT19ERVZJQ0UJCT0g
MTEsDQo+PiArCVREQ01fRVJST1JfU1BETV9NRVNTQUdFCQk9IDEyLA0KPj4gKwlURENNX0VSUk9S
X0lERV9LTV9NRVNTQUdFCT0gMTMsDQo+PiArCVREQ01fRVJST1JfVERJU1BfTUVTU0FHRQk9IDE0
LA0KPj4gKwlURENNX0VSUk9SX0lOVkFMSURfU1RBVEUJPSAxNSwNCj4+ICt9Ow0KPj4gKw0KPj4g
K3N0cnVjdCB0ZHZtY2FsbF90ZGNtIHsNCj4+ICsJX191MTYgb3BlcmF0aW9uOyAgLyogU2VlIGVu
dW0gdGRjbV9vcGVyYXRpb24gKi8NCj4+ICsJX191OCAgdmVyc2lvbjsNCj4+ICsJX191OCAgcnN2
ZDA7DQo+PiArCV9fdTMyIHJzdmQxOw0KPj4gKw0KPj4gKwlfX3U4ICBzdGF0dXM7ICAgICAvKiBT
ZWUgZW51bSB0ZGNtX3N0YXR1cyAqLw0KPj4gKwlfX3U4ICBlcnJvcjsgICAgICAvKiBTZWUgZW51
bSB0ZGNtX2Vycm9yICovDQo+PiArCV9fdTE2IHJzdmQyOw0KPj4gKwlfX3UzMiByc3ZkMzsNCj4+
ICsNCj4+ICsJX191MzIgZGF0YV9sZW5ndGg7DQo+PiArDQo+PiArCV9fdTggIGRhdGFbXTsNCj4+
ICt9IF9fcGFja2VkOw0KPj4gKw0KPj4gK3N0cnVjdCB0ZGNtX3JzcF9jaGVja190ZWVpb19zdXBw
IHsNCj4+ICsJX191OCBpc19zdXBwb3J0ZWQ7DQo+PiArCV9fdTggIGRhdGFbXTsNCj4+ICt9IF9f
cGFja2VkOw0KPj4gKw0KPj4gKyNkZWZpbmUgTUFYX1RESV9SRVBPUlRfU0laRQkoMTYgKiBQQUdF
X1NJWkUpDQo+DQo+U2luY2UgVERDTSBhbmQgYWxsIGNvbmNlcHRzIGFyb3VuZCBpdCBhcmUgY291
cGxlZCB0byBURFggQ29ubmVjdCB3aHkgYXJlDQo+dGhvc2UgZGVmaW5lcyBpbiB0aGUgc2hhcmVk
IHRkeC5oIGZpbGU/IE9UT0gsIHdoeSBpcyBzdHJ1Y3QgdGRjbV9jdHgge30NCj5kZWZpbmVkIGlu
IGNvbm5lY3QuYyBhbmQgbm90IGluIHRoZSBzaGFyZWQgZmlsZT8gSSB0aGluayBpdCdzIGhpZ2gg
dGltZQ0KPndlIGRlY2lkZWQgd2hldGhlciBjb2RlIGNvbWluZyBmb3IgYWRkaXRpb25hbCBmdW5j
dGlvbmFsaXR5IHNob3VsZCBnbw0KPmludG8gdGhlIHNoYXJlZCBoZWFkZXIgb3IgYSBmaWxlLCBz
cGVjaWZpYyB0byBzYWlkIGZ1bmN0aW9uYWxpdHkuDQo+DQo+TXkgMiBjZW50cyBhcmUgdGhhdCBz
aW5jZSBURENNIGlzIHNvbGVseSByZWxhdGVkIHRvIGNvbm5lY3QgdGhlbiBpdA0KPnNob3VsZCBw
cm9iYWJseSBiZSBwYXJ0IG9mIGNvbm5lY3QuaCBvciBzb21lIHByaXZhdGUgaGVhZGVyIHVuZGVy
DQo+dGR4LWd1ZXN0LyBkaXJlY3RvcnkuIEl0J3Mgbm90IGV4cGVjdGVkIGZvciBrZXJuZWwgcHJv
cGVyIHRvIHVzZSB0aGF0DQo+aW50ZXJmYWNlLCBubyA/DQoNCkZhaXIgcG9pbnQsIHRoYW5rcyBm
b3Igc3VnZ2VzdGluZy4NCg0KSeKAmWxsIG1vdmUgdGhlIFREQ00gZW51bXMsIGNvbW1hbmQvcmVz
cG9uc2Ugc3RydWN0dXJlcywgYW5kIHJlbGF0ZWQNCmNvbnN0YW50cyBpbnRvIGNvbm5lY3QuYyBm
b3Igbm93LiANCg0KSWYgdGhleSBuZWVkIHRvIGJlIHNoYXJlZCBieSBtdWx0aXBsZSBURFggQ29u
bmVjdCBzb3VyY2UgZmlsZXMgaW4gDQpsYXRlciBwYXRjaGVzLCBJ4oCZbGwgaW50cm9kdWNlIGEg
cHJpdmF0ZSBoZWFkZXIgdW5kZXIgDQpkcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvDQo=
