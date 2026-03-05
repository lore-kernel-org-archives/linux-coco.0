Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4339E171
	for <linux-coco@lists.linux.dev>; Thu,  5 Mar 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714210; cv=none; b=SMLtXEjeH2suOADtIihewP/aLikru2MtHEONJRD+gK3vRcC9QEYRZZ+mUxzSmxzAnsUhEOCJHd6KQ23NoPkSUxK4qtVXr3CGk1TRFl409HbbxTh0fnKbpmycXmE8l8h6USM5vgj400vLpje54IHvibCFmzgcMx0/2AQO84DIZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714210; c=relaxed/simple;
	bh=hL1KRdcUkqD5m38qDR44cdwSUdn+MD14fevRfOfX13o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdI9w61OWuZ3R1bHvY+Sj6m5aHF8XV4DpG3otgFGCHaRqVrIPXCxcndB02UsPwclQyxgwhDjKLuFPWcdqdvKUn6kXZ+LrMCc4pFo6OKNYXH8u39bi08Jz3vOmNOMHL09yE2xP175B6CvtL0J83NFzVe4NIIkWb4RkCPlnNtzhTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=o4aKOjJy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="o4aKOjJy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-482f454be5bso82508005e9.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Mar 2026 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772714204; x=1773319004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=o4aKOjJybP2eRVcfy2qCW2kCsjr0v5YHHLmaj4lOhLf0B+tZ2iKZD+rPsySAVo/NHO
         qwud85T5TDuYCRaCQZ8OVc3QZ7GeGZo7O42nkJPfiD9ZpkYR2DdSRPdNmKlsq/8YvuGn
         udiV7nNuaFPbaZah7nw1RGsKYAYOYkpeuMzNZW0WhH9u+Qvfbtn4/H1/GM6zJVXTOS2M
         d5S6GAvzwRN8HvLnGEYXEb16g0s+5pfBft5uZ9jKWG8O8oHd2n4f3kJkMS58YN7oDhLy
         fZ+h/ps97DYK3ymmzesFhPG50PlN71yRLbmZx3zOHYomfbMCJlyn6cxaOUMCyv8qZ7+2
         YcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714204; x=1773319004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jZyzh76/vi/WA0Mw21DKfbc+O5VrV1Ds2EV/BZWk6NE=;
        b=LV/+kGjR0n9GA2piDUPIk/Zh2rbU/0z76LKpQQdi/vUaRT8LB7yqkaA+QKITEwOt6c
         fheyUhhdjP7IZoTlBRowJMs/i7GwRNNjD5KXkm+mJ48Ei+420/eInpKkmaT+YuNCBtcs
         pUfrzcGGzRzensyFeDX/p1ZU2+iJO2jPZpJok9Wh67xDZpqc1v8DZLrpGBjI6XFalsCb
         WBPQ/VVr1WNm9ayRkGPD0A8JGClKePKnqq4Hsmy1lbtc3RggipVBXscFNmN40j7ng5VU
         kAkGx8GWx4prbbXnn+RNQxTHFmLMrCe5tKK9arxusCwxA3bVXzQmaL7823VbqwKs29cO
         QTig==
X-Forwarded-Encrypted: i=1; AJvYcCXgEYlRRXfSbANZJ5veABcUt40A2J5sFBQn31fZT7vzQUq52FGOxIl4A+GN7xzUdq/rJIUN10CzageR@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx/Ni/GEIYpcJfXN53B1CLsnJLVbGYH7+SVR40dTNtJM0gZBrg
	C4R0wuChgqN4ZEeLigAi9MFJiw+HG2K+hi795B9F9XJBvvGqyNz4f/o/0B9MywC3kkU=
