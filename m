Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695F1E47A5
	for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761851740; cv=none; b=ihaSsCkBpw59Vfx7/P555lj3hYybcfcLPj3S6XYnZ1eOfFRgcYgJ9w7BQ0PCULz7BS5JPv9nruhg7EGOYejtWd3z/uSWUx4McYb0svK156gGGtsGqtkIikkIVmh6qlEp3CyYL9pZEB+DjG6+3wpFq0IZsnFGk+EHug/kHzOw1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761851740; c=relaxed/simple;
	bh=njD7vVo3RY8sZ4uT4oO36OjUKcILGJX+/8k/St9xxG0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eOKkGZ4sjhyqqs8S3KBLkAHGEhNuDE5c2quHfGnYhBDYAGmC2yUIHKlmUHUMgSQioV4g1U+X7GAUCnLQ0qFZcgdsOjYa0iGxTVOcVu6GcwfpiIOegVKg2NtxJifYRxQNG9/PjtvLKZpixF62yQwHlAJZ/j+NyCk1OqkP7cdmCiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Riw2d504; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Riw2d504"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-290cd61855eso14947725ad.1
        for <linux-coco@lists.linux.dev>; Thu, 30 Oct 2025 12:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761851738; x=1762456538; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FNqfEfJoqSYUvF/W9hXgR/MQkgj3qF/GVzyQVpyWACQ=;
        b=Riw2d504DNLlrbo7ris7yis5MHm2X9Qhm+WlBvnPiGcUbtSm1rF0tkXrtITZHgIkQF
         kwfGVfNc69DXOKpX3yz2+p/s//LGmUPrVzwRKYCUHh/JgygJf/tq78F2FJKyCMVMde5l
         jsnleT3M3y+GEajCPO65ApJJp3BYx8nTTCzT+YRDX2v0AhcNyao2G8BKxArOeIi5dHBc
         sBycRh6Xn2TgR6+bhhDTeMXg9rFrJmpyrgdFibV/C5o1MkDgzGpl/xxsZAskr/2Zu+oy
         odrgHiyxgLPl0+LQL74bfrw/cM+RT9Kh3y4QGdrpLPZl2oG6SM8rr7w79LuReHDS+tP3
         4oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761851738; x=1762456538;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNqfEfJoqSYUvF/W9hXgR/MQkgj3qF/GVzyQVpyWACQ=;
        b=bNgIsKgyFaXEwwJwg96z6aDZcGJWptw8CnG3pqtYRJWZjDtqPHdC2tqA3I+iGS3Bwq
         5hy+izpsPnNfWjkpjuZchf//CSL4RVuEywvz2+Epipq/ParGfYWuc922TZRlJZC1PqPX
         0uZAarOrPzzfh8Sr/rjoeTzRAF8mVuuK2xa95nx4eUiwCItNlX5s8xMqm2EMMcEdaXx4
         qFBmxPAdEGi2uSiUorMILaGAXrDgGa/40ICJ6PEOfZiTe20O3QeRm9jd4p4xLj9Kayi1
         ZZwQmakij3uRv7teaYA4geZLqYLZRh8RMa+LiSUUhx4w3IMNd/NexPvFZ9YAHh+GqgCd
         Y7ng==
X-Forwarded-Encrypted: i=1; AJvYcCW3lrls22NRC960s2DDRbdYyEKK3PE8JI6H0WRKlQRsRiDqTVCQsJypUi2MJRK99f3yGeT17icIsRJX@lists.linux.dev
X-Gm-Message-State: AOJu0YwG5XlBj14C+wnhYIWhAIsAYrCzuydtzJ+YtrJVpGJ/xChS9snx
	XxQinIG/afQZmGi/r0x42DUFtwG9nfAMsEEtop3IZhSUuxIxmOInjjgCrMpQd4KCGJ5iOg8sKjh
	0yDW3gQ==
X-Google-Smtp-Source: AGHT+IFBdKayTTHDRLc1XeLTBMS4cU/1mdOhxtVsleqZOp+VTYxxaZOIKtrD0iyEKzZHky8RcgnIOTS6Ng8=
X-Received: from plch11.prod.google.com ([2002:a17:902:f2cb:b0:290:be3d:aff6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3202:b0:294:b758:76b2
 with SMTP id d9443c01a7336-2951a58890cmr12319815ad.43.1761851737922; Thu, 30
 Oct 2025 12:15:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 12:15:27 -0700
In-Reply-To: <20251030191528.3380553-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251030191528.3380553-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030191528.3380553-4-seanjc@google.com>
Subject: [PATCH v5 3/4] KVM: x86: Leave user-return notifier registered on reboot/shutdown
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
 arch/x86/kvm/x86.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index bb7a7515f280..c927326344b1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13086,7 +13086,21 @@ int kvm_arch_enable_virtualization_cpu(void)
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
-- 
2.51.1.930.gacf6e81ea2-goog

