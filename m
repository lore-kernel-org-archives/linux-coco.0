Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BEB3F6614
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067285; cv=none; b=uQe6AydHGFHXYw/jBkJ1XUcEAkYCN0NP+VTQTfr5TKTXy42phBbmwkK0zrJPULSqw/zOVMUPnW5m8GjFIoTX0bOaxbtG8WUGBw6vPpngOndT9sEIXloRIsTsnK7msQ3QYL5lCtwl2KHFEbnM4ZXXKgSdv/o3WUTnceTpoCJR/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067285; c=relaxed/simple;
	bh=oQBeCKjjhNFtUPINo6soUvc55PJ7W+tEXERwbtHRNX4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pmG2kVm7Jn09c1kjtkb6ljEW/mmjseoGehvE2RDXSao0PLihwiUpbNZnK6BGppa0nQKU/LdFlJB0zmzdX4HD9FSDC6jiq3OEfRQX2D0ZdglCsltkrnmluL+1EdIdlnVGYN5V7uUxj99gnI8f6Un6+dNpIdWAuqLYTz70jlVjA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ot/bMwzH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ot/bMwzH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf1845bddfso12995935ad.1
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067283; x=1780672083; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A0LUKgY7WdUW5/UN6qkumXlSSdA1avjLrzVcdpZcOlg=;
        b=ot/bMwzHUBuh7Y08+1Qz3RFETNqSkHu697bDfhSUaSi9XUnmfLrHNgza4oPdftPWEc
         Pa8B0tJ1GNb4XdlpbcBuxP29soeqp9cLBQaTT3ovazL848bD9US7oJ4o7dcjKquteN8o
         3l8zYADQmKYcvi2wvgOQGCrYN4lUGMxOZRle0lgkn3DrCl/oT7nO4W3B1841VzZ53FV0
         32h9o24WJFGVfGvolB8413fIPo+IBJzNfYm8RONrAt1CKqOL0yp6x6dSgiF7zztSP5X3
         8FMbD0pbtT0Thk15p5nwW5F1hj6iH5ZSteTmk6stF11Jvh/hJx4VgT3TzPAKsouG7dV7
         AsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067283; x=1780672083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0LUKgY7WdUW5/UN6qkumXlSSdA1avjLrzVcdpZcOlg=;
        b=QQ5kyRScw+8sW9yjJN2KUg6hFshtG/rvpPF9agiPUJGAtTREemqj1IsTqPsM/SbQCI
         xkFfRzyDmo3dMHQM0ah1Hbmb9jpHbev3iquxrEl2u3Xuh6sPovnsV53yKTA7Q0rsGMuX
         548eHa16gV35UJV78uidMl8RLqz1hA1yPKRWKPTd1vtp17f7KREj5GmAN4v6RJeYRmqi
         TCFsYn7Brb/m+hpW1tULdGeS1aT2EZsob2gusqzElZQq/97cL14O/IvsQqbWOG6zY69m
         qA0haUeko1JKVMsSxh2GHLbCjKPTn7+6zdVA0Is6Qj6BrztRLdZR+ReRDeB54CbumMf+
         wg/A==
X-Forwarded-Encrypted: i=1; AFNElJ8Olkdg0V9wYiSpe4xkGswCbHgzj9lgp25+S7CuJFRCt9u18SkgiFDqRxHlT7AaWpY6EsGlQGIben9z@lists.linux.dev
X-Gm-Message-State: AOJu0YyGbtrvEwi1yxSZ9TVQXwJ+8lL7udg4ACwxLYpYLyZIhyMB1+FZ
	L1PBmTKFSNwBkflpDSEHIlnxdSfZQvZyPGUx0cSc8Eo+T2dkl8koudOp72nCuCM+NuSC4HFlEbV
	RQ7mz6w==
X-Received: from pldt15.prod.google.com ([2002:a17:903:40cf:b0:2bd:a5da:7a51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da84:b0:2bc:8f62:990b
 with SMTP id d9443c01a7336-2bf368d7531mr1933905ad.41.1780067283075; Fri, 29
 May 2026 08:08:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:00 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150800.714453-1-seanjc@google.com>
Subject: [PATCH v4 34/47] x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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

Move kvm_sched_clock_init() "down" so that it can reference the global
kvm_clock structure without needing a forward declaration.

Opportunistically mark the helper as "__init" instead of "inline" to make
its usage more obvious; modern compilers don't need a hint to inline a
single-use function, and an extra CALL+RET pair during boot is a complete
non-issue.  And, if the compiler ignores the hint and does NOT inline the
function, the resulting code may not get discarded after boot due lack of
an __init annotation.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 05bca2be0df3..6372b4dc7b0c 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -134,20 +134,6 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-static inline void kvm_sched_clock_init(bool stable)
-{
-	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
-
-	pr_info("kvm-clock: using sched offset of %llu cycles",
-		kvm_sched_clock_offset);
-
-	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
-		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
-}
-
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 {
 	/*
@@ -303,6 +289,20 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
+static __init void kvm_sched_clock_init(bool stable)
+{
+	kvm_sched_clock_offset = kvm_clock_read();
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state,
+				   kvm_restore_sched_clock_state);
+
+	pr_info("kvm-clock: using sched offset of %llu cycles",
+		kvm_sched_clock_offset);
+
+	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
+		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
+}
+
 void __init kvmclock_init(bool prefer_tsc)
 {
 	u8 flags;
-- 
2.54.0.823.g6e5bcc1fc9-goog

