Received: from DM6FTOPR00CU001-vft-obe.outbound.protection.outlook.com (mail-cusazon11020021.outbound.protection.outlook.com [52.101.61.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DDBAD58
	for <linux-coco@lists.linux.dev>; Fri, 24 Feb 2023 19:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCjVM6umK4ow+YvZIIrhLtjLoNK+IywRMuwn/W94CZ/gcRy5pPNkIAUx0INxE3JqL2z99K7ZduDwc80Ih7AK3DsGLw4Byq1ywrB5RyDo6GFXU22GY8oX94IOtpWLX7OHK2qOsIMHorvesThEbUotb/0sD7U1PfFgleugRtc8DgGZPGJyw2YQcEzOpd0ggTSRwPlREKZBH7rj5780Buo6iCJKhjRWqLn99bjQk7QN0DhEAu6e/NbNjpQn2V7tdia6qKvVtxCTfTmsW54dvXfoXPlY/GAhRuT1eIB1ojMQFnEbtUcvNSXa2mt/szZCQVD8RIyNkeDm0oQo4CBcfOvZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YbK3prvkvHI8a0FSj3gCe4gCwlpwj3IZqsZDxaSAMs=;
 b=LFZuH2HioZFeoxjifsmlehfbKzo5ir9zpd8ZUkt9iBS4aAGed8xRGGvz120Zi91ZpTFhKzcyWG3Mleb9r8h35uO3O1bIELJX0aEJtdfPBTtWk02X72n4EVEQOIhQxQxAL3juMvmBisR19KwgOWBhepbjCjsFCmXUjBbWIGP0u7LUpoBQRXCVAxD+SS0VCQPzpqVrc9KNxtXERAPyf/PI/5a1/AH6mhPm1PlTtwvP28z6PRoGDf0E2U9bN8Ns6w3n9EYxid3rcbC7DmTn64rgnMIpD1oqFkRdXB4aazfLRpsNY3afzSGK0MzOpM/svfCNLKk70p8LTd0YgBJzPfHkvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YbK3prvkvHI8a0FSj3gCe4gCwlpwj3IZqsZDxaSAMs=;
 b=diD0hM2c4nochuFFTY6jqZaHXq2NpxlDLonUkBWyotjqp9xucxkCwFhXbnRxf+7tlhhPSJ6zHRc1CUM5LmESVYd4rcm2gDH+j5OM2dainv8+2l67+bSjCodMYfeGInEiQ3GLemVIIfXtJnrci4t4LSHVgPwPDziJVhiKnkRlJKo=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by SJ0PR21MB2000.namprd21.prod.outlook.com (2603:10b6:a03:29b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Fri, 24 Feb
 2023 19:02:21 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::424e:dbf5:798e:581b]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::424e:dbf5:798e:581b%4]) with mapi id 15.20.6156.005; Fri, 24 Feb 2023
 19:02:21 +0000
From: Jon Lange <jlange@microsoft.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>, Tom Lendacky
	<thomas.lendacky@amd.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.61
Thread-Index: AQHZQSLWNOs+AcbsCUmHp01ByE1c6q7Z/5UAgAQy9gCAAE+HgA==
Date: Fri, 24 Feb 2023 19:02:21 +0000
Message-ID:
 <MN0PR21MB3072CC6E9027D4B75560E05FCAA89@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <89f1527e-b710-8bd8-1059-4a0a51e4c0ab@amd.com>
 <Y+yqpq+S3N/lIKjQ@suse.de> <069c74a5-2735-adba-5748-090e80550c9e@amd.com>
 <Y/jGcMhXfEm8MCYK@suse.de>
