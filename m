Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690161;
	b=uN172KeZoNSm8hZdw1bYjotYiKDtzkQhx+gaBRilIQIdnqlYLXwd6F+23CxOgXCZAeLC
	 T0IMejawJ+T1gEUhJMmGm9quCD3TJh+awul8wNnv2VPyVGJ/GYuevLi2OW7ySFs3Logqv
	 ctJusTbjR9GMyQgsSXH8/rmgqpYrKadtEE8vPI9DCPOFsTcZZxrSLV3JzgKg2b/NH/NKy
	 jywTB77U5iV1jGtgCnNfw7NfHIZCDZjhPQnruGEsuhTG2ybH2AR/3pQimWMj4gzGOJCdW
	 azKu6FIv+9XqLupqDFSP4QZqyTjr31w1uqhOCL8lE1Uisj0RzRPx0fHnXs1Axo3EzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690161;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=v8oixRRN3rr/34hLBI6Vm4ZuCPtfHatAfnh/LObqStA=;
	b=xUUerP/rTIp21IiKaLTeqlWcLiTn6XfD0UiT85Uj4N+obkOTSUuz22y8SodF2ujNz+E1
	 KoFPgRiDPqPWNYwRLtlow6++1AjwDbHwNP9EanTyRxtH4BkhCtAaCtwKGDXN7tvzZR57G
	 EL23NwIeGKAqKAXTgY3Y7iyaHqoEECT7hC/dTB/TOAOR2HeUcELJE3k8hrhWHtSfppeJQ
	 Dn3DZwOOqcDg1T/QRu5Zi0QFwcKLh1PWI6DyeDiVuPap+xfvk17D2zhCKrL4AHJvyNrMi
	 9tNtucyv9EQw0TFoOBsV+tNVgJ4GvhQU/DSlu1uszUXs7si+16jIamawdYkgCWoq3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HhLxU06h;
	arc=none smtp.remote-ip=209.85.160.97
