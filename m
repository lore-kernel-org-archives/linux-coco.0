Received: from na01-obe.outbound.protection.outlook.com (mail-eastusazon11020016.outbound.protection.outlook.com [52.101.51.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF04315BE
	for <linux-coco@lists.linux.dev>; Fri, 21 Oct 2022 00:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC270COEwquvhX9Pw4l2rLooQr/EfFQekr6FkOFIxk4n2XbFBJNLxGLj31VQkrpu77flvf2JuNsqEyHc5KGGOeal0+HnbMCs3XMR4XdrDwlZLlkFHna/honP2RmqPFTxwG7+ddxUxPp4OPA9cM2la5UOW59KdkiHBcG2edYXvKSoBomwOMuhQTwHMYDJ1YL2dbe+OSyA6q/rwoXsa3QEnEyDwbRoZPGSn16x7Yp6FwklX5DSi8WVt3+ffgbduZAOKCVZzT3VZjyceMHUEIY9j/FI3iAhdi+KDPheXSG1zBR+jtsMAms9hPNSYlOQD5q9th9nxwWbz2lwvNmyzI7pyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwJVpLebH+WU04bLyjlgWVlLsnI7JdsDTwLU6pOPb00=;
 b=diZNf9ItAB8joHnMIC3TBQ/nr3y0A1V8OsLBX4JUt0l5qA8xL3K90ZkuhgZkP3tP6EBSr6Oafnjslv7y+BkXypBsIX3g65ocLyYb7d8iIzxSyx/n7QJxaYpHCFAZyd/nCUIMhQXxBqPqcFs6G9vMPsB1/14YwcqpBkJiDJvOZ6jhrxQy4U2In3aftIcb629uuiHDo1tUI4Tz6XriNAP59hVh26gmtuXbznFoCLo7nPXx0YzE/4kwq63CipjpZRYaY+o/qQETHo6h/kN4L1of0lDce/CK7rTAjXBg/JRIXxr4Ws+YLAaO/02ew3DBP3Gf16ELi+t/sJsQUxuob9gmPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwJVpLebH+WU04bLyjlgWVlLsnI7JdsDTwLU6pOPb00=;
 b=Wlp/aHZAlJQ6Nzq42QoeCD77F/y195Z4KlaEFJR7F4IEjcOHzrzU6Laa0IUCSQVsR3gjiq6DEXnuFDSBRMRx5PLzeVEWrOpV3Y0K+tm+oxuDj6Av3wSCnNQderXAGRxji+IOWEXDTzxDUNgywNRFirGT9dnp73q9mzkQ6GY590A=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by SJ0PR21MB1998.namprd21.prod.outlook.com (2603:10b6:a03:298::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.9; Fri, 21 Oct
 2022 00:02:28 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::9d8:bbd2:d79a:2cf6]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::9d8:bbd2:d79a:2cf6%5]) with mapi id 15.20.5746.008; Fri, 21 Oct 2022
 00:02:28 +0000
From: Jon Lange <jlange@microsoft.com>
To: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, David Altobelli
	<David.Altobelli@microsoft.com>, Steve Rutherford <srutherford@google.com>
CC: =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, Christophe
 de Dinechin <cdupontd@redhat.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	<amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] RE: SVSM vTPM specification
Thread-Topic: [EXTERNAL] RE: SVSM vTPM specification
Thread-Index:
 AQHY3mDSknfKPynVR06YI1j+4BkoQq4LGK+AgAFXq4CAAAREgIAILT2AgACd/YCAACdJgIAAS3KAgAAHi4CAABt7AIAAaE8AgAAS/ICAAAjegIAARB0AgAEiAwCAAAiygIAAOWhQ
Date: Fri, 21 Oct 2022 00:02:28 +0000
Message-ID:
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
 <58caad5df212e620c6840f2c2f16514674893dfa.camel@linux.ibm.com>
 <155c7303-3027-7d93-263f-f42ea159f855@linux.ibm.com>
 <679C87ED-6D21-4D0A-9537-9910A6F802ED@redhat.com>
 <Y0+wcWgcRFTiDTNk@redhat.com>
 <b8f0c4cc9207a516f63958c53a5a57148606cc45.camel@linux.ibm.com>
 <Y0/2D93P/xgp1sU9@redhat.com> <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com>
 <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com>
 <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
