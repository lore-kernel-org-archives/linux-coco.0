Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985D14388E
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712145577; cv=fail; b=S5JLfdqjsL13PXCny1zvZMrIGIJBKptl0iT+GGWfZ9v0MCX2AW5Im/LOrWbEQQ6bI3km8Wzo9+hUfBGM+eynwJIgnw+17hhuEhnap0kTCvB1YikmI7Fr6r/SYlni4MY1vQfjTHGp6DPdV1QOC4TVY5cBALYyjGGy1ttFvZAoXms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712145577; c=relaxed/simple;
	bh=ShyCm8dDQsKZPuPpsHH9mTGpI036iJu2XbK/sOPv0gA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uWBwUgu/MKLNemweh13Isu6afLhKwj9WpoA3S5+X8ucwlHrGQSHeFrlZH60tPAi/RAzY/YRd6cNXChHXxA0ZPYksfN03M5181IQGcPXG8Pq6Jqdj8v54MGxmUNMA4XOfduLLLPkIMumvImGPB2Sbo3bF36iOP0M+v9dT3iii4GI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6K9WARl; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6K9WARl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712145575; x=1743681575;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ShyCm8dDQsKZPuPpsHH9mTGpI036iJu2XbK/sOPv0gA=;
  b=b6K9WARlpL18kqxt68tkcRM3zAZPsW5EMDWxiOp3M6dee6R+QbMB6CIZ
   3JC99pG7osX4RcOF6HczQP1yh9M18Ac/URH/DvUThD+zQFN+k3TJ0SPqV
   5E5sXyzuBiNqrp1g9tai4NhdeVI12yOOjZiD+FLe7QdIWmV2HYOoDEvpH
   bew+tp5SdeC6ipHz57H8pq7JAttIDTctG+iOtNnZbF/fqNstp8Cxcd4az
   t70Mi9SCFIpK1WXda25Qnml+4fps0ElolxVHezzNIHHwo2CGRf/TR7/q8
   gJHN42/XoYxQLS4m6rR2O5QRB7PIEIRdbXZ+B1DvFrS2QPdsv3iaYsiMo
   A==;
X-CSE-ConnectionGUID: uCX/xc1hQd2bYFhI1Z7E4A==
X-CSE-MsgGUID: 3s3t+pjJT0SNu7HUYr+QcQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7559001"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7559001"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 04:59:34 -0700
X-CSE-ConnectionGUID: Vy8vbz/SS+WcwgZhbPNLSg==
X-CSE-MsgGUID: 0DQtY2hxTH2gx/koQE1z0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18520259"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 04:59:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 04:59:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 04:59:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 04:59:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 04:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ4LmsfLpcRQdMjogXwpQByEvktqtD6fcaGLfXyAeHdErrSlRDzMODdCTFSvy4ZWGezKNOVwu9vIGE3L5Kfut2Sadn6iokLeq/5yzIW4xSWpSoMivUSTxoi2vSyd68Ax3w05ZENQnDE4CjlMroDdcQ0n/uzAMh5bXsbebElNlLga7QnPHfI4MeGrYI/douqvDRC2ixAwpJkj7qVUdWNdWfx/UrK9HqtJM44YE+C4gZNAqesS+ZMC+wMFJOoBGV6ShbeDn8FABmKP6S5jG9BwH+dhYXq9o/CZrGzmSHNvwfgxiPb8Ezx3sHrrWqY95Fzkx/Tm8kpqi+BFk+qr527wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIHrKJZqQPsulTKN7Ns9YXRGDy55ZLcVmLgVW2jRlog=;
 b=Gau94Bg5EAzqvRfKA96mnRUXldjqUP/rXyXINjaKsLFJ+KsrXHO0bk79E8Uq70/PzZgKzUIxKtkWr+4AUhdB7rYMuomRyUw7euQCGeWV/1ELQjn8trwSDZzGFoBBX2sWQee4gfdFVgEUmlA9EgfzY2X1HeGLOmp1ieYChx8H0/953CwQeUOQ788e7cB2QN0BbETRLEX08HTYDMQsaZUJfOyzGgdzm7fN7k8hFhPY8Vxo4gP3x8Z6Cpwu4vRfTNaFrn27cdfX9CrrjN2BaLQjhbGVSXqHW7ROGCFPY6eI2yjnfYIJmrvPzEdDs1LdWVPy8sBplmxbd9czcAixEOPkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 11:59:31 +0000
