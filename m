Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFCD12F5BF
	for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014907; cv=none; b=GqT6ilxnYm87BqX5LExdMMWiSjpZp9HzLwOTxK9ro8CVarq5cdOJp5KzsbeGqbg8qAywoUiCgQaiQf4BpbxR4YkoO9s/jTINNQPZj5flGegDyP0Y1262jXbxO/kPWngeNBa18X8d4BGbOw0yBy/DjWm61r1otZl64DKadZOeCvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014907; c=relaxed/simple;
	bh=RIX6F02RU57kcYISt2QqN6Kv/cJq5+UN3QzaEDCLbYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S6IBigkLXIDRraz8NAgDbZBOWPzhOUegAMKoiXPM+z3Ie5xz0U95PIvyW1MWZHGMKAgXMnFnSf1knwJw4trnLuITYIvvYsPWOvMfbSyPigqHUoT2JNUzN56AH+u3xEP6anUQP0fh5BerIxwe5j40oTd41LO4FRwrCam+kUwRavw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdAv4rrS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdAv4rrS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6ef8bf500dso216995666b.0
        for <linux-coco@lists.linux.dev>; Mon, 10 Jun 2024 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718014904; x=1718619704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdG6ACuG1uJUkfwp3EsaLBLMvj3TgqNuoQIAGjhnFXs=;
        b=WdAv4rrSgbiAxBvfggQpWUgBiNfM9zf3SupSMmHeyAjsxUPlEHGULOjuiotXFP+7uV
         u01FeI9yd9pB6vvWM/BoD0JzEQ5zV9dN2pbywRSCt+xIQgZvSWLoittxpD/sZLrMXhwQ
         rJXR35uSgksEKnh8UTVhQ/Yf89GVLF+A9BQ6bA+Q0YDzirlRHVP4D6M9sNEkFBVNMZlG
         SqL5cQFHovkjke2hqXQdYBm6WNNM1BTpyIutd+iWOREvSa4gZlUTHGbYqgmpXtBBnIJs
         Dg3clk3fraVRylxqekeL+2LofhQ+mabkryhq1sIgE36eQHLuff7P8ELHypE18eMt1cgM
         7gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014904; x=1718619704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdG6ACuG1uJUkfwp3EsaLBLMvj3TgqNuoQIAGjhnFXs=;
        b=E4N2mCNJocxuqnRnPzavr/qIj55+VONPQ4hQY75Hrm5un6W5PGCn7ysPHscKZrd8Ux
         7C3gmjs1wM2qYxD85cCbeBLx9Wt1kuCFjKicUdYiOMAYNU9SAVjfXQqiSJkowHfvjYid
         QVjv0GgmQl7VNK3BV5BoLzvVFpAg9DOW5vA2BHWp0g7igRDwmOInwMMoK1m749xdNUCs
         TW2FnK9WMqqcZdo4qs1t7Fu09quLH9VZ1ufBDYvegDNt1X7NFxPEdf270wvbjPXgrH75
         GtDd+rwrMRNSk/1sEEpit3bAl45xKFwaCfjPvRMutn4+Ue9V+FapJXIIPBpkBmA8shMC
         IngQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNjQ+DiNQ8pOjDp6l2nKGo2F+zGrNi8/vJrI7C9DaAsFuyv4eavI4K+35wyorHIyhAXkIZmsPcRyXXFCLjfvkvErFbPeFNo0RJ+g==
X-Gm-Message-State: AOJu0YzDXKsQZPJCZRcF5I+U4WLAk3ABo3ej10dDGPYs45RtplOKo5+A
	hyTPv/GBvaItu/nJL76OJ1p9GOhjNyqQB2Kq7jTS6n+4Vt4M4PHT
X-Google-Smtp-Source: AGHT+IG+5xSdjmTwqQbKCwcV+YEwd87sFYBvU+bVS0NNITGRecW7wGay6Ao5a2CebEX1GwPUmPMrcw==
X-Received: by 2002:a17:907:9486:b0:a6f:1798:bf80 with SMTP id a640c23a62f3a-a6f1798bfabmr270645066b.52.1718014904098;
        Mon, 10 Jun 2024 03:21:44 -0700 (PDT)
Received: from vasant-suse.fritz.box ([2001:9e8:ab68:af00:6f43:17ee:43bd:e0a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f0d7b35d5sm290887766b.192.2024.06.10.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:21:43 -0700 (PDT)
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
Subject: [PATCH v6 10/10] x86/sev: Exclude AP jump table related code for SEV-SNP guests
Date: Mon, 10 Jun 2024 12:21:13 +0200
Message-Id: <20240610102113.20969-11-vsntk18@gmail.com>
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

From: Vasant Karasulli <vkarasulli@suse.de>

Unlike SEV-ES, AP jump table technique is not used in SEV-SNP
when transitioning from one layer of code to another
(e.g. when going from UEFI to the OS).

Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/kernel/sev.c    | 6 +++++-
 arch/x86/realmode/init.c | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index e64320507da2..a9cf74512269 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1392,7 +1392,8 @@ STACK_FRAME_NON_STANDARD(sev_jumptable_ap_park);
 void sev_es_stop_this_cpu(void)
 {
 	if (!(cc_vendor == CC_VENDOR_AMD) ||
-	    !cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
+	    !cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT) ||
+	     cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
 		return;
 
 	/* Only park in the AP jump table when the code has been installed */
@@ -1468,6 +1469,9 @@ bool sev_kexec_supported(void)
 	if (!cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT))
 		return true;
 
+	if (cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+		return false;
+
 	/*
 	 * KEXEC with SEV-ES and more than one CPU is only supported
 	 * when the AP jump table is installed.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064..ed798939be5d 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -80,8 +80,9 @@ static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
 		 */
 		th->start = (u64) secondary_startup_64_no_verify;
 
-		if (sev_es_setup_ap_jump_table(real_mode_header))
-			panic("Failed to get/update SEV-ES AP Jump Table");
+		if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
+			if (sev_es_setup_ap_jump_table(real_mode_header))
+				panic("Failed to get/update SEV-ES AP Jump Table");
 	}
 #endif
 }
-- 
2.34.1

