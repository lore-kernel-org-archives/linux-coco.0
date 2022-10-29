Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC1163
	for <linux-coco@lists.linux.dev>; Sat, 29 Oct 2022 00:26:13 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id p141so5924070iod.6
        for <linux-coco@lists.linux.dev>; Fri, 28 Oct 2022 17:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FO+bruDinJIDHuwyyX6AyzV7CEbfcDwQGvnZfOYWLQ=;
        b=CNoOuYuLzpa8gNNXMGEpn+cVY38clOwXrlqzLV+N64xf3zHgsx5uZgIr6baaNMcdNh
         giMJZUSVp66RXMuO+5XCLk/ElyBS4yK259grEuQ0//ZBM6evP4i5a4nlbLn1Boh4Y9VX
         w1CGyzuBektx3jn4n81IxPC3iIczNIJkOyvVNO6jKc7y4msLCwHSXypPAcuu42TGw+gX
         +zutek5FV0knAAdbgOROlKl4HaZ0v/YEvSxY4cuEN8XtFCprrF8ALkbodL4s3yHjzPyP
         z9jQV/gYOYAGzalOS+UlRprEtQLrJH0St4djg9cpJoKGsQH/C9MUzUx7USE5lE7jL0En
         uAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FO+bruDinJIDHuwyyX6AyzV7CEbfcDwQGvnZfOYWLQ=;
        b=P8cGN2SYGatgO1lJSVhOFILeD+cjKCDn87V28sqjUfrDwqZiFTeB8M9jSpYK4DcX9d
         rGoT/sqU0HWBiH0DS/SHzo5UH5SwsarNH3kaO9ljjckY1qOSQoyQw9Lkc49e4treiZhr
         LZ5ZenQYg0yPCNmvGJlR9A6V5VW3IWUe2fMMT+Er0phQ6Vf5vixlIyeaLLTD72PFOjLV
         E3rQiMcfECu7256OdCLurdBNpd1c+qfwN516n5tnWSfaeDcuAqEv+TSbf8nc0BHhXjbV
         ddXzDGP7+bVZuXSb1PNrSIYJGMIdmFMP8Czo24SCe7QZfP5tWJ51SZkzz/hq1aAM1MaO
         pM+w==
X-Gm-Message-State: ACrzQf3f5rQ3dZAH2ga3qqpC8qcVTo5V32EBi3c9pUIP3nVPf62ciZ+d
	YSeT+zOUg5BNQwFhQEUbQeM1/1H048cu7Q+YPquySA==
X-Google-Smtp-Source: AMsMyM6QE83uKUrOSfIBkzFjMQfqKY479x5ai7QV17qsQ7PToG57srPEQSjFTE4sflmKp18lelaaotOP2a1zDNbSeHo=
X-Received: by 2002:a05:6638:2714:b0:363:af62:f457 with SMTP id
 m20-20020a056638271400b00363af62f457mr1103222jav.307.1667003172882; Fri, 28
 Oct 2022 17:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e895e706-ffb1-a801-91cd-ba04f4e639c2@amd.com> <8080a626-114e-b358-bb36-a7b5583ff2f0@linux.ibm.com>
 <58b2bcdb-583b-ccc5-cffb-500ade7fbdab@amd.com> <SJ0PR21MB132342D2808DF609F37D6018E92B9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <CABayD+cYCj=uOtC5h1d781jh_B6XqxmZNfR69taEex7yvkizRw@mail.gmail.com>
 <SJ0PR21MB132378C080FFED1E283B4051E92A9@SJ0PR21MB1323.namprd21.prod.outlook.com>
 <f9af0f4b95ea6fe3e488d24f5070ab71c2da3eb4.camel@linux.ibm.com>
 <MN0PR21MB3072186C88BB26EA883F8612CA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <7e67f33577aaebe09205c9a93597de9f742fd08f.camel@linux.ibm.com>
 <MN0PR21MB307280C94C1C54497ADDEFCECA2D9@MN0PR21MB3072.namprd21.prod.outlook.com>
 <Y1ZwJvNvky6Wst7k@work-vm> <d8b21444-7829-5f5c-41dd-b103ae3a52fa@linux.ibm.com>
 <682a4227-aa79-298c-2ced-5f401c9d4339@amd.com> <e4a13b17-7317-dd49-d203-cf149e2d5eb4@linux.ibm.com>
 <m2bkq0i67q.fsf@redhat.com> <461f5c5e76dc5280f25f4a8627188cb16b2c2f72.camel@linux.ibm.com>
