Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB63F4DD6
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065905; cv=none; b=Iq5Sqr31/EGJf23FzmG62w/M4mJf2CQr5fY8MlMAas9Ifu80/irPcQSGyt8QtxZwa7Sa+mKqOE1uraXfuwdTmGwPVN44wl1pLOQ/1n12+m6aCwYNmuQvvR241V6SXNZ5CPlP6reSLJxaKrWMwoxl2r5hDic4MPhYSlqp04XU40Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065905; c=relaxed/simple;
	bh=eotALkKBLw2yWarXNKTm3nPmBYb4JWK2U7pCUvm8B4E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rW+aX4Vr3Lfr9qohAS9fn3308S1RLtpGJ1WrLQDQhaqF/TaVR0IGcpzOxzGU/rar5WJ4NklarCwsgjuNZPMvu0K4VFOOJQuin4UfY/9tWn3bQbkBFX2Rd7T0ReYHghi5j5CZ7zcpgo5iQUuus7CPe9rNF3WT0W93Blwn3LKzfGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ulZO98jJ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ulZO98jJ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so149189755ad.2
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065903; x=1780670703; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Cv3iY8yWhIG9MApRDLOLL6ifa8DISlk6XR/KWuM4GwE=;
        b=ulZO98jJNA4WGKgsglNoYNkks+bk5eZ3zhH2pRMiGgpgJWt+y2C9fKDyUO14Z/RFue
         Ny+8TGQxNPaYgNy7yfnBAENmrppqO2bYc8p6VfcD24icpDPPbBkfDHNLHBKTYD+PoUxq
         XeiTZV0WfU7zv24z3LjhS335g3DrjPrTUqW8/qYml1gmJDchK5lh7CyWAVCspMRVj8ag
         xqQj4ddbuL7m6IFmhdvxdedjMXjFuV0PHlcDD0GOWXHk5qNKMIXrYeKUKcI/u9CnJ2VO
         SsvpNjg9ZWncsTvdb0DaY24gnlhcZtSiHSeLTOeE/dOU6ODrn1Irmx5quccl81O7YOUb
         hxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065903; x=1780670703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cv3iY8yWhIG9MApRDLOLL6ifa8DISlk6XR/KWuM4GwE=;
        b=ZDIm3ItAMVTDdbeDXQiuI/W+7nt7459QSXC7iiAvAEbLSQ3XT+Y4/Q7mi7BM6m2LPB
         SgCeuyegfGIxQQfR1ZPoPArz0PiwQTjc++EX//oZmU+3KVOY1vDVULgEkWyDLnKQ/BsZ
         ziX1qIfkTUXy77+YIPZ3YxVDdK2CdlMTyFO7bQZkh2JiMXndb7FTxqX0tO2ky4O5j98J
         bhr5bAja0WWJMSeYDA4OnJ/eO0ISnoFWHmMfMwEoZOci8zLhRWynnyeRcTf2I/CnHoou
         za77rwZWM0xtxisxMUHRk4z3poUi0eDDMBV7ZimPs+b+3/ykaLHPlvA+E8qNl1trqDuy
         DPpA==
X-Forwarded-Encrypted: i=1; AFNElJ+FkI9weqKz+6aSJXdXqtmUFDTd+mhCBD/3gjXSOd/sGtmaJREVDrvoTHKOzADeM1sb6FCALLHJQNcR@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ+upU9I+VhMMxMFZSTvozuZ+sUv6KbcoDGwJG3bB+kmvUicph
	945Xqqnzm4XTTGgnu+RBZLF3nO9km28hnnfIxsOFKhqrv6K9e6AaK4VobA0R/yn6ygZP4nkW7aI
	REA/AXQ==
X-Received: from plem4.prod.google.com ([2002:a17:902:e404:b0:2bc:f203:12a1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1983:b0:2bf:23ad:8595
 with SMTP id d9443c01a7336-2bf367b260amr1523355ad.4.1780065902031; Fri, 29
 May 2026 07:45:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:56 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-10-seanjc@google.com>
Subject: [PATCH v4 09/47] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index ad8f2da8003b..0303fe6a2efa 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -33,6 +33,8 @@ static void __init acrn_init_platform(void)
 {
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
+
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 }
 
 static bool acrn_x2apic_available(void)
-- 
2.54.0.823.g6e5bcc1fc9-goog