Received: from mail-oa1-f97.google.com (mail-oa1-f97.google.com [209.85.160.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F359606A329
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F359606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HhLxU06h
Received: by mail-oa1-f97.google.com with SMTP id 586e51a60fabf-4877837890fso2374435fac.2
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690159; x=1794294959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8oixRRN3rr/34hLBI6Vm4ZuCPtfHatAfnh/LObqStA=;
        b=w0q83OaL6NyCAccK0WTOnQgUUjzKUZb0kpZTk0FYY4NFQxVTZvC6Lok8ahqdSlbV9f
         RPUK2+crRooccCk0m1F1sXfmgAWo+jG1xA0/cajVS4RZTvs2rmcSyvmeSREoWQhXIVDg
         dapWqLrD5bwh3Zoh+Z5V8a3awlxMueDEO80hkfdH1fPebhl/goZahbmO9LGL2CEjGUFC
         dSamoX1bu2xWS3PPb03bDn4AeKpAMrrbsX/Dt8f9Gt0Cqr5sJNpdfd5RFzXzukIVorhD
         vBayyP5YGEcsku+uv77PwOH5B7OjfJmFSEVj9lxmnAQe4EBJvfC0cnp3+nnbCdHbey2S
         9Idg==
X-Forwarded-Encrypted: i=1; AKwUvByFh57YeGC1N9CcjEZz+8fw0oJ1e4CV2yhkP1YPMjL50I2RBlrsfUHr5sxqutVZJ9aqPJNqO2dI295t@lists.linux.dev
X-Gm-Message-State: AFq9FYI+9r4itAihToWpw+I5G57Nx/AbEzvJ+941v/iqtsFXehTcVQfZ
	duAxMdyybW1Z8bDp2foRekh38lBu1D+FOLrymQwWRVflNpEng3H/Dweqv4KOmANAayX98LDiS4/
	1v4q+Vl4Wf/rmFWsc5GnKH3RzFLVUCG0165pM89JmqP7hji02y2Kdq78LJ0H+ihGeal2eFb3lEl
	3Dl8Xe/CHbbcAwuonyPNdi2tV3PvNaFMvgJD/5jGUGMZbWYk73qepk0fsSMy1r9BIGBSb78YeRf
	gHtkiAxiVvfbQ==
X-Gm-Gg: AYBFou0ygaNZALBobs7WkZ+PeyC7c8QT7Iya3uuizUakVoF42NdERsikvfGe2R/f0gX
	3KMoCGnqeVWIpQoEWOHdjkFLDpiWO6KbZj+iNyc/Lq4kYT2NQwV39umLaqEsi4EMZTxJNSInXxU
	GCH21KsGlmXsCvdf8FtIhzFqGfF9WgrYMiHdVbU9tD3NfNv2F2YSY57WVjpxkXbcKW77w2x8Cv0
	lHGT2zuM+mr+jC6RpqC+Vz58lnVo/AdOOl3GKxSjpDDG4Z46+PVKGVEwq8ieVIchcPkYDZFlnNo
	+ww7m7eTU+wuGInzZPyyQnaprGXMP7Vlw25KsC3Tzof5URrvlPeDL/v6nYuuqfDGyZqzhed+DoS
	xIAQl+OULC50tbFnAQ6NDfIbkchp+VSdayngugrZDsqoQnUlGO14zwsFGbM2+JKknGWpAl2bsUj
	zfMztPgcvRNINtJmaM7m3OsHAVaUx7ZoxB
X-Received: by 2002:a05:6870:6711:b0:4a8:ffd4:9a6c with SMTP id 586e51a60fabf-4a9077a1f74mr7470220fac.45.1793690159093;
        Mon, 02 Nov 2026 23:15:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4a9219ec965sm68442fac.16.2026.11.02.23.15.53
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:15:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso646123585a.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690152; x=1794294952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8oixRRN3rr/34hLBI6Vm4ZuCPtfHatAfnh/LObqStA=;
        b=HhLxU06hk8PLRMpUXwhLZIVpeG0rQhechgI5O22NvUuN95YWEFeQ5dUTlKSU/hetIG
         KzxKnijfEAUyiVhXMsRphkmIV2KkogJaG9tooY71z9806g6sJe72Ev83ZmQQndQ1AgPs
         C/yCWMDoamf4aleUmqfqr3yDHLmzq4thKQn/M=
X-Forwarded-Encrypted: i=1; AKwUvBxNANfcx/9e0Pv4XFlv1hGkJfXw+RO8l0MDXED9iUEDL6m1XejcJzoLLOrzSp/8Wj6gr5iWk5hdM4nK@lists.linux.dev
X-Received: by 2002:a05:620a:4104:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-94421581789mr1967998485a.10.1793690152217;
        Mon, 02 Nov 2026 23:15:52 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-94421581789mr1967994585a.10.1793690151592;
        Mon, 02 Nov 2026 23:15:51 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:50 -0800 (PST)
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
Subject: [PATCH v3 2/3] x86/vmware: Route low-bandwidth hypercalls through a static call
Date: Tue,  3 Nov 2026 02:14:57 -0500
Message-ID: <70ce0c2c18008fb25399125fc81eb368d8e824ad.1793685318.git.zack.rusin@broadcom.com>
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

From: Alexey Makhalov <alexey.makhalov@broadcom.com>

The low-bandwidth wrappers duplicate inline assembly for the backdoor,
vmcall, vmmcall and TDX paths. The early boot path also needs a separate
dispatcher until alternatives have been patched.

Move the assembly into four backends selected by a static call. Pass the
command with input and result structures instead of ten arguments with
nullable output pointers, as suggested by Linus. Keep the existing wrapper
API for callers.

The backdoor remains the link-time target for early DMI probing. Each
backend fills the complete result structure. The backdoor replaces the low
word of %dx with its port; vmcall, vmmcall and TDX preserve that word.
Export only the GPL trampoline so modules can call it but cannot retarget
it.

The selected static call also makes vmware_hypercall_slow() obsolete.
Remove it in the same change so no runtime code refers to the init-only
mode byte. Print the selected backend by name instead of its numeric mode.

Link: https://lore.kernel.org/r/20260309235250.2611115-2-alexey.makhalov@broadcom.com
Link: https://lore.kernel.org/all/CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com/
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Co-developed-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/vmware.h | 309 +++++++++++++++-------------------
 arch/x86/kernel/cpu/vmware.c  | 225 ++++++++++++++++---------
 2 files changed, 278 insertions(+), 256 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index f3ffe358d2a3..207067ed8c35 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -2,49 +2,79 @@
 #ifndef _ASM_X86_VMWARE_H
 #define _ASM_X86_VMWARE_H
 
-#include <asm/cpufeatures.h>
-#include <asm/alternative.h>
-#include <linux/stringify.h>
+#include <linux/bits.h>
+#include <linux/static_call.h>
+#include <linux/types.h>
 
 /*
  * VMware hypercall ABI.
  *
- * - Low bandwidth (LB) hypercalls (I/O port based, vmcall and vmmcall)
- * have up to 6 input and 6 output arguments passed and returned using
- * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
- * %esi (arg4), %edi (arg5).
- * The following input arguments must be initialized by the caller:
- * arg0 - VMWARE_HYPERVISOR_MAGIC
- * arg2 - Hypercall command
- * arg3 bits [15:0] - Port number, LB and direction flags
+ * Low bandwidth (LB) hypercalls use the I/O-port backdoor, vmcall or vmmcall
+ * and have the following register mapping:
  *
- * - Low bandwidth TDX hypercalls (x86_64 only) are similar to LB
- * hypercalls. They also have up to 6 input and 6 output on registers
- * arguments, with different argument to register mapping:
- * %r12 (arg0), %rbx (arg1), %r13 (arg2), %rdx (arg3),
- * %rsi (arg4), %rdi (arg5).
+ *  +------+---------------------------------------+-----------------+
+ *  | Reg  | Input                                 | Output          |
+ *  +======+=======================================+=================+
+ *  | %eax | VMWARE_HYPERVISOR_MAGIC               | out0            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %ebx | in1                                   | out1            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %ecx | cmd                                   | out2            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %edx | Bits 15:0: port for the backdoor,     | out3            |
+ *  |      | flags for vmcall/vmmcall              |                 |
+ *  |      | Bits 31:16: in3                       |                 |
+ *  +------+---------------------------------------+-----------------+
+ *  | %esi | in4                                   | out4            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %edi | in5                                   | out5            |
+ *  +------+---------------------------------------+-----------------+
  *
- * - High bandwidth (HB) hypercalls are I/O port based only. They have
- * up to 7 input and 7 output arguments passed and returned using
- * registers: %eax (arg0), %ebx (arg1), %ecx (arg2), %edx (arg3),
- * %esi (arg4), %edi (arg5), %ebp (arg6).
- * The following input arguments must be initialized by the caller:
- * arg0 - VMWARE_HYPERVISOR_MAGIC
- * arg1 - Hypercall command
- * arg3 bits [15:0] - Port number, HB and direction flags
+ * TDX LB hypercalls are x86-64-only and use a different mapping:
  *
- * For compatibility purposes, x86_64 systems use only lower 32 bits
- * for input and output arguments.
+ *  +------+---------------------------------------+-----------------+
+ *  | Reg  | Input                                 | Output          |
+ *  +======+=======================================+=================+
+ *  | %r12 | VMWARE_HYPERVISOR_MAGIC               | out0            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %rbx | in1                                   | out1            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %r13 | cmd                                   | out2            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %rdx | Bits 15:0: flags                      | out3            |
+ *  |      | Bits 31:16: in3                       |                 |
+ *  +------+---------------------------------------+-----------------+
+ *  | %rsi | in4                                   | out4            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %rdi | in5                                   | out5            |
+ *  +------+---------------------------------------+-----------------+
  *
- * The hypercall definitions differ in the low word of the %edx (arg3)
- * in the following way: the old I/O port based interface uses the port
- * number to distinguish between high- and low bandwidth versions, and
- * uses IN/OUT instructions to define transfer direction.
+ * For vmcall, vmmcall and TDX, a zero low word selects the ordinary
+ * low-bandwidth input form. Other low-word flags are passed through.
  *
- * The new vmcall interface instead uses a set of flags to select
- * bandwidth mode and transfer direction. The flags should be loaded
- * into arg3 by any user and are automatically replaced by the port
- * number if the I/O port method is used.
+ * High bandwidth (HB) hypercalls use the I/O-port backdoor only:
+ *
+ *  +------+---------------------------------------+-----------------+
+ *  | Reg  | Input                                 | Output          |
+ *  +======+=======================================+=================+
+ *  | %eax | VMWARE_HYPERVISOR_MAGIC               | out0            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %ebx | cmd                                   | out1            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %ecx | in2                                   | out2            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %edx | Bits 15:0: port and HB flag           | out3            |
+ *  |      | Bits 31:16: in3                       |                 |
+ *  +------+---------------------------------------+-----------------+
+ *  | %esi | in4                                   | out4            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %edi | in5                                   | out5            |
+ *  +------+---------------------------------------+-----------------+
+ *  | %ebp | in6                                   | out6            |
+ *  +------+---------------------------------------+-----------------+
+ *
+ * The low-bandwidth wrappers return non-%rax results through u32 pointers.
+ * High-bandwidth buffer addresses in %rsi/%rdi are pointer-sized on x86-64.
  */
 
 #define VMWARE_HYPERVISOR_HB		BIT(0)
@@ -70,103 +100,64 @@
 #define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
 #define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
 
-extern unsigned long vmware_hypercall_slow(unsigned long cmd,
-					   unsigned long in1, unsigned long in3,
-					   unsigned long in4, unsigned long in5,
-					   u32 *out1, u32 *out2, u32 *out3,
-					   u32 *out4, u32 *out5);
+struct vmware_hypercall_args {
+	unsigned long bx;
+	unsigned long dx;
+	unsigned long si;
+	unsigned long di;
+};
 
-#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
-#define VMWARE_TDX_HCALL_FUNC  1
+struct vmware_hypercall_results {
+	unsigned long bx;
+	unsigned long cx;
+	unsigned long dx;
+	unsigned long si;
+	unsigned long di;
+};
 
-extern unsigned long vmware_tdx_hypercall(unsigned long cmd,
-					  unsigned long in1, unsigned long in3,
-					  unsigned long in4, unsigned long in5,
-					  u32 *out1, u32 *out2, u32 *out3,
-					  u32 *out4, u32 *out5);
+unsigned long
+vmware_hypercall_func(unsigned long cmd,
+		      const struct vmware_hypercall_args *in,
+		      struct vmware_hypercall_results *out);
 
-/*
- * The low bandwidth call. The low word of %edx is presumed to have OUT bit
- * set. The high word of %edx may contain input data from the caller.
- */
-#define VMWARE_HYPERCALL					\
-	ALTERNATIVE_2("movw %[port], %%dx\n\t"			\
-		      "inl (%%dx), %%eax",			\
-		      "vmcall", X86_FEATURE_VMCALL,		\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+DECLARE_STATIC_CALL(vmware_hypercall, vmware_hypercall_func);
 
 static inline
 unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = { .bx = in1 };
+	struct vmware_hypercall_results out;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
-					    NULL, NULL, NULL, NULL, NULL);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
-					     NULL, NULL, NULL, NULL, NULL);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (0)
-		: "cc", "memory");
-	return out0;
+	return static_call_mod(vmware_hypercall)(cmd, &in, &out);
 }
 
 static inline
 unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
 				u32 *out1, u32 *out2)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = { .bx = in1 };
