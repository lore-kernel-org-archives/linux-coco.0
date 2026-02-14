Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023528D83E
	for <linux-coco@lists.linux.dev>; Sat, 14 Feb 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771032449; cv=none; b=HZ6GObUdU7HEfjTaO73aGaTTYWesxUAf07zQYJeA5eZGCzcGWYgOliHEMdjnA84pFScbUVCFFbRV/ujpgXD0v9rsdX2GF3qZPptqy5ER3jGK3dUX9r38/xWpJn0YHHxdVG2OqvV1+X1R0mzMJUMLNPC2J0/FX8azd/pbfalGUCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771032449; c=relaxed/simple;
	bh=hftPp1cgH316yfhw8k/dPrCnpI6uxskVDDg5/T2D/XQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d2w/L7QMxu2HSYRcXCxX7zHRmFS6gidl+s1Ob0QKUJABR3MfaWnskUj+Czv+YsR6uML0UpDme6bGupNNoR6AHLFwmeQHoxNBFhlKVHUMoZZZBcWLAk8/8kI7OSyIH2AEjP7PcWyHdhpmtJNKkxQu+D33Wv90VjUh+rbBkQuqzuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNqdhUDU; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNqdhUDU"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3561f5bd22eso1474591a91.2
        for <linux-coco@lists.linux.dev>; Fri, 13 Feb 2026 17:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771032444; x=1771637244; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H80q9SD+282s080Ud0tbsBB2WQnuDfalKG9TFAGQvtU=;
        b=gNqdhUDUhCaMqFoCttB57OihSr1sW/YozUck1qYN1PnKDsPPKh6buqCcVRPfkG7nKJ
         VqQsZfTgYqS77DE0vWExN1j/OXNOg6f09IDyKJqgz1WRsl3Q7k6P80lWJJyyMBW8u2cR
         Qx+/D6lm4Z0r71znjRlBZ0ieJ0Vp272e0D0AdfQcZ3mGW6YL5cJWahu4HZ+flVkjxZyn
         JZhp5HY2amwWdVV7WhAvpRaJ5qNA87sIlV+SgZEb9m/cg8PnONp0d6TaXqrQ0+wLc0Wr
         Uso7+R2JqIClM7iA17fKWiakBAkG6IpnIemvAgALhjZvJjY7+Q7tPmzy9xqhPP41XVHA
         cc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771032444; x=1771637244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H80q9SD+282s080Ud0tbsBB2WQnuDfalKG9TFAGQvtU=;
        b=Vt+xozKEr0THRxEufgbQSPkTc+a0j8a0uR2lg4ZsnQQy84Mi70CSCNCMHGgfpBSr9x
         2/H5FeexdCNt19GsAp+lap4gVo+O75Viu/tabbpG07tHv9PVOf368xqDb6Uamnz2IJo3
         iZweEDd4OtkbRhicheXPbK6sox9s1p35AiP8xw+jZ91kTaBERBhJU/bxgJ62eEit8HSU
         Q/2dNtbE3+P+mdzgcX78iNQBYjkuQWUVcbSax4ie4b0P7x1ioqGfv3N8SaNpOxMBreBP
         qF+713t6QWSfCCrxESQCMowcYkVJbAhtI/ytUWZr2KB6Y3W0ikuTmUOQgh9xMP3eWDhZ
         Xf+w==
X-Forwarded-Encrypted: i=1; AJvYcCVcPwR28UFRBr7thQ2KaBtt10dM0TTI0JqZR+0/ks6v7y4luvvl0218rbC1TbNAEDoCpdvK8wTEmHBo@lists.linux.dev
X-Gm-Message-State: AOJu0Yymue0ggyiFxcbY0844VbezS9J4JYFrfCn7eWueL9p1NzieRtR1
	Xc8/ZPYjIouvZXZeYqOUn/+Q0m3xpk+yoSBQavXxo59r49m35/oMruC1XiMjDh15bSqK75E1zpR
	etHSQCw==
X-Received: from pgvt5.prod.google.com ([2002:a65:64c5:0:b0:c65:e24e:cef1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:43a5:b0:38e:9cc5:218c
 with SMTP id adf61e73a8af0-3946c8be39amr3465099637.54.1771032443485; Fri, 13
 Feb 2026 17:27:23 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 13 Feb 2026 17:26:56 -0800
In-Reply-To: <20260214012702.2368778-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260214012702.2368778-1-seanjc@google.com>
X-Mailer: git-send-email 2.53.0.310.g728cabbaf7-goog
Message-ID: <20260214012702.2368778-11-seanjc@google.com>
Subject: [PATCH v3 10/16] x86/virt/tdx: Drop the outdated requirement that TDX
 be enabled in IRQ context
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"

Remove TDX's outdated requirement that per-CPU enabling be done via IPI
function call, which was a stale artifact leftover from early versions of
the TDX enablement series.  The requirement that IRQs be disabled should
have been dropped as part of the revamped series that relied on a the KVM
rework to enable VMX at module load.

In other words, the kernel's "requirement" was never a requirement at all,
but instead a reflection of how KVM enabled VMX (via IPI callback) when
the TDX subsystem code was merged.

Note, accessing per-CPU information is safe even without disabling IRQs,
as tdx_online_cpu() is invoked via a cpuhp callback, i.e. from a per-CPU
thread.

Link: https://lore.kernel.org/all/ZyJOiPQnBz31qLZ7@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c      | 9 +--------
 arch/x86/virt/vmx/tdx/tdx.c | 4 ----
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 0c790eb0bfa6..582469118b79 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3294,17 +3294,10 @@ int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
 
 static int tdx_online_cpu(unsigned int cpu)
 {
-	unsigned long flags;
-	int r;
-
 	/* Sanity check CPU is already in post-VMXON */
 	WARN_ON_ONCE(!(cr4_read_shadow() & X86_CR4_VMXE));
 
-	local_irq_save(flags);
-	r = tdx_cpu_enable();
-	local_irq_restore(flags);
-
-	return r;
+	return tdx_cpu_enable();
 }
 
 static int tdx_offline_cpu(unsigned int cpu)
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 5ce4ebe99774..dfd82fac0498 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -148,8 +148,6 @@ static int try_init_module_global(void)
  * global initialization SEAMCALL if not done) on local cpu to make this
  * cpu be ready to run any other SEAMCALLs.
  *
- * Always call this function via IPI function calls.
- *
  * Return 0 on success, otherwise errors.
  */
 int tdx_cpu_enable(void)
@@ -160,8 +158,6 @@ int tdx_cpu_enable(void)
 	if (!boot_cpu_has(X86_FEATURE_TDX_HOST_PLATFORM))
 		return -ENODEV;
 
-	lockdep_assert_irqs_disabled();
-
 	if (__this_cpu_read(tdx_lp_initialized))
 		return 0;
 
-- 
2.53.0.310.g728cabbaf7-goog

