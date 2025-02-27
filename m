Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA41ABEC1
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622748; cv=none; b=cQaVzq1xUaaOE6WESHQh4TOEKJEeOgO6wpv0FM0uNEfaP2CVOzk2CVwItz1Qn5Y/f4BEyE460l3Wqr9EYi5bkgpEJCqhMzC4Yg2wvQuRlhVXzXMEBF0Ar9B1W+XD80vvNtvTPKgfdRG0qf55MEcjYGU+34NnBnwheSDeE4Mb3Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622748; c=relaxed/simple;
	bh=YIm02xTVNm0eSDO98sEQL1tUrXbpItcdQ7Va1EiMjyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DwxtEbd2vws+ayPNfscGegw4gwa6MaVwroSYcRL7DxT7d8wFAmU7sdJOcmfyrn7A65yRLTmnZsqT9bGW5jpqJIFH1JbUYpy/JiALZ33wEzvqH7yaywk9g83TnqUpk6/pX1AlI0Rtt2hhroMuEkqeeN2fWJ1+oYy3AtmUx8q9teA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+CcrUeG; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+CcrUeG"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fc4dc34291so1060408a91.3
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622746; x=1741227546; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwfv1w4tsOCmi3NCgULhIMD4IZcsOFfau2ULDYaMRLg=;
        b=g+CcrUeGgHuYEFvGh28bnO2BNyctTvD/HG2syWk0cFuRgSE7yVI4TWtmfrwM6aVmjh
         xpWdWm0PGCvR1YjCZz3BaOE1K6oEYq6BEgS8emN0tVQYZxScYXWNBFI+B8zFxwFfAsEd
         K39ENNb6PFBOCsInVqfqPAB2ORl+CDB/XKUjISwWy0lxrErXT7cPEw6zK/x/4sK3H/nY
         2IOw4r8WEoKqGEt3UnqS2VtzUKjG903ulOlLz8yLZji6Q8dWMBYBaEbnC3LSXwNND3nu
         XhwM8LtSZTCS2DJ6jx50jYmmJzVNJ26D5Gj0HW9iBJAH+ncbzxAMZy7QFfO82IxRY02z
         fp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622746; x=1741227546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwfv1w4tsOCmi3NCgULhIMD4IZcsOFfau2ULDYaMRLg=;
        b=YEpBLI9bFlNsb1oaSApsE8DZC2SzVPx5tNRIMI4F1i4stCMj/H5v3wSZI0TqTyCcrX
         flpPaWECGJJXbndUTefLi3YF/NkuHL0dA4w7wGWGdKzK5/7kmd/iV7Zs+6ngYrm/8B5P
         0zm5lx9X5tZ7BUnZXYwZgMAhm+2JtXfW04AFnTIZ26IO1tOeOIEphCo+/UtybvJAAlh7
         aXy55Warjm8QDKA5P3mK0qKtOw7yKdXU3f1XC3Vrk+geNNksXfKkJSuHiad8NMi9SyeI
         bmFG7/hQpxrdveenEeqENOfyTTX/X2IxdWz3jwdTFF9Yqgwf+WVqH7+Ox9t6WVg8uv7z
         +pyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxJpRzU3qlO1/BpdauMv7aYWfNjJIHSJF2eS4oP/QbW2YMm4gt736aVFnJAi5qPc00Uf8rz8uNXObf@lists.linux.dev
X-Gm-Message-State: AOJu0YyuMszT0r7uhz4qrazce+fKTRt+aBHAeZYD3VdyJBDqxKR9qOob
	YNA4Exex2mJiJltUztqsXtnRkZvpeOcDZRP6rtoWloc5WBtX8SbCWVaXvsx7bI6KOUmYAs4VWfr
	ioQ==
X-Google-Smtp-Source: AGHT+IH6wZ/mGewjHTQw2W+siQpDLDG/G2QvagXg40e21ebxNRSjKEBR8DQxe4UjV6eqsE0kkd3QFpygjvI=
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:2fc:15bf:92f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d83:b0:2fc:3264:3666
 with SMTP id 98e67ed59e1d1-2fce7b221c3mr36215820a91.30.1740622746375; Wed, 26
 Feb 2025 18:19:06 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:18 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-3-seanjc@google.com>
Subject: [PATCH v2 02/38] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with kvmclock, as (a) CPUID.0x16 may be enumerated alongside
kvmclock, and (b) KVM generally doesn't restrict CPUID based on vendor.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 37 +++++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index a4d84f721775..c3a14df46327 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -36,6 +36,7 @@ struct cpuid_tsc_info {
 };
 extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
 extern int cpuid_get_tsc_freq(struct cpuid_tsc_info *info);
+extern int cpuid_get_cpu_freq(unsigned int *cpu_khz);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 93713eb81f52..bb4619148161 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -688,6 +688,24 @@ int cpuid_get_tsc_freq(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+int cpuid_get_cpu_freq(unsigned int *cpu_khz)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	*cpu_khz = 0;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return -ENOENT;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	if (!eax_base_mhz)
+		return -ENOENT;
+
+	*cpu_khz = eax_base_mhz * 1000;
+	return 0;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -723,13 +741,8 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 *
-			info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz && !cpuid_get_cpu_freq(&cpu_khz))
+		info.crystal_khz = cpu_khz * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -756,19 +769,15 @@ unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
+	unsigned int cpu_khz;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+	if (cpuid_get_cpu_freq(&cpu_khz))
 		return 0;
 
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return cpu_khz;
 }
 
 /*
-- 
2.48.1.711.g2feabab25a-goog

