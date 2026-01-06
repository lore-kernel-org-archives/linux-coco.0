Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022119.outbound.protection.outlook.com [52.101.43.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36B2B665
	for <linux-coco@lists.linux.dev>; Tue,  6 Jan 2026 00:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767658254; cv=fail; b=dD0xE7mG0cbYzgMJDPDQbx8Tew8KHS7p9n/UbZJDrJC4tTvEmxuf9DF+El7TeiGDlIbA8luwGncebSP6fXOkKMaZCMu7bUNN03b2R0C5tSRdGuHe8AojYteypJwx1lc/WXxiA+YRkBRhLF34GPzuoj4VSsQQjuuhurYe4NYqS/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767658254; c=relaxed/simple;
	bh=OWUhzw+zkQfeSs9GVHcLkOlAVeNaBSzS12ik7fuhK70=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HCYtIPHc5Syui7bBPGwcNqRqR3PcVDHxox6hHCY6wKcOUNa6Us4WAtQXOTbMqe7WspNeGGWR7m03SB4ZhvkH4aOOXGKgCSmCLHnuKDC+XuSAb1FRBmEhAtotaEJc9JHOtSQ793Ie+JbAz+UTWMweTRdpgcmnoVC7QDgoU5E3ibA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=RAUOfpVg; arc=fail smtp.client-ip=52.101.43.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="RAUOfpVg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJe6XxJAfiY/HtrfhqK396LdHkRmna+ImHRjCtGTYitPZi/yLXGmU/WhQMFMQKrkqJMdLpaELMzytWBZvOWQc2urqbLxCZaEZ7tnXDdL+YuJwgNa8LxZQ9otKGXKKkVktEvyTr3xPlQRTey3iqQw7aH0a0ViA9ofaELR9vPsNsweNfOGzDVlKUx5/AgguypGSTQPG/o4tjEbzvmxBmJcVU84Oa+Q6xCf8oAn/koij85lf9dFZUd2zeeIaPSdNrv4J9nYOZpYjpGxuJK+QUrAjgagiVYcJnRkFAYm+fkxQuA+6ZdxY9BfT3f0vOpFV77LOlilkozACJ2uKQATB6ngVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0cXCFV7o5CSZ3oFo8TGdh7X6mWPpMGo7GE6z8M7gZw=;
 b=b2xXeEF1LcgqzgLHMUYToil3n1qfmaV4FNvJC/Udhli/byg+rPmGXOo7gd7dFEnokE2iaiwwZDgM8jZSNMyUpewLNXXrjnGSwhRtj9z0YbnFhZQEWoTtAdOLR2prRr6fh/GrhWAUqKhl65z0UcBomiqiyDB+6KqzvSHpOBc3I9gJYjtcbcb3lq7mnrnP7qmk6p4KlxyddZ6Suh/gNV6CzdzgZgPOOJybba4wTDKLQ9Ij21sdy3SxxkJR2L/12XeCJBYSGxaFIEdXG3rOhMxKKJimjxnFTIlJmBgQfLsCswCXKgVLhjv3WKnkDOWAf2P+LgnQ6rBJZZVIpbPZ4ISx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0cXCFV7o5CSZ3oFo8TGdh7X6mWPpMGo7GE6z8M7gZw=;
 b=RAUOfpVg8N4M/i6A3lI9zg1Ssd2IJXyldRNJWWrluSbhJQ78gUzhjybqz94+GowQJBeaxAkYPqaOkN2iSC3Pd+o+yca8/kgRJ7tMJMzMIsd8jbqR0rOhlmLn7HtLr6YJbqxqCcNdma/ikqeBjWsxGU03nN4XEwpjzFMrwTDMiUY=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB5604.namprd21.prod.outlook.com (2603:10b6:610:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Tue, 6 Jan
 2026 00:10:47 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%5]) with mapi id 15.20.9520.000; Tue, 6 Jan 2026
 00:10:47 +0000
From: Jon Lange <jlange@microsoft.com>
To: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Dave Hansen
	<dave.hansen@intel.com>
