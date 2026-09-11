Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CD34477F6
	for <linux-coco@lists.linux.dev>; Fri, 11 Sep 2026 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126401; cv=none; b=TLO32s9wpazqCqUP/LUkwTeJaVFgVkJ1i8DKydj2YvwcIi8ybOym4/i1w8GgUjKoRDGQUSRndW2T4krrSkvV3rRXITDD2hK45fxwUX/EwCIOPTdy0xXaJUNShMEZPpAG0Iim4QFt5lnxmACB1ogUFIjMA72tuX7+w0q5l47dJHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126401; c=relaxed/simple;
	bh=4gsBUvhGtrQa+sQ4x/31JHL2S1OFYtSv9l9GPyaTvnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PKViN20PxsLoZazS9q3H6Q+uWjpY/WvFdFBAyLziWM/0/tw2TQT7J7/KabXd3oPZz6w5W5qmau5j2rHWaEqA8YEuBnDhcXaMOhsqxJQpHVeFJOb1ZJjnxvMMKnu8klUvWHBRYMB+qzRv9wIZsA9MiFyOrpuXrtW/E780aKj994k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Tuo3UNM7; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YfAbuDBN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Tuo3UNM7";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YfAbuDBN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B11901FEED;
	Fri, 11 Sep 2026 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789126387; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DHKp9D9pUaLukUcfg/8mPN9q2/rApH5Y4FVo6pZJciw=;
	b=Tuo3UNM76irUxmIZAhfHuKPvtLUeMirAbUqdw2pqTON56lkpRuPyXg6FhpXZC5eVyvlaiY
	Vlxuv5VrwOQJJ6pX+DmE5jIaTKC2IvmUrXiNSs4xq9s4GY7Cng7tV31wmiULUhFZ71hxzk
	Aa4Q1T30qIWfK9W9LwUXE3hfT+RYMJ8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789126383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DHKp9D9pUaLukUcfg/8mPN9q2/rApH5Y4FVo6pZJciw=;
	b=YfAbuDBNZbo55tLBa7/H4r8RuaaQyZ1wk9pc+NSQThXajeuWuMsHkrjWLlSa1IXSMlmjJm
	+shLpXNE6Sr6L//Nui5001BdDDEBup+mWvltCwQSj2CMJBEnlItR/MmPOCyep+daUzy/8S
	Oc4hbqbZH9hlAvdUYPPJhBDGfixh+aY=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 221AD136ED;
	Fri, 11 Sep 2026 11:33:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G+vqBe/mo2ryRAAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Fri, 11 Sep 2026 11:33:03 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: dave.hansen@linux.intel.com
Cc: x86@kernel.org,
	rick.p.edgecombe@intel.com,
	seanjc@google.com,
	linux-coco@lists.linux.dev,
	binbin.wu@linux.intel.com,
	xiaoyao.li@intel.com,
	Nikolay Borisov <nik.borisov@suse.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Subject: [PATCH] x86/tdx: Harden exports
Date: Fri, 11 Sep 2026 14:31:51 +0300
Message-ID: <20260911113150.1022344-2-nik.borisov@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

tdx_* function aren't supposed to be used by the kernel at large, rather
they are mostly used by KVM and a very small number of them are exposed
via the tdx-guest/tdx-host drivers. Reflect this fact in their
EXPORT_SYMBOL* declarations.

Reported-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 arch/x86/coco/tdx/tdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..3055a76c0dfd 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -64,7 +64,7 @@ long tdx_kvm_hypercall(unsigned int nr, unsigned long p1, unsigned long p2,
 
 	return __tdx_hypercall(&args);
 }
-EXPORT_SYMBOL_GPL(tdx_kvm_hypercall);
+EXPORT_SYMBOL_FOR_KVM(tdx_kvm_hypercall);
 #endif
 
 /*
@@ -139,7 +139,7 @@ int tdx_mcall_get_report0(u8 *reportdata, u8 *tdreport)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tdx_mcall_get_report0);
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_get_report0, "tdx-guest");
 
 /**
  * tdx_mcall_extend_rtmr() - Wrapper to extend RTMR registers using
@@ -175,7 +175,7 @@ int tdx_mcall_extend_rtmr(u8 index, u8 *data)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tdx_mcall_extend_rtmr);
+EXPORT_SYMBOL_FOR_MODULES(tdx_mcall_extend_rtmr, "tdx-guest");
 
 /**
  * tdx_hcall_get_quote() - Wrapper to request TD Quote using GetQuote
@@ -196,7 +196,7 @@ u64 tdx_hcall_get_quote(u8 *buf, size_t size)
 	/* Since buf is a shared memory, set the shared (decrypted) bits */
 	return _tdx_hypercall(TDVMCALL_GET_QUOTE, cc_mkdec(virt_to_phys(buf)), size, 0, 0);
 }
-EXPORT_SYMBOL_GPL(tdx_hcall_get_quote);
+EXPORT_SYMBOL_FOR_MODULES(tdx_hcall_get_quote, "tdx-guest");
 
 static void __noreturn tdx_panic(const char *msg)
 {
-- 
2.55.0