In-Reply-To: <461f5c5e76dc5280f25f4a8627188cb16b2c2f72.camel@linux.ibm.com>
From: Steve Rutherford <srutherford@google.com>
Date: Fri, 28 Oct 2022 17:25:36 -0700
Message-ID: <CABayD+e5LYgNvuu1-Pd9LmKHiWZr5HcfTX9ueG8ibvq8zmAPhQ@mail.gmail.com>
Subject: Re: SVSM vTPM specification
To: jejb@linux.ibm.com
Cc: Christophe de Dinechin <cdupontd@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	David Altobelli <David.Altobelli@microsoft.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"amd-sev-snp@lists.suse.com" <amd-sev-snp@lists.suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems like this thread has petered out a bit, but without all the
concrete details. A few remaining questions I have:

1) Is JSON good enough? or should the report use CBOR? (Both seem
fine. CBOR seems popular for similar situations).

2) Do the contents of the vtpm sub-section need to be pre-specified
(i.e. standardized)? Or are they going to be completely customizable?
(For example, there are many standard EKs, though the ECC one
(template L-2) is probably the one most people will want. I've discussed
the idea of an ephemeral "null hierarchy only" TPM with some coworkers,
but that would complicate standardization of any EK in these reports.
I'd also like to bolt on an AK (i.e. a default EK-like signing key in
the endorsement hierarchy) to some reports we end up providing, but I
don't see a need for that to be guaranteed in every report. It just
needs to be compatible with whatever we choose here. Google provides a
trusted AK for existing vTPMs.)

3) If reports are customizable, how do we avoid collisions that could
lead to misinterpretations across vendors? Do reports need a
vendor-specific key carved out for individual vendors to scribble in?

4) Are there going to be any custom inputs that get passed through
from the guest to the report other than a nonce? (I think the answer
is no, but want to make sure I'm not missing something here)

5) How will all of this interact with persistent storage of the
seeds/NVDATA? (My current thought is that the report should summarize
how the SVSM stored its NVDATA and who/what it trusted. So long as
it's possible to add those details to the report, I'm not sure we need
to align on the precise details of NVDATA-persistence attestation
right now.)

Thanks,
Steve



