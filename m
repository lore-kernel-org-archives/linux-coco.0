Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854363;
	b=bVr6ieRCBJEEpaM4UyngteX1tAMgESFiwpufT1ksmopXXIjkvJj+wWEn94KG+Is2tWrJ
	 HSSIlJfvGq+hNwZMfvRUmSIMxHnpq7GpjZISAiyqD8IT2MzG9zNUKNKN+FoSMsY981xqk
	 ZY9L+QUWgi+hHhbX+tfdzPlvsXudiDo4jQmFr7G/cEA9Pcd6QLYkZxQaIU+bnd35zdYu5
	 dI221MijXAvRTAVpeIh7G9ysH5I+LyFt91iP61ayzO1dVbSLHf+d4HKZDOgcMiNP3pova
	 0+QMPqelPuG7zMoF77OEfq1XpeTq3j4UPvyA0VghCNmcmpVflaeNbBFX7xsM1IuFXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854363;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-Spamd-Result:
	 X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=x54E43v/cTdNyITQkYwz5GYnEgRowtIuU6sAmUoJ4dk=;
	b=o5sxZ6mC38a04WqKf6EV89ApPBSpU4aTs+xQFOID8BebY38x+mHcZGgkRBnV6Kz+QbNo
	 GcpuOsX6aMih1Smc/hSbh6UH21W0gx5ftvWP+Ze/bqqx2gED7/T2SJfBpGul7gyYx3MA1
	 3ppUgvo5rY1hCjDtPU+ZAXIBkd6JTCHY5qaqCNyaOkv/exPxHrctZsD+CknaDq2Qmdyun
	 Ye65z0Y0yujpMK2p6vhZxdgzzI1M9yP2o/awZOrtXFJInMz7hE1MOzHRQia3SuJ3/WXhR
	 4c4KCH0li6Oxqx73oxEHr7iRuYMDg8zuRdCojLH661DbEiOSCqn05vF0Kzi7+3XegeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ukUpubzj;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IBNPYBf3;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AC1606A323
	for <linux-coco@lists.linux.dev>; Mon, 16 Nov 2026 18:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AC1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ukUpubzj;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=IBNPYBf3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13F682230D;
	Mon, 16 Nov 2026 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x54E43v/cTdNyITQkYwz5GYnEgRowtIuU6sAmUoJ4dk=;
	b=ukUpubzjJXlY9/9cCuDfo6YBGQY2upvuGSAWYcwZTJBkDVQfidznIIRamHuMXewxHFIdWd
	kQdkNC6N+6Xs8lt/EZs8fAquH1ZzeA1ZyJfA3LId4IkZATdfstJwgRXxKTR0d4noQlp95D
	W8q747A8ItOGlt3Ao/TX8c08A4aGGis=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794854360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x54E43v/cTdNyITQkYwz5GYnEgRowtIuU6sAmUoJ4dk=;
	b=IBNPYBf3x4/yrPbLwLF3X1bdn9o7/OPVUnfD1P5nD+8CttFsqtRXHu+IklHbKIt4Y9bwrx
	1e+PyLuLHozCYgH0ggZAPRtphEcvhEHUUbkBBGXVXFdvQ3tvodmqDt4b94nqUcG7UkGauk
	fVcdqjWXLhYacw3nhGnNHTuPLaQFQoI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 912C31334C;
	Mon, 16 Nov 2026 18:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gGEXGtdN+2ovdwAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 16 Nov 2026 18:39:19 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [PATCH v6 02/17] coco/tdx: Rename MSR access helpers
Date: Mon, 16 Nov 2026 19:38:50 +0100
Message-ID: <20261116183905.1591611-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116183905.1591611-1-jgross@suse.com>
References: <20261116183905.1591611-1-jgross@suse.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,zytor.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

In order to avoid a name clash with some general MSR access helpers
after a future MSR infrastructure rework, rename the TDX specific
helpers.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
 arch/x86/coco/tdx/tdx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 8bacbef62891..e3eef2fd2ecd 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -451,7 +451,7 @@ static void __cpuidle tdx_safe_halt(void)
 	raw_local_irq_enable();
 }
 
-static int read_msr(struct pt_regs *regs, struct ve_info *ve)
+static int tdx_read_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
 		.r10 = TDX_HYPERCALL_STANDARD,
@@ -472,7 +472,7 @@ static int read_msr(struct pt_regs *regs, struct ve_info *ve)
 	return ve_instr_len(ve);
 }
 
-static int write_msr(struct pt_regs *regs, struct ve_info *ve)
+static int tdx_write_msr(struct pt_regs *regs, struct ve_info *ve)
 {
 	struct tdx_module_args args = {
 		.r10 = TDX_HYPERCALL_STANDARD,
@@ -823,9 +823,9 @@ static int virt_exception_kernel(struct pt_regs *regs, struct ve_info *ve)
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
2.56.0

