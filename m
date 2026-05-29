Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D33FE675
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067300; cv=none; b=feptRIw+lS4OZNaNrAW0zQ+pFq8slUUS5PYD/Zf5Hzp+WedmvE295b11UzmeQmUbY1+p72jrSeRfZdZO/2l48O9g21UlOQjZ8MRV2tFhhmHwJm/+31c8cxtuCd9Fww9AAToJ2Er/9NVmplVr+W9MCokdb3hmIZCOaZWaEawA+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067300; c=relaxed/simple;
	bh=cK9bQGlpdv9LZcFmZsWC/IHJdDiSPttcr7RlDSILQVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZtAzjwbHrmpW9v6WlM9GCdarnTnU/HenUqTXRBB1SgxMPYGiUsNPc+yGUa7VsbFrYStRfU3eAokLujVoA9vpsCPsmWzMqAWM0858abAQrQYsNT7GSDeh3vWqX6c/IRXadlCwqa9OrCoIE24K9oEQbcDOwGN6JCmTCDLE4Ub8aRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=weDHBzgx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="weDHBzgx"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so885477a91.1
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067298; x=1780672098; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tzOZYRAyrYNaAuUvG5/Y5SZS8EF8Fxjy2/uxgYTIQuI=;
        b=weDHBzgxIiPxSVdaTyFPixq4Zjea3RPaVEFcJcB+UewSYMr3nc/ljpJvIAdVGxim9Y
         nH9dO5XltpUZgyvvqby60DVJenbN5hoBFtc4GBeVCU9OPmATq0xRcOOT3hNUGDg74eQ+
         TuQSK2Flag6E34/sUvFUyKJjq2Wqx2emY7hWGOWLCVb4Bh2X6ugfWla2tx90i6LqRNzC
         ygS+p64tI02w6QJdzyAAu3etNLXv5qlypXqTo3Bfi+aVgbUgJHLoJzARorK3lWoo5RRl
         wFuyCc3Ny4LSCqm4hCjmFOpWwxqoi2Avgjtk0/UXTc1XZ4CzWDna1c+OGEoZoSUcch6j
         UmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067298; x=1780672098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzOZYRAyrYNaAuUvG5/Y5SZS8EF8Fxjy2/uxgYTIQuI=;
        b=cq9W9tdYG+A3jS6zXCOEQYBrBIMYYvprIlwEdANIXRXlHtT1x/A0B5tNz4i1DOXK3J
         MLiMjWCDLnT0eixiqVDTxC9h3hcq8GSeUTRlpsWQcICQPPtc6UJDs/bSjkbDZrHGUiKX
         tZF9W1Ux3k7AiRxdQANEe+GxziqOz4bWY9eGTIngVPRW1jTXo6a3BCW4HaavMKe1xlKy
         68GJ56WOzL88lWAC0DaPPCpB9JlRUNsA9kMwm0983zGDUYcqHaECyWlBqR4O+CiF1/wE
         Xrtu3jPb6V548v7Xmh5LKwdydVYuO9nSv364n9OTjfVIiYT35MgAMa7Xyb75LUC4Tg25
         W4+w==
X-Forwarded-Encrypted: i=1; AFNElJ+vRLyfb51Dl2DoJe5014P952yLVU3BfxtkC2BISoiFr5c/qE9DOdsm4QbticfGOaJqWXGi5Efs3wmg@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmzk1AYYQ2eKb1H96z7yis3kwUg0PNF9xPmY8mx620QqlqMDRI
	ClMjF80ENvy+yljpktx/6qPdtdDUu2QfCPMDfc3yo6QKiOInyFWW5B6rEovJOzbKLyl4qoQF+YJ
	Rh+CqDQ==
X-Received: from pgbbz16.prod.google.com ([2002:a05:6a02:610:b0:c82:253f:d5e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5281:b0:36b:293:68d1
 with SMTP id 98e67ed59e1d1-36bbcfd8de4mr3965602a91.16.1780067297895; Fri, 29
 May 2026 08:08:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:14 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150814.714658-1-seanjc@google.com>
Subject: [PATCH v4 39/47] timekeeping: Resume clocksources before reading
 persistent clock
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

When resuming timekeeping after suspend, restore clocksources prior to
reading the persistent clock.  Paravirt clocks, e.g. kvmclock, tie the
validity of a PV persistent clock to a clocksource, i.e. reading the PV
persistent clock will return garbage if the underlying PV clocksource
hasn't been enabled.  The flaw has gone unnoticed because kvmclock is a
mess and uses its own suspend/resume hooks instead of the clocksource
suspend/resume hooks, which happens to work by sheer dumb luck (the
kvmclock resume hook runs before timekeeping_resume()).

Note, there is no evidence that any clocksource supported by the kernel
depends on a persistent clock.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/time/timekeeping.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index c493a4010305..26f3291a814d 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2098,11 +2098,16 @@ void timekeeping_resume(void)
 	u64 cycle_now, nsec;
 	unsigned long flags;
 
-	read_persistent_clock64(&ts_new);
-
 	clockevents_resume();
 	clocksource_resume();
 
+	/*
+	 * Read persistent time after clocksources have been resumed.  Paravirt
+	 * clocks have a nasty habit of piggybacking a persistent clock on a
+	 * system clock, and may return garbage if the system clock is suspended.
+	 */
+	read_persistent_clock64(&ts_new);
+
 	raw_spin_lock_irqsave(&tk_core.lock, flags);
 
 	/*
-- 
2.54.0.823.g6e5bcc1fc9-goog