In-Reply-To: <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-10-20T23:55:03Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=8f674f2f-0519-4d6a-87eb-26dd617ea6b7;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|SJ0PR21MB1998:EE_
x-ms-office365-filtering-correlation-id: 20a6d7e7-264f-4c93-270b-08dab2f78ac1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 6SmtvwVCOsL7uQX7HezYOdonOcj/w2+qLRtmYdjnj6PBrTArQxACprro9jyBW5xMtKXdc2Q3jzWkN5+0s9cWmjpIr89Jym1lRP/270DoRomMIwZ+l/eJgK0FJ5n+1qXdvOKgG5SjDpMNLdNvbDsdhQMUUnfo6xduCWxFcY4jlJJZlxmg1Vg87iuGrIAP1pPv2iNeR4FmI24qfSlmM2XPDmDMe4XTEFzWjqPXuw4bTtJuTA7gjapZA9b93xcSvaEg7hcka9PcUm5UR210PsbfqWyBEviutIosZAokiqpkOyK+c8j/O9PTZkn4AmaQ17xif917qWJtF5uhM8/leM84XRJrgr5EB5F24NUO2fnz62G53xL2K8jT6Wg0c/TRBQSqcVWva2mRN/oE/hrCOPT8Fi2hS/X2muCO0dbKOEDmmR2+6Pjfl/QcQ2hk9K2MIBp7AelNR0hvVJ/InciGh1/vB5lYj4U5KjjcSuQ153F2D1Zf3VjNofQc1vzTRTpDKHO1oQayzxqhO6cs5L2BZlFkT5O0fWgWJyFrHxIhrVIbwAOlliC6BbkHvtu5QlYu/eZ06ppvOiMqZzLOq38OqevW9HUKitgL9zcuK/h95M534Cl8eh5QA6eAVWWjQJKMT4m35cFOnw5oiRE8gi8Edw64qAq8lWTq0Dj5IFcrZZYA38KeX2giFTI1b4sZ21Yw3AGOcF22y3LQItRHrGaIKjszHUwyDgiE+uFcD/AOmGksXF+abzPfLRKexMVqRykgR/7ahTw6qCqkoTzVXmCBVdWdi3PhRHH+9lHHTUR8On2ueaStcSOID0RsblKkBqVAouvN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199015)(186003)(53546011)(52536014)(2906002)(110136005)(38070700005)(122000001)(83380400001)(38100700002)(4001150100001)(86362001)(82960400001)(41300700001)(82950400001)(5660300002)(55016003)(478600001)(7696005)(8990500004)(64756008)(10290500003)(6506007)(316002)(66446008)(66556008)(66946007)(8676002)(66476007)(71200400001)(76116006)(4326008)(54906003)(9686003)(8936002)(66899015)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Snl2RlBKWml6OHNTQ0RLeE5pWXhNdWJJSTZDUVFlTHg2cUtqbHQ5ZmxNblR2?=
 =?utf-8?B?NFJidFQ4d0poK0FQazJjZVp6b3Zkc0ViVXBUKzlJaUc1cWJaTTA1dEtBRm1q?=
 =?utf-8?B?d28wMmZWeEtORGdSWnJrMFFGeE1rak1YQmZkcmhJOEUrN2IwSUJtZnJ4Q2Jt?=
 =?utf-8?B?SVB1QjYvYnZKa3ZhVTNwZU1OZnBVTEU4ZGRYUGdBVUt3S3NoS2YxOGF2UUR4?=
 =?utf-8?B?TlpneVFDbGM0a1pHY3lEUkJkb1hrSWNwQXJNRURacE5vSS93UGc1VERINzYw?=
 =?utf-8?B?bnEwVVBmRlJqSGhWdVB6TTJOSGhBbDVwUE1pOGxFcXZLSEZQY0pqTVJUcmsz?=
 =?utf-8?B?bnBhL1BzSjhKT1VySkxMTE5kSDYyNWFxdU1qVjFnR0k4RDFHaWhNMkRSZDBY?=
 =?utf-8?B?VFJwZk14VGNYanBUZFBYS3FmR1lkYjNnbFhvMFVPcHBpNllnWG1JeVBaSTQv?=
 =?utf-8?B?VFlWMVhhU1hDU21yY1U5N3hSNWhzR0pmNzFMWUFhRVlla3NWRGdHM3pDT3lX?=
 =?utf-8?B?REdLbFhtNW5BSTN5MHVveWgwYnlhWUYwcDlHeG5UOXZnZFZoWFkrKzF4b1o1?=
 =?utf-8?B?UUFPeDBLVnJGSVRhRWU4VWFwWmM0aGNvTkJOR1NQalI3YzZJQXpwUWxMczds?=
 =?utf-8?B?WUFWcEo3Y1ZPcjNsTG8rTGs5eWpOUUlUZDV4OVNYamZPTURVY0hFcDlrNzY3?=
 =?utf-8?B?WW13c3ROYW5tSlhHMFlFM29NNUliZ2ZnczJqanp3LzVzaUhQUW9zVW1hQlVY?=
 =?utf-8?B?VzBYbzJzNUYydzNZMlhZcVdWcUlhQnpYNjRMNGdpTlRaNGZ1NmNYdWRYSnVC?=
 =?utf-8?B?VXZCYVR3WWFGMEN3QjdnNGVWT1R6NytJUHNrcU5GOEdrd1Q0ZENFNk1DL1B6?=
 =?utf-8?B?dHhjdzgraGxTYXJtMHZOTzh4TkVDWGZjZitVLysrR1AwSElvajdHelJ0YjZy?=
 =?utf-8?B?MXNoTy9TWUZuMlNVK1NiQWkyTFFpc2tzTENxdjhoellWK3N6RnAyMUlLWlQ2?=
 =?utf-8?B?dVJJb3c5ME9Ed3VGRzZNOUZ2STRJUjBJeTVFblRQRUYvdjRhYkUvV1QvUEor?=
 =?utf-8?B?M3dkemI5VXJPVDZuaitMbjFQUXAvOXlUUVY5RUhpamNWVDR3QU9oTDc0aEti?=
 =?utf-8?B?bWZRWm82bGd6YTRpSE01Mi9ZYkx6TjRXekhwQldOUzR6YmRvemdvMnlNWE8x?=
 =?utf-8?B?bFdmRU9mWlVlQzB2V0F3UXNQcGVwUVJSVFQxaWFxVnNWQVljb2NyS2xyMkRi?=
 =?utf-8?B?eC9iajlVTkVleGtFNzhXVVdSNHluaTcyYnU2MXFMWkM3bXBDOERldmpJekhi?=
 =?utf-8?B?RUwrQmRlaUtUemo0OGtpeHllSmRoSUM1ZmJIa29sQmovK1VFaXdta1Z0QjRM?=
 =?utf-8?B?VjViM1RSNHAwVFBQS1dNNEtBOU55RGd4emxna1FuYmpsTnJnaTBRNEY5UDMr?=
 =?utf-8?B?aU1hSEpCZlhVYm5hR2lseWFwVWxRUHREeHpvOFl3SFJIckxkMUVWNzBoQXQ2?=
 =?utf-8?B?M21DQk9UUHJEN2dCM2dQOTY5THhFVjRsMU9XcEFhMUp2aEc0VWllc3VGTUp4?=
 =?utf-8?B?U0QyZlB0bE05WUhxNS9WbTdBQ25ndzhLVFFhUEkwMGZhN3RRdC9ES2pEMUQ4?=
 =?utf-8?B?aXdUa0hrMkxxK09mR3VIYW9GdEd1NWlCcE5YaXZaNGswWTJTSWlwM2R4QWVD?=
 =?utf-8?B?a3pwU0h0dml4TUdrT1NNRWZHanN4eDVKRDkxVWY1K09qZWxRYVBBU0F2TG1k?=
 =?utf-8?B?VEpQSFFTMURoRFNJYjBuaXJiRzFackt6SVUzczF3UHNQRjZWNERBejdYMVNU?=
 =?utf-8?B?L3pZNkFadjdqcEFBM0J4Y2MxR3JENkl0Y1JyZWpldVZBQ0ZLWUZKdUU5UWNS?=
 =?utf-8?B?NlBnb25xN20wekQ2aGZkZmY4dUtOZWo4RzRqMUFMK3JyNWw1UXB3UEZaRko2?=
 =?utf-8?B?bHpGN2YzZnJWTjIxdFllRVFKWXdML3I1TU0xTG1jUnlSNVE5VmxhNi9Ec1Jx?=
 =?utf-8?B?OHAwV0pSVFVDN0hyNVdoeEdmVDVVSU11bEFoampLcTNBV0lneExwVTdNZGhh?=
 =?utf-8?B?YVBYb3Z5Z3BnZjhuamE1SXdrek9GcDJkTFhncnI5SHl1eEx6eFhleDgrQTly?=
 =?utf-8?B?WU5US3FVRDJmY0E5QWJaVUdOTTZZTlVkdkM0TGtnSlRXWXZEa2lobEN1M3JK?=
 =?utf-8?Q?ibV6u8RWoO35gBG6L7A90NAjgu3nwc/n6G73oMfRsnau?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR21MB3072.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a6d7e7-264f-4c93-270b-08dab2f78ac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 00:02:28.0926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uddJn9UhTQ7pfxOanvR2HmlaPQzKWI0SDdunv7Fkl3lbcZ/qbm0Lf488GmLMm6EOwpIcB8w3Ja9xBC0D50R+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB1998

