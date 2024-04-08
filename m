Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FFD126F07
	for <linux-coco@lists.linux.dev>; Mon,  8 Apr 2024 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588719; cv=fail; b=N/mUtVz87LW8Mj0HKXLrfvOkPluUSAZOn/raItXES5pGH3t0FIJRsIyRZ5HVL6z7/Sh1ervTWtRg3lQ8W88zqimk77ZYau+W7C7IboLwSXKo3uWqkkC2aW+pkzGhpQENPLl7BY7Tfhoe9WUIRkfAjMyc9aq+UhAIrY+T+llCq04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588719; c=relaxed/simple;
	bh=u1KUBERrsElWWXlTI4q3tdBLfVsgpRSFiu628MH7YIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bo83WJeKMmBXINDW+sbYx9uizyi7jd3RY1ng33NhdmyymR1HxwlLbe9fCU15OCCR2BjHqPRzGCD8qFHhNh1QfeuIrTbbBAc9WCsOsSBaa59otp306UmlietIin+N04P+icvUXlNMsMQJ6Mb9yR0bEc6nw4i7axXhFX30/K6fKzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCF3/5kF; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCF3/5kF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712588718; x=1744124718;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u1KUBERrsElWWXlTI4q3tdBLfVsgpRSFiu628MH7YIM=;
  b=LCF3/5kFdf+pmCnE6aA8wco5Q6dxCPgZTAHzAQDPJpf5PhyGsnv++0lz
   QCUTOClUVt8H1O3sh1nYvoRVVuuUr22BHeon66fdGABgLCH40WjvGLfhJ
   mGxtOoiFl9/v2WwuXNAsJgynkd7NcHmbE0w2CrL1UpUSmDiZsDVt+gEsM
   ZSodQOhrHZy98i6s1oP9H0Cnb9hhfKc/AigJBkUMjXn2uGQiNS644eJKb
   GzSsuekq22Zzg4x/3BWwnPNPISBQL/xb1vVLKxMTH6/LVACLh3znjlmDY
   qCqZsWy38GX2Joh1eWABdph9ejo2COuTkuYAEO95yrIVLpYhE7GRBOwIG
   Q==;
X-CSE-ConnectionGUID: KZxOAMCWQe2PHEpMRuvC8A==
X-CSE-MsgGUID: uuh1QPIUSZydhuYBoPL47A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33267172"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="33267172"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 08:05:17 -0700
X-CSE-ConnectionGUID: P9DvfMxkRACN5CkBwm6BrA==
X-CSE-MsgGUID: mfCUQICkSSOl1f8RnEb/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="19839497"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Apr 2024 08:05:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 08:05:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 08:05:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 08:05:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 08:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWUzltPwIui6AQjrQRxmXvT3Zka4vOxCyDPwlq/d9G5zKV42lk7nllNKYhTB1XVAke4A7qCCIQvacdfQbBuOvG6FoueUODc2uWbS7WBK+KlEr/YosDSzA1DBD1fKLrl9van+t4+4yKriy0k9OQyNnRvalc7dFZmD4QBZxq+5uHuCFMgQS7yCMpZlsgkfKYfJ7RHz0lx8IIaYemuJboEP5DSzxzipvC/51J9g75D0/4M4XvFrj3IzFjJ1vG/QZNU+jE/4NMJiZowOwkxyazLt0Yc3rhclv43gUkob0MoIWB1fZ7imj5cWZi2J0MhzYN2z4+fTFQ4IX4+cAA03ez24yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1KUBERrsElWWXlTI4q3tdBLfVsgpRSFiu628MH7YIM=;
 b=T5h2C1uhGothbqLBCJ/4pV7apABDNoIFHJx9X5MeY0ofkPcWvwyjRi5BJRzywml7JduzfFX7Dp4AHpc26js1DK4hjFpsCa3NLT6f6b/wIVNVzIwupj0RhIkYbZGEiTGcChi35Og9bfbSCH7LKO9O/RlaNh5yodSkXSo7jDryLhyarc1QGaqb6kKzsmUTEImvuUJZcEz0/gfvLajOI8o25zRF0gpah5oO4rQER4Z3OLEWWWzM+U9vNHuQy7msiCGEB8vYw7sRrtRGlOf4b/w3QBZlZOR6T+Q2BwGO5zBFlmSUHXP2ik5Ziuk1utfGcfEL/hwthrx1MBDYaeJRtUwfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Mon, 8 Apr
 2024 15:05:11 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9%4]) with mapi id 15.20.7430.045; Mon, 8 Apr 2024
 15:05:11 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: Joerg Roedel <jroedel@suse.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, James Bottomley
	<jejb@linux.ibm.com>, Claudio Siqueira de Carvalho <cclaudio@ibm.com>,
	"Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: question on vTPM interface in coconut-svsm
