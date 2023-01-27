Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2108.outbound.protection.outlook.com [40.107.223.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339563205
	for <linux-coco@lists.linux.dev>; Fri, 27 Jan 2023 16:12:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itIRBR4CED1gy5U0edlicx6w6q6rgiw+YCCUj3zFTAmlEUfSbD9Vq0i+7namfW3AIlXqvBY3I9ZSxT9/zxZuAyjMIkui3z9YJ++wXcYnRKY+TcdZq/rqaXkDZuQQsiZciSSSxR6fGxJDkg2VzQXLwx+goMn+IzHgCnXIqhax5Lg5z8tcgk6DaE3lcd5dMk8GYQOMKB4/Uv1XBs6xpUbeJNv6lCMvN0JM2+h0C0r5BpwwZ0cXNB7yfSZM6Mg/cN4CHRZyth21c8jSyh7jJLL7+a2VjxMM9eaDFawhAyFmJUsD9MwiR7V4pdOsAWs3csV8wOeyIsUX1aRLHPrAEyw6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkYGvWJQj6PqmyZXDGUbVxfUQbBNqLrl/tYKdrv/9K8=;
 b=NGC4HyYMDF9oxV371BHzpaRFEY0u67s4q5qOyLODT+pmWtH24zaYDVKEtmzFS1k2QWeebivyqqYR+3im3J89GzycU6vq0q9sfmEDaMD4exySzYpkeYjjZ4dsu81hkmIhASkhoFVYftsm+cgxtywpqaHF6sEmSms3ezaaXZp5LyODPVVGK2XlsxnvTSt4NJbCjpaE/6p7gWu/05LK/3eI7xB52QD/57WtoFL8fyRQUb31hQd2HGifBD6S3GxirPGN41xrLSiJGwt5qCo66ggOARINwOqMV2bnUFx2XmEcoM5VFENNZSSz8r23HOpp/9bNNU66ZtO6GsQ6tP4MSMrvYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkYGvWJQj6PqmyZXDGUbVxfUQbBNqLrl/tYKdrv/9K8=;
 b=BLUVe/G6yEj49KrdLSaHDdyaO4UugMVvS2uvN3tVf+MplYNkZCkGkX+6SDuJUlf4gXeJa+MWd+7WYjYwHSTZ9B0/xnTP6Qqex8C5PCG+CBDbqpqmW+FNubIwzuz+SNviFThROQ4Go+vb/aLwBPv+X+kjEH0YONQuD5M3Kbo1Xac=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by BL1PR21MB3234.namprd21.prod.outlook.com (2603:10b6:208:39a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4; Fri, 27 Jan
 2023 16:11:57 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d%5]) with mapi id 15.20.6064.007; Fri, 27 Jan 2023
 16:11:57 +0000
From: Jon Lange <jlange@microsoft.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
CC: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>, Tom
 Lendacky <thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	<amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Index: AQHZL9idL/cAC39M7EuN4gPMmRZpBa6wy6aAgAAg3wCAAAs9cIAA/RAAgAB5gAA=
