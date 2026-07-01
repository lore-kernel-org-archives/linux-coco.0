Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D85B42A795
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934402; cv=none; b=c3Z8/n1HeoqY3kSo1sH1hD+gSKbv8wiXJW2A4RlD3KkhLw1n0htBvJPyYDghyC0B95alHImyKLkZZW3GdAiyQvfkkMUp7va3kyMpy3JKaGmfy+sqVKdTz8cT8LAYTIBKYdZojej+p0G7YdnvQDXKUJuWAxy1zPGG298xKyZpt3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934402; c=relaxed/simple;
	bh=5RmHG8jQeFaxWLyXRFh1e6DyJpHBisQQEigG7SgzsNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BS38Mkkl91aW8axrjwN5pTDybeehxMpsZQp8JGb+4zwpGmsZzrYrgP0agIDOPSe6Xw3vh5lFgyYo+g8tMP/IUDGiBYDUW+55UCLH3rzs87otlSjtt6aqXjZHEd7WzsNgc2NlVNUfLlhw9tK/u3sd55+oBHZwRAxg3Pq836Qw1fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2W5DPwy; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2W5DPwy"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so973207a91.3
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934400; x=1783539200; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VKCobU9qtcP/hN9BlhIiU1X9DFbnjtpoNJAd58RipCc=;
        b=J2W5DPwyAPl90p8wOKOa6ymV8wz65mAlRuck8n91gsHDe/N4zButTg/7kWsBGQuddz
         qokU5PNItiM9u1tmVuytTSMkHU1NIwkVK7CZ6AX6SOIkwo50ub0TnT5J8HG3SqM1gngN
         XIGl72CVxm2EAirMRlLIwOCfIb4VQmN2AXgOzzGR3wGPrZQqkArDPz2eK5J+oNuH0dvH
         veis07E3Npw13CgXS5pV+tF3QZ1UFrUwpjtJveOaQPPbk16z98EnMTDP2XamGKAjKPbq
         aF4HARHE0xd4G2JFjn3mhhMaxzfmnPB00so37Eg8YYSKH1zMGCvBUd173hiaLrwEHC0+
         NCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934400; x=1783539200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKCobU9qtcP/hN9BlhIiU1X9DFbnjtpoNJAd58RipCc=;
        b=L8ujs+Ky2jkMilaVMgQiJmU+QsQ1rWKvCB76hYpcz7Xp66n/5pqlslazvtzBnm6nmh
         xmlkRZ4aSLno3kJFXsvPYc4VxBPXSq+1bS2S2dbQfesyBPGoRiU1rgk0EOYJI0VqcwBO
         Jpnx2sLh8fzaNzs16uQKDNigUgcRY4zwt8/HeffdGDlz6DeEugP+20XQHWK5VUlwSW3Z
         WcHMGa5B3KVWJCKFSnJyyBsC0fdsc3hLBUNwlKtggxSG2sq3XXcoitx/2PlfGiF2x97U
         Pi5KzINB+JAd6WA8+vvHg2XcNpiFLjER/5iU3MuQ5C/vcCam4urvQ/xsJLIzKwtU9LgD
         9PBA==
X-Forwarded-Encrypted: i=1; AHgh+RqT6CGrnjmQPIpKeeU5lBIOmbTerqcF5qWBamolD691DpH5npek8WTVLcjH5K7j1msqaLZ/K5MfVV4L@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6b0gvV06ppkCuAY1sX8cakt7Pud7U+rmw6zN57ewuE/B2qH2a
	by+XXnE1YZKBc/gjAo4nKLOmMpXx8Pf8ZakWt8E4MIup055g/LRoCnTiZeLH9e/FNCS7XFkj1M+
	nEO/DZw==
X-Received: from pjqu11.prod.google.com ([2002:a17:90a:ae8b:b0:37d:8595:7a08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:180e:b0:37f:ff9d:ad69
 with SMTP id 98e67ed59e1d1-380ba80c706mr2175388a91.7.1782934399271; Wed, 01
 Jul 2026 12:33:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:04 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-44-seanjc@google.com>
Subject: [PATCH v5 43/51] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 61d4d943fe74..41aff709b90a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -152,7 +152,17 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
-	kvm_register_clock("primary cpu clock, resume");
+	kvm_register_clock("primary cpu, sched_clock resume");
+}
+
+static void kvmclock_suspend(struct clocksource *cs)
+{
+	kvmclock_disable();
+}
+
+static void kvmclock_resume(struct clocksource *cs)
+{
+	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
@@ -223,6 +233,8 @@ static struct clocksource kvm_clock = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.id		= CSID_X86_KVM_CLK,
 	.enable		= kvm_cs_enable,
+	.suspend	= kvmclock_suspend,
+	.resume		= kvmclock_resume,
 };
 
 static void __init kvmclock_init_mem(void)
@@ -318,6 +330,15 @@ static __init void kvm_sched_clock_init(bool stable)
 				   kvm_save_sched_clock_state,
 				   kvm_restore_sched_clock_state);
 
+	/*
+	 * The BSP's clock is managed via dedicated sched_clock save/restore
+	 * hooks when kvmclock is used as sched_clock, as sched_clock needs to
+	 * be kept alive until the very end of suspend entry, and restored as
+	 * quickly as possible after resume.
+	 */
+	kvm_clock.suspend = NULL;
+	kvm_clock.resume = NULL;
+
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

