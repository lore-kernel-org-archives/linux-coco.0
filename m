Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690153;
	b=z/weSJGlk6dysUJX6LAAgT8XxmE2oRmmtMiaN0shuqdjKTWi0folhv9ZjuMIwbgMbIiF
	 PHx7msvD7CKOHhPcScyC72/BOiz3gG5gldZ9fW2WyFAkJ/hN7e8r0ZJFVZsIcgXojlr9r
	 LhRtr/r4rHz45CRTrwEwWUWMyIf84TvwOeYVr4K+MHK3NETDlwUSCWiMD6Wooc59kf4Ud
	 ZvThTRxgt8w4zaqAR0X4/eBdJRvSBBvY3hEgEtshRWSx0BdmskrTrfTsEYFbuOw5ZPyVK
	 5U3fATNEhwj1jsfVqh+HkKWwWWCoj2dWhd47eKS+Csy2BwH6A3xYNMn1BA+sRbeUeKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690153;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1wn8B8AtBDch11Kn2VubYj0NKMdWprvKTv7qKouH7kM=;
	b=RUz64fKL5qIN51ixSuGhoVzvv+DE7dGRLCQfzDhD49RRSkhW3vCpTuk2WsLmlhJe1nA7
	 ELxwSJHfH1Vsd3C3SHcf2C/nbZMdwPm8ufsGIi8Y6nQtbhybSxedQSG6dKMRU0slmVXjJ
	 IPEveiEC7DlyAZ+LEvhyiNZU6Jdtywv7UEzqjQfH9OPLi/i9jjDO4WDYaNBUncqEk6rjg
	 b7lsEch9J7VL8UzsBry1HGVM6Ye0G6R7ZY6sg/E0rSg5zarYH6V3FuyDzAVCLvJ6Y2kHp
	 hiGw+7QpIZN/CG98rULJySEUQ5V924AbggnW4S24WYOLvtAvIdStOfVTvVl4cu1oBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MDtNYgYC;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2178606A32C
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2178606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MDtNYgYC
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f20b304c0so364555685a.3
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690152; x=1794294952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wn8B8AtBDch11Kn2VubYj0NKMdWprvKTv7qKouH7kM=;
        b=0pHPzu75FjTjdGtv+a4HPAk2DLoC4Q69nFmHZXf/Mtjte/bXbRZ4g4VXQ8z6Rl7ei8
         iewPNhowfW2E8JwLawtWst+ESwqe+z2SJ9nQ2KXyvh9HFXlfPnnidiaw890ErH2SmD47
         zLlKJ+EmOSklUcCCRO3kBEpdDA7ZwMK0Nvi1zeceqULY6CiZ5/RxTmDxzP/KVZVuJ+JV
         8oL+cWB5O0iNZpFbHAAay62EmqySa/DJHCkwNDLWQfGpnlEQSMfom19ryBS67zo5Mqi3
         xAFXlih8ZJR6egbWFxI3W9xaEVYiUxh/MFriU+8802Yuk2dsbz8PyDL0KlTjU9KiKjEV
         72Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwZPU+afPo+nf7xHMjuttx+UkaLS73Jx32SblAu1u8SDeJG6bcoMnwKv0/Q7zBRXfBpneAAdeGNgCb6@lists.linux.dev
X-Gm-Message-State: APuU4Z+S28HpDocmJ333Q9Ea2/CLykZkhiZ5HwxfBLVAs78uUgztplWh
	2rR1r7W2dc3cKcj7iOCVl5lLjLFraBIN4Ft7ep2vgFteS7HC68SLsNC6HpaUrh94Pz1Mjk2bg1b
	QP66EbO0ckDJKRUBu3Zuh3Cbe30/WizfMRiBEmgmhPrqwGt7r0HDWrAwugISnqXLyvfNV2PRVnK
	B2ALsnZ80H+bYntS2OIcr/1dTMGMpm/JFg+/YetzcGuZYZoYRyOVXI3pK1si9bcQViX6x6QtuBH
	P0159VdFEAddQ==
