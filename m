Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6E4A8210
	for <linux-coco@lists.linux.dev>; Thu,  6 Aug 2026 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059436; cv=none; b=MVyaw+6vfzGoq9mm/KdHUf3x6g49xgg9UaHfB2CTCuN45L9ulK5Bv6xvwtPmgdBK4dBx2e6PicGJF93a+rR9T5RDrgl2Pea8/riSHT1GJ2SFaTafGEaQ3mD1DTDi/7Cr9R9ug2h1aueA6Q24NknfKUhAhcIMzV+glOLFMwjwjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059436; c=relaxed/simple;
	bh=QnNlfXQgGwJN0/JkuWp/4XAMGB0Vt5ulI8HR+vmeXt8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cCqO8EdGu76LFMufr4/8DnTgC+Y6gfXcAEMR0FwKS2HCHVUln8d5fvR3DeeuWkPTtAC7mLTLXWwGfct9NxcJSiP2ERg4vJYlN3gb5i+pZKgEx67A5ZZFoibygiWQKaWbnw9uBConHU8UmJwOMfKCC1RDXj1dp/3aWy6igQ5r9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmSsM05k; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmSsM05k"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2947135a12.1
        for <linux-coco@lists.linux.dev>; Thu, 06 Aug 2026 16:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059433; x=1786664233; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rt852L9wHdv0bDRlKJAMITX85TrVIH1oxytQu/w6xUg=;
        b=RmSsM05krVVjnDRsEAOdwsWOjRjSmcIiCk7M3oYpVa0eh6bZD9C4JNYec3mjg3F0Mx
         3FCuiQkquoe/JTAoMItOjJehK/DSjkNDReaU3kFzYXoANsPPwZqUlOzXnDmsffE52PNY
         WsBXkT3fRD6CfdeCae+N2egFcTU6bks9MzWQGM8v+zJIvST+4nmC6vAOvZbvVIfDuaJX
         gKja4TqOORNMgREPIrgi+tzsFDd7goVuMECNpLgI02ZsKSlcSFK1kbH7FNYyFjKhTSnx
         IIiB/OOMtrl40nGlyKOBLighXS+39HFlMkpfeqsGD1qZ7TpoGhUGgZKlE3lGkD9/3s/7
         3trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059433; x=1786664233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rt852L9wHdv0bDRlKJAMITX85TrVIH1oxytQu/w6xUg=;
        b=Z6ipldu9EAQAZZVm9BMYa7wvbKwyGkGIhd7UJA/ZK+MclukWsY4iPE/3A7aDJZHRWH
         Ot1ZvLppiUzsk66tC+gdOxSNU+3s2FH+bGdXUJht+tSni2wsEm6JB7RFDKGDn2oN4Ckg
         eC5hjVTnCqGoNdn0U5SzIufHb25PjAQjpqGyAQoOjABhZNZXhH+tOTYjDHklodAuayQ/
         CIOAzRqdwLde/FspGtIHa/2+NlAO61tFsHwbAYv4qs7T1kgiXg1POnRgmZl+f6dMmhcZ
         rhnUwsMl6WI7q3siC8uPaRp8pstEURIf3bRwFDvWy1+OcIbT1WCbvQqBX/+lkUfkv37e
         oVNA==
X-Forwarded-Encrypted: i=1; AHgh+RpYA9PndNbi7o1738vR1FPP998dapKjYlCifY5OtvfOz2J1l1MrQOg6hU3tIzEdbN/RUkVApeRFMwmr@lists.linux.dev
X-Gm-Message-State: AOJu0YzuGTXf6sf8dmNijNNeDvC78grBTkN2e2Rd/XjHxxEQT+3Ee6Ei
	eMLwNs065aUxrWQWJuSf/g+6JStnCfUg3mSwjYHbJDhqT1I/0RIB6fGwjQZSBJ2sVG/2b8VX112
	yM90W+w==
X-Received: from pgkd23.prod.google.com ([2002:a63:f257:0:b0:cbe:7907:901])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52c:b0:3c3:812a:2198
 with SMTP id adf61e73a8af0-3cb85df190amr24070365637.4.1786059433092; Thu, 06
 Aug 2026 16:37:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:56 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-40-seanjc@google.com>
Subject: [PATCH v6 39/51] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.55.0.679.g6767b8d81c-goog

