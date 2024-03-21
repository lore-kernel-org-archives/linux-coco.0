Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C712CD8A
	for <linux-coco@lists.linux.dev>; Thu, 21 Mar 2024 17:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711043224; cv=none; b=nSQQCLHT4qU93ustEiqGJBMH2Ysl2RY+varPcVWV3/YmRouaueOLwSmZY6CLcK6osgexfYMLhtF5xmFCL9CRCqIlqt/lq0p/fB1hgvWDSESM6qd0naH/rpou7FBHRWiGr/vfmkYXxh8MWIF4nRtqFp5zM3CZKyjMyIqqKfVFZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711043224; c=relaxed/simple;
	bh=J4H1E5XwkLbRIsnpIb6PqJLjs7v6V+Tm+FmDklC+3pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BtYFso7Tiyt2Aw3kpF6jL2kZstSXVDyqeSelMLYQB6H1wkTkL7vl1AnL5s7RTL7PVlM6UWFob4G7s6M3hwrdapxzwpj2uW0YiSuiD52pY3wnm5ZTbY2ub08v49uUbYIFOyci3xQ/JE6SQE5oRXE3AF9NBDiXVeMRLFZeZ7JQJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGrzjLi2; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGrzjLi2"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-568c3888ad7so1646a12.0
        for <linux-coco@lists.linux.dev>; Thu, 21 Mar 2024 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711043218; x=1711648018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NlNHuZ4wYBvcFzVTLvYUSJOiTN6Eohy4fHDUTwk+lE=;
        b=HGrzjLi2yCPwZQrIyV4wd4NprxS/nIwlYf/QS4Kll4PoIuqc7ycLP4ixIbE7GiQVre
         GGO76bPgEv8JZJeV12CX/BvFYBW5U+RFcfLmcRbIci8J3cxOxqiqT3+Cbrmh3VyfXcNu
         yMk04TYZ/UkegpSU4BkE8iT1cUCKL/GlCDrD/jpHMR/KRI1626IEANtn++BT6SIliXaW
         W1wpNmu0NTGpC3cr7Qh9aRnb0gJb4rFynr6BSUPu2MJo3ejusVosXD3pQR0AmsITfW3P
         HHHtwGFHZZssaW+JlyZrlexwNgfzw/aiqioeI1zLOXPXl/qvwZMEDEcd9C6FP4qeuIrH
         m8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711043218; x=1711648018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NlNHuZ4wYBvcFzVTLvYUSJOiTN6Eohy4fHDUTwk+lE=;
        b=OkTAJg9du5jHMw+HsjCKMV9zZ0rMVn4O1tr8uN6PRvAABnh8FbooVIcw/Hi/C2M3Of
         BEPnOZXALl52yBXi+0fiSR+uc7C/z+ThFhBdVUyKNUad7Je3og2tJMv/1jrGt00eE3dG
         3qSw68zpOPhe0oIpxAcHnA8jiADq6w0qEESrYnAVCGGCXpkwmsEfhCtVxjaBOcChovnK
         esqdrdV82AsyjgunuIhtNL002MkHVdZ4InlprkDia6Vqs4v3MbRdvYw/xUejvwRuf83S
         wZHiB22VUuwgq9V1Ng2yn2CwejK8C/4Z9/dWCwbNdMjj2fxUvEhSOA74kCr57Msb4g3x
         7B2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbKU/PJPAxNJyE/eJVECUm7dUBURAqaJso2jD8KCtza8d1ua55PgjWAbYOLhVG2O1EUc6aB0VGcY6Q5lySue28AmnfzxHSq/mMRg==
X-Gm-Message-State: AOJu0YxPPa3tFY8iLGjtiCF1WhtWUKYtLjbRmve+GNeggyCo5T3bQ4oG
	8qx8mbf6uHBDbU0vHM+sHMHTTAE9C3MO9REnhgpgn6nA85Nst6JVcc9rhyzlgOjLs1G7tNGSRYQ
	76EUkyJk51TSSrq5X5v/fSd48wSqnlXrpPIFd
X-Google-Smtp-Source: AGHT+IGu9h6gbNtuVZtwQMr3Hv/MhtZla4uv5torE6Ki41lgRBG1CXzaq0OCuj/SAc8vFXlKhyULil0PC7mm+sFcfYQ=
X-Received: by 2002:aa7:d703:0:b0:56b:826e:d77d with SMTP id
 t3-20020aa7d703000000b0056b826ed77dmr184209edq.3.1711043218153; Thu, 21 Mar
 2024 10:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
