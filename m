Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23EE1DED4C
	for <linux-coco@lists.linux.dev>; Mon,  6 Jan 2025 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190535; cv=none; b=K/+uRocUrtTWYqc/hQBECkxn1J+lvEISPihrW+YLPHMMFRxoFyOBM0Xv//kexp5vPaenUsHnobz3gAqQWNQId0kL94G+xDrCTZk4CrJr2Q9f+ibWRdOLY4wOyvFAQGt3Jr6pFMQ2C9F90qAcMD+z7c3dpiwEKMhtJ3xV4Mb+v5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190535; c=relaxed/simple;
	bh=d8IFcpPqpi8j+hDN/5XCv39i3O3L1ryXcw792Dxz0/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+y31I+7E/1yHTR0rtMhdCXF0niBgusHdmMQ6IkOH3VHjOB/v7WEDqFP/t7B61Az5bz0mjtiMjaEmlkKEnW+Ohs+kR4rHd6miKJdaTXhABvjZ6KyVDThVfLLYuQIvCQ7o9VPRbV9VQP0kHmaFue5Bd4hA7JOB272ThkDKIcKbPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBbht9RK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBbht9RK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf8f0ea963so804803266b.3
        for <linux-coco@lists.linux.dev>; Mon, 06 Jan 2025 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736190531; x=1736795331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8IFcpPqpi8j+hDN/5XCv39i3O3L1ryXcw792Dxz0/8=;
        b=nBbht9RKf3uFLTSQFhadnW4QjE3UDHxKbtfGc1Qynz4vG23Zf3jZM9sH6sody4C5JP
         yUImNO+SAePOPgNoHowp8ZoJNTAgfiySeJtVP/dm4X4ecxdG/xOaponVg1fJeBtCXzZ9
         sWpbLzF/fB+EEhGiDFNoF47XrhbNVhywk+eIL37ZOljlz/nzxaTESQmzgoGUEZA/m624
         nnafUxth3/Zd01vSdMXI+oOjyX0wDIOyc+clRHax9kvXPzkfSzgbI8/+Y4LV2qgwVPdu
         HuuY1JHcpFw+QYtDpZ5tUYgoDr9R79KM+Cz4T8sCh5onLrDkMbQzEz/KG1QISlImxP5D
         KBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190531; x=1736795331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8IFcpPqpi8j+hDN/5XCv39i3O3L1ryXcw792Dxz0/8=;
        b=SQEGmRkfg0JajwLRQ9HwFjLwHYSbm8x4/MfLQS2f0PNlsRhJVUgeqt9y8AuKTgBshA
         CL+KObO4pXHRvNKzJyibCZjwCULHOa/JUlx1eHS+GovyBmo6GffJDASmij9hntK57/YO
         cbvC3sC979AA+kEkHti3xNYLrOTFBRo6T3AiVviMotS3jUgqaSGlswYvbJtOAeP7Cudr
         WoNPf1kn36qcuApTmrFTFcZWEJJcCLU662TmO31iZ8+jjTh1BROr7y1eKg0l9C4eVkoN
         2GcDhFVTMS9yxgZDv1qV0E4xCNaQwxwZNmWPlGDt45YgBfPo9tQ8kGxhyzchdWJgKHRj
         p5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNFCiz11E9OzyVah4xzg0xPUMxzY5yTwQ4iB8TSpliuOcdXTgxkxbKJEhFNv2odkN1deOe8l3VmMZC@lists.linux.dev
X-Gm-Message-State: AOJu0YxHHFzytU7ahE0Bujo4plTMYNnxiAcv0WuB1KbmHY8suMjPXgkq
	4eWTIeokcF0VieLlkwHv6llUm4d7VTLAFiSYJXqdZ2+9cuhTTDOkycaLUGTQdexOzA/+VR6v3pD
	NG4x+1oc0mXEzOHuUNPt52IS8ZxY5w+nhwd3v
X-Gm-Gg: ASbGncs5uu8lYnzMaxuF2t2dyDkUtnz11k5zQdfcBRLcWSIPZgid/vphg/hG/EWrft1
	xRGaBphUfUBHA6cNHBjAAkLENWHkeK7+HI8Nodyo=
X-Google-Smtp-Source: AGHT+IGcQaUm2xusETP245F3UmHTIFSyoDHcBqk2tnwBwiaufDKBsyp+BjJtK+E4o8YHQV3okUTIH8pylljhKcy7Pl8=
X-Received: by 2002:a17:907:d87:b0:aa6:7933:8b33 with SMTP id
 a640c23a62f3a-aac2ad82d0bmr6409005766b.15.1736190530983; Mon, 06 Jan 2025
 11:08:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1735931639.git.ashish.kalra@amd.com> <674affc649968994f95b6259f162d5f0732b102c.1735931639.git.ashish.kalra@amd.com>
In-Reply-To: <674affc649968994f95b6259f162d5f0732b102c.1735931639.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Mon, 6 Jan 2025 11:08:39 -0800
X-Gm-Features: AbW1kvZ5-G9CNDDevePk78j3h9GxJgbYj_mnqJjsDLSApjXGAyO5ptX7OVqMJcw
Message-ID: <CAAH4kHaiU8W7zb5oEWghrHTC2XvC4e__cD+6pYMprH9c=iddUA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] crypto: ccp: Register SNP panic notifier only if
 SNP is enabled
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 12:01=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.com>=
 wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Register the SNP panic notifier if and only if SNP is actually
> initialized and deregistering the notifier when shutting down
> SNP in PSP driver when KVM module is unloaded.
>
> Currently the SNP panic notifier is being registered
> irrespective of SNP being enabled/initialized and with this
> change the SNP panic notifier is registered only if SNP
> support is enabled and initialized.
>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Reviewed-by: Dionna Glaze <dionnaglaze@google.com>

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
