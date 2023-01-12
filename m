Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88B0361
	for <linux-coco@lists.linux.dev>; Thu, 12 Jan 2023 01:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvZpD0779yKZ3DNbt6FgUd91Cq9bKzoq+W35jqJ463E0nv/rKvzQE5z2rbvqen2kpIgkH3nxQfHB1dL7Pgl6kUx7O6n0ZvuscZArJw7JWSrW2RzbC5mfKgOTEVvBYg7vTYtCzgvNOyig+sT8YiWhxY9HlT2vc2d5k4WAq0zuS1qzEPSJ/fEY3t5CfWL1jHAyXkTQFA+Fn2tw16hJ5Z7gjlGykoYPhrVaFQ8h3gP5LdrZTrxxYxtU4Jk5VyBnEE0e+IpAXaf6qTo+Z4Ob2V5gpnonJMnpRGMyDz7FQyh0KplPkpTk1n/+vZc4syxuoVIeDWzGpDPxsBvKm4DOQmX9TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/A9JRQ4mTxrZa/0UgPsIOt2jrlID3bOqhEws9G9cvI=;
 b=TJJUsaGihw/JCRIZlJwTUi7zwa6nDlpGIzRTEXPaTTtk70BwOuWhrgC70+rKPGslw2ocfHwBkwI3FQJ3JtVRhvQwy8Z7tZHtT7M9zjunfLrroTDjbr/iw/+4z6QV66ucl72FKaH3uSQcOGJilHjy4R26wrrIQJbtl14Tm4DBXMJiEEIEKSXudzeYUA0Ft41As4pWQsydNzl+9icJdkHbYWQWsXa7HcxU6bJo2t4sGrxG4+KOR9fpDYs0XUGV+NHqvFjqnlwyvw5uFao82+WLRM0X5Rgqbe/9xE721ZsS83xllBwPQmVIJALtJD/lqWs7qDqQZMjGbwniJfuu8nXuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/A9JRQ4mTxrZa/0UgPsIOt2jrlID3bOqhEws9G9cvI=;
 b=UoFCuPCl2DTiP4FcM7g4eSQhSWxNg+Ao/bjmuXMFQn4hFy1HLbEcKNcEXlFTWTlBG0xxymCJ5WFDiW20m373NjgQpUigvgQQq2ouctfAWIxm1RJUPYBsxWlUriODc5VBRcRPAvImUmBY42cmy18/OuWgxfBhJrhTk4vEygYJNhE=
