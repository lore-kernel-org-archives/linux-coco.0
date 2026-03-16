Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5997029BDB5
	for <linux-coco@lists.linux.dev>; Mon, 16 Mar 2026 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773665946; cv=none; b=OQFkhrkT9Lvw8xQK+mLF2JFK+j1ddENrqhww40JSL/zf5bv5w2q0P7eHy34mR09LyBnnWWUrN53OurLtpUIM3E4aSLC7KwuE5GKVjngm0WVyn/7+bJO4TO462LhBLscW2FbbsPNBlimOiuyGSHToA51VaBXLGEeOq0m5Qt/+XNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773665946; c=relaxed/simple;
	bh=dmuGILWcHUqJ0kSdd8/WBluFOd4yziQOvdp/K5MgbTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZhw8KWwIJTP38k0n2wdSjqUTGSxx7s/UuvxDoH5Hjo/Y6cACfm7+udgWQVKo/aiiy+uuTIUOyhBiWRShHQPM5Gpj35dwNcyYhB6JcBiFDREnXgOq3d3pCPFubqk3quwMnPI29myX8iuhD4b8lpwWPgdb5RaeKHYnI2noVva9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=kOB+a606; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="kOB+a606"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso39837125e9.1
        for <linux-coco@lists.linux.dev>; Mon, 16 Mar 2026 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773665941; x=1774270741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emL9z4Qbm9oQec+/P2Nv6r0/NLIOGJvL2ewVYE7x7Io=;
        b=kOB+a606SKnvrEBzSN3s3sTbEP7lqW2UdIlIsJgvGVpJjXBHRoNjUVPRZ5cKzqrjNK
         E6E9hQA1s8zSUj8neG3tx/nbzNCxn/b43mujMWGFzleaCj+ApUcfCAaeIWc4ZvvfDsWI
         3U5+SULfOb9cxoGT/lFAWPQkHoknu3d6YLrh73czISHqOjW+gyK7kZcPGU8FY6+sCJfC
         Q5KI6UzPNcDYv0JY66PM+M4uyPRM3elDSxG43S9Vko0OdEuGXYczS8z6T32f4Jhbs7PV
         ZqEKaF6uds5CPD2jAUf6K92FyFJm8nYSWXOB2fZ1hCcNFkDGgOIRwSeRhjHlv5ae49lG
         Utqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773665941; x=1774270741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emL9z4Qbm9oQec+/P2Nv6r0/NLIOGJvL2ewVYE7x7Io=;
        b=YrskGlD94PoPOuUWVmHDiwdLENw2x1As4ugLrtqUBOTRoYvvd9Ko8nV4wP9aLkljhN
         kfAy3YEKsOlXOiyVxE3oVzRqtnM0YaOkC5Rg54RwmSAeC7+4sqAfhZRja+mANdQf+xze
         dCF4E/S5TNVwRZYZL36dPYDQli9PTjRzDGBo6w8B0ZUJygnMMztTv43bVpjXwpgOsamu
         fj09vEWvVF3brlx84FK/DtyP32Z/GGNKJLVBKY3wny8qUlEp64MiMCbG4/RFojEclQf4
         IC9sPnEw0ePxiYu7wmMowrw49gwlXAWTYQDE89xWqWP1/QatDy5c0kdWrZYQvWzajcEE
         1wgw==
X-Forwarded-Encrypted: i=1; AJvYcCUZTms+1oSDZAw3+cvfwIRNIT1buvukONvC1EDP6aJKikArNiYmTqo4e9B/JA3XuwfdVz/tXXjXFfd7@lists.linux.dev
X-Gm-Message-State: AOJu0YznyD7aTIebfZ2oE72cd3gNBSuY5uxWFS8HwrktV874hMDzkC10
	dXzFSSwiHG0DNdif896XaPYfE/APywAEQPVKQmkfUhwMAC2PoHw02Qzp+jRsn4xwuxw=
