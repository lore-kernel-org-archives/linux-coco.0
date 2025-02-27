Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF41D9595
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622762; cv=none; b=NUozlMWuur1Q4Yop2ZL8fl+HcP7PAkkfLGtT3bBZFxlcDQSMm+jMGgHgtZFv0zMd6j8jLThv2fHqbXT2WVh20vNnvWxxQGXCnIWBumMBkYYRDBJCQ+M+GdZI61Uy58Fr0GNke8qL8mMEIMYO+Czrlcc3rnJIHw8vuEf8iorGJ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622762; c=relaxed/simple;
	bh=M+VN5C0boRzeU19KeJ4QoMy1PkpWXwTcpvT2+bfg0Lk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kD8K5lOEtpMLzwaB59u6czaMi/Jrp+HfiPwyH4qOahU26zNpB8qneEtFFfGmNri5CBUfaeoHZMejgFVe+WvRQ4At4ubjsmh+zDH4pmDCTee3LfCXEgtqJ07tMJ529eFRDtNqltKpBVNYttohTRy9DKFbPTg8kbJyRDRjzx1iTsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=slo2ujat; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="slo2ujat"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc43be27f8so1570532a91.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622759; x=1741227559; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M9J4vMOsFh+KFESDavQmkJXQ4sHD+OspEOtA7Gz9lOo=;
        b=slo2ujatpCEtIYcuFpe0wpVJBnUgOAjpsLn/ngptNoeQilWkHOggtyhc/9OY1DY5Ph
         NiNBVzTz4gu83DI9WPLenb/3iMAlrOUjYSZTM+M/stnLDnpBrSmbHOLjyzbIRcr3f9+N
         7uQ7M8POGe0XOazvq7LTze8gpqVm5DNw874CxDILcL7fnd5+EA4+oA64wyT4AJU7GQsc
         K7RKYbZEHkTg4QJvXJpSEYMJVxjFcNhyZBdQFT2GHU9KFGFUixdEiqZNCBocBpUctsGb
         Yg+eKgFXPcQzADFrGIFy3oV2WTi95TzdKXXNc0gzBPATXHWQaxpMUBEdess7ymbKQqDT
         C+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622759; x=1741227559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9J4vMOsFh+KFESDavQmkJXQ4sHD+OspEOtA7Gz9lOo=;
        b=CaBOl3Xm6bBmKpuifofW+ANBvB6gOe9BBj74ieiBgSHBFpKExvpk6ljiWyspnn6JgA
         QhSURL2vnFezwYGcXC/4RJRx5jEAmZyG5D0m7L+yWXum/vp1opZLA8pq2UlFLpW1VF1m
         NncdXdFrcfFd72CHJz74uDz+b4SnouJUvmFketPwsvMVE/PeiH08SfFNayszQqS/ugOs
         XMl0IIvsVgLqnNadoqSSDSpcJc3OmIBBgFmv1XzReR4xqNm+rxsVthp4fl+2ay/goeO9
         51/+x2zUvKirE9Fg1MMU5WSvygRoj7DodIS5yUqYfAj7RDpsbh0lKUfu1cY3mY5Gx7wd
         IGJg==
X-Forwarded-Encrypted: i=1; AJvYcCUp26Zf34cvY9rsSs4i1D6aGfZBoXpG67MPG1fpCZClDNOStOYTzUyZY25lyFW+NB2b2qB7g5Ht099q@lists.linux.dev
X-Gm-Message-State: AOJu0YxOXOqpyZ3KTrqd1x5veXVR/0Pz/9S1ihwZp9o6HZjGfRkv5UwX
	pOoYtqAKt/C7aStjFTGOYLAgaKiXkKb+7vbRDelK1AA7M5Mh6Js5Dy69nUykoXOii/JapzrWUA4
	1pQ==
X-Google-Smtp-Source: AGHT+IHGg2YNnpdN9W11waKGKjVdoMsbSztU341tlOE27g2wibRX2aXDt93sxEvHQRpF0p5gOf3qjCfl60c=
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:2fc:15bf:92f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc5:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-2fe7e32b7c8mr10195616a91.17.1740622758747; Wed, 26
 Feb 2025 18:19:18 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:25 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-10-seanjc@google.com>
Subject: [PATCH v2 09/38] clocksource: hyper-v: Drop wrappers to sched_clock
 save/restore helpers
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

Now that all of the Hyper-V timer sched_clock code is located in a single
file, drop the superfluous wrappers for the save/restore flows.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 34 +++++-------------------------
 include/clocksource/hyperv_timer.h |  2 --
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 86a55167bf5d..5a52d0acf31f 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -471,17 +471,6 @@ static void resume_hv_clock_tsc(struct clocksource *arg)
 	hv_set_msr(HV_MSR_REFERENCE_TSC, tsc_msr.as_uint64);
 }
 
-/*
- * Called during resume from hibernation, from overridden
- * x86_platform.restore_sched_clock_state routine. This is to adjust offsets
- * used to calculate time for hv tsc page based sched_clock, to account for
- * time spent before hibernation.
- */
-void hv_adj_sched_clock_offset(u64 offset)
-{
-	hv_sched_clock_offset -= offset;
-}
-
 #ifdef HAVE_VDSO_CLOCKMODE_HVCLOCK
 static int hv_cs_enable(struct clocksource *cs)
 {
@@ -545,12 +534,14 @@ static void (*old_restore_sched_clock_state)(void);
  * based clocksource, proceeds from where it left off during suspend and
  * it shows correct time for the timestamps of kernel messages after resume.
  */
-static void save_hv_clock_tsc_state(void)
+static void hv_save_sched_clock_state(void)
 {
+	old_save_sched_clock_state();
+
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
-static void restore_hv_clock_tsc_state(void)
+static void hv_restore_sched_clock_state(void)
 {
 	/*
 	 * Adjust the offsets used by hv tsc clocksource to
@@ -558,23 +549,8 @@ static void restore_hv_clock_tsc_state(void)
 	 * adjusted value = reference counter (time) at suspend
 	 *                - reference counter (time) now.
 	 */
-	hv_adj_sched_clock_offset(hv_ref_counter_at_suspend - hv_read_reference_counter());
-}
-/*
- * Functions to override save_sched_clock_state and restore_sched_clock_state
- * functions of x86_platform. The Hyper-V clock counter is reset during
- * suspend-resume and the offset used to measure time needs to be
- * corrected, post resume.
- */
-static void hv_save_sched_clock_state(void)
-{
-	old_save_sched_clock_state();
-	save_hv_clock_tsc_state();
-}
+	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
 
-static void hv_restore_sched_clock_state(void)
-{
-	restore_hv_clock_tsc_state();
 	old_restore_sched_clock_state();
 }
 
diff --git a/include/clocksource/hyperv_timer.h b/include/clocksource/hyperv_timer.h
index d48dd4176fd3..a4c81a60f53d 100644
--- a/include/clocksource/hyperv_timer.h
+++ b/include/clocksource/hyperv_timer.h
@@ -38,8 +38,6 @@ extern void hv_remap_tsc_clocksource(void);
 extern unsigned long hv_get_tsc_pfn(void);
 extern struct ms_hyperv_tsc_page *hv_get_tsc_page(void);
 
-extern void hv_adj_sched_clock_offset(u64 offset);
-
 static __always_inline bool
 hv_read_tsc_page_tsc(const struct ms_hyperv_tsc_page *tsc_pg,
 		     u64 *cur_tsc, u64 *time)
-- 
2.48.1.711.g2feabab25a-goog

