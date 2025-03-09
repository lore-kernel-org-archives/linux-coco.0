Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD518DB35
	for <linux-coco@lists.linux.dev>; Sun,  9 Mar 2025 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741529088; cv=none; b=WH3x143+fuPAY4zCShQd0pCH28MNcFd1gepiApABouLYi3/aG4byw8bO6n7lmSOkIYPTWPLZy/ssH7X2QoOV1pRnqCDSFx1szQKJORGC4xrJEISQllGzaOf2+L2HvBViJskKJuxoMsdsMfNO2Avu6K+jq7d7y1YGuAaYOWHOunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741529088; c=relaxed/simple;
	bh=yKCpP47f06+l3SlC74QelXMW2T14IfSTfjae4ECmjzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uq9Yb/rtrl9ZMzVG4ecwChO+tz4VxhztuIN18UITcDrqasSlP3IsLg1PNQhTgz69YxYXXmTwimNB9SW2PzBKfLXlMvoG04dyvUYm47OPXprLN8I7o2u4J99pQ9jWHoWpJ72eYR7VqHRXiMSktto7pMtnQPIkAIXr2zOkb6vWwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aWJ+4guX; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aWJ+4guX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741529083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=94Hde2NRF8sNPVSPK1GG82Ut1mGB9l8lO3FvXACm6bo=;
	b=aWJ+4guXAUY7hJUzXAdxSzM0Z2tzxMP1SNjuZPMv1FBrA2jedW5TxVU9EmOH8DQ6Qp9Mcv
	hW00ePN9ANZ9LplNvlQ4fOZGnpRkQo8NFgBCSy3lvGIj7k9kX1Y6uq0QbWfgI48w39iD8B
	uZll6HjQJnsqB6Z6Ya1o7l3GXCm8SV8=
From: liu.yun@linux.dev
To: kirill.shutemov@linux.intel.com
Cc: liu.yun@linux.dev,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	Jackie Liu <liuyun01@kylinos.cn>
Subject: [PATCH] virt/tdx: Enhance tdx-guest driver with improved memory management
Date: Sun,  9 Mar 2025 22:04:26 +0800
Message-ID: <20250309140426.281868-1-liu.yun@linux.dev>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Jackie Liu <liuyun01@kylinos.cn>

This patch refines the tdx-guest driver by introducing better memory
management and error handling practices. The use of the `__free` attribute
ensures that allocated memory for `reportdata` and `tdreport` is
automatically freed, reducing the risk of memory leaks. Additionally,
the manual mutex lock/unlock has been replaced with `scoped_cond_guard`
to ensure proper mutex handling and simplify the code.

Error handling has been streamlined by returning directly on failure,
eliminating unnecessary `goto` statements. These changes not only
enhance the robustness of the driver but also improve its readability
and maintainability.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/virt/coco/tdx-guest/tdx-guest.c | 179 ++++++++++--------------
 1 file changed, 77 insertions(+), 102 deletions(-)

diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 224e7dde9cde..2b2aeae8d068 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/tsm.h>
 #include <linux/sizes.h>
+#include <linux/cleanup.h>
 
 #include <uapi/linux/tdx-guest.h>
 
@@ -68,37 +69,28 @@ static u32 getquote_timeout = 30;
 
 static long tdx_get_report0(struct tdx_report_req __user *req)
 {
-	u8 *reportdata, *tdreport;
 	long ret;
 
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
+	u8 *reportdata __free(kfree) = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
 	if (!reportdata)
 		return -ENOMEM;
 
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	u8 *tdreport __free(kfree) = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
+	if (!tdreport)
+		return -ENOMEM;
 
-	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
-		ret = -EFAULT;
-		goto out;
-	}
+	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN))
+		return -EFAULT;
 
 	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
 	ret = tdx_mcall_get_report0(reportdata, tdreport);
 	if (ret)
-		goto out;
+		return ret;
 
 	if (copy_to_user(req->tdreport, tdreport, TDX_REPORT_LEN))
-		ret = -EFAULT;
-
-out:
-	kfree(reportdata);
-	kfree(tdreport);
+		return -EFAULT;
 
-	return ret;
+	return 0;
 }
 
 static void free_quote_buf(void *buf)
