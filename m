Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC9414F9E2
	for <linux-coco@lists.linux.dev>; Fri, 28 Feb 2025 01:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740707071; cv=none; b=f/Rn9Nb742XG0GjvKlpGF6b9pcPrK7us1wMbkwReTBt0C1KkOUuJxseSQKxhizMfb9UPDrtdrTYpNwBvEpr9Rjz5PqC1lU2iMzVtpdY9kR764cjWSCToQW0ZH/TW9mamCgf8AN1t7zoMhfPsFmylKUJZe5kRWXi4tRL2Q6sKfEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740707071; c=relaxed/simple;
	bh=FrAg2JyorIe0/fbtZ6H1UBDcm6ZSzN4dgaVrSF/c0jI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=slvBF+Fxh7Wh4PPWAOI7ar9y80gEleHk6DU2eQk8JwfaY2biGLd57++bL54PzAlyOphaIxkElcmr1IFD4++EY5MTz4hC1iKkj5D3SWcUXpAar+JHhYFRA5JWkDd/GcfuIa66g3yH/DKi4UeljYBGDBVe6rcl33U4nslUH4hzINo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNGAUIVW; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNGAUIVW"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc1a4c14d4so3536445a91.0
        for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 17:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740707070; x=1741311870; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgg6TdslREem8G9twRIimDeFP8lrtGahRwRwSo3/dXc=;
        b=KNGAUIVWHmihG08YuSF+jYzmroBjIdFee6l8eqXrI8zdAOGnZLbIfMCIDsNssXewwI
         YYpNCZGmxOpzYw8kyrJrSyB1EVyI2KfK1mVBbuEX61dKvZ9jP8HTAAbZwmQ9FGpBm8J0
         6H36pqLgYfKeTvzQP9tXy/KwxUMYb2HLIp7adTquF5wFbkDuwWJUCM57m7zwFOMiOBCp
         0CeDG87HAnjwoFajXqmTcysVLFpCOHZdUx1eElBfROBNNK1d3nKcRHeEfi+xYPr1PMUN
         rOO4scG3v6IkTy7Gtlw21CGjEWpkxXePFTq5glr7zL3iVN64aXAqe8OKEjGHHNaEqJXy
         1GNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740707070; x=1741311870;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgg6TdslREem8G9twRIimDeFP8lrtGahRwRwSo3/dXc=;
        b=cSA8mcdTXjAt4fS+IgwKw9+L/igIdK8phNRoj8svl6xcxXtmPudsE3RWyQkabmjN/j
         a7faOguxMV4aa4VMCaN1dt1Ol52Pl8LzxDHV9wTs65FoDQPHxmt7WDwd7LaHvC10jW5Q
         O6rrTOystJqt8lBBbH9Ozgj8RkbhSwfjt5copyShosSH0uCYcXKsiL6Ii4E6RF6Lehtj
         2XRH29r8ksomMnIWZHi9w8xMFqtHQh01a9Lvn+jy2gfBHxD791r1AUWKYDIqhfSy4DsW
         DEiO2Avo/W8AnHK153dg9EowdbvdkkLaKDsNb9VZmtHwNeW5xUJJwRRw5e6gwbOIfkEt
         3G4w==
X-Forwarded-Encrypted: i=1; AJvYcCWM/QcMqTiryXn15GTVNdxfakQVNWsaPxgtBbdUavaEZwDIP6Zk4VT2rwhc7XRKZ7xRpJbgg+BfnoEJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4T+utW1/3QQI0p5RKyjKLFV8SGySwNScE9mwFqSOke96SRvNt
	RoE0njtg+71Q+QVl7q7qqXa2vWPv1j29F1+mJD1bPRaeGBOq69ghcFItg5HmXQe4albDeDtZi+r
	PcagExNDt2sH9+euB8w==
X-Google-Smtp-Source: AGHT+IEKbeYwPp3VufcnDG3oxb1HHJhquHFRS3WK6izEh4VhCj6uAX2NGWoxcV/iyT0wqgmgDGn12hkLp0j/InU1
X-Received: from pjn11.prod.google.com ([2002:a17:90b:570b:b0:2f5:4762:e778])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d40e:b0:2ee:c9b6:c26a with SMTP id 98e67ed59e1d1-2febab50df6mr2614956a91.11.1740707069702;
 Thu, 27 Feb 2025 17:44:29 -0800 (PST)
Date: Fri, 28 Feb 2025 01:44:16 +0000
In-Reply-To: <20250228014416.3925664-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250228014416.3925664-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228014416.3925664-4-vannapurve@google.com>
Subject: [PATCH v7 3/3] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
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
index 6aad910d119d..a97ddc6a52c3 100644
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
2.48.1.711.g2feabab25a-goog

