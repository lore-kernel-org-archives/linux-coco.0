Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2541A80
	for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062423; cv=none; b=D90H+5xOgtAJTGugG4vaztG067Mpi+M3rL4G4PgNzjfMtd0se1JT2z5UJ/bQZ2YaxAOJXQRj0GhyY6JdoSGk4FBL4J/dwQqn57IDuJvshIZD1d5eLvJ3DO9Hni36IpTrQH9RbAEHr1qe93cbMIuA4GhgKeEgYt8473uKX2g9Ojo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062423; c=relaxed/simple;
	bh=ho9oQn7t4oDhLOOdVuXLRab2tfDu9eCXOaLc0WoTS9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhbsm3ebDH3IFeXKWoAsX0UHrIwI9DpAZNWg/NJ5xikIVVzs0OJDtLlC2qOfgU/WiFYsU5WgXJ2ip6kBkl1J6eNvTkQFQ5LuqbGfaPcy8G2RAcbpfRz4R97PBhuWFP80iui4HFUinCMHc9GiP1Yb+YYt/PVpYnvaeb6muxnKdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UwDkKltM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UwDkKltM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-207115e3056so36455335ad.2
        for <linux-coco@lists.linux.dev>; Wed, 11 Sep 2024 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726062421; x=1726667221; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt/M1JptLmddoUeUh/7A4/FrbLaTniu1lQms6Pg4KcU=;
        b=UwDkKltMaA0nSknj92D6fYMZb6HND3Mh6QUE5wEIrSrrFE9OokcwGtoKAaLBeSImpF
         neTtol4pH+zKbsm2vKU9ad6dxJgIKP7BZPW40G9xnY/Rpym+db8dKK38FEqPvmpknXSV
         3BiQq2O/7S9+GGVDOOoqC+nSNFS7Ze7kD8OLu5WCSJTntl1zQwS6GImYnsSLVa5dGFPw
         /WWuSQg5PjIv12Zlm7O8uYTGhIVS5DLqUysVBvj4dQkxYhOR6tSVEiWYbuMCY5ociPpG
         1Et3FLvSafuVzup2khfE8GJIGS0T7nm0tMXus47V2CANQRWcKGQZrsyKbN+DtYShmWOj
         rn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726062421; x=1726667221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt/M1JptLmddoUeUh/7A4/FrbLaTniu1lQms6Pg4KcU=;
        b=S6iCp8bMLq++dNmF/zJ1bYiT5m0v36Zlh/KcLewnC6UhPHW2muha60wzLFHJLS66KE
         45gzP3Mc4l83eqV1FwQDEP12Qx4YBFu7s70t+daQc2fr+hiaq9D/DyXrvuE8hAUWplW/
         shJHDthU41I/LDVpj+vfA8qXAAth8dGyJ6/Dt3nzyxU48tN4OsaQKRNlEqeP2t3uXqzA
         5KLpQt937TNWVST1QaeDs3v7zHiqqYJb/UWiLrZO8wFsHnXnIRBWfBSrPnmssXXQpiPj
         QRpmB30qcRpjUfxR/MuepLKMR1n80OroioTEkGj2YGCDVzmeXBFLDTTKXHCRFa+Qgfin
         fSxg==
X-Forwarded-Encrypted: i=1; AJvYcCWNh5leljkm8rV0vqTz+UuY263Ktll2OeFfV3poCAmAnsx/kljiCWjvtvE8J/mnhA1buEfYIoLpzLgh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4jCAIw4nv7IHyXTLhsPKZNCjid0qkeY5jiGjm6YlN1fI6LJ7z
	LX3snM++vUCK9YEqy+NNXTlHPqFT/C4FKsV16pmROkNCxCJW37PHBjce+bzZqzd8ZXgM4+4fiRx
	U1C50D9Bqaxsbja0nj8mDM5x9ZZRwUHrgztJu6Vs+HyvFj6B5g5ym8ibF2w==