In-Reply-To: <94521f20aa2872c1b8f018b7db31eca4a2b8222d.1711039409.git.qinkun@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 21 Mar 2024 10:46:45 -0700
Message-ID: <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
Subject: Re: [RFC PATCH] OvmfPkg/SecurityPkg: Add build option for coexistance
 of vTPM and RTMR.
To: qinkun Bao <qinkun@google.com>
Cc: devel@edk2.groups.io, linux-coco@lists.linux.dev, 
	Erdem Aktas <erdemaktas@google.com>, Jiewen Yao <jiewen.yao@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Peter Gonda <pgonda@google.com>, 
	James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 9:59=E2=80=AFAM qinkun Bao <qinkun@google.com> wrot=
e:
>
> From: Qinkun Bao <qinkun@google.com>
>
> The UEFI v2.10 spec defines the protocol EFI_CC_MEASUREMENT_PROTOCOL
> to enable (for example) RTMR-based boot measurement for TDX VMs.
> With the current UEFI spec=E2=80=99s =E2=80=9Cshould not=E2=80=9D wording=
 and EDK2
> implementation, TPM measurement in TDVF is disabled when
> RTMR measurement is enabled.
>
> Mutual exclusion of the CC measurement protocol and TCG measurement
> protocol breaks backwards compatibility, which makes adoption of RTMRs
> challenging. A virtualized TPM device (vTPM) managed by the host VMM
> makes boot measurements visible to the VMM operator, but this is an
> oft-requested feature that users can choose to accept.
>
> The TPM has been a standard for over a decade and many existing
> applications rely on the TPM. Both inside and outside Google,
> we have many users that require vTPM, including features that are
> not easily available via RTMRs (e.g. sealing using keys that the
> guest OS cannot access).
>
> This patch adds a non-default build option to allow the coexistence
> of both the CC measurement and TCG protocols. Not included is a
> vendor-specific measured event in the CC event log that indicates
> whether a vTPM is attached or not.

Thank you very much for starting this conversation. I'll carry forward
more context from our more senior engineers.

'
Not measuring into all possible measurement banks led to
(CVE-2021-42299) with TPM PCR banks. Let's not repeat this problem.
Requiring a monumental shift of all attestation-based applications to
CC_MEASUREMENT_PROTOCOL and CEL in one step is going to make the
technology very difficult to adopt.
'

The combination of these requirements means careful rollout of
attestation verification policies to match the updated behavior of the
firmware.
The measured boot components have to be known to correctly measure
into all available measurement protocols and register banks.
The firmware has to be known specifically which protocols it makes availabl=
e.

Now, how this is done is a vendor matter for now. If there is strong
demand for making vTPM attachment status known for folks who really
don't want a TPM and don't trust the VMM to not attach one anyway,
we'll need to agree that the CEL should have an entry for an RTMR0
update detailing the combination of measurement protocols in use.
Likewise PCR1 should have an event detailing the protocols in use if
we want to make CC_MEASUREMENT_PROTOCOL usage configurable.

Philosophizing aside that both protocols should be allowed to be
active and that the spec should be updated to say something along the
lines of "all measurement protocols that are active (i.e., any
combination of EFI_CC_MEASUREMENT_PROTOCOL, EFI_TCG_PROTOCOL,
EFI_TCG2_PROTOCOL) should have comparable events measured if any one
protocol receives measurements. All measurement protocols that are
active MUST measure comparable separator events if any protocol
receives a separator event." This is crossing a spec boundary between
USWG and TCG, so I don't know where specifically the language needs to
go, but we need some language that implementers can use as
justification for measuring into any found protocol and not just at
most one.

It's not lost on me that it is similarly difficult to say that all
protocols that are discoverable need to have comparable events
measured into them since that _also_ introduces an all-or-nothing
migration problem, but at least that's more controllable from the
attestation verification policy side than from the UEFI spec side.
We're not adding new measurement protocols frequently, so we can get
the entire boot chain ready for a new measurement protocol before it's
made discoverable.