+	struct vmware_hypercall_results out;
+	unsigned long ret;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
-					    out1, out2, NULL, NULL, NULL);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
-					     out1, out2, NULL, NULL, NULL);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0), "=b" (*out1), "=c" (*out2)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (0)
-		: "di", "si", "cc", "memory");
-	return out0;
+	ret = static_call_mod(vmware_hypercall)(cmd, &in, &out);
+	*out1 = out.bx;
+	*out2 = out.cx;
+	return ret;
 }
 
 static inline
 unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
 				u32 *out1, u32 *out2, u32 *out3)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = { .bx = in1 };
+	struct vmware_hypercall_results out;
+	unsigned long ret;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, 0, 0, 0,
-					    out1, out2, out3, NULL, NULL);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, 0, 0, 0,
-					     out1, out2, out3, NULL, NULL);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (0)
-		: "di", "si", "cc", "memory");
-	return out0;
+	ret = static_call_mod(vmware_hypercall)(cmd, &in, &out);
+	*out1 = out.bx;
+	*out2 = out.cx;
+	*out3 = out.dx;
+	return ret;
 }
 
 static inline
@@ -174,27 +165,18 @@ unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
 				unsigned long in3, unsigned long in4,
 				unsigned long in5, u32 *out2)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = {
+		.bx = in1,
+		.dx = in3,
+		.si = in4,
+		.di = in5,
+	};
+	struct vmware_hypercall_results out;
+	unsigned long ret;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
-					    NULL, out2, NULL, NULL, NULL);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
-					     NULL, out2, NULL, NULL, NULL);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0), "=c" (*out2)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (in3),
-		  "S" (in4),
-		  "D" (in5)
-		: "cc", "memory");
-	return out0;
+	ret = static_call_mod(vmware_hypercall)(cmd, &in, &out);
+	*out2 = out.cx;
+	return ret;
 }
 
 static inline
