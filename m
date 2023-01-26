Received: from BN3PR00CU001-vft-obe.outbound.protection.outlook.com (mail-eastus2azon11020027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2F46BF
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 17:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvwKd7sNZsDGOmI4qqAAda58urO0dLVvg0gtVs1qNoY92p9s/qMIFl9iwKHUlJu9mTZRJvIQFLwCUfbcUweF7dru3pxSFs5c0niK8TRTi6jQvtBhvDH5Cs3XCpQwAZFs+fGZtx/SpH58FhyaJnHGKjrLd7sLzQdx0VSZ+M9KI6fnZ6GhBob6Z1JQ34UxXUOvKo7oE6ukQnXnnajMM+m0oJP1MLmkBUTHVt31iKDrWNZ+M1ffWN+w+1sH6bHvKkpq9L8MKcZqJbscHBq8p3V64jOKTIkaUcjaR7uQMeKpHXk4s1/IeI4jmEIH6A5CHTwHIpWJ+qG92GSuWpH3PKCoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLg1Z0h+J5aFigyZoCRXmIubAn2i4Ts4TlFX3x+wXeU=;
 b=b3sE/4m8ANF3uZbg7Tyon2ExqvFbt5dwBJ8W/Ma3HvPPjwSET+JL1DVc4c53IRvhoJ72KV9xwT/1MwinRcbDKD4ZVGTzIVIKMJ97qzyBX4cuhDqsFI5n63pn6UuGDzvK9tiJ9UJc+garXcq6X5fkieZjCtD8uTr/RuIwkPfs7/QMVf5z2NkHzSlOdLsSyFRLnelL6s01n7Owy/V0jSGyxFnYpySQZPhzPOaKKNnF6X/2Pg1+gGj4/kbm/HcWr1WaJg21TtqjdYiR0k2syXbmIevjyq3iNftLUwfyXaR4jVBzTpGF+7mTPZhlOPsz5Mc/Prxj8ZPznF9mMTAhUqRiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLg1Z0h+J5aFigyZoCRXmIubAn2i4Ts4TlFX3x+wXeU=;
 b=cCnOFwy2gzhbWC9TYpov0JoHVCKNqChaZ8Bv5JNZL0KAnDnyG1BL4rVSzJOeyP1ReWXayGlH7GQig0MRlqtDSJ/7xLneArTADDU/H0f/vlcsQMPpfk99WMbLQMsUn7V2tkvDUK3pWHss9dUYvx1JnzRY/vu7RVLyudu++S699lE=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by CH2PR21MB1525.namprd21.prod.outlook.com (2603:10b6:610:5f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.7; Thu, 26 Jan
 2023 17:33:54 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d%5]) with mapi id 15.20.6064.007; Thu, 26 Jan 2023
 17:33:54 +0000
From: Jon Lange <jlange@microsoft.com>
To: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>, Tom
 Lendacky <thomas.lendacky@amd.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Index: AQHZL9idL/cAC39M7EuN4gPMmRZpBa6wy6aAgAAg3wCAAAs9cA==
