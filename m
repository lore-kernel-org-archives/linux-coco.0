Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1E13FD80
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712829415; cv=fail; b=rRhiAp8B5iOTCT6pTpC/DfkCnZqugSpwsntIHGt0l1AoPi4PaaAm1lqbnvnti6CqZV/HN2pqSAsk2KayRBvlpKHy9gN2UE7wyTJBZkgkfgmYn/GcT7dvNgIWJUDIJjiHBZ9JIHLBs5twUjMn8p1eQBubtIYNDt6t2MoYWh0j1rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712829415; c=relaxed/simple;
	bh=Hxp8w4Ggsg+7xFs+B05pYY61286f/meLIJivjll3/Rs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YmeqQ/TbA7pEcXtG5MgopO0eHhME7631mOtytCnsVtXwGmGdfIMvAXBo34QabAYnqi5VuU/1/QqOLlCfZ8NaHZuP4U0UU8dlnUO8gd9FXoVyYb71lk54PQYxx098npoIt6C1d6qD7Moz29KORDRvSBCoMuBWHmX/KMqobJOd654=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+Twpz7F; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+Twpz7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712829415; x=1744365415;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hxp8w4Ggsg+7xFs+B05pYY61286f/meLIJivjll3/Rs=;
  b=O+Twpz7FzbIWYFFG07FQzgplp1pmF1x1DyAHzJUESWoXGUESThl0HTlp
   0bKD0s6qUdMWOdLgajf6AqQ+jz5rs/zzoKEyg4nCX6dgvv499cDeU+idN
   G7ypYJpmivAM9yzgf6D1eBANrmvIsqxgOoOrI1RHdcgRWIZcPhLYww34H
   +cdYPE4KucNauL4DntD4rzzdA1GWtR47zPCIP8HsUViTQMUe5gcuZfav9
   yPR//NCv9JTODU722Jh+K+3FrYzNdfynlodonOYJ3J4zGSLtD3/+qpaRt
   8yhjzROk2Aq2j3y7NcBOFJx4lt66ZFEeTaDeovBhQMEGcqIe1qgYMf4Yn
   Q==;
X-CSE-ConnectionGUID: DwD9TsPuSEaT45k6jPvAzQ==
X-CSE-MsgGUID: dUBD+aBdSsKdU5APgomhAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12020384"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12020384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:56:54 -0700
X-CSE-ConnectionGUID: 2g+ccAe4S5q1GgT/JjEy0Q==
X-CSE-MsgGUID: id3Oi1bEQEm+x7yqU8f4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20903576"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 02:56:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 02:56:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 02:56:51 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 02:56:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NU4mVzU6ZI2FEPHLBY/J4astjhgUyDEx2gIQAHm9vzDWY9gGKViZRn+oGIbyeWzDhiTeitec/OyvlVBA6AlVOVrtH2w6YHL1CFFqUJiitdZC8ZO6OVjJCFZuz81ncjOFt/5uRSBU3Mxm/8oX9n3mCZmsuEj1Ow6RB27wKpCVXX9/f5xzpuS/ZNI+XamzsgW7k6nV9ks5Hkrp06YOkkMGEhWMWBwQ4YmaAxUcGLV4xavd1v3OA2znjU6CCJONUxV+R0WJ8qGN96J10P8gfjO3Hzey3yS0RqPJzJ3ilmCWHFGwg0oftDvWRl0lGrqE15jFAjYXDhXSVFcg7G+ALHhvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhjC1Js6WGcGKIVG8wenAfzuk6MrmNNwUNj1juaZNlI=;
 b=aLvOr1VIMfYVZZ+lZfMiiwcY3TRrEe+8ByskATDzaxVW/hXXeg/dLoLdzTF2vCSTbP0Lg7+j5fjvZ/y6ptXOKzKgcQSRPlbZ5NU9QVcgnTkzMWsZZOBAcsxiqdmvQuIa6wMO2FMXRcBzU8jC79kzXfv+Kz2HonGEmymlXKnPTSVwPyCbrlgyPqCYh9TSrRZQxQjvs/jDffWWWDMWw5uRVp9i+nO5tUHZDGltmGmxOUU9KQBbQqtNSV8IiNYDhBCKtybAKZ1cSCvja8E2DV8uNYCapPP00uYQzgwRfoC6IifbvcRV2xI7l+DpZE1YM/a8X6ioUoZjWF/Bh0Tj7fQ09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by DS0PR11MB8069.namprd11.prod.outlook.com (2603:10b6:8:12c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 09:56:48 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::be3f:5a4f:5180:2ba9%4]) with mapi id 15.20.7472.025; Thu, 11 Apr 2024
 09:56:48 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: "devel@edk2.groups.io" <devel@edk2.groups.io>, "kraxel@redhat.com"
	<kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
