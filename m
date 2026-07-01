Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB7D42A79B
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934408; cv=none; b=KV6iN3jd1redPDhNVyApGSAlGVEEc5F2fcgoTM7moZDw6b3oaMG6w6Hn9F3vory8tSniSQW+FW4is/yWtHf6HWKHf5TM/v3sxMMjDlTQOcCBijNjzVhFhtnEJmG2EdAID1VdP+ujqcpaV9m8Qs8K/pDxIg/MzG7cH0AmHhTxnIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934408; c=relaxed/simple;
	bh=y0eTf6sBBqtgXOMcKj6+dRH4mQYHxDct/p+oWayuTuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BPl4jGo1y/ADTiStQ/M2HlFsEZRwg7zutyGY2h6AKPFS8lwJ8rdpsrqPSWomlRp2XLn9l+TSl89l1UeMQgTz9z9aETwERSEat79iDm9IkoUev1etTmteutHhG17MAU67mflLjQ0ixiRYesNFZESIvmmMtTDzKRRB7yWy/WLTtUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ORv/wTaK; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ORv/wTaK"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c9b1b608e2so14576825ad.3
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934404; x=1783539204; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KILxImADtcVlkoacCtqYmxEGcZEGxD9ytdtd9JfAHyU=;
        b=ORv/wTaKsBNfrlgPBKO36ChLCvIYqPwt+9YgP2EYpb107ecgI+M6x7F4Asrp14zCL6
         P6NwaDasmbBajfykLu+Odi07szGE8BbYtW/T9BLAxfLqV29xo3tsqL3H0G8k/dovuaH7
         kwYTeFNkhaYGlJPcbfzVtA0soBGDTYwtAvY+NrGl9Y1bNR2dz1e+jdRx0E4JYpNtlVuC
         qxqvTybx+4bfBuSCwtg48ZsRALQRFyVPNxYzgfGe5TnJ5bjbSPUdcIL4h1wpB9s7mHM0
         9Ebb+z1kGb9uz+VSwmKTJfZZiAm/VBVf5G659v54ZKJwZOfiAVBLlY7vQjH8xxWQa8Rd
         zZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934404; x=1783539204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KILxImADtcVlkoacCtqYmxEGcZEGxD9ytdtd9JfAHyU=;
        b=KtugGFVfp1e6TTzeO16QcDdK6J2uW9xM0l3XWY0btj25cfyWOSJthDrAUR3QbSP9pt
         d19JQffyRcJADnLmBJy6e4v8va2SscclGuoMyEPPdtGMrhz0arCqsh4uyWsU7t9F1uvA
         fTrtZu4whLs0Jd1M3oDc1O9OdaH8D58oqO2ZtSH1pNX+9HP1IzSM6vrKzAyOXTw0GE7B
         PoQByZAxWx7oDl6KmOrK4GkY4JjVJZSUaV27CKmovQHr4NZilQfytmsfPA0wswQMqoxA
         gevM0JNscC58kSMN4ZXiV2cj1wwJw0M9ib5lPArCJxFpGg4X53qX6zYNkCdVLth8jwXN
         kttw==
X-Forwarded-Encrypted: i=1; AHgh+RqNwPw8q30u9OERVqcAW3DW6v2SESb9kqaowWGFFDDmTfBr/GPAsmfWgodsFDv7DCnVOQuzmJBMzrZi@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo5kbnR3CNdR0ueo8dm6VOI1h7pebSiSwWCZ1ypdJC+hdU7nDx
	IEZWKoJ5BDus4yhi/f7CKKzBXWQEiekwWCKejafwfIot0fCehd9B7leSlRkE+qBGs71ClnpVR/s
	vKK2CZg==
X-Received: from pltf1.prod.google.com ([2002:a17:902:74c1:b0:2c7:5af7:37a3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c952:b0:2c9:c169:7483
 with SMTP id d9443c01a7336-2ca7e87dc6bmr34187285ad.37.1782934403691; Wed, 01
 Jul 2026 12:33:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:08 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-48-seanjc@google.com>
Subject: [PATCH v5 47/51] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
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

Silently ignore attempts to switch to a paravirt sched_clock when running
as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
hypervisor could attack the guest by manipulating the PV clock to affect
guest scheduling in some weird and/or predictable way.  More importantly,
reading TSC on such platforms is faster than any PV clock, and sched_clock
is all about speed.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 012321fed5e5..a146fc7b5e74 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void))
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return -EPERM;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