CC: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, John Starks <John.Starks@microsoft.com>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: RE: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Topic: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Index: AQHcfp/IGr9Q1+Ewh06gECx9poB7UrVEQrFA
Date: Tue, 6 Jan 2026 00:10:46 +0000
Message-ID:
 <CH8PR21MB52221DBBF4D87FC24013FACFCA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch>
In-Reply-To: <695c50eee68e3_4b7a100e8@dwillia2-mobl4.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5827ed61-ed88-4ed4-be88-8b8bdc3b5bea;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-01-06T00:04:04Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB5604:EE_
x-ms-office365-filtering-correlation-id: 8e31e962-c9ee-4e0b-319e-08de4cb80ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|7416014|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IDPR0oZMdv7AOZNqec8Qj0MnMPwmmA6KJaVKwmihPVCrwkv1DbzZ2zFxvXsM?=
 =?us-ascii?Q?SpD48APHtpHdJ8Ay3bB7pACp53NrD+Hi4TAl1Y3q1wxFNtvM+qxNsmvvXV53?=
 =?us-ascii?Q?kzwl24s2ITrEhPpYx1S++29w3SuLO9jTJbcsB6NS23yhFddryyNsxF3lGKIT?=
 =?us-ascii?Q?DbwhnAcsVeb3kD8L+Ich+RIlYIDbhGAaIME7duS2enbySSg8THt6wBtxiYhK?=
 =?us-ascii?Q?wl4aLYtBpPim9eX0nYy6N88gBDdJGDwSw9zyemj/bKt1VkbBKhb4UpRFuzrI?=
 =?us-ascii?Q?OS1/mc+e/2XrxsWTjQC75gdLGHlE2GXdweNf11wPC+IJvjx+1vtNOcdf5sS0?=
 =?us-ascii?Q?0UdvmfH9xurMSuzLYghnVVwCuiRjNWirPyhE6KZPPvUcNH9qONFmpN7F6+8R?=
 =?us-ascii?Q?/Mb6fnH/B01CDeUC0D7S/32cT7ETU0SdYamTtt9ci71o1Gp/IJ5oCitNfUHO?=
 =?us-ascii?Q?Kw6IOGJtVUpRacqTp6t8r9+x7ulCphwmosYWOaIgRv/QqssJIm46b902Gwts?=
 =?us-ascii?Q?+IpToXV8XNzt5HrQ9GAPIUL8t1sr+wkPQqAEgTrW6dBz8UTvUMSX8O7z3IPe?=
 =?us-ascii?Q?xjmGvUYU81rWo15eIXBieSTCEsRe0lsDwhHbJTtD2vEaob5Zvb3UJ6fN6vgY?=
 =?us-ascii?Q?BTMDsAuZhuns6GeYfOdr8aSky9Sc2X6TXM7ksIwL/qsO65WlhHYGg5KIcKPn?=
 =?us-ascii?Q?fNxNJVPJgE03u+Gywf+A1DxnHJ5rmn3zL01NXvwvS2GW95XAwRmvZzgUJnAD?=
 =?us-ascii?Q?3vC6TEn7GyLNZXl8T7OR96DRN4+n5oNilhu5cWx8MVv0/wSt/a/18h8LE+Fc?=
 =?us-ascii?Q?ATtghN+Svizv/8BD09R2UkceM6wsomTUef8tv5V9bNRoD0gbk4Y17G+DAZJM?=
 =?us-ascii?Q?0pttmobugbbSc9jAcSdQPV3FyrM/NpvpQZFORj4m6KvuIjrNOJawv7j/dC9a?=
 =?us-ascii?Q?eVLJkBkyK86VtOtUVfXa0/mVChi9yMPkVqzRLVWMYXde9E3Zl36MjDZWns6e?=
 =?us-ascii?Q?qFHyZ/Y3ebXW79gqUkDCvp1nUmy9qEtPKs/1bIekmn4SKLO3mkg52er81/Hk?=
 =?us-ascii?Q?U/6QpnF4q6/LM0BOeakh6UVxeoHHhFo4F8ABeeGBIaUi3553ZkxRpa8K6G/j?=
 =?us-ascii?Q?90zk//tJcZYqCCuQXlitoWXBsLXSABGgTQEoH21QjpLzx8Ur4iTUg/7NS1fD?=
 =?us-ascii?Q?PtzEim7poj0hbrN2M0P8miLCGf3iEvlnSdUNpmA88cn931hVHA2XgnYbBXuN?=
 =?us-ascii?Q?pU4dl2Cqu9O4IARwhKMDHAB1jCtEYKlxZ6LYPfAzMUHV4jUIxhsl8ckcPGRL?=
 =?us-ascii?Q?4TkNFIeWuV/8kSNs9tX+asrdT9ajZz20a5gkChyfiA1jwGo/eHlKb8se4pSa?=
 =?us-ascii?Q?u68+KK+Kvuec0kfHKWe01+bkFDVeGW30TWUaOrCInPm2Up9mLqI2HG+MUMtt?=
 =?us-ascii?Q?0roHbRbtrr+5w0YJrnULPCsZOXAssifp47AG3TgfQ3VSU6Fjgh3DgWUb0Wbs?=
 =?us-ascii?Q?tK6NqILiYDCYZGG/OfPHEEZTgkVSDd9CBFUW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?b+3oLZw+eJxOi2U2ax10coVRMtYxYV6mMnXts8Wk3iSAU4pZ06FEn/LnwIiY?=
 =?us-ascii?Q?TQ7PIMKn3jI5o2MrnAjj7pfvYxH7i+11E7ALUZEu3bh5AMKagNBX9euK7xX+?=
 =?us-ascii?Q?aLkkdHbU0OEMXbbvfslnZk2wTu2Vd4Z3x8sM3tG1G5k7l/1w6ViV3rbNATC3?=
 =?us-ascii?Q?t/1a3OmK265b4XqKmwImjcdHws6rDIYPKnym9CQl+Nx5OevSz7J5s1HAMRig?=
 =?us-ascii?Q?NHMkwuPGl/HeQfeK4X+qUXaXJv8TF5nFN/u08kq/JduSsfdb9nW2ssjFxiTS?=
 =?us-ascii?Q?UiBfBeTC7qnYExDZFiwk8/hcPJ3CpL/QD2CcdVXFg1aFojWXleK5csmGlxpN?=
 =?us-ascii?Q?4b+6vH48QvpMznmOGlJwrYIwvUpt5b+bgYmsTQR83Rd6aY+c/Fx/+HwnU6nL?=
 =?us-ascii?Q?/1nqyIju4nQMaD4NKiSDSWvmMdlFwzW7zLW2A7SK6f3jaWrAfUnjMhuM87kQ?=
 =?us-ascii?Q?mW5a+6vioFTexd8V6Aigbr/zfGAzjWyvokQplluQKvu8mNkMOBT4aoPx8XkG?=
 =?us-ascii?Q?01+a4R8CwSET19nTVQBlNWyYirB0VhEBHTeeo8t21vKdVJJGlpWCwF3nghHH?=
 =?us-ascii?Q?A9SdaVzZpmu95mQa2aKqyG1FtBsf63+45azqllisEsxoWEgzguJXDgDX1XTF?=
 =?us-ascii?Q?Gbdps6O3n9LxH3r6LzXgFOlQEIQ8Ea6CFbeLPEAfvuWpBebRA1G4Ko+ZwSEs?=
 =?us-ascii?Q?w9D1IP8cebbl7PTAtvVOaVANa50bKziHpHDgvyJ8QU/abU03iTubTEnSD8jX?=
 =?us-ascii?Q?p8YXZ2znOzmR3+BkrxJTLf/uUtmYFYmw4jOkDEL9k8e6O4Ls3MCD7fP0PyNh?=
 =?us-ascii?Q?IckKG1JEDXW9g9llLACzF158B22IkK8Y40jvI6AGNVlnLs3aafHEZgDs79qn?=
 =?us-ascii?Q?MhlVC/4s0yL2H7aOdj5wozT/a+t4R9tvWVqNqmBAu4Se9Bazk+Ic2DXRchXr?=
 =?us-ascii?Q?QMlvkstwCFw66phxwsrm450plKqCinnxTx/49VpDW0IU5dvOubaR/nktZErn?=
 =?us-ascii?Q?XP8BBN7Sd2eCneraLco1AZ5e8h+e2eOWMF7ktGpuiWyRo+UMYaX3PaV6DBq4?=
 =?us-ascii?Q?BMRDtXwgmxlScBsjDC0CF/e2/PqMz8ebJETzMVyds13DrE0PmbulrqIS3bza?=
 =?us-ascii?Q?2g68GlyU7FsqCijARZZAC1iXr+dcx2Bve7slDEiQyzQwtQCyeSrkMl/syQ+J?=
 =?us-ascii?Q?jn8RG98RCyAJL7rB2XTf8LGiQid5w4Kqz8/Hcx+QTsyow4CezwOFoU94f8U/?=
 =?us-ascii?Q?7/wdXwZY+pxbANzuXcAkJ+CVAqXcWSdQrR+CcFsHcJwCl+b54/QgMnqm/mry?=
 =?us-ascii?Q?J9+L/HhzCC0BHq7zhX3QaDnt6NLcAeKxdqqKhHNSOH/TxaN0cEtZ35VH8bIV?=
 =?us-ascii?Q?hkJOLaoZ7StINaK4CYtshwf6Ky5feiWNH8SfJkJA1TIlkv8lsRe7pTZVKpQS?=
 =?us-ascii?Q?ilJFHeydRLuETAcC17GLgPnrW1ChOOEcQtDoWPK+TB3WwsRjK/yJJGpINOf9?=
 =?us-ascii?Q?1bMtzVr+zvTVj0ywzgpHIMETYHoNHbkUkcPncdGzkWPjh4Nr4pm/CqKaRPxc?=
 =?us-ascii?Q?Q8L3YkVSwXDEOyc+p3Es0zY4uCELcn4YEAB4yT+mNLBL2mXIE/8u5npFIlkR?=
 =?us-ascii?Q?rPWW7hdPWD2ZL2vazwS6FKeM5xNs1p2LsfWx+rreG1JQDfXqIDv7l6BQYlin?=
 =?us-ascii?Q?64sgVlQpCexetpgSBnkTI1QSgxXcpT26puEcGbP0/pfrNBWOSfSQVSDsbYob?=
 =?us-ascii?Q?wHNGeBKP6mBiXz+zoKNXVuLyajPOEp26bjadGy+Agli/7h8R3Hnr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR21MB5222.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e31e962-c9ee-4e0b-319e-08de4cb80ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 00:10:46.9923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wD3aWPbaKBoaQnALcvJE4/4di5vmC3HujOqenE+aoic2xYdPJ9Q3+OpXqby1HclD7Zl7wgrlw/u+j9s2XMuPPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB5604