In-Reply-To: <Y/jGcMhXfEm8MCYK@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=a354d6bb-4a95-4688-9289-62ecbf406f0b;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-02-24T18:59:50Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|SJ0PR21MB2000:EE_
x-ms-office365-filtering-correlation-id: ec5eef8f-1862-4780-2d13-08db1699a848
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 W7tqTscTZr0jAjSvpVGczcRYYHvN/FxISn0H8qn7KfZATNjWAt/Tl9+XhFJad184gXHzZlCviY+Hh6E940KznU6+tosrJYu4OVAgtQwRbfUMzbuxOuOQHu0lzKu1KF9/5DtqalcFs3j9cXim9U/2ce0FIPP5q4m3aZgM+T8t70vbP4IuKHRooHRvWn4xVKAVQU02EiA5ZTYpDwk5gXgivLhPubo0Z/r+4PNCEPRPOsqllx/9BI0PY79Sszt5uW2RzfgXp4vj6ltgHPn6pXKQkTcfiwhQaKzoAVjTYxbgt67htZLXxB5qCEXULz17D+VhAgLlnV8vF8KpBWjylkwn4CYsd9VReWIMlSSyaq1O332EaYPaB00pazvHdi0OUHmiH49P+xPjONv9QOfZ6Lr+3Q9HU8cQ77KWtCC5xidKMvUzhy66AQsNHeOp03lR7o8C+af62fS37F06zEzVbf4+YqMrEAd4IxGse/DqdW9uSs/sYkSUnc5spzGNQk0vWJ2a1FtHgHC61Pr79VBBCqAZKGAzshFoDEBQ4qArC+TGC5bsIJqNhEqaBKGkL9doSjjWUxs6dWVMJmBP9wG/ysUgR9813SXrPuVf/X2SV+eLPgyFglpRf12Z0s1upM9JGvfC/FoMxoNRI63t1ujMFsEj+SKGi3JYrVreI5jAaSYe+pXY+s3sumvypyTGO6lXQsWmvaGOaNLiz3gHm/ynZXQyYlezTjdHu6x9dJMPeT3TvP8qaYNer+9z04gA2aU+sOCV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199018)(71200400001)(33656002)(86362001)(4744005)(8936002)(41300700001)(8990500004)(2906002)(52536014)(5660300002)(83380400001)(122000001)(38100700002)(38070700005)(82960400001)(82950400001)(478600001)(10290500003)(7696005)(76116006)(66946007)(64756008)(110136005)(66476007)(66446008)(8676002)(186003)(9686003)(55016003)(66556008)(54906003)(316002)(4326008)(6506007)(66574015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3svEIjlzwT6PcHw17s5cCB2lTT7TQg6PlB5oIeGPTJxOUyfhY1qM0gZxFf?=
 =?iso-8859-1?Q?8oYadrSyRaiAPWx54ZwBYOuJ2c7j2NiXOmyahIuFDUgVc+ClReEwFFutA+?=
 =?iso-8859-1?Q?WUACs8B0pl0VmbcY1P81trabGhN7OS7eDvhCSoFoD2Qaf9l5Z7K/F+y6bX?=
 =?iso-8859-1?Q?eJ2Sdfav+wj09XgCXyi7Knj+5Qri45gh0LsRMIuRmjb5paX/WZ9zz3jk3c?=
 =?iso-8859-1?Q?lHz5jnXv8GfVf/uQvut/IKDZqNgt0XEkYhizPgkpYW1c4DIgpFsTuYIKG5?=
 =?iso-8859-1?Q?zEvXT84qLSEnbVbi9O2aLJ0jbYoW9MDiN4kPC6J1ZAktvKeE15W2wx/PhF?=
 =?iso-8859-1?Q?NrYv/OZJ6y8E0bnwg9YeWrSmVGtPaSohmwg1rXGhVcZC5h5f8X27t1eRqq?=
 =?iso-8859-1?Q?0lQYzjQRSyzFKib9bsp2sHbixXh1HFMN/2ssjEwrg3KoGC3+I+STTRgzIn?=
 =?iso-8859-1?Q?WSlSNMoNDF4+8ZGuejXVXLs0PIumKE7sn6QIN7UbBPhErZMTGlaAfon5Ur?=
 =?iso-8859-1?Q?+9zYw8k67CpymF2GQZg84nh06audz+Dv59n4braTSON8aWxQ2XzL/+npWF?=
 =?iso-8859-1?Q?UcGCEIMukfZnvoRY1gTSxKRQ1brZBHl+HknI7nAgKyqB+pgIBM0sakAw9j?=
 =?iso-8859-1?Q?QEEkmbeYG/5CYDEIcqlBoWLA/FqjQ5SCqBKwauK1iCbaYqnFa/itcVz1x6?=
 =?iso-8859-1?Q?FABeF0vm97+VQ04JLTYgVqAE3cTlpeKgLeu/MGFWOTYic87Y+gc0VFoiTT?=
 =?iso-8859-1?Q?4nr+Sy98MH7Z6OCl7vRMAVJBjWTWu8xbuaqhRvpx1d61S5CgJxa2nlWgJp?=
 =?iso-8859-1?Q?rRkwBLBn72SQL6vmzRVqa5EXq78U/VXbCKomWNLzZjJ3PfarwSO+kyaFFK?=
 =?iso-8859-1?Q?NyxQBT5XTsW3Q1rOKdgh2kHJ8XehALdWGK1BUhNTyQq0OrkMLnE7dABczO?=
 =?iso-8859-1?Q?TyqtEypHD3n9k+T2TYveSoxCGfPsq60W2aUQBcbBSw/BqIlgyT6Pr1jwXn?=
 =?iso-8859-1?Q?niepDPboYJ4t9bKFZJ8AX+S1S/q8AUC7aImL9Z3fNGwloPQZO9gKEpSXX3?=
 =?iso-8859-1?Q?oqRPSuo9SjHm1VTeG/pNj/IKBhJqX2nUHH3nGHBExqTIs09DJYIChBkKwn?=
 =?iso-8859-1?Q?k6E+XS3acSMZfbeMl96YY/gIvLJJpa+pZRc7LuwqdSwFqTa+4mCJP5geoA?=
 =?iso-8859-1?Q?3MjyNWQFIgx9bP7ItkbR+jV35X0PehLI8Ma8iiL30d8PLRgUkLD2TAize+?=
 =?iso-8859-1?Q?g3UpxjHgbxki0vKKJtgv1gA4PvbFyc5lHOTeoM4P/fkRFKmSchzWYlyuNp?=
 =?iso-8859-1?Q?r3l/Oj3+VPkdk9U4GZCkn8QwTAIa++nChtj4J/S+wrdDYu3NZ3cwd29au7?=
 =?iso-8859-1?Q?R5ntRs4BGWxMOA5jAcp36AemBvH/CnpsUSSmTDqRvN1GryMKgWUJ5afXb+?=
 =?iso-8859-1?Q?wE2kIsLEvMYfnYjHiXKu7/kf/3WARR9Uf6nugc/b5ockmsr+g1xYEx2Tfj?=
 =?iso-8859-1?Q?viaLbacBOS0vhzYlgWk5+nrW2rMqUjkPeUv/stHS0ikPbyhIvBiB3CsOiQ?=
 =?iso-8859-1?Q?MwnWrk3NLwhuCi88RJgdpt3qnPA6xKjEIQmVXZhamJvehhrWFWaqWX56Gt?=
 =?iso-8859-1?Q?W3U8308+2u0uxhY8YJA0YIsCvZdIdMcd7zSJ+uGnG+3twj6VvsSx34TR0w?=
 =?iso-8859-1?Q?TIWHXvXwXVhxaVNSCpj6asB+o5WxHZOCmYULTSRZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5eef8f-1862-4780-2d13-08db1699a848
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 19:02:21.1542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asUvkXGOZsHyrsISoi7ClyU0hQAJtU6Lc1pssa1askFdn5Ir2zrIOaCwvmFYaW4KWE3av3rtwoxfwSsSuGr+8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR21MB2000

-----Original Message-----
From: AMD-SEV-SNP <amd-sev-snp-bounces+jlange=3Dmicrosoft.com@lists.suse.co=
m> On Behalf Of J=F6rg R=F6del
Sent: Friday, February 24, 2023 6:15 AM

> The question here is, can we reliably detect within the SVSM that clearin=
g EFER.SVME failed?

If the target VMSA is running, then the attempt by the SVSM to access it wi=
ll generate #NPF since the RMP entry for the running VMSA is modified to a =
locked state while the VMSA is running.  This means that if the SVSM observ=
es that the instruction that clears EFER.SVME retires, then it must have su=
cceeded, and the next time the VMSA is selected to run, it will fail with a=
 non-canonical VM state.

-Jon
