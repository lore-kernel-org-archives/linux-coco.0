Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179783E1233
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872850; cv=none; b=JnFQDp48QQzOeMVQ5gCBC98xOrEXoplEgR0SSEJFkJQzZuMVc6s1Iucr1tjYZEmbmHaJQXKhCAjYg71Thakh8p2N3+TlE0ODtioE2rp9fKgsX/qIp4thZMSepa5ja1Gixp24m8Yef5V9bvPBwHc95DsrdSSMZRCd4Js0Yj3OgQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872850; c=relaxed/simple;
	bh=7t7bZAkjWH8tEuvlMroGRphDuT5a2BO5RqjwXybBung=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I5F9cTT1emUpECFfmpOLGXfoayyTgpO/IBaZiYqCRmItL0gWhFj6/8GzSanJo6wjgHb6N01S2GXkhkkESCwoFhMlR9P/rwhidctVIsnkfV1Iqh22U2E6luCpny0b9t/5/+twDjBCLVJb6tB0S6m1qRILACu7mtJ1X/6rg1jHP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICEgfvG9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICEgfvG9"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8353df9bc7eso223284b3a.2
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872848; x=1779477648; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c0VSXuwvwTL0EdvBxlPRCLOC48TzlA2S3UU4EaITdRg=;
        b=ICEgfvG9mscE7boNRUqgd9ZHKO7hf/Gv/vMoImo9dKy86hCDEAqzp7rK0fCz5PKRQM
         nbG1ltUvirc+/RY9DAoW4SnTx5tzqnWnkmA+8tbEVPZnQUel68bWX15t9VJTG8nhdARF
         Y0reArQg9ZBJFoh1IN1AadXFTe94A+r7nlidXo8SsR+OW+S0ZA9074M54x5SGUsBxGYB
         KPUOrJp+dzp5JvZ0U4Xebv+nCZRmjQOUZxBOHoHEEHD01MNOUDrj/wT7AR2mCRWTGh0w
         b23ktxvyZCz9QXmbUfziJFUcjQ21gMRrkdD+mkLRQJa8Pg0bTK6I3rdv/8cJNMn/zAWn
         iTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872848; x=1779477648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0VSXuwvwTL0EdvBxlPRCLOC48TzlA2S3UU4EaITdRg=;
        b=kA7ABeiUbvtrKwJ1mEOokaaX1yvPJbSPsBISfsCwTIH11Hqqkfxs5toemRowANoHNP
         OmH8AbkI1dcT8CYuQ9tw+rH0S01n3pgohIEeYUfK3ZMRnvLcysLWs3Rf/fFr+UhkZLJJ
         GpUdlMXS8NtecO03Y3ZqZknW2zzpoH5s/eoDwcSpoYvx6sVovjiWPMpskub7C3l9Zb6i
         m/pSkH+XoeggAmBdJqVPLcXk2bp+1/XZmmgCP2S7IY3NMkdraOBESTg+6Yjew19vwfFH
         eEFHLUJOB7EYuAdzM/a/nFaOMlxwGaF1+cMaFJpocjSX6ejZESzmEOJFPdknsLdUrGFf
         dxIA==
X-Forwarded-Encrypted: i=1; AFNElJ91rHGITQNFLxorpUYr9VzkU80/slI30fM9ymyVu0GxnhR+TBgaGGC5dKtZEalBNSyT2MgQxw0l8y9/@lists.linux.dev
X-Gm-Message-State: AOJu0YzLPEjnyMQL6T1LQgMeA6qYPWpRYKWKIJSGJviSYYZ2u/Nb5wic
	jtUaIS657w12awUdGtO5bm0ZUy+kQsqey2Wdet8GeJge/iGK8IVQMxyadLnRzox+c/QIXI7OSBp
	4mBWduQ==
X-Received: from pfbff26.prod.google.com ([2002:a05:6a00:2f5a:b0:83e:dfc6:971])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1908:b0:82f:50cd:e586
 with SMTP id d2e1a72fcca58-83f33cb2c40mr5886442b3a.13.1778872848066; Fri, 15
 May 2026 12:20:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:17 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-17-seanjc@google.com>
Subject: [PATCH v3 16/41] x86/vmware: Nullify save/restore hooks when using
 VMware's sched_clock
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

Nullify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index b88d9ca01202..b5cb66ca022b 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,8 +347,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = NULL;
+		x86_platform.restore_sched_clock_state = NULL;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.54.0.563.g4f69b47b94-goog

