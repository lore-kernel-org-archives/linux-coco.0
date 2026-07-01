Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0714DBD75
	for <linux-coco@lists.linux.dev>; Wed,  1 Jul 2026 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934371; cv=none; b=YZgemdln4vdciGVIMmqMJ0Gs9/JVsI9svlHIv2yjBCfdu+VL0OG/raTIvoBNC3/BX9Fvg1dLtTb3W6T4e5khE48/XLdAfxXcJ3Ts/Ax5HGYqgVZQO2uiufmczFqu35PBUrtCXA0pAakBiOx4p9Dp8WI8sQGotT7YGpzYYhXmwxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934371; c=relaxed/simple;
	bh=LqpoY1Xy6lWAOBZfOfvu2nbWJoGoJs43yElnN9RLdxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SikyuadOgcRDJctr3iR17goR/iA8RrI1AROj16nZDttpX6BCXo8sq6PBBEFO1AMTJws6xtbOHx04dzbNskBBk7wg5pARtcs01TtkBdpLg5XxYCn5xy2rVw+UMo96+DfsxCvi6JvZzM8kqpncXO90KGmWEbjAUbB0Qmwb0/BQ8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEBaNbeq; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEBaNbeq"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-380b630c505so623677a91.1
        for <linux-coco@lists.linux.dev>; Wed, 01 Jul 2026 12:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934368; x=1783539168; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=iEBaNbeqAjh0vbTScHpJCpRiFGhN/j4wmZLdqURjRrVx7+eB3vVeignr1ojSNicj1g
         XT5tHwwR7Slk9Ub/o5qwe3ZkDG3/QOdEarnJc3HV1Bpn7/FcYXvN573CkKe4LCq7d8nh
         wx/6HCC5EOQNp5ShgNp4IHDnMuCbpmBxrSu2xmeU81TpYq8fvShUJ3Fe8GrkZjA4cmXi
         S8dcaCFuDUfgcXcQL40PJ70SNFdMt5hNKQnigjV+fqzEjDjYoP1rYynpBIJqVwNHjmxE
         V5FnvYrhUNEoFd5aJpoBZrrKNlLwEzYJsqAE+HF9gHBOabMczjwsZcoF+oWzyLPopPpl
         oCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934368; x=1783539168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=mMh4x5Z5Wfz51enh/3UdKRNkdClAlIkUHUwZC/2Rew2iAfoCOAwHRIMr64PgfFLRqp
         RPsjbekRmWnnDIdHCmQ82Z/kLCvARvrs48LYDq29xG4/tQyLJAqeVGOyeqyIfKk4Egf4
         c2eDgix08XaAIFY7xGlPoZv+xyyt4rgcQIorI6xtfPCKAi/k2BV6jsUsryceeD5VEN3d
         B4IB8d1VMSmRK0+EdDpS4tNnS67Ap0BEQGQmvinRF0kjU8uQcVRNAZQb2qOow/f/jsUR
         CRTGcQp2ohzoINlBkk9EJe8VbF58zvXAV7qXOn9n5883KUvwx5rc9b787eqIxYljELL/
         zFdw==
X-Forwarded-Encrypted: i=1; AHgh+RqQy7PfFno+90zULI0sVyJEl6FLXqVnkQImfU0lxITPYSsaixf4fg25K1sBUNVPtzhzYSRD6oz76Lwg@lists.linux.dev
X-Gm-Message-State: AOJu0YyiJAZouP5uiGL7kk10ZvGYem6BTWdSMVrpzduGvexISn7jaGdN
	YTjYXjJwjJ+VTwZBH9hSxHO1Blu4a9winhHhdVaW0vTc620DQwborBokJA9cAC1mAIoNBJM3xAL
	EHl3aFg==
X-Received: from pjbca16.prod.google.com ([2002:a17:90a:f310:b0:37c:9369:8b75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:37f:d6f3:450d
 with SMTP id 98e67ed59e1d1-380aa1313ecmr3162862a91.14.1782934368170; Wed, 01
 Jul 2026 12:32:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:39 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-19-seanjc@google.com>
Subject: [PATCH v5 18/51] x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
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

Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz() in anticipation of
adding support for getting TSC info from PV CPUID, i.e. in a KVM specific
way, but without non-kvmclock.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 35a879d33e9e..061a22d31dea 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -136,7 +136,7 @@ static inline void kvm_sched_clock_init(bool stable)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned int __init kvm_get_tsc_khz(void)
+static unsigned int __init kvmclock_get_tsc_khz(void)
 {
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
@@ -146,7 +146,7 @@ static void __init kvm_get_preset_lpj(void)
 	unsigned long khz;
 	u64 lpj;
 
-	khz = kvm_get_tsc_khz();
+	khz = kvmclock_get_tsc_khz();
 
 	lpj = ((u64)khz * 1000);
 	do_div(lpj, HZ);
@@ -342,8 +342,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
+	x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
+	x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
-- 
2.55.0.rc0.799.gd6f94ed593-goog

