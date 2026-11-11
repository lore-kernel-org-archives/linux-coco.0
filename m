Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417444;
	b=hadTkVg8iNlq9wjWWKnEs5IFMXMjGGgV51h0zrMZMTUJgEF+AOa6Rm/tmDprV+rdjDLL
	 mY3wAJSGeJ4xQM2d2RmdWrz/js5xIF3waXDWxi2hXqgPkoVEOwXOw+G5oDOe3JOsjkx0N
	 JMrulEcrMeaIeGV5GjTx/qSWwppN9XOb4os7GeH2gba9RVk+hyU6l7syTTEqsOdyqkt9z
	 4SE8B9KAkAADzrkMLfIHzrAujcoYbjxfn+F5BrJPxyVe4yJqjT4JB7fLlG6xfyaTQ8/8p
	 QHbrSqPm9oydJMh+H06Y9g4azVDMX2BFQemylo5AU/sxwHl1yB+Nn0FAW8TlUBtGImQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=CHXsNJZUxPCo5A6HmwAJQBYdpTzsqa07OU0Prn+ncRc=;
	b=BbFqHzJ0Gl+De1DW4IzTB8EFMKNPKdgthBPiLsjvSA2L73nELvQ5wmYKhn+cBlePfDdt
	 L50BBD3skkLrPvVthI0z3BpOtZ5HTBVJQYMm9Ez1idWy2JMJ/NiRLn+6pwh2JGwxmOzz3
	 18QI1kPRZ7a+wN7ymVLJeVhlQvKLzsfHvyspCoCMqdJEm1I5MiXg1y5+l/bm9A7AYVdp+
	 CPUhbPYQVZ2xP1+gSqjTkNNP6/RvTK6zgB/Csk2pf9Zh8vCqa4eL3j0fOyvKAJAZy01fQ
	 3AanrwWGuG2mCva9ruIiDWm71c7BNo8MCoGUtI9wzi0uooahYQQ4WXulruY52JgfUNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QL1ohugN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BA3606A324
	for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 17:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BA3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QL1ohugN
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91e98301805so33479436d6.1
        for <linux-coco@lists.linux.dev>; Wed, 11 Nov 2026 09:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417443; cv=none;
        d=google.com; s=arc-20260327;
        b=pYlEI7El4pzkMHAzVV5nj31eITZZt7fe1Do8992AiYev6PDaqjt5eDhtCbcVQh28Gg
         SVLSu+DqiMAHIaQZLmhYPlphhTjBsi/+AbNQXdJv4zcobFo4gvSzpjcmtHQnYZMhRP2s
         TPe3pUohHOgvWUHmoQ0qkSRmjzdgm1hl5BjcFYkTDfqKF1GvlaPq7ouTtXrvKneNUIyG
         carHN6G5NDjJJC/Kfda6AIB4Q61K0hA1bBB7SZIpqOsxG6TiLE/Sm69J8tNf3tHz8dmA
         fC4MfAGt3mckxe0yhN8G8blA2EJa+oNZiUTUm+ZK33flikKtKb0pGJurJLQ1IX0M31A4
         VVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=CHXsNJZUxPCo5A6HmwAJQBYdpTzsqa07OU0Prn+ncRc=;
        fh=Gl4NfJmnFHBxqpjcFRGUKAPNlLucdtvGNNqV0bv7lHI=;
        b=G/KyFyMWdDnDRBU6zIvvj2xEyuIgPqEoWNxUx/WcW8UcaLIQd1PcutA+tWr2lUNDzq
         zXY3TjEP35BFy+sCo4J9ua9Vlx23sL/0fe9Fa6lMSUlrUCWPVKQqB6iwuJep/i3I6iw5
         6Qc/42+LaHpYVwC7ZkHvSt7ozvKBLrDaEBMWU0HiSjm8eaErGVrIrwfyvZ5pjo9Fi8g0
         aX+2lRmtfOxOpxPCcoMWmZLQQFgk2QMBalc3d88hkiERFiSNYEYZg/4zaIumbIMZBXAl
         KaA/ygfbSqZiq7e3lV0b676sKlFayO9ETMJQcM84R82C7Obwb8QSelr5UGCdPTjkmWTs
         e0Rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794417443; x=1795022243; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CHXsNJZUxPCo5A6HmwAJQBYdpTzsqa07OU0Prn+ncRc=;
        b=QL1ohugNLdL8jKmBRtBKT0BUwiXjS8xKbbQ8cGN4mY7lgPhJkKU2k69N374Z9m4NWL
         gWz+gQ/gBoUFoiV3s7bro5c8j0dI2lR4rr5v7j+agEdwk4bkfCSHhEgn3Apo2SWVMSva
         +oQUMyB6MG3hZLYehRqYvikLqshrzAJ8d4+hOV5K90CUo4zEYIOluUOgdzfMFpPrApNf
         y/wBuCaJdxpxFrmmxZqWaXfwxD8SZCoKcRwmKWcejgQzNk4ViS/zepcGLiIGJ61k2K7C
         xf6cbYDFcdp0ZqR74DQAOWUKSyF1Gr72L1Duiuye35qxg6MRBAHe05IA3Ko2qOsttFGQ
         CIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417443; x=1795022243;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHXsNJZUxPCo5A6HmwAJQBYdpTzsqa07OU0Prn+ncRc=;
        b=tqgscx5vNYhJpmsW4fvQIGSdUr2eXSLJ0aWSgLAaeSqaATN5HXAZczMfR5Bb0M46IT
         c8CiGHLg7To0fV24pqhLP9e2VY8E6JB4lGlkxYcvHM+Hiz4wzWzcClqvcYZ0MmoqpcYh
         qRhAX8CtaLJikDiP4s1y2dODYsSu9IVS4cqf57rM7eAByq4lv1IVal+Lafa7BZrkrgws
         fC5nQxOe1CUy3nKA+09wJQTfQFyocSKFYHXJKnK0dsFwqGfZDHcIr0Md5IApylmaeYSx
         U3PHbyDtXxSen9NYH/0JnN/Vsx7OIikMBth7nbjLziWVcWzuZLbGOqCt+NQF2q3Q9DUa
         W1eA==
