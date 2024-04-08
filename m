Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE493FB2C
	for <linux-coco@lists.linux.dev>; Mon,  8 Apr 2024 07:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562076; cv=none; b=sSl6ANk5MkqZxNwEa9USMfkg+pkbYrGPwPk0C64fiTCtAmtCB0zC8xzyxt1Ic66NQRM3EE7YJ9PcJJ71RFHLYJslrpUlZwIDnGCjK8MqcnSSWekjdI/kv9nKLH0d4iWwmtmA/Bg2nGVsGG41NmbBoZ0YVr+prFl+tNKSaOrhM6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562076; c=relaxed/simple;
	bh=iKjQu5I5XlbEyI8tviReJ85sxcTJ+7YPkv/ktuPKMhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBLuspG8taBiC358NfDh5EZX1TK+8LOjpt8FyJRR7CvvJeI0hK3+dC9/iy5+oSM0nyS8GdKPWsRgz3DhkjodhlIKMqpH9yTeGZHej4zuvaE/gRwgdcx4vzTSJ9TeH7vD/5OzEWPj5aVkLUuGWh8Msu494N04HUU49QshsIXSzEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVrHIuwr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVrHIuwr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-415515178ceso26214995e9.0
        for <linux-coco@lists.linux.dev>; Mon, 08 Apr 2024 00:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712562073; x=1713166873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJpD29/pv52tcSTFE56JNh7gpAMmLYs2U80V4FBahpg=;
        b=cVrHIuwrdz52VSWnrGE7UVTUVrQWrJcG3luGXoeyc5Ugsp37k4dTADvqDCC76hNDeB
         K86tEKCwwlhQnaH7oJQr+xtdYYznUUitOz5NL5ct5qeFPEomm4XwkrouCn6/kTq0a8sj
         OxWHuTHwxsTmbe5lWDXZuhUhyMrmXzdCWEKPajcZU0O8mM/+fTiqUSVsv0VZhVbYrZXC
         OIMm9cF31fBO2tl6y6N8G+F1Cvo39q5liset7WSKTWVMv/i/qX+9kqs05wg/lO8pgcCU
         maQinfkPasE3wzDapcak8DEeC9KhrzC94jdFkwoXzvPSe+PrLll/0GoyKXrR9Vqkw/gr
         xcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562073; x=1713166873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJpD29/pv52tcSTFE56JNh7gpAMmLYs2U80V4FBahpg=;
        b=oqlPoy1zNd9XqQocVpHg3NsN/rhP/goctzxTOVI1KzbwxmMQrU1UUpThP7UBmlzdCq
         GBFI8uKpUXSJ9/zW3p0ExXqvWW3vk9JulnjvJQpe+38ct7Aj2fCe9nvl1WDVAYCBk9gG
         S0WZiQvLBSl9hWmK7mHpiKVEbl9cYHRf0crYu4MuWnebuhnRVwMuFuFLozUGM5xFwRmW
         U3kTf1FXxXuQJT3RfC6PsnkhzvSNPubwHkUGUxMbkmFLU8eebSkguPNBXovdXymjScrn
         6gfJAaRr2TZn2cnQa8vzFrho/p7hW8/4cjQDetN8jiBz0hknTjshC4W0pTJjZgjST8Ba
         DGKg==
X-Forwarded-Encrypted: i=1; AJvYcCVW+1KwDeG8Gqjp7vJ+49drRyIdVbZOpLuLxwTqb4qbjNliUOcdMCHSvk6RlrHJrW+3VPfirdVxDOspaOZFf6qAHyg9fUkReGxmKQ==
X-Gm-Message-State: AOJu0Yye3gbmeg350Io37bj7qtVRF/TF/+3FZXCA5TZtur+gsfySdBDr
	Bceb8uRXs2Rz8jKxBjJBTBmcFQ7VrJVQnO++xw7V4c+/rfPv7UYm
X-Google-Smtp-Source: AGHT+IE8QCaOWgeggvX3bzfdgpzjd9AKZpVWk5t3o1rNmV0yg4I7I6xr4BI4sOPOf3U8/XIcokRopQ==
X-Received: by 2002:a05:600c:350f:b0:416:7071:6eff with SMTP id h15-20020a05600c350f00b0041670716effmr1229085wmq.41.1712562073135;
        Mon, 08 Apr 2024 00:41:13 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab70:9c00:7f0b:c18e:56a6:4f2])
        by smtp.gmail.com with ESMTPSA id j3-20020adfff83000000b00341e2146b53sm8271413wrr.106.2024.04.08.00.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:41:12 -0700 (PDT)
