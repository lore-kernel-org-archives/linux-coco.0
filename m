Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B9407CF8
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067315; cv=none; b=IQfRK/kG6STpo6x6Exnj7ncXsy8Ez/aQ5P9TRp+ZwbKE9t9IkSOtJdSgQXEFMDKEvsoTwcv1cjcX+/h3buc+MnjrEsbCwzPRk0E1tKhoeBMtoBDl+hmM3zFqq0E7P6oF+pU+neW2BvRbsaIyCwM/SnT9mJe8wjr5fS6GYHXZ4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067315; c=relaxed/simple;
	bh=4EM21BPya+I+Yh2sqhdfbU6L/IzTuUdE/Zaa6ZzwnUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kdDP2NKojKpjD2jJcxMx6QqKGZhPOLLUSz8yG4oA0F3YvwtUWXMLHzshwomqhRyRthgptZhAqxv9ZiPTFqu/RRvJcCxUuHm0eVr0YMi1PrQfxpElKG5XwWiK9pSzDWoZO0ocnfMkoem16mwWBSHKi7PV1W7QPHhe8x7XzVHmfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mmfFvx3W; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mmfFvx3W"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2babbeff9e4so156693475ad.0
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067313; x=1780672113; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UfrlcsEyKDSqAVUZDFPjPbjb9qd7cdvAZhMFheCkbts=;
        b=mmfFvx3W3DhBAgRTWHbsV/CBvOdds2m+dHzeFNebyRIoaF9/5d+OAoLcktA/M765nj
         mSzJ8eU3oYW/2jCeyRZpdMlzL9I1Y4Px5v5YKPX52EGU417aoUZuBKcHxDOL8gpiP5kC
         zKccFWqKrzXocar0+TUnlPBmRowZE1c2cIyMTrV0aoPqGtK1NFEQ7IelaqpkFsDSdZOZ
         /9KUEYh78NdTq6YIoUdxu/sAOlDQ2k5ycm3n5vO7LxqL9cr1WtSkEY873dFMLxh/ugUV
         seaordQ+/qErxSONf0IJwAdKm0HoU6NFMI1N72WpTeGuzxb2TUdSUs4DCVGQM3YV2doH
         1wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067313; x=1780672113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfrlcsEyKDSqAVUZDFPjPbjb9qd7cdvAZhMFheCkbts=;
        b=CKALSq7MxnRYGjWvxbUntS3mNNZGpliiWnUFdicPVov4lMWzqxQJd5MeT1r7DWoG/Q
         91D3ZSy/JKSY8rA0uVKmyf1BgW2yU0hg68n4oWkYnAjAWC2+KcLvHEU+Qist69nZY5Lt
         1+ERwZa5Lg+wcvKH8yhF0n+r6xJkNSKPL58GL3Es2zxJ+Q8HEIGgnMUc44Rxd645180a
         xmUD7oSP+oH/rAWK5eHxCtmfIfsvU/wgMh5HuiB57xtFdQi+EF7VLJdfmFy1G2f0OOCU
         V1LOvVNAqHr23QF8O/K4r1gv94AnhU+/FyO+BRHguj2sZeNx6euqOBt1V3kHrGtk56Os
         Ml5g==
X-Forwarded-Encrypted: i=1; AFNElJ+elrgENHFDem7jP6jSNrQroxFv0hF/52XcgmceAh5JF17qAXHJx3X4JF9L5ToDVn3pZJ6hn9EJ8x8p@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8XtsSVj6NflHc6bgzw9XepffiavrYM4VgGy438Z3TmtG0o0A7
	nUng4iB8QoeNZrJfyJmJI38MProYHR5yy2XXqGwKZM44EUWx9utQO9eaq8SgG+LvDDH0+NWDzWK
	hO9uskg==
X-Received: from plpp10.prod.google.com ([2002:a17:902:c70a:b0:2bd:56ce:d8ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc85:b0:2bc:ac76:c1d0
 with SMTP id d9443c01a7336-2bf20de3033mr36747075ad.17.1780067312791; Fri, 29
 May 2026 08:08:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:30 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150830.715007-1-seanjc@google.com>
Subject: [PATCH v4 45/47] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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
broken for over two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 1336c24f59cf..cd65ad328637 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -374,7 +374,6 @@ void __init kvmclock_init(bool prefer_tsc)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
@@ -394,6 +393,8 @@ void __init kvmclock_init(bool prefer_tsc)
 	 */
 	if (prefer_tsc)
 		kvm_clock.rating = 299;
+	else
+		kvm_sched_clock_init(stable);
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.54.0.823.g6e5bcc1fc9-goog

