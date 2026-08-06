Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DE47F775
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059393; cv=none; b=C9yP1IXxfeO9urpn5LGd1CquE6DFE4Nx36sfV63wEso+NiPApseoPkzE+K2Lwyh9BWUSjfSJlbjQQCuMyC9R1LKKNz9sMMgKhzmcpcN2Z7qMK3tFWpmkGUpsHqNlyZedFudWV0j5yF1tUdIPf++S2v3lSW0FWZAQNH4GHr0FptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059393; c=relaxed/simple;
	bh=ovqgLwzv9GptZQJnSNvVW0VhM2ENGfkbKgdGmBqtAeI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JvS0RKpoETCDDZzmhDsb9TZsqkT+0I9L5ObUVjitutd60jjDlUy9DvVPf7FxeNmNtlDTC7HLX7MfBoefNpop7xx61h2JGY6zR4/CBB8/IJPt/LwUlg9VvhrdLHED4MC/B0WG1KNFFDwTgLs3K5mINFFdJ1ns5eI5JDXyqNOLMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HpiYOV/5; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpiYOV/5"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848662cd2a1so3352126b3a.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059386; x=1786664186; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lGVITa15iYf7ywTb6PznrnwE5mV86GVcr9KZACd8UjM=;
        b=HpiYOV/5J+97xnYz8dq2ocue8YcbghUI5mU0i21uAU2OWA6GVAbp7dqaZyhJir10iP
         J7BXJQMNcqksICy7tzdlBViQBJbU9CwjHPkvgodCZsZaApPk5k+fCZhf0FPdfyrKpX86
         XGFzo5yIPoHusQwG+YMtH2Hodw0qrPBy4rW4EbY5erGlL3Df8xJE1jP8U9au4IKD7BUP
         Uv49qq5ow+RxTMFf5seVzFBxV86Pt48j0ovrXAzMXvlK5NWNCaz/6Xno4mpkFm7Ci5HA
         MyOrtYtBYhXYDVaoJOntKQWXrQiJw419R0vmmtdmeBu3Y5RyZx+HO+jCXlGYNfGHp28x
         DApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059386; x=1786664186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGVITa15iYf7ywTb6PznrnwE5mV86GVcr9KZACd8UjM=;
        b=mSZOKKeq984WfsJUSEpCVNbrcv6lT0OAZYiX5gLzirvtgGfUFqAyjL14Fx72fN1m6i
         Cmfzh+kw7ihlWqgQ0svBbW5emHxRxJ4du3RDzmzcaJJ5uI070koS2a8SEJaPjwHJ6SUW
         ysRrq5O3loRDsSUiRxBPvV+D5wQorMs7OrqNYomfpNRsz0v0E4kV3SEJZFGNiDegDpV+
         uiwdFpe/ifGHVx5Pv9Id1oZ9hcDSLI/3PNm6rMMpCcpOzfYYUOf5JopeDYNofBljwXUx
         eIm0gdfjMacpx8y7jVRurjvD6Xjwqcu1BYpR45RsYFSCsTmvoQ/0mApCmwNNcVGBiil6
         244w==
X-Forwarded-Encrypted: i=1; AHgh+RqqKeAOKyKwtRQZiIZl5Wjsh5f338ZRCCeXdD7mODcRp2JNorL0sGsi2ubA+ppz/jmzwcLfLIDdNUlJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0tC2Qsc82omgAj2LWEr9Kn8295acr3MvGttvGUJyTfKJMHZ5f
	+nTdo7WGlOmIHaSJX0CX82M24NzBvE58tJg53gFFuZiBsQ7tQBNHH9RSbiOx5vjV6Yuu3BIpPXK
	aaJ4S7A==
X-Received: from pgnc18.prod.google.com ([2002:a63:7252:0:b0:c9e:6c82:64e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1310:b0:84e:216d:7e52
 with SMTP id d2e1a72fcca58-84f2e03175emr20642138b3a.14.1786059385989; Thu, 06
 Aug 2026 16:36:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:19 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-3-seanjc@google.com>
Subject: [PATCH v6 02/51] x86/apic: Add CONFIG_X86_LOCAL_APIC=n stubs for APIC
 timer frequency APIs
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

Add stubs for the apic_set_timer_frequency_{,k}hz() APIs when the kernel is
built without support for a local APIC, and drop #ifdefs in callers that
don't need to check CONFIG_X86_LOCAL_APIC for other reasons.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/apic.h  | 2 ++
 arch/x86/kernel/cpu/vmware.c | 2 --
 arch/x86/kernel/tsc.c        | 2 --
 arch/x86/kernel/tsc_msr.c    | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 6946220a6008..9c5084f3317f 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -189,6 +189,8 @@ static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
 # define setup_secondary_APIC_clock x86_init_noop
 static inline void lapic_update_tsc_freq(void) { }
+static inline void apic_set_timer_frequency_hz(u64 freq_hz, const char *source) { }
+static inline void apic_set_timer_frequency_khz(u64 freq_khz, const char *source) { }
 static inline void init_bsp_APIC(void) { }
 static inline void apic_intr_mode_select(void) { }
 static inline void apic_intr_mode_init(void) { }
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 22842bf5b59e..2225df67d45f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -422,10 +422,8 @@ static void __init vmware_platform_setup(void)
 		x86_platform.calibrate_tsc = vmware_get_tsc_khz;
 		x86_platform.calibrate_cpu = vmware_get_tsc_khz;
 
-#ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
 		apic_set_timer_frequency_hz(ecx, "VMware hypervisor");
-#endif
 	} else {
 		pr_warn("Failed to get TSC freq from the hypervisor\n");
 	}
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 63e26805f8dd..4392fddd616e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -710,7 +710,6 @@ unsigned long native_calibrate_tsc(void)
 	if (boot_cpu_data.x86_vfm == INTEL_ATOM_GOLDMONT)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
-#ifdef CONFIG_X86_LOCAL_APIC
 	/*
 	 * The local APIC appears to be fed by the core crystal clock
 	 * (which sounds entirely sensible). We can set the global
@@ -718,7 +717,6 @@ unsigned long native_calibrate_tsc(void)
 	 * timer later.
 	 */
 	apic_set_timer_frequency_khz(crystal_khz, "CPUID 0x15/0x16");
-#endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
 }
diff --git a/arch/x86/kernel/tsc_msr.c b/arch/x86/kernel/tsc_msr.c
index 4bd5f2ae656b..179e3a331ef9 100644
--- a/arch/x86/kernel/tsc_msr.c
+++ b/arch/x86/kernel/tsc_msr.c
@@ -211,9 +211,7 @@ unsigned long cpu_khz_from_msr(void)
 	if (freq == 0)
 		pr_err("Error MSR_FSB_FREQ index %d is unknown\n", index);
 
-#ifdef CONFIG_X86_LOCAL_APIC
 	apic_set_timer_frequency_khz(freq, "MSR_FSB_FREQ");
-#endif
 
 	/*
 	 * TSC frequency determined by MSR is always considered "known"
-- 
2.55.0.679.g6767b8d81c-goog

