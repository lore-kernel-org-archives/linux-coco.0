Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B3D490BF9
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059396; cv=none; b=sKdazlSSzV54JWTuPfGKI2Q6LAFDNrxUlYo0oK7ZSn7QkYyTW7Bq68XjXn1m4pjot9kYkzmI+QHzZH3IX4zWjSCl99SwleoOYqml780NSSw/LcPBa5BBINCVlKwf+UQ5VetnVFTOjFw1Q96nPr1ChWpWcVGGnf8XGEn9rXQ2RGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059396; c=relaxed/simple;
	bh=aU5kM212JBkNYfzrGASMdLJK5GDFtg5whJEddSUurGY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aAMIxMKsMvXfVf2EGqA4+CpVocLBmVptHf1qOOC0BG4BzAn7rRAKtVMtrYFNGSFhwJJOoI4k+eXTWm4zdQj73TEfpyrRRQrOhaTf4wB+AmTAgdVfE16MzuPMIGHp+GSYSkasqqXGAqqoE74YOMRxZi6Fcp9mtXIjbwTWe4bY1AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rwk24Jo+; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rwk24Jo+"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so5540533a91.3
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059391; x=1786664191; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JiQKL/d/a0vrWgDwSPI6P4lMZN4rNkkCCv7n67xdKiQ=;
        b=Rwk24Jo+LZgWrccKS1j4QIkoKBhm5Ry5izMD+ej5OnZWZvht8hwDIbVZ/Uw+HyzZP0
         qs0ol7gVgSNhUq2839CA52Dwv3quOxWalw8CwPgJ1BOzKSGHXDtSvaGd3FW6nmcAvIKg
         YLMxUl+WTdwNy2a9oXUtmV7mdoQir5vbRRwe7TCvWw2zwk//qNgRx8R3BW3Yw1x0OF2U
         7ooL9SmRRVEiJ3GluvZEcYZJxb3QL6OriVeOdtPESX+7ZKG5uMHB1EPVq0eZk4ykxnXn
         +kSNh4bMteC7W+dpg4uG/dWSJhnqEKiN9cvmqtncCHSzWU3M3SHS3NaKCoRvs09svOJ/
         m7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059391; x=1786664191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiQKL/d/a0vrWgDwSPI6P4lMZN4rNkkCCv7n67xdKiQ=;
        b=ao/q652f2+l5cAGqUmsoYPRyBSmNWJE9xAyi8/QRPnHZ489Ra2ZVQDqljLNzSAQWYb
         K5AcFhcCXkJtXp9dI8JV++IF3pEtOmc+K1qzKW4Dav7ohGPgPR93A3dBMFDWTztw5rk7
         l7ZUaEm7JMcEOKngjicF7V5Of3CGJ8XwV6RKoQ77g5V2/dGpMVdmXue2XeOckxamhr+f
         6p5dW0xULuGJXljQLEnvSBMa4/p/buui/3kFbFDa9CGdJldZu74g7fPM3RlBkuKfJ+O6
         VM1RE+Uwx6LFFqQmXtIRDdKRY6XLkAeSfWiyvPqcfMybD2MJWXhL+mpPDEp+K5UD8X+e
         YGkA==
X-Forwarded-Encrypted: i=1; AHgh+Roia8rQC39xIHXNMHcjCDW5Xb/b7vxE9shKDA0zFc2O3EgQY5mnrFEv0sXB86QYalT+eDRhTracuI7l@lists.linux.dev
X-Gm-Message-State: AOJu0Yz46/qXSoJcdmavbukoPuy5FARMsDpLk0lExrAmnjoDVe/vz34N
	x2k9sAqdN1JyYvhEUnv5Dl6MFFhw4JO8MfoMW50OL/4apSjxS7kMoVPjYBvoMeBw5yGUoWuXFTz
	ABsjB8w==
X-Received: from pjbsr12.prod.google.com ([2002:a17:90b:4e8c:b0:383:a728:1317])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec86:b0:38e:bbf1:de34
 with SMTP id 98e67ed59e1d1-3903c537a12mr20234960a91.7.1786059390540; Thu, 06
 Aug 2026 16:36:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:22 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-6-seanjc@google.com>
Subject: [PATCH v6 05/51] x86/sev: Mark TSC as reliable when configuring
 Secure TSC
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

Move the code to mark the TSC as reliable from sme_early_init() to
snp_secure_tsc_init().  The only reader of TSC_RELIABLE is the aptly
named check_system_tsc_reliable(), which runs in tsc_init(), i.e.
after snp_secure_tsc_init().

This will allow consolidating the handling of TSC_KNOWN_FREQ and
TSC_RELIABLE when overriding the TSC calibration routine.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c      | 2 ++
 arch/x86/mm/mem_encrypt_amd.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ecd77d3217f3..ed0ac52a765e 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2037,6 +2037,8 @@ void __init snp_secure_tsc_init(void)
 	secrets = (__force struct snp_secrets_page *)mem;
 
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 
 	/* Extract the GUEST TSC MHZ from BIT[17:0], rest is reserved space */
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 2f8c32173972..6c3af974c7c2 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -535,9 +535,6 @@ void __init sme_early_init(void)
 		 */
 		x86_init.resources.dmi_setup = snp_dmi_setup;
 	}
-
-	if (sev_status & MSR_AMD64_SNP_SECURE_TSC)
-		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)
-- 
2.55.0.679.g6767b8d81c-goog

