Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B906168
	for <linux-coco@lists.linux.dev>; Fri, 23 Jul 2021 14:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d26CCqCm8Tx5ozdD3ZEXzjgrUutymqtqfCS3gmB5dcr/RxbkIhr4584dpE+ej2/Yv7S42q20BRunMWPNcJqdAEur5zz4IBoe8gboq7KUTKHoROx0V9JJ4LWCB+q4CcXjQPxt9lp35QKWPGo76BM8Zanz3jJnxnKqb2vskvajQSSaMkak3bhtlQwlW2V3zPEf3xKcKwMGPi4aCNBzDX/jKsbO7SjAppVQF1uyBkdZ3gg93+A+gvzmESXkU7m+tSBAOacaZBugMRwo+PgACPx1OWIhGFZpnoUi1FO/QP/mGOah9DBsDHiyM2mbg4wuiHCHzLwJRo6OYsiyU1UwHxQlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3pALD4OrTP7QQD6lcIrUV1SRU/HX8LF86ybqR1eoG0=;
 b=BqCogDxYyxs2/RPIjfUn5+975bcnK2hgRhCXq5Kqn4lxWgB306YueKhJKa1i0hAwm9IlXz1G8m0bumPHHZWKpHX99msCcmyes0jt1V6YjIRcwMt2Xcmme7Mubu3f/aHdBzIaT1mRQTiZXQoFcGKSmU6a4f5ygnt8H31GCAg6qY0dC/T7/N8DwJ9vZvRGHs2AMLC4XOd430SEdUo8dHlRsE7qA3BiuH4xzKvXrlIw90TLf6n9ifCbJBiI0iO1joyLROoQYWmgryY80gLw38k/Yvcpu4NKoA5zeIWp30knB0FuE882uJNHtF7itxONi/kG9okqTwPxEwLAM1K47kkwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3pALD4OrTP7QQD6lcIrUV1SRU/HX8LF86ybqR1eoG0=;
 b=dZvQ5Uww+nzrE2EJtdiDMnifDRTLQSr6EPvOzUphjc7ehdw/vjHoDk4rbrpeKBueANjuexwzPIFNfeCCJY36xrOmEwHYM7aI/MUARJoPel3MUGaZcEN24v8BX+QAF1xOIgSLM4bpO9q2weLdYWvbWXYKvHr+6kfk7Bvb3XcbB9Y=
