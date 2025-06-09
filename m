Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1596F21CC6C
	for <linux-coco@lists.linux.dev>; Mon,  9 Jun 2025 21:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504069; cv=none; b=RdNSzrxmEWvKQ3LVhknFXCXC+4K9CKyAPJTLZ5afsx+smSi1jAgjtNBtvsc6eUJn2FTP1uThcu+rrPgCA2EGuTtSkYXbm6KsND/juE6wfSzcm5IwdEsN6fIKFkNMa35fs5iTiU4sTp+Ze1K8vrNOiDDocqusqx5iLq2lHmxHCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504069; c=relaxed/simple;
	bh=pZDS3AQTrG4Y/KmeykWPXxaGdgy1W132Y36jhq5YBwk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eD0T/4OWMSyUWPaa9UHaZ3+6qfwE1fTcr1lPCFIuchxYTfamlG7FyqpnpXad2nKVgNuzVo8stqjb3ZSyPif21RGxas/xR15JOqqTqwd7/OQMVlj/f9TmUJzQNqxLaV9EyATZLEPB1uhWejkpYULikjRTuV4n2IdklQr4lOemEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1rSZwG/B; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1rSZwG/B"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e7949d9753so559471137.2
        for <linux-coco@lists.linux.dev>; Mon, 09 Jun 2025 14:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749504067; x=1750108867; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pZDS3AQTrG4Y/KmeykWPXxaGdgy1W132Y36jhq5YBwk=;
        b=1rSZwG/BMAK3AdYntHGcTht4BfTtSqjOySj9AcCb41+SvfAw8X6Ci2qr9k9EDRVXN3
         6H2pVIBRrYNxaKvd5ptj6OIdmP53j6nSKJ0bLJh5VlTx4YzzGwFoQjrjd4BM3U0/QWsu
         M2SWAhduYWjMbOthPbaY7tg1XZs4Rrl5GaSf+akut4uDwXbzXP+WSsYbVvnu3ooLt32B
         7WkeAnkBW11TfnrLPPQ0cjSLhpKFEthzUAauLEvRDXv7Zb+3x/enZpnMa9zSMYfoCH8V
         C3mCWxol5/Bnu/I8Pej10lLANOPA3P7hMRkr5Sv06sc7588KrWCYrdJgCCU3/vwF6hK7
         xzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749504067; x=1750108867;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZDS3AQTrG4Y/KmeykWPXxaGdgy1W132Y36jhq5YBwk=;
        b=VuOSCOVoz9SmtvNMBYoBFR9gGyah5Gma4csCVbjfWQQUicIJNUsLKGLsXuoKo6Rtot
         TcZL6KQjoKBMgqm8wRnaZOr/Hwzvx0WqftTUa7euXw/BqO3TFFKwN+LWb/10HVRfqszR
         0W+R+93qQQkUyKl8juxpaC7/dYkTM/UnWKHobFe4gJOVeEI4Nhz+s2Hkv+Ir9oo1Yb67
         IgLq7FDhMT6xBRZNjn93A08J27S7Mrty9aOR+ficmUhhcGvnQUS8pRwmtwVhM5jISlsr
         6JE0OTt6Pqha29pp0iNzSJJAaEclwwl6Z+Iva/CrTGFQRs64EXTJISj/efi1BaGtbQ2Y
         FVfQ==
X-Gm-Message-State: AOJu0YxHPvvr4ZTNNEU98rlqr6a8aDe64XHX9sgLdcEtJKlHe5gfw304
	hLXfaC91t/Xh2HxMqcactQIz+RzmlFOZ/wOVpOelVTHIubU42H9WX5bNAPVNpuQAtbJSpK+1YyZ
	wOxIzZStPx1s7LALPQkcS6QwFZcl6wnc6WiO5ED9ArxQWv7ikmc0H+Hxeokg=
X-Gm-Gg: ASbGncun4at0Yc0U8/Ds474iYPgu5qRKO+P8hC87KSoqy8fd6QZmGsSbqUlgl6tbho8
	xBeWS7SfJOwKVuCKa/ChGUHqcZinzJsnOTyQNRmyOdcUFzp/pmPZqhzx0vN6MGUOkOhz8OKyEut
	LKUHUh0jDPAwARLJB/XKkPl0fGNtFY4PCcdVQR6sXRVJUp+v1cc2snjp+3l9wJxQqqtIcl1ZXqc
	A==
X-Google-Smtp-Source: AGHT+IEAsCVUBZHQCKLR7xg12ovz6HkqtBnvhqFoBcoAwFQ9xt4ZwBNZ76e0CScbtF2EpTUjPtslFL1DiJyNZIrU90Q=
X-Received: by 2002:a05:6102:3596:b0:4e6:cc35:3cb3 with SMTP id
 ada2fe7eead31-4e7728fe529mr11590064137.12.1749504066436; Mon, 09 Jun 2025
 14:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Steve Rutherford <srutherford@google.com>
Date: Mon, 9 Jun 2025 14:20:29 -0700
X-Gm-Features: AX0GCFtVt23ugcSWhlzsj_azvAu59FdOeCRN8vbyb8EIjmB-0LvDdw6mbqYV7cU
Message-ID: <CABayD+fcqro3PtwSbry3zTwhma1fnNUiy0fb6UnyPPUrVbvajg@mail.gmail.com>
Subject: CCC Kernel SIG Thursday, June 12th
To: linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi all,

We have an instance of the CCC Kernel SIG coming up Thursday, June 12th at 9AM
PDT (6PM CEST).

The agenda is currently open. Feel free to drop something into the agenda.

There are a few off-list conversations I've seen or heard about that
I'd like to push into the open. I'll follow-up and see if those folks
are interested.

Barring anything substantive being added to the agenda, I'll cancel
this instance on Wednesday.

Agenda - https://docs.google.com/document/d/18D820gyt2xe84Jy6dGXgrNThApoozcekDzvIlK2_bd4/edit?tab=t.0
Zoom link - https://zoom-lfx.platform.linuxfoundation.org/meeting/92401169243?password=e6c02995-6cfb-4f90-82b6-747f767eb168
Calendar - https://confidentialcomputing.io/get-involved/calendar/

Thanks,
Steve