X-Gm-Gg: AYBFou1NKLBaLG40IDW6S1LD3/h/CKm0OcGgIsL1A9f2EpWKrByjEbRWjRigbVMrxff
	ySZX6D+ApZLyPJl5zjOPJetHR6MqEkcdmS7qBojSmZH/6atejTM7cK8w1+GzUpfIoJS43hEy84H
	pY6e3lUNlJVT/xz2EBmvCMzwGjWjXgcYK1iMT+1aDjDeZIp278fl8Vh/icLXjFO+hD5QO47KsGV
	ocaT/5ZIoG7hdvXfEz7CXPNFGMmwQ/OY/+XBRPpyH3X1hB+MRnQWKsfki+OqhEtuo5n7xfYsMzc
	ZtdQ0mgBGzbsG1uL3BdjlvTXW6dx6jgy6aRk/k+nozRyze9q3D/6n5YFMys/+d7SEEPqfMWBFtl
	FCINpFDQfpEV8wkJLPDf9pDLTaECwE1ipWfjqdVR+ssDBotb+f05B25j24h9jTk9Q2iFFdKGOzM
	z75mL5eTdMZZ+Z1QBUGFesUxTOBKHOhbAn
X-Received: by 2002:a05:620a:8801:b0:93e:48fc:aa85 with SMTP id af79cd13be357-944216c08ccmr2008610685a.43.1793690151705;
        Mon, 02 Nov 2026 23:15:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944255c23b5sm108044885a.3.2026.11.02.23.15.50
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:15:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so624840885a.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690150; x=1794294950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wn8B8AtBDch11Kn2VubYj0NKMdWprvKTv7qKouH7kM=;
        b=MDtNYgYCMLpS+gKBKirLfUopdR6yId1op0a761D+Haao4xkydc6IeKF4CAXBNdI1QU
         b3i+KGompKEstsK6/kSQjfrmba1KXOi/RoOs3DISOaA97u+zJIYJJzPEnD1rK35LwrCP
         CykuGOqUiq0bjKVHcpDu+AKfIrWSUTEOHXX1o=
X-Forwarded-Encrypted: i=1; AKwUvBzK7EhwWeQZMafuZJi8Ra7+O19V6f6lYkcDZFDRH4kKTyr901YI8Y/0LprM85ViPJFCdRN5y4IsDM54@lists.linux.dev
X-Received: by 2002:a05:620a:1a04:b0:93e:7939:acd0 with SMTP id af79cd13be357-944216bd289mr2142667085a.37.1793690150304;
        Mon, 02 Nov 2026 23:15:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:93e:7939:acd0 with SMTP id af79cd13be357-944216bd289mr2142663485a.37.1793690149883;
        Mon, 02 Nov 2026 23:15:49 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:44 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v3 1/3] x86/vmware: Move high-bandwidth hypercalls out of line
Date: Tue,  3 Nov 2026 02:14:56 -0500
Message-ID: <5c509e51a3e04b95a6447fabc9db20d72152a8f3.1793685318.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793685318.git.zack.rusin@broadcom.com>
References: <cover.1793685318.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The high-bandwidth helpers contain inline assembly which temporarily uses
%bp as a VMware ABI register. Keeping that assembly in vmware.h duplicates
it in callers.

Move both helpers to vmware.c and export them for the vmwgfx module.
Preserve their unwind hints and remove the redundant caller-wide objtool
annotations from vmwgfx.

Preserve the argument sequence from commit e0e022004bbe ("x86/vmware:
Fix i386 high-bandwidth hypercall arguments").

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/vmware.h       | 62 +-------------------------
 arch/x86/kernel/cpu/vmware.c        | 68 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |  3 --
 3 files changed, 70 insertions(+), 63 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index fb011cef01e7..f3ffe358d2a3 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -253,12 +253,6 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 	return out0;
 }
 
-#ifdef CONFIG_X86_64
-#define VMW_BP_CONSTRAINT "r"
-#else
-#define VMW_BP_CONSTRAINT "m"
-#endif
-
 /*
  * High bandwidth calls are not supported on encrypted memory guests.
  * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
@@ -266,66 +260,14 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
  * This assumption simplifies HB hypercall implementation to just I/O port
  * based approach without alternative patching.
  */
