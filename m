Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49C3F787B
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065909; cv=none; b=bmUKHyCg+HjyxLco6J43VUrAnGNuOOaO/dU7BJ7/+4Kg0HLYY751k/mKoZaTjEcv5G+v1/82Ow2X1+6cMmt9kVMPvcuOL2w+Eb6esjWR0JvR3xEAdearzsfpGKvVLKu0yHLjqkHBqb3VpxGuIvBYqeU8UHpWwiIk6kvDL9qMUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065909; c=relaxed/simple;
	bh=QsGKR47k87jDmABsbb6wIJ/Oo6leqTzO1mrFX7LbN8Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E4lKtzrYvhLbX5eWh86dQg4Hl+CTOZTlQN2X5wZNGVWXfNk2TZ0KR8j42nmA5jcEZ6MFPvyvGlM/Z9A0MBj0riDhhwEo6cOP/2Vlzo31q46HTI4YGxNGAJNCQs/ub3+d3ZmCjs48nR1YXGyr7NTWjRUSiEtVaADbRYk5ni+z4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OlXyYObD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OlXyYObD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2babbeff9e4so156457555ad.0
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065906; x=1780670706; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ep5voyn6wy8bCsLD4fpqMEGPbCHcjvgsIyxbB5uxkeU=;
        b=OlXyYObDaTEZPchXlXP+suuZpqwMIPM/aswfXxsfa62Qmg4/Gmsp8X6cvnBC//4y3F
         eAaUipbJi49rWqHajKFESEoXHqfNrV+WscSTJj1wmopH0XKd/plyzu86a0V8jAlMC+R1
         UC3YIl6R6/CMpk94pFrn6ZlZiHR3DPl2/djc6M8lR6+LlQvhzHA0gGT0Vknc12GjUD8y
         s+hZ/ehfusnDuksK0vXTrX457Nj7sZEhOGLgKOkrBq6+8/mp00D/neymwhRmMX8jh5pB
         FRn/c0PkPbCTp79E5f6zDTzmnNvJcrdj1Z5D/ooGM++L114mUZ958sKK1XUebar7bYKY
         9vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065906; x=1780670706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ep5voyn6wy8bCsLD4fpqMEGPbCHcjvgsIyxbB5uxkeU=;
        b=Ek8XhZN2tw7o2K9008OJ8bEOs5Lb0HxZDlEWmtxLQo7GTbUh06D4jjma3k+y9AKkEs
         lHBPqpz7RGsoSq6Arfj6bEYtxg7tKrSYmodgSoMARp+TRiGsXVOdsefP1sgDP9veFidc
         1xRuo4ZudRTAu6YdZn19vsm8r+CUvZOaI+yR2DaM5VSdqDZ6p6b4XZVkzTI96r4W+nb1
         PaYJ4Bba312LIs1c+eSof9lFIKeSEKVngp7/dDbi+JWhcEzSwhdkOUweImHOs2zT6K5A
         Anqu8i6RvrzYZF57wdUwRVk65IzyVmkTFZOklXvFpj5QJ83WZRzlDUeNGsdjpoUPc4kt
         hTRg==
X-Forwarded-Encrypted: i=1; AFNElJ/v8tP7BFAJa9X1sa7+tFR8h3c7LSFFbcTf/HrC+vWee3iSClIHNA6Yj8DRQGLWYqcDN5WiPOXqwxeD@lists.linux.dev
X-Gm-Message-State: AOJu0YzRWBbgC9kDFhE54AV9jsue0uAMFCWzjktKeto7HWhNMtW0pwZ8
	x5R8Nx3QVgjCLfhM8PD1FLEyiH9spwuj+rjUvyrze7U9C/8Cwty7qW1E4wKmxwOat1LpI1rDNht
	xSRbpWA==
X-Received: from plbv2.prod.google.com ([2002:a17:903:44c2:b0:2bf:2808:7225])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:144b:b0:2bc:dca9:f0ed
 with SMTP id d9443c01a7336-2bf20dbeeb3mr34014545ad.15.1780065905419; Fri, 29
 May 2026 07:45:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:59 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-13-seanjc@google.com>
Subject: [PATCH v4 12/47] x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() => native_calibrate_cpu_late()
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

Rename the late CPU calibration routine so that its relationship to the
early routine is more obvious and intuitive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 5b4b6e43c94c..534462c81c78 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -779,7 +779,7 @@ static unsigned long cpu_khz_from_cpuid(void)
  * calibrate cpu using pit, hpet, and ptimer methods. They are available
  * later in boot after acpi is initialized.
  */
-static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
+static unsigned long native_calibrate_cpu_late(void)
 {
 	u64 tsc1, tsc2, delta, ref1, ref2;
 	unsigned long tsc_pit_min = ULONG_MAX, tsc_ref_min = ULONG_MAX;
@@ -954,7 +954,7 @@ static unsigned long native_calibrate_cpu(void)
 	unsigned long tsc_freq = native_calibrate_cpu_early();
 
 	if (!tsc_freq)
-		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
+		tsc_freq = native_calibrate_cpu_late();
 
 	return tsc_freq;
 }
@@ -1497,7 +1497,7 @@ static bool __init determine_cpu_tsc_frequencies(bool early,
 		else
 			tsc_khz = native_calibrate_tsc();
 	} else {
-		cpu_khz = pit_hpet_ptimer_calibrate_cpu();
+		cpu_khz = native_calibrate_cpu_late();
 	}
 
 	/*
-- 
2.54.0.823.g6e5bcc1fc9-goog

