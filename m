Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D3B2417F5
	for <linux-coco@lists.linux.dev>; Thu, 27 Feb 2025 02:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622809; cv=none; b=iAygBmTTphniPJkzy47w1AZVzeT1++KSpYfOsvYpWCbg73xMbrH5ElJyWT5Fh+UH/7BWB2iEAPrCQjJ/Ef1fXYWBlbFiB6JoiJLFj75PLDVIzrAY3WNH5ljBrXMBnm3EKW+8zRW1lx3tIQGi5xyHASyfSa0HrNnJb7tqZ1HMLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622809; c=relaxed/simple;
	bh=8tMxUjf29DV5ZoAnNO0UTJZHJbBzjdRYlL7FtigAdUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iMvscfmeYqfTaAR58b4FHZevE343kOfzYijFJZpoSVICgsOrMU19evH/f2HO+YTJBFeDyqpfyT8DB+8eAyeb+U5qUFM6KcZlhADxrov4R/JHrWt/+CBZaFCtFcYSmPVkHIU0/bsMTnVqP6yANTyCiF6FpjwgTn3K4jkjZnXv0Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ozNxDHvJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ozNxDHvJ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fc0bc05c00so1509761a91.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Feb 2025 18:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622807; x=1741227607; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KI0queLIxZnghHgRHs7xWlDt+M3CNsR2JqWjVaFF+mE=;
        b=ozNxDHvJzJeCsEC4CakyVGBOCymCpmnOXfXmopkgk44GSbD6KIDv6v7XqHBbLhtY3X
         JiS9A7YZ3ofmQCNX/D51Z+6ci9mGod9ZxG8s57k4dwCS98idMU6p11Gmn0BEFFV5ZYUS
         J59Ehs4lTanhdXVTw1SwEtwvkp0qdfD7iOmhNLCTp/RX/NPZ8+EPdiFY67W3NGMJKshu
         fjuclFmE2h+TXOegvN6BcCHuwrOxYf3x4k/VfOuJ0h9JblCf84cTHS/FvMXazR52efj6
         FsF+OR99HwPXEUCVB2oONTlbLCID65g7EcvG4wdluibA/5CWUcDkm+6tEndaQHZrq8wc
         TjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622807; x=1741227607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI0queLIxZnghHgRHs7xWlDt+M3CNsR2JqWjVaFF+mE=;
        b=hi8X5UedtTIhlrmCFwJnH5c2IGIW44ayrTumSp4GLwVKSJIWZaWm6WEuS3Ppx8MDCU
         ajAd50/mN+11z/KrMFiHwhYHptVJxiw1ZQkLue2RgE1PpKCnpoUhxo6OZ8+qFPtLXS82
         gGPtyyBk3Efd5gEU8besMU2LreCKI6/Ss3l+WHSZlRylvYQjQW8Yt4grS10auDAMHpcN
         YQHv4If5JK0hlWVb7CilgEl6ZmTHsdAK2XMfpKokKtdvFOF6ughy03nj8ixu4Htv9mDZ
         ZwhMjlOQIYLEUdv+XEFs183yJwm6xm1xvKs+2iDtM85sReej06gahH8NYC0Du9vZFSdU
         y+0w==
X-Forwarded-Encrypted: i=1; AJvYcCVFMbj4EnqADvUUZy4A3iuifp76hXrOIBs6vdZBIB7G82/t+qI35xAeQi2obFB03wRVArwu+ffjqu+9@lists.linux.dev
X-Gm-Message-State: AOJu0YxA1y0Bd4s4OS86tIZ7PgNJpAawO9d4BsGph+1s9z6KF95A5lxg
	jWiww0rEvFYtLI2ajynkmTbeSLzadYjKAqx/axV/uBCe8sErPyNWDKBIXw5DOZupxrlbQP41itG
	AOg==
X-Google-Smtp-Source: AGHT+IFuRPRb2/rR+n2YIE9T1JgT09dE9pwcHYDYXuVdPUREy4VCpJNwziBTuQzC841m2IS5b8M/SH3vvo0=
X-Received: from pjbsf13.prod.google.com ([2002:a17:90b:51cd:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d50:b0:2ee:9b2c:3253
 with SMTP id 98e67ed59e1d1-2fe692c6c47mr14798005a91.30.1740622807422; Wed, 26
 Feb 2025 18:20:07 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:53 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-38-seanjc@google.com>
Subject: [PATCH v2 37/38] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
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

Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
nonstop, and not marked unstable via command line.  I.e. use the same
criteria as tweaking the clocksource rating so that TSC is preferred over
kvmclock.  Per the below comment from native_sched_clock(), sched_clock
is more tolerant of slop than clocksource; using TSC for clocksource but
not sched_clock makes little to no sense, especially now that KVM CoCo
guests with a trusted TSC use TSC, not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for nearly two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 80d9c86e0671..280bb964f30a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -431,22 +431,22 @@ void __init kvmclock_init(void)
 	}
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If the TSC counts at a constant frequency across P/T states, counts
+	 * in deep C-states, and the TSC hasn't been marked unstable, prefer
+	 * the TSC over kvmclock for sched_clock and drop kvmclock's rating so
+	 * that TSC is chosen as the clocksource.  Note, the TSC unstable check
+	 * exists purely to honor the TSC being marked unstable via command
+	 * line, any runtime detection of an unstable will happen after this.
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
 	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
 		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	} else {
+		kvm_sched_clock_init(stable);
 	}
 
-	kvm_sched_clock_init(stable);
-
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
-- 
2.48.1.711.g2feabab25a-goog

