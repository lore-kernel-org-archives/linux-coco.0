Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E20456B86
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173869; cv=none; b=jM++a2VVXw2VFY2VJgzDH1AI8SeoYhrk9DZvOGXP9ueYZStv1WkdXhZsw0ChHTYoMqtMWT8JUj4QmF6+i/kE50+mjREKDTa+3Ed30t32KYrfMN7E8zqm+NeOpZDW6Gd4fNK1h+7o/jJZtU9Pi8TNOfPijx/WJyC9qYBqSSahh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173869; c=relaxed/simple;
	bh=ruyWOEutbzTX21I1GbtMMknQjZcW/AmsekAFWxYC848=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SxrQiH4Hvjj5rAqGuF30njOjwuApsi0iUxiLNEVLQlz45OOe+IDrdXaeaMTl3gRkXSNgwhPqs6+T96239Go+ZiZN3/Rxr6DdGxXfEli4yfYGM0jmS28Mrf0NG8fkvocEa+bMjO4cm8rx6Chwl8OpakUg72rjD8OizCBGAr4aOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPqpJSS0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPqpJSS0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33e9ba0eadcso628966f8f.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173866; x=1710778666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImRzpHgQ7+uutfuh8SJRk0DTE4K/6LtArW0nv9lfM+k=;
        b=HPqpJSS0JLK8BA9FKyCIxP93s2yEhyATzho8xcLV0dlUYgN1YxTgjDe2wujaCXPWQM
         k2V4FhJuZAd+hr5g07t3wlSmnhGFZBluJHABb58FSM+crYBNGHuQC4Z2QbsyJyCBcUh/
         MMvNscBa/qj9uqXBWIyCwzlDxWvDM58A2hG5cVsLUgmG5QIzbePbJM7g7PY6cit4sFMd
         VjW/fy2zOtAvLRSqvxKbwIrIOaJLl05+PvBPGtcEUyvM+E3Tx5qVzwdozX+sV2FgYLcB
         99fuU2f+Ps6LdtLwFxOd+FlTPDX81M3Xw1GeDmUhWt1y6pl3NT0KNxAODpRVPG6OIzqE
         DYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173866; x=1710778666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImRzpHgQ7+uutfuh8SJRk0DTE4K/6LtArW0nv9lfM+k=;
        b=dZzNFMEWhhQCoDv9dJY898W6CbJWjc7UPWgUJj+OadaWuwpaRQ6FRK4ztvmZueRNZl
         IFnEgwrhc+xpG3dTQcroVAG2Agkxi5Q/gckZAiE9UDMdbYNNTLacMgSXuWAYnehQw8um
         A1Xt1ST6StAXjQE8ZgtbUyrawip5RdVsCqsVaqvCLENbOvXQyUlscn9Z2np5+oWJacKV
         Qvr0qntsX5j81NbqGYHJWBiao0+pCRUwmPV0lW26XhvEy70/mcha0hjLLrhJSIsPsKrO
         HeyEhzRE5mPEJY47aMA8uWH326Mg7s4F4Y7MC8AfxbXkrF4O7o1wZyr6EQDqPj0ZYlGH
         uCCA==
X-Forwarded-Encrypted: i=1; AJvYcCUDzRNvdNn6/RWaZ7nM7VTGFjIZbZeapcixMKIgiDYJetZgSC26PA8Ke+HVlxvpqeEEq+kYHm8xAEw4xf1zAnH3Q1o6XbzItGHo1Q==
X-Gm-Message-State: AOJu0Yw2q+T7kiCMT19j7fQ/lmYwonqwAjZKk/mkP0tLOv2dGKmGPzlG
	2lWwGVCH8DvuWWORFtlTI8ARvEY4FRz7lgiOFl2ss5aFMCUjpWlq
X-Google-Smtp-Source: AGHT+IEG0QdNGOuIWSe9NXJvczTc8p7SlmtsuTs9Nh46GFsp/syoRmIiV9TumgTcGzwe4lIUdTQkcw==
X-Received: by 2002:a5d:6611:0:b0:33e:5a33:b169 with SMTP id n17-20020a5d6611000000b0033e5a33b169mr4250288wru.28.1710173865721;
        Mon, 11 Mar 2024 09:17:45 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab47:8200:c3b9:43af:f8e1:76f9])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm2823815wrb.89.2024.03.11.09.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:17:45 -0700 (PDT)
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
Subject: [PATCH v4 9/9] x86/kexec/64: Support kexec under SEV-ES with AP Jump Table Blob
Date: Mon, 11 Mar 2024 17:17:27 +0100
Message-Id: <20240311161727.14916-10-vsntk18@gmail.com>
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

When the AP jump table blob is installed the kernel can hand over the
APs from the old to the new kernel. Enable kexec when the AP jump
table blob has been installed.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/include/asm/sev.h         |  2 ++
 arch/x86/kernel/machine_kexec_64.c |  3 ++-
 arch/x86/kernel/sev.c              | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 2dbd2238325a..26027083a2a9 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -217,6 +217,7 @@ void snp_accept_memory(phys_addr_t start, phys_addr_t end);
 u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_es_stop_this_cpu(void);
+bool sev_kexec_supported(void);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
@@ -246,6 +247,7 @@ static inline void snp_accept_memory(phys_addr_t start, phys_addr_t end) { }
 static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_es_stop_this_cpu(void) { }
+static inline bool sev_kexec_supported(void) { return true; }
 #endif

 #endif
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 3671ea1a5045..6013ba6fc16e 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -28,6 +28,7 @@
 #include <asm/setup.h>
 #include <asm/set_memory.h>
 #include <asm/cpu.h>
+#include <asm/sev.h>

 #ifdef CONFIG_ACPI
 /*
@@ -269,7 +270,7 @@ static void load_segments(void)

 static bool machine_kexec_supported(void)
 {
-	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
+	if (!sev_kexec_supported())
 		return false;

 	return true;
diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 73477eeb7de2..66e85b82d170 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1456,6 +1456,21 @@ static void __init sev_es_setup_play_dead(void)
 static inline void sev_es_setup_play_dead(void) { }
 #endif

+bool sev_kexec_supported(void)
+{
+	if (!cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
+		return true;
+
+	/*
+	 * KEXEC with SEV-ES and more than one CPU is only supported
+	 * when the AP jump table is installed.
+	 */
+	if (num_possible_cpus() > 1)
+		return sev_ap_jumptable_blob_installed;
+	else
+		return true;
+}
+
 static void __init alloc_runtime_data(int cpu)
 {
 	struct sev_es_runtime_data *data;
--
2.34.1