Received: from LV2PR21MB3084.namprd21.prod.outlook.com (2603:10b6:408:17e::21)
 by DS7PR21MB3454.namprd21.prod.outlook.com (2603:10b6:8:91::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.4; Thu, 12 Jan 2023 01:27:47 +0000
Received: from LV2PR21MB3084.namprd21.prod.outlook.com
 ([fe80::7f4e:1ad6:9cca:5d53]) by LV2PR21MB3084.namprd21.prod.outlook.com
 ([fe80::7f4e:1ad6:9cca:5d53%7]) with mapi id 15.20.5986.007; Thu, 12 Jan 2023
 01:27:46 +0000
From: Jon Lange <jlange@microsoft.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Christophe de Dinechin
	<dinechin@redhat.com>, James Bottomley <jejb@linux.ibm.com>
CC: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Subject: RE: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Topic: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions
 - v0.60
Thread-Index: AQHZJezi4IWesqFaO0y56EZ4LKjLhK6Z1S+AgAAHgzA=
Date: Thu, 12 Jan 2023 01:27:46 +0000
Message-ID:
 <LV2PR21MB30847B7EA96416A48C8C8CC6CAFD9@LV2PR21MB3084.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <m2tu0wrjv0.fsf@redhat.com> <0f9ff5ac-d62a-b1aa-44c9-cd9de9351267@amd.com>
In-Reply-To: <0f9ff5ac-d62a-b1aa-44c9-cd9de9351267@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d8482c81-c8b9-40d8-a606-a961336bc644;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-11T23:27:30Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR21MB3084:EE_|DS7PR21MB3454:EE_
x-ms-office365-filtering-correlation-id: 3931cb34-06d0-482c-a605-08daf43c35d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wZXLPWYK+0oy3AZ41XV2OaCZl1S6rW+mWe9zx2TDuvIAoyt7lhel3VCoHyUDpL6CSXs7QpSj8LLGTnBlODExvq6sNeYY7gnVl9Y/Bq2IRgkdLN+/bFqgu6br8ogY9iYe0M0wNY4txKpO+PfQ0m5J4IeGFBjBs8jWYlQQO26hemxf5fN2MFLq8LxQddguuFLA0Xd0H4B/03bIEJwe+VKO9eqiP+tEKMDXGWcX34VM+spWKJ0g/l8UJU7oAapg3vfwP+3y/NvZlmOq7zJzj9LApG0ZRjDHd66eus6OfXmZm9J6ZNAmnb64JIEp9PqHDfg4DgpOJDyhv4gDMFFC1Xw5AIH1j8ZGcqxuqqi46b4lNmUfVq/IvVKzGal91wVtQttFmuGWQRblHtUMEvm+46Q5HtrJoTCZKUf5qaArLPsohTU2HLSgrWaqC+RVpPwybsbofhm4P78fy29C4AuR5ce3WcJMaDTaQFgNS7mgnPNhBKyGlVTnmIQT3ZL+/bhonGjadEc6JekNJ3lZ/W6Ow+ZRdhs/LCqySQwAD7ArvVf8pSbK6Oc+I6OkmTmxaB5AZPF9R1zZ0Y5U0qu5CJeDZrkgRKPMetNdUcp6ntx2SW4zYy8RoB8H+d6mUpJv+0fzU6h8s1Itt+BQ2upqzONKPWvhcBaAS9CletDPqN5q3p79XVtN/bEKaLu4OXx+SLfsZsPdeWx5am8sLIkE3fIHJTGHTLzrPZfmVYujkpmR6SAlmO9CdBiNMaau3MnD/6/jg5pAKy1cymEesblWKHxLEAipow==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR21MB3084.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199015)(5660300002)(8936002)(30864003)(52536014)(83380400001)(41300700001)(66574015)(82950400001)(38100700002)(82960400001)(122000001)(38070700005)(2906002)(55016003)(8990500004)(86362001)(186003)(9686003)(10290500003)(6506007)(7696005)(71200400001)(33656002)(316002)(53546011)(54906003)(478600001)(110136005)(64756008)(66446008)(66476007)(8676002)(4326008)(66946007)(66556008)(76116006)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rRZR/g9VmwSJROmIn+AhM3La3XT13KIJCD+tXmPNqkvj7WQZYLMqlDiHcUgi?=
 =?us-ascii?Q?Yt1cEXjTWuSTOv0iDe8dr32Ldy/0YObT7cuAb/drNZWrQlAR7tcxqNr90eny?=
 =?us-ascii?Q?WilukZIyyz0BPSppgV9f6G9RlZGi9/V3BjcON3+mHRsRI4tyUn2p7OLrNdJY?=
 =?us-ascii?Q?alqSHhNiOXezEqhXq0d8KkvZjoBwlhaE7kvkpEnQXITEPDsbPQVfXe9InGWn?=
 =?us-ascii?Q?/Arij6Z9QPQjYYA1OLdTffnT3nRmWr2POzCQ9UyjtYqzo1P8P8KEYhByMKvZ?=
 =?us-ascii?Q?2b8MiGfH+m8L+qYLPSSIOYhBzyEwWzIdz6YDcsjw3/xNkWbQIHH3B0IARsiZ?=
 =?us-ascii?Q?IQD5BmPyrAewXqTn/4GlxjAO7J4rCyEP04LE81brnF/Pe2HXtzglq4Q0wx99?=
 =?us-ascii?Q?qZ1mv6hFPLZs2arpow8b01BbjV8gktALYo7GDYqT+mg3EKgFZzQBUbJY3Jcv?=
 =?us-ascii?Q?IqeeK+r1CghoJEcrq1iqy6Km3vPqa/eDDgD8qp/l6x2PgMZmN2V+36yJCYpX?=
 =?us-ascii?Q?9AbtGpF1EBB+xiTI+K/sSMUqgGVRVL/zrrYERz6X+YHfJRggQvn/q65eYpwQ?=
 =?us-ascii?Q?l23l4YLilNHouGtvxqS8U/bBRuucxRSutu3MHRevBOB8sf3SGrYozlmhIhpL?=
 =?us-ascii?Q?3jDrE9go3dLWBNhK8W5s+dwXdEgJU6dWFW2Pzs4dX3tqEynI8O2LdEV76J8G?=
 =?us-ascii?Q?zMO2fDLtm9Ufs97IrfYUM7L+fGDs69bKPGNbVWxG3+Nji0KSX2/2qBVaF5Ua?=
 =?us-ascii?Q?GzaqV1ErtanZZBUY6nwMzpG2XLfijwqWqymmsdywk9xCvY4GuB9xFmJvp6Jg?=
 =?us-ascii?Q?J+gVnMdJ5oXKAmjkQG90ZLlHpVMS9FuBDhk9eRwVdv2Iau+W6bVr0r67uVid?=
 =?us-ascii?Q?wESPgAbIL3IdAeNXSca9uMCZfIoGO4R18aAUXmZGi/kqqn8nmdNz3Y0QL76W?=
 =?us-ascii?Q?y+gWHwKgQcDvFwRuGZF091vwH8Jsj17WflJ5FavIMGA2HT51HIhUzonqGBeN?=
 =?us-ascii?Q?yRdKoCweckCq4fdpJn+2IJRTwZtmoQAmzwe87JU9S+H7y6dpgpXCsZd5lUbw?=
 =?us-ascii?Q?9LnsypnsHvuTlrJAD3Ff3LHdegSdKUYHLgFZzLu72TLek3Q2w+RQzHkuM6O9?=
 =?us-ascii?Q?i1KwxugyBYoiPefhN4g41sWie3qydIvcFh3m43Rv+U3UTxN5yNQBJkfbokBP?=
 =?us-ascii?Q?0DXaN7gaiS67SUHvGBaIZNxjb0/6eRB5ctB2oFKtd9Zt2n0bXC10iGtCVcXk?=
 =?us-ascii?Q?T0vWbqqpsa6g6X4UZT9x3q1nuM3I09PO4zh+UQylrKpTkJsjS64GRvuFWFJM?=
 =?us-ascii?Q?v6eT39FSJWNf1deIvh8WNjye4MzwLEd+La3NSxkianeEY2dNXl7E6Ajnmmo0?=
 =?us-ascii?Q?FemNUZSVcQJazOaOeB4Kybp2fHq+6xhrmuTEllvZWTI41QG9CDIsXKpMVv1f?=
 =?us-ascii?Q?zec16Sf2+Wwcb1EXCkqEvnPAk8RZgJGaDVm2VVGOLCmsfxfvJt6ltO6VUibE?=
 =?us-ascii?Q?73LmyGe77CbvXSdKx/cs5u9d9H0eCRzO+2eEcLGnIWd/Cp9eGHvZFwGz+buD?=
 =?us-ascii?Q?YNEUaQhfBz0AKxGzURqXr1lb5++yFFPH106KW1AwEMzx609E5VwILlDjNR6q?=
 =?us-ascii?Q?khMDZMUjlcY45H0S3E6q7LyZyFFMOBJbqlEWPxOJ8t0j?=
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
X-MS-Exchange-CrossTenant-AuthSource: LV2PR21MB3084.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3931cb34-06d0-482c-a605-08daf43c35d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 01:27:46.4155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqJsT+vJoPwcR9QBZy+rc4LkY6l9qTnMoYW96rvbUg9dvefrEZd4Mauu4cSaUmQXRgU8aqg8xXbvlJVvmq4jPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3454

