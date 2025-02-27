Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BA22F386
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622793; cv=none; b=qQZpPLX1ZgNw/LP0TZXQqcDwrzFjt9e222Ysbmk95Fi7QxaYbob5nfUvl4kZX44+AJq0hyAv7i+rBBmDsJkPN5H+gn7HGydUvy57pVQjO7cl8/MUMIntzw0aXDML4n2b3GH9SSDDCpQwVT8aHQ3CVP0uPo+QVR/EvGmeBe5cT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622793; c=relaxed/simple;
	bh=Bgq2jKvITCPJGjInNMTg9hShy45LprwLheePx172YI0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LRc0oBx8Bd929JcK7Xza3tprBdThDGh1+Z3QCdL23dW0HtL8gdz9cw2KOduRMwtv1nEbX7BYD6Ab+YywqWRZxO9y0WOVG2F6emxuh8+Q0Il6O14ObgOW/TLi2e5rXff63TcWPuxbfu8d1fXEUwf0A2T3tXhFJ/9/wq3f+hTeqdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4LLsVqxS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4LLsVqxS"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fe8de1297eso1024100a91.0
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622792; x=1741227592; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w772IaQ5YRbZvSP+H3ufucBFIq7F/07nn6vrGLJgcY8=;
        b=4LLsVqxSWlrIkLzWMGhlfeDAe4UStpaYuF5P3APaGTGA5ksynWG1Yk3CECQ7fpwuN1
         YYwXHbyus+6ggORcmOofebsvZGWFRSDO05V9MUg7lbdQOEiI8HFCo4+4RUjCO4exNeAB
         MEwDQztuRYOpLEXcaTiOQgyISnn1z3bo5zMxnb3h1/V3oBxsI3WIg+gf+ysy0QR1qUxa
         45bk6bttwfTP32yNpDsjEkzn5yba0bEvbGdEsTS52NwGGD0UOcG49qmfyiZANZLWAxwx
         2jmvY+zpwwWcY8E1YxiKhJl0itmda34LQiZNrmzGRntYORe7Y25uzpEwcSd5TiAHm45h
         /pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622792; x=1741227592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w772IaQ5YRbZvSP+H3ufucBFIq7F/07nn6vrGLJgcY8=;
        b=pyYFXUgGzOOaRJCQ1SKoTLKvCdDnIr/+hata4lwkcvyaCXtQrrxSGyDFfZPtcZSG8p
         +lZlD+3GW/ym+9cpAnUbVoOE/mZtpWkN/TsfDoEJrFgCXw0/VAVIaRY0Mw+TvwIAfbN/
         XOtGFhDinyIMw28Gcc4VzgBnQ9lI4oNld1JvS0Pe6nLOTGfxrSJFLEXeE8pBmiV2ewXt
         VPdZeUtV/AmWhMc3rPLhT49FQ8iYmhA58XWfzwdqFM649UewW5jhCFzcngOGe6gZSVP1
         aoQ4yZdphqVq8b9aGIQqwioaFtRlCipgNlQZ2AsJ5eU93fUv6x4tY2PQK6VkutL7z8+I
         Ci5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhFb0GJsvihvq12KoEssNFOPyf5ZZIm4i7pE1DSefon2diF2zC3kG45PhSUCPQnXeSfYwu9P0kxglv@lists.linux.dev
X-Gm-Message-State: AOJu0YyRfdpX0t4Z3XHpbMTttAEP+orowwLm5TsplpjkWPk3ufQp4Go+
	fHqWIqebRi3+w1QxuVzDK24bpIdobAriFTH+nj4aqU1fxz43/dibW8OQz8uRwsaJIw6+VUpDkYh
	QDw==
X-Google-Smtp-Source: AGHT+IFwaP3Gmshvc7uvq62wN2IryjydNwW4vN0WeuDaKx0968TrkTSYTEdNA9orJIr9gY0PmdxDWYBBhxM=
X-Received: from pjbsm1.prod.google.com ([2002:a17:90b:2e41:b0:2f8:4024:b59a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2688:b0:2f9:d0cd:3403
 with SMTP id 98e67ed59e1d1-2fea12fcb22mr2427211a91.16.1740622791492; Wed, 26
 Feb 2025 18:19:51 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:44 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-29-seanjc@google.com>
Subject: [PATCH v2 28/38] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Annotate __paravirt_set_sched_clock() as __init, and make its wrapper
__always_inline to ensure sanitizers don't result in a non-inline version
hanging around.  All callers run during __init, and changing sched_clock
after boot would be all kinds of crazy.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h | 9 +++++----
 arch/x86/kernel/paravirt.c      | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dc26a3c26527..e6d5e77753c4 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,11 +28,12 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void));
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void),
-					    void (*save)(void), void (*restore)(void))
+static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
+						     void (*save)(void),
+						     void (*restore)(void))
 {
 	__paravirt_set_sched_clock(func, true, save, restore);
 }
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 9673cd3a3f0a..92bf831a63b1 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,8 +86,8 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void))
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
-- 
2.48.1.711.g2feabab25a-goog