X-Gm-Gg: ATEYQzw5bl6WvpIBkcEZVKfrrIUCx4A0HJKFzh5SBMmkv6a7ouc72ama2h1fk0+H+Di
	HNMWVWPPH4kIBhLG7E878zANxC1MH2dnNepryy7UBIJp+shtzrq91J4B4ZtHX6X+uMHah7GY8xe
	+WBNJadFuk/9WXJEM5wUSe4YfJSSXQoR83WAmx9KL8TgJaekF7YU+l346Oa41tMOx500viYrPOI
	F+oMI0jlS3n9VJNJzeXfwpMU5g/Ek5dqwCAmsWLO8zJBJfMuE1rKAEfPsJ9O3GmhwdYXtjksqC+
	DLFyy1vZTjM8FLS2jyJeMVX8g0En5yPVVaB+IRNxosQAyL+kXpjx/WCHnSn1OkkGpKPhIaf+84C
	sASBh3uaakQL9UF3ei64YFNxPpSCg7hoJId6gcuOFXM8XewU2ZskOWToWrqEm5uZ8mrFB0tZdGX
	jqKOp0atlpU9DCD7KEnCKWK3EN
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id 5b1f17b1804b1-48556720f86mr199505885e9.27.1773665940699;
        Mon, 16 Mar 2026 05:59:00 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b45e51681sm4423103f8f.25.2026.03.16.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:59:00 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dma-mapping: introduce DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Date: Mon, 16 Mar 2026 13:58:56 +0100
Message-ID: <20260316125857.617836-2-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260316125857.617836-1-jiri@resnulli.us>
References: <20260316125857.617836-1-jiri@resnulli.us>
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
v3->v4:
- added some sanity checks to dma_map_phys and dma_unmap_phys
- enhanced documentation of DMA_ATTR_CC_DECRYPTED attr
v1->v2:
- rebased on top of recent dma-mapping-fixes
---
 include/linux/dma-mapping.h | 10 ++++++++++
 include/trace/events/dma.h  |  3 ++-
 kernel/dma/direct.h         | 14 +++++++++++---
 kernel/dma/mapping.c        | 13 +++++++++++--
 4 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 29973baa0581..476964d2b22f 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -85,6 +85,16 @@
  * a cacheline must have this attribute for this to be considered safe.
  */
 #define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
+/*
+ * DMA_ATTR_CC_DECRYPTED: Indicates the DMA mapping is decrypted (shared) for
+ * confidential computing guests. For normal system memory the caller must have
+ * called set_memory_decrypted(), and pgprot_decrypted must be used when
+ * creating CPU PTEs for the mapping. The same decrypted semantic may be passed
+ * to the vIOMMU when it sets up the IOPTE. For MMIO use together with
+ * DMA_ATTR_MMIO to indicate decrypted MMIO. Unless DMA_ATTR_MMIO is provided
+ * a struct page is required.
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
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 3928a509c44c..abb0c88b188b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -157,6 +157,7 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
+	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
 	dma_addr_t addr = DMA_MAPPING_ERROR;
 
 	BUG_ON(!valid_dma_direction(dir));
@@ -165,8 +166,11 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
 		return DMA_MAPPING_ERROR;
 
 	if (dma_map_direct(dev, ops) ||
-	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
+	    (!is_mmio && !is_cc_decrypted &&
+	     arch_dma_map_phys_direct(dev, phys + size)))
 		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
+	else if (is_cc_decrypted)
+		return DMA_MAPPING_ERROR;
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else if (ops->map_phys)
@@ -203,11 +207,16 @@ void dma_unmap_phys(struct device *dev, dma_addr_t addr, size_t size,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	bool is_mmio = attrs & DMA_ATTR_MMIO;
+	bool is_cc_decrypted = attrs & DMA_ATTR_CC_DECRYPTED;
 
 	BUG_ON(!valid_dma_direction(dir));
+
 	if (dma_map_direct(dev, ops) ||
-	    (!is_mmio && arch_dma_unmap_phys_direct(dev, addr + size)))
+	    (!is_mmio && !is_cc_decrypted &&
+	     arch_dma_unmap_phys_direct(dev, addr + size)))
 		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
+	else if (is_cc_decrypted)
+		return;
 	else if (use_dma_iommu(dev))
 		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
 	else if (ops->unmap_phys)
-- 
2.51.1

