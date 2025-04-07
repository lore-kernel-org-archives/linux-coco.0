Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA6217F55
	for <linux-coco@lists.linux.dev>; Mon,  7 Apr 2025 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048588; cv=none; b=K1u4Yf2PqNnRFk9JrU39iOU/VCMC1kbtPOxB0bvKnYJrE5vB11vfMY+OEozPnLEiRFju+MLi8tDKEN+JsMB5vly6kAORudcjH/obl/5A9AiJ/0tyeZmWRV1TRP5MAwtyZMqW8qmvDNdmV84C8LuLf5KKCpEEA67l0m7Lktsh5I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048588; c=relaxed/simple;
	bh=a+denYy/Js8Xzsi3XahxAPP4yhCPLhviXBk6Dhc/bTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrDTHJvycfpScvYmEP4ACTYZLD0xU92JJtUjlLQV1CyTwIANORt0vrnZ3WFOG2xslIV98GH/u3bO2Xsev36yM1sa967FMXK6QqfBjEf2ASs1SRRntm8BDsvIiFk5WJbNvmvqJyLnOXZU1xKPTiFFkwAoepIjmlxvYZV4GiBeCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h01GHzqg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h01GHzqg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25520a289so818244966b.3
        for <linux-coco@lists.linux.dev>; Mon, 07 Apr 2025 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744048584; x=1744653384; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zc8e32MeJR0IsW1VVZwlZTwALeWB0qEwQUaI9pDFqo=;
        b=h01GHzqgtha4Ulsp1qnSeZvUBEuwnE5aFbQVDcpsaYZkY0js/E9UDY1gUl8X9fSX2U
         qsN3MoaT1xoRml27VTLMiPQ4b8LgIyAFKasZajWCrQauPVyW7gb69xHIApEZ0O70t+WM
         zJEfdZ9LW/oAP5NtmkKVuUXMC0AlgjWdDvhYTsrF5+ipnN1yo1soixVTi5vA5cpUVlY6
         Va7c7N7J4I+55qWY6h037e/88nTZpjkq93hOT/aUsvQ0xVFGIYpGSe0b+Lbs5VnCMUAq
         l+lI91w9+ww/1LeZCCb3q1KB335l0c/8/a54Z7MU3nvtgOhIvlxw6jC25GF/VXNZyifh
         LryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744048584; x=1744653384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Zc8e32MeJR0IsW1VVZwlZTwALeWB0qEwQUaI9pDFqo=;
        b=DQ06OyLpQ+KXZ10VboJje0rekaP6lYnxCXz2wSnIca6uak/o9YjJ/2peJHysgkFsOQ
         8sVZV+W22SAG3Z9SqG0d0rNc5W1GuCKhsqYj6L/yY4BYwmXYSEG133BmJUKJ19i7msBk
         XsTtumySFK24rnCT333qT7Kd3nyt7vpufUChY6ba5ig0FnSg15zLrvRIIkLjo6h6ws85
         FovaPsnbJfnU7h3337T1sX2+JlUfquGjIzeqMAMJV66GKccB+gNpNiONtHjv7MVLUJl3
         lpdiM724Mm86SO1d5UWxv/YhJP3qgfV/KfyxubR/HGtqQS8Em6/B4BsVUSQogfjNsKmA
         n1iw==
X-Forwarded-Encrypted: i=1; AJvYcCWLI6yClF4i65l5uoSoeXv2Bb3jvvzSAXw9xd/cyGJXZyaE/IgckPHJdN6L0TywH3Jb5WLHjdL8zpqy@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7vCuZLMp66z/8VwARUw4bgPQ66dRnf7tFtCI03h5H7LMJavv8
	qYveyjA0b/qXKd39uYlaOCD5Nq2GPU/pcrtbVkhHIFRLMN/3tPzw/3p0gEpAx3siue+wmGVvSYg
	5eI07tZt0pov12sEC5WpHlS8gKQa4aZuwaE2fQNNegi3sJ2/6nwk3
X-Gm-Gg: ASbGncvdOfkZwt0yV07ZLX0lmTKHEZNq2iNGgyOap/+jtFWmsru1AtTFJJNS+qynbXe
	RZZVgrNwgJIueoGF8cg9MxYb/ocxo72k+Ti2ZiDKjUKbIlgg/GqY5JyZwI7O6U3zNqibrs90i1M
	3hf6McV8mFos/V5SFIt636Ibt9AQ==
