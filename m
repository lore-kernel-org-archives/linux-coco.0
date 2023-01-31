Received: from BN6PR00CU002-vft-obe.outbound.protection.outlook.com (mail-eastus2azon11021024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD430640
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 04:44:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYJ5Bl1O0RMAXbOITjupBkVF0P+dU3yug44ZmNdUtInYONjD64t5iUSERJTpQUEY8uRq2h3qX4fhaiMGfYNSV7VJ3F5idrm7d0p4yjzyaMp//QWOCUdgUR0dMMmZgIp+EJv4S81F2n6AwNgSycpZEcRZ5nRRe/bOnYddUqOllvnMwf++QQ+84iTpI/RluL3Wf86UK11e0mweLH7pHN27r59bXClZJ90At1rxPRK99Xc8UyX7OUBQqZ9KuRHQ2YagMnJY+a7svpfR0Vox7eUomcltPj+i3hYfEPbK/m4zDmGqyWHAvKl721NqP7asZqPTlPj8A6m7vbpMfgaRkkK9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AbbL6kiQMSle7pYuNSJlLxPNw3mN5TiFsrQoOyQ4Kw=;
 b=bvFh4BhgvH3PEY+X2/25+qmwr52w9q74h5naz4gX10oJVapSFMfJm57HuRK2b59Gccpl0WQ/cn+8RGM4Iq4znSMP9i0wv+SDB63g5sGyMUZO0wHf2UZTwV04KMsKQY1hmviJhnE0mn6vd736JR6+VnrGAM4dE64RGhox+Kode06KDUokBUg8oU5Fq+5kCeD1KSweSsCXTIdNnepnF7VY8nUEBXFjm0b+GsbQWbZDSfG29eTC+cTpZPOhkr75ok/TuJvNygkKI64cYZmkj71zSqBfYwE/7jybep1CbgWYy8U+2++sHhxADvPScX+PMVbCd7Gc3rUh4Alxf6aooIFBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AbbL6kiQMSle7pYuNSJlLxPNw3mN5TiFsrQoOyQ4Kw=;
 b=gMW1e39vw8Kqp65AYTafAwYNEVV7t8MyRXw4Nqsjp8niBjbqvwbOaDtzURll0obshjAENs3Hjcxx2Qal5Oo/GdRMZXD0IRztrG5aGzZ8tV8yg8r0/L1lH009d+27QkDgF1ldhqOBNUqwThK/t9fN3zdVGOwdQVa9A9UoDVdsl9w=
Received: from MN0PR21MB3072.namprd21.prod.outlook.com (2603:10b6:208:370::21)
 by DS7PR21MB3719.namprd21.prod.outlook.com (2603:10b6:8:92::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.7; Tue, 31 Jan 2023 04:44:10 +0000
Received: from MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d]) by MN0PR21MB3072.namprd21.prod.outlook.com
 ([fe80::f653:3340:30d1:646d%5]) with mapi id 15.20.6064.007; Tue, 31 Jan 2023
 04:44:10 +0000
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
Thread-Index:
 AQHZL9idL/cAC39M7EuN4gPMmRZpBa6wy6aAgAAg3wCAAAs9cIAA/RAAgAB5gACABG4igIABHd/A
Date: Tue, 31 Jan 2023 04:44:10 +0000
Message-ID:
 <MN0PR21MB3072B127F1B0D6E0F73DF37ACAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9eqB5/1YcZeIHqG@suse.de>
