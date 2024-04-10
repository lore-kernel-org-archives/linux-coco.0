Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D916F0F6
	for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712764369; cv=none; b=S1pVGpNUvjxHVmwKzLxhVJSt4BnwaU000+xX5ix6V8u0T04pT51QcKlLM5hpqMGuZR4h3AgyT4GAQDHOhxMGYXWyi1SXVnwkyfPMiLX7ON3O8LgVWHHFMBy7Z+wdM4+4PW1tKxiiEkhmWQ33FQ4DhqR38wdMrJSJi6NUefHUQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712764369; c=relaxed/simple;
	bh=Ra8EeRSjFIVxq616WpRok61moP3G9YfXMjp7vDuJRYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZGqRVa7KjSdz4g3N38myEhv+PQmeR5oB7Hgk5uHwO0NwXJK0ejipTuSVTYwrHtCsL6BaQlkBkmzB4UPSXD0cXMcMTTEIWH/OHMAke+4GjrDokEsFHm7hceTtLoIYKcHAK9ThMV465bjN7O8JoQLQAqsYcIi1TQCpMLccQI9Wq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHAwOx4R; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHAwOx4R"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-479de65e08fso1595735137.1
        for <linux-coco@lists.linux.dev>; Wed, 10 Apr 2024 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712764366; x=1713369166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SCfeMeAP4CrrUmuI6sFD4UCvW4SjhxuhHyg74Ksiss=;
        b=kHAwOx4RzvhVkXm6yuHUDQWeG+uNMyarb5mBcZrBVXpxXrwimU/bFN4NSJG9u21pNp
         wR0KfXliDYvN4P2dpW7/wQNaRX1KI7uCksDatJegcApfoolbUpsEM9gvWCHG7MhXWnmN
         psg2L3q52YwHmYNd+wZw1tNGsObfCYXgsQ5otPc0ehuPKEIPKq4gf2CjkhaVknMe9Fkw
         36Mu5a4taEY0Q4klJ6wtw5yb5Kcf3Qp1BoGTcsiIhf+Pj/tw5146mL6yTihs3/pm5PPw
         0TxDwmvCsDmTm4pSEcWMnRct057AsuO1DgrPBielBSYAjclIldvoqR3QdkKx6+MAN/pY
         X8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764366; x=1713369166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SCfeMeAP4CrrUmuI6sFD4UCvW4SjhxuhHyg74Ksiss=;
        b=MhClmj858eDRJiFqMgBuY4CshQ4hEX/2+y+cOct9jNT/22zY0Tzifo1lBL+Sf1HOd9
         x2ejovOGF0egoct70CzVEooCNIeC87XuE7me/RGVYkx17DYqS93kTOHzd/L/N+3xjmuI
         EeOnTFEetEsCdsC/2OKZEWu5HiLN9jXMLG8guWqwV4wlq4YilBNJt0VjQN1iULa+TRLW
         sNhW23OYjHpFj0d2OcBIBBx4t3NaaJrDQokIdAi8zFSHirbLAK/VxGRyDBG97xxgMZ58
         QhWKqFCFHT+XE9b6FlBkYzxNUHin/55lW+y88P/j2ib4uyBXj8GeeCVViSkO0RMZwB9d
         2GOg==
X-Forwarded-Encrypted: i=1; AJvYcCVUbniHxtNV4C2X8arxB9jqrcOuo+NfJ4e50ejc/ey1aXB74sSxu2i5LwuZ0/bQ0LFHyH7nQX/TNGQ5Jdh9vxKdE0b/3/r8B2ySCg==
X-Gm-Message-State: AOJu0YwonbErxzbQJRrkqexd2MO9opyLrFMX6RVz2f23goPiq2wmYftQ
	ApszM4QaA2J3G1jJAPgBn75IOLv4r//E1+gczC2eGavtQy8hDcPe7QEUcBlOik18//P3WZAZBGy
	2HYzgbokM9imEuVd3ym+qDUDXB92IWVg/XbOThmj3yIJVZXb33hmOX3o=
X-Google-Smtp-Source: AGHT+IHTQ8Rsg08J3AuFHOBc+ERPznTekS+YXJK1hR8h0rgY1Dkiu86CCVq9slWz46pjKvMwStpAuGMLkfn6TIRmTSE=
X-Received: by 2002:a05:6102:4410:b0:47a:2ff9:d059 with SMTP id
 df16-20020a056102441000b0047a2ff9d059mr721525vsb.21.1712764366407; Wed, 10
 Apr 2024 08:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
In-Reply-To: <ZhZfWhyOQ4ZmTdVP@8bytes.org>
From: Adam Dunlap <acdunlap@google.com>
Date: Wed, 10 Apr 2024 08:52:33 -0700
Message-ID: <CAMBK9=bhzO3SFv+6439X=VZ6Raa2hAwVOKE7XN4U9DPJZyX_Ng@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call April 10th, 2024
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg,

In light of the ahoi attacks (https://ahoi-attacks.github.io/) being
disclosed, it would be interesting to discuss what it would take for
coconut-svsm to enable restricted interrupt injection for vmpl3 to
protect a linux guest against maliciously injected interrupts.

Adam

On Wed, Apr 10, 2024 at 2:44=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.o=
rg> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for this weeks SVSM development
> call. I don't have agenda items so far, please send me yours or raise
> them during the meeting.
>
> Details of the meeting (GMeet and Calendar links, meeting time) can be
> found in our governance repository at:
>
>         https://github.com/coconut-svsm/governance
>
> The meeting will be recorded and the recording eventually published.
>
> See you all there.
>
> Regards,
>
>         J=C3=B6rg
> --
> Svsm-devel mailing list
> Svsm-devel@coconut-svsm.dev
> https://mail.8bytes.org/cgi-bin/mailman/listinfo/svsm-devel