X-Google-Smtp-Source: AGHT+IHWZafcxSnUn22lziE17wSn2AOoweP+lq5JT/3sniDrzP5zAwgMF2Mygr61bRdUtWNqOrxru23oQ9kP2brBLFQ=
X-Received: by 2002:a17:902:d502:b0:207:13a3:a896 with SMTP id
 d9443c01a7336-2074c63033emr71588075ad.23.1726062420932; Wed, 11 Sep 2024
 06:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240907-tsm-rtmr-v1-0-12fc4d43d4e7@intel.com>
 <20240910170959.GA213064@myrica> <f6b0a1d2-c730-4b20-a8f3-afd9a7cf822a@intel.com>
 <14fc2ce22d224f05f4d382cd22f5242297e9fb86.camel@HansenPartnership.com>
In-Reply-To: <14fc2ce22d224f05f4d382cd22f5242297e9fb86.camel@HansenPartnership.com>
From: Qinkun Bao <qinkun@google.com>
Date: Wed, 11 Sep 2024 21:46:48 +0800
Message-ID: <CAOjUGWfgYoXBzUB8wFvO5LDq+=t7hAEksu0EA4Dc7FwbmUJp7A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] tsm: Unified Measurement Register ABI for TVMs
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: "Xing, Cedric" <cedric.xing@intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Dan Williams <dan.j.williams@intel.com>, Samuel Ortiz <sameo@rivosinc.com>, 
	Lukas Wunner <lukas@wunner.de>, Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Mikko Ylinen <mikko.ylinen@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, suzuki.poulose@arm.com, sami.mujawar@arm.com, 
	Chong Cai <chongc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 8:06=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Tue, 2024-09-10 at 23:01 -0500, Xing, Cedric wrote:
> > On 9/10/2024 12:09 PM, Jean-Philippe Brucker wrote:
> > > Hi Cedric,
> > >
> > > On Sat, Sep 07, 2024 at 11:56:18PM -0500, Cedric Xing wrote:
> > > > Patch 2 introduces event log support for RTMRs, addressing the
> > > > fact that the standalone values of RTMRs, which represent the
> > > > cumulative digests of sequential events, are not fully
> > > > informative on their own.
> > >
> > > Would each event_log include the events that firmware wrote before
> > > Linux?
> >
> > No. The log format proposed here is textual and incompatible with
> > TCG2 log format.
> >
> > The proposed log format is based on the CoCo event log -
> > https://github.com/confidential-containers/guest-components/issues/495
> > .
>
> Given that AMD is planning to use the SVSM-vTPM for post launch
> measurements, not supporting TPMs in any form would make this Intel
> only on x86 and thus not very "unified".  Microsoft also tends to do
> attestations partly via the vTPM in its L1 openHCL component (even for
> TDX) and thus would also have difficulty adopting this proposal.
>

Hi James,

I don't think the patch should be blocked for not supporting the
SVSM-vTPM and it is not an Intel only patch.

1. Not everyone prefers the SVSM-vTPM as it lacks the persistent
storage and does not comply with TCG's TPM specifications. TPM is not
just about the measurement.
Sealing and unsealing data is also a critical functionality for TPM.
Treating thenSVSM-vTPM as a TPM misleads users and disrupts existing
software based on TPMs.
The SVSM-vTPM is not TPM. Just like Javascript is not Java.

2. If our goal is to measure the boot chain and post-launch, the RTMR
is an effective and straightforward method.
We already support RTMR for TDX. For SNP, simulating the RTMRs in SVSM
is very simple while implementing the SVSM-vTPM needs a lot of changes.
The SVSM-vTPM significantly expands the TCB while offering limited
security value enhancements
compared to the RTMR.

3. RTMR as a technology has been adopted widely. It is not an Intel
only technology. The TDX CVMs on Google Cloud already support RTMRs.
The TDX CVMs [1] on
Alibaba Cloud supports RTMR as well. In terms of the attestation verifiers,
the token from Intel ITA [2] and Microsoft Attestation Service [3]
indicate they support RTMRs. The Ubuntu image [4] from Canonical
enables RTMR by default.

Link:
[1] https://www.alibabacloud.com/help/en/ecs/user-guide/build-a-tdx-confide=
ntial-computing-environment
[2] https://docs.trustauthority.intel.com/main/restapi/attestation-v2.html
[3] https://learn.microsoft.com/en-us/azure/attestation/attestation-token-e=
xamples
[4] https://ubuntu.com/blog/deploy-confidential-computing-intel-tdx-ubuntu-=
2404

Thanks,
Qinkun