@@ -202,26 +184,19 @@ unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
 				unsigned long in3, u32 *out2,
 				u32 *out3, u32 *out4, u32 *out5)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = {
+		.bx = in1,
+		.dx = in3,
+	};
+	struct vmware_hypercall_results out;
+	unsigned long ret;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, in3, 0, 0,
-					    NULL, out2, out3, out4, out5);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, in3, 0, 0,
-					     NULL, out2, out3, out4, out5);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
-		  "=D" (*out5)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (in3)
-		: "cc", "memory");
-	return out0;
+	ret = static_call_mod(vmware_hypercall)(cmd, &in, &out);
+	*out2 = out.cx;
+	*out3 = out.dx;
+	*out4 = out.si;
+	*out5 = out.di;
+	return ret;
 }
 
 static inline
@@ -230,35 +205,26 @@ unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
 				unsigned long in5, u32 *out1,
 				u32 *out2, u32 *out3)
 {
-	unsigned long out0;
+	const struct vmware_hypercall_args in = {
+		.bx = in1,
+		.dx = in3,
+		.si = in4,
+		.di = in5,
+	};
+	struct vmware_hypercall_results out;
+	unsigned long ret;
 
-	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST))
-		return vmware_tdx_hypercall(cmd, in1, in3, in4, in5,
-					    out1, out2, out3, NULL, NULL);
-
-	if (unlikely(!alternatives_patched) && !__is_defined(MODULE))
-		return vmware_hypercall_slow(cmd, in1, in3, in4, in5,
-					     out1, out2, out3, NULL, NULL);
-
-	asm_inline volatile (VMWARE_HYPERCALL
-		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
-		: [port] "i" (VMWARE_HYPERVISOR_PORT),
-		  "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (in1),
-		  "c" (cmd),
-		  "d" (in3),
-		  "S" (in4),
-		  "D" (in5)
-		: "cc", "memory");
-	return out0;
+	ret = static_call_mod(vmware_hypercall)(cmd, &in, &out);
+	*out1 = out.bx;
+	*out2 = out.cx;
+	*out3 = out.dx;
+	return ret;
 }
 
 /*
  * High bandwidth calls are not supported on encrypted memory guests.
  * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
- * low bandwidth hypercall if memory encryption is set.
- * This assumption simplifies HB hypercall implementation to just I/O port
- * based approach without alternative patching.
+ * low bandwidth hypercalls if memory encryption is set.
  */
 unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
 				      unsigned long in3, unsigned long in4,
