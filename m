Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC546FB0
	for <linux-coco@lists.linux.dev>; Wed, 26 Mar 2025 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743004644; cv=none; b=p0KMjy2ah6Xo3B2I5lmBGxHgMO0o7XLKws079MXejPiqpm5nndTzgaf9AMIZR3RYAmE3RmY2BDrBMCr95VQo4EaLMgFRp5H5JsPY7bqlyF3WXG1bj+JwSvC0z6NWxQftIDp8YPKI0VRoT16dcabiUaJtPKC5JrCZSgmnZBdJjlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743004644; c=relaxed/simple;
	bh=blvZJ22whw/LVWASpHevwCe86g+y2DI33exLrjgnirw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czEVPWBEGFxJ6QxgX5mNaoy/SfzEmE0p0Ykvzd5p35I29CcJtfEE0PM7Owz5ggEPkIxeJtty+fdOlxvzrmfZYOt/TmEVFo7dLXktkT5PvvQ/XMhumDxMrtvqVGVS2uYxicvD2s5UYJoOqx+Pxd5fB9cUNCa4eEXemgp+GmwcepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nS1emgDg; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nS1emgDg"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab771575040so217634966b.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Mar 2025 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743004641; x=1743609441; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDVXmwUat4AEIfamPC2v0yQbrIp4WxkLamv4SdiBGgw=;
        b=nS1emgDgGGc+fhl1h1BBsNAM/BaiaykQArs+pDGzwwRzEfjJesnBKirJW+gJHIOOXD
         PvnLG3fBXbYeBdSz9iItu1pObeXWn+Vy3Ufdo+70tKNeGFbG8cizWclxRVx+xrp4/4qc
         wwfYz8gsD8gc6lKyNth5d+umGdmqxSNyKwFZQPe23j1xTquA4Wc/M/AoPMz6+gtOUvBM
         UZ13FR1kPrC367WvOpXOx3WmR7CgM0ch+RLHYXoKq7XfnCwRB/0VkDlmYm7bpqkFyVJq
         UJCDbrxbfgsmoR8xVKoewmqVWsciy/Oofe30O2ieG50kOEDaVRFX/CrhldmrT0vZuOUo
         jd+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743004641; x=1743609441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDVXmwUat4AEIfamPC2v0yQbrIp4WxkLamv4SdiBGgw=;
        b=gYE5R+gWiwOGZnZ7QLJ/FxHxRRukklJp+0BokITcM7ZrXk7SROcN0lBZrc+kBrXzCi
         H1PfrOGvgOtEnC+pCsmWZffxBE2gVS7vnf9HZ94mD646yW27G+V8cT8fHOYS62c5TZQ8
         z2evJY1YhcGn9C05solf43YnfsLVRXyQ6NYLC8Fp+CmD1jvhaAM5FeHIOXb1syjoCER2
         MJFHoYeD692O+d7vc5vaJ5PIzOo91Dqcm77je2f+wWgBWVoGpUh7ATP+hTbDC6f418CA
         8b1JQOofbR6yLS14I9BozVe9YBkjpwyZ1KlcofaZjk3L7ttaElMTRb7B2MfIuz8VO4bO
         WhcA==
X-Forwarded-Encrypted: i=1; AJvYcCVP9bmHgpDchLcoX1QrQVk2OKVl8EIUSREdb/1Md4W0FZoIkW25SdzOmIEuunmDtv7V/KR8fuEm6cky@lists.linux.dev
X-Gm-Message-State: AOJu0YxC/FOJa6MtkFDSSVTCTqIbE6U2Yb4x5ILmpBaMjt2kz9ZgDr6g
	IPkZr2NQHapj87uhgPeERZV4on8qoD3TPvPzUSAR4+PtC4fyih1kfbHGhUV5z7R9SoMxfF194v0
	gnwjAyrDfQft2lcDRT9tp9rOiYaHRCon6RsA1sLWxz5OCF6QdD0cRv38=
X-Gm-Gg: ASbGncsXGnLAqyRnbvvi1DWj9SVCiuevj5G4R/na9TCajHEflhvS0irAzP19c3h0vuf
	s6XYHPlEq/1pCD3NYW2TDR15uO4pDgw97BuSYepV6D4MgoTlSS3JitKadz4RsTPgrJzs7siioB5
	wG1yVsMHqR/AqGXSoK/ycHn47Y
X-Google-Smtp-Source: AGHT+IG80wsYpjrAYQwMWJPlD/uEpaOIgCn1aDZrWAwbKqPqeAZokdi4GFtLAZ4UQopeu4zUhqkRP8lAIsdkIPSjE0U=
X-Received: by 2002:a17:907:7204:b0:ac3:25ea:822 with SMTP id
 a640c23a62f3a-ac6e050a9b6mr436850066b.4.1743004636741; Wed, 26 Mar 2025
 08:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z-LgVcs66nVpAd7x@8bytes.org> <Z-QYQTBuOjJtkiWX@8bytes.org>
In-Reply-To: <Z-QYQTBuOjJtkiWX@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 26 Mar 2025 08:57:04 -0700
X-Gm-Features: AQ5f1JqViUU5Wg7kMDVwhvxZtBvsuBStDWESTB27QM5pR1wvvTDpQmOBL7oMk6Q
Message-ID: <CAAH4kHYTD=PcCg6Yk9L03R3r=cmwOs7hXvSGKBHPt=+0SYYvOQ@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call March 26th, 2025 (Changed
 meeting time for US)
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 8:07=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hey again,
>
> On Tue, Mar 25, 2025 at 05:56:53PM +0100, J=C3=B6rg R=C3=B6del wrote:
> > Here is the usual call for agenda items for the this weeks SVSM
> > development call.  Please send me any agenda items you have in mind or
> > raise them in the meeting.
>
> Just a notice that I want to bring the status of some of the PRs to the
> agenda today, namely:
>
>         - #259 SVSM: require SNP restricted injection
>           (Can we require restricted injection on SNP?)
>         - #528 Attestation driver and proxy (with KBS attestation)
>           (How to solve the stack usage problem?)
>         - #541 svsm: add SVSM VTPM Service Attestation
>           (Any dependencies regarding the ongoing attestation report
>            format changes?)

I won't be at the entire meeting, so
https://github.com/deeglaze/svsm/tree/attestsrv has my current
reworking of Geoffrey's PR.
Generally I'm not confident about how either of us are reading and
writing guest memory. We need something like Rust-for-linux's
uaccess::UserSlice.

>         - #635 virtio-blk storage via mmio using virtio-drivers [v3]
>           (Any blockers, maybe generic MMIO routine support?)
>
> See you in the meeting :)
>
> Regards,
>
>         Joerg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel



--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