X-Gm-Gg: ATEYQzwhYN+UluIet0XxnNVlBAqwBjPtOR7RpEbWPcME/INd0c1IifbVrxlCIGzjkiS
	FmkZgGPESXP/HoDAoK6+PWIEWrYM39IrrNSixBVHO5kfE/I8PbxBhGMuFvbbc+vXu3H10fOe2NJ
	myatyDCf1xTbA90mLi5a4jpVq7wVKIKvgbEBfJIfEUny5FVmMhNv/z7D3CXeQPBVT1eyua9n6XZ
	cSSDHgi1mbVL3RlXkH1Hrz3LNHIJaa1yie4ni+XhPZrm/XkCNVtnTxl9nT6ePZy5zTwrxPGnRfR
	eTFb3/lcU4UrVFLqun0oqPR40nbSvP0yLIRR5mHCMSVg9YhHumGmpbLH3otdcQvXz8TMle0HcGH
	NBLTNSVOLARjxCFyZ2Bhm5DnPEjCGkKnl6oYdJ32uwbynCY2jyYS+jFmDt6CZT4/W3SgN1qq7Yn
	IQ9x6h0jbbnHf4Tg==
X-Received: by 2002:a05:600d:15:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4851ee7bfc7mr38207005e9.8.1772714204144;
        Thu, 05 Mar 2026 04:36:44 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55d15besm37523468f8f.30.2026.03.05.04.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:36:43 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	sean.anderson@linux.dev,
	ptesarik@suse.com,
	catalin.marinas@arm.com,
	aneesh.kumar@kernel.org,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	thomas.lendacky@amd.com,
	john.allen@amd.com,
	ashish.kalra@amd.com,
	suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: [PATCH net-next v3 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Date: Thu,  5 Mar 2026 13:36:40 +0100
Message-ID: <20260305123641.164164-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260305123641.164164-1-jiri@resnulli.us>
References: <20260305123641.164164-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Current CC designs don't place a vIOMMU in front of untrusted devices.
Instead, the DMA API forces all untrusted device DMA through swiotlb
bounce buffers (is_swiotlb_force_bounce()) which copies data into
decrypted memory on behalf of the device.

When a caller has already arranged for the memory to be decrypted
via set_memory_decrypted(), the DMA API needs to know so it can map
directly using the unencrypted physical address rather than bounce
buffering. Following the pattern of DMA_ATTR_MMIO, add
DMA_ATTR_CC_DECRYPTED for this purpose. Like the MMIO case, only the
caller knows what kind of memory it has and must inform the DMA API
for it to work correctly.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- rebased on top of recent dma-mapping-fixes
---
 include/linux/dma-mapping.h |  6 ++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 29973baa0581..ae3d85e494ec 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -85,6 +85,12 @@
  * a cacheline must have this attribute for this to be considered safe.
  */
 #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
+ * (shared) for confidential computing guests. The caller must have
+ * called set_memory_decrypted(). A struct page is required.
+ */
+#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
 
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index 33e99e792f1a..b8082d5177c4 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -32,7 +32,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
 		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
 		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
-		{ DMA_ATTR_MMIO, "MMIO" })
+		{ DMA_ATTR_MMIO, "MMIO" }, \
+		{ DMA_ATTR_CC_DECRYPTED, "CC_DECRYPTED" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index e89f175e9c2d..c047a9d0fda3 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -84,16 +84,24 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 	dma_addr_t dma_addr;
 
 	if (is_swiotlb_force_bounce(dev)) {
-		if (attrs & DMA_ATTR_MMIO)
-			return DMA_MAPPING_ERROR;
+		if (!(attrs & DMA_ATTR_CC_DECRYPTED)) {
+			if (attrs & DMA_ATTR_MMIO)
+				return DMA_MAPPING_ERROR;
 
-		return swiotlb_map(dev, phys, size, dir, attrs);
+			return swiotlb_map(dev, phys, size, dir, attrs);
+		}
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		return DMA_MAPPING_ERROR;
 	}
 
 	if (attrs & DMA_ATTR_MMIO) {
 		dma_addr = phys;
 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
 			goto err_overflow;
+	} else if (attrs & DMA_ATTR_CC_DECRYPTED) {
+		dma_addr = phys_to_dma_unencrypted(dev, phys);
+		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
+			goto err_overflow;
 	} else {
 		dma_addr = phys_to_dma(dev, phys);
 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
-- 
2.51.1