Date: Fri, 27 Jan 2023 16:11:57 +0000
Message-ID:
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
In-Reply-To: <Y9OMuuHz2utBASOm@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d8e07945-ba46-4509-9485-b28d9e2790eb;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-27T15:49:57Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|BL1PR21MB3234:EE_
x-ms-office365-filtering-correlation-id: 1b44ddae-912b-4236-de8b-08db00813712
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NdnJF7/w7Dl4pkv7pQ+OyIs/gvaNG6osguACSV+gTxsz1gV0Y6BwdcpYt+F3q3p3tEnh2qf0H58MsubEvx9QNRBiG6ZfZ+QxrT7mfv9QS9nW8F4f9h6wpDekmCUgk0Lpmd0i5n7a74yA7+AjGIn8YSki4AYD6y99QMKP+ZthzGQt/IYQnShwL9chBV5vLpNQ1s1HQWGs2bLBCCTgHNXkH51/bIryrp1LZzK27EJ4pg+QqLZXuoc+K/4aGklYp2W8KHp5Dnwidpcz3CvHTICUEOR6Zm5TuMvlIMCmwbZ/UCgX9C08tmW4DyOu0E76Nx2TzQLBaCecNkcwS+O4OswEQ39k/uyOBkNrw2QRoTNvYJsGkY8QS2nH/vkrwO8x10SmLAM3FTiloUTwuykxqVzAsv5yIeJAOC4DCvEiVgl/uvsWq2z+ZMhgHrRQyYNySDJh+81JEGYVaYQaGRXQvyDAT3VSwu685v2F2Lu3wAHLi5dB2tdCGa524SHZUkYCJbQ+uYPkbaGIydjYWzD9shq45lhy5BK1F1EGOQazmYDru04Wynw2AinvH61sVGxa1s0ooVx4yrEIupAPRgi/Isj+nhVp0fSAU+AL5tiTbzBbX1qJa+rzMATK30KP9xhNj9lRkBBHeH/NLiEPTLd09mD8yzI7MQit7yNCjyLOIxztFS8j/vqNK10q7BvHRudC+fJb02q6VtgusS/hBfDYrgwi4zXzVL5mnCAaPXjEcCiyL+FgBqudNbV43YUgxsxIf9EG
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199018)(186003)(66899018)(38070700005)(6916009)(66476007)(64756008)(10290500003)(316002)(86362001)(76116006)(41300700001)(8676002)(71200400001)(5660300002)(66946007)(8936002)(66556008)(33656002)(53546011)(4326008)(122000001)(82960400001)(55016003)(478600001)(6506007)(38100700002)(82950400001)(7696005)(9686003)(2906002)(66574015)(52536014)(83380400001)(66446008)(8990500004)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7+weBK12I5yiq+814JUuVjL1A9QnQnMd9X02ueEnYzHr2tkO9hr/5Msy2O?=
 =?iso-8859-1?Q?OTye8mbIE7/mjX/HLu/Ku4p7XQlZCguGcts3WmCEhoOVnMQneef5H9Czej?=
 =?iso-8859-1?Q?ZYq20CDM/p2Y1zrJip7OW1I1T1KFVx5uXgAuoty5uXa+VJ7pCuRl5hs1zN?=
 =?iso-8859-1?Q?/xsgKw/KrP+/jkh7XuDlsE3Xewk8HhTjsVlIcYWK01zOT/xK7uBIyaW6tl?=
 =?iso-8859-1?Q?hWn66P6oTvViUkEkyW+2T+dFxpNLxXfq3L2A4tBCy6lbYPaSHeiQ8zgClM?=
 =?iso-8859-1?Q?IgvXSVS1AXSe6V0gqIAIIBQQ0TiX+Wo2OlZfiq3Fs4+EmgmGlbn20sOvb2?=
 =?iso-8859-1?Q?it0RDOpGj4ViSCrBkod44LcOyuFp/XkbfpfQ1C4VOuNETzbV13QoPuGD6d?=
 =?iso-8859-1?Q?3iwyPbjVhtjVrg/7EsGq36ahHuZwKNZbEbidhTJi/QLzocn6F92G6gCINj?=
 =?iso-8859-1?Q?JDvtonNLrF8HC6obvqFjBUsbGmKhIA0+ZRNjEQige2JSDoNEY1t/ttMgaa?=
 =?iso-8859-1?Q?FGDKMRXXF/T71CwuR/sOJHrwzO0S0n4wTITqu112W80AEz+Xhr7JSw6n3q?=
 =?iso-8859-1?Q?mrdXdpiS3HbRIs22cfSarKtO5Gy1q17y3VFsMK/Tewpcpb49weM0c0P6+1?=
 =?iso-8859-1?Q?Bf7NnylcE+VfxnEAB4APGNmiD0WqUYEdIY/ehVT+iDVpR5vy4j5/Hx1PTK?=
 =?iso-8859-1?Q?V6sraxtTNF2Xm2jkDV8s8txcpQ08mKXjY9b5gxGgh81avVS9l/QY4iDBz4?=
 =?iso-8859-1?Q?QgJ++dvmqVgwiLcaQverJ/2AjG70siEdew3gw9ozunMdOwiM7ygzqnSByi?=
 =?iso-8859-1?Q?BxxJgu/NDhcyULGyHmgQWtHea2A3vLTREf2sFHJVNk45hLU4I/BDm9/HXG?=
 =?iso-8859-1?Q?Tet5+YUNFKQQe4ip/jndxZNqpxBkdfjW5nnyZuX3dlQalBmM0zPnK7yBwg?=
 =?iso-8859-1?Q?fKpZpU1AY9Ku5rjxqGB4WH+9e6o56zEOQrjwbNK4h43LB2V9/Hu7fdK6WZ?=
 =?iso-8859-1?Q?gz9MyoyKSggfnMUkGfuO62/MOJPXxHokCibZRUwZRVsW1/l8Pt4/nLQAne?=
 =?iso-8859-1?Q?qQ6Uxf86QG39012LLxtNlbw5m+9dZoOnKLEbpAuD+RuYDLoRoMdE4N+VNY?=
 =?iso-8859-1?Q?WtvfjYp1ltKBdStGWMZU9IYLfcBEU2d+GEww3oHvCJxNsO3C7j/h2l7dFJ?=
 =?iso-8859-1?Q?L7cnk2qt/QK/rKg1Puaku1VVNsO/GfDpJvQGxacdveW0BfeAgudqNf06d8?=
 =?iso-8859-1?Q?kH9DQQ3FPC9g5OAsGFfJqeuQero3GzFTOC9xZt6d2pINh9NzoDeeEV2n1Y?=
 =?iso-8859-1?Q?+6C2lVSTt8ataN6tIZk4xIQzQ+h0cBJe1eUvN6ESOY2q/AlK0SQaaJc/Bu?=
 =?iso-8859-1?Q?DRjnfM0GO9qwIl/0JIDKQpA7Na3n+RIhCG1y/tN1bo7zl/rfrQSFKmEL+O?=
 =?iso-8859-1?Q?Io51ID8ehY+nD3wGHPkSNKxRN+iEOt0TpuPtHOuaYjZGahemtK6QOjuepF?=
 =?iso-8859-1?Q?FxGsqfMrxBNGQfdZIDgtzfBmrC85o8THfjKP/9HZwu0MOy1SInQ8fpEmrk?=
 =?iso-8859-1?Q?ig15LjyBJXJpZDpzqrq8jV8lTEac/rckbi6XTk+w0WWgj27dkBMtkItCLS?=
 =?iso-8859-1?Q?+Z7INvSq2Rya2e4PXuvtf4mptbBLMcais8bitCL+fIFt+DGfY4filM+g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3072.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b44ddae-912b-4236-de8b-08db00813712
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 16:11:57.7353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrsF1OyvSEsxJ+sQ8YOcwGTsm1+hozPxOfYnjY95IoLdUbt0mhSW7A6ATTUwkVbi+end9EDpruhj3XArscwcRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR21MB3234

