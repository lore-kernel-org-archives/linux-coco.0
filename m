Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC2D7BAEC
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014905; cv=none; b=b7k5CxIh/QdqHklC2e5wfhyqASsagwa9WGoSawbwDkcyhob8XJYw7BOwWgwY3a9BEGRMt+nHDWjyY7bL4wfB9W3y41C3RYN4emCI2Wf5J0Bp9NUkHViHE1B+gcW+lV6joalz1J3Qp/B7HeudwizBCrQNBt5Z5Q9Keg7CEaHchEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014905; c=relaxed/simple;
	bh=/9mG+Gjg7peWW7HnQepJ7FLCY6yAMicMO5w7jMUE6lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XWVQgDKS3l1djT1slNtC7/CbHFM7CE3GdAbhadkyKrZWfjI5iRGcGfZHykwbUliS/w42fi9i6DR9cvnjjIRc+RbhyXTQO58mQHDB/ZTN1bTi3z71zckDc8mUoi+CFtErvhZ8+2eEOeY5boadKVAK0QNFlfAyFfRNiarY/pP+rAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFSdYC3J; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFSdYC3J"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so2820582a12.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718014902; x=1718619702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjh976F+w5dkctaCwhyVJIF3AZpvtw+7R+eeFp89bGc=;
        b=GFSdYC3JkWBY/p+/L8dP8MWW5GQGyMMI2fSAI+Ymn3216ce3UdHGY9ibl7jbXGUKjD
         otYmhKONf23N2QMXmpjlF1qB6bJXwz7LilD4OluejUqTK/BvseRBfW/ZfQDtU/2ZP51a
         9k+pMF2ig6YXSSFVsN9jGaEmMYkSALPjr2ig0y6S1EYOBffvweVyJM+dVDVu2tPuHr//
         vGZvRDtVYm5suPnjEhzFp5PN6/e+F6C+GFyncPnDZCayqueIT7fhtyQK0JUcMwhHGGqW
         SciSj9KOmKWxFkCL9pj/v5eU6iOPEBfWkKLGaq5WMkJBbSUt+Dmqoo+BiQqihBN2e9b2
         GjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014902; x=1718619702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjh976F+w5dkctaCwhyVJIF3AZpvtw+7R+eeFp89bGc=;
        b=N0j1WzwZ+izPMz64Jt35WlBnzZpjJoGbwXXVAq1mk8hxm/bu2wHB0PQBmZzMyqP7vb
         3O1EmG/tew3tik2L6Sk5YXtM3unaxF8YFtKXWs8zahKZPMZ8RRYQ3mvFEmT6KtzTfQRj
         lSNQZqOCzqlxZ1d7Nm6r5//LDj4qCE7F1kvWkNF/wHdfNuvXRV5U8pUEw4l95ROZO1nM
         NKOthDKTmLbgwz7+ruviBQOevlJfqGYmiWlb89lGPtl27CwFhO+lUDLgz3QM8aiVoWy3
         8JEakXjMtAHsd92mKaTYyPeOKsK0VkTs6qaNcuAFLtk1KYo7b4Pidqcookr7JY7iikAb
         0how==
X-Forwarded-Encrypted: i=1; AJvYcCVAPAHyR+9dyp4L3If1myRo2XXYzF5FbV5oUtP7Z4wpbpI00wsmT9rLCdw5Tuk0C0I7w1CA6oZLJ2NvU+wNfC64pcJO4XXD/BmEQQ==
X-Gm-Message-State: AOJu0YyLKCi0lo34XtAj6iGSiP++9mlqxG3toESdl9WCU28tBfOOzAwg
	kp6+osuoloPuQP6U4ooaFs9V7fS4mrS0YWNr+OhkZYKDZHX//p1B
X-Google-Smtp-Source: AGHT+IEHe6hQkeUB13VRsNS95Hd5J4lzAWr+VF1fStw/ZH7jO5g8M7PodQMj2dQ17+7klWDhdygebg==
X-Received: by 2002:a17:906:6a0a:b0:a6f:1d19:c0b1 with SMTP id a640c23a62f3a-a6f1d19c496mr194718166b.18.1718014902187;
        Mon, 10 Jun 2024 03:21:42 -0700 (PDT)
Received: from vasant-suse.fritz.box ([2001:9e8:ab68:af00:6f43:17ee:43bd:e0a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d7b35d5sm290887766b.192.2024.06.10.03.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:21:41 -0700 (PDT)
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
Subject: [PATCH v6 09/10] x86/kexec/64: Support kexec under SEV-ES with AP Jump Table Blob
Date: Mon, 10 Jun 2024 12:21:12 +0200
Message-Id: <20240610102113.20969-10-vsntk18@gmail.com>
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
index 6f681ced6594..e557eadb0ec9 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -233,6 +233,7 @@ u64 snp_get_unsupported_features(u64 status);
 u64 sev_get_status(void);
 void sev_show_status(void);
 void sev_es_stop_this_cpu(void);
+bool sev_kexec_supported(void);
 #else
 static inline void sev_es_ist_enter(struct pt_regs *regs) { }
 static inline void sev_es_ist_exit(void) { }
@@ -263,6 +264,7 @@ static inline u64 snp_get_unsupported_features(u64 status) { return 0; }
 static inline u64 sev_get_status(void) { return 0; }
 static inline void sev_show_status(void) { }
 static inline void sev_es_stop_this_cpu(void) { }
+static inline bool sev_kexec_supported(void) { return true; }
 #endif
 
 #ifdef CONFIG_KVM_AMD_SEV
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index 1dfb47df5c01..43f5f7e48cbc 100644
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
index 30ede17b5a04..e64320507da2 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1463,6 +1463,21 @@ static void __init sev_es_setup_play_dead(void)
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

