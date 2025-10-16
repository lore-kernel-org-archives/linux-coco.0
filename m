Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D92E6CD0
	for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 22:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653706; cv=none; b=EuGv4p0A+ZB34Yhm8xq0kN4f8vETqowDJqUd/f6qFNxC/Z4CJjJjbM+mjD+FBEMrnuR3oB7GtHxjTdsUYwaZJ85lrEd1+c1xdn9HqBCdEP96X3UMCxJgrRYVuZuVqNW5I+HoV95q/n7X2hLtI1fWEQdyHLsF31Ifzk3OjIM9UcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653706; c=relaxed/simple;
	bh=Jokj5W6CeBHblVuzEDrKOj9gCUGQHizkOYZDNZwqk7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nQLQVaQ0o7Dlqz6EQdQ4fHnThtkuIH5W+3Aev7dAzjmIgH799Vw/saOBSVOvj6vDqqb5Min6shHiWm8w4RL8h3dAg3xdNKJIQ0ikWt6smTtNfPrr3FOvcbyVOE0kVtnnAWYQYZDCifCxupUZGysRP9Bt2ZX8rzbr4SQsojAdoTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MY32MWkv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MY32MWkv"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28eb14e3cafso23090655ad.1
        for <linux-coco@lists.linux.dev>; Thu, 16 Oct 2025 15:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760653704; x=1761258504; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WFE7ffxV7H5+bRxN9E59RGE5SAa+1gI5/mtGB/K+Eb4=;
        b=MY32MWkvm5AUYWzo5Uf9OaP6KWn83h3Oh6t0Vauf4Iz3u0GKYnBmygbekQDVwY4oHm
         9Kne2uNl4TV0kGL785ifuQQwGD8+ffqBrgdq4e7ZWp5jEp7RxGj7aMrRaenQAO1aY85/
         0VoO3hx7M6xwI5QTZoeZNNUs3upMGZO1EGtSD2OKYGDtz5oo1c3bv/JDaKr6kce/FEeq
         2DunUgnIiXxl9JJsJSmJ3mohHlatwd/evLUJpiaDYU8kUL/yj0XdKqHrZR5b4p8VuISJ
         +rIvHn1MJgNf6dbZrde8hv6RjpadVWns67VpV1emKbj4QRWr1m31AqOxFoCzWVm5GS/n
         ILPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653704; x=1761258504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFE7ffxV7H5+bRxN9E59RGE5SAa+1gI5/mtGB/K+Eb4=;
        b=ncjPucCID3eUuz+jODVgS8wR51hR2na3aOdZoIruq37DrMK8P6HmqZzzLPiO34V+W2
         Op2lXcttiVrR723fKghfmH/9b2w7j9S/Crr10oZDloCniB8DlNU5vjp+OiIvf8uEwbhV
         izzpkratXtTXWe11q+fn9URsitJK9Wyt5mUYWaoK7yi4jjSH0CapBORlmLRDhBsVsWeC
         wIFK1vwsdhahiM8WclPXB7w2sBzh5idC0d51D5QmkQhIwsgVcvjBIm1BFp+ealq/bPvV
         GOIV4yt39Dv6Nv5dFqb+dfjCx1Acd6a6vjSICgaqXsILaeiJddP+AytGb7HbXvnCKWAT
         m5sg==
X-Forwarded-Encrypted: i=1; AJvYcCVpdbP0zZo7UEXcje9SQ1G+pbsA0/6VoXuxagum27rcJ+s8ODe3XaJc3rolkY5aF/X6tWCLE0VnArq0@lists.linux.dev
X-Gm-Message-State: AOJu0YyFE95BPc3OQyM5EOKmTUFXpTan7MNI2bgJdHZEXBzXa6cSCiIR
	3OZchbq6yNYHHewZTfJHttj5MI7yZwiR5Dw3SvmW5KE1v7Jg2xL5OK+g5gqcOhdsa3wN5VQefE6
	/7p5y2g==
