Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A804DD6E5
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934372; cv=none; b=iDugvOZ6Sds/M149RoImRK7t4M8ZaTOwaN3o5nGpevOfZ45Yd9fsZV7MTqWO7z+3zncNhmushnIDpkmYuRWeiw++iYunYZ+z6YdZ92zsQFHalZo8sdFMKtgnPiLzvjd4av2ouGtApfX7EvySTa6UYS56ayMQniq6sDZEmcNX8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934372; c=relaxed/simple;
	bh=BNbYGSH55jffEq4VtE+b969iyJXTMV1HTMSCzkA3sgE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=puR3zsDN+dgEccu0vQ/a/vMoqtuUgpCON2zWw4K9yMYtoveLo0iostY/d1bnGSU/loHe9g45VgUs/rLeDQNHte1CQ4fdYjjVjcMfsZsa5r+87ZW7seTK9wfK7t7s4rEXlR3Gl5ypF9PKlXeu/wUNqiO+1X4rvsLHfJAmfm+Oc54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KvuztkGz; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KvuztkGz"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c9667280edeso636936a12.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934369; x=1783539169; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hl8ESM1aN3u3Me6yWngcHpVlzQnDyaS4TqcnFx8YJ8=;
        b=KvuztkGz9srb5fgcqCmgpBTVR2/Kiz8rp/Xp2o4djKHDSGCouvQT8nJsmsp0LhNiVS
         3lXaA+4+NdRyx/il+/LUsd58oNFBgfO/ugmrnxfj8gwhJOyRNQP99rlNnXNnEQ2Vzt3b
         wcvKvRlwlteykdFDfYyajR48aWimCQyttQeQk6gFd0+OGrT1kOmcmon06TdzxXJM/3in
         1DlW3/d2KPoSsxrzHbhxchRm2fys8HEwhdgZGSXZyAQeCzBdjfBMONUfge/D+RDP39eG
         4EkRENxVSIvE+5Jhe1eoDoirHe/bK4aw1dLB3q+rI3fX17ImoiFOz4xOb8WRveo2MwzP
         zltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934369; x=1783539169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hl8ESM1aN3u3Me6yWngcHpVlzQnDyaS4TqcnFx8YJ8=;
        b=IKrdLneGzIb2HE/568YPjJDCRpoUpFmxax4u7YqYRcct4lMJdmNDI9XIkFEuD6Zmwn
         SDLqJhHKKv8b12Hqd7rnwYOgl4wIqILwjGRtt26S/ORl9015Hq3Khx89JjE1KoXPorGf
         VgiefsBFIN7DuQbdpYRYZaaObcqTH/14+Gtabk7TRPrRGqe2sFstZYwDjL79mfYRup6B
         QPCF9xzSGrsda53QoIsYOq/OIJSJA4UiI3Aa4QvYQDLYOu2ZLXTBJXgaXhYi8f7PIMQd
         BjT7XEpvPBLz+OnBH1/cIAMD+9gvsHICOkOXqscNRdqlSSwRESiguYxsc6Th8EUkl9bu
         CA9w==
X-Forwarded-Encrypted: i=1; AHgh+RpOAgksm2GXsWzOx5PEuKLdGmi5co6KZOnmvkO0nglBv3+BexT8ybwtzmjBrGa9IQArhJmNmODOUx25@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5SNzvp8L07poCe/KTS5GPfYhj7TMm2RqPF30eNbetKO+/cV8C
	Et5nmF3e3fHZBO1ZYSRK8RrmqsUZsaVD7pG2rs1lo9tfS22fhywbFumoIaWRjmgLDkANfIonpdC
	/dtY11A==
X-Received: from plrx15.prod.google.com ([2002:a17:902:b40f:b0:2c0:bd65:1a98])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:18e:b0:2c9:e86e:a9f5
 with SMTP id d9443c01a7336-2ca7e73cbd7mr31240015ad.18.1782934369266; Wed, 01
 Jul 2026 12:32:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:40 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-20-seanjc@google.com>
Subject: [PATCH v5 19/51] x86/kvmclock: Drop dead check on TSC being unstable
 during kvmclock_init()
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

As pointed out by Sashiko[*], kvmclock_init() runs before __setup() and
thus before notsc_setup() or tsc_setup() can mark the TSC unstable.
kvmclock_init() also runs well before tsc_init(), and even before
tsc_early_init().  Simply delete the check, as it's been dead code since
it was introduced.

Note, odds are good the check_tsc_unstable() call was copied from Xen's
xen_time_init()+xen_tsc_safe_clocksource() logic (as so much of KVM's PV
code was).  However, xen_time_init() runs via x86_init.timers.timer_init(),
which is invoke from x86_late_time_init(), and thus after params have been
parsed.

Alternatively, kvmclock could register itself later on, or tsc_setup()
could be parsed as an early param.  Given that there's zero evidence there
was any meaningful intent or need to actually check for an unstable TSC,
go with the simplest option.

Fixes: 7539b174aef4 ("x86: kvmguest: use TSC clocksource if invariant TSC is exposed")
Link: https://lore.kernel.org/all/20260529181213.0B27A1F00893@smtp.kernel.org [*]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 061a22d31dea..29ca37e9a3bc 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -362,8 +362,7 @@ void __init kvmclock_init(void)
 	 *
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
+	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
 		kvm_clock.rating = 299;
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
-- 
2.55.0.rc0.799.gd6f94ed593-goog