It's not clear to me what advantages are gained by reflecting ACPI informat=
ion into CPUID.  ACPI is already available and is usable across architectur=
es, unlike CPUID.  What advantage is gained by replicating the information =
into CPUID?  Any advantage that doesn't have an equivalent on Arm just seem=
s like it would perpetuate the cross-architecture problem and would lead ri=
ght back to some other proposal that works on multiple architectures, so I'=
m very curious to understand how CPUID provides a meaningful advantage that=
 doesn't invite new problems.

In the LPC session that Dave cites, Dan (I think it was Dan) threw out anot=
her suggestion: have the hypervisor driver detect the paravisor configurati=
on using whatever is appropriate for that hypervisor architecture.  I find =
this to be a very attractive direction because it eliminates the need to de=
fine standards that can be supported across hypervisors (and across virtual=
 firmware implementations), and reduces it just to a small set of concepts =
that can be fed into the kernel.  This could keep the enumeration out of th=
e hands of ACPI altogether - thus no slow standards development.  Are there=
 downsides to this approach that make it unattractive?

-Jon

-----Original Message-----
From: dan.j.williams@intel.com <dan.j.williams@intel.com>=20
Sent: Monday, January 5, 2026 4:02 PM
To: Dave Hansen <dave.hansen@intel.com>; Jon Lange <jlange@microsoft.com>
Cc: Williams, Dan J <dan.j.williams@intel.com>; Sean Christopherson <seanjc=
@google.com>; Paolo Bonzini <pbonzini@redhat.com>; John Starks <John.Starks=
@microsoft.com>; Will Deacon <will@kernel.org>; Mark Rutland <mark.rutland@=
arm.com>; linux-coco@lists.linux.dev; LKML <linux-kernel@vger.kernel.org>; =
Kirill A. Shutemov <kirill.shutemov@linux.intel.com>; Edgecombe, Rick P <ri=
ck.p.edgecombe@intel.com>; Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [EXTERNAL] Re: "Paravisor" Feature Enumeration

