Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E4C339390
	for <linux-coco@lists.linux.dev>; Fri, 16 Oct 2026 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132983; cv=fail; b=m3wt0P96WY/dmw/jBgkCtsF3Rz2N3h46i9bNmyQ10WHevVNDof/A4evIAxrRkBnD5lLFb7LB3ObREabEOJex53SYG5XZMjj3b+bmdW4Tvd2NznvBjgIq09fvemCYDXi3QeAzfK2GdeXNaW41LBAkfABPjalO4gkSTPrZAppYbgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132983; c=relaxed/simple;
	bh=nkSd+FeDcKKw08FoJH7FoZX/7z1vACwG/i8cYdF2XXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NXOW6Dn7mgU5GWxCuH17CFhVlBzGLx3uLeT0h9uEbAtTyU5S1imqBZEPRkcQpuRbSFEc2ZKvER4HTmoYf9HyQfCm7Q5FVghJ0VDn2l5qzs2T3vwfs9rt6efDd2fMWw9vENm0pHQkDTE658NkdX1Np3bgWEX77M63MXwSZRsIT8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCmOwLNH; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCmOwLNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792132982; x=1823668982;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nkSd+FeDcKKw08FoJH7FoZX/7z1vACwG/i8cYdF2XXE=;
  b=lCmOwLNHIhygBcSBQ6ECdjh9MWVJYwL8X03aYruOV7fhL1OswapnSp5j
   wmZFjOBtHyXLgHxtFCSoC7XbD+7dLiWO4INq41uenAKN7IWM92mEPP8xg
   3/VKXdgZnJIF8R7Rg0pdBs7f7/RG9ZYdroLb2mQgGCY0hSRkuOmMI5naV
   gDPHogUoDQyAR3qEOH5Nd4WIWc+Zt/cvYFArbVAwhD+hFWfbus/hzEboG
   J8TCa90wnxKUz9xDarBzBV+clZs/Tf7yhL7b9PVEu5XqbJF27dORPlW8p
   6CzKlpVAjkGoXRSYqgTSgYwUEySKopL9w7KjInncftDNeweVi8USun+Xs
   A==;
X-CSE-ConnectionGUID: QkdyPNUwSJ2PYI+5zS4sEA==
X-CSE-MsgGUID: 3eJ0W4+qTcOGbbR/wWcZdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="797779"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="797779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 23:43:01 -0700
X-CSE-ConnectionGUID: TuwRJHFEQG29S7iSIx4UVQ==
X-CSE-MsgGUID: eRTd0KSvSv2eL/LEweXS+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2129436"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 23:43:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:43:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 23:43:00 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN2Q6ygkb19f+tdwyAz+tFo5TSLiSqRSZgEyiyapqd4ork75JnVojPa7PKNM/EKbrNbNzItnOm5Gi814+liE5MwIijcV1fzxwVNvT23HDiUcjAls8JEDjVm0XU+XUFAq78QICWjVrVRWCF+xIRrTIepMOboW5vswK9C6/ukcBNzI2XCvXr6Alzlxort6Y0bLWG23qWWS9OQfTcQAZ/QD8NMVb0ZK6Tlw5nBndO8CRME8E+wk6gJAl9+ku5OXboXcZx/E+tsZUJGQfSdfy8lGZvVzlp81qLPa5f/uJDxL1mH9dh+QL+t/WBKKXahBY8AhppzmSJ0xDFCUuwF9St5qkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7x5bp6qJOeDaBg83N33i2R2oP5qQAoi6CyE0q8GXj4=;
 b=t+gwpufMcZ4y4GuH3BdXvz+Qg0KNi10vnWhk00UAx+0Ktbs1ywWiHLqn587LPLBU5VOhCGHF8JEg6AfSn3Z+FhZK+dDyxKb9EZuJKo5Ok0j5wwYy2/YCSTzSgzIgvBRhu9J0wFw25DSzasc2M2SDZHkRYW9XXG3pKn/76Ny11I1qJnLgJjl2/Vc/gL6tpcwPy4CabdU6EHjIMyq85kw6YzPQqabVRFtR5F11fCC5033pZ+jBxh6d78f64af8/PeV9nPSsk1tUKpNHRyq+rZpshAcInHMItBLp9AOftgHwVTuVbXozNn7L+kDsY0ZiJL51AKHGhj2h7XPUOxtQlJVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 06:42:57 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 06:42:57 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gao, Chao"
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
Thread-Topic: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for secure
 devices
Thread-Index: AQHdS9rCn/qQgtt4LE273DcA6V/Otrb+vmkAgAEbr8A=
Date: Fri, 16 Oct 2026 06:42:57 +0000
Message-ID: <IA3PR11MB913644D1866699788C486D74929B2@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-5-zhenzhong.duan@intel.com>
 <atDYVoLFgxyncF3c@yilunxu-OptiPlex-7050>