> p16: Alignment for RCX is 8 bytes, but alignment for RDX in
>       SVSM_CORE_CREATE_VCPU is 4K. Is that not the same calling area?

This is an inconsistency in the spec.  The first draft defined the calling =
area as 8-byte aligned but was redefined as 4k aligned after discussion abo=
ut using the calling page as a parameter page.  The 4k change was made on p=
age 13 but not here.  Tom, can you fix that, and can you look for other sim=
ilar places I forgot to clean up before handing the spec off to you?

>       Also, what is the use case for moving the calling area?

It's about flexibility for OS memory management.  The calling area for the =
BSP is configured by the SVSM using whatever gPA it chooses.  That could be=
 in the middle of EFI code or data, or some other random place.  By the tim=
e the OS has exited boot services and has started managing memory, it may f=
ind that that calling page is a fixed island in a sea of memory that it wou=
ld rather use for something else.  Perhaps the OS wants to make sure that t=
he calling pages for all vCPUs are contiguous to minimize the fragmentation=
 of physical memory.  Best to give the OS a mechanism to relocate the calli=
ng page wherever it wants for maximum control of memory.

> p18: As indicated earlier, I'm confused by the 4K alginment requirement f=
or
>       RDX (Calling Area gPA)

This is consistent with p13.

> p20: Evidently, SVSM_CORE_DEPOSIT_MEM is intended to be used when another
>       service returns 0x4mmm_mmmm. However, in the presence of a flag
>       indicating "I may no longer need this memory", and given the
>       limitations "cannot cross a page", I am concerned about possible la=
ck
>       of forward progress if two vCPUs start parallel operations where on=
e
>       vCPU says "Hey, I need X terabytes of RAM to do that" (which will t=
hen
>       be split into umteen DEPOSIT_MEM calls due to page limit), while
>       another says "Hey guys, I'm done" and sets the MEM_AVAILABLE flag. =
I
>       see nothing in the spec that would prevent the second CPU from acti=
vely
>       withdrawing the memory that the first one is trying to deposit. I t=
hink
>       that the spec should clarify a forward-progress logic that prevents
>       that from happening.