@@ -268,6 +234,5 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 				     unsigned long in3, unsigned long in4,
 				     unsigned long in5, unsigned long in6,
 				     u32 *out1);
-#undef VMWARE_HYPERCALL
 
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 7cfc894f0663..6719c009f237 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -50,6 +50,9 @@
 #define GETVCPU_INFO_LEGACY_X2APIC           BIT(3)
 #define GETVCPU_INFO_VCPU_RESERVED           BIT(31)
 
+#define VMWARE_TDX_VENDOR_LEAF 0x1af7e4909ULL
+#define VMWARE_TDX_HCALL_FUNC  1
+
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
@@ -67,7 +70,7 @@ struct vmware_steal_time {
 };
 
 static unsigned long vmware_tsc_khz __ro_after_init;
-static u8 vmware_hypercall_mode     __ro_after_init;
+static u8 vmware_hypercall_mode __initdata;
 
 #ifdef CONFIG_X86_64
 #define VMW_BP_CONSTRAINT "r"
@@ -135,68 +138,97 @@ EXPORT_SYMBOL_GPL(vmware_hypercall_hb_in);
 
 #undef VMW_BP_CONSTRAINT
 
-unsigned long vmware_hypercall_slow(unsigned long cmd,
-				    unsigned long in1, unsigned long in3,
-				    unsigned long in4, unsigned long in5,
-				    u32 *out1, u32 *out2, u32 *out3,
-				    u32 *out4, u32 *out5)
+static unsigned long
+vmware_backdoor_hypercall(unsigned long cmd,
+			  const struct vmware_hypercall_args *in,
+			  struct vmware_hypercall_results *out)
 {
-	unsigned long out0, rbx, rcx, rdx, rsi, rdi;
+	unsigned long ax = VMWARE_HYPERVISOR_MAGIC;
+	unsigned long bx = in->bx;
+	unsigned long cx = cmd;
+	unsigned long dx = in->dx;
+	unsigned long si = in->si;
+	unsigned long di = in->di;
 
-	switch (vmware_hypercall_mode) {
-	case CPUID_VMWARE_FEATURES_ECX_VMCALL:
-		asm_inline volatile ("vmcall"
-				: "=a" (out0), "=b" (rbx), "=c" (rcx),
-				"=d" (rdx), "=S" (rsi), "=D" (rdi)
-				: "a" (VMWARE_HYPERVISOR_MAGIC),
-				"b" (in1),
-				"c" (cmd),
-				"d" (in3),
-				"S" (in4),
-				"D" (in5)
-				: "cc", "memory");
-		break;
-	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:
-		asm_inline volatile ("vmmcall"
-				: "=a" (out0), "=b" (rbx), "=c" (rcx),
-				"=d" (rdx), "=S" (rsi), "=D" (rdi)
-				: "a" (VMWARE_HYPERVISOR_MAGIC),
-				"b" (in1),
-				"c" (cmd),
-				"d" (in3),
-				"S" (in4),
-				"D" (in5)
-				: "cc", "memory");
-		break;
-	default:
-		asm_inline volatile ("movw %[port], %%dx; inl (%%dx), %%eax"
-				: "=a" (out0), "=b" (rbx), "=c" (rcx),
-				"=d" (rdx), "=S" (rsi), "=D" (rdi)
-				: [port] "i" (VMWARE_HYPERVISOR_PORT),
-				"a" (VMWARE_HYPERVISOR_MAGIC),
-				"b" (in1),
-				"c" (cmd),
-				"d" (in3),
-				"S" (in4),
-				"D" (in5)
-				: "cc", "memory");
-		break;
-	}
+	dx = (dx & ~0xffffUL) | VMWARE_HYPERVISOR_PORT;
+	asm volatile ("inl (%%dx), %%eax"
+		: "+a" (ax), "+b" (bx), "+c" (cx),
+		  "+d" (dx), "+S" (si), "+D" (di)
+		:
+		: "cc", "memory");
 
-	if (out1)
-		*out1 = rbx;
-	if (out2)
-		*out2 = rcx;
-	if (out3)
-		*out3 = rdx;
-	if (out4)
-		*out4 = rsi;
-	if (out5)
-		*out5 = rdi;
+	*out = (struct vmware_hypercall_results) {
+		.bx = bx,
+		.cx = cx,
+		.dx = dx,
+		.si = si,
+		.di = di,
+	};
 
-	return out0;
+	return ax;
 }
 