CC: Dionna Amalie Glaze <dionnaglaze@google.com>, Mikko Ylinen
	<mikko.ylinen@linux.intel.com>, James Bottomley <jejb@linux.ibm.com>, "Tom
 Lendacky" <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>,
	qinkun Bao <qinkun@google.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, "Peter
 Gonda" <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>,
	"Xiang, Qinglan" <qinglan.xiang@intel.com>
Subject: RE: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Thread-Topic: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Thread-Index: AQHae7ExDojlpEcMQUidaqlRqr5fRLFCeBiAgAB/ymCAAH0nAIAAZe6AgASYWgCAACeXAIAZxSBQgABiLACAABUEgIAAHiHQ
Date: Thu, 11 Apr 2024 09:56:48 +0000
Message-ID: <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
 <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
In-Reply-To: <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|DS0PR11MB8069:EE_
x-ms-office365-filtering-correlation-id: 7be01d74-3355-4537-0c00-08dc5a0db427
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LrYHzhspOeQCXqLY3ePb/vqc3pCO9uo+LGdi6+/ar+qLHd/940Pi65O7NLgE/xASnnvd5IzWUGefFhoS98YFHpy+0gg+IxfEEpe3GDFBRAUFPDEeypvn3291aamjKhUlQNVl60q5BDXnzdjlMe0pnwnK6+67f7D/Szb8ukJM/0mSMhY5y94Etq9rQNuHKSmlvthA2mJeLy3fXkdbAZSOjqLU+ZgAmC/JtyqsuYSCqddv+Sx8FgU08mV9G7uQD4b4BKTMal3UwcFAnZOTtaeb1y5HIISCoe/Mil2cEuQZSCFXb8O1W+TQ5ZMNVimUcwGVOJI9GP6qCUCscESNOyML27jNIT7B4KoHYrsvcFGzWrMyNliEmmptdq0k++o7YC4LybgiRLiQTWUvZYHp0BXCBizZwzPbP9TtA4TNFsjeLpeOZA+431DqEI80d2n3SYbRCZ0JUcdq5Ac5fVjMTxEbo6lriG8pYJjrErj1KbrlvDxbc7KT6eqgyW/7J3I8r1vln9bvZpY6ols6zuy4whKJh42ms/Q8OHINUHudnIL2sVKkE/aw0EmWosOZoRVqH5wmhk5VTla4MiFhkKaAmOhgcyL58RnkR+rIwLNaPze4aVAHTxf/tVSkoPcXtM+BYx74ef7/HTgNsjOdTo6uEBjlco2HvY8zsVYHZPgqexhUuAaFC2nC2DnVG3MLognMejX2Z5mU7QuljGehAEERbhWAlBPCZcSRmvg5PNfbXNhDh0o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wxm0fRJzM0NuL2Ovbj6qQGhtH2RVB0IBApOC2uWagw5ojYRBY0NmrYZ5p5Kq?=
 =?us-ascii?Q?8n2i6IAjavpNJ+7M71DCTd/Zp3ddrR9VgcXYz/cbI9ZtVWsfGr2HLLbeXrE5?=
 =?us-ascii?Q?hZCZdBFZW0rqKFvJze1FYoPCZx0sbb+DM45SG8OnAgnVb6QBJROjPy9aZERV?=
 =?us-ascii?Q?+7+hS9cCG/HMeRGCyD65mUSLlBvFZHSV0bDfc9KGshtepohq+7l2X05somq9?=
 =?us-ascii?Q?2TKv3/Hfy8EdKurKva6H5tePl8SQmrjO6UjSOp9JZsAqydnqoqy6o+khNMHp?=
 =?us-ascii?Q?xQqDnskH9yOWnMVZDhWJTv+qozEQPALPAmNX8Oj/PQdqIZK2tWksuEBhoBWU?=
 =?us-ascii?Q?I9jdxdmuixl5shYCqKCVmqY7NmBFuWI8X8XQ23DMrkhAZdzQu+mOsA/THpvX?=
 =?us-ascii?Q?EyovfZehiyB7YkJTSV1TksQTG8ntde8f94E1++96+u9dLkhGhl/uxXzW9OSV?=
 =?us-ascii?Q?QOzkxWadC21wLWyb5JwEtLxdCTajIDg4ZSBO6Tlvhx9McEjnHKoTJJxbOSFA?=
 =?us-ascii?Q?Q3AjapOWJROIMSrZK7k3PZ9VbTtnBsCr0BNDvYp9AsZM3satQS3MdvhKWd45?=
 =?us-ascii?Q?8VpfrVL7umFYvubndsGxTzz+ZCbQL4bHgdtUpdmvk1Byc+O6vW6dJgSJ10YE?=
 =?us-ascii?Q?dMkUfiu+cROlm1FgM5wfwsyTYziKS4Qr8scob8jrcd/qZW6LLmOAalREEPOz?=
 =?us-ascii?Q?qglQHHn1XOrKL2hGjc1KUx+XusY1KJDwzx8RM37PiIwKxVkIfI7M0A7Z6Mkl?=
 =?us-ascii?Q?fKcrL3GwRFyFKRROCeqak2kJ0l2MkQQkZoiPungWMcB7JSj2zOlvUnwET8Mq?=
 =?us-ascii?Q?JcwK0RcrugZMR9QEEz657LdKFpK2ahxgJI7houhpK87zOeN26XkrI94WKis2?=
 =?us-ascii?Q?tdESO2W45cbCRZ/6IdTW9ESFYooEbBnHI/kEvOtwlvUKalB42zDszUlZMGR3?=
 =?us-ascii?Q?bDltT/C7kTlidnUu/bYLEFkkMjL+424H2B27HP0ISBDA8NW97nYP5tH0rFWD?=
 =?us-ascii?Q?GKxqjbKjKHPgxpe1B2zmsSlCuXG/ndDhohXxcvyhZ9tu+oeYD6VfeU0tMaWF?=
 =?us-ascii?Q?bF/2U9/abBlGriIDi4EAleRcrYKyxOOkCndpneypCD74prJHUTMvDmpgvP7x?=
 =?us-ascii?Q?EBJ/jj3jMCTzDSNMxK/rvD6pGUjtJdEaTdNHlV2xsWWD2LVHMFfBMZWE7Aoo?=
 =?us-ascii?Q?gdQIin0+XkrzjtZ0a7rrdqZ0NupDdn9ICaGOduF02Wr2q5fap2Og/3inGV03?=
 =?us-ascii?Q?q3iZOfw48VrpjCxz/yXRuEHeUt6d2Gf4SRS7a1Leaea5a9TLa36LCCr2XTwg?=
 =?us-ascii?Q?UhtdDbwnVY4ANvkY7sGXVA2R+TuTXGXzxCcarpWYiHb/Vq7M3p85uo0ayNcX?=
 =?us-ascii?Q?vBz2ObktthWLFqdcW6Ysb2ehL8tQ6nRf43v0oiHufUSEvMNgrP/as+mtJ6UY?=
 =?us-ascii?Q?jCNmdz6z/a+mABWgXslt4jQ1RjpAo4sd4neVN/MI2iIchXqIzlESdxHDPyO1?=
 =?us-ascii?Q?H3o1x33aT2qxflBlfsfmCZH09Iw7t7ujue/wEHydeUaGy7KXgMJ166cLYYif?=
 =?us-ascii?Q?1OnfIuduO2HDUi3b6DiHD7x++UhpDQ/SjoDCp1tR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be01d74-3355-4537-0c00-08dc5a0db427
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 09:56:48.3269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pVuldoiqL1GTDGG0Zny3GVpGkoQeMqchCsIWT/+THNP8L82yqhEZ05JJzrGmRnSrn8RfsO4pe5BWa5EefW5pcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-OriginatorOrg: intel.com

