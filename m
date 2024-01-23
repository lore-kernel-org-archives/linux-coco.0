Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF357612FA
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026034; cv=none; b=nq0AeN08uWmbyqPADhaBvTdbEXYSell55ZSU354G9YwOQPzs5QE55f7A8Rvm/UeQVvR0n3eASv1Pu0DG3ES5ZDYcRww7AASJxdtbp7HZydkCS9VBm8SoSzYRhyy3vNHZ8N+aZ5Pdh3gLOQaYnJ3jHnCuppH4GwisgqUZWAhQCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026034; c=relaxed/simple;
	bh=oArA8gAgOf6DwtHqEkWkB4PfhwP6GD1CXVafL0V+osM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c6ejBCR0xpxSJjD3ezm3L10m/hitX+QlwLc+ZxbPYB4UjI2bmcnpUgjNdB56dzN6HV106CCEVREnI6xDGlboY1kzDG09dM9PoccwdlxsCeOyCorTxLIqmpCkEKP2Y+r7yF8EQ4FwImmElKZUtbvjd5c2YAE2Mm7XeLMdn+3ZK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ca/TdBl7; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=VadsGYOm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ca/TdBl7";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="VadsGYOm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DE26F22362;
	Tue, 23 Jan 2024 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706026031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i0l4zzRKpor7redu5Wc4ZskDiBwMjnit2xX74Qd5zRA=;
	b=Ca/TdBl7o7aNP6h2xY/T+QGYH+Z9W8V3xfIVi+LA5nAeUwVUVbU+nqylgKGtHHlp3RvwRg
	OOpZymPvEDW1MdShCUojjeT79qR7zM9xSxzZn/Cvfy96hVUqliBWLY+UnWdCTqbaMTL3AH
	6jNyNXvjWWHDr0Kk0w1OlZf/LBaYUlA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706026029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=i0l4zzRKpor7redu5Wc4ZskDiBwMjnit2xX74Qd5zRA=;
	b=VadsGYOmViRGkoboXLuuVhSHO0eIhNwjPMaeVo9MhyYonEcMeeKBf0/0Q7YDQvhgDfqZXt
	rzSH7KOZOt/xq9cJZNYvfFyNIJykKXnCXPJHM7Ow6+CfYZYZBzRekDAvIozxLU7P9YrnFy
	WbzJbEsAWaFPFREK2doVHxX6tnHP/Cc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4100D136A4;
	Tue, 23 Jan 2024 16:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D6qiCy3kr2WeBAAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Tue, 23 Jan 2024 16:07:09 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: linux-coco@lists.linux.dev
Cc: dave.hansen@linux.intel.com,
	x86@kernel.org,
	kirill.shutemov@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Date: Tue, 23 Jan 2024 18:07:04 +0200
Message-Id: <20240123160704.1270147-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=VadsGYOm
X-Spamd-Result: default: False [2.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.69
X-Rspamd-Queue-Id: DE26F22362
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++

When this driver got merged initially there was no widely agreed upon
interface how the quote generation interface will work so having an
ioctl made sense. However, there's now a vendor-neutral interface via
configfs. Just remove the old ioctl interface and leave only the the
configfs one.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---

I think it's better to remove the legacy interface now, before there's been a
wide adoption of it, cementing it as an ABI of sorts.

 drivers/virt/coco/tdx-guest/tdx-guest.c | 75 +------------------------
 1 file changed, 2 insertions(+), 73 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf76b570..1642a0f70333 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -66,41 +66,6 @@ static DEFINE_MUTEX(quote_lock);
  */
 static u32 getquote_timeout = 30;

-static long tdx_get_report0(struct tdx_report_req __user *req)
-{
-	u8 *reportdata, *tdreport;
-	long ret;
-
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
-	if (!reportdata)
-		return -ENOMEM;
-
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
-	ret = tdx_mcall_get_report0(reportdata, tdreport);
-	if (ret)
-		goto out;
-
-	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
-		ret = -EFAULT;
-
-out:
-	kfree(reportdata);
-	kfree(tdreport);
-
-	return ret;
-}
-
 static void free_quote_buf(void *buf)
 {
 	size_t len = PAGE_ALIGN(GET_QUOTE_BUF_SIZE);
@@ -249,29 +214,6 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	return ret;
 }

-static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
-			    unsigned long arg)
-{
-	switch (cmd) {
-	case TDX_CMD_GET_REPORT0:
-		return tdx_get_report0((struct tdx_report_req __user *)arg);
-	default:
-		return -ENOTTY;
-	}
-}
-
-static const struct file_operations tdx_guest_fops = {
-	.owner = THIS_MODULE,
-	.unlocked_ioctl = tdx_guest_ioctl,
-	.llseek = no_llseek,
-};
-
-static struct miscdevice tdx_misc_dev = {
-	.name = KBUILD_MODNAME,
-	.minor = MISC_DYNAMIC_MINOR,
-	.fops = &tdx_guest_fops,
-};
-
 static const struct x86_cpu_id tdx_guest_ids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
 	{}
@@ -290,27 +232,15 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;

-	ret = misc_register(&tdx_misc_dev);
-	if (ret)
-		return ret;
-
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
 		pr_err("Failed to allocate Quote buffer\n");
-		ret = -ENOMEM;
-		goto free_misc;
+		return -ENOMEM;
 	}

 	ret = tsm_register(&tdx_tsm_ops, NULL, NULL);
 	if (ret)
-		goto free_quote;
-
-	return 0;
-
-free_quote:
-	free_quote_buf(quote_data);
-free_misc:
-	misc_deregister(&tdx_misc_dev);
+		free_quote_buf(quote_data);

 	return ret;
 }
@@ -320,7 +250,6 @@ static void __exit tdx_guest_exit(void)
 {
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
-	misc_deregister(&tdx_misc_dev);
 }
 module_exit(tdx_guest_exit);

--
2.34.1

