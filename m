Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D94A4338
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059419; cv=none; b=eVjNvcnF4PhmU8qChNeEl+wrTBAxqS2cSf2ZS93WdnODoA0WEzzEd16NDE1c43JJ/oKy4R/lF7sfGrvdOa9eh3Xog3wRfzz5XI5ZWiIunrkeB1palnqDs2XJI51ysr9r+GxRSMR6UjAaZI6hVF/zmcmouhzP+5g+0Q7HoJV/oz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059419; c=relaxed/simple;
	bh=9DAIjDH1F2HoJUEVpdMLcADO0LnHG+NJf0QuZz8Bg8c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E/UIVLopI5TgAtIr1FOzw5KLHGudWNtBJxXhDlC+4c5h7S5gajZORce7mw2X86NEBL5mDoo38cJ9hTCApnEDnoDraWbUfvyfXI7e1Vyp5h5OSSXXVNKlqI5A3mJomk8v4Jk4XO7pN7riguDHiTF40TBO3OyAQhJ8uNUgh4hQ3t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=la9EfK38; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="la9EfK38"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cd01a14e81so38142395ad.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059417; x=1786664217; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGO2RWCI+1OC1QgQlwRZRpcTYMYFszJFieAT3RQjORg=;
        b=la9EfK38qbkqM8DK4EmjaJnLcmcTYmlOSzR0idi0M/eAwQoHYT2Wdjn62RU1F1odmm
         TLHah7jFcmOtTxzJH0GK7huTe2UegDVJLu06CDMVNEC7TsJxA354zJT3dcWahg48Hk5y
         LMP8N92ikbkgwC7t33WxTnN3l+pzchiEmzuBtf8DLsLtv7V4USD3kZjwOYkTQ0mfsb6d
         YJSnW5Njmk/3yeaLJ5q8uiyR87uB6uqEBDWIiHe9OhqHo6vCp704IusfUsKhODlVdvFE
         hs9p1ulcvCIfCifmyHjIk025IKkikj45gHmVlTYuy0UQpPKGIn0nJM2Xod8Tu+TJJKst
         DBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059417; x=1786664217;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGO2RWCI+1OC1QgQlwRZRpcTYMYFszJFieAT3RQjORg=;
        b=A3hp/xWkeF7QopCDZ6AAsP5FpEYP0435nm3yVohblUhpDT7ghpMnKahj0ZaxRIy8jP
         f/F9ghfJcggIP9Y/VzInvcp4LIk6TcBFSylaKwuav+/Ym9MuAaf+dc8L9k+zQ1BDtNMu
         g7ivmXX6cqfZmChvG7wlDjno9wV74jjWzu2ZedKTFjy+AKuLElNKyJu/t0dc4C2t/21S
         Cp2JlTGeecQRRVgGbER58XsfIH8W8N2sArWXWGPDcP/4TVqTOK/IOX2sZFvOFnR5uS/x
         O8/TMCV/BgRt33AyneDKUHYdXlD1sDYYjoG+ZgJnEgFEv6Q7aTyFrIRG+h5mTXpd8pw6
         CxuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1956+Og5u8l/LNMK8bQcMHV4wQW70F1o9eYNHZwuyx9/gieIyJLz7p0oZoeMMHeW9Pg97JB2jNIij@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr7iq9gAGZK6RfWA1KQU4AEAbx6bAgWQ67NQMB75Y84pk5AIZZ
	rNFIOnOfaroPXLQ6EtHFd6YV8rzfWXRoshfLUCE6VAkKRcOiBwxbGV4tI4WiFXVuFqZ4DIqKSyW
	HvN7EWg==
X-Received: from pgmj25.prod.google.com ([2002:a63:5959:0:b0:c9e:364c:61a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329c:b0:3c3:8315:80b7
 with SMTP id adf61e73a8af0-3cb85e9757amr21773483637.9.1786059416350; Thu, 06
 Aug 2026 16:36:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:43 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-27-seanjc@google.com>
Subject: [PATCH v6 26/51] clocksource: hyper-v: Drop wrappers to sched_clock
 save/restore helpers
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

Now that all of the Hyper-V reference counter sched_clock code is located
in a single file, drop the superfluous wrappers for the save/restore flows.

No functional change intended.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 34 +++++-------------------------
 include/clocksource/hyperv_timer.h |  2 --
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 4293173c3a27..daa8cbfe61ee 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -488,17 +488,6 @@ static void resume_hv_clock_tsc(struct clocksource *arg)
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
@@ -565,12 +554,14 @@ static void (*old_restore_sched_clock_state)(void);
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
@@ -578,23 +569,8 @@ static void restore_hv_clock_tsc_state(void)
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
2.55.0.679.g6767b8d81c-goog