Thread-Topic: question on vTPM interface in coconut-svsm
Thread-Index: AdqA0eAumCfddllhSAC8Bgc8QrCrvQAB1U1QAi4n8AAADOmMUA==
Date: Mon, 8 Apr 2024 15:05:11 +0000
Message-ID: <MW4PR11MB5872AEC8837A86F7BCB1AD918C002@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <C8994858-F06E-44E8-BA57-B47BFB7411B6@suse.com>
In-Reply-To: <C8994858-F06E-44E8-BA57-B47BFB7411B6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|CH3PR11MB8776:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LRWTT2ZpMiNjdmg/yMeb1jRchcu6te7R33CK+sfgTG/eLw/0W5xxblKCgxFKeNnYIIFpyNW4nLARH5XyZtH+KqFxHYfk4N3xI80R9pbuj1pyD+K9/E/1dUmtM42e3hFEYF3RsSrnGx7NjDVOUsJe7ahHLcPLK5czlXC61JLRrVRgakevpmKW9+SlBHm7xH+48IhQvg8CDxf8a7iCyy8D2e8jej5rv+fShBxcX/qRLnQ15859tvp/SdImhSqTX2Ty21ivwxqTh/hzZF4skXQDwG1LRlXWFx9xXIxRpO2kupdx5rcQ3EY58TQ9RZ0upTAq9cTvLSPV9u2YfCePiCqyVLbl5I1gvmPcG1yCCglr3mg3zQKAQXb+xSvRsnupfYGrABnM8Tu4C+CHz1cLWvZu7qMxsB+r24hnF8bLoj4h187pXjTWypffbvbTydJeI5Y5wNNtES96DL/NKqE6sS27ShlWBgK6dkV3WWeC1IqVBohtM4zCzVJeP1tyZ8YfGjBmmqkctfxogEbsaakAf0Bjjk6m4hU43xoVU52MqVVmE0Hp2MDyyf1qE/qeEuqbi7fZczVdfdKEX5MhJkEoeQT5laqy/bNd+B9kjSsnBvhvmDZUDE228TW7oiHN3iGcGB6xHI3zYP77w3pUbaSB5iSQUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dh44+eECP+Ue+3fWdkKNiWQxxF1OihPccnv7o3QaqwoheK5qa9h7wTim3D?=
 =?iso-8859-1?Q?1VTHIRmBpv1MoyvHpNwkQ84mPbRgVLe+khJ5X/rZkG3raRhniYgSJU2nur?=
 =?iso-8859-1?Q?HL+dgxM1aFjMZ1vjYtZJYSYHPS3GUldXbUcptBzpDzFxzCFvKa9vlOv/Nd?=
 =?iso-8859-1?Q?/d6swCyT6/EAUI5CVeHKKq1OEtf0p71dbHI/3AQ7O9lbOBQDcx1WUyYFy3?=
 =?iso-8859-1?Q?ydO96b7vYtThz5h3xjFRaNAXXaSVCVLrNUYzXdqLxiEjxlD9CCrQfymm5X?=
 =?iso-8859-1?Q?ZMLNImfh+yebtZY0K8w7/FyGNmpunqGGz94W47CAyHw9//sDClgGMQ+LaC?=
 =?iso-8859-1?Q?J81j2ozdrecwG/Cxq44+e5D/mKZvt5tE6yix3KPzoX4Nb6oEiuk/M3/UBT?=
 =?iso-8859-1?Q?J4dHMiaqCzUhWhBCbViilBMPiYoq5i5CqsprFtXJcVspARATNBPVUUKFqb?=
 =?iso-8859-1?Q?W5Te88jTRhwt48wl6IN0EXWgWUp9KEwbw+v9z4eUrcy+l6HnjKsC3twlzv?=
 =?iso-8859-1?Q?XpS0sZIa4lHnkCDLRhUWry9kkbaAE0mXqSRNAIBa8vtCHjbUDsY3AIDEDo?=
 =?iso-8859-1?Q?1lDNkz325w8LSb7fR+o7Wo2vjHBgOfCM3o1sVqweO3K6nxzoSJMwHrLpsl?=
 =?iso-8859-1?Q?/1OII8k2jc2X3dfkxMiv0e9GMTUenrJqEWLKA6URfcplY7H+ppEUI1w0dW?=
 =?iso-8859-1?Q?sNDRWKi1snZGeasUiJSGWy/hqtXxd5Fodwd7pJ8rdpFMmVDiLX6F9cTfn9?=
 =?iso-8859-1?Q?XB3vDq68beRYjlY/fPZaVvIAVIAQBbWX9vWl1fx83WhZZyjPwBRyajkuiI?=
 =?iso-8859-1?Q?+FR3MQQKMo9sBBQGUlsHwTw9ZA21UhFFnTUM1RSiSKKiVur2l853UMds5I?=
 =?iso-8859-1?Q?lbnViJ8x8ZqWMYKunoDIPBduw9mSTcRm6SUEClR24GVrKdfh45vqECehpQ?=
 =?iso-8859-1?Q?Au7hSvluIT73oGA9vKmUpZwxcVOsuSXygo6nftd8JPuZc4skCC31a/P4HN?=
 =?iso-8859-1?Q?HXAYonvPlCxe1h+UteES+sLpL5jYVagkAN6rdz8Q8vqmZbEKODbDuG980e?=
 =?iso-8859-1?Q?dhbUPydvKrk/i0wgrFCQXOVvQjXQF6frAGiSda2EXgLKXIvVg5TBe+i5oZ?=
 =?iso-8859-1?Q?BA9/X/qSKpK5kd1zNLR7H8r00PAFQGMOSVUcnj4DuTv4hz+PHQYbEBO20o?=
 =?iso-8859-1?Q?tXPdc4810BsflWaPR74EbHve233OVizchZCLYYHnyqySrx0ccRch1dcIsg?=
 =?iso-8859-1?Q?HxsXCThnBhoLlWkRZGhnQagUxZSGPMTUxdUY6N3RwczMV1rsxstiHvQwy9?=
 =?iso-8859-1?Q?l/sXIp66oWqCg63s+eLT/Gyph4Ef8lbTeQW//jrJCkvudJiKtGaAMIfSdK?=
 =?iso-8859-1?Q?b3tP/ShHQ7IEUwrWJEzkyEvvTjRV31C0eqh/kbEiwKd0/FP6yEmDzfDSGw?=
 =?iso-8859-1?Q?dxRd/gU8L7QcVIiNVvtfD13fYiApzvtwCJjKjkinDDngrzKS5bcA6McEKg?=
 =?iso-8859-1?Q?9gPUeUg4eKV1NpV28dtWqfYMomPAIvh9Qxt6jucOXD1HyaMZi2SeE8e79j?=
 =?iso-8859-1?Q?6BPnH0s9wBuOBUaViOlcVYAyqUyytVKoqkvLblgfOE4Rh5qgguh/A5aIXM?=
 =?iso-8859-1?Q?G1+9nTxoNUNj5K9H2Wf8lq7JXuz78TiSlk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7707344-d9ea-4947-cf69-08dc57dd49b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 15:05:11.5846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Hh15RKUyyb2cMa7eOVLZCxpEM4jY1BkMA3p/iIBuBrCTphEwyti6qlMICnblfZzqKOWEBupXnMs/YZZCFxSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
