Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C65199
	for <linux-coco@lists.linux.dev>; Sat, 28 Jan 2023 08:48:35 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=guorui.yu@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VaGyb8l_1674894788;
Received: from localhost(mailfrom:GuoRui.Yu@linux.alibaba.com fp:SMTPD_---0VaGyb8l_1674894788)
          by smtp.aliyun-inc.com;
          Sat, 28 Jan 2023 16:33:09 +0800
From: "GuoRui.Yu" <GuoRui.Yu@linux.alibaba.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	konrad.wilk@oracle.com,
	linux-coco@lists.linux.dev
Cc: GuoRui.Yu@linux.alibaba.com,
	robin.murphy@arm.com
Subject: [PATCH 3/4] swiotlb: Add tracepoint swiotlb_unbounced
Date: Sat, 28 Jan 2023 16:32:53 +0800
Message-Id: <20230128083254.86012-4-GuoRui.Yu@linux.alibaba.com>
X-Mailer: git-send-email 2.29.2.540.g3cf59784d4
In-Reply-To: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
References: <20230128083254.86012-1-GuoRui.Yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new tracepoint swiotlb_unbounced to facilitate statistics of
swiotlb buffer usage.

Signed-off-by: GuoRui.Yu <GuoRui.Yu@linux.alibaba.com>
---
 include/trace/events/swiotlb.h | 28 ++++++++++++++++++++++++++++
 kernel/dma/common-swiotlb.c    |  1 +
 2 files changed, 29 insertions(+)

diff --git a/include/trace/events/swiotlb.h b/include/trace/events/swiotlb.h
index da05c9ebd224..0707adc34df5 100644
--- a/include/trace/events/swiotlb.h
+++ b/include/trace/events/swiotlb.h
@@ -35,6 +35,34 @@ TRACE_EVENT(swiotlb_bounced,
 		__entry->force ? "FORCE" : "NORMAL")
 );
 
+TRACE_EVENT(swiotlb_unbounced,
+	TP_PROTO(struct device *dev, dma_addr_t dev_addr, size_t size),
+	TP_ARGS(dev, dev_addr, size),
+
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__field(u64, dma_mask)
+		__field(dma_addr_t, dev_addr)
+		__field(size_t, size)
+		__field(bool, force)
+	),
+
+	TP_fast_assign(
+		__assign_str(dev_name, dev_name(dev));
+		__entry->dma_mask = (dev->dma_mask ? *dev->dma_mask : 0);
+		__entry->dev_addr = dev_addr;
+		__entry->size = size;
+		__entry->force = is_swiotlb_force_bounce(dev);
+	),
+
+	TP_printk("dev_name: %s dma_mask=%llx dev_addr=%llx size=%zu %s",
+		__get_str(dev_name),
+		__entry->dma_mask,
+		(unsigned long long)__entry->dev_addr,
+		__entry->size,
+		__entry->force ? "FORCE" : "NORMAL")
+);
+
 #endif /*  _TRACE_SWIOTLB_H */
 
 /* This part must be outside protection */
diff --git a/kernel/dma/common-swiotlb.c b/kernel/dma/common-swiotlb.c
index 553325d5c9cd..e3676a8358f2 100644
--- a/kernel/dma/common-swiotlb.c
+++ b/kernel/dma/common-swiotlb.c
@@ -46,6 +46,7 @@ void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
 			      unsigned long attrs)
 {
+	trace_swiotlb_unbounced(dev, phys_to_dma(dev, tlb_addr), mapping_size);
 	/*
 	 * First, sync the memory before unmapping the entry
 	 */
-- 
2.31.1