X-Google-Smtp-Source: AGHT+IGINGWujUT8LVwPimS5S002MFmsaGhgV7mzPv8hsrQ2NJzNz7OV/D0bncxkEoFK3d9dOhVqOg/GBnE=
X-Received: from pjsc23.prod.google.com ([2002:a17:90a:bf17:b0:33b:51fe:1a7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d508:b0:28a:2e51:9272
 with SMTP id d9443c01a7336-290cbc3f200mr19594825ad.48.1760653704234; Thu, 16
 Oct 2025 15:28:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 15:28:14 -0700
In-Reply-To: <20251016222816.141523-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251016222816.141523-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016222816.141523-3-seanjc@google.com>
Subject: [PATCH v4 2/4] KVM: x86: Leave user-return notifier registered on reboot/shutdown
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"

Leave KVM's user-return notifier registered in the unlikely case that the
notifier is registered when disabling virtualization via IPI callback in
response to reboot/shutdown.  On reboot/shutdown, keeping the notifier
registered is ok as far as MSR state is concerned (arguably better then
restoring MSRs at an unknown point in time), as the callback will run
cleanly and restore host MSRs if the CPU manages to return to userspace
before the system goes down.

The only wrinkle is that if kvm.ko module unload manages to race with
reboot/shutdown, then leaving the notifier registered could lead to
use-after-free due to calling into unloaded kvm.ko module code.  But such
a race is only possible on --forced reboot/shutdown, because otherwise
userspace tasks would be frozen before kvm_shutdown() is called, i.e. on a
"normal" reboot/shutdown, it should be impossible for the CPU to return to
userspace after kvm_shutdown().

Furthermore, on a --forced reboot/shutdown, unregistering the user-return
hook from IRQ context doesn't fully guard against use-after-free, because
KVM could immediately re-register the hook, e.g. if the IRQ arrives before
kvm_user_return_register_notifier() is called.

Rather than trying to guard against the IPI in the "normal" user-return
code, which is difficult and noisy, simply leave the user-return notifier
registered on a reboot, and bump the kvm.ko module refcount to defend
against a use-after-free due to kvm.ko unload racing against reboot.

Alternatively, KVM could allow kvm.ko and try to drop the notifiers during
kvm_x86_exit(), but that's also a can of worms as registration is per-CPU,
and so KVM would need to blast an IPI, and doing so while a reboot/shutdown
is in-progress is far risky than preventing userspace from unloading KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b4b5d2d09634..386dc2401f58 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13078,7 +13078,21 @@ int kvm_arch_enable_virtualization_cpu(void)
 void kvm_arch_disable_virtualization_cpu(void)
 {
 	kvm_x86_call(disable_virtualization_cpu)();
-	drop_user_return_notifiers();
+
+	/*
+	 * Leave the user-return notifiers as-is when disabling virtualization
+	 * for reboot, i.e. when disabling via IPI function call, and instead
+	 * pin kvm.ko (if it's a module) to defend against use-after-free (in
+	 * the *very* unlikely scenario module unload is racing with reboot).
+	 * On a forced reboot, tasks aren't frozen before shutdown, and so KVM
+	 * could be actively modifying user-return MSR state when the IPI to
+	 * disable virtualization arrives.  Handle the extreme edge case here
+	 * instead of trying to account for it in the normal flows.
+	 */
+	if (in_task() || WARN_ON_ONCE(!kvm_rebooting))
+		drop_user_return_notifiers();
+	else
+		__module_get(THIS_MODULE);
 }
 
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
@@ -14363,6 +14377,11 @@ module_init(kvm_x86_init);
 
 static void __exit kvm_x86_exit(void)
 {
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		WARN_ON_ONCE(per_cpu_ptr(user_return_msrs, cpu)->registered);
+
 	WARN_ON_ONCE(static_branch_unlikely(&kvm_has_noapic_vcpu));
 }
 module_exit(kvm_x86_exit);
-- 
2.51.0.858.gf9c4a03a3a-goog

