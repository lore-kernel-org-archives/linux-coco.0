Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABB1426C
	for <linux-coco@lists.linux.dev>; Wed,  2 Apr 2025 01:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743558140; cv=none; b=DiNDVkl1bnlX9Ak64qnwaIl+nCtrNuF+I2j0Mkhq2Wyq4WgQEKHZpr7t3pJi4jYwj0xO6vfiBNITJaez5SOelyXgdOlGueBq+3MenNHHCxL4qA2m0whCLFkTr+vT4D9N2K1MlPLRsAOEB63XfyUFZklUNzOOgLUyZcsCcKjYeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743558140; c=relaxed/simple;
	bh=PWk9tLsbMttSGMEkMqrju/ltpUmGtIssPxqSUtUzoJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVZtETzD+jt56iBWDB9kx2XkZ+AMJJ5uBdReOHmcJRLjzAbTd6kF0bvkXQcFPIP9SwHa8MyqrxLa2T9IaoQSwHKlRBb7bcSFIeJ7IDeNKZ1G6g6pcjmCSIvc+eFmeeavs5C6elD02zxe8gMd8FYOV9DOCbWuoh5ekZBwg7T35/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=roif6wdu; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="roif6wdu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so1007355066b.0
        for <linux-coco@lists.linux.dev>; Tue, 01 Apr 2025 18:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743558137; x=1744162937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXs8x2fMAhJkRxpoRPOLT5/UkjiiDW99y/Dw6g+272A=;
        b=roif6wduihLHrFeaC9WrN/a7y6hZqNJzi7uRyUVTKqgu2eqSJmwKmRCD61csVjjrex
         mP9J79bR/wAmyGJk4cB7CvrZuRinyr4kBtcBzIDy9+6LzwcgbtWT5I0NbfnqBApRHt3t
         lcCBAxwasIcU30NGGFRoRwY1r4ThF36mjtj8k2jMZiJM1wFW91lulq01eYwk0u5g2CqM
         WQtcl2Uy6F2w11kIyEFo2wbiF3TfjGFYODkwO7g1FmnHiSvaUp4stMCqyRq8Fq9sdkXe
         NQqfkSN86hzcb7Pz5InPiMHsEkKZ6jrtH6xY4eXTO5+APhpPEiewqhAZZPxHUbA5m0ey
         xnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743558137; x=1744162937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXs8x2fMAhJkRxpoRPOLT5/UkjiiDW99y/Dw6g+272A=;
        b=Xba3O0mfc4/omiMbpiV25iUz/E3IDKcD1JyYLykR8k7mzU3QIiMlJN+KNdjGnNpw0E
         6qIvuvaIvztDB2Z4ZT2olroofnVKNHmFpoB+lXm/TsOWNvhKPxuEZMkLzwJV/+I78ouo
         R1YNTor9MPlsXxi1imWtOpfv+HpmjP7tCteuA30BRd36gcnTFVTkXNDG6I63Ss4jpA4P
         57T0/Mi65+Trt7Hrp0vmzfjg9nEm9/mGxxustlJE6ORfZr44WSEZACTwsMgUpPCeq660
         Hhf8AVtz7AjFfrg4EXdd0IwVWxR0R/WHE5n+uxAB2gn4Izj88WuNLGWTIin0DnetU1qD
         I4sg==
X-Forwarded-Encrypted: i=1; AJvYcCU7WH8JMM6MuyrxU5rLU8N4wNILAPmkmxtUssFBLr+3PdpMXgj5xzJQP0q28jPg5sUVjk4F0pifr7Sa@lists.linux.dev
X-Gm-Message-State: AOJu0YwOOoOsTSzBtc3G3f6YUJjP9XvNtNwqEhEt9TxViSgxScTrvJba
	33L5yXmQ4nBnQZtcdrWaf+1ADRsBnItQEceCTCZL1UhkGLNTqfEESXS+zE/zEtg8CJgeFma83wc
	84QCXxbejAakGbwSR8PM1VPyJDcO2TYeIXgiYngo4PgeTGU2FVgtedkY=
X-Gm-Gg: ASbGncsw2G1e5cj+eG4cpK/74IDcLFgp3L2oa6pyAX3x8N3dK7ps1zv1xn2wwvLdLnl
	b5CXzyBTbNB6ribo88/rpDNF6Ab2ZCuuJmsSxDCxfMqtKKu/qGPezGmndAbWvePXqAtY4dyJfeU
	lXhnvFFGUlnz8c21qoEVQ5zAdbEg==
X-Google-Smtp-Source: AGHT+IGxqx3m4NF+0k0Gnbb3fEDifQ6oRV+KxMXblanxWl2qh6cBHw9XwrzyLAn4xB03gqvUUTDTRrNuxwovlY3EbNc=
X-Received: by 2002:a17:907:9625:b0:ac2:a5c7:7fc9 with SMTP id
 a640c23a62f3a-ac738c13711mr1303266466b.51.1743558136610; Tue, 01 Apr 2025
 18:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z-wLndJu1CM_K64R@8bytes.org>
In-Reply-To: <Z-wLndJu1CM_K64R@8bytes.org>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 1 Apr 2025 18:42:04 -0700
X-Gm-Features: AQ5f1JoX3xnYztLWp_wgScsrJ4TFMOIXuaVVUPL1mQ_HC206wWjXSCc2kyzURts
Message-ID: <CAAH4kHauJodNzsZgQjCLBPbwQiZW7FDzkJd5Bx4aQder=xHxxg@mail.gmail.com>
Subject: Re: [svsm-devel] SVSM Development Call April 2nd, 2025
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: svsm-devel@coconut-svsm.dev, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would like to get a clear go/no-go for the proposed
SVSM_ATTEST_SINGLE_SERVICE_EX addition to the SVSM specification so we
can get the ABI committed for Linux to accept the corresponding
additional WO binary attribute for manifest_selector.

I have patches staged on Linux v6.15-rc7 that I won't post on LKML
until there's agreement of the specification change:
https://github.com/deeglaze/amdese-linux/tree/atssex
For SVSM_ATTEST_PROTOCOL support, we need to first merge the same
memory read/write from/to guest memory
https://github.com/coconut-svsm/svsm/pull/653
Then we can talk about SVSM_ATTEST_SINGLE_SERVICE_EX in
https://github.com/coconut-svsm/svsm/pull/662

On Tue, Apr 1, 2025 at 8:52=E2=80=AFAM J=C3=B6rg R=C3=B6del <joro@8bytes.or=
g> wrote:
>
> Hi,
>
> Here is the usual call for agenda items for the this weeks SVSM
> development call.  Please send me any agenda items you have in mind or
> raise them in the meeting.
>
> Europe switched to summer time as well, so meeting time is back to
> normal for all US participants.
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



--
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
