Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A39A6DCE1
	for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306102; cv=none; b=W6nphMx9tbfIYhxmYVMt5RCRLCT21XwBm36jp/SeBjBVgu9FcPCGjSb9Syxg5dIRYZsJPm2VnYlQnfVLF2pZSjKfFQOnaQPX3lkjrjPKEO1D3fIuvFXzrpL4IheYeNtjV9CMXNAs1vmRtWUqcmdR9u7AVVsEnQamQKUHy+8PuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306102; c=relaxed/simple;
	bh=gQmzfH4wFSB2uF8jIaDkyYrCqmG9Xfrcludt8+nB9tU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnhIN9wRAGXWSbHYzy3pdeQRjqJtxsD/wJF2zkvjBepDEOdrw1Sfzmh5Qc/kMFKJoOe7uNAV3QOeex+VGmA1040njJnourz1iYX4OyN/s2yEYkt1sUgwDjGfTwKkoH9G9KaHn1E4uURT+J+S3oMTt86s9oCB4gUhMZZXBAoiQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdUb8Yz+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdUb8Yz+"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68cfc182so927519e87.0
        for <linux-coco@lists.linux.dev>; Wed, 24 Jun 2026 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782306099; x=1782910899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlukBmGw8Sm2tX1xXG0U5Mu1/h6hpq5SqrIdrPAMuCE=;
        b=fdUb8Yz+QDKfNpOA7P7VwDAyxOuV7eWa34airu/hpU61cb7BJdEiwpOpKK/hBy2UX8
         yutaYjGqOncZayb7JLccdwA9ylcr+2NOdh47/eag1wCsYhKuKLRbZaUC74r/PK7qMG2b
         Uzl/5umdonC4D83pv2p7qNUuyn5o4MnfJIgWEL0RjMmgLii1PGAuZ3uTycIB949833uh
         rCNY4rS5McXtLwxQ2WeNh6vOEgH1XHIwDZJEhU3WP4FFBdoTws8i2oPGhdcsZ996BWgx
         W0S3r57et1fbmu26appSON3Av6x1n8Lm5CrJFzvk61VB2LJlrZdi/twbkBpP1IqC2hFl
         coxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306099; x=1782910899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlukBmGw8Sm2tX1xXG0U5Mu1/h6hpq5SqrIdrPAMuCE=;
        b=CZAaigEnxhNFUpsWK2RkB8jI2+wQMCYx+16h59Qnm8DZOPTfzHmR49erWIf3xE7hLv
         9KuV0lcPaj3cCAOXBw+bDpeyHM1RgDbDFxfc0ijbx5t1NHrsQCbC2AOjIxHxc9+Ru+Wi
         gBoTbDk5/7rLLYFVXxkYSHiqL6dOV+FEMoEZw1sCOIQkM8byp9mdt76KY1twreH4GLYA
         iebavt2xJP0sKE/eot1623HN/qeENtP6Y92n5DUoPdkSAGd9/UD8pTJg6KWQvhbOp5e4
         zxeby/cQTNZzDQ0GAZxpNb2L11U4oWUgEeUqlsV+isbq1jjScY8knOKhAByIsYL2X4Cy
         0o+w==
X-Gm-Message-State: AOJu0Yxud5VCBJ+NXorA4UI1l6iJ857/eLMvonhLKfoh0i8yiuxT5iiV
	SAzBR4XsRcjqujsCvjIH8V2hE36DL3UvTwEzoUlXy5k+sDqIkido5nFGe4J8Fy10WJoEvg==
