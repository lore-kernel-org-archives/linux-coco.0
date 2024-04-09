Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815E1386C0
	for <linux-coco@lists.linux.dev>; Tue,  9 Apr 2024 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712690217; cv=none; b=MuPNBKrfDv44mUpDz0C6isbaD1TpmX4rnfebAq/aWgwU0TEyu2ssSv/PnU0IDGViq16GGDK1gDU2Saq5oV1BiDnzIvqwBFIRzfYz/ZelpvLGnwGtx2GMX1w+HfrP6UHqT6epbCF8S96t9WOXiEjzYveoGXQrT4x6FyeEBSezyKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712690217; c=relaxed/simple;
	bh=PH4nC1pa0C4D+FPMgNRgxTvMaCqf5Uac7HioL5v2jtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzySpbrxQuNBBvQ1E7imI6eskYE4mjL8lnvJmW+GFdRcc6AoOfNWhr5OYnHoc0QcZKxaD+oymJQ6FmYGvM27KAWZ4otgTnf97468/4hKle+MmMtnZenyZ+r5I8UMdO+sV7FCRfBH1qmtg0A5Ide9CWAxcp9dmK/RU6UQ+wtYzU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H9mNbU8Y; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H9mNbU8Y"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e85b7d2d1so3973a12.1
        for <linux-coco@lists.linux.dev>; Tue, 09 Apr 2024 12:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712690213; x=1713295013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBXDENZnVSmXgi1Xqk18wr2L5fg7CCpBBgFQrEIjUtk=;
        b=H9mNbU8YpO4DQs05dCmcY8irBZeD3jBUDp8olkljO9rkTPElDos2YIiKluHjsgC/bm
         6INYhxKsIxqIwaeduONGqakCBzEPHSzhshLGeuYMVz3DxwHrc/OqQNWbXiKQFg1ub98N
         WDAkZt8YIuHdzdHfQTQAfLRm18m6O4RM59CPbHjw4uh9HFMQqozEcj1Qg7/nw7ZCNIxs
         oCRuPAVfED6Vx0ch25AeFn2w2iyR31vBvEu94NboHednYhGgSe+Ed3PVbmv+3+sfB2bX
         BqXG42qRDEkzSQ3zbroUo9DVNeWFiDMfiGhzdP01ltozpRRa762+SRmcMbyMe9aa3GR7
         qo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712690213; x=1713295013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBXDENZnVSmXgi1Xqk18wr2L5fg7CCpBBgFQrEIjUtk=;
        b=ePlaxTqQxV8IJ0qX90L336zqRRi0GO+G8GDneKX+r3jao8A9oHZSjfuSytrKNJeqPh
         HzxERCZQErljE5VesSczGZ7ljUuY3fyiGEkdIFQ4ySLQiaPuKvOBj0h/zxxKUVPgrCIE
         pmFdt27kQos3anRs+mq+MAUAf5kx4nKjVP2XHO2L1GrTlcOFxHpbHgt3qOPIicvrcZ/u
         D0+5FFrDaK2ot9yf0DUlDwxft8hNcv40sFXpSDVpwf8W35Z48TLun1HNtQBk8uo3f0+g
         OXo2H/W9UqX9V2MM9b4dcwQmSCLbAxXD/HqJqC8lebvfCowaUMw0LL70p7Cm270vqf1N
         uY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8AuUZxQrFHOuBcmWUNX1nPV36KyAonV4vl+dqKLo7lyutvTz4+koP13ygbvcGghE3bQYmnjRlF+oU9FJBT8pWJE50TFyth4cjnQ==
X-Gm-Message-State: AOJu0YwTZ4O6gQnmDQEjeGb3EYn5ikNA0AW+RetJNc2oEo17Yp8IF0jR
	8+Y7nRb1MEiqQ+2PgtujKy0ZCBKOLTGNGgtxL27iNRZD6ZNtXSELqeZbIP77T6SD1j+VPBn15KU
	VeCPE4ca/FM7la5cwcP10mr8KlQTl9U9KIRJv
X-Google-Smtp-Source: AGHT+IFUkjRUQ7716ygpqXajutA1DnnioFCSZzrH71rZ+4puIGM4SBl8vhzR+fSpKb4d5K1105cMePvMNK+uO8MftUM=
X-Received: by 2002:aa7:d3c7:0:b0:56e:76e:6ea9 with SMTP id
 o7-20020aa7d3c7000000b0056e076e6ea9mr28102edr.6.1712690213037; Tue, 09 Apr
 2024 12:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
 <17C329C4A6D0CD18.8175@lists.confidentialcomputing.io> <CAOjUGWcNedJ7iNjGCKL6qZeZo3aSt_8U5BN=9JUN2f2vjD+O4w@mail.gmail.com>
 <CA+2DEOoc1Ckn2S-=57HiRsAd0W4YGRWVQQG-gOBR3Fc8nfX+Nw@mail.gmail.com>