Date: Thu, 26 Jan 2023 17:33:54 +0000
Message-ID:
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
In-Reply-To: <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4696ab73-5fa9-48d6-af2c-04846f3ffc32;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-26T17:29:21Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|CH2PR21MB1525:EE_
x-ms-office365-filtering-correlation-id: 92abb84f-43e0-4e1d-d3b2-08daffc37f6f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NFChsoqM9U1XVKo+6dt+ShNnAGQ9Ry5VXuVAexIT2nXE+NOIhwE84vGQ+xzqJH1t9o1TT4xMc4B41zYfdrIDUm2mWwU7hX2hBUyI7AjrWLFtEWODcfV5ZQ7IgR0fwgs6XIUqYQwc0y4wP2ngbREPPH6oZiq9dKL5Ajnc5oIBz8qlbnE5bEsKOMCgss/PGRQAI1XDuDLAXomUSkSOx6atcQ4OCJwJeE2INH7yZytN8Mk2hg7XGWD77R5XwRCT6JYVYulPhdu50McIUiwtMavfBnBYPh7ddjunBlY5/qH9g442aQ2QNx3gV3sI40eg+X8FbZEbmrkve+pJA9nTwh4uvLYJRUTS68nfG8J0Op1R1w+Gq0FmZKV8h3RvNmzS7xWo2rJKvkEAMy29za+0cTEeDeBqFbJjyErtnLN4GVTfJEzHlZ+OVFJoN0QA3ccpXlJidgJsS4oD6iwxFMAJ0z3tqPoh7J2pOcsqB0KY6Ta//lkmOqWrLz/+tr8WGmGuO77nlFRt+BimqY6o5nNAqU1U8o97xGt12ICTtPIbDyu5Sp00F6Tl0ysOxTPPFPG0AE5BpMIDVA9VI38edgE0l+gB+ISic4jYd9EyB1XSg23rHoKQ65eV8NGJx68Q7By5qSPe1CNLzKnnleEnbqWWz6e+bCiaX2QGCLqGlyel2jW2RWF+6iBCsCwfE8cPQWlo981qSlpS9xMX5nx+yCMeTSPJJc0b5Q0aST+Uq+JOiUpAEAq4yZntJ3GjWpqLQS1WPrHt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199018)(9686003)(186003)(53546011)(83380400001)(66946007)(38070700005)(55016003)(33656002)(122000001)(38100700002)(82950400001)(82960400001)(66574015)(76116006)(66476007)(66556008)(86362001)(4326008)(64756008)(316002)(66446008)(8676002)(52536014)(41300700001)(5660300002)(8936002)(2906002)(478600001)(7696005)(110136005)(10290500003)(54906003)(8990500004)(6506007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z09oS3NWNm5XTDkza2VLcThVUG5RR2UwUS9ZZEg1WkdVWWlOdzNuZmVnOWVJ?=
 =?utf-8?B?UC96WGdCTTVrQjA3aFYyeXdoOEt5TU1GckJDMDJtQjRQMS84QkhKSVpva2lR?=
 =?utf-8?B?eU9Kd3c0UUd3SVRBSzZ0Q25IdVhkTkYvOTNyZmJiN2RTYmh0YlE3Y0Fwa2xL?=
 =?utf-8?B?SFFORXlqMlpkTDhhVWFKVjltTGQ4THJkakRmKzZvSnVOYkdEd1E3MVpsalBh?=
 =?utf-8?B?NmEwdUZWdHlxMEZzOU5yYU04THptVUFHMXBmOGJNYktHTjMwRHJsbDFIVkda?=
 =?utf-8?B?WldXTTh3ZTJPSVI0bURZaGpWVUNWaEJBRHk4ZGo5OVdVZGRiT2dzakJhTTU0?=
 =?utf-8?B?Y3RYOGszN0RwTDlhZlpjbnJ2bEE2SlNyQ1hLa2VNOU4wcEJoZWxnbWFGU1lO?=
 =?utf-8?B?RklldjRZd3JObjZlVGp1cm5QL0w0VHpPTGtJcUI3cDRZK0d0aHkwODMyUUo5?=
 =?utf-8?B?cExVRGE4ZDh0ZFh1Y3NlLzZ3clRGbnF6QUFiNTBZc2dzclFNMWRVSThLT2ly?=
 =?utf-8?B?Y2pTN2lKSlZxcm5RYkszNjhaSWcvOXpUVnFBYktpQW1aaEV2a1F0TWJvOHN0?=
 =?utf-8?B?Znhnckc5VTZGbWZwSCtQM1R4c2pXK0JadWZPK3FNeTNyUkp6YmNVOHEyZC8w?=
 =?utf-8?B?WCtOc2F3bHpzMExvVWVBYTZiZVROdDVJdEkvL0RUOFNKL0FBUmRaUHo3ZEZT?=
 =?utf-8?B?d2JHRHRSaUJCakRQdFc1ZTZLdDg4VjRFazJmQ2lUdW5ua253aUVISHZEcHhY?=
 =?utf-8?B?aVNjWFZOQ05CUnIxcVNxWVM0YWNTdDhlNGhtM2FnL01SbmZvaWhmVEp0dzlS?=
 =?utf-8?B?WWxDZU9tN1hWaFdrRWlFNnZmTXoweTlkdkZXdjJlSHkrZkNQaU93ZjRJRExi?=
 =?utf-8?B?NVhXdkhOSlR2dXdQV1Y0TllvY3czWmI2aGladXk3N3ZWS1dGQU5mT09HT04w?=
 =?utf-8?B?SWFnZzBuWXdMUVB3alZNOTBKYlhURXQ0SllIOXg2aWExYm5STHBScFNzYXcz?=
 =?utf-8?B?ZitseGtJYUJYUUU1MENFbW5sZWc4Y3o1SW9TcTdBSTFqZUFUZXRkZXNxdDZw?=
 =?utf-8?B?KzVGWm14L09uV3hwWFZqRFBoK0diUCtWbW4xU3BpK1dtZ2M5Vjg0S0lhQUdG?=
 =?utf-8?B?d1VDRzBXYzNMQklNZVE1MG5GYThTTFpublJSUzlVVTZMTkFIWmZqL3l4bnVK?=
 =?utf-8?B?ZmRNZ0t1Y2Joc205dm5TRDZES1VsRXFDZjNXVm55dlRwQnlBMmltQkg0aGhH?=
 =?utf-8?B?N2NQbFpxM1ZjZHpER1NnQjR2cmc0YXUrdDRteEZjNG1BeTRrdDZmcXBxd1dI?=
 =?utf-8?B?U2ZaNTNtWkg5YTU3UlpSdUNYemRtSmM5UEttcXJvSjk3YThrc0hybWlEUHZO?=
 =?utf-8?B?RThzakh6ZlliLzZ4ZU02VmJSL09UaWRnZWptU3RiRGdmRnQzcmtmL1ZsbHpy?=
 =?utf-8?B?QjMvRzJnbWJHNENIUzRLR2YrdW14cXZ4RjBsS3ZkWGtZdGErRDNxZTVidkht?=
 =?utf-8?B?RE12Rm5YWVFxd0xjNFdhdllibzBmQTlGaWtZQjJqbHMvRGFsYSt1SHFaYjE3?=
 =?utf-8?B?Zm9UcG5mdmplcnVqcmFDRE96QnRobkYyNzIyd21oREwwVkZMQmdnaWxNelZw?=
 =?utf-8?B?Q3N4d2tvU3k1UGVMNnZHdGU3Y1ZnWWZ3K2RBcHZEUnU3OGJsWVcvcDlsdnZF?=
 =?utf-8?B?Q1hQUW41NmlnbWh4QXdHR1hkditzL3p1aFkrMHdnUUFHTE1mdDkrZmZtb2J4?=
 =?utf-8?B?aEZyc2s2RVp3c2NrUjI5UGhDUUo1cFFsWTBjcVVjWTNhYjdrSlZIZ2lNeGln?=
 =?utf-8?B?ODlCSG10eGxBNEFRMG00ZjZFaHNSM1FQa09wejJoNjc3SUQ5KzdtMjRMQ0pn?=
 =?utf-8?B?NGdZTnhXdllwSThvZWNtVVVvWS9SWmVoK01aN29hUURwV1R3MnhEbnovOE1s?=
 =?utf-8?B?SmN0SS82OW5xTzR2T0ErZE1wMmRBOU5BN0svWVNPdzNEeEx6SnM3TU9qRUxy?=
 =?utf-8?B?TDQ5S0R1QkIyQ0Fkem94Rms5MHJydjRWaTVoaFNzM1lRM3dqQ1JJZ2swMEJw?=
 =?utf-8?B?TzlXMHhnSWRZMTNuaGVlMFR4VUsyMlIyVzFKYnBTdGJSUFFvTysxQUtaOTM5?=
 =?utf-8?B?Z2dhK1NLeS9TZU9jVFlpQ2FYVTd2Y1pxYUxIY0w4Qk9IRkZkN0l4dmFZbnZV?=
 =?utf-8?Q?6Avn56xarHHU5J1kuldKlZlgcEjmCNR7iMkEjRdjhC6n?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92abb84f-43e0-4e1d-d3b2-08daffc37f6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 17:33:54.7618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B0q6K31yNbxrYF9aWFRcf9dc2iyKL+m4ss9S3ABPAdNV6xaSa7YW+G4/m/3fLyEQK8iLOtZLII2p99np/Owk3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1525

