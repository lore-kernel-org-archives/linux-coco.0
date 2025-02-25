Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA084C6E
	for <linux-coco@lists.linux.dev>; Tue, 25 Feb 2025 00:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740444440; cv=none; b=MDdHfNble8LIK4ujxzBjhUBUFwJg2kYDFdKZEQ6PMjInLV4YfHNTevdNyuIWQ7Nfal6FAX5zK8ltCsnY6/h+hTApbhs9viSPzXD0nGZlKK42gaJboCZGqGmu11g2QXbhHYs7P3tlbC4vi4acimEdIRfKDGEvtezoDukMQTVqVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740444440; c=relaxed/simple;
	bh=Bti+4WFdsQWdwawsSlCRg6Upf2HmU0CDyT4BY606188=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i8RVpdwYXtdgCe+EJUvNq3r15TgNBrKQIaQxncnPwtte6VfgK2FV9JwhBm6ct92L9ifXYwgCNu/+G/GMLODUG8p7JtegDOOhPAJpV51dBSbs/ZAs1UQbuP5mXsqlBLtquHvksWbLndFm1VElnOzbDoXSDET/i6D83CFypikXodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sD+HgV55; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sD+HgV55"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so10864949a91.1
        for <linux-coco@lists.linux.dev>; Mon, 24 Feb 2025 16:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740444438; x=1741049238; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I5KMzQoVShSgVrtM4DxTTsmM2BWrfSX+7bpV0asZP4o=;
        b=sD+HgV55drMpGED4TGzvi1AO7i/SLQ7gBOLy+RV9qHdIDwInHwXvFlSsRrSDDPMZ2O
         QUXDAQarhG9lxX9OBu8JaBMhKtREAVk45ptCwPzz4wGtotMQT4dkJpYIeWOk7kfP0Orx
         yaUMy2zB0yBtK+qXXW8yxaJ5obfIfz3UYmb9nzu5E0BkLietFX/oAo7yGauPPPbni7CD
         aNnQjMCkHZoBQ9Q1Cs7r284LY9Z9W8Dq/AkF1c20Ng7K+7VETTDImhZhRpZ3T0DUofVL
         3t/uUXurJ8pZRDk9AeFGDyrdxqNOaoabWGw3NHAriSU7Qa9/VXzSHwagKbQk+ipqlQbw
         L8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740444438; x=1741049238;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5KMzQoVShSgVrtM4DxTTsmM2BWrfSX+7bpV0asZP4o=;
        b=UfsrIggXt85Rv5YnYtm+ws2//w9ch4ZDFeOxi6z5zQzxvmV/k9B++k1wuuxGS7qSxW
         9Qg+DL4HR5zsVtorDoZnfqFgojlDROSUXi8awbVN2SiS9AAicN/VcNr4DkoYPrL9n7S9
         asaHOwYLaHGzqhkV8DWre5MxVu0wnan0SrdkNZCWZSW+Dn0lqA80tSVP07k0Hi0sd7hx
         Bx1QkcL4Z7MOD1gtlukFfqhXZsM60GHgIJOBnIvgGnHfsgLVvHM1eL/xDg9dTrFdcGFn
         G1NrXDj/kBgBDKAjedxaoij7Dn+66/Q+mZYxXyoQz+o7Lb2rI4bnYoiZ5wCCPqS7oe70
         WwMw==
X-Forwarded-Encrypted: i=1; AJvYcCWb2+XuFtyanQypa7eCd5IuvhW40fScYqEkrFZTWKERmIi8f2yvB5XzGPMq2+JJJBRcBGzNQBcdR6Qc@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfz5pxZf3dAGro/euWyQuS/S5W195CeRrgVjofibZZxr/b+dOl
	WmW4M2nLeTBbQjeOmgdZgeKqcID1CSFCNwmqBCnj1wEinaEegJJPQMk3AOsZrK8zONNxXbpPNRk
	7TB3+pkV8YLdgovXQKw==
X-Google-Smtp-Source: AGHT+IHpAVDfWrqEo9rKctpl0ggmR96y2poe6zx51fhSxaTxTg/nRaaD77F/bbkyc7Y8iGsQ0zvHJqrkdR2Dr46s
X-Received: from pfbfa9.prod.google.com ([2002:a05:6a00:2d09:b0:730:8566:41dd])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9215:b0:1ee:7c7d:e66a with SMTP id adf61e73a8af0-1eef3ca2d1amr25377522637.23.1740444437979;
 Mon, 24 Feb 2025 16:47:17 -0800 (PST)
Date: Tue, 25 Feb 2025 00:47:01 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225004704.603652-1-vannapurve@google.com>
Subject: [PATCH v6 0/3] x86/tdx: Fix HLT logic execution for TDX VMs
From: Vishal Annapurve <vannapurve@google.com>
To: dave.hansen@linux.intel.com, kirill.shutemov@linux.intel.com, 
	jgross@suse.com, ajay.kaher@broadcom.com, ak@linux.intel.com, 
	tony.luck@intel.com, thomas.lendacky@amd.com
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	pbonzini@redhat.com, seanjc@google.com, kai.huang@intel.com, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, 
	afranji@google.com, kees@kernel.org, jikos@kernel.org, peterz@infradead.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events. As per current TDX spec, HLT
#VE handler doesn't have access to interruptibility state to selectively
enable interrupts, it ends up enabling interrupts during #VE handling
before the TDCALL is executed.
 
Commit bfe6ed0c6727 ("x86/tdx: Add HLT support for TDX guests")
effectively solved this issue for idle routines by defining TDX specific
idle routine which directly invokes TDCALL while keeping interrupts
disabled, but missed handling arch_safe_halt(). This series intends to fix
arch_safe_halt() execution for TDX VMs.

Changes introduced by the series include:
- Move *halt() variants outside CONFIG_PARAVIRT_XXL and under
  CONFIG_PARAVIRT [1].
- Add explicit dependency on CONFIG_PARAVIRT for TDX VMs.
- Route "sti; hlt" sequences via tdx_safe_halt() for reliability.
- Route "hlt" sequences via tdx_halt() to avoid unnecessary #VEs.
- Warn and fail emulation if HLT #VE emulation executes with interrupts
  enabled.

Changes since v5:
1) Addressed Dave's comments.
2) Dropped the cleanup patch for now, it can be discussed separately.

v5: https://lore.kernel.org/lkml/20250220211628.1832258-1-vannapurve@google.com/

Kirill A. Shutemov (1):
  x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT

Vishal Annapurve (2):
  x86/tdx: Fix arch_safe_halt() execution for TDX VMs
  x86/tdx: Emit warning if IRQs are enabled during HLT #VE handling

 arch/x86/Kconfig                      |  1 +
 arch/x86/coco/tdx/tdx.c               | 34 ++++++++++++++++++++++-
 arch/x86/include/asm/irqflags.h       | 40 +++++++++++++++------------
 arch/x86/include/asm/paravirt.h       | 20 +++++++-------
 arch/x86/include/asm/paravirt_types.h |  3 +-
 arch/x86/include/asm/tdx.h            |  2 +-
 arch/x86/kernel/paravirt.c            | 14 ++++++----
 arch/x86/kernel/process.c             |  2 +-
 8 files changed, 77 insertions(+), 39 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog

