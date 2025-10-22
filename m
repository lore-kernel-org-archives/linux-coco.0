Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2097281509
	for <linux-coco@lists.linux.dev>; Wed, 22 Oct 2025 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125821; cv=none; b=cd/oWCvP9BfsFhUAVkLi/+mwX3EhBHiwhPzoUttQp3uu8R/MQsuJLXGwpvULIXt42eEN0m6aHQATs3Kov2CP82IroEdg/uj+qGgC1oHauLZhnxttDSrxeOjAQ77JwpyaIQbGXHTr8ytPOz+6To0M2QGxFL9MEZh/evAaQpsVvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125821; c=relaxed/simple;
	bh=2Ejizfg3RuJ5FU0yoQREIsIp3nhc1xjse31WZGL01rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TU2QYuobqT4UUea0WH+aMkZTEtMCxZ+0Xp2ZChNuhvpTO9vDOEOyjNwCqxUq9r00tviEHkN7TeefMIb/Hus28N8EHCff/VTAzLWkxQF7Vy3I2Pf6aXi3sbj94UXhr48ynz4THRRRhB2bBuT/AdjwKg/FUWJe1VA8a+TBOjc/6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Wia057Ag; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=S0U6Zs8Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Wia057Ag";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="S0U6Zs8Y"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE4651F78B;
	Wed, 22 Oct 2025 09:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761125813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GeppXr57vJzIn5rn6igu9j2xyRjFd9JRysZgpW+8Syc=;
	b=Wia057AgHfFefMh519BHjpRNiaoN3swd2DbmJICEme+xWYWMnvlWt0PjNfpBMd7i1qxj1E
	HO2FWk6A4FqZvBygyfkL71hryHRQe6JCXWEfnkajh9NLqeg0BDk4iiyHeKYsfoQNftEbnF
	BajUl9juI12MvZ/uYo+Xs2VSo6OmFrQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=S0U6Zs8Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761125809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GeppXr57vJzIn5rn6igu9j2xyRjFd9JRysZgpW+8Syc=;
	b=S0U6Zs8Y8u9NxZeE9GcUo8UK/w8YFH8LcgzXAO8O33cdaoBjaeBelBLp9sk63a2QufzfUg
	uTpIi+N8mLrBp3T1Uc4RasnDvVRbD5Mw0q1PxBVKtRSi5u5DsGzw+4H2+GHxAs8JgmxDaf
	33JP46KbLwgMmFAMlQJR7hMqdknpQwc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62EE81339F;
	Wed, 22 Oct 2025 09:36:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8YG+FbGl+GiCDgAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Wed, 22 Oct 2025 09:36:49 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: x86@kernel.org
Cc: dave.hansen@linux.intel.com,
	rick.p.edgecombe@intel.com,
	linux-coco@lists.linux.dev,
	kai.huang@intel.com,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/tdx: Make seamcall/tdcall CET-compliant
Date: Wed, 22 Oct 2025 12:36:44 +0300
Message-ID: <20251022093644.320207-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BE4651F78B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

_seamcall/_ret/_saved_ret can be the target of indirect calls via
sc_retry_prerr/__seamcall_dirty_cache so on machines with CET enabled
such call chains result in a  splat and a BUG():