+static unsigned long
+vmware_vmcall_hypercall(unsigned long cmd,
+			const struct vmware_hypercall_args *in,
+			struct vmware_hypercall_results *out)
+{
+	unsigned long ax = VMWARE_HYPERVISOR_MAGIC;
+	unsigned long bx = in->bx;
+	unsigned long cx = cmd;
+	unsigned long dx = in->dx;
+	unsigned long si = in->si;
+	unsigned long di = in->di;
+
+	asm volatile ("vmcall"
+		: "+a" (ax), "+b" (bx), "+c" (cx),
+		  "+d" (dx), "+S" (si), "+D" (di)
+		:
+		: "cc", "memory");
+
+	*out = (struct vmware_hypercall_results) {
+		.bx = bx,
+		.cx = cx,
+		.dx = dx,
+		.si = si,
+		.di = di,
+	};
+
+	return ax;
+}
+
+static unsigned long
+vmware_vmmcall_hypercall(unsigned long cmd,
+			 const struct vmware_hypercall_args *in,
+			 struct vmware_hypercall_results *out)
+{
+	unsigned long ax = VMWARE_HYPERVISOR_MAGIC;
+	unsigned long bx = in->bx;
+	unsigned long cx = cmd;
+	unsigned long dx = in->dx;
+	unsigned long si = in->si;
+	unsigned long di = in->di;
+
+	asm volatile ("vmmcall"
+		: "+a" (ax), "+b" (bx), "+c" (cx),
+		  "+d" (dx), "+S" (si), "+D" (di)
+		:
+		: "cc", "memory");
+
+	*out = (struct vmware_hypercall_results) {
+		.bx = bx,
+		.cx = cx,
+		.dx = dx,
+		.si = si,
+		.di = di,
+	};
+
+	return ax;
+}
+
+DEFINE_STATIC_CALL(vmware_hypercall, vmware_backdoor_hypercall);
+EXPORT_STATIC_CALL_TRAMP_GPL(vmware_hypercall);
+
 static inline int __vmware_platform(void)
 {
 	u32 eax, ebx, ecx;
@@ -466,11 +498,38 @@ static void __init vmware_set_capabilities(void)
 		setup_force_cpu_cap(X86_FEATURE_VMW_VMMCALL);
 }
 
