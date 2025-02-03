Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF811FF615
	for <linux-coco@lists.linux.dev>; Mon,  3 Feb 2025 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620536; cv=none; b=OccEYOcZhgw3jGM/OMZQMf8p1CS8K7CPvzww0mVtOqS5HdpOhjYLxrdGkiS3adAgl0mUE8Z3hGnyzLmRtTd8TSK2G7udA+5J6pO4Uq/0w3N91O0WJLmuuAo6PzzeFn+F/+yyFDrn4+vcv+QloGehHWLjSDSgu+foIzWu2LapLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620536; c=relaxed/simple;
	bh=5RAtnqgSsJW3L/OucE/O3ftfhIA9MkIbq8HBQmwo9mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPXtf6Icq3guT6+HeG3l/S9MvGF7iL0Oiy0FqPkWQlIsOPff8j2NgnePyDaJsrJxlmzZ6gQ9AG0T2t1lwieUg8PfEPragQIllDgQQ5YUNknDrxeHR2zYf/CE3RjLXtv9p4aoDASIR8TkM625kO5xFwr1ITAu25pjrAyOjJ+OWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aMXIOiyJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aMXIOiyJ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401af8544bso115e87.1
        for <linux-coco@lists.linux.dev>; Mon, 03 Feb 2025 14:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738620533; x=1739225333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSoo65ANk1ACUgD5CEe1MmfBfCx6K8V18L1pZv5jKUg=;
        b=aMXIOiyJYv/X5GQM4QKz1p26XdIpE+JFZ9mwOCY6Znp5wIpaOkJb/xrja8yZJcd+em
         H3Z+zTt9KsUbT4pOVFdkqjxrFFv4SNyg6ymi7UsKVmPAyIFttS7f/BkKRFkfnuH61yr3
         dBiKYYT8cjdljtjrkPkEVLuRMCRqifUcjeRwXj0GtTvsVCUpQjeDiWTtQsPADjZPEx3J
         fA6KHpjXqfu9XHOszZRR2GusJDiiB0411qBp9QpAlVoISNMBt40GZxKuc+dDtXdXJRzf
         /Hjj2KRJ58X9QYA2xWJbQhhsqr7bzfeNkuvl94z8/jwFpWXnAGlQQ40+VoS8Xp4yNhem
         OBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738620533; x=1739225333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSoo65ANk1ACUgD5CEe1MmfBfCx6K8V18L1pZv5jKUg=;
        b=eh2WPVwzLkPLYrK1TBDS1RUMMurUuDiWucLCb7RPg8PXNwx2UrD2N+GwhV7uv6fcp8
         bF56vAF2GUDIG9g5uypBajA1E6l089TfnTKs/3rX148NnL4441f2DADkYtPzqTtvTtKv
         lufz39yd2kg4hfgKI0LHdahnKoOntCLY0+b9/Wv6lMQPU/5BltKyWz69OrtRR0vOykNE
         ecjy7jTj8j6IvM687WjQgMlZ9PhBH0qF7kHgHJ2OTinrY07J80x3/2dIij5lhH+iZcQn
         myJ0k/m1helyeMb2/XDgkATsf0hiEhAFq+kuUabYsYAQxMyMMCNxucM3nn1kCVzlLgzg
         ufOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaIvKgpZZ2K/QyZQl68vaCmD0uAXKV/cBc0aXHwQYsgdXwyq7h+t2jL1GlmqaD+g/iETPmtaTt3UVD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm/Yj0ge1Xl2K6x5woQf8/TDy6TooqSr+r/S3Hj+GyA7PlyHpy
	nTKY3gP7rUFYeek5lMbSzeYYDfeV8GetYytdAv7f2FoV/yV1WH0VWKGK+jwKkuB4RTX9Sm+SGva
	TtQQkBV8AMw/q2Etiyx1iF5RTQZ4WbdyiHIxO
X-Gm-Gg: ASbGncvxfqPRhY1pMFV1HpHZ+7XWXxFgG1yH3bKXfpI9RK3D7sm94UzXC77e9oxVQyR
	WgCy7JoQuZP3e8rzvPmGwjCitS4yQf5fHQMmT9oZDzfmPLvuf/APMaktNrq9jAvcDDTpQDbnf8y
	LHWH3gGb0DrJCPB41gMvlYm7uS+QH+rw==
X-Google-Smtp-Source: AGHT+IHtm70vTgHPrrcUuJwFAa+5zFIj4hqVrwA8yzRqmy3Y13vzkDTGy11M0PhuNPkDVSVa0ZHRUqRBsdcAg8i1d2U=
X-Received: by 2002:a05:6512:3b2a:b0:542:92ba:a08c with SMTP id
 2adb3069b0e04-54400bd712cmr17275e87.1.1738620532535; Mon, 03 Feb 2025
 14:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com>
 <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
 <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com>
 <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
 <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com>
 <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
 <CAGtprH-n=cfH_BJAmiNMoRbqq0XdGCf3RE67TYW8z7RARnsCiQ@mail.gmail.com>
 <40418980-6e5b-48eb-bc35-7ffaf3221fd9@intel.com> <qzl5vkhykj4anuvjrhfco5qoeuib3oskffnxnqbcszotttnnqa@up5b4xl5l55g>
 <702c5acb-6bab-4940-a8f1-c346373167bd@intel.com>
In-Reply-To: <702c5acb-6bab-4940-a8f1-c346373167bd@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 3 Feb 2025 14:08:41 -0800
X-Gm-Features: AWEUYZn4lp_A5AbUjUHimrHcFYW36fbGNYwCsxNdJcmy9mUWfgPSBJE-b3l4FDY
Message-ID: <CAGtprH-grdiE2AaagnYNUQC4ytSMxErYoh_Xyg2Nwmto33Yyyw@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:19=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 2/3/25 12:09, Kirill A. Shutemov wrote:
> ...
> > But Sean's proposal with HLT check before enabling interrupts looks bet=
ter
> > to me.
>
> "Sean's proposal" being this:
>
>         https://lore.kernel.org/all/Z5l6L3Hen9_Y3SGC@google.com/
>
> ?
Yes.

>
> Is that just intended to quietly fix up a hlt-induced #VE? I'm not sure
> that's a good idea. The TDVMCALL is slow, but the #VE is also presumably
> quite slow. This is (presumably) getting called in an idle path which is
> actually one of the most performance-sensitive things we have in the kern=
el.
>
> Or am I missing the point of Sean's proposal?

I think you have captured the intent correctly.

>
> I don't mind having the #VE handler warn about the situation if we end
> up there accidentally.
>
> I'd much rather have a kernel configured in a way that we are pretty
> sure there's no path to even call hlt.

+1.
