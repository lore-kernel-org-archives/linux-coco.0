Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834954C8FFC
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059397; cv=none; b=rshTrWQv7yoYGLb1BHHOMtyZxDATvdtBCe3JAJlCQaF0irNrGEHxKC0TWPPD3wNCuQ2aI4XUOg5Wq2vw7ZM9TlP/I0/pVNjYfECgHbBKuokdsC8Tq8Xnm1vfJXNsQN/e2wAneN5ijHEdO4ILGusm4S5jp92EYc+OSb/1lDPOjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059397; c=relaxed/simple;
	bh=uHCr+aGd0IVIljQJaBiD1XMjX+0uHia3XbUwy11kdUQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c4eJoSwlZi3Y02hrfHbHVDkBIY6cAElMdYarBVa3uvZAE0hTopyebcKEXhA2rWzEhV7IsgnB/aeyd6GlApKL3MVCEzQW3hvRXpZ0PqRhSJi00T6DLHui7EGDUfVK0d8w2tWjGFEBiCEnUnajbYJ3gcTdmMbLsK9EL11+wT2+ul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d6Doxy7y; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d6Doxy7y"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfca8558d2so38184795ad.2
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059393; x=1786664193; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AA+qmVUXq1UZoUYGqhY11Guml9As0mrU+L3gWPkVgC8=;
        b=d6Doxy7yoP+Dqx8hPPQIMQ25koEFuFkpP/P8OlGA/EwZd2NDSx8v+JDiEs4Wo9bQlg
         1AHJWVmBf3G8yfOjNXiGwj75Hg+xlHfFcJo1W3TTWzRZ1IEPQMHTIZ9g+GqBmPBw3s3W
         BNX3v5+b0UDE0TGpOzvI5xqG3kEvtlFncDL+r/KW2x3cMXQnYFrHlZYIUvo6RCZd/DCX
         hasK7vFQE0+nP4gQ5FJmVQCBsJ1fKvJmlfZTjji+AK2yRGmBfo62Xg3HjBaIWZLGsrZW
         ww1mMbEqND8zYut5/Cww4p4QfOadv8PSeAI9mm9Rdj5Nuv5datK85f0EpGPR3qJ6sPjG
         0OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059393; x=1786664193;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AA+qmVUXq1UZoUYGqhY11Guml9As0mrU+L3gWPkVgC8=;
        b=b/QNuVEc1Ew70QGZlFqQiAmj/hAdyEdZpN+nS/hJUH3r9ZTH+U+hU5dVWWaxb/Rmxw
         42bHP4ao/Y8ObtcFqOk6enK5+lx+M5gsNhLFitnSRQIIOQ5E5578Ha0hQKONM3iqpVKq
         sPSP/U1517cExUff/zEu7E7+r4sIX9CH7IUTf0EKtzQTYZb7p1TzbD45G9lpkKkWgYRk
         5HjckdewaW8gipVX8UFEWb3Qny6RHhWroNLfuhO5JqAq9OkR24rY8WNWMtRvbc/7eeX6
         sShOczadJUP0Lfekj+p7GMnPiKe2RpBPcy+vXYuRdaTI6Has/O09z8i4Xiavf5Y/DPgK
         BDRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQhmXGh2MRWbNhr196FBIfg8ObgEyFDF8Ov7LQpJ6FPyupo/MEHJ2iFUe6O4asgLf6+lD7dyC6Q4TX@lists.linux.dev
X-Gm-Message-State: AOJu0YzhIHMXh3IlFpBGh964iTeYTFnWS1b+FRMndDcO7MaF5wYlkblb
	KTUFFQcOr5A0Tp2CJePnLvEfnQ8Oxr42GtptAfz2keSktvyo/71Eay6XCcoCjUjWUK7fUQD2ZHL
	l+SB96g==
X-Received: from plbjc21.prod.google.com ([2002:a17:903:25d5:b0:2ca:d66c:97b2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef0a:b0:2c9:c517:d070
 with SMTP id d9443c01a7336-2d0ca7afebcmr224927325ad.3.1786059392825; Thu, 06
 Aug 2026 16:36:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:24 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-8-seanjc@google.com>
Subject: [PATCH v6 07/51] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
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

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 3 ---
 arch/x86/kernel/tsc.c    | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 665de1aea0ee..403dcea86452 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2025,9 +2025,6 @@ void __init snp_secure_tsc_init(void)
 	unsigned long tsc_freq_mhz;
 	void *mem;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		return;
-
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
 	if (!mem) {
 		pr_err("Unable to get TSC_FACTOR: failed to map the SNP secrets page.\n");
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 09bf10f322ba..c710c71a1bdf 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1509,7 +1509,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.55.0.679.g6767b8d81c-goog

