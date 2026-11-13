Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586152;
	b=q3jWrE5PqKdVNrR76M2dUaFUKhYFMWqTBCPhcmJrJOwb193SLIABO2kppq/KVzT3fyk/
	 j/4ZPSBlZ43xNYUHY6GZCyGFNjRrYm6k5dUUCWCRtEtufkiSk1TD1AuvROPLWX/2+eSiA
	 pfEsEPDsk60vk4jOqqkFj9Uyl2nVcPqJR3iCXLXAw/fCnounj78aOkU04Ddk5YOECE2Er
	 xudld956LTVJiScXRcOFQg1iIOR7s5EaV6DANebT0IRSvYAZHgq66WPx/2f/Obdgkxb6Z
	 QmqEbPRsCRdEEjgDYUkeKa3u0q3I9cDWNDs33BEAe1gJOUT0qhCYSl7us0XXvO0jcYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i9bo9BfxaEw7amAwj2fZcNBOwQOKFl/OM4ulegQbiyk=;
	b=USYpkP/eiVk0AkuaAuyQmcsWkZuIOStldhn6m0st5AepBdNVwyJmV7WAMoYleD3hGTFy
	 vi3mF6NZpBb1mL5SyYT73ejUHGL0EDXGtbYTGe3YMkShsLX9QiTNK0ptYhTFgU2G//nTp
	 DIpaQdCB8JU6Iy9VUMOmf895zmvo+7IqNShiD8BHY4RnTUQuRJmxjR3/Bjtb62fSoTt3y
	 SRZ4+7MCxt0lqyERv8f5M//mlYnm+khY8NO0R66I68RP3fZg0+UlCp4iVaKfmxceDv/eZ
	 wjqIl4y/LzV0hqMpKLS3nU+ysAaE4nvyuxx90BFdFdXivsbwJVO3QNGU1kcBJzz21Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=XS+OnS75;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860636079059
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 16:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 860636079059
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=XS+OnS75
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so613048f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 08:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586149; x=1795190949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9bo9BfxaEw7amAwj2fZcNBOwQOKFl/OM4ulegQbiyk=;
        b=XS+OnS755EBw3JUwPr5EuQNKje7PpxIPWb5pRQ1txcWfwm56SSjlbICg0TT9KX8x+L
         FX/zPs1GQJXpVz8nsf9781Nor/qRk32rUkOeJ41Ue7QP3CPAiNMEPP+Ml7/LKqQVaRYF
         N7UpFSmj8beNqtAwB8Gf8ZgIn8OtV45UH6tBkifEQA2JyXRM7sbVBrvnluz/X72eEf05
         zVHavWsA7eEMymUZSz61jRndFIv+QZKz+HGPTK4tK1kQrfwtgHkQtwIGbqP4dS0JKkz5
         qXPY64e94KhGil2OAp6FKU6YfRF0XdK0QOqOMyFzPyRUp96fcLYdtqmfaiide8FhFLGo
         MKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586149; x=1795190949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9bo9BfxaEw7amAwj2fZcNBOwQOKFl/OM4ulegQbiyk=;
        b=loCXdq07tsygrdx4/m19SQ8qqT7baoDvYyVb6Y0/YNpgZXrovFwAsERHuu4nuf18VT
         WulRLEZXx5NUUe4YcjEDXn2vuSlEUWT2ezmIXlKnTMziWlWyl9Gx0r4DsOAieJ4PAujI
         FJXbcCD0CH8qEbW9kPMpV5azf/z0NOwMXDDz49/0qdlbp6k9gt9y533qknHg0YzXlDzQ
         4vYQX4zhQ63VQZ+9E35IBms5MkJx1p78ZqTteF5FDWdtp+VPb11C9hbQF2gfZ/WIXBSP
         miuCuAjxZfFDHaKvIEVdhD3NEfx6wEpORzQLV3TWH6XoiQMxbAeBfixFm3vh/L1f1VQM
         N8lw==
X-Gm-Message-State: APuU4Z+BjwFYUR0XhiFn3LhwkVmhvEdr5S5AE8G0JanE3KJF4A6KINez
	pi6GhfMAIoA06ZyoG7OhDSvtMamFaMay2ZYoTsvr1sXrL6r8Fi2BpLoz9yDd8TjAUKS9x7gxWUj
	MFAuR
