Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3122347BD4
	for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969191; cv=none; b=SrC/bN8Odi7K07v3TRE8UHMfNj42bP33fSgAcCVN9KyCEga/NzI6Fnt1ODRW/4k0a+j+9N9/OlN3TzJ0CPW9a45qk2e8CAWcomHVMbhF2FbvU+oV+SsCJCla1g0ho5kvWbzTnP+5FOvSYSx9tyKX3ael8ARSmVdYo9TUJG4LGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969191; c=relaxed/simple;
	bh=3wjLaIqPwLhtaQu3sd4+Wy6uET4Lt+dOtxB/f9/oZG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ep8pCl5+Ylih6KdK3K9tXQYqr4XQejB90gRwu11MkIrLbQDnfWRjrDa1bYSFJzU56Oj8KzNNypE1nz2eXv2HZM/n2dnUI7yCezU2/gA0XSiAfTEPZxPgrG0qVBpjPFhnC+E/WO7EBL02MIiMwpVBmcU605tV8Wd1IIyNBe0uv+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2XgmGe1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2XgmGe1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso2499597a91.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 09:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762969189; x=1763573989; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B2W7BhYEA5i1i5woy4wPEVZBPGLjZrrhpv/7K43a+Bc=;
        b=P2XgmGe1YiTzJkbFSfNkHpZBrESAcQUcKo+pFSNofamsGP+3FIGKz4eAA40XHw3iAg
         FVZ1sIO7jijcVlfjmkyGPRi77q5XIvzhTpuN/eL8kmdNHkcsrQnD5l+IBWmh+W9PQh6I
         67PmT94c2VjEXjBb0DFWGSCw3zJ4RuTDwV/FJGYMKExFzNNoCG4WYDmeGlYd5z9DWFiw
         NsUv22Ypb/fASeCvJ6RMudQexl1c8VZObGY/k9YYcp2gUXd+ZisXnTC7UQOhhd6ZgJbZ
         SbDrSVs9EcoCwKC5vad0nIouTNaTk4KUzOGfur8Y5XdGRt+FiHERsnFwReiwHPZgQdNP
         LEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762969189; x=1763573989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2W7BhYEA5i1i5woy4wPEVZBPGLjZrrhpv/7K43a+Bc=;
        b=Alq+NTAfAi01ob9eTdTGi1PHf6F8/7RfM97EuLbSvpFZRF0BDAUI5fNWlsRwypgO4r
         +AjetsImHKqmrL3xwJg0KXF5s/xYEJ93/6UldrvFxYNkYD1sM3ZYjENh1RD6CIib2Unn
         tPMrrAeRu2U/HB6KY6eUmjte/5Qkno3iCbDX1QL8OSfWWQPANUiMjDyZuhNCsc0HcS2y
         1fSODt1lBr7pdt0FaOcKwQ6oHk4PDIA5RCFOBfh734ent+BM227Ql+uS/FuES/Ww9pb7
         s+iYdXCjjTW9M0S8KJrEBunYCBp+w+lrRSP/d5bPIaFBzmYc43LIBRCkdiHeOaKhUGy7
         nXBA==
X-Forwarded-Encrypted: i=1; AJvYcCX88BqeAiy349GjJpHXvxW/N/caxeGe1bywRh8Eu6GCo8EIY3IRd3Q07yLPB/ubR/WAdU1Yow1xoOQq@lists.linux.dev
X-Gm-Message-State: AOJu0YwDxLwlDUgBdJfUdoxP1d2EfJoqkRLp9fNrVCfYRy8GCc1Gumq4
	rkthBXxtAdekw8t6GmDJRc5X3cO0oH0RM+NML/L6v7+xoH1xLVEZRJHWvL397UNFoB7FUL3pl2M
	gcw6YdA==
X-Google-Smtp-Source: AGHT+IGQoB1Kabu3uhkCb7ua9Zbxd1SwMYzdy0+WZvzbXxJsOOkw0xVig1+MnTLbGmRa1/KiP7NDHIAhv+E=
X-Received: from plbks6.prod.google.com ([2002:a17:903:846:b0:27d:1f18:78ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2c9:b0:297:e66a:2065
 with SMTP id d9443c01a7336-2984ee00891mr56835055ad.56.1762969188545; Wed, 12
 Nov 2025 09:39:48 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 12 Nov 2025 09:39:41 -0800
In-Reply-To: <20251112173944.1380633-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112173944.1380633-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112173944.1380633-2-seanjc@google.com>
Subject: [PATCH 1/4] x86/bugs: Drop unnecessary export of "x86_spec_ctrl_base"
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-sgx@vger.kernel.org, linux-coco@lists.linux.dev, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Don't export x86_spec_ctrl_base as it's used only in bugs.c and process.c,
neither of which can be built into a module.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/bugs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index d7fa03bf51b4..57c1d0ed36a5 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -102,7 +102,6 @@ static void __init vmscape_apply_mitigation(void);
 
 /* The base value of the SPEC_CTRL MSR without task-specific bits set */
 u64 x86_spec_ctrl_base;
-EXPORT_SYMBOL_GPL(x86_spec_ctrl_base);
 
 /* The current value of the SPEC_CTRL MSR with task-specific bits set */
 DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
-- 
2.51.2.1041.gc1ab5b90ca-goog