The expectation is that the OS is smart enough to solve this on its own.  I=
t is certainly the case that the SVSM is designed to be stateless with resp=
ect to the core protocol elements, and not to make assumptions about how th=
e OS intends to behave.  If the SVSM knows that it has memory to spare, it =
should be free to signal that to the OS for the OS to process as it chooses=
.  It would be pretty simple for the OS to have a gate that counts the numb=
er of SVSM operations that are underway at one time so that any one vCPU ca=
n avoid returning memory if there is a chance that other vCPUs may end up n=
eeding it.  This is best solved using conventions in the OS instead of craf=
ting a delicate multi-threading protocol that the SVSM has to use to signal=
 and arbitrate cross-vCPU contention.

It wouldn't hurt to make this more clear in the spec, for sure.

> p20: It would be interesting to have at least a vague idea of what
>       operations can actually request more memory, just to set expectatio=
ns.

This depends on the architecture of the SVSM.  It may be the case that the =
SVSM has to allocate a bunch of internal data structures per vCPU in order =
to manage whatever state is required to do whatever it's going to do, and i=
n that case we would expect CREATE_VCPU to require memory.  Of course, this=
 may not be required of all SVSM implementations.  It could be the case tha=
t the vTPM requires a bunch of memory but the SVSM doesn't reserve that mem=
ory because it doesn't want to waste memory if the vTPM is never used - in =
this case we would expect the first call with the vTPM protocol to request =
memory to instantiate the vTPM data structures.  It could be that the SVSM =
wants to maintain a sparse array of validated memory state and therefore ev=
ery PVALIDATE request has to touch that array, which may require additional=
 memory to materialize a new page of the sparse array upon first access - a=
nd in that case the PVALIDATE request may request more memory.  It's good t=
o be prepared for additional memory demands for everything if possible.

> p20: Suppose that CREATE_VCPU requests more memory. It has no obvious
>       "restart" field, unlike things like PVALIDATE. That means that ther=
e
>       should be a rather strong guarantee that all SVSM calls that can
>       potentially return 0x4mmm_mmmm either have no effect when they retu=
rn
>       such a request, or are idempotent if called again after providing m=
ore
>       memory.

There is absolutely an expectation that each call can either describe the p=
rogress that has been made (like PVALIDATE) or else it must be idempotent. =
 I agree that this needs to be explicitly called out in the spec.  Tom, can=
 you find a place to include this language?

> p21: The MEM_AVAILABLE flag is set in the calling area of the startup vCP=
U.
>       Is there any requirement that WITHDRAW_MEM should only be called fr=
om
>       the startup vCPU, or from only one vCPU at a time?

There is no such constraint in the specification.  The SVSM is expected to =
serialize multiple simultaneous WITHDRAW_MEM calls to ensure that the same =
page doesn't show up in multiple withdrawn lists due to some race condition=
.  From the point of view of the calling OS, if multiple vCPUs make simulta=
neous calls to WITHDRAW_MEM, then the lists observed by each of them should=
 be disjoint and consistent, so that each vCPU can return those pages to th=
e local free pool correctly.

> p22: The writable area ends at a page boundary. What could be a vald
>       rationale for setting the RCX pointer in the middle of a page?
>       Maybe simpler to require that the pointer be page-aligned than have=
 a
>       spec that mentions page offset 0xFF8 as a special case...

