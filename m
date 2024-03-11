Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB264C601
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173861; cv=none; b=cQzB9EQSo/NI43SeR+CaD+k1KTSnNN2oz3qhDsZ8rfohyxDGGKyoHq/SqZO/LkMjdFrKzqWNvsczOA+e7yQ5DP0Hbz6YAAecZgnsmaGvI6sib2UPGX5tT1tgGw63XWELEhV+uNp9xoB2JyjlC516gR3i5Cx1xr1NToFchX36+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173861; c=relaxed/simple;
	bh=jc/74af7NZP+cpnNw9Qk/swCgD9N+vE+d+7fUoVN8BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rb1arEGENCRk3kAMwBc5Q3gaKw+2KfRJmJ1451GGsJJEfMaO+FbIkw9Ot0cSKiKhUkZatFsdnCs36w5raBZ+l8GrpnkyNbltiSoI2GXAdgx+su1Cj5hI3jiNHiJ6gIT9kCTAbZAC/7w+08+7a0vOr2pNIJUiVK3/4vfaUr+JsX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl9BMox8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl9BMox8"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4132f37e170so3677835e9.2
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173857; x=1710778657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lx7gS4QP7mPyluL8Zu2ZDhyswvsRIpNUouI6tZofm4=;
        b=Bl9BMox82bBV/UVu5Zu+f2Xx7mNXy8ck0u2sFJGvuIHTVCWKxrhnT0bI7kxriQceZS
         BpkpARSWhK1aD2PbZVBjeVhM2NwjTA5hxhTxel9DU3EADPCJUAPQU5VQ7CCBURq2pdph
         8EbJeUy11sc+TVyILbZBDPhFS6G4HCPxhjDDZgt9bHUAgX7qp1CCw/J+QKw/uszmgDGB
         LRyT4lWjI0Vczc3Mh8i5JJ6xVyBfD3xHV03AK/lWWC+JJ+EgGv6+/PbrJztEa9QC0T5x
         SYpCCk37OvlfxEumvELt3KyqwsfNI9h1Xht1lGGbn1+CgwKjGon3nK4VB9MYFqbRSlGm
         RHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173857; x=1710778657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lx7gS4QP7mPyluL8Zu2ZDhyswvsRIpNUouI6tZofm4=;
        b=rIup/uYEt3/LDR2MSgziFxi1ARB0HEPAlEpUIBOne5Fzzx5fiAvVrtHFiZ/YNCC+D5
         x+Akmc8mhjkj9D8bLU1wIitFf6SI3AJfuX1y0xGXs12dG+12jONj/rVfMJnZkZmyFjYJ
         T9LsmPBKHmfCqxAnTAWrCUgilVRm9XvjdV7WpB3aAOZWwTda90Un872eDZ8+uvbV+Nkg
         CjLMlEEnyYA9ko53XDzVenbd0WJhgDCAaQMQzSFgmOKUofW/uQ8lXb9yhG0nmZMi3hJH
         7gFW4jS4Sm57E+iYuLDkGg/fj0xYjPwAAm1LmCdHX+KxrLFhm15Ry+8jId1pRKLdSKEV
         KT8w==
X-Forwarded-Encrypted: i=1; AJvYcCXY+OLd+TvKdG5Z/FKv9zEeufK8z4wKRpchpsjq6+MHhkGfHX+fCbDJaal1C9rcQXTJ4UjBxWz3FdAbkEBdCAcNJXjCjYNaROP0Ww==
X-Gm-Message-State: AOJu0YyozOf6JIKqcWwGxPl+Au3pCDjdPQJPmpy0wsQly7znNyPYQjcE
	3EyxBz8t3RsrXVMEbmKGZlY40xBfdBgRQQoXrGn1qGoWHndI8AUc
X-Google-Smtp-Source: AGHT+IGnYShk1v+ZpEc4xRU9N5TjXvx2xTfMB9p+pJwWcXHMA9n5F9S6x1ihlL1DyRVWu7ib73UDKg==
X-Received: by 2002:a05:600c:358c:b0:413:18e7:2388 with SMTP id p12-20020a05600c358c00b0041318e72388mr4922789wmq.27.1710173856688;
        Mon, 11 Mar 2024 09:17:36 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab47:8200:c3b9:43af:f8e1:76f9])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm2823815wrb.89.2024.03.11.09.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:17:36 -0700 (PDT)
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
Subject: [PATCH v4 3/9] x86/sev: Set GHCB data structure version
Date: Mon, 11 Mar 2024 17:17:21 +0100
Message-Id: <20240311161727.14916-4-vsntk18@gmail.com>
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

It turned out that the GHCB->protocol field does not declare the
version of the guest-hypervisor communication protocol, but rather the
version of the GHCB data structure. Reflect that in the define used to
set the protocol field.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/include/asm/sev.h   | 3 +++
 arch/x86/kernel/sev-shared.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 5b4a1ce3d368..c48db0bfb707 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -20,6 +20,9 @@
 #define GHCB_PROTOCOL_MAX	2ULL
 #define GHCB_DEFAULT_USAGE	0ULL

+/* Version of the GHCB data structure */
+#define GHCB_VERSION		1
+
 #define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }

 enum es_result {
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index c02a087c7945..6adae48c501f 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -257,7 +257,7 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
 					  u64 exit_info_2)
 {
 	/* Fill in protocol and format specifiers */
-	ghcb->protocol_version = ghcb_version;
+	ghcb->protocol_version = GHCB_VERSION;
 	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;

 	ghcb_set_sw_exit_code(ghcb, exit_code);
--
2.34.1

