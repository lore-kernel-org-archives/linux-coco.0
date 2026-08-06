Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C44A6FE7
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059429; cv=none; b=WKX47hrVzL0ZOrN4XRVNo71Iqx42aB/8kkAnreIXavuoCb28StqmKftTDimMnTkXxGr3T2XztcGzNoTFrgxLBO9GrRBSFfAnj9e60XvjqO48oBIoVcpl4hTICfiIbP3Uh7bGnjyZ7cY3trPxAe7G6fDME3UdmLcfw2Aop2RQrZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059429; c=relaxed/simple;
	bh=0rWeo5U3RNZ9xcYSG/uqkjOEU1OGp8V9JrAfTrxuqfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ds3sU/YZJE8b/wFBlR+IAT/o+jvvHiSIIxvEz7Te6AxkDoFNvLA45GKORxr5IOc6tXiCwInP4kEgdtSFCPOflDxukpuli7GYSussjbuhFZ8j5BESXthFX78J2UhmpW5Ek0RGtZ+Z9JZD0PV4MxJfhJ9DdU04lK4IhXDQ7ygYPiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pac3PKRt; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pac3PKRt"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so1828771b3a.0
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059426; x=1786664226; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7lbZxAdhwKhuj6TvbAGr7x+TgvyyRrRPdrrP8vwGefI=;
        b=pac3PKRtIQeS8qfPZQwM1oeU/nYQL/eJYKhKAZSgu51UdB2joWaKi3UCUZ/9cfSUwy
         nV5nRsM7W2Gc8Ul4MzDE6I7QX5d4SJVupyE2TmzI8f0jzZimatFM2L59fb0cRXF3sc2l
         br+0FBbz95rbET2PbYbBj0wxXh6nZ/WaapJgbXy1aJvLPrVKdVwRKF8Dn5mWucWdvWJf
         LxkXoIrbY4GZEs5/nwFiETzn9Fiy8Zckki9xFewQ1CIDf4x80i6MYx2VI4yISJn3LLun
         tEiI8Lqhu/MD9kgH/2z7TJ08RnVdew6+RXqwoygU6+UaIdaJnAX4v432VUm7ZDAgSv1g
         sLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059426; x=1786664226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lbZxAdhwKhuj6TvbAGr7x+TgvyyRrRPdrrP8vwGefI=;
        b=FCFJASGSBUmJgRyoBGjYFuAatJBN6TXUnsAPD0GN9/MPC3d/mznEHV04UkhSam7s/U
         9qKJfqJ/ISAPC9m5Sy0dsf7Ajz8SttFwkfxhlyxdo+gA09DxV6dBpz1OjJ/Jh/EmiFTt
         M+WTwYK5Tc+f+5SmO9wbGEC4/EaCpua+aJmL5WkeC4S2kobk7dvWDWDxpbuKJ/rrGIQ9
         p6/Lat2/Ph9Wm6ckGabj7GzRtat4McdsyXPSSNtjhWbHLL8xJI2pD3jQ6nIYjf6uW83q
         rTDAQZHTr1+VhCze7tUORVb6ojyPN6tSEcOpWK+Q9it3VzpYET8qivITCiqGoLnKdgBn
         n29A==
X-Forwarded-Encrypted: i=1; AHgh+RqPp2BN/Q3421KYUjF51ihasdc8kl7ecpzGSF9VyDUBQ0jiAY82vKh8O4g77t/sIVu4rPL9JptV7UQT@lists.linux.dev
X-Gm-Message-State: AOJu0YwKF6DJMb9ftlvYFVmM3oWBtkBBsaGVl0V8+bciI0BoBZEl7pgC
	5cvBiKOrfZYwh8qA7sYJBEL8avztIbwFMAmULzGOE1cupTdBH4811hL67OkngegrpfYoC/5weaH
	sRxoBmg==
X-Received: from pgmt23.prod.google.com ([2002:a63:2257:0:b0:c86:61a1:3390])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7105:b0:3bf:651d:fee0
 with SMTP id adf61e73a8af0-3cba2b5d6a7mr10015839637.19.1786059425491; Thu, 06
 Aug 2026 16:37:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:50 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-34-seanjc@google.com>
Subject: [PATCH v6 33/51] x86/xen/time: NOP-ify x86_platform's sched_clock
 save/restore hooks
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

NOP-ify the x86_platform sched_clock save/restore hooks when setting up
Xen's PV clock to make it somewhat obvious the hooks aren't used when
running as a Xen guest (Xen uses a paravirtualized suspend/resume flow).

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 487ad838c441..477441752f40 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -567,6 +567,12 @@ static void __init xen_init_time_common(void)
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
+	/*
+	 * Xen has paravirtualized suspend/resume and so doesn't use the common
+	 * x86 sched_clock save/restore hooks.
+	 */
+	x86_platform.save_sched_clock_state = x86_init_noop;
+	x86_platform.restore_sched_clock_state = x86_init_noop;
 
 	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
 	x86_platform.get_wallclock = xen_get_wallclock;
-- 
2.55.0.679.g6767b8d81c-goog