[You don't often get email from dan.j.williams@intel.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

Dave Hansen wrote:
> First,
>
> Jon and John gave a talk in Tokyo about feature enumeration under
> paravisors:
>
> > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flp
> > c.events%2Fevent%2F19%2Fcontributions%2F2188%2Fattachments%2F1896%2F
> > 4057%2F05-Paravisor-Integration-with-Confidential-Services.pdf&data=3D
> > 05%7C02%7Cjlange%40microsoft.com%7C2dfafa359d6b4bc7488308de4cb6e7ed%
> > 7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C639032545637571280%7CUn
> > known%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi
> > OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJKT2
> > 2S031BpC1gwBHMFOOHfA%2Fx91vXaysS6Gg2kMVeE%3D&reserved=3D0
>
> The tl;dr for me at least was that they'd like a common and consistent=20
> means of enumerating these features in OSes, regardless of the
> environment: TDX, SEV-SNP or even ARM CCA.
>
> I wanted to explore one corner of the solution space a bit. There was=20
> a pretty limited audience of folks in the room. Please feel free to=20
> flesh out the cc list with anyone I missed.
>
> Dan Williams' first thought seemed to revolve around having some kind=20
> of platform-independent device that could do the enumeration. Maybe a=20
> synthetic PCI device. I'm sure Dan can chime in to fill in the details=20
> that I missed.

More that it sounded like "just another firmware enumeration" problem, wher=
e a platform device is one of the results along with related firmware table=
s and objects.

> I immediately just thought of CPUID. We already have a whole region of=20
> CPUID (0x40000000) that hypervisors use to enumerate stuff to guests=20
> by convention. It wouldn't be a large leap at all to carve out a chunk=20
> of that so that paravisors can use it.
>
> But the biggest barrier I see there is that our ARM friends don't have=20
> CPUID. It seems like they _mostly_ have bit-by-bit aliases in ACPI or=20
> DeviceTree for the x86 CPUID bits, like:
>
>       X86_FEATURE_KVM_CLOCKSOURCE in arm,pvclock or
>       X86_FEATURE_KVM_STEAL_TIME  in arm,kvm-steal-time
>
> As far as I can tell, these aliases are all done ad-hoc. This approach=20
> could obviously be extended to paravisor features, but it would=20
> probably be on the slow side to do it for each new feature.

"Slow" as in standardization time?

> It _seems_ like we could pick a chunk of CPUID space (say 32-bits of=20
> it) and alias it 1:1 with some DeviceTree/ACPI property, say=20
> "arm,paravisor-features". Kernel code would just be written to say=20
> "check feature 13" and the arch-specific helpers would either steer=20
> that to CPUID or DeviceTree.
>
> Is there anything like that today that's cross-architecture and=20
> cross-hypervisor?

That seems the definition of an ACPI description.

> Is there anything stopping us from carving out a chunk of CPUID for=20
> this purpose?

At what point does an ACPI property become a CPUID? In other words if there=
 is an ACPI / DeviceTree enumeration of CPU/platform capabilities in firmwa=
re that can supsersede / extend native enumeration, does it matter if x86 m=
aps that to extended CPUID space and ARM maps it however is convenient?

I have no problem with an extended CPUID concept, just trying to understand=
 more about the assumptions.