In-Reply-To: <atDYVoLFgxyncF3c@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|SJ0PR11MB5216:EE_
x-ms-office365-filtering-correlation-id: 06f88e18-09ed-408e-233c-08df2b50b6a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|22082099003|10067099003|18002099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: tCahroRMisaJa296s10Bx8MFEsc/YG/xlqsBxk2OoTOhYcBx4+ZL9yWFtG8oNUpQr32pkLQ0n4ZsLruELglx+2+IB+5aH/HR5yHNQXK4eCdkH++ukrcjf6wyxmKIbqxmHF3ifeKaogl6IvJqmKoyNgInA3ZGZwEiVVjHFpMwykzaeihRSrBAmklTE37efhs9KTvrhPgViUgJCFa4Rt88zLYUMEus7kgI68Yh11pl5CpusOrg5x99s/XkNY8hp/mgS3binBPG/KwGXYy38WakOPQ5jxzgBfojWHBtpg4TmCnr5uK3wrkj3Z8WRztWdCqPPrg+ShtPPeQI4Ysorp2jR6vU14yBveE0F0JPam6b6ooL4VIH5xKQ6+9733Nhnlceq+hI/dS0jRwggOMMG9tE1NdU9AiN9HxOwO4J9hJ4MBf4UUOYddLz7EsmtMDGxOXQH3aNBOdfPl3DSTuC6ewGYbQ1xG27l3kGy7v+1avEC2WgwvF5LmJDVDllmepQz9Pf6DVowvaPYptXqWH8zenyktsj/5RQf2q4z9gZzkX+NtDwQnse1auSmuO1siPis/qq/76jEAnkMA7eXQSOlKetTIeXGzHndh+PgAsgHL+QKyvJow+V6uzDlSbftRf2h4UzhKoVmXctOSpI2wduWIhRb51lHHDg8bEbQ9ZD5tKles5j86Dbri8q6lzPw4V6o7xbGFU7wCcYZ4WRJL+84rlynuws01W4KL+FTMc9b91LFzU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W8JGkWYOlbpxoGVPBFzcSMqgVxz42/l+ubNEdfFYmMykXIWYtWjB5upuY1xo?=
 =?us-ascii?Q?WaPO7jXiZEIM+kfOCpLr8xI7CAFcthhlxcv29DDT1OEZvADPcePqJBMEjn5w?=
 =?us-ascii?Q?N65j+l7u+aBH3dcBGqnvgyidOcaPbisz/wOI6tjSPse2w46IPQlaF9k7wtxB?=
 =?us-ascii?Q?/StcTS4CVl3yyn918H4nwV+TPz7UJh3TpeVkNQ18nhN15s2zAs4WrHyKfb2y?=
 =?us-ascii?Q?rwcIkaZsU1qWnddsYga7xX0/ndYjpjFbFsD3HnZ4dASlGnPbez8QXi1dbOS8?=
 =?us-ascii?Q?B7VHIii2A2Mt5FtwgkrfXSd24exieuOlE9aPsiaSmuh/zGyYRytWwLq6lnqV?=
 =?us-ascii?Q?a4Pm5Ix/inPwKWamgWiFf3e+ySUWlEjDdyzHt5uPNkkTQM1CPfH+s4jbGzq1?=
 =?us-ascii?Q?WKdzlOCJw5Q5PUCP8Y6ZGpR6RMHkpLwweNacxaJvemVoNKfkjCLQKemM3RUX?=
 =?us-ascii?Q?N7RyrgqquWbd8DMOVwZzLM97phgGNV9PQxkfSzVfgQoNopnWn8Eshdfp63RY?=
 =?us-ascii?Q?WUC9QkOsUol2m+Ob5ImkF9mQnwy6dTTMM7Z6wdV7NkCSlsmHQJfP+XrL8/Ip?=
 =?us-ascii?Q?n5paiOZoDz+WJsRSGUpWAGQGRX/H5rtuIJ8lIWZgIzrzXGEcRNr4sfzmfabT?=
 =?us-ascii?Q?kZGaySJPhDfnF0wl1QqTlt8RvlzJnsJIcB9PqCO17TipI57sM1Uok8H5n2fp?=
 =?us-ascii?Q?nzrMXqOjPHQOOS2drWkoQ+4x68Ssbkb8H+z8ErRjqYy4Lx2xZb2zi40UCvuB?=
 =?us-ascii?Q?FQZKlPI87J8LadX7fWk6IvZNAT0xbZ3KXab4/cY1Bp+WNC4UJtXS8+B5K0CV?=
 =?us-ascii?Q?ezEEK/RDD7n4wi5N2zRiOj/egPdbtbYOEqmzytL2J2/B/ClBtrwrSmAbB8u1?=
 =?us-ascii?Q?QHOM7rORJH8PAu8M6758NlcdqM8AmYEUb24y5RFT6z4CqJKosYB8V5NsGHBb?=
 =?us-ascii?Q?q0o5GPC4zqUGV89HKS4Ajc1vWaQFTv+LDaVl7HgRTwv1YXOnroR4auTn7jvz?=
 =?us-ascii?Q?rfVySN+dH2U65H8ftCRYaVIKjdAnLEIRD4O9X7vGe+/5QTlpioTVUTu3zoys?=
 =?us-ascii?Q?hjj/UcROY8XsHiMLL9QkcjhF+5lhfFFE9kRrOxvVbMFB08C33YPSgk11I2DZ?=
 =?us-ascii?Q?hOswrxUAB66/hnUb2sYXixnNOpD5HjPGJceRgdhVuauPu2FMJGD1xDjtrz2B?=
 =?us-ascii?Q?6EhL9jwDV3eerFoEYVTF5JNXF9ycv8eQNobqo1YTP8+4CkNtM51lFE/Xcfc4?=
 =?us-ascii?Q?tW+4WZrwvUBVrtFluRKy2FboE3/YHVznK0uK06ci8tOn93x0YsexWwv0C2eQ?=
 =?us-ascii?Q?NpJ+/gJS7B56+4lIabn12X4RSSghHwT8m138CtmENaUZZZdr8a2PLzicoR2y?=
 =?us-ascii?Q?aIIxFNAnrJ6VUotKevb8KNmj3V+GSLZuaCzOHIaSHmNJBoH4WO3E5WFZbg6+?=
 =?us-ascii?Q?IRukBGfAb5nRQ4tB1cBnwGWMJ8JI6JjbnLFW13OBpS0+FO7t2fgr9G3+7HEP?=
 =?us-ascii?Q?fzCAgsE+FljGBU/JgOkWP8wx7ZmxKt3DeaosF23GHniRUb/OePAc0ASX60Ii?=
 =?us-ascii?Q?crHbKk1lpvxp3SxeUOJEAZqkwcD2Sx/aRIu9uvZxCIV12yBVh9MgsFHJ7w9C?=
 =?us-ascii?Q?vnpxZDz4v3P8nLqwXr0ydN3MfRyPw7J5NE3M13QARKvUMzpO4MEDWiz0hsck?=
 =?us-ascii?Q?uIQmZ1cTD4qoLPBOELLKITJoztFgcyUZMAn+6JvE/YD2JV/Pk3wSGxkW3CE0?=
 =?us-ascii?Q?SECPoLlsRA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gMmu0VhhKa9WiObE79Nn2gzIWywitAnWqKYDsTm6Qw6Tit4J1CN4upNKvPuUKDB2FcCRQnZHWOZyGMGpU7MCDOB07oTwP9Ve6vpyNHnLSe0WmXCJOKO3aDOppvUtSfbKSfkZt+/LLd6NFn8ozMN3uVVq+mjm0QC0V0eyFaVSEtfdVIiUt+2TjPfDvqTgsFHZ+M5+70ulw6XiAmiajsdJYcu/OqzHi+ihMpuEi9tObXidGZTnYMiTcUeN1z61jutrqbrTQ6zceHt2kVMV2jsYmGV6XFET10yGcSKdPTiXfteWDhRJGozt5JrlfuKQTtUtH0qylCjYCOzaBSeba6nBXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f88e18-09ed-408e-233c-08df2b50b6a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:42:57.1226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7A1TnESp32LMXbDO8wV/LTovxMPI7Y10UwCEA3KwmTVbTueHhlQc2IgFXlnclMF8kdhTpzfe/qzP9wh2NQm5+yjZhgCj6U1tNpdDQtpnrXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Xu Yilun <yilun.xu@linux.intel.com>
