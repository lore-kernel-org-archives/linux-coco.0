Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DAA31
	for <linux-coco@lists.linux.dev>; Wed, 12 Feb 2025 00:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318892; cv=none; b=WjVM6u/rb08oWsxTPZUr51DQDNtCy/tV+bptVvjl80vDB93EwHYOyvIxg/Ch/v6VQYsuS8dpJBQJqTiiIAsazpc7wkJ+SFlpGH0GAdyNRU+obs11XmN0cMHZcM2PGdbeWRpJPf41kR8cDjotSrPFy6d5Lcp05T6Eu02sGr7MQy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318892; c=relaxed/simple;
	bh=NUIu6ItD9FeDqWH8xkInRQt8g/4cfJZAGn3SPtdFzaw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ggiwWgjzqpNrXeGZMk4IPV3bOTGQKmonYapIkz9MxvCa77Fgic7Glp+rrHZPa0RZxXKBPY1AH5knPpav1eGM26K0YAMmDZnOU3AsB9fWvVJSp7ikmyFlH/dW/S+DJGWjutX6rNSPptj0MDmmMPCVvyFrT92vrNA2J40oNomF7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SvhQk2ZY; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SvhQk2ZY"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f4666364bso94280445ad.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739318890; x=1739923690; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8liIzcHM1u3spUczGIylHihN/wKkhBUQv4w7iAOlX5M=;
        b=SvhQk2ZYoTCl0Wu60GWyLnIZHB0FS51ePxxCM1t979qfDZaH/S4QO/gmAKdlLgrWai
         c2hx9maAxjLFKJg8VbQ9FlSkMPxG1I5wlF7hwt54DE/0mri0UF3ca3tn2Keyz8V8Jj8k
         UbMPvFIiTeSAxLjJL2F8SFDFMIT4Uip0ao3q6cngC9DnUd1zOpOw0HMTTNuVDWYlOAxa
         ohL2zXcibye/rYX0J7DRQXvXugQu1+T9VtbWUPmR7vtKMSGZK0imzXY2FDALPh2/+CaU
         mwaJsi9LkJMCSHkA4IzZYbSbcDiuM0u7xFXFlWxsM0sBCF9gNyXLLvTZd/bgxvYbCUHH
         l+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318890; x=1739923690;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8liIzcHM1u3spUczGIylHihN/wKkhBUQv4w7iAOlX5M=;
        b=XkHzTU4+1PGAvt9xnhtMuNIc0ivq1lfkIleZdvHajsk35u3UYutkhufKnGMxBlrmvE
         bbmrgy2QMCxWZdpS/mhSX24tcyxIZ6KzU9ZRH5nNlAZ6td5LI6UKpkFgdD0Y4UaDsSp5
         8aoaG7mDcjaAP8oHTLUT7LaqtIfxnXLZaAeCp1WNJjqxkJf90RXyIqXnqNwjhJRo8Khy
         lTHta6HoWBgymOZogmoQF7MjXw8c/csEtsDP2lIb7y3j90g8HM+iHWlhARxS4BGIRweD
         yqeVdJWeDXTOGqo2eFkbQbzk6j8Jhnzg+QRNJKjOiZbxaAj3ft+G/cJSlPJvCsgZ1T12
         JCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2H+C5G9Vl9VlvlROgZOpd7oMDcm6MUeAKODwyj/aGxwhwdqiFXNvl27odIa/1nWZziX1pwVW/vD9D@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvmre+9k527xVbe347FGMzKnZPIr9ThGIR3p0IAF9i5n+V9RNM
	WwsFZpbqrub4rPROKNMpunL+7npLyLKpw3iW5vP1GRHGkuCU6CaeLF/FXalhtJnpGcVNxj6LGPV
	lbCxj5qJfPXdg2DzA/A==
X-Google-Smtp-Source: AGHT+IFUbic7UcZHlZI20OaBNl3PcgI+xJhqOVHOTiFk5ZY7KlF8UkqOfMCvhh7294PPKjpCpkxmmjn4WfS7sXPU
X-Received: from pldw12.prod.google.com ([2002:a17:902:ca0c:b0:21f:4bcb:f256])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cece:b0:220:bcc5:2845 with SMTP id d9443c01a7336-220bcc52b4fmr10063065ad.7.1739318890234;
 Tue, 11 Feb 2025 16:08:10 -0800 (PST)
Date: Wed, 12 Feb 2025 00:07:43 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250212000747.3403836-1-vannapurve@google.com>
Subject: [PATCH V4 0/4] x86/tdx: Route safe halt execution via tdx_safe_halt()
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events. So "sti;hlt" sequence needs to
be replaced with "TDCALL; raw_local_irq_enable()" for TDX VMs.

Changes introduced by the series include:
- Move *halt() variants outside CONFIG_PARAVIRT_XXL and under
  CONFIG_PARAVIRT [1].
- Route "sti; hlt" sequences via tdx_safe_halt() for reliability.
- Route "hlt" sequences via tdx_halt() to avoid unnecessary #VEs.
- Add explicit dependency on CONFIG_PARAVIRT for TDX VMs.
- Warn and fail emulation if HLT #VE emulation executes with interrupts
  enabled.
- Clean up TDX specific idle routine override.

Changes since v3:
1) Addressed comments from Sean.
2) Included [1] in the series to fix the scenarios where
CONFIG_PARAVIRT_XXL could be disabled.
v3: https://lore.kernel.org/all/20250206222714.1079059-1-vannapurve@google.com/

[1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanarayanan.kuppuswamy@linux.intel.com/

Kirill A. Shutemov (1):
  x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT

Vishal Annapurve (3):
  x86/tdx: Route safe halt execution via tdx_safe_halt()
  x86/tdx: Emit warning if IRQs are enabled during HLT #VE handling
  x86/tdx: Remove TDX specific idle routine

 arch/x86/Kconfig                      |  1 +
 arch/x86/coco/tdx/tdx.c               | 26 ++++++++++++++++-
 arch/x86/include/asm/irqflags.h       | 40 +++++++++++++++------------
 arch/x86/include/asm/paravirt.h       | 20 +++++++-------
 arch/x86/include/asm/paravirt_types.h |  3 +-
 arch/x86/include/asm/tdx.h            |  2 --
 arch/x86/kernel/paravirt.c            | 14 ++++++----
 arch/x86/kernel/process.c             |  3 --
 8 files changed, 67 insertions(+), 42 deletions(-)

-- 
2.48.1.502.g6dc24dfdaf-goog

