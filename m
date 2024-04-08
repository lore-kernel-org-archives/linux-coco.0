Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044A2381DF
	for <linux-coco@lists.linux.dev>; Mon,  8 Apr 2024 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712562070; cv=none; b=BoJdjY5r97zHNdRYL+vjUGGW3Comb2XIxJdJVU4dQjpqD8LEBhb4j3bNly3Y1U+xaGtbHv8ZC7uXFzKn4/jx0FKB8T241JHhd4YNo+uPuUN3voWDNvmDrlD1LhOd7c1kQwWy8CGxfHCIesUaE5I1ZPhw4f3EAarYPK9yJ6XLtuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712562070; c=relaxed/simple;
	bh=PA9tlwrHq9EaQDOrpwGW0uMmK8o23cX/zpKO//Uv5ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJiDiYh+rPmmJy591/xNX25rPAcSIBNXJV2qavLHhMC4Q4STJXI+CqVH3n0peS9po0E2h9NTbeEFgcy9RN9yA8otJhfN6NtDNm0fnB088bpz/vQGXD380mBH4MVadY2uR6qGy8tsBewXGLT3F5UxK+osVVDEIMPDVX0M9b9OuGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbs1qMLL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbs1qMLL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-343cfe8cae1so2538621f8f.3
        for <linux-coco@lists.linux.dev>; Mon, 08 Apr 2024 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712562067; x=1713166867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lm8IoXJe0WYSRwtdxW3X+Cv5dkEchtxnhEW0S0YWJc=;
        b=nbs1qMLL+17ggAyk2UlgbRPMvgVwu4oSiJYsamoA3Uhb47GzvN5Dlb8GwYgkoIsIzD
         2oFQuhoXRMD4uNoVXxDEQtwC1c2tMYy/JLvuEgUlXlcqbuofylxiIK437WCloEkp3k17
         LUvqP7wZ7ykSqI84x2oQBoqy3SzfF5oUymVyJeouHzXA8si6jmCmqdnw3DjTrNZRVoVv
         cfoP9nWw/Gcj3fZ02oxEopWO1aaJbqXbZ6SgbjpKSuV7RA9himIjMp16qG2haEvr1WvX
         E3WmnfJrMd0omfEhdlrdjgodj2zVL+J0pP6dm2mACLCIKOdqWCOZFOWjkCd2eIl6vMWC
         xwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712562067; x=1713166867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lm8IoXJe0WYSRwtdxW3X+Cv5dkEchtxnhEW0S0YWJc=;
        b=twWg90frG62fOoQ8yg5SfjzBZ5ia8lTKUUDGWCYHm65tXPYERq6/FpiwysTB8lZ4M8
         Q51PbU/wGXR/BZhNQg1/xqB4uzSpfmBMQt3p5K1zXhVN2/Em0YrCPWRQlCcgHUzNyvZF
         okUgy67VYp3bD08sQ/xFvDObjJ/W306nAuN0NahN6k3X6B+5B7RnkTvX9L47xA7T5PTT
         cRAUw7rIFEvTdj9/pLky/Fm9TOmECJwPdFkwiOQzRiyyRfAU/IYWU8eelac4aUci5/EZ
         hvMUnwGSdSKL04y/LMmR1OUJkBW3b2wkbgVYKwpaWZHqLaH2jZhn7jnRP1B944xKZlSn
         wqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbO1h8yi4Pu13w8n9uwzl/cFYwxoPGy1pXPMT9+W9kwRQWBMuVU2li62q+lLHvJ/kqUXS6qIh9fTRY7JTV1HrLAOytyE29KUefgA==
X-Gm-Message-State: AOJu0YysulgqR1JFLJz7t+Uy/pvKGcG4tRsP6A2vWWTYlC4aHHZSMaRW
	cJgvL01SU4FrkHL8dOClx3gfOMX2eYQRpkQKqP4uOs5ke1S9+SSa
X-Google-Smtp-Source: AGHT+IHsw0MqJncrkEsTav8GeBQKVLnnHHhYYl9/Fi+5JZD1076agLCl079JWImEZPXFh0LSDyynKw==
X-Received: by 2002:adf:e44c:0:b0:343:d06e:51cc with SMTP id t12-20020adfe44c000000b00343d06e51ccmr5136276wrm.66.1712562067341;
        Mon, 08 Apr 2024 00:41:07 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab70:9c00:7f0b:c18e:56a6:4f2])
        by smtp.gmail.com with ESMTPSA id j3-20020adfff83000000b00341e2146b53sm8271413wrr.106.2024.04.08.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 00:41:06 -0700 (PDT)
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
Subject: [PATCH v5 03/10] x86/sev: Set GHCB data structure version
Date: Mon,  8 Apr 2024 09:40:42 +0200
Message-Id: <20240408074049.7049-4-vsntk18@gmail.com>
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
index 07e125f32528..829650bdd455 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -19,6 +19,9 @@
 #define GHCB_PROTOCOL_MAX	2ULL
 #define GHCB_DEFAULT_USAGE	0ULL
 
+/* Version of the GHCB data structure */
+#define GHCB_VERSION		1
+
 #define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }
 
 struct boot_params;
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index ba51005ddde2..fb62e1582703 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -264,7 +264,7 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
 					  u64 exit_info_2)
 {
 	/* Fill in protocol and format specifiers */
-	ghcb->protocol_version = ghcb_version;
+	ghcb->protocol_version = GHCB_VERSION;
 	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
 
 	ghcb_set_sw_exit_code(ghcb, exit_code);
-- 
2.34.1

