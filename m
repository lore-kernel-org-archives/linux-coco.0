Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493C1802B
	for <linux-coco@lists.linux.dev>; Wed, 24 Jan 2024 09:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706089145; cv=none; b=Qi+rhsFv4MoO3hoK/hvRL3xNe41fJFwlZ+A51avclljhCjiBW27j3B4+Vq3u9FYpyxY3d6GbOiPdxQlcFuEVWPlhBQP1sKDv1LtjQ2hNG7s60MoBltco2HLjmXRDq62CNqFJe2uvQK8jIywoZD6DlyLYPkn8GMRq+NV0M9wVEGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706089145; c=relaxed/simple;
	bh=HRIugs/IFretHEO+UmHHlcM0euBzIhx+QipfPUnVWDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LIQnNsI5oQeep3tNsjifRf5n888Y3WofIvHsKjSORnbvxzHDN3EEdW+fbLNuRSCqkCC8zGSs4LeyiLyl4QiLJOUZ1Xn419AWQ2MEUrPZmr7xYoLs9gujUdgdcC8cWOMIGUu6tYTySxO2IVKPYEvid73BWRJWAYOV2iyIXWKmStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=SEuPWdpV; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=SEuPWdpV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="SEuPWdpV";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="SEuPWdpV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B411321E9F;
	Wed, 24 Jan 2024 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706089141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KDHVojexE2waSINUyS/E9Yl+5feqhE9AgLomVA8pVIg=;
	b=SEuPWdpVD62LajuKiJO7+j2ua1aou1BIHOBCLJPvxwfMmBWWSVw3crIl/lEM+4OsE7PkWc
	zwvxlucOfytWlyFdoQqN3DcZKAG8cwGlpvstqA9gV7VDpDNnfpROrfAoHcm4tIDVtLG5vH
	Z8b7vqBDi1v9+RGiCvmFzm8NIvWF7eg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1706089141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=KDHVojexE2waSINUyS/E9Yl+5feqhE9AgLomVA8pVIg=;
	b=SEuPWdpVD62LajuKiJO7+j2ua1aou1BIHOBCLJPvxwfMmBWWSVw3crIl/lEM+4OsE7PkWc
	zwvxlucOfytWlyFdoQqN3DcZKAG8cwGlpvstqA9gV7VDpDNnfpROrfAoHcm4tIDVtLG5vH
	Z8b7vqBDi1v9+RGiCvmFzm8NIvWF7eg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FE8013786;
	Wed, 24 Jan 2024 09:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PSR+DLXasGUDegAAD6G6ig
	(envelope-from <nik.borisov@suse.com>); Wed, 24 Jan 2024 09:39:01 +0000
From: Nikolay Borisov <nik.borisov@suse.com>
To: linux-coco@lists.linux.dev
Cc: x86@kernel.org,
	dave.hansen@linux.intel.com,
	dan.j.williams@intel.com,
	dionnaglaze@google.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface for quote generation
Date: Wed, 24 Jan 2024 11:38:58 +0200
Message-Id: <20240124093858.1818497-1-nik.borisov@suse.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.994];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

IOCTL based interface was the natural choice for interacting with the
quote generation machine at a time when there wasn't anything better.
Fortunately, now we have a vendor-agnostic, configfs-based one which
obviates the need to have the IOCTL-based interface.

Gate the relevant code behind a Kconfig option, clearly marking it as
deprecated as well as introduce a runtime warning.

Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
---
 drivers/virt/coco/tdx-guest/Kconfig     |  9 +++++++++
 drivers/virt/coco/tdx-guest/tdx-guest.c | 13 +++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
index 22dd59e19431..0f1cfdfbbd28 100644
--- a/drivers/virt/coco/tdx-guest/Kconfig
+++ b/drivers/virt/coco/tdx-guest/Kconfig
@@ -9,3 +9,12 @@ config TDX_GUEST_DRIVER
 
 	  To compile this driver as module, choose M here. The module will
 	  be called tdx-guest.
+
+config TDX_GUEST_DRIVER_LEGACY_IOCTL
+	def_bool y
+	prompt "Enable legacy ioctl interface (DEPRECATED)"
+	depends on TDX_GUEST_DRIVER
+	help
+	  Enable the legacy IOCTL-based interface to get the TDX report. It's
+	  deprecated in favor of the configfs based one and will be removed
+	  in a future release.
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 1253bf76b570..b8cea9486daf 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -66,6 +66,7 @@ static DEFINE_MUTEX(quote_lock);
  */
 static u32 getquote_timeout = 30;
 
+#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
 static long tdx_get_report0(struct tdx_report_req __user *req)
 {
 	u8 *reportdata, *tdreport;
@@ -100,6 +101,7 @@ static long tdx_get_report0(struct tdx_report_req __user *req)
 
 	return ret;
 }
+#endif
 
 static void free_quote_buf(void *buf)
 {
@@ -249,6 +251,9 @@ static int tdx_report_new(struct tsm_report *report, void *data)
 	return ret;
 }
 
+
+
+#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
 static long tdx_guest_ioctl(struct file *file, unsigned int cmd,
 			    unsigned long arg)
 {
@@ -271,6 +276,7 @@ static struct miscdevice tdx_misc_dev = {
 	.minor = MISC_DYNAMIC_MINOR,
 	.fops = &tdx_guest_fops,
 };
+#endif
 
 static const struct x86_cpu_id tdx_guest_ids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
@@ -290,9 +296,12 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;
 
+#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
+	pr_info("Legacy IOCTL-based interface is deprecated and will be removed in a future release\n");
 	ret = misc_register(&tdx_misc_dev);
 	if (ret)
 		return ret;
+#endif
 
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
@@ -310,7 +319,9 @@ static int __init tdx_guest_init(void)
 free_quote:
 	free_quote_buf(quote_data);
 free_misc:
+#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
 	misc_deregister(&tdx_misc_dev);
+#endif
 
 	return ret;
 }
@@ -320,7 +331,9 @@ static void __exit tdx_guest_exit(void)
 {
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
+#ifdef CONFIG_TDX_GUEST_DRIVER_LEGACY_IOCTL
 	misc_deregister(&tdx_misc_dev);
+#endif
 }
 module_exit(tdx_guest_exit);
 
-- 
2.34.1

