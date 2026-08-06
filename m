Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75A4931F0
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059450; cv=none; b=CEZS+AEQ3ctK3kqTTRDGiZR+DDjDNzthvsvISfMJ9864boR7st3g4RahPt/k5z3HmFnq66xCKEZ7Eaylv+ScmwlkqY+ZqG84psKcVAoxmOn1nJecGsY7QJEgu4iGZvGhDrerlUR9SMHUZC0MMOsB6it9kb7kQwyerQkQQaTuWxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059450; c=relaxed/simple;
	bh=UjpjKwl+lBUDjSIYpCNArAdlu1FqZC9gy6u6ndRSMj4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nONGoogEeOMbi7/a51IHJOlDkoujI5832c7NqL5CT0miXvJ7Y1ItmSqvIuLJST1RWlRyrAeCRktV8Wj8LN3p4uqnreUckpFmKrD6rL1u6LjGrKuB4X157bo11YWu0GNe7BX2UZN4ZBQbQ5WoV1k049Eo9fw2fUF4AS4PuolEcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sdadce8L; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sdadce8L"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc6dd43737so50917205ad.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059447; x=1786664247; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WG6tzs8/D5vUVAMD7J6BXfy7SNaM+XPXtfc+RTelhM8=;
        b=Sdadce8L1Uey/RrE80FFKRg9hf2Q+r1JpMEB3n/LUm/5DkGJh7+TKrd+DJ71IlNty4
         i4csEalG53wgVJnsEFc1i3Kju3TvSYIEKkmwf4FkmBj+TeeyO/bmjQED9RsV2vpIt9AH
         +4iHYMM5dQMH0NO4/ZePXyZ3mtz9WUBJPMFTnZ2WvKkrzml58+dn9ihZaFZDguKoLJDo
         OyV0f4RQEzJbBjQe7SlDGHDWwADB7KOQmoVvJeb0lWPo6zxXyH7uaWt7vRuzuHyryjse
         nNFwrSaKUPyzcROCfLyPdyNGqvUZKn8U3NFHIrOLUmOyovVcWPGUm16Ybh0sF86Av4PI
         UgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059447; x=1786664247;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG6tzs8/D5vUVAMD7J6BXfy7SNaM+XPXtfc+RTelhM8=;
        b=XLdPdaYHDNdfOW6MNltO+4Twc3gin5AGIO39236jVW0h2izQna96N4AiLLxzc9Xdvn
         cSANUs/OfPJdw40sIikLRP/vjlvx/11iSQFc6wUJdIvnGhgaYADIOFNLc5dq3abxpO9a
         FiVwZE0kFjgWPqx/abJqjg7QRbRtvRAKMZx0etjTqCUP8FRc8J67JXrc9XHNKd8zX41o
         plixmD6bpjg9zlXiabTxXvw1jTL1l/T71zo61vGiYJbsmk5NqdOIUWDpMYWjs4nKW7lD
         m1JvxC0pZchGf0eRh4IGNN2x4jUHkIWNhVIJNhIEjnCwE2ZPthiZ6q1jPGVXa+KxEukP
         W9wg==
X-Forwarded-Encrypted: i=1; AHgh+RoDDOUFSTeV2EbhL0FWczhpRXJMqYS/ejSS22VIbGI646G2Mgx+pfH4ZeYpXaeDaVQtaHMjyfzz6ADR@lists.linux.dev
X-Gm-Message-State: AOJu0YxPevLcAr8lAasqWGVNaWbJbaxZ7Hit3bGmUc6h/5AvB/p73P7z
	uGd6sFaUNjMwjobpU3rOs3TjaeDAUvhxQ2uKXcAA3dmHyf9kVEXoPQAkjdIMyz+zbjMuTcgPnOA
	pUdFaZA==
X-Received: from pjgg14.prod.google.com ([2002:a17:90b:57ce:b0:380:f969:825e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2590:b0:38f:2168:b9cb
 with SMTP id 98e67ed59e1d1-3903c572a05mr18788898a91.9.1786059447175; Thu, 06
 Aug 2026 16:37:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:08 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-52-seanjc@google.com>
Subject: [PATCH v6 51/51] x86/kvm: Get local APIC bus frequency from PV CPUID
 Timing Info
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

When running as a KVM guest with PV timing info provided by the host,
stuff the APIC timer period/frequency with the local APIC bus frequency
reported in CPUID.0x40000010.EBX instead of trying to calibrate/guess the
frequency.

See Documentation/virt/kvm/x86/cpuid.rst for details.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b954238b09fc..edeff41c03c2 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -992,7 +992,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo = (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
-	u32 timing_info_leaf;
+	u32 timing_info_leaf, apic_khz;
 	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
@@ -1054,6 +1054,11 @@ static void __init kvm_init_platform(void)
 			x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
 			x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
 		}
+
+		/* The leaf also includes the local APIC bus/timer frequency.*/
+		apic_khz = cpuid_ebx(timing_info_leaf);
+		if (apic_khz)
+			apic_set_timer_frequency_khz(apic_khz, "KVM hypervisor");
 	}
 
 	/*
-- 
2.55.0.679.g6767b8d81c-goog

