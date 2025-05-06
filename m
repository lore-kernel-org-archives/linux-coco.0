Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F7264615
	for <linux-coco@lists.linux.dev>; Tue,  6 May 2025 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523239; cv=none; b=gclo+tYaG94cxVz+LeHBpwGCwF2gEdk3m2Z7n4+SD5BuaP9mEKJl/rJqWWzVlWax7sxwI22IEW2Loaab8AFDYgBZtfH9YxAmi6MvQEnUIty9NF+Zm9XAbUkE6fE2LW7zNQlkE01CzeF07I1tOhKysPWuv+OkolmhcvmIqkrGA2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523239; c=relaxed/simple;
	bh=mqm6FQzDmMlRON9SSlfzxRXYcHRvPocYLlKIBxCFFxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riwa3H4klV2H5XOPR7ZTmJzTJkkCFhgLhj3Iu6LI4JbOjrl3xKO8stwMcqZ603Ie0cPuhnCAU01SxxyGyAQF79dOC1UvaqKN6cLvJHdjR1XDdgkZlebTSFJHQUSBrs/+RE8GkgIUDx6/yXsDwO+glRBmDsBgHYMB0U63+LLHAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QXNxzFU0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=DsmAEedS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QXNxzFU0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="DsmAEedS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF14F1F390;
	Tue,  6 May 2025 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScbdEJfIhZ9pRJXcXTcH6qsH3ah9e2Jo6zx2xD+lWow=;
	b=QXNxzFU0/3nQl1EZV/N7gJi6CPDE/OhXrPF/a6JbMPCVIWFA5meq/4qVBsof7zMhax3sKZ
	DYRn/MYqLet+gNk6gBrR7wT2lsUzxi+QPo+0l5GNCCqVXjuiYbCAUZzMQiPjE7Cv4+C+X8
	dmYwwyun6Vuyw+9NkIUCWj1zbqY3L68=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746523228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ScbdEJfIhZ9pRJXcXTcH6qsH3ah9e2Jo6zx2xD+lWow=;
	b=DsmAEedSjPtwi6501F++2U2O1Qd1QONqhJzYR+aV7ELS1VKKNXjJtgrg0KMY50VTXnlfvE
	jluUpiYixIcdXW2OTlfI7L2vTtBg1fntJUngKYPDhvena7F0NBSyjrKn1M18+i1txoZAm0
	4GPVPD5E69h/f5A9vZ0M2wIMC9iAUkQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9505A137CF;
	Tue,  6 May 2025 09:20:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ng8FI1zUGWgIbAAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 06 May 2025 09:20:28 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev
Cc: xin@zytor.com,
	Juergen Gross <jgross@suse.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 1/6] coco/tdx: Rename MSR access helpers
Date: Tue,  6 May 2025 11:20:10 +0200
Message-ID: <20250506092015.1849-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250506092015.1849-1-jgross@suse.com>
References: <20250506092015.1849-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

In order to avoid a name clash with some general MSR access helpers
after a future MSR infrastructure rework, rename the TDX specific
helpers.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/coco/tdx/tdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index edab6d6049be..49d79668f85f 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -428,7 +428,7 @@ static void __cpuidle tdx_safe_halt(void)
 	raw_local_irq_enable();
 }
 
-static int read_msr(struct pt_regs *regs, struct ve_info *ve)
+static int tdx_read_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
 		.r10 = TDX_HYPERCALL_STANDARD,
@@ -449,7 +449,7 @@ static int read_msr(struct pt_regs *regs, struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-static int write_msr(struct pt_regs *regs, struct ve_info *ve)
+static int tdx_write_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
 		.r10 = TDX_HYPERCALL_STANDARD,
@@ -802,9 +802,9 @@ static int virt_exception_kernel(struct pt_regs *regs, struct ve_info *ve)
 	case EXIT_REASON_HLT:
 		return handle_halt(ve);
 	case EXIT_REASON_MSR_READ:
-		return read_msr(regs, ve);
+		return tdx_read_msr(regs, ve);
 	case EXIT_REASON_MSR_WRITE:
-		return write_msr(regs, ve);
+		return tdx_write_msr(regs, ve);
 	case EXIT_REASON_CPUID:
 		return handle_cpuid(regs, ve);
 	case EXIT_REASON_EPT_VIOLATION:
-- 
2.43.0

