Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99CE4AE654
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059448; cv=none; b=idNzuQUOsS2apfV1vRalyn+AyjnH+V0wDZFr8S94LfS/iYg/2pRR157O5kK305y1/Y2t3UFUFrddzFJZtkB7flJf2B82Ey4bdmD5X1O1dLHjmdQciYD/DpNBdGIboTUAdnUHDEPygTaFhepxtFx9Gkri/yOTe/I5+tBIywmSSbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059448; c=relaxed/simple;
	bh=XsGLMtVm+PnMkFVZK403hqaUQQJSgP5QvusfM67Nl2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NFCDy/2kBbkGAldnPl+2mMSoMoQxDsl3aWp5SgX8XxYoXGzWoIaWBnIJgRfgxhiPgXFeutPKpOpL84uU4VUkWrO458Ul8TkDfdEzn1fkhGucJgfBYjtjVoiSkdZvfXB04ZMncCvr2vnKTudeZzsxjTTxeUUaq9SvA87vOxx07A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN423PtL; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN423PtL"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38827cee19eso3453349a91.3
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059446; x=1786664246; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yUUzKej44hzjMWM7byUMUm3T8+/2OB7FMHfj7k4gSDk=;
        b=SN423PtLzvCNI6GjxftiY0buOS/X8uNgXJP29papR7TrVlq0jwBu28dd555Tv1zPAh
         ruUenDXFQWCNuAiCl5nietycvOvpkzoYimXykxo/72tNbsLkouBMRi+JrObt+xgKvWxi
         rJDwrvGkM2qOqvjh6zerZu3QKd4G3i9LsQSB1FO8N68h326MlpJbKjK7rTeBvbMP/DJP
         XO8gva9DXJp35gECI5v1K+hlexRCg7oXpeAqooWLO3zX72gN490lynoy9Sm5A5awtz6B
         A+pGZZ5H0WU1Uu7RNXG5H9VDNLSMhal2XjGrFExON9H2zpdSWOihYbqfI2NyD3ECcnBD
         wGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059446; x=1786664246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUUzKej44hzjMWM7byUMUm3T8+/2OB7FMHfj7k4gSDk=;
        b=ns3sA/o743DQb3Wr6WHc9ex0z+UJo0AeTHO0naz/e9PY3/51yMsAQ0KpXtgyrTyC6Y
         zH4wEifr5OHkmWFT4++sX0Iyl5al+VESikLfxqEhkdnVUQHmC/2/h6c88SeVDr1qATMT
         oqQDz5RrSP8SU5wf8rOl5NsgEo3+i9Axx0OvV+tZJFP2L+kqAbhj2YU4nnugTEnXbAAl
         b1vslZbBAJlJaxXUWvID0Y8K2BF8uFTxs3mbCNIc2C+kX8eNvlz3Um9M+KR5J4y1qosg
         W+9aeLeljAOaaepSzfGH71elZgQHEMOxtQRoWpmGekEvluyhofxbygk+k352YmIUcRD/
         A3og==
X-Forwarded-Encrypted: i=1; AHgh+RpGJHGLq6lCrIc9VpCTRykUqZU/MWCwRkcgak2VGW8jfacPMPaF2I+i9sMRZuaRvTc58JFfg9k5s9nf@lists.linux.dev
X-Gm-Message-State: AOJu0YyIHLvulME9GTLGMIsXn02O71qPyO6LYZLejyiKWK/HI1SOK9WQ
	H7szA5GbI8ZJXx7exj//hc/Sorqs57pOcn9so7vEDrbLIsjscaxGX5CBXDQFnQaoIUqDEs/EKi8
	dUSmzXg==
X-Received: from pjzp16.prod.google.com ([2002:a17:90b:110:b0:382:7fcd:a18a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:520a:b0:38f:5828:a40c
 with SMTP id 98e67ed59e1d1-3903c59a6eemr19079453a91.10.1786059446038; Thu, 06
 Aug 2026 16:37:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:07 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-51-seanjc@google.com>
Subject: [PATCH v6 50/51] x86/paravirt: Move using_native_sched_clock() stub
 into timer.h
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

Now that timer.h ended up with CONFIG_PARAVIRT #ifdeffery anyways, move the
PARAVIRT=n using_native_sched_clock() stub into timer.h as a "free"
optimization.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 ++++--
 arch/x86/kernel/tsc.c        | 2 --
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ca5c95d48c03..a52388af6055 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -11,9 +11,9 @@ extern void recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-extern bool using_native_sched_clock(void);
-
 #ifdef CONFIG_PARAVIRT
+extern bool using_native_sched_clock(void);
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void));
 
@@ -23,6 +23,8 @@ static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 {
 	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
+#else
+static inline bool using_native_sched_clock(void) { return true; }
 #endif
 
 /*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c0e4485484f2..74298e8ffa1f 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -302,8 +302,6 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-
-bool using_native_sched_clock(void) { return true; }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.55.0.679.g6767b8d81c-goog

