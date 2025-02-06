Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9636236A8B
	for <linux-coco@lists.linux.dev>; Thu,  6 Feb 2025 22:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738880892; cv=none; b=k/ncU3rPFFRhbmFJdUbwGMWohgK14tTRRPAIk5sXxVeAaDA/iHi9iWQDwm48Z+TH40Win+9Qvvho9D4FsUUrsIt0w8+oDhVJQ1EjKWWY1U6AamWfm1QdrcHllgRbMY5Zk/+705SsTOCu7knWSRik1vFi3uhZxPkLnpePMSB3A6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738880892; c=relaxed/simple;
	bh=mFDuaPuJLce7bYnIwmrQvKwK++9BA+sKR/Udf9Ak1nQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ULlatDM1cat1zhgM2m0DDnNF+VOSreYgKJD4CDWml/aFqlFCkr/U2YjvVE3fVR7U7jtghPvE9tixNP833F6uOmlBYmWnyqm7NXfZrPWOShnizd3Vm0TaZsJIiU9VMhZpDFdrSY/PukxsUACe8HOyNPiKREBDdreIqAmbxguEmGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CMiLsALR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CMiLsALR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa157b0fc7so1723684a91.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Feb 2025 14:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738880890; x=1739485690; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrC/Lile8Fxa+G6CWF6jG45AjIfizxhf/A144AZzUwg=;
        b=CMiLsALRI6F/22VQElPFYi2bBEorxr1LplE1Y+pFMF0ZqflHt3PppKLbGd3jOX4pPW
         86lc5x5t6eKCbSG+Q/KRXPQWmvNPZ6PUSXVr3SG83r7xdTa7syxa+EexQSlIWP8wT4tt
         IrT8z6+6Q7JIAY2fo4Qj5nKlC5UgeM+JSf5WpXQ9LtTyTco2op9iwAOy1la+ZNWb+Lsu
         Q/mBQDSolmbW2IenVwthh0n8sEQ3lyKHCqh7cjtrwcEwb26zWJK4X76NLWOGTQi/p9dH
         wCHhY6j6PGzc4utNHpBPjnPcDkRkeDfs09QGsY+pdnz/wE6aLXKFGd0XeLuTdHfxXtMc
         gPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738880890; x=1739485690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrC/Lile8Fxa+G6CWF6jG45AjIfizxhf/A144AZzUwg=;
        b=Af4Xs47f3yw/6lGb1yEnaZXCSwScPAaET6NurfjNtg4cQhjtvptF4GecXEnoVb2f5r
         RqAwC04rl2kGKwZRG4paMmoD3LRCu6Va47N2jIC5rnbC2zexRrcr9hZvX3T0ZlnMsVaP
         QWMnVjS4AWaYvYIn67J1q/Nly5l7TP/K2UJRASX23PrnwdY6hINSLWwVsCMLfRemXTrR
         qLAZtE3ZsUPmz+cPGjjfKknac++EgkSQOnKg5uLpE2T6I9pEq8wAYuG0TLmynwL/sQ2t
         1XlcYTqoc7uzoD7jtvZfpbTbuG9KEqAMuHjCs+jWd6EOP9knlgtbvqgqKm2ApsjDszxm
         yZ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVJTusuVFd3eiRgvMX5lSuAnnw2t+Trqo3qhr/L6aVm0NrUReKQVvZmi7xU5axNnXQnoEujly0P72+3@lists.linux.dev
X-Gm-Message-State: AOJu0YxHLRbiPfkpEVEXcXi0hTEKPxNlUzwyw4pRH91h2mq0g3NzuCKb
	5CS6+432ZRKBLQ3KeAlOQHrDB7/ng1zGy7wK1sOGllx2XtUoYbefCGBDF9FKoQR4OC54P9eVz4+
	3Ml8o8EHc5mVKZorN2g==
X-Google-Smtp-Source: AGHT+IGAKNeXYzNmdddEMKmVQ4M1M7lWBtl1f6JoubL4oW+KUHWBxuB9fL1WH1YtGVToXf3HdRqlM7RhyFIZJc8q
X-Received: from pjtd13.prod.google.com ([2002:a17:90b:4d:b0:2fa:26f0:c21b])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2e47:b0:2fa:20f4:d277 with SMTP id 98e67ed59e1d1-2fa243e39dbmr1215046a91.24.1738880890297;
 Thu, 06 Feb 2025 14:28:10 -0800 (PST)
Date: Thu,  6 Feb 2025 22:27:13 +0000
In-Reply-To: <20250206222714.1079059-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206222714.1079059-2-vannapurve@google.com>
Subject: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during HLT
 #VE handling
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	linux-coco@lists.linux.dev, chao.p.peng@linux.intel.com, 
	isaku.yamahata@gmail.com, Vishal Annapurve <vannapurve@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Direct HLT instruction execution causes #VEs for TDX VMs which is routed
to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
so IRQs need to remain disabled until the TDCALL to ensure that pending
IRQs are correctly treated as wake events.

Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
to avoid running into scenarios where IRQ wake events are lost resulting in
indefinite HLT execution times.

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.intel.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 5e68758666a4..ed6738ea225c 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
 {
 	const bool irq_disabled = irqs_disabled();
 
+	if (!irq_disabled) {
+		WARN_ONCE(1, "HLT instruction emulation unsafe with irqs enabled\n");
+		return -EIO;
+	}
+
 	if (__halt(irq_disabled))
 		return -EIO;
 
-- 
2.48.1.502.g6dc24dfdaf-goog