X-Google-Smtp-Source: AGHT+IH/EOt2wEdAwd4d7niOoZs1LZtDtEzH88irCXROb6d/RS3Z1Nc1LyNK/7wnsx/232dcxgZI2wGr6JrFD6/gDM0=
X-Received: by 2002:a17:907:1ca8:b0:ac1:fa91:2b98 with SMTP id
 a640c23a62f3a-ac7d6d00dafmr1264481166b.14.1744048584004; Mon, 07 Apr 2025
 10:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHZg_f--LJhw0zu9bYe87ozQX1jgxhQwJS+-=g0-u0DZTQ@mail.gmail.com>
 <447a8b1cdf7ede36a14fd9c0bf061885adf868b3.camel@HansenPartnership.com>
 <9f2236e99150814f64f444aff2d3edee495483a8.camel@ibm.com> <CAAH4kHaP6n-n=X=zDxonqhv2tZRjycS3R0XBX-FZv6tS7xn_hQ@mail.gmail.com>
 <CAH6wD8X9ttrnt5rTTx8paDiWeBOnZZCgWsEiDHctLqgz5GZucw@mail.gmail.com>
 <c17b2eee63c5c16305d2a8b9aa8e451134718cdf.camel@HansenPartnership.com>
 <CAAH4kHZe1S1ErOoqX7E6qVr9ofTf15_3zyEh3-xjufcksAkiGQ@mail.gmail.com>
 <CAAH4kHYdy6bovpA=M5gYfp-K_rBC2Hz_r-tHg_XdEJ9uEc5wMw@mail.gmail.com>
 <CAH6wD8WEqn4XyefQXBYyTT_W6g6mE5GOhcp25BxpwJz_bgmZ1A@mail.gmail.com>
 <CAAH4kHZoqppd7MgJTzd1rCP4Oo_xS=s+JKQ8QEWvXFTw81mciQ@mail.gmail.com> <CAAH4kHbPbwQ8XE9pnjQRy28gnfn2a5W_h6EsmX-+r-Cw_fpAaA@mail.gmail.com>
In-Reply-To: <CAAH4kHbPbwQ8XE9pnjQRy28gnfn2a5W_h6EsmX-+r-Cw_fpAaA@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 7 Apr 2025 10:56:12 -0700
X-Gm-Features: ATxdqUH-6KVqfM1q_U1T0JO6bGiv5S1jk3ToaDNrwX9xbTjIx_ZN0fTYDJtaxX0
Message-ID: <CAAH4kHa3A4x+nAew7hdFdJ9ABDc1nikT=HLs79iyX7FAqvv+DQ@mail.gmail.com>
Subject: Re: [svsm-devel] vTPM service attestation format update
To: Geoffrey Ndu <gndu8086@gmail.com>, linux-coco@lists.linux.dev
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudio Siqueira de Carvalho <cclaudio@ibm.com>, 
	"svsm-devel@coconut-svsm.dev" <svsm-devel@coconut-svsm.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reposting to linux-coco for reach, since this doesn't just concern the
Coconut-SVSM project, but the specification for SVSM. The spec
addition, if accepted, will lead to a new attribute in
configfs-tsm-report: manifest_selector.