The rationale is to permit the parameters to inhabit the same page as the c=
alling area - this reduces the amount of memory that the vCPU has to dedica=
te to an operation that is underway.  In this case, RCX would have a byte o=
ffset of +008 (just past the end of the calling area).  There is nothing ma=
gic about the +FF8 value here other than to serve as an illustration of the=
 example of an invalid call which leaves enough room in a page for the call=
 header but no room for any of the array elements.

> p22: Rationale for not returning incomplete? I'm trying to see how the=20
guest
>       could efficiently let secondary vCPUs withdraw memory with the prot=
ocol
>       as specified, without a little additional wording regarding either =
the
>       memory semantics of the MEM_AVAILABLE flag, and telling if there is
>       indeed more work to be done by this vCPU using SVSM_ERR_INCOMPLETE.

The MEM_AVAILABLE flag in each vCPU's calling area is effectively equivalen=
t to indicating that the withdrawal operation is incomplete.  The SVSM sets=
 that flag upon the completion of every call to indicate whether memory was=
 available for withdrawal at the completion of that last call.  If any vCPU=
 observes MEM_AVAILABLE, then it can kick off a loop across as many vCPUs a=
s it wants where each vCPU will call WITHDRAW_MEM (do-style and not while-s=
tyle) until either a failure occurs or until the local MEM_AVAILABLE is cle=
ared.  It doesn't matter if one vCPU finishes due to MEM_AVAILABLE while th=
e others are still going; if one of the others observes MEM_AVAILABLE and a=
ttempts withdrawal after there is nothing left to withdraw, that call will =
just complete with an empty page list and will clear the local MEM_AVAILABL=
E to signal completion of the withdrawal process.  Defining SVSM_ERR_INCOMP=
LETE as a valid error code here doesn't change any of this logic; it only c=
hanges what the local vCPU checks (error code vs. local flag) to determine =
whether there is more work to do at the time it makes that check.

-Jon

-----Original Message-----
From: Tom Lendacky <thomas.lendacky@amd.com>=20
Sent: Wednesday, January 11, 2023 3:01 PM
To: Christophe de Dinechin <dinechin@redhat.com>; Jon Lange <jlange@microso=
ft.com>; James Bottomley <jejb@linux.ibm.com>
Cc: linux-coco@lists.linux.dev; amd-sev-snp@lists.suse.com
Subject: [EXTERNAL] Re: SVSM Attestation and vTPM specification additions -=
 v0.60

Adding @Jon Lange and @James Bottomley on the To: line.

@Jon Lange, please search for your name to answer some questions below.
@James Bottomley, ditto.

On 1/11/23 10:39, Christophe de Dinechin wrote:
> Hi Tom,
>=20
>=20
> On 2023-01-10 at 12:54 -06, Tom Lendacky <thomas.lendacky@amd.com> wrote.=
..
>> Attached is an updated draft version of the SVSM specification with=20
>> added support for an attestation protocol and a vTPM protocol as well=20
>> as other miscellaneous changes (all identified by change bar). Please=20
>> take a look and reply with any feedback you may have.
>>
>> Thanks,
>> Tom
>=20
> Thanks for sharing.
>=20
> This is the first time I actually review that document, so my feedback=20
> will be a bit longer than most. Also, I read it at a time where I had=20
> lost network access to Internet, so RTFM wasn't an option...
>=20
> First, the actual errors:
> p9: Typo VMLP1+ instead of VMPL1+

Fixed

> p18: "bit1=3D0" and "bit1=3D1": That seems to be bit 2

Fixed

>=20
> Then the more mundane comments
>=20
> p9: "expected that, but not limited to": the wording sounds strange to=20
> me

Ok, I'll work on re-wording this.

> p9: Undefined acronym (*) VMSA

Fixed

>=20
> p10: "certain forms of RMPADJUST": The body of the document seems to
>       indicate that the required RMPADJUST are performed as part of the
>       various other services. There is no explicit need (apparently) for =
a
>       separate guest-accessible RMPADJUST. Maybe expand a little bit on t=
his
>       topic, and explain if the guest is supposed to do any RMPADJUST if
>       running at VMPL1.

RMPADJUST can be performed when not running at VMPL0, but only RMPADJUST ex=
ecuted at VMPL0 is allowed to turn a page into a VMSA page. I'll re-word th=
is.

