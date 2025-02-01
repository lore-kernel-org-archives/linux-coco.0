Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EE922F19
	for <linux-coco@lists.linux.dev>; Sat,  1 Feb 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376251; cv=none; b=Guv7rq5W/J1MavtH23NTvemOLyI6d+f+7QawRCr+DoWN5KbHrO2PL2zKuXgvlUe2Uu5kIZX2T1LhoFty53UlHHxCjYPLqd6KLMG6VxQ0EVwUpR+fRx6jYDIVtFMPld5KStvTpAC0WMN1xp+lTpBN4QsMhL3dQGZBPecuNFb8njM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376251; c=relaxed/simple;
	bh=bqOChW42KkISzQ0ttdKpX0A7QPv+hN2zNVexU8vjJYE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgPD+S+IZXcCqbrq0+n9mw4A9CaeRKIfYFdP4R/DebFqHNFeh2royyxqKRleqw7g48EFzalcIox3NkzaB4iZrdr3MLg4u9hJC6y499f/7DeZTjaJIYaz44HcJYVlHvz273T7aKD1c5HvDHDlyWuKj6MlKzRSlBgNCkteUV0TbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OVhlG6ob; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OVhlG6ob"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so4914043a91.0
        for <linux-coco@lists.linux.dev>; Fri, 31 Jan 2025 18:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376249; x=1738981049; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3q3VtWChJd6qluhOhoVrZUOxKE25zEDROrS3h+FyOz0=;
        b=OVhlG6oby3CNpVNsG/O+EKw80JJAjZoNnlM8eHWHhxyQE+TV7jEh1V4eB4JjASnoNZ
         DV8OxnjTBAYKIjxXnyTBkI9rHWcRI7Xr1XmGD9TIkts+tkAsu0qVfTduTc0zYDAwZbrY
         yZda0r24gR99WrLY0XBXtcyNWzmsJ5xjrGRChvRg0EtfWC4Luv2B3pxR7eIffEZb/ODN
         CZ9VpfJEzBAYrY0utTZOingB6aGaxq+Z7/Fl7sAKh/1igiQdc31F+JHEWuxZdnK/kHi5
         cVOqKV7mu//XvNYWyJiePMAdJxolbLheJ7CmFZf+9/MckX7ogOBgKDEgpyAW6mil0NW4
         Mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376249; x=1738981049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q3VtWChJd6qluhOhoVrZUOxKE25zEDROrS3h+FyOz0=;
        b=nI555ZW8hw7wtLfn18jeiMxqg6RFQKDeDcZjYkwaRlWToZcp7ZyXKTdhKE5lXRv340
         TewY8pXqSEvzWlVfWasNuCwuegjObPmaquJhETKRFykLGA3krwHWA9GFlxpC6gzeC7sB
         aObOmDuYL0gzCVcnco5Q4vQg3OFOXeNMTsKHKCyYBYQ3tq3Ag2SJaTy8/B0JxMvigWrZ
         3CAD6JrT8CdLAAo4Cd9u6V+QaD8DHUyykCukWe4h0fRTAAcwwFupt+TsuLATPT83vfwL
         COzpvV8TmHv+5Qr3TL5KTsxCaNoSMetdRwhq/SHprxqHNP30/PLXnQvdhgvfiNs5sJnu
         ID5w==
X-Forwarded-Encrypted: i=1; AJvYcCWDbiSWnOX2xxO986VZMiOgZPiufA6Vs64xr6CN5gOoSQVkmB6J/vhujsxyHvwHpHSUQxbSviVN9xRh@lists.linux.dev
X-Gm-Message-State: AOJu0YzWEsKJvoCAq00WsX0ktx8rFUvmpefCMcCnXa6/NL1CThizaAM2
	9j983j78yrKV6k6oT2u4ukSoMf7XJI1tsnTRCh6YYWi+QFk6UAXp1iPqIngp0ZXl7V7U6VurFnE
	nWA==
X-Google-Smtp-Source: AGHT+IGlJL+gh3dhTIPqGXIyfYqBO171NEVUqAKwIwg+mryw0iUEaDc1VWsrQ1YFiTTJEYVX1rRFTepD4XE=
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:2e9:5043:f55b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc46:b0:2ee:af31:a7b3
 with SMTP id 98e67ed59e1d1-2f83ab8c3edmr21370350a91.7.1738376249247; Fri, 31
 Jan 2025 18:17:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:03 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-2-seanjc@google.com>
Subject: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC info
 from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Extract retrieval of TSC frequency information from CPUID into standalone
helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
a version that includes the multiplier math as TDX in particular does NOT
want to use native_calibrate_tsc()'s fallback logic that derives the TSC
frequency based on CPUID.0x16 when the core crystal frequency isn't known.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/tsc.c      | 14 ++-----------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 94408a784c8e..14a81a66b37c 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
 }
 #define get_cycles get_cycles
 
+static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
+				     unsigned int *denominator,
+				     unsigned int *numerator)
+{
+	unsigned int ecx_hz, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+		return -ENOENT;
+
+	*crystal_khz = *denominator = *numerator = ecx_hz = edx = 0;
+
+	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
+	cpuid(CPUID_LEAF_TSC, denominator, numerator, &ecx_hz, &edx);
+
+	if (!*denominator || !*numerator)
+		return -ENOENT;
+
+	/*
+	 * Note, some CPUs provide the multiplier information, but not the core
+	 * crystal frequency.  The multiplier information is still useful for
+	 * such CPUs, as the crystal frequency can be gleaned from CPUID.0x16.
+	 */
+	*crystal_khz = ecx_hz / 1000;
+	return 0;
+}
+
+static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
+				     unsigned int *crystal_khz)
+{
+	unsigned int denominator, numerator;
+
+	if (cpuid_get_tsc_info(tsc_khz, &denominator, &numerator))
+		return -ENOENT;
+
+	if (!*crystal_khz)
+		return -ENOENT;
+
+	*tsc_khz = *crystal_khz * numerator / denominator;
+	return 0;
+}
+
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 34dec0b72ea8..e3faa2b36910 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -661,25 +661,15 @@ static unsigned long quick_pit_calibrate(void)
  */
 unsigned long native_calibrate_tsc(void)
 {
-	unsigned int eax_denominator, ebx_numerator, ecx_hz, edx;
+	unsigned int eax_denominator, ebx_numerator;
 	unsigned int crystal_khz;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+	if (cpuid_get_tsc_info(&crystal_khz, &eax_denominator, &ebx_numerator))
 		return 0;
 
-	eax_denominator = ebx_numerator = ecx_hz = edx = 0;
-
-	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
-	cpuid(CPUID_LEAF_TSC, &eax_denominator, &ebx_numerator, &ecx_hz, &edx);
-
-	if (ebx_numerator == 0 || eax_denominator == 0)
-		return 0;
-
-	crystal_khz = ecx_hz / 1000;
-
 	/*
 	 * Denverton SoCs don't report crystal clock, and also don't support
 	 * CPUID_LEAF_FREQ for the calculation below, so hardcode the 25MHz
-- 
2.48.1.362.g079036d154-goog

