Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4F493218
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059405; cv=none; b=Xh1iwb26G4JHAohpvZHhvvSR4XTaU//G7CxO1KQcY5cAE3CUb6ld7N5rG7E2QgDIGlCDuH7Tc5vvJGCYODpHzaCTtZd7w9FxQep719fsx9QFn7GWdfMVUOgClrKWHw+zrhOuiiW9BXXpeNmjx4EucKd5qSwIZPGcSsnFyLIpURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059405; c=relaxed/simple;
	bh=4z1GlPe+fx1kTpwR5eIkMwvFEvBptpYbjy53SQyI3Fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kdGJPTSkvzn1KRcBERUu4AfiBKlSpCVAdh9A2Qlss2JwJB0te8mKYXfLp31mW6rrITNMa3mIODqgcuBKnDa/27f1xPSHJ3ICAYIfnqVaCT07u7aw0G5e2hkdtXB6HR7j+y5wP+DJug4h+XsDg36cISm7JCFbNRhXO87H6E25K1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c25MTk3C; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c25MTk3C"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848474825ffso2105013b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059400; x=1786664200; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmrkRlf4iOUyRYugkcn9gxIXBFL0cMozIwMb4/CeDNQ=;
        b=c25MTk3CQ/LA6OSs9zA8jUKUc53ZZm4T64HOvFTjVhhRGzgL9Q7ymR4wivxK0buTKw
         EfDxCQOb5amF6HF6X6eMeHxxeUtOhGSWYq/ITxywjZA6bOQ3aD6O9Ni0P80QgCyCnLTm
         22EBnCIS+yTWA6sIH78Fyb8Y/PinCGtbp8jP25XdFFkI+i0Qz8BRk7bvIKQRU1fJf1wq
         /FuqWPYg9GZrBcEoPWWRJG5JZuaQkH6ETnh94Oh3d3DCHesIsjjhjcGJoOSkmA0PeYl/
         eCu9To3O0+nPMKEO8cgVugbLle/P/OhJFbhUM+DK5p9XS+lb7P9oQLiqcA9td2WvuaiF
         9ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059400; x=1786664200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmrkRlf4iOUyRYugkcn9gxIXBFL0cMozIwMb4/CeDNQ=;
        b=RX1ZQaaPnaEcxddk/KRUhJNAFaJtheXYymIqtXU2OES4rDXKLB815L77aBRHpRwbs/
         7mvpEmTT7o5dwZnf1L5x91RnZPIbku7Jj3F7/23NC92iY7yuaS5a0dLbyoBHnNla/Z0Q
         9SHGHTnSMa8F47k622dm009aWzRr9zG7kZJBEse5453x+RB8cLeUItH2slIWlOk5GXZS
         kU2At/COFg0z10+bsG9/9AtTlkk+uu5Jtp0m7yImkbqPQTwvR+9wdo/bwznucF3o9Jcy
         hp+Twg3Au1wAz5RvZLzjMpKiwSmN124D7lKoqs+D2jAA+Ab2X+sv4Z+ozZ+mQ8C2X1Sw
         kQWA==
X-Forwarded-Encrypted: i=1; AHgh+RrVmd9MePWj5YD8QIajWdvjcTHDS5gqMrDLEVLAG+amL7LlqfdTz7VlLi9pmX73WRAkqo0kPTPT3Yll@lists.linux.dev
X-Gm-Message-State: AOJu0YzXOYNbsE+b2sQkBiXrmXJRscr5V0/byNjoPzhv57jotXcLfgY5
	Q5Dk76lVlFd6OZOImmExzEOp8TK641gOI94s9HSZpG/N4Ela5flRXadZ6QzsnZ3ixwiUxQmhdew
	AFO7WHw==
X-Received: from pfbcz9.prod.google.com ([2002:aa7:9309:0:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4648:b0:842:63f5:d097
 with SMTP id d2e1a72fcca58-84f41ba51c5mr11209793b3a.3.1786059399712; Thu, 06
 Aug 2026 16:36:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:30 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-14-seanjc@google.com>
Subject: [PATCH v6 13/51] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index dc71a6fdd461..3818f6ae0629 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -40,6 +40,7 @@ static void __init acrn_init_platform(void)
 	if (acrn_tsc_khz_cpuid) {
 		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 }
 
-- 
2.55.0.679.g6767b8d81c-goog

