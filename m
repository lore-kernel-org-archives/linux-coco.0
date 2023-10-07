Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533DA18632
	for <linux-coco@lists.linux.dev>; Sat,  7 Oct 2023 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCJAFoUf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so4670a12.1
        for <linux-coco@lists.linux.dev>; Sat, 07 Oct 2023 14:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696715304; x=1697320104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+tN2lpZkRonervAS5fIvsQ4b/Z4NaiU2MPzgbJ9tbw=;
        b=pCJAFoUfYVEy4vgOigwJOxFOMI3c3cSS0Vr45Tjl5AKyjn8b7+cu7liwxpANRieOHw
         RA8dC+Uev/cKiqAptJ0Xgz2cwSVNw6PlKl8KpPrzMZ+y2+EE2zowNuv+GNU8wNXfeLwX
         q+5Y2vNqnwFXSdnzNPqA3CXvYSu/RUp3tvEzo4RDjzQRNprIe2c2MYWzjlEHGvOX8IIa
         RVtvJxceleSOgp3KFQ75CalbXzelFY2wZKa6eaQZ0SSvPo0pqQ3LDi3Vn1EKxl+c40Df
         hxwk2h/wBCGYJNSFInbHb9uX+yYyaYM9ZGNQsbCZ8oEQ833Yh3iWxkhDBPoG7MfteX6Y
         GrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696715304; x=1697320104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+tN2lpZkRonervAS5fIvsQ4b/Z4NaiU2MPzgbJ9tbw=;
        b=gx26mh12XUNY0FuGYrNs0VLA9R16pGz3kt3CnIhnQKAge+zxdS6ao1Xx8Qj/xY4+e2
         5o56VNfLAMK2Sukg9noNqbhTsT013cD6pwIjXqNNgnzIMe1kK8y8mxF35171YS2FEMIJ
         I8mmEz4/91KixBv9rY0TFfpdKMf12xnKgZWB57fiXnF5aNrntA1D6jnxriW2wwhU8Jej
         pB92I+4pOoeBkLxRvMl8dzAHDspKfTs0qtZhKF3Q/kTrGh/wyEpdVCF3erwfpWXrtuCU
         96AuL0Bcy/SsyZIulFUdarrW4RJ0RXGazTo/heWRZn8yI4OJOO/rg+g3FIYO39Z1rGNn
         n/cw==
X-Gm-Message-State: AOJu0YxefVLIFPlWlQF3BNWontXb/IV4wcGLN9vABqxS5nu8cf2ChB8U
	tGrpfOKR3hGkZsNnkKPp/DUAA+W27jbZ5SqWn7WukQ==
X-Google-Smtp-Source: AGHT+IErRjZatfl7sMYDcUM84Uy9YA7ia9z+hiQHM1XSyUau97ybuZpSxqpjKlAe+uphJgAXJ4zqAVb84WQlaiGdILo=
X-Received: by 2002:a50:9fa4:0:b0:538:5f9e:f0fc with SMTP id
 c33-20020a509fa4000000b005385f9ef0fcmr298891edf.0.1696715304342; Sat, 07 Oct
 2023 14:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c677020f-5c98-ccdc-b204-bfaf5cde02e6@amd.com> <CAGxU2F7kuTrrqWgwF9aVJKSZgn_fvyj4bjW2D_mgdfVssPmLYQ@mail.gmail.com>
 <b346b3b4-fc29-0a88-86a8-050dfad14379@amd.com>
In-Reply-To: <b346b3b4-fc29-0a88-86a8-050dfad14379@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Sat, 7 Oct 2023 14:48:10 -0700
Message-ID: <CAAH4kHYU6OUyjF_aeguQHNpWK8eZ+bcNTEJXE_3oHett=OZ6nQ@mail.gmail.com>
Subject: Re: SVSM v1.00 and GHCB v2.03 specifications available
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The services manifest table uses the terms "service GUID" and "service
data" when later in the vTPM section, the terms seem to change to
"service attestation GUID" and "manifest data". If these are indeed
the same things, please use consistent terminology. If they're
different, how are they different?
The fact that the data is specifically meant for attestation seems to
suggest that neither of the terms are appropriate, and that we should
use "service report" instead, to evoke more integrity expectations
from the interface.

