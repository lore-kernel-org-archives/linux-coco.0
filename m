Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA58F3FDBE8
	for <linux-coco@lists.linux.dev>; Mon,  3 Aug 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785761918; cv=none; b=SLanJDw0KfGkM1++NGIzTk0tyfe/bmZ+GbPK1EeH//ofeKdEuxLo4YFuEW5Ivc4QXB7O1hK87Aqr4x6cz++N4P9550zMI1+dNEg06X8B5WVzqzDo0CqIWVsxfkeN/gYWp0D5URQgWXcUfBGSYjIWq23aTc+lq+ASbMmSRVikicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785761918; c=relaxed/simple;
	bh=R+Ar3yBrniugNjId+jprCE3vAdM8SKtJaLWuOK/wgbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LghEIPk/beaX9YnQ3NJYtjSSW05BlEy794ht3MKb0pbPJrZIVgEfiyWOrw4SNAN8gkqRIUYjRWUkaH0znvhu7l4n56WiDdDTT7m9kxYgm10k7S+QtXjwqlgfu7m8gwqz+sHT2KI+Ncj77jQXJgockhMiIoIm79Vk8eOP4NMsrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from io.fritz.box (p200300f6af4fc500dcfec4a187edd2e0.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:dcfe:c4a1:87ed:d2e0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 67B26204177;
	Mon,  3 Aug 2026 14:58:29 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: hpa@zytor.com,
	Tom Lendacky <thomas.lendacky@amd.com>,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Joerg Roedel <joerg.roedel@amd.com>
Subject: [PATCH 1/3] x86/coco: Add CC_ATTR_GUEST_SEV
Date: Mon,  3 Aug 2026 14:58:25 +0200
Message-ID: <20260803125827.718024-2-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803125827.718024-1-joro@8bytes.org>
References: <20260803125827.718024-1-joro@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joerg Roedel <joerg.roedel@amd.com>

Add a new attribute to the CC platform code to check whether the
kernel runs in an environment using SEV memory encryption. This will
be used to establish the an sev/ directory in SYSFS (which is
currently SEV-SNP-only).

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/coco/core.c        | 3 +++
 include/linux/cc_platform.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
index 989ca9f72ba3..63c06c2ac409 100644
--- a/arch/x86/coco/core.c
+++ b/arch/x86/coco/core.c
@@ -95,6 +95,9 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
 		return (sev_status & MSR_AMD64_SEV_ENABLED) &&
 			!(sev_status & MSR_AMD64_SEV_ES_ENABLED);
 
+	case CC_ATTR_GUEST_SEV:
+		return sev_status & MSR_AMD64_SEV_ENABLED;
+
 	case CC_ATTR_GUEST_SEV_SNP:
 		return sev_status & MSR_AMD64_SEV_SNP_ENABLED;
 
diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
index 559353ad64ac..f87ee0652b04 100644
--- a/include/linux/cc_platform.h
+++ b/include/linux/cc_platform.h
@@ -73,6 +73,15 @@ enum cc_attr {
 	 */
 	CC_ATTR_GUEST_UNROLL_STRING_IO,
 
+	/**
+	 * @CC_ATTR_GUEST_SEV: Guest SEV is active.
+	 *
+	 * The platform/OS is running as a virtual machine guest and actively
+	 * using AMD SEV memory encryption. This is true for SEV, SEV-ES, and
+	 * SEV-SNP guests.
+	 */
+	CC_ATTR_GUEST_SEV,
+
 	/**
 	 * @CC_ATTR_GUEST_SEV_SNP: Guest SNP is active.
 	 *
-- 
2.53.0

