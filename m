Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E68F22FDF6
	for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733845894; cv=none; b=bWvIuPfZ6HCo3dSUC38ICParnW5PU+eun5smCqY9XxS4vHLU/vRa1qMiiCIyCzHOTIiXXwAGPyStgqsoajAk9QbJRTsXQJEj65zVMRhQMhD1hj9zPJjPlZTx0zou/sXmKkZKkcbCnZwSDJ/IY00XcCTjZwXFGpOvw8Vwh8vWDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733845894; c=relaxed/simple;
	bh=6OaTMfkTA/OmgikKXTbbHwl/a5xyjcE8zGh1IgbdmZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ge3Kvhg8a4qrde9po3MhFH5at8kq//gl9ZjqNKG2+vQ4q1wC3wJihQa1Itn2FHpHiZAYq7w0lqdCdfwAUETg7PN6nS/FIGoQDpkdKK+sa5ANhAUyxjj3brKxHczG9MGXlLRw85reqUUwiIQvC1fqjvjZpo7DQ4jzQ9Uw1qvKr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwEMP6IP; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwEMP6IP"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso846874266b.1
        for <linux-coco@lists.linux.dev>; Tue, 10 Dec 2024 07:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733845891; x=1734450691; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zGEWpmLWCQTndHxT5IXaD/UcEthKFp24ucI3TjyxNCE=;
        b=nwEMP6IPwruLqk7NzM9DgsHyPIvg1QzAQvrc6FBlodU5T/bM2+AhXRWqiqH2iu2uuX
         fRUYqPtaRyyQyCaDfaKLRIDCFheY9QKCQK28lSY3yzzkicqsaUGDj4C77hOh08PIOToK
         jHu/JaMhaJZnrYpqg/rCwSo438b6jPEpM6myXZMsDccWZsdZYk/9P1Y7uRbWEs19SDml
         8QEESEd2a1DH4swmeE8mxiGlQA3oJGqHxTDe77iUuRh0R1mPDgoks8Sw1HHAWQA0h9YR
         DjgzHBNpfoZplckUtkcr3X3j+HahOCfCi+LozXWVVjVP3hGu9Aw5Jwt50m5xzQEjHl8F
         TbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845891; x=1734450691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGEWpmLWCQTndHxT5IXaD/UcEthKFp24ucI3TjyxNCE=;
        b=MmpeEEXN02DUn+8F2AXEXwkaucFakQXn+rQk9AMeI9Vb9xUvCNryk6fb4ELk1E358J
         0SASLvfcBOq0rRg1KjHb8aWHSKnVfp+LdJKJxH8m7FHYNcxAkrA8fwpyfoZMHyJMNulJ
         saV4vMIQ6F69S0raCZSaVuohj8gd6oJpi4D9XkBtWHeMgKyADQjkbMljG+OXwTX1gLxE
         XCUmyiAerTRTjyGrRfekTTFHnHVVclniBuFLsLu0H9RwfhEKC5JVNk3e4g+gTpAM4m4n
         p9HNp8y+N2fic6tkspdGQCAaq8CJtRRopQuE68wAm+AVaa8mUyDUAUtnm3hrtCd+Ij+O
         UJow==
X-Forwarded-Encrypted: i=1; AJvYcCUZtMbGvQbrJitANoKn0sf4UTQDeaoIGLIX8y5cyzul+Vv+6i4J5gVOaCp1I0FxGC9vqoOGdOshPoPK@lists.linux.dev
X-Gm-Message-State: AOJu0YyU3c1350sjaUJ9Td0W/YCnompHr2135Fl8dgbDs3ZBTKNmkxKo
	KyBRAE1qIRGZ9vDhIjpGQ3TWgip7E3I4UXdsv20z3hpoUGOY18SW02XDWiiB84MdIuB3mvNYx44
	GqwtKzJZS2uOZYSWLkojez5UC8FA8M0Z+LHfw
X-Gm-Gg: ASbGncuGqu+MjFFnsdc9j4d0JajLYCBHIHyKdT3raLgqOF9bkTICS9p+Tib1ydJIjUo
	BqKxRphnusko+2utZfo85h3oTICDhr4jWtwY=
X-Google-Smtp-Source: AGHT+IFF1pHN9/6GA3MG/iAI7uuToN+v40kN7CYPXNMCf19FEEnJNP06BgAyjhrlHXP7Ud+BFaLU9/3DxddZc+NTX3w=
X-Received: by 2002:a17:906:3118:b0:aa6:6e41:ea55 with SMTP id
 a640c23a62f3a-aa66e41ede5mr1256721466b.7.1733845890857; Tue, 10 Dec 2024
 07:51:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1733785468.git.ashish.kalra@amd.com> <d1658358fa8c55dca2f1869ef8a8475fc303e9c8.1733785468.git.ashish.kalra@amd.com>
In-Reply-To: <d1658358fa8c55dca2f1869ef8a8475fc303e9c8.1733785468.git.ashish.kalra@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 10 Dec 2024 07:51:19 -0800
X-Gm-Features: AZHOrDm8zaFskRC34t7dTi25zxHQFgRiXcLbUT8F8VLJriuZ2gw6c8XA36wtfvo
Message-ID: <CAAH4kHZCowU0FV4568P5C+pyv6T-9kL92qnMd2RTq+Sf-9j7Bg@mail.gmail.com>
Subject: Re: [PATCH 1/7] crypto: ccp: Move dev_info/err messages for SEV/SNP initialization
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, michael.roth@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
>  static int _sev_platform_init_locked(struct sev_platform_init_args *args)
> @@ -1329,8 +1342,7 @@ static int _sev_platform_init_locked(struct sev_platform_init_args *args)
>                  * Don't abort the probe if SNP INIT failed,
>                  * continue to initialize the legacy SEV firmware.
>                  */
> -               dev_err(sev->dev, "SEV-SNP: failed to INIT rc %d, error %#x\n",
> -                       rc, args->error);
> +               dev_info(sev->dev, "SEV-SNP: failed, continue to INIT SEV firmware\n");

You don't necessarily continue to INIT SEV if args->probe &&
!psp_init_on_probe, so this may be misleading.

>         }
>
>         /* Defer legacy SEV/SEV-ES support if allowed by caller/module. */
> --
> 2.34.1
>


-- 
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
