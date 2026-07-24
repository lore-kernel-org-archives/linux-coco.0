Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C444AB89
	for <linux-coco@lists.linux.dev>; Fri, 24 Jul 2026 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784912763; cv=fail; b=fuLfqcBoGC7qpvRIylxRoOt/9GK4WcGz3dOg6EvcNx6GKPMJVBQJ/P1Y0k4qIIbV8cMKboG8/TnEggWxWA9Br22Ce+Mt0ULMvZG72nfm4fAnLhvXQrK0TdvUYhBEsDe1RQytgbmK3ktokG0j9bPhu2XpMW+aq924eaOPCszo8o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784912763; c=relaxed/simple;
	bh=ko2qkFwBrNF1qDGaB9C5FEOrN1ID64/wMqYv3HShpSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JwFEntJwg4Wh28QTt/D1l2X+dTCILgpMnuzNUiHoK1eLLxOK046blU+H++j0Uh8z9BzjD5Wkgp1TTdukeJj1Grow3S3nYkwF38y4CTBaMxwVEt1Cc1we9PsnQ1kNAcFQb82w0gN6LPXDyllSzvTkgxp/x9RYgED4xvjVc3eQApc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/s9+vnT; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/s9+vnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784912760; x=1816448760;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ko2qkFwBrNF1qDGaB9C5FEOrN1ID64/wMqYv3HShpSU=;
  b=L/s9+vnT9bmBtEG+gzMmJFhdZnRvTXvP/8MIqN0WJuA2v70aWQSf+S6N
   MtjyE9pklXf7/d7mcUolDbqoPL3TljvKpqLfVTIl/XQAlXGbon4ej9ZNW
   l2aN++uSgWVFDC/eme7KF4DhNfcH5Km/fX5pdho6ze+qbKlotq9n+bDZV
   +i95+6nboZZ7WA1e4Dxb0zAHTeY03nxig55CMSCw4vSVw97tWMALulJBe
   Eoa9fV+BmS5iZ5tAyKcphgqIQwHJ8EZmOGmePfYb31raqxNqToNc3jICN
   7iVmi5iHwxGKjRbdqcJABcdlOodGLdHMbA/w3tx/6bk8bEGVnip0WxFwA
   A==;
