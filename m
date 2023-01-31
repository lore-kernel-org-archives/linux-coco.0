Received: from DM5PR00CU002-vft-obe.outbound.protection.outlook.com (mail-centralusazon11021021.outbound.protection.outlook.com [52.101.62.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61788C10
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 15:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2VkDM9hA/MUlrfkNe13fuQ0dobRFYIF69Hy3B7McHJGeTQUzr3tt/zjFz1GXDV8jep82k3cp3HupbmqsNFEzEheS+meYZPhi6C/6T11vm9XGwNUQayjSv8aJov85jG96tmINbTtWJOGXPSjMpVV2OpUruiAbinD3a5KJYwiay6pykJBhwCaYsPw5/F/j5R1iwiVJ0V6DQT/wkuYlRfrjoLzqrv3CgCCKBaFh+E1ZCCmopnciSYr1DJH6DWQLof2AHGfF+ZrXcp4TYEpASz6Z9NGgzb7SVW+su/MwVoRnUjxwoE9VB5YYyfPZ+8scU1Cy9BTCl/FLMYOcEC/EJl50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u94LwVOldSKtwIuTFIbO/A1DtDHiFGkhcWvmcPW/2Ys=;
 b=VvMxppgdF8tsCnkKBREDaeSpUqz8rzm245LFQ540ieFerEqDGTSNnfXZS7T4xGOL3AhY8W+m9Jmf6o4CdF2jOrAv6Gv7mECV//OZ5pbR0m2b6nPeE+7eisCRbz22IttbMXkzjN/Asy3KcPb4UznGyw1tcA0UM/U4q7FnDZ52dTzKJW6UI9QwEojZX0FBbWPMHoDoUwPARMzi5ZxgmiZQfYmpVQW0c1twzBUTYW/mgYpUjtyQWUDfnlVHU/pyisfxdQiETHof6mSjZ2QarZ3CilYo1w7JfheGHqFWl5vYsVZmsILkbMcheydMPZ+llANZOPgA2xUDfPYelNxi15bW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u94LwVOldSKtwIuTFIbO/A1DtDHiFGkhcWvmcPW/2Ys=;
 b=LeImMck33OFb1EVpB2ICXFvBn0Jdg9usHE6aTQjMUqW1wj6mec08YHklfLFcDTLEI9jiAD9BI/9VnMuPblyVLWgSLuqvGQxuGLC51Pq9NeqdYvHutVR6EVyN57NqAlX7C2BEDH8Jt6HU+Mx9LowtAPjp9k3dUY0uP0PlI6FPKWs=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by SJ1PR21MB3603.namprd21.prod.outlook.com (2603:10b6:a03:451::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.4; Tue, 31 Jan
 2023 15:34:16 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d%6]) with mapi id 15.20.6086.004; Tue, 31 Jan 2023
 15:34:16 +0000
From: Jon Lange <jlange@microsoft.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, =?utf-8?B?SsO2cmcgUsO2ZGVs?=
	<jroedel@suse.de>
CC: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Index:
 AQHZL9idL/cAC39M7EuN4gPMmRZpBa6wy6aAgAAg3wCAAAs9cIAA/RAAgAB5gACABG4igIABHd/AgACxL4CAAAW40A==
Date: Tue, 31 Jan 2023 15:34:16 +0000
Message-ID:
 <MN0PR21MB3072C0B7733D1C1AA66A1143CAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9eqB5/1YcZeIHqG@suse.de>
 <MN0PR21MB3072B127F1B0D6E0F73DF37ACAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
 <0b9ac8de-54fd-e455-9082-6700ec955f74@amd.com>
In-Reply-To: <0b9ac8de-54fd-e455-9082-6700ec955f74@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c1def7f8-490c-4abd-9609-15457a40fab4;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-31T15:26:59Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|SJ1PR21MB3603:EE_
x-ms-office365-filtering-correlation-id: c3ee46f9-2360-440e-4cf6-08db03a09d06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +x2XxFhCgA1ER+MI2GdGMg4DQ1HYlIF3PzEzxJxTMpjY5bVkfmLLpSfVekKH6rbS33gbxRz3s618wIl3DfXzqZ9J1NS3E3Plai5BKtQAzxFI9usKxZG+KNMx+scsjVn5MxbgwNTC6T+/Kibs7Vkw3ki15S355DiVuyETGXL4NQE6UBnlH2a5wGPB8zLGnbY6Ogo2rcXKf30Negwg85KD2ZjmWrmdx1/kv8TnFR6SQq4Xm4cHB0SwF9R1lDYiAr1vzx4eU1hmXMyJdolzDojaJ26Esf3HmFiWnDzKIgYejWQGNIEacx9u7Q7hfdr8wjeagUCIKjW1AKAQHk56szcMIZJ31lqa/pAgOQeR+++ojr8PJ71re+jHVfGbxfBQCx8eJeweuCI+o6Algbe7SrlsfBB1wUveLFcB3qPg7RJRS4NdCqSU7g4Da0Atg0oO993B+lQHQNrMSitH5K4Ghm2vDMOd+3DfwCDkkWioR2pUHJKp+Dg6SK5+UYu3F7YgYsKYq8Nyg1PF7d2s1elv2wHyiIhb4bwh6PPYBLZCjc7DXNZ8lqJqfRP2zdrT28OOKQNghgEANXuNpm4ARTfo5/5jX5g09HZqvdnklcVl93zcUlr9V1wVKlGN7GP9l97e+JEnvHIkJ4IGULARG2Zt9zBnk3w4ewsPmsuRI+bgo7XXsu9/UsUXMUPlxey4WJAm5Nwi1FVnVGWFp48EJD8yOcOAOf27h4Klsk3TuXVV0Hmd+5KU3D4lHuZULFNy6WlOcdCF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199018)(9686003)(186003)(122000001)(8936002)(316002)(38100700002)(6506007)(82950400001)(82960400001)(4326008)(110136005)(54906003)(52536014)(8990500004)(5660300002)(66946007)(76116006)(86362001)(66556008)(8676002)(66446008)(64756008)(66476007)(2906002)(478600001)(83380400001)(10290500003)(38070700005)(41300700001)(71200400001)(33656002)(55016003)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmpUYUtYdG1uWWRRY2IxeFVjbDd2YXpoakt3TFZYWWdsUUkwSlJ2QVNCdTNr?=
 =?utf-8?B?QnFmWWhMVmE0aWU0WXBsTkVuamdxS2FYOTIrUGR0bFJVWFdQbithT2F1Y1dZ?=
 =?utf-8?B?YWdkVk0vUXBkWlRXU2s0cEltVkgrUXczM1N2V3Z2SFVJU2JMcGpaY3RxcDN3?=
 =?utf-8?B?VUN0bnRnb0N2MmhmRXBKYVBLSldxYjZHb0NDYlNiUWsxOCszektidk5xblln?=
 =?utf-8?B?VFlXaWNzMkpNS1d6a2ZZVGZMLzE2Ym9YamxMMy9saHRsd0RqNGlpRVIvQ0w2?=
 =?utf-8?B?dTdxZmttVmNXa2FocUQybksrSzEzUkczK2xwTjEveVF5M2k1NjlkQUFscjd1?=
 =?utf-8?B?aWNRdUVTL1lsZjEzckt5WXVmd2xaaTl3N1VRUmJITjZndlUrVXVEamVkMVVB?=
 =?utf-8?B?RDBxdDVvU3JxaHBOYmRnSnlDQzZKZGZ1OGJSVnNScmNwc1gxeVF0WEQ1MmJJ?=
 =?utf-8?B?dEQ5SThyMXhXNlZZOU9OSTdZRGgxbzFZYTRNQXVZdlgzWmNWN0t0L0VtTmtR?=
 =?utf-8?B?QWEvNjVyNllxWFR0Y09QR0s4SjRnTTgvSEF3L0VPT0Y2dmhPR2xIOFlMTjVT?=
 =?utf-8?B?dVhQZ0Y1bUNTOExTWnhnMTJJcUFIcW1nY0RTbytpMmh5RXoySSsxcXZ5UTYz?=
 =?utf-8?B?ZmJDRVJXTGI3Nk51WmtkUVYrb3FuTVZhSEFaUjcrSzdRVXhvVExwdC9weXFp?=
 =?utf-8?B?T2VISFE2Y0VITUdEN1A0UVNSWFJBRjNpWUxpeVBnTmRpaU1lUG5WOTJwbUNI?=
 =?utf-8?B?SEkycTZ6WmRsSlhFbjVSUGpVSm1MMmNkaVBkTXdxVzNnbDlSUyt1MmY3ZnB5?=
 =?utf-8?B?NlhrL285eWVLbExSaW5ZcmdUOU9lV21HWE13TG1CWGNxU2ZiNE1sd2ZHWnFM?=
 =?utf-8?B?R1daeGZOU2VrcTJySms2Y2VQZFpITERNblA2M2xZazRSZUFrQkFRaGlGZWNE?=
 =?utf-8?B?TVhzMU1xc2RZS2pqWTh0eHBGOE9jVm1JNFZmbHA2d0JaSWUyRDlaTU00RXNQ?=
 =?utf-8?B?N0RSb05QaGFRTy9ZL24zei9TUytZVDRWejJEYjJQdlZBQmxiNEw0enROTHRt?=
 =?utf-8?B?MjdDQnJyODBOeEFZMEJpWGpZMlBXRGY3TGRDdFBFbDBTRE5UNUt5eC8zY2Yv?=
 =?utf-8?B?WnhoTGo2bDZOelZzTDh6R2gwcjFNT25uL3N3djVTMmk5UEluZ0NsalhEU0NN?=
 =?utf-8?B?djVqWGowTUZZWCtTejJXWGRVR0ROMjR1WnRqQW5xdGxQdXhTajVCU3F1Rjhh?=
 =?utf-8?B?eEJ5N2tXVUlzSXJFUzdKQ0ZhbTkzQ0lqMVNOeTlKcUJDWks5eVNITmIrWHdR?=
 =?utf-8?B?WlVCaHhlcit3YmptRTJBZGJZclJMMlEzZDJ2MGFkUVVxVEFGSmp0STZLckhI?=
 =?utf-8?B?QldOaEJHbXhGUDF6Z2pmZXRQRmFZcG9BU3J2VWJoQXpIZkNNRWNwNXVSOTJr?=
 =?utf-8?B?TjlsVUJNRzRpUzcxanRQOW1nWk1VZC9oVnVwQmJtdE9JU2lTQzZRWjJzVEZn?=
 =?utf-8?B?U2R1djF6ZHorOHZ6cWZCdllkaVFzQ2tuQkpacjd5a2pTMkR5bUJDWnVBMWZz?=
 =?utf-8?B?cG1PYzB2MTZwdFR1eS9nalp1RjJCQ1UvNCtrZTFma2pqUDA2TmhpTDIxZHl6?=
 =?utf-8?B?TmF0U29EQzFFMjYzcStHOUJCbVFLWmF1TW5jdDhPdWdTZDh3Z05VdSsxemFR?=
 =?utf-8?B?WFpWLzBmdEc1WmIrVXE5UlNxcDJBVFI5ZDVBVm5EWmNmNys2WUlEVWhsVzVx?=
 =?utf-8?B?dHY0Z3lTVS9wNExnVVBPTWVxZW93UE9LbmJ3QUg0ZDNHanN6Q1lJU0oyUlZ3?=
 =?utf-8?B?Tm1xUkljSW5qeEtQemhzUWROOUNDbFBxOWdqTnhoQzloUVRwaTA0ZHFXeFhP?=
 =?utf-8?B?cCtkUW02MzFETUJIekxjRVJEc2N4VHdMMFNNVFU4KzdkaDk3SUZLYWhrVEdt?=
 =?utf-8?B?L3ZVRFRnQ0xQbCs1UDdNYkdNUzdXc2UvZkx3eEx1K2tkVkMyc2VjZ0VQaEtn?=
 =?utf-8?B?eVVkaHpCc2RabWtkK0FLeTFNT1duSFVseTZPZ2NnL0hibG9PTlZmYmJ4TmNw?=
 =?utf-8?B?VHNDbWJWVG5BNitWenJhSjBEMkRDczc1WThIcUpObGRqQlVVYlVCVUc0N01l?=
 =?utf-8?B?cWhtTmpRM0cwYUFSa3BXVE9mTlp1UGUybHY0cUdmS0M1V1JKT0dvUXlIZUpm?=
 =?utf-8?B?ckE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ee46f9-2360-440e-4cf6-08db03a09d06
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 15:34:16.6518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: czuoFlAgOrCrgghEVb2jY3hdWNJHqA3fPlYpjU4Mt2hU/XAaRqYEJ82t7+IzGHixqq5+eVirLVCR88XAMgPbDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR21MB3603

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRvbSBMZW5kYWNreSA8dGhvbWFzLmxl
bmRhY2t5QGFtZC5jb20+IA0KU2VudDogVHVlc2RheSwgSmFudWFyeSAzMSwgMjAyMyA3OjA3IEFN
DQoNCj4gSSBkb24ndCB0aGluayB0aGUgU1ZTTSBzcGVjaWZpY2F0aW9uIHdvdWxkIGJlIHRoZSBw
bGFjZSB0byByZXNlcnZlIHRoZSANCj4gcHJvdG9jb2wgbnVtYmVycyBwZXIgaW1wbGVtZW50YXRp
b24uIFNvIHlvdSB3b3VsZCBuZWVkIHRvIHN0aWxsIHNvbWVob3cgDQo+IGNvb3JkaW5hdGUgb24g
d2hhdCBpbXBsZW1lbnRhdGlvbnMgZ2V0IHdoYXQgcHJvdG9jb2wgcmFuZ2UuDQoNCkdpdmVuIHRo
ZSBzaXplIG9mIHRoZSBwcm90b2NvbCBJRCBzcGFjZSwgd2hhdCBpZiB3ZSBqdXN0IHJlc2VydmVk
IGEgcmFuZ2Ugb2YgcHJvdG9jb2wgbnVtYmVycyAoc2F5IDY0SykgcGVyIGtub3duIFNWU00gaW1w
bGVtZW50YXRpb24gZm9yIHRoYXQgaW1wbGVtZW50YXRpb24gdG8gdXNlIGFzIGl0IGNob29zZXM/
ICBUaGlzIGF2b2lkcyB0aGUgcHJvYmxlbSB3aXRoIGEgY2VudHJhbCByZWdpc3RyeS4gIFdlIGNv
dWxkIHN0YXJ0IGJ5IHNheWluZyB0aGF0IDB4NDAwMDAwMDAtMHg0MDAwRkZGRiBhcmUgcmVzZXJ2
ZWQgZm9yIHRoZSBBTUQgcmVmZXJlbmNlIGltcGxlbWVudGF0aW9uLCBhbmQgdGhlbiBhcyBtb3Jl
IFNWU00gaW1wbGVtZW50YXRpb25zIGNvbWUgaW50byBleGlzdGVuY2UsIHdlIGNvdWxkIGdvIHRo
cm91Z2ggYSByZWdpc3RyYXRpb24gcHJvY2VzcyBvbmNlIGZvciBlYWNoIHRvIHJlc2VydmUgYW5v
dGhlciByYW5nZS4NCg0KPiBXZSBjb3VsZCBqdXN0IGFkZCBhbiBvcHRpb25hbCAiaWRlbnRpdHki
IHByb3RvY29sIHdpdGggYSBzaW5nbGUgY2FsbCB0aGF0IA0KPiByZXR1cm5zIGEgMTYtYnl0ZSBH
VUlELiBUaGVyZSBzaG91bGQgYmUgbGl0dGxlIHRvIG5vIGNoYW5jZSB0aGF0IGEgR1VJRCANCj4g
d291bGQgYmUgcmUtdXNlZC4gVGhlIEdVSUQgY291bGQgYmUgdXNlZCBieSB0aGUgZ3Vlc3QgdG8g
a25vdyB3aGF0IA0KPiBpbXBsZW1lbnRhdGlvbiBpcyBiZWluZyB1c2VkIGFuZCB3aGF0IHByb3Rv
Y29scyBtYXkgYmUgYXZhaWxhYmxlIC0gdGhlIA0KPiBxdWVyeSBjYWxsIHNob3VsZCBzdGlsbCBi
ZSB1c2VkIHRvIGRldGVybWluZSB0aGVpciBwcmVzZW5jZS4gVGhvdWdodHM/DQoNClRoZSBkb3du
c2lkZSB0byBhbiBpZGVudGl0eS1iYXNlZCBzY2hlbWUgbGlrZSB0aGlzIGlzIHRoZSAibmVnYXRp
dmUgaW1wbGljYXRpb24iIG9mIGlkZW50aXR5OiBhbnkgZGVjbGFyYXRpb24gdGhhdCAiSSBhbSBG
T08iIG5lY2Vzc2FyaWx5IGltcGxpZXMgdGhhdCAiSSBkbyBub3Qgc3VwcG9ydCBCQVIncyBleHRl
bnNpb25zIiAoc2luY2UgdGhlIG1lYW5pbmcgb2YgdGhlIGRlY2xhcmF0aW9uICJJIGFtIEZPTyIg
aXMgc3BlY2lmaWNhbGx5IHRvIHNheSAiSSBzdXBwb3J0IEZPTydzIGV4dGVuc2lvbnMiKS4gIE9u
ZSBvZiB0aGUgc3RhdGVkIGRlc2lyZXMsIGF0IGxlYXN0IHRoYXQgSSBvYnNlcnZlZCBmcm9tIHRo
ZSBkaXNjdXNzaW9uLCBpcyB0aGUgYWJpbGl0eSB0byBldm9sdmUgYW4gaW1wbGVtZW50YXRpb24t
c3BlY2lmaWMgZGV0YWlsIGludG8gYSBzdGFuZGFyZCB3aGVuIGRvaW5nIHNvIGlzIGZlYXNpYmxl
IGFjcm9zcyBtdWx0aXBsZSBpbXBsZW1lbnRhdGlvbnMuICBBIEdVSUQtYmFzZWQgc2NoZW1lIGxp
a2UgeW91IHN1Z2dlc3Qgd2lsbCBuZWNlc3NhcmlseSBjb25zdHJhaW4gZXh0ZW5zaW9ucyBpbnRv
IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNob2ljZXMsIHdoaWNoIG1lYW5zIHRoYXQgaWYgIkZP
TyBmdW5jdGlvbiAjMyIgYmVjb21lcyBhbiBhdHRyYWN0aXZlIG9wdGlvbiBmb3Igc3RhbmRhcmRp
emF0aW9uLCBCQVIgd2lsbCBub3QgYmUgYWJsZSB0byBtYWtlIHRoZSBjaG9pY2UgdG8gaW1wbGVt
ZW50IGl0IGJlY2F1c2UgQkFSIHdvdWxkIGhhdmUgdG8gZGVjbGFyZSBpdHNlbGYgYXMgRk9PIGlu
IG9yZGVyIHRvIG1ha2UgIkZPTyAjMyIgYWNjZXNzaWJsZSAtIGFuZCB0aGF0IGJvdGggbWFrZXMg
YWxsIG9mIHRoZSBCQVIgZXh0ZW5zaW9ucyBpbmFjY2Vzc2libGUsIGFuZCByZXF1aXJlcyBCQVIg
dG8gaW1wbGVtZW50IGFsbCBvZiB0aGUgRk9PIGV4dGVuc2lvbnMuICBUaGF0IG1heSBiZSBPSyBp
ZiB3ZSBrbm93IHRoYXQgMTAwJSBvZiBleHRlbnNpb25zIGFyZSBpbXBsZW1lbnRhdGlvbi1zcGVj
aWZpYyAxMDAlIG9mIHRoZSB0aW1lLCBidXQgSSB0aGluayB0aGF0J3MgY29udHJhcnkgdG8gdGhl
IGxvbmctdGVybSBkZXNpcmUuICBDb250cmFzdCB0aGlzIHdpdGggdGhlIHJhbmdlLWJhc2VkIHNj
aGVtZSBkZXNjcmliZWQgYWJvdmU7IGlmIEZPTyAjMyB3YXMgZW51bWVyYXRlZCBhcyAweDQwMDEw
MDAzLCB0aGVuIGEgZ3Vlc3QgY291bGQgcXVlcnkgZm9yIHRoYXQgaW50ZXJmYWNlIGFuZCBhbnkg
aW1wbGVtZW50YXRpb24gY291bGQgY2hvb3NlIHRvIGV4cG9zZSBpdCByZWdhcmRsZXNzIG9mIHdo
ZXRoZXIgaXQgY2hvb3NlcyB0byBleHBvc2UgYW55IG90aGVyIEZPTy1iYXNlZCBleHRlbnNpb25z
Lg0KDQotSm9uDQo=
