Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBAA1E1E1D
	for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742930449; cv=none; b=FnBNLEbLZi6VQRrbGA4MZ14AnpISZTlbs4W2+Y37XdGrAdJwChuKm2MJPps6XOu925ptXL4KjNi4ouGKnRgBc2fZne4MqYGNTbg9BtGSGOkHDiq0wo/k7EyFOSLG34m+/W+5O7yfmSX4xvb1GPZkahHDTFAn6M7rR0RF0z4U1Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742930449; c=relaxed/simple;
	bh=lwSA4M0a/8432Ze+0aESX0bQjrcTRTL0d+4YAm6cDaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljlTCxWdN+IVyV29m9pUzd/tTVOSIsLWIah4zsrJvVE5o61uMJt00xzqve+OvxOnSqKqs+QMx9JXYY3g16uOT8yu/CNBz+Ptm9cmJQWrZBny1+mFBusZTjUgVZMKFEGXxAGPmsvuaGY7OqtSMFbpdps3R3tiv/UOs8pPb7toMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BFOFtxvr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BFOFtxvr"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so1014288266b.2
        for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742930446; x=1743535246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwSA4M0a/8432Ze+0aESX0bQjrcTRTL0d+4YAm6cDaM=;
        b=BFOFtxvrmz8q+/6MuIpTXX5vBgfpanr+epuDKkGTgfCyjZEK1HbhJ2CG8M6LveWaAi
         86hmfLzWiroJupwp2HmkgbvxxO4YiUxpJq0VofTP/BqYkjShrcGgSG3j6rBC4HglTz5x
         1BS4iKkQf+XW5vVdkYLVI6e9B+bAEE64hXNwI9ZbJ9chsjT0q17gHPBPPnNoYV9oKsSW
         OiJIlRWxauZHCWeattuwrhCL+VpUyhdZY916F9heNEzh7qgV6BBdNGHYeQS7SxHesgvK
         drhJYN0ZL1GEYrmAB1jYK67x6VhEQgUQD3d9rNtfkuLpy4x23krqetwF4wlY2JXlJraC
         071Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742930446; x=1743535246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwSA4M0a/8432Ze+0aESX0bQjrcTRTL0d+4YAm6cDaM=;
        b=h75zZeT30WNiJnr98SBYePXNLUHMQ6KyDorsPjl6hNHL4iIZsmhDSNbh18VyiXy/Nr
         WzICHIWLwyN6nl9Xt1tL3BlgpuQKSFQ/QSBd376pd2K11bpG5TmY4y/0bHgPjNdQaVmJ
         jEwtPP1vDDQbLqviWTNjsNcjmIyRu/TyQxWPyD0pWVCN+lACtn5s3+0MaDK77f2uxJEA
         fOoBjXaTVx/ixlKQSqqUkC0v6qMHYE4mVjnxARqoce3FnfErKV7OxhpV5xNxdF8RmAcL
         XLhQ3rcZHRNaZLEdRHxxVq0j6+ne68TmfgUaBWatzvPy3NJcmhYa+YEdiKG08uOYOf01
         K/vQ==
X-Gm-Message-State: AOJu0YybRf9jgjfm4eNxVTbfQrURNavLJ6gd+k01zDYwVS/6rJq3f9Uh
	KqFS5QpoCc7kes/XyjM11xbuT7t5nMbw2yQ3ds952QKMKPvaj0o3ll8SNwGRhT+cPQWWprDF7lR
	bubkWxe1tp4Su8VP3Uncbn9cFBqHzSKHfYg+EixXUelxAQNjk7PqP
X-Gm-Gg: ASbGncs8q/7i+/3gq70KOj9vcj4uBLIAotsYuLPMs59usN+PWWcKX18uHIVrhfWnv0w
	XEcP+oC+vx/ORE0oKL9Enelx+pGyaMTl1sy1mxoJm/ejoy8HUl3Xg+Ynnj6AeDWfn9ftMi7CQz2
	VaW2Q6AWgnB65CuOW2z+GGR1FL
X-Google-Smtp-Source: AGHT+IESyyyJBR4WU72CTAJbtHSc0wcJBK8btafe921IcJVbxf5++yUTQ5v255senu6hmA6YIK+66TkT+qRuDMkQHag=
X-Received: by 2002:a17:907:c5c9:b0:ac4:3d8:2e90 with SMTP id
 a640c23a62f3a-ac403d83d5bmr1543872666b.13.1742930445924; Tue, 25 Mar 2025
 12:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com> <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
In-Reply-To: <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 25 Mar 2025 12:20:33 -0700
X-Gm-Features: AQ5f1JqpuTJGquYsw-alN8uEaAf4faxOcV_Mnjl0dUmZYnBbbzNoklztA3_TJK0
Message-ID: <CAAH4kHZeoFKOsV-ZJ3k6N0H17Vx1-m8mDun7Qt2J9p=uFN+J8A@mail.gmail.com>
Subject: Re: GUIDs in the GHCB and SVSM specifications
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:50=E2=80=AFAM Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
>
> On Wed, Feb 26, 2025 at 2:40=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd=
.com> wrote:
> >
> > All,
> >
> > There has been some talk about how the GUIDs in the GHCB and SVSM
> > specifications should be encoded [1]. The term GUID brings encoding
> > ambiguity with it.
> >
> > - RFC 4122 specifies the format of a GUID/UUID and the encodingas
> > network byte order.
> >
> > - The UEFI specification says that their GUID format is that of RFC
> > 4122, but that the encoding is different. UEFI has time_low, time_mid,
> > and time_hi_and_version as little-endian encoded.
> >
> > Given this, the GHCB and SVSM specifications need to be updated to
> > specify the expected encoding of the GUIDs.
> >
> > The GHCB specification will add that the certificate GUIDs follow RFC
> > 4122 in format and encoding (network byte order). This is based on
> > existing users and tools that have already (likely) been using network
> > byte order.
> >
> > The SVSM specification, however, because support has already been added
> > to the Linux kernel using guid library APIs, will follow RFC 4122 in
> > format with an encoding of time_low, time_mid, and time_hi_and_version
> > as little-endian. In Linux, the guid library APIs are guid_parse(),
> > guid_gen(), etc.
> >
> > If there are no objections, I'll make those changes.
>
> What we know is that the service GUID is in little endian order, but
> what we don't know is if the GUID table of the attest all services
> protocol should be the same as is provided in GHCB (big endian).
> I haven't heard back on the other thread about a more general
> principle that maybe we should follow little-endian in and big-endian
> out at least for GUIDs, since reports still use little endian numbers.
> I'm writing up the implementation of the GUID table serializer right
> now, and it'd be nice to know it can have the same test vectors as the
> GUID table marshaling/unmarshaling code I have in go-sev-guest.
>

I suppose nevermind since the headers are slightly different, the
parsers are incompatible. I'll use little endian.

> >
> > Thanks,
> > Tom
> >
> > [1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r196320100=
9
> >
>
>
> --
> -Dionna Glaze, PhD, CISSP, CCSP (she/her)



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