T25lIG9mIHRoZSBkZXNpZ24gZ29hbHMgb2YgU1ZTTSB3YXMgdG8gbWF4aW1pemUgdGhlIGNvbXBh
dGliaWxpdHkgYmV0d2VlbiBhbGwgZ3Vlc3QgT1NlcyBhbmQgYWxsIFNWU00gaW1wbGVtZW50YXRp
b25zLiAgVGhlIGlkZWEgdGhhdCB0aGVyZSBhcmUgU1ZTTS1zcGVjaWZpYyBwcm90b2NvbHMgc2Vl
bXMsIGluIGdlbmVyYWwsIHRvIGJlIGRpcmVjdGx5IGNvbnRyYWRpY3RvcnkgdG8gdGhpcyBnb2Fs
LiAgV2h5IHdvdWxkIGl0IGJlIGRlc2lyYWJsZSBmb3IgYSBndWVzdCB0byBoYXZlIGEgY29udmVy
c2F0aW9uIHdpdGggaXRzIFNWU00gdGhhdCBpcyBzcGVjaWZpYyB0byB0aGUgYXJjaGl0ZWN0dXJl
IG9mIHRoYXQgU1ZTTT8gIEkgd291bGQgdGhpbmsgaXQgZmFyIHN1cGVyaW9yIHRvIGRlZmluZSBl
dmVyeSBzb3J0IG9mIGludGVyYWN0aW9uIGFzIGEgZ2VuZXJpYyBjb250cmFjdCB0aGF0IGNvdWxk
IGJlIHN1cHBvcnRlZCBieSBldmVyeSBTVlNNIGltcGxlbWVudGF0aW9uIHRvIG1heGltaXplIGNv
bXBhdGliaWxpdHkgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBzdGF0ZWQgZ29hbC4NCg0KUHV0IGFu
b3RoZXIgd2F5LCBzZWVpbmcgYW55IHVwc3RyZWFtIGltcGxlbWVudGF0aW9uIHRoYXQgcHJvdmlk
ZXMgZnVuY3Rpb25hbGl0eSB0aGF0IGlzIGNvbXBsZXRlIHdpdGggU1ZTTSBBIGJ1dCB3aGljaCBj
YW5ub3QgYmUgYWNoaWV2ZWQgd2l0aCBTVlNNIEIgc2hvdWxkIG5vdCBiZSB2aWV3ZWQgYXMgYSBk
ZXNpcmFibGUgZmVhdHVyZSBvZiB0aGUgcHJvdG9jb2wuIA0KDQpBdHRlc3RhdGlvbiBpdHNlbGYg
aXMgYSBnZW5lcmljIGNvbmNlcHQgdGhhdCBzaG91bGQgYmUgYXBwbGljYWJsZSB0byBldmVyeSBT
VlNNLiAgV2h5IHdvdWxkIGFueXRoaW5nIHJlbGF0ZWQgdG8gYXR0ZXN0YXRpb24gYmUgaW1wbGVt
ZW50ZWQgYXMgc3BlY2lmaWMgdG8gYSBzaW5nbGUgU1ZTTSBhcmNoaXRlY3R1cmU/DQoNCi1Kb24N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFNRC1TRVYtU05QIDxhbWQtc2V2
LXNucC1ib3VuY2VzK2psYW5nZT1taWNyb3NvZnQuY29tQGxpc3RzLnN1c2UuY29tPiBPbiBCZWhh
bGYgT2YgQ2hyaXN0b3BoZSBkZSBEaW5lY2hpbiBEdXBvbnQgZGUgRGluZWNoaW4NClNlbnQ6IFRo
dXJzZGF5LCBKYW51YXJ5IDI2LCAyMDIzIDg6NDkgQU0NClRvOiBUb20gTGVuZGFja3kgPHRob21h
cy5sZW5kYWNreUBhbWQuY29tPg0KQ2M6IGxpbnV4LWNvY29AbGlzdHMubGludXguZGV2OyBhbWQt
c2V2LXNucEBsaXN0cy5zdXNlLmNvbQ0KU3ViamVjdDogW0VYVEVSTkFMXSBSZTogU1ZTTSBBdHRl
c3RhdGlvbiBhbmQgdlRQTSBzcGVjaWZpY2F0aW9uIGFkZGl0aW9ucyAtIHYwLjYwDQoNCg0KDQo+
IE9uIDI2IEphbiAyMDIzLCBhdCAxNTo1MSwgVG9tIExlbmRhY2t5IDx0aG9tYXMubGVuZGFja3lA
YW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxLzI0LzIzIDAzOjQ1LCBKw7ZyZyBSw7ZkZWwgd3Jv
dGU6DQo+PiBPbiBUdWUsIEphbiAxMCwgMjAyMyBhdCAxMjo1NDoyN1BNIC0wNjAwLCBUb20gTGVu
ZGFja3kgd3JvdGU6DQo+Pj4gQXR0YWNoZWQgaXMgYW4gdXBkYXRlZCBkcmFmdCB2ZXJzaW9uIG9m
IHRoZSBTVlNNIHNwZWNpZmljYXRpb24gd2l0aCANCj4+PiBhZGRlZCBzdXBwb3J0IGZvciBhbiBh
dHRlc3RhdGlvbiBwcm90b2NvbCBhbmQgYSB2VFBNIHByb3RvY29sIGFzIA0KPj4+IHdlbGwgYXMg
b3RoZXIgbWlzY2VsbGFuZW91cyBjaGFuZ2VzIChhbGwgaWRlbnRpZmllZCBieSBjaGFuZ2UgYmFy
KS4gDQo+Pj4gUGxlYXNlIHRha2UgYSBsb29rIGFuZCByZXBseSB3aXRoIGFueSBmZWVkYmFjayB5
b3UgbWF5IGhhdmUuDQo+PiBBbm90aGVyIGFkZGl0aW9uIEknZCBsaWtlIHRvIHByb3Bvc2U6DQo+
PiBJdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSBwcm90b2NvbCBudW1iZXIgcmVzZXJ2ZWQgZm9y
IA0KPj4gaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgcmVxdWVzdHMuIFRoZSBwcm90b2NvbCBudW1i
ZXIgb25seSBkZWZpbmVzIA0KPj4gb25lIHN0YW5kYXJkaXplZCByZXF1ZXN0IHRvIGlkZW50aWZ5
IHRoZSBzcGVjaWZpYyBTVlNNIGltcGxlbWVuYXRpb24gDQo+PiBpbiB1c2UuIE90aGVyIHJlcXVl
c3RzIGFyZSBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBhbmQgY2FuIGJlIHVzZWQgdG8gDQo+PiBt
YW5hZ2UgdGhlIFNWU00gZnJvbSB0aGUgZ3Vlc3QuDQo+IA0KPiBXb3VsZCByZXR1cm5pbmcgYW4g
aW1wbGVtZW50YXRpb24gR1VJRCBhcyBwYXJ0IG9mIFNWU01fQ09SRV9RVUVSWV9QUk9UQ09MIG9y
IGFkZGluZyBhIFNWU01fQ09SRV9HRVRfSU1QTEVNRU5UQVRJT04gY2FsbCB0byB0aGUgY29yZSBw
cm90b2NvbCBiZSBiZXR0ZXI/IFRoZW4gd2UgY291bGQgcmVzZXJ2ZSBhIHJhbmdlIG9mIHByb3Rv
Y29scyBmb3IgdXNlIFNWU00gaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgcHJvdG9jb2xzIGFzIG9w
cG9zZWQgdG8ganVzdCBvbmUuIFNpbmNlIHRoZSBwcm90b2NvbCBJRCBpcyAzMi1iaXRzLCBtYXli
ZSBtYWtlIDB4ODAwMF8wMDAwIHRvIDB4OEZGRl9GRkZGIGJlIFNWU00gaW1wbGVtZW50YXRpb24g
c3BlY2lmaWMuDQo+IA0KPiBXaGljaCB3b3VsZCBmb2xrcyBwcmVmZXI/IEEgbmV3IHByb3RvY29s
IHRvIHJldHJpZXZlIHRoZSBpbXBsZW1lbnRhdGlvbiwgbW9kaWZ5IFNWU01fQ09SRV9RVUVSWV9Q
Uk9UQ09MIG9yIGFkZCBTVlNNX0NPUkVfR0VUX0lNUExFTUVOVEFUSU9OIHRvIHRoZSBjb3JlIHBy
b3RvY29sPw0KPiANCj4gT3IgYW55IHN0cm9uZyBmZWVsaW5ncyBhYm91dCB3aHkgdGhpcyB3b3Vs
ZG4ndCBiZSBnb29kPw0KDQpJbnR1aXRpdmVseSwgSSBoYXZlIGEgc2xpZ2h0IHByZWZlcmVuY2Ug
Zm9yIHRoZSByZXNlcnZlZCByYW5nZS4gSXQgaXMgdGhlIHNpbXBsZXN0IHRvIHVuZGVyc3RhbmQs
IGhhcyBhIGxhcmdlciBwb3RlbnRpYWwgZm9yIGFuIGltcGxlbWVudGF0aW9uIGVuY29kaW5nIHNv
bWUgaW5mbyBpbiB0aGUgcHJvdG9jb2wsIGFuZCBhbHNvIG1lYW5zIHRoYXQgdGVzdGluZyBmb3Ig
aXQgY2FuIGJlIHN0YXRpYyAob24gYm90aCBzaWRlcykuDQoNCj4gDQo+IFRoYW5rcywNCj4gVG9t
DQo+IA0KPj4gT25lIHVzZS1jYXNlIHdvdWxkIGJlLCBmb3IgZXhhbXBsZSwgdG8gcmVhZCB0aGUg
U1ZTTSBsb2cgYnVmZmVyIGZyb20gDQo+PiB0aGUgZ3Vlc3Qgc2lkZSwgYnV0IGRlcGVuZGluZyBv
biB0aGUgaW1wbGVtZW50YXRpb24gdGhlcmUgY291bGQgYmUgDQo+PiBtb3JlIHJlcXVlc3RzIGRl
ZmluZWQuDQo+PiBSZWdhcmRzLA0KDQoNCg==
