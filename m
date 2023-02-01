Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8265C63B3
	for <linux-coco@lists.linux.dev>; Wed,  1 Feb 2023 15:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675264856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SrLCw+CxRcyf1h+JCKMe42vO5pLCLPgHCqKGEpRxy9o=;
	b=dO5acfTuBPNZkN9+s7lREBwvmhtR7KLFVjL+y1phJie/N0L9mIwZqFEB/Gz4hTrzvVfHPl
	txBj7cSsTtZgqkMgSgz9iY5+CvC/YmzXP0txiWgFys0c8sylTrLbTY6GfhevtJU5GLEHgs
	LWl4XrP40RgmVubKFC74fcJATzSwyqQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-4lWryy_KP8O4LqX5Myr4Fw-1; Wed, 01 Feb 2023 10:20:55 -0500
X-MC-Unique: 4lWryy_KP8O4LqX5Myr4Fw-1
Received: by mail-qv1-f72.google.com with SMTP id j7-20020a0cf507000000b0053b538958d5so6097081qvm.18
        for <linux-coco@lists.linux.dev>; Wed, 01 Feb 2023 07:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THYl/RLnPkUT1FNIkiWEjbvceggmQZZbuCfOPKJlxEg=;
        b=vt/aROULlQM77x0YpRKm6mLu4kg0I44dhnVhHEd1d5/rfCSA5cj7SCIXdoYbu52AO9
         xdjmSFbvv0IGpzTwGWL4j9Zy+v0cz25zHtu8oWE6UqpOt1OIGOogyZ7dRBgFQCgyuB/5
         V7sYT9QWQOzbHwLJob2Fv51FytgtYb6BWDrn66YTzs22DONjxVisX4FCkt4z3a/9DjEA
         RJ65CzC+8s5abi6BtZfA/90p1SjnB667zfykr67tY9dhkOv+75OtUh59oSaDO4uOKq/X
         yxX6VpUAQeHNUgAW+MFeeb3edlmjZFsTEdF15P/avGs1jOEvva1/gapG9M38KqcLz1oy
         11ig==
X-Gm-Message-State: AO0yUKVt5LxcoPHDRUxIVx3CeaMDbG8hYiB0k9UcDaTxpLdeZiru4xXO
	3sR5uXeEOTvmUjpgCc9ltKDG7yk2qdgkahYMcihR6KtZiEuUPunKg68Ek+GaCffbN0WERGOIXJX
	psGc9BWk42ip4MpT1UJJgPQ==
X-Received: by 2002:a05:622a:44f:b0:3b8:6b6b:28bc with SMTP id o15-20020a05622a044f00b003b86b6b28bcmr3832596qtx.62.1675264846640;
        Wed, 01 Feb 2023 07:20:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8ilL9UCHBprGk+tfQJluUlcBbMqapTXtVjPhmTG/DR754r3SKUeS2SBaWAkrko+zGX+q2mnA==
X-Received: by 2002:a05:622a:44f:b0:3b8:6b6b:28bc with SMTP id o15-20020a05622a044f00b003b86b6b28bcmr3832566qtx.62.1675264846364;
        Wed, 01 Feb 2023 07:20:46 -0800 (PST)
Received: from smtpclient.apple (82-65-201-253.subs.proxad.net. [82.65.201.253])
        by smtp.gmail.com with ESMTPSA id i1-20020a37b801000000b00702d1c6e7bbsm12078862qkf.130.2023.02.01.07.20.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 07:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [EXTERNAL] SVSM Attestation and vTPM specification additions -
 v0.60
From: Christophe de Dinechin Dupont de Dinechin <cdupontd@redhat.com>
In-Reply-To: <MN0PR21MB3072B127F1B0D6E0F73DF37ACAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
Date: Wed, 1 Feb 2023 16:20:27 +0100
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Message-Id: <02020D95-2BF1-4999-80BD-86CD8589197C@redhat.com>
References: <09819cb3-1938-fe86-b948-28aaffbe584e@amd.com>
 <Y8+oqoU2jZYrNlz1@suse.de> <7398c541-78ac-670f-1f4c-92b7525ed99e@amd.com>
 <749A53E5-4C6E-4D89-AF9B-E9F5EA273E1B@redhat.com>
 <MN0PR21MB3072B01C5A138EA849D88BE4CACF9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9OMuuHz2utBASOm@suse.de>
 <MN0PR21MB30724AB0ED1740D2018C06E3CACC9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y9eqB5/1YcZeIHqG@suse.de>
 <MN0PR21MB3072B127F1B0D6E0F73DF37ACAD09@MN0PR21MB3072.namprd21.prod.outlook.com>
