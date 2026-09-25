Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F02F8E88
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342307; cv=none; b=OR1j0BUEtCVx5Msc6vxjVUR7Bwsx0IJ34lKssh26Ed1pu0jmjoxr+R9lZkYtZNcO5PzWtU7V22lHzIZQOl3WTzI2azOz6o8E/STJvkFjL+8U8Jj3p/4VgnlqYxeNxFA3T0hZlkVFel0csKZ8GNdRdRBB5JAuWjuS7UL2KLgnz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342307; c=relaxed/simple;
	bh=/tkLfLJjP7wUlNrWF/jq4DXqsVsVbD9Cznn3h6SFJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=STS4sL/nCF3FJ0o7XNzZ38AsH6bliorPecBjuQgR0OAVC8PWZxKJ6WovStgGQb9laCbRvZTBFNNdf5/uPjVu93EI8c5MbpKFq2fV8wo0Z/Sj8IxSRAzSYwwuuXVhjc/TziB23+rsZdgaMtxC9E8W8rssdEYUrOodbQ+4sOdRi8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=piPyOS1H; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=M19sCDyw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="piPyOS1H";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="M19sCDyw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E81421F38;
	Fri, 25 Sep 2026 13:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1790342296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WS/VifjS/Gld0vWHeJypN5sOQNnzQlGmGM6q8xYeuNk=;
	b=piPyOS1H3F4cP6D4APtNkmRolEZX3njgO/KIrTpldrK/chzwNtJ/mB8NVMT5fhzTK+aV/X
	ERdovp5BA1My841QY85ujU/1wyPJ+9qSdl4FmotfX0Yb9tiY2lwQfLt9ZTDbSIeqnY0vkU
	pkeuMjTqGDY/EI9gtS9Y9zUprgGKfek=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=M19sCDyw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1790342292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WS/VifjS/Gld0vWHeJypN5sOQNnzQlGmGM6q8xYeuNk=;
	b=M19sCDywRWn8eEua1IUQvTNB6KfNtMTjFVFM+t2AeQRYL2DeDNYN9KOhgmIO1N6npRL3sZ
	VqjEe0382Y3Q/nNaBs2Tx+cwvCs5OiE5nShhZqEb1x7U8XdIX5pS/TdClq9KBrYZNoSB6o
	ZlyPLdGtIADm2rfp28a1VXsAqD1FGSg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99E6713297;
	Fri, 25 Sep 2026 13:18:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6cwyGZN0tmqPIwAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Fri, 25 Sep 2026 13:18:11 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: kas@kernel.org,
	rick.p.edgecombe@intel.com
Cc: dave.hansen@linux.intel.com,
	xiaoyao.li@intel.com,
	linux-coco@lists.linux.dev,
	x86@kernel.org,
	Nikolay Borisov <nik.borisov@suse.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Subject: [PATCH v3] x86/tdx: Restrict attestation exports to the tdx-guest driver
Date: Fri, 25 Sep 2026 16:18:08 +0300
Message-ID: <20260925131808.2415177-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 2E81421F38
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO

There are few remaining attestation related functions which are exported
via EXPORT_SYMBOL_GPL, yet they are solely used by the 'tdx-guest'
driver. Let's just limit their visibility by using the namespaced
EXPORT_SYMBOL_FOR_MODULES.

Suggested-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 arch/x86/coco/tdx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..a38e44401840 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
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

