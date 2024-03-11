Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A24AEE4
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173861; cv=none; b=Cidl5/jRhvcqk30CNyRgpVN2gPML5vpLzrncK59dCyiEuN/wiqD/AMXR2FRvsQ+NVD4B3C99g0dqNyy6hYeR8YnqC/LImK55KJ+2BJssD3+DvvydyJf7pjYvcV9PbQh1mk6t/qbNEVZj6Nm+sJt/mbgkQdGbXDOjgAcmvVYvdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173861; c=relaxed/simple;
	bh=k4KATT8BongMPGyzu+avZmp/iNPi9MTSWDfDzR0R684=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5aeFlZtpz76M38YW9I4Ns5I21E0G+dSQY1pL1PqFJEyzsc7j/KRH/7NfBrHBHkrucxGZgYfOJwHQS4bNDsBkjGUil046m/sdrdj+BAWSIOzMb0idyfDXWahQ2YxtxsvwvJ6ZEE4K9FFvdUmm9Y7jAsxmYrQIAmqhLEKyxb6QBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIYyJWC5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIYyJWC5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4132a348546so6544335e9.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173855; x=1710778655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nx+lR8M3d9xAl/7OW4v6MUggA0QirKWOFkex7liC38=;
        b=NIYyJWC5OL368lY1zN23leR8jZGmLdhnxHORPLtwn3ztfWwe6rMV4Jt9Ffi0YGvDWg
         L/LolQKue16JvTI7r55wEO9n6s87I66bfms+0XdgLJ5GYPbSbRiaBS0MfAmiBBQtF/Dv
         fiIWy8XWtKCSH2KGea3k/gouF/EV9ZzhO2Gf4rdQtym/KJmVllp2Nt9DkgLROG+QuIDd
         tn4pPBcOjhnZ7ANXTcxzTJ+cb0ZE6DMA4o43fRoe7P7tVz3o83Py+ApHozedmvg16olb
         KaNytpGDOcHpgtXn+t1R3N7hNIPg/H6lQ9Iyu696uz9QqgRZ0bbxjxVgPgwfcAkj4nwb
         EPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173855; x=1710778655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nx+lR8M3d9xAl/7OW4v6MUggA0QirKWOFkex7liC38=;
        b=W2ay+CxB586AmmjvKcPPULRTU2FBrHW24cTPgruDctd3Z9D/pncHx4gD6HohyumlTf
         86LLcVOJcdPaqP7TgIB53LaLNCF1qlYSBs+WK7HD2Y5wD/MrfkHE2mS0WoVMr5g7kK0s
         x+5UB7fz99fY7UrGrNW1Snr/xdMj1hUVp6vs6On1xY1KbkwomfOwTrwxyndtJfp9SRrm
         xYs+DAFWCGq2IHJYq/RVW9bFVmaUkUdDL+ExkW3dncBbbmnPU9Ig3szJgsbAmXKjNkPP
         wJEF0zEKd/Q5pQ6GFAwvn/eY9Gl/i7Lo5K+ioV++ZPVN/ClqxQUrTGvNaOpLMLkdAwJM
         fXvg==
X-Forwarded-Encrypted: i=1; AJvYcCWzDXcrIBHmxUE6/ZWOkPRFrw6iReNgcfSJC0ctVN5n9p5bA5Zjx2wTAKHLPPXm9WeEBbHgypZKPwOYawSthN27vJWX2gTUbIupZg==
X-Gm-Message-State: AOJu0YxVW2IY7TPLIx/bn6gOdcD9Te3F+FAZYTfhrLxpDwaIEp+0Qn45
	Qd24UdrLZ/MRGJJE6SzbkeHuXLttXA8ANB5jZk/8F1rlTZbfSS8M
X-Google-Smtp-Source: AGHT+IGUkQIfxvl6yLuTpdvx8nBMGwNueb7cOPWvFZGWKEwfp7qH2FFkNgyfYv3Q3y0mmeMCQSJfrA==
X-Received: by 2002:a05:600c:458c:b0:413:2c3e:c323 with SMTP id r12-20020a05600c458c00b004132c3ec323mr1492631wmo.38.1710173855159;
        Mon, 11 Mar 2024 09:17:35 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab47:8200:c3b9:43af:f8e1:76f9])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm2823815wrb.89.2024.03.11.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:17:34 -0700 (PDT)
