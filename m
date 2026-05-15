Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1540D1F1
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872871; cv=none; b=CmfxA6xeg7vJWcv1AXB/XG6lMUtGfPFMJRpO1kSwEuEl1NlJKfk45JUL3sRGetYjeoRRpnpXG0Vsq3c59mi1i4lVvzFqz/03HpeWozsUQFQpa0cF0L+ZuSopjJpNVLmu807scmXKP9XvFJcRVgos8B5qGqgLXMk1TB4MHTgchpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872871; c=relaxed/simple;
	bh=HQc+XSE41PFV7TKfdfxzuaNckcb4A4qOikHfqQvrKd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I22IzM7glfcDxsgZsD5TteMSZoWR2Vdh9OKQnvW54d47vfP5aqgHjdSqC0LPh7CzwQ8Jz791vnsIKyMZOIFKgDvjtVNvRZmJQ5lZK9wZYXS2ITl8HsooEvswsh8hKsT3QpH2v5TAP+tyPGJomhu1gjORG3uhy3kqkhdvlkBOS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F9p9HbeM; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F9p9HbeM"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso137377b3a.3
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872869; x=1779477669; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=teddAWkuf/46YtH4MCYfAbMCm8nV+WgxKaJ2tNA73Cw=;
        b=F9p9HbeMcZa0vqfph+A0YfFjJC3FaqijMSNlmA4L1vIZw5374XfEfEFkdV6qN7DuXN
         yH6bcuda++IJzGjI8uMTk/3gQEYtZFkjeb+GbtRthtsHUxZiV74kCNFNc6hic4Mgxp16
         s49NpGwBTtKV/RuOif6/qu1p117ko5vm0Bn11P17BLDMO9HY6begC74MV+89qNQiBzRU
         iBooTsonsbFjP/lRcQ2EDkJpO5pTN0bBEk36ueXE3dRga1L21joJgmRPVWNz2ZiX9e4/
         SdHDRKUcNQrecRsQmK1/+xic/sd5xQH0aBZbuQun7wvt2mP5lWsJ7maqd6L6KJZcYERY
         mVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872869; x=1779477669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teddAWkuf/46YtH4MCYfAbMCm8nV+WgxKaJ2tNA73Cw=;
        b=fZcuSsga6faW20Van7BrjLi/ZyFpcvO6bqTp60zRtYvVT1b+GMUffmt5+OO07z8Ziv
         OXbzaGkK/S5DORV0ZBqWgSsC7o7KbIZph3S5Tw2VqsmyUIWT4F6HXnopC1yu6WJSiqps
         5hFGMIaQWHx2A3Z3D6NkwXHI1Z0MFOeZ3YnPM6pvceMTOxP0nlHudjXMAxOblq9yLqfJ
         6htFylum5sJiFl06pzshEAvxrtR4GbMPHin147SSkyuWZOecZM3Bt/Ca8E0doM6x/19F
         2D0ujz0Fl4SgrW7tyHudb/7J2krRG59kO7LyeWeBqrYRIfCtrU9JpoxZuFh/o/Fs9AEA
         yuyg==
X-Forwarded-Encrypted: i=1; AFNElJ98q0jHBu4EZJU7+9S5XbEqAfdLYuO+WLybQQUvaIGG2NoJ8k2mJpJBUZIVChfk2+hYt+gu6TO005hb@lists.linux.dev
X-Gm-Message-State: AOJu0YyOSc96Po3yY45W16ryEpYhO9J2CbGCZv7ewUBLj970I8exB9GA
	TT+C7doeZlfCINj/tnulFDQkP312AJhZg8BKhI58DZ/OH+3KQz3LJhfY3o8PiNhC0hpUoC0pEak
	dRSc0LA==
X-Received: from pfbdu21.prod.google.com ([2002:a05:6a00:2b55:b0:82f:6245:a6ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:950f:b0:838:c01a:7a50
 with SMTP id d2e1a72fcca58-83f33d8c1ddmr5490444b3a.30.1778872868844; Fri, 15
 May 2026 12:21:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:31 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-31-seanjc@google.com>
Subject: [PATCH v3 30/41] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Silently ignore attempts to switch to a paravirt sched_clock when running
as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
hypervisor could attack the guest by manipulating the PV clock to affect
guest scheduling in some weird and/or predictable way.  More importantly,
reading TSC on such platforms is faster than any PV clock, and sched_clock
is all about speed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 3c15fc10e501..ac4abfec1f05 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void))
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return -EPERM;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.54.0.563.g4f69b47b94-goog