+static unsigned long
+vmware_tdx_hypercall(unsigned long cmd,
+		     const struct vmware_hypercall_args *in,
+		     struct vmware_hypercall_results *out);
+
+static void __init vmware_init_hypercall(void)
+{
+	const char *mode;
+
+	if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
+		static_call_update(vmware_hypercall, vmware_tdx_hypercall);
+		mode = "tdcall";
+	} else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL) {
+		static_call_update(vmware_hypercall, vmware_vmcall_hypercall);
+		mode = "vmcall";
+	} else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL) {
+		static_call_update(vmware_hypercall, vmware_vmmcall_hypercall);
+		mode = "vmmcall";
+	} else {
+		mode = "backdoor";
+	}
+
+	pr_info("hypercall mode: %s\n", mode);
+}
+
 static void __init vmware_platform_setup(void)
 {
 	u32 eax, ebx, ecx;
 	u64 lpj, tsc_khz;
 
+	vmware_init_hypercall();
+
 	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
@@ -541,9 +600,6 @@ static u32 __init vmware_platform(void)
 				vmware_hypercall_mode =
 					vmware_select_hypercall();
 
-			pr_info("hypercall mode: 0x%02x\n",
-				(unsigned int) vmware_hypercall_mode);
-
 			return CPUID_VMWARE_INFO_LEAF;
 		}
 	} else if (dmi_available && dmi_name_in_serial("VMware") &&
@@ -564,18 +620,16 @@ static bool __init vmware_legacy_x2apic_available(void)
 }
 
 #ifdef CONFIG_INTEL_TDX_GUEST
