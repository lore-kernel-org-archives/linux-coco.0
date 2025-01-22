Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7991B6CE0
	for <linux-coco@lists.linux.dev>; Wed, 22 Jan 2025 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737581397; cv=none; b=LR4N29bxFBV/hnH0JFW4UbsvncX4MRpJfXufEMr8wBHRjj1LZGQ4hX5IXpsMuxTYUuBeXr194wzYdA3ZPt1TZexLPXySNs1vcLmmkmeje37D3fgPaBMSPmwwXCuJWB6mhDd19OaACssxWyB/5hY8hChhuHl0FBUSvK/GxGQZ67M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737581397; c=relaxed/simple;
	bh=zPSSsJeZd9K61Rac126fQ7pKueKdfVs0dP50Mme3eBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIApNbkSqoiR/AIiSNRHqRGI5uthN+7sKbTWqaReuPTwTHm9DPi+SeTwFUTtGGihhI9ZwGnCqmGL1GFu2QvZIeoxEBy1BVxcqVgq1lbUjQ6TyOAoLblaz3J8oc9caR07kCoIS2+3PZQDJ+nC5MB3rkx292703rBTwTF9qsdp9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=md3AeL0n; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="md3AeL0n"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa689a37dd4so46735666b.3
        for <linux-coco@lists.linux.dev>; Wed, 22 Jan 2025 13:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737581394; x=1738186194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPSSsJeZd9K61Rac126fQ7pKueKdfVs0dP50Mme3eBk=;
        b=md3AeL0n0sl/sxzIU6h8+qSnsgh/7b/3OY4fZ3kvSshAFbvGWOiBJyPSuQMf/PN/jl
         gGB7B0pTkRDJqPWsTXBRixxhK0Fc5oP4g2lqdchNBxQa/wS+4hZQIgAhI9nt48sElAMW
         pdFd+Iv/16swQNRWKNL6qvTz1kHdUrb9ZXyezKPXNxonJQ/KVX9t0rqY2TMJqg4EFVwa
         1Ag4r9bf6giJrnoFTVLMCTe274vN1VX3YXMfXZaXYRBBMg7V6z6kVwmAJD9so5mcXZct
         887m/PkjAv7kShYug+TNWvWEB4xoC9+oN+byGqLwVoCGlVrStRl/EJT7sdXCYewyBDNn
         GZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737581394; x=1738186194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPSSsJeZd9K61Rac126fQ7pKueKdfVs0dP50Mme3eBk=;
        b=cZpw82h2zxTgknLW055/LGMdC83qKkK133GkfDTtJNqCHo5nzM81s1i9C/BsjyLTzl
         YjYObqzYXUI9fqJi8zp1Zjl/heOUU/Th1GkCxp4kXIN2bOlbHCXkzgqzoxjPC8s3qPtZ
         6lcCZb7W0E2hPa/VrpvUyU/HDFSWUHE2O0MnSz1N8wws3E/3eaa5EXtsKHxFZAH6BNU5
         P3ciBtpMQoWy6N3SieFhfZyX//sDPKhQG3AmzwKmFzjoCoCkib8ZC1A1G5p0sBsX3Y1U
         b1pQUP41fSWaoYPLC8hDIRg38AFCvVZ/kCPTHJHh6Wv/yCqBZi00y0x8KwSq9xLHD9LG
         5KXA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+sV6bFKx6DFe81OPn8BFTf27DVhLKX4wir6KHITuHReYAAUtVRuSmGwgu28QNu602/USUXNP/M5T@lists.linux.dev
X-Gm-Message-State: AOJu0YwcfyuQsScb5a7TmA70MAuy4xbNvod4FO0HFuNeAFgYxxXc03R5
	Z7iOJzJC08yTY8QQm0zlrKVcMjgiSbOhIa7Y/RTCs+MjBjtbOiC2eLGSpCMfpzqbbWtMVB4YxaF
	YQwwcSC1VtixLMqPHvZRhV1j+k8dAs70mfrqI
X-Gm-Gg: ASbGncu46iCwd5XbW96Q8ZoxkUVv4157KBZkBb+CzKus/UDbW6TVRIT4bH8fIVr2iDb
	WLs7JU//8rQ137GukT7nb3Sqc42CWl187ImS6RVhnmzJrcKu/+zNF+oVSlc1B2lIHZkmcKsrGcA
	UkwQ==
X-Google-Smtp-Source: AGHT+IG3800wXK57ZgJEoNJZD9NN8RKbiZQdhoDJpPk0SsgyWjH5F5LmlEVuZc6zBh0UypRcCRSsvwsaI9kjNMi9qgk=
X-Received: by 2002:a17:907:7b9c:b0:aae:ce4c:ca40 with SMTP id
 a640c23a62f3a-ab38b2e737cmr2209361766b.32.1737581393723; Wed, 22 Jan 2025
 13:29:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241210143423.101774-1-sgarzare@redhat.com> <20241210143423.101774-4-sgarzare@redhat.com>
 <20241210144025.GG1888283@ziepe.ca> <50a2e1d29b065498146f459035e447851a518d1a.camel@HansenPartnership.com>
 <20241210150413.GI1888283@ziepe.ca> <CAGxU2F6yzqb0o_pQDakBbCj3RdKy_XfZfzGsiywnYL65g6WeGg@mail.gmail.com>
 <20241211150048.GJ1888283@ziepe.ca> <CAGxU2F7QjQTnXsqYeKc0q03SQCoW+BHbej9Q2Z8gxbgu-3O2fA@mail.gmail.com>
 <D6FSHG5Z9UJQ.CWQTAANBVIQQ@iki.fi> <6rwo7tkdst227kb4pwvr54w4mfz2zw3offux7mqfupi3rgwkaz@65yklvvqw6n4>
 <CAGxU2F4YQy-otsGtGiUHDiL7PGXic2_HzWL_+GHkn+Hs_ScGpQ@mail.gmail.com>
 <D725TPWOVBUL.1DJAOZ0QL0RNH@kernel.org> <D725V628UV87.31SUEYVF9IUUC@kernel.org>
 <D726DAWHLOGW.3TR2LCJ936OG7@kernel.org>