Received: from SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 14:34:16 +0000
Received: from SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::8d2c:9d96:8b6:74d1]) by SN6PR12MB2702.namprd12.prod.outlook.com
 ([fe80::8d2c:9d96:8b6:74d1%3]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 14:34:16 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Varad Gautam <varad.gautam@suse.com>, Joerg Roedel <jroedel@suse.de>,
	David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>, Andy
 Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill
 A. Shutemov" <kirill.shutemov@linux.intel.com>, Andi Kleen
	<ak@linux.intel.com>, "Singh, Brijesh" <brijesh.singh@amd.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, "Grimm, Jon" <Jon.Grimm@amd.com>, Thomas
 Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Dario Faggioli
	<dfaggioli@suse.com>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Runtime Memory Validation in Intel-TDX and AMD-SNP
Thread-Topic: Runtime Memory Validation in Intel-TDX and AMD-SNP
Thread-Index: AQHXfJ3HXSsBwBRjlEW7DTmcHlUCy6tQa7CAgAA5XqA=
Date: Fri, 23 Jul 2021 14:34:16 +0000
Message-ID:
 <SN6PR12MB27023784EC184DAE713546DA94E59@SN6PR12MB2702.namprd12.prod.outlook.com>
References: <YPV27hDPZUoVsIZt@suse.de>
 <07abb8b7-f25a-6aba-9717-1d1418e2610a@suse.com>
In-Reply-To: <07abb8b7-f25a-6aba-9717-1d1418e2610a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-23T14:34:14Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=c4bc8f67-a861-429e-87c8-5244e7aa61b1;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ac2e37c-c58b-4218-61af-08d94de6f339
x-ms-traffictypediagnostic: SN1PR12MB2495:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <SN1PR12MB24953CA4A41C7CC417368C3D94E59@SN1PR12MB2495.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7A/tyQT7xqjp97M5iM3oi8OADNr+o/KaruXTnun7lbxIb3K7zA3ClzISr06n8fE2Xgf6P8fnV8zgHipX/I7z6gSOd7///YmP0I8V+2Dguxg5ZBiKkZUG1h6lMQmO2VLadknIA0d8ZLwnOnpDW11LXx6cguZ8jipT0vdWhgGznFgIHhaoc8Rsrh/nEx6KJB30vC0BE/MIM5z/aSMAygHH0Wfr4gsmIyK6AIh9J+yVxOrWaijuBgYLc98sPpCgPJ83URtaiz/g+euRKEC8KgZDS9hv27n14TRzlD+NpWdKaqobg0mQgp2N5shxtjLdHuI/sIwN2b/+fxeNgQ+HVLIwJn0pDVFqphCO7J/3OeXZQLKt6ERD+dDQS7bc40q11oBIoVH2TvynDuIanxa+TLEOGsY47Kv1tBYvcATKeEcUk2/PcB2nPr4pA1RV/IWfG5S9lwqgkAeU0MkQjMzwawm+IvfpSPNyB4Z+VnKc5XYXnD1GkthxvTFcTvcMT+/5CoHUG+jQEihK9h6FcWutgt+aWw1Mx/FN3+ddF/XqN2qbJq/UmvNUzhWgeFCcTJETDyOTKVAbbuJtzexxEIRU6FRiexNzDjLSD9r2TELeDJElDP4NkyOTM0JOUCIDPMT8UcsPnxogQuZKL8BkwtL8h7m/dn7V9Enes0o/AFLqHPHrJ+WReyY9Nk8mxLTkJEyajFuCmdSpGN54j1XSJbv7mpJJI0I5/1CxhqcWmjoOYohdXCY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2702.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(38100700002)(5660300002)(52536014)(83380400001)(26005)(2906002)(71200400001)(86362001)(55016002)(7696005)(122000001)(6506007)(33656002)(921005)(53546011)(316002)(8936002)(54906003)(66476007)(76116006)(66946007)(110136005)(66556008)(8676002)(66446008)(64756008)(7416002)(9686003)(478600001)(186003)(4326008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pGrKDviE8etyVjrVUx+rJUmggR1Y76K7aoxrH7JNrdyaCaDXoRIzVZzrGUul?=
 =?us-ascii?Q?F9TIwXn3GVgFYBKlPrw66mn2HvxTB+DN9HWnrIOGRBu9wwMMhLVCSKZNk8yr?=
 =?us-ascii?Q?ZT7sWEXNARgYPJvF+pUyUmbyqt9RrRmUW0O7eUMWGPIYI1/KhNESekxBTeQm?=
 =?us-ascii?Q?ExHAkNQnFy8ZAUEezVeK3ksJI0Pyt6t0wKt/vPy9/Z7ds3ui2sOlkdquMjDy?=
 =?us-ascii?Q?MdeC7BOKIAUPADrCmQ5PZPBvd5hv6oAU0gSnOmJ/QlYx9wYdPXT7jgg9aklk?=
 =?us-ascii?Q?15+oTtbJcMoQS9HChAkFbzu8OmhgTyqvy5aeE8/UOmwZfTN4O9YNOFB1iACY?=
 =?us-ascii?Q?kQcaR2Ijx2RaMOqQcKu37qSoR9/3TZHvmbNWN/KdI7R3eUMK6iFffwPs+1i/?=
 =?us-ascii?Q?BS+8inEBgBTk0Xh7LWwEhwvvXAfST1SjxSMavcj0nyaAklUwEumxaf07dAxY?=
 =?us-ascii?Q?E1C1j2dhD+r4GBZmhQGEfn6+hG4rtnUVacuTHDfDLtxMT2UCCcZZOHKaMRbX?=
 =?us-ascii?Q?Y8bYfJU7NGbldonKPzAs87+IkXcUSVcffy7uGKHHoaCZhioJopcvB+7O7hZt?=
 =?us-ascii?Q?e3lbXfzqgEMMsV1VqxO/oPDT7j/UlQOWoo0/2kFV3El8z0X2F0GUixdQl4B7?=
 =?us-ascii?Q?erdMZtP1PBkaMl1GXTOfZW44kVhdmgjEnbKpUUF/nsfxftaQPMJrBAz03S3h?=
 =?us-ascii?Q?ROq3D/i2b4NvpKC5z89Y5x6HoM+eQpo+7BEtv6lRIv7a+2ThmMLmUKm/8dwB?=
 =?us-ascii?Q?rMIXda6OeaL2avqjOljrkXayf08PIH0o6QGfR7oqrFMN5FyeyndWXDtPMdBk?=
 =?us-ascii?Q?bmNr3jtVb5mS0YkrK3PFInu/s/voIwUdo2F3mHP7P39STI4ln9vMyt+pCOs0?=
 =?us-ascii?Q?GTiBJ5H8tnGy7A+xL27bPODD5UoSqNDjC++ZKkH7Ec2scKFuyWgXgaKeJhga?=
 =?us-ascii?Q?MfhuVEPLxKQAcr4W79TMaUVei4ITfziYGqHQ6wN9mblVIw/LYto9tqWH/f0a?=
 =?us-ascii?Q?G1GzALtdMNa1fiidpnB3S2NI72jwSZfiDG2pbsVOQWDEKXiaF5wfaJiv3pv4?=
 =?us-ascii?Q?7mV7qLZ1isHODOAXJeY162fCXufOat2r++EWTr1n6qlJMqamYbvpG1FoAPTr?=
 =?us-ascii?Q?8ONrulfLtuUhd0sw53OScPvaivjH/l6gxAWWbB9vbx5CCPPHbeeLB4DzuGsS?=
 =?us-ascii?Q?ytQquvO+ZlOZpHamcw9GhLVCe5DzDjX+n40PAef0vwVIg75I/I/JYYXFVnWE?=
 =?us-ascii?Q?hSim77KWKaksRizbD0jAruiTxgSra1/aMXWMPXMXLpvQ0w4tkg+ryZVy7MyN?=
 =?us-ascii?Q?MvAqEDJfUZP7JUqGE2U8u0H7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2702.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac2e37c-c58b-4218-61af-08d94de6f339
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 14:34:16.6417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8DD70pSxtRenNnoiUm8ppnNMqPDl81nIihe2Glhh4x8NkoBJXUVB0/GFShWKQTv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495

[AMD Official Use Only]



> -----Original Message-----
> From: Varad Gautam <varad.gautam@suse.com>
> Sent: Friday, July 23, 2021 6:04 AM
> To: Joerg Roedel <jroedel@suse.de>; David Rientjes
> <rientjes@google.com>; Borislav Petkov <bp@alien8.de>; Andy Lutomirski
> <luto@kernel.org>; Sean Christopherson <seanjc@google.com>; Andrew
> Morton <akpm@linux-foundation.org>; Vlastimil Babka <vbabka@suse.cz>;
> Kirill A. Shutemov <kirill.shutemov@linux.intel.com>; Andi Kleen
> <ak@linux.intel.com>; Singh, Brijesh <brijesh.singh@amd.com>; Lendacky,
> Thomas <Thomas.Lendacky@amd.com>; Grimm, Jon
> <Jon.Grimm@amd.com>; Thomas Gleixner <tglx@linutronix.de>; Peter
> Zijlstra <peterz@infradead.org>; Paolo Bonzini <pbonzini@redhat.com>;
> Ingo Molnar <mingo@redhat.com>; Kaplan, David
> <David.Kaplan@amd.com>; Dario Faggioli <dfaggioli@suse.com>
> Cc: x86@kernel.org; linux-mm@kvack.org; linux-coco@lists.linux.dev
> Subject: Re: Runtime Memory Validation in Intel-TDX and AMD-SNP
>=20
> [CAUTION: External Email]
>=20
> On 7/19/21 2:58 PM, Joerg Roedel wrote:
> > Hi,
> >
> > I'd like to get some movement again into the discussion around how to
> > implement runtime memory validation for confidential guests and wrote
> > up some thoughts on it.
> > Below are the results in form of a proposal I put together. Please let
> > me know your thoughts on it and whether it fits everyones requirements.
> >
> > Thanks,
> >
> >       Joerg
> >
> > Proposal for Runtime Memory Validation in Secure Guests on x86
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D
> >
> > This proposal describes a method and protocol for runtime validation
> > of memory in virtualization guests running with Intel Trusted Domain
> > Extensions (Intel-TDX) or AMD Secure Nested Paging (AMD-SNP).
> >
> > AMD-SNP and Intel-TDX use different terms to discuss memory page
> states.
> > In AMD-SNP memory has to be 'validated' while in Intel-TDX is will be
> > 'accepted'. This document uses the term 'validated' for both.
> >
> > Problem Statement
> > -----------------
> >
> > Virtualization guests which run with AMD-SNP or Intel-TDX need to
> > validate their memory before using it. The validation assigns a
> > hardware state to each page which allows the guest to detect when the
> > hypervisor tries to maliciously access or remap a guest-private page.
> > The guest can only access validated pages.
> >
> > There are three ways the guest memory can be validated:
> >
> >       I.   The firmware validates all of guest memory at boot time. Thi=
s
> >            is the simplest method which requires the least changes to
> >            the Linux kernel. But this method is also very slow and
> >            causes unwanted delays in the boot process, as verification
> >            can take several seconds (depending on guest memory size).
> >
> >       II.  The firmware only validates its own memory and memory
> >            validation happens as the memory is used. This significantly
> >            improves the boot time, but needs more intrusive changes to
> >            the Linux kernel and its boot process.
> >
> >
> >       III. Approach I. and II. can be combined. The firmware only
> >            validates the first X MB/GB of guest memory and the rest is
> >            validated on-demand.
> >
> > For method II. and III. the guest needs to track which pages have
> > already been validated to detect hypervisor attacks. This information
> > needs to be carried through the whole boot process.
> >
>=20
> The need for tracking validity within the guest can be eliminated if:
> - the guest has a trusted communication channel with the security
>   processor (PSP in the SNP case), and
> - the security processor has access to the validation state (RMP table fo=
r
>   SNP)
>=20
> The guest kernel (linux or non-linux) can then just ask the security proc=
essor
> for this information when needed, provided the communication ABI exists.
>=20
> I am not familiar with TDX specifics, but for SNP [1], I see that the PSP
> firmware is able to dump the page validation state along with some other
> information into a per-page metadata entry on the SNP_PAGE_SWAP_OUT
> ABI call. This leads me to conclude that the PSP has access to the RMP ta=
ble,
> in which case it can probably be made to export the RMP state for a given
> guest in a cleaner layout (eg, a guest 'GET_VALIDATION_TABLE' call)?
>=20

This is not supported currently in the SNP ABI and I would not recommend th=
is path.  The guest to PSP communication is slow and in order for the PSP t=
o gather this information it would have to scan the entire RMP table which =
can be gigabytes in size.  So I don't really see this being workable perfor=
mance-wise, instead I believe the guest needs to track validation status it=
self in some way.

--David Kaplan
