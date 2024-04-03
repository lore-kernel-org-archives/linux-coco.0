Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E905200D4
	for <linux-coco@lists.linux.dev>; Wed,  3 Apr 2024 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712149898; cv=fail; b=Ei1UKmh2qvZ4Ol/fODzdHXVdX/HtYc/235RIGWAzc+37MCliwdJWLgwXt6SlvcaZdmJ9el5KmnjDN6zM6hlQPuicCrWipr/1zanIZtQn7Dh3MZlRTcS5beU2K2tPLchjuPgYD5RtQNlNKW989065ARTXRSTFhK5f3A/yvDjeFBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712149898; c=relaxed/simple;
	bh=Tc55D7xNe5h7CU6RbRSOIt3BOfeme8W1pBj8kRrtM/Q=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NsjKYtaGZuMoDEes2lc+gwiAfzAkWY68ouO+nHgAPWnnWVBUJ2QuK9wppu2C2GYJGTL9CDDjZpm2BLdFAiRA9+PNsqx0mhN+12A9YmE/svkv2SmpbNg2brnTmLaSsQZV4CbB1J6mo8dW8VqAiwB6rygNABYbOk4bsZZjWBxARr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETob5FHg; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETob5FHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712149896; x=1743685896;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Tc55D7xNe5h7CU6RbRSOIt3BOfeme8W1pBj8kRrtM/Q=;
  b=ETob5FHgaM0wDxFySr22cIm68aChMUQQNsUbV/GdIW+R8g7/32CvleTQ
   CfpzYHPuYec4hFO6Buq+sUgc2dDhSwjw3D3phLpAqUAyAX406zld7y2UD
   M1xJIqry/bHyzDfJt4CH1x6u7V5Jnu3TKyWO1R1XddfQk6PNZ48EJhmrS
   5VMA9baj0AUab6ZmT9B9OdHpUl2j4TFJ0zxZj2lwJ9MK4VdApyDJABMzK
   0K6g4+nJnT5R6rN/KmJA+tu+1Cu8nUko07CsvOoIjuiBcAS9Q10omW9OL
   ih3cY9eAB9jGNWTeYCcweTZcwzaIHh5eWzjy+YqhtDpVGC3MS2N3TRgro
   w==;
X-CSE-ConnectionGUID: OYdc2KX9STCoxM2eJ5SXwQ==
X-CSE-MsgGUID: 3B1MKnfcQiacuZ2r5lx2ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7505565"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7505565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 06:11:36 -0700
X-CSE-ConnectionGUID: szNEHqiNTi6ct7HhoKU7/g==
X-CSE-MsgGUID: z75jaAwGSaKE3PWB7vjXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="55892397"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Apr 2024 06:11:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 06:11:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 06:11:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 06:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AT6QxFK4pS6a4yLg1qyQxLpDuxQ+Jd8u4lu/2aDXvoyOCMJyb8G04Mo3JlYhzk9uAowqyuVCyX9Zl1mIB5F89JZi61RFwsOfxZwVfernCGE87289J18uKWtawLewMOiMC+lvRo3kDij3lD+OC32QSoc96pwoz9xxOioOorGbjAggKpfgv3aCSDJx9CElEuXXVMpn7xG5gET1tXWFNjZUjL292o/Zs9zi02yNedOSeiajIWxkh6Bd3J0L1Pl5sxJewTPhBkuLzvsdpxwwe8uWaIeCyrJhCbzV0Kg2tYoq+Y2+U/j9/MyVz6YbK7yKBbvopirIlztELEPrvCXDqRXjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7Oq7hLGBs/wZ4INDUjH+EMEm/TDr6zdDrTYe5fApWY=;
 b=WyEx0CFumqx5jxbqAHyrpoTJ33zi0yWGVUEDaFv5xd3bm1GaL6YIvdNmG5DcGHJj87MNB/LiZcBO+c5IXzo6i70bwEUWNPA73mbV3ETMnZYG7VQ/FFVoWt32ZpBy6ItSAC8OKUxGnjrmI3XAD76DArlCC9YNQtVriPz2lSfpGWWICVZh6h6/BZ4dnQdgulRd1ySPmth9X+oCe7Aiy0QfRIsw2GKVp7/Vi8iFA368syjR9tBNBSpP3VQJ/s2KW/EaAeJRI23ZQUBtGBcgJ330bPVEUzYei3AwQ/V958d0U+rTedFbSn8Kmxh4SYookO0vBq4yE523QG8xZO+A3GjB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 13:11:31 +0000
