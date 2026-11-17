Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942051;
	b=PLHftf6GgC94ntlbEUPscjzWSETHu7O/+hyUsX422TUsIRT1VN9+bDWGSTPsyN4dYniL
	 hsxKiY1ClawrZjOX7+oS4nEsM+l319pdVZ/zA4yj0VIuk1lTGRmSYBa2MF2JK+Cz0cHP5
	 xfQzcob30Kvy/4TAoHbXnrJdPoet9OA1QdztdZfXG83dPefqfluV3hsrDX3Wzv47Wc1ww
	 1tl+BcM+cyAKrpco1SjmMc5R3YAjd5MjeBZQR8an4UX/2TrSIEKAwwGZ5PQZ+VO0GgoH/
	 cXrGx/e8GU5n7tEBGbyWe45ADxMHwpMrj9mkLREtqimbLMldcG9rFWRSgO1AxqBXs6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942051;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=CaN1LpAY/rYpOSX3vn4qY28pucw6xrwJAN6nlpek30M=;
	b=sJjYpXyYWhCWOuYR8IQ4FyIzFAFFrLs2lo+u8bEX/6Wv5Y5R7k/IigD700f+VUhlAsOb
	 iWsaNlKJqEbh8RM9byIp7kODB8fhnL05shFDI6dgC/10DsAfvWVL1SltxkEcDlqxY7/rb
	 7bBtl/CUSa0Hv85fQzxbkqCXz2hSOf2I3RUdrmIPaHvVb1DPfkcTQkFzIhvTs53LmMV3p
	 1VNpGksn2d+g0cr2ecVw1zo1JFV33X8rHBXh9VHqbB9sEvnIQFxNoAyKEh/uv4CwScwpd
	 MFvdaihaOHH10vRl3aW3R2uFm4ugmj1ggy91+TtaW39B0qgC+9DWNNZ8pCUBk+kICgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwvpG6Ah;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="p/ju88Ic";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AF606A32C
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 19:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657AF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WwvpG6Ah;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=p/ju88Ic
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 594E81F7DB;
	Tue, 17 Nov 2026 19:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794942048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CaN1LpAY/rYpOSX3vn4qY28pucw6xrwJAN6nlpek30M=;
	b=WwvpG6AhzMBZ6Wzp52161HjqJHItZONFNKoMtgxag0KnG35kcK92zO5lI8EbL78gOtr+Y3
	v0zkVNx3nmkE/LdBC2aFKNzrJMQnfkSQb5vCgdZPuMhRZoJ/JxspwQusFFHI6eVO7AYFJ0
	CFXTLX+PPhN7uHzyk8K4Q5qSVCSvpVY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794942047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CaN1LpAY/rYpOSX3vn4qY28pucw6xrwJAN6nlpek30M=;
	b=p/ju88IcbkFuLfp2JQFJryDtjzoYCwssKV3qqApLP5YhivmIcfJcYSHigQCpBlfd0eJHxl
	hUhMN7Cm4+/UUErF+Cv0DC65C8tFjZlxHjorK+u34W+tmjBGamSlTC0qcZiWufwkfwco2q
	J/kuR5csTp4f3BvbQGAMPGmBFpTTAYI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E43091334C;
	Tue, 17 Nov 2026 19:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h4RiL16k/GqcWQAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Tue, 17 Nov 2026 19:00:46 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: x86@kernel.org
Cc: seanjc@google.com,
	kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/virt/tdx: Don't print error if CPU doesn't support TDX
Date: Tue, 17 Nov 2026 21:00:41 +0200
Message-ID: <20261117190041.158949-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80

There's still plenty of Intel CPUs which do not support TDX and when a
recent kernel is booted on those the user always sees the following
error:

	virt/tdx TDX not supported by hostplatform.

The same is also printed on all AMD CPUs. Fix by using pr_info.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---

Contrary to Pet Shop Boy's song - it's not a sin to not support TDX, yet :)

 arch/x86/virt/vmx/tdx/tdx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 96ced0494b68..b2962da24701 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -1276,7 +1276,7 @@ static __init int tdx_enable(void)
 	int ret;
 
 	if (!cpu_feature_enabled(X86_FEATURE_TDX_HOST_PLATFORM)) {
-		pr_err("TDX not supported by the host platform\n");
+		pr_info("TDX not supported by the host platform\n");
 		return -ENODEV;
 	}
 
--
2.56.0