From: vsntk18@gmail.com
To: x86@kernel.org
Cc: cfir@google.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ebiederm@xmission.com,
	erdemaktas@google.com,
	hpa@zytor.com,
	jgross@suse.com,
	jroedel@suse.de,
	jslaby@suse.cz,
	keescook@chromium.org,
	kexec@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luto@kernel.org,
	martin.b.radev@gmail.com,
	mhiramat@kernel.org,
	mstunes@vmware.com,
	nivedita@alum.mit.edu,
	peterz@infradead.org,
	rientjes@google.com,
	seanjc@google.com,
	stable@vger.kernel.org,
	thomas.lendacky@amd.com,
	virtualization@lists.linux-foundation.org,
	vkarasulli@suse.de,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	Borislav.Petkov@amd.com,
	Dhaval.Giani@amd.com
Subject: [PATCH v5 06/10] x86/sev: Use AP Jump Table blob to stop CPU
Date: Mon,  8 Apr 2024 09:40:45 +0200
Message-Id: <20240408074049.7049-7-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240408074049.7049-1-vsntk18@gmail.com>
References: <20240408074049.7049-1-vsntk18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

To support kexec under SEV-ES the APs can't be parked with HLT. Upon
wakeup the AP needs to find its way to execute at the reset vector set
by the new kernel and in real-mode.

This is what the AP jump table blob provides, so stop the APs the
SEV-ES way by calling the AP-reset-hold VMGEXIT from the AP jump
table.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/include/asm/sev.h |  2 ++
 arch/x86/kernel/process.c  |  8 ++++++++
 arch/x86/kernel/sev.c      | 15 ++++++++++++++-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 829650bdd455..dba6cad1f7d3 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -233,6 +233,7 @@ u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void kdump_sev_callback(void);
 void sev_show_status(void);
+void sev_es_stop_this_cpu(void);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
@@ -263,6 +264,7 @@ static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void kdump_sev_callback(void) { }
 static inline void sev_show_status(void) { }
+static inline void sev_es_stop_this_cpu(void) { }
 #endif
 
 #ifdef CONFIG_KVM_AMD_SEV
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index b8441147eb5e..0bc615d69c0e 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/tdx.h>
 #include <asm/mmu_context.h>
 #include <asm/shstk.h>
+#include <asm/sev.h>
 
 #include "process.h"
 
@@ -836,6 +837,13 @@ void __noreturn stop_this_cpu(void *dummy)
 	cpumask_clear_cpu(cpu, &cpus_stop_mask);
 
 	for (;;) {
+		/*
+		 * SEV-ES guests need a special stop routine to support
+		 * kexec. Try this first, if it fails the function will
+		 * return and native_halt() is used.
+		 */
+		sev_es_stop_this_cpu();
+
 		/*
 		 * Use native_halt() so that memory contents don't change
 		 * (stack usage and variables) after possibly issuing the
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 4c235e310487..17e4263cc7d7 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1357,7 +1357,6 @@ void setup_ghcb(void)
 		snp_register_ghcb_early(__pa(&boot_ghcb_page));
 }
 
-#ifdef CONFIG_HOTPLUG_CPU
 void __noreturn sev_jumptable_ap_park(void)
 {
 	local_irq_disable();
@@ -1390,6 +1389,20 @@ void __noreturn sev_jumptable_ap_park(void)
 }
 STACK_FRAME_NON_STANDARD(sev_jumptable_ap_park);
 
+void sev_es_stop_this_cpu(void)
+{
+	if (!(cc_vendor == CC_VENDOR_AMD) ||
+	    !cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
+		return;
+
+	/* Only park in the AP jump table when the code has been installed */
+	if (!sev_ap_jumptable_blob_installed)
+		return;
+
+	sev_jumptable_ap_park();
+}
+
+#ifdef CONFIG_HOTPLUG_CPU
 static void sev_es_ap_hlt_loop(void)
 {
 	struct ghcb_state state;
-- 
2.34.1