>Subject: Re: [RFC PATCH 04/15] virt: tdx-guest: Support devsec TSM for
>secure devices
>
>> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx=
-
>guest/Kconfig
>> index dbbdc14383b1..2e9407f8bc70 100644
>> --- a/drivers/virt/coco/tdx-guest/Kconfig
>> +++ b/drivers/virt/coco/tdx-guest/Kconfig
>> @@ -10,3 +10,18 @@ config TDX_GUEST_DRIVER
>>
>>  	  To compile this driver as module, choose M here. The module will
>>  	  be called tdx-guest.
>> +
>> +config TDX_CONNECT_GUEST
>
>I asked the similar question on host side series On host, we enable all
>tdx-module-supported features regardless. Then why should we make the
>driver support configurable, any good reason to switch the driver off?

It provides a build-time choice to omit TDX Connect support when it
is not needed, reducing kernel size and excluding unused code paths.
The runtime check cannot provide that choice.

>
>> +	bool "Intel TDX Connect Guest Support"
>> +	depends on TDX_GUEST_DRIVER
>> +	depends on PCI_TSM
>> +	default y
>> +	help
>> +	  Support Trust Device Interface (TDI) feature enumeration,
>> +	  validation, and activation within an Intel TDX guest.
>> +
>> +	  This option enables the guest kernel to establish secure,
>> +	  isolated connections with trusted devices assigned to the TD,
>> +	  validating MMIO maps and authorizing DMA remapping tables.
>> +
>> +	  If unsure, say Y.