Please allow me to clarify what you are proposing:
Do you mean in vTPM case, we extend both, but we only need TCG event log, N=
OT CC event log?




> -----Original Message-----
> From: devel@edk2.groups.io <devel@edk2.groups.io> On Behalf Of Gerd
> Hoffmann
> Sent: Thursday, April 11, 2024 4:08 PM
> To: Ard Biesheuvel <ardb@kernel.org>
> Cc: devel@edk2.groups.io; Yao, Jiewen <jiewen.yao@intel.com>; Dionna Amal=
ie
> Glaze <dionnaglaze@google.com>; Mikko Ylinen <mikko.ylinen@linux.intel.co=
m>;
> James Bottomley <jejb@linux.ibm.com>; Tom Lendacky
> <thomas.lendacky@amd.com>; Michael Roth <michael.roth@amd.com>; qinkun
> Bao <qinkun@google.com>; linux-coco@lists.linux.dev; Aktas, Erdem
> <erdemaktas@google.com>; Peter Gonda <pgonda@google.com>; Johnson,
> Simon P <simon.p.johnson@intel.com>; Xiang, Qinglan
> <qinglan.xiang@intel.com>
> Subject: Re: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build opti=
on for
> coexistance of vTPM and RTMR.
>=20
>   Hi,
>=20
> > Given that RTMR is a proper subset of vTPM (modulo the PCR/RTMR index
> > conversion), I feel that it should be the CoCo firmware's
> > responsibility to either:
> > - expose RTMR and not vTPM
> > - expose vTPM, and duplicate each measurement into RTMR as they are tak=
en
>=20
> That approach looks good to me.  It will make sure vTPM and RTMR
> measurements are consistent and it also solves the event log issue
> (we don't need separate vTPM and RTMR entries then).
>=20
> take care,
>   Gerd
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#117619): https://edk2.groups.io/g/devel/message/11761=
9
> Mute This Topic: https://groups.io/mt/105070442/1772286
> Group Owner: devel+owner@edk2.groups.io
> Unsubscribe: https://edk2.groups.io/g/devel/unsub [jiewen.yao@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

