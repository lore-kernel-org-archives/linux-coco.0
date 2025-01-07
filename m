Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177971A38E4
	for <linux-coco@lists.linux.dev>; Wed,  8 Jan 2025 02:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736303355; cv=none; b=s3uH09CvaPJ+YyPWUUYJ/WjIZhyIxnwOipiLo2DvYrOcs8xH7GaacEhmv9n/dIT7X15GtbUl9WqTEjwoRyhcxY3IKMxEhPjKC4IZ8tKpqlEjptmyMvEU99k2j60OZySSB9MByaDgXggvYImUuFVq7iYSaHEd+KM30UEE2HiiFUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736303355; c=relaxed/simple;
	bh=OdYvqy9SZiyGRa0z3UebND5Dabkm8gIYOojEDkxguSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sRscW3g8Jerwb90T27wQgKY6oxjjUvdWre64AvpKLVZz9FT6JTCrz7exdFsVBfYE17oGyoAPbiGKykyf1eIr3bSv5mi1PN3fa8FfU/MJQQ9mXpcATDpJmHU6ouL8CgMSHUYLF6d0EGa1XzQZL5pTOCnJXOwVXq1MtlocFak3D5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfHD6S47; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfHD6S47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736303354; x=1767839354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OdYvqy9SZiyGRa0z3UebND5Dabkm8gIYOojEDkxguSw=;
  b=YfHD6S47rWJKMPs4EZJXbgBfauaYM/VegE5EDaCHGSUM5RhmKboZNdYm
   FS0ZTwDz8PkmgoXO7XbNd9UO9rMLxt5Ze9wQBoYGBVc/6dXJVJoQzFFcK
   PhqQqdtUw4ZDzTkAZ8Nfq+ecaZ+GnYR5WkegNA/1WmCpXLATgTifoaldN
   y3WGcqlyf6OR75d1bSSCopHtil0FU+K9ScZzlYY95RCxaMJXmfWvRmq6b
   8HbzvxC3h8Nx2v24uab2/Q/2nrqd66UKwUp7iXUsaO0XLApkGTBQChfcF
   aDfMl2GBsVlZmnfFuFIsp/aJcBN0RRZGaTYpaYO6h1o7sA7udl+79HrpW
   A==;
X-CSE-ConnectionGUID: mu9lWpfOT86MrF1jdWvJNw==
X-CSE-MsgGUID: ki+Q66iFR6y8ViF4/Cltcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47010589"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47010589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:29:14 -0800
X-CSE-ConnectionGUID: f/1pbW8GShW+Cp7ykLs29Q==
X-CSE-MsgGUID: 60HgkxdjTqiSz/RcjwfLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103793792"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
  by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 18:29:09 -0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	alex.williamson@redhat.com,
	jgg@nvidia.com,
	vivek.kasireddy@intel.com,
	dan.j.williams@intel.com,
	aik@amd.com
Cc: yilun.xu@intel.com,
	yilun.xu@linux.intel.com,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	yan.y.zhao@intel.com,
	daniel.vetter@ffwll.ch,
	leon@kernel.org,
	baolu.lu@linux.intel.com,
	zhenzhong.duan@intel.com,
	tao1.su@intel.com
Subject: [RFC PATCH 09/12] vfio/pci: Export vfio dma-buf specific info for importers
Date: Tue,  7 Jan 2025 22:27:16 +0800
Message-Id: <20250107142719.179636-10-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107142719.179636-1-yilun.xu@linux.intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VFIO dma-buf supports exporting host unaccessible MMIO regions for
private assignment. Export this info by attaching VFIO specific
dma-buf data in struct dma_buf::priv. Provide a helper
vfio_dma_buf_get_data() for importers to fetch these data.

The exported host unaccessible info are for importers to decide if the
dma-buf is good to use. KVM only allows host unaccessible MMIO regions
for private MMIO slot. But it is expected other importers (e.g. RDMA
driver, IOMMUFD) may also use the dma-buf machanism for P2P in native
or non-CoCo VM, in which cases host unaccessible is not required.

Also export struct kvm * handler attached to the vfio device. This
allows KVM to do another sanity check. MMIO should only be assigned to
a CoCo VM if its owner device is already assigned to the same VM.

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/dma_buf.c | 24 ++++++++++++++++++++++++
 include/linux/vfio.h       | 19 +++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/vfio/pci/dma_buf.c b/drivers/vfio/pci/dma_buf.c
index ad12cfb85099..ad984f2c22fc 100644
--- a/drivers/vfio/pci/dma_buf.c
+++ b/drivers/vfio/pci/dma_buf.c
@@ -9,6 +9,8 @@
 MODULE_IMPORT_NS("DMA_BUF");
 
 struct vfio_pci_dma_buf {
+	struct vfio_dma_buf_data export_data;
+
 	struct dma_buf *dmabuf;
 	struct vfio_pci_core_device *vdev;
 	struct list_head dmabufs_elm;
@@ -156,6 +158,14 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	priv->vdev = vdev;
 	priv->nr_ranges = get_dma_buf.nr_ranges;
 	priv->dma_ranges = dma_ranges;
+	/*
+	 * KVM expects private dma_buf. An private dma_buf must not
+	 * support dma_buf_ops.map_dma_buf/mmap/vmap(). The exporter must also
+	 * ensure no side channel access for the backend resource, e.g.
+	 * vfio_device_ops.mmap() should not be supported.
+	 */
+	priv->export_data.is_private = vdev->vdev.is_private;
+	priv->export_data.kvm = vdev->vdev.kvm;
 
 	ret = check_dma_ranges(priv, &dmabuf_size);
 	if (ret)
@@ -247,3 +257,17 @@ void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
 	}
 	up_write(&vdev->memory_lock);
 }
+
+/*
+ * Only vfio/pci implements this, so put the helper here for now.
+ */
+struct vfio_dma_buf_data *vfio_dma_buf_get_data(struct dma_buf *dmabuf)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops)
+		return ERR_PTR(-EINVAL);
+
+	return &priv->export_data;
+}
+EXPORT_SYMBOL_GPL(vfio_dma_buf_get_data);
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e99d856c6cd8..fd7669e5b276 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -9,6 +9,7 @@
 #define VFIO_H
 
 
+#include <linux/dma-buf.h>
 #include <linux/iommu.h>
 #include <linux/mm.h>
 #include <linux/workqueue.h>
@@ -370,4 +371,22 @@ int vfio_virqfd_enable(void *opaque, int (*handler)(void *, void *),
 void vfio_virqfd_disable(struct virqfd **pvirqfd);
 void vfio_virqfd_flush_thread(struct virqfd **pvirqfd);
 
+/*
+ * DMA-buf - generic
+ */
+struct vfio_dma_buf_data {
+	bool is_private;
+	struct kvm *kvm;
+};
+
+#if IS_ENABLED(CONFIG_DMA_SHARED_BUFFER) && IS_ENABLED(CONFIG_VFIO_PCI_CORE)
+struct vfio_dma_buf_data *vfio_dma_buf_get_data(struct dma_buf *dmabuf);
+#else
+static inline
+struct vfio_dma_buf_data *vfio_dma_buf_get_data(struct dma_buf *dmabuf)
+{
+	return NULL;
+}
+#endif
+
 #endif /* VFIO_H */
-- 
2.25.1

