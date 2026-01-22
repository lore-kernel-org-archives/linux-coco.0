Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E137F37FF67
	for <linux-coco@lists.linux.dev>; Thu, 22 Jan 2026 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769108286; cv=none; b=PeFOhg7WzsLM221CnVtGoB4CIaI9/YAaaRoVLWDY4f4+dDIr/cJDRLMUHGvyTFMxtV4ALnBjJUyOo98L4EPAlPRRZSqrN1dKnOhMOPXCx2suWD7+QSj1WfLH9wHCSCRrN10Q/gbYD9mQcaP1m4yZ+MErTjwZvFvWRKC+KMj9FHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769108286; c=relaxed/simple;
	bh=d34p6v13y9LldsQ32tizZwohUqavOqMHSooqXpNjdxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bUpJS6cKMPT3fiiLANI6IVEHRR/VFQyYWiLJGo8XC+dEf8bQJLvRszBPHPnbNxzdy2s+A+YMoyi3RmgbXPdEkEBaskbPDRwdmOxcJ3R6LS4xdWISlH6Thy4DvKBBGjo5W7MxoWfvGuqZWpDYPvxSzhUn0/xIVb19uGKxeOLVdR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I4+WNIZi; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I4+WNIZi"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a0a95200e8so9564895ad.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Jan 2026 10:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769108273; x=1769713073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5qAnOIzC0/GWp2cBgw/6glGUTg+sJlkytJJyvlhY40=;
        b=I4+WNIZiw0O37Z3Ez6U/S0fwnge+iOqdcqz23i2DRooAoalY4nDcj2jVCIaTVeUnjk
         MWNOJN5rfhEUq/vWFrYmfDF7fHlkQA3pw3SkYhqTT+E0kDgpMePirWy+9PMQfa+ExS3A
         UI8bDivrfSwDDZq1iGIT8hL8ndhk3K02S09ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769108273; x=1769713073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5qAnOIzC0/GWp2cBgw/6glGUTg+sJlkytJJyvlhY40=;
        b=puKeL2EnTRzu0jUwVcYDQG7JtqdSqQY8kVRvAO2r2JD+UOXYiROFg3vxw5w3ABu7zj
         k53ZzFunW5rdi37YTDYhvH8ps+QdENd5O9teHKc2bJW7pxgJKWB2vyqkdoGCs8AlGbZv
         6d9m7c/N4MQLmV58vOYA+RVh1KarNAXFrXONJjiFajAWDMUH4hIvKKeR8eKQPnCKdgNp
         0/g+ZBFoAwwqa/nUDT67DVSSmZqFsIyrqeFXkqjfnlHxZs8jGhVWO5wg3+ECoVXVzh38
         ZxG9yGr7qBzGapEsV0IVBita74IA3cweHRlBsYyhfvzeEUdG589G8Kgqvvzwt72uae6Y
         bx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMUbYUbKhgxMSU1mxCQtnpGQZGNhpXBnNn9JQN3wjKaNVZ1yP/kBZBBWHNqKqvdVfesyXopZsRD+yY@lists.linux.dev
X-Gm-Message-State: AOJu0YwNaC22H1VOViQHmHwZhyZp8ihxTKtF3lg07BwnBifLzm+V94A1
	cNBUXOlEhXoM8Hl3/WT9JVzw5gm5+uHxOMUVfCwJ5nuHSqjybLAUekH03JEHXUg7ag==
X-Gm-Gg: AZuq6aLGAPwa27IYLW9+hj9vt4sJO5LmPDVaskkRVuS2QUFidR7AdSI/JWwQsoVNO09
	fZQqWauDRxgAiKxHQ3oKNAD/fCXYBO1iLMJNISdO2mML0UBuVyjup4qRBNrevaTbnZKQRGDI7Th
	VGquqjRQ+aTUO5F/j+1glOFPi5c9WVTn26ozrB7BGqKKJos5S4UwSJtR42jPiGNZep5MzOvzkgB
	1HcWsOmtYVju3/y7A6Nt+F31QKyMjKvUL9W+67hmga0gltQcCp3t9Utw61x3jJvOfx0MJ1dt7kt
	a1ExQRVpz8SzZ+C3n2uuVYOTwbsO1M3uhtj/bqn2ZAI7lIpLIf/YaEDv94DvsuheaQpnUzYw0Lo
	zfk5LMu+69fkukYM3EtnjUxb2anNqGUd7kIuUpylCS3OWSB4JCR5Y+brS17s3HB/rjWiwAR4MSW
	OMs/C8Ww/0
X-Received: by 2002:a17:902:daca:b0:2a0:bd93:4dbf with SMTP id d9443c01a7336-2a7fe56ebbcmr3541045ad.13.1769108272685;
        Thu, 22 Jan 2026 10:57:52 -0800 (PST)
Received: from chromium.org ([202.144.206.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71942248asm191926615ad.98.2026.01.22.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:57:51 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: ubizjak@gmail.com,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	kas@kernel.org,
	kees@kernel.org,
	linux-coco@lists.linux.dev,
	mingo@redhat.com,
	nathan@kernel.org,
	peterz@infradead.org,
	pmladek@suse.com,
	rick.p.edgecombe@intel.com,
	tglx@kernel.org,
	x86@kernel.org,
	Simon Glass <sjg@chromium.org>
Subject: re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
Date: Fri, 23 Jan 2026 07:57:39 +1300
Message-ID: <20260122185740.50298-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

On Tue, Jan 20, 2026 at 8:54 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> The EFI stub code is mature, most current x86 systems require EFI to
> boot, and as it is exclusively preboot code, it doesn't affect the
> runtime memory footprint at all.
> 
> It makes absolutely no sense to omit it anymore, so make it
> unconditional.
> 
> Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> ---
>  arch/x86/Kconfig                  | 14 ++------------
>  arch/x86/boot/compressed/Makefile |  2 --
>  arch/x86/boot/compressed/error.c  |  2 --
>  arch/x86/boot/header.S            |  3 ---
>  4 files changed, 2 insertions(+), 19 deletions(-)

At least with QEMU the EFI protocol adds quite a lot of overhead.

Is there any actual need for this?

Regards,
Simon