X-Gm-Gg: AYBFou0ZxlyTetWq0xKuwZ4hDidSfTu61lbCT69LeQsaqy35ASyJ5eWIBZspQSDvBtA
	qqGdl+S/jXY5B3hwRK6T6C2kjtJU4X7Z8SS3PmuLpXEHJWB0lEqkmQ5VNgmFWRLxJef0Xzk0ibS
	UV6uRhqv7WX8IgiJh1hls0hz2D8tY5CRubiTJJTTEvKluOAvkS/STskdXbu9HrTzYmGe34tdA6i
	qThSaMHUtvk2rgt5ujTkPc7qq7pczj1MKXe0rMAqf+eBoZuCkUdyii96d1/Xn81fMCrSp8GpBwS
	OM2clJcXoal3OgYyA4bDiOMwVB4OII5+NcyiOtZ9N4U76RYmcs3EzSxCSammbHaPY2hXwqMrc0E
	2aWp889Ko4kNbBPPBC41EXsaryLxHsOx/qPoFCrME3xMwUYT0q04oOmTpXF/DgiVYqv+SvJRijq
	4G/KsWrg1PkIhl5NNvZqpE3tzwuWJAfpFlu0/Xd7jSAnK7lCoNjN7qgA7ak0dx5uB8e8TbjfEyM
	IGWyI11X3NnClcEOyccC+ZRG8Pl7Uc7YTvAv4YhSc8ggfORYRk6gJQ240brYB7cctKhJ6Fji/6x
	rmwqJb57j4zirsf6eOPUJO1Jsytjm0Son4GB0hU=
X-Received: by 2002:a05:6000:992:b0:491:fd47:5df3 with SMTP id ffacd0b85a97d-49c6fc9e6bcmr6236979f8f.7.1794586148759;
        Fri, 13 Nov 2026 08:09:08 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm6898877f8f.1.2026.11.13.08.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:09:08 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 7/9] tdx-guest: Expose the native attestation service API
Date: Fri, 13 Nov 2026 17:08:36 +0100
Message-ID: <20261113160838.2512652-8-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113160838.2512652-1-jiri@resnulli.us>
References: <20261113160838.2512652-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Factor the Quote and measurement-register operations of the misc, TSM
report and TSM MR interfaces into helpers declared in a driver-internal
header, for an attestation provider built into the driver to share.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- kept the helpers inside tdx-guest, in place of a client API and its
  header
- dropped the MAINTAINERS lines, which N: tdx already covers
- sized the TSM report outblob to its Quote
- dropped an unreachable return in tdx_do_report()
- dropped the stale kernel client section from tdx-guest.rst
- numbered every enum member
---
 drivers/virt/coco/tdx-guest/internal.h  |  30 ++++++
 drivers/virt/coco/tdx-guest/tdx-guest.c | 130 +++++++++++++++++++-----
 2 files changed, 132 insertions(+), 28 deletions(-)
 create mode 100644 drivers/virt/coco/tdx-guest/internal.h

diff --git a/drivers/virt/coco/tdx-guest/internal.h b/drivers/virt/coco/tdx-guest/internal.h
new file mode 100644
index 000000000000..d57a8c385aff
--- /dev/null
+++ b/drivers/virt/coco/tdx-guest/internal.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _TDX_GUEST_INTERNAL_H
+#define _TDX_GUEST_INTERNAL_H
+
+#include <crypto/sha2.h>
+#include <linux/types.h>
+
+#define TDX_GUEST_QUOTE_MAX_LEN ((128 * 1024) - 24)
+
+struct tdx_guest_info {
+	u8 mrconfigid[SHA384_DIGEST_SIZE];
+	u8 mrowner[SHA384_DIGEST_SIZE];
+	u8 mrownerconfig[SHA384_DIGEST_SIZE];
+};
+
+enum tdx_guest_mr {
+	TDX_GUEST_MR_MRTD = 0,
+	TDX_GUEST_MR_RTMR0 = 1,
+	TDX_GUEST_MR_RTMR1 = 2,
+	TDX_GUEST_MR_RTMR2 = 3,
+	TDX_GUEST_MR_RTMR3 = 4,
+};
+
+/* @reportdata is TDX_REPORTDATA_LEN bytes, and @out holds TDX_GUEST_QUOTE_MAX_LEN. */
+int tdx_guest_quote_get(const u8 *reportdata, void *out, size_t *out_length);
+int tdx_guest_mr_read(enum tdx_guest_mr mr, u8 value[SHA384_DIGEST_SIZE]);
+int tdx_guest_rtmr_extend(unsigned int rtmr,
+			  const u8 value[SHA384_DIGEST_SIZE]);
+
+#endif /* _TDX_GUEST_INTERNAL_H */
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 11d741da3b35..c49454ec0b18 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -25,8 +25,11 @@
 #include <asm/cpu_device_id.h>
 #include <asm/tdx.h>
 
