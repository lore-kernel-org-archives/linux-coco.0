Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C7A420E69
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934391; cv=none; b=ZTM+XkacrhykIuDejgtbStFar4HePQ3IScn5Z4lhC9hkPMAoOnWiciY0w3pOT6YyHRexDTGF/LV61VkeDVgLz6ub7Cp7jmsvcp2xg+mYH6WJIuUY8mGTbuCAWQwTEgAgskX9pynUHtpqGTe8WqN2DQmmbVkBfoH/iYhOQN0G5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934391; c=relaxed/simple;
	bh=FUN+trAftQTY8ZpFI1i4Es/NPmL9miMwKLy7njqUDaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s2eGbvxodaIctthPWQPdL1b3TggZN5eOkW23oy6Fmk25pf6KSlrwd9W7A/RSDtiCH+t3AlCU/n7ee75jZfpaxfMmBCIud9ELLqdMLdn6Q05XTeCb5FkY8KSjKrgMId46JQngYIPOFGG+HbcaZpoLHgLm0X1g9u8vMgVxir/i/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=da3sYrZH; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="da3sYrZH"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c80f89b64bso15751825ad.2
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934389; x=1783539189; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=da3sYrZHuaiGu2GGX6GAktEDrjj48fbFWC02kIPmdIQcKcIHYLuNmNurhS6Muyh47J
         /YRM+HbNHqQjZE1qBjpe4kYCV61/UG+oYjL2b/l6E5ZRy6K9CvM4Pfayb1MFgopXbPSg
         uZr/Leb7vXZPv1j94X8cn1B2S6ym7azOCSvABMwQHDQzlqt6ZRNBsyStr3KgvYJ+Gs+G
         ky4vgwkm9Ss8LzK7faHGfI9Ch1J8U9mCSHa25A84x5SnOL5fbm00s15xS+Qq4Q0inJAk
         gG9qj005OlNsHLxY5wIDGY4cBirL9rL9liyH+KdUvme1hjzyz9pLxr0MZcYNtwNzgpDH
         vzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934389; x=1783539189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=X+FoO2ljk4sfH5fXek8G5zJ1QjKyGOFLflfYYm5kmaAcE7IEJMiabH6D76mbYWTb1J
         +UOGP3hRkaMmFU485uDeOV+5yT5gTcJd0Rdr7kM47HNKu76rEK1CWca32QrdmXgVXu8A
         6ZYLkz2cqF8jPyIJJjKIOd7bmTmx5WYVa6kCmcAwYxld816L/9+BZuALCCLgxn/9SAFO
         ZXIBfsnTn59jbTzhAxVsgWfsaG+rGVPiHY7w9x87xpyUTKx1yQi1IqgOwS9U9DCy90J/
         9euB/Pu6BnsdLG+mLTqdoNYxRggKETsNgTtbRiAqKDLI+HNtTXkhcXwUiruLq3nNqjiA
         kwaA==
X-Forwarded-Encrypted: i=1; AFNElJ984qbTMtc9hDZ2jcm6mD7MZCaswuHrttHHz4YKH4/DwGmp4DRVK+6rro0YHhFM0Z/ICZ32d0OXDjyv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo54CXUD13+x8VGZlCL4NfFttlVXgf4O4xfUkajQUyhoYRP+qf
	PV2ftvd3YaA5IWFDjq9dkzNl9754wviF4PXxadq3PySNuJEWdMDSJi9nPquC/CoS7aUmv++iytD
	7ts0qRg==
X-Received: from plho13.prod.google.com ([2002:a17:903:23cd:b0:2bf:1274:c8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c7:b0:2c9:c46b:129b
 with SMTP id d9443c01a7336-2ca7e67c028mr32017335ad.5.1782934388785; Wed, 01
 Jul 2026 12:33:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:55 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-35-seanjc@google.com>
Subject: [PATCH v5 34/51] x86/vmware: NOP-ify save/restore hooks when using
 VMware's sched_clock
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

NOP-ify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0a3bd90576d4..5c1ccaf4a25e 100644
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
2.55.0.rc0.799.gd6f94ed593-goog