Received: from PH0PR11MB5879.namprd11.prod.outlook.com
 ([fe80::214a:72d1:3a21:922f]) by PH0PR11MB5879.namprd11.prod.outlook.com
 ([fe80::214a:72d1:3a21:922f%7]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 11:59:31 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: SVSM Development Call April 3rd, 2024
Thread-Topic: SVSM Development Call April 3rd, 2024
Thread-Index: AQHahbmwosQgO+A0REK4DkYJ62RHP7FWbZ7A
Date: Wed, 3 Apr 2024 11:59:31 +0000
Message-ID: <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
In-Reply-To: <Zg07c6Y5a_Ak5oXs@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5879:EE_|IA0PR11MB7838:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l1YdpoLHQ1/LoEM5Qsb8S4+IqwQD3ji/Sy+n7EyuvauCJ2uhLUheDDTwbPspmAQb+LvyzmHs5gmUfPq3LTb6qANaB0e/aVC1vW5kilhL0EWDydKDdFnHh5A+2JlArd2G2GUZaUkfT+AxpuPLIoxhszk09c+71ereWNkPNR7WlQ81dBuFOipiGYziv9GyEOrXY+sYPhsrFSdd92Yo4+yWNDnKQd64gtBw9/Mgn6iNK16qp21mfkHUiGxShSPXimTfBlnyk5/+gbbMUA9zlZwssdX+hxkJvsynb6uVC6OVIgNc4wZphRKIoSZl9PE0aGTQfb5CjcTA7mJCe4QeCd65zTn+CK3ggL2BbgF8VOH1LULDsCa6ZFNFPItUNyjW4iH3gVpC4Sy2zcAwmPB9mSC4fQZga7dAbmv1Snu9rrvc0GdHCVr0PdUpYSvXf3jSg3xBeLHDQ0cc13w5IvEuHyHzanuVS67KhnKyPEsaWjuJ595zb+jv0nIom1UTNBVC7ZrJDnCcipszPv8yy4LJ2RsLEOSoUCwIHhFQ5MNdNzTmTbEAnelR7Juw9Zdty3cWzbA6Q+cV51OlKguSst5Pn+zKOfWLMG8Bz6m8eAic1KwSMudYW1WQYKe+4ED45vuYD7IP1KO/uWSbDAiRkzFuCGuGfx3fw2wn1WVQGV58y0yB7E4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2NH8WmYzHb7Fz9DwYcvRWNtGPFRRc/K/eRuhSRLxxST7CaP/G7k9+71T+v?=
 =?iso-8859-1?Q?XfYVKutizyb8XvFMet2FmGrANVpUHoQv3Xf3ctiyd2zA7JRI3Rb0KN8d5K?=
 =?iso-8859-1?Q?qPgYIKuuYJwU0MGOgyN2sijhh0OpO4vbC1O9E1zW442LK+8hhdqwQ0phaR?=
 =?iso-8859-1?Q?jep2+sypTWwNGTHQ3V8HKPIIjHeRjbMQfKGX+OHJsOndEqy6Ji0p3Rws78?=
 =?iso-8859-1?Q?ZqztKuG63Uvr6Y4yEncsyamTAOzuNjiSLdWpouLSCtv82DS0UWcWtfBJsa?=
 =?iso-8859-1?Q?qvozr4K0LvHLIOtBgmtuLMMKjMiBTQR+FYpuDAxRmlMkcE/+AcStVKIln8?=
 =?iso-8859-1?Q?VpTI/P9Q9IMxbeurkhLe72JnvcAm1XkNwTs2Ef4xwuj3O4mbfU/Ta0gpa1?=
 =?iso-8859-1?Q?t8yMwwq9tggM+hRv3fVweJugqc3konaTgoEGBH/EfZVy9XDgLLtjsmwjcK?=
 =?iso-8859-1?Q?XvPzkar9zbFMslTueJIGFAo0nNXRFFvN9xiorbksWg+/nNQyfyyU8tC1Y/?=
 =?iso-8859-1?Q?AAWk9eQwrIZD8dFTPyE0LWr9lnve+D5ulD6EtxucLQHBawLMBDl1sjK5iA?=
 =?iso-8859-1?Q?Ey+/uPvZJ7mRH90Sdk70ogPF97q7U95QGJyax46/K6IPqvhGExTt5H0ac2?=
 =?iso-8859-1?Q?PA1xWR43O4hXoQ5NJ0XWBiV1c/ZNVw34tcLhLgKcFQw+Njsbi5i5DvsM47?=
 =?iso-8859-1?Q?nZoa0Re2yrVVM+DzdX6qSuA4zUzlKWLzTvqDgWhfQ5WDto+D6iOR+9ZQBe?=
 =?iso-8859-1?Q?75KPzEpv/2jFPERiToRjMOyPq8wvrawYz0ur7KwYWNl5UTSAUW5XXMlDzQ?=
 =?iso-8859-1?Q?nVL6QuAMXA5c6uvhlCunvrNCFLK9DCSI4LOYOucnHLyms5MwNNzk5oDD84?=
 =?iso-8859-1?Q?HdsbORt03U4qi9SV1Tp0VqD0aGSzU3/+PVo1u2W25vEDjDCp9r0hMiR9jM?=
 =?iso-8859-1?Q?Eqnn9YDx1O8miP12NYByo/XLo8cILBQon00pW/gZUzCXmsyzzqr/yXFRC0?=
 =?iso-8859-1?Q?D20aPqsvpv4G4K/gwkqpnA8Xda8Jc7kxR4X7q8cFfensxCGsyZbyjZQO1A?=
 =?iso-8859-1?Q?erLoVWAuOuY0FxHz36l1Zrvl6ssyLPFn8MwonN0lKtHktt6rL71tw0Gb4a?=
 =?iso-8859-1?Q?tckSlnPi0aavEzt1KjUcDJUC6fXjYdw8HyGvBfqwqE4rjlI96rNuHJtz04?=
 =?iso-8859-1?Q?IdCeuIsEVLY9UDE2vz6mTA1OhzYzNuu58aoXS1HoyqMHU6TWeHIG503tPH?=
 =?iso-8859-1?Q?mzM9+C+hX2WYcW4cs1CHeQI4cz+JDT4CXQjAK2rhx+VgBjUcml7Mxh52oV?=
 =?iso-8859-1?Q?QSnrdSlqkX1lEnrvwYrDWQp6qcO2RXMTdzUBZkTwjQn4/a1IdGhZ4w8/02?=
 =?iso-8859-1?Q?PTUtpxCbhIhnz/czSCbyi0y5xPvr4h+puGVeq03ts1saSNl7/qgqWNvmEd?=
 =?iso-8859-1?Q?10Veo6WkzU4fx2pibL7WucMY089yHH2QPTd+aKRpK7A4M2ZWg878nv1QBg?=
 =?iso-8859-1?Q?tF4Qza3jZoqRLwnarrSkrRs5dSXDl4VeMLXH0a++4IobwIUqzqdsmbGY29?=
 =?iso-8859-1?Q?8wxw8av3THNtf1fEpI9qx9NlM1XKSk6TKOPBN0YnLOVh9IY5iqgQ6PYuLk?=
 =?iso-8859-1?Q?HmG693eZxTx6QDOFxCSO9pxBePxBC6yQlt?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5879.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9114476-0b76-4f44-b4e8-08dc53d58595
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 11:59:31.3523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OEzoKSuo6ynvktJAENoz3eY/O0d02oQscIUQIcGsmBAkBbqXoaguBbfqaWVfkSinKei4yk5u8tje5GlNrXA2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com

Hi Jorg
Probably you already notice that I have raised the question on vTPM interfa=
ce in coconut-svsm.

I have explained how we did the POC in a secure way for TD-partitioning wit=
h TPM CRB buffer.
Jeremi Piotrowski also explained the mechanism to expose vTPM through TPM C=
RB MMIO.
In Intel, we still don't understand why SVSM must use a specific vTPM proto=
col, but not use TCG defined TPM2 CRB buffer directly.

Unfortunately, it is hard for me to use "Google Meet", and probably I am no=
t able to join.
If possible, I hope we can continue the vTPM interface discussion in email =
before we make decision.

Thank you
Yao, Jiewen


> -----Original Message-----
> From: J=F6rg R=F6del <joro@8bytes.org>
> Sent: Wednesday, April 3, 2024 7:20 PM
> To: svsm-devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: SVSM Development Call April 3rd, 2024
>=20
> Hi,
>=20
> Here is the usual call for agenda items for this weeks SVSM development
> call. My agenda so far is:
>=20
> 	* vTPM merge fallout
> 	* Security issue mitigations
>=20
> The items we can not cover during the meeting will be deferred to the
> next meeting.
>=20
> Please note that Europe is now also on summer time, so the meeting will
> be at its usual time spot again. The definitive time is always in the
> Google calendar I shared below.
>=20
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>=20
> 	https://github.com/coconut-svsm/governance
>=20
> The meeting will be recorded and the recording eventually published.
>=20
> See you all there.
>=20
> Regards,
>=20
> 	J=F6rg

