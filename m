Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF40288522
	for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248439; cv=none; b=SSPHv84LPaAhwVIjllFrD8K+2EzmDi2edCH73zxRKCe6WJQktA9+/qb+wQ68KH+m7M1jfIEs8dY7zsi65uWB0rGhWXEhmesW0da9Ufz8C8iAtOI5m4RrJf1Dveb5TqQwj1DXg6dMUUoKx70pztKEoOiBBZGLOU5w6uoogydH+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248439; c=relaxed/simple;
	bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umf/CE4yOklsA9GSRI74cWalKJArupMAQIR7ZjoXPA5/6uQ2AougpAJSq2Ko/HELBVYtSSVitovakEN8w2y2JV6vMk7v2oQvAp04IJnK60n2oPmaBvA5QWIajrd8kls6DYIN3BmPj62vrpCZmhNxuJoNHqD2qK/QDvIhRcQZau8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=At73cAMW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="At73cAMW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so1623085ad.0
        for <linux-coco@lists.linux.dev>; Wed, 14 May 2025 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747248437; x=1747853237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
        b=At73cAMWkorH1d86Qm8IdmJs6LhSIfGVBQO70S3q1AkjGd7zjYNYwrF8gWjS4xey9w
         zxXr03iRvHajfR7z6v5knOj2dmpqR0dhdUBaEkCTsvZYkdcrDhsOC5WWofEw5eJrsYNg
         q87FvcqQ0YjnJVUaOHlZT/ZAsEllcD5cW+dH9VUB+gCi7rJBlVpvfvP/D+wqLFtfwdBg
         mlbm18soLz31HiZzi0Q56eiQdOa4X8x+ddyo5xNcXJrgNzDtaR518MAYMJwtVx5KHPCD
         WPQbiP/hTRFTf/dlUkFeFqPq3lbb7dOvKCuAyICkHJ6Uo2BTltkla+HS56OenR0YCpiV
         ZHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248437; x=1747853237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3awbIMSQiN3/pGR0RpgPT4JWQR1hMlp0LppK89PvjRk=;
        b=Y+0cxDa9nqLba2a3IX5kuJrUTQD1LzC0Z4/npH9DNAgBbMUGxc1UmUa6qvfSMn+GMb
         Nc/5gSYcQDJU2Ob92l/plTPt9KCXhcgbh77UdB0hlDFJ4EdlxslJgZ1XzCf1s8bsIPsn
         zxv/ZSg/ig38SEJtid5R6aW2R7qgTTmbyytrhOtf3QOUT/LdRNkfuMfzKUDjECAHcDDT
         uGrkIVs8JpgSLhmiQ00kWBSbk2LfcttxGHvnFT5FOCOIvJ7PdlAFMdb2frphGGCbzhdW
         w5mIXWOV0dT/MSZq56OQM2hn+ko3/NufcqFw/5ivtHVVUkVQ/rjV5Y7Fx2Hho8+zhst1
         3DwA==
X-Forwarded-Encrypted: i=1; AJvYcCU6UW1Rl1QCdlTr4u6nf6U8GI0KVvKKsg6KBM0f4Fqd7pBGj9mxiNSS87D640dWqVm89dep7XQxqU2m@lists.linux.dev
X-Gm-Message-State: AOJu0YyYxHc8YI8KjVtLhoBN9EHBcWmYqhpUEFtyzICnPIgM2QM2R+dP
	dNlwmOkvpGyB5iHA2LMadLDpEmzUqGmEsugxdZq6/pPY/vKT2OmRNLEmbNs117/tl14gKtlalur
	TL7wnD+qOwlO21lGNswK9N7FqElbT8HEr2fpJ
X-Gm-Gg: ASbGncuXUDe3L+UVFf2CUPjPcukuDP0StilUqwOgaCvEZ72kvfhrBAMaIio0UCLg5g3
	EBQrOcSMKn4DBeb/h8E5391UDgW8/OVc13BqC7X3aR3XDdlOLxpjDZal/k1rPOo+T6IWpdTEgnC
	ItErRdQGopP/Rc/ZxjLQTkrZC7RnL7cjK6Uha2NJdAMOBea7Xj78+9ixOpM52GDmA=
X-Google-Smtp-Source: AGHT+IGhjfKdP65xyQg67/NXzbV7pW0f+Hu2UEi2yS3ExllYJPmOzVNNcmG9t5YCc8aX8bIxr7a3OZxEdOsRqobUKu4=
X-Received: by 2002:a17:902:d4cc:b0:22e:3c2:d477 with SMTP id
 d9443c01a7336-2319815c4f8mr61594305ad.25.1747248436993; Wed, 14 May 2025
 11:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250514184136.238446-1-dionnaglaze@google.com> <20250514184136.238446-4-dionnaglaze@google.com>
In-Reply-To: <20250514184136.238446-4-dionnaglaze@google.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 14 May 2025 11:47:03 -0700
X-Gm-Features: AX0GCFuSqhpxhjpKHFPl-kNkD1G7Ak4DdeEQl0wFSdtzCrO2XNlX70uWf2FExps
Message-ID: <CAAH4kHYiDpE9m4fhnUPkWrBq=pmDwVGx_--zSSjw1wE8irXESQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] The ccp driver can be overloaded even with guest
 request rate limits. The return value of -EBUSY means that there is no
 firmware error to report back to user space, so the guest VM would see this
 as exitinfo2 = 0. The false success can trick the guest to update its message
 sequence number when it shouldn't have.
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Thomas Lendacky <Thomas.Lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:42=E2=80=AFAM Dionna Glaze <dionnaglaze@google.c=
om> wrote:
>
> Instead, when ccp returns -EBUSY, that is reported to userspace as the
> throttling return value.
>

Ah, disregard this email. Globbed one too many patch files.


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