> p10: gPA space of the guest: "of the guest" seems redundant, since=20
> it's gPAs

Fixed

> p10: lower VMPL -> less privileged VMPL, or explain that "lower" privileg=
e
>       levels have a higher number.

Fixed

> p10: "The initial SVSM memory configuration...": Unclear what "required"
>       means in that sentence. Is that the core protocol? Can "create VCPU=
"
>       request additional memory, for example?

I'll work on clarifying that.

>=20
> p11: No explanation of how the SVSM knows where the secrets page is.
>       Probably need an xref to some other doc.

That is implemenation specific. For example, in the Linux SVSM prototype, t=
he address of where to place the secrets page is communicated to the hyperv=
isor via a GUID structure at the end of the SVSM binary. Other implementati=
ons may have a different method.

> p11: Who does the initial construction of the secrets page? What happens =
if
>       that other actor does not write zeroes? What attacks can the host
>       perform on the secrets page if any?

The SEV firmware constructs the secrets page directly in guest memory.=20
Standard SNP practices regarding memory usage and access within the guest a=
pply.

> p11: undefined acronym VMPCK

Fixed

> p11: Why should the guest OS "capture" the SVSM_CAA value? In what sense?
>       Is it because it can change afterwards, or because the secrets page
>       becomes unavailable, or for another reason?

I'll reword this, but it basically means that the OS is expected to use tha=
t value (unless it changes it) for the BSP. The OS is free to do what it wa=
nts with the memory where the secrets page is located.

> p11: Byte offset in secrets page fields starts at 0x140. Explain why this=
 is
>       safe, and how other possible users of the secrets page would avoid
>       stomping on that area.

Hmmm... what other users? The SNP spec defines the area as reserved for gue=
st usage (intended for use by the SVSM, but not explicitly stated). The SVS=
M specifies how it uses it and identifies itself to the guest OS. If the gu=
est OS wants to trash it later, it can do that, but it should save off any =
information it needs.

In the Linux SVSM prototype, the secrets page created by the SEV firmware l=
ives in the SVSM memory. The SVSM locates where the OVMF secrets page is su=
pposed to live and copies the secret page to that location, modifies it and=
 then begins OVMF exececution. So the OS is using a different secrets page =
than the SVSM.

>=20
> p12: How does the SVSM "terminate"? Is it a regular guest shutdown, or so=
me
>       other mechanism, or is unspecified? Can the SVSM log anything, and =
if
>       so, where would it be found? (I assume that would be host platform
>       specific, but would still be noteworthy in this specification)

As it is implementation dependent, I'd rather not put that type of informat=
ion in the specification.

In the current Linux SVSM prototype, regular guest shutdown terminates the =
SVSM and the it logs to a fixed serial port.

>=20
> p13: "Use of the Calling Area is necessary..." effectively, this is a sin=
gle
>       byte in the calling area, right? So it's not really "ensuring", may=
be
>       "detect" spurious invokation (1). I think malicious invokations are=
 not
>       made too difficult by this mechanism, since there are only two stat=
es,
>       and the host still controls when vCPUs run.

I can change ensure to detect.

>=20
> p14: Undefined acronyms: GHCB, MSR

Fixed


> p14: I think GHCB Specification is an external reference, worthy having
>       italics and a precise reference / link (can't check, no network=20
> ATM)

Fixed

> p14: "If the host illegally entered the SVSM, this field will be zero": I
>       believe that the conditions enforcing this should be precisely spel=
led
>       out, including for a host with malicious intent. If the mechanism i=
s
>       indeed robust, then we are not protecting against "spurious" calls =
but
>       against "spurious or malicious" calls. Otherwise, "will be zero" sh=
ould
>       be replaced by "should normally be zero".

Standard SNP practices are to be applied here. The field will be zero, as t=
he only way it can be non-zero is from the guest setting the value or the h=
ost taking ownership of the CAA page and changing it. However, the act of t=
he hypervisor taking ownership of the page will result in a #VC in the gues=
t when attempting to access the page. At which point the guest knows that t=
he host is being malicious and should terminate.

> p14: "only after VMSA.RAX and SVSM_CALL_PENDING": this suggests that ther=
e
>       is some kind of possible race condition here. If that is true, then
>       maybe there is a need to specify memory ordering semantics on the t=
hree
>       relevant fields?