>
> Here is my full proposal to match the implementation in PR #662
>
> Table 10: Attestation Protocol Services
> | Call ID | First version Supported | Name | Function |
> ---
> -| 0 | 1 | SVSM_ATTEST_SERVICES | Retrieve an attestation report for
> all SVSM services (e.g. vTPM, etc.). |
> +| 0 | 1 | SVSM_ATTEST_SERVICES | Retrieve an attestation report for
> all SVSM services (e.g., vTPM, etc.). |
> -| 1 | 1 | SVSM_ATTEST_SINGLE_SERVICE | Retrieve an attestation report
> for a single SVSM service |
> +| 1 | 1 | SVSM_ATTEST_SINGLE_SERVICE | Retrieve an attestation report
> for a single SVSM service. |
> +| 2 | 2 | SVSM_ATTEST_SINGLE_SERVICE_EX | Retrieve an attestation
> report for a single SVSM service with given selection criteria. |
>
> ## SVSM_ATTEST_SINGLE_SERVICE Call
>
> ...
> -| RCX | 8 | 8 | In | gPA of the attestation services operation
> structure, see Table 11: Attest Services Operation |
> +| RCX | 8 | 8 | In | gPA of the attest single service operation
> structure, see Table 13: Attest  Single Service Operation |
>
> +## SVSM_ATTEST_SINGLE_SERVICE_EX Call
> +
> +This call is used to request a VMPL0 attestation report that includes
> a service manifest for the specified service that is running in the
> SVSM as part of the report data.
> +
> +| Register | Size (Bytes) | Alignment (Bytes) | In/Out | Description |
> +---
> +| RAX | 4 |  | Out | Result value |
> +| RCX | 8 | 8 | In | gPA of the attest single service ex operation
> structure, see Table 14: Attest Single Service Ex Operation |
> +| RCX | 8 |  | Out | Service manifest size (in bytes) |
> +| RDX | 8 |  | Out | Certificate data size (in bytes) |
> +| R8 | 8 |  | Out | Attestation report size (in bytes) |
> +
> +The inputs associated with the attest single service ex call are
> specified according to the format of the following table.
> +
> +| Byte Offset | Size (Bytes) | Alignment (Bytes) | Meaning |
> +| 0x000 | 8 | 4 KB | Attestation report buffer gPA |
> +| 0x008 | 4 |  | Attestation report buffer size (in bytes) |
> +| 0x00C | 4 |  | RESERVED =E2=80=93 MBZ |
> +| 0x010 | 8 |  | Nonce gPA |
> +| 0x018 | 2 |  | Nonce size (in bytes) |
> +| 0x01A | 6 |  | Reserved |
> +| 0x020 | 8 | 4 KB | Service manifest buffer gPA |
> +| 0x028 | 4 |  | Service manifest buffer size (in bytes) |
> +| 0x02C | 4 |  | RESERVED =E2=80=93 MBZ |
> +| 0x030 | 8 | 4 KB | Certificate data buffer gPA |
> +| 0x038 | 4 |  | Certificate data buffer size (in bytes) |
> +| 0x03C | 4 |  | RESERVED =E2=80=93 MBZ |
> +| 0x040 | 16  |  | GUID of service to attest |
> +| 0x050 | 4 |  | Requested manifest version |
> +| 0x054 | 4 |  | RESERVED =E2=80=93 MBZ |
> +| 0x058 | 8 |  | Manifest selector data buffer gPA |
> +| 0x060 | 4 |  | Manifest selector data buffer size (in bytes) |
> +| 0x064 | 4 |  | RESERVED =E2=80=93 MBZ |
> +{#tbl-attest-single-service-ex-op Attest Single Service Ex Operation}
> +
> +The attest single service operation ex structure must not cross a 4
> KB boundary.
> +If the gPA of the structure is such that the structure crosses a 4 KB
> boundary, the call will return SVSM_ERR_INVALID_PARAMETER.
> +
> +The attestation report buffer will be treated as physically
> contiguous in the guest address space if the buffer size is greater
> than 4 KB.
> +
> +The nonce must not cross a 4 KB boundary.
> + If the nonce crosses a 4 KB boundary, the call will return
> SVSM_ERR_INVALID_PARAMETER.
> +
> +The service manifest buffer will be treated as physically contiguous
> in the guest address space if the buffer size is greater than 4 KB.
> +
> +The certificate data buffer is optional.
> +Its presence is indicated by setting the certificate data buffer size
> to a non-0 value.
> +If the certificate data buffer length is non-0, the certificate data
> buffer will be treated as physically contiguous in the guest address
> space if the buffer size is greater than 4 KB.
> +
> +The manifest selector data buffer is optional.
> +Its present is indicated by setting the manifest selector data buffer
> size to a non-0 value.
> +If the manifest selector data buffer length is non-0, the manifest
> selector data buffer will be treated as physically contiguous is the
> guest address space if the buffer crosses the 4 KB page boundary.
> +If the manifest selector data buffer size is 0, the result must be
> the same as returned from SVSM_ATTEST_SINGLE_SERVICE.
> +
> +All gPA values must not be gPA values that are assigned to the SVSM itse=
lf.
> +If the SVSM detects that the guest is specifying an address that is
> assigned to the SVSM, the call will return SVSM_ERR_INVALID_ADDRESS.
> +
> +The GUID of the service to be attested needs to be an available
> service of the SVSM.
> +If the requested service is not available, the call will return
> SVSM_ERR_INVALID_PARAMETER.
> +
> +The SVSM service must support the version of the manifest requested.
> +If the requested manifest version is not supported, the call will
> return SVSM_ERR_INVALID_PARAMETER.
> +
> +The SVSM will assemble a service manifest optionally using selection
> criteria it interprets from the manifest selector data buffer.
> +The format of the manifest selector is determined by the service
> named by the service GUID.
> +If the service is not able to interpret the contents of the manifest,
> the call will return a protocol error greater than 0x8000_1000.
> +
> +The service will produce a descriptive manifest in a service-defined for=
mat.
> +If the size of the assembled service manifest exceeds the size of the
> supplied service manifest buffer, RCX will be set to the size of the
> service manifest (in bytes) and the call will return
> SVSM_ERR_INVALID_PARAMETER.
> +If the manifest selector data buffer size is 0, the Input REPORT_DATA
> supplied on the SNP attestation request will be the SHA-512 digest of
> the input nonce and the service manifest, SHA-512(Nonce || Service
> Manifest).
> +If the manifest selector data buffer size is non-0, the Input
> REPORT_DATA supplied on the SNP attestation request will be the
> SHA-512 digest of the input nonce, the selector context, and the
> service manifest, SHA-512(Nonce || Selector Context || Service
> Manifest).
> +The selector context is defined as
> +
> +| Byte offset | Size (in bytes) | Description |
> +| 0x000 | 4 | The signature number 0x324D5353 (SSM2 in little endian
> ASCII, for single service manifest 2). |
> +| 0x004 | 16 | GUID of attested service in mixed endian format. |
> +| 0x014 | 4 | The manifest version in little endian format. |
> +| 0x018 | variable | The manifest selector data buffer. |
> +
> +The input VMPL supplied on the SNP attestation request will be 0.
> +
> +If a certificate data buffer was provided and if the size of the
> certificate data from the hypervisor exceeds the size of the supplied
> certificate data buffer, RCX will be set to the size of the services
> manifest and RDX will be set to the size of the certificate data (in
> bytes) and the call will return SVSM_ERR_INVALID_PARAMETER.
> +If the size of the SNP attestation report exceeds the size of the
> supplied attestation report buffer, RCX will be set to the size of the
> services manifest, RDX will be set to the size of the certificate data
> (in bytes, if a certificate buffer was supplied) and R8 will be set to
> the size of the attestation report (in bytes) and the call will return
> SVSM_ERR_INVALID_PARAMETER.
> +Upon successful completion of the SNP attestation request, the
> attestation report will be copied to the input attestation report
> buffer gPA, the service manifest will be copied to the input service
> manifest buffer gPA, RCX will be set to the size of the service
> manifest, if a certificate data buffer was provided, the certificate
> data will be copied to the input certificate data buffer gPA and RDX
> will be set to the size of the certificate data.
> +Should the SNP attestation request fail, RAX will be set to 0x8000_1000.
>
> Please note the context format ordering is different than previously prop=
osed.
> The manifest selector context is NOT added to REPORT_DATA if no
> manifest selector is given.
> The new call should be a strict superset of ATTEST_SINGLE_SERVICE behavio=
r.
>
> ...vTPM section...
>
> +### SVSM_ATTEST_SINGLE_SERVICE_EX Manifest Selector
> +
> +#### Manifest version 0
> +
> +The format of the manifest selector is as follows
> +
> +| Byte offset | Size (in bytes) | Description |
> +| 0x000 | 8 | Selector kind (see table vTPM manifest selectors) |
> +| 0x008 | variable | Data structure determined by the selector kind |
> +
> +| Selector kind | Selector data |
> +| 0x0000_0000_0000_0001 | TPMT_PUBLIC for the template input of
> CreatePrimary command. |
> +{#tbl-vtpm-selector-kind Supported kinds of manifest selectors }
> +
> +For selector kind 1, if the manifest selector data buffer size
> exceeds 65543, the call will return 0x8000_1001.
> +The TPMT_PUBLIC value will be used in a TPM_CC_CREATEPRIMARY command
> constructed as follows
> +
> +h'8002' || COMMAND_SIZE ||
> h'000001314000000B00000009400000090000010000000400000000' ||
> PUBLIC_SIZE || TPMT_PUBLIC || h'000000000000'
> +
> +Where TPMT_PUBLIC is the manifest selector data buffer without the
> first 8 bytes, PUBLIC_SIZE is the 16-bit big endian representation of
> manifest selector data buffer size minus 8, and COMMAND_SIZE is the
> 32-bit big endian representation of the TPM command length, i.e.,
> manifest data buffer size plus 33.
> +
> +If the TPM has not been powered on, the call will return
> SVSM_ERR_INVALID_REQUEST.
> +If the TPM response is lost or too large for the SVSM, then the call
> will return SVSM_ERR_INVALID_REQUEST.
> +If the constructed TPM command length exceeds the maximum size, the
> call will return 0x8000_1001.
> +
> +If the TPM command result code RC is non-0, the call will return
> 0x8000_1100 + RC.
> +If the TPM command result code is 0, the vTPM manifest (see \ref{vTPM
> Service Manifest Data Structure}) will contain the TPMT_PUBLIC
> represented in the command response.
>
> The strange number 65543 is 2^16+7 to account for the 8 byte header
> before the manifest selector and the maximum representable
> TPM2B_PUBLIC, which is the combination of PUBLIC_SIZE and TPMT_PUBLIC.
>
> On Fri, Mar 28, 2025 at 9:02=E2=80=AFAM Dionna Amalie Glaze
> <dionnaglaze@google.com> wrote:
> >
> > On Thu, Mar 27, 2025 at 4:37=E2=80=AFAM Geoffrey Ndu <gndu8086@gmail.co=
m> wrote:
> > >
> > > I believe it would be helpful to add the error code as a read-only
> > > attribute in configfs
> > >
> >
> > After closer inspection, I think that we should probably generalize
> > this to report the svsm protocol error.
> > For vTPM, then, we'd want to reserve perhaps the first 256 numbers for
> > administrative errors for the service, but then use the rest for the
> > TPM_RC.
> > Adding the TPM_RC to PROTOCOL_BASE + 0x100 will not overflow the 32
> > bits for the error code since the top 20 bits are specified to be 0.
> > So I'll add a service_error attribute to tsm/report. Given the way
> > tsm_report_state is separated from tsm_report, it will be ugly to add
> > the administrative fields back in to limit the visibility to equal
> > read/write generations, so I'll just make it available if SVSM is
> > available.
> >
> > > Geoffrey
> > >
> > > On Wed, Mar 26, 2025 at 9:02=E2=80=AFPM Dionna Amalie Glaze
> > > <dionnaglaze@google.com> wrote:
> > > >
> > > > As the selector is used to drive a create_primary command, it's
> > > > possible for the command to fail before getting to the attestation
> > > > report creation.
> > > > If this svsm attestation report fails with invalid_parameter, then
> > > > sev-guest will retry in a loop thinking the only way for the reques=
t
> > > > to fail is due to output buffer sizes being wrong.
> > > >
> > > > I think in addition to the selector address and length, I'll use th=
e
> > > > would-be-reserved 4 following bytes for an error code related to th=
e
> > > > selector.  If this is set, then the attestation should not be retri=
ed.
> > > > Does it make sense to add the error code as a RO configfs attribute=
?
> > > > We can make it visible only if the write generation is the same as =
the
> > > > generation it was when the error code was recorded.
> > > >
> > > > On Fri, Mar 7, 2025 at 9:51=E2=80=AFAM Dionna Amalie Glaze
> > > > <dionnaglaze@google.com> wrote:
> > > > >
> > > > > On Fri, Mar 7, 2025 at 6:24=E2=80=AFAM James Bottomley
> > > > > <James.Bottomley@hansenpartnership.com> wrote:
> > > > > >
> > > > > > On Fri, 2025-03-07 at 11:48 +0000, Geoffrey Ndu wrote:
> > > > > > > Since the single_service_manifest call for the vTPM effective=
ly
> > > > > > > certifies EKs, why don=E2=80=99t the =E2=80=9Cselector=E2=80=
=9D be the handle values for EK
> > > > > > > certificates, as specified by the TCG in 2.2.2.5.1 of =E2=80=
=9CTCG EK
> > > > > > > Credential Profile For TPM Family 2.0; Level 0=E2=80=9D? This=
 approach would
> > > > > > > simplify the user experience, as every SVSM would function
> > > > > > > identically, and  SVSM vTPMs would exhibit analogous behaviou=
r to
> > > > > > > physical TPMs.
> > > > > >
> > > > > > Because to make life easier we might want to short circuit the =
EK/AK
> > > > > > makecredential/activatecredential round trip and simply constru=
ct a
> > > > > > signing EK to use in place of an arbitrary AK.  Then to make th=
e
> > > > > > signing EK easily useful, we might want it not to have a policy
> > > > > > statement tying it to the endorsement hierarchy password (parti=
cularly
> > > > > > as we know that will be empty).  To allow this type of thing we=
 need to
> > > > > > allow flexibility in the EK creation which isn't listed in the =
TCG
> > > > > > profile EK templates.
> > > > > >
> > > > >
> > > > > I have local changes to tpm-rs that I haven't pushed to make this
> > > > > commit work on its own, but this is what I'm prototyping.
> > > > >
> > > > > https://github.com/coconut-svsm/svsm/commit/db1ad6018b04b995e0278=
455eb2f9a66569cbcc9
> > > > >
> > > > > > Regards,
> > > > > >
> > > > > > James
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > -Dionna Glaze, PhD, CISSP, CCSP (she/her)
> > > >
> > > >
> > > >
> > > > --
> > > > -Dionna Glaze, PhD, CISSP, CCSP (she/her)
> >
> >
> >
> > --
> > -Dionna Glaze, PhD, CISSP, CCSP (she/her)
>
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
