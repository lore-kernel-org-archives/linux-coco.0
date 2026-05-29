Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB93FDBFD
	for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 15:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067296; cv=none; b=ZEXt7B+bOqyNHqJ9LgZJxZBF7a14PEhapS/CNCol/5qIFg00UM0G8bqct78cm5Ghi7A32cyIg6bsw4k5JrezUcGNstwIQ+OS8kviNA0xh9/mOzipZxvXF0oCqnKwCFCSFdLpqOxG44QDCpvwlFs5hFC8q09mMKA6Onmq8Vj+oQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067296; c=relaxed/simple;
	bh=BSjCZV2prw1SrJXvAtpxbttBG+ZHRGmcDc0NH0Lv54Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a4v7Q37sRplVhbgyPtMKUyMiE7ONWgOurZbgozUau6xXyvPzlPuV3SwGNKlTgQjMfhNx02kGLBU2+1wld8hbvZjLayubDXaE6izJFLK4LNpA9M6MoRLtwaYu+PSclbPiPiP4pN64m5Syvnc0gr3bdAz81DxLb7rKiYTaFijJ/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cVorbcZd; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cVorbcZd"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso160818645ad.1
        for <linux-coco@lists.linux.dev>; Fri, 29 May 2026 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780067294; x=1780672094; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IXSUk0zrc0SOIpzpc8N9Re3bKO3sQJVctQ52bfDdTtc=;
        b=cVorbcZdi7JHE/4EAbQqtFVSAZq8A43BsGnMefJ2auQXBo82+BgQMCyAXsgppvOKl0
         DLkIwGVdmLTuDh2Xeo6WyPHNan5jkvvduY/r7E9wIye3L5uuxdZ0AqB0tYx4OboVrhOo
         0yPoPcQKBnwpnzPEngsnewXW2D7ULFgZBymFg+Yn+8zxF0+8eurMDdVLCm31+JmyrMdR
         auRusL2/p43vUDIbDKVcNnFzfqnQOFEcPXks3JXkxoIAaBabTa08SLqkG6Vws6L/T494
         kEPwp85avIjk99eT+dVOYAoV77t/vD8faSUz+NO5BERYcruqBPoTcwP9T/EuB43Ek0dj
         XFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067294; x=1780672094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXSUk0zrc0SOIpzpc8N9Re3bKO3sQJVctQ52bfDdTtc=;
        b=WSOEyFaFwtb39LWuSq/T4uMIyVKuwfX1ikGsI3lXjsxFMkyyUiY6WiRrF7jHHPfs1C
         WS2OcH1uOGsxNMfLS4VccZWjy3mm6O1ZDuT2Pw70OR8WgCUaH32sQhsbK4DzU4U8amfC
         SCF6pJh/pyW04MgG96JkqDPzK9dAc90dIsJCUhCjpZ+QJD6P0DGlRlOvGPo2UFu6QL8i
         yhDkOT4+w0OobdjnZLcvn53cNsh3SNPEWhuwOirKFmFzxeIRSpc4AW5d0UipMy+AGwSg
         nypY2kx8AERQb0tdRc3VTjwvgNZ+nqHVZg8XxzEPfu3e1Kmp+dKTUZjF2gaVKJ01rGk1
         UqKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BrI0iCZDMZESS25ET63ZY+j73mtsf9x2ikgcpF+yof9V5dHXebADiqEo1nTPT2W5WSG6nCjNQKr3Z@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5kkobOxM6G1GusDk+6fBkfwVS1K+hajp00CVCv9cKuB2sYQGX
	atvXMMmFUjvNxZF3lCLcxBH6OO8VRGstWwGfjJrm5SZtR2LnorlVjgxScdSexidgHaebGzGhrmO
	c9YPxFA==
X-Received: from plblh4.prod.google.com ([2002:a17:903:2904:b0:2ae:ceb3:f968])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e842:b0:2ba:6ebe:4897
 with SMTP id d9443c01a7336-2bf367b37demr2834085ad.3.1780067294027; Fri, 29
 May 2026 08:08:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:12 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150812.714604-1-seanjc@google.com>
Subject: [PATCH v4 38/47] x86/kvmclock: Refactor handling of
 PVCLOCK_TSC_STABLE_BIT during kvmclock_init()
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

Clean up the setting of PVCLOCK_TSC_STABLE_BIT during kvmclock init to
make it somewhat obvious that pvclock_read_flags() must be called *after*
pvclock_set_flags().

Note, in theory, a different PV clock could have set PVCLOCK_TSC_STABLE_BIT
in the supported flags, i.e. reading flags only if
KVM_FEATURE_CLOCKSOURCE_STABLE_BIT is set could very, very theoretically
result in a change in behavior.  In practice, the kernel only supports a
single PV clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 6372b4dc7b0c..4e304f1c887d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -305,7 +305,7 @@ static __init void kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(bool prefer_tsc)
 {
-	u8 flags;
+	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
 		return;
@@ -332,11 +332,18 @@ void __init kvmclock_init(bool prefer_tsc)
 	kvm_register_clock("primary cpu clock");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
-	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
+		/*
+		 * Check if the clock is stable *after* marking TSC_STABLE as a
+		 * valid flag.
+		 */
+		stable = pvclock_read_flags(&hv_clock_boot[0].pvti) &
+			 PVCLOCK_TSC_STABLE_BIT;
+	}
+
+	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
-- 
2.54.0.823.g6e5bcc1fc9-goog

