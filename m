Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054784F205
	for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710173868; cv=none; b=AT/1wiqsxrBrEn7ExzOVuxCh32CFtQyjLDIk4Z8hjy4ZD/TwDxLMwNwxINn7GVd2a6+MwOs+D2glEsoL7FiOSnSITM220+uvoF6vribakLpJnk8p1RD4ZP6u4JM+XozZ8JfWRqP2qx6j2/+TAlTTXi0RGyx9AxPSD12xG1Ess5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710173868; c=relaxed/simple;
	bh=llvDKlG/ax7CEpz4qGsKLKsgPZfmj8Qxs/13kcLEhp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BINuQrqMD7E4MR1WN0gLDmQliKl9U99jr4BpkcrHx5duFHvsnpBXeou1a5qg26ymn2FMx35Ny95e3ACCcHMXBJhfBYwif/fP2d+LOtPGeYlgutR/lfACf4BNRhaVcL0fvpHQOpk6xq0PgcWMB5R0faDOvsrI+fD9HG02dN8Igoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhMx+Amo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhMx+Amo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33e570ef661so2458493f8f.1
        for <linux-coco@lists.linux.dev>; Mon, 11 Mar 2024 09:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710173864; x=1710778664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD+5e2rjcMTAqm1lLiHG9HKUMBAWFA80T0od8hhMD6s=;
        b=hhMx+Amorjzx/pMxa0GsnuEOLjpKQWaPeTmicWru45MIW/sh0EtbehXUo1exePsyOg
         E9xmDbtvI/oN6zXn3SeEGtYM6lgdnX+R0LKKI5Bv53aHMve9wa2T8ArYfpPfF1A4qhyn
         fXF5gFDM3rv863B/510nmZbG/n5ykoXbI8mLl63VvFKr0Z21d3hSvSD6w+OkS6xundNj
         5Cf9CxSBO+TzWOGS/XMlUDotesh3EpWi4+4wQQslSGSI1jrL4+vjx2lRdqMY7NPP+lD3
         rvZSf2JrXs6wVRV5KfwaQCVSzjO6XPjOIFbJI0k2y07x8UykNZGfuQUqLLquiyTB6MKt
         mq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710173864; x=1710778664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD+5e2rjcMTAqm1lLiHG9HKUMBAWFA80T0od8hhMD6s=;
        b=Qrp0Yeb610+sqH1QVpDOUgSLZKWSuqI49ApKuOV3R/hlqZmEU58xIOcx+ZCPaFQq2G
         4lJqrvvK7xTsoEYRcUOPka+ddDoDi44vPQizX3aTw9LjjIfFY7okVvvHtKTSGWMY7Z2O
         CyxIPjcLwOrwUvY//49Q/eSUiwGwBJK5FNEkz9kdgzhrbiRXViOJdhz9LBeZJW0lGfWw
         sJcAyssLEUjwbdOin8qUK3MT2zvycaIDn219eCoa5XTI7/an0RNnPJ4c/VFKTm3hcCXh
         VTVXx2Rjpy7FOh8KzVi5xOrVa6A2Y/x0KziSxJUfgIrkBEs9ks6qHu0LqTtJILacVyE1
         iEdA==
X-Forwarded-Encrypted: i=1; AJvYcCVUKTlwxkYX6LYsTBEvpRaltShqdJt91LoicJp8XyR5b5OJgvRX9kfIUiOpCWhvXVtm2PKhWw4QLq1jjveRd1wTB5qkWKIYpAAsTg==
X-Gm-Message-State: AOJu0Yze6B3QgUTqdH2jbs+RRcgHlQZIgKWEcpr6fQBIiowckmslW/22
	tnMolIwKn3jYX2h9cCsZ+iaN8mPsrrTTGfroaKU0EpbhkNAq0954
X-Google-Smtp-Source: AGHT+IHYTDHzYrXzvp4OecC7PPYjSNE0zn/Q41wyIcFJBRWeQZQzaCiAotWHf7DRRVcFdGjRxY3S1Q==
X-Received: by 2002:a05:6000:cd2:b0:33e:82b9:5cc7 with SMTP id dq18-20020a0560000cd200b0033e82b95cc7mr603908wrb.6.1710173864253;
        Mon, 11 Mar 2024 09:17:44 -0700 (PDT)
Received: from vasant-suse.suse.cz ([2001:9e8:ab47:8200:c3b9:43af:f8e1:76f9])
        by smtp.gmail.com with ESMTPSA id ba14-20020a0560001c0e00b0033e96fe9479sm2823815wrb.89.2024.03.11.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:17:43 -0700 (PDT)
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
Subject: [PATCH v4 8/9] x86/sev: Handle CLFLUSH MMIO events
Date: Mon, 11 Mar 2024 17:17:26 +0100
Message-Id: <20240311161727.14916-9-vsntk18@gmail.com>
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

Handle CLFLUSH instruction to MMIO memory in the #VC handler. The
instruction is ignored by the handler, as the Hypervisor is
responsible for cache management of emulated MMIO memory.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Vasant Karasulli <vkarasulli@suse.de>
---
 arch/x86/include/asm/insn-eval.h | 1 +
 arch/x86/kernel/sev-shared.c     | 3 +++
 arch/x86/lib/insn-eval-shared.c  | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/insn-eval.h b/arch/x86/include/asm/insn-eval.h
index 54368a43abf6..3bcea641913a 100644
--- a/arch/x86/include/asm/insn-eval.h
+++ b/arch/x86/include/asm/insn-eval.h
@@ -40,6 +40,7 @@ enum insn_mmio_type {
 	INSN_MMIO_READ_ZERO_EXTEND,
 	INSN_MMIO_READ_SIGN_EXTEND,
 	INSN_MMIO_MOVS,
+	INSN_MMIO_IGNORE,
 };

 enum insn_mmio_type insn_decode_mmio(struct insn *insn, int *bytes);
diff --git a/arch/x86/kernel/sev-shared.c b/arch/x86/kernel/sev-shared.c
index e9a959c1c11d..ac0704055d58 100644
--- a/arch/x86/kernel/sev-shared.c
+++ b/arch/x86/kernel/sev-shared.c
@@ -1164,6 +1164,9 @@ static enum es_result vc_handle_mmio(struct ghcb *ghcb, struct es_em_ctxt *ctxt)
 	if (mmio == INSN_MMIO_DECODE_FAILED)
 		return ES_DECODE_FAILED;

+	if (mmio == INSN_MMIO_IGNORE)
+		return ES_OK;
+
 	if (mmio != INSN_MMIO_WRITE_IMM && mmio != INSN_MMIO_MOVS) {
 		reg_data = insn_get_modrm_reg_ptr(insn, ctxt->regs);
 		if (!reg_data)
diff --git a/arch/x86/lib/insn-eval-shared.c b/arch/x86/lib/insn-eval-shared.c
index efc9755573db..3d71a947e562 100644
--- a/arch/x86/lib/insn-eval-shared.c
+++ b/arch/x86/lib/insn-eval-shared.c
@@ -897,6 +897,13 @@ enum insn_mmio_type insn_decode_mmio(struct insn *insn, int *bytes)
 				*bytes = 2;
 			type = INSN_MMIO_READ_SIGN_EXTEND;
 			break;
+		case 0xae: /* CLFLUSH */
+			/*
+			 * Ignore CLFLUSHes - those go to emulated MMIO anyway and the
+			 * hypervisor is responsible for cache management.
+			 */
+			type = INSN_MMIO_IGNORE;
+			break;
 		}
 		break;
 	}
--
2.34.1