To: Jon Lange <jlange@microsoft.com>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 31 Jan 2023, at 05:44, Jon Lange <jlange@microsoft.com> wrote:
>=20
> Joerg, I'm encouraged to see that we agree about most of the points relat=
ed to implementation-specific protocol extensions.  It seems like the place=
s where we have yet to come together have less to do with how the standard =
is defined but about how to approach implementation choices.  That's not re=
ally something that can be legislated into a standard (as you suggest) so w=
e'll just have to trust that the right thing happens.
>=20
> As far as how to enumerate implementation-specific extensions, why not ju=
st embrace the core concept of the protocol's extensibility, which is that =
individual protocol numbers are optional?  SVSM implementation 1A could pro=
pose protocol number 0x123 is its own extensions, and SVSM implementation X=
 could propose protocol number 0xABC as its extensions, etc.  This would el=
iminate any need to define any first-class concept of implementation identi=
ty (thus eliminating the need for an identity registry) and would also elim=
inate the question of deciding which commands within a given protocol are i=
mplemented by a given SVSM.  Instead, a guest OS could query for the implem=
entation protocol it wants, and if it's present, it can use it, and if it i=
s absent, it won't.  A given implementation could choose to lump all of its=
 various implementation-specific extensions into a single protocol, or add =
a different protocol number for every set of extensions (one for logging, a=
 separate one for other configuration - whatever).  With a 32-bit protocol =
ID space to choose from, I suspect we don't have to worry too much about ru=
nning out of IDs quickly, as long as we can construct some logical defense =
for every separate protocol ID.  And, as a bonus, those individual "impleme=
ntation-specific" constructs that are easily embraced by another implementa=
tion can easily transform into standards without requiring an all-or-nothin=
g adoption of an implementation's complete extension set - from your earlie=
r comments about prototyping, this seems like one of the extensibility feat=
ures you were hoping to achieve.

This is a common problem in the industry. For example, OpenGL had various e=
xtensions that could be queried, each exposing an interface (similar to the=
 protocols here). C and C++ compilers exposed =E2=80=9Cworking group=E2=80=
=9D features or compiler-specific extensions in various ways.

In all cases, some extensions are meant to be and remain =E2=80=9Cimplement=
ation-dependent=E2=80=9D whereas others may be work in progress with the in=
tent to become part of the standard later. In OpenGL, GL_NV_draw_vulkan_ima=
ge would be an example of the former, being specific to NVIDIA, whereas GL_=
ARB_arrays_of_arrays an example of the latter, ARB standing for Architectur=
e Review Board). Another important aspect is to be able to query the availa=
ble protocols in a portable way.

With IDs, I would split the ID space into three segments:
- The standard part, which we have today
- The experimental part, to become standard with possibly some changes
- The implementation-dependent part, never to be used by portable code

I must admit that I also thought of logging as an obvious extension to the =
current protocols, and I was also torn about how to standardize that. The r=
isk of not having an =E2=80=9Cexperimental=E2=80=9D part to the ID space is=
 that there will be a lot of discussion and bike shedding before we all agr=
ee on something. By contrast, pushing an experiment and having people test =
it should be comparatively painless.

I=E2=80=99m also considering future changes in the underlying hardware, exp=
osing capabilities that may not exist today. One example that was discussed=
 in another thread is the possibility, some day, to attest not just the gue=
st code, but the host hypervisor and kernel as well. In the AMD case, I sus=
pect this would involve having some of their code running at VMPL0, and may=
be having a =E2=80=9CVMPL1 SVSM=E2=80=9D interface.


Cheers,
Christophe