The race is that once VMSA.EFER.SVME is set to 1, the guest VMSA can be use=
d on a VMRUN instruction. So all updates to the guest VMSA contents must be=
 performed before making the VMSA runnable, again.

>=20
> p16: PVALIDATE: What happens if a guest is unaware of SVSM and executes
>       PVALIDATE directly? Is the SVSM supposed to emulate that, or to pun=
ish
>       the guest, or something else? Is that even possible for the SVSM to
>       trap and emulate relevant VMPL1 instructions? Also see note on page=
 10
>       regarding RMPADJUST.

If the guest is unaware of the SVSM (meaning it is running at VMPL1, for ex=
ample, but doesn't know it), the PVALIDATE will fail with a #GP and the gue=
st will crash. The current upstream Linux implementation checks to ensure i=
t is running at VMPL0 or else terminates.

> p16: "It affects the Calling Area for calling vCPU only": This seems slig=
hly
>       inconsistent with page 9 "other SVSM implementations may choose a
>       single execution context that services all guest VCPUs".

Not really. It is used to identify the calling vCPU and thus the VMSA that =
contains the call information. So, even if a single execution context is be=
ing used, the SVSM still needs to have a unique calling area for each vCPU =
in the guest.

> p16: Alignment for RCX is 8 bytes, but alignment for RDX in
>       SVSM_CORE_CREATE_VCPU is 4K. Is that not the same calling area?
>       Also, what is the use case for moving the calling area?

As the original author, maybe @Jon Lange can explain these requirements.

>=20
> p17: The table links appear in a strange colour (some kind of weird cyan)=
.
>       It seems clickable too, so I suspect a hyperlink, but since the lin=
k is
>       always on the same page, it's not super-useful.

I can remove that.

>=20
> p18: Is the CAA seen as assigned to the SVSM? I believe the answer is=20
> no

Correct, it is not.

> p18: For increased readability, I suggest naming the error codes for the
>       SVSM_CORE_PVALIDATE call, and putting them in a table.
>       Also, why tag the specific errors right after the architectural
>       PVALIDATE errors? In case of architectural extension, you'd always =
get
>       0x8000_1011, which is not super helpful. Instead, you could reserve
>       0x8000_1xxx for protocol errors, and put PVALIDATE errors at
>       0x9nnn_nnnn, which probably gives you enough room at least for the
>       coming 6 months.

I'll look into this, no promises, though :)

> p18: "VMPL of the VCPU making the request": wouldn't it make sense to add=
 a
>       VMPL field in the PVALIDATE operation descriptor, so that the guest
>       could control less-privileged VMPLs?

After the PVALIDATE, the guest can use the RMPADJUST instruction for adjust=
ing page permissions for less-privileged VMPLs.

> p18: As indicated earlier, I'm confused by the 4K alginment requirement f=
or
>       RDX (Calling Area gPA)

Lets wait for the response from @Jon Lange.

> p18: What is the APIC ID of the vCPU used for? I see no mention in the
>       explanatory text. Is that an internal index, or does the SVSM
>       implementation need it for some reason (I was not clever enough to
>       imagine why)

It's needed to ensure we are using the correct VMSA and CAA for a specific =
vCPU. Since the BSP creates all of the OS APs, were it to not supply the AP=
IC ID when calling the CREATE_VCPU call, the SVSM would not have a way to a=
ssociate the VMSA and CAA being created with a vCPU.

>=20
> p19: What specification defines FAIL_INUSE? Add xref?

That's the FAIL_INUSE error code, 3, of the RMPUPDATE instruction. The=20
PSMASH, PVALIDATE and RMPADJUST instructions share the same return codes,=20
where applicable.

>=20
> p20: Evidently, SVSM_CORE_DEPOSIT_MEM is intended to be used when another
>       service returns 0x4mmm_mmmm. However, in the presence of a flag
>       indicating "I may no longer need this memory", and given the
>       limitations "cannot cross a page", I am concerned about possible la=
ck
>       of forward progress if two vCPUs start parallel operations where on=
e
>       vCPU says "Hey, I need X terabytes of RAM to do that" (which will t=
hen
>       be split into umteen DEPOSIT_MEM calls due to page limit), while
>       another says "Hey guys, I'm done" and sets the MEM_AVAILABLE flag. =
I
>       see nothing in the spec that would prevent the second CPU from acti=
vely
>       withdrawing the memory that the first one is trying to deposit. I t=
hink
>       that the spec should clarify a forward-progress logic that prevents
>       that from happening.
> p20: It would be interesting to have at least a vague idea of what
>       operations can actually request more memory, just to set expectatio=
ns.
> p20: Suppose that CREATE_VCPU requests more memory. It has no obvious
>       "restart" field, unlike things like PVALIDATE. That means that ther=
e
>       should be a rather strong guarantee that all SVSM calls that can
>       potentially return 0x4mmm_mmmm either have no effect when they retu=
rn
>       such a request, or are idempotent if called again after providing m=
ore
>       memory.
>=20
> p21: The MEM_AVAILABLE flag is set in the calling area of the startup vCP=
U.
>       Is there any requirement that WITHDRAW_MEM should only be called fr=
om
>       the startup vCPU, or from only one vCPU at a time?
>=20
> p22: The writable area ends at a page boundary. What could be a vald
>       rationale for setting the RCX pointer in the middle of a page?
>       Maybe simpler to require that the pointer be page-aligned than have=
 a
>       spec that mentions page offset 0xFF8 as a special case... > p22: Ra=
tionale for not returning incomplete? I'm trying to see how the=20
guest
>       could efficiently let secondary vCPUs withdraw memory with the prot=
ocol
>       as specified, without a little additional wording regarding either =
the
>       memory semantics of the MEM_AVAILABLE flag, and telling if there is
>       indeed more work to be done by this vCPU using SVSM_ERR_INCOMPLETE.

Let's see what @Jon Lange's view on the p20 - p22 comments.

>=20
> p23: Table 9 is mnissing RDX, R8 and R9 rows (as input for configuration)
> p23: Table 9 title should be "configuration or query"
> p23: RCX result is the same for query and configuration, or is that for
>       query only?

I'll update the table to make everything more clear.

> p23: At the specified RIP. If Bit 3 is not set in the configuration case,
>       does it return after the VMGEXIT?

Yes, it will return to the current value of RIP in the VMSA.

>=20
> p29: Table 14: How can RAX be used as command ordinal and command respons=
e
>       size if it's already used for call identifier / result value?

Typo, that should have been 0x000 (since the column is Byte Offset).

>=20
> p30: Why would you need 4 bytes for the TPM command ordinal? This causes =
the
>       TPM command size to be misaligned. What about 2 bytes for command
>       ordinal, one byte for locality, and one reserved byte?

This is following the MS simulator protocol for the TPM 2.0 reference=20
implementation as proposed by @James Bottomley. He also submitted an RFC=20
TPM platform driver implementation to the linux-coco list following this=20
protocol. It would be best to involve him in the discussion.

>=20
>=20
> (*) Like most readers of this document, I know what it means, but since y=
ou
> defined VMM just above, or VM the page before, I interpreted your intent =
to
> be that every acronym should be defined on first use.
>=20
> (1) As I am writing this, I have a doubt what happens if the host writes =
to
>      the secrets page, and can't verify easily without a network.

The host can't write to the secrets page without first performing an=20
RMPUPDATE to make it a hypervisor page. If it then were to modify the page=
=20
and then re-assign it to the guest, the guest would receive a #VC when=20
accessing the page because it is no longer validated, allowing the guest=20
to detect the condition and terminate.

Thanks for the feedback!

Tom

>=20
>>
>> [2. application/pdf; 58019-Secure_VM_Service_Module_Specification.pdf]..=
.
>=20
>=20
> --
> Cheers,
> Christophe de Dinechin (https://nam06.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fc3d.github.io%2F&data=3D05%7C01%7Cjlange%40microsoft.com=
%7Cd9d72740aee74b848eb208daf427aa92%7C72f988bf86f141af91ab2d7cd011db47%7C1%=
7C0%7C638090748477137485%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2BO71GzOC=
iSNlnO5gC5QOGOBmOH9IK4vJZA9k06RTNwo%3D&reserved=3D0)
> Theory of Incomplete Measurements (https://nam06.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fc3d.github.io%2FTIM&data=3D05%7C01%7Cjlange%4=
0microsoft.com%7Cd9d72740aee74b848eb208daf427aa92%7C72f988bf86f141af91ab2d7=
cd011db47%7C1%7C0%7C638090748477137485%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3Dghf1u8FdX9WtlfFjYaax07awau35J963AQrPASZenZw%3D&reserved=3D0)
>=20
