Received: from BN3PR00CU001-vft-obe.outbound.protection.outlook.com (mail-eastus2azon11020014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A528EA4
	for <linux-coco@lists.linux.dev>; Thu,  2 Feb 2023 06:04:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvvnEHTwEHSHzDa3muGdp1gizgNAjJbX7E3KqPHsYkuGL6u5ARjJfZDuioEF+/dPKAwhz95xIkpyzD3gkfH/gmrCA+id04JykHG2LXipZIIrPvJacyF/InzqNQZRVcWleqcIDercc9HcJ5YpMdgoSmxTQhW8h8xjMaQzk3IceKjILESnfat96gS6nn5QgC7ZuYa306nU9dyuNxp9QwCFv8+AH3QQ49SO+nzHt0CC73pH7khi98dcE+c4epqp1ZSSryV7EhcAch9fGyY7mi3/rsfHCP2rt4jIbg+UyAJHB9BvyhRBJom2VlNaGDuAWGSXVDKJRiyh4OSSWM//Q+WTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv0+hhDfT881QHj9SsK/alsjUFO3I0XtswwnZV5OWvk=;
 b=od8e4ZVtgIrlpCx3mEk+zNZdtinYI9YU4md2+hDMjxw/W8XRAuFKBpdMOqjirqCp65hSEBjwotoJsCPZqxhtEshbgh/vzrLM0P4gTRzg1d4W08NmnV5YP60floJ7Qf7kWxambDvYxn0//JXBevklYZtwGCcpDaqMOYT7tN3Y/BWp43wKS38DwnZD3hOzF2BUE43QqQHQERdLF9W+BQ5oQerIJd73L4YxXKxJ36NCbi0X2l+HV8keXVxdR20bTOL4FnnCyQ4xqxXeXKtmL3vaNVgW8k3WXWxAi5sEXRVEALN+Y/IzNNxmPyMatyK/vjqHRdraq/P+o6Lc/MktVi7UCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cv0+hhDfT881QHj9SsK/alsjUFO3I0XtswwnZV5OWvk=;
 b=Yroh4641ilEXYr8eanMDgaa0qM6PFkY1dEWWjYYbfKpDj+CzgGfOBORiXPVTN0e+otsR8RIUvNseqBqm4MZoMcsb4Fp2/2Ll1aPc9QCeV/mAPHsbEioi7IEvTRPOXuk/SbpU7kQDBiomJWSUzQeJZn7i1ngmXoZNZo/v7UqbkRY=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by MW4PR21MB1988.namprd21.prod.outlook.com (2603:10b6:303:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Thu, 2 Feb
 2023 06:04:46 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d%6]) with mapi id 15.20.6086.004; Thu, 2 Feb 2023
 06:04:45 +0000
From: Jon Lange <jlange@microsoft.com>
To: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
CC: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>, Tom Lendacky
	<thomas.lendacky@amd.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "amd-sev-snp@lists.suse.com"
	<amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] SVSM Attestation and vTPM specification additions -
 v0.60
Thread-Topic: [EXTERNAL] SVSM Attestation and vTPM specification additions -
 v0.60
Thread-Index: AQHZNlDE2Hlp2qHkQU+fkkyL7dpRKq67Kd7g
Date: Thu, 2 Feb 2023 06:04:45 +0000
Message-ID:
 <MN0PR21MB3072C9C104C867420936D8B9CAD69@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9eqB5/1YcZeIHqG@suse.de>
 <MN0PR21MB3072B127F1B0D6E0F73DF37ACAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
 <02020D95-2BF1-4999-80BD-86CD8589197C@redhat.com>