+#include "internal.h"
+
 /* TDREPORT buffer */
 static u8 *tdx_report_buf;
+static struct tdx_guest_info tdx_guest_info;
 
 /* Lock to serialize TDG.MR.REPORT and TDG.MR.RTMR.EXTEND TDCALLs */
 static DEFINE_MUTEX(mr_lock);
@@ -49,27 +52,32 @@ enum {
 	TDREPORT_servtd_hash = TDREPORT_rtmr3 + SHA384_DIGEST_SIZE,
 };
 
-static int tdx_do_report(sockptr_t data, sockptr_t tdreport)
+static int __tdx_do_report(sockptr_t data, sockptr_t tdreport)
 {
-	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
-		u8 *reportdata = tdx_report_buf + TDREPORT_reportdata;
-		int ret;
+	u8 *reportdata = tdx_report_buf + TDREPORT_reportdata;
+	int ret;
 
-		if (!sockptr_is_null(data) &&
-		    copy_from_sockptr(reportdata, data, TDX_REPORTDATA_LEN))
-			return -EFAULT;
+	lockdep_assert_held(&mr_lock);
+	if (!sockptr_is_null(data) &&
+	    copy_from_sockptr(reportdata, data, TDX_REPORTDATA_LEN))
+		return -EFAULT;
 
-		ret = tdx_mcall_get_report0(reportdata, tdx_report_buf);
-		if (WARN_ONCE(ret, "tdx_mcall_get_report0() failed: %d", ret))
-			return ret;
+	ret = tdx_mcall_get_report0(reportdata, tdx_report_buf);
+	if (WARN_ONCE(ret, "tdx_mcall_get_report0() failed: %d", ret))
+		return ret;
 
-		if (!sockptr_is_null(tdreport) &&
-		    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
-			return -EFAULT;
-	}
+	if (!sockptr_is_null(tdreport) &&
+	    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
+		return -EFAULT;
 	return 0;
 }
 
+static int tdx_do_report(sockptr_t data, sockptr_t tdreport)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock)
+		return __tdx_do_report(data, tdreport);
+}
+
 static int tdx_do_extend(u8 mr_ind, const u8 *data)
 {
 	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
@@ -90,6 +98,34 @@ static int tdx_do_extend(u8 mr_ind, const u8 *data)
 	return 0;
 }
 
+int tdx_guest_mr_read(enum tdx_guest_mr mr, u8 value[SHA384_DIGEST_SIZE])
+{
+	static const size_t offsets[] = {
+		[TDX_GUEST_MR_MRTD] = TDREPORT_mrtd,
+		[TDX_GUEST_MR_RTMR0] = TDREPORT_rtmr0,
+		[TDX_GUEST_MR_RTMR1] = TDREPORT_rtmr1,
+		[TDX_GUEST_MR_RTMR2] = TDREPORT_rtmr2,
+		[TDX_GUEST_MR_RTMR3] = TDREPORT_rtmr3,
+	};
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		ret = __tdx_do_report(KERNEL_SOCKPTR(NULL),
+				      KERNEL_SOCKPTR(NULL));
+		if (ret)
+			return ret;
+		memcpy(value, tdx_report_buf + offsets[mr],
+		       SHA384_DIGEST_SIZE);
+	}
+	return 0;
+}
+
+int tdx_guest_rtmr_extend(unsigned int rtmr,
+			  const u8 value[SHA384_DIGEST_SIZE])
+{
+	return tdx_do_extend(rtmr, value);
+}
+
 #define TDX_MR_(r) .mr_value = (void *)TDREPORT_##r, TSM_MR_(r, SHA384)
 static struct tsm_measurement_register tdx_mrs[] = {
 	{ TDX_MR_(rtmr0) | TSM_MR_F_RTMR },
@@ -135,6 +171,12 @@ static const struct attribute_group *tdx_mr_init(void)
 	rc = tdx_mr_refresh(&tdx_measurements);
 	if (rc)
 		return ERR_PTR(rc);
+	memcpy(tdx_guest_info.mrconfigid,
+	       buf + TDREPORT_mrconfigid, SHA384_DIGEST_SIZE);
+	memcpy(tdx_guest_info.mrowner,
+	       buf + TDREPORT_mrowner, SHA384_DIGEST_SIZE);
+	memcpy(tdx_guest_info.mrownerconfig,
+	       buf + TDREPORT_mrownerconfig, SHA384_DIGEST_SIZE);
 
 	/*
 	 * @mr_value was initialized with the offset only, while the base
@@ -189,6 +231,9 @@ struct tdx_quote_buf {
 	u8 data[];
 };
 
+static_assert(TDX_GUEST_QUOTE_MAX_LEN ==
+	      TDX_DEFAULT_QUOTE_SIZE - sizeof(struct tdx_quote_buf));
+
 static struct tdx_quote_buf *quote_buf;
 
 /* Lock to streamline quote requests */
@@ -285,15 +330,18 @@ static int wait_for_quote_completion(struct tdx_quote_buf *buf, u32 timeout)
 	return (i == timeout) ? -ETIMEDOUT : 0;
 }
 
