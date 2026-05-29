Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD83FC5D3
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065924; cv=none; b=Xuxs8LJ4+jARjAxvUEakh0rjqcIy5tTNwOwBHTXScHAu79AJWK8Y4AR/nHj7kWJ8zu1FCJzOVMblLLRnH3w6XEPamM0wf4EaIg+31LLwMfiFeZMbsHW8hoPrP/zFZIaWe3gE0P3icI0UbXTIcy/PGL4EBfEj2CLiXiReiOvezmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065924; c=relaxed/simple;
	bh=lDwpL4pN2Hd7khkwmK25Y7B4/KyUm/MaSweyAhy8p7c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hJyq+lUYHWUnRQ702ZYFUE6vvbXwXKrjileNbOAt8xbFdYN48jI5CQEpQ0xglxhltNllYHQwqUEZXWjZ41OPiCqDJXGzZCoglyFvvEQjqNYoOu+4oUmNMtXdRDOXac8CSeqpN33Pro95AU1/bKcaEvuJ+KG84VMEgzv2cKJmVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ISZjpQS8; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ISZjpQS8"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf11699875so19126185ad.1
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065921; x=1780670721; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xo1ZeU9J2iCPf0q+fMxBulUq0vgLWRTwNewVlxT3hiI=;
        b=ISZjpQS876wbfBFo+wPDgHV5AlOnxSksCL4GmdsVfVsjek7Ex/xxii4JRVh40lawp5
         Z4/VH6qNcBXtVAvHZ+Dtlm+xMLWscTaQ1QG8YjbaFjiejb+scnIKFQfeKqZJoi5Bw3HX
         Ucr3fzHJLZJ0k+q4JNGTOOBT36654spIgvrHzY0FUdw1WY5Ufd2de5uMPI4aTMyZaPTA
         6qo1p9LWMc1h6EirHCWzwA/uINIkum1I2dae3BK8cOJbLEX5CqZdKsIYS7/irfg7OQb4
         7sa/2lxlEZZPRl8loFZEdlCaOR4VdEmDhk4pkRC0Mnlv7wMcDuo3sekZPBobglpIfek9
         Cseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065921; x=1780670721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xo1ZeU9J2iCPf0q+fMxBulUq0vgLWRTwNewVlxT3hiI=;
        b=i9tX4hmZiUqrWT96QWUKYMuyWLnqUw94Px+T8RCRZjGBC6iuEKVshyARNAsghK3aFw
         /VbPjTxUIUOVWDmuAl496hwET31Jzj/IYPFnUlzhLsnJYiNuc/2Yir10gB64Hs4Md1yJ
         0RdHcW/jxzy8GFxsM5mKo8mB/6ewSXxTU9UDtcICDaBk+ArL1/UQ6pmu6wqp9rxwIjG1
         DZw/4k+fybB5mE50Qn2oypaeAwS3h06m1K9KNNG4MEpk9OPAdAF04IO+8H2oq1d4n2TF
         f6qaS9m45Zs6xFgXb4Y1PT9wU1/o8IgaTEPYpJ3fs9yW3nteqKBMRFbR8ddDFej9uHKn
         WETw==
X-Forwarded-Encrypted: i=1; AFNElJ+2m9sghs+Sr3/Wx1niqzD8/5PcZixBd6q1qHyUCv/5F0PoKx/OxRjIzjmZwSHc4WFzuJSEfq7AX5SD@lists.linux.dev
X-Gm-Message-State: AOJu0YxTi0vGXRcrLpSM13AvD4UCdlvQoblgpOwPPEJIVKG/SpkKgx8P
	19rCwrzLt22irws/HBC96zLDezlNTmdrJ55+dghIsZtrJHi3rebsjmqruWgkaamkHY7nIrfsli5
	fUHE2dw==
X-Received: from plblc15.prod.google.com ([2002:a17:902:fa8f:b0:2bf:238f:8196])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2448:b0:2b2:4fc1:f653
 with SMTP id d9443c01a7336-2bf20d4466cmr29629345ad.3.1780065920784; Fri, 29
 May 2026 07:45:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:11 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-25-seanjc@google.com>
Subject: [PATCH v4 24/47] clocksource: hyper-v: Don't save/restore TSC offset
 when using HV sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Now that Hyper-V overrides the sched_clock save/restore hooks if and only
sched_clock itself is set to the Hyper-V reference counter, drop the
invocation of the "old" save/restore callbacks.  When the registration of
the PV sched_clock was done separately from overriding the save/restore
hooks, it was possible for Hyper-V to clobber the TSC save/restore
callbacks without actually switching to the Hyper-V refcounter.

Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
revert to using TSC for sched_clock, and so there is no need to invoke the
TSC save/restore hooks (and if there was, it belongs in common PV code).

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 69c1c7264e5d..ac1d9f9c381c 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -527,9 +527,6 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 #include <asm/timer.h>
 
 static u64 hv_ref_counter_at_suspend;
-static void (*old_save_sched_clock_state)(void);
-static void (*old_restore_sched_clock_state)(void);
-
 /*
  * Hyper-V clock counter resets during hibernation. Save and restore clock
  * offset during suspend/resume, while also considering the time passed
@@ -539,8 +536,6 @@ static void (*old_restore_sched_clock_state)(void);
  */
 static void hv_save_sched_clock_state(void)
 {
-	old_save_sched_clock_state();
-
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
@@ -553,8 +548,6 @@ static void hv_restore_sched_clock_state(void)
 	 *                - reference counter (time) now.
 	 */
 	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
-
-	old_restore_sched_clock_state();
 }
 
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
@@ -562,10 +555,7 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	/* We're on x86/x64 *and* using PV ops */
 	paravirt_set_sched_clock(sched_clock);
 
-	old_save_sched_clock_state = x86_platform.save_sched_clock_state;
 	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-
-	old_restore_sched_clock_state = x86_platform.restore_sched_clock_state;
 	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
-- 
2.54.0.823.g6e5bcc1fc9-goog

