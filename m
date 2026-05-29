Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA523FE37A
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065916; cv=none; b=g7DN6eHNpaHIMg2hMqqdnN1YZ9NeCwkPOMjYszA8cGQgAR6zKNOkzLQs+ZFuyFvvNwnuK0b/AvKbPL+4JDamfzOG3K+r2PgnzmceIYVNqkxe6OUTh2+THp9CUt85lEhKxfr4DkoSY3CETrdgo5Y32nPqjaWyi3Xbu/meVV0PbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065916; c=relaxed/simple;
	bh=UUytjfT9SVOtFZ9usAuTuI+mwQ/wQQjELPCBSRuUOk4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GApwJLijxsBAw2xiOdiW0x25QqHp5lhw7Fb9KfH6CoWZAV+Yz+P7JeG32BehkD4OauVOHLRTzEmpaCpjzKnFRIVgbD4LVpmIqGgcXjPT855RL1LTKEUZmNczXHDK3zxVhB6ChTpsJSV2BJZidm/062M1tBKI3sKLTFF8sBIX/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwPFmzAj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwPFmzAj"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bc763c7256so290876455ad.3
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065914; x=1780670714; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xkng2ObvqyeOAHFFD1k5jEREhKyPX3M1bjFdIhQCaZo=;
        b=TwPFmzAjT1sqs+5Bqv4wHTT4aZdwms4ix1o+dfOTxqCDE9Ey8gWRDOdxPhSmz9Eikf
         b579Aut684RjUcIwS/jFt7JW+ciC7RIj4aCExzgQgBWth6Ln4MTgmp5ryMB9GkZbVFrD
         fuvM2CT93HRPElzwEiNfhBKjmPQVLPoSU2fw06NdSPpM88++37c4Lt0q8+JL3xj8hLUI
         ATa68eU+VwHi0IRh80nViRnpFOUa8ykcpH9W5U7rYjTpHgbTm5ZI52MscJY+lDmL37GD
         2Wwz3j8rxO9tGIITMLb67NNuqyyXuEk3y5pOxxi7LRa8H0pTZPxSXGEeCA1VAcdofsxa
         6j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065914; x=1780670714;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xkng2ObvqyeOAHFFD1k5jEREhKyPX3M1bjFdIhQCaZo=;
        b=QdgK72ViEeAYUgutBCbUA2LEOoRx4tLc0JINkulnRPa481u7v7XZG7Vinz+LslDuQ8
         ED+Kr9GPHdhtzvoCvSqr2G5YlFOnyVIYFw8marHPIVRoZxBTZ5GszewmDSjqSw9jhVqr
         rI4e/6XS3EJ8+bmoPL1IDa7yWvnFj81JLpIRYMXa1tCJXmINM7mWRUf56MfvwmKJYUa5
         ZHnQaj1j5+H5F78k77We1syUklNaWvyX/vy2Jfwa+4GGBIohO2ermmFtVXfCT8QMzfLt
         xPMnCgqcJo4IBSRyLGXDrwBgsKTAx1rY5kWftzJbw5aEhnG5ZuxFevZOCYv9noGLND5I
         RVug==
X-Forwarded-Encrypted: i=1; AFNElJ/YQK6K06A6Z25VANw71Um2CZJYFc8kTJL2JfZ3twnxNZMbgZkSVyjWQRYPHH1o2q/2YVWHXRmooBCi@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0npUMR5xSGKhhDRR6depYddR5RrhR0d8oROfqgQL08s5YdPAE
	ZrAbt3945sE2/r6PzCkYxtuFZQpuC70K1sNd7akhNwpH0eixmedvPmw+WoYVdvCWpbIl7ljZqL4
	hN0wrXQ==
X-Received: from plhl2.prod.google.com ([2002:a17:903:1202:b0:2b0:5b0d:f4db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1508:b0:2bc:b141:8551
 with SMTP id d9443c01a7336-2bf36833ef4mr1185145ad.19.1780065913278; Fri, 29
 May 2026 07:45:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:05 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-19-seanjc@google.com>
Subject: [PATCH v4 18/47] x86/kvm: Get local APIC bus frequency from PV CPUID
 Timing Info
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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

When running as a KVM guest with PV timing info provided by the host,
stuff the APIC timer period/frequency with the local APIC bus frequency
reported in CPUID.0x40000010.EBX instead of trying to calibrate/guess the
frequency.

Note, the unit of measurement for lapic_timer_period is "ticks per HZ", not
Khz.

See Documentation/virt/kvm/x86/cpuid.rst for details.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 4fe9c69bf40b..c1139182121d 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -977,6 +977,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo = (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
+	u32 apic_khz __maybe_unused;
 	u32 timing_info_leaf;
 	bool tsc_is_reliable;
 
@@ -1039,6 +1040,13 @@ static void __init kvm_init_platform(void)
 			x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
 			x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
 		}
+
+#ifdef CONFIG_X86_LOCAL_APIC
+		/* The leaf also includes the local APIC bus/timer frequency.*/
+		apic_khz = cpuid_ebx(timing_info_leaf);
+		if (apic_khz)
+	               lapic_timer_period = apic_khz * 1000 / HZ;
+#endif
 	}
 
         /*
-- 
2.54.0.823.g6e5bcc1fc9-goog

