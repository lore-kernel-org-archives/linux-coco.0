Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702909;
	b=Snh0pfNbzlAorlwxJ8zHOOxze8QbcrLdDykDSVhPt1BO5UV2lP0NE0pDdKaAFYfZ2vNj
	 XW0iLviTUdpiZBvt3r8AvKXPGc2b1ku5qTQDEvJqlxw7civ7+q7SY9/x/qSoEUbOpwvlH
	 uTPSqjQlUQvxZsAmiJVd8kDVl7rZm/bFmkLfj3yruBRuu9V1uOLafZ4dn5BCFz78dVsVb
	 f6RnATtrV8zFml2B83vm9AvIqVaTzKbPDfuNq2RQwsGqmgiRfiQE6lrR84NbEfGNWNxp/
	 muylCmP8pOIQf2q7iB+r2RI9DAFLbsU21Qh/gcV259eI2ekevR2OUg2acagOV97dhMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
	b=oYNiBNJF0rcwHg6GHUzL2zg8VvXIP0ureQgts9Ys9MeKQF2dKE1WWc3iAkGHitvlTA5q
	 te19j0z9yQ1/5uiQH/ZwnfvZ9B5/L9zOSjRVrZZFLdmU04l8XiZRI9e1OCDiFK/0gZfIH
	 W1lPxMVaDrgRqppfLQcqejsI9Xi8IK2sd5hFe6As/BtbkBdyIYSxTgBFyDihCSnbyRKJI
	 vEXGDRo0sp2ZTpfL2DtVSS6B3kQbrVyOcZJYQ/78d+6yTsSkJ9w5WvRDnfnBgPkYUPm7F
	 124+SIMB/cq4gdKC3fGSCMa5oWLyZn0Xk6RF6VR6ZzCDqeuFVZKJIdJ3ewUegcZD2MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wPCxPlam;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C717606A321
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 21:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C717606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wPCxPlam
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so277462a91.0
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 14:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702903; x=1793307703; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
        b=wPCxPlamLZ6xRR/DTIOqA0O4MFkqhHQk7ozhu9MU9b7qoLug8Q6Sb+N2DW0aVPSVmx
         FJADYFXvTWor7bCHgDmTpp7KGEb4xt70+KqkiDPhqcRziiApPNkMMJHUxb7gqiVpQBH0
         piJZXXcRZv7rfSDQSr6XV+oVuUZg1cfTsje8LW676y6JkbY0457UQoyu8T1F4ltba1e/
         lEaqQZ1hJMQVQlOx54BefkWagixUv7zpZfwCQiDCj1XGVc+6RtBcSeiG+BN5fhat4ZXy
         WtHOUw+C7Shw4FRdtRfvkZM6Fv8LLfLJuurGQrDSLZREgRFzx2OmsiEEmHlQydhpx9Nv
         NrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702903; x=1793307703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oq8LnbfxGj58+AMKrtsZJUVrBg8Ev8BIHd1Au12gnbE=;
        b=fhhYV9Ziz9mdESJOFMVQRD9as0v3gnoYFX/Af09Jaox55CFNpV7em/cxGFYnHS7keT
         WawTfV+BD0FKcMr17GLuRusbJY6hyoazwAnFW26UkCcFAyFQ0q11ABEd0UcXIaIxzGSp
         9VEoNm9QvUygDfZJxZ7WuiLhwz9weqCwVQwR8L4mFruRKX0f6ULMiVhYHzDR9v3m6gMG
         dM6NaLjl3NxAwd5R/N0eKakoqssN5SiUWqpwAS20XD/mKtJz16fg6LvNKk7Ih+ZLJzGz
         VVHtq46z6E/35FzaYtLwq5OYwOYw4mUuppXt0Mep/aBD1BEpSEFOt9hgtnZ2VuZfr20P
         M/3Q==
X-Forwarded-Encrypted: i=1; AKwUvByyu7dSmscPBy4HEN/efkHtbM6qT3UjvHn40wcCACwu1yOupUOnefGyZqM0j5C2yG8MCadhoyuVfYvj@lists.linux.dev
X-Gm-Message-State: AFq9FYLKMUZPpeWjhsaLZnJ4y8GXnBXuBnD4Mq128DK1DWzYPh8eg5no
	WRhM+iLwcSMGE92z/3975wTh6zOVq/tirGrm85Sv/zF5SeW7wDKR/XXBQRt/zD89zknDGOD4UCZ
	UHB7gHQ==
X-Received: from pgca6-n1.prod.google.com ([2002:a05:6a02:6386:10b0:cd6:9a71:5dac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d40c:b0:3ac:c024:b275
 with SMTP id 98e67ed59e1d1-3adcddb7bb6mr137328a91.9.1792702902649; Thu, 22
 Oct 2026 14:01:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:33 -0700
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-3-seanjc@google.com>
Subject: [PATCH v2 2/3] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate
 when filling CPUID entries
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Changyuan Lyu <changyuanl@google.com>

Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed,
otherwise KVM could confuse userspace and induce a configuration error.
This also ensures consistency with the CPUID entries returned by
KVM_GET_SUPPORTED_CPUID.

WARN if KVM and the TDX Module don't align on which functions have
significant indices, e.g. to help ensure the kernel is updated when the
TDX Module learns about new CPUID leaves, and vice versa.

Opportunistically add a comment to call out that zeroing the index when it
isn't significant is ABI that userspace relies on, e.g. QEMU looks for '0'
instead of checking KVM_CPUID_FLAG_SIGNIFCANT_INDEX.

Fixes: 61bb28279623 ("KVM: TDX: Get system-wide info about TDX module on initialization")
Cc: stable@vger.kernel.org
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
[sean: keep the WARN, don't key off KVM_TDX_CPUID_NO_SUBLEAF, add comment]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 271c2f94b8dd..37d088f6f7a8 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2,6 +2,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/fpu/xcr.h>
 #include <linux/misc_cgroup.h>
 #include <linux/mmu_context.h>
@@ -163,12 +164,23 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
 
 	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
 	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
+	entry->flags = 0;
 	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
 	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
 	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
 	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
 
-	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
+	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
+		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
+
+	/*
+	 * Explicitly zero the index when it's not significant, even though it
+	 * _should_ be meaningless.  Userspace relies on the index being zero
+	 * (the ABI was inherited from KVM_GET_SUPPORTED_CPUID).
+	 */
+	if (cpuid_function_is_indexed(entry->function))
+		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+	else
 		entry->index = 0;
 
 	/*
-- 
2.56.0.257.gf7497c7d27-goog