What is the SVSM's notion of a "service"? Just something that produces
data in these service attestation calls (plus "core services")? I'm
not sure how to understand if there is an unstated but expected "1
GUID/entry per service" constraint here. There's nothing about the
"core services" having entries in the output, or explicitly not having
entries in the output.
The document's section "Core protocol services" seems to associate a
service with protocol # * call ID, but that seems inconsistent with
also calling each of these "calls". The fact that there are 32 bits
for protocol numbers, 32 bits for call ID, and 32 bits for protocol
version makes the 128 bits for these service GUIDs somewhat confusing
to assign a correspondence to.

My thoughts:

a. there may be multiple services provided through a single protocol,
but that protocol doesn't yet exist
b. GUIDs are used for the table because that's been a common data
format across the certificate data blob and how EDK2 represents data,
but there still is a 1<->1 correspondence between protocols and GUIDs?
c. manifest versions are redundant, and new versions can be associated
with different GUIDs. The fact that a version can be requested but is
not also required to be represented in the service/manifest data makes
me want to require the version at the top of the data or do away with
versions and just use different GUIDs when the ABI changes.

On the topic of "manifest version", the fact that there can be
multiple possible versions for each service makes SVSM_ATTEST_SERVICES
too awkward to continue being useful as formats evolve. The vTPM
protocol states that /only/ version 0 will be used in the
SVSM_ATTEST_SERVICES output.
It seems the SVSM_ATTEST_SERVICES  operation /cannot/ get every
service's "manifest data" that a user wants unless any of the
following

a. there is an additional variable size input that allows a user to
name specific services and assign a requested manifest version,
b. the service can decide which version it will advertise when
enumerated and make the choice unambiguous by including the version in
the output.
c. manifest versions are removed and a service can enumerate its data
in all the "versions" it wants through different guid entries, though
this can also be a waste of time and memory

Those would help save the cost of round-trips with the SVSM and with
the AMD-SP, which seems to be the point of including all the integrity
information in the enumeration's output to begin with, as opposed to a
service inventory giving a list to individually query with
SVSM_ATTEST_SINGLE_SERVICE.

On Fri, Oct 6, 2023 at 7:26=E2=80=AFAM Tom Lendacky <thomas.lendacky@amd.co=
m> wrote:
>
> On 10/6/23 09:18, Stefano Garzarella wrote:
> > Hi Tom,
> >
> > On Wed, Oct 4, 2023 at 7:30=E2=80=AFPM Tom Lendacky <thomas.lendacky@am=
d.com> wrote:
> >>
> >> The new versions of the subject specifications are now available. The
> >> https://www.amd.com/sev webpage will be updated shortly with the new
> >> links.
> >>
> >> In the mean time...
> >>
> >> The v1.00 SVSM specification is available here:
> >>
> >>     https://www.amd.com/content/dam/amd/en/documents/epyc-technical-do=
cs/specifications/58019.pdf
> >
> > I think there's a little typo on page 30, section 7.2
> > SVSM_ATTEST_SINGLE_SERVICE Call.
> > RCX Description: "gPA of the attestation services operation structure, =
see
> > Table 11: Attest Services Operation"
> > ^
> > this should be "Table 13: Attest Single Service Operation", right?
>
> Yes, that should be Table 13. I'll work on getting that updated.
>
> Thanks,
> Tom
>
> >
> > Thanks,
> > Stefano
> >
> >>
> >> the v2.03 GHCB specification that adds support needed for running an
> >> SVSM is available here:
> >>
> >>     https://www.amd.com/content/dam/amd/en/documents/epyc-technical-do=
cs/specifications/56421.pdf
> >>
> >> Thanks,
> >> Tom
> >>
> >
> >
>


--=20
-Dionna Glaze, PhD (she/her)