In-Reply-To: <Y9eqB5/1YcZeIHqG@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=0b9cf25d-51cd-4351-a1fa-2c551ade4943;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-01-31T04:32:21Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR21MB3072:EE_|DS7PR21MB3719:EE_
x-ms-office365-filtering-correlation-id: 361b4c13-4d2a-44eb-f3c0-08db0345cb5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LJLyKoMjBJNbOvkGfs1n5SC/D9+M7CsXaEvSnjJU3l+SWb4S+ChzSz3JXUOlH8FBMMr0Rljqn/z3cfrVtHO3tlDHK7SnVIezg8xyPjyomiJ/n6vgcJvNx4TCGX5EEvNa3BKosFaMAgk0P+Y7EP6EAkjtl83cVAAmToG5OSZWknuFnhMJfm0IUC9V5N7Hg+pO4H2rRIe2ZaWladt/pqW0XbV9c05Fs2THdTR1dY7/iKykF8kD5Q8KmgrEp6Spwerm+7B5dtZcglzEZahLyDwkpbrpP5Tnrq6pHG42tdaU5koNpEd/oMAAAjgzzmEOzMBc0W87bKZsJt7pOKWPWcrJviiJWWG4v4hrBqNWx1n0Vluw/jfXpYopSY+d9znfpaSsT164goqq/oedV6op5sfX+B8KEFb8vsM8jj9ilwzZFb321iswy1xbfSwOWh8ocHo+msMFMPDBk1YHKATVqWhmFpX1CcQbrVaL8D/ES0TQ7rdBpp9TPtyRTCAAU+Uees+13TaliU+GYS95izVSwKd4oWHYQzrdSnmC0HKTXdtQuwqtMsHg7jbz7zfHT+cdethw+e5qYc6lbFR5hUCrrYL6ZA2kQw5VtGFQyPhEOL5cenb/WWKBV4GnpQcbfa/UI7nURSfGT2oLFfU7bKEwqdy0C9DzMyi43Dn1+fcYKOwb1L91eAe95oG/pqfeMYRsfjYUorsqyCBBNedjSIrmgrEBnSanD1RceW+pEr/Q1EtNfpsq8snbSaxNf99AzGJzlr8M
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR21MB3072.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(39860400002)(346002)(451199018)(41300700001)(83380400001)(38100700002)(66446008)(8676002)(8990500004)(64756008)(76116006)(122000001)(66556008)(66476007)(6916009)(4326008)(52536014)(8936002)(82950400001)(2906002)(5660300002)(82960400001)(66946007)(86362001)(71200400001)(478600001)(186003)(6506007)(53546011)(33656002)(7696005)(9686003)(66899018)(66574015)(54906003)(38070700005)(55016003)(316002)(10290500003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?D1AYVFOk2DHvbEgDLHb1MXUiX9sWGKK/mT0pT5j51SiHBhaNMs9i8yk9eK?=
 =?iso-8859-1?Q?EdQKJ0LfmzE+YJ7PgNevtCgc1/8vzca9H9i3G9XvBEBwmDqxhqUEMtHgSH?=
 =?iso-8859-1?Q?6bsRFzFd71ea+l4ORknDqj7TEEfvIUu7k15OBFYVkCQ4ag9EQFKGrf3nWV?=
 =?iso-8859-1?Q?Kk6J2HvO9gIJ3QjKi9AnBw8KitrvaW1E/vAJcDHziOS3Psg9rpNal1DK+1?=
 =?iso-8859-1?Q?I6L3Lp6lmkCNNPH04cWzx4iHke1VV11KLFLF5R5813DSPdDNyfAFpc09TB?=
 =?iso-8859-1?Q?gq8WSQMJCwTVI7M3gyEc95xxU7qeUtI0JupZxZQiUtxdr2GR44vGpW79KH?=
 =?iso-8859-1?Q?cn6vqzUPK3mpdjB1bqaiHzkUgnebKCY+g56dpXc4GPU91m9YrZ+O28s3xr?=
 =?iso-8859-1?Q?qFKyUd4o6sUBmFUa8C5GyaZKpu0ZiN+EKJqQDoh7btBC3ICkXI2QFALswO?=
 =?iso-8859-1?Q?6VI8hGwo/wY4hGEBy1p8XDcc+wqWAy62399TYdCpOuKF4uXA47m0gYq+fM?=
 =?iso-8859-1?Q?7lo4cj5bhmZ49BFRiBBYQZzCsdh0389hv63mcUAi6CWF2xVPUKQoIj9W7g?=
 =?iso-8859-1?Q?7K2Vpga6ouZqroquvSRb/FZve6y8pgOtfqeAcOAahwWP/1+gl7h6erh4Eb?=
 =?iso-8859-1?Q?MvPu/OPbfysXnphnEKDSmTbWGcMIMhom/b8PelSXwPqnFEtqVdaZjhYD1i?=
 =?iso-8859-1?Q?pDqUI86/f4vCREUGft8MFzUYoKL8Z4UROxTOEWFhUq2ltGPwFLTr4YBMxm?=
 =?iso-8859-1?Q?wc3/s1Rr68YWO3beHobIiQ+Nt1xfq8F41Y98L5xrwlGG67QQ5e1gv7zYWr?=
 =?iso-8859-1?Q?5hYL3AjGWBF8cNeJr4c9yAZbHcRVvUCA0yplL9Gvra8afM9fh7jHbRmgrO?=
 =?iso-8859-1?Q?or8b1f8ccWStZTuzxmCvE8KikNvpxGXOI/t+HdgqlSKEwTif/dggIaoQHU?=
 =?iso-8859-1?Q?jnB/97MHvub9t77PgSXAlcLOkuOet5UFTi858tD2dBitHp2mIfNUk71dYg?=
 =?iso-8859-1?Q?gwIg28AeUe3sMiFPaQOWM0+snBk24PX25nyJJyMc91+Xwa1B8cD+7oGzWg?=
 =?iso-8859-1?Q?lpl7dnFtgcJlFn4MgYH7MMEs3puB4bPbRHFtrmV3ixmV/JfzF1AwS9MFDR?=
 =?iso-8859-1?Q?WWlk2Ukd2/LdpZ7pf0eIUelVcCISdiSsQES1/tVciFjNSO7wQ9z889NU6K?=
 =?iso-8859-1?Q?THOEaIYGqyQ6RNj3TICUC7uKgXUAfvotMqoUP2F7NQqdLn3kF5nxkThVLX?=
 =?iso-8859-1?Q?Jg7i6c1laPrL6YaVXEpZJ0dT4xR0iOawJ3/H3vmrBzm8ygk8SwLrHjKQo0?=
 =?iso-8859-1?Q?2qY3keVdvHpJl/JQHF0VF7Kc8Azz3P4BzXHbCO8Km7LjjnzAh0a9OX88I3?=
 =?iso-8859-1?Q?EHI5UeHh/fCKaGUtSvmhm0fEfOQ8GxXDNsgC8nVmNE0NHKyUEzgCauJiYa?=
 =?iso-8859-1?Q?Yd+O/EmPuMUO8FDuoCg7DJzSKD8DhNus/5rDelVNqRruJ9vgH4FiRNbh7I?=
 =?iso-8859-1?Q?TlDhyscHNvBJZVXzPIEgE3DqIfjgM/3d3+Siu3OH5VIeN3jnWslQHDy+A7?=
 =?iso-8859-1?Q?QqURJIFiMS7QTkU8ZTznAAKYfhY+aqVi2woUCg/4so3fcZHiV0FHFZOJTc?=
 =?iso-8859-1?Q?rrz9Vt8vITlxqZ8HyTkTVn0Fy+1QnEfS0Rh+FKc+itCRwdAvgmRmWK+w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 361b4c13-4d2a-44eb-f3c0-08db0345cb5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 04:44:10.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHxq2FI04N6fdMrWEIL6oVVgYjHIi07ZlJdq5BsvvPy1LRgtyay9eMIvGPstOzfbZ47aLHIAuKK0FSScCBxufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR21MB3719

Joerg, I'm encouraged to see that we agree about most of the points related=
 to implementation-specific protocol extensions.  It seems like the places =
where we have yet to come together have less to do with how the standard is=
 defined but about how to approach implementation choices.  That's not real=
ly something that can be legislated into a standard (as you suggest) so we'=
ll just have to trust that the right thing happens.

As far as how to enumerate implementation-specific extensions, why not just=
 embrace the core concept of the protocol's extensibility, which is that in=
dividual protocol numbers are optional?  SVSM implementation 1A could propo=
se protocol number 0x123 is its own extensions, and SVSM implementation X c=
ould propose protocol number 0xABC as its extensions, etc.  This would elim=
inate any need to define any first-class concept of implementation identity=
 (thus eliminating the need for an identity registry) and would also elimin=
ate the question of deciding which commands within a given protocol are imp=
lemented by a given SVSM.  Instead, a guest OS could query for the implemen=
tation protocol it wants, and if it's present, it can use it, and if it is =
absent, it won't.  A given implementation could choose to lump all of its v=
arious implementation-specific extensions into a single protocol, or add a =
different protocol number for every set of extensions (one for logging, a s=
eparate one for other configuration - whatever).  With a 32-bit protocol ID=
 space to choose from, I suspect we don't have to worry too much about runn=
ing out of IDs quickly, as long as we can construct some logical defense fo=
r every separate protocol ID.  And, as a bonus, those individual "implement=
ation-specific" constructs that are easily embraced by another implementati=
on can easily transform into standards without requiring an all-or-nothing =
adoption of an implementation's complete extension set - from your earlier =
comments about prototyping, this seems like one of the extensibility featur=
es you were hoping to achieve.

-Jon

-----Original Message-----
From: J=F6rg R=F6del <jroedel@suse.de>=20
Sent: Monday, January 30, 2023 3:29 AM
To: Jon Lange <jlange@microsoft.com>
Cc: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>; Tom Le=
ndacky <thomas.lendacky@amd.com>; linux-coco@lists.linux.dev; amd-sev-snp@l=
ists.suse.com
Subject: Re: [EXTERNAL] Re: SVSM Attestation and vTPM specification additio=
ns - v0.60

Hi Jon,

On Fri, Jan 27, 2023 at 04:11:57PM +0000, Jon Lange wrote:
> I agree that some amount of implementation-specific SVSM communication
> may be unavoidable, but for the sake of a robust standard, this
> position should be accepted reluctantly rather than being embraced.

I totally agree with that. How about specifying that implementation
specific calls must be designed in a way that allows the guest OS to
treat them as optional. Or in other words, an SVSM must be able to run a
guest OS which does not use implementation specific call at all (and
even doesn't know about them)?

> As long as the crutch of implementation-specific calls is available,
> it will be too easy for contributors to classify new features
> in this way when doing so may be the easy way out.  It would
> be much better if the specification of an
> implementation-specific call were the harder path, so that the
> default option would always be in the direction of
> standardization.

Right, but I think this is hard to achieve. It depends on how the
standardization process works.

> Logging is something that every SVSM implementation will want to be
> able to offer, and so the aspiration should be to design a standard
> log configuration and retrieval calling convention so that log
> management can be done in a consistent manner across all guests and
> across all SVSM implementations.  The reflex to call this
> "implementation-specific" is exactly the sort of deviation from a
> standard that worries me.

On the other side, too much standardization on these matters could lock
down SVSM implementation details to a point that makes it hard to
innovate.

For example, consider these questions about logging alone:

	* Support one log or many?
	* In case of many logs, one per protocol? Or divide it
	  differently? Separate event and error logs?
	* How to enumerate the logs, by protocol number or by a name or
	  even by a GUID?

I think such questions are implementation specific, and it can be even
worse with other possible extensions, like tracing for example.

> Perhaps not every SVSM will want to offer logging, at least not at
> first, and that's fine; those implementations can simply decline to
> offer the logging protocol.  But the key point here is that the set of
> features present in an SVSM should be at the discretion of the
> implementation - and may change over time - and must be discoverable
> in a standard way.

I agree on the discoverability. There should be a standard way to
discover the specific SVSM implementation and the extensions it possibly
offers. The extension remain optional, of course.

> Separately, I struggle to understand how a guest OS is supposed to
> know which SVSM implementation it's running with.  I don't recall a
> proposal to define a call to get the SVSM type, nor a proposal to
> define a registry of SVSM types.  Without such a mechanism, how could
> a guest have any idea which implementation-specific calls are expected
> to succeed?  Again, moving functionality into a standard calling
> convention avoids these questions, leaves protocol implementation
> choices in the hands of individual SVSM designers, and is fully
> enumerable and optional.  Shouldn't this be the primary design model
> for all SVSM interactions?

As I said, the implementation specific parts must remain optional, but I
think the standard should leave room for implementers to have SVSM
specific calls without violating the standard.

As of discovery, this is what this sub-thread is about :) We can add a
call to the standard which allows to identify the SVSM implementation.

Regards,

--=20
J=F6rg R=F6del
jroedel@suse.de

SUSE Software Solutions Germany GmbH
Frankenstra=DFe 146
90461 N=FCrnberg
Germany

(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moer=
man

