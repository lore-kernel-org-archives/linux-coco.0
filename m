Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A708B38D40F
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872833; cv=none; b=Wz7Uf0F13mHQ8GJR4Q09zKXXA8ZVqmvHgt69RwznjuNl8w15A7FYg+OteP+qhvlIFyKw7MoyIaE+/0/d6JugrS5C+ijxL/MdGOWE5l02o0U5o8XM9wWNUbEkQvQ+aY8Nmh6rwH38+zMgS0mgFFb+t4/wgVWU9G/jvwPPckOkc50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872833; c=relaxed/simple;
	bh=IfVwAYhwhIxzw01+s7FehLy05itlzurZzA6D640hoDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rhB1K64C/Xw6RLWgWarf2mMuEdoUhSbdxja9EvhqZ9HMEICq9010Bb9evRzojpKh6Tii663uN2ErwPTuTrzd0w/ckbr6hoAsxIYEyJzyD19nrhKH89OMydYvrIbUPZ37xaCO+kmzwLpzbaXpFtKpZYFFpDf/mt8PXSKdRgE8V6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X5Imlt3t; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X5Imlt3t"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3684cb22502so72787a91.2
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872831; x=1779477631; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SQlmIR1hnrcjkd+R45vwU7fSi2OSjNiqFudElplFZs0=;
        b=X5Imlt3t6JoTN/ZSwk6ROlo/AFcT49pObftvDWX1ZujOJ1lebxZEKsnmicEbK+re4J
         EYrcm7hY9Y5cMK3VCVDVeClGPGe7LD+6izsyrGE3Z5yKbu+EIgAVEGdIy/2pBCo01CTV
         ychn/UI0KjtMfx/TdtFhn6yIPJd8y958ZOVtAnANdxKb5/yFxMwSxhia2SGe65WrxtgR
         xKidJm8yqCiSNjE24r0NyfzCQfpYWDivtcoVhPbTNICcpjf77geQ8rPh2l2LdTQ/xE1t
         wIld/6E5aLEWzz3z+HcwiPz7ba8CFccKwm/zYtGv+1r55fuNrE7bethk4UhgckT+FKRT
         YQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872831; x=1779477631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQlmIR1hnrcjkd+R45vwU7fSi2OSjNiqFudElplFZs0=;
        b=eXyKKWNQ4BDvP8O4miSWjfoxXZnrzRTfCC0RJPOPSDdO1HLPCXQdGXGc6QpbV8Xro4
         IVXsyZ7vdCSZrdux20BYlaRLoLrumTj+wz7CxwRp3huZTkELQAF4m4VahYal8rkr/htl
         seh6+FB6kKQvlwplKKoKE54YZV6ELzT4bSpLd3hUfwA/9b4CTVc2xxGFw0mm0ZUdEMI+
         5jMvpkE7dS3y7EcuaotgK6cf3Wp3ZhzjmYoE+nVB790Ikct7TmGDus4qastgcFmqu+Kl
         xRpeVyhYkSRZXjUyag8ysAMgpdOue/UyGS+NxVQWsYXMupODloj4yFymm2WtYcM9kKYC
         9UuA==
X-Forwarded-Encrypted: i=1; AFNElJ+605NfctfpYx4yjKl3LwzTJmyQOzuQ88PVCGm7w78YRp7tlp5hEn5zmLQYq/U5AccyNRUuUgkpKFiJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwxSHPNR3T4ItAF7GsXAjUlb8NCCfrb/R6jc9n/xIUtFhUpU/mC
	IZXs/23cA+OWNXUyZfNFPzQyhEc2kKZNJB9P4DK+lQFR64IScRno2qC+t+BAkPIFiqCVW92spRk
	9uFFBDA==
X-Received: from pgmt14.prod.google.com ([2002:a63:224e:0:b0:c80:2399:151])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc4:b0:368:85fb:7b8b
 with SMTP id 98e67ed59e1d1-36951cb936amr5644652a91.22.1778872830766; Fri, 15
 May 2026 12:20:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:07 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-7-seanjc@google.com>
Subject: [PATCH v3 06/41] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.54.0.563.g4f69b47b94-goog

