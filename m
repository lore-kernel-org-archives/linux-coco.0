Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16D4A3166
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059417; cv=none; b=Fcfu5DC/Z2kL5be+HEupVpooGZMCHzBRjdZaqOS3zTXv088qZNBuYTM280S8SF3TmSFa5a/o7WAuba5n8b9vjSi+nRu4dW0iF6DrXrQkqnpGtRWpVAm8dTvlDPjzv5b2a6y+upY4ihS3vlIXhOH/Nr0sNcje0OIQujusUPDvjuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059417; c=relaxed/simple;
	bh=rjQbLkkx2ub+8kt+Uu6IBZg4kMe4fhwmXJTlShW4cvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=au8H/r9qsidMygrofqFQooyaIJ9ILCOhghj46NAhNr5Xx1C5OuXiEm606SPphFoxzmLUwzYFmypRVejAvz/+hYsvqMe5NMopRLls6gzcRr+GEgt5s3PflyRAf1+htdcLWQ2X+as+vSPF+6m/2gfewMUrEuiEJ1b/zrIdTXKsXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+ZtghjJ; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+ZtghjJ"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e4ef9a74aso4706564b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059414; x=1786664214; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RXgfgHNb2M05mbaK7fzwXMNXNJyNMqWfUYS+q8iqpyw=;
        b=S+ZtghjJiYnMB6nvqQzrH+ig7HxsMwDGTg0NgxMBAeDwDiGlVvxt5C3eeAazujZJO2
         qx/z0aaRQxYymAe9AD2IdzgYkd2Swsy6uPr7UwZpFfECD7BzBnw2FTfESJZC1f/pU8RP
         5PeRvPwNw6vXRMeidoWmdeX4lqgPqE8g6LfnNZG6rRAZSdz1Rr3lnCoIkO9RBVSmHwfv
         J2+ALEme0h+wfyqgZH1nN0vzEgeWWJFxY/+u39dJXeMMqRYkkchAnmWCdAT6x/ojzGf0
         wN0QeqQ6cLa7Hts7SwQ9KEK6VKRH5k11hrWvpHnioAxMtkIFiJkP5pJWx+Gn4OJzVrn2
         ojKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059414; x=1786664214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXgfgHNb2M05mbaK7fzwXMNXNJyNMqWfUYS+q8iqpyw=;
        b=LN0ms/vkfWAlKgF0MUWlki4xPqKebqk0MpKsBzBVIs7k4QPkwOL1qfy/L6UT8gIN9g
         SB1VUOP8uDz+PaiCO/9IM8nomNJVQfHEXmFPJZzPzKnRlCrRB0WAzOkkVd885eWQnRZs
         mc24dOURBwT910tCnDIqcRcmJ7iXgGNaR1HBRHiL71j7XknACVAYxjA7Q7VLKy20zM1s
         hJs+7MypKW9QfbSxpacgtvLP+pXaVVIBGWH1p3k4pKwewFd86WYRz+dzhPrATvm8eHZS
         IIQoCWenNZSWKdWvv5y5Z/YpT52oGjIV3IgiqNuLRzbHkGuovq3yX/r3NLnGCHeAJDzb
         PxAA==
X-Forwarded-Encrypted: i=1; AHgh+RqAqZvYEwN1EjClwEBzKNunDTJktVMrUkInvZZpi0M3Y7aSAq6NsbLY6C6yNYyGPMbPuwWBfUvQca5d@lists.linux.dev
X-Gm-Message-State: AOJu0YxcX/KxDxoCtbATj1dAtWnP6HJnQ5Tu0D+zU0suQCpsKQ8CIVcb
	ztMFd4Y/R0i3u37jHLZ0bVBjtXtcxL/nJFXHVJB/5eifJeDzU7ekEy3noFvw1q3TLXb4KMafjkZ
	9DDQNrQ==
X-Received: from pfcy7.prod.google.com ([2002:a05:6a00:93c7:b0:845:e683:1287])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6e81:b0:84e:2bb:2d3e
 with SMTP id d2e1a72fcca58-84f2dfb4e50mr16994834b3a.9.1786059414067; Thu, 06
 Aug 2026 16:36:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:41 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-25-seanjc@google.com>
Subject: [PATCH v6 24/51] x86/kvm: Get CPU base frequency from CPUID when it's available
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

If CPUID.0x16 is present and valid, use the CPU frequency provided by
CPUID instead of assuming that the virtual CPU runs at the same
frequency as TSC and/or kvmclock.  Back before constant TSCs were a
thing, treating the TSC and CPU frequencies as one and the same was
somewhat reasonable, but now it's nonsensical, especially if the
hypervisor explicitly enumerates the CPU frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 255a24a99f28..83b9351f2810 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -50,6 +50,7 @@
 #include <asm/e820/api.h>
 
 static unsigned int kvm_tsc_khz_cpuid __initdata;
+static unsigned int kvm_cpu_khz_cpuid __initdata;
 
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
 
@@ -930,6 +931,11 @@ static unsigned int __init kvm_get_tsc_khz(void)
 	return kvm_tsc_khz_cpuid;
 }
 
+static unsigned int __init kvm_get_cpu_khz(void)
+{
+	return kvm_cpu_khz_cpuid;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
@@ -1043,6 +1049,14 @@ static void __init kvm_init_platform(void)
 		}
 	}
 
+	/*
+	 * Prefer CPUID.0x16 over KVM's PV CPUID when possible, as the base CPU
+	 * frequency isn't necessarily the same as the TSC frequency.
+	 */
+	kvm_cpu_khz_cpuid = __cpu_khz_from_cpuid();
+	if (kvm_cpu_khz_cpuid)
+		x86_init.hyper.get_cpu_khz = kvm_get_cpu_khz;
+
 	/*
 	 * If the TSC counts at a constant frequency across P/T states and in
 	 * deep C-states, treat the TSC reliable, as guaranteed by KVM.
-- 
2.55.0.679.g6767b8d81c-goog

