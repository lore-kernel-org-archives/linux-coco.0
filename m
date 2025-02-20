Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C7265628
	for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740086202; cv=none; b=HvpDroQetV25RfcK57IU/YniqysrKjACKqhNPnyR1tL+t+0jpn/Wf4H2V5GagPPpJWKtgPmHoszaa3wuMXRn6pDC9ccAIai0lLQdihzXV0AWixoytbNCLVxsQ/GhCFXJDh+7DpomFEGLpHfX9zV8FOoEDb92PwAKjMVvHuXiHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740086202; c=relaxed/simple;
	bh=hk5AWDB4W5UZ+6Tp1jtEm33iRhnz3QVE85inx63D63Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mr0pBAm0A10nzlQU9A/NICHzLBBoDiMbQDm8ymXV6Ge7jjresg31dj/lbPzKhRfUYlNQVHdO+gvk7BzVpHtMb37hmOjYKgPjIsDPTDQeaal8jJr+PDu2HAsIgw/a1bkJJ0FW8LtuZjjbK+FIbfoEUy+3MhlUuOrxso+Ma0uetZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qTCTDdPs; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vannapurve.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qTCTDdPs"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2217a4bfcc7so30749205ad.3
        for <linux-coco@lists.linux.dev>; Thu, 20 Feb 2025 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740086200; x=1740691000; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=quyobmO4eU+KkdFfJQBwLa4/b8ryJDbeKM+f3W5YJ/A=;
        b=qTCTDdPsF2wCgOMGpu4vBzYIgpeT/vJRDpHqqZFXqttM+JraQRPx8DSCPoWurxVtAo
         4EG3IEtJuMd465PklXcLPUsoVccYNOA4MzEfyIKe27hM+H1yK30IJd2DWM/PkhPrRhgF
         lcNt1lvSfAZ2gUfl32wlQ8/Etqgml4mJSr6oOSPGHpmAyphEZKBeQHucpCbHxvkx4u72
         e/WxxjE2hvfwbH1NJplUlP6XTPk5ZrxkA88w6XJSqjmSgkLwUT7F8autJ237JYdY2zXZ
         rkjT2x1NhEAJ8CKhIxZGMU2A85QKlV9vEDSHOXr0HAKpoqvDEAFyXgMNPLzPm4Ra9g/I
         oY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740086200; x=1740691000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quyobmO4eU+KkdFfJQBwLa4/b8ryJDbeKM+f3W5YJ/A=;
        b=WoyL/Jyh8krtTRnC6cqk1aQKnYnXUsMhosW+wPcVlXF2K/Cmhs+jkL/qE0D+IQ31bf
         8afbKxuYzPDiIpR7ZsUUXXU8p5eJ0EkLBWXiqcwRVGrr1UVM5fB0C8RZItheUfcmTS0t
         OLCGL1xY4Myo324pRU2wUVilbH2w7K+NhvhxfSWa7dU9Cf6SoY/R0I0arJiCaeCp3CfG
         QR0HAS80zVGjaaXoT9f9QbyYccCHSSMvZctEXb/rXxs2V56X1nvXnxnGQUECREn9TQXT
         VL6VJNr0hBnga3fP8cjOhyS1/XCjzBV9BH/6bgTf4XoprON8lBU6HGS/4gUOtwThEpgp
         ciug==
X-Forwarded-Encrypted: i=1; AJvYcCUsSKrZykTBn/r8qxPIqGllRu6m6Hjnf5nZGTn1nE2ofiuRd5MkRtPiB/qte2C3ifY7TZ9WFP32fSUz@lists.linux.dev
X-Gm-Message-State: AOJu0YwzMQiy7kCiYCUU/DCtOexaGcFqwNt48YdJwM80zawJEMIxGiMr
	ec4MmDgbuP/xL9DEKWlVkPe/zxtzp7nZMeoAe5s/GK379n84pW8F7VJ5N5ughWSczRYv6fjR2C5
	zTX7z+jJwj5mf01OY7Q==
X-Google-Smtp-Source: AGHT+IFH/02hpcYpkuLearHBpYEc1K/JoFIFji35ux8Zqev6Sl2eJQqFAy9n3707vNd7DLLP/QXifjbDResJq7SG
X-Received: from pgbcw14.prod.google.com ([2002:a05:6a02:428e:b0:ad5:444f:7093])
 (user=vannapurve job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:164e:b0:1ee:aa06:1a48 with SMTP id adf61e73a8af0-1eef52f7e0dmr496913637.22.1740086200687;
 Thu, 20 Feb 2025 13:16:40 -0800 (PST)
Date: Thu, 20 Feb 2025 21:16:28 +0000
In-Reply-To: <20250220211628.1832258-1-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250220211628.1832258-1-vannapurve@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250220211628.1832258-5-vannapurve@google.com>
Subject: [PATCH V5 4/4] x86/tdx: Remove TDX specific idle routine
From: Vishal Annapurve <vannapurve@google.com>
To: x86@kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev
Cc: pbonzini@redhat.com, seanjc@google.com, erdemaktas@google.com, 
	ackerleytng@google.com, jxgao@google.com, sagis@google.com, oupton@google.com, 
	pgonda@google.com, kirill@shutemov.name, dave.hansen@linux.intel.com, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, jgross@suse.com, 
	ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com, 
	Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

With explicit dependency on CONFIG_PARAVIRT and TDX specific
halt()/safe_halt() routines in place, default_idle() is safe to execute for
TDX VMs. Remove TDX specific idle routine override which is now
redundant.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
---
 arch/x86/coco/tdx/tdx.c    | 2 +-
 arch/x86/include/asm/tdx.h | 2 --
 arch/x86/kernel/process.c  | 3 ---
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 16ac337df9fa..46f7bb82c8b7 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -407,7 +407,7 @@ static int handle_halt(struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-void __cpuidle tdx_halt(void)
+static void __cpuidle tdx_halt(void)
 {
 	const bool irq_disabled = false;
 
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 393ee2dfaab1..6769d1da4c80 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -58,8 +58,6 @@ void tdx_get_ve_info(struct ve_info *ve);
 
 bool tdx_handle_virt_exception(struct pt_regs *regs, struct ve_info *ve);
 
-void tdx_halt(void);
-
 bool tdx_early_handle_ve(struct pt_regs *regs);
 
 int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport);
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index d11956a178df..9b21989c283b 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -932,9 +932,6 @@ void __init select_idle_routine(void)
 	if (prefer_mwait_c1_over_halt()) {
 		pr_info("using mwait in idle threads\n");
 		static_call_update(x86_idle, mwait_idle);
-	} else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
-		pr_info("using TDX aware idle routine\n");
-		static_call_update(x86_idle, tdx_halt);
 	} else {
 		static_call_update(x86_idle, default_idle);
 	}
-- 
2.48.1.601.g30ceb7b040-goog

