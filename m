Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7094DBD96
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934370; cv=none; b=j9DuWOmja/7uBXbCMvERB9ERBh0HsONtCPxnKAEtxzbBBpBb1yDD/4IiHlGmldlAVg1FsmRkjhR/QCybH6aMSJ2/IJV7JLFMuFdX84H31bDSF3zMN6qTZ2zzzVkqi5v1SfwecZqXgosA2ycQVHZay0ycsREibd7cyTjCHcIUWD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934370; c=relaxed/simple;
	bh=1GecteZCmORDRJzv/0fTJ5eJc9riviXtHhE/GZIQN3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tobm+8UhGYsKqHrRPJnoQwdvqkX5oO5LmTgkczBUX0nWcxbStErcpBZDKWm2tY4pLziO9q40EM7lMo5yNY/1k06JC+2ce/snonaNzaa4ng18lDljCrvmoxmmmxiBTV6yQmTyFy4Mq0ehYFexrcvAMmQpk6wZqVP0S9eNulZ0g6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ti7O+e7O; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ti7O+e7O"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ca3b314193so12001845ad.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934366; x=1783539166; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3QmXXgqE7aLG5WH8n+yjrFm5ZX7gR61uwM9vT7lFOWU=;
        b=ti7O+e7O0HjvXheaWQIaG+jjfIwrL9VyIY0BkWJLMQ+IqH41nCn6k0dkytTPQIg1+A
         2/TUCtiiDhJeaRt+SmODLkTRaNNykXMspiFx1AAHXMrJ0+0qns3BE5bF+901WgizKufx
         A4hP7GSGsmwz7wVowEo2MdHaSVtNpdM96fz+TG4YftmpI5KJHIi98ImzLURHledMTWSY
         0ecms3urn21Co61C4PGj+BCH+du49b9gu3uIl6gVpYg8SaP9yg31bdJ7oi3SFhWS8Vbw
         JdLpltfhjKis1+BvvXKREjaN4qK6UsFyZf0c/+pL108fUxRO0Pb+mkD+37icx0vNE7Oo
         jo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934366; x=1783539166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QmXXgqE7aLG5WH8n+yjrFm5ZX7gR61uwM9vT7lFOWU=;
        b=UE2C1YBA3NtLqS3VWM1rwW8XsR919E5/i9Uo7/9+OGah1uxlD11ApL4y1rQSWng/AH
         VWAeedBA3lXF9KQ1OCw5g0sfyY/IzWTVlzyV0BL54AcRYIPDZeJmjPPh56FfK6a9D/28
         uZ6PL3VaaakiFHfL599k5rB2AgDCYGBvXr8wjgvvWk0MPbuuFbVbpbNXbxFxNlL0Cqvd
         vKL/wNvnBNs0I0Ym25JWHBIoakAPhUOl55yHYgY62mGeyQJqiDIOoYEYVd++TmDvgUCc
         FeX/W80BuJDqg1XrSNzYiwaIqN+5ntqQwgg5gqqoiV5+MHxxTjcoCmqTlU36ofHQ9xMb
         23CQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUIsf07rNRXkbHu8UOg3LpEbvWAK1DfC68VLyIAiiygZVDvUp0EqZ+eGZOdbMHetJAFqiZxLM5S8by@lists.linux.dev
X-Gm-Message-State: AOJu0YynGY+tB2bQokQMV9xf+LhkbdiqDSalGyjJRqvFagotlvSm8He2
	JD5TtmRyLipBT1g424baG8M3gSwmwmrEG1+inhoY7/OE0OvH0WUNEX4xnU8dD7pxGbvncjk91zq
	q4B4mKg==
X-Received: from plef18.prod.google.com ([2002:a17:902:f392:b0:2c7:eb53:9c06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:944:b0:2ca:68b1:b64c
 with SMTP id d9443c01a7336-2ca7e75d694mr30967275ad.20.1782934365572; Wed, 01
 Jul 2026 12:32:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:37 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-17-seanjc@google.com>
Subject: [PATCH v5 16/51] x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() => native_calibrate_cpu_late()
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
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
index a877b82d0991..9764ac758081 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -752,7 +752,7 @@ static unsigned long cpu_khz_from_cpuid(void)
  * calibrate cpu using pit, hpet, and ptimer methods. They are available
  * later in boot after acpi is initialized.
  */
-static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
+static unsigned long native_calibrate_cpu_late(void)
 {
 	u64 tsc1, tsc2, delta, ref1, ref2;
 	unsigned long tsc_pit_min = ULONG_MAX, tsc_ref_min = ULONG_MAX;
@@ -927,7 +927,7 @@ static unsigned long native_calibrate_cpu(void)
 	unsigned long tsc_freq = native_calibrate_cpu_early();
 
 	if (!tsc_freq)
-		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
+		tsc_freq = native_calibrate_cpu_late();
 
 	return tsc_freq;
 }
@@ -1472,7 +1472,7 @@ static bool __init determine_cpu_tsc_frequencies(bool early,
 		else
 			tsc_khz = native_calibrate_tsc();
 	} else {
-		cpu_khz = pit_hpet_ptimer_calibrate_cpu();
+		cpu_khz = native_calibrate_cpu_late();
 	}
 
 	/*
-- 
2.55.0.rc0.799.gd6f94ed593-goog

