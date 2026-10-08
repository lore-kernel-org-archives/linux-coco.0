Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC063BFE3E
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 06:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439284; cv=fail; b=iEPnCCJr307K8Xz5T+r+936/N2MGE7+Xrx59A2wPG3DFynQH4g7QteJSpsegUD7XHSEnMBmSeX8M5Z6u/F4TOCTD7QsOVNZ/ijEuoud6adilxQNbX7fWeUcD3TyrArwVBtbWgRd4l46nW2VFKu1r2Sr164QQzwlEUeFkG3plJoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439284; c=relaxed/simple;
	bh=i/bZHMhJ5dPZpQ/FNZRLg3KQEx7+X9YWo6BCukNSUug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UCGCjSnWFgmBEiCyH/+U9CYM+idpm5EB70onSGbiVYRUy1vcKDWW2n11/etXm4AN07a0o7+z837T8KPc2kPiBD6f6fzchVJcKfSNjtMLVCqNP8kG0gyPcKeMhydAUSBYx3RBWLOtDeBnE1Q5xvZNC+9kna5RqUfoahcd2ij0CsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViFVjpEK; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViFVjpEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791439282; x=1822975282;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i/bZHMhJ5dPZpQ/FNZRLg3KQEx7+X9YWo6BCukNSUug=;
  b=ViFVjpEKwoDRgbyWmv2cCHEMw7dMoCT9hevM4tk7h/b3jIS+wl1jQwIp
   JsxsEdAxjRWpzlIaFPhI9BTibpKP8EZEnRuJ0rPM9bnSKf69q9bNOaPz0
   YTQjDdjDt4W4BdPdCCUbU4UXEO84QkOwgJcI/nSXrW4qJn2QbOhQZpftR
   h2ANoJo1kkAnTeonVe0MGODv30yxDualcGzJamrYlP6xC0nPzb8D+rExQ
   COhtRrovvwJffvp3NyPj978vmu98+GfBuizsptz5bZw6GDQh1Vap+haR2
   Kck+kFvbLWooouReZ2wk/0MyI62MHgiuIrmewHbaxKdwHM6laJyWs3Jsg
   g==;
