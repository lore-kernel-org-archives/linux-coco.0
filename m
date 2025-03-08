Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520F16C850
	for <linux-coco@lists.linux.dev>; Sat,  8 Mar 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412468; cv=none; b=mVnVi+/91cUire3O18+6kd2OpyhEAaWUc3GPBakiOcEX6Me1eQ02byoTYou8qnMLMAu2mXVriFpPDQyBFKbQ4H1dv/q1z5zfyV0hEGiP6febDyp/d/R08BCCvDnJw9zv1oFX1qImtooILFe3sB94SSIjf/oKeXxFifir95WfyNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412468; c=relaxed/simple;
	bh=zdInW9/Q0g3TtRuFFjxtdjGT1ntLsubGIabA7azNnF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpEbow1X1QD3kIQbPKnVHlCdX+wS/7xQYcuouQEcGQGW/jdEJMI3GMHeZm6zVln/AMYtc0EQX61pNBERI8PtqzyqZJq5c9Q1kHfkCzV1DAC9B25QNHBdgKfTyv6AeW8PutJQSDARTtLKbn1MOXJxh+latLKg+feftu3M9LBzS+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hLHTC8ck; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLHTC8ck"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so836839a12.1
        for <linux-coco@lists.linux.dev>; Fri, 07 Mar 2025 21:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741412465; x=1742017265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdInW9/Q0g3TtRuFFjxtdjGT1ntLsubGIabA7azNnF8=;
        b=hLHTC8ckcxNjRgWt+Kbjs0OLlPbxMXh2hz4tsct9oohXr/xAMBClwmuBnU1VBSYZ0o
         K6hB7vAbrZvMDAqnUNsTiaNrlIXwGfzDv6Xf0754OXcvRHp9A9oUsVPMlaCbBGjRB7iC
         ylMAaKIMEf+x0cgpxrYsgJ4PCspRlLLRi0u3oc1xD2nCyuF4BFM8bA3+N1NowdeULM2W
         vHUoLDNr/uQ8hs3V/e7Rn0WbwsAPtddiLhwNPfcSSUIPKD9JTUN3o8sNeAeHJGZ44FF1
         kc04BAxsMTfinwKPub66wWfrTJBAfm1e6Sa/mJhK4cPgOwWDUbJsEQL1+I5ahuclR4DS
         a30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741412465; x=1742017265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdInW9/Q0g3TtRuFFjxtdjGT1ntLsubGIabA7azNnF8=;
        b=M6ca8o826ln35w+rFCPeEwSjQdf4bZINt7igcy3excn01qg28NyVKDvzUSZ6PJYFnT
         hmmEJNbMDm0/wn6Ke3brMUpGr/MQelf7Kjtiq23+05ghxtPjyL8wqe8GfWTV8TJxTy73
         2R/foMsGvYDdQwCYaUuB0iSbKv56WW0I5304D5Ms8a6xftw3G7d7jDgdLe/wN/5GSb5J
         V+LVr7kCta1myAQWet9aECwzN7Z7vTdiPnYext/pux+80S1ZjjfviC65eeg8RHQEwCZW
         r8u54aCw7cr6jshDgFRJkeQR0zqZdlVckO+0iT7PHHxnGO3Vc/7Trw0F54qRe/0aB0Fu
         mu5A==
X-Forwarded-Encrypted: i=1; AJvYcCUiWpsdzBJt721UmwCH1W/4H1GlYNbNw2tuqgzmV9M2Srz4Xtif1QYCU69v3rXLP5aHiZ0Q4w695DCO@lists.linux.dev
X-Gm-Message-State: AOJu0YxsHlbwcJliuxrlrdNenh/SUiEaR8JMJQMt0T/05wcMpnu+ueyZ
	dqZT9YVgRNOCqUY+HNbke7CUeI1kPiuBYdVwvBbcxxGk6ZvEMLs+jO8V3reJ46GYsDiljJ3HZMO
	TGBEyo+VYIDEJUfA1DzWQvv0DuHR30ISqk9CA
X-Gm-Gg: ASbGncvgWks1lfKXVQeZS/CkTBcw6eS/IyDrO2H9M0qya/vjo5VY6jjJRPIs1H8EhY6
	lLwNGfBOl8kRwfso6CCzFzsbRT/XmMNXsOgC+cOQKXPD1TLNC8Vgv0ZvItxxLwuCPHLukbSM6Yn
	9DcpmLLlhTQ99UuHV4la88IYETre7lUcKU55iX
X-Google-Smtp-Source: AGHT+IHo2PDDI9I6qlRDO6UBHqyRzd05L8tQZ+VxcalVUvx7hfwObQ0npt6/o1jp9kL48JbYgSiDJElWv/K6VQ8EdhA=
X-Received: by 2002:a05:6402:2791:b0:5e4:d11e:7c4c with SMTP id
 4fb4d7f45d1cf-5e5e24bb58cmr7202371a12.28.1741412464668; Fri, 07 Mar 2025
 21:41:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250308011028.719002-1-aik@amd.com>
In-Reply-To: <20250308011028.719002-1-aik@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Fri, 7 Mar 2025 21:40:52 -0800
X-Gm-Features: AQ5f1JqHUPD1cUQbwC0XGvEQjFvxgeTUlhoO_RT4hTgIRg1b6omcoJrhiqinDuY
Message-ID: <CAAH4kHaK3Z-_aYizZM0Kvmsjvs_RT88tKG5aefm2_9GTUsU4bg@mail.gmail.com>
Subject: Re: [PATCH] crypto: ccp: Fix uAPI definitions of PSP errors
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ashish Kalra <ashish.kalra@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 5:10=E2=80=AFPM Alexey Kardashevskiy <aik@amd.com> w=
rote:
>
> Additions to the error enum after explicit 0x27 setting for
> SEV_RET_INVALID_KEY leads to incorrect value assignments.
>
> Use explicit values to match the manufacturer specifications more
> clearly.
>
> Fixes: 3a45dc2b419e ("crypto: ccp: Define the SEV-SNP commands")
> CC: stable@vger.kernel.org
> Signed-off-by: Dionna Glaze <dionnaglaze@google.com>
> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> ---
>
> Reposting as requested in
> https://lore.kernel.org/r/Z7f2S3MigLEY80P2@gondor.apana.org.au
>
> I wrote it in the first place but since then it travelled a lot,
> feel free to correct the chain of SOBs and RB :)

It's all good. Thanks for seeing this through to the end.


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
