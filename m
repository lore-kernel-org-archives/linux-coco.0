Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266017D3F0
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014890; cv=none; b=V5h8qI90omSwHHAHs3fKRHYHjRlqGx0jMGk+5TqEZ4XmqSc5f/SehabR2PhAEg2gX8cVKNfJfU6UZ8iGro4U1DpYQRIzj1+q/QwJqHTh2JREZIEm6gHwMDmv7RCVLM41rHqtgIF2AJQ0jf/GAiv5Bcddqn5eZ7legDE0UOC+7iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014890; c=relaxed/simple;
	bh=sEdqF1TavEfxZMRrq6GYTKhkej+k4AMnxHaUkC+Lmk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hMR0FDcKhHeE3xhneKradARRxRmAhC4GzAkyJCKs9yxZzzqvPa4T7cx5NWJftT3UfY42lwjhvNBdgY2vUAw9OJCamytzAwg65WvefEW7LXVQT5UEFgb5iAK0wg2uWiQYlGDANgigJj8OUUCQC291W36u0G10WNAs9Y4ZY70aBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1XvxUVA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1XvxUVA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6ef64b092cso246173366b.1
        for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718014887; x=1718619687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCL4Vo5CEvbB78AJfWlszJwJfM4IkhVBnCtECteN90M=;
        b=R1XvxUVAuoxTgfnAk5wvJ22L7qol6oEhiObsnRyZVOZKJQo+Vr5BvFSWtEoxVQVFNe
         WqMfDldfORy1pJ4jsROnjCFF3SJiEWrybFw066V/mUqI5UsoiXLnw2kqy3wdJY3wbDDj
         u9q/l0LLYOyNkh70YUgcQ3ywMoyKWn186HMrcgn5T4h4dj1ZzauHVo3soFznHpZVvUCP
         M0ON3xzrhZWDW3QPqv7rQjUE8Rk/8Orx9WHmA/kzIp0+Qn/0iQr3NdhPCFSgSnEkVukI
         ghMfnzWgcH57bNyWWE0kwKtkXJxuHOD7T+bJEiFKxs0sZxfk1bxDyZhWNbAvXCCqJ/l2
         uBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014887; x=1718619687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCL4Vo5CEvbB78AJfWlszJwJfM4IkhVBnCtECteN90M=;
        b=jV56jvhYwERgfJKigcpcM3o+sCv0Z8W8leprXxk2q9jqq55vuR6y0D+Y8htiUvHQoF
         b1M062AdtxEghoRDg1XozzJSixzD0zQPu0VpcMw/t2ZF1kPxeowwllOjE7h+ugXyBngw
         GjlmF+ElYdcbfAHPcZ6lb0goYU73fpy3g1VFxlO2S+p3pi8htPSGFuynK7T8cUu10CAb
         2XSve2qEeXByZtvGqSZJLvujKBGE8Mq7AsTrH9mZ/XzxLBQe1L/L5fvOI5zMzAfxK2lV
         AMX99TDT7ukzWkBlj0O0mLVWBtchwrunu9rT1oCodxcIAlPDvgRFrLyRqyKN4bGPWLiS
         GPDw==
X-Forwarded-Encrypted: i=1; AJvYcCWT/+0gclBkNsr4fsNxySLnrzj4unlTgiaasmxFADWSz6K2t0MLwACGUW9uetpFPmUz2VT9aTvcEWq/uxGQfjtTBhnzJdvUCUP1MQ==
X-Gm-Message-State: AOJu0Yyl6QyT4K4uAImljL51NT2+Ew2kknPwwyrCQK8XB+qwlPgtaMb6
	JQy5pjbPbN8gJ0ELhuBBIX+LKwM7KRK8N9KcAQeTvmAa5xy61Yid
X-Google-Smtp-Source: AGHT+IEU4Gid3qf0r8Bb4VtO+jH0s35ne9U0e+dRyHVRPwaSrjMvMMb+EUFXtRe7Fz4xmoBBOgq/kQ==
X-Received: by 2002:a17:906:150c:b0:a6f:eb8:801a with SMTP id a640c23a62f3a-a6f0eb884afmr308071366b.56.1718014887288;
        Mon, 10 Jun 2024 03:21:27 -0700 (PDT)
Received: from vasant-suse.fritz.box ([2001:9e8:ab68:af00:6f43:17ee:43bd:e0a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d7b35d5sm290887766b.192.2024.06.10.03.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:21:26 -0700 (PDT)
From: vsntk18@gmail.com
To: vsntk18@gmail.com
Cc: x86@kernel.org,
	Borislav.Petkov@amd.com,
	Dhaval.Giani@amd.com,
	ashish.kalra@amd.com,
	cfir@google.com,
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
	michael.roth@amd.com,
	mstunes@vmware.com,
	nivedita@alum.mit.edu,
	peterz@infradead.org,
	rientjes@google.com,
	seanjc@google.com,
	stable@vger.kernel.org,
	thomas.lendacky@amd.com,
	virtualization@lists.linux-foundation.org,
	vkarasulli@suse.de
Subject: [PATCH v6 02/10] x86/sev: Save and print negotiated GHCB protocol version
Date: Mon, 10 Jun 2024 12:21:05 +0200
Message-Id: <20240610102113.20969-3-vsntk18@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610102113.20969-1-vsntk18@gmail.com>
References: <20240610102113.20969-1-vsntk18@gmail.com>
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
index b4f8fa0f722c..f5717eddf75b 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -23,6 +23,23 @@
 #define sev_printk_rtl(fmt, ...)
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
@@ -159,12 +176,24 @@ static bool sev_es_negotiate_protocol(void)
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
index 3342ed58e168..f0d87549b1e1 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1399,6 +1399,14 @@ void __init sev_es_init_vc_handling(void)
 
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

