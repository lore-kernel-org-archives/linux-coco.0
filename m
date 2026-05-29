Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673E3F39FB
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067277; cv=none; b=RqW0refgvh25rQ2Ldh8/Am87S87cyaOeTe2I3v/2o1n16oihsJBhZqKyouBQwsF0ovayi5xD+RjHPxoJudLB97lsT2DOrCLVdC7yoJWrxGKDuHglMbeIu7k4hig7D64BrVEqxTeV0JB0aI2WLrr0wXWuGkY4kPiXjDFQywgCVkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067277; c=relaxed/simple;
	bh=kqQGoMW+oi+5ZrWtSd7Fuu/ZnSkBt2VrapqrWKwhgpU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DZ1oownRRD8DqFzFldgCegY2cOkdicQrONaJ57SPwTn84y6qhRb81RRRGXJ1q7CR/BqLICqEpiKrd7YQ2TeTLtm7by7oJsS76qKwbxCn7P4ViElH9FeDrLz17c71oZePAYLw34f08ua/fuhv7iR/M2CmpJJ8PoBrJgR+WOUDiAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ihh4gcuR; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ihh4gcuR"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bf30576aa3so2304525ad.3
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067275; x=1780672075; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yp4siaZu6zeBY6Dr4EV8ib3+ttfMwXywWsfu9IVNNX0=;
        b=Ihh4gcuR4swBY4g6gpI2bcbWGmxNWv8WqJL2611I3R1Pyh06BF1AB89wC0d13XA2eo
         ZKSleBuSfrIi6fSNdYgBsqdeeLtjOxlvtt1k4HADVh8KqFDPZ28XLFRFE3UN/g/dkq5Y
         Evv0bAxHHzps4umHP4grnmyXvP9CnpBrzyCjHPYnzW/hmKtMIW9zA1UaUs0pgSFXci4I
         JSX8UF4rFM7tCRRLBzF/YjmplfEr+KzrmCUvpUYxeoTxSuoVkyjppX8DstbpXfJGWDUD
         MrtjSP/SfoThd7srVyXqYJ+r5K3B4mGdVsckKFjDw6FxQ+QK+ngDNUjRTWB6V3hlSzAq
         gqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067275; x=1780672075;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yp4siaZu6zeBY6Dr4EV8ib3+ttfMwXywWsfu9IVNNX0=;
        b=DpiNIgk5UcZi11GKJQ/bglICLcYqoGd2PvHwZw10ONNxb8BsTKTnKXlXpSMfQZeWfH
         p34HpB4vcgUo0YaR89/GyvfgyT3IWdTOSk9VoR/n6JOIS9t6HOa2ISyiZe38gSl9/7vM
         VL6/30HeICKUqE4/HBJjEmiKUP/8TiTDrK9Cv4/vyUEJAyQMNfX8Zsy3sl1aihjiocnD
         6598g3CWacbHkhm6HikPS91jcPUrjVDP7ywgwcSNViVbJm6tuKK2U4dutsn3jeg7WrjD
         kZFycLgldPRK/nhi7ddGeR5v/J0+bDuTlzROLPHOWWxvud8g2e7mS5m0Z0A+XVYquvgV
         L/lg==
X-Forwarded-Encrypted: i=1; AFNElJ8qZL/gUDB18ZUEI93mifktWF4wBAdmUDnCPBsnSNShbsP79P1LyAmnC8CXbs/b5IGEwGckoFvTIja3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj7Fd0ioNmpisiikK4vStjD+VM4tDiI7VDc22UcnsdT26JiSwp
	LdwU2qK8qI/r1zLS9tJrJvOY2jPI9DBHCri5PSZ/jaoJnZIR9DhMtttFczMP2n+pYZXvYIKbxmK
	ZHmlruQ==
X-Received: from plgv8.prod.google.com ([2002:a17:902:e8c8:b0:2bf:2f05:e721])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2450:b0:2ba:6ca2:be0
 with SMTP id d9443c01a7336-2bf36798a4emr3028165ad.4.1780067274515; Fri, 29
 May 2026 08:07:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:07:52 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150753.714296-1-seanjc@google.com>
Subject: [PATCH v4 31/47] x86/vmware: NOP-ify save/restore hooks when using
 VMware's sched_clock
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

NOP-ify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 2d0624c66799..051ef89029a7 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,8 +347,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = x86_init_noop;
+		x86_platform.restore_sched_clock_state = x86_init_noop;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.54.0.823.g6e5bcc1fc9-goog

