Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5CF4A6FE9
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059425; cv=none; b=K4uknXqoinPfBLRJkmpNfbWyGaPQsH/i5K94efYpqt6obO7xQTBs/3fSwyboXs6VxMXt24g54iOYaZrb0+gwIIz6Rtb97gE1L1AT0BMwFFq/mu4o7M+5IJDo5qwbuUg4GTM3f6qbl8EryCERAZnVwTNtUaFbtZXE2DQ+gPgIS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059425; c=relaxed/simple;
	bh=s2/ZfVS2+K2HvwEjsbelciYdB6FNpWUiBJfvQma4wVg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nzNerjfEHQjAM0K4s4dFEGeU27jF+RO9KSfKre3T+yXPj2Gd8xlnv6Z6hHAwdfqpB/5bxjaAFEVOqAgqdlzVfBbPjvTecUbGQnWs6+WOq8XVsRuY3xKviwO79C2m6b8OW882cjdXY6d0d5Kny5Xp2HeRZNOmqZbxe94jCp7J7vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lekuZ35w; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lekuZ35w"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486ffba174so6232610b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059422; x=1786664222; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3J0zUIaWZrZleLZttsrL9ykC8Y4xnIiv8MkXpJdWFpw=;
        b=lekuZ35w9XuH76K6h59TOzyZZk37gjvvR3J859kvf0fszX9TdG+AX+nX2eS9T+lMHY
         kUmEfTuWSLtu4XnrmHSg+/SoK/mvfFRnncG/mTVLw2L0EV2q4SNNDREvJP8xPHD8qryu
         dm45oIVx+Y4kTQXtL+h8qtcmUnPVReJYPoHmeMDfAGfNL9ir/ia9OtfmgReQ0mm6THKs
         kDoYCUAmy29YLFm+A829Um5GQf961TrGkU3Vz4DSnemccA+2xvZaF4iSMGRBRYCYXVQ9
         2g/Cv7H55mcGUkVKG4HR/sm1c3KQQvB3nfa6ir0PqpF/X5RlpZ8RzWwaDkipZ3h9IBJv
         Mv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059422; x=1786664222;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3J0zUIaWZrZleLZttsrL9ykC8Y4xnIiv8MkXpJdWFpw=;
        b=Yx9fcBopX+4GtPdpVbH9GsoS67h1DeIcskrDYeC9ldubxqvtWS+tQs+MgmQbPOkLf1
         RoR7T0FvUYuJvYMtxUJwjpUH0G92rMSN3+nRH35BnF50JON1G8Af6J3HZmLTJIxLtg5d
         Ot3Q4qNWCbSsUCdeFw+ojDwXMddDiEBQqR/ItaEXfuDWBu5OClghmL7CTg+cAWDrb4Gw
         39znEdZBiQ32ES9rNPd+NoP75IhmvQ9QUMp0kbhpcLWMPeEG54pYahT7Jh8GcAmOoK1b
         ts1dB3kYBk4pEErYRoc+v3G+HC7qnwNBvzBQeVSRq2xGpcDpRoeE5Ur1wgsZAhM2lMOa
         7+ng==
X-Forwarded-Encrypted: i=1; AHgh+RqxT2kNxxi6iANYhlapt6+ku+zxcmYw97PkpN2/yfEcvU1IueL83jIBOfLEM75TQbZ3UeYSX43/rQkg@lists.linux.dev
X-Gm-Message-State: AOJu0YwSPINqZGh+rGTQWbnqTOJO47ehxdy2etjuKh/KWesJMd3t+ChR
	jBv6nmKDElbIemnTgKHlVCc9H+sgHYmh6qwd/4Wbr/e7s2+MQR8SokofrCsxTRXM1WqAjqQ18Hz
	xyoJn5Q==
X-Received: from pfbcz13.prod.google.com ([2002:aa7:930d:0:b0:848:2e05:6161])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a58f:b0:848:3fe2:c88b
 with SMTP id d2e1a72fcca58-84f2dfc8fa4mr23126519b3a.6.1786059421552; Thu, 06
 Aug 2026 16:37:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:47 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-31-seanjc@google.com>
Subject: [PATCH v6 30/51] x86/paravirt: Remove unnecessary PARAVIRT=n stub for paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Remove the unnecessary paravirt_set_sched_clock() stub for PARAVIRT=n, as
all callers are gated by PARAVIRT=y.  Eliminating the stub will avoid a
pile of pointless churn as the "real" implementation evolves.

No functional change intended.

Fixes: 39965afb1151 ("x86/paravirt: Move paravirt_sched_clock() related code into tsc.c")
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 3 +++
 arch/x86/kernel/tsc.c        | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fda18bcb19b4..c71b466d6ace 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,7 +12,10 @@ extern void recalibrate_cpu_khz(void);
 extern int no_timer_check;
 
 extern bool using_native_sched_clock(void);
+
+#ifdef CONFIG_PARAVIRT
 void paravirt_set_sched_clock(u64 (*func)(void));
+#endif
 
 /*
  * We use the full linear equation: f(x) = a + b*x, in order to allow
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 4c5328d19ebe..e0bea58b6658 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -288,7 +288,6 @@ void paravirt_set_sched_clock(u64 (*func)(void))
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
 
 bool using_native_sched_clock(void) { return true; }
-void paravirt_set_sched_clock(u64 (*func)(void)) { }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.55.0.679.g6767b8d81c-goog