>
> Cc: Erdem Aktas <erdemaktas@google.com>
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Jiewen Yao <jiewen.yao@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Michael Roth <michael.roth@amd.com>
> Signed-off-by: Qinkun Bao <qinkun@google.com>
> ---
>  OvmfPkg/OvmfPkgX64.dsc                               |  9 ++++++++-
>  .../DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c    | 12 +++++++++++-
>  .../DxeTpmMeasurementLib/DxeTpmMeasurementLib.c      |  6 ++++++
>  3 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/OvmfPkg/OvmfPkgX64.dsc b/OvmfPkg/OvmfPkgX64.dsc
> index 56c920168d..9bcee45047 100644
> --- a/OvmfPkg/OvmfPkgX64.dsc
> +++ b/OvmfPkg/OvmfPkgX64.dsc
> @@ -32,7 +32,8 @@
>    DEFINE SECURE_BOOT_ENABLE      =3D FALSE
>    DEFINE SMM_REQUIRE             =3D FALSE
>    DEFINE SOURCE_DEBUG_ENABLE     =3D FALSE
> -  DEFINE CC_MEASUREMENT_ENABLE   =3D FALSE
> +  DEFINE CC_MEASUREMENT_ENABLE   =3D TRUE
> +  DEFINE CC_MEASUREMENT_AND_TCG2_COEXIST  =3D FASLE
>
>  !include OvmfPkg/Include/Dsc/OvmfTpmDefines.dsc.inc
>
> @@ -99,6 +100,11 @@
>    INTEL:*_*_X64_GENFW_FLAGS =3D --keepexceptiontable
>  !endif
>    RELEASE_*_*_GENFW_FLAGS =3D --zero
> +!if $(CC_MEASUREMENT_ENABLE) =3D=3D TRUE && $(CC_MEASUREMENT_AND_TCG2_CO=
EXIST) =3D=3D TRUE
> +  MSFT:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> +  INTEL:*_*_*_CC_FLAGS =3D /D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> +  GCC:*_*_*_CC_FLAGS =3D -D CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> +!endif
>
>    #
>    # Disable deprecated APIs.
> @@ -1045,6 +1051,7 @@
>    }
>  !endif
>
> +
>    #
>    # TPM support
>    #
> diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoot=
Lib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> index 73719f3b96..4c9bc8ab4a 100644
> --- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> +++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> @@ -325,7 +325,12 @@ Tcg2MeasureGptTable (
>      }
>
>      DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasureGptTable =
- %r\n", Status));
> +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE

On to the less philosophical. Thank you for starting this
conversation. I do think that this implementation is unideal. These
kinds of configuration decisions should be implemented in the form of
a Pcd. Whether that's a static or dynamic Pcd is a matter of whether
you want to do all the event design of the configuration measurement
to MR0~PCR1 at the same time.

> +  }
> +  if (Tcg2Protocol !=3D NULL) {
> +#else
>    } else if (Tcg2Protocol !=3D NULL) {
> +#endif
>      //
>      // If Tcg2Protocol is installed, then Measure GPT data with this pro=
tocol.
>      //
> @@ -493,7 +498,12 @@ Tcg2MeasurePeImage (
>                             CcEvent
>                             );
>      DEBUG ((DEBUG_INFO, "DxeTpm2MeasureBootHandler - Cc MeasurePeImage -=
 %r\n", Status));
> -  } else if (Tcg2Protocol !=3D NULL) {
> +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> +   }
> +   if (Tcg2Protocol !=3D NULL) {
> +#else
> +   } else if (Tcg2Protocol !=3D NULL) {
> +#endif
>      Status =3D Tcg2Protocol->HashLogExtendEvent (
>                               Tcg2Protocol,
>                               PE_COFF_IMAGE,
> diff --git a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLi=
b.c b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> index 6f287b31fc..b1c6198b4b 100644
> --- a/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> +++ b/SecurityPkg/Library/DxeTpmMeasurementLib/DxeTpmMeasurementLib.c
> @@ -261,7 +261,11 @@ TpmMeasureAndLogData (
>                 HashData,
>                 HashDataLen
>                 );
> +#ifdef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
> +  }
> +#else
>    } else {
> +#endif
>      //
>      // Try to measure using Tpm20 protocol
>      //
> @@ -287,7 +291,9 @@ TpmMeasureAndLogData (
>                   HashDataLen
>                   );
>      }
> +#ifndef CC_MEASUREMENT_AND_TCG2_COEXIST_FEATURE
>    }
> +#endif
>
>    return Status;
>  }
> --
> 2.44.0.291.gc1ea87d7ee-goog
>


--
-Dionna Glaze, PhD (she/her)