-static int tdx_report_new_locked(struct tsm_report *report)
+/* Leaves the Quote in quote_buf; copy it out before dropping quote_lock. */
+static int __tdx_guest_quote_get(const u8 *reportdata, size_t length,
+				 size_t *out_length)
 {
-	u8 *buf;
-	struct tsm_report_desc *desc = &report->desc;
 	size_t quote_buf_size = get_quote_buf_size();
 	u32 out_len;
 	int ret;
 	u64 err;
 
+	lockdep_assert_held(&quote_lock);
+	if (!reportdata || length != TDX_REPORTDATA_LEN)
+		return -EINVAL;
 	/*
 	 * If the previous request is timedout or interrupted, and the
 	 * Quote buf status is still in GET_QUOTE_IN_FLIGHT (owned by
@@ -302,16 +350,13 @@ static int tdx_report_new_locked(struct tsm_report *report)
 	if (quote_buf->status == GET_QUOTE_IN_FLIGHT)
 		return -EBUSY;
 
-	if (desc->inblob_len != TDX_REPORTDATA_LEN)
-		return -EINVAL;
-
 	memset(quote_buf, 0, quote_buf_size);
 
 	/* Update Quote buffer header */
 	quote_buf->version = GET_QUOTE_CMD_VER;
 	quote_buf->in_len = TDX_REPORT_LEN;
 
-	ret = tdx_do_report(KERNEL_SOCKPTR(desc->inblob),
+	ret = tdx_do_report(KERNEL_SOCKPTR((void *)reportdata),
 			    KERNEL_SOCKPTR(quote_buf->data));
 	if (ret)
 		return ret;
@@ -337,13 +382,7 @@ static int tdx_report_new_locked(struct tsm_report *report)
 
 	if (struct_size(quote_buf, data, out_len) > quote_buf_size)
 		return -EFBIG;
-
-	buf = kvmemdup(quote_buf->data, out_len, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	report->outblob = buf;
-	report->outblob_len = out_len;
+	*out_length = out_len;
 
 	/*
 	 * TODO: parse the PEM-formatted cert chain out of the quote buffer when
@@ -353,6 +392,41 @@ static int tdx_report_new_locked(struct tsm_report *report)
 	return ret;
 }
 
+int tdx_guest_quote_get(const u8 *reportdata, void *out, size_t *out_length)
+{
+	int ret;
+
+	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock) {
+		ret = __tdx_guest_quote_get(reportdata, TDX_REPORTDATA_LEN,
+					    out_length);
+		if (ret)
+			return ret;
+		/* The TDX module may allow a Quote longer than @out. */
+		if (*out_length > TDX_GUEST_QUOTE_MAX_LEN)
+			return -EFBIG;
+		memcpy(out, quote_buf->data, *out_length);
+	}
+	return 0;
+}
+
+static int tdx_report_new_locked(struct tsm_report *report)
+{
+	struct tsm_report_desc *desc = &report->desc;
+	size_t length;
+	void *buf;
+	int ret;
+
+	ret = __tdx_guest_quote_get(desc->inblob, desc->inblob_len, &length);
+	if (ret)
+		return ret;
+	buf = kvmemdup(quote_buf->data, length, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	report->outblob = buf;
+	report->outblob_len = length;
+	return 0;
+}
+
 static int tdx_report_new(struct tsm_report *report, void *unused)
 {
 	scoped_cond_guard(mutex_intr, return -EINTR, &quote_lock)
-- 
2.56.0

