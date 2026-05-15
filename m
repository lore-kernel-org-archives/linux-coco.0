Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE3940EBC5
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872877; cv=none; b=cpx2iYaOmgjbpBCSM9I+YID41VPjh6xjSjaSbddppyJB6EEWbcJzjh63v7+HbequrZU9M4WkjR+GBXeuop+Na/ItQyARGVS2jvVfUSkrv9E2dTiSCS+LhHyIszb7d0NVt9GlPXc+T5C0q4veH88shMyR1KX3Ea344f8rxLiy5OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872877; c=relaxed/simple;
	bh=GcjjOomxWCHwXqJ+DzUBCv/BxVAVHsSL2Hl0ee8rM2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gbGKaUQCL25+3IzFotPOcqBDUPMl7LpBpNi0cRFV4+GR6UcurNTc+0smty7WV80JU/idJgsnfiDqF721mMcUKz6N9Ore6ys7jVCebeDu2u8lHlJ26Ciy6SlIXTUNH2qVwNxV61pkYYZdZCrHNQUGf79+tqgoNV32iELemFce1ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AWFWkQOd; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AWFWkQOd"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so145583a12.2
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872875; x=1779477675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm1yasCgCkYBCfOrXX2peIQ68HcxfozY1zg+bDbrsDM=;
        b=AWFWkQOdO6jMhnJEHkYHXH/VpuvbmO+Ws2T2vemH0/sLInfpA8r6Zix7R+J02M26Z3
         pnstPPK6/jEQjqv1V+TVL+41slSSEgi7b9NE1ZpSbUyvDj5Xea13PKOR/BJL/SVhwfYq
         bzTijNgr6lvH4rMQKqGcujZkiYNrQb/sMTA8LfusXHZkRLDhbAPIQZQINjU3UV+OY3Ua
         /l6cPFxbzkuh6TvLCfteYWnbBCuwes2nUywepr+pWKLtV3Jhne4PHbqSHxssR1OU1nO3
         nUMmyI+ZfwjJxj8L87dTfA4bjMdzRDv1bqX2nfFqsYVYK6nbM4Y+hfPMJokGr2DrKHtZ
         RIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872875; x=1779477675;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zm1yasCgCkYBCfOrXX2peIQ68HcxfozY1zg+bDbrsDM=;
        b=gj3wioLiwG1i33Z+mpU38BK+x029U9bM1V0LRDuOGqDBxo4opWbVftmHaKQfm0cq5e
         wSKsUq9LvM2h4cWTv3eaqLZnPhw+1QjgeWt9zCyVo71lgi5WkSQvDUz44OGUDdktyZk4
         vtuaZdqihGl7JL6M5KTi0RwnbVpBsfoCYRECnA5dFi//qorqJwJCc5zQQnnCOdpb0Cq5
         C78hkZIl2iDK5ajhLXQisqo7UJNkTOLp8deTWx6oGbmxojXQemZVOpIeVUXCI6x3Z/rk
         aeH5tCHDmoENk23Zq+NBKF3PTaXV+ST8a1AC/mNW0+8OAPp5U/39Gal6h8SUW58wqeBF
         436w==
X-Forwarded-Encrypted: i=1; AFNElJ90KxgXb1JH1N8i2rkoegzLvjWfry9/5MFL1hW+4bIc7Ly/8hATVN5cUpC7J2lmzmeqSmdlKx/wMUgR@lists.linux.dev
X-Gm-Message-State: AOJu0YzNJQs/hou2wMssYXFa041+C+C1gFXvQTd+u17Jioktrmdgo+eJ
	CYk9WiHqvkaHxpY/a8IclndJ5zA77dAQDgoSWitYG6RrGXNfjSkhdQjhqgOb4xqfMrcqi2Y5tD9
	OEopCAA==
X-Received: from pfvo27.prod.google.com ([2002:a05:6a00:1b5b:b0:837:e90f:8cd9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:338b:b0:838:9e25:f128
 with SMTP id d2e1a72fcca58-83f33cf0bf3mr5811988b3a.26.1778872874478; Fri, 15
 May 2026 12:21:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:36 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-36-seanjc@google.com>
Subject: [PATCH v3 35/41] x86/kvmclock: Obtain TSC frequency from CPUID if present
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
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

In https://lkml.org/lkml/2008/10/1/246 a proposal was made for generic
CPUID conventions across hypervisors. It was mostly shot down in flames,
but the leaf at 0x40000010 containing timing information didn't die.

It's used by XNU and FreeBSD guests under all hypervisors=C2=B9=C2=B2 to de=
termine
the TSC frequency, and also exposed by the EC2 Nitro hypervisor (as
well as, presumably, VMware). FreeBSD's Bhyve is probably just about
to start exposing it too.

Use it under KVM to obtain the TSC frequency more accurately, instead
of reverse-calculating the frequency from the mul/shift values in the
KVM clock.

Before:
[    0.000020] tsc: Detected 2900.014 MHz processor

After:
[    0.000020] tsc: Detected 2900.015 MHz processor

$ cpuid -1 -l 0x40000010
CPU:
   hypervisor generic timing information (0x40000010):
      TSC frequency (Hz) =3D 2900015
      bus frequency (Hz) =3D 1000000

=C2=B9 https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c
=C2=B2 https://github.com/freebsd/freebsd-src/commit/4a432614f68

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  1 +
 arch/x86/kernel/kvm.c           | 10 ++++++++++
 arch/x86/kernel/kvmclock.c      |  6 +++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_par=
a.h
index 17053d2bf270..3f7f558b5b24 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -129,6 +129,7 @@ enum kvm_guest_cpu_action {
 void kvmclock_init(void);
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action);
 bool kvm_para_available(void);
+unsigned int kvm_para_tsc_khz(void);
 unsigned int kvm_arch_para_features(void);
 unsigned int kvm_arch_para_hints(void);
 void kvm_async_pf_task_wait_schedule(u32 token);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 65c787b1ea03..5cd92a0b156a 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -918,6 +918,16 @@ bool kvm_para_available(void)
 }
 EXPORT_SYMBOL_GPL(kvm_para_available);
=20
+unsigned int kvm_para_tsc_khz(void)
+{
+	u32 base =3D kvm_cpuid_base();
+
+	if (cpuid_eax(base) >=3D (base | KVM_CPUID_TIMING_INFO))
+		return cpuid_eax(base | KVM_CPUID_TIMING_INFO);
+
+	return 0;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 47f7df1e81a0..5ceba4f3836c 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -200,7 +200,11 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action act=
ion)
  */
 static unsigned long kvm_get_tsc_khz(void)
 {
-	return pvclock_tsc_khz(this_cpu_pvti());
+	/*
+	 * If KVM advertises the frequency directly in CPUID, use that
+	 * instead of reverse-calculating it from the KVM clock data.
+	 */
+	return kvm_para_tsc_khz() ? : pvclock_tsc_khz(this_cpu_pvti());
 }
=20
 static void __init kvm_get_preset_lpj(void)
--=20
2.54.0.563.g4f69b47b94-goog