In-Reply-To: <D726DAWHLOGW.3TR2LCJ936OG7@kernel.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 22 Jan 2025 13:29:42 -0800
X-Gm-Features: AbW1kvafwXI9IVMNRZ_87L98h-hcqR15uzBbb_GR-HQyCarswSAe-qgXejxD7HM
Message-ID: <CAAH4kHYy7=OZsHnOBiQug0Y__bNHt6i+bop0xaxQjpWQ6aQr1Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/sev: add a SVSM vTPM platform device
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>, Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, 
	Jason Gunthorpe <jgg@ziepe.ca>, James Bottomley <james.bottomley@hansenpartnership.com>, 
	linux-coco@lists.linux.dev, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-integrity@vger.kernel.org, x86@kernel.org, 
	Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 3:12=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Wed Jan 15, 2025 at 12:48 AM EET, Jarkko Sakkinen wrote:
> > On Wed Jan 15, 2025 at 12:46 AM EET, Jarkko Sakkinen wrote:
> > > On Tue Jan 14, 2025 at 12:42 PM EET, Stefano Garzarella wrote:
> > > > Hi Jarkko,
> > > >
> > > > On Thu, 19 Dec 2024 at 17:07, Stefano Garzarella <sgarzare@redhat.c=
om> wrote:
> > > > >
> > > > > On Thu, Dec 19, 2024 at 05:40:58PM +0200, Jarkko Sakkinen wrote:
> > > > > >On Thu Dec 19, 2024 at 5:35 PM EET, Stefano Garzarella wrote:
> > > > > >> So to use them directly in sev, we would have to move these de=
finitions
> > > > > >> into include/linux/tpm.h or some other file in inlcude/. Is th=
is
> > > > > >> acceptable for TPM maintainers?
> > > > > >
> > > > > >There's only me.
> > > > > >
> > > > > >I don't know.
> > > > > >
> > > > > >What you want to put to include/linux/tpm.h anyway?
> > > > >
> > > > > At least tpmm_chip_alloc(), tpm2_probe(), and tpm_chip_register()
> > > > >
> > > > > >I have not followed this discussion.
> > > > >
> > > > > Let me try to summarize what we are doing: We are writing a small=
 TPM
> > > > > driver to support AMD SEV-SNP SVSM. Basically SVSM defines some s=
ort of
> > > > > hypercalls, which the guest OS can call to talk to the emulated v=
TPM.
> > > > >
> > > > > In the current version of this series, based on James' RFC, we ha=
ve an
> > > > > intermediate module (tpm_platform) and then another small driver
> > > > > (platform_device) in arch/x86/coco/sev/core.c that registers the
> > > > > callback to use.
> > > > >
> > > > > To avoid the intermediate driver (Jason correct me if I misunders=
tood),
> > > > > we want to register the `tpm_chip` with its `tpm_class_ops` direc=
tly in
> > > > > arch/x86/coco/sev/core.c where it's easy to use "SVSM calls" (i.e=
.
> > > > > svsm_perform_call_protocol()).
> > > > >
> > > > > And here I have this problem, so I was proposing to expose these =
APIs.
> > > > > BTW, we do have an alternative though that I proposed in the prev=
ious
> > > > > email that might avoid this.
> > > >
> > > > Any thought on this?
> > >
> > > A redundant super low-quality TPM stack driver implemtation to suppor=
t
> > > only single vendor's vTPM with speculative generalization.
> > >
> > > It's a formula for destruction really.
> > >
> > > I don't know if I event want to comment on this. Figure out a better
> > > solution I guess that works together sound with existing stack.
> > >
> > > If that helps we could make the main TPM driver only Y/N (instead of
> > > tristate).
> >
> > Also e.g. James' hmac encryption: not a single bug fixed by the author,
> > which does further reduce my ability to have any possible trust on this=
.
> >
> > I do care quality over features, sorry.
>
> One more rant.
>
> It's engineering problem to find **a fit** for the existing art. For
> You can set the constraint here as "no two TPM stacks".
>
> I know also almost nothing about SVSM. E.g. I don't understand why a
> vTPM cannot be seen as fTPM by the guest, and why this needs user
> space exported device (please do not answer here, do a better job
> instead).

I can appreciate this viewpoint. It even surfaced Microsoft's fTPM
paper to me, which solves some interesting problems we need to solve
in SVSM too. So thanks for that.

Just to clarify, you're not asking for SVSM to implement the TIS-MMIO
interface instead, but rather to use the fTPM stack, which could make
SVSM calls a TEE device operation?

>
> Even if I wanted to say how this should be changed, I could not
> because it too far away to make any possible sense to begin with.
> And I don't want to take the risk of those words being used as an
> argument later on, when I don't even know what I'm looking.
>
> BR, Jarkko
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