Missing ENDBR: __seamcall+0x0/0x50
------------[ cut here ]------------
kernel BUG at arch/x86/kernel/cet.c:132!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 195 UID: 0 PID: 3525 Comm: (udev-worker) Tainted: G                   n 6.12.0-160000.3.gccf23ce-default #1 PREEMPT(voluntary) SLFO-1.2 (unreleased) c9419bf0caf542825c59d4f407ef13fb3c33bc31
Tainted: [n]=NO_SUPPORT
Hardware name: Intel Corporation D50DNP/D50DNP, BIOS SE5C741.86B.01.02.0002.2408050237 08/05/2024
RIP: 0010:exc_control_protection+0x2c4/0x2d0
Code: d8 b9 09 00 00 00 48 8b 93 80 00 00 00 be 80 00 00 00 48 c7 c7 e5 1c a2 bd e8 c8 4a 34 ff 80 a3 8a 00 00 00 fb e9 11 fe ff ff <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ff6bb6927112f988 EFLAGS: 00010002
RAX: 0000000000000022 RBX: ff6bb6927112f9b8 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ff474944fafa6bc0 RDI: ff474944fafa6bc0
RBP: 0000000000000000 R08: 0000000000000000 R09: ff6bb6927112f778
R10: 0000000000000003 R11: ff474985fbd87e28 R12: 0000000000000003
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f3b43ac3900(0000) GS:ff474944faf80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3b419ea000 CR3: 000000c0db9c6006 CR4: 0000000000f73ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __die_body.cold+0x14/0x20
 ? die+0x2e/0x50
 ? do_trap+0xca/0x110
 ? do_error_trap+0x65/0x80
 ? exc_control_protection+0x2c4/0x2d0
 ? exc_invalid_op+0x50/0x70
 ? exc_control_protection+0x2c4/0x2d0
 ? asm_exc_invalid_op+0x1a/0x20
 ? exc_control_protection+0x2c4/0x2d0
 ? exc_control_protection+0x280/0x2d0
 asm_exc_control_protection+0x26/0x30
RIP: 0010:__seamcall+0x0/0x50
Code: 44 00 00 bf 07 00 00 00 e8 7d df cb 00 84 c0 74 02 0f 09 c3 cc cc cc cc 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <55> 48 89 f8 48 8b 0e 48 8b 56 08 4c 8b 46 10 4c 8b 4e 18 4c 8b 56
RSP: 0018:ff6bb6927112fa68 EFLAGS: 00010283
RAX: ffffffffbc4c21a0 RBX: ff4749061045b200 RCX: 0000000000000005
RDX: ff6bb6927112fa78 RSI: ff6bb6927112fa78 RDI: 000000000000002d
RBP: 000000000000000a R08: 0000001f7d200000 R09: 0000000080000000
R10: 00b8b77a00000000 R11: 0000000000000400 R12: 8000020300000000
R13: 0000000000000010 R14: 0000000000000000 R15: 0000000000000005
 ? __pfx___seamcall+0x10/0x10
 do_seamcall+0x1a/0x40
 config_tdx_module.constprop.0+0x10a/0x197
 tdx_enable.cold+0x508/0x7e4
 tdx_bringup+0x1c1/0x1280 [kvm_intel f93f40ca63d984c168979eef9c8c2c660b2fd468]
 vt_init+0x1a/0x60 [kvm_intel f93f40ca63d984c168979eef9c8c2c660b2fd468]
 ? __pfx_vt_init+0x10/0x10 [kvm_intel f93f40ca63d984c168979eef9c8c2c660b2fd468]
 do_one_initcall+0x45/0x2f0
 do_init_module+0x90/0x250
 __do_sys_init_module+0x183/0x1c0
 do_syscall_64+0x7d/0x160
 ? __vm_munmap+0xc4/0x160
 ? syscall_exit_to_user_mode+0x32/0x1b0
 ? do_syscall_64+0x89/0x160
 ? sched_balance_trigger+0x66/0x360
 ? __count_memcg_events+0x53/0xf0
 ? handle_mm_fault+0xb9/0x2e0
 ? do_flush_tlb_all+0xe/0x20
 ? __flush_smp_call_function_queue+0x96/0x420
 ? __irq_exit_rcu+0x39/0xe0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f3b43d1a6be

Fix it by adding an ENBDR in TDX_MODULE_CALL macro to cover all
cases.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---

The kernel this was observed is a SLE, however it contains the current upstream
TDX patches. And looking at the usptream code the problem persists there as well.

 arch/x86/virt/vmx/tdx/tdxcall.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/virt/vmx/tdx/tdxcall.S b/arch/x86/virt/vmx/tdx/tdxcall.S
index 016a2a1ec1d6..a2137cd7a669 100644
--- a/arch/x86/virt/vmx/tdx/tdxcall.S
+++ b/arch/x86/virt/vmx/tdx/tdxcall.S
@@ -43,6 +43,7 @@
  * TDH.EXPORT.MEM.
  */
 .macro TDX_MODULE_CALL host:req ret=0 saved=0
+	ENDBR
 	FRAME_BEGIN

 	/* Move Leaf ID to RAX */
--
2.51.1