On Tue, Oct 25, 2022 at 7:14 AM James Bottomley <jejb@linux.ibm.com> wrote:
>
> On Tue, 2022-10-25 at 11:43 +0200, Christophe de Dinechin wrote:
> > On 2022-10-25 at 11:51 +03, Dov Murik <dovmurik@linux.ibm.com>
> > wrote...
> > > On 24/10/2022 22:02, Tom Lendacky wrote:
> > > > On 10/24/22 06:45, Dov Murik wrote:
> > > > >
> > > > > On 24/10/2022 13:59, Dr. David Alan Gilbert wrote:
> > > > > > * Jon Lange (jlange@microsoft.com) wrote:
> > > > > > > The drawback to having an identifier-prefixed document is
> > > > > > > that it necessarily restricts each report to providing only
> > > > > > > a single statement from a single SVSM protocol.  If, in the
> > > > > > > future, we find it is common for a relying party to
> > > > > > > require, say, five different protocol statements, this
> > > > > > > imposes a requirement to obtain five separate reports.
> > > > > > > This means a minimum of five round trips from the SVSM to
> > > > > > > the PSP, which seems undesirable.  I think we will really
> > > > > > > want to invest in defining an extensible format that can be
> > > > > > > placed into a single report.  I'm not claiming that JSON is
> > > > > > > the only option here, but I think we will regret any format
> > > > > > > that prevents extension within a single report.
> > > > > >
> > > > > > Having something structured does seem to me better than
> > > > > > tacking a magic byte on. (Although as I remember, the SNP
> > > > > > report already contains a flag saying which VMPL level the
> > > > > > request was generated from; whether that's enough to
> > > > > > discriminate between guest requests, and requests by the
> > > > > > firmware I don't know).
> > > > > >
> > > > >
> > > > > The VMPL level is not enough to distinguish between different
> > > > > reports which all originate from the SVSM (for example, let's
> > > > > say we have an SVSM-vTPM report and an SVSM-migration-helper
> > > > > report).
> > > > >
> > > > > I think that the two options presented here are:
> > > > >
> > > > > 1. SNP REPORT_DATA =3D type_byte + nonce + sha256(extra_data)
> > > > > [James]. The meaning/format of extra_data depends on
> > > > > type_byte.  For now we design just for vtpm (type_byte=3D0x00).
> > > > > In the future, adding more info (like migration-helper report)
> > > > > will use new type_byte values (0x01,
> > > > > ...).
> > > > >
> > > > > 2. SNP REPORT_DATA =3D nonce + sha256(extra_data) [Jon].
> > > > > extra_data is a JSON document which may contain a vtpm section,
> > > > > a migration-helper section.  In the future, we can add more
> > > > > info but adding sections to this JSON document.
> > > >
> > > > If I understand this method correctly, the input would be a JSON
> > > > document requesting certain elements (a one-to-one relationship
> > > > or a one-to-many?) and their values be used in generating an
> > > > output JSON document, correct?
> > > >
> > > > That would mean parsing the input document in the SVSM. The SVSM
> > > > would return an error on improper documents. What about
> > > > unidentified fields, would those just be returned with null for
> > > > their values or not included in the output document?
> > >
> > > You mention "input document" -- who would provide it?
>
> I think you have to be more precise about "it".  There are two
> potential types of "it": one is the template you want the SVSM to fill
> in and the other is the JSON document with the values.  I can't really
> see why we'd provide the latter to the SVSM because why would it
> believe our values without checking them and if it knows enough to
> check them why does it need them passed in?
>
> The next problem is there might be values in the template only the SVSM
> knows (this isn't the case for the TPM, but it might be true for the
> migration parameters).
>
> >
> > In the migration-helper case, the migration helper data would not
> > originate from the SVSM itself, would it? So I guess it would have to
> > be provided, presumably in JSON form.
>
> Just from a security point of view, you never want any attestor to
> attest to information it doesn't itself know.  Thus the only input
> information from an unverified source should be the challenge (the
> nonce).  If there's information about the migration the SVSM doesn't
> know and can't verify, it shouldn't be part of the report.
>
> >
> > In other words, I think long term, the SVSM would need to parse
> > _some_ input, but this is a problem we can defer until we actually
> > need it.  For the first iteration, we can certainly generate the
> > =E2=80=9Cbase=E2=80=9D JSON entirely from the SVSM. I think both statem=
ents are true
> > irrespective of the approach chosen.
> >
> > But Dov's question points to more than just parsing. If the SVSM were
> > to hold information such as migration helper data, we then have to
> > think about storage in the SVSM, e.g. what is maximum size of
> > migration helper data.  Or alternatively, formulate the interface in
> > such a way that it's the caller's responsiblity to provide "fill-in-
> > the-blanks" JSON data with space for the vTPM data, in which case we
> > are back to having to parse JSON input.
>
> Well, no, I don't think you need to do either.  The SVSM has a 32 bit
> protocol definition.  You can just define a new protocol to produce the
> migration report and that can have different input arguments if
> necessary (migrations would need some form of attestation from the
> remote that the local SVSM can verify, so they need more information
> than the SVSM knows at the time).  This does mean that you don't
> necessarily need an input template unless you want to do multiplexed
> reports, which is a decision I'd punt on until a need arises, so I'd
> still keep the SVSM attestation report as not having an input template.
>
> As for storage, the SVSM has access initially to all the memory of the
> VM before it begins OVMF, so it can just take possession of anything it
> needs.  I don't believe at this size we need to design a maximum size
> ... lets see first what uses appear.
>
> > I tend to agree that we'd better think about this scenario ahead of
> > time, just to make sure we can cover it properly in both approaches.
>
> Well, yes and no.  You don't have to boil the ocean designing this, you
> just have to know that the design you chose is extensible (as both
> proposals seem to be).
>
> James
>
>