U3VyZWx5IHRoZSBwcmltYXJ5IHZhbHVlIG9mIGEgZG9jdW1lbnQgaGFzaCBpcyB0byBwcm92ZSBp
dHMgYXV0aGVudGljaXR5LCBub3QgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdHdvIGRvY3VtZW50cyBy
ZWZsZWN0IGlkZW50aWNhbCBpbmZvcm1hdGlvbi4gIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4g
dGhhdCB0d28gImNhbm9uaWNhbCIgcmVwcmVzZW50YXRpb25zIG9mIHRoZSBzYW1lIGRhdGEgbWF5
IHJlc3VsdCBpbiBkaWZmZXJlbnQgSlNPTiBlbmNvZGluZ3MgYW5kIHRoZXJlZm9yZSBwcm9kdWNl
IGRpZmZlcmVudCBoYXNoZXMsIGJ1dCBhcyBsb25nIGFzIGVhY2ggZG9jdW1lbnQgY2FuIGJlIGF1
dGhlbnRpY2F0ZWQgYnkgaXRzIGhhc2gsIGRvZXMgaXQgcmVhbGx5IG1hdHRlciBpZiB0aGUgaGFz
aGVzIG9mIHRoZSB0d28gZG9jdW1lbnRzIGFyZSBkaWZmZXJlbnQ/DQoNClRoZXJlIGlzIGEgdG9u
IG9mIGRpc2N1c3Npb24gaGVyZSBhYm91dCB2VFBNIGJlY2F1c2UgaXQncyBhbiBpbXBvcnRhbnQg
cHJvYmxlbSwgYW5kIGl0IGlzIHZhbHVhYmxlIHRvIHJlY29nbml6ZSB0aGF0IGEgdlRQTSBpbXBs
ZW1lbnRhdGlvbiB3aWxsIGxpa2VseSByZXF1aXJlIHNvbWUgc29ydCBvZiBTVlNNLWlzc3VlZCBk
b2N1bWVudCB0byBkZXNjcmliZSB0aGF0IHZUUE0uICBUaGVyZSdzIG5vIHJlYXNvbiB0byBiYWNr
IGF3YXkgZnJvbSBkZWZpbmluZyB0aGUgc3RydWN0dXJlIG9mIHN1Y2ggYW4gU1ZTTS1pc3N1ZWQg
ZG9jdW1lbnQuICBCdXQgd2Ugc2hvdWxkIGFsc28gZXhwZWN0IHRoYXQgaW4gdGhlIG5leHQgMi0z
IHllYXJzLCB3ZSdyZSBnb2luZyB0byBpbnZlbnQgb3RoZXIgdmFsdWFibGUgZnVuY3Rpb25hbGl0
eSB0aGF0IGFuIFNWU00gY2FuIGltcGxlbWVudCB0aGF0IHdpbGwgYWxzbyByZXF1aXJlIHRoZSBT
VlNNIHRvIGlzc3VlIHNvbWUgc29ydCBvZiBhdXRoZW50aWNhdGVkIHN0YXRlbWVudC4gIElmIHdl
IG1hcnJ5IHRoZSBTVlNNIHJlcG9ydCBpbmZvcm1hdGlvbiB0byBhIHZUUE0sIHRoZW4gaXQncyBn
b2luZyB0byBiZSByZWFsbHkgaGFyZCB0byBhZGQgdGhhdCBuZXcgZnVuY3Rpb25hbGl0eSwgYW5k
IGlmIHdlIGRvbid0IGFudGljaXBhdGUgdGhlIG5lZWQgZm9yIGV4dGVuc2liaWxpdHksIHRoZW4g
d2UncmUgZ29pbmcgdG8gd2luZCB1cCBpbiBhIGZ1dHVyZSB3aGVyZSBhbiBTVlNNIHdpbGwgaXNz
dWUgZGlmZmVyZW50IGtpbmRzIG9mIGF1dGhlbnRpY2F0ZWQgaW5mb3JtYXRpb24gKHZUUE0gb24g
b25lIGhhbmQgYW5kIG5ldyBmZWF0dXJlIG9uIHRoZSBvdGhlcikgYW5kIHRoZSByZWx5aW5nIHBh
cnR5IHdvbid0IGJlIGFibGUgdG8ga25vdyB3aGljaCBpcyB3aGljaC4gIEkgZG9uJ3Qgc2VlIGhv
dyB3ZSBjYW4gYXZvaWQgdGhlIHByb2JsZW0gb2YgZGVmaW5pbmcgYW4gZXh0ZW5zaWJsZSBkb2N1
bWVudCBzY2hlbWEgbm93IHRoYXQgd2UgY2FuIGV4dGVuZCBpbiB0aGUgZnV0dXJlIGFzIHRoZSBy
b2xlIG9mIHRoZSBTVlNNIGV4cGFuZHMuICBKU09OIGlzIGFuIGV4dHJlbWVseSBhdHRyYWN0aXZl
IHN5bnRheCBmb3Igc3VjaCBhIHNjaGVtYSAtIGNlcnRhaW5seSBtdWNoIG1vcmUgc28gdGhhbiBY
TUwsIGFuZCBhbHNvIGxpa2VseSB0byBmYXJlIG11Y2ggYmV0dGVyIHRoYW4gYW55IGJpbmFyeSBz
dGFuZGFyZC4NCg0KLUpvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQU1E
LVNFVi1TTlAgPGFtZC1zZXYtc25wLWJvdW5jZXMramxhbmdlPW1pY3Jvc29mdC5jb21AbGlzdHMu
c3VzZS5jb20+IE9uIEJlaGFsZiBPZiBKYW1lcyBCb3R0b21sZXkNClNlbnQ6IFRodXJzZGF5LCBP
Y3RvYmVyIDIwLCAyMDIyIDE6MzAgUE0NClRvOiBEYXZpZCBBbHRvYmVsbGkgPERhdmlkLkFsdG9i
ZWxsaUBtaWNyb3NvZnQuY29tPjsgU3RldmUgUnV0aGVyZm9yZCA8c3J1dGhlcmZvcmRAZ29vZ2xl
LmNvbT4NCkNjOiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsgQ2hy
aXN0b3BoZSBkZSBEaW5lY2hpbiA8Y2R1cG9udGRAcmVkaGF0LmNvbT47IGxpbnV4LWNvY29AbGlz
dHMubGludXguZGV2OyBhbWQtc2V2LXNucEBsaXN0cy5zdXNlLmNvbQ0KU3ViamVjdDogW0VYVEVS
TkFMXSBSRTogU1ZTTSB2VFBNIHNwZWNpZmljYXRpb24NCg0KT24gVGh1LCAyMDIyLTEwLTIwIGF0
IDE5OjU4ICswMDAwLCBEYXZpZCBBbHRvYmVsbGkgd3JvdGU6DQo+IEZyb206IFN0ZXZlIFJ1dGhl
cmZvcmQgPHNydXRoZXJmb3JkQGdvb2dsZS5jb20+DQo+IA0KPiA+IEknbSBhIGxpdHRsZSBsZWFy
eSBvZiBKU09OIGluIHRoZSBTVlNNLiBNeSBmZWFycyBvZiBKU09OIHBhcnNlcnMgaW4NCj4gPiBo
aWdoIHRydXN0IHRvb2xzIG1pZ2h0IGJlIHVuZm91bmRlZCB0aG91Z2guIEJyb2FkbHkgc3BlYWtp
bmcsIHRoZQ0KPiA+IGlkZWEgb2YgaGF2aW5nIHNvbWV0aGluZyB0aGF0IGNvbnRhaW5zIHdoYXQg
d2FzID5oYXNoZWQgd291bGQgYmUNCj4gPiBuaWNlIGZvciBmdXR1cmUgcHJvb2ZpbmcuIEhhdmlu
ZyBmbGV4aWJpbGl0eSBpbiB3aGljaCBrZXlzL2RhdGEgYXJlDQo+ID4gaGFzaGVkIGludG8gdGhl
IHJlcG9ydCBzZWVtcyB3aXNlLg0KPiBJJ20gcGFydGlhbCB0byBKU09OLCBidXQgYW55IGZvcm1h
dCB3b3VsZCBkby4gIElmIHBhcnNpbmcgaXMNCj4gcHJvYmxlbWF0aWMsIG91dHB1dHRpbmcgSlNP
TiBkYXRhIGRvZXNuJ3QgYWN0dWFsbHkgcmVxdWlyZSBwYXJzaW5nLA0KPiBpdCdzIGp1c3QgZm9y
bWF0dGluZyBzb21lIHN0cmluZ3MuDQoNCkkgdG9vIHdvdWxkIHByZWZlciBhIGZvcm1hdCB3aG9z
ZSBoYXNoIGRvZXNuJ3QgZGVwZW5kIG9uIGhvdyB5b3UNCmNhbm9uaWNhbGl6ZSBpdC4NCg0KPiA+
IFNlcGFyYXRlbHksIGl0J3Mgbm90IGNsZWFyIHRvIG1lIHdoeSB3ZSBuZWVkIHRvIGF0dGVzdCB0
byB0aGUgU1JLLg0KPiA+IE15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgaXQgd2FzIHByaW1hcmls
eSB1c2VkIGxvY2FsbHksIGFuZCB0aGF0DQo+ID4gYXR0ZXN0YXRpb24gd2FzIHRoZSBqb2Igb2Yg
dGhlIGVuZG9yc2VtZW50IGhpZXJhcmNoeS4gPk9uY2UgeW91DQo+ID4gaGF2ZSBhbiBFSywgeW91
IGNhbiBnbyB0aHJvdWdoIHRoZSBuZWNlc3NhcnkgbW90aW9ucyB0byBjZXJ0aWZ5IHRoZQ0KPiA+
IFNSSy4gVGhhdCBzYWlkLCBJIGNhbiBpbWFnaW5lIHdhbnRpbmcgdGhlIGhhc2ggb2YgYSBzdGFu
ZGFyZGl6ZWQNCj4gPiBBS3B1YiB0byBzaW1wbGlmeSB0aG9zZSBmbG93cy4NCj4gQWdyZWUgb24g
bm90IG5lZWRpbmcgU1JLLCBhbmQgQUtwdWIgKG9yIEFJS3B1YikgYmVpbmcNCj4gaW50ZXJlc3Rp
bmcuICBNYXliZSB0aGVyZSBhcmUgc29tZSBjb3JlIGNsYWltcyB0aGF0IGV2ZXJ5DQo+IGltcGxl
bWVudGF0aW9uIHdvdWxkIHdhbnQgdG8gb2ZmZXIsIGFsb25nIHdpdGggd2hhdGV2ZXIgb3B0aW9u
YWwNCj4gY2xhaW1zIGltcHJvdmUgdGhlaXIgc2NlbmFyaW8/DQoNCkdldHRpbmcgYSBUUE0gdG8g
Y2VydGlmeSBhIFNSSyBnaXZlbiBFS3B1YiBpc24ndCBzaW1wbGUuICBZb3UgaGF2ZSB0bw0KY3Jl
YXRlIGFuIEFLIGluIHRoZSBUUE07IGRvIGEgbWFrZSBjcmVkZW50aWFsL2FjdGl2YXRlIGNyZWRl
bnRpYWwgcm91bmQNCnRyaXAgb24gdGhlIEFLIHRvIHZlcmlmeSBpdCBhZ2FpbnN0IEVLcHViIGFu
ZCB0aGVuIHVzZSB0aGUgQUsgdG8NCmNlcnRpZnkgdGhlIFNSSy4gIFdlIGNvdWxkIHNob3J0IGNp
cmN1aXQgdGhpcyBpZiB0aGUgRUsgd2VyZSBhIHNpZ25pbmcNCmtleSAuLi4gdGhlbiBpdCB3b3Vs
ZCBiZSBhYmxlIGRpcmVjdGx5IHRvIGNlcnRpZnkgdGhlIFNSSy4NCg0KSmFtZXMNCg0KDQo=