In-Reply-To: <02020D95-2BF1-4999-80BD-86CD8589197C@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c79ca354-8e21-4cb3-bc91-d37837bf93a3;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-02-02T05:57:36Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|MW4PR21MB1988:EE_
x-ms-office365-filtering-correlation-id: d341a1e5-dff0-4bf2-2e4d-08db04e36265
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xt+fw/7iUbhHUDcXegOAMdjjQ5w7gaYqc+OwjxLgtgx7e22fcqqb/QvtV8JxiXRA6iPHMTUbkgfVD0T4vDjyvS5hYUlZtmqDsnSS7KcX4QBpBW0C9wb+wFYSTTX9hLAVet1RN1aDhJw9Kfyj+4kUeJZ/QcSaQ3eF+Jp0juZhuPnq/RwHea1pCwAToVaVur6/UzD7XzYt3kqzp2w3tc5atg0V95uES17HDewTA55w1C437BzgYmHFokRfcuvJWEsBw6Omtzzh5xVKASum/CLAaCrqfCuCXWkXaUsgt/Vc1N02V8zETETtY3TnI+cZj4vpEZDtHjWdkWW98/KKu472rabLe8YnsmTgQkcsceTKkAo998tZ0a0+mN46G/eEUSRXo4Vzckv85Wm3Ec1VZ1xZKH6o3U31zaCoGizPh0J6vIV6dYbYTB+M+coX6JTim2dfSBZqx9ESkaSsnRHcTGybkCWm0bvoxPpm+S+7lvaJg6m4+xac9qm7XH+I8tkizIdWvyv87j0amQL5PWpsHI1TR4x2GInTD3bYRXeQO8HqOavVFM8+xj8rP69/2oKvkPVzdY+GJ5FcgUiWbHcItSyQAzhhh1jhy2Hi3CQFwO7V02wshji3NqaJrwzxdKg19EgDUHvowdd54w1G9X041gTscNGUUfIvbW04itmAGVSWJdZqmjJVvST6tYqpZ9+Up7CkD0E/5GF48hU1GjUfEUSSSD/a2pRDQM2yepmf8NDcneD7TWKWgoS3fgTtr3EZXWqi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(2906002)(33656002)(8990500004)(54906003)(316002)(83380400001)(71200400001)(478600001)(9686003)(186003)(10290500003)(6506007)(64756008)(66446008)(66476007)(66556008)(66946007)(8676002)(76116006)(6916009)(4326008)(38070700005)(5660300002)(55016003)(86362001)(41300700001)(52536014)(8936002)(82960400001)(82950400001)(38100700002)(122000001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TmZFdXEvL0dKR2QyZU9JM1Bqb0ZVbkRRWllGWGxVTFgwUnpLVk9jV2I2b1R2?=
 =?utf-8?B?dlhoWmlXRGt4SGNtMk9jeDBhajhxMWw4UHlFTWRKZndLVk5vVWZKVkh4N1d2?=
 =?utf-8?B?U3NiUTloL1FNWlNmSGF5RmJpOXZ4S3BrbENGZjBBUkh5cTNZbE40UFNEcUVq?=
 =?utf-8?B?azNHaUFLMEI5L0tJN0s2N0dCL3hVMnc5R1U1MGw5aXJhQjBIZXNoc3JTYjY2?=
 =?utf-8?B?cjBXaFZnTGlCaWdsZG9OeUJkYlZBK3hCQzE2VU92VlcwYWpScno1czVKR2dZ?=
 =?utf-8?B?Ujc4RXd0L3Z6aGl1QzEwWDBWQXgwY0d0ZW10dFowZVdGYjcwdStkMk03c3pr?=
 =?utf-8?B?TnFkbVFGRnMwenJGTDN1aldFVk1BM2hVVlZiTFUvY3ZscFl5d3lOVStFUHhu?=
 =?utf-8?B?RnBTUW1MUWpQRHV1ZWxURW4xMXNtc2VBbmwxbVpwRTVNb2lsT0h6ZWFiN1Zt?=
 =?utf-8?B?a1VlZVZlZFZEbC9QQjE0b085N2JseHl5SmlnRmppL0xrb2VBaDJHYXYwOFgw?=
 =?utf-8?B?amprL2hRaXgxVkVtQ1V3Q0FONEZia2JFR05IbTVZdHFGY051MTlSZE5JejFn?=
 =?utf-8?B?OUsra2FVNEQzZThudjF4Wm50aVhoRHd3RHZrN2x2Ym8wN1lFV055aWVIZjlH?=
 =?utf-8?B?cHo5cEFESTkzcEZXamxhc2JkcG5EOHRYZkd5Ni9ldkwxWHhoMkMzQU9pUU0r?=
 =?utf-8?B?cEc4WkNRZTlQa05xRXdPSEVKWFBuZkFQUVZMVmJzaVRWSENJM1ZyWmZuYjh4?=
 =?utf-8?B?NnRZMHNyMzV6OUxtZ0hidUkxcGI4UXJtZUdBdEVySHJVVjNkTmtMcUpLbzVX?=
 =?utf-8?B?ajV2eUhWR2ZMOHpvRlQ4ZjFkdTg0eGZCTWtCUU5IQ041TUg3dm5ZLzZtdnpn?=
 =?utf-8?B?cVVpWCt5QlFRY25PVHVUbHVuL2d6Wmw0SzI0cDlzTUZpdzZFUis5amo0Nkxh?=
 =?utf-8?B?OVhFK0VaUFh5RGFuaFZtT1I1eVlOTTllbVRlR1R6a2ZxWVJ4WkdQN2dZOG9S?=
 =?utf-8?B?dW1oeVZ3aWlDSWhFZFpaR2FleVFFL0lvd1pOYXBFeFg1SlRKaWd3WmZNTjhC?=
 =?utf-8?B?MUZZTzJKN0oxWUxrOWt4SWhvWlM2QWZVTmx4TExTUUNEY096ZkF0K2hMR3Jh?=
 =?utf-8?B?aHVzT21kMzVsZnlEampmVmFaQjNrU295aFpsdVB4OWlVaUswbmFmUGdFaG10?=
 =?utf-8?B?T29YNjJDeUFLRFY2eDVMVjJpYXhVcUxBbEEvY3hablVHNk9hM3A1RUdqeDVt?=
 =?utf-8?B?Wno4T3puL2ZWN3RjZFFlbENkaUpWNm5YS08rNXB0dmJFOHZCZWRZdlAxQm5r?=
 =?utf-8?B?T0hHRFZUNWFzUmhOMXNpSkI5YXNxaTFQNjlyUVlMVzZDZUdjMjk2VnM3TWZ2?=
 =?utf-8?B?RHp3M25xVmdJNndNZ2NsSnR2cVd2M0dMd0NWV3NHNFRlbUJ6V0pKUWZGTHFr?=
 =?utf-8?B?SFdhK2pOT2YzMG9YbElwVjA2VjRYajVaZUlQa1lnUXFKZm5nbTRvMVUzaTgy?=
 =?utf-8?B?c3hubTVBWE80U2RvV0o5QU93N0Q1VkJaUENlcWlsc2tnZURxL1k2YWpRd1N5?=
 =?utf-8?B?K1FRVnJYaVlyS1JlUnY2UEJjQkthZFZCL2lQbFJyRmYxdW9kTjFVVGFoZUVq?=
 =?utf-8?B?ZWtTaVRKYVZqU0JFekxFMmVMRGFDRVNiVUtvUUZLcXltNDNCRERueXgxaElQ?=
 =?utf-8?B?SXBEYmM2NVJrNWV6NkZ0aldMVDhZU3k0ZklPNmMvZHJKRGVNdElmMkhFL1ph?=
 =?utf-8?B?S0JrZzZLbU1yaVpYL3k4QWMvYjNmeGk2clRTNGljSjNLYTVZbnRnSjdhMzJt?=
 =?utf-8?B?V083OUo0MjhKd3U5MHNrNlJlc01vZlpTc0JVUVlMeEFxb1RIVjFnRU81d3pY?=
 =?utf-8?B?VGhmV0Z3Nlg2SG5ZTlF6S3YwSmV1VlBzL1VXeUZzSTJmcXhZd3VwRGZHSE14?=
 =?utf-8?B?RTlESWJGN0FlbVZkZVJRdk9pZCtpQzRLM0VzS3I2VWhpQ3JPL2RHdnI4QUJ2?=
 =?utf-8?B?SHp2QkxiNWtBWjROQkRqSmRQZnY4Y1g5NWZpYTY4ZGUvdEFOakoxc1ZTTDZs?=
 =?utf-8?B?WEVXWHcwOENhZWd6dUZTWVcyaDE0UzdqaXhhNmpZeHhZNUY2K2VvWUJNc1dR?=
 =?utf-8?B?UXo5d2hOQ3lXekpnZklGa3VFQ29xdTNURmNPeTB2dEU5dXNBRGhRVEJhcEhV?=
 =?utf-8?B?YlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d341a1e5-dff0-4bf2-2e4d-08db04e36265
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 06:04:45.7005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOkHtXah1sPxn/dWn99JiN55+LZ9+v+TqhDBGXD8e+FSRUF9W0f/mTzmZXrLlFfSoMBfuykDqJ3rjTKALrM/tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1988

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdG9waGUgZGUgRGluZWNoaW4g
RHVwb250IGRlIERpbmVjaGluIDxjZHVwb250ZEByZWRoYXQuY29tPiANClNlbnQ6IFdlZG5lc2Rh
eSwgRmVicnVhcnkgMSwgMjAyMyA3OjIwIEFNDQoNCj4gSSBtdXN0IGFkbWl0IHRoYXQgSSBhbHNv
IHRob3VnaHQgb2YgbG9nZ2luZyBhcyBhbiBvYnZpb3VzIGV4dGVuc2lvbiB0byB0aGUNCj4gY3Vy
cmVudCBwcm90b2NvbHMsIGFuZCBJIHdhcyBhbHNvIHRvcm4gYWJvdXQgaG93IHRvIHN0YW5kYXJk
aXplIHRoYXQuIFRoZQ0KPiByaXNrIG9mIG5vdCBoYXZpbmcgYW4g4oCcZXhwZXJpbWVudGFs4oCd
IHBhcnQgdG8gdGhlIElEIHNwYWNlIGlzIHRoYXQgdGhlcmUgd2lsbA0KPiBiZSBhIGxvdCBvZiBk
aXNjdXNzaW9uIGFuZCBiaWtlIHNoZWRkaW5nIGJlZm9yZSB3ZSBhbGwgYWdyZWUgb24gc29tZXRo
aW5nLg0KPiBCeSBjb250cmFzdCwgcHVzaGluZyBhbiBleHBlcmltZW50IGFuZCBoYXZpbmcgcGVv
cGxlIHRlc3QgaXQgc2hvdWxkIGJlDQo+IGNvbXBhcmF0aXZlbHkgcGFpbmxlc3MuDQoNClRoZSBk
b3duc2lkZSBpcyB0aGF0IHByb3RvdHlwaW5nIGluIHRoZSAiZXhwZXJpbWVudGFsIiBwYXJ0IG9m
IHRoZSBJRCBzcGFjZSBtZWFucyB0aGF0IG9uY2UgdGhlIHByb3RvdHlwZSBpcyByZWFkeSB0byBi
ZSBkZWNsYXJlZCAic3RhYmxlIiwgdGhlbiBhbGwgdXBzdHJlYW0gY2hhbmdlcyB0aGF0IGhhdmUg
YWxyZWFkeSBjb21taXR0ZWQgdG8gdGhlICJleHBlcmltZW50YWwiIElEIC0gaW4gYWxsIHByb2pl
Y3RzIC0gd2lsbCBoYXZlIHRvIGJlIG1vZGlmaWVkIHRvIHN3aXRjaCB0byB0aGUgbmV3LCBwZXJt
YW5lbnQgSUQuICBBbmQgd2hpbGUgdGhvc2UgY2hhbmdlcyBhcmUgZmxvd2luZywgdGhlcmUgd2ls
bCBiZSBpbmNvbXBhdGliaWxpdGllcyB1bnRpbCBhbGwgY29tcG9uZW50cyBoYXZlIG1pZ3JhdGVk
IHRvIHRoZSBuZXcgSURzLiAgVGhhdCBzb3VuZHMgcHJldHR5IHBhaW5mdWwuICBXaHkgbm90IGp1
c3QgYXNzaWduIGV2ZXJ5IG5ldyBmZWF0dXJlIGl0cyBvd24gcHJvcGVyIElEIGFuZCBjb25zdW1l
IGl0IGZyb20gdGhlIGJlZ2lubmluZz8gIEFzIGxvbmcgYXMgaXQgcmVtYWlucyBleHBlcmltZW50
YWwsIHRoZXJlIHNob3VsZCBiZSBhbiB1bmRlcnN0YW5kaW5nIHRoYXQgdGhlIHNwZWNpZmljIGNh
bGwgZm9ybWF0cyBvZiB0aGF0IHByb3RvY29sIG1heSBjaGFuZ2UsIGJ1dCBvbmNlIHRoZSBkdXN0
IHNldHRsZXMsIGl0IHdvdWxkIGJlIGRlc2lyYWJsZSB0byBub3QgaGF2ZSB0byB0dXJuIGFyb3Vu
ZCBhbmQgY2hhbmdlIGV2ZXJ5dGhpbmcgb25lIG1vcmUgdGltZS4NCg0KUHV0IGFub3RoZXIgd2F5
LCB0aGUgSUQgc3BhY2UgaXMgYmlnIGVub3VnaCB0aGF0IHdlIGNhbiBhZmZvcmQgdG8gcHJvdG90
eXBlIHByb3RvY29scyB0aGF0IGVuZCB1cCBnZXR0aW5nIHRocm93biBhd2F5LiAgV2Ugc2hvdWxk
bid0IGZlZWwgbGlrZSByZWdpc3RlcmluZyBhIHByb3RvY29sIElEIGlzIGEgcHJvbWlzZSB0aGF0
IHRoZSBpbnRlcmZhY2UgaXMgc3RhYmxlIGF0IHRoZSB0aW1lIHRoZSBJRCBpcyBhc3NpZ25lZDsg
d2UgY2FuIGVhc2lseSBkZWNvcmF0ZSB2YXJpb3VzIHNwZWNpZmljYXRpb25zIHdpdGggZW5vdWdo
IGluZm9ybWF0aW9uIHRvIGtub3cgaG93IG11Y2ggY2h1cm4gdG8gZXhwZWN0IGJlZm9yZSBpdCBj
YW4gYmUgYnJvYWRseSBjb25zdW1lZC4gIEl0J3MganVzdCB0aGF0IHdoZW4gdGhlIHByb3RvY29s
IHJlYWNoZXMgdGhhdCBwb2ludCwgd2Ugd29uJ3QgdGhlIHVsdGltYXRlIGNodXJuIG9mIGNoYW5n
aW5nIElEcyBvbmUgbGFzdCB0aW1lIHNpbmNlIHRoYXQgY2FuIGJlIHNvIGVhc2lseSBhdm9pZGVk
Lg0KDQotSm9uDQo=
