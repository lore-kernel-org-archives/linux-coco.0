Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B73E7BA3
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872857; cv=none; b=TxMXICQHIndrtgB8rAgj2UYtTjofnOIz0+zgempaBurAxcxMaKiBzH6uGcd4zv98f/5/1hzre4eTt0xbJ7JuHgt3cJa/R35Dyjf84QT3C1HQGrGDf3Cm54s5W0s3AmrIuYQMlJMpM0FGlL0cAN79oZLaDiDWC1MIwHFHHKlSpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872857; c=relaxed/simple;
	bh=JoZRC/hW+tKnKrEAUcORKk9q7uPs7dRukf9wHei9sJ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KVvPpkupxZdGLtU9nYrM52fUC7YnkoiCbURbBQb44Iwn1ORK9Fy+EwffqDK3DVWqZrEwpTVCLjOKWOCHA8UxwD2eRyruiwh4BoIyXiKjWPhFC8JMy/ZOtbnx/Raey+dhEqIUyr07SLhk1Ngjjkou5tFGTof6gBBVLvR3sQ+a1hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qtQdHCwV; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qtQdHCwV"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8279604464so193690a12.1
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872854; x=1779477654; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0xIKAIujVCN543pIVJIG4PCsIsqHFXWMUqZ1keR+hJo=;
        b=qtQdHCwV66lQty4bmEDEthVKPvj+aaW/lrLi5v36cURdqRAvoLfBHmwqGaxuCRTMEY
         2Ln/vQR5IT+Owv+2av5Jd6mWk4TCMXFKwUiZsIFMd8YplmhH/AS2ceywN3TNurGpgyRA
         uiS51Is0PmA1IR6oFYdbW7poDSr/jcG4m/gFfDNz5KhLDJIPLm5BXALt7/8w5CPI+FVb
         IsvbtdCjMCSqU/c3W5t77AFLJvK0adQqD1U5+ufd6VgMPb7RhSrruj+vY/dAOQzlE6P3
         FhuwIIn1Y3xE8kUz46Cd+ilfNRc3ygb5COFWqGV6hFy7T8vfMGNpqQpK9WRSexPl3ZnH
         Eamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872854; x=1779477654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xIKAIujVCN543pIVJIG4PCsIsqHFXWMUqZ1keR+hJo=;
        b=R0zYmMclJ3B3dsM6+G5HypDUugrvbI6mb+LdkfxiJlSO7PxNm8ynWL7Fl2owuVxRlP
         esT/olWgvQLykFchet/WIMtPSZiUzU5TFB3zXJ2Gc9djOgHfHnjdyevA8ONosY69WyBT
         7Mfu62Q18hE8Bx/EWk0Ic+wCO/bxolwWO9bWk4rbPOmJ94TwYWuISIeM1eXC0iUo/tYh
         qesAuHbdd86fdiXkYKOAnYX06J2lXjVRX3YcYLl0Nhpp/qQwkKQ2/OURsaPEaXMYkj1B
         AJtB4fcSGw2KoycFLOvzJamebcog94TYRFJLGjqQYM+IL839zsrLqMSH1I+wyzOKFVQt
         /Yxw==
X-Forwarded-Encrypted: i=1; AFNElJ8STdeXYfbdjqb+QrYWzHogUjgoqYO09krNGLzzYoP4kiKvHrKK/khxT+WzkkcxmRpktQDWhtnqSdtE@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0hBK5gYiNtRVH0R3+FokfZN35cSPoQ7WsLRkQeikpr+6Ualeb
	w2qKyBdCzxEqkCUflaAjyLueR18Mt7qoC3hRJJFmpAETFIu4ClKbNEu9Hg1hdotEKaK/1bwm9wW
	ZWFgVaA==
X-Received: from pfbbd18.prod.google.com ([2002:a05:6a00:2792:b0:82f:75de:5da4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1908:b0:82f:50cd:e586
 with SMTP id d2e1a72fcca58-83f33cb2c40mr5886702b3a.13.1778872853499; Fri, 15
 May 2026 12:20:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:22 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-22-seanjc@google.com>
Subject: [PATCH v3 21/41] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.54.0.563.g4f69b47b94-goog

