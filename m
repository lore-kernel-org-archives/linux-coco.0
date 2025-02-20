Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E320D4E5
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070064; cv=none; b=g+o9z9BV71S+hsKf0i68ZBexSAsvGAxghYq2nJs19zFVX/E1fh8t/jQDjTK5Kt4JP4XnvWNgl1azDGd55IQip+O7b89FeANo+znms46MWw5/Z2SGoHIfiJJ1JNUY92GMfeZzTL1UV0i3QCeeG7WfPFtUXUu9D6j30TuyMZoi4x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070064; c=relaxed/simple;
	bh=07JJww02mJEeGAIuugM++K4ebk2f0Zd1D+gq+CAzgrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyVtf7S3sEehE9bH038ZTVozb3zZgPRy/205I+5RWo5wD/NBlmemQ1UvfLIPb3Hyvuqa3QcvpmU9TZ7SQ2Wnx4rRxZywlTDP+s1hZeSWWW03dAy8ciVb5ePs+MFKSc5/6LXlwXBpaYWbWUrI3typOdfBjc70XKWqsKeE5k9qJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gngmmxA7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gngmmxA7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb75200275so189340066b.3
        for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740070061; x=1740674861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMCL0K+C4GnoACxiUHOKxAWwwUOoQfv8+sE0BWNTm14=;
        b=gngmmxA7jbNhPh+hmXbqaAE6LkGiqEKoN2oEimr4eGOO2VQy48mAm/28+sXkbGjePX
         iI0YUKyF8mk7c04lE5CxBhgMHFJ0AzWEIw6Ffbz6vld4xZR9u4iZQ87yXSiPw3aKCd6c
         mnQ0ZIdGS834EbKamhz1XRO4cfgYCpr5Q+IT0/9yI5B4UkSeboBdgK/Zm6roELCo0EkD
         Wtxn6LfzDIIpMNGzoonqHXeOwZhHTXEdvxDz1c6vBddSK90DRH772kaY2o7vIA674HLV
         HuCvdA5GuPINDDzEFsxnv5pNDp9ywQRk8mcVsgZiWPtmyaJaFsSMZYJOFT0pzNsI2+c5
         e26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070061; x=1740674861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMCL0K+C4GnoACxiUHOKxAWwwUOoQfv8+sE0BWNTm14=;
        b=xUJ/5sM6SE42u1MK4Wki8YtnJilegwt5HvOQSlxET0WUQfwQo2bJSleOM87b3obsCX
         Wm0bJHAUb6mVuvlWGH7uhHkxn9qKRobhsctrIlc7uh/SQw4dTGTnMHUAHXtIjMNlit9K
         X0qTpdIZAkyP3X19kygg9ZhmGqUvBqwh4kGHo4jlmJ9gS27T4/jF/WW9P2z1/c2AP1iZ
         cRmvUlfvCHTcA8ZMrA5AAG2QMxD5tmUnDt7VupmLx8lcRwaYRaCUzkLHjjt1s/XvZ94s
         2GOwiU9i14IFou41VM/TrbCX0YRFeDk8oORty6xlzylisyeNCyHEyNOaBsECXdhCpZKr
         4lxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH1n0LNN1fp1Yunv4+f8/f9Gd4nrTycs7niD6J29AYnHBpJrJaYi+IBsckoCjw+cuGDx29D6sxTOuC@lists.linux.dev
X-Gm-Message-State: AOJu0YwGtsyWw5fMi5Nuus5quqrtux7B4t3l3FMU+kbzqZvyCF1nXAHz
	hg4A1MdRJNKDwrHNIwYUq7ycnyRCWeZ4nD99kHO/5FZ3KVz80u9+i+NEhsEeIm6IXkV7rM99BYo
	h7NLigeHaHZjoidYLZbTcL991i0ITtj23DBy+
X-Gm-Gg: ASbGnct4tCLagKmPyThV4DhptIekp0+eg3/ZLMfXAI/Hp6XwG+yuV7FVTMxPM9/2ngb
	LGEscxyX6GNdOgCN0xjjNvJ7LTOjcwCNG7AFOqiu6w4GOZUNQqdZUBLpE5PNMkZc7LcmQGBTp
X-Google-Smtp-Source: AGHT+IFUN190VqKAbunKFBAi3FWBdH/R347wkO7ytCt3scT9na49h+zVGgXkcRMQmFGqWpBuREc1IPIa560YC5Jlbbg=
X-Received: by 2002:a17:907:7ea0:b0:ab7:d361:11b4 with SMTP id
 a640c23a62f3a-abc099b7f3fmr3875566b.7.1740070061123; Thu, 20 Feb 2025
 08:47:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739997129.git.ashish.kalra@amd.com> <e13263246be91e4e0073b4c81d4d9e2fc41a6e1d.1739997129.git.ashish.kalra@amd.com>
In-Reply-To: <e13263246be91e4e0073b4c81d4d9e2fc41a6e1d.1739997129.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 20 Feb 2025 08:47:28 -0800
X-Gm-Features: AWEUYZlhHlxBHBWrZcmEspkPqwgF6rKQ9OpK2K5xOYbvc-va1cUZOfhJoJDPwGc
Message-ID: <CAAH4kHZsC68+QPC+y-pycM+HfsLF-f_AuW8eZm-Dqqf5meFj+w@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] crypto: ccp: Reset TMR size at SNP Shutdown
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, michael.roth@amd.com, nikunj@amd.com, 
	ardb@kernel.org, kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, 
	aik@amd.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 12:53=E2=80=AFPM Ashish Kalra <Ashish.Kalra@amd.com=
> wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> When SEV-SNP is enabled the TMR needs to be 2MB aligned and 2MB sized,
> ensure that TMR size is reset back to default when SNP is shutdown as
> SNP initialization and shutdown as part of some SNP ioctls may leave
> TMR size modified and cause subsequent SEV only initialization to fail.
>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Acked-by: Dionna Glaze <dionnaglaze@google.com>

> ---
>  drivers/crypto/ccp/sev-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
> index b06f43eb18f7..be8a84ce24c7 100644
> --- a/drivers/crypto/ccp/sev-dev.c
> +++ b/drivers/crypto/ccp/sev-dev.c
> @@ -1751,6 +1751,9 @@ static int __sev_snp_shutdown_locked(int *error, bo=
ol panic)
>         sev->snp_initialized =3D false;
>         dev_dbg(sev->dev, "SEV-SNP firmware shutdown\n");
>
> +       /* Reset TMR size back to default */
> +       sev_es_tmr_size =3D SEV_TMR_SIZE;
> +
>         return ret;
>  }
>
> --
> 2.34.1
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
