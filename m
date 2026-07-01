Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC098429DA5
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934401; cv=none; b=ReEguNP2c/Sf2kKvLGsZiDhshGVegDU5Djj1C15T8dz2sEuAE+TQ996NdC1SegbzxG0opxFFx3lhjdUtvLUsslM+oETdWaauoaTkLcSfbYxfwiNCiB/akSmLw9roKxndedE2wWMWTdbrpbcvW4jBhOQSPg+klkVPcnXyUaDvFeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934401; c=relaxed/simple;
	bh=WFd4Q0rqoZceFAWrIK1Xzvh1py+2tI8zh2sgEj9iv78=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R3U8zso1g5lhCDkDf2pZQ2DJRT6/URHt6x6Tc7wtXPDU34bIOlROvMSt3hTc9n6axRdLi1Nb5w8FGKzM9W00S+d/RCAssTEA/FbbUf2mEi3sGkk6BTlQkmrwrg1kP+baGPbzQdpMieqEiC9dFGNbxmNARa7uxMO6i/tJUMFsKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PVa+SlKO; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PVa+SlKO"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1163216a91.0
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934397; x=1783539197; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UQI87jJDSOF5xYM7+FYJ7P3rXlAyaoExltyOrt00Pyo=;
        b=PVa+SlKOUfFDJKvn2J/AzgzkC0U+6DQly3LHflrkeEp22WQYS22DmjgMNC+nrIGg9w
         zkn9JJdvJy85Q74MHcYgqhvB7lPSCLQjSKFDq6SRKK8fkcqTqofzJgvXRPvnNSNjYRij
         AVjQZvWStJ3JEhrXgLzFq1kkwFsOIP20yQ/yJA37i0yrXKpDHTt10xVO9XQ6fdX3oIXy
         T1sWQi4vrM35yw66KYaVW6o//cQHF8Y+wrtdrQ03KAnvQO9iKUi032gVBp6XXACNUaDj
         1g0WznWzw5SFtRI3DbGIXILffn5b75vtE5AHD9FmF6N/KM6Qvb3xjRepwzWyHcDxhXU/
         xDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934397; x=1783539197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQI87jJDSOF5xYM7+FYJ7P3rXlAyaoExltyOrt00Pyo=;
        b=ow6Z5VEIPsh4LlWQR0+o4LTtrKn951fva9Z8+GQy924FnvAQi+p4UwHAn3u3t3CAnm
         FoUJ3M1RFmsuGYt/4T86owoddZRzWQ7j6tJDJFbZRhkckbcBm2h0DxhVZGXgt39Yfm+3
         gkWeuMYi/Bv7vEa2BamIawM6ifB5J3QMn6aOY8/qb7i+tJ1wiXUoFBkyEy74ZTiwHlMU
         YcRqPiMnJwa7L9VNmwEAICg90iTcXs4lDvCLcsP8FneR4tU3dhZLN311mY661Of+V3td
         JW4ln51uP61EA15QCVZE5BROXUX6eL0dAW/V9HaEb9lPjvdS2qbMDyF0mJpIQ8XMl7HX
         m5rw==
X-Forwarded-Encrypted: i=1; AHgh+RpzSNU3po96phPgI9dv7vv7dxsBPq4PxZ4doDR6AsBHs0VWxv1gKYQ8ywJIMPrEX/paPu8UdtH1hDvv@lists.linux.dev
X-Gm-Message-State: AOJu0YxH+iRjQnEStOlwxg4IHko0eFocx/v6B0n+1qcSzRSzCLKWzqtf
	Vdx/p+q8sCKLecQd+K5ohazb27mv3hd0zOHRh1RW43k/Jv9RbD7/O6KoO3YGcqwo+PBiUSIH2Vf
	w1s6b7A==
X-Received: from pjbcv6.prod.google.com ([2002:a17:90a:fd06:b0:37d:de2f:3ddf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e84:b0:37f:eda5:5169
 with SMTP id 98e67ed59e1d1-380aa127da8mr2911601a91.13.1782934396852; Wed, 01
 Jul 2026 12:33:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:02 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-42-seanjc@google.com>
Subject: [PATCH v5 41/51] x86/kvmclock: Refactor handling of
 PVCLOCK_TSC_STABLE_BIT during kvmclock_init()
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

Clean up the setting of PVCLOCK_TSC_STABLE_BIT during kvmclock init to
make it somewhat obvious that pvclock_read_flags() must be called *after*
pvclock_set_flags().

Note, in theory, a different PV clock could have set PVCLOCK_TSC_STABLE_BIT
in the supported flags, i.e. reading flags only if
KVM_FEATURE_CLOCKSOURCE_STABLE_BIT is set could very, very theoretically
result in a change in behavior.  In practice, the kernel only supports a
single PV clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 5220d205abc7..61d4d943fe74 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -327,7 +327,7 @@ static __init void kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(bool prefer_tsc)
 {
-	u8 flags;
+	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
 		return;
@@ -354,11 +354,18 @@ void __init kvmclock_init(bool prefer_tsc)
 	kvm_register_clock("primary cpu clock");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
-	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
+		/*
+		 * Check if the clock is stable *after* marking TSC_STABLE as a
+		 * valid flag.
+		 */
+		stable = pvclock_read_flags(&hv_clock_boot[0].pvti) &
+			 PVCLOCK_TSC_STABLE_BIT;
+	}
+
+	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

