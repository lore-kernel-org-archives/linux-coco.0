Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC4F4FA
	for <linux-coco@lists.linux.dev>; Wed, 12 Feb 2025 00:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318902; cv=none; b=eZD4rVnMGj5LMWLXrtwQzUtWBpjogZ3riVSBYLrA4G7Lmu2VB9IZ7IcbkHDZIm6O3e9ABqpZFWHECCGcrhlFsujr3VMjZU8Jc2IsdqUiR71LIv4pQsm6qP7DGMsjfGUo/8QqGoTHY/sBgN1pbR6kq/fUKztN6paIdKq99ggF6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318902; c=relaxed/simple;
	bh=oLYsr5K/EnOE6Ps4r/pTLeznQ2IgY4c6G0iy2zWPqsM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AXW3KQ3dxLk/eANSLo8r2ip92BZywk0Ixy4o+3ZsUtptSSqkAtsv0iFiBfZV7FVLcI4b8tQXbDjYvFBNBL+Nx3k/Y9mIFXvRdulmoR3wTES5QCCzcQzUMY3CIFxsfAl4zA4onF6G47DutOJVkiKo0BEVMsB2t8Ii6+l1u6KYJNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qVHCPXPa; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qVHCPXPa"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso19315310a91.2
        for <linux-coco@lists.linux.dev>; Tue, 11 Feb 2025 16:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739318900; x=1739923700; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h1XiCMBzc5zO/l6anZRBbtwTnK6rTlocvFZ6R2e8ekk=;
        b=qVHCPXPanPpc5A3tGtuIoMuxkLeWtMmH9utyKf3mpyNEV/MCjIzPTBYD0wulBHy/JX
         /wA6sr0gbXW3qYHpMzMtEvLszye9D3trG79wWXD5UHN2pecRVBtZu2SRRhEnAlOx+4Fa
         6OGcqQDkq2qczPqT5/a155vGK/+HsmcJX8VuWfYmh4igMBRPfYO4ysqVIBBND4Hnasiv
         T21iBvz4sK+dal2sCEum17BXLNKoUU8+WiJHD232JD2EKH1XQS2FBx6c6e1nZ9ahS/cZ
         Hh6sBwK1RyZJ5rgw3KEGEZlvortNntQfu488cuuD13wZE566ztsPK9YAiBajapbDljBS
         2MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318900; x=1739923700;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1XiCMBzc5zO/l6anZRBbtwTnK6rTlocvFZ6R2e8ekk=;
        b=WT2jwDV1C25YZeJjvHdq+qXCBwNdHp23klCZxKSVNP+QXd8LqwMvlHpEHxkqH32Rzf
         U9UJHGYljHkPsEOxgN+VdSIj30iurxHEp+3o0kFD6WtDAYRSO0Z8wUu0YiMyHcRV68iq
         PzoMsGfOldyRXlVHrti3sqmZLHHbE8wjCWvbaVV+i4dLxOkZAbBcXko2kXcF1DAOa6bz
         01bxep+dNEVseH1n+bBWqYKj6A3Wf1Jov+kwLPsC2wuWzukR6AEToPCccuO9nUv39b+1
         eUvw75MQL0l5fZ9HuY+b3mOVnrLHJpdRbeJy6cwlXD7ZX2RkV9OwpxPJdMHKPLYKLjrM
         GnEg==
X-Forwarded-Encrypted: i=1; AJvYcCVkdrrdoAuBiAcNztQlm7IY+VGcIgHd86TMvpXq1l9VePnWaRCuAnw/7kyzvB1ClRRtAkgi6vWn07Cu@lists.linux.dev
X-Gm-Message-State: AOJu0Ywjt1nB/0D3xLprz7YsIUYcG11ICk0xlxhF4FiKhPqPBA44ykEp
	Mx0mlNyQZFz80M8SZAXK/IWwcniWx81nXMEfDkYT2TrPUulpHqf/HcSPhMpVWt8rCwgsLRcvA7F
	XLBc0dnd8a4XAwLHC+w==
X-Google-Smtp-Source: AGHT+IH4Aastc89G3lK7Kpren76shMv1ca6utCycZ+bUZsHekNg+thxZju67dX6Db0XVVQa0m/oRTqmDN+BLbf48
X-Received: from pfbit9.prod.google.com ([2002:a05:6a00:4589:b0:730:8636:67d7])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1c8d:b0:730:9860:1240 with SMTP id d2e1a72fcca58-7322c39c33bmr1528792b3a.13.1739318900587;
 Tue, 11 Feb 2025 16:08:20 -0800 (PST)
Date: Wed, 12 Feb 2025 00:07:46 +0000
In-Reply-To: <20250212000747.3403836-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250212000747.3403836-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250212000747.3403836-4-vannapurve@google.com>
Subject: [PATCH V4 3/4] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, 
	Vishal Annapurve <vannapurve@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events.

Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
to avoid running into scenarios where IRQ wake events are lost resulting in
indefinite HLT execution times.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index ee67c1870e70..54baf93d9218 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -393,6 +393,14 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	/*
+	 * HLT with IRQs enabled is unsafe, as an IRQ that is intended to be a
+	 * wake event may be consumed before requesting HLT emulation, leaving
+	 * the vCPU blocking indefinitely.
+	 */
+	if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
+		return -EIO;
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
-- 
2.48.1.502.g6dc24dfdaf-goog