X-Gm-Message-State: APuU4Z+OFm2Sh30UVkK4udpq8fHKEamzgaONZSkWE9yI+xyozsCZcvXc
	pZs0SVfqPQLjStc0dEZ0b8kfhwdAjl2lDM1JZroORV4s+fC0uQJG7fnNxOfIbOhqukuNAzWzY/w
	K3i4cLXZSTPf8MX5LVAh7MAOP3Fe7J+CzzMz/CS+BhNxmG7jcQfMikNYaAXE=
X-Gm-Gg: AYBFou1KRcM3HQKgpLgSgUEK+BuPqzuL3WEvQua22T2LZ1WFV1kHr5hEoRfvK3Ctuwq
	TubfLpvvt9ec8xQ28xXiF1Zs2S70CQAeoi69q8M3L18RW1dojssK2zxltMzMD7y9QxwC33rMqSQ
	HZtWpFHYlIx8InLJa8YwErcU7q1AYHcqITHJ2UJ+XvOryDUzHzyM7/InBJ21faEi3MG/XpP474F
	+5WEmnslED347ra2zUoHizP3IjY34l+wQxHcaTSLEg6iQerqo9sEg1rAITisfEsZ38YGYFKmf2o
	Rx8GZ1SyIRSnfAbxLf+mF2rzrUouuNowN3MgAJBWsJZ6VZTrxzkTeIG86FbJBBbxF/58Ql3WZEi
	edkiI5wE07K21BdL8gJFPeDFZ9YrBQTy/lryoIcXdBfw009WwyK+MF8sfmiqlBPfHRUG7Bs2JV3
	w3dULR8hCwNdDlkVEThhv16gYCD/AmDD+SySl9gpvXJFCJHGAq
X-Received: by 2002:a05:6214:2c10:b0:91e:eeeb:5ab9 with SMTP id
 6a1803df08f44-91f03f95987mr55271816d6.16.1794417436892; Wed, 11 Nov 2026
 09:17:16 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Nov 2026 09:17:16 -0800
From: Ackerley Tng <ackerleytng@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 09:17:16 -0800
X-Gm-Features: AclHuK-JW-dz-s3WPckdlk--4-Q2gCEfYsudv4IbzOOLXO2CTOfiTXaBjvjq8wg
Message-ID: <CAEvNRgHLXryXj57HttDu+ZD6ogS3oRo0A360F0Bt9V1Fu=Rt0Q@mail.gmail.com>
Subject: [Cancelled] bi-weekly guest_memfd upstream call on 2026-11-12
To: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	KVM <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Tomorrow's guest_memfd upstream call will be cancelled in favor of KVM
Forum :) See y'all at KVM forum or in 2 weeks!

---

The meeting notes can still be found at [1], where we also link
recordings and collect current guest_memfd upstream proposals. If you
want an google calendar invitation that also covers all future meetings,
just write Ackerley or David a mail.

To put something to discuss onto the agenda, reply to this mail or add
them to the "Topics/questions for next meeting(s)" section in the
meeting notes as a comment.

[1] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?usp=sharing

Thanks,

Ackerley