-static inline
 unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
 				      unsigned long in3, unsigned long in4,
 				      unsigned long in5, unsigned long in6,
-				      u32 *out1)
-{
-	unsigned long out0;
-
-	asm_inline volatile (
-		UNWIND_HINT_SAVE
-		"mov %[in6], %%" _ASM_AX "\n\t"
-		"push %%" _ASM_BP "\n\t"
-		UNWIND_HINT_UNDEFINED
-		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
-		"mov %[magic], %%eax\n\t"
-		"rep outsb\n\t"
-		"pop %%" _ASM_BP "\n\t"
-		UNWIND_HINT_RESTORE
-		: "=&a" (out0), "=b" (*out1)
-		: "b" (cmd),
-		  "c" (in2),
-		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
-		  "S" (in4),
-		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT(in6),
-		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
-		: "cc", "memory");
-	return out0;
-}
-
-static inline
+				      u32 *out1);
 unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 				     unsigned long in3, unsigned long in4,
 				     unsigned long in5, unsigned long in6,
-				     u32 *out1)
-{
-	unsigned long out0;
-
-	asm_inline volatile (
-		UNWIND_HINT_SAVE
-		"mov %[in6], %%" _ASM_AX "\n\t"
-		"push %%" _ASM_BP "\n\t"
-		UNWIND_HINT_UNDEFINED
-		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
-		"mov %[magic], %%eax\n\t"
-		"rep insb\n\t"
-		"pop %%" _ASM_BP "\n\t"
-		UNWIND_HINT_RESTORE
-		: "=&a" (out0), "=b" (*out1)
-		: "b" (cmd),
-		  "c" (in2),
-		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
-		  "S" (in4),
-		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT(in6),
-		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
-		: "cc", "memory");
-	return out0;
-}
-#undef VMW_BP_CONSTRAINT
+				     u32 *out1);
 #undef VMWARE_HYPERCALL
 
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index f7ab9e7902cf..7cfc894f0663 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -30,12 +30,14 @@
 #include <linux/reboot.h>
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
+#include <asm/asm.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
 #include <asm/hypervisor.h>
 #include <asm/cpuid/api.h>
 #include <asm/timer.h>
 #include <asm/apic.h>
+#include <asm/unwind_hints.h>
 #include <asm/vmware.h>
 #include <asm/svm.h>
 
@@ -67,6 +69,72 @@ struct vmware_steal_time {
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
+#ifdef CONFIG_X86_64
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      u32 *out1)
+{
+	unsigned long out0;
+
+	asm volatile(UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
+		"rep outsb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
+		: "cc", "memory");
+	return out0;
+}
+EXPORT_SYMBOL_GPL(vmware_hypercall_hb_out);
+
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     u32 *out1)
+{
+	unsigned long out0;
+
+	asm volatile(UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
+		"push %%" _ASM_BP "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
+		"rep insb\n\t"
+		"pop %%" _ASM_BP "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
+		: "cc", "memory");
+	return out0;
+}
+EXPORT_SYMBOL_GPL(vmware_hypercall_hb_in);
+
+#undef VMW_BP_CONSTRAINT
+
 unsigned long vmware_hypercall_slow(unsigned long cmd,
 				    unsigned long in1, unsigned long in3,
 				    unsigned long in4, unsigned long in5,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index fd77ab6568cb..20ab4019680c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -24,7 +24,6 @@
  *
  */
 
-#include <linux/objtool.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -289,7 +288,6 @@ static int vmw_send_msg(struct rpc_channel *channel, const char *msg)
 
 	return -EINVAL;
 }
-STACK_FRAME_NON_STANDARD_FP(vmw_send_msg);
 
 
 /**
@@ -384,7 +382,6 @@ static int vmw_recv_msg(struct rpc_channel *channel, void **msg,
 
 	return 0;
 }
-STACK_FRAME_NON_STANDARD(vmw_recv_msg);
 
 
 /**