@@ -159,92 +151,75 @@ static int wait_for_quote_completion(struct tdx_quote_buf *quote_buf, u32 timeou
 
 static int tdx_report_new(struct tsm_report *report, void *data)
 {
-	u8 *buf, *reportdata = NULL, *tdreport = NULL;
-	struct tdx_quote_buf *quote_buf = quote_data;
-	struct tsm_desc *desc = &report->desc;
-	int ret;
-	u64 err;
-
-	/* TODO: switch to guard(mutex_intr) */
-	if (mutex_lock_interruptible(&quote_lock))
-		return -EINTR;
-
-	/*
-	 * If the previous request is timedout or interrupted, and the
-	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
-	 * VMM), don't permit any new request.
-	 */
-	if (quote_buf->status == GET_QUOTE_IN_FLIGHT) {
-		ret = -EBUSY;
-		goto done;
-	}
-
-	if (desc->inblob_len != TDX_REPORTDATA_LEN) {
-		ret = -EINVAL;
-		goto done;
-	}
-
-	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
-	if (!reportdata) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
-	if (!tdreport) {
-		ret = -ENOMEM;
-		goto done;
+	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock) {
+		int ret;
+		u8 *buf;
+		struct tdx_quote_buf *quote_buf = quote_data;
+		struct tsm_desc *desc = &report->desc;
+		u64 err;
+
+		/*
+		 * If the previous request is timedout or interrupted, and the
+		 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
+		 * VMM), don't permit any new request.
+		 */
+		if (quote_buf->status == GET_QUOTE_IN_FLIGHT)
+			return -EBUSY;
+
+		if (desc->inblob_len != TDX_REPORTDATA_LEN)
+			return -EINVAL;
+
+		u8 *reportdata __free(kfree) = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
+		if (!reportdata)
+			return -ENOMEM;
+
+		u8 *tdreport __free(kfree) = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
+		if (!tdreport)
+			return -ENOMEM;
+
+		memcpy(reportdata, desc->inblob, desc->inblob_len);
+
+		/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
+		ret = tdx_mcall_get_report0(reportdata, tdreport);
+		if (ret) {
+			pr_err("GetReport call failed\n");
+			return ret;
+		}
+
+		memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
+
+		/* Update Quote buffer header */
+		quote_buf->version = GET_QUOTE_CMD_VER;
+		quote_buf->in_len = TDX_REPORT_LEN;
+
+		memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
+
+		err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
+		if (err) {
+			pr_err("GetQuote hypercall failed, status:%llx\n", err);
+			return -EIO;
+		}
+
+		ret = wait_for_quote_completion(quote_buf, getquote_timeout);
+		if (ret) {
+			pr_err("GetQuote request timedout\n");
+			return ret;
+		}
+
+		buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+
+		report->outblob = buf;
+		report->outblob_len = quote_buf->out_len;
+
+		/*
+		 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
+		 * provided
+		 */
 	}
 
-	memcpy(reportdata, desc->inblob, desc->inblob_len);
-
-	/* Generate TDREPORT0 using "TDG.MR.REPORT" TDCALL */
-	ret = tdx_mcall_get_report0(reportdata, tdreport);
-	if (ret) {
-		pr_err("GetReport call failed\n");
-		goto done;
-	}
-
-	memset(quote_data, 0, GET_QUOTE_BUF_SIZE);
-
-	/* Update Quote buffer header */
-	quote_buf->version = GET_QUOTE_CMD_VER;
-	quote_buf->in_len = TDX_REPORT_LEN;
-
-	memcpy(quote_buf->data, tdreport, TDX_REPORT_LEN);
-
-	err = tdx_hcall_get_quote(quote_data, GET_QUOTE_BUF_SIZE);
-	if (err) {
-		pr_err("GetQuote hypercall failed, status:%llx\n", err);
-		ret = -EIO;
-		goto done;
-	}
-
-	ret = wait_for_quote_completion(quote_buf, getquote_timeout);
-	if (ret) {
-		pr_err("GetQuote request timedout\n");
-		goto done;
-	}
-
-	buf = kvmemdup(quote_buf->data, quote_buf->out_len, GFP_KERNEL);
-	if (!buf) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	report->outblob = buf;
-	report->outblob_len = quote_buf->out_len;
-
-	/*
-	 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
-	 * provided
-	 */
-done:
-	mutex_unlock(&quote_lock);
-	kfree(reportdata);
-	kfree(tdreport);
-
-	return ret;
+	return 0;
 }
 
 static bool tdx_report_attr_visible(int n)
-- 
2.43.0

