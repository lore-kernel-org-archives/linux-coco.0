Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801B92DEA87;
	Thu,  4 Dec 2025 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852497; cv=none; b=ZX+AfPwXvD39z/jrvB772dC/E+WgpmmHL3o4SvDPf7DDxNDtfQls+qvme2wJOsjvo4hdg4pe0fNz8vslW2IsSZkTLY1q569hbM5hG8o85fs7HLKN+dLiliZfWpoccwz/KiOAgnGeSzNdFfaIvuKowUrSnNhUTffHpaUyFWeJOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852497; c=relaxed/simple;
	bh=2PzUwxjFW+lWkQvDv94SlFMt2YbOZ2fV4L5SD/pDEZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYOstRRisZjWGAdo7KIO458Nc+Tj5vnOM8kdFAg3RBTgRSjccqB+PFh6+kiNYhCPrpIaZbenXIzCukR+2ImK2h3P+zmBTQPlL/2v27lvdtRHCa3HkvlFj6Epsg3B2PQ09PQL7jy40TzSIFPUVawCuzTFtGjV0l+AUWQlmYHg5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6QLMuB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6QLMuB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE44C113D0;
	Thu,  4 Dec 2025 12:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764852496;
	bh=2PzUwxjFW+lWkQvDv94SlFMt2YbOZ2fV4L5SD/pDEZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F6QLMuB0g6/T6Rli6wUNjq/JMogEtOd+M7I9iFlm+TANlijmWn7u4y9L1uZfHc2Eh
	 KxFw1Dm1VaItlR2gQ4jq7IHC3tA+Tq/IKz2hKC0BrLYdliHjxawsU4IJdiBjVplrcc
	 UtJd2jkRRhzfsyRvEblqeLtboLFJMm2/4Yf1mRnqL1AkVQTGL6OXhCmk5Yr/1N0q88
	 g5ypkmwScRRBR3CZ6I3HscOYaYeCi+Q8RzOzq6Rb0CrEefIixXS6FECVS6oOawcJH8
	 8HElt4XPUO7luAApRXAr8egzBE+LkiJilS/8dbBwDkAJ0Nd7Rh+xqbYrsdGtW5/0uv
	 E9JoYaVLliveg==
From: Borislav Petkov <bp@kernel.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: <linux-coco@lists.linux.dev>,
	X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 2/3] x86/sev: Add internal header guards
Date: Thu,  4 Dec 2025 13:48:07 +0100
Message-ID: <20251204124809.31783-3-bp@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204124809.31783-1-bp@kernel.org>
References: <20251204124809.31783-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

All headers need guards ifdeffery.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/coco/sev/internal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/coco/sev/internal.h b/arch/x86/coco/sev/internal.h
index c58c47c68ab6..af991f1da095 100644
--- a/arch/x86/coco/sev/internal.h
+++ b/arch/x86/coco/sev/internal.h
@@ -1,4 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __X86_COCO_SEV_INTERNAL_H__
+#define __X86_COCO_SEV_INTERNAL_H__
 
 #define DR7_RESET_VALUE        0x400
 
@@ -85,3 +87,4 @@ enum es_result sev_es_ghcb_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt
 u64 get_hv_features(void);
 
 const struct snp_cpuid_table *snp_cpuid_get_table(void);
+#endif /* __X86_COCO_SEV_INTERNAL_H__ */
-- 
2.51.0