X-OriginatorOrg: intel.com

Thank you very much Joerg. That explains a lot.

Yes, I am in the internal process of posting CRB based vTPM solution in coc=
onut-SVSM. Once the internal process is complete, we will submit the CRB pa=
tch.

Thank you
Yao, Jiewen

> -----Original Message-----
> From: Joerg Roedel <jroedel@suse.com>
> Sent: Monday, April 8, 2024 4:51 PM
> To: Yao, Jiewen <jiewen.yao@intel.com>
> Cc: linux-coco@lists.linux.dev; James Bottomley <jejb@linux.ibm.com>; Cla=
udio
> Siqueira de Carvalho <cclaudio@ibm.com>; Lange, Jon <jlange@microsoft.com=
>;
> Dong, Eddie <eddie.dong@intel.com>; Johnson, Simon P
> <simon.p.johnson@intel.com>; Reshetova, Elena <elena.reshetova@intel.com>=
;
> Nakajima, Jun <jun.nakajima@intel.com>
> Subject: Re: question on vTPM interface in coconut-svsm
>=20
> Hi Jiewen,
>=20
> First of all: I it really great that Intel plans to use and contribute to=
 COCONUT-
> SVSM! For your questions, let me add some general statements here about h=
ow
> COCONUT plans to handle device interfaces in the future.
>=20
> > Am 28.03.2024 um 07:29 schrieb Yao, Jiewen <jiewen.yao@intel.com>:
> >
> > Questions:
> > With this POC, it seems TCG CRB interface [7] is a feasible option for =
vTPM in
> coconut-svsm. We are NOT clear what is the motivation to have a new vTPM
> protocol [4].
> > Would you please educate us on that? Why not reuse TCG CRB interface [7=
], but
> introduce a new one [4]?
>=20
> The current vTPM code in COCONUT-SVSM implements an SVSM specific
> communication mechanism between the guest OS and the SVSM. The main
> reason behind this is that the implementation for AMD SEV-SNP targets an
> operation mode for running enlightened OSes. That means that the OS is aw=
are of
> running in a CVM and also on-top of an SVSM. The OS still handles VC exce=
ptions
> (equivalent of VE on TDX) itself, which makes it harder to emulate an MMI=
O-
> based device interface in the SVSM. Since the OS is already aware of the =
SVSM
> and because of the difficulties of implementing a CRB interface in this m=
ode, the
> SVSM offers a communication protocol to the OS for using the TPM emulatio=
n.
>=20
> In the future the SVSM will also support the paravisor mode, where it han=
dles
> VC/VE exceptions on behalf of the guest OS. In this mode the SVSM will em=
ulate
> MMIO and it makes more sense to offer a TPM interface via CRB because the
> guest OS might not be aware of running in a CVM and/or on-top of a paravi=
sor.
>=20
> So if Intel wants to support paravisor mode for TDX first and add enlight=
ened OS
> support later, it is totally fine to implement a CRB interface in front o=
f the existing
> TPM implementation in addition to the existing SVSM protocol interface.
>=20
> In general this is true for all device emulations the SVSM will provide i=
n the future.
> In enlightened OS mode it is easier and more performant to define SVSM-sp=
ecific
> protocols and in paravisor mode the SVSM can implement the interface of t=
he real
> hardware device it is emulating.
>=20
> Hope that clarifies a few things, let me know if you have further questio=
ns.
>=20
> Regards,
>=20
> J=F6rg