In-Reply-To: <CA+2DEOoc1Ckn2S-=57HiRsAd0W4YGRWVQQG-gOBR3Fc8nfX+Nw@mail.gmail.com>
From: Qinkun Bao <qinkun@google.com>
Date: Tue, 9 Apr 2024 09:16:40 -1000
Message-ID: <CAOjUGWfMAxpZvMub=tqdAtinEFop6nRUrzFBwcn4Ke-f+erVtw@mail.gmail.com>
Subject: Fwd: [External] Re: [linux-collab] [CCC][tac] [RFC PATCH]
 OvmfPkg/SecurityPkg: Add build option for coexistance of vTPM and RTMR.
To: PH0PR11MB587959168F72B20E0AC836438C312@ph0pr11mb5879.namprd11.prod.outlook.com
Cc: Dionna Glaze <dionnaglaze@google.com>, Ard Biesheuvel <ardb@kernel.org>, devel@edk2.groups.io, 
	Erdem Aktas <erdemaktas@google.com>, James Bottomley <jejb@linux.ibm.com>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>, Gerd Hoffmann <kraxel@redhat.com>, linux-coco@lists.linux.dev, 
	Michael Roth <michael.roth@amd.com>, Peter Gonda <pgonda@google.com>, Qinkun Bao <qinkun@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Cfir Cohen <cfir@google.com>, 
	Chris Fenner <cfenn@google.com>, Ronald Aigner <ronaldaigner@google.com>, mingshen.sun@tiktok.com, 
	mikko.ylinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I brought the RFC into the CCC community