Received: from PH0PR11MB5879.namprd11.prod.outlook.com
 ([fe80::214a:72d1:3a21:922f]) by PH0PR11MB5879.namprd11.prod.outlook.com
 ([fe80::214a:72d1:3a21:922f%7]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 13:11:31 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, =?iso-8859-1?Q?J=F6rg_R=F6del?=
	<joro@8bytes.org>, "svsm-devel@coconut-svsm.dev"
	<svsm-devel@coconut-svsm.dev>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: SVSM Development Call April 3rd, 2024
Thread-Topic: SVSM Development Call April 3rd, 2024
Thread-Index: AQHahbmwosQgO+A0REK4DkYJ62RHP7FWbZ7AgAAJFQCAAA3MwA==
Date: Wed, 3 Apr 2024 13:11:31 +0000
Message-ID: <PH0PR11MB587915ABDE162E557E5BD5B58C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
References: <Zg07c6Y5a_Ak5oXs@8bytes.org>
	 <PH0PR11MB5879CA2156D964F9A3808E038C3D2@PH0PR11MB5879.namprd11.prod.outlook.com>
 <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
In-Reply-To: <74ff4091f24370033a349b72ba222a30ed039b6f.camel@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5879:EE_|DS7PR11MB6247:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LoywIkUoQYOhSAmotGHbOwcxHEFUmkc1nTqsUj0F+nYkHmnd0H+SjzOpi92iqkQuxJISexbnTz11vwl082D8qEnEDX2vKK0KiXWdSmDHSDaED3vMkpvgZBonZxggJ4UdDicKiGT+rXMzvnPD0nmnj2pVVyR6ePyOWee27/tJ16r+xMfwTMhXrxzWG8C51kDL/2G78xvKF02HusUAHyqY8f+vVY4s22Fxh6AW4x4iG3HoxZ78ulN1/LylmBW4RyVmEsuOL2l5h+woSPnmc8+QhVp0ERnvYLwhrwAMwYrzAMWBaAGiB+f/2p20HNX7fceO7TH3f6ie/35uVRgnQA1XY14YarT2NZMlyyhhOIx/lZ9tpA7EqvaouwmR9P9N4TbivAfKPeTuOmpQz/GBqWU1eQtEjOke5m/36l4yMt0mf8wm7bFzefILRjXM08ESYUFLbKeUuL9fwSTOZpKKQMCn2PMLunMlBkQH7IfadshS3/q1slE7FwsIlwjMf0Nh4s9DJwhzY2F4c7q1x525cJHkwr8XqWFq09RXcTh2KcrsLpnHz7f+UNU4V1q6rwzVWCIUBzES5AlX/zeFggSmWRG2qnRxX9RZY9UtqjUIefSQJ4GYHH88jhCmrx0ds7SQ6yW+SppTPVBdQ6vxa/xNVW0++N/J/LoXuxTlt3rC2gGCzM0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5879.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UIS2W+Kvj5/diO92DGch678Xp6pHTB9RGOkJiacN46arpnoHFYkBrFgurY?=
 =?iso-8859-1?Q?dPl48EXUzrl5zCmk7+xnjrjAcXpWQPbJbaVLtuN0DGVXJKuLnfXiT329x6?=
 =?iso-8859-1?Q?bFtxKowAR9ljtfxXeazmtCCU4d3QYnGZibOWuN6uAl46LxgxujwS7SMGjK?=
 =?iso-8859-1?Q?rDyO/3hyIx5dPiTnkIxOVJhPbQif1FMGJkK5cJOyDX5kopHpBkYzNipHWo?=
 =?iso-8859-1?Q?65RQoAG6dgN+tr88O8x9MVBzaLUOA3eJ8w7AIDIk1EENOmo0u8KzOfM9TE?=
 =?iso-8859-1?Q?hGbHlsWv1pBZRH8RiFADikJVWh9i1tX67JPsn/ibFAHLelF1dzJYgt8eX8?=
 =?iso-8859-1?Q?TUO+ARrjZLwkubR1k3okmFd2N/4KI/Q0RLi/1Qgc44lZPjNXoQV+lkJajb?=
 =?iso-8859-1?Q?IeC9DCizLl602g/8H0FmGdcCopoASFT8QxpmqPTEUE8BfZfstvHTlaEktG?=
 =?iso-8859-1?Q?S1nrR2rm1fqdMQxIeg1F9JTdmvL23V1QUHj21BUqGq4d0pevEWt6oBHlV8?=
 =?iso-8859-1?Q?/NL2g8Z3CVxiCT1apmYvq8Cp2xUY+tUZ9mIjXGGuSLrv5Vciy3mihL2Hwy?=
 =?iso-8859-1?Q?Lv+yIJSUh4ira5NfbgL/XEXr+vDBLTIbt0GMRVsIWcT7H9C2iTnHx27A3B?=
 =?iso-8859-1?Q?dKP6ObPngrD1DJassEMFeXGTwaYE0mMPJc8wHvWxaYQhBt1OhH9/kLx5mk?=
 =?iso-8859-1?Q?iSZWTZLalLNDsH/acw6IDFpOw3oYJw2IVue1NmCAaH6JUMR2Nikd8gkjwz?=
 =?iso-8859-1?Q?/Sz9iTm/XXqMsmBwcqbwSv0pEZC+Phsd2Wb1meGunruufj+z2Cc32l1/Aj?=
 =?iso-8859-1?Q?XQj9lNyGMLGtzF/iTc19DmS0SdZtfbLajLIw59LWrVZ/jfazZhh4a89Lcx?=
 =?iso-8859-1?Q?4Uh5AHvbceeMMVZTOqdUapZnmZsFhLIda89kSu6OrJrDHQ00AatGBItq86?=
 =?iso-8859-1?Q?/yqBkXRbDVj09zhK7vpkJr0alHSGuT/kfyxb8wxyFieRtZBBFDZhyqERrD?=
 =?iso-8859-1?Q?FLNxNkJsAu1UDlCoPOLzagBaUjzxLRhAdan9D3r1+b2bFF7H2w7NOE0Q1W?=
 =?iso-8859-1?Q?2d6w/BvnrL2QGKRfQ/IQxUml1wh3/WAxZw3jMw6IPxwV7H5W3koEVczpOW?=
 =?iso-8859-1?Q?dc+LJ5gqgsmBynEA7sSgBXpTxmBwRgMQzwZr2B0DtjtDeNh00CSwNleNyG?=
 =?iso-8859-1?Q?okGgeJysyclKbztoEuyB2oegEj1W2jSdls/5L5d3Yf1vcpDwPyrHUCKwvO?=
 =?iso-8859-1?Q?zKoD0KOGex1ybCbIVHpa2RsxnOCLZpPuKSmHYPh3ba1W5agISsBPQ5khaB?=
 =?iso-8859-1?Q?g3fT18nDUoOAy1BVX6bxcperDexeu9pD/tNMSQqLaNWziuRqN6bRyx2uaB?=
 =?iso-8859-1?Q?MmzQJXU7djOvyQ/qBSN+EjyEo7hQ6X5G9C4Zd0f2Aol1N5J9Sijwb+vcEr?=
 =?iso-8859-1?Q?nRSWXJxWuBS+gQ2kN9ZvAElFV6X3M2hfy3ixwS8SMI1ktoh+AyWM1ggJGc?=
 =?iso-8859-1?Q?L5J5bFNPyzBrtv/6KyrmPJvo/M/l1FA2KAx6QMg8KSP+Pil2KbenLhFeOG?=
 =?iso-8859-1?Q?UmY2HacdqrnDcVX1uimPE8QJpVq9EiIsRESIb9RTMDXIbplnJalJwtVMuK?=
 =?iso-8859-1?Q?6rbe/RtqNdHxlbjf7E6Nltxgs4lrqX6NpS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfed9f2-156d-4511-5c72-08dc53df948a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 13:11:31.4590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HOe1JDdIP23Xg1hQtzpppoJRqK4YcV1Cx/JJKcGaB2XWEymrs+VCO900RaVa2lNjtEcMNgGRQPYU/s7GScTX/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
X-OriginatorOrg: intel.com

Thank you to confirm that James.

Yes, I will sync internally to understand the process for submitting patch =
to coconut-svsm.

Thank you
Yao, Jiewen

> -----Original Message-----
> From: James Bottomley <jejb@linux.ibm.com>
> Sent: Wednesday, April 3, 2024 8:19 PM
> To: Yao, Jiewen <jiewen.yao@intel.com>; J=F6rg R=F6del <joro@8bytes.org>;=
 svsm-
> devel@coconut-svsm.dev; linux-coco@lists.linux.dev
> Subject: Re: SVSM Development Call April 3rd, 2024
>=20
> On Wed, 2024-04-03 at 11:59 +0000, Yao, Jiewen wrote:
> > Hi Jorg
> > Probably you already notice that I have raised the question on vTPM
> > interface in coconut-svsm.
> >
> > I have explained how we did the POC in a secure way for TD-
> > partitioning with TPM CRB buffer.
> > Jeremi Piotrowski also explained the mechanism to expose vTPM through
> > TPM CRB MMIO. In Intel, we still don't understand why SVSM must use a
> > specific vTPM protocol, but not use TCG defined TPM2 CRB buffer
> > directly.
>=20
> Nobody has said *must*.  The enlightened interface was designed after
> we had all the trouble with the CRB one outlined in the previous email
> thread, so that's what this pull request has.  However, this being open
> source nothing prevents you submitting a pull request for a functioning
> CRB interface if that's what you want.
>=20
> James