From: Vasant Karasulli <vsntk18@gmail.com>
To: x86@kernel.org
Cc: joro@8bytes.org,
	cfir@google.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	ebiederm@xmission.com,
	erdemaktas@google.com,
	hpa@zytor.com,
	jgross@suse.com,
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
	Joerg Roedel <jroedel@suse.de>,
	Vasant Karasulli <vkarasulli@suse.de>
Subject: [PATCH v4 2/9] x86/sev: Save and print negotiated GHCB protocol version
Date: Mon, 11 Mar 2024 17:17:20 +0100
Message-Id: <20240311161727.14916-3-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311161727.14916-1-vsntk18@gmail.com>
References: <20240311161727.14916-1-vsntk18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <jroedel@suse.de>

Save the results of the GHCB protocol negotiation into a data structure
and print information about versions supported and used to the kernel
log.

This is useful for debugging kexec issues in SEV-ES guests down the
road to quickly spot whether kexec is supported on the given host.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/kernel/sev-shared.c | 33 +++++++++++++++++++++++++++++++--
 arch/x86/kernel/sev.c        |  8 ++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index 1d24ec679915..c02a087c7945 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -17,6 +17,23 @@
 #define WARN(condition, format...) (!!(condition))
 #endif

+/*
+ * struct ghcb_info - Used to return GHCB protocol
+ *				   negotiation details.
+ *
+ * @hv_proto_min:	Minimum GHCB protocol version supported by Hypervisor
+ * @hv_proto_max:	Maximum GHCB protocol version supported by Hypervisor
+ * @vm_proto:		Protocol version the VM (this kernel) will use
+ */
+struct ghcb_info {
+	unsigned int hv_proto_min;
+	unsigned int hv_proto_max;
+	unsigned int vm_proto;
+};
+
+/* Negotiated GHCB protocol version */
+static struct ghcb_info ghcb_info __ro_after_init;
+
 /* I/O parameters for CPUID-related helpers */
 struct cpuid_leaf {
 	u32 fn;
@@ -152,12 +169,24 @@ static bool sev_es_negotiate_protocol(void)
 	if (GHCB_MSR_INFO(val) != GHCB_MSR_SEV_INFO_RESP)
 		return false;

-	if (GHCB_MSR_PROTO_MAX(val) < GHCB_PROTOCOL_MIN ||
-	    GHCB_MSR_PROTO_MIN(val) > GHCB_PROTOCOL_MAX)
+	/* Sanity check untrusted input */
+	if (GHCB_MSR_PROTO_MIN(val) > GHCB_MSR_PROTO_MAX(val))
 		return false;

+	/* Use maximum supported protocol version */
 	ghcb_version = min_t(size_t, GHCB_MSR_PROTO_MAX(val), GHCB_PROTOCOL_MAX);

+	/*
+	 * Hypervisor does not support any protocol version required for this
+	 * kernel.
+	 */
+	if (ghcb_version < GHCB_MSR_PROTO_MIN(val))
+		return false;
+
+	ghcb_info.hv_proto_min = GHCB_MSR_PROTO_MIN(val);
+	ghcb_info.hv_proto_max = GHCB_MSR_PROTO_MAX(val);
+	ghcb_info.vm_proto     = ghcb_version;
+
 	return true;
 }

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index c67285824e82..179ab6eab0be 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1392,6 +1392,14 @@ void __init sev_es_init_vc_handling(void)

 	/* Secondary CPUs use the runtime #VC handler */
 	initial_vc_handler = (unsigned long)kernel_exc_vmm_communication;
+
+	/*
+	 * Print information about supported and negotiated GHCB protocol
+	 * versions.
+	 */
+	pr_info("Hypervisor GHCB protocol version support: min=%u max=%u\n",
+		ghcb_info.hv_proto_min, ghcb_info.hv_proto_max);
+	pr_info("Using GHCB protocol version %u\n", ghcb_info.vm_proto);
 }

 static void __init vc_early_forward_exception(struct es_em_ctxt *ctxt)
--
2.34.1