(https://github.com/confidential-computing/governance) and received
some comments.

Forward the email into the EDK2 dev and linux-coco.

Thanks,
Qinkun

---------- Forwarded message ---------
From: Mingshen Sun <mingshen.sun@tiktok.com>
Date: Thu, Apr 4, 2024 at 1:43=E2=80=AFPM
Subject: Re: [External] Re: [linux-collab] [CCC][tac] [RFC PATCH]
OvmfPkg/SecurityPkg: Add build option for coexistance of vTPM and
RTMR.
To: <qinkun@google.com>
Cc: <tac@lists.confidentialcomputing.io>,
<linux-collab@lists.confidentialcomputing.io>


Hi Qinkun,

Thanks for bringing this to the CCC community.

I think the proposal makes sense to me. RTMR and vTPM measurements
shouldn't be mutually exclusive.

Under certain threat models (e.g., workload operator is not trusted),
both of them may be valid.
1. Measurements of RTMR and vTPM can be used for cross validation with
different root-of-trust.
2. Key sealing feature provided by vTPM is not available in the
current TEE ecosystem.

Mingshen


On Thu, Apr 4, 2024 at 12:32=E2=80=AFPM qinkun Bao via


lists.confidentialcomputing.io
<qinkun=3Dgoogle.com@lists.confidentialcomputing.io> wrote:
>
> Hello,
>
> The current TDVF implementation does not extend to the vTPM if the
> RTMR attestation is enabled. We are working on proposals to address
> the issue. We would like to get the feedback from the CCC community
> about the proposal.
>
> Thanks,
> Qinkun
>
> On Thu, Apr 4, 2024 at 12:16=E2=80=AFPM qinkun Bao via
> lists.confidentialcomputing.io
> <qinkun=3Dgoogle.com@lists.confidentialcomputing.io> wrote:
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: qinkun Bao <qinkun@google.com>
> > Date: Thu, Mar 21, 2024 at 9:59=E2=80=AFAM
> > Subject: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexista=
nce of vTPM and RTMR.
> > To: <devel@edk2.groups.io>
> > Cc: <linux-coco@lists.linux.dev>, Erdem Aktas <erdemaktas@google.com>, =
Jiewen Yao <jiewen.yao@intel.com>, Ard Biesheuvel <ardb@kernel.org>, Peter =
Gonda <pgonda@google.com>, Dionna Glaze <dionnaglaze@google.com>, Qinkun Ba=
o <qinkun@google.com>, James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann =
<kraxel@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <=
michael.roth@amd.com>
> >
> >
> > From: Qinkun Bao <qinkun@google.com>
> >
> > The UEFI v2.10 spec defines the protocol EFI_CC_MEASUREMENT_PROTOCOL
> > to enable (for example) RTMR-based boot measurement for TDX VMs.
> > With the current UEFI spec=E2=80=99s =E2=80=9Cshould not=E2=80=9D wordi=
ng and EDK2
> > implementation, TPM measurement in TDVF is disabled when
> > RTMR measurement is enabled.
> >
> > Mutual exclusion of the CC measurement protocol and TCG measurement
> > protocol breaks backwards compatibility, which makes adoption of RTMRs
> > challenging. A virtualized TPM device (vTPM) managed by the host VMM
> > makes boot measurements visible to the VMM operator, but this is an
> > oft-requested feature that users can choose to accept.
> >
> > The TPM has been a standard for over a decade and many existing
> > applications rely on the TPM. Both inside and outside Google,
> > we have many users that require vTPM, including features that are
> > not easily available via RTMRs (e.g. sealing using keys that the
> > guest OS cannot access).
> >
> > This patch adds a non-default build option to allow the coexistence
> > of both the CC measurement and TCG protocols. Not included is a
> > vendor-specific measured event in the CC event log that indicates
> > whether a vTPM is attached or not.
> >
> > Cc: Erdem Aktas <erdemaktas@google.com>
> > Cc: James Bottomley <jejb@linux.ibm.com>
> > Cc: Jiewen Yao <jiewen.yao@intel.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Tom Lendacky <thomas.lendacky@amd.com>
> > Cc: Michael Roth <michael.roth@amd.com>
> > Signed-off-by: Qinkun Bao <qinkun@google.com>
> > ---
> >  OvmfPkg/OvmfPkgX64.dsc                               |  9 ++++++++-
> >  .../DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c    | 12 +++++++++++-
> >  .../DxeTpmMeasurementLib/DxeTpmMeasurementLib.c      |  6 ++++++
> >  3 files changed, 25 insertions(+), 2 deletions(-)
> >
> > diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
> > index 56c920168d..9bcee45047 100644
> > --- a/OvmfPkg/OvmfPkgX64.dsc
> > +++ b/OvmfPkg/OvmfPkgX64.dsc
> > @@ -32,7 +32,8 @@
> >    DEFINE SECURE_BOOT_ENABLE      =3D FALSE
> >    DEFINE SMM_REQUIRE             =3D FALSE
> >    DEFINE SOURCE_DEBUG_ENABLE     =3D FALSE
> > -  DEFINE CC_MEASUREMENT_ENABLE   =3D FALSE
> > +  DEFINE CC_MEASUREMENT_ENABLE   =3D TRUE
> > +  DEFINE CC_MEASUREMENT_AND_TCG2_COEXIST  =3D FASLE
> >
> >  !include OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc
> >
> > @@ -99,6 +100,11 @@
> >    INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable
> >  !endif
> >    RELEASE_*_*_GENFW_FLAGS =3D --zero
> > +!if $(CC_MEASUREMENT_ENABLE) =3D=3D TRUE && $(CC_MEASUREMENT_AND_TCG2_=
COEXIST) =3D=3D TRUE
> > +  MSFT:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +  INTEL:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +  GCC:*_*_*_CC_FLAGS =3D -D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +!endif
> >
> >    #
> >    # Disable deprecated APIs.
> > @@ -1045,6 +1051,7 @@
> >    }
> >  !endif
> >
> > +
> >    #
> >    # TPM support
> >    #
> > diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBo=
otLib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> > index 73719f3b96..4c9bc8ab4a 100644
> > --- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> > +++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> > @@ -325,7 +325,12 @@ Tcg2MeasureGptTable (
> >      }
> >
> >      DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasureGptTabl=
e - %r\n", Status));
> > +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +  }
> > +  if (Tcg2Protocol !=3D NULL) {
> > +#else
> >    } else if (Tcg2Protocol !=3D NULL) {
> > +#endif
> >      //
> >      // If Tcg2Protocol is installed, then Measure GPT data with this p=
rotocol.
> >      //
> > @@ -493,7 +498,12 @@ Tcg2MeasurePeImage (
> >                             CcEvent
> >                             );
> >      DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasurePeImage=
 - %r\n", Status));
> > -  } else if (Tcg2Protocol !=3D NULL) {
> > +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +   }
> > +   if (Tcg2Protocol !=3D NULL) {
> > +#else
> > +   } else if (Tcg2Protocol !=3D NULL) {
> > +#endif
> >      Status =3D Tcg2Protocol->HashLogExtendEvent (
> >                               Tcg2Protocol,
> >                               PE_COFF_IMAGE,
> > diff --git a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurement=
Lib.c b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> > index 6f287b31fc..b1c6198b4b 100644
> > --- a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> > +++ b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> > @@ -261,7 +261,11 @@ TpmMeasureAndLogData (
> >                 HashData,
> >                 HashDataLen
> >                 );
> > +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> > +  }
> > +#else
> >    } else {
> > +#endif
> >      //
> >      // Try to measure using Tpm20 protocol
> >      //
> > @@ -287,7 +291,9 @@ TpmMeasureAndLogData (
> >                   HashDataLen
> >                   );
> >      }
> > +#ifndef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> >    }
> > +#endif
> >
> >    return Status;
> >  }
> > --
> > 2.44.0.291.gc1ea87d7ee-goog
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2): https://lists.confidentialcomputing.io/g/linux-co=
llab/message/2
> Mute This Topic: https://lists.confidentialcomputing.io/mt/105336026/7779=
031
> Group Owner: linux-collab+owner@lists.confidentialcomputing.io
> Unsubscribe: https://lists.confidentialcomputing.io/g/linux-collab/unsub =
[mingshen.sun@tiktok.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