X-CSE-ConnectionGUID: df7GzBPEQeW4FffYlTqMyw==
X-CSE-MsgGUID: 3Z/m7J00QcafJjHufZ5GZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="205167"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="205167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:01:22 -0700
X-CSE-ConnectionGUID: PNQ5HPl2RAaK4QWr27W/dA==
X-CSE-MsgGUID: ZewVDgXfRwmMqQhYXSAe3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="366486"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:01:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:01:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 23:01:21 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDqqpm33HVgBCzDs9evY3yLnzxyTQub4bVhwru3JHlZeG+smj48Gz9AJnMT+C1BrUig3AUrkoQwFWLpFssT7dn7K3/zZLpQRFgleUhOmHEXnsVR0DkEQmIjYDW7TsUIY3Hj/Sfk/0Ca9p1bON/kInCG5WJWWQSnR/Ufpjy4D9RSAXZONRntQiEUw/FPxBPm+DL0KcU7RVzbZV8me+au1lKnJ5iyciiJ77fhWaIIVRCSe+RNrLUboGkPttTrfZXSm9fPkawz/NkLG6Zjsh+EQjmvCm409i/eNJfBLx+uRDEYYQEJGjResVQc9rDqKPbgSmegVElleHFCX3cbyKF9V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/bZHMhJ5dPZpQ/FNZRLg3KQEx7+X9YWo6BCukNSUug=;
 b=VlcNN28vgoON2GW7tNE+00MRuiThHopv1U9DHPx/MeQNs1PrDidz3uUwROUkwK9G/n6BxkXmzkflGe63WTyeZlklOhVL+bAYYZk8/SR4/yb6IxN6Sq4+aQt2sE7OzUqNHb/cbxQ3G6CRRXkD6nlbLKtSy3hsId+AcYsp8+RUrzV8Ahq5+WGuSRh834HLkYwb+Hn4v0v+A+DyUih8RAAhKhGcWC5t4W8QDkPzh80aD3lyonV1S251f29A128Mj2HgW817sWrCxUqp0Zbixi8rHdpiXpVMLlEnvM6kdP1ZT0YFb7xWqNp0+ZumTkmuEqSYdVGgbhcSRT2r4TE71sEuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SA1PR11MB5875.namprd11.prod.outlook.com (2603:10b6:806:238::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 06:01:13 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 06:01:13 +0000
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
Subject: RE: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Topic: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
 wrapper for TDX Connect
Thread-Index: AQHdS9rIdRCadJg8uEm6GsazTtQ82bbeZNsAgAAFyoCAFKct4A==
Date: Thu, 8 Oct 2026 06:01:12 +0000
Message-ID: <IA3PR11MB9136F9C18ED0AC4C86258C9892932@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
	 <20260924041032.1096569-9-zhenzhong.duan@intel.com>
	 <3d38cbbd51f8e75d5a3886ca203447fd19a3dad1.camel@intel.com>
 <697c0117acaf51076b274d461262e36453948478.camel@intel.com>
In-Reply-To: <697c0117acaf51076b274d461262e36453948478.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SA1PR11MB5875:EE_
x-ms-office365-filtering-correlation-id: f05cd62d-a0bd-4f79-dc81-08df25018eb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|38070700021|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: qXq/3nzI0nH0sMRHXQDGqbCEVafk9HecPcOAbTt3WwrzJdUKMCblWNiuwpuOaKvRemkgz0ZfbZfGjvSWWXKu9RIx84PMAHh3p4Aq06nVG+JqNHjL/kkrmnL7jDtqb2ave3fOjQ5d2koXqfm/GEJU5/wZ1ZBwnpqCKNZ5ukEDNvFaa8EpSRyaw7/QcFRs/PYuPI0Wy5EJwilywrEZlv2XRjF6XbKoJj0T/6QQysxC4SIPAIHCmzHJTV5Q7x8YoDj84AaMVaqPBkeRt0SecDHDMiqDiJIHUE50UXF+Hvd3BAo/vHKTaGra6ycCAHpnDeqmdWPM8O0Tcl4d60byLmAwXHhzZPKx6TqPP0gMk8j3xuHuoLX2o9FCVbGDrYDXrBTWZfOSMwUCKZ9TXcj3GubHEta2ExK2A1LIwagf59SUQ6yiefNnBPNnxWpGaZTeKNyC2btO/fqELUmHQXpy0A0OhpnQcQnYxvVA3k8WsofIjctZPCpAXSuN4qvK/ocs98Lzvw3LiW5jW1lY9TK3LPjNrCcdHNPEjoCTDb4aN1h4HToo81SQYUS31kvk2nMao0qTOa6hGR/Zij9Dgv380ckLk0Ghgofh/l9QUDSlGtkv9PX2y3oBS9NZuVFSZBvkouER7eCOQRN74E3oEGeHJPcVqo2JA8uNAnfjRhfm8ar7Kc0WvSd162YGoIuLK5C3M+Mrs+dPrkPjW92FXpyfwvH5W0hXXfBeBHz6l6EZ+Lj29Pg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EW65b95HV6BbD6LHUfT9pLRmA42/QNqlXGn6NBjUHndwSWaRTVrAfibpPdOw?=
 =?us-ascii?Q?2dKnV5uCUSo6h7YxdLyaTan9YEJo6udd4J4GhNvi/v9F+g0B0XcJ+Pp2jh4G?=
 =?us-ascii?Q?CnxSm8rkPcBS+zfokxp/UMXfsk3IlZP6nrjAuERveolgTCKWgSv64OlMjYIP?=
 =?us-ascii?Q?grss48vAjfJxCX2OIXvfVYABbe7C0S/vQtAgscUeyFAiZQxKx5gchmTa0UHr?=
 =?us-ascii?Q?BRF6QthY9BCR8MniMEseedJqGXlPcx/JGYoOoE5USbMKme7AqgJ9ojSE7elJ?=
 =?us-ascii?Q?RaM+p/3EjIBoAI7JicSQxhUC1e8L+KTMps9jBkOxWSKHNZ9u+/WeYYVxPPg8?=
 =?us-ascii?Q?KoENhbNgh1uXuQpwWeegZ5SfvpRI5biJgBb2x8z+Z8ZTcL6o7eGJkJa64Ih1?=
 =?us-ascii?Q?KaUft+8b3hKnGO6vTUfUhxJyb61TeKmIKIOwVRIfwfPHn//xvmXnsaUqTGSN?=
 =?us-ascii?Q?9D4T+LqXd1I66Xzahaq1WHFq6W1WON7sEe4lLULvP3y7hxtS6yZmT5iYS3zZ?=
 =?us-ascii?Q?6A5rk8GLn7w2V2I4P2tZokvlCfFgxRrktO9v5IBOFUN1M2WOClenD/OY0U1J?=
 =?us-ascii?Q?WxrVNUeQDzIQi4SStP9Kz7E1jTLsaZ0xRuKzChnE+gIitz5PFQMFq6DBPECO?=
 =?us-ascii?Q?pRq/rRao+VfCp5chjs9gG0I1MQhDjlr6lpEItqOiyq5/4nBv2P5RvRfcnrDa?=
 =?us-ascii?Q?GAA1aTgsrUieHTfrUz+NnNNCQwA2P0PRKPI/WKeJhH9+q1+rkNEzYuJzbXbd?=
 =?us-ascii?Q?PEBjIJ75iE7x+W+R2JCjpYexTAD7B+2pJtGJQu1FGiE4CN2gTNveGk/1E9uR?=
 =?us-ascii?Q?f+DjWYzik91AjvVON+zkYCPxwZcasFTGg66a36rX1eiHO48UWnONKRVhmKge?=
 =?us-ascii?Q?V5xkamzheTNmdglpqzb12y58Oo0OU+0Dn3Zkr1pj9hGtNh3P48cH+SmRVRYo?=
 =?us-ascii?Q?7vV7ml7/CuZ2/htxiK4cWzkvhx2vpFt12bra58LQwFHLhi866hQSD68fQ3al?=
 =?us-ascii?Q?Te61+voPLE/Jtp96ME8LWyLzbWBnd088C1FyL7/Z+ua5ZnLDDKurUR3Za5pw?=
 =?us-ascii?Q?UgaRrNGpFgcQ5DM/BVXHI2nL+3SACa8Rg+QW4NjP2GkrPxpEjEvQwihpcyRz?=
 =?us-ascii?Q?IZeWeGlJJtwuGZV4qeDZUSWx31l8BTT/Ke+DHz+NbzDMHBpXGqXx2HEZZ/GM?=
 =?us-ascii?Q?9E+ltdhnqSg0uthlMxoVyuO2ie1gSfUBlOufVdKegYOxStaCrOZ32H2cF9m/?=
 =?us-ascii?Q?a2mN7cFU27yWeA8UTo3weF3fXZEhObHr7aStgwlBG3O1TJ8j400eYrCRQ1YG?=
 =?us-ascii?Q?op+ChhbVh0t3/95MSvlcRGDoArQ23mj7k3jTYy6Nx3JbkMDE69L5otjoHzC6?=
 =?us-ascii?Q?0r7ZekgoSgUXPcsJ5A+UN7zpiQ7i9TL7/oTJKr5IHEf7Es1K8qjsn5V7sXyd?=
 =?us-ascii?Q?CsJMye/bOUzkyAavxwLL/o2lbls4cq7wv4vuHKceLbABlRE+Er/M49qCP9yQ?=
 =?us-ascii?Q?a6AiIR/urCd1TbDtO1vkqKl7zQJwBcjjA3ZBTArlgy2M8PoJIBwZq6MiwPN8?=
 =?us-ascii?Q?pvgnNoogJLQZKlZWaBywdtO/DRh02V51Lf8wa39kP/x1YL0S5gzzuQEQ8xg+?=
 =?us-ascii?Q?YW4F9PXjshlJsBMgvPe/0MaKLJ+TPv+JLORnXqQeBg0SE1V76TQZfCgYEAMd?=
 =?us-ascii?Q?RLOwUQbZCtpZfdiRIhsMrMjB2OuEjnc5nVtvEUhzzU2gTzELyUHK+boX8Ges?=
 =?us-ascii?Q?YfH5zZwGaA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: z9B9v2ppzj3FPn9j0tGD6fNP7FJg8/JOyXr5bsumFfkVDQn3zmOVvWJ+IbCDVj/4mXShbqA5LXh8wlXixXYTxCt9vDJRLVP0j1badiq0FN2hp1xQn8jiOPKZVD5jwnkxshpl8nw+SS1XY2r+2YJoYC3eMaqn7hDeB2nzQXThcUClEszPxYgn7PR6WnSx8uQ2jqDgi72S1OIELs2cX7VrkdREwBzm+lKeC/Oba60gUbuEUtXsWD1BP16n7mMYpdX2DJRUyPu/lnEo96QZJ5gg0+XeTfrfG3Pzd/PcRirOG3QE5Rxu4waGeNfSttfL3mpPqH3cSlj7GeJK9Owirr4TkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05cd62d-a0bd-4f79-dc81-08df25018eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 06:01:12.9150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFKUHvEtJKhiRyJ1MWKPC6V0oaN/jMp9gSg4DarpClMltYFl0PiSLLokZLveg/uUWzGrq6gkLlTKbC6rueZ9Gfb9Xp6kw4kbgyPNLsmdZ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5875
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Edgecombe, Rick P <rick.p.edgecombe@intel.com>
>Subject: Re: [RFC PATCH 08/15] x86/tdx: Add TDG.MMIO.ACCEPT module call
>wrapper for TDX Connect
>
>On Thu, 2026-09-24 at 16:41 -0700, Rick Edgecombe wrote:
>> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>
>> We are going to need a lot more info about what this TDG call is doing. =
Look
>> at the host side seamcall wrapper commits for examples.
>
>BTW, what is the best source of info on these new TDX connect TDG calls. I=
 have
>an old "FAS" doc that has info on the specific args, but it says it's a dr=
aft.

I use https://docs.intel.com/documents/tdxmodule-doc/int/tdxconnect/arch/ab=
i_fas/tdxconnect_abi_fas.html which is always newest.