-----Original Message-----
> From: J=F6rg R=F6del <jroedel@suse.de>=20
> Sent: Friday, January 27, 2023 12:35 AM
> Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification addit=
ions - v0.60

Joerg, thanks for your thoughts. =20

> But I see still a need for implementation specific commands, which will
> allow the guest owner to get information about the SVSM and which could
> help with debugging in case of problems. These commands are tied to the
> architecture of the underlying SVSM implementation and can not be generic=
.

I agree that some amount of implementation-specific SVSM communication may =
be unavoidable, but for the sake of a robust standard, this position should=
 be accepted reluctantly rather than being embraced.  As long as the crutch=
 of implementation-specific calls is available, it will be too easy for con=
tributors to classify new features in this way when doing so may be the eas=
y way out.  It would be much better if the specification of an implementati=
on-specific call were the harder path, so that the default option would alw=
ays be in the direction of standardization.

> For example, an SVSM implementation can have one or more log buffers,
> it can have a trace buffer (or not). Another SVSM might even allow the gu=
est
> OS to change some configuration data. In that area I see a clear need for
> implemenation specific commands.

Logging is something that every SVSM implementation will want to be able to=
 offer, and so the aspiration should be to design a standard log configurat=
ion and retrieval calling convention so that log management can be done in =
a consistent manner across all guests and across all SVSM implementations. =
 The reflex to call this "implementation-specific" is exactly the sort of d=
eviation from a standard that worries me.

Perhaps not every SVSM will want to offer logging, at least not at first, a=
nd that's fine; those implementations can simply decline to offer the loggi=
ng protocol.  But the key point here is that the set of features present in=
 an SVSM should be at the discretion of the implementation - and may change=
 over time - and must be discoverable in a standard way.  We want a design =
that lets SVSM implementors pick and choose the features that are most impo=
rtant to their users and not be forced into a position where they cannot of=
fer certain features because of the underlying implementation platform.

> It probably makes sense to specify them in a way which allows the guest
> OS to have a generic char driver to send implementation specific commands
> to every SVSM. On the guest OS side per-SVSM user-space tools can be
> used with that char device.

Great idea, and one that can be standardized without having to couple it to=
 a specific SVSM architecture.

> Implementation specific commands can also be used as a playground to
> experiment with features that later can become part of the standard.

Experimentation with new feature ideas should be done with an eye towards s=
tandardization.  Calling these "implementation-specific" during the prototy=
ping phase just makes it harder to standardize later.  It does not seem dif=
ficult to allocate a new protocol number (or a new protocol version) every =
time a new feature is considered so that the prototyping can begin on a pat=
h towards standardization.  If the protocol registration process is unclear=
 or not conducive to prototyping, then let's fix that instead of falling ba=
ck to a model that diverges based on implementation.

Separately, I struggle to understand how a guest OS is supposed to know whi=
ch SVSM implementation it's running with.  I don't recall a proposal to def=
ine a call to get the SVSM type, nor a proposal to define a registry of SVS=
M types.  Without such a mechanism, how could a guest have any idea which i=
mplementation-specific calls are expected to succeed?  Again, moving functi=
onality into a standard calling convention avoids these questions, leaves p=
rotocol implementation choices in the hands of individual SVSM designers, a=
nd is fully enumerable and optional.  Shouldn't this be the primary design =
model for all SVSM interactions?

-Jon
