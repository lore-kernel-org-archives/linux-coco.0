Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A611F3FF1
	for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928674; cv=none; b=hKpz1FjC3r2SxOqwMMMVIlDcBtl+at+T8thUq3U4fJO3hXGy6zXsrLV971esRkWeoup+F8VTYyjkO5Iu2ytfL3BwP6/PWat+mX74Dm+nwjphm7Dq2op1N/pZXCIXkDwzg8Cw/0rhaI532yGlCmmVt0yA/W69oc39Oyv1aAahQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928674; c=relaxed/simple;
	bh=RW9FEkNvOGypF+at2s9ctuj3s+TWHqjoYBpJnWAqH6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAj3TES9kY34A/96+/XYZZX3hPgnkNWQGji1Z4T0qHGD8k20E4i60FSHAut+ia+l1xLMUQ089N64FNixWVZsPSOE8IXSovku+vdAjA+41Ph5ahbyAl5WR+ZC8EX/moJ2d8/hjQtZSeNSNR26JPaTZnGk5v21jI1sljpKIWZN8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udF4duw8; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udF4duw8"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab771575040so25728466b.1
        for <linux-coco@lists.linux.dev>; Tue, 25 Mar 2025 11:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742928671; x=1743533471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RW9FEkNvOGypF+at2s9ctuj3s+TWHqjoYBpJnWAqH6g=;
        b=udF4duw88OV2PGbvEAPGtXO2ndz4Gjg+Y5aLh+Dl71bug5UcB2FhxilDWx8qwvLE+0
         tdfNc1Q3U3ppdq7TtgBwbQ8eXpX6zXBmaw/EDfwX1TRzKS+2+qIn18ILscLM9Rex34FC
         5MpaOSgf90Uis6xTuIvYgQC5XSi+g92a2YGKb1RDeaM/EKEVAga7WzOYJePnS5o2w7CP
         Zm3Xj6bvXGFj+GgenxZEgNOCUMvItzwZ84dXT8Yw142bFKBA4RxDQX8M5J0/MW8vSnfD
         B+gyx1aASNC4Ci74rDnCqjeG9BbFCvjXv2j8sXbMH4Wp7/NULbkq3l4pEyCPC5I+jrhu
         uapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928671; x=1743533471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RW9FEkNvOGypF+at2s9ctuj3s+TWHqjoYBpJnWAqH6g=;
        b=IL0uXI62FUIYKBIWnY/dvnC1FesgpK68MQeSYuvO1ssu8Q/oE3DGBtG7akPLJRSsBw
         gawyZeWwxv2Y+wIp8s1D6EM4mLjKmdqN6BtnvhpIlxLbYr85LF7NRvutP42Cn8bKnbBq
         u60qvxViG9EtxwfqkPCBaLs4/TcCbSJUoppTcWhWYG3bbs50MOJQgfd2meHnd1QCiY8K
         bKuhJtTGNDwlR0nMy6Fnm7g5i9jLcFDbJF0shvtZxR/sekS652hcfFycmQVcE3Ge6D5X
         WNTuBTFO+uw6IxY1xEnyItUVXdYWIHOfTfn4YlHD85LieZ0z0oSJKrjhUwVN8aPRVjv0
         rmoA==
X-Gm-Message-State: AOJu0YzciYoU4aWpFj+2u4VCc88A+99Yd9tvF7aPkH6gi888QX7c4Eug
	84wnkbLq82shQv0MWYSRfgjHN6i33PkPAqgjw+4mjMtWysUAR0TxaNWYTK/dTWjR0Yp6BLWUt0u
	DDTg4larINNd7r97gna7Uzci+iUNAiCw5NDex9BgK61i4FsqiABOK
X-Gm-Gg: ASbGnctoOJkNAaj1TgBOG3MZFh2uy73jYm3tE2MMSyDPLhOwASaHhlQ1pN25Wlc1eAO
	tlV+e3TlasdsfawVDgkEC4wmud3WT0cs3zR9bwRU4iuLGHJsejsPnRfJaLpjmg9Pz1MP+RlaObf
	wXc3BGgir3S4YbVRaQBYUiNt55
X-Google-Smtp-Source: AGHT+IHV1i9fE+oQAlMfXiMTtDvEIvx7DzrUYZxWgX2Ibmgztg1EHTJNb11S/PMBATtQz1LJRbBImLg/EyaPQt4evdI=
X-Received: by 2002:a17:907:2d23:b0:abf:24f8:cc1e with SMTP id
 a640c23a62f3a-ac6e050a9a3mr88229666b.2.1742928670792; Tue, 25 Mar 2025
 11:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
In-Reply-To: <cf792be2-56f8-653e-237d-a98787976b1d@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 25 Mar 2025 11:50:59 -0700
X-Gm-Features: AQ5f1JpZu4Vtlmea5ZwzmB7df4zwtutSCmVsyWALt8Te1obbNM6rpZ7a7dcPSvo
Message-ID: <CAAH4kHa_oas28jq4ExptkiMMzxk79G3fFxsg0X8KYvgCqC_u9w@mail.gmail.com>
Subject: Re: GUIDs in the GHCB and SVSM specifications
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, svsm-devel@coconut-svsm.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 2:40=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> All,
>
> There has been some talk about how the GUIDs in the GHCB and SVSM
> specifications should be encoded [1]. The term GUID brings encoding
> ambiguity with it.
>
> - RFC 4122 specifies the format of a GUID/UUID and the encodingas
> network byte order.
>
> - The UEFI specification says that their GUID format is that of RFC
> 4122, but that the encoding is different. UEFI has time_low, time_mid,
> and time_hi_and_version as little-endian encoded.
>
> Given this, the GHCB and SVSM specifications need to be updated to
> specify the expected encoding of the GUIDs.
>
> The GHCB specification will add that the certificate GUIDs follow RFC
> 4122 in format and encoding (network byte order). This is based on
> existing users and tools that have already (likely) been using network
> byte order.
>
> The SVSM specification, however, because support has already been added
> to the Linux kernel using guid library APIs, will follow RFC 4122 in
> format with an encoding of time_low, time_mid, and time_hi_and_version
> as little-endian. In Linux, the guid library APIs are guid_parse(),
> guid_gen(), etc.
>
> If there are no objections, I'll make those changes.

What we know is that the service GUID is in little endian order, but
what we don't know is if the GUID table of the attest all services
protocol should be the same as is provided in GHCB (big endian).
I haven't heard back on the other thread about a more general
principle that maybe we should follow little-endian in and big-endian
out at least for GUIDs, since reports still use little endian numbers.
I'm writing up the implementation of the GUID table serializer right
now, and it'd be nice to know it can have the same test vectors as the
GUID table marshaling/unmarshaling code I have in go-sev-guest.

>
> Thanks,
> Tom
>
> [1] https://github.com/coconut-svsm/svsm/pull/541#discussion_r1963201009
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
