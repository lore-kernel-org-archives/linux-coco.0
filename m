Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C433C5
	for <linux-coco@lists.linux.dev>; Thu, 13 Oct 2022 15:29:29 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DErfDl023720;
	Thu, 13 Oct 2022 15:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : date :
 message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=Gj7mkcWsYJfge8LUSsI4cPG5DwcqXrgGgp/qhwJIs98=;
 b=LKmHO/dlYerpaP8nN+vPFDK2z22NWJJOkC1mCYSzmEd9OgsA6n5bUaI9gK0eIjHGqACL
 wtOvQzPNWH96TlpIP2ItrrTfavezUSXlS7K4D9o/RUhhOj6h4MOuzSqCgKKRSPnprNxq
 YxGym0NH55JYtrVYCKZyAbAn12h86vybYfT5Az2iecjV0H7zBK5JIlP4/XEicPPAesUm
 +QvN2IHEOAU5qnLeLGX2pmgaExiRjygUSR4bD1ucVV37kmElM8jfJXZ0TSvSHbE6GqbC
 kWequPap51uxnx716t0hL6c0512A9CcqYvKldCPDqe1XKdH5wM7/1fJLCec26OK9OqvP 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc8xed6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 15:29:26 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DEv8Np008281;
	Thu, 13 Oct 2022 15:29:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc8xecm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 15:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHFiFqttPoXV1CmPDlU4xrSrdIBUxn6uohNe1AyJ6Crq2CdWiUcvGDT3bQWujdF+VEWPWun2yIdyjdsSVccO36HngLAbqW342nLQ8b2WnyHviav8SsWZS6yMO3+pOjyQP4g7AFKhcILCoOwJrzJqcuKdz+Wpb1hXzjXyIUc9SYFPDTm57nm2PHZFodg7GxxxSIWe+GrPQ5Ce6WnCmBmy/+7xx92gqJPz7G2EPcNwDyxD4PcK62Z5JKp3gwQRAtpB3R9vFJmh+RMBZV/rb4NTOwMKM0A0mhHXF/CKzOMUcnVBvektnx2eXHOvYBaSFCcNL+mw/I98oeB26SJZ0v3Dig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16D8DiO68nwZh5xxQGJLD6PvbLqh5rN3TGPZwYeCIhs=;
 b=Itu4Z+C88j0FHrg98JLHy4rHU5c1kkN0MW1ljcP9Oy8FWm6P9Uo7eqdM00kEknpPvCvwfPq/ht1K3HS2jN3cecU8xJmmrH3H4S2DEjY/SOkrVh6IMRsB639nJC+lLXneFolIHBmDl7KGK6oDqbMu8kVNklW2IAzyDxK+lYYsEaV35CgJDv3i4MlTBgCBlSXD/7EiANiEe7XE5UeXMSlz7qXE303L8tOR+wVoGpysuUV9DuZFP4kuQTqkXG6Oh6XCxfZijTmTIe/fdXXy9phX2NbK5F/XDtfXdDjQMfRmVqX9+DGtrBQ9/jMP734fIl7tAi2pJqpBBXnfeFPEoWMQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from DM6PR15MB2842.namprd15.prod.outlook.com (2603:10b6:5:136::20)
 by CH2PR15MB3671.namprd15.prod.outlook.com (2603:10b6:610:3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.44; Thu, 13 Oct
 2022 15:29:23 +0000
Received: from DM6PR15MB2842.namprd15.prod.outlook.com
 ([fe80::48ee:6e89:f5f3:41f0]) by DM6PR15MB2842.namprd15.prod.outlook.com
 ([fe80::48ee:6e89:f5f3:41f0%5]) with mapi id 15.20.5709.022; Thu, 13 Oct 2022
 15:29:23 +0000
From: Daniele Buono <dbuono@us.ibm.com>
To: Tom Lendacky <thomas.lendacky@amd.com>,
        "jejb@linux.ibm.com"
	<jejb@linux.ibm.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Thread-Topic: [EXTERNAL] Re: SVSM vTPM specification
Thread-Index: AQHY3mGGeHJnHtlvskWr5HtN72m5q64LGK2AgAFXq4CAAANbEA==
Date: Thu, 13 Oct 2022 15:29:23 +0000
Message-ID: 
 <DM6PR15MB2842E54FB88A9D5A6D3C6133E6259@DM6PR15MB2842.namprd15.prod.outlook.com>
References: <3e11fa26-b644-c214-c8e8-492113523f95@amd.com>
 <Y0b6cDIMlKijT95S@work-vm>
 <a23e15cda00ee6a1c15f0d499deffd38b0593a78.camel@linux.ibm.com>
 <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
In-Reply-To: <b5a2985a-3717-7d4b-0c8a-52fdcbc7c6b7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR15MB2842:EE_|CH2PR15MB3671:EE_
x-ms-office365-filtering-correlation-id: 72106508-701d-4e7d-9256-08daad2fb4b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XN/ww41PbhrvRnRyDzYKY/Cq/3RbyuFthW966YoW4IE/a3K19FG0R355O1yK5u90X3Yt88fzpWlQqSb2LEx1vqslSFQ7C0xp20PnDDABWWmWdPecSKuQhCuI88Oi4Dxcjhfc7yH+qcUxMDKWRVOQJOLfYczqL0qtnEGoBWjkYf5jvgbZdZ25RwpWyjKpRjxH/ttShoypjVRkxEQ3NtYToYYAMzjNHcR8CL/fKFl3qwVJFO+cJL4bDsSkqQaKqm209oE48ENTDefMwU8a9GBl4LRSIK0QfVoRCponGfSCq/fRZNOqiM6fee7XlpgcmhVq8/Od727rRbptVQfBVxShm8OMzRAzWLJLmAoF7Qqjw3kvwmTByNmYru/d8vxXJzmQKcvMsAgDB7kGyfCP8FapQr0lGPZzbWEbbHtePHt8vupmOP344syiD0sPwGblZlOl0ptqOWVrgqfEJiS0mJcNvrD9VrW/1XvxeJmAskUqEotn+8m9HnippdVPvJs4vlIFN5pL0ttsMA/3M2eofHxkYaWVLhkXfoFxtH/NufVkfThfmPuj9BbLrelbYVTlhbJbHGvYpEsmNlmjoI5fmYn62cL+JcPlZ7OARzA5ZDNbJOW3A1d1Z6cWRTEpeDxsfx8MxH8CKzGkMSixzGnwlK47Is0u8VL4KsY+ep1kWkDsdXNzTcT58E5nL3SGfK50lSkRp/69AuUgUsX1Bd5eilsFpsbMgPwX30XBVpgPHt0NIR+dQWbHPZ/R5IYi+S2V17NQVSF7nLGh3BYk/efXbdYKd+z8T4ZdBUvWVUStqH8IoJI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB2842.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(136003)(366004)(39860400002)(451199015)(38100700002)(122000001)(38070700005)(5660300002)(66899015)(55016003)(966005)(478600001)(7696005)(53546011)(4326008)(316002)(8676002)(76116006)(64756008)(54906003)(66946007)(66476007)(66556008)(66446008)(26005)(6506007)(110136005)(19627235002)(41300700001)(86362001)(186003)(9686003)(2906002)(71200400001)(52536014)(33656002)(83380400001)(4001150100001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NXlJVUtEbjBZNjBGRXdtbnB4ekhEbUZnMGs4Vm5wQzJNUDRzVFRGRVFGandE?=
 =?utf-8?B?d1hFckNvR2pwSSs3eTRjcEtLNmpzeVV3QmlPdjh3cUZEemZrbm1wbFYvRGpR?=
 =?utf-8?B?anM5Zy9RWTBGVlNWelcwQWIyMkFBZHZCY04zOThNdWEwaFNua2Zja053Ti9H?=
 =?utf-8?B?dnFpSytKRVVmS0hocUdkNzB3Q0tkZlhMcG9rOWhTOW5XSUtvYk53VDc1VU9X?=
 =?utf-8?B?VDV1WlVVbzZHb1VBSHJ5Rk04MjJkd1FFbkNmR1lqOUdvdDRGMHIxbUVMenRw?=
 =?utf-8?B?bnRSSW5mb0NCNVVLSlpwc0ZjWXVVak5vS1NxSUVZVkV1Z2pkdEZTNlJsRzVJ?=
 =?utf-8?B?YXlZc0NQZkNZeDVRZW1vS25mQTFkTm5MSTVEM1NNNk9SWldWU1pKYWx0d2FS?=
 =?utf-8?B?ZSthUnZjb0cySWJWZEJ6YjdWZXk0Q05XMlp6d1RBY3QxSnlJYm1aeG1tMWoz?=
 =?utf-8?B?WlBsVndyN1M1QzlkSUQ3Z2JOb1g4K2FkZm15VWpDY0VVdDBuWk5oYjF2SWxD?=
 =?utf-8?B?L3MyYXBwaklvYXY1Z09jQXJibTJHTDdsczdyV2RFRjZxUHZrNjZrVmxmOHd4?=
 =?utf-8?B?NVpQZDJGT0hoWlVBL2dsd0ZXVngxNDNsUlczR0NSUHZQM29wT25hOXZ4ZHZC?=
 =?utf-8?B?a0draDZydUo2Smo4UkI0TjBPQjhhelBYRUVRenpESlhiTGVVQk9wenhwcjlV?=
 =?utf-8?B?MFB2b3dVRW04d1hPRkdIYXJBbmJicm1YRHMrNklYOTZMdXNmV2lYQWNROFo5?=
 =?utf-8?B?UURST05YRXY2V1VEYThQV3ZjY1V3bUtqVDQ4VG1ISU9leG1rbW5XVzJCcWhv?=
 =?utf-8?B?N1g4ZFViTDZsNk0zL3BFR2loWnpOc24ra2VKa1NqbEhGaFQ0QkdCaStNWGdR?=
 =?utf-8?B?U29Ha3ZESzZoOVlLZ0dsL3Uxa21YSVhPY01VQzc1V3VRd2MrMXIxNzFFd1Vt?=
 =?utf-8?B?VjhDTUVaTDZ0UTVxVy93cnh4bjBZK0RLc1pELzFLWlJ1WCtlM1BXNzducGxt?=
 =?utf-8?B?N3VVTlNFZHpGQW80Z1UxRHFha2F4dGFxZk16VVZVMVQzS3hxT2Z6TGlNL0hy?=
 =?utf-8?B?akFvZWVIVENaaWVUMmpyc1ZCNDgxdWdhTUZDc1Q2S2NKaXZKcmNEdExWbE1v?=
 =?utf-8?B?SHRabU5UN1BseFpjRjl2MkhNWmRmR25iQjJvM0NGZm16UTRaeitsZDNlYUcy?=
 =?utf-8?B?Ym8vR0dJaU5rS0lrTUQxdVNJWEFiZklyZ0NSZmlCTGxFYjZiTHE0aWduQzJW?=
 =?utf-8?B?SzNDWGFkcTd3RzlPQ0tGb253RmNIRmh3RHRtVWdPZzBSS0UrdUh1MGMvS0Zv?=
 =?utf-8?B?dkhoQzNBRWFBN2VyQXZHNkxISzhqMkJjQW50aDlxUE5uM2Vyc2s2VmRnSDUw?=
 =?utf-8?B?aDNCQStMOWF5TU9rYWg0UUppRytLVFNkczN0UGZFcEg4UVpjSHlsSndIVDhG?=
 =?utf-8?B?b0tiNGFmcjNWZ0ZpWGpvRTZxd3o3KzZJMjM2QkRTT0o1SWE1ODNmTXVpUXZm?=
 =?utf-8?B?aUFZNENIanpFZUxWaTBuZ2I3M2w3N2c2TlVadFFDWlM0WFBnTXMrTTdDaWlq?=
 =?utf-8?B?aERIUHVHcVZ6bnR1endhMm1tZndGU1oyWXpFMDVTY0t5Z3RwNTRZcHFBNUpr?=
 =?utf-8?B?QnVMaXJwaVFQODVKbnhGc0d2eFRJTTZzdjMyNGpqK1dsSk1mZzdCSCttWDBY?=
 =?utf-8?B?RmdmMXcwWVhWRXBRejlmdjVrZWZIaXM0YmozWm1IVVBzSVhvSk83Uy95Z2g4?=
 =?utf-8?B?WkRRNngwY0ErT2Z5MGtJMmM3ZlBmU290LzBRTnFuOStsajZpcnliczFVVU5V?=
 =?utf-8?B?U0EycWpTejZBaGh5dm5PSXZ2ZVRTK3BPTFZIcllQbWIzRldOLzl2bFlwQjZp?=
 =?utf-8?B?MGxkRnZIVmhaRlJPYUFPdml4QlgrOUcrZEI1QXlMemdDaEVwUEJvb2VFdmJj?=
 =?utf-8?B?aHpNZWNLWWlnVXAveGRCTS92aWpvZHphMHlrUkRoVDNtdGppS3hMTnhrS2Vr?=
 =?utf-8?B?ZU1FVTYrdkNqYUJQbnlKQS8rc25aY3JKd3VLQm9BRGN0YzlWQk0rOUdzMWc5?=
 =?utf-8?B?amR1bFY0N09iTzhoY3E2WFdOYWpSUnB0Mmhrb1F5ZmU3S0EweGNGV2RrYm1G?=
 =?utf-8?Q?X/+Q=3D?=
Content-Type: text/plain; charset="utf-8"
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB2842.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72106508-701d-4e7d-9256-08daad2fb4b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:29:23.2900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1kFbgeDciHbS4bMKsFQtCSbHwoygQBDJ8YojSZ3ng7P1M1Lrokn2EfIBPM/AUgniFdBaE7kW29qrQcB9VIijaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3671
X-Proofpoint-GUID: 0F4cCHdu1dXBgHZrghmuhdI_as2bAeGi
X-Proofpoint-ORIG-GUID: ZY_6N07FKKLNtpgd2uhzeCBa8ZoKD6vz
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: RE: SVSM vTPM specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210130088

SGkgVG9tLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFNRC1TRVYt
U05QIDxhbWQtc2V2LXNucC0NCj4gYm91bmNlcytkYnVvbm89dXMuaWJtLmNvbUBsaXN0cy5zdXNl
LmNvbT4gT24gQmVoYWxmIE9mIFRvbSBMZW5kYWNreQ0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2Jl
ciAxMywgMjAyMiAxMToxNSBBTQ0KPiBUbzogamVqYkBsaW51eC5pYm0uY29tOyBEci4gRGF2aWQg
QWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KPiBDYzogYW1kLXNldi1zbnBAbGlz
dHMuc3VzZS5jb207IGxpbnV4LWNvY29AbGlzdHMubGludXguZGV2DQo+IFN1YmplY3Q6IFtFWFRF
Uk5BTF0gUmU6IFNWU00gdlRQTSBzcGVjaWZpY2F0aW9uDQo+IA0KPiBPbiAxMC8xMi8yMiAxMzo0
NCwgSmFtZXMgQm90dG9tbGV5IHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyMi0xMC0xMiBhdCAxODoz
MyArMDEwMCwgRHIuIERhdmlkIEFsYW4gR2lsYmVydCB3cm90ZToNCj4gPj4gKiBUb20gTGVuZGFj
a3kgKHRob21hcy5sZW5kYWNreUBhbWQuY29tKSB3cm90ZToNCj4gPiBbLi4uXQ0KPiA+Pj4gV2hh
dCB3b3VsZCBhbiBlbmxpZ2h0ZW5lZCBndWVzdCBuZWVkIGZyb20gdGhlIFNWU00gZm9yIGF0dGVz
dGF0aW9uDQo+ID4+PiBvZiB0aGUgU1ZTTS92VFBNPyBXaGF0IHdvdWxkIGEgdlRQTSBkcml2ZXIg
bmVlZCB0byBzdXBwbHkgdG8gYW4NCj4gU1ZTTQ0KPiA+Pj4gZm9yIFRQTSBvcGVyYXRpb25zPw0K
PiA+Pj4NCj4gPj4+IEZvciBhdHRlc3RhdGlvbiwgdGhlIFNWU00gY291bGQgcHJvdmlkZSBhIFZN
UENLMCBhdHRlc3RhdGlvbiByZXBvcnQuDQo+ID4+PiBXaGF0LCBpZiBhbnksIGRhdGEgc2hvdWxk
IHRoZSBndWVzdCBzdXBwbHkgdG8gdGhlIFNWU00gdG8gYmUgcGFydCBvZg0KPiA+Pj4gdGhlIFNO
UCBhdHRlc3RhdGlvbiByZXBvcnQgZGF0YT8gU2hvdWxkIHRoaXMgYXR0ZXN0YXRpb24gcmVxdWVz
dCBiZQ0KPiA+Pj4gcGFydCBvZiB0aGUgU1ZTTSBiYXNlIHByb3RvY29sPw0KPiA+Pg0KPiA+PiBJ
J20gbm90IHF1aXRlIHN1cmUgd2hhdCBhICdWTVBDSzAgYXR0ZXN0YXRpb24gcmVwb3J0JyBpcz8N
Cj4gDQo+IFJpZ2h0LCBJIG1lYW50IFZNUEwwIGFuZCB0aGF0IHByb2JhYmx5IGdlbmVyYXRlZCBz
b21lIGNvbmZ1c2lvbi4gVGhlDQo+IFNWU00gd2lsbCB1c2UgdGhlIFZNUENLMCBrZXkgZm9yIGNv
bW11bmljYXRpbmcgd2l0aCB0aGUgUFNQLiBUaGF0IGtleSBpcw0KPiBjbGVhcmVkIGZyb20gdGhl
IGd1ZXN0J3MgU2VjcmV0cyBQYWdlIHNvIHRoYXQgdGhlIGd1ZXN0IGNhbid0IHVzZSBpdCBhbmQN
Cj4gbWVzcyB3aXRoIHRoZSBTVlNNJ3MgY29tbXVuaWNhdGlvbiBwYXRoLg0KPiANCj4gPj4gSXQn
cyBpbXBvcnRhbnQgdGhhdCB0aGUgVk1QTCBsZXZlbCBpbiB0aGUgYXR0ZXN0YXRpb24gcmVwb3J0
IHJlZmxlY3RzDQo+ID4+IHRoZSBzaWRlIGFza2luZyBmb3IgdGhlIGF0dGVzdGF0aW9uOyBpbiBw
YXJ0aWN1bGFyIG9uZSBUUE0gc3RvcnkgZ29lcw0KPiA+PiB0aGF0IHRoZSBmaXJtd2FyZSAoaW4g
Vk1QTDApIHdvdWxkIGFzayBmb3IgYW4gYXR0ZXN0YXRpb24gYW5kIHRoZQ0KPiA+PiBhdHRlc3Rv
ciB3b3VsZCByZXR1cm4gdGhlIHZUUE0gc3RvcmVkIHN0YXRlLiAgSXQncyBpbXBvcnRhbnQgdGhh
dCB0aGUNCj4gPj4gc3RhdGUgY291bGQgb25seSBiZSByZXR1cm5lZCB0byB0aGUgdlRQTSBub3Qg
dGhlIGd1ZXN0LCBzbyB0aGUNCj4gPj4gYXR0ZXN0b3Igd291bGQgY2hlY2sgdGhhdCB0aGUgVk1Q
TCBsZXZlbCBpbiB0aGUgYXR0ZXN0YXRpb24gd2FzIDA7DQo+ID4+IGFueSBndWVzdCBhdHRlc3Rh
dGlvbiB3b3VsZCBoYXZlIGEgVk1QTD4wIGFuZCBzbyB0aGUgYXR0ZXN0b3INCj4gPj4gd291bGRu
J3QgaGFuZCBpdCB0aGUgdlRQTSBzdGF0ZS4NCj4gPj4gSG1tIG9yIGFyZSB5b3Ugc2F5aW5nIHN1
Y2ggYSByZXBvcnQgd291bGQgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBndWVzdA0KPiA+PiByYXRoZXIg
dGhhbiB0aGUgZmlybXdhcmUsIGJ1dCBpdCB3b3VsZCBiZSBwcm90ZWN0ZWQgYnkgVk1QQ0swIHNv
IHRoZQ0KPiA+PiBndWVzdCB3b3VsZG4ndCBiZSBhYmxlIHRvIHJlYWQgaXQ/DQo+IA0KPiBObywg
dGhlIFZNUENLMCBrZXkgaXMganVzdCB1c2VkIGZvciBjb21tdW5pY2F0aW9uIHdpdGggdGhlIFBT
UC4NCj4gDQo+IFdoaWxlIHRoZSBTVlNNIHdvdWxkIHJlcXVlc3QgdGhlIGF0dGVzdGF0aW9uIHJl
cG9ydCBmcm9tIHRoZSBQU1AsIHRoZQ0KPiBndWVzdCB3b3VsZCBuZWVkIHRvIHJlcXVlc3QgaXQg
ZnJvbSB0aGUgU1ZTTS4NCj4gDQo+ID4+DQo+ID4+IEkgdGhpbmsgb25lIG9mIHRoZSB2VFBNcyBr
ZXlzIHNob3VsZCBiZSBpbiB0aGUgU05QIGF0dGVzdGF0aW9uIHJlcG9ydA0KPiA+PiAodGhlIEVL
Pz8/KSAtIEkgdGhpbmsgdGhhdCB3b3VsZCBhbGxvdyB5b3UgdG8gYXR0ZXN0IHRoYXQgdGhlIHZU
UE0NCj4gPj4geW91J3JlIHRhbGtpbmcgdG8gaXMgYSB2VFBNIHJ1bm5pbmcgaW4gYW4gU05QIHBy
b3RlY3RlZCBmaXJtd2FyZS4NCj4gPg0KPiA+IFRyYWRpdGlvbmFsbHkgdGhlIFRQTSBpZGVudGl0
eSBpcyB0aGUgcHVibGljIEVLLCBzbyB0aGF0IHNob3VsZA0KPiA+IGRlZmluaXRlbHkgYmUgaW4g
dGhlIHJlcG9ydC4gIElkZWFsbHksIEkgdGhpbmsgdGhlIHB1YmxpYyBzdG9yYWdlIHJvb3QNCj4g
PiBrZXkgKGtleSBkZXJpdmVkIGZyb20gdGhlIG93bmVyIHNlZWQpIHNob3VsZCBiZSBpbiB0aGVy
ZSB0d28gYmVjYXVzZQ0KPiA+IGl0IG1ha2VzIGl0IGVhc3kgdG8gY3JlYXRlIGtleXMgdGhhdCBj
YW4gb25seSBiZSByZWFkIGJ5IHRoZSBUUE0gKGtleXMNCj4gPiBzaG91bGQgYmUgaW4gdGhlIG93
bmVyIGhpZXJhcmNoeSB3aGljaCBtZWFucyB0aGV5IGhhdmUgdG8gYmUgZW5jcnlwdGVkDQo+ID4g
dG8gdGhlIHN0b3JhZ2Ugc2VlZCwgc28gd2UgbmVlZCB0byBrbm93IHdoYXQgYSBwdWJsaWMga2V5
DQo+ID4gY29ycmVzcG9uZGluZyB0byBpdCBpcykuDQo+ID4NCj4gPiBPbmUgd3JpbmtsZSBvZiB0
aGUgYWJvdmUgaXMgdGhhdCwgd2hlbiBwcm92aXNpb25lZCwgdGhlIFRQTSB3aWxsIG9ubHkNCj4g
PiBoYXZlIHRoZSBzZWVkcywgbm90IHRoZSBrZXlzICh0aGUga2V5cyBhcmUgZGVyaXZlZCBmcm9t
IHRoZSBzZWVkcyB2aWENCj4gPiBhIFRQTTJfQ3JlYXRlUHJpbWFyeSBjb21tYW5kKS4gIFRoZSBj
dXJyZW50IFRQTSBwcm92aXNpb25pbmcNCj4gZ3VpZGFuY2U6DQo+ID4NCj4gPiBJTlZBTElEIFVS
SSBSRU1PVkVEDQo+IDNBX190cnVzdGVkY29tcHV0aW5nZw0KPiA+IHJvdXAub3JnX3Jlc291cmNl
X3RjZy0yRHRwbS0yRHYyLTJEMC0yRHByb3Zpc2lvbmluZy0NCj4gMkRndWlkYW5jZV8mZD1Ed0lD
DQo+ID4gYVEmYz1qZl9pYVNIdkpPYlRieC0NCj4gc2lBMVpPZyZyPVB3RGo1S0xaRDB3SjFnSG9O
enpyU0J0WGlodGNtcGdtdTFHZnZ6OTANCj4gPiBPaUkmbT1DYndtQVU2U1Q2Nnd0RVFGdVE0cXRh
OTRBUk1GM0x1RzM3UEVadjRWQnZZdFl5M0VDLQ0KPiAzVjU5cjhtbm5XTFE0cw0KPiA+ICZzPWp5
bVM4eTRjOEhIcjFFUEtlaTYyTkdTQVhZQkk0RG5tM2hDcEhydEpVYzgmZT0NCj4gPg0KPiA+IFNh
eXMgdGhhdCB0aGUgRUsgc2hvdWxkIGJlIGF0IHBlcm1hbmVudCBoYW5kbGUNCj4gPg0KPiA+IDgx
MDEwMDAxDQo+ID4NCj4gPiBBbmQgdGhlcmUncyBhbiB1cGRhdGUgc2F5aW5nIHRoYXQgc2hvdWxk
IGJlIHRoZSBSU0EtMjA0OCBrZXkgYW5kIHRoZXJlDQo+ID4gc2hvdWxkIGJlIGFuIEVDIChOSVNU
LVAyNTYpIG9uZSBhdCA4MTAxMDAwMi4gIFRoZSBjb3JyZXNwb25kaW5nDQo+ID4gc3RvcmFnZSBr
ZXlzIHNob3VsZCBiZSBhdCA4MTAwMDAwMSBhbmQgODEwMDAwMDIgcmVzcGVjdGl2ZWx5LiAgSSB0
aGluaw0KPiA+IHdoZW4gdGhlIFNWU00gcHJvdmlzaW9ucyB0aGUgVFBNLCBpdCBzaG91bGQgcnVu
IFRQTTJfQ3JlYXRlUHJpbWFyeQ0KPiBmb3INCj4gPiB0aG9zZSBmb3VyIGtleXMgYW5kIHB1dCB0
aGVtIGludG8gdGhlIHBlcnNpc3RlbnQgaW5kZXhlcywgdGhlbiBpbnNlcnQNCj4gPiB0aGUgRUMg
a2V5cyBvbmx5IGZvciBFSyBhbmQgU1JLIGludG8gdGhlIGF0dGVzdGF0aW9uIHJlcG9ydC4NCj4g
DQo+IFdlIG9ubHkgaGF2ZSA1MTIgYml0cyB0byB3b3JrIHdpdGggZm9yIHRoZSBTVlNNLXByb3Zp
ZGVkIGRhdGEsIHNvIHdvdWxkDQo+IGhhc2hlcyBvZiB0aGUga2V5cyBiZSBvaz8NCg0KSSBiZWxp
ZXZlIHNvLiBXaGVuIHdlIGRpc2N1c3NlZCBpdCBpbnRlcm5hbGx5LCB3ZSBkZWNpZGVkIHRoYXQg
cHJvdmlkaW5nIHRoZQ0KaGFzaCBvZiB0aGUga2V5cyBpbiB0aGUgYXR0ZXN0YXRpb24gcmVwb3J0
LCBhbmQgdGhlIGtleXMgdGhlbXNlbHZlcyB3aXRoIGFuDQp1bmF0dGVzdGVkIG1lY2hhbmlzbSBz
aG91bGQgYmUgZmluZS4NCldlIGNhbiB1c2UgdGhlIGhhc2hlcyB0byB2ZXJpZnkgdGhhdCB0aGUg
ZnVsbCBrZXlzIG9idGFpbmVkIGVsc2V3aGVyZSBhcmUNCmluZGVlZCB0aGUgb25lcyBnZW5lcmF0
ZWQgaGVyZS4NCg0KPiANCj4gVGhhbmtzLA0KPiBUb20NCj4gDQo+ID4NCj4gPiBKYW1lcw0KPiA+
DQo+ID4NCg==