X-Gm-Gg: AfdE7ck2iIN8kPgfEA5guJVzW/is0zIln642ZQDsapVC40nV69ejt68xgcUEDwhPsGO
	Dl/WJg6xf/cBcMyyIs/wtjzXz1DOnfUTKDiSG/vcSaNharbz720aqlLdJcqoupBlFveNu0zyFJ0
	rW8NLcUu1QlueviyuQuOqgZl+ivEBIhRKf6FczjEyLXhKPoCnFO3bDBNDo/WFlt7ejY36JMUrFB
	y4PXE4nw3R2wkJunCkj24YyTpfM61IBWWHb9T7AobKDHxvuFhDk+4yo4H7IPCagMKgg8AeEB9zv
	O+CPIznmWMtI1x6V9Eyuc/+LwuMHe/yPahXjk+HmHn05eLw3Lge4CWxVSQb74tr9vaKY+/smOLL
	DubN2yCA2yZ+ldsxDvLf0QdNYqH2mAwhvQsv1HZiJwgY69M2f+2o9qcCgsmUHtxs+I1/Fgvuj7f
	chMyCNfyagDQSdoBQAC8/lssEV8nainLlJ7Fhl
X-Received: by 2002:a05:600c:a012:b0:492:2e1c:1d19 with SMTP id 5b1f17b1804b1-49260875bbamr47169585e9.31.1782306087033;
        Wed, 24 Jun 2026 06:01:27 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926064e948sm58804125e9.0.2026.06.24.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:01:26 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] virt: coco: harden TSM MR attribute allocation
Date: Wed, 24 Jun 2026 15:00:15 +0200
Message-ID: <20260624130015.12086-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tsm_mr_create_attribute_group() combines the bin_attribute pointer table
and generated MR name strings into one allocation. It open-coded both the
aggregate name length calculation and the final allocation size as plain
additions and multiplication.

The current in-tree caller uses a small static MR table, but this helper is
exported for confidential-computing guest drivers. Reject impossible MR
definitions instead of allowing arithmetic wraparound to under-allocate the
combined attributes buffer.

Use size_add() and array_size() for the name-length accumulation and the
final allocation size.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/virt/coco/guest/tsm-mr.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
index 657b9c573..789988111 100644
--- a/drivers/virt/coco/guest/tsm-mr.c
+++ b/drivers/virt/coco/guest/tsm-mr.c
@@ -140,7 +140,11 @@ static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
 const struct attribute_group *
 tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 {
+	const struct bin_attribute **attrs __free(kfree) = NULL;
+	struct tm_context *ctx __free(kfree) = NULL;
+	size_t attrs_size, name_len;
 	size_t nlen;
+	char *name, *end;
 
 	if (!tm || !tm->mrs)
 		return ERR_PTR(-EINVAL);
@@ -164,8 +168,12 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 			return ERR_PTR(-EINVAL);
 
 		/* MR sysfs attribute names have the form of MRNAME:HASH */
-		nlen += strlen(tm->mrs[i].mr_name) + 1 +
-			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
+		name_len = size_add(strlen(tm->mrs[i].mr_name),
+				    strlen(hash_algo_name[tm->mrs[i].mr_hash]));
+		name_len = size_add(name_len, 2);
+		nlen = size_add(nlen, name_len);
+		if (name_len == SIZE_MAX || nlen == SIZE_MAX)
+			return ERR_PTR(-EINVAL);
 	}
 
 	/*
@@ -173,11 +181,13 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 	 * so that we don't have to free MR names one-by-one in
 	 * tsm_mr_free_attribute_group()
 	 */
-	const struct bin_attribute **attrs __free(kfree) =
-		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
-	struct tm_context *ctx __free(kfree) =
-		kzalloc_flex(*ctx, mrs, tm->nr_mrs);
-	char *name, *end;
+	attrs_size = size_add(array_size(size_add(tm->nr_mrs, 1),
+					 sizeof(*attrs)), nlen);
+	if (attrs_size == SIZE_MAX)
+		return ERR_PTR(-EINVAL);
+
+	attrs = kzalloc(attrs_size, GFP_KERNEL);
+	ctx = kzalloc_flex(*ctx, mrs, tm->nr_mrs);
 
 	if (!ctx || !attrs)
 		return ERR_PTR(-ENOMEM);
-- 
2.54.0