-/*
- * TDCALL[TDG.VP.VMCALL] uses %rax (arg0) and %rcx (arg2). Therefore,
- * we remap those registers to %r12 and %r13, respectively.
- */
-unsigned long vmware_tdx_hypercall(unsigned long cmd,
-				   unsigned long in1, unsigned long in3,
-				   unsigned long in4, unsigned long in5,
-				   u32 *out1, u32 *out2, u32 *out3,
-				   u32 *out4, u32 *out5)
+/* TDCALL maps the VMware %rax and %rcx arguments to %r12 and %r13. */
+static unsigned long
+vmware_tdx_hypercall(unsigned long cmd,
+		     const struct vmware_hypercall_args *in,
+		     struct vmware_hypercall_results *out)
 {
 	struct tdx_module_args args = {};
 
+	*out = (struct vmware_hypercall_results) {};
+
 	if (!hypervisor_is_type(X86_HYPER_VMWARE)) {
 		pr_warn_once("Incorrect usage\n");
 		return ULONG_MAX;
@@ -586,10 +640,10 @@ unsigned long vmware_tdx_hypercall(unsigned long cmd,
 		return ULONG_MAX;
 	}
 
-	args.rbx = in1;
-	args.rdx = in3;
-	args.rsi = in4;
-	args.rdi = in5;
+	args.rbx = in->bx;
+	args.rdx = in->dx;
+	args.rsi = in->si;
+	args.rdi = in->di;
 	args.r10 = VMWARE_TDX_VENDOR_LEAF;
 	args.r11 = VMWARE_TDX_HCALL_FUNC;
 	args.r12 = VMWARE_HYPERVISOR_MAGIC;
@@ -599,20 +653,23 @@ unsigned long vmware_tdx_hypercall(unsigned long cmd,
 
 	__tdx_hypercall(&args);
 
-	if (out1)
-		*out1 = args.rbx;
-	if (out2)
-		*out2 = args.r13;
-	if (out3)
-		*out3 = args.rdx;
-	if (out4)
-		*out4 = args.rsi;
-	if (out5)
-		*out5 = args.rdi;
+	out->bx = args.rbx;
+	out->cx = args.r13;
+	out->dx = args.rdx;
+	out->si = args.rsi;
+	out->di = args.rdi;
 
 	return args.r12;
 }
-EXPORT_SYMBOL_GPL(vmware_tdx_hypercall);
+#else
+static unsigned long
+vmware_tdx_hypercall(unsigned long cmd,
+		     const struct vmware_hypercall_args *in,
+		     struct vmware_hypercall_results *out)
+{
+	*out = (struct vmware_hypercall_results) {};
+	return ULONG_MAX;
+}
 #endif
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