X-CSE-ConnectionGUID: TFWYCeumQ5GH8pKcIqmp9g==
X-CSE-MsgGUID: 3WgwJXGhRlaZR6sD/yDYKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85699485"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85699485"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 10:05:59 -0700
X-CSE-ConnectionGUID: c6ViTOhaTguBbWAbOhJ6SQ==
X-CSE-MsgGUID: 5OsWdBTyRK2LIz7E8Mo+Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="263758726"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 10:05:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 10:05:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 10:05:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 10:05:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGwmZKLvSuKhjOLLczjaHuHniZqWKQiwYaR8oxK3RQRNv+sXV9g8mb5BVBJWtT2ko820rcjy66RxCXft0uiqv0PM4ihSGV1/iep6hTFwvCO4DNs09oiRNDFAbGx7Tif+TpA/CaRw+kkWaeN8p/pojeT9y3restNt7icj/QOWlsXLfXRxvhiwnU/VUdrw7ziYSXESyVkC2vCg90Izh91tH9uwrZo8Ox/44mUv3r0YFRpaI+Px5W/NXgjFiiJUOE3KGhAuqL0cDsJ/PlaAJh4qiWXNuH73KJwS8MuJOMTNuF43lsDZnj83KCKiFcwEzcKw2IHe9LQMAUsAn3EmIqAocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko2qkFwBrNF1qDGaB9C5FEOrN1ID64/wMqYv3HShpSU=;
 b=sn6jq5zHh5iA1FzhvzxdZfmPw3jSK6PIfbNL2ta9zNV6rd6sWrikewfPPEmvx8tY/24/3U55JCy1mMS2q2pIi14+5ZGI3mgnXVahK0iSyOg7s1UrP3ZpyILmMYNHiGz6gdEACD/yHmczPg8vnb/Cjdoa9TEWXlhBv/4autE6zT5ene/Q9uVFBtVP2oeN9bZso45Wdr9NFESCrIPiM2NRlB4S/Lh33DNsru1Ya9gj+kC5fFCPuKQC2LysgtkDzmjC3+Bhqh6hbzn6rmUIc4IaX4r2x0+QmzMpTUFHSgV8jtvjQAFSHJsX9Wh6dZPQrIpeiT41zO5M6Uxnk72RuZfGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by DS7PR11MB7836.namprd11.prod.outlook.com (2603:10b6:8:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:05:43 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 17:05:43 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
CC: "Gao, Chao" <chao.gao@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"Xu, Yilun" <yilun.xu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"djbw@kernel.org" <djbw@kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Fang, Peter" <peter.fang@intel.com>
Subject: Re: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Thread-Topic: [PATCH v3] x86/virt/tdx: Formalize SEAMCALL version encoding
 support
Thread-Index: AQHdGbajPRs/511fPUCNdUND2/vuErZ7anWAgACXIgCAAOhNAA==
Date: Fri, 24 Jul 2026 17:05:43 +0000
Message-ID: <1e4885e1da81c8a7665bb4d885de62ac61e6063a.camel@intel.com>
References: <20260722084634.131020-1-yilun.xu@linux.intel.com>
	 <d3d33a22f57883f937f28919b96a5fdccdc080af.camel@intel.com>
	 <amLYiGOfYJEuYKkY@yilunxu-OptiPlex-7050>
In-Reply-To: <amLYiGOfYJEuYKkY@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|DS7PR11MB7836:EE_
x-ms-office365-filtering-correlation-id: 79bce4f9-3da5-41e2-ef16-08dee9a5cc03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
x-microsoft-antispam-message-info: akAO9DDuvPHlnNr8dX+XFEIRGKFYKihJuq2QKo2xrS3fMxwiOpqmxf/RcEJEMmbuimz//xpcJVmurK8KBo6TyfxJax0wcW9o7av/f3wAC2x6K7Jg9EwFh0g3aTXKDnEGiQZfSRzeyVP+OM3ovA6JW9pT5dJ6xMxA24kDukJBCLb5yaUiun3kYgoz/irQMJ3F2xG2Etmjh/rpqjij9SXrZJxZCQNinO3ZdU9KoAIlev7g+FAF9l/Jzpsfci03E6z/0DLXdeyb5C6VmgC0m6XGc73CSO0lyDWYbQxdmAKoQlVgV0NAWfrT8ngeiYbqQ/76I1FmDWTGxm5xQGvG8ApKz/kGimEk7la5Qi4OF+UMeShGx+Wm0JZXrOeIjuitSn3LER9skn3y5O2tnZbsmnCu0JkgK+ZV6Xhom5Ojw4yyHmLE2ym7Te5TTYPo82aQ2BFiKB2JbFwlqvoi8QixaobCvoVlCEDho+AFIyZ3gbeSvOPoXIzN+6pbppRcUOFuEFOfZFIz26Pufy33X0py2OwUmz0FM9oO8MY8NFFeZoHQ3zcHnCUjha4WW59ZxXwZG6nrl5BRzotIdgacZw65Om++CjZmV8DxyTRFI+vVgvkwlqpigewEBuJF7z3CSMfj8XFpGRpgnaKyry4fcyr9Yv6N6jKNjAvQfAKmNlPAA9VZ04A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDdzVFF0ZVNBQmdrMjNqSURBR2labDZmbkNkcWJocmlVNTlncjVNcUdPWGVI?=
 =?utf-8?B?STZGY3lyd2lab0trV2NEQmc2Snd6bXd0bDVlMUdBZklSNENwUStiLzJsN0Rt?=
 =?utf-8?B?SnB1NmNhc3plamMyMFhnVm5jQ2xXNmUvanB4NDZYR05GVldPRzJJYWt2dHNz?=
 =?utf-8?B?SXZOb2UzMVNQdUNXSFAyRTJmeWJwUXZ6b0VWclpHa0NiSmZzaElJR3Qranpy?=
 =?utf-8?B?aVFsZ3pmbHVETzVkYjgrTlQzZnFRb0swTzY0TUJCQUlxTDZGWTloWFlkZWFq?=
 =?utf-8?B?WUZMeXlJelFUS3AySERSd0VqM0xmZDFvUU5FSFFvdEdJdmJ4MDZxM3FJbHF1?=
 =?utf-8?B?MnBPQWlWWFdVd1RsbmVnQ0pQZGw3RVJXdmlOSVQ0ZUtxVkpud3REK3diU2Js?=
 =?utf-8?B?ck14YjhtdEpWcjNGWEFrbTlVUTlBLzhpTWJ5VzEvTTJZVGhwQnQrMDBZbEl1?=
 =?utf-8?B?MHAzb0dSL2VIY2t5c2Y5UWw5d3RNMk1aMjNIU1BWZ3JmTlFRbUk5RFBGNlJL?=
 =?utf-8?B?UlRVdVcrN1BXbi9xbzNxNVhkUHZoMm9zK3JoTTFlNXNsZHQ5aUNqcU1LMGhw?=
 =?utf-8?B?UDF5WXJuRTZ2NFlid1B4SXFqZjlyTER1RDlLOVUzTm84dFJtWVJ4bEEvcWt1?=
 =?utf-8?B?K1NGbTZOamllMkFSdGZLTEhHSGNrdVQrT0pnYjVnUWFsWGMvNWl5SXpzTXhj?=
 =?utf-8?B?aFQzNEluVmFyNHMyRDZyWWFNb1hDNlZEQXJLMmwvWmtIcjU1U0lyUUlPU1pT?=
 =?utf-8?B?UHFka3dCN1dZNXdoL1BURnp3V1BrSnlhSkRiUVlScm85RXVYRUltcXdCOFBl?=
 =?utf-8?B?UzJFN1BZaXdmbUZYMWJYRTNmbVhlTVUyTFZhaTI1N05zZWd0U0d2RXZOWHF1?=
 =?utf-8?B?ZWRnVXUyYzY3Tm1WSWFmMXBUeFk1MXQxUVprOWFEMkpFSW1HQVlPQlhGOUZF?=
 =?utf-8?B?dEZncG13aUpUYitzV2VqSjd3emR3eVJSSzRqWExjOHJNaENuZjQ4bzFLb3h1?=
 =?utf-8?B?VnN4NW9ySGRMWHd1bGZYdldPUGo3SHE5N0Vzb1NvL0JvMFg3d21CQXlWZEFL?=
 =?utf-8?B?VlNQNlBQU0tVSjRVYkRWVjFOR3ZGWURhWW5LcllXaEVwMGt6blU5MHp3Lzli?=
 =?utf-8?B?RkJZeGtvWFNYak9EQ2I5Ykd5ZHpyUmw0NVRXWFVFUy93V0x0NjJZZ3Voa2V5?=
 =?utf-8?B?ZVhqby9NMEdlTUNPeGQ4cXUwLzEvQjl1cWp2cnY4cmRzT1hXa29mbUN3WUVp?=
 =?utf-8?B?cjFGNmRpZDFZNXpUVEZnNCsyU01iVUpBbFpwUklnbmFmeW1TWjR0QVUwcnIw?=
 =?utf-8?B?eE1XRHpVN2RoQVU4Zkg2RUdFTzVkUy9WQnpkN1lua1ArQUZMUzUzU3NtcGw2?=
 =?utf-8?B?dE1vekhja25iVmJneXFseFpTa01xd1dyNnYwNWpXVEkwZloveStJTllQMVM0?=
 =?utf-8?B?WWhjeXJzQXliWGhxR1dNYnc0WllTcG11UTVieTc3QnVCeHVWcW1sZlhOTWdh?=
 =?utf-8?B?ZEZXVk91cjBBZmN2TDdZbnJHQy9mdzFleWU5SHhlNUlmeFRWSmVnVGxoWWhs?=
 =?utf-8?B?VDVBeHNyUks5c2FFYXhPMjdmUFBpMk5VamhGdTJTS1IxdklnRWpqVVYzc1VI?=
 =?utf-8?B?TW9pa3BCZXA0eWFUVXNTeEpza2U2VFVsRUZ4MUlYeEgzL0NrOWYrcFFITVow?=
 =?utf-8?B?bnBYYmdScUcydDFRMXZJbzJqVnZ6T1BSZ2J5RG9WSHZIbnBUNm1Zb3VKdGRY?=
 =?utf-8?B?VUllbUxaSHViOUIwUXJHck10UUtOWndiL1llY08vcy9Mb0c0TDRRV3FMZXp4?=
 =?utf-8?B?V2J1MVBYQmJuUFErb01iNVpYWFhYcU5LNmNSMzVEVnQ5MVQ2UU5iblhzQTcv?=
 =?utf-8?B?R28rdTFhTGpzSk5uSVZqRkxnNjRaS044NWR3TjZwWTIvUmxHSFFoejdxRUtw?=
 =?utf-8?B?ZFJqSzZ1ZUkvaXd1Rm5vRlI1dUhqWnVXZVJWRjBVekJNemdIQUF0bnNONlMx?=
 =?utf-8?B?Z2k0cWlXZXdWV25JQmVXcVlKVnNRYlFOMDBpUml4N1JnbkxZb2kvWTQwS2Z6?=
 =?utf-8?B?OUVEcUFDQTF2TzdMVmJDdURXMEthYU42cVhNZDJqTGh1UHg5dnZybytjR21y?=
 =?utf-8?B?QTdpWVBqRjBlUnczRi9vbVF1cGUzRVk4UU16Ujg1ZkNaYS8rSjd4T2EwTVBm?=
 =?utf-8?B?eFluazdvS3gzNERNOEFndEdwOGk1cyt4NGMvUVZEYm1Pd2EybFR0LzZaRlJi?=
 =?utf-8?B?Z2t1UU5tTG9NOFJ0amd6WnBmRFQ3d3BlUFlDRWR3a1Y0KzlqTWhhRHVjRmJD?=
 =?utf-8?B?aThIZkVPenpIeWl1dDIvZ0lQL01oVWlsdmZLakFwY0xRWFlDRnFnS01vMnpi?=
 =?utf-8?Q?El/6d/nkrXhcwAnA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E0337F88CB4924FA64B63B498ED8CF3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o85sCauo/rySvITIxIWudZS0hDz0IgAxk2NQ057ySke86JM39qtp7CfNGZJGFzVLtc9a1H0j6d4+WtpGEw6tFedGC1gbTVyLFZLElcVtVuLj8Nr0PcpJhgRvZvexiBFF6pUt9FXOsJyp1Qp3wd9V82YNRp0wjb3JTklZG3iVINvOUUn5GMjjmtzEr3lHx27+Lu1mLxVqEfmcCpehZfvvsXiE0lAZyXquggyrdCIWOvd0GrlSZm+eXhKeHr37OXwUbpZr/n8gtcXGqtQ8IFVZ8D8LDMS3sGidFrad0Nrwq+HcPaTLjgDJT6Y4OLjXMcvepsBHtm5xu4sLbciBOGWkEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bce4f9-3da5-41e2-ef16-08dee9a5cc03
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 17:05:43.4390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zCdrCeUyHWRWtZfLyBR2gKUxSO+BQwzjqpC00AxptU+LVTyaeMTidvNoH77MjIPsjM5Oro+dbvAoFxu7/v9H6mElGWVSeXAAemr8ThnZXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7836
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI2LTA3LTI0IGF0IDExOjE0ICswODAwLCBYdSBZaWx1biB3cm90ZToNCj4gPiBJ
IGd1ZXNzIHRoaXMgd29ya3MgYmVjYXVzZSB0aGUgX19hbHdheXNfaW5saW5lIGlzIGVub3VnaCBm
b3IgdGhlIGNvbXBpbGVyIHRvDQo+ID4gdHJhY2UgZm4gdG8gYSBjb21waWxlIHRpbWUgY29uc3Rh
bnQgdXAgdGhlIGNhbGxjaGFpbi4gSXQgc2VlbXMgc29tZXdoYXQNCj4gPiBjb21waWxlcg0KPiA+
IHNlbnNpdGl2ZSB0aG91Z2guIERpZCB5b3UgY29udmluY2UgeW91cnNlbGYgc29tZWhvdyB0aGF0
IHNvbWUgY29tcGlsZXIgd2lsbA0KPiA+IG5vdA0KPiA+IGNvbXBsYWluPw0KPiANCj4gSSBzZWUg
dGhlIHByZXZpb3VzIHRhbGsgWzFdWzJdLCB0aGF0IGV4aXN0aW5nIF9fc2VhbWNhbGwqKCkgcmVs
eSBvbiB0aGUNCj4gZGlyZWN0IGNhbGwsIHRob3VnaCB0aGVyZSBpcyBubyBndWFyYW50ZWUuIFdl
IGFjY2VwdCB0aGUgYXNzdW1wdGlvbg0KPiB1bnRpbCB0aGVyZSBpcyBjb21waWxlciBpc3N1ZS4g
U28gSSB0aGluayB0aGlzIGRvZXNuJ3QgYWRkIG1vcmUgcHJvYmxlbS4NCj4gDQo+IFsxXQ0KPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNjA1MTQ1OTE0LkdXMzk5NDRAbm9pc3ku
cHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8NCj4gWzJdIDBiM2JjMDE4ZTg2YSAoIng4Ni92aXJ0
L3RkeDogQXZvaWQgaW5kaXJlY3QgY2FsbHMgdG8gVERYIGFzc2VtYmx5DQo+IGZ1bmN0aW9uIikN
Cg0KT2gsIHJpZ2h0LiBJdCBpcyBvbmUgbW9yZSBsYXllciBvZiBmdW5jdGlvbiBpdCBoYXMgdG8g
dHJhY2sgaXQgdGhyb3VnaCBjb21wYXJlZA0KdG8gdGhhdCBjYXNlLCBidXQgTEdUTS4NCg==
